Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474F3C36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 09:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA66510EB91;
	Fri,  4 Apr 2025 09:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0SOm9go";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9920310EB90;
 Fri,  4 Apr 2025 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743757879; x=1775293879;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iHC9/DDSXr8JYNcPSrnOdwN4egbqNqGz9TsTAhi9/I4=;
 b=I0SOm9golh3qiKr5HWAO8q7bmnyQlNLDltt4FpwU8nkfcnRugD1qDLE0
 LASOVC/dO+pYrUHZyrzhggU05lIVeHd++xSHdgZv5EG87QtXiy79copW5
 5JKQofLkBcH2kFzBMNDLyjk15CcPgKyeb+TyhJ4FpUCFBa+/ZuXUDe51d
 VBWhFQXwleNSutnZoI5CrvZkiZo+NdnKAXAnOh9k7+ZYEVWcu4nFTH2em
 x8ZIr7fBMD6Ll64QhY9MaMrSWxaLvVaFiaml4w3sicf+DSmCfYiipVIqi
 9zy9ZNxhUlLL/kaYHcu2WfxQWrl8K97Y6NSXaGgkkycYqS/6nWS5omBuU Q==;
X-CSE-ConnectionGUID: lHqyHADeRLOpYSvbdVouQw==
X-CSE-MsgGUID: sUfVYCwFR9qKu3DaruuDCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55856453"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="55856453"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:11:18 -0700
X-CSE-ConnectionGUID: QHGqSZZ4S1agqdznAB1gsA==
X-CSE-MsgGUID: 6Wq2q8A8TD+oZ/zrotwqHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="164470593"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:11:17 -0700
Date: Fri, 4 Apr 2025 11:11:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib=2Fintel?=
 =?utf-8?Q?=5Fallocator=3A?= protect binding for multithreaded tests (rev2)
Message-ID: <20250404091114.lddirgankmkxpgcp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
References: <20250403083438.132035-1-zbigniew.kempczynski@intel.com>
 <174374963993.37726.9447188418901988183@e6b6f09ec485>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174374963993.37726.9447188418901988183@e6b6f09ec485>
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
On 2025-04-04 at 06:53:59 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_allocator: protect binding for multithreaded tests (rev2)
> URL   : https://patchwork.freedesktop.org/series/147185/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8304_FULL -> XEIGTPW_12920_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12920_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12920_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12920_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b:
>     - shard-lnl:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8304/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12920/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8304/shard-dg2-466/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12920/shard-dg2-466/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 

Unrelated.

>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8304/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12920/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
> 

This also seems unrelated, adding Francois to Cc.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12920_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
>     - shard-lnl:          NOTRUN -> [FAIL][7] ([Intel XE#3719] / [Intel XE#911]) +3 other tests fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12920/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
> 

...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8304 -> IGTPW_12920
>   * Linux: xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7 -> xe-2903-9edc6ea87f86cbb6cda6b76d334c07492d0a8073
> 
>   IGTPW_12920: 276d57396d52a4c8f9e50fbae4bce93cec9ea1f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8304: 8304
>   xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7: 71dac8dae6cc024b633bd6e584f4195c44c0dbc7
>   xe-2903-9edc6ea87f86cbb6cda6b76d334c07492d0a8073: 9edc6ea87f86cbb6cda6b76d334c07492d0a8073
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12920/index.html
