Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B11710E5C4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 18:31:37 +0000 (UTC)
Date: Wed, 12 Jul 2023 20:30:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230712183045.afa3vrd3ltrv44pd@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-6-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712135854.957128-6-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 05/13] scripts/test_list.py: document
 what BAT stands for
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
On 2023-07-12 at 15:58:46 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> BAT means Basic Accetance Test, which is a set of tests that
> are meant to test basic functionalities and provide a fast
> feedback. Add some documentation where the term is present
> at the code.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 1fd27ef560a7..0452be8d7994 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1256,7 +1256,7 @@ class TestList:
>              testlist = test.lower()
>              if testlist == "":
>                  fname = "other"
> -            elif testlist == "bat":
> +            elif testlist == "bat":         # Basic Acceptance Test
>                  fname = "fast-feedback"
>              else:
>                  fname = testlist
> -- 
> 2.40.1
> 

