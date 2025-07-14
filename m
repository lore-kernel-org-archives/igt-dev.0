Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB36C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 12:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECEE10E493;
	Mon, 14 Jul 2025 12:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8TytdY3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E4810E484
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752494403; x=1784030403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oOUEKv89lTgDSOLvRAwKi+LnKzzIeuwdOCkb91/xEvc=;
 b=M8TytdY3PiqLEwNHydLb+cx/apsOxvWwK2s3PUdRGP/NgVOjHdeSv9UX
 eaPbSAgKXSgKefak2XwIXMd3TXi2uz46r6A9xs3KznjLEnymKExACTwYJ
 rM8A3eGxDLvmz8d6F/cvv/R2SE1QWkFT90/308q2VjXm2jQCt4fb4neFw
 AOnq9DSlfrNzLjk+hBcwTGOrsmxk/oP48nBgQrB0Mab/l7OLNoncAfFSg
 GXJRseRKQwzXT3PeWpFgTcmamktESKjdTMgDfEXMwOJZcf90F6A0/qh3t
 /VDAfLTW4L8r8ixjL16smr3UsqWcYgjQWRjnL7KO8owKHoaoj58c8J4rv g==;
X-CSE-ConnectionGUID: qYk+nV2STl+it5g/6Q1Bxg==
X-CSE-MsgGUID: vdlQWWxrSzSkByFIihW2sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77220235"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="77220235"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 05:00:03 -0700
X-CSE-ConnectionGUID: 1K0FHpiwT0G5vtGx6QeYoQ==
X-CSE-MsgGUID: /b2sypZ6Tr+Q/bSAnZIoMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156333460"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 05:00:01 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v1 2/2] RFC: meson: Add bash autocompletion install step
Date: Mon, 14 Jul 2025 12:01:30 +0000
Message-Id: <20250714120130.464545-3-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714120130.464545-1-jan.sokolowski@intel.com>
References: <20250714120130.464545-1-jan.sokolowski@intel.com>
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

Add a call to bash autocompletion installer
script.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 meson_options.txt   | 5 +++++
 scripts/meson.build | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/meson_options.txt b/meson_options.txt
index e23402b36..01bd1dc6d 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -82,3 +82,8 @@ option('version_hash',
 option('srcdir',
        type : 'string',
        description : 'Override the source code path embedded inside target binaries (optional)')
+
+option('bash_autocomopletion',
+       type : 'feature',
+       value : 'enabled',
+       description : 'Install bash autocompletion scripts')
diff --git a/scripts/meson.build b/scripts/meson.build
index 6e64065c5..3df0b6a96 100644
--- a/scripts/meson.build
+++ b/scripts/meson.build
@@ -15,3 +15,7 @@ endif
 igt_doc_script = find_program('igt_doc.py', required : build_testplan)
 gen_rst_index = find_program('gen_rst_index', required : build_sphinx)
 generate_iga64_codes = find_program('generate_iga64_codes')
+
+if get_option('bash_autocomopletion').enabled()
+       meson.add_install_script('bash_autocompletion/install_completions.sh')
+endif
-- 
2.34.1

