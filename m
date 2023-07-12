Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827A310E5C6
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 19:12:36 +0000 (UTC)
Date: Wed, 12 Jul 2023 21:12:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230712191213.mppvkwbnbgihgujt@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-13-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712135854.957128-13-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 12/13] scripts/test_list.py: skip
 some internal fields
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

On 2023-07-12 at 15:58:53 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> both subtest_line and _summary_ are used internally at the script
> logic. They shouldn't be part of the output.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/test_list.py | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 1551bc92c010..11aed63cb67a 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -661,6 +661,10 @@ class TestList:
>                      continue
>                  if field == "arg":
>                      continue
> +                if field == "_summary_":
> +                    continue
> +                if field == "subtest_line":

Maybe also _subtest_line_?
With or without this,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +                    continue
>  
>                  print(f":{field}: {self.doc[test][field]}")
>  
> -- 
> 2.40.1
> 

