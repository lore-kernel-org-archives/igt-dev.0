Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854CC6E09C
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 06:19:02 +0000 (UTC)
Message-ID: <86c6e003-689c-832e-42c3-2cfc89f21abe@intel.com>
Date: Fri, 8 Oct 2021 11:48:47 +0530
Content-Language: en-US
References: <20210916142301.17796-1-vidya.srinivas@intel.com>
 <20210924104545.23996-1-vidya.srinivas@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20210924104545.23996-1-vidya.srinivas@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Fix
 regression test_plane_position_with_output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Vidya Srinivas <vidya.srinivas@intel.com>, igt-dev@lists.freedesktop.org
Cc: Bhanuprakash.Modem@intel.com, markyacoub@google.com, victorchengchi.lu@amd.com, Anson.Jacob@amd.com, Rodrigo.Siqueira@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

On 9/24/2021 4:15 PM, Vidya Srinivas wrote:
> Starting commit 4d4a76729b328b65122 "Start continuous CRC capture after commit"
> few variants of Intel TGL and JSL devices are failing with CRC mismatch due to
> time sensitivity. Patch switches to older way of obtaining CRC, but keeps in-tact
> continuous CRC collection within the iteration and includes checking of
> i915 to not cause regression on non-intel devices.
>
> v2: Fixed review comments from Karthik.
>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_plane_multiple.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 45cabb500774..c11ff333ab0a 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -79,8 +79,6 @@ static void test_init(data_t *data, enum pipe pipe, int n_planes)
>   
>   static void test_fini(data_t *data, igt_output_t *output, int n_planes)
>   {
> -	igt_pipe_crc_stop(data->pipe_crc);
> -
>   	/* reset the constraint on the pipe */
>   	igt_output_set_pipe(output, PIPE_ANY);
>   
> @@ -291,7 +289,6 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>   	igt_plane_t *plane;
>   	int i;
>   	int err, c = 0;
> -	int crc_enabled = 0;
>   	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
>   	bool loop_forever;
>   	char info[256];
> @@ -334,15 +331,20 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>   	i = 0;
>   	while (i < iterations || loop_forever) {
>   		/* randomize planes and set up the holes */
> +
> +		/* Intel devices need it here, timing sensitive on few devices */
> +		if (is_i915_device(data->drm_fd))
> +			igt_pipe_crc_start(data->pipe_crc);
> +
>   		prepare_planes(data, pipe, &blue, tiling, c, output);
>   
>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -		if (!crc_enabled) {
> +		if (!is_i915_device(data->drm_fd))
>   			igt_pipe_crc_start(data->pipe_crc);
> -			crc_enabled = 1;
> -		}
>   
>   		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, &crc);
> +		igt_assert_crc_equal(&data->ref_crc, &crc);
> +		igt_pipe_crc_stop(data->pipe_crc);
>   
>   		for_each_plane_on_pipe(&data->display, pipe, plane)
>   			igt_plane_set_fb(plane, NULL);
> @@ -352,8 +354,6 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>   		for (int x = 0; x < c; x++)
>   			igt_remove_fb(data->drm_fd, &data->fb[x]);
>   
> -		igt_assert_crc_equal(&data->ref_crc, &crc);
> -
>   		i++;
>   	}
>   

