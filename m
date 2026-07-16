Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3F0C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 14:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A85E10E373;
	Thu, 16 Jul 2026 14:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwupXaRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA8E10E373
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784212099; x=1815748099;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dGwJf4vlvAOJElkkjqeAdaeTo3qd4hSlXbeFy4aky3Q=;
 b=PwupXaRpVgXw//OVgbgXPIobJ7P9cdVgIDY0XYXMzWBeI7Dy/AEotrvQ
 0O88bqbkaj+QZJln6T9JYgSHNEH7nwZgnr0IToUGUTZZYM4Lhqy0ZdgWH
 qJ5CFJteYvyIXWkoDSNLkIcg33nfMbefJU8UkzzCCS2E/KZGTR6Go1sP3
 Pj46gWlOdsfrGdwkTwU+M/loXRgoFID2CXhUTHgWudDDpM6pW29jYeDOl
 N4BSjAwveR/1urQGkmLpi7h4y9McEWPcAXRB53PcUxupFV1nK/M9v3755
 /xFIhF662WHaJgytlETMfe+z1q5nlTzDxpTpuxcxBZOf5XQLnMCkxr99C w==;
X-CSE-ConnectionGUID: HSTXsMLdTXm2mjstcySYIQ==
X-CSE-MsgGUID: WI85T4C8R12UO1MPXMmX3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84988065"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84988065"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 07:28:18 -0700
X-CSE-ConnectionGUID: uQalV/FjSpmNZIPytPdQNw==
X-CSE-MsgGUID: rvfL5KFXT+eSAesuXpGqGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="252088643"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 07:28:17 -0700
Date: Thu, 16 Jul 2026 16:27:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, adam.miszczak@linux.intel.com,
 lukasz.laguna@intel.com, tvrtko.ursulin@igalia.com
Subject: Re: [PATCH i-g-t 1/2] benchmarks/gem_wsim: add explicit VM
 create/assign steps
Message-ID: <20260716142759.qlhj36tqcncpnnth@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org, adam.miszczak@linux.intel.com,
 lukasz.laguna@intel.com, tvrtko.ursulin@igalia.com
References: <20260714151235.1246608-1-marcin.bernatowicz@linux.intel.com>
 <20260714151235.1246608-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714151235.1246608-2-marcin.bernatowicz@linux.intel.com>
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
On 2026-07-14 at 17:12:34 +0200, Marcin Bernatowicz wrote:
> Add explicit VM management to workload descriptors so Xe runs can model

Please write explicitly what VM means, my guess: Virtual Memory

> VM topology directly.
> 
> Introduce two new descriptor steps:
> - V.N     create VM id N (1-based)
> - v.N.M   assign VM N to context M
> 
> Implementation details:
> - Add VM_CREATE and CTX_VM step types and vm_id storage in w_step.
> - Parse V/v syntax with validation and clear error messages.
> - Add allocate_vms() pre-scan to size and allocate vm_list from V steps.
> - Update xe_prepare_contexts() to support explicit VM mode:
>   - create all explicit VMs
>   - default contexts to VM 0
>   - apply per-context VM assignments from v steps
>   - retain implicit single-VM fallback when no V steps are present
> - Make get_vm() use per-context VM linkage.
> 
> Documentation:
> - Add VM management step documentation into benchmarks/wsim/README.

Same in documentation, add there at least once a full name for VM.

Regards,
Kamil

> 
> This keeps i915 behavior unchanged while enabling explicit VM topology
> control for Xe workloads.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  benchmarks/gem_wsim.c  | 143 +++++++++++++++++++++++++++++++++++++----
>  benchmarks/wsim/README |  19 ++++++
>  2 files changed, 150 insertions(+), 12 deletions(-)
> 
[cut]
