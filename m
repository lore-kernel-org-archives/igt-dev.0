Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC3CC47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 12:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ED610E6A7;
	Thu,  1 Feb 2024 12:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3oMnVjo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7A310E672;
 Thu,  1 Feb 2024 12:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706790232; x=1738326232;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=53oHy+hao3iRcEXA6bK8tgRGsJKdeZqa8J1BcBzlMlM=;
 b=L3oMnVjo6RfYnnvsVhTUNuurBxrQ0afzlvGm0YewBfsm7SDtWxJkXER/
 zZm1ucnW2UY6J1L9r9okFnybaWayaXln+dK4ptmsZBdJcG+N1EEZbYufQ
 4GvcX99j7LQdWOj6xeXJxxRCvwD/1vYaQgOYsxTmLh8xo1URiAv6RuA/8
 ZFzDdnc+c46gx7/aoSBIdFJ81rKHjru3+A/oYebSnOBiAWd51dysOt96F
 5qcioARfIHDpvel14AocZKWNUY5GPGhPAx1mU9rdl037kEeqhjns8vhbg
 sCnEjXpZY6NoQsGfOaLDSM9eEVRKxSDler2NtjT8lvflmVs+dw4Z+2aBn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10981580"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="10981580"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 04:23:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="912112182"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="912112182"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 04:23:47 -0800
Date: Thu, 1 Feb 2024 13:23:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 tests/intel/xe_exec_atomic: fix basic-inc-all
Message-ID: <20240201122326.kgtns5qv6hwbxuq2@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240129185412.114786-1-kamil.konieczny@linux.intel.com>
 <170676548863.878359.15527911393048127376@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170676548863.878359.15527911393048127376@5338d5abeb45>
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
On 2024-02-01 at 05:31:28 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_atomic: fix basic-inc-all
> URL   : https://patchwork.freedesktop.org/series/129279/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14192_full -> IGTPW_10600_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10600_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10600_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10600_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3-devices@smem:
>     - shard-tglu:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14192/shard-tglu-5/igt@gem_exec_suspend@basic-s3-devices@smem.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/shard-tglu-9/igt@gem_exec_suspend@basic-s3-devices@smem.html
> 
>   * igt@kms_flip@blocking-absolute-wf_vblank@d-hdmi-a2:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/shard-dg2-3/igt@kms_flip@blocking-absolute-wf_vblank@d-hdmi-a2.html
> 
>   * igt@kms_pm_rpm@cursor:
>     - shard-tglu:         [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14192/shard-tglu-7/igt@kms_pm_rpm@cursor.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/shard-tglu-8/igt@kms_pm_rpm@cursor.html
> 
>   * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
>     - shard-glk:          [PASS][6] -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14192/shard-glk3/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/shard-glk8/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
> 

Unrelated to Xe test change, no need for respin (patch already merged).

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10600_full that come from known issues:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7698 -> IGTPW_10600
> 
>   CI-20190529: 20190529
>   CI_DRM_14192: f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10600: 10600
>   IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/index.html
