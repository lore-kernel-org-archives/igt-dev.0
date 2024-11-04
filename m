Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91642D1BDF3
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 20:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0A110E0EC;
	Mon,  4 Nov 2024 20:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0xx9+yv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB75610E0EC
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 20:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730753532; x=1762289532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uJoqehi8zCZZcSczUU8i6SMncyS/fy0gtM5zIbAkiAk=;
 b=J0xx9+yvgI32fIIKDkrVO7nY9DdEh5+Bmot6/4sk2fFZKrKARyngaDIj
 klDzgU7pWMUqeExAGP47qZXqwoHqpI/PAqiqtaZib5x8qlIQoXphwBNVi
 C4R1iLeuYcIXiDVKTv/yltmF+AKqB9KAnlkDrEvKvJJaz/wEMp2VtQjej
 TWakXGRctx794LSJWYhcd0vWE1KSdFMt1FB0tahbcEIPtD2N7e1czqMMR
 WpqTjv7sLHAfikeco57eOjtXCxI50khbykUcjra7Zyh8uFIWNS6U1qAO5
 uHKCeW0NqhkADRqujiOTrjTeIxI0Dgb5PZ8E3wlE53dmoTqSlExNryxxP g==;
X-CSE-ConnectionGUID: fJNN4Z/VTtqJ50NeZG8n+A==
X-CSE-MsgGUID: vxAuy+BtTLCzlvZc9bcyXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30583545"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="30583545"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 12:52:12 -0800
X-CSE-ConnectionGUID: XLDVZ9xbRaaNtuaYvFBLyQ==
X-CSE-MsgGUID: /EJc+ZRyQCOr0dtfb/jMrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="88345614"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 12:52:10 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH i-g-t v2 1/2] i915/perf: Fix invalid escape warnings
Date: Mon,  4 Nov 2024 12:51:59 -0800
Message-ID: <20241104205201.175541-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.47.0
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

Fix this warnings:
SyntaxWarning: invalid escape sequence '\

A similar change was done in the Xe KMD script in commit
287917575616 ("xe/oa: Fix invalid escape warnings").

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 lib/i915/perf-configs/mdapi-xml-convert.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index ba0b7ba473..db093b60f6 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -222,7 +222,7 @@ counter_blacklist = {
 
 def underscore(name):
     s = re.sub('MHz', 'Mhz', name)
-    s = re.sub('\.', '_', s)
+    s = re.sub(r'\.', '_', s)
     s = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', s)
     s = re.sub('#', '_', s)
     return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s).lower()
-- 
2.47.0

