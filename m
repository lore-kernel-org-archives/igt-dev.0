Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238D3CED63B
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 14:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87B910E4C9;
	Tue, 18 Nov 2025 14:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXNUpJbO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5444E89950
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763475883; x=1795011883;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=77SMSTJXv/AV6xtZwp9mS4CRQnUfk5Y2YPjgtGmIpNI=;
 b=AXNUpJbO+yop0NPztpbPodnvVeusW/JvQVYqfS0O7ThRoyVlKeX48hwR
 DtXmYP13kmj8Rcy0qr269gfUt/I3NrdUQUp5lsEUUZwIzw/tos4V4c+i9
 23gATiGHFXjXqt89RpnIsCHG8YxOkT4Q0dQCGc2ngOW1gq1MJ3Kp4Ad5a
 SfDX2Z7PbfVho1ExzRWKaLZws2zW+LbHEqrnn9+FmYIJVRNs4x+2M5ljZ
 vkQlBeYW2ijAEHSkkqVoc4uebP08Bjt/Eaa+i3+alMGVjnxfMKENClSpY
 FMt4iqSHH0KT1hYc3MBa7uaSWvKwzx4/4j1NU87HMxljCMMO7IW+BRoCn w==;
X-CSE-ConnectionGUID: NXvUcXYPS82igO3KlvDFYA==
X-CSE-MsgGUID: /UM7G6nzQWmdPXYuR5q4Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65587302"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65587302"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:24:43 -0800
X-CSE-ConnectionGUID: mn0KkqUGTtSnQCaGeMThwg==
X-CSE-MsgGUID: t0ZvEF/WT6alhOrIc5QduA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="214168185"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:24:41 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 0/2] Fix mocs index fields in MEM_COPY instruction
Date: Tue, 18 Nov 2025 19:55:23 +0530
Message-ID: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
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

Contains fix for the change in the mocs index field of MEM_COPY
instruction in platforms after Xe2.

Balasubramani Vivekanandan (2):
  lib/xe_spin: Pass drm file handle for mem_copy
  lib/xe_spin: Fix mocs index field in mem_copy for Xe2 platforms

 lib/intel_blt.h              |  4 +++-
 lib/xe/xe_spin.c             | 11 +++++++++--
 lib/xe/xe_spin.h             |  1 +
 tests/intel/xe_render_copy.c |  1 +
 tests/intel/xe_spin_batch.c  |  1 +
 5 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.43.0

