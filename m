Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F38DC02185
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 06:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7E710E1CE;
	Tue, 21 Jan 2025 06:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8QlV+kp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568A310E4D5
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 06:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737440548; x=1768976548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIlJIGO/LkzP30ePtL0uN04bYmUiC9+c9JtcvJqlxJc=;
 b=h8QlV+kp5cixbDIyVBKef08X+heibGA67IWLBjx+CrBfY92OLsFT/nD+
 Z9Rx8/j7yowkBtx4JL23yzscfTWCE1b1waQIhteMthlN9UCavomJtI5Ln
 0E9TZrQa3trFDIRy3mZOwrgEcoqsmutgt0zDOjyZC8rWz0YMUGvSUALtz
 XNalxIMhiO/3mqR/uTzCgIRZkhhQIUJvpcBWXq/6uLHhE6FJENA7TiXIG
 owUuKll5GoPMIdOeffgm2FnmJolKWGtV+nuoZi+2wHY7bflkYHYkGwvpD
 iz0zGmgIu0/VWVioeIDiDD8TupZD8mF27R1JUtxQdqSGmqLzHA6fLbcqH w==;
X-CSE-ConnectionGUID: WQ5lqmdnRxWZSy37LVa0UA==
X-CSE-MsgGUID: //OqYqdBTQasQefyimEUAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37999079"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="37999079"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 22:22:28 -0800
X-CSE-ConnectionGUID: FLLbIpfISnC22CUPFnYL4Q==
X-CSE-MsgGUID: WTSBC2/vQeeT1HMMxxkIYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111684936"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa003.jf.intel.com with ESMTP; 20 Jan 2025 22:22:26 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 peter.senna@linux.intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH 2/2] lib/igt_facts : Cleanup
Date: Tue, 21 Jan 2025 12:02:07 +0530
Message-Id: <20250121063207.71737-3-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121063207.71737-1-pravalika.gurram@intel.com>
References: <20250121063207.71737-1-pravalika.gurram@intel.com>
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

fix BOOL_COMPARISON, COMPARISON_TO_NULL,
LINE_SPACING, PARENTHESIS_ALIGNMENT,
Remove extern from header warning from checkpatch

'Fixes: 1a9c3117328 ("lib/igt_facts: Library and unit testing")'

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 lib/igt_facts.c | 20 ++++++++++----------
 lib/igt_facts.h |  3 ++-
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/lib/igt_facts.c b/lib/igt_facts.c
index bd6742065..6e7efbaf3 100644
--- a/lib/igt_facts.c
+++ b/lib/igt_facts.c
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
@@ -729,16 +729,16 @@ static void igt_facts_test_mark_and_sweep(struct igt_list_head *head)
 
 	/* Assert that the two updated elements are present */
 	fact = igt_facts_list_get(name1, head);
-	igt_assert(fact != NULL);
-	igt_assert(fact->present == true);
+	igt_assert(!fact);
+	igt_assert(fact->present);
 
 	fact = igt_facts_list_get(name2, head);
-	igt_assert(fact != NULL);
-	igt_assert(fact->present == true);
+	igt_assert(!fact);
+	igt_assert(fact->present);
 
 	/* Assert that the third element was deleted */
 	fact = igt_facts_list_get(name3, head);
-	igt_assert(fact == NULL);
+	igt_assert(!fact);
 }
 
 /**
@@ -766,7 +766,7 @@ __noreturn void igt_facts_test(void)
 	/* Assert that igt_facts_list_mark_and_sweep() cleans up the list */
 	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == false);
 	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
-	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == true);
+	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head));
 
 	/* Test the mark and sweep pattern used to delete elements
 	 * from the list
diff --git a/lib/igt_facts.h b/lib/igt_facts.h
index e96f88083..60d702977 100644
--- a/lib/igt_facts.h
+++ b/lib/igt_facts.h
@@ -37,7 +37,8 @@ struct igt_facts_config {
 	bool enabled;
 	bool disable_udev;
 };
-extern struct igt_facts_config igt_facts_config;
+
+struct igt_facts_config igt_facts_config;
 
 void igt_facts_lists_init(void);
 void igt_facts(const char *last_test);
-- 
2.34.1

