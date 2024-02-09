Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B898C48297
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 12:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFB110F390;
	Fri,  9 Feb 2024 12:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7HNlwxa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8C610F390
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707482149; x=1739018149;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=1wplqa5gNvXwnuQ6hOH5G3h7o9C7Gd/ZRawPGgzaiXk=;
 b=i7HNlwxa5dLj85n1Zmk+Va11mGEP1/6tulgO3/ecPAo7wiYE7XlZSEZM
 FDesdzsL7C7ooXJWalXqoVaFdON0IzLygUQrsjuV9AgDEk+jRmrhsvLor
 0kSwWTL3zlZxQ7emO7XdlrRMTTr+nn5WaqGaEakejYgfQshUi7e6KEgvY
 9Fmyf8XjJ6gK7s0mVqQWmzcCpzDHm+kydI/nv7ozqHu4ztP3HgpudWhHb
 osma0qGksNceCuysYfhJwMYPvVOJrTw+aKG1JGrJlIMqlWzA73ytXFsb+
 lDAe7emXIt98cbZUYpirNoDZbUdDQYYRpUcQwYsZZg88yciV+q0MBnrUf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1554272"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1554272"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="39363244"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:48 -0800
Received: from linux.intel.com (unknown [10.245.246.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 213F3580DE9
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 04:35:47 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYQ6b-00000001DG3-0HS7 for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 13:35:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 2/8] scripts/igt_doc.py: better handle issues with
 empty testlists
Date: Fri,  9 Feb 2024 13:34:41 +0100
Message-ID: <20240209123543.289204-3-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
References: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The warning message of not creating an empty testlist is
harmless, and it should only be used when not all GPUs
are listed. So, change the logic to better check for "other"
testlists before printing a message.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 6a1cfc2b5a56..a6cbeee067fe 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -218,16 +218,14 @@ class IntelciTestlist:
 
                 for testlist, subtests in names.items():
                     if testlist == "":
-                        if not subtests:
-                            continue
-
                         testlist = "other"
                     else:
                         testlist = re.sub(r"[\W_]+", "-", testlist).lower()
                         testlist = re.sub(r"_+", "_", testlist)
 
                     if not subtests:
-                        sys.stderr.write(f"Warning: empty testlist: {testlist}\n")
+                        if testlist != "other":
+                            sys.stderr.write(f"Not creating empty testlist: {dname}/{testlist}\n")
                         continue
 
                     fname = os.path.join(dname, testlist) + ".testlist"
-- 
2.43.0

