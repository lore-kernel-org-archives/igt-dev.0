Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62902C43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 21:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1AF10E0D1;
	Tue, 14 Jul 2026 21:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8DtKaXm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8069810EE50
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784063141; x=1815599141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gJ2hh2TAqORiTZUIanpcGlT5o0KOooOFHotS4lhyGAg=;
 b=h8DtKaXmbuYlX//cc7v6FxHsIvvJ1Jdn0nQ+/Eh1zfSgBfTyUroSgsGz
 DodTGe83mLacu634hQB0MMSbn8XtpHR4rs2Vvd+6WdKRxjjFZkGxUoG9/
 +Qhkv6glhgAASMVKwFCwMAuZbcDJNsKPKjYT/7mgUwB1wyKFtJWyH4pBJ
 QJ/XUFiivSGkbBuhym6fgkZG5AR3tzcl0J8PLxhZSxNhPVyi6cNVYXvS8
 qPjyuTn2UrfOO34cgCfL0P1Uwjlt2yAX7KHsrEgW9sWEAAAJokc81ZHtY
 idbof0DIktrAkuirf/DidwF/9kCwOjP29Q/7NfFuMnlyiGn5+1JlROh34 A==;
X-CSE-ConnectionGUID: 9DiJSBouRLuy8CD8DlLHNw==
X-CSE-MsgGUID: a1wSSNV9QDKN3ZzNqvgiZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88372438"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="88372438"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 14:05:41 -0700
X-CSE-ConnectionGUID: mizpZD9OT5GCcJ54dlULdw==
X-CSE-MsgGUID: bQ8cOPjcR6erojVW4bivhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="280386253"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 14:05:38 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 2/2] HAX intel-ci: Add xe_survivability to xe-fast-feedback
Date: Wed, 15 Jul 2026 02:27:50 +0530
Message-ID: <20260714205747.119025-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714205747.119025-4-sk.anirban@intel.com>
References: <20260714205747.119025-4-sk.anirban@intel.com>
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

Add runtime-survivability test to fast feedback list.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 64587cce1..746a10e57 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -216,6 +216,7 @@ igt@xe_render_copy@render-square
 igt@xe_spin_batch@spin-basic
 igt@xe_spin_batch@spin-batch
 igt@xe_sriov_flr@flr-vf1-clear
+igt@xe_survivability@runtime-survivability
 igt@xe_sysfs_defaults@engine-defaults
 igt@xe_sysfs_scheduler@preempt_timeout_us-invalid
 igt@xe_sysfs_scheduler@preempt_timeout_us-min-max
-- 
2.43.0

