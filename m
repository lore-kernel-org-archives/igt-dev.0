Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75E0CAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 12:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F05110E905;
	Thu, 25 Sep 2025 12:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKUE86Fh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED3810E901
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 12:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758803892; x=1790339892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sqijkaq//nxrWFvjmAX+DIrFJ7rejiuQBzNmlJ45/sM=;
 b=OKUE86FhjM1KUXHH5PLRuwIjMEy/qemVklwDLLjGdW0V7aEWX5Pswj+/
 kR6lwYLoxdn54Ba7qIkjQo1Vx1AXds+x+vI4HCw9qhcfO06WY1jtAleSM
 ol1i0MYVi5a+ptMaGXqXppod55fxXMYIRA1x7RrpPVY8shM135B1kh+iH
 ievSua3uES0M5GvBCYy5dGHK6Sz7BZ7XkvHXW5ZU4Plp/jMbsl+CcF2OA
 BpAftInt3q+syOWPhp5CiHrREG6JyECZPFMYw4L1xNceWNwDxKAXmHDPu
 1wlZRXG4+46UXbM/FriccnhckuolLf1eblbyj63ugVa0Ii7jEILVfFMBY g==;
X-CSE-ConnectionGUID: OsZXrBCLSB6TxonmwzFpSw==
X-CSE-MsgGUID: DPuhq2g3ReOXwA8a/RDyvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61226516"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="61226516"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:38:11 -0700
X-CSE-ConnectionGUID: G9Kg1soDRRW2mk+JoCgYqg==
X-CSE-MsgGUID: VvHmB3thTcGtNRk/FAV2AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176894470"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.53])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:38:10 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v6 i-g-t 5/9] lib/xe_eudebug: Introduce variables for signal
 handling synchronization
Date: Thu, 25 Sep 2025 14:37:41 +0200
Message-Id: <20250925123745.15721-6-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925123745.15721-1-dominik.karol.piatkowski@intel.com>
References: <20250925123745.15721-1-dominik.karol.piatkowski@intel.com>
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

Introduce received_signal, received_sigint and handled_sigint variables
to help with coordination of handling SIGINT and other signals.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 3 +++
 lib/xe/xe_eudebug.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 3495354e3..512c81bf5 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1170,6 +1170,9 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
 	d->fd = -1;
 	d->master_fd = master_fd;
 	d->ptr = data;
+	d->received_signal = false;
+	d->received_sigint = false;
+	d->handled_sigint = false;
 
 	return d;
 }
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 389572ed0..4d658e11b 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -44,6 +44,10 @@ struct xe_eudebug_debugger {
 	pthread_t worker_thread;
 	enum xe_eudebug_debugger_worker_state worker_state;
 
+	bool received_signal;
+	bool received_sigint;
+	bool handled_sigint;
+
 	int p_client[2];
 };
 
-- 
2.34.1

