Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E29606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4VC/uRhw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F9910E142;
	Wed, 21 Oct 2026 15:01:50 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010018.outbound.protection.outlook.com [52.101.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36F010F343
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:00:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGbGYx+gh8jAsGtedUoRc1+1TreX7VTDT/5IRNRIJOuB/39OYbHIjo1lf9KjNqu36R1i2cbIRXKzQa+BY/gTSkMbIngh59zmGz8H0YN8Et3pkj5qs1TfEwUuDWZnfI4GICyeIYv9RYCtg3PzoJlIcpWvooZrbEmGitqPDnMNUq6e3wnJCx3gVrxN/yvJM80llS/6RNZ35sbyGGy7cibMji65zKj6wR8o+Sl9QcGNNb5Gq2ICK5JhJNUokKa87NjauLPgCinwTH/45Wu90fmO4EHQRdVkif1MPo2A4CK0k+uOxZJHDdeihGdrc/qtGNZ0L7JARb7G/VMIE+RMmlLVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dX3flkOjGL8a3dDKSqUatKhG1Ke58omvO8ICZ9uaLio=;
 b=Q1Ni9UXeuZFRh/UpNBS6YNjwgJupzPpR1i7mQfUSlhUwOFbaOsft1BOULSfqLUoG48pzIB1b66JanpSVjUhlXEc99lLN9yzpBESE+heK9fPhgCxiP6vIsxoaGD14VkltDsSol2KekhrIKkuIQooEgYu83+1WyY8vQPpfqclL5fN79+Jw9XdPFtN1tJitVANJ+hEngWJPy9KJPF6UreioOmkpiQeD63AOCFBPM1DjxgO2Z1ydsRXrqM00VzVBuuNt8G1yFJNg+HY38QdazN5D89YD8bpt5FlYiqq6vvT3Tbf6Yn/vq017gSwPlICN2SbMLz2hXpfxs8OiG4gPjKpDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dX3flkOjGL8a3dDKSqUatKhG1Ke58omvO8ICZ9uaLio=;
 b=4VC/uRhwPzeRD4o0mjCL5uMw9qfPcg7SAL0N0IiUcIiaOFzDmB2s+ABax0zWubNq8UQ+vrTB7hGZySsngWQ2VreIqMhZUJFm3FfSIQpspGZZVrgZ4hj6vM8TVDKcpT5qLfVdH4X7TN0bSAXtXGe/AYqt8GsUyqHBMVBUBTYT7cw=
Received: from BY3PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:217::8)
 by BY5PR12MB4321.namprd12.prod.outlook.com (2603:10b6:a03:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 15:00:52 +0000
Received: from BY1PEPF0002695D.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::86) by BY3PR04CA0003.outlook.office365.com
 (2603:10b6:a03:217::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 15:00:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0002695D.mail.protection.outlook.com (10.167.244.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 15:00:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 10:00:52 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 10:00:51 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 21 Oct 2026 10:00:51 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] tests/amdgpu: remove the x86 pause hint from value polling
Date: Wed, 21 Oct 2026 11:00:27 -0400
Message-ID: <20261021150044.52953-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695D:EE_|BY5PR12MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: 34386640-94c5-4cc7-f622-08df2f8419fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|18002099003|10067099003|3023799007|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: tDcz1p4p3TLYsaJWj4I3qeT9/w93pyp7lpJyoAjR3bXnraiXWdpBeovhSXkZe/Yu3D8boaKyQf/lA4GU28Y5sE7v2U6b9RRO569P4fMWJtY+eE14cCYhgGSMdOu5tudmxNDJA7IXcdNvdKe2NZarQJ7QxOtyEMJ+WWtuSOFOGCdCxMuV1q+an7V0x6y7TiEJplQWzTh/fwG7aVvPZW/8Le0C9pBVuqAb/d/fnw1FKJIeJIFPZazcRB6+VPQrwxLKZmVuf5qvQ7XUqcfNrd6DxABRdyb4mFe6iMANtCCK/XzFPtx2bHytsktHVl8mo9EfQfQuZDi6wqK093ceMG14XuFaPlCVfLiJ+Mj0Zg3JSzcRxgceBGNB9+HWkVIuRRFrhedSLMClPyt3UEfqgXjrwOtbX0PA7zMTmTM43fJzA4Ij2/fkLJ49bE6ykecxTLB2RDx71DDAwO/OCtBexPudbDUOIkS5cp6yHB6mqRdEJkdc1e7YJ1vOVuegv4PWUda7KeziLCYBYpKxu3A5GIT/TH96HhakcpvRwj1Xb5niSihbx9NOHBEAlPrJh1uePXJsSgCOhwAsxlIIMn1b9S7lmyZZ8sWkHJ5GeLbJYWkYiqZctrF/WavtXNwnVGHGCSAIvFcQDXYuvxwTtQTr3CmvE492jW/dHTxqbqjJZ9AhomYeLKyIAjJ6kqhvvOp0hmTL8JMmn24GdkB8bxxQdmKMSw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(18002099003)(10067099003)(3023799007)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Cel5LdxZhc9qkm5PLbMiyXj8MV8m2XlBL8pgCLLH9Ttft4ZC/jwG3CltLnC4bb1tyL2BOXI47utC7KZXgWfb6pQdL47R1ArQndbhxG/DDgfsrbkFLbD7Tv4xVOajwfFy/NznvdDGTUnkmqlysTeBA3KRBkUmxZRF8ubGNyVTgOpB0lX/wMDZKg8all716722+IwnH+VB0Oy9wNon00eGhvhjxPOPiZX82GZkmLipkC0iNACadIHGfqQZaHK49w58El6uxHDyL1xlbCF+2xx0OT9ZQihbmOdudwPPkraBrPhe2n3GwBAFTpgS/eTIpLukbOJMOfFGU4FdW5B/yyX+Twq2eErWPmnw5Z+h5WGOt+Q+teO7d6TywG/nGiGUaKlIVkvBKXO60fVVrHOiBmBKpVIKNXDPSNw0wrI9RKJUaYh358AJK7gAsZ0gFw3g4XH1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 15:00:52.6674 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34386640-94c5-4cc7-f622-08df2f8419fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0002695D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4321
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

wait_for_value64() uses nanosleep() when a polling interval is requested
and otherwise polls until the expected value is observed or the timeout
expires. The pause instruction is an optional x86 spin-wait hint, not a
requirement for detecting completion or enforcing the timeout.

The original unguarded assembly was rejected by ARM/AArch64 assemblers
in debug builds. Commit 125c0289617f guarded it, but used x86_64 and i386
instead of the compiler predefined __x86_64__ and __i386__ macros. That
silently excludes the hint on normal GCC x86 builds as well.

Rather than correct the guard and retain architecture-specific assembly
for this polling helper, remove the optional hint and its guard entirely.
Keep the nanosleep path, volatile value reads, and timeout handling
unchanged. With no interval requested, the helper continues tight polling
without an architecture-specific instruction.

This deliberately gives up the x86 pause optimization, which can reduce
spin-loop power consumption and contention with an SMT sibling. It is not
a power or performance improvement; it trades that optimization for a
simpler polling implementation with no x86 assembly dependency. Relative
to the existing incorrect GCC guard, the hint was already omitted.

The removed memory clobber is a compiler barrier, not a hardware memory
fence. This change does not add or claim cross-architecture memory-ordering
guarantees; it retains the existing volatile polling accesses.

This is an alternative to correcting the architecture macro names, not an
additional fix to apply on top of that alternative.

ARM/AArch64 cross-compilation and GPU runtime testing were not performed.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_basic.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 494934c1c..590163b7b 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -705,10 +705,6 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
 		/* Sleep if interval specified, otherwise tight loop */
 		if (check_interval_ns > 0)
 			nanosleep(&sleep_time, NULL);
-#if defined(x86_64) || defined(i386)
-		else
-			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
-#endif
 	}
 }
 
-- 
2.55.0

