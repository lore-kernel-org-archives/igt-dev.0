Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BEE89DC0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2020 09:38:29 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Tue, 15 Sep 2020 09:38:27 +0000
Message-ID: <a49e4bdd292a4bcfa9f25f295f7dca71@intel.com>
References: <20200914141645.17024-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200914141645.17024-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_available_modes_crc: don't
 mix hdr and sdr planes
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-
> Pekka Heikkila
> Sent: Monday, September 14, 2020 5:17 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_available_modes_crc: don't mix hdr
> and sdr planes
> 
> Run test only on hdr planes as that's where crc to compare against is gotten
> from. Also reset display in beginning of test.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_available_modes_crc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_available_modes_crc.c
> b/tests/kms_available_modes_crc.c index 09785ed8..be9689e1 100644
> --- a/tests/kms_available_modes_crc.c
> +++ b/tests/kms_available_modes_crc.c
> @@ -43,7 +43,6 @@ typedef struct {
>  	bool separateprimaryplane;
> 
>  	uint32_t gem_handle;
> -	uint32_t gem_handle_yuv;
>  	unsigned int size;
>  	unsigned char* buf;
> 
> @@ -355,6 +354,8 @@ test_available_modes(data_t* data)
>  		uint16_t reserved;
>  	} *lut = NULL;
> 
> +	igt_display_reset(&data->display);
> +
>  	for_each_pipe_with_valid_output(&data->display, pipe, output) {
>  		igt_output_set_pipe(output, pipe);
>  		igt_display_commit2(&data->display, data->commit); @@ -
> 397,7 +398,8 @@ test_available_modes(data_t* data)
>  			modePlane = drmModeGetPlane(data->gfx_fd,
>  						    plane->drm_plane-
> >plane_id);
> 
> -			if (plane->type == DRM_PLANE_TYPE_CURSOR)
> +			if (plane->type == DRM_PLANE_TYPE_CURSOR
> +			    || plane->index > 2)

Actually, this is a third IGT test that uses separation between HDR and SDR planes. We have a function is_sdr_plane() used in both kms_ccs.c and kms_plane_lowres.c tests. Maybe it is a time to make this is_hdr_plane() routine a library function? This way, if the SDR base index changes, we would need to change only one place. What do you think?

Cheers,
Mika
>  				continue;
> 
>  			for (modeindex = 0;
> --
> 2.26.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
