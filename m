Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C9FC88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7EE10E043;
	Wed, 16 Sep 2026 11:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRdXLEXK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CB510E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557116; x=1821093116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iT7oxPjPhBBclnWld/MDUeeCwDoWlDNkMqmPmHNUkwY=;
 b=HRdXLEXK7k9BDvhqwmsC0OQLZTeiPSJ+z59qvvukF2DsOZyla8o01E0K
 7OtTq56C0ym18jA31CF4K/kgveL2MofiZ8DHe93K7Sf49R77ueN8PBAlb
 otB6jVOuVuSA1XxM5ajUkC7oQoNmdnt0GS/CdAWtDWC20yVk8b75ewhtn
 VCZLcnjQrRQ052EWbfRY7HGuPkEvoSoYvB+aX8vC127b+7OJQkXwVpbxL
 VCIetPcIUkPyZfIDYkxBIUNjhr6m0b4FRgJC1z3JF5UBMQDMC4avXbL8V
 TDIYBCQ6q3r7J8kJnBgvlSjwwur8e4B1/yZbuoQz9s9cYAdy3K+7gLF1V A==;
X-CSE-ConnectionGUID: Gw9M0M2KQwC8YvyFSU7eJA==
X-CSE-MsgGUID: Ao1wU5SsRBuHbD3LnrVeoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440561"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440561"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:56 -0700
X-CSE-ConnectionGUID: liwemMNvSfCdcODxa88XBQ==
X-CSE-MsgGUID: 6P95wbX4QN+W3UdD2Fnlog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296801024"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:53 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 11/16] tools/intel_hdcp: Run the overlay for the full
 session
Date: Wed, 16 Sep 2026 16:37:04 +0530
Message-ID: <20260916110718.596603-12-santhosh.reddy.guddati@intel.com>
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

The overlay only started once HDCP had been requested, so until then the
panel showed a static menu, and stop_video_player() left the last frame
of the overlay on screen at exit.

Start the player in main() and run it for the whole session:
enable_hdcp_type() now only sets the property, and stop_video_player()
restores data->fb before the final commit.

The connector id and the sink capability are read in test_init() so the
overlay has them from the first frame.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 7109508d53..38ca8b2484 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -1072,22 +1072,26 @@ static void start_video_player(data_t *data)
 
 static void stop_video_player(data_t *data)
 {
+	igt_plane_t *primary;
+
 	if (!data->video_running)
 		return;
 
 	data->video_running = false;
 	pthread_join(data->video_tid, NULL);
+
+	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &data->fb);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 static void enable_hdcp_type(data_t *data, enum hdcp_type type)
 {
-		pthread_mutex_lock(&data->lock);
-		set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
-		data->hdcp_type = type;
-		data->video_start_time = time(NULL);
-		pthread_mutex_unlock(&data->lock);
-		start_video_player(data);
+	pthread_mutex_lock(&data->lock);
+	set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
+	data->hdcp_type = type;
+	data->video_start_time = time(NULL);
+	pthread_mutex_unlock(&data->lock);
 }
 
 static void test_init(data_t *data)
@@ -1134,6 +1138,12 @@ static void test_init(data_t *data)
 	       igt_output_name(data->output), data->output->id,
 	       data->width, data->height);
 
+	data->selected_connector = data->output->id;
+
+	data->sink_caps = get_hdcp_version(data->fd, igt_output_name(data->output));
+	if (!data->sink_caps)
+		data->sink_caps = "unknown";
+
 	pthread_mutex_init(&data->lock, NULL);
 	data->user_cmd = 0;
 	data->hdcp_type = 0;
@@ -1165,7 +1175,6 @@ int main(int argc, char **argv)
 {
 	data_t data;
 	pthread_t tid;
-	igt_plane_t *primary;
 
 	init_version_str();
 
@@ -1187,9 +1196,7 @@ int main(int argc, char **argv)
 	data.selected_connector = -1;
 	test_init(&data);
 
-	primary = igt_output_get_plane_type(data.output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(primary, &data.fb);
-	igt_display_commit2(&data.display, COMMIT_ATOMIC);
+	start_video_player(&data);
 
 	pthread_create(&tid, NULL, keypress_thread, &data);
 
-- 
2.43.0

