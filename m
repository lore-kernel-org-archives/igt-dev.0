Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD9EC5B542
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 08:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A765610E2AA;
	Mon, 26 May 2025 08:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3hQJDcB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167CB10E2A5
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 08:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748246813; x=1779782813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CK8AzBUCPnmlSAEcG9oc/Nu7LxARfeyVjGTGzMDxkPE=;
 b=S3hQJDcBDdLNygP0mNati/JoweV8u/YG2CXlzwxxwcSkTXbVOkx5iJoP
 J12SGx+iCqQfBg1Cmyu2BfTL3WekI/AkgjRq4bJzmAhKS1BJEsRiEVc8/
 s8/GKDiNOrEO+XgBaP1aMIeoLCqC/o2Rt3XgujOiwQYTIX82bWIFV7H3A
 pgd+q8iW8uTkmfa13YU+BKjXCylM+ilaxcyHRvgKzulhiHc34doZuZbuE
 Pzm2uUAuZEOeM2jNEQNg/dRy7mm1tRQ5Lc/jA7/dGTmIXcZZYd4ZyRsm4
 jE6blGpTcTomEiKqrsfCeKiM6BiXW/aXbH8Ak3BNxe/qZfEtB/q7u+Rag w==;
X-CSE-ConnectionGUID: yiLnfBweS3ORaeJqWxrbrQ==
X-CSE-MsgGUID: A3XSaNibR6yfQRbA44htbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="67762840"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="67762840"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 01:06:53 -0700
X-CSE-ConnectionGUID: kfgNJtJKT1uJwvDqdHGZvQ==
X-CSE-MsgGUID: ZshQrlJ6S4SSrpolFM+yMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142208383"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 01:06:51 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t v3 5/8] lib/xe/xe_sriov*: fixup print/scan formatting
 for files in lib
Date: Mon, 26 May 2025 08:07:37 +0000
Message-Id: <20250526080740.67790-6-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526080740.67790-1-jan.sokolowski@intel.com>
References: <20250526080740.67790-1-jan.sokolowski@intel.com>
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

Compiling on other architectures than x86-64 causes a lot
of print/scan formatting warnings.

Fix formatting by using proper formatters, eg. SCNu64.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/xe/xe_sriov_debugfs.c      | 18 +++++++++---------
 lib/xe/xe_sriov_provisioning.c |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index 8f30fa312..9b743f657 100644
--- a/lib/xe/xe_sriov_debugfs.c
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -105,18 +105,18 @@ static int parse_provisioned_range(const char *line,
 	switch (res) {
 	case XE_SRIOV_SHARED_RES_CONTEXTS:
 	case XE_SRIOV_SHARED_RES_DOORBELLS:
-		if (sscanf(line, "VF%u: %lu-%lu", &range->vf_id, &range->start, &range->end) == 3)
+		if (sscanf(line, "VF%u: %" SCNu64 "-%" SCNu64, &range->vf_id, &range->start, &range->end) == 3)
 			ret = 0;
 		break;
 	case XE_SRIOV_SHARED_RES_GGTT:
-		if (sscanf(line, "VF%u: %lx-%lx", &range->vf_id, &range->start, &range->end) == 3)
+		if (sscanf(line, "VF%u: %" SCNx64 "-%" SCNx64, &range->vf_id, &range->start, &range->end) == 3)
 			ret = 0;
 		break;
 	case XE_SRIOV_SHARED_RES_LMEM:
 		/* Convert to an inclusive range as is the case for other resources.
 		 * The start is always 0 and the end is the value read - 1.
 		 */
-		if (sscanf(line, "VF%u: %lu", &range->vf_id, &range->end) == 2)
+		if (sscanf(line, "VF%u: %" SCNu64, &range->vf_id, &range->end) == 2)
 			ret = 0;
 		if (!range->end)
 			return -1;
@@ -232,8 +232,8 @@ static int validate_vf_ids(enum xe_sriov_shared_res res,
 				  nr_ranges);
 			for (unsigned int i = 0; i < limit; i++) {
 				igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
-						  "%s:VF%u: %lx-%lx\n" :
-						  "%s:VF%u: %lu-%lu\n",
+						  "%s:VF%u: %" PRIx64 "-%" PRIx64 "\n" :
+						  "%s:VF%u: %" PRIu64 "-%" PRIu64 "\n",
 					  xe_sriov_shared_res_to_string(res),
 					  ranges[i].vf_id, ranges[i].start, ranges[i].end);
 			}
@@ -504,16 +504,16 @@ int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
 	while (getline(&line, &n, file) >= 0) {
 		switch (res) {
 		case XE_SRIOV_SHARED_RES_CONTEXTS:
-			ret = sscanf(line, "GuC contexts: %lu", value);
+			ret = sscanf(line, "GuC contexts: %" SCNu64, value);
 			break;
 		case XE_SRIOV_SHARED_RES_DOORBELLS:
-			ret = sscanf(line, "GuC doorbells: %lu", value);
+			ret = sscanf(line, "GuC doorbells: %" SCNu64, value);
 			break;
 		case XE_SRIOV_SHARED_RES_GGTT:
-			ret = sscanf(line, "GGTT size: %lu", value);
+			ret = sscanf(line, "GGTT size: %" SCNu64, value);
 			break;
 		case XE_SRIOV_SHARED_RES_LMEM:
-			ret = sscanf(line, "LMEM size: %lu", value);
+			ret = sscanf(line, "LMEM size: %" SCNu64, value);
 			break;
 		}
 
diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index aa265247e..2a02f7cc8 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -75,7 +75,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
 
 	*ranges = new_ranges;
 	if (*nr_ranges < MAX_DEBUG_ENTRIES)
-		igt_debug("Found VF%u GGTT range [%#x-%#x] num_ptes=%ld\n",
+		igt_debug("Found VF%u GGTT range [%#x-%#x] num_ptes=%zu\n",
 			  vf_id, start, end,
 			  (end - start + sizeof(xe_ggtt_pte_t)) /
 			  sizeof(xe_ggtt_pte_t));
-- 
2.34.1

