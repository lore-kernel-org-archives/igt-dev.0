Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AC389904
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 17:48:46 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id u14so423521ejf.13
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 10:48:46 -0700 (PDT)
References: <20210827145756.3342904-1-imre.deak@intel.com>
 <20210827145756.3342904-4-imre.deak@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <2c9040a2-2d6f-d57d-65d6-d637746da4b3@gmail.com>
Date: Tue, 31 Aug 2021 20:48:40 +0300
MIME-Version: 1.0
In-Reply-To: <20210827145756.3342904-4-imre.deak@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] tests/kms_ccs: Fix small aux stride
 subtest
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
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 27.8.2021 17.57, Imre Deak wrote:
> Use the correct CCS plane stride for the small aux stride subtest.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   tests/kms_ccs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> index 5bc50b4bb..52252c633 100644
> --- a/tests/kms_ccs.c
> +++ b/tests/kms_ccs.c
> @@ -307,7 +307,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>   		if (fb_flags & FB_SMALL_AUX_STRIDE) {
>   			igt_skip_on_f(width <= 1024,
>   				      "FB already has the smallest possible stride\n");
> -			f.pitches[index] = ALIGN(f.pitches[1]/2, 128);
> +			f.pitches[index] = ALIGN(f.pitches[index]/2, 128);
>   		}
>   
>   		if (fb_flags & FB_ZERO_AUX_STRIDE)
> 
