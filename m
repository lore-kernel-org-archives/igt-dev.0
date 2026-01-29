Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1F3D6101C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 14:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B96910E876;
	Thu, 29 Jan 2026 14:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4YyJOIG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8C110E876
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769697290; x=1801233290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=im/fze0RaWUt/I432bZgrp9a+e5U/npXgSJLFqlwOu4=;
 b=R4YyJOIGOZmUaWya0Tbg54iRKQRtQBMbqxVSpryTvOEhbNB0BKF23joz
 HJge4NNst1I6L+UWnDjSvWmgqCLrKfrWbBghGqVSaGNHA7IuXvI6oXb0s
 FEUuuFo+b99g6aW5BayOTz1CAJPAys5au5pRkkz02Z8hFPD3xRORbu30n
 RGDdXQWpMzqPCXi3cteO8+eC8ZsZxiybBJuny2dS+obgJ53j8ULiEkfsO
 YBznhYx2DuIz0QjsuBGgH3uW+xDBNh4jXPND98CE0wktqJQdhEXKtqGfJ
 L2LzBPkJnswbCmxxHciGGrg7mTlcY0qGT3Fik0y/7khbtvkg5+bCn6zcQ w==;
X-CSE-ConnectionGUID: 4AH54+V3S/GWy6R1N0n7Rw==
X-CSE-MsgGUID: Xh+/8vCdTn62NXff7FdKkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88511290"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="88511290"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 06:34:50 -0800
X-CSE-ConnectionGUID: 1zEW9NQOSsynXsDUOzw5UQ==
X-CSE-MsgGUID: sUT7+1/fSnKArj4Ja0WteQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208598781"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 06:34:48 -0800
Date: Thu, 29 Jan 2026 15:34:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 swati2.sharma@intel.com, juha-pekka.heikkila@intel.com,
 ramanaidu.naladala@intel.com
Subject: Re: [PATCH i-g-t] tests/kms_flip_scaled_crc: Move require checks at
 the beginning of the subtest
Message-ID: <20260129143445.uxolu7ayg2ygl7h2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Jeevan B <jeevan.b@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 juha-pekka.heikkila@intel.com, ramanaidu.naladala@intel.com
References: <20260121052158.491159-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260121052158.491159-1-karthik.b.s@intel.com>
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
On 2026-01-21 at 10:51:58 +0530, Karthik B S wrote:

add 'intel/' after 'test/' in subject:

[PATCH i-g-t] tests/intel/kms_flip_scaled_crc: Move require checks at the beginning of the subtest

> Previously, setup_fb() contained the igt_require() for format + modifier,
> causing the dynamic test to be intialized only to skip eventually if the

s/intialized/initialized/

> combination is unsupported.
> This patch moves format/modifier checks to the per-subtest level.
> 
> Additionally, linear framebuffers combined with REFLECT_X rotation are
> not supported on Intel platforms prior to gen35. To make this explicit and
> reduce CI run time, the test now performs an early skip for this
> combination, clearly stating the reason in the skip message.

+cc Jeevan B <jeevan.b@intel.com>

> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel/kms_flip_scaled_crc.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
> index 954b46b5f..91e5793f4 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -670,9 +670,6 @@ const struct {
>  static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
>  		     uint32_t height, uint64_t format, uint64_t modifier)
>  {
> -	igt_require(igt_display_has_format_mod(&data->display, format,
> -					       modifier));
> -
>  	igt_create_color_fb(data->drm_fd, width, height,
>  			    format, modifier, 0, 1, 0, newfb);
>  }
> @@ -901,6 +898,18 @@ int igt_main()
>  	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
>  		igt_describe(flip_scenario_test[index].describe);
>  		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
> +			igt_require(igt_display_has_format_mod(&data.display,
> +							       flip_scenario_test[index].firstformat,
> +							       flip_scenario_test[index].firstmodifier));
> +			igt_require(igt_display_has_format_mod(&data.display,
> +							       flip_scenario_test[index].secondformat,
> +							       flip_scenario_test[index].secondmodifier));
> +
> +			if(flip_scenario_test[index].secondmodifier == DRM_FORMAT_MOD_LINEAR &&

Add space after 'if':
			if (flip_scenario_test[index].secondmodifier == DRM_FORMAT_MOD_LINEAR &&

> +			   flip_scenario_test[index].secondrotation & IGT_REFLECT_X)
> +				igt_require_f(data.gen >= 35,
> +					      "Linear fb with REFLECT_X unsupported");

Add newline at end of message:
"Linear fb with REFLECT_X unsupported\n");

Without it in report there is:

Linear fb with REFLECT_X unsupportedSubtest flip-P016-linear-to-P016-linear-reflect-x: SKIP (0.000s)

Regards,
Kamil

> +
>  			free_fbs(&data);
>  			for_each_pipe(&data.display, pipe) {
>  				bool found = false;
> -- 
> 2.43.0
> 
