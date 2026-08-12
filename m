Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147A8C5B56A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 16:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF13210F083;
	Wed, 12 Aug 2026 16:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ovc7lDZW";
	dkim-atps=neutral
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECCA10F083
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 16:06:18 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-84a2c90e383so40082b3a.0
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786550778; x=1787155578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7g/YLp6asBv8W+lYvzFvjVIaCB8WLQCG4Mpxvj8QfAI=;
 b=Ovc7lDZWIYeN3MvL1MJ60kiJLYvZB+U4Enjz7aYRDJWE9lxZbJbs9cCMz81HMmBLYg
 ieoEHdRFPlp+J1pcwqqreJI7IELOz8cCrkg0NacCT9+3JVQOODd5TNjYlvJcib5R21yH
 sN3aAURB57uQ16S6pxyIWJazk5icSUsU6mXstC+rmVTuUu3FNDtia8E3Tngab2YQkD7d
 sQ/mqZpnG/cTZJtUMOdT2xKYJIBj1S3nUvWxv0QJN23/l5QkUF9iZD1Orh/aNdZz+/Sg
 DojfdpuLdW963DWlTxCd6AqAlzwrTXuJmoHg06NLgSgNfVTgxCdstdZDbFS+K1FzBGwY
 e+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786550778; x=1787155578;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7g/YLp6asBv8W+lYvzFvjVIaCB8WLQCG4Mpxvj8QfAI=;
 b=ebc28TDusOOebrTa3O2DvMzoLITUm07o2r4eBerUiax0YvgmglS+izn2NPiu0H8pTX
 tVn6i+zxuRdsxtUOk3uSFp80YZjapuf1KXiwqg+XmDawqHmzBitUtrzVJ3MYBG6BwfHO
 hU+9zS0D1IE4jx3UJV/tGbSROCjyiOz9r8EwguouxlTxOm6RWmDyCf7xINn3Ma8E1nXO
 SEsv+jN01hIh9C3+x+M9E2rmaWiUlXLuF7OPwhNl/zedBpFKd3veYrtjq5vzDeKFxSQ0
 svjvainCNH/0t1/iSjhUFIZD4tch/H03XXbe3tWONZrKACN1d6HSn/AoyRFz7jwKlLl4
 AULw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9XO7l2UQSwm3Cfz9ojJlLK8xFoB5hHsMSdqdz++L7tn5KdZ4VMHuuWONSYprZk1w9z7QFF/Pg@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yws4lKe/3TYYG1szDS7qlzzRO+hXYPnQ2T+yK24CQr365UDgzyg
 gyZzVsqVwnWSo+Srlyx9delcoz3oi/BTyKwdYhbK8E1aKPLQ5FKHVaKk
X-Gm-Gg: AR+sD13KEZm7UYFwEgeK80u7hqZ/vhLQrwjQEtMERQLQ8HmLRbHKtwjhRAnBdhczs0L
 OMEP3JAvYtwsb5z16wCQ5GguzQE7IW1/lJ1xqLXvRI/HGRVjfGgEAjLNdTEHHSN+/ajwmzRvo10
 HnZLd6RSA7lzGUYDd7vmCWRWHqQRfZQMTPKCfRzj52kuBkk36soQwUBdUx35xPRDufRr7iOrJt8
 dXENUYpBfokD7Rh3f/DFPUshm/1q5j3MAwuR15R2LaE4+FXhMCXbnUuu74pPvAN1y+uUPkGEQUN
 v2E+riychoEtrmbIwUeAXxm1UlPSAjnVdGicZL+KHd9Vvipy9yeg5tClcj1m4Vl5X7HhdmVtjJX
 KZNrLUkqb2DP+ifNI70Ae9EuaA0oDra1USfTYxbrr4ggk2jsoXHmgS1Gm5hEYe49usDNwKKpLBt
 HVSAMm0oal3rB4Krrv38znI5ZDMCsrfhAnAQrdtryGLbA4x2g9T65vaOQr9tvOYfpC+2G91D2Ts
 PPVJIMINlRfxfYEdapy1cUoZEe5otErm1Ewqh4wRVDEUG0=
X-Received: by 2002:a05:6a21:48b:b0:3b3:3506:cf3f with SMTP id
 adf61e73a8af0-3cc52f0ffa1mr399888637.1.1786550777525; 
 Wed, 12 Aug 2026 09:06:17 -0700 (PDT)
Received: from [134.134.137.72] ([134.134.137.72])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbee7d52d4dsm929140a12.31.2026.08.12.09.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 09:06:15 -0700 (PDT)
Message-ID: <58ade4c2-a154-4bf4-9a13-19c514cf6aa5@gmail.com>
Date: Wed, 12 Aug 2026 19:06:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: skip PSR/FBC
 subtests disabled by modparam
To: Mika Kahola <mika.kahola@intel.com>, igt-dev@lists.freedesktop.org
References: <20260811094021.2094676-1-mika.kahola@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260811094021.2094676-1-mika.kahola@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Look ok to me

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 11/08/2026 12.40, Mika Kahola wrote:
> The enable_fbc and enable_psr module parameters can force FBC and PSR
> off regardless of chipset or sink support, but setup_fbc() and
> setup_psr() didn't check for that, so the related subtests ran and
> failed instead of being skipped.
> 
> Check intel_fbc_enable_possible() and is_psr_enable_possible() (also
> against PR_MODE, since a sink may use Panel Replay instead of PSR1) in
> setup_fbc()/setup_psr() so fbc.can_test/psr.can_test reflect the
> modparam state.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>   lib/i915/intel_fbc.c                   | 22 ++++++++++++++++++++++
>   lib/i915/intel_fbc.h                   |  1 +
>   tests/intel/kms_frontbuffer_tracking.c | 24 ++++++++++++++++++++++--
>   3 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index ad78ee2a3..9833cc9e3 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -20,6 +20,28 @@ void intel_fbc_disable(igt_display_t *display)
>   	igt_set_module_param_int(display->drm_fd, "enable_fbc", 0);
>   }
>   
> +/**
> + * intel_fbc_enable_possible:
> + * @drm_fd: Device file descriptor
> + *
> + * Check if FBC is allowed to be enabled by reading the enable_fbc modparam.
> + *
> + * Returns:
> + * true if enable_fbc modparam allows FBC to be enabled, false otherwise.
> + */
> +bool intel_fbc_enable_possible(int drm_fd)
> +{
> +	char *param_value;
> +	int enable_fbc;
> +
> +	param_value = __igt_params_get(drm_fd, "enable_fbc");
> +	igt_assert_f(param_value, "Could not read enable_fbc modparam\n");
> +	enable_fbc = atoi(param_value);
> +	free(param_value);
> +
> +	return enable_fbc != 0;
> +}
> +
>   /**
>    * intel_fbc_get_status_crtc_index
>    * @device: fd of the device
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index a82a96d20..1192ebf1b 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -14,6 +14,7 @@ enum psr_mode;
>   
>   void intel_fbc_enable(igt_display_t *display);
>   void intel_fbc_disable(igt_display_t *display);
> +bool intel_fbc_enable_possible(int drm_fd);
>   bool intel_fbc_supported(igt_crtc_t *crtc);
>   bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
>   bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 594644632..4dd2f4e70 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2195,6 +2195,12 @@ static void setup_fbc(void)
>   		return;
>   	}
>   
> +	if (!intel_fbc_enable_possible(drm.fd)) {
> +		igt_info("Can't test FBC: disabled by enable_fbc modparam\n");
> +		fbc.can_test = false;
> +		return;
> +	}
> +
>   	fbc.can_test = true;
>   
>   	fbc_setup_last_action();
> @@ -2227,6 +2233,20 @@ static void setup_psr(void)
>   		igt_info("Can't test PSR: not supported by sink.\n");
>   		return;
>   	}
> +
> +	if (!is_psr_enable_possible(drm.fd, PSR_MODE_1)) {
> +		igt_info("Can't test PSR: disabled by enable_psr modparam\n");
> +		psr.can_test = false;
> +		return;
> +	}
> +
> +	if (psr_sink_support(drm.fd, drm.debugfs, PR_MODE, NULL) &&
> +	    !is_psr_enable_possible(drm.fd, PR_MODE)) {
> +		igt_info("Can't test Panel Replay: Panel Replay disabled by enable_panel_replay modparam\n");
> +		psr.can_test = false;
> +		return;
> +	}
> +
>   	psr.can_test = true;
>   }
>   
> @@ -2688,11 +2708,11 @@ static void check_test_requirements(const struct test_mode *t)
>   
>   	if (t->feature & FEATURE_FBC)
>   		igt_require_f(fbc.can_test,
> -			      "Can't test FBC with this chipset\n");
> +			      "Can't test FBC (unsupported or disabled by enable_fbc modparam)\n");
>   
>   	if (t->feature & FEATURE_PSR) {
>   		igt_require_f(psr.can_test,
> -			      "Can't test PSR with the current outputs\n");
> +			      "Can't test PSR (unsupported or disabled by enable_psr modparam)\n");
>   	}
>   
>   	if (t->feature & FEATURE_DRRS)

