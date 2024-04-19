Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95655C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 06:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2631510FDA8;
	Fri, 19 Apr 2024 06:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbvuLEqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401F210FDA8
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 06:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713508173; x=1745044173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b6klLX3Qqv7/at4X+2C0QK3pqWYWDbtpT5y1d68Wzeg=;
 b=dbvuLEqdh7hQ3PvRl/pOiHss7P1Q68Ev7ZIAdO43bXSMs66WmQ2NYfYl
 iJ1UGxBJ+oAvvq4HyIiT0NMthXKK+5znzGoajy6AWsBdB7Wp1x94Gi628
 aue5eRQ/D3IvmY/0sbhPCGqiNGpKqx6eH15FzWbDDV+afJSFZcY215Lj4
 4oN3U4OhAFfNDfN3qerz8DJcJYcutK3+gK3r+t9ycwz2gy+Qgy9OgvtvG
 lgp9pHmP9OYmRO7xp0vcc8bcVukIo6YwSH/fCKvP49x6c2GSNcXXPxSFd
 Zre3yjgIiLJN0FUahkitWEh6dgRmGSylGIhsNzjPcIMo7spkkAGTnLjUR g==;
X-CSE-ConnectionGUID: 2YQFPVFtQd28pDqSOsQwDQ==
X-CSE-MsgGUID: Hd5l1mQoRVaRS60OVB6wLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9637671"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9637671"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 23:29:26 -0700
X-CSE-ConnectionGUID: m85iahFcR1CnqBuUkhxzug==
X-CSE-MsgGUID: YelY9QlsSgmUrMrfI2xSFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23310888"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 23:29:24 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 7/7] HAX: Do not merge
Date: Fri, 19 Apr 2024 12:10:01 +0530
Message-Id: <20240419064001.2401850-8-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419064001.2401850-1-kunal1.joshi@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
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

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..0fc41236f 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,9 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_big_joiner@basic
+igt@kms_big_joiner@invalid-modeset
+igt@kms_big_joiner@basic-force-joiner
+igt@kms_big_joiner@invalid-modeset-force-joiner
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1

