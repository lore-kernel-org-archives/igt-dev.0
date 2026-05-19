Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8094CD4F5B
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 12:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D6310ECA5;
	Tue, 19 May 2026 12:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nieepAAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB1C10ECA3
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 12:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779194855; x=1810730855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=elWhflHy2ZfdNxM8OHZ0uRwXvhyFInsgp4xcRHmA8yw=;
 b=nieepAAvISwSQh5QbhiKvbULNtkhUe2TwxKUSfn14T9iughAkQWrs4BV
 k5+13Pj3cqLq250Ny8mUc5s92nVwCBR3ze4rWXPxQzNlZbB/uhxL3rFwI
 dMnlLi3aa68VywKR4ehn7TRnP7KJte9ADBFRPz7WFsCTFPQ78eCKezqr8
 2dYRMMGanT+fd4ApJcp9BkC5cSStCE3tchIFQmT2jFcd0rrKHCWjohm+t
 U9SylOqVnT1Fpuwg5y5HoU9rEtlqj2NRGGjmMBxNixeW4zmqprej8DWuF
 QBmFIp4uqCu85rwLwez9lX9UiMf8VICcAcl5jLWBz4oug0TVjLduxOmid g==;
X-CSE-ConnectionGUID: v24Nes++RIqDZsUldaXwGA==
X-CSE-MsgGUID: IBfdp+nJQr+NXLYThlAoOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90650437"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="90650437"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:47:34 -0700
X-CSE-ConnectionGUID: 2K9pGVJ0RDeERwNC7M+RUw==
X-CSE-MsgGUID: hNkhFOY0SgS0U1kIFbPKoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239818957"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:47:33 -0700
Date: Tue, 19 May 2026 14:47:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/kms_cursor_crc: Add MediaTek platform support
Message-ID: <20260519124730.zkhrgehenvbma3jk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20260515072934.495031-1-jason-jh.lin@mediatek.com>
 <177890912509.75062.12069968254016012660@5ab824fced77>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177890912509.75062.12069968254016012660@5ab824fced77>
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
On 2026-05-16 at 05:25:25 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_cursor_crc: Add MediaTek platform support
> URL   : https://patchwork.freedesktop.org/series/166626/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8917_FULL -> XEIGTPW_15190_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15190_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15190_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_15190_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_sriov_vfio@region-info:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8917/shard-bmg-3/igt@xe_sriov_vfio@region-info.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15190/shard-bmg-3/igt@xe_sriov_vfio@region-info.html
> 
>   * igt@xe_vm@large-split-binds-4194304:
>     - shard-lnl:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8917/shard-lnl-2/igt@xe_vm@large-split-binds-4194304.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15190/shard-lnl-7/igt@xe_vm@large-split-binds-4194304.html
> 

Unrelated, this is non-Intel change in kms test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15190_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-3-x:
>     - shard-bmg:          [PASS][5] -> [ABORT][6] ([Intel XE#7814]) +1 other test abort
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8917/shard-bmg-10/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-3-x.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15190/shard-bmg-9/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-3-x.html
> 
...cut...
