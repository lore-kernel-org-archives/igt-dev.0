Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C47C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 17:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F47E10E7E4;
	Tue,  5 Mar 2024 17:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAO0BtRH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E371410E7E4;
 Tue,  5 Mar 2024 17:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709661037; x=1741197037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5yX9IclouCx0i72HWPGl9eQd1RfoW/bHlAY09EVz+k8=;
 b=PAO0BtRHa3ykE0R7HVtydajpMJwJBzCrb3H8UALct2AU2NB0arZ/kTjh
 dbqRT+Bjd7neb642RCBqbSF+5TD0aWPghcS84OjdMq8QINx3K9JXKdQNH
 AIleXH2OXv4VFGLoTN1jA+lhYGkeZcKcAXMIU5soqOJBBYAAYHybe20B9
 IF3cSfM3afg7NTN/qPHSrEXbJcavTiQjlPqvqDkfxpZvGTS4WlK6NjpjA
 kI6inKWNzJWV4YcRvRN7KXq+HhFw5NewOiRDmWxcAISLwvCOGb3jjZvf/
 0c9RhbTTs86yJIgCLuhKpG2anHyrwLMKjFOYo2Zk5FnBmzNc6RZpZak3i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4401641"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4401641"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:50:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9352817"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 09:50:23 -0800
Date: Tue, 5 Mar 2024 18:50:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: john.c.harrison@intel.com, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Finte?=
 =?utf-8?Q?l=2Fgem=5Fexec=5Fcapture?= =?utf-8?Q?=3A?= Check for partial
 register captures (rev2)
Message-ID: <20240305175020.owfzmpn4frw2n7yy@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, john.c.harrison@intel.com,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240229195522.2942946-1-John.C.Harrison@Intel.com>
 <170933449068.453612.2245101994274581916@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170933449068.453612.2245101994274581916@8e613ede5ea5>
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
On 2024-03-01 at 23:08:10 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_capture: Check for partial register captures (rev2)
> URL   : https://patchwork.freedesktop.org/series/130332/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14370_full -> IGTPW_10760_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10760_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10760_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10760_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_capture@capture@ccs3-smem:
>     - shard-dg2:          [PASS][1] -> [FAIL][2] +13 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg2-10/igt@gem_exec_capture@capture@ccs3-smem.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg2-6/igt@gem_exec_capture@capture@ccs3-smem.html
> 
>   * igt@gem_exec_capture@capture@rcs0-smem:
>     - shard-mtlp:         [PASS][3] -> [FAIL][4] +3 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-mtlp-8/igt@gem_exec_capture@capture@rcs0-smem.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-mtlp-6/igt@gem_exec_capture@capture@rcs0-smem.html
> 
>   * igt@gem_exec_capture@capture@vecs0-lmem0:
>     - shard-dg1:          [PASS][5] -> [FAIL][6] +3 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg1-13/igt@gem_exec_capture@capture@vecs0-lmem0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-19/igt@gem_exec_capture@capture@vecs0-lmem0.html
> 
>   * igt@gem_exec_capture@userptr:
>     - shard-dg1:          NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-18/igt@gem_exec_capture@userptr.html
> 

Above are bugs which were spotted by a change in test.

>   * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
>     - shard-dg1:          [PASS][8] -> [ABORT][9] +1 other test abort
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg1-15/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress@lmem0:
>     - shard-dg2:          [PASS][10] -> [ABORT][11] +1 other test abort
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg2-7/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html
> 
>   * igt@vgem_basic@unload:
>     - shard-glk:          [PASS][12] -> [INCOMPLETE][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-glk8/igt@vgem_basic@unload.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-glk7/igt@vgem_basic@unload.html
> 

These are unrelated.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14370_full and IGTPW_10760_full:
> 
> ### New IGT tests (4) ###
> 
>   * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.52] s
> 
>   * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.31] s
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.46] s
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.31] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10760_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 

...cut...

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/index.html
