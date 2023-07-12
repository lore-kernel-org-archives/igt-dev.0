Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0512E10E589
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 15:58:52 +0000 (UTC)
Date: Wed, 12 Jul 2023 17:57:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230712155759.jpknftm5okdcf7mb@kamilkon-desk1>
References: <20230711093602.987411-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230711093602.987411-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe/xe_create: Modify massive test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Priyanka,

On 2023-07-11 at 15:06:02 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Fix Modify invalid massive test issue.
- ^^^^^^^^^^
Fixed

Please also describe what/how you fixed that, for example:

Test used incorrect number 1GB-1 for allocating GPU mem
instead of around 2^32GB.

With that,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/xe/xe_create.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
> index f893381d9..2e29efc90 100644
> --- a/tests/xe/xe_create.c
> +++ b/tests/xe/xe_create.c
> @@ -200,7 +200,7 @@ static void create_massive_size(int fd)
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
>  
>  	xe_for_each_mem_region(fd, memreg, region) {
> -		ret = __create_bo(fd, vm, -1ULL >> 32, region, &handle);
> +		ret = __create_bo(fd, vm, -1ULL << 32, region, &handle);
>  		igt_assert_eq(ret, -ENOSPC);
>  	}
>  }
> -- 
> 2.25.1
> 
