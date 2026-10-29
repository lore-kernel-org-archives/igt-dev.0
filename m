Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA60606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HG3vKCA4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8F41120F7;
	Thu, 29 Oct 2026 09:05:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AE11120EE
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793264426; x=1824800426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HiUmMI7tukhjCKcydrx/gdAvHmdQDj0/yBCA4imyOcA=;
 b=HG3vKCA4qyPH5lvDgXIK2LhLqnrb4BQfJnxIDsoC6Hzo2A5FlfEzY83W
 DqcxWGeCwwAL6taAJepOa90SdXNs6bYRG4cWr0YQm36M4+d3QCueQN8S5
 diqtXVacWp3AG43y5E28+EKGvPn+q9rZRDGTlAV4zRr8W6x0cXdwXzbwh
 jSu866Tlr2tJ6Lni0bFHUHwplRLR6elfdgsGJag2Csv0iD9sBqZ0fj5/I
 pZ4oxxbLt5S082vdjHWN5DIBhe6CsgONxj3THHYgXKjo0dwtmCbjJR89S
 edJAOaUTc6/1ORxPZ8gAzn/k4wOaswDImaoCcahcgXzPpjq6rno80CpaC A==;
X-CSE-ConnectionGUID: hh2V2gkbSmGF0/TIY+lXZw==
X-CSE-MsgGUID: 1AYO8thbT+KdcCRXLIWfkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1991684"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1991684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:26 -0700
X-CSE-ConnectionGUID: OmMtb+8YTkaJfZ2ZiRx4OQ==
X-CSE-MsgGUID: yQDU5E00RkmwtokiPBWs/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5092927"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:23 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v6 02/10] lib/meson: Add libnl dependencies for DRM RAS support
Date: Thu, 29 Oct 2026 14:29:47 +0530
Message-Id: <20261029085955.1232163-3-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
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
library support.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Reviewed-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 911bf3550..b00353f92 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -147,6 +147,11 @@ lib_sources = [
 	'vendor/uwildmat/uwildmat.c',
 ]
 
+libnl = declare_dependency(dependencies : [
+	dependency('libnl-3.0', required : true),
+	dependency('libnl-genl-3.0', required : true),
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

