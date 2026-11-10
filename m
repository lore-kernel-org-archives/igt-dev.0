Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ECE606A32E
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cHHac4i3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E88810F806;
	Tue, 10 Nov 2026 16:11:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F99E10E252
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 16:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794326877; x=1825862877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z9Jg8RJ/Fib9Y+DDCMasDRYNDBaoMbHB8x5hnabhjmA=;
 b=cHHac4i3r/rd+NdyzlFDPOMKt5m7GD9TijD+6M12GvKO2WY/clKt9rvB
 YcQi7fRjeiwplPCdFuowpMdP7/g/fxQgHhwHIJ8jr8tIKlR6v4YMGBVAy
 Id3nPcfERM5ZeM04nUCmOGywRGgt6FVmj1TsJHLh6ai9+q42bHSFYpgkH
 8zfUcje5pvcAu1SQEvaReueGPt6pTCZYSWK4vq0QPBZ9PXVU2yK0eh5Ij
 P2PsXI6xTAHepYrn8yxXu2xM1dQqECiOk7nmzS949DnBA6fb8dxxUZPNl
 8lt+F0InX46xAU6BVTLT/2yKQsOfLJCY3S+jXA5q2WYPFDdxgI95Y+KFY g==;
X-CSE-ConnectionGUID: Xbig43PyQ9mlApWxr7lTMA==
X-CSE-MsgGUID: SgXPkL7ETpmKOgushjgW+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3079298"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3079298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:32 -0800
X-CSE-ConnectionGUID: Xobfo18PShaBbRdmIL4ehg==
X-CSE-MsgGUID: kkjw1+BBRGm1qD+b18eMgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8781797"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:29 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v7 02/10] lib/meson: Add libnl dependencies for DRM RAS support
Date: Tue, 10 Nov 2026 21:34:56 +0530
Message-Id: <20261110160504.1315160-3-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
References: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the required libnl Generic Netlink dependencies for DRM RAS Netlink
library support as optional

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Reviewed-by: Soham Purkait <soham.purkait@intel.com>
---
v7: Changed the libnl dependency from mandatory to optional
---
 lib/meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 1fa4163c8..c345895bc 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -147,6 +147,11 @@ lib_sources = [
 	'vendor/uwildmat/uwildmat.c',
 ]
 
+libnl = declare_dependency(dependencies : [
+	dependency('libnl-3.0', required : false),
+	dependency('libnl-genl-3.0', required : false),
+])
+
 lib_deps = [
 	cairo,
 	glib,
@@ -154,6 +159,7 @@ lib_deps = [
 	libdrm,
 	libdw,
 	libkmod,
+        libnl,
 	libpci,
 	libudev,
 	math,
-- 
2.34.1

