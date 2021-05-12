Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FF76E02D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 05:40:08 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Wed, 12 May 2021 05:38:22 +0000
Message-ID: <SN6PR11MB332709E0AA5CEBE123BE34738D529@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20210511103445.7383-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210511103445.7383-1-venkata.sai.patnana@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/kms_plane: Restrict the test
 execution to two pipes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Patnana, Venkata Sai" <venkata.sai.patnana@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

> From: Patnana, Venkata Sai <venkata.sai.patnana@intel.com>
> Sent: Tuesday, May 11, 2021 4:05 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>; Patnana, Venkata Sai <venkata.sai.patnana@intel.com>;
> Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Latvala, Petri
> <petri.latvala@intel.com>
> Subject: [PATCH i-g-t v5] tests/kms_plane: Restrict the test execution to two
> pipes
> 
> From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> 
> v2: Moved to igt tests to dynamic (petri)
> v3: Implemented clamping in the tests directly
>     with an open-coded counting (petri)
> v4: Updated subtest names as suggested(petri)
>     Updated Help string (Bhanu)
> v5: Updated subtests names as suggested and
>     addressed other review comments. (Bhanu)
> 
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Modem Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>  tests/kms_plane.c | 132 +++++++++++++++++++++++++++++++++-------------
>  1 file changed, 96 insertions(+), 36 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 9fe253a8c3..3511efa760 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -39,6 +39,9 @@
>   */
>  #define LUT_MASK 0xf800
> 
> +/* restricted pipe count */
> +#define CRTC_RESTRICT_CNT 2
> +
>  typedef struct {
>  	float red;
>  	float green;
> @@ -60,6 +63,8 @@ typedef struct {
>  	bool extended;
>  } data_t;
> 
> +static bool all_pipes;
> +
>  static color_t red   = { 1.0f, 0.0f, 0.0f };
>  static color_t green = { 0.0f, 1.0f, 0.0f };
>  static color_t blue  = { 0.0f, 0.0f, 1.0f };
> @@ -1057,62 +1062,115 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  	igt_assert_f(result, "At least one CRC mismatch happened\n");
>  }
> 
> +static bool is_pipe_limit_reached(int count) {
> +	return count >= CRTC_RESTRICT_CNT && !all_pipes;
> +}
> +
>  static void
> -run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
> +run_tests_for_pipe_plane(data_t *data)
>  {
> +	enum pipe pipe;
> +	int count;
>  	igt_fixture {
>  		igt_require_pipe(&data->display, pipe);
>  		igt_require(data->display.pipes[pipe].n_planes > 0);
>  	}
> 
>  	igt_describe("verify the pixel formats for given plane and pipe");
> -	igt_subtest_f("pixel-format-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_pixel_formats(data, pipe);
> -
> +	igt_subtest_with_dynamic_f("pixel-format") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
> +				test_pixel_formats(data, pipe);
> +			if (is_pipe_limit_reached(++count))
> +				break;
> +		}
> +	}
>  	igt_describe("verify the pixel formats for given plane and pipe with
> source clamping");
> -	igt_subtest_f("pixel-format-pipe-%s-planes-source-clamping",
> -		      kmstest_pipe_name(pipe)) {
> -		data->crop = 4;
> -		test_pixel_formats(data, pipe);
> +	igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe)) {
> +				data->crop = 4;
> +				test_pixel_formats(data, pipe);
> +			}
> +			if (is_pipe_limit_reached(++count))
> +				break;
> +		}
>  	}
> 
>  	data->crop = 0;
>  	igt_describe("verify plane position using two planes to create a fully
> covered screen");
> -	igt_subtest_f("plane-position-covered-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_position(data, pipe, 0);
> +	igt_subtest_with_dynamic_f("plane-position-covered") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
> +				test_plane_position(data, pipe, 0);
> +			if (is_pipe_limit_reached(++count))
> +				break;
> +		}
> +	}
> 
>  	igt_describe("verify plane position using two planes to create a
> partially covered screen");
> -	igt_subtest_f("plane-position-hole-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_position(data, pipe,
> -				    TEST_POSITION_PARTIALLY_COVERED);
> +	igt_subtest_with_dynamic_f("plane-position-hole") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
> +				test_plane_position(data, pipe,
> +				TEST_POSITION_PARTIALLY_COVERED);
> +			if (is_pipe_limit_reached(++count))
> +				break;
> +		}
> +	}
> 
>  	igt_describe("verify plane position using two planes to create a
> partially covered screen and"
>  		       "check for DPMS");
> -	igt_subtest_f("plane-position-hole-dpms-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_position(data, pipe,
> -				    TEST_POSITION_PARTIALLY_COVERED |
> -				    TEST_DPMS);
> +	igt_subtest_with_dynamic_f("plane-position-hole-dpms") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
> +				test_plane_position(data, pipe,
> +				TEST_POSITION_PARTIALLY_COVERED | TEST_DPMS);
> +			if (is_pipe_limit_reached(++count))
> +				break;
> +		}
> +	}
> 
>  	igt_describe("verify plane panning at top-left position using primary
> plane");
> -	igt_subtest_f("plane-panning-top-left-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_panning(data, pipe, TEST_PANNING_TOP_LEFT);
> +	igt_subtest_with_dynamic_f("plane-panning-top-left") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
> +				test_plane_panning(data, pipe, TEST_PANNING_TOP_LEFT);
> +			if (is_pipe_limit_reached(++count))
> +				break;
> +		}
> +	}
> 
>  	igt_describe("verify plane panning at bottom-right position using
> primary plane");
> -	igt_subtest_f("plane-panning-bottom-right-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT);
> +	igt_subtest_with_dynamic_f("plane-panning-bottom-right") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
> +				test_plane_panning(data, pipe,
> TEST_PANNING_BOTTOM_RIGHT);
> +			if (is_pipe_limit_reached(++count))
> +				break;
> +		}
> +	}
> 
>  	igt_describe("verify plane panning at bottom-right position using
> primary plane and executes system"
>  		       "suspend cycles");
> -	igt_subtest_f("plane-panning-bottom-right-suspend-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT |
> -					       TEST_SUSPEND_RESUME);
> +	igt_subtest_with_dynamic_f("plane-panning-bottom-right-suspend") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
> +				test_plane_panning(data, pipe,
> +				TEST_PANNING_BOTTOM_RIGHT |
> +				TEST_SUSPEND_RESUME);
> +			if (is_pipe_limit_reached(++count))
> +				break;
> +		}
> +	}
>  }
> 
>  static int opt_handler(int opt, int opt_index, void *_data)
> @@ -1123,6 +1181,9 @@ static int opt_handler(int opt, int opt_index, void
> *_data)
>  	case 'e':
>  		data->extended = true;
>  		break;
> +	case 'p':
> +		all_pipes = true;
> +		break;
>  	}
> 
>  	return IGT_OPT_HANDLER_SUCCESS;
> @@ -1130,18 +1191,18 @@ static int opt_handler(int opt, int opt_index, void
> *_data)
> 
>  static const struct option long_opts[] = {
>  	{ .name = "extended", .has_arg = false, .val = 'e', },
> +	{ .name = "all-pipes", .has_arg = false, .val = 'p', },
>  	{}
>  };
> 
>  static const char help_str[] =
> -	"  --extended\t\tRun the extended tests\n";
> +	"  --extended\t\tRun the extended tests\n"
> +	"  --all-pipes\t\tRun on all pipes.(Default it will Run only two
> pipes)\n";
> 
>  static data_t data;
> 
>  igt_main_args("", long_opts, help_str, opt_handler, &data)
>  {
> -	enum pipe pipe;
> -
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> 
> @@ -1151,8 +1212,7 @@ igt_main_args("", long_opts, help_str, opt_handler,
> &data)
>  		igt_display_require(&data.display, data.drm_fd);
>  	}
> 
> -	for_each_pipe_static(pipe)
> -		run_tests_for_pipe_plane(&data, pipe);
> +	run_tests_for_pipe_plane(&data);

LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
 
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> --
> 2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
