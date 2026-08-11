Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593FCC5AC67
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 10:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D369E10E2B8;
	Tue, 11 Aug 2026 10:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGCOKKem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E92310E2B8
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786443384; x=1817979384;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=LQlKNfbIfYmW0YZfUW8RFsR8e036vDpO0OKSP/eGQek=;
 b=fGCOKKemkO+do25ubYILU+xkPPqPN99WPayuM8Im+3RtTo5FCxSeJfMf
 wfcnpuigGzBQn4qSeVM2R7YOm3nFs/Fts+1zpQBxtwhBWNSnh0/Kdu0xI
 4TLR2WDKFEQerwhHoY6mZsyKfHuveYRDok+JcslX+uYRGWYLYQAPuXdd5
 b4+eO7RJPgzWZHqFTStZMOSz+dtrmpwMSr2j4NEmhcNRXgZNB8ZRZhzZa
 WG+8QkVldx6//sHKcH7BVqZjxEo6qSgSEjikgOU9X1ArVV5tCBpYAOuR/
 fOGsGxvDNnXtFMbiKdHgyS32oxbMeGMEGrlVIx/Vxi9oWXWeEMRZVahEU A==;
X-CSE-ConnectionGUID: As2RQ3OwSHaAoMbpfKis7w==
X-CSE-MsgGUID: 3rZ+i88bTx6PyVmx0AQjCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="98118619"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="98118619"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 03:16:24 -0700
X-CSE-ConnectionGUID: RkP/94qsTpSoHlCastph0w==
X-CSE-MsgGUID: EuKbXQIfRl6b11N3uzyh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="262796525"
Received: from yherrera-mobl1.amr.corp.intel.com (HELO [10.245.113.176])
 ([10.245.113.176])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 03:16:24 -0700
Message-ID: <addb7da4-be29-4cd9-8637-16e3d8fbb155@linux.intel.com>
Date: Tue, 11 Aug 2026 12:16:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_benchmark?=
 =?UTF-8?Q?s/gem=5Fwsim=3A_explicit_VM_create/assign_+_LR_mode_=28rev2=29?=
To: igt-dev@lists.freedesktop.org
References: <20260810093950.1696330-1-marcin.bernatowicz@linux.intel.com>
 <178637707385.35468.2562590832726469884@61270ab9df2a>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <178637707385.35468.2562590832726469884@61270ab9df2a>
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


On 8/10/2026 5:51 PM, Patchwork wrote:
> == Series Details ==
>
> Series: benchmarks/gem_wsim: explicit VM create/assign + LR mode (rev2)
> URL   : https://patchwork.freedesktop.org/series/170422/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from CI_DRM_18972_full -> IGTPW_15647_full
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with IGTPW_15647_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_15647_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15647/index.html
>
> Participating hosts (10 -> 10)
> ------------------------------
>
>    No changes in participating hosts
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in IGTPW_15647_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>      - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18972/shard-snb5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15647/shard-snb6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

Not related to the change.

--

marcin

>    
> Known issues
> ------------
>
>    Here are the changes found in IGTPW_15647_full that come from known issues:
>
[cut]
> Build changes
> -------------
>
>    * CI: CI-20190529 -> None
>    * IGT: IGT_9047 -> IGTPW_15647
>    * Piglit: piglit_4509 -> None
>
>    CI-20190529: 20190529
>    CI_DRM_18972: 64945e34f2f3505d1def53d6752c04ddca144a92 @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_15647: 3448f4dd0308771686f55c11b3e7958f3c420fd3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_9047: 9047
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15647/index.html
>
