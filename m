Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A5EC54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 08:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A5410E686;
	Mon, 25 Mar 2024 08:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enMOpB9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CD510E686
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 08:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711355481; x=1742891481;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iRt0zTilSDTGnMfFvE7L3R8H58AU//8er8Ixn7jigKA=;
 b=enMOpB9WXuJ0pzJBrJiFb2AzkW7vvR77RDPFUn8Z/Elo8sowewXevGEB
 xMS7Ma8smdWl/rcpduSkgliZAgXZ2vWiDz+DYswr7bXgKd9sh6fpGBxdo
 6e3dcCz2SPj6QtdjZ6gf8RkIC6wBbf3c+Rmush6EvOygufGs36n501xtY
 jU4E/+4smAWJ6elrt9NKTA+wT/lmCYu9RUjQXED4XKrxv2nI4euoM7FAD
 OYB1PTyoa0OHYy2wADdDnHckFj59U/ml0k96dWUcK9u2gadPl2QrDExsr
 qZY2mCkUBJ3AWWtb3v41iOTDCU8XzG60/46hNQI/4Fs3Hqn34FWVJfwHX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17776088"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="17776088"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 01:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="15948471"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 01:31:19 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] meson: Turn on few warns
Date: Mon, 25 Mar 2024 13:54:22 +0530
Message-ID: <20240325082422.691115-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

dangling-pointer:
    Warn usage of pointers to objects after their lifetime has ended.
int-conversion:
    Warn about incompatible integer to pointer and pointer to
    integer conversions.
unused-variable:
    Warn whenever a local or static variable is unused aside from its
    declaration.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meson.build b/meson.build
index cee8a7446..df062abc3 100644
--- a/meson.build
+++ b/meson.build
@@ -57,8 +57,10 @@ cc_args = [
 
 	'-Werror=address',
 	'-Werror=array-bounds',
+	'-Werror=dangling-pointer',
 	'-Werror=implicit',
 	'-Werror=init-self',
+	'-Werror=int-conversion',
 	'-Werror=int-to-pointer-cast',
 	'-Werror=main',
 	'-Werror=missing-braces',
@@ -67,6 +69,7 @@ cc_args = [
 	'-Werror=return-type',
 	'-Werror=sequence-point',
 	'-Werror=trigraphs',
+	'-Werror=unused-variable',
 	'-Werror=write-strings',
 # Disable the memory allocating builtins as they may cause unexpected behavior
 # with our framework. They *may* get optimized out in favor of a register or
-- 
2.43.2

