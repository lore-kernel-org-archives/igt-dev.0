Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FF710E191
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 15:31:13 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-514ab6cb529so1862597a12.1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 08:31:13 -0700 (PDT)
Message-ID: <610aee85-ee0e-3c05-d989-070fc6c24acc@gmail.com>
Date: Thu, 15 Jun 2023 18:31:05 +0300
MIME-Version: 1.0
Content-Language: en-US
To: "Garg, Nemesa" <nemesa.garg@intel.com>, igt-dev@lists.freedesktop.org
References: <20230615123654.1672601-1-nemesa.garg@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230615123654.1672601-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: Reducing the
 IOCTL(drm_mode_cursor_ioctl) calls by reducing the timeout.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: Garg@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

I agree, I don't see any reason why this test execution couldn't be made 
shorter this way.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 15.6.2023 15.36, Garg, Nemesa wrote:
> Due to excessive IOCTL calls in a stress test we are getting
> disk limit issue. Hence by reducing the timeout from 20 to 5
> the IOCTL call will get reduced.
> 
> Checked with different values and found 5 as optimal value.
> 
> Signed-off-by: Garg, Nemesa <nemesa.garg@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index f1e55906..13918345 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1562,12 +1562,12 @@ igt_main
>   					errno = 0;
>   
>   					igt_dynamic_f("pipe-%s", kmstest_pipe_name(n))
> -						stress(&display, n, tests[i].ncpus, tests[i].flags, 20);
> +						stress(&display, n, tests[i].ncpus, tests[i].flags, 5);
>   				}
>   
>   				errno = 0;
>   				igt_dynamic("all-pipes")
> -					stress(&display, -1, tests[i].ncpus, tests[i].flags, 20);
> +					stress(&display, -1, tests[i].ncpus, tests[i].flags, 5);
>   			}
>   		}
>   	}
