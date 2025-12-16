Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8834D5E13D
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 18:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF4710E049;
	Tue, 16 Dec 2025 18:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIlLvV8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C76C10E56B
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765910716; x=1797446716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VsfufhzA0wwdPDrOh/bJxNvJJ3bDylz5lwz5422eup8=;
 b=JIlLvV8YtC7LlC83TQK/2jvJR1C9lUcenSaJmywSSL/IGrTVmbbyBNeX
 VXcyxDiIwkXGtD8wDxD6tBGyD1cLM/A8kgrzYoWxmZF/0bQ7RKQEZdHJu
 Lh6e6Rh3OUO0uoQVFyF7o2J+wNAc5UU1gzIDcG8bsVLzrgRIShrZkhskv
 1Q2Bnm5bjdsvCuUJyj9Dlrg1eX7uUron7roluzuLfHVdvioUNnj6KBrI2
 qrivyiRArEQ/2cEtN2i1KmuWu12o4QwnN0GmPpcEde18+4xK4PGVNarMF
 /HM+kk9QjfoZGYCgBoolOTdboWunccIesbjxzJZ1WDMyf9baeBxGpAv3/ Q==;
X-CSE-ConnectionGUID: /0NOSVRJTtuQbcPqwHjAGw==
X-CSE-MsgGUID: AR+PoxFLQbebtt/s44c3pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70416033"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="70416033"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 10:45:16 -0800
X-CSE-ConnectionGUID: FgoHbuRjRZi0+AWKbrt7xA==
X-CSE-MsgGUID: iTiXMJckRGSpy0yIwJ7yjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198148613"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:45:15 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t 4/7] tests/kms_plane: Modify the condition for odd pan
Date: Wed, 17 Dec 2025 00:22:12 +0530
Message-Id: <20251216185215.1281390-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251216185215.1281390-1-swati2.sharma@intel.com>
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
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

From: Nemesa Garg <nemesa.garg@intel.com>

From NVL onwards as there is a support for odd
horizontal panning so add a platform check so that
expected return value is 0 instead of EINVAL.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/kms_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index b6b29a98a..b53c6fa07 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1321,6 +1321,9 @@ static void test_planar_settings(data_t *data)
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
+		if (display_ver >= 35)
+			expected_rval = 0;
+
 		igt_create_fb(data->drm_fd, 810, 590,
 			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
 		igt_plane_set_fb(primary, &fb);
-- 
2.25.1

