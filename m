Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FD3CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 13:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C8810F322;
	Thu, 21 May 2026 13:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAfCBcI/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C3310F322
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779371936; x=1810907936;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zQUS2yF0rjWHAv1DsbQzWIOt9JqnajrX6Je9Q5U8nM4=;
 b=NAfCBcI/TKgywK/rUg5EPCTqnnLyd06XozBgBEkAGIeCUBdx128tz/Eh
 ihntZzEnqXFS/tYabw4HJe5s2juF9iis0cVj/QkuzxtxIM5pu0669dcgo
 uFGQ3zlV+1XKdSjAgY1e/3zCwGqFdk9NS7hUAl57UkgzuKj2TrI00HXxM
 rrMLAOqfN8+Ac+h4vksJOQf7HlKSo8OmZuMT40ohIC3rk7ek3dWe0V57e
 bOIXqcafxuWeFIr7xxhQZfZnikYhz+V+jFKL2vBJzZaAQ1Suwo/+Wy+fc
 7HHXi49hfXT3+9snVvcCJlhe4BNOzBAqm6rfeAJAPxFqWc1FgVSysYGCb w==;
X-CSE-ConnectionGUID: R8I9vQM/Tw+WNR5zgwEVKg==
X-CSE-MsgGUID: N1iKB3NzQnOGx4e1/zhweA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91760716"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="91760716"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 06:58:55 -0700
X-CSE-ConnectionGUID: dn82DzRMQMqH1ckGxj7BuA==
X-CSE-MsgGUID: Mj8oIYbKRh+GijqwaYdGPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="278645734"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.106])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 06:58:53 -0700
Date: Thu, 21 May 2026 15:58:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH 2/2] tests/intel/xe_exec_store: increase batchbuffer size
Message-ID: <vsbupinzcjmdwzsyrta6v7uuw3o7tsjwvp2puom74gkzfjkx2d@bt265dhfy6i3>
References: <20260521-ibb_fixes2-v1-0-7094a6ff3520@intel.com>
 <20260521-ibb_fixes2-v1-2-7094a6ff3520@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-ibb_fixes2-v1-2-7094a6ff3520@intel.com>
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

On Thu, May 21, 2026 at 01:32:20PM +0200, Andrzej Hajda wrote:
> In case of some platforms 32K is too small for the shader.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index faf2c7fa86ce..b9753dc22f9a 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -352,7 +352,7 @@ static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
>  {
>  	const uint64_t target_offset = 0x1a000000;
>  	const uint64_t bb_offset = 0x1b000000;
> -	const size_t bb_size = 32768;
> +	const size_t bb_size = 65536;

I think we can now use SZ_64K.

But that's minor and may stay as it is.

--
Zbigniew

>  	uint32_t vm_id;
>  	uint32_t exec_queue;
>  	const unsigned int instruction_count = 128;
> 
> -- 
> 2.54.0
> 
