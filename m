Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0484910E1D0
 for <igt-dev@lists.freedesktop.org>; Tue, 10 May 2022 10:49:55 +0000 (UTC)
Message-ID: <a25f8ea7-36f4-9017-97d9-5f3772f316e2@intel.com>
Date: Tue, 10 May 2022 16:19:51 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com
References: <20220411094147.1650859-1-bhanuprakash.modem@intel.com>
 <20220411094147.1650859-5-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220411094147.1650859-5-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V2 4/5] tests/kms_dither: Adopt to use updated
 debugfs functions
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

LGTM
Reviewed-by:
Swati Sharma <swati2.sharma@intel.com>

On 11-Apr-22 3:11 PM, Bhanuprakash Modem wrote:
> Instead of writing our own wrappers of debugfs read,
> use updated functions from lib.
> 
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_dither.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index 8e18dc83..21c1618a 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -99,14 +99,12 @@ static dither_status_t get_dither_state(data_t *data)
>   	igt_require(res > 0);
>   	close(dir);
>   
> -	igt_assert(start_loc = strstr(buf, ", bpp="));
> -	igt_assert_eq(sscanf(start_loc, ", bpp=%u", &status.bpc), 1);
> -	status.bpc /= 3;
> -
>   	igt_assert(start_loc = strstr(buf, ", dither="));
>   	igt_assert_eq(sscanf(start_loc, ", dither=%s", tmp), 1);
>   	status.dither = !strcmp(tmp, "yes,");
>   
> +	status.bpc = igt_get_pipe_current_bpc(data->drm_fd, data->pipe_id);
> +
>   	return status;
>   }
>   
> @@ -145,6 +143,11 @@ static void test_dithering(data_t *data, enum pipe pipe,
>   
>   	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> +	if (!igt_check_output_bpc_equal(data->drm_fd, pipe, output->name, output_bpc)) {
> +		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, bpc);
> +		igt_fail_on_f(true, "Failed to set max_bpc as: %d\n", output_bpc);
> +	}
> +
>   	/*
>   	 * Check the status of Dithering block:
>   	 *

-- 
~Swati Sharma
