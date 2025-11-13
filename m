Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C661CD5BBB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 10:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09A610E632;
	Thu, 13 Nov 2025 10:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6556NcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E0C10E0DB;
 Thu, 13 Nov 2025 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763031344; x=1794567344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JhqEZtJ297dzUy3abn6AN+9YMEF4DlxoIRLN6Lx/lVQ=;
 b=W6556NcH1PQVsBuP3sFHAEQRN721Cv9zOwikWe+em5zn1ZFw1B5usaGH
 PDpyhmOK8tKmnJpArNITa1gYxG7FoICpWhXAFqqnVQ50JIwsmQRgnp0V8
 HxSGF7iIDHP7nCUFqFQrX9bnWe0McMIGjXBw4djUDeQ1strvXnzzK4IAv
 KIsxMsb+5kjAQlAeREJ34pL42Rx+8FzDcTOgSq08srvzz4kll0cDo142u
 qdF+DnY8bcb3FjiNWWgcVhVtU5rLY6RwJTlgeeNUp0aGUV3TLGkpXBVkM
 SFJCt8lEUhmvDcpsOUsqDUHh4kxYeNx4iwte5z8YRVVng9YUHKiC80tT1 w==;
X-CSE-ConnectionGUID: LoiyS6tKRsen1mdFm1FNiw==
X-CSE-MsgGUID: PN2RxKSwT5WjlwqKY5wmjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="67708636"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="67708636"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 02:55:43 -0800
X-CSE-ConnectionGUID: ZOMZ2r/pReWDp2e9f3QYog==
X-CSE-MsgGUID: BfnlLNMuQY+sB0hFVmwJwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193586654"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 02:55:43 -0800
Date: Thu, 13 Nov 2025 11:55:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 intel-ci: Block Panthor testing
Message-ID: <20251113105540.xyir7y7eep5tiilm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251112162834.12305-1-kamil.konieczny@linux.intel.com>
 <176302999958.49008.6785775568631268524@10055242dc62>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176302999958.49008.6785775568631268524@10055242dc62>
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
On 2025-11-13 at 10:33:19 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Block Panthor testing
> URL   : https://patchwork.freedesktop.org/series/157442/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8622_FULL -> XEIGTPW_14045_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14045_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14045_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14045_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8622/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14045/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][3] +1 other test timeout
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14045/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14045_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
...cut...
