Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279FED6C299
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 20:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF89F10E369;
	Tue, 19 Nov 2024 20:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2RtKxCk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9861210E369
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 20:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732049228; x=1763585228;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t+hNkodFtpHTd4eP2CIpGh1j/pjJ0rQ/dgMusqDYW5s=;
 b=O2RtKxCkinCqhf+Bs4aQYy3tAx0RbfLa5HfRqK7hapGXtVeRPRGGarJu
 glpN6VevaFhYpWaQD00TOvohFbEKoQacylMS/5Z9XRtHkN5SBV/tLJUEc
 U5Pw3XnD/tzNDinm+75N7qtx30hOl+BEXk+hpkmsAVKQ17cds+Qih+xQa
 YaGIgzrpo2m5rpiQ/atwmMtOeb6sgk/o+YnQIr0nj5ZabAuTsgnIBpDxg
 H0DSEL76qgKtUd879iZB16oIa7SugVK312HJkthX7G0ek6bkMHWa9FdMt
 a0I33Z+MTueOcneruO2ygEedrBJnaPl9rSG406iFwHIbbMqbThPri0xGE g==;
X-CSE-ConnectionGUID: TpB6+jBuTWi74RDll/QvaQ==
X-CSE-MsgGUID: bbONnNRwRcC+c3TlNNfL1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31938302"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31938302"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 12:47:08 -0800
X-CSE-ConnectionGUID: vGLXg1gnTH2suD12dmr6qg==
X-CSE-MsgGUID: bb1rxATWQNKHL5jIjaQJ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="90072086"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 12:47:06 -0800
Date: Tue, 19 Nov 2024 21:47:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests=2Fsyncobj?=
 =?utf-8?B?X3dhaXQ6?= Update invalid-wait-zero-handles test (rev4)
Message-ID: <20241119204703.vxegpjleoritqkfn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
References: <20241118124422.11868-1-krzysztof.niemiec@intel.com>
 <173198054111.107654.12011343560311556000@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173198054111.107654.12011343560311556000@b555e5b46a47>
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
On 2024-11-19 at 01:42:21 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/syncobj_wait: Update invalid-wait-zero-handles test (rev4)
> URL   : https://patchwork.freedesktop.org/series/140727/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8115_BAT -> XEIGTPW_12127_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12127_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12127_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12127_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
> 

This is new test and it is present in CI.BAT for i915:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/index.html

However, when looking into combined Xe.BAT here:
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-all.html?
it is not present there.

Is xe-fast-feedback ignored or not updated in this combined view?

+cc Ewelina

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12127_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-lnl-1:          [PASS][3] -> [FAIL][4] ([Intel XE#886]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-adlp-7:         [PASS][5] -> [SKIP][6] ([Intel XE#3443] / [Intel XE#455]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][7] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][8] ([Intel XE#2229])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-adlp-vf:        [SKIP][9] ([Intel XE#1192]) -> [PASS][10] +1 other test pass
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_pat@pat-index-xelp@render:
>     - bat-adlp-vf:        [DMESG-WARN][11] ([Intel XE#358]) -> [PASS][12] +1 other test pass
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_live_ktest@xe_bo:
>     - bat-adlp-vf:        [SKIP][13] ([Intel XE#1192]) -> [SKIP][14] ([Intel XE#2229] / [Intel XE#455])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
> 
>   
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#3443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8115 -> IGTPW_12127
>   * Linux: xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4 -> xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
> 
>   IGTPW_12127: 12127
>   IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4: 6abefc8e3bf638090d5277bc3e6fd02bb25579a4
>   xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/index.html
