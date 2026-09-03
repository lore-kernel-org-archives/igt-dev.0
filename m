Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9C2C61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 19:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6D710E450;
	Thu,  3 Sep 2026 19:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WcZrSkeH";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007E510E177
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 19:17:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mkxb9m2mT4cTdSwSm+OJ8kH/IGwhpTB616yg33qJauMSrY3EG2vNToTJHp9qokNBhy2ykiK3Py+2RyTrXJp4fRuHdnBBl0SFjTa7g7TO/1Bhf2SstLXH2J1shjuj6zrMqerXVgTPxKMt6pL2e7OLNbVnB3lGTfU0Lc6OcLll0xdGD5jjz6v+xgs76BEmJbknurLsUjlHENDsjKhqCiNlggD8navdtA13/rqOk3Nz4Er8SrIK9CVoXrjWY30DjL7kpvP4tTXku1QGAliVlv1EoBwFyjBqIYFFogrJvjDdaTh4gh6nX1rPKx6EXqzG9vFEMfRZMBm/8HSq4mzAivywEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzWwXSk7FQ/Fx8zp9gzZaNwQsVK8zBiAx8I7HzCNwRs=;
 b=w5tZiMLms7qOARQGcWjw2mDxsNSb1sYFD7nc4sxhQ69Jb2yIuAxS80J2tL1PzcoW877gFcQ8qc9vnQAp2JphzMwfHFpn69q8BlzxlyvPnziTaaGeNONDnLgFBygQhf2Whv3LC7JYyfdxKkcIvjHkPrug1qWuY+a7JnwbKMyGm7U/H66v7p5S+vZpubuyZgCFRYCKHFA43TFH3hq4a6XLx5G3lcsoXUKk8pBxCI7QMYDlB5/HsF8IFiQf22qpmHqVQB1y3yTpCLnYS7R/lNP2ynj/80mEZVAQIbURsp/+k0L4BsAgbKq4xFPOg5xo2mUM0I3uU7N8oXrBBbp7+REnGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzWwXSk7FQ/Fx8zp9gzZaNwQsVK8zBiAx8I7HzCNwRs=;
 b=WcZrSkeHZmwS9ZnmlgIRwGAZJV9gx9mrWKlpLULjZzn2JWEwI1V1YS2EfutAVuPFI1ydYDMDwmP+cxjPSfgFT2OgRsToChuAFxrqEDbwKYo7e7L7xXOXnFkHqn7XnoAp2CgpQVy8L7IKXdT8AvhTGMQf7ZLS8CFvDXCOASvyNC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6970.namprd12.prod.outlook.com (2603:10b6:806:24d::5)
 by CH3PR12MB8209.namprd12.prod.outlook.com (2603:10b6:610:123::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:17:15 +0000
Received: from SA1PR12MB6970.namprd12.prod.outlook.com
 ([fe80::a65f:48fc:86fb:e958]) by SA1PR12MB6970.namprd12.prod.outlook.com
 ([fe80::a65f:48fc:86fb:e958%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:17:13 +0000
Message-ID: <b64191ff-8848-4728-80ff-cd900f2c5c38@amd.com>
Date: Thu, 3 Sep 2026 15:17:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 1/2] tests/amdgpu/amd_dp_dsc: Do not disable DSC for high
 bw panels
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: Fangzhi Zuo <jerry.zuo@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
References: <20260902155742.990457-1-george.zhang@amd.com>
 <09d35970-0397-45b2-8226-f4063fa5a942@amd.com>
Content-Language: en-US
From: George Zhang <george.zhang@amd.com>
In-Reply-To: <09d35970-0397-45b2-8226-f4063fa5a942@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SA1PR12MB6970.namprd12.prod.outlook.com
 (2603:10b6:806:24d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6970:EE_|CH3PR12MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: cd115a88-d842-4acf-9f1f-08df09eff597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|3023799007|11063799006|10067099003|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: RGLIO420Rjhs7x17e+rZZrFqSBID03f1pUVX6GU/PNijZEz8bxTq4iBaoFxjw0waN4hSjMycvC+wdMFRl/qsJVJ9KVa2XAei+SxyHzt2WvBI3N5+mueLze9/RB3jQr+vtgElEbv0KG1IbT1YimSs/W0gTOsJcbelIWnllQCBYTRNkZGy0/agPSta85Gdqz83PGpsesbU1tjx1KKjW8SYgZPRFD2f/96u1eIARD613ZN8FskJFgQix7insW+JxFJnK0oMYONUzN1vl1nvb/5gv8VxQohBNFDOkKOBnTYDku52c4lU4Z0QXet9oBI9usZo4UV/Gij1RUyo6HcLEh4uFC12DPxRZZwBxm7qYSYubiThrXvRLSyYkJWRMWS3wGnawIxKklvUqBRybc2lEoauk/kIr14Tdj4YI12FO47q7SOkYZcWPIYTNNZGeXdgH6LV29gIgpUWDnt4zetgyXxT0EhAXllIH+d/Z7Bhoc1pngaRM6pDEqtToF6ASgN3At+pCjadxk6or+LVsZMoDtEIHafjGAdOqAkIfnODLKjVf9R0mn/7/HEWozEe8v8WJGs+KG7x3t0Y8FMIYfkXfuDWg00ykMjzwhicx37mf8FNG7VvrCfVziurepaFI+iFyiGWONVcKKqrsMZzZw/4+Lsw7Mj56aCGLPU1QxikGEj+Q28=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6970.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1doWUx3MjZmejBQRm1CcVd1M1VxTkZ6SE5ZMHh5NWp2SGdXZzVRYU1RaDB3?=
 =?utf-8?B?NTVBSXorZ1ZERmkzTWcvaGx2QklkaGVtcGZMUkRFOVJHYU5wemNsM2ZZN1Rk?=
 =?utf-8?B?TThiWi80R3Z3UFJtZ1JqakN1VjdUc3lHdFhTTCsySzJIRGkzS212UWdlZk5j?=
 =?utf-8?B?a0tpQ25Ba29vSEtzNlNGRmtvdVRVeGY5N2N3R3JaRERnL3NYZGx6S1gvc1NS?=
 =?utf-8?B?YndXdlR4UFhWUWozNVVlZVhlZGhxMDBsWEZvYU55N2hhUVdtYk9NZk1oNFlN?=
 =?utf-8?B?SjIzcG5XWkhQL0lXYWJRcis2MWVSVCttQkwyMk4zUUE5MlFjR21WZGVIcUJo?=
 =?utf-8?B?NGNFRmIwdVh2OG9iMXBmdHdISG5VN3BkTktMaUVkUmRKSmdFamNzbTBuelFM?=
 =?utf-8?B?eml2RXpsRXl3dFlPMTJJcVNETksxVEI2Y0xDdnd0a1dsbldTUXMzeld6ZTFi?=
 =?utf-8?B?Q282WEpUNzR6bGx1VDFhR1NuOGtyZ2RySFN4dG1PKzFTeGFTMi9BbkJIcjdr?=
 =?utf-8?B?N1dMR243QzVuVUUzUlFYajdPTkxOVitQOFUweVV2aGZicVozMW5uYmxFQk1t?=
 =?utf-8?B?MjBMUlMySm41a0lNT0liSVVRSEJjeGFjVzdOWWJXb3FMeHFqMFdqN2FGQmE3?=
 =?utf-8?B?M1JtS0NqUGFVNHNJSW1Ddm1yZjRwSVZCZVdaRUJKMTh4SVBLd01ETndnNXdL?=
 =?utf-8?B?MHNsdWZrZkRVcGNsZmsrc0pLaS9tMjZWTThXb3ZuNC9nQ2hpenZPMWhuWDNE?=
 =?utf-8?B?YXhYMUpIVnRON3RMZjgvSXhScEtXRUxsTmR1ZWM2amNkSmlFaTNoTFNNTUpY?=
 =?utf-8?B?WnZWR3phQzN5ZTVVUFR2RmJ4YXovQzdHaVhqNDkzNGRob3g2cmpCb1ZPb3lF?=
 =?utf-8?B?VUdtdGhpbHNiMktnTEMxcGQxc2tvdG4ybGM2cDhtNlNOMWdsQkdSYWlBNG9a?=
 =?utf-8?B?WmJmVDd6TGF5S0VkaWZGV3pmR1dtQ2RkeU1nQ0hYL0FtSVdVaXZqN0NDd1ND?=
 =?utf-8?B?Q3dKdCtYckxDdWxUa0FkdmlxckxrWGRtV1JXRW90UHFHNWczNkNTMXRVYTlv?=
 =?utf-8?B?TVc0Z2YzZHJxUTBSZjRpUFlXTGpYUFdxV3MxWTQrOHliMUs4c3p1b0tRdURD?=
 =?utf-8?B?SDZ1VzRYRjhXTXhwNXBwMEJpVzdZMzJCMGJDK0xmVW9vUzQzWTB1S1I0MXZW?=
 =?utf-8?B?RU1vMVZoRWlUR2pJZkJFV2ZQZE9zcjBWQW1iL0dWaHNIYXhjZHJYWjNRR2Q3?=
 =?utf-8?B?emZWdlovSklOZlROMHN0N3IyWHZSeGhKR00zUFZiU3hhbW9OLzJLZmZiWDlh?=
 =?utf-8?B?THNLT3R3b0RYN2t0SGQvUjMzS2RMeFRGSk5JZUNSTGNjeVBmSURtUXhrazUw?=
 =?utf-8?B?OWVIVUlUbVVGRUtIOFNncExVbzZYUkU1VzRNUGo4MVRKemkzMnVvNmIrcFZX?=
 =?utf-8?B?YUNzdGZMK3dCbTcvRnVCRFFab2ZDTjRvKytna0krNzRhU0VsNjBwOWxsaGd5?=
 =?utf-8?B?UndTYk8zT1VHZ05COTJrS1c3OHlsSVVnK3ZXV0o1Q3dmNVJSOGc5elVEL0Uw?=
 =?utf-8?B?ZDBjRHNmcW10b0hxS2k0S1J3S1l3WkYzWWFTMG14OElhc29RVTJ1WHB5djBU?=
 =?utf-8?B?YWI0d1JoWk8yR3hrOXl0NkUycFdEVmFSQ2g1cFdKS2xMNUV6OXZHYzlXc0c2?=
 =?utf-8?B?S3N3bjcvWTlISXlLejZQWTNWclRrb01xUU1ZZnZvZUR1aTRyVzNzT1dxY01E?=
 =?utf-8?B?bDEvTmZtekl3V1d4b3pZT2dsdWM5T2R2aHIrNEsrT0VZM3YwZ05OR2lqYmw1?=
 =?utf-8?B?MU5HWnpCWjZCQUZTMEdLNEJVNTBlTzFaK0cyRGYyZmRsTFMwU2Y2K0RvQjdJ?=
 =?utf-8?B?TDZWS3pqZ3JEckcxcWZxL2t1eFJDdHI2R0VpYkxqQXF0djNuYytEcjhNV282?=
 =?utf-8?B?TjBWbVg1VlBDZXpJR2phKzY5cW5VVW4rNGtrMkpoaW0vdm94Y1JWK0tPUm1Z?=
 =?utf-8?B?SmY2LzlPQ25FK1gxcW1TMUkxN0ZJdTI4bXFTUlBJVUZ5TldsakdBQWtIQjVW?=
 =?utf-8?B?NDBwaGt2QjVaZEtQaDlYNUhZS2FjY3lIQUpoT21Vb29lT0x5cStnZzcwWnUy?=
 =?utf-8?B?dGlCU1dJSkJBQ01IWVVEVXRtQVgrYm9mSE1sMUIzTWhDY0FsYTlXK2FEVGtu?=
 =?utf-8?B?Ty9OYjdLT3l6azNja0NIZWMzOWRMZFJ1dnUwOHVaN0Y5Q2c5SnVPcjJaRGc3?=
 =?utf-8?B?ZGRlWldyUWhldXViRk5jV2FGblh4alZJNzEvTmpDcnBWYyszT05Bazk5ZjEw?=
 =?utf-8?B?c3Jvem56bHkreFp0cUpHLzh1ZXZmM01rYjk4SGlKdTVIQmRlNHJNdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd115a88-d842-4acf-9f1f-08df09eff597
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6970.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:17:13.3846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6YglTJz20xLpylJRTL+fkQW6Tbttx8eMOQgKFAzxYwwrt1yFaLjWsj8nw2rr+KmvZc2BpeVCwBNha6TFHRidg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8209
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



On 9/3/26 14:29, Alex Hung wrote:
> 
> 
> On 9/2/26 09:57, George Zhang wrote:
>> The test previously attempted to disable DSC even on high bandwidth
>> panels. This would erroneously fail the dsc_enable test even though DSC
>> is on.
>>
>> Fix this by checking what mode the panel defaults to when set to
>> automatic. If DSC is on, then do not attempt to force it off later.
> 
> Doesn't high bandwidth panel need DSC off? How is a high bandwidth panel 
> expected to behave?

For a high bandwidth panel (4k240 for example), DSC cannot be off, 
otherwise the panel will be starved of data and go dark.

I'll follow up with a v2 to fix the issue in this series

Thanks,
George

> 
>>
>> Signed-off-by: George Zhang <george.zhang@amd.com>
>> ---
>>   tests/amdgpu/amd_dp_dsc.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
>> index dc71e903e..ccaf64c66 100644
>> --- a/tests/amdgpu/amd_dp_dsc.c
>> +++ b/tests/amdgpu/amd_dp_dsc.c
>> @@ -137,6 +137,9 @@ static void test_dsc_enable(data_t *data)
>>           igt_output_set_crtc(output,
>>                       crtc);
>>           igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
>> +
>> +        /* Make sure we are in automatic mode before we start*/
> Add a space after start, i.e., "start */"
> 
>> +        igt_amd_write_dsc_clock_en(data->fd, output->name, 
>> DSC_AUTOMATIC);
>>           igt_display_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>>
>>           test_conn_cnt++;
>> @@ -154,7 +157,9 @@ static void test_dsc_enable(data_t *data)
>>           dsc_on = igt_amd_read_dsc_clock_status(data->fd, output- 
>> >name) == 1;
>>
>>           /* Revert DSC to automatic state */
>> -        igt_amd_write_dsc_clock_en(data->fd, output->name, 
>> DSC_FORCE_OFF);
>> +        if (!dsc_before)
>> +            /* We can only force off if the panel allows it. If DSC 
>> was on in automatic mode, we cannot force it off. */
> Break this one-line comment to multiple lines, and place it before "if 
> (!dsc_before)"
> 
>> +            igt_amd_write_dsc_clock_en(data->fd, output->name, 
>> DSC_FORCE_OFF);
>>
>>           igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
>>           igt_display_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> @@ -286,6 +291,7 @@ static void 
>> test_dsc_slice_dimensions_change(data_t *data)
>>           igt_output_set_crtc(output,
>>                       crtc);
>>           igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
>> +        igt_amd_write_dsc_clock_en(data->fd, output->name, 
>> DSC_AUTOMATIC);
>>           igt_display_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>>
>>           test_conn_cnt++;
>> @@ -317,7 +323,8 @@ static void 
>> test_dsc_slice_dimensions_change(data_t *data)
>>           }
>>
>>           /* Force disable DSC */
> Please update this comment too.
> 
>> -        igt_amd_write_dsc_clock_en(data->fd, output->name, 
>> DSC_FORCE_OFF);
>> +        if (!dsc_before)
>> +            igt_amd_write_dsc_clock_en(data->fd, output->name, 
>> DSC_FORCE_OFF);
>>
>>           igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
>>           igt_display_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> -- 
>> 2.55.0
> 

