Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AFBC3065D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 09:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1247810E5A8;
	Tue,  2 Jul 2024 09:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Eqp+PFbJ";
	dkim-atps=neutral
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B1110E5A3
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 09:48:59 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ec5fad1984so55373931fa.0
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Jul 2024 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719913738; x=1720518538; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eQKBE1FE4gVeE/pTxSlRLGb8qXFL4Qosomf5ec/NnUU=;
 b=Eqp+PFbJVgoGjaU9k04rCVUyUD/lSNvV9HpVfjw9C+lO0IX5VF3dUAP2ofPgayrah0
 /ZY3dDx+9/WATmWX/aZJ5tZu1QSV+LROS1IUfRBLpOiijvPLL2NAODzQwJFYx+9TSkny
 lGeeBHINqK2v4Oy0alfTG/Lm9L6iapBACQB9jfmlxxOa0eHDdbS84S6UV5uuuVuUsCd1
 VwyMBjEuQDoR/KR9CP0wBwzU/OibObUyeX80Io+hIaienhyHsNZKUHX5QdTcKYkWKuSq
 sMz2/sipJ06GJkiQbRQu29eFve1T/sdpVy6iCwmrCOWc28qeNoH7G/t+YdivfZvmVHu3
 XW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719913738; x=1720518538;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eQKBE1FE4gVeE/pTxSlRLGb8qXFL4Qosomf5ec/NnUU=;
 b=UoK3XJK78wNdAxe1cBNw0onFVkTaByIgTMGQS6Zwa/9rMGNa04+BFrGxptNEPehZ9O
 xJvA+/ixYUFga1uFA4f1SoT7BJM5PNa7zmOvllNh8VdK70uHlmpJttCc0yGT5TUR8Qbo
 dYeorlGVt4U4bkqD/iwhnsdoDj1D3+Lwi63yfccb+6TelOMwLugCqeQMfAR8VN5xHMQi
 giwpQkSOLVpvWbq65jC86WB0gRmQ2i3xxhNtrzAj7Mxl3u3TzvQuaLrmafXNLomujUcr
 ERkQAv9Y8L9i+6Z3T9BXPZDFulDCg7dMTmiGL4IV+OTuseSK+stUPwpY8kNkA/NTtDA5
 DwTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQiNSNQZs/m6zTr4Hp28Q/7iYwlpQP/gKFfDyzA4tUjQZDg4/3EmsQRWKt7czUMZ/Y4vYdze92buJffKeJEpLTKXnjQqe4ezzJODF2oQ==
X-Gm-Message-State: AOJu0Yxavye9TxJYL4FSrWGaYf4d38TVX1XKXc+WWcTi7UxGtldy8wZO
 ZqQTA20dnwYDh6zNkxxKMKO3OiYCfxbPeYmvaghEvNzVFZM21GGP3IQ6ux+LzP8=
X-Google-Smtp-Source: AGHT+IFqBUb9Z/lQB5tnnDyAQuJJOp+uTr+Pgp7gBda/3vOoSNPxzuipgShTPcGYxiszIB8CQWowdg==
X-Received: by 2002:a2e:a78f:0:b0:2ec:4e99:92 with SMTP id
 38308e7fff4ca-2ee5e3c32e9mr78874021fa.29.1719913737970; 
 Tue, 02 Jul 2024 02:48:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5160e333sm16231161fa.5.2024.07.02.02.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 02:48:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jul 2024 12:48:55 +0300
Subject: [PATCH v3 4/4] drm/bridge-connector: reset the HDMI connector
 state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-4-12b0e3124ca4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2314;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XfWO1UT95i4nFh6ks6YHBz3BepXJnrLcVKL7lmB6nak=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1rzWdb9r/6I6H3gyF9qODH2lY8y17SPBf1qHDLNjUucT
 kuIepl0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAin5nY//B5XWtTEbstXeAl
 e5cpTPjg5Bv6mSzbxX8zL5dOCQsN9w9VU3yc2/Bsbu603rUvpjwq1D/43/h+ppPUa84AowTVN1x
 7bl38cu5UDd8Unw1/7nEb9q5ZZaG18dzsRl+usvX+jK9nnrizbGp+wfsoo6q9IsXLtBxcTUx7Ty
 j4hBdPe5iyu4rjTra+//LSHE4pI7v/af0tD3JNZaPUnjeYrvbssdi2KkdM87eDq/OkWdqPLkidL
 QrZ8u7jm5yX5x7O/ML992hwf8KVD54zrMK8pBtqm2dMPP5hgdPZ9nrujPS3bHXHPXucNgnKGGmF
 trMfWP7HXuCEqdek/ki3yxsvLF1st1dQfs/ST30WWfr+AA==
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

On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
IGT chokes on the max_bpc property in several kms_properties tests due
to the the drm_bridge_connector failing to reset HDMI-related
properties.

Call __drm_atomic_helper_connector_hdmi_reset() if the
drm_bridge_connector has bridge_hdmi.

It is impossible to call this function from HDMI bridges, there is is no
function that corresponds to the drm_connector_funcs::reset().

Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 1a192a45961b..bfd025f8c7b5 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -9,6 +9,7 @@ config DRM_DISPLAY_HELPER
 config DRM_BRIDGE_CONNECTOR
 	bool
 	depends on DRM && DRM_BRIDGE && DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 0869b663f17e..7ebb35438459 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -216,8 +216,19 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 	}
 }
 
+static void drm_bridge_connector_reset(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_atomic_helper_connector_reset(connector);
+	if (bridge_connector->bridge_hdmi)
+		__drm_atomic_helper_connector_hdmi_reset(connector,
+							 connector->state);
+}
+
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.2

