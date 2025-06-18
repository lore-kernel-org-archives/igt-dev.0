Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D7EC7115A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 15:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5A710E027;
	Wed, 18 Jun 2025 15:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEOdjM5l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D35D10E027
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750259444; x=1781795444;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8g25QO/dO6auZyI/tkJ0X+1aEYSROM8z9kKg7704Es4=;
 b=VEOdjM5l0MGiIPMjdf+M0hymFEU8uVU3Mie3MMUJ07UvSGNt84dJvlHX
 POl7w0mH9BBvpFXRKLtkgXnFKVTPJxbnKGG8sP/fQoxX7d4KPW94gCaSZ
 aG3zaWbWDX2hj9hM/8L1TqANGi+Tzmr8C6KcE3vPlYc+CZZv03kvG0x8G
 ud0bZ5Gld63S6jv/mdR9gIdrcpYbiFIXXurmU2aGAQ1TqNV+LVZIPUor4
 GB4TnbAg3nY+xtn+ZoBtcvh7eKY5nNGdlRkc0mLqh0xxZqro/6BI0oBNk
 IFxtCg8aKoefhfj8y1fcLBWyrVn09VMv4acy5GmI4wtORQdVruOZ1SOHV g==;
X-CSE-ConnectionGUID: FFo1kkobTFqs9PYEed6n5A==
X-CSE-MsgGUID: LweLiwlaRGKrx+pe5w4FXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52570699"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52570699"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 08:10:43 -0700
X-CSE-ConnectionGUID: PaVGYD7vQUmiBsfDKmoh6w==
X-CSE-MsgGUID: owyXmmukRD2wNY6Y2AHw7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="153693916"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 08:10:41 -0700
Date: Wed, 18 Jun 2025 17:10:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, andi.shyti@linux.intel.com,
 krzysztof.niemiec@intel.com, krzysztof.karas@intel.com
Subject: Re: [PATCH i-g-t] lib/i915: Avoid non-canonical address dereference
 in gem_has_relocations()
Message-ID: <20250618151030.awt3aao74pslavlg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, andi.shyti@linux.intel.com,
 krzysztof.niemiec@intel.com, krzysztof.karas@intel.com
References: <j6ll6li2qmkk3gwamz36s4saf3ehp6qutkxl3cc2sbm2i2ujsq@5xel3p4b5cw6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <j6ll6li2qmkk3gwamz36s4saf3ehp6qutkxl3cc2sbm2i2ujsq@5xel3p4b5cw6>
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

Hi Sebastian,
On 2025-06-16 at 14:26:15 +0000, Sebastian Brzezinka wrote:
> Fix a general protection fault in igt@gem_exec_big@single caused by
> passing a non-canonical address via relocs_ptr. The test previously
> used a stack-allocated relocation entry, which resulted in an invalid
> pointer being passed to the kernel, triggering a crash.
> 
> This patch replaces the stack-allocated `reloc` with a NULL pointer,
> ensuring the kernel correctly interprets the absence of relocations and
> avoids undefined behavior.
> 
> A corresponding kernel patch to sanitize user input for relocs_ptr has
> been submitted to the i915 mailing list to further harden the interface.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
> 

Do we miss some igt test for this? imho kernel should not
make any oops when it is given invalid pointer to relocs
nor invalid values in relocs.
What about writing gem_bad_reloc@invalid test for it?

> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  lib/i915/gem_submission.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> index 7d1c3970f..a03b2e369 100644
> --- a/lib/i915/gem_submission.c
> +++ b/lib/i915/gem_submission.c
> @@ -421,10 +421,10 @@ unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
>  
>  bool gem_has_relocations(int i915)
>  {
> -	struct drm_i915_gem_relocation_entry reloc = {};
> +	struct drm_i915_gem_relocation_entry *reloc = NULL;

Something for testing in @invalid like:

	bad_ptr = 0xffff7777f7f70000; /* or get some other pointer to kernel */
	struct drm_i915_gem_relocation_entry *reloc = bad_ptr;

>  	struct drm_i915_gem_exec_object2 obj = {
>  		.handle = gem_create(i915, 4096),
> -		.relocs_ptr = to_user_pointer(&reloc),
> +		.relocs_ptr = to_user_pointer(reloc),

One more idea:

		.relocs_ptr = bad_ptr,

Regards,
Kamil

>  		.relocation_count = 1,
>  	};
>  	struct drm_i915_gem_execbuffer2 execbuf = {
> -- 
> 2.34.1
> 
