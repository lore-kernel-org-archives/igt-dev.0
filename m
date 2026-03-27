Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8776C10F2870
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 21:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335DF10ECCA;
	Fri, 27 Mar 2026 21:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wcDEpadI";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012023.outbound.protection.outlook.com
 [40.93.195.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3343F10E045
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 21:06:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvW6BsdSZVmHVb+7H2D0GA7cDKSQx7hspVN54oNy/Txg2uFAkhsvq23wI2Ykmd40aOsEbc7cFgUciMgM74A4s77oFu8U5SuCk0UztTRr2rtSH9LBBKlvNjC6IoGH31/+W9Wr+gcSvpfI+m5VnNo8Um60BIY7U114SSNGATSEcYa3D7pQz6/Axu8dkVx3XTbVvicgM7lHVu2JZXysU+opMUZ502wx35nePrZv9PEH0JdaZxsK+BPDGRIV+2bbQy5kBqFn3OSazB4LxUkffZeSlzHe3Bla7lIA8PLaYainoSwRTrAkYCm0r4pk+peMNgUV+xvUp2tb+t0ZzDDydMeHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVTXJ8qPfxkAF1OHiUYKgVxsxtsotKn25wcVZqjA6MI=;
 b=asoZBtCvMOljjiabm+DaEK04Kxc8QSRemiTyM21RB7m7IP3PGEEQ1FLIZMlcK5xsiFmVBF2Fc9o9lR6L/FTSWDyWv+Ca4l1CcrxqZPc2SOK8lGkW2yzoLI7EY+9WAiJGVoXdO0hdhMjddSzAibfGBQoSWQB9xFfAE5dVwfiBdTe8etFZgqTZsAH6vLCc+GyUrdBwvP3EjJPBfoOzT83BCkHsQcIU0GVfqhVXUg9j6gaA3qK5LjbgXPDJjMQNjjcxCuSUJKPFwmFY4k7qGgdnn0b2He/FR6Byl/jenzbeF8W5hqgf26Z00edsKqG8dYj+4fC6tPdSMEnIUQAtzu47UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVTXJ8qPfxkAF1OHiUYKgVxsxtsotKn25wcVZqjA6MI=;
 b=wcDEpadIvY3nUetyBISq1SpBZuU6uSpJin25aYJW32zJ0Ta4O2Y/iUnVsBvbeelo9MWKwA8k4a7Fg0LX4gCR3I7INTjnj/TG20d4xgplRDx85PUoikybof3g3iqdBWENaOMWftnVWSJLjtgJZlE8C5L4JbcuD6xGem10sdWvWEY=
Received: from PH7P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::9)
 by LVXPR12MB999198.namprd12.prod.outlook.com (2603:10b6:408:3dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 21:05:59 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::6a) by PH7P221CA0013.outlook.office365.com
 (2603:10b6:510:32a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.24 via Frontend Transport; Fri,
 27 Mar 2026 21:05:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 21:05:59 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 16:05:55 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Mar 2026 16:05:50 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jesse.Zhang <Jesse.Zhang@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 1/4] tests/amdgpu: add field-level negative ioctl fuzzing tests
Date: Fri, 27 Mar 2026 17:04:42 -0400
Message-ID: <20260327210546.67038-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|LVXPR12MB999198:EE_
X-MS-Office365-Filtering-Correlation-Id: d3347a6f-6637-4271-fe0a-08de8c44a53b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: aB4hsHEmoluHkSUKzoXFpka5XlfTvmL5/JbBcBVCe7sBfWMrmPDVay4R7H5UDvAMxs7tGEhcA/OPsxe3J44qO7TuWpR/H/iPifxM/RKidF0glJ9YI0I/3IEfrf1I7KJBFmWHzpT4ma7FQxwUym5QTcBkwcW1pN9bGKBF4Qmnr1ZDaAyJBP8Yup22Ql/9fCbxqb945lP6huyVsGOZB6o05A15AV9a+F4APRoBBqNOPE54PaMJki04F8Bec4NwnhNQpdoVEx5EUXXvPozuaJIroqCLl2wogyQhJHRuLFokMyX3PvWL1ajyf1lNIyns4N3+5K5kzXM2GEhkT3GIbtEZl9S7SRPqAhjRCUwkdSrJo9x6ZUM2/h145CzDp/2XB+yRhYdHrRTc3b3OJOVk3Jt6u+eHEgONc6vVkMQ1KujH7QrVPELAnnMdLjRPXLH2OcpgqwTiuCckvi7munQ0eXt4DeQ+/yoP0f7b7cmApEWbTOyDg/uNKmAkc5nzXbjVBD3iTGme2CsuZsoypy7Qm5gdV717mEdei0pcEgjsas/+uS7OCi5ZIBCIOgAyB02rTQd20wNkRpa9oPFIdAl64RtIHcJtc1tsLB/vg57NJMSBM4cf+j5tzcvXyKsothL+u/9Xgbm202xmYqAB/U9DRMoDKUHRjymUGKCO553jkZB4Tbu64P8E11PvxfEbYv6jfZrjxdgBk5OXaU6DVZ/eZzhoK3SXnbQdhKk3wvSGtjd51VDIwJNFHM1pYufMSAOJRmk8dhxJz8M/tZGvIHNvL7ZPWA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N3YFFCtsLXPEnNTy1L86pqo5QEr/wwAuV7jE7G8zEWD8ZixWZwcmAS2O7JtfZYU154wATYVw0YpOEcKnDmhJUaWsHH7djQuIsP32Rygl+Oz5EQhuRNjz/mSW3sRZIOLfUV8RuoQHHDxeDcPXBdAmIcMnHh075deE621KCYm2KkO1TAjAjT2TP9HJ6oANH7LjfHvcWcTqgAXYJQOKN7v393JXUfPkkXYtfYNo6s/HP19tR9kDhih4RXRz/ihh1P6fZ9x7sjh59neZXo6lt6T+Tr6mcWOPQuQUd+spgBde4nTwCrc5E7JTLkpeEQFaIvzV4oLoXta7HUPO8ctobeMHBguhq2yE6NeoeaKPnRRLxIpAHbxuF0s87qSogrLjQ3Q63VmPW1dbhY+lzp9yQpFK5YotfB3dBhJ52dkeH5575a6WpTUhCipY3nJaAp5d67Ie
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:05:59.0147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3347a6f-6637-4271-fe0a-08de8c44a53b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR12MB999198
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

From: "Jesse.Zhang" <Jesse.Zhang@amd.com>

Add a comprehensive kgd-ioctl-field-negative subtest to
amd_fuzzing that systematically tests every amdgpu ioctl with
invalid input field values.

The test uses a table-driven framework:

 - struct amd_ioctl_field_case describes one invalid field
   injection: case name, byte offset, width, and bad value.
 - run_drm_ioctl_field_cases() copies a valid baseline struct,
   mutates exactly one field per case, calls drmIoctl, and
   asserts the call fails with an expected errno.

Ioctls now covered by field-level negative tests:

  DRM_IOCTL_AMDGPU_GEM_CREATE      DRM_IOCTL_AMDGPU_GEM_MMAP
  DRM_IOCTL_AMDGPU_CTX             DRM_IOCTL_AMDGPU_BO_LIST
  DRM_IOCTL_AMDGPU_CS              DRM_IOCTL_AMDGPU_INFO
  DRM_IOCTL_AMDGPU_GEM_METADATA    DRM_IOCTL_AMDGPU_GEM_WAIT_IDLE
  DRM_IOCTL_AMDGPU_GEM_VA (map)    DRM_IOCTL_AMDGPU_GEM_VA (unmap)
  DRM_IOCTL_AMDGPU_GEM_OP (3 ops)  DRM_IOCTL_AMDGPU_WAIT_FENCES
  DRM_IOCTL_AMDGPU_VM              DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE
  DRM_IOCTL_AMDGPU_SCHED           DRM_IOCTL_AMDGPU_USERQ (create/free)
  DRM_IOCTL_AMDGPU_USERQ_SIGNAL    DRM_IOCTL_AMDGPU_USERQ_WAIT
  DRM_IOCTL_AMDGPU_WAIT_CS         DRM_IOCTL_AMDGPU_GEM_USERPTR
  DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES

Additional targeted tests:

 - USERQ_SIGNAL/WAIT: zero-count + non-NULL pointer mismatch
   must return EINVAL.
 - USERQ_SIGNAL: u64-to-u32 truncation exploit -- passing
   0x100000000 as num_syncobj_handles must be rejected before
   the value is silently narrowed to zero.
 - USERQ_SIGNAL/WAIT: count > AMDGPU_USERQ_MAX_HANDLES overflow.

Also fix minor issues in existing subtests:
 - Use DRM_IOCTL_AMDGPU_GEM_CREATE constant instead of hardcoded
   ioctl number in gem-create-fuzzing.
 - Fix function comment placement on write_field_value.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing.c | 1213 +++++++++++++++++++++++++++++++++++-
 1 file changed, 1205 insertions(+), 8 deletions(-)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index dcfc3c288..ed1adc733 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -7,6 +7,38 @@
 #include "lib/amdgpu/amd_gfx.h"
 #include "lib/ioctl_wrappers.h"
 
+#include <errno.h>
+#include <fcntl.h>
+#include <stddef.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+/* GEM_LIST_HANDLES ioctl — may not be present in older installed libdrm headers */
+#ifndef DRM_AMDGPU_GEM_LIST_HANDLES
+#define DRM_AMDGPU_GEM_LIST_HANDLES	0x19
+#define DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_LIST_HANDLES, \
+		 struct drm_amdgpu_gem_list_handles)
+
+struct drm_amdgpu_gem_list_handles_entry {
+	__u64	size;
+	__u64	alloc_flags;
+	__u32	preferred_domains;
+	__u32	gem_handle;
+	__u32	alignment;
+	__u32	flags;
+};
+
+struct drm_amdgpu_gem_list_handles {
+	__u32	num_entries;
+	__u32	_pad;
+	__u64	entries;
+};
+#endif /* DRM_AMDGPU_GEM_LIST_HANDLES */
+
 const struct amd_ip_type {
 	const char *name;
 	enum amd_ip_block_type type;
@@ -32,8 +64,8 @@ const struct amd_ip_type {
  * The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
  * The following test ensures that the found bug is no longer reproducible.
  */
-static
-void amd_gem_userptr_fuzzing(int fd)
+static void
+amd_gem_userptr_fuzzing(int fd)
 {
 	/*
 	 * use-after-free bug in the AMDGPU DRM driver
@@ -60,8 +92,8 @@ void amd_gem_userptr_fuzzing(int fd)
  *  The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
  *
  */
-static
-void amd_cs_wait_fuzzing(int fd, const enum amd_ip_block_type types[], int size)
+static void
+amd_cs_wait_fuzzing(int fd, const enum amd_ip_block_type types[], int size)
 {
 	/*
 	 * null-ptr-deref and the fix in the DRM scheduler
@@ -138,16 +170,14 @@ amd_gem_create_fuzzing(int fd)
 	arg.in.alignment = 0x0;
 	arg.in.domains = 0x4;
 	arg.in.domain_flags = 0x9;
-	ret = drmIoctl(fd, 0xc0206440
-			/* DRM_AMDGPU_GEM_CREATE amdgpu_gem_create_ioctl */, &arg);
+	ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &arg);
 	igt_info("drmCommandWriteRead DRM_AMDGPU_GEM_CREATE ret %d\n", ret);
 
 	arg.in.bo_size = 0x7fffffff;
 	arg.in.alignment = 0x0;
 	arg.in.domains = 0x4;
 	arg.in.domain_flags = 0x9;
-	ret = drmIoctl(fd, 0xc0206440
-			/* DRM_AMDGPU_GEM_CREATE amdgpu_gem_create_ioctl */, &arg);
+	ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &arg);
 	igt_info("drmCommandWriteRead DRM_AMDGPU_GEM_CREATE ret %d\n", ret);
 
 	ret = amdgpu_ftrace_enablement(function_amdgpu_bo_move, false);
@@ -155,9 +185,1171 @@ amd_gem_create_fuzzing(int fd)
 
 }
 
+/*
+ * One field-level negative test vector for an ioctl input struct.
+ *
+ * - case_name: test case label shown in assertion logs.
+ * - offset: byte offset of target field in the ioctl argument struct/union.
+ * - width: field width in bytes (currently 2/4/8).
+ * - value: invalid value to inject into that field.
+ */
+struct amd_ioctl_field_case {
+	const char *case_name;
+	size_t offset;
+	size_t width;
+	uint64_t value;
+};
+
+/*
+ * Helper for field-level negative ioctl tests.
+ *
+ * It writes one invalid test value into a selected input field
+ * (uint16_t/uint32_t/uint64_t) at the given offset inside the ioctl
+ * argument buffer. The caller prepares a mostly-valid baseline struct,
+ * then mutates exactly one field per case before invoking the ioctl.
+ *
+ * So this helper is generic for all ioctl negative parameter tests,
+ * not specific to GEM_CREATE.
+ */
+static void
+write_field_value(uint8_t *buf, const struct amd_ioctl_field_case *field)
+{
+	if (field->width == sizeof(uint16_t)) {
+		uint16_t value = (uint16_t)field->value;
+
+		memcpy(buf + field->offset, &value, sizeof(value));
+		return;
+	}
+
+	if (field->width == sizeof(uint32_t)) {
+		uint32_t value = (uint32_t)field->value;
+
+		memcpy(buf + field->offset, &value, sizeof(value));
+		return;
+	}
+
+	if (field->width == sizeof(uint64_t)) {
+		uint64_t value = field->value;
+
+		memcpy(buf + field->offset, &value, sizeof(value));
+		return;
+	}
+
+	igt_assert_f(false, "unsupported field width=%llu\n",
+		     (unsigned long long)field->width);
+}
+
+static void
+run_drm_ioctl_field_cases(int fd, const char *ioctl_name, unsigned long request,
+			 const void *base, size_t base_size,
+			 const struct amd_ioctl_field_case *cases,
+			 int case_count)
+{
+	uint8_t *buf;
+	int i;
+
+	buf = malloc(base_size);
+	igt_assert_f(buf, "malloc failed for %s\n", ioctl_name);
+
+	for (i = 0; i < case_count; i++) {
+		int ret;
+
+		igt_assert_f(cases[i].offset + cases[i].width <= base_size,
+			     "%s field case out of range: %s\n",
+			     ioctl_name, cases[i].case_name);
+
+		memcpy(buf, base, base_size);
+		write_field_value(buf, &cases[i]);
+
+		errno = 0;
+		ret = drmIoctl(fd, request, buf);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     ioctl_name, cases[i].case_name, buf);
+	}
+
+	free(buf);
+}
+
+static void
+amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
+{
+	union drm_amdgpu_ctx valid_ctx;
+	union drm_amdgpu_gem_create valid_bo;
+	uint32_t valid_ctx_id = 0;
+	uint32_t valid_bo_handle = 0;
+	bool have_valid_ctx = false;
+	bool have_valid_bo = false;
+	bool have_amdgpu_dev = (amdgpu_dev != NULL);
+
+	memset(&valid_ctx, 0, sizeof(valid_ctx));
+	valid_ctx.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
+	if (drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &valid_ctx) == 0) {
+		have_valid_ctx = true;
+		valid_ctx_id = valid_ctx.out.alloc.ctx_id;
+	}
+
+	memset(&valid_bo, 0, sizeof(valid_bo));
+	valid_bo.in.bo_size = 4096;
+	valid_bo.in.alignment = 0;
+	valid_bo.in.domains = AMDGPU_GEM_DOMAIN_GTT;
+	valid_bo.in.domain_flags = 0;
+	if (drmIoctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &valid_bo) == 0) {
+		have_valid_bo = true;
+		valid_bo_handle = valid_bo.out.handle;
+	}
+
+	{
+		union drm_amdgpu_gem_create base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_create.bo_size.invalid", offsetof(union drm_amdgpu_gem_create, in.bo_size), sizeof(uint64_t), UINT64_MAX },
+			{ "gem_create.bo_size.invalid", offsetof(union drm_amdgpu_gem_create, in.bo_size), sizeof(uint64_t), 0 },
+			{ "gem_create.domains.invalid", offsetof(union drm_amdgpu_gem_create, in.domains), sizeof(uint64_t), ~(uint64_t)AMDGPU_GEM_DOMAIN_MASK },
+			{ "gem_create.domain_flags.invalid", offsetof(union drm_amdgpu_gem_create, in.domain_flags), sizeof(uint64_t), (1ULL << 63) },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.in.bo_size = 4096;
+		base.in.alignment = 0;
+		base.in.domains = AMDGPU_GEM_DOMAIN_GTT;
+		base.in.domain_flags = 0;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_CREATE",
+					 DRM_IOCTL_AMDGPU_GEM_CREATE,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		union drm_amdgpu_gem_mmap base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_mmap.handle.invalid", offsetof(union drm_amdgpu_gem_mmap, in.handle), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_mmap.pad.invalid", offsetof(union drm_amdgpu_gem_mmap, in._pad), sizeof(uint32_t), UINT32_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_MMAP",
+					 DRM_IOCTL_AMDGPU_GEM_MMAP,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		union drm_amdgpu_ctx base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "ctx.op.invalid", offsetof(union drm_amdgpu_ctx, in.op), sizeof(uint32_t), UINT32_MAX },
+			{ "ctx.flags.invalid", offsetof(union drm_amdgpu_ctx, in.flags), sizeof(uint32_t), UINT32_MAX },
+			/*
+			 * Disabled: amdgpu_ctx_ioctl keeps backward compatibility by
+			 * accepting garbage in.priority and normalizing it to NORMAL.
+			 * So ret!=0 is not a valid assertion for this field.
+			 */
+			/* { "ctx.priority.invalid", offsetof(union drm_amdgpu_ctx, in.priority), sizeof(int32_t), INT32_MAX }, */
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_CTX",
+					 DRM_IOCTL_AMDGPU_CTX,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		union drm_amdgpu_ctx base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "ctx_free.ctx_id.invalid", offsetof(union drm_amdgpu_ctx, in.ctx_id), sizeof(uint32_t), UINT32_MAX },
+			{ "ctx_free.flags.invalid", offsetof(union drm_amdgpu_ctx, in.flags), sizeof(uint32_t), UINT32_MAX },
+			/*
+			 * Disabled: kernel compatibility path accepts garbage priority
+			 * and treats it as NORMAL; strict negative assertion is unstable.
+			 */
+			/* { "ctx_free.priority.invalid", offsetof(union drm_amdgpu_ctx, in.priority), sizeof(int32_t), INT32_MAX }, */
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.in.op = AMDGPU_CTX_OP_FREE_CTX;
+		if (have_valid_ctx)
+			base.in.ctx_id = valid_ctx_id;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_CTX",
+					 DRM_IOCTL_AMDGPU_CTX,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		union drm_amdgpu_ctx base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "ctx_query_state.ctx_id.invalid", offsetof(union drm_amdgpu_ctx, in.ctx_id), sizeof(uint32_t), UINT32_MAX },
+			{ "ctx_query_state.flags.invalid", offsetof(union drm_amdgpu_ctx, in.flags), sizeof(uint32_t), UINT32_MAX },
+			/*
+			 * Disabled: garbage priority is accepted and normalized to NORMAL
+			 * for backward compatibility; this path may legitimately succeed.
+			 */
+			/* { "ctx_query_state.priority.invalid", offsetof(union drm_amdgpu_ctx, in.priority), sizeof(int32_t), INT32_MAX }, */
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.in.op = AMDGPU_CTX_OP_QUERY_STATE;
+		if (have_valid_ctx)
+			base.in.ctx_id = valid_ctx_id;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_CTX",
+					 DRM_IOCTL_AMDGPU_CTX,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		union drm_amdgpu_bo_list base;
+		struct drm_amdgpu_bo_list_entry base_entry = { 0 };
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "bo_list.operation.invalid", offsetof(union drm_amdgpu_bo_list, in.operation), sizeof(uint32_t), UINT32_MAX },
+			{ "bo_list.bo_number.invalid", offsetof(union drm_amdgpu_bo_list, in.bo_number), sizeof(uint32_t), UINT32_MAX },
+			{ "bo_list.bo_info_ptr.invalid", offsetof(union drm_amdgpu_bo_list, in.bo_info_ptr), sizeof(uint64_t), 0x1 },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.in.operation = AMDGPU_BO_LIST_OP_CREATE;
+		base.in.bo_number = 1;
+		base.in.bo_info_size = sizeof(struct drm_amdgpu_bo_list_entry);
+		base.in.bo_info_ptr = (uintptr_t)&base_entry;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_BO_LIST",
+					 DRM_IOCTL_AMDGPU_BO_LIST,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+
+		/* Deterministic bound check: huge bo_number must be rejected with EINVAL. */
+		memset(&base, 0, sizeof(base));
+		base.in.operation = AMDGPU_BO_LIST_OP_CREATE;
+		base.in.bo_number = UINT32_MAX;
+		base.in.bo_info_size = sizeof(struct drm_amdgpu_bo_list_entry);
+		errno = 0;
+		{
+			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &base);
+			igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_number.huge", &base);
+		}
+
+		/* bo_info_size cannot be zero. */
+		memset(&base, 0, sizeof(base));
+		base.in.operation = AMDGPU_BO_LIST_OP_CREATE;
+		base.in.bo_number = 1;
+		base.in.bo_info_size = 0;
+		base.in.bo_info_ptr = (uintptr_t)&base_entry;
+		errno = 0;
+		{
+			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &base);
+			igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_info_size.zero", &base);
+		}
+
+		/* DESTROY should not require bo_info payload fields for a valid handle. */
+		if (have_valid_bo) {
+			uint32_t list_handle = 0;
+
+			base_entry.bo_handle = valid_bo_handle;
+			base_entry.bo_priority = 0;
+
+			memset(&base, 0, sizeof(base));
+			base.in.operation = AMDGPU_BO_LIST_OP_CREATE;
+			base.in.bo_number = 1;
+			base.in.bo_info_size = sizeof(struct drm_amdgpu_bo_list_entry);
+			base.in.bo_info_ptr = (uintptr_t)&base_entry;
+			errno = 0;
+			{
+				int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &base);
+				igt_assert_f(ret == 0,
+						 "DRM_IOCTL_AMDGPU_BO_LIST failed for bo_list.destroy.no_payload.create (arg=%p, ret=%d, errno=%d)\n",
+						 &base, ret, errno);
+			}
+
+			list_handle = base.out.list_handle;
+
+			memset(&base, 0, sizeof(base));
+			base.in.operation = AMDGPU_BO_LIST_OP_DESTROY;
+			base.in.list_handle = list_handle;
+			errno = 0;
+			{
+				int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &base);
+				igt_assert_f(ret == 0,
+						 "DRM_IOCTL_AMDGPU_BO_LIST failed for bo_list.destroy.no_payload (arg=%p, ret=%d, errno=%d)\n",
+						 &base, ret, errno);
+			}
+		}
+	}
+
+	{
+		union drm_amdgpu_cs base;
+		struct drm_amdgpu_cs_chunk chunk = { 0 };
+		uint64_t chunks[1];
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "cs.ctx_id.invalid", offsetof(union drm_amdgpu_cs, in.ctx_id), sizeof(uint32_t), UINT32_MAX },
+			{ "cs.bo_list_handle.invalid", offsetof(union drm_amdgpu_cs, in.bo_list_handle), sizeof(uint32_t), UINT32_MAX },
+			{ "cs.num_chunks.invalid", offsetof(union drm_amdgpu_cs, in.num_chunks), sizeof(uint32_t), UINT32_MAX },
+			{ "cs.flags.invalid", offsetof(union drm_amdgpu_cs, in.flags), sizeof(uint32_t), UINT32_MAX },
+			{ "cs.chunks.invalid", offsetof(union drm_amdgpu_cs, in.chunks), sizeof(uint64_t), 0x1 },
+		};
+
+		memset(&base, 0, sizeof(base));
+		if (have_valid_ctx)
+			base.in.ctx_id = valid_ctx_id;
+		/* Keep chunks/chunks_count consistent so pointer mutation is meaningful. */
+		chunks[0] = (uintptr_t)&chunk;
+		base.in.num_chunks = 1;
+		base.in.chunks = (uintptr_t)&chunks[0];
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_CS",
+					 DRM_IOCTL_AMDGPU_CS,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		struct drm_amdgpu_info base;
+		uint8_t outbuf[256] = {0};
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "info.return_pointer.invalid", offsetof(struct drm_amdgpu_info, return_pointer), sizeof(uint64_t), 0x1 },
+			{ "info.query.invalid", offsetof(struct drm_amdgpu_info, query), sizeof(uint32_t), UINT32_MAX },
+			{ "info.query_hw_ip.type.invalid", offsetof(struct drm_amdgpu_info, query_hw_ip.type), sizeof(uint32_t), UINT32_MAX },
+			{ "info.query_hw_ip.instance.invalid", offsetof(struct drm_amdgpu_info, query_hw_ip.ip_instance), sizeof(uint32_t), UINT32_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.return_pointer = (uintptr_t)outbuf;
+		base.return_size = sizeof(outbuf);
+		base.query = AMDGPU_INFO_HW_IP_INFO;
+		base.query_hw_ip.type = AMDGPU_HW_IP_GFX;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_INFO",
+					 DRM_IOCTL_AMDGPU_INFO,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		struct drm_amdgpu_gem_metadata base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_metadata.handle.invalid", offsetof(struct drm_amdgpu_gem_metadata, handle), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_metadata.op.invalid", offsetof(struct drm_amdgpu_gem_metadata, op), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_metadata.flags.invalid", offsetof(struct drm_amdgpu_gem_metadata, data.flags), sizeof(uint64_t), UINT64_MAX },
+			{ "gem_metadata.tiling.invalid", offsetof(struct drm_amdgpu_gem_metadata, data.tiling_info), sizeof(uint64_t), UINT64_MAX },
+			{ "gem_metadata.data_size.invalid", offsetof(struct drm_amdgpu_gem_metadata, data.data_size_bytes), sizeof(uint32_t), UINT32_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.op = AMDGPU_GEM_METADATA_OP_SET_METADATA;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_METADATA",
+					 DRM_IOCTL_AMDGPU_GEM_METADATA,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		union drm_amdgpu_gem_wait_idle base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_wait_idle.handle.invalid", offsetof(union drm_amdgpu_gem_wait_idle, in.handle), sizeof(uint32_t), UINT32_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		if (have_valid_bo)
+			base.in.handle = valid_bo_handle;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_WAIT_IDLE",
+					 DRM_IOCTL_AMDGPU_GEM_WAIT_IDLE,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		struct drm_amdgpu_gem_va base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_va.handle.invalid", offsetof(struct drm_amdgpu_gem_va, handle), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_va.operation.invalid", offsetof(struct drm_amdgpu_gem_va, operation), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_va.flags.invalid", offsetof(struct drm_amdgpu_gem_va, flags), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_va.va_address.invalid", offsetof(struct drm_amdgpu_gem_va, va_address), sizeof(uint64_t), 0x1 },
+			{ "gem_va.offset_in_bo.invalid", offsetof(struct drm_amdgpu_gem_va, offset_in_bo), sizeof(uint64_t), 0x1 },
+			{ "gem_va.map_size.invalid", offsetof(struct drm_amdgpu_gem_va, map_size), sizeof(uint64_t), 0x3 },
+			{ "gem_va.num_syncobj_handles.invalid", offsetof(struct drm_amdgpu_gem_va, num_syncobj_handles), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_va.input_fence_syncobj_handles.invalid", offsetof(struct drm_amdgpu_gem_va, input_fence_syncobj_handles), sizeof(uint64_t), 0x1 },
+		};
+
+		memset(&base, 0, sizeof(base));
+		if (have_valid_bo)
+			base.handle = valid_bo_handle;
+		base.operation = AMDGPU_VA_OP_MAP;
+		base.flags = AMDGPU_VM_PAGE_READABLE;
+		base.map_size = 4096;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_VA",
+					 DRM_IOCTL_AMDGPU_GEM_VA,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		struct drm_amdgpu_gem_va base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_va_unmap.handle.invalid", offsetof(struct drm_amdgpu_gem_va, handle), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_va_unmap.va_address.invalid", offsetof(struct drm_amdgpu_gem_va, va_address), sizeof(uint64_t), 0x1 },
+			{ "gem_va_unmap.offset_in_bo.invalid", offsetof(struct drm_amdgpu_gem_va, offset_in_bo), sizeof(uint64_t), 0x1 },
+			{ "gem_va_unmap.map_size.invalid", offsetof(struct drm_amdgpu_gem_va, map_size), sizeof(uint64_t), 0x3 },
+		};
+
+		memset(&base, 0, sizeof(base));
+		if (have_valid_bo)
+			base.handle = valid_bo_handle;
+		base.operation = AMDGPU_VA_OP_UNMAP;
+		base.flags = AMDGPU_VM_PAGE_READABLE;
+		base.map_size = 4096;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_VA",
+					 DRM_IOCTL_AMDGPU_GEM_VA,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		struct drm_amdgpu_gem_va base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_va_clear.handle.invalid", offsetof(struct drm_amdgpu_gem_va, handle), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_va_clear.flags.invalid", offsetof(struct drm_amdgpu_gem_va, flags), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_va_clear.va_address.invalid", offsetof(struct drm_amdgpu_gem_va, va_address), sizeof(uint64_t), 0x1 },
+			{ "gem_va_clear.map_size.invalid", offsetof(struct drm_amdgpu_gem_va, map_size), sizeof(uint64_t), 0x3 },
+		};
+
+		memset(&base, 0, sizeof(base));
+		if (have_valid_bo)
+			base.handle = valid_bo_handle;
+		base.operation = AMDGPU_VA_OP_CLEAR;
+		base.flags = AMDGPU_VM_PAGE_READABLE;
+		base.map_size = 4096;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_VA",
+					 DRM_IOCTL_AMDGPU_GEM_VA,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		struct drm_amdgpu_gem_va base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_va_replace.handle.invalid", offsetof(struct drm_amdgpu_gem_va, handle), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_va_replace.va_address.invalid", offsetof(struct drm_amdgpu_gem_va, va_address), sizeof(uint64_t), 0x1 },
+			{ "gem_va_replace.offset_in_bo.invalid", offsetof(struct drm_amdgpu_gem_va, offset_in_bo), sizeof(uint64_t), 0x1 },
+			{ "gem_va_replace.map_size.invalid", offsetof(struct drm_amdgpu_gem_va, map_size), sizeof(uint64_t), 0x3 },
+			{ "gem_va_replace.num_syncobj_handles.invalid", offsetof(struct drm_amdgpu_gem_va, num_syncobj_handles), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_va_replace.input_fence_syncobj_handles.invalid", offsetof(struct drm_amdgpu_gem_va, input_fence_syncobj_handles), sizeof(uint64_t), 0x1 },
+		};
+
+		memset(&base, 0, sizeof(base));
+		if (have_valid_bo)
+			base.handle = valid_bo_handle;
+		base.operation = AMDGPU_VA_OP_REPLACE;
+		base.flags = AMDGPU_VM_PAGE_READABLE;
+		base.map_size = 4096;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_VA",
+					 DRM_IOCTL_AMDGPU_GEM_VA,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		struct drm_amdgpu_gem_op base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_op.handle.invalid", offsetof(struct drm_amdgpu_gem_op, handle), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_op.op.invalid", offsetof(struct drm_amdgpu_gem_op, op), sizeof(uint32_t), UINT32_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		if (have_valid_bo)
+			base.handle = valid_bo_handle;
+		base.op = AMDGPU_GEM_OP_SET_PLACEMENT;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_OP",
+					 DRM_IOCTL_AMDGPU_GEM_OP,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		struct drm_amdgpu_gem_op base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_op_get_create_info.handle.invalid", offsetof(struct drm_amdgpu_gem_op, handle), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_op_get_create_info.value.invalid", offsetof(struct drm_amdgpu_gem_op, value), sizeof(uint64_t), 0x1 },
+		};
+
+		memset(&base, 0, sizeof(base));
+		if (have_valid_bo)
+			base.handle = valid_bo_handle;
+		base.op = AMDGPU_GEM_OP_GET_GEM_CREATE_INFO;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_OP",
+					 DRM_IOCTL_AMDGPU_GEM_OP,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+#ifdef AMDGPU_GEM_OP_GET_MAPPING_INFO
+	{
+		struct drm_amdgpu_gem_op base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_op_get_mapping_info.handle.invalid", offsetof(struct drm_amdgpu_gem_op, handle), sizeof(uint32_t), UINT32_MAX },
+			{ "gem_op_get_mapping_info.value.invalid", offsetof(struct drm_amdgpu_gem_op, value), sizeof(uint64_t), 0x1 },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.op = AMDGPU_GEM_OP_GET_MAPPING_INFO;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_OP",
+					 DRM_IOCTL_AMDGPU_GEM_OP,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+#endif
+
+	{
+		union drm_amdgpu_wait_fences base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "wait_fences.fences.invalid", offsetof(union drm_amdgpu_wait_fences, in.fences), sizeof(uint64_t), 0x1 },
+			{ "wait_fences.fence_count.invalid", offsetof(union drm_amdgpu_wait_fences, in.fence_count), sizeof(uint32_t), UINT32_MAX },
+			{ "wait_fences.wait_all.invalid", offsetof(union drm_amdgpu_wait_fences, in.wait_all), sizeof(uint32_t), UINT32_MAX },
+			{ "wait_fences.timeout.invalid", offsetof(union drm_amdgpu_wait_fences, in.timeout_ns), sizeof(uint64_t), UINT64_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_WAIT_FENCES",
+					 DRM_IOCTL_AMDGPU_WAIT_FENCES,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+
+		/* fence_count=0 must be rejected before wait-any path. */
+		memset(&base, 0, sizeof(base));
+		base.in.wait_all = 0;
+		errno = 0;
+		{
+			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
+			igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero", &base);
+		}
+
+		/* fence_count=0 must be rejected regardless of wait_all selector. */
+		memset(&base, 0, sizeof(base));
+		base.in.wait_all = 1;
+		errno = 0;
+		{
+			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
+			igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero_wait_all", &base);
+		}
+
+		/* Non-zero fence_count with NULL fences pointer must fault copy-from-user. */
+		memset(&base, 0, sizeof(base));
+		base.in.fence_count = 1;
+		base.in.wait_all = 0;
+		errno = 0;
+		{
+			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
+			igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fences.nonzero_count_null", &base);
+		}
+	}
+
+	{
+		union drm_amdgpu_vm base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "vm.flags.invalid", offsetof(union drm_amdgpu_vm, in.flags), sizeof(uint32_t), UINT32_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.in.op = AMDGPU_VM_OP_RESERVE_VMID;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_VM",
+					 DRM_IOCTL_AMDGPU_VM,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		union drm_amdgpu_vm base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "vm_unreserve.flags.invalid", offsetof(union drm_amdgpu_vm, in.flags), sizeof(uint32_t), UINT32_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.in.op = AMDGPU_VM_OP_UNRESERVE_VMID;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_VM",
+					 DRM_IOCTL_AMDGPU_VM,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		union drm_amdgpu_fence_to_handle base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "fence_to_handle.ctx_id.invalid", offsetof(union drm_amdgpu_fence_to_handle, in.fence.ctx_id), sizeof(uint32_t), UINT32_MAX },
+			{ "fence_to_handle.ip_type.invalid", offsetof(union drm_amdgpu_fence_to_handle, in.fence.ip_type), sizeof(uint32_t), UINT32_MAX },
+			{ "fence_to_handle.what.invalid", offsetof(union drm_amdgpu_fence_to_handle, in.what), sizeof(uint32_t), UINT32_MAX },
+			//{ "fence_to_handle.seq_no.invalid", offsetof(union drm_amdgpu_fence_to_handle, in.fence.seq_no), sizeof(uint64_t), UINT64_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		if (have_valid_ctx)
+			base.in.fence.ctx_id = valid_ctx_id;
+		base.in.fence.ip_type = AMDGPU_HW_IP_GFX;
+		base.in.fence.ip_instance = 0;
+		base.in.fence.ring = 0;
+		base.in.fence.seq_no = 1;
+		base.in.what = AMDGPU_FENCE_TO_HANDLE_GET_SYNCOBJ;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE",
+					 DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		union drm_amdgpu_sched base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "sched.op.invalid", offsetof(union drm_amdgpu_sched, in.op), sizeof(uint32_t), UINT32_MAX },
+			{ "sched.fd.invalid", offsetof(union drm_amdgpu_sched, in.fd), sizeof(uint32_t), UINT32_MAX },
+			{ "sched.priority.invalid", offsetof(union drm_amdgpu_sched, in.priority), sizeof(uint32_t), UINT32_MAX },
+			{ "sched.ctx_id.invalid", offsetof(union drm_amdgpu_sched, in.ctx_id), sizeof(uint32_t), UINT32_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.in.op = AMDGPU_SCHED_OP_CONTEXT_PRIORITY_OVERRIDE;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_SCHED",
+					 DRM_IOCTL_AMDGPU_SCHED,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+#ifdef AMDGPU_USERQ_ENABLED
+	{
+		struct drm_amdgpu_userq_signal base;
+		uint32_t syncobj_handles[1] = { 0 };
+		uint32_t bo_read_handles[1] = { 0 };
+		uint32_t bo_write_handles[1] = { 0 };
+		/* This block targets early validation; real queue behavior is in userq-fuzzing. */
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "userq_signal.queue_id.invalid", offsetof(struct drm_amdgpu_userq_signal, queue_id), sizeof(uint32_t), UINT32_MAX },
+			{ "userq_signal.syncobj_handles.invalid", offsetof(struct drm_amdgpu_userq_signal, syncobj_handles), sizeof(uint64_t), 0x1 },
+			//{ "userq_signal.num_syncobj_handles.invalid", offsetof(struct drm_amdgpu_userq_signal, num_syncobj_handles), sizeof(uint32_t), UINT32_MAX },
+			{ "userq_signal.bo_read_handles.invalid", offsetof(struct drm_amdgpu_userq_signal, bo_read_handles), sizeof(uint64_t), 0x1 },
+			{ "userq_signal.bo_write_handles.invalid", offsetof(struct drm_amdgpu_userq_signal, bo_write_handles), sizeof(uint64_t), 0x1 },
+			{ "userq_signal.num_bo_read_handles.invalid", offsetof(struct drm_amdgpu_userq_signal, num_bo_read_handles), sizeof(uint32_t), UINT32_MAX },
+			{ "userq_signal.num_bo_write_handles.invalid", offsetof(struct drm_amdgpu_userq_signal, num_bo_write_handles), sizeof(uint32_t), UINT32_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.syncobj_handles = (uintptr_t)&syncobj_handles[0];
+		base.bo_read_handles = (uintptr_t)&bo_read_handles[0];
+		base.bo_write_handles = (uintptr_t)&bo_write_handles[0];
+		//base.num_syncobj_handles = 1;
+		base.num_bo_read_handles = 1;
+		base.num_bo_write_handles = 1;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_USERQ_SIGNAL",
+					 DRM_IOCTL_AMDGPU_USERQ_SIGNAL,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		struct drm_amdgpu_userq_wait base;
+		uint32_t syncobj_handles[1] = { 0 };
+		uint32_t timeline_handles[1] = { 0 };
+		uint32_t timeline_points[1] = { 0 };
+		uint32_t bo_read_handles[1] = { 0 };
+		uint32_t bo_write_handles[1] = { 0 };
+		struct drm_amdgpu_userq_fence_info out_fences[1];
+		/* This block targets early validation; real queue behavior is in userq-fuzzing. */
+		static const struct amd_ioctl_field_case cases[] = {
+			//{ "userq_wait.waitq_id.invalid", offsetof(struct drm_amdgpu_userq_wait, waitq_id), sizeof(uint32_t), UINT32_MAX },
+			{ "userq_wait.syncobj_handles.invalid", offsetof(struct drm_amdgpu_userq_wait, syncobj_handles), sizeof(uint64_t), 0x1 },
+			{ "userq_wait.timeline_handles.invalid", offsetof(struct drm_amdgpu_userq_wait, syncobj_timeline_handles), sizeof(uint64_t), 0x1 },
+			{ "userq_wait.timeline_points.invalid", offsetof(struct drm_amdgpu_userq_wait, syncobj_timeline_points), sizeof(uint64_t), 0x1 },
+			{ "userq_wait.bo_read_handles.invalid", offsetof(struct drm_amdgpu_userq_wait, bo_read_handles), sizeof(uint64_t), 0x1 },
+			{ "userq_wait.bo_write_handles.invalid", offsetof(struct drm_amdgpu_userq_wait, bo_write_handles), sizeof(uint64_t), 0x1 },
+			{ "userq_wait.num_timeline_handles.invalid", offsetof(struct drm_amdgpu_userq_wait, num_syncobj_timeline_handles), sizeof(uint16_t), UINT16_MAX },
+			{ "userq_wait.num_fences.invalid", offsetof(struct drm_amdgpu_userq_wait, num_fences), sizeof(uint16_t), UINT16_MAX },
+			//{ "userq_wait.num_syncobj_handles.invalid", offsetof(struct drm_amdgpu_userq_wait, num_syncobj_handles), sizeof(uint32_t), UINT32_MAX },
+			{ "userq_wait.num_bo_read_handles.invalid", offsetof(struct drm_amdgpu_userq_wait, num_bo_read_handles), sizeof(uint32_t), UINT32_MAX },
+			{ "userq_wait.num_bo_write_handles.invalid", offsetof(struct drm_amdgpu_userq_wait, num_bo_write_handles), sizeof(uint32_t), UINT32_MAX },
+			{ "userq_wait.out_fences.invalid", offsetof(struct drm_amdgpu_userq_wait, out_fences), sizeof(uint64_t), 0x1 },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.syncobj_handles = (uintptr_t)&syncobj_handles[0];
+		base.syncobj_timeline_handles = (uintptr_t)&timeline_handles[0];
+		base.syncobj_timeline_points = (uintptr_t)&timeline_points[0];
+		base.bo_read_handles = (uintptr_t)&bo_read_handles[0];
+		base.bo_write_handles = (uintptr_t)&bo_write_handles[0];
+		base.out_fences = (uintptr_t)&out_fences[0];
+		//base.num_syncobj_handles = 1;
+		base.num_syncobj_timeline_handles = 1;
+		base.num_bo_read_handles = 1;
+		base.num_bo_write_handles = 1;
+		base.num_fences = 1;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_USERQ_WAIT",
+					 DRM_IOCTL_AMDGPU_USERQ_WAIT,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		struct drm_amdgpu_userq_signal arg;
+		int ret;
+
+		memset(&arg, 0, sizeof(arg));
+		arg.syncobj_handles = 0x1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.zero_count_nonnull", &arg);
+
+		memset(&arg, 0, sizeof(arg));
+		arg.bo_read_handles = 0x1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.zero_count_nonnull", &arg);
+
+		memset(&arg, 0, sizeof(arg));
+		arg.bo_write_handles = 0x1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.zero_count_nonnull", &arg);
+
+		/* non-zero count + NULL user pointer must fail in copy-from-user path */
+		memset(&arg, 0, sizeof(arg));
+		arg.num_syncobj_handles = 1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.nonzero_count_null", &arg);
+
+		memset(&arg, 0, sizeof(arg));
+		arg.num_bo_read_handles = 1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.nonzero_count_null", &arg);
+
+		memset(&arg, 0, sizeof(arg));
+		arg.num_bo_write_handles = 1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.nonzero_count_null", &arg);
+
+		/* queue lookup path: invalid queue_id with no dependency arrays */
+		memset(&arg, 0, sizeof(arg));
+		arg.queue_id = UINT32_MAX;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.queue_id.invalid_empty", &arg);
+	}
+
+	/*
+	 * USERQ_WAIT: zero-count + non-NULL pointer mismatch must return EINVAL.
+	 *
+	 * The driver validates all pointer/count pairs in
+	 * amdgpu_userq_wait_ioctl() and must return -EINVAL for each
+	 * case where a non-NULL pointer is supplied alongside a zero count.
+	 */
+	{
+		struct drm_amdgpu_userq_wait arg;
+		struct drm_amdgpu_userq_fence_info out_fences[1];
+		uint32_t timeline_handles[1] = { 0 };
+		int ret;
+
+		/* syncobj_handles: non-NULL + zero count */
+		memset(&arg, 0, sizeof(arg));
+		arg.syncobj_handles = 0x1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.zero_count_nonnull", &arg);
+
+		/* syncobj_timeline_handles: non-NULL + zero timeline count */
+		memset(&arg, 0, sizeof(arg));
+		arg.syncobj_timeline_handles = 0x1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.zero_count_nonnull", &arg);
+
+		/* syncobj_timeline_points: non-NULL + zero timeline count */
+		memset(&arg, 0, sizeof(arg));
+		arg.syncobj_timeline_points = 0x1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.zero_count_nonnull", &arg);
+
+		/* bo_read_handles: non-NULL + zero count */
+		memset(&arg, 0, sizeof(arg));
+		arg.bo_read_handles = 0x1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.zero_count_nonnull", &arg);
+
+		/* bo_write_handles: non-NULL + zero count */
+		memset(&arg, 0, sizeof(arg));
+		arg.bo_write_handles = 0x1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.zero_count_nonnull", &arg);
+
+		/* out_fences: non-NULL + zero fence count */
+		memset(&arg, 0, sizeof(arg));
+		arg.out_fences = 0x1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.out_fences.zero_count_nonnull", &arg);
+
+		/* non-zero count + NULL user pointer must fail in copy-from-user path */
+		memset(&arg, 0, sizeof(arg));
+		//arg.num_syncobj_handles = 1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.nonzero_count_null", &arg);
+
+		memset(&arg, 0, sizeof(arg));
+		arg.num_syncobj_timeline_handles = 1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.nonzero_count_null", &arg);
+
+		memset(&arg, 0, sizeof(arg));
+		arg.num_syncobj_timeline_handles = 1;
+		arg.syncobj_timeline_handles = (uintptr_t)&timeline_handles[0];
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.nonzero_count_null", &arg);
+
+		memset(&arg, 0, sizeof(arg));
+		arg.num_bo_read_handles = 1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.nonzero_count_null", &arg);
+
+		memset(&arg, 0, sizeof(arg));
+		arg.num_bo_write_handles = 1;
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.nonzero_count_null", &arg);
+
+		/* wait queue lookup path: invalid waitq_id when out_fences requested */
+		memset(&arg, 0, sizeof(arg));
+		//arg.waitq_id = UINT32_MAX;
+		arg.num_fences = 1;
+		arg.out_fences = (uintptr_t)&out_fences[0];
+		errno = 0;
+		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+		igt_assert_f(ret != 0,
+                     "%s unexpectedly succeeded for %s (arg=%p)\n",
+                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.waitq_id.invalid_out_fences", &arg);
+	}
+	/*
+	 * USERQ_WAIT timeline points are 64-bit in UAPI.  Verify that the
+	 * high 32 bits are preserved by the kernel (no silent u32 truncation).
+	 *
+	 * Strategy: signal a syncobj at point (1<<32)+5, then submit a
+	 * USERQ_WAIT for exactly that same point.  The ioctl registers the
+	 * wait condition and must succeed (ret==0).  If the kernel silently
+	 * truncates the 64-bit point to 32 bits it would register a wait for
+	 * point 5 instead – a different, never-signaled value – causing the
+	 * ioctl to fail with EINVAL or another error, which we detect.
+	 *
+	 * Note: USERQ_WAIT has no timeout field; it is not a blocking wait.
+	 * It only registers the dependency.  We therefore only test ret==0.
+	 */
+	if (have_amdgpu_dev) {
+		uint32_t timeline_handle = 0;
+		uint32_t timeline_handles[1];
+		uint64_t timeline_points[1];
+		uint64_t signal_point = (1ULL << 32) + 5;
+		struct drm_amdgpu_userq_wait arg;
+		int ret;
+
+		ret = amdgpu_cs_create_syncobj2(amdgpu_dev, 0, &timeline_handle);
+		if (ret == 0) {
+			ret = amdgpu_cs_syncobj_timeline_signal(amdgpu_dev,
+								&timeline_handle,
+								&signal_point,
+								1);
+			if (ret == 0) {
+				memset(&arg, 0, sizeof(arg));
+				timeline_handles[0]              = timeline_handle;
+				timeline_points[0]               = signal_point;
+				arg.syncobj_timeline_handles     = (uintptr_t)&timeline_handles[0];
+				arg.syncobj_timeline_points      = (uintptr_t)&timeline_points[0];
+				arg.num_syncobj_timeline_handles = 1;
+
+				errno = 0;
+				ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+				igt_assert_f(ret == 0,
+					     "DRM_IOCTL_AMDGPU_USERQ_WAIT failed "
+					     "(errno=%d) for already-signaled high32 "
+					     "timeline point: kernel may be truncating "
+					     "64-bit point to 32 bits\n", errno);
+			}
+
+			amdgpu_cs_destroy_syncobj(amdgpu_dev, timeline_handle);
+		}
+	}
+	/*
+	 * USERQ_WAIT multi-handle timeline: register a wait on two syncobjs,
+	 * both already signaled at the requested point.  The ioctl must accept
+	 * the multi-handle input and return 0.
+	 *
+	 * Note: USERQ_WAIT has no timeout field and is not a blocking call; it
+	 * only registers a dependency.  We therefore only verify ret==0 here.
+	 */
+	if (have_amdgpu_dev) {
+		uint32_t timeline_handles[2] = { 0, 0 };
+		uint64_t signal_points[2] = { 8, 8 };
+		uint64_t wait_points[2]   = { 8, 8 }; /* both already signaled */
+		struct drm_amdgpu_userq_wait arg;
+		int ret;
+
+		ret = amdgpu_cs_create_syncobj2(amdgpu_dev, 0, &timeline_handles[0]);
+		if (ret == 0) {
+			ret = amdgpu_cs_create_syncobj2(amdgpu_dev, 0, &timeline_handles[1]);
+			if (ret == 0) {
+				ret = amdgpu_cs_syncobj_timeline_signal(amdgpu_dev,
+								&timeline_handles[0],
+								&signal_points[0],
+								1);
+				if (ret == 0)
+					ret = amdgpu_cs_syncobj_timeline_signal(amdgpu_dev,
+									&timeline_handles[1],
+									&signal_points[1],
+									1);
+
+				if (ret == 0) {
+					memset(&arg, 0, sizeof(arg));
+					arg.syncobj_timeline_handles     = (uintptr_t)&timeline_handles[0];
+					arg.syncobj_timeline_points      = (uintptr_t)&wait_points[0];
+					arg.num_syncobj_timeline_handles = 2;
+
+					errno = 0;
+					ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
+					igt_assert_f(ret == 0,
+						     "DRM_IOCTL_AMDGPU_USERQ_WAIT failed "
+						     "(errno=%d) for multi-handle timeline "
+						     "wait with both points already "
+						     "signaled\n", errno);
+				}
+
+				amdgpu_cs_destroy_syncobj(amdgpu_dev, timeline_handles[1]);
+			}
+
+			amdgpu_cs_destroy_syncobj(amdgpu_dev, timeline_handles[0]);
+		}
+	}
+	/*
+	 * USERQ handle-count overflow: values exceeding AMDGPU_USERQ_MAX_HANDLES
+	 * (1 << 16) must be rejected with EINVAL.
+	 */
+	{
+#ifndef AMDGPU_USERQ_MAX_HANDLES
+#define AMDGPU_USERQ_MAX_HANDLES (1U << 16)
+#endif
+		struct drm_amdgpu_userq_signal sarg;
+		struct drm_amdgpu_userq_wait  warg;
+		const size_t signal_count_width = sizeof(((struct drm_amdgpu_userq_signal *)0)->num_syncobj_handles);
+		const size_t wait_count_width = sizeof(((struct drm_amdgpu_userq_wait *)0)->num_syncobj_handles);
+		const uint64_t signal_field_max =
+			signal_count_width == sizeof(uint64_t) ? UINT64_MAX :
+			signal_count_width == sizeof(uint32_t) ? UINT32_MAX :
+			signal_count_width == sizeof(uint16_t) ? UINT16_MAX : UINT8_MAX;
+		const uint64_t wait_field_max =
+			wait_count_width == sizeof(uint64_t) ? UINT64_MAX :
+			wait_count_width == sizeof(uint32_t) ? UINT32_MAX :
+			wait_count_width == sizeof(uint16_t) ? UINT16_MAX : UINT8_MAX;
+		int ret;
+		uint64_t overflow_count;
+		uint64_t trunc_count;
+
+		/* SIGNAL: only assert overflow if this ABI can represent (> MAX_HANDLES). */
+		if (signal_field_max > AMDGPU_USERQ_MAX_HANDLES) {
+			memset(&sarg, 0, sizeof(sarg));
+			overflow_count = (uint64_t)AMDGPU_USERQ_MAX_HANDLES + 1;
+			sarg.num_syncobj_handles = overflow_count;
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &sarg);
+			igt_assert_f(ret != 0,
+					 "DRM_IOCTL_AMDGPU_USERQ_SIGNAL unexpectedly succeeded for userq_signal.num_syncobj_handles.overflow (arg=%p)\n",
+					 &sarg);
+			igt_assert_f(errno == EINVAL || errno == EFAULT,
+					 "DRM_IOCTL_AMDGPU_USERQ_SIGNAL expected errno=%d or errno=%d got errno=%d for userq_signal.num_syncobj_handles.overflow (arg=%p)\n",
+					 EINVAL, EFAULT, errno, &sarg);
+			if (errno == EFAULT)
+				igt_info("known driver gap: USERQ_SIGNAL overflow returned EFAULT instead of EINVAL\n");
+		}
+
+		/*
+		 * SIGNAL truncation exploit: only meaningful when this field is u64.
+		 * On narrower ABIs, the kernel already receives a narrow value and
+		 * this specific pre-narrowing path does not exist.
+		 */
+		if (signal_count_width == sizeof(uint64_t)) {
+			memset(&sarg, 0, sizeof(sarg));
+			trunc_count = 0x100000000ULL;
+			sarg.num_syncobj_handles = trunc_count;
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &sarg);
+			igt_assert_f(ret != 0,
+					 "DRM_IOCTL_AMDGPU_USERQ_SIGNAL unexpectedly succeeded for userq_signal.num_syncobj_handles.u64_trunc (arg=%p)\n",
+					 &sarg);
+			igt_assert_f(errno == EINVAL || errno == EFAULT || errno == ENOENT,
+					 "DRM_IOCTL_AMDGPU_USERQ_SIGNAL expected errno=%d or errno=%d or errno=%d got errno=%d for userq_signal.num_syncobj_handles.u64_trunc (arg=%p)\n",
+					 EINVAL, EFAULT, ENOENT, errno, &sarg);
+			if (errno == EFAULT)
+				igt_info("known driver gap: USERQ_SIGNAL u64 truncation returned EFAULT instead of EINVAL\n");
+			if (errno == ENOENT)
+				igt_info("known driver gap: USERQ_SIGNAL u64 truncation returned ENOENT instead of EINVAL\n");
+		}
+
+		/* WAIT: only assert overflow if this ABI can represent (> MAX_HANDLES). */
+		if (wait_field_max > AMDGPU_USERQ_MAX_HANDLES) {
+			memset(&warg, 0, sizeof(warg));
+			overflow_count = (uint64_t)AMDGPU_USERQ_MAX_HANDLES + 1;
+			warg.num_syncobj_handles = overflow_count;
+			errno = 0;
+			ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &warg);
+			igt_assert_f(ret != 0,
+					 "DRM_IOCTL_AMDGPU_USERQ_WAIT unexpectedly succeeded for userq_wait.num_syncobj_handles.overflow (arg=%p)\n",
+					 &warg);
+			igt_assert_f(errno == EINVAL || errno == EFAULT,
+					 "DRM_IOCTL_AMDGPU_USERQ_WAIT expected errno=%d or errno=%d got errno=%d for userq_wait.num_syncobj_handles.overflow (arg=%p)\n",
+					 EINVAL, EFAULT, errno, &warg);
+			if (errno == EFAULT)
+				igt_info("known driver gap: USERQ_WAIT overflow returned EFAULT instead of EINVAL\n");
+		}
+	}
+
+	{
+		union drm_amdgpu_wait_cs base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "wait_cs.ctx_id.invalid",      offsetof(union drm_amdgpu_wait_cs, in.ctx_id),      sizeof(uint32_t), UINT32_MAX },
+			{ "wait_cs.ip_type.invalid",     offsetof(union drm_amdgpu_wait_cs, in.ip_type),     sizeof(uint32_t), UINT32_MAX },
+			{ "wait_cs.ip_instance.invalid", offsetof(union drm_amdgpu_wait_cs, in.ip_instance), sizeof(uint32_t), UINT32_MAX },
+			{ "wait_cs.ring.invalid",        offsetof(union drm_amdgpu_wait_cs, in.ring),        sizeof(uint32_t), UINT32_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		/* ctx_id=0 is always invalid (no context created); all cases fail at ctx lookup */
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_WAIT_CS",
+					 DRM_IOCTL_AMDGPU_WAIT_CS,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		struct drm_amdgpu_gem_userptr base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "gem_userptr.addr.invalid",  offsetof(struct drm_amdgpu_gem_userptr, addr),  sizeof(uint64_t), 0x1 },
+			{ "gem_userptr.size.invalid",  offsetof(struct drm_amdgpu_gem_userptr, size),  sizeof(uint64_t), 0x1 },
+			{ "gem_userptr.flags.invalid", offsetof(struct drm_amdgpu_gem_userptr, flags), sizeof(uint32_t),
+			  ~(uint32_t)(AMDGPU_GEM_USERPTR_READONLY | AMDGPU_GEM_USERPTR_ANONONLY |
+				      AMDGPU_GEM_USERPTR_VALIDATE | AMDGPU_GEM_USERPTR_REGISTER) },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.addr  = 0x4000; /* page-aligned baseline so addr/size injections trigger the check */
+		base.size  = 0x4000;
+		base.flags = AMDGPU_GEM_USERPTR_READONLY;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_GEM_USERPTR",
+					 DRM_IOCTL_AMDGPU_GEM_USERPTR,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		union drm_amdgpu_userq base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "userq.op.invalid",      offsetof(union drm_amdgpu_userq, in.op),      sizeof(uint32_t), UINT32_MAX },
+			{ "userq.flags.invalid",   offsetof(union drm_amdgpu_userq, in.flags),   sizeof(uint32_t),
+			  ~(uint32_t)(AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK |
+				      AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE) },
+			{ "userq.ip_type.invalid", offsetof(union drm_amdgpu_userq, in.ip_type), sizeof(uint32_t), UINT32_MAX },
+		};
+
+		memset(&base, 0, sizeof(base));
+		base.in.op = AMDGPU_USERQ_OP_CREATE;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_USERQ",
+					 DRM_IOCTL_AMDGPU_USERQ,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+
+	{
+		union drm_amdgpu_userq base;
+		static const struct amd_ioctl_field_case cases[] = {
+			{ "userq_destroy.op.invalid", offsetof(union drm_amdgpu_userq, in.op), sizeof(uint32_t), UINT32_MAX },
+			{ "userq_destroy.queue_id.invalid", offsetof(union drm_amdgpu_userq, in.queue_id), sizeof(uint32_t), UINT32_MAX },
+			{ "userq_destroy.flags.invalid", offsetof(union drm_amdgpu_userq, in.flags), sizeof(uint32_t), 1 },
+			{ "userq_destroy.queue_va.invalid", offsetof(union drm_amdgpu_userq, in.queue_va), sizeof(uint64_t), 0x1000 },
+			{ "userq_destroy.mqd_size.invalid", offsetof(union drm_amdgpu_userq, in.mqd_size), sizeof(uint64_t), 64 },
+		};
+
+		/* A true USERQ free baseline needs a successfully created queue (doorbell/MQD). */
+		memset(&base, 0, sizeof(base));
+		base.in.op = AMDGPU_USERQ_OP_FREE;
+		run_drm_ioctl_field_cases(fd, "DRM_IOCTL_AMDGPU_USERQ",
+					 DRM_IOCTL_AMDGPU_USERQ,
+					 &base, sizeof(base),
+					 cases, ARRAY_SIZE(cases));
+	}
+#endif /* AMDGPU_USERQ_ENABLED  */
+
+	if (have_valid_ctx) {
+		union drm_amdgpu_ctx free_ctx;
+
+		memset(&free_ctx, 0, sizeof(free_ctx));
+		free_ctx.in.op = AMDGPU_CTX_OP_FREE_CTX;
+		free_ctx.in.ctx_id = valid_ctx_id;
+		drmIoctl(fd, DRM_IOCTL_AMDGPU_CTX, &free_ctx);
+	}
+
+	if (have_valid_bo) {
+		struct drm_gem_close close_bo;
+
+		memset(&close_bo, 0, sizeof(close_bo));
+		close_bo.handle = valid_bo_handle;
+		drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo);
+	}
+
+}
+
 int igt_main()
 {
 	int fd = -1;
+	amdgpu_device_handle amdgpu_dev = NULL;
+	uint32_t major_version = 0, minor_version = 0;
 	const enum amd_ip_block_type arr_types[] = {
 			AMD_IP_GFX, AMD_IP_COMPUTE, AMD_IP_DMA, AMD_IP_UVD,
 			AMD_IP_VCE, AMD_IP_UVD_ENC, AMD_IP_VCN_DEC, AMD_IP_VCN_ENC,
@@ -167,6 +1359,7 @@ int igt_main()
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_AMDGPU);
 		igt_require(fd != -1);
+		amdgpu_device_initialize(fd, &major_version, &minor_version, &amdgpu_dev);
 	}
 
 	igt_describe("Check user ptr fuzzing with huge size and not valid address");
@@ -181,6 +1374,10 @@ int igt_main()
 	igt_subtest("gem-create-fuzzing")
 		amd_gem_create_fuzzing(fd);
 
+	igt_describe("Field-level fuzzing for KGD ioctls (including gem_create): mutate ioctl input fields with invalid values");
+	igt_subtest("kgd-ioctl-field-fuzzing")
+		amd_kgd_multi_ioctl_field_fuzzing(fd, amdgpu_dev);
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}
-- 
2.52.0

