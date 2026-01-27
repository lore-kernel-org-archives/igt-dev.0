Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E06D2D8E0
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2705310E027;
	Tue, 27 Jan 2026 09:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmsgaSo8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BCB10E027
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507707; x=1801043707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XqkWLwBHW2FYldj6dorr0MfNDVH8XsvcEKTFjw+Btqw=;
 b=lmsgaSo8nsxb6OXviLNrophZNw29od1s/FHe+RR4QGi9lP1a7S46B/Bx
 t/nE6FTfH1NVf/Oi+0C7W0RUSrfn6mohewNiTOLAbIIeSNs6e62Blv/7s
 4TQCqzGJP5xyl8RBO46XDiRAJnhZCY/SszmWhnz9Re1wdzPyOnQxCGi+B
 YCqKWTj5aCz2MEprQTgdHx5TjsYvP7DkACvFCMys+PL87rlATTbEISxkk
 c/ZM0WgclEdt5e1cOeVMMcpCvCFXVBpBPyVQN4IZ1YoNuD/3422RZfgcH
 YRdSDPijy8+vlSyg6S3x8j9AR06R8HngjSXlcyNMGw8ANIQ4bt0vnHHBl w==;
X-CSE-ConnectionGUID: JCWjco/vQ0yfjpQhtSgfTQ==
X-CSE-MsgGUID: i2m/y0CGTDS7Jgvu68/1JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88276838"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="88276838"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:55:07 -0800
X-CSE-ConnectionGUID: 1bDLBXNVSm+rj724vVZXWQ==
X-CSE-MsgGUID: eLfD1OFUSlWU8A0hteLIaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="239202216"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:55:03 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 ville.syrjala@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 2/2] HAX: Add toggle-gt-c6 test to fast feedback list
Date: Tue, 27 Jan 2026 15:24:33 +0530
Message-ID: <20260127095430.536088-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127095430.536088-4-sk.anirban@intel.com>
References: <20260127095430.536088-4-sk.anirban@intel.com>
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

Add toggle-gt-c6 test to fast feedback list.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..3480cf537 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -163,6 +163,7 @@ igt@xe_mmap@cpu-caching
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
+igt@xe_pm_residency@toggle-gt-c6
 igt@xe_pm_residency@gt-c6-on-idle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
-- 
2.43.0

