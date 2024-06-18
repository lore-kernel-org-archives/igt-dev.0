Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDC3C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 06:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2728C10E1DE;
	Tue, 18 Jun 2024 06:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kX0+BsWm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8AA10E58F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 06:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718692328; x=1750228328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDazcbG+ia5oXKIDMrGOB5SrDE5AWS/hQT2p0xo5Wqc=;
 b=kX0+BsWmSYsyNPQt7n4n8nMJVZ8LlPgP+c3QawQ014MCuhyXiJfrB9jI
 iTscED9XFgWQyJimG/DuvvXUy7b+7bv8jYlQ6Q1VUNlKWYaH07ov41XgF
 0POVJ2SUXciF34vV2aYruIkgCUoXK/n79CwosZVnl4cJWTnaMnk4A2/Jd
 fXWSIhA7En4LYfzbGdm54qIsLgzJiKrcTRjFcWGswgzFSzdYoMRwKiM+p
 xM70FatAFWs6+iB8CAGvJdZy30Cva33mE1mpzEMCKPQA4aARGlSv3JOlP
 W164K9K0KaxvbJsXjJxx1SQRdw02MncbJi5uq1ku+ztWR9QOPUWvpyqae w==;
X-CSE-ConnectionGUID: GkAnv4gPRBGyf9mGnEUSFA==
X-CSE-MsgGUID: Xnr6FQGZQeirczGjI8hGew==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26960453"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26960453"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:07 -0700
X-CSE-ConnectionGUID: 5KuyJeTdR3CZ2pBBOzVUow==
X-CSE-MsgGUID: rYYadYL0SYehLwwoQglLzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41304970"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:05 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [i-g-t V6 3/6] tests/chamelium: Use lib helper to check the
 pipe/output combo validity
Date: Tue, 18 Jun 2024 11:54:02 +0530
Message-ID: <20240618062405.4004955-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618062405.4004955-1-bhanuprakash.modem@intel.com>
References: <20240618062405.4004955-1-bhanuprakash.modem@intel.com>
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

Use IGT lib helper intel_pipe_output_combo_valid() to make sure the
selected pipe/output/mode combo is valid.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/chamelium/kms_chamelium_helper.c | 12 +++++++++---
 tests/chamelium/kms_chamelium_hpd.c    |  5 ++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms_chamelium_helper.c
index 197d29be9..26c5f87f1 100644
--- a/tests/chamelium/kms_chamelium_helper.c
+++ b/tests/chamelium/kms_chamelium_helper.c
@@ -207,9 +207,15 @@ enum pipe chamelium_get_pipe_for_output(igt_display_t *display,
 	enum pipe pipe;
 
 	for_each_pipe(display, pipe) {
-		if (igt_pipe_connector_valid(pipe, output)) {
-			return pipe;
+		igt_output_set_pipe(output, pipe);
+
+		if (!intel_pipe_output_combo_valid(display)) {
+			igt_output_set_pipe(output, PIPE_NONE);
+			continue;
 		}
+
+		igt_output_set_pipe(output, PIPE_NONE);
+		return pipe;
 	}
 
 	igt_assert_f(false, "No pipe found for output %s\n",
@@ -344,4 +350,4 @@ bool chamelium_check_analog_bridge(chamelium_data_t *data,
 		return true;
 
 	return false;
-}
\ No newline at end of file
+}
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 858c595cb..52e758087 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -345,10 +345,9 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
 		output = chamelium_get_output_for_port(data, port);
 
 		/* If pipe is valid for output then set it */
-		if (igt_pipe_connector_valid(pipe, output)) {
-			igt_output_set_pipe(output, pipe);
+		igt_output_set_pipe(output, pipe);
+		if (intel_pipe_output_combo_valid(&data->display))
 			igt_display_commit2(&data->display, COMMIT_ATOMIC);
-		}
 
 		chamelium_unplug(data->chamelium, port);
 		chamelium_wait_for_connector_after_hotplug(
-- 
2.43.2

