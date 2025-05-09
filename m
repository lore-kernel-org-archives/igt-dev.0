Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A9DC3ABC9
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 07:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0BC10E9C8;
	Fri,  9 May 2025 07:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByqU2a8J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189EF10E9C8;
 Fri,  9 May 2025 07:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746775365; x=1778311365;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=t4e/pKuqLnM7m3EaZy+b+AJT8Q/++/20PZKzbsg32ng=;
 b=ByqU2a8JfnV4O8ln0bX2UR0yh4XoeJOapE9SN72aB3mOoTDJuZB39Y/4
 4ziKhQQ/U2xIEil9rlAvbJuhixfY50t/XzHay3oovB8QNpahctPkdEmo3
 b6h9gtrrfVhDdDtywkKxltSpS+mBgo59CIrRoXDei7R0j4RN0nG6gGo9T
 ZthKOqubSj1tSMO5UyXTh1+o+rE3L0msxgyAwAtPz8odroQF0VnuxSy4B
 lvNHFaVlMNpmwBfWQoljJR9144Mgf2w7Q1SDzLhzxRd2QO9ft9DW7w9Ay
 +jjCXKO0+GmEXSzT2ur2vUP/TsQYBWR+UszGnpIk4uhxI+8gqy18FcW69 w==;
X-CSE-ConnectionGUID: hGe0qkZGS9qozcY9fFoQiA==
X-CSE-MsgGUID: fQMRJOnPQ+aGrKGY4EMDUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59588861"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="59588861"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:22:44 -0700
X-CSE-ConnectionGUID: E6t8Qp8mTTKiYh3yrokTag==
X-CSE-MsgGUID: A2Q/Ysk5SnaKrOx6UMkBYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="159836199"
Received: from apalm-mobl1.ger.corp.intel.com (HELO [10.245.84.12])
 ([10.245.84.12])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:22:43 -0700
Message-ID: <842c530c-32ca-4e68-929b-c5c47dc9df38@linux.intel.com>
Date: Fri, 9 May 2025 09:22:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/sec=5Fxe=5Fexec=5Fqueue=5Ftimeslice=5Fabuse=3A_Validate_the_Impa?=
 =?UTF-8?Q?ct_of_Timeslice_Abuse_on_Exec_Queues_=28rev4=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250507104111.446923-1-peter.senna@linux.intel.com>
 <174676199038.61300.2485891886192652880@c664b1dc75d1>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174676199038.61300.2485891886192652880@c664b1dc75d1>
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

On 5/9/2025 5:39 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/sec_xe_exec_queue_timeslice_abuse: Validate the Impact of Timeslice Abuse on Exec Queues (rev4)
> URL   : https://patchwork.freedesktop.org/series/148581/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8357_FULL -> XEIGTPW_13095_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13095_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13095_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13095_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-lnl:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
>     - shard-dg2-set2:     [PASS][3] -> ([PASS][4], [ABORT][5]) +1 other test ( 1 abort, 1 pass )
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
>     - shard-lnl:          [PASS][6] -> ([FAIL][7], [FAIL][8])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
>     - shard-lnl:          NOTRUN -> ([ABORT][9], [ABORT][10])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][11] -> ([SKIP][12], [SKIP][13]) ([Intel XE#4596])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

These are unrelated to my change. Thank you.

[...]
