Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C8606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kGHVxug8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB2910E1CC;
	Mon, 26 Oct 2026 10:24:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB11610E138
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 10:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793010243; x=1824546243;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=At98k4CNbx3QvZa7zrrLxrhmNHOqEXkFuDnCc9SzkLI=;
 b=kGHVxug8TLi6PRqIqPJA+L5P0GgMxJHC3i/qmAgnzQewwaKiwLRFthQS
 n1BQdBjAKkliNsgzkcZWnZWJ2Sh12LPoLZ3zuwhteJFk4DnCy56iaTL8R
 X73Gi4I2fCIV9gSdOq1Kx2Cx+dniARevVoOoLm57bZla8weMvikHwpJFx
 dy0zyRAiOriKkhWgIUgeozi+7OqGpPkQfgoD9Ltno7genTTg0rc99t/G3
 AjW/o5UflGYVG3jf7mTuYvMb4ij9bws2+4qtdN3a54bKu+N1djiBrqfYO
 6RVGWhK08OWeOhUvVUfzRajvuJSQa3GTHHqnOxiPSdp6HZJeHe+A1W/iY w==;
X-CSE-ConnectionGUID: +EboyEb5QP+8VvsR5r3dcQ==
X-CSE-MsgGUID: /4g2vm8KQ6ylx8xAnSR05g==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1682926"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1682926"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:24:02 -0700
X-CSE-ConnectionGUID: Kjjl9duiSIyxf+Fe/dPtVA==
X-CSE-MsgGUID: HEKjk0fhSuu93YHk6MulsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4177747"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:24:01 -0700
Date: Mon, 26 Oct 2026 11:23:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org,
 Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_basic: use a portable spin-wait
 CPU hint
Message-ID: <20261026102344.hv2e2ctanvo666iu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org,
 Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260626212743.16149-1-ricardo.salveti@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260626212743.16149-1-ricardo.salveti@oss.qualcomm.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ricardo,
On 2026-06-26 at 21:27:43 +0000, Ricardo Salveti wrote:
> wait_for_value64() polls a 64-bit value and, when no polling interval is
> requested, issues a CPU spin-loop hint through inline assembly. The hint
> was hardcoded to the x86 'pause' instruction, which is not a valid
> mnemonic on other architectures, so assembling it on aarch64 (or arm)
> fails:
> 
>   {standard input}: Error: unknown mnemonic `pause' -- `pause'
> 
> The breakage is easy to miss because it only surfaces in unoptimized
> builds. wait_for_value64() is static and both of its callers pass a
> non-zero compile-time constant for check_interval_ns. At -O2 the compiler
> inlines the function, folds 'check_interval_ns > 0' to true and discards
> the else branch holding the 'pause' as dead code, so the bad instruction
> never reaches the assembler and the build happens to succeed. At -O0
> there is no inlining, constant propagation or dead-code elimination: the
> branch is emitted as written and the assembler rejects it. Builds that
> select a debug / unoptimized build type therefore fail to cross-build the
> amdgpu tests for non-x86 targets, while optimized builds do not.
> 
> Define a cpu_relax() helper guarded by architecture, mirroring the idiom
> already used in tests/kms_cursor_legacy.c: __builtin_ia32_pause() on x86,
> a 'yield' (the equivalent spin-loop hint) on aarch64/arm, and a plain
> compiler barrier elsewhere. This assembles on every architecture
> regardless of optimization level.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>

Sorry for missing your patch, it looks like it was one solution
for recent compilation problem on ARM-based hardware.
	
Regards,
Kamil
> ---
>  tests/amdgpu/amd_basic.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 3ad023472..5278fc572 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -20,6 +20,15 @@
>  #include "lib/amdgpu/amdgpu_asic_addr.h"
>  #include "lib/amdgpu/amd_utils.h"
>  
> +/* CPU hint for spin-wait loops */
> +#if defined(__x86_64__) || defined(__i386__)
> +#define cpu_relax()	__builtin_ia32_pause()
> +#elif defined(__aarch64__) || defined(__arm__)
> +#define cpu_relax()	asm volatile("yield" ::: "memory")
> +#else
> +#define cpu_relax()	asm volatile("" ::: "memory")
> +#endif
> +
>  #define BUFFER_SIZE (8 * 1024)
>  
>  /**
> @@ -704,7 +713,7 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
>  		if (check_interval_ns > 0)
>  			nanosleep(&sleep_time, NULL);
>  		else
> -			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
> +			cpu_relax();
>  	}
>  }
>  
> -- 
> 2.43.0
> 
