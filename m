Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E7410EBB9
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 08:27:36 +0000 (UTC)
Message-ID: <c8d43c4d-e054-14a5-97ca-8d00a65ccd72@intel.com>
Date: Fri, 30 Sep 2022 13:57:30 +0530
MIME-Version: 1.0
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com
References: <20220922160004.2041598-24-bhanuprakash.modem@intel.com>
 <20220928112015.2374165-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20220928112015.2374165-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V5 23/52] tests/kms_plane_alpha_blend: Add
 support for Bigjoiner
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
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 28-Sep-22 4:50 PM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
> 
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
> 
> V2: - Use updated helper name
> V3: - Rebase
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_plane_alpha_blend.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index f122066d..156005d5 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -171,9 +171,6 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
>   	int w, h;
>   	igt_plane_t *primary = igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY);
>   
> -	igt_display_reset(display);
> -	igt_output_set_pipe(output, pipe);
> -
>   	/* create the pipe_crc object for this pipe */
>   	igt_pipe_crc_free(data->pipe_crc);
>   	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
> @@ -616,6 +613,12 @@ static void run_subtests(data_t *data)
>   
>   		igt_subtest_with_dynamic(subtests[i].name) {
>   			for_each_pipe_with_single_output(&data->display, pipe, output) {
> +				igt_display_reset(&data->display);
> +
> +				igt_output_set_pipe(output, pipe);
> +				if (!i915_pipe_output_combo_valid(&data->display))
> +					continue;
> +
>   				prepare_crtc(data, output, pipe);
>   				if (!pipe_check(data, pipe, subtests[i].blend, subtests[i].must_multiply))
>   					continue;

-- 
~Swati Sharma
