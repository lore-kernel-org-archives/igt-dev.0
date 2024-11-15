Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85892D6DDE1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 13:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD0910E864;
	Fri, 15 Nov 2024 13:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exrd+fRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF3910E864
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731677468; x=1763213468;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cO5LSPwNMcDXf17MAAIcT05AWgrEy/NjFfNhA0AJ5Ms=;
 b=exrd+fRyrp3VOQp31U4rDJrqoYfybLQQYpLe2PL9Txm/nwIGjn7B9Xfp
 gaUq6mQ7r91TFkNYZLXNFbSBJiJxsGHKCTKHPbMYKDT1BDmjFkKMFkduC
 6AkqqqCZZn0WdEBmyYnlFK14wMtmYn2Wx/I7KYZ8kpUC2o1IsjkUIArTl
 cmEg+rH8pBWrcm4qrtHIEom8CSxeNgUsl2opVwdQ543wNSOdCyPOa06CW
 NWPzVdGX9kRm9PA7nQJI/TZba290k3FZXA1iMFS5dnVgycOiQj1JG0cHn
 5BjqBcFrDu+UaUprvl5jh991iWoHNrK/imVkHqf+NZ1mPA25TH5qkP0zn A==;
X-CSE-ConnectionGUID: 9KDByhxeT+iZnWEEkmVPbg==
X-CSE-MsgGUID: gpCz4TR+TKuc8tR6U64IJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31523648"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31523648"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 05:31:08 -0800
X-CSE-ConnectionGUID: yPFzem6YQ7GWLik/7movEg==
X-CSE-MsgGUID: KQU+R2VAQISahn7Wr2TJ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88976734"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 05:31:07 -0800
Date: Fri, 15 Nov 2024 14:31:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Clint Taylor <clinton.a.taylor@intel.com>
Subject: Re: [PATCH i-g-t v3 5/9] XE3: tests/kms_addfb_basic: fix x-tiled
 tests for case when there is no x-tile
Message-ID: <20241115133105.o7772oanzhwk2kil@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Clint Taylor <clinton.a.taylor@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
 <20241114190339.3885752-6-clinton.a.taylor@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241114190339.3885752-6-clinton.a.taylor@intel.com>
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

Hi Clint,
On 2024-11-14 at 11:03:35 -0800, Clint Taylor wrote:
> From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>

Please use correct names here, it should be:

> From: "Juha-pekka Heikkila" <juha-pekka.heikkila@intel.com>

> 
> On Xe3 display no more support x-tile and will disable such framebuffers
> 
> Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>

and here:

Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>

Please do the same corrections in other patches in this series.

Regards,
Kamil

> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> ---
>  tests/kms_addfb_basic.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index b22818592..3ba87117b 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -217,6 +217,12 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
>  	return err;
>  }
>  
> +static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
> +{
> +	return igt_display_has_format_mod(disp, f->pixel_format,
> +					  f->modifier[0]) ? 0 : -1;
> +}
> +
>  static void invalid_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -735,8 +741,10 @@ static void addfb25_tests(int fd)
>  		igt_describe("Check if addfb2 call works for x-tiling");
>  		igt_subtest("addfb25-x-tiled-legacy") {
>  			f.modifier[0] = I915_FORMAT_MOD_X_TILED;
> -			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> -			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
> +			igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
> +				      addfb_expected_ret(&display, &f));
> +			if (!addfb_expected_ret(&display, &f))
> +				do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  			f.fb_id = 0;
>  		}
>  
> @@ -756,12 +764,6 @@ static void addfb25_tests(int fd)
>  		gem_close(fd, gem_bo);
>  }
>  
> -static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
> -{
> -	return igt_display_has_format_mod(disp, f->pixel_format,
> -					  f->modifier[0]) ? 0 : -1;
> -}
> -
>  static void addfb25_ytile(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -1012,8 +1014,6 @@ igt_main
>  
>  	master_tests(fd);
>  
> -	addfb25_tests(fd);
> -
>  	tiling_tests(fd);
>  
>  	igt_subtest_group {
> @@ -1025,6 +1025,8 @@ igt_main
>  		igt_fixture
>  			igt_require_intel(fd);
>  
> +		addfb25_tests(fd);
> +
>  		addfb25_ytile(fd);
>  
>  		addfb25_4tile(fd);
> -- 
> 2.25.1
> 
