Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6CDCD4F47
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 15:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F0A10F55C;
	Fri, 15 May 2026 15:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brLKAvEw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8285710F55C;
 Fri, 15 May 2026 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778857603; x=1810393603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AAsZJKYKKGr2BMjhbnuQ/7AmJ/CnlSKttYgmKWoamFk=;
 b=brLKAvEwkaFzy9zXlZ7kvIzlPAAce+O8n9Z4ph46wfi8xXq8MsoZ+1X5
 HJ9105FQ9pQikWIsY4vGgXXhqjZjgh+zbbM2lJDEZH1QaWCV5rKk6fFe/
 bglWstm/xh8EgZ+DyW22S8Uizoz6DgfeCATTpuBRdwqTuxPNDQRf4hzez
 zoPFFxLbwjjMxE50GnPLN6k2GdkOzXbKuucsObPSQifLiBnui70aoyqaB
 NrMbmZBnsc62SLSr0QwAP2mg/Y5mJdVqt1FJsfpiUyLzX+gHTA+J1Q1wa
 FH9NvV+DWZsnjnJLLwf9EgE48UslNMM46SEYfQNkwlqq2DvHfK1X2up9z Q==;
X-CSE-ConnectionGUID: lvxbXQ0ES9+YVEWj/nEqig==
X-CSE-MsgGUID: C2027oG1RXey6p+I1Athzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79843069"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79843069"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 08:06:40 -0700
X-CSE-ConnectionGUID: ILJfpY8/Sqqiogu5VfvraQ==
X-CSE-MsgGUID: 3qd+Ow48TiGVx3GFP7jouQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="238968990"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 08:06:39 -0700
Date: Fri, 15 May 2026 17:06:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests=2Fv3d?=
 =?utf-8?Q?=5Fperfmon?= =?utf-8?Q?=3A?= Fix V3D 7.1 regression and extend
 perfmon testing (rev3)
Message-ID: <20260515150636.qhyvzxrzfkyqmnm5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260514201637.1811428-1-mcanal@igalia.com>
 <177885559273.74821.6299126110752091569@5ab824fced77>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177885559273.74821.6299126110752091569@5ab824fced77>
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
On 2026-05-15 at 14:33:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/v3d_perfmon: Fix V3D 7.1 regression and extend perfmon testing (rev3)
> URL   : https://patchwork.freedesktop.org/series/166215/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8912_FULL -> XEIGTPW_15186_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15186_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15186_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15186_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15186/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race.html
> 
>   * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
>     - shard-lnl:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-8/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15186/shard-lnl-3/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
>     - shard-bmg:          [PASS][5] -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15186/shard-bmg-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_sriov_vram@vf-access-after-resize-up:
>     - shard-bmg:          NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15186/shard-bmg-6/igt@xe_sriov_vram@vf-access-after-resize-up.html
> 

Unrelated to xe/i915, these changes were in v3d tests.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15186_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15186/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
...cut...
