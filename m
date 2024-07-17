Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F098C3DA42
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 13:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D7C10E16E;
	Wed, 17 Jul 2024 13:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EsuHxOIH";
	dkim-atps=neutral
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BEE10E172
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 13:57:32 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ebe3fb5d4dso8604581fa.0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721224650; x=1721829450; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mHJbV+bzx4RI8mDOQI+N5X7vHq/DAFW5fyNCzOVzMjI=;
 b=EsuHxOIHOl3bmAbc2wORAjAxqQEUxQO9aBbJTnDnAhxCi+mqGPOOw73VyJH+rX13uE
 oJ7oFUB3QV8EOpapAkwAScMhQKAPTqkdzy4msIc1k23EXVrxHwpQ7fWxtVqmAwJGICcr
 b1IyFQQegsYI9T8NSf/beIh50gLUJVS7Il48sTjAanghYNEGxKXvwcUB5x3DMCFFDmhy
 fKA6L4oTgcxOByYne+xYpLhYEQj30eYkIXDiLvnU2znlZiV91+jeGcTbhThOjjrEie7i
 aHIvOoCH9A1PuQ5+Ztw/DKzyaPKVwZqe4z19HWHjfccB6+5dfLNC1JHuORREjFsSdQeu
 amiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721224650; x=1721829450;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mHJbV+bzx4RI8mDOQI+N5X7vHq/DAFW5fyNCzOVzMjI=;
 b=ExVr1L7XK3bUrdZWagiHXGrGD4zKevAzef8Tc3C69fcTpGNm2i9DnqUxlohbMHfvNE
 pQteBimfaSgno/in2mhhHTi7RjC4EuNbh0/oLjdT0DHOQrOUSOEe64CeBZ/sEfWFDax1
 XWg8aou2DeXNXn9I+2Dl3rzqrTy7bQSx5roQKXQpU350yTSIqxpUrkNsYrGAMy5nIq/N
 jvytBJ/ypEFXFA87HI2A3GqjYmp7YRyvCh9ZabMgRzxUQTjFD3sQ3M9wBIueDFZ/3Htf
 J39NUhiGWlZpuOZA0m0xl9urUU7RfNtFtELaaeK9qHhxnho/+XCToWKjb9bNuLEeZULU
 oQQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkGznfzRji19z2UzA997Ter3lW0bgShMmVDPe6z53f1VvR3NTOEgP98/1uvse/bRYYVfUMnpeWH+UejpLGEOlD514SyQy+rCKhcFD4lQ==
X-Gm-Message-State: AOJu0YxS/oB9Z9cwtDo+3L1wvaCqceBjdbrWpTBTZZwt1xiPi6PUAawo
 PfjeD9McXXP5o0GqctzaJLYw56z5dgQjD1/F0IrnjpV0QJWaLpfAT4yNyp5Pt94=
X-Google-Smtp-Source: AGHT+IG7iDrtCuBBKWvQaoQQbv/0kaeeUtziuz9N7l7vX5y+JvpROqU3u5NL1wFj8j7PpznoM4x7Ww==
X-Received: by 2002:a05:651c:2213:b0:2ec:1df4:589b with SMTP id
 38308e7fff4ca-2eefcd61dd7mr7308201fa.1.1721224648985; 
 Wed, 17 Jul 2024 06:57:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2eee19148adsm14501371fa.100.2024.07.17.06.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 06:57:28 -0700 (PDT)
Date: Wed, 17 Jul 2024 16:57:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/5] drm/drm_property: require DRM_MODE_PROP_IMMUTABLE
 for single-value props
Message-ID: <gbcunf7zmafn5z76mrlgldmsy74s7e6jacv53mgpym2l75uq6h@talxrisbufsw>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
 <20240715-drm-bridge-connector-fix-hdmi-reset-v4-2-61e6417cfd99@linaro.org>
 <20240717-bouncy-horned-mamba-5691b8@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717-bouncy-horned-mamba-5691b8@houat>
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

On Wed, Jul 17, 2024 at 03:42:46PM GMT, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jul 15, 2024 at 09:33:02AM GMT, Dmitry Baryshkov wrote:
> > Document that DRM_MODE_PROP_IMMUTABLE must be set for the properties
> > that are immutable by definition - e.g. ranges with min == max or enums
> > with a single value. This matches the behaviour of the IGT tests, see
> > kms_properties.c / validate_range_prop(), validate_enum_prop(),
> > validate_bitmask_prop().
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> We had a discussion yesterday about it on IRC with Sima, Simon and
> Xaver.
> 
> https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622;
> 
> The conclusion was that it would create an inconsistency between drivers
> on whether a given property is immutable or not, which will lead to more
> troubles for userspace.
> 
> It's not clear why Ville added that check in the first place, so the
> best course of action is to remove the IGT test and get the discussion
> started there.

Ack, I'll work on removing those tests later today.

-- 
With best wishes
Dmitry
