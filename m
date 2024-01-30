Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19D5C46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 09:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B99C10F869;
	Tue, 30 Jan 2024 09:03:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC5F10F869;
 Tue, 30 Jan 2024 09:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706605398; x=1738141398;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/1B1i5kh6MiLhtzbe11v/JdsTz5AxHFbc8fi5DJMrAg=;
 b=RFB1nGkdOwA3C21aVm+iPPxfaGJj06WCY7OImiKcYYAHTV38XGsObF33
 io736HqyIj5ZijaBNQNfpUftjrNZKHn5vAOyH8RBFdx1sPF3Qes3Gd7zO
 gsskBBtSxNP0oSMxPHq/lILJCBOWP7zgm/V2xLmAI8v7RfW839BTXuHHa
 BRnPmpLnhmWUt74QWTSCGqSgvZFHl+QU2ccOdQW/mHLR+JAwEfHL3xhBm
 XygWjq4kZQcrsSOR/mA4uUQD0Yp1Wwl1U3SZ5dpYSnGGqSsTIVC96frxy
 ir3lSUbDJl3jEWSw8z4O+8OAX5HYvKk36e/BBD8+uXNlmw5gf4BZ3gzsD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="3051931"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3051931"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 01:01:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931373878"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="931373878"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 01:01:37 -0800
Date: Tue, 30 Jan 2024 10:01:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 tests/intel/xe_exec_atomic: fix basic-inc-all
Message-ID: <20240130090135.m4wg7h53vgbtpbag@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240129185412.114786-1-kamil.konieczny@linux.intel.com>
 <170658173341.806672.5637046289530959242@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170658173341.806672.5637046289530959242@5338d5abeb45>
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
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-30 at 02:28:53 -0000, Patchwork wrote:
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

Unrelated to Xe test, no need for respin,

Regards,
Kamil

...cut...

>   [i915#9878]: https://gitlab.freedesktop.org/drm/intel/issues/9878
>   [i915#9906]: https://gitlab.freedesktop.org/drm/intel/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/intel/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/intel/issues/9934
> 
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
