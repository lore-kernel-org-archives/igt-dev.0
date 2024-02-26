Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10253C54E49
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 11:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C8810EE9A;
	Mon, 26 Feb 2024 11:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B89V4Rm2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BAB10EE9A
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 11:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708945494; x=1740481494;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qBoJHmzr5hHQpgARID9KCc7qsod5fyD2CCaxDGVW1SE=;
 b=B89V4Rm2HVI6hXTh6n+NfuZAmgZyE8UuBMXLE2MsUhacTBV0gxK1RWPp
 WpGeehCauC6wRyvd1bnVqLrH91YvUFMi84Qk8V4oDltigJvgexaFU/Dn8
 Q9kwkJqdr2AtU493ifIlrhWAHt8ixzFQyZBgtEH3LT++S2WjON5fWiOWB
 ccy16tPxV5AT5OJ9mKDDL8u/qExrBWrjVwM/Pn5xJdwanr2OBRaJlQOW7
 y3aDvmUkwCcNPp7hNBIMGIMgpIomCrIECaAEs8loiZo0t+Vs8oFN9eB+7
 yynA4PswhZ4wkClWXDpEaHGD8jrRGMkCCNOErkowI6sfEA3PAFbdNTfGy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14657064"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="14657064"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:04:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="29812620"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 03:04:52 -0800
Date: Mon, 26 Feb 2024 12:04:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 3/4] scripts/igt_doc.py: fix trivial case handling
Message-ID: <20240226110449.hfznb3eeoh56a2ap@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240222114741.196042-1-mauro.chehab@linux.intel.com>
 <20240222114741.196042-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240222114741.196042-4-mauro.chehab@linux.intel.com>
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
On 2024-02-22 at 12:45:27 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The check is done too late, causing it to not do what it was
> expected: instead of checking for the gpu_set, it shall instead
----------- ^^^^^^ -------------------------------------- ^^^^^^^

imho better to drop second "instead" word:

... expected: instead of checking for the gpu_set, it shall check ...

> check if the subnames dict is empty.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 37 +++++++++++++++++--------------------
>  1 file changed, 17 insertions(+), 20 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 7985cdd5ac5e..2417081b80be 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -20,6 +20,7 @@ from test_list import TestList
>  class IgtTestList(TestList):
>      def __init__(self, *args, **kwargs):
>          self.split_regex = re.compile(r",\s*")
> +        self.default_gpu = "default"
>  
>          super().__init__(*args, **kwargs)
>  
> @@ -122,30 +123,33 @@ class IgtTestList(TestList):
>          # Create a testlist dictionary
>  
>          testlists = {}
> -        default_gpu = "default"
>  
>          for driver, run_types in tests_per_list.items():
>              testlists[driver] = {}
> +            testlists[driver][self.default_gpu] = {}
> +
>              for run_type, subnames in run_types.items():
> -
>                  if not run_type:
>                      run_type = "other"
>  
> +                if run_type not in testlists[driver][self.default_gpu]:
> +                    testlists[driver][self.default_gpu][run_type] = set()
> +
>                  for subname, gpus in subnames.items():
>                      # Globally blocklisted values: ignore subtest
>                      if "all" in tests_per_list[driver][run_type][subname]:
>                          continue
>  
> -                    # Trivial case: fields not defined: add subtest
> -                    if not gpu_set:
> -                        if default_gpu not in testlists[driver]:
> -                            testlists[driver][default_gpu] = {}
> +                    # If GPU field is used, default is to block list
> +                    default_gpu_value = True
> +                    for gpu, value in gpus.items():
> +                        if value:
> +                            default_gpu_value = False
> +                            break
>  
> -                        if run_type not in testlists[driver][default_gpu]:
> -                            testlists[driver][default_gpu][run_type] = set()
> -
> -                        testlists[driver][default_gpu][run_type].add(subname)
> -                        continue
> +                    # Fill default values
> +                    if default_gpu_value:
> +                        testlists[driver][self.default_gpu][run_type].add(subname)
>  
>                      if not gpus:
>                          for gpu in gpu_set:
> @@ -163,13 +167,6 @@ class IgtTestList(TestList):
>                              testlists[driver][gpu][run_type].add(subname)
>                          continue
>  
> -                    # If GPU field is used, default is to block list
> -                    default_gpu_value = True
> -                    for gpu, value in gpus.items():
> -                        if value:
> -                            default_gpu_value = False
> -                            break
> -
>                      for gpu in gpu_set:
>                          value = tests_per_list[driver][run_type][subname].get(gpu, default_gpu_value)
>  
> @@ -184,8 +181,8 @@ class IgtTestList(TestList):
>  
>                          testlists[driver][gpu][run_type].add(subname)
>  
> -        if len(gpu_set) == 0:
> -            gpu_set.add(default_gpu)
> +        # Always create a default GPU
> +        gpu_set.add(self.default_gpu)
>  
>          return (testlists, gpu_set)
>  
> -- 
> 2.43.2
> 
