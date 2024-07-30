Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95B6C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA1510E517;
	Tue, 30 Jul 2024 11:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hu8wpMi4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A511D10E510
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340080; x=1753876080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tHniQgF7/1uIzpQKGgm9lz3V1mH63SiWNJ0GYd+656E=;
 b=hu8wpMi4PMqEt1kQT6YqIFCO8X3GvOBvTgqseU/fNnxNtKR1EWh6/Bjb
 i3P5tw7Pa2xJsOdQ2EGTX/vggWWnmkhutv8dmUhJg0nY23JzpJPmG3Ylt
 AZTKTsPGPDmx4MmYJ85YwdsntehArP9p/1t6kQP0ZFgP2jaPRR71nPSsj
 sV/heeD1zgvAUFG1kPls9b87teHGP+J6NcwzpjznQcdTdHlN0gE6K/td2
 12SuU1tFiPthOUVX52T6eqwWwSp0r1DqUODsG+EnfGa7i6iOfAsYseAmi
 fyKd7bNPX1ultyZWhbxgqCWUYcbKFh32wmix8PR6OPaLV5zuyNs+1v1WY g==;
X-CSE-ConnectionGUID: gdFXlgUhRmeOLJPyPUgOnA==
X-CSE-MsgGUID: JXKpszx1S/+or7/p6kuNVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937316"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937316"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:00 -0700
X-CSE-ConnectionGUID: 5mgaMSSCSHaMbgRiO30ZxQ==
X-CSE-MsgGUID: z18F4WRyRMekqZruJ8o8fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216828"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:57 -0700
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
Subject: [PATCH i-g-t v2 26/66] tests/xe_eudebug: Add
 basic-vm-access-parameters test
Date: Tue, 30 Jul 2024 13:44:43 +0200
Message-Id: <20240730114523.334156-27-christoph.manszewski@intel.com>
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

From: Pawel Sikora <pawel.sikora@intel.com>

This new test checks negative scenarios of VM_OPEN
ioctl and pread/pwrite usage.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 143 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index d4036ba05..ab856727e 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1168,6 +1168,146 @@ static void test_vm_access(int fd, unsigned int flags, int num_clients)
 					 false, XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP);
 }
 
+static void debugger_test_vma_parameters(struct xe_eudebug_debugger *d,
+					 uint64_t client_handle,
+					 uint64_t vm_handle,
+					 uint64_t va_start,
+					 uint64_t va_length)
+{
+	struct drm_xe_eudebug_vm_open vo = { 0, };
+	uint64_t *v;
+	uint64_t items = va_length / sizeof(uint64_t);
+	int fd;
+	int r, i;
+
+	v = malloc(va_length);
+	igt_assert(v);
+
+	/* Negative VM open - bad client handle */
+	vo.client_handle = client_handle + 123;
+	vo.vm_handle = vm_handle;
+	fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
+	igt_assert(fd < 0);
+
+	/* Negative VM open - bad vm handle */
+	vo.client_handle = client_handle;
+	vo.vm_handle = vm_handle + 123;
+	fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
+	igt_assert(fd < 0);
+
+	/* Positive VM open */
+	vo.client_handle = client_handle;
+	vo.vm_handle = vm_handle;
+	fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
+	igt_assert_lte(0, fd);
+
+	/* Negative pread - bad fd */
+	r = pread(fd + 123, v, va_length, va_start);
+	igt_assert(r < 0);
+
+	/* Negative pread - bad va_start */
+	r = pread(fd, v, va_length, 0);
+	igt_assert(r < 0);
+
+	/* Negative pread - bad va_start */
+	r = pread(fd, v, va_length, va_start - 1);
+	igt_assert(r < 0);
+
+	/* Positive pread - zero va_length */
+	r = pread(fd, v, 0, va_start);
+	igt_assert_eq(r, 0);
+
+	/* Negative pread - out of range */
+	r = pread(fd, v, va_length + 1, va_start);
+	igt_assert_eq(r, va_length);
+
+	/* Negative pread - bad va_start */
+	r = pread(fd, v, 1, va_start + va_length);
+	igt_assert(r < 0);
+
+	/* Positive pread - whole range */
+	r = pread(fd, v, va_length, va_start);
+	igt_assert_eq(r, va_length);
+
+	/* Positive pread */
+	r = pread(fd, v, 1, va_start + va_length - 1);
+	igt_assert_eq(r, 1);
+
+	for (i = 0; i < items; i++)
+		igt_assert_eq(v[i], va_start + i);
+
+	for (i = 0; i < items; i++)
+		v[i] = va_start + i + 1;
+
+	/* Negative pwrite - bad fd */
+	r = pwrite(fd + 123, v, va_length, va_start);
+	igt_assert(r < 0);
+
+	/* Negative pwrite - bad va_start */
+	r = pwrite(fd, v, va_length, -1);
+	igt_assert(r < 0);
+
+	/* Negative pwrite - zero va_start */
+	r = pwrite(fd, v, va_length, 0);
+	igt_assert(r < 0);
+
+	/* Negative pwrite - bad va_length */
+	r = pwrite(fd, v, va_length + 1, va_start);
+	igt_assert_eq(r, va_length);
+
+	/* Positive pwrite - zero va_length */
+	r = pwrite(fd, v, 0, va_start);
+	igt_assert_eq(r, 0);
+
+	/* Positive pwrite */
+	r = pwrite(fd, v, va_length, va_start);
+	igt_assert_eq(r, va_length);
+	fsync(fd);
+
+	close(fd);
+	free(v);
+}
+
+static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
+		       struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_vm_bind_op *eo = (void *)e;
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+		struct drm_xe_eudebug_event_vm_bind *eb;
+
+		igt_debug("vm bind op event received with ref %lld, addr 0x%llx, range 0x%llx\n",
+			  eo->vm_bind_ref_seqno,
+			  eo->addr,
+			  eo->range);
+
+		eb = (struct drm_xe_eudebug_event_vm_bind *)
+			xe_eudebug_event_log_find_seqno(d->log, eo->vm_bind_ref_seqno);
+		igt_assert(eb);
+
+		debugger_test_vma_parameters(d, eb->client_handle, eb->vm_handle,
+						   eo->addr, eo->range);
+		xe_eudebug_debugger_signal_stage(d, eo->addr);
+	}
+}
+
+/**
+ * SUBTEST: basic-vm-access-parameters
+ * Description:
+ *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage.
+ */
+static void test_vm_access_parameters(int fd, unsigned int flags, int num_clients)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	xe_for_each_engine(fd, hwe)
+		test_client_with_trigger(fd, flags, num_clients,
+					 vm_access_client,
+					 DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
+					 vm_trigger_access_parameters, hwe,
+					 false, XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP);
+}
+
 #define PAGE_SIZE 4096
 #define MDATA_SIZE (WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM * PAGE_SIZE)
 static void metadata_access_client(struct xe_eudebug_client *c)
@@ -1332,6 +1472,9 @@ igt_main
 	igt_subtest("basic-vm-access")
 		test_vm_access(fd, 0, 1);
 
+	igt_subtest("basic-vm-access-parameters")
+		test_vm_access_parameters(fd, 0, 1);
+
 	igt_subtest("multiple-sessions")
 		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4, true);
 
-- 
2.34.1

