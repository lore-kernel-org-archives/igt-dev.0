Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AD1F54AAD
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 13:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E64410E661;
	Tue, 24 Mar 2026 13:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ij5idoqs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F7710E6A9
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774357994; x=1805893994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DxXRTzwGsHnVR0TnHqFz0JVudelMaToZk2q4sk0xWJg=;
 b=Ij5idoqs2S6Aj/umBLKondKVQacKdII8sGktZ2na3lAVOqJ1jtRJSu1/
 9WrKcbni5FngEzOQnOpH+BasPBo+sAjMFgFbYamZK3Wua582Qruyjtk8/
 uJVO0hHRPdHj3ihrI4Yq4vDDMg58BsBgoAP9AbFckGHy+ylJwGcL9V6KY
 5Yr5OBuSQ1zeTwLr9nfQUwxNgJj5p/W5KhOtEme+mV22vsHCBs36Ezgya
 TGc1rnNeAR5IC8sh6CjtNYNF9cbQVcrKQr46ShH8zFhWRhf1qcScRp7mS
 ZJd4D8UHCX55FobW54DiB5dOO3D9QK3awRCD62w6D2YOmQpKmEwZK47Cu Q==;
X-CSE-ConnectionGUID: 4yEIgvZ+Q42ORyEL/2lmdw==
X-CSE-MsgGUID: SGd9snMES5ep2CcEfvgBmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74394958"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="74394958"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:13:00 -0700
X-CSE-ConnectionGUID: unUP9JAVT+yDFVYhnfj0yg==
X-CSE-MsgGUID: pslx4gICTieowSFOpMYOFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223563592"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.143])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:12:58 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2 4/6] scripts/hooks: Example guc log copy script to
 attachments dir
Date: Tue, 24 Mar 2026 14:12:40 +0100
Message-ID: <20260324131235.712916-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
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
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
---
v2: install hook to datadir/hooks
---
 scripts/hooks/guc_copy_on_fail.sh | 24 ++++++++++++++++++++++++
 scripts/meson.build               |  2 ++
 2 files changed, 26 insertions(+)
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
diff --git a/scripts/meson.build b/scripts/meson.build
index 6e64065c5e..99c43b4606 100644
--- a/scripts/meson.build
+++ b/scripts/meson.build
@@ -15,3 +15,5 @@ endif
 igt_doc_script = find_program('igt_doc.py', required : build_testplan)
 gen_rst_index = find_program('gen_rst_index', required : build_sphinx)
 generate_iga64_codes = find_program('generate_iga64_codes')
+
+install_data('hooks/guc_copy_on_fail.sh', install_dir : datadir / 'hooks')
-- 
2.43.0

