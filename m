Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E5ACF58FC
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 21:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD1610E696;
	Wed, 19 Nov 2025 21:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ggq+xHSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBFE10E696
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 21:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763586163; x=1795122163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IWH6hiIvTB8c5xgvo7IZ/yWDZNAxoUnMEWBqzd802r8=;
 b=Ggq+xHScGh97vCjEZQ/lfYabXTFoEC1nDT2TQRvfDDK0TYwM1ZyUS1fn
 WOwyb6YzhYFqiHTp61VBwl4Pu/NKtCBxmICN6TQ4fWRp08qkKeRzZVyIA
 7zM7ZQ07DwtZ0n7c1KnjMyvl31CplhUwRtn1Jm+x6IgT67hmqLYXR76XG
 1yxejoXyBhb5O1M5S38uRgvIbVGkfy4sex6+iL9nsjTBgUpj0AxJcLdry
 dTWNvbZYstHl7X8Mcl4hXH66Vny2Y8HuqvJdP0k5bR9w8duhO52eHHsH9
 7RGcSgqqIQS+BmNUeA2oA/aCIdC+WWqbI4EjUYknfWsLtJMcRg4NtFvaQ A==;
X-CSE-ConnectionGUID: aBRFZm3RTY+ZFZf4Oa5IxA==
X-CSE-MsgGUID: g2wBNh7fQeWtg5v29J3/PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68249388"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="68249388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 13:02:43 -0800
X-CSE-ConnectionGUID: wBHhRmTqR7G5IMAwkhKpAQ==
X-CSE-MsgGUID: pkfmVfhbTeGXdoUX36dL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="222099817"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2025 13:02:40 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v3 1/3] tools/intel_gpu_frequency: Add support for get,
 set in order & vice-versa
Date: Thu, 20 Nov 2025 02:15:28 +0530
Message-Id: <20251119204530.1357940-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119204530.1357940-1-s.sebinraj@intel.com>
References: <20251119204530.1357940-1-s.sebinraj@intel.com>
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
index de0c6ddba..2cf3cabb6 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -151,7 +151,7 @@ version(const char *prog)
 
 /* Returns read or write operation */
 static bool
-parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
+parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq, bool *reader)
 {
 	int c, tmp;
 	bool write = false;
@@ -182,13 +182,12 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 
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
@@ -280,7 +279,7 @@ done:
 int main(int argc, char *argv[])
 {
 
-	bool write, fail, targets[MAX+1] = {false};
+	bool write, reader = false, fail, targets[MAX+1] = {false};
 	int i, fd, try = 1, set_freq[MAX+1] = {0};
 
 	fd = __drm_open_driver(DRIVER_INTEL);
@@ -288,7 +287,7 @@ int main(int argc, char *argv[])
 	device = igt_device_get_card_index(fd);
 	close(fd);
 
-	write = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq);
+	write = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq, &reader);
 	fail = write;
 
 	/* If we've previously locked the frequency, we need to make sure to set things
@@ -305,18 +304,24 @@ again:
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
 
@@ -325,6 +330,13 @@ again:
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

