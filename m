Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C21ED116F1
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 02:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD0710E03F;
	Tue,  2 Dec 2025 02:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rpa9PQuR";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012065.outbound.protection.outlook.com
 [40.93.195.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA64710E03F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 02:18:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGLe8+ywHztep8DyPPBFbcA1iYdJewaqmY4uP5+e8ZJAdve3nBq0BKpHhzKhpeNds6GWJXXepfQ1P10tcVv8RpPx3xzGb407jJBZjbKtdsx5mVEHk69QhqLYvoUF6oqsOuigeOYK8TyaSJfRMVlit88or0CaBbB9zWMrjUFu5dz3TWw7+OEdme1XE3E1BlWrzvCXlpHhh9m0Wzw5TK5o7mdnYkK6oaMnBDL5LJDDoR9hDmcHjPsOei6y4OuGxEMMMFOXrUA+gwLwUWBIngbjcdauANlxi/3Tcpkc5whio0TPmHg2uxJZeY1AogK/O+m1WGcRlyqb6RvBHvJFzXWuwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lN5gSsboFcG/pCgmzrLqKi2rIo0V27ZYinLn4bMCsg=;
 b=HwpdPKwE6RLUytrTmfs2p73Y/G7j921mWzzQvTPmuL74FA1jkkRRh0xh3AulVZ0fN+SlWrZybWuX2sC7IcWC7fKBPLB9Zh9dKU49cbB7vPMCjZZhViTRoezwTVdPpZVle7LxtfDQ1J7d+swOoaFSdgANyH41EUwNiDPhaP4YkWf0Xv/Kvd/qAS3OAtXmjC59V0DsJdHdEYQMSElWVc/US/09VJcmh3iN/SjwNYtDUzQe42l0KP9aExmEPY/Gs74GckOMDf4qYVK50wl9Z0QBEREi5DEh6fEIYyTSFT4zI7Ns+kcfCW8MSd8mcla9QYIC/rNq8dGCkEmKlMEPtEVDgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lN5gSsboFcG/pCgmzrLqKi2rIo0V27ZYinLn4bMCsg=;
 b=rpa9PQuRFU5D5hrbze0l4pcKM5gkUUeX3OtMCGXn8EwnBr52dkXvzf8RGvpQVuumcS6Or5NXyaG0XtMQVQEGSIVsjln6yA1/yRoY2zd3+0YEEgHxAVY4tdRKeIESOoM8HYAsVVliT3hU2LTqtw72Rn/xq2rjeLcNiujqeAAl4Ww=
Received: from BY3PR05CA0033.namprd05.prod.outlook.com (2603:10b6:a03:39b::8)
 by SA1PR12MB8946.namprd12.prod.outlook.com (2603:10b6:806:375::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:18:34 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::f1) by BY3PR05CA0033.outlook.office365.com
 (2603:10b6:a03:39b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 02:18:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 02:18:33 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 20:18:32 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 1 Dec 2025 18:18:25 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v3 5/6] lib/amdgpu: add AMDGPU LLVM assembler utility
 for shader compilation
Date: Tue, 2 Dec 2025 10:17:28 +0800
Message-ID: <20251202021751.3824352-5-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251202021751.3824352-1-Jesse.Zhang@amd.com>
References: <20251202021751.3824352-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="Y"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|SA1PR12MB8946:EE_
X-MS-Office365-Filtering-Correlation-Id: ebafdb83-6826-45d5-60a3-08de31491801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0HAnZekawUUoO1vFQgGCRuWKDG9KlrmcptWO1RJLr+kWnEvNBaE0aSKan/90?=
 =?us-ascii?Q?uYtheckYcXkC+kluKSU1yJaZM4plZyNnOliHg6ZrjhegSTaZ7MxiQ49+bCcX?=
 =?us-ascii?Q?sJF3eY2Ym1vzoNkhMIn3l+7DO55SKl5XjE4BXI5Y+zUfCH031MJZvc0ElZKe?=
 =?us-ascii?Q?BQxGFwY5A9exUPKsozW99QnEYY608FQhoR6Sd6SzibJ5lVE1aQrV/8/vGcHM?=
 =?us-ascii?Q?5HQPZYmgdPi4qUUstTgG0UWV1Pj0ND73CMYMqu4tgLu7ZDT6Rgu5ipVlnkKw?=
 =?us-ascii?Q?Xc7zmYus27pkwoL4Yr6cNvdc4cbUee9A9d3gMT3Xehw0fbnahBUc3BSuXRHy?=
 =?us-ascii?Q?GIUgd3NLaJyCIf/O/21ClTg9peR0mKhXqPu6Wi4LEWUn89yKpVOJVHjv913W?=
 =?us-ascii?Q?+OxIHh3yDa1z/ol1tkh/EOuYq1TLp+eLckrJC6xNqC++5vy9FuAbNEQ44As+?=
 =?us-ascii?Q?IALyDGwIh5YKZlbuehiOgpiQxI4DInF4bOFvNlEPPi1jhpeO3Jy74KroQc41?=
 =?us-ascii?Q?XXoN4g+Dp/SUN6YKqG7B4Bbmp2z0TjF/wLbMMYYWGu7TWrRAnUFDx4/lpsoX?=
 =?us-ascii?Q?xofeTmpmoidNHgJMWqaEIBCLEkyDLnngmuR6EP5harIkNFhI/aBzdYrpW75g?=
 =?us-ascii?Q?qxzCFWJ9KvREakqe8kpuRKEuCNHu0C/jQ7ydG8eo+I9j5tJw8wcKsViVI7sV?=
 =?us-ascii?Q?O0bbR4uCVHRYW2gajFP5Lr9ImwQs4H+mlHdSM7oztVbRMuRrmJOET9OUiL/2?=
 =?us-ascii?Q?yQ86ZtGqDxwLt3tzMLYoOLdTGzSRtfxzL43yigr19pbGZ+2IDMmrA3P03dyX?=
 =?us-ascii?Q?n5tfxwAnISFzz0pE5+o3tEHcy4o59KLNDIm3Hh4Rk4fSbylII//UpzUscXmB?=
 =?us-ascii?Q?KmG2huT6fREQMu+Ug1VC2zlumzdjFwJAilUTIHxED823UTcKpshwrHed/Vm3?=
 =?us-ascii?Q?evQnX2Q/q59O1CYd65YnH4oMuXBZkl5C2DjQVDTyUeQzQP4llQzUS756Jhe9?=
 =?us-ascii?Q?Iq/RBMsd3x5eA/TqTxo62U4vzDpU5e8xMT3v+EzdcTAA+E9NbGO4upXgDj8K?=
 =?us-ascii?Q?DmWfNhodpLC+hh56FiqXY4BQnH/XjHznC8TnjPoQG7o/2ioxPeIHu2w0r0vK?=
 =?us-ascii?Q?/WdGWuCJPwIPoMNUH+nVCJaaKiPsC1zCSMwVdXHgxs5kN4xUgPm8Kmz+2zzo?=
 =?us-ascii?Q?fuZzyVDrtg8+BEuxtKL2v2xxLSL+SFGAFqHPVv+pTNxE5lOb0/Zj+/FNkTc3?=
 =?us-ascii?Q?CgK1Pdf1R81YZFDQqUeF2NRMCjgzpAkYBwAYseh9WJa6HuWSrQNGP/ZL+fXU?=
 =?us-ascii?Q?ARpa9Ld5wsOi/S0184bZagt+bEWMF+rzjGRlKjGXVT7wi2g/VZiWdB7sCrYO?=
 =?us-ascii?Q?KgN89DHjGLc1KJPJXRbJmiEBCWf0uUQLCJy4zp+U5KfkIeq8xTUxjXXz43IH?=
 =?us-ascii?Q?Rj54V+8diwKaw6KsyyDUvPQhln0GNTcjwTAmc5tnRY1wcpHFJgMd19yiuB4W?=
 =?us-ascii?Q?jqA5+qyY/3FrLseKrISDnvmYaqrUFly1CRs2rhFpT80GNg3il4A3giZ+xqmO?=
 =?us-ascii?Q?nEruWpeUOBpKaAUH4M0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:18:33.6961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebafdb83-6826-45d5-60a3-08de31491801
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8946
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

v2: fix build error when llvm disabled (Vitaly)

Suggested-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/shaders/amd_llvm_asm.c      |  216 ++++
 lib/amdgpu/shaders/amd_llvm_asm.h      |   43 +
 lib/amdgpu/shaders/amd_llvm_asm_stub.c |   37 +
 lib/amdgpu/shaders/amd_llvm_asm_stub.h |   44 +
 lib/amdgpu/shaders/amd_shader_store.h  | 1330 ++++++++++++++++++++++++
 lib/amdgpu/shaders/amd_shaders.c       |  562 ++++++++++
 lib/amdgpu/{ =3D> shaders}/amd_shaders.h |    2 +-
 lib/meson.build                        |   19 +-
 8 files changed, 2248 insertions(+), 5 deletions(-)
 create mode 100644 lib/amdgpu/shaders/amd_llvm_asm.c
 create mode 100644 lib/amdgpu/shaders/amd_llvm_asm.h
 create mode 100644 lib/amdgpu/shaders/amd_llvm_asm_stub.c
 create mode 100644 lib/amdgpu/shaders/amd_llvm_asm_stub.h
 create mode 100644 lib/amdgpu/shaders/amd_shader_store.h
 create mode 100644 lib/amdgpu/shaders/amd_shaders.c
 rename lib/amdgpu/{ =3D> shaders}/amd_shaders.h (96%)

diff --git a/lib/amdgpu/shaders/amd_llvm_asm.c b/lib/amdgpu/shaders/amd_llv=
m_asm.c
new file mode 100644
index 000000000..7433d6691
--- /dev/null
+++ b/lib/amdgpu/shaders/amd_llvm_asm.c
@@ -0,0 +1,216 @@
+/* SPDX-License-Identifier: MIT */
+/* minimal runtime ISA assembly via external llvm-mc (optional) */
+#include "amd_llvm_asm.h"
+#include "lib/amdgpu/amdgpu_asic_addr.h"
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
diff --git a/lib/amdgpu/shaders/amd_llvm_asm.h b/lib/amdgpu/shaders/amd_llv=
m_asm.h
new file mode 100644
index 000000000..fd2975de6
--- /dev/null
+++ b/lib/amdgpu/shaders/amd_llvm_asm.h
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
diff --git a/lib/amdgpu/shaders/amd_llvm_asm_stub.c b/lib/amdgpu/shaders/am=
d_llvm_asm_stub.c
new file mode 100644
index 000000000..c738d3aa9
--- /dev/null
+++ b/lib/amdgpu/shaders/amd_llvm_asm_stub.c
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: MIT */
+/* Stub implementation used when LLVM dev libraries are not present. */
+#include "amd_llvm_asm_stub.h"
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
+void amdgpu_format_mcpu(unsigned int major, unsigned int minor, unsigned i=
nt step,
+			char *dst, size_t dst_size)
+{
+    if (!dst || dst_size < 8)
+	return;
+    /* Format gfx<major><minor><hexstep> similar to KFD assembler */
+    snprintf(dst, dst_size, "gfx%u%u%x", major, minor, step & 0xFF);
+}
+
+int amdgpu_family_id_to_mcpu(uint32_t family_id, char *dst, size_t dst_siz=
e)
+{
+    return -ENOTSUP;
+}
+
+int amdgpu_llvm_assemble(const char *mcpu,
+			 const char *isa_text,
+			 uint8_t *out_buf,
+			 size_t out_buf_size,
+			 size_t *out_size)
+{
+    return -ENOTSUP;
+}
diff --git a/lib/amdgpu/shaders/amd_llvm_asm_stub.h b/lib/amdgpu/shaders/am=
d_llvm_asm_stub.h
new file mode 100644
index 000000000..83dfc5293
--- /dev/null
+++ b/lib/amdgpu/shaders/amd_llvm_asm_stub.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT
+ * Runtime AMDGPU ISA assembler interface using LLVM MC (optional).
+ * If LLVM development libraries are not available at build time this
+ * header still exists but the implementation will be a stub and all
+ * entry points return -ENOTSUP.
+ */
+#ifndef AMD_LLVM_ASM_STUB_H
+#define AMD_LLVM_ASM_STUB_H
+
+#include <stddef.h>
+#include <stdint.h>
+
+/* Initialize LLVM target tables required for AMDGPU assembly.
+ * Returns 0 on success, negative errno on failure. Safe to call multiple =
times. */
+int amdgpu_llvm_asm_init(void);
+
+/* Shutdown / release any static LLVM state (optional). */
+void amdgpu_llvm_asm_shutdown(void);
+
+/* Assemble the given textual ISA (AMDGPU GCN) for the provided MCPU targe=
t.
+ * mcpu example: "gfx942", "gfx1100" etc.
+ * out_buf: destination buffer for raw .text bytes
+ * out_buf_size: capacity of out_buf
+ * out_size: filled with number of bytes written on success
+ * Returns 0 on success, -ENOSPC if buffer too small, -EINVAL for bad inpu=
t,
+ * -ENOTSUP if LLVM support not compiled in, or other negative errno on MC=
 failure.
+ */
+int amdgpu_llvm_assemble(const char *mcpu,
+                         const char *isa_text,
+                         uint8_t *out_buf,
+                         size_t out_buf_size,
+                         size_t *out_size);
+
+/* Convenience: derive mcpu string from (major, minor, stepping) triplet. =
*/
+void amdgpu_format_mcpu(unsigned major, unsigned minor, unsigned step,
+                        char *dst, size_t dst_size);
+
+/* Map drm/amdgpu_query_gpu_info family_id to a suitable mcpu target.
+ * Fills dst with an mcpu like "gfx1200"; falls back to "gfx803" if unknow=
n.
+ * Returns 0 on success. */
+int amdgpu_family_id_to_mcpu(uint32_t family_id, char *dst, size_t dst_siz=
e);
+
+#endif /* AMD_LLVM_ASM_STUB_H */
+
diff --git a/lib/amdgpu/shaders/amd_shader_store.h b/lib/amdgpu/shaders/amd=
_shader_store.h
new file mode 100644
index 000000000..6d04e79d0
--- /dev/null
+++ b/lib/amdgpu/shaders/amd_shader_store.h
@@ -0,0 +1,1330 @@
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
+/* Shader: NoopIsa
+ * Purpose: Minimal shader that immediately terminates.
+ * Inputs: (none)
+ * Side Effects: None.
+ * Pseudo-code:
+ *   void shader_noop(void) {
+ *       // Immediately end program
+ *       return; // s_endpgm
+ *   }
+ */
+static const char NoopIsa[] =3D
+    SHADER_START
+    R"(
+        s_endpgm
+)";
+/* Shader: CopyDwordIsa
+ * Purpose: Load one 32-bit value from address in s[0:1] and store to addr=
ess in s[2:3].
+ * Inputs:
+ *   s[0:1] - source pointer
+ *   s[2:3] - destination pointer
+ * Memory Semantics:
+ *   Uses flat (global) load/store, optionally with system scope (gfx12+) =
or glc/slc flags.
+ * Pseudo-code:
+ *   void shader_copy_dword(uint32_t *dst, const uint32_t *src) {
+ *       uint32_t val =3D *src; // flat load
+ *       *dst =3D val;          // flat store
+ *   }
+ */
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
+/* Shader: InfiniteLoopIsa
+ * Purpose: Busy loop forever (used for hang / timeout tests).
+ * Pseudo-code:
+ *   void shader_infinite_loop(void) {
+ *       for (;;) {
+ *           // delay (s_nop)
+ *       }
+ *   }
+ */
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
+/* Shader: AtomicIncIsa
+ * Purpose: Atomically increment a 32-bit counter at address s[0:1]. Retur=
ns old value (ignored).
+ * Inputs: s[0:1] - pointer to uint32_t counter.
+ * Memory Semantics: Uses atomic add (system scope on gfx12). Ensures atom=
icity across waves.
+ * Pseudo-code:
+ *   void shader_atomic_inc(uint32_t *counter) {
+ *       atomic_fetch_add(counter, 1); // old value unused
+ *   }
+ */
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
+/* Shader: ScratchCopyDwordIsa
+ * Purpose: Configure scratch base registers then copy one dword from s[0:=
1] to s[2:3].
+ * Inputs:
+ *   s[0:1] - source ptr
+ *   s[2:3] - destination ptr
+ *   s[4:5] - scratch base address (architecture-dependent setup)
+ * Scratch Setup: Programs flat scratch base depending on generation.
+ * Pseudo-code:
+ *   void shader_scratch_copy(uint32_t *dst, const uint32_t *src, uint64_t=
 scratch_base) {
+ *       program_scratch_base(scratch_base);
+ *       *dst =3D *src;
+ *   }
+ */
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
+/* Shader: PollMemoryIsa
+ * Purpose: Poll *src until it equals 0x5678, then write 0x5678 to *dst.
+ * Inputs:
+ *   s[0:1] - src address (flag written by host)
+ *   s[2:3] - dst address where result 0x5678 stored
+ * Behavior:
+ *   Loop: load flag; compare; if not matched continue; else store value a=
nd exit.
+ * Pseudo-code:
+ *   void shader_poll_and_write(uint32_t *dst, const uint32_t *src) {
+ *       while (*src !=3D 0x5678) { ; } // busy wait
+ *       *dst =3D 0x5678;
+ *   }
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
+/* Shader: PollNCMemoryIsa
+ * Purpose: Poll a potentially non-coherent memory location (via vector lo=
ad with scc) until value =3D=3D 0x5678; then store 0x5678 to dst.
+ * Rationale: Scalar memory path may not ensure coherence; uses vector loa=
d with scc modifier.
+ * Inputs: s[0:1] src flag, s[2:3] dst address (written after success).
+ * Pseudo-code:
+ *   void shader_poll_nc(uint32_t *dst, const uint32_t *src) {
+ *       while (vector_load(src) !=3D 0x5678) ;
+ *       *dst =3D 0x5678; // store with scc path
+ *   }
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
+/* Shader: CopyOnSignalIsa
+ * Inputs (buffer at s[0:1], size >=3D 3 dwords):
+ *   DW0 flag: host writes 0xcafe to trigger copy
+ *   DW1 value: source value
+ *   DW2 output: destination written when flag observed
+ * Behavior:
+ *   Poll flag until equals 0xcafe then copy DW1 -> DW2.
+ * Pseudo-code:
+ *   void shader_copy_on_signal(uint32_t *buf) {
+ *       while (buf[0] !=3D 0xcafe) { ; }
+ *       buf[2] =3D buf[1];
+ *   }
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
+/* Shader: PollAndCopyIsa
+ * Purpose: Wait for flag at s[0:1] (DW0) to become 1; then copy DW1 (offs=
et +4) into destination s[2:3].
+ * Architecture: GFX9 variants (Aldebaran / Aqua Vanjaram) have cache inva=
lidation & write-back sequence.
+ * Flow:
+ *   spin on flag -> invalidate buffer -> load payload -> store to dst -> =
flush.
+ * Pseudo-code:
+ *   void shader_poll_and_copy(uint32_t *src, uint32_t *dst) {
+ *       while (src[0] !=3D 1) ;
+ *       uint32_t val =3D src[1];
+ *       *dst =3D val;
+ *   }
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
+/* Shader: WriteFlagAndValueIsa
+ * Purpose: Write value from second buffer (Input1 DW0) into first buffer =
DW1, then set first buffer DW0 to 1.
+ * Inputs:
+ *   s[0:1] - buffer A (flag + output value)
+ *   s[2:3] - buffer B (contains value to copy at DW0)
+ * Sequence (gfx9.4+/stepping10): load value -> store to A[1] -> flush -> =
store flag A[0]=3D1.
+ * Pseudo-code:
+ *   void shader_write_flag_value(uint32_t *bufA, uint32_t *bufB) {
+ *       uint32_t val =3D bufB[0];
+ *       bufA[1] =3D val; // ensure visibility
+ *       wb();
+ *       bufA[0] =3D 1;   // signal
+ *   }
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
+/* Shader: WriteAndSignalIsa
+ * Purpose: Fill DW1 with 0xbeef, write MMIO signal (0x1) at s[2:3], then =
flag DW0 with 0xcafe.
+ * Inputs:
+ *   s[0:1] - buffer (DW0 flag, DW1 payload)
+ *   s[2:3] - mmio base (doorbell / signal area)
+ * Flow: write payload -> write mmio signal -> write flag.
+ * Pseudo-code:
+ *   void shader_write_and_signal(uint32_t *buf, uint32_t *mmio) {
+ *       buf[1] =3D 0xbeef;
+ *       *mmio =3D 1; // doorbell
+ *       buf[0] =3D 0xcafe; // completion flag
+ *   }
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
+/* Shader: FlushBufferForAcquireReleaseIsa
+ * Purpose: Populate five cache lines (offsets 0x40..0x140) with 0x77 and =
a flag at 0x0 (0) to prime cache state.
+ * Inputs: s[0:1] - shared buffer (>=3D 64*6 bytes).
+ * Use Case: Prepares data prior to an acquire/release synchronization tes=
t.
+ * Pseudo-code:
+ *   void shader_flush_prepare(uint32_t *buf) {
+ *       buf[0] =3D 0; // flag remains unset
+ *       for (int i=3D0;i<5;i++) buf[(0x40>>2) + i*(0x40>>2)] =3D 0x77;
+ *   }
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
+/* Shader: WriteReleaseVectorIsa
+ * Purpose: Write values {1..5} to five distinct cache-line offsets; perfo=
rm write-release (wb + L2 flush) then set flag at 0x0.
+ * Inputs: s[0:1] - shared buffer with acquiring shader.
+ * Memory Ordering: buffer_wbl2 before flag ensures data visible prior to =
flag store.
+ * Pseudo-code:
+ *   void shader_write_release_vec(uint32_t *shared) {
+ *       shared[0x40/4]=3D1; shared[0x80/4]=3D2; shared[0xC0/4]=3D3; share=
d[0x100/4]=3D4; shared[0x140/4]=3D5;
+ *       write_back(); // release
+ *       shared[0] =3D 1; // flag
+ *   }
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
+/* Shader: WriteReleaseScalarIsa
+ * Purpose: Same as vector variant but uses scalar stores and scalar cache=
 write-back.
+ * Values {6..10} to offsets 0x40..0x140 then release + set flag.
+ * Pseudo-code:
+ *   void shader_write_release_scalar(uint32_t *shared) {
+ *       uint32_t vals[5]=3D{6,7,8,9,10};
+ *       for(int i=3D0;i<5;i++) shared[(0x40>>2)+i*(0x40>>2)] =3D vals[i];
+ *       scalar_dcache_wb(); write_back();
+ *       shared[0] =3D 1;
+ *   }
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
+/* Shader: ReadAcquireVectorIsa
+ * Purpose: Acquire side of release/acquire. Waits for flag=3D=3D1 then in=
validates caches, loads five values and writes them to output buffer.
+ * Inputs:
+ *   s[0:1] shared buffer (writer performed release)
+ *   s[2:3] output buffer (CPU-visible)
+ * Ordering: buffer_inv before loads ensures fresh data; stores use non-te=
mporal sc1 sc0 modifiers.
+ * Pseudo-code:
+ *   void shader_read_acquire_vec(uint32_t *shared, uint32_t *out) {
+ *       while(shared[0]!=3D1); invalidate();
+ *       for(int i=3D0;i<5;i++) {
+ *           unsigned idx =3D (0x40>>2)+i*(0x40>>2);
+ *           out[idx] =3D shared[idx];
+ *       }
+ *   }
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
+/* Shader: ReadAcquireScalarIsa
+ * Purpose: Scalar-load variant of acquire side. Polls flag then invalidat=
es and reads via scalar path, writing results to output buffer.
+ * Pseudo-code:
+ *   void shader_read_acquire_scalar(uint32_t *shared, uint32_t *out) {
+ *       while(shared[0]!=3D1); invalidate();
+ *       for(int i=3D0;i<5;i++) {
+ *           unsigned idx =3D (0x40>>2)+i*(0x40>>2);
+ *           out[idx] =3D shared[idx];
+ *       }
+ *   }
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
+/* Shader: LoopIsa
+ * Purpose: Stress math pipelines by performing iterative transcendental +=
 arithmetic operations.
+ * Inputs: s1 - iteration count. (Others setup constants.)
+ * Registers: v0..v28 used for accumulating and intermediate math.
+ * Pseudo-code (simplified approximation):
+ *   void shader_dense_loop(uint32_t iterations) {
+ *       float accA[4]=3D{0}, accB[4]=3D{0}, accC[4]=3D{0}, accD[4]=3D{0};
+ *       for (uint32_t i=3D0;i<iterations;i++) {
+ *           float f =3D (float)i;
+ *           // Chain of log/exp/sqrt/rsq operations updating accumulators.
+ *           // Real ISA interleaves for latency hiding.
+ *           for(int k=3D0;k<4;k++) {
+ *               float t =3D expf(logf(f + accA[k]) * scale(k));
+ *               accB[k] +=3D t;
+ *               accC[k] +=3D sqrtf(accA[k]);
+ *               accD[k] +=3D 1.0f/sqrtf(accA[k]+1.0f);
+ *           }
+ *       }
+ *   }
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
+/* Shader: PersistentIterateIsa
+ * Purpose: Persistently writes a stable value to per-workgroup output slo=
t until host sets quit flag (0x12345678) in input buffer.
+ * Inputs:
+ *   s[0:1] input buffer (DW0 quit flag location)
+ *   s[2:3] output buffer base
+ *   s4/ttmp9 workgroup id
+ * Behavior:
+ *   Derive per-WG output address -> load initial value -> loop { store va=
lue; increment local counter; check quit flag }.
+ * Pseudo-code:
+ *   void shader_persistent(uint32_t *in, uint32_t *out_base, uint32_t wg_=
id) {
+ *       uint32_t *slot =3D out_base + wg_id; uint32_t val =3D *slot; uint=
32_t ctr=3D0;
+ *       while (in[0] !=3D 0x12345678) { *slot =3D val; ctr++; }
+ *   }
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
+/* Shader: ReadMemoryIsa
+ * Purpose: For each workgroup, repeatedly read pages of a local buffer un=
til host signals completion (flag 0x5678), then write 0x5678 to result slot.
+ * Inputs:
+ *   s[0:1] address buffer: contains per-WG local buffer addresses (64-bit=
 each)
+ *   s[2:3] result buffer: per-WG result slot (DW0 local size MB initially=
; overwritten with 0x5678)
+ *   s4/ttmp9 workgroup id
+ * Flow:
+ *   Compute output slot & pointer to local address; load local address & =
size; repeat: check quit flag; if not set, walk pages (4KB stride) reading;=
 loop.
+ * Pseudo-code:
+ *   void shader_read_mem(uint64_t *addr_buf, uint32_t *res_buf, uint32_t =
wg_id) {
+ *       uint32_t *res_slot =3D res_buf + wg_id; uint32_t size_mb =3D *res=
_slot;
+ *       uint64_t local_addr =3D addr_buf[wg_id];
+ *       while (*(uint32_t*)addr_buf !=3D 0x5678) {
+ *           for (uint64_t off=3D0; off < (uint64_t)size_mb*MB; off+=3D409=
6) {
+ *               volatile uint64_t tmp =3D *(uint64_t*)(local_addr + off);
+ *               (void)tmp;
+ *           }
+ *       }
+ *       *res_slot =3D 0x5678;
+ *   }
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
+/* Shader: GwsInitIsa
+ * Purpose: Initialize a GDS (Global Data Share) semaphore/counter via ds_=
gws_init.
+ * Inputs: s[0:1] base address (may hold initial data).
+ * Limited to pre-GFX12 path.
+ * Pseudo-code:
+ *   void shader_gws_init(uint32_t *addr) { gws_init(addr[0]); }
+ */
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
+/* Shader: GwsAtomicIncreaseIsa
+ * Purpose: Perform atomic increment protected by GWS semaphore across wor=
kgroups.
+ * Inputs: s[0:1] pointer to shared counter.
+ * Flow: acquire semaphore -> load -> increment -> store -> release.
+ * Pseudo-code:
+ *   void shader_gws_atomic_inc(uint32_t *counter) {
+ *       gws_sema_p(); uint32_t v =3D *counter; v++; *counter =3D v; gws_s=
ema_v();
+ *   }
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
+/* Shader: CheckCuMaskIsa
+ * Purpose: Record hardware ID register value per workgroup to validate CU=
 masking distribution.
+ * Inputs: s[2:3] output buffer base; s4/ttmp9 workgroup id.
+ * Output: out[wg_id] =3D HW_ID (or HW_ID1 on GFX12) low 32 bits.
+ * Pseudo-code:
+ *   void shader_check_cumask(uint32_t *out, uint32_t wg_id) {
+ *       uint32_t hwid =3D read_hw_id();
+ *       out[wg_id] =3D hwid;
+ *   }
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
+/* Shader: JumpToTrapIsa
+ * Purpose: Trigger a trap (s_trap 1) then loop until a condition is exter=
nally satisfied (v4 changed), finally store v4.
+ * Inputs: s[0:1] destination to store final value.
+ * Trap Handling: External trap handler expected to modify wave state / v4.
+ * Pseudo-code:
+ *   void shader_jump_to_trap(uint32_t *out) {
+ *       volatile uint32_t v4 =3D 0;
+ *       trigger_trap(1);
+ *       while (v4 =3D=3D 0) { ; } // wait for handler
+ *       *out =3D v4;
+ *   }
+ */
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
+/* Shader: TrapHandlerIsa
+ * Purpose: Handles traps (vm faults, address watch events, doorbell fetch=
) and restores wave state, advancing PC past trap instruction.
+ * Behavior Summary:
+ *   - Distinguish vmfault vs watch trap via trap status registers.
+ *   - Optionally fetch doorbell index (MSG_RTN_GET_DOORBELL) on newer GPU=
s.
+ *   - Send interrupt message, adjust m0, capture checkpoint values.
+ *   - Restore IB status, STATUS registers, and resume (s_rfe_b64) at adju=
sted PC.
+ * Pseudo-code (conceptual):
+ *   void trap_handler(context *ctx) {
+ *       flags =3D read_trap_status();
+ *       if (is_vm_fault(flags)) { restore_and_exit(ctx); return; }
+ *       if (is_watch_event(flags)) { ctx->watch_checkpoint =3D ctx->pc_de=
lta; ctx->watch_status =3D flags; }
+ *       else { ctx->doorbell =3D fetch_doorbell(); signal_interrupt(ctx);=
 }
+ *       advance_pc(ctx); restore_wave_state(ctx); resume(ctx);
+ *   }
+ */
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
+/* Shader: WatchReadIsa
+ * Purpose: Perform a read from watched address (s[0:1]) and then enter a =
loop updating a counter and eventually storing result.
+ * Pseudo-code (simplified):
+ *   void shader_watch_read(uint32_t *addr, uint32_t *out) {
+ *       uint32_t base =3D *out; uint32_t chk=3D0; while(!exit_condition()=
) chk +=3D base; *out =3D chk; }
+ */
+static const char WatchReadIsa[] =3D
+    WATCH_START
+    "flat_load_dword v7, v[0:1]"
+    WATCH_END;
+
+/* Shader: WatchWriteIsa
+ * Purpose: Perform an initial store to watched address then loop similarl=
y to WatchReadIsa accumulating until exit.
+ * Pseudo-code:
+ *   void shader_watch_write(uint32_t *addr, uint32_t *out) {
+ *       *addr =3D out[0]; uint32_t chk=3D0; while(!exit_condition()) chk =
+=3D out[0]; out[0]=3Dchk; }
+ */
+static const char WatchWriteIsa[] =3D
+    WATCH_START
+    "flat_store_dword v[0:1], v4"
+    WATCH_END;
+
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
diff --git a/lib/amdgpu/shaders/amd_shaders.c b/lib/amdgpu/shaders/amd_shad=
ers.c
new file mode 100644
index 000000000..adc4fc051
--- /dev/null
+++ b/lib/amdgpu/shaders/amd_shaders.c
@@ -0,0 +1,562 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *  *
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
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+#include <amdgpu.h>
+#include "amd_shaders.h"
+#include <amdgpu_drm.h>
+
+#define CODE_OFFSET 512
+#define DATA_OFFSET 1024
+
+#define SWAP_32(num) (((num & 0xff000000) >> 24) | \
+				((num & 0x0000ff00) << 8) | \
+				((num & 0x00ff0000) >> 8) | \
+				((num & 0x000000ff) << 24))
+/*
+ * C equivalent of the shader_bin below. This tiny compute kernel performs=
 a
+ * busy-wait loop, then writes the constant value 42 into a GPU virtual
+ * address passed via COMPUTE_USER_DATA_0..1. This shader is intentionally
+ * simple and designed to work across all GFX generations.
+ *
+ * Host-side logic equivalent in C:
+ *
+ *	static void gpu_shader_standalone(volatile u32 *dst, u64 iters)
+ *	{
+ *		Busy loop comparable to the ISA spin, prevents compiler optimization.
+ *		for (u64 i =3D 0; i <=3D iters; i++)
+ *			asm volatile("" ::: "memory");
+ *
+ *		After spin completes, write sentinel value 42.
+ *		*dst =3D 42;
+ *	}
+ *
+ * The binary shader blob generated below executes equivalent logic on the=
 GPU.
+ */
+
+/*
+ * Shader ISA: spin_store_flat.s
+ *
+ * This kernel expects a 64-bit flat/global address provided in s[0:1]
+ * (passed via COMPUTE_USER_DATA_0..1) and behaves as follows:
+ *
+ *	1) Initialize a counter register (s2 =3D 0).
+ *	2) Increment s2 until it exceeds 0x0098967f (~10 million).
+ *	3) When the loop completes, store the literal 42 at *(u32 *)(s1:s0).
+ *	4) Terminate with s_endpgm.
+ *
+ * Notes:
+ *	- Uses flat/global addressing =E2=80=94 no buffer SRD required.
+ *	- Works with 1x1x1 dispatches; single work-item.
+ *	- Safe for all GFX generations; no HW-specific instructions.
+ *
+ * Annotated assembly:
+ *
+ *	.text
+ *	.p2align 8
+ *	.globl spin_store_flat
+ *	.type	spin_store_flat,@function
+ *
+ * spin_store_flat:
+ *	s_mov_b32 s2, 0				Initialize loop counter.
+ *
+ *	s_cmp_gt_u32 s2, 0x0098967f		Early exit if counter exceeds limit.
+ *	s_cbranch_scc1 .Lexit
+ *
+ * .Lloop:
+ *	s_add_i32 s2, s2, 1			Increment counter.
+ *	s_cmp_gt_u32 s2, 0x0098967f		Continue looping if below threshold.
+ *	s_cbranch_scc0 .Lloop
+ *
+ *	v_mov_b32_e32 v0, 42			Load value 42 into v0.
+ *	v_mov_b32_e32 v1, s0			Load address low bits into v1.
+ *	v_mov_b32_e32 v2, s1			Load address high bits into v2.
+ *
+ *	flat_store_dword v[1:2], v0		Store 42 to *(u32 *)(s1:s0).
+ *
+ * .Lexit:
+ *	s_endpgm				End program.
+ *
+ *	.size spin_store_flat, .-spin_store_flat
+ */
+
+
+static  const
+uint32_t shader_bin[] =3D {
+	SWAP_32(0x800082be), SWAP_32(0x02ff08bf), SWAP_32(0x7f969800), SWAP_32(0x=
040085bf),
+	SWAP_32(0x02810281), SWAP_32(0x02ff08bf), SWAP_32(0x7f969800), SWAP_32(0x=
fcff84bf),
+	SWAP_32(0xff0083be), SWAP_32(0x00f00000), SWAP_32(0xc10082be), SWAP_32(0x=
aa02007e),
+	SWAP_32(0x000070e0), SWAP_32(0x00000080), SWAP_32(0x000081bf)
+};
+
+const uint32_t *
+get_shader_bin(uint32_t *size_bytes, uint32_t *code_offset, uint32_t *data=
_offset)
+{
+	*size_bytes =3D sizeof(shader_bin);
+	*code_offset =3D  CODE_OFFSET;
+	*data_offset =3D DATA_OFFSET;
+	return shader_bin;
+}
+
+struct amdgpu_test_shader {
+	uint32_t *shader;
+	uint32_t header_length;
+	uint32_t body_length;
+	uint32_t foot_length;
+};
+
+int amdgpu_dispatch_load_cs_shader_hang_slow(uint32_t *ptr, uint32_t famil=
y_id)
+{
+	/**
+	 * v_sub_f32_e32 v0, s8, v134
+	 * buffer_load_format_xyzw v[1:4], v0, s[0:3], 0 idxen
+	 * ;;
+	 * s_waitcnt vmcnt(0)
+	 * buffer_store_format_xyzw v[1:4], v0, s[4:7], 0 idxen
+	 * ;;
+	 * s_endpgm
+	 */
+	unsigned int memcpy_cs_hang_slow_ai_codes[] =3D {
+	    0xd1fd0000, 0x04010c08, 0xe00c2000, 0x80000100,
+	    0xbf8c0f70, 0xe01c2000, 0x80010100, 0xbf810000
+	};
+
+	struct amdgpu_test_shader memcpy_cs_hang_slow_ai =3D {
+		memcpy_cs_hang_slow_ai_codes,
+		4,
+		3,
+		1
+	};
+	/**
+	 * s_lshl_b32 s0, s12, 6
+	 * v_add_u32_e32 v0, vcc, s0, v0
+	 * buffer_load_format_xyzw v[1:4], v0, s[4:7], 0 idxen
+	 * ;;
+	 * s_waitcnt vmcnt(0)
+	 * buffer_store_format_xyzw v[1:4], v0, s[8:11], 0 idxen
+	 * ;;
+	 * s_endpgm
+	 */
+	unsigned int memcpy_cs_hang_slow_rv_codes[] =3D {
+	    0x8e00860c, 0x32000000, 0xe00c2000, 0x80010100,
+	    0xbf8c0f70, 0xe01c2000, 0x80020100, 0xbf810000
+	};
+
+	struct amdgpu_test_shader memcpy_cs_hang_slow_rv =3D {
+		memcpy_cs_hang_slow_rv_codes,
+		4,
+		3,
+		1
+	};
+	/**
+	 * v_interp_mov_f32_e32 v209, p10, attr0.x
+	 * v_sub_f32_e32 v0, s8, v134
+	 * buffer_load_format_xyzw v[1:4], v0, s[0:3], 0 idxen
+	 * ;;
+	 * s_waitcnt vmcnt(0)
+	 * buffer_store_format_xyzw v[1:4], v0, s[4:7], 0 idxen
+	 * ;;
+	 * s_endpgm
+	 */
+	unsigned int memcpy_cs_hang_slow_nv_codes[] =3D {
+	    0xd7460000, 0x04010c08, 0xe00c2000, 0x80000100,
+	    0xbf8c0f70, 0xe01ca000, 0x80010100, 0xbf810000
+	};
+	struct amdgpu_test_shader memcpy_cs_hang_slow_nv =3D {
+	        memcpy_cs_hang_slow_nv_codes,
+	        4,
+	        3,
+	        1
+	};
+	struct amdgpu_test_shader *shader;
+	int i, loop =3D 0x100000;
+
+	switch (family_id) {
+		case AMDGPU_FAMILY_AI:
+			shader =3D &memcpy_cs_hang_slow_ai;
+			break;
+		case AMDGPU_FAMILY_RV:
+			shader =3D &memcpy_cs_hang_slow_rv;
+			break;
+		case AMDGPU_FAMILY_NV:
+		default:
+			shader =3D &memcpy_cs_hang_slow_nv;
+			break;
+	}
+
+	memcpy(ptr, shader->shader, shader->header_length * sizeof(uint32_t));
+
+	for (i =3D 0; i < loop; i++)
+		memcpy(ptr + shader->header_length + shader->body_length * i,
+			shader->shader + shader->header_length,
+			shader->body_length * sizeof(uint32_t));
+
+	memcpy(ptr + shader->header_length + shader->body_length * loop,
+		shader->shader + shader->header_length + shader->body_length,
+		shader->foot_length * sizeof(uint32_t));
+
+	return 0;
+}
+
+int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t ve=
rsion)
+{
+	/**
+	 * v_and_b32_e32 v0, 0x3ff, v0
+	 * ;;
+	 * ...
+	 * v_sub_f32_e32 v0, s8, v134
+	 * v_mov_b32_e32 v1, 0
+	 * v_mov_b32_e32 v2, s4
+	 * mov_b32_e32 v3, s5
+	 * v_mov_b32_e32 v4, s6
+	 * v_mov_b32_e32 v5, s7
+	 * buffer_store_format_xyzw v[2:5], v0, s[0:3], 0 idxen
+	 * ;;
+	 * s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
+	 * s_endpgm
+	 */
+	static const uint32_t bufferclear_cs_shader_gfx9[] =3D {
+	    0x260000ff, 0x000003ff, 0xd1fd0000, 0x04010c08,
+	    0x7e020280, 0x7e040204, 0x7e060205, 0x7e080206,
+	    0x7e0a0207, 0xe01c2000, 0x80000200, 0xbf8c0000,
+	    0xbf810000
+	};
+
+	/**
+	 *
+	 * v_and_b32_e32 v0, 0x3ff, v0
+	 * ;;
+	 * ...
+	 * v_sub_f32_e32 v0, s8, v134
+	 * v_mov_b32_e32 v1, 0
+	 * buffer_load_format_xyzw v[2:5], v0, s[0:3], 0 idxen
+	 * ;;
+	 * s_waitcnt vmcnt(0)
+	 * buffer_store_format_xyzw v[2:5], v0, s[4:7], 0 idxen
+	 * ;;
+	 * s_endpgm
+	 */
+	static const uint32_t buffercopy_cs_shader_gfx9[] =3D {
+	    0x260000ff, 0x000003ff, 0xd1fd0000, 0x04010c08,
+	    0x7e020280, 0xe00c2000, 0x80000200, 0xbf8c0f70,
+	    0xe01c2000, 0x80010200, 0xbf810000
+	};
+
+	/**
+	 * ...
+	 * s_bcnt0_i32_b32 exec_lo, exec_lo
+	 * ...
+	 * ...
+	 * s_dcache_inv
+	 * ;;
+	 * ...
+	 * ...
+	 * ...
+	 * s_waitcnt lgkmcnt(0)
+	 * image_sample v[0:3], v2, s[4:11], s[0:3] dmask:0xf
+	 * ;;
+	 * s_not_b32 exec_lo, s12
+	 * s_waitcnt vmcnt(0)
+	 * s_nop 0
+	 * s_nop 0
+	 * ...
+	 * v_add_f32_e32 v129, v0, v0
+	 *s_endpgm
+	 */
+	static const uint32_t memcpy_ps_hang[] =3D {
+			0xFFFFFFFF, 0xBEFE0A7E, 0xBEFC0304, 0xC0C20100,
+			0xC0800300, 0xC8080000, 0xC80C0100, 0xC8090001,
+			0xC80D0101, 0xBF8C007F, 0xF0800F00, 0x00010002,
+			0xBEFE040C, 0xBF8C0F70, 0xBF800000, 0xBF800000,
+			0xF800180F, 0x03020100, 0xBF810000
+	};
+
+	/**
+	 * v_interp_mov_f32_e32 v209, invalid_param_4, attr0.x
+	 * v_sub_f32_e32 v0, s8, v134
+	 * v_mov_b32_e32 v0, s4
+	 * v_mov_b32_e32 v1, s5
+	 * v_mov_b32_e32 v2, s6
+	 * v_mov_b32_e32 v3, s7
+	 * buffer_store_format_xyzw v[0:3], v4, s[0:3], 0 idxen
+	 * ;;
+	  *s_endpgm
+	  */
+	static const uint32_t bufferclear_cs_shader_gfx10[] =3D {
+		0xD7460004, 0x04010C08, 0x7E000204, 0x7E020205,
+		0x7E040206, 0x7E060207, 0xE01C2000, 0x80000004,
+		0xBF810000
+	};
+
+	/**
+	 * v_interp_mov_f32_e32 v209, p20, attr0.x
+	 * v_sub_f32_e32 v0, s8, v134
+	 * buffer_load_format_xyzw v[2:5], v1, s[0:3], 0 idxen
+	 * ;;
+	 * s_waitcnt vmcnt(0)
+	 * buffer_store_format_xyzw v[2:5], v1, s[4:7], 0 idxen
+	 * ;;
+	 * s_endpgm
+	 */
+	static const uint32_t buffercopy_cs_shader_gfx10[] =3D {
+		0xD7460001, 0x04010C08, 0xE00C2000, 0x80000201,
+		0xBF8C3F70, 0xE01C2000, 0x80010201, 0xBF810000
+	};
+
+	/**
+	 * shader main
+	 * asic(GFX11)
+	 * type(CS)
+	 * s_version     UC_VERSION_GFX11 | UC_VERSION_W64_BIT   // 000000000000:=
 B0802006
+	 * s_set_inst_prefetch_distance  0x0003                  // 000000000004:=
 BF840003
+	 * v_and_b32     v0, lit(0x000003ff), v0                 // 000000000008:=
 360000FF 000003FF
+	 * v_mov_b32     v1, s5                                  // 000000000010:=
 7E020205
+	 * v_mov_b32     v2, s6                                  // 000000000014:=
 7E040206
+	 * v_mov_b32     v3, s7                                  // 000000000018:=
 7E060207
+	 * s_delay_alu   instid0(VALU_DEP_4)                     // 00000000001C:=
 BF870004
+	 * v_lshl_add_u32  v4, s8, 6, v0                         // 000000000020:=
 D6460004 04010C08
+	 * v_mov_b32     v0, s4                                  // 000000000028:=
 7E000204
+	 * buffer_store_format_xyzw  v[0:3], v4, s[0:3], 0 idxen // 00000000002C:=
 E01C0000 80800004
+	 * s_sendmsg     sendmsg(MSG_DEALLOC_VGPRS, 0, 0)        // 000000000034:=
 BFB60003
+	 * s_endpgm                                              // 000000000038:=
 BFB00000
+	 */
+	static const uint32_t bufferclear_cs_shader_gfx11[] =3D {
+		0xB0802006, 0xBF840003, 0x360000FF, 0x000003FF,
+		0x7E020205, 0x7E040206, 0x7E060207, 0xBF870004,
+		0xD6460004, 0x04010C08, 0x7E000204, 0xE01C0000,
+		0x80800004, 0xBFB60003, 0xBFB00000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000
+	};
+
+	static const uint32_t bufferclear_cs_shader_gfx12[] =3D
+	{
+		0xB0802009, 0xBF930006, 0x360000FF, 0x000003FF,
+		0x7E020205, 0x7E040206, 0x7E060207, 0xBF870004,
+		0xD6460004, 0x04010C75, 0x7E000204, 0xC401C07C,
+		0x80000000, 0x00000004, 0xBFB60003, 0xBFB00000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000
+	};
+	/**
+	 * shader main
+	 * asic(GFX11)
+	 * type(CS)
+	 * s_version     UC_VERSION_GFX11 | UC_VERSION_W64_BIT   // 000000000000:=
 B0802006
+	 * s_set_inst_prefetch_distance  0x0003                  // 000000000004:=
 BF840003
+	 * v_and_b32     v0, lit(0x000003ff), v0                 // 000000000008:=
 360000FF 000003FF
+	 * s_delay_alu   instid0(VALU_DEP_1)                     // 000000000010:=
 BF870001
+	 * v_lshl_add_u32  v1, s8, 6, v0                         // 000000000014:=
 D6460001 04010C08
+	 * buffer_load_format_xyzw  v[2:5], v1, s[0:3], 0 idxen  // 00000000001C:=
 E00C0000 80800201
+	 * s_waitcnt     vmcnt(0)                                // 000000000024:=
 BF8903F7
+	 * buffer_store_format_xyzw  v[2:5], v1, s[4:7], 0 idxen // 000000000028:=
 E01C0000 80810201
+	 * s_sendmsg     sendmsg(MSG_DEALLOC_VGPRS, 0, 0)        // 000000000030:=
 BFB60003
+	 * s_endpgm                                              // 000000000034:=
 BFB00000
+	 * end
+	 */
+	static const uint32_t buffercopy_cs_shader_gfx11[] =3D {
+		0xB0802006, 0xBF840003, 0x360000FF, 0x000003FF,
+		0xBF870001, 0xD6460001, 0x04010C08, 0xE00C0000,
+		0x80800201, 0xBF8903F7, 0xE01C0000, 0x80810201,
+		0xBFB60003, 0xBFB00000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000
+	};
+	static const uint32_t buffercopy_cs_shader_gfx12[] =3D
+	{
+		0xB0802009, 0xBF930011, 0x360000FF, 0x000003FF,
+		0xBF870001, 0xD6460002, 0x04010C75, 0xC400C07C,
+		0x80000003, 0x00000002, 0xBFC00000, 0xC401C07C,
+		0x80000803, 0x00000002, 0xBFB60003, 0xBFB00000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000
+	};
+
+	uint32_t shader_size;
+	const uint32_t *shader;
+
+	switch (cs_type) {
+		case CS_BUFFERCLEAR:
+			if (version =3D=3D 9) {
+				shader =3D bufferclear_cs_shader_gfx9;
+				shader_size =3D sizeof(bufferclear_cs_shader_gfx9);
+			} else if (version =3D=3D 10) {
+				shader =3D bufferclear_cs_shader_gfx10;
+				shader_size =3D sizeof(bufferclear_cs_shader_gfx10);
+			} else if (version =3D=3D 11) {
+				shader =3D bufferclear_cs_shader_gfx11;
+				shader_size =3D sizeof(bufferclear_cs_shader_gfx11);
+			} else if (version =3D=3D 12) {
+				shader =3D bufferclear_cs_shader_gfx12;
+				shader_size =3D sizeof(bufferclear_cs_shader_gfx12);
+			}
+			break;
+		case CS_BUFFERCOPY:
+			if (version =3D=3D 9) {
+				shader =3D buffercopy_cs_shader_gfx9;
+				shader_size =3D sizeof(buffercopy_cs_shader_gfx9);
+			} else if (version =3D=3D 10) {
+				shader =3D buffercopy_cs_shader_gfx10;
+				shader_size =3D sizeof(buffercopy_cs_shader_gfx10);
+			} else if (version =3D=3D 11) {
+				shader =3D buffercopy_cs_shader_gfx11;
+				shader_size =3D sizeof(buffercopy_cs_shader_gfx11);
+			} else if (version =3D=3D 12) {
+				shader =3D buffercopy_cs_shader_gfx12;
+				shader_size =3D sizeof(buffercopy_cs_shader_gfx12);
+			}
+			break;
+		case CS_HANG:
+			shader =3D memcpy_ps_hang;
+			shader_size =3D sizeof(memcpy_ps_hang);
+			break;
+		default:
+			return -1;
+	}
+
+	memcpy(ptr, shader, shader_size);
+	return 0;
+}
+
+
+int
+amdgpu_draw_load_ps_shader_hang_slow(uint32_t *ptr, int family)
+{
+	/**
+	 * s_mov_b32 m0, s12
+	 * s_mov_b64 s[14:15], exec
+	 * s_wqm_b64 exec, exec
+	 * v_interp_p1_f32_e32 v2, v0, attr0.x
+	 * v_interp_p2_f32_e32 v2, v1, attr0.x
+	 * v_interp_p1_f32_e32 v3, v0, attr0.y
+	 * v_interp_p2_f32_e32 v3, v1, attr0.y
+	 * image_sample v[0:3], v2, s[0:7], s[8:11] dmask:0xf
+	 * ;;
+	 * s_mov_b64 exec, s[14:15]
+	 * s_waitcnt vmcnt(0)
+	 * s_nop 0
+	 * s_nop 0
+	 * s_nop 0
+	 * s_nop 0
+	 * exp mrt0 v0, v1, v2, v3 done vm
+	 * ;;
+	 * s_endpgm
+	 */
+	unsigned int memcpy_ps_hang_slow_ai_codes[] =3D {
+		0xbefc000c, 0xbe8e017e, 0xbefe077e, 0xd4080000,
+		0xd4090001, 0xd40c0100, 0xd40d0101, 0xf0800f00,
+		0x00400002, 0xbefe010e, 0xbf8c0f70, 0xbf800000,
+		0xbf800000, 0xbf800000, 0xbf800000, 0xc400180f,
+		0x03020100, 0xbf810000
+	};
+
+	struct amdgpu_test_shader memcpy_ps_hang_slow_ai =3D {
+		memcpy_ps_hang_slow_ai_codes,
+		7,
+		2,
+		9
+	};
+
+	struct amdgpu_test_shader *shader;
+	int i, loop =3D 0x40000;
+
+	switch (family) {
+		case AMDGPU_FAMILY_AI:
+		case AMDGPU_FAMILY_RV:
+		case AMDGPU_FAMILY_NV: /* TODO check for correctness */
+		shader =3D &memcpy_ps_hang_slow_ai;
+			break;
+		default:
+			return -1;
+			break;
+	}
+
+	memcpy(ptr, shader->shader, shader->header_length * sizeof(uint32_t));
+
+	for (i =3D 0; i < loop; i++)
+		memcpy(ptr + shader->header_length + shader->body_length * i,
+			shader->shader + shader->header_length,
+			shader->body_length * sizeof(uint32_t));
+
+	memcpy(ptr + shader->header_length + shader->body_length * loop,
+		shader->shader + shader->header_length + shader->body_length,
+		shader->foot_length * sizeof(uint32_t));
+
+	return 0;
+}
diff --git a/lib/amdgpu/amd_shaders.h b/lib/amdgpu/shaders/amd_shaders.h
similarity index 96%
rename from lib/amdgpu/amd_shaders.h
rename to lib/amdgpu/shaders/amd_shaders.h
index 80a319a3a..f7d4cab07 100644
--- a/lib/amdgpu/amd_shaders.h
+++ b/lib/amdgpu/shaders/amd_shaders.h
@@ -27,7 +27,7 @@
=20
 #include "drmtest.h"
 #include <amdgpu.h>
-#include "amd_shared_dispatch.h"
+#include "amdgpu/compute_utils/amd_shared_dispatch.h"
=20
 const uint32_t *
 get_shader_bin(uint32_t *size_bytes, uint32_t *code_offset, uint32_t *data=
_offset);
diff --git a/lib/meson.build b/lib/meson.build
index 707ce6ff9..bbfac3c2b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -164,10 +164,10 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_gfx.c',
 		'amdgpu/amd_ip_blocks.c',
 		'amdgpu/amd_ip_blocks_ex.c',
-		'amdgpu/amd_shaders.c',
+		'amdgpu/shaders/amd_shaders.c',
 		'amdgpu/amd_gfx_v8_0.c',
-		'amdgpu/amd_gfx_v9_0.c',
-		'amdgpu/amd_dispatch_helpers.c',
+		'amdgpu/compute_utils/amd_gca.c',
+		'amdgpu/compute_utils/amd_dispatch_helpers.c',
 		'amdgpu/amd_deadlock_helpers.c',
 		'amdgpu/amd_pci_unplug.c',
 		'amdgpu/amd_shared_process.c',
@@ -179,11 +179,22 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_vcn_shared.c'
 	]
 	if libdrm_amdgpu.version().version_compare('> 2.4.99')
-		lib_sources +=3D[ 'amdgpu/amd_dispatch.c',]
+		lib_sources +=3D[ 'amdgpu/compute_utils/amd_dispatch.c',]
 	else
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
+		lib_sources +=3D ['amdgpu/shaders/amd_llvm_asm.c']
+		message('Found ' + llvm_mc_prog.path() + ' enabling runtime AMDGPU ISA a=
ssembly')
+	else
+		lib_sources +=3D ['amdgpu/shaders/amd_llvm_asm_stub.c']
+		message('llvm-mc not found: using stub implementation (tests will skip)')
+	endif
+
 	if libdrm_amdgpu.version().version_compare('>=3D 2.4.125')
 		add_project_arguments('-DAMDGPU_USERQ_ENABLED', language: 'c')
 	else
--=20
2.49.0

