Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71143E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 17:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDD210E48A;
	Thu, 12 Dec 2024 17:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7s6ilKf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A49610E48A;
 Thu, 12 Dec 2024 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734023253; x=1765559253;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5aSRGFUg6DoVDxlcmvpR7c5luFrEfR/r5eYs+oSjbNs=;
 b=l7s6ilKfSK3yj6tNoW7wBkaeKqg7L6AvwkfdpEaxeqYZzd2aYBm6lYHv
 N33REjMA6oyt4A4Y5Id9/Xk9Y07pfUFpOFvCsiEOCcBZWsV03Gb4hiSQb
 9XEvmTH63ABaWgRrrDvcZ89Bvpo7Be9VarLy+F1Z39ITFDMII8A0E/8sF
 N/pW34dNMZJjUznSXy0CxCePJUvI/JzvhcMEkL4F01gThF2WwFeC2RGX2
 Z38kJv5uZSUCIc8aJluDsVep436JzT69E7NLfBQo2EXcHKLblPQRIIU78
 lJUERZkHY6Adui9hzvhNFTQZ48hkHf7GPiXwkyVvOn7eAmWhrN0zAG102 A==;
X-CSE-ConnectionGUID: 4yVx6yjMRy+VKmOiUKwlhw==
X-CSE-MsgGUID: fUEC77wNRfqe2ZOQ7hforQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34181674"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34181674"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:07:33 -0800
X-CSE-ConnectionGUID: wMha/0TTROywW4vN6O0Afg==
X-CSE-MsgGUID: lc2/uzptTEeneDI2QACSKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133663769"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:07:31 -0800
Date: Thu, 12 Dec 2024 18:07:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
	I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 tests/intel-ci: Update chamelium-only.testlist
Message-ID: <20241212170712.yhop2zv7hnl6sude@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241212042509.30614-1-karthik.b.s@intel.com>
 <173400030770.1547317.16652230006694801770@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173400030770.1547317.16652230006694801770@b555e5b46a47>
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
On 2024-12-12 at 10:45:07 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel-ci: Update chamelium-only.testlist
> URL   : https://patchwork.freedesktop.org/series/142462/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15828_full -> IGTPW_12302_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12302_full absolutely need to be
>   verified manually.

Unrelated, this is reviving kms_tiled_display@basic-test-pattern-with-chamelium
and none of below are about this.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12302_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12302_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@debugfs_test@read_all_entries_display_on:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2] +2 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-3/igt@debugfs_test@read_all_entries_display_on.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-2/igt@debugfs_test@read_all_entries_display_on.html
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - shard-dg1:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg1-17/igt@gem_eio@in-flight-contexts-10ms.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@gem_eio@in-flight-contexts-10ms.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][5] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk2/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-snb:          NOTRUN -> [ABORT][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb5/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-snb:          [PASS][7] -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [CRASH][9] +3 other tests crash
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
>     - shard-glk:          [PASS][10] -> [INCOMPLETE][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk8/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk5/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_async_flips@invalid-async-flip-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][12]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-1/igt@kms_async_flips@invalid-async-flip-atomic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-rkl:          [DMESG-WARN][13] ([i915#12964]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12302_full that come from known issues:
> 
> ### IGT changes ###
> 
...cut...
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/index.html
