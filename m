Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCE6C52D6D
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 03:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE3F10E2FB;
	Wed, 31 Jul 2024 03:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRedBI1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB9F10E28B
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 03:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722396930; x=1753932930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2TftzsguoKuRvOnvI/umwLUQ9Nc2tH/iI3tjEALJWOQ=;
 b=NRedBI1pnULuHQ7PREsQWaatVwN9YhU/naFLBA0MU70vqF2emyGv3gTw
 XmDE/jsgN+VOzJrTcwEu1ZTBE2x5q0CYGP7p2MxJPcf8r6AzoTmOmBn5P
 B6k4m8uVuZDABhklPVASpWnnE9oNpy/590M4WHEgLE+IkkmLNKS4XNiRe
 awFb1TuikR7ajYBciNxkTfuquSc4xM+RbZBAuoRx4XSyojay5Do+Y1X0E
 3r/ZhfogCwDtu4LBz5fBk5NZ8BgRS5Uv1+j6grSRKMF2JyQYmUwpnmvyO
 anfIhk/C2FVszHoVviFaVMNylnNWTfiwmRsj2JCRtOPLtgXCT6f41Me1c Q==;
X-CSE-ConnectionGUID: QUp+senjSASa5P+1CsG5VQ==
X-CSE-MsgGUID: AfS3B/UAQz27jmh0gv2WTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30917875"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="30917875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 20:35:27 -0700
X-CSE-ConnectionGUID: y8y97K3sSQWC3Co0y7tH1Q==
X-CSE-MsgGUID: LsB0eAwQT/aepPG0JJoSzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="54538337"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 20:35:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/3] lib/xe_spin: Fix xe_spin_wait_started()
Date: Tue, 30 Jul 2024 20:35:03 -0700
Message-ID: <20240731033504.1426640-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731033504.1426640-1-lucas.demarchi@intel.com>
References: <20240731033504.1426640-1-lucas.demarchi@intel.com>
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

Use READ_ONCE() to guarantee we are actually reading the memory written
by the GPU and compiler can't optimize it away.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_spin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 3adacc3a8..43a7a43c2 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -166,7 +166,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
  */
 bool xe_spin_started(struct xe_spin *spin)
 {
-	return spin->start != 0;
+	return READ_ONCE(spin->start) != 0;
 }
 
 /**
-- 
2.43.0

