Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A502B10E05D
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jun 2023 11:26:48 +0000 (UTC)
Message-ID: <14e7758e-0db0-97cc-c195-63c2a9ffb891@intel.com>
Date: Thu, 8 Jun 2023 16:56:26 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230607115333.55940-1-mohammed.thasleem@intel.com>
 <20230607115333.55940-2-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230607115333.55940-2-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_display_modes: Fixed
 mode selection for extended mode tests
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



On Wed-07-06-2023 05:23 pm, Mohammed Thasleem wrote:
> Added check on DP-MST and 4k panels when two moniters connected
> through MST.
> This will find the connector mode combo that fits into the
> bandwidth when more than one monitor is connected.
> 
> Example:
>    When two monitors connected through MST, the second monitor
>    also tries to use the same mode. So two such modes may not
>    fit into the link bandwidth. So, iterate through connected
>    outputs & modes and find a combination of modes those fit
>    into the link BW.
> 
> v2: -Updated commit msg and description. (Bhanu)
>      -Renamed restart with retry. (Bhanu)
>      -Moved igt_pipe_crc_new before retry. (Bhanu)
>      -Removed unrelated changes and new line. (Bhanu)
>      -Minor changes.
> v3: Updated discription and added EINVAL check.
> v4: Removed EINVAL and ENOSPC checks.
>      Added check for DP-MST and 4k panels.
>      Updated discription.
> v5: Defined 4k display modes globally.
> v6: -Removed if loop checks.
>      -Added igt override to avoid dp mst bw failure.
> v7: Rebased on tip.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_display_modes.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 93d91ef5..5108b4d4 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -142,6 +142,7 @@ static void run_extendedmode_basic(data_t *data,
>   	igt_pipe_crc_t *pipe_crc[2] = { 0 };
>   	igt_crc_t ref_crc[2], crc[2];
>   	int width, height;
> +	bool found;
>   	cairo_t *cr;
>   
>   	igt_display_reset(display);
> @@ -171,6 +172,10 @@ static void run_extendedmode_basic(data_t *data,
>   	igt_fb_set_size(&fbs[1], plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   
> +	/* In case of DP-MST find suitable mode(s) to fit into the link BW. */
> +	found = igt_override_all_active_output_modes_to_fit_bw(display);
> +	igt_require_f(found, "No valid mode combo found for MST modeset.\n");

This logic should be moved to the caller.

--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -273,6 +273,9 @@ static void run_extendedmode_test(data_t *data) {
           igt_output_set_pipe(output1, pipe1);
           igt_output_set_pipe(output2, pipe2);

+         if (!igt_override_all_active_output_modes_to_fit_bw(display))
+                 continue;
+
           if (!i915_pipe_output_combo_valid(display))
                   continue;

- Bhanu

> +
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc[0], &ref_crc[0]);
