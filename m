Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCADCD75E33
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 12:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7025F10E03E;
	Fri, 22 Nov 2024 12:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v6k+vZ62";
	dkim-atps=neutral
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C679410E03E
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 12:34:20 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e383bbcef9dso2048211276.3
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 04:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732278860; x=1732883660; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uv+fiPvfxpC3CHjQj8GkfVQ3nlg3uNWS9vK/aDJI1ig=;
 b=v6k+vZ62fpx3DqfcDBKzkxGzFE6fIfX5i6k6GPwb591XD0RWReHTydMbu10zTjdq5r
 lLCF1eLYLwA6mqdVY/f6i325Vj+7RFRM7r7GtZUJaPjAOHeTupuCbYEJ1Kuc+83Av9gv
 ryFiDY4B6DCajqAdFOkuwSfYSPJB3tt4cnmWc3z4xHFmmgIWRcGwmnkv2LT6DiXRQZD5
 iwiq4QsQxJaZYMOOMf7K2aWZiqiNyTXvpwkbSSAuo6D3Az9gZnZe9Sk0+C5LvaoiDN82
 /gvXf0SZqFNsP5Rcl51KHSGR2fYs+05Da1BebUl+2NcSkcoEhNbol1qdyOdYWv7NbjAd
 1DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732278860; x=1732883660;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uv+fiPvfxpC3CHjQj8GkfVQ3nlg3uNWS9vK/aDJI1ig=;
 b=PTSfWSZ0+47O0wELjCZvKRfriJ0baR75KtnA/CJzl6MMuCqdcFxbqLbB62PlUseoT2
 l5KEepP43IwoFpyy5mrPz8z/DASeT0YTk1xFU/IubM0gDmtK6H3oV8FwTrnRAG2J168S
 um5dZzMeF0KJJ/L1eMNFQ7FpNzJ1aUSphkYcqxYI/gs+wCG6KT9mtVrrfkwHwMKmjhru
 h9FsC089N3VdUt3nKpIB+mwQbVz5I1WSyqPOF1QVxghjPzM17lYKKjTxtgpUsZWZbWcf
 M5AogBCWbsAp6cWoxEKEOdNhPP6e5iNUPckHwHRMp/L6A2nyNJ/VbaEyTAeWTKYbM2X3
 HXWQ==
X-Gm-Message-State: AOJu0Yw8V1Y8eGA/wuy3yDuKw3oIfUD6eMVtVjxQvqISaJRRn3ePqF3Q
 t5ms1kWbe/6YSuKmqJ4TWWiKhbLlxRozf+/ke58H93i9+IKbelc6BDUE29C9+u4WimJ1qZ0Hf39
 sEp1pvVJgVW9WVRUUbZ0uSqghZILS3A5Q9FxnwCq3UjYSnWJJ
X-Gm-Gg: ASbGncv+qboISGTAzIFIcN55HhvoVkd2lovNzVK6JA3LhEFr0akxxHECKX1TgFMqBMf
 4LWsmgZDBnxAiCqwzjAb0MYWokoA3vNs2gfA/6DKSDnNyqg==
X-Google-Smtp-Source: AGHT+IGPeWvh0p35VNYqorfFG21MSfF1L3y5t/bnubvxTdmf+kAaR/mNJ4Em1ZhVLHYKfjMMwjGZic3TQ3SWCrThAPg=
X-Received: by 2002:a05:6902:1681:b0:e38:bcdf:c4ea with SMTP id
 3f1490d57ef6-e38f8b5435amr2972019276.28.1732278859795; Fri, 22 Nov 2024
 04:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20241115-rework-imm-check-v3-0-e4077cf16816@linaro.org>
In-Reply-To: <20241115-rework-imm-check-v3-0-e4077cf16816@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 14:34:08 +0200
Message-ID: <CAA8EJppGobO+iy4budAJwj97RhM4rsTgBG+Y4=JnxkJuz9qEiA@mail.gmail.com>
Subject: Re: [PATCH i-g-t RESEND v3 0/2] tests/kms_properties: rework
 immutability checks
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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

On Fri, 15 Nov 2024 at 23:19, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Following the discussion on IRC, it is actually an error to require that
> properties that can not be chaged are marked as immutable.
>
> The DRM_MODE_PROP_IMMUTABLE defines more of the 'direction' of the
> property (whether it is set by the kernel or it is expected to be set by
> the userspace) rather than simply states that there is no way for the
> userspace to change the property.
>
> Drop the existing immutability test and spawn (as an RFC) new sanity
> checker for properties.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> ---
> Changes in v3:
> - Split implementation into two patches, one to remove the immutability
>   check and another one to add sanity checks.

And gracious ping. Ville, I've split the patches now. Could you
possibly comment?

-- 
With best wishes
Dmitry
