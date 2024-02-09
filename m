Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08861C48297
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 11:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856C810E988;
	Fri,  9 Feb 2024 11:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dScII9Vh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A5B10EBDA
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707477575; x=1739013575;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=1wplqa5gNvXwnuQ6hOH5G3h7o9C7Gd/ZRawPGgzaiXk=;
 b=dScII9VhAzVfEcqZTPcAc3tdH+Y2RKM7UHP//y9laHtF3zVXHJrhJhic
 mx5uU35J5oQ3DA0iWLIiQ5Oq31+m5JUESkr9Cmdf8Gp++mi2rVytNUnHa
 wtop0TewfSBs47N/fjQ6RQI4Kk4nagC53owE5PPiifWIM0y7omIjOEaMQ
 tW1DODesiVX8vNkUsDCjfF2sfloxicjUEXUbZepRUrvWQoMB+LmVL8s/K
 AlNAA/dZtI++xZn7i09eqwJ0B0hCfEKo14IJGswPD/6qex2SVEi1qZC8v
 BIia6N3kp4qrCeK3evdYylpNHVA4xQB1HL29ZYR3NIcrxfkbaxfy2AT1M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12785735"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="12785735"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:19:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6534180"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:19:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 77EE1580E0C
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 03:19:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYOum-000000018iu-1B44 for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 12:19:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/8] scripts/igt_doc.py: better handle issues with empty
 testlists
Date: Fri,  9 Feb 2024 12:17:00 +0100
Message-ID: <20240209111925.271717-3-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209111925.271717-1-mauro.chehab@linux.intel.com>
References: <20240209111925.271717-1-mauro.chehab@linux.intel.com>
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

