Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C01CD3439
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 18:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6413F10E562;
	Wed,  6 May 2026 18:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SxssdqTK";
	dkim-atps=neutral
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870A210E044
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 18:50:08 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2f30a4601bbso21753eec.1
 for <igt-dev@lists.freedesktop.org>; Wed, 06 May 2026 11:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778093407; x=1778698207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vEQfSo35EE2O+SfFcu3dbOY54pNp0Qop+XKgZfsk0y4=;
 b=SxssdqTKHB5ZOL34XhUvNJiuP3/0l7y7GQ5QBV/vgSKpae11B6Yj3chnexMGXt1GGw
 USZwQ57CfxyTZV+8WFcnzoLINNZUoQnWxFtcgxxu1b1AgYmSy46KTIghwOBW933GkOzh
 5CDweNegqq0XoN9Vkanu2Fya4OftzA2fTSU1XTAE4bkzsjDyXH53nqxs13eu0xCAXiw0
 NdVP9ieaf5SNxuwsdZ0slajokqV5nrspvYk5RO5Xydgqtu7zxXW3U7E7eEPly3qcn8n1
 AIShdvmUrvXb/O7OTTGQ0yjRfvDUliy4tnEyV6Jv52ndlPm6CLl8CPQFo/tArN/X7vWy
 aEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778093407; x=1778698207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vEQfSo35EE2O+SfFcu3dbOY54pNp0Qop+XKgZfsk0y4=;
 b=hmy2gDHAkvQdcMX33jocMNkT5xhagQ2VjSUh8Aa9/Q8Ec851ofRY40LrTV2laSMhi6
 YP2PeJfnbC5JO9inbKbi8wyWG4x/sLa5/hCIPk0Qg4j+qaZBkvBnfLdV2UancTw4rSMZ
 981f199d9/CTV7pJg/JjT2KoRUeXQPjUrisetrdlNp+0nWrNpBaZkKiRV2SzhUOF9Q3l
 2yeddlk82OqxDSQfsvUwNbiC6h26zfs9jP1dRIhJafAcrGyL2WEFxAitLISOPxUdI7gl
 YfwTPdchbXoaPLwhNBNa0z4huhXMsP/ReYA0WkIZO+G7bVyzyDzo9uwWtDJcsTyifnch
 krVA==
X-Gm-Message-State: AOJu0Yx1XmlXY5hhePeSVqqF+sV8XEtvupQoAlVZo+/8NtWaTAA0ipOe
 I1Zl8uffxM3XX1M0saOEa32If3vCbeVefOteOprX0rjps1t5xFjp3cA2rBu+ISEy
X-Gm-Gg: AeBDietmPS5+kiwWATekbaeuPgsSVK38slzJFvcV35Ba7LqrMPd27YqMAdTwW+fUAkK
 jZep6ANcIu2AvLmAtnBhFFCJTkQqaMRQ4e7m8PU5TZtcrfBWtP7mfWA8VavWt+cr9Q6nCo5FzBf
 WfILWhoRRUcIf5tRGWWEgylVGp4VIkxFmvBMMOnSfUxrGQJfuIu1sdAvyZuG6r4FXaRgNzMQiMQ
 pkoHvHw6gIB1qTBS+VslVuAsz9J2bKK+AKRxnhA3KM73gzn5xkqoVUgqvVLpfjUN0I6pGJvuO8a
 h87O4B8yykjbil8Xf0PKZCqFNtsGhpCc6Qsi0nITQ/5arDoVZdzu+BC+veQo6brbl4NXrwklRjB
 /GC4GJ0tfKHBEToEXvESNUXk/2K2MRNVdWt1Rkrq2VEjRAAdehYpMI39lcCTZeC2pVpTYDiFo+i
 yolGXVd70BoYiN3ZShOtLe3HBbreAMf0asrjv+XY5FPJdxl3IicNIstwaxbcaisDEiYDXJHw==
X-Received: by 2002:a05:7300:4313:b0:2d8:b814:29af with SMTP id
 5a478bee46e88-2f54b89a0cemr2420781eec.3.1778093407173; 
 Wed, 06 May 2026 11:50:07 -0700 (PDT)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2f57028b991sm4186298eec.25.2026.05.06.11.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 11:50:06 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 0/2] kms_plane planar-pixel-format-settings
 restructure
Date: Wed,  6 May 2026 21:49:34 +0300
Message-ID: <20260506184936.76492-1-juhapekka.heikkila@gmail.com>
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

Here restructured planar-pixel-format-settings test into dynamic subtests
and put back in place requirement for Intel hw as all those tests are
testing Intel display engine specific limitations; there's no idea in
running them on non-Intel hw.

Added new dynamic subtests for found corner case. test_nv12_tile4_src_y
subtest will fail until Vidya's fix is merged for the issue:
https://patchwork.freedesktop.org/series/164739/

v2: Vidya's patch is now merged to drm-tip so here newly introduced test
should now pass. Small cleanup on test code on Luca's suggestion.

/Juha-Pekka

Juha-Pekka Heikkila (2):
  tests/kms_plane: Restructure planar-pixel-format-settings test and
    make it Intel only
  tests/kms_plane: Add test_nv12_tile4_src_y planar settings test

 tests/kms_plane.c | 409 +++++++++++++++++++++++++++++++---------------
 1 file changed, 275 insertions(+), 134 deletions(-)

-- 
2.43.0

