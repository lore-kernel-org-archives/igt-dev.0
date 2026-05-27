Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDE6CD5BDE
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 06:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9E010E72D;
	Wed, 27 May 2026 06:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJG/ugsM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8343910E72D
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 06:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779865090; x=1811401090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JSFieGuJPgkxAztg59TTkmM8ALsaTeHkbV3SoaWY0yE=;
 b=NJG/ugsMp0B+wBwVgGeRUQEGs+DLu5I+V4gxsE2s4E6dpIyI3pIouZT8
 UzuvadFSflxvWJOc+SyNFcl4NITNR0gu5Tt+qywBwxorqvGKjcZdRAzEN
 VuAI4161U6jSIYMK+j5iPjU4heh371Fx42zdufDehQBs6CuOAr96ARkSS
 H8tWEqyZ2x8+4dilc1c5M+8w3fw9zVVMdg26lGRnTnZPEstsrNCrRiFW8
 GaR80nGq+x60BL5i7GMXc52FuDFFP1McSq3E+tdRJGfoXg5t2KA2wWeli
 MBYQKrqOFpLmHNMn6aevLeBqZwNokYiAeN/MD0AiAR0YWl4rxLIIVYHTe g==;
X-CSE-ConnectionGUID: Qh8Hd5GURIuVlisQb4fF4Q==
X-CSE-MsgGUID: lm72Q0IjQe6R5aumPpITLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80874762"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80874762"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 23:58:10 -0700
X-CSE-ConnectionGUID: U7nySXP9RW228xC6juPAlw==
X-CSE-MsgGUID: gM+twtMLSNeGpj8yxrluxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="235787343"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 23:58:07 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 3/3] tests/intel/kms_pipe_stress: use ARGB8888/LINEAR
 for cursor framebuffer
Date: Wed, 27 May 2026 12:49:38 +0530
Message-ID: <20260527071940.3285269-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527071940.3285269-1-sowmiya.s@intel.com>
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
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

Cursor planes on Intel hardware accept mostly
DRM_FORMAT_MOD_LINEAR, regardless of the overlay
format and modifier used by the test variant. Using
data->modifier (e.g. 4-tiled) caused -EINVAL on the
cursor commit.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_pipe_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index a84433b9d..5362fe9f3 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -736,8 +736,8 @@ static void create_framebuffers(struct data *data)
 		if (!data->cursor_fb[i].fb_id) {
 			igt_create_color_fb(data->drm_fd,
 					    cursor_width, cursor_height,
-					    data->format,
-					    data->modifier,
+					    DRM_FORMAT_ARGB8888,
+					    DRM_FORMAT_MOD_LINEAR,
 					    1.0, 0.0, 0.0,
 					    &data->cursor_fb[i]);
 		}
-- 
2.48.1

