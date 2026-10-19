Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABF1CCF2D5
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 11:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB44410E538;
	Mon, 19 Oct 2026 11:02:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332DD10EA3D
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792407701; x=1823943701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P6xfjLZUou0UrBWuxNQvpje+/LOJ+2gxBzHHugD9WKQ=;
 b=iKVBAyizGs2N3ynyOG/+2RY3yTO8NXEYD/AMnpGNrvawVKg/D7KFyfZw
 di/xZOh4U3yJJ9jFRFheqWqHCvwCJiZnrW2YNg9qs8e0iGWrFL9ICEKd4
 YIf3LEDRjSpOxLm6q2+IjaFDuRo8afa2+kPrdPXA2KDEzb5GT5Xm9cjfq
 MyJvgmXgUGks/sgz8mg4YzKzeMGRE2QqJzQCInL7D5d3YZTHiclGsKab5
 LU6XeYf+2g978+ein1mS8mEmoLHUcEZF17nKSdFNTaSvq+BL7lVBreGhW
 CNuTf/N48dTbyH5ieBjvBZpf4GjbAspF70aFRv+FKZ4eGuJjJ0NY6S0YM g==;
X-CSE-ConnectionGUID: eZ5B+5fMQ5qHcbEj71hqSA==
X-CSE-MsgGUID: cAiXHUTDQZO569rROqGS9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1192689"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1192689"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 04:01:41 -0700
X-CSE-ConnectionGUID: KXziDscERpiZ+UcOxCOQEw==
X-CSE-MsgGUID: 352nyAwzTXa6JJtKJy6ayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2843842"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 04:01:40 -0700
Date: Mon, 19 Oct 2026 13:01:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 panthor: add dev_query tests for userspace buffer
Message-ID: <20261019110123.rsr2isvcadb35nzv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Deborah Brouwer <deborah.brouwer@collabora.com>
References: <20261016-b4-dev_query-v2-0-067661858810@collabora.com>
 <179221258385.36801.14076858094873734928@221881a7231d>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179221258385.36801.14076858094873734928@221881a7231d>
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
On 2026-10-17 at 04:49:43 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: panthor: add dev_query tests for userspace buffer
> URL   : https://patchwork.freedesktop.org/series/176320/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9150_FULL -> XEIGTPW_16005_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_16005_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_16005_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_16005_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-ptl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9150/shard-ptl-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16005/shard-ptl-7/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-ptl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9150/shard-ptl-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16005/shard-ptl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms@plane-70:
>     - shard-ptl:          NOTRUN -> [FAIL][5] +2 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16005/shard-ptl-7/igt@kms_pm_rpm@legacy-planes-dpms@plane-70.html
> 
>   * igt@xe_pat@pat-sw-hw-suspend:
>     - shard-ptl:          NOTRUN -> [INCOMPLETE][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16005/shard-ptl-7/igt@xe_pat@pat-sw-hw-suspend.html
> 

Unrelated,

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_9150_FULL and XEIGTPW_16005_FULL:
> 
> ### New IGT tests (6) ###
> 
>   * igt@kms_invalid_mode@bad-hsync-start@pipe-d-dp-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.05] s
> 
>   * igt@kms_invalid_mode@zero-vdisplay@pipe-d-dp-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.02] s
> 
>   * igt@kms_sequence@get-busy@pipe-d-dp-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.56] s
> 
>   * igt@kms_vblank@query-forked@pipe-d-dp-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.36] s
> 
>   * igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-dp-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.41] s
> 
>   * igt@kms_vblank@wait-forked-busy@pipe-d-dp-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.51] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_16005_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1125] / [Intel XE#7312])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16005/shard-lnl-5/igt@intel_hwmon@hwmon-write.html
> 
...cut...
