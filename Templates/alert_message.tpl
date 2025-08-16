Labels:
{{ range .CommonLabels.SortedPairs }}
- {{ .Name }} = {{ .Value }}
{{ end }}

{{ if .Annotations.description }}
Description: {{ .Annotations.description }}
{{ end }}