Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3BFC369C2
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 09:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688C410E010;
	Fri, 25 Apr 2025 09:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCyVfZMP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE2310E010
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 09:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745574573; x=1777110573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jxo1PWoyAlj94A0otjUKjyjtVpzCh0Iqn15PAc+L0hU=;
 b=SCyVfZMP51d4hftR/Pl3jsemFlH0QyoqNsqVIjRZOwADBYSx2nBznZS4
 NAsXWDqbrftXVbmLv1OX8bP/9YYzhtaPXg50wv7TGiLdW6ci5dIdVrfLx
 d08k4N2JDjoZFuuCtztCNuE6rm+2/LBWNt57Bwarh0eHfmterBJw0jbkA
 Qc5DJikwnbWKktH84y22d+AyG23myJ1hJZ9osj3m1fMGdfBheH7SDHf4D
 3WlHrCW5RDTKeVRPO3xv6krrFcFFGlhcPiABnoRKxu0wpv2R+SwCeXzdP
 LItHKAbILLvTdf7Ij+hJcFed0sbnmvk2MxHzsADJI8zsoX0AYgeXRFBBj w==;
X-CSE-ConnectionGUID: vucS3QsCTC67xnB3ysXpzw==
X-CSE-MsgGUID: KAhFcslKS4mfHMKQhoAhpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57874361"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="57874361"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:49:33 -0700
X-CSE-ConnectionGUID: mwPtPRgHSWWezKY0Y32bJw==
X-CSE-MsgGUID: t0bguMCWTdK8V8kJyNOCxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132606768"
Received: from szymonos-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.252.47])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:49:31 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_facts: Remove NULL and bool comparisions
Date: Fri, 25 Apr 2025 11:49:02 +0200
Message-ID: <20250425094904.221857-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Remove comparisons to NULL, true, and false using ! when appropriate.
For example, from if (old_value == NULL && new_value != NULL)
               to if (!old_value && new_value)

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_facts.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/lib/igt_facts.c b/lib/igt_facts.c
index 2e04a7c86..d38be0726 100644
--- a/lib/igt_facts.c
+++ b/lib/igt_facts.c
@@ -85,7 +85,7 @@ static void igt_facts_log(const char *last_test, const char *name,
 	char *uptime = NULL;
 	const char *before_tests = "before any test";
 
-	if (old_value == NULL && new_value == NULL)
+	if (!old_value && !new_value)
 		return;
 
 	if (clock_gettime(CLOCK_BOOTTIME, &uptime_ts) != 0)
@@ -97,7 +97,7 @@ static void igt_facts_log(const char *last_test, const char *name,
 		 uptime_ts.tv_nsec / 1000);
 
 	/* New fact */
-	if (old_value == NULL && new_value != NULL) {
+	if (!old_value && new_value) {
 		igt_info("[%s] [FACT %s] new: %s: %s\n",
 			 uptime,
 			 last_test ? last_test : before_tests,
@@ -107,7 +107,7 @@ static void igt_facts_log(const char *last_test, const char *name,
 	}
 
 	/* Update fact */
-	if (old_value != NULL && new_value != NULL) {
+	if (old_value && new_value) {
 		igt_info("[%s] [FACT %s] changed: %s: %s -> %s\n",
 			 uptime,
 			 last_test ? last_test : before_tests,
@@ -118,7 +118,7 @@ static void igt_facts_log(const char *last_test, const char *name,
 	}
 
 	/* Deleted fact */
-	if (old_value != NULL && new_value == NULL) {
+	if (old_value && !new_value) {
 		igt_info("[%s] [FACT %s] deleted: %s: %s\n",
 			 uptime,
 			 last_test ? last_test : before_tests,
@@ -213,7 +213,7 @@ static bool igt_facts_list_add(const char *name,
 	igt_fact *new_fact = NULL, *old_fact = NULL;
 	bool logged = false;
 
-	if (name == NULL || value == NULL)
+	if (!name || !value)
 		return false;
 
 	old_fact = igt_facts_list_get(name, head);
@@ -228,7 +228,7 @@ static bool igt_facts_list_add(const char *name,
 	}
 
 	new_fact = malloc(sizeof(igt_fact));
-	if (new_fact == NULL)
+	if (!new_fact)
 		return false;
 
 	new_fact->name = strdup(name);
@@ -523,7 +523,7 @@ static void igt_facts_scan_pci_drm_cards(const char *last_test)
 		 * If the device has '-' in the name, contine
 		 */
 		if (strncmp(drm_name, "card", 4) != 0 ||
-		    strchr(drm_name, '-') != NULL) {
+		    strchr(drm_name, '-')) {
 			udev_device_unref(drm_dev);
 			continue;
 		}
@@ -586,7 +586,7 @@ static void igt_facts_scan_kernel_taints(const char *last_test)
 
 	igt_facts_list_mark(head);
 
-	while ((reason = igt_explain_taints(&taints)) != NULL) {
+	while ((reason = igt_explain_taints(&taints))) {
 		/* Cut at the ':' to get only the taint name */
 		taint_name = strtok(strdup(reason), ":");
 		if (!taint_name)
@@ -677,18 +677,18 @@ static void igt_facts_test_add_get(struct igt_list_head *head)
 	const char *last_test = NULL;
 
 	ret = igt_facts_list_add(name, value, last_test, head);
-	igt_assert(ret == true);
+	igt_assert(ret);
 
 	/* Assert that there is one element in the linked list */
 	igt_assert_eq(igt_list_length(head), 1);
 
 	/* Assert that the element in the linked list is the one we added */
 	fact = igt_facts_list_get(name, head);
-	igt_assert(fact != NULL);
+	igt_assert(fact);
 	igt_assert_eq(strcmp(fact->name, name), 0);
 	igt_assert_eq(strcmp(fact->value, value), 0);
-	igt_assert(fact->present == true);
-	igt_assert(fact->last_test == NULL);
+	igt_assert(fact->present);
+	igt_assert(!fact->last_test);
 }
 
 /**
@@ -730,11 +730,11 @@ static void igt_facts_test_mark_and_sweep(struct igt_list_head *head)
 	/* Assert that the two updated elements are present */
 	fact = igt_facts_list_get(name1, head);
 	igt_assert(fact != NULL);
-	igt_assert(fact->present == true);
+	igt_assert(fact->present);
 
 	fact = igt_facts_list_get(name2, head);
 	igt_assert(fact != NULL);
-	igt_assert(fact->present == true);
+	igt_assert(fact->present);
 
 	/* Assert that the third element was deleted */
 	fact = igt_facts_list_get(name3, head);
@@ -764,9 +764,9 @@ void igt_facts_test(void)
 	igt_facts_test_add_get(&igt_facts_list_pci_gpu_head);
 
 	/* Assert that igt_facts_list_mark_and_sweep() cleans up the list */
-	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == false);
+	igt_assert(!igt_list_empty(&igt_facts_list_pci_gpu_head));
 	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
-	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == true);
+	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head));
 
 	/* Test the mark and sweep pattern used to delete elements
 	 * from the list
-- 
2.43.0

