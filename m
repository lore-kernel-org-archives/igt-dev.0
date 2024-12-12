Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3137BE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 17:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B0E10E3E3;
	Thu, 12 Dec 2024 17:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5qZBo8j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A1910E2EB;
 Thu, 12 Dec 2024 17:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734024889; x=1765560889;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1K2WGE5zLSrS9x/4/lZmKWviU3xlELZMGDoRfpLg5ys=;
 b=J5qZBo8jWQi2OGJlziOEtt9OX50whEYThjIP/RU7gHv0HQS9rUFHAbPv
 r7ehIQ/KU77DvrkwT1sQ/38eH3GXcQ6pi9Vb+YZsk76QHabtvcVroElew
 I0OTP2X/Wfdn17WwsHQOpm6vYo3IIb/F0WvS8Ci34NdcTfZ+5fupcG0ed
 iu2ZEd82pgncHb34d6PRqwGF21r1YAgt+2CVdQkbIB98B5Gq2g5edLJik
 t5IHaGAN2DI8tHS6eryLE6lZuIlEF/33cpj6zo+/qjqHJckiwcdsx9ziT
 5eCai0FKyngBnIY2z480eFKH9tHTYZw1v1NCMESPisYR6XEg7DkS5UZHU A==;
X-CSE-ConnectionGUID: HZwjHZBFS9C+eKeZMSVOqg==
X-CSE-MsgGUID: ptQ0S3GvS6GMpV86A2rI/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45146620"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="45146620"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:34:48 -0800
X-CSE-ConnectionGUID: aalCWzOBSs6O/Izrdtfmtg==
X-CSE-MsgGUID: Aw4rusqATu25CnARNH7hBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="96832288"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 09:34:47 -0800
Date: Thu, 12 Dec 2024 18:34:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 scripts/generate_iga64_codes: fix path of iga64_macros.h
Message-ID: <20241212173444.ldrp4gb6hj6wmi4r@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241212-fix_iga64_macros_path-v1-1-9e8d149c8667@intel.com>
 <173401290448.1586471.16600598160334579699@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173401290448.1586471.16600598160334579699@b555e5b46a47>
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
On 2024-12-12 at 14:15:04 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: scripts/generate_iga64_codes: fix path of iga64_macros.h
> URL   : https://patchwork.freedesktop.org/series/142480/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8150 -> IGTPW_12306
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12306 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12306, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/index.html
> 
> Participating hosts (45 -> 46)
> ------------------------------
> 
>   Additional (2): fi-ivb-3770 fi-pnv-d510 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12306:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-bsw-nick:        [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/fi-bsw-nick/igt@i915_selftest@live@hangcheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/fi-bsw-nick/igt@i915_selftest@live@hangcheck.html
> 

Unrelated, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12306 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_module_load@load:
>     - fi-pnv-d510:        NOTRUN -> [ABORT][3] ([i915#13203])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/fi-pnv-d510/igt@i915_module_load@load.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-rpls-4:         [PASS][4] -> [FAIL][5] ([i915#12903])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-arls-5:         NOTRUN -> [ABORT][6] ([i915#12061])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/bat-arls-5/igt@i915_selftest@live.html
>     - fi-bsw-nick:        [PASS][7] -> [ABORT][8] ([i915#12435])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/fi-bsw-nick/igt@i915_selftest@live.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/fi-bsw-nick/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-3:         [PASS][9] -> [ABORT][10] ([i915#12061]) +1 other test abort
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>     - bat-arls-5:         [PASS][11] -> [ABORT][12] ([i915#12061])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/bat-arls-5/igt@i915_selftest@live@workarounds.html
>     - bat-arlh-2:         [PASS][13] -> [ABORT][14] ([i915#12061]) +1 other test abort
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-arlh-2/igt@i915_selftest@live@workarounds.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/bat-arlh-2/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1:
>     - fi-ivb-3770:        NOTRUN -> [SKIP][15] +23 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-dg1-7:          [FAIL][16] ([i915#12903]) -> [PASS][17]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-twl-1:          [ABORT][18] ([i915#12919] / [i915#9413]) -> [PASS][19] +1 other test pass
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8150/bat-twl-1/igt@i915_selftest@live.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/bat-twl-1/igt@i915_selftest@live.html
> 
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
>   [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
>   [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
>   [i915#13203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13203
>   [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8150 -> IGTPW_12306
>   * Linux: CI_DRM_15827 -> CI_DRM_15830
> 
>   CI-20190529: 20190529
>   CI_DRM_15827: 9b5dff950301bf05d2e76745cacb457a0a82b50f @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15830: 7b441ab54824526dd570dfbfbef51bcd2ba4c5b5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12306: 12306
>   IGT_8150: 7812065f4aebab1629b570bd78ef71e09480b359 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12306/index.html
