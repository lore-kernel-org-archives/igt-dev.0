Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A963410E5BE
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:31:19 +0000 (UTC)
Date: Wed, 12 Jul 2023 19:31:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230712173100.ygh43vp3y3rnnykc@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712135854.957128-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 03/13] scripts/test_list.py: rename
 the internal summary value
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

On 2023-07-12 at 15:58:44 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The sumary is used internally. So, it is not meant to be used as
> a normal field. To avoid possible clashes in the future, rename
> the internal usage to _summary_, as we're using _foo_ for internal
> properties.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 44 ++++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 18fdd619211a..8dca7fc7c49e 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -429,8 +429,8 @@ class TestList:
>  
>          for subtest in self.doc[test]["subtest"].keys():
>              summary = test_name
> -            if self.doc[test]["subtest"][subtest]["Summary"] != '':
> -                summary += self.subtest_separator + self.doc[test]["subtest"][subtest]["Summary"]
> +            if self.doc[test]["subtest"][subtest]["_summary_"] != '':
> +                summary += self.subtest_separator + self.doc[test]["subtest"][subtest]["_summary_"]
>              if not summary:
>                  continue
>  
> @@ -441,10 +441,10 @@ class TestList:
>              if num_vars == 0:
>                  subtest_dict = {}
>  
> -                subtest_dict["Summary"] = summary
> +                subtest_dict["_summary_"] = summary
>  
>                  for k in sorted(self.doc[test]["subtest"][subtest].keys()):
> -                    if k in [ 'Summary', 'arg', 'subtest_line' ]:
> +                    if k in [ '_summary_', 'arg', 'subtest_line' ]:
>                          continue
>  
>                      if not allow_inherit:
> @@ -510,10 +510,10 @@ class TestList:
>  
>                  # Store the element
>                  subtest_dict = {}
> -                subtest_dict["Summary"] = arg_summary
> +                subtest_dict["_summary_"] = arg_summary
>  
>                  for field in sorted(self.doc[test]["subtest"][subtest].keys()):
> -                    if field in [ 'Summary', 'arg', 'subtest_line' ]:
> +                    if field in [ '_summary_', 'arg', 'subtest_line' ]:
>                          continue
>  
>                      sub_field = self.doc[test]["subtest"][subtest][field]
> @@ -581,11 +581,11 @@ class TestList:
>                  if self.__filter_subtest(self.doc[test], subtest, True):
>                      continue
>  
> -                summary = subtest["Summary"]
> +                summary = subtest["_summary_"]
>  
>                  dic[summary] = {}
>                  for field in sorted(subtest.keys()):
> -                    if field in [ 'Summary', 'arg', 'subtest_line' ]:
> +                    if field in [ '_summary_', 'arg', 'subtest_line' ]:
>                          continue
>                      dic[summary][field] = subtest[field]
>  
> @@ -646,12 +646,12 @@ class TestList:
>              for subtest in subtest_array:
>  
>                  print()
> -                print(subtest["Summary"])
> -                print(len(subtest["Summary"]) * '=')
> +                print(subtest["_summary_"])
> +                print(len(subtest["_summary_"]) * '=')
>                  print("")
>  
>                  for field in sorted(subtest.keys()):
> -                    if field in [ 'Summary', 'arg', 'subtest_line' ]:
> +                    if field in [ '_summary_', 'arg', 'subtest_line' ]:
>                          continue
>  
>                      print(f":{field}:", subtest[field])
> @@ -857,7 +857,7 @@ class TestList:
>  
>              subtest_array += self.expand_subtest(fname, test_name, test, True)
>  
> -        subtest_array.sort(key = lambda x : x.get('Summary'))
> +        subtest_array.sort(key = lambda x : x.get('_summary_'))
>  
>          for subtest in subtest_array:
>              if self.__filter_subtest(self.doc[test], subtest, True):
> @@ -873,27 +873,27 @@ class TestList:
>                              if test_elem not in subtests:
>                                  subtests[test_elem] = []
>                              if order:
> -                                subtests[test_elem].append((subtest["Summary"], test_list))
> +                                subtests[test_elem].append((subtest["_summary_"], test_list))
>                              else:
> -                                subtests[test_elem].append(subtest["Summary"])
> +                                subtests[test_elem].append(subtest["_summary_"])
>                      else:
>                          if subtest[sort_field] not in subtests:
>                              subtests[subtest[sort_field]] = []
>                              if order:
> -                                subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
> +                                subtests[test_elem].append((subtest["_summary_"], [subtest[sort_field]]))
>                              else:
> -                                subtests[subtest[sort_field]].append(subtest["Summary"])
> +                                subtests[subtest[sort_field]].append(subtest["_summary_"])
>                  else:
>                      if order:
> -                        subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
> +                        subtests[test_elem].append((subtest["_summary_"], [subtest[sort_field]]))
>                      else:
> -                        subtests[""].append(subtest["Summary"])
> +                        subtests[""].append(subtest["_summary_"])
>  
>              else:
>                  if order:
> -                    subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
> +                    subtests[test_elem].append((subtest["_summary_"], [subtest[sort_field]]))
>                  else:
> -                    subtests[""].append(subtest["Summary"])
> +                    subtests[""].append(subtest["_summary_"])
>  
>          if order:
>              for group, tests in subtests.items():
> @@ -1064,7 +1064,7 @@ class TestList:
>  
>                          self.doc[current_test] = {}
>                          self.doc[current_test]["arg"] = {}
> -                        self.doc[current_test]["Summary"] = match.group(1)
> +                        self.doc[current_test]["_summary_"] = match.group(1)
>                          self.doc[current_test]["File"] = fname
>                          self.doc[current_test]["subtest"] = {}
>                          self.doc[current_test]["subtest_line"] = {}
> @@ -1102,7 +1102,7 @@ class TestList:
>                              continue
>                          self.doc[current_test]["subtest"][current_subtest][field] = self.doc[current_test][field]
>  
> -                    self.doc[current_test]["subtest"][current_subtest]["Summary"] = match.group(1)
> +                    self.doc[current_test]["subtest"][current_subtest]["_summary_"] = match.group(1)
>                      self.doc[current_test]["subtest"][current_subtest]["Description"] = ''
>                      self.doc[current_test]["subtest_line"][current_subtest] = file_ln
>  
> -- 
> 2.40.1
> 

