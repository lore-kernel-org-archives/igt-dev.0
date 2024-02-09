Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCB3C48297
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 13:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C57310E0A1;
	Fri,  9 Feb 2024 13:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4+GvqjB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101C10E0A1
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 13:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707484128; x=1739020128;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TCSnnOttxjRJ9vYUL8bxYORgIFp4h9qArRBDy/TxFHs=;
 b=C4+GvqjBsxKb5oCw+4N7N2TYrRJkfsnQ1fLdEbArdTlNCGEanf4tNuph
 ss/XgnWzmpimoheu8UV7jH8aysRHAI/LRw+DwgT1hmMuXzXgfZoO4FOPr
 I6zAf7ixKwpL9Qg2XBEdlhoi6hgUdXFY2mKyHJxIBmZGaUntQ6kTVa3dj
 4BO9Jwcdca9vYR1T94rGZstBjZRPe3cVaLTE+TPzUZgUSERV5zW/7Tqo2
 Eh/FmXcRpj+U9KlTptYPICELF4LmCsd5R7XYKwV5pj54Kebxv0EFhfB/q
 YodJ+2mhwCWZzWppablX/PhL4PYjKPuTlRiT8jQ8mY10GdgEvW+GpSZNU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12511637"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="12511637"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 05:08:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1921446"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 05:08:44 -0800
Date: Fri, 9 Feb 2024 14:08:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v3 5/8] scripts/igt_doc.py: better handle default gpu
Message-ID: <20240209130841.ircpzb4zzdbyo6ba@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
 <20240209123543.289204-6-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240209123543.289204-6-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-02-09 at 13:34:44 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The variable "gpu" is used on several loops inside
> gen_intelci_testlist(). That's confusing and error-pruned.
---------------------------------------------- ^^^^^^^^^^^^
s/error-pruned/error prone/

With that

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Instead, use "default_gpu" for the one used only for
> default values.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/igt_doc.py | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 1c2c7a8ef973..fd1960dac6e0 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -107,6 +107,7 @@ class IgtTestList(TestList):
>          # Create a testlist dictionary
>  
>          testlists = {}
> +        default_gpu = "default"
>  
>          for driver, run_types in tests_per_list.items():
>              testlists[driver] = {}
> @@ -120,18 +121,15 @@ class IgtTestList(TestList):
>                      if "all" in tests_per_list[driver][run_type][subname]:
>                          continue
>  
> -                    if not gpu_set:
> -                        gpu = "default"
> -
>                      # Trivial case: fields not defined: add subtest
>                      if not gpu_set:
> -                        if gpu not in testlists[driver]:
> -                            testlists[driver][gpu] = {}
> +                        if default_gpu not in testlists[driver]:
> +                            testlists[driver][default_gpu] = {}
>  
> -                        if run_type not in testlists[driver][gpu]:
> -                            testlists[driver][gpu][run_type] = set()
> +                        if run_type not in testlists[driver][default_gpu]:
> +                            testlists[driver][default_gpu][run_type] = set()
>  
> -                        testlists[driver][gpu][run_type].add(subname)
> +                        testlists[driver][default_gpu][run_type].add(subname)
>                          continue
>  
>                      if not gpus:
> @@ -173,7 +171,16 @@ class IgtTestList(TestList):
>                              testlists[driver][gpu][run_type].add(subname)
>  
>                      if default_gpu_value:
> -                        testlists[driver][gpu][run_type].add(subname)
> +                        if default_gpu not in testlists[driver]:
> +                            testlists[driver][default_gpu] = {}
> +
> +                        if run_type not in testlists[driver][default_gpu]:
> +                            testlists[driver][default_gpu][run_type] = set()
> +
> +                        testlists[driver][default_gpu][run_type].add(subname)
> +
> +        if len(gpu_set) == 0:
> +            gpu_set.add(default_gpu)
>  
>          return (testlists, gpu_set)
>  
> -- 
> 2.43.0
> 
