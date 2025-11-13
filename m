Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D8CCD6E51
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 13:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0744810E7F4;
	Thu, 13 Nov 2025 13:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lns7/0Ql";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1784910E7F4
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 13:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763038814; x=1794574814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OoU20KkUouXVOZdHI8tLeyJUTBYkm/qOTLTJQaTU2+8=;
 b=Lns7/0QlolnFA4QLJ9r73JTD2vl8X2GS7kz+moPEaqLQmux+FdOGT2KX
 w0jS2IJ/yEAoUkTGKQRpeJpP8+kwk2oGvCW6SJPYeMvx++NV2W6Ntdhlz
 pkWTG7e+e5EigR7SNlXUX4Bo2TRPdqoKx/EEZCoNr5fF3HHhCM13gmTsX
 JvTx/FSOOoPX2ElUgoRIryK3Nz/4wTBnAFOkXppFpcUtgLrv+v+njIfqJ
 IKqObh1V7uloYknoV/dcXld/BjC0LNTlXOR0Zc4LOQs3bsU/I4JEwsCFR
 i5GwGNGzhAEqzKmsXq1Xs5Y/XmqBRj45aGg6v9sPrQShoOy54z244dU16 A==;
X-CSE-ConnectionGUID: fdld6pgnRpyXMHoiEgVXvQ==
X-CSE-MsgGUID: jsgyXyflQTKeeCpgmXAnpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64124120"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64124120"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:00:14 -0800
X-CSE-ConnectionGUID: kH8jaMTcQ4OoPutTjs9CCg==
X-CSE-MsgGUID: jRSTpsv9Q9618bzr3tQwSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194493167"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:00:11 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v1 2/3] lib/xe/xe_spin: Export xe_spin_sync_wait
Date: Thu, 13 Nov 2025 18:19:35 +0530
Message-Id: <20251113124936.3878794-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113124936.3878794-1-soham.purkait@intel.com>
References: <20251113124936.3878794-1-soham.purkait@intel.com>
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

Make function xe_spin_sync_wait() public
Which waits for the spin batch associated with the
given igt_spin object to complete by waiting
on its syncobj after spin end is executed.

v1:
 - Add simple commit message. (Kamil)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/xe/xe_spin.c | 10 +++++++++-
 lib/xe/xe_spin.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 9909f4e03..9c0651f9a 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -302,7 +302,15 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	return spin;
 }
 
-static void xe_spin_sync_wait(int fd, struct igt_spin *spin)
+/*
+ * xe_spin_sync_wait:
+ * @spin: spin state from igt_spin_new()
+ *
+ * This helper waits for the spin batch associated with the
+ * given igt_spin object to complete by waiting on its syncobj.
+ * This function asserts that the wait succeeds.
+ */
+void xe_spin_sync_wait(int fd, struct igt_spin *spin)
 {
 	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0, NULL));
 }
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index af32ab563..1cd578e2d 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -77,6 +77,7 @@ void xe_spin_reset(int fd, igt_spin_t *spin);
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
+void xe_spin_sync_wait(int fd, struct igt_spin *spin);
 
 /*
  * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
-- 
2.34.1

