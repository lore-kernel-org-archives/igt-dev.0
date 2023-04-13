Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23EC10E36F
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 13:18:49 +0000 (UTC)
Date: Thu, 13 Apr 2023 15:08:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230413130819.oga4thpa7poz4npi@kamilkon-desk1>
References: <20230413092159.146658-1-mauro.chehab@linux.intel.com>
 <20230413092159.146658-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230413092159.146658-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/4] scripts/test_list.py: use a
 compiled regex for check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-04-13 at 11:21:58 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Speed up even further the logic for --check-testlist by
> pre-compiling the regex that will be used to validate the
> results.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 287351e717b3..96d8883db122 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -820,10 +820,18 @@ class TestList:
>          run_missing = []
>          doc_uneeded = []
>  
> +        test_regex = r""
> +        for doc_test in doc_subtests:
> +            if test_regex != r"":
> +                test_regex += r"|"
> +            test_regex += r'^' + doc_test + r'$'
> +
> +        test_regex = re.compile(test_regex)
> +
>          for doc_test in doc_subtests:
>              found = False
>              for run_test in run_subtests:
> -                if re.match(r'^' + doc_test + r'$', run_test):
> +                if re.match(test_regex, run_test):
>                      found = True
>                      break
>              if not found:
> @@ -831,10 +839,8 @@ class TestList:
>  
>          for run_test in run_subtests:
>              found = False
> -            for doc_test in doc_subtests:
> -                if re.match(r'^' + doc_test + r'$', run_test):
> -                    found = True
> -                    break
> +            if re.match(test_regex, run_test):
> +                found = True
>              if not found:
>                  run_missing.append(run_test)
>  
> -- 
> 2.39.2
> 

