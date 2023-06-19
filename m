Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B16610E09C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 06:03:19 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-311394406d0so668940f8f.2
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Jun 2023 23:03:19 -0700 (PDT)
Message-ID: <d2e85e6d-5730-15d8-bbb1-a319a0711503@gmail.com>
Date: Mon, 19 Jun 2023 09:03:11 +0300
MIME-Version: 1.0
Content-Language: en-US
To: "Garg, Nemesa" <nemesa.garg@intel.com>, igt-dev@lists.freedesktop.org
References: <20230617095421.2031607-1-nemesa.garg@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230617095421.2031607-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: Reducing the
 IOCTL(drm_mode_cursor_ioctl) calls by reducing the timeout
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

On 17.6.2023 12.54, Garg, Nemesa wrote:
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
