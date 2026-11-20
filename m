Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62586606A320
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MspQpwKE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C2E112A66;
	Fri, 20 Nov 2026 13:38:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661FF112A61
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795181686; x=1826717686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xcU/T9z6X2NMZBVf3M0Eif3OAzSsMURASB+3f4z8+zc=;
 b=MspQpwKEFZRQgwlV7fdptAxEm0wV/y5+fx2D2yj607ibqkxAFJyotMHe
 RQfcjQo4ylq7Jktx2cEWsfHORzj8C9yR7z2IalszRHGrsUU5PQ5hyoaOH
 MjPeAO22uTJsj4kjTwwRSdwfv6+vbpGNkD24grns+GkSXnw+gy/FZL2of
 iL+14mmLm5FT3pWfmaM3EXSsdGiSryX+X/InpZ4BhLZ0HKxRMKvZF172A
 zHdjfZudx2zlLgsPwgNogKLX3igRpZGmXhSvPsy+BkzalNJi2JygS/NSm
 Z1C7rqWrIy95/gQkcyNE3VdQ1IiR+6T6Tbh64eqyBaREuxeqK3nfROeH8 w==;
X-CSE-ConnectionGUID: NFkZyPfORVW6iiMn857Omg==
X-CSE-MsgGUID: O77wAlVjReSQ67XTaFxFqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3943152"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3943152"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:34:46 -0800
X-CSE-ConnectionGUID: cJ/VP/hWQU+1nRfL6Yw4lg==
X-CSE-MsgGUID: 3VqsHS2gRvqIrYtxLJcQLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12412017"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:34:45 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/3] Add hibernate autoresume helper and test coverage
Date: Fri, 20 Nov 2026 19:13:57 +0530
Message-Id: <20261120134400.1888895-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move hibernation setup into the reusable igt_system_hibernate_autoresume()
helper and use it from kms_ccs and kms_hdmi_audio_bw. Keep full
hibernate recovery opt-in for kms_hdmi_audio_bw with the -r option.

Swati Sharma (3):
  lib/igt_aux: Add hibernate autoresume helper
  tests/intel/kms_hdmi_audio_bw: Use hibernate helper
  tests/intel/kms_hdmi_audio_bw: Gate hibernate test

 lib/igt_aux.c                   | 143 ++++++++++++++++++++++++++++
 lib/igt_aux.h                   |   1 +
 tests/intel/kms_ccs.c           | 162 +-------------------------------
 tests/intel/kms_hdmi_audio_bw.c |  36 ++++++-
 4 files changed, 176 insertions(+), 166 deletions(-)

-- 
2.25.1

