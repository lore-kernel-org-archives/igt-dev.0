Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B465C021B0
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 10:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69E210E267;
	Wed, 19 Feb 2025 10:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6MV/g4E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D8010E267;
 Wed, 19 Feb 2025 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739960725; x=1771496725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fSQHjn/42OmPIWGlXQRQ0HZGNUwdmxaYcrbXEBz93/M=;
 b=d6MV/g4EQrY5Ps4C4N0hl8WiQ/Qsa6aPmyD+JM68iBCpyHJb8At2OAlE
 Myokir2vl83zMZKAbU1Sh0KoD4yZRdilI8Qq4kN0cO1NS9nvvvOx7K5Rh
 sn725JrOXnkiRrro1kOyr31pIdwSfafmdont3cXMy5l8totpU9N0//fbC
 LvH9LUpEZ8LE3EfolyUIDzfrQIDPkNjhkiY8F1ocuFq9L1DioU8DaZjdm
 OezaGB27685ftlx26GSeWvqM7O+d8749AlV2pnUVzKMcu4yEmLpwqCvmo
 l4IWXr0sg4lHB4vfe95WaCbLqyCP4V/cPnDPqjtsa+FOVjvXbtqkkRMug g==;
X-CSE-ConnectionGUID: 8CxyZCpbQw2poOnt8R6xAQ==
X-CSE-MsgGUID: aAdawhcTSna0LQ+9Ibwt8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40705635"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40705635"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:25:25 -0800
X-CSE-ConnectionGUID: BcESe4I0QHC484mpTqpVzA==
X-CSE-MsgGUID: BGJ27I+yReC4qKi9uq340Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115153947"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 02:25:24 -0800
Date: Wed, 19 Feb 2025 11:25:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests=2Fkms?=
 =?utf-8?Q?=5Fasync=5Fflips=3A?= Create subtest for overlay planes (rev3)
Message-ID: <20250219102521.ctqn5wuihk7wws6a@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241216202427.76168-1-andrealmeid@igalia.com>
 <173995560081.3861872.879483953138295280@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173995560081.3861872.879483953138295280@b555e5b46a47>
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
On 2025-02-19 at 09:00:00 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_async_flips: Create subtest for overlay planes (rev3)
> URL   : https://patchwork.freedesktop.org/series/142386/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8236_full -> XEIGTPW_12625_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12625_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12625_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12625_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@overlay-atomic (NEW):
>     - shard-bmg:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12625/shard-bmg-4/igt@kms_async_flips@overlay-atomic.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12625/shard-dg2-433/igt@kms_async_flips@overlay-atomic.html
>     - shard-lnl:          NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12625/shard-lnl-8/igt@kms_async_flips@overlay-atomic.html

These are expected skips, Karthik or Swati please confirm.

Below regressions are unrelated.

> 
>   * igt@kms_plane_multiple@tiling-none:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12625/shard-dg2-434/igt@kms_plane_multiple@tiling-none.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          [SKIP][5] ([Intel XE#2833]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8236/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12625/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-dg2-set2:     [ABORT][7] ([Intel XE#4268]) -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8236/shard-dg2-434/igt@xe_pm@s4-mocs.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12625/shard-dg2-466/igt@xe_pm@s4-mocs.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8236_full and XEIGTPW_12625_full:
> 
> ### New IGT tests (3) ###
> 
>   * igt@kms_async_flips@overlay-atomic:
>     - Statuses : 3 skip(s)
>     - Exec time: [0.0] s

Expected skips, see above.

> 
>   * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.36] s
> 
>   * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.29] s
> 

Not introduced by this patch.

Regards,
Kamil

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12625_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1125])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12625/shard-lnl-6/igt@intel_hwmon@hwmon-read.html
> 
[...cut...]
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8236 -> IGTPW_12625
>   * Linux: xe-2679-4cc4e3d6ea1543688d62432dbe0fa750780fb262 -> xe-2680-4587c05996666a92af63f86ba410bae1dc940794
> 
>   IGTPW_12625: 12625
>   IGT_8236: 8236
>   xe-2679-4cc4e3d6ea1543688d62432dbe0fa750780fb262: 4cc4e3d6ea1543688d62432dbe0fa750780fb262
>   xe-2680-4587c05996666a92af63f86ba410bae1dc940794: 4587c05996666a92af63f86ba410bae1dc940794
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12625/index.html
