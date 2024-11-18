Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C815AD591B8
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 20:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5D010E278;
	Mon, 18 Nov 2024 20:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfOu7eq8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECCD10E278
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731963521; x=1763499521;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Gg+QPiVkTfKEEsJwb8JZlofY/SvTapjt+ZtyxrIEyE=;
 b=RfOu7eq8o9JG/0kl+MEgF6TRPUWs/IrSbcRJESc/54kOC7DpmH0PGkGh
 kS+KDygOiyEbeINqAMwTFwtb1DOD8Q8vzl24aO+lXPbynPk36kPgrkXe1
 o8eSk2ecEvXOUoSHm3xtS7HK05r1NO4pjTJ8KGUSYtVsIghmnX0r+ihwB
 6s8oLisk6zvraF/iaS59rj0rhoBP5PQNeWD0JJ1rgYAEnpC8QbWaMXyuF
 5LKmB7//G5ASUh4ag8RH4zMubl26fAZJggMQIQ1i/jO10ibWj++lJcGof
 vjZoDtVFaW4duvSjBacluhz0iQUTQA1EfMjPsgEIWirS4r7hnegHT7JJj Q==;
X-CSE-ConnectionGUID: ORR72+GKTYSTHunJpRPIkg==
X-CSE-MsgGUID: vRiYPIHASDWTbe2E6a6B8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31877926"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="31877926"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 12:58:41 -0800
X-CSE-ConnectionGUID: 6dBkGcZrS7iuJMip4d07Cw==
X-CSE-MsgGUID: RVUNC9HlQdueU+hk9JO7Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94277880"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 12:58:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 0/2] UMD direct submission tests 
Date: Mon, 18 Nov 2024 12:59:12 -0800
Message-Id: <20241118205914.2339782-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Public checkpoint on some experimental KMD work, do not review.

Matt

Matthew Brost (2):
  drm-uapi/xe: Update uAPI for UMD direct submission
  tests/xe: Add usermap test

 include/drm-uapi/xe_drm.h     | 153 ++++++-
 lib/xe/xe_ioctl.c             |  29 ++
 lib/xe/xe_ioctl.h             |   3 +
 tests/intel/xe_exec_usermap.c | 800 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 5 files changed, 982 insertions(+), 4 deletions(-)
 create mode 100644 tests/intel/xe_exec_usermap.c

-- 
2.34.1

