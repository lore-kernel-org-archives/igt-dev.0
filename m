Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053B8C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 16:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A129F1122DF;
	Mon,  4 Mar 2024 16:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GOOxn9ic";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BF91122E1
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709568352; x=1741104352;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X8RxpAA6cL2cxRfbinS4brW1c6yAsoUX05FpRD/wd5g=;
 b=GOOxn9icbqWgn9QH8F4Gj3UFTQdqQBQ9qDBZDetWZU+zxw4Ai5ML6OaF
 x1J6TwrfmuGgtA+KEhGcNiyT+HuaFJlpoiu9oozyDXnLyIC7QQw4a7zFS
 dSxH60+zuKuLUc2qjA0Qv2gQlK5ZB/nGd1F/d7wE0uGtQN9Wid87ENFIu
 lI3PwJkrTAN5kUtkls8tTFaQ9DF2OFAFcwPbjxf53WQyMcqdD3i2yRKSy
 ctuzg8MaQnlUS6/es7LjgP6rTwBnstrxQOLGfEDsGR9+DkiAl6Zsj9/0j
 cZwG/vfi4gMMlNhoS0J1/YlF4wss8VLmbAi9HbJf2cSW64rQLLMizNKFI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4234267"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4234267"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:05:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8983120"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 08:05:33 -0800
Date: Mon, 4 Mar 2024 17:05:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Allow to load kunit from alias
Message-ID: <20240304160529.rr2z4dmzbkeyih4o@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20240222193044.3004471-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240222193044.3004471-1-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-02-22 at 11:30:44 -0800, Lucas De Marchi wrote:
> Instead of only allowing to load the from the module name, also allow it
> from alias by using kmod_module_new_from_lookup(). With that a user can
> have their on aliases and the kernel can also export a compat alias for
> future module renames.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

It is somehow test listing failing: ./dmabuf --list

tests/dmabuf:
Checking invalid option handling...
Checking valid option handling...
Checking subtest enumeration...
test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
FAIL: tests/dmabuf

Regards,
Kamil

>  lib/igt_kmod.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index cc242838f..43c52eaab 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1443,6 +1443,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  int igt_ktest_init(struct igt_ktest *tst,
>  		   const char *module_name)
>  {
> +	struct kmod_list *l = NULL;
>  	int err;
>  
>  	memset(tst, 0, sizeof(*tst));
> @@ -1453,9 +1454,14 @@ int igt_ktest_init(struct igt_ktest *tst,
>  
>  	tst->kmsg = -1;
>  
> -	err = kmod_module_new_from_name(kmod_ctx(), module_name, &tst->kmod);
> -	if (err)
> +	err = kmod_module_new_from_lookup(kmod_ctx(), module_name, &l);
> +	if (err < 0)
>  		return err;
> +	if (!l)
> +		return -ENOENT;
> +
> +	tst->kmod = kmod_module_get_module(l);
> +	kmod_module_unref_list(l);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
