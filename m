Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C9FD29FB2
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 19:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C99410E9C1;
	Thu,  4 Dec 2025 19:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QZgnDRXa";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013058.outbound.protection.outlook.com
 [40.93.201.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB5610E9C2
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 19:30:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7f0YpmG6cpWnprJYzBkSYLl978p/a92LxUebBorrTBDvZtE+KihUk7yXWmosYmj453KatKQJ6AtKZOnfU6Qewa5tKjsIHCvKtlqdTMgD+46ZLaUrTzLzQf5k8JWBrhtWdCRnopyY0RoB7vT2+EzGiUfjMEG8mxhWUhuh88l9Q6uoCmvICvWTF6tLkhUazyTe+bhmSEB4zUoTw5bkoAqTJY0aYZZNfajbVXu6/3DpJFLI4Hma2eHwQ4L36gBVMCz8mMZmCM2tXi2wyf9Y7+2XOaD+MWVyGnizSSTj28sCElaFjqTtWp1N6iZSlvuYypL0Q7aptzWFfunoLZM9Lnefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJP5wIX8ZaCUCAbxQyD/MM32Xj9xfAlbsu56lxVLhrs=;
 b=JtkeisH6Q2aTheK8mmgX0dsMWjmrw3TPVW+BOhpwu3DGL69Ym/7NhEqzOaplbAQTtLj3C0Jw4VpSzM6ACMOKw6ExfeUc+xw0VXpmLPkmBXZR7lkk7/jS53vDatKcK1nR7nsBE9fO6JzPgw5n7HGLG2RAF5pFUe38mRenA/66nD3XBrltr9gkMb1luKYZCcLedXWmUu7hWuroVHLhC9RDmLBODl0B+BmuTXOhWY/2UjQapuCfG/j0OfTMFzU+oBfgNKJwMQ+oDqWiR9aqvi9VwX6uwAMg3MnAhR9GjJFAm/t6KvL7ZemW/gNWzaS9zYdZOnCQY7/3tQD222dBOCUtTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJP5wIX8ZaCUCAbxQyD/MM32Xj9xfAlbsu56lxVLhrs=;
 b=QZgnDRXaO1VKe+nzzQeiYnbZoA/MrzQ3RHOvwr3VovSXyVmh3yqD+6RRiUlE0sGYDlKMPOb7g2UzXxKu4rYx5pCTVR76dHFyrq3N3B350atsvrzBhnjGr5JZfTvDpPb/vehR3Qyf4y7jsGuteeLe1hhHDCzhnSmy3SgSkWSsVcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SJ2PR12MB8649.namprd12.prod.outlook.com (2603:10b6:a03:53c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 19:30:31 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 19:30:31 +0000
Message-ID: <db784603-9f0a-4395-bf77-a2b6e4a3e984@amd.com>
Date: Thu, 4 Dec 2025 14:30:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amdgpu: fix build without amdgpu_device_get_fd
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
References: <20251204181442.45975-1-vitaly.prosyak@amd.com>
 <20251204192316.kmd4yp3sh2qwitlq@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20251204192316.kmd4yp3sh2qwitlq@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0157.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::30) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SJ2PR12MB8649:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ed3566-c1bf-4fb4-8d6a-08de336b966b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU9BdXA1MnR2K2NQOTduREVBNjR5OTZWRHFDSmpKbHg3cjFBTG1aWU5pMnYw?=
 =?utf-8?B?Ui85L2E5MUtNMWRjNGdDNlJVbVhacllRRUpKM2NiVGxVRlNycVNQNVJZVnhP?=
 =?utf-8?B?akNXNWtBMWdvdDFlU2QvbFNMZW1rVGgybzRTcFRDQ0R5cUZmb2JKNmpoeGMr?=
 =?utf-8?B?TUFWWlBLZXZyN0pvekpUMkZiQUxUUUloeC9vb1lYRDVSZjluM3JET0dmbHNL?=
 =?utf-8?B?ejRITUtia2NqWHZicGRicjRwb0JoMHVYSkV3bnJNdEgyS2daNDg3TlpNNU1F?=
 =?utf-8?B?dDh0eUVQRW44Qk1WSmtrNWtRNVQ5VzdpTDhqd2ZiT1hPd0lxS2lKR01aSW1m?=
 =?utf-8?B?dllnQ3Rib0FaY3dkNkNGR3FXMEt0OFVBYklyQ251RkxsQnhCVldOVDAxYjM2?=
 =?utf-8?B?YzlwUkp5ZG00WFhjOWQ3L2hOMjZQOGtRT1NGK1lybmQ3UGY1NW9SKzJBUVo4?=
 =?utf-8?B?ckpMNmV0T00yTm1wOFRYcUJMY1RkS0tIdGp3eHJlNjhHNmJyNFRmOGhiUHhv?=
 =?utf-8?B?d3h6dkhNN1Rac1FibnRxaVBQSDhUTVhOSVVRbEkwNTdaR0dMYUUwOW5meUh1?=
 =?utf-8?B?WUYzcEVQTEJkRlFFZ2t3SUFXc0VOaUVYaEF4c0tUSEpqWkx2Q3VLNmFtTExJ?=
 =?utf-8?B?NTdpSHpERmh5U0JUd1ZyeHIwaXJSa3E1Qk02QnZjV1UwU0psSzFhd21KaXFY?=
 =?utf-8?B?RjhXU3Q2aFpQUHlyelEyZ1ZtMWxHK1JRK0xVZmRjcHk1QUFZRmc1Zmkxdk9B?=
 =?utf-8?B?WncxSWh6RnFFR0lUZjJlN3RYQlFOUmpyVzFxN3Y5OEZoR3NIc0ZHdXdIWjRt?=
 =?utf-8?B?aFNjWUpYV28xTkRyOUtmWkRhYjFESTdyWGFBa3pMa1ZsaHFrL2tpUXJERXZy?=
 =?utf-8?B?US9oNjJaMUlKR0thU0NhUWR5cFJXb2dGRnFpK0dzdUVCRzI2N1hxV2NoWE5v?=
 =?utf-8?B?WkRZRitxZmc3dzExVzUxVzJJbTZ0NUN6QzByMXczbENHSnRHRnFnZDBIWDVE?=
 =?utf-8?B?ZmVjQnJrUHBuajExbnRLbytNWUZPQ0FuejVqUk1QSzcxVjRzUng2UU82eHcw?=
 =?utf-8?B?RVZGRllHWDRIQkZHMlk4blpURGFRa1B1TzNxSGVzSUhUNmpjUGdORmFHZDhW?=
 =?utf-8?B?cHU4T1NINjZpb0J0cmp0NUc0L09jMm9HaGRkOXJ3ZGdCWnVhWk5PQWhNSm50?=
 =?utf-8?B?blZHd3huSGREVGhJeG5oeXp6Mmg0SEFTbXlJa2FMcE8rQkhqU2lhdVlMTk5W?=
 =?utf-8?B?ekZFa3VUSEZxZGZOMitRNDJ4bjA3c3ZWRCtoNDZoMEZLNGNwU0IwaVhHalBK?=
 =?utf-8?B?WWxjZk8vdFFSL2tWRUpReStlTk1DNHQwSW40VG94cEVaYWszclpRdEEzdzVh?=
 =?utf-8?B?dFp1U3NtU3gzcVI4OWVnTVVUd09XU29jYXpJSlNLOFhSb2o3Q0JpSGJxWFpv?=
 =?utf-8?B?V2pHdHN2OUo2WmVhTGZGSWlPcTVVWTlDSE15NUFEWkZNWFJyT2dDdzFLZ01y?=
 =?utf-8?B?aWxtT0RhMlMwTnRyUnYyUEZnL09uTDZmbnV6OUhGRm1jY2RRTWNTNGJodXZj?=
 =?utf-8?B?RE1qb1htQkJIRS9zU3o3Y3kxR3BkSXVtQlpqMTErM2JqeWFJeTB2NjNUVXc2?=
 =?utf-8?B?QVRPVzU3bzZXS0FXV2lReWF4d1FCUWllUXlwaUQ2YUlUdUdpRW54WnRpVHpT?=
 =?utf-8?B?czM4QlRTNi9ZM3QvUzdTUWp2a0lQbEg4ald3dUpuaXg4bWhmUnF1ZXJDcUVB?=
 =?utf-8?B?dlgzdWVTMThUTHVnbEZCN2xWTTVwOCszdGx6dzR4enFiR0o5TkkxVlZzeXg5?=
 =?utf-8?B?cjdQcWsyQzdrWG9zbnp3N3lyWDErNU9kU3plVk44UnRJNGhQRjF0MllWbXFT?=
 =?utf-8?B?NWkrUnBCdk5UbzNHMTlUTlV1eWNTbStDenpMcW5WM1FyZ1lFTzFKSy8zM0dJ?=
 =?utf-8?Q?Q1GcAZKcZRs8XVFjtU39Nm5JhPPZPuwq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE5pQXYxVzliS2JCdy80Y0dwbmROUjRDalhabzU1YnBYOFk2YWZrK1JmZS9k?=
 =?utf-8?B?VE1TNGxpaDdPYkcxU29BbFo3VTRFQXRCdHFmTlZzUmtWdzM0VVAybjd6N3FD?=
 =?utf-8?B?cS96ai9JYURXZkRKZmNmaVY0cmc4NEladys1c05KRW1qeDNEb0tvTlBpTFZj?=
 =?utf-8?B?NFhRUkNlRlRCRS9hZWVOakxkc3dXRG9Dek12S2VxNml3UFN1MURCY0RlQjYv?=
 =?utf-8?B?aUlNNHhjQWFQNkRaT2FDayt2YkliSFIvd2Y0eXlOV3JFcTQ2dTZ0WTNHV2g2?=
 =?utf-8?B?SEpEbHZGdU56SDRqNmNDdk5aZ0RLNWhaNTA2bE5IMkpJV1o2cWNNODFOWWFU?=
 =?utf-8?B?YTdHVS80YkRva1g3U3RibFJCSk0yYzUzUEhydnpOYms1Y0ZrZCs1eDVQWWd0?=
 =?utf-8?B?UjJKUGpCWG9pWXBrM1FiVWEvMHlweUZJSWsyTlpSOFZsMTNWWVpXUDZDa2lh?=
 =?utf-8?B?a1ljZXRHY3Z5T2krb0VjZ1NLalpWWStHYmhaVWZoeTZRUHpsdllTdHRPWGdF?=
 =?utf-8?B?amhGdU1Sc2E2K2hNMlBaTERSNzJyMnFoZHVreXR1c0w2TGlSbExqd1Vvc2Rs?=
 =?utf-8?B?YnQ2Tm9XT3JjL2greWJVa3dyS3VCRmR0SWxVdWZpZkVnQlJjM2NyWW9aekhB?=
 =?utf-8?B?ZUJTTW9SSkdXUmpoOEY0eFRrUVYxSkNRbDJrd1pVN3JkV1pGTHJrSXlWWnFV?=
 =?utf-8?B?N2JoZDhUdVlEZ3JZenVTZ0YxNEtFMHdyODlDODdrUzZydm5CRkU4Mks0bXdw?=
 =?utf-8?B?UWZZZmhMQnNOZmhrNi8vT2RsZldhUnRUODZYakxnMDY5ZWVzY3h6VlNRc0xS?=
 =?utf-8?B?ZTM0d3VNV21DYmh0blFOZndHcDFDYTR0alhtcy9xbzFUYkc5OEttY0FsTFBP?=
 =?utf-8?B?a3lTOVBQNE9GYW1yYTJxanZ2WnN2TTFtSGdhLzBZVytaTjNJZmpXcU1IeU1k?=
 =?utf-8?B?N0cway9RUmpDZlZDczlPblEwMWF0Q1lYY2FhU3l4N3V2ZWRlNjFXdFZhQmxv?=
 =?utf-8?B?SWRDMG5LakhXRFpDajlRVEVhYjJjK1VsMUZMakZuQ00yOEpZeHl1cC9IUVcv?=
 =?utf-8?B?T2lUOXlSMC8wWTNzTFVEZXZSc3o2S1VRdnZaV21WZWt4UFFnTVlUQUp4Uzlh?=
 =?utf-8?B?N0xGYnpvT0pJTDlJcm83b0lWdVRDZysvdmp3RTFSOEJmc1daczdZWC9XNU0w?=
 =?utf-8?B?QTg4NSszcTdIM2ZXdFJDQ0hQelBDcHRVMjM2d0REL05la1k0SURaa3dwaFJy?=
 =?utf-8?B?aGxVUFk0cjJGbWRUQzR6M2oyOTZqb0RIY050TkdEUDJ5eklsd1UvMXF0b0tY?=
 =?utf-8?B?RnRrczUvOWcyZzZmbXNFVGxpMWVsbEcrQ3JVTHI2S1NPTE96RGRCVU1oRjBl?=
 =?utf-8?B?d0tuZ2ZlcmxwZHZXTExSVVc4UEtkRUZpeUg5TGdnYjFibDdwdjRleC9CMWV2?=
 =?utf-8?B?dTBudStzbVdDUFc4dEo2YlNFbFdKTmVhTCtQV1JwSHpsQVNBVkovRGdRN1Z5?=
 =?utf-8?B?UHdKK2ZFU05zTVlQS1FQYWdGbVgyeWtPdDllVFhrSEpxbXhEWXg3SGxKdzhM?=
 =?utf-8?B?Ujl2bGZlUG1lQXRCdmFia21ROFEwOThoVGd0elh5Z3A0WjdMWXdBYUxtNWtV?=
 =?utf-8?B?OWhwWlBtWnI1M21XN3NXcGFZQ2JXaGlkQ2JkYlpETDZhamVITjdWZ1FKWnk0?=
 =?utf-8?B?dWpNYUVlRVJvNjRuSml3WC9lMTN2ZE5GRVU5V1lOSXQ1bkpGSDJJOWRweExk?=
 =?utf-8?B?MnVDMFh1ek1MQzR2M3lQSFFlbVVsRlQ5NjlDUTcyVlBWNzU5TFhRUHNWSXFS?=
 =?utf-8?B?T3Q2UHNkejBBZ1JneDNMR3FTNXVKUlVlZFlVaEZXakRERmlROE1Rc0lNMTZm?=
 =?utf-8?B?YUgzblUrcDQwOGQvYWF0dEwraHVWTU0zLythOHFXdDY3cktCTTI5OXNDNHN2?=
 =?utf-8?B?WEt4MU5ETExiVWVvU0lQeUt2eHV1QmhiVmdZNDRVcGlVRWVqRnVKTFlDdGFC?=
 =?utf-8?B?UHVOTEMxY08rQUhUL21rK1RPbHZYYkljekh6dzNKZE94YjBMKzdtdmFsSlRG?=
 =?utf-8?B?VlhUNEVQVDVrUUhod3BuaTVrdG0vL280Yi96NzhSMHR6VndFaCtNRG15Z056?=
 =?utf-8?Q?F7IcYTFY2dK85Tmb6PmsQANaO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ed3566-c1bf-4fb4-8d6a-08de336b966b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 19:30:31.3225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/Q6AbZ49NxTAr+h05xpK2CAk+K9Airdw0+6jQ7x586ZTETOPA2ObDWzIErtgrJjIxJeOS9nSrYfT5ntH0Zu9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8649
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

Thanks Kamil for fast response! I am going to merge now.

On 2025-12-04 14:23, Kamil Konieczny wrote:
> Hi vitaly.prosyak,
> On 2025-12-04 at 13:14:16 -0500, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> Building IGT against older libdrm_amdgpu versions fails with:
>>
>>   amd_ip_blocks.c: error: implicit declaration of function
>>   ‘amdgpu_device_get_fd’ [-Werror=implicit-function-declaration]
>>
>> because amdgpu_device_get_fd() is not declared in <amdgpu.h> on those
>> stacks, and we compile with -Werror=implicit-function-declaration.
>>
>> The tests already have access to the DRM file descriptor when opening
>> the device, so instead of calling amdgpu_device_get_fd() from
>> get_dri_index_from_device(), pass the fd down from the caller.
>>
>> This avoids the dependency on newer libdrm_amdgpu while preserving the
>> existing behaviour for resolving the DRI index.
>>
>> Changes:
>>  - change get_dri_index_from_device() to take (amdgpu_device_handle, int fd)
>>  - update the declaration in amd_ip_blocks.h
>>  - plumb the fd through tests/amdgpu/amd_mem.c and call
>>    get_dri_index_from_device(device, fd)
>>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Thank you for quick fix, this LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
>
>> ---
>>  lib/amdgpu/amd_ip_blocks.c | 4 ++--
>>  lib/amdgpu/amd_ip_blocks.h | 2 +-
>>  tests/amdgpu/amd_mem.c     | 6 +++---
>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
>> index 6ce207fb2..73bdace5a 100644
>> --- a/lib/amdgpu/amd_ip_blocks.c
>> +++ b/lib/amdgpu/amd_ip_blocks.c
>> @@ -1768,7 +1768,7 @@ bool is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr
>>  	return (ret == 0 && glob_result.gl_pathc > 0);
>>  }
>>  
>> -int get_dri_index_from_device(amdgpu_device_handle device)
>> +int get_dri_index_from_device(amdgpu_device_handle device, int fd)
>>  {
>>  	/* For AMDGPU, the DRI index is typically available through the render node */
>>  	/* We can use the device fd to determine the appropriate debugfs path */
>> @@ -1778,7 +1778,7 @@ int get_dri_index_from_device(amdgpu_device_handle device)
>>  	int dri_index = 0;
>>  
>>  	/* Try to read the symlink from /proc/self/fd */
>> -	snprintf(path, sizeof(path), "/proc/self/fd/%d", amdgpu_device_get_fd(device));
>> +	snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
>>  
>>  	len = readlink(path, target, sizeof(target) - 1);
>>  	if (len != -1) {
>> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
>> index c591d21c1..51f492da2 100644
>> --- a/lib/amdgpu/amd_ip_blocks.h
>> +++ b/lib/amdgpu/amd_ip_blocks.h
>> @@ -436,7 +436,7 @@ int
>>  find_dri_id_by_pci(const struct pci_addr *pci);
>>  
>>  int
>> -get_dri_index_from_device(amdgpu_device_handle device);
>> +get_dri_index_from_device(amdgpu_device_handle device, int fd);
>>  /**
>>   * is_apu - Check if the GPU is an APU (accelerated processing unit)
>>   * @info: Pointer to amdgpu_gpu_info structure containing device info
>> diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c
>> index aebe22e66..39abd4f66 100644
>> --- a/tests/amdgpu/amd_mem.c
>> +++ b/tests/amdgpu/amd_mem.c
>> @@ -1401,13 +1401,13 @@ cleanup:
>>  	}
>>  }
>>  
>> -static void test_gca_config_basic(amdgpu_device_handle device)
>> +static void test_gca_config_basic(amdgpu_device_handle device, int fd)
>>  {
>>  	uint32_t config[MAX_CONFIG_SIZE];
>>  	int dri_index = 0; /* Typically 0 for primary GPU */
>>  	int bytes_read;
>>  
>> -	dri_index = get_dri_index_from_device(device);
>> +	dri_index = get_dri_index_from_device(device, fd);
>>  	/* Try to read from debugfs */
>>  	bytes_read = read_gca_config_debugfs(dri_index, config, sizeof(config));
>>  
>> @@ -4223,7 +4223,7 @@ igt_main
>>  
>>  	igt_describe("Test basic GCA configuration reading from debugfs");
>>  	igt_subtest("gca-config-basic")
>> -		test_gca_config_basic(device);
>> +		test_gca_config_basic(device, fd);
>>  
>>  	igt_describe("Test allocation of large GTT memory buffers");
>>  	igt_subtest("largest-gtt-buffer") {
>> -- 
>> 2.51.2
>>
