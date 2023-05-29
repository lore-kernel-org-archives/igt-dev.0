Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09C410E289
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 12:30:36 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51458187be1so5665656a12.2
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 05:30:36 -0700 (PDT)
Message-ID: <2c6f4996-8548-2abd-eb19-3f4e4c07526b@gmail.com>
Date: Mon, 29 May 2023 15:30:29 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230526064520.310041-1-swati2.sharma@intel.com>
 <20230526064520.310041-3-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230526064520.310041-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_display_modes: reduce
 exec. time for sim env
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 26.5.2023 9.45, Swati Sharma wrote:
> For simulation environment, we can reduce execution time
> by running test only on one valid output on pipe.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_display_modes.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index d69c7b93..b963c609 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -169,6 +169,12 @@ static void run_extendedmode_test(data_t *data) {
>   								pipe2, output2);
>   				}
>   			}
> +			/*
> +			 * For simulation env, no need to run
> +			 * test with each valid output on pipe.
> +			 */
> +			if (igt_run_in_simulation())
> +				break;
>   		}
>   	}
>   }
