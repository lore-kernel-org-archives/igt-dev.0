Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CDBC3ABB2
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 13:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C60D10E5FB;
	Wed, 28 May 2025 13:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4ZiIhpw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ACD10E600
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748438070; x=1779974070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jt4GKcqKcTbHNV3jMP/xcBjfx8EscVgRD7bx1+NIT60=;
 b=e4ZiIhpw4lTiSqVmmLh3ARckg4qoybNkJpBCqMkpHx61lXofiCcil7Ah
 wQDS6CBAcLj6eYkLf82ILWsk9Gahapc4lAPK+YBsI5QjJ6mBduLHWYsYd
 HgOPYFa5nEtHT9BuIBxuIrztYOYZAssgY9aFMilvaJDuslFEb5CLxOHnT
 w4g22HrJ0XVrhfiqIOFjWjX0vrCMZTGfd4GfTw3INpUYqBd1qJsrfvKTe
 xLat6Wdm3UVexIUD2P1njsmDrgdkSO0Ow4UrUsqzU9qk/mQYE2HvbEfsp
 wXQsFwrruuhGrhaYzRBhdqIg7/2unsbw2h3pYcpiti9t/ZiEpjPcKnOR5 w==;
X-CSE-ConnectionGUID: Nf9jpseUT9izxI989T1RMw==
X-CSE-MsgGUID: 20ch6G1sQs2JWd9lk2/m2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50460699"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="50460699"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 06:14:30 -0700
X-CSE-ConnectionGUID: seNEsGRrTvGEBK8rfhuf3Q==
X-CSE-MsgGUID: ssP+Vu/lQCGRTZcz4p26KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="148523451"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa005.jf.intel.com with ESMTP; 28 May 2025 06:14:28 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore enable activity
 stats error
Date: Wed, 28 May 2025 19:00:49 +0530
Message-ID: <20250528133049.8975-1-satyanarayana.k.v.p@intel.com>
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

Add some more GuC fault messages in the dmesg ignore list.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 tests/intel/xe_fault_injection.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index f9bd5c761..4ca8a34bf 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -85,6 +85,7 @@ static void ignore_faults_in_dmesg(const char function_name[])
 		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
 		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
 		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
+		strcat(regex, "|GT[0-9a-fA-F]*: failed to enable activity stats-[0-9]*");
 	}
 
 	igt_emit_ignore_dmesg_regex(regex);
-- 
2.43.0

