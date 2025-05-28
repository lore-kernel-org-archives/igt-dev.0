Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992F8C5AD49
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 13:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A66610E606;
	Wed, 28 May 2025 13:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q/1b9JWm";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D3310E606
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 13:53:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGWl49QJYQOh/2Jg6ogXjXFrwfrHhxoZhn5wUeLBXHI7BdYNY1Ay/tjpD7l/uB9e6eqBJaj1Pypmw979zYn/AO8KIjUUODc4R7K71OgDCntuitDHlPdRh6V/lfRphDuE8Rgb1IZYTa0x7fjy/UkSEo2/lx1iN0AZvm/KX8IhNu1fuxPjRZvwn5QHNsw0ZMJrp0bjlM1MqGFzO5Ocx5NMaSaTblqGdXEs6cxzMj8/hS882NXbiuX+RpjSO+vCzrALj2pr/JLhvxz8dDCNjAkNedYknkkMI2r63VjtyYYXd8Ok4Iu0WQWvB2COSkr5t9Bj9CDOMuabM+INya6PHZN9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24YA/Rs7RQRcNUygECOIf+x5s5SNuB038W5R2rxpymk=;
 b=jt5h79w+pSz9onKk0qPvg+e+QE9NnE6LSTOH0YJWKcYAllkRqC5wkf4Qe1qPL78ul679/zc02Q6ewgqIashxFk3TdZrbzdVcB/2K8WKwig0qnriXYY3K/HWCNnO61mpxkJMgXP42i9zblV9ArBl5ZfOKJUevyzEAmG7io68lUDf1XQyKbX0Zeq2+1uJFFxXSYo4alXd/fKhkscuti/KcRVviOep7Xt31Mji/ffuF1yfkT1+AqSkBh6N4wMhbUjpmH1g1WeVbI0Pv0KVqpl5aTrYRTNAzOplHkwEBF6E3RaN8VEkQjuviRFZSz8QY0FzJe7iC8ibkZUQhsFx2LaHzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24YA/Rs7RQRcNUygECOIf+x5s5SNuB038W5R2rxpymk=;
 b=Q/1b9JWm23icBN4c/ht7zx2Nt3fuHx7wMBHDhQuvI/659lYW4kq1s7ZagWYK9ZFZa29wOuwVb28S9eU42Qrombjkcm0dMhimf1Aaqqe/EwaEKK3TmEAWiOhrvhEPRk1XtHeI62MERgfgQOGEPYmeAL6JbVw5KyIGxNKnGHtj8WY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by IA0PR12MB8930.namprd12.prod.outlook.com (2603:10b6:208:481::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 13:53:33 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 13:53:33 +0000
Message-ID: <c687c3cd-e10e-432f-9103-7b89d93cd399@amd.com>
Date: Wed, 28 May 2025 09:53:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu: disable unstable tests to avoid failure in
 CI
To: Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250527071215.21975-1-sunil.khatri@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250527071215.21975-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::11) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|IA0PR12MB8930:EE_
X-MS-Office365-Filtering-Correlation-Id: 06a41fb0-d344-4a61-06a1-08dd9def0916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTMwaDUvcUhGVVd6Z05zNno0WmNSWjc5ZmwrOHVITjZCdS9CaFNKNkdUWVhy?=
 =?utf-8?B?SVdRMTdvTUVROGdYRmtTQlRMS1lMUFBWbzVGaWdJVm1lenp3SXQ0Yi9WRjZ2?=
 =?utf-8?B?MnVHdDdZeGx6c3k1MC9ocExkR3RhVi83QnVGTXhxMENuYmJTUnV3WnBpZXp4?=
 =?utf-8?B?dEQwUDloaDc1M3VuSVBzWVRveFhBVGlhK1FLcjZTQjdTQUxxNWtEcHlZNXov?=
 =?utf-8?B?U2dsL2FUNldITkRRUUxZVDBMcVdWTmx6QlIyZHFmRVBMSCtLa3YrcTJtUVJT?=
 =?utf-8?B?L0JESm1PcjlyUGpyUmpia3hoQUlqNVFxc2w2MGtta2VwVEdLbnhNVENWaFBR?=
 =?utf-8?B?UmVBM29CakhtbTY1NElDU1F0OCtCWEkxRFNVVVhFakZWOUFYZ011RTkxOW0x?=
 =?utf-8?B?c3hFb09FMHovZEdXbDl4ei9EaVhjcWNKSFpVRXNYRXY0YUhneWNDWVhBejVU?=
 =?utf-8?B?S1crRmNZMlZ0OS92Z05NT2dyWU8yc1pzRWQ3cjk4cXZCYzRmbldhRFg1WE5I?=
 =?utf-8?B?R3Z2NDhVaFMzRjMwMDhaREdEN0dkbUdSQk9EbENjYkxWWDEybkhUUXJEMnVT?=
 =?utf-8?B?QkVpSHZYTnNmNkJLb2poaHQvYngvVHhNald6ZGx1TG8rS3dCK3B3NzZicldO?=
 =?utf-8?B?STdNUGo5V2dxb1ZySmRxakF5bkNFNjIvRmRQUlBpQy96RVBCZmpTclNMZ3pV?=
 =?utf-8?B?Q2krd3B1QlhldGtCS21ncno5bUpkYlJCbWlzRkVlTFVPb0JCMHk3UCttVVdo?=
 =?utf-8?B?MU5OL2xGN2VVOEF5L2EyaXAyQzZVZFQ0OE1qYm1qSkVhSmVjQWFwOWQ2OFoy?=
 =?utf-8?B?cVpIUExLZmh4c0NSeTJxNlZEZWE2WjhnRDBKeW1pbm5tT2ltNlZyUWVRN0FG?=
 =?utf-8?B?Q01tZjRVYmY0ZmJiUURiL3prbnN6blJ5RU81RllpVEl4MTRJeG1kcmhOMEMv?=
 =?utf-8?B?YnRtbUdncXgxQ2c4ZzBwdDBkZzZ0bFN3Uy9iTSswK1JFaDRrbWNLbXdEaTg4?=
 =?utf-8?B?ZzFpTnF4ZzBQWFRpZG5hVTYwcFlGTGJzOW5ybkFxK2VLMHJlSzFCd3RDTmcv?=
 =?utf-8?B?NDJhZDZWNVJna3pGMnhyS2syQ1Y5UGN1U3UxUnRtVk01QS9OS25ENVFPY1l4?=
 =?utf-8?B?eUlobDRoeVozMi9BbGZnVWVEVlF1YTJHWC9maHR0dytvTm9rb1FuR0tPVEZR?=
 =?utf-8?B?WmxXd1FNQmc1Snl5OTM3MnUyR3d6cjd2SjJqUUZLVXdYN2Nib0ZRZHN4bmJs?=
 =?utf-8?B?cHRDREwxajZ3SW5Jamg5Q29VSzZEYnVFR21NdVlSckZZSG5MSFdxM1NwSjNP?=
 =?utf-8?B?aGczUzdCeXhFMDNPUWwwVWF0QUU0b1dRZlhqcFBwRGliL0hsYzFZV3lIbkxQ?=
 =?utf-8?B?V1ovdC9lYktvLzMrc0RtejEwck5jdGpvRWxMbXVzTWVqM0l4T2hLZnZDYkcr?=
 =?utf-8?B?Q0ZOYTJEVy96Qm5aUXhocFExY1piQS9SM2p1SEVoaXpKbHVKZzRWS21sb0xa?=
 =?utf-8?B?N2NqV2lsdHM0eDZrNWZCOVQ5QWs2QnFObWdYWjcvNkJFc25uTSs2Uklib3Js?=
 =?utf-8?B?WmEvcUV4Q2lGN25jQWhENk1ZRkNMWHpYVE1tN3JyMUUzaStKZm9lT0RFcktn?=
 =?utf-8?B?VlZMT0MyVGEzbzh6dXQzMXlUSUpOWkladlBDQkwvU0VYQ3J2K1E4M2lxbURE?=
 =?utf-8?B?dnVudTN6ZWx6M2FpNEljQi80b0ZKeG1xaFpMRmpqMzFMZGNHZyt1TnJDRXpD?=
 =?utf-8?B?Y3NIQ3BGRFljb09pQTNJVFN0NEN0cWRaSWU0dFkrb3UzT2VEWVdSR1M1cUFs?=
 =?utf-8?B?Q05LMDJLSXdUa0pGWDlUOWFYeW96VGdWaFFlQkFnOVQwOTB3QStlWnVRNXJX?=
 =?utf-8?B?TU5lV0JIdUpyN205NzMrNUJNVkpHdW9OZGx6bWF0cTJUUkNWL1BoY3ZzRWtQ?=
 =?utf-8?Q?CwpkWIWk10A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWFoQklHRVcxRlZubUhzYVozU29rWmNXK1BreFVGcjBkS1Bpcm5VcWw3UDRl?=
 =?utf-8?B?b1Y1M09VQklDemdOczlJNnBFOUUrbWxsM1VzdTRzOGZZNXJZZy9sVXR1NXd6?=
 =?utf-8?B?MUhobEtEYU9Ha3dFRGI2SmZzYzVjZnNvSUNVSTk5c2JyVENObG0vcVRlbDlv?=
 =?utf-8?B?WGF5ODJJcEJmUkd0NDBwZ0JMU3Z1elJjNXdrQTkyeVZxanZXZ2M4MHZ4cmlz?=
 =?utf-8?B?RGQ4dWtvd21ra1ozT09wTkQwcjJMS0hyZG01dTNMSk5IWmRtOG9NbGNOR1c4?=
 =?utf-8?B?SGY0cExlWCtCcitiQkxiT3VPQjZFZ3VwamNPM0RPekFKYTduR3FraHZ2VWFq?=
 =?utf-8?B?RjkyM09VVURHeHhoN0ZqOUhPeVo2N3RUK2RkbmpMQU9ERy9oK200Z3BRa3dk?=
 =?utf-8?B?TzFLcEprQkxJWkZpcWlTVHdtYVQ0M2dhdXVXb0hISk9xcDhOZDBKTkJnTW42?=
 =?utf-8?B?ZElOYXNldHRRcG9BMzkxVVZidVA3RTVZV1pSUml2Y3ZwTHhiU3BCdjB5ZmhV?=
 =?utf-8?B?UGM4T21tOGUyKzZWV2hRWjQ1OTFlNlBDemNkdkF4NTBXZHY3QmlHSXg2bW1z?=
 =?utf-8?B?ZzNXbHIzZk5vMzNzd0diK3IrUE9DczZmbEJpWG1HdnhLTUlPQVIraDYya1RZ?=
 =?utf-8?B?UGFsVjZTQVQwUXdVbjRGR0hFRk02aDBkTUNuN0lBZjdzWEFTTHFnZEk5Sm9p?=
 =?utf-8?B?d1NtQW00RmttdUtVcXFrTStkK0E4cGJzL08vUThBMGtZTGFOYzY3K24yMHB1?=
 =?utf-8?B?WXMyVnRzNGd4SGxUaUdFUWlseFNlWFowOFN4ZUFsd3JCNEtRYXY0bXc1blVY?=
 =?utf-8?B?S2E0MmoxNmVwUFJVUDJHbDdDNUVRWG9HeFNwSUdGSVBMVXlkdnJMMkI3S05V?=
 =?utf-8?B?ZDAycnF5N1NYR0FraWhrOGFNaDc5WE9nSlpCdUxHblY4K2ozdTVGQ3BYUURV?=
 =?utf-8?B?ZUFiRVQ3TnhHOGwvVGtDZlpnbjlFVWQvakRjeWFHU0tMMlhiMjhoNVN1amNF?=
 =?utf-8?B?ZWwwZ01WQzVCYzN0YkQzdzhlY01Ca3Zibm5xdjU1UzhvRm1ZZTk3N3BYV290?=
 =?utf-8?B?Y1ZQaG9wKzdoRGZHcjZrNVJWWTdoZ3k4WHcxQXRVQjFqc1NyY09SQlBWNC9h?=
 =?utf-8?B?SUVOdnVvWHUvSDJrNFZ3VUlUNHVuNERSUDFKK3lrdzdpUHA2b1pIOWMwalI2?=
 =?utf-8?B?SGVwMExYS2RYTWhYNTJFbmFSY3QvYkhRYityZzY3NXo5U292Uk9jWllPSEZP?=
 =?utf-8?B?Y1h1SjZKZTVqN0RUVE4zV1hSWWd2dm81ckVSMFR4YWgzUDlFKy9INVY5VkxN?=
 =?utf-8?B?Q29jQ0lGV002Nm5XdlFmU2RFZXd6bERzeGl1eEZDSXlZLzB4UmQzaHhxeGtF?=
 =?utf-8?B?ZFV5VlJ1aWhtMVNWQ2dKZG5EeGRhM0xndUVHRnFSOXE1VzZCM2w5QkREaUtu?=
 =?utf-8?B?T1VHR0p4UzlPdGY1MnV6S0kzZjVMNDg0dUpXUmsyaytIYVR1aWt3ZWdOTUFB?=
 =?utf-8?B?eGZ3bWpvcUNkRlhXOVJ4QUdnRWFsVVQ0UVRQMll4ZnFjeDJWbFNOTWRjUzdZ?=
 =?utf-8?B?Njhtdzd2UUJIMVhaaHNzSlAraW5TUTJ2dW5Hc0R6ZldzazJkTEVXMWRLejNU?=
 =?utf-8?B?UHRoUmYraHFUbUJFdk9FT2xkQTdxaCtySWd2M2QrbC84bHBmbE53aEtIczJ3?=
 =?utf-8?B?Y00wZURwZE1Nd0tBWDFxVXZUTHVXcG9TVnQ3NUlrZ0ViMVRyS0Uxa2l5OURI?=
 =?utf-8?B?cFdoaGYreThiYTQ4OVBrampDN2JKR3VRNTZNRlppbnpORnpxNzNZT0szV2pa?=
 =?utf-8?B?R0VIMW5jUFFIU0ZOMW5POGgzSktlYmk5RmZUeUptN0tTaitITnZ0ZSs1NG95?=
 =?utf-8?B?OXRKaFlSUWg2aXAvVHZWNXp1VU9pY1YxZC9YUTVOQk16US8vRHhIcXFnc0dl?=
 =?utf-8?B?R3g4ZW9MUzlrV205WDA2VWQwbEhSQlB3cU9NTzczS0NTTFkzOHNwbmZtNWpM?=
 =?utf-8?B?RkVJYW0wQzJLQ2JhOTM4T3RwMVgxRVdveSs5MG5nZjVMTjVPTzFWNEZwaDAr?=
 =?utf-8?B?ZkZRNmE3RThPdmg0SHBOdEFhd3ZyUm1XRVV5Q3BKczBSUlJtSjBmM01NMi9m?=
 =?utf-8?Q?yay8JGGl9HZWxHOMOjUWnPLDn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a41fb0-d344-4a61-06a1-08dd9def0916
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 13:53:33.5379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MYLp3JrBok87uQHQPDuh3BMZ1/OgL7GvTVqWi2TOewRSh8kvaRM50FvvAox/iygEcO8ghFQZKxJaI1dDpUB6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8930
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

Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-05-27 03:12, Sunil Khatri wrote:
> Keep tests in CI which are stable and rest disabled
> till we reach a stable level of driver for other tests.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  tests/amdgpu/amd_cs_nop.c   | 2 ++
>  tests/amdgpu/amd_deadlock.c | 2 ++
>  tests/amdgpu/amd_security.c | 3 ++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
> index 268bc9201..eb07a2823 100644
> --- a/tests/amdgpu/amd_cs_nop.c
> +++ b/tests/amdgpu/amd_cs_nop.c
> @@ -200,6 +200,7 @@ igt_main
>  	}
>  
>  #ifdef AMDGPU_USERQ_ENABLED
> +#ifdef AMDGPU_DISABLE_USERQTEST
>  	for (p = phase; p->name; p++) {
>  		for (e = engines; e->name; e++) {
>  			igt_describe("Stressful-and-multiple-cs-of-nop-operations-using-multiple-processes-with-the-same-GPU-context-UMQ");
> @@ -212,6 +213,7 @@ igt_main
>  			}
>  		}
>  	}
> +#endif
>  #endif
>  
>  	igt_fixture {
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index d59957cc2..b5ae1c5c9 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -180,6 +180,7 @@ igt_main
>  		}
>  	}
>  #ifdef AMDGPU_USERQ_ENABLED
> +#ifdef AMDGPU_DISABLE_USERQTEST
>  	igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
>  	igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
>  		if (userq_arr_cap[AMD_IP_GFX] &&
> @@ -189,6 +190,7 @@ igt_main
>  					AMDGPU_HW_IP_GFX, &pci, true);
>  		}
>  	}
> +#endif
>  #endif
>  	igt_fixture {
>  		amdgpu_device_deinitialize(device);
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index ff22fd8db..79fe0f78e 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -357,7 +357,7 @@ igt_main
>  			AMDGPU_HW_IP_DMA), is_secure);
>  
>  #ifdef AMDGPU_USERQ_ENABLED
> -
> +#ifdef AMDGPU_DISABLE_USERQTEST
>  	igt_describe("amdgpu gfx command submission write linear helper with user queue");
>  	igt_subtest("gfx-write-linear-helper-secure-umq")
>  	if (userq_arr_cap[AMD_IP_GFX])
> @@ -369,6 +369,7 @@ igt_main
>  	if (userq_arr_cap[AMD_IP_COMPUTE])
>  		amdgpu_command_submission_write_linear_helper(device,
>  				get_ip_block(device, AMDGPU_HW_IP_COMPUTE), is_secure, true);
> +#endif
>  #endif
>  
>  	igt_fixture {
