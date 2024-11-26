Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1CDD6552F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 17:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7CA10E1E4;
	Tue, 26 Nov 2024 17:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="um7YfXew";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756F310E1E4
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 17:29:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfl2x2CsykhT8BS/AoUvPLmRvnVw6wQNZYj8/7fYL6g93eQgwt8p3mrj0Y39K63fd5QVBpQ1BxMDMDJQSFuGIkvwnm3DOqaZz/0MG4Vs4FvFKV5s86MtPwP9n2MuLkSAuBF7Acw0AOG+S8nWAV2GJUiaDz8u9zcV/lbt1nK+Z/eHPJ6BokBRWZcu10ZIDj25N6b6r+kicPm6Afj+o9Tq4Yk+FIDwXMRpUraXiUEZkwtS6SQgtl8n/higGBvylsxeA2RH0kxSdKn2siWw10lqDZImB+4Ge4LIfjeCJz7r8IB757YDFLeNEwQo9ugZF8VIXKRkhk3ItjK2KfwzxsCfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Y/tDYsQXreJw9WR30ObC2Lxct8Kunyqc43mSSySzVk=;
 b=N2SpJf7i+oH2vM25UaF4SWy1t8xUe0Sa3mgioDZhUcYgNjk5Ub/SeeWqpmMqgk8KIm8mfEuBhUKT9afjd0cU+8NAWhPTJ8DVzArCiKNsT+gsXwGi+2TNBtQNPEp75M/1PaJOjKZnKxLsiepf0oepQgdyKybzhtqNqDSHxrBBHhwSsk2B1BKJwPohDGGYJe2QZ8A2MRQMvwsm/5rKjta4tgGoPw0E2rrRl5O4Q63iLQ0E/AwfxJOZuM1Iw8+Zr2FjC+F6wW6GGdJW0QpNrPTbjQDdJXPSU4r5tAf293xayVLZfDyOSEzPr1IfSRMLve1qbcqNhJb9VdiBSdQoceg9fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Y/tDYsQXreJw9WR30ObC2Lxct8Kunyqc43mSSySzVk=;
 b=um7YfXew9OzOW4M++f5FbcANS7+mRs2dLRGLeZupXc+KhiHOtEKBO+6rP8Fodnz+Sv7UhuKHLmPTLOU7lEpAWXYJ2rQt8VxVwsI5iOlLBxtpzA4IzeKRG1C74su4GfZE0GRI1Wj2ZCVsD/l5Eay4dcMvLGn05woOcHgbGAzwZb8=
Received: from SA0PR11CA0058.namprd11.prod.outlook.com (2603:10b6:806:d0::33)
 by SA3PR12MB9130.namprd12.prod.outlook.com (2603:10b6:806:37f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 17:29:38 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:d0:cafe::c5) by SA0PR11CA0058.outlook.office365.com
 (2603:10b6:806:d0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Tue,
 26 Nov 2024 17:29:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 17:29:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 11:29:35 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 11:29:35 -0600
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Nov 2024 11:29:34 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Christian Koenig <christian.koenig@amd.com>, Alexander
 Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>, Boyuan Zhang
 <boyuan.zhang@amd.com>
Subject: [PATCH 2/3] lib/amdgpu: Introduce process spawning with
 synchronization
Date: Tue, 26 Nov 2024 12:29:22 -0500
Message-ID: <20241126172923.206952-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126172923.206952-1-vitaly.prosyak@amd.com>
References: <20241126172923.206952-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SA3PR12MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: 936627c3-05ac-4fa3-30b3-08dd0e3fe76b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yWQhWzC+YYUtpofNWdWAEvtE4WD8gE3EtG5YDHuYwkVSP5VTbTcdI8mI7jC2?=
 =?us-ascii?Q?8WZaTtEdNsyTJFtUZbrQBkXaVEVgM/iljqbincuzawQiD4ALv4K27zigZlq2?=
 =?us-ascii?Q?zTEPrDxo7ziig4G/meitMnFotrW24x92bc6BQZwJExBnZGv0Gij3aS1imgUk?=
 =?us-ascii?Q?9/Ve3E3l75YlFOO/7cMkkIeRZG2ZGaR37HLFjZiPfqzNCZA8uXu06n54UKE/?=
 =?us-ascii?Q?E7YmPfF7ARS+fQPtPg/tza1W941ZuYuFCE094prK9rxE0MvepxdcK1//1S9n?=
 =?us-ascii?Q?m8PZ7pyrrzixH6eQSwkVrA3TTfGl+UxaRQKN0aaizrf0IyNcYAKsiIVgsqs2?=
 =?us-ascii?Q?uNN2ZF9KqjLXSPH75CV4khwAH+WtGgrgqNzIIaYu6SB339ruT42rKct9yijO?=
 =?us-ascii?Q?oLtbpqsducCWbaJvZ4IyKJPorxWzqt1INzvE/tckBFqOPEPK2cROV39xU29j?=
 =?us-ascii?Q?psuBIUJ444Fd79oboYASykd8GCT+LEaj/1EXcDgcBYvnKtWGaGyNMpDcFXHZ?=
 =?us-ascii?Q?KBi/AKGJu6zb91KCubYifhqp2iwzdGIyEbR7g6ZA7RCcZPC/wUZrtkaIghh2?=
 =?us-ascii?Q?DSZvFFtn+jDBaLH7t+sQr28pHZPKaflFSlHHBKA/Ranl6JIYKruyclDxc7h9?=
 =?us-ascii?Q?2FAH9pe5w1RpZHJ0FVm1qOXQObcCII8ZMjKBUQh4ePD4TcP3ktM6LMmz9FoQ?=
 =?us-ascii?Q?xG76conf9CQhkupb3EPowXredp2UUjxVnXS4y2yHwbRFHO+evsiWOSSewprW?=
 =?us-ascii?Q?4PDzv/r5KgUQvbjli4OuV+iFRM29Vy0q1F/PRQjre70q0+LYDLvpQuNJr8KL?=
 =?us-ascii?Q?2ywB8bveBeXJe/SRz34AZniT/egg3namq/kVRsEAuLC26L8nZrGDJEFlKM8+?=
 =?us-ascii?Q?VhfYFPHy9tkDdkH56pVkFKtNMlJWxz792pbj2hqQ1HaOyagGcjPbdfjliu1y?=
 =?us-ascii?Q?oN9SeT6UNLpnvdnitos7TNFX3aWUOSDA00dqF13FcGvCYcXv8CnC2muoxzAg?=
 =?us-ascii?Q?lIlM7UqNWm3Fcud7WElIpLmSlo/e1jpG32ds5Zizy4/DrGLndRQGSlYH6Hv/?=
 =?us-ascii?Q?g19eIvcGdimRzHnZSa+zTEBHrTTdW9fwqIZKbOswynNZ3USrsXabZ1HPWPHn?=
 =?us-ascii?Q?E8cTbwQ/qXh07Zn60Q/FVEBn0oYm/qNLKZAefpo5dWQjpES2QmjpMB+dQbtH?=
 =?us-ascii?Q?57FO5Q9/RxXZlfRNoA8Bxd+ocKL82AgEwJY5+X4k9PBQ2y5KIwkjd/R8vnSv?=
 =?us-ascii?Q?03GhPoUdocFmYJPO9fB3O4Vwk8PmUdyGV8bjfZUIfjfijihhj/PziJRUR+TJ?=
 =?us-ascii?Q?jz48zlr5ig0I2PlEqevutj0Kaeg9zcAZVJ3hh9L4Qt4wh8KFmCsuNODwjdsZ?=
 =?us-ascii?Q?feeyGnwAXQQrTXuSMMm2njl7micojZ1ckuLA+0ngbCxs0qw9TGQaAXv1wgbN?=
 =?us-ascii?Q?d8IpRxUscVOGyXKDEXY5BB4YsL1j1i9y?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 17:29:38.3987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 936627c3-05ac-4fa3-30b3-08dd0e3fe76b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9130
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Added functions to spawn new processes with synchronization capabilities.
This feature enables execution synchronization between processes using
shared memory and semaphores, allowing for flexible and dynamic process
management.

Cc: Jesse Zhang  <jesse.zhang@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Leo Liu <leo.liu@amd.com>
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_shared_process.c | 289 ++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_shared_process.h |  63 +++++++
 lib/meson.build                 |   1 +
 3 files changed, 353 insertions(+)
 create mode 100644 lib/amdgpu/amd_shared_process.c
 create mode 100644 lib/amdgpu/amd_shared_process.h

diff --git a/lib/amdgpu/amd_shared_process.c b/lib/amdgpu/amd_shared_process.c
new file mode 100644
index 000000000..243c4e3f4
--- /dev/null
+++ b/lib/amdgpu/amd_shared_process.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2024 Advanced Micro Devices, Inc.
+
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <signal.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include <spawn.h>
+#include <sys/types.h>
+#include <semaphore.h>
+#include <errno.h>
+#include <assert.h>
+
+#include "igt.h"
+#include "amd_shared_process.h"
+
+static void
+sync_point_signal(sem_t *psem, int num_signals)
+{
+	int i;
+
+	for (i = 0; i < num_signals; i++)
+		sem_post(psem);
+}
+
+int
+shared_mem_destroy(struct shmbuf *shmp, int shm_fd, int unmap, const char *shm_name)
+{
+	int ret = 0;
+
+	if (shmp && unmap) {
+		munmap(shmp, sizeof(struct shmbuf));
+		sem_destroy(&shmp->sem_mutex);
+		sem_destroy(&shmp->sync_sem_enter);
+		sem_destroy(&shmp->sync_sem_exit);
+	}
+	if (shm_fd > 0)
+		close(shm_fd);
+
+	shm_unlink(shm_name);
+
+	return ret;
+}
+
+int
+shared_mem_create(struct shmbuf **ppbuf, char shm_name[256])
+{
+	int shm_fd = -1;
+	struct shmbuf *shmp = NULL;
+	bool unmap = false;
+
+	// Create a shared memory object
+	shm_fd = shm_open(shm_name, O_CREAT | O_RDWR, 0666);
+	if (shm_fd == -1)
+		goto error;
+
+
+	// Configure the size of the shared memory object
+	if (ftruncate(shm_fd, sizeof(struct shmbuf)) == -1)
+		goto error;
+
+	// Map the shared memory object
+	shmp = mmap(0, sizeof(struct shmbuf), PROT_WRITE, MAP_SHARED, shm_fd, 0);
+	if (shmp == MAP_FAILED)
+		goto error;
+
+	unmap = true;
+	if (sem_init(&shmp->sem_mutex, 1, 1) == -1) {
+		unmap = true;
+		goto error;
+	}
+	if (sem_init(&shmp->sync_sem_enter, 1, 0) == -1)
+		goto error;
+
+	if (sem_init(&shmp->sync_sem_exit, 1, 0) == -1)
+		goto error;
+
+	shmp->count = 0;
+	*ppbuf = shmp;
+	return shm_fd;
+
+error:
+	shared_mem_destroy(shmp,  shm_fd,  unmap, shm_name);
+	return shm_fd;
+}
+
+int
+shared_mem_open(struct shmbuf **ppbuf)
+{
+	int shm_fd = -1;
+	struct shmbuf *shmp = NULL;
+
+	shmp = mmap(NULL, sizeof(*shmp), PROT_READ | PROT_WRITE, MAP_SHARED,
+			SHARED_BROTHER_DESCRIPTOR, 0);
+	if (shmp == MAP_FAILED)
+		goto error;
+	else
+		shm_fd = SHARED_BROTHER_DESCRIPTOR;
+
+	*ppbuf = shmp;
+
+	return shm_fd;
+error:
+	return shm_fd;
+}
+
+void
+sync_point_enter(struct shmbuf *sh_mem)
+{
+
+	sem_wait(&sh_mem->sem_mutex);
+	sh_mem->count++;
+	sem_post(&sh_mem->sem_mutex);
+
+	if (sh_mem->count == NUM_BROTHER_PROCESSES)
+		sync_point_signal(&sh_mem->sync_sem_enter, NUM_BROTHER_PROCESSES);
+
+	sem_wait(&sh_mem->sync_sem_enter);
+}
+
+void
+sync_point_exit(struct shmbuf *sh_mem)
+{
+	sem_wait(&sh_mem->sem_mutex);
+	sh_mem->count--;
+	sem_post(&sh_mem->sem_mutex);
+
+	if (sh_mem->count == 0)
+		sync_point_signal(&sh_mem->sync_sem_exit, NUM_BROTHER_PROCESSES);
+
+	sem_wait(&sh_mem->sync_sem_exit);
+}
+
+int
+get_command_line(char cmdline[2048], int *pargc, char ***pppargv, char **ppath)
+{
+	ssize_t total_length = 0;
+	char *tmpline;
+	char **argv = NULL;
+	char *path  = NULL;
+	int length_cmd[16] = {0};
+	int i, argc = 0;
+	ssize_t num_read;
+
+	int fd = open("/proc/self/cmdline", O_RDONLY);
+
+	if (fd == -1) {
+		igt_info("**** Error opening /proc/self/cmdline");
+		return -1;
+	}
+
+	num_read = read(fd, cmdline, 2048 - 1);
+	close(fd);
+
+	if (num_read == -1) {
+		igt_info("*** Error reading /proc/self/cmdline");
+		return -1;
+	}
+	cmdline[num_read] = '\0';
+
+	tmpline = cmdline;
+	memset(length_cmd, 0, sizeof(length_cmd));
+
+	/*assumption that last parameter has 2 '\0' at the end*/
+	for (i = 0; total_length < num_read - 2; i++) {
+		length_cmd[i] = strlen(tmpline);
+		total_length += length_cmd[i];
+		tmpline += length_cmd[i] + 1;
+		argc++;
+	}
+	*pargc = argc;
+	if (argc == 0 || argc > 20) {
+		/* not support yet fancy things */
+		return -1;
+	}
+	/* always do 2 extra for additional parameter */
+	argv = (char **)malloc(sizeof(argv) * (argc + 2));
+	memset(argv, 0, sizeof(argv) * (argc + 2));
+	tmpline = cmdline;
+	for (i = 0; i < argc; i++) {
+		argv[i] = (char *)malloc(sizeof(char) * length_cmd[i] + 1);
+		memcpy(argv[i], tmpline, length_cmd[i]);
+		argv[i][length_cmd[i]] = 0;
+		if (i == 0) {
+			path = (char *)malloc(sizeof(char) * length_cmd[0] + 1);
+			memcpy(path, tmpline, length_cmd[0]);
+			path[length_cmd[0]] = 0;
+		}
+		argv[i][length_cmd[i]] = 0;
+		tmpline += length_cmd[i] + 1;
+	}
+	*pppargv = argv;
+	*ppath = path;
+
+	return 0;
+}
+
+int
+is_brother_parameter_found(int argc, char **argv, const char *param)
+{
+	int ret = 0;
+	int i;
+
+	for (i = 1; i < argc; i++) {
+		if (strcmp(param, argv[i]) == 0) {
+			ret = 1;
+			break;
+		}
+	}
+	return ret;
+}
+
+int
+add_brother_parameter(int *pargc, char **argv, const char *param)
+{
+	int argc = *pargc;
+	int len = strlen(param);
+
+	argv[argc] = (char *)malloc(sizeof(char) * len + 1);
+	memcpy(argv[argc], param, len);
+	argv[argc][len] = 0;
+	*pargc = argc + 1;
+	return 1;
+}
+
+void
+free_command_line(int argc, char **argv, char *path)
+{
+	int i;
+
+	for (i = 0; i <= argc; i++)
+		free(argv[i]);
+
+	free(argv);
+	free(path);
+
+}
+
+int
+is_run_device_parameter_found(int argc, char **argv, const char *param)
+{
+	int i;
+	int res = 0;
+	char *p = NULL;
+
+	for (i = 1; i < argc; i++) {
+		if (strcmp(param, argv[i]) == 0) {
+			/* Get the sum for a specific device as a unique identifier */
+			p = argv[i+1];
+			while (*p) {
+				res += *p;
+				p++;
+			}
+			break;
+		}
+	}
+
+	return res;
+}
+
+int
+launch_brother_process(int argc, char **argv, char *path, pid_t *ppid, int shm_fd)
+{
+	int status;
+	posix_spawn_file_actions_t action;
+	posix_spawnattr_t attr;
+
+	for (int i = 0; i < argc; i++) {
+		if (strstr(argv[i], "list-subtests") != NULL)
+			return 0;
+	}
+	posix_spawn_file_actions_init(&action);
+	posix_spawn_file_actions_adddup2(&action, shm_fd, SHARED_BROTHER_DESCRIPTOR);
+	posix_spawnattr_init(&attr);
+	posix_spawnattr_setflags(&attr, POSIX_SPAWN_SETSID);
+	status = posix_spawnp(ppid, path, &action,  &attr, argv, NULL);
+
+	posix_spawn_file_actions_destroy(&action);
+	posix_spawnattr_destroy(&attr);
+
+	if (status != 0)
+		igt_fail(IGT_EXIT_FAILURE);
+
+	return status;
+}
+
+
diff --git a/lib/amdgpu/amd_shared_process.h b/lib/amdgpu/amd_shared_process.h
new file mode 100644
index 000000000..62b3e104b
--- /dev/null
+++ b/lib/amdgpu/amd_shared_process.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ *
+ */
+
+#ifndef __AMD_SHARED_PROCESS_H__
+#define __AMD_SHARED_PROCESS_H__
+
+#include <semaphore.h>
+
+#define SHARED_BROTHER_DESCRIPTOR 3
+#define NUM_BROTHER_PROCESSES 2
+
+#define BROTHER	"brother"
+#define ONDEVICE	"--device"
+
+enum  process_type {
+	PROCESS_UNKNOWN,
+	PROCESS_TEST,
+	PROCESS_BROTHER,
+};
+
+struct shmbuf {
+	sem_t sem_mutex;
+	sem_t sync_sem_enter;
+	sem_t sync_sem_exit;
+	int count;
+};
+
+int
+shared_mem_create(struct shmbuf **ppbuf, char shm_name[256]);
+
+int
+shared_mem_open(struct shmbuf **ppbuf);
+
+int
+shared_mem_destroy(struct shmbuf *shmp, int shm_fd, int unmap, const char *shm_name);
+
+void
+sync_point_enter(struct shmbuf *sh_mem);
+
+void
+sync_point_exit(struct shmbuf *sh_mem);
+
+int
+get_command_line(char cmdline[2048], int *pargc, char ***pppargv, char **ppath);
+
+int
+is_brother_parameter_found(int argc, char **argv, const char *param);
+
+int
+add_brother_parameter(int *pargc, char **argv, const char *param);
+
+void
+free_command_line(int argc, char **argv, char *path);
+
+int
+is_run_device_parameter_found(int argc, char **argv, const char *param);
+
+int
+launch_brother_process(int argc, char **argv, char *path, pid_t *ppid, int shm_fd);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 207b6e185..640513e6c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -160,6 +160,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_dispatch_helpers.c',
 		'amdgpu/amd_deadlock_helpers.c',
 		'amdgpu/amd_pci_unplug.c',
+		'amdgpu/amd_shared_process.c',
 		'amdgpu/xalloc.h',
 		'amdgpu/amd_cp_dma.c',
 		'amdgpu/amd_mmd_shared.c'
-- 
2.25.1

