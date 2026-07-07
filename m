Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD3FC43602
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 11:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469FA10E2DC;
	Tue,  7 Jul 2026 11:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ls7uWeqg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8931C8902A
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783422365; x=1814958365;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qHVhKBP2yBZirA3vi6sOEdg+zUw/+rVJMO5yRhb9fMs=;
 b=Ls7uWeqg/c2bD8E4cX5S5OG+cYvVf9lkpVTmvy+229BnPbzhl2h5nQe9
 RQUcDY0IYeOANf/hQfSWtk1+lrrYBVQoE8M+coI2mNAYug4weBbryiY0h
 4BprD4dw/YVpZKATh7z+zh+JB0jlJbYmpIpBaLWozUtMAJ96tb9J3+Bwf
 04JaqaUs8nJYBGzZw0Y7GjD29VctvJriLPTZC35fMxAXlqrMgeloQmw4z
 +YNTDF/gwTKMe3SPSEZ4fvx5f1ln0vTucQ2vGr6dvciqBE4e2+2Q0OSXF
 Xf8erf33ebr4qcQ3yQ22qFN4CEPD1MN4EdZwXcTnyQZUhSeNQNwFuZxXt A==;
X-CSE-ConnectionGUID: lZdeLMjoSJWJc3saQ9NSng==
X-CSE-MsgGUID: mGHojr9VT+Ca5TaXJCp/9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84089058"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84089058"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 04:06:05 -0700
X-CSE-ConnectionGUID: DApCaGYtRk+bKaa31/ri/g==
X-CSE-MsgGUID: uZwvwCT0TTiPN81HVGLNJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="257849013"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 04:06:03 -0700
Date: Tue, 7 Jul 2026 13:06:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pranay Samala <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 sameer.lattannavar@intel.com
Subject: Re: [PATCH i-g-t v2] tests/intel-ci/chamelium-only.testlist: Include
 additional chamelium tests
Message-ID: <20260707110600.ixkrfsti4xkgdtz7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pranay Samala <pranay.samala@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 sameer.lattannavar@intel.com
References: <20260707041956.39997-1-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707041956.39997-1-pranay.samala@intel.com>
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

Hi Pranay,
On 2026-07-07 at 09:49:56 +0530, Pranay Samala wrote:

please make subject a little shorter, imho better

[PATCH i-g-t v2] intel-ci/chamelium-only.testlist: Add chamelium tests

Also imho split this into two changes, one for blocklists
and one for testlist.



Regards,
Kamil

> Extend chamelium-only testlist with audio-after-suspend tests for
> DP/HDMI and kms_chamelium_color_pipeline tests.
> Blocklist plane-lut3d-green-only on platforms with display version <= 35.
> 
> v2:
> - Update commit message (Kathik)
> - Add NVL specific test in other blocklists (Swati)
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel-ci/chamelium-only.testlist      | 11 +++++++++++
>  tests/intel-ci/xe.bmg.display.blocklist.txt |  4 ++++
>  tests/intel-ci/xe.lnl.display.blocklist.txt |  4 ++++
>  tests/intel-ci/xe.ptl.display.blocklist.txt |  4 ++++
>  4 files changed, 23 insertions(+)
> 
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index d627ad414..8d634b6cc 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -2,6 +2,7 @@
>  # To blocklist tests, use the appropriate xe/i915 blocklist files instead
>  igt@kms_feature_discovery@chamelium
>  igt@kms_chamelium_audio@dp-audio
> +igt@kms_chamelium_audio@dp-audio-after-suspend
>  igt@kms_chamelium_audio@dp-audio-edid
>  igt@kms_chamelium_color@ctm-0-25
>  igt@kms_chamelium_color@ctm-0-50
> @@ -14,6 +15,15 @@ igt@kms_chamelium_color@ctm-negative
>  igt@kms_chamelium_color@ctm-red-to-blue
>  igt@kms_chamelium_color@degamma
>  igt@kms_chamelium_color@gamma
> +igt@kms_chamelium_color_pipeline@plane-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
>  igt@kms_chamelium_edid@dp-edid-read
>  igt@kms_chamelium_edid@dp-edid-resolution-list
>  igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
> @@ -53,6 +63,7 @@ igt@kms_chamelium_hpd@hdmi-hpd-storm
>  igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
>  igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
>  igt@kms_chamelium_audio@hdmi-audio
> +igt@kms_chamelium_audio@hdmi-audio-after-suspend
>  igt@kms_chamelium_audio@hdmi-audio-edid
>  igt@kms_chamelium_hpd@vga-hpd
>  igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 4c2a7390a..18712fb86 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -181,3 +181,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>  igt@kms_pm_dc@dc3co-.*
>  igt@kms_vrr@lobf-dc3co
>  ########################################
> +# Valid skip :- For display ver <= 35
> +########################################
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> +########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 1dbb24ae3..5d008ce8d 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -191,3 +191,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>  igt@kms_pm_dc@dc3co-.*
>  igt@kms_vrr@lobf-dc3co
>  ########################################
> ++# Valid skip :- For display ver <= 35
> ++########################################
> ++igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> ++########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index 1041931a1..846527f02 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -182,3 +182,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>  igt@kms_pm_dc@dc3co-.*
>  igt@kms_vrr@lobf-dc3co
>  ########################################
> ++# Valid skip :- For display ver <= 35
> ++########################################
> ++igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> ++########################################
> -- 
> 2.53.0
> 
