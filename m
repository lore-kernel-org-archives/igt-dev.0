Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9277CC4828C
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 00:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F0C10FE06;
	Thu,  1 Feb 2024 00:51:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F63810FE04
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 00:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706748673; x=1738284673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EX6BuyP2ClxXMEmGkSNfOj3bkyERUhj6bXO/X+iDSkI=;
 b=K7DHXKme/T0W6fx92vVXSo9QJgM1mS1+OTACzsXIcYr/MtWdpjhqzaRE
 Qs4NWCfEvVDLKE3OZeq5huJBuR2JO4Sts+4UmrzAOwAYqstToWoA8BjGy
 S0hj2nGJ90Am2ESyMmo3P8JDCTQsI7i+bc2qQxOgjVB6dFrhEmJ8ZKTNa
 WMSstWcxF2U7qOKMGUWpgJPCF1emWjBAmLPhdq86/bnOeIJVnyrz3A4lq
 3APrhNCYfMyXbqOcjPjQ/UhAqTqj+5Yh7T8I1xkNs1lHXavW3PTOvvR2U
 f7zH4kUc6SswV2PhxN3rBT6KrzYNzileFB4pj3YVxHrJao5FGlw1XZK6v g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3608564"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="3608564"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911966780"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="911966780"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:51:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] lib/igt_sysfs: Fix dir fd documentation
Date: Wed, 31 Jan 2024 16:50:30 -0800
Message-ID: <20240201005115.352192-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201005115.352192-1-lucas.demarchi@intel.com>
References: <20240201005115.352192-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

These functions can be used for any path in sysfs, not exclusively to
attributes under igt_sysfs_open(). In fact, they are already used to
access other files like module parameters.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 814220ddb..bbcb16c81 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -343,7 +343,7 @@ int igt_sysfs_get_num_gt(int device)
 
 /**
  * igt_sysfs_write:
- * @dir: directory for the device from igt_sysfs_open()
+ * @dir: sysfs directory
  * @attr: name of the sysfs node to open
  * @data: the block to write from
  * @len: the length to write
@@ -369,7 +369,7 @@ int igt_sysfs_write(int dir, const char *attr, const void *data, int len)
 
 /**
  * igt_sysfs_read:
- * @dir: directory for the device from igt_sysfs_open()
+ * @dir: sysfs directory
  * @attr: name of the sysfs node to open
  * @data: the block to read into
  * @len: the maximum length to read
@@ -395,7 +395,7 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
 
 /**
  * igt_sysfs_set:
- * @dir: directory for the device from igt_sysfs_open()
+ * @dir: sysfs directory
  * @attr: name of the sysfs node to open
  * @value: the string to write
  *
@@ -412,7 +412,7 @@ bool igt_sysfs_set(int dir, const char *attr, const char *value)
 
 /**
  * igt_sysfs_get:
- * @dir: directory for the device from igt_sysfs_open()
+ * @dir: sysfs directory
  * @attr: name of the sysfs node to open
  *
  * This reads the value from the sysfs file.
-- 
2.43.0

