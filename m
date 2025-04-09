Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF18C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 04:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1740010E7C9;
	Wed,  9 Apr 2025 04:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfGzv7oJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3D110E7C8;
 Wed,  9 Apr 2025 04:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744172913; x=1775708913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k85TtNNcxu8copjLlGSqv1g5FJwrZfG6Fuxq+X/xO38=;
 b=gfGzv7oJRvASOogy4XqZ0hH0var/8lfUyQlx7QIoSkfMsatY39DAHYku
 +pmeY3UjY4QKqnU0JbghJv0PnKF+okx0o20mbysougDqsExUrApHrCooq
 O+FGs6Po2+USyUAe56gDhzzXxWQQvjwFQJ0q+ouIgYG2xTdxSr2awtIbO
 IWxT2XgjpZjilu9Kz9sqjDEJaKpFHs0WRKmx/buIRredm7oj2+iFl/1Cs
 1gFEhy1iRCAhnY7c2sKTvxM/8PWUg+dUo0r9iZvDb235jqKJu8oFihDlV
 fn6M3EQABsMNgS5Bj18IZCvuL948ZVQe8ZkMEXW2hI/Xy00PqoLedEO5G g==;
X-CSE-ConnectionGUID: gqOPxsQgSCCIvOArHDTQqQ==
X-CSE-MsgGUID: ZjNvV+vuS+uWevoHEdRy8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="71004020"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="71004020"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 21:28:32 -0700
X-CSE-ConnectionGUID: NsGF/vaPRSynho/mcRMY/w==
X-CSE-MsgGUID: NC108z/gQT27OF9RTd3CWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="133176437"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.202])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 21:28:31 -0700
Date: Wed, 9 Apr 2025 06:28:28 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 Replace loop in WMTP tests (rev3)
Message-ID: <20250409042828.kl6rvtsur5fzfti5@zkempczy-mobl2>
References: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
 <174414634095.50014.4955823646596191880@e6b6f09ec485>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174414634095.50014.4955823646596191880@e6b6f09ec485>
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

On Tue, Apr 08, 2025 at 09:05:40PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Replace loop in WMTP tests (rev3)                               
>    URL:     https://patchwork.freedesktop.org/series/147263/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12942/index.html 
> 
>                CI Bug Log - changes from IGT_8311 -> IGTPW_12942
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_12942 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12942, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12942/index.html
> 
> Participating hosts (44 -> 43)
> 
>    Missing (1): fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_12942:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@gt_pm:
> 
>           * bat-arlh-2: PASS -> INCOMPLETE
>      * igt@kms_flip@basic-flip-vs-wf_vblank:
> 
>           * fi-hsw-4770: PASS -> FAIL +1 other test fail
> 
>     Warnings
> 
>      * igt@i915_selftest@live:
>           * bat-arlh-2: DMESG-FAIL (i915#12061) -> INCOMPLETE

Unrelated to the series.

--
Zbigniew


> 
> Known issues
> 
>    Here are the changes found in IGTPW_12942 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@debugfs_test@basic-hwmon:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#9318)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * fi-glk-j4005: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@parallel-random-engines:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>           * fi-glk-j4005: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_mmap@basic:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_render_tiled_blits@basic:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@gem_tiled_fence_blits@basic:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>      * igt@i915_module_load@load:
> 
>           * bat-mtlp-9: PASS -> DMESG-WARN (i915#13494)
>      * igt@i915_pm_rps@basic-api:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_selftest@live@workarounds:
> 
>           * bat-arls-5: PASS -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
>           * bat-dg2-14: PASS -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#5190)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4212) +8 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4213) +1 other test skip
>      * igt@kms_dsc@dsc-basic:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#3555 / i915#3840 / i915#9159)
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * bat-arls-6: PASS -> FAIL (i915#13930)
>      * igt@kms_psr@psr-primary-mmap-gtt:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4077 / i915#9688) +1 other test
>             skip
>      * igt@kms_psr@psr-primary-page-flip:
> 
>           * fi-glk-j4005: NOTRUN -> SKIP +9 other tests skip
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#3555 / i915#8809)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#3708) +1 other test skip
>      * igt@prime_vgem@basic-gtt:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test
>             skip
>      * igt@prime_vgem@basic-write:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#10216 / i915#3708)
> 
>     Possible fixes
> 
>      * igt@core_hotunplug@unbind-rebind:
> 
>           * bat-dg2-9: ABORT (i915#13465 / i915#13571) -> PASS
>      * igt@i915_module_load@load:
> 
>           * bat-mtlp-8: ABORT (i915#13997) -> PASS
>      * igt@i915_selftest@live@active:
> 
>           * fi-bsw-nick: DMESG-FAIL -> PASS +1 other test pass
>      * igt@i915_selftest@live@workarounds:
> 
>           * bat-arlh-2: DMESG-FAIL (i915#12061) -> PASS
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8311 -> IGTPW_12942
>      * Linux: CI_DRM_16377 -> CI_DRM_16386
> 
>    CI-20190529: 20190529
>    CI_DRM_16377: a33da369e8cde6c7208381a592866cd61f1ce188 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    CI_DRM_16386: 1951437999630d299a063863fb92d235dd8dc3d1 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_12942: 12942
>    IGT_8311: 851a9c1cb1a690d8c527f26c49c250ec583af65e @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
