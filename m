Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535BFD3A676
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 17:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF29610E2B0;
	Tue, 29 Oct 2024 17:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHTmSrok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE79C10E190;
 Tue, 29 Oct 2024 17:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730222842; x=1761758842;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+Fiiso2cgXmF15Q5xHMzUYv0C4DxLMQMgIcBpI+p69Q=;
 b=EHTmSrokYfwMvOSZKhltxbf3If7K6zmQqZXd26YLPFjh/Y3qQOYt7cy5
 8AFGunCAE5IIEExAFR/ruQ0e2G+MdGVtbSKkhSFlFfROvGxhh/aU8YyLN
 Mc+5o2iaCJFoAlqmuyl9wDkOu3aN02UCIuEWicC9NCbdjqw69skyOOmYz
 UIBeZfQ3xqwT90Sr3DfHtHp+f3oFAZsIyKRPHsg4LoEuObaIynt0hwAhG
 Jp/72bxHDs7kGlDQErIOsugtXvE5TzpCBdR0DES5Ao2cj/hYTjNLBO2vi
 WF4zI6iLHSshRDmRlYVeX+a8nxiV1Mn/FfhmqartE11PVS++upl/o5ORp g==;
X-CSE-ConnectionGUID: HAMqDHWbRiOfEcN6gbc3lA==
X-CSE-MsgGUID: 0Okk8dmLSxWXQzVQXERFGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="32733802"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="32733802"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 10:27:21 -0700
X-CSE-ConnectionGUID: 9T3X7SBNQUenDSIZ33xeaQ==
X-CSE-MsgGUID: YwhFh7OLR/uMjDeA3dTc2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="105361665"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 10:27:20 -0700
Date: Tue, 29 Oct 2024 18:27:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Alex Hung <Alex.Hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting?=
 =?utf-8?Q?_wit?= =?utf-8?Q?h?= [1/5] tools/amd_hdmi_compliance: Additional
 functionalities
Message-ID: <20241029172704.ptslx3nb5hvpyhgq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Alex Hung <Alex.Hung@amd.com>, I915-ci-infra@lists.freedesktop.org
References: <20241024210345.511501-1-alex.hung@amd.com>
 <172981231512.1327227.7110061849997340790@2413ebb6fbb6>
 <DM4PR12MB8476BE259EB4C103FB2FA543F74A2@DM4PR12MB8476.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR12MB8476BE259EB4C103FB2FA543F74A2@DM4PR12MB8476.namprd12.prod.outlook.com>
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

Hi Alex,
On 2024-10-28 at 13:39:55 +0000, Hung, Alex wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Kamil or maintainers,
> 
> The CI.xeBAT, CI.xeFULL and Fi.CI.BAT failures seem to be false positives
> because "Possible new issues" are not related to what was changed (i.e. amd_hdmi_compliance).
> 
> Can you retrigger the CI tests or is it safe to ignore them?
> 
> Thanks,
> Alex

imho you do not need a second run, you could just replay with Cc
to address given below: I915-ci-infra@lists.freedesktop.org
that you did not touch any files outside amdgpu,
so all reported failures are unrelated.

Regards,
Kamil

> ________________________________
> From: Patchwork <patchwork@emeril.freedesktop.org>
> Sent: 24 October 2024 17:25
> To: Hung, Alex <Alex.Hung@amd.com>
> Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> Subject: ✗ CI.xeBAT: failure for series starting with [1/5] tools/amd_hdmi_compliance: Additional functionalities
> 
> Patch Details
> Series: series starting with [1/5] tools/amd_hdmi_compliance: Additional functionalities
> URL:    https://patchwork.freedesktop.org/series/140459/
> State:  failure
> Details:        https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/index.html
> CI Bug Log - changes from XEIGT_8082_BAT -> XEIGTPW_11977_BAT
> Summary
> 
> FAILURE
> 
> Serious unknown changes coming with XEIGTPW_11977_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11977_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> Participating hosts (9 -> 9)
> 
> No changes in participating hosts
> 
> Possible new issues
> 
> Here are the unknown changes that may have been introduced in XEIGTPW_11977_BAT:
> 
> IGT changes
> Possible regressions
> 
>   *   igt@xe_exec_fault_mode@twice-invalid-fault:
> 
>      *   bat-lnl-1: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html>
>   *   igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
> 
>      *   bat-pvc-2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html>
>   *   igt@xe_exec_reset@cm-close-fd-no-exec:
> 
>      *   bat-adlp-vf: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html>
>      *   bat-bmg-2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html>
>      *   bat-bmg-1: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html>
>      *   bat-dg2-oem2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html>
>   *   igt@xe_exec_threads@threads-mixed-basic:
> 
>      *   bat-adlp-7: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@xe_exec_threads@threads-mixed-basic.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-adlp-7/igt@xe_exec_threads@threads-mixed-basic.html>
>      *   bat-atsm-2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html>
>   *   igt@xe_live_ktest@xe_dma_buf:
> 
>      *   bat-bmg-2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html> +1 other test skip
>   *   igt@xe_live_ktest@xe_migrate:
> 
>      *   bat-bmg-1: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html> -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html> +2 other tests skip
> 
> Warnings
> 
>   *   igt@xe_live_ktest@xe_bo:
>      *   bat-bmg-2: INCOMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-2/igt@xe_live_ktest@xe_bo.html> (Intel XE#2874<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874> / Intel XE#2998<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-bmg-2/igt@xe_live_ktest@xe_bo.html>
> 
> Known issues
> 
> Here are the changes found in XEIGTPW_11977_BAT that come from known issues:
> 
> IGT changes
> Issues hit
> 
>   *   igt@core_hotunplug@unbind-rebind:
> 
>      *   bat-adlp-7: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html> (Intel XE#2871<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871>)
>   *   igt@kms_psr@psr-cursor-plane-move:
> 
>      *   bat-adlp-7: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html> -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html> (Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests skip
>   *   igt@kms_psr@psr-primary-page-flip@edp-1:
> 
>      *   bat-adlp-7: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html> -> DMESG-FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html> (Intel XE#2871<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871>) +1 other test dmesg-fail
>   *   igt@xe_live_ktest@xe_bo:
> 
>      *   bat-adlp-vf: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html> -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html> (Intel XE#1192<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>) +2 other tests skip
>   *   igt@xe_live_ktest@xe_migrate:
> 
>      *   bat-dg2-oem2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html> -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html> (Intel XE#1192<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>) +2 other tests skip
> 
> Possible fixes
> 
>   *   igt@kms_frontbuffer_tracking@basic:
>      *   bat-adlp-7: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html> (Intel XE#1861<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html>
> 
> Warnings
> 
>   *   igt@kms_dsc@dsc-basic:
>      *   bat-lnl-1: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@kms_dsc@dsc-basic.html> (Intel XE#599<https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11977/bat-lnl-1/igt@kms_dsc@dsc-basic.html> (Intel XE#2244<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
> 
> Build changes
> 
>   *   IGT: IGT_8082 -> IGTPW_11977
>   *   Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -> xe-2121-1feef4b713e6db15f3fb2ec11e8ce4a77892e731
> 
> IGTPW_11977: b803c3441a28e44c48cda92ad5c2d83c31f8d6c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
> xe-2121-1feef4b713e6db15f3fb2ec11e8ce4a77892e731: 1feef4b713e6db15f3fb2ec11e8ce4a77892e731
