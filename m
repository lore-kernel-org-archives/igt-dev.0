Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1A5C54FB3
	for <igt-dev@archiver.kernel.org>; Sun,  1 Jun 2025 19:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AF510E049;
	Sun,  1 Jun 2025 19:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kLKEz0gS";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94E910E049
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Jun 2025 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=61BteoPXH34w/EZDfM9fAEuoVv33U8VJNpYIW1DXo98=; b=kLKEz0gSxSn4SE60d8/nnTkAeY
 V55yKxDVt/4mO7oEo0fwdPc/BLG5chM1voOAcfqu4CC2kQsGOYY74NUKJNzSjoUheUZ1LebOoAm3J
 iEy1hO+o1ZvnW9YQ0I1U/A1s9IbsPJrik+zg0cphrTjb2r8lB+ds1WvET/v4fwMtDR76aO2ec3Lzn
 fTzzOi9a7sj6p5FA7ldcT7eiBhdaeB5bZc75mIOm3DUwR1A9FUKYpuUQ36bu5dX1QliYC+KV0RjCO
 K1096GJ8Wi5v5szDNB+mTMkS9GkvrGG2cE9fKMQhQBbd+pgmUzPqfmlKpaznlNrikLCQFVY0/7mTd
 BQZBMx1Q==;
Received: from [191.195.103.116] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uLoAJ-00FzVn-HY; Sun, 01 Jun 2025 21:16:16 +0200
From: Melissa Wen <mwen@igalia.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Alex Hung <alex.hung@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
Subject: [PATCH i-g-t 0/3] improvements for AMD color and async flip tests
Date: Sun,  1 Jun 2025 16:14:43 -0300
Message-ID: <20250601191459.46759-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
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

Increase the test coverage of AMD color tests for CRTC color LUTs by
recovering the hability to validate LUT accuracy in DCN 2.1 (patch 1)
and verifying color transformation results with primary and cursor
planes active (patch 2) to prevent regressions caused by cursor degamma
ROM attribute. Also skip async flip test instead of fail if async flips
are rejected (EINVAL) on AMD device, which means that the async flip
cannot be perfomed under invalid conditions (patch 3).

Melissa Wen (3):
  tests/amdgpu/amd_color: fix EINVAL failure in DCN2.1
  test/amdgpu/amd_color: check CRTC color LUTs with cursor plane
  tests/kms_async_flip: skip subtest on AMD if invalid condition

 tests/amdgpu/amd_color.c | 30 +++++++++++++++++++-----------
 tests/kms_async_flips.c  |  7 ++++++-
 2 files changed, 25 insertions(+), 12 deletions(-)

-- 
2.47.2

