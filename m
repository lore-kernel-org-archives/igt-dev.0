Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F219C3271E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 18:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC46610E04B;
	Fri,  5 Jul 2024 18:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghL+4zXC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DB110E075
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 18:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720203195; x=1751739195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xj3z9LZzhXuUP0xKLY7ez1QCxmUDuHcbtuICHLCy4a4=;
 b=ghL+4zXC8YJFlOSBZqgenizEVPg4TDTB13tBYbYxHXfAPpdPEsEbkLXL
 N+JuzeRT+rodIhd/DpAV2ElxDlxfna4JWZ9McHpplALLTJ63Ar31OAKBp
 kxAQtrl7llSycCMKWmsnRR78Tq2Rq1kZezc2oSyy17gWQlIx0i9hvV09+
 UyqTN1Bsax7CGYQhO9gfi4WzrTz6F3qcngD9M7rsdvGak6v7oUjcVQhFI
 rhXM703hn3ojsEd3b4AvlI+VNUCnEib3ETNoguQE4AT0+OFlcSC/xlGAb
 PovZq1Iofcz9FrZRMenDF+7CeF850Z7R2cbtByKkqiwHLLBQEjmlGlj4N Q==;
X-CSE-ConnectionGUID: F+1bJv8zQbmq3mWbR+zzlA==
X-CSE-MsgGUID: SZpfIfDQRDS/qvKAPJ0ZPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17145758"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17145758"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 11:13:15 -0700
X-CSE-ConnectionGUID: +QvRfyayQKexk0GXoRLX5w==
X-CSE-MsgGUID: 4CrLZF2iRGaZVtAq4B5eew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="47009970"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 11:13:13 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe-fast-feedback: Add SR-IOV tests
Date: Fri,  5 Jul 2024 18:40:30 +0000
Message-Id: <20240705184030.633153-1-jakub1.kolakowski@intel.com>
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

Add SR-IOV tests to xe-fast-feedback testlist so that they will be
executed in BAT runs. Added tests will exercise:
- enabling maximum number of VFs without autoprobe
- enabling one VF with autoprobe

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>

---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index aa98b37e6..01b01dcf9 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -65,6 +65,8 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
+igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
 igt@xe_compute@compute-square
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
-- 
2.25.1

