Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2454C55ABE
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1F210E7C3;
	Fri, 20 Feb 2026 14:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnhQ/E1K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6175910E7C3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596136; x=1803132136;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=asha+I6imxKhvGjMcj5up9Z+VboVBV0UN206V2xL06o=;
 b=mnhQ/E1K07jrN/uHX732SVDtz1fL1haCpplqTbM8lMD2/6TjGTOClCA/
 HgLDxaCp9IYqrETkHpouKgt4lifwCJxhaT7hEqUFsDLPIbLhLbLydLEeX
 AxYnDiFZL3G8E/iNSWk5nyhoyfs+8nBK/CbDgAzGkRCbCww9+wsrjOl5f
 R6rn7wFfenb3E8/TRJtLBpCGGS7ZkML+gcrk93N79CKUkexyPUDOcB1NQ
 0SKGahIsDK+2AFcOxxyKRvZqkf1IQv8JRAHSSYkhjb4mgCnmqP+j9gBUU
 wW9OgSytrQzgdMiVfZNio9V3QXXsaMFGTlDSODVWEA+sqkwsG8bd+so3k Q==;
X-CSE-ConnectionGUID: LMEUa9iuTlGxsmPWNKC73w==
X-CSE-MsgGUID: CNDvVmgKTiGT99XrMhlWkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83007010"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="83007010"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:16 -0800
X-CSE-ConnectionGUID: LWX/jyeQQRS3IqCqHQVjlw==
X-CSE-MsgGUID: c7CIyFM8RQeb1IG6+DBTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214973662"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:15 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/21] tests/kms: Use 'enum pipe' over int'
Date: Fri, 20 Feb 2026 16:01:36 +0200
Message-ID: <20260220140154.4138-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
References: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Convert a few 'int pipe's tp 'enum pipe pipe's. This will help
subsequent cocci based pipe->crtc conversions.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_flip_tiling.c | 2 +-
 tests/nouveau_crc.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index 453394343857..54446f2478ae 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -67,7 +67,7 @@ static void pipe_crc_free(data_t *data)
 	data->pipe_crc = NULL;
 }
 
-static void pipe_crc_new(data_t *data, int pipe)
+static void pipe_crc_new(data_t *data, enum pipe pipe)
 {
 	igt_display_t *display = &data->display;
 	if (data->pipe_crc)
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 9013b7e53df8..b2f9f3bdd08d 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -31,7 +31,7 @@ IGT_TEST_DESCRIPTION(
 "such as context flipping.");
 
 typedef struct {
-	int pipe;
+	enum pipe pipe;
 	int drm_fd;
 	int nv_crc_dir;
 	igt_display_t display;
-- 
2.52.0

