Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E1E1091926
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 21:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3835D10E15A;
	Thu, 19 Mar 2026 21:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bllh20kI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8323010E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 21:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773957109; x=1805493109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TaOANohdYcHgm5sKyJgpXoeNn0RA/NmtS/eWctB7GEc=;
 b=Bllh20kI+fVtBajSqbwJqoIKTgiB3MuMYXnXz5v9XazSIl/sPpqY4/97
 rO9uxedvwr8C1HD4KibmzYHLT3p/cctuY1N4vyN9836yTdhdUACZ6HdRL
 lthl7mQU53z5xcGGZh+4TMteUiEhs2tbU0Hpw6iG/hHfpp38pvPG+//UY
 3K6m81EyPFXTgLrnNH6zUi0A4DEtPH+eJSNq2Fee4DNiUMyF2qnN9Fec/
 eCWVZtlzfmb5Ty07zn/w4rWXHIpnl+DJgU3MxPPXRcpuu9CmgIygrR9Xy
 sv6po/8ukOxhbHfPK8GNmWushdAnKz4kFaSrlB2Fqp3aPT7XM4nVEQZxm Q==;
X-CSE-ConnectionGUID: hW4zAvbmTWOlS1+4lMjJxQ==
X-CSE-MsgGUID: 4elbL1VxS5W/Wg2uvtmQDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75010865"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75010865"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:51:48 -0700
X-CSE-ConnectionGUID: up2OhiCVRH+V0ug8LfWvrQ==
X-CSE-MsgGUID: h01I4A3LS2SUJ5CFZV/Iig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="253576916"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:51:47 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t 4/4] scripts/hooks: Example guc log copy script to
 attachments dir
Date: Thu, 19 Mar 2026 22:51:29 +0100
Message-ID: <20260319215124.2066611-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
References: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
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

We need to explicitly extract guc logs for failed tests so add
hook script which does it after subtest/dynsubtest execution.
As copying to attachments take a lot of time do it only for
failing subtests.

Adding this hook script to CI will extend its execution time much
(all failing subtests will copy their guc logs to attachments dir)
so introducing some form of allow-listing will be necessary. For example
exiting immediately on tests where we know guc log might be not useful
is simplest solution.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
---
 scripts/hooks/guc_copy_on_fail.sh | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100755 scripts/hooks/guc_copy_on_fail.sh

diff --git a/scripts/hooks/guc_copy_on_fail.sh b/scripts/hooks/guc_copy_on_fail.sh
new file mode 100755
index 0000000000..2360952634
--- /dev/null
+++ b/scripts/hooks/guc_copy_on_fail.sh
@@ -0,0 +1,24 @@
+#!/bin/bash
+
+# Hook script for copying guc.log.
+# Suggested usage with:
+# --hook 'post-subtest:scripts/hooks/guc_copy_on_fail.sh' --hook 'post-dyn-subtest:scripts/hooks/guc_copy_on_fail.sh'
+
+if [ -z "$IGT_RUNNER_ATTACHMENTS_DIR" ]; then
+	echo "Missing IGT_RUNNER_ATTACHMENTS_DIR env"
+	exit 0
+fi
+
+cd "$IGT_RUNNER_ATTACHMENTS_DIR"
+
+# Copy only for failed subtests as this is time-consuming
+if [ "${IGT_HOOK_RESULT}" != "FAIL" ]; then
+	exit 0
+fi
+
+STNAME="${IGT_HOOK_TEST_FULLNAME}"
+
+for log in $(find /sys/kernel/debug/dri -iname 'guc_log'); do
+	attout=$(echo ${log:23} | sed -e 's/\//_/g')
+	cp "$log" "${STNAME}@@${attout}"
+done
-- 
2.43.0

