Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9836FC282DE
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 19:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADE810EA7E;
	Thu,  6 Mar 2025 19:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icP9CjA+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D8410E09C
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741287690; x=1772823690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FH31V33Pme4fP2TeYmTTMqQuq0WUxsCf4Dwl2APW2s0=;
 b=icP9CjA+Ld7ogG6IIW5I6rC7k+ByEB7rM9eFj591lQNr0XmjExY37HCf
 XMUEq+9UvygWLZ6cg2y022ohkpgQSZ4q8/+ZamSNeYM50rG8BFvyxZtlh
 Yi7FGbKehnb58dTDxRQTVZMaHRU5ywCcUuhzvqFeQ7guSXKjTxHpj9Y1A
 9jJ8YepbXYvJNg9QOXxDIZJb7WoJm58heUanQIr5ejRdQD0l7+e+dhgSz
 wOXL1hXT9at9z/cHEEv/U2uF4cj53f5V8KTX4ZpWHhXjPJNXdMn8JkfA7
 yHZ9WXogLFLDAZ9g5QwF2GikxYTxzwQy+/qFyrvRJTAVgogIG3/aMNsgb w==;
X-CSE-ConnectionGUID: 8N+6MXRJTxuLWSmO7dEV+g==
X-CSE-MsgGUID: Q3GwWB7LS4W/b0jdjxitiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52959762"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="52959762"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:01:29 -0800
X-CSE-ConnectionGUID: izkT9exTQbW40NIsteEI2Q==
X-CSE-MsgGUID: Y/bcvoGzTaiU8UMVBLM82w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120025514"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:01:28 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sk.anirban@intel.com
Subject: [i-g-t,v3,2/2] HAX: Add rc6-idle tests to fast feedback list
Date: Fri,  7 Mar 2025 00:29:44 +0530
Message-Id: <20250306185944.2581304-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306185944.2581304-1-sk.anirban@intel.com>
References: <20250306185944.2581304-1-sk.anirban@intel.com>
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

Add pm_rc6_residency-rc6@idle to i915-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..f37dbf769 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -51,6 +51,7 @@ igt@gem_tiled_fence_blits@basic
 igt@gem_tiled_pread_basic
 igt@gem_wait@busy@all-engines
 igt@gem_wait@wait@all-engines
+igt@i915_pm_rc6_residency@rc6-idle
 igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
-- 
2.34.1

