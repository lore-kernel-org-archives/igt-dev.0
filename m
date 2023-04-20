Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6260710E21D
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Apr 2023 05:05:31 +0000 (UTC)
Message-ID: <f2c90793-0bf1-9d3f-c740-4d1564640d90@intel.com>
Date: Thu, 20 Apr 2023 10:34:55 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230419112243.1719789-1-bhanuprakash.modem@intel.com>
 <20230419112243.1719789-5-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230419112243.1719789-5-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 4/6] tests/i915/kms_psr: Use linear
 modifier to create FB
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


On 4/19/2023 4:52 PM, Bhanuprakash Modem wrote:
> To create a color framebuffer, nstead of using X-tiled use
> liniear modifier.

typos : instead, linear.

Perhaps it can be reworded to specify that the change is to make the 
test compatible for drivers, only supporting

linear modifiers.

Otherwise the changes LGTM.

Acked-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_psr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
> index 3efe1faec..dfc2fbb65 100644
> --- a/tests/i915/kms_psr.c
> +++ b/tests/i915/kms_psr.c
> @@ -388,7 +388,7 @@ static void setup_test_plane(data_t *data, int test_plane)
>   	igt_create_color_fb(data->drm_fd,
>   			    data->mode->hdisplay, data->mode->vdisplay,
>   			    DRM_FORMAT_XRGB8888,
> -			    I915_FORMAT_MOD_X_TILED,
> +			    DRM_FORMAT_MOD_LINEAR,
>   			    0.0, 1.0, 0.0,
>   			    &data->fb_green);
>   
> @@ -416,7 +416,7 @@ static void setup_test_plane(data_t *data, int test_plane)
>   		igt_create_color_fb(data->drm_fd,
>   				    white_h, white_v,
>   				    DRM_FORMAT_XRGB8888,
> -				    I915_FORMAT_MOD_X_TILED,
> +				    DRM_FORMAT_MOD_LINEAR,
>   				    1.0, 1.0, 1.0,
>   				    &data->fb_white);
>   		break;
