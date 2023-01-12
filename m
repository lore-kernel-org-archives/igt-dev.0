Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6953610E0FC
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 12:36:54 +0000 (UTC)
Date: Thu, 12 Jan 2023 14:36:50 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Message-ID: <Y7/+4sEWGELI2unz@intel.com>
References: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: skip pipe on invalid
 connector in cursor size test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com,
 suresh.kumar.kurmi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 04:27:02PM +0530, Dnyaneshwar Bhadane wrote:
> Only the valid pipe connector combination reach to the igt commit.
> Cursor max-size test will not affect existing flow as only skip
> for invalid connector.
> For cursor-dpms and cursor-suspend not require to check require_cursor_size
> becuase the cursor height and width used from drm capablities.
> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> 
> ---
>  tests/kms_cursor_crc.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index d5a4b30b..4ab4c005 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -752,6 +752,13 @@ static void run_size_tests(data_t *data, int w, int h)
>  			for_each_pipe(&data->display, pipe) {
>  				data->pipe = pipe;
>  
> +				if(!igt_pipe_connector_valid(pipe, data->output)) {

Isn't there a for_each_something() that does all of that?

> +					igt_debug("Invalid connector on pipe-%s-%s\n",
> +						kmstest_pipe_name(pipe),
> +						data->output->name);
> +					continue;
> +				}
> +
>  				if (require_cursor_size(data, w, h)) {
>  					igt_info("Cursor size %dx%d not supported by driver\n", w, h);
>  					continue;
> @@ -854,9 +861,10 @@ static void run_tests_on_pipe(data_t *data)
>  			data->pipe = pipe;
>  			data->flags = TEST_DPMS;
>  
> -			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> -				igt_debug("Cursor size %dx%d not supported by driver\n",
> -					  data->cursor_max_w, data->cursor_max_h);
> +			if(!igt_pipe_connector_valid(pipe, data->output)) {
> +				igt_debug("Invalid connector on pipe-%s-%s\n",
> +					kmstest_pipe_name(pipe),
> +					data->output->name);
>  				continue;
>  			}
>  
> @@ -875,9 +883,10 @@ static void run_tests_on_pipe(data_t *data)
>  			data->pipe = pipe;
>  			data->flags = TEST_SUSPEND;
>  
> -			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> -				igt_debug("Cursor size %dx%d not supported by driver\n",
> -					  data->cursor_max_w, data->cursor_max_h);
> +			if(!igt_pipe_connector_valid(pipe, data->output)) {
> +				igt_debug("Invalid connector on pipe-%s-%s\n",
> +					kmstest_pipe_name(pipe),
> +					data->output->name);
>  				continue;
>  			}
>  
> -- 
> 2.35.1

-- 
Ville Syrjälä
Intel
