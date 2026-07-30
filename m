Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76C4C55162
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 16:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501B510EFC5;
	Thu, 30 Jul 2026 16:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PmdHSYQ5";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C527110EFF3
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 16:16:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0314pki1LBMGpc2vcdtkj0w26+t3ZgwoowojotwpUJHek0viPeBlzk+78F1oGRGbxkSNWdUHTSz3x6p9+k6GYRjZ258UwnMq8Z3TyaLC+pSV0O3LPjGrzeSsuXwXfI4VhR1CbPBDKt31ufpBPYM8X1LyIxR1JuIJP3+fy55w+Vaw9TAgotMc8K6fT5boCetOpUBUqn4fXY5FBDPOoSPnN+b6tsFILZswUkZ7FBWGenmVPtwiZhCX0ogqdcd0bYx6Dza3tdk73w/WUzVRNOyGVBrKo3r9lBK8ZQa0Ctgz6lg2lX7VZu2KASxMMlBEaIsjJqQcMmX5HO83TVOq36xsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGBZLnAnW/gI2YWwd2ELlwmsezLP2YZdiJfqZt25LW8=;
 b=CCmyLozS+oi6XbFH9bw8e12LlEmO4Bl6KM3xOUgNfyeXKGFbS6QLtsOPfPPUvh8C5Exz3Uu6qaBotXRvXdWPcg+eOyrSqzEcFNeNNan9HDwZRONvRYElqFlBxCGVzE875NjeeWk3mXFkk6UMX/0pVx/YvtMicuqK1/L2DaFg7CMFam0DfOEpfkNwAZIRZD0Xlxrb6xCBPD3xIolPnyIIda8YXLJtwVb8Eic1lmyE4ezYKqeYZ44Fqc+KK04eKFk3wa6SL0If3LofvXuCdTwZtajV/V41Cz9c2mNPKIZF3F12wqxB5SIys+CzHxnZ/w906v5Ymj9fpiHMMPT33mlKLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGBZLnAnW/gI2YWwd2ELlwmsezLP2YZdiJfqZt25LW8=;
 b=PmdHSYQ5hKVLy49aWKm/5gTFTP7o/vwF5vDnKMSqjeJnVqtePomlf2Gz74sjcn9TaMGaHqakGu/m/XgMFkcV9wbHp9MZxVOToziAcvAqkzRMW3gKjGLQxs9PY8NXc/m+dukh+OM6htyq4yPANDhj8gqiNUYi/Rk6tA9yQuPpv3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by CY8PR12MB7562.namprd12.prod.outlook.com (2603:10b6:930:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 16:16:52 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:16:52 +0000
Message-ID: <126ecc11-5900-4d7b-a36b-d876f1c36af6@amd.com>
Date: Thu, 30 Jul 2026 10:16:50 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] lib/igt_kms: Add IGT_COLOROP_FIXED_MATRIX
 property
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-3-harry.wentland@amd.com>
 <e4dcc6bd-95ff-468c-9431-cbbcf0436ccc@amd.com>
 <cd537d9a-4abe-490d-92ab-089b23753cd1@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <cd537d9a-4abe-490d-92ab-089b23753cd1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|CY8PR12MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: fae469a2-4e07-4540-2e9c-08deee55f744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HRIOq5kc1o27ljE62kfZNgCUR+Oc3S86crljV3C39hDffDYHrM5B3DiY94RX8ndTRl0dVMh64845FNBz7SbnAtxyr8n0sfoi4USmnQItftO6IanigYRjUaDWIsYTK8ODRKzTeOqN/3L4VbPytAgO/OcmjPniSqLRR1tw15akx5iLXq84ajiY8jZuo9QhK8EYl23Xve9TPVdSxHyO+/eRX80wxKh81aTq2svcJ7T8AU3/x+tfdnCSx9mRkMOjDV3ypPr4lfwfKKvWsbT2N39swVqRjmpxms6yeFlXzQk4/uG37xbDSc2Cy6v1x/JY8PxWjrAm9SkOVzPJ+X4yc/EcH+DXbjF9kxMSlulaBXUYtI+Oww8KIJyvLO+kkdsSEpW1Ec76HHQ8lNpGiaOo8g0iPSthLsm5ME4WNpBpdfUJtdRnbdkn8ehKZhjp/w6mcPJ7IxKbsnb0IzsjfB/0pYxysPxQi6Gdpu1CU3i97MeZMTTqkBgAKHUTA3p7Xr2Pmre2lLrue9Z64f5vt+tzA0/BmSsUgBZWvklZ68eWuAScP7VQd/x3ceOyt2yeO1X9e9ZL4LQhjJuDiV9snHJVEN02BhftyqFj3m02UTsJbENQcAca2gNBMOHVdrQD3BfKkwKCpn1IwfWrRVMSJN8M5AQ/d7Jn2JGnTwppCrAx4gO4te8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHozKzdFQUZLNEdWdEQralo0RGowRWdraXlxOHhDMDNEV082WEphVElqazZB?=
 =?utf-8?B?V1dsSWFiZWRtREFZeWxzZUdnZ2MySDJPSHVQUGlINHNWUTZvekorRkFVaWxk?=
 =?utf-8?B?Ti84cUp5ZjBhNDhNanh6Y2RjcC81b2gzQWN4VlpQRThoRHMva0oxYk9wUm84?=
 =?utf-8?B?anNtVVFmd3RaT2RVOE5pSlVIL21SeUI2RE1BYjJzUFJ5L0VEMUhIbm1IcExw?=
 =?utf-8?B?dGk3VzFhYkNLVjhZRUhSSE8valVKa3ZUSjlLWjZWWThCbHJVSzVaRFFDdk43?=
 =?utf-8?B?QmJLNHhRbUlBZzZ1MENtbVVwMllYRTdrdzFBTEJCYnkzVVNWNjJJZ1lnM25j?=
 =?utf-8?B?QVFyV1BONnV6ZWs1K0YzYkFYVVpnODltTCtsNml6ZGxNRkVGM2FGcGYvNFhX?=
 =?utf-8?B?OUVpcE1QSDViWXhMcDMwWk1GdURJNkFYYjljSzhTM0xqdFFSc3czTGdLL0oy?=
 =?utf-8?B?YmVWczZXb2NVSUx2dnlTYzJhWHdUbU55bk5XbjVxTWttWWlmUEh2M0hlWWpS?=
 =?utf-8?B?S3ZtMHNCeUtqZWRCRHlTN0tod0xMeWtVMUtraE8zVUlSUmI5clVkVEdnNDdP?=
 =?utf-8?B?TGE5WTlZSStheDV4MWdxUTNHWllMRldYRGx2Mk1HWEN3bzlHdXZDU3Y2ZXd5?=
 =?utf-8?B?NmtVSUE3cW4rQVh3VHQ4R2ZGUEdCdWxmd2JnRFhJQTl3QTR0YkhIK3hqUDVI?=
 =?utf-8?B?SEwxQ04xL2VEbUVudUNWc0Z6WFR5c2ZNUmN4dlh2ZWFqdVRRSnplQWQ4SG90?=
 =?utf-8?B?bjIwUEIrdXZZUjlMSExBTjBxTXltMUdGbEowRHhOUEJwWjJTMHBpTzBMMmk3?=
 =?utf-8?B?NXlISWtCUmFsRzhWM2tSZVFuUzJUMWY2NVViTnU3RVhkUmhvWTQvWnpPTFRj?=
 =?utf-8?B?amJJM3BNV0ZEY0ErdmxNWUQzUGZrQ3lJY2Y3TnZpRWhzSUdHK1dvYjlFQ0c2?=
 =?utf-8?B?cWQ5am1rcXp2Yi9pQUR1SkswdzVYT3ovUmxhV010NEtyQkgrR3lNNXF0Sk5N?=
 =?utf-8?B?VWFzeHdkN1hpK0xtL0h2QXgxazI5T1VTVkhQUG1IRTVoSG9MaWZNQ2dqdGN1?=
 =?utf-8?B?TzFzTlpxd3hmdWwvbGoyRURGd1FhRzBmRC9MVVdjM0J6RHUrODhqU1pqY1My?=
 =?utf-8?B?Tm9uZDVEbHNOVXpkN3V4QjZ4VjFnTEh6VFJZSDNDRHNERkNXRGZKWndvWm9F?=
 =?utf-8?B?RjN0VUJFbmpxTjdEbkk4UkZkR3Y4SlhrY1d1NE9kOUNmVXZjaHVvb2NTcmdj?=
 =?utf-8?B?Zml2c2tGek0vTHQrTVBRcS9seE1WWTQ2VjVCTUxXTlY3c1l5TGtKRjEvVWFr?=
 =?utf-8?B?WVN1R1BPVngxZWRVZzZXTUtFVDFFMWx2ZWVzWHE4dC9VT2FwSlhlTWVMN0dp?=
 =?utf-8?B?VStGRjZneHhmV3k4ZTU4VkU4RlRIaXh4aGVvOVZRTHVUR3pUM1JiOXZiSml5?=
 =?utf-8?B?cnU0NGJNTmJBV0MrQ2dMR1huWXBXQUtWU3h6MkhzMjdXN1gyL04yVE1DanFr?=
 =?utf-8?B?OS9jbjVzb2xJZFBjTUdhMTFtVmJJNnIyM0E4bG5mQ1kyT2xRejlOZ1YzTEZu?=
 =?utf-8?B?aWhTN25zWjE4dlRta3lCTkZxeEw3STBhbDF1SHpLQzNBQmUzYnZqdmlES2FJ?=
 =?utf-8?B?Sk03Mm1Bd0taanhrTExwQTBZbllhSy9yVWExZk5QbDBoRnEyV0pCcno2Rmh2?=
 =?utf-8?B?VTBUcC9Pc0ZQRkRLNEZ6cFFZUHlLSXlBNWpPbXB0SHdsdFppeDRoZ0RNNkVx?=
 =?utf-8?B?WjJHNnQvdEU4RWF3RkpxU3NQK20rYStKTW1xOGpjeTd3VVU1eVhadEJSb1hX?=
 =?utf-8?B?eWJteHN5VVJ5MXdtYUJjT1J5K3ZpeG9LVlRvMXNucGdlUHdnaWh2TTZ1WmtR?=
 =?utf-8?B?T1ZxOFRpK2h6OVVod1BOVUJONlRsNWRhTnIxTXoyLzRRVEkrdllSMjhyeSs5?=
 =?utf-8?B?SjNRUlNOc0NuY01Ta2FobUFaTmpIWXdESTlLK2xYM2ludlNGVkJZa2VaVXMw?=
 =?utf-8?B?Uk9EM1lVQ1R2NWNxRDdsTFBNT2phejk1ZlBPcEVSb0YvN3huL2RQQUlNSlVS?=
 =?utf-8?B?R0wvSDJaKzdIb0R4L3dMek5EMi9mRFpUVkVLT2F0MDV5N2xpNy9MaW5IRzFy?=
 =?utf-8?B?dnVQOFo5S3RaMmFudWdMZ2JYR0NnUFBhaFNwak5yY2hobDdKZmN3V2hLcXNE?=
 =?utf-8?B?WmFxV3BFeUNTR0lJOEtLRDhIZTF6NmZZTDdSdmVabnVwVDNpTjVsMUw0V3N5?=
 =?utf-8?B?Y2VLQXhENHRxdG1oR0MxNXMvaU9Ba3NFRDhZK1gxWUFsUFE4WEpHcW9KcThI?=
 =?utf-8?B?Q2ZKM1ZEejZxeGpycldUb2NJZm5QM2htbnZIbHF5NGNRNXN3YzM3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae469a2-4e07-4540-2e9c-08deee55f744
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:16:52.2848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhOE32lzlf6AmXfCLyN1G6ksq51Uis7qpM8T+UIfuiHZL0yrPNIByEugRNR8bouI708fyj/MKZ02/EQRCC70NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7562
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



On 7/30/26 09:34, Harry Wentland wrote:
> 
> 
> On 2026-07-25 02:56, Alex Hung wrote:
>>
>>
>> On 6/23/26 11:57, Harry Wentland wrote:
>>> Add support for the Fixed Matrix colorop property:
>>> - Add IGT_COLOROP_FIXED_MATRIX property to the colorop property enum
>>>     and names array in igt_kms
>>>
>>> Assisted-by: Claude:claude-opus-4-6
>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>> ---
>>>    lib/igt_kms.c | 1 +
>>>    lib/igt_kms.h | 1 +
>>>    2 files changed, 2 insertions(+)
>>>
>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>> index e82d32130666..9003b2b9e670 100644
>>> --- a/lib/igt_kms.c
>>> +++ b/lib/igt_kms.c
>>> @@ -725,6 +725,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
>>>        [IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
>>>        [IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
>>>        [IGT_COLOROP_NEXT] = "NEXT",
>>> +    [IGT_COLOROP_FIXED_MATRIX] = "FIXED_MATRIX_TYPE",
>> Should we move IGT_COLOROP_FIXED_MATRIX before NEXT?
>>>    };
>>>      const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
>>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>>> index 3df3ba86630e..1be58288e119 100644
>>> --- a/lib/igt_kms.h
>>> +++ b/lib/igt_kms.h
>>> @@ -363,6 +363,7 @@ enum igt_atomic_colorop_properties {
>>>        IGT_COLOROP_MULTIPLIER,
>>>        IGT_COLOROP_LUT3D_INTERPOLATION,
>>>        IGT_COLOROP_NEXT,
>>> +    IGT_COLOROP_FIXED_MATRIX,
>> Should we move IGT_COLOROP_FIXED_MATRIX before NEXT?
> 
> I would prefer not to re-order existing enum values and
> simply append new ones. I see no good reason why _NEXT
> should be the last entry of the enum.

Sounds good to me

Reviewed-by: Alex Hung <alex.hung@amd.com>

> 
> Harry
> 
>>>        IGT_NUM_COLOROP_PROPS
>>>    };
>>>    
>>
> 

