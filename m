Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34005CAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 20:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13B110EA85;
	Fri, 19 Sep 2025 20:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UIKyH/Ok";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012024.outbound.protection.outlook.com
 [40.93.195.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B9810EA85
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 20:19:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/oJOIWEBN+3SapxRlq0rgJzczci5u+hOHIpKP74tz4oIOemOGvRRG45uD2+LWR3y2WbX2NBqyWkMix+jmeo7kDwnUWX5vY7nDOTVoJqnJs9M68RJyRQc30Xa/+mePbooVlibd0jMPzsNXcyNwLQvgoo1MnEnyfLIBc5tryaudmkLMwBAsA6u6d01KX7wUIhBiwDNBMmMSqb+qgELobZRJfQQdrKwUd3bNVfKlBlIaVDLmQebt4rkM1s1W1F019pzFqylk4nLU7YSzVu/H6n5lx2x7CcXHBdBTnG7h63J11h4T1DyI1wwQaXJIflaGlSEnYBdz8BruZq1OwSt68jBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEltnck09wp6jhsSkXlhXgoyzdAA/M/JaHxp73XyZUs=;
 b=EK2bmnSkoHU25QTtFKLDSAKrYgedYsSkjRvOipyNmrRrAbNlahse3yayuIDiSeatqE62XiCDvOBM/DES85aPtwYYe5Of/kvLB8ymK2/FGldBP9NyM6VX34VZTg8bpJlGRAA2ZPehmV3nRKsiNF+VPhD6UJUF6746jqG5cnntzfSBa5xlkiyTrEnhsD1OETi6NG3GjLaVi0m75afW0XWZCPp05/VKi/T/UhxALskbxKRIbAXAHeq6VAPQ4QdymZKPLOFsFi31tqAHNkoP5IKSyDoDYE4V1tahoTrsrasZuTrGeOgeyHYxcGljnMwQemZyXpQ2qRIvF6pS4QqjdmdpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEltnck09wp6jhsSkXlhXgoyzdAA/M/JaHxp73XyZUs=;
 b=UIKyH/OkSHcu7TiWzNddF6L6PVg2WYJobzVfPLytph2/d+vcy/7wnWyX/UmSqGIBCFR9n+NwUahkrYTZNgSYDQAGXDcy2rBnCSW+AINY2vKt+1qGf1IOaqwk0cMX2OIgu4E/Xru6P/c4V6ZoV32FYGguttIJMb2Od76qjts9EIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB6110.namprd12.prod.outlook.com (2603:10b6:8:ad::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.14; Fri, 19 Sep 2025 20:19:50 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 20:19:49 +0000
Message-ID: <e75f4a84-fece-4504-9561-12fe2961af3b@amd.com>
Date: Fri, 19 Sep 2025 14:19:48 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 02/30] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-3-alex.hung@amd.com>
 <00802a7b-d936-416d-aa58-19d7d40fcd2c@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <00802a7b-d936-416d-aa58-19d7d40fcd2c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 58357c71-5bb1-4893-a5cc-08ddf7b9e26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmZvUkN6bTNISjdoWG90aFBZMVFPcm44V25nNDhMc1p0bEJIMXJOZEs2eUlF?=
 =?utf-8?B?TUY1SUFpOThjelB6Z2M3UTdsSFlaaFR1WFhLYWxuZ09WU0M0c3dHVVlOU2lN?=
 =?utf-8?B?YWlkT3NRNXVVekwwVjQ3SEJiNjNibzFPZ2NGZldsc0FjbG94dmNodE9Yc2ho?=
 =?utf-8?B?Wkw2cTFuRTVEUVV0b2JXMzVKcFJDV0hvTXFsNXIvUlVvdTQ4YlB3TXJva0dj?=
 =?utf-8?B?eFB0NEFWVTRxNVZGMEpjUE9vbkdlZDI3cXFMVmNjRkl0SlZwVFRIdTNrY3k4?=
 =?utf-8?B?S0JIaUpFOUJUTW42NGJFSG5qWGQ5ZmgwRndmbFgyeE96cUJCc2FFTnA3MlRX?=
 =?utf-8?B?bXFGRFZNK1ZBeEd4aitrWGYwb2JBdnJ2RVVOQXpFVzMzWTR5OTJtaDFyRnhG?=
 =?utf-8?B?NTlZWGV0bktjaGI2ejlhYnBxRUp4VXdsOHNocEdtOEJlcU0wN0V6dXRXeTdm?=
 =?utf-8?B?U2pPOUZpdU5CVUErVzNmNkppUlJDYnJHVkpzVytZRkllUTF4TEhRaWRHVHBp?=
 =?utf-8?B?UGZWOGo5M0Zha1p3MFpZZ3AzSkRTaTF5MWNiTXZVaVZQdmQ4ZW1VeHNvL0o3?=
 =?utf-8?B?cGY1UzhEdzFrbkpLajdYTThmNktmWXZyb2NQUVRFWU9Rakw5VStxQnlFdk9F?=
 =?utf-8?B?NHVpUXlheGd5d04zSjJTM3pGSWRmZUtQV2FwYUIwTVJCc3J5SHVvZmM3Nk1q?=
 =?utf-8?B?M3B6WDlDMTk3UTUybHRpMEhKaWV5eGU3SWV0dlVYdmNnUFlkSVBwQng0V2Vp?=
 =?utf-8?B?ZW9IN0tOMHViSm9pYU0rUXJQOGRGSm9WY1MxdjhGZmhXdEtBOGkxaytqVy84?=
 =?utf-8?B?eWdWSWJLZzlTMVdBNVFzRWpGNnRNQVNDQ1AvTkROMk5seGw5MnYwdFM1OCtO?=
 =?utf-8?B?K0tqZG1DWlB3dUk2dXkwdmhUd0srdEZLTG9sL1MwTGRSbmZVUGRPRFh6a0Ft?=
 =?utf-8?B?bHZxZithTlV3WVBKbzg0Z1M4OXM2alRmREljRjNJU2xReUFOMlFHeHB4bVdm?=
 =?utf-8?B?dXJLR3ZwSzJuRXJWV3hndDByM3ZxekNXN3RLalZFNG5tL3FFU0htUVpTSFA3?=
 =?utf-8?B?NWVzUmJIQjY1L1BSYXdZc1NPajFhTUtZNk12R3RWV2dYOHkzRzZHbkliakEz?=
 =?utf-8?B?Q3lCL3pxMzVvcUJFWW9tVjE5a3VDTVVTWk96YU9YRkZXS0hVYUNGUm8rUGdJ?=
 =?utf-8?B?ZGNsS2xjL2xoczFVeDNNTEl4NGwxaXhtWHJubTBuZ0U5VmVWUmVxSitHcGpi?=
 =?utf-8?B?WUtwY1ZnT2NHd0hTclhtckV1Q0FEdm5OMWg5aW9NdHdYVllOWkdZcE80L2ha?=
 =?utf-8?B?SmQvRVdiZ3hXcHJ5K254a2ordWcwT1pSME03WVRuMDJCYmxsWEdmdzlwa3V1?=
 =?utf-8?B?bTl0SHdLT25ZSUdHbHVkaGIxZUZCNitkSFIzMitGMUVCRmpGdjBKbGc2K242?=
 =?utf-8?B?dHpXNEkvWi90SGUrZnYxUEduemJqa2VqbkhyL0JPZEk2aTJYUEUvOFJDeCtK?=
 =?utf-8?B?TFpVMWtqT0oyVTFOTE50ZTBkNXUwRXNKWVhCa0FmTDlzWWt2aGpGK2VEY3JH?=
 =?utf-8?B?MzJGWkVtVkdvZHdpdkFidWhYM2RWdVUxeHdUTTl6clNXdzBSeUFBQVNvTzFW?=
 =?utf-8?B?VW5YZ3l2QWhudzlXZjhMVWtrcFBNSXh5YUdiVE0rSkVxVGhEakhJdFVtNHJa?=
 =?utf-8?B?S1gxVFhicS8rS3JKSWNnUTJ0aUwzZUlBMVIxa09oS0J4ZEF3ZGhTVC9ob0xk?=
 =?utf-8?B?UmdoS3JSUVIvVndrVERxTlMvSnZSZ1FqVFN5TENkMzRZWlR0R0lSMUwvNmIr?=
 =?utf-8?B?aHlUNy9WdGM1WTFORzZhUUgrbWZBb1QxWHN4Tnl2Y3lIQVVPbTZxczRSTk92?=
 =?utf-8?B?ekFvVVB0eEJxV2lJdU9wZW8yTjhuck50M1JYbEY4WTY4R0cyMEw0Qk9lZHFD?=
 =?utf-8?Q?wTSby/WCZkU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0l2amVMaW5WakRTZ0ZSRHlTUWxHVTRudENzaktnZk9pUURaSk5HTy9acUxK?=
 =?utf-8?B?Z3hhQW1HTnZmeGhQS3dXVjR4Y0dicmp3OGpxUTk5Wi85UEdFY1d3VFBBaUF6?=
 =?utf-8?B?bFFWdkVJdWpXZ3RyYWJBNS9aZDBrQWJVNHphM1QwSmZ0WHVPWjE4TmJXbnBY?=
 =?utf-8?B?NzB2ZVhVK3IzK2hvdlhWSzY3VGU2eFNjdGNPUUs5T2FlRmE4d2hqTlQwUmhJ?=
 =?utf-8?B?SjYzZ25yNk1kL1JKend4MTBkSHU4QmhwZjR5Y0dGQllKYnpkZGlCNE1VS3hp?=
 =?utf-8?B?TUxLUmdBUnY3SWJmQ0xGWFhvalJRL0ZTU2x2ZVFrY2lTbEkwK1FpUHVRYzJm?=
 =?utf-8?B?TXpZUmJBNkp5aWZSTXp1aWtGSk5sZkw4a0tHb01rdlk0d2R4NG9xTUMxczJq?=
 =?utf-8?B?MFdoS1BUTUNSUnZGbkp3aGgvTzNMbDVYclhzZzNXYzExNTNISlFqQkQ1S1ZM?=
 =?utf-8?B?V004amxaT2kwUGszd1d6YXFXOGZtNmthNVZJd2I4V0hBMzBIV2gwRVRsV3dq?=
 =?utf-8?B?TjBJSVFrckZNWjBnZWQ3aGdka2ttLzN1RHVrQlhiOGJVa1hNTWxRM2RjQVN3?=
 =?utf-8?B?YjJZdEp6TDlwNWxEMmI1eGxWSkduS0RBejhQNk9oZ3JTbDBYRWVra2xIVTVR?=
 =?utf-8?B?NVloRUx4MHpqK1MvN1dDb3dVYVY3RmliL2dTbC9IeTFrRDhtUGFBdXIza2JZ?=
 =?utf-8?B?QldzVUpwQjlHY3pXYWhWWDVkV3lyL2ZyUm95dEREOFhzT1RiMlFCZ2NsTzBM?=
 =?utf-8?B?YTUwY2NnVG5QWGVaQjJuL3prWHVNSi82TElBSVNoa1V1c2xqRFM4bU1zQU5W?=
 =?utf-8?B?TFM2YURqbXNSR2hvUVhYckI0SVQyU0tzTXA5RHJ3SU9tZTdFdUhWMzFjRWZa?=
 =?utf-8?B?Ym95dTN2NjQrcG45SVdRYUV2UTAwa3ZMUHdiSEk1MzdsSkpYMHYrejdaQVMz?=
 =?utf-8?B?WWI0Wld6S005NlBlRU1NdWF1S2l4b2VEczVPSmpyOW1Ea0tJVGRCQlRCOGZO?=
 =?utf-8?B?aldqTUhvOTRCd2JzNWdKTm8rMEI0OUcxNCt6WVpUUWJmUVNxMlJjdnRXZm9n?=
 =?utf-8?B?cEttb1lNenZjMHNzZ2d2U3dYSERXaDAydUJ5ZERpajREZzcvRkVHYzJWQmdi?=
 =?utf-8?B?Nm0ydW1sK1A2SGtqdUNTaEhQdjlMV3FFMGw4Z1VGMjVrNS9vbUZQc1Y2SjlE?=
 =?utf-8?B?T3VLZjRYaDFkYkNrRGl2NXBNWGpTMWVLLzMxa0dDQmF0R1hzd0FoaFprOFBo?=
 =?utf-8?B?RnFlK1pVM2hNdG9ZcDR3Mit5QTZxbGw5ZGRxVGxpeG1pT1Q5ZU82N3g5d3c5?=
 =?utf-8?B?bXd2NUp6R1QwZ0pWNjBZWXBiblU1UGpTNzJmZU5aU3pKMTJKVVFxRmViV2ty?=
 =?utf-8?B?WnJlYzkyTXBBekNkMGRPK29kR2hzM1Jnd1QwU2taMUUvWTFBaU1LdWZkcXg1?=
 =?utf-8?B?VlpQZnFTdUFTUDVoWE8rZ09OaC9hYXZNVlNicHZOenZMdzQ1NWIwNU9YZ2pR?=
 =?utf-8?B?MzU1NmFzTFlNS25wMzVDdmNmMXRHNWxsVEpqZTRnc0N6NHFHTEs4VVdaWUk3?=
 =?utf-8?B?N043TWxlWnd3MUlCek5XdStqRjVNS1Zlei96Z09nVlV4dzJ5b09pZVRybXJw?=
 =?utf-8?B?R24rVTFKZUtYcDF2NThSa1hZUTF0OHZYUUhYTEI0SE9FbnFOcThWQTRuWjJL?=
 =?utf-8?B?b1lrNGwxS1V4U3Nzd3FoeGIxMTUySHprOHhZZVdMVzE3N2tJN21ZRGIyblk3?=
 =?utf-8?B?M3FHWTVJb21pcjE4NzE0TWNCMllZQ1Y0QzJCUFBNZ21RZmQ3a1Znck1NVVFi?=
 =?utf-8?B?d0p6K1RQOVArWUFmQjZsdUVOZ3FrZkpCUk41Ymo2LzJ5VzNTdVZpeHM4MDRY?=
 =?utf-8?B?a0lQcTMzeitxUDFid005WGRlK292dUF4ZzJQK0tnQ2haZVRFb2dmVEczb0pJ?=
 =?utf-8?B?TURsZVJPeGN0bHg5WWpiZ1FWTE1OUS8wSnpjbk00dDVjSVhMSnhPSnVMSStw?=
 =?utf-8?B?SmFrTzEySy9zQ0FReEpjWTYwKzhuSS9qRm92dnk2S3M1blFaSjA1M04rSHdw?=
 =?utf-8?B?Q3ZRK2h3VTJyZ1kyWU9DZVh6d1Y1MFJ5MnVrVkRiNGJvbEIzQ2oyUGEwZ3pX?=
 =?utf-8?Q?sHB/qtUciKSNeE30e7h48Fx3l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58357c71-5bb1-4893-a5cc-08ddf7b9e26f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 20:19:49.8462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qV8ypzxC+HbL/EuntqczXJENEfHY2JIJsQqet6lnTacWtrGunQaQcI0kdIy/rKssjwAWMz20sCvRTPAffdRvyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6110
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



On 9/3/25 08:11, Borah, Chaitanya Kumar wrote:
>> @@ -2982,6 +2986,9 @@ void igt_display_require(igt_display_t *display, 
>> int drm_fd)
>>       if (drmSetClientCap(drm_fd, 
>> LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>>           display->has_virt_cursor_plane = 1;
>> +    if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 
>> 1) == 0)
>> +        display->has_plane_color_pipeline = 1;
>> +
> 
> If we do this here, we will be taking out the legacy properties out of 
> the equation for all IGTs (say kms_plane.c). So any place currently 
> setting COLOR_ENCODING/COLOR_RANGE becomes dead code. Other than that 
> probably harmless?

if color pipeline is available, we probably want to skip legacy 
properties, but it is probably too risky for other tests right now.

I can move it out of igt_display_require and append it to 
igt_display_require() calls in kms_colorop to something like the 
following diff for the time-being.

Any comments?

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6418e81f5..83de6a0e9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3108,9 +3108,6 @@ void igt_display_require(igt_display_t *display, 
int drm_fd)
         if (drmSetClientCap(drm_fd, 
LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
                 display->has_virt_cursor_plane = 1;

-       if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 
1) == 0)
-               display->has_plane_color_pipeline = 1;
-
         plane_resources = drmModeGetPlaneResources(display->drm_fd);
         igt_assert(plane_resources);

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index d892ae449..29f59bd8f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -633,10 +633,14 @@ igt_main
                 igt_require_f(!ret, "error setting 
DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");

                 igt_display_require(&display, display.drm_fd);
+               if (drmSetClientCap(display.drm_fd, 
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+                       display.has_plane_color_pipeline = 1;

                 kmstest_set_vt_graphics_mode();

                 igt_display_require(&display, display.drm_fd);
+               if (drmSetClientCap(display.drm_fd, 
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+                       display.has_plane_color_pipeline = 1;

                 igt_require(display.is_atomic);

