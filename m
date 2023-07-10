Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58A210E2AB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 17:17:29 +0000 (UTC)
Message-ID: <5aca6f5f-a861-3d17-18b6-c680b03514eb@amd.com>
Date: Mon, 10 Jul 2023 11:17:24 -0600
Content-Language: en-US
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
References: <20230710075749.2377896-1-chiahsuan.chung@amd.com>
 <20230710075749.2377896-5-chiahsuan.chung@amd.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20230710075749.2377896-5-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t,
 v4 4/8] tests/amdgpu/amd_freesync_video_mode: Add some code from
 kms_vrr to resolve tearing issue
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2023-07-10 01:57, Tom Chung wrote:
> [Why]
> There is a tearing video issue during the stage-2 animation test.
> 
> [How]
> 1. Refer to the kms_vrr IGT code, it needs some delay before the the next flip and
>     add some warmup time before do the flip and measure to make the test more accurate.
> 2. Change the target refresh rate percentage to 75% to align with the kms_vrr test.
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
>   tests/amdgpu/amd_freesync_video_mode.c | 22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
> index 29ba1f65c..0927f4307 100644
> --- a/tests/amdgpu/amd_freesync_video_mode.c
> +++ b/tests/amdgpu/amd_freesync_video_mode.c
> @@ -26,7 +26,7 @@
>   #include <signal.h>
>   
>   #define NSECS_PER_SEC		(1000000000ull)
> -#define TEST_DURATION_NS	(10 * NSECS_PER_SEC)
> +#define TEST_DURATION_NS	(8 * NSECS_PER_SEC)
>   
>   #define BYTES_PER_PIXEL         4
>   #define MK_COLOR(r, g, b)	((0 << 24) | (r << 16) | (g << 8) | b)
> @@ -638,7 +638,7 @@ flip_and_measure(
>   	igt_info("interval_ns=%lu\n", interval_ns);
>   
>   	for (;;) {
> -		uint64_t event_ns;
> +		uint64_t event_ns, wait_ns;
>   		int64_t diff_ns;
>   
>   		data->front = !data->front;
> @@ -673,6 +673,19 @@ flip_and_measure(
>   
>   		if (event_ns - start_ns > duration_ns)
>   			break;
> +
> +		/*
> +		 * Burn CPU until next timestamp, sleeping isn't accurate enough.
> +		 * The target timestamp is based on the delta b/w event timestamps
> +		 * and whatever the time left to reach the expected refresh rate.
> +		 */
> +		diff_ns = event_ns - target_ns;
> +		wait_ns = ((diff_ns + interval_ns - 1) / interval_ns) * interval_ns;
> +		wait_ns -= diff_ns;
> +		target_ns = event_ns + wait_ns;
> +
> +		while (get_time_ns() < target_ns - 10)
> +			;
>   	}
>   
>   	igt_info("Completed %u flips, %u were in threshold for (%llu Hz) %"PRIu64"ns.\n",
> @@ -808,9 +821,10 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
>   	igt_info("stage-2: simple animation as video playback\n");
>   	prepare_test(data, output, pipe, mode_playback);
>   	interval = nsec_per_frame(mode_playback->vrefresh);
> +	/* Do a short run with VRR before measure to make sure we measure in a stable state */
> +	result = flip_and_measure(data, output, pipe, interval, 2 * NSECS_PER_SEC, ANIM_TYPE_CIRCLE_WAVE);
>   	result = flip_and_measure(data, output, pipe, interval, TEST_DURATION_NS, ANIM_TYPE_CIRCLE_WAVE);
> -	igt_assert_f(result > 90, "Target refresh rate not meet(result=%d%%\n", result);
> -
> +	igt_assert_f(result > 75, "Target refresh rate not meet 75%% (result=%d%%\n", result);
>   	finish_test(data, pipe, output);
>   }
>   
