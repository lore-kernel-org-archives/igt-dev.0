Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73017CFD36C
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 02:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D5010E339;
	Tue, 25 Nov 2025 02:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f+qFOCSF";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C53110E339
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 02:03:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swFcc5oGvwUzDH0kRmKG1qkuyfg76vQnhywXSZKVJ7crSsgczX46RqtNVh6r10hhbmBZwmSQRWPfuYuBW13ZNnNQIyWYBjfKYvAaZoQ6xDEf0QPpYucd43N0G/CPtU8Eh0VJZyAk+zKrB8Wk366vnc4n4A4tIl9xJD+0LPtNZvtcbzjDYHfdSQLsPl/YTw5Bx/+PyVHX5lU2Fmu5XL7mC2kTHJcBiF2CYgMFTnHYawRUfXrOQb62kLs+Ni7uq9m2hAaIMwr+GFybPvHwT892ytXl+pjNi2GlXuV/4JVIYVehAz3VqVejdArJcD89TYEOpF3lP6cAHQ4iXY4Q7Z//JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVz2dkb5n6XX223YSF+mN3o2bn1+p9TdwX6w27j6WCM=;
 b=kQzOhKLea/+tC/LgVwVLBUgzcMyYWG85VwRAgoDKlj/kUnCI5tBzh2qC4xokBhnlPgbD8THyKVJOCduqPZqimrKgjrVZdNbPIzkSyZN1KZ6hdBPE5dzQRBEn/upylnQXhjuo0/CkW9QcSLcNtAPpb2v3Fwwhyfeu8MIosXqSpGKh4Xhdis3U54+F++b2NGd01GvieGlxZ+FWz/Cp2UjbOWF9ER84qes4nlNSrHEl6RIn0pxhslt1CVPrtIZfEB+SmC7HpPWBz9v4xcrWBi6HKUozejxL5yI4l96BE293WcLKNrCYJpdEfzLL0ikEfnpDr5IItrJio5ORRTabhirDaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVz2dkb5n6XX223YSF+mN3o2bn1+p9TdwX6w27j6WCM=;
 b=f+qFOCSFL6OzVMJG7jqJuEAeiAouHQwm4TXU+5LHzfMMzMz8+rxV8LSKyUDw5uyEkL7sW81Ur0QtiMFmWXRrwhhYjIKpn0CLPs/NSJolGAzQG/1VHdbXKz57OujKUqPy/Z7gbqTXu4JlJFmRWJJob3+s8jDd3CAltbk5Iob7l40=
Received: from CY5PR22CA0035.namprd22.prod.outlook.com (2603:10b6:930:1d::11)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Tue, 25 Nov
 2025 02:03:36 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:1d:cafe::c3) by CY5PR22CA0035.outlook.office365.com
 (2603:10b6:930:1d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Tue,
 25 Nov 2025 02:03:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 02:03:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 24 Nov
 2025 20:03:35 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Nov
 2025 20:03:34 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 24 Nov 2025 18:03:28 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t 5/6] lib/amdgpu: add AMDGPU LLVM assembler utility for
 shader compilation
Date: Tue, 25 Nov 2025 09:59:50 +0800
Message-ID: <20251125020304.2898626-5-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125020304.2898626-1-Jesse.Zhang@amd.com>
References: <20251125020304.2898626-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b550d12-7c7e-4b07-7a3e-08de2bc6d824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z5wGHLcUUPpNP7F7691W823YotbzS6dnSzZnCZKh2KGW3QjITj0u88oT2k+4?=
 =?us-ascii?Q?Vq78dmf3GRKisE5XL4ieetxKbwJ2iWd1H1p0bl+/Uq/UvwC4NLcr2li3AtMm?=
 =?us-ascii?Q?ncavzmkyH3hjgAkr8K4v8L/vjd7tz1eNUa2WKkA2dou/vJ++PwNZJt303+X+?=
 =?us-ascii?Q?KUN7cT5fJWHuPc69Tqg7DhEjXfS8hR+TNHxfhD4G/BjpgSym4ursZM9/9AWY?=
 =?us-ascii?Q?FotFQhJtOyg9dLD2I2mSzkdNeX7TnqpNJtCykrJXX95RvcIQGHTGeQics8WP?=
 =?us-ascii?Q?ooYxoeNR+bxK6khPpcxZigZ/Kwvg76e4OwOufkiSv5yR9ZUVLMO3YRaFbCuQ?=
 =?us-ascii?Q?2X13L+1hnH0HYLFjqQlf/ZtqDprbKlY4XjOWbc3aPhaOmn3LdeU+H6AWP+eX?=
 =?us-ascii?Q?kCmL7hHhqcCo//U1A5IwDmxnb3WHCvdymvY5BxhtSPeF0BnNR4r3v5folZ9o?=
 =?us-ascii?Q?x5XNXV7xcHVZRy0Igmin7GsonR55ecVqlIXhnhWGNNU0VivAqoX/ng8fb918?=
 =?us-ascii?Q?Li6tq0ZQZj/3ZfVse32nXpeQQlaX1+YuxXhXCfJ+Cob7uTxJPdbBJFJZ+EUJ?=
 =?us-ascii?Q?SzotdJe8+/88BQ4VRxvJ4gUZhhgW/SKWyCa8QvDf6JGsXUMbZmKIgsQhWabE?=
 =?us-ascii?Q?vbdbVTZQQaf7sZup/bCnkArP7Me9v3RrXevsKZVLheK36zg1d0DAWFPajEBO?=
 =?us-ascii?Q?i33ezEHpia9a+EDA3WqhsourdAo6mu0FQuF2zddSH8TrPgUfAKqTX4lzUTcw?=
 =?us-ascii?Q?hqrZ6GuTNmF8XnbMsegLSNj/YGL4ZwBs2dl7dKiBNXGvq6VoEnEurng1n1sH?=
 =?us-ascii?Q?TRSw5hNQICKl63zm/68w5XFJT6GHsv0MGlrZYSOV0TokwzYMdDEg89KCOBax?=
 =?us-ascii?Q?jCmY3sbE9heOpbTZizi+l8pHq+GF/6q44QVufOHwAp3Cj10iAN9yWm/0cPpS?=
 =?us-ascii?Q?UUodxf6UqAeekH1qnJHIXP5SM1SlesDXks3jVYuKzPcU2vEjw1kXLeIITNn+?=
 =?us-ascii?Q?lWkmTM6mudmV7Vvlcp6QXTBbzejonc/hbciuIBeS+V0uExSj9mP2hQB9K+gw?=
 =?us-ascii?Q?DEqV1d8OUujEBr1RVC0b+Meli14TyL8qMSB1Nj9G0YAb3Zxt6gCFYsx+Nhn0?=
 =?us-ascii?Q?72Xblldmq8nuHlE3yTvHO9pXF/WlTnIKWKLpxIaDhd+92cj01jL8ijCPveO6?=
 =?us-ascii?Q?vE6O+GOj0JsF+ysI8N7andXOVdx4SgJmQOtT9+GMUYwUmgo2REGLfw3wC8tT?=
 =?us-ascii?Q?aCW5tbg6kH5b9zhbxygzRk2nrNBAxX7lb62FL0L+d2FA+N3lycmvEDXwE30c?=
 =?us-ascii?Q?PbdYiXFDAlfBnVZANcC/XOqdR8DWUn7juGZPV+/5tyRlWbP/dm7wamOuNzmC?=
 =?us-ascii?Q?bPZBEiWHrDND+3MBiVuVL43YcX1kCtL+F/WJ+WkI7YWXjl4sg7Kx36Uqu7gv?=
 =?us-ascii?Q?tzfJxzIISSLpzl0cN/TXp0NeCHU82knRCju9F0xytL1i9MTQfrqRjT4TPpc+?=
 =?us-ascii?Q?tEnGnOIXYi4uJXPayMhARIGQ+pYC/C3mqqDXu069lYAzAdmjGlm099uOKl0V?=
 =?us-ascii?Q?jN+u8qeNH4JpFRM2LZA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 02:03:36.2118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b550d12-7c7e-4b07-7a3e-08de2bc6d824
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859
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

Implement a reusable LLVM-based assembler utility to compile AMDGPU ISA (In=
struction Set Architecture)
text into binary machine code, enabling on-the-fly shader compilation for G=
PU verification tests.

Key features:
1. LLVM-mc discovery:
   - find_llvm_mc(): Searches common paths (ROCM, system, local) for llvm-m=
c executable
   - Tracks availability via global state to avoid repeated searches
   - Supports fallback paths including $HOME/tmp for temp files

2. Architecture support:
   - amdgpu_format_mcpu(): Generates mcpu string (e.g., gfx1200) from major=
/minor/step version
   - amdgpu_family_id_to_mcpu(): Maps GPU family ID to representative mcpu =
baseline (covers GFX8-GFX12)

3. Assembler workflow:
   - Creates temporary ISA text file and object file (supports /tmp, /var/t=
mp, $HOME/tmp)
   - Invokes llvm-mc with amdgcn-amd-amdhsa triple and target mcpu
   - Parses ELF object file to extract .text section (compiled shader binar=
y)
   - Cleans up temporary files and resources automatically

4. Integration hooks:
   - amdgpu_llvm_asm_init(): Initializes utility and checks llvm-mc availab=
ility
   - amdgpu_llvm_asm_shutdown(): No-op shutdown hook for consistent API
   - amdgpu_llvm_assemble(): Core function for ISA -> binary compilation

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_llvm_asm.c      |  216 ++++++
 lib/amdgpu/amd_llvm_asm.h      |   43 ++
 lib/amdgpu/amd_llvm_asm_stub.c |   33 +
 lib/amdgpu/amd_shader_store.h  | 1206 ++++++++++++++++++++++++++++++++
 lib/meson.build                |   11 +
 5 files changed, 1509 insertions(+)
 create mode 100644 lib/amdgpu/amd_llvm_asm.c
 create mode 100644 lib/amdgpu/amd_llvm_asm.h
 create mode 100644 lib/amdgpu/amd_llvm_asm_stub.c
 create mode 100644 lib/amdgpu/amd_shader_store.h

diff --git a/lib/amdgpu/amd_llvm_asm.c b/lib/amdgpu/amd_llvm_asm.c
new file mode 100644
index 000000000..a45489336
--- /dev/null
+++ b/lib/amdgpu/amd_llvm_asm.c
@@ -0,0 +1,216 @@
+/* SPDX-License-Identifier: MIT */
+/* minimal runtime ISA assembly via external llvm-mc (optional) */
+#include "amd_llvm_asm.h"
+#include "amdgpu_asic_addr.h"
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <elf.h>
+
+/* track llvm-mc availability */
+static int llvm_mc_available;
+static char llvm_mc_path[256];
+
+static int find_llvm_mc(void)
+{
+    const char *candidates[] =3D {
+	"/opt/rocm/llvm/bin/llvm-mc",
+	"/usr/bin/llvm-mc",
+	"/usr/local/bin/llvm-mc",
+	NULL
+    };
+    size_t i;
+
+    fprintf(stderr, "amdgpu_llvm_asm: searching llvm-mc\n");
+    for (i =3D 0; candidates[i] !=3D NULL; i++) {
+	fprintf(stderr, "amdgpu_llvm_asm: check %s -> ", candidates[i]);
+	if (access(candidates[i], X_OK) =3D=3D 0) {
+	    fprintf(stderr, "found\n");
+	    snprintf(llvm_mc_path, sizeof(llvm_mc_path), "%s", candidates[i]);
+	return 1;
+	} else {
+	    fprintf(stderr, "not found (errno=3D%d)\n", errno);
+	}
+    }
+    fprintf(stderr, "amdgpu_llvm_asm: llvm-mc not found\n");
+    return 0;
+}
+
+int amdgpu_llvm_asm_init(void)
+{
+    if (!llvm_mc_available)
+	llvm_mc_available =3D find_llvm_mc();
+    return llvm_mc_available ? 0 : -ENOTSUP;
+}
+
+/* shutdown hook (noop) */
+void amdgpu_llvm_asm_shutdown(void)
+{
+    /* No dynamic resources to free */
+}
+
+/* format mcpu string from major/minor/step */
+void amdgpu_format_mcpu(unsigned int major, unsigned int minor, unsigned i=
nt step,
+			char *dst, size_t dst_size)
+{
+    if (!dst || dst_size < 8)
+	return;
+    snprintf(dst, dst_size, "gfx%u%u%x", major, minor, step & 0xFF);
+}
+
+/* map family_id to representative mcpu baseline */
+int amdgpu_family_id_to_mcpu(uint32_t family_id, char *dst, size_t dst_siz=
e)
+{
+    if (!dst || dst_size < 8)
+	return -EINVAL;
+    switch (family_id) {
+    case FAMILY_GFX1200: snprintf(dst, dst_size, "gfx1200"); break;
+    case FAMILY_GFX1150: snprintf(dst, dst_size, "gfx1150"); break;
+    case FAMILY_GFX1103: snprintf(dst, dst_size, "gfx1103"); break;
+    case FAMILY_GFX1100: snprintf(dst, dst_size, "gfx1100"); break;
+    case FAMILY_GFX1037: snprintf(dst, dst_size, "gfx1037"); break;
+    case FAMILY_GFX1036: snprintf(dst, dst_size, "gfx1036"); break;
+    case FAMILY_NV:      snprintf(dst, dst_size, "gfx1030"); break; /* RDN=
A baseline */
+    case FAMILY_AI:      snprintf(dst, dst_size, "gfx900");  break; /* Veg=
a baseline */
+    default:             snprintf(dst, dst_size, "gfx803");  break; /* GCN=
 fallback */
+    }
+    return 0;
+}
+
+int amdgpu_llvm_assemble(const char *mcpu,
+			 const char *isa_text,
+			 uint8_t *out_buf,
+			 size_t out_buf_size,
+			 size_t *out_size)
+{
+    int fd_src =3D -1, fd_obj =3D -1;
+    int r =3D 0;
+    ssize_t wlen;
+    char cmd[1024];
+    FILE *f;
+    long sz;
+    uint8_t *obj_data =3D NULL;
+    const Elf64_Ehdr *eh;
+    const Elf64_Shdr *sh_base;
+    const Elf64_Shdr *sh_str;
+    const char *strtab;
+    const Elf64_Shdr *text_sec =3D NULL;
+    int i;
+    char src_path[256];
+    char obj_path[256];
+    char template_buf[256];
+    const char *dirs[3];
+    int d;
+
+    if (!out_size)
+	return -EINVAL;
+    *out_size =3D 0;
+    if (!mcpu || !isa_text || !out_buf)
+	return -EINVAL;
+    if (!llvm_mc_available && amdgpu_llvm_asm_init())
+	return -ENOTSUP;
+
+    dirs[0] =3D "/tmp";
+    dirs[1] =3D "/var/tmp";
+    dirs[2] =3D NULL;
+    /* Try to add $HOME/tmp if exists */
+    {
+	const char *home =3D getenv("HOME");
+
+	if (home) {
+	struct stat st;
+	    char home_try[256];
+
+	    snprintf(home_try, sizeof(home_try), "%s/tmp", home);
+	if (stat(home_try, &st) =3D=3D 0 && S_ISDIR(st.st_mode)) {
+		dirs[2] =3D home_try; /* Override last slot */
+	}
+	}
+    }
+
+    fd_src =3D -1;
+    for (d =3D 0; dirs[d] !=3D NULL; ++d) {
+	snprintf(template_buf, sizeof(template_buf), "%s/amdgpu_isaXXXXXX", dirs[=
d]);
+	fd_src =3D mkstemp(template_buf);
+	if (fd_src >=3D 0) {
+	    /* Use mkstemp-created file directly (extension not required) */
+	    strncpy(src_path, template_buf, sizeof(src_path));
+	    src_path[sizeof(src_path)-1] =3D '\0';
+	break;
+	}
+    }
+    if (fd_src < 0)
+	return -errno;
+
+    wlen =3D write(fd_src, isa_text, strlen(isa_text));
+    if (wlen < 0 || (size_t)wlen !=3D strlen(isa_text)) {
+	r =3D -EIO;
+	goto cleanup;
+    }
+    close(fd_src); fd_src =3D -1;
+
+    /* Create object temp file */
+    for (d =3D 0; dirs[d] !=3D NULL; ++d) {
+	snprintf(template_buf, sizeof(template_buf), "%s/amdgpu_objXXXXXX", dirs[=
d]);
+	fd_obj =3D mkstemp(template_buf);
+	if (fd_obj >=3D 0) {
+	    strncpy(obj_path, template_buf, sizeof(obj_path));
+	    obj_path[sizeof(obj_path)-1] =3D '\0';
+	break;
+	}
+    }
+    if (fd_obj < 0) { r =3D -errno; goto cleanup; }
+    close(fd_obj); fd_obj =3D -1;
+
+    snprintf(cmd, sizeof(cmd),
+	     "%s -triple amdgcn-amd-amdhsa -mcpu=3D%s -filetype=3Dobj %s -o %s 2>=
/dev/null",
+	     llvm_mc_path, mcpu, src_path, obj_path);
+    r =3D system(cmd);
+    if (r !=3D 0) { r =3D -EFAULT; goto cleanup; }
+
+    f =3D fopen(obj_path, "rb");
+    if (!f) { r =3D -errno; goto cleanup; }
+    if (fseek(f, 0, SEEK_END) !=3D 0) { fclose(f); r =3D -EIO; goto cleanu=
p; }
+    sz =3D ftell(f);
+    if (sz < 0) { fclose(f); r =3D -EIO; goto cleanup; }
+    rewind(f);
+    obj_data =3D malloc(sz);
+    if (!obj_data) { fclose(f); r =3D -ENOMEM; goto cleanup; }
+    if (fread(obj_data, 1, sz, f) !=3D (size_t)sz) { free(obj_data); fclos=
e(f); r =3D -EIO; goto cleanup; }
+    fclose(f);
+
+    if ((size_t)sz < sizeof(Elf64_Ehdr)) { r =3D -EINVAL; goto cleanup; }
+    eh =3D (const Elf64_Ehdr *)obj_data;
+    if (eh->e_ident[0] !=3D 0x7f || eh->e_ident[1] !=3D 'E') { r =3D -EINV=
AL; goto cleanup; }
+    sh_base =3D (const Elf64_Shdr *)(obj_data + eh->e_shoff);
+    sh_str  =3D &sh_base[eh->e_shstrndx];
+    strtab =3D (const char *)(obj_data + sh_str->sh_offset);
+    for (i =3D 0; i < (int)eh->e_shnum; i++) {
+	const Elf64_Shdr *sec =3D &sh_base[i];
+	const char *name =3D strtab + sec->sh_name;
+
+	if (strcmp(name, ".text") =3D=3D 0) { text_sec =3D sec; break; }
+    }
+    if (!text_sec) { r =3D -EINVAL; goto cleanup; }
+    if (text_sec->sh_size > out_buf_size) { r =3D -ENOSPC; goto cleanup; }
+    memcpy(out_buf, obj_data + text_sec->sh_offset, text_sec->sh_size);
+    *out_size =3D text_sec->sh_size;
+
+cleanup:
+    if (fd_src >=3D 0)
+	close(fd_src);
+    if (fd_obj >=3D 0)
+	close(fd_obj);
+    if (src_path[0])
+	unlink(src_path);
+    if (obj_path[0])
+	unlink(obj_path);
+    if (obj_data)
+	free(obj_data);
+    return r;
+}
diff --git a/lib/amdgpu/amd_llvm_asm.h b/lib/amdgpu/amd_llvm_asm.h
new file mode 100644
index 000000000..fd2975de6
--- /dev/null
+++ b/lib/amdgpu/amd_llvm_asm.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: MIT=0D
+ * Runtime AMDGPU ISA assembler interface using LLVM MC (optional).=0D
+ * If LLVM development libraries are not available at build time this=0D
+ * header still exists but the implementation will be a stub and all=0D
+ * entry points return -ENOTSUP.=0D
+ */=0D
+#ifndef AMD_LLVM_ASM_H=0D
+#define AMD_LLVM_ASM_H=0D
+=0D
+#include <stddef.h>=0D
+#include <stdint.h>=0D
+=0D
+/* Initialize LLVM target tables required for AMDGPU assembly.=0D
+ * Returns 0 on success, negative errno on failure. Safe to call multiple =
times. */=0D
+int amdgpu_llvm_asm_init(void);=0D
+=0D
+/* Shutdown / release any static LLVM state (optional). */=0D
+void amdgpu_llvm_asm_shutdown(void);=0D
+=0D
+/* Assemble the given textual ISA (AMDGPU GCN) for the provided MCPU targe=
t.=0D
+ * mcpu example: "gfx942", "gfx1100" etc.=0D
+ * out_buf: destination buffer for raw .text bytes=0D
+ * out_buf_size: capacity of out_buf=0D
+ * out_size: filled with number of bytes written on success=0D
+ * Returns 0 on success, -ENOSPC if buffer too small, -EINVAL for bad inpu=
t,=0D
+ * -ENOTSUP if LLVM support not compiled in, or other negative errno on MC=
 failure.=0D
+ */=0D
+int amdgpu_llvm_assemble(const char *mcpu,=0D
+                         const char *isa_text,=0D
+                         uint8_t *out_buf,=0D
+                         size_t out_buf_size,=0D
+                         size_t *out_size);=0D
+=0D
+/* Convenience: derive mcpu string from (major, minor, stepping) triplet. =
*/=0D
+void amdgpu_format_mcpu(unsigned major, unsigned minor, unsigned step,=0D
+                        char *dst, size_t dst_size);=0D
+=0D
+/* Map drm/amdgpu_query_gpu_info family_id to a suitable mcpu target.=0D
+ * Fills dst with an mcpu like "gfx1200"; falls back to "gfx803" if unknow=
n.=0D
+ * Returns 0 on success. */=0D
+int amdgpu_family_id_to_mcpu(uint32_t family_id, char *dst, size_t dst_siz=
e);=0D
+=0D
+#endif /* AMD_LLVM_ASM_H */=0D
diff --git a/lib/amdgpu/amd_llvm_asm_stub.c b/lib/amdgpu/amd_llvm_asm_stub.c
new file mode 100644
index 000000000..a5677b5aa
--- /dev/null
+++ b/lib/amdgpu/amd_llvm_asm_stub.c
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/* Stub implementation used when LLVM dev libraries are not present. */
+#include "amd_llvm_asm.h"
+#include <errno.h>
+#include <stdio.h>
+
+int amdgpu_llvm_asm_init(void)
+{
+    return -ENOTSUP; /* signals feature unavailable */
+}
+
+void amdgpu_llvm_asm_shutdown(void)
+{
+}
+
+int amdgpu_llvm_assemble(const char *mcpu,
+			 const char *isa_text,
+			 uint8_t *out_buf,
+			 size_t out_buf_size,
+			 size_t *out_size)
+{
+    (void)mcpu; (void)isa_text; (void)out_buf; (void)out_buf_size; (void)o=
ut_size;
+    return -ENOTSUP;
+}
+
+void amdgpu_format_mcpu(unsigned int major, unsigned int minor, unsigned i=
nt step,
+			char *dst, size_t dst_size)
+{
+    if (!dst || dst_size < 8)
+	return;
+    /* Format gfx<major><minor><hexstep> similar to KFD assembler */
+    snprintf(dst, dst_size, "gfx%u%u%x", major, minor, step & 0xFF);
+}
diff --git a/lib/amdgpu/amd_shader_store.h b/lib/amdgpu/amd_shader_store.h
new file mode 100644
index 000000000..6d2879120
--- /dev/null
+++ b/lib/amdgpu/amd_shader_store.h
@@ -0,0 +1,1206 @@
+/*
+ * Copyright (C) 2021 Advanced Micro Devices, Inc. All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software=
"),
+ * to deal in the Software without restriction, including without limitati=
on
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef _AMD_SHADER_STORE_H_
+#define _AMD_SHADER_STORE_H_
+
+/**
+ * KFDASMTest List
+ */
+#if 0
+const char *shader_store[SHADER_COUNT] =3D {
+    NoopIsa,
+    CopyDwordIsa,
+    InfiniteLoopIsa,
+    AtomicIncIsa,
+    ScratchCopyDwordIsa,
+    PollMemoryIsa,
+    CopyOnSignalIsa,
+    PollAndCopyIsa,
+    WriteFlagAndValueIsa,
+    WriteAndSignalIsa,
+    LoopIsa,
+    PersistentIterateIsa,
+    ReadMemoryIsa,
+    GwsInitIsa,
+    GwsAtomicIncreaseIsa,
+    CheckCuMaskIsa,
+    NULL
+}
+#endif
+
+/**
+ * Macros
+ */
+
+#define SHADER_START ".text\n"
+
+/* Macros for portable v_add_co_u32, v_add_co_ci_u32,
+ * and v_cmp_lt_u32.
+ */
+#define SHADER_MACROS_U32 \
+    "   .text\n"\
+    "   .macro V_ADD_CO_U32 vdst, src0, vsrc1\n"\
+    "       .if (.amdgcn.gfx_generation_number >=3D 10)\n"\
+    "           v_add_co_u32        \\vdst, vcc_lo, \\src0, \\vsrc1\n"\
+    "       .elseif (.amdgcn.gfx_generation_number >=3D 9)\n"\
+    "           v_add_co_u32        \\vdst, vcc, \\src0, \\vsrc1\n"\
+    "       .else\n"\
+    "           v_add_u32           \\vdst, vcc, \\src0, \\vsrc1\n"\
+    "       .endif\n"\
+    "   .endm\n"\
+    "   .macro V_ADD_CO_CI_U32 vdst, src0, vsrc1\n"\
+    "       .if (.amdgcn.gfx_generation_number >=3D 10)\n"\
+    "           v_add_co_ci_u32     \\vdst, vcc_lo, \\src0, \\vsrc1, vcc_l=
o\n"\
+    "       .elseif (.amdgcn.gfx_generation_number >=3D 9)\n"\
+    "           v_addc_co_u32       \\vdst, vcc, \\src0, \\vsrc1, vcc\n"\
+    "       .else\n"\
+    "           v_addc_u32          \\vdst, vcc, \\src0, \\vsrc1, vcc\n"\
+    "       .endif\n"\
+    "   .endm\n"\
+    "   .macro V_CMP_LT_U32 src0, vsrc1\n"\
+    "       .if (.amdgcn.gfx_generation_number >=3D 10)\n"\
+    "           v_cmp_lt_u32        vcc_lo, \\src0, \\vsrc1\n"\
+    "       .else\n"\
+    "           v_cmp_lt_u32        vcc, \\src0, \\vsrc1\n"\
+    "       .endif\n"\
+    "   .endm\n"\
+    "   .macro V_CMP_EQ_U32 src0, vsrc1\n"\
+    "       .if (.amdgcn.gfx_generation_number >=3D 10)\n"\
+    "           v_cmp_eq_u32        vcc_lo, \\src0, \\vsrc1\n"\
+    "       .else\n"\
+    "           v_cmp_eq_u32        vcc, \\src0, \\vsrc1\n"\
+    "       .endif\n"\
+    "   .endm\n"
+
+/* Macros for portable flat load/store/atomic instructions.
+ *
+ * gc943 (gfx94x) deprecates glc/slc in favour of nt/sc1/sc0.
+ * The below macros when used will always use the nt sc1 sc0
+ * modifiers for gfx94x, but also take in arg0 arg1 to specify
+ * (for non-gfx94x): glc, slc, or glc slc.
+ */
+#define SHADER_MACROS_FLAT \
+    "   .macro FLAT_LOAD_DWORD_NSS vdst, vaddr arg0 arg1\n"\
+    "       .if (.amdgcn.gfx_generation_number =3D=3D 9 && .amdgcn.gfx_gen=
eration_minor >=3D 4)\n"\
+    "           flat_load_dword \\vdst, \\vaddr nt sc1 sc0\n"\
+    "       .else\n"\
+    "           flat_load_dword \\vdst, \\vaddr \\arg0 \\arg1\n"\
+    "       .endif\n"\
+    "   .endm\n"\
+    "   .macro FLAT_LOAD_DWORDX2_NSS vdst, vaddr arg0 arg1\n"\
+    "       .if (.amdgcn.gfx_generation_number =3D=3D 9 && .amdgcn.gfx_gen=
eration_minor >=3D 4)\n"\
+    "           flat_load_dwordx2 \\vdst, \\vaddr nt sc1 sc0\n"\
+    "       .else\n"\
+    "           flat_load_dwordx2 \\vdst, \\vaddr \\arg0 \\arg1\n"\
+    "       .endif\n"\
+    "   .endm\n"\
+    "   .macro FLAT_STORE_DWORD_NSS vaddr, vsrc arg0 arg1\n"\
+    "       .if (.amdgcn.gfx_generation_number =3D=3D 9 && .amdgcn.gfx_gen=
eration_minor >=3D 4)\n"\
+    "           flat_store_dword \\vaddr, \\vsrc nt sc1 sc0\n"\
+    "       .else\n"\
+    "           flat_store_dword \\vaddr, \\vsrc \\arg0 \\arg1\n"\
+    "       .endif\n"\
+    "   .endm\n"\
+    "   .macro FLAT_ATOMIC_ADD_NSS vdst, vaddr, vsrc arg0 arg1\n"\
+    "       .if (.amdgcn.gfx_generation_number =3D=3D 9 && .amdgcn.gfx_gen=
eration_minor >=3D 4)\n"\
+    "           flat_atomic_add \\vdst, \\vaddr, \\vsrc nt sc1 sc0\n"\
+    "       .else\n"\
+    "           flat_atomic_add \\vdst, \\vaddr, \\vsrc \\arg0 \\arg1\n"\
+    "       .endif\n"\
+    "   .endm\n"
+
+/**
+ * Common
+ */
+
+static const char NoopIsa[] =3D
+    SHADER_START
+    R"(
+        s_endpgm
+)";
+static const char CopyDwordIsa[] =3D
+    SHADER_START
+    SHADER_MACROS_FLAT
+    R"(
+        v_mov_b32 v0, s0
+        v_mov_b32 v1, s1
+        v_mov_b32 v2, s2
+        v_mov_b32 v3, s3
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            FLAT_LOAD_DWORD_NSS v4, v[0:1] scope:SCOPE_SYS
+            s_wait_loadcnt 0
+            FLAT_STORE_DWORD_NSS v[2:3], v4 scope:SCOPE_SYS
+        .else
+            FLAT_LOAD_DWORD_NSS v4, v[0:1] glc slc
+            s_waitcnt 0
+            FLAT_STORE_DWORD_NSS v[2:3], v4 glc slc
+        .endif
+        s_endpgm
+)";
+
+static const char InfiniteLoopIsa[] =3D
+    SHADER_START
+    R"(
+        .text
+        LOOP:
+        s_nop 0x10
+        s_branch LOOP
+        s_endpgm
+)";
+
+static const char AtomicIncIsa[] =3D
+    SHADER_START
+    SHADER_MACROS_FLAT
+    R"(
+        v_mov_b32 v0, s0
+        v_mov_b32 v1, s1
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            v_mov_b32 v2, 1
+            FLAT_ATOMIC_ADD_NSS v3, v[0:1], v2 scope:SCOPE_SYS th:TH_ATOMI=
C_RETURN
+        .elseif (.amdgcn.gfx_generation_number >=3D 8)
+            v_mov_b32 v2, 1
+            FLAT_ATOMIC_ADD_NSS v3, v[0:1], v2 glc slc
+        .else
+            v_mov_b32 v2, -1
+            flat_atomic_inc v3, v[0:1], v2 glc slc
+        .endif
+        s_endpgm
+)";
+
+/**
+ * KFDMemoryTest
+ */
+
+static const char ScratchCopyDwordIsa[] =3D
+    SHADER_START
+    SHADER_MACROS_FLAT
+    R"(
+        // Copy the parameters from scalar registers to vector registers
+        .if (.amdgcn.gfx_generation_number >=3D 9)
+            v_mov_b32 v0, s0
+            v_mov_b32 v1, s1
+            v_mov_b32 v2, s2
+            v_mov_b32 v3, s3
+        .else
+            v_mov_b32_e32 v0, s0
+            v_mov_b32_e32 v1, s1
+            v_mov_b32_e32 v2, s2
+            v_mov_b32_e32 v3, s3
+        .endif
+
+        // Setup the scratch parameters. This assumes a single 16-reg block
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            s_setreg_b32 hwreg(HW_REG_SCRATCH_BASE_LO), s4
+            s_setreg_b32 hwreg(HW_REG_SCRATCH_BASE_HI), s5
+        .elseif (.amdgcn.gfx_generation_number >=3D 10)
+            s_setreg_b32 hwreg(HW_REG_FLAT_SCR_LO), s4
+            s_setreg_b32 hwreg(HW_REG_FLAT_SCR_HI), s5
+        .elseif (.amdgcn.gfx_generation_number =3D=3D 9)
+            s_mov_b32 flat_scratch_lo, s4
+            s_mov_b32 flat_scratch_hi, s5
+        .else
+            s_mov_b32 flat_scratch_lo, 8
+            s_mov_b32 flat_scratch_hi, 0
+        .endif
+
+        // Copy a dword between the passed addresses
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            FLAT_LOAD_DWORD_NSS v4, v[0:1] scope:SCOPE_SYS
+            s_wait_loadcnt 0
+            FLAT_STORE_DWORD_NSS v[2:3], v4 scope:SCOPE_SYS
+        .else
+            FLAT_LOAD_DWORD_NSS v4, v[0:1] slc
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+            FLAT_STORE_DWORD_NSS v[2:3], v4 slc
+        .endif
+
+        s_endpgm
+)";
+
+/* Continuously poll src buffer and check buffer value
+ * After src buffer is filled with specific value (0x5678,
+ * by host program), fill dst buffer with specific
+ * value(0x5678) and quit
+ */
+static const char PollMemoryIsa[] =3D
+    SHADER_START
+    R"(
+        // Assume src address in s0, s1, and dst address in s2, s3
+        s_movk_i32 s18, 0x5678
+        .if (.amdgcn.gfx_generation_number >=3D 10)
+            v_mov_b32 v0, s2
+            v_mov_b32 v1, s3
+            v_mov_b32 v2, 0x5678
+        .endif
+        LOOP:
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            s_load_dword s16, s[0:1], 0x0 scope:SCOPE_SYS
+        .else
+            s_load_dword s16, s[0:1], 0x0 glc
+        .endif
+        s_cmp_eq_i32 s16, s18
+        s_cbranch_scc0   LOOP
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            flat_store_dword v[0:1], v2 scope:SCOPE_SYS
+        .elseif (.amdgcn.gfx_generation_number >=3D 10)
+            flat_store_dword v[0:1], v2 slc
+        .else
+            s_store_dword s18, s[2:3], 0x0 glc
+        .endif
+        s_endpgm
+)";
+
+/* Similar to PollMemoryIsa except that the buffer
+ * polled can be Non-coherant memory. SCC system-level
+ * cache coherence is not supported in scalar (smem) path.
+ * Use vmem operations with scc
+ */
+static const char PollNCMemoryIsa[] =3D
+    SHADER_START
+    R"(
+        // Assume src address in s0, s1, and dst address in s2, s3
+        v_mov_b32 v6, 0x5678
+        v_mov_b32 v0, s0
+        v_mov_b32 v1, s1
+        LOOP:
+        flat_load_dword v4, v[0:1] scc
+        v_cmp_eq_u32 vcc, v4, v6
+        s_cbranch_vccz   LOOP
+        v_mov_b32 v0, s2
+        v_mov_b32 v1, s3
+        flat_store_dword v[0:1], v6 scc
+        s_endpgm
+)";
+
+/* Input: A buffer of at least 3 dwords.
+ * DW0: used as a signal. 0xcafe means it is signaled
+ * DW1: Input buffer for device to read.
+ * DW2: Output buffer for device to write.
+ * Once receive signal, device will copy DW1 to DW2
+ * This shader continously poll the signal buffer,
+ * Once signal buffer is signaled, it copies input buffer
+ * to output buffer
+ */
+static const char CopyOnSignalIsa[] =3D
+    SHADER_START
+    R"(
+        // Assume input buffer in s0, s1
+        .if (.amdgcn.gfx_generation_number >=3D 10)
+            s_add_u32 s2, s0, 0x8
+            s_addc_u32 s3, s1, 0x0
+            s_mov_b32 s18, 0xcafe
+            v_mov_b32 v0, s0
+            v_mov_b32 v1, s1
+            v_mov_b32 v4, s2
+            v_mov_b32 v5, s3
+        .else
+            s_mov_b32 s18, 0xcafe
+        .endif
+
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+
+            POLLSIGNAL:
+            s_load_dword s16, s[0:1], 0x0 scope:SCOPE_SYS
+            s_cmp_eq_i32 s16, s18
+            s_cbranch_scc0   POLLSIGNAL
+
+            s_load_dword s17, s[0:1], 0x4 scope:SCOPE_SYS
+            s_wait_kmcnt 0
+
+            v_mov_b32 v2, s17
+            flat_store_dword v[4:5], v2 scope:SCOPE_SYS
+        .else
+
+            POLLSIGNAL:
+            s_load_dword s16, s[0:1], 0x0 glc
+            s_cmp_eq_i32 s16, s18
+            s_cbranch_scc0   POLLSIGNAL
+
+            s_load_dword s17, s[0:1], 0x4 glc
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+            .if (.amdgcn.gfx_generation_number >=3D 10)
+                v_mov_b32 v2, s17
+                flat_store_dword v[4:5], v2 glc
+            .else
+                s_store_dword s17, s[0:1], 0x8 glc
+            .endif
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+
+        .endif
+        s_endpgm
+)";
+
+/* Continuously poll the flag at src buffer
+ * After the flag of s[0:1] is 1 filled,
+ * copy the value from s[0:1]+4 to dst buffer
+ *
+ * Note: Only works on GFX9 (only used in
+ *       aldebaran tests)
+ */
+static const char PollAndCopyIsa[] =3D
+    SHADER_START
+    SHADER_MACROS_FLAT
+    R"(
+        // Assume src buffer in s[0:1] and dst buffer in s[2:3]
+        // Path for Aldebaran, Aqua Vanjaram
+        .if (.amdgcn.gfx_generation_number =3D=3D 9 && (.amdgcn.gfx_genera=
tion_minor >=3D 4 || .amdgcn.gfx_generation_stepping =3D=3D 10))
+            v_mov_b32 v0, s0
+            v_mov_b32 v1, s1
+            v_mov_b32 v18, 0x1
+            LOOP0:
+            FLAT_LOAD_DWORD_NSS v16, v[0:1] glc
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+            v_cmp_eq_i32 vcc, v16, v18
+            s_cbranch_vccz LOOP0
+            .if (.amdgcn.gfx_generation_minor >=3D 4)
+                buffer_inv sc1 sc0
+            .else
+                buffer_invl2
+            .endif
+            s_load_dword s17, s[0:1], 0x4 glc
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+            s_store_dword s17, s[2:3], 0x0 glc
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+            buffer_wbl2
+        .elseif (.amdgcn.gfx_generation_number =3D=3D 9)
+            s_movk_i32 s18, 0x1
+            LOOP1:
+            s_load_dword s16, s[0:1], 0x0 glc
+            s_cmp_eq_i32 s16, s18
+            s_cbranch_scc0 LOOP1
+            s_load_dword s17, s[0:1], 0x4 glc
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+            s_store_dword s17, s[2:3], 0x0 glc
+        .endif
+        s_waitcnt vmcnt(0) & lgkmcnt(0)
+        s_endpgm
+)";
+
+/* Input0: A buffer of at least 2 dwords.
+ * DW0: used as a signal. Write 0x1 to signal
+ * DW1: Write the value from 2nd input buffer
+ *      for other device to read.
+ * Input1: A buffer of at least 2 dwords.
+ * DW0: used as the value to be written.
+ *
+ * Note: Only works on Aldebaran and Aqua Vanjaram
+ */
+static const char WriteFlagAndValueIsa[] =3D
+    SHADER_START
+    SHADER_MACROS_FLAT
+    R"(
+        // Assume two inputs buffer in s[0:1] and s[2:3]
+        .if (.amdgcn.gfx_generation_number =3D=3D 9 && (.amdgcn.gfx_genera=
tion_minor >=3D 4 || .amdgcn.gfx_generation_stepping =3D=3D 10))
+            v_mov_b32 v0, s0
+            v_mov_b32 v1, s1
+            s_load_dword s18, s[2:3], 0x0 glc
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+            s_store_dword s18, s[0:1], 0x4 glc
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+            buffer_wbl2
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+            v_mov_b32 v16, 0x1
+            FLAT_STORE_DWORD_NSS v[0:1], v16 glc
+        .endif
+        s_endpgm
+)";
+
+/* Input0: A buffer of at least 2 dwords.
+ * DW0: used as a signal. Write 0xcafe to signal
+ * DW1: Write to this buffer for other device to read.
+ * Input1: mmio base address
+ */
+static const char WriteAndSignalIsa[] =3D
+    SHADER_START
+    R"(
+        // Assume input buffer in s0, s1
+        .if (.amdgcn.gfx_generation_number >=3D 10)
+            s_add_u32 s4, s0, 0x4
+            s_addc_u32 s5, s1, 0x0
+            v_mov_b32 v0, s0
+            v_mov_b32 v1, s1
+            v_mov_b32 v2, s2
+            v_mov_b32 v3, s3
+            v_mov_b32 v4, s4
+            v_mov_b32 v5, s5
+            .if (.amdgcn.gfx_generation_number >=3D 12)
+                v_mov_b32 v18, 0xbeef
+                flat_store_dword v[4:5], v18 scope:SCOPE_SYS
+                v_mov_b32 v18, 0x1
+                flat_store_dword v[2:3], v18 scope:SCOPE_SYS
+                v_mov_b32 v18, 0xcafe
+                flat_store_dword v[0:1], v18 scope:SCOPE_SYS
+            .else
+                v_mov_b32 v18, 0xbeef
+                flat_store_dword v[4:5], v18 glc
+                v_mov_b32 v18, 0x1
+                flat_store_dword v[2:3], v18 glc
+                v_mov_b32 v18, 0xcafe
+                flat_store_dword v[0:1], v18 glc
+            .endif
+        .else
+            s_mov_b32 s18, 0xbeef
+            s_store_dword s18, s[0:1], 0x4 glc
+            s_mov_b32 s18, 0x1
+            s_store_dword s18, s[2:3], 0 glc
+            s_mov_b32 s18, 0xcafe
+            s_store_dword s18, s[0:1], 0x0 glc
+        .endif
+        s_endpgm
+)";
+
+/* Input:
+ * s[0:1], A buffer of at least 64 * 6 bytes
+ *
+ * Store the value 0x77 at the 5 addresses 0x40,
+ * 0x80, ..., 0x140 in the buffer
+ *
+ * Aqua Vanjaram only
+ */
+static const char FlushBufferForAcquireReleaseIsa[] =3D
+    SHADER_START
+    R"(
+        .if (.amdgcn.gfx_generation_number =3D=3D 9 && .amdgcn.gfx_generat=
ion_minor >=3D 4)
+            s_mov_b32 s11, 0x77
+            s_mov_b32 s12, 0x0
+            // Store some data on 5 different cache lines
+            s_store_dword s12, s[0:1], 0x0 glc
+            s_store_dword s11, s[0:1], 0x40 glc
+            s_store_dword s11, s[0:1], 0x80 glc
+            s_store_dword s11, s[0:1], 0xc0 glc
+            s_store_dword s11, s[0:1], 0x100 glc
+            s_store_dword s11, s[0:1], 0x140 glc
+            s_waitcnt lgkmcnt(0)
+        .endif
+        s_endpgm
+)";
+
+/* Input:
+ * s[0:1], A buffer of at least 64 * 6 bytes,
+ * shared with the acquiring shader
+ *
+ * Store the values 1 - 5 at the 5 addresses 0x40,
+ * 0x80, ..., 0x140 in the buffer, then signal
+ * the flag at address 0x0 in the buffer.
+ *
+ * Uses vector stores
+ *
+ * Aqua Vanjaram only
+ */
+static const char WriteReleaseVectorIsa[] =3D
+    SHADER_START
+    R"(
+        .if (.amdgcn.gfx_generation_number =3D=3D 9 && .amdgcn.gfx_generat=
ion_minor >=3D 4)
+            v_mov_b32 v11, 0x1
+            v_mov_b32 v12, 0x2
+            v_mov_b32 v13, 0x3
+            v_mov_b32 v14, 0x4
+            v_mov_b32 v15, 0x5
+            v_mov_b32 v21, 0x40
+            v_mov_b32 v22, 0x80
+            v_mov_b32 v23, 0xc0
+            v_mov_b32 v24, 0x100
+            v_mov_b32 v25, 0x140
+            // Store some data on 5 different cache lines
+            global_store_dword v21, v11, s[0:1]
+            global_store_dword v22, v12, s[0:1]
+            global_store_dword v23, v13, s[0:1]
+            global_store_dword v24, v14, s[0:1]
+            global_store_dword v25, v15, s[0:1] nt sc1 sc0
+            s_waitcnt vmcnt(0)
+            // Write-Release
+            s_mov_b32 s16, 0x1
+            buffer_wbl2 sc1 sc0
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+            s_store_dword s16, s[0:1], 0x0 glc
+        .endif
+        s_endpgm
+)";
+
+/* Input:
+ * s[0:1], A buffer of at least 64 * 6 bytes,
+ * shared with the acquiring shader
+ *
+ * Store the values 6 - 10 at the 5 addresses 0x40,
+ * 0x80, ..., 0x140 in the buffer, then signal
+ * the flag at address 0x0 in the buffer.
+ *
+ * Uses scalar stores
+ *
+ * Aqua Vanjaram only
+ */
+static const char WriteReleaseScalarIsa[] =3D
+    SHADER_START
+    R"(
+        .if (.amdgcn.gfx_generation_number =3D=3D 9 && .amdgcn.gfx_generat=
ion_minor >=3D 4)
+            s_mov_b32 s11, 0x6
+            s_mov_b32 s12, 0x7
+            s_mov_b32 s13, 0x8
+            s_mov_b32 s14, 0x9
+            s_mov_b32 s15, 0xa
+            // Store some data on 5 different cache lines
+            s_store_dword s11, s[0:1], 0x40
+            s_store_dword s12, s[0:1], 0x80
+            s_store_dword s13, s[0:1], 0xc0
+            s_store_dword s14, s[0:1], 0x100
+            s_store_dword s15, s[0:1], 0x140 glc
+            s_waitcnt lgkmcnt(0)
+            // Write-Release
+            s_dcache_wb // WB Scalar L1 cache
+            s_mov_b32 s16, 0x1
+            buffer_wbl2 sc1 sc0
+            s_waitcnt vmcnt(0) & lgkmcnt(0)
+            s_store_dword s16, s[0:1], 0x0 glc
+            s_waitcnt lgkmcnt(0)
+        .endif
+        s_endpgm
+)";
+
+/* Input:
+ * s[0:1], A buffer of at least 64 * 6 bytes,
+ * shared with the releasing shader
+ * s[2:3], A buffer of at least 64 * 6 bytes,
+ * accessible by the CPU, used for output
+ *
+ * Polls the flag at address 0x0 in the shared buffer.
+ * When the signal is received, read the values
+ * at the 5 addresses 0x40, 0x80, ... 0x140,
+ * and store them at the same locations in
+ * the output buffer
+ *
+ * Uses vector loads
+ *
+ * Aqua Vanjaram only
+ */
+static const char ReadAcquireVectorIsa[] =3D
+    SHADER_START
+    R"(
+        .if (.amdgcn.gfx_generation_number =3D=3D 9 && .amdgcn.gfx_generat=
ion_minor >=3D 4)
+            // Read-Acquire
+            s_mov_b32 s18, 0x1
+            LOOP:
+            s_load_dword s17, s[0:1], 0x0 glc
+            s_waitcnt lgkmcnt(0)
+            s_cmp_eq_i32 s17, s18
+            s_cbranch_scc0 LOOP
+            buffer_inv sc1 sc0
+            // Load data
+            v_mov_b32 v21, 0x40
+            v_mov_b32 v22, 0x80
+            v_mov_b32 v23, 0xc0
+            v_mov_b32 v24, 0x100
+            v_mov_b32 v25, 0x140
+            global_load_dword v11, v21, s[0:1]
+            global_load_dword v12, v22, s[0:1]
+            global_load_dword v13, v23, s[0:1]
+            global_load_dword v14, v24, s[0:1]
+            global_load_dword v15, v25, s[0:1]
+            s_waitcnt vmcnt(0)
+            // Store data for output
+            v_mov_b32 v21, 0x40
+            v_mov_b32 v22, 0x80
+            v_mov_b32 v23, 0xc0
+            v_mov_b32 v24, 0x100
+            v_mov_b32 v25, 0x140
+            global_store_dword v21, v11, s[2:3] nt sc1 sc0
+            global_store_dword v22, v12, s[2:3] nt sc1 sc0
+            global_store_dword v23, v13, s[2:3] nt sc1 sc0
+            global_store_dword v24, v14, s[2:3] nt sc1 sc0
+            global_store_dword v25, v15, s[2:3] nt sc1 sc0
+            s_waitcnt vmcnt(0)
+        .endif
+        s_endpgm
+)";
+
+/* Input:
+ * s[0:1], A buffer of at least 64 * 6 bytes,
+ * shared with the releasing shader
+ * s[2:3], A buffer of at least 64 * 6 bytes,
+ * accessible by the CPU, used for output
+ *
+ * Polls the flag at address 0x0 in the shared buffer.
+ * When the signal is received, read the values
+ * at the 5 addresses 0x40, 0x80, ... 0x140,
+ * and store them at the same locations in
+ * the output buffer
+ *
+ * Uses scalar loads
+ *
+ * Aqua Vanjaram only
+ */
+static const char ReadAcquireScalarIsa[] =3D
+    SHADER_START
+    R"(
+        .if (.amdgcn.gfx_generation_number =3D=3D 9 && .amdgcn.gfx_generat=
ion_minor >=3D 4)
+            // Read-Acquire
+            s_mov_b32 s18, 0x1
+            LOOP:
+            s_load_dword s17, s[0:1], 0x0 glc
+            s_waitcnt lgkmcnt(0)
+            s_cmp_eq_i32 s17, s18
+            s_cbranch_scc0 LOOP
+            buffer_inv sc1 sc0
+            // Load data
+            s_load_dword s21, s[0:1], 0x40
+            s_load_dword s22, s[0:1], 0x80
+            s_load_dword s23, s[0:1], 0xc0
+            s_load_dword s24, s[0:1], 0x100
+            s_load_dword s25, s[0:1], 0x140
+            s_waitcnt lgkmcnt(0)
+            // Store data for output
+            s_store_dword s21, s[2:3], 0x40 glc
+            s_store_dword s22, s[2:3], 0x80 glc
+            s_store_dword s23, s[2:3], 0xc0 glc
+            s_store_dword s24, s[2:3], 0x100 glc
+            s_store_dword s25, s[2:3], 0x140 glc
+            s_waitcnt lgkmcnt(0)
+        .endif
+        s_endpgm
+)";
+
+/**
+ * KFDQMTest
+ */
+
+/* A simple isa loop program with dense mathematic operations
+ * s1 controls the number iterations of the loop
+ * This shader can be used by GFX8, GFX9 and GFX10
+ */
+static const char LoopIsa[] =3D
+    SHADER_START
+    R"(
+        s_movk_i32    s0, 0x0008
+        s_movk_i32    s1, 0x00ff
+        s_mov_b32     s4, 0
+        s_mov_b32     s5, 0
+        s_mov_b32     s6, 0
+        s_mov_b32     s7, 0
+        s_mov_b32     s12, 0
+        s_mov_b32     s13, 0
+        s_mov_b32     s14, 0
+        s_mov_b32     s15, 0
+        v_mov_b32     v0, 0
+        v_mov_b32     v1, 0
+        v_mov_b32     v2, 0
+        v_mov_b32     v3, 0
+        v_mov_b32     v4, 0
+        v_mov_b32     v5, 0
+        v_mov_b32     v6, 0
+        v_mov_b32     v7, 0
+        v_mov_b32     v8, 0
+        v_mov_b32     v9, 0
+        v_mov_b32     v10, 0
+        v_mov_b32     v11, 0
+        v_mov_b32     v12, 0
+        v_mov_b32     v13, 0
+        v_mov_b32     v14, 0
+        v_mov_b32     v15, 0
+        v_mov_b32     v16, 0
+        LOOP:
+        s_mov_b32     s8, s4
+        s_mov_b32     s9, s1
+        s_mov_b32     s10, s6
+        s_mov_b32     s11, s7
+        s_cmp_le_i32  s1, s0
+        s_cbranch_scc1  END_OF_PGM
+        v_add_f32     v0, 2.0, v0
+        v_cvt_f32_i32 v17, s1
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            s_wait_dscnt     0
+            s_wait_kmcnt     0
+        .else
+            s_waitcnt lgkmcnt(0)
+        .endif
+        v_add_f32     v18, s8, v17
+        v_add_f32     v19, s9, v17
+        v_add_f32     v20, s10, v17
+        v_add_f32     v21, s11, v17
+        v_add_f32     v22, s12, v17
+        v_add_f32     v23, s13, v17
+        v_add_f32     v24, s14, v17
+        v_add_f32     v17, s15, v17
+        v_log_f32     v25, v18
+        v_mul_f32     v25, v22, v25
+        v_exp_f32     v25, v25
+        v_log_f32     v26, v19
+        v_mul_f32     v26, v23, v26
+        v_exp_f32     v26, v26
+        v_log_f32     v27, v20
+        v_mul_f32     v27, v24, v27
+        v_exp_f32     v27, v27
+        v_log_f32     v28, v21
+        v_mul_f32     v28, v17, v28
+        v_exp_f32     v28, v28
+        v_add_f32     v5, v5, v25
+        v_add_f32     v6, v6, v26
+        v_add_f32     v7, v7, v27
+        v_add_f32     v8, v8, v28
+        v_mul_f32     v18, 0x3fb8aa3b, v18
+        v_exp_f32     v18, v18
+        v_mul_f32     v19, 0x3fb8aa3b, v19
+        v_exp_f32     v19, v19
+        v_mul_f32     v20, 0x3fb8aa3b, v20
+        v_exp_f32     v20, v20
+        v_mul_f32     v21, 0x3fb8aa3b, v21
+        v_exp_f32     v21, v21
+        v_add_f32     v9, v9, v18
+        v_add_f32     v10, v10, v19
+        v_add_f32     v11, v11, v20
+        v_add_f32     v12, v12, v21
+        v_sqrt_f32    v18, v22
+        v_sqrt_f32    v19, v23
+        v_sqrt_f32    v20, v24
+        v_sqrt_f32    v21, v17
+        v_add_f32     v13, v13, v18
+        v_add_f32     v14, v14, v19
+        v_add_f32     v15, v15, v20
+        v_add_f32     v16, v16, v21
+        v_rsq_f32     v18, v22
+        v_rsq_f32     v19, v23
+        v_rsq_f32     v20, v24
+        v_rsq_f32     v17, v17
+        v_add_f32     v1, v1, v18
+        v_add_f32     v2, v2, v19
+        v_add_f32     v3, v3, v20
+        v_add_f32     v4, v4, v17
+        s_add_u32     s0, s0, 1
+        s_branch      LOOP
+        END_OF_PGM:
+        s_endpgm
+)";
+
+
+/**
+ * KFDCWSRTest
+ */
+
+/* Initial state:
+ *   s[0:1] - input buffer base address
+ *   s[2:3] - output buffer base address
+ *   s4 - workgroup id
+ *   v0 - workitem id
+ * Registers:
+ *   v0 - calculated workitem =3D v0 + s4 * NUM_THREADS_X, which is s4
+ *   v[4:5] - corresponding output buf address: s[2:3] + v0 * 4
+ *   v6 - register storing known-value output for mangle testing
+ *   v7 - counter
+ */
+static const char PersistentIterateIsa[] =3D
+    SHADER_START
+    SHADER_MACROS_U32
+    SHADER_MACROS_FLAT
+    R"(
+        // Compute address of output buffer
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            v_mov_b32               v0, ttmp9   // use workgroup id as ind=
ex
+        .else
+            v_mov_b32               v0, s4      // use workgroup id as ind=
ex
+        .endif
+        v_lshlrev_b32           v0, 2, v0       // v0 *=3D 4
+        V_ADD_CO_U32            v4, s2, v0      // v[4:5] =3D s[2:3] + v0 =
* 4
+        v_mov_b32               v5, s3          // v[4:5] =3D s[2:3] + v0 =
* 4
+        V_ADD_CO_CI_U32         v5, v5, 0       // v[4:5] =3D s[2:3] + v0 =
* 4
+
+        // Store known-value output in register
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            FLAT_LOAD_DWORD_NSS     v6, v[4:5] scope:SCOPE_SYS
+            s_wait_loadcnt 0                        // wait for memory rea=
ds to finish
+        .else
+            FLAT_LOAD_DWORD_NSS     v6, v[4:5] glc
+            s_waitcnt vmcnt(0) & lgkmcnt(0)         // wait for memory rea=
ds to finish
+        .endif
+
+        // Initialize counter
+        v_mov_b32               v7, 0
+
+        LOOP:
+        flat_store_dword        v[4:5], v6      // store known-val in outp=
ut
+        V_ADD_CO_U32            v7, 1, v7       // increment counter
+
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            s_load_dword            s6, s[0:1], 0 scope:SCOPE_SYS
+            s_wait_loadcnt 0                        // wait for memory rea=
ds to finish
+        .else
+            s_load_dword            s6, s[0:1], 0 glc
+            s_waitcnt vmcnt(0) & lgkmcnt(0)         // wait for memory rea=
ds to finish
+        .endif
+        s_cmp_eq_i32            s6, 0x12345678  // compare input buf to st=
opval
+        s_cbranch_scc1          L_QUIT          // branch if notified to q=
uit by host
+
+        s_branch LOOP
+
+        L_QUIT:
+        s_endpgm
+)";
+
+/**
+ * KFDEvictTest
+ */
+
+/* Shader to read local buffers using multiple wavefronts in parallel
+ * until address buffer is filled with specific value 0x5678 by host progr=
am,
+ * then each wavefront fills value 0x5678 at corresponding result buffer a=
nd quit
+ *
+ * Initial state:
+ *   s[0:1]   - address buffer base address
+ *   s[2:3]   - result buffer base address
+ *   s4/ttmp9 - workgroup id (in s4 pre-GFX12, in ttmp9 on GFX12)
+ *   v0       - workitem id, always 0 because NUM_THREADS_X(number of thre=
ads) in workgroup set to 1
+ * Registers:
+ *   v0 - calculated workitem id, v0 =3D v0 + s4 * NUM_THREADS_X
+ *   v[2:3] - address of corresponding local buf address offset: s[0:1] + =
v0 * 8
+ *   v[4:5] - corresponding output buf address: s[2:3] + v0 * 4
+ *   v[6:7] - local buf address used for read test
+ *   v11 - size of local buffer in MB
+ */
+static const char ReadMemoryIsa[] =3D
+    SHADER_START
+    SHADER_MACROS_U32
+    SHADER_MACROS_FLAT
+    R"(
+        // Compute address of corresponding output buffer
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            v_mov_b32           v0, ttmp9       // use workgroup id as ind=
ex
+        .else
+            v_mov_b32           v0, s4          // use workgroup id as ind=
ex
+        .endif
+        v_lshlrev_b32           v0, 2, v0       // v0 *=3D 4
+        V_ADD_CO_U32            v4, s2, v0      // v[4:5] =3D s[2:3] + v0 =
* 4
+        v_mov_b32               v5, s3          // v[4:5] =3D s[2:3] + v0 =
* 4
+        V_ADD_CO_CI_U32         v5, v5, 0       // v[4:5] =3D s[2:3] + v0 =
* 4
+
+        // Compute input buffer offset used to store corresponding local b=
uffer address
+        v_lshlrev_b32           v0, 1, v0       // v0 *=3D 8
+        V_ADD_CO_U32            v2, s0, v0      // v[2:3] =3D s[0:1] + v0 =
* 8
+        v_mov_b32               v3, s1          // v[2:3] =3D s[0:1] + v0 =
* 8
+        V_ADD_CO_CI_U32         v3, v3, 0       // v[2:3] =3D s[0:1] + v0 =
* 8
+
+        // Load local buffer size from output buffer
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            FLAT_LOAD_DWORD_NSS     v11, v[4:5] scope:SCOPE_DEV
+        .else
+            FLAT_LOAD_DWORD_NSS     v11, v[4:5] slc
+        .endif
+
+        // Load 64bit local buffer address stored at v[2:3] to v[6:7]
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            FLAT_LOAD_DWORDX2_NSS   v[6:7], v[2:3] scope:SCOPE_DEV
+            s_wait_loadcnt 0
+        .else
+            FLAT_LOAD_DWORDX2_NSS   v[6:7], v[2:3] slc
+            s_waitcnt vmcnt(0) & lgkmcnt(0)         // wait for memory rea=
ds to finish
+        .endif
+        v_mov_b32               v8, 0x5678
+        s_movk_i32              s8, 0x5678
+        L_REPEAT:
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            s_load_dword        s16, s[0:1], 0x0 scope:SCOPE_SYS
+            s_wait_kmcnt        0                      // wait for memory =
reads to finish
+        .else
+            s_load_dword        s16, s[0:1], 0x0 glc
+            s_waitcnt           vmcnt(0) & lgkmcnt(0)  // wait for memory =
reads to finish
+        .endif
+        s_cmp_eq_i32            s16, s8
+        s_cbranch_scc1          L_QUIT          // if notified to quit by =
host
+
+        // Loop read local buffer starting at v[6:7]
+        // every 4k page only read once
+        v_mov_b32               v9, 0
+        v_mov_b32               v10, 0x1000     // 4k page
+        v_mov_b32               v12, v6
+        v_mov_b32               v13, v7
+        L_LOOP_READ:
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            FLAT_LOAD_DWORDX2_NSS   v[14:15], v[12:13] scope:SCOPE_DEV
+        .else
+            FLAT_LOAD_DWORDX2_NSS   v[14:15], v[12:13] slc
+        .endif
+        V_ADD_CO_U32            v9, v9, v10
+        V_ADD_CO_U32            v12, v12, v10
+        V_ADD_CO_CI_U32         v13, v13, 0
+        V_CMP_LT_U32            v9, v11
+        s_cbranch_vccnz         L_LOOP_READ
+        s_branch                L_REPEAT
+        L_QUIT:
+        flat_store_dword        v[4:5], v8
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            s_wait_storecnt     0
+        .else
+            s_waitcnt vmcnt(0) & lgkmcnt(0)         // wait for memory wri=
tes to finish
+        .endif
+        s_endpgm
+)";
+
+/**
+ * KFDGWSTest
+ */
+
+/* Shader to initialize gws counter to 1 */
+static const char GwsInitIsa[] =3D
+    SHADER_START
+    R"(
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+        .else
+            s_mov_b32 m0, 0
+            s_nop 0
+            s_load_dword s16, s[0:1], 0x0 glc
+            s_waitcnt 0
+            v_mov_b32 v0, s16
+            s_waitcnt 0
+            ds_gws_init v0 offset:0 gds
+            s_waitcnt 0
+            s_endpgm
+        .endif
+)";
+
+/* Atomically increase a value in memory
+ * This is expected to be executed from
+ * multiple work groups simultaneously.
+ * GWS semaphore is used to guarantee
+ * the operation is atomic.
+ */
+static const char GwsAtomicIncreaseIsa[] =3D
+    SHADER_START
+    R"(
+        // Assume src address in s0, s1
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+        .elseif (.amdgcn.gfx_generation_number >=3D 10)
+            s_mov_b32 m0, 0
+            s_mov_b32 exec_lo, 0x1
+            v_mov_b32 v0, s0
+            v_mov_b32 v1, s1
+            ds_gws_sema_p offset:0 gds
+            s_waitcnt 0
+            flat_load_dword v2, v[0:1] glc dlc
+            s_waitcnt 0
+            v_add_nc_u32 v2, v2, 1
+            flat_store_dword v[0:1], v2
+            s_waitcnt_vscnt null, 0
+            ds_gws_sema_v offset:0 gds
+        .else
+            s_mov_b32 m0, 0
+            s_nop 0
+            ds_gws_sema_p offset:0 gds
+            s_waitcnt 0
+            s_load_dword s16, s[0:1], 0x0 glc
+            s_waitcnt 0
+            s_add_u32 s16, s16, 1
+            s_store_dword s16, s[0:1], 0x0 glc
+            s_waitcnt lgkmcnt(0)
+            ds_gws_sema_v offset:0 gds
+        .endif
+        s_waitcnt 0
+        s_endpgm
+)";
+
+
+/*
+ * Shader used by ExtendedCuMasking test case to check if CU mask is used =
correctly.
+ *
+ * Shader will write to output buffer the (SE, SA, WGP) used by the wave.
+ * The test program will then analyse the data.
+ *
+ * Inputs
+ * ------
+ * s[2:3]  : output buffer base address
+ * s4/ttmp9: workgroup id (s4 for pre-GFX12, ttmp9 for GFX12)
+ *
+ * Output
+ * ------
+ * Store HW_ID1 content in output buffer at index corresponding to workgro=
up id.
+ *
+ */
+static const char CheckCuMaskIsa[] =3D
+    SHADER_START
+    SHADER_MACROS_U32
+    SHADER_MACROS_FLAT
+    R"(
+        // Get workgroup id
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            v_mov_b32    v0, ttmp9
+        .else
+            v_mov_b32    v0, s4
+        .endif
+
+        // Address of output buffer element: v[4:5] =3D s[2:3] + v0 * 4
+        v_lshlrev_b32    v6, 2, v0
+        V_ADD_CO_U32     v4, s2, v6
+        v_mov_b32        v5, s3
+        V_ADD_CO_CI_U32  v5, v5, 0
+
+        // Store HW_ID1 content
+        .if (.amdgcn.gfx_generation_number >=3D 12)
+            s_getreg_b32     s6, hwreg(HW_REG_HW_ID1)
+        .else
+            s_getreg_b32     s6, hwreg(HW_REG_HW_ID)
+        .endif
+        v_mov_b32        v1, s6
+        flat_store_dword v[4:5], v1
+
+        s_endpgm
+)";
+
+
+static const char JumpToTrapIsa[] =3D
+    SHADER_START
+    SHADER_MACROS_U32
+    R"(
+        /*copy the parameters from scalar registers to vector registers*/
+        v_mov_b32 v4, 0
+        v_mov_b32 v0, s0
+        v_mov_b32 v1, s1
+        s_trap 1
+        EXIT_LOOP:
+        V_CMP_EQ_U32 v4, 0
+        s_cbranch_vccnz EXIT_LOOP
+        flat_store_dword v[0:1], v4
+        s_waitcnt vmcnt(0)&lgkmcnt(0)
+        s_endpgm
+)";
+
+static const char TrapHandlerIsa[] =3D
+    SHADER_START
+    R"(
+        CHECK_VMFAULT:
+        /*if trap jumped to by vmfault, restore skip m0 signalling*/
+        .if (.amdgcn.gfx_generation_number < 12)
+            s_getreg_b32 ttmp14, hwreg(HW_REG_TRAPSTS)
+            s_and_b32 ttmp2, ttmp14, 0x800
+        .else
+            s_getreg_b32 ttmp14, hwreg(HW_REG_EXCP_FLAG_PRIV)
+            s_and_b32 ttmp2, ttmp14, 0x10
+        .endif
+        s_cbranch_scc1 RESTORE_AND_EXIT
+        /*check for address watch event and record pc check point delta*/
+        .if (.amdgcn.gfx_generation_number < 12)
+            s_and_b32 ttmp2, ttmp14, 0x7080
+        .else
+            s_and_b32 ttmp2, ttmp14, 0xf
+        .endif
+        s_cbranch_scc0 GET_DOORBELL
+        v_mov_b32 v5, v4 // capture watch checkpoint
+        v_mov_b32 v6, ttmp14 // capture watch trapsts
+        s_branch RESTORE_AND_EXIT
+        GET_DOORBELL:
+        .if .amdgcn.gfx_generation_number < 11
+            s_mov_b32 ttmp2, exec_lo
+            s_mov_b32 ttmp3, exec_hi
+            s_mov_b32 exec_lo, 0x80000000
+            s_sendmsg 10
+            WAIT_SENDMSG:
+            /*wait until msb is cleared (i.e. doorbell fetched)*/
+            s_nop 7
+            s_bitcmp0_b32 exec_lo, 0x1F
+            s_cbranch_scc0 WAIT_SENDMSG
+            /* restore exec */
+            s_mov_b32 exec_hi, ttmp3
+            s_and_b32 exec_lo, exec_lo, 0xfff
+            s_mov_b32 ttmp3, exec_lo
+            s_mov_b32 exec_lo, ttmp2
+        .else
+            s_sendmsg_rtn_b32 ttmp3, sendmsg(MSG_RTN_GET_DOORBELL)
+            s_waitcnt lgkmcnt(0)
+            s_and_b32 ttmp3, ttmp3, 0x3ff
+        .endif
+        s_mov_b32 ttmp2, m0
+        s_or_b32 ttmp3, ttmp3, 0x800
+        /* set m0, send interrupt and restore m0 and exit trap*/
+        s_mov_b32 m0, ttmp3
+        s_nop 0x0
+        s_sendmsg sendmsg(MSG_INTERRUPT)
+        s_waitcnt lgkmcnt(0)
+        s_mov_b32 m0, ttmp2
+        v_mov_b32 v4, ttmp1
+        /* restore and increment program counter to skip shader trap jump*/
+        s_add_u32 ttmp0, ttmp0, 4
+        s_addc_u32 ttmp1, ttmp1, 0
+        s_and_b32 ttmp1, ttmp1, 0xffff
+        RESTORE_AND_EXIT:
+        /* restore SQ_WAVE_IB_STS */
+        s_lshr_b32 ttmp2, ttmp11, (26 - 15)
+        s_and_b32 ttmp2, ttmp2, (0x8000 | 0x1F0000)
+        s_setreg_b32 hwreg(HW_REG_IB_STS), ttmp2
+        /* restore SQ_WAVE_STATUS */
+        s_and_b64 exec, exec, exec
+        s_and_b64 vcc, vcc, vcc
+        s_setreg_b32 hwreg(HW_REG_STATUS), ttmp12
+        s_rfe_b64 [ttmp0, ttmp1]
+)";
+
+#define WATCH_START SHADER_START SHADER_MACROS_U32\
+    "v_mov_b32 v0, s0\n"\
+    "v_mov_b32 v1, s1\n"\
+    "v_mov_b32 v2, s2\n"\
+    "v_mov_b32 v3, s3\n"\
+    "flat_load_dword v4, v[2:3]\n"\
+    "s_waitcnt vmcnt(0) & lgkmcnt(0)\n"\
+    "v_mov_b32 v5, 0\n"\
+    "v_mov_b32 v6, 0\n"
+
+#define WATCH_END "\n"\
+    "v_mov_b32 v4, 2\n"\
+    "LOOP:\n"\
+    "V_CMP_EQ_U32 v6, 0\n"\
+    "s_cbranch_vccnz LOOP\n"\
+    "V_ADD_CO_U32 v6, v6, v5\n"\
+    "flat_store_dword v[2:3], v6\n"\
+    "s_waitcnt vmcnt(0) & lgkmcnt(0)\n"\
+    "s_endpgm\n"
+
+static const char WatchReadIsa[] =3D
+    WATCH_START
+    "flat_load_dword v7, v[0:1]"
+    WATCH_END;
+
+static const char WatchWriteIsa[] =3D
+    WATCH_START
+    "flat_store_dword v[0:1], v4"
+    WATCH_END;
+
+/* =E5=85=A8=E5=B1=80=E7=9D=80=E8=89=B2=E5=99=A8=E6=95=B0=E7=BB=84: LLVM =
=E6=B1=87=E7=BC=96=E6=B5=8B=E8=AF=95=E4=BD=BF=E7=94=A8 */
+static const char * const amdgpu_test_shaders[] =3D {
+        NoopIsa,
+        CopyDwordIsa,
+        InfiniteLoopIsa,
+        AtomicIncIsa,
+        ScratchCopyDwordIsa,
+        PollMemoryIsa,
+        PollAndCopyIsa,
+        LoopIsa,
+        PersistentIterateIsa,
+        ReadMemoryIsa,
+        CheckCuMaskIsa,
+        //PollNCMemoryIsa,
+        //CopyOnSignalIsa,
+        WriteFlagAndValueIsa,
+        WriteAndSignalIsa,
+        //GwsInitIsa,
+        GwsAtomicIncreaseIsa,
+        JumpToTrapIsa,
+        WatchReadIsa,
+        WatchWriteIsa,
+        NULL
+};
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 707ce6ff9..b4c2b7fd7 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -184,6 +184,17 @@ if libdrm_amdgpu.found()
 		warning('libdrm <=3D 2.4.99 found, amdgpu_cs_query_reset_state2 not appl=
icable')
 	endif
=20
+	# Optional runtime ISA assembly via external llvm-mc tool (no lib depende=
ncy needed)
+	llvm_mc_prog =3D find_program(['llvm-mc-20','llvm-mc-19','llvm-mc-18','ll=
vm-mc'], required : false)
+	if llvm_mc_prog.found()
+		add_project_arguments('-DAMDGPU_LLVM_ENABLED', language : ['c'])
+		lib_sources +=3D ['amdgpu/amd_llvm_asm.c']
+		message('Found ' + llvm_mc_prog.path() + ' enabling runtime AMDGPU ISA a=
ssembly')
+	else
+		lib_sources +=3D ['amdgpu/amd_llvm_asm_stub.c']
+		message('llvm-mc not found: using stub implementation (tests will skip)')
+	endif
+
 	if libdrm_amdgpu.version().version_compare('>=3D 2.4.125')
 		add_project_arguments('-DAMDGPU_USERQ_ENABLED', language: 'c')
 	else
--=20
2.49.0

