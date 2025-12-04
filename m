Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07518D2E036
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 08:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7094D10EA2F;
	Fri,  5 Dec 2025 08:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LObsKxNL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405FD10E1F4
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764861546; x=1796397546;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w7sDghfmpceZBmn4JadlP/soC+WciBYErq0FMI5WCk4=;
 b=LObsKxNLHeKlRQR0bhDQVhnjYfoqkUQgdKSudCHhyKBjP0VewtUywXKp
 SB5TmPL9+q1CU9CXhbUuj+2NVzm6ep1qJP6gBDYjMFuFj7u84lXPm5b7v
 bH9H9UhS2pMjfDhL+tIC/dMTSDspaSISKsJSPxn/AoNUsWIy5k6ZfFzRX
 L078olf4xb3Cu02FC2GCjecDSMdIGhzq0ugiNqCmJ8kzIiCjBynyyuL69
 uuLCMxf2RudLWtLIW2yLBpkeuOsfqNfl8g13K+gHxnhpmUeEgq/e/71XH
 cy9c1YdrtdvtNUK3oYWr5JPu+sdo/L8RrFERaVHsgGkJXwGCEEvqYrSOu w==;
X-CSE-ConnectionGUID: h+LkY2CMQ0OCfxUT40QRfw==
X-CSE-MsgGUID: B1dpkCVsT3C8jFSnqC/c/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78348785"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="78348785"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 07:19:05 -0800
X-CSE-ConnectionGUID: RR+RX397Rg2bUOsxxey9Fg==
X-CSE-MsgGUID: UYFQMPRBTE2Y09qwWbop1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="225982281"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 07:19:03 -0800
From: Moahmmed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com,
 Moahmmed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t 0/2] RFC: Fix chamelium port allocation during
 igt_fixture
Date: Thu,  4 Dec 2025 20:47:48 +0530
Message-ID: <20251204151750.633993-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 05 Dec 2025 08:03:06 +0000
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

selecting appropriate connector and solving the igt_fixture issue.

Mohammed Bilal (2):
  RFC: chamelium/kms_chamelium_hpd: add helper function to select
    connector port
  RFC: chamelium/kms_chamelium_hpd: use helper function for connector
    lookup in DP/HDMI/VGA tests

 tests/chamelium/kms_chamelium_hpd.c | 426 ++++++++++++++++++++--------
 1 file changed, 303 insertions(+), 123 deletions(-)

-- 
2.48.1

