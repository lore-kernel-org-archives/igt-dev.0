Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BE6CAC5A7
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 15:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D8E10E981;
	Thu, 25 Sep 2025 15:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="iBlbIIFb";
	dkim-atps=neutral
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0892310E97E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 15:46:11 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-854fcb187b2so122537585a.2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1758815170; x=1759419970;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LN2UfV+nCgAM+gDCXs002ZKrIwprEDPRNr/mHOr6UMA=;
 b=iBlbIIFbb+w5qVl2z/4Rqm5/d5CAUw+dnNMXCmfYNUZxRMArFtfs8ATHSn3PUn9QEL
 S2netJ9zpR+yVPtQXNOgrrIP677irFQeVZAcR4urJWIXLJ+vLtfSVJ/ksBgwePKrOxeM
 2mnF8frIZXAq2evwYkeqiUCem67s6ofFyY+d5KM6wwMdz/wOuT8Vk+cN2s9ekiE5HR92
 8A21NFw9gpOHbaKBdJ61gioNxvdSWgZpo4RAXTaJexVixkpUFAUrjkl0/YR1a6HGjN2T
 9zQPjlLKMZwkGm7VhRS16s0Dldsq1PcykrLyAvOx5IJvRL7xUt//6yR3ON2wwY6Pu0Bv
 IPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758815170; x=1759419970;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LN2UfV+nCgAM+gDCXs002ZKrIwprEDPRNr/mHOr6UMA=;
 b=hJ4K/PkFRnGjVJOcqV3l/c/xvTDUT1tfUrrHclbbPjaOYfS0wMTCN2R9XbokbJCNH/
 jNm7mk9IJiLsnKScAZO/ZW24yosB4zEQzMQCblGKUtQKPl39Y6+HMNxdTqas/38s/JoR
 XkoFOlhxv1uOCIR2FnxQ4r7qWERp5yEwa9Mf0jpMZ71VNYvF4H6bvVnV4V51hKl1DcYz
 uTiul/XWcxWIrL6Ydugc0ezea9izju3LpgqXeELLqWsgvMM/IKZ6PHVtzIJ/Q172x4Wg
 LWz3VjnSxXLJFD913OIP6ib++ht+WqQfFBGMtP02vvJXzhz0jVYhNJ7GTngH3ibxLalG
 CNpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI5klrYigKzEX5eHp9R+GbvzZ4g/Eo9HWViu7HM/79J9QUG0/h7GyUUb/u6KyUJdzd73oKr5tB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJyUXV4VvYY+9vFywgH2fOsrVGR9zDi4MFCC5c8YuOko5glKS9
 Q+OqeR7saLd5OCnZlf7NQhB/P/MR2ij1KyX04z932cA+qzQ5DAGCUSknrtDI3vBau0FZC4zw+vB
 Puwp4dcwx6hWE2X2ziZyfnuhLlreYXxkRPBmQbGYs8Q==
X-Gm-Gg: ASbGncsMcJPuEqUOjDrW8y1gykHMqYrNQyGG8wNqINWWKMzkUMUr2UvUGEOBTZgAA9q
 Utwv5cicE3d6CPpcCPqBHtfklL2vcC5IqLYpHEPe73CERj9m2IYNCO5ebbJHM8TEopiWtm+qhY0
 7SaffPRvHO/xmUt5QeZDjIrF8PyDFPy4C5M1Cojgn2oC5Giig773GR4a7P9/bkQT3gM4vhaebAX
 DqJjpE=
X-Google-Smtp-Source: AGHT+IFfYIyUZcZjsdXXMekEnqorlBXvPneQ3p5LEE/QLpCp6tw40meQMeA5fnV9pkZYSXpewAEI3oNnJq0yAaqkycw=
X-Received: by 2002:a05:620a:698b:b0:828:aff4:3c03 with SMTP id
 af79cd13be357-85ae8a3def7mr539964285a.61.1758815169840; Thu, 25 Sep 2025
 08:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250912181931.3738444-1-daniel.almeida@collabora.com>
 <20250912181931.3738444-4-daniel.almeida@collabora.com>
In-Reply-To: <20250912181931.3738444-4-daniel.almeida@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 25 Sep 2025 16:45:57 +0100
X-Gm-Features: AS18NWBmBCpWWAYvCBvQu2pj8GP639rbRGOjlXDcjAMIvPm5fqo4BC0A7MfxVXk
Message-ID: <CAPj87rMKex=mBSx9A3JOvwF3DVJRoiwK6oELXr+hoT2GVOq_Rw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/panthor: add panthor tests
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com, 
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com, 
 ashutosh.dixit@intel.com, karthik.b.s@intel.com, 
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com, 
 aliceryhl@google.com, jeffv@google.com, intel-gfx@lists.freedesktop.org, 
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi,

On Fri, 12 Sept 2025 at 19:20, Daniel Almeida
<daniel.almeida@collabora.com> wrote:
> +igt_main {
> +       igt_describe("Create a buffer object");
> +       igt_subtest("bo_create") {
> +               struct panthor_bo bo;
> +
> +               igt_panthor_bo_create(fd, &bo, 4096, 0, 0);
> +               igt_assert(bo.handle != 0);

Please - here and everywhere else - use the specific igt_assert_*()
macros. Those print out the actual values, so are much more useful
when debugging.

> +       igt_describe_f("Create a buffer object whose size is not page-aligned, and check "
> +               "that the allocated size is rounded up to the next page size %lu.",
> +               8192UL);
> +       igt_subtest("bo_create_round_size") {
> +               struct panthor_bo bo;
> +               uint64_t expected_size = 8192;

Shouldn't this be based on the actual page size in use?

> +static void
> +issue_store_multiple(u8 *command_stream, uint64_t kernel_va, uint32_t constant)
> +{
> +               uint64_t opcode, reg_num, mov48, store_multiple, flush;
> +               uint64_t sr, src0, register_bitmap, offset;
> +
> +               // MOV48: Load the source register ([r68; r69]) with the kernel address
> +               opcode = 0x1;
> +               reg_num = 68;
> +               mov48 = (opcode << 56) | (reg_num << 48) | kernel_va;
> +               mov48 = htole64(mov48);
> +               memcpy(&command_stream[0], &mov48, sizeof(mov48));
> +
> +               // MOV48: Load a known constant into r70
> +               opcode = 0x1;
> +               reg_num = 70;
> +               mov48 = (opcode << 56) | (reg_num << 48) | constant;
> +               mov48 = htole64(mov48);
> +               memcpy(&command_stream[8], &mov48, sizeof(mov48));
> +
> +               // STORE_MULTIPLE: Store the first register to the address pointed to by [r68; r69]
> +               opcode = 0x15; // STORE_MULTIPLE
> +               sr = 70; // Starting from register r70
> +               src0 = 68; // Address pointed to by [r68; r69]
> +               register_bitmap = 1; // Store the first register
> +               offset = 0; // Offset
> +               store_multiple = (opcode << 56) | (sr << 48) | (src0 << 40) |
> +                                                                                (register_bitmap << 16) | offset;
> +               store_multiple = htole64(store_multiple);
> +               memcpy(&command_stream[16], &store_multiple, sizeof(store_multiple));

// MOV48 r68, 0 on the below?

> +               opcode = 0x1;
> +               reg_num = 68;
> +               mov48 = (opcode << 56) | (reg_num << 48) | 0;
> +               mov48 = htole64(mov48);
> +               memcpy(&command_stream[24], &mov48, sizeof(mov48));

// FLUSH_PAGES?

> +               opcode = 36;
> +               flush = opcode << 56 | 0ull << 48 | reg_num << 40 | 0ull << 16 | 0x233;
> +               flush = htole64(flush);
> +               memcpy(&command_stream[32], &flush, sizeof(flush));
> +}


> +               group_create.queues = queues;
> +               group_create.max_compute_cores = 1;
> +               group_create.max_fragment_cores = 1;
> +               group_create.max_tiler_cores = 1;
> +               group_create.priority = PANTHOR_GROUP_PRIORITY_MEDIUM;
> +               group_create.compute_core_mask = gpu_info.shader_present & 0x1; // Use first core
> +               group_create.fragment_core_mask = gpu_info.shader_present & 0x1; // Use first core
> +               group_create.tiler_core_mask = gpu_info.tiler_present & 0x1; // Use first tiler

This will either be 0 (rejected) or 1 (possibly valid but possibly
not). Did you mean (1 << ffs(...))? Same issue below, so maybe this
wants a little helper.

> +               igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_CREATE, &group_create), 0);
> +               igt_assert(group_create.group_handle != 0);
> +
> +               // Cleanup: Destroy the group and VM

igt does use /* */ rather than // everywhere, if you're respinning anyway.

> +               group_destroy = (struct drm_panthor_group_destroy){
> +                       .group_handle = group_create.group_handle
> +               };
> +               igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_DESTROY, &group_destroy), 0);

do_ioctl() - here and elsewhere.

> +       igt_subtest("group_submit") {
> +               struct drm_panthor_gpu_info gpu_info = {};
> +               struct drm_panthor_vm_create vm_create = {};
> +               struct drm_panthor_group_create group_create = {};
> +               struct drm_panthor_queue_create queue = {};
> +               struct drm_panthor_obj_array queues = {};
> +               struct drm_panthor_group_submit group_submit = {};
> +               struct drm_panthor_queue_submit queue_submit = {};
> +               struct drm_panthor_group_destroy group_destroy = {};
> +               struct drm_panthor_obj_array queue_submits = {};
> +               struct drm_panthor_vm_destroy vm_destroy = {};
> +               struct drm_panthor_bo_create bo_create = {};
> +               struct drm_panthor_vm_bind vm_bind = {};
> +               struct drm_panthor_vm_bind_op vm_bind_op = {};
> +               struct drm_syncobj_wait wait = {};
> +               struct drm_syncobj_create syncobj_create = {};
> +               struct drm_panthor_sync_op sync_op = {};
> +               struct drm_gem_close gem_close = {};
> +               struct drm_syncobj_destroy syncobj_destroy = {};
> +               uint64_t command_stream_gpu_addr;
> +               uint32_t command_stream_size;
> +               uint64_t result_gpu_addr;
> +               uint32_t cmd_buf_bo_handle;
> +               uint32_t result_bo_handle;
> +               uint32_t syncobj_handle;
> +               uint8_t command_stream[64] = {0};
> +               uint8_t *bo_cpu_addr;
> +               uint8_t *result_cpu_addr;
> +               const int INITIAL_VA = 0x1000000;
> +               uint64_t bo_mmap_offset;
> +
> +               igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> +                                 &gpu_info, sizeof(gpu_info), 0);
> +               igt_assert(gpu_info.gpu_id != 0);
> +
> +               vm_create.flags = 0;
> +               igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create), 0);
> +               igt_assert(vm_create.id != 0);
> +
> +               bo_create.size = 4096;
> +               bo_create.flags = 0;
> +               bo_create.exclusive_vm_id = vm_create.id;
> +               igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_BO_CREATE, &bo_create), 0);
> +               igt_assert(bo_create.handle != 0);
> +               cmd_buf_bo_handle = bo_create.handle;

Why not use the helpers here?

> +               wait = (struct drm_syncobj_wait) {
> +                       .handles = (uint64_t)&syncobj_handle,
> +                       .count_handles = 1,
> +                       .timeout_nsec = INT64_MAX,
> +                       .flags = 0,
> +               };
> +
> +               igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_WAIT, &wait), 0);

Similarly, syncobj_create() and syncobj_wait().

Thanks a lot for writing this up. Having more negative cases would be
really nice, but this is a really good start, so I'm happy for it to
land once it's been cleaned up.

Cheers,
Daniel
