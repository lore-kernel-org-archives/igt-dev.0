Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F85810E06D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 18:04:54 +0000 (UTC)
Date: Mon, 9 Oct 2023 20:04:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231009180432.l5gnp4vjz4s7xi63@kamilkon-desk.igk.intel.com>
References: <20231009180118.386877-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231009180118.386877-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "scripts/test_list.py: fix and
 simplify missing doc check"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Juha-Pekka,
On 2023-10-09 at 21:01:18 +0300, Juha-Pekka Heikkila wrote:
> This fixes the build without chamelium
> 
> This reverts commit 334a1178a36a1327dc7fbba43ab16d1f3a7d887b.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index c0462188b..daca290a0 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1105,13 +1105,39 @@ class TestList:
>  
>              doc_subtests.add(subtest)
>  
> +        doc_subtests = list(sorted(doc_subtests))
> +
>          # Get a list of tests from
> -        run_subtests = set(self.get_testlist())
> +        run_subtests = self.get_testlist()
> +
> +        # Compare arrays
> +
> +        run_missing = []
> +        doc_uneeded = []
>  
> -        # Compare sets
> +        test_regex = r""
> +        for doc_test in doc_subtests:
> +            if test_regex != r"":
> +                test_regex += r"|"
> +            test_regex += doc_test
>  
> -        run_missing = list(sorted(run_subtests - doc_subtests))
> -        doc_uneeded = list(sorted(doc_subtests - run_subtests))
> +        test_regex = re.compile(r'^(' + test_regex + r')$')
> +
> +        for doc_test in doc_subtests:
> +            found = False
> +            for run_test in run_subtests:
> +                if test_regex.match(run_test):
> +                    found = True
> +                    break
> +            if not found:
> +                doc_uneeded.append(doc_test)
> +
> +        for run_test in run_subtests:
> +            found = False
> +            if test_regex.match(run_test):
> +                found = True
> +            if not found:
> +                run_missing.append(run_test)
>  
>          if doc_uneeded:
>              for test_name in doc_uneeded:
> -- 
> 2.34.1
> 
