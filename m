Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F2FC2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 13:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE77810E210;
	Fri, 28 Jun 2024 13:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FU6XzaOf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303E910E036
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 13:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719580688; x=1751116688;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=H9dATlFevDSRfVMjXroriQ4WC8ficrGNQEWRUc3+otw=;
 b=FU6XzaOfli7Ht+mL3BhbaOWKwmY5xhc+MLwqn/brTjVYDfTbPC6zJO3o
 tHQtwPkk2tPbGwGp/hCZWbcUMsADAlSKZ5v3WMCqrU1m4zlA7ejRRhc/N
 8rF1uuD2jWGWyYNO5rtPn3A3d7VlNoJICVa1O6BF3e8c/BZNxjAZ8Aiev
 pKS+nyC0jm5YfWDAaz386eeQLz+ll/ZlxI4TE+e61PokuwXfNBJ/hzRIX
 68eLC17Wu9bTDrVSq/xP76JDKsJ/XR75F0zgXAGytv2iRqQiG23ULIf8w
 Qo93Gf88RhaTdV8rOuQtqV+cbWKb4mNc9H6xNNZlEGIHA/AI2D8HgoFAS Q==;
X-CSE-ConnectionGUID: I294mrh+SOK7fGdpRbNg+Q==
X-CSE-MsgGUID: MSyciGp7S5CIEdbXNVUWrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27383755"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="27383755"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 06:18:08 -0700
X-CSE-ConnectionGUID: 1OmO6mwjROu8kGbWjlZZQQ==
X-CSE-MsgGUID: yzl6CehsQgGMp596+5DqoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="45385348"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.84.149])
 ([10.245.84.149])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 06:18:06 -0700
Message-ID: <4616401c-e21a-4b91-a09a-cca7be6d8266@linux.intel.com>
Date: Fri, 28 Jun 2024 15:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGxpYi9pZ3Rfc3Jp?=
 =?UTF-8?Q?ov=5Fdevice=3A_Replace_libpciaccess_with_direct_sysfs_interaction?=
To: igt-dev@lists.freedesktop.org
References: <20240627145118.719988-1-marcin.bernatowicz@linux.intel.com>
 <171957851240.185636.10000172116320167847@a6498e030952>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <171957851240.185636.10000172116320167847@a6498e030952>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/28/2024 2:41 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/igt_sriov_device: Replace libpciaccess with direct sysfs 
> interaction
> *URL:*	https://patchwork.freedesktop.org/series/135476/ 
> <https://patchwork.freedesktop.org/series/135476/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7907 -> IGTPW_11327
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11327 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11327, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/index.html
> 
> 
>     Participating hosts (35 -> 40)
> 
> Additional (7): bat-adlp-9 bat-adlp-6 fi-elk-e7500 bat-jsl-3 bat-dg2-14 
> bat-dg2-13 bat-dg2-11
> Missing (2): fi-snb-2520m fi-kbl-8809g
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_11327:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-read:
> 
>       o bat-dg2-13: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html>
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
> 
>       o bat-dg2-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7907/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html>

Not related to the change.

Regards,
Marcin
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_11327 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@debugfs_test@basic-hwmon:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-9/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-6/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-jsl-3/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-jsl-3/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-jsl-3/igt@gem_lmem_swapping@basic.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-9/igt@gem_lmem_swapping@basic.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@random-engines:
> 
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_mmap@basic:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>   *
> 
>     igt@gem_render_tiled_blits@basic:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@gem_render_tiled_blits@basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +1 other test skip
>   *
> 
>     igt@gem_tiled_fence_blits@basic:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +2 other tests skip
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +2 other tests skip
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-6/igt@gem_tiled_pread_basic.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-9/igt@gem_tiled_pread_basic.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@gem_tiled_pread_basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +1 other test skip
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-9/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-6/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>) +7 other tests skip
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>) +7 other tests skip
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>) +1 other test skip
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>) +1 other test skip
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>) +1 other test skip
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-6/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-jsl-3/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9886 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886>)
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-9/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html>
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html>
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html>
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html>
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o bat-arls-2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7907/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html> (i915#7507 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507>)
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:
> 
>       o bat-dg2-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7907/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html> (i915#11379 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11379>)
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html> (i915#9812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>   *
> 
>     igt@kms_pm_rpm@basic-pci-d3-state:
> 
>       o fi-elk-e7500: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html> +24 other tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-plane-onoff:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +3 other tests skip
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +3 other tests skip
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +3 other tests skip
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-jsl-3/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@prime_vgem@basic-fence-flip:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@basic-fence-mmap:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +1 other test skip
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +1 other test skip
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-9/igt@prime_vgem@basic-fence-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +2 other tests skip
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-adlp-6/igt@prime_vgem@basic-fence-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +2 other tests skip
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-11/igt@prime_vgem@basic-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +2 other tests skip
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/bat-dg2-14/igt@prime_vgem@basic-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +2 other tests skip
> 
> 
>         Warnings
> 
>   * igt@i915_module_load@reload:
>       o fi-kbl-7567u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7907/fi-kbl-7567u/igt@i915_module_load@reload.html> (i915#10062 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10062> / i915#180 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180> / i915#9925 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11327/fi-kbl-7567u/igt@i915_module_load@reload.html> (i915#10062 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10062> / i915#180 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180> / i915#1982 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982> / i915#9925 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7907 -> IGTPW_11327
> 
> CI-20190529: 20190529
> CI_DRM_15013: 0318a12ff6fb8c321458aa2b373e9322896ee951 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11327: 2a279f402d2cb5f5d7d914c065d9769536dc688b @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
