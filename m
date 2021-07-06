Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD68E6E069
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jul 2021 12:45:30 +0000 (UTC)
Date: Tue, 6 Jul 2021 08:45:24 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210706124524.nr4t3qwoyu5kodfm@outlook.office365.com>
References: <20210628131435.1070725-1-Anson.Jacob@amd.com>
Content-Disposition: inline
In-Reply-To: <20210628131435.1070725-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t V2] tests/kms_plane_multiple: Start
 continuous CRC capture after commit
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
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>
Cc: igt-dev@lists.freedesktop.org, Anson Jacob <Anson.Jacob@amd.com>, Victor Lu <victorchengchi.lu@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 06/28, Anson Jacob wrote:
> From: Victor Lu <victorchengchi.lu@amd.com>
> 
> atomic-pipe-a-tiling-none fails on amdgpu(Raven) because it fails to read the
> CRC when there is no CRC generated (zeroed framebuffer). Move
> igt_pipe_crc_start to be called after the first nonzero FB commit.
> 
> Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
> Acked-by: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_plane_multiple.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 93c6ea7d269d..4424b864b2d6 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -288,6 +288,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>  	igt_plane_t *plane;
>  	int i;
>  	int err, c = 0;
> +	int crc_enabled = 0;
>  	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
>  	bool loop_forever;
>  	char info[256];
> @@ -327,14 +328,16 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>  		 igt_output_name(output), kmstest_pipe_name(pipe), c,
>  		 info, opt.seed);
>  
> -	igt_pipe_crc_start(data->pipe_crc);
> -
>  	i = 0;
>  	while (i < iterations || loop_forever) {
>  		/* randomize planes and set up the holes */
>  		prepare_planes(data, pipe, &blue, tiling, c, output);
>  
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +		if (!crc_enabled) {
> +			igt_pipe_crc_start(data->pipe_crc);
> +			crc_enabled = 1;
> +		}
>  
>  		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, &crc);
>  
> -- 
> 2.25.1
>

Hi Petri and Hiler,

I was looking at the failure log for this patch [1], and I did not find
any reference to a failure related to kms_plane_multiple, which makes me
think this is a false positive. In this case, is it worth resubmitting
the patch for CI?

1. https://patchwork.freedesktop.org/series/81857/ 

Thanks

-- 
Rodrigo Siqueira
https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
