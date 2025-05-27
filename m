Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888F9C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 12:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3450410E4C8;
	Tue, 27 May 2025 12:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwnHcpy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7166010E4C4
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 12:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347418; x=1779883418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J4BIm5HLc8yhKufra2pb5kn6TYY/Li94tCnggkX+dvU=;
 b=hwnHcpy8rj/t55cUC+fUp4LJLeh6noA2U4Y2uA6ogu8GpHIFeUOdVHQ6
 YrhGJDO3LBoTbtvkaaghdJrpYTDpClWCZlGKFo/we750BjISBGG4RW7pB
 3pER5qC7fZFUY1Pao3OPoZSANDBHJddO2eGZQljM/2ns+bLc3KxBlNu+q
 0HrxnI8OmsPSKknk+QN8lC28E6Cpl/U8as+JeKGVG7R9lurDAvxUZSlj6
 rF79X12cGvUlhzC5wAGFlephYF4HfzWyOv05ahCboMEM2tbzKxIHjpeQt
 ITx5BGSMmu5JH45gLKND+nhUiO9in8Opf7Dc+MvLjXH6U+qWyETCcIqYX Q==;
X-CSE-ConnectionGUID: mVaerabuTeeMHaxflUvgFw==
X-CSE-MsgGUID: mlutNMV3Say8dAvoq3nXlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61687826"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="61687826"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:37 -0700
X-CSE-ConnectionGUID: ydbgBKsSSvm+n+RTHMrIJg==
X-CSE-MsgGUID: 9jIxmLkcQuqoiGk9nrXepA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147558041"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:36 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v4 9/9] tests/intel/xe_eudebug: fixup print formatting
 for xe_eudebug tests
Date: Tue, 27 May 2025 12:04:21 +0000
Message-Id: <20250527120421.79026-10-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527120421.79026-1-jan.sokolowski@intel.com>
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
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

Compiling on other architectures than x86-64 causes a lot
of print formatting warnings.

Fix formatting by using proper formatters, eg. PRIu64.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_eudebug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 60700a8bb..bdf73c4e9 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1156,7 +1156,7 @@ static void *discovery_race_thread(void *data)
 
 			xe_eudebug_debugger_stop_worker(s->debugger, 1);
 
-			igt_debug("Resources discovered: %lu\n", s->debugger->event_count);
+			igt_debug("Resources discovered: %" PRIu64 "\n", s->debugger->event_count);
 			if (!s->client->done) {
 				xe_eudebug_for_each_event(e, s->debugger->log) {
 					if (e->type == DRM_XE_EUDEBUG_EVENT_OPEN) {
@@ -2669,7 +2669,7 @@ static void vma_ufence_trigger(struct xe_eudebug_debugger *d,
 				    ef->vm_bind_ref_seqno);
 		xe_eudebug_assert_f(d, eb->flags & DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE,
 				    "vm bind event does not have ufence: %s\n", event_str);
-		igt_debug("vm bind ufence event received with ref %lld, addr 0x%lx, range 0x%lx\n",
+		igt_debug("vm bind ufence event received with ref %lld, addr 0x%" PRIu64 ", range 0x%" PRIu64 "\n",
 			  ef->vm_bind_ref_seqno,
 			  addr,
 			  range);
-- 
2.34.1

