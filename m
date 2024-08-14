Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F5FC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 06:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D36C10E0BD;
	Wed, 14 Aug 2024 06:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItGpv5rP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35E310E0BD
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723618257; x=1755154257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=d45V8RvBKMcFxi1plVhhSbdEyH7Y8Otw8gFBXxYs71c=;
 b=ItGpv5rPxuSjQ3s6Ppa41qkM6wSzyJihHENYlfDKYmPDJEufAlvdIrPj
 fsY13c1ibXlDGMOgrCNlF+Ju26kAUJ3QaTvvfCZQ/NntCgFnKsj+Zds+l
 dfryK1flyDZzxP/lY6Cw9Nd7IHPnH1Z0SEO/Cta+iJrj4jyY0/wUo3cfU
 9jInJ4Xe0WEe9AmCMcxsgidh5pwiD9dT/mLFZvGQ7ei+8T3OVMIE4T9lB
 P+jYVlx2JKdGFADai7cBu285uoq6JaBv0jOLWl0xeNA1F4pmEeg8pauU0
 jx/U3Q3fuvdE9S+1IAdBrPRxi9vEH5vwmPOgT6T0TveuF+HdHGbeR7u2a g==;
X-CSE-ConnectionGUID: F5xOCE1BQwOGP0+9QXP4JQ==
X-CSE-MsgGUID: fK9y32LDQnW33XTtoSOGzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25578193"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="25578193"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 23:50:57 -0700
X-CSE-ConnectionGUID: /NnFkIcVQzKBXmBBFuGFsg==
X-CSE-MsgGUID: chYRC3G/QPm/JZjhzvgPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="58853819"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.48])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 23:50:55 -0700
Date: Wed, 14 Aug 2024 08:50:51 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] tests/intel/kms_ccs: Add testing for Xe2 ccs
 modifiers
Message-ID: <20240814065051.3jhxhwegpgcldth4@zkempczy-mobl2>
References: <20240812201124.2013652-1-juhapekka.heikkila@gmail.com>
 <20240812201124.2013652-4-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240812201124.2013652-4-juhapekka.heikkila@gmail.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Aug 12, 2024 at 11:11:24PM +0300, Juha-Pekka Heikkila wrote:
> Earlier with Xe2 I915_FORMAT_MOD_4 was used as ccs modifier.
> Now regular tile4 is not using compression and in test will be
> used I915_FORMAT_MOD_4_TILED_BMG_CCS or
> I915_FORMAT_MOD_4_TILED_LNL_CCS instead.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/intel/kms_ccs.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 6b66a06db..b1a9da8da 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -100,7 +100,8 @@
>   *
>   * arg[2]:
>   *
> - * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
> + * @4-tiled-bmg-ccs:           4 tiled xe2 pat controlled ccs
> + * @4-tiled-lnl-ccs:           4 tiled xe2 pat controlled ccs
>   * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
>   * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
>   * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
> @@ -126,7 +127,8 @@
>   *
>   * arg[2]:
>   *
> - * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
> + * @4-tiled-bmg-ccs:           4 tiled xe2 pat controlled ccs
> + * @4-tiled-lnl-ccs:           4 tiled xe2 pat controlled ccs
>   * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
>   * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
>   * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
> @@ -219,7 +221,8 @@ static const struct {
>  	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4-tiled-mtl-rc-ccs"},
>  	{I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4-tiled-mtl-mc-ccs"},
>  	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, "4-tiled-mtl-rc-ccs-cc"},
> -	{I915_FORMAT_MOD_4_TILED, "4-tiled-xe2-ccs"},
> +	{I915_FORMAT_MOD_4_TILED_BMG_CCS, "4-tiled-bmg-ccs"},
> +	{I915_FORMAT_MOD_4_TILED_LNL_CCS, "4-tiled-lnl-ccs"},
>  };
>  
>  static bool check_ccs_planes;
> @@ -758,13 +761,9 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>  		if (do_fast_clear && (fb_flags & FB_COMPRESSED)) {
>  			fast_clear_fb(data->drm_fd, fb, cc_color);
>  		} else {
> -			if (modifier == I915_FORMAT_MOD_4_TILED) {
> +			if (modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
> +			    modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
>  				struct igt_fb temp_fb;
> -				/* tile4 is used as ccs modifier
> -				 * on Xe2 where compression is handled
> -				 * through PAT indexes.
> -				 */
> -
>  				// non compressed temporary pattern image
>  				if (do_solid_fill)
>  					igt_create_color_fb(data->drm_fd, width, height,
> @@ -969,14 +968,16 @@ static void test_output(data_t *data, const int testnum)
>  		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC) &&
>  		    tests[testnum].flags & TEST_BAD_CCS_PLANE) ||
>  		    (tests[testnum].flags & TEST_FAIL_ON_ADDFB2 &&
> -		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED))
> +		    (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
> +		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS)))
>  			continue;
>  
>  		data->ccs_modifier = ccs_modifiers[i].modifier;
>  
>  		igt_describe(tests[testnum].description);
>  		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
> -			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED) {
> +			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
> +			    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
>  				igt_require_f(AT_LEAST_GEN(dev_id, 20),
>  					      "Xe2 platform needed.\n");
>  			} else {
> -- 
> 2.45.2
> 
