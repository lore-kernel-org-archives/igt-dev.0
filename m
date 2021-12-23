Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE70D10E2D7
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Dec 2021 09:26:59 +0000 (UTC)
Message-ID: <cd2030b2-bb6a-0788-19f6-9bb9a05d6887@intel.com>
Date: Thu, 23 Dec 2021 14:56:41 +0530
Content-Language: en-US
References: <20211223071833.1600156-1-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20211223071833.1600156-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_color: Optimize ctm test
 execution
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 12/23/2021 12:48 PM, Bhanuprakash Modem wrote:
> Instead of iterating through all the delta, break the execution
> when we found a match. This will optimize the time required to
> execute ctm-0-* tests.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_color.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 775f35964f..854b8f3c31 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -754,9 +754,11 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>   				expected_colors[1].g =
>   				expected_colors[2].b =
>   				0.25 + delta * (i - 2);
> -			success |= test_pipe_ctm(data, primary,
> -						 red_green_blue,
> -						 expected_colors, ctm);
> +			if (test_pipe_ctm(data, primary, red_green_blue,
> +					  expected_colors, ctm)) {
> +				success = true;
> +				break;
> +			}
>   		}
>   		igt_assert(success);
>   	}
> @@ -776,9 +778,11 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>   				expected_colors[1].g =
>   				expected_colors[2].b =
>   				0.5 + delta * (i - 2);
> -			success |= test_pipe_ctm(data, primary,
> -						 red_green_blue,
> -						 expected_colors, ctm);
> +			if (test_pipe_ctm(data, primary, red_green_blue,
> +					  expected_colors, ctm)) {
> +				success = true;
> +				break;
> +			}
>   		}
>   		igt_assert(success);
>   	}
> @@ -798,9 +802,11 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>   				expected_colors[1].g =
>   				expected_colors[2].b =
>   				0.75 + delta * (i - 3);
> -			success |= test_pipe_ctm(data, primary,
> -						 red_green_blue,
> -						 expected_colors, ctm);
> +			if (test_pipe_ctm(data, primary, red_green_blue,
> +						expected_colors, ctm)) {
> +				success = true;
> +				break;
> +			}
>   		}
>   		igt_assert(success);
>   	}

