Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE3CD2D8DE
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4DB10E501;
	Tue, 27 Jan 2026 09:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLe4bYCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377BB10E500
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507199; x=1801043199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fVVrkatj0TwDc+WmXgKlfaVfJQvP8eKmhiXtpHNl8K0=;
 b=FLe4bYCyNphsFuMd+XV2odhkmKUXKbvH2zynPMpoLTWOAntAtsz2i/Q4
 CcdpO1uDBcgxbR9e/mloOGvzsyf0ZVhqxC5+Qai4ieBAaqOkaUP3Kem1B
 iTuo+zaPbyoSw04YwZ0b+GzMKyb/2vVUUuUtdGkJJNYBFqV3z1zvN84YP
 5YxKIs/qhiYZAqedVezsttxOoUyOC5QKPYkYxKQdnJ1kOvsryG8OkOtF/
 D34HR/N1lUdZSwyjdukDbk0aMEpyvFEVHAf4wcQeYXfpz7qyb91eXVYPc
 mieO9WD2OjtavgO9v5w/57p/ZVJ1Ea1I0eybvB6T6h14Vu6VXGBT+1kUn Q==;
X-CSE-ConnectionGUID: EKW7fSZDTlGsstxLGMkJPQ==
X-CSE-MsgGUID: i0PRl9JUQXKYJwbY677kEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81420924"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81420924"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:46:36 -0800
X-CSE-ConnectionGUID: lv//sufVT6GfJo0VbJK0ow==
X-CSE-MsgGUID: YY6Vxk4MQcaxkjloB8pibw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208172665"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:46:34 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 03/11] tools/intel_hdcp: Function to get valid HDCP
 output
Date: Tue, 27 Jan 2026 15:12:49 +0530
Message-Id: <20260127094257.572736-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
References: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
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

Add a function to get valid HDCP output for a given connector

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 6ca067b41..2b38c8cf2 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -31,6 +31,32 @@ typedef struct data {
 	enum hdcp_type hdcp_type;
 } data_t;
 
+static igt_output_t *get_hdcp_output(data_t *data, uint32_t connector_id, bool *is_valid)
+{
+	drmModeConnector *connector = drmModeGetConnectorCurrent(data->fd, connector_id);
+	igt_output_t *output;
+
+	*is_valid = false;
+
+	if (!connector)
+		return NULL;
+
+	output = igt_output_from_connector(&data->display, connector);
+	if (!output) {
+		drmModeFreeConnector(connector);
+		return NULL;
+	}
+
+	if (connector->connection != DRM_MODE_CONNECTED || connector->encoder_id == 0) {
+		drmModeFreeConnector(connector);
+		return NULL;
+	}
+
+	drmModeFreeConnector(connector);
+	*is_valid = true;
+	return output;
+}
+
 static const char *get_hdcp_version(int fd, char *connector_name)
 {
 	char buf[MAX_HDCP_BUF_LEN];
-- 
2.34.1

