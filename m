Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC939CAC5B0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 07:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07EE10E6A8;
	Wed, 24 Sep 2025 07:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anSDlbtl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088DA10E6A8
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758699150; x=1790235150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jwus2NBLQv6ZrasQzcIvM7CWowOs4Zj8vCjPxAeF+S4=;
 b=anSDlbtlzXXi/F99q75L0zmdrPOBrEOa3pfbRg+7bjlblOjs4+aMGHFB
 ORE75FiFms9oQXKmHMUd/CvKrBTifTof9sZ/yOKU6Y8aXZiw8Yw2Zk9l3
 QCqYrlSNMiyI/0zcj/NTFmROrOMJPsUmljYuYEnr+31yH9i196DEj7jM7
 cqQyFkBtEnoMkBpU0WeHwTNEyE1VltzethAZvrcqBVlrGwn2pduelg2Pf
 iP/aLlVQOGk4xOpSzSfAnD5hbbtMvnI8lx9QOW/zLEciMnPTusnhTRB9g
 mkGzZh2ihHhYNBVqyZPlJy6nzzRz2n9szV6SlhHTVpbp9Tx5WG3BNST42 A==;
X-CSE-ConnectionGUID: EPr8dwc+TEWt8w28/4Ij7g==
X-CSE-MsgGUID: Xg8Mw7KEQ1m9rMjA5GrzvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86432571"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="86432571"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:29 -0700
X-CSE-ConnectionGUID: PqFfYtH/Rse8IHjiTDAdmw==
X-CSE-MsgGUID: L8jkYH7DQNe1ywgERJpUVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="214092853"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:27 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 2/6] tools/intel_hdcp: Draw menu on screen based on
 hdcp status
Date: Wed, 24 Sep 2025 12:59:36 +0530
Message-Id: <20250924072940.413695-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924072940.413695-1-santhosh.reddy.guddati@intel.com>
References: <20250924072940.413695-1-santhosh.reddy.guddati@intel.com>
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

Cairo based menu UI to display HDCP Tool menu. This displays user
options and adjusts the background and text color on the screen based on
HDCP status.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index c0d8e52e0..fc3498e78 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -31,6 +31,62 @@ typedef struct data {
 	enum hdcp_type hdcp_type;
 } data_t;
 
+static void draw_menu(data_t *data, const char *status)
+{
+	cairo_t *cr = igt_get_cairo_ctx(data->fd, &data->fb);
+	cairo_text_extents_t ext;
+	double x_center, total_height, y_start, y;
+	static const char * const lines[] = {
+		"Intel HDCP Tool",
+		"Press:",
+		"1 - Enable HDCP1.4",
+		"2 - Enable HDCP2.2 Type 0",
+		"3 - Enable HDCP2.2 Type 1",
+		"4 - Disable HDCP",
+		"q - Quit"
+	};
+	int num_lines;
+
+	/* Background color and text color based on HDCP status */
+	if (strcmp(status, "INIT") == 0) {
+		cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
+		cairo_paint(cr);
+		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
+	} else if (strcmp(status, "Enabled") == 0) {
+		cairo_set_source_rgb(cr, 0.0, 1.0, 0.0);
+		cairo_paint(cr);
+		cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
+	} else {
+		cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
+		cairo_paint(cr);
+		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
+	}
+
+	cairo_select_font_face(cr, "Helvetica", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
+
+	x_center = data->width / 2.0;
+	num_lines = ARRAY_SIZE(lines);
+
+	total_height = 0;
+	for (int i = 0; i < num_lines; i++) {
+		cairo_set_font_size(cr, 52);
+		cairo_text_extents(cr, lines[i], &ext);
+		total_height += ext.height;
+	}
+
+	y_start = (data->height - total_height) / 2.0;
+	y = y_start;
+	for (int i = 0; i < num_lines; i++) {
+		cairo_set_font_size(cr, 52);
+		cairo_text_extents(cr, lines[i], &ext);
+		cairo_move_to(cr, x_center - ext.width / 2, y);
+		cairo_show_text(cr, lines[i]);
+		y += ext.height + 10;
+	}
+
+	cairo_destroy(cr);
+}
+
 static const char *get_hdcp_version(int fd, char *connector_name)
 {
 	char buf[MAX_HDCP_BUF_LEN];
-- 
2.34.1

