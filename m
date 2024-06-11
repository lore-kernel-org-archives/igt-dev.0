Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E720AC27C77
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 15:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216A210E0A2;
	Tue, 11 Jun 2024 15:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkkIsrPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9985410E0A2;
 Tue, 11 Jun 2024 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718119969; x=1749655969;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F113C9IvA1GRN4Lman1fbCoxVtIQmKPYG0C5Ev3jqXo=;
 b=NkkIsrPP2OiQiM4e9iEbWemoNsFEQ7lLE+g09I8w4JVpmdqce9tIET2y
 T1BOpAQOFeo+EYUt8VCOjYVsy2juXUCXBN6jLV/g681bW2FU/562aVyG3
 7w/MFSDEYq9WXJadm/RHFUVUZNJQD2nMK5dHD6lNDwQdTCJfrc8MYJ/nh
 cHy/a/G5Q5gHyB8Sh7yw9etYsfNqtVS9GNeKZ5hV5AkjG8LK7OQgNnA5Y
 aDIKcgZzxXPLSVVCbU91kA6wMsQtgNPt4DiT1/lAc0M/sK1cv3+2rAJDW
 20IRKu9giffhDE3va8YS6amKpOjG1qFNeuPpoB3dZfHRZKVe+4G5Ue/W9 A==;
X-CSE-ConnectionGUID: 1plYT9SkSnyLkgRH/Xio8w==
X-CSE-MsgGUID: B5zW7uIEQCuEiPuxi/hgvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15064467"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="15064467"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 08:32:48 -0700
X-CSE-ConnectionGUID: D9QAcMnsTvWpsLlwtRL0uQ==
X-CSE-MsgGUID: EHQlQpsbRN6UGi8Bl2ApqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39530023"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 08:32:47 -0700
Date: Tue, 11 Jun 2024 17:32:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 tests/core_hotunplug: Make it fail in subtests
Message-ID: <20240611153229.xejfpucc4r5yycnm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
 <171785535073.29541.16077522192497937422@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171785535073.29541.16077522192497937422@a6498e030952>
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
On 2024-06-08 at 14:02:30 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_hotunplug: Make it fail in subtests
> URL   : https://patchwork.freedesktop.org/series/134626/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7880_full -> XEIGTPW_11238_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11238_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11238_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 2)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11238_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:
>     - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-466/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11238/shard-dg2-436/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11238/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html
> 

This is not related to core_hotunplug,

Regards,
Kamil

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7880 -> IGTPW_11238
>   * Linux: xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c -> xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037
> 
>   IGTPW_11238: 755e4e0164dbde8a7fc84ea3e0c71dbae6263d42 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c: cb97aa28be4f4b914c751ed27bae7782e027826c
>   xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037: 2bea08bd31298d60d416b2a6ed346bb53dd28037
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11238/index.html
