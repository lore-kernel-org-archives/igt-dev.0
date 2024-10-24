Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6466CE8E68
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 12:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F1710E90B;
	Thu, 24 Oct 2024 12:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDU0bsig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294EC10E90B
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 12:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729771753; x=1761307753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OC9QbK+1OWSvnT23+/DWIdzDF+xvS43pSzuSXk39ltc=;
 b=CDU0bsigQI7A4jd041UOtuX8Ft/SIQGft4WhBLpcZZ/q/cQil8A2ttyK
 YA6ar2wQ3i1YpMJLcpX10ot7DUCDd/p+SQBeTw0bz5sSO69P9rclrjl/O
 qktMfVTCPV7SYTSCPlzOVh/so7WLa3r2Mbsc5WRkRvdIKnt+UIpKuAkBA
 Yd3leFfib0AXBRADorPGcSeEuKTuYaiWOBMscjzJhQRw4fFGpAsS4aUg1
 +Ci2chpK33S7QbSn4IWQEV2nPVziRpw9HGbxVoxwFv1qnuK5jFF6FdD9z
 i5+8S8wfYyKozWML+rgKMSxI5RXN4ivb1VHShfqSCUtCnxVmAumGOqPU6 Q==;
X-CSE-ConnectionGUID: MxHudeWBQYqDFGpt91xtKQ==
X-CSE-MsgGUID: 171DiIFUSbqrOw8RrpNwAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="39985009"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="39985009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 05:09:13 -0700
X-CSE-ConnectionGUID: APYCPjUFRAiqdbP4cp+wog==
X-CSE-MsgGUID: h+ldqWBgQyakGxlAQ4kTMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="80495752"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 05:09:10 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v2 2/2] /tests/intel/xe_eudebug_online: Remove
 vm_open_trigger on debugger reattachment.
Date: Thu, 24 Oct 2024 12:08:51 +0000
Message-Id: <20241024120851.328536-2-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024120851.328536-1-jan.sokolowski@intel.com>
References: <20241024120851.328536-1-jan.sokolowski@intel.com>
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

On debugger detach-and-reattach, discovery worker will replay events
that have occurred, which leads to a vm event being sent and
vm_open_trigger being re-run, which would lead to us trying
to open a removed vm.

On debugger reattach trigger, remove vm open trigger from list of
triggers.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Dominik Grzegorzk <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 01ccf45eb..0ef0d8093 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1785,6 +1785,12 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
 	d->fd = ret;
 	d->target_pid = c_pid;
 
+	/* Discovery worker will replay events that have occurred, which leads to
+	 * a vm event being sent and vm_open_trigger being re-run, which would lead
+	 * to us trying to open a removed vm. Thus, remove this trigger from list.
+	 */
+	xe_eudebug_debugger_remove_trigger(d, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+
 	/* Let the discovery worker discover resources */
 	sleep(2);
 
-- 
2.34.1

