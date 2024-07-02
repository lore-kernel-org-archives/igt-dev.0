Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5316C3065C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 09:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E732B10E59C;
	Tue,  2 Jul 2024 09:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bjih1vuk";
	dkim-atps=neutral
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B882B10E58E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 09:48:56 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ec408c6d94so40736921fa.3
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Jul 2024 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719913735; x=1720518535; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=grKYh+BySNj5dd16DxXRdwU80BL8FOK+kLgksXgznTg=;
 b=Bjih1vukAyVx50HcJBIJLW/wzZMdUi7HVC1AdK89rpW96FNMgPpBGx0S8QU+Km+N89
 7zRESZ9gYmegGv49a8+LsBSbqb91v5ZRzzLe3Ys3Rw2AbmUes+nhNHv1YwjDGfsUe+3+
 OdUenIlzdU4uGQYSUjUJ5+4VMY0xuOchb+c5rT0hrksAsm4zgmNbeC872LaMIp/sm1bc
 AXm8/f2tsDX1gnQpsJChb+otAeWgVOonBKOu9U/Co1U8uNGaJftir7zTFPBhVyQJ7AAO
 uh7Vak9EVuCRys5VFkVlXr7aOw7VlJKD3Rlr07eXfKv7J0epJQBtamUhvTzn/Uzis3Hm
 3F3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719913735; x=1720518535;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=grKYh+BySNj5dd16DxXRdwU80BL8FOK+kLgksXgznTg=;
 b=OAc5Dj4uA+SsGmmPkh4yB0n8NaHgmgim45jxWc+uhp8QtJWiIF4ypBtGWRCwGop8Bc
 JEVjJ8lGjg8dPv8ggoWc+XEs880O88FSE7Pr9L5Ai27/NOXCXLMO/GqQ4ShoRirdZUB2
 2ZB9Y/IMovFko/q6PuRLcw7YN9t+n1AUDsQS+GZ7Ps8TishK1dDY6e/BoOMr/Jtjigmy
 vJ2qh4Heji+NJvnXlEXkuKGv2GQxyU47CrRBHBw0byKllPxxv8P6SRz9iKv6gEB+rRWK
 Ku2zb7FlsNF3wJJWTNcEGKhUaQvZDax0/GGHmDfXMKjpuXxR3+C42Xj2KlM5MwZkzRoH
 aUpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTy3J+TO8Ex1oCIrN5Emux6KHlDQYiJO5/wLbPcN/YFHor9WMQsL7JK5yvqGhKjpSfdzmYsAJoQ5PYW6E0zDvtXNnDiW5s7KiHfJSNDg==
X-Gm-Message-State: AOJu0YxtNltk8YBTLDQbHC9scuob6TDGvF3EDKyTIppAp3MB/cWLs2RL
 Cw1KCRWHjRuNS3im+3eXwJ+ye1NS2Cn0h3HImQkYIX4E/yRpP3+Dn524UrBg1HU=
X-Google-Smtp-Source: AGHT+IEHYPqBRlSa4/s9XNTLhrSpJ2d7hL4YRvX3igF6c2N0POyPLUNHv3ogsHuGow9fTT7WHEO5lg==
X-Received: by 2002:a2e:a9a8:0:b0:2ee:4c66:6828 with SMTP id
 38308e7fff4ca-2ee5e4bb786mr66677251fa.24.1719913734882; 
 Tue, 02 Jul 2024 02:48:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5160e333sm16231161fa.5.2024.07.02.02.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 02:48:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jul 2024 12:48:52 +0300
Subject: [PATCH v3 1/4] drm/drm_property: require DRM_MODE_PROP_IMMUTABLE
 for single-value props
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-1-12b0e3124ca4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZHzhL2qDJx6VCsIqQPH6DPvSD0dOn8r7tcbnzboUaz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmg80EWZj1pah8UzMX2/G4UNqFRNqb0JlRO93Ms
 RRkSO6Hv/KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZoPNBAAKCRCLPIo+Aiko
 1Q1+CACxdDwVSgOIcrD5yaAYfHuWsZQlYwFDxYyvGJAOp18OWx0WYgryw6qDB4Kv6Am94YL8chA
 rzWgZDP7Fh4hmHGMQfPYqu5jd3h2jA45NJamjWWdXMWmVzFsrHBIlr/MqN4K+c1mcW8qAPM4Aut
 LQkdGUHQ936Kwhec384brroKfge+MO1h9dgB7wxbVvnPQapQTOibV0b3aISdjN8fkI/SBR5WEKE
 61amWsXJ1hCW3zNZuGyFOepos7d/6vkL4gaCQ3svBPeNQPYHOxjH2EpaiW3Nmeh+x2C0+GhnVEV
 a/WFgjPVG7wSHgFk78J3uoewD+jjE5VNy14bP8PoznvUJzhS
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

Document that DRM_MODE_PROP_IMMUTABLE must be set for the properties
that are immutable by definition - e.g. ranges with min == max or enums
with a single value. This matches the behaviour of the IGT tests, see
kms_properties.c / validate_range_prop(), validate_enum_prop(),
validate_bitmask_prop().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_property.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 082f29156b3e..7d0f793f50ca 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -162,6 +162,9 @@ struct drm_property {
 	 *     userspace, e.g. the EDID, or the connector path property on DP
 	 *     MST sinks. Kernel can update the value of an immutable property
 	 *     by calling drm_object_property_set_value().
+	 *     This flag should be set for all properties that have only a
+	 *     single value (e.g. min == max or if enum has only a single
+	 *     value).
 	 */
 	uint32_t flags;
 

-- 
2.39.2

