Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0539E10E265
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 10:46:35 +0000 (UTC)
Date: Mon, 9 Oct 2023 12:46:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231009104631.i6gab3rkrqhswngp@kamilkon-desk.igk.intel.com>
References: <20231009100332.392968-1-mauro.chehab@linux.intel.com>
 <20231009100332.392968-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231009100332.392968-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] scripts/test_list.py: fix and
 simplify missing doc check
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

Hi Mauro,
On 2023-10-09 at 12:01:38 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Instead of using regexes, we can simply use sets to check what's
> missing. I means an easier check and less error-prone.
---------- ^^^^^^^^^^^^^^^^^^^^^^^
Better: This make checks easier

Please merge this one as a last.

With this:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/test_list.py | 34 ++++------------------------------
>  1 file changed, 4 insertions(+), 30 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index daca290a02bd..c0462188ba8a 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1105,39 +1105,13 @@ class TestList:
>  
>              doc_subtests.add(subtest)
>  
> -        doc_subtests = list(sorted(doc_subtests))
> -
>          # Get a list of tests from
> -        run_subtests = self.get_testlist()
> +        run_subtests = set(self.get_testlist())
>  
> -        # Compare arrays
> +        # Compare sets
>  
> -        run_missing = []
> -        doc_uneeded = []
> -
> -        test_regex = r""
> -        for doc_test in doc_subtests:
> -            if test_regex != r"":
> -                test_regex += r"|"
> -            test_regex += doc_test
> -
> -        test_regex = re.compile(r'^(' + test_regex + r')$')
> -
> -        for doc_test in doc_subtests:
> -            found = False
> -            for run_test in run_subtests:
> -                if test_regex.match(run_test):
> -                    found = True
> -                    break
> -            if not found:
> -                doc_uneeded.append(doc_test)
> -
> -        for run_test in run_subtests:
> -            found = False
> -            if test_regex.match(run_test):
> -                found = True
> -            if not found:
> -                run_missing.append(run_test)
> +        run_missing = list(sorted(run_subtests - doc_subtests))
> +        doc_uneeded = list(sorted(doc_subtests - run_subtests))
>  
>          if doc_uneeded:
>              for test_name in doc_uneeded:
> -- 
> 2.41.0
> 

