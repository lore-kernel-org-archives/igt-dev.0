Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D320ECF64A2
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 08:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF3410E70C;
	Thu, 20 Nov 2025 08:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/de4Ay1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1F510E70C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763626199; x=1795162199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RHM5ePIIQ6570ryhcOgJTzecxFraRwHRavYcnh4tB+o=;
 b=D/de4Ay1xZ3zv/uNopqzC6ZhOii8aJVZqvMvepFhqUuovNnK5SWR1h3W
 gpz/A7/KVCyb79XPe1+WxkKVyDaLolcSiZQj2yGmHnWlNGHWlmh386uRs
 7i7jW4AuMQjh/8DYWY1+hF4HbusimZdfOWFcEDXKBes1YGA+Bw3+xz6z/
 WXFJTyUvCqB6/eBuxBSnEkkEE0Zmx50yP02sFyBtAdIBWQ7nG3cnl5TQR
 5tAAHl0GPVQbFBuX0IUTs7cSJTfcDSAp8JyUF/poI0ux18UPi4n6jRWM/
 RDfO1B1PvmmwBEy8b80AakTDAPv8MGMPmJid0SiseBq3hK+cMSiZTnY+h g==;
X-CSE-ConnectionGUID: RlkvWQV7Qfm12tQMWHXr8A==
X-CSE-MsgGUID: +jLgnFnyS4qExSHlapuH6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65618213"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65618213"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 00:09:59 -0800
X-CSE-ConnectionGUID: g0zb3Z05QSCO+GEqPycM9A==
X-CSE-MsgGUID: VWnrjwHyRIamNu/A9qIp6Q==
X-ExtLoop1: 1
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2025 00:09:57 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v4 1/3] tools/intel_gpu_frequency: Add support for get,
 set in order & vice-versa
Date: Thu, 20 Nov 2025 13:22:37 +0530
Message-Id: <20251120075239.1372105-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120075239.1372105-1-s.sebinraj@intel.com>
References: <20251120075239.1372105-1-s.sebinraj@intel.com>
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

Add proper conditions for handling get and set in order (also
vice-versa), as the same was failing before with the below error.
To note here, In this scenario w.r.t set operation, only
writable sysfs path has to be used ie. [min, max].

Error: set_frequency:
	Assertion `fprintf(freq_info->filp, "%d", val) > 0' failed.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 tools/intel_gpu_frequency.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 8c3c91313..2f43bf6fc 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -176,7 +176,7 @@ parse_version_or_help(int argc, char *argv[])
 
 /* Returns read or write operation */
 static bool
-parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
+parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq, bool *reader)
 {
 	int c, tmp;
 	bool write = false;
@@ -207,13 +207,12 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 
 		switch (c) {
 		case 'g':
-			if (write == true)
-				fprintf(stderr, "Read and write operations not support simultaneously.\n");
 			{
 				int i;
 				for (i = 0; i < act_upon_n; i++)
 					act_upon[i] = true;
 			}
+			*reader = true;
 			break;
 		case 's':
 			if (!optarg)
@@ -302,7 +301,7 @@ done:
 int main(int argc, char *argv[])
 {
 
-	bool write, fail, targets[MAX+1] = {false};
+	bool write, reader = false, fail, targets[MAX+1] = {false};
 	int i, fd, try = 1, set_freq[MAX+1] = {0};
 
 	parse_version_or_help(argc, argv);
@@ -312,7 +311,7 @@ int main(int argc, char *argv[])
 	device = igt_device_get_card_index(fd);
 	close(fd);
 
-	write = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq);
+	write = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq, &reader);
 	fail = write;
 
 	/* If we've previously locked the frequency, we need to make sure to set things
@@ -329,18 +328,24 @@ again:
 		fprintf(stderr, "Did not achieve desired freq.\n");
 		exit(EXIT_FAILURE);
 	}
-	for (i = 0; i < ARRAY_SIZE(targets); i++) {
-		if (targets[i] == false)
-			continue;
 
-		if (write) {
+	if (write) {
+		/* only reset and set max & min act_upons flags if a read operation is also requested */
+		if (reader != false) {
+			for (int j = 0; j < ARRAY_SIZE(targets); j++)
+				targets[j] = false;
+			targets[MIN] = true;
+			targets[MAX] = true;
+		}
+
+		for (i = 0; i < ARRAY_SIZE(targets); i++) {
+			if (targets[i] == false)
+				continue;
 			set_frequency(&info[i], set_freq[i]);
 			if (get_frequency(&info[i]) != set_freq[i])
 				fail = true;
 			else
 				fail = false;
-		} else {
-			printf("%s: %d MHz\n", info[i].name, get_frequency(&info[i]));
 		}
 	}
 
@@ -349,6 +354,13 @@ again:
 		goto again;
 	}
 
+	if (reader || argc == 1) {
+		for (i = 0; i < ARRAY_SIZE(targets); i++) {
+			/* loop for all frequencies for get operations */
+			printf("%s: %d MHz\n", info[i].name, get_frequency(&info[i]));
+		}
+	}
+
 	for (i = 0; i < ARRAY_SIZE(targets); i++) {
 		if (info[i].filp) {
 			fclose(info[i].filp);
-- 
2.43.0

