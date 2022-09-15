Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B2410EADA
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 09:34:43 +0000 (UTC)
Message-ID: <e7227811-b510-90e5-9afe-82e7d6889d48@intel.com>
Date: Thu, 15 Sep 2022 15:04:26 +0530
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220915092625.2481132-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220915092625.2481132-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_color_chamelium: Fix
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

On Thu-15-09-2022 02:56 pm, Kunal Joshi wrote:
> chamelium has a port with id 0, so return -1 instead.
> 
> Cc: Modem Bhanuprakash <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/chamelium/kms_color_chamelium.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
> index 678931aa..05a06155 100644
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

We need this change at run_ctm_tests_for_pipe() & 
run_limited_range_ctm_test_for_pipe() too.

- Bhanu

>   
>   	data->color_depth = 8;
>   	data->drm_format = DRM_FORMAT_XRGB8888;
