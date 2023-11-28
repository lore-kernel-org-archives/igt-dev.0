Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFB510E589
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 15:57:13 +0000 (UTC)
Date: Tue, 28 Nov 2023 16:57:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231128155709.bictzgdsulhuludg@kamilkon-desk.igk.intel.com>
References: <20231128105054.24317-1-mauro.chehab@linux.intel.com>
 <20231128105054.24317-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128105054.24317-5-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] scripts/test_list.py: fix indent at
 get_subtests()
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
On 2023-11-28 at 11:48:59 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The indent there is wrong, causing this warning:
> 
> 	scripts/test_list.py:1041:46: W0631: Using possibly undefined loop variable 'test' (undefined-loop-variable)
> 
> This issue also affects testlist generation, as tests will be
> missing there.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 54 ++++++++++++++++++++++----------------------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 79b48813171b..3954e883ada3 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1038,43 +1038,43 @@ class TestList:
>  
>              subtest_array += self.expand_subtest(fname, test_name, test, True)
>  
> -        subtest_array.sort(key = lambda x : x.get('_summary_'))
> +            subtest_array.sort(key = lambda x : x.get('_summary_'))
>  
> -        for subtest in subtest_array:
> -            if self.__filter_subtest(self.doc[test], subtest, True):
> -                continue
> +            for subtest in subtest_array:
> +                if self.__filter_subtest(self.doc[test], subtest, True):
> +                    continue
>  
> -            if sort_field:
> -                if sort_field in subtest:
> -                    if expand:
> -                        test_list = expand.split(subtest[sort_field])
> +                if sort_field:
> +                    if sort_field in subtest:
> +                        if expand:
> +                            test_list = expand.split(subtest[sort_field])
>  
> -                        for test_elem in test_list:
> -                            if test_elem not in subtests:
> -                                subtests[test_elem] = []
> -                            if order:
> -                                subtests[test_elem].append((subtest["_summary_"], test_list))
> -                            else:
> -                                subtests[test_elem].append(subtest["_summary_"])
> +                            for test_elem in test_list:
> +                                if test_elem not in subtests:
> +                                    subtests[test_elem] = []
> +                                if order:
> +                                    subtests[test_elem].append((subtest["_summary_"], test_list))
> +                                else:
> +                                    subtests[test_elem].append(subtest["_summary_"])
> +                        else:
> +                            if subtest[sort_field] not in subtests:
> +                                subtests[subtest[sort_field]] = []
> +                                if order:
> +                                    subtests[test_elem].append((subtest["_summary_"], [subtest[sort_field]]))
> +                                else:
> +                                    subtests[subtest[sort_field]].append(subtest["_summary_"])
>                      else:
> -                        if subtest[sort_field] not in subtests:
> -                            subtests[subtest[sort_field]] = []
> -                            if order:
> -                                subtests[test_elem].append((subtest["_summary_"], [subtest[sort_field]]))
> -                            else:
> -                                subtests[subtest[sort_field]].append(subtest["_summary_"])
> +                        if order:
> +                            subtests[test_elem].append((subtest["_summary_"], [subtest[sort_field]]))
> +                        else:
> +                            subtests[""].append(subtest["_summary_"])
> +
>                  else:
>                      if order:
>                          subtests[test_elem].append((subtest["_summary_"], [subtest[sort_field]]))
>                      else:
>                          subtests[""].append(subtest["_summary_"])
>  
> -            else:
> -                if order:
> -                    subtests[test_elem].append((subtest["_summary_"], [subtest[sort_field]]))
> -                else:
> -                    subtests[""].append(subtest["_summary_"])
> -
>          if order:
>              for group, tests in subtests.items():
>                  prefix_tests = []
> -- 
> 2.42.0
> 

