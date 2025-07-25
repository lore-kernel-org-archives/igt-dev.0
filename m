Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134CBC87FCA
	for <igt-dev@archiver.kernel.org>; Fri, 25 Jul 2025 10:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20C310E1A6;
	Fri, 25 Jul 2025 10:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="db7/K1FM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029DE10E1B6
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jul 2025 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753439301; x=1784975301;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=TnRWm6WVzOstKkWc0x5OMJqnl4vwUDg5ya+Y+lmcdTo=;
 b=db7/K1FMdEfrSmsA4glb41s9OKg5VyaPyfONs2c4n/LZ7Gi+yyUe3433
 LPFsHH6AuJJL6u274mmrODGZhzPXyWidm/PtgTSSN0BvQbjOnCvo71NtO
 7vOeZkhJ2XMPxsPjFn5CSt+LBsyZhcXWfEUEeFiBAIchvZd7d31NOcsIz
 cYWZ3VXkLAjzSM4BUvgsUy0yTWl3/Ar33+FMGthl4Ix8zYffVICeQ4kr4
 AziWyxvOYJVszYyh6cMXrtUpHFXgKz25pB3Cidkh0nYRS0daCiLkAUQzc
 8DTDNLQvDjWcRndwSLrrXG+92oQYn+7bBdu0Km+rYcxeLN0xFl+LIsf/X g==;
X-CSE-ConnectionGUID: dh+OdvC5TAahGRmQcq6KMA==
X-CSE-MsgGUID: SkAWtv8iSqqpG1zxPw/jyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55922101"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55922101"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:28:20 -0700
X-CSE-ConnectionGUID: 9VETlyghQMKwfUDXSSg1Ag==
X-CSE-MsgGUID: G4bhYBGRR367M/mkighb5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165097302"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.255])
 ([10.245.244.255])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:28:19 -0700
Message-ID: <2db0432fee046e3bf83ea36296d7dd2475e33cbd.camel@linux.intel.com>
Subject: Re: [i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under memory
 pressure
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org
Date: Fri, 25 Jul 2025 12:28:16 +0200
In-Reply-To: <20250716115237.3279176-1-priyanka.dandamudi@intel.com>
References: <20250716115237.3279176-1-priyanka.dandamudi@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Wed, 2025-07-16 at 17:22 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Add a test which create buffer objects on an LR vm and vm_binding
> buffer objects in a loop until it reaches OOM.
> This is to check that buffer objects on a single vm doesnot get
> evicted
> and instead report with ENOMEM in non fault mode.
>=20
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Acked-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
> =C2=A0tests/intel/xe_vm.c | 65
> +++++++++++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 65 insertions(+)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index c1abb08bb..e808a0b4e 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2368,6 +2368,65 @@ static void invalid_vm_id(int fd)
> =C2=A0	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);
> =C2=A0}
> =C2=A0
> +/**
> + * SUBTEST: out-of-memory
> + * Description: Test if vm_bind ioctl results in oom
> + * when creating and vm_binding buffer objects on an LR vm beyond
> available visible vram size.
> + * Functionality: oom
> + * Test category: functionality test
> + */
> +static void test_oom(int fd)
> +{
> +#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +#define BO_SIZE xe_bb_size(fd, SZ_512M)
> +#define MAX_BUFS (int)(xe_visible_vram_size(fd, 0) / BO_SIZE)
> +	uint64_t addr =3D 0x1a0000;
> +	uint64_t vm_sync;
> +	uint32_t bo[MAX_BUFS + 1];
> +	uint32_t *data[MAX_BUFS + 1];
> +	uint32_t vm;
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL,
> +		=C2=A0 .timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	size_t bo_size =3D BO_SIZE;
> +	int total_bufs =3D MAX_BUFS;
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	for (int iter =3D 0; iter <=3D total_bufs; iter++) {
> +		bo[iter] =3D xe_bo_create(fd, 0, bo_size,
> +					vram_if_possible(fd, 0),
> +					DRM_XE_GEM_CREATE_FLAG_DEFER
> _BACKING |
> +					DRM_XE_GEM_CREATE_FLAG_NEEDS
> _VISIBLE_VRAM);
> +
> +		sync[0].addr =3D to_user_pointer(&vm_sync);
> +		if (iter < total_bufs)
> +			xe_vm_bind_async(fd, vm, 0, bo[iter], 0,
> +					 addr + bo_size * iter,
> bo_size, sync, 1);

This will error if VRAM was smaller than estimated, right? I think that
may happen if previous tests in CI have leaked VRAM memory and IMO the
test should still pass in that case, perhaps with a warning or debug
message as long as we see an OOM error.


> +		else {
> +			igt_assert_eq(__xe_vm_bind(fd, vm, 0,
> bo[iter], 0,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr +=
 bo_size *
> iter, bo_size,
> +						=C2=A0=C2=A0
> DRM_XE_VM_BIND_OP_MAP, 0, sync, 1, 0,
> +						=C2=A0=C2=A0
> DEFAULT_PAT_INDEX, 0), -ENOMEM);

XeKMD may return -ENOMEM or -ENOSPC on these errors, so we should also
check for -ENOSPC.


Otherwise LGTM.
/Thomas


> +			break;
> +
> +		}
> +		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> NSEC_PER_SEC);
> +		vm_sync =3D 0;
> +		data[iter] =3D xe_bo_map(fd, bo[iter], bo_size);
> +		memset(data[iter], 0, bo_size);
> +	}
> +
> +	for (int iter =3D 0; iter < total_bufs; iter++) {
> +		sync[0].addr =3D to_user_pointer(&vm_sync);
> +		xe_vm_unbind_async(fd, vm, 0, 0, addr + bo_size *
> iter, bo_size,
> +				=C2=A0=C2=A0 sync, 1);
> +		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> NSEC_PER_SEC);
> +		munmap(data[iter], bo_size);
> +		gem_close(fd, bo[iter]);
> +	}
> +}
> +
> =C2=A0igt_main
> =C2=A0{
> =C2=A0	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy =3D
> NULL;
> @@ -2759,6 +2818,12 @@ igt_main
> =C2=A0	igt_subtest("invalid-vm-id")
> =C2=A0		invalid_vm_id(fd);
> =C2=A0
> +	igt_subtest("out-of-memory") {
> +		igt_require(xe_has_vram(fd));
> +		igt_assert(xe_visible_vram_size(fd, 0));
> +		test_oom(fd);
> +	}
> +
> =C2=A0	igt_fixture
> =C2=A0		drm_close_driver(fd);
> =C2=A0}

