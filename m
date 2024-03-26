Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C7ECD11DD
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 12:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2076210E1D0;
	Tue, 26 Mar 2024 12:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlBbAzeO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D2410E1D0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 12:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711454715; x=1742990715;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=03LkWZFEqNbHkLj8jbeFM8Afcdsh+Ijt+FNcKKcYscA=;
 b=GlBbAzeOrPNw1YSF/Z4pUFZVV8CH5nb8cJhiS61rrTYK3lGXmT9nbhVB
 r4/Kph5i9XaTs/YlitLxgX+Quzi5BY5dM0us06DTgDwMCUOTjRUm2viKO
 qaiOyTw41XBnThh1CePbBq8yyma8+kZLpSaXbkB3oOEPHAjQgc746zEs0
 dZ+SVHPUgzxPapKCxpXQZrAft5M3HWhE4tQA8Uii96FlxwwjRRcV9IhQN
 fzzj54sVOaF6FnS75S6LQOFF3RGi5MWzsKGfbwihzHnZIcqwUqnTcP8vQ
 KeJM0GR60wVuvL0nixu3zfCrqV6m04LnpM7kANKqeLA5aqdSlybJcdLn0 A==;
X-CSE-ConnectionGUID: B9L5O6RmTI+++pP6s5RXsw==
X-CSE-MsgGUID: /V0pLVEKQF+us8s+fizbqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17644479"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17644479"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 05:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="15979293"
Received: from unknown (HELO intel.com) ([10.247.118.204])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 05:05:10 -0700
Date: Tue, 26 Mar 2024 13:05:05 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Peter Senna Tschudin <me@petersenna.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 andi.shyti@linux.intel.com, Peter Senna Tschudin <peter.senna@gmail.com>
Subject: Re: [PATCH i-g-t v2] Fix memory access issue due to variable block
 scope
Message-ID: <ZgK58ZwkJxhF6G6C@ashyti-mobl2.lan>
References: <20240325213548.2881-1-me@petersenna.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325213548.2881-1-me@petersenna.com>
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

Hey Peter,

On Mon, Mar 25, 2024 at 10:35:48PM +0100, Peter Senna Tschudin wrote:
> This patch fixes the tests gem_exec_capture@many-4k-incremental and
> gem_exec_capture@many-4k-zero that are currently failing with an invalid file
> descriptor error.

where is gem_exec_capture calling for_each_ctx_cfg_engine()?

>  struct intel_execution_engine2 *
>  intel_get_current_engine(struct intel_engine_data *ed)
> 
> When intel_get_current_engine is called from the macro
> for_each_ctx_cfg_engine(), the variable *ed is defined within a for loop. The
> scope of *ed is limited to that loop, leading to access violations when
> attempting to access its contents outside the loop.
> 
> Before to this patch, intel_get_current_engine() would return an element of *ed
> and attempting to use it after the loop ended resulted in undefined behavior.
> 
> This patch introduces a memcpy() to copy the contents of ed->current_engine to
> a memory area not confined by the loop's scope, ensuring safe access to the
> data.
> 
> v2: Added 'i-g-t' to the Subject.
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> ---
>  lib/i915/gem_engine_topology.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> index afb576afb..b3b809482 100644
> --- a/lib/i915/gem_engine_topology.c
> +++ b/lib/i915/gem_engine_topology.c
> @@ -189,12 +189,24 @@ static int __query_engine_list(int fd, struct intel_engine_data *ed)
>  struct intel_execution_engine2 *
>  intel_get_current_engine(struct intel_engine_data *ed)
>  {
> +	struct intel_execution_engine2 *ret = NULL;
> +
>  	if (ed->n >= ed->nengines)
>  		ed->current_engine = NULL;
>  	else if (!ed->n)
>  		ed->current_engine = &ed->engines[0];
>  
> -	return ed->current_engine;
> +	// When called from the macro for_each_ctx_cfg_engine(), *ed is defined
> +	// inside a for loop. In that case, not memcping ed->current_engine
> +	// will lead to a memory access violation when trying to access the
> +	// contents of ed->current_engine after the end of the for loop

can you please use /* ... */ style of comment?

> +	if (ed->current_engine) {
> +		ret = malloc(sizeof(*ret));

should this be freed at some point?

Andi
