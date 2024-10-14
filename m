Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7291ED1627D
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 14:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A5810E45C;
	Mon, 14 Oct 2024 14:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exPqRVIm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0061E10E190;
 Mon, 14 Oct 2024 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728916811; x=1760452811;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NGQ4o6AvBMPULmR87GrKeQ4j45OUzbObMHXgQxw+5uE=;
 b=exPqRVIm9AKcYKp/vWee/fzDxSbpGN39ywzop7aI+4XuHZZPsa6UAzO8
 0AvBVvX2ijWn34WJ7FHcp/V5DfUnY+OHzjm6OStxbt9q4Ju79uAsTZWiF
 bXO536x3qVbbncg2HS8OlwFjnqJYD9kbhRqEx5PMAdZMHDAWbOyn3M7KD
 FfiHDGeH2Ipcd7oAdWtA2EmCKlipvN8FJ0/dJofY8MK0676Ii4uFOnzFE
 +ssazkzN8i97De8JkmdPEZ+LhOgO2fbIoaMvGrYEhol804Jqkt9XtJUk+
 z+kCaExEA64uuaj4OTM3kN2+xQFiXGIEb2yww+nSdK7BzNkktHf5vLOPl w==;
X-CSE-ConnectionGUID: q3ecuPwQRpipAU0Udx7Bxg==
X-CSE-MsgGUID: 8dYGxhqXRFCPAMSC93a7Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27759510"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="27759510"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 07:40:10 -0700
X-CSE-ConnectionGUID: EKzv/bRtSVmH6UuelJfy3Q==
X-CSE-MsgGUID: QmJCPJtTSe2iae0fX5GUCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="77515250"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 07:40:09 -0700
Date: Mon, 14 Oct 2024 16:40:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_fo?= =?utf-8?Q?r?=
 lib/gem_mman: Stop lying about I915_MMAP_OFFSET_GTT support
Message-ID: <20241014144006.32kaetzixlef2d6n@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241010135023.275507-2-janusz.krzysztofik@linux.intel.com>
 <172866019270.1241098.16879671848980813826@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172866019270.1241098.16879671848980813826@2413ebb6fbb6>
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
On 2024-10-11 at 15:23:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/gem_mman: Stop lying about I915_MMAP_OFFSET_GTT support
> URL   : https://patchwork.freedesktop.org/series/139847/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8065_full -> XEIGTPW_11898_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11898_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11898_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11898_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11898/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-dg2-set2:     [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11898/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][5] +2 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11898/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html
> 
>   * igt@xe_exec_compute_mode@twice-bindexecqueue:
>     - shard-lnl:          [PASS][6] -> [INCOMPLETE][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11898/shard-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
>     - shard-lnl:          [PASS][8] -> [DMESG-FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11898/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][10]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11898/shard-dg2-432/igt@xe_pm@s3-mocs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
>     - shard-dg2-set2:     [SKIP][11] ([Intel XE#651]) -> [SKIP][12] +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11898/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-dg2-set2:     [SKIP][13] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane-move.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11898/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 

This is unrelated to the change, it could affect only i915 tests.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11898_full that come from known issues:
> 
> ### IGT changes ###
...cut...
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8065 -> IGTPW_11898
> 
>   IGTPW_11898: e77bc015545fc79822c3768a384787699360526c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8065: c727cc3fad56f16f1a9f35023ae5dd7111976fa3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16: 09a8c322287e106dca33e28fa7f1475255a9ef16
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11898/index.html
