Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A043C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 19:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C392510F087;
	Thu,  9 May 2024 19:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="YhIigryL";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20F410F087
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 19:15:36 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1eca195a7c8so10404715ad.2
 for <igt-dev@lists.freedesktop.org>; Thu, 09 May 2024 12:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715282136; x=1715886936;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Holf0/xTZ07SX/PliFiLGOtTlOvA2PW1lrAG5NIaDlI=;
 b=YhIigryLysx1w6n/JwazUmZVgwVs2Sf1cJmO1HKx6Wi2fJh+wbJfvuttA8nYrrirLN
 KrA6zrWFVgjFlYeQ9a+Gtmlxwd/k0CZoSq7u+o79Igv770H2zjBqGX1Z1CAYCOJgPTK8
 zeVDYfVj3m9W7FwnR0k4WoT/T9s3i+gRR1d1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715282136; x=1715886936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Holf0/xTZ07SX/PliFiLGOtTlOvA2PW1lrAG5NIaDlI=;
 b=jTPE8381cnkUatMWLTaQ8d8+R41jBJbwO5F0Mxi3WoCePGQ3hPFaDycc5SIGErbK1N
 qbbMmyO+Su98Q1O6JOkfuslsmWlDA09N+EHZn1NTjt9FOXrQd7+XIPg3+07eiScVTFUK
 MBhB6oEC2tUZHPXygFVhC4IhfVw64cA2ksI3Yvw87Wkl6wBvoVeLY9kQmDE5pagokQ3X
 D0tIQLidorHZyRo6UezMp8FcNdjcLbxUxJj+Pekel7xdurcnruDwPe/c6LpVOAH7W1YH
 OsZu3K41xdmyx3g3tpco5VZbc1GDFQDvD2zxubth765LxzQ84jiNwOUclKIkcsXJ8uMF
 qzag==
X-Gm-Message-State: AOJu0YxdKQTzKiiJzUDayEbYzSeu0RdwHLUGxZneW//IkfqG+L9C+qk8
 Igvf73VBnSIJWnyGAi2VZ9f3IacqJjh57hpdXgJ2/YZnLtaEkWn28txsfRHcaGHC+eWbqa0x9m6
 XWtyZl5lKqS2ju44AjeGJK1dxX8GdguRY0gDJ5NNgBubORg3EMMUaLwjjw4FdYYIrE6qzgdhRo2
 5AUYpTaVUccEW87wh5HahhRWVssdrlNmdWTzfWzZwXJ6RjkhQ=
X-Google-Smtp-Source: AGHT+IHTEGTdoCgfrrkgLYpooDOiJLtYnG8ppCKZpUGoMvcnaOc7tGhs5QlcZ8i4u9zjBJ2m8yDcjA==
X-Received: by 2002:a17:902:f54c:b0:1ef:46a7:a27c with SMTP id
 d9443c01a7336-1ef46a7a368mr3993905ad.10.1715282135970; 
 Thu, 09 May 2024 12:15:35 -0700 (PDT)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf2f70csm17827395ad.168.2024.05.09.12.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 12:15:35 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t 0/3] Add vmwgfx prime tests
Date: Thu,  9 May 2024 15:15:26 -0400
Message-Id: <20240509191529.3783796-1-zack.rusin@broadcom.com>
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

Nothing too serioues and everything is contained within the vmwgfx
testing code.

Maaz Mombasawala (1):
  tests/vmwgfx: Removing incorrect assert in mob_repeated_unref

Zack Rusin (2):
  lib/vmwgfx: Allow using any buffer handle as a surface backing
  tests/vmwgfx: Add a prime test

 lib/igt_vmwgfx.c                |  33 ++-
 lib/igt_vmwgfx.h                |  12 +-
 tests/vmwgfx/meson.build        |   3 +-
 tests/vmwgfx/vmw_mob_stress.c   |   5 +-
 tests/vmwgfx/vmw_prime.c        | 355 ++++++++++++++++++++++++++++++++
 tests/vmwgfx/vmw_ref_count.c    |  12 +-
 tests/vmwgfx/vmw_surface_copy.c |   8 +-
 tests/vmwgfx/vmw_tri.c          |  12 +-
 8 files changed, 402 insertions(+), 38 deletions(-)
 create mode 100644 tests/vmwgfx/vmw_prime.c

-- 
2.40.1

