Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4746CC83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 15:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D1010E0DC;
	Fri, 18 Jul 2025 15:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJ3RqrNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4704010E9E3
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 15:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752851751; x=1784387751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=heJAKy+RsE8wvcQuKdXDmYLOmOgkhfL+QisIBE0TiMo=;
 b=OJ3RqrNpkUWi3zR4DsPt167KZL6QD+yPAfmhLUVN6VlxsAbEv0vQDKGL
 +6VEOsMEPwiMT3nur/BmZ5fCM1B1HC9uWo0sO5ulQS3BRKkAfuhRkD6XU
 bq7c584D1Z3KhIgCNBRF3Or9jVCFoP1PNUEUJKsu5gJst9KYI7zASyifK
 ACjaHZ0yivXbBJSynqHMIr7HwnKdqI2zTToH21NbxwCDB6GXjSw+QlIvN
 mN9BWPtThdZ6+HEyAoFta9LoV/WG2rR5lniMhGHETrm6x8H9VxsMX6bOQ
 X87X8foURTTCa2w9dkogDd+eQ7VJAUqbx6dXImZDMLaVik/MrMYCGBUOo A==;
X-CSE-ConnectionGUID: t1kJv6iJTbuTQ5WFox+7wA==
X-CSE-MsgGUID: cxgXvlvJSnuS6gTygpAdUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54861012"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54861012"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 08:15:51 -0700
X-CSE-ConnectionGUID: GnVw8w+3TL2tKIqRBfpZeQ==
X-CSE-MsgGUID: 9F8SYGNyRqCmq8LdpTy3xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="195213510"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 08:15:50 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 3/3] meson: Fix warning
Date: Fri, 18 Jul 2025 17:15:21 +0200
Message-ID: <20250718151521.105886-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
References: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
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

There is now warning printed by meson:

WARNING: You should add the boolean check kwarg to the run_command call.

As after the run_command there is an explicit check for error,
just inform meson to not make a check itself.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 4efad72cf..aeed3b1d2 100644
--- a/meson.build
+++ b/meson.build
@@ -171,8 +171,8 @@ xmlrpc_client = dependency('xmlrpc_client', required : false)
 
 xmlrpc_cmd = find_program('xmlrpc-c-config', required : false)
 if not xmlrpc.found() and xmlrpc_cmd.found()
-	libs_cmd = run_command(xmlrpc_cmd, 'client', '--libs')
-	cflags_cmd = run_command(xmlrpc_cmd, 'client', '--cflags')
+	libs_cmd = run_command(xmlrpc_cmd, 'client', '--libs', check: false)
+	cflags_cmd = run_command(xmlrpc_cmd, 'client', '--cflags', check: false)
 
 	if libs_cmd.returncode() == 0 and cflags_cmd.returncode() == 0
 		xmlrpc = declare_dependency(compile_args: cflags_cmd.stdout().strip().split(),
-- 
2.50.1

