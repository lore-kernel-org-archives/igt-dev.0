Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66E5C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 07:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB5110E7F7;
	Wed,  9 Apr 2025 07:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NxeHdN/J";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1735C10E7F7
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 07:57:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FugJDjYQw9XvtmmhAUxykMwlBhFD7XRK2NVaknNV91E+bmMYK15j5xfvoV4QdeCwwSuoHhu9rVmmq43y748B7YrXR84NLzDcbAgBW7v4rjk8ddny1V+CklA0U/7MV6pUIuHdg5qZIoXpgVIIWCsWUkbqneobeQRfoN9jO79f2v9jlvRuQELZfTmn4ad8fgM5js28eCdGsgmSlKSqQNN2JRA7S2O1g846k+Mg4kI/cXhb001+xfuQc4+hi9D/iXR9Tc2vo9NrjwFU/gcJ6YVbbI2rpq3esQ6PA6fsjFblILXdYcm5VaffCpl+7ZnFwcyTyqQds/T8P3QYnhYqLzFwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdYPTQTNEl8W0Y3BsLqEAnRkGAHHRlAUMKPefBoMMkU=;
 b=iCuPepr1NUzetp/rwes/PDKHjDvF5QN07qQppCD7C8gsESCy4jFtPhakHRc4MCULCEyTeDWxbeRSjW05XIbYEGiQdEKSdLv7BOtT2hHIMvJWfhDJI+uYl/5QuiXSj5SYWNo0mmdeHhfZVJCoraDhj1vhOOHCb2keHNneGert+CT3Auc8OV2O5bk1zr39LIs8yTM/AZ4JipJQyYRvaxIn4jXajArBxjlBSIwlJCInLIkrne4ClZOSyCkW/XqS7zRo2DgkgeJexADGlXNg2HpgTRzvzdYBqYcXr1IuXtjWuEL2GifRaZw0K0gmofS9iJ3l63JKlYMHm/mirCNCD1Rw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdYPTQTNEl8W0Y3BsLqEAnRkGAHHRlAUMKPefBoMMkU=;
 b=NxeHdN/JTlV1b7XcHdDU1H9XblgkwrKswagA1tP9SjfAX9ElmaCEnnZdBBCbqwxRe/7rdJNskFEPpSc/b/mlFjfp5stb5gQ6a5FNdI4aFdgh3ab7GBcOSbFtGrE7phsXNUHUtflkRMxN2/aDKUnvSJIUL606SlKhtJyLiDLbQB0=
Received: from MW4PR04CA0089.namprd04.prod.outlook.com (2603:10b6:303:6b::34)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 07:57:05 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::b8) by MW4PR04CA0089.outlook.office365.com
 (2603:10b6:303:6b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Wed,
 9 Apr 2025 07:57:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 07:57:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 02:57:01 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 9 Apr 2025 02:56:59 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 <sukhatri@amd.com>, <prike.liang@amd.com>, "Jesse.zhang@amd.com"
 <Jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2 1/3] lib/meson.build: Add AMDGPU_USERQ_ENABLED check
 for user queues
Date: Wed, 9 Apr 2025 15:56:51 +0800
Message-ID: <20250409075653.2502119-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 59417137-b22e-4192-6493-08dd773c1e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?McZqNZ2/7DgaSme5XCjrDDb8wUbP+d2H/xhO/JEXVVCRV2X64Vw4w4oQQXJI?=
 =?us-ascii?Q?WxY/n9FUnXOYJAz4y8u1RaA4fuWlCiuskO2ow5d9F0ztgjXvuhOBtEfw7cBY?=
 =?us-ascii?Q?pTx710d8OT8v+Jcazdxkb5fvdjKH1/PrWRCOXCF+L0NpdtDbomZ4ocFs2cp2?=
 =?us-ascii?Q?KprUy9VEtcmuqPu3jPTbEJdGDBCugTIrAvvUbR0XeRUaEFBgSwZDJBsh5bqr?=
 =?us-ascii?Q?bnsoyPs3pGyH1x7E3gaWvEj4jhhrqPm0ueD6/igr/ixN6GhwIFWXanK0qcSL?=
 =?us-ascii?Q?AZojpY3OSXJ4h1zG8eIM3LBY3z+/rr5WMSZ86xN8QLQ5HAWtM0FQko1KXntl?=
 =?us-ascii?Q?DPEW2SFOffMDZwNUIG8+XY9/ZdlLWs5ENWaX3ojZWsFVG5mNYGuz8gOMZ6tV?=
 =?us-ascii?Q?37bz2hMm/yHHLN1yGQJ9tzxaB+QkoidNo40ds6uqZqHItvcjfz8lybhX0Yx0?=
 =?us-ascii?Q?rNf9r0cWoJtQvDLavQEQlY8TeRuXeaT0xZ7Y1LeUeHJzS5xG0gKNjDhD0gP7?=
 =?us-ascii?Q?Zm5yI22DlUONB5eYIAIgYzEFphrlIQNnxqwFqRcfBnMIvsQbD9b0NA08ExcZ?=
 =?us-ascii?Q?mJsv4Rv60SQuF8P5nubN+rn/wOymveLGU6cAxMzrpFWJfFQ3hxfnAHSVmhYd?=
 =?us-ascii?Q?jUtlaunnsBCLH58dYek03VErZwRFDM7J6UQ2PMVkMWLky32gwOU/+YHcRzuf?=
 =?us-ascii?Q?2be2bo4IP+REBSY9m4FQbuJHLIN6Q8R9Pmj1rF4t+8l+xqbAn+MXh59OxI5V?=
 =?us-ascii?Q?ILr5eow970tDgbHIQaMRctnzT6eP8fyvkRGq+tTmeYTfKueEIy2An7LncfH2?=
 =?us-ascii?Q?ot5VUWYvVVfkTFf0CwWGLmjaUh3Q1YqCasvsaqqIeVcTKaVlR6kbTVUM3FAp?=
 =?us-ascii?Q?XWhJQ9T/5gHS7h4Y5oMUDvph1DQSv3KZaNhQYtVyVvPTj1S1AG0zZ6mYOHSW?=
 =?us-ascii?Q?KEwmv1k/RF/Je0dpNT8QMHzHfx068kPDJmdY/LcOiwZuGBRIgWCnn8GDj6zW?=
 =?us-ascii?Q?2Li9D1atfOeRmLQWn/jTWFJjfuP4lrLCsZv5M/BC1tD/KlAdgwAY3B9f8au6?=
 =?us-ascii?Q?DzhJ1TAuTd6VcM/lZIHW/u5jd+I/ukG3cU+3S4JbDyypJ49Z2wn6WHn20QI3?=
 =?us-ascii?Q?U1dse//OHrswUtUd63qbtGjeGXWToRG28niKPET29ppfH98wvS1p9IGI+EA3?=
 =?us-ascii?Q?kL1znwgH2goHRsv5+IUs+R4F84w36vu/vdsC2exnBVX9d4UYEyTONCUDYJvi?=
 =?us-ascii?Q?1oC3Qc0IioVWrcQtewhEpqe7Pk3whOH2rfyhHnXjzhqECSlU6wfzlZRGreTi?=
 =?us-ascii?Q?ki+A2YIw+SWEuHdlIWjItyPTyX3Id30fS9iIg8GlOritw9nNaTpNdm4vor4M?=
 =?us-ascii?Q?RSAvFdEjv3IiCLQAy5HyjF6baKbuHBPmf/nemtDt5kBzMpyKhPb7UWrPvctw?=
 =?us-ascii?Q?pzRQCFQxwnMc1PVlm5Sf41jEiiFLv2JkZLN+YGoWRdvB1WFUJusjsFmR7qo4?=
 =?us-ascii?Q?Bw4SVPsoitcHEts=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:57:04.6055 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59417137-b22e-4192-6493-08dd773c1e5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273
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

From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

Detect whether libdrm provides amdgpu_create_userqueue() and define
AMDGPU_USERQ_ENABLED if available. This enables user queue support
when building against newer libdrm while maintaining compatibility
with older versions that lack this function.

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
---
 lib/meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index d7bb72c57..8517cd540 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -172,6 +172,11 @@ if libdrm_amdgpu.found()
 		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
 	else
 		warning('libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable')
+	endif
+
+	if cc.has_function('amdgpu_create_userqueue', dependencies: libdrm_amdgpu)
+		add_project_arguments('-DAMDGPU_USERQ_ENABLED=1', language: 'c')
+		#conf.set('AMDGPU_USERQ_ENABLED', 1)
 	endif	
 endif
 
-- 
2.25.1

