Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13B310EB32
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 15:19:03 +0000 (UTC)
Date: Wed, 15 Mar 2023 15:18:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZBHhv9SSxicwKjV9@DUT025-TGLU.fm.intel.com>
References: <20230315141453.39733-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230315141453.39733-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/xe/xe_vm: Add a userptr-invalid test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 03:14:53PM +0100, Thomas Hellström wrote:
> Add a small userptr-invalid test that adds some coverage for the
> error paths in the userptr binding code.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/xe/xe_vm.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
> index 4103bd7c..80dcda72 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -292,6 +292,32 @@ static void unbind_all(int fd, int n_vmas)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +#define	MAP_ADDRESS	0x00007fadeadbe000
> +
> +/*
> + * This tests verifies that mapping an invalid userptr returns -EFAULT,
> + * and that it is correctly handled.
> + */
> +static void userptr_invalid(int fd)
> +{
> +	size_t size = xe_get_default_alignment(fd);
> +	uint32_t vm;
> +	void *data;
> +	int ret;
> +
> +	data = mmap((void *)MAP_ADDRESS, size, PROT_READ |
> +		    PROT_WRITE, MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(data != MAP_FAILED);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	munmap(data, size);
> +	ret = __xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
> +			   size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0, 0);
> +	igt_assert(ret == -EFAULT);
> +
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  struct vm_thread_data {
>  	pthread_t thread;
>  	struct drm_xe_vm_bind_op_error_capture *capture;
> @@ -1618,6 +1644,9 @@ igt_main
>  	igt_subtest("unbind-all-8-vmas")
>  		unbind_all(fd, 8);
>  
> +	igt_subtest("userptr-invalid")
> +		userptr_invalid(fd);
> +
>  	igt_subtest("vm-async-ops-err")
>  		vm_async_ops_err(fd, false);
>  
> -- 
> 2.39.2
> 
