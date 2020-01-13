Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 13 Jan 2020 19:21:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200113172103.GU13686@intel.com>
References: <20191217034836.3936-1-juston.li@intel.com>
 <20191217034836.3936-2-juston.li@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217034836.3936-2-juston.li@intel.com>
Subject: Re: [igt-dev] [PATCH v4 i-g-t 2/2] tests/kms_getfb: Add getfb2 tests
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
To: Juston Li <juston.li@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 07:48:40PM -0800, Juston Li wrote:
> From: Daniel Stone <daniels@collabora.com>
> =

> Mirroring addfb2, add tests for the new ioctl which will return us
> information about framebuffers containing multiple buffers, as well as
> modifiers.
> =

> Changes since v3:
> - Add subtests to ensure handles aren't returned for non-root and
>   non-master callers
> - Fix getfb2-handle-not-fb to use getfb2
> =

> Changes since v1:
> - Add test that uses getfb2 output to call addfb2 as suggested by Ville
> =

> Signed-off-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Juston Li <juston.li@intel.com>
> ---
>  tests/kms_getfb.c | 160 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
> =

> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
> index ca0b01c05e5c..ffd8f9117c92 100644
> --- a/tests/kms_getfb.c
> +++ b/tests/kms_getfb.c
> @@ -40,6 +40,8 @@
>  #include "drm.h"
>  #include "drm_fourcc.h"
>  =

> +#include "igt_device.h"
> +
>  static bool has_getfb_iface(int fd)
>  {
>  	struct drm_mode_fb_cmd arg =3D { };
> @@ -228,6 +230,158 @@ static void test_duplicate_handles(int fd)
>  	}
>  }
>  =

> +static void test_getfb2(int fd)
> +{
> +	struct drm_mode_fb_cmd2 add_basic =3D {};
> +
> +	igt_fixture {
> +		struct drm_mode_fb_cmd2 get =3D {};
> +
> +		add_basic.width =3D 1024;
> +		add_basic.height =3D 1024;
> +		add_basic.pixel_format =3D DRM_FORMAT_XRGB8888;
> +		add_basic.pitches[0] =3D 1024*4;
> +		add_basic.handles[0] =3D igt_create_bo_with_dimensions(fd, 1024, 1024,
> +			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> +		igt_assert(add_basic.handles[0]);
> +		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add_basic);
> +
> +		get.fb_id =3D add_basic.fb_id;
> +		do_ioctl(fd, DRM_IOCTL_MODE_GETFB2, &get);
> +		igt_assert_neq_u32(get.handles[0], 0);
> +		gem_close(fd, get.handles[0]);
> +	}
> +
> +	igt_subtest("getfb2-handle-zero") {
> +		struct drm_mode_fb_cmd2 get =3D {};
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB2, &get, ENOENT);
> +	}
> +
> +	igt_subtest("getfb2-handle-closed") {
> +		struct drm_mode_fb_cmd2 add =3D add_basic;
> +		struct drm_mode_fb_cmd2 get =3D { };
> +
> +		add.handles[0] =3D igt_create_bo_with_dimensions(fd, 1024, 1024,
> +			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> +		igt_assert(add.handles[0]);

Not sure why we're creating another bo here. Can't we reuse the one we
already have?

Otherwise seems sane
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add.fb_id);
> +
> +		get.fb_id =3D add.fb_id;
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB2, &get, ENOENT);
> +		gem_close(fd, add.handles[0]);
> +	}
> +
> +	igt_subtest("getfb2-handle-not-fb") {
> +		struct drm_mode_fb_cmd2 get =3D { .fb_id =3D get_any_prop_id(fd) };
> +		igt_require(get.fb_id > 0);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB2, &get, ENOENT);
> +	}
> +
> +	igt_subtest("getfb2-accept-ccs") {
> +		struct drm_mode_fb_cmd2 add_ccs =3D { };
> +		struct drm_mode_fb_cmd2 get =3D { };
> +		int i;
> +
> +		get_ccs_fb(fd, &add_ccs);
> +		igt_require(add_ccs.fb_id !=3D 0);
> +		get.fb_id =3D add_ccs.fb_id;
> +		do_ioctl(fd, DRM_IOCTL_MODE_GETFB2, &get);
> +
> +		igt_assert_eq_u32(get.width, add_ccs.width);
> +		igt_assert_eq_u32(get.height, add_ccs.height);
> +		igt_assert(get.flags & DRM_MODE_FB_MODIFIERS);
> +
> +		for (i =3D 0; i < ARRAY_SIZE(get.handles); i++) {
> +			igt_assert_eq_u32(get.pitches[i], add_ccs.pitches[i]);
> +			igt_assert_eq_u32(get.offsets[i], add_ccs.offsets[i]);
> +			if (add_ccs.handles[i] !=3D 0) {
> +				igt_assert_neq_u32(get.handles[i], 0);
> +				igt_assert_neq_u32(get.handles[i],
> +						   add_ccs.handles[i]);
> +				igt_assert_eq_u64(get.modifier[i],
> +						  add_ccs.modifier[i]);
> +			} else {
> +				igt_assert_eq_u32(get.handles[i], 0);
> +				igt_assert_eq_u64(get.modifier[i], 0);
> +			}
> +		}
> +		igt_assert_eq_u32(get.handles[0], get.handles[1]);
> +
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &get.fb_id);
> +		gem_close(fd, add_ccs.handles[0]);
> +		gem_close(fd, get.handles[0]);
> +	}
> +
> +	igt_subtest("getfb2-into-addfb2") {
> +		struct drm_mode_fb_cmd2 cmd =3D { };
> +
> +		cmd.fb_id =3D add_basic.fb_id;
> +		do_ioctl(fd, DRM_IOCTL_MODE_GETFB2, &cmd);
> +		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &cmd);
> +
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &cmd.fb_id);
> +		gem_close(fd, cmd.handles[0]);
> +	}
> +
> +	igt_fixture {
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add_basic.fb_id);
> +		gem_close(fd, add_basic.handles[0]);
> +	}
> +}
> +
> +static void test_handle_protection(void) {
> +	int non_master_fd;
> +	struct drm_mode_fb_cmd2 non_master_add =3D {};
> +
> +	igt_fixture {
> +		non_master_fd =3D drm_open_driver(DRIVER_ANY);
> +
> +		non_master_add.width =3D 1024;
> +		non_master_add.height =3D 1024;
> +		non_master_add.pixel_format =3D DRM_FORMAT_XRGB8888;
> +		non_master_add.pitches[0] =3D 1024*4;
> +		non_master_add.handles[0] =3D igt_create_bo_with_dimensions(non_master=
_fd, 1024, 1024,
> +			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> +		igt_require(non_master_add.handles[0] !=3D 0);
> +		do_ioctl(non_master_fd, DRM_IOCTL_MODE_ADDFB2, &non_master_add);
> +	}
> +
> +	igt_subtest("getfb-handle-protection") {
> +		struct drm_mode_fb_cmd get =3D { .fb_id =3D non_master_add.fb_id};
> +
> +		igt_fork(child, 1) {
> +			igt_drop_root();
> +
> +			do_ioctl(non_master_fd, DRM_IOCTL_MODE_GETFB, &get);
> +			/* ioctl succeeds but handle should be 0 */
> +			igt_assert_eq_u32(get.handle, 0);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_subtest("getfb2-handle-protection") {
> +		struct drm_mode_fb_cmd2 get =3D { .fb_id =3D non_master_add.fb_id};
> +		int i;
> +
> +		igt_fork(child, 1) {
> +			igt_drop_root();
> +
> +			do_ioctl(non_master_fd, DRM_IOCTL_MODE_GETFB2, &get);
> +			/* ioctl succeeds but handles should be 0 */
> +			for (i =3D 0; i < ARRAY_SIZE(get.handles); i++) {
> +				igt_assert_eq_u32(get.handles[i], 0);
> +			}
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_fixture {
> +		do_ioctl(non_master_fd, DRM_IOCTL_MODE_RMFB, &non_master_add.fb_id);
> +		gem_close(non_master_fd, non_master_add.handles[0]);
> +	}
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -243,6 +397,12 @@ igt_main
>  	igt_subtest_group
>  		test_duplicate_handles(fd);
>  =

> +	igt_subtest_group
> +		test_getfb2(fd);
> +
> +	igt_subtest_group
> +		test_handle_protection();
> +
>  	igt_fixture
>  		close(fd);
>  }
> -- =

> 2.21.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
