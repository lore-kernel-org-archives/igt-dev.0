Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D85C8302F
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 10:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA8A10E25A;
	Tue,  1 Jul 2025 10:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCON9e3g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7776010E25A
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 10:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751366076; x=1782902076;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W8ZkWk5+h5+T0YF5S78vrjrOmtFA41XTVHLvpIq6ufk=;
 b=jCON9e3gE0DfDsdo6uRwy1o6HuiCaVmgr6dqeHIJYeWO/xB8mipAv2sF
 unwp/Y9br0x2WYjx9NgLu/vUoTLc+BUiPPn+dwZXpCZIKr1NkcD0WsF2N
 L5okabu6pbes9QvEylZfKMJIIJb02xHUGRdYrabEkqelraSD85V2HJQyp
 Y261LUKk2MUHa8q2z9dFofZ3+mTgZacQ4WRbDazZ7kBz28ANbbWelSZMI
 /LeiIShZh7cVl45OJaE87AlGDM1KRlAOo2PhzAeH6dvikG/gTX6K9iJki
 cNMqVqjyQ4ksJvWWkNyrF8Phaj7iV6JeVIVavoPuMRgTUT5+TeHwGXNXl g==;
X-CSE-ConnectionGUID: fcIZ1pwmREW5qtVW+M4wrg==
X-CSE-MsgGUID: IKnR4MmLRied7WdVACAjCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52856062"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="52856062"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 03:34:35 -0700
X-CSE-ConnectionGUID: Rs2K7sN3SEamNXM2xmYpPQ==
X-CSE-MsgGUID: i4z8UEGKRxek+wRcX0mnew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153345945"
Received: from glewando-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.80.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 03:34:34 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] fast-feedback.testlist: Reorder dmabuf and i915_selftest
Date: Tue,  1 Jul 2025 12:34:05 +0200
Message-ID: <20250701103405.23478-1-peter.senna@linux.intel.com>
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

On older hardware, we have observed failures in the
igt@dmabuf@all-tests. Preliminary evidence suggests that the failures
may be caused by earlier tests. Specifically, the igt@i915_selftest@live
tests are suspecious.

To mitigate potential interference, this change swaps the execution
order of the igt@dmabuf@all-tests and igt@i915_selftest@live tests in
the fast-feedback.testlist.

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 82395e7ea..2e6790039 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -167,5 +167,5 @@ igt@gem_lmem_swapping@verify-random
 igt@i915_pm_rpm@module-reload
 
 # Kernel selftests
-igt@i915_selftest@live
 igt@dmabuf@all-tests
+igt@i915_selftest@live
-- 
2.43.0

