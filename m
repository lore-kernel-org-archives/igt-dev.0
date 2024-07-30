Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB88C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 19:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92ED889321;
	Tue, 30 Jul 2024 19:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="LpTAtaiT";
	dkim-atps=neutral
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4AC891BA
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 19:00:42 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6b61bb5f6c0so11795336d6.2
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 12:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722366040; x=1722970840;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rD84GexU09aRrxiDiOWCW3+ccM1tm/xupznKXD9j/Uw=;
 b=LpTAtaiTEdwj1trcYa6jbeYL6Tu9ww64NUVFdEX6VZgi6iYTvjvTOF69MHO9hMdD+0
 fqGn39KjsoF0yOYSQCpU7yHDGj2w9APjobmRozidWq5PDeSoxPIaJzfH/3koeLd2DqbW
 MvaQwYSh/vqS4aW2bg/A1gGA9l2DtSnMJ4SZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722366040; x=1722970840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rD84GexU09aRrxiDiOWCW3+ccM1tm/xupznKXD9j/Uw=;
 b=XRwlNqGtwEzTdoSR27JffycxHCBoeLK6upYjZJjx75HeGE1Lz0KVp4TIcJKcRCruin
 tASZupYOz88lVQ8Bq2II8WWfakahAOm9I2/u6i/K+jJFIO4mtt5eRxMFM58K4Tk7a1cB
 WpZVffkWI5GucfzzVswXhxzvsEMyRC+/X5jkztUvt0J54f1H/6qpQBk6fY+2vF78hfms
 a+7ToagmBO4KB+3Gufg/3q+kufMhnncdwwR21mF7mO4sF2Cr00Amxr8aUw5QXjQnzAjn
 yiucUpaB8dTugX9ZntT9AARBka67wCzr8LZQeoSDxHxiZFxyJJAXdvoOEe96Kk1kdImw
 ASeg==
X-Gm-Message-State: AOJu0YwWP0RAklFkZ/Z9oom4XEz8fJZ/52cplwR/elq30oTEAgfhKFhV
 62e+MYxSJ+gT7YGvalOIUW+/VlY5nB37141QXqp71AgNtBF+SRODhOKh37Rdx1kOO8bwB9zXIkU
 Ai2+tUYmmOC+EL5HbSQ0KMTQiXzrf8fmq5I8/N/7mu2GjyOUeM0DmwJvnQhuT8TsrajWsc4L2ZD
 KArD2V/AdWZx1TkmLQX/qocUm4mi6jaRxTuI356bk3rz1693Q=
X-Google-Smtp-Source: AGHT+IFVce/8kttPZ023OTEak/wF6Chgu/pu2B1PK97/Yqch3FskJQ4daJBIPSrmsGhwrPXgBylyuA==
X-Received: by 2002:a05:6214:c2b:b0:6b0:7f36:8ae3 with SMTP id
 6a1803df08f44-6bb55a58411mr116379416d6.32.1722366040506; 
 Tue, 30 Jul 2024 12:00:40 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fa9be2fsm66644386d6.98.2024.07.30.12.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 12:00:40 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, kamil.konieczny@linux.intel.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t v5 0/4] Add vmwgfx prime tests
Date: Tue, 30 Jul 2024 14:59:26 -0400
Message-ID: <20240730190037.1134020-1-zack.rusin@broadcom.com>
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
v5: Add a commit message saying that the copyrights have been updated

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

