Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219C110E28C
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 13:48:57 +0000 (UTC)
Date: Fri, 8 Dec 2023 08:48:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH v4 2/2] drm-uapi/xe: Skip xe_wait_user_fence_ioctl when
 exec_queue reset happen
Message-ID: <ZXMewUwrCJzT96xv@intel.com>
References: <20231208041825.32421-1-krishnaiah.bommu@intel.com>
 <20231208041825.32421-3-krishnaiah.bommu@intel.com>
 <ZXKxFpBYOCCjqZ0p@intel.com>
 <DM4PR11MB529301FB88558A5561F7FFFC9D8AA@DM4PR11MB5293.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB529301FB88558A5561F7FFFC9D8AA@DM4PR11MB5293.namprd11.prod.outlook.com>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 07:59:34AM -0500, Bommu, Krishnaiah wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Friday, December 8, 2023 11:31 AM
> > To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH v4 2/2] drm-uapi/xe: Skip xe_wait_user_fence_ioctl
> > when exec_queue reset happen
> > 
> > On Fri, Dec 08, 2023 at 09:48:25AM +0530, Bommu Krishnaiah wrote:
> > > Skipping the GPU mapping(vm_bind) for object, so that exec_queue
> > 
> > 'skipping' sounds like you are not waiting at all...
> > 
> > > reset will happen and xe_wait_ufence will end return EIO not ETIME
> > >
> > > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  tests/intel/xe_waitfence.c | 82
> > > ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 82 insertions(+)
> > >
> > > diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> > > index 4e94403a3..bd95fa1f8 100644
> > > --- a/tests/intel/xe_waitfence.c
> > > +++ b/tests/intel/xe_waitfence.c
> > > @@ -149,6 +149,9 @@ waitfence(int fd, enum waittype wt)
> > >   *
> > >   * SUBTEST: invalid-engine
> > >   * Description: Check query with invalid engine info returns expected
> > > error code
> > > + *
> > > + * SUBTEST: invalid-exec_queue-wait
> > 
> > 'invalid wait' sounded to me like a negative test with invalid timeout.
> > 
> > So I believe we need to rephrase some stuff here, but the test looks right.
> > 
> 
> Commit message:
> drm-uapi/xe: Don't wait on user_fence during exec queue reset
> 
> don't wait till timeout on user fence when exec_queue reset is detected
> and return return  proper error code
> 
> 
> root@kbommu-desk:/home/kbommu/xe_public/igt-gpu-tools# git diff
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index bd95fa1f8..9a2c854c1 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -150,8 +150,8 @@ waitfence(int fd, enum waittype wt)
>   * SUBTEST: invalid-engine
>   * Description: Check query with invalid engine info returns expected error code
>   *
> - * SUBTEST: invalid-exec_queue-wait
> - * Description: Check xe_wait_ufence will return expected error code while exec_queue reset happen
> + * SUBTEST: exec_queue-reset-wait
> + * Description: Don't wait till timeout on user fence when exec_queue reset is detected and return return proper error
>   */
> 
>  static void
> @@ -228,7 +228,7 @@ invalid_engine(int fd)
>  }
> 
>  static void
> -invalid_exec_queue_wait(int fd)
> +exec_queue_reset_wait(int fd)
>  {
>         uint32_t bo, b;
>         uint64_t batch_offset;
> @@ -291,8 +291,8 @@ invalid_exec_queue_wait(int fd)
>         xe_exec(fd, &exec);
> 
>         /**
> -         * Skipping the GPU mapping(vm_bind) for object, so that exec_queue
> -         * reset will happen and xe_wait_ufence will end return EIO not ETIME
> +         * Don't do the GPU mapping(vm_bind) for object, so that exec_queue
> +         * reset will happen and xe_wait_ufence will return EIO not ETIME
>           */
>         do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EIO);
> 
> @@ -329,8 +329,8 @@ igt_main
>         igt_subtest("invalid-engine")
>                 invalid_engine(fd);
> 
> -       igt_subtest("invalid-exec_queue-wait")
> -               invalid_exec_queue_wait(fd);
> +       igt_subtest("exec_queue-reset-wait")
> +               exec_queue_reset_wait(fd);
> 
>         igt_fixture
>                 drm_close_driver(fd);
> root@kbommu-desk:/home/kbommu/xe_public/igt-gpu-tools#
> root@kbommu-desk:/home/kbommu/xe_public/igt-gpu-tools#
> 
> This is what I can think of now, please suggest anything need to be changed 

yeap, this works for me:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Regards,
> Krishna
> 
> > > + * Description: Check xe_wait_ufence will return expected error code
> > > + while exec_queue reset happen
> > >   */
> > >
> > >  static void
> > > @@ -224,6 +227,82 @@ invalid_engine(int fd)
> > >  	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait,
> > EFAULT);  }
> > >
> > > +static void
> > > +invalid_exec_queue_wait(int fd)
> > > +{
> > > +	uint32_t bo, b;
> > > +	uint64_t batch_offset;
> > > +	uint64_t batch_addr;
> > > +	uint64_t sdi_offset;
> > > +	uint64_t sdi_addr;
> > > +	uint64_t addr = 0x1a0000;
> > > +
> > > +	struct {
> > > +		uint32_t batch[16];
> > > +		uint64_t pad;
> > > +		uint64_t vm_sync;
> > > +		uint64_t exec_sync;
> > > +		uint32_t data;
> > > +	} *data;
> > > +
> > > +#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> > > +	struct drm_xe_sync sync[1] = {
> > > +		{ .flags = DRM_XE_SYNC_TYPE_USER_FENCE |
> > DRM_XE_SYNC_FLAG_SIGNAL,
> > > +			.timeline_value = USER_FENCE_VALUE },
> > > +	};
> > > +
> > > +	struct drm_xe_exec exec = {
> > > +		.num_batch_buffer = 1,
> > > +		.num_syncs = 1,
> > > +		.syncs = to_user_pointer(sync),
> > > +	};
> > > +
> > > +	uint32_t vm = xe_vm_create(fd,
> > DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> > > +	uint32_t exec_queue = xe_exec_queue_create_class(fd, vm,
> > DRM_XE_ENGINE_CLASS_COPY);
> > > +	struct drm_xe_wait_user_fence1 wait = {
> > > +		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
> > > +		.flags = 0,
> > > +		.value = 0xc0ffee,
> > > +		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> > > +		.timeout = -1,
> > > +		.exec_queue_id = exec_queue,
> > > +	};
> > > +
> > > +	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
> > > +	data = xe_bo_map(fd, bo, 0x40000);
> > > +
> > > +	batch_offset = (char *)&data[0].batch - (char *)data;
> > > +	batch_addr = addr + batch_offset;
> > > +	sdi_offset = (char *)&data[0].data - (char *)data;
> > > +	sdi_addr = addr + sdi_offset;
> > > +
> > > +	b = 0;
> > > +	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > > +	data[0].batch[b++] = sdi_addr;
> > > +	data[0].batch[b++] = sdi_addr >> 32;
> > > +	data[0].batch[b++] = 0xc0ffee;
> > > +	data[0].batch[b++] = MI_BATCH_BUFFER_END;
> > > +	igt_assert(b <= ARRAY_SIZE(data[0].batch));
> > > +
> > > +	wait.addr = to_user_pointer(&data[0].exec_sync);
> > > +	exec.exec_queue_id = exec_queue;
> > > +	exec.address = batch_addr;
> > > +
> > > +	xe_exec(fd, &exec);
> > > +
> > > +	/**
> > > +	  * Skipping the GPU mapping(vm_bind) for object, so that
> > exec_queue
> > > +	  * reset will happen and xe_wait_ufence will end return EIO not
> > ETIME
> > > +	  */
> > > +	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EIO);
> > > +
> > > +	xe_exec_queue_destroy(fd, exec_queue);
> > > +
> > > +	if (bo) {
> > > +		munmap(data, 0x40000);
> > > +		gem_close(fd, bo);
> > > +	}
> > > +}
> > >
> > >  igt_main
> > >  {
> > > @@ -250,6 +329,9 @@ igt_main
> > >  	igt_subtest("invalid-engine")
> > >  		invalid_engine(fd);
> > >
> > > +	igt_subtest("invalid-exec_queue-wait")
> > > +		invalid_exec_queue_wait(fd);
> > > +
> > >  	igt_fixture
> > >  		drm_close_driver(fd);
> > >  }
> > > --
> > > 2.25.1
> > >
