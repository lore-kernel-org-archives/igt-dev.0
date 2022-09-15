Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFF110E165
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 09:50:28 +0000 (UTC)
Message-ID: <782162f6-7747-1216-9c1d-58574ddf824c@intel.com>
Date: Thu, 15 Sep 2022 15:20:10 +0530
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220915094049.2481670-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220915094049.2481670-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_color_chamelium: Fix
 port_idx check
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

On Thu-15-09-2022 03:10 pm, Kunal Joshi wrote:
> chamelium has a port with id 0, so return -1 instead.
> 
> Cc: Modem Bhanuprakash <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/chamelium/kms_color_chamelium.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
> index 678931aa..401f78c8 100644
> --- a/tests/chamelium/kms_color_chamelium.c
> +++ b/tests/chamelium/kms_color_chamelium.c
> @@ -443,7 +443,7 @@ static int test_setup(data_t *data, enum pipe p)
>   		}
>   	}
>   
> -	return 0;
> +	return -1;
>   }
>   
>   static void
> @@ -452,7 +452,7 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
>   {
>   	int port_idx = test_setup(data, p);
>   
> -	igt_require(port_idx);
> +	igt_require(port_idx >= 0);
>   
>   	data->color_depth = 8;
>   	data->drm_format = DRM_FORMAT_XRGB8888;
> @@ -476,7 +476,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
>   	};
>   	int port_idx = test_setup(data, p);
>   
> -	igt_require(port_idx);
> +	igt_require(port_idx >= 0);
>   	/*
>   	 * CherryView generates values on 10bits that we
>   	 * produce with an 8 bits per color framebuffer.
> @@ -531,7 +531,7 @@ run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
>   {
>   	int port_idx = test_setup(data, p);
>   
> -	igt_require(port_idx);
> +	igt_require(port_idx >= 0);
>   	igt_require(igt_output_has_prop(data->output, IGT_CONNECTOR_BROADCAST_RGB));
>   
>   	data->color_depth = 8;
