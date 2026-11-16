Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A135606A336
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iN1JHm8g
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD0510E3C7;
	Mon, 16 Nov 2026 15:35:55 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F2D10E3C7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 15:34:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSa5PK1m7KAgnvPi1MFRyMm/YyrGUeLDUnvvYKYtT/5Wt4W4CLg57oYn4GDBwHfKpt3qkJbhxWzEEjV87+9Rn5aLap40oyfVBwaEstYEuDinmVu7465ShbEiG+HOQmCtVMqgTboGeLBurE61RzzoWiyBoM09txH3EQ8tSS11gP82PRxo1wSjo0EKv3W3PIspq8vBrXNVlj1YV4b7LOZtOllFi9AK9sMNEXaGhHAsgjgo6KC2OnuX+YnDYLHAmm0uUY9n5KuPupBBpJOKOQ3RKMM4A4/+0WCCKfDRXPTy+epX9f15lfeUAzLJ51zMIh9FRyUM+0uWrEp4HHol0/vpfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5fQGlK9WldGDrStHvuLZNtOW02VODvNxbam/clErCo=;
 b=oYhFw2UqDfVQCaSW/0+MDK8vOenPyF37+0EHjEAKMgI02A1zTneFCdWbRFB/9P6gN/8nkAEy9ntCI7Jy8h3c7XPIEnXORLIlc5EldpIR4CaR0oN8R2wwOwsoAxzYnJJgxPzWtSCjkTMZtRpv/jD/a90zd2q20vSCjr1JHCfd0Scdllc4h5gSwEtld8wBFsBIANlbu5vey6N79JikTYFjDPfma9iWWKAWHPxhWjUGwfyxjzf/I9+ik4K23P+S+8A61WrMKDPU8nTALZim3GTk0rmIqzc4jUN5Sy0XcXnmjFB5u9o57UQXEKO/U0zapSl2emFmx0U465/EL0WjcvUjmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5fQGlK9WldGDrStHvuLZNtOW02VODvNxbam/clErCo=;
 b=iN1JHm8gfCg2wREesqUjLF5M8kDnCeHnL8L7KA+2nMoqWddRKU2vkUV+aJq2NJisD4M0Pxejm7L1oJQsBuyJgAc6PFU++whIqB8kUDIyW4X3naLpFEULRWdlUYAf6P3AXiOYDwIt/mQptpA2y6MsBoNIZBqbmbguPwEbuJpqUgk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18)
 by PH5PR12MB092088.namprd12.prod.outlook.com (2603:10b6:510:500::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 15:34:43 +0000
Received: from MW6PR12MB8705.namprd12.prod.outlook.com
 ([fe80::e75b:745c:ed13:f321]) by MW6PR12MB8705.namprd12.prod.outlook.com
 ([fe80::e75b:745c:ed13:f321%4]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 15:34:43 +0000
Message-ID: <da1d7d50-2807-4562-a3d8-ae927ff0476e@amd.com>
Date: Mon, 16 Nov 2026 09:34:41 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/amdgpu: add blit test for VPE3
To: Caden Chien <chih-wei.chien@amd.com>, igt-dev@lists.freedesktop.org,
 Solomon.Chiu@amd.com
References: <20261116132028.2021-1-chih-wei.chien@amd.com>
 <20261116132028.2021-3-chih-wei.chien@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20261116132028.2021-3-chih-wei.chien@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0179.namprd04.prod.outlook.com
 (2603:10b6:303:85::34) To MW6PR12MB8705.namprd12.prod.outlook.com
 (2603:10b6:303:24c::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8705:EE_|PH5PR12MB092088:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c6606e-5a7e-463d-d8ed-08df43f722b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003|261022075727099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: Y5yeKxoc3NPliPrsrIFXWQKmrc51hqrbg+NQTZDJSTgDKqFxgcEEq24yKxlaVGWq876iiFpbhtO4C9rd1P25m136hBIsoPWX6FrUX1wj1MAqPh7tUMHgWCgMXafCG+dG+hHY8X1VNx7T2ob6uedfxJ4qg3TFXGySMsXlCV7oGlmo2oPnDhs+a8kKEZHK4VxdQuYRmS4y9uMnxa3l82GiUHcA70wZC0GtPIwuVw9C13ZAzLnf7bupqyoUorBf+NUc7wUcQxt8C8+FBdYN1GvdBJnVfU5zzubjZ7AX6ZTA0QjYP6AipnARTnT4aXmCc3IYP2j/HKARXmiwkJI8TqzprG65iOidTdVt316rSPfnMtIquv+M+NGVDLigL/tVBucMxa4QCR8zVY5ft3hppQmlfHnHzpjl/+R02tpr1aPRhxyuQrF5PUpcBceTdv26AyCVFlU0Jq4oJ2jKIS5h6Ptacz6SNqPIfbpSo5FxO7XPnVAxUVU6Ml+9c8jZZ6kU9I/bW7+nDQnbsvBQGCz3D+OHZs/kjAyGsHUQBf7TVhmlWcB4DkN3C4bRfNprIz1kE2Xc25qbqarqhW+2VLNsV7ZI8IUdEcJVubNQNafTGVwbzp9nNGbKLy9k502qKMS/cgdrWW7tujCM6BIvvhvwucnaexDZPbs6BNc4ABR3C5x79jg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003)(261022075727099003)(261021121427099003)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUNaUE9pZVp5ZEpXOVYyQVVPSTdTMGRwMFEvenBTYnJrU3Z1RVFhQmY0VE8r?=
 =?utf-8?B?cnpRbHkxbHZ2ZGJidmNpNzB4ZDNpVHJKcnd3Tm1idXF6NmY4Z2RlUjRqTy9m?=
 =?utf-8?B?am9MaWd2YVQ5UXY0UkdKSjJGRmF2V1cwS2lCWXN3Q3ZPUFdaSVNpNkw2OXNu?=
 =?utf-8?B?THRPUVhWNDRDZHJGWktJYlFxZnlMcWJ5V2NCODAreHRRbGw4NjhsbC9HaE1m?=
 =?utf-8?B?L0NuMFVUVHhqZFMyWG1yeFBlL3MwV3p3TFlpamcxTjhGQzcyS1FScGN4NTZE?=
 =?utf-8?B?R1MvejFNNDZoMlIzS0I0Z0R3ZktlcmwvclhFSnBmR2tVaENtbnYwc1prQW1B?=
 =?utf-8?B?L0pRcThoVFhQTk9DSlVTNFJweXJ0VXJTbHM1dlhxV1JaSjBwMHhucGtwOTRL?=
 =?utf-8?B?YVYvVGZ5VzEzT0NhU0hnU3ZYVmF1TnhXdHdQbHppMi9IOHZtS1pIS3lka2RH?=
 =?utf-8?B?U0l2YlNtNUlwcnVhaHJwVzRBNnNUSk4vWmtRcU9GdjdqMEpLalFvS3czNGdM?=
 =?utf-8?B?bk10akU0TlhMU0FRNklGdlBhdFRGRzVkL1JCcmtrLzBpY1lwbnRaN0hZTCtL?=
 =?utf-8?B?VE5ac0JFMDcrRDFlckFjRkxhdmxLRFZxUHRtb0dSSktTb1NET1A4c085bXB2?=
 =?utf-8?B?ZnB3U1BmYTN0STRWTFgrYmJTRk13cnRyT05KNzM2ZnRVRm9QRVV4K1FrWDdC?=
 =?utf-8?B?c0ZhSXZTL1dJcEszZ25OSEEzQzNzdHp0VWFRWjd1SXpXZUpjTjFOeUdwTEpN?=
 =?utf-8?B?RnN4eHlVcDVjbFhrK24rUlVDRWY4WUQxdHhxZmVLWHRVcCtQNVkxNHNDNlRS?=
 =?utf-8?B?Z3R2Z3RiODlLdittOGtQUldydEo5R1B4bmk5dWs2Y3R2YkR2WElRZWxDK1E0?=
 =?utf-8?B?MzdHNGdZSDNvckozd2JOZXl1K2MxV2U2NVZrcTZYK1MzRFdKSi9La1VMVTAw?=
 =?utf-8?B?NEgvTDFDM1ZDUlJleHphS3pEZ1U4MnVLRFNTOXJvbEtrcXJHVktCemJDZlY2?=
 =?utf-8?B?MGlZYlI0UHkzNC8vQkpxRWVaR1h2MGE3VVE4cElQUHNxZXQxWWpiZmJVWi85?=
 =?utf-8?B?dk9qd2EwUFZqdngvb0J6bEpIWWE4aFFONE9zMTZiY1dPMHVOak8ybW83STAx?=
 =?utf-8?B?SDZRRGZERlY1ckk5SW4xaWt2eWlRS1Rvc1JvVlBmTDhxSG5hS2VoSkd0ektZ?=
 =?utf-8?B?TUJMMytKdjBVYXcxT1VUc2JRbm9JUHhPS3d5c0NzM2UyT09ubnNHVUhJS3ha?=
 =?utf-8?B?M0NBVE1kTTgxbUpBTFZLVndCYUI1dWl6MFVDcHJ0SENIcXNBaFUzemUyMmpS?=
 =?utf-8?B?WTJSRTBWQ0lMdWQzQmFMZGdCTDBpdWVkZFlQQ3lLUzJGUmVYUVBHMEI0cnIv?=
 =?utf-8?B?WWxVR3F2L1JlTXlTMkhwa2lCOG1iSy94YTNoclU0cGgzSzRLOUYvWTZ5T05m?=
 =?utf-8?B?SCtvS2w5TWRVdlh4eTVxM1pCdlVlbmxzL3ZrZjJmOEUzS3U1MkwxMS9JZm5u?=
 =?utf-8?B?T2dFQi96VFFURS8vbTlaQUpQWlRGU3ZyMkUyMFJ6ZlNmYmVvenVHZDFsQzNl?=
 =?utf-8?B?bC9VMmNuL3huZG5iWTlzTlA4T3RkdzAyMEc3T0lqK2lrNFFOMnBLNVZ0NGMv?=
 =?utf-8?B?QXdSOEJuek56b0QvcDlLM0UwKzE0MGlZcUpJa3BjZWpETzhuWUErOHR5b0pW?=
 =?utf-8?B?Tk5BNHZZTGc2WDk1ZXF1OVJmNUZIUzRyZ0hVamV5azNQSXptcmZpSFRwS3NE?=
 =?utf-8?B?TE1hM2hZMHBMaWVmdmZmaXJVVTJMdElFVFVQUjdRa1psZzVDdUFtdTFCS25x?=
 =?utf-8?B?eUU3akVvM0lUczJLTGhicUdLeENoNlNLYWJiRjlWYjBGWkUwb0ppUHdPNElv?=
 =?utf-8?B?L1oxMGNmc2xiTGVLTXZSUk9zQUxVa2JiQ3VWZFBaNnNRMy9FQ3pKMG5tSHA0?=
 =?utf-8?B?NlI3SndWWnY3RTUrcnZLb1pVbXJHNGRwdi90R1FpdWpTcUI1TENkckNqYnRh?=
 =?utf-8?B?M0tNRWpmek5qOStvLzNJZ1FpQ3NUcFkvK0g0b1RvU0tFU2tSUkE3SEdGb01a?=
 =?utf-8?B?bFhkOFpZRHp1SVdxbG9PK3VSODYxYTJYMWlZRENHTU9pUEZHMjF1dmhodnVH?=
 =?utf-8?B?OVRUM3c1dlRITGdYbEZwTjVTc05ydEZGV3pTN25TSDdpUFk4RmUvTnljR241?=
 =?utf-8?B?bExqa1RYcllUdk9iVHpGWlBxam51QzZUQjNwOHF3VG1nRDI1dXNLbldPZGg0?=
 =?utf-8?B?RUpQZHRsckZnNUtnSSt0N0RYY0picXRtcGFyYlBTMW52cXVNV25ZQ2FQYXpu?=
 =?utf-8?Q?5gzPVYLfT065dMrc3z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c6606e-5a7e-463d-d8ed-08df43f722b9
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:34:43.0821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vtmg1oYVe4IAdQav3+Q7kj/uWdx5ZjWlBUmF2f2+prBOhcnBEuaI1vTsBFZcCds6QBqFa7rBRRJzUbuwNe3VKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB092088
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/16/26 07:20, Caden Chien wrote:
> Command objects and job construction function are added for VPE3 blit
> test.
> 
> Signed-off-by: Caden Chien<chih-wei.chien@amd.com>
> ---
>   tests/amdgpu/amd_vpe.c     |  90 ++++++++
>   tests/amdgpu/amd_vpe.h     |   7 +
>   tests/amdgpu/amd_vpe_cmd.c | 459 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 556 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
> index ae76445af..815cd7adf 100644
> --- a/tests/amdgpu/amd_vpe.c
> +++ b/tests/amdgpu/amd_vpe.c
> @@ -309,6 +309,93 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
>   	free_resource(&dst_plane_bo);
>   }
>   
> +static void amdgpu_cs_vpe3_hmirror(amdgpu_device_handle device_handle, struct mmd_context *context)

amdgpu_cs_vpe3_hmirror is duplicated from amdgpu_cs_vpe2_hmirror. Please 
make it a shared function.
