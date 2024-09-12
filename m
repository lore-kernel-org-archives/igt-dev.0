Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096F2EED60A
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 14:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE94310E8DD;
	Thu, 12 Sep 2024 14:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k50N6iUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EF210E8DD
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 14:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726150472; x=1757686472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mlQnBYsaY9anYU4GcA/5clVfd2UwGoaGINsj7dQBZwI=;
 b=k50N6iUXdJ9xJdwuO6hg8aAU0ge4gN5Wr5bov5jHgkMkBd2DR8y/Wlmv
 S7mqGFh8o0N95y3UQggfB2x8hrmJ02TiTHTDZCpfsr3aoHZTmDGWH0kXn
 byGXWHjU2ALYLipHGAiSNdOec9nt6w/w/RlCqmEwNfbJtzK4B/YWsJSZy
 z8VQ4NGv8jKraJr8oJEb38/kYGKomwBZD8sO4yQ8OjrmePnmG6gbMYLuX
 D3laEoakbnxhww65r+763gScAeIvy/DIReR422A0UpSr/skZdzg53djcC
 G93iLJPG3EXVWRCLBJ/7lR96HGAVWllau7trViVyjFg3JqOz1NGc6iMiT w==;
X-CSE-ConnectionGUID: g+2g96RfRo+QTrX6sHoIDQ==
X-CSE-MsgGUID: VvFfh3b3SZaI1p+Vyw5EHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35594874"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="35594874"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 07:14:31 -0700
X-CSE-ConnectionGUID: BnKXs2JYTwWeOi0OytJWVw==
X-CSE-MsgGUID: btZA3O4ZQBaSmjKR2CM7GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67342114"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 07:14:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinay.belgaumkar@intel.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] gputop: Print message without clients
Date: Thu, 12 Sep 2024 07:14:26 -0700
Message-ID: <20240912141426.4115404-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Devs are often confused why gputop doesn't display anything and think it
doesn't yet support the driver/platform. This is different from
intel_gpu_top that can display a header with engines, because in that
case there is a fixed set of engines and no variance according to the
driver.

Print a message to give a hint that nothing is displayed because there's
nothing running.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 8842eebbd..43b01f566 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -39,6 +39,9 @@ enum utilization_type {
 
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
 
+#define ANSI_HEADER "\033[7m"
+#define ANSI_RESET "\033[0m"
+
 static void n_spaces(const unsigned int n)
 {
 	unsigned int i;
@@ -82,7 +85,7 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
 	if (lines++ >= con_h)
 		return lines;
 
-	printf("\033[7m");
+	printf(ANSI_HEADER);
 	ret = printf("DRM minor %u", c->drm_minor);
 	n_spaces(con_w - ret);
 
@@ -123,7 +126,7 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
 		}
 	}
 
-	printf(" %-*s\033[0m\n", con_w - len - 1, "NAME");
+	printf(" %-*s" ANSI_RESET "\n", con_w - len - 1, "NAME");
 
 	return lines;
 }
@@ -447,6 +450,13 @@ int main(int argc, char **argv)
 		update_console_size(&con_w, &con_h);
 		clrscr();
 
+		if (!clients->num_clients) {
+			const char *msg = " (No GPU clients yet. Start workload to see stats)";
+
+			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
+			       (int)(con_w - strlen(msg) - 1), msg);
+		}
+
 		igt_for_each_drm_client(clients, c, i) {
 			assert(c->status != IGT_DRM_CLIENT_PROBE);
 			if (c->status != IGT_DRM_CLIENT_ALIVE)
-- 
2.43.0

