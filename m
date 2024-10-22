Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58324D1CDCC
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 09:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B1E10E312;
	Tue, 22 Oct 2024 09:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DvCXm8xr";
	dkim-atps=neutral
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C4210E312
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 09:43:59 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-20cdb889222so51838585ad.3
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729590238; x=1730195038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uWkEbL6S/+Gwm+pp8cegPX/UIOwNnCTmaJMRrC8eroE=;
 b=DvCXm8xrM50TLCZ0pqYfKk8d18J5RRtm2mXkn9Eb6K8oanyNEX+y6mkyp9LKoPHgB9
 EMuvIkhRNLx7SXkcvd5qgpsdL4LiXdXq0Bz+/39ZGGShpN3ltM/vWMDhsuFlgQVMCuii
 pqob9H2Ogh6bsGBuOmLia/3tBlzKvGuqZZcNNCe0AEkIg+ih+qGtKfJx3kbw/sf/C1qV
 tXLoUU1/8WluOh1nCPKAYpHMSDyed/kbZj8TjMeCMlE20ckmIMkiAVL/aDZi3wLj2x9P
 WxJM3BmL/n8xKeB4DG12YXakYciRrbP4oaza9q5bWKUQeSBotoJ+8E3B5+CtPGQoa/+8
 Y6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729590238; x=1730195038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uWkEbL6S/+Gwm+pp8cegPX/UIOwNnCTmaJMRrC8eroE=;
 b=LzXr8BJEQSKbE8CA9eTDn9BuuJg4sUHTAAyTnX6NvYDi0rbjz5CFq60CgPzGqkGD6L
 6eHEbF8eE7P9JHXIutlycyT3i4TSC4eNxkF25wgroWakeGUu8lEk48D+l3kaynCEA6fY
 rCMThz1BJ5vdZmU8Au2To9PNRRAC4RSg6K+furXjXm0VuSG/QANUu2SVNmFExf/Da8K3
 squvs3r39RldXbZELfuOrA5T5ja6SxDuaBp+IYzOCZ0JlkvLdyIAC00tJYC4n+x8kdTB
 7DPhhZzJm+uCkgvzfZ5Dhja6LMyRA6oxOAjYtkRM+TtiCIz0Vo2O8RJYfaPlTm3yZkwK
 3RKw==
X-Gm-Message-State: AOJu0Yw6iIqIpQ5lN8bUTU0ZZYhYT9V8t00b9Qcxbz0QCPBcG+VZwwc2
 lpyjFajWnNA1BCkL4QE1Pd20hOJDC6C9rcxTG6dPrTWgaNyQcYdonE3ezpzh7kk=
X-Google-Smtp-Source: AGHT+IGOfcXyKHxGIbqCsDqTLHZBligdf2WtHTys0T1IVDzkKqw2HZ2+MuntZ4Pc0X7ibAY1HFjrrg==
X-Received: by 2002:a17:902:fc4c:b0:20c:b876:b4eb with SMTP id
 d9443c01a7336-20e985c2e54mr23295845ad.59.1729590238302; 
 Tue, 22 Oct 2024 02:43:58 -0700 (PDT)
Received: from localhost ([192.55.55.46]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e7ef0e1d9sm39281285ad.108.2024.10.22.02.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 02:43:57 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_rotation_crc: Intel display version 20
 onwards doesn't do hflip with tile4
Date: Tue, 22 Oct 2024 12:47:44 +0300
Message-ID: <20241022094744.3884409-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Intel display version 20 Tile4 no longer can be used with horizontal
flip.

Bspec: 69853

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_rotation_crc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 9888ac6ac..d4a1c91cc 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -639,6 +639,14 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 			    !IS_CHERRYVIEW(data->devid) ||
 			    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
 
+		/* Intel display version 20 onwards cannot do reflect-x with
+		 * tile4
+		 */
+		igt_require(!is_intel_device(data->gfx_fd) ||
+			    intel_display_ver(data->devid) < 20 ||
+			    !(data->override_modifier == I915_FORMAT_MOD_4_TILED &&
+			    data->rotation & IGT_REFLECT_X));
+
 		prepare_crtc(data, output, pipe, plane, true);
 
 		for (i = 0; i < num_rectangle_types; i++) {
-- 
2.45.2

