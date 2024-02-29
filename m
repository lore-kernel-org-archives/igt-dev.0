Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0026EC54E41
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 12:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E76610E08F;
	Thu, 29 Feb 2024 12:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpGS0Ei2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E150610E0C5
 for <IGT-Dev@lists.freedesktop.org>; Thu, 29 Feb 2024 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709210856; x=1740746856;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VDtPwn5pXnYQq/mwqn8cTFVv+LhKdBgf3dv0O7Ptin4=;
 b=JpGS0Ei275u+dluyOAkAUYwQC/Jv/iU3UzyRSGAY5H/8yPrf/r6PRvdg
 cdqMKEVciuQdxNw7jCKdNK2NQTEZZCeBFpQlds178JpK7Fs4Jpo9S/jmu
 yF6vBEy35Kr6xg2zzhGsRBb5ujiFphvPzoUK3/UyoUqGzTV6igPwkI/Jm
 GIvQpDJNDGfUitxo6tOlpV9HhJCxZR0gCzkYTbB1FNhSiWFBKQep/1JTY
 FoxHnVLv/jquR26aGZB26tSV4sfnkC4Jt/+DcQvCeGUJT8wJanRUepiAq
 G7M9+kD2j9psG5rC9HuP2dyNp/btDdQGLwi8wM3Y3PShSfeX3aBRUVfLS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3533478"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3533478"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:47:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7770332"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 04:47:35 -0800
Date: Thu, 29 Feb 2024 13:47:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John.C.Harrison@Intel.com
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_capture: Check for partial
 register captures
Message-ID: <20240229124731.c57w64y3vbjnhixz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 IGT-Dev@Lists.FreeDesktop.Org, John.C.Harrison@Intel.com
References: <20240223203824.1537904-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240223203824.1537904-1-John.C.Harrison@Intel.com>
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

Hi John,

On 2024-02-23 at 12:38:24 -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> If there is an error in the register list provided to GuC by the KMD
> then GuC will refuse to capture the invalid entries. This is reported
> as a 'partial-capture' when decoding the register state. Check for
> this and flag it as an error.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  tests/intel/gem_exec_capture.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index d231c53b98e1..1671f6774f64 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -24,6 +24,7 @@
>  #include <sys/poll.h>
>  #include <zlib.h>
>  #include <sched.h>
> +#include <ctype.h>
------------ ^^^^
Move it up to begin (try to keep it in alphabeticall order).

With this,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
> @@ -184,6 +185,19 @@ static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
>  	igt_assert(errno != ENOMEM);
>  	igt_debug("%.*s\n", error_dump_limit, error);
>  
> +	/*
> +	 * global --- GuC Error Capture on rcs0 command stream:
> +	 * Coverage:  partial-capture
> +	 * Coverage:  full-capture
> +	 */
> +	for (str = error; (str = strstr(str, "Coverage: ")); ) {
> +		str += 10;
> +		while (isspace(*str))
> +			str++;
> +
> +		igt_assert(strncmp(str, "full-capture", 12) == 0);
> +	}
> +
>  	/* render ring --- user = 0x00000000 ffffd000 */
>  	for (str = error; (str = strstr(str, "--- user = ")); ) {
>  		uint32_t *data = NULL;
> -- 
> 2.43.0
> 
