Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5043B10EB07
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 14:27:48 +0000 (UTC)
Message-ID: <37e15e57-6da1-2e5d-fba4-314ba79a3f62@intel.com>
Date: Thu, 9 Feb 2023 19:41:27 +0530
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
 <20230131120646.27434-3-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230131120646.27434-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] tests/kms_async_flips: Render the
 bars full height
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LTGM.

On 1/31/2023 5:36 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Make the colored bars full height so that we can actually see
> the async flip activity on every scanline, as opposed to just
> being able to see it in the middle of the screen.
>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 89e431ac32e2..55be0bd874ad 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -133,7 +133,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
>   	}
>   
>   	cr = igt_get_cairo_ctx(data->drm_fd, fb);
> -	igt_paint_color_rand(cr, rec_width * 2 + rec_width * index, height / 4, rec_width, height / 2);
> +	igt_paint_color_rand(cr, rec_width * 2 + rec_width * index, 0, rec_width, height);
>   	igt_put_cairo_ctx(cr);
>   }
>   
