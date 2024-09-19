Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D469CE8D7D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 12:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDAA610E1DF;
	Thu, 19 Sep 2024 12:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFO68Ajn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5978A10E1DF
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726750014; x=1758286014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iscyY1relJQANjW/vOLSfoFKVg1UdLDmULmtDmjCxo4=;
 b=mFO68Ajnol0FdGdwNTRIJd8WQWgAG2ZSwHQ9LmCwr5eAZ39d8HhIO84J
 3Ujxdy8GAGvG8GR/VE6NsmHnmlhv7Mh6TAfaIiZCdkTqyQq4q+Mg/bDCX
 g+1ZIQd+qWB51chWtMSYw1EDwkcjYmfHqh0DvolIeHFcNZ7MqVaXwmbYi
 wJ0z4C1rAX2c56xYbBB/XJNwkRuS4Oxef4rz41gYFkNw14OKYCwIcdaTN
 giv1YV4mpjzBLCCFgJyijKwQ8b+E6FOXe3fWVXtj5MESIgMGGspMZotrD
 cDTwr8lwuEiM4O4c2AyKJfOZanlglJ2WMTAHxKSusUTU+NpFbrYRrCBdF g==;
X-CSE-ConnectionGUID: U20gYbZvTkOOWcvYuoxwtA==
X-CSE-MsgGUID: dSmFPN0+SrSOeafWtKCZEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25900211"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25900211"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 05:46:54 -0700
X-CSE-ConnectionGUID: NYg13k5lRb6QhUACJKQapA==
X-CSE-MsgGUID: pEtYv1SVSpWMxsi4wSnoLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="93215654"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 05:46:52 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, nemesa.garg@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [igt-dev][PATCH i-g-t v5 0/3] Add new test to validate adaptive
 sharpness filter
Date: Thu, 19 Sep 2024 18:19:24 +0530
Message-Id: <20240919124927.1142249-1-swati2.sharma@intel.com>
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

New test is added to validate adaptive sharpness filter on
LNL platform. Pipe scaler is repurposed to perform a portion
of this work. This means pipe scaling will be unavailable while
the sharpening function is being used. The other scaler can be
used for plane scaler.

In this series, attempt is made to validate adaptive sharpness
solution which helps in improving the image quality. For this new
CRTC property is added. The user can set this property with desired
sharpness strength value with 0-255. A value of 1 representing
minimum sharpening strength and 255 representing maximum
sharpness strength. A strength value of 0 means no sharpening or
sharpening feature disabled.

KMD: https://patchwork.freedesktop.org/series/138754/

Swati Sharma (3):
  lib/igt_kms: Added "sharpness strength" as crtc property
  lib/igt_kms: Added func() to return scaling mode name string
  tests/kms_sharpness_filter: Add adaptive sharpness filter test

 lib/igt_kms.c                |  23 ++
 lib/igt_kms.h                |   2 +
 tests/kms_sharpness_filter.c | 748 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 4 files changed, 774 insertions(+)
 create mode 100644 tests/kms_sharpness_filter.c

-- 
2.25.1

