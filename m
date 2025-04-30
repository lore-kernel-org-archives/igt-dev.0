Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8B3C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 11:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580DC10E0E2;
	Wed, 30 Apr 2025 11:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfV/Ga2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4380010E0E2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 11:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746012763; x=1777548763;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lMlC8pHteakUar32Z4HBWUN6QLBumx2+LPr5s/10cEA=;
 b=PfV/Ga2hZJYlwIBEqsYofANDI19EJA1+q377wdRUWMPqgmLLuMbNJqx/
 eGOu+TJWB1832JhiRDr7frVgdiH9L2mYrZk+CaxiS4rKlPaW1fRfGUYy+
 V47dcqXyoFPTpMQ7rMWDUpkqb8UKG+II2H79aCB+kt0Hy51JmaRYg3Gd5
 M0HE54PHCD/avEzsEY0OXZxNRwfOyc+vZ5jkTpU+5yR/AQtHOaCOziPk/
 BPTVj8+hHSye40LVsQEW5D+r7IyHPaU9B8N1FwGEHOVPtFrtU0cENA8rM
 Z8DmMnKx0qmjUtIBEROP3Ckr4+wl/YSVBml03qdnggAkDPG4YD/g7jWdu Q==;
X-CSE-ConnectionGUID: 1/cG5crTTUKr3BU+ccgndw==
X-CSE-MsgGUID: HQvsrCsJRcuF82/qGtpKrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51482794"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="51482794"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:32:43 -0700
X-CSE-ConnectionGUID: dXKS8faXT5Gi2vqr8T4G/Q==
X-CSE-MsgGUID: qOEhISPGShm1qMM4xMgSbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="157319692"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:32:42 -0700
Date: Wed, 30 Apr 2025 13:32:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/intel/xe_pxp: Terminate PXP on exit (rev2)
Message-ID: <20250430113239.oujzxbrupz3olg6p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250429234924.2049502-1-daniele.ceraolospurio@intel.com>
 <174600877623.29128.5298307818311233896@c664b1dc75d1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174600877623.29128.5298307818311233896@c664b1dc75d1>
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
On 2025-04-30 at 10:26:16 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pxp: Terminate PXP on exit (rev2)
> URL   : https://patchwork.freedesktop.org/series/147948/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8344_FULL -> XEIGTPW_13063_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13063_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13063_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13063_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-rte:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13063/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
> 
>   * igt@kms_vblank@wait-busy:
>     - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-433/igt@kms_vblank@wait-busy.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13063/shard-dg2-464/igt@kms_vblank@wait-busy.html
> 

Unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13063_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          NOTRUN -> [FAIL][5] ([Intel XE#4665])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13063/shard-bmg-6/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@intel_sysfs_debugfs@xe-base:
>     - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#4208] / [Intel XE#4618])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-436/igt@intel_sysfs_debugfs@xe-base.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13063/shard-dg2-434/igt@intel_sysfs_debugfs@xe-base.html
> 
>   * igt@kms_3d:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1465])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13063/shard-lnl-5/igt@kms_3d.html
> 

...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8344 -> IGTPW_13063
>   * Linux: xe-3009-f13165b51331915eb63fdb160331e035ecae35c7 -> xe-3010-11bac2f4b353b42599a9b028f48261d32b94fe34
> 
>   IGTPW_13063: 7adc0eec19dfa81d8ceb65feb462e03c673c33d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8344: 00f143c5f06f7d5936aacb70dad22be371570d38 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3009-f13165b51331915eb63fdb160331e035ecae35c7: f13165b51331915eb63fdb160331e035ecae35c7
>   xe-3010-11bac2f4b353b42599a9b028f48261d32b94fe34: 11bac2f4b353b42599a9b028f48261d32b94fe34
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13063/index.html
