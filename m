Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCBEC9830E
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 12:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD1410F4DE;
	Thu, 24 Sep 2026 12:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXOs3JIc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC3510F4D8
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790251484; x=1821787484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bEpFkFuoJVOIVPeU5LxnzjeNBrY3ySLeIVPsRO4OJQ4=;
 b=IXOs3JIcjOx4JJFv6gvyTG+HF5LKAxBn3w04xzF2qQasOR/qV2GtgvZp
 W3y6Ks8Oo/zbEFSmYsc/UDoyu/r4S1rA1MsrzmkKNk93BAJZl0DTvaXZJ
 uKGhMyDwMAo7BvSp7r4U4iRSkaRGo2qN6Lsme1yMMMt/AGCqcyKSmBdoV
 0PMzMCwEpXzQcyYJGQJXvPeiV2N7gsrOpFwxuijIvDWEfDrn/sBpy98sb
 UDvGBSl4IooaIE9hnQOemp/o3zoRVMxIjFZYJ/sTh19LElM9Xo3bAuRYw
 004vOxC8nA34SHtm6ptZqaTXGeOTcUJX6mZeu9XymZXNehM8jvDK2dgF9 g==;
X-CSE-ConnectionGUID: +/d7gF1HRVO9qEJeriH9wg==
X-CSE-MsgGUID: l2qV2uR1TFiRegQX5oCslw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="78572195"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="78572195"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 05:04:44 -0700
X-CSE-ConnectionGUID: QVv4GYEeTDmAMSIcE0fm1g==
X-CSE-MsgGUID: gHpZLrwsQg+Osckr7DWhZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="274122984"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 24 Sep 2026 05:04:43 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_queue_property: Destroy vm and
 exec queue on test exit
Date: Thu, 24 Sep 2026 17:34:38 +0530
Message-ID: <20260924120438.1485077-3-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924120438.1485077-1-dnyaneshwar.bhadane@intel.com>
References: <20260924120438.1485077-1-dnyaneshwar.bhadane@intel.com>
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

Destroy exec_queue before the exec_queue id gets overridden.
Destroy vm and exec_queue at the end of the test that were leaking inside
of invalid_property().

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 tests/intel/xe_exec_queue_property.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 258dc05e5..3504f19b7 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -188,6 +188,8 @@ static void invalid_property(int xe)
 	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
 					     to_user_pointer(&ext), &exec_queue_id), 0);
 
+	xe_exec_queue_destroy(xe, exec_queue_id);
+
 	/* Invalid property should fail */
 	ext.property = invalid_property;
 	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
@@ -197,6 +199,9 @@ static void invalid_property(int xe)
 	ext.property = valid_property;
 	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
 					     to_user_pointer(&ext), &exec_queue_id), 0);
+
+	xe_exec_queue_destroy(xe, exec_queue_id);
+	xe_vm_destroy(xe, vm);
 }
 
 int igt_main()
-- 
2.54.0

