Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81260C52D7C
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 11:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA2010E048;
	Fri, 23 Aug 2024 11:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDImR//G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E4510E048;
 Fri, 23 Aug 2024 11:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724414352; x=1755950352;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TvXisGkFxnBna6H1OVzDPedS5b62eT+0DNnnOx7XfHU=;
 b=XDImR//GrWohXRz/IofLzJ0tju70Evk4Qaa57nM7pul3EUVMxQeiDJRt
 af1W5tCTJN+HX4/4USZoK/dHCZXmVuAQlryzSsP86pir5SWlQVqCvLqtR
 v+G6zB6VlaGVdIJeluAwhabw5kuvxMwHR/GLPgeh2ELDhohRdU3Ux4ZpU
 hNUkjWZ2yyijYSB9O9xVdxNPikPFst7Op7Q+hn85fekS5YOJEw3U3j7E2
 js1sNvIAipFbl7Geur68LNLAs/sB4SFcieSkG/nhVSCJLbaeimsuuElPn
 Utuv8ssj2dp7t0B4JFF95MOpACaXiydJKfKJblhIlHdRWWpAFqQ6KSQMy w==;
X-CSE-ConnectionGUID: mwL9P8wPQd+ZbFahAMlvUA==
X-CSE-MsgGUID: p1LboiJNSuSgGfAh3un25A==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23061590"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23061590"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 04:59:11 -0700
X-CSE-ConnectionGUID: CS37mUfxR5OSoGBgDXfp1w==
X-CSE-MsgGUID: imDqTUgLSx6KsMvWRpBMvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66601385"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 04:59:10 -0700
Date: Fri, 23 Aug 2024 13:59:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_runner?=
 =?utf-8?Q?=3A?= Allow dynamically ignore dmesg errors or warnings (rev6)
Message-ID: <20240823115907.yccdarvctlmmp3vz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240819103242.26527-1-kamil.konieczny@linux.intel.com>
 <172407779356.694772.13632190310733324245@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172407779356.694772.13632190310733324245@2413ebb6fbb6>
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
On 2024-08-19 at 14:29:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Allow dynamically ignore dmesg errors or warnings (rev6)
> URL   : https://patchwork.freedesktop.org/series/136494/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7975_full -> XEIGTPW_11595_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11595_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11595_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11595_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11595/shard-lnl-5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1.html
> 

This is unrelated,

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_content_protection@srm:
>     - {shard-bmg}:        [FAIL][3] ([Intel XE#1178]) -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-3/igt@kms_content_protection@srm.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11595/shard-bmg-1/igt@kms_content_protection@srm.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - {shard-bmg}:        [FAIL][5] ([Intel XE#2141]) -> [FAIL][6] +2 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11595/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - {shard-bmg}:        [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11595/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11595_full that come from known issues:
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7975 -> IGTPW_11595
>   * Linux: xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c -> xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94
> 
>   IGTPW_11595: 11595
>   IGT_7975: 7975
>   xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c: d6dac3db19935f5939cbb033eea30c90bdf3888c
>   xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94: 02f693a1a747b2784cedbbd7f6cf35be9a652d94
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11595/index.html
