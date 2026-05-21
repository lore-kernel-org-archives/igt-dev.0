Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46227CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 15:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E259C899B3;
	Thu, 21 May 2026 15:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GoE1dC5/";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4672910F3B7
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 15:54:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJeNAcZ6yZVDVRaURbL+Yo8PjtoDBfusmqIpSxrS2K2F0fKDQx/WrHhhCMMd5uYzW/8pBr5hiVEtlIsbEQqyyJDLjoy1KgUz5JBOp8dUNMIn1SeNciKq+10t/lxjzzPCgnBIaCYZllssBTYr/7gl1VOveM1G/gFBFLGxTniZpcqEFnDZlQKEtJnhnFlZLp+bZjxpVlGhUb7n9eHB9GLmAo/UeNmo6uk1UcLl2/qjRSmQt/DF4MeBZg1AkXDQuBckMXjahDFnWwFPzkKCFfBz6hn0EBMtv9Mx2w0/GU4xWKICvJ0mvPDj1Lao1luKDVNUqtKsdMiE+2horfUiVlozNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZL/BdRTYo6HTIXHlql+9zb6/xydWQ+q84DwN4dnG8U=;
 b=aBzW/q2uprk0MQoBpFJwKGdyglP9UJH3fEtUV1WCgBqYgRXZd0ufF5DdfStMi5mcr4sa2oroCJTsn50veiWTITpUPigJ7d7x5LQYttuQdt1VWLIKg5WBofkJSE5fmro1jakoatlMNETyDIYR81bMTHre/Gwvqp73ISqa30n5MHYqAx+3MeWvkr/VWy1eaR27L2+SqIC1GzK8Qle/qhqtuI0O+o3Y5mHKObHHvEMQTF8Sueda28gX7r6D1jd5lTKEp53Uyb64mXxGEOykctSTdWW5tGwOMmO1j+abIOg4t2PDzllPgzF7TBRiAT4sUuZ0OPZssEfl3TPBzYioaaOViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZL/BdRTYo6HTIXHlql+9zb6/xydWQ+q84DwN4dnG8U=;
 b=GoE1dC5/xQ9XEYl7eITUjjzC6p3HxW+NSvWmplJ9OgxJ9vFkn0LQ+5BYaxWtjIYvotcVmmMOlzERglWDzCOx1GHSyAexkaEpwq7E/b4KwUS2hEE6/0r4NqwIxbY2YELrMS2Lu0rCeV0aUBqPGbyJ1Np2OsPZrGGFg+zVM/qIurM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by MN0PR12MB6197.namprd12.prod.outlook.com (2603:10b6:208:3c6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Thu, 21 May
 2026 15:54:30 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%4]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 15:54:30 +0000
Message-ID: <38aa81a5-5acf-4ca0-a297-69b476b78bff@amd.com>
Date: Thu, 21 May 2026 11:54:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/: Handle max bpc read failures explicitly
To: Karthik B S <karthik.b.s@intel.com>,
 Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org,
 "Hung, Alex" <Alex.Hung@amd.com>
Cc: sameer.lattannavar@intel.com, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260518040353.212734-1-pranay.samala@intel.com>
 <20260518040353.212734-4-pranay.samala@intel.com>
 <005eb05d-d1df-4e2c-a034-657f608d3809@intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <005eb05d-d1df-4e2c-a034-657f608d3809@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0079.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::11) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|MN0PR12MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 397e160d-e7f4-4690-73f0-08deb7513e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|3023799007|18002099003|22082099003|56012099003|4143699003|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: ZXLQ2PW4ThyRzOqLmaIo35u92KBSIqlEImTa9yajZEtV4L8G24dU0fimBC4eMfsnz5v9cv8eUI8YCZAnPzBWsxRjCaH1MCm4NBZGcAepVFwEiiE3d1tKaiZK2nFRo1kKF6WrZXezklyfhtw+SyheOe8p/Zc0l8BP+jnmblDxuZ5FNLohGBqJxaUPwfWOWBCRqBCilB00S9HvNbN0Lfbc/efsoNRS1PKDDc/VGUtht/RthKjDbv9AxkEz6619dB33CvAL3TttiUiQKeCVpuuqz5MBvd+r/xnf984KtAqVot9ohyDGEtNXA+o8A3uq9F6RlwmMtUehdxueDWolmMqWWEab1nQZWPe74+YGdwhZFnbxpZJfPcAIZj8QHOKKJjmfxPXLcbH6PR0EzQPCI81Dr+Y7hFRvm4I7pZgSUXTU/NCV067u1y97y1avLcikjuTHcJa+xmQKJFIOTJ0JmCOB37SBI1EK6yQYlVkPblb7f2EjBUrLhfsHraWDwtkF8G3HqoDYeX2JyQqjw6AzeoWvOK8E++K9YpbR5o6RE8OnQ9m+m3jc4mJkKbxneeynF2RLUSSM7DV9pyv9Z0zL6nhOZBscMV0OBhwOyhz5Z4GYXIWJLvIRgjdZUVUpcAqttSUyJWp1EPxLKNgfcw7MxYEzNG1O6aRTV1QfUWYmxATLNq/ZGi4Vw+1RCCEIjGsawAsT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(3023799007)(18002099003)(22082099003)(56012099003)(4143699003)(11063799006)(5023799004)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHFVV0F4eEw1MVNrUWF0TzlJRjc2WklORTdkSUZnLzhaS2dEb2N3d3BVWnNo?=
 =?utf-8?B?WFZVVGs2YXdyUStucW4zSXpudnIwN1RVRlNzMXA4SVdQSVVQQjdDQ1hvMkpF?=
 =?utf-8?B?eHNwQ003cG9QcHNvZ1grMzFxbTBRWE8wVEJDTTlXL0FqcHJQMmptUldXbDRC?=
 =?utf-8?B?a0hhd0VSS29QNjJqbUE0UzFIRVlXbHlSQ2Y3OXNQUGs0ejcyaHQ2QTFzSUFJ?=
 =?utf-8?B?OVloQk1laThjZHJqZ1U1NEFWeFlFbytPN0F2S3YwTEdRUjFxUElIWXE4YUE1?=
 =?utf-8?B?amNRWS9rS2ZheE8xbEFsR0hGSlJCS0hXSnFOOG9Ba21qU3d6QTI5eGpyeFJE?=
 =?utf-8?B?RW4vaG1Qa1pnaEs1WkljZU1uVzQ2bnpVMTVlRTRvYnFjQ0ZtK3lzemgrR0tL?=
 =?utf-8?B?dDZ5MEFBbVIvZXRCNVFVbU4vS1pZb3ZWTGM0NCtiMWRrYlpodXB0ait4MXJX?=
 =?utf-8?B?QUxPd09Rem14Zkh2QVpPOHF1eGx5VFRpRE9VNi9EUFh0N3Y4Z1NCb1NzSUVw?=
 =?utf-8?B?U2xJbHpENkVvanFyYW5UU0djaEkxNitrNUR3WW9pUm1XWm5IU1JiV2ZadUtk?=
 =?utf-8?B?ZTNvNUphOVR3V092T24reVpVOXA0SHFWUmdUUzBjK3VSbFlHdW94NWcrRjdn?=
 =?utf-8?B?QkduWXcreWZKK08xY1F4QXNuZ09OYTRiZWpWeGxQNzZPQUtoSFRlWTAwY1Y0?=
 =?utf-8?B?b08yamN5S1Q0eWREWnZBQjNhM3VSZXB3Y0s1RVprRHNRckJlQlBNQmN3MkZ4?=
 =?utf-8?B?VE1tQnlnZDkvRmwzaUlYemU5SmRFVmlzNUlMTG85RWN2d0lhM0VqcUg4cG8y?=
 =?utf-8?B?cVA3eWgzVlNHVE5UdlFLazh3YityRkI2QmN4RWJ1NGxmeU5oVFhjNVgwOWsr?=
 =?utf-8?B?ellpVitiYk56Z2YzT0EzdENzbEdsVHg5UVdGTVIya3VlcXBRWEtCTDM2YmdS?=
 =?utf-8?B?TjlNb3ZSWDMrTUt6bFZnY2xTeXFCWCtucGxsZEtHRWFITkZmcWQvc2Y3OFVX?=
 =?utf-8?B?V3dvOW5hVW1HUFJSL3N0VlhkSU05Sk1oMlJ0NGZza2VvTE9hQWIrQkVCQ00w?=
 =?utf-8?B?Y1BaZFlkejNYd2tVSDFOa0JReVY0bWRLcUYrMm54VDVPbzhmaFl3STJlb05D?=
 =?utf-8?B?OFU4TGhOZ2lpdUNXMm41Q2tMMnd4QkVpYlo4b0IxbUcyRm96cUV4VU5Gc0Mr?=
 =?utf-8?B?OXNUMXFITUhYTXFuc0VuTGl0OGFMejRVRXB5SVFtRzJaT01YaklCZFlReGw2?=
 =?utf-8?B?U1lnaXJBcTNLZzNzS2tPUG96TnVtanBrQ3RsOEo4WFREeHNzQnpBTGVqOGlI?=
 =?utf-8?B?T25GQXBSc1pleHNjOHd1OTRVN0Y0R2NJam5OQndjYnZZWFJrZysxanhCMU02?=
 =?utf-8?B?TkJDeWxCWE41aytVSGZRdVNTOHkyM3YrVC9mWU13TWRiaTBZUFFrRmIwelYw?=
 =?utf-8?B?V0Y3L1RkNEMzYm1mWmNZVjlNTDVjK1NhcUtpQkZTS05QOXI4Q3BlSGM2MnJa?=
 =?utf-8?B?c2FndkowUENwaUR3d1BmcVdpRk5jU01hNHNBT2FqVkpJRVp6TjRhb3BlZTRK?=
 =?utf-8?B?cElTZm81ZWwzVGw3SmlEM08zMks2SnFpK2VIcmpGcSt4MjBkWWpkUXVzMjJ0?=
 =?utf-8?B?OWFQcEZQRmd3RW95Q05oREJMRDNzWisrRWFRbmdaRFJqb3QxZmZCd1IvTDlS?=
 =?utf-8?B?ZHlIY1VFZkdpTzN0TFZNUUNWeTYvOFl3WTlGdVVPSkJBeXdyOU9tOXM5QUp1?=
 =?utf-8?B?TEZJZlBjVUxKaklhak5ybm9oZHdZVUIrakU5aG1talU0NzNCUUNPcTFyR056?=
 =?utf-8?B?UHR4Z3l6d0tZWmZvL3ovK1RHcjJZWE41b0lGcHR1VGNwUWRzTGorbDhoY0xS?=
 =?utf-8?B?ZWUrUFQxTi9hQlRTMTRtUXBGbnJ3RlZWRXgreGRxMDc3OGJra095VDRBQTlu?=
 =?utf-8?B?cWRMdFdvbTNtdVZXazdrQnFxNEhPc05LQmZrbCs3UW1xdVpJVklyc3hLYk91?=
 =?utf-8?B?OEVqUHV6MHlseDIzK0h1U3NyVUVqbVpvbFZ5dWV5OU1iaDVKVEg3RkhLQVZa?=
 =?utf-8?B?MkFJSHFpWE9uSGx0OWFjMUNodHN0YlgwUEtHdDFCZ2dtdUdJNFV6VlRkUU0z?=
 =?utf-8?B?dmpaTmdVTUU2cGhZakVmUmxFMWt5SCswUlFId0RXeHJIcnFabDJPbmp3aTVE?=
 =?utf-8?B?ek5WWmtpeU53ZnhkQjEwRk5NTXFmMEZGZ0lhUWl4MlpKcWVBb2FQaVNpQit4?=
 =?utf-8?B?bEtsbzhNa1l6cFF2UHJxSUMxY3JkYXI5V21ZcmNielZnMVdNRmdIL1pzVzl6?=
 =?utf-8?B?WkRTTS9seExwQjZ2ek9lQm96TE95R1VkVEJjNjg1VmtmUkovZ2NQdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397e160d-e7f4-4690-73f0-08deb7513e81
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 15:54:30.4581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzZPERsh2Ofz+cZU4hW4A6aVDy/4FJKLvd/3pVvMw68GWwkuYDuqU0cfSaMXLclzhD9aT4n87hBvu2NB16hJVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6197
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


On 2026-05-20 01:04, Karthik B S wrote:
> Hi Pranay,
>
> +cc Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> @Vitaly: Please take a look from the amd tests POV.


Added Alex Hung

Agree with Karthik  patches 1 and 2 must be squashed. If patch 1 changes the igt_get_output_max_bpc() signature (adding the unsigned int * out-param and changing return type to bool), then all callers in patch 2 won't compile at the patch-1 boundary, breaking git bisect.

Overall: LGTM for the AMD test files. The error handling is sensible and the transformation is mechanical/correct.

Thanks, Vitaly

>
> The patch LGTM in general, other than the fact that this patch needs to 
> be combined with patch 2 to avoid compilation failure there.
>
> Regards,
> Karthik.B.S
>
> On 5/18/2026 9:33 AM, Pranay Samala wrote:
>> Update test call sites of igt_get_output_max_bpc() to use the boolean
>> return API so each test can decide how to handle max-bpc read failures.
>> This separates read/parsing failures from capability checks and allows
>> the test to make an explicit skip/continue decision with clearer logging,
>> while keeping normal capability validation unchanged when max bpc is
>> read successfully.
>>
>> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
>> ---
>>   tests/amdgpu/amd_bypass.c              |  6 +++++-
>>   tests/amdgpu/amd_dp_dsc.c              | 10 +++++++++-
>>   tests/intel/kms_dsc.c                  | 13 +++++++++++--
>>   tests/intel/kms_frontbuffer_tracking.c | 10 +++++++++-
>>   tests/kms_color_helper.c               |  5 ++++-
>>   tests/kms_dither.c                     |  9 ++++++++-
>>   tests/kms_hdr.c                        | 16 ++++++++++++++--
>>   7 files changed, 60 insertions(+), 9 deletions(-)
>>
>> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
>> index 3c537ea9e..e59691f16 100644
>> --- a/tests/amdgpu/amd_bypass.c
>> +++ b/tests/amdgpu/amd_bypass.c
>> @@ -323,6 +323,7 @@ static void bypass_8bpc_test(data_t *data)
>>   	igt_display_t *display = &data->display;
>>   	igt_fb_t fb;
>>   	enum pattern ptn;
>> +	unsigned int maximum;
>>   
>>   	test_init(data);
>>   
>> @@ -345,7 +346,10 @@ static void bypass_8bpc_test(data_t *data)
>>   	 * Rx supports only up to 6bpc, Rx-crc will different from crtc-crc
>>   	 * with 8bpc.
>>   	 */
>> -	igt_skip_on_f(igt_get_output_max_bpc(data->output) <= 6,
>> +	igt_skip_on_f(!igt_get_output_max_bpc(data->output, &maximum),
>> +		      "Failed to read max bpc for %s\n", igt_output_name(data->output));
>> +
>> +	igt_skip_on_f(maximum <= 6,
>>   		      "check /sys/kernel/debug/dri/0/eDP-1 (connector)/output_bpc\n");
>>   
>>   	igt_create_fb(data->drm_fd, data->width, data->height,
>> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
>> index 1742c7df4..dc71e903e 100644
>> --- a/tests/amdgpu/amd_dp_dsc.c
>> +++ b/tests/amdgpu/amd_dp_dsc.c
>> @@ -480,11 +480,19 @@ static void test_dsc_bpc(data_t *data)
>>   
>>   	/* Find max supported bpc */
>>   	for_each_crtc(&data->display, crtc) {
>> +		unsigned int maximum;
>> +
>>   		output = data->output[crtc->crtc_index];
>>   		if (!output || !igt_output_is_connected(output))
>>   			continue;
>>   		igt_info("Checking bpc support of conn %s\n", output->name);
>> -		max_supported_bpc[crtc->crtc_index] = igt_get_output_max_bpc(output);
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("Failed to read max bpc for conn %s\n", output->name);
>> +			max_supported_bpc[crtc->crtc_index] = 0;
>> +			continue;
>> +		}
>> +
>> +		max_supported_bpc[crtc->crtc_index] = maximum;
>>   	}
>>   
>>   	/* Setup all outputs */
>> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
>> index 605ad2d5c..8008fc045 100644
>> --- a/tests/intel/kms_dsc.c
>> +++ b/tests/intel/kms_dsc.c
>> @@ -265,6 +265,8 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>>   
>>   	for_each_crtc_with_valid_output(display, crtc, output) {
>> +		unsigned int maximum;
>> +
>>   		data->output_format = output_format;
>>   		data->plane_format = plane_format;
>>   		data->input_bpc = bpc;
>> @@ -275,8 +277,15 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>>   		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
>>   			continue;
>>   
>> -		if (igt_get_output_max_bpc(output) < MIN_DSC_BPC) {
>> -			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("Output %s: Failed to read max bpc\n",
>> +				 igt_output_name(data->output));
>> +			continue;
>> +		}
>> +
>> +		if (maximum < MIN_DSC_BPC) {
>> +			igt_info("Output %s doesn't support min %d-bpc\n",
>> +				 igt_output_name(data->output), MIN_DSC_BPC);
>>   			continue;
>>   		}
>>   
>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>> index e7bb3fa18..996a67ee6 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -2777,6 +2777,8 @@ static void setup_drrs(void)
>>   
>>   static void setup_hdr(void)
>>   {
>> +	unsigned int maximum;
>> +
>>   	if (!igt_output_has_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>>   	    !igt_output_get_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>>   	    !igt_output_supports_hdr(prim_mode_params.output)) {
>> @@ -2790,7 +2792,13 @@ static void setup_hdr(void)
>>   		return;
>>   	}
>>   
>> -	if (igt_get_output_max_bpc(prim_mode_params.output) < 10) {
>> +	if (!igt_get_output_max_bpc(prim_mode_params.output, &maximum)) {
>> +		igt_info("Can't test HDR: Failed to read max bpc for %s.\n",
>> +			 igt_output_name(prim_mode_params.output));
>> +		return;
>> +	}
>> +
>> +	if (maximum < 10) {
>>   		igt_info("Can't test HDR: %s doesn't support 10 bpc.\n", igt_output_name(prim_mode_params.output));
>>   		return;
>>   	}
>> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
>> index 24663444a..a50ac3a37 100644
>> --- a/tests/kms_color_helper.c
>> +++ b/tests/kms_color_helper.c
>> @@ -40,7 +40,10 @@ bool crtc_output_combo_valid(data_t *data, igt_crtc_t *crtc)
>>   bool
>>   panel_supports_deep_color(igt_output_t *output)
>>   {
>> -	unsigned int maximum = igt_get_output_max_bpc(output);
>> +	unsigned int maximum;
>> +
>> +	if (!igt_get_output_max_bpc(output, &maximum))
>> +		return false;
>>   
>>   	igt_info("Max supported bit depth: %d\n", maximum);
>>   
>> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
>> index ca367db61..236e5c7c0 100644
>> --- a/tests/kms_dither.c
>> +++ b/tests/kms_dither.c
>> @@ -206,6 +206,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>>   
>>   	for_each_connected_output(display, output) {
>>   		igt_crtc_t *crtc;
>> +		unsigned int maximum;
>>   
>>   		if (!is_supported(output)) {
>>   			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
>> @@ -213,7 +214,13 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>>   			continue;
>>   		}
>>   
>> -		if (igt_get_output_max_bpc(output) < output_bpc) {
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("Output %s: Failed to read max bpc.\n",
>> +				 igt_output_name(output));
>> +			continue;
>> +		}
>> +
>> +		if (maximum < output_bpc) {
>>   			igt_info("Output %s: Doesn't support %d-bpc.\n",
>>   				 igt_output_name(output), output_bpc);
>>   			continue;
>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>> index bcc912d15..2f19b3237 100644
>> --- a/tests/kms_hdr.c
>> +++ b/tests/kms_hdr.c
>> @@ -254,6 +254,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>   
>>   	for_each_connected_output(display, output) {
>>   		igt_crtc_t *crtc;
>> +		unsigned int maximum;
>>   
>>   		if (!has_max_bpc(output)) {
>>   			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
>> @@ -261,7 +262,12 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>   			continue;
>>   		}
>>   
>> -		if (igt_get_output_max_bpc(output) < 10) {
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
>> +			continue;
>> +		}
>> +
>> +		if (maximum < 10) {
>>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>>   			continue;
>>   		}
>> @@ -532,6 +538,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   
>>   	for_each_connected_output(display, output) {
>>   		igt_crtc_t *crtc;
>> +		unsigned int maximum;
>>   
>>   		/* To test HDR, 10 bpc is required, so we need to
>>   		 * set MAX_BPC property to 10bpc prior to setting
>> @@ -556,7 +563,12 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   			continue;
>>   		}
>>   
>> -		if (igt_get_output_max_bpc(output) < 10) {
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
>> +			continue;
>> +		}
>> +
>> +		if (maximum < 10) {
>>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>>   			continue;
>>   		}
