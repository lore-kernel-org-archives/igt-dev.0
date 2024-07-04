Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4B5C3271E
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 15:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419C310EB34;
	Thu,  4 Jul 2024 15:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f3NXCj8R";
	dkim-atps=neutral
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8374810EAC4
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 15:03:00 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-650866942aeso7169807b3.0
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Jul 2024 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720105379; x=1720710179; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3RpEult+PpmNSByOOg7rpoXoPutAbjsE547878wS6dE=;
 b=f3NXCj8RxiBbaFcowATDt5XFvahQWtttVsuu34R/joMGX5G479BXkW+eyDDePc/x6b
 LZNQNyi8PZAZQf7GnuxISwmrnkFmOFpSC5foLCv/m7To1Gk+/x23HIYV/2YzRSJTHn1Y
 gW0HoL5ZYPQjp9w636F2FlqmRQLbTL/i8hqQlstt89ZX/Lr0tIBMc+fWHniM+kNGu7dd
 l5OU/825Jim4tqyYEtiIgfyr99LIdPcdFZpmLjPCxyn+YexbYIoOefG5sJMBLJfMD6Rs
 jLXAkdYMVjsHJRKRE9mxMksxvXzLfyUwVFUpJmz6US6Wxs2B/VSpvpdB5+LOnlVgBxMF
 w3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720105379; x=1720710179;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3RpEult+PpmNSByOOg7rpoXoPutAbjsE547878wS6dE=;
 b=GghxFd0a7xesA4UJNTAzFZeiIZ/34BZB5425qiO896H7ubY+aQ2MAhpxHFVpn4y6UE
 zz76FFJlwmzt6rJ/ZDBsYMeheFdLCczH8LVSTu+1eHqJ/iHHWYzD9dM1iKEm1PGsvy2T
 bsN0oOKqg5V2Vcsujomue1ZeUrKRs7d6rY28AH99dz5ibP3zny8uTcZ58WArhlS86gat
 iUKsMmZz6S+zLxG3IwB7gVMl9PY+D+VpPvF/9pGZmr817RlXynd5j/pT9s9pLA8SXbWF
 IFJr7NcP7nKgi/QvhfbnJZ5C6RXP6z26nL6lx9qXhqieBj3NMJuhkw3va3ukybyD5A36
 pVNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRUVEJmmz+YmRBOUgKN56Q+G/7CvRVcHblQqkxUmqFiTbgpC7kC8YVy6hvNKyl7NWrS/2bYfheDi+gB1y2Z4n3CFboQogKG5yWXP12SA==
X-Gm-Message-State: AOJu0Yww0VPjcO9rYU0By2bJr1B3A/ZrcisblUlGm7vut+0XXUdeWuvR
 bJ7C0I8tDoHRtLSQZGA36hfpcOa/7vrQtQwkymsoA4Y8XDPnvuY6sofHmscp22ZVohCX5C/+e15
 ekgyBwmqn0zkk+JQaUak9c81tTfFD3+FexeHc6Q==
X-Google-Smtp-Source: AGHT+IEWiF8dmPUqO+MUVzpDwFotNDbkSv6rqQebrqrFFAWqvUWEde+EB1RkSLi4dXNcJF3GY4kgFC/uaKR3DkS8eNU=
X-Received: by 2002:a81:431f:0:b0:633:8b49:f97c with SMTP id
 00721157ae682-652d842fd27mr19039267b3.37.1720105379294; Thu, 04 Jul 2024
 08:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
 <20240702-drm-bridge-connector-fix-hdmi-reset-v3-4-12b0e3124ca4@linaro.org>
 <20240704-jumping-saffron-shrew-d5f3b7@houat>
In-Reply-To: <20240704-jumping-saffron-shrew-d5f3b7@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Jul 2024 18:02:47 +0300
Message-ID: <CAA8EJpr69SoJFu0DMN0+Sk3Ayd7VQG_hPiy3MCfPnN34sR5ADg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/bridge-connector: reset the HDMI connector
 state
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, 4 Jul 2024 at 15:56, Maxime Ripard <mripard@kernel.org> wrote:
>
> hi,
>
> On Tue, Jul 02, 2024 at 12:48:55PM GMT, Dmitry Baryshkov wrote:
> > On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
> > IGT chokes on the max_bpc property in several kms_properties tests due
> > to the the drm_bridge_connector failing to reset HDMI-related
> > properties.
> >
> > Call __drm_atomic_helper_connector_hdmi_reset() if the
> > drm_bridge_connector has bridge_hdmi.
> >
> > It is impossible to call this function from HDMI bridges, there is is no
> > function that corresponds to the drm_connector_funcs::reset().
> >
> > Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/Kconfig                |  1 +
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 13 ++++++++++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> > index 1a192a45961b..bfd025f8c7b5 100644
> > --- a/drivers/gpu/drm/display/Kconfig
> > +++ b/drivers/gpu/drm/display/Kconfig
> > @@ -9,6 +9,7 @@ config DRM_DISPLAY_HELPER
> >  config DRM_BRIDGE_CONNECTOR
> >       bool
> >       depends on DRM && DRM_BRIDGE && DRM_DISPLAY_HELPER
> > +     select DRM_DISPLAY_HDMI_STATE_HELPER
>
> Sorry, I notice it on that patch, but it's really on the previous one:
> both DRM_BRIDGE and DRM_DISPLAY_HELPER are meant to be selected, not
> depended on.

I think they are selected by the 'driver' drivers, but they are
depended upon by the sub-devices. So all bridges depend on DRM_BRIDGE
(either directly or via the menu entry).
All drm/display modules depend on DRM_DISPLAY_HELPER. I agree that it
might be worth changing the second part (most likely in a separate
series, ok), but I'm sure that the DRM_BRIDGE part is correct.


>
> Otherwise,
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>
> Maxime



-- 
With best wishes
Dmitry
