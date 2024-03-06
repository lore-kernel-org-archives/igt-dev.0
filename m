Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD15C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 09:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9083A10FE87;
	Wed,  6 Mar 2024 09:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8lNJghl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FCB10FFD1;
 Wed,  6 Mar 2024 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709719041; x=1741255041;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=To28DcoI0EZnpWdXoNBmj3wYYXL0SS2ihfAft3EuVpY=;
 b=G8lNJghlU5eAyUvo4UqDwt5J5tcNTABqY8lAEE3oiT87vJXxHco4nKii
 d4hPcTinv9mr7Vytcpx9lsQ6DiiRojDJC6MMeJA5Dvb4sQU86ET8s9zJX
 cKOb/EP3vhRHCa4penvtP978ZpEyZT/zR583amT7lEhPv/eeofKUAaWr1
 apoBNQm7NM8Yyv64DlMALv98MnicXLK/NM80NHeeazf6Sp0DWwZSSmU3J
 CoabjuhFMuhLVRmD+Hiwp30Z6Z3Df0x+R2g0Ezs/1MKXEIgmX8seTaz/C
 rBJ3HuYOvEfpGXDJmYyogCmcVzWq7RIBaZI3fKTFn8aS1pFukcRUj6X/U A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4186267"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4186267"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 01:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="10097487"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 01:57:19 -0800
Date: Wed, 6 Mar 2024 10:57:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: John Harrison <john.c.harrison@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Finte?=
 =?utf-8?Q?l=2Fgem=5Fexec=5Fcapture?= =?utf-8?Q?=3A?= Check for partial
 register captures (rev2)
Message-ID: <20240306095716.wyvubkwb5h6j2qpj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 John Harrison <john.c.harrison@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240229195522.2942946-1-John.C.Harrison@Intel.com>
 <170933449068.453612.2245101994274581916@8e613ede5ea5>
 <20240305175020.owfzmpn4frw2n7yy@kamilkon-desk.igk.intel.com>
 <52567ff5-e174-4842-bfda-304ef3f8066b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52567ff5-e174-4842-bfda-304ef3f8066b@intel.com>
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

Hi John,
On 2024-03-05 at 10:07:21 -0800, John Harrison wrote:
> On 3/5/2024 09:50, Kamil Konieczny wrote:
> > Hi igt-dev,
> > On 2024-03-01 at 23:08:10 -0000, Patchwork wrote:
> > > == Series Details ==
> > > 
> > > Series: tests/intel/gem_exec_capture: Check for partial register captures (rev2)
> > > URL   : https://patchwork.freedesktop.org/series/130332/
> > > State : failure
> > > 
> > > == Summary ==
> > > 
> > > CI Bug Log - changes from CI_DRM_14370_full -> IGTPW_10760_full
> > > ====================================================
> > > 
> > > Summary
> > > -------
> > > 
> > >    **FAILURE**
> > > 
> > >    Serious unknown changes coming with IGTPW_10760_full absolutely need to be
> > >    verified manually.
> > >    If you think the reported changes have nothing to do with the changes
> > >    introduced in IGTPW_10760_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> > >    to document this new failure mode, which will reduce false positives in CI.
> > > 
> > >    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/index.html
> > > 
> > > Participating hosts (8 -> 8)
> > > ------------------------------
> > > 
> > >    No changes in participating hosts
> > > 
> > > Possible new issues
> > > -------------------
> > > 
> > >    Here are the unknown changes that may have been introduced in IGTPW_10760_full:
> > > 
> > > ### IGT changes ###
> > > 
> > > #### Possible regressions ####
> > > 
> > >    * igt@gem_exec_capture@capture@ccs3-smem:
> > >      - shard-dg2:          [PASS][1] -> [FAIL][2] +13 other tests fail
> > >     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg2-10/igt@gem_exec_capture@capture@ccs3-smem.html
> > >     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg2-6/igt@gem_exec_capture@capture@ccs3-smem.html
> > > 
> > >    * igt@gem_exec_capture@capture@rcs0-smem:
> > >      - shard-mtlp:         [PASS][3] -> [FAIL][4] +3 other tests fail
> > >     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-mtlp-8/igt@gem_exec_capture@capture@rcs0-smem.html
> > >     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-mtlp-6/igt@gem_exec_capture@capture@rcs0-smem.html
> > > 
> > >    * igt@gem_exec_capture@capture@vecs0-lmem0:
> > >      - shard-dg1:          [PASS][5] -> [FAIL][6] +3 other tests fail
> > >     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg1-13/igt@gem_exec_capture@capture@vecs0-lmem0.html
> > >     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-19/igt@gem_exec_capture@capture@vecs0-lmem0.html
> > > 
> > >    * igt@gem_exec_capture@userptr:
> > >      - shard-dg1:          NOTRUN -> [FAIL][7]
> > >     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-18/igt@gem_exec_capture@userptr.html
> > > 
> > Above are bugs which were spotted by a change in test.
> Correct, this is the test saying that the kernel is broken.
> 
> How does one know what build of the kernel the test was run against?
> Specifically, does it contain this patch:
> e45afbeb59347 drm/i915/guc: Correct capture of EIR register on hang

I merged it today, btw could you in future provide link(s)
to lore.kernel.org with kernel-side patch(es)?

Regards,
Kamil

> 
> 
> If not, then the test is expected to fail.
> 
> John.
> 
> > 
> > >    * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
> > >      - shard-dg1:          [PASS][8] -> [ABORT][9] +1 other test abort
> > >     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg1-15/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
> > >     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
> > > 
> > >    * igt@i915_pm_rpm@gem-execbuf-stress@lmem0:
> > >      - shard-dg2:          [PASS][10] -> [ABORT][11] +1 other test abort
> > >     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg2-7/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html
> > >     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html
> > > 
> > >    * igt@vgem_basic@unload:
> > >      - shard-glk:          [PASS][12] -> [INCOMPLETE][13]
> > >     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-glk8/igt@vgem_basic@unload.html
> > >     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-glk7/igt@vgem_basic@unload.html
> > > 
> > These are unrelated.
> > 
> > Regards,
> > Kamil
> > 
> > > New tests
> > > ---------
> > > 
> > >    New tests have been introduced between CI_DRM_14370_full and IGTPW_10760_full:
> > > 
> > > ### New IGT tests (4) ###
> > > 
> > >    * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-4:
> > >      - Statuses : 1 pass(s)
> > >      - Exec time: [3.52] s
> > > 
> > >    * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-dp-4:
> > >      - Statuses : 1 pass(s)
> > >      - Exec time: [3.31] s
> > > 
> > >    * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-4:
> > >      - Statuses : 1 pass(s)
> > >      - Exec time: [3.46] s
> > > 
> > >    * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-dp-4:
> > >      - Statuses : 1 pass(s)
> > >      - Exec time: [3.31] s
> > > 
> > > 
> > > Known issues
> > > ------------
> > > 
> > >    Here are the changes found in IGTPW_10760_full that come from known issues:
> > > 
> > > ### IGT changes ###
> > > 
> > > #### Issues hit ####
> > > 
> > ...cut...
> > 
> > > == Logs ==
> > > 
> > > For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/index.html
> 
