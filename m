Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74178C77B7A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 20:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2428210E158;
	Thu, 19 Jun 2025 20:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQmqrbZg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8477210E011
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 20:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750363316; x=1781899316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dq1PJO6fMEybn7yw8eIgLzOHo/HCtPn17jL+lByJABc=;
 b=mQmqrbZgU25HOf/75JaLfGlWXU1bL8NgYOh3yTMNl+E6xPSpnOMPbg6x
 cslT5d9paGxDxMGfw90GT9tZFH+scvflzQZ0BNDGMHVBDvVEjhtfXVFHx
 D0h9JhbTip1WuopZVE4QycJxxpIg0MQaq3JQVwRy8zuDwwdSr5VT0d5A2
 3daaRCbnfzUADZWHnqyL+5yvHIDkAUmNLJJG7l5cFqOQ30kL9zJTqsdaV
 kfUXczEi+904pwM2sssXIpWxmNIWXQC+W1aUtzk6gG+z43aX5C5uLICVa
 6GEkzEyLV4pvm5Lrice67r1HSt9QzLzLTT4NzUy+yJQnpMPQceYaobbbO A==;
X-CSE-ConnectionGUID: lTxQKcypT429Gkh5BwB+Ag==
X-CSE-MsgGUID: jpH1k9KGT02bDhbXL5psbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70187008"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="70187008"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 13:01:52 -0700
X-CSE-ConnectionGUID: /gF8ZGAjSGaBNzBSmv2KPA==
X-CSE-MsgGUID: nHoiErRwQLO4CJHadOYqAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="187949769"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 13:01:51 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 0/2] tests/kms_flip: Improve frame timing checks for
 high refresh rates
Date: Fri, 20 Jun 2025 01:31:41 +0530
Message-ID: <20250619200143.66272-1-ramanaidu.naladala@intel.com>
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

This patch will improve the test timing checks.

Naladala Ramanaidu (2):
  tests/kms_flip: Default to tiled modifiers for stable flips on high
    refresh panels
  tests/kms_flip: Track and report unexpected events with pass rate
    metric

 tests/kms_flip.c | 44 +++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

-- 
2.43.0

