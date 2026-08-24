Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6AAC5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 09:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCA310E6C0;
	Mon, 24 Aug 2026 09:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSBMuS7E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E30210E6BB
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787563721; x=1819099721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h+HaBmpHkmsBfCg8q7pGyPhBaJZa1vzgRdrR7fbdXLA=;
 b=eSBMuS7EcRXNSvTo4rbPAN8uXe3OFjeqnjGXlihKVikSEynlWyqZjka0
 CgOiDisnSwkxMysw31IGJ5dtaihVydxVOnEwLbbCHbVc4q0APEDYLGzIN
 N7Nllkkb7nC4nsC6c/5jQkXDRdX6qVWqpMCLlvXyhEWKICzp9VyAT0xYx
 ezMPTCAbtNp7abVH7XslPpxlM3N57eGqTvBsBJLK9f+tLRNjWDLovIEiS
 rY+awYJReLCSEaWjDRSpCa6lod9ptjvCokX6fIM3rD0RWgbChei3WausI
 1hwA9ten6ApBIIm30IqaommXqlqfUDHW+yasLXZ8yqvFPEqCEKjcqSQAP w==;
X-CSE-ConnectionGUID: wsgPTh6JQR6sfz3hTEU1mg==
X-CSE-MsgGUID: 70XXqUp6SiaPznZ9/StFig==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88069897"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="88069897"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 02:28:41 -0700
X-CSE-ConnectionGUID: D58zLfMmQru3WSPj/Y9NdQ==
X-CSE-MsgGUID: NcwLyuUSSxSrAQiRmtIDOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="271164518"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 02:28:38 -0700
Date: Mon, 24 Aug 2026 11:28:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Junhua Shen <Junhua.Shen@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Huang Rui <ray.huang@amd.com>, Yiru Ma <yiru.ma@amd.com>
Subject: Re: [PATCH i-g-t v1 0/2] lib/amdgpu: generic compute dispatch helper
 and copy_dword
Message-ID: <20260824092836.jv2rdy3n2xnzpiz3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Junhua Shen <Junhua.Shen@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Huang Rui <ray.huang@amd.com>, Yiru Ma <yiru.ma@amd.com>
References: <20260821142242.34700-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821142242.34700-1-Junhua.Shen@amd.com>
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

Hi Junhua,
On 2026-08-21 at 22:22:40 +0800, Junhua Shen wrote:
> This series introduces a family-agnostic compute dispatch helper in
> lib/amdgpu (lib/amdgpu/compute_utils/amd_dispatch_helpers.*). The emitter
> owns only the PM4/compute state stream; all shader-binding state and the
> BOs the shader accesses are provided by the caller.

Please subscribe to igt-dev mailing list, otherwise you could
see some delay in delivery to ML.



Regards,
Kamil

> 
> The ptrace VRAM verification in amd_mem currently open-codes its own
> dispatch through execute_compute_dispatch(), a single-purpose helper that
> ignores its destination argument. This series replaces that helper with a
> generic emitter and a copy_dword wrapper, and migrates the test onto them.
> 
> Scope: amd_mem is the only user of the compute path being changed. The
> remaining amdgpu tests drive libdrm_amdgpu directly to validate the
> compute-submission UAPI and are left untouched.
> 
> 
> Overview of the changes
> -----------------------
> 1. add generic compute dispatch and copy_dword helpers
>    Add amdgpu_dispatch_shader(), an emitter driven by a caller-filled
>    amdgpu_dispatch_shader_req, allowing an arbitrary shader to be
>    dispatched without changing the emitter. Built on top of it,
>    amdgpu_compute_copy_dword() caches a single-DWORD copy shader for the
>    running GPU family and dispatches it as a reusable compute workload.
> 
> 2. replace execute_compute_dispatch with amdgpu_compute_copy_dword
>    Convert the amd_mem ptrace-access-invisible-vram verification to
>    amdgpu_compute_copy_dword() and remove the now-unused
>    execute_compute_dispatch().
> 
> 
> Testing
> -------
> Tested on AMD GFX1036 (GFX10_3). amd_mem ptrace-access-invisible-vram
> passes: both word_before and word_after readbacks match and no VM fault
> occurs. No regression is observed from this series.
> 
> Known limitations / follow-up work
> ----------------------------------
> The following items are intentionally excluded from this series to limit
> its scope; they are candidates for follow-up patches:
> 
> - The SET_SH_REG offsets in the emitter are hardcoded. A comment
>   explains why get_reg_offset() is not used yet: enum general_reg lacks
>   RSRC2/RSRC3/NUM_THREAD_Y/Z and there is a single gfx8 IP block wired
>   for all generations. Adopting it requires extending the enum and
>   adding real per-generation offset tables first.
> 
> - amdgpu_compute_copy_dword() is the only workload built on the generic
>   emitter so far. Other open-coded compute dispatches in the amdgpu
>   tests could be migrated onto amdgpu_dispatch_shader() where they are
>   not specifically exercising the submission UAPI.
> 
> Junhua Shen (2):
>   lib/amdgpu: add generic compute dispatch and copy_dword helpers
>   tests/amdgpu: replace execute_compute_dispatch with
>     amdgpu_compute_copy_dword
> 
>  .../compute_utils/amd_dispatch_helpers.c      | 356 +++++++++++++-----
>  .../compute_utils/amd_dispatch_helpers.h      |  82 +++-
>  tests/amdgpu/amd_mem.c                        | 109 ++----
>  3 files changed, 366 insertions(+), 181 deletions(-)
> 
> -- 
> 2.34.1
> 
