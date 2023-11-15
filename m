Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CED010E51B
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 10:24:58 +0000 (UTC)
Date: Wed, 15 Nov 2023 11:24:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231115102439.su7cbrgykeeq7dcg@kamilkon-desk.igk.intel.com>
References: <20231114122810.6838-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231114122810.6838-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_exec_queue_property:
 Negative tests for get exec_queue property ioctl
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

Hi sai.gowtham.ch,
On 2023-11-14 at 17:58:10 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Add Negative tests for get exec_queue property ioctl.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Thank you for patch, did you address Rahul comment?

Regards,
Kamil

> ---
>  tests/intel/xe_exec_queue_property.c | 77 +++++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 4e32aefa5..5278304be 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -4,7 +4,7 @@
>   */
>  
>  /**
> - * TEST: Basic tests to check exec_queue set property functionality
> + * TEST: Basic tests to check exec_queue set/get property functionality
>   * Category: Software building block
>   * Sub-category: exec queue property
>   * Functionality: exec queue set property
> @@ -108,6 +108,72 @@ static void test_property_min_max(int xe, int engine, const char **property)
>  	test_set_property(xe, property_name, min - 1, -EINVAL);
>  }
>  
> +/**
> + * SUBTEST: Invalid-exec-queue
> + * Description: Negative test to check the expected behaviour with invalid exec_queue_id.
> + * Test category: functionality test
> + */
> +static void Invalid_exec_queue_id(int xe)
> +{
> +	struct drm_xe_exec_queue_get_property args = {
> +		.exec_queue_id = 0xffff,
> +		.property = XE_EXEC_QUEUE_GET_PROPERTY_BAN,
> +	};
> +
> +	do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args, ENOENT);
> +}
> +
> +/**
> + * SUBTEST: non-zero-reserved
> + * Description: Negative test to check the expected behaviour with non-zero reserved.
> + * Test category: functionality test
> + */
> +static void non_zero_reserved(int xe)
> +{
> +	struct drm_xe_exec_queue_get_property args = {
> +		.reserved[0] = 0xffff,
> +		.property = XE_EXEC_QUEUE_GET_PROPERTY_BAN,
> +	};
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +
> +	vm = xe_vm_create(xe, 0, 0);
> +	exec_queue = xe_exec_queue_create_class(xe, vm, DRM_XE_ENGINE_CLASS_COPY);
> +	args.exec_queue_id = exec_queue;
> +
> +	do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args, EINVAL);
> +
> +	xe_exec_queue_destroy(xe, exec_queue);
> +	xe_vm_destroy(xe, vm);
> +}
> +
> +/**
> + * SUBTEST: invalid-value
> + * Description: Check if get property value works fine.
> + * Test category: functionality test
> + */
> +static void invalid_value(int xe)
> +{
> +	struct drm_xe_exec_queue_get_property args = {
> +		.value = -1,
> +		.reserved[0] = 0,
> +		.property = XE_EXEC_QUEUE_GET_PROPERTY_BAN,
> +	};
> +
> +	uint32_t exec_queue;
> +	uint32_t vm;
> +
> +	vm = xe_vm_create(xe, 0, 0);
> +	exec_queue = xe_exec_queue_create_class(xe, vm, DRM_XE_ENGINE_CLASS_COPY);
> +	args.exec_queue_id = exec_queue;
> +
> +	do_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args);
> +	igt_assert(args.value == 0);
> +
> +	xe_exec_queue_destroy(xe, exec_queue);
> +	xe_vm_destroy(xe, vm);
> +}
> +
>  igt_main
>  {
>  	static const struct {
> @@ -182,6 +248,15 @@ igt_main
>  		}
>  	}
>  
> +	igt_subtest("Invalid-exec-queue")
> +		Invalid_exec_queue_id(xe);
> +
> +	igt_subtest("non-zero-reserved")
> +		non_zero_reserved(xe);
> +
> +	igt_subtest("invalid-value")
> +		invalid_value(xe);
> +
>  	igt_fixture {
>  		xe_device_put(xe);
>  		drm_close_driver(xe);
> -- 
> 2.39.1
> 
