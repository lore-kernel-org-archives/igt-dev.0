Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7948E7E0BC
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 16:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEFB10E438;
	Mon,  9 Feb 2026 16:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJT2EjHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A489C10E434;
 Mon,  9 Feb 2026 16:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770655012; x=1802191012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Bx86ZQIcgIxJ1dXdpFEZW0RsIhCW540omwnNkbJnhL0=;
 b=mJT2EjHUGfBrbRaEeWXEuQ7SOmE+U1xjUw+l6H/j5u5ophQ7znlDt2H+
 1ojUdLaytKLOSKqUcVueJRjQ9CBQ8PgV3mX9oVFl0NXRSXSvEIRm++6QD
 SzhFyGB2qBEu5Hd1mh9vGhZO/94kTsXZuF9SvhXrNncJSAu7W1dJT9YYu
 0zam9NoltvE0qmpLg3DuBqFN3ALLfl7zHT0/popKvxJapa79Y8nz7unNQ
 1KvXT/AUoisI/Nrlolg/vGuEop6GbHv/jeOkpLcRtRj7Ca210nnpWfX0x
 Fl4snPsG8EKuHELJTl7fgWsjxkVnZ9UkR9Lh75reMFJLphlhOFOHhNatc A==;
X-CSE-ConnectionGUID: B5Q+PQTOS3GEmKLe0hG6uw==
X-CSE-MsgGUID: lE5LYSDQSUe2eNOts2kPeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71871063"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71871063"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 08:36:51 -0800
X-CSE-ConnectionGUID: KFIVAgDORnKvchztbMB8CQ==
X-CSE-MsgGUID: RfxzRf2dSnajeKUh4Id7qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="234581404"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 08:36:50 -0800
Date: Mon, 9 Feb 2026 17:36:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xiandong Wang <xiandong.wang@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 series starting with [i-g-t,1/1] Skip kms_flip for mtk
Message-ID: <20260209163648.5nby7unbdraq5yyg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260209020357.32744-1-xiandong.wang@mediatek.com>
 <177060974481.236636.4671271850255238397@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177060974481.236636.4671271850255238397@a3b018990fe9>
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
On 2026-02-09 at 04:02:24 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/1] Skip kms_flip for mtk
> URL   : https://patchwork.freedesktop.org/series/161324/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8744_FULL -> XEIGTPW_14511_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14511_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14511_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14511_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8744/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14511/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-lnl:          [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8744/shard-lnl-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14511/shard-lnl-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 

Unrelated to kms_flip change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14511_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
...cut...
