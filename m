Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C808AC27C52
	for <igt-dev@archiver.kernel.org>; Tue,  4 Jun 2024 15:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87A610E088;
	Tue,  4 Jun 2024 15:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTPH1/pI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2829910E088
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2024 15:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717513977; x=1749049977;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=ueTnJ1ySEDKv3Uh/pgFQZq4C4W9dwrLkW1fSuZrseEo=;
 b=GTPH1/pISje1xeRbMtSGTOzAXfr0I3Fu+ZtmNisqCp0Imhicw5cFoWb/
 82FqDJ614c/wNRixh4hWll1wuBZFls+NJuHNtWoLdm/BlBirFxdzmq9ZX
 aWmBWqjEJ+SGFZ0hbFBCC2DFlj83PXzCDtU61BmMZFcYjZr7LZu2iMO52
 fiLR+toNEgWlgsqukFHqBBkrtrWEKEcVbxO89HnHA5EigRjcSSDA4A/n+
 k1A0DseSmV+cQiLpmGRnh47QxfIewOkfpjiRfBnTA1EPPDFyXek91FxU1
 yRe/b/+djMcHRLmqDG5OfNjUly8iyY+VcnzPoCwFu5ELou+4Ih1N5PAKy w==;
X-CSE-ConnectionGUID: MRZciU0TSNCWXGAs1RJ3+Q==
X-CSE-MsgGUID: 5AcSwdIqTGy2Y5yxa2rWLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14258059"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="14258059"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:12:55 -0700
X-CSE-ConnectionGUID: 4BQ10YGFQl66IzZTiYMnOg==
X-CSE-MsgGUID: 0ge85j0mS9SKCbF9UxC0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="68094616"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:12:53 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 04 Jun 2024 17:12:44 +0200
Subject: [PATCH] tests/intel/xe_exec_fault_mode: enable copy engine testing
 for invalid-va
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240604-xe_exec_fault_mode-invalid-va_enable_bcs-v1-1-43e032d63353@intel.com>
X-B4-Tracking: v=1; b=H4sIAOsuX2YC/x2NUQrCMBAFr1L220ANLYhXEQm7ycYGYlqyNgRK7
 +4qvJ+Bx8wBwjWxwH04oHJLktaicL0M4BcsLzYpKIMd7TTO1prOjjt7F3HPH/degz5Kw5yCaei
 4IGV25MXMdLOEuhA9qG6rHFP/px5PZUJhQxWLX36BfRM4zy+8ZNiFkAAAAA==
To: igt-dev@lists.freedesktop.org
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=ueTnJ1ySEDKv3Uh/pgFQZq4C4W9dwrLkW1fSuZrseEo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmXy71kZtNCqzSWCjj7m/VqawrQVousH4NqSveU5O0
 yHAdzZOJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZl8u9QAKCRAjYrKT3hD91wY1C/
 9sSPoC2omkpWJRPnF6S6XhYwtyirbleI3lHSJ6DCEaseiu8vnjexkVIqY6WhZyAuwY/unsb56JFrsn
 CVA069SSF5P/t7iMpyqvtoYTyZgYSpO6N113E1BD/bH+bTFAunAvltoHDIm0QWJ/Axn8cX8kJCCjVv
 HVJ98eI7xLbYR30WJS8Ev4wgC74mjJhii3BVWPQlZRznM2Xut0rscth9mcHJh4oGMrhi5msqzvhFXQ
 NcSbtDL2kc8GeZ4o9wr+pkGls/j7TPI267WSKO8vq/77uCOopfbeE3dL4+UaokmeuHNSHKWL3sXa9a
 At8xqMOKDhoB0dQvYfh4wRWNSJ+FHVmVU/R5FDeqxiRKDKFcvYH8s6uuSoiap0vu2VqY98FBbaC7MM
 uro9IPwfj8o4aS+w+40khjLphkQuJfmolY6QDsPDHG+H980UApdqQ0g7Pi4EeHRmOCZYSSSmfy+bRg
 qQ9J7tDfnhJc/+9vP8B9SsXcrGa7oy12m+dr7mtblJzQs=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Testing copy engine was skipped due to kernel bug. Since bug was
fixed in kernel [1] we can test all engines.

[1]: 38007fa96419 ("drm/xe: flush gtt before signalling user fence on all engines")

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index f3d2e07ecb32..26d339f5aa58 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -448,11 +448,8 @@ igt_main
 	}
 
 	igt_subtest("invalid-va")
-		xe_for_each_engine(fd, hwe) {
-			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COPY)
-			       continue;	
+		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 1, INVALID_VA);
-		}
 
 	igt_subtest("invalid-va-scratch-nopagefault")
 		xe_for_each_engine(fd, hwe)

---
base-commit: f3006a13799e3bc45d754aa8ad318394277d69ac
change-id: 20240522-xe_exec_fault_mode-invalid-va_enable_bcs-5b82ba2badfc

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

