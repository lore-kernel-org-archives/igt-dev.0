Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678AAC4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 13:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B9B10EA7D;
	Fri,  9 Feb 2024 13:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vo2wGsqE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF42310EA7D
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 13:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707484447; x=1739020447;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mZU2i9EtRVrlJsyYq4g2ePyBD8Cm17V027f3uJ+XU5k=;
 b=Vo2wGsqE0mWt+3RgYbZnlsLReIS3CdvZXMxDBLcMvwFNpO7OXI6EbYWY
 hmUmKyd0M1ZmBq3lqk9fHox5pZIAvIOKHNK/OTh9CGiqnZ/jo2YQEGHeU
 1jmJAoq4kPGw7JSCceFP0FG0aNEBCVThL3nJVXB+hlNVg8nJb5byeC2i3
 WjxFL8xzB67Q3d2Z8EN1GFEEJhWlDcjwOJujBRhdITPpWi+YlAneoBJYF
 66H1i8eWe6DE3l0crp9nIGJmAiJcCVp+ufQpmVamRP3jhxhF3JYgWVJh/
 sn1rQQcC0jksCHZnRDPHe6qjXzjL4MIqjrj3ywzkkzJgCp+hMyZ2JFk1N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="5243488"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="5243488"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 05:14:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="2280909"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 05:14:05 -0800
Date: Fri, 9 Feb 2024 14:14:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v3 7/8] scripts/igt_doc.py: simplify and cleanup
 tests_per_list logic
Message-ID: <20240209131402.r4zl6afrurk6eteg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
 <20240209123543.289204-8-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240209123543.289204-8-mauro.chehab@linux.intel.com>
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
On 2024-02-09 at 13:34:46 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Re-do the logic which calculates tests_per_list dict inside
> gen_intelci_testlist():
> 
> - better handle "other" runtype;
> 
> - better handle driver name discovery logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/igt_doc.py | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index bf51e5f4ebb3..1b4f7eafd135 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -61,36 +61,35 @@ class IgtTestList(TestList):
>          split_regex = re.compile(r",\s*")
>  
>          for subname, subtest in subtest_dict.items():
> -            run_types = subtest.get("Run type", "other")
> -            run_type_set = set(split_regex.split(run_types))
> -
> +            run_types = subtest.get("Run type", "other").lower()
> +            drivers = set()
>              run_type_set = set()
>              for run_type in set(split_regex.split(run_types)):
> -                run_type = run_type.lower()
> -
> -                drivers = set(self.drivers)
>  
>                  for driver in self.drivers:
> -                    driver = driver.lower()
> -
>                      if run_type.startswith(driver):
>                          run_type = re.sub(r"^" + driver + r"[\W_]*", "", run_type)
>                          drivers = set([driver])
>                          break
>  
> +                if not drivers:
> +                    drivers.update(self.drivers)
> +
> +                if not run_type:
> +                    run_type = "other"
> +
>                  run_type_set.add(run_type)
>  
> +            if not drivers:
> +                drivers = set(self.drivers)
> +
>              for driver in drivers:
>                  if driver not in tests_per_list:
>                      tests_per_list[driver] = {}
>  
>                  for run_type in run_type_set:
> -                    if not run_type:
> -                        run_type = "other"
> -
>                      if run_type not in tests_per_list[driver]:
>                          tests_per_list[driver][run_type] = {}
> -

imho this empty line should stay here but it is not a blocker

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>                      if subname not in tests_per_list[driver][run_type]:
>                          tests_per_list[driver][run_type][subname] = {}
>  
> -- 
> 2.43.0
> 
