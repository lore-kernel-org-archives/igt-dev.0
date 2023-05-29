Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AA910E288
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 12:30:23 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51475e981f0so5424009a12.1
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 05:30:23 -0700 (PDT)
Message-ID: <e4fddd3d-008a-80e9-8641-0a18ae36e31d@gmail.com>
Date: Mon, 29 May 2023 15:30:15 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230526064520.310041-1-swati2.sharma@intel.com>
 <20230526064520.310041-2-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230526064520.310041-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/tests/kms_cursor_crc: remove
 extra \n
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
> Remove extra newline.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_cursor_crc.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index f837dbc4..f5eb061d 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -29,7 +29,6 @@
>   #include <stdio.h>
>   #include <string.h>
>   
> -
>   IGT_TEST_DESCRIPTION(
>      "Use the display CRC support to validate cursor plane functionality. "
>      "The test will position the cursor plane either fully onscreen, "
> @@ -87,7 +86,6 @@ static bool extended;
>   static enum pipe active_pipes[IGT_MAX_PIPES];
>   static uint32_t last_pipe;
>   
> -
>   #define TEST_DPMS (1<<0)
>   #define TEST_SUSPEND (1<<1)
>   
