Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690B2D216A7
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 13:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F67110E297;
	Tue, 15 Oct 2024 13:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgPVxzkl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B8C10E297
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 13:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729000672; x=1760536672;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UPF6CQ/dJxoibpnt/en1lR4KymiwFQQCxZkA1p2HM6A=;
 b=FgPVxzklr51GoY191s9m4Hzug7DIkG/M/9XHCj9VdtcwUdprnA734iYJ
 1XRRhL1sNLVD9LU34MdinITHa7Y241UYUMGnouxJ/PHdIdIPMGK25p2FE
 ibGMCJNHla+9CeMOb4CTNCV4lTC3Xjxw16A50yGm9RFuNAKpt+UVRnMQs
 bGr9UgtaxawKSHJHly41i0qehUO70Cf1CgOfmmAv9OePhMNDSsmMHkHpY
 6azt7+xpgiY0LvheQ22udyvgnr7nv4ksWhvNGx+ydpyN0k+gEddux3QlT
 nOW8MSMskBZ/CKfRRuz1e58w3d740apry3K7C2o9xWdZMU9LBsCfGa+zP w==;
X-CSE-ConnectionGUID: agT6cM94SRuXNQXfyuNNxw==
X-CSE-MsgGUID: r7mEnuXeQQ+aYt3XQtWIYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28494406"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28494406"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 06:57:51 -0700
X-CSE-ConnectionGUID: ICm501avQmyFcto2fuDTig==
X-CSE-MsgGUID: aRYoRY0uTWOIK/gYt6mhvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77788266"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 06:57:50 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 0/2] tests/kms_plane_scaling: Cdclk exceeds max Cdclk
 issue fix
Date: Tue, 15 Oct 2024 19:26:52 +0530
Message-ID: <20241015135654.2328448-1-ramanaidu.naladala@intel.com>
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

This change will solve the cdclk exceeds max cdclk issue.

Naladala Ramanaidu (2):
  tests/kms_plane_scaling: Add mode override in scaling test
  tests/kms_plane_scaling: Improve error handling in kms_plane_scaling
    tests

 tests/kms_plane_scaling.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.43.0

