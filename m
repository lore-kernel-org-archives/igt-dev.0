Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EA189D8E
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2020 09:34:42 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id z5so2857330ejb.3
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2020 02:34:42 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.83])
 by smtp.googlemail.com with ESMTPSA id d10sm1442252ejd.114.2020.05.20.02.34.38
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 02:34:40 -0700 (PDT)
References: <20200519063411.1541230-1-chris@chris-wilson.co.uk>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <9fa3e767-624a-0e89-1dd2-a9954b9ecf54@gmail.com>
Date: Wed, 20 May 2020 12:34:35 +0300
MIME-Version: 1.0
In-Reply-To: <20200519063411.1541230-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] i915/gem_ctx_persistence: Use "%u"
 for -1u conversion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Series

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>


On 19.5.2020 9.34, Chris Wilson wrote:
> The debugfs modparams are more picky and refuse to do the implicit
> unsigned conversion.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   tests/i915/gem_ctx_persistence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index ce9f02350..4a1ef0f27 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -1127,7 +1127,7 @@ igt_main
>   		igt_require_gem(i915);
>   
>   		/* Restore the reset modparam if left clobbered */
> -		igt_assert(igt_params_set(i915, "reset", "%d", -1));
> +		igt_assert(igt_params_set(i915, "reset", "%u", -1));
>   
>   		enable_hangcheck(i915);
>   		igt_install_exit_handler(exit_handler);
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
