Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66171CA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 13:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADB910E756;
	Tue,  9 Sep 2025 13:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOkVxvao";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531C610E756
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757426264; x=1788962264;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=igTtqCYKkAPL5zeq+ZOxYHUjEozSjSfABWn/N37A3kM=;
 b=LOkVxvaod3BmaOKXLiUHGtPBJf3W5ajKFDcoovO2fKdM7i7n/8jg2xnU
 JlnLTQCZei1+CtZO1/BjxPtg++D+U6R4Z5BztalKbH0Xx/OF8jVSypi34
 jDxdDhmNA83wdr9iyuFxFNqnOSKUzd84MDqXz9bY9kRrbRKu4RuBJnnNT
 gaRIOREs0eHVYWqQfBMMJtb1pa3w7r/Jwa/TaJxreg/Ehe+/3mq1YCNMn
 VNguuDoKgVJr5ng0nHCdf45KTgmEe279DagXAaERcK/eqDS6xmzUFEZfj
 k8MOPYVd4/FMLM8PivGGTWp/cmzGWr+QRS1JsmXiJKwRH+OUh0jzpFyJQ A==;
X-CSE-ConnectionGUID: 4eIlRgKNShOhYkls19GVyA==
X-CSE-MsgGUID: +t4rqEblTzyW+nx9dHY1Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77322503"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="77322503"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:57:44 -0700
X-CSE-ConnectionGUID: i+LRcrATSfyImmHhe4qP8A==
X-CSE-MsgGUID: NtV/NkGgTQ+zNBLsBK2RrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177438851"
Received: from unknown (HELO [172.28.180.113]) ([172.28.180.113])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:57:43 -0700
Message-ID: <a2edc50b-efcc-4c30-bb5a-95ff28c3010b@linux.intel.com>
Date: Tue, 9 Sep 2025 15:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBEb27igJl0IGFz?=
 =?UTF-8?Q?sume_sequential_GT_IDs?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20250908160723.1723178-1-marcin.bernatowicz@linux.intel.com>
 <175741460941.316360.9510237144998041036@1538d3639d33>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <175741460941.316360.9510237144998041036@1538d3639d33>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 9/9/2025 12:43 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: Don’t assume sequential GT IDs
> URL   : https://patchwork.freedesktop.org/series/154199/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8526_FULL -> XEIGTPW_13705_FULL
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_13705_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13705_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>    Missing    (1): shard-adlp
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in XEIGTPW_13705_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
>      - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8526/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13705/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
> 
>    * igt@xe_pm@s4-d3hot-basic-exec:
>      - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8526/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13705/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
> 

Not related to the change.
--
marcin

>    
> New tests
> ---------
> 
>    New tests have been introduced between XEIGT_8526_FULL and XEIGTPW_13705_FULL:
> 
> ### New IGT tests (3) ###
> 
>    * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [0.13] s
> 
>    * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [0.14] s
> 
>    * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [3.60] s
> 
>    
> 
> Known issues
> ------------
> 
[...]
