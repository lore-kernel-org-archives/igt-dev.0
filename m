Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBA0CCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 21:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4C610E7B4;
	Wed,  5 Nov 2025 21:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2VR9bO3c";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011039.outbound.protection.outlook.com [40.107.208.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BE510E7B4
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 21:51:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPxLqDpsp1E5+B3uz6xUvkMUWjn0kroLvQz/HOCb9UerZzxXvaCTO1hIgO0gCRc2NqPbNNoCu6WDv7hyHtR09aK6+CiaB/ocjyZu3FRAjCxGKxgbHC6QDuVdB4U1hQtblR42pCsGsGcL+rnPTdWIiEuTP8GTeF2sTIStoCNRdNbkWCs+lCg+BzMAUn664zQb1CTR+XkK58ZNVUHIwjOKdewDLTR0tsiA1LTfRqe7tjD9pj2+sLMLNxYuVpW28HijFXlMPzJTEhqiQQX7A5k5VfOXy8YwfIIRJ9zGFDBnJbslhUV+DxiK0TSEa5VrteOwdzqNE/ou/WdazBYZSNKJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G110XJ63RdUqkNoEbkjw1ciijUz4qmjlwD0zCcOM/wk=;
 b=Lj1zHg2Mm2GDYvVjXisfCNPmeDfUhQTyxD+oO5gLqdhMGGOPFQLNmWUgrU6UniEyB4C0lezxWWtq5nO/5uhOxYLE9dtP8RHcgwN55sAElzD93b/mwo/z8OrN1GUL5TXR31YawTyTQqGeX+3Jbr+0PjGUqZO5yyRyooD/JZR5IT2ZLpdqjGk7ba25usS0VBjq1MdT3MRQZL50Bk69b4rOwrQhT2uzRv2qUFmZ7hOHk5wreB1lYwcyJ2UOBdd5o2qWDcZ1NaLDA5qljlUsAaDn/veUVcMZtzaKzWHhC39cud78w3C4V9cIEftGEXaQb6NqHInH3+Zg9Zuw+I/awwu6kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G110XJ63RdUqkNoEbkjw1ciijUz4qmjlwD0zCcOM/wk=;
 b=2VR9bO3cD2pMTIMpxpQT3RZM0Ju0yzvk4Xw8FpmG3rNpw03LKRdYzOlyD6viW8gWCLy2DSycvKHKWg4P+Um/T9E2bkRqzjqvLm0CkVs9Yc9FX+I8s6wH5ExtceKsmJvHHkJNQa+imOL7FkXBFVB09cE1y/j8Cjtr8pOxyxzKuOk=
Received: from BN9PR03CA0847.namprd03.prod.outlook.com (2603:10b6:408:13d::12)
 by SA1PR12MB5637.namprd12.prod.outlook.com (2603:10b6:806:228::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 21:51:45 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::16) by BN9PR03CA0847.outlook.office365.com
 (2603:10b6:408:13d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Wed,
 5 Nov 2025 21:51:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 21:51:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Nov
 2025 13:51:43 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Nov
 2025 13:51:43 -0800
Received: from [10.254.40.35] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 5 Nov 2025 13:51:42 -0800
Message-ID: <365d5f0a-d4c8-4aaf-a5c8-906702b56b79@amd.com>
Date: Wed, 5 Nov 2025 16:51:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 20/32] lib/igt_color: Add PQ variants for 0-1 and
 0-125 range
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-21-alex.hung@amd.com>
 <ac2f9737-f6d8-48ae-a310-c267f92b880f@amd.com>
 <0fafc468-14f8-4ebd-b72b-7c71c993c1dc@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <0fafc468-14f8-4ebd-b72b-7c71c993c1dc@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|SA1PR12MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd6edcb-be73-4a4c-2b85-08de1cb582b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|42112799006|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGJPZDVLNGN3NGZMZXl1T0hNbDRIVGlFeDUyRmQxa2FWWWI3c3pBbmVEbXpy?=
 =?utf-8?B?ckFiS1FISzd0M0w3TnRUZzhja2crUklWMzNrckh4bkhRQ2FGUjRRakN5ZVMv?=
 =?utf-8?B?WnZtWHp6UXAzV0hJN0RBbXJGMTg0S0dSZ1YxRkl6R3c4ZWZDYy9aTHEvMjgw?=
 =?utf-8?B?STlBMGNwbTlkRGtZUmxOUlgyVGlEcStLempOaUV3TjdBK0pwaUY2SmFaK003?=
 =?utf-8?B?WEl4a0pzaDdQMzVMdkwvVXlpcmtPV0x6QlZLRGlHT2xJTlROOXoxSWVQN0FK?=
 =?utf-8?B?YitPOG00emtVc2VBQjA1SW5nODJzcTdWeDJkZDluRnp4UmovTjBXbFNkdDF1?=
 =?utf-8?B?dm5LaGNpb3JpVVViY0hhTXd3WndhZmRmbFloUjhidzNGRnpZNC9aSTJuYkp6?=
 =?utf-8?B?djJLcnNjK0krNW5pVGtFUDlYNXZxNUVreTR6OTJqbng5cEx2L3ZNK09KOVdy?=
 =?utf-8?B?M2h4Z3JucE9WNGpiQ252bjNqMGFUUkE2RGRxRmc0K3hQc2x6cVBRQllqbkcw?=
 =?utf-8?B?VktpWkRzUEN0ZEk4MjNnbzI1ODVzQW5ydHFwRnZ2UGdpMDFLMzQrWXhmMWlP?=
 =?utf-8?B?WGNzQlNmRVh4YmJGOHp6RnRlcEdpM2JEUXkzd09YUzBJbUkvK1JQYTcyZ3Rv?=
 =?utf-8?B?RDVxOUJQbXpIL3dNRFJTT0RUZDZmLzdzRUcvRVk3TW15a2JBb1U0dUZpTDEr?=
 =?utf-8?B?OVFxeDlRMTdHMlFyWlJQejZtMTZlcGxkM0lkZnZJVkE2cXY2WTZDdHZPMnVI?=
 =?utf-8?B?V24zaFFtaHZnWHJ5SVkxNmloUEZvbmcyZ1lCejIxL05NWGJTVU9zaElHZXdM?=
 =?utf-8?B?TjF2SE1lZDhHVlRVaXQ2SjU3RWhOQzBJVVg3TUJJQWRKYlhCajB0SFJka1V0?=
 =?utf-8?B?cnIvUU00bFlNdEFoRnNlMWZHLzRNd0hCM21qN1lBNTNneUJ4cWhsZmFoK2N2?=
 =?utf-8?B?dVNPc0tuT1dhYWpmM1FyQVVlczdvN0lSL2x1TE9PbHdTUjV6UVhSMWZ3Vlp2?=
 =?utf-8?B?RXRRR3F3YVBnVTcrb3p3SHMweGNJaGhranpud0JacmRqa0ZKSzhicklISUxJ?=
 =?utf-8?B?WFZ2MS9IcGYwYkhYLzI4Ymt4M0s4R3hXa1poUkdoSlg1RFZZVVgrV0dKZ1Mv?=
 =?utf-8?B?dFdDU2QxdFVQalNSUXlqdTRtSkdNOURjdkFXcDRrVWhjcUZ4am04ZGhsZ2d2?=
 =?utf-8?B?VHcwK0p4YndsUFBVQVVsYWNhNzNIMlpSQVVDR1BOaXljbkk1dXhPOHNmRGxj?=
 =?utf-8?B?R3Vna2FNZERYNVVDalQ0RHlYRmJoS1doSTIxYTJFZ1QvNm9aaXFISGJRQzhS?=
 =?utf-8?B?NXF5R1NHc2hnYmZzaGZLSFBFajgvb0x2QUVvRmZ4TmYzZUJicTNIRFpUTElI?=
 =?utf-8?B?SHI3WE1sUzh1Nk9Nb3BFZThLMG50cUphdWZpdzN1T1MwQkhxYzBpckppaXZR?=
 =?utf-8?B?Wk5uSUp2S2FyNGtaOWZCWS92dzhPQitYVGJaOWFPa2FPRkRJSVlxdngzNEhK?=
 =?utf-8?B?ZGZYNkQ4N3B6OG1ieWhOZVBOQmRBWFBiSWZjT0ZJdDJGL2xnUHFqMkdSaitX?=
 =?utf-8?B?MTZ3bXJJdCtuUXJwUEpMUU1KS2RocVBPOE40WURpRWtEUWw2Y09IdENsR2Qv?=
 =?utf-8?B?YXcyYi9KRzloY3hNYkV3VFNEcExPR2lmV1QxZngxQy91RC9VbGRJSFdkR1Vp?=
 =?utf-8?B?TjZ6MUFwMForU0h2MVNhMGI5ZTZrbDFtcStiRzdpOTVNcFN4RG4vUjBFZGw1?=
 =?utf-8?B?ZUFvSWEvZE51NWtTSTJjRENuRkxKS0NacXlLNlJCcFM3bGJ2YmxHREdnc05t?=
 =?utf-8?B?c2hkMGI3L2FGVWUrQmd5K08vNGtxZExlc0pqNDBUVlpEZ1Vubm1wTHJwL0hK?=
 =?utf-8?B?bUVzZ0xkV1lOMUNyd2lZOGpVc3pOajZVcE1wK3IrM0tFc3RRbi9QSm15bUlB?=
 =?utf-8?B?NUllK3hIQmgwVlhTQkpsdGp0TU9WT3NVNUNKUVpzNUpBcUxHLzNBaU91MVFU?=
 =?utf-8?B?VWt0WDR2QnVwNnl5aVRYVnh4TkNmZkpOUmd1ZkxNTC9scnVjNEg0VGFmWm1G?=
 =?utf-8?B?a3o4c2NkdUg2OGJzdGFZeEd3NnVsTHpBc25ETWx2N0NlbHhSOHF1RUQzV3Z4?=
 =?utf-8?Q?f3DY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(42112799006)(376014)(1800799024)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 21:51:44.0341 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd6edcb-be73-4a4c-2b85-08de1cb582b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5637
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



On 2025-11-05 14:54, Alex Hung wrote:
> 
> 
> On 11/5/25 11:30, Leo Li wrote:
>>> +void igt_color_pq_inv_eotf(igt_pixel_t *pixel)
>>> +{
>>> +    struct igt_color_tf_pq inv;
>>> +
>>> +    pq_inv(&inv);
>> Not a blocker for merging; for optimization, it might be better to define pq_inv as a static matrix instead of recalculating it for every pixel.
>> - Leo
> 
> Thanks Leo.
> 
> I created a pq_inv_eotf to replace pq_inv() as below, and tested it with
> "Subtest plane-XR30-XR30-pq_125_inv_eotf: SUCCESS (0.789s)", and the time difference is literally negligible (all ranged from 0.802s to 0.775s). I guess CPUs are way too fast.
> 
> I'd suggest to keep what it is since there are no visible improvement.

Interesting... Agreed, thanks for testing it.
-Leo
> 
> ==================
> void igt_color_pq_inv_eotf(igt_pixel_t *pixel)
>  {
> -       struct igt_color_tf_pq inv;
> -
> -       pq_inv(&inv);
> -       tf_pq(pixel, &inv);
> +       tf_pq(pixel, &pq_inv_eotf);
>  }
> 
> 
>  const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
> +const struct igt_color_tf_pq pq_inv_eotf = {-pq_eotf.A, pq_eotf.D, 1.0f / pq_eotf.F, pq_eotf.B, -pq_eotf.E, 1.0f / pq_eotf.C };
> ==================
> 
> 

