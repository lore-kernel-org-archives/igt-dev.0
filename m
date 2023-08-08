Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121DE10E3E0
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 12:31:57 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fe4a89e7efso32103505e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Aug 2023 05:31:56 -0700 (PDT)
Message-ID: <50882093-0d2a-d3e6-99d4-43e8a8c86772@gmail.com>
Date: Tue, 8 Aug 2023 15:31:49 +0300
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230808122759.978258-1-jouni.hogander@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230808122759.978258-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] Revert "tests/kms_dirtyfb: Add new
 test for dirtyfb ioctl"
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

Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 8.8.2023 15.27, Jouni Högander wrote:
> This reverts commit 832d4f87d9fde665933b11c329c5941e70a33184.
> 
> This patch is missing added kms_dirtyfb.c file. Due to this revert it.
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   tests/meson.build | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 7b621220c..58061dbc2 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -240,7 +240,6 @@ i915_progs = [
>   	'kms_busy',
>   	'kms_ccs',
>   	'kms_cdclk',
> -	'kms_dirtyfb',
>   	'kms_draw_crc',
>   	'kms_dsc',
>   	'kms_fb_coherency',
