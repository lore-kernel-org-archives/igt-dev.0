Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FDDCCD195
	for <igt-dev@archiver.kernel.org>; Fri, 17 Oct 2025 10:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF5B10EBA1;
	Fri, 17 Oct 2025 10:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDZ/0dzb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4734C10EBA0;
 Fri, 17 Oct 2025 10:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760696542; x=1792232542;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VLHNkUzST+8QHp6dlrHqL1Fc1Hegy/pN4ozswwvZbDY=;
 b=QDZ/0dzb+l2J9SfotJE4AqJCLVt84Se3fIjPB9JVGyrsUlwk6LUOo0ph
 tBEU4mqlN0hlyd14mJsML38eeI481UZ1FiQV6X5PAh2XTduGnxix6yKZC
 IOG3CoKud8gzVnIRQHoJZi0vbEQDBaolOLfZrYnwzzPl3mOEjVXbHI9QO
 n3ZnUGFCg0oYVcU7KJncWCpwxiWGYxWVjrohLibj2YMS52C4Imaivg9xc
 ueErKWe9KTisGoWc27W6pgFxmJ2IcOH6SKseClExneePoK0CtGH2fd2yi
 8mxKBHJiEmm9zrnlhVvEutaxoAmwzY7Er6hgQxtlggbyqQk184MI6y63B g==;
X-CSE-ConnectionGUID: oUYcV6G3QT2aV8yp5ezyQA==
X-CSE-MsgGUID: xfJA4e7HSyOfioAr58fbcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66769905"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="66769905"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 03:22:22 -0700
X-CSE-ConnectionGUID: g9/7nzX2TOm49hIj+yQAaA==
X-CSE-MsgGUID: coWfTPITQPOnkzYwBtzYmA==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 03:22:21 -0700
Date: Fri, 17 Oct 2025 12:22:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 tools/intel_gpu_top: Add iteration option -n
Message-ID: <20251017102218.5vtgfat2bq253xam@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251016095649.31446-1-kamil.konieczny@linux.intel.com>
 <176068140204.24656.2204377044054983822@97596180aaec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176068140204.24656.2204377044054983822@97596180aaec>
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
On 2025-10-17 at 06:10:02 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/intel_gpu_top: Add iteration option -n
> URL   : https://patchwork.freedesktop.org/series/156053/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8587_FULL -> XEIGTPW_13912_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13912_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13912_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13912_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-bmg:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8587/shard-bmg-7/igt@xe_pm@s3-d3hot-basic-exec.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13912/shard-bmg-3/igt@xe_pm@s3-d3hot-basic-exec.html
> 

Not related to change in tools. Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8587_FULL and XEIGTPW_13912_FULL:
> 
> ### New IGT tests (19) ###
> 
>   * igt@kms_invalid_mode@bad-hsync-start@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_invalid_mode@bad-vtotal@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_sequence@get-forked-busy@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.45] s
> 
>   * igt@kms_vblank@query-forked-busy-hang@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.41] s
> 
>   * igt@kms_vblank@query-forked-busy@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.42] s
> 
>   * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.24] s
> 
>   * igt@kms_vblank@ts-continuation-idle-hang@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@kms_vblank@ts-continuation-idle@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.25] s
> 
>   * igt@kms_vblank@ts-continuation-idle@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.24] s
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.13] s
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.07] s
> 
>   * igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.40] s
> 
>   * igt@kms_vblank@ts-continuation-modeset@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.36] s
> 
>   * igt@kms_vblank@wait-busy-hang@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.45] s
> 
>   * igt@kms_vblank@wait-busy-hang@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.41] s
> 
>   * igt@kms_vblank@wait-busy@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.44] s
> 
>   * igt@kms_vblank@wait-busy@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.41] s
> 
>   * igt@kms_vblank@wait-forked-hang@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.33] s
> 
>   * igt@kms_vblank@wait-forked-hang@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.30] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13912_FULL that come from known issues:

...cut...

