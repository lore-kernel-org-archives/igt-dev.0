Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6006C5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 07:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8334510EF50;
	Tue, 27 Feb 2024 07:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ma/cEKqJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59EA10EF50
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 07:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709018033; x=1740554033;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=cnfF1qSaoYAcgay6VYXBjUyBt48t8LdXM+WrUoZiZp4=;
 b=ma/cEKqJotuiyRtbKRaQAHVKPqNU68J0ROzrXw2wFFAdGphqo4dmxPds
 8zXHcc5Y1o5W0LqOkIxFCOkQJzRetv3lu0bumVdf5OXuBsl8VVuukpZcx
 2pDzrqImzvlmCv1nA2WqIBjmJ5sPsrYh91Ul2Ka3muNWFLGSScGJIqDih
 dWYXbJeC3vK7B+zsdCpVeY3GPpGr2KydMIwmfeVCSySvcC3tvcmocnEDl
 /pQz0iXx52d8baze+ntn0SXUKujXhckEVulIHeNnRtFbYwIwCJ6plsv2V
 ULMvtzbTJI6q8Urrw4BnVOLS63vtiMWyi+1acgKK4jGnHUlxUyLYAgxJO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14055798"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="14055798"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 23:13:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6976532"
Received: from stemerk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.114.228])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 23:13:51 -0800
Date: Tue, 27 Feb 2024 08:13:47 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 lib/rendercopy: Fix Xe2 pixel shader
Message-ID: <20240227071347.2bsfh2xqrlyzkwat@zkempczy-mobl2>
References: <20240226114511.51753-1-zbigniew.kempczynski@intel.com>
 <170895230237.299097.14469243539382058052@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170895230237.299097.14469243539382058052@8e613ede5ea5>
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

On Mon, Feb 26, 2024 at 12:58:22PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/rendercopy: Fix Xe2 pixel shader                            
>    URL:     https://patchwork.freedesktop.org/series/130379/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10733/index.html 
> 
>              CI Bug Log - changes from CI_DRM_14336 -> IGTPW_10733
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_10733 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_10733, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10733/index.html
> 
> Participating hosts (38 -> 39)
> 
>    Additional (2): bat-mtlp-8 bat-arls-3
>    Missing (1): fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_10733:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
>           * bat-arls-2: PASS -> ABORT

Unrelated. Change touches LNL shader only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_10733 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@debugfs_test@basic-hwmon:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#9318)
>           * bat-arls-3: NOTRUN -> SKIP (i915#9318)
>      * igt@gem_lmem_swapping@parallel-random-engines:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10213) +3 other tests skip
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_mmap@basic:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4083)
>           * bat-arls-3: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap_gtt@basic:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>      * igt@gem_render_tiled_blits@basic:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4079) +1 other test skip
>           * bat-arls-3: NOTRUN -> SKIP (i915#10197 / i915#10211 / i915#4079)
>      * igt@gem_tiled_blits@basic:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10196 / i915#4077) +2 other
>             tests skip
>      * igt@gem_tiled_pread_basic:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10206 / i915#4079)
>      * igt@i915_pm_rpm@module-reload:
> 
>           * bat-arls-3: NOTRUN -> DMESG-WARN (i915#10194 / i915#10215)
>      * igt@i915_pm_rps@basic-api:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#6621)
>           * bat-arls-3: NOTRUN -> SKIP (i915#10209)
>      * igt@i915_selftest@live@ring_submission:
> 
>           * bat-arls-3: NOTRUN -> INCOMPLETE (i915#10274)
>      * igt@i915_selftest@live@workarounds:
> 
>           * bat-arls-3: NOTRUN -> DMESG-WARN (i915#10194) +30 other tests
>             dmesg-warn
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10200) +9 other tests skip
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#5190)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4212) +8 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10202) +1 other test skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4213) +1 other test skip
>      * igt@kms_dsc@dsc-basic:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#9886)
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#3555 / i915#3840 / i915#9159)
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10207)
>           * bat-mtlp-8: NOTRUN -> SKIP (fdo#109285)
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#5274)
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#9812)
>      * igt@kms_psr@psr-primary-mmap-gtt:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#9732) +3 other tests skip
>      * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#4077 / i915#9688)
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#3555 / i915#8809)
>           * bat-arls-3: NOTRUN -> SKIP (i915#10208 / i915#8809)
>      * igt@prime_vgem@basic-fence-mmap:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10196 / i915#3708 / i915#4077)
>             +1 other test skip
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test
>             skip
>      * igt@prime_vgem@basic-fence-read:
> 
>           * bat-mtlp-8: NOTRUN -> SKIP (i915#3708) +2 other tests skip
>           * bat-arls-3: NOTRUN -> SKIP (i915#10212 / i915#3708)
>      * igt@prime_vgem@basic-read:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10214 / i915#3708)
>      * igt@prime_vgem@basic-write:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10216 / i915#3708)
> 
>     Possible fixes
> 
>      * igt@i915_pm_rpm@module-reload:
>           * fi-kbl-7567u: CRASH (i915#9947) -> PASS
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7729 -> IGTPW_10733
> 
>    CI-20190529: 20190529
>    CI_DRM_14336: da89ab10a9af68bc5bf2da94f0958929042a789d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_10733: 10733
>    IGT_7729: 7729
> 
> Testlist changes
> 
>    -igt@kms_vrr@max-min
