Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A09C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF5210E271;
	Wed, 19 Feb 2025 09:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ehq+GOnK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A8110E271
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739958407; x=1771494407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CbLa7yU90vvSsA6a+YYoOdgvPIFLg7+7LHtInuREqFo=;
 b=Ehq+GOnKy1RKrJ5A+5TouVFjQXLCf9MaTCYJNdImy8NXoxbTnN+I2km4
 0zJzKsUbSijsLP5RlcHlnOoSd7blixKqHAMU/DlhKdTGE8NGpN66CYMC9
 vIrHTp/h9y5+mkqcHewwT1pmOYIwXI9w3KN7hnjNsacGd/BdnOsrapKI6
 7nLqMUq2Z2y0s5JlkuIk/gsS/WOWnAxT1k5gdZErMOhy85l7ps2E6SD9I
 iWC9dhEHug5WSrITfkVSCD8hIMputkN6y2Sm1DPT+lurAJREXZtiAQUUW
 2gWURoWdOfkcZvdGvYw0Y9udUSZ1jhq7/4jTQ3APNUDJNwGr5d8mEd6kN A==;
X-CSE-ConnectionGUID: C2Vljvo8SLieCmFZz4/c6A==
X-CSE-MsgGUID: CHutp0HVSoSs9PftUe3YmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="50902836"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="50902836"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 01:46:47 -0800
X-CSE-ConnectionGUID: jRJjH2+BTJyDNGrL9CjNLQ==
X-CSE-MsgGUID: F5N5/tAcTcSwfxtwPUOW+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="119645596"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa004.jf.intel.com with ESMTP; 19 Feb 2025 01:46:45 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t] tests/kms_properties: Add IN_FORMATS_ASYNC property
Date: Wed, 19 Feb 2025 15:02:11 +0530
Message-Id: <20250219093211.4059187-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

New property IN_FORMATS_ASYNC has been added as immutable in KMD. Add
this property in the kmd_properties list.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/kms_properties.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 57f07e699..2f2878378 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -443,6 +443,7 @@ static const struct {
 	{ DRM_MODE_OBJECT_CRTC, "GAMMA_LUT_SIZE", IMMUTABLE_REQ },
 
 	{ DRM_MODE_OBJECT_PLANE, "IN_FORMATS", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_PLANE, "IN_FORMATS_ASYNC", IMMUTABLE_REQ },
 	{ DRM_MODE_OBJECT_PLANE, "SIZE_HINTS", IMMUTABLE_REQ },
 	{ DRM_MODE_OBJECT_PLANE, "type", IMMUTABLE_REQ },
 	{ DRM_MODE_OBJECT_PLANE, "zpos", IMMUTABLE_IF_SINGLE_VALUE },
-- 
2.25.1

