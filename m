Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E9B606A31B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gkiFW+xO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E063010F897;
	Tue,  3 Nov 2026 21:39:23 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010016.outbound.protection.outlook.com
 [40.93.198.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E36810F88B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:38:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vj+ZZ4A7SBYQ4PjyxGGeDtElx9uPNNvv6q1CDJE0GCtKYIHz+a7e8eVbxL0D/F2OL6pa8zoSgHnFp1pis+7eR8QJ2qL5Y5gpxfNCWOJeUfFycrNEDBsQHg63gLHiSCHqjptZAI3p7X9+TXAmNXHtxa6HTOlLwkyrSnELOm8CwsOmYF7wv3hVPGYSzPV9vsN+aHCy83FgBevjdwWT3GBfmH5shuc1MkZ6Md8equ+eMJygXP1mN6lryy9azDr//ecB2UsK6KXy0WxVGlNAPyEvj7p+6uEvgpzRsMMsRt2GQaJbe2UfYm8kvGmlCKQmnt/ds25wlV/BG2eDmghTFXdflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmqvQgf9KfuIruyiZlDc+ksWMjLsA7cDup7M5DNFInE=;
 b=tEmNsLfZxQ/iwZ8Gw6kPIljNirtkpZLUH7N0YeCtFTw7TkYVI/5oGCixmR79dAMnl46aucIZyjwpztrJxYkpFUo4RHrQUYrrvUY5Wbq5e+X0H2z9PxXUFWWj6XN5ZsOlaaHgsF6v+n348hM8q/gDuCjXC6H57ObENhuOR5zRTfSk9SiQTwBNgNYDkMKPCWKLn9pblBKfKIkYseDY2D6mtsDznJn3Lt1+LOB3DvXkCSo0a+xIV6XkgPgmU4FQz7wg9bCHXYwrUzIMPI1AMkEjZd5UxZl65pfAre2P+mram0GEHjNpLqRNukxAD+iggBWXlkQ/C2BeZOEmbOruA9Cq+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmqvQgf9KfuIruyiZlDc+ksWMjLsA7cDup7M5DNFInE=;
 b=gkiFW+xO+L5iPUIK/BCoI5gbkR/xw2U5ZsoYdf5LOLr6YUQSeyfjl0bMut4rjVajcW8WOLLNY9254+FBYJK/B0CdXq+oVz59OD/2wMOPassL/k21gebbp7WGrBsQE/dGMiXekNKXOrMkx3Qlr1OF1Q3kizajtfWxtX59vk2yVrk=
Received: from BN0PR02CA0022.namprd02.prod.outlook.com (2603:10b6:408:e4::27)
 by DM4PR12MB6471.namprd12.prod.outlook.com (2603:10b6:8:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 21:38:18 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::5a) by BN0PR02CA0022.outlook.office365.com
 (2603:10b6:408:e4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 21:38:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 21:38:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:17 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:17 -0600
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 15:38:17 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
 Autumn Ashton <misyl@froggi.es>, Xaver Hugl <xaver.hugl@gmail.com>
Subject: [PATCH v1 00/10] DRM_COLOROP_3D_LUT_DMA colorop tests
Date: Tue, 3 Nov 2026 16:37:50 -0500
Message-ID: <20261103213800.618130-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|DM4PR12MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: 235a2122-ea8f-4412-7d08-08df39f2c660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|6133799003|10067099003|18002099003|261102123227099003|13003099007|56012099006|261022105027099003|261021121427099003|261022075727099003|261026140227099003|261009223027099003|261028144727099003|11063799006|261021123027099003;
X-Microsoft-Antispam-Message-Info: KxK/vPMIWzwd0URYKNY4SNMWzx6A/yMWVHK7w2e/Ofagfb3OqIYNi3mQ4f9TCsertj+83TIGFl56gHac04AVQUDzqOi9MrJcfObWh2s2WVRtFKBIi0O+agtELbd220+KWOfxK+waBiHAbvSZ8zZjLFHV1NwNdytLAhMQ98QG1wOlTke0INzSPMouyBhOIq8itX9eSSHPrMzxXGYOvLC4CyamQGtuX28hJfCvRK9Du/n6ol8c9HT4P0kuOWPNTitaslBsFZqXS5XhB2XdKKC5JGmLVvYVzLTnvTvyLX/BGgMhcZYxFhL/N8jFaXebbiv2zSTntoPDIm1Qy2DjLYU6SyOZz6PewUt6nw4dekEKDzQXLb8uDpjWA5i0ULe3m7cOqpIra/NqAn4/NuaY7zPfzc/tXGGX8pRv//10aVeJkhPeibfUePrJ+ym+dBf3BMrGXy2TsyiF2zlfGAanPlFwXm/SFFlg5kqZa2cpMwx7/wa2MDy+rUyOR4rQ9ieH9u2b3UptaY67WyKaqovNp3731QJvAlEO6z/9JWn0vwM5ji3RuwsK8ErnLbz6bmPOJJ3hoA7qDNxJKemnT0h5raEtEDIQx7WkHG10TSOwzv4Qm63noKyrW6+vDbgpT05sV6lV9qZQd++g9poqdfDufkVyfA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(261102123227099003)(13003099007)(56012099006)(261022105027099003)(261021121427099003)(261022075727099003)(261026140227099003)(261009223027099003)(261028144727099003)(11063799006)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vndk9GZxnpbIErZT8gSPQbLpLws5FGClwmHEtqR3FprcH0jqaebmBlhG16H+7VaGS86C8n5IKIgIOOcSosIIYokvJqyUAAnd8PrVQXXSMgaKNMqPN1iMSem0mI3Pt5VWR9urvOIgA90jiWJk1gTYD+ASsdNpjGiyyEevi0+o28G0m63aKzbiZ6xQCedfEpf/FC7vj2S/Pb+W85nldUijv6WebP6h6hR8DYhBIVCzJ5pplwQmQ6EIajSe2QARNL34hzMJ5ya2sn2+4sCLQhUo6ZgGAJWAJBQEBaDNGuglnpmj77jFQtFT1ryOzdPnjvK+n9To+/IFhdSKo2gmcf7vMSx/OGGI7uG/c/UZfY3Ao9ndmUtaObL70GipxdYPmX3OQMFol6l58ubMPFgu25Dd58F2/2Dr1RFAwLC3Ds2Z9+3Lv8O3X6V1a2kA2Uj1Sr/s
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:38:18.2529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 235a2122-ea8f-4412-7d08-08df39f2c660
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6471
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Loading a DRM_COLOROP_3D_LUT on AMD HW takes a long time because the
driver has to load the entire 3D LUT via register writes.

Starting with DCN 4 the HW has the ability to load a 3D LUT via DMA,
which only requires an address update for programming the 3D LUT.

I posted a kernel series to add support for this functionality via a new
DRM_COLOROP_3D_LUT_DMA type. Users of the DRM_COLOROP_3D_LUT_DMA will
parse the supported formats via the LUT_3D_FORMATS blob property, select
the desired format via LUT_3D_FORMAT property, and pass the 3D LUT
buffer as a drm_framebuffer via FB_ID on the colorop.

In addition to the naive testing of the new DRM_COLOROP_3D_LUT_DMA this
series also introduces a kms_colorop_dma test suite that covers various
fence and buffer management tests.

Anyone wanting to give this a spin on Navi 4 will need to use the
3d-fl-fixes kernel branch and the 3d-fl-workaround IGT branch.

### Branches

kernel: https://gitlab.freedesktop.org/hwentland/linux/-/commits/3d-fl
kernel w/ fixes: https://gitlab.freedesktop.org/hwentland/linux/-/commits/3d-fl-fixes
IGT: https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/3d-fl
IGT Navi 4 w/a: https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/3d-fl-workaround
kwin: https://invent.kde.org/hwentlan/kwin/-/commits/3d-fl

Cc: Melissa Wen <mwen@igalia.com>
Cc: Autumn Ashton <misyl@froggi.es>
Cc: Xaver Hugl <xaver.hugl@gmail.com>

Harry Wentland (10):
  lib/drm-uapi: sync drm_mode.h DMA 3D LUT colorop uAPI
  lib/igt_kms: add DMA 3D LUT colorop properties
  tests/kms_colorop: share writeback and pixel helpers
  tests/kms_colorop: add a DMA 3D LUT colorop test
  tests/kms_colorop_dma: add negative DMA 3D LUT tests
  tests/kms_colorop_dma: test implicit fencing of DMA 3D LUT
    framebuffers
  tests/kms_colorop_dma: test scanout and DMA 3D LUT implicit fences
    together
  tests/kms_colorop_dma: test a merged in-fence covering DMA 3D LUT
    producers
  tests/kms_colorop_dma: exercise DMA 3D LUT framebuffer transitions
  tests/kms_colorop_dma: test DMA 3D LUT framebuffer removal

 include/drm-uapi/drm_mode.h       |   79 +++
 lib/igt_kms.c                     |    5 +-
 lib/igt_kms.h                     |    3 +
 tests/intel-ci/i915.blocklist.txt |    1 +
 tests/intel-ci/xe.blocklist.txt   |    1 +
 tests/kms_colorop.c               |  146 +---
 tests/kms_colorop_dma.c           | 1103 +++++++++++++++++++++++++++++
 tests/kms_colorop_helper.c        |  279 ++++++++
 tests/kms_colorop_helper.h        |   13 +
 tests/meson.build                 |    2 +
 10 files changed, 1489 insertions(+), 143 deletions(-)
 create mode 100644 tests/kms_colorop_dma.c

--
2.56.0

