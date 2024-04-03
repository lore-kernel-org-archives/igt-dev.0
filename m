Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E28CD11C2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 02:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD63F11231F;
	Wed,  3 Apr 2024 02:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qt1qln43";
	dkim-atps=neutral
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A03211231F
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 02:34:52 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6098a20ab22so51661127b3.2
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Apr 2024 19:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712111691; x=1712716491; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Unbbl4BUw8yqVznUoc9L3eoeIrPPqNkQD1ZH/UOpcic=;
 b=qt1qln43f9iY/fHJE3ssDlCz7gDr5QITClRH5SNbUUE19PVm+5PyPaSgkzPwlekKrB
 eTxpnSi5yj5Z4TyBKmD4uS305Pigcdsbw9fiaetT0gF7albjZmonRHJ8fgX23B8Bhd2x
 n0xBtBUFklDJG7J+t6RtFc5IYsHfCc3Oax0KZCwetTK9Ldrpmi1s9wJ26s6N8A+1zoZW
 NnkP05AaH2qg8IsvVvRa0oQOlY6DJJcpKovE+K79+ZKMviKKdWIarvY0tD/zGr6pUXti
 hvIoBrxx/+g8xsyekCJwJTTsrh8n1bhq91UoeZpULfvO6yeZdjp6J7M6I+IFTaGA3Q0b
 dL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712111691; x=1712716491;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Unbbl4BUw8yqVznUoc9L3eoeIrPPqNkQD1ZH/UOpcic=;
 b=fJTqYOU/BTvUy3P/HAhnkATxjt+xrBG9p6IKU8WU8uTesh7wv0z/+4IaiPfWDyS8Wg
 dl/F3cQWMy5iKl6tTSPXSCm4NCflM2wA/kvo3VxdBCeoocCpWHIk1unNFYhkZc4IXSZ0
 EhVHGMOzZO+b1qETL+McqOjqtSin5ppRCUcOS3dObSid4XlxKjEBTptXQnCwQfUdTFBa
 1naC/b81mTlNNRQ1oUVTwJ5vlkaaefmk3NWsw5TYHSbNO8FkaNF66lHRkNUUIg0lvfT/
 c2gPDu3agRP9FMYQ5Pm8/6lx+sv1LIZuWYh/Y9Z2gVVbTw2XdQtPemDxoZMXT6DIYWhZ
 BT1g==
X-Gm-Message-State: AOJu0YwoPdVIwO4Fvs11ktrJOUo9zRrIXffJksfYBk8FkMUCFMadDmWg
 bzxLqCZZw0U7mqf0Vaost9t9MPuIeeOkDOVvueqi4L95rirhDNwcoUzRALvBKzsF9qJLujdtI8t
 nbQtU0r8cZ51Opt45c15b0BeJtXPE1qK5nSP4Fg==
X-Google-Smtp-Source: AGHT+IFNo1d1QT3xiZkYcu3DNgD6YzaJS160DgQ48NC+Cx6TYh4Fo5hTlfDmWwde7SDauAeBh2+y/myHUQNRkEFpOTg=
X-Received: by 2002:a25:cd81:0:b0:dc6:cbb9:e with SMTP id
 d123-20020a25cd81000000b00dc6cbb9000emr1265861ybf.41.1712111690754; 
 Tue, 02 Apr 2024 19:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240403013302.2277902-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240403013302.2277902-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 05:34:39 +0300
Message-ID: <CAA8EJppW=39YTPdRtVBv8EH7gX3xWGCSzX99uLq3fd4ppNMCFA@mail.gmail.com>
Subject: Re: [RFC PATCH i-g-t] lib/igt_kms: move setting
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: igt-dev@lists.freedesktop.org, robdclark@gmail.com, 
 quic_jesszhan@quicinc.com, petri.latvala@intel.com, markyacoub@chromium.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 3 Apr 2024 at 04:33, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Currently DRM_CLIENT_CAP_WRITEBACK_CONNECTORS is set in the igt_display_require()
> which is invoked for all IGT tests irrespective of whether the rest of the
> writeback connector properties such as the FB_ID are set.
>
> This results in all IGT tests running even on writeback connector
> which certainly fails many tests on MSM hardware because tests such as CTM
> rely on CRC being collected post CTM in the display pipeline but for MSM hardware
> there is no CRC collection point post CTM for writeback connectors.

I'd say, even simpler: for the writeback connectors to function
properly, additional setup steps are required (like setting up the
output buffers and submitting the job). These steps are not a part of
the default IGT setup, so there is no guarantee that the pipeline will
be executed at all.

>
> It is unclear whether this is intentional to be able to run all IGT tests even
> with writeback connector or it is only kms_writeback which is supposed to
> be the one.
>
> Lets try with the latter approach by setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
> only within kms_writeback.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  lib/igt_kms.c         | 2 --
>  tests/kms_writeback.c | 5 +++++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c38021dd7f74..c03eabdf1d6e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2750,8 +2750,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>         if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
>                 display->is_atomic = 1;
>
> -       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> -
>         resources = drmModeGetResources(display->drm_fd);
>         if (!resources)
>                 goto out;
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 6cd685b37af2..3448dc06f891 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -558,6 +558,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>         igt_fb_t input_fb, input_fb_10bit;
>         drmModeModeInfo mode;
>         unsigned int fb_id;
> +       int ret;
>
>         memset(&display, 0, sizeof(display));
>
> @@ -570,6 +571,10 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>
>                 igt_require(display.is_atomic);
>
> +               ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> +
> +               igt_require(!ret);
> +
>                 output = kms_writeback_get_output(&display);
>                 igt_require(output);
>
> --
> 2.44.0
>


-- 
With best wishes
Dmitry
