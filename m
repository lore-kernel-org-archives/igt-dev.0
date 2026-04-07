Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253FCFEEF24
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 11:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB8510E360;
	Tue,  7 Apr 2026 11:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABXyZjUd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FBC10E036
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775560870; x=1807096870;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=af/44Vqx1qgRHhUeMosuDqc72LgZDo3w4im7776YC2U=;
 b=ABXyZjUdgOZdZ4viSbAj8j0YtiSbV3d32KGixp9KGDOCSyM/urH0I104
 HQ5w0r1ONUbXfg6h0tteTl5GN5hYTUThyWcpdUqff7tomZPt21FiCn8m3
 Xad1pWs3GUi8VyvsEdvx73OpOraTZ3RUHNmHfGXxYs1Upa+8167UKI1F9
 idpQLEz1zzQTTu6bXTmBJWMGBaXTkdBQVOIkh2pn3qzEBxkZf42P6vUFn
 +7cBYXvW32dVjTq/ahNczX8tnmI1z7ci8CF9ixfYIta7ya+Gzo8HlLbgA
 zRzhHtUouTMsI0KQ4T+Y/WITj87zZHTahJp+9/lFnUFEsPdmFslWyXyXW Q==;
X-CSE-ConnectionGUID: JXCqpRQsS3muvaAFt7LrzA==
X-CSE-MsgGUID: M6JvN53mRuSzWOTm7fbTjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80409725"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="80409725"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 04:21:10 -0700
X-CSE-ConnectionGUID: NfiauMeBTve21CvYx09d2w==
X-CSE-MsgGUID: CWoi9W6fSPOg1BQPhB7eWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="229815125"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 04:21:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, ville.syrjala@intel.com
Subject: Re: [PATCH i-g-t v2 8/8] tests/intel/kms_fbcon_fbt: use a common
 source for checking fbc tests skips
In-Reply-To: <20260407095843.43679-9-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407095843.43679-1-vinod.govindapillai@intel.com>
 <20260407095843.43679-9-vinod.govindapillai@intel.com>
Date: Tue, 07 Apr 2026 14:21:03 +0300
Message-ID: <e757a6542a77d91f161eaf49586bf25eb012c9c0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 07 Apr 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> There could be few reasons where fbc cannot be enabled and the tests
> could be skipped. There is a common array declarred in intel_fbc.h
> which act as source of fbc skip reasons for kms_frontbuffer_tracking
> tests. Use that array for kms_fbcon_fbt tests as well and also update
> the array with reasons from this tests also. All those reasons are
> valid and declared by the driver as a reason for not enabling FBC in
> a pipe.
>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  lib/i915/intel_fbc.h        |  7 +++++++
>  tests/intel/kms_fbcon_fbt.c | 16 ++--------------
>  2 files changed, 9 insertions(+), 14 deletions(-)
>
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index 3dd15de31..2b6f21bc4 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -14,10 +14,17 @@ enum psr_mode;
>  
>  const char *const no_fbc_reasons[] = {
>  	"FBC disabled: not enough stolen memory",
> +	"FBC disabled: pixel format not supported",
> +	"FBC disabled: tiling not supported",
> +	"FBC disabled: rotation not supported",
>  	"FBC disabled: stride not supported",
> +	"FBC disabled: per-pixel alpha not supported",
>  	"FBC disabled: plane size too big",
>  	"FBC disabled: surface size too big",
>  	"FBC disabled: PSR1 enabled (Wa_14016291713)"
> +	"FBC disabled: plane start Y offset misaligned",
> +	"FBC disabled: plane end Y offset misaligned",
> +	"FBC disabled: pixel rate too high"
>  };
>  
>  void intel_fbc_enable(igt_display_t *display);
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index 78c6cc4b2..95a4f66b7 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -296,18 +296,6 @@ static inline void psr_debugfs_enable(int device, int debugfs_fd)
>  
>  static void fbc_skips_on_fbcon(int debugfs_fd)
>  {
> -	const char *reasons[] = {
> -		"pixel format not supported",
> -		"tiling not supported",
> -		"rotation not supported",
> -		"stride not supported",
> -		"per-pixel alpha not supported",
> -		"plane size too big",
> -		"surface size too big",
> -		"plane start Y offset misaligned",
> -		"plane end Y offset misaligned",
> -		"pixel rate too high"
> -	};
>  	bool skip = false;
>  	char buf[FBC_STATUS_BUF_LEN];
>  	int i;
> @@ -316,8 +304,8 @@ static void fbc_skips_on_fbcon(int debugfs_fd)
>  	if (strstr(buf, "FBC enabled\n"))
>  		return;
>  
> -	for (i = 0; skip == false && i < ARRAY_SIZE(reasons); i++)
> -		skip = strstr(buf, reasons[i]);
> +	for (i = 0; !skip && i < ARRAY_SIZE(no_fbc_reasons); i++)
> +		skip = strstr(buf, no_fbc_reasons[i]);

IMO this kind of loop should be in intel_fbc.c.

>  
>  	igt_skip_on_f(skip, "fbcon modeset is not compatible with FBC\n");
>  }

-- 
Jani Nikula, Intel
