Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AF4CA1015
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 13:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBBC10E250;
	Thu,  4 Sep 2025 13:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BfXgLUli";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B3310E250
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 13:20:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhIS+JVM9dmnKhZsjwwzPCiIokxM5iZ+Dg+QLojtHFa9PPxdKCjVb1pNMfHN4H9m9Nw/MsKllK/OL+5odcfDbGi5QA4NM+W85PC5JTs6Rmn37r5wxiwPdSltbxXZsWz6z1c2iWrRN8FbMie4e5RNl/tmNN7A9oM2VVDGazY2jtHFj0UjxPHR4IHwJRnbz59IKvj0U6huq0IZ7tyX19jYX30GM3IevrFOUCBzKbLtJ4R30NE4bCa9LnRdXgaJt51nah2bnkmubhpUQSI8NEIra2kO2l4W3Nk3YdgUrQITOu1vcqBQgfkIxh4cbqs2fX3TSzJvxPvIN4tYjMIQx1pHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLMrDcORo3jLAK2kwsBzEowgAm59D+0OfveUOQrCRxk=;
 b=LjUzZkuRvzTXgnSU+gmhuVjRX6Yp8WBJYSKr3Y3T75Lz+eIjynwkHtcdsjrIMdXH7JlFrWWKTCdh+6kB9VgFbilnt/jAAStUnP69KMhOL16svPzjDE8xBnwUNmstjFKgSWuDJJiDXrG1ib7E3Xo9XdxKAFPmkXVl+iffe8uNNdYSHRbOoU04GeaTGOqPLzOePdO735FwXL0DqivEXikgIw8jP/B7eMMkkVPNqvJ8b4EUrwR77I00/5qD1ilBrWxLVxBlGh8LcFhGqSf0drJ95aHVtyjQp/9weZbMF1HPI6fdMYrkr3GEK1tngzA8c9LTxnGS+uVGPNeGd98LUQ28QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLMrDcORo3jLAK2kwsBzEowgAm59D+0OfveUOQrCRxk=;
 b=BfXgLUliIE7EZI7SyyUgyLIfns7pQ0WNDEjJLZCO+oTfWVtf8ViIn2Vwcsyf0zHttfN9twu1bsb7/AGrlphm0/0MWldm40/vIVwt35Nh0UOQJs/Gc5ZdnN89w3PrHLcYs3A1wNReyhhyCGilHH4p8Mjsobswn6+Kaj3m49c0AxI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by IA1PR12MB8192.namprd12.prod.outlook.com (2603:10b6:208:3f9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 13:20:21 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 13:20:21 +0000
Message-ID: <bb362bf0-41b2-41b8-84f5-9ab55889edcb@amd.com>
Date: Thu, 4 Sep 2025 09:20:18 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/amdgpu: fix double free in deadlock helper
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250904074034.3210105-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250904074034.3210105-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::10) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|IA1PR12MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 536a8dee-9ae6-402d-83bb-08ddebb5cca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1o0WnVlYWVpZlkwcGJuTDlTY2d3VDd0QjBLRmk0L0x0akh3MU43U1RBdWNj?=
 =?utf-8?B?Q2VLWUZrNEliWkJQRXlWM3RESFFWM3JGMFduN3NCdEJ2R3FOempRSXBhc1pL?=
 =?utf-8?B?eGU4NHh6RjRJQnF4b3NtbWNvZGNyQ3lSRklvb1FvWUZuN0RPeFFnUU1HZk0v?=
 =?utf-8?B?VThCbHdGc3NBNnIwbGVOTEQxVFF4REZURVlOUEtLdWF3eSttYmpHeHl1Kyth?=
 =?utf-8?B?TzM3ckVZKyszUFVIRmhUUjNGTWZyS0l6TDY4aTFFN1RNb2dCZ2E1YU9zakZN?=
 =?utf-8?B?alJHMnJsK3ZMbnpOVEEzU04rUEl3dExuK0FNbVZOVWRXOUNEUG96Q2p0SGxS?=
 =?utf-8?B?eUVUMmIrMHlzcmlFczVZNnJtaHo4a2ovSWJrakhXNWUvQ0VnMzR3WmZPajkx?=
 =?utf-8?B?TjNVVlJQcVp2TElxeWRQeDErcjlHeFZNRzl2WUorVVp1SDRYT1F2cmllV1dQ?=
 =?utf-8?B?YmRoTGh5MGNhdzlMY2N2eCs5OW0wcFVhekp6eXdwRW9DL3N0QWdJeGVXNi9X?=
 =?utf-8?B?VVlWU0lyWEVXRUZyWW1VWlFueEw0V1kwVzhxU1dzUFlaK1dGQTdJYUkxby94?=
 =?utf-8?B?MkhIMGk3eEw3RzdSZDRla2FlYW55WVZKVityaDVoQzRvNEcxdm43OWJ5UTIy?=
 =?utf-8?B?SVhxYmxVWnhCN2RiZGh3cGpRczN5bEt6amcvWEI1QTJDU0pQY1JtRkFxRWdy?=
 =?utf-8?B?YzRsTHRNYW9rK2ZGWlVkbG1INndKL3B2c3l2WkYwNDJSZEtwazNpYnpzd2ht?=
 =?utf-8?B?RXJqQ2RoMFd6TElDVFFldkZIWFIxTWtNK2w0VWdQUlN2QldzYUJ3ZGNldlNV?=
 =?utf-8?B?bFBZbnFOaWhNTGlUdXFQbVdJalNpRnY3a0tGLzg0SUFYY0ZORjVsV05aVzh6?=
 =?utf-8?B?aXlkVU1tbExaN3V5eGVJcEp0UGpCOGdWek1sRCtrVXJxU2ZoNGc1ay9JTGdC?=
 =?utf-8?B?eHFsTENtd3ZMMmxJVVh5THdTbUYvYXEySTFQdUNEbjkxeHpCM1JtbUVEdjFC?=
 =?utf-8?B?a1Zja3FwSXZUQ3JBMTYrcHpHR3V0ckF4T2dXQnFaNzJGOFB5Z2t3a1ZKUXNr?=
 =?utf-8?B?QjU4ZkdJOHJmSklkZzhxa29nTHBmYm1QT3ROZTBPc0hBSk9tZkFyZEFKMTJI?=
 =?utf-8?B?aFhoSGpmYlF1bG0xbGFFNGZFSk94VXArbkhCQUhSVjg5S0ovZWtUR3JmWEFM?=
 =?utf-8?B?RmE1ck1aRm9abmVYS0k3cDUvcmI2TVIxTDI3T3o5UnRnd0FDRlZqSEg1QXEy?=
 =?utf-8?B?bDZ2ckNHYWlGZWlJNWI1SFFNNHlUQjE5YVc1ZUtmcWM3am9TcTliL2NoL0JT?=
 =?utf-8?B?b0JRUU8xYkpDRDJNVndZZFhDclZic1RUeE04N0Z1QzRyWGNIaUxnYkg0d0Ex?=
 =?utf-8?B?ODNTaVVPTEtKLzVXUnZRbVVkVGRHQXNicXJRckw2Vi92V0x0OGY2N2FvSHJj?=
 =?utf-8?B?NXRNS21vaUN0SVdrN0VGd0EzVEZGSkRhVGNsdEhacXlNOTV6cTRqRi9vTTJk?=
 =?utf-8?B?WVZGQTIzUlVRemRST1BrQWRoblF3cW94aTlRcEtaNmExRWFmVGc5aTBJNGsy?=
 =?utf-8?B?UjFTL0N6dVk1Tm1XTWZTYS9mdHpiSllwYXZyYVFnQkpxbVNTM002T0t1b3kr?=
 =?utf-8?B?NGdRa1FQUEJDbmxOU0R5U3VucUc4dzhJWERtRENaUkpxdmtCOVJnL3JCUjV2?=
 =?utf-8?B?UVN0TW9ZcWhxUkRybFVEMlRHOGROSFlyY1F1TmFVeldaQzBHdktEZFlTRFJv?=
 =?utf-8?B?S0NxWGRYNXlJSUN6OTRVQ202WE1sMlNyQjh1c0JYT1VraHVxdE84Y1lDdG5i?=
 =?utf-8?B?elFKbUZ3ZVp0Uks0QUJzTnR6MVhIeU0veDdESG5Ob3o3eGFTeDdKb3dicFV0?=
 =?utf-8?B?OFZIcmpnU0R5S2l2M2psSXdYazA3YnFKU3AxMHVxZko4Unc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUthSTN0ZklXbDRuQm1IU0ZaaG1iNkZHM2xZRmZ5aDhrRDFQeEg1Z013dUg4?=
 =?utf-8?B?dWFSczZrcG5rMFJ4N3VORFJmUFd0WHRGK1MzRWRVYlc2c1VoMy9ReFZRZ2x2?=
 =?utf-8?B?U0NsY3V0d0NiNG1UYzlXQlJnRVo0MXR0NEFLczMxcURZSWJNZ0crRnpEWnMr?=
 =?utf-8?B?d2tHYXZWc1NMK1YzL1JLRmljUElxV0FGSjVCNkRlbCtYYTFQVGtvYUtVeG05?=
 =?utf-8?B?OHZ5N1BKOWtIZkhldFhzMHI4UlY5ZmhCVUVSbTJzbko2QndLVHZpUmxoTkw5?=
 =?utf-8?B?L3ZDcFBBQlNxRGNJUk1hK1VDNjRKWDVWaDVZYVJXVm15Y2lvNVJjdG1PcWNq?=
 =?utf-8?B?WWd5RGNGT3J2b0dRKzVEQnI2YnoyVGkwOTVKWU9ML2RZaENkTC9SNnJKRWMr?=
 =?utf-8?B?ZksvY0E5VGs5ZkNYMVRRMmNTbG5OREdjZHByODVWV3cxS0M5RnNKbjY0bmFL?=
 =?utf-8?B?dGxvdE1ET09wdndFN01QRnZGRDhnNWJnNlB4akZGWGRlU0F3ekZpTWs4T0gx?=
 =?utf-8?B?STJnYW5GQ3FBWXgrUk5GNEdPSmdQbHVueVYrNnlnNnUwa3JGYlJ0aVhpTnhY?=
 =?utf-8?B?Z3VDbTYva0sydXJ4bXIzVGpPc2NCRDJjc3A4MitzUXZrQTdGTWlsRDBMbUxh?=
 =?utf-8?B?aGYwRXZ3S3dZcUc3Ukw3VVdyaGhnMlQxSVBiV2RjYURubHlxL2tUaklORks1?=
 =?utf-8?B?ek1KSE4zVlg2T1VNemZwY1M5Y0VZL0N5YSs3akFpK0psaXRnVU1hY2dPUGlH?=
 =?utf-8?B?aTFzeHBaZHBMbTQ4OVZSWkpwOXVBS1YrQlAzV2NlbWc2UHJVbDhWTS9oYVhn?=
 =?utf-8?B?UWUxb3REcXdqek41OVJhSmpGMG4vSlZ4V2RoSjJHMzFRbGJCUFR4dys5Nm4x?=
 =?utf-8?B?WklOZ3hzZUxRbUxhejRpbUtJM1V0dUZZeGZPUGpsSW8wektTL1U0bUozdWZh?=
 =?utf-8?B?dHZVay9rTWsyZWdvclhEZExpS1NRTERuNjlaalFjV2V2UlRPaWt4aVdEMmdI?=
 =?utf-8?B?WGFZTFdXNS92aDhPOXI3UjYwSE91THAweE1NSFYxdmJ0YXlLd21LQzZCLzdT?=
 =?utf-8?B?VGR0SVRiVW1xWGszM2EwajlYMW4vYktROXJadW9ibzNyV29JQ3cwUndBanB1?=
 =?utf-8?B?OTdyeWtuZ2lvZVBrUnpudVVkRkdhbVBRZ2ZGTllWVDJITDZSaStmMGZ3M09K?=
 =?utf-8?B?Mm9FL0pLcE9lU1JlQ1RSUHlUQkJvaTh5WllkaVFVZzkyV1pjSERrak9EOEQ5?=
 =?utf-8?B?QkplLyt1Rmhubnd0S29xVkx0NVUvSVZ5Z1lLNGlYV2NLSk1VTWhIQU5NN1dn?=
 =?utf-8?B?dDdpbURwZUNvMEkxSDAzTlV6KzNTNXk5aE9uM3hjKzMrQTBac09zMFY0VVk2?=
 =?utf-8?B?MjdzOWVKcUFYRUYydTNPTmhwdkJiLzcra3lnd203Qk90dTgvNCt6c1VRSEI3?=
 =?utf-8?B?cjBHRmsvUGNwanpKdVlsQXBsczk3VnNmWCtReEJUQTE2eTRyWjRFaENiV3gz?=
 =?utf-8?B?ejJsKzVaYzdsQk04ZEUyQTQxQ3JOYTA3ZWE0T3pHTTVMR1psK0owZi9CZzNW?=
 =?utf-8?B?djdJUXMvdG01NVBzQnN1aTJuL1hFVVZDZytsS2UzWUlCbnNscGlobUFXV1Rz?=
 =?utf-8?B?WHNqVUU0UzN0SHdHNVMyOUdmUnU1cUFzaStjdU0rZTVseHZCMGtDM3dMZVBL?=
 =?utf-8?B?bVVPZ0F3VUlxa0pxOXBtY3pTRlMyNVlXditzTDd4TmtlY1FuTkpsYXVtRXJZ?=
 =?utf-8?B?WWVSVzBwTW1hSmJrVEM4aWhML2c2ZHA2N01Reit5ZVRkbUpiRzdHYzd4Rkp1?=
 =?utf-8?B?L0YzVVgrc2IvZFFxeXczOXFxT1dEdC93YmJiQkRrbnl4b3c3Y2tsUlVyN0pt?=
 =?utf-8?B?RGxQYWhUc1V4Qm1nSjlyVzQreHpLMGZmMGZwZHFtamZGNjc1L3B5N0JuenI3?=
 =?utf-8?B?bEp6OUVtTk9sRmg0eUh2am1UcHY2RzJEM09heW9VV1lnQ2ltOVpSVlcyNk9I?=
 =?utf-8?B?bnpDUm9SSWJJNkZsWVZFMEtYUXZobmQvdGRZZlBVU3BnQlN6WTNPVFpiWTZX?=
 =?utf-8?B?eURDZWZ6VENuSFNUVTJjYUtGakVwSmJ0WTdUMmhWVFJnL1JadHc2enIycVpR?=
 =?utf-8?Q?e52mR1IgW1hBaeAv3VjTcZYxC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536a8dee-9ae6-402d-83bb-08ddebb5cca2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 13:20:21.4503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlrJ00kFeg2CAv3vouImH9S04m1YYmIe7iqABqqx85/Q4nL1jwQaca8VauHF123gRJQfB1Nl7i14Qqpphm3uAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8192
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

Thanks! Reviewed-by : VitalyProsyak <vitaly.prosyak@amd.com>

On 2025-09-04 03:40, Jesse.Zhang wrote:
> This commit removes the redundant call to amdgpu_cs_ctx_free(context_handle) to
> prevent the double free issue.
>
> Fix: commit e84f7c9e8d5bde (lib/amdgpu: Add user queue support to amdgpu_wait_memory_helper)
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index c7799b00a..83b033c40 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -200,7 +200,6 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
>  
>  	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
>  							 ib_result_mc_address, 4096);
> -	amdgpu_cs_ctx_free(context_handle);
>  	free_cmd_base(base_cmd);
>  }
>  
