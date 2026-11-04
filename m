Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1ED606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 00:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MpjktiBQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4B110E335;
	Wed,  4 Nov 2026 00:57:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A51810E4C7
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 00:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753720; x=1825289720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x8pWFFkkbY41bIP0lkrVlLkXjGLj51h4E9ubpQKk3Dc=;
 b=MpjktiBQX6MAz6ZE2FFdt3qnVpKPjO/iUYBLrarQAJdT+ZsRkWbgLn58
 7xNmTE5x9+uruEYQmlmr3NYfi/n2kGQDpG7WI8dRw4HLLplw/G04uzjnv
 s0n6M7h8bQJ5rq1WllOtKkZdx9XZA0QrpPEtB86Mlu7Ew4vlnIymLmpDq
 kOEQNlEC3zD+X4K1PBGa+Hg68O29woE6CVLXYVTK2JJsubiIykeeyyb5B
 zwCw3Q/OfnUvIGifPltgwBV5w1fQUcY7EueKm86v/SbEIePknWYGzvWRO
 9ffJ1/DyjJf93Tqb0YAeN6d0fQ4+LYiZDCW5ykBiNcB2pyN2RgDWu9GBV A==;
X-CSE-ConnectionGUID: OgeeALJaRQukUXuJcvX+mA==
X-CSE-MsgGUID: wj10BuD9Q12Hi0Sq/fDjWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2506018"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2506018"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:09 -0800
X-CSE-ConnectionGUID: 5Rwrz8MAQj6u7VRmTtrqvQ==
X-CSE-MsgGUID: DWqnVssfR5++bau21zv1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6421546"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v2 4/8] tests/intel/xe_oa: Check OA buffer mmaps across unbind
Date: Tue,  3 Nov 2026 16:55:10 -0800
Message-ID: <20261104005505.3232485-14-umesh.nerlige.ramappa@intel.com>
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

mmap the OA buffer before unbind. Unbind zaps the mapping and refaults
get a zeroed dummy page, so check that the mapping reads zeros
afterwards, after making sure it held OA reports before. Also check
that new mmaps of the stream fd fail with ENODEV.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 55 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index e10b77bca1b2..e4b63c982200 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2831,6 +2831,18 @@ static void probe_stream_after_removal(int fd, const char *when)
 	igt_assert_eq(err, ENODEV);
 }
 
+static bool mem_is_zero(const void *vaddr, size_t len)
+{
+	const uint8_t *p = vaddr;
+	size_t i;
+
+	for (i = 0; i < len; i++)
+		if (p[i])
+			return false;
+
+	return true;
+}
+
 #define UNBIND_CLOSE_BEFORE_REBIND	(1 << 0)
 
 #define UNBIND_MAX_STREAMS	16
@@ -2842,6 +2854,8 @@ struct unbind_stream {
 	struct intel_xe_oa_open_prop param;
 	size_t report_size;
 	int fd;
+	void *vaddr;
+	size_t size;
 };
 
 static char unbind_pci_slot[NAME_MAX];
@@ -2853,10 +2867,12 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
+	struct drm_xe_oa_stream_info info = {};
 	int n = 0;
 
 	s->oa_unit_id = oau->oa_unit_id;
 	s->fd = -1;
+	s->vaddr = NULL;
 	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_UNIT_ID;
 	s->properties[n++] = oau->oa_unit_id;
 	s->properties[n++] = DRM_XE_OA_PROPERTY_SAMPLE_OA;
@@ -2875,10 +2891,20 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
 
 	s->fd = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &s->param);
 	igt_assert_lte(0, s->fd);
+
+	do_ioctl(s->fd, DRM_XE_OBSERVATION_IOCTL_INFO, &info);
+	s->size = info.oa_buf_size;
+	s->vaddr = mmap(NULL, s->size, PROT_READ, MAP_PRIVATE, s->fd, 0);
+	igt_assert(s->vaddr != MAP_FAILED);
+
+	/* Fault in the mapping while the device is still bound */
+	(void)READ_ONCE(*(const volatile uint32_t *)s->vaddr);
 }
 
 static void unbind_stream_close(struct unbind_stream *s)
 {
+	igt_assert_eq(munmap(s->vaddr, s->size), 0);
+	s->vaddr = NULL;
 	close(s->fd);
 	s->fd = -1;
 }
@@ -2894,13 +2920,34 @@ static void unbind_stream_check_live(struct unbind_stream *s)
 	ret = read(s->fd, buf, sizeof(buf));
 	igt_debug("Pre-unbind read: ret=%d\n", ret);
 	igt_assert_lt(0, ret);
+
+	/*
+	 * Reports are written from the start of the OA buffer, so the mapping holds data
+	 * now. Makes the zeroed dummy page check after unbind meaningful.
+	 */
+	igt_assert(!mem_is_zero(s->vaddr, s->report_size));
 }
 
 static void unbind_stream_check_dead(struct unbind_stream *s, const char *when)
 {
+	size_t page_size = sysconf(_SC_PAGESIZE);
+	void *vaddr;
+
 	igt_debug("[%s] checking stream on oa unit %d\n", when, s->oa_unit_id);
 
 	probe_stream_after_removal(s->fd, when);
+
+	/*
+	 * Unbind zaps the existing mapping and refaults get a zeroed dummy page instead of
+	 * the OA buffer: check first and last page
+	 */
+	igt_assert(mem_is_zero(s->vaddr, page_size));
+	igt_assert(mem_is_zero((uint8_t *)s->vaddr + s->size - page_size, page_size));
+
+	/* New mappings are refused */
+	vaddr = mmap(NULL, s->size, PROT_READ, MAP_PRIVATE, s->fd, 0);
+	igt_assert(vaddr == MAP_FAILED);
+	igt_assert_eq(errno, ENODEV);
 }
 
 /*
@@ -2915,6 +2962,8 @@ static void unbind_rebind_recover(void)
 	for (i = 0; i < unbind_num_streams; i++) {
 		struct unbind_stream *s = &unbind_streams[i];
 
+		if (s->vaddr && s->vaddr != MAP_FAILED)
+			munmap(s->vaddr, s->size);
 		if (s->fd >= 0)
 			close(s->fd);
 	}
@@ -2936,9 +2985,9 @@ static void unbind_rebind_recover(void)
 
 /**
  * SUBTEST: unbind-rebind-stream
- * Description: Open an OA stream and test the effects of unbind and rebind: the stream
- *		dies, no new streams can be opened on the removed device and the device
- *		works after rebind.
+ * Description: Open OA streams with mmapped OA buffers and test the effects of unbind
+ *		and rebind: streams die, mmaps read a zeroed dummy page, no new streams can
+ *		be opened on the removed device and the device works after rebind.
  */
 static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int flags)
 {
-- 
2.55.0

