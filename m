Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054E310E199
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 20:41:58 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-778a2e84830so8910185a.3
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Nov 2023 12:41:56 -0800 (PST)
Message-ID: <61fb8cc0fa93dbb26d5138a17838853cf01410e0.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Date: Wed, 08 Nov 2023 15:41:53 -0500
In-Reply-To: <20231107174349.60255-5-kamil.konieczny@linux.intel.com>
References: <20231107174349.60255-1-kamil.konieczny@linux.intel.com>
 <20231107174349.60255-5-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v1 4/5] drm-uapi/nouveau: sync with
 drm-next
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2023-11-07 at 18:43 +0100, Kamil Konieczny wrote:
> Sync with drm-next commit ("f2cab4b318ee8023f4ad640b906ae268942a7db4")
>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  include/drm-uapi/nouveau_drm.h | 281 ++++++++++++++++++++++++++++++++-
>  1 file changed, 278 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/drm-uapi/nouveau_drm.h b/include/drm-uapi/nouveau_dr=
m.h
> index 853a32743..0bade1592 100644
> --- a/include/drm-uapi/nouveau_drm.h
> +++ b/include/drm-uapi/nouveau_drm.h
> @@ -33,11 +33,61 @@
>  extern "C" {
>  #endif
> =20
> +#define NOUVEAU_GETPARAM_PCI_VENDOR      3
> +#define NOUVEAU_GETPARAM_PCI_DEVICE      4
> +#define NOUVEAU_GETPARAM_BUS_TYPE        5
> +#define NOUVEAU_GETPARAM_FB_SIZE         8
> +#define NOUVEAU_GETPARAM_AGP_SIZE        9
> +#define NOUVEAU_GETPARAM_CHIPSET_ID      11
> +#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
> +#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
> +#define NOUVEAU_GETPARAM_PTIMER_TIME     14
> +#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
> +#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
> +
> +/*
> + * NOUVEAU_GETPARAM_EXEC_PUSH_MAX - query max pushes through getparam
> + *
> + * Query the maximum amount of IBs that can be pushed through a single
> + * &drm_nouveau_exec structure and hence a single &DRM_IOCTL_NOUVEAU_EXE=
C
> + * ioctl().
> + */
> +#define NOUVEAU_GETPARAM_EXEC_PUSH_MAX   17
> +
> +struct drm_nouveau_getparam {
> +=09__u64 param;
> +=09__u64 value;
> +};
> +
> +struct drm_nouveau_channel_alloc {
> +=09__u32     fb_ctxdma_handle;
> +=09__u32     tt_ctxdma_handle;
> +
> +=09__s32     channel;
> +=09__u32     pushbuf_domains;
> +
> +=09/* Notifier memory */
> +=09__u32     notifier_handle;
> +
> +=09/* DRM-enforced subchannel assignments */
> +=09struct {
> +=09=09__u32 handle;
> +=09=09__u32 grclass;
> +=09} subchan[8];
> +=09__u32 nr_subchan;
> +};
> +
> +struct drm_nouveau_channel_free {
> +=09__s32 channel;
> +};
> +
>  #define NOUVEAU_GEM_DOMAIN_CPU       (1 << 0)
>  #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>  #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
>  #define NOUVEAU_GEM_DOMAIN_MAPPABLE  (1 << 3)
>  #define NOUVEAU_GEM_DOMAIN_COHERENT  (1 << 4)
> +/* The BO will never be shared via import or export. */
> +#define NOUVEAU_GEM_DOMAIN_NO_SHARE  (1 << 5)
> =20
>  #define NOUVEAU_GEM_TILE_COMP        0x00030000 /* nv50-only */
>  #define NOUVEAU_GEM_TILE_LAYOUT_MASK 0x0000ff00
> @@ -98,6 +148,7 @@ struct drm_nouveau_gem_pushbuf_push {
>  =09__u32 pad;
>  =09__u64 offset;
>  =09__u64 length;
> +#define NOUVEAU_GEM_PUSHBUF_NO_PREFETCH (1 << 23)
>  };
> =20
>  struct drm_nouveau_gem_pushbuf {
> @@ -126,16 +177,233 @@ struct drm_nouveau_gem_cpu_fini {
>  =09__u32 handle;
>  };
> =20
> -#define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
> +/**
> + * struct drm_nouveau_sync - sync object
> + *
> + * This structure serves as synchronization mechanism for (potentially)
> + * asynchronous operations such as EXEC or VM_BIND.
> + */
> +struct drm_nouveau_sync {
> +=09/**
> +=09 * @flags: the flags for a sync object
> +=09 *
> +=09 * The first 8 bits are used to determine the type of the sync object=
.
> +=09 */
> +=09__u32 flags;
> +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
> +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
> +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
> +=09/**
> +=09 * @handle: the handle of the sync object
> +=09 */
> +=09__u32 handle;
> +=09/**
> +=09 * @timeline_value:
> +=09 *
> +=09 * The timeline point of the sync object in case the syncobj is of
> +=09 * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
> +=09 */
> +=09__u64 timeline_value;
> +};
> +
> +/**
> + * struct drm_nouveau_vm_init - GPU VA space init structure
> + *
> + * Used to initialize the GPU's VA space for a user client, telling the =
kernel
> + * which portion of the VA space is managed by the UMD and kernel respec=
tively.
> + *
> + * For the UMD to use the VM_BIND uAPI, this must be called before any B=
Os or
> + * channels are created; if called afterwards DRM_IOCTL_NOUVEAU_VM_INIT =
fails
> + * with -ENOSYS.
> + */
> +struct drm_nouveau_vm_init {
> +=09/**
> +=09 * @kernel_managed_addr: start address of the kernel managed VA space
> +=09 * region
> +=09 */
> +=09__u64 kernel_managed_addr;
> +=09/**
> +=09 * @kernel_managed_size: size of the kernel managed VA space region i=
n
> +=09 * bytes
> +=09 */
> +=09__u64 kernel_managed_size;
> +};
> +
> +/**
> + * struct drm_nouveau_vm_bind_op - VM_BIND operation
> + *
> + * This structure represents a single VM_BIND operation. UMDs should pas=
s
> + * an array of this structure via struct drm_nouveau_vm_bind's &op_ptr f=
ield.
> + */
> +struct drm_nouveau_vm_bind_op {
> +=09/**
> +=09 * @op: the operation type
> +=09 */
> +=09__u32 op;
> +/**
> + * @DRM_NOUVEAU_VM_BIND_OP_MAP:
> + *
> + * Map a GEM object to the GPU's VA space. Optionally, the
> + * &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to instruct the kernel=
 to
> + * create sparse mappings for the given range.
> + */
> +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0
> +/**
> + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
> + *
> + * Unmap an existing mapping in the GPU's VA space. If the region the ma=
pping
> + * is located in is a sparse region, new sparse mappings are created whe=
re the
> + * unmapped (memory backed) mapping was mapped previously. To remove a s=
parse
> + * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
> + */
> +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1
> +=09/**
> +=09 * @flags: the flags for a &drm_nouveau_vm_bind_op
> +=09 */
> +=09__u32 flags;
> +/**
> + * @DRM_NOUVEAU_VM_BIND_SPARSE:
> + *
> + * Indicates that an allocated VA space region should be sparse.
> + */
> +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
> +=09/**
> +=09 * @handle: the handle of the DRM GEM object to map
> +=09 */
> +=09__u32 handle;
> +=09/**
> +=09 * @pad: 32 bit padding, should be 0
> +=09 */
> +=09__u32 pad;
> +=09/**
> +=09 * @addr:
> +=09 *
> +=09 * the address the VA space region or (memory backed) mapping should =
be mapped to
> +=09 */
> +=09__u64 addr;
> +=09/**
> +=09 * @bo_offset: the offset within the BO backing the mapping
> +=09 */
> +=09__u64 bo_offset;
> +=09/**
> +=09 * @range: the size of the requested mapping in bytes
> +=09 */
> +=09__u64 range;
> +};
> +
> +/**
> + * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND
> + */
> +struct drm_nouveau_vm_bind {
> +=09/**
> +=09 * @op_count: the number of &drm_nouveau_vm_bind_op
> +=09 */
> +=09__u32 op_count;
> +=09/**
> +=09 * @flags: the flags for a &drm_nouveau_vm_bind ioctl
> +=09 */
> +=09__u32 flags;
> +/**
> + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
> + *
> + * Indicates that the given VM_BIND operation should be executed asynchr=
onously
> + * by the kernel.
> + *
> + * If this flag is not supplied the kernel executes the associated opera=
tions
> + * synchronously and doesn't accept any &drm_nouveau_sync objects.
> + */
> +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
> +=09/**
> +=09 * @wait_count: the number of wait &drm_nouveau_syncs
> +=09 */
> +=09__u32 wait_count;
> +=09/**
> +=09 * @sig_count: the number of &drm_nouveau_syncs to signal when finish=
ed
> +=09 */
> +=09__u32 sig_count;
> +=09/**
> +=09 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
> +=09 */
> +=09__u64 wait_ptr;
> +=09/**
> +=09 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
> +=09 */
> +=09__u64 sig_ptr;
> +=09/**
> +=09 * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
> +=09 */
> +=09__u64 op_ptr;
> +};
> +
> +/**
> + * struct drm_nouveau_exec_push - EXEC push operation
> + *
> + * This structure represents a single EXEC push operation. UMDs should p=
ass an
> + * array of this structure via struct drm_nouveau_exec's &push_ptr field=
.
> + */
> +struct drm_nouveau_exec_push {
> +=09/**
> +=09 * @va: the virtual address of the push buffer mapping
> +=09 */
> +=09__u64 va;
> +=09/**
> +=09 * @va_len: the length of the push buffer mapping
> +=09 */
> +=09__u32 va_len;
> +=09/**
> +=09 * @flags: the flags for this push buffer mapping
> +=09 */
> +=09__u32 flags;
> +#define DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH 0x1
> +};
> +
> +/**
> + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
> + */
> +struct drm_nouveau_exec {
> +=09/**
> +=09 * @channel: the channel to execute the push buffer in
> +=09 */
> +=09__u32 channel;
> +=09/**
> +=09 * @push_count: the number of &drm_nouveau_exec_push ops
> +=09 */
> +=09__u32 push_count;
> +=09/**
> +=09 * @wait_count: the number of wait &drm_nouveau_syncs
> +=09 */
> +=09__u32 wait_count;
> +=09/**
> +=09 * @sig_count: the number of &drm_nouveau_syncs to signal when finish=
ed
> +=09 */
> +=09__u32 sig_count;
> +=09/**
> +=09 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
> +=09 */
> +=09__u64 wait_ptr;
> +=09/**
> +=09 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
> +=09 */
> +=09__u64 sig_ptr;
> +=09/**
> +=09 * @push_ptr: pointer to &drm_nouveau_exec_push ops
> +=09 */
> +=09__u64 push_ptr;
> +};
> +
> +#define DRM_NOUVEAU_GETPARAM           0x00
>  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
> -#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
> -#define DRM_NOUVEAU_CHANNEL_FREE       0x03 /* deprecated */
> +#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
> +#define DRM_NOUVEAU_CHANNEL_FREE       0x03
>  #define DRM_NOUVEAU_GROBJ_ALLOC        0x04 /* deprecated */
>  #define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC  0x05 /* deprecated */
>  #define DRM_NOUVEAU_GPUOBJ_FREE        0x06 /* deprecated */
>  #define DRM_NOUVEAU_NVIF               0x07
>  #define DRM_NOUVEAU_SVM_INIT           0x08
>  #define DRM_NOUVEAU_SVM_BIND           0x09
> +#define DRM_NOUVEAU_VM_INIT            0x10
> +#define DRM_NOUVEAU_VM_BIND            0x11
> +#define DRM_NOUVEAU_EXEC               0x12
>  #define DRM_NOUVEAU_GEM_NEW            0x40
>  #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>  #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> @@ -188,6 +456,10 @@ struct drm_nouveau_svm_bind {
>  #define NOUVEAU_SVM_BIND_TARGET__GPU_VRAM               (1UL << 31)
> =20
> =20
> +#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE +=
 DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> +
>  #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
>  #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
> =20
> @@ -197,6 +469,9 @@ struct drm_nouveau_svm_bind {
>  #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
>  #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
> =20
> +#define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
> +#define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
> +#define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>  #if defined(__cplusplus)
>  }
>  #endif

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat
