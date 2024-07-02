Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D8DC30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 09:48:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E0010E59D;
	Tue,  2 Jul 2024 09:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tlOmttAt";
	dkim-atps=neutral
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D0D10E598
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 09:48:57 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so40264621fa.1
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Jul 2024 02:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719913735; x=1720518535; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hbJUOmvW24quAtGM4HEWCKTnos6XbtfhPM+nK5+e2Tw=;
 b=tlOmttAtRm/muqrq+pwH/Al8VmW074OPO62xbDWneG4Xou592I/ydnFW2LK+ANn8pk
 ShwafTvEuO9QGRcvrmYIkEd0DdhjqTiUzm+kmweHQ9WimIopAE/YA2AQfxvCq9fh7UN0
 aN/pNOhK1ZEI4VUBrNB4HLheBhVu2fUp4Vh3E3DafD01IHZ5CD4G9PxfisHZ7BMquVK5
 7iSYHaY5pDGUB8ceyOppIwnpMSRSALRJ4nGBObplLkTVnoQcm7mRB2R7oyleH9kQSIkM
 0Qfv2Htssni3tpnzLGuX9tC1y3BYZVkFH5RgXBhWbKzs1DjcHqPMzlDKphe24rtALBWZ
 0Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719913735; x=1720518535;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hbJUOmvW24quAtGM4HEWCKTnos6XbtfhPM+nK5+e2Tw=;
 b=FXlMqY3DntA+YRRzZa4QAPJaltrLWROPxSsAeK4JppFhxdwaHAa+wXOsgbVz/OvIlT
 RuskCbSCK/cfXcr4VzNloYxEUv0CN6z7Pf1gtDJQgZKnjgDDG2pC2mCyM9xSHnZM16R+
 QzwXfGPiNJlxHM6nwuSed92T3sD/2NkCDEsW69Qgb0hrHJ48DNwjnc8qk7WADmj2Vl2m
 1cpT4t2g06jOhrMjrM6GLoa2DckRBfB+5Ancj2/S+FCqlHiwEqReI6PRyMWB/iIC0DLt
 bhd5osEcST96xXvNBdPRONaijou83zmDL0YldD2jRDDcKoTUL0aYl5uNIlfCy4brTFXY
 2Y6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9OoTxjyBYLWFLR3996wLTotjZq1L3JXcD/R88/Fkz5sHp2H+8m1txT79sSQKUTsMAOnH6lEJoxPvUgrtJCTAxlg267V3oEWM43CMwug==
X-Gm-Message-State: AOJu0YysYY57Kci24dSNAtFvRLQ2gYg5cPvJJOTeoZIhNOkd9ZPlBVUj
 Gxed0535tXi1OoVhmD4B7XEoWO8y/QE6Q7GyM+SB/i3V0nnmMkduG1OJj2QMGZg=
X-Google-Smtp-Source: AGHT+IGfmdHB+8edC65CU37es9H6R49dvRUzRUlXwIzKM7NUfhJMiOkS6U7fLphVNhqcxMt5+DlouQ==
X-Received: by 2002:a2e:b53a:0:b0:2ec:6cbe:5e4c with SMTP id
 38308e7fff4ca-2ee5e4c38c3mr48178251fa.26.1719913735592; 
 Tue, 02 Jul 2024 02:48:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5160e333sm16231161fa.5.2024.07.02.02.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 02:48:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jul 2024 12:48:53 +0300
Subject: [PATCH v3 2/4] drm/connector: automatically set immutable flag for
 max_bpc property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-2-12b0e3124ca4@linaro.org>
References: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
In-Reply-To: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ogj1qgSBFy5LiaMGrph8HSRVcootU6FeEO747BTFj9E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmg80FIFlpwZSuAMcVaex64ulawWVazh4lwSquc
 qTrBGjVLnSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZoPNBQAKCRCLPIo+Aiko
 1ZPXB/9JSHXBoeLLdgKIA/GlpIadryusEgR3jFySCJuDELdNN4OuXdoem3dSd9kjIC+JcMsHNNF
 I0fK75E2EybrRE6uduTV2Z7e3+27bJvncgqo+vguR701/L5k7SQ10eqZ4FDg702uh9jSg635tsB
 0sYf7ed+6tCdPoy7PrfIWzke9XSTRvyh6pcqDgJIX3f4cXnKnBJzk5QIrQPnghLIwS38Pw9PXW5
 /F4+fMCjdCYjVO2i4L6ZfF5b9km3s/i6agBdI2/h6nOuaW+mh24ZOOPhQWhPu3olMMXl2W+3RSL
 t/HhQjnpdsmUS7Tbx2PKaDZWepo+M9RjijPg5dCK8NdkCJqE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

With the introduction of the HDMI Connector framework the driver might
end up creating the max_bpc property with min = max = 8. IGT insists
that such properties carry the 'immutable' flag. Automatically set the
flag if the driver asks for the max_bpc property with min == max.

Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connector state")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ab6ab7ff7ea8..33847fd63628 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2610,7 +2610,12 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 
 	prop = connector->max_bpc_property;
 	if (!prop) {
-		prop = drm_property_create_range(dev, 0, "max bpc", min, max);
+		u32 flags = 0;
+
+		if (min == max)
+			flags |= DRM_MODE_PROP_IMMUTABLE;
+
+		prop = drm_property_create_range(dev, flags, "max bpc", min, max);
 		if (!prop)
 			return -ENOMEM;
 

-- 
2.39.2

