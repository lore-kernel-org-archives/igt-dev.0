Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29B3C10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 13:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4413910E4D7;
	Mon,  6 May 2024 13:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMNxWXag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F64A10E4D7
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002071; x=1746538071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dYaA2aIfJacbYRvaj8JdWSSeXOG1aZq9eO+CDXODpCE=;
 b=CMNxWXagAirsOaZieq9mOXc5tUS/QwohElcvfHUq6TJKstdUl3umEV/X
 an9+m3Jwrw2y2mw0NK4knAReD1x+w3eW1KpqQGvTogZBNU3hmu6xTE9MB
 AjH87WzKeVBgjugLHlUC9j9oNhZLhOj092GmqUktDq57oIvgzwz6OufPg
 5Yevx8s5odke6vAFwwaEI3Uhx+xuUVsvvl5tyodiP/L/n3weQ+2/ZlBz4
 6bpDEtEJkKEKkO3GFxsj+DDtD+jpL5YjIyuet+AyNyGyBugz5jdi+9fbd
 lMERjVh+jNIXFpEeQ6Ee7kOoTKoQAlpZOjq56MAQ4ysVOd17tqZl4bUam g==;
X-CSE-ConnectionGUID: TJtNitemSV+DldKVUj6Izw==
X-CSE-MsgGUID: 9T+X6P2WQ1CyMgg5eCyqwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22156955"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="22156955"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:27:50 -0700
X-CSE-ConnectionGUID: 9odzCI+cTgiQqkBLgBrAmQ==
X-CSE-MsgGUID: Q/XUk8y3R1SOcmCK6MXQtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="59347394"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:27:49 -0700
Date: Mon, 6 May 2024 15:27:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 igt_core: Update doc on generated test-list.txt
Message-ID: <20240506132746.cvmev453yl5a27jy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20240503115545.44784-2-gustavo.sousa@intel.com>
 <171476002968.1888398.12734648422607238234@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171476002968.1888398.12734648422607238234@8e613ede5ea5>
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
On 2024-05-03 at 18:13:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: igt_core: Update doc on generated test-list.txt
> URL   : https://patchwork.freedesktop.org/series/133168/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7832_full -> XEIGTPW_11094_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11094_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11094_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 1)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11094_full prevented too many machines from booting.
> 
>   Missing    (2): shard-adlp shard-lnl 

This is unrelated, no need for re-run.

Regards,
Kamil

> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11094_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@bad-pitch-128:
>     - shard-dg2-set2:     [PASS][1] -> [SKIP][2] ([Intel XE#1201] / [i915#6077]) +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7832/shard-dg2-435/igt@kms_addfb_basic@bad-pitch-128.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11094/shard-dg2-464/igt@kms_addfb_basic@bad-pitch-128.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7832 -> IGTPW_11094
> 
>   IGTPW_11094: 5f6f9614e9708e913fcb57efe83f193bb7e3cc67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7832: f4a19f8c3a506c6ef7241e80ed966230d18acb03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1235-3bc655eb4a31c9a89cccac484e09112f73414b29: 3bc655eb4a31c9a89cccac484e09112f73414b29
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133168v1/index.html
