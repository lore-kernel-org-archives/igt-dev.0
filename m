Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1130ACEDD93
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 14:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CE910E4CD;
	Tue, 18 Nov 2025 14:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hpa+QG6R";
	dkim-atps=neutral
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2261110E4CD
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 14:33:15 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7ad1cd0db3bso4743060b3a.1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 06:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763476394; x=1764081194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VsKI2MhbbIlW62Bckod3Xij7VNofc9iGsT+YZ4ucGws=;
 b=hpa+QG6RBZVrRrHjCMUDHmf2cBBTSef+V6jgMkP3WRLfl6gDhmuE629Ge91EUnZ2R3
 37OAdP7uTPeHIDXPvo3vQPK9+ueIr622qDrKZQ22dU9W9tjdEqsUiu5Bh8j7YUCcGUZv
 h0Uy93zKhUpghRTrk/ECGCfvtU2KW6QIZSS0fOkij6HNA8rBtiWsHJbMFPIggfTFLg8Y
 xiILFfDnmLkiKo+Udzk9Ama+FxvBNjJzGbysqZ9pFi1w/+6NwwBNzFXacY/mHiGOZz4O
 WD74XgO1c0ubFpKyHARJR2KN2ocUaOj/hUb97HS7jmEay4KJU5fvBzvLVnRcpOV9CsYf
 3Guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763476394; x=1764081194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VsKI2MhbbIlW62Bckod3Xij7VNofc9iGsT+YZ4ucGws=;
 b=fLCzA+hmilmMnEYOmQ3LgWgVx1ZWrwNcn1DsoW/dQ85HJ7huE+Klo76WNDRsn00ir5
 JyEsc5DdPwOqT0ctHb4KPhbiyFaSHf5BRhnpc9V3z94fcT9iD689GQIOViEwJaTULHJK
 eXc5iuOPpkCXMVyfv0a74ZhSIvYV1sjpbD3aU0t5P8K6OzBj5xUDbguIgkxbuvNeruEq
 nNuQ7vcb1p3EEWmJY3S8dJgBy1KyR+mZyXmdoZSmqTC3wehUT23NhsOjB3h3zbOmkyRS
 vsQOzBW3wGUzj76z1m5rDi652s9oOLKAH3+7cKTfmYG3wq9dL4xZUBECjzv72cPS8W1x
 cNrA==
X-Gm-Message-State: AOJu0YxXVE2EqGpZT0G4vdNffyE5oF8Vsnc+Syn0/ywC0FX91rzf8x9y
 GaUz9Ihrlpg65kwaLU1fXS14K3vX5gzQV0rqdeVCmJUrgUaZPTd3pHkeKCrToVXo
X-Gm-Gg: ASbGnct42TTeme22VnYp6o+/6iJvrPx8XZ4U4C6rOcAXyJ42nwc3l7QIOwj8ye4Ya0a
 mdVrHe6P1e+STmgf0be0nynuTL5raqidBMY8FO/kX83fultDmwJb2bsTF1UHaouUT4L3MypsGa0
 Wi/E4HJecxFQpZu9OuO/nsB4XIBP3ATL9/58kdeBgGRLNWdjg6T5nAikegAPehD6iLF2HVD9gQM
 yTuttQeBYv1dBwaiMoFtJQwk3FR3bG0wpK8rofHIhFEdpQx6w8QZn4PE9hzPe8DH/Uy/bfr2Vze
 iB1k6czyp0PItd5HEf4TKRMt5kRQ31Za6GHQl5bfuyDGX76rLkoWXJh6HlO01rkWlK51AXRHmxj
 53dyUOiC8RmI/X1po7D+gcDac0dmgXVxJ2VP4milNbIgOiHCB2M4KuaVuo+ZKE50XwTCE25SKFp
 Gv2TH4
X-Google-Smtp-Source: AGHT+IE2n4eTdhTxmWkUClPSL2kL9zpO/tzd1V5iYfbw+oCjFzivykwAbeoXfx6Y/64O3n+USSnwFA==
X-Received: by 2002:a05:6a00:2405:b0:7b6:ebcb:51eb with SMTP id
 d2e1a72fcca58-7ba3ba97bdamr21822759b3a.17.1763476394151; 
 Tue, 18 Nov 2025 06:33:14 -0800 (PST)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b924aedb73sm16628380b3a.12.2025.11.18.06.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:33:13 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/2] Switch to use kernel standard fault injection in
 i915
Date: Tue, 18 Nov 2025 16:32:51 +0200
Message-ID: <20251118143301.510707-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Here added fault-injection subtest to test kernel standard
fault injection mechanism in i915. 

Much of the meat'n'bones of the test are cut'n'paste from
xe_fault_injection test mostly written by Francois Dugast.
Will later need to see what parts can be moved to libigt but
for now it's outside of the scope of these patches.

/Juha-Pekka

Juha-Pekka Heikkila (2):
  tests/intel/i915_module_load: Add kernel default faul injection tests
  tests/intel/i915_module_load: take out reload-with-fault-injection
    test

 tests/intel/i915_module_load.c | 368 +++++++++++++++++++++++++--------
 1 file changed, 286 insertions(+), 82 deletions(-)

-- 
2.43.0

