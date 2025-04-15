Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB63AC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 17:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7534510E823;
	Tue, 15 Apr 2025 17:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBx6wDBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D1C10E807
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 17:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744736544; x=1776272544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9u4ZDtTtfZZtdMNPOrlpCU8FjtdI8Gj3RZfJFLE/jEw=;
 b=bBx6wDBDytU1fyeBwyBQ7JB6qICwjed8q5kkvMs0/l5iS5P6isq6ofTj
 9Q+mvIWXs/00zE/PA4nPg2br0TG+zvZTA8Y+qWJoeMfm4CFY6WjaBxrbf
 /506gOtXDiC5z0ZrPTCUCpPBjy8xc2k6jihzrmFbG42n692EHOzfdDTa3
 0pViXZyDT96t9ofk6yZVZqcZx+k3mC+SRQjQxoJAruYcYnbqFXNQi7eQ6
 TkATAVgs+5JvbOgb/rBRKhrn8/sMaOvh7hGd11Hf3y0fTYPmZ87uAN+SQ
 uES7vGwKs6yV84lKjqTDe6Ccj/wFPrIkMjw4hg8CwNZN9hXpzb99zFOlR Q==;
X-CSE-ConnectionGUID: 0ygVK9A2ReipxSfG1k9y1Q==
X-CSE-MsgGUID: lt4Cf4ObRRKYAmD5lT0ZVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="33876470"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="33876470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:02:24 -0700
X-CSE-ConnectionGUID: qFgBs4rJT5KukXYiXU0mMg==
X-CSE-MsgGUID: siahJKYtSMmXBLLBWzvH+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135030432"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:02:23 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v6 2/2] HAX/DO_NOT_MERGE: test i915_drm_fdinfo
Date: Tue, 15 Apr 2025 19:02:08 +0200
Message-ID: <20250415170208.198730-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415170208.198730-1-kamil.konieczny@linux.intel.com>
References: <20250415170208.198730-1-kamil.konieczny@linux.intel.com>
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

DO_NOT_MERGE: Check for any regression in test rename.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 82395e7ea..5261a5939 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,34 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@core_getversion@all-cards
+
+igt@i915_drm_fdinfo@all-busy-check-all
+igt@i915_drm_fdinfo@all-busy-idle-check-all
+igt@i915_drm_fdinfo@basics
+igt@i915_drm_fdinfo@busy
+igt@i915_drm_fdinfo@busy-check-all
+igt@i915_drm_fdinfo@busy-hang
+igt@i915_drm_fdinfo@busy-idle
+igt@i915_drm_fdinfo@busy-idle-check-all
+igt@i915_drm_fdinfo@context-close-stress
+igt@i915_drm_fdinfo@idle
+igt@i915_drm_fdinfo@isolation
+igt@i915_drm_fdinfo@memory-info-active
+igt@i915_drm_fdinfo@memory-info-idle
+igt@i915_drm_fdinfo@memory-info-purgeable
+igt@i915_drm_fdinfo@memory-info-resident
+igt@i915_drm_fdinfo@memory-info-shared
+igt@i915_drm_fdinfo@most-busy-check-all
+igt@i915_drm_fdinfo@most-busy-idle-check-all
+igt@i915_drm_fdinfo@virtual-busy
+igt@i915_drm_fdinfo@virtual-busy-all
+igt@i915_drm_fdinfo@virtual-busy-hang
+igt@i915_drm_fdinfo@virtual-busy-hang-all
+igt@i915_drm_fdinfo@virtual-busy-idle
+igt@i915_drm_fdinfo@virtual-busy-idle-all
+igt@i915_drm_fdinfo@virtual-idle
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@fbdev@eof
-- 
2.49.0

