Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993E1C52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 04:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D22B10E245;
	Tue, 13 Aug 2024 04:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fUuhu7OD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FB710E245
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 04:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723522922; x=1755058922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CIXmmGp1iOExZ2m3GJY7J87a0+vIhry1DIct7dmburU=;
 b=fUuhu7ODXyMYlOrj/kgCWw7S7NDKOIoWW1BNYAS5YmqRTG1Pt+Xy7V9d
 4MuIkt7lGcUxnCaOTxhQ4T88RubmMAV5o9/F+qJgcS1N7mfjDb3XvzGsh
 ONx2Rs/ltRF18+qwKE/AdvKc57yU/07Hs5dQ0zxsxP7gsZWtdO/ITSNnG
 c11FvnlpqGal0Au87aciEugw4M9piWbFciudzq3sFPBIeeLx0EoJjyMER
 H/rcDW0OhxmDfbl5RWHR55vnQH5VdfEVtPbTOPNlP0K6tZROmE0Fl4QCS
 uZN9x2fnE5Dols204JmtFd2orc62uRCIuWxW32wSuAPeY4YUGDfZcYFdL w==;
X-CSE-ConnectionGUID: 8O4nwpZPSVWadtabv5/8Bg==
X-CSE-MsgGUID: lXAVyWN4QCCxJUxbFHOQlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44186575"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="44186575"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 21:22:01 -0700
X-CSE-ConnectionGUID: +IPuFHp+S9yxJ6W9JX7aZw==
X-CSE-MsgGUID: AItNVEcTTzKyWoXzZ8zoiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58210032"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2024 21:22:00 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 0/4] Improve MST HDCP tests
Date: Tue, 13 Aug 2024 09:49:31 +0530
Message-ID: <20240813041936.4014668-1-suraj.kandpal@intel.com>
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

Suraj Kandpal (4):
  tests/kms_content_protection: Move HDCP output checks earlier
  tests/kms_content_protection: Move try commit call
  tests/kms_content_protection: Add retry logic for mst usecase
  tests/kms_content_protection: Set screen red/green based on CP Status

 tests/kms_content_protection.c | 120 +++++++++++++++++++++++++--------
 1 file changed, 91 insertions(+), 29 deletions(-)

-- 
2.43.2

