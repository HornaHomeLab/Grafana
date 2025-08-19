Labels:
{{ range .CommonLabels.SortedPairs }}
- {{ .Name }} = {{ .Value }}
{{ end }}

Annotations:
{{ range .Annotations.SortedPairs }}
- {{ .Name }} = {{ .Value }}
{{ end }}