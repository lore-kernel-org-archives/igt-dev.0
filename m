Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAE9CA0FF9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 17:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B5A10E168;
	Fri, 29 Aug 2025 17:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyjiGQJA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E560710E09A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756487721; x=1788023721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tAXU/HRc2mw1y96+i2rfTWRDfaZi/UC/9noEzVLmZw8=;
 b=gyjiGQJA5CAeKCLwJ7q8e0XnmJRULpTHf0fghIOouieX4Za8AG4DzsGz
 Icv59TrydkrE9qAijIcUlK2kOjBGG3y3ckRYl7wP3EQ4k3z0R3QSxJbs4
 EZDgqV0jXpahgSPONnpejNfWLZnhkpt/ITydr4evuRMWjH0xWHJm8glvy
 kD/+1JKn6mNT0QcSPcLp0UaijZlSOYQEXBbIMEemDs7gRN2VrBnN1oX4a
 C4aTX1zuglPkqDJWbD9nSTKiz3WcIAf+SaB12GTUChdvJKt6F0lciEuHR
 0Iisp5uWZ7ivTzKgT+Gh3V12+OJGh4MMv7gm2QXV8XCjiAcK26Qr/2QEm g==;
X-CSE-ConnectionGUID: mSBzdv8nTL+U8rbfPH3rxw==
X-CSE-MsgGUID: 4h1GvdYvQzGZCKOLJGqP5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70212403"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70212403"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:15:20 -0700
X-CSE-ConnectionGUID: rA7gD7/2QgOyXuVvKThiQw==
X-CSE-MsgGUID: grvOuzp7Sl65HeqMcGgBqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170816731"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:15:18 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 sushma.venkatesh.reddy@intel.com
Subject: [PATCH i-g-t 0/4] Updates for OA media
Date: Fri, 29 Aug 2025 10:15:02 -0700
Message-ID: <20250829171506.3148434-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Ashutosh Dixit (4):
  lib/xe/oa: Update LNL XML's
  lib/xe/oa: Update BMG XML's
  lib: Update BMG/PTL device info
  lib/xe/oa: Fix OA media metric set properties

 lib/intel_device_info.c                   |    2 +
 lib/xe/oa-configs/guids.xml               |    8 +
 lib/xe/oa-configs/oa-bmg.xml              | 1755 ++++++++++++++++++++-
 lib/xe/oa-configs/oa-lnl.xml              | 1755 ++++++++++++++++++++-
 lib/xe/oa-configs/oa-metricset-codegen.py |   26 +-
 5 files changed, 3419 insertions(+), 127 deletions(-)

-- 
2.48.1

