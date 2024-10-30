Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0A1D6B6DD
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 23:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA40710E832;
	Wed, 30 Oct 2024 23:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aG+M4IcJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71B510E81A
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 23:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730329228; x=1761865228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RUql04GK+Fw7+SHJwlafohCVXOg5hD63PyYujWiZGXU=;
 b=aG+M4IcJfigsY3agG6qWxUn0DorHtTXGlFy50uLoxfqjk8RuJdsHMYOY
 +92m0aCJKtZxsBwwDrR+UqVtRCpVCP0x+IBGtgvp/aHa/HPW3vEoEOgab
 gcd97RS8KLs8t9qoynR7qCNlMJ6o52flKakgTFvADo1rJ0o9iKy0m48ys
 +s0Ali6fPKLe+9di53qwig04zd5yu9TDbTHu53w6uI5m+PWh+93OLifXd
 yXw2oZZAbUAIrYj80zzfK28b4q//WKiz/QMpALafYch9ksO63zW7a/kb8
 SsBKQM9MonjOH9ZCb7IGhxpYSbxl+xzLZxVr9TRYPIwp+BR3G6SBla9Dl A==;
X-CSE-ConnectionGUID: UHa9k3/iSW6yYJQsouVE0g==
X-CSE-MsgGUID: 5lL26nO0SNeLqlJSATqyQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33748297"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33748297"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:00:28 -0700
X-CSE-ConnectionGUID: 4tZtzb1XR6ybZ7MgpORtdQ==
X-CSE-MsgGUID: KKH8pk18R0S3p6X/27crDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="87015283"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:00:21 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t 2/4] tests/intel/xe_exec_threads: remove redundant wait
Date: Wed, 30 Oct 2024 16:03:48 -0700
Message-Id: <20241030230350.1681757-3-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030230350.1681757-1-fei.yang@intel.com>
References: <20241030230350.1681757-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

The for-loop for REBIND case accidentally wait twice for the execs of
0x20*n interations. Copyi paste the code from INVALIDATE case which is
correct.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 tests/intel/xe_exec_threads.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 413d6626b..962957cd7 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -340,7 +340,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		xe_exec(fd, &exec);
 
 		if (flags & REBIND && i && !(i & 0x1f)) {
-			for (j = i - 0x20; j <= i; ++j)
+			for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
 				xe_wait_ufence(fd, &data[j].exec_sync,
 					       USER_FENCE_VALUE,
 					       exec_queues[e], fence_timeout);
-- 
2.25.1

