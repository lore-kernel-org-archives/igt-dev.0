Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E0ACD3421
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 16:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A5510E0E3;
	Wed, 12 Nov 2025 16:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVNHJ54m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709DD10E0E3
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 16:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762964922; x=1794500922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Eh6gFqmdVmfimwUdVrpjqwDP19Pvsg5cFGeQydrWks=;
 b=HVNHJ54mmLderA2MVVzXRPChB4kj8+imzJI0CqcFuHuaNa7n2T5eBqiY
 /ZpkZOsfd81RUb8y+Rc/TH7LmXfI87HOfPea7RwOMt7fjFYLTZN/IpFMd
 MD6LFb/xBVJUOBaTIiQdGbY4kh0/jnPxJG2gzhztD1J9ZAgqpEz3s/F0L
 +oD2fqYvmdAfZEHAzocoGekQwOD8ABsku8v4j4v2feycrC3CAcEu+ZfPN
 u5b+OJOmTkxQJQXMehC5PrvJ/HWzNGlKeR7MT59t0HtoLMYqxTS+RonHl
 uX78A5IIoATl761FgPEp2UW7xSxo0g4vDDjsIagk8MGK+fndFgCykgX3l Q==;
X-CSE-ConnectionGUID: ez3NL9+OTsmk7Z1xwMYlDw==
X-CSE-MsgGUID: VsvxmEy0TviqwzDTeMbfOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65065208"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="65065208"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 08:28:41 -0800
X-CSE-ConnectionGUID: 5r6NuwkiQfuYpWvav7cSXQ==
X-CSE-MsgGUID: 0qzwTlZXRACHKC+buodZ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="226537652"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 08:28:41 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>
Subject: [PATCH i-g-t] intel-ci: Block Panthor testing
Date: Wed, 12 Nov 2025 17:28:34 +0100
Message-ID: <20251112162834.12305-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.2
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

Block non-Intel Panthor tests on i915. Also while at this, move
it to proper place on Xe blocklist.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/i915.blocklist.txt | 4 ++++
 tests/intel-ci/xe.blocklist.txt   | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index b36015b53..083b660c7 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -118,6 +118,10 @@ igt@vmwgfx.*
 ###############################################
 igt@panfrost.*
 ###############################################
+# Panthor
+###############################################
+igt@panthor.*
+###############################################
 # Qualcomm
 ###############################################
 igt@msm.*
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 8706721e3..63f969416 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -7,13 +7,13 @@ igt@amdgpu.*
 igt@msm.*
 igt@nouveau_.*
 igt@panfrost.*
+igt@panthor.*
 igt@v3d.*
 igt@vc4.*
 igt@vgem_.*
 igt@.*virtgpu.*
 igt@vkms.*
 igt@vmwgfx.*
-igt@panthor.*
 ##################################################################
 # Exclude all i915 tests
 ##################################################################
-- 
2.51.2

