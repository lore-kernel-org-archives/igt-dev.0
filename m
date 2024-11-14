Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13922D65C6D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 10:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BBD10E26B;
	Thu, 14 Nov 2024 10:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6dvlLUQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C6610E26B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731579845; x=1763115845;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J+hguqcKo9bsPdSmTsKefOiW9LNEGswB93HT7FPz6DI=;
 b=m6dvlLUQjsjdBDjECAju6gULhgEYfYPYXEjHSeVBIWgd55sw0QxsWT72
 YJTqMlvHIxLqiNYYt/Q2YMSFEv/9xGmY0ukHxl6jFaCIGPx+6Sg370Aqt
 TbZ6ojrNMKdh0iI/6frQH03mP/I/ESEidctKvx+eAMon8ke4JGTIqKTnH
 cygrHQZzJbERKsXQvve2XDmY7A+N0sPGGc5ez9n80nd6YDg8R2P3xHyVI
 mRU3cuZEirUq/BHpQkGUUzvVAEj8uYtCet7TIoBHK4Xx7oUsyNIiAHWHb
 vs5bnCR8Gi9+vLe2KxT11blqzcmo/Kw8xZzTrNgR1BHT1+Q6cAmo4YcVT Q==;
X-CSE-ConnectionGUID: uD9cfq4dQYuq56fFCKVRXQ==
X-CSE-MsgGUID: YGN2hNpySV+igN/7x+lh2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42938768"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="42938768"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:14:54 -0800
X-CSE-ConnectionGUID: GikX3AAZSgCLlGublV7G4g==
X-CSE-MsgGUID: uj0zPK5vTzyrs7xl1V+TWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88331804"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:14:52 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel-ci: Remove xe_bo_shrink_kunit
Date: Thu, 14 Nov 2024 10:32:43 +0100
Message-ID: <20241114093243.2671688-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Remove xe_bo_shrink_kunit which takes a while to run on various
machines. There is no good way to make it faster.

Cc: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2998
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..c263473e0 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -217,7 +217,8 @@ igt@xe_waitfence@reltime
 igt@core_hotunplug@unbind-rebind
 
 # Run KUnit tests at the end
-igt@xe_live_ktest@xe_bo
+igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit
+igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit
 igt@xe_live_ktest@xe_dma_buf
 igt@xe_live_ktest@xe_migrate
 
-- 
2.46.0

