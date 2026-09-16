Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7F4C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CD210E330;
	Wed, 16 Sep 2026 11:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cp6FTjr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AD810E93A
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557557; x=1821093557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EOKyUUE8cQyXhrLI+ZCFpMpKsGu3JqHlWhx5jT6SnyE=;
 b=cp6FTjr77ryHhImleocEeTReOoNTVx+B43pceOUpBISuzpJJgMKl9YiR
 M623b3dLtUMQ6LCNviMI79Y2k+s2vVTURcZB/+IQ00PlZVaG2bmdJrYz8
 Dmt1lSiblFvQ9cK6/Bolll3v3pQftWWMRliLMr8mgpfSeQ2lC3PtOEPUg
 GY9sBQrxnPFevBqngKdH+nmsWjzsHcvHCVyS/S6u21t6iJ/OmTfrushrS
 jTR2eHJ6ky5pvmIxvlvxBgdiDvK+2/rxw3/djLksY02Pj7tSTHW/Q3b4y
 Mj0g+rGBI8oeMMiNHvlTEsKK3n8j6i9cjQEoGfEJafE92lukmfD2enJNJ g==;
X-CSE-ConnectionGUID: BO0zuem6Sk2YGsSb9O1xmA==
X-CSE-MsgGUID: zWIjkLlURF6sTLic/YmhAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112699499"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="112699499"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:19:16 -0700
X-CSE-ConnectionGUID: KqolaP6nRPihMduFdXUJYw==
X-CSE-MsgGUID: 6LfNpiXqTJCyuQ8FkCTTJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="298375557"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:19:15 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v2 2/3] Dockerfile: bump debian version
Date: Wed, 16 Sep 2026 13:19:01 +0200
Message-ID: <20260916111902.73626-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
References: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
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

Bullseye is EOL so bump up debian to bookworm.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 Dockerfile.build-debian-arm64   | 2 +-
 Dockerfile.build-debian-armhf   | 2 +-
 Dockerfile.build-debian-minimal | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index 11f584793..d46bdb150 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -1,4 +1,4 @@
-FROM debian:bullseye
+FROM debian:bookworm
 
 RUN apt-get update
 RUN apt-get install -y \
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index 9d624d3da..847cc7424 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -1,4 +1,4 @@
-FROM debian:bullseye
+FROM debian:bookworm
 
 RUN apt-get update
 RUN apt-get install -y \
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index d8ceb1a26..ad58aa70e 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -1,4 +1,4 @@
-FROM debian:bullseye
+FROM debian:bookworm
 
 RUN apt-get update
 RUN apt-get install -y \
-- 
2.55.0

