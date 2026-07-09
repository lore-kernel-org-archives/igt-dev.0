Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63B0C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 07:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951F710F3DC;
	Thu,  9 Jul 2026 07:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0+rQWaV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192A710E02E
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 07:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783581411; x=1815117411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LiJnnvxMieZfMWS0RoXHpnSLioi+cdSPS2Yb/w6HuAY=;
 b=c0+rQWaVublrQbusL/yFlihuBmNNZuYDrQqvwCtqFTMpyo4UGlpD8q1F
 nahkwvdgqcPNyZMstOvajMO3NQfaFvlS64cAwYRYyf0uM3Brwo+gg/Ux7
 womXCeMx2J4T/wgA6UAFZKHeYOESREnaOmRhz1UF0TXhtubbqDCFVqpNY
 Dup4ZGrhSwQVI3EiBmfHWxLYpzQPRX8mxCnHUm4Q+JQfjI4GowdMT073T
 qVO8UqerHk+IY7UbZGHTjqWNH6HXBfDKkTHLvWVXsi7orvB/OS0+sWYsE
 hShAb5E+w0CapMWHWc6rPbc2OcL9Di238PgPw51iMJsmSBTQtnZrTihNY Q==;
X-CSE-ConnectionGUID: zDo2jNBNQvenIYPV3zedSw==
X-CSE-MsgGUID: /QIJNbRZQxWgfx1eEz9ctQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83229043"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83229043"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:16:50 -0700
X-CSE-ConnectionGUID: 3QXzLjHgTCKUaKOWfQU0pQ==
X-CSE-MsgGUID: KTjiXyvYQeKUKO/3pzT6Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254020974"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:16:48 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 2/2] Add xe_survivability to xe-fast-feedback
Date: Thu,  9 Jul 2026 12:39:08 +0530
Message-ID: <20260709070905.405108-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709070905.405108-4-sk.anirban@intel.com>
References: <20260709070905.405108-4-sk.anirban@intel.com>
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

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 64587cce1..716c7c5d7 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -223,6 +223,7 @@ igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
 igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
 igt@xe_sysfs_scheduler@job_timeout_ms-invalid
 igt@xe_sysfs_scheduler@job_timeout_ms-min-max
+igt@xe_survivability@runtime-survivability
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
-- 
2.43.0

