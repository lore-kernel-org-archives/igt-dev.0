Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0885C48BF8
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 07:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D0810E890;
	Thu, 22 Feb 2024 07:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHooUqEp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1061810E892
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 07:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708587733; x=1740123733;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=36Ip8XouB9q0EpiOePNg8btTSQcWmIgs/Co39jYmY0g=;
 b=kHooUqEp2iERaOcZeZgYCOMmzcj4icAMlUippCEzr9BkTABbUIGgKZcj
 bxCDnpZBtANVo1gFE1nmHqZtNf3YY9dsO+vznsSB6/LJbCl9oKq+5dUl9
 lAA7oIlLQzrXyRwFjgGgnie2s/rpM1XZ1ObPK3HZ8iqqouQjX3xZlCr7g
 CoqLLObQ2wZoh2TODlRxnmFrtgWPmSTAOcMoN308Y4EDIIyLUkbQFiO6s
 +PD2vgWk4D9bfVnZdBqetP5j53Yoa0jiWyIVFcICfxi4Ol6h2BN1wF8Ic
 5c2VyOwKNrTSRgWIo5lQVCdyAa88o7NqagX5JwsigNbWy6+36pqrOWSvr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2668105"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2668105"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5409912"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:42:12 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2DDAB580D54
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 23:42:12 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rd3ic-00000000j8e-196u for igt-dev@lists.freedesktop.org;
 Thu, 22 Feb 2024 08:42:10 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] Additional fixes for IntelCI testlist generation
Date: Thu, 22 Feb 2024 08:39:58 +0100
Message-ID: <20240222074208.173368-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Address 3 issues at testlist generation:
- trivial case of not naving gpus is not handled properly;
- the fixes for the most complex case were incomplete;
- don't consider "all" value (used for blocklists only) to be
  a gpu type.

Mauro Carvalho Chehab (3):
  scripts/igt_doc.py: fix intelci testlist generation for complex cases
  scripts/igt_doc.py: ignore "all" when producing testlists
  scripts/igt_doc.py: fix trivial case handling

 scripts/igt_doc.py | 59 +++++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 32 deletions(-)

-- 
2.43.2

