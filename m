Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94274CA100F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 16:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F68D10E2B8;
	Mon, 22 Sep 2025 16:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezrgLEtA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361F910E2B8
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758557403; x=1790093403;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zGHiRYLZrVcB8oinNZqFUS9UnfsaedvTodD5CGRzEUA=;
 b=ezrgLEtA4q7e5RRmENlrQOEQAuGNucN/FtmfxmKUBg6qU0Aka9aPh+jN
 eS8LvIjBvOQ5af/Syg6yC+2QtEVJuuVV4HPAltMjhCWnLS04MsYXFLeyI
 1VJwYSyNZFaLs6Az9pNXcRUwsi8r1eXPWWwatyGlnVACgXUQIdSxP/TiD
 5OHasmkYr/rS81XsrmrnUHRqwsW0qgfEWpH1LxDc/RAFlu7vMEmK4ZGMP
 k4pdpZCTqIH2Pp/y2GTlCiimBwhSZWzVFU4zah29Sp2/lWgZjJnIhAyg8
 37vAW3usUcpFmC45LJFespWw/tnjr3nUOTr1je2D6JvQeVc1y5HEqYGZ8 w==;
X-CSE-ConnectionGUID: 7YGpW2P7Sf6a8Vh6kPSdBA==
X-CSE-MsgGUID: rv2myzmbSASODonqpieeYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83425519"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="83425519"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:02 -0700
X-CSE-ConnectionGUID: 3+wH94sxRwmEGBgKBtFWfQ==
X-CSE-MsgGUID: SvkdOxiYQPK8Zsq1p+d/KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="181664930"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:01 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/7] tools/intel_display_poller: Fix long opts
Date: Mon, 22 Sep 2025 19:09:44 +0300
Message-ID: <20250922160950.27250-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Fix the long option handling by providing a .val for each that
matches the short option.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_display_poller.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
index 6089be3f1ffa..69906d557a37 100644
--- a/tools/intel_display_poller.c
+++ b/tools/intel_display_poller.c
@@ -1352,14 +1352,14 @@ int main(int argc, char *argv[])
 
 	for (;;) {
 		static const struct option long_options[] = {
-			{ .name = "test", .has_arg = required_argument, },
-			{ .name = "pipe", .has_arg = required_argument, },
-			{ .name = "bit", .has_arg = required_argument, },
-			{ .name = "line", .has_arg = required_argument, },
-			{ .name = "fuzz", .has_arg = required_argument, },
-			{ .name = "pixel", .has_arg = no_argument, },
-			{ .name = "async", .has_arg = no_argument, },
-			{ .name = "vrr-push", .has_arg = required_argument, },
+			{ .name = "test", .has_arg = required_argument, .val = 't', },
+			{ .name = "pipe", .has_arg = required_argument, .val = 'b', },
+			{ .name = "bit", .has_arg = required_argument, .val = 'b', },
+			{ .name = "line", .has_arg = required_argument, .val = 'l', },
+			{ .name = "fuzz", .has_arg = required_argument, .val = 'f', },
+			{ .name = "pixel", .has_arg = no_argument, .val = 'x', },
+			{ .name = "async", .has_arg = no_argument, .val = 'a', },
+			{ .name = "vrr-push", .has_arg = required_argument, .val = 'v', },
 			{ },
 		};
 
-- 
2.49.1

