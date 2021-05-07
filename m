Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6F76E03B
 for <igt-dev@lists.freedesktop.org>; Fri,  7 May 2021 09:58:03 +0000 (UTC)
Date: Fri, 7 May 2021 12:59:24 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YJUPfMtfmnug2vhU@platvala-desk.ger.corp.intel.com>
References: <20210506152542.26856-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506152542.26856-1-venkata.sai.patnana@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_plane: Restrict the test
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
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 06, 2021 at 08:55:42PM +0530, venkata.sai.patnana@intel.com wrote:
> From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> 
> v2: Moved to igt tests to dynamic (petri)
> v3: Implemented clamping in the tests directly
>     with an open-coded counting (petri)
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Modem Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>  tests/kms_plane.c | 131 +++++++++++++++++++++++++++++++++-------------
>  1 file changed, 95 insertions(+), 36 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 9fe253a8c3..a0d99e3f57 100644
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
> @@ -58,6 +61,7 @@ typedef struct {
>  	int num_colors;
>  	uint32_t crop;
>  	bool extended;
> +	bool all_pipes;
>  } data_t;
>  
>  static color_t red   = { 1.0f, 0.0f, 0.0f };
> @@ -1057,62 +1061,115 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  	igt_assert_f(result, "At least one CRC mismatch happened\n");
>  }
>  
> +static bool is_pipe_limit_reached(int count, bool all_pipes) {
> +	return count == CRTC_RESTRICT_CNT && !all_pipes;
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
> +	igt_subtest_with_dynamic_f("pixel-format-pipe-planes") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> +				test_pixel_formats(data, pipe);
> +			if (is_pipe_limit_reached(++count, data->all_pipes))
> +				break;
> +		}
> +	}
>  	igt_describe("verify the pixel formats for given plane and pipe with source clamping");
> -	igt_subtest_f("pixel-format-pipe-%s-planes-source-clamping",
> -		      kmstest_pipe_name(pipe)) {
> -		data->crop = 4;
> -		test_pixel_formats(data, pipe);
> +	igt_subtest_with_dynamic_f("pixel-format-pipe-planes-source-clamping") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> +				data->crop = 4;
> +				test_pixel_formats(data, pipe);
> +			}
> +			if (is_pipe_limit_reached(++count, data->all_pipes))
> +				break;
> +		}
>  	}
>  
>  	data->crop = 0;
>  	igt_describe("verify plane position using two planes to create a fully covered screen");
> -	igt_subtest_f("plane-position-covered-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_position(data, pipe, 0);
> +	igt_subtest_with_dynamic_f("plane-position-covered-pipe-planes") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> +				test_plane_position(data, pipe, 0);
> +			if (is_pipe_limit_reached(++count, data->all_pipes))
> +				break;
> +		}
> +	}
>  
>  	igt_describe("verify plane position using two planes to create a partially covered screen");
> -	igt_subtest_f("plane-position-hole-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_position(data, pipe,
> -				    TEST_POSITION_PARTIALLY_COVERED);
> +	igt_subtest_with_dynamic_f("plane-position-hole-pipe-planes") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> +				test_plane_position(data, pipe,
> +				TEST_POSITION_PARTIALLY_COVERED);
> +			if (is_pipe_limit_reached(++count, data->all_pipes))
> +				break;
> +		}
> +	}
>  
>  	igt_describe("verify plane position using two planes to create a partially covered screen and"
>  		       "check for DPMS");
> -	igt_subtest_f("plane-position-hole-dpms-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_position(data, pipe,
> -				    TEST_POSITION_PARTIALLY_COVERED |
> -				    TEST_DPMS);
> +	igt_subtest_with_dynamic_f("plane-position-hole-dpms-pipe-planes") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> +				test_plane_position(data, pipe,
> +				TEST_POSITION_PARTIALLY_COVERED | TEST_DPMS);
> +			if (is_pipe_limit_reached(++count, data->all_pipes))
> +				break;
> +		}
> +	}
>  
>  	igt_describe("verify plane panning at top-left position using primary plane");
> -	igt_subtest_f("plane-panning-top-left-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_panning(data, pipe, TEST_PANNING_TOP_LEFT);
> +	igt_subtest_with_dynamic_f("plane-panning-top-left-pipe-planes") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> +				test_plane_panning(data, pipe, TEST_PANNING_TOP_LEFT);
> +			if (is_pipe_limit_reached(++count, data->all_pipes))
> +				break;
> +		}
> +	}
>  
>  	igt_describe("verify plane panning at bottom-right position using primary plane");
> -	igt_subtest_f("plane-panning-bottom-right-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT);
> +	igt_subtest_with_dynamic_f("plane-panning-bottom-right-pipe-planes") {
> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> +				test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT);
> +			if (is_pipe_limit_reached(++count, data->all_pipes))
> +				break;
> +		}
> +	}
>  
>  	igt_describe("verify plane panning at bottom-right position using primary plane and executes system"
>  		       "suspend cycles");
> -	igt_subtest_f("plane-panning-bottom-right-suspend-pipe-%s-planes",
> -		      kmstest_pipe_name(pipe))
> -		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT |
> -					       TEST_SUSPEND_RESUME);
> +	igt_subtest_with_dynamic_f("plane-panning-bottom-right-suspend-pipe-planes") {

All these test renames go from "something-pipe-n-planes" to
"something-pipe-planes" removing just the pipe letter. Rename them all
to "something-planes" instead.

> +		count = 0;
> +		for_each_pipe(&data->display, pipe) {
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> +				test_plane_panning(data, pipe,
> +				TEST_PANNING_BOTTOM_RIGHT |
> +				TEST_SUSPEND_RESUME);
> +			if (is_pipe_limit_reached(++count, data->all_pipes))
> +				break;
> +		}
> +	}
>  }
>  
>  static int opt_handler(int opt, int opt_index, void *_data)
> @@ -1123,6 +1180,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
>  	case 'e':
>  		data->extended = true;
>  		break;
> +	case 'p':
> +		data->all_pipes = true;
> +		break;
>  	}
>  
>  	return IGT_OPT_HANDLER_SUCCESS;
> @@ -1130,18 +1190,18 @@ static int opt_handler(int opt, int opt_index, void *_data)
>  
>  static const struct option long_opts[] = {
>  	{ .name = "extended", .has_arg = false, .val = 'e', },
> +	{ .name = "all_pipes", .has_arg = false, .val = 'p', },
>  	{}
>  };
>  
>  static const char help_str[] =
> -	"  --extended\t\tRun the extended tests\n";
> +	"  --extended\t\tRun the extended tests\n"
> +	"  -e \t\tRun on all pipes. (Default it will Run only two pipes)\n";
>  
>  static data_t data;
>  
>  igt_main_args("", long_opts, help_str, opt_handler, &data)

The help text says -e (or -p as was already commented) but you don't
declare any short options.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
