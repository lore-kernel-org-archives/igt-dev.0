Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE07BC3ABC5
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 02:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6135910E037;
	Fri,  9 May 2025 02:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KEk/05zv";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2067.outbound.protection.outlook.com [40.107.212.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E58310E037
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 02:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfQHtoyPxaljP2tClqmUBS6c4MobUhAFykBcR+PUcD8hfMMTeubFo6SJltLpSL7WAePpqqj8jm+jsav7xt2JAtB2fouZdr+zneDW/nm7rqQoCN7KvHSuhCZxNw8P/FYlc3QyCJIfad7Tx4gwLcTrKWf5/j5NSSfZ+RHTkVwh7XQ5quHzbb9vaiI2c9QuoAp2kXf4tkmwp7yuOI8e4bep2b7m6FxA3bzO79T6DzNcVK7TU6QgNSKA3/Gqe+KKRpp8zP2AhJL6gVDvY8NOLJQ+e8NuF9lk5W6LOj4SloIR3c5qk2qA+Et85hdBQzI7esEZHrxakKb+iQiSE2MOWJMJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z38drhX1zBe2FKfOSMavd8Xe1D6X+rqVx0AVhfpHbLE=;
 b=IZkgTOOpudM5JC+fQ+TkCR164Cpbz+9WcItnqiPVR1IcsH85aW+Cy+8NASAH2BVULJERN7zQcHZDE0XF7PBheFBwf7JWEXhwhswzJhSj+IE98Xaj9Ouy3QzFm1BClwlkV/9fs+40FmgE1dnGf4MsaIH17nviB9dvnGwA7XKD+MEGQDGTnUXbnGdVS3ooUgkVhigop1Tz4hKSe4myyqN4x7E0y3cI3rj0Saepdi+uQkkuZzXS2wWZXR8JbMa5Sb5HAQYLlOyk6S4GMMx1A2jJESJNvgSyjwKl0DAoTz3zNSw6eekM7Kll2QBspM9y5mAILbThgDiXL0sqkHKsNW/dJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z38drhX1zBe2FKfOSMavd8Xe1D6X+rqVx0AVhfpHbLE=;
 b=KEk/05zvehwdCUpAZShkLwY/1o8vSNjauPzeLM4Nxje5L6cWc0a6CajIJPr2PdR1xu0pw6f6SSguiVVSCQwuTPxiGrGHZNsTNMIopG4j4pGxW22ZUzhP/D9XQ5BvBrtrTUR2grChfLC4HU33lRIkTrU8AVBpco5vy+xfhEdQY18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CH2PR12MB4037.namprd12.prod.outlook.com (2603:10b6:610:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 02:42:07 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 02:42:07 +0000
Message-ID: <fb19f0e5-79c6-49e5-9c78-cc60352d24ce@amd.com>
Date: Thu, 8 May 2025 22:42:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/amdgpu: add timeout support for user queue
 submissions
From: vitaly prosyak <vprosyak@amd.com>
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
References: <20250508060900.2821847-1-Jesse.Zhang@amd.com>
 <e4d66e68-e317-43e1-ae60-64fb5c1cfdb4@amd.com>
Content-Language: en-US
In-Reply-To: <e4d66e68-e317-43e1-ae60-64fb5c1cfdb4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0164.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::7) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CH2PR12MB4037:EE_
X-MS-Office365-Filtering-Correlation-Id: 10759901-c724-4dd2-6dd4-08dd8ea31710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXdZQjNiQjdPK0FjMzFzMlhHZmIvN0EwTFVML0Rhd2trcyt2YVRjeGRUTnIy?=
 =?utf-8?B?eXFHc29nbGZFUjB1OGRyZHdGUXhJbmFKZXZFR3dHKzM0MVltYUMwU0t1RFUy?=
 =?utf-8?B?bzlEY2FVMUx6MHhVWlA0azBFQlJNNHhZNERpcXlMNXlvL0JvK2F5VE9HV01i?=
 =?utf-8?B?SmtTQ3llaGpXaXFnZmF1STh1anJXbTJ3MG1MbkNPeG5lM21IdWRLMmNCb2s1?=
 =?utf-8?B?ZFhxTWRpNVBDWkFTeWMvaEY5aG1nbWd6aW1GSEdydHVDaXBRNDJLbUNGUFNo?=
 =?utf-8?B?bm9NRDVHdzBJUUFlRHhtak10dzZRQ3dsMGw1MWRiR0pZZUUwcVdnVEVPTFBu?=
 =?utf-8?B?WWRjR05jdWZoaTNlUUxnNytEeDh0ckhPZGgrWkxKa1BSeWFYYmU4ZnRLOUpt?=
 =?utf-8?B?K0laNVFKNU45RkU3OEg2RGkwanN0U3ZQY0dGeXRRWVFhbk5zY3RiVDg5V3JL?=
 =?utf-8?B?Z3ROOEVnRmJjUG1hVWlIOEJOYWlFdDFoVjZ5THhLY3BjZGNqQVhzeGZDTjRZ?=
 =?utf-8?B?R1lsR3NxeWhSRnV4N0d1NkNQVHphUDJoYVYwbUViejU5QS9qSHZ5WDR4SnhI?=
 =?utf-8?B?enAvNmtZMEJtTlU4anlkdm90Qzg0UXBwcVE3bmdtNmxyRmF4NFBwL1p5WkIy?=
 =?utf-8?B?SERHTnlTK2VVa0FmQ2F1bzRHWXNJRDVSb2QwVTA5VWthS2djdjhWbCtmL3My?=
 =?utf-8?B?MC9WeVhLczNBVlQwbmxmSU0vaHRwdG5IY2FZNm1XWlJJdEpHUHFKN09LU2cx?=
 =?utf-8?B?aFNIOExEZjZNbUJYOCtwdlVIUHhQaVhKaTIzOVllYmJwQ2U0ZEhYSjB5ZzFy?=
 =?utf-8?B?L3Z5RTQwbFFkY0lUQklLUXFxZC9nMmxqWi80bHpLVlBLMkc0ZTZ1UExMVmxU?=
 =?utf-8?B?amlMYzFOV3dyb0N3N3UwaEFScWM3OUFWRlZFQ0pON2hGMm1BcEY0RmtrT04y?=
 =?utf-8?B?Qys2Qkp4Mm1tN2hWdll0WmdCTk40V0pOZTUvTW5qOFF0Y05OallZZExlTWlB?=
 =?utf-8?B?SHdQQktDektDTWFLRDM3b1BzK1hqUTBkQWFFeGsrbmJnaTNmWUhaMGNGZXBU?=
 =?utf-8?B?YVBrdmY1K1lnUU80TGZoZ0FhOXNTYzRYLys4UFA1dnhIcm1aQjJ3OW9lNEpQ?=
 =?utf-8?B?bXhray9zYk5lSkpPSHgwVUUveUQ1d3g3SUhhRlV0RitCNkZHNi9qTWdMLzRC?=
 =?utf-8?B?UlREUDdaWVY0aGlLSnZyMGdoMkRDTEZxSXA4dUJIRittSEZIVk1BcE4xNlBy?=
 =?utf-8?B?clh4c1RGNnB3eWlUK2F3ajBMWG9ZR29PK2NUb1ZXNkFVQVY1YzlNNGJ1VFNB?=
 =?utf-8?B?aTZmSjJmNTZ0Rnk0U3YycnI4M2lMVnJXZUpBb25ENS9IdlVMUXBaKzU1OG1H?=
 =?utf-8?B?RXRyMFNVNTcvZjhFdmdINkJoUE5rV3dUdktyN0lrUTFBRGZsZnRhUGk4YkJQ?=
 =?utf-8?B?OW4vai9SeWxaUWt5Mm9xTVYyREQ2b1VOVjAxTmtVWjJoYjQ4dFBhTWVCUENH?=
 =?utf-8?B?WEl3ZjdZY21tSHducEkrOUpJYTVwS1dnRHFvYmZzTUhWbVJITi9tWmVDa0Nm?=
 =?utf-8?B?NXgvb0UzN1JleFBuUHBidis0QXpqN0FWNTJHeXJVR3N2bHRPaXhuMHN3elpZ?=
 =?utf-8?B?Zmh5eE04bDRJNmJaLzdIMzUzWlU2QTR3T1Y1c2tGdUNlQkEzbEc2dFlkSThh?=
 =?utf-8?B?Y05GWkRieGYwV0F3SlVvZkhtaGJwNFNaVElrSkY1dzhzeEtGUmlvcXRPWVF5?=
 =?utf-8?B?bFZSR3poOUpoTVRHQlIwaG1odnJTdFBQNndnbXNFdXRmWjNKVERTMlhjN0VO?=
 =?utf-8?B?RERGOFVrbDFNcVlSbHRIN2lQM1JzOFI3V3F3dVFDM083U2R4YWdqSmZ5bHJk?=
 =?utf-8?B?MGhWaXU3Y2xsRWZjSk5IektHMnlNMFIydkxVTzF6dTRpL1ZtYXBkYXlGNmV0?=
 =?utf-8?Q?1rHrq/mfXqE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkRGYU9yNnB0MW45L3N4d2MzeFFMV2dTS0wxeG5pVGpmOEk2UzZZR0tUK1hH?=
 =?utf-8?B?LzNUaXMrUzdiZXlLTkRVZlFnL1lFRE5EdkxKcnBNTW1JUEVFVnZBNUNoM3gw?=
 =?utf-8?B?b2wvN2pWMDNBWHBDRTc4WExGOFRZK29QMzZqVm04dExTdjNJSUNFMjFFbFVJ?=
 =?utf-8?B?ZFd0Y3NxQnd4TmZlNjN5VHlJR1NXY0pVejNvQmM3emhQQVA3TjI3S283cDRs?=
 =?utf-8?B?YVNNM0k1eXl5VDdDZ0NlSEtPR2wxck1rOEVadXV0ek8vOG5KWHlsckJEQkZ1?=
 =?utf-8?B?TUkzQVAzd0d3RjJoN0lmNStaRjBDcnpQZWVkOHZLOXhyQ3hUSnY4RE5vbCtK?=
 =?utf-8?B?VlVwME9xVUNKZ2hBRnc1Q0dhWUxSWmhkVHdqNGorUTdvUEpLcTFwY1YrYkZx?=
 =?utf-8?B?QkpQVk1UTjJhUkxMMEhXVGJDbDlHRi9JYzh1OVJHK3I5S1hTeHhkeC9ZU1dH?=
 =?utf-8?B?TTgybWFFK2xJMWNjSHhaRGtvcG4rR0N2WW9qZng5WUZLdHovcFNPODVRMU93?=
 =?utf-8?B?SjI5YVdZSE4zOWFsS095Tmg3RnFSK0p1SzIwTXZsdGw0aFZjUjNGS2xEanN1?=
 =?utf-8?B?WDNBTEoxS3RGU2h1Umo3RWRQVnh6b0pUTklFTWRTdks5a3E2RUZmWloxTklp?=
 =?utf-8?B?N2g2N1VFeTVUU1hSTUpQY3p1SjVhZWZTQjVETmtyS3B0UmN3azhLRWFZc2JX?=
 =?utf-8?B?NDNvMEtpZytwZUVxMEIxNmoxSnNLUC9lYS8xYnRncTlPSStYMDZMZmVrV0Y2?=
 =?utf-8?B?NTRHRFh2NWJWQU5KYmxycnUrank4cG4vaFUxbnFMTnRIeStNOEYxaUV5QW51?=
 =?utf-8?B?NUhuY1RhaGhDeDBLR0lsZ25lOUdkcDVwUXhrUU5vM2FvSDZuT0c1OVNXVnE1?=
 =?utf-8?B?VnFNb0VNY0wwQzFMTDJBdnA1N3VjaThRa1NYUysvN1ZHNVVDYjhvdVpreGRI?=
 =?utf-8?B?SmwxNXpIK2RwdUM3MzhzVWdCbFVSakIyNHpkOTMwTFdRaytMYTFuWkRhcFc0?=
 =?utf-8?B?d0ZRVjR1WXNrMmd5cHhFMThtdE13YnlkWFJHcU0zMXhqRzF0R3l5cXVxRUds?=
 =?utf-8?B?bzM1emVBdHhnM21KVmtpM2lLZ0hPQmZ5OWJYczNDTjQ2RHVaYm1lVzF0STZD?=
 =?utf-8?B?bUhYZ1JvcVNHRkFLNW42d1c2amwxcENIWHB6bXJQQm9ubThZK2xNN0o5U3g2?=
 =?utf-8?B?K0JQWW8rVG5JTW5oK1hReXVITGVjRVdtZmptQlFSMXRSN05qLy9SMGhwRGV0?=
 =?utf-8?B?cDVhMVZaVStEQmZxSzllTk02bnlkS3piYWZTRlAvMUdYUTEydEIzQ2RMai9h?=
 =?utf-8?B?bi9IWEFSMXdUOTQvTGRPMXBGYzRrUCtuYkI1RWFKbUxjZ1dWSnk3NzVMdmhp?=
 =?utf-8?B?Z2hIRmEvSDVrV0c3cTkwUVlvQk9ZZnVibm91RFMvVFRmMThNb25PTklWYmMw?=
 =?utf-8?B?Y2F6eUZmcUdrVGZZZ0JJTjV4S0Rvais0WlZyUmFkZ1JRRnBuR2VTR1lNMlRs?=
 =?utf-8?B?RHptd3RPbzc2TS9uRndsYmVnQlp3SUU4WERVeUlvME84WVlSVnRpZ0FveW10?=
 =?utf-8?B?bWgrdml0RXgrMU9QQjR5dlFrQ0w2ckVyYU52WnpTb3J5d282U1ZsNkZwalZW?=
 =?utf-8?B?NjNpbEpCMGFxMmFaL2grcTZhclJQeUw4WFdkRi84bUdybkI3TzF6QlFtdlNN?=
 =?utf-8?B?NGpBR29zaEt0L3JNSVgxeWRkTlc2ZHFpZm9STnpzUEx4UnQ4SWhja244clFU?=
 =?utf-8?B?cFlKTm44UEk0a3gxbmpQN0U3bllMLzFINjhhTEdXUU4yL1ZJaEdHZTQxUE9X?=
 =?utf-8?B?R3lKQTMra2FDMlM3U3BKd2F4OFJxSlNDcUZKOCtWZW5FL0hQWHBpT2NyOE1n?=
 =?utf-8?B?cWkzSkp1aStEYUxEQ29TMzY5bGdIQ3NDSUxlVnAyY25wMEVBSzkxTmRibUMv?=
 =?utf-8?B?TmhTU293UVB5blVCZ0FGbWoyQnBKaEJFaExaNjJIRFczVlJrTFFKc3QveG00?=
 =?utf-8?B?REwvanhHQUZoemZEODVUVTV5cEFwRHdoWVhaMFNlWm5nZ0Y5MjMxYWRKaVJV?=
 =?utf-8?B?RHdNMDBiK3psMWN6enA2bWRGVjdqYkMya09XZlBTN1RLN2xTWjREOGFJU2tl?=
 =?utf-8?Q?i7X05n+26OvWVrl2VWKAxaW5h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10759901-c724-4dd2-6dd4-08dd8ea31710
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 02:42:07.5762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DP1GLoMsNam1aqB5lJjdZ9/tqHB8PaIJBPyRYfQzZ1KILevzI9hKe/NDSFJJLclENjlK+WtGHNpPzquV2YYsUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4037
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

Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-05-08 22:33, vitaly prosyak wrote:
> The change looks good to me
>
> Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> On 2025-05-08 02:07, Jesse.Zhang wrote:
>> This patch adds timeout control for user queue operations in IGT's AMDGPU
>> tests by:
>>
>> 1. Adding a time_out field to struct amdgpu_ring_context to store per-ring
>>    timeout values
>> 2. Modifying amdgpu_user_queue_submit() to use the specified timeout or
>>    default to INT64_MAX (infinite wait) if not set
>> 3. Passing the timeout value to amdgpu_cs_syncobj_wait()
>>
>> The changes allow tests to specify timeout values for user queue operations
>> rather than always using an infinite wait. This provides better control
>> over test execution and helps prevent hangs during test development and
>> debugging.
>>
>> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
>> Cc: Sunil Khatri <sunil.khatri@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alexander Deucher <alexander.deucher@amd.com>
>>
>> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
>> ---
>>  lib/amdgpu/amd_command_submission.c | 3 +++
>>  lib/amdgpu/amd_ip_blocks.h          | 1 +
>>  lib/amdgpu/amd_userq.c              | 4 ++--
>>  3 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
>> index 80d03a498..fcc356f8f 100644
>> --- a/lib/amdgpu/amd_command_submission.c
>> +++ b/lib/amdgpu/amd_command_submission.c
>> @@ -153,6 +153,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>>  	ring_context->pm4_size = pm4_dw;
>>  	ring_context->res_cnt = 1;
>>  	ring_context->user_queue = user_queue;
>> +	ring_context->time_out = 0;
>>  	igt_assert(ring_context->pm4);
>>  
>>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
>> @@ -280,6 +281,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
>>  	ring_context->pm4_size = pm4_dw;
>>  	ring_context->res_cnt = 1;
>>  	ring_context->user_queue = user_queue;
>> +	ring_context->time_out = 0;
>>  	igt_assert(ring_context->pm4);
>>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
>>  	igt_assert_eq(r, 0);
>> @@ -374,6 +376,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
>>  	ring_context->pm4_size = pm4_dw;
>>  	ring_context->res_cnt = 2;
>>  	ring_context->user_queue = user_queue;
>> +	ring_context->time_out = 0;
>>  	igt_assert(ring_context->pm4);
>>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
>>  	igt_assert_eq(r, 0);
>> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
>> index 3c2ecd1ba..a6c35c171 100644
>> --- a/lib/amdgpu/amd_ip_blocks.h
>> +++ b/lib/amdgpu/amd_ip_blocks.h
>> @@ -175,6 +175,7 @@ struct amdgpu_ring_context {
>>  	uint32_t timeline_syncobj_handle;
>>  	uint64_t point;
>>  	bool user_queue;
>> +	uint64_t time_out;
>>  
>>  	struct drm_amdgpu_info_uq_fw_areas info;
>>  };
>> diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
>> index 50d058609..f8e1a4b45 100644
>> --- a/lib/amdgpu/amd_userq.c
>> +++ b/lib/amdgpu/amd_userq.c
>> @@ -133,7 +133,7 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
>>  	uint32_t control = ring_context->pm4_dw;
>>  	uint32_t syncarray[1];
>>  	struct drm_amdgpu_userq_signal signal_data;
>> -
>> +	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
>>  
>>  	amdgpu_pkt_begin();
>>  	/* Prepare the Indirect IB to submit the IB to user queue */
>> @@ -179,7 +179,7 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
>>  	r = amdgpu_userq_signal(device, &signal_data);
>>  	igt_assert_eq(r, 0);
>>  
>> -	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, INT64_MAX,
>> +	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
>>  				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
>>  	igt_assert_eq(r, 0);
>>  }
