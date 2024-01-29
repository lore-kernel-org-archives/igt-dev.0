Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74888C47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 09:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB7810F652;
	Mon, 29 Jan 2024 09:55:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BCC10F652
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706522116; x=1738058116;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RV7QyShxaPtdrFbKKs0YTV9SXpaP0n92RJAfQe2nveg=;
 b=EiJCc4IR10JdcpFLP52j2zKXA7io3ny4167dSzmuKIav/r/Jwyqowlvx
 PZGWUJonKXGBGDD1+vO93vlXBfhrz7PLof+Jzv09g6GS+BpC7mZBYJRMC
 jZy6DGB+34O99LUOnPTt93/8QSw2M/WgzlAQmQ1Ad58rqM0Dkn2Oo8rGc
 ZQdwd4MY0s3sthHdyxzE7W2BmtmYgOvpCxIFzKrgRb4+Z/2mwSFU45cBv
 NgxmAdJWtMRCM1OhP3IHQjtuHiBf7pYGeAAVeGXkE9GaA8skBJE3MRJPb
 r64XyBCQfqk41eSZ+dE1ua1I8PMw071sUk4TojPCPlK2A31xnmBaAQBuk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="16266152"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="16266152"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="907048659"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="907048659"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 01:54:54 -0800
Date: Mon, 29 Jan 2024 10:54:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] scripts/igt_doc.py: allow using multiple
 config files at the same time
Message-ID: <20240129095452.qmh6hprh5i7zshhf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240126124021.2700482-1-mauro.chehab@linux.intel.com>
 <20240126124021.2700482-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240126124021.2700482-2-mauro.chehab@linux.intel.com>
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
On 2024-01-26 at 13:37:27 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> When generating testlists meant to test multiple testplan configs at
> the same time, we need to group tests from different testplans.
> 
> Add support for it by letting the command be called with multiple
> config files.
> 
> While this might be useful for other tool outputs, it may not be
-------------------------------------- ^^^^
Did you mean this tool, igt_doc.py? If yes, please give example
what you mean here, I am a little confused, like:

While this might be useful for other outputs, for example:

... write here what will not be supported ...

As you stated in subject, you want to allow user to have multiply
configs at the same time so write when it is not allowed.

With that:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> it may not be
> producing what the user expects, so, add warnings when needed and
> multiple configs are used at the same time.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/igt_doc.py | 124 +++++++++++++++++++++++++++++++--------------
>  1 file changed, 86 insertions(+), 38 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index df3f72c8d69f..b66eefe799e9 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -170,15 +170,35 @@ class IgtTestList(TestList):
>  
>          return (testlists, gpu_set)
>  
> -    def write_intelci_testlist(self, directory):
> +class IntelciTestlist:
> +    def __init__(self):
> +        self.testlists = {}
> +        self.gpu_set = set()
> +
> +    def add(self, testlist, gpu_set):
> +        self.gpu_set.update(gpu_set)
> +
> +        for driver, gpus in testlist.items():
> +            if driver not in self.testlists:
> +                self.testlists[driver] = {}
> +
> +            for gpu in gpus:
> +                if gpu not in self.testlists[driver]:
> +                    self.testlists[driver][gpu] = {}
> +
> +                for run_type in testlist[driver][gpu]:
> +                    if run_type not in self.testlists[driver][gpu]:
> +                        self.testlists[driver][gpu][run_type] = set()
> +
> +                    self.testlists[driver][gpu][run_type].update(testlist[driver][gpu][run_type])
> +
> +    def write(self, directory):
>          '''Create testlist directory (if needed) and files'''
>  
>          if not os.path.exists(directory):
>              os.makedirs(directory)
>  
> -        testlists = self.gen_intelci_testlist()
> -
> -        for driver, gpus in testlists[0].items():
> +        for driver, gpus in self.testlists.items():
>              driver_path = os.path.join(directory, driver)
>              try:
>                  os.makedirs(driver_path)
> @@ -224,7 +244,7 @@ def main():
>      parser = argparse.ArgumentParser(description = "Print formatted kernel documentation to stdout.",
>                                      formatter_class = argparse.ArgumentDefaultsHelpFormatter,
>                                      epilog = 'If no action specified, assume --rest.')
> -    parser.add_argument("--config", required = True,
> +    parser.add_argument("--config", required = True, nargs='+',
>                          help="JSON file describing the test plan template")
>      parser.add_argument("--rest",
>                          help="Output documentation from the source files in REST file.")
> @@ -254,43 +274,71 @@ def main():
>  
>      parse_args = parser.parse_args()
>  
> -    tests = IgtTestList(config_fname = parse_args.config,
> -                        include_plan = parse_args.include_plan,
> -                        file_list = parse_args.files,
> -                        igt_build_path = parse_args.igt_build_path)
> -
> -    if parse_args.filter_field:
> -        for filter_expr in parse_args.filter_field:
> -            tests.add_filter(filter_expr)
> -
> -    run = False
> -    if parse_args.show_subtests:
> -        run = True
> -        tests.show_subtests(parse_args.sort_field)
> -
> -    if parse_args.check_testlist:
> -        run = True
> -        tests.check_tests()
> -
> -    if parse_args.gen_testlist:
> -        run = True
> -        if not parse_args.sort_field:
> -            sys.exit("Need a field to split the testlists")
> -        tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field)
> +    test_array = []
>  
> +    # Except for intelci_testlist, all options are handled per config
> +    # file, as the typical usage is to pass just one config file.
> +
> +    for config in parse_args.config:
> +        tests = IgtTestList(config_fname = config,
> +                            include_plan = parse_args.include_plan,
> +                            file_list = parse_args.files,
> +                            igt_build_path = parse_args.igt_build_path)
> +
> +        if parse_args.filter_field:
> +            for filter_expr in parse_args.filter_field:
> +                tests.add_filter(filter_expr)
> +
> +        run = False
> +        if parse_args.show_subtests:
> +            run = True
> +            tests.show_subtests(parse_args.sort_field)
> +
> +        if parse_args.check_testlist:
> +            run = True
> +            tests.check_tests()
> +
> +        if parse_args.gen_testlist:
> +            run = True
> +            if not parse_args.sort_field:
> +                sys.exit("Need a field to split the testlists")
> +            if len(config) > 1:
> +                sys.exit("Only one config file is supported with --json option")
> +            tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field)
> +
> +        if parse_args.intelci_testlist:
> +            run = True
> +            test_array.append(tests)
> +
> +        if parse_args.to_json:
> +            run = True
> +            if len(parse_args.config) > 1:
> +                sys.exit(f"Only one config file is supported with --json option, but {len(parse_args.config)} specified")
> +
> +            tests.print_json(parse_args.to_json)
> +
> +        if not run or parse_args.rest:
> +            if len(parse_args.config) > 1:
> +                if parse_args.rest:
> +                    sys.exit(f"Only one config file is supported with --rest option, but {len(parse_args.config)} specified")
> +
> +            if parse_args.per_test:
> +                tests.print_rest_flat(parse_args.rest)
> +            else:
> +                tests.print_nested_rest(parse_args.rest)
> +
> +    if not run and len(parse_args.config) > 1:
> +        print("Warning: output was shown per-config file")
> +
> +    # Group testlists altogether when generating intel-ci output
>      if parse_args.intelci_testlist:
> -        run = True
> -        tests.write_intelci_testlist(parse_args.intelci_testlist)
> +        intel_testlists = IntelciTestlist()
>  
> -    if parse_args.to_json:
> -        run = True
> -        tests.print_json(parse_args.to_json)
> +        for tests in test_array:
> +            (testlist, gpu_set) = tests.gen_intelci_testlist()
> +            intel_testlists.add(testlist, gpu_set)
>  
> -    if not run or parse_args.rest:
> -        if parse_args.per_test:
> -            tests.print_rest_flat(parse_args.rest)
> -        else:
> -            tests.print_nested_rest(parse_args.rest)
> +        intel_testlists.write(parse_args.intelci_testlist)
>  
>  if __name__ == '__main__':
>      main()
> -- 
> 2.43.0
> 
