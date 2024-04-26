Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97F3C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 03:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B8611A9DA;
	Fri, 26 Apr 2024 03:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5j1k6JV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C47C11A9D9;
 Fri, 26 Apr 2024 03:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714103971; x=1745639971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zxjwc4NYJPceLL4TgNWZ6BH+gENxH/BbwbDHt6sED2o=;
 b=X5j1k6JVBXh57WzQ4eQGQWC+ducI/AP6A1YWZ89Ped9r/4wd0qtKAWyL
 RBIh1otQKBErQFGZWzG1od0ivCGmSfNTxpylNZa6oO0Nhn+RUc0o1+9Ei
 vPADXEvG7/qt0C4O9seZKMwqpUb24NscnFiRpFjEG/MtfsMR5xTDB/10R
 HycxxOVw1m3N3hJqj7C6+0Kg46VDgzvCp8mnADNt/3SjNvr45PlKpKJoI
 ppOMGzR8zBVdWOiSrBNewYQgTw5+Kum6isQ7BL/unv309XrokgHfEv/iP
 CrmfKTRkvFHo9dKfFAZ2pa1/ppymGI7igevvh+2coswAW73SrneFTRI2E Q==;
X-CSE-ConnectionGUID: aj0axU5mQ1eaHxr35ohu0A==
X-CSE-MsgGUID: IUTw36NMT76vvs+5Zfy+0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9942816"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9942816"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 20:59:31 -0700
X-CSE-ConnectionGUID: eOUT2B31SVqS0IN/AmXDjg==
X-CSE-MsgGUID: syZXo7uXT7yvHqkFX6F9Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="25371044"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 20:59:29 -0700
Date: Fri, 26 Apr 2024 05:59:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for Add
 render-copy compression on Xe+
Message-ID: <20240426035926.kbl4pgzggp3u6z57@zkempczy-mobl2>
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
 <171404577247.1650497.11416675148226267361@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171404577247.1650497.11416675148226267361@8e613ede5ea5>
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

On Thu, Apr 25, 2024 at 11:49:32AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add render-copy compression on Xe+                              
>    URL:     https://patchwork.freedesktop.org/series/132902/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11069/index.html 
> 
>                CI Bug Log - changes from IGT_7824 -> IGTPW_11069
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_11069 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_11069, please notify your bug team
>    ('I915-ci-infra@lists.freedesktop.org') to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11069/index.html
> 
> Participating hosts (33 -> 39)
> 
>    Additional (6): fi-kbl-7567u bat-kbl-2 bat-mtlp-9 fi-glk-j4005
>    fi-cfl-8109u bat-arls-3
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_11069:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@gt_mocs:
>           * bat-adlp-11: PASS -> INCOMPLETE

This failure is unrelated to the change.

--
Zbigniew



> 
> Known issues
> 
>    Here are the changes found in IGTPW_11069 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@debugfs_test@basic-hwmon:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#9318)
>      * igt@fbdev@info:
> 
>           * bat-kbl-2: NOTRUN -> SKIP (i915#1849)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * fi-cfl-8109u: NOTRUN -> SKIP (i915#2190)
>           * fi-kbl-7567u: NOTRUN -> SKIP (i915#2190)
>           * fi-glk-j4005: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@parallel-random-engines:
> 
>           * bat-kbl-2: NOTRUN -> SKIP +39 other tests skip
>           * bat-arls-3: NOTRUN -> SKIP (i915#10213) +3 other tests skip
>           * fi-glk-j4005: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>           * fi-kbl-7567u: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * fi-cfl-8109u: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_mmap@basic:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_render_tiled_blits@basic:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10197 / i915#10211 / i915#4079)
>      * igt@gem_tiled_blits@basic:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10196 / i915#4077) +2 other
>             tests skip
>      * igt@gem_tiled_pread_basic:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10206 / i915#4079)
>      * igt@i915_pm_rps@basic-api:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10209)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10200) +9 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10202) +1 other test skip
>      * igt@kms_dsc@dsc-basic:
> 
>           * fi-kbl-7567u: NOTRUN -> SKIP +11 other tests skip
>           * fi-cfl-8109u: NOTRUN -> SKIP +11 other tests skip
>           * bat-arls-3: NOTRUN -> SKIP (i915#9886)
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10207)
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#9812)
>      * igt@kms_psr@psr-primary-mmap-gtt:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#9732) +3 other tests skip
>      * igt@kms_psr@psr-primary-page-flip:
> 
>           * fi-glk-j4005: NOTRUN -> SKIP +10 other tests skip
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10208 / i915#8809)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10212 / i915#3708)
>      * igt@prime_vgem@basic-gtt:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10196 / i915#3708 / i915#4077)
>             +1 other test skip
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
> 
>           * {bat-rpls-4}: DMESG-WARN (i915#7507) -> PASS
>      * igt@i915_selftest@live@gt_mocs:
> 
>           * bat-dg2-11: DMESG-FAIL (i915#10940) -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7824 -> IGTPW_11069
> 
>    CI-20190529: 20190529
>    CI_DRM_14649: 67988afd596f307b6b7e849e6a246bca9a20e93d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_11069: 11069
>    IGT_7824: 7824
