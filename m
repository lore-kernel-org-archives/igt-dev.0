Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A445ECD9B0
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 01:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C6310E1FF;
	Fri,  6 Feb 2026 01:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKXIlJiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0C410E21E
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 01:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770339976; x=1801875976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ElLqeyrySr63+l/h9ksaBHuELNzdA/v1BOGsFTjw+Q=;
 b=EKXIlJivLlA1A8PcVb+9RMQ4YngaLHA07Ee58qkpURzmrFWhGxnAJBvG
 tyWgoPCnKHx6YKqxvko8Kx7KZCTW/7cWDfYcsHBoBmxxcBXygDv+zkZJH
 8DX9pkTDhs1l2gkpKAE+fj72IixGQARuBtn/aSmBsZ3a0AVS89ml/PlVs
 jT7Bj93fd4F4EUJRNzFhp58eLVK/sXzkAwdF8EbyHDv3NyPL5GReQZKJi
 26tnGuA2Xylh9/bTZyxV6GSRpWQT9uk89FNIuAso9kjPKZdZMvtnHr15b
 WufigJNTZ+E85kKPYH+N0kU998ZgDwtFWilR4Kozgeid6fggFKLSdh5co w==;
X-CSE-ConnectionGUID: W4L1yaS8Tn+0/4rliLNUOA==
X-CSE-MsgGUID: 4Ifm4g19ShenpQq1DJvBwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82919095"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82919095"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 17:06:16 -0800
X-CSE-ConnectionGUID: JiykMQRqRvebtouObVoAxw==
X-CSE-MsgGUID: cUa9eudPT2230GtacFZXJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="215223753"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 17:06:15 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 4/4] .gitlab-ci: add generation of API Reference with
 mkdocs
Date: Fri,  6 Feb 2026 02:05:51 +0100
Message-ID: <20260206010551.267237-5-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206010551.267237-1-pawel.sikora@intel.com>
References: <20260206010551.267237-1-pawel.sikora@intel.com>
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

 * Update IGT version in docs/api_reference.md
 * Generate IGT test list in docs/api_tests_glossary.md
 * Configure mkdocs build to suppress warnings for
   mkdoxy-generated API Reference pages.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 .gitlab-ci.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 34daba4d5..5c8156d4b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -247,7 +247,9 @@ pages:
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
     - pip install -r docs/requirements-docs.txt
     - cp -r build/docs/reference/igt-gpu-tools/html/ docs/api_reference
-    - mkdocs build
+    - python3 scripts/list_of_tests_to_md.py -d tests -o docs/api_tests_glossary.md
+    - python3 scripts/update_igt_version_in_docs.py
+    - mkdocs build 2>&1 | grep -vE "WARNING.*contains a link|WARNING.*A reference to"
     - cp -r site public
   artifacts:
     paths:
-- 
2.51.0

