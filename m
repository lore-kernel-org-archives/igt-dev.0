Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AF3CCF9F0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 15:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8D710E9F8;
	Thu, 30 Oct 2025 15:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSuoIHPG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F5710E9F8
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761838714; x=1793374714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d7teD/yLCnaZNKOUuwbKOBvnl3h3kHUb1ItNdA1EOrM=;
 b=QSuoIHPGOAAhhWB43VG/l3QQpt0DFgGtmgYslnqrNSVMKrEFA+1UB8j3
 db6OscbOk6EvmUbaRFevGJfePUdqDHPSHGoscZResyY07AaGFPL92cMdj
 YlexGwzu3JFdPqXdyP0dYzdoH8jMPk/k/FRoXK1C0i7bku/4uBdv0F0zS
 ytrnKMg6JRyGUle38D7/GZwQ65ZPeM8YbG02l24q2z9JTXE/BCMu8dKNh
 ioJdEmKE9xCxkfw208T/RYvzfxTlM1+Jseduj0CWXoyBlFNZgceLsk2Kd
 rY4soT534+b2eSVO43NShH7bLTro0F5hx5aKOL9Yu4ia2iETjhCohP9oO A==;
X-CSE-ConnectionGUID: oydXK8muQXmFxgilybTeZg==
X-CSE-MsgGUID: sBkIVvmGTtCmurQdBO5bjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67845624"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67845624"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:38:34 -0700
X-CSE-ConnectionGUID: +3sRRpiqQ4KCEFgFl/9D8w==
X-CSE-MsgGUID: 7cFJg/HMQpWOHezgWytLJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185190422"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa006.jf.intel.com with ESMTP; 30 Oct 2025 08:38:33 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v2 1/3] tools/intel_gpu_frequency: Add proper checks as
 R/W not supported simaltaneously
Date: Thu, 30 Oct 2025 20:54:03 +0530
Message-Id: <20251030152405.3422044-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030152405.3422044-1-s.sebinraj@intel.com>
References: <20251030152405.3422044-1-s.sebinraj@intel.com>
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

Add conditions properly for Read and write operations as they are not
supported simaltaneously, since a file-pointer once opened in read
mode, cannot be used for write, the same goes vice-versa.

Error: set_frequency:
	Assertion `fprintf(freq_info->filp, "%d", val) > 0' failed.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 tools/intel_gpu_frequency.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index de0c6ddba..3378f3927 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -155,6 +155,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 {
 	int c, tmp;
 	bool write = false;
+	bool reader = false;
 
 	/* No args means -g" */
 	if (argc == 1) {
@@ -182,13 +183,17 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 
 		switch (c) {
 		case 'g':
-			if (write == true)
-				fprintf(stderr, "Read and write operations not support simultaneously.\n");
+			if (write == true) {
+				fprintf(stderr,
+					"Read and write operations not support simultaneously.\n");
+				exit(EXIT_FAILURE);
+			}
 			{
 				int i;
 				for (i = 0; i < act_upon_n; i++)
 					act_upon[i] = true;
 			}
+			reader = true;
 			break;
 		case 's':
 			if (!optarg)
@@ -199,6 +204,12 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 				exit(EXIT_FAILURE);
 			}
 
+			if (reader == true) {
+				fprintf(stderr,
+					"Read and write operations not support simultaneously.\n");
+				exit(EXIT_FAILURE);
+			}
+
 			write = true;
 			act_upon[MIN] = true;
 			act_upon[MAX] = true;
-- 
2.43.0

