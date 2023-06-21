Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C185810E334
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 16:49:53 +0000 (UTC)
Date: Wed, 21 Jun 2023 18:48:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230621164801.jzujeikpeg23s4wx@kamilkon-desk1>
References: <20230620085522.3984101-1-mauro.chehab@linux.intel.com>
 <20230620085522.3984101-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230620085522.3984101-5-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/4] scripts/test_list.py: produce
 alphabetically ordered testlists
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

On 2023-06-20 at 10:55:22 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Before start handling the subtest arrays, order it, in order
> it alphabetically.
> 
> This should produce a better ordered testlist.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 59 +++++++++++++++++++++++---------------------
>  1 file changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 76fdcf3dbb4f..a55d2977c7c3 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -838,6 +838,7 @@ class TestList:
>                      if "order" in self.props[sort_field]["_properties_"]:
>                          order = self.props[sort_field]["_properties_"]["order"]
>  
> +        subtest_array = []
>          for test in sorted(self.doc.keys()):
>              fname = self.doc[test]["File"]
>  
> @@ -845,44 +846,46 @@ class TestList:
>              test_name = re.sub(r'\.[ch]', '', test_name)
>              test_name = "igt@" + test_name
>  
> -            subtest_array = self.expand_subtest(fname, test_name, test, True)
> +            subtest_array += self.expand_subtest(fname, test_name, test, True)
>  
> -            for subtest in subtest_array:
> -                if self.__filter_subtest(test, subtest, True):
> -                    continue
> +        subtest_array.sort(key = lambda x : x.get('Summary'))
>  
> -                if sort_field:
> -                    if sort_field in subtest:
> -                        if expand:
> -                            test_list = subtest[sort_field].split(expand)
> -                            test_list = [s.strip() for s in test_list]
> +        for subtest in subtest_array:
> +            if self.__filter_subtest(test, subtest, True):
> +                continue
>  
> -                            for test_elem in test_list:
> -                                if test_elem not in subtests:
> -                                    subtests[test_elem] = []
> -                                if order:
> -                                    subtests[test_elem].append((subtest["Summary"], test_list))
> -                                else:
> -                                    subtests[test_elem].append(subtest["Summary"])
> -                        else:
> -                            if subtest[sort_field] not in subtests:
> -                                subtests[subtest[sort_field]] = []
> -                                if order:
> -                                    subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
> -                                else:
> -                                    subtests[subtest[sort_field]].append(subtest["Summary"])
> +            if sort_field:
> +                if sort_field in subtest:
> +                    if expand:
> +                        test_list = subtest[sort_field].split(expand)
> +                        test_list = [s.strip() for s in test_list]
> +
> +                        for test_elem in test_list:
> +                            if test_elem not in subtests:
> +                                subtests[test_elem] = []
> +                            if order:
> +                                subtests[test_elem].append((subtest["Summary"], test_list))
> +                            else:
> +                                subtests[test_elem].append(subtest["Summary"])
>                      else:
> -                        if order:
> -                            subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
> -                        else:
> -                            subtests[""].append(subtest["Summary"])
> -
> +                        if subtest[sort_field] not in subtests:
> +                            subtests[subtest[sort_field]] = []
> +                            if order:
> +                                subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
> +                            else:
> +                                subtests[subtest[sort_field]].append(subtest["Summary"])
>                  else:
>                      if order:
>                          subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
>                      else:
>                          subtests[""].append(subtest["Summary"])
>  
> +            else:
> +                if order:
> +                    subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
> +                else:
> +                    subtests[""].append(subtest["Summary"])
> +
>          if order:
>              for group, tests in subtests.items():
>                  prefix_tests = []
> -- 
> 2.40.1
> 

