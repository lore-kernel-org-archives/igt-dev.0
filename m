Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAA1C4828E
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 00:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CAA10FE09;
	Thu,  1 Feb 2024 00:51:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B353F10FE05
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 00:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706748673; x=1738284673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bZteBQ+GD3Qd6GiGKiY6ogtOXxfQ8k8BxSYWnLEtARM=;
 b=Xj3874P/Df8AWKHvzPcY5qiBeUsEUXkpFAy7wAfxh2WvbP4G0s81JgHL
 a27sREHwPMlZgnbmzy2aa6iCabfEGB5MjEl8nBuVsZxopyuwy+ia1sg0Z
 39WCJozSpv1oGYzcX1yzlUK/81z4nt4stSc4yD9wXTswpP1IKtk45uLk/
 QJT4LY2Sjfi4LHEaK49UDJF0EbpWkEICeMX/7SCiRZ9dSRC2/LdjuRaNj
 mIDlxrh2rlfnxWdIoyioMXh0ydQKHVAucJ5BG50Ls6AHUuuAZnWr/S963
 aL8weVzTT2aiuk20l2BKkPcixSnfpj3klu8bpEzFZbLkQxLaHaQ6TVsJv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3608557"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="3608557"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911966777"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="911966777"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:51:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] lib/igt_sysfs: make sure to write empty strings
Date: Wed, 31 Jan 2024 16:50:29 -0800
Message-ID: <20240201005115.352192-3-lucas.demarchi@intel.com>
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
index 567b4f6d5..814220ddb 100644
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
+	if (igt_debug_on(ret = 0))
+		return igt_writen(fd, "", 1);
+
 	if (igt_debug_on(ret < 0))
 		return -EINVAL;
 
-- 
2.43.0

