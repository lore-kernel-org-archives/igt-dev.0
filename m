Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA7EC2BA15
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 15:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE80210E44F;
	Mon, 17 Jun 2024 15:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAf2bqmM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEC510E44D
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 15:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718639951; x=1750175951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7qfWtDLZ2OPKPg3fJ4Q8yQogh9tejQej2B5v0HcABHE=;
 b=nAf2bqmMNAnTIh0/qSq78087Zzu1n3/CAapcOjrTNgdBqFNt6QZpWrQY
 efWH77x+m50eQ/prtxs5zhDCzdhnK1y6BMAaDehehfSJkpKVYEcA3OPLG
 +AO53xbpNQKWRA9v7LZZV6qmOrjeyIRJnqqCgKq0tNwp/G0AeIWZqWWZh
 nxr6Do1n2cxwJCjQ5lBUp2/VmAT2ok0xpwjKYDNGkznat0rX7IyfV5nko
 lcXRyhSBzWUu7Nb+KKVB7ii9t+ww2/BmmIM8X05iKGrwzYJ6OWMzOLcIv
 jc20sZClE0oaLXdUPojCcLn9i12EsCDkLTZFOQ9N8XPJr3bU/0PKn2A+h w==;
X-CSE-ConnectionGUID: BvxSudb5Tg+pJZaml9sajw==
X-CSE-MsgGUID: DRKzqmY9Sc+K5bXIcmWbXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="33010472"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="33010472"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 08:59:00 -0700
X-CSE-ConnectionGUID: S7j11+SLRSW3a8G4+lnwvg==
X-CSE-MsgGUID: hjg5RpZiQOi445lfrAaR5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45781850"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 08:58:58 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/2] HAX patch do not merge
Date: Mon, 17 Jun 2024 21:40:52 +0530
Message-Id: <20240617161052.1113250-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617161052.1113250-1-kunal1.joshi@intel.com>
References: <20240617161052.1113250-1-kunal1.joshi@intel.com>
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

---
 tests/intel-ci/fast-feedback.testlist    | 64 +++++++++++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 66 ++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..65a7fe663 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,70 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_bw@linear-tiling-1-displays-1920x1080p
+igt@kms_bw@linear-tiling-1-displays-2560x1440p
+igt@kms_bw@linear-tiling-1-displays-3840x2160p
+igt@kms_bw@linear-tiling-1-displays-2160x1440p
+igt@kms_bw@linear-tiling-2-displays-1920x1080p
+igt@kms_bw@linear-tiling-2-displays-2560x1440p
+igt@kms_bw@linear-tiling-2-displays-3840x2160p
+igt@kms_bw@linear-tiling-2-displays-2160x1440p
+igt@kms_bw@linear-tiling-3-displays-1920x1080p
+igt@kms_bw@linear-tiling-3-displays-2560x1440p
+igt@kms_bw@linear-tiling-3-displays-3840x2160p
+igt@kms_bw@linear-tiling-3-displays-2160x1440p
+igt@kms_bw@linear-tiling-4-displays-1920x1080p
+igt@kms_bw@linear-tiling-4-displays-2560x1440p
+igt@kms_bw@linear-tiling-4-displays-3840x2160p
+igt@kms_bw@linear-tiling-4-displays-2160x1440p
+igt@kms_bw@linear-tiling-5-displays-1920x1080p
+igt@kms_bw@linear-tiling-5-displays-2560x1440p
+igt@kms_bw@linear-tiling-5-displays-3840x2160p
+igt@kms_bw@linear-tiling-5-displays-2160x1440p
+igt@kms_bw@linear-tiling-6-displays-1920x1080p
+igt@kms_bw@linear-tiling-6-displays-2560x1440p
+igt@kms_bw@linear-tiling-6-displays-3840x2160p
+igt@kms_bw@linear-tiling-6-displays-2160x1440p
+igt@kms_bw@linear-tiling-7-displays-1920x1080p
+igt@kms_bw@linear-tiling-7-displays-2560x1440p
+igt@kms_bw@linear-tiling-7-displays-3840x2160p
+igt@kms_bw@linear-tiling-7-displays-2160x1440p
+igt@kms_bw@linear-tiling-8-displays-1920x1080p
+igt@kms_bw@linear-tiling-8-displays-2560x1440p
+igt@kms_bw@linear-tiling-8-displays-3840x2160p
+igt@kms_bw@linear-tiling-8-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-5-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-5-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-6-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-6-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-6-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-7-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-7-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-7-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-8-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-8-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index aa98b37e6..207edcab8 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,72 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_bw@linear-tiling-1-displays-1920x1080p
+igt@kms_bw@linear-tiling-1-displays-2560x1440p
+igt@kms_bw@linear-tiling-1-displays-3840x2160p
+igt@kms_bw@linear-tiling-1-displays-2160x1440p
+igt@kms_bw@linear-tiling-2-displays-1920x1080p
+igt@kms_bw@linear-tiling-2-displays-2560x1440p
+igt@kms_bw@linear-tiling-2-displays-3840x2160p
+igt@kms_bw@linear-tiling-2-displays-2160x1440p
+igt@kms_bw@linear-tiling-3-displays-1920x1080p
+igt@kms_bw@linear-tiling-3-displays-2560x1440p
+igt@kms_bw@linear-tiling-3-displays-3840x2160p
+igt@kms_bw@linear-tiling-3-displays-2160x1440p
+igt@kms_bw@linear-tiling-4-displays-1920x1080p
+igt@kms_bw@linear-tiling-4-displays-2560x1440p
+igt@kms_bw@linear-tiling-4-displays-3840x2160p
+igt@kms_bw@linear-tiling-4-displays-2160x1440p
+igt@kms_bw@linear-tiling-5-displays-1920x1080p
+igt@kms_bw@linear-tiling-5-displays-2560x1440p
+igt@kms_bw@linear-tiling-5-displays-3840x2160p
+igt@kms_bw@linear-tiling-5-displays-2160x1440p
+igt@kms_bw@linear-tiling-6-displays-1920x1080p
+igt@kms_bw@linear-tiling-6-displays-2560x1440p
+igt@kms_bw@linear-tiling-6-displays-3840x2160p
+igt@kms_bw@linear-tiling-6-displays-2160x1440p
+igt@kms_bw@linear-tiling-7-displays-1920x1080p
+igt@kms_bw@linear-tiling-7-displays-2560x1440p
+igt@kms_bw@linear-tiling-7-displays-3840x2160p
+igt@kms_bw@linear-tiling-7-displays-2160x1440p
+igt@kms_bw@linear-tiling-8-displays-1920x1080p
+igt@kms_bw@linear-tiling-8-displays-2560x1440p
+igt@kms_bw@linear-tiling-8-displays-3840x2160p
+igt@kms_bw@linear-tiling-8-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-5-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-5-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-5-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-5-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-6-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-6-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-6-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-6-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-7-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-7-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-7-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-7-displays-2160x1440p
+igt@kms_bw@connected-linear-tiling-8-displays-1920x1080p
+igt@kms_bw@connected-linear-tiling-8-displays-2560x1440p
+igt@kms_bw@connected-linear-tiling-8-displays-3840x2160p
+igt@kms_bw@connected-linear-tiling-8-displays-2160x1440p
+
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.25.1

