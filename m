Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB22CFA3741
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 11:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF4510E258;
	Fri, 13 Sep 2024 11:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvOgpbXp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D7710E258
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726225404; x=1757761404;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P9OPTRgjmFiYGPwJO23eTcjZcukwz+AfjOOwUQPhSEY=;
 b=LvOgpbXpbfUZ5NVU6bXXLykkXG1TUv4XbXXAiYTXpEbGUwzXy3TbsR7Y
 GkdOso+dvkAlkYPbxxBPMr3XTM54ZJeZPTd6/oGX+9b9urYmI16lJlYHG
 Tv4pGxpRkXcATMAtJ2dSXlKMKdYPYgMYTMSPAegNU2+I+DUmmYE21HcgJ
 dzgjkHxZwXWVdaOSHSHmr52NCOD81XgFl30yu4xOe6v+gbHprZprqAg20
 SwkZYNu3H8KzAK9EdbHiAZ0U67J/UKEaRkA6U14Bi4vMpjZ1lv4vGRJIm
 EjZi8VMbrehnDFL7B/qHYCyfmeS2iyPAx+Qesg1rCPXgohc5fh4ojA+O6 g==;
X-CSE-ConnectionGUID: m/l0SmtVQR2V+bdDsHbPxQ==
X-CSE-MsgGUID: 1VX6k7cMSE6GmGWpM9953Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28867008"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="28867008"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:03:24 -0700
X-CSE-ConnectionGUID: uUULStrnT3Si79kzTvFO5Q==
X-CSE-MsgGUID: hNADHpK+SAelM4Hw79CRgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="67986533"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.112])
 ([10.245.246.112])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:03:21 -0700
Message-ID: <0bdc2ffd-120d-44db-802f-cad9f2a3a89f@intel.com>
Date: Fri, 13 Sep 2024 13:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] scripts/test_list: relax treatment of
 non-compiled tests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240912140401.137060-1-kamil.konieczny@linux.intel.com>
 <20240912140401.137060-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240912140401.137060-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Kamil,

On 12.09.2024 16:04, Kamil Konieczny wrote:
> Some tests could be added and compiled only when non-default
> meson option is given. It will result in no testlist generated
> for such tests but they could appear in our documentation.
> Currently we report an error in such case.
> 
> Create a way to detect and report that and treat this as feature
> and do not report it as an error.  This should allow to relax
> processing of chamelium and other new tests.
> 
> Also while at this, print error information before actually
> exiting with an error code, as previous prints were only
> warnings.
> 
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   scripts/test_list.py | 31 +++++++++++++++++++++++++++++--
>   1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 69c830ca1..322933c26 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1141,6 +1141,20 @@ class TestList:
>   
>           return sorted(tests)
>   
> +    def get_notcompiled(self):
> +
> +        """ Return a list of tests which were not compiled """
> +        no_binaries = []
> +        for name in self.filenames:
> +            test_basename = re.sub(r"\.c$", "", name.split('/')[-1])
> +            fname = os.path.join(self.igt_build_path, "tests", test_basename)
> +
> +            if not os.path.isfile(fname):
> +                print(f"{test_basename}: No binary found, test was not compiled.")
> +                no_binaries.append(test_basename)
> +
> +        return sorted(no_binaries)
> +
>       #
>       # Validation methods
>       #
> @@ -1177,21 +1191,34 @@ class TestList:
>           # Get a list of tests from
>           run_subtests = set(self.get_testlist())
>   
> +        # Get a list of not compiled tests
> +        no_binary = set(self.get_notcompiled())
> +
>           # Compare sets
>   
>           run_missing = list(sorted(run_subtests - doc_subtests))
>           doc_uneeded = list(sorted(doc_subtests - run_subtests))
>   
> +        """Check if there are (possibly unneeded) documented subtests"""
>           if doc_uneeded:
> +            un_reported = []
>               for test_name in doc_uneeded:
> -                print(f"Warning: Documented {test_name} doesn't exist on source files")
> +                test_basename = test_name.split('@')[1]
> +                if test_basename in no_binary:
> +                    if test_basename not in un_reported:
> +                        print(f"Info: Documented {test_name} don't have a binary {test_basename}")
> +                        un_reported.append(test_basename)
> +                else:
> +                    print(f"Info: Documented {test_name} doesn't exist on source files")
>   
> +        """Check for missing documentation"""
>           if run_missing:
>               for test_name in run_missing:
>                   print(f'Warning: Missing documentation for {test_name}')
>               print('Please refer: docs/test_documentation.md for more details')
>   
> -        if doc_uneeded or run_missing:
> +        if run_missing:
> +            print('Error: Missing tests documentation')
>               sys.exit(1)

I would suggest to relax this check a little bit less, i.e. allow for 
documentation of tests that were not compiled, but disallow 
documentation for sub tests that are missing in compiled files. This 
leaves the benefit of ensuring there is no leftover documentation.

Something like:

+    def get_not_compiled(self):
+
+        """ Return a list of tests which were not compiled """
+        no_binaries = []
+        for name in self.filenames:
+            test_basename = re.sub(r"\.c$", "", name.split('/')[-1])
+            fname = os.path.join(self.igt_build_path, "tests", 
test_basename)
+
+            if not os.path.isfile(fname):
+                no_binaries.append(test_basename)
+
+        return sorted(no_binaries)
+
      #
      # Validation methods
      #
@@ -1177,21 +1190,24 @@ class TestList:
          # Get a list of tests from
          run_subtests = set(self.get_testlist())

+        not_compiled = set(self.get_not_compiled())
+        for test_basename in not_compiled:
+            print(f"INFO: Found documentation for '{test_basename}' but 
no binary")
+
          # Compare sets

          run_missing = list(sorted(run_subtests - doc_subtests))
          doc_uneeded = list(sorted(doc_subtests - run_subtests))
+        doc_uneeded_build = [t for t in doc_uneeded if t.split('@')[1] 
not in not_compiled]

-        if doc_uneeded:
-            for test_name in doc_uneeded:
-                print(f"Warning: Documented {test_name} doesn't exist 
on source files")
-
-        if run_missing:
+        if doc_uneeded_build or run_missing:
              for test_name in run_missing:
-                print(f'Warning: Missing documentation for {test_name}')
-            print('Please refer: docs/test_documentation.md for more 
details')
+                print(f'ERROR: Missing documentation for {test_name}')

-        if doc_uneeded or run_missing:
+            for test_name in doc_uneeded_build:
+                print(f'ERROR: Unneeded documentation for {test_name}')
+
+            print('Please refer: docs/test_documentation.md for more 
details')
              sys.exit(1)

Anyway, as discussed offline I will grab your change and integrate it 
into the eudebug series.

Thanks,
Christoph


>   
>       #
