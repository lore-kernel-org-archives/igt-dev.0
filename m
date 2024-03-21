Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4181C6FD1F
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 18:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE3B10FE19;
	Thu, 21 Mar 2024 18:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvdDXZh1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4709510FEDC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 18:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711046733; x=1742582733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S0j/NZFyUzrpSmd+y8SDzV3cmf3u8eDPrIdWlOnT3ro=;
 b=mvdDXZh1xEntY+CdR/EeZikdpksTv55KW0sBqOzwAn95TzOjxMKi6W8s
 m7z915keqC6SwyIF1Pl1qbZjg8UC9FJXmh8J5sqfssEP8VtNC2HmPfNr7
 pfzr7xRhfgCLYP1thke1yYYrw7JAXa8Y36uAtfOGiYPhj4qNSsIBWNcBl
 +FKC/q379bRCKjA4rtlCLTid1dH7gcjL02GkqnxtG9lF7lcfjgEH/yG2u
 /n/3iFt6rrcRnOUY8hd+TXLkzpPPaTh5lZd5VrhyZQfC3zeyhclmuOvvK
 uAiTPHmcC7xByVVVqVYHCxSeO9lKvTh60YB6nqm9JUsmGclRC187oBYpt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9824094"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="9824094"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 11:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19331122"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 11:45:33 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 chris.p.wilson@linux.intel.com, yu.bruce.chang@intel.com
Subject: [PATCH i-g-t] i915/gem_exec_whisper: Limit workload
Date: Thu, 21 Mar 2024 11:30:05 -0700
Message-Id: <20240321183005.2130924-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Chris Wilson <chris.p.wilson@linux.intel.com>

For large machines with lots of cpus and many engines, using a workload
that tries to use every engine from every cpu causes massive
oversaturation. The goal of the test workload is to cause saturation on
both engines and cpus so that we apply some pressure on the scheduler to
maintain order, but to do so we only need to ensure each scheduling
queue is saturated and there is sufficient pressure for the CPU
scheduler to push work across cores. We can impose a limit on the number
of threads such that we ensure that every engine and every core should
be occupied. Furthermore we can scale the amount of work submitted by
each thread to keep the total amount of work under a reasonable time
bound.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
CC: Bruce Chang <yu.bruce.chang@intel.com>
---
 tests/intel/gem_exec_whisper.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index effb473350..429dfc00d5 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -294,6 +294,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	struct drm_i915_gem_exec_object2 batches[QLEN];
 	struct drm_i915_gem_relocation_entry inter[QLEN];
 	struct drm_i915_gem_relocation_entry reloc;
@@ -306,18 +307,19 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 	int fds[64];
 	intel_ctx_cfg_t local_cfg;
 	const intel_ctx_t *contexts[64];
-	unsigned nengine;
 	uint32_t batch[16];
 	unsigned int relocations = 0;
 	unsigned int reloc_migrations = 0;
 	unsigned int reloc_interruptions = 0;
 	unsigned int eb_migrations = 0;
 	struct power_sample sample[2];
+	unsigned int nengine;
+	unsigned int nchild;
+	unsigned int qlen;
 	struct igt_power gpu;
 	uint64_t old_offset;
 	int i, n, loc;
 	int debugfs;
-	int nchild;
 	bool has_relocs = gem_has_relocations(fd);
 
 	if (flags & PRIORITY) {
@@ -356,9 +358,13 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 
 	nchild = 1;
 	if (flags & FORKED)
-		nchild *= sysconf(_SC_NPROCESSORS_ONLN);
+		nchild *= ncpus;
 	if (flags & ALL)
 		nchild *= nengine;
+	nchild = min(nchild, 2 * max(ncpus, nengine));
+	qlen = max(2u, QLEN * nengine / (nchild + nengine - 1));
+	igt_info("Using nchild:%d (out of ncpus:%d and nengine:%d), with a qlen:%d\n",
+		 nchild, ncpus, nengine, qlen);
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_power_get_energy(&gpu, &sample[0]);
@@ -448,19 +454,19 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 		}
 
 		memset(batches, 0, sizeof(batches));
-		for (n = 0; n < QLEN; n++) {
+		for (n = 0; n < qlen; n++) {
 			batches[n].handle = gem_create(fd, 4096);
 			gem_write(fd, batches[n].handle, 0, &bbe, sizeof(bbe));
 		}
 		execbuf.buffers_ptr = to_user_pointer(batches);
-		execbuf.buffer_count = QLEN;
+		execbuf.buffer_count = qlen;
 		gem_execbuf(fd, &execbuf);
 
 		execbuf.buffers_ptr = to_user_pointer(tmp);
 		execbuf.buffer_count = 2;
 
 		old_offset = store.offset;
-		for (n = 0; n < QLEN; n++) {
+		for (n = 0; n < qlen; n++) {
 			if (gen >= 8) {
 				batch[1] = old_offset + loc;
 				batch[2] = (old_offset + loc) >> 32;
@@ -525,8 +531,8 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 					gem_sync(fd, tmp[0].handle);
 				scratch = tmp[0];
 
-				gem_write(fd, batches[QLEN-1].handle, loc, &pass, sizeof(pass));
-				for (n = QLEN; --n >= 1; ) {
+				gem_write(fd, batches[qlen-1].handle, loc, &pass, sizeof(pass));
+				for (n = qlen; --n >= 1; ) {
 					uint32_t handle[2] = {};
 					int this_fd = fd;
 
@@ -648,7 +654,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 				gem_vm_destroy(fd, local_cfg.vm);
 			}
 		}
-		for (n = 0; n < QLEN; n++)
+		for (n = 0; n < qlen; n++)
 			gem_close(fd, batches[n].handle);
 		if (flags & FDS) {
 			for (n = 0; n < 64; n++)
-- 
2.25.1

