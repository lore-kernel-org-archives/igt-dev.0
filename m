Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45276C54E67
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 10:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C771D112D81;
	Tue, 12 Mar 2024 10:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SewPPpep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51673112D7F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710238902; x=1741774902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=94kpwjMGtqovAn2iwUayToaJnoSZe/ix2sKnKrvUmo8=;
 b=SewPPpepGvw7737yFALMc5kJ6zWGL4Gq7FayvhGF4bavvgexD+Ol5ab1
 gHQhpixBoBspenojJciuTFkSfPuYaUDtnvKK+ElYsP0nOBB0ky2/CFDvQ
 lu2gkkKAJGi6BToTiER9JxX0w+/B8WlRpYcJdhW8WfPtZaeUfVVgWb50b
 VvA1egjCwTaSMTEAjEskLXsA2EmnNxkrhS3qtMrOKuh1cBvSCz0r6DCyf
 AsTQe6+sq7lKn713awBm24Eef6WdBNcf4KkFsrV/OgB4oFlhI4j1lwFNE
 A+G3KABFjMRbET62FD6/BBFXZwbqivtc39ZgG28BX+M9D9Dki+0OcN88H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="27414476"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="27414476"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 03:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11411777"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 03:21:39 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: janusz.krzysztofik@linux.intel.com, kamil.konieczny@linux.intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t] tests/device_reset: Skip if no drm devices are preset
Date: Tue, 12 Mar 2024 11:07:57 +0100
Message-ID: <20240312100757.14685-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Skip the test if no drm devices are preset.

v2: fix a typo.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10087
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/device_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 817cbc285..73531d696 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -198,7 +198,7 @@ static void init_device_fds(struct device_fds *dev)
 	 * a device file descriptor open for exit handler use.
 	 */
 	dev->fds.dev = __drm_open_driver(DRIVER_ANY);
-	igt_assert_fd(dev->fds.dev);
+	igt_require(dev->fds.dev != -1);
 	if (is_i915_device(dev->fds.dev))
 		igt_require_gem(dev->fds.dev);
 
-- 
2.42.0

