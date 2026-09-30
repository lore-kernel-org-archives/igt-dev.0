Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDF4CA5FC4
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 17:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D20010F1F3;
	Wed, 30 Sep 2026 17:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ud00RzBI";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013027.outbound.protection.outlook.com
 [40.107.201.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBD710F1F3
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 17:34:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5Ip9i7Oh+zE2W933Y5gj/KN72C/VvLAx6fKBJb7FVF6fNInCZI976ar1UtCCAw6S2WGQlZiMTeZzuO57y/h88yLH+1UuSz2fT69gDgnZP5+PQv8jo8K+z+uTKKL1mYVpkuB3TGCYsrYptb4d7MSZJxqTYGX+Q8Mmv2TqsWq3l9OQwgYBrG7V0hj1xvH4rfS4Vum1mHYSnVKDfMm4Sd1aWx/szAlQRPrig0+J9gKNTuNmZD2mxtpMtL43TAitahGBRIW8nieSJ0XvkA0IqHnBMuHt78VRNKXkIu9UC1ih8Si7M6NtOalaoFudtiYbhx9IfcGF+PyOcbiImU709ooMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDucsCMInlrNaTRk1aaBOaowk1I65WwNCb89g0urjA0=;
 b=Pt/UJBigEP03XxaZ2w4RW1QCCkcOpoCgVkbDhFcINqC6pPndesfzljHpUjM+dE1FL7eW2FWUeUq8fv8Hzbw6RY1zN85P/OWMkWEz3OKCcL7Rcas8Y5+B7KT8igvCXeJ0j16e0LiFs/bIjzDWD9tR5MlQAUti16ws3QfZarGRaZpguBvy+CaNji2/TatQ1w5fTMu6rJBQ+Y+VdSn2KALZPmAJ3ZIcwMZj2PxKvFismp2O0Pd+Fq1+R8VQ7q7owbK9HY4O8YDnXz8dT9Zc4pkDoZlldVU2O/kJrn3xjiHBfCN4vRO2f8VrhQavHh6eTLyrrAVTfgwGGzZ1/xvmvgAOCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDucsCMInlrNaTRk1aaBOaowk1I65WwNCb89g0urjA0=;
 b=ud00RzBI4zULkVI9rBbThDottbzjT3ozFQeR8G7/XfU+zahNThg5VKXNbgEShJbvynIcr+3BPWje1PEEkRytlKFjL7hLSrLRlLHqbxfCCtHBclyLwFb4NlLYOLfIS53pwqOgFHo8qDb9w9tc0STG/tgg20LC8tr5ah8bm/yLiWY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by CH3PR12MB8185.namprd12.prod.outlook.com (2603:10b6:610:123::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 17:34:00 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 17:33:59 +0000
Message-ID: <9a9080bd-a119-45b1-901b-cbce1e2d8f3e@amd.com>
Date: Wed, 30 Sep 2026 13:33:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/3] include/drm-uapi/amdgpu: add queue id to
 user queue wait IOCTL
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260924075300.172142-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260924075300.172142-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::18) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|CH3PR12MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: c718376d-2f99-4b74-fd67-08df1f1902ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xx8rTAPgd2OrltTr7xdBzPnvzpA+Zp5g+NFn8CTzlJFvZHVoi2HZKOWQfv0h4DWYe+p471v+H1a+DZdlrCGrx5H64aST1NgdJ9mTBsrzvQ2NS9yRivUglPugces3qrWIqk3bYEQnVMhYh+lwVdN3eSUI2ASCn9lx4mWPNeDpmYqqHl1n8WG8Xv5wDVIfRoXzcmTyCf1ZZqQ9PoUCTwldNDHwEnhxyssnD1PNpqmts3rYWnOsr89/EmkqVxLW6J11RIod6mrndKe0V+LQfQgJdlq1yA30RwcfjJkZmXR36I0Uv4OfrbYZp/mDnwsFJvxd152HTnDw6l5xUEGc92Uj4JGLT6ZqCH9vaTJEJpwTdviOLMnHpnfsz0yAmpTu/+Twv+Q44vgT+RAtbRNTCS2HwCUyjFE72HFRuOnC+56Kl9UQQsV6fYwOgtlpCQ5HUE356bT20yTZ6nQpetJsEioAIVJbwYJl7d2ISe5WnGlwLiC4rmfnX4/Ob/Cmgv2iHTUWdGlwDEYWc1dXEv/i85SkiqC0MVwYR2XYr9BERd6YqFRclZQhIXBufgR/DjiR8Z9ythzPQYUyGszLtaTRHQxikBMUn4+4Gj+edrksVob7O8hFSf5RVTArFm5jLkmQNZGG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1RzNDM5ajZsK2QwMmNnb05Bb0NRc2czNVZyVm5vMndwR0tzQ2dKZStqNTVY?=
 =?utf-8?B?TXpCVjdrbE5nb0NKMzZvWUdNUGZpNDVUVzdhSGs2R1RXK3d1TlZCODZxN1h4?=
 =?utf-8?B?WkwxOFdkRkdkZVdZVTFQbHdTUkZqWjhtWjFvTnE5MTlFaWpuaGFrWU5GUFRn?=
 =?utf-8?B?aHRTUGJhSmg0OFVxQUsxMWxYQ2NsdTByK0JUb2pFMkJvZUJUZWV6WTJ3VjJs?=
 =?utf-8?B?M3pOSnpBcE56bnFyY29wSVhWUk1TUk1TcWxnRjF2ZlQyMGd2OEdBMGVOWWZt?=
 =?utf-8?B?MHNtSnM4RmhPbUpqTXA1MDJTbnB0K2ErbkdPYVREVXM4a09qYVcwcHlnWVdX?=
 =?utf-8?B?MFYwRG9WOUJXMjBHaHkxa1UrNU9rRVpmY293bEcyN090TlNGRlR2MmFXYWY2?=
 =?utf-8?B?MFllLzJrTVMzL2Yyc2tUSWh2MWtybzVhZXc2M2xVRkZvQXF2VjdMVlFORWFP?=
 =?utf-8?B?dE1wNHdxSS9uSWgwSnFSQkJRMFFvNlppK1crM3VqN0tJcVZpT3FQcnQ2eVVr?=
 =?utf-8?B?QUhlNDVEY1ViQVNIdU01K1ZPUUYwOEFtc0J6ajdERk93ME16UjRaZXRnMkpv?=
 =?utf-8?B?bGYyZ25zSHRhY1h3YTBBeUE3MWhqNUh1ZlBpd1FwZnNJRk5IZjYyaUxGZ1FF?=
 =?utf-8?B?eit6eTRJbmswUWE0YU5qejFMQlV1eERBZDRuTVBJVHlnWmhsanN5d3JpT3NX?=
 =?utf-8?B?RXVzbTN5Y2hGOVRrWTE5NDdETDZ3U292VVRkT0VaTS9TTm92TnMxeWZlUnlC?=
 =?utf-8?B?c1ZJRmVBQ0R5bmQrbWorZGd2TnRnNHEyRWswUXE0d0g3SzRvRzNPeWs3QkZW?=
 =?utf-8?B?VWpOSGhKbnV6TVpSYzhyVkFHRzZzTHJGeDByVHF0aHRjVktzWVlFQ1AwNVN0?=
 =?utf-8?B?OUIvVnZuOVMwVEFwTWl1bU80ZWYxcE4wSDFIdXpXNWFyWkxiRkpENWoyRHpW?=
 =?utf-8?B?U1MvZjZSYW82ZjlCRVJ6TklGZDFVVHp1VGk0NHdOellFZ0xRb0JOUzBKVER5?=
 =?utf-8?B?cS9ieThKQzRKbFpkQTRwVllxVEV2cDZjZzlzRU9HQkNqMHp0RnZsT3NYZVB6?=
 =?utf-8?B?V2l2U1ZpZ091b1JJdXNKZEEzK0RQbkZHOWhjcG9sMzV0WUFheTlRbDVsRmZO?=
 =?utf-8?B?M1pZekt1akk3dWl3cDdnTnZFb3dFUjhBMEI2QlVpZ3hQMDVwdlNaWDF3Nlll?=
 =?utf-8?B?RVc4TWVQcHBkM2E2SnFweFpVdmVLSlQyWkdTbTQxMlN5dmtOZjk3MlQ1YkFp?=
 =?utf-8?B?d2l5SWpQU00xNytXZzZtbUlkS0s0VUNLbno0QjhhR0RNMmI0eEdpaGVvNlVk?=
 =?utf-8?B?U3NrQno3UmtWWDdZSmptLzhlYUwvNVNEbXhuVWtmalloNkNLVFRRY3MraXo5?=
 =?utf-8?B?NlBBZnd5cTUzVko2ZUovaWgrOWcrSlRQSzJwODNPd3RPb0hGR2R1ZHBtQ1lD?=
 =?utf-8?B?VkFnc1NBamx0Q2VxZmM2U3RjVVA5TW9rUFltSG44bXAyTmlxSGFPdDhWaEhw?=
 =?utf-8?B?TVFsakgzbjc5M3RvdXhONU0vcHBsbnExWUZxUzlPdWtiUStWTVBTVUR6SUYr?=
 =?utf-8?B?S0Y3b0VRaW9nelFBcHNReVl5MS83WllqZUhVNlhtbTUrbDN4TmVBTUdwd0JQ?=
 =?utf-8?B?ZktmS2pkV1piN0Y5VjU0ZGVHK0VqUitaMDZRdTRQVWl1eFlxQ1ZLVGZKdndp?=
 =?utf-8?B?Q0pOWXEzSUhDQmt2SjU1b2FEUHNVNmJSU1NVdU42eVFucnR6RUlaa0hxTktk?=
 =?utf-8?B?RDVMQ0JRVDJOd0FLd1pFVGdId2x3cmhYT2c4ekpQNlY4MzhuN0NtWUQwMENh?=
 =?utf-8?B?clhJMkRjV2QrZEtJTnoxR0Z2MW43MFdtZ0srM3B3TnhPSjV1QlJ5QjlaRlNk?=
 =?utf-8?B?TjU0RlpHNGFNcGw5SllkMDYyNTNGcTR2V3BWYUcySm9XWlBjcFhZbzVuMFJD?=
 =?utf-8?B?ajRHeFFnVE9XZExJSWpVdkVuOFU1SUF6WGFTUnBLcmV3VlpPRXM2RTJhN0Nx?=
 =?utf-8?B?N25lSUxnODVxR1BXdDYxTk1GWUhPMHVNSnRNdnZRUXNJOHMrM3lNZW0vZ3ZN?=
 =?utf-8?B?c1dyQnh5dW1abStDRGlja2hJdHVpV0p2UkhPc2p6eDZrY0ZXK056MUZsVFdq?=
 =?utf-8?B?dlZKODRuRjkvR3RwaUpOKzE4bjEwMzlEMFViaXJnVzJBOFRaU1dUazhFN2lw?=
 =?utf-8?B?YzVhcU9OV3lPajdobzVKTGVZUDVwbHB4dlpHSS9YKy9GVXBBYU5DYXNqblBV?=
 =?utf-8?B?VG55eTA1bzArMWpoL0tFSjVSQzZtNkN3MFpwYkdaRUoxZUQ3ajYrakNRVzhq?=
 =?utf-8?B?ekhybXhNSGtHMWJVN0RURGxxYk9lUTl5cHBxWk01Rm5PUlJ4MHRNUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c718376d-2f99-4b74-fd67-08df1f1902ee
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:33:59.6502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNFd1ns9/LwSXiNQoKLvidmE5d4HQq6l/FixRXrvhrzM2UKJfExwii58LRRP6HO61eQe7k8z6ELto8lo7YJUQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8185
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

LGTM all 3 patches, reviewed-by : Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2026-09-24 03:51, Jesse Zhang wrote:
> Add waitq_id (plus padding) to the front of struct drm_amdgpu_userq_wait
> to match the kernel/libdrm uAPI. The wait IOCTL uses the queue id to
> retrieve the wait user queue and maintain the fence driver references in
> it, so that queues in the same context release their fence-driver
> references before queue destruction.
>
> Mirrors the libdrm change "amdgpu: Add queue id support to the user
> queue wait IOCTL" by Arunpravin Paneer Selvam:
>   https://gitlab.freedesktop.org/mesa/libdrm/-/commit/15e174c1ed2426be3228eb595f942481cfcf5a90
>
> v2: delete change-id
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> Co-Authored-By: Claude <noreply@anthropic.com>
> ---
>  include/drm-uapi/amdgpu_drm.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index ca24519c7..321f374d4 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -511,6 +511,12 @@ struct drm_amdgpu_userq_fence_info {
>  };
>  
>  struct drm_amdgpu_userq_wait {
> +	/**
> +	 * @waitq_id: Queue handle used by the userq wait IOCTL to retrieve the
> +	 * wait queue and maintain the fence driver references in it.
> +	 */
> +	__u32	waitq_id;
> +	__u32	pad;
>  	/**
>  	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
>  	 * job to get the va/value pairs.
