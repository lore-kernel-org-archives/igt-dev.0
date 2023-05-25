Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3878E10E765
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 21:04:42 +0000 (UTC)
Date: Thu, 25 May 2023 23:04:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230525210436.kvy5bpfi2xegm3af@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-10-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525090535.2791739-10-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 09/11] scripts/test_list.py: add
 dynamic subtest support
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

On 2023-05-25 at 11:05:33 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> dynamic subtests can't be checked, as --list-subtests won't show
> them. So, we need to change the test check logic to support it,
> as otherwise, spurious warnings will be produced.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 21767870b1c1..9744d1cc5e6a 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -863,10 +863,14 @@ class TestList:
>          if self.filters:
>              print("NOTE: test checks are affected by filters")
>  
> -        doc_subtests = sorted(self.get_subtests()[""])
> +        doc_subtests = set()
>  
> -        for i in range(0, len(doc_subtests)): # pylint: disable=C0200
> -            doc_subtests[i] = re.sub(r'\<[^\>]+\>', r'\\d+', doc_subtests[i])
> +        for subtest in self.get_subtests()[""]:
> +            subtest = "@".join(subtest.split("@")[:3])
> +            subtest = re.sub(r'\<[^\>]+\>', r'\\d+', subtest)
> +            doc_subtests.add(subtest)
> +
> +        doc_subtests = list(sorted(doc_subtests))
>  
>          # Get a list of tests from
>          run_subtests = self.get_testlist()
> -- 
> 2.40.1
> 

