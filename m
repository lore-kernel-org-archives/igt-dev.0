Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91370D43369
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 14:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA4210E1D9;
	Thu,  7 Nov 2024 14:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z47yTGfo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB8610E863
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730990175; x=1762526175;
 h=message-id:date:mime-version:subject:to:references:from:
 cc:in-reply-to;
 bh=vaBXD8Y/J9ugtDSyioDIeKHTJ1aRWy8Z556hvd0xvM0=;
 b=Z47yTGfo50OTMglIa5xJjwRGay64nrCTerREicWWbRfNgpYIyDPkWL9W
 APcJn5dli+Pr7+mA0z7m+JSRRUXAHlhfpZjDdWCRbEVR7Gk++I4l8W3nv
 v2NDfi4Prns5apJwTVSncpD4iIcjKFTj8Nx85QPU2m+6KST80m4UQVtI5
 cMwZIHPKH7BVZOr7NFfQRi0W/H3vcPiPQhDqYVkYhT5rikxQ2FhdnfD9l
 uJCs8Hxki5faqK0bxSOHeyXZiudaway/NL/fQ9FzCsUqZTrbs5+nqf19b
 u4tN2tETlhccKCxNM8UkU33tDwN4nI8pVZm84V8vjvPhRDodmLuSreWAE Q==;
X-CSE-ConnectionGUID: NbnUvuuMQ+CBS1rVO8ZTpw==
X-CSE-MsgGUID: YetV2dMOT0WYyYAqkp1QCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30939080"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208,217";a="30939080"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 06:36:14 -0800
X-CSE-ConnectionGUID: CmXDa4cmRC2ZkeJMub9wlg==
X-CSE-MsgGUID: JwMYcES1QaytzEAiXt0maw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208,217";a="85438985"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.195.120])
 ([10.245.195.120])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 06:36:10 -0800
Content-Type: multipart/alternative;
 boundary="------------GbdZ70thKL04YSttW9kWD15b"
Message-ID: <fc98d8c3-a339-43c5-9821-d5dcf3cda987@linux.intel.com>
Date: Thu, 7 Nov 2024 15:36:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/xe?=
 =?UTF-8?Q?=5Fexec=5Ffault=5Fmode=3A_wait_for_the_completion?=
To: Matthew Brost <matthew.brost@intel.com>
References: <20241025002322.1422552-1-fei.yang@intel.com>
 <172994119620.1335314.3082246451761273957@2413ebb6fbb6>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: fei.yang@intel.com, Patchwork <patchwork@emeril.freedesktop.org>,
 igt-dev@lists.freedesktop.org
In-Reply-To: <172994119620.1335314.3082246451761273957@2413ebb6fbb6>
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

This is a multi-part message in MIME format.
--------------GbdZ70thKL04YSttW9kWD15b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/26/2024 1:13 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_exec_fault_mode: wait for the completion
> *URL:* 	https://patchwork.freedesktop.org/series/140464/
> *State:* 	failure
> *Details:* 	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/index.html
>
>
>   CI Bug Log - changes from XEIGT_8082_full -> XEIGTPW_11978_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_11978_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11978_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in XEIGTPW_11978_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html>
>  *
>
>     igt@xe_exec_balancer@many-cm-parallel-basic:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-basic.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-8/igt@xe_exec_balancer@many-cm-parallel-basic.html> +15 other tests dmesg-warn
>  *
>
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
>

This regressed many tests. Fei's next series seems to fixing this https://patchwork.freedesktop.org/series/140743/

>  *
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html> +5 other tests fail
>  *
>
>     igt@xe_exec_fault_mode@many-invalid-fault:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-8/igt@xe_exec_fault_mode@many-invalid-fault.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@xe_exec_fault_mode@many-invalid-fault.html> +11 other tests dmesg-warn
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html> +5 other tests fail
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
>
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html>
>  *
>
>     igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html> +7 other tests dmesg-warn
>  *
>
>     igt@xe_exec_threads@threads-bal-mixed-userptr:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-userptr.html> +1 other test dmesg-warn
>  *
>
>     igt@xe_module_load@many-reload:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-6/igt@xe_module_load@many-reload.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-4/igt@xe_module_load@many-reload.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> (Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> +15 other tests skip
>  *
>
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html>
>  *
>
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html>
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_11978_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) +1 other test fail
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> (Intel XE#1701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1 other test fail
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1 other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-180:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +1 other test dmesg-warn
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html> (Intel XE#1407 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#3225 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225>)
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +4 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html> (Intel XE#2669 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1 other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +8 other tests fail
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +20 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html> (Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html> (Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>  *
>
>     igt@kms_color@ctm-0-50@pipe-c-edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-5/igt@kms_color@ctm-0-50@pipe-c-edp-1.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_color@ctm-0-50@pipe-c-edp-1.html> (Intel XE#2929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929>) +1 other test dmesg-warn
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-128x42:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html> (Intel XE#1424 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x170:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4 other tests skip
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_feature_discovery@psr2.html> (Intel XE#1135 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +5 other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-wf_vblank:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@kms_flip@2x-flip-vs-wf_vblank.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1 other test skip
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +3 other tests fail
>  *
>
>     igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
>
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +2 other tests fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +4 other tests fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +1 other test skip
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +17 other tests skip
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html> (Intel XE#2927 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +7 other tests skip
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html> (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html> (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>)
>  *
>
>     igt@kms_pm_rpm@universal-planes:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html> (Intel XE#2042 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html> (Intel XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4 other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1128 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128>)
>  *
>
>     igt@kms_psr@psr-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_psr@psr-dpms.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +7 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-plane-move@edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-move@edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-move@edp-1.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +1 other test fail
>  *
>
>     igt@kms_psr@psr2-cursor-render@edp-1:
>
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@kms_psr@psr2-cursor-render@edp-1.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +1 other test fail
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90.html> (Intel XE#1437 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>)
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_setmode@basic.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-4/igt@kms_setmode@basic.html> (Intel XE#2883 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) +6 other tests fail
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>  *
>
>     igt@xe_eudebug@basic-vm-bind-ufence:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +4 other tests skip
>  *
>
>     igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test skip
>  *
>
>     igt@xe_evict@evict-cm-threads-small:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@xe_evict@evict-cm-threads-small.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-null-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test skip
>  *
>
>     igt@xe_exec_compute_mode@many-userptr-unmap:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-5/igt@xe_exec_compute_mode@many-userptr-unmap.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-unmap.html> (Intel XE#2754 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html> (Intel XE#3160 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160>) +1 other test fail
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +14 other tests skip
>  *
>
>     igt@xe_exec_reset@cm-close-fd-no-exec:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-6/igt@xe_exec_reset@cm-close-fd-no-exec.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@xe_exec_reset@cm-close-fd-no-exec.html> (Intel XE#3230 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230>)
>  *
>
>     igt@xe_exec_threads@threads-hang-shared-vm-rebind:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-435/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html> (Intel XE#358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>) +2 other tests dmesg-warn
>  *
>
>     igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html> (Intel XE#1169 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169> / Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356>)
>  *
>
>     igt@xe_exec_threads@threads-mixed-shared-vm-basic:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html> (Intel XE#3230 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230>) +1 other test dmesg-warn
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-3/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html> (Intel XE#3230 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230>)
>  *
>
>     igt@xe_gt_freq@freq_reset_multiple:
>
>       o shard-lnl: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html> (Intel XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>)
>  *
>
>     igt@xe_oa@invalid-remove-userspace-config:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@xe_oa@invalid-remove-userspace-config.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +3 other tests skip
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html> (Intel XE#1420 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420> / Intel XE#2838 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838>)
>  *
>
>     igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html> (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1 other test fail
>  *
>
>     igt@xe_pm@s3-d3cold-basic-exec:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>  *
>
>     igt@xe_pm@s4-d3hot-basic-exec:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
>  *
>
>     igt@xe_query@multigpu-query-config:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@xe_query@multigpu-query-config.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>  *
>
>     igt@xe_query@multigpu-query-gt-list:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@xe_query@multigpu-query-gt-list.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sysfs_defaults@engine-defaults:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-1/igt@xe_sysfs_defaults@engine-defaults.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@xe_sysfs_defaults@engine-defaults.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1 other test skip
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-434/igt@xe_sysfs_defaults@engine-defaults.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@xe_sysfs_defaults@engine-defaults.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +2 other tests skip
>
>
>         Possible fixes
>
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@intel_hwmon@hwmon-write.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-1/igt@intel_hwmon@hwmon-write.html>
>  *
>
>     igt@kms_atomic@atomic-invalid-params:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_atomic@atomic-invalid-params.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_atomic@atomic-invalid-params.html> +14 other tests pass
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-180:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate-180.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate-180.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html>
>  *
>
>     igt@kms_cursor_edge_walk@128x128-right-edge:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_cursor_edge_walk@128x128-right-edge.html> (Intel XE#2055 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-right-edge.html> +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html> (Intel XE#1541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_cursor_legacy@torture-move@pipe-b:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_cursor_legacy@torture-move@pipe-b.html> +1 other test pass
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html> +4 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html> (Intel XE#3036 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> / Intel XE#3149 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149> / Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html> (Intel XE#3149 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149> / Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend@b-dp4:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-464/igt@kms_flip@flip-vs-suspend@b-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_flip@flip-vs-suspend@b-dp4.html>
>  *
>
>     igt@kms_flip@nonexisting-fb:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_flip@nonexisting-fb.html> (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-4/igt@kms_flip@nonexisting-fb.html> +14 other tests pass
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html> +7 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html> +2 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#3217 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3217>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-464/igt@kms_hdr@invalid-hdr.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_hdr@invalid-hdr.html>
>  *
>
>     igt@kms_pm_dc@dc5-dpms:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html> (Intel XE#718 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html> +1 other test pass
>  *
>
>     igt@xe_evict@evict-beng-threads-large:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html>
>  *
>
>     igt@xe_exec_basic@many-bindexecqueue-rebind:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html> +21 other tests pass
>  *
>
>     igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html> (Intel XE#2754 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html> +1 other test pass
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#2105 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html>
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_pat@pat-index-xelp.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@xe_pat@pat-index-xelp.html> +17 other tests pass
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-90:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel XE#2327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#2328 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html> (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-8/igt@kms_cdclk@mode-transition.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314> / Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_cdclk@mode-transition.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html> (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html> (Intel XE#2252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +1 other test skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_content_protection@lic-type-0.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> / Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_content_protection@lic-type-0.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_content_protection@lic-type-1.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_content_protection@lic-type-1.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_content_protection@lic-type-1.html> (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@kms_content_protection@lic-type-1.html> (Intel XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#2791 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791> / Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html> (Intel XE#1508 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508> / Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html> (Intel XE#1508 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html> (Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.html> (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +7 other tests skip
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html> (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_flip@blocking-wf_vblank:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#3255 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3255> / Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +1 other test skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +1 other test skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +1 other test skip
>  *
>
>     igt@kms_getfb@getfb2-accept-ccs:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html> (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.html> (Intel XE#2340 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340>)
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503> / Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) +3 other tests skip
>  *
>
>     igt@kms_invalid_mode@clock-too-high:
>
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_invalid_mode@clock-too-high.html> (Intel XE#1450 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450> / Intel XE#2568 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568> / Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_invalid_mode@clock-too-high.html> (Intel XE#1450 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450> / Intel XE#2568 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568>)
>  *
>
>     igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html> (Intel XE#1450 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450> / Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html> (Intel XE#1450 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450>)
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html> (Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html> (Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1 other test skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1 other test skip
>  *
>
>     igt@kms_psr@fbc-pr-primary-render:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_psr@fbc-pr-primary-render.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-3/igt@kms_psr@fbc-pr-primary-render.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_psr@fbc-pr-primary-render.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_psr@fbc-pr-primary-render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>  *
>
>     igt@kms_psr@pr-no-drrs:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_psr@pr-no-drrs.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_psr@pr-no-drrs.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_psr@pr-no-drrs.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_psr@pr-no-drrs.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-none:
>
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none.html> (Intel XE#2413 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413> / Intel XE#374 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/374> / Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_scaling_modes@scaling-mode-none.html> (Intel XE#2413 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413> / Intel XE#374 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/374>)
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-6/igt@kms_vrr@negative-basic.html> (Intel XE#1499 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499> / Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_vrr@negative-basic.html> (Intel XE#1499 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) +2 other tests skip
>  *
>
>     igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html> (Intel XE#2322 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-null-defer-mmap:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html> (Intel XE#2322 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-imm:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr-imm.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3 other tests skip
>  *
>
>     igt@xe_live_ktest@xe_eudebug:
>
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.html> (Intel XE#2833 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.html> (Intel XE#3026 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026>)
>  *
>
>     igt@xe_live_ktest@xe_mocs:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html> (Intel XE#1999 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_pat@pat-index-xelp.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-8/igt@xe_pat@pat-index-xelp.html> (Intel XE#2237 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237> / Intel XE#2245 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245>)
>  *
>
>     igt@xe_pm@d3cold-mocs:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_pm@d3cold-mocs.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@xe_pm@d3cold-mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
>
>     Build changes
>
>   * IGT: IGT_8082 -> IGTPW_11978
>   * Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -> xe-2124-df4c2f3aa67cea423504125ceb12ed46ac116cfb
>
> IGTPW_11978: 0b9473f3005de4ac9bffa2fa5d4b175a869578ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
> xe-2124-df4c2f3aa67cea423504125ceb12ed46ac116cfb: df4c2f3aa67cea423504125ceb12ed46ac116cfb
>
--------------GbdZ70thKL04YSttW9kWD15b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/2024 1:13 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:172994119620.1335314.3082246451761273957@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_exec_fault_mode: wait for the completion</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/140464/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/140464/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8082_full -&gt;
        XEIGTPW_11978_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_11978_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_11978_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_11978_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-8/igt@xe_exec_balancer@many-cm-parallel-basic.html"
                moz-do-not-send="true">DMESG-WARN</a> +15 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
    <p>This regressed many tests. Fei's next series seems to fixing this
      <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/140743/">https://patchwork.freedesktop.org/series/140743/</a> <br>
    </p>
    <blockquote type="cite"
      cite="mid:172994119620.1335314.3082246451761273957@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">FAIL</a> +5 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-8/igt@xe_exec_fault_mode@many-invalid-fault.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@xe_exec_fault_mode@many-invalid-fault.html"
                moz-do-not-send="true">DMESG-WARN</a> +11 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html"
                moz-do-not-send="true">FAIL</a> +5 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html"
                moz-do-not-send="true">DMESG-WARN</a> +7 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-bal-mixed-userptr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-userptr.html"
                moz-do-not-send="true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@many-reload:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-6/igt@xe_module_load@many-reload.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-4/igt@xe_module_load@many-reload.html"
                moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599"
                moz-do-not-send="true">Intel XE#599</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html"
                moz-do-not-send="true">SKIP</a> +15 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204"
                moz-do-not-send="true">Intel XE#1204</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600"
                moz-do-not-send="true">Intel XE#1600</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html"
                moz-do-not-send="true">DMESG-FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_11978_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827"
                moz-do-not-send="true">Intel XE#827</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701"
                moz-do-not-send="true">Intel XE#1701</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407"
                moz-do-not-send="true">Intel XE#1407</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225"
                moz-do-not-send="true">Intel XE#3225</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669"
                moz-do-not-send="true">Intel XE#2669</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907"
                moz-do-not-send="true">Intel XE#2907</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887"
                moz-do-not-send="true">Intel XE#2887</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616"
                moz-do-not-send="true">Intel XE#616</a>) +8 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"
                moz-do-not-send="true">Intel XE#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"
                moz-do-not-send="true">Intel XE#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@kms_chamelium_color@ctm-0-50.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-0-50@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-5/igt@kms_color@ctm-0-50@pipe-c-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_color@ctm-0-50@pipe-c-edp-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929"
                moz-do-not-send="true">Intel XE#2929</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424"
                moz-do-not-send="true">Intel XE#1424</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_feature_discovery@psr2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135"
                moz-do-not-send="true">Intel XE#1135</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) +5 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@kms_flip@2x-flip-vs-wf_vblank.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421"
                moz-do-not-send="true">Intel XE#1421</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401"
                moz-do-not-send="true">Intel XE#1401</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"
                moz-do-not-send="true">Intel XE#1745</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401"
                moz-do-not-send="true">Intel XE#1401</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274"
                moz-do-not-send="true">i915#5274</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927"
                moz-do-not-send="true">Intel XE#2927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356"
                moz-do-not-send="true">Intel XE#356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"
                moz-do-not-send="true">Intel XE#1129</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"
                moz-do-not-send="true">Intel XE#908</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430"
                moz-do-not-send="true">Intel XE#1430</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042"
                moz-do-not-send="true">Intel XE#2042</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893"
                moz-do-not-send="true">Intel XE#2893</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128"
                moz-do-not-send="true">Intel XE#1128</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_psr@psr-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-plane-move@edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-move@edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-move@edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948"
                moz-do-not-send="true">Intel XE#2948</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-render@edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@kms_psr@psr2-cursor-render@edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948"
                moz-do-not-send="true">Intel XE#2948</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437"
                moz-do-not-send="true">Intel XE#1437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_setmode@basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-4/igt@kms_setmode@basic.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883"
                moz-do-not-send="true">Intel XE#2883</a>) +6 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt-many:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280"
                moz-do-not-send="true">Intel XE#1280</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-cm-threads-small:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@xe_evict@evict-cm-threads-small.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@many-userptr-unmap:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-5/igt@xe_exec_compute_mode@many-userptr-unmap.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-unmap.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754"
                moz-do-not-send="true">Intel XE#2754</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160"
                moz-do-not-send="true">Intel XE#3160</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-6/igt@xe_exec_reset@cm-close-fd-no-exec.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@xe_exec_reset@cm-close-fd-no-exec.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230"
                moz-do-not-send="true">Intel XE#3230</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-435/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358"
                moz-do-not-send="true">Intel XE#358</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169"
                moz-do-not-send="true">Intel XE#1169</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356"
                moz-do-not-send="true">Intel XE#1356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230"
                moz-do-not-send="true">Intel XE#3230</a>) +1 other test
              dmesg-warn</li>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-3/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230"
                moz-do-not-send="true">Intel XE#3230</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_reset_multiple:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184"
                moz-do-not-send="true">Intel XE#3184</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@invalid-remove-userspace-config:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@xe_oa@invalid-remove-userspace-config.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"
                moz-do-not-send="true">Intel XE#1420</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838"
                moz-do-not-send="true">Intel XE#2838</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173"
                moz-do-not-send="true">Intel XE#1173</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3hot-basic-exec:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958"
                moz-do-not-send="true">Intel XE#958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-config:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@xe_query@multigpu-query-config.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-gt-list:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@xe_query@multigpu-query-gt-list.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sysfs_defaults@engine-defaults:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-1/igt@xe_sysfs_defaults@engine-defaults.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@xe_sysfs_defaults@engine-defaults.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +1 other test
              skip</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-434/igt@xe_sysfs_defaults@engine-defaults.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@xe_sysfs_defaults@engine-defaults.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +2 other tests
              skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@intel_hwmon@hwmon-write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-1/igt@intel_hwmon@hwmon-write.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@atomic-invalid-params:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_atomic@atomic-invalid-params.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_atomic@atomic-invalid-params.html"
                moz-do-not-send="true">PASS</a> +14 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate-180.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659"
                moz-do-not-send="true">Intel XE#1659</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"
                moz-do-not-send="true">Intel XE#3113</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_cursor_edge_walk@128x128-right-edge.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055"
                moz-do-not-send="true">Intel XE#2055</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-right-edge.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541"
                moz-do-not-send="true">Intel XE#1541</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_cursor_legacy@torture-move@pipe-b.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036"
                moz-do-not-send="true">Intel XE#3036</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149"
                moz-do-not-send="true">Intel XE#3149</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149"
                moz-do-not-send="true">Intel XE#3149</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"
                moz-do-not-send="true">Intel XE#2049</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"
                moz-do-not-send="true">Intel XE#2597</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@b-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-464/igt@kms_flip@flip-vs-suspend@b-dp4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_flip@flip-vs-suspend@b-dp4.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@nonexisting-fb:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_flip@nonexisting-fb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007"
                moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-4/igt@kms_flip@nonexisting-fb.html"
                moz-do-not-send="true">PASS</a> +14 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html"
                moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3217"
                moz-do-not-send="true">Intel XE#3217</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-464/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718"
                moz-do-not-send="true">Intel XE#718</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000"
                moz-do-not-send="true">Intel XE#1000</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html"
                moz-do-not-send="true">PASS</a> +21 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754"
                moz-do-not-send="true">Intel XE#2754</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105"
                moz-do-not-send="true">Intel XE#2105</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelp:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_pat@pat-index-xelp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@xe_pat@pat-index-xelp.html"
                moz-do-not-send="true">PASS</a> +17 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327"
                moz-do-not-send="true">Intel XE#2327</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328"
                moz-do-not-send="true">Intel XE#2328</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619"
                moz-do-not-send="true">Intel XE#619</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007"
                moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887"
                moz-do-not-send="true">Intel XE#2887</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-8/igt@kms_cdclk@mode-transition.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314"
                moz-do-not-send="true">Intel XE#314</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599"
                moz-do-not-send="true">Intel XE#599</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_cdclk@mode-transition.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314"
                moz-do-not-send="true">Intel XE#314</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007"
                moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"
                moz-do-not-send="true">Intel XE#2252</a>) +1 other test
              skip</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-466/igt@kms_content_protection@lic-type-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204"
                moz-do-not-send="true">Intel XE#1204</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_content_protection@lic-type-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_content_protection@lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_content_protection@lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>)</li>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_content_protection@lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007"
                moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@kms_content_protection@lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341"
                moz-do-not-send="true">Intel XE#2341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791"
                moz-do-not-send="true">Intel XE#2791</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508"
                moz-do-not-send="true">Intel XE#1508</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599"
                moz-do-not-send="true">Intel XE#599</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508"
                moz-do-not-send="true">Intel XE#1508</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599"
                moz-do-not-send="true">Intel XE#599</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244"
                moz-do-not-send="true">Intel XE#2244</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>)</li>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244"
                moz-do-not-send="true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3255"
                moz-do-not-send="true">Intel XE#3255</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>) +1 other test
              skip</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"
                moz-do-not-send="true">Intel XE#2333</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"
                moz-do-not-send="true">Intel XE#2333</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) +1 other test
              skip</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_getfb@getfb2-accept-ccs:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007"
                moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340"
                moz-do-not-send="true">Intel XE#2340</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"
                moz-do-not-send="true">Intel XE#1503</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599"
                moz-do-not-send="true">Intel XE#599</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"
                moz-do-not-send="true">Intel XE#1503</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@clock-too-high:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_invalid_mode@clock-too-high.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450"
                moz-do-not-send="true">Intel XE#1450</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568"
                moz-do-not-send="true">Intel XE#2568</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599"
                moz-do-not-send="true">Intel XE#599</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_invalid_mode@clock-too-high.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450"
                moz-do-not-send="true">Intel XE#1450</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568"
                moz-do-not-send="true">Intel XE#2568</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450"
                moz-do-not-send="true">Intel XE#1450</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599"
                moz-do-not-send="true">Intel XE#599</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450"
                moz-do-not-send="true">Intel XE#1450</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-primary-render:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_psr@fbc-pr-primary-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-3/igt@kms_psr@fbc-pr-primary-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"
                moz-do-not-send="true">Intel XE#2234</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_psr@fbc-pr-primary-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-466/igt@kms_psr@fbc-pr-primary-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-no-drrs:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@kms_psr@pr-no-drrs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"
                moz-do-not-send="true">Intel XE#2231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@kms_psr@pr-no-drrs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"
                moz-do-not-send="true">Intel XE#2234</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@kms_psr@pr-no-drrs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-434/igt@kms_psr@pr-no-drrs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-none:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413"
                moz-do-not-send="true">Intel XE#2413</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374"
                moz-do-not-send="true">Intel XE#374</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599"
                moz-do-not-send="true">Intel XE#599</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@kms_scaling_modes@scaling-mode-none.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413"
                moz-do-not-send="true">Intel XE#2413</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374"
                moz-do-not-send="true">Intel XE#374</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-6/igt@kms_vrr@negative-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"
                moz-do-not-send="true">Intel XE#1499</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599"
                moz-do-not-send="true">Intel XE#599</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-7/igt@kms_vrr@negative-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"
                moz-do-not-send="true">Intel XE#1499</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-464/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>)</li>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322"
                moz-do-not-send="true">Intel XE#2322</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322"
                moz-do-not-send="true">Intel XE#2322</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_eudebug:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833"
                moz-do-not-send="true">Intel XE#2833</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026"
                moz-do-not-send="true">Intel XE#3026</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_mocs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999"
                moz-do-not-send="true">Intel XE#1999</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"
                moz-do-not-send="true">Intel XE#1192</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelp:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_pat@pat-index-xelp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-8/igt@xe_pat@pat-index-xelp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237"
                moz-do-not-send="true">Intel XE#2237</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245"
                moz-do-not-send="true">Intel XE#2245</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mocs:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_pm@d3cold-mocs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-7/igt@xe_pm@d3cold-mocs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11978/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8082 -&gt; IGTPW_11978</li>
        <li>Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
          -&gt; xe-2124-df4c2f3aa67cea423504125ceb12ed46ac116cfb</li>
      </ul>
      <p>IGTPW_11978: 0b9473f3005de4ac9bffa2fa5d4b175a869578ba @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52:
        beaeaccd284ba3b69b6dbfdc18bb89441fc99a52<br>
        xe-2124-df4c2f3aa67cea423504125ceb12ed46ac116cfb:
        df4c2f3aa67cea423504125ceb12ed46ac116cfb</p>
    </blockquote>
  </body>
</html>

--------------GbdZ70thKL04YSttW9kWD15b--
