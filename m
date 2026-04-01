Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9251410F931D
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 04:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC5010EBF8;
	Wed,  1 Apr 2026 04:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGOpB366";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD9510E38F
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 04:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775016732; x=1806552732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=94MOmyQ28WaRjL1s6t3OaiynTKj1N+NBgsyVtxRC7g8=;
 b=hGOpB366jWxdb/9mizhwpfATVIGTiI5W/qZRtDZrDO7Q+AhsVAxfoJ50
 RFPz5M7Y9GbF7Isd7k4zuWHdN+j/+laxgeEi22dsubi4zOMJ1Pcv/55vI
 6xe285vt5yOMpAjS0bLIUxIZ6LhPmSoGuEqYLvCJWeEkZqgY0GaB+o5SR
 Tnv/RSB+iaagx5ivcUs/Iqove6v4lTwP4VcTGZxkZWLYiKFn3INZMgzxh
 uOFKvA2F+b6HkufNfAah0ARi6yRbWimF+bXOevqHbASusVxY88lfWkyDi
 tkClp7sXeNd5y3Tq48EunbQRkZ7OrF1StjC4EeQ5bEkL42Vw3TzQRkXsO A==;
X-CSE-ConnectionGUID: uThygvwMS0+N6PVBj2oa0A==
X-CSE-MsgGUID: ByUhrEVKS920PfqpV3+DFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75759833"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75759833"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 21:12:12 -0700
X-CSE-ConnectionGUID: f6RF7WL/Rc6sbhsFHsncVw==
X-CSE-MsgGUID: hl10SseCSXa/lk5UZageyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="225729620"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 21:12:10 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1] README: Document skip message format
Date: Wed,  1 Apr 2026 10:03:01 +0530
Message-ID: <20260401043317.890733-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Add a concise guide for writing consistent, machine-friendly skip
messages in IGT tests. Defines the format:

  SKIP: <reason> [(<context_type>: <value>)]

along with common context types, example messages and a code snippet.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 README.md | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/README.md b/README.md
index b4b9a37ea..a652cc0d1 100644
--- a/README.md
+++ b/README.md
@@ -188,3 +188,40 @@ Imported non-DRM uapi headers from airlied's drm-next branch.
 
 Then, commit with a note of which exact commit from airlied's branch
 was used to generate them.
+
+Skip Message Format
+-------------------
+
+Keep skip messages consistent and machine-friendly. Use this concise
+format and include a single, most-relevant context when available:
+
+- Format: `SKIP: <reason> [(<context_type>: <value>)]` (always end with `\n`)
+- Rules: start with `SKIP:`, use a short lowercase `reason`, include at
+    most one `context` in parentheses, use `0x%llx` for modifiers, and
+    do not add a trailing period.
+
+### `Common context types and examples:`
+
+- `connector`: display connector name — `(connector: HDMI-A-1)`
+- `plane`: plane type — `(plane: primary)`
+- `format`: fourcc format — `(format: NV12)`
+- `modifier`: buffer modifier (hex) — `(modifier: 0x%llx)`
+- `pipe`: pipe id/name — `(pipe: A)`
+- `platform`: GPU/platform name — `(platform: i915)`
+
+### `Common concise messages:`
+
+- `SKIP: no suitable connector available`
+- `SKIP: connector is disconnected (connector: %s)`
+- `SKIP: no suitable display mode available (connector: %s)`
+- `SKIP: format not supported (plane: %s, format: %s)`
+- `SKIP: modifier not supported (modifier: 0x%llx)`
+- `SKIP: plane not available (plane: %s)`
+
+### `Example usage:`
+
+```c
+        igt_skip_on_f(!fmt_supported(plane, fmt),
+                            "SKIP: format not supported (plane: %s, format: %s)\n",
+                            igt_plane_name(plane), igt_format_str(fmt));
+```
-- 
2.43.0

