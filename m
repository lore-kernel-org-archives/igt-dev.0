Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC006C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696EF10E043;
	Wed, 16 Sep 2026 11:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGxi6e/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E621310E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557111; x=1821093111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NpO4QsLrGUcF33UAuE18zzse43MSoWgo7mr27mS322A=;
 b=MGxi6e/CbsHtOvpWf5ElsdpxyxWsILtO/wEuFSyaC3g37D3x65yioo6d
 4UJtF55gjMUJInm+nRtcC5kZovj4Dr58oGb3NcmQlFN46JC70J+wBTQGA
 eYoK+l82QHBpN/8djDWr00jlUw2Xhn3C3JLJUx1vvsuyIG2dJoLhhj2Oo
 975MkI7+ArqieFDc89itLAicC2d5pZx4LH6pUwEFO4Vz4CHJ0cA9ldQZS
 NvYEA2mD6AL0gG5nJcm3Xsw2rF/H55zJzKD4uq9bj9VLBwfwahs0zZugL
 5Gt/1cr6FTqXr7yQtAt77M7NfRVf5fZYucVwzEJDacuxjrzIXP1hz5gsn Q==;
X-CSE-ConnectionGUID: rXMCzyj6Q8O3ctURZr0LNQ==
X-CSE-MsgGUID: 9oh++3HMT+235m3lplQyZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440553"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:51 -0700
X-CSE-ConnectionGUID: cbIDoSILRfegc5+TOqmgiQ==
X-CSE-MsgGUID: xCO7XG6rRDWPTzoflkHK/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296800976"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:48 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 09/16] tools/intel_hdcp: Add Content Protection state
 helpers
Date: Wed, 16 Sep 2026 16:37:02 +0530
Message-ID: <20260916110718.596603-10-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
References: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
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

get_hdcp_status() both read the property and formatted it, so a caller
that wants the value has to parse the string back. Split out
get_cp_state(), which returns the raw property value or -1 when there is
nothing to read, and build get_hdcp_status() on top of it. The next
patches use the value directly.

While here, make get_hdcp_version() take a const connector name and zero
its buffer before the debugfs read.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index e9c51cf373..0e5ae49b04 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -302,20 +302,25 @@ static const char *get_hdcp_content_type(data_t *data, uint32_t connector_id)
 	}
 }
 
-static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
+/* Current Content Protection value, or -1 if there is nothing to read. */
+static int get_cp_state(data_t *data, uint32_t connector_id)
 {
 	igt_output_t *output;
 	bool is_valid;
 
 	output = get_hdcp_output(data, connector_id, &is_valid);
-	if (!output || !is_valid)
-		return "N/A";
+	if (!output || !is_valid ||
+	    !igt_output_has_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION))
+		return -1;
 
-	if (!igt_output_has_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION))
-		return "N/A";
+	return igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
+}
+
+static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
+{
+	int state = get_cp_state(data, connector_id);
 
-	return cp_state_name(igt_output_get_prop(output,
-						 IGT_CONNECTOR_CONTENT_PROTECTION));
+	return state < 0 ? "N/A" : cp_state_name(state);
 }
 
 static void print_transition(const struct cp_transition *t)
@@ -516,9 +521,9 @@ static void *cp_tracker_thread(void *arg)
 	return NULL;
 }
 
-static const char *get_hdcp_version(int fd, char *connector_name)
+static const char *get_hdcp_version(int fd, const char *connector_name)
 {
-	char buf[MAX_HDCP_BUF_LEN];
+	char buf[MAX_HDCP_BUF_LEN] = { };
 	int ret;
 
 	ret = igt_debugfs_connector_dir(fd, connector_name, O_RDONLY);
-- 
2.43.0

