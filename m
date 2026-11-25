Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED45606A31E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 11:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOGT3yos
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4515B10FB50;
	Wed, 25 Nov 2026 11:20:37 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4089610E0EF
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 11:18:51 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-1b546061d58so12740955c88.1
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 03:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795605530; x=1796210330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=J1B6+/iviN7CFniGpycbDyRqCx9CpYuMzTA4kjmW2mw=;
 b=uOGT3yosBtI6XwVzAWLmwsI3lAN885GwKyJ3GNw8xpGUi8eq3Giz2cLeVGpvBCJy9p
 TgpPAo8MPPbPYIUCKQ4I8PCS0fq6vkpd31/fGCDig9OOWfkt8hIWmNgqeqRyEgzGgWzj
 dA0unpXy1O0x4h1L4FyM8d9bC2tHkULAaQiCfETti5HSd8fY8ZZr2j8ciqdBizryLwlu
 Ml255m2NpSvnSKKwiZNmMDBrIyP1E4tvmm6XdN+qVkM4jhBAesAKTVT1xAZHjwm5RrXv
 2KppflMPsqmYEa4m/ZqdNTev8HUHNbGsmifNHPnvexfNHoYpXj9H6mWv+RjbJVND8CvD
 Tr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795605530; x=1796210330;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J1B6+/iviN7CFniGpycbDyRqCx9CpYuMzTA4kjmW2mw=;
 b=Em5PiGQFyHz04pmHkGgAVdH95NSFGdGFJzEuRGo3sIZLCnlnwki/QPzvBK9WdFiBK+
 Ud0ZFBIrfL9xzySdLKhtCQ5PkgDKZ2XX1G0rlsfgnZ2By6fJRALt55NVGN8AZAED3xIo
 SVCRxvG/kP+Ok8vnnl1VD+syAeHdodOMvBEeYmje17Xo6TbK0CTtNN4VaDpF7tgoWH8Y
 ZTemTUddWe+RnYl1ueiQU7D1MkGt25fF/NV7ZemImG7O55PYeVrCiYwYY2KV1habLSu5
 mqCs7I7uihed76tSxw0TW1rlAqNDTd+O8s6OiyDQ+ufNGTlVhCVHLwpwYCyffQl9COX7
 w9bQ==
X-Forwarded-Encrypted: i=1;
 AL+hErG+JL/EKRTQOkNd37mEvwmkF4xtzBuHLuwADorcm5rbagpV5PNWVUksGf1QGFSq3MRlrLjvmVIT@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/k395amL4nff1/d6qmH9vD1Sx1UY43TPmYfOSf8waZvlwqAMRz
 kqy3BzFnJeaCZ6Zq0r3FXleI1xiK8rUSMiSs6Jtm9X5YzrlO/bxtrwxKbGT09VtogpY=
X-Gm-Gg: AZFdTZel0gZBpPNuvPy8E+mfZdeqIx+RnJREoDNFE0sS+oCu3guHV85Aepo2Wb2UiGD
 ZsItFhNXN9KB4TISiP66TAvJSaP5Vq2O2ydWWyvz41CivPnTinqZJoPFTthThpY5EG2/v9lob8i
 fi132rUwkP6yq/El96BPBJ6FZVXv2l6rVOZc1Z9SXI8HAzXwRiKhQJA05ZOrhnzrbCfLM6airrP
 VzBDxJ01bxQU+jDJGtx2Aya2loWUHRmm/7eZwkD4uD/4iUoQO2y+T5n7zc/974swSiVFXDzeaw5
 3PHuw7fMu3k972evmlauY8KCXnaRIyX1vIdrreZHftk3ZliDCCzLK7ivw6oHvbZDZDxCW3NjM4T
 DYESfZjhulmxAsiOSgBemajzfWyHdQeoHNfo+Tlc64HpkgbIWBC1tV+cSElLNhcnCRiXoY2EpH+
 fosGGMj1z2FTWkC87CwFnnXImDi6zcI+pZ5oGk13YtRzC5bGE2oCMWnlltPmCQdc5jOfixiIsWC
 /1/ZlAu21FZAYA2MEFcRv6QtmrUnF3clrPWC/oZl1C7MfMiFcEyuL7wpI4GEVgbxOgRVckpC136
 iEzzWIHRGZeQvuz8NSpj5ToQqyia+cuH2F8hihq4lnBiwehSajIWZpBIz4FqUDr2oLukcoIH
X-Received: by 2002:a05:7022:294:10b0:19a:bbe8:41a8 with SMTP id
 a92af1059eb24-1b5568c876dmr17226108c88.20.1795605530406; 
 Wed, 25 Nov 2026 03:18:50 -0800 (PST)
Received: from [192.55.55.46] ([192.55.55.46])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b55684c85fsm61937569c88.14.2026.11.25.03.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:18:50 -0800 (PST)
Message-ID: <f2198c67-1396-4662-a936-9744f1e423fe@gmail.com>
Date: Wed, 25 Nov 2026 13:18:46 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/kms_hdmi_audio_bw: Use hibernate
 helper
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20261120134400.1888895-1-swati2.sharma@intel.com>
 <20261120134400.1888895-3-swati2.sharma@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261120134400.1888895-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 20/11/2026 15.43, Swati Sharma wrote:
> Use igt_system_hibernate_autoresume() for suspend-to-disk audio
> recovery. Keep the existing suspend helper for other suspend states.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_hdmi_audio_bw.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_hdmi_audio_bw.c b/tests/intel/kms_hdmi_audio_bw.c
> index c6b052744..31a7f2949 100644
> --- a/tests/intel/kms_hdmi_audio_bw.c
> +++ b/tests/intel/kms_hdmi_audio_bw.c
> @@ -530,7 +530,10 @@ static void test_audio_recovery(data_t *data, enum igt_suspend_state state,
>   					   data->output->config.connector,
>   					   DRM_MODE_DPMS_ON);
>   	} else {
> -		igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
> +		if (state == SUSPEND_STATE_DISK)
> +			igt_system_hibernate_autoresume();
> +		else
> +			igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
>   	}
>   
>   	wait_for_eld();

