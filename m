Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A64C48BF8
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 19:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607BD10EA4B;
	Thu, 22 Feb 2024 19:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSrplliX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E4010EA44
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 19:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708630390; x=1740166390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w5pbZ+pudDU8u5cD+3zeKWb7fvdpMOo0Tbrhuj/yo6o=;
 b=iSrplliX2nEIgreAi2EmbFxp/BWwdnsXuKY5KHUhtSClxVwpRVL4oPFx
 17/5xlhdG5jC2bTkwTjnJWXP+KfpxIOr9fblXRro5Xd1uIqdIhgLHJpRr
 4wLw5+oUPUHna1Buk31fvdBDbB6xG4LCH5VapHZIYqfIGL/sAoHr75nVX
 cRIHM7LnHRi2dZDT1Ifzo7aggkNBTAfzBtm524DDqY/y/xARCQkAZqmMI
 ReBf6Wddhr9wTtqrmxaXtoOIugrVq0L3sHhgwKqCMfJ7LMUD+wPMuK1lX
 uHMlik6GNJt59KfsMnabQT6JLWzQnjiST9vJnZWrshI4eJlbKQFEHJTZ3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6706261"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6706261"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:33:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5910781"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:33:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 2/2] lib/igt_sysfs: make sure to write empty strings
Date: Thu, 22 Feb 2024 11:33:26 -0800
Message-ID: <20240222193326.3004623-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222193326.3004623-1-lucas.demarchi@intel.com>
References: <20240222193326.3004623-1-lucas.demarchi@intel.com>
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

Same thing happens when testing igt_sysfs_set():
       int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
       igt_sysfs_set(dirfd, "path", "");

Previously it was not really setting the param.

v2:
  - Fix return code from igt_sysfs_vprintf() to differentiate between
    writing 1 or 0 chars (Janusz)
  - Document the behavior of igt_sysfs_set() as being a higher-level
    than igt_sysfs_write().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_sysfs.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2b0225138..d5d5b249f 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -349,6 +349,9 @@ int igt_sysfs_get_num_gt(int device)
  * @len: the length to write
  *
  * This writes @len bytes from @data to the sysfs file.
+ * Contrary to igt_sysfs_set(), this does not automatically add a
+ * null char to terminate the data. It's caller responsibility to pass
+ * the right len according to the data being written.
  *
  * Returns:
  * The number of bytes written, or -errno on error.
@@ -406,7 +409,12 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
  */
 bool igt_sysfs_set(int dir, const char *attr, const char *value)
 {
-	int len = strlen(value);
+	/*
+	 * Always write the null char at the end, to guarantee the write goes
+	 * through, even for an empty string.
+	 */
+	int len = strlen(value) + 1;
+
 	return igt_sysfs_write(dir, attr, value, len) == len;
 }
 
@@ -506,7 +514,7 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
 {
 	char stack[128], *buf = stack;
 	va_list tmp;
-	int ret, fd;
+	int ret, fd, len;
 
 	fd = openat(dir, attr, O_WRONLY);
 	if (igt_debug_on(fd < 0))
@@ -515,11 +523,12 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
 	va_copy(tmp, ap);
 	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
 	va_end(tmp);
+
 	if (igt_debug_on(ret < 0))
 		return -EINVAL;
 
 	if (ret > sizeof(stack)) {
-		unsigned int len = ret + 1;
+		len = ret + 1;
 
 		buf = malloc(len);
 		if (igt_debug_on(!buf))
@@ -532,13 +541,22 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
 		}
 	}
 
-	ret = igt_writen(fd, buf, ret);
+	/*
+	 * Make sure to always issue a write() syscall, even if writing an
+	 * empty string, otherwise values in sysfs like module parameters don't
+	 * really get overwritten.  vsnprintf() guarantees to return a \0
+	 * terminated string, so just add that char. The return code is still
+	 * the same as before, to abstract that from caller.
+	 */
+	len = ret + 1;
+
+	ret = igt_writen(fd, buf, len);
 
 	close(fd);
 	if (buf != stack)
 		free(buf);
 
-	return ret;
+	return ret == len ? len - 1 : ret;
 }
 
 /**
-- 
2.43.0

