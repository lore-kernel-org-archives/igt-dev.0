Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489F0C27C75
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 07:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF92F10E7B2;
	Wed, 12 Jun 2024 07:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+pqIuCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC3010E7C6
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718176291; x=1749712291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=No6NJfuDU6u4KSbjMyR84kQHy/Zv1inyoPptcU/bMu8=;
 b=g+pqIuCQXNZk5PCL/ly+7QY9WGioqeywOl/A2j4KwpgdH56jxeYUslkA
 PM3JYZs9OKlrCHfsnY4G8l6XOSN+uj5zj0lyB1WZJN7PXSwYyQdo+PeXU
 nKH7si3oDuxJ6CmOLuunNd6KKKnVBvQstu+8zpSdd/K5gkRUBC6OIbRz7
 I1GkuVU1+1LcLsVXIEXwfhDSUmS8UIRi0XW23odz/iyAzD20D0sdtdxme
 qHFs8voS3clG54QoW+QQ2CXK9MTHTNVv+gVPn25uw6dI5eyd75y3cYvGl
 wRfyix7+hjb9ShX7EXPuLgFvtrM94qajhEmDYhh+6pousRqyyaHoULnXT w==;
X-CSE-ConnectionGUID: 1IMExqRqRaSCJFLUWzvj4A==
X-CSE-MsgGUID: 7m4ui3BZRMmUNy30YOIkWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15092499"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="15092499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:11:31 -0700
X-CSE-ConnectionGUID: Udm7KrRQShmLFhwF8kkBVA==
X-CSE-MsgGUID: QbeOAh61Q/CzMxYvi255sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="62868026"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:11:29 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [i-g-t V2 3/3] tests/intel-ci: Update blocklists
Date: Wed, 12 Jun 2024 12:33:35 +0530
Message-ID: <20240612070335.3758500-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240612070335.3758500-1-bhanuprakash.modem@intel.com>
References: <20240612070335.3758500-1-bhanuprakash.modem@intel.com>
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

As non-Intel tests are moved to different directories,
update the Intel CI blocklist accordingly.

V2: - Fix regex for non-Intel tests

Fixes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11129
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/blacklist.txt    | 10 +++++-----
 tests/intel-ci/xe.blocklist.txt |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 4fdefb90d..c38cfe39f 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -91,12 +91,12 @@ igt@kms_chamelium_frames@hdmi-.*-planes-random
 ###############################################
 # Broadcom
 ###############################################
-igt@vc4_.*
-igt@v3d_.*
+igt@vc4.*
+igt@v3d.*
 ###############################################
 # AMD
 ###############################################
-igt@amdgpu/.*
+igt@amdgpu.*
 ###############################################
 # VMware
 ###############################################
@@ -104,11 +104,11 @@ igt@vmwgfx.*
 ###############################################
 # Panfrost
 ###############################################
-igt@panfrost_.*
+igt@panfrost.*
 ###############################################
 # Qualcomm
 ###############################################
-igt@msm_.*
+igt@msm.*
 ###############################################
 # Hibernate: not configured correctly on CI
 ###############################################
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index b33b568fa..828baf324 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -4,9 +4,9 @@ igt@meta_test(@.*)?
 # Non-Intel driver tests
 ##################################################################
 igt@amdgpu.*
-igt@msm_.*
+igt@msm.*
 igt@nouveau_.*
-igt@panfrost_.*
+igt@panfrost.*
 igt@v3d.*
 igt@vc4.*
 igt@vgem_.*
-- 
2.43.2

