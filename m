Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2515F112C90
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jun 2022 09:42:52 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 2 Jun 2022 09:42:50 +0000
Message-ID: <90c91558731c434397bf82a1ef47e500@intel.com>
References: <20220601052834.26864-1-karthik.b.s@intel.com>
In-Reply-To: <20220601052834.26864-1-karthik.b.s@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/kms_big_fb: Move cleanup
 code to fixture
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

> -----Original Message-----
> From: B S, Karthik <karthik.b.s@intel.com>
> Sent: Wednesday, June 1, 2022 10:59 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t v2] tests/i915/kms_big_fb: Move cleanup code to
> fixture
>=20
> When a subtest fails, it exits from the assert and does not run the clean=
up
> part of the subtest. To avoid this, move the cleanup code to igt_fixture
> outside the subtest.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/i915/kms_big_fb.c | 46 ++++++++++++++++++-----------------------
>  1 file changed, 20 insertions(+), 26 deletions(-)
>=20
> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c index
> 91ad3b4d..abf974bb 100644
> --- a/tests/i915/kms_big_fb.c
> +++ b/tests/i915/kms_big_fb.c
> @@ -264,12 +264,6 @@ static void prep_fb(data_t *data)
>  	generate_pattern(data, &data->big_fb, 640, 480);  }
>=20
> -static void cleanup_fb(data_t *data)
> -{
> -	igt_remove_fb(data->drm_fd, &data->big_fb);
> -	data->big_fb.fb_id =3D 0;
> -}
> -
>  static void set_c8_lut(data_t *data)
>  {
>  	igt_pipe_t *pipe =3D &data->display.pipes[data->pipe]; @@ -463,14
> +457,6 @@ static bool test_pipe(data_t *data)
>  	if (data->format =3D=3D DRM_FORMAT_C8)
>  		unset_lut(data);
>=20
> -	igt_pipe_crc_free(data->pipe_crc);
> -
> -	igt_output_set_pipe(data->output, PIPE_ANY);
> -
> -	igt_remove_fb(data->drm_fd, &data->small_fb);
> -
> -	intel_bb_destroy(data->ibb);
> -
>  	return ret;
>  }
>=20
> @@ -563,14 +549,6 @@ max_hw_stride_async_flip_test(data_t *data)
>  	}
>  	igt_reset_timeout();
>=20
> -	igt_pipe_crc_free(data->pipe_crc);
> -	igt_output_set_pipe(data->output, PIPE_NONE);
> -	igt_remove_fb(data->drm_fd, &data->big_fb);
> -	igt_remove_fb(data->drm_fd, &data->big_fb_flip[0]);
> -	igt_remove_fb(data->drm_fd, &data->big_fb_flip[1]);
> -
> -	intel_bb_destroy(data->ibb);
> -
>  	return true;
>  }
>=20
> @@ -773,6 +751,22 @@ set_max_hw_stride(data_t *data)
>  	}
>  }
>=20
> +static void test_cleanup(data_t *data)
> +{
> +	if (!data->output)
> +		return;
> +
> +	igt_pipe_crc_free(data->pipe_crc);
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_remove_fb(data->drm_fd, &data->big_fb);
> +	igt_remove_fb(data->drm_fd, &data->big_fb_flip[0]);
> +	igt_remove_fb(data->drm_fd, &data->big_fb_flip[1]);
> +	igt_remove_fb(data->drm_fd, &data->small_fb);
> +
> +	intel_bb_destroy(data->ibb);
> +	data->output =3D NULL;
> +}
> +
>  static data_t data =3D {};
>=20
>  static const struct {
> @@ -918,7 +912,7 @@ igt_main
>  			}
>=20
>  			igt_fixture
> -				cleanup_fb(&data);
> +				test_cleanup(&data);
>  		}
>  	}
>=20
> @@ -972,10 +966,10 @@ igt_main
>  							test_scanout(&data);
>  					}
>  					data.async_flip_test =3D false;
> -				}
>=20
> -				igt_fixture
> -					cleanup_fb(&data);
> +					igt_fixture
> +						test_cleanup(&data);
> +				}
>  			}
>  		}
>  	}
> --
> 2.22.0
