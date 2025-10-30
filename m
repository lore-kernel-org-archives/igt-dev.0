Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46733CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C6110E8B0;
	Thu, 30 Oct 2025 04:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IinBWBI0";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013008.outbound.protection.outlook.com
 [40.93.196.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1E810E8B0
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:30:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3orXfxe5+fI6EI05n4Su58ive3A7Gn6EsVqKxffBsNTG6ihLam6DoUFsHxdaP2AABdsBJa6VDMq9m/nbrx7Ou/rBCzX+E33VMfcDbYwXy8VJdXMx54sZjQqIJW5/g34HDhKSynq5pPlrPBqLS3YItCpee9qSeHbkKvPova1yWZvlHF7ghgN4Lug3XhqlXiBHnIrxIdlJrEMFOdNGlIyh4diaT4kCGdw3tmdEKrWSNjMfE6BTJBsOXt+udZPDF2z4gHb0N0Kq1ooCaqwTMxQHPykGMltAosJTuIMlHntrbi46u5lmMYKltOYFQb37BlCVAXgLzRB1jDi3973Z1lLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPKFEcT9F7Hpug8o9zPwqn9/y0TmNzrsAa8U57tICRg=;
 b=k7MG4XyCNHYrsfgt/kuS8+KHH18mJDvoBfB7w0N9TMSbG5RaZz49faKbJ3C5/zOg24Ejr3bATZweRhPmovnPWo8899LVDJ+LJrR4fiw05QUdqJ6WL/8LnfnunzW/CnQzypveTmT7KQHANWCGpu5Yv0dq11Zzh6RwGwEud1/5LpbjPTGyOzgyGrawmja8+AIJIC/EGo7GCJSrVPtFnUT5tPsrYtQBlMLBxLwfL6K3+eOvqdK1v9oYeEfpkkT/BG4OFUyeq+nNcEKkO6HQs2oEeirgyiY2W4jQgUGO/h32GCsuQZoauU8pC8zgvpAg4SWeRaHVRSpAhu6oZ2HzxPcrRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPKFEcT9F7Hpug8o9zPwqn9/y0TmNzrsAa8U57tICRg=;
 b=IinBWBI0wk+fvqwze8OeF65afAfUv06GuMAEOtCIMs85uWc0/PIKQhsetRXjRp3/g3kO76DgmOcOwQ5F8hIwQAykS7Kvqx/aM2kG8EymRRD3PFg7sZ5/BEcpmOt9vVi7zyUCDvTwpZCQs3/cQPRJBYW+tJSP4zsWihecWdVWXrU=
Received: from BN9PR03CA0351.namprd03.prod.outlook.com (2603:10b6:408:f6::26)
 by DM6PR12MB4482.namprd12.prod.outlook.com (2603:10b6:5:2a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 04:30:21 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::43) by BN9PR03CA0351.outlook.office365.com
 (2603:10b6:408:f6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Thu,
 30 Oct 2025 04:30:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 04:30:20 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:30:18 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, "Louis
 Chauvet" <louis.chauvet@bootlin.com>
Subject: [PATCH V11 10/32] lib/drmtest: Add is_vkms_device()
Date: Wed, 29 Oct 2025 22:27:39 -0600
Message-ID: <20251030042801.2315866-11-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DM6PR12MB4482:EE_
X-MS-Office365-Filtering-Correlation-Id: 447a2d21-6bab-48ad-4f1b-08de176d0942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dk2PPI9gVu9PMaaUYcGVk1WSL1u50RrE0m+mTGiQ5Om+ek7eHki3R1V6o/b1?=
 =?us-ascii?Q?mXDtyjMSY1Vdl29pkgmdoCZZidbajwIOKi0aeSR52Gd4fJiYlF6VUnqIMNfd?=
 =?us-ascii?Q?EXBVBil3xpyo6SF5RK1+hAyOaETC+yY2tNG31ee6zYgp6haE4vq3i9a9aMJl?=
 =?us-ascii?Q?Qms8CVCJEDwHMXydx24JR2ZC7A6pSCCgfuYF3/SS3nrSVdbElcBuDDtVdYi2?=
 =?us-ascii?Q?P/tmHrcLvrfWnryzRpdM8cktMwBisbOtrP/E6pcc7g8P8ICZajB6wL6qYA9K?=
 =?us-ascii?Q?H6ywJrxGXsyeiAatRpTQRO2XcR+OuDAZg1c/WGyeeuP/trKmAklgte4uSSnq?=
 =?us-ascii?Q?OqDSyCfTziw/jdTiYx4yClKAH4Wxi3YfHU0PBEZLsPgto7/seeBoyLYXzk59?=
 =?us-ascii?Q?QGi+I5mgjKsajWSXoDWbH6hwl5YJ7/yg8N65Xw0pyWnLsyixpIRwWu28ERLs?=
 =?us-ascii?Q?xRSv9+wg7kyNk8RyBLiMGEWyBqPOxybUJrWMo9J2jhanmus44x8FwZ9AJ6r+?=
 =?us-ascii?Q?eZr+vmQiDcttypF/fKw0y/KBkTSjpHc0mpO8ACkoDU34fDSZiGD02/Wma0Pv?=
 =?us-ascii?Q?o0q788xzTq7U04H+ONGLQNUDyH0GjgHXKJczCBhdw8AbnvdF80u451+6v0Jv?=
 =?us-ascii?Q?2KvV3z8Cq9e1al0paralRf3r5k/0jOyAn5d5tGbLYP7QNNHCi+GSY0w2FEiN?=
 =?us-ascii?Q?UXxamRIgTmSniEwT48LdvFNul97I/rLqkA6Vwf/4vpYu0zpoiJgV92o5Sej+?=
 =?us-ascii?Q?rGh5oZ9xWYSjvWeF7pTTNXLhPRN/COtQyDxqcanlUk4EsUoQ/ZlWGC4I13TD?=
 =?us-ascii?Q?0SFllVqirFkK0zBw+RbQyBJZ+/QrISEL+FGvljEM1yuX6cg8V/6HW8Zr/Fmq?=
 =?us-ascii?Q?uL7Y58HRnZnlxiGhzgQ+iUeU5NF2Zdv4XQgICR4A2tzUVBjyLRaAwHtKvsZD?=
 =?us-ascii?Q?3PLZr0ogWa5vFpuvzymNxnEjyb+nj3HiTjiJWtbxWvjyVCcRQgwGQiALGuSK?=
 =?us-ascii?Q?RC8s1WNr/4R4UWzw/DAx4b1wk6kMGwPYkngpmME9oqziy4XGiHlM1flUi4ke?=
 =?us-ascii?Q?tCkrF5MXbB5upRPkD3IOpxNOo0GnPBoxEjZ6sofEP27XrIm1FWHW15Tin5SS?=
 =?us-ascii?Q?XPwkf07llo78Diee4srSp6hWOtuInXMT3H+FxN76DHNPKxDHWUrO6NC7tN58?=
 =?us-ascii?Q?HozL+rtd4L4HqGkTXZFAEdaZUHivSzRRjsKbPs1RmlikbFUTdZrx64/+lQ3s?=
 =?us-ascii?Q?vFQL3Kfb55Ad80pqaEEmixWjtQJrTEBLVhLhhWKQIYei3pAGPphd/ASP+Xpd?=
 =?us-ascii?Q?BYZqufLZF7AC7BQfhBILhULqSKkzX+Ea/D2D2haPr0faHwmc9hgSP1fmGCGJ?=
 =?us-ascii?Q?7oVetlGyinubicUNGK5+bO+UMUuVYaKInqwHKD7x/97wEj3yPHHBRa1vigBF?=
 =?us-ascii?Q?fb1WW3UCn2IS0nZhF8nwBUyGa7X6KVhseIfoZ8v5jmmkOcsAsDGCP9qf7FO/?=
 =?us-ascii?Q?PVX9iUJiUYOyEuLBn1BkjBIFF0Cz1CLJVWvgmWYySC0JheeklgEOEMq2UsPh?=
 =?us-ascii?Q?NceN9V7AeeQpdh2/bo8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:30:20.6976 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 447a2d21-6bab-48ad-4f1b-08de176d0942
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482
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

From: Harry Wentland <harry.wentland@amd.com>

Add a function to check vkms device.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/drmtest.c | 5 +++++
 lib/drmtest.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 590c4671a..d5840aaed 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -118,6 +118,11 @@ static bool __is_device(int fd, const char *expect)
 	return strcmp(expect, name) == 0;
 }
 
+bool is_vkms_device(int fd)
+{
+	return __is_device(fd, "vkms");
+}
+
 bool is_amdgpu_device(int fd)
 {
 	return __is_device(fd, "amdgpu");
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 8416aa491..55bdb4bad 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -141,6 +141,7 @@ void igt_require_vc4(int fd);
 void igt_require_xe(int fd);
 void igt_require_vkms(void);
 
+bool is_vkms_device(int fd);
 bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
 bool is_mtk_device(int fd);
-- 
2.43.0

