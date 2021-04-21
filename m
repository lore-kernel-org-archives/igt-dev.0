Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A516E975
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Apr 2021 10:10:05 +0000 (UTC)
Date: Wed, 21 Apr 2021 06:09:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YH/59zJ9UpQc0ZN3@intel.com>
References: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
 <20210325054549.465386-3-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325054549.465386-3-alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 02/15] Add basic PXP testing of
 buffer and context alloc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 10:45:36PM -0700, Alan Previn wrote:
> Test PXP capability support as well as the allocation of protected
> buffers and protected contexts.
> =

> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  tests/Makefile.sources |   3 +
>  tests/i915/gem_pxp.c   | 410 +++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |   1 +
>  3 files changed, 414 insertions(+)
>  create mode 100644 tests/i915/gem_pxp.c
> =

> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index 4f24fb3a..05952066 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -370,6 +370,9 @@ gem_pwrite_SOURCES =3D i915/gem_pwrite.c
>  TESTS_progs +=3D gem_pwrite_snooped
>  gem_pwrite_snooped_SOURCES =3D i915/gem_pwrite_snooped.c
>  =

> +TESTS_progs +=3D gem_pxp
> +gem_pxp_SOURCES =3D i915/gem_pxp.c
> +
>  TESTS_progs +=3D gem_read_read_speed
>  gem_read_read_speed_SOURCES =3D i915/gem_read_read_speed.c
>  =

> diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> new file mode 100644
> index 00000000..40a817b2
> --- /dev/null
> +++ b/tests/i915/gem_pxp.c
> @@ -0,0 +1,410 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + */
> +
> +#include <sys/ioctl.h>
> +
> +#include "igt.h"
> +#include "i915/gem.h"
> +
> +IGT_TEST_DESCRIPTION("Test PXP (Protected Xe Path), which is the compone=
nt "
> +			"that allows the handling of protected content through "
> +			"the arbitration of hardware protected sessions.");
> +
> +/* test-configs for protected buffer creation*/

                                                ^ missing space

> +#define BO_ALLOC_NO_HW_SUPPORT 1
> +#define BO_ALLOC_PROTECT_ON 2
> +#define BO_ALLOC_PROTECT_OFF 3
> +
> +/* test-configs for protected context creation*/

                                                 ^ missing space

> +#define CTX_ALLOC_NO_HW_SUPPORT 1
> +#define CTX_ALLOC_RECOVER_OFF_PROTECT_OFF 2
> +#define CTX_ALLOC_RECOVER_OFF_PROTECT_ON 3
> +#define CTX_ALLOC_RECOVER_ON_PROTECT_OFF 4
> +#define CTX_ALLOC_RECOVER_ON_PROTECT_ON 5
> +#define CTX_MODIFY_PROTECTED_RECOVER_OFF_TO_ON 6
> +#define CTX_MODIFY_PROTECTED_PROTECT_ON_TO_OFF 7
> +#define CTX_MODIFY_PROTECTED_BOTHPARAMS_TO_INVALID 8
> +#define CTX_MODIFY_UNPROTECTED_BOTHPARAMS_TO_VALID 9
> +
> +static bool is_pxp_hw_supported(int i915)
> +{
> +	uint32_t gen;
> +
> +	gen =3D intel_gen(intel_get_drm_devid(i915));
> +	if (!gen) {
> +		igt_info("No device info found - assume no PXP support.\n");
> +		return false;
> +	}
> +
> +	if (gen >=3D 12)
> +		return true;
> +
> +	return false;
> +}
> +
> +static uint32_t create_protected_bo(int i915, uint32_t size,
> +				    bool with_protected_param,
> +				    bool protected_is_true, int expected_return)

why do you need both with_protected_param and protected_is_true?
I searched the series and it looks like they always match, so why not simply

static uint32_t create_bo(int i915, uint32_t size, bool protected, int retu=
rn_assert)

?

> +{
> +	int ret;
> +
> +	struct drm_i915_gem_object_param protected_param =3D {
> +		.param =3D I915_OBJECT_PARAM | I915_OBJECT_PARAM_PROTECTED_CONTENT,
> +		.data =3D 0,
> +	};
> +
> +	struct drm_i915_gem_create_ext_setparam setparam_protected =3D {
> +		.base =3D { .name =3D I915_GEM_CREATE_EXT_SETPARAM },
> +		.param =3D protected_param,
> +	};
> +
> +	struct drm_i915_gem_create_ext create_ext =3D {
> +		.size =3D size,
> +		.extensions =3D (uintptr_t)&setparam_protected,
> +	};
> +
> +	if (!with_protected_param) {
> +		create_ext.extensions =3D 0;
> +	} else {
> +		if (protected_is_true) {
> +			protected_param.data =3D 1;
> +			setparam_protected.param =3D protected_param;
> +		} else {
> +			protected_param.data =3D 0;
> +			setparam_protected.param =3D protected_param;
> +		}
> +	}
> +
> +	ret =3D ioctl(i915, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> +	igt_assert_eq(ret, expected_return);
> +
> +	return create_ext.handle;
> +}
> +
> +static void test_create_protected_buffer(int i915, uint32_t test_cfg)
> +{
> +	uint32_t bo;
> +
> +	switch (test_cfg) {
> +	case BO_ALLOC_NO_HW_SUPPORT:
> +		bo =3D create_protected_bo(i915, 4096, false, false, 0);
> +		gem_close(i915, bo);
> +		bo =3D create_protected_bo(i915, 4096, true, true, -ENODEV);
> +		igt_assert_eq(bo, 0);
> +		break;
> +
> +	case BO_ALLOC_PROTECT_OFF:
> +		bo =3D create_protected_bo(i915, 4096, false, false, 0);
> +		gem_close(i915, bo);
> +		break;
> +
> +	case BO_ALLOC_PROTECT_ON:
> +		bo =3D create_protected_bo(i915, 4096, true, true, 0);
> +		gem_close(i915, bo);
> +		break;
> +
> +	default:
> +		igt_info("Skipping unknown buffer test_cfg =3D %d\n", test_cfg);
> +		break;
> +	}
> +}
> +
> +static int create_ext_ioctl(int i915,
> +			    struct drm_i915_gem_context_create_ext *arg)
> +{
> +	int err;
> +
> +	err =3D 0;
> +	if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT, arg)) {
> +		err =3D -errno;
> +		igt_assume(err);
> +	}
> +
> +	errno =3D 0;
> +	return err;
> +}
> +
> +static uint32_t create_protected_ctx(int i915, bool with_protected_param,
> +				     bool protected_is_true,
> +				     bool with_recoverable_param,
> +				     bool recoverable_is_true,
> +				     int expected_return)
> +{
> +	int ret;
> +
> +	struct drm_i915_gem_context_create_ext_setparam p_prot =3D {
> +		.base =3D {
> +			.name =3D I915_CONTEXT_CREATE_EXT_SETPARAM,
> +			.next_extension =3D 0,
> +		},
> +		.param =3D {
> +			.param =3D I915_CONTEXT_PARAM_PROTECTED_CONTENT,
> +			.value =3D 0,
> +		}
> +	};
> +	struct drm_i915_gem_context_create_ext_setparam p_norecover =3D {
> +		.base =3D {
> +			.name =3D I915_CONTEXT_CREATE_EXT_SETPARAM,
> +			.next_extension =3D 0,
> +		},
> +		.param =3D {
> +			.param =3D I915_CONTEXT_PARAM_RECOVERABLE,
> +			.value =3D 0,
> +		}
> +	};
> +	struct drm_i915_gem_context_create_ext create =3D {
> +		.flags =3D I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> +		.extensions =3D 0,
> +	};
> +
> +	p_prot.param.value =3D protected_is_true;
> +	p_norecover.param.value =3D recoverable_is_true;
> +
> +	if (with_protected_param && with_recoverable_param) {
> +		create.extensions =3D to_user_pointer(&(p_norecover.base));
> +		p_norecover.base.next_extension =3D
> +			to_user_pointer(&(p_prot.base));
> +	} else if (!with_protected_param && with_recoverable_param) {
> +		create.extensions =3D to_user_pointer(&(p_norecover.base));
> +		p_norecover.base.next_extension =3D 0;
> +	} else if (with_protected_param && !with_recoverable_param) {
> +		create.extensions =3D to_user_pointer(&(p_prot.base));
> +		p_prot.base.next_extension =3D 0;
> +	} else if (!with_protected_param && !with_recoverable_param) {
> +		create.flags =3D 0;
> +	}
> +
> +	ret =3D create_ext_ioctl(i915, &create);
> +	igt_assert_eq(ret, expected_return);
> +
> +	return create.ctx_id;
> +}
> +
> +#define CHANGE_PARAM_PROTECTED 0x0001
> +#define CHANGE_PARAM_RECOVERY 0x0002
> +static void modify_ctx_protected_param(int i915, uint32_t ctx_id,
> +				       uint32_t change_param_mask,
> +				       bool param_value, int expected_return)
> +{
> +	int ret;
> +
> +	struct drm_i915_gem_context_param ctx_param =3D {
> +		.ctx_id =3D ctx_id,
> +		.param =3D 0,
> +		.value =3D 0,
> +	};
> +
> +	if (change_param_mask =3D=3D CHANGE_PARAM_PROTECTED) {
> +		ctx_param.param =3D I915_CONTEXT_PARAM_PROTECTED_CONTENT;
> +		ctx_param.value =3D (int)param_value;
> +	} else if (change_param_mask =3D=3D CHANGE_PARAM_RECOVERY) {
> +		ctx_param.param =3D I915_CONTEXT_PARAM_RECOVERABLE;
> +		ctx_param.value =3D (int)param_value;
> +	} else {
> +		return;
> +	}
> +
> +	ret =3D ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_SETPARAM, &ctx_param);
> +
> +	igt_assert_eq(ret, expected_return);
> +}
> +
> +static void assert_ctx_protected_param(int i915, uint32_t ctx_id,
> +				       bool is_protected)
> +{
> +	int ret;
> +
> +	struct drm_i915_gem_context_param ctx_param =3D {
> +		.ctx_id =3D ctx_id,
> +		.param =3D I915_CONTEXT_PARAM_PROTECTED_CONTENT,
> +	};
> +
> +	ret =3D ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_GETPARAM, &ctx_param);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(ctx_param.value, (int)is_protected);
> +}
> +
> +static void assert_ctx_recovery_param(int i915, uint32_t ctx_id,
> +				      bool is_recoverable)
> +{
> +	int ret;
> +
> +	struct drm_i915_gem_context_param ctx_param =3D {
> +		.ctx_id =3D ctx_id,
> +		.param =3D I915_CONTEXT_PARAM_RECOVERABLE,
> +	};
> +
> +	ret =3D ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_GETPARAM, &ctx_param);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(ctx_param.value, (int)is_recoverable);
> +}
> +
> +static void test_create_protected_context(int i915, uint32_t test_cfg)
> +{
> +	uint32_t ctx;
> +
> +	switch (test_cfg) {
> +	case CTX_ALLOC_NO_HW_SUPPORT:
> +		ctx =3D create_protected_ctx(i915, true, true, true, false,
> +					   -ENODEV);
> +		igt_assert_eq(ctx, 0);
> +	case CTX_ALLOC_RECOVER_OFF_PROTECT_OFF:
> +		ctx =3D create_protected_ctx(i915, true, false, true, false, 0);
> +		assert_ctx_protected_param(i915, ctx, false);
> +		assert_ctx_recovery_param(i915, ctx, false);
> +		gem_context_destroy(i915, ctx);
> +		break;
> +
> +	case CTX_ALLOC_RECOVER_OFF_PROTECT_ON:
> +		ctx =3D create_protected_ctx(i915, true, true, true, false, 0);
> +		assert_ctx_protected_param(i915, ctx, true);
> +		assert_ctx_recovery_param(i915, ctx, false);
> +		gem_context_destroy(i915, ctx);
> +		break;
> +
> +	case CTX_ALLOC_RECOVER_ON_PROTECT_OFF:
> +		ctx =3D create_protected_ctx(i915, true, false, true, true, 0);
> +		assert_ctx_protected_param(i915, ctx, false);
> +		assert_ctx_recovery_param(i915, ctx, true);
> +		gem_context_destroy(i915, ctx);
> +		break;
> +
> +	case CTX_ALLOC_RECOVER_ON_PROTECT_ON:
> +		ctx =3D create_protected_ctx(i915, true, true, true, true,
> +					   -EPERM);
> +		igt_assert_eq(ctx, 0);
> +		ctx =3D create_protected_ctx(i915, true, true, false, false,
> +					   -EPERM);
> +		igt_assert_eq(ctx, 0);
> +		break;
> +
> +	case CTX_MODIFY_PROTECTED_RECOVER_OFF_TO_ON:
> +		ctx =3D create_protected_ctx(i915, true, true, true, false, 0);
> +		assert_ctx_protected_param(i915, ctx, true);
> +		assert_ctx_recovery_param(i915, ctx, false);
> +		modify_ctx_protected_param(i915, ctx, CHANGE_PARAM_RECOVERY,
> +					   true, -EPERM);
> +		assert_ctx_recovery_param(i915, ctx, false);
> +		gem_context_destroy(i915, ctx);
> +		break;
> +
> +	case CTX_MODIFY_PROTECTED_PROTECT_ON_TO_OFF:
> +		ctx =3D create_protected_ctx(i915, true, true, true, false, 0);
> +		assert_ctx_protected_param(i915, ctx, true);
> +		assert_ctx_recovery_param(i915, ctx, false);
> +		modify_ctx_protected_param(i915, ctx, CHANGE_PARAM_PROTECTED,
> +					   false, -EPERM);
> +		assert_ctx_protected_param(i915, ctx, true);
> +		assert_ctx_recovery_param(i915, ctx, false);
> +		gem_context_destroy(i915, ctx);
> +		break;
> +
> +	case CTX_MODIFY_PROTECTED_BOTHPARAMS_TO_INVALID:
> +		ctx =3D create_protected_ctx(i915, true, true, true, false, 0);
> +		assert_ctx_protected_param(i915, ctx, true);
> +		assert_ctx_recovery_param(i915, ctx, false);
> +		modify_ctx_protected_param(i915, ctx, CHANGE_PARAM_RECOVERY,
> +					   true, -EPERM);
> +		modify_ctx_protected_param(i915, ctx, CHANGE_PARAM_PROTECTED,
> +					   false, -EPERM);
> +		assert_ctx_protected_param(i915, ctx, true);
> +		assert_ctx_recovery_param(i915, ctx, false);
> +		gem_context_destroy(i915, ctx);
> +		break;
> +
> +	case CTX_MODIFY_UNPROTECTED_BOTHPARAMS_TO_VALID:
> +		ctx =3D create_protected_ctx(i915, false, false, false, false, 0);
> +		assert_ctx_protected_param(i915, ctx, false);
> +		assert_ctx_recovery_param(i915, ctx, true);
> +		modify_ctx_protected_param(i915, ctx, CHANGE_PARAM_RECOVERY,
> +					   false, 0);
> +		modify_ctx_protected_param(i915, ctx, CHANGE_PARAM_PROTECTED,
> +					   true, -EPERM);
> +		assert_ctx_protected_param(i915, ctx, false);
> +		assert_ctx_recovery_param(i915, ctx, false);
> +		gem_context_destroy(i915, ctx);
> +		break;
> +
> +	default:
> +		igt_info("Skipping unknown context test_cfg =3D %d\n", test_cfg);
> +		break;
> +	}
> +}
> +
> +igt_main
> +{
> +	int i915 =3D -1;
> +	bool pxp_supported =3D false;
> +
> +	igt_fixture
> +	{
> +		i915 =3D drm_open_driver(DRIVER_INTEL);
> +		igt_require(i915);
> +		igt_require_gem(i915);
> +		pxp_supported =3D is_pxp_hw_supported(i915);
> +	}
> +
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require((pxp_supported =3D=3D 0));
> +		}
> +
> +		igt_describe("Verify protected buffer on unsupported hw:");
> +		igt_subtest("hw-rejects-pxp-buffer")
> +			test_create_protected_buffer(i915,
> +				BO_ALLOC_NO_HW_SUPPORT);
> +		igt_describe("Verify protected context on unsupported hw:");
> +		igt_subtest("hw-rejects-pxp-context")
> +			test_create_protected_context(i915,
> +				CTX_ALLOC_NO_HW_SUPPORT);
> +	}
> +
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require(pxp_supported);
> +		}
> +
> +		igt_describe("Verify protected buffer on supported hw:");
> +		igt_subtest("create-regular-buffer")
> +			test_create_protected_buffer(i915,
> +				BO_ALLOC_PROTECT_OFF);
> +		igt_subtest("create-protected-buffer")
> +			test_create_protected_buffer(i915, BO_ALLOC_PROTECT_ON);
> +
> +		igt_describe("Verify protected context on supported hw:");
> +		igt_subtest("create-regular-context-1")
> +			test_create_protected_context(
> +				i915, CTX_ALLOC_RECOVER_OFF_PROTECT_OFF);
> +		igt_subtest("create-regular-context-2")
> +			test_create_protected_context(
> +				i915, CTX_ALLOC_RECOVER_ON_PROTECT_OFF);
> +		igt_subtest("fail-invalid-protected-context")
> +			test_create_protected_context(
> +				i915, CTX_ALLOC_RECOVER_ON_PROTECT_ON);
> +		igt_subtest("create-valid-protected-context")
> +			test_create_protected_context(
> +				i915, CTX_ALLOC_RECOVER_OFF_PROTECT_ON);
> +
> +		igt_describe("Verify protected context integrity:");
> +		igt_subtest("reject-modify-context-protection-on")
> +			test_create_protected_context(
> +				i915,
> +				CTX_MODIFY_UNPROTECTED_BOTHPARAMS_TO_VALID);
> +		igt_subtest("reject-modify-context-protection-off-1")
> +			test_create_protected_context(
> +				i915, CTX_MODIFY_PROTECTED_RECOVER_OFF_TO_ON);
> +		igt_subtest("reject-modify-context-protection-off-2")
> +			test_create_protected_context(
> +				i915, CTX_MODIFY_PROTECTED_PROTECT_ON_TO_OFF);
> +		igt_subtest("reject-modify-context-protection-off-3")
> +			test_create_protected_context(
> +				i915,
> +				CTX_MODIFY_PROTECTED_BOTHPARAMS_TO_INVALID);
> +	}
> +
> +	igt_fixture {
> +		close(i915);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 825e0183..e7144039 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -189,6 +189,7 @@ i915_progs =3D [
>  	'gem_pread_after_blit',
>  	'gem_pwrite',
>  	'gem_pwrite_snooped',
> +	'gem_pxp',
>  	'gem_read_read_speed',
>  	'gem_readwrite',
>  	'gem_reg_read',
> -- =

> 2.25.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
