Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812766E21C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jan 2021 13:27:18 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Tue, 12 Jan 2021 13:26:56 +0000
Message-ID: <c16fde62a310419dac5c5bc8a157b3ad@intel.com>
References: <20210109191013.9858-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210109191013.9858-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rotation_crc: fix crc
 buffer overflow for slow platforms
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
> Sent: Saturday, January 9, 2021 9:10 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rotation_crc: fix crc buffer
> overflow for slow platforms
> 
> on bad tiling tests there was nothing reading running crcs which could fill up
> crc ringbuffer. Fix this by draining crc buffer per round. Also unify all
> platforms execution path by taking reference crcs per pipe.
> 
Looks ok to me.

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_rotation_crc.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c index
> be27103fa..33a97ccaa 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -272,11 +272,7 @@ static void prepare_fbs(data_t *data, igt_output_t
> *output,
>  	 */
>  	igt_require(igt_display_has_format_mod(display, pixel_format,
> tiling));
> 
> -	/*
> -	 * HSW will need to have those CRCs calculated each time, it
> -	 * seems to behave different from other platforms.
> -	 */
> -	if (!data->crc_rect[rect].valid || IS_HASWELL(data->devid)) {
> +	if (!data->crc_rect[rect].valid) {
>  		/*
>  		* Create a reference software rotated flip framebuffer.
>  		*/
> @@ -345,6 +341,7 @@ static void test_single_case(data_t *data, enum pipe
> pipe,
> 
>  	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>  	if (test_bad_format) {
> +		igt_pipe_crc_drain(data->pipe_crc);
>  		igt_assert_eq(ret, -EINVAL);
>  		return;
>  	}
> @@ -408,10 +405,6 @@ static void test_plane_rotation(data_t *data, int
> plane_type, bool test_bad_form
>  	igt_display_t *display = &data->display;
>  	igt_output_t *output;
>  	enum pipe pipe;
> -	int c;
> -
> -	for (c = 0; c < num_rectangle_types; c++)
> -		data->crc_rect[c].valid = false;
> 
>  	if (plane_type == DRM_PLANE_TYPE_CURSOR)
>  		igt_require(display->has_cursor_plane);
> @@ -420,7 +413,10 @@ static void test_plane_rotation(data_t *data, int
> plane_type, bool test_bad_form
> 
>  	for_each_pipe_with_valid_output(display, pipe, output) {
>  		igt_plane_t *plane;
> -		int i, j;
> +		int i, j, c;
> +
> +		for (c = 0; c < num_rectangle_types; c++)
> +			data->crc_rect[c].valid = false;
> 
>  		if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
>  			continue;
> --
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
