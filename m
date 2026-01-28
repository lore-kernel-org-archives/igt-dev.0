Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CC6D3F094
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 16:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9869D10E2CC;
	Wed, 28 Jan 2026 16:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyL99wid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80D310E2CC
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769618557; x=1801154557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CUL4r+7DLmaG1PR8jAD7MGpa214aDQaGZTnmId4PI2c=;
 b=NyL99wid7OXHVJClV0Pl+GA0Zcq557zzrlmTECbFrgzoDWan6BMx65SD
 gSEgAoP9AtyjV9Cb0yS4myNq7sFdwQGjKZqSW0t59gXJ1lAxy24HnswD9
 LP6vElg2NAGQSBYfnHN2yT/AgefFciV61CWq8j/Vk4qYu6+4Mrmr9FmUJ
 PYCbKux1fPNKUdJTdHQeWi/Su7hFedWIKRma6ZvLtOWSnnXiFmu342K1C
 WZLG0esi+4DyN9q/GYAACFbt/gNLOXm3TNl0grKOp6B2aZVyzPG54adXW
 +d+BXiQSQmXeyXO8gb9pLqMp9ArGdd4jxulbpCOkJR+8O+QpvaJa5b2iW w==;
X-CSE-ConnectionGUID: IAOhIgIFT8+1ip+5YuaOkw==
X-CSE-MsgGUID: 5r17T+H1RoulM9QypwS91A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96298713"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="96298713"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:42:37 -0800
X-CSE-ConnectionGUID: MK82EutqRU215gveuh57kw==
X-CSE-MsgGUID: KjzysoThRjCCQlAphdZGZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208334324"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.49])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:42:35 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/2] meson.build: FOR-CI-ONLY: Change to debug
Date: Wed, 28 Jan 2026 17:42:27 +0100
Message-ID: <20260128164224.932886-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128164224.932886-4-zbigniew.kempczynski@intel.com>
References: <20260128164224.932886-4-zbigniew.kempczynski@intel.com>
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

Patch is only for testing purposes, it should reveal hidden bugs
related to compiler optimization. As first patch changes one of
tests use this CI run to reveal additional bugs (if any).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 4b2496c016..1ce7efa282 100644
--- a/meson.build
+++ b/meson.build
@@ -4,7 +4,7 @@ project('igt-gpu-tools', 'c',
           'warning_level=2',
           'c_std=gnu11',
           'b_ndebug=false',
-          'buildtype=debugoptimized',
+          'buildtype=debug',
         ],
 	license : 'MIT',
 	meson_version : '>=0.52.1')
-- 
2.43.0

