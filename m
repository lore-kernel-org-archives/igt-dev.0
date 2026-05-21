Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4097BCD5BA4
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 10:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C352D10E463;
	Thu, 21 May 2026 10:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1uTdckR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B4F10E463
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779359677; x=1810895677;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KIP0gBOz+phAget4uyliyQQpQQ2g1PGcmym4y5vlLZI=;
 b=k1uTdckRTeX0uqMWrYKuIVtwA41E8O/szrWgG9FGn6qm2W4r46igr/qs
 uuNHjBW+FMrcl3fRY7nHZbx8ZCy3JapQ9kxNCtHjWbKNnSfUOSPlx9s7l
 qUcfCzwejFk9m+Z0ptgMLdQwhAYKs3pVBnWpa0vclEza4iJI6enT37rn/
 hJ49Zpqqg7yUVNjzKZIwQGON1bfLBHsPMh57eSkpM9GvCPhDUDWcZn2Z2
 mvRPubTev+3ttW0KRSLqTYl5mOc5udHrYcabqWsTEoJGYLWi0RUq2BJD4
 DG1KTozx7p5BPaXjsBC0JAFwg77QKGHBCQjp8tEpqQUaW0bmmQ/IA7wtH A==;
X-CSE-ConnectionGUID: LV4M1P4WToydORVzRfMFlw==
X-CSE-MsgGUID: sxG6P/AUQXSf98s9jCk38A==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80256474"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80256474"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 03:34:36 -0700
X-CSE-ConnectionGUID: rCtmgU5ZSiGkY24Z4dGG3w==
X-CSE-MsgGUID: 53P09k4NTTaSjEJBAW6N0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="270845231"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.13])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 03:34:36 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] tests/xe_exec_mix_modes: Simplify xe_supports_faults
 requirement check
Date: Thu, 21 May 2026 12:34:28 +0200
Message-ID: <20260521103428.140839-1-francois.dugast@intel.com>
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

Simplify and align on uses in other tests, to make it clear that the
intention is the same.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_mix_modes.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
index 9594e56e5..209825f58 100644
--- a/tests/intel/xe_exec_mix_modes.c
+++ b/tests/intel/xe_exec_mix_modes.c
@@ -272,13 +272,8 @@ int igt_main()
 	int fd;
 
 	igt_fixture() {
-		bool supports_faults;
-		int ret = 0;
-
 		fd = drm_open_driver(DRIVER_XE);
-		ret = xe_supports_faults(fd);
-		supports_faults = !ret;
-		igt_require(supports_faults);
+		igt_require(!xe_supports_faults(fd));
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
-- 
2.43.0

