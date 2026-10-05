Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F273CA5FCE
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 10:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B922510E08F;
	Mon,  5 Oct 2026 10:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jo5O60SS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A7A10E07C;
 Mon,  5 Oct 2026 10:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791196064; x=1822732064;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kb0K2PRGm2gETJFLzQqZAcQkV+rIWGWfnTBjrFY7x7A=;
 b=jo5O60SS3m8tVUbIbXXvwKHceDeuhM0CX1i6RAeZJSrD6vonkAQlIfdI
 ZzeQuI7EsNTloEeq4EyBaPM6G+X0TZq3Z03Ur2cVdFAcEX14vB9aM56Q8
 BlI9XyNzS9i3Cq1CJiDlCyLHXb8UdcGRRWvQ0FVygajvylz9W/Rc/Y0QS
 0SMZSQHoK8+hAmPTZF5phMNzSld7FqcdxCODcxG9TkFUxM7XDVb6j/Whp
 M/847oYRQo0AUMqBxhILEL6haXuUvsX+pk22NB/vFH9X+H38WhmGh0Gpv
 HDzsipH1GHDSwEItdoBEjuHzyVpQdf5Q8l2tWDzEC7U0oLCziNbuZG65J A==;
X-CSE-ConnectionGUID: 1TwJqhvFQ8OhUi4x3QaBGQ==
X-CSE-MsgGUID: N9BrVsoSQDel+DPcKd09dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="113641094"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="113641094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 03:27:44 -0700
X-CSE-ConnectionGUID: XoGVq7XGTSyX3EQm+oLilw==
X-CSE-MsgGUID: rz44DJLCTimw7hbmdqpKsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="273180201"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 03:27:42 -0700
Date: Mon, 5 Oct 2026 12:27:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 runner/executor: Fix writing endtime
Message-ID: <20261005102726.x2ej5qlpya7hj3wl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20261002130522.42708-1-kamil.konieczny@linux.intel.com>
 <179095580357.233267.10115965565999266056@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179095580357.233267.10115965565999266056@61270ab9df2a>
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
On 2026-10-02 at 15:43:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/executor: Fix writing endtime
> URL   : https://patchwork.freedesktop.org/series/175420/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9125_FULL -> XEIGTPW_15935_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15935_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15935_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15935_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
>     - shard-bmg:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9125/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15935/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
> 
>   

Unrelated,


Regards,
Kamil

> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_9125_FULL and XEIGTPW_15935_FULL:
> 
> ### New IGT tests (1) ###
> 
>   * igt@xe_tlb@basic-tlb:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.03] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15935_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2233])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15935/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#5765])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15935/shard-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
...cut...
