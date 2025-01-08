Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A31CE77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 15:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1D810EBDE;
	Wed,  8 Jan 2025 15:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4L3ZhX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A76910EBDE
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736348704; x=1767884704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9nWOcyRyPNuvtNMdKlXXFU8YJiVML9LIhQFeANKzX4Y=;
 b=a4L3ZhX/IgLI9a90Cp6QC4H4Z+kjy+31cWGWXn8UvDg9ngY3M6vlDm83
 QOr0evLI+HbEcjyBx5TcZU5OzbYP2i/F6vabB7hw8Ss8/xX9xguQetk6e
 KXdER+uxAyW4fdFLAE1DOynRUu3hdiX23qdfbeEo37UglTbZISKoUKzYM
 QL5d5SkHatUypXqbO3BL+QMOGYHg7J/wB7clIVeptSfDY1EOu4cCHUCTs
 Cbq+vdoJQiJz7kp6iUgqssUrJN1CK47hUq83E2C7n8NG2wowiX39TucaS
 6nAvXSC8+1rT8U40tpbtSYilwMMDj+xdq4WcKKSdmdgd+Qkf+ZUTYHFQF A==;
X-CSE-ConnectionGUID: 1eNeKdBuRfisPcwk256dpQ==
X-CSE-MsgGUID: HixevLSsQwi7T0D+SspcGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36460934"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="36460934"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 07:05:04 -0800
X-CSE-ConnectionGUID: JtSkZ40ySt6y1eCC2GOtRA==
X-CSE-MsgGUID: YRA3VC9qS3erIHecTOjAAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="108178032"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by orviesa003.jf.intel.com with ESMTP; 08 Jan 2025 07:05:02 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, lucas.demarchi@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Date: Wed,  8 Jan 2025 20:34:48 +0530
Message-ID: <20250108150448.329219-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250108124637.291978-1-mohammed.thasleem@intel.com>
References: <20250108124637.291978-1-mohammed.thasleem@intel.com>
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

Check ghe algo for the function called by ghe igt while compiling.

v2: Update version check and remove warning message. (Lucas)
    Print messae at api else check. (Kamil)
v3: Remove special case and update dependency declaration. (Lucas)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 8b2a2a64a..3b6988cd6 100644
--- a/meson.build
+++ b/meson.build
@@ -197,9 +197,9 @@ else
 	chamelium = disabler()
 endif
 
-libghe = dependency('libghe', required : false)
+libghe = dependency('libghe', version : '>=0.2.0', required : false)
 if libghe.found()
-      config.set('HAVE_LIBGHE', 1)
+  config.set('HAVE_LIBGHE', 1)
 endif
 
 build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
-- 
2.43.0

