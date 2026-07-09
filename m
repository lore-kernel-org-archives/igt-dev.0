Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FAFC44501
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 07:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1F710F3F1;
	Thu,  9 Jul 2026 07:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DU/OyW1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605DB10F3D9
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783581405; x=1815117405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h5fg6yf3QYjLh+y6UhNKNk0UQRLTkmBscbwxcSEuIFA=;
 b=DU/OyW1YyK7ri0lVeDYs2lK18oRRFye41fAKB/H25zeQpukf7tgtZj8s
 8ww1PMPWhANlp4U9fzN9qg39JgY8odKdoIB/jhJMFwEM2/CXcHv6JRP2F
 SP8DZkkcM1znQrClBZKSvyziAY+BOOpFSjT+NmOFOAOI1LYSlkOGisJfg
 IB8cxu00voEmjh6J2JUDDCCCTR0PTBCqbREoXBt3amxxfxuwUgK0DTioc
 B8NcPiMYUwLtxPttvLiJz6zUZ8JqZAr1UyME8QlvxGSs5dZB67RFJVT5i
 lcEnxpABuJBUPptjLoiny4vhJN3vr3nj3Bsf4dmpyavnWhVzwOFoA2/0r A==;
X-CSE-ConnectionGUID: i1XHkdzdRYSqVcujvfWiAw==
X-CSE-MsgGUID: ZNIU+3v0S1uRRJPf2lg91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83229035"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83229035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:16:44 -0700
X-CSE-ConnectionGUID: iGZG+BwtSRyoDQ5wiS9lqw==
X-CSE-MsgGUID: WyYSNMzTQE21pVi/6T9j7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254020959"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:16:42 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 0/2] tests/intel/xe_survivability: update ignored dmesg regex
Date: Thu,  9 Jul 2026 12:39:06 +0530
Message-ID: <20260709070905.405108-4-sk.anirban@intel.com>
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

The kernel now reports -ENOTRECOVERABLE when the device is wedged.
As runtime-survivability deliberately wedges the device, update
dmesg regex so igt_runner does not treat the expected error logs
as failures.

kernel implementation:
https://patchwork.freedesktop.org/series/168780/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  tests/intel/xe_survivability: update ignored dmesg regex
  Add xe_survivability to xe-fast-feedback

 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 tests/intel/xe_survivability.c           | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.43.0

