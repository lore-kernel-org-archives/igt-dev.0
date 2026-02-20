Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B90BC56205
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF16510E80E;
	Fri, 20 Feb 2026 15:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrW/C4/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67DA10E366
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771599710; x=1803135710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kzGyruqgVBcVcDL5cNDtoinEH4uiQmzlq4e2fQDu7XA=;
 b=RrW/C4/sQLTo6E+Up4wpJRqKOKdCY3t7Vqq5KH8E5JHuEN9qrUkeca9c
 PKUI0H/BF6b/C7giElLkM9vJfwMKk6z/t6PCY+/vcMAfOIIhTQg/hSYcq
 uxhlkJTPOIe0dZfOWK9/r2M0qARHkyQEcAvufrCDJxMj1DLo1BxWclkdN
 RY3x2sSIrr5eL735MlGliEc/3fNCXszddKK3QdUzQHfWru4TCntS08MAT
 Ilep46VGWl5F89ueSE3UwyV5ewkRcrJ0fbTD25X8pCZqVpa9iZ42WytH7
 Dv1TMcRAXkshrUI65yss+1utjZQk6s9DATOY149mIGsxCkiNGW4tIA2Oc Q==;
X-CSE-ConnectionGUID: hPdJ7DUcSpqiUUhbxu0+Lg==
X-CSE-MsgGUID: IwKUK7JDQde4+LQ5Efb6xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60266684"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="60266684"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:50 -0800
X-CSE-ConnectionGUID: gbqbwxTiQKO3Hz4vn2uwqA==
X-CSE-MsgGUID: 2UzPPEX6TZiyWoRhcbhV7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252557952"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.6])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:48 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 3/6] dockerfiles: update debian and fedora dockerfiles
Date: Fri, 20 Feb 2026 16:01:57 +0100
Message-ID: <20260220150202.1013804-4-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220150202.1013804-1-pawel.sikora@intel.com>
References: <20260220150202.1013804-1-pawel.sikora@intel.com>
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

Add clang python3 bindings and clang dev libraries
to image installation process for mkdocs(cdoc).

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 Dockerfile.build-debian         | 4 +++-
 Dockerfile.build-debian-minimal | 4 +++-
 Dockerfile.build-fedora         | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Dockerfile.build-debian b/Dockerfile.build-debian
index cbc12875d..8d251598c 100644
--- a/Dockerfile.build-debian
+++ b/Dockerfile.build-debian
@@ -18,6 +18,8 @@ RUN apt-get install -y \
 			python3-docutils \
 			valgrind \
 			peg \
-			libdrm-intel1
+			libdrm-intel1 \
+			python3-clang \
+			libclang-dev
 
 RUN apt-get clean
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index 808d2e32e..f481c83df 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -21,6 +21,8 @@ RUN apt-get install -y \
 			libxv-dev \
 			x11proto-dri2-dev \
 			meson \
-			libdrm-dev
+			libdrm-dev \
+			python3-clang \
+			libclang-dev
 
 RUN apt-get clean
diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index bae85a584..4e618fda7 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -38,6 +38,7 @@ RUN rm -fr /tmp/peg
 
 # For compile-testing on clang
 RUN dnf install -y clang
+RUN dnf install -y python3-clang clang-devel
 
 # For test list comparison
 RUN dnf install -y diffutils
-- 
2.51.0

