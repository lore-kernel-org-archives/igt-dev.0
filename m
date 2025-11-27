Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F32CFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 13:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DA410E74F;
	Thu, 27 Nov 2025 13:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjsTCUt7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8C510E74F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764251657; x=1795787657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TsmLFB9ZSIWGQO5UaEEX6vxiRPZJ0hde9FChQN9pR3c=;
 b=QjsTCUt7cwPD/QGQzRWX/X0wndW2zOmUhmXdJNQIPtMdxBS8QrlK1vtX
 GwQ29nMLxe3ONdc/8Vr1IJTKiO9EctrVl5U8qDHDo2PRria5rZcPc+NGt
 5UoeJIIf7mD/4VWLZqG6ITloi2JSAxbP+R5GcX9KWG0vTS5npeVclXu4o
 FQQwzEoDdjNqI8NkBkolQKUbxq9y4pfx4iEHSr/EDbMiKvKOE7ZauuuJQ
 OaUaSvrp+H+El9NLXghiyPhGVW+Qx43R4HjLqgFZ6xIYRkufsYK+s7sJR
 pkt7AGZb7Gr03W2h8BQMcdfHbSJ4UiDDVkfpmjOMnQzRUU3kBWwe3P4Mz g==;
X-CSE-ConnectionGUID: GgRocFP3RYOICjPWzav2vw==
X-CSE-MsgGUID: K7LE3sJQSjOj1TIClruuYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77400863"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="77400863"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 05:54:17 -0800
X-CSE-ConnectionGUID: nYqBpqwyRA6rilpRE9Wtqw==
X-CSE-MsgGUID: l5ercfqJQY2GRnejx5UEkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="192496074"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 05:54:15 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Adjust vblank validation for simulation
Date: Thu, 27 Nov 2025 19:23:46 +0530
Message-ID: <20251127135348.2158579-1-ramanaidu.naladala@intel.com>
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

Update the vblank sequence validation logic in the asynchronous flip
tests to correctly handle simulation environments where multiple
vblank increments can occur during a single wait-for-vblank interval.
Previously, the test assumed only one increment, which caused false
failures under simulated timing conditions.

Naladala Ramanaidu (2):
  lib/igt_kms: Add helper to measure vblank delay in simulation
  tests/kms_async_flips: Fix vblank sequence check for simulation

 lib/igt_kms.c           | 25 +++++++++++++++++++++++++
 lib/igt_kms.h           |  2 +-
 tests/kms_async_flips.c |  6 +++++-
 3 files changed, 31 insertions(+), 2 deletions(-)

-- 
2.43.0

