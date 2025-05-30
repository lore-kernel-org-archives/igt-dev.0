Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F270C5AD49
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 14:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B894D10E128;
	Fri, 30 May 2025 14:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfjYo19K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C97B10E821
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748615233; x=1780151233;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vK2zXqCMlsA0rJIyq9TsqdDygdPacOOaVs4+d8XgDJA=;
 b=PfjYo19K6fhapK/AgtBFfQkLCfHfvlyCYzMvGG8iJGC+8XF1R7XT9Wja
 m8ZPo54bDC2TDxaFbOyCLSSXz7eiqFUy602Mvx2/KedZUy5Kzpie67j6W
 wLhCPIpccv2BV04Vag7fWPxL5jWX4ir306xkjpSKkAXqR9/5gYsOI5Fkx
 kfvlq5zwHVyjupoL2tFFqAIrfrMCRDgWOHPh6Fhw26cLitvORa7Pm/Zcm
 HyeyRyUoAULvb/LBRo1oFGamclDXBSHGuT5ZOn16TqQBZIiioLEFEiiy6
 /MPiYIYncE5Y6Rd10zg0rIuGxV27KYlECXPpdIbzlvj+Tc+XLhZMMedz9 g==;
X-CSE-ConnectionGUID: SA8v2S8fRdiTjDTiGrhu1Q==
X-CSE-MsgGUID: Ttzqo6NlRt6pEeHrRGiKFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49828092"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="49828092"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:27:12 -0700
X-CSE-ConnectionGUID: JoMOgnnxSPOzxpM6cPcyLA==
X-CSE-MsgGUID: QhJNkYkPSlKOg46ZwbvkSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="147768643"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 30 May 2025 07:27:11 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0BC3433EBF
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 15:27:09 +0100 (IST)
Message-ID: <5fbb0f13-ee0b-4dff-a42d-c575375fc64e@intel.com>
Date: Fri, 30 May 2025 16:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBVcGRhdGUgImZv?=
 =?UTF-8?Q?rce=5Freset=22_code_=28rev3=29?=
To: igt-dev@lists.freedesktop.org
References: <20250528212618.373-1-michal.wajdeczko@intel.com>
 <174859746893.34736.15610073226434757872@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174859746893.34736.15610073226434757872@1538d3639d33>
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



On 30.05.2025 11:31, Patchwork wrote:
> == Series Details ==
> 
> Series: Update "force_reset" code (rev3)
> URL   : https://patchwork.freedesktop.org/series/149607/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8384_FULL -> XEIGTPW_13211_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13211_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13211_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13211_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8384/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13211/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html

hmm, quite unexpected

<7>[  307.897676] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]]
                  	ASID: 101
                  	VFID: 0
                  	PDATA: 0x0450
                  	Faulted Address: 0x00007ba9d02b7000
                  	FaultType: 0
                  	AccessType: 1
                  	FaultLevel: 3
                  	EngineClass: 1 vcs
                  	EngineInstance: 0
<7>[  307.898010] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]] Fault
response: Unsuccessful -22
<6>[  307.898235] xe 0000:03:00.0: [drm] GT1: reset done
<7>[  307.898301] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]]
                  	ASID: 101
                  	VFID: 0
                  	PDATA: 0x0451
                  	Faulted Address: 0x0000793b1cacc000
                  	FaultType: 0
                  	AccessType: 0
                  	FaultLevel: 3
                  	EngineClass: 1 vcs
                  	EngineInstance: 2
<7>[  307.898523] xe 0000:03:00.0: [drm:xe_hw_engine_snapshot_capture
[xe]] GT1: Proceeding with manual engine snapshot
<7>[  307.898598] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]] Fault
response: Unsuccessful -22
<7>[  307.898620] xe 0000:03:00.0:
[drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT1: Engine memory
cat error: engine_class=vcs, logical_mask: 0x1, guc_id=2
<7>[  307.899910] xe 0000:03:00.0:
[drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT1: Engine memory
cat error: engine_class=vcs, logical_mask: 0x1, guc_id=3


given than the only difference from this patch is the way how we trigger
the reset, before it was "show" ops:

<6> [207.735904] [IGT] xe_exec_reset: starting subtest parallel-gt-reset
<6> [207.773630] xe 0000:03:00.0: [drm] GT1: trying reset from
force_reset_show [xe]

now it's "write" ops:

<6> [307.847469] [IGT] xe_exec_reset: starting subtest parallel-gt-reset
<6> [307.873879] xe 0000:03:00.0: [drm] GT1: trying reset from
force_reset_write [xe]


> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-bmg:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8384/shard-bmg-6/igt@xe_pm@s4-d3hot-basic-exec.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13211/shard-bmg-6/igt@xe_pm@s4-d3hot-basic-exec.html

unrelated to xe driver

<4> [373.000446] ======================================================
<4> [373.000460] WARNING: possible circular locking dependency detected
<4> [373.000475] 6.15.0-xe+ #1 Tainted: G     U           N
<4> [373.000490] ------------------------------------------------------
<4> [373.000503] kworker/u64:66/5057 is trying to acquire lock:
<4> [373.000518] ffffffff838b45a8 (rtnl_mutex){+.+.}-{3:3}, at:
rtnl_lock+0x17/0x30
<4> [373.000559]
but task is already holding lock:
<4> [373.000572] ffff8881149a3438 (&tp->control){+.+.}-{3:3}, at:
rtl8152_resume+0x26/0xd0 [r8152]
<4> [373.000612]
which lock already depends on the new lock.


