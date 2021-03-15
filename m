Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8337589A20
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Mar 2021 13:27:22 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Mon, 15 Mar 2021 13:27:20 +0000
Message-ID: <c9fff9b4d3ff43738fdecd5efb7f3081@intel.com>
References: <20210315103547.17115-1-mohammed.khajapasha@intel.com>
 <20210315103547.17115-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20210315103547.17115-2-mohammed.khajapasha@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/kms_cursor_crc: Add vblank
 wait for restore image
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
To: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Khajapasha, Mohammed <mohammed.khajapasha@intel.com>
> Sent: Monday, March 15, 2021 12:36 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kahola, Mika <mika.kahola@intel.com>; Heikkila, Juha-pekka <juha-
> pekka.heikkila@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/kms_cursor_crc: Add vblank wait for restore
> image
> 
> Add igt_wait_for_vblank() once restore image is done and frontbuffer mark
> as dirty.
> 
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Kahola, Mika <mika.kahola@intel.com>
> Signed-off-by: Mohammed Khajapasha
> <mohammed.khajapasha@intel.com>

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
>  tests/kms_cursor_crc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c index
> 0be8f7f8..3541ea06 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -147,6 +147,7 @@ static bool cursor_visible(data_t *data, int x, int y)
> static void restore_image(data_t *data)  {
>  	cairo_t *cr;
> +	igt_display_t *display = &data->display;
> 
>  	/* rendercopy stripped in igt using cairo */
>  	cr = igt_get_cairo_ctx(data->drm_fd,
> @@ -157,6 +158,8 @@ static void restore_image(data_t *data)
>  	cairo_fill(cr);
>  	igt_put_cairo_ctx(cr);
>  	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> +	igt_wait_for_vblank(data->drm_fd,
> +			    display->pipes[data->pipe].crtc_offset);
>  }
> 
>  static void do_single_test(data_t *data, int x, int y)
> --
> 2.29.2.154.g7f7ebe054a

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
