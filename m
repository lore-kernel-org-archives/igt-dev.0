Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DD21098783
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1260E10E97C;
	Fri, 20 Mar 2026 13:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JI1Jvj//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A5910E97C;
 Fri, 20 Mar 2026 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774013027; x=1805549027;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gt4PN+Hc2CYBrxKA5NVIMCyEaaLWv9PXYxwxO0z9ApE=;
 b=JI1Jvj//M+ylo8JllHZLQBO9GTugf9fQ69PyTQO2xvwyCIKsY3g3/7Mk
 fI4jcGSwhjBbK0xfgFXcm3oyatlzOmvCXnhEZdk61ocxcpSVmS9IHNoQD
 UFVSOPb6VGcX4CEx1fkuZIjrXrP/ClWUbruorY4Ncn9bEJvS4dLHojAWc
 JQLfbRdHgJz4fM57ICeNRW9qpC9svtcheJBFojar7zBz1745dfgQ8EYyn
 E9jx8+XAG/8WQEJtyq3BHnNUhB3yWtajVkG9U9Q6xevHgIxY3pguvKKPb
 Xx1Mlz6vUIkveRcKX0cSc0t9gva0IptOhf96r2luz/3wigaXvEE885Pss A==;
X-CSE-ConnectionGUID: etBfrIt5Tt6whRb1scJYsw==
X-CSE-MsgGUID: atl73t1mQiO9jieOfOfVGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75006101"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75006101"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 06:23:47 -0700
X-CSE-ConnectionGUID: U4z+tOUXRXqvzdb956I66A==
X-CSE-MsgGUID: S9inafCZR4CyolTp3iF19Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="261189407"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 06:23:47 -0700
Date: Fri, 20 Mar 2026 14:23:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_fo?=
 =?utf-8?Q?r?= lib/uwildmat: Move to a dedicated vendored library directory
Message-ID: <20260320132329.qp2tmdbgstavbrwr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260319151542.52645-1-kamil.konieczny@linux.intel.com>
 <177400173437.379016.6834015907856587819@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177400173437.379016.6834015907856587819@a3b018990fe9>
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
On 2026-03-20 at 10:15:34 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/uwildmat: Move to a dedicated vendored library directory
> URL   : https://patchwork.freedesktop.org/series/163535/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8811_full -> IGTPW_14813_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14813_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14813_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14813/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14813_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gem_contexts:
>     - shard-mtlp:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8811/shard-mtlp-2/igt@i915_selftest@live@gem_contexts.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14813/shard-mtlp-8/igt@i915_selftest@live@gem_contexts.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][3] -> [ABORT][4] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8811/shard-tglu-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14813/shard-tglu-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> 

Not related.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14813_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-tglu-1:       NOTRUN -> [SKIP][5] ([i915#11078])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14813/shard-tglu-1/igt@device_reset@cold-reset-bound.html
> 
...cut...
