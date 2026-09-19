#!/usr/bin/env python3
import os
import sys
from pathlib import Path


def concatenate_svgs(input_dir: Path, output_file: Path) -> None:
    """
    Concatena todos os arquivos .svg de um diretório em um único arquivo .txt
    com delimitadores claros para identificar a origem de cada svg.
    """
    svg_files = sorted(input_dir.glob("*.svg"))

    if not svg_files:
        print(f"Nenhum arquivo .svg encontrado em: {input_dir}")
        return

    with open(output_file, "w", encoding="utf-8") as out:
        for idx, file_path in enumerate(svg_files, start=1):
            file_name = file_path.name
            separator_line = "=" * 80
            
            out.write(f"{separator_line}\n")
            out.write(f"[{idx}/{len(svg_files)}] Arquivo: {file_name}\n")
            out.write(f"{separator_line}\n\n")

            content = file_path.read_text(encoding="utf-8")
            out.write(content.strip())
            out.write("\n\n")

    print(f"Sucesso: {len(svg_files)} arquivos concatenados em '{output_file}'.")


def main():
    current_dir = Path(__file__).resolve().parent
    output_txt = current_dir / "svgs_concatenados.txt"

    concatenate_svgs(input_dir=current_dir, output_file=output_txt)


if __name__ == "__main__":
    main()
