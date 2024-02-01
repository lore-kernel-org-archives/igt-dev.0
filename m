Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD43C47258
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 03:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A61510FE8A;
	Thu,  1 Feb 2024 03:11:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B0110FE89
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 03:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706757102; x=1738293102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kz8av69IB7FvI84qh+yQSZrz58pUn4Lt7ycxZfzx6R4=;
 b=MXt/Lo0N+xCMO8y3vMSP7T43VI7Rt81Xxvdt3d6pZaqIXHugEL74umcW
 qsBJCKsSqL/EbWFXAM4pNYZikQdh5onZt17L5qDSevxWpXMowsxJZyx3T
 +GMawPLYmcMrPVAjF3Kp2g9xL/PSVp6mTMbjEB8Cp5QbY/1VICIwV/pvy
 11Tkm+QbY6yZ7FQbAGv7pJmmXMgClTm6Ud0VeI9ivR4bHi4Aowh/2HFSs
 OWG57Uoz9ogu3MOJf3qq//nj2VzbAD6MC6zC29fANo+O0zAPMLQxYTa6C
 nbaPN1PSy2aDriSKAm6z5vNd51M5NWKjAqDVKMHsh0PgcFzgIvW8ujlye A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17180845"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="17180845"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 19:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4259179"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 19:11:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2] lib/igt_sysfs: make sure to write empty strings
Date: Wed, 31 Jan 2024 19:11:56 -0800
Message-ID: <20240201031156.352973-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201005115.352192-3-lucas.demarchi@intel.com>
References: <20240201005115.352192-3-lucas.demarchi@intel.com>
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

	echo -n "" > /sys/module/<modulename>/parameters/<param>

doesn't really work as it will just create a open() + close() expecting
the file to be truncated. The same issue happens with igt as it will
stop writing when there are 0 chars to write. Special case the empty
string so it always write a '\0' and make sure igt_sysfs_set() accounts
for the extra null char.

Shell example:
	# echo -n "/foo" > /sys/module/firmware_class/parameters/path
	# cat /sys/module/firmware_class/parameters/path
	/foo
	# echo -n "" > /sys/module/firmware_class/parameters/path
	/foo
	# # make sure to actually write a \0:
	echo -ne "\0" > /sys/module/firmware_class/parameters/path
	# cat /sys/module/firmware_class/parameters/path
	/foo

Same thing happens when testing igt_sysfs_set():
       int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
       igt_sysfs_set(dirfd, "path", "");

Previously it was not really setting the param.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_sysfs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 567b4f6d5..64c2aaabb 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -406,7 +406,7 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
  */
 bool igt_sysfs_set(int dir, const char *attr, const char *value)
 {
-	int len = strlen(value);
+	int len = strlen(value) + 1;
 	return igt_sysfs_write(dir, attr, value, len) == len;
 }
 
@@ -513,8 +513,16 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
 		return -errno;
 
 	va_copy(tmp, ap);
-	ret = vsnprintf(buf, sizeof(stack), fmt, tmp);
+	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
 	va_end(tmp);
+
+	/*
+	 * make sure to always issue a write() syscall, even if writing an empty string,
+	 * otherwise values in sysfs like module parameters don't really get overwritten
+	 */
+	if (igt_debug_on(ret == 0))
+		return igt_writen(fd, "", 1);
+
 	if (igt_debug_on(ret < 0))
 		return -EINVAL;
 
-- 
2.43.0

