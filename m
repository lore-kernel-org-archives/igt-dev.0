Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA915EB1053
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 11:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8199910E1F2;
	Tue, 10 Mar 2026 11:54:54 +0000 (UTC)
Received: from mgamail.intel.com (unknown [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9C710E1B6;
 Tue, 10 Mar 2026 11:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773143688; x=1804679688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fsK/K/8GDC+3Fjb8pK4woym/nV3KiiBerLcX5WXIuBo=;
 b=lQ7Crn4IM7r2UfQ/3i/d10sihdaeP7O+koUdcBs4ubfI9txnKWzimoYE
 cKsP8vAtQGtT8p0qIILMYziZhktxt4NWv1r2y1mIYeD4NM7Uxw8fWl4MG
 lKSScRs2Jf0Ny1bEkRfDK4ZySH5JjHyTltlqVVA/eU4+QbPuNxvezESEd
 n9y7AMuvcPCT7xVRShtyFmTkdhyZ8kQpBx5qeIusyvALCKYvGDOackMWB
 vSKdHTK2mUPcEsRhhboo4PNqckI0RjCWm/UYOov5PPX4cSj65MZMJf795
 Im4qJBMhRJOFA9ydbR1eC0K0lGexIH444K9puGIrEYI0hFE2LWJ89DjHo Q==;
X-CSE-ConnectionGUID: 8uUjrGNNSm2WrRvyIiqd5w==
X-CSE-MsgGUID: lYDOuJKnR9Gbakp7ENvQHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="77792681"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="77792681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:54:38 -0700
X-CSE-ConnectionGUID: C9SodmVCRM+/MjYPDn6j1A==
X-CSE-MsgGUID: pjJZ81A6T3ma3YMK10vqoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="220131195"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:54:36 -0700
Date: Tue, 10 Mar 2026 12:54:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 lib/vmwgfx: Fix null mob in vmw_ioctl_buffer_create.
Message-ID: <20260310115433.pz54xlz7ayoniqzw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
References: <20260309223937.1581808-1-maaz.mombasawala@broadcom.com>
 <177312376766.336878.5779872988453155494@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177312376766.336878.5779872988453155494@a3b018990fe9>
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
On 2026-03-10 at 06:22:47 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/vmwgfx: Fix null mob in vmw_ioctl_buffer_create.
> URL   : https://patchwork.freedesktop.org/series/162904/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8787_FULL -> XEIGTPW_14708_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14708_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14708_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14708_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8787/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14708/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@xe_exec_system_allocator@eu-fault-64k-range-device-host:
>     - shard-bmg:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8787/shard-bmg-9/igt@xe_exec_system_allocator@eu-fault-64k-range-device-host.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14708/shard-bmg-9/igt@xe_exec_system_allocator@eu-fault-64k-range-device-host.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
>     - shard-bmg:          [PASS][5] -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8787/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14708/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
> 

Unrelated, this is vmwgfx not an Intel driver.

Regards,
Kamil 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14708_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
...cut...
