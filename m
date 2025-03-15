Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A862BC28B28
	for <igt-dev@archiver.kernel.org>; Sat, 15 Mar 2025 04:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7C210E0A7;
	Sat, 15 Mar 2025 04:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BY9tn4Ud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CAB10E0A7
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Mar 2025 04:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742011648; x=1773547648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oAFVWet9FQMtsYtmrKmTzQHaihCM544isXTo+T7RLUI=;
 b=BY9tn4UdGw91Wtlr8+WxnqWFZ93pfWrta8P/tNebmscULCzq/UWJ5iMY
 MPqGjjFiw2qOSAdcysyiAROlIpmMUeiXNzyoKNdv+Sj67as3QwLtiXNJZ
 /Ng1zEUnzOuQP0+AQfv2WdWTSpjPaqCZs2JAbPsh+e5vvfQ1pMI/ld1zb
 sm5GdeEO2O0uw+dBYTQdWsv5IfE1GHbSsGkyCWry6oYFfvyEMh3UKWrMX
 PfV0wPf3PtetGYTqLK5C0h6b2gbMjvMfyVYPcOPf5yobay6dWIjMGEL81
 plEGpNIOODUT8EKz58u7AjXz1OlMZDBGm7UDQJYRUb0bQ52jDMWrtkh/+ Q==;
X-CSE-ConnectionGUID: AgbFZULbT3m94GLUlZFqbQ==
X-CSE-MsgGUID: 0Ce36tDUTxyZ6HgV1dyEbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="42905059"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; d="scan'208";a="42905059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 21:07:23 -0700
X-CSE-ConnectionGUID: 6GdXMqXhQDCnrlkV+aq0/A==
X-CSE-MsgGUID: PhKqb4WvTkKicwuCgRseSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; d="scan'208";a="121657153"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 21:07:21 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 jari.tahvanainen@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] scripts/test_list: Do not stop the build process in the
 case of test documantion problem
Date: Sat, 15 Mar 2025 09:38:05 +0530
Message-ID: <20250315040805.699431-1-karthik.b.s@intel.com>
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

Current approach stops whole build process on a case that there is mistake
on documentation. Let's have entry on logs instead and continue.

Small fix also related multiline data e.g. on Description part.

Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 scripts/test_list.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 867d28400..93a35ca71 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1399,7 +1399,7 @@ class TestList:
 
                 # Handle multi-line field contents
                 if current_field:
-                    match = re.match(r'\s+(.*)', file_line)
+                    match = re.match(r'(.*)', file_line)
                     if match:
                         if handle_section == 'test':
                             dic = self.doc[current_test]
@@ -1408,7 +1408,7 @@ class TestList:
 
                         if dic[current_field] != '':
                             dic[current_field] += " "
-                        dic[current_field] += match.group(1)
+                        dic[current_field] += match.group(1).strip()
                         continue
 
                 # Handle multi-line argument contents
@@ -1427,7 +1427,7 @@ class TestList:
                     continue
 
                 file_line.rstrip(r"\n")
-                sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
+                printf(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
                          (config_origin, file_line))
 
     def show_subtests(self, sort_field):
-- 
2.43.0

