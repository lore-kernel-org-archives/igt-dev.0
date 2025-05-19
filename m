Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB05C3DA6D
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 12:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0180B10E1B0;
	Mon, 19 May 2025 12:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDMvo1KG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94CF10E385
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747657928; x=1779193928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EHulIYw3zsJFThWJpKBL7ZCxiUwvL4linyy9Wbhe0cI=;
 b=CDMvo1KGs/d5LyElHyQd66OylLaSzjXUcL2RT6FFGg/wvedkSbTUvVOP
 7+NkKAod2q4k+NJuijdF5bKIZZK2U8e/fQogXJcJlfqGq+EckneHJc0wJ
 MVmtwNIypo4ym4ksRmLx8rd9q5+e/wd9QH7wkfw0NBosja84Q5impw+Mh
 kVsa5b4l7Odsv5RFqKThVAxxgTKSn15RkoNLa/+EvtKIVXKUvP3DO92BL
 auobis2uwUPLHjw1jKi5ewmKYHzyAeGQnrSDY6YiUWqWv9XiGwe6eOUV2
 KYJ+Vmc50TjS0dv9T5uT2FPtvIWMY9M4bGYcPZ4XfxDW3jWARZjY/AKB+ A==;
X-CSE-ConnectionGUID: YJm2P81ASR+/fD/xQSwfhQ==
X-CSE-MsgGUID: ryyJVK+zT++SW8D3MOVHRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710013"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49710013"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 05:32:08 -0700
X-CSE-ConnectionGUID: 50kFFtnLQDuexBZVTYEvhA==
X-CSE-MsgGUID: hqGnS4rDRsyLIPwx56F1Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="144358188"
Received: from unknown (HELO thasleem.iind.intel.com) ([10.190.216.203])
 by orviesa004.jf.intel.com with ESMTP; 19 May 2025 05:32:07 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 0/2] Refine FBC test conditions
Date: Mon, 19 May 2025 18:01:33 +0530
Message-ID: <20250519123135.1307174-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
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

Refine FBC test conditions.

Mohammed Thasleem (2):
  lib/igt_debugfs: Add specific checks for WA in GTs
  tests/intel/kms_frontbuffer_tracking: Enable the tests support
    variations based on the WAs

 lib/igt_debugfs.c                      | 31 ++++++++++++++++++++++++++
 lib/igt_debugfs.h                      |  1 +
 tests/intel/kms_frontbuffer_tracking.c | 24 +++++++++++++++-----
 3 files changed, 50 insertions(+), 6 deletions(-)

-- 
2.34.1

