Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DED6CA5FAC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 15:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F07410E1A8;
	Tue, 29 Sep 2026 15:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ycakWQCg";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012046.outbound.protection.outlook.com
 [40.93.195.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7240E10E1A8
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 15:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLKRh/5sp09dFxNL6Yke/07HeIMLLKmfpFMaWOjphqDXPHTaJ0xUjcgj8xMwk8XuK5VMCApGDN5P4Y+Frn2SsZcdh6A7XLBPNCbnVK6hXAyGvQq8yb4pmP02arnzKmbl69FMvYmxkfqKGTOlW/tWFdVZJPoHUooBSQZ+zTjOfYHZKGslCj0JSL4f5DjrwJcF5/WsVNHVQu2RzpSYuc8YDVF2BdClU7x0nD92qje7fzpB07g+bfvvYDGVjzZs3ksC970UYXyK0HY2OCSmtXSVgKlv+vS6P/TiSdyfBG5mHGZIzbePFNAnXy9UlT9xlmcjFXlaJkuRF6MoMfJgeik+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CCN5Lk2795dnkHzobUO8nNWdgQaVwJae7FGe+2DscI=;
 b=VDQdCuhsh3l4wiMWJaddV8ElyvCaYPamfhp/G41JDMqesMKIGM18+MIW2wXneUKIZn2Adidvssg1HjktZqHpNzVPoVJWo72fa/mbiOAsaVF+vF2T/vgYDIckKMb7wlvFeNeIKh2loDYQaqfTHHtFL3V/cQTYTYniQrQJZTzkou46Yt5JFbXoYM8kknZCegfV9UIPhtSxvg2Gh9SceqKr8w9SQT89fpNChxb3cdwXU2sKwB9lJWX7x4pQXUfoYyGEpth+y3BVD1KROLwY+sa8s043GR68pSXY8w8i3fNkk21g1NVexHsKNF5asdACcm5iOhz4gsLMu9sAx8qK2BRXFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CCN5Lk2795dnkHzobUO8nNWdgQaVwJae7FGe+2DscI=;
 b=ycakWQCg5RNBIcHUKClFsavrFv5keXZKDGBM93ebnbZ1iPNXJh6CpMxh3OkzA7niDWi5QzDKcfBvRdUcvJ+WW7b6LMEy6KHgZouLQZvJY3LlFdZT2/Rv6ScWW1cgF6xld0ws+wurh/BdtOTrlSsCuf+Sr0brv9j0RP6NsD4g9j0=
Received: from BN9PR03CA0382.namprd03.prod.outlook.com (2603:10b6:408:f7::27)
 by DS0PR12MB8785.namprd12.prod.outlook.com (2603:10b6:8:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 15:58:31 +0000
Received: from BN7PEPF000000A9.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::24) by BN9PR03CA0382.outlook.office365.com
 (2603:10b6:408:f7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.22 via Frontend Transport; Tue,
 29 Sep 2026 15:58:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A9.mail.protection.outlook.com (10.167.245.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 15:58:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 10:58:29 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 10:58:29 -0500
Received: from [10.254.92.152] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 10:58:27 -0500
Message-ID: <70223cf3-0412-4625-90e4-cffab9e54c6a@amd.com>
Date: Tue, 29 Sep 2026 11:58:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_atomic: skip missing CRTC props in state
 snapshot
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <Harry.Wentland@amd.com>, <Alex.Hung@amd.com>
References: <20260923152113.1513938-1-aurabindo.pillai@amd.com>
 <21199785-0140-4433-add2-5df33d7eca55@intel.com>
 <20260929102542.y23ihtimz2xhjdfh@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20260929102542.y23ihtimz2xhjdfh@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A9:EE_|DS0PR12MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: fd44a82a-6f06-4df4-cf65-08df1e4281bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dx01CmlYlywe6nas6lleGNO+c9HDLDiCCPolyE/9WqRBL0EZU7KSvcg0fdGM6cpQpltHhCrRmA9KvSwQlC5kzt/YAUo9iCWT4gz0nPiDXPkuXitiM2BBxPxVtlkl0Fq6obHissK2ISv1St3psSfS/KhwI6dp6p+DSeyADwiXYHH/Fy3sZo6Tmz5Sj5ArWVK/gL1R+Z8mToLpxk3f/aGC11aCv43SZYuRRXHOf7SiB0+flFO2AkHy1Y0lOhqcumEmtMPLoYksZ8ANExEFUC8noUMBulA8ilwJPvxPuoAoFXW9jXtt/5WKZolO5CNRADRS9Fpsu1eA7HDggVONdDl/HZcsDLAq0ZjaAkPH9L+dvpkOPv27CdZN6p8SvhMwbH6YmrGeXN+JiIdROIa5IJuICs5abFxWJq/bj5PYKrj6wXXm2jyLq5QSD6VNcUqVHP00ewvsV231dB3kLZz8d7GbbtSj0uc9jF7xBoWqW0BrEwaP/2tAXVxR6QJeJafJ6mnf3aerLtsm1D/syz2RO71Lyqj5A+QPmBhja627Fwjb/Dns+oZulGJhefAvM/DUpyWfasE0ypX2otbcQnVV1oxBC/12/Ia5kuO9xpGdqdQZEXOQkeNOwKDYauxUy1hUc4J8CrPHG7sRigjnXFxGRuXzLgSi3uxbhxwnD7zIf+d1eAbxku/zD1FqC1Cs5piE9byGaIebXv6Pmm+qQazuKL24Fw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 85vc0doq7V9BP0b9MxByT/gSxmEN1LjF0qoTCl/g78j1Iv/uN17+lZjAn216q5GFQcH+DxcpvloLyFxgHhqf9QSie8ErAHSr84tnMGlFzq5WLTJFU+EemPgZ7o5bD94DZSBAWrcJ7hrnYh3sW/PR7DdV1Xj7ZHZjW8qdpugbpFW2ACqYg2MB2YQC/EVhFN2vH56guptCuubY7jDGa5LyIpeyhC/4x8jU8CPM4HnmdlanqcU3/CWrJ6hdiuIFQiy3t9voIno61PrdrlcOhWJRAdYJVZwQkFsUxXegvABaBdQiIBtKWxYExf+nFTaNeYBtCYVJLjJ5zGOIQvKbNqsMXO9DA7Le7IFaoDOqbJdbVeuZ6lCBIaq2giyQCxGbE2Rp7UOyfgNq6+PKV6uZDn6iUqycOuER0uv4GLmzxIE1VRKjqqS90eur2vp8T+ffKLfY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:58:30.2977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd44a82a-6f06-4df4-cf65-08df1e4281bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF000000A9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8785
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




> 
> Applied, thanks!
> 
> Regards,
> Kamil
> 
Thank you very much!
