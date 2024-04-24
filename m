Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D5FC19F4E
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 20:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FAA1120AD;
	Wed, 24 Apr 2024 20:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Dd9wq/kA";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC9B1120AD
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 20:13:57 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1e651a9f3ffso1695755ad.1
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 13:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713989636; x=1714594436;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DaAieBorHfhLSKjq+hgMOw9pRaPaw0j5H+8Of6HXicM=;
 b=Dd9wq/kAXhGy5p6NIsyRTekyhM8kWh29Kv2yRXM+ur1Jn/hDbfziK4RYmdgtUoHLNJ
 ehCdqQuQgyJUQ1cMDr1kA1suQYqU6VDYP+X7TXkFSF25hjGSnGJkrppEbGcoWezXHqV8
 Sj9IdGGVYsHL7/HIPhd/XcS0+qApji235WXSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713989636; x=1714594436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DaAieBorHfhLSKjq+hgMOw9pRaPaw0j5H+8Of6HXicM=;
 b=QNw6JCQiq4MMW1aGZNE1LMMOnTkIBp983NpXvi7ajt3Yxt5N8gEzCS4IJ9FPj5U8F1
 RS7g6sWgOWhVZQ1wHcmcXHK6VOZc/Ccqem9n268hsjczAx0WunIRhQufIhK8wj4bCX4J
 YRcbh3EZrev05rV0TD4yKz5V+GkNhf8MFM6CK8G4AdDzXsFLyZ9hJ2lOn/nwvTCXvJfW
 jsH2wvK1RSV9LX0tfB6yEZa2nL+u3uW4SHQT/OpVJa3qjCLa1iPbE+0P8KwmQcMxV81j
 CDL0s8zcgk5/IGDFg47dN65QFNlQnH2ih+sQbcJhe6obak8ftXoDZCE5BSyQxZeKimAA
 k95g==
X-Gm-Message-State: AOJu0YwSCb6lQ5z8cYS9E6vZDQW0QqkorTZ6GOTrrD5GJJwe2cddGdTN
 jNgHKbVm3Ptg5KMloxZGkJ7qjAMbKHtMkvI8UcmA4GjaID2HssSj37C/W7v/TPNsQiQm9udPqkU
 =
X-Google-Smtp-Source: AGHT+IGjtOG8EgRQWLos4lCvOJnkO56rIK0CcV3JOob2ANwIGD6Z/gowUVtGods4bQX2hp1JMh3BaA==
X-Received: by 2002:a17:902:cccc:b0:1e4:7ca3:8a33 with SMTP id
 z12-20020a170902cccc00b001e47ca38a33mr4192509ple.17.1713989636130; 
 Wed, 24 Apr 2024 13:13:56 -0700 (PDT)
Received: from navaremanasi.c.googlers.com.com
 (219.29.83.34.bc.googleusercontent.com. [34.83.29.219])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a1709026b0400b001e81c778784sm12280334plk.67.2024.04.24.13.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 13:13:54 -0700 (PDT)
From: Manasi Navare <navaremanasi@chromium.org>
To: igt-dev@lists.freedesktop.org
Cc: Manasi Navare <navaremanasi@chromium.org>
Subject: [PATCH v3 2/2] HAX: run kms_vrr tests in BAT
Date: Wed, 24 Apr 2024 20:13:44 +0000
Message-ID: <20240424201344.783935-2-navaremanasi@chromium.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240424201344.783935-1-navaremanasi@chromium.org>
References: <20240424201344.783935-1-navaremanasi@chromium.org>
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

Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..53a364ae6 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -129,6 +129,7 @@ igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
 igt@kms_psr@psr-primary-mmap-gtt
 igt@kms_setmode@basic-clone-single-crtc
+igt@kms_vrr
 igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
-- 
2.44.0.769.g3c40516874-goog

