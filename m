Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D456EC8D
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 08:53:58 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Thu, 10 Jun 2021 08:53:44 +0000
Message-ID: <BY5PR11MB437223C6D52194553D9CEE1589359@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <80bed39a-e899-f211-ae2f-279312b52084@gmail.com>
 <1623143106-8423-1-git-send-email-vidya.srinivas@intel.com>
 <5bd96874-ec95-e560-9793-e3bdcbd9beec@gmail.com>
In-Reply-To: <5bd96874-ec95-e560-9793-e3bdcbd9beec@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Use
 igt_pipe_crc_get_current instead of igt_pipe_crc_collect_crc
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
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>, "Lin,
 Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hello Juha-Pekka,

Thank you so much.

Regards
Vidya

-----Original Message-----
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> 
Sent: Thursday, June 10, 2021 2:22 PM
To: Srinivas, Vidya <vidya.srinivas@intel.com>; igt-dev@lists.freedesktop.org
Cc: markyacoub@chromium.org; Almahallawy, Khaled <khaled.almahallawy@intel.com>; Lin, Charlton <charlton.lin@intel.com>; Latvala, Petri <petri.latvala@intel.com>; Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Shankar, Uma <uma.shankar@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_big_fb: Use igt_pipe_crc_get_current instead of igt_pipe_crc_collect_crc

Results look ok, there show one new fifo underrun on glk but I don't think it is caused by your change.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 8.6.2021 12.05, Vidya Srinivas wrote:
> CRC mismatch is seen between big and small CRC on
> Gen11 systems for subtest y-tiled-32bpp-rotate-0.
> Patch changes igt_pipe_crc_collect_crc to igt_pipe_crc_get_current for 
> collecting CRC for big and small fb to compare.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> Change-Id: Ie913127f149f577ab0a034dcbbd4314af17cad52
> ---
>   tests/kms_big_fb.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c index 
> b35727a09bd0..ea12a34157f2 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -331,14 +331,13 @@ static bool test_plane(data_t *data)
>   		 * rendering pipeline introduces slight differences into
>   		 * the result if we try that, and so the crc will not match.
>   		 */
> +		igt_pipe_crc_start(data->pipe_crc);
>   		copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
>   			     small_fb->width, small_fb->height);
>   
>   		igt_display_commit2(&data->display, data->display.is_atomic ?
>   				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
> -
> -
> -		igt_pipe_crc_collect_crc(data->pipe_crc, &small_crc);
> +		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, 
> +&small_crc);
>   
>   		igt_plane_set_fb(plane, big_fb);
>   		igt_fb_set_position(big_fb, plane, x, y); @@ -347,11 +346,12 @@ 
> static bool test_plane(data_t *data)
>   		igt_display_commit2(&data->display, data->display.is_atomic ?
>   				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
>   
> -		igt_pipe_crc_collect_crc(data->pipe_crc, &big_crc);
> +		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, 
> +&big_crc);
>   
>   		igt_plane_set_fb(plane, NULL);
>   
>   		igt_assert_crc_equal(&big_crc, &small_crc);
> +		igt_pipe_crc_stop(data->pipe_crc);
>   	}
>   
>   	return true;
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
