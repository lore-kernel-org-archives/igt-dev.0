Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C7ECD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 17:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D439410E4BD;
	Thu, 21 May 2026 17:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GStvMuO1";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C9110E4BD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 17:12:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQRq5cgg+FWaiseUZ1EpgUc6cIx1Tq3AAkJIqSw8tdSwMypoI2a+pT3KA2tl4YaJVntLXE2kHKBECgUqdLb8NlXxEtJkcwEbvEtmCuL+rVseSeyyLEUq58CSkSyiAsrnI8nLQaVif1ejFrg0+5P4hNGQzCX8i3RTjALdbJFqc58rnf8F/Av9mSa2UfHK4WgJ0A3cXRTdIGY3xIw/tfKBAVJVSh+iWIR8LPPogVXDj8bj5p8ur8FlSTWdmcb6EZL6tzYxqmLQzN5uqkXrqN5xyx1cNgyEAA380qKpgKfRPIHYro04XMWOZwIzendJfuInulsCS+VM4yOiVjyRyjTl8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDxtOARWz/L67lIKZDK58pFE2rOfCNBfLgJ97gP4WMw=;
 b=dcb0Ks48Spu/VdvlNLnKwKAtWLveiba+m858JtzEmq4CSkzEUIqjTS446FyKOHL+mM/LvsZp4YAMM7cYbpro54QjewnB2pcvhaVTh8FSkYyjRozlHilW2hld5vXnbTHVVAcTFSaB2LfHVVizuz1K0/00t0B5Kp6gE13w6T8Pj4D46GNeCaygOv4GKoUV/A9fUWwKHYIU6PJXEqiJvGJ1RcPq+pH5/JtN14iDwCGqoXdvPyLqVQTX924ILm3V3u6jezdGWxIcIhjUftqN9OhX65mzCvv6UI6W+u6tSCJAgg0if7SZWDe4Is6pmKVeRv82+i/OjfUu6jl/em/BYTDgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDxtOARWz/L67lIKZDK58pFE2rOfCNBfLgJ97gP4WMw=;
 b=GStvMuO1NnkXJgCnKSjl7K7UvLd98MxwVzYppdII+RL/FSsZ9YqBxf19VKowQPm85XySSQZTOABLf6EkCmx5qPwYbC4QtYXQnFw+3FmtZyoGkOfAzbN/cA27EEznGr+p4cYEFKneFWVwUeQm1mHRFHoNqtXDLUTfq9iqj9z0CDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA1PR12MB6945.namprd12.prod.outlook.com (2603:10b6:806:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 17:12:45 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 17:12:45 +0000
Message-ID: <21dee5d9-0735-4ea6-a666-ecb2a45732ce@amd.com>
Date: Thu, 21 May 2026 11:12:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/: Handle max bpc read failures explicitly
To: vitaly prosyak <vprosyak@amd.com>, Karthik B S <karthik.b.s@intel.com>,
 Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: sameer.lattannavar@intel.com, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260518040353.212734-1-pranay.samala@intel.com>
 <20260518040353.212734-4-pranay.samala@intel.com>
 <005eb05d-d1df-4e2c-a034-657f608d3809@intel.com>
 <38aa81a5-5acf-4ca0-a297-69b476b78bff@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <38aa81a5-5acf-4ca0-a297-69b476b78bff@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0042.namprd04.prod.outlook.com
 (2603:10b6:303:6a::17) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA1PR12MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 166dfc4d-9294-471c-565a-08deb75c2d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|5023799004|11063799006|3023799007|6133799003|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Hwa2/T3JzFUs8hZo+D77kfqix/XRUEXjpdkjnG83YvZGCWC+gXAzDhjw+kuZiEVFoN6N+SyRi92wxR2Gc43kf0hjSyevpEmQV3MHCqAXtMXr8wiJIPo1GVtTGYMgN3bjD58kzo4x6nTSgxCj3cVUjs1dqJyeEkAFfF7KvMPO6jtvfhNxJWijZwda7qNY4QYHWN0j9cKwI2Tez3OAXUrWQ1LhwyJdsWRtR2QWYlhqJ4hGJZN9elPSzRn3U3tT1HBaAIVPGXEX6CmMUbedBqPQfU1B+/5qHCEG1id2SumifnCCBTSo6jMaPhsL62JzKYzK6n3IoTEwpPXE8iNv1WmSXSsiPOPTh5K148jhYZ65TMRoXSvoDPF4VXv+7bqajELSBOYoE3pbvYCbwuBGcsOkaqF1J/kgk4r32rQRrmMJ8lZU2iF38hP59bwBAT2h3sbZdfufDMm/FjmtRofwTVwwufksjGPvs9pkuCsIw10ujIIgdzCfgXnInDuPcxm5lhZo4t1gLubnSUDzJFYXXwb4zlCo+UXq/VALTUJl/qt5VI6GM4d6glL4LrUI2MHU1ikudE9MHoAp1XWUN06FHg+n+C3+RwdUWthZ4GUFfKKbdN+e7jczKLDZL781kJN1HO8ArpMznZBwEhfKS+6ywRdMn7GuwJdKFET9VmLrLtm0EP5JUxYosLtgnZuc4jnRwUM0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(5023799004)(11063799006)(3023799007)(6133799003)(4143699003)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUFpWm0yTFk5OG9BdmlLZ3pIa2VIN1h5K3FaR1J0NHJTamtrWDJtMGtwTU9I?=
 =?utf-8?B?NWtOTlVSc2Q2aUp3WXFvNml6bVVGcjhJdjFkUnRkNmtXTjM0R3RicGFEYlB1?=
 =?utf-8?B?ZXJQRWtjT3AxV0dCTUlBT3FiOFpsYWZETmFSS3BpeGZzRDd2aERhVW51cjFz?=
 =?utf-8?B?VHRkRTEyS1BqZ3JBb1FiaXRwQTlyV3VGTHdySU5BcHcwbTV2dTA3NmYzRTBR?=
 =?utf-8?B?TWtsYmdwL1paNmRGSEljM0MvdG1oNk00UVJ2UjRZWS81aVg4WHN3STUrMVlK?=
 =?utf-8?B?OFdiRXJUcmRFYUszdlJXNlQ4UEsySmljenZxZXZRNWd1SjlhK2tCN3AxK1Bs?=
 =?utf-8?B?WUhVWXlRWUlpRWFVVFNtcEtmalJ0amM0SVBIc3pIYWtURzVnM3RGaUVVRzlx?=
 =?utf-8?B?MzI4MnYyd2EvVFMweUVaWVFsZWdFRGZtVGU5S0lyMjBOS3ZKbG5ZamJZaEdK?=
 =?utf-8?B?aitMRkZSbHdZMkNWT3lQeXFkQlkwTFlta2JpbXRWUEg1NnhOQmZBaURidTdi?=
 =?utf-8?B?OEtPcGo2Q3ZjZE9XTVBLdXlFZld4TWozQlF0UmVVcG5McmxUWWxuRXhZSWZw?=
 =?utf-8?B?bkdEK0lRQ3MzTHlTUm55bGVMeVVWUXdwQVUwZkl5Vyt2cmVLOThOd3JKS0xY?=
 =?utf-8?B?OTlLZ3dzZFN0YmtTbXZ6aURDZmdFdDJvcWRMMEhLQTgySXRXREE3ckhLSis4?=
 =?utf-8?B?V28rOWFDdWw1RlJXM2ozV3d6VlZONHp1QjZuREpjczVjM2Q1WlRQdzVmN1h6?=
 =?utf-8?B?L1E3V1F5WG1ib3hOVnpFMmduTkluejJBUlFVWFZnRDlFV05TSjY1a3BaUGJW?=
 =?utf-8?B?NEtJVWpvaDdYWGJYWE1RSXlxdGtadEZ2QTBrWUh1cUxGK09pQkdvUUhpZ0ls?=
 =?utf-8?B?L1R3Zm5hMTZOaCtUWmtPS3JGSmZYN2xnWWVhQzR0VytLVEMwSU5EVEUxN09C?=
 =?utf-8?B?SVNVdVdCeGNuUThOTHNUOGg3K1FpQkg3OTlOUm41R3d2blphS3R6L2txdzNS?=
 =?utf-8?B?Mnc0ZTJqY2lSK1pLRHVNSzduZUZvenlwTlU0VnBwWVFlL0FtSHhBaU9hbG9D?=
 =?utf-8?B?QTdQa0NkcFVidG1JRGhubGo5MHdvTjNsUmp5WU1Eek56dDZxY0N1eCtQVlBx?=
 =?utf-8?B?TXpjaUhPWHBTZEtSa2tUZ0ZONDR5aWxEQmlUeHZNbVVzN05wQ2F1SDhwTFFK?=
 =?utf-8?B?NGtUaGYzUHNidW5mS0RQMDJhQXh3MHNyd2VRYStleGxMeGEzL2lyL3FTcm1H?=
 =?utf-8?B?K015VW4rdVJod29IL0syb1JzcDBlUFhLVmRBU3VUaGRrTDB0R1ZCeEJ5T0Iw?=
 =?utf-8?B?TFFMT1V4Tm5JYzJNTWtYTXQyNm1yVHZQaXhadWU1M244ZGJtK2Z4dGF4Szds?=
 =?utf-8?B?aDZ1dFRpcmFqV01vV1lmb2ZUNHFUZGhBRStQYWRRMEc3eS9kNGZLNmNZc3dt?=
 =?utf-8?B?V01OK2tDeXhkMUhiTTFMMXhtRysyRGpkUkpPTUswVEZiaFZ5SHJLK2VSUHd0?=
 =?utf-8?B?azZuRDFDS3JQazdKY1lqV0s0aXZRVklQcklPZ0J0WlM3Vmsvc3ZxaHdIV0k3?=
 =?utf-8?B?M2xURW12bU00VUZaSE1HWDJKeXNiNVcxUXB0TnhWM3FJdDlsc2RGUk5LZVp1?=
 =?utf-8?B?VTlCYW9iSUFGUFgzM3ZCeGhrU1FsS1dDaFFycFMwdDdNR3hzVDhxdlBFbnND?=
 =?utf-8?B?RUFZOHlraUYvMy9penZ2NW5kS1hqc2RUZTlQT0xyM2NIdHZxelVSZXNXNVYw?=
 =?utf-8?B?Z3JqUDJyTzF6bnNyZWdHMm9zMHZJbGRiUE4yUDF4TXpUZG5hZWtCbWwrUDBL?=
 =?utf-8?B?T0xTSHV3T1JvcStJdGxaVE10SzNFbTJ0UytJT1ZiTXE0aVI2RENmSjBLSGJ6?=
 =?utf-8?B?b3FoTlRIME8rMXo3MlZqeEhKd01hNy8rc0pxNUtIWmpyWDZIVGw4UFExbmhN?=
 =?utf-8?B?U05mWlQwR3JYZy9LQXFhc1h3NDUyWlJicjd6N1VaK3hlM1J0TEZjZ1Y0ZHBP?=
 =?utf-8?B?VEFVMFVhUkNkeHhpZS9tTGJWUm4rMldhYkNFMGxKb1RwR09ucktESU5TMzFv?=
 =?utf-8?B?RlBZRjVrekNwQXVibUI0VkExam0wY3VIZmpvRVRVT1ZZMjNUQkpDUUJPcDhw?=
 =?utf-8?B?aVpPYnc5NklZQkUzSzVGVXhZbkd6dU1jYXF2WVVpVUt6T09Kdk5VQ2dnQXNU?=
 =?utf-8?B?dllQODBXaWpNanp3NlNFMWRTVVEycjhxVWJiSVpUdytsNnpWeXhKSmdMZ3Nz?=
 =?utf-8?B?ZkFRanp5TFNjL3JFc0RwbkpFYXVjY0NNOE1iQksvMURhS01YMkdCVEFZb3NJ?=
 =?utf-8?Q?TxgbdAnLnPvhOXnzS4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166dfc4d-9294-471c-565a-08deb75c2d05
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 17:12:45.4899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVNtZhVgAkJrNfm3Z+EzBI98yvHglbtx94GG/1JokyGZN4A0syIPw3mGT8QQPtbP0E4WIOjusVXoImXArxQLWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6945
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



On 5/21/26 09:54, vitaly prosyak wrote:
> 
> On 2026-05-20 01:04, Karthik B S wrote:
>> Hi Pranay,
>>
>> +cc Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> @Vitaly: Please take a look from the amd tests POV.
> 
> 
> Added Alex Hung
> 
> Agree with Karthik  patches 1 and 2 must be squashed. If patch 1 changes the igt_get_output_max_bpc() signature (adding the unsigned int * out-param and changing return type to bool), then all callers in patch 2 won't compile at the patch-1 boundary, breaking git bisect.

Did you mean patch 2 & 3?

LGTM too When patches are squashed,

> 
> Overall: LGTM for the AMD test files. The error handling is sensible and the transformation is mechanical/correct.
> 
> Thanks, Vitaly
> 
>>
>> The patch LGTM in general, other than the fact that this patch needs to
>> be combined with patch 2 to avoid compilation failure there.
>>
>> Regards,
>> Karthik.B.S
>>
>> On 5/18/2026 9:33 AM, Pranay Samala wrote:
>>> Update test call sites of igt_get_output_max_bpc() to use the boolean
>>> return API so each test can decide how to handle max-bpc read failures.
>>> This separates read/parsing failures from capability checks and allows
>>> the test to make an explicit skip/continue decision with clearer logging,
>>> while keeping normal capability validation unchanged when max bpc is
>>> read successfully.
>>>
>>> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
>>> ---
>>>    tests/amdgpu/amd_bypass.c              |  6 +++++-
>>>    tests/amdgpu/amd_dp_dsc.c              | 10 +++++++++-
>>>    tests/intel/kms_dsc.c                  | 13 +++++++++++--
>>>    tests/intel/kms_frontbuffer_tracking.c | 10 +++++++++-
>>>    tests/kms_color_helper.c               |  5 ++++-
>>>    tests/kms_dither.c                     |  9 ++++++++-
>>>    tests/kms_hdr.c                        | 16 ++++++++++++++--
>>>    7 files changed, 60 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
>>> index 3c537ea9e..e59691f16 100644
>>> --- a/tests/amdgpu/amd_bypass.c
>>> +++ b/tests/amdgpu/amd_bypass.c
>>> @@ -323,6 +323,7 @@ static void bypass_8bpc_test(data_t *data)
>>>    	igt_display_t *display = &data->display;
>>>    	igt_fb_t fb;
>>>    	enum pattern ptn;
>>> +	unsigned int maximum;
>>>    
>>>    	test_init(data);
>>>    
>>> @@ -345,7 +346,10 @@ static void bypass_8bpc_test(data_t *data)
>>>    	 * Rx supports only up to 6bpc, Rx-crc will different from crtc-crc
>>>    	 * with 8bpc.
>>>    	 */
>>> -	igt_skip_on_f(igt_get_output_max_bpc(data->output) <= 6,
>>> +	igt_skip_on_f(!igt_get_output_max_bpc(data->output, &maximum),
>>> +		      "Failed to read max bpc for %s\n", igt_output_name(data->output));
>>> +
>>> +	igt_skip_on_f(maximum <= 6,
>>>    		      "check /sys/kernel/debug/dri/0/eDP-1 (connector)/output_bpc\n");
>>>    
>>>    	igt_create_fb(data->drm_fd, data->width, data->height,
>>> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
>>> index 1742c7df4..dc71e903e 100644
>>> --- a/tests/amdgpu/amd_dp_dsc.c
>>> +++ b/tests/amdgpu/amd_dp_dsc.c
>>> @@ -480,11 +480,19 @@ static void test_dsc_bpc(data_t *data)
>>>    
>>>    	/* Find max supported bpc */
>>>    	for_each_crtc(&data->display, crtc) {
>>> +		unsigned int maximum;
>>> +
>>>    		output = data->output[crtc->crtc_index];
>>>    		if (!output || !igt_output_is_connected(output))
>>>    			continue;
>>>    		igt_info("Checking bpc support of conn %s\n", output->name);
>>> -		max_supported_bpc[crtc->crtc_index] = igt_get_output_max_bpc(output);
>>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>>> +			igt_info("Failed to read max bpc for conn %s\n", output->name);
>>> +			max_supported_bpc[crtc->crtc_index] = 0;
>>> +			continue;
>>> +		}
>>> +
>>> +		max_supported_bpc[crtc->crtc_index] = maximum;
>>>    	}
>>>    
>>>    	/* Setup all outputs */
>>> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
>>> index 605ad2d5c..8008fc045 100644
>>> --- a/tests/intel/kms_dsc.c
>>> +++ b/tests/intel/kms_dsc.c
>>> @@ -265,6 +265,8 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>>>    	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>>>    
>>>    	for_each_crtc_with_valid_output(display, crtc, output) {
>>> +		unsigned int maximum;
>>> +
>>>    		data->output_format = output_format;
>>>    		data->plane_format = plane_format;
>>>    		data->input_bpc = bpc;
>>> @@ -275,8 +277,15 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>>>    		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
>>>    			continue;
>>>    
>>> -		if (igt_get_output_max_bpc(output) < MIN_DSC_BPC) {
>>> -			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
>>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>>> +			igt_info("Output %s: Failed to read max bpc\n",
>>> +				 igt_output_name(data->output));
>>> +			continue;
>>> +		}
>>> +
>>> +		if (maximum < MIN_DSC_BPC) {
>>> +			igt_info("Output %s doesn't support min %d-bpc\n",
>>> +				 igt_output_name(data->output), MIN_DSC_BPC);
>>>    			continue;
>>>    		}
>>>    
>>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>>> index e7bb3fa18..996a67ee6 100644
>>> --- a/tests/intel/kms_frontbuffer_tracking.c
>>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>>> @@ -2777,6 +2777,8 @@ static void setup_drrs(void)
>>>    
>>>    static void setup_hdr(void)
>>>    {
>>> +	unsigned int maximum;
>>> +
>>>    	if (!igt_output_has_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>>>    	    !igt_output_get_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>>>    	    !igt_output_supports_hdr(prim_mode_params.output)) {
>>> @@ -2790,7 +2792,13 @@ static void setup_hdr(void)
>>>    		return;
>>>    	}
>>>    
>>> -	if (igt_get_output_max_bpc(prim_mode_params.output) < 10) {
>>> +	if (!igt_get_output_max_bpc(prim_mode_params.output, &maximum)) {
>>> +		igt_info("Can't test HDR: Failed to read max bpc for %s.\n",
>>> +			 igt_output_name(prim_mode_params.output));
>>> +		return;
>>> +	}
>>> +
>>> +	if (maximum < 10) {
>>>    		igt_info("Can't test HDR: %s doesn't support 10 bpc.\n", igt_output_name(prim_mode_params.output));
>>>    		return;
>>>    	}
>>> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
>>> index 24663444a..a50ac3a37 100644
>>> --- a/tests/kms_color_helper.c
>>> +++ b/tests/kms_color_helper.c
>>> @@ -40,7 +40,10 @@ bool crtc_output_combo_valid(data_t *data, igt_crtc_t *crtc)
>>>    bool
>>>    panel_supports_deep_color(igt_output_t *output)
>>>    {
>>> -	unsigned int maximum = igt_get_output_max_bpc(output);
>>> +	unsigned int maximum;
>>> +
>>> +	if (!igt_get_output_max_bpc(output, &maximum))
>>> +		return false;
>>>    
>>>    	igt_info("Max supported bit depth: %d\n", maximum);
>>>    
>>> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
>>> index ca367db61..236e5c7c0 100644
>>> --- a/tests/kms_dither.c
>>> +++ b/tests/kms_dither.c
>>> @@ -206,6 +206,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>>>    
>>>    	for_each_connected_output(display, output) {
>>>    		igt_crtc_t *crtc;
>>> +		unsigned int maximum;
>>>    
>>>    		if (!is_supported(output)) {
>>>    			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
>>> @@ -213,7 +214,13 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>>>    			continue;
>>>    		}
>>>    
>>> -		if (igt_get_output_max_bpc(output) < output_bpc) {
>>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>>> +			igt_info("Output %s: Failed to read max bpc.\n",
>>> +				 igt_output_name(output));
>>> +			continue;
>>> +		}
>>> +
>>> +		if (maximum < output_bpc) {
>>>    			igt_info("Output %s: Doesn't support %d-bpc.\n",
>>>    				 igt_output_name(output), output_bpc);
>>>    			continue;
>>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>>> index bcc912d15..2f19b3237 100644
>>> --- a/tests/kms_hdr.c
>>> +++ b/tests/kms_hdr.c
>>> @@ -254,6 +254,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>>    
>>>    	for_each_connected_output(display, output) {
>>>    		igt_crtc_t *crtc;
>>> +		unsigned int maximum;
>>>    
>>>    		if (!has_max_bpc(output)) {
>>>    			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
>>> @@ -261,7 +262,12 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>>    			continue;
>>>    		}
>>>    
>>> -		if (igt_get_output_max_bpc(output) < 10) {
>>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>>> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
>>> +			continue;
>>> +		}
>>> +
>>> +		if (maximum < 10) {
>>>    			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>>>    			continue;
>>>    		}
>>> @@ -532,6 +538,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>>>    
>>>    	for_each_connected_output(display, output) {
>>>    		igt_crtc_t *crtc;
>>> +		unsigned int maximum;
>>>    
>>>    		/* To test HDR, 10 bpc is required, so we need to
>>>    		 * set MAX_BPC property to 10bpc prior to setting
>>> @@ -556,7 +563,12 @@ static void test_hdr(data_t *data, uint32_t flags)
>>>    			continue;
>>>    		}
>>>    
>>> -		if (igt_get_output_max_bpc(output) < 10) {
>>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>>> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
>>> +			continue;
>>> +		}
>>> +
>>> +		if (maximum < 10) {
>>>    			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>>>    			continue;
>>>    		}

