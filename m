Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A158C71135
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 11:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E8610E61C;
	Wed, 11 Jun 2025 11:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5TkNRtk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA43D10E61E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 11:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749640043; x=1781176043;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=EE/fcGEmHrYpseviQ2FWqhiEV6sLNDNIlp+Ffvnvz64=;
 b=S5TkNRtkOfdgmwaY624bajpDvs8HADtqipCV/KL9QsjZLNGk2n4v8OE5
 nB7itkESyQo2vGxsNaMSOzrlEdGjB1O2/SHxQTLPofxErHFehdOtYhQRY
 GsxOw6l1HNbAEwpNP0YVrG+U5DRNb9ycPqBcNRWhXOgmi9NYC3oJZGttw
 hX+gYv6eUGjq1D56GIyDjqgK/BwNe4BIHbwrYwkQF58cDM73xpEPZ50MU
 djlg+1rY+mzEh39USq66ugkO2wyrASZELXJUZ24Wia01eh0SY6YGVR5xO
 59hnILmxTgu6KddowkjY1TOuj7APcAId/42d3iYlvgYfrTyYE5Ret6Lti A==;
X-CSE-ConnectionGUID: d0x5UWeqQrKSG13qo2EBXQ==
X-CSE-MsgGUID: IkDTJln7SXuWx/NCNFbELQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62057459"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="62057459"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:23 -0700
X-CSE-ConnectionGUID: N/g9js5fTn6H2MV8juBRng==
X-CSE-MsgGUID: EtPE9goYSWqjxF/4ZHy2vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147014996"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:21 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 11 Jun 2025 13:06:37 +0200
Subject: [PATCH v2 2/5] Dockerfile: bump debian version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-bump_docker_distros-v2-2-90791ecb953d@intel.com>
References: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
In-Reply-To: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3002;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=EE/fcGEmHrYpseviQ2FWqhiEV6sLNDNIlp+Ffvnvz64=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSWNDIkNS7LtLgMYzV/vcNfNZKMJDIbr7D67W2
 x2iX0fVkC6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaEljQwAKCRAjYrKT3hD9
 13N2C/91l9RrvpyL0O0MhWCxIcwF+AIk2ZUJW8tzw/322fGD8aSbP3B+u5FYDZnSo3vOKD0ybS2
 k/JUuWtp/kJKgnBrxMr4U7bOTY6dUjkgKZ//2Dbse5+qTd6rtS88gbwWBJIHY5yjvPTVW/9qAvJ
 +TgyUdeVYZDHHc2D0c7SeAZfi000IXNgCCtWr9wpHMLUwkhMIXZHDIx5eKA8U1I1GPIlEdly/b+
 s5V8ZzCbfOw46ZMyrKVD7yV4pkzOHkRSvB/KEIcgbgXuPV/RgXgyJ/ntqvAyHRCntiYRgG+PXSA
 OW+u4Ei6jVKtNLuAxaiax6U1QSAgRlHvdmumvHNKbH/9p5hTrLUZ4lT4PiALTuFc3rIQOyIzDME
 nAVybLkRYTzaBE7ni+v3rHDSCnEJfVyG1QsnYfNZiEDCxnGyilQI9oSKnUP9qSeRqvT5gURZdxY
 FVRAUQ/MTWUiPIgwgJ2/CfewV0HZ4yO9kwkr4eG+rW3xO30HqEEY+KsymrZJ9uH7AAOGg=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Debian buster is already old and EOL. Replace
it with oldest but still supported release - bullseye.
It will allow to use more recent build tools.

v2: python-docutils -> python3-docutils, description

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Petri Latvala <adrinael@adrinael.net> #irc
---
 Dockerfile.build-debian         | 2 +-
 Dockerfile.build-debian-arm64   | 4 ++--
 Dockerfile.build-debian-armhf   | 4 ++--
 Dockerfile.build-debian-minimal | 2 +-
 Dockerfile.build-debian-mips    | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Dockerfile.build-debian b/Dockerfile.build-debian
index 454f4bce5e77339ddcd7db2d90a7944ddfe1b266..52d7c42d132509e3c22fc4af01629482d7fa46cd 100644
--- a/Dockerfile.build-debian
+++ b/Dockerfile.build-debian
@@ -15,7 +15,7 @@ RUN apt-get install -y \
 			libxmlrpc-core-c3-dev \
 			libjson-c-dev \
 			libcurl4-openssl-dev \
-			python-docutils \
+			python3-docutils \
 			valgrind \
 			peg \
 			libdrm-intel1
diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index 573c7096feb8da1789f2520e556109e358a351fa..cf0625ac725aa009173b9afe072a646a13402cb5 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \
@@ -6,7 +6,7 @@ RUN apt-get install -y \
 			bison \
 			pkg-config \
 			x11proto-dri2-dev \
-			python-docutils \
+			python3-docutils \
 			valgrind \
 			peg
 
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index 737ca3645f1ba37bd694f7bdf19c2a4d7293be72..58b5be82a4da8a72bd52dcf719daa1a7c958a354 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \
@@ -6,7 +6,7 @@ RUN apt-get install -y \
 			bison \
 			pkg-config \
 			x11proto-dri2-dev \
-			python-docutils \
+			python3-docutils \
 			valgrind \
 			peg
 
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index 64edf4b4313ee482b7b2c5212fe31f1021c9cccf..3850fb43e5cc3bc958663ca225bb6130ae947b76 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \
diff --git a/Dockerfile.build-debian-mips b/Dockerfile.build-debian-mips
index 9b7c0a5b4703e8dd9461406731af248b050a0a2b..1ca3d6aefbd401de0f909f05445b75f9e53abafe 100644
--- a/Dockerfile.build-debian-mips
+++ b/Dockerfile.build-debian-mips
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \
@@ -6,7 +6,7 @@ RUN apt-get install -y \
 			bison \
 			pkg-config \
 			x11proto-dri2-dev \
-			python-docutils \
+			python3-docutils \
 			valgrind \
 			peg
 

-- 
2.43.0

