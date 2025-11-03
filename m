Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788F7CCFA03
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 22:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0387F10E4B2;
	Mon,  3 Nov 2025 22:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wlt6LAOF";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E54810E4AE
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 22:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xR41QJQCJ7zTOF2HUm/h6/PBK/xjDsf/as36bsReLUQczALR8BoLK7P4Kcuv6IBpod4gAT8FYLeEwMnrvjZ46RMr5zVKgmTi4S/22Eg9UjM9WuBl8SG1/9Zeih4KPeEh1/wkBp/GnbbwT+8fPjcqhoazequgt6xPzb3yK/vxQozbe8yDKhS2Is5fAlBidSgKWqw9xdgqDjmKzn/2lUyWAQBdZqny4iapyMOI5ffqXqok4u/XeKPC+800l6NnKA42JCpQ0OAW9zoKogoptf4f9YG7uGw+YrN4m70hnmxnxt1iT6RN3NfNmZrvC4DhcTN7O1WK6Pft7YJVsKvs8Cbebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+jsX7dgDKqjZgx6IyBDnayjdDcJLsjnCydmhLAasvM=;
 b=ZZqIoG7Gmm81aB4Aq3ChRem85/43EWAZdAyhnkUynNcq4YRw9igI/Fh++GC8/oexdtiTa9+URSODAwEwXokADQg7UP8v/cRUQS0F3dhmyFHKZG0HXrxK6HrK5SRTdzcCcj/eOafxqtvaLZnu4vkXqyeZJOJK7J3MFL+YXP1T2KNgGLHiMKWZy69UZ1FusGd1LxxKdD2qOkMrOq4j6r0FZlorbPrABg9GLq4/CSjayrKC1O/FbZl/78l91Pk9bxAzVpCMUpb5+nZjgsz0YVtpRyvWcPn9L5leoY77YDdcyuAf91fj/XsNzGGhA4hEMGECZRxmAmaFhbvavqteN5G7OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+jsX7dgDKqjZgx6IyBDnayjdDcJLsjnCydmhLAasvM=;
 b=wlt6LAOFfUwrnRBIg+SKoiCMpi/brRyxF60A9H9sxVCWlSnT3HMh+DHFkoWFbzRFDN0EQz6ouWQbra0CO+wT7cuS+LjL+YpTvNVRCcjSj5yHg4ST8eAMAu8g6pjNeu2AnmRQYlpQ8TLypXm5LbZ2WiAMDn9aokINqXLrhXmVyWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW3PR12MB4425.namprd12.prod.outlook.com (2603:10b6:303:5e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 22:16:36 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 22:16:36 +0000
Message-ID: <ccdffec7-5948-4ee6-8853-a1cb7616d1a6@amd.com>
Date: Mon, 3 Nov 2025 15:16:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 08/32] lib/igt_fb: Add igt_copy_fb function
To: Leo Li <sunpeng.li@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-9-alex.hung@amd.com>
 <fc709df4-1591-4125-bad0-6a77acf17d2c@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <fc709df4-1591-4125-bad0-6a77acf17d2c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:303:2a::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW3PR12MB4425:EE_
X-MS-Office365-Filtering-Correlation-Id: 35937e12-cd4c-43d2-894e-08de1b26a757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TSsxc1FGSXg1UUkweXN3ZmZ5aGFadVBJYWs4ZWNFdTAyY25QYUc2MFhBYURl?=
 =?utf-8?B?dm9JTWx0blhsTU44OGE0YTExVEd4RWpxN3pPYmg0WW42Z0QyMDRKWXlSUXJQ?=
 =?utf-8?B?YnQ1QXArUFB3aHFiSmMwZUh5OGs1NXg4UDdPY0pDTEoxNFozN3piUWpHWE84?=
 =?utf-8?B?L3FhQXJObGJmVlh1NjFQRUdVSVRSeWpwcDFwMTE2VUlBYitobzFmcnJtOVkz?=
 =?utf-8?B?YWRrcnNkTjNQSmtDQmkrUjVzcTVDVE1PSi85U0F6STJ2NnpsMkdiVFNDZkpp?=
 =?utf-8?B?dlBtNnE2aE1mdzdUTDdIeWZCaTBCVlFkYU5OZ21LMnRuZWpPcGw5Wlc4ODdU?=
 =?utf-8?B?TnRQcFpaNFNNQm9jNEFKcklITHhEUGVjYkk0MUxzOFFFZWNTYWNLZ0lBcEQ5?=
 =?utf-8?B?bmFvdERxaWdLczRLNHZQV290WjNGbUl6anNxUi9KbzZUKzNOZWpBbTJIV1Ix?=
 =?utf-8?B?VTFRV09QbFRtZWZPN2J0QnFjRzFOZ25acGxaVGtYUGkzcE5VdFNqSlRtbVVZ?=
 =?utf-8?B?L0F3c2lWN2F5SmplNnlwQ3BtcG1KUkdXbjNIbE5LV0hhWTViKzA4NTg3cEg1?=
 =?utf-8?B?UjU4N2RWS2MwNXRZcE5TM1hYNDFLOENGQ3p5cG5xMGlpN0pKTTkyWFJheW1x?=
 =?utf-8?B?QUdIbWU0MlMyUzlmUXU0YUd2VnZ4TXRvYjk2bC9uSWNlTnN1TE1TRHhzYkNx?=
 =?utf-8?B?a2NPWnk4Uk5ocDNsbjlpeTBjMFRBVzMxemNHOU9rbktkcy9mREVXUnZXQktQ?=
 =?utf-8?B?aDZJYXNCaFRrTDlqaUg0clpSWXlzNGV2dTE2SUhhVi9EcUh6OWVSSm9sNGxB?=
 =?utf-8?B?MDhDTENEQWFrNVpzbGEzem9NK2FyMlJ3dkErK0VmazBpc05oWHBBeFlNMmN4?=
 =?utf-8?B?ZEVKNHVEV0ZneERqR2RlVldkQ3AzcC8vR25heVRENEhEV0grbkhpRk5qSW9N?=
 =?utf-8?B?K29PdUJpZGlKUzdLV1pDMWxrOGpnRXNMeTliSU5jTmx0cmN2SXVqY0tRcE0z?=
 =?utf-8?B?aUxaWUdiY3M5RHJpdzRQSUFaYVdud1g0UlF3aFAzVmoyc25rVWRtZ29Kd0J2?=
 =?utf-8?B?VW5VOUhsamZrTVZ6bmNaV2hWcmtRTThGQnpWekVXU09RYWVxRWtGN0FyMmlr?=
 =?utf-8?B?RE9mR1laQWRybCt2V202TmF5ckhWcllmV1JFTkRuamZMU1VyRzd5Vi85MFp3?=
 =?utf-8?B?RitGTmtsV1IzVUg3VVUvc29FcDhwbm5hL3hsL1pIVnhlZm1jb1hhM0lXQTJD?=
 =?utf-8?B?aTRZMFhjUjJ4ckltYk1ndjZiY04zcDcrQW9WREc0WFlDcHhpaEFJRXVReXFj?=
 =?utf-8?B?S0ZwM3cyNE84Mk9NOTg2VFlPeXkwdHhFa3lNbVR2eFFGVUpHei9tcmMyT1N2?=
 =?utf-8?B?dG9qbFcyK0RrNWxIdmJKUTZjSWFveW9XYVM3LzVtNWs5MFdzUExLOGd6NHBn?=
 =?utf-8?B?NEIyVXB0NC9sRlNkVWdOVjNIa1BlUUNNemwxaE0zekhqS2xVZU1tZjYrZ215?=
 =?utf-8?B?YzN2cVFxbW5sSkRka1BFaFZaUGE1bTlBTlZ4eXpQa05jRzVrSEp3UjFEMlVN?=
 =?utf-8?B?dVQ4MElNL1pSTis3d1pMVThEUkY2K1NKaVVPSUd6RUtWSHhoVjk3bnRpWEtX?=
 =?utf-8?B?elljdkNyUkxGRTU5RDJxeWJPSVpIVkJMTzVnbUF3UFBvOUdvVDVBWVI3aVdk?=
 =?utf-8?B?OWI1THluVFlrTWkxOUF4WjdLbm5ZV2tQZU1CWEszZUJNT1NKeUxEb0dBR0lD?=
 =?utf-8?B?SmJQQnd6L05Vb3I2TTdmVTVMTVFJUlJhK3labTdnaWVoS1FQdG9URE9UcG4x?=
 =?utf-8?B?R0RUYjFpeXFudzRneVFCby81RUpnT0QyUHcyL2FBV1R0WnFxaTF2S1M1ellJ?=
 =?utf-8?B?dEJwODM4NzVpQkFhYUEyT2lvQ0pjbFhHMnJIdUYrcWxJcjRZRS9zTnlwOUxi?=
 =?utf-8?Q?fzU4KrOx9n4FD+93WdOTqnavowvYfmBK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE5kWnNNdDlndzkvUytWUy9TRGRQOUcwTjFUWXJQaGR6enpyQVJobWpCRU12?=
 =?utf-8?B?YnF0Yldzazl5NDV0Nkt6Ykx3dUZDTy9ja0xPbjhqNXE4Zmw2K3EwQm5INkJ5?=
 =?utf-8?B?dXhLaHh2Y1BzeTh2TE85d1BNcy9ldHpnOTk2dGxCOExWaG1McXBwSGo3VjVu?=
 =?utf-8?B?UVg4UHJORTlmMWZ3NklHaHVxUzF3MU56b3JteUM0VmFvSFJDcEN1eVhXcW8y?=
 =?utf-8?B?NTExc20xSVlYZlE1eUVvbUZINHVidUpUNTBxVnV6bUMycjRkVEY5WDQ1UzRC?=
 =?utf-8?B?d0hEc0xpMlI5RTlyZWoyMHdZWnJoT2pqTXlLbDVvelJCMi82YzRpL2pKUTM2?=
 =?utf-8?B?NzFpVm9qY1ljSG1jcG02SFVqdUVISkEvMlliOWxCeXRyNTJrWWl3b1Z0RnVV?=
 =?utf-8?B?dmtEa1M3VTZKTkFmN0VpdVAweC9KSmE5Nit2aXhUNEpoYTYzY3VoSWhtd1hU?=
 =?utf-8?B?VC9oMFEyL2hXVkVRQy9EQUFvTHFxU3RVd3Zvd0kxdXdTWGJmTkdlaTd1MFB0?=
 =?utf-8?B?MmhjUTQwZ1A4QjlKQU1oTnlrYW4xemZ5eUREQWc1N3I4SFcweVJPR1IyR0pC?=
 =?utf-8?B?OXZ2UFBmNjhpMFdEQ1FJTm56SGJnV2hianY3My9HelhWMXhwbjVTODg1NEFi?=
 =?utf-8?B?K2FGVTBUU1BsbjZ3Q24weEY4R1ZJcitRakNEZ01DbU12UHF3OEpLSTZ0RGN4?=
 =?utf-8?B?NXJkeVg3UlpCUzBVL09MWWY4Sk5iRVl6ZVdubHl4cW9MOXAxK1R6TTFOaWRU?=
 =?utf-8?B?UTFlTGdRdThjQURuSzNRT280VVVaWlhZVE5DWW5Fem1HazdRaVVMaWRTSW5m?=
 =?utf-8?B?azFSM0hFTnpOV1BwRUZsbG1UTlZseTdzRnRHb1RkcjlPUGFsaUN3b1JhT2tH?=
 =?utf-8?B?eklScDhQQWFjOGIzc0N0WklLOVRYdE0rSjRwaThTcDgrVXhBdWpsRzVIRW8y?=
 =?utf-8?B?TFFKdCtzQVlpRTdraHIya0RXZ0lYTlpRdlRTWi9ONVptTm9TMENYMGJkNGF0?=
 =?utf-8?B?V0RxMTQ2VWFCb1FDQnBadE9Xd3dyT1FuUW16cmhFL2pKQWRNaE92T0hVbVRk?=
 =?utf-8?B?b1ZtcDZNcUduM1owTkh4QTZkTmNFTEFmSTdib1FPS2xLQ0ZSNGwzTVBQdCtJ?=
 =?utf-8?B?Vy96TTZtWFF5VXF5YU82REt1V3JYMkw1VjlVcCt6ck84cUNaTU9rV2RVWUVt?=
 =?utf-8?B?UVpYYXUrZlJvMlZzaWRFWHRGT2s4ancxeTJaUmtuOHBOSDJQNi90bDhyMzZx?=
 =?utf-8?B?Rk9yVEIyTU1ZYmpKaHVXOVRscko5VnRCRlJIcEJ4VVVWSVlTN2dxYUlkNjZQ?=
 =?utf-8?B?SXNjSTB0SVZVZjBzRjdTeWtVbzJzK0d5MjJkYnZYdVByWVpXK2J5bnVkYW1m?=
 =?utf-8?B?ZzBEcGZITEF4emlsVzV5b3d0VkZVL3lMMzBYSlUxaEpkL2cxMEhPV2U5c1dv?=
 =?utf-8?B?cUhBQWJiR21oeXh4eGNxUWRBWXFXdncvZG1ZUXNWUEYzK2J5alg4Sm96NFZk?=
 =?utf-8?B?TllFMStvODdrL21NTytpUnVxVmtVcEZwZkRKQ3ozaW9VeVhMTkhaMmFuZ2hB?=
 =?utf-8?B?QlBCZ3pwUGtleGZLaTlXdXd0VFo4QlN5eEsrQlhNb2MwakRtQXdtek5KdVkw?=
 =?utf-8?B?aEJCSi93ejRFZUFIamtlaUpTaThGeW5QQ0Y3cGdNOHJudzI5VXVHM0JVWm9n?=
 =?utf-8?B?WnpUVksrb3BSSlJjMytRcWNTSktlWGZiK0VRdWIxWjNBaWk2N2FQL0d5MnNv?=
 =?utf-8?B?TUFXOU1XMVo5UEpXbHBvcXBuYkUwWU5MYi9WUklWT0lGMXVNbEVlVDVobml1?=
 =?utf-8?B?SGpWTkprNUVGeGhvRkppbldtbGIvdjR5czlPcmh1QkxZK0ZlaTd1QlVCSkZW?=
 =?utf-8?B?aGp3citKd1U0cEs1WnMyeUl0dUVUVHhsVnR1Q1hQUWlyU3o2bW0zc0M2R1ZQ?=
 =?utf-8?B?cml5Z1NRR2JCR0JCV3h3TERLUXE5V0ZjNUI3NUdLU0lMZUJGSDNLYnFaNU9M?=
 =?utf-8?B?MXZCOFRtVzcvUnJGWW5FVk9PZk0wRTB4RGtmbUtWOTF3OUtlc09QQzE4ZTJI?=
 =?utf-8?B?L1BNYkhQZWRxd2ZFY0FWWlVCTEUxblBOeHRzUlhOUm1qS2xBQ3M1VkthdGhk?=
 =?utf-8?Q?z3CBIQ40fYX+JT2gDrJZpYaZt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35937e12-cd4c-43d2-894e-08de1b26a757
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 22:16:36.5087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rfv8HQIUAJC2L6bchglX/9p7RFlXEazrTlvs5a7DgNMlHyP2/3Rav+kEnMEpAKQ0JT4S9sFTQuTV5ty2x2wPnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4425
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



On 11/3/25 14:53, Leo Li wrote:
>> +int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
>> +{
>> +	char *in_ptr, *out_ptr;
>> +	int fb_id = 0;
>> +	int cpp;
>> +
>> +	igt_assert(src);
>> +
>> +	if (src->num_planes != 1)
>> +		return -EINVAL;
>> +
>> +	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
>> +			      src->modifier, fb);
>> +
>> +	/* copy buffer contents */
>> +	in_ptr = igt_fb_map_buffer(fb->fd, src);
>> +	igt_assert(in_ptr);
>> +	out_ptr = igt_fb_map_buffer(fb->fd, fb);
>> +	igt_assert(out_ptr);
>> +
>> +	cpp = igt_drm_format_to_bpp(src->drm_format) / 8;
>> +	igt_memcpy_from_wc(out_ptr, in_ptr, fb->width * fb->height * cpp);
> Does fb->size not work here?
> - Leo

fb->size works and this saves us from calculating cpp.

Thanks.
