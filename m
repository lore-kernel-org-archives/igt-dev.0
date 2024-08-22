Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C14CC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 06:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203E710E725;
	Thu, 22 Aug 2024 06:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3CT/nvH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1A210E725
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 06:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724307256; x=1755843256;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W/X5ekS9L7FV8xmgr09LA3hmwCso/ys0WsXtcPdlJ9s=;
 b=N3CT/nvHhJ04ARv0dzdQHMRuR4gjAQTb2zRbgBfe+FRmLoKyvMPwHqgI
 nVtcqGhZnQvHlBPFz7c1RiucTd+LDfCSnE5ernWxxALNrmynSdNnJ5XVr
 NG3v51DSrGEgALtzUdm5+xy6AH47dqZL7lxLGx6AhklJwG87xXjfmycPE
 YJu4Exp6dA+fWNHNkGL92xiSBIVCJFwRqpxZgYPj3pdXa1VhuN68PYh3k
 VT/XNdIJqiV9H1/LVE5U2a/dSvKJ+Hba5Y7+XX1WCby0PuxRGsQ/4AtHK
 dctWTOn0OMXnHiwAstz4ALZA4va6g2hakpeN7WVFwHNJuBUTI81ajlumv w==;
X-CSE-ConnectionGUID: GRDSLR7JR+qdQ5Q4i8W07A==
X-CSE-MsgGUID: Rjy78TQKQImiYRTzQ1YBrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22225612"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="22225612"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 23:14:16 -0700
X-CSE-ConnectionGUID: igvbuac/TbSPqSQb9puFGg==
X-CSE-MsgGUID: bhzQA+/GSMiQJtA3zZHo+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61329151"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2024 23:14:14 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 0/5] Improve MST HDCP tests
Date: Thu, 22 Aug 2024 11:41:45 +0530
Message-ID: <20240822061150.4127413-1-suraj.kandpal@intel.com>
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

