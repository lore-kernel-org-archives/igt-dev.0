Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE0610EBE0
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 17:48:03 +0000 (UTC)
Date: Wed, 29 Mar 2023 19:47:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230329174759.vfbq2wxq4acy5tdo@kamilkon-desk1>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
 <20230327133155.2428454-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230327133155.2428454-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 01/11] xe_test_config.json: do some
 adjustments at the output hierarchy
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

On 2023-03-27 at 15:31:45 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Place "Mega feature" inside the same hierarchical level,
> placing it on a higher level than sub-category, as this provides
> a higher level of group for functionalities.
> 
> While here, better document the fields.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/xe/xe_test_config.json | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/xe/xe_test_config.json b/tests/xe/xe_test_config.json
> index 6c474d6053f3..666fe6cd315c 100644
> --- a/tests/xe/xe_test_config.json
> +++ b/tests/xe/xe_test_config.json
> @@ -4,27 +4,27 @@
>      "fields": {
>          "Category": {
>              "_properties_": {
> -                "description": "Contains the major group for the tested functionality"
> +                "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
>              },
> -            "Sub-category": {
> +            "Mega feature": {
>                  "_properties_": {
> -                    "description": "Contains the minor group of the functionality"
> -                },
> -                "Functionality": {
> -                    "_properties_": {
> -                        "description": "Groups page table tests per functionality"
> -                    }
> +                    "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
>                  },
> -                "Run type": {
> +                "Sub-category": {
>                      "_properties_": {
> -                        "description": "Defines what category of testlist it belongs"
> +                        "description": "Contains the the technical feature/functionality"
> +                    },
> +                    "Functionality": {
> +                        "_properties_": {
> +                            "description": "Groups page table tests on buckets containg more detailed functionality"
> +                        }
> +                    },
> +                    "Run type": {
> +                        "_properties_": {
> +                            "description": "Defines what category of testlist it belongs"
> +                        }
>                      }
>                  }
> -            },
> -            "Mega feature": {
> -                "_properties_": {
> -                    "description": "Contains the mega feature for E2E use case"
> -                }
>              }
>          },
>          "Test category": {
> -- 
> 2.39.2
> 

