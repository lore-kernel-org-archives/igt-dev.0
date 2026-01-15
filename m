Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B08D44C41
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 12:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A801610E74D;
	Thu, 15 Jan 2026 12:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWAA+zAR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404F710E74B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 12:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768481874; x=1800017874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=37YocPPaU+eCzJJDrRreQ/vq+BkI3CmxZ/NDusJ27Co=;
 b=SWAA+zARoqYa8wU27paPbgEYiOXCpFODd6TFSGuHe/3jw2qyDkeT9GGM
 W9lxnqjekylYUXVv9alwQ4QkrKLSlGD35qTn4B5SHe5OdJ997sdm1Dngt
 J71DiW0v3UGlmOze8uGNHBHgLWX/jZ6FDFO89EWAiHCIx6rs3VkVBQ883
 EfVhGaeGUpd3MC7YX1JmbsRF4nkKyaf6iKFgKhzJdWuPQl/QlWBL/UsZy
 9FTcpx2Mnqn3vJ5mM+iZAuF9U5Ukz3iMO0SrGj7ajP/sngicfhuQmoEqi
 6nzRogHl5gcvvEvXXeCbvsqLBE9T5Qg99Zuz4A2g4PBH7PzLquFAk22aE Q==;
X-CSE-ConnectionGUID: 5knBsQC7QRuyC0Q/hrnSeg==
X-CSE-MsgGUID: GJ1PamhQR66VmTC5KqHMzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73628846"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="73628846"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 04:57:54 -0800
X-CSE-ConnectionGUID: AssJotU/SFyNwXauI2A5HQ==
X-CSE-MsgGUID: lIEWb8gORwGPYhECe4kxpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204093202"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.21])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:57:51 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 3/4] RFC: runner/resultgen: add compressed dmesg
 before reduction
Date: Thu, 15 Jan 2026 13:57:31 +0100
Message-ID: <20260115125732.20542-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115125732.20542-1-kamil.konieczny@linux.intel.com>
References: <20260115125732.20542-1-kamil.konieczny@linux.intel.com>
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

From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Before reducing dmesg in results.json, compress it with zlib
and encode into base64 format, then add to json. With this,
original dmesg should be available for inspection.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 71 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 6080ddc0e..a2e4e7c7d 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -8,6 +8,7 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <unistd.h>
+#include <zlib.h>
 
 #include <json.h>
 
@@ -961,6 +962,59 @@ static void generate_formatted_dmesg_line(char *message,
 	*f = '\0';
 }
 
+static struct json_object *encode_compressed_base64(const char *data, size_t len, size_t *osize)
+{
+	uLongf destLen;
+	unsigned char *dest;
+	gchar *b64_text;
+	struct json_object *obj;
+
+	if (osize)
+		*osize = 0;
+	if (len == 0)
+		return NULL;
+
+	destLen = compressBound(len);
+	dest = malloc(destLen);
+
+	if (!dest)
+		return NULL;
+
+	if (compress(dest, &destLen, (const unsigned char*)data, len) != Z_OK) {
+		free(dest);
+		return NULL;
+	}
+
+	*osize = (size_t)destLen;
+	b64_text = g_base64_encode((const guchar *)dest, (gsize)destLen);
+	obj = json_object_new_string(b64_text);
+
+	g_free(b64_text);
+	free(dest);
+
+	return obj;
+}
+
+static void add_compressed_dmesg(struct json_object *obj,
+				 const char *name,
+				 const char *dmesg,
+				 size_t dmesglen)
+{
+	struct json_object *compressed_obj;
+	size_t compressed_size;
+
+	//if (settings && settings->compress_dmesg && dmesglen > 0) {
+	compressed_obj = encode_compressed_base64(dmesg, dmesglen, &compressed_size);
+
+	if (compressed_obj) {
+		json_object_object_add(obj, name, compressed_obj);
+		fprintf(stderr, "igt_resultgen: Compresed %s with size reduced from %ld to %ld.\n",
+			name, dmesglen, compressed_size * 4 / 3);
+	} else {
+		fprintf(stderr, "igt_resultgen: Compression for %s failed.\n", name);
+	}
+}
+
 static void __add_dmesg(struct json_object *obj,
 			const char *dmesg, size_t dmesglen,
 			const char *warnings, size_t warningslen)
@@ -987,10 +1041,15 @@ static void add_dmesg(struct json_object *obj,
 	if (warnings || !reduced_dmesg_size || dmesglen <= reduced_dmesg_size)
 		return __add_dmesg(obj, dmesg, dmesglen, warnings, warningslen);
 
+	/* Add compressed dmesg */
+	/* TODO - this should be controlled by option */
+	add_compressed_dmesg(obj, "dmsg.gz", dmesg, dmesglen);
+
+	/* take from begin and from end of dmesg, each of size 'half' */
 	end = dmesg + dmesglen;
 
-	rsize = reduced_dmesg_size + 256;
-	reduced = malloc(rsize); /* +256 for last message */
+	rsize = reduced_dmesg_size + 512; /* place for messages */
+	reduced = malloc(rsize);
 	if (!reduced) {
 		fprintf(stderr, "resultgen: malloc error, no reduction\n");
 		return __add_dmesg(obj, dmesg, dmesglen, warnings, warningslen);
@@ -999,6 +1058,7 @@ static void add_dmesg(struct json_object *obj,
 	half = reduced_dmesg_size / 2;
 	memcpy(reduced, dmesg, half);
 
+	/* reduce it by few lines so it will break on newline */
 	for (p = reduced + half - 1; p > reduced; --p)
 		if (*p == '\n')
 			break;
@@ -1013,10 +1073,12 @@ static void add_dmesg(struct json_object *obj,
 
 	len = p - reduced;
 
+	/* add info in middle - this is dropped from dmesg */
 	memcpy(reduced + len, middleinfo, strlen(middleinfo));
 	len += strlen(middleinfo);
 	middle = reduced + len;
 
+	/* find part at end of dmesg to glue, start after newline */
 	for (p = dmesg + (dmesglen - half); p < end; p++)
 		if (*p == '\n')
 			break;
@@ -1031,8 +1093,9 @@ static void add_dmesg(struct json_object *obj,
 	middle += lastlen;
 	len += lastlen;
 
-	/* add also last message to inform about reduction */
-	len += sprintf(middle, "...dmesg reduced from %ld to %ld\n", dmesglen, len);
+	/* add also last message to easy spot reduction */
+	len += sprintf(middle, "...dmesg reduced from %ld to %ld\n"
+		       "...saved in dmsg.gz in json\n", dmesglen, len);
 	fprintf(stderr, "resultgen: dmesg reduced from %ld to %ld\n", dmesglen, len);
 	json_object_object_add(obj, "dmesg",
 			       new_escaped_json_string(reduced, len));
-- 
2.52.0

