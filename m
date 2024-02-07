Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4DAC4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 22:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B8F10EDAB;
	Wed,  7 Feb 2024 22:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJ8wRqhZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FD610EDBD
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 22:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707345995; x=1738881995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wi+sSKapr0M2iWYa0kpqPEYur2gTvVLRf0dH9X4Ljj8=;
 b=XJ8wRqhZJNcCFaz4QXzr7IIAKDCGtC0HXWgmu+/huXIdEr8joTe7NaPy
 nmbi24HHpXrDKa5YL5EpMJ3KkoFIhglqZ0a+RaaIs6bonp41Pah03wAhs
 i0VEkDpdbm5+0kvB7OrXPKDT/0wy/SmF6WauIjy33gvCCNegjl/2oNnaL
 UIozSbz3YcGOrK4Ykf5THlzuIpLLRJ+3mISM9Nbc/YtIelyF6CSAou8zu
 8HlYAfcdZKncpf9fRiWe+l4Od4DCZ58EWzm9Fsr6QD6QrTgnKKxO5u8zM
 97sjl5rhZuSbW4terEV5kZK8FGwwHe8W/8/rRIQYy7dmH8Xbys95dbHKG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1244476"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1244476"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 14:46:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; d="scan'208";a="32545608"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 14:46:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mchehab@kernel.org, kamil.konieczny@linux.intel.com,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel-ci/xe-fast-feedback: Add xe_mocs to
 kunit tests
Date: Wed,  7 Feb 2024 14:45:01 -0800
Message-ID: <20240207224643.250958-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207224643.250958-1-lucas.demarchi@intel.com>
References: <20240207224643.250958-1-lucas.demarchi@intel.com>
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

xe_live_ktest@xe_mocs was added, but never included in the BAT tests. We
should really be checking mocs as BAT.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 6c01374c1..82e02e3bd 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -231,6 +231,7 @@ igt@core_hotunplug@unbind-rebind
 igt@xe_live_ktest@xe_bo
 igt@xe_live_ktest@xe_dma_buf
 igt@xe_live_ktest@xe_migrate
+igt@xe_live_ktest@xe_mocs
 
 # Move fault_mode tests at the end to unblock execution
 igt@xe_exec_fault_mode@twice-basic
-- 
2.43.0

