Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CE3C54E49
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 10:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA9A10F03E;
	Mon, 26 Feb 2024 10:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vqw6hiPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E011710F030;
 Mon, 26 Feb 2024 10:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708944354; x=1740480354;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qKJuSckZG+idse0SER/y4kJnpcBSt7u8Gv7ZmzoDnpE=;
 b=Vqw6hiPE5S4DU/nA81iiAGmzMshkOxZuIhK063R52bxbqVDtFwE/B+eT
 LL8Co3Trl+mUBgMwHmt0VUGG/spIWSz2FSy4vZmwVLtruh/MJPXnuxBRa
 1u6JQRWZwEJGzKxJyOdpxuqvIS9Fk1JBj+dPnFdL4QeMUAQHfjrh7ONQH
 /tJEHga82QJMGLLCedEFjLPSTFPpO+1iVVpIxmi/lxFGnPTwm2VA5vTT/
 AbeeexC+Qz+f1Cwumf/QG5UOkL6H1qb9F3Nlt+a0Q9spbjyXmnv367UZG
 0Ycxg40GcMeivTPoheDa7QdEtZI0tOWII/fhgOR1uYJNn+Q5etZqTX8GS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3091105"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3091105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 02:45:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7050768"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 02:45:52 -0800
Date: Mon, 26 Feb 2024 11:45:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 intel/xe_test_config.json: add sriov_basic.c
Message-ID: <20240226104548.tgsc2r3alpng7qyh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240222074337.173747-1-mauro.chehab@linux.intel.com>
 <170862347502.216122.3422604783711275542@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170862347502.216122.3422604783711275542@8e613ede5ea5>
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

Hi igt-dev,
On 2024-02-22 at 17:37:55 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel/xe_test_config.json: add sriov_basic.c
> URL   : https://patchwork.freedesktop.org/series/130241/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14314_full -> IGTPW_10718_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10718_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10718_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10718/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10718_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-0:
>     - shard-dg2:          [PASS][1] -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14314/shard-dg2-5/igt@kms_big_fb@linear-32bpp-rotate-0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10718/shard-dg2-5/igt@kms_big_fb@linear-32bpp-rotate-0.html
> 
>   * {igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-2} (NEW):
>     - shard-dg2:          NOTRUN -> [SKIP][3] +14 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10718/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_chamelium_edid@dp-mode-timings:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][4] +1 other test timeout
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10718/shard-dg2-5/igt@kms_chamelium_edid@dp-mode-timings.html
> 
>   * igt@kms_cursor_legacy@single-bo@pipe-a:
>     - shard-rkl:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14314/shard-rkl-5/igt@kms_cursor_legacy@single-bo@pipe-a.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10718/shard-rkl-7/igt@kms_cursor_legacy@single-bo@pipe-a.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_render_copy@linear-to-vebox-yf-tiled:
>     - shard-dg2:          [SKIP][7] ([i915#5190]) -> [TIMEOUT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14314/shard-dg2-7/igt@gem_render_copy@linear-to-vebox-yf-tiled.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10718/shard-dg2-5/igt@gem_render_copy@linear-to-vebox-yf-tiled.html
> 
>   * igt@gem_tiling_max_stride:
>     - shard-dg2:          [SKIP][9] ([i915#4077]) -> [TIMEOUT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14314/shard-dg2-10/igt@gem_tiling_max_stride.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10718/shard-dg2-5/igt@gem_tiling_max_stride.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2:          [SKIP][11] ([fdo#111614]) -> [TIMEOUT][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14314/shard-dg2-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10718/shard-dg2-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 

Unrelated to Xe JSON file change, no need for respin.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2}:
>     - shard-dg2:          NOTRUN -> [SKIP][13] +120 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10718/shard-dg2-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14314_full and IGTPW_10718_full:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7722 -> IGTPW_10718
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14314: d6c1b8ab9a4dec3a52c5f53b283436f95dbd3285 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10718: 10718
>   IGT_7722: 48196ef379a77675ea6af82a82da62b2ad2d9ded @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10718/index.html
