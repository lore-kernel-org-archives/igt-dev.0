Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26322D2068C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 02:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B992110E2BC;
	Wed, 16 Oct 2024 02:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3UavEb6v";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F7D10E2BC
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 02:06:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXUZmLFLypCR/r2vOj5+G+1nVvCVvR0FN/jvSp+paYVLU+agQZTZ9y352i4tgvc/ZL6c48lYBY4XagLht0URYzgzaj+aeXMRd/ZSGlxFvl0DT+0FqGpkvDa/SCAqV6dkKSq8T70Up0G6ILukTuUuJ6P/7IPAlgjM/tSJGdM347tZa2HSpvIGw8UYgEntc5clklCH31chaQZxcu4wlRST7uGFzKKlhxNFbNC1JgDTP4/pGgODl4hSBuMxx/NxDiixZdR+rPryhETKcqYqQhWb7lSvTjXF5c2mlgpQmIqKPoKor64zEf29qRbnZAm1btEA9sSLpxI0uIz7OxmpUzCpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpEAgZ3+LjyayAIa/DtYAzuGNguZjCZi+oL2oKm4D90=;
 b=qN0KQeq+iZtXkAvQIYljGBzgfVkeOTfxNYTrjooVa7iByvNYeyGmIpphX8sKrDbs94tDnMxBSSg37WmykSkWP3iAT0CIHEYlHKagw9VnpbLjrYIpkS4Cqjw/LNR2euDhOM52/4CzJzspal/wm5MtN2DGdoplSBpH7++odAOf8aP7cUTfK9Br6YbhtdXezqDfFPidQeQgIYsQIG73rcLKZxvaGraxWAnArVdRIfVo6LsiABvYJUtCOcErlGZl/fOBSGSTor5TdGyR+htrjB+5FEAVDtFfqhDgKuz+wzA9hU0Y7NGn9r0d15iaikjfVBP9oc+koxtVGn29rG2fOXpNUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpEAgZ3+LjyayAIa/DtYAzuGNguZjCZi+oL2oKm4D90=;
 b=3UavEb6vyvFMkl+t7/CX+woQi4kGTKbcyJa9xoOBtmx8Nm0IZOKPzQyqlKNkKxhSOPW4rkV7Tw4A10fWEiA+LI4WvPT7EFAxoNFqwsuEm3b3MIUYoGG/g4593H4WqrWSHbf/Eu+m0TrJWrygoqH7uUWZ6HH4iDnU50sU4HfwiRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DM6PR12MB4187.namprd12.prod.outlook.com (2603:10b6:5:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 02:06:07 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 02:06:06 +0000
Message-ID: <eaf82609-3ff7-46ec-9a57-302fec71c39f@amd.com>
Date: Tue, 15 Oct 2024 22:06:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/amdgpu: change sdma limit check
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20241014050558.1163562-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20241014050558.1163562-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0186.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::29) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DM6PR12MB4187:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b17e8a7-c56c-4e9e-63e6-08dced871845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXYzbGxZSW9saWlKUU5rQ2V6dUw4d3BRUWV0enRhZjRRTWVyVWFpNGJRRmdt?=
 =?utf-8?B?WlZ2aXlOdjBERVY1VkdZei9qV1FhUW5YNmZmY0Z3dHppSzdsRlF5S1lMWXZM?=
 =?utf-8?B?bzR6TWdRZmtCSU1KVFBjaEgzcEFZWW5ydDVwL3NPd0tma2dlWFU5VkZ6bW5s?=
 =?utf-8?B?bVFkRUNSRHI1QTVpSEEzTVZ3ZjdsRUhSemxHV3pDYXZLam9tZ3dKNTRtRFZZ?=
 =?utf-8?B?aDV3QUVINEhwaGwwVkxVQUJab1hiUU5MQTZmMVBGVm1zYTBEeHBwS2lJK2Y3?=
 =?utf-8?B?R0dtb21xY2xUU2txQWx6V2w5TDh2bWNMWG96UkpZa0tLS1RyUmFmOEtiQ0lk?=
 =?utf-8?B?VHJ6bDU1TzZqNlhIc1FRb2dYeVpobmVWd01iWFhwQ0VKeXM5ei9pVG1ZQmYv?=
 =?utf-8?B?UFFHMWpSbDY5VS9FRmhUbGlkRFBKZTltWUxYZ1dtOXdIby9iRkhDQ3I5WXRi?=
 =?utf-8?B?d016NTUrZDNQdTJuZkt6R3Q5TUJsbXdvUFgzMHUxdGlYU2ZHS3hhSWZ1MDdp?=
 =?utf-8?B?TWFMUERQeE85RUFTbGFRVTNiNEJ5ck1qNkticmZTQ0RUQmRSMHBQZEIyQWw4?=
 =?utf-8?B?Z1ViOW1HeGZiTEptQlVmMXp1QWxCeG9JWEt0eFB6S09HM1JkbXVxZWw3RHJh?=
 =?utf-8?B?WU1JZzlzRitMRVhBcTdlQ1JkN3F2QVZDSTZvUHQyRVpVWmxiaUdkTFRXRTVL?=
 =?utf-8?B?elZQZ2xRUmFDK2E0MklJcndTSEhGT084cmVJekxiU013RlUybTdkeHFEeTJK?=
 =?utf-8?B?WVhzaFRzZkpEUGcyajF5TTh0QXRYOVhvT1QvV28xN2pIaGExaldXRFo5VllR?=
 =?utf-8?B?NTJwc0RMZVNucmFIbHlwQzFTSVlsMm1zVjJySzd4OFpWZTBVL3ZpbkVwZGtq?=
 =?utf-8?B?c1ZBZkpoNzdOdFBTVVpRV1RrYlNHZ01ucCtCeVpjcDQvVHdLT2tjY2QydjJm?=
 =?utf-8?B?cmVHYkl2bVhIWDc4b1psaHk2WjVuakNZQWJBa25uZjJOMjl2V20xekJZUktP?=
 =?utf-8?B?OWVzWnFvZG1lQ0srUSs0ckdkNWhLd3JoVW1JY2NQSTgrUzhkNWs1d3JNeXB5?=
 =?utf-8?B?Z1RYS3NLc0tEaTRlT0l5dm56bTdzaTltNis4cVRrVWV1TzBybVFNYTFJbmtG?=
 =?utf-8?B?WWdaYzhBQlVrR0RQaFE0bW1KUWE4RU80NUI0dzFMdG8rQkRHSnBFTUFiT0tT?=
 =?utf-8?B?bnVwcmlobGgxUGRsS1kvN1NvS2ExVHJWRCttdU5jeDJRekFBbTE4QmU3Mmkv?=
 =?utf-8?B?VUlUVDRlV3ZLNlQ0UUd4eDR1RzFKMmtqYW5GQjN2QWM2c1M1WjhIQkw1aFBw?=
 =?utf-8?B?d0RCZk9YZGxoeENjVDlSbjJGVk4zT2ZUdE85RDBibzB6YlBqWStrZGk1WHFr?=
 =?utf-8?B?TFhiZW1zZXpBcCtIUG55c3FCWWhhemN6MXdSVmtOOTlGTWMxQXhBdTVnQkcy?=
 =?utf-8?B?NmZOcmxDaE1NRGI4Q3JvalhGLzZick5uaW4vam9QaVBCTi85ZGYxdlE0RCtp?=
 =?utf-8?B?eG41Rm9va3hqZTVHQmZtYVEzeFJyaG9DRWVKbjdHbmE0dFUrK29ZdUVabExu?=
 =?utf-8?B?d0FWZUNIUDNYMVROeEt5cGdrTHoxQ2VHRlZ4Sm1qODVXdHprOXBrSWhTVFhW?=
 =?utf-8?B?Mnd2VGpVV1U5MXpVQTlVOTNnaTdZZ2VEeGJqZi80NXBDVXc0UG1aZ1RlZE5z?=
 =?utf-8?B?dng1ZHFpd2dHTzI3aFVLM0dPcXRFYjVpTTcvSzBybWkwN0FyNzAzNWN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVUzUklHSUN0ZjJ1b0VlZmo1c0thS3lWbHh4KzcxNFhiNDZ1QXpzeWVrTXZR?=
 =?utf-8?B?QUo1aUtIbzdHcWNwRXNaUENESFhVSnBwV0JreUpQdVBLbTl3b1JCaUNvTVUr?=
 =?utf-8?B?YkJTTE5oSnVkYUM5MFlWckQ2MVJuM0JYRnptazlMcEhOZVpwVngxaXh0MUUz?=
 =?utf-8?B?ZEp2LzAvN1hpZ0N4S3FTM1NhWUpzcklITHU0TGFONHltT3FCWWFWTlZKNDha?=
 =?utf-8?B?d1NhY05ERXI4MUhRdnAveTBKTlRnTEJkSVRMKzBTRERxVlF5NlgxRjFEeWFo?=
 =?utf-8?B?dnhiNTQyZVJZUUFNcWJ5V0ZJQm92ejVNL2U1c2Z5REtqMTFzTUR5U2Q3TE9P?=
 =?utf-8?B?L2R1LzJUUU1qZ2Zod29NZjY5RTlYY3JOU0dJRFBwbGNhcGxVdzlBemVQODYr?=
 =?utf-8?B?TU9heDA0WDlZTmNMcVpic2hpckFUWVFhS2ZwbFI1djZ0cUNVRWliNktLZmhL?=
 =?utf-8?B?ZUQxTzJScHFIc3c2aFI5MVBzbDUrYzQ5TlMvd3E3NWRnNUsrZzUxVzBEc3Nt?=
 =?utf-8?B?Z0RreUJmL1FTUHozcWRkenFvR25TWnN3MUVYdWt4a054bmV5VHh1Yis0N3l4?=
 =?utf-8?B?UTJDVFVuc2tCSXpJeXhNY1N3UU1zUWlLcDU0aFZqUXBkTzA5K1JQWUF4Rkwx?=
 =?utf-8?B?RElhRUhxbCt1bTFUVEx0ZUZSNWhLdDBPelVVYWYxWEJLWlpYdXFwaWt1Ukgw?=
 =?utf-8?B?RnRGOGxIMXlOaE5RWUFoc25aOGMzUnprcU5DblBINTZKN1FENnptT2o5UDdP?=
 =?utf-8?B?NG1PU01FblhUQUVQaW9EcStmd0hRd0ppbUkxVUVHM1NEeVFFUkJtK1pSeXJ2?=
 =?utf-8?B?Uks0bDhlQU10TmpJT3NXV0wwMHRtQ0lxOGg1Vm8ySG8weGUyVWMydmxJTGVY?=
 =?utf-8?B?RTJXYjB6bVNOYjhpaWZ4TncyMFZIUnBPY3RrdUJwaHlxcllFSEM4UGlqVXlG?=
 =?utf-8?B?MzZiYWZ0ZDVFOW81bFNQTkhlWlVlbUJuT0l1MXFxY01Jc2cxTHJZTGQzUFNr?=
 =?utf-8?B?OGJjUnFVNjM3UnJMTkZvczVRWFNUeHZ0bVIvSmtPcU1rdlFDOHNqWC9xeERp?=
 =?utf-8?B?Rlp5RVhPZjdQNzkyZTk5L3B2c0JuVW5sZXhiR2Z0TVQyK0lsWVFXaFV3Nkpo?=
 =?utf-8?B?cU1hZTczR3V3TDNWbHJLaDdIcTZ0NkZkS2huTE5lSHNjNXN2VS9palVYbE4v?=
 =?utf-8?B?a2p5S01wWFRwVzY0NllXNkczcVZHcC9BNDNEeFlZdU9XVjdrYUg1cnVVait2?=
 =?utf-8?B?Q0NjQjA1TTFyV3pvOE1aR2VMaVd2c2lTVW5GSUg4Y0U2aS85T3BSVnFMNVZG?=
 =?utf-8?B?MFpnb1FEMHFhTDRtVzB3b3RmS3dja2Q4bUhaa1JZMUdQSXVGWXk0bTFLZ29P?=
 =?utf-8?B?eW1yMG1vOVUvenBaM2IxbWJyOWNRRE1LR2lVY1E4RmJlSFIzWExaYzlxTmQ0?=
 =?utf-8?B?YzFBODZ2VW0xK1luOE5takhpdm5QSmExc3RQMGNiUjBZVVpYSjFnTnA3NXJN?=
 =?utf-8?B?bDVzU0h0cEdiWXNUczB2YlV4dXVVU1VmNXFaZSs4L3RUbTdNcUg2UXc2VjFH?=
 =?utf-8?B?YVBoNEtRemNDZkdOVm9kcWdXdHJSWC9aNTFaYzJzRU9KdzFmeXFUQ1BrUjFm?=
 =?utf-8?B?blFlYUl1elZkaEdNa3AvSDl0cHMzalVrZzdaU285Y1lUNUYySGo0SEhOQTBU?=
 =?utf-8?B?eUcyUXlPUlpDM3czSVpxdzRaU0RDNGdyKzY4QThLV0VLNVNPUDdKTXhwTUJa?=
 =?utf-8?B?N2doejBMRWYvQ1JlU05UUXJSVEFVcUYyY0NkbDRWM0NUUzhFdVliVjkwR3RI?=
 =?utf-8?B?aUcyME8wODNteWhlemt6dXRMNzYra2l4eWhnTXd2NUFjWkVCSExDQlVZVC9t?=
 =?utf-8?B?aWpReDVTb0xWY0FIOWE2b2lCZFlBSWNubTJpNC8xN2dobEZYQkc5dk03NHha?=
 =?utf-8?B?NDh0R3gzYmJNTC81dmU2OEg2Q01QL1dzOEtya0haTTVpSXNUdEREaC9iQkNB?=
 =?utf-8?B?ODJqVHRXb3E4aVRkSEVrYTdpQUp4c0NEOW5ZVDN5QlNpVFFNWGtaZUlYSFEv?=
 =?utf-8?B?KzV6L0ZlZHpLNmRNM0hEajliN2JkUFFVcnhQM25sVThvUVlsOW96OHFLYUJx?=
 =?utf-8?Q?QLbsTyBK7OUPrwF6Kz8Xeaz/R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b17e8a7-c56c-4e9e-63e6-08dced871845
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 02:06:06.8330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr3BxsnKW9c9WchfEqsrYRpNo3Y8HTMVH/vRsExrPqWedPbq4F1CJl9eaovG8NUO6YMZze+aBI8sd3uf7Yk0vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4187
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

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-10-14 01:05, Jesse.zhang@amd.com wrote:
> This sdma limit is only for mi100.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c | 11 +++++++----
>  lib/amdgpu/amd_ip_blocks.h |  2 ++
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index f22a322e5..df603618b 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -190,8 +190,9 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
>  				       SDMA_COPY_SUB_OPCODE_LINEAR,
>  					context->secure ? 0x4 : 0);
>  		if (func->family_id >= AMDGPU_FAMILY_AI) {
> -			/* For FAMILY AI, the maximum copy range supported by sdma is 4MB */
> -			if (func->family_id >= AMDGPU_FAMILY_AI && context->write_length > 0x3fffff) {
> +			/* For mi100, the maximum copy range supported by sdma is 4MB */
> +			if (func->family_id == AMDGPU_FAMILY_AI && func->chip_external_rev == 0x33
> +				&& context->write_length > 0x3fffff) {
>  				context->pm4[i++] = 0x3fffff;
>  				igt_warn("sdma copy count exceeds the maximum limit of 4MB\n");
>  			} else {
> @@ -855,9 +856,11 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  		 * TO DO: move family id as a parameter into IP functions and
>  		 * remove it as a field
>  		 */
> -		for (int i = 0; i <  amdgpu_ips.num_ip_blocks; i++)
> +		for (int i = 0; i <  amdgpu_ips.num_ip_blocks; i++) {
>  			amdgpu_ips.ip_blocks[i]->funcs->family_id = amdinfo->family_id;
> -
> +			amdgpu_ips.ip_blocks[i]->funcs->chip_external_rev = amdinfo->chip_external_rev;
> +			amdgpu_ips.ip_blocks[i]->funcs->chip_rev = amdinfo->chip_rev;
> +		}
>  		/* extra precaution if re-factor again */
>  		igt_assert_eq(gfx_v8_x_ip_block.major, 8);
>  		igt_assert_eq(compute_v8_x_ip_block.major, 8);
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 679e2ea46..109d36602 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -133,6 +133,8 @@ struct amdgpu_ring_context {
>  
>  struct amdgpu_ip_funcs {
>  	uint32_t	family_id;
> +	uint32_t	chip_external_rev;
> +	uint32_t	chip_rev;
>  	uint32_t	align_mask;
>  	uint32_t	nop;
>  	uint32_t	deadbeaf;
