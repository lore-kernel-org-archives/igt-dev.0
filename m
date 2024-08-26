Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6984C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 12:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC6010E1F5;
	Mon, 26 Aug 2024 12:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lb72w057";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9CF10E009;
 Mon, 26 Aug 2024 12:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724675634; x=1756211634;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=kbxKiM7Tw6Od+Q5vkFQN1Ra7aZCwwoilP2NyGXKE6R8=;
 b=Lb72w057BOnMJKG0uHDGfDL1oUTsoaQT05Hm2RI3TGbBfHbn6fj7exeh
 aH6H7YlLBXb/EtDI8fU1iAh9vwSWF4PPoH4MrlHBGXciyW/FOqvjPPWy2
 vzW7z3kPHv9UgtQpxWehDSIOypYjtkpYkFmfLxMEHWgy4nTj96140dUrw
 PYCvp1DwiCPnFI9FlxQ1OOasXts8MEbe+ytd1jLL60C9spRK0ayI6s9Dp
 OFpP7yJQPczPE2FKP+v5qJ1C/6wte9lkTaf+W2EUYzhSgqjU96VGAoI4v
 qyGiokQUshbUir4WCE7JbA+oZKOC4pc/ZfQFD003G77utXwXrJNRnJk4S Q==;
X-CSE-ConnectionGUID: 5o0VBURbRt+awC9S7u0rDw==
X-CSE-MsgGUID: hsJb1MX4QYKW4UXkSswp5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22683558"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208,217";a="22683558"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 05:33:53 -0700
X-CSE-ConnectionGUID: Eg8VEzPVTxWTdimfSBGyJQ==
X-CSE-MsgGUID: vvgwiFscRJSHFQLzNVpYNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208,217";a="62552367"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.18.111])
 ([10.246.18.111])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 05:33:51 -0700
Content-Type: multipart/alternative;
 boundary="------------62uKS5uwHXwfws2cqp0kA8St"
Message-ID: <a6cebb10-0f7a-41d3-b77b-1813e3cb760e@intel.com>
Date: Mon, 26 Aug 2024 14:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fvm=3A_initialize_bind=5Fops=2Eextensions_field?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240823110221.68234-1-andrzej.hajda@intel.com>
 <172441811779.746160.11397750698975596731@2413ebb6fbb6>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172441811779.746160.11397750698975596731@2413ebb6fbb6>
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

This is a multi-part message in MIME format.
--------------62uKS5uwHXwfws2cqp0kA8St
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23.08.2024 15:01, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_vm: initialize bind_ops.extensions field
> *URL:* 	https://patchwork.freedesktop.org/series/137703/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/index.html
>
>
>   CI Bug Log - changes from IGT_7988 -> IGTPW_11623
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_11623 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11623, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/index.html
>
>
>     Participating hosts (36 -> 40)
>
> Additional (6): fi-kbl-7567u fi-glk-j4005 fi-kbl-8809g bat-dg2-11 
> bat-mtlp-8 bat-mtlp-6
> Missing (2): fi-snb-2520m fi-elk-e7500
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_11623:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_selftest@live@coherency:
>       o bat-arls-5: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7988/bat-arls-5/igt@i915_selftest@live@coherency.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-arls-5/igt@i915_selftest@live@coherency.html>
>

Not related at all.

Regards
Andrzej


>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_11623 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@debugfs_test@basic-hwmon:
>
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html>
>         (i915#9318
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html>
>         (i915#9318
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>  *
>
>     igt@fbdev@info:
>
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@fbdev@info.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#2582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582>)
>  *
>
>     igt@fbdev@write:
>
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@fbdev@write.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582>)
>         +3 other tests skip
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>       o fi-kbl-7567u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>       o fi-glk-j4005: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>  *
>
>     igt@gem_lmem_swapping@basic:
>
>       o fi-glk-j4005: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-glk-j4005/igt@gem_lmem_swapping@basic.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>       o fi-kbl-7567u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>  *
>
>     igt@gem_lmem_swapping@verify-random:
>
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>  *
>
>     igt@gem_mmap@basic:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@gem_mmap@basic.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@gem_mmap@basic.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@gem_mmap@basic.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>  *
>
>     igt@gem_mmap_gtt@basic:
>
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@gem_mmap_gtt@basic.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +2 other tests skip
>  *
>
>     igt@gem_render_tiled_blits@basic:
>
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>         +1 other test skip
>  *
>
>     igt@gem_tiled_blits@basic:
>
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@gem_tiled_blits@basic.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +2 other tests skip
>  *
>
>     igt@gem_tiled_fence_blits@basic:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +2 other tests skip
>  *
>
>     igt@gem_tiled_pread_basic:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@gem_tiled_pread_basic.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>         +1 other test skip
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@gem_tiled_pread_basic.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>         +1 other test skip
>  *
>
>     igt@i915_pm_rps@basic-api:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@i915_pm_rps@basic-api.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>
>         / i915#6621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@i915_pm_rps@basic-api.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>
>         / i915#6621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@i915_pm_rps@basic-api.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>
>         / i915#6621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>  *
>
>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>
>         / i915#9792
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>)
>         +8 other tests skip
>  *
>
>     igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>         +7 other tests skip
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>         / i915#9792
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>)
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
>
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>         +8 other tests skip
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html>
>         (i915#4215
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o fi-glk-j4005: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         +10 other tests skip
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>
>         / i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
>
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html>
>         (i915#9792
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>)
>         +17 other tests skip
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>         / i915#9159
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159>)
>  *
>
>     igt@kms_flip@basic-flip-vs-dpms:
>
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9792
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>)
>         +3 other tests skip
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o fi-kbl-7567u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html>
>         +11 other tests skip
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html>
>         +30 other tests skip
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html>
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#5274
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#5274
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#5274
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>
>         / i915#9792
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>)
>  *
>
>     igt@kms_frontbuffer_tracking@basic:
>
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html>
>         (i915#4342
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>
>         / i915#9792
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>)
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>
>         / i915#9792
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>)
>  *
>
>     igt@kms_psr@psr-cursor-plane-move:
>
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9673
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>
>         / i915#9792
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>)
>         +3 other tests skip
>  *
>
>     igt@kms_psr@psr-primary-mmap-gtt@edp-1:
>
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>
>         / i915#9688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>  *
>
>     igt@kms_psr@psr-sprite-plane-onoff:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +3 other tests skip
>  *
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809>
>         / i915#9792
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>)
>  *
>
>     igt@prime_vgem@basic-fence-flip:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#9792
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>)
>  *
>
>     igt@prime_vgem@basic-fence-mmap:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +1 other test skip
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +1 other test skip
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +1 other test skip
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         +1 other test skip
>  *
>
>     igt@prime_vgem@basic-read:
>
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@prime_vgem@basic-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         +2 other tests skip
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@prime_vgem@basic-read.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         +1 other test skip
>  *
>
>     igt@prime_vgem@basic-write:
>
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@prime_vgem@basic-write.html>
>         (i915#10216
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@prime_vgem@basic-write.html>
>         (i915#10216
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>
>
>         Possible fixes
>
>   * igt@i915_selftest@live@hangcheck:
>       o bat-arls-2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7988/bat-arls-2/igt@i915_selftest@live@hangcheck.html>
>         (i915#11349
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-arls-2/igt@i915_selftest@live@hangcheck.html>
>       o bat-arls-1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7988/bat-arls-1/igt@i915_selftest@live@hangcheck.html>
>         (i915#11349
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-arls-1/igt@i915_selftest@live@hangcheck.html>
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7988 -> IGTPW_11623
>
> CI-20190529: 20190529
> CI_DRM_15283: bb53a030e951749b4e919a5a8b17e6d8bedc5597 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11623: 11623
> IGT_7988: 436018b50dfd35d75618a690f0dba6143d911aed @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--------------62uKS5uwHXwfws2cqp0kA8St
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body wd-tech="true" spellcheck="false">
    <br>
    <br>
    <div class="moz-cite-prefix">On 23.08.2024 15:01, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:172441811779.746160.11397750698975596731@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_vm: initialize bind_ops.extensions field</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/137703/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/137703/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_7988 -&gt; IGTPW_11623</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_11623 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_11623, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/index.html</a></p>
      <h2>Participating hosts (36 -&gt; 40)</h2>
      <p>Additional (6): fi-kbl-7567u fi-glk-j4005 fi-kbl-8809g
        bat-dg2-11 bat-mtlp-8 bat-mtlp-6 <br>
        Missing (2): fi-snb-2520m fi-elk-e7500 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_11623:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@i915_selftest@live@coherency:
          <ul>
            <li>bat-arls-5: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7988/bat-arls-5/igt@i915_selftest@live@coherency.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-arls-5/igt@i915_selftest@live@coherency.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    Not related at all.<br>
    <br>
    Regards<br>
    Andrzej<br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:172441811779.746160.11397750698975596731@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_11623 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@debugfs_test@basic-hwmon:</p>
          <ul>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318"
                moz-do-not-send="true">i915#9318</a>)</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318"
                moz-do-not-send="true">i915#9318</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@info:</p>
          <ul>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@fbdev@info.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582"
                moz-do-not-send="true">i915#2582</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@write:</p>
          <ul>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@fbdev@write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582"
                moz-do-not-send="true">i915#2582</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_huc_copy@huc-copy:</p>
          <ul>
            <li>fi-kbl-7567u: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190"
                moz-do-not-send="true">i915#2190</a>)</li>
            <li>fi-kbl-8809g: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190"
                moz-do-not-send="true">i915#2190</a>)</li>
            <li>fi-glk-j4005: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190"
                moz-do-not-send="true">i915#2190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@basic:</p>
          <ul>
            <li>fi-glk-j4005: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-glk-j4005/igt@gem_lmem_swapping@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
            <li>fi-kbl-7567u: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
            <li>fi-kbl-8809g: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random:</p>
          <ul>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap@basic:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@gem_mmap@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083"
                moz-do-not-send="true">i915#4083</a>)</li>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@gem_mmap@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083"
                moz-do-not-send="true">i915#4083</a>)</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@gem_mmap@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083"
                moz-do-not-send="true">i915#4083</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@basic:</p>
          <ul>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@gem_mmap_gtt@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_tiled_blits@basic:</p>
          <ul>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079"
                moz-do-not-send="true">i915#4079</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_blits@basic:</p>
          <ul>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@gem_tiled_blits@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_fence_blits@basic:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_pread_basic:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@gem_tiled_pread_basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079"
                moz-do-not-send="true">i915#4079</a>) +1 other test skip</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@gem_tiled_pread_basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079"
                moz-do-not-send="true">i915#4079</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@basic-api:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@i915_pm_rps@basic-api.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681"
                moz-do-not-send="true">i915#11681</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621"
                moz-do-not-send="true">i915#6621</a>)</li>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@i915_pm_rps@basic-api.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681"
                moz-do-not-send="true">i915#11681</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621"
                moz-do-not-send="true">i915#6621</a>)</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@i915_pm_rps@basic-api.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681"
                moz-do-not-send="true">i915#11681</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621"
                moz-do-not-send="true">i915#6621</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
          <ul>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212"
                moz-do-not-send="true">i915#4212</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792"
                moz-do-not-send="true">i915#9792</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212"
                moz-do-not-send="true">i915#4212</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190"
                moz-do-not-send="true">i915#5190</a>)</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190"
                moz-do-not-send="true">i915#5190</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792"
                moz-do-not-send="true">i915#9792</a>)</li>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190"
                moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
          <ul>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212"
                moz-do-not-send="true">i915#4212</a>) +8 other tests
              skip</li>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215"
                moz-do-not-send="true">i915#4215</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190"
                moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>fi-glk-j4005: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> +10 other tests skip</li>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103"
                moz-do-not-send="true">i915#4103</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213"
                moz-do-not-send="true">i915#4213</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
          <ul>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213"
                moz-do-not-send="true">i915#4213</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
          <ul>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792"
                moz-do-not-send="true">i915#9792</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_dsc@dsc-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840"
                moz-do-not-send="true">i915#3840</a>)</li>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_dsc@dsc-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840"
                moz-do-not-send="true">i915#3840</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159"
                moz-do-not-send="true">i915#9159</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-dpms:</p>
          <ul>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637"
                moz-do-not-send="true">i915#3637</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792"
                moz-do-not-send="true">i915#9792</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>fi-kbl-7567u: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a> +11 other tests skip</li>
            <li>fi-kbl-8809g: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a> +30 other tests skip</li>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a></li>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274"
                moz-do-not-send="true">i915#5274</a>)</li>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274"
                moz-do-not-send="true">i915#5274</a>)</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274"
                moz-do-not-send="true">i915#5274</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792"
                moz-do-not-send="true">i915#9792</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@basic:</p>
          <ul>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342"
                moz-do-not-send="true">i915#4342</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792"
                moz-do-not-send="true">i915#9792</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354"
                moz-do-not-send="true">i915#5354</a>)</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792"
                moz-do-not-send="true">i915#9792</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-plane-move:</p>
          <ul>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673"
                moz-do-not-send="true">i915#9673</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792"
                moz-do-not-send="true">i915#9792</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
          <ul>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"
                moz-do-not-send="true">i915#4077</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688"
                moz-do-not-send="true">i915#9688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-plane-onoff:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic-clone-single-crtc:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809"
                moz-do-not-send="true">i915#8809</a>)</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809"
                moz-do-not-send="true">i915#8809</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792"
                moz-do-not-send="true">i915#9792</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-flip:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>)</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792"
                moz-do-not-send="true">i915#9792</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-mmap:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +1 other test skip</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +1 other test skip</li>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-read:</p>
          <ul>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-read:</p>
          <ul>
            <li>bat-dg2-11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-dg2-11/igt@prime_vgem@basic-read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291"
                moz-do-not-send="true">i915#3291</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>) +2 other tests
              skip</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@prime_vgem@basic-read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-write:</p>
          <ul>
            <li>bat-mtlp-8: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-8/igt@prime_vgem@basic-write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216"
                moz-do-not-send="true">i915#10216</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>)</li>
            <li>bat-mtlp-6: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-mtlp-6/igt@prime_vgem@basic-write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216"
                moz-do-not-send="true">i915#10216</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>igt@i915_selftest@live@hangcheck:
          <ul>
            <li>bat-arls-2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7988/bat-arls-2/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349"
                moz-do-not-send="true">i915#11349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-arls-2/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">PASS</a></li>
            <li>bat-arls-1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7988/bat-arls-1/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349"
                moz-do-not-send="true">i915#11349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11623/bat-arls-1/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7988 -&gt; IGTPW_11623</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_15283: bb53a030e951749b4e919a5a8b17e6d8bedc5597 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_11623: 11623<br>
        IGT_7988: 436018b50dfd35d75618a690f0dba6143d911aed @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
    </blockquote>
    <br>
  </body>
</html>

--------------62uKS5uwHXwfws2cqp0kA8St--
