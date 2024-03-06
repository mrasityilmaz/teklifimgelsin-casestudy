part of '../offer_card_component.dart';

@immutable
final class _BankLogoAndDetailSection extends StatelessWidget {
  const _BankLogoAndDetailSection({required this.bankId, this.isSponsored = false});
  final bool isSponsored;

  final int? bankId;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: kMinInteractiveDimension,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: [
              SvgPicture.asset(
                'assets/bank_logos/b$bankId.svg',
                placeholderBuilder: SvgPicture.defaultPlaceholderBuilder,
                height: constraints.maxHeight * .9,
              ),
              const Spacer(),

              ///
              /// Reklam Text Widget
              ///
              if (isSponsored) ...[
                IntrinsicHeight(
                  child: Row(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * .65,
                        child: Center(
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Icon(CupertinoIcons.checkmark_seal, size: 15, color: context.appColors.primaryBlueAccentColor),
                                ),
                                SizedBox(
                                  width: context.lowValue * .2,
                                ),
                                Text('Reklam', style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, color: context.appColors.primaryBlueAccentColor)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        endIndent: 5,
                        indent: 5,
                        color: context.appColors.primaryGreyBorderColor.withOpacity(.65),
                        thickness: 1,
                        width: context.lowValue * 1.5,
                      ),
                    ],
                  ),
                ),
              ],

              Row(
                children: [
                  Text('Detaylar', style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400, color: context.appColors.primaryBlackTextColor, letterSpacing: .2)),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(CupertinoIcons.chevron_forward, size: 12, color: context.appColors.primaryBlackTextColor),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
