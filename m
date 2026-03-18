Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE32107760E
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 21:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E5710E43A;
	Wed, 18 Mar 2026 21:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xh31Enbp";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD8410E43A
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 21:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKvZzQYRF299EMtVOIlQyuYOS0jtvYne8t8AmunOw9d3a166JyCU4S/AinpXM3y/Mxzs1WICTm+Xrq/WRYQcDllsZ8Tnl0OYwLcPOMnw9tM1A5XXwXVMqsgPcYfywtE8Mm0ZuRPGMzxFid8wzkY6SmKPi2h6ZBrsmdx8hcIHY3QeVuIS5tc/2SF1ehvcdgTI27s0o4cUDFx+Djo7dbQMzXSq9qYlrC23PG+ywwwntRrkAG7fBwrZPzi0cVtxi5BUnLRl8+rm33xZCR+UkYGhEr/tlvUhPEeN0YQ7Ql+BCNbnp9FV5m3DrJuaULjbwtddLKxXDmxAeepdaDGaWB1a9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yd7UBeKohh5Ck2lIYXybE5Jrja9Si+hexKZ1k8BZjFE=;
 b=lXjpHzlcqPgVAs/gIU1zTvJxEJbdKsQFYv2jJZioD1G25hhBkluVsfgnnt+xPJA8Fu/sTrz2ZJandU/tRxN+ffGjJQxH2qJrbFEEp5puj4zaZqTFVtC0PkQl59aAsIK/LhPGzSlBeVyCccGNoxqgpwCEGhllhRaZ9u5gbR2LJgNWgyCsEB4ROmxfSROCk9vjZUIK/lE//Igfg3XeAZR+n83stW7T8zBUye3MCX+KQu9VXKDmNqSG9LX1XrT5NnROTpcfl8v3IXjw7PuAR78Tqqn+qOGUp6ac75FPzDFpRoWuFweioXjyp7OnNIHRpAAiTrPVW8EucU6RhuDYJVr+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yd7UBeKohh5Ck2lIYXybE5Jrja9Si+hexKZ1k8BZjFE=;
 b=xh31EnbpOswTEBpHMvTfmtPd2PMAqknTrFGgIdtSpLc2DJvPWkYCduBd/IMmQxKHKTqv4nXoYToOO3wmnJQa28zO/bg6KCIvxdNBnE2Qjkn8M6dvyF2ZrIBTEbgJpP//Fbewa4p0dVPzk8OTnwNq3dN8fgjOl4MnZrSws+nkQnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB7507.namprd12.prod.outlook.com (2603:10b6:208:441::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 21:03:34 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 21:03:33 +0000
Message-ID: <f2a800dc-34c5-4a78-87ac-ca210340a7c5@amd.com>
Date: Wed, 18 Mar 2026 15:03:31 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 02/12] tests/amdgpu/amd_multidisplay_modeset:
 Prepare for returning NULL from igt_crtc_for_pipe()
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
 <3b9a58fa7b3865f1e57049a9c0bf68caa89f8684.1773659680.git.jani.nikula@intel.com>
 <20260318180355.y2ozu3vb5d7u53dk@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260318180355.y2ozu3vb5d7u53dk@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:303:8d::32) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9d0a52-832b-4729-f920-08de8531d081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: BR0sWvTRvnAKGLPl5AXA3h/n//hBIrF88u8ORUJSDTngAMYryZFEdbT/n4A8n0nvuOSCePihYqHrEGYboEdifj7yy+uLMH8Mp/5qZhp6U52h1ZDiivCpcUvE6erZ8e5j52XHkkdSXi3bk3I6atUPUNsdqnoEUu+84ww8iHF4/aQW1RzfnznxCcuttwhXoKBhCDhSYLPcS9+g2hwOGZU6ymjpcdrLzMjBltOFuMxjJa2GpneHj691eCoyRdhuWSWN5VeR4y2iYO+V8jbLq7JU+ACWi+928C8aB+X+vvmmDySfFgEgHKgqtHecdt/fitK2FllwCnVA9HxhcA1/NLNB3FxJFHDvzr6fqxtYReoiJirNwWAZ0HU3g8txC6nkWqKz4xt45O5GQIE3z/Ly8mlbFdFllI7UR41tLd6HkiRiO6gUdvnu0LqZ7WYUYLee/3G/wc2QgbD5s/J/GGOsD5yQj6i/SFXTpgcXu8/dO1kQYM/5CFsHcJm9LUzqSxex12sHf9BPjcNc793/g7Q+lFYCqD+vq73JkKovhc0kO0Mx2RJBzdYSjOKra+OGEcvCUOHR26q/UsFohyjI12YNl6dc9EpJ2GiT2HUK5AesE/YZJjj1mcHFC/lz/n8vvqHxYQBaaWF6HheCfjukP/XaaNIBig5e3Gy1RSFumQU0iN+bIZgACBXmL++Huxx1Ec+2/UJy/KWYtsWnjHi4URjwBoa03DCdstmcZkF2gcqV3F0qAuw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHZ4NEpqdWNIcUltUGJCSFJCOVNJMGN5Qk9XalEvNWR1MDZvRS9kNXVBaHRN?=
 =?utf-8?B?aXM2dTNOOFJwSTRKNFdYVFhhY0ZTK0NzNStLVmxrQ0ZLZHZnSEo4MnlOYWhq?=
 =?utf-8?B?MzZIOFFhdWs4UUJHMklrOFJTSUtqL3I5RmpUNnNVYzNmdGVMYUYrL3pwYkFQ?=
 =?utf-8?B?LzRMZFBiL051eTdIbTBzdzV1ZlIwcXJjRTRvSFdRbVBWTFZlZVkrS3V0VkJF?=
 =?utf-8?B?UVZVeWR0Zko2V0ZPNEJJbGVPL3g5dGFNRjViU0VUN2k3Ui9VVDFiSHduM1Rw?=
 =?utf-8?B?bDU5anE4MVNWcFMzYjR2MThTTy83OFJIS2tkR3k5bVBQS3QwekZLczdrWHdB?=
 =?utf-8?B?dHU2L1hTRzF1ZGdIMGZFMnZTWWxwZTlsR25sMWx0eWtyaFFCY1huOHBzZ01T?=
 =?utf-8?B?MUE5TXBNRkFyYWFSbmVqSnBCY01TSUhnNTlTQ05tRzdOdWFoZ2xlSjBlYThy?=
 =?utf-8?B?VUpydHVzUU43ZVY5YllGZi90eDBQL1FxOVlHanRmMDBLVk9wWEo3T1FsNkNG?=
 =?utf-8?B?dmQ5d2dnd3NrYTMzd1hxRXpUVTRxL1dsa1pWZW1ybk9sTVBYdDlVbXhFb3F0?=
 =?utf-8?B?UFBKNGRSc2pHbk0wL2JwRk01bGNrYVpmNzRZSENaaUJGUm5xNzVzU3RLWkNi?=
 =?utf-8?B?SmJQL3BFemU0MTVtd1JCYkhmNDNNZzRIaTIvU3RHak5UOC93Wi9NT0FsQURC?=
 =?utf-8?B?ZXd1R3dJdk9TTUdxcUhSYTRDeWRWYnByamNIREpTTENZcTgvWTdLZjRSdUhI?=
 =?utf-8?B?S0RLZktmOGdmUGZ5WmRtNTJGSm9QL0g3NDR4M0dXejNnM2M3d3R5a0RHbGpY?=
 =?utf-8?B?dW9xbE9tTUtRckV1L2VjWklhWnpTY0VBc3VoaWhGMldMaytuQnlxN2NsZlFh?=
 =?utf-8?B?b25HUjNMNjQ1YjNBTEtNVnl0K1dobmVwTVhUWktvYXMzVFRBSVBBdXdvaDhH?=
 =?utf-8?B?UWdEOVhUL3hTaHB3Y0hvcEhJZTE2Q3JkYnBEdFN3RFk5bHA5VzZkN1h1Sk1t?=
 =?utf-8?B?Nmhud041TTNMMk41WHpBN2pGRDVZK3FFaXBXekkwV3Z1c24yT3hUQTJBRXY0?=
 =?utf-8?B?aFAxa1BFYVJPZzRnVDN0L3JiSk16TXV1VkNsYzk2ZTN0c2RwWUs0QldqSThz?=
 =?utf-8?B?RU9IQnBNaE5QWkp3bldVUTB3N010ZzhuT2RvMzIyMnE1UUliLzI5NmQwaUJF?=
 =?utf-8?B?UkVRVmYrdmJmeHh3OVNLRmlIcGxFTG9TTkRLRzYzSHcrZmhLdWRHdGw2blVr?=
 =?utf-8?B?NHErR2dqSXA0b3A1Vy9SZFNMTHF0RWNOdDdNZ0tPbGRRV1lFRTBmc2ExWklJ?=
 =?utf-8?B?MG1GRFRjWkoxaVBFY1BQVTFmSHBhNU9OblJGY1dhSkJ5RzlzSHpqVTBRTnln?=
 =?utf-8?B?MHZvOU1udVh0WnBCakhQTkYyT3ZrZmVjdFUxaVg4cjVvQnFqL0tuY2VhL3JT?=
 =?utf-8?B?WGhwalJTbURPWXl1WkRlV1hnNUR0aEZMbWJrbHJac2pLaWwrSUkxVUlPbk9E?=
 =?utf-8?B?R0VBT1FOUm1NeG1YdUNoTWNyZld3Vzk0TlZLMU1yWFJISm10ejAzKzBMWnlj?=
 =?utf-8?B?SzNyVVlQSklsSXUwSitZd0dveVZkWUhBMDlmWFhzNDJIRlNrS2VpalZZTjAz?=
 =?utf-8?B?Rk4xQXZnYzhpU1o1aE1hVmQrVWFCU1V2Y3AwQmV2L3N2VEJpK1Q0c3lNb2c4?=
 =?utf-8?B?Q1RabFRlZldVYU5oYzNGQkx1TmxBeHVKOUwwNTlvWVFVVFc0M3hRaDlDcys1?=
 =?utf-8?B?RUlBOHVER1JtTTdaZnUvVmRPc3hTQ3czM0lEOVFBMVV2eEdsMituNXJQYkdl?=
 =?utf-8?B?a3Zsd3BRMko3MmpJZUs4d0cwb3dxd1JJVHZ6TlQxQjhpbSt3RzJ0R3FiS0hv?=
 =?utf-8?B?MGQ1K3Zma3dGQWYxb2RmejJXN3o5TStoSk9ya0MwR0VRUzZRVlFFZThXMVV5?=
 =?utf-8?B?NThaUEtMTmlhZzFNTnNNSTlySHpqdSt0Uy9QUkMxRUVxbDFGdXFZUlcxMURi?=
 =?utf-8?B?UlRxdTc5TUhVWUxmUGt1WFNwV09YMnNSZExzWGcyU2VNZWRFaHBFKzJEc05N?=
 =?utf-8?B?dTNWMkJ0eVZWeEFnTEZEdk9zaVRlakVHOWFqa2FuUEhYY2lLT0VFeGxGaTEr?=
 =?utf-8?B?VzR6V3ZGalV4ZVRQY0dPQXBHazBnb21EVXFMSnlkV2MvVkkyUE9iT3FCcUlj?=
 =?utf-8?B?dkZBTjB3bUdBYnVzblpMRnNoTmkwdkk0eVVtZGljRWZ2ZUt5dUVVczlGNEls?=
 =?utf-8?B?QzBlaUlBVVNLaWlJTUpaaTJxQTFabDFqbHNzdXArUEFFYXhCMUR6RVY2d3Bz?=
 =?utf-8?B?VThINTR6ZG50YTd4R0hzMmY5VkVOSmNDMTNUVk5ueWNSVHhQdFByUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9d0a52-832b-4729-f920-08de8531d081
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 21:03:33.2612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2MaAu87VKjl9V8AJ903g6bFNC10/0ENVbN0pMiO/+nhZMl3/zvdoL6tRRFmI4hEZcBW9Kgw9eD7xvE2uvhrzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7507
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



On 3/18/26 12:03, Kamil Konieczny wrote:
> Hi Jani,
> On 2026-03-16 at 13:19:04 +0200, Jani Nikula wrote:
>> AMD should always have enough CRTCs for the test. Assert this is the
>> case by checking the CRTC is valid.
>>
>> This prepares for returning NULL for invalid pipes from
>> igt_crtc_for_pipe() by ensuring the test logic is sound.
>>
> +cc AMD devs
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   tests/amdgpu/amd_multidisplay_modeset.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
>> index 40d1e5d7f42b..ebcfea8ee35f 100644
>> --- a/tests/amdgpu/amd_multidisplay_modeset.c
>> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
>> @@ -327,6 +327,8 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
>>   
>>   			crtc = igt_crtc_for_pipe(display, j);
>>   
>> +			igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(j));
>> +

As pointed out by Harry in patch 1, igt_crtc_for_pipe can return NULL 
when pipe == PIPE_NONE, and it would be a NULL dereference.

How about just checking crtc?

   "igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(j));"

>>   			igt_create_pattern_fb(data->fd, kmode->hdisplay,
>>   					kmode->vdisplay, DRM_FORMAT_XRGB8888,
>>   					0, (buf + j));
>> -- 
>> 2.47.3
>>

