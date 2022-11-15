Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD28110E37F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 08:46:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso12571032wma.1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 00:46:29 -0800 (PST)
Message-ID: <f331b5f0-8386-16f5-82c6-7e04b98a8c68@gmail.com>
Date: Tue, 15 Nov 2022 10:46:20 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
References: <20221115051555.57933-1-ashutosh.dixit@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20221115051555.57933-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Fix compile
 warning
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

On 15.11.2022 7.15, Ashutosh Dixit wrote:
> Fix the following compile warning:
> 
> [1/414] Compiling C object tests/kms_cursor_crc.p/kms_cursor_crc.c.o
> ../tests/kms_cursor_crc.c: In function ‘run_size_tests.constprop’:
> ../tests/kms_cursor_crc.c:731:50: warning: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size between 4 and 14 [-Wformat-truncation=]
>    731 |                 snprintf(name, sizeof(name), "%dx%d", w, h);
>        |                                                  ^~
> ../tests/kms_cursor_crc.c:731:46: note: directive argument in the range [-2147483648, 1024]
>    731 |                 snprintf(name, sizeof(name), "%dx%d", w, h);
>        |                                              ^~~~~~~
> In file included from /usr/include/stdio.h:894,
>                   from ../lib/igt_core.h:41,
>                   from ../lib/drmtest.h:39,
>                   from ../lib/igt.h:27,
>                   from ../tests/kms_cursor_crc.c:25:
> In function ‘snprintf’,
>      inlined from ‘run_size_tests.constprop’ at ../tests/kms_cursor_crc.c:731:3:
> /usr/include/bits/stdio2.h:71:10: note: ‘__builtin___snprintf_chk’ output between 4 and 24 bytes into a destination of size 16
>     71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     72 |                                    __glibc_objsize (__s), __fmt,
>        |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     73 |                                    __va_arg_pack ());
>        |                                    ~~~~~~~~~~~~~~~~~
> 
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   tests/kms_cursor_crc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 68bed666814..17f294d64d1 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -720,7 +720,7 @@ static void run_size_tests(data_t *data, int w, int h)
>   			"Check the rapid update of given-size cursor movements." },
>   	};
>   	int i;
> -	char name[16];
> +	char name[32];
>   
>   	if (w == 0 && h == 0) {
>   		w = data->cursor_max_w;
