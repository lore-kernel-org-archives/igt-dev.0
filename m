Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682DEC02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 21:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E9710E528;
	Wed, 15 Jan 2025 21:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SusD6uJF";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FF810E528
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 21:05:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5ONaUJiHB5bn0gbxE0BvyF4wPTxn6AQenMNxrdGAYXU5iejWSoK68x2fp5nq6EowZK2Oj60eDQZqEfTwRpM7C6iwkkb+W2pu/OigqLdygYG3s7013wBUQS1gSagfdBBlmgZubn2jan/RyX0mZoiTKHnhuLx9x9z0peKfY4mQe5mpEF7m/htn9fKNsHGkaxvoRrBEmWEE+dv4b7i7Ca23HrV+QAjPcCKSAgaqqwxM4XAvaYqLJckGIaxX5nLyIY4/Gvko9Jlm6yGNeTb478cUMpY3TBJYUVDAV17jkIQTP7GFwvzTaW1UK13wHj7KJxBXoa5/1lWJiHUzyp2MN2Kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daJgj3iNUzfnvBEsKo44hoZBJmH/B55stAtPYRHeHdM=;
 b=hkrMVzND1FrArNkhX4vHJg3SKz7fAwV4y7sTFbD9q1PxxlyR7U6NHBSCtUFSo/fm1S4MAOGikbASWqEU6OyP0BvzO5uTql03hegF+yPrSEX5PoekeGNwHKMb5rKRcrO+hFRrSOybDJ8LRUdy0QQdWOZqB+nKxZ8FcdAkpSjbotbztqW2K+4yk8T0mWQ3XK4hPyht5wmffJg0CdcQz8QtF9pI4kgCuruwsx6KghAvB3IaLVdIme8Lib574meg7yQ9vKPznZ5PIBtiOg3E1bqnEvHOHJMwSQw6ezf6Bo8kk0Odlvz+NDzoyVh522t7A8uqHsYw4gC+xvPmy/CHjwNmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daJgj3iNUzfnvBEsKo44hoZBJmH/B55stAtPYRHeHdM=;
 b=SusD6uJFNQG3BavAQAJ/jm2vMGrj7nFPGZIpVgScnafbTJ1zaYI+o37GynayJt8UK8Bs0w8YvSEzyAeqP138zvvbK+vbTtaljr95Imcl9fh7EWZ1BNZkUPzs02Wcvw+ZQOh6tYIRg1FZVcJUWcyWpBpEO6gRJhB0B8fgKZHAepM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 21:05:49 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 21:05:48 +0000
Message-ID: <6fc65270-87a9-4b5c-9d60-a80cf61a663c@amd.com>
Date: Wed, 15 Jan 2025 16:05:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/amdgpu: Handle -ENODATA in amdgpu_wait_memory
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250115070359.3698486-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250115070359.3698486-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::31) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 24da5e93-49b8-4dc6-89d9-08dd35a862e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXZXSmRwd0Z3TjdqanFOUXlkQjFza25laXJ1TUtCeDhwWkFZNCtjbHhIR1I1?=
 =?utf-8?B?Q3JObFZ6YXYzeDdXWjBWNkZRZXROL1hFcEROVjlWYnNJbmJyY1V3MU1YZ3Az?=
 =?utf-8?B?ZDgxRkVPMXpWVUE2MkswRHBhVkxqMjl4enNHQUVjYmdaZFJoVGMyOGJIdjZT?=
 =?utf-8?B?Y3NiTU9Rajg0ZUlIVUdvSFZxWU5YMUt5aGRkWW9UQzB4MDh5OG1KMEJBbnd2?=
 =?utf-8?B?SEY4MlFLNEhRc1ZvTjJHS1JuMTRpK2I0cXdvWTVDazlhMXo2K2FrZVcwcSt1?=
 =?utf-8?B?c0hNanFVS3VlcFQ5b2lSaXZIUENzcnplVlMvT3UwbDFNYXpzb2FWZWlLakI5?=
 =?utf-8?B?V3lOaktadDEwQm81SHIrM2RPOCsrZStNQUx2TmN2a3BJakJyN2N2OEQzS3F5?=
 =?utf-8?B?K2cxeUNTRm5VNlU3bUR1dVZNZ1pEN1hIckZRZ3pwVWF5NzViQXozdFpIUzA4?=
 =?utf-8?B?VTlGWThSYmZwYWZzT05hUzVxWHgvRW5yckZQeVlwNW1pNmZUcTA2cWd3NmhZ?=
 =?utf-8?B?UW1DcWZVVXR2V082QWM5UXgwbWZyTmUrRGQ3blJ2bWdvRGo5WlB5ejBITzFT?=
 =?utf-8?B?TWR3OHREN09SSWRUakdSTGprWGw1SkpqU2VudnRqSThIMzFGL2RGR1R3MlVV?=
 =?utf-8?B?MzhSOVdtdW5qcEtnbXkrYUNmbXl4blptNnMxcXBicDZ5bXJFVnNWWml2eWFE?=
 =?utf-8?B?Q09GK04xVEVna0pScGtGdEVlbG14SFJnZE1qZzVkR1IySjhkZTZRbklQa2ZD?=
 =?utf-8?B?d2ZCalhMb2hZbzVzNEFINkpuaGZoVSsxaWpkYWRDMmRsRFdwRGdndklqSHpy?=
 =?utf-8?B?U3J0QnN3WDRubTAyK1NLVkwxdnRYandmZHNLTSt1TGdqenByN3N1NVNIdjNj?=
 =?utf-8?B?aFpXeTNrelpyTk9pbmpSWTRqM3NoS0NCREJqcHRpK3lQQ2RxbEdRZ041eVha?=
 =?utf-8?B?aHZJaFZ1bzNSdUw0dmxMWGlISTkxN0FnWll0T3BsKy96N0tCLzlrWFpKZ1N4?=
 =?utf-8?B?eVFaWEJlVWJKYXRYUVdpWU9STjV5OTY1ZEhzTWxjWkdXQklaYWkrejBlMDRn?=
 =?utf-8?B?Rzkyc0wvVWRiZ2VlRWxvaVFMRlNkU0VQeFBYQ0xNbzFJMEt1NjRyK2h1b21H?=
 =?utf-8?B?R1lvY2xYd0Rucm5qQit3U1RiTThIanZPN2Rlc0EyNnFKZEtDcHBCM1AyNC9W?=
 =?utf-8?B?T1ZRNFZSL3BvMXNwRmNRNmswYzJ3NmZmNVpsR2d1L216bkg0c0QrZFA1QWty?=
 =?utf-8?B?R0U4MUU5QjhRUXM2WlMxeU1uT05BZUYrbmZXYWRHckdjNDdoMkZYS0JDb1l3?=
 =?utf-8?B?enJUc2VnclRkWVpmNzhWY25iMno4WVFnaUFqaVdmbW9EbXZnbDZZZGk2ekNI?=
 =?utf-8?B?azBEbW9KYy9RQ0xaM00vWnRIOW56bmRQODhhTThEdnYrbmJ4c0NUdHBuV0oy?=
 =?utf-8?B?cUN1R0EvMzlkZHJMa25tSFRDRkFLM2FZWitOdC93L3llc21LdFIrWWlub2RV?=
 =?utf-8?B?Nzh1eUU1SldKcW9ZZnk4NytEWXZyejgwVG03amlwRHdYUzhKeXcrSjh2RE00?=
 =?utf-8?B?Ykd3Zk1kbDM1WkorZ2pmR2NHM1RSTXBiR3RENVVUaFFCZERrRFlGdlFGYllY?=
 =?utf-8?B?bVBlMzV4U005S0diOUVSb0JmWkdySkoyQTVIaWZ3VS9mWm5zdUc1ZFl5UTVq?=
 =?utf-8?B?cUUwdmY3MWpSQm9lbWZUNC9VSVZON1FoSGVIbGppdDMxcko4ZDBjdW1yeDh3?=
 =?utf-8?B?bXgxY1JnL0todUdtbGNFTExzQnRtRVpCWEEwMkUrZDdUSFgwVUgyV3RXcUdR?=
 =?utf-8?B?L3Z4TWtwVEVxd3hGZTVhdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHlSY05vZEdrRWE4cENSVS8zM2MyWVlWQzhzZUdTWnJBL2REMG15bVo0N2gy?=
 =?utf-8?B?OHR6QWEwZzcwVk1wUlREcVJnYnJRajJKRVVxLzBCSjhZWEVvOE8zeVFQeXJY?=
 =?utf-8?B?VzREZXg1cmRBZXRmZ25OR3BOMGU4aTZPZXRRVE1PRzEwcVQ4RCtKNHZ6Nzlu?=
 =?utf-8?B?K3NCejYzZGtTcEZiRmhoUHVYZU5uSXFvRDQyM2JXeXdic1p3elAwSEFZOHUw?=
 =?utf-8?B?ZkV2Rld0L2FuT2hkOS92bjM4ZXd0OWRXblJVOEhpbXNialJ6ekVibENtUGx2?=
 =?utf-8?B?S003cXBzMXZaNmc5OHRiaEg1ckFFY0w5cGhJSTNWSk5sUGhhUFRUcDFXdjFV?=
 =?utf-8?B?c3BwYUVYYkU3c0l4ckhJQlJ5UUVtL0ZYb1ZZUVNOaDVMbDZnMnkvMFlJUGxh?=
 =?utf-8?B?aCtheEVGNFB5ZkJ6S1BuUUpHK05sL1JYSWVDUUNSMENiaVYyMURrc1F6OGQ5?=
 =?utf-8?B?cG1jeFhaUmVycjlFNmh3ekZxZjdBOXlxZ3lVbEx2cUVISnE3L3VhWU5Eam1T?=
 =?utf-8?B?THFLdFVSb1MyakJHc0NZTE0zYktlcXhZY0djeldudGhtWlpDbExtemM3V1p6?=
 =?utf-8?B?cXA3bVlLTW9INGwzdlBheWoxYW9qQ1NYNmVyV2pwRW1qUkhSSG8ySnhJZkln?=
 =?utf-8?B?M0lKS2RsdU1McURoWDZPMzd5S2g0MGZKNmpvRElOOHF4QUlFWEJTNEFiWkRk?=
 =?utf-8?B?YTRXUGYvTHgybXBuWXlEbENzWkJpTVpSQ1RVbW1ETEl6UFN5UUN4dmRBdGlS?=
 =?utf-8?B?S1NsaTk2aFYvcGdGVHhNZkNEaFJZZ1VYR0c0amp6VjdOVmxmRllRN0tHeThG?=
 =?utf-8?B?Y2MyWkwzZGc4alRTQUpxQ2dNUzk1dHB2R3hvNHVLM2dTamlpMUhPRlFrYWFq?=
 =?utf-8?B?UVJXY05tUWN0OEVWZk9FRG9qOU9yZWM3RFhCSEJoaGxjY2dvMlllLzZzWE1s?=
 =?utf-8?B?QmprVUJzYlczZXhzaWRyNmpCQUk2UWVlbkxPVHRjbDJEUXJrVHpqM0t5akdl?=
 =?utf-8?B?UVpIV25Gc2RGRDIvVGpacjBOcm1ST1IwalFTNDVOUkVBZ3pIcEJwR2FvQWcw?=
 =?utf-8?B?R2VkdHArR204OEg5QTZhMTQ0TmVyWkVkQVYyQzhpK2NJaUlZMXFZOHVXOFp3?=
 =?utf-8?B?ZGdNZUc1YlY2ZVhqRml2LzZKOThlZUw4OWViOHdJekNuTHVrbVJZWlY4b0lX?=
 =?utf-8?B?bitWZEVYaWlhcXNMTk93ejV2ZkxCT1Z2N3c4Z3o4UnB1MVQxb3NmYTNGcmZV?=
 =?utf-8?B?OWpEMGF6dEJEQnEyQ0FQVlBiMWxQY3UraEVHdUpxVXVCRDlQbHdZeXlTOU4z?=
 =?utf-8?B?Z2VFaGlPZUVHeVE0RForR0psYkZEVW9vUzlIMGV0UHk4K1gvSEI3QitDMXJO?=
 =?utf-8?B?L1FLMU9CaFd4anVNS253YVplMGczYWhtUVAxeDRpcDh5c0tiN0FWV29GcFNq?=
 =?utf-8?B?dzVWSEVyOHZmbHJVU0xZUFFLNGxhU1ZhcWFna2hINFBwOFRYVy82dUlRbzgr?=
 =?utf-8?B?dGN6STN3cld4VzUyNmhKS0dSbFMzL2lmUjg1VHFNK0xoSnQ2LzR3cXJwU2NT?=
 =?utf-8?B?cmhMODJoWkt3RlJnM3l5UVloOWxMQWN5cU5YdXR5YmhSYW5BUVI5bjBkWW8r?=
 =?utf-8?B?eFdTTkNsRE1EM3Y3czc1SUZqWVFLaVBoSGhpZ21RZEZIdDNmcUFzKzhSTndR?=
 =?utf-8?B?Vk9NNjRxM08vSlg3OHE5OHRxbDQ5c1RHamQ1ZlNGNS9uSE94bkpKZXNobHhz?=
 =?utf-8?B?M1JIdHJjcXhaVFRiL2h6N2tSenhDazBUL2dlUC95WEwyblcxM1NNZEd0N3N3?=
 =?utf-8?B?bzJ3Rk5mYXpJdGF1ZDY0b3kzZUVmWk5zYkIwOWFudWJyVlE4M0c1SThyY1lI?=
 =?utf-8?B?d3RmM1EzVThBMkdUT1JTM3VvMUIyWGlFc0pnRDJ6YmNLbU1mOVhieDVPcUtF?=
 =?utf-8?B?UjVRaGlqYUhXdXdoQ2tzaVFoOGFOYklWejg2djdGV2tJQmlCckliVE1jSm9H?=
 =?utf-8?B?clg1c2hDb3pIZWJ3L0RjL2l2bHJUUUpvc2JkUTJUbWFudXpJNmlVQVdqTDFu?=
 =?utf-8?B?S1pnY25UTTlLaG1FUm10UWdpTU5TS2FMb0dVQ0lCWXVyU0E2dmpLZk9IRGFM?=
 =?utf-8?Q?8tx+0YKA4k4ogTYUqU3BajRIq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24da5e93-49b8-4dc6-89d9-08dd35a862e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 21:05:48.8922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlRD5GAjPg52OMd4z3/LzW3pVjSGvJYnXYDZGXvEkURFqSwzSOfq79/ERT40sId2NAkMzCCIT3AOq+SivgN6NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849
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

The change looks good to me 

Reviewed-by: Vitaly.Prosyak ,<vitaly.prosyak@amd.com>

On 2025-01-15 02:03, Jesse.zhang@amd.com wrote:
> The amdgpu_wait_memory function currently asserts if the return value
> is non-zero and not -ECANCELED. However, -ENODATA is also a valid
> error code that can be returned during GPU job timeout recovery,
> particularly for queue resets. This patch updates the function to
> also accept -ENODATA as a non-fatal error condition.
>
> This change aligns with recent updates in the AMDGPU kernel driver
> where -ENODATA is used to indicate queue-specific resets during
> timeout recovery, while -ECANCELED or -ETIME is used for full GPU
> resets. For more details, see the kernel discussion:
> https://lists.freedesktop.org/archives/amd-gfx/2025-January/118795.html
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alexander Deucher <alexander.deucher@amd.com>
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index 8ac6abf8f..f274a6365 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -142,7 +142,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
>  		job_count++;
>  	} while (r == 0 && job_count < MAX_JOB_COUNT);
>  
> -	if (r != 0 && r != -ECANCELED)
> +	if (r != 0 && r != -ECANCELED && r != -ENODATA)
>  		igt_assert(0);
>  
>  
> @@ -156,7 +156,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
>  
>  	r = amdgpu_cs_query_fence_status(&fence_status, AMDGPU_TIMEOUT_INFINITE, 0,
>  			&expired);
> -	if (r != 0 && r != -ECANCELED)
> +	if (r != 0 && r != -ECANCELED && r != -ENODATA)
>  		igt_assert(0);
>  
>  	/* send signal to modify the memory we wait for */
