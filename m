Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720D5C282D2
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC81010E2EF;
	Mon,  3 Mar 2025 23:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGxPYACt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA7910E0A0
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043707; x=1772579707;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/6oIOzgP8UuVDdMyfEpgJUpMxsHk1EmAQM1GStc5F84=;
 b=mGxPYACtU4xT5BgzuwGBw1mxNZt43rHEKeW7RmnlBc144/TAYpcFzxtx
 sXzPqCsUsAfTyB+NW3PUTeBl86ytyQb+0huYOSCfUdarXyG45k19kVY3B
 49droxYt3k1lOkrgjyIAjfcr75D1BtU+UW00+AgdDC93q6r+naG1w3P+Z
 9jfM/LWCGvke96XL6Q5E/wjbfYArUSUleQyyJdw8ut+qDO1/1mjlpjuIM
 imKpOZOyWXvh8YgORMup0qYNmKv93+dZ+tQqavpICgkyJutDFFY3LtbPS
 TKaz02eyDYiOM9OuSyoFpUqM4fyxB+53m9lOcGOjNQC8FP41mHgArTkW/ w==;
X-CSE-ConnectionGUID: bxr27B2LS8uEzbmSOIo3MQ==
X-CSE-MsgGUID: 21xAZGVURV6U8xtL7KqQpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793034"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793034"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:06 -0800
X-CSE-ConnectionGUID: rsJoNY/oSpOik63U9Z8xnQ==
X-CSE-MsgGUID: tejCHGqZQx6ERPW8tDe/iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716672"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:06 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 00/14] Some refactor, rewrite and fixes for OA tests
Date: Mon,  3 Mar 2025 15:14:48 -0800
Message-Id: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
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

Some refactor, rewrite and fixes for OA tests. Added some tuning
parameters to control execution on slower platforms and simulation.

v2: Added review comments

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (14):
  tests/intel/xe_oa: Use static for global variables
  tests/intel/xe_oa: Drop unused macro
  tests/intel/xe_oa: Use period_ns in max_oa_exponent_for_period_lte
  tests/intel/xe_oa: Rename oa_exp_1_millisec to oa_exponent_default
  tests/intel/xe_oa: Use default exponent for some tests
  tests/intel/xe_oa: Use same render copy width and height across tests
  tests/intel/xe_oa: Rewrite the polling small buf test
  tests/intel/xe_oa: Simplify the buffer-fill test
  tests/intel/xe_oa: Use default buffer size for non-zero reason
  tests/intel/xe_oa: Test oa buffer sizes
  tests/intel/xe_oa: Rewrite enable-disable test
  tests/intel/xe_oa: Enable unprivileged-single-ctx-counters and fix it
  tests/intel/xe_oa: Fix mmio_trigger_reports testing
  tests/intel/xe_oa: Set boundaries for OA exponent test

 tests/intel/xe_oa.c | 570 ++++++++++++++++----------------------------
 1 file changed, 205 insertions(+), 365 deletions(-)

-- 
2.34.1

