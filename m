Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBBCC5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 10:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730F010FF31;
	Mon,  4 Mar 2024 10:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTIlVELL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1D510FF30;
 Mon,  4 Mar 2024 10:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709547115; x=1741083115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BypaX/S0+GNe/b/8fEF8JYhfxz3UsCY1KbjtbTm9IBA=;
 b=bTIlVELLr/KJDt0XLCRigosJxhqFc2Txu69SM00rHpa/J/HsAJYSRqjh
 /Ufc+l6lFESmel66Swd1+LGXvPUAraVbMrZ7agPNVjN35HRzky1cwA5Nt
 S7xgParrXDutogiW8L2jn772hzGaAnOcTuoEXX1TkQzD+3HHF0hLq3S/6
 TXd9z6dN14ErarhFieqcbOYUaN8skEATbMWTZYSmYszKMALbXXR1i7ThK
 gk/GLRZhWoXwygbPS4DlZLApq5KsqVBRbkAXvMwBWSnIq0+nfHaPCPE7k
 KiwYDZkB5QVEQuTw/auW+RIkbz+1jgVgyoJ+fqLFksep7shNV8525ZTfV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4193154"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4193154"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:11:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13608905"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 02:11:37 -0800
Date: Mon, 4 Mar 2024 11:11:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Finte?=
 =?utf-8?B?bC94ZV9jb21wdXRlX3ByZWVtcHQ6?= Add compute-preempt-many (rev2)
Message-ID: <20240304101134.xoeyegaautsi6pcm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240228162118.14654-1-nirmoy.das@intel.com>
 <170921102550.396148.17641583202168961094@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170921102550.396148.17641583202168961094@8e613ede5ea5>
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
On 2024-02-29 at 12:50:25 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_compute_preempt: Add compute-preempt-many (rev2)
> URL   : https://patchwork.freedesktop.org/series/130326/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7733_full -> IGTPW_10749_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10749_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10749_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10749_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@sysfs_timeslice_duration@timeout@vecs1:
>     - shard-dg2:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/shard-dg2-5/igt@sysfs_timeslice_duration@timeout@vecs1.html
> 

This is unreleted to new Xe subtest, no need for respin.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_7733_full and IGTPW_10749_full:
> 
> ### New IGT tests (16) ###
> 
>   * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.51] s
> 
>   * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.29] s
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.73] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-c-dp-4-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.48] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-c-dp-4-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.37] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-c-dp-4-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.58] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-d-dp-4-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.47] s
> 
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7733 -> IGTPW_10749
> 
>   CI-20190529: 20190529
>   CI_DRM_14360: 3bdccc6629ee909a167daedd6a8b75f6967ab726 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10749: 10749
>   IGT_7733: aef5f474230d00901e4e80da00ce696eb99f71e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/index.html
