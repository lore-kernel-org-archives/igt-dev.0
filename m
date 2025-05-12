Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55E3C3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 12:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFED10E3D1;
	Mon, 12 May 2025 12:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNbKB8xW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E163C10E3D1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747054445; x=1778590445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iUdYfTWpa5OUMT3GciQLVK6SgvNkdP+ND/GI74bSpP0=;
 b=MNbKB8xWwe36JXDvWpXMGQjI9z2i5s81/2e6944U1Roml7sakjoxZKRT
 ECr3jrCqDZJgqT/tKKfQCb6g3Qxp/3tbSmH1dD1YDx2LQPFePddf35uVs
 4ahtLjbrdRO6zEhnCIOQtvki0GtseHLGTT6xTTiHQpb0uRizQbOfE+knf
 VwJjVMDhtRVCu9BYuFARSc+10KQuX08JTpkVEyuHQtV1Kpt+AKhp3r1sY
 Qw8G95yqsXfg3VBGVrm8aXBGvrC7EmOjX25I8ycBca0P/ZK/+aYuoBv2x
 BQBwk8laD371MSL26ls9L4hoeXGU2OY16BJfGJoVZk/ym30jr8w3JttUQ A==;
X-CSE-ConnectionGUID: 4sQGfzzNS325CjvAqvKfCg==
X-CSE-MsgGUID: m2MsBfyLRDm0nsYlWHpKIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48967555"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48967555"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:54:02 -0700
X-CSE-ConnectionGUID: 32EeffvjR3OKXJ/QCAGpyA==
X-CSE-MsgGUID: yxkgnLRLRRCUHIFTX0K/qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137828346"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.35])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:54:00 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v3 0/2] intel-ci/xe.blocklist: remove
 device_reset@unbind-*-rebind
Date: Mon, 12 May 2025 14:53:53 +0200
Message-ID: <20250512125355.99620-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Unblock device_reset@unbind-reset-rebind and also get it into
Xe testlists.

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Kamil Konieczny (2):
  intel-ci/xe.blocklist: remove device_reset@unbind-reset-rebind
  intel/xe_test_config.json: add device_reset

 tests/intel-ci/xe.blocklist.txt | 3 ++-
 tests/intel/xe_test_config.json | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.49.0

