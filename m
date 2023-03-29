Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA8C10EBEE
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 17:55:29 +0000 (UTC)
Date: Wed, 29 Mar 2023 19:54:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230329175427.pmbiox57xgkdp3vc@kamilkon-desk1>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
 <20230327133155.2428454-9-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230327133155.2428454-9-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 08/11] scripts/test_list.py: add support
 for igt_simple_main
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

On 2023-03-27 at 15:31:52 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> when igt_simple_main is used, there will be a single unamed
> subtest. Add support for it.
> 
> On such case, the documentation will be like:
> 
> 	/**
> 	 * TEST: Test foo
> 	 * Category: Software building block
> 	 * Sub-category: foo
> 	 * Test category: functionality test
> 	 * Run type: BAT
> 	 *
> 	 * SUBTEST:
> 	 * Description: foo description
> 	 */
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 7d35deda3329..075f44d5e604 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -176,6 +176,22 @@ class TestList:
>  
>      The SUBTEST contains the fields that are specific to each subtest.
>  
> +    Note: when igt_simple_main is used, there will be a single nameless
> +    subtest. On such case, "SUBTEST:" is still needed, but without a
> +    test name on it, e. g., it would be documented as:
> +
> +        /**
> +         * TEST: some test that uses igt_simple_main
> +         * Category: Software build block
> +         * Sub-category: documentation
> +         * Functionality: test documentation
> +         * Issue: none
> +         * Description: Complete description of this test
> +         *
> +         * SUBTEST:
> +         * Description: do foo things
> +         */
> +
>      Some IGT tests may have strings or integer wildcards, like:
>          test-%s-%ld-size
>  
> @@ -376,8 +392,9 @@ class TestList:
>          subtest_array = []
>  
>          for subtest in self.doc[test]["subtest"].keys():
> -            summary = test_name + '@' + self.doc[test]["subtest"][subtest]["Summary"]
> -
> +            summary = test_name
> +            if self.doc[test]["subtest"][subtest]["Summary"] != '':
> +                 summary += '@' + self.doc[test]["subtest"][subtest]["Summary"]
>              if not summary:
>                  continue
>  
> -- 
> 2.39.2
> 

