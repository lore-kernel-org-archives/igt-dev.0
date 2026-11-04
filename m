Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B47606A326
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 00:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QexmoCtp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D1410F8E6;
	Wed,  4 Nov 2026 00:59:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C80810F8B3
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 00:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753720; x=1825289720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IImfQxLjsFQ2ynjBDuilvwqIATbj38NrIVQ4w4+AgD8=;
 b=QexmoCtpKXTmwGYqTsM8UYjkQxPq4ONHuxKacen5srspc97S6dYmEtyN
 BcucU7y3IJ+pD7mmv/hS8GaAUFUzFwznoKMNEZ0rqbtIoG93Bs6bEeG7h
 7uVwH8SpNtQ0ADknmRLqLfsv9hqUzBq4jIkk3AedXv/Zd8wKQRGMTaYOj
 npbmj0BLpe3GUEBrJVfrV/WEAknocXv+AVUmO92OgFvnfvzaxvnfcBPdK
 RcmsdzBsojFICU33i6yTpFxOUcC3QCiNYxVw4JTdQWDDSM7CBI0FUO0GE
 w9uUi2Hr5ckK16n9uiZEAmLZwuqnJVmO26lpbqUNpGFtcQfYOdnGrLuHI w==;
X-CSE-ConnectionGUID: IRMvigZrSi2BE5JhUZ8esw==
X-CSE-MsgGUID: s2L8+LkzTAe7i9i8z9edYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2506019"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2506019"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:09 -0800
X-CSE-ConnectionGUID: 9OxNzLhRSO2p5TMvDcJCmQ==
X-CSE-MsgGUID: 39LKCrTJRiC77NiikicNNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6421549"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v2 5/8] tests/intel/xe_oa: Check vm_ops->access on OA buffer
 mmaps across unbind
Date: Tue,  3 Nov 2026 16:55:11 -0800
Message-ID: <20261104005505.3232485-15-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
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

The OA buffer mapping is VM_PFNMAP, so reading it through
/proc/self/mem goes through the vm_ops->access() of the mapping. Check
that this works before unbind and fails with EIO after, since access is
refused once the device is unplugged.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index e4b63c982200..8474d506612b 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2831,6 +2831,26 @@ static void probe_stream_after_removal(int fd, const char *when)
 	igt_assert_eq(err, ENODEV);
 }
 
+/*
+ * Read through /proc/self/mem. The OA buffer mapping is VM_PFNMAP, so this goes through
+ * the vm_ops->access() of the mapping rather than through its page tables.
+ */
+static ssize_t read_proc_self_mem(const void *vaddr, void *buf, size_t len)
+{
+	ssize_t ret;
+	int fd, err;
+
+	fd = open("/proc/self/mem", O_RDONLY);
+	igt_assert_lte(0, fd);
+
+	ret = pread(fd, buf, len, (off_t)(uintptr_t)vaddr);
+	err = errno;
+	close(fd);
+	errno = err;
+
+	return ret;
+}
+
 static bool mem_is_zero(const void *vaddr, size_t len)
 {
 	const uint8_t *p = vaddr;
@@ -2868,6 +2888,7 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	struct drm_xe_oa_stream_info info = {};
+	uint32_t val;
 	int n = 0;
 
 	s->oa_unit_id = oau->oa_unit_id;
@@ -2899,6 +2920,9 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
 
 	/* Fault in the mapping while the device is still bound */
 	(void)READ_ONCE(*(const volatile uint32_t *)s->vaddr);
+
+	/* vm_ops->access() works on the mapping while the device is bound */
+	igt_assert_eq(read_proc_self_mem(s->vaddr, &val, sizeof(val)), sizeof(val));
 }
 
 static void unbind_stream_close(struct unbind_stream *s)
@@ -2931,6 +2955,8 @@ static void unbind_stream_check_live(struct unbind_stream *s)
 static void unbind_stream_check_dead(struct unbind_stream *s, const char *when)
 {
 	size_t page_size = sysconf(_SC_PAGESIZE);
+	uint32_t val;
+	ssize_t ret;
 	void *vaddr;
 
 	igt_debug("[%s] checking stream on oa unit %d\n", when, s->oa_unit_id);
@@ -2944,6 +2970,13 @@ static void unbind_stream_check_dead(struct unbind_stream *s, const char *when)
 	igt_assert(mem_is_zero(s->vaddr, page_size));
 	igt_assert(mem_is_zero((uint8_t *)s->vaddr + s->size - page_size, page_size));
 
+	/* vm_ops->access() on the mapping is refused once the device is gone */
+	ret = read_proc_self_mem(s->vaddr, &val, sizeof(val));
+	igt_debug("[%s] /proc/self/mem read: ret=%zd errno=%s\n", when, ret,
+		  ret < 0 ? strerror(errno) : "-");
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(errno, EIO);
+
 	/* New mappings are refused */
 	vaddr = mmap(NULL, s->size, PROT_READ, MAP_PRIVATE, s->fd, 0);
 	igt_assert(vaddr == MAP_FAILED);
@@ -2986,8 +3019,9 @@ static void unbind_rebind_recover(void)
 /**
  * SUBTEST: unbind-rebind-stream
  * Description: Open OA streams with mmapped OA buffers and test the effects of unbind
- *		and rebind: streams die, mmaps read a zeroed dummy page, no new streams can
- *		be opened on the removed device and the device works after rebind.
+ *		and rebind: streams die, mmaps read a zeroed dummy page and refuse access
+ *		through /proc/self/mem, no new streams can be opened on the removed device
+ *		and the device works after rebind.
  */
 static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int flags)
 {
-- 
2.55.0

