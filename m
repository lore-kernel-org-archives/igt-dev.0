Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D0E10E57A
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 22:48:03 +0000 (UTC)
Date: Mon, 7 Nov 2022 21:47:49 -0100
From: Melissa Wen <mwen@igalia.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20221107224749.ldeba3ztjdvff7iw@mail.igalia.com>
References: <20221102110428.4049549-1-bhanuprakash.modem@intel.com>
 <20221104020005.4098049-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221104020005.4098049-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [V2 i-g-t] tests/kms_cursor_crc: Fix SIGABRT in
 dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 11/04, Bhanuprakash Modem wrote:
> All subtests must report success/fail instead of crashing out.
>=20
> V2:
> - Fix the coverage of max-size tests
>=20
> Fixes: 9494d53d ("tests/kms_cursor_crc: Convert tests to dynamic")
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Alaa Emad <aemad@igalia.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_cursor_crc.c | 128 ++++++++++++++++++++++-------------------
>  1 file changed, 68 insertions(+), 60 deletions(-)
>=20
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index d51c1f90..68bed666 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -700,65 +700,78 @@ static void test_rapid_movement(data_t *data)
>  	igt_assert_lt(usec, 0.9 * 400 * 1000000 / data->refresh);
>  }
> =20
> -static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
> -			   int w, int h)
> +static void run_size_tests(data_t *data, int w, int h)
>  {
>  	enum pipe pipe;
> +	struct {
> +		const char *name;
> +		void (*testfunc)(data_t *);
> +		const char *desc;
> +	} size_tests[] =3D {
> +		{ "cursor-onscreen", test_crc_onscreen,
> +			"Check if a given-size cursor is well-positioned inside the screen." =
},
> +		{ "cursor-offscreen", test_crc_offscreen,
> +			"Check if a given-size cursor is well-positioned outside the screen."=
 },
> +		{ "cursor-sliding", test_crc_sliding,
> +			"Check the smooth and pixel-by-pixel given-size cursor movements on h=
orizontal, vertical and diagonal." },
> +		{ "cursor-random", test_crc_random,
> +			"Check random placement of a cursor with given size." },
> +		{ "cursor-rapid-movement", test_rapid_movement,
> +			"Check the rapid update of given-size cursor movements." },
> +	};
> +	int i;
> +	char name[16];
> =20
>  	if (w =3D=3D 0 && h =3D=3D 0) {
>  		w =3D data->cursor_max_w;
>  		h =3D data->cursor_max_h;
> =20
> -		/*
> -		 * No point in doing the "max-size" test if
> -		 * it was already covered by the other tests.
> -		 */
> -		if ((w =3D=3D h) && (w <=3D 512) && (h <=3D 512) &&
> -		    is_power_of_two(w) && is_power_of_two(h)) {
> -			igt_info("Cursor max size %dx%d already covered by other tests\n", w,=
 h);
> -			return;
> -		}
> +		strcpy(name, "max-size");
> +	} else {
> +		snprintf(name, sizeof(name), "%dx%d", w, h);
>  	}
> =20
> -	create_cursor_fb(data, w, h);
> -	if (require_cursor_size(data, w, h)) {
> -		igt_info("Cursor size %dx%d not supported by driver\n", w, h);
> +	igt_fixture
> +		create_cursor_fb(data, w, h);
> =20
> -		igt_remove_fb(data->drm_fd, &data->fb);
> -		return;
> -	}
> +	for (i =3D 0; i < ARRAY_SIZE(size_tests); i++) {
> +		igt_describe(size_tests[i].desc);
> +		igt_subtest_with_dynamic_f("%s-%s", size_tests[i].name, name) {
> +			if (!strcmp(name, "max-size")) {
> +				/*
> +				 * No point in doing the "max-size" test if
> +				 * it was already covered by the other tests.
> +				 */
> +				if ((w =3D=3D h) && (w <=3D 512) && (h <=3D 512) &&
> +				    is_power_of_two(w) && is_power_of_two(h)) {
> +					igt_info("Cursor max size %dx%d already covered by other tests\n", =
w, h);
> +					continue;
> +				}
> +			}
> +
> +			for_each_pipe(&data->display, pipe) {
> +				data->pipe =3D pipe;
> =20
> -	for_each_pipe(&data->display, pipe) {
> -		data->pipe =3D pipe;
> -		igt_dynamic_f("pipe-%s-%s",
> -			      kmstest_pipe_name(pipe), igt_output_name(data->output))
> -			run_test(data, testfunc, w, h);
> +				if (require_cursor_size(data, w, h)) {
I think here we want `!require_cursor_size()` (not require_cursor_size),
since zero means success for drmModeAtomicCommit(), that is used to
check if the cursor size is accepted or not.
> +					igt_info("Cursor size %dx%d not supported by driver\n", w, h);
> +					continue;
> +				}
> +
> +				igt_dynamic_f("pipe-%s-%s",
> +					      kmstest_pipe_name(pipe), igt_output_name(data->output))
> +					run_test(data, size_tests[i].testfunc, w, h);
> +			}
> +		}
>  	}
> =20
> -	igt_remove_fb(data->drm_fd, &data->fb);
> +	igt_fixture
> +		igt_remove_fb(data->drm_fd, &data->fb);
>  }
> =20
>  static void run_tests_on_pipe(data_t *data)
>  {
>  	enum pipe pipe;
>  	int cursor_size;
> -	int i;
> -	struct {
> -		const char *name;
> -		void (*testfunc)(data_t *);
> -		const char *desc;
> -	} size_tests[] =3D {
> -		{ "cursor-onscreen", test_crc_onscreen,
> -			"Check if a given-size cursor is well-positioned inside the screen." =
},
> -		{ "cursor-offscreen", test_crc_offscreen,
> -			"Check if a given-size cursor is well-positioned outside the screen."=
 },
> -		{ "cursor-sliding", test_crc_sliding,
> -			"Check the smooth and pixel-by-pixel given-size cursor movements on h=
orizontal, vertical and diagonal." },
> -		{ "cursor-random", test_crc_random,
> -			"Check random placement of a cursor with given size." },
> -		{ "cursor-rapid-movement", test_rapid_movement,
> -			"Check the rapid update of given-size cursor movements." },
> -	};
> =20
>  	igt_fixture {
>  		data->output =3D igt_get_single_output_for_pipe(&data->display, pipe);
> @@ -859,30 +872,25 @@ static void run_tests_on_pipe(data_t *data)
>  	igt_fixture
>  		igt_remove_fb(data->drm_fd, &data->fb);
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(size_tests); i++) {
> -		igt_describe(size_tests[i].desc);
> -		igt_subtest_group {
> -			for (cursor_size =3D 32; cursor_size <=3D 512; cursor_size *=3D 2) {
> -				int w =3D cursor_size;
> -				int h =3D cursor_size;
> +	for (cursor_size =3D 32; cursor_size <=3D 512; cursor_size *=3D 2) {
> +		int w =3D cursor_size;
> +		int h =3D cursor_size;
> =20
> -				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
> -					run_size_tests(data, size_tests[i].testfunc, w, h);
> +		igt_subtest_group
> +			run_size_tests(data, w, h);
> =20
> -				/*
> -				 * Test non-square cursors a bit on the platforms
> -				 * that support such things. And make it a bit more
> -				 * interesting by using a non-pot height.
> -				 */
> -				h /=3D 3;
> -				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
> -					run_size_tests(data, size_tests[i].testfunc, w, h);
> -			}
> +		/*
> +		 * Test non-square cursors a bit on the platforms
> +		 * that support such things. And make it a bit more
> +		 * interesting by using a non-pot height.
> +		 */
> +		h /=3D 3;
> =20
> -			igt_subtest_with_dynamic_f("%s-max-size", size_tests[i].name)
> -				run_size_tests(data, size_tests[i].testfunc, 0, 0);
> -		}
> +		igt_subtest_group
> +			run_size_tests(data, w, h);
>  	}
> +
> +	run_size_tests(data, 0, 0);
>  }
> =20
>  static data_t data;
> --=20
> 2.38.0
>=20
