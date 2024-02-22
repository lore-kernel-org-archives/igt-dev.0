Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA33EC5478C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 07:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A6110E892;
	Thu, 22 Feb 2024 07:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeLHdrTA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3232710E893
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 07:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708587733; x=1740123733;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=02Bl49+GDI8Str8fQdZX+maN5SbkrrXefqnlzMGm6D0=;
 b=CeLHdrTAzFU9RUqHqfVHYk+1Y/CFYN+WPw5PgK7uz+lflG8BRdl1cbBx
 973AeaVAVwsm+g3rKYKme9kns2Yi7RC6W5eIaks7zK9uOrTvycvsMBZfw
 oa89qv6ki/Jz+/9IJsx8rKHVGFouCBHSUW6Seg/mk6Wp6qHuTxNg3Ak+a
 k9NqP90tYx8LUhWrn2HBH18Bjpjm136B8oHGLfkdEt6lfzZ2/vsse93/p
 e9frpc04F3dIeFcdQ9N9A3F3j1bqBQolQMBp9/2HXZatgMopY0aRWemSa
 IkkMCHfCrjbougiE+yzsBS5hyj+N0bEBZdoF+dhKXeWK0IHfUbPBb6EAJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2668106"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2668106"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:42:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5409914"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:42:13 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5E6E6580E0C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 23:42:12 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rd3ic-00000000j8k-1Sxf for igt-dev@lists.freedesktop.org;
 Thu, 22 Feb 2024 08:42:10 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] scripts/igt_doc.py: ignore "all" when producing
 testlists
Date: Thu, 22 Feb 2024 08:40:00 +0100
Message-ID: <20240222074208.173368-3-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222074208.173368-1-mauro.chehab@linux.intel.com>
References: <20240222074208.173368-1-mauro.chehab@linux.intel.com>
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

