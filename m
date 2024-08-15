Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50356C3DA7F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 07:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0335B10E0A7;
	Thu, 15 Aug 2024 07:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyGF6XCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F099110E0A7
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 07:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723708176; x=1755244176;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZejsdSaTNNLf9Uek7uCaqJm+ALEi6KdzsQPY5oIwXhI=;
 b=QyGF6XCBPU0gVlcaHdNUM8dImXTJ5aamaxCiF8YdSTroBEK9/eoPUP8/
 MysDij+c7dbxbl9IOTI3dkSg3qaM3/jW9AWjid8rOUo+3HvOpzBiZ1Mn/
 446s1KyueoTgosMrjajmeizyqNTdUytmT2OS3Mik6SlvbR/MgdNjzer80
 hE2pH5kd+S1yzC0rpEEzoYUBLdMcbPOEfk9ajaNeR1/BK81FZvYw1FyZO
 lo6rF+E4UGy7nFcu37VnheqvYmPfSDf108dbCae94hWRInqmElqemkWNl
 wcsCe+mAOBcGwjql8PMx0M9xGKCBUFZVY7rMXO5gfZjAn4NclTkFDC+j/ A==;
X-CSE-ConnectionGUID: ex1BJLEYSSSzBaa9R1QmtA==
X-CSE-MsgGUID: egNhDncETZuVjPWnrUyxIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21770498"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; d="scan'208";a="21770498"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 00:49:35 -0700
X-CSE-ConnectionGUID: HXC4trA8QZe2M99ob5gbIw==
X-CSE-MsgGUID: drHF/V5xS82B1jA3IZytHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; d="scan'208";a="59847446"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.146.109])
 ([10.245.146.109])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 00:49:32 -0700
Message-ID: <b2c10808-8a92-4adf-93c0-b6699fde481d@linux.intel.com>
Date: Thu, 15 Aug 2024 09:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/gem_spin_batch: RCS/CCS must share VM
 on DG2 due to w/a
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, john.c.harrison@intel.com,
 nirmoy.das@intel.com, chris.p.wilson@linux.intel.com
References: <20240814183336.507650-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240814183336.507650-1-jonathan.cavitt@intel.com>
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


On 8/14/2024 8:33 PM, Jonathan Cavitt wrote:
> On DG2, both the RCS and CCS engine contexts must use the same virtual
> address space when running parallel, non-preemptible work.  Failure to
> do so results in a GPU hang.
>
> Suggested-by: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Nirmoy Das <nirmoy.das@intel.com>
> CC: Chris Wilson <chris.p.wilson@linux.intel.com>
> ---
>   tests/intel/gem_spin_batch.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
> index 682a062180..19b13f7334 100644
> --- a/tests/intel/gem_spin_batch.c
> +++ b/tests/intel/gem_spin_batch.c
> @@ -24,6 +24,7 @@
>   
>   #include "i915/gem.h"
>   #include "i915/gem_ring.h"
> +#include "i915/gem_vm.h"
>   #include "igt.h"
>   /**
>    * TEST: gem spin batch
> @@ -179,9 +180,20 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>   	const struct intel_execution_engine2 *e;
>   	intel_ctx_cfg_t cfg = ctx->cfg;
>   	struct igt_spin *spin, *n;
> +	uint32_t shared_vm_id = 0;
>   	uint64_t ahnd;
>   	IGT_LIST_HEAD(list);
>   
> +	/*
> +	 * Wa_14014494547:DG2

HSD talks about DG2 and MTL, is this somehow fixed in MTL ?


Nirmoy

> +	 * Both the RCS and CCS engine contexts must use the same
> +	 * virtual address space when running parallel,
> +	 * non-preemptible work.  Failure to do so results in a
> +	 * GPU hang.
> +	 */
> +	if (IS_DG2(intel_get_drm_devid(i915)))
> +		shared_vm_id = gem_vm_create(i915);
> +
>   	for_each_ctx_cfg_engine(i915, &cfg, e) {
>   		if (!gem_class_can_store_dword(i915, e->class))
>   			continue;
> @@ -192,8 +204,11 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>   		if (skip_bad_engine(i915, e))
>   			continue;
>   
> -		if (flags & PARALLEL_SPIN_NEW_CTX)
> +		if (flags & PARALLEL_SPIN_NEW_CTX) {
> +			if (shared_vm_id)
> +				cfg.vm = shared_vm_id;
>   			ctx = intel_ctx_create(i915, &cfg);
> +		}
>   		ahnd = get_reloc_ahnd(i915, ctx->id);
>   
>   		/* Prevent preemption so only one is allowed on each engine */
> @@ -218,6 +233,9 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>   		igt_spin_free(i915, spin);
>   		put_ahnd(ahnd);
>   	}
> +
> +	if (shared_vm_id)
> +		gem_vm_destroy(i915, shared_vm_id);
>   }
>   
>   static bool has_userptr(int fd)
