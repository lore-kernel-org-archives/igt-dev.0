Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C9010E126
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 11:52:55 +0000 (UTC)
Date: Mon, 19 Jun 2023 13:52:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230619115253.spkc4fq6qgrq2tr5@kamilkon-desk1>
References: <20230619053250.322791-1-zbigniew.kempczynski@intel.com>
 <20230619053250.322791-5-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230619053250.322791-5-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/4] tests/xe_waitfence: Add abstime
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

On 2023-06-19 at 07:32:50 +0200, Zbigniew Kempczyński wrote:
> Start testing timeout passed as absolute time.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> ---
> v3: Replace long to int64_t (Kamil)
> ---
>  tests/xe/xe_waitfence.c | 41 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
> index 40e59e364e..c6b2db125c 100644
> --- a/tests/xe/xe_waitfence.c
> +++ b/tests/xe/xe_waitfence.c
> @@ -38,12 +38,23 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>  	xe_vm_bind(fd, vm, bo, offset, addr, size, sync, 1);
>  }
>  
> +#define MS_TO_NS(ms) (((int64_t)ms) * 1000000)
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
> @@ -52,6 +63,7 @@ waitfence(int fd)
>  	uint32_t bo_5;
>  	uint32_t bo_6;
>  	uint32_t bo_7;
> +	int64_t timeout;
>  
>  	uint32_t vm = xe_vm_create(fd, 0, 0);
>  	bo_1 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
> @@ -68,7 +80,25 @@ waitfence(int fd)
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
> +		int64_t current, signalled;
> +
> +		clock_gettime(CLOCK_MONOTONIC, &ts);
> +		current = ts.tv_sec * 1e9 + ts.tv_nsec;
> +		timeout = current + MS_TO_NS(10);
> +		signalled = xe_wait_ufence_abstime(fd, &wait_fence, 7, NULL, timeout);
> +		igt_debug("wait type: ABSTIME - timeout: %" PRId64
> +			  ", signalled: %" PRId64
> +			  ", elapsed: %" PRId64 "\n",
> +			  timeout, signalled, signalled - current);
> +	}
> +
>  	xe_vm_unbind_sync(fd, vm, 0, 0x200000, 0x40000);
>  	xe_vm_unbind_sync(fd, vm, 0, 0xc0000000, 0x40000);
>  	xe_vm_unbind_sync(fd, vm, 0, 0x180000000, 0x40000);
> @@ -95,7 +125,10 @@ igt_main
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
