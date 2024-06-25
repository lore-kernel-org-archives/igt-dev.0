Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFAFC2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 06:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0378E10E2BD;
	Tue, 25 Jun 2024 06:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HBmvyyzK";
	dkim-atps=neutral
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CA710E2BD
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 06:21:39 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6454660553eso16641767b3.1
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 23:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719296498; x=1719901298; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E8h+QAt+AnCIi8f4bWuVBQN+cusYRxI2Lf5DdexkiOQ=;
 b=HBmvyyzK4s2wYREQk8ztuuVWDhj2lve8IxcxL4A+nQ8ZRlTXbnU+Rta6F1r18uHn+N
 aRVRr8uaZLoM0AtpMGfgm/FIJjPBMTdqyKxa8WCumRJRQkMaolRNX8T1NzjRKFQ0UY6T
 4sv+XYJ1Q9AZEk1daZAyyKPd4SRjye6z1V/9gC7BIDUDsYR3TIgwYpoJ7cjKeld4kK5J
 t2MsFndhyIqnFhnhz0shjfw5OGqbPqQqnKAdJ9lbAJS7ysDLljy4DQgXGIsixor22ghY
 G5nthRhNlY5B4SBOCduvQbw9gxgLvntsIPZyyeWPdrd8BhvHxdWr5HPDeu7FiNSW63Jv
 W2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719296498; x=1719901298;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E8h+QAt+AnCIi8f4bWuVBQN+cusYRxI2Lf5DdexkiOQ=;
 b=VoS9jR6HWt1py3akhg3JQJJ71ytLv/r+pP+B+0yQv7+z+DWKAV7o6lhiLpu+R16KQR
 VfrRiZGsU8Q2A/twJkNfln9PemiHeBvWzVvNYC3dWkZyNcnGYNW80dy+ZPIutsHALBdT
 u5R6t1RtZLUqvYXxLsy29ANJvKu2UmjhZ36dW7idw4qOUoaFCJ2hFkSRWosxhArzj0V5
 KklBaOKZl43sBiaGqANHCeHS+FGKpFqdiMQJvbJcS8b7g/v4KLz7VVfL2PnaGZcIvqFx
 NDMpLmCiHm5bIFTdON+rzfqB9V/VV8dBnLK1cFscJTJzKV/AUuFlX9Ed0tFfjTubDOqG
 vXqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhcCJrBvBy8MReoDBzkg3kZsjn+SpEhyJQ056o7sXB/05cX3P50exEmMYKyCsxPCAI5lfk6Ir09dpLHsT1ezamovuAWVp0SbULcxRadA==
X-Gm-Message-State: AOJu0YzmidlGRSepg+CBLF3+nXYNle8Ox96z9v3Np3WldYZmKnSn9GVo
 hTSxD2gOslExbuDAlJb485t4EshGqcWkLygABSZElugLqmXZGHYVHdGd1WC0lH+y1FMsFEASSOx
 oqAnQYv3WpGUhTgd6SMb25OKX1U72X7ZIxLo/7w==
X-Google-Smtp-Source: AGHT+IE+hPsnqRrxvUEK/lDnk62xZtQsZKqDpaowdgDDlT6ocbFhNfJnHF1nQyY0YgiVL/7XWxu0RPc4/5enaupC53s=
X-Received: by 2002:a81:8547:0:b0:631:8274:1611 with SMTP id
 00721157ae682-6433dd74338mr64895967b3.20.1719296498073; Mon, 24 Jun 2024
 23:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-2-8590d44912ce@linaro.org>
 <99ff549c-f5c4-dc9c-42f3-396dc3d29d6b@quicinc.com>
 <CAA8EJppcH-z275m6xDQaigsxmVhnfJkLVsq68GHLFoAq_p_2GA@mail.gmail.com>
 <30fa4e53-5a03-4030-2be5-f383a1c60077@quicinc.com>
In-Reply-To: <30fa4e53-5a03-4030-2be5-f383a1c60077@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 09:21:27 +0300
Message-ID: <CAA8EJpo_dBDqLUVH-SkufhFchu64rhC+vkhVBFdt++E4pdCrQg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/connector: automatically set immutable flag
 for max_bpc property
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Petri Latvala <adrinael@adrinael.net>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, 25 Jun 2024 at 01:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/24/2024 3:46 PM, Dmitry Baryshkov wrote:
> > On Tue, 25 Jun 2024 at 01:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> + IGT dev
> >>
> >> On 6/22/2024 10:40 PM, Dmitry Baryshkov wrote:
> >>> With the introduction of the HDMI Connector framework the driver might
> >>> end up creating the max_bpc property with min = max = 8. IGT insists
> >>> that such properties carry the 'immutable' flag. Automatically set the
> >>> flag if the driver asks for the max_bpc property with min == max.
> >>>
> >>
> >> This change does not look right to me.
> >>
> >> I wonder why we need this check because DRM_MODE_PROP_IMMUTABLE means
> >> that as per the doc, userspace cannot change the property.
> >>
> >>            * DRM_MODE_PROP_IMMUTABLE
> >>            *     Set for properties whose values cannot be changed by
> >>            *     userspace. The kernel is allowed to update the value of
> >> these
> >>            *     properties. This is generally used to expose probe state to
> >>            *     userspace, e.g. the EDID, or the connector path property
> >> on DP
> >>            *     MST sinks. Kernel can update the value of an immutable
> >> property
> >>            *     by calling drm_object_property_set_value().
> >>            */
> >>
> >> Here we are allowing userspace to change max_bpc
> >>
> >>
> >> drm_atomic_connector_set_property()
> >> {
> >>          **********
> >>
> >>           } else if (property == connector->max_bpc_property) {
> >>                   state->max_requested_bpc = val;
> >>
> >>          **********
> >> }
> >>
> >> I believe you are referring to this IGT check right?
> >>
> >> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_properties.c#L428
> >
> > Yes
> >
> >>
> >> I think we should fix IGT in this case unless there is some reason we
> >> are missing. Because just because it has the same min and max does not
> >> mean its immutable by the doc of the IMMUTABLE flag.
> >
> > Well, having the same min and max means that it is impossible to
> > change the property. So the property is immutable, but doesn't have
> > the flag.
> >
>
> True, then does DRM_MODE_PROP_IMMUTABLE need a doc update too indicating
> that even if the min and max is same, property will be interpreted as
> immutable.

Granted that I'm only doing it for max_bpc property I don't think so.

>
> >>
> >>
> >>> Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connector state")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/drm_connector.c | 7 ++++++-
> >>>    1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
