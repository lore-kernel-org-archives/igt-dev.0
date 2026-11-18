Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81816606A320
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 23:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mwvHCMRP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A85210E47C;
	Wed, 18 Nov 2026 23:45:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B1A10E47C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 23:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795045439; x=1826581439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jB1m2vKvNus289OZ8O2nH/rCD9DGEuKETvD19l6qI14=;
 b=mwvHCMRPMTV4rGDyHGB+0YiviSAfuvPx2IcrzBNsuxSGUiITdDMEUsMq
 /VUUerQSOE/S5bSH22Ta7qZoWsN1U3ELbVJfpfF6OEPk2rV9KPKGU8iVN
 PtZbbibeGjpd6Vxom5c4bElDAaUF8PfkobuUmbRp9y1yo0HVAyAP+JXgs
 r9PDPMDKSrA8qRSAltm/5+FArjiRBGcbfTHHylx5rKoc+yygc80YrWdhn
 JiieeRmC8KdPqoU1MLxrHDLA0Ov58oLQD2t0AlN9/d6FNySgIPtgvatwS
 yc4tNfT17PIIOEMxosSS7AF8oaSSnWnc+aCLpUfNgFS5edVXjTsLJP6iu A==;
X-CSE-ConnectionGUID: Zw7I4g/RRrSvT5UIIIPm+w==
X-CSE-MsgGUID: BC7sFA/tRyODNzCrukPIYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3764916"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3764916"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 15:43:58 -0800
X-CSE-ConnectionGUID: U49rZSobQsWDUrGerTtCrA==
X-CSE-MsgGUID: G3rWDvsTTPuTt58D8gVAEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10611251"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2026 15:43:58 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, shuicheng.lin@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH] lib/intel_batchbuffer: Destroy exec queue owned by intel_bb
Date: Wed, 18 Nov 2026 15:43:56 -0800
Message-ID: <20261118234356.342335-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Xe intel_bb creates an exec queue lazily at first submission (and
re-creates it on engine/gt change), but only the previous queue was
destroyed on a switch. The last queue was never destroyed by
intel_bb_destroy(), so it stayed alive until the drm fd was closed.

Since the queue holds a reference to the VM and its LRC/BOs, the whole
VM/LRC/GGTT teardown, including the GuC deregistrations and TLB
invalidations, was deferred to fd close and executed as a burst after
the test finished. For tests that create a lot of intel_bb (e.g.
xe_pat@pat-index-auto) this kept the GT out of C6 for more than a
second after the test, making a following xe_pm_residency@idle-residency
fail intermittently.

ibb->engine_id is only ever assigned by intel_bb itself, a user supplied
ctx is never stored there, so destroy it unconditionally (when set)
before destroying the VM. i915 never sets it and is unaffected.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 lib/intel_batchbuffer.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 1dacfdc6c..05e6eaf35 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1368,6 +1368,17 @@ void intel_bb_destroy(struct intel_bb *ibb)
 		close(ibb->fence);
 	if (ibb->engine_syncobj)
 		syncobj_destroy(ibb->fd, ibb->engine_syncobj);
+	/*
+	 * ibb->engine_id is only set when intel_bb created the exec queue
+	 * itself (a user supplied ctx is never stored there). Destroy it
+	 * together with the batch, otherwise the queue (and the VM and LRC
+	 * it references) stay alive until the fd is closed and are torn down
+	 * in a burst, keeping the GT busy for seconds after the test.
+	 */
+	if (ibb->engine_id) {
+		xe_exec_queue_destroy(ibb->fd, ibb->engine_id);
+		ibb->engine_id = 0;
+	}
 	if (ibb->vm_id && !ibb->ctx)
 		xe_vm_destroy(ibb->fd, ibb->vm_id);
 
-- 
2.43.0

