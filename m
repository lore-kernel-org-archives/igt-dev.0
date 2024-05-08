Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1766AC04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 11:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CDD1135E8;
	Wed,  8 May 2024 11:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CxP0Y3Cs";
	dkim-atps=neutral
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583E81135E8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 11:45:19 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-34e663aa217so3191995f8f.1
 for <igt-dev@lists.freedesktop.org>; Wed, 08 May 2024 04:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715168717; x=1715773517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=v0YxuNRJchB/i09RBBbotZh/PIL6BeEDOUp2P0YpOkE=;
 b=CxP0Y3Cs5EYilgerJzNH1rnLzbukRk9Xd9Peu8sv/N86jjEeXtNjj90oth66e3mxsI
 IdPXsJm/yHDg0xEo9JX7Kiy/jFDw6eADpGAVC3RTAK5OMAA0rUBms5TFcM2IUDiAFCS0
 n5HOkp/cYHT4oJVJhhQV/LU/RhJejM+4pSPjsr8RsR9xnz8or4QtVQLood9fPtBxwR9N
 Kpgo2oymraAZwSKIqIjjsHiX9lteH/ZgcHtVTW1b3fAZNwISi+WByXFH3+3O7ufKF/LV
 B8OgK6id3bFlhWPFYfaDqJChyW7zjGxXyQtfe6kZpeOp08WxROoH012ev5TfUqXF468+
 WVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715168717; x=1715773517;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0YxuNRJchB/i09RBBbotZh/PIL6BeEDOUp2P0YpOkE=;
 b=UJvg9bN181PADHkWOJJPwF8vV3QQq2JaWzoKGkiv5o0Y/xwqjKMOl8FzOKBV2tgIzM
 YQKCIiwsdda+lh0NSjE/gz44hSjfqts0W03gFK0UxWFakSgjgkm45A9JMPoM2g0BV7ez
 uTFXAuPLZO/G5fI49i7HPh7bQuJiz9EB+EK5Iaa48lo1OvHiIq+i12J138AYCDS0LuPS
 5x99+0Y6XenIq/OcY23ynGr2yeYlKXG+zy7gKQW807H/VZQhnFoRU3bxWrgNC7s4q3OB
 oy4GcvTuJgfs0gXlSQGdruVjIsktjWLKCnYWYOMYgWL51ZCAGr8whor5JvZ4zIei7IRr
 V9TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCHQDItub8irE/i+t6wajPN4Fkr2Nwq+OYD5yNYipkEdxLaUMGF/0VBdLCHLRgZHrenU9p89KVRElNFTUR6WfICSsFw+aWZ3Kul8ez3A==
X-Gm-Message-State: AOJu0YzBGFF28Kj2ZkB/mE9Bj1KhbMMBAnvle1APeCRzaycE1ogtmxAl
 hp9EUkyRkc/BeHHGCakn5i8EOQFeyv947oFGVrmZvxEdAb54pOaS
X-Google-Smtp-Source: AGHT+IG7peKkEFwoIheR/dj2wnNJ13UTz/e3DxphZ7PXPeU6r61Wr1TPww1UZoEeuXiZ//NRmtDaSg==
X-Received: by 2002:adf:ab19:0:b0:34c:925e:6c2c with SMTP id
 ffacd0b85a97d-34fcaddf714mr1767151f8f.6.1715168717239; 
 Wed, 08 May 2024 04:45:17 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.86])
 by smtp.googlemail.com with ESMTPSA id
 q27-20020adfab1b000000b0034e24be18a1sm15297345wrc.15.2024.05.08.04.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 04:45:16 -0700 (PDT)
Message-ID: <fcedb370-5a8e-41db-8371-77ba1cca1e81@gmail.com>
Date: Wed, 8 May 2024 14:45:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_ccs: Test XRGB2101010
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240506133748.30321-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240506133748.30321-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On 6.5.2024 16.37, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I want to enable 10bpc CCS support for i915. To that end start
> testing it.
> 
> Note that we are faking things a bit because rendercopy will
> still use a 8:8:8:8 format here (plumbing the full pixel format,
> as opposed to just bpp, would require quite a bit more work).
> However this seems to work fine, I suspect due to:
> - we only do 1:1: copies of data
> - the compression is lossless
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index a5cb3b3b4f27..c91370a9abe7 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -197,6 +197,7 @@ static const struct {
>   static const uint32_t formats[] = {
>   	DRM_FORMAT_XYUV8888,
>   	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XRGB2101010,
>   	DRM_FORMAT_YUYV,
>   	DRM_FORMAT_NV12,
>   	DRM_FORMAT_P012,
> @@ -635,6 +636,7 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
>   {
>   	switch (fb->drm_format) {
>   	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_XRGB2101010:

As discussed offline, here's unrelated issue which need to be fixed at 
later time, but as lossless compression work lossless this is all ok.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>   	case DRM_FORMAT_P010:
>   	case DRM_FORMAT_P012:
>   	case DRM_FORMAT_P016:
> @@ -849,7 +851,8 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>   		return false;
>   
>   	if (is_ccs_cc_modifier(data->ccs_modifier) &&
> -	    data->format != DRM_FORMAT_XRGB8888)
> +	    data->format != DRM_FORMAT_XRGB8888 &&
> +	    data->format != DRM_FORMAT_XRGB2101010)
>   		return false;
>   
>   	if ((fb_flags & FB_MISALIGN_AUX_STRIDE) ||

