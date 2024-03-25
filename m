Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC31C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 21:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F1710E3F3;
	Mon, 25 Mar 2024 21:35:54 +0000 (UTC)
X-Greylist: delayed 1796 seconds by postgrey-1.36 at gabe;
 Mon, 25 Mar 2024 21:35:52 UTC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D512610E3F3
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 21:35:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B315F240002;
 Mon, 25 Mar 2024 21:35:49 +0000 (UTC)
From: Peter Senna Tschudin <me@petersenna.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, andi.shyti@linux.intel.com,
 Peter Senna Tschudin <peter.senna@gmail.com>
Subject: [PATCH i-g-t v2] Fix memory access issue due to variable block scope
Date: Mon, 25 Mar 2024 22:35:48 +0100
Message-ID: <20240325213548.2881-1-me@petersenna.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: me@petersenna.com
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

This patch fixes the tests gem_exec_capture@many-4k-incremental and
gem_exec_capture@many-4k-zero that are currently failing with an invalid file
descriptor error.

 struct intel_execution_engine2 *
 intel_get_current_engine(struct intel_engine_data *ed)

When intel_get_current_engine is called from the macro
for_each_ctx_cfg_engine(), the variable *ed is defined within a for loop. The
scope of *ed is limited to that loop, leading to access violations when
attempting to access its contents outside the loop.

Before to this patch, intel_get_current_engine() would return an element of *ed
and attempting to use it after the loop ended resulted in undefined behavior.

This patch introduces a memcpy() to copy the contents of ed->current_engine to
a memory area not confined by the loop's scope, ensuring safe access to the
data.

v2: Added 'i-g-t' to the Subject.

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 lib/i915/gem_engine_topology.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index afb576afb..b3b809482 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -189,12 +189,24 @@ static int __query_engine_list(int fd, struct intel_engine_data *ed)
 struct intel_execution_engine2 *
 intel_get_current_engine(struct intel_engine_data *ed)
 {
+	struct intel_execution_engine2 *ret = NULL;
+
 	if (ed->n >= ed->nengines)
 		ed->current_engine = NULL;
 	else if (!ed->n)
 		ed->current_engine = &ed->engines[0];
 
-	return ed->current_engine;
+	// When called from the macro for_each_ctx_cfg_engine(), *ed is defined
+	// inside a for loop. In that case, not memcping ed->current_engine
+	// will lead to a memory access violation when trying to access the
+	// contents of ed->current_engine after the end of the for loop
+	if (ed->current_engine) {
+		ret = malloc(sizeof(*ret));
+		if (ret)
+			memcpy(ret, ed->current_engine, sizeof(*ret));
+	}
+
+	return ret;
 }
 
 void intel_next_engine(struct intel_engine_data *ed)
-- 
2.34.1

