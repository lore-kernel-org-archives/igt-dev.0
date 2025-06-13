Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F50C71136
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 14:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC2910E9EA;
	Fri, 13 Jun 2025 14:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jslw9dYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A3810E9EA
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749825364; x=1781361364;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=6QySduGbrEwtzrkALfb2ea/C5Or/5v73G3jrju2UX90=;
 b=jslw9dYi06t2LutCgJ3qyNQJpkdeAWqoLDquftfRnM1jl/K7CvW6fehw
 zAoYTJlRKkSp4QPowqyXc8I/L9L+7b7vuVl6HgpFDYQDC3vEkoKHl5DIt
 ZcGcOs2ESgv2yLRK7yE58vynd5d+FtvdEckaopjT7xhsOPK5FfNHtGZlV
 pQNrXEZsB6CVVFJyAObZwFDigXhCgKf1ELabdrQkZrmkYq8ZU1Rpg3yba
 sG7EDgvWXqkDGfQj6IQXPNIZgCJqIZ6NUSXfak1D9a1i0kebZW/OHRfdk
 5FsOg2a1b51cIUczRkc+cvMVopByiAYXP+Y9C3ECPm/IMmFExfoFEjcpE g==;
X-CSE-ConnectionGUID: zLFXnESqSqu3riURLl0PWA==
X-CSE-MsgGUID: L1gUVIclT2GIFrbav2u+/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69622390"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69622390"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:36:03 -0700
X-CSE-ConnectionGUID: enwPh9hHTv6pbM1mK522Dg==
X-CSE-MsgGUID: ufz8vM2GR6qcOdv5rDvTBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="148214381"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:36:02 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 13 Jun 2025 16:35:08 +0200
Subject: [PATCH] gitlab-ci: build docs before installation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-docs_before_install-v1-1-0d87d916babb@intel.com>
X-B4-Tracking: v=1; b=H4sIABs3TGgC/x3MQQrCMBBG4auUWRtMalvUq4iEJP1jB2pSMlWE0
 rsbXX6L9zYSFIbQtdmo4M3COVWYQ0NhcukBxWM1tbrt9WBOasxBrEfMBZaTrG6eFQbtwsV0PeK
 ZarkURP78r7d7tXcC5YtLYfq9fHd8QnKygvW10L5/AdA6TFiGAAAA
X-Change-ID: 20250613-docs_before_install-e60ac9145ef8
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=6QySduGbrEwtzrkALfb2ea/C5Or/5v73G3jrju2UX90=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoTDcjXkDqDv48VPYkmOhbUNVxMexScQSXBW0hD
 tFThpTTvVGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaEw3IwAKCRAjYrKT3hD9
 12vyDACFlBxyf3pNT+ki7Asl2I0P76TVna0HUaVf2eT6Ml56k7cihb5N8KxB2h1vxAHTFUR0VKX
 zxpWSrtp/ZpTjh7tEeRRgZthprzMe2hPK4FLYPnOC40W491dIW6MLW/Y0nIjuCp60586gFt4Llh
 nH0aiH/XrX2gTlTw+sWaqF9mXTJxPqOif+pfP8a9Z55Czv+QXAKEbVLmtIA/t8fFtNMU5q3wzX/
 MCH4DbdfscDjLsdtcZ84xmNvD5a3ZmuHLQ/VV4kdsHNvuVzk+9IJxn/3eCvDuSbmPcrv+gstOyM
 i9qyRFHpnm0Mly09R4qBqewdDCaW561rFsz5qbC1dCOrs2ZOaADp99268+fxTTNptxHW2EBP/Ur
 Uen78N/9JRD7IjvYrpP8nrfXscWWf1E2VRSoYJt4j/uG/9V231k/grYGmhUnMxRgqa8BYG/Jyck
 LMnOPQAcbC8xK2W/8PnhEYYc3q91hkI9EYS10TpP1LI86bPkRy0AaF2VEImA4OXrYAML0=
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

The proper way seems to 1st build then install.
Not sure why it works with old gtkdoc, but newer one
reports error.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 519edab5ff9c79eae0de71e71e3f3645431a1459..d5e9a41e55bf5e5c5ee61241621e434544ce8cb9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -76,8 +76,8 @@ build:tests-fedora:
   script:
     - meson --prefix=/opt/igt $MESON_OPTIONS build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
-    - DESTDIR="$PWD/installdir" ninja -C build install
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
+    - DESTDIR="$PWD/installdir" ninja -C build install
   artifacts:
     paths:
       - build

---
base-commit: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1
change-id: 20250613-docs_before_install-e60ac9145ef8

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

