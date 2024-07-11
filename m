Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BD0C3DA41
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 00:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185AD10E5DA;
	Thu, 11 Jul 2024 00:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XL9TGnzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A746110E5DA
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 00:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720656727; x=1752192727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZbRwXDTpowOp526BGcBGYM0n5s/oBfPRskFoSwouC9k=;
 b=XL9TGnzHIDGUg4Er51OqNqXjOm/riHcDwHgMeIJvpM76RUxwq6Vb/JX4
 PdeEWIVkwrO6Gg3phq7qz2Y6DjCUlTQ4NfHaY5sbReSkGjSmuJL4fAJjb
 q0mqnNmSMjeBjr5oZGSB4B7hBdp1/HwuQ83YYN/Kwr5THZQuzUgTSxTD1
 Rfo2+GdMYH20wJhQvcNWXMmgemrwJRgcinfU4zmDvF8+11l7nz3LZknk/
 EID3BLYL0g8cCbBG3Uwm98cAuPTuu6KTJ1CjOcTgv1ll918VAVxOMDXWf
 nCCQ7btlDOtLgoHErTjnoB7Jp0CFsxHSFxaG437uIIQihgHaYeh9e1j0S g==;
X-CSE-ConnectionGUID: /qK/Gc3LSIum8e6PQ5efFg==
X-CSE-MsgGUID: V1JBD7vyRIap8dl+rKC49A==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17715657"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17715657"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 17:12:07 -0700
X-CSE-ConnectionGUID: 7pVHl0MCRUqamdZ0FjrmKg==
X-CSE-MsgGUID: Ne7kz+ZhRBern+a0OlI+mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48437822"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.125.7])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 17:12:07 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 0/6] Implement compression support on BMG
Date: Thu, 11 Jul 2024 05:21:50 -0700
Message-Id: <cover.1720515376.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

According to the SAS for BMG compression, we need to decompress during eviction,
and not recompress on restore. Due to this, we need to introduce encoding pat_index
in case of vram too. This patch explores the solution of setting up an additional
identity map for the vram, this time at the end of previous mapping offset and
with compressed pat_index. 
We then select the appropriate mapping during eviction/restore/clear.

Akshata Jahagirdar (6):
  drm/xe/xe2: Introduce identity map for compressed pat for vram
  drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
  drm/xe/migrate: Add kunit to test clear functionality
  drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
  drm/xe/migrate: Add kunit to test migration functionality for BMG
  drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx

 drivers/gpu/drm/xe/tests/xe_bo.c           |   6 +
 drivers/gpu/drm/xe/tests/xe_migrate.c      | 388 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
 drivers/gpu/drm/xe/xe_device.h             |   5 +
 drivers/gpu/drm/xe/xe_migrate.c            |  66 +++-
 6 files changed, 449 insertions(+), 18 deletions(-)

-- 
2.34.1

