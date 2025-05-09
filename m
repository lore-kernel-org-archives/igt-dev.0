Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A173DC3ABC3
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 13:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8C510E278;
	Fri,  9 May 2025 13:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzToPtFZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A4A10E278
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 13:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746797170; x=1778333170;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kKxhqN+sIlEcIMfCSLaXSSExV2RgmQ/umE/uAeAAyo8=;
 b=IzToPtFZTMMwGrvri61bGx3Xwy0/IveZoPfz0Y0rS5Y8cg2Bx2L8G48V
 4cLXf9om0pHVw6anpkgDbrdz5Yh0YhEnOh9ho6hCK9TzJl/TnvYbCikWi
 UR5Nb4YtZ4EAAflBH/EQI+kBcifAyalIKVr5dGWiozCy7fn6dW9rB2PgM
 JNZtYE27T62HTv/0L/MvM7jLw/6Dvy2FyjAsvYNwZQb1k0GVA7GRTZQly
 bGY+4i/Oo+6Vzi/WDuC7TaVARqs/i50FdXoCVcMr1mkVFSl2oyDcU93Um
 lyCvAbAku2w5rKvdJSzoYtbLCS16efk9eqJkXYLD6Z+EgGkpAy/5KJe4A g==;
X-CSE-ConnectionGUID: 8poTAXzgRZGQ+JROQI1Irw==
X-CSE-MsgGUID: TNCushLTQuagAtSlZz2v4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51280712"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="51280712"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 06:26:10 -0700
X-CSE-ConnectionGUID: HyAbfuAkT+KLuYNsRuLWPA==
X-CSE-MsgGUID: Q/twv48gTIaktXRZPKzOwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="137004595"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 06:26:08 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t] intel-ci/xe.blocklist: remove
 device_reset@unbind-*-rebind
Date: Fri,  9 May 2025 15:26:02 +0200
Message-ID: <20250509132602.27205-1-kamil.konieczny@linux.intel.com>
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

Remove device_reset subtests unbind-reset-rebind and
unbind-cold-reset-rebind as they should work with Xe.

v2: unblock only *-rebind subtests (Marcin)

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 541917393..cf5844c9d 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -37,7 +37,7 @@ igt@xe_live_ktest@xe_bo_shrink
 # Exclude all other non-Xe tests
 ##################################################################
 igt@debugfs.*
-igt@device_reset
+igt@device_reset@.*reset-bound
 igt@drm_read
 igt@dumb.*
 igt@prime_.*
-- 
2.49.0

