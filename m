Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF50510EBE5
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 17:53:29 +0000 (UTC)
Date: Wed, 29 Mar 2023 19:53:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230329175325.rgcac7u4ouqoxbhh@kamilkon-desk1>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
 <20230327133155.2428454-8-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230327133155.2428454-8-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 07/11] scripts/test_list.py: better
 handle documentation validation issues
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

On 2023-03-27 at 15:31:51 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Produce warnings and exit with an error when test plan is out of sync.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 73c1794caec5..7d35deda3329 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -803,16 +803,14 @@ class TestList:
>                  run_missing.append(run_test)
>  
>          if doc_uneeded:
> -            print("Unused documentation")
>              for test_name in doc_uneeded:
> -                print(test_name)
> +                print(f"Warning: Documented {test_name} doesn't exist on source files")
>  
>          if run_missing:
> -            if doc_uneeded:
> -                print()
> -            print("Missing documentation")
>              for test_name in run_missing:
> -                print(test_name)
> +                print(f'Warning: Missing documentation for {test_name}')
> +        if doc_uneeded or run_missing:
> +            sys.exit(1)
>  
>      #
>      # File handling methods
> -- 
> 2.39.2
> 

