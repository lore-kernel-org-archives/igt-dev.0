Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCDCE77197
	for <igt-dev@archiver.kernel.org>; Sun,  5 Jan 2025 07:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DEE10E050;
	Sun,  5 Jan 2025 07:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YS1QhWZv";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FBA10E050
 for <igt-dev@lists.freedesktop.org>; Sun,  5 Jan 2025 07:20:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gy9vjyYwXJvhugFSMXXyA3GcfCA7v5bYMdlUi0xNXshqV8us+J9Qy+xIfCEwKYdXxYpld2rOo/VBqd5ImCbTP10QjVfrUbRXLursUix4YQHvYQK6e9IGKC2T2xgjPxNOrLGUgmtw+dNq39IkqkiAbS9e/mx9f+sr+3pVSGExwR0QMz35V69cUKoivQAr69J63oGG+u7JY64fhccRj4XBLZ2OivEqbvM/mgJ8v5V7tJeT/xCsP0ODtPB82CJ60nQRTbv4YFBwQxrhINAUypNTvoiLnXZMyxkJnk5ZGR78SKOOFFI0RaER2T3sFNOLlWZViqcan1fBNp1SicrwRos9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2se/CMYq4GCpWbNxunawqQIMIll7FRSi6JAB3NFA3TI=;
 b=gpCjjIPsa/P2gahqG3T7xbRgWaXGEFYWYATZxlf2nsmicCBeyNudPISfAYsmOBmDufUKCJ+vVOE9YQ8HTxxe719WQehpFR2ob+b2PdI9tTuJYHOGSMh0tEhsZbNm1i+GwZ5V9+vg/svsmhuwFdX43JkmcqRDSX5F7UmjBn7CmkAb5LP6w8KW/fblcBp7zwq8DUGZgzmrsiHtFln755gLsstzVW9KOYWCJSN42ec103gXFjQ7JCj7mcPzhk+6a695TyRBUewovok8j/8gH7LV8cIuiW0gOlIrXvzQDOzvLLg4lMHP6azIxcMicUoB+lz99gdWmh6HHbfIC8gGJaNtWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2se/CMYq4GCpWbNxunawqQIMIll7FRSi6JAB3NFA3TI=;
 b=YS1QhWZvHQbgV3Q9+Vg8R+xDg1Ic4s+MD+cVs3FACLJlKUIv261d4/UPWnXk1kVfzoBHolJgZu5eiQfAzm0bZ99hqnhv7Y3opn+igu/DeHZz70OeTPBfCS4nNEgGWNVnM0Hi8Ji4Ms6uqsrq2bObHevOhqe+XX8W7VNuSYvP6Oc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH8PR12MB6985.namprd12.prod.outlook.com (2603:10b6:510:1bc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Sun, 5 Jan
 2025 07:20:21 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.8314.013; Sun, 5 Jan 2025
 07:20:21 +0000
Message-ID: <056e6ee5-3d1b-4097-b4e1-b2f7d815a712@amd.com>
Date: Sun, 5 Jan 2025 02:20:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] lib/amdpgu: fix the hard code when shedule ring.
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>
References: <20250105071551.113830-1-vitaly.prosyak@amd.com>
 <20250105071551.113830-3-vitaly.prosyak@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250105071551.113830-3-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0191.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::34) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH8PR12MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 207fcdd1-fc35-426c-a68c-08dd2d5969d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTFQRTBYRzBJWTFYV1kyNmxiYko4RkUvL2JCemF1THBvUVpIbHNtRTZVcUs0?=
 =?utf-8?B?ZlVnc1ZIYjM1Wm9PYWlETTFQTVRKU3laN0FCamg5NjFWRXZBK3p0UHAzVHFh?=
 =?utf-8?B?bHdQcS8xTXFaVThoZk8zeHpaWHI3U3puOHZ6ZUxiRVVIWDlpVkppZHIyQXFp?=
 =?utf-8?B?ZXROWWczbktXZ2Z2amhHSmVTRG02S1lYaW5qOWFQenRnTXZSdlJkeG1YNTlT?=
 =?utf-8?B?Tkx5RFRpRzBzNFk2dlhRNjRuWmkvZE4yQ3JtYnhtS2ROT3pSYUIvY0F5RlpZ?=
 =?utf-8?B?QVB3ZUhCenpqcG9kMVI3cUc1U1dwV3VCU0s5a0E3em5KbnczSTdNSXlHMUNh?=
 =?utf-8?B?SzhpYXZjTGs3dWJRWi9LcnhualBlWXBZTGgwYUFPT3dMT3BDWkUzLzA3bnFX?=
 =?utf-8?B?eldSVWJPSHZ0Z0xvTHcwVWJRcEZSUDQrL3NrWkkxRDNzcjQ4WG9lRHEzTFcr?=
 =?utf-8?B?L2RzUWVaOWFZd3p2SFRUc3pER0dGQkhOeHRxcHgyMWthbkhhd1FtWFROaHQ3?=
 =?utf-8?B?WmtSaFVHWXVScmduSEE4ZzJ6QnhRL1pnMFBBVVlQeGZoWTd6OS9XZXp6TUV3?=
 =?utf-8?B?eFg0T1NJYnJjUVdxRXY2TkJnRU1HOFF6Qkl3MlRUa2JxblNmKy9JMDRzeVda?=
 =?utf-8?B?SlZxZWxBcHdpbmZvKzZoNkdBTmJ4Z2RmdmhwR3ZmamxJNDd4cjJqVy9Tb0Yv?=
 =?utf-8?B?SEJWOERLcVFnbHcrQ3ZBU0x2dElOVWlrbWVyNy94MVJ3L2lKYzVCcVdHU284?=
 =?utf-8?B?MEYwRktqMzI5OXcyOWUzZ0xDRFcxazk2cGplZnUyNktXV0pqZkJVUXhFVWpU?=
 =?utf-8?B?V1dXM1pLVXhIOE9VQVZqRzFBTjFUemtNRGY4SEV0RkpuWEh5QXZkbHNlVWRM?=
 =?utf-8?B?Y3ZaNnNEZXV4NkpRMW5Jb003YStsWFdJYUxkWUZpays0ZzI2Slp2VlJZNW9S?=
 =?utf-8?B?WFV5dU5hRGxRRFBFS2hBMnBFWWJRR05XYjk1b0NKZUtjKzlTQkVTa2JsSGpi?=
 =?utf-8?B?Y2VKMUFHL3RFWE9MRnQ1ZlJjSHlpUFA0K3A0bVFheXpMaytGZFJXeVVjQ0h5?=
 =?utf-8?B?R29PV1J4eG8ySEptcE5laHB0WDZVVWZkZ1hFdmVhQXc4NkptdWRtR1Z6eXo4?=
 =?utf-8?B?U2I4OHdVeVl4d2l4WkRwSllFWW92T1hYcngrUVFMaW1ka1VVeWN1VHNEMVl5?=
 =?utf-8?B?S0dqbTh2L1d5WFhmNVRlZFN0V0lsV2xzOTVUYWFBaGV2UVk4N1pYaHZTTHRx?=
 =?utf-8?B?UEtGR0hNLzdqZHkwYnQwWTg1a1ZmR09WMTBQSHhCV0ZhaHA1RjZXZ1ZlNXM3?=
 =?utf-8?B?QWdXRkduRmtRZWgvd212VkdRZnp3NmpPU3JuSFU1Y05jUm5UMUxOdjlOeG1V?=
 =?utf-8?B?ejJ0d2RWMTE0VVNrVEV1M2N1YzJxcjVRYTRHc3VsMzB4dHpCeUZTTkhWdWxw?=
 =?utf-8?B?bkMwazZHMEdFOFUyekFnaFN5YlIwbWlVUXQwY3FmVU1zeDhQbExzbnRWRGNJ?=
 =?utf-8?B?Q2pqL2RNdUJKSlg0bkNFeVZvVGRBUHQ3TEYwN00wQVlkMTZua3c0cm11WDA2?=
 =?utf-8?B?dnZoblZpOEwvaE1ZT2NZM0JOWmJzRkpJU1FpSFdpVElUUzJFanFSUncxTFJu?=
 =?utf-8?B?STg1bnJYNjZkeFRYSnBXMTgzdjgrWXBwR1l2bnpGSVhxZ0llUjlXWkJPRFB1?=
 =?utf-8?B?MVVmZkR3UEdJSktXOStOWHZOS2hRVFVBMTF5WDBFS05McldTb3IwMTFQSzdU?=
 =?utf-8?B?eW4xeHg4cE5nRG9FMGNOWWIycVRlSHA0VW5HR05jUThYZ2ptWmRoS3hVZ2VI?=
 =?utf-8?B?eDBwWDBKQ2Rob2ZIZkowbzNQM25LTXg4eTlBL1dFOWRXd2Z3UnJ5aCtOQXFa?=
 =?utf-8?Q?cQXnN3NEzb5tJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3U2TTVpekpNbmFaU3pMQWhYazJWdTFhV284UC9qWndQZzhocjFWYXFMT0pu?=
 =?utf-8?B?dHA5ekRaVjc3K0FzQ3lRdUZodmxDZmI3bHYzT0dvejNzWUtCaldpdVVCcW1J?=
 =?utf-8?B?dzRSRzFjVGtnTjg5TGQydnIvTU8vS3ZwcDFnM29DOXB0Yk0yeDB0cVVRL3A4?=
 =?utf-8?B?MFVRSXlqaTBQbGZBZXZMQ045YWZHbnNDY0NpREhjNlB3ZW9SYi8wZUM2NmE1?=
 =?utf-8?B?LzFSanhmbjJJMnZrV05PVkE5TjRkZ2hIUUsrWmpzS1Y3dlNCM3Fld3FiN1Rm?=
 =?utf-8?B?Y0g4TG5tQWxPVFJ4VURQOEtlYzArcEZTZWgyb1FmM2VQVHVZakZaa0pQeXdE?=
 =?utf-8?B?MDZDa204SjdiK0dOY3NhclFnVThjUHBVZXhVM1JNR3g0M05GNlhzYVdqeVU5?=
 =?utf-8?B?UHkrdXgvMldJMjdpV0RFQUYwQ3VtZ21YUXRNdG5VdFhkVmJsQzRIMlBZeERR?=
 =?utf-8?B?Z1dSYWtCUWVSdG92Y0kyMGtqeG9lbnZadEg5YkNDbkEyb1FkaWdLNU1DTXFx?=
 =?utf-8?B?OC9pSWF0aTJrcnlmMjlGaEx1aWlaUzd2YmcwN3A2Zm9ORWRBUlpTQmFFQXJ5?=
 =?utf-8?B?Ny8yZzgrU21EaTQwTzdPMXY2SGtuSElrdnF4TmY3a1NSKzFGOG5vMEptckg1?=
 =?utf-8?B?N0RWdHBzNWlFSkxWUEdZcXpEb2twMUozek1LMDhnQ09XeDZDWVU1MHNhMzlh?=
 =?utf-8?B?WkxTUDFKMXRsSm0zRXJWRmJxS214cjZDLzlhczc4b1dvUkZxWFBCWWphdWFt?=
 =?utf-8?B?aVhLL3NhUExIKzBpaEFaUmZSbWszOUY2aXpXL2FnMG9taVBzMW8ra0VqUjQw?=
 =?utf-8?B?NUhmOVY1Q0ZhbGNRRmlQcUs3NGVHTWF1M2h5cDJTajBBR3h0YzRZUFhCM2Rl?=
 =?utf-8?B?M09mL3RDNUx3N1V4SGdPNm9wckI3RHQ1OEJhc1I2dG55NFovNVFCNjJyUDA5?=
 =?utf-8?B?akc3Zi9NWUNKZnpsaVVrSks3M1VLdzJVc09DZ2ZkZXlFYjNuMW5OR25SbUo0?=
 =?utf-8?B?Qmh6TWwyTU5hR3hCVlh5RThuMFdabzEvK29IOXRwR2RyQzlpUGdnYTlacE9j?=
 =?utf-8?B?ZWtKcU5PNERFV3BKQnFURVVqdVc0VGVDLy9seU1mT29SR0lBa3I0OFdoNWIx?=
 =?utf-8?B?dG01cjlZdnVJTmo4L0xONzBEcHFyNEdVTjNqYU9lcnY4TXRHaVQvLzhqalNm?=
 =?utf-8?B?aDFNUU5DRm9jam9NSmdqTkVMTXg1SVhOUmdJNnU3OW85dW9MellsSU00Q2Ny?=
 =?utf-8?B?ZDFUNFp0Yis0ZWlRbklkSkJ6QU4yVnhQY1B2WWZzWlQ1RnVJem9ZZDVDWUs1?=
 =?utf-8?B?VGhtV2J6NWJjZ0p5ZlIvTWd6OTdQSjh1eGRmcWhSZ2pUbWtEUTBXbE5hY0Q4?=
 =?utf-8?B?azlnMXlJVDdHemYrWEk3Y1U3d2FEalNQSFpxazI1Wmw1YTAyOVZZZ0cvbFRq?=
 =?utf-8?B?cWhINkxvY0tZNHlkR2lKcVdRSGJXdW13ZmxiYmY3VldTMXhDemtiSzdMR1Y4?=
 =?utf-8?B?bk1QUmR0VGZxTC9aVjdIZE9YM2N4U2FYMjJ1TzNWT0lVZ1hOcFdGZHNST29Z?=
 =?utf-8?B?L2pNL2ZNQ1VEdS83alowL2JEdkZyWHJQUVlwNDQ3SWM1SFlpelpFYlVaWGdI?=
 =?utf-8?B?dmlIMkRwSERqT2xxZHZ4VnYwUDNhR2g2bzdvQVpQRFNDYTZyOU1XYlRvQm5r?=
 =?utf-8?B?MjlCcE9teXNaMndZVUxGTURCcjB4R2l6QUlHNHBPSk1sR09hbkxDRDd0NERL?=
 =?utf-8?B?b2JTYWU0T2pJQmloVW1iTWZMVXZyMDU0NWtqanExU3V6SUdQWk42dlE2YytV?=
 =?utf-8?B?aVJxMFpnSGpnN1o2M0lteGErc1NYSTBIdjU3YXljaXlqM1BRZW8zOHEwQWxa?=
 =?utf-8?B?WVM0TDBodlpOZ1BDY0YxOW9ucUtPdUlTWTlNWHpxcGgwOEJWNFExaVZSUWNH?=
 =?utf-8?B?dy92UWx2Vmxtb2xrQlRYU1luNnIwL0p0d1lCcVdDT3ZSKzlueXVRRlF4Yjl4?=
 =?utf-8?B?b2kvVHh1RXBJZnNsMEo0Z1FFNk55SHFLWnZZN3d0eVNqUjY2Z1Q1cThjaHN1?=
 =?utf-8?B?L3hJc1IzbVh3ZnN3RitjcitQUWduM3ozNnJkb2o4dkJ5MXVCQTVLVzVkMXZC?=
 =?utf-8?Q?VJNi1R7yBkMhCobzj5VJMoZTq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207fcdd1-fc35-426c-a68c-08dd2d5969d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2025 07:20:20.9004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJqEfbldR3e5Q+vz6D1lYIg3W+42XsxbBlqJ6sCQVHMOMaTPg8ZJWGGONGOWeXekNn4/mwADpnNTk9s8X3FPqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6985
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

I applied some code formatting, and the series of three changes now looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-01-05 02:15, vitaly.prosyak@amd.com wrote:
> From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>
>
> Implementation of dynamically selected scheduling rings.
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alexander Deucher <alexander.deucher@amd.com>
>
> v2: fix formatting(Vitaly)
>
> Suggest-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Jesse Zhang  <jesse.zhang@amd.com>
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 43 ++++++++++++++++++-------------
>  lib/amdgpu/amd_deadlock_helpers.h |  8 +++---
>  tests/amdgpu/amd_deadlock.c       | 28 +++++++++++---------
>  3 files changed, 46 insertions(+), 33 deletions(-)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index dabd7ae76..8ac6abf8f 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -65,7 +65,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
>  	int job_count = 0;
>  	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
>  
> -	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
> +	if (priority == AMDGPU_CTX_PRIORITY_HIGH)
>  		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
>  	else
>  		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> @@ -173,7 +173,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
>  	free_cmd_base(base_cmd);
>  }
>  
> -void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type)
> +void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci)
>  {
>  	int r;
>  	FILE *fp;
> @@ -190,18 +190,21 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>  		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
>  
>  	if (ip_type == AMD_IP_GFX)
> -		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
> +			pci->domain, pci->bus, pci->device, pci->function);
>  	else if (ip_type == AMD_IP_COMPUTE)
> -		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
> +			pci->domain, pci->bus, pci->device, pci->function);
>  	else if (ip_type == AMD_IP_DMA)
> -		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
> +			pci->domain, pci->bus, pci->device, pci->function);
>  
>  	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
>  	r = access(sysfs, R_OK);
>  	if (!r) {
>  		fp = popen(cmd, "r");
>  		if (fp == NULL)
> -			igt_skip("read the sysfs failed: %s \n",sysfs);
> +			igt_skip("read the sysfs failed: %s\n", sysfs);
>  
>  		if (fgets(buffer, 128, fp) != NULL)
>  			sched_mask = strtol(buffer, NULL, 16);
> @@ -247,7 +250,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>  
>  	/* recover the sched mask */
>  	if (sched_mask > 1) {
> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
>  		r = system(cmd);
>  		igt_assert_eq(r, 0);
>  	}
> @@ -269,7 +272,7 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
>  	ring_context = calloc(1, sizeof(*ring_context));
>  	igt_assert(ring_context);
>  
> -	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
> +	if (priority == AMDGPU_CTX_PRIORITY_HIGH)
>  		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &ring_context->context_handle);
>  	else
>  		r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
> @@ -401,7 +404,7 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
>  	free_cmd_base(base_cmd);
>  }
>  
> -void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
> +void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci)
>  {
>  	int r;
>  	FILE *fp;
> @@ -418,18 +421,21 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>  		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
>  
>  	if (ip_type == AMD_IP_GFX)
> -		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
> +			pci->domain, pci->bus, pci->device, pci->function);
>  	else if (ip_type == AMD_IP_COMPUTE)
> -		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
> +			pci->domain, pci->bus, pci->device, pci->function);
>  	else if (ip_type == AMD_IP_DMA)
> -		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
> +			pci->domain, pci->bus, pci->device, pci->function);
>  
>  	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
>  	r = access(sysfs, R_OK);
>  	if (!r) {
>  		fp = popen(cmd, "r");
>  		if (fp == NULL)
> -			igt_skip("read the sysfs failed: %s \n",sysfs);
> +			igt_skip("read the sysfs failed: %s\n", sysfs);
>  
>  		if (fgets(buffer, 128, fp) != NULL)
>  			sched_mask = strtol(buffer, NULL, 16);
> @@ -475,14 +481,14 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>  
>  	/* recover the sched mask */
>  	if (sched_mask > 1) {
> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
>  		r = system(cmd);
>  		igt_assert_eq(r, 0);
>  	}
>  
>  }
>  
> -void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
> +void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type, struct pci_addr *pci)
>  {
>  	int r;
>  	FILE *fp;
> @@ -498,13 +504,14 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
>  	if (!info.available_rings)
>  		igt_info("SKIP ... as there's no ring for the sdma\n");
>  
> -	snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
> +	snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
> +			pci->domain, pci->bus, pci->device, pci->function);
>  	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
>  	r = access(sysfs, R_OK);
>  	if (!r) {
>  		fp = popen(cmd, "r");
>  		if (fp == NULL)
> -			igt_skip("read the sysfs failed: %s \n",sysfs);
> +			igt_skip("read the sysfs failed: %s\n", sysfs);
>  
>  		if (fgets(buffer, 128, fp) != NULL)
>  			sched_mask = strtol(buffer, NULL, 16);
> @@ -530,7 +537,7 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
>  
>  	/* recover the sched mask */
>  	if (sched_mask > 1) {
> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
>  		r = system(cmd);
>  		igt_assert_eq(r, 0);
>  	}
> diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
> index 7f8419280..1d654c490 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.h
> +++ b/lib/amdgpu/amd_deadlock_helpers.h
> @@ -24,12 +24,14 @@
>  #ifndef __AMD_DEADLOCK_HELPERS_H__
>  #define __AMD_DEADLOCK_HELPERS_H__
>  
> +#include "amd_ip_blocks.h"
> +
>  void
> -amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type);
> +amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci);
>  void
> -bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type);
> +bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci);
>  
>  void
> -amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type);
> +amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type, struct pci_addr *pci);
>  #endif
>  
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index b8bb053ca..29b7ae509 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -40,6 +40,7 @@ igt_main
>  	int fd = -1;
>  	int r;
>  	bool arr_cap[AMD_IP_MAX] = {0};
> +	struct pci_addr pci;
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -60,12 +61,15 @@ igt_main
>  		asic_rings_readness(device, 1, arr_cap);
>  		igt_skip_on(!is_deadlock_tests_enable(&gpu_info));
>  
> +		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
> +		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
> +				pci.domain, pci.bus, pci.device, pci.function);
>  	}
>  	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
>  	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
>  		if (arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma")
> -			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA);
> +			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA, &pci);
>  		}
>  	}
>  
> @@ -75,7 +79,7 @@ igt_main
>  			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-illegal-reg-access")
>  			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
> -					AMDGPU_HW_IP_GFX);
> +					AMDGPU_HW_IP_GFX, &pci);
>  		}
>  	}
>  
> @@ -85,7 +89,7 @@ igt_main
>  			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-illegal-mem-access")
>  			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> -					AMDGPU_HW_IP_GFX);
> +					AMDGPU_HW_IP_GFX, &pci);
>  		}
>  	}
>  
> @@ -94,7 +98,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-deadlock-gfx") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("amdgpu-deadlock-gfx")
> -			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_GFX);
> +			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_GFX, &pci);
>  		}
>  	}
>  
> @@ -103,7 +107,7 @@ igt_main
>  		if (arr_cap[AMD_IP_COMPUTE] &&
>  			 is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  		bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> -				AMDGPU_HW_IP_COMPUTE);
> +				AMDGPU_HW_IP_COMPUTE, &pci);
>  		}
>  	}
>  
> @@ -111,7 +115,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-deadlock-compute") {
>  		if (arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("amdgpu-deadlock-compute")
> -			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_COMPUTE);
> +			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_COMPUTE, &pci);
>  		}
>  	}
>  
> @@ -120,7 +124,7 @@ igt_main
>  		if (arr_cap[AMD_IP_DMA] &&
>  			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
> -			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG);
> +			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG, &pci);
>  		}
>  	}
>  
> @@ -129,7 +133,7 @@ igt_main
>  		if (arr_cap[AMD_IP_DMA] &&
>  			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
> -			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG);
> +			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG, &pci);
>  		}
>  	}
>  
> @@ -139,7 +143,7 @@ igt_main
>  			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
>  			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
> -					AMDGPU_HW_IP_DMA);
> +					AMDGPU_HW_IP_DMA, &pci);
>  		}
>  	}
>  
> @@ -149,7 +153,7 @@ igt_main
>  			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
>  			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> -					AMDGPU_HW_IP_DMA);
> +					AMDGPU_HW_IP_DMA, &pci);
>  		}
>  	}
>  
> @@ -159,7 +163,7 @@ igt_main
>  			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
>  			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
> -					AMDGPU_HW_IP_DMA);
> +					AMDGPU_HW_IP_DMA, &pci);
>  		}
>  	}
>  
> @@ -169,7 +173,7 @@ igt_main
>  			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
>  			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
> -					AMDGPU_HW_IP_DMA);
> +					AMDGPU_HW_IP_DMA, &pci);
>  		}
>  	}
>  
