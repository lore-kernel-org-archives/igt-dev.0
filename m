Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993F3C2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 19:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594D810ED2F;
	Fri, 28 Jun 2024 19:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="T1zK3wfM";
	dkim-atps=neutral
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8477410ED2E
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 19:02:50 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4450187d3d4so7318631cf.2
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719601369; x=1720206169;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ElpoONM9B+aZzzdtKpRZwqQQebnnKBW3JEZ4x5j9+5Y=;
 b=T1zK3wfMEuDVc/hUEouJNjhBNU/5wZ+xxngp+OvZMCKOlzMzbzMSWBx1deFBbanRO0
 vjfkOo+tIkRY3Op/HBGpDUjDZE+yk5fRf7nGx9aAXTYIdB8jKobUFq0MTJ5ZDI+X3SLX
 PzOmoWl6aHh9j5qeJ71LL3tSTU7Vi1x/IVIsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719601369; x=1720206169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ElpoONM9B+aZzzdtKpRZwqQQebnnKBW3JEZ4x5j9+5Y=;
 b=Pg2tr/SB8T7XLNPCaEpYKqfqzzTFYJIoOK/MPO4BnlyJDVMY6UP0JS6tRiFZxm9F34
 b7rxNoiMrt5eajwo6ywbgKyeXKaUwQaYQs4jCUnyIICGgt9JiYJx3j4SnWegGvEGG+84
 CPIT4L/CL6zvYllvNB5+Mm0XEEkP1HSI8tgoK5NdMWvPsZGRFa3tMsMTVRfawio+YW0c
 jFi9tJnovrVNe7eVTiBnsnQ45QU7OmCsYSg0tyi8EdwQywkIQ1svkQ93NDwMkjXIgpAd
 0knBi0xSrWPRj1gTw7ulbaLt+ymnq9Ut56CEtx8EzVSqrf6lI5FwaDwEJX2jKB2gYAGp
 /6Pw==
X-Gm-Message-State: AOJu0Yw1pI9XoF4HT4Gf0xe3nT1zUsI8m1oASn8+/W6Jvg1JidSet/Qc
 timlisdI2mR0fVOW0tz0grf1zrHTJSciKUKZvLmG1j7j2+vUQnRYyyYWdoyAQOCSQqodK7EieBP
 Lrdm9oEcnQLXMhs7yW7F/yEuyrIq9v5xrAsE2tIR5JBLzd69zSHkYxUOvF4EeIILFdz5IiWOngM
 KCjmQK+LzzbhXzCc6ClYI8KrVz52UdSddO3Ko5DZpMm/SBYp4CPg==
X-Google-Smtp-Source: AGHT+IFhuXqOXirdkqYvOEztWwvAcxGC2CIASL4p6hJoelFrXs62vByPTP/OEKJS3OHD3mTK+nuMjQ==
X-Received: by 2002:ad4:5beb:0:b0:6b5:7fa2:1e98 with SMTP id
 6a1803df08f44-6b57fa22076mr129011856d6.49.1719601369268; 
 Fri, 28 Jun 2024 12:02:49 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-446514341a1sm9523781cf.42.2024.06.28.12.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 12:02:48 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, kamil.konieczny@linux.intel.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t v3 0/4] Add vmwgfx prime tests
Date: Fri, 28 Jun 2024 15:02:39 -0400
Message-Id: <20240628190243.695367-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
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

The following series makes some adjustments for testing prime/dma-buf
on vmwgfx, adds a vmwgfx dedicated test for it and fixes some minor
issues.

The last patch in the series adds very basic prime tests to dumb_buffer
test to verify dumb_buffer<->prime functionality.

v2: Add a reference counting and dumb buffer tests plus fix issues
spotted by Kamil
v3: Fix a silly compile error in vmw_prime test and remove dumb buffer
test

Maaz Mombasawala (1):
  tests/vmwgfx: Removing incorrect assert in mob_repeated_unref

Zack Rusin (3):
  lib/vmwgfx: Allow using any buffer handle as a surface backing
  tests/vmwgfx: Add a prime test
  tests/vmwgfx: Fix and extend the reference counting test

 lib/igt_vmwgfx.c                |  76 ++--
 lib/igt_vmwgfx.h                |  42 +--
 tests/vmwgfx/meson.build        |   7 +-
 tests/vmwgfx/vmw_mob_stress.c   |   5 +-
 tests/vmwgfx/vmw_prime.c        | 599 ++++++++++++++++++++++++++++++++
 tests/vmwgfx/vmw_ref_count.c    | 217 +++++++++---
 tests/vmwgfx/vmw_surface_copy.c |   8 +-
 tests/vmwgfx/vmw_tri.c          |  12 +-
 8 files changed, 839 insertions(+), 127 deletions(-)
 create mode 100644 tests/vmwgfx/vmw_prime.c

-- 
2.40.1

