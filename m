Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CF1C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 19:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD50010E06D;
	Thu, 27 Jun 2024 19:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="A849Do5z";
	dkim-atps=neutral
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36EE10E06D
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 19:56:21 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-79c0e7ec66dso316651785a.1
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 12:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719518180; x=1720122980;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SMp//7dzjeMolye8mqv6/jBviGnwW4O/bjTJj8sgfvM=;
 b=A849Do5zcHUsinVF8737W+q4PP3/6Iu3pdVfCX3fiTM78NfcpEt+Gr3DJY4eEgc3p3
 pZOTEoM0nfPE9K+PALaZ9CZIcGcqmCInmoaabT1LM2FL9s/eh/eIWoVD40nN2O93Ie/f
 cFBAj10NiHvOkiKYQWlAWv/4R1qMGvvjjSi94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719518180; x=1720122980;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SMp//7dzjeMolye8mqv6/jBviGnwW4O/bjTJj8sgfvM=;
 b=LBrvLViL3oUzPZfQ7zGTd1oX2RwZsMt9gxo5k8IDD4tIKkqIAksJmcrD/YR9f3jFcQ
 0Ga58tQeIcuj1edIi4pgdpL38Y8FACo+Ykmg7U0NYAM37u0zWtKAsSjwyVAvct592lv5
 QCjDSIrq30xIRBJJ4RrPz7RTmoXq8nJQp/hUuErHh4VP3IDb4ncyFdKrP15NZPX+tvzf
 CqBjvnemSv/qhYncNcPSRT/hX78q0a1S3TMrFw68tW8yFg8PxdlZkDDVt90TfJ6oCoPk
 TTYGdPfwut1S/b1l5OKWTEVVjjO22Ox+unU6lCVbCsKuAvmYPOClIGfPkRn5O2q9t6BO
 pIeQ==
X-Gm-Message-State: AOJu0Yx42gkCjhGv4FD0jdIQjmKwTNbUuvy7kMV5umHQxn2vokWD90Rh
 Ew+ebTedXRrkl8x/VtfehOT07HUgJGVWDzJvroxeNM8fZlaD8tFIObX6OSDZ7q0g3ZixSsk3YjB
 9smXU2nx8qNP4V/Nleq0YB4/AooUveNEEeZOIU/74j6UdHZp1ilGqmYB6s8miOiKDIfMz49lN6c
 VI1G8hIpMbrAzYv/AXOUGVtMSIXWTfeUc/WmWPM8AjfrjQhCHTAA==
X-Google-Smtp-Source: AGHT+IGpaeFo60P1CT/1x+u7a92mmZkno2lPyQSqKSROJ+aN7RhEcS8LnOe04u7XIc6DG+JkEu85YQ==
X-Received: by 2002:a05:620a:2552:b0:79b:efd5:7f4e with SMTP id
 af79cd13be357-79befd57fa9mr1519194685a.33.1719518180326; 
 Thu, 27 Jun 2024 12:56:20 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d692f0b19sm9231885a.98.2024.06.27.12.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 12:56:20 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t v2 0/5] Add vmwgfx prime tests
Date: Thu, 27 Jun 2024 15:56:10 -0400
Message-Id: <20240627195615.3695848-1-zack.rusin@broadcom.com>
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

Maaz Mombasawala (1):
  tests/vmwgfx: Removing incorrect assert in mob_repeated_unref

Zack Rusin (4):
  lib/vmwgfx: Allow using any buffer handle as a surface backing
  tests/vmwgfx: Add a prime test
  tests/vmwgfx: Fix and extend the reference counting test
  tests/dumb_buffer: Add subtests for mixing dumb buffers with prime

 lib/igt_vmwgfx.c                |  76 ++--
 lib/igt_vmwgfx.h                |  42 +--
 tests/dumb_buffer.c             |  96 +++++
 tests/vmwgfx/meson.build        |   7 +-
 tests/vmwgfx/vmw_mob_stress.c   |   5 +-
 tests/vmwgfx/vmw_prime.c        | 609 ++++++++++++++++++++++++++++++++
 tests/vmwgfx/vmw_ref_count.c    | 217 +++++++++---
 tests/vmwgfx/vmw_surface_copy.c |   8 +-
 tests/vmwgfx/vmw_tri.c          |  12 +-
 9 files changed, 945 insertions(+), 127 deletions(-)
 create mode 100644 tests/vmwgfx/vmw_prime.c

-- 
2.40.1

