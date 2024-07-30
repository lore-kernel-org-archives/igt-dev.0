Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35438C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BF010E510;
	Tue, 30 Jul 2024 11:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/hEd3ut";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8D410E510
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340138; x=1753876138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rfg55Rs/p9r4ZpMhr53or16c8+izJv9JAXFecIFhm6g=;
 b=l/hEd3utolxAki6q3mvXKznVm0q4IYH8DvpPGZMAqSudehiFmt9/+3XB
 o0lQWg2fcXzQEemXtBstv0mqey/rFqWJJy2dlPQqPKmyD5yHMgq9bENUv
 nUJqwLoxtTopufK0y3jlkN1z4DBJymtN//9VNsW5VnbyPsiD7oud2lqzF
 gpQ0b/bCe8MoK4A66TML0Cpd4/nf6OfQ2AQc8Oq/QhI+91/eaLTXjg2cE
 +0ObguSyMgKlpM0XtCTzZt86lD2QIez2/BOQNpReo5syP1oBVhkAknvAP
 sb+F4wgS38Qg3Ix9tdxakIY72PCpBTWRaLVEcAHKofeN1gNgaaO3sqT99 A==;
X-CSE-ConnectionGUID: M+J7cW9xR8GgIUUX1J6Hdg==
X-CSE-MsgGUID: tOJa90jtTxOZ6YyQtkqiQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937446"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937446"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:58 -0700
X-CSE-ConnectionGUID: +KLvwkvTQLiL+Rgs1NkYDg==
X-CSE-MsgGUID: Ar7IYc8zQjqySN26tjJIBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217279"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:54 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 45/66] tests/xe_exec_sip: Add nodebug test cases
Date: Tue, 30 Jul 2024 13:45:02 +0200
Message-Id: <20240730114523.334156-46-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Karolina Stolarek <karolina.stolarek@intel.com>

Introduce tests that make sure we don't enter SIP when debugging
is disabled.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_exec_sip.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index a27d3cba6..35d65bcc4 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -285,6 +285,10 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  * SUBTEST: wait-writesip-nodebug
  * Description: verify that we don't enter SIP after wait with debugging disabled.
  *
+ * SUBTEST: breakpoint-writesip-nodebug
+ * Description: verify that we don't enter SIP after hitting breakpoint in shader
+ *		when debugging is disabled.
+ *
  * SUBTEST: breakpoint-writesip
  * Description: Test that we enter SIP after hitting breakpoint in shader.
  *
@@ -392,6 +396,9 @@ igt_main
 		test_render_and_compute("wait-writesip-nodebug", fd, eci)
 			test_sip(SHADER_WAIT, SIP_WRITE, eci, 0);
 
+		test_render_and_compute("breakpoint-writesip-nodebug", fd, eci)
+			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, 0);
+
 		igt_fixture
 			xe_eudebug_enable(fd, was_enabled);
 	}
-- 
2.34.1

