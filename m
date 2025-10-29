Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040D2CCF9E9
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 12:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A832710E7B0;
	Wed, 29 Oct 2025 12:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bP1ZwKeE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A8010E7AF;
 Wed, 29 Oct 2025 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761739490; x=1793275490;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0pMxsxiPKLqkupbAO693Q0NQV2qyHCKE7ZO2ipajxRo=;
 b=bP1ZwKeEahoBwVo3aikVf9r7ac1XYDPTPRN62iLZmUNCHkxMvgcbRzwt
 69cyxzWgZvhN6PJhcdUlSCX5+x661uIPt7ygld8PtaDuWaNUTesHZ+ay7
 8VXP8UTVvch+14U/AUE4nF1RF1H2PLrmVAOaci4VA4Ip8vELHVtXyUmEX
 UnfeFnVf7jNHY3uoi1Vv2tq7aIodXtsR0o/YWb2yLrEqqTB+3+e5p3YJe
 uxaTA7+DPAZhRPG2jOXafcL2gI2wHSDFI3ZmKL08TgxzzXZWNtAMQZCHk
 52VWTEvKttm6eQ+7FpeWJYtyJLVhPVUT+jI/zlCDlH4HFtxx3af1psMiH w==;
X-CSE-ConnectionGUID: TsQN3T0FSyWfvRXEC70g4w==
X-CSE-MsgGUID: j6DT6y+cShigiPlnMKJZsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63558699"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="63558699"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 05:04:50 -0700
X-CSE-ConnectionGUID: y9/UZ+VbSamOSZLUQhVpNQ==
X-CSE-MsgGUID: KgRYN0aOQcetZl8IM+CwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="216302140"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 05:04:49 -0700
Date: Wed, 29 Oct 2025 13:04:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Add MediaTek devices support (rev3)
Message-ID: <20251029120446.j4oghqibisrbm6ja@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20251028160738.3624415-1-jason-jh.lin@mediatek.com>
 <176170633590.65717.8826701516492832673@97596180aaec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176170633590.65717.8826701516492832673@97596180aaec>
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
On 2025-10-29 at 02:52:15 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add MediaTek devices support (rev3)
> URL   : https://patchwork.freedesktop.org/series/155789/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8599_full -> IGTPW_13957_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13957_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13957_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13957/index.html
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13957_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2-9:        [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8599/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13957/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html
> 

Unrelated.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8599_full and IGTPW_13957_full:
> 
> ### New IGT tests (12) ###
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.52] s
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.77] s
> 
>   * igt@syncobj_eventfd@binary-wait:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@syncobj_eventfd@binary-wait-before-signal:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.03] s
> 
>   * igt@syncobj_eventfd@binary-wait-signaled:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@syncobj_eventfd@invalid-bad-flags:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@syncobj_eventfd@invalid-bad-pad:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@syncobj_eventfd@invalid-illegal-eventfd:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@syncobj_eventfd@invalid-illegal-handle:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@syncobj_eventfd@timeline-wait:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@syncobj_eventfd@timeline-wait-before-signal:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03] s
> 
>   * igt@syncobj_eventfd@timeline-wait-signaled:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13957_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 

...cut...
