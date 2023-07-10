Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57BE10E132
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 14:56:33 +0000 (UTC)
Date: Mon, 10 Jul 2023 16:56:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230710145627.52nt7ud2sbmgx2z6@kamilkon-desk1>
References: <20230710091347.689384-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230710091347.689384-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] scripts/test_list.py: fix
 __filter_subtest() logic
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

On 2023-07-10 at 11:13:47 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The logic there is searching a value at the wrong place, as
> "test" variable at the callers are a number inside doc.test
> array. Fix it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 19ed5e5467f5..4f580fb3de58 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -569,7 +569,7 @@ class TestList:
>  
>              subtest_array = self.expand_subtest(fname, name, test, subtest_only)
>              for subtest in subtest_array:
> -                if self.__filter_subtest(test, subtest, True):
> +                if self.__filter_subtest(self.doc[test], subtest, True):
>                      continue
>  
>                  summary = subtest["Summary"]
> @@ -851,7 +851,7 @@ class TestList:
>          subtest_array.sort(key = lambda x : x.get('Summary'))
>  
>          for subtest in subtest_array:
> -            if self.__filter_subtest(test, subtest, True):
> +            if self.__filter_subtest(self.doc[test], subtest, True):
>                  continue
>  
>              if sort_field:
> -- 
> 2.40.1
> 

