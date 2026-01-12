Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFE5D25059
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 09:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3180110E080;
	Mon, 12 Jan 2026 09:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSu/A6te";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43A210E080
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768208894; x=1799744894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JaL6bcI1evPqBFt1+VKncYHfQXRLra+FgOWWCrtoyWc=;
 b=BSu/A6tefQPvst4JpeIvHAiveO/SjuU1RvAeT5RUN/K/dlyHHC4V2Tr6
 kY0KaqqNnqvG8BxnS2tnLq8RoXQmi8264glzvxcnOl1qfMyVmKv+ZMXBK
 3FpVxL3aif7yRm8pWpf7t6XKQWsSo9r3xwKkTB7juQ7jZhbYiEHyH3DTP
 6hDr2qQvPvfkb6i56fBljeIHOX9Z5xWPyPDsrlHcr7A0/tL/naUidjlBJ
 K9w4Xb58ETzBqhQSgHDu76Eyye0rFYCcf058BoK/izR4xabiJ7ZmPKvPa
 42E3fmLQNlQinXiaq6U1Zit78mGQwi2KT1Jlflbsw0NA7beSBXUV+gOPP Q==;
X-CSE-ConnectionGUID: D9f84BdCROGgouR92Lnpog==
X-CSE-MsgGUID: zi3qIKwOTO2URbe8UHNgbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69530507"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69530507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 01:08:14 -0800
X-CSE-ConnectionGUID: jgmibKR7R6uQ300oTpq50Q==
X-CSE-MsgGUID: +cDasuXXT4CeDJJ5poINfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="241575861"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 01:08:12 -0800
Date: Mon, 12 Jan 2026 10:08:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t] intel-ci: Add 3D lut tests to display blocklist
Message-ID: <20260112090809.qnuicvbzpahlk4j3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 swati2.sharma@intel.com
References: <20260112082134.151464-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260112082134.151464-1-karthik.b.s@intel.com>
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

Hi Karthik,
On 2026-01-12 at 13:51:34 +0530, Karthik B S wrote:
> kms_color_pipeline@plane-lut3d-green-only is valid for NVL+ only.
> Blocklist this on older platforms.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/i915.blocklist.txt           | 4 ++++
>  tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
>  tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
>  tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
>  4 files changed, 16 insertions(+)
> 
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index dffe464dc..8b47d10cd 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -198,3 +198,7 @@ igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
>  igt@kms_writeback@writeback.*
>  igt@kms_colorop@.*
>  ##################################################################
> +# Valid skip : 3D LUT is supported NVL+
> +##################################################################
> +igt@kms_color_pipeline@plane-lut3d-green-only
> +##################################################################
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 361da761e..919be620d 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -169,3 +169,7 @@ igt@kms_big_fb@linear-max-hw-stride.*hflip
>  #########################################
>  igt@kms_pm_dc@dc5-retention-flops
>  #########################################
> +# Valid skip : 3D LUT is supported NVL+
> +########################################
> +igt@kms_color_pipeline@plane-lut3d-green-only
> +########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 4151582f6..6cc61b98f 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -179,3 +179,7 @@ igt@kms_frontbuffer_tracking@.*drrs.*
>  ########################################
>  igt@kms_pm_rpm@package-g7
>  ########################################
> +# Valid skip : 3D LUT is supported NVL+
> +########################################
> +igt@kms_color_pipeline@plane-lut3d-green-only
> +########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index ba784140e..a29c515b9 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -177,3 +177,7 @@ igt@kms_frontbuffer_tracking@.*drrs.*
>  #########################################
>  igt@kms_pm_rpm@package-g7
>  #########################################
> +# Valid skip : 3D LUT is supported NVL+
> +########################################
> +igt@kms_color_pipeline@plane-lut3d-green-only
> +########################################
> -- 
> 2.43.0
> 
