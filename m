Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2DC606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 21:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XUM+row3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD9910E6F8;
	Fri, 23 Oct 2026 21:07:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3FD10E6E7
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 21:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789394; x=1824325394;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=GO4i6SGuWt5gGG3iyzpdJaGQbq0UDouzeK6n6tt0dUM=;
 b=XUM+row3Hz71kGj9BW38tARhl62m10bO9XO2mlCIS2caUG8DfAoikXgw
 yUzG990MtxntDgclML/hxRGFbZGEdlv0mIL5t2Okw0DDTGtDiYLtFh6lS
 RRZHGkKECNwWePPlFpSpAmpO1z9sqUfweYMsevq2TJYaP+oH8skvVXMMK
 q2tiggUWtbvgLB8hck1ooCQshMwYcpxHLQYBmqrk3sJ6rvd8i/e6Yd431
 ZagDWHv90pvnn2wJtEyzOyw4GBI4ll7ILa7X8ioBEsTFL/xvVrYX5uNsn
 buVVPuSyr5lA76FV6/wyMHBQqK18+Tbsu+8XgHgITaD1eZGjJzqWdPYHD w==;
X-CSE-ConnectionGUID: VnmTW518Sgmu/qmMsmNmjA==
X-CSE-MsgGUID: yhLma1fuSzawxOrOKbTb1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457461"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1457461"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:10 -0700
X-CSE-ConnectionGUID: 6AXlZDFvS02ycAMApH56Xw==
X-CSE-MsgGUID: LF6uaNkLRsG8wnlq3X0xiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5585782"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:09 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:02:38 -0300
Subject: [PATCH i-g-t v3 03/11] lib/xe: Gather workarounds debugfs dumps in
 a cache struct
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_14026539277-v3-3-b8723ececb7f@intel.com>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
In-Reply-To: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In an upcoming change, we will cache workaround information in struct
xe_device.  As a preparation for that, add the logic to gather the
dumps of workaround debugfs files into a cache struct.  Such a cache
will be kept attached to xe_device as a follow-up.

v2:
  - Downgrade igt_warn_on() to igt_debug_on() when
    get_wa_debugfs_count() fails.

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com> # v1
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_wa.c | 148 ++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 114 insertions(+), 34 deletions(-)

diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index c0c97e244564..aaa0003297a4 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -8,6 +8,7 @@
 #include <stdint.h>
 #include <stdio.h>
 
+#include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 
@@ -16,6 +17,109 @@
 
 #include "tests/xe_wa.h"
 
+struct xe_wa_cache {
+	int num_dumps;
+	char *dumps[];
+};
+
+static void free_wa_debugfs_dumps(struct xe_wa_cache *wa_cache)
+{
+	for (int i = 0; i < wa_cache->num_dumps && wa_cache->dumps[i]; i++) {
+		free(wa_cache->dumps[i]);
+		wa_cache->dumps[i] = NULL;
+	}
+}
+
+static int get_wa_debugfs_count(int fd)
+{
+	int gt;
+	int count = 1; /* Device workarounds */
+
+	xe_for_each_gt(fd, gt)
+		count++;
+
+	return count;
+}
+
+static int get_wa_debugfs_dumps(int fd, struct xe_wa_cache *wa_cache)
+{
+	int gt;
+	int debugfs_fd;
+	int count;
+	int ret = 0;
+
+	debugfs_fd = igt_debugfs_dir(fd);
+	if (debugfs_fd == -1)
+		goto err;
+
+	count = 0;
+
+	if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
+		goto err;
+
+	xe_for_each_gt(fd, gt) {
+		char name[32];
+
+		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
+
+		if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, name)))
+			goto err;
+	}
+
+	if (igt_warn_on(count != wa_cache->num_dumps))
+		goto err;
+
+	goto out;
+
+err:
+	free_wa_debugfs_dumps(wa_cache);
+	ret = 1;
+
+out:
+	close(debugfs_fd);
+
+	return ret;
+}
+
+static void free_cache(struct xe_wa_cache *wa_cache)
+{
+	if (!wa_cache)
+		return;
+
+	free_wa_debugfs_dumps(wa_cache);
+	free(wa_cache);
+}
+
+static struct xe_wa_cache *build_cache(int fd)
+{
+	struct xe_wa_cache *wa_cache;
+	int num_dumps;
+
+	num_dumps = get_wa_debugfs_count(fd);
+	wa_cache = calloc(1, sizeof(*wa_cache) + num_dumps * sizeof(wa_cache->dumps[0]));
+
+	if (igt_warn_on(!wa_cache))
+		return NULL;
+
+	wa_cache->num_dumps = num_dumps;
+
+	/*
+	 * Some vendor-neutral tests (e.g. core_setmaster) drop root
+	 * privileges on purpose and it can cause
+	 * get_wa_debugfs_dumps() to fail. Since those are not
+	 * xe-specific and will not require information about
+	 * workarounds, let's avoid creating noise with igt_warn_on()
+	 * and limit ourselves to use igt_debug_on() here.
+	 */
+	if (igt_debug_on(get_wa_debugfs_dumps(fd, wa_cache))) {
+		free_cache(wa_cache);
+
+		return NULL;
+	}
+
+	return wa_cache;
+}
+
 static int debugfs_dump_has_wa(char *dump, const char *wa)
 {
 	size_t wa_len;
@@ -76,27 +180,6 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
 	return debugfs_dump_has_wa(dump, wa);
 }
 
-static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
-			       const char *debugfs_name, const char *wa)
-{
-	char *debugfs_dump;
-
-	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
-		return -1;
-
-	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
-	if (debugfs_dump) {
-		int ret = debugfs_dump_has_wa(debugfs_dump, wa);
-
-		free(debugfs_dump);
-
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 /**
  * xe_wa: Check if a workaround is enabled for the device.
  * @fd: A drm file descriptor.
@@ -106,25 +189,22 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
  */
 int xe_wa(int fd, const char *wa)
 {
-	int ret = 0;
-	int debugfs_fd;
-	unsigned int xe;
-	char name[256];
+	struct xe_wa_cache *wa_cache = build_cache(fd);
+	int ret;
 
-	debugfs_fd = igt_debugfs_dir(fd);
-	if (debugfs_fd == -1)
+	if (igt_warn_on(!wa_cache))
 		return -1;
 
-	xe_for_each_gt(fd, xe) {
-		sprintf(name, "gt%d/workarounds", xe);
-		ret = debugfs_file_has_wa(fd, debugfs_fd, name, wa);
-		if (ret)
+	ret = 0;
+
+	for (int i = 0; i < wa_cache->num_dumps; i++) {
+		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa)) {
+			ret = 1;
 			break;
+		}
 	}
 
-	if (!ret)
-		ret = debugfs_file_has_wa(fd, debugfs_fd, "workarounds", wa);
+	free_cache(wa_cache);
 
-	close(debugfs_fd);
 	return ret;
 }

-- 
2.56.0

