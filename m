Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5F8E94120
	for <igt-dev@archiver.kernel.org>; Tue, 30 Dec 2025 09:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD00A10E162;
	Tue, 30 Dec 2025 09:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDk2SiWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D729D10E162
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Dec 2025 09:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767086147; x=1798622147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JHiOxJZ6TY/wnZom6rr+ocjMyGImul4mXRl2CUOcTZI=;
 b=MDk2SiWnMmRb4nhFq33KV//Wd1AicJotEwxa9OyJlGJ8QjX1pJviZT+f
 gtGiLqzDTiFdsGRhgghYGPlyDYRLwwzbOWxO/f++g3s2X/TgVZX3dr9Ja
 tcegEx0B4bwrrESth9ZfPOt3D3A+zS573ZA8cYhQoGrQqkNJ8NgEqQNMa
 2N6Kp/76GeQQ3/2QKIpd5eQ8DhEznqnLydMRfKHYYOrwqJ6+gKO3tuscd
 lAACPg1m3eI99laFMXgyUSVp4bu5Ckr4CYf1zZ6pkQHYV3R90pxbjsPgz
 j0cA/OY5/KBzvPEHZb6Mdb25Hjspz4ivO3YmV6r16US4JIr9fXQTebRrQ w==;
X-CSE-ConnectionGUID: nleRkq2qTtOgfecJMTTwaA==
X-CSE-MsgGUID: GL+SLR1lRw+RJ6sWLVYgJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68653175"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="68653175"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 01:15:46 -0800
X-CSE-ConnectionGUID: oR02GdiCR2a820lrXvE6Jw==
X-CSE-MsgGUID: BA/xVzCmQ0ulFnFwbAwi9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="201061899"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 01:15:45 -0800
Date: Tue, 30 Dec 2025 10:15:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t] tools/gen_xe_vf_migration_bpftrace.py: Add
 bpftrace generator for Xe VF migration tracing
Message-ID: <20251230091530.7vdxlatxe42fwt2j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20251219170958.881880-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219170958.881880-1-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-12-19 at 18:09:58 +0100, Marcin Bernatowicz wrote:
> Add a Python script that generates a bpftrace program for tracing
> Xe SR-IOV VF migration (save/restore) activity.
> 
> The tool emits a complete bpftrace script to stdout and is intended
> to be used by piping its output to bpftrace, e.g.:
> 
>     ./gen_xe_vf_migration_bpftrace.py | bpftrace -

imho it could be shorter name like:

gen_xe_sriov_bpftrace.py

Later on if you want to add other target you could extend it.

> 
> It focuses on migration-related events and metrics useful for
> analyzing VF save/restore flow, latency, and data transfer behavior.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  tools/gen_xe_vf_migration_bpftrace.py | 1438 +++++++++++++++++++++++++
>  1 file changed, 1438 insertions(+)
>  create mode 100755 tools/gen_xe_vf_migration_bpftrace.py
> 
> diff --git a/tools/gen_xe_vf_migration_bpftrace.py b/tools/gen_xe_vf_migration_bpftrace.py
> new file mode 100755
> index 000000000..8397dc3f4
> --- /dev/null
> +++ b/tools/gen_xe_vf_migration_bpftrace.py
> @@ -0,0 +1,1438 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright(c) 2025 Intel Corporation. All rights reserved.
> +#
> +"""
> +Generator for Xe VF migration bpftrace scripts.
> +
> +Generates a bpftrace script for observing Intel Xe SR-IOV VF activity,
> +focused on migration (save/restore).
> +
> +Events (--events / --omit-events) filter bpftrace probe specs (kprobe/kretprobe)
> +using glob patterns.
> +Defaults: --events='*' --omit-events='*:xe_sriov_vfio_data_*'.
> +
> +Metrics (--metrics / --omit-metrics) filter map names using glob patterns.
> +Default: all metrics enabled.
> +
> +Tracing is organized into blocks, each combining related probes and
> +metric producers (e.g. VFIO save/restore, Xe restore paths).
> +A block is generated if it provides any enabled metric
> +or any of its probes are enabled.
> +
> +If no output file is given, the script is written to stdout (pipe directly into bpftrace).

Please add here an example of usage.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

