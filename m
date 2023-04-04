Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC8110E6DA
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 15:41:19 +0000 (UTC)
Date: Tue, 4 Apr 2023 17:41:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230404154109.xccqtqawjvryhgop@kamilkon-desk1>
References: <be171b540a5dd6c13e5045947e40a1586c6c14c7.1680001835.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <be171b540a5dd6c13e5045947e40a1586c6c14c7.1680001835.git.mchehab@kernel.org>
Subject: Re: [igt-dev] [PATCH] scripts/igt_doc.py: ignore normal
 documentation tags
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

On 2023-03-28 at 13:10:35 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Only bail out on comments if a field is not recognized on comments
> with TEST or SUBTEST tags.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 67ab7984dd11..92d925c451ed 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -828,6 +828,7 @@ class TestList:
>          arg_number = 1
>          cur_arg = -1
>          cur_arg_element = 0
> +        has_test_or_subtest = 0
>  
>          with open(fname, 'r', encoding='utf8') as handle:
>              arg_ref = None
> @@ -845,6 +846,7 @@ class TestList:
>                      current_subtest = None
>                      arg_ref = None
>                      cur_arg = -1
> +                    has_test_or_subtest = 0
>  
>                      continue
>  
> @@ -864,6 +866,7 @@ class TestList:
>                      # Check if it is a new TEST section
>                      match = re.match(r'^TEST:\s*(.*)', file_line)
>                      if match:
> +                        has_test_or_subtest = 1
>                          current_test = self.test_number
>                          self.test_number += 1
>  
> @@ -884,6 +887,7 @@ class TestList:
>                  # Check if it is a new SUBTEST section
>                  match = re.match(r'^SUBTESTS?:\s*(.*)', file_line)
>                  if match:
> +                    has_test_or_subtest = 1
>                      current_subtest = subtest_number
>                      subtest_number += 1
>  
> @@ -934,6 +938,9 @@ class TestList:
>  
>                      continue
>  
> +                if not has_test_or_subtest:
> +                    continue
> +
>                  # Use hashes for arguments to avoid duplication
>                  match = re.match(r'arg\[(\d+)\]:\s*(.*)', file_line)
>                  if match:
> -- 
> 2.39.2
> 

