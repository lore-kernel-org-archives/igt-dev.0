Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D9FC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 04:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D7110E2EC;
	Mon, 29 Jul 2024 04:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="PJXh+FbZ";
	dkim-atps=neutral
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A474010E2EC
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 04:38:51 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-39834949f27so16183945ab.2
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Jul 2024 21:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722227930; x=1722832730;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uTrGaBnbbWLPfnbvX9ZFRsamg9eajHgSwMXd2iCfKbY=;
 b=PJXh+FbZ8fQ8yS9VkimILG4CGjjjsOC7/VzLzUCNXZ5/NMP80XMcSqvk0Vw9JiesM6
 mc++2ul4oruMyO5Wdl0Kj8QyBn5x247QLxfKQCaUgZ7rBuku8tiuPuOqk0tJOFp0/q7s
 7XJsn/YUjtNytU6yfdtlhe24LQtvDGsBHmz8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722227930; x=1722832730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uTrGaBnbbWLPfnbvX9ZFRsamg9eajHgSwMXd2iCfKbY=;
 b=k/0lzxDD8fj5xdHOzhstAxd8TrPoDPM0Dvb3BH95hYzrk45TnULwdgLAT7zG2+bY7B
 jJIlcQYXoT9n8rq2RmRK+JOMtuv0u+yXNP+pjOIZNvLXRTely+PEyubl8Zl5YLeBlnZY
 quXSKXw4FmmX/2jiMGCOy5HSpkeoxt3gWek9CQzivqJq8HTwrq/qc5WZgxGGvFsRPMV2
 MlFH7hkBnYHkgdPnCraEGwQ8bUTtAQd/XCCeiojY00urCL6fqRjZIMjk5XtTtIyhiz9i
 CFwe38KnBSEKIfm5OK4ZG3/9aauX9cUjkQ0QRYdwL6tuayJGXJjOzgwREl5aXcBrL2XA
 UsoA==
X-Gm-Message-State: AOJu0Yz5YdLHT1Q0c8sLB23vIHNQK6NERnKd8EF894NDwxjirXX/OTMS
 FXjEaQMIkK1hAmpvjNDiEFIyV6NReou7MtKvL6keA/74hF1gY8tVPpsHdFZLlhipx1gEJv8oHoq
 WLhB4+17m3Ao62RkLb1f7vfrnCglfd6aV4C/Esj0U6G74Z/Y11NI3BrMUF0YVHHa1l8neePcFo/
 w90VpL2HFBdW8zvVNUfFzsmUg41A76VhDYUF61Y+tbBO9M43s=
X-Google-Smtp-Source: AGHT+IGXTheP7NBGvSr+KtKBnbkvgWAQPqjZrIeUAHwBX/F1eh5HjBejPREPnBz+BS+7Gy80oY9Efg==
X-Received: by 2002:a05:6e02:1fc6:b0:39a:eb57:dc7 with SMTP id
 e9e14a558f8ab-39aec2ca40amr84086075ab.1.1722227930364; 
 Sun, 28 Jul 2024 21:38:50 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead88c19bsm5963392b3a.183.2024.07.28.21.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 21:38:50 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, kamil.konieczny@linux.intel.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t v4 0/4] Add vmwgfx prime tests
Date: Mon, 29 Jul 2024 00:37:52 -0400
Message-ID: <20240729043846.1892343-1-zack.rusin@broadcom.com>
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

The following series makes some adjustments for testing prime/dma-buf
on vmwgfx, adds a vmwgfx dedicated test for it and fixes some minor
issues.

The last patch in the series adds very basic prime tests to dumb_buffer
test to verify dumb_buffer<->prime functionality.

v2: Add a reference counting and dumb buffer tests plus fix issues
spotted by Kamil
v3: Fix a silly compile error in vmw_prime test and remove dumb buffer
test
v4: checkpatch.pl improvements suggested by Kamil

Maaz Mombasawala (1):
  tests/vmwgfx: Removing incorrect assert in mob_repeated_unref

Zack Rusin (3):
  lib/vmwgfx: Allow using any buffer handle as a surface backing
  tests/vmwgfx: Add a prime test
  tests/vmwgfx: Fix and extend the reference counting test

 lib/igt_vmwgfx.c                |  76 ++---
 lib/igt_vmwgfx.h                |  43 +--
 tests/vmwgfx/meson.build        |   7 +-
 tests/vmwgfx/vmw_mob_stress.c   |   5 +-
 tests/vmwgfx/vmw_prime.c        | 584 ++++++++++++++++++++++++++++++++
 tests/vmwgfx/vmw_ref_count.c    | 214 +++++++++---
 tests/vmwgfx/vmw_surface_copy.c |   8 +-
 tests/vmwgfx/vmw_tri.c          |  12 +-
 8 files changed, 821 insertions(+), 128 deletions(-)
 create mode 100644 tests/vmwgfx/vmw_prime.c

-- 
2.43.0

