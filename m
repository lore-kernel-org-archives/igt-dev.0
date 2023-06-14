Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B35B10E437
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 10:40:36 +0000 (UTC)
Date: Wed, 14 Jun 2023 12:40:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230614104032.4dv7gu26rhcjb4so@kamilkon-desk1>
References: <20230602162011.90097-1-zbigniew.kempczynski@intel.com>
 <20230602162011.90097-5-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230602162011.90097-5-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/4] tests/xe_waitfence: Add abstime
 subtest for user fence
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

Hi Zbigniew,

On 2023-06-02 at 18:20:11 +0200, Zbigniew Kempczyński wrote:
> Start testing timeout passed as absolute time.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/xe/xe_waitfence.c | 39 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
> index 390d9b3221..8979a9c2d0 100644
> --- a/tests/xe/xe_waitfence.c
> +++ b/tests/xe/xe_waitfence.c
> @@ -37,12 +37,23 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>  	xe_vm_bind(fd, vm, bo, offset, addr, size, sync, 1);
>  }
>  
> +#define MS_TO_NS(ms) (((long)ms) * 1000000)
-------------------------- ^^^^
imho this should be uint64_t

Add newline here.

> +enum waittype {
> +	RELTIME,
> +	ABSTIME,
> +};
> +
>  /**
>   * SUBTEST: reltime
> - * Description: Check basic waitfences functionality
> + * Description: Check basic waitfences functionality with timeout
> + *              as relative timeout in nanoseconds
> + *
> + * SUBTEST: abstime
> + * Description: Check basic waitfences functionality with timeout
> + *              passed as absolute time in nanoseconds
>   */
>  static void
> -waitfence(int fd)
> +waitfence(int fd, enum waittype wt)
>  {
>  	uint32_t bo_1;
>  	uint32_t bo_2;
> @@ -51,6 +62,7 @@ waitfence(int fd)
>  	uint32_t bo_5;
>  	uint32_t bo_6;
>  	uint32_t bo_7;
> +	long timeout;
------- ^^^
uint64_t

>  
>  	uint32_t vm = xe_vm_create(fd, 0, 0);
>  	bo_1 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
> @@ -67,7 +79,23 @@ waitfence(int fd)
>  	do_bind(fd, vm, bo_6, 0, 0xc0040000, 0x1c0000, 6);
>  	bo_7 = xe_bo_create_flags(fd, vm, 0x10000, MY_FLAG);
>  	do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
> -	xe_wait_ufence(fd, &wait_fence, 7, NULL, 2000);
> +
> +	if (wt == RELTIME) {
> +		timeout = xe_wait_ufence(fd, &wait_fence, 7, NULL, MS_TO_NS(10));
> +		igt_debug("wait type: RELTIME - timeout: %ld, timeout left: %ld\n",
> +			  MS_TO_NS(10), timeout);
> +	} else {
> +		struct timespec ts;
> +		long current, signalled;
--------------- ^^^^
uint64_t

Regards,
Kamil

> +
> +		clock_gettime(CLOCK_MONOTONIC, &ts);
> +		current = ts.tv_sec * 1e9 + ts.tv_nsec;
> +		timeout = current + MS_TO_NS(10);
> +		signalled = xe_wait_ufence_abstime(fd, &wait_fence, 7, NULL, timeout);
> +		igt_debug("wait type: ABSTIME - timeout: %ld, signalled: %ld, elapsed: %ld\n",
> +			  timeout, signalled, signalled - current);
> +	}
> +
>  	xe_vm_unbind_sync(fd, vm, 0, 0x200000, 0x40000);
>  	xe_vm_unbind_sync(fd, vm, 0, 0xc0000000, 0x40000);
>  	xe_vm_unbind_sync(fd, vm, 0, 0x180000000, 0x40000);
> @@ -94,7 +122,10 @@ igt_main
>  	}
>  
>  	igt_subtest("reltime")
> -		waitfence(fd);
> +		waitfence(fd, RELTIME);
> +
> +	igt_subtest("abstime")
> +		waitfence(fd, ABSTIME);
>  
>  	igt_fixture {
>  		xe_device_put(fd);
> -- 
> 2.34.1
> 
