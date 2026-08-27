Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E575C61DC4
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 17:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2771A10E09F;
	Thu, 27 Aug 2026 17:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qF70Nfdm";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD0910E09F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 17:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bD4gI/xJsn9EvK1PQApWhNQZL4l6b+IjUlT4FMYzOafE00nEg4Ox9MH87h0NLUAP3bYvRDhSpSFpi2Eh9G1bm9k7UNF8uJViaWPCyYrZOOcpmLE+1YU6W5IV4AmKClEWYqpfLiAUUesbQt4M/FaAr04f5MuOzT33fZeOzbz3+JrFKs6hkr63SGg5rVhUyi/NQI6UIWXCkVV2ttZpg32pg+nMRtnAkbT1QAYRYGQ9/G8+/b/Tm+8wVfSwzCRGu9Bfg4ybPX1wCAK7pSJuNOIj2qLZ4ayj+3zrJtc6zxQdIA95FhX+Bz5//4W4FiUu+hJltGxXZhtz/5msheHIpvJe6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8De82X8Vteou3kbvxle/wv8K6UK4Pt4DrdIwkfv9eM=;
 b=awO8bnLSaO2Mz7HbXYDjySG7+PqvodhRt3+wDq9frlEeeKf5o/bslelGdnE/CKsAN2VvxotMuIT1zL7r1cbIHo3Zij/6GOXyGyIwF6NPx0hegTmAgAv4s2LloMp2y+ruM63eiE83sl4XN/ykpHadf72iB86QDZNt5fTT3gEeW97V3jrLwSzrcZgSXcsmi7VCs4q8sG/0dL3Zjatkf3525NhNUl67plKox7EwACuP6Gz+HovQl4fFrTcpLRWSvlRxon8Nnmh3qYGgQeUDmiSaTK6qQrYy3JP4X4/9+IlXS73M5eX10whhlXmU7lSfIMtcXTF3MDTDzgTZf8p8FWORwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8De82X8Vteou3kbvxle/wv8K6UK4Pt4DrdIwkfv9eM=;
 b=qF70NfdmbyyNyzpdFrkLCxbjYnpK5HiBIFwo9eytLi0gLDwsNKiM7Tgf2P85eWrcZE74B1ToMF1dXqwnV5w+gp46YwhJ4u9/Z0tEeBgvtrYd7GgV1K7oOFxd6TpmcTTLMgrDfLhOID4HpE7ikm6DwColeIcNn34ZUcm0GBiBmLY=
Received: from BLAPR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:36e::27)
 by LV8PR12MB9184.namprd12.prod.outlook.com (2603:10b6:408:18f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 17:58:01 +0000
Received: from BN2PEPF0000A895.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::35) by BLAPR05CA0022.outlook.office365.com
 (2603:10b6:208:36e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8 via Frontend Transport; Thu, 27
 Aug 2026 17:58:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A895.mail.protection.outlook.com (10.167.248.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 27 Aug 2026 17:58:00 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 12:57:59 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 12:57:59 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v1 0/2] Enable amd filtering
Date: Thu, 27 Aug 2026 13:57:20 -0400
Message-ID: <cover.1787853061.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A895:EE_|LV8PR12MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f124411-bfe4-4030-c736-08df0464bbce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: BUg1qClQxHyutE089f06ePg8Kp+lOg7M9Aki5RQDvOA2yd/n2dMU6xWbUqN9XG/5p/0aBKsdnGG0lo96qcJCUuPc3be7cbO8ksNZ2HJwvqmLqD/CCtr/D8PO76KzFoZgs7gTz1aXuIeKjJB9QyNT+4SEgehPA6xqF4lhYi2xKWemIpe0hx5aAo7ZGsQhFIKMKjMgDgSUNgeCOJHwQXs63H9BRGvUy/GgeVUpSsHE5YVpkhS7i5GxPu8MdT5ZBYv2JqdCLro2JyOz9YaEWpe8SOFrppBAuBwhZL8eznslwarLL6xuFMWhlPwFooL8GaBguz1am+jOgElV8Z0gvXkzMNFOBEWJnuPKRoW1Kq+1LIW9lMzzS+1Mq6tR9EprYhcPMwt2Abkkiu4vJCIcPoolC+SN5as3zd9wcpLjBEpop6B1Wn1epnwTf60Lgl1/T7fzzjeofHcfbektKgrhaXrsbH3qPSA/chQJTJTnApfspze/6Tpsxr4Vh7IUpfm+Vlld5sl+1r4sC5sB5SGiYC+LKKhi4P5LAXZj6Fl30nNyE5T4V5AW5AejbJuXj8gHO9RFHxVZ+f7txNe5bWK6mCW5bePAm5hxpStdG3Ffj5+tnh2w0/fKG9o93fPEOAbD9XtfQ3ESc2898ZOa4XOiXWSU/ruts/a5GPpZOnKj475/3TNzIeiZCG87TWFOiki4SH+0t+z82s3iNfhJbrGxYnu0Sg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(56012099006)(10067099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4EL0U6qxnhLhlJ9HVuMSIvFqHq6q5Mp89d2RWM8SrxJU++tzxVSY3MDUcT2k4XOkH1Vrx2XRx8TnnDbcwXKDJW8+I1q+E1bG9YXAv/UGu+MrVlLAKOOZogvpMKo4huor5KIPeX4RB2F7a71ALYJlbEPHXEMRIVcnAKm3WAdxOdVI+Civ0uWprxiih9+oWI1PwT6sylN5MJRreKu2wKLXxC3g2wOBledo/5D5ld/8qJGfHZ8jFADwgAaRjup0M1nuvFh8HBxCGln4ZDRmw6iPgslqmQgn5zPPFMT53AfGwWlSK+OYdq3DCcIvgZjxFHwYjzMxIec1a5XKiT0Gbvbgj1HFKEeEoQvQmVpcxlNFjyiyb6NO8tvhZJFmq4f8g2/GCSWpC+H6ThM3b8KKWs6k0HF6qWvdN1nnA11mDPh4OCCa/0Q/uYo0swchXRZs48Kd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 17:58:00.2944 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f124411-bfe4-4030-c736-08df0464bbce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A895.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9184
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

Enable amd filterting and some fixes

Vitaly Prosyak (2):
  tests/amdgpu: initialize platform filtering for amd_basic
  lib/amdgpu/amd_gfx: skip CE IB tests when kernel blocks CE CS

 lib/amdgpu/amd_gfx.c     | 22 ++++++++++++++++++++++
 tests/amdgpu/amd_basic.c |  5 +++--
 2 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.54.0

