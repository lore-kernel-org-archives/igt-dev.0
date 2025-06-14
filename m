Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5918CC71150
	for <igt-dev@archiver.kernel.org>; Sat, 14 Jun 2025 01:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEC510EA83;
	Sat, 14 Jun 2025 01:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOkuJMfj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F90E10E9C8
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Jun 2025 01:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749863321; x=1781399321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K4eOoW4aINLm9q2vJ4WmixjJyVtoCViJ+vuSjCNqj5U=;
 b=TOkuJMfjAirmWdg25EbAmc7k0oc8JazaFyemIkUblKQ/oCMsDJdlhuw6
 3c37MpOUCvae2QWv5NPdv7nBi2UDmCob2BMSEL4kc/ggg94rmp+WnHWpR
 A9j8BQ4a0GmU/B1sEM96dp990+lesJm0ukR+awUlJgxM0SLNXD3umrU4Z
 IAlVKLwMS62LlxAd+afMLWKvTJbBNOXQstKbhdgcvj4bgbkMxCg1HZB5k
 nDrzkS5NLwxc0lcGrKEtatInpzjkuXZwYFSKvpAzSdz91catR9P6jmjcn
 0aUXRAab3XD1V4As1UQyK1WuJD6TheuSMUrlXf8mFUdaD6ebQVPg2lQWQ g==;
X-CSE-ConnectionGUID: T3V/+qnIRFe2kkl6m2UdGQ==
X-CSE-MsgGUID: +6HIvhdpQwy9thT3o4/t0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="54704315"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="54704315"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:08:37 -0700
X-CSE-ConnectionGUID: 0X0645Q4RpieNcW/Ije6Jw==
X-CSE-MsgGUID: BAxELHHzSbmU+lDvNTi+Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="147958940"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:08:36 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/2] tools/xe-perf: Change xe_perf_recorder command line
 to use OA unit id
Date: Fri, 13 Jun 2025 18:08:27 -0700
Message-ID: <20250614010827.3477175-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250614010827.3477175-1-ashutosh.dixit@intel.com>
References: <20250614010827.3477175-1-ashutosh.dixit@intel.com>
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

Xe OA uapi identifies an OA unit by means of its OA unit id.
xe_perf_recorder was instead using engine class/instance to identify the OA
unit, in order to have a common command line with i915_perf_recorder.

However, Xe KMD now supports new OA units, which don't have any associated
engines. This means that it is not possible to use engine class/instance to
identify these OA units and these OA units must instead be identified by
means of the OA unit id, as originally intended in Xe OA uapi.

Therefore, change xe_perf_recorder command line to use OA unit id instead
of engine class/instance to identify the OA unit.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/xe-perf/xe_perf_recorder.c | 66 ++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index 5bd91aeb19..f200fe9c9b 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -351,10 +351,9 @@ struct recording_context {
 	const char *command_fifo;
 	int command_fifo_fd;
 
-	int gt;
-	struct drm_xe_engine_class_instance eci;
-	struct drm_xe_engine_class_instance *hwe;
+	int oa_unit_id;
 	struct drm_xe_oa_unit *oa_unit;
+	struct drm_xe_engine_class_instance *hwe;
 };
 
 static void set_fd_flags(int fd, int flags)
@@ -829,8 +828,7 @@ usage(const char *name)
 		"     --output,             -o <path>   Output file (default = xe_perf.record)\n"
 		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
 		"                                       Values: boot, mono, mono_raw (default = mono)\n"
-		"     --engine-class        -e <value>  Engine class used for the OA capture.\n"
-		"     --engine-instance     -i <value>  Engine instance used for the OA capture.\n",
+		"     --oa-unit-id          -u <value>  OA unit id for the capture.\n",
 		name);
 }
 
@@ -859,6 +857,40 @@ teardown_recording_context(struct recording_context *ctx)
 		close(ctx->drm_fd);
 }
 
+static int assign_hwe(int fd, struct recording_context *ctx)
+{
+	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
+	struct drm_xe_oa_unit *oau;
+	int oam_sag_gt_id = 1;
+	uint8_t *poau;
+
+	if (ctx->oa_unit->num_engines) {
+		/* Just use the first hwe attached to the oa_unit */
+		ctx->hwe = &ctx->oa_unit->eci[0];
+		return 0;
+	}
+
+	assert(ctx->oa_unit->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM_SAG);
+
+	/* Use first hwe attached to a different oa_unit on the same gt */
+	poau = (uint8_t *)&qoa->oa_units[0];
+	for (int i = 0; i < qoa->num_oa_units; i++) {
+		oau = (struct drm_xe_oa_unit *)poau;
+
+		if (!oau->num_engines)
+			goto next;
+
+		if (oau->eci[0].gt_id == oam_sag_gt_id) {
+			ctx->hwe = &oau->eci[0];
+			return 0;
+		}
+next:
+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
+	}
+
+	return -1;
+}
+
 static int assign_oa_unit(int fd, struct recording_context *ctx)
 {
 	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
@@ -869,13 +901,9 @@ static int assign_oa_unit(int fd, struct recording_context *ctx)
 	for (int i = 0; i < qoa->num_oa_units; i++) {
 		oau = (struct drm_xe_oa_unit *)poau;
 
-		for (int j = 0; j < oau->num_engines; j++) {
-			if (oau->eci[j].engine_class == ctx->eci.engine_class &&
-			    oau->eci[j].engine_instance == ctx->eci.engine_instance) {
-				ctx->hwe = &oau->eci[j];
-				ctx->oa_unit = oau;
-				return 0;
-			}
+		if (oau->oa_unit_id == ctx->oa_unit_id) {
+			ctx->oa_unit = oau;
+			return assign_hwe(fd, ctx);
 		}
 
 		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
@@ -898,8 +926,7 @@ main(int argc, char *argv[])
 		{"size",		required_argument, 0, 's'},
 		{"command-fifo",	required_argument, 0, 'f'},
 		{"cpu-clock",		required_argument, 0, 'k'},
-		{"engine-class",	required_argument, 0, 'e'},
-		{"engine-instance",	required_argument, 0, 'i'},
+		{"oa-unit-id",		required_argument, 0, 'u'},
 		{0, 0, 0, 0}
 	};
 	const struct {
@@ -927,10 +954,10 @@ main(int argc, char *argv[])
 		.command_fifo = XE_PERF_RECORD_FIFO_PATH,
 		.command_fifo_fd = -1,
 
-		.eci = { DRM_XE_ENGINE_CLASS_RENDER, 0 },
+		.oa_unit_id = 0,
 	};
 
-	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:e:i:", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:u:", long_options, NULL)) != -1) {
 		switch (opt) {
 		case 'h':
 			usage(argv[0]);
@@ -978,11 +1005,8 @@ main(int argc, char *argv[])
 			}
 			break;
 		}
-		case 'e':
-			ctx.eci.engine_class = atoi(optarg);
-			break;
-		case 'i':
-			ctx.eci.engine_instance = atoi(optarg);
+		case 'u':
+			ctx.oa_unit_id = atoi(optarg);
 			break;
 		default:
 			fprintf(stderr, "Internal error: "
-- 
2.48.1

