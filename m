Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E076CC56201
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8670710E806;
	Fri, 20 Feb 2026 15:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4uZ8ElP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E8310E806
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771599724; x=1803135724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l4swhoDx9qP4CX8sJdcF2zZD6CRAnKxTxztlyl14Re8=;
 b=g4uZ8ElPFowIHtXBpgfcVmUnDFDJHHF+OuMHWq3T7s7aoAFUjaKisgfd
 1jBnqjDaiG7jmEJA4Zutn4QAnuuKLslz21l4JkIWhxEMhFKAwNNbCiqwC
 raXi+P4ShPrH/lCzqXEt5xfCmU3mNqFkEmrw2kHL+88eCzvJQOPF6OFOW
 0QFkTJDqHmeCu9r/98beIn8n9eGsRmwIA/Ro6BOSeljQ/xxx4IGA2goDP
 G+JRiM9yzxgW+gFNf3DJnn+mpoGpOw8MziATRPqQMT/QO4SgPLoNWHbov
 rV5DHltCLRgJBut1UFwXPpt7A6byalkPzhADG4w+l/q5zIz4GIC4uMVeD Q==;
X-CSE-ConnectionGUID: q7GXWG/5TUW65a39dUy6ng==
X-CSE-MsgGUID: cozynTK8QYO6CVJsxrABSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60266698"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="60266698"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:02:04 -0800
X-CSE-ConnectionGUID: Jc73YwQyQkuq1GwT+j2m9Q==
X-CSE-MsgGUID: 25gx6BLYSdmWRi8vESUpDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252558172"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.6])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:02:02 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 6/6] gitlab-ci: move api page build to MkDocs(cdoc)
Date: Fri, 20 Feb 2026 16:02:00 +0100
Message-ID: <20260220150202.1013804-7-pawel.sikora@intel.com>
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

Remove the steps to build API reference with gtk-doc and
meson; keep simply 'mkdocs build' as it was already. The
cdoc plugin configuration will handle the rest, so there
is no need to move statically built directories anymore.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 .gitlab-ci.yml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 34daba4d5..e3d9929b8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -77,7 +77,6 @@ build:tests-fedora:
     - meson setup --prefix=/opt/igt $MESON_OPTIONS build
     - pip install -r docs/requirements-docs.txt
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
-    - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
     - mkdocs build
     - DESTDIR="$PWD/installdir" ninja -C build install
   artifacts:
@@ -244,9 +243,7 @@ pages:
     - build:tests-fedora
   stage: deploy
   script:
-    - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
     - pip install -r docs/requirements-docs.txt
-    - cp -r build/docs/reference/igt-gpu-tools/html/ docs/api_reference
     - mkdocs build
     - cp -r site public
   artifacts:
-- 
2.51.0

