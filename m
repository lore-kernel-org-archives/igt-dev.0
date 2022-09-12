Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF01410E331
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Sep 2022 09:24:56 +0000 (UTC)
Message-ID: <47a3e664-1802-3b1b-0d2e-64e43db4d1a2@intel.com>
Date: Mon, 12 Sep 2022 14:54:37 +0530
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220912090610.2133564-1-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220912090610.2133564-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_color_chamelium: Fix port_idx
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

On Mon-12-09-2022 02:36 pm, Kunal Joshi wrote:
> Since port id can also be 0, return -1 instead
> 
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/chamelium/kms_color_chamelium.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
> index 678931aa..9aaa1245 100644
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
> +	igt_require(port_idx != -1);

Must be (port_idx >= 0) ? b'coz this condition will pass in case of -2 ...

- Bhanu

>   
>   	data->color_depth = 8;
>   	data->drm_format = DRM_FORMAT_XRGB8888;
> @@ -476,7 +476,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
>   	};
>   	int port_idx = test_setup(data, p);
>   
> -	igt_require(port_idx);
> +	igt_require(port_idx != -1);
>   	/*
>   	 * CherryView generates values on 10bits that we
>   	 * produce with an 8 bits per color framebuffer.
> @@ -531,7 +531,7 @@ run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
>   {
>   	int port_idx = test_setup(data, p);
>   
> -	igt_require(port_idx);
> +	igt_require(port_idx != -1);
>   	igt_require(igt_output_has_prop(data->output, IGT_CONNECTOR_BROADCAST_RGB));
>   
>   	data->color_depth = 8;
