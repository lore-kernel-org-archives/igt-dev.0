Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2490C35FFF
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 14:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7881D10E3A8;
	Thu, 20 Mar 2025 14:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFmcTyCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7C910E3A8
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 14:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742479466; x=1774015466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VMWSoSaqd5M3DX+e55+6VuwMV8m39aa4EkwfP6efxlM=;
 b=kFmcTyCF6NsuYOeuC56aAPoHz0UUoqSaC7OEIazGeTRZ0l37Fqd02Yu6
 cRiMzn1ebAMMmrdGtLaMxGkGyWnFerXUfXQGJ2TnlDmDROEzRKLPraxNc
 CMZKuMMvcVv/uCZ5POAWUrTBCbAI9LQXKSbrH8xtG/mA+K+QuzcEgb6cy
 xPRAkzIMty39NkToFacjCO++42U4NwS1PD0ifbyxeURU12O4eQ3+cYpRr
 aZX9d+bqySKNfLDnElOTTjBz7WaQ0aVpX2z3rUC9IyJJt2zyITgFOZpHS
 V9s3FNRF5OcFGRHx4Y8o6vcbFJ/2VaBtA6u2GRbJCK6SgGc4xNyIf4KkR w==;
X-CSE-ConnectionGUID: 9I9gyIoFQYmXZaEzGI0xYw==
X-CSE-MsgGUID: orl7A7mLQYOrjXGN0ePwLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="61102751"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="61102751"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 07:04:26 -0700
X-CSE-ConnectionGUID: n396RC0ORL2LmXyeFbRm2w==
X-CSE-MsgGUID: wasWXw7KT9OwZQZ0MZgjlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="127938735"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 07:04:25 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, jari.tahvanainen@intel.com,
 Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2] scripts/test_list: Do not stop the build process if
 documantion fails
Date: Thu, 20 Mar 2025 19:35:08 +0530
Message-ID: <20250320140508.825945-1-karthik.b.s@intel.com>
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

Current approach stops whole build process on a case that there is mistake
on documentation. Let's have entry on logs instead and continue.

Small fix also related multiline data e.g. on Description part.

Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/test_list.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 867d28400..5f1b4218b 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1399,7 +1399,7 @@ class TestList:
 
                 # Handle multi-line field contents
                 if current_field:
-                    match = re.match(r'\s+(.*)', file_line)
+                    match = re.match(r'(.*)', file_line)
                     if match:
                         if handle_section == 'test':
                             dic = self.doc[current_test]
@@ -1408,7 +1408,7 @@ class TestList:
 
                         if dic[current_field] != '':
                             dic[current_field] += " "
-                        dic[current_field] += match.group(1)
+                        dic[current_field] += match.group(1).strip()
                         continue
 
                 # Handle multi-line argument contents
@@ -1427,7 +1427,7 @@ class TestList:
                     continue
 
                 file_line.rstrip(r"\n")
-                sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
+                printf(f"{fname}:{file_ln + 1}: Warning: unrecognized line. Need to add field at %s?\n\t==> %s" %
                          (config_origin, file_line))
 
     def show_subtests(self, sort_field):
-- 
2.43.0

