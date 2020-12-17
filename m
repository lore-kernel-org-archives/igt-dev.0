Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1398189221
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Dec 2020 10:05:04 +0000 (UTC)
References: <20201217093857.3283640-1-kunal1.joshi@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <0f89073d-b165-a305-b297-af86dff986ac@intel.com>
Date: Thu, 17 Dec 2020 15:35:00 +0530
MIME-Version: 1.0
In-Reply-To: <20201217093857.3283640-1-kunal1.joshi@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH] tests/kms_color_chamelium fix update success
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 12/17/2020 3:08 PM, Kunal Joshi wrote:
> Made a silly mistake and didn't update bool success to true
> fixing that with this patch.
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_color_chamelium.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
> index 43bbe1f2..af2bf994 100644
> --- a/tests/kms_color_chamelium.c
> +++ b/tests/kms_color_chamelium.c
> @@ -611,8 +611,10 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>   				expected_colors[2].b =
>   				0.25 + delta * (i - 2);
>   			if(test_pipe_ctm(data, primary, red_green_blue,
> -					 expected_colors, ctm))
> +					 expected_colors, ctm)) {
> +				success = true;
>   				break;
> +			}
>   		}
>   		igt_assert(success);
>   	}
> @@ -633,8 +635,10 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>   				expected_colors[2].b =
>   				0.5 + delta * (i - 2);
>   			if(test_pipe_ctm(data, primary, red_green_blue,
> -					 expected_colors, ctm))
> +					 expected_colors, ctm)) {
> +				success = true;
>   				break;
> +			}
>   		}
>   		igt_assert(success);
>   	}
> @@ -655,8 +659,10 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>   				expected_colors[2].b =
>   				0.75 + delta * (i - 3);
>   			if(test_pipe_ctm(data, primary, red_green_blue,
> -					 expected_colors, ctm))
> +					 expected_colors, ctm)) {
> +				success = true;
>   				break;
> +			}
>   		}
>   		igt_assert(success);
>   	}


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
