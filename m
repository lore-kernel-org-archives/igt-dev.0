Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5B2D68B19
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 13:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD9E10E092;
	Thu, 14 Nov 2024 13:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/YWh3AD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB2610E092;
 Thu, 14 Nov 2024 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731592639; x=1763128639;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=53qH7eOiPW2ePbqCYPc75/UG3cY/JPApIj+i34zM61o=;
 b=R/YWh3ADJHrMuSoqd0+P5JaqFtgH6RL5d6firu6mB1uh1mc8MKJIb56h
 /i/QfEp8fO6b6XiuZvmFwJAtWh3vTWr03YS/BchcgIvhAKOipFLKxZiGL
 Yn8hYQeelohWNKNU4C/AxfHEhRS/5HX6scMUN5xouYa3MZwBcuoZTTCp+
 0/jD4GYLuUhk/WC96v4fupgbIWTeWUYWsZu7IOQjIwoXBSMqsLhVRMTn+
 033DHp6syhpZ2iE7QBdyS00LkJDoGOsn6Pk3KLu04v8J9ebu3rip+/ujM
 6Nw88amvSO3IG1Ajbn30lEk1ff1eUcS+RzksJu3mwEgBz6v9fcowGe5e/ A==;
X-CSE-ConnectionGUID: WTp+LGuGTcGvVFDqDTBhSg==
X-CSE-MsgGUID: HFxswd7MQ6qjAIr547kZ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="30919494"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="30919494"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:57:19 -0800
X-CSE-ConnectionGUID: feaaEN0pSK+jiHcCF/9tfQ==
X-CSE-MsgGUID: TkOO+8MeT4KydXUYZd5ZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88603684"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.84.149])
 ([10.245.84.149])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:57:17 -0800
Message-ID: <1ae6f95f-eaf5-4d86-acef-196c04b9ee80@linux.intel.com>
Date: Thu, 14 Nov 2024 14:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel-ci?=
 =?UTF-8?Q?/xe-fast-feedback=3A_Add_SR-IOV_FLR_test?=
To: igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20241106182503.203956-1-jakub1.kolakowski@intel.com>
 <173103088072.1425292.5297072118900844641@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <173103088072.1425292.5297072118900844641@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 11/8/2024 2:54 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel-ci/xe-fast-feedback: Add SR-IOV FLR test
> *URL:*	https://patchwork.freedesktop.org/series/141020/ <https:// 
> patchwork.freedesktop.org/series/141020/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8099_full -> XEIGTPW_12052_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_12052_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12052_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12052_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_color@ctm-0-75@pipe-b-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-8/igt@kms_color@ctm-0-75@pipe-b-edp-1.html> -
>          > DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12052/shard-lnl-1/igt@kms_color@ctm-0-75@pipe-b-edp-1.html>
>   *
> 
>     igt@kms_content_protection@legacy@pipe-a-dp-5:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-466/
>         igt@kms_content_protection@legacy@pipe-a-dp-5.html> +1 other
>         test fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-
>         a6-dp4.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-
>         hdmi-a6-dp4.html>
>   *
> 
>     igt@kms_plane_lowres@tiling-none@pipe-c-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-434/
>         igt@kms_plane_lowres@tiling-none@pipe-c-dp-4.html> +1 other test
>         dmesg-warn
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-
>         rpm@pipe-d-hdmi-a-3.html> -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-bmg-5/
>         igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html> +3
>         other tests incomplete
>   *
> 
>     igt@xe_exec_compute_mode@many-rebind:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-6/igt@xe_exec_compute_mode@many-rebind.html>
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-bmg-8/igt@xe_exec_compute_mode@many-rebind.html>

Not related to the change.
--
marcin

> 
> 
>         Warnings
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-pri-
>         indfb-multidraw.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-
>         multidraw.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * {igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5}:
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-466/igt@kms_flip@2x-flip-vs-
>         expired-vblank@bc-hdmi-a6-dp5.html> +4 other tests fail
> 
> 
>     New tests
> 
> New tests have been introduced between XEIGT_8099_full and 
> XEIGTPW_12052_full:
> 
> 
>       New IGT tests (7)
> 
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.57] s
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.37] s
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.54] s
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.50] s
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.51] s
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.52] s
>   *
> 
>     igt@kms_lease@lease-invalid-crtc@pipe-d-dp-5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_12052_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-463/igt@kms_async_flips@alternate-sync-async-
>         flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12052/shard-dg2-433/igt@kms_async_flips@alternate-sync-
>         async-flip.html> (Intel XE#827 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/827>) +1 other test fail
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-
>     a-6-4-mc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-433/
>         igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-
>         hdmi-a-6-4-mc-ccs.html> (Intel XE#2550 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2550>) +23 other
>         tests skip
>   *
> 
>     igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-432/igt@kms_atomic_interruptible@atomic-
>         setmode@pipe-a-hdmi-a-6.html> -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-434/
>         igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-
>         a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1195>) +1 other test incomplete
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-4/igt@kms_atomic_transition@modeset-
>         transition-nonblocking-fencing.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-lnl-1/
>         igt@kms_atomic_transition@modeset-transition-nonblocking-
>         fencing.html> (Intel XE#1701 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1701>) +1 other test fail
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-5/igt@kms_atomic_transition@plane-all-
>         modeset-transition@pipe-a-dp-2.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-bmg-7/
>         igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-
>         dp-2.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1426>) +1 other test fail
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-
>         rotate-90.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>) +1 other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-435/igt@kms_big_fb@4-
>         tiled-32bpp-rotate-90.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +3 other tests
>         skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-
>         stride-32bpp-rotate-180-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-433/igt@kms_big_fb@yf-tiled-
>         max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>) +9 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-466/igt@kms_bw@connected-
>         linear-tiling-3-displays-3840x2160p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-6/igt@kms_bw@connected-linear-
>         tiling-4-displays-3840x2160p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>) +1 other test skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-433/igt@kms_bw@linear-
>         tiling-3-displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +3 other tests
>         skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-
>         tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-464/igt@kms_ccs@bad-pixel-
>         format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +204
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-434/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html> (Intel
>         XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/616>) +5 other tests fail
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-464/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-lnl-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +8 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-435/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> (Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#2692 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2692>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-
>         dp-4.html> (Intel XE#3113 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3113>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-
>         a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1195> / Intel XE#3124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3124>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-435/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-
>         a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1195> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-5:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-466/igt@kms_ccs@random-ccs-
>         data-y-tiled-gen12-rc-ccs@pipe-d-dp-5.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +38 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-433/igt@kms_cdclk@plane-
>         scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-466/
>         igt@kms_chamelium_color@gamma.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-single:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-435/
>         igt@kms_chamelium_frames@dp-crc-single.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +8
>         other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-fast:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-
>         fast.html> (Intel XE#2252 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2252>) +5 other tests skip
>   *
> 
>     igt@kms_color@ctm-0-75@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-8/igt@kms_color@ctm-0-75@pipe-a-edp-1.html> -
>          > DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12052/shard-lnl-1/igt@kms_color@ctm-0-75@pipe-a-
>         edp-1.html> (Intel XE#2929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2929>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-8/
>         igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test
>         fail
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-464/
>         igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test
>         fail
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-5/igt@kms_cursor_crc@cursor-
>         onscreen-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-435/
>         igt@kms_cursor_crc@cursor-sliding-max-size.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +14
>         other tests skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-6/igt@kms_cursor_crc@cursor-
>         sliding-max-size.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-
>         atomic-transitions-varying-size.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-bmg-2/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> (Intel XE#877 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>   *
> 
>     igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-
>         cursor-atomic-transitions.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-lnl-5/
>         igt@kms_cursor_legacy@short-flip-before-cursor-atomic-
>         transitions.html> (Intel XE#1541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1541>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-7/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2244>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-5/igt@kms_feature_discovery@dp-
>         mst.html> (Intel XE#2375 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2375>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-464/
>         igt@kms_feature_discovery@dp-mst.html> (Intel XE#1137 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-435/
>         igt@kms_feature_discovery@psr2.html> (Intel XE#1135 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-435/igt@kms_flip@2x-flip-vs-
>         expired-vblank-interruptible@cd-hdmi-a6-dp4.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +9
>         other tests fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-3/igt@kms_flip@2x-flip-vs-
>         expired-vblank@cd-dp2-hdmi-a3.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1 other test fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html> ->
>         ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html> (Intel
>         XE#2625 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>)
>   *
> 
>     igt@kms_flip@blocking-wf_vblank@a-dp2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-7/igt@kms_flip@blocking-wf_vblank@a-dp2.html>
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-bmg-5/igt@kms_flip@blocking-wf_vblank@a-dp2.html> (Intel
>         XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>) +1 other test fail
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate@a-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@a-
>         edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12052/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-
>         edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/886>) +1 other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html>
>         (Intel XE#3189 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3189>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2333>) +5 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel
>         XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2313>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +22 other tests skip
>   *
> 
>     igt@kms_getfb@getfb-reject-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-5/igt@kms_getfb@getfb-reject-
>         ccs.html> (Intel XE#2502 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2502>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-435/igt@kms_getfb@getfb-
>         reject-ccs.html> (Intel XE#605 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/605>)
>   *
> 
>     igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-464/igt@kms_hdr@brightness-
>         with-hdr@pipe-a-hdmi-a-6.html> (Intel XE#3312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3312>) +1 other test
>         fail
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-463/igt@kms_hdr@invalid-hdr.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-433/igt@kms_hdr@invalid-hdr.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-8/igt@kms_hdr@invalid-hdr.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         bmg-6/igt@kms_hdr@invalid-hdr.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-433/
>         igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
>         (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/361>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-464/
>         igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>         modifiers@pipe-d.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>     format@pipe-b:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-432/
>         igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>         format@pipe-b.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +11 other
>         tests skip
>   *
> 
>     igt@kms_pm_backlight@fade-with-dpms:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-435/
>         igt@kms_pm_backlight@fade-with-dpms.html> (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_rpm@dpms-lpsp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html>
>         (Intel XE#1439 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1439> / Intel XE#3141 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3141>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-464/igt@kms_psr2_sf@fbc-
>         psr2-cursor-plane-move-continuous-exceed-fully-sf.html> (Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +5 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-move-continuous-exceed-sf.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-7/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> (Intel XE#2387 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2387>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-434/
>         igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-435/igt@kms_psr@fbc-psr-
>         sprite-plane-onoff.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +7
>         other tests skip
>   *
> 
>     igt@kms_psr@psr-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-5/igt@kms_psr@psr-basic.html>
>         (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2850>) +5 other tests skip
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-433/
>         igt@kms_rotation_crc@bad-tiling.html> (Intel XE#327 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-2/igt@kms_tiled_display@basic-
>         test-pattern.html> (Intel XE#2426 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-5/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-c-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-lnl-7/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html> (Intel
>         XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@kms_vrr@flip-basic-fastset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-4/igt@kms_vrr@flip-basic-
>         fastset.html> (Intel XE#1499 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1499>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many@engine-
>     drm_xe_engine_class_compute:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-434/
>         igt@xe_compute_preempt@compute-preempt-many@engine-
>         drm_xe_engine_class_compute.html> (Intel XE#1280 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-434/
>         igt@xe_drm_fdinfo@utilization-single-full-load-destroy-
>         queue.html> (Intel XE#2667 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2667>)
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-extended-discovery:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-435/igt@xe_eudebug@basic-vm-
>         bind-extended-discovery.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +7 other
>         tests skip
>   *
> 
>     igt@xe_eudebug@discovery-race:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-3/igt@xe_eudebug@discovery-
>         race.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2905>) +1 other test skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-432/igt@xe_evict@evict-beng-
>         mixed-many-threads-large.html> (Intel XE#1000 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-4/igt@xe_exec_basic@multigpu-
>         once-bindexecqueue-userptr-invalidate.html> (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +4
>         other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-8/igt@xe_exec_fault_mode@many-
>         bindexecqueue-userptr-invalidate-race.html> (Intel XE#1630
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>)
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-
>         userptr-invalidate-race-prefetch.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-lnl-5/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-
>         prefetch.html> (Intel XE#1630 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1630>) +4 other tests fail
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-
>         invalidate-race.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-7/igt@xe_exec_fault_mode@many-
>         userptr-invalidate-race.html> (Intel XE#1630 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1630>)
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-466/
>         igt@xe_exec_fault_mode@twice-userptr-prefetch.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +17 other tests skip
>   *
> 
>     igt@xe_exec_reset@parallel-close-execqueues-close-fd:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-7/igt@xe_exec_reset@parallel-close-
>         execqueues-close-fd.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-bmg-8/
>         igt@xe_exec_reset@parallel-close-execqueues-close-fd.html>
>         (Intel XE#1081 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1081>)
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-464/
>         igt@xe_exec_reset@parallel-close-execqueues-close-fd.html>
>         (Intel XE#1081 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1081>)
>   *
> 
>     igt@xe_live_ktest@xe_mocs:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-8/igt@xe_live_ktest@xe_mocs.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         lnl-7/igt@xe_live_ktest@xe_mocs.html> (Intel XE#1192 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>   *
> 
>     igt@xe_module_load@reload-no-display:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-3/igt@xe_module_load@reload-no-display.html>
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-bmg-2/igt@xe_module_load@reload-no-display.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-432/igt@xe_module_load@reload-no-
>         display.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-463/igt@xe_module_load@reload-no-
>         display.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136>)
>   *
> 
>     igt@xe_oa@mmio-triggered-reports:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-463/igt@xe_oa@mmio-
>         triggered-reports.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +6 other
>         tests skip
>   *
> 
>     igt@xe_pm@d3cold-mocs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-463/igt@xe_pm@d3cold-
>         mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284>)
>   *
> 
>     igt@xe_pm@s2idle-basic:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-432/igt@xe_pm@s2idle-
>         basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1358> / Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s2idle-basic-exec:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html> ->
>         ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm@s3-mocs:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-463/igt@xe_pm@s3-mocs.html> -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-432/igt@xe_pm@s3-mocs.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-basic:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-4/igt@xe_pm@s4-basic.html> -> ABORT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-lnl-2/
>         igt@xe_pm@s4-basic.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>   *
> 
>     igt@xe_query@multigpu-query-gt-list:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-bmg-5/igt@xe_query@multigpu-query-gt-
>         list.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-464/igt@xe_query@multigpu-
>         query-uc-fw-version-guc.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2 other tests
>         skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_getversion@all-cards:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@core_getversion@all-cards.html> ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-dg2-434/igt@core_getversion@all-cards.html>
>   *
> 
>     igt@fbdev@unaligned-write:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@fbdev@unaligned-write.html> (Intel
>         XE#2134 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2134>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-466/igt@fbdev@unaligned-write.html>
>   *
> 
>     igt@kms_atomic_interruptible@legacy-pageflip:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8099/shard-dg2-435/
>         igt@kms_atomic_interruptible@legacy-pageflip.html> (Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-464/
>         igt@kms_atomic_interruptible@legacy-pageflip.html> +3 other
>         tests pass
>   *
> 
>     igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-dp-2:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8099/shard-bmg-8/igt@kms_atomic_interruptible@legacy-
>         pageflip@pipe-a-dp-2.html> -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-bmg-8/
>         igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-dp-2.html>
>         +3 other tests pass
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_atomic_transition@modeset-
>         transition-nonblocking-fencing.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-dg2-466/igt@kms_atomic_transition@modeset-transition-
>         nonblocking-fencing.html> +101 other tests pass
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8099/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-
>         varying-size.html> (Intel XE#877 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>   *
> 
>     igt@kms_cursor_legacy@torture-move@pipe-b:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8099/shard-dg2-464/igt@kms_cursor_legacy@torture-
>         move@pipe-b.html> (Intel XE#2932 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2932>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-464/igt@kms_cursor_legacy@torture-move@pipe-b.html> +1 other
>         test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible@bd-dp2-hdmi-a3.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-
>         dp2-hdmi-a3.html> +5 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-4/igt@kms_flip@flip-vs-absolute-
>         wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-lnl-3/igt@kms_flip@flip-vs-
>         absolute-wf_vblank.html> +3 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@a-dp4.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-
>         dp4.html> +6 other tests pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-
>         to-64bpp-xtile-upscaling.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-
>         xtile-to-64bpp-xtile-upscaling.html> +12 other tests pass
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-
>         rgb101010-draw-mmap-wc.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-
>         wc.html> +31 other tests pass
>   *
> 
>     igt@kms_plane_cursor@primary:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-8/igt@kms_plane_cursor@primary.html> (Intel
>         XE#1471 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1471> / Intel XE#1874 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-lnl-7/
>         igt@kms_plane_cursor@primary.html>
>   *
> 
>     igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-8/igt@kms_plane_cursor@primary@pipe-b-edp-1-
>         size-128.html> (Intel XE#1874 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-lnl-7/
>         igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html>
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-
>         size@pipe-a-hdmi-a-6.html> (Intel XE#361 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/361>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-
>         a-6.html>
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (Intel XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2446>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-463/igt@kms_pm_rpm@modeset-non-
>         lpsp.html> +6 other tests pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-5/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-a-edp-1.html> (Intel XE#899 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
>         +1 other test pass
>   *
> 
>     igt@xe_exec_basic@many-null-rebind:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-464/igt@xe_exec_basic@many-null-
>         rebind.html> +205 other tests pass
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>     invalidate-race-imm:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-
>         bindexecqueue-userptr-invalidate-race-imm.html> (Intel XE#1630
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-
>         bindexecqueue-userptr-invalidate-race-imm.html>
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-
>         userptr-invalidate-race.html> (Intel XE#1630 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1630>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         bmg-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-
>         race.html> +1 other test pass
>   *
> 
>     igt@xe_oa@mmio-triggered-reports:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-7/igt@xe_oa@mmio-triggered-reports.html>
>         (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2249>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-lnl-6/igt@xe_oa@mmio-triggered-
>         reports.html> +1 other test pass
>   *
> 
>     igt@xe_oa@oa-regs-whitelisted:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted.html> (Intel
>         XE#2514 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2514>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html>
>         +1 other test pass
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted.html> (Intel
>         XE#2514 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2514>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-bmg-6/igt@xe_oa@oa-regs-whitelisted.html>
>   *
> 
>     igt@xe_pm@s3-exec-after:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8099/shard-dg2-432/igt@xe_pm@s3-exec-after.html> (Intel
>         XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-433/igt@xe_pm@s3-exec-after.html>
>   *
> 
>     igt@xe_pm_residency@toggle-gt-c6:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html>
>         (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/958>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12052/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_big_fb@linear-16bpp-
>         rotate-90.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html> (Intel
>         XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/316>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_big_fb@linear-64bpp-
>         rotate-180.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html> (Intel
>         XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-
>         rotate-270.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-433/
>         igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-
>         overflow.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/607>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-
>         overflow.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-435/
>         igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-
>         stride-32bpp-rotate-0-hflip.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-
>         stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-
>         rotate-180.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-464/
>         igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6
>         other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-
>         displays-3840x2160p.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-
>         displays-3840x2160p.html> (Intel XE#2191 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +3 other
>         tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_bw@linear-tiling-2-
>         displays-2560x1440p.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-dg2-464/igt@kms_bw@linear-tiling-2-
>         displays-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-
>         rc-ccs.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-433/igt@kms_ccs@bad-aux-
>         stride-y-tiled-gen12-rc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +17
>         other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-
>         gen12-rc-ccs.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-
>         tiled-gen12-rc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +2
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-
>         tiled-bmg-ccs.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-
>         ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2907>) +1 other test skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-
>         rc-ccs-cc.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_chamelium_color@ctm-green-to-red:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-
>         red.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-433/
>         igt@kms_chamelium_color@ctm-green-to-red.html> (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
>         other test skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-432/
>         igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +11 other
>         tests skip
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_content_protection@legacy.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-466/
>         igt@kms_content_protection@legacy.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/308>) +5 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>     transitions-varying-size:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-
>         before-cursor-atomic-transitions-varying-size.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-466/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions-varying-size.html> (Intel XE#323 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-466/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-
>         edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/886>) -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-lnl-6/igt@kms_flip@flip-vs-blocking-
>         wf-vblank@b-edp1.html> (Intel XE#2422 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2422>) +1 other test
>         fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-
>         yftile-to-32bpp-yftileccs-downscaling.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-
>         yftile-to-32bpp-yftileccs-downscaling.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-
>         to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +6 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-
>         primscrn-cur-indfb-onoff.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +29 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-
>         y.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel
>         XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-
>         primscrn-pri-shrfb-draw-blt.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-
>         rte.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-
>         primscrn-shrfb-msflip-blt.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-
>         primscrn-shrfb-plflip-blt.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-
>         plflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/653>) +31 other tests skip
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-464/
>         igt@kms_hdr@brightness-with-hdr.html> (Intel XE#3312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3312>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-
>         joiner.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-433/igt@kms_joiner@invalid-
>         modeset-ultra-joiner.html> (Intel XE#2927 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-
>         factor-0-25-with-pixel-format.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-
>         with-pixel-format.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>   *
> 
>     igt@kms_pm_backlight@brightness-with-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_pm_backlight@brightness-with-
>         dpms.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-434/
>         igt@kms_pm_backlight@brightness-with-dpms.html> (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-433/
>         igt@kms_pm_dc@dc6-dpms.html> (Intel XE#908 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-463/
>         igt@kms_pm_dc@dc6-psr.html> (Intel XE#1129 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html> (Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/908>)
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-
>         update-sf-dmg-area.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-466/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-
>         area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1489>) +9 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-
>         onoff.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-464/igt@kms_psr@fbc-psr2-
>         sprite-plane-onoff.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +13
>         other tests skip
>   *
> 
>     igt@kms_psr@psr-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_psr@psr-dpms.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-432/igt@kms_psr@psr-dpms.html> (Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +3 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_psr_stress_test@invalidate-
>         primary-flip-overlay.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-
>         overlay.html> (Intel XE#2939 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2939>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-
>         reflect-x-90.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/
>         shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-
>         x-90.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/327>) +2 other tests skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_tiled_display@basic-test-
>         pattern.html> (Intel XE#2423 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-433/igt@kms_tiled_display@basic-test-pattern.html> (Intel
>         XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-
>         with-chamelium.html> (Intel XE#362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/362>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-432/igt@kms_tiled_display@basic-test-pattern-with-
>         chamelium.html> (Intel XE#1500 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1500>)
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-466/
>         igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>   *
> 
>     igt@kms_vrr@flip-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_vrr@flip-dpms.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-466/
>         igt@kms_vrr@flip-dpms.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +8 other tests
>         skip
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@kms_writeback@writeback-invalid-
>         parameters.html> (Intel XE#2423 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-434/igt@kms_writeback@writeback-invalid-parameters.html>
>         (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/756>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-
>         many.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-434/
>         igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_copy_basic@mem-copy-
>         linear-0xfffe.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel
>         XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1123>) +1 other test skip
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfd:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_copy_basic@mem-set-
>         linear-0xfd.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel
>         XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_eudebug@basic-close:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_eudebug@basic-close.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-433/igt@xe_eudebug@basic-close.html>
>         (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2905>) +12 other tests skip
>   *
> 
>     igt@xe_evict@evict-large-multi-vm-cm:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-
>         cm.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1130>) -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-dg2-433/igt@xe_evict@evict-large-
>         multi-vm-cm.html> (Intel XE#1600 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-
>         bindexecqueue-rebind-imm.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-
>         rebind-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/288>) +28 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-
>         interrupted-lr.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-
>         dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html>
>         (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2360>)
>   *
> 
>     igt@xe_huc_copy@huc_copy:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_huc_copy@huc_copy.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-433/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#255 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/255>)
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8099/shard-dg2-463/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-dg2-433/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#2961 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2961> / Intel XE#3191 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3191>) +1 other test timeout
>   *
> 
>     igt@xe_oa@closed-fd-and-unmapped-access:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-
>         access.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12052/shard-dg2-435/igt@xe_oa@closed-fd-and-
>         unmapped-access.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +7 other
>         tests skip
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/979>)
>   *
> 
>     igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12052/shard-dg2-434/igt@xe_pm@vram-d3cold-
>         threshold.html> (Intel XE#579 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/579>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-extension:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_query@multigpu-query-invalid-
>         extension.html> (Intel XE#1130 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12052/shard-dg2-466/
>         igt@xe_query@multigpu-query-invalid-extension.html> (Intel
>         XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/944>) +2 other tests skip
>   *
> 
>     igt@xe_wedged@basic-wedged:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/shard-dg2-434/igt@xe_wedged@basic-wedged.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/shard-dg2-435/igt@xe_wedged@basic-
>         wedged.html> (Intel XE#2919 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2919>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_8099 -> IGTPW_12052
>   * Linux: xe-2170-2b31f47649daecf2da6611c70072dfbe4914c22a ->
>     xe-2179-438ef86a725b59a171dba81fc258bb23a0ff536c
> 
> IGTPW_12052: a5e29ba28ed9b77e17e7682dde14ad815df4fa73 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8099: 27be46dee80b6b0de80f9fa3cd9bb5f55edccaf8 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2170-2b31f47649daecf2da6611c70072dfbe4914c22a: 
> 2b31f47649daecf2da6611c70072dfbe4914c22a
> xe-2179-438ef86a725b59a171dba81fc258bb23a0ff536c: 
> 438ef86a725b59a171dba81fc258bb23a0ff536c
> 

