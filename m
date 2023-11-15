Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FDD10E0F6
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 17:09:19 +0000 (UTC)
Date: Wed, 15 Nov 2023 18:09:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231115170913.4iznkzj56xmm7i3k@kamilkon-desk.igk.intel.com>
References: <20231115155626.756378-1-daniel.t.mrzyglod@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231115155626.756378-1-daniel.t.mrzyglod@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_waitfence: add positive
 subtest with eci engine provided
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

Hi Daniel,
On 2023-11-15 at 16:56:26 +0100, Daniel Mrzyglod wrote:

[PATCH i-g-t] tests/intel/xe_waitfence: add positive subtest with eci engine provided

imho better:

tests/intel/xe_waitfence: add subtest with provided engine class instance

> Postive tests to check XE_WAIT_USER_FENCE ioctl where
---- ^ ------ ^
s/Postive tests/Positive test/ (as you added only one new subtest).

> engine class instance is provided
---------------------------------- ^
Add dot at end of sentence.

> 
> Signed-off-by: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
> ---
>  tests/intel/xe_waitfence.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index ac7e99dde..dcf2908d6 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -37,9 +37,30 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>  	xe_vm_bind_async(fd, vm, 0, bo, offset, addr, size, sync, 1);
>  }
>  
> +static int xe_wait_ufence_hasengine(int fd, uint64_t *addr, uint64_t value,
------------- ^ ---------------------- ^
Could you change this name? It is not library function so something like:

wait_with_engine_class or wait_with_eci would be better.


> +		       struct drm_xe_engine_class_instance *eci,
-------------- ^
> +		       int64_t timeout)
-------------- ^
Align this after opening '(' (see other function here).

> +{
> +	struct drm_xe_wait_user_fence wait = {
> +		.addr = to_user_pointer(addr),
> +		.op = DRM_XE_UFENCE_WAIT_EQ,
> +		.flags = !eci ? 0 : DRM_XE_UFENCE_WAIT_ABSTIME,
> +		.value = value,
> +		.mask = DRM_XE_UFENCE_WAIT_U64,
> +		.timeout = timeout,
> +		.num_engines = eci ? 1 :0,
------------------------------- ^
Add space after ':'.

> +		.instances = eci ? to_user_pointer(eci) : 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
> +
> +	return wait.timeout;
> +}
> +
>  enum waittype {
>  	RELTIME,
>  	ABSTIME,
> +	HASENGINE,
>  };
>  
>  /**
> @@ -50,10 +71,16 @@ enum waittype {
>   * SUBTEST: abstime
>   * Description: Check basic waitfences functionality with timeout
>   *              passed as absolute time in nanoseconds
> + *
> + * SUBTEST: hasengine
> + * Description: Check basic waitfences functionality with timeout
> + *              passed as relative time in nanoseconds and provide engine class
> + *              instance
>   */
>  static void
>  waitfence(int fd, enum waittype wt)
>  {
> +	struct drm_xe_engine_class_instance *eci;
>  	uint32_t bo_1;
>  	uint32_t bo_2;
>  	uint32_t bo_3;
> @@ -83,6 +110,11 @@ waitfence(int fd, enum waittype wt)
>  		timeout = xe_wait_ufence(fd, &wait_fence, 7, NULL, MS_TO_NS(10));
>  		igt_debug("wait type: RELTIME - timeout: %ld, timeout left: %ld\n",
>  			  MS_TO_NS(10), timeout);
> +	} else if (wt == HASENGINE) {
> +		eci = xe_hw_engine(fd, 1);
> +		timeout = xe_wait_ufence_hasengine(fd, &wait_fence, 7, eci, MS_TO_NS(10));
> +		igt_debug("wait type: RELTIME - timeout: %ld, timeout left: %ld\n",
> +				  MS_TO_NS(10), timeout);
>  	} else {
>  		struct timespec ts;
>  		int64_t current, signalled;
> @@ -192,6 +224,8 @@ invalid_engine(int fd)
>  }
>  
>  
> +
> +

Remove this two empyt lines.

Regards,
Kamil

>  igt_main
>  {
>  	int fd;
> @@ -205,6 +239,9 @@ igt_main
>  	igt_subtest("abstime")
>  		waitfence(fd, ABSTIME);
>  
> +	igt_subtest("hasengine")
> +		waitfence(fd, HASENGINE);
> +
>  	igt_subtest("invalid-flag")
>  		invalid_flag(fd);
>  
> -- 
> 2.41.0
> 
