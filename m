Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872E012B098
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 09:45:00 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 28 Jun 2022 11:44:31 +0200
Message-Id: <20220628094435.854519-4-ryszard.knop@intel.com>
In-Reply-To: <20220628094435.854519-1-ryszard.knop@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/7] igt_list: Add the
 igt_list_empty_or_null helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Checks if the list is empty or uninitialized.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/igt_list.c | 5 +++++
 lib/igt_list.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/igt_list.c b/lib/igt_list.c
index 37ae139c..dc94fad8 100644
--- a/lib/igt_list.c
+++ b/lib/igt_list.c
@@ -81,3 +81,8 @@ bool igt_list_empty(const struct igt_list_head *head)
 {
 	return head->next == head;
 }
+
+bool igt_list_empty_or_null(const struct igt_list_head *head)
+{
+	return head->next == NULL || head->prev == NULL || igt_list_empty(head);
+}
diff --git a/lib/igt_list.h b/lib/igt_list.h
index be63fd80..4efb7a22 100644
--- a/lib/igt_list.h
+++ b/lib/igt_list.h
@@ -80,6 +80,7 @@ void igt_list_move(struct igt_list_head *elem, struct igt_list_head *list);
 void igt_list_move_tail(struct igt_list_head *elem, struct igt_list_head *list);
 int igt_list_length(const struct igt_list_head *head);
 bool igt_list_empty(const struct igt_list_head *head);
+bool igt_list_empty_or_null(const struct igt_list_head *head);
 
 #define igt_container_of(ptr, sample, member)				\
 	(__typeof__(sample))((char *)(ptr) -				\
-- 
2.36.1
