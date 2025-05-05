Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78247C369DC
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 03:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E391C10E236;
	Mon,  5 May 2025 03:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCrqe9zj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEA810E236
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 03:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746415657; x=1777951657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XxD8A3zDIDJA7E8b4PDmTo7AkYezKbuOKmsQe1jR+l4=;
 b=HCrqe9zjri4TsRkjaQ8TUcF9RmwJ27mKOfI5zv6ReYYcXXGVYuELV+Ul
 nyxjXbUKstOhvaE+I+cqDTPM6vC8XvClW8jEt6OS4QRNYRD9paqhwqvEj
 UsuOki5hJWw3E1e6Vug6HSU5lFHI8ojYTUfF1UjWtT7/Fw/gxouiDRti/
 +F1kEbFjiPAtP89jyh5ff8Ig4tsZnIScJCCc9DbtZlAEsJArlY3lpZk31
 yISTxgowr3rVadnlMPobtSJvoiDrxWBrmqdcNzYcLxc0Ko4nKz4vh+1vt
 frbiATn6QwqvHb+wo6ZUeOuJZJ1aWb5Mg+EBnbYmxYBm+RC5j0rIb1ppL A==;
X-CSE-ConnectionGUID: 8vSVDejFTXaA8y5Irk718Q==
X-CSE-MsgGUID: AcgJDryJSh+rMDAg/JNbdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="65412737"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="65412737"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 20:27:35 -0700
X-CSE-ConnectionGUID: kwneQOhyQi2bfHE7bczYzw==
X-CSE-MsgGUID: c9F9mXYeQg2I5pDOTurvAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="166038723"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa002.jf.intel.com with ESMTP; 04 May 2025 20:27:33 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/2] Improve skip messaging and test context reporting
Date: Mon,  5 May 2025 09:04:33 +0530
Message-Id: <20250505033435.929953-1-pranay.samala@intel.com>
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

This patch series improves logging by calling the subtest name in the 
function call and ensures clear skip messages when DRM modifiers are 
unsupported.

Pranay Samala (2):
  tests/kms_plane_multiple: Add clear skip message for skips
  tests/kms_plane_multiple: Pass subtest name for better test context

 tests/kms_plane_multiple.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.34.1

