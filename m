Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F2510E0C9
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 19:27:56 +0000 (UTC)
Message-ID: <35878e85-b17b-41bf-b9e7-047841a0504b@intel.com>
Date: Fri, 12 Jan 2024 11:27:50 -0800
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: Do not validate data on
 GT reset
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240112154611.1395699-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240112154611.1395699-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: saurabhg.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 1/12/2024 7:46 AM, Jonathan Cavitt wrote:
> In the cm-gt-reset test, data validation is blocked because a GT reset
> means that we cannot verify the completion of the exec operations.
> Extend this logic to all other tests that perform GT resets in
> xe_exec_reset.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Thanks for extending the fix to the other subtests.

Reviewed-by: Brian Welty <brian.welty@intel.com>



> ---
>   tests/intel/xe_exec_reset.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 0cd5b10517..168523c64c 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -294,8 +294,10 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>   	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>   
> -	for (i = bad_batches; i < n_execs; i++)
> -		igt_assert_eq(data[i].data, 0xc0ffee);
> +	if (!(flags & GT_RESET)) {
> +		for (i = bad_batches; i < n_execs; i++)
> +			igt_assert_eq(data[i].data, 0xc0ffee);
> +	}
>   
>   	syncobj_destroy(fd, sync[0].handle);
>   	for (i = 0; i < n_exec_queues; i++) {
> @@ -462,8 +464,10 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>   	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>   
> -	for (i = 1; i < n_execs; i++)
> -		igt_assert_eq(data[i].data, 0xc0ffee);
> +	if (!(flags & GT_RESET)) {
> +		for (i = 1; i < n_execs; i++)
> +			igt_assert_eq(data[i].data, 0xc0ffee);
> +	}
>   
>   	syncobj_destroy(fd, sync[0].handle);
>   	for (i = 0; i < n_exec_queues; i++) {
