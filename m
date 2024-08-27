Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F23C52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 06:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6253110E20C;
	Tue, 27 Aug 2024 06:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgPb6X+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F4110E20C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 06:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724739693; x=1756275693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W/X5ekS9L7FV8xmgr09LA3hmwCso/ys0WsXtcPdlJ9s=;
 b=UgPb6X+NDNK6hWTrawaddBRM2DflbTPNJ8jRAINwNVRRmr78pz4H1j3X
 2PTZPTM6iHeGkosCso1/A3zLVc9E1ddcvT8VrHE7dgZppsWRip5U/krRO
 nRjHOjXoiklA4/JuAzLfl9En8hGfYw8SedeamFiNmME/O5Qxy50gMfsOh
 B5JrgfNbH7m+58IpV2+KgczCrzRzj5S6frIJ/t7hVG0yhbYDQWk3RtfIo
 FAdeGSe5wXKD4OlbIpdLm0WWiiO2eP2InbDvNoGrCxQN1OOk/4n8nfa/s
 6HxNShy6JBqgqS+LI8o6Z/FkVQlhNynHcynHxBnpjXeNqd2a6wIQ+/S0V g==;
X-CSE-ConnectionGUID: fsnQSM95QiK/S2F5DuVDcw==
X-CSE-MsgGUID: 1D0YimAqSz2YAjVy8w0qbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="40700483"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="40700483"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 23:21:33 -0700
X-CSE-ConnectionGUID: jexjp32kT8uuRiuACWtD7w==
X-CSE-MsgGUID: 7uH7Ts+7TuGp1hbK0TRyQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62916000"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa010.fm.intel.com with ESMTP; 26 Aug 2024 23:21:31 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 0/5] Improve MST HDCP tests
Date: Tue, 27 Aug 2024 11:48:59 +0530
Message-ID: <20240827061904.4170393-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

Improve HDCP MST test by doing the following
-Eliminate unnecessary loops and wait times
-Add retry logic for mst test cases
-Change screen color based on HDCP Encryption Status

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (5):
  tests/kms_content_protection: Move HDCP output checks earlier
  tests/kms_content_protection: Move try commit call
  tests/kms_content_protection: Rename igt_commit_style variable
  tests/kms_content_protection: Add retry logic for mst usecase
  tests/kms_content_protection: Set screen red/green based on CP Status

 tests/kms_content_protection.c | 184 ++++++++++++++++++++++-----------
 1 file changed, 123 insertions(+), 61 deletions(-)

-- 
2.43.2

