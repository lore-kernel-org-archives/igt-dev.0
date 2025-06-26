Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834F7C7EE30
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 12:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA12B10E292;
	Thu, 26 Jun 2025 12:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lo2yiFuN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7366D10E292
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 12:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750941782; x=1782477782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qyn9Ozq5YnJWmqaoYikBi8fPR8UF6Eq4cF12LUnCA5o=;
 b=lo2yiFuNa/Yy4jGzjqXeS9Gn5an7IVTWsVdoZL5BRPkiNfNKbzHhid8Z
 VyRUEeSqcRrnRVP2ZSg8b5UW5tUZXPyfk6MhUBHvYtP1tuFNilKKuWwmT
 lO2oMQZsrbtJk05mw/LdmPAx8XfEohbkj+BKCkICB+fDgINIBFIQ6b7Ua
 /kTe0HigxNZ0t2NNlPp+jsCfj7R+Iqu8aJUaEJOioNx/VeHlEQ2ehicmN
 gOJRH6s/2w88QqsxJ/S+X9muIoRDHBGTY6btusvfYU6jRFpPJoTPaBbTy
 Kgif4ukd1c/9cX712+V9qS+FnEdSRTPAqQwUgPMeiyPseD4X1jy083zo9 Q==;
X-CSE-ConnectionGUID: rehUTMhyR26vvoBnCCQKxg==
X-CSE-MsgGUID: KP8ex7E9RJ2OGH3+IE57fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52463811"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="52463811"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 05:43:01 -0700
X-CSE-ConnectionGUID: U45TbUmXT9e/5NHl8G7ciA==
X-CSE-MsgGUID: VME7a79aRsSC2DMlLhdWMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="158009909"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.223.55.70])
 by fmviesa004.fm.intel.com with ESMTP; 26 Jun 2025 05:43:00 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, karthik.poosa@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [RFC PATCH v2 0/1] Enable VRSR
Date: Thu, 26 Jun 2025 18:12:14 +0530
Message-Id: <20250626124215.112702-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

Enable VRAM Self Refresh.

Mohammed Thasleem (1):
  tests/intel/kms_pm_vrsr: Add test to validate VRAM Self Refresh

 tests/intel/kms_pm_vrsr.c | 623 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 624 insertions(+)
 create mode 100644 tests/intel/kms_pm_vrsr.c

-- 
2.25.1

