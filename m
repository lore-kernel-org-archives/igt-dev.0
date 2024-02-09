Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB3CC48297
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 13:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AADB10E5C6;
	Fri,  9 Feb 2024 13:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/yX7cuO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A07710E5C6
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 13:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707483920; x=1739019920;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Eb+6G4a/BfEsqJaIZnVT1TaihHh0ijFyD50hf0WUdrE=;
 b=H/yX7cuOoG8P7H+/2G2TNJHa0uPNMjwoT77jBK+5vOWu5IXWiJEDhmU0
 L7RN++/Ui0QN7/2eR3Y1W7+3hte/OlJs5XyPq/2zrYOsBsEKavA7siYOQ
 chTj7npw+0/ijRPrPxldZmvxVpDyEqUBOikCbCShGWI/ldYKZrZZgUjM/
 QtxaIxyCeS96TSjFK6YT/qCkq5BPfaFvdPGorE1ksZcPlAZe6pDwhcRme
 Bg8LsHcQm+0S82PcCMPJ7NkzMZLlX47IZNvx9p/1lAVlZxWZDVD+dodI5
 Gy/W3KZoG1Bgt5C4Dc/MwvDd0qya4wAjSwpPprZPv2xw7zntM5yp0y8X5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395849203"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="395849203"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 05:05:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6580711"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 05:05:01 -0800
Date: Fri, 9 Feb 2024 14:04:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v3 4/8] scripts/igt_doc.py: only create dict if
 subtest will be added
Message-ID: <20240209130458.3irrw2r3m2mhl63h@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
 <20240209123543.289204-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240209123543.289204-5-mauro.chehab@linux.intel.com>
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
On 2024-02-09 at 13:34:43 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Currently, depending on the order of the sets/dict, some
> empty testlists are created. Change the logic to only add
> an entry into the dict if a subtest will be added to it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 8a10db13081c..1c2c7a8ef973 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -116,31 +116,31 @@ class IgtTestList(TestList):
>                      run_type = "other"
>  
>                  for subname, gpus in subnames.items():
> -                    if not gpu_set:
> -                        gpu = "default"
> -
> -                    if gpu not in testlists[driver]:
> -                        testlists[driver][gpu] = {}
> -
> -                    if run_type not in testlists[driver][gpu]:
> -                        testlists[driver][gpu][run_type] = set()
> -
> -                    # Trivial case: fields not defined
> -                    if not gpu_set:
> -                        testlists[driver][gpu][run_type].add(subname)
> -                        continue
> -
> -                    # Globally blocklisted values
> +                    # Globally blocklisted values: ignore subtest
>                      if "all" in tests_per_list[driver][run_type][subname]:
>                          continue
>  
> -                    # Nothing blocked of explicitly added.
> -                    # It means that test should be on testlists
> +                    if not gpu_set:
> +                        gpu = "default"
> +
> +                    # Trivial case: fields not defined: add subtest
> +                    if not gpu_set:
> +                        if gpu not in testlists[driver]:
> +                            testlists[driver][gpu] = {}
> +
> +                        if run_type not in testlists[driver][gpu]:
> +                            testlists[driver][gpu][run_type] = set()
> +
> +                        testlists[driver][gpu][run_type].add(subname)
> +                        continue
> +
>                      if not gpus:
>                          for gpu in gpu_set:
> +                            # blocked on all GPUs: ignore subtest
>                              if gpu == "all":
>                                  continue
>  
> +                            # Nothing blocked: add subtest
>                              if gpu not in testlists[driver]:
>                                  testlists[driver][gpu] = {}
>  
> -- 
> 2.43.0
> 
