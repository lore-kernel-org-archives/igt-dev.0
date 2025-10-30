Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95CCCCF9F0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 15:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA0E10E9D4;
	Thu, 30 Oct 2025 15:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VytSTkKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3B510E9D4
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761836570; x=1793372570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IKMGN5dryi8ZSxwCcgyI/Bu3xQYF8DkGGuKNUIlp/dw=;
 b=VytSTkKLFft0k7HueHYCo/rVfyH9RZm90WfZiXrWI6zf/NRj/he5Aa02
 EeCTjTUoVf+ENo6w1avtO3JwTdcLVD0nk5QfBCyHaaZ/183aN0OiILzVf
 8Tx842MWGzRwx5Z3k0/d51OIclT+L7NeM1ZUXX9ee6yvcDOzc+JuL2TJA
 fq3hCFDwCSTVuabJLa2q5LKWeFSeIXq2lp7NBaxpXaF1e9cr768xkm///
 jEoNwmgq/4EpVVJJuywX/4lxNquBluEQ2Xi1ldm4PmbJFMKmNsyO9BWi3
 u4m5SrOBojYsbM82WmlXtShgLOMxvpRCzAD//SSAjGQYJI24cJw5hmpjA w==;
X-CSE-ConnectionGUID: +OuHCP7qSE2Ob0/nBPXF+g==
X-CSE-MsgGUID: BLOdDVUTSXSNloiSnMhwFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64130657"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64130657"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:02:50 -0700
X-CSE-ConnectionGUID: HKSJuIstSHGRH1qhGNVTZQ==
X-CSE-MsgGUID: 9fkFxjrgQRS0oRKGz8T1Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="216634627"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:02:49 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/1] gitlab-ci: fix api reference pages deploy
Date: Thu, 30 Oct 2025 16:02:16 +0100
Message-ID: <20251030150216.1183847-2-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030150216.1183847-1-pawel.sikora@intel.com>
References: <20251030150216.1183847-1-pawel.sikora@intel.com>
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

Remove unnecessary step with api_reference dir
creation.

This fixes main 'html' directory with the API
Reference content being copied into docs/api_reference.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 .gitlab-ci.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e3a81b547..34daba4d5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -246,7 +246,6 @@ pages:
   script:
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
     - pip install -r docs/requirements-docs.txt
-    - mkdir -p docs/api_reference
     - cp -r build/docs/reference/igt-gpu-tools/html/ docs/api_reference
     - mkdocs build
     - cp -r site public
-- 
2.51.0

