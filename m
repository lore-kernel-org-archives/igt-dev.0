Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB628CD6E57
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 16:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6294610F2DE;
	Tue,  2 Jun 2026 16:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARqggDv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB3B10F322
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 16:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780416179; x=1811952179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZSH0i/n1TOorYRB/GqH6zfGViVbZegw5MknL7evKqWA=;
 b=ARqggDv6sAyPMFkH69bXHh5niHP6LKUk6SpeIu6jF1mrZDyZolPKfDJu
 avi2xKvRvlSiNMfLdsTd+EEFLe16z9JqLr952ilCPNXfZu4GUd83u7645
 KtyJUA6PQPj6meIj6wxyHaGLwbFyoNQGu1PM06IN+DqOVbL71m56mE556
 JF/A7TRoGohOtG0Ufx+ifPrRXBsqdHWHByV6nhKQvZdQeqjFKsT1FaKOR
 9BlDzIvil8UdAygb37890Jn0D3J8KptNr3/Ww/k0e/Ly3AP0Cnjy+6DNb
 bSHURthbpSyW7tXR9DsgB4C1gHr7+VumVkDgV2vUC47prLuX6i1vYPwho A==;
X-CSE-ConnectionGUID: Z/yD5k8oReWDLOwfkR+y9g==
X-CSE-MsgGUID: xXz4s78MSSeDQfbPNw9kZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80943623"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="80943623"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 09:02:53 -0700
X-CSE-ConnectionGUID: +HOdtBNKTBi7QzZCxDtpGA==
X-CSE-MsgGUID: hdiQ0lAhQa+vtXnd6mx2eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="244052588"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 09:02:52 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, chaitanya.kumar.borah@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/intel/kms_pipe_stress: use ARGB8888/LINEAR
 for cursor framebuffer
Date: Tue,  2 Jun 2026 21:54:15 +0530
Message-ID: <20260602162422.3360253-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602162422.3360253-1-sowmiya.s@intel.com>
References: <20260602162422.3360253-1-sowmiya.s@intel.com>
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

Cursor planes on Intel hardware accept only
DRM_FORMAT_MOD_LINEAR, regardless of the overlay
format and modifier used by the test variant. Using
data->modifier (e.g. 4-tiled) caused -EINVAL on the
cursor commit.
Bspec: 69833

v2: Add bspec reference in commit message (Swati)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
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
2.43.0

