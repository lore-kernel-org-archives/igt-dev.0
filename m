Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DADCD4F39
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 13:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFB510E06D;
	Thu, 14 May 2026 13:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhgvZrJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3BC10E558
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778764833; x=1810300833;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=II2+J6RVUjOaWlICqX+IjbX/Dq/xSp8F2WDNXYzXUzo=;
 b=bhgvZrJjjcSY8TYeVLnw+DhvESJ8SkKyADsSHt+wkgfIzKqLztCrplYK
 B6sjARtxYo3TR6Cc60/Jh/rapg2g0Pw3kywRC2NB87PUVVcr8nWGiS/FP
 m3FtRULIrju6AM5RaXY1pEEIwGtUIzouvGAREj3pFrk8JLZx2xL0Z88KO
 AtUHPaueEgTuFPi0RI61ng6c83rh/M24r0mU8VOEbJc2E8kigszoNwziJ
 4WgvHBwax7+towW0eBzn9C2BT6FtLS2HQr91TeTUZkrJLcPB42DlOOUwO
 Ev3NWlQ8ujIpMwKwcQZpu/dNAm4GPB1fN5m0yNK5DOIXzLE1C97V/SL86 w==;
X-CSE-ConnectionGUID: VSAmQvd5TYmQ3rUNT1cI0g==
X-CSE-MsgGUID: /YYItb0jQ8GFNH+HJyU9Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="105165678"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="105165678"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 06:20:33 -0700
X-CSE-ConnectionGUID: tnNdnljRRKS+uVtK+DrTKQ==
X-CSE-MsgGUID: xebIyFuDR7anbp6BaqsE6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="237517605"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.189])
 ([172.28.182.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 06:20:32 -0700
Message-ID: <acdedbb3-0317-4f07-9247-5b7335801fff@linux.intel.com>
Date: Thu, 14 May 2026 15:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tools/vmtb: Provide VF busy migration
 IGT/gem_wsim workloads
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260416083544.2441874-1-adam.miszczak@linux.intel.com>
 <20260416083544.2441874-3-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260416083544.2441874-3-adam.miszczak@linux.intel.com>
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


On 4/16/2026 10:35 AM, Adam Miszczak wrote:
> Define gem_wsim workload descriptor files for BMG and PTL
> consumed by the xe busy migration test scenarios (test_migration.py):
> - short_preempt.wsim: short preemptable batches (5ms)
> - short_nonpreempt.wsim: short non-preemptable batches (5ms)
> - long_preempt.wsim: long preemptable batches (100ms)
> - long_nonpreempt.wsim: long non-preemptable batches (100ms)
> - idle_ctxs.wsim: idle migration with contexts created
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/MANIFEST.in                        |  1 +
>   .../resources/wsim/bmg/idle_ctxs.wsim         | 22 +++++++++++++++++++
>   .../resources/wsim/bmg/long_nonpreempt.wsim   | 18 +++++++++++++++
>   .../resources/wsim/bmg/long_preempt.wsim      | 17 ++++++++++++++
>   .../resources/wsim/bmg/short_nonpreempt.wsim  | 18 +++++++++++++++
>   .../resources/wsim/bmg/short_preempt.wsim     | 17 ++++++++++++++
>   .../resources/wsim/ptl/idle_ctxs.wsim         | 21 ++++++++++++++++++
>   .../resources/wsim/ptl/long_nonpreempt.wsim   | 17 ++++++++++++++
>   .../resources/wsim/ptl/long_preempt.wsim      | 16 ++++++++++++++
>   .../resources/wsim/ptl/short_nonpreempt.wsim  | 17 ++++++++++++++
>   .../resources/wsim/ptl/short_preempt.wsim     | 16 ++++++++++++++
>   11 files changed, 180 insertions(+)
>   create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/idle_ctxs.wsim
>   create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/long_nonpreempt.wsim
>   create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/long_preempt.wsim
>   create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/short_nonpreempt.wsim
>   create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/short_preempt.wsim
>   create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/idle_ctxs.wsim
>   create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/long_nonpreempt.wsim
>   create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/long_preempt.wsim
>   create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/short_nonpreempt.wsim
>   create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/short_preempt.wsim
>
> diff --git a/tools/vmtb/MANIFEST.in b/tools/vmtb/MANIFEST.in
> index 7674c199d..954990a63 100644
> --- a/tools/vmtb/MANIFEST.in
> +++ b/tools/vmtb/MANIFEST.in
> @@ -1,3 +1,4 @@
>   include pytest.ini
>   include vmtb_config.json
>   include vmm_flows/resources/vgpu_profiles/*
> +recursive-include vmm_flows/resources/wsim *
> diff --git a/tools/vmtb/vmm_flows/resources/wsim/bmg/idle_ctxs.wsim b/tools/vmtb/vmm_flows/resources/wsim/bmg/idle_ctxs.wsim
> new file mode 100644
> index 000000000..1d8c9a2d7
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/wsim/bmg/idle_ctxs.wsim
> @@ -0,0 +1,22 @@
> +###############################################################
> +# VF S/R scenario: idle migration with contexts created
> +#
> +# 1. Run 3ms pre-migration WL on each engine
> +# 2. Wait 20s for migration to happen
> +# 3. Run the WLs again in post-migration phase to check fixups
> +#
> +# BMG variant - engines:
> +# Root tile: RCS, BCS, CCS
> +# Media tile: VCS, VECS
> +###############################################################
> +1.RCS.3000.0.0
> +1.BCS.3000.0.0
> +1.CCS.3000.0.1
> +1.VCS.3000.0.0
> +1.VECS.3000.0.0
> +d.20000000
> +1.RCS.3000.0.0
> +1.BCS.3000.0.0
> +1.CCS.3000.0.1
> +1.VCS.3000.0.0
> +1.VECS.3000.0.0
> diff --git a/tools/vmtb/vmm_flows/resources/wsim/bmg/long_nonpreempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/bmg/long_nonpreempt.wsim
> new file mode 100644
> index 000000000..45add4217
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/wsim/bmg/long_nonpreempt.wsim
> @@ -0,0 +1,18 @@
> +###############################################################
> +# VF S/R scenario: long non-preemptable batches
> +#
> +# 1. Run 100ms non-preempable batches on each engine
> +# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
> +#    Use 'gem_wsim -r 200' that gives: 0.1s * 10 = 1s * 20 = 20s
> +# 3. Finish execution in post-migration phase
> +#
> +# BMG variant - engines:
> +# Root tile: RCS, BCS, CCS
> +# Media tile: VCS, VECS
> +###############################################################
> +X.1.0
> +1.RCS.100000.0.0
> +1.BCS.100000.0.0
> +1.CCS.100000.0.1
> +1.VCS.100000.0.0
> +1.VECS.100000.0.0
> diff --git a/tools/vmtb/vmm_flows/resources/wsim/bmg/long_preempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/bmg/long_preempt.wsim
> new file mode 100644
> index 000000000..2c3d22d40
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/wsim/bmg/long_preempt.wsim
> @@ -0,0 +1,17 @@
> +###############################################################
> +# VF S/R scenario: long preemptable batches
> +#
> +# 1. Run 100ms preempable batches on each engine
> +# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
> +#    Use 'gem_wsim -r 200' that gives: 0.1s * 10 = 1s * 20 = 20s
> +# 3. Finish execution in post-migration phase
> +#
> +# BMG variant - engines:
> +# Root tile: RCS, BCS, CCS
> +# Media tile: VCS, VECS
> +###############################################################
> +1.RCS.100000.0.0
> +1.BCS.100000.0.0
> +1.CCS.100000.0.1
> +1.VCS.100000.0.0
> +1.VECS.100000.0.0
> diff --git a/tools/vmtb/vmm_flows/resources/wsim/bmg/short_nonpreempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/bmg/short_nonpreempt.wsim
> new file mode 100644
> index 000000000..5ff9cc74a
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/wsim/bmg/short_nonpreempt.wsim
> @@ -0,0 +1,18 @@
> +###############################################################
> +# VF S/R scenario: short non-preemptable batches
> +#
> +# 1. Run 5ms non-preempable batches on each engine
> +# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
> +#    Use 'gem_wsim -r 4000' that gives: 0.005s * 200 = 1s * 20 = 20s
> +# 3. Finish execution in post-migration phase
> +#
> +# BMG variant - engines:
> +# Root tile: RCS, BCS, CCS
> +# Media tile: VCS, VECS
> +###############################################################
> +X.1.0
> +1.RCS.5000.0.0
> +1.BCS.5000.0.0
> +1.CCS.5000.0.1
> +1.VCS.5000.0.0
> +1.VECS.5000.0.0
> diff --git a/tools/vmtb/vmm_flows/resources/wsim/bmg/short_preempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/bmg/short_preempt.wsim
> new file mode 100644
> index 000000000..c09b82cce
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/wsim/bmg/short_preempt.wsim
> @@ -0,0 +1,17 @@
> +###############################################################
> +# VF S/R scenario: short preemptable batches
> +#
> +# 1. Run 5ms preempable batches on each engine
> +# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
> +#    Use 'gem_wsim -r 4000' that gives: 0.005s * 200 = 1s * 20 = 20s
> +# 3. Finish execution in post-migration phase
> +#
> +# BMG variant - engines:
> +# Root tile: RCS, BCS, CCS
> +# Media tile: VCS, VECS
> +###############################################################
> +1.RCS.5000.0.0
> +1.BCS.5000.0.0
> +1.CCS.5000.0.1
> +1.VCS.5000.0.0
> +1.VECS.5000.0.0
> diff --git a/tools/vmtb/vmm_flows/resources/wsim/ptl/idle_ctxs.wsim b/tools/vmtb/vmm_flows/resources/wsim/ptl/idle_ctxs.wsim
> new file mode 100644
> index 000000000..1e17b7a53
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/wsim/ptl/idle_ctxs.wsim
> @@ -0,0 +1,21 @@
> +###############################################################
> +# VF S/R scenario: idle migration with contexts created
> +#
> +# 1. Run 3ms pre-migration WL on each engine
> +# 2. Wait 20s for migration to happen
> +# 3. Run the WLs again in post-migration phase to check fixups
> +#
> +# PTL variant - engines:
> +# RCS, BCS, VCS-1, VECS-1, CCS
> +###############################################################
> +1.RCS.3000.0.0
> +1.BCS.3000.0.0
> +1.VCS-1.3000.0.0
> +1.VECS-1.3000.0.0
> +1.CCS.3000.0.1
> +d.20000000
> +1.RCS.3000.0.0
> +1.BCS.3000.0.0
> +1.VCS-1.3000.0.0
> +1.VECS-1.3000.0.0
> +1.CCS.3000.0.1
> diff --git a/tools/vmtb/vmm_flows/resources/wsim/ptl/long_nonpreempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/ptl/long_nonpreempt.wsim
> new file mode 100644
> index 000000000..2b49426ca
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/wsim/ptl/long_nonpreempt.wsim
> @@ -0,0 +1,17 @@
> +###############################################################
> +# VF S/R scenario: long non-preemptable batches
> +#
> +# 1. Run 100ms non-preempable batches on each engine
> +# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
> +#    Use 'gem_wsim -r 200' that gives: 0.1s * 10 = 1s * 20 = 20s
> +# 3. Finish execution in post-migration phase
> +#
> +# PTL variant - engines:
> +# RCS, BCS, VCS-1, VECS-1, CCS
> +###############################################################
> +X.1.0
> +1.RCS.100000.0.0
> +1.BCS.100000.0.0
> +1.VCS-1.100000.0.0
> +1.VECS-1.100000.0.0
> +1.CCS.100000.0.1
> diff --git a/tools/vmtb/vmm_flows/resources/wsim/ptl/long_preempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/ptl/long_preempt.wsim
> new file mode 100644
> index 000000000..e06c2f290
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/wsim/ptl/long_preempt.wsim
> @@ -0,0 +1,16 @@
> +###############################################################
> +# VF S/R scenario: long preemptable batches
> +#
> +# 1. Run 100ms preempable batches on each engine
> +# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
> +#    Use 'gem_wsim -r 200' that gives: 0.1s * 10 = 1s * 20 = 20s
> +# 3. Finish execution in post-migration phase
> +#
> +# PTL variant - engines:
> +# RCS, BCS, VCS-1, VECS-1, CCS
> +###############################################################
> +1.RCS.100000.0.0
> +1.BCS.100000.0.0
> +1.VCS-1.100000.0.0
> +1.VECS-1.100000.0.0
> +1.CCS.100000.0.1
> diff --git a/tools/vmtb/vmm_flows/resources/wsim/ptl/short_nonpreempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/ptl/short_nonpreempt.wsim
> new file mode 100644
> index 000000000..5e8ff1c26
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/wsim/ptl/short_nonpreempt.wsim
> @@ -0,0 +1,17 @@
> +###############################################################
> +# VF S/R scenario: short non-preemptable batches
> +#
> +# 1. Run 5ms non-preempable batches on each engine
> +# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
> +#    Use 'gem_wsim -r 4000' that gives: 0.005s * 200 = 1s * 20 = 20s
> +# 3. Finish execution in post-migration phase
> +#
> +# PTL variant - engines:
> +# RCS, BCS, VCS-1, VECS-1, CCS
> +###############################################################
> +X.1.0
> +1.RCS.5000.0.0
> +1.BCS.5000.0.0
> +1.VCS-1.5000.0.0
> +1.VECS-1.5000.0.0
> +1.CCS.5000.0.1
> diff --git a/tools/vmtb/vmm_flows/resources/wsim/ptl/short_preempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/ptl/short_preempt.wsim
> new file mode 100644
> index 000000000..b2316f957
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/resources/wsim/ptl/short_preempt.wsim
> @@ -0,0 +1,16 @@
> +###############################################################
> +# VF S/R scenario: short preemptable batches
> +#
> +# 1. Run 5ms preempable batches on each engine
> +# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
> +#    Use 'gem_wsim -r 4000' that gives: 0.005s * 200 = 1s * 20 = 20s
> +# 3. Finish execution in post-migration phase
> +#
> +# PTL variant - engines:
> +# RCS, BCS, VCS-1, VECS-1, CCS
> +###############################################################
> +1.RCS.5000.0.0
> +1.BCS.5000.0.0
> +1.VCS-1.5000.0.0
> +1.VECS-1.5000.0.0
> +1.CCS.5000.0.1
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
