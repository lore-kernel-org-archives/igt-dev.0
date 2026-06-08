Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC02ECD8C90
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 02:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E53410EC20;
	Mon,  8 Jun 2026 02:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOey+OXH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33FA10EC1E
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 02:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780885090; x=1812421090;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KYpuFHmCDoTWnl36fPkZQyf29yDGSFIBBVfTuvSJJO4=;
 b=nOey+OXH9kzU3ZVNgdpYi38caeFxYYA+N7EVPTojOheZkJJzZhD6MrK6
 NS4UIWxAYCQ/DzK6JxX8QDeVtj5rOEZslZ2I2vNGCkMfNE597xHkbhZEH
 rXDe5xE42AN/Dbj4LGjyCd75F9BovT1YiS4HgasdJ5Pmltkm9ZxiJe6dI
 P003YL8XZpBoBl36v0Q8embYOPDzzBZMqLEKuJ4yjBKVDO2kdOWLA58n3
 BK6JsrpuYrKE7mPQ3U0YfzjaIFGtaTJthMiKC8To7It8VXynSMWkoB8/Q
 RDP/adFzRA5suFoXPB3BSswmle62MF3c0pTCKLgahbIQXqXLvK2pUIcVK w==;
X-CSE-ConnectionGUID: 60BL3LvISKCFTfpW/0mbcA==
X-CSE-MsgGUID: l+o7uwo9SE2lJ0mCQ34GdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93004753"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="93004753"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 19:18:07 -0700
X-CSE-ConnectionGUID: wnbpoFBbSK+lye03v41zWQ==
X-CSE-MsgGUID: DrGPmLv9TpCEQdAVGP1jjA==
X-ExtLoop1: 1
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 19:18:07 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel/xe_exec_multi_queue: Always re-mmap userptr on
 INVALIDATE
Date: Sun,  7 Jun 2026 19:18:03 -0700
Message-ID: <20260608021802.1051933-2-niranjana.vishwanathapura@intel.com>
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

test_preempt_mode() and test_legacy_mode() re-mmap'd the userptr data
buffer only when 'i' was non-zero, skipping the remap after the first
exec.

Always re-mmap when the INVALIDATE flag is set, including after the
final exec. The trailing remap swaps in fresh physical pages and
triggers a userptr invalidation, which exercises the teardown/closing
conditions (e.g. unbind and fd close) against a freshly invalidated
mapping.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 6f90c3e4e8..d9d648b022 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -746,13 +746,10 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
 				       fence_timeout);
 			igt_assert_eq(data[i].data, 0xc0ffee);
 
-			if (i) {
-				data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
-					    PROT_WRITE, MAP_SHARED | MAP_FIXED |
-					    MAP_ANONYMOUS, -1, 0);
-				igt_assert(data != MAP_FAILED);
-			}
-
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
 		}
 	}
 
@@ -915,12 +912,10 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 						INT64_MAX, 0, NULL));
 			igt_assert_eq(data[i].data, 0xc0ffee);
 
-			if (i) {
-				data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
-					    PROT_WRITE, MAP_SHARED | MAP_FIXED |
-					    MAP_ANONYMOUS, -1, 0);
-				igt_assert(data != MAP_FAILED);
-			}
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
 		}
 	}
 
-- 
2.43.0

