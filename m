Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D56C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 14:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F158D10E858;
	Wed, 12 Jun 2024 14:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ah0c7la4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163D810E85E
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 14:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718200906; x=1749736906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bNkH//TVJ12DeNgVOvr28cQ+5tYw94W1IGj8+ev+ZBw=;
 b=ah0c7la4CgYwWcq54iqylqWyBHvH+sXMDM8KYqVbNJBJ68AxqVGa6D3f
 nwY9VHYG8LZydqno7yc2Ki2u/ukLEze9K1dqIaeGCkvBpCSR9YZW0pvJq
 BWFjQ6XdkKpOq3I9RXHDbITgYLHtprr110zU/cQVx3pRuNfN0U7RRMVQz
 oZe//Ot+9I6z0gHmaCLsaKvQnQbsIh1am4skbJ5WB7zEBAFK7xBfZ7F+v
 ekzdyXLrAiIey8/XHJq5eR+tpdpcAHa2Izj8K4ShdWQv0kkmorFBbk1I+
 qJHF9qp1bet1PcuBUYVQ+5oN7U0SlcgCHffkwJsDM2cSHB7VUXqePZrt3 A==;
X-CSE-ConnectionGUID: 6lA5NXZFSH6DQEu/BTEuFg==
X-CSE-MsgGUID: 4D6AkmljQZmV4uBzzBfDOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15118671"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15118671"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:01:39 -0700
X-CSE-ConnectionGUID: Fa4zeQ9JRWOs1JVCU6zTFA==
X-CSE-MsgGUID: B/csuBtDSN+ZN+RDQ/fspQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="77249888"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:01:38 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Peter Senna Tschudin <peter.senna.tschudin@intel.com>
Subject: [PATCH i-g-t] intel-ci: block gem_exec_capture@many*
Date: Wed, 12 Jun 2024 16:01:32 +0200
Message-ID: <20240612140132.109022-1-kamil.konieczny@linux.intel.com>
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

Block all of gem_exec_capture@many* subtests, they are not
meant to be run in CI due to long time needed for their
completion.

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Peter Senna Tschudin <peter.senna.tschudin@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/blacklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 4fdefb90d..00f037158 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -28,7 +28,7 @@ igt@gem_ctx_switch(@.*)?
 igt@gem_evict_alignment(@.*)?
 igt@gem_evict_everything(@.*)?
 igt@gem_exec_big@(?!.*single).*
-igt@gem_exec_capture@many-(?!4K-).*
+igt@gem_exec_capture@many-.*
 igt@gem_exec_fair@(?!.*basic).*
 igt@gem_exec_fence@.*hang.*
 igt@gem_exec_flush@(?!.*basic).*
-- 
2.43.0

