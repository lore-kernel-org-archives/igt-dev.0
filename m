Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9D06EE62
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jun 2021 20:23:48 +0000 (UTC)
Date: Wed, 2 Jun 2021 16:23:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YLfox8RJtwE2JNYw@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-5-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518103344.2264397-5-alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 04/17] Add basic PXP testing of buffer
 and context alloc
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

On Tue, May 18, 2021 at 03:33:31AM -0700, Alan Previn wrote:
> Test PXP capability support as well as the allocation of protected
> buffers and protected contexts.
> =

> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  tests/i915/gem_pxp.c | 353 +++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |   1 +
>  2 files changed, 354 insertions(+)
>  create mode 100644 tests/i915/gem_pxp.c

I'm not sure gem_pxp is the best name for this. Specially when we start
adding display cases.

Could we go with pxp.c only?

anyway, the content is great.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> =

> diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> new file mode 100644
> index 00000000..8779dddc
> --- /dev/null
> +++ b/tests/i915/gem_pxp.c
> @@ -0,0 +1,353 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "i915/gem.h"
> +
> +IGT_TEST_DESCRIPTION("Test PXP that manages protected content through ar=
bitrated HW-PXP-session");
> +/* Note: PXP =3D "Protected Xe Path" */
> +
> +static bool is_pxp_hw_supported(int i915)
> +{
> +	uint32_t devid =3D intel_get_drm_devid(i915);
> +
> +	if (IS_TIGERLAKE(devid) || IS_ROCKETLAKE(devid) || IS_ALDERLAKE_S(devid=
))
> +		return true;
> +
> +	return false;
> +}
> +
> +static int create_bo_ext(int i915, uint32_t size, bool protected_is_true=
, uint32_t *bo_out)
> +{
> +	int ret;
> +
> +	struct drm_i915_gem_create_ext_protected_content protected_ext =3D {
> +		.base =3D { .name =3D I915_GEM_CREATE_EXT_PROTECTED_CONTENT },
> +		.flags =3D 0,
> +	};
> +
> +	struct drm_i915_gem_create_ext create_ext =3D {
> +		.size =3D size,
> +		.extensions =3D 0,
> +	};
> +
> +	if (protected_is_true)
> +		create_ext.extensions =3D (uintptr_t)&protected_ext;
> +
> +	ret =3D igt_ioctl(i915, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> +	if (!ret)
> +		*bo_out =3D create_ext.handle;
> +
> +	return ret;
> +}
> +
> +static void test_bo_alloc_pxp_nohw(int i915)
> +{
> +	int ret;
> +	uint32_t bo;
> +
> +	ret =3D create_bo_ext(i915, 4096, false, &bo);
> +	igt_assert_eq(ret, 0);
> +	gem_close(i915, bo);
> +
> +	ret =3D create_bo_ext(i915, 4096, true, &bo);
> +	igt_assert_eq(ret, -ENODEV);
> +	igt_assert_eq(bo, 0);
> +}
> +
> +static void test_bo_alloc_pxp_off(int i915)
> +{
> +	int ret;
> +	uint32_t bo;
> +
> +	ret =3D create_bo_ext(i915, 4096, false, &bo);
> +	igt_assert_eq(ret, 0);
> +	gem_close(i915, bo);
> +}
> +
> +static void test_bo_alloc_pxp_on(int i915)
> +{
> +	int ret;
> +	uint32_t bo;
> +
> +	ret =3D create_bo_ext(i915, 4096, true, &bo);
> +	igt_assert_eq(ret, 0);
> +	gem_close(i915, bo);
> +}
> +
> +static int create_ctx_with_params(int i915, bool with_protected_param, b=
ool protected_is_true,
> +				  bool with_recoverable_param, bool recoverable_is_true,
> +				  uint32_t *ctx_out)
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
> +		p_norecover.base.next_extension =3D to_user_pointer(&(p_prot.base));
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
> +	ret =3D __gem_ctx_create_ext(i915, &create);
> +	if (!ret)
> +		*ctx_out =3D create.ctx_id;
> +
> +	return ret;
> +}
> +
> +#define CHANGE_PARAM_PROTECTED 0x0001
> +#define CHANGE_PARAM_RECOVERY 0x0002
> +
> +static int modify_ctx_param(int i915, uint32_t ctx_id, uint32_t param_ma=
sk, bool param_value)
> +{
> +	int ret;
> +
> +	struct drm_i915_gem_context_param ctx_param =3D {
> +		.ctx_id =3D ctx_id,
> +		.param =3D 0,
> +		.value =3D 0,
> +	};
> +
> +	if (param_mask =3D=3D CHANGE_PARAM_PROTECTED) {
> +		ctx_param.param =3D I915_CONTEXT_PARAM_PROTECTED_CONTENT;
> +		ctx_param.value =3D (int)param_value;
> +	} else if (param_mask =3D=3D CHANGE_PARAM_RECOVERY) {
> +		ctx_param.param =3D I915_CONTEXT_PARAM_RECOVERABLE;
> +		ctx_param.value =3D (int)param_value;
> +	}
> +
> +	ret =3D igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_SETPARAM, &ctx_param=
);
> +
> +	return ret;
> +}
> +
> +static int get_ctx_protected_param(int i915, uint32_t ctx_id)
> +{
> +	int ret;
> +
> +	struct drm_i915_gem_context_param ctx_param =3D {
> +		.ctx_id =3D ctx_id,
> +		.param =3D I915_CONTEXT_PARAM_PROTECTED_CONTENT,
> +	};
> +
> +	ret =3D igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_GETPARAM, &ctx_param=
);
> +	igt_assert_eq(ret, 0);
> +
> +	return ctx_param.value;
> +}
> +
> +static int get_ctx_recovery_param(int i915, uint32_t ctx_id)
> +{
> +	int ret;
> +
> +	struct drm_i915_gem_context_param ctx_param =3D {
> +		.ctx_id =3D ctx_id,
> +		.param =3D I915_CONTEXT_PARAM_RECOVERABLE,
> +	};
> +
> +	ret =3D igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_GETPARAM, &ctx_param=
);
> +	igt_assert_eq(ret, 0);
> +
> +	return ctx_param.value;
> +}
> +
> +static void test_ctx_alloc_pxp_nohw(int i915)
> +{
> +	uint32_t ctx;
> +
> +	igt_assert_eq(create_ctx_with_params(i915, true, true, true, false, &ct=
x), -ENODEV);
> +	igt_assert_eq(create_ctx_with_params(i915, true, false, true, false, &c=
tx), 0);
> +	igt_assert_eq(get_ctx_protected_param(i915, ctx), 0);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
> +	gem_context_destroy(i915, ctx);
> +}
> +
> +static void test_ctx_alloc_recover_off_protect_off(int i915)
> +{
> +	uint32_t ctx;
> +
> +	igt_assert_eq(create_ctx_with_params(i915, true, false, true, false, &c=
tx), 0);
> +	igt_assert_eq(get_ctx_protected_param(i915, ctx), 0);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
> +	gem_context_destroy(i915, ctx);
> +}
> +
> +static void test_ctx_alloc_recover_off_protect_on(int i915)
> +{
> +	uint32_t ctx;
> +
> +	igt_assert_eq(create_ctx_with_params(i915, true, true, true, false, &ct=
x), 0);
> +	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
> +	gem_context_destroy(i915, ctx);
> +}
> +
> +static void test_ctx_alloc_recover_on_protect_off(int i915)
> +{
> +	uint32_t ctx;
> +
> +	igt_assert_eq(create_ctx_with_params(i915, true, false, true, true, &ct=
x), 0);
> +	igt_assert_eq(get_ctx_protected_param(i915, ctx), 0);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 1);
> +	gem_context_destroy(i915, ctx);
> +}
> +
> +static void test_ctx_alloc_recover_on_protect_on(int i915)
> +{
> +	uint32_t ctx;
> +
> +	igt_assert_eq(create_ctx_with_params(i915, true, true, true, true, &ctx=
), -EPERM);
> +	igt_assert_eq(create_ctx_with_params(i915, true, true, false, false, &c=
tx), -EPERM);
> +}
> +
> +static void test_ctx_mod_recover_off_to_on(int i915)
> +{
> +	uint32_t ctx;
> +
> +	igt_assert_eq(create_ctx_with_params(i915, true, true, true, false, &ct=
x), 0);
> +	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
> +	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_RECOVERY, true),=
 -EPERM);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
> +	gem_context_destroy(i915, ctx);
> +}
> +
> +static void test_ctx_mod_protected_on_to_off(int i915)
> +{
> +	uint32_t ctx;
> +
> +	igt_assert_eq(create_ctx_with_params(i915, true, true, true, false, &ct=
x), 0);
> +	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
> +	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_PROTECTED, false=
), -EPERM);
> +	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
> +	gem_context_destroy(i915, ctx);
> +}
> +
> +static void test_ctx_mod_protected_to_all_invalid(int i915)
> +{
> +	uint32_t ctx;
> +
> +	igt_assert_eq(create_ctx_with_params(i915, true, true, true, false, &ct=
x), 0);
> +	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
> +	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_RECOVERY, true),=
 -EPERM);
> +	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_PROTECTED, false=
), -EPERM);
> +	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
> +	gem_context_destroy(i915, ctx);
> +}
> +
> +static void test_ctx_mod_regular_to_all_valid(int i915)
> +{
> +	uint32_t ctx;
> +
> +	igt_assert_eq(create_ctx_with_params(i915, false, false, false, false, =
&ctx), 0);
> +	igt_assert_eq(get_ctx_protected_param(i915, ctx), 0);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 1);
> +	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_RECOVERY, false)=
, 0);
> +	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_PROTECTED, true)=
, -EPERM);
> +	igt_assert_eq(get_ctx_protected_param(i915, ctx), 0);
> +	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
> +	gem_context_destroy(i915, ctx);
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
> +			test_bo_alloc_pxp_nohw(i915);
> +		igt_describe("Verify protected context on unsupported hw:");
> +		igt_subtest("hw-rejects-pxp-context")
> +			test_ctx_alloc_pxp_nohw(i915);
> +	}
> +
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require(pxp_supported);
> +		}
> +
> +		igt_describe("Verify protected buffer on supported hw:");
> +		igt_subtest("create-regular-buffer")
> +			test_bo_alloc_pxp_off(i915);
> +		igt_subtest("create-protected-buffer")
> +			test_bo_alloc_pxp_on(i915);
> +
> +		igt_describe("Verify protected context on supported hw:");
> +		igt_subtest("create-regular-context-1")
> +			test_ctx_alloc_recover_off_protect_off(i915);
> +		igt_subtest("create-regular-context-2")
> +			test_ctx_alloc_recover_on_protect_off(i915);
> +		igt_subtest("fail-invalid-protected-context")
> +			test_ctx_alloc_recover_on_protect_on(i915);
> +		igt_subtest("create-valid-protected-context")
> +			test_ctx_alloc_recover_off_protect_on(i915);
> +
> +		igt_describe("Verify protected context integrity:");
> +		igt_subtest("reject-modify-context-protection-on")
> +			test_ctx_mod_regular_to_all_valid(i915);
> +		igt_subtest("reject-modify-context-protection-off-1")
> +			test_ctx_mod_recover_off_to_on(i915);
> +		igt_subtest("reject-modify-context-protection-off-2")
> +			test_ctx_mod_protected_on_to_off(i915);
> +		igt_subtest("reject-modify-context-protection-off-3")
> +			test_ctx_mod_protected_to_all_invalid(i915);
> +	}
> +
> +	igt_fixture {
> +		close(i915);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 19cc4ebe..e0bff4d1 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -187,6 +187,7 @@ i915_progs =3D [
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
