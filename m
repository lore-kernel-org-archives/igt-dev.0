Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE68EC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 02:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769AA10E238;
	Thu, 15 Aug 2024 02:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lqvSOtYw";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7182410E238
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 02:12:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwQ+Lxe1jHag9r4nJFTmmYcGz9bTuh3YKCaIl9NyUAaFJUHxZ6NTeVauRu97BtO9rAd5NjZoz4BaZ1JjJobcW5qOqHyO1xrjDzB2Pao96pbTduqKO7FCL2a4o4CMAiu3Ohty0FKR9jO3aqvtB94dMEBdTXd8WT651UC4eRZ1pxizTYCEmroBGH3T4FCOGmIS287zTPaoLxqhyowqhWuqk1hQatRnfW3qwrC3uTfMUppfCUOk5yKtbOo9K2JQQRaKtWyq5j7QMOpNmUJcHpjwCU2mTTYMnvslFZxDSWWR5cA0PwdOsbo6qqeMPqXfhFnjEeLZXr4aXkzJbfEGa7560g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIvKD4mFt8x152sp/feq3YcnwXMxeJf+vF7Dj6s9Saw=;
 b=yUvAA96+b3Nut8e8DE2ucFrbwv1+kyKkjmZYsAKfAi7Z8hiF8awvOxmKH9gg4BAOmJFNxfJFw/qv8+Ok7tm/FBslTdsTowscJy7YE7N97FSSXGVi2JYHJeolJDVIShJ1D/R5QRKI5XPDGqQyH6/hyJtJvGWkfQN9G25QdOuNhdprhlYr+glpSMI/Aie2P1ifa6qercXjcv9+Mwct9YXiTxusVf8wJ3PTQyylauS1mT67U8eg4n/RqJzYoUktruCGK/uEqMOPdLIjm86ZN/2a1yYuPym5o/Nh1Eozi7Quq2Ewr6p0jSeyzoRt7sQBFm0NbCh2DMb9LNItr7g5WNWAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIvKD4mFt8x152sp/feq3YcnwXMxeJf+vF7Dj6s9Saw=;
 b=lqvSOtYwWnMyQq/Xz3UrGethYnPMMRZpuojbljv7VKzJ2H24yaueqsJrXsCTEoh1rY2DHBR6SnXJ5Tf8ipaSobZtLKN5w0noCKFVeUf+1dNRe4FptSwNbhb3Hu/jwCPxlUuH3PBFkEdA2My1lhBPPFvJ0yZ7Gd7cacxnE4YViOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 02:12:49 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 02:12:48 +0000
Message-ID: <77e2d206-4306-4f89-a418-62a7d4ea84f5@amd.com>
Date: Wed, 14 Aug 2024 22:12:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: fix secure bounce test failure on APUs
To: Tim Huang <tim.huang@amd.com>, igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, alexander.deucher@amd.com, jie1zhan@amd.com
References: <20240815020147.155078-1-tim.huang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240815020147.155078-1-tim.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::11) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|IA1PR12MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f5f0e6-579d-43fa-c841-08dcbccfc26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eExyQ1EyS2dkRXlKTnFLdXFlcVp1TXhsQ2JGdXpubWhkd2JrSE01MWFiNEZk?=
 =?utf-8?B?TGp6Yys4OTdNOGNsK05QcWNZK0piNTVXSWVKZlZHdlZTYlg5STFSL2tsbmMr?=
 =?utf-8?B?NGVJZTRoMXRwZTdLZ1hPRFlrR1oyazZ0OVRXSWxPTjUwdEZ4L04yWmFqVG5U?=
 =?utf-8?B?aUlNbFZPYzFoYXQvbWhBK2hMQ0NPb0srMWRUOHljV2dpblpqK3hPelNudkdZ?=
 =?utf-8?B?Y2RVSE1yVy9UNGl5YnN2WGJhTlRyazNzZFZveGJkd1VycmVqcTQ2eXlXYks5?=
 =?utf-8?B?d1V5a01JQ0pIOThUSDlkTDZhQmpod0pEeWF6ZTFDU3loUWV6a2l3UERTSjYr?=
 =?utf-8?B?UnNWcUtEdEp4NEdhRVJWYnQ0eEZOdjcyRTVDSERnTTJiTU81bVkwYmdnTVpH?=
 =?utf-8?B?ZUQ4RWtQbHBFczJydDkrbU1OSE55S1BlZ1R5NmNXTnRaTXJKaUJKKzM3OE9J?=
 =?utf-8?B?THF1S00wSzlDLzNuOTY3WDJyRHh3ekNUNyt5Smk5NUlJOWJsbEVYV3VJalJQ?=
 =?utf-8?B?VVE1SDJWMU54eDFMdXlKRWxWV3hoeUxWV0tKQndJVE9Bb3R5eVlrUGROQ3Vr?=
 =?utf-8?B?ZDRjbUhEOFJyUmE1bXgwYm43Q2ZnOTFVMWY3YW1MRGkwdjVOU2tqMDFrK2Zn?=
 =?utf-8?B?L1NudE11czRCY0F3SkM3S0s1dTI2dktQTkJTalZ3ZW5jbExHWmV4S2xzWS9B?=
 =?utf-8?B?SExpVUZ1Z2FaY2FVUzVUUFRlQ2xwWTBLdWhZd1ByY05TZHk3bklndkNaRnhQ?=
 =?utf-8?B?d1c2WEcxRkdSc1djdWFoS1NYbDdLZXovVEc4Y0VtaWlZaTdNcnI4U3lSNlQ2?=
 =?utf-8?B?MkZ6VFhFZC9VcmhudThpdDJZZ1NXZVhxemlYQWhVQnJVMWdCMHlidG95UVVF?=
 =?utf-8?B?MDd3SnZBMkozNW80enFGLzZYcDZKR2g5V0svaTdEd05BbG5LcTZZeFhhZVU4?=
 =?utf-8?B?NVV1eVVFbXRtU0JGUVBCM3hCSHF6TUVtSTBsR3QzeUVZdkpSZWtESHFBWnZv?=
 =?utf-8?B?dWIyQVdMMGd4SE1hRjVLK2Nsbk5lYjRQTFRybUFxbFM3NnFOVEs3aWRGQ1JR?=
 =?utf-8?B?cWV0ZVNPWmpvZnhBcjgzQXREcHQ4MllsaTUvOG03ZmN1c2hua2R2R1dvbEwr?=
 =?utf-8?B?aVBxZGJGU0hxcWk4b0VjZnpMQVUvNDAwRHZFZVFMOGUydm9VY0ZwNyt4UUlN?=
 =?utf-8?B?UTczVTBVaHBTcGRPMUlsR2pvVkM2eGQvMm40ZGV3d0RKWnU5bm5HaW9CeHdO?=
 =?utf-8?B?R3kvTEErVnJLYlh6eGR0aXRZeFJ2elJVdUx1ZmwrYzk1c284eGEwMVJTd1Na?=
 =?utf-8?B?Wm05Z1VYdmF1SU5qTHo3QjVjcHhaSm9zNjdUUkJTVnhUZW5oMzIwYkhnV2VJ?=
 =?utf-8?B?ZWpXMWZWQU5IV2R4Z1VLRGNuN0QrUWM4cjhqU09VWjNEYm0vZzJFWlFlT3hm?=
 =?utf-8?B?THVCMTVSN1R4K3FEVU1LemZPZ0FHZXFEZ0w1b2hnNUZhMGRjUHhJMDlSbzFk?=
 =?utf-8?B?andZcUM4NlRsaEdKOEJmcDNROThNRUxlSGFSOHc0RXNaQzRQSDZTVTBPUnRU?=
 =?utf-8?B?YlNaRVdETlNFdUhYanR0NFZCT1JxSU1XK3F2OEN6RGppWnI3dHJSQVd2U0Nt?=
 =?utf-8?B?RERFTnVBcW14eUNBeXJJYkh4dkRROHd3bThCNU9ENHJmZ2ZuUHlkeXJnb1VV?=
 =?utf-8?B?Q2wxbndOcXF2RTZDN3NWQklHeERndzA1Skl3dU8xQTlKNFdlUUZRTHdsdTRv?=
 =?utf-8?B?VFdJYnc3N3p3WUpMUE5wekNwSnJjUkdMNE5pNWNOc1FMbUFhbWk0cXpFZ281?=
 =?utf-8?B?SjFrQ04wNEorWG9lekVxZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3hIYkNjbHFOVEhIOHZyR1Y1T3JnK3hKbGpxTHlyMkNJY1hid0xMS25pQk0z?=
 =?utf-8?B?cjdubzRJaEFPMDJoaExSSWRjTGFLTzBXSEl3V1RKVmIyYzBJMVU5U0gyUkRY?=
 =?utf-8?B?c05EdW5TZzB1MklGOGwxZUFGKyttQWdHU0RzZnp1VkEyZExXSGp3eUxXYzZU?=
 =?utf-8?B?MGJ0SG84K2JaenFDRnp2L1c3MUpWL1c0akZtT1krZWdHdHB2TG9KV3lwOWFN?=
 =?utf-8?B?QzRVUEZRYzN2NU5FNlRZWXkyUExuM1dEMjI5eTRZQmtuOW5CakpxdzJveC9U?=
 =?utf-8?B?em80RFdjcUhkaFQwRkdMUXJ4Tk5LV0hCN3FkcFpyM0NjQTNGWWE5N3NFZXFE?=
 =?utf-8?B?OGtUSFRUZTlUK1p1WCtpbGhQZUZJcmhYVG9GODVvNVJhVGlsRXVFRVMrdkZH?=
 =?utf-8?B?ZG4raHJpK0VId2VLNlNMYmVKL1pQSlNvMHdETm9iTnMvUlB0d1RtNG9OZzZK?=
 =?utf-8?B?VUJwQ2pWZVdRaTIxWnJ6OWRFY3RlRm5ISm1aL1I0MGRyd2JWRnduRjZ6S05M?=
 =?utf-8?B?UzNkSzIyeFBNRXRpbHBxVExra2tTS2tCVzl0UmNLdnV2dFBWc3c3Tkh1a3hX?=
 =?utf-8?B?RzA4WEYrT3FkOGFnYzg4ck5oRFVFQWRzc3RFb0k2dUU2M0RBT0x6TmRacXF6?=
 =?utf-8?B?aTRxNTUvOWRBRnNDT2NwUHBiNy82cUFEekovM2lCL3Q1RzdlQVpzSENQRy96?=
 =?utf-8?B?U1RZWWZ2OEFxWFcyU2puRHUrclZxOGxQeE00QmtFbCsxZUhIUGZEMzVaZW1D?=
 =?utf-8?B?STF4SVVwY05WeEhrSmNNRFMrLy9XTnMzUC93dVdKbzdRSmhjUVRwNDZlYzh0?=
 =?utf-8?B?ajlBeFBaK2VDZE8za3BDOVFqd0tESWFEQk9YblAvSEt5b1RvLzM4aUZxVXNW?=
 =?utf-8?B?MGhQc0M2WGhUSm1xZUhPVVZrTjdLQ2M5VWh1Q2lSeVJoNTQ3Q0FaTWg0ZlRP?=
 =?utf-8?B?SnYwbGtkWjk5Z2ZqbkNPM1lFK3NIQ1BPOXg5STJxYmYzN2E4Um5jcUZWaklo?=
 =?utf-8?B?TktOcFZoUVU5RFRRa25mSFROWjJzeitnM3JuU0U3TDJIT1N3V0hQRXYreW54?=
 =?utf-8?B?VklkaEJrUWtHUWQzeFZiN3hjVE40UUNzTWViNE1PQjJUOVpBTzNHSThFWEtv?=
 =?utf-8?B?NXpHMVp0OWJPQ3ZHendVeHFEVkxTdVJYN3gyQW8wdXo5ZytxRjluNkpYcncw?=
 =?utf-8?B?K0dsbUpMMFpjeFgvUysrRkdPRjQrYmFwdDdwbjJIeTVXSGZFTE1MdUZ5YkJH?=
 =?utf-8?B?ZU9sbjhwSmVBVkUya05xMmhsbHpRc0poOUZmTmszQzJqUjYwUjJWaXVBazRa?=
 =?utf-8?B?T3Z3RE9BSVN0UUY3OWxWL2pPMld6UWFpNGJaZDdlTDhwOGtEanFZdVVSbDVJ?=
 =?utf-8?B?b3dOWWFIMVBJU3hLVGhPZ2pWRmY2RkxMaUZjZzkzWHZxVGNaR0tsNHAwUDVo?=
 =?utf-8?B?WGx0TjE0ZW95a0N2dUxKM0tTaldudXBYSVp5cVFjOVl3SFFRTVJBK3hYVmxT?=
 =?utf-8?B?M1JTN1FkTVZHckpPZzdOZ0txRXVBWDFZa215RGtGSjEyekhxaW1RMHF5Qzds?=
 =?utf-8?B?cVBiMzZPUGV4Z0FsWUtiNXEzOFhJNkN0NlA5dFFmREx4VlQzdUkwRGxkY215?=
 =?utf-8?B?UVlJNk5TZHptZ0JyYjdPVGxadG5KeGJvVXpreTBBMlhiT3VqV2tva2hwMjhw?=
 =?utf-8?B?aWZlZzBkc1N2b0lzOTIrU3BEMnMySzNUbEVxUG4vRkJHM2hkUXFmVEpXY1Zk?=
 =?utf-8?B?SVRuSU4zaWJDQmN3QVBBVXhoMTRVQ211MjQyNjFXRmFlMWl2UUNsMGhvSUNS?=
 =?utf-8?B?aDRwZ25WT21lSDhLMW5QV1YvZjRNVjFjWkVOeUo5cTMyVENheDBKaUJQaTdW?=
 =?utf-8?B?YzQ1UVdOdWNmYnRCdmx5OGJieXplSlozeVZ0aFZDRHk2QjU4S2dZR1pjZjhh?=
 =?utf-8?B?b2dvUVVCdHF4NlJsdlBGZzVKOFZpV1h6K1dNd0t4dEhnUytKN0V6M1ZpMWF0?=
 =?utf-8?B?NzVNSDB5UmRmN2Z0dXVqaUtyOXZ5NERkdXRqSVhVb0thWHJqS2ErZjVmRTRF?=
 =?utf-8?B?NDhWUHIxZEZ3eWh5VU4vZDNDRUlqQVRSYnk4VnBDUmxJZ1poMThEMUc4VGtU?=
 =?utf-8?Q?3oTmXKJ8TOXu92ME9nEGGoXCX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f5f0e6-579d-43fa-c841-08dcbccfc26f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 02:12:48.8191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4noQvNqJ39f7IfxJHkukqxxn13ZbmCPWl+H2tgHh12zYOqxIxrtDLZ2AyBEAXz+NGPf0lxJ2g4Q2JJiCz3s9dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6089
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

The changed looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-08-14 22:01, Tim Huang wrote:
> Some APUs have address tweak secure mechanisms that encrypt
> destination data preventing it from matching the original data.
>
> Rework the test case to ensure compatibility with these APUs.
>
> Signed-off-by: Tim Huang <tim.huang@amd.com>
> ---
>  tests/amdgpu/amd_security.c | 28 ++++++----------------------
>  1 file changed, 6 insertions(+), 22 deletions(-)
>
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index ec6883d3d..024cadc05 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -147,8 +147,6 @@ amdgpu_bo_move(amdgpu_device_handle device, int fd,
>   */
>  static const uint8_t secure_pattern[] = { 0x5A, 0xFE, 0x05, 0xEC };
>  
> -static const uint8_t secure_pattern2[] = { 0xDE, 0xAD, 0xBE, 0xEF };
> -
>  static void
>  amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
>  		struct drm_amdgpu_info_hw_ip  *sdma_info,
> @@ -209,27 +207,13 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
>  	amdgpu_bo_lcopy(device_handle, ring_context, ip_block, SECURE_BUFFER_SIZE,
>  			secure == true ? 1 : 0);
>  
> -	/* Verify the contents of Bob. */
> -	for (pp = (__typeof__(pp))ring_context->bo2_cpu;
> -	     pp < (__typeof__(pp)) ring_context->bo2_cpu + SECURE_BUFFER_SIZE;
> -	     pp += sizeof(secure_pattern)) {
> -		r = memcmp(pp, secure_pattern, sizeof(secure_pattern));
> -		if (r) {
> -			// test failure
> -			igt_assert(false);
> -			break;
> -		}
> -	}
> -	/* Fill Bob with a pattern2 */
> -	for (pp = (__typeof__(pp))ring_context->bo2_cpu;
> -		pp < (__typeof__(pp)) ring_context->bo2_cpu + SECURE_BUFFER_SIZE;
> -		pp += sizeof(secure_pattern2))
> -		memcpy(pp, secure_pattern2, sizeof(secure_pattern2));
> -
>  	/* Move Bob to the GTT domain. */
>  	amdgpu_bo_move(device_handle, fd, ring_context, ip_block,
>  			AMDGPU_GEM_DOMAIN_GTT, 0);
>  
> +	/* Clean Alice first before do the copy from bob. */
> +	memset((void *)ring_context->bo_cpu, 0, SECURE_BUFFER_SIZE);
> +
>  	/* sDMA TMZ copy from Bob to Alice.
>  	 * bo is a source ,bo2 is destination
>  	 */
> @@ -250,11 +234,11 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
>  	amdgpu_bo_lcopy(device_handle, ring_context, ip_block, SECURE_BUFFER_SIZE,
>  			secure == true ? 1 : 0);
>  
> -	/* Verify the content of Alice if it matches to pattern2*/
> +	/* Verify the content of Alice if it matches to pattern */
>  	for (pp = (__typeof__(pp))ring_context->bo_cpu;
>  	     pp < (__typeof__(pp)) ring_context->bo_cpu + SECURE_BUFFER_SIZE;
> -	     pp += sizeof(secure_pattern2)) {
> -		r = memcmp(pp, secure_pattern2, sizeof(secure_pattern2));
> +	     pp += sizeof(secure_pattern)) {
> +		r = memcmp(pp, secure_pattern, sizeof(secure_pattern));
>  		if (r) {
>  			// test failure
>  			igt_assert(false);
