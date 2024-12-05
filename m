Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBF8E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 10:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AED10E5C3;
	Thu,  5 Dec 2024 10:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dI7ITcGN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02A010E5C3
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 10:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733394383; x=1764930383;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7NZtFdJwX7rPejus9jbiqAE4fcv1pjebL02WRM3jH9c=;
 b=dI7ITcGNHe92gTQaMtLKe4jMQ0ysoycT7cekaqIPPVb46Rj6daj6Y2q+
 oNEVKuZtMWddKjltkjHkVufrsckFDuiWZWx2Oc34e4E7kwJ9tB49w9dV5
 zenIB9gqVRsLibCX1Tz7thiEBIPi51RW46Xnf5S008F1v3PZcofPWbxjb
 gLcne4ab6Y9JZGkkR+vw3pHaQmTl2/Tr4lhp9nS3VFHTxYmDsCh4+frGq
 V7cVq4lpQpxIAqpBkWzge5hkOQ46tu92zZs8XHfxszNCfppvNYsOPNe1V
 LJ9tBFmVoErMi5syb522HqFS05ie8xggmwM8oWDJaYKvfUbrvVvJ6AXjs w==;
X-CSE-ConnectionGUID: NoK4oFoSQJ+mj4cvH8vtCw==
X-CSE-MsgGUID: X6RoNSnlQ0CXCpUcDlLbmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56178711"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="56178711"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 02:26:23 -0800
X-CSE-ConnectionGUID: 5thSjfM1T5ybUPzPEIghVA==
X-CSE-MsgGUID: BptPAMGbQOOzHT+ib+rzMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94889646"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.20])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 02:26:23 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 0/1] tests/intel/xe_eudebug_online: Fix
 run_online_client memory leak
Date: Thu,  5 Dec 2024 11:26:12 +0100
Message-Id: <20241205102613.13524-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

In run_online_client, buf is created by create_uc_buf, that calls
intel_buf_create_full, that callocs and initializes it. This memory is
never freed. Fix it by adding missing intel_buf_destroy.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

v2: Use intel_buf_destroy instead of free (Dominik Grzegorzek)

Dominik Karol Piątkowski (1):
  tests/intel/xe_eudebug_online: Fix run_online_client memory leak

 tests/intel/xe_eudebug_online.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1

