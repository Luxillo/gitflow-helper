# gitflow-helper

**GitFlow Helper** es un asistente interactivo para la terminal diseñado para simplificar el flujo de trabajo con la metodología Git Flow. Este script actúa como una capa de inteligencia que valida el estado de tu repositorio antes de permitirte realizar operaciones críticas.

## ✨ Características principales

- **Detección de Repositorio:** Valida si te encuentras dentro de un proyecto Git.
- **Auto-Configuración:** Detecta si Git Flow está inicializado y, si no lo está, te guía en el proceso de `git flow init`.
- **Escaneo de "Suciedad":** Verifica si tienes archivos modificados o sin commit antes de sugerirte comandos de cierre o publicación.
- **Diccionario de Comandos:** Ofrece una guía visual rápida de los comandos más usados (Features, Releases, Tags).
- **Indicador de Estado:** Muestra visualmente si tu directorio de trabajo está limpio o requiere atención.

## 📋 Requisitos

1. Tener instalado [Git](https://git-scm.com).
2. Tener instalada la extensión [Git Flow (AVH Edition)](https://github.com).
3. Sistema operativo basado en Unix (Linux, macOS) o WSL en Windows.

## ⚙️ Instalación y Permisos

Para que el asistente esté disponible desde cualquier proyecto en tu terminal, sigue estos pasos:

1. **Ubicación del script:** Se recomienda guardarlo en tu carpeta personal (`HOME`) para evitar borrarlo accidentalmente entre proyectos.
   ```bash
   nano ~/git-helper.sh
   ```
   *(Pega el código del script dentro y guarda).*

2. **Otorgar permisos de ejecución:**
   Es necesario que el sistema tenga permiso para ejecutar el archivo como un programa:
   ```bash
   chmod +x ~/git-helper.sh
   ```

3. **Crear acceso rápido (Alias):**
   Para no tener que escribir la ruta completa, añade un alias en tu archivo de configuración (`.bashrc` o `.zshrc`):
   ```bash
   echo "alias ayuda-git='~/git-helper.sh'" >> ~/.bashrc
   source ~/.bashrc
   ```

## 🚀 Modo de Uso

Una vez instalado, simplemente sitúate en la carpeta de tu proyecto y ejecuta:

```bash
ayuda-git
```

### Escenarios posibles:

*   **Si el repo es nuevo:** El script te preguntará: `¿Deseas activarlo ahora? (s/n)`. Al presionar `s`, configurará las ramas estándar (`main`, `develop`, etc.).
*   **Si tienes archivos sin guardar:** El script mostrará un aviso en rojo detallando qué archivos están "sucios" y te recomendará hacer un commit antes de continuar.
*   **Si todo está en orden:** Verás el menú de ayuda con los comandos listos para copiar y pegar según necesites (iniciar feature, finalizar semana, crear versión).

## 📂 Estructura sugerida
Se recomienda que el script resida en `~/` (directorio home) y el alias se encargue de invocarlo sin importar en qué carpeta de proyecto estés trabajando.
