Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC2FC021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 13:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EEF10E324;
	Mon, 17 Feb 2025 13:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLMHKDYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F66510E324
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739799163; x=1771335163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yNvuUiI36GTi3LZ9ohjacovX0WH4eElWDlvprEVWuh4=;
 b=TLMHKDYNrx8vuB5dGJUjBR57MYisFCgqGjk0PIshJifKbcF15kPHgtdF
 p0JffiJo4iLuThBWPeosIafrCh/W6YC2a3i67CeunC3PDuaMDGtk0mDKa
 Vxho63RJzhPgfHbI9GYso095S717GK5JsAlk2IntgNaWHJAlT34aqIsfi
 pFlAnA5AzQPUCRvnQscig8mT8qe/j18yn0sCd3S7C+TYJ4FqbeeAmYFGE
 xj+tNJOYBUTmXLIy0jiYd+O3IXdik5ov40sEgQ/aDK5TnqmP/qL1yvI6F
 RwtIzoyXBFkP6KZFeYi5km1ucuajUfFHWVuFqEC5k6XZHc1ZO1cmkxVKd Q==;
X-CSE-ConnectionGUID: 9ANQ33UrTUqMg4GWpDW00g==
X-CSE-MsgGUID: LWdGQf55QR2EsZIZR+F0ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44408242"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="44408242"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:32:43 -0800
X-CSE-ConnectionGUID: zOh/rKgjRbKKBqsSqHUihg==
X-CSE-MsgGUID: A/PTh9JFTFuuq4LYdLG/kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="119124668"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:32:41 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jordan Justen <jljusten@debian.org>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] tools: rename lsfacts into igt_facts
Date: Mon, 17 Feb 2025 14:32:29 +0100
Message-ID: <20250217133229.104948-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

This is a follow up to GitLab issue 168 where name 'power' was
a little too generic. Similarly, name lsfacts looks also a little
too generic, so rename it into igt_facts.

Cc: Jordan Justen <jljusten@debian.org>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/{lsfacts.c => igt_facts.c} | 12 ++++++------
 tools/meson.build                |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename tools/{lsfacts.c => igt_facts.c} (71%)

diff --git a/tools/lsfacts.c b/tools/igt_facts.c
similarity index 71%
rename from tools/lsfacts.c
rename to tools/igt_facts.c
index bbe77717a..af3ea2a61 100644
--- a/tools/lsfacts.c
+++ b/tools/igt_facts.c
@@ -7,12 +7,12 @@
 #include "igt_facts.h"
 
 /**
- * SECTION:lsfacts
- * @short_description: lsfacts
- * @title: lsfacts
- * @include: lsfacts.c
+ * SECTION:igt_facts
+ * @short_description: igt_facts
+ * @title: igt_facts
+ * @include: igt_facts.c
  *
- * # lsfacts
+ * # igtfacts
  *
  * Scan for igt-facts and print them on screen. Indicate if no facts are found.
  */
@@ -20,7 +20,7 @@ int main(int argc, char *argv[])
 {
 	igt_facts_lists_init();
 
-	igt_facts("lsfacts");
+	igt_facts("igt_facts");
 
 	if (igt_facts_are_all_lists_empty())
 		igt_info("No facts found...\n");
diff --git a/tools/meson.build b/tools/meson.build
index f091af380..1dfe1f839 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -12,6 +12,7 @@ foreach prog : tools_progs_noisnt
 endforeach
 
 tools_progs = [
+	'igt_facts',
 	'igt_power',
 	'igt_stats',
 	'intel_audio_dump',
@@ -43,7 +44,6 @@ tools_progs = [
 	'intel_gem_info',
 	'intel_gvtg_test',
 	'dpcd_reg',
-	'lsfacts',
 	'lsgpu',
 ]
 tool_deps = igt_deps
-- 
2.48.1

