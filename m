Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596516EE36
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Feb 2021 21:08:34 +0000 (UTC)
Date: Fri, 26 Feb 2021 13:14:06 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210226211405.GA27234@labuser-Z97X-UD5H>
References: <20210226182645.30025-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210226182645.30025-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_vrr: Optimize to read vrr
 debugfs
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanu,

This series is incomplete, can you send this together with the extend VRR r=
ange patch:
https://patchwork.freedesktop.org/series/87273/

Manasi

On Fri, Feb 26, 2021 at 11:56:45PM +0530, Bhanuprakash Modem wrote:
> Instead of reading the vrr_range debugfs for every refresh rate,
> read at strting of the test and preserve the data for entire
> subtest.
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> =

> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index e4ea74c17..bc4201615 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -51,6 +51,7 @@ typedef struct data {
>  	igt_plane_t *primary;
>  	igt_fb_t fb0;
>  	igt_fb_t fb1;
> +	range_t range;
>  } data_t;
>  =

>  typedef struct vtest_ns {
> @@ -116,13 +117,13 @@ static uint64_t rate_from_refresh(uint64_t refresh)
>   *  - if max range is grater than the current mode vfreq, consider
>   *       current mode vfreq as the max range.
>   */
> -static range_t get_vrr_range(data_t *data, igt_output_t *output)
> +static range_t
> +get_vrr_range(data_t *data, igt_output_t *output, uint32_t curr_vrefresh)
>  {
>  	char buf[256];
>  	char *start_loc;
>  	int fd, res;
>  	range_t range;
> -	drmModeModeInfo *mode =3D igt_output_get_mode(output);
>  =

>  	fd =3D igt_debugfs_connector_dir(data->drm_fd, output->name, O_RDONLY);
>  	igt_assert(fd >=3D 0);
> @@ -134,23 +135,21 @@ static range_t get_vrr_range(data_t *data, igt_outp=
ut_t *output)
>  =

>  	igt_assert(start_loc =3D strstr(buf, "Min: "));
>  	igt_assert_eq(sscanf(start_loc, "Min: %u", &range.min), 1);
> -	igt_require(mode->vrefresh > range.min);
> +	igt_require(curr_vrefresh > range.min);
>  =

>  	igt_assert(start_loc =3D strstr(buf, "Max: "));
>  	igt_assert_eq(sscanf(start_loc, "Max: %u", &range.max), 1);
>  =

> -	range.max =3D (mode->vrefresh < range.max) ? mode->vrefresh : range.max;
> +	range.max =3D (curr_vrefresh < range.max) ? curr_vrefresh : range.max;
>  =

>  	return range;
>  }
>  =

>  /* Returns vrr test frequency for min, mid & max range. */
> -static vtest_ns_t get_test_rate_ns(data_t *data, igt_output_t *output)
> +static vtest_ns_t get_test_rate_ns(range_t range)
>  {
> -	range_t range;
>  	vtest_ns_t vtest_ns;
>  =

> -	range =3D get_vrr_range(data, output);
>  	vtest_ns.min =3D rate_from_refresh(range.min);
>  	vtest_ns.mid =3D rate_from_refresh(((range.max + range.min) / 2));
>  	vtest_ns.max =3D rate_from_refresh(range.max);
> @@ -199,6 +198,9 @@ static void prepare_test(data_t *data, igt_output_t *=
output, enum pipe pipe)
>  =

>  	igt_put_cairo_ctx(cr);
>  =

> +	/* Capture VRR range */
> +	data->range =3D get_vrr_range(data, output, mode.vrefresh);
> +
>  	/* Take care of any required modesetting before the test begins. */
>  	data->primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
>  	igt_plane_set_fb(data->primary, &data->fb0);
> @@ -248,7 +250,7 @@ flip_and_measure(data_t *data, igt_output_t *output, =
enum pipe pipe,
>  	uint64_t start_ns, last_event_ns, target_ns;
>  	uint32_t total_flip =3D 0, total_pass =3D 0;
>  	bool front =3D false;
> -	vtest_ns_t vtest_ns =3D get_test_rate_ns(data, output);
> +	vtest_ns_t vtest_ns =3D get_test_rate_ns(data->range);
>  =

>  	/* Align with the flip completion event to speed up convergence. */
>  	do_flip(data, &data->fb0);
> @@ -316,15 +318,18 @@ static void
>  test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t =
flags)
>  {
>  	uint32_t result;
> -	vtest_ns_t vtest_ns =3D get_test_rate_ns(data, output);
> -	range_t range =3D get_vrr_range(data, output);
> -	uint64_t rate =3D vtest_ns.mid;
> +	vtest_ns_t vtest_ns;
> +	range_t range;
> +	uint64_t rate;
> +
> +	prepare_test(data, output, pipe);
> +	range =3D data->range;
> +	vtest_ns =3D get_test_rate_ns(range);
> +	rate =3D vtest_ns.mid;
>  =

>  	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\=
n",
>  		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
>  =

> -	prepare_test(data, output, pipe);
> -
>  	set_vrr_on_pipe(data, pipe, 1);
>  =

>  	/*
> -- =

> 2.20.1
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
