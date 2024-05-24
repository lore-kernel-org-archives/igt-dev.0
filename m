Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0439C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 16:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2209110E701;
	Fri, 24 May 2024 16:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zz9ihqQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF8E10E2EA;
 Fri, 24 May 2024 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716568097; x=1748104097;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5IlOXAaOAQe+KiqpwZgXxYNQjMoZ2o1gygbfgq53tVA=;
 b=Zz9ihqQlO81XhdT+dSYIn7c9+A9jTpkFuA0YMeVAKbRqY++C+7KaUFiF
 +nFuOotmmc2tbvbMYEb2z80N0lvgTGS85crcHj3riP0dErIjZvQwrdKSt
 BbK+BqsBkzkq3Ko4C+EeAH1FVb/csxmpIz1w7uxAVTSuBh2OuorKNPIbF
 wwN16HaKId5WLxXEbo7QKk22+ojDRZVp85aj5DlrfJzkGgrJfBtPDvrQY
 LO5AX3/hRY+xsXF6eQiSQb9SWVxrB+1T/5iIRepJojZKp2XtY6hzHEotK
 4V9NIyvBtbKWfIRCH0aolDhms1nssjMvPgg86SGwSdH9JvjFEToBp5uNk g==;
X-CSE-ConnectionGUID: faR1Gp89Q92flWeFumkB4g==
X-CSE-MsgGUID: Lvkva4pEQK+v52G1NFhZHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13182515"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="13182515"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 09:28:16 -0700
X-CSE-ConnectionGUID: H7WsL54lSDywoE45bYvI4Q==
X-CSE-MsgGUID: qn2oyI3MTF6YQVkwnGHurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="38865178"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 09:28:15 -0700
Date: Fri, 24 May 2024 18:27:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/kms_sysfs_edid_timing: Skip the first detect (rev2)
Message-ID: <20240524162757.hdjjax73tv7uhc6e@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240523000409.284668-1-khaled.almahallawy@intel.com>
 <171643405944.2168995.2854578389703059241@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171643405944.2168995.2854578389703059241@8e613ede5ea5>
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
On 2024-05-23 at 03:14:19 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_sysfs_edid_timing: Skip the first detect (rev2)
> URL   : https://patchwork.freedesktop.org/series/133778/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7869_full -> XEIGTPW_11179_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11179_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11179_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 2)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11179_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-rmfb@c-dp4:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][1] +3 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11179/shard-dg2-434/igt@kms_flip@flip-vs-rmfb@c-dp4.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-rebind:
>     - shard-dg2-set2:     [PASS][2] -> [ABORT][3] +2 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/shard-dg2-464/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11179/shard-dg2-436/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][4] ([Intel XE#1201] / [Intel XE#651]) -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11179/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
> 
>   

Not related,

Regards,
Kamil

...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7869 -> IGTPW_11179
>   * Linux: xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921 -> xe-1330-b912a794bf8a370cde8be56c138f5c82de0dde8f
> 
>   IGTPW_11179: 11179
>   IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921: 42b9a14c5932c577019bf2f5d5ff25d208c1f921
>   xe-1330-b912a794bf8a370cde8be56c138f5c82de0dde8f: b912a794bf8a370cde8be56c138f5c82de0dde8f
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11179/index.html
