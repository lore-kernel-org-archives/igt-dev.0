Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584E8C5479F
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 11:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B467410E6BE;
	Thu, 22 Feb 2024 11:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHa3p+Z7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4446410E6BE
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708602468; x=1740138468;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=02Bl49+GDI8Str8fQdZX+maN5SbkrrXefqnlzMGm6D0=;
 b=KHa3p+Z75WaHINs0xvBHRPdNHwxRS9vsFQcwuYDZL/KAhlJG2DK3ceIU
 +JG1k22LWLEyY7oowIy0yux1EcQMhad5rSEqXSmpE05m6CGOpMu3UyUIF
 Lg5Ewgvd0QFCJUKg9J7QwZtmxHT95ckF/JAYvyWwLP/T/rZ/kS7oBSB4B
 Lls+n+6dHe2r3+bNSIaVCQENujJZnOEQ0s/9+UZfSYe3iajGtoFQ6rQHm
 wgW/bu977nPx+45WPKdbLSwHSWaqW/d53fYDuJfwYXm9uIBpJkw3FLh+w
 XQXEP03/TV1XQUrDU9HXiGQqTg9lzaPmrI0w7lnZ4lp9ZhifwDTmrJcqA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2960909"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2960909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:47:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5415655"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:47:48 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 373EB580DB2
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 03:47:47 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rd7YH-00000000p2s-14xR for igt-dev@lists.freedesktop.org;
 Thu, 22 Feb 2024 12:47:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 2/4] scripts/igt_doc.py: ignore "all" when producing
 testlists
Date: Thu, 22 Feb 2024 12:45:26 +0100
Message-ID: <20240222114741.196042-3-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222114741.196042-1-mauro.chehab@linux.intel.com>
References: <20240222114741.196042-1-mauro.chehab@linux.intel.com>
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

The meaning of "all" is an special case for blocklists, meant to be
used only when some block lists are to be applied everywhere. It is
not a testlist itself.

So, exclude it as a different kind of GPU, as the default case is
already covered.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 7404e3d0934c..7985cdd5ac5e 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -229,6 +229,10 @@ class IntelciTestlist:
             for gpu, names in gpus.items():
                 gpu = re.sub(r"[\W_]+", "-", gpu).lower()
 
+                # "all" is used used only as a default value for unlisted GPUs
+                if gpu == "all":
+                    continue
+
                 dname = os.path.join(driver_path, gpu)
                 try:
                     os.makedirs(dname)
-- 
2.43.2

