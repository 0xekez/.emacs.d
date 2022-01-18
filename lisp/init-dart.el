Container({Key? key, AlignmentGeometry? alignment, EdgeInsetsGeometry? padding, Color? color, Decoration? decoration, Decoration? foregroundDecoration, double? width, double? height, BoxConstraints? constraints, EdgeInsetsGeometry? margin, Matrix4? transform, AlignmentGeometry? transformAlignment, Widget? child, Clip clipBehavior = Clip.none})
Creates a widget that combines common painting, positioning, and sizing widgets.

The height and width values include the padding.

The color and decoration arguments cannot both be supplied, since
it would potentially result in the decoration drawing over the background
color. To supply a decoration with a color, use decoration:
BoxDecoration(color: color).
