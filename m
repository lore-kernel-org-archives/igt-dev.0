Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC03CF2590
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 05:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994F910E270;
	Mon, 14 Oct 2024 05:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tt9bCaj2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234EE10E26F;
 Mon, 14 Oct 2024 05:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728883366; x=1760419366;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=D5phy4xW2HmjcIGmdiU/H6KO374RTOxixbq23ZzlLMc=;
 b=Tt9bCaj2AZ22hpHcVD6YWs7J2nD7qs7Kv5hvmvM5B96b4T1cEfT2SJNB
 K8P3kPpK57gUJEIrDj3khdvZURVb0teuE+8E++tNpGVBlCRxc8/YDveBN
 r2BFvWubB8q6czqRxPsiAR1KeALy4anU/KtwEduzeLpMyAN0GgZfxwjVy
 3nMqZdD/VXMrJqQ5oq9XxO7Oz0HP4hJN8WJ66T7O3ccjShoPiLdGoPoXT
 dZaUb/wAXVaJd5dGagvhoy5f+5LwbLvTXEBKcpSY7kBmSWvvGUauYnhp8
 PCypW9MtNqQGxYf6loSH0aH82ZDww2vgRLAMEZLGmVaTKSYeObp5cIB9Z w==;
X-CSE-ConnectionGUID: XfH+JKk4SnivzRukYX58KQ==
X-CSE-MsgGUID: iWzctPbFTIiPqUSZR1oLHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28311705"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28311705"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 22:22:45 -0700
X-CSE-ConnectionGUID: cajp9in/TfyGiUskS4Jwzw==
X-CSE-MsgGUID: AHz49J2bRtSmGNAr68do2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77398102"
Received: from cscleary-mobl1.ger.corp.intel.com (HELO [10.213.202.134])
 ([10.213.202.134])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 22:22:45 -0700
Message-ID: <9225a1c3-e27f-4d19-9545-e7501b2b22d3@linux.intel.com>
Date: Mon, 14 Oct 2024 07:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fmodule=5Fload=3A_Handling_of_snd=5Fhda=5Fintel?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <ffa2bbcb-edb3-4610-aec8-bcd6a3b8f106@linux.intel.com>
 <172867115948.1241715.10112439750607543080@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <172867115948.1241715.10112439750607543080@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8
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

Dear I915,

On 11.10.2024 20:25, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_module_load: Handling of snd_hda_intel
> URL   : https://patchwork.freedesktop.org/series/139838/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15513_full -> IGTPW_11897_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11897_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11897_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11897/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   Additional (1): shard-glk-0 
>   Missing    (1): shard-glk 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11897_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_balancer@nop:
>     - shard-mtlp:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15513/shard-mtlp-7/igt@gem_exec_balancer@nop.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11897/shard-mtlp-7/igt@gem_exec_balancer@nop.html
> 
>   * igt@gem_exercise_blt@fast-copy:
>     - shard-dg1:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15513/shard-dg1-18/igt@gem_exercise_blt@fast-copy.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11897/shard-dg1-15/igt@gem_exercise_blt@fast-copy.html
> 
>   * igt@i915_pm_freq_api@freq-suspend@gt0:
>     - shard-dg2:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15513/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11897/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-snb:          [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15513/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11897/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-tglu:         [PASS][9] -> [ABORT][10] +1 other test abort
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15513/shard-tglu-3/igt@kms_plane@pixel-format-source-clamping.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11897/shard-tglu-4/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
>     - shard-mtlp:         [PASS][11] -> [FAIL][12] +1 other test fail
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15513/shard-mtlp-4/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11897/shard-mtlp-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

These are unrelated to my patch.

Thank you!


[...]
