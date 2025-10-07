Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34EACCA476
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 09:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574E710E5C0;
	Tue,  7 Oct 2025 09:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UavXCH94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6A110E5C0
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759829688; x=1791365688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dHRhLdxDTRTvTSlhNKbf6GRyKeBVCjEq9j8NGVBNkDk=;
 b=UavXCH94fYVLe56SSaWFYjX35t4zFVpONJnsaBRCYWNyDApuC0FgQY83
 4UwzyF2R4BrnPoNYw22EKDwGksbeFE02l3PVgK7r9bpkkItw7N8fIRkKM
 s1DVoCzuZ6Q7WhMBxrdEB0i0hSwPXsJguVAvclJqPzo+cTg+jigcKf1MR
 BG6Xq1ttUfHDSfw+f21nujvqLqP3f3V5MbUvgo1WOnbCTfNecocsSvMwy
 v596XZYRCMgDeS1bsaNydNaXu19cNRsR+ZLjBYxD3E/EWkYZi9mQwrzzD
 +GzoriTjr3kqfso0yPD9bGjL4fKQFnFveV+nztZFYnTqSlKulnFcRP6qH A==;
X-CSE-ConnectionGUID: g9jE1yFXTEWtExwLioa3YQ==
X-CSE-MsgGUID: DxgGO2yyQEiyYOxW3saErg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65653673"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65653673"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 02:34:48 -0700
X-CSE-ConnectionGUID: bj1pdSKBTUe0R3WN2I7QUg==
X-CSE-MsgGUID: E/uiS+f5T7CSv4Cml1XYCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184382252"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 02:34:44 -0700
Date: Tue, 7 Oct 2025 11:34:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xin Wang <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com,
 alex.zuo@intel.com, nakshtra.goyal@intel.com,
 dnyaneshwar.bhadane@intel.com, gustavo.sousa@intel.com,
 Karthik B S <karthik.b.s@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Message-ID: <20251007093441.maprl5rwb2snzqy4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xin Wang <x.wang@intel.com>, igt-dev@lists.freedesktop.org,
 matthew.d.roper@intel.com, shuicheng.lin@intel.com,
 brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Karthik B S <karthik.b.s@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007050554.340485-1-x.wang@intel.com>
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

Hi Xin,
On 2025-10-07 at 05:05:54 +0000, Xin Wang wrote:
> Created 3 new APIs:
> intel_query_gen(int fd)
> intel_query_graphics_ver(int fd)
> intel_query_device_info(int fd)
> 
> On xe devices, the graphics versions both major and minor can be
> accurately determined by retrieving the GMD_ID via IOCTL, rather
> than relying on the static intel_device_match table. The same type
> device may have different graphics minor version(.graphics_rel) value.
> 
> Although we can retrieve both the major and minor IP versions from
> GMD_ID, we still retain the major version (.graphics_ver) in the
> intel_device_match table. The benefit of this approach is that
> .graphics_ver generally does not change with devid, allowing us to
> avoid modifying the function call which don't provide fd parameter
> and thereby reducing unnecessary file changes.
> 
> However, we still provide the intel_query_gen(fd) function, because
> version queries within the same file should come from a consistent
> source.
> 
> Replaced the lib/*.c tests/intel/*.c tools/*.c releated to xe devices
> with the new APIs.
> 
> This change can avoid the trouble caused by different graphics_rel
> when adding new devid to the same device in the future.
> 

+cc Ashutosh, Karthik and Zbigniew

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Regards,
Kamil

> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/gpgpu_shader.c                     |  2 +-
>  lib/gpu_cmds.c                         | 22 +++++-----
>  lib/igt_draw.c                         |  6 +--
>  lib/igt_gt.c                           | 10 ++---
>  lib/igt_store.c                        |  2 +-
>  lib/intel_blt.c                        | 21 +++++-----
>  lib/intel_blt.h                        |  2 +-
>  lib/intel_bufops.c                     | 13 +++---
>  lib/intel_chipset.c                    | 56 ++++++++++++++++++++++++++
>  lib/intel_chipset.h                    |  3 ++
>  lib/intel_common.c                     |  8 ++--
>  lib/intel_compute.c                    |  7 ++--
>  lib/intel_device_info.c                |  3 --
>  lib/intel_mocs.c                       | 15 ++++---
>  lib/intel_pat.c                        | 17 ++++----
>  lib/ioctl_wrappers.c                   |  2 +-
>  lib/rendercopy_gen9.c                  | 22 +++++-----
>  lib/xe/xe_legacy.c                     |  2 +-
>  lib/xe/xe_oa.c                         |  4 +-
>  lib/xe/xe_query.c                      | 10 ++++-
>  lib/xe/xe_query.h                      |  3 ++
>  lib/xe/xe_sriov_provisioning.c         |  4 +-
>  tests/intel/api_intel_allocator.c      |  2 +-
>  tests/intel/kms_ccs.c                  | 13 ++----
>  tests/intel/kms_draw_crc.c             |  2 +-
>  tests/intel/kms_fbcon_fbt.c            |  2 +-
>  tests/intel/kms_frontbuffer_tracking.c | 12 +++---
>  tests/intel/kms_pipe_stress.c          |  4 +-
>  tests/intel/xe_ccs.c                   | 24 +++++------
>  tests/intel/xe_copy_basic.c            |  6 +--
>  tests/intel/xe_debugfs.c               |  3 +-
>  tests/intel/xe_eudebug_online.c        |  8 +---
>  tests/intel/xe_exec_store.c            |  6 +--
>  tests/intel/xe_fault_injection.c       |  2 +-
>  tests/intel/xe_oa.c                    | 38 +++++++++--------
>  tests/intel/xe_pat.c                   | 26 +++++-------
>  tools/intel_tiling_detect.c            |  3 +-
>  tools/xe-perf/meson.build              |  2 +-
>  tools/xe-perf/xe_perf_configs.c        |  2 +-
>  tools/xe-perf/xe_perf_recorder.c       |  2 +-
>  40 files changed, 216 insertions(+), 175 deletions(-)
> 
[cut]

