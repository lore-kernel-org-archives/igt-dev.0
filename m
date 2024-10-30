Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFABD74954
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 02:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFD110E73C;
	Wed, 30 Oct 2024 02:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQVOa2xJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F8810E73D
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 02:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730256821; x=1761792821;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RAz25wexcprW5DRaQ36YD8fCT7PmPAnJ+g5NuWMFaKI=;
 b=KQVOa2xJWvNHcQ4t2Ht2GyGu4Ua9FYg04x+gOcc1nae7TGIjauoG3Izl
 0yJRv2gFArV92xTm9Uagfowdg2llXwqWVLP3mSFqCAyQYag7NmtELwk/M
 ghiIXRGm9kphbKhK6pyBgkSinJzMO/oZGs6mtJhMnF9aVgU2LaSOQbQpE
 4ILmW68Umu5VVJ2LRweBgE7XbmSavZdh9qy0SDzxc6DebRxoGErEuLWgO
 LzU5/AS64qA+WMuSGCkGX2Y61RexvVQxH260VIfyTfoRxmgFH3v16Y5qC
 DBF+Nhc3QRyhoA8FCTsAChbKgy8wQtu6WIa7aSG8AbC4MhO9WmlTJhOwI A==;
X-CSE-ConnectionGUID: QsmJDQXZT3ypU4SxWIYwbw==
X-CSE-MsgGUID: pnpF3JKWR1S5YDGmxHqa9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29362489"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="29362489"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 19:53:33 -0700
X-CSE-ConnectionGUID: pnWoqNEvSlynKPDOQbIRzg==
X-CSE-MsgGUID: YDtEcD0iSSWXoVTAvslNXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="82256963"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 19:53:33 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 0/2] tests/intel/oa: Tests for OA syncs
Date: Tue, 29 Oct 2024 19:53:25 -0700
Message-ID: <20241030025327.1487897-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Ashutosh Dixit (2):
  drm-uapi/xe: Sync with OA syncs uapi update
  tests/intel/xe_oa: Tests for OA syncs

 include/drm-uapi/xe_drm.h |  23 +++-
 lib/xe/xe_oa.c            |   6 +-
 lib/xe/xe_oa.h            |   2 +
 tests/intel/xe_oa.c       | 282 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 308 insertions(+), 5 deletions(-)

-- 
2.41.0

