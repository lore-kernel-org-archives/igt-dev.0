Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63572C71157
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 07:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B32510E1D1;
	Wed, 18 Jun 2025 07:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnQ5/UNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76F510E1BA
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 07:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750232563; x=1781768563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v8wWCDcVrNjXux3SsIQtbWkpznlirH9yYyWiTZAFrqc=;
 b=XnQ5/UNAak/3JZ88QNi3ifOmTjo2vc8N/ben6OS2MflxQPCci7DgRVgL
 NnoNp5UUtZ5cWtVY2nm+t6BV5nWtit16/01aaEjOcXmlFKvWk4OV+vY4D
 dUDKsBcygh8LOfa+LxKCYrymHO2Ad3Zt3AXUJlUz83zRj9TsJ6AHxOsGg
 fvPvdEGWgYip0Z7lN15h1Oy8w+3hNYNO5Mkz3IkXJChJw6QcF0Ngxa8zX
 gyyrgRLR0ZV9GuttaDDX3uFAtnSe37+orkvxQkDi7o+RDuNJpq6WTuq30
 B4L/hJ17U2dYQ7Ik9xalonHS8FLTXC+ipLPSdPvXo5LSfH+UJZzrvZ+p5 g==;
X-CSE-ConnectionGUID: b9ZabmP+SKafrX4CjagqIw==
X-CSE-MsgGUID: kkOaivTpTASaDeNKSS6Bzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51662553"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="51662553"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 00:42:43 -0700
X-CSE-ConnectionGUID: WmdZrGWzRF6OFO0h4/Wsiw==
X-CSE-MsgGUID: oPwpSh5qQeKfBgm7HH/Iag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="149941398"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.153])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 00:42:42 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_exec_sip: Adjust test documentation
Date: Wed, 18 Jun 2025 09:42:27 +0200
Message-Id: <20250618074227.3660-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618074227.3660-1-dominik.karol.piatkowski@intel.com>
References: <20250618074227.3660-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Change mega feature and sub-category to EUdebug.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_exec_sip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 062b80a08..310526531 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -6,8 +6,8 @@
 /**
  * TEST: Tests for GPGPU shader and system routine (SIP) execution
  * Category: Core
- * Mega feature: Compute
- * Sub-category: GPGPU tests
+ * Mega feature: EUdebug
+ * Sub-category: EUdebug tests
  * Functionality: system routine
  * Description: Exercise interaction between GPGPU shader and system routine
  *              (SIP), which should handle exceptions raised on Execution Unit.
-- 
2.34.1

