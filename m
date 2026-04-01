Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB722D35177
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 12:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE1710EC2C;
	Wed,  1 Apr 2026 12:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RI3vYRhU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665FF10EC2C
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 12:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775046026; x=1806582026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d7fay8qT0Pt5M5jX6HxxUnfzU87NAW2Oq4CU19cor4E=;
 b=RI3vYRhUdt/SKafQ2kJ6VfEcMwy1G4Wf/omgpvUPB9vYEVaRioPY9O+k
 xJtdeauAiheiN2g2gcnmmkokI0efY0KIb3uiAIi7QEJBjwUxqXs7f3KR/
 dysXGkhZl+eKDo/u0SzxkJGIn9JEk99e0efIq+SnoIJNRkynWPw9rQlx1
 KBb4esYhlHrhps9pXk5zIEMZyyzt1f/vaNQox7CzKyVKLkZWnGahdrBVn
 dVizAVR+pK3H9XqwKfEjbdW3JYV2YoMnRptmgHIfc/PkJThduhKtWEh2A
 FIhI6CBvT4+xqlMY2veAw+IfY6w6qU0NXyttITF8/Tq+ic6ygt6wWML6T g==;
X-CSE-ConnectionGUID: 88/4GyhJSBawzl9c5rQBXA==
X-CSE-MsgGUID: l8CHi4NKQfizgUMvKRv0Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87470278"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87470278"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 05:20:26 -0700
X-CSE-ConnectionGUID: winKwrVvR1Wg2e1gqsJTJA==
X-CSE-MsgGUID: hwFteqxbSCmLvZKrsFGWTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="230732236"
Received: from skishor1-nuc12snki73.iind.intel.com ([10.227.88.189])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 05:20:24 -0700
From: sumit kishore <sumit.kishore@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sowmiya.s@intel.com,
	Sumit Kishore <sumit.kishore@intel.com>
Subject: [PATCH i-g-t v4] tests/kms_plane_alpha_blend: Skip test when no
 display is connected
Date: Wed,  1 Apr 2026 17:48:55 +0530
Message-ID: <20260401121855.410871-1-sumit.kishore@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Sumit Kishore <sumit.kishore@intel.com>

Add igt_display_require_output() to skip the test on headless systems
with no active display connected.

v2: Add igt_display_require_output. [Karthik]
v3: Update subject and description. [Swati]
v4: Updated the author name. [Sowmiya]

Signed-off-by: Sumit Kishore <sumit.kishore@intel.com>
---
 tests/kms_plane_alpha_blend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 3a67dd8cd..3a2649833 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -764,6 +764,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_display_require(&data.display, data.gfx_fd);
 		igt_require(data.display.is_atomic);
 
+		/* Check if at least one active display connected */
+		igt_display_require_output(&data.display);
+
 		/* Get active pipes. */
 		for_each_crtc(&data.display, crtc)
 			active_crtcs[last_crtc_index++] = crtc->crtc_index;
-- 
2.43.0

