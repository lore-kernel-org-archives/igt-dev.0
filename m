Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332E91067042
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DB610EA3F;
	Thu, 12 Mar 2026 15:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAULFRC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7342310EA3E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773328313; x=1804864313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5c3Nfo8QTO/72/X0RgxLVia67uwXXGomhYkwr4O1m4M=;
 b=XAULFRC8HHT5SuUMNnDmiAdxMFJWbb+UTm/CtZf+z60uc0g/VU++Fgyt
 mueGMmkLSDiwUhuD2Q7KvCwQqYWlFdU1EDtMurIFg+G+hsDZOUSaiZsS6
 VwJYrX9XPLz2PhzMUtdxLK6F6eMAYiZe0KEZ5tbL4mFQ24RaesVnzfY1W
 ogdY5++9PSLri2FfmwgDITspptse5Us1jfKBNUGffj1mMbwRcmE/8WAHi
 Xoyfx1kklp+XRPanZ0gX5wf5jtA9gNBGbg3qRzNeZDAvw/rzdCRIpOMIf
 UzT9DPrmni2WdBB+NFvGs7SlL3wd49UxqmS4Ozwql1bs4AN4GF49xNuyS Q==;
X-CSE-ConnectionGUID: /1vM1rE4RAehdmPJXdQVFg==
X-CSE-MsgGUID: jhlcE5xrTX61QRQ7u3q55g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="61997652"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="61997652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:11:53 -0700
X-CSE-ConnectionGUID: ItuBVPTEQbaOOTRlX24j3w==
X-CSE-MsgGUID: ahx9ynhEQkCMCndtoioZ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="258772025"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:11:52 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 3/5] intel-ci: Add VGA chamelium exclusion to Xe blocklist
Date: Thu, 12 Mar 2026 20:38:59 +0530
Message-ID: <20260312150901.3272265-4-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260312150901.3272265-1-mohammed.bilal@intel.com>
References: <20260312150901.3272265-1-mohammed.bilal@intel.com>
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

Remove VGA-related subtests from the Xe chamelium testlist as Xe
driver does not support VGA connector types.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index edc5039a9..80a0ee904 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -128,3 +128,7 @@ igt@xe_exec_compute_mode@non-blocking
 ##################################################################
 igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
 ##################################################################
+# Remove VGA-related subtests from the Xe chamelium testlist as Xe
+# driver does not support VGA connector types.
+##################################################################
+igt@kms_chamelium.*@.*vga.*
-- 
2.48.1

