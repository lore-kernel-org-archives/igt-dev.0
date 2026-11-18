Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5BA606A325
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 21:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fHCxJJ1w
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D9C10E14D;
	Wed, 18 Nov 2026 21:43:17 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011065.outbound.protection.outlook.com [40.107.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6210510E14D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 21:42:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkXhkgjCO4gg/rx7mk4p3TZS0GtN+h+ATf2jtQCZ8QbSqO87ulwiYOJPA9BaH2Wgpg+tEQxeSzG11Q48IQ561pGb3fRAaLLTaa7B3hRSLxxVjr/RVQIq+dQMbTxC7bDRltTvg2Fy9E/BpzXCpEPEITdB03b1tLY4Ilydclynu3oGGv8J4v3pCF+b+FUOXuue5nNB/LHDuH1cYt3W0GvLf5MTqIGfd7dl/FGeABTjyK8uJmXH92LQ8r4OKRwgIWQndYydhL6AoUdxxN3oBPCbsFHHM3vSBiT0NHSDmWlKFkEcE62H+HZKJ+5kN2u9PZOUw2J+sjcsqsV71vWhZCjHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy+/vO2jrc25Z9tCbaGaeEWnTdGBlZFn8WXcIn+opdo=;
 b=RgggixBib7cT0HLm4JXVIRASqmefIYgOEaoMz8XtucFckx0odCcE6kowFQ+D34j3lAsCB4uZZZU2RUvqNgHKCODdh12Pa7GfdFzgFCwxNTdgXMJ3+VjNIoKP1JfniOluEG4uR0JszxILOlzpgGozV+0nJuRaHbYTaFCaBpO04gPAgW4VdOYL9JS+XgJqm1nNUY9+HANi590XWCAuaKGfvehcJzoK1qAeUmWaiJUE1yhXNz+3F3ZCDzlX4v4eU+k7+1ZG64VHldMI5Noi5kU5DUWlJ0niYik9VXXQE2UN+1VPHJwyEpzW4GVengriVDh715UsC5uFf/P7OvB4VJXrGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy+/vO2jrc25Z9tCbaGaeEWnTdGBlZFn8WXcIn+opdo=;
 b=fHCxJJ1wzW1kW0XRcuSoCZdciOPET0soqPRrFor2a/OyvY9HRU8DCEjU5Aw3lc2Q6Bzvk98u06IKJ7PcN8xfGBy14FIyoY6x5aHcSi4q6QgpiVWRcH6EXXyIs++CWo+ZxLl0Dd3eLIBo3KZFvyJwQJKhWHxV+DKQBbi8l33Ed8M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA6PR12MB893085.namprd12.prod.outlook.com
 (2603:10b6:208:601::18) by SA1PR12MB8860.namprd12.prod.outlook.com
 (2603:10b6:806:38b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 21:42:12 +0000
Received: from IA6PR12MB893085.namprd12.prod.outlook.com
 ([fe80::3f4e:1f38:3db2:270a]) by IA6PR12MB893085.namprd12.prod.outlook.com
 ([fe80::3f4e:1f38:3db2:270a%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 21:42:12 +0000
Message-ID: <4c501ca2-5f43-4317-a1e3-951364c80d48@amd.com>
Date: Wed, 18 Nov 2026 16:42:10 -0500
User-Agent: Mozilla Thunderbird
From: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v2 0/3] tests/kms_colorop: reduce test run time
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, Haoming.Qi@amd.com
References: <20261116230048.2020931-1-alex.hung@amd.com>
Content-Language: en-US
In-Reply-To: <20261116230048.2020931-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::15) To IA6PR12MB893085.namprd12.prod.outlook.com
 (2603:10b6:208:601::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA6PR12MB893085:EE_|SA1PR12MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fa5284-1cbe-47b4-0260-08df45bcce03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261022105027099003|261021135927099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: M2j1675WudHoonCFF9ei1UWTjOX06y2tXiN9YcuiZNHYpKezDjuFDuCbDKkJQ1dM0s+/HMyRzJtrQd4WhUYdLnVsDXANX6yVl3gvke5r9GzdVPDfcYOrj1z8q7EiF8+89j2g77b2raYu/n39kPJ0KVMMy4Dymw0oMeXnjDjnT7X1V10O6T9S1a/Mnz+28N84l4890MtL9aIFWWxdcu/jYghjLMuierdDzNShoHBV2VKQA0QOIENSC79Y9S3wUDOnjPbQQA6zSSwu4dalB9rTc9L8swY0/Qt2emJcD4h+09RxRqBS/4WnpbFcZkrlLZ71FjaUikDCtaPeKVwIvI76YCP9w/wQ6XpAo0wrC5Ccz2jlOQJH6gPJBRhNq4DaskXiNSOonThMLr0l3FkxfstAnH1xl9ViitTVIH6OENcKTrNEtsmhFpqT03pDX3KubCwPYmw3cirBfYkt0nbhwj4SIfBmKUq2n/jGcehhbmGdMSn/PVGpx50GjnaES25cPlO8rWIJkNrwspURr2lO/vc+wfroQndCYtIpEeouxE2bMGamyZpx0Y3rUcAyoGcqytHiQXR9zZIcZXO5Pt0hWSY2Ss4XSteVU7ReC+6QEqAgeeQ0u2PSUr1T5OasQdeZmhhm2LFXk2EX816d9UCpOM1yYZXonuR4zBx2aseoyLI7r/o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA6PR12MB893085.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021135927099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2k5V25yemV1WCtrUVFPMThvaFZtZm5HTUcrUDVKNi8zalRNc3psYUhydWQx?=
 =?utf-8?B?NlliQUZBWU9HYVlGNVVCbzJ1dlp1cGZLd2pqYitxNE5BVHh5dnB6Y1hiRERG?=
 =?utf-8?B?M3U1bFh4UmlIVzJrbWFQTDIxaFpyYWhHZkROTFdlbDRLbm5RNy9vK0FUSGpr?=
 =?utf-8?B?TjMyZUY4cld6VktQVk5FZldndThzUmJUT2NwNWJ3a0JuMWVEcHI0M1JqMlcz?=
 =?utf-8?B?dlI2TlNJRlRWTjhtcFRGaHpneWhlay9SS0VtWjJndHBMV09Xc3VyMUUzaVM0?=
 =?utf-8?B?cnAraWdGZm5iREk2S0RLVHVYMXl5WVBlSzYzVmoyd2txUnpQNjBHSXA2cndy?=
 =?utf-8?B?NnRXZzBRZkdPOU1nMUs2UE43bE9lK2FkbUhzZ3dybEhyQjc1N1UwMXZpWEhK?=
 =?utf-8?B?Z3dPejRlNTk3RHhyYjlNTVRIMDB5bHFvZ1ZUZTlUZm5UNDU1L0k5cU1JajBI?=
 =?utf-8?B?NTZ2RmEvUU5yTGR5S01BNWRsYWZUQnZvNjRkZzIvUnBZV3l3T041K2REZ2dS?=
 =?utf-8?B?ZklTOUF6Tm54Qnl4b2FHN3JmRjU1Q3VCY2hOS0NWQllMQVhpclJBTHhDZE5i?=
 =?utf-8?B?MDIzOHB5MWRFTitlMCtnblZEbFN2SUR2UnRaS1V2SkxobFVwZkRWaFRUbkVB?=
 =?utf-8?B?RjVHVTlZVllKVVhIQy9pWktOSE1kTng5SEZOSTVQZzdZaWw3RkNqdEo5d3lj?=
 =?utf-8?B?bWIrcW1uZWx3ZXpnUFhDMEJzd3p2blNva2tuWVRUd0xwSk1JbkhjT1hhMEps?=
 =?utf-8?B?WUF3TFVRUklDY0xHaVVpRFUrVzIvb2tzZEtMUkUzaGFmSnQ1eU14QTIxTnZB?=
 =?utf-8?B?bzhYNDlpK3A4MGNSY1o0RnBRcG5obGJGMmprTUZUbERhV0k0SGlKRnJhdGxX?=
 =?utf-8?B?NzZLZW1UVDZTVWx4RHhISTZMbEF4OHpMUVhtbzlJVzdURGxFZGVxaHh1cWhy?=
 =?utf-8?B?MXNaZDloQjBPNlhoQ0YwSTRoQkh3UFIrYnNCcUl6RG9PTWdaVG1YcHBEZ25z?=
 =?utf-8?B?TFVNQUx3SWQzb3I5MHU4c0pJcEw2YkZzaW5WWG5zMThkSlNncHF5QXFuQ2Jw?=
 =?utf-8?B?Y1FZMVJacXlIQVh2RTdBdG5lQytHVTVJUHdyYlVVUnd1Nm9UVDMzYjI4UEtr?=
 =?utf-8?B?VWpkZ0tUWXc4bXNWNkxhWUFDYVo5eThZYUQyVDZBaU5nNWMwN1R6MHorcHdz?=
 =?utf-8?B?VDdQOENuMVM4SE1WNEZFRGMwUExaSW5YNjhDdU1JWkNWR0xJeHZlSWVBN0xH?=
 =?utf-8?B?TkVuMTF1QnZkT1BBZ215Sno3Zk45L0F4bEVtLy9BTHdLeTJHbHkvdDFjQXpN?=
 =?utf-8?B?djVzWmpIUTltTit4YzZEMUNKU2Mzck1zSGJCdERyOCs2blpGcUJzN0ZYalB6?=
 =?utf-8?B?ckhScmNld1lxbllrTzBDK3dSU0dBdFdoVSt2YTgrUE40QkJFSDFiaVJzQWly?=
 =?utf-8?B?VFBtZVNxQjJVcmlWMC9wNWRXNWxHVDJGWGJnbUhLbm9KblhTNWd3OHE3QjlP?=
 =?utf-8?B?RE9CUXJPa3FKR2s4aE5BWGROekl5UnpZVDFDNEZNTUpXakxKOWxOa0tuQUdJ?=
 =?utf-8?B?RkU0YTVtUmRiRlNCWTJ3WkI4VGpqeEhjZERjTll6bmlDTlRVcXJYRDV4ZDha?=
 =?utf-8?B?L2U2ZVJCd1JPTENCa0tXSVFtTXFScXVuZmJRaHZ2cGtXams3ZERYeWtMSG16?=
 =?utf-8?B?SC9xR05YWGIrRnlrUVJENjEvbVdqdjlpcGVYVVRqR2gxS0pXNTZzMTRTN080?=
 =?utf-8?B?NENjd3NVRmJGUkxRT0QvMEpDRmV4Q1lHTWlyTnIyT3FzWHNPbElxOXNoaWdH?=
 =?utf-8?B?emlNZWRPOW1zZzFCT3B2MkpsSGRiMTVxeXBlN2J3WnUybUU5eDNUdlltTUl3?=
 =?utf-8?B?SFFKcVJ6V1NXT3FGUFVlTWFPeXRwOTlFb2hiMFI0eUN3OXRJNmhyclIzcEdo?=
 =?utf-8?B?cGlkY29CRTF1Q1BSSm1KZkJSWVN3WTJONDNOaDFBcFdCdVJuc2NXdUVtZHda?=
 =?utf-8?B?TE42bHFVQkxnV3Fid0UvY0NmWjNCWU9VRWhReTd3ZDJ4OGRncFZLaDRzRHNW?=
 =?utf-8?B?bWpHZlNISUZycTVTL3ZpZ0Voa3ZNenFXcGFmcUplcGk4UnE1TGpBSytPN3JN?=
 =?utf-8?B?eEJOUU1TUmpwQ2E5RFZJMkRadGpOck0vUmhlMjdlMmhuVzJDQkQ0eHdHeUds?=
 =?utf-8?B?MTVicmE3WTNPV0RrbENTSmJtclNEM0J4eFFHTUJPczZqNUhCblF3U1JrNGVC?=
 =?utf-8?B?anQ3V1ZCTEVhSmNwREk4My84NTlBaVJMMVExcXhWU1RvallxTUYyZ05rcUtS?=
 =?utf-8?B?b3dyZnJRN1EvdFAvUTd6V3ljcGVTSnluc3RmTTdQaVhNQzBUMFRZZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fa5284-1cbe-47b4-0260-08df45bcce03
X-MS-Exchange-CrossTenant-AuthSource: IA6PR12MB893085.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 21:42:12.3175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPEAxz71vLXYNPDETGENtBEP070jEsluGujCh6yn17u5fU8aYEGmXY0DdmSwgyCEAi/M0P+9WiRpe/CDtdMWrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8860
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

On 11/16/26 18:00, Alex Hung wrote:
> kms_colorop spends most of its run time on setup and framebuffer
> accesses rather than on the color pipeline checks themselves. This is
> worst on hardware where CPU access to VRAM is slow, like DCN 3.0.
>
> This series:
> - skips subtests before touching any framebuffer when no color
>   pipeline matches the requested colorops,
> - sets up each subtest group on demand, so a process only pays for the
>   groups whose subtests actually run,
> - checks the writeback format list before creating probe framebuffers,
>   and creates them once per connector instead of once per CRTC.
>
> Run time of kms_colorop, before -> after:
>
>   DCN 3.5: 0m11.116s -> 0m7.401s
>   DCN 3.0: 3m32.316s -> 0m16.382s
>

Nice improvement.

Series is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Changes in v2:
> - 2/3: Keep each colorop_group in static storage, as igt_subtest_f()
>   returns through siglongjmp (Harry)
> - 3/3: Create the probe fbs only after a primary plane supports the
>   input format, so unsupported formats skip instead of failing, and
>   clear the CRTC and writeback state after each probe (Harry)
>
> Alex Hung (3):
>   tests/kms_colorop: skip early when no pipeline fits
>   tests/kms_colorop: set up subtest groups on demand
>   tests/kms_colorop: check writeback formats first
>
>  tests/kms_colorop.c | 349 ++++++++++++++++++++++----------------------
>  1 file changed, 171 insertions(+), 178 deletions(-)

