Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7C5C3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1341910E513;
	Tue, 30 Jul 2024 11:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzM53XMo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CB110E513
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340032; x=1753876032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C/Me8GJZvL0xgvBpTIGhQLSFZKAlJpuB7wCa9C7n9eQ=;
 b=MzM53XMonWMyk0DoUpL824n4CGRU54iQpu6bVPyV4qsXnoNtoVoP38/H
 nkqtit7IJ4shMKAnTNBjdA+cOwcdLUp9S5HhR/Q/IY7B4jilFtdZxg9Uf
 mfYg8i0YXgnO4aFuAVu9afXCNvqytqM8sKAeKUAaPDuZfXpoSl8zujNpv
 hMhJ4VfvEkouCszJN1bke4jIEey3WGzW9tyMVrX2v6KX0FGRPN/6rr/ew
 5MNgwmxPh6Xn5DZrj7Z7NlUVQTu89A1ue5LgyN1JmlugkEEoaAgTai9Yv
 OIVKHOpmFchnsvbSJhqcrUyA/gI1b0vV4n/YG8bdKAYoC/TmF/T06aDqN Q==;
X-CSE-ConnectionGUID: 8q6bL703T0SqVKo5U6/u0g==
X-CSE-MsgGUID: ninr5iptT5mGmKWv2m1GxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937182"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937182"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:12 -0700
X-CSE-ConnectionGUID: hFeVYdRsQMWKL+4Fd5iQgQ==
X-CSE-MsgGUID: mIJ4sH/cQmGiy2T3zqPzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216546"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:09 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 10/66] lib/xe_eudebug: Add support for user fence
 acking
Date: Tue, 30 Jul 2024 13:44:27 +0200
Message-Id: <20240730114523.334156-11-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

If the debugee uses user fences for synchronization, the debugger will
recieve a 'UFENCE_EVENT' and the fence won't be released untill the
debugger acks it. Note that for the fence to release, both the job
completion and debugger ack are required. Add a library function
to ack user fences.

Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 14 ++++++++++++++
 lib/xe/xe_eudebug.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 8164a2d50..af7cc5fc4 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -2037,3 +2037,17 @@ void xe_eudebug_client_metadata_destroy(struct xe_eudebug_client *c, int fd,
 
 	metadata_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, id, type, len);
 }
+
+void xe_eudebug_ack_ufence(int debugfd,
+			   const struct drm_xe_eudebug_event_vm_bind_ufence *f)
+{
+	struct drm_xe_eudebug_ack_event ack = { 0, };
+	char event_str[XE_EUDEBUG_EVENT_STRING_MAX_LEN];
+
+	ack.type = f->base.type;
+	ack.seqno = f->base.seqno;
+
+	xe_eudebug_event_to_str((void *)f, event_str, XE_EUDEBUG_EVENT_STRING_MAX_LEN);
+	igt_debug("delivering ack for event: %s\n", event_str);
+	igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
+}
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 24336981f..ec75634f5 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -167,6 +167,8 @@ void xe_eudebug_client_vm_bind_op_metadata_event(struct xe_eudebug_client *c,
 						 uint64_t metadata_handle, uint64_t metadata_cookie);
 void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c, uint32_t event_flags,
 					    uint64_t ref_seqno);
+void xe_eudebug_ack_ufence(int debugfd,
+			   const struct drm_xe_eudebug_event_vm_bind_ufence *f);
 
 void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd, uint32_t vm,
 				     uint32_t bo, uint64_t offset,
-- 
2.34.1

