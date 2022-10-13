Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E32810E225
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 18:18:18 +0000 (UTC)
Message-ID: <ac3ce594-2c9e-7a50-d676-d20e0c1f7b0d@amd.com>
Date: Thu, 13 Oct 2022 14:18:14 -0400
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20221011185354.2268148-1-alex.hung@amd.com>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20221011185354.2268148-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH][V4] tests/kms_plane_multiple: turn off pipe
 if all planes are off
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: michel.daenzer@mailbox.org, lakshminarayana.vudum@intel.com,
 markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-10-11 14:53, Alex Hung wrote:
> amdgpu rejects when crtc is on + all planes are off, and it
> is necessary to turn off crtc when all planes are off in the
> subtest "tiling-none".
> 
> This is revised from https://patchwork.freedesktop.org/series/80904/
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/kms_plane_multiple.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index e958fc78..637d63f0 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -311,6 +311,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>   		for_each_plane_on_pipe(&data->display, pipe, plane)
>   			igt_plane_set_fb(plane, NULL);
>   
> +		igt_output_set_pipe(output, PIPE_NONE);
>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   		for (int x = 0; x < c; x++)
> @@ -326,16 +327,12 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>   
>   	i = 0;
>   	while (i < iterations || loop_forever) {
> -		/* Intel devices need it here, timing sensitive on few devices */
> -		if (is_i915_device(data->drm_fd))
> -			igt_pipe_crc_start(data->pipe_crc);
>   
>   		/* randomize planes and set up the holes */
>   		prepare_planes(data, pipe, &blue, modifier, c, output);
>   
>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -		if (!is_i915_device(data->drm_fd))
> -			igt_pipe_crc_start(data->pipe_crc);
> +		igt_pipe_crc_start(data->pipe_crc);
>   
>   		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, &crc);
>   		igt_assert_crc_equal(&data->ref_crc, &crc);
> @@ -344,6 +341,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>   		for_each_plane_on_pipe(&data->display, pipe, plane)
>   			igt_plane_set_fb(plane, NULL);
>   
> +		igt_output_set_pipe(output, PIPE_NONE);
>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   		for (int x = 0; x < c; x++)

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
