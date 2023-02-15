Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA3E10E0C8
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 11:18:56 +0000 (UTC)
Message-ID: <6fc97dbb-be55-1807-6c26-36e35c472bf9@intel.com>
Date: Wed, 15 Feb 2023 16:48:17 +0530
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220808093622.193800-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220808093622.193800-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Add check on
 ENOSPC for DP MST config
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

Hi Thasleem,

On Mon-08-08-2022 03:06 pm, Mohammed Thasleem wrote:
> Added check on ENOSPC when two moniters connected through MST.
> This will find the connector mode combo that fits into the
> bandwidth when more than one monitor is connected.

Please elaborate the commit message.

> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_display_modes.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index e4191811..cbcdc0cc 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -44,6 +44,7 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
>   	igt_pipe_crc_t *pipe_crc[2] = { 0 };
>   	igt_crc_t ref_crc[2], crc[2];
>   	int count = 0, width, height;
> +	int ret;
>   	cairo_t *cr;
>   
>   	for_each_connected_output(display, output) {
> @@ -54,6 +55,7 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
>   			break;
>   	}
>   
> +restart:

Better to use s/restart/retry/

>   	igt_output_set_pipe(extended_output[0], pipe1);
>   	igt_output_set_pipe(extended_output[1], pipe2);

Please fix [1] the creation of new crc on retry.

[1]: 
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_display_modes.c#n63

>   
> @@ -79,7 +81,23 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
>   	igt_fb_set_size(&fbs[1], plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +	if (ret != 0 && errno == ENOSPC) {
> +

Please drop this new line.

> +		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
> +

Please drop this new line.

> +		igt_require_f(found, "No valid mode combo found.\n");
> +
> +		for_each_connected_output(display, output)
> +			igt_output_set_pipe(output, PIPE_NONE);
> +
> +		igt_remove_fb(data->drm_fd, &fbs[0]);
> +		igt_remove_fb(data->drm_fd, &fbs[1]);
> +
> +		goto restart;
> +	}
> +
> +	igt_assert(!ret);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc[0], &ref_crc[0]);
>   	igt_pipe_crc_collect_crc(pipe_crc[1], &ref_crc[1]);
> @@ -101,7 +119,6 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
>   	igt_plane_set_fb(plane[1], &fb);
>   	igt_fb_set_position(&fb, plane[1], mode[0]->hdisplay, 0);
>   	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
> -

Unrelated change, please drop it.

- Bhanu

>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]);
