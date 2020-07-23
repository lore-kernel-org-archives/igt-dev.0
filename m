Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B1A6E1E0
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2020 12:14:18 +0000 (UTC)
Date: Thu, 23 Jul 2020 15:14:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200723121414.GD6112@intel.com>
References: <20200722134758.26412-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722134758.26412-1-pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_big_fb: Use igt_assert on
 bufmgr
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
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 07:17:58PM +0530, Pankaj Bharadiya wrote:
> NULL bufmgr pointer leads to SIGSEGV. Assert on NULL bufmgr so that
> correct failure reason will get dumped in the stack trace.
> =

> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
> * changes since v1:
>  - Make the error message more helpful [Petri]
> =

>  tests/kms_big_fb.c | 5 +++++
>  1 file changed, 5 insertions(+)
> =

> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index a754b2997..48caa5cd1 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -607,6 +607,7 @@ igt_main
>  {
>  	igt_fixture {
>  		drmModeResPtr res;
> +		const struct intel_device_info *info;
>  =

>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
>  =

> @@ -649,6 +650,10 @@ igt_main
>  			data.render_copy =3D igt_get_render_copyfunc(data.devid);
>  =

>  		data.bufmgr =3D drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
> +		info =3D intel_get_device_info(data.devid);
> +		igt_assert_f(data.bufmgr, "Update libdrm for %s support\n",
> +			     info->gen ? info->codename : "<unknown chipset>");
> +

How many individual tests are you going to have to patch like this?
Would probably make more sense to plop this into some wrapper.

>  		data.batch =3D intel_batchbuffer_alloc(data.bufmgr, data.devid);
>  	}
>  =

> -- =

> 2.23.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
