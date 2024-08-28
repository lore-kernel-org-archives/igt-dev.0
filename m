Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAFAC63798
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 19:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8460D10E5B8;
	Wed, 28 Aug 2024 19:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dt0LAsDp";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F3C10E5B8
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 19:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTFNvC71aD5xXsTjHQRqjpdwZ5GyLY1zH7Cu/U2GFTb76dgd3wjnfCB4SaG5xC98KG0UC75/yD4iHvLSF8ipRlrwfJwgom9W5/2v1nmIv2QhCKfLXVJoNGCxCeJql0Gi0KzKEri7smSki5k1RBjOmqPJUIMGuwKnVaiiBzyvkM13Pbqz0KS6hEe+JOW+iuWl2Ia/Ukyzx78NntfPnRTJvrO/os8/ZyBpyfs6SdWl+zZq0ZdSCTK1hZubQgYDAWCLRIc49XcEjW+gz4FPEjLxlqevhulmo+DifzqMilFHjPZyvLS1mkMtCUZklqSvhl7Qqqh+JUgufiYx/ZOinScQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNdQuiBmYXMb000C9AeG5OrHJmnYP6GwAb1KpOyS+II=;
 b=svxINcFA3WbHAjdxf2m0i0/SMwKHnHEoz6SmQmiCsVP9Oub5hkR8yRSP0J58QIjkyAAL9VWLoZ/AD0dr8gnluVzSxIcFPg22knujZoIFkK+y5JGoL7uEOfrfMXXuxf2WisVt9haiUUxsz+X7zYlwNtaV+SH/pK3kru/nkN/aihmYW/VOVKZe5va3XCmqM/kE4LFnT9imEt6i/Yq7iJE+iGnPC47BowuJBSmczVl25qnKK1FtFtHGrW7wJeSWJWJEPVw8oP+JQySsTnpgfI98KpcsWju78dSqHPrWtCRy0QbidxvPP/g2e28v8HZFqtdIqUTFH340bcb0Ui6lDUI5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNdQuiBmYXMb000C9AeG5OrHJmnYP6GwAb1KpOyS+II=;
 b=dt0LAsDpKcMlIiGEUu5hEX8fgjStsVhARUF4C7Dtjjz0K8gv9D72iRubIxKS/LPn4Cv/X9MUrDx5fjtL1B9Qn6flQpEhTdsKwbd6ibVDQyLtx0oh5jCbKUIUuaXbpsKCywL49iqvmD+hR9zoR81hfCOUspEAJ6e8EcnFNRirpVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CY8PR12MB8411.namprd12.prod.outlook.com (2603:10b6:930:6e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 19:24:33 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 19:24:33 +0000
Message-ID: <d173a601-f60f-4865-be0a-47d1888e5dd5@amd.com>
Date: Wed, 28 Aug 2024 15:24:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2 i-g-t] tests/amd_deadlock: add sdma negative test
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240828083452.131472-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240828083452.131472-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::6) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CY8PR12MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: db6da0da-7640-43d7-9a4e-08dcc7970b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTFKc3k2Y3ZVajFHSjgrWWQxcjdDcFJWenoxL053bGpUbFd4aE5xVmkyYm4w?=
 =?utf-8?B?d1pnbXlsNXY2TG5sMTB2TlA4N1ZseVJkVFFxS1o4OFU0TDBWUUdkUjNvaWN4?=
 =?utf-8?B?Z0JDWmMxZmpJVVA3anV6OXBuRmdmUldmQzBVM2Jpa1R4cXJ2czc5ejV5WEpQ?=
 =?utf-8?B?YUJsbmZMd29DYkdNNXdtVEcxck5pRE1JK2Y5bUNicU9hdjh5N0g4ZDBmelNt?=
 =?utf-8?B?ZUc4Y3paRTQzSGdQenEwYnF0eS9BdENaQzJkL0owWTBpNnRSNGpibE83b2I1?=
 =?utf-8?B?RzcrM08vb1RaNWtlbi9rMklaVmY2aE82NHpWMHNKSGxOWThzSUFRb3BDOTU1?=
 =?utf-8?B?Z0tRNmtFNWVSL0M4ZEZOdVFpREhFQWFZa055Vm1BRzF4Q1hrUWIzdXlDanY5?=
 =?utf-8?B?emxTOVBRNkVlTHIvalBORDVoQWFyWUIzT1Jyb2YxbFVUQmhpZkhTdm5KL3Vo?=
 =?utf-8?B?MDVkRDRENVE0Yy9qWFVoMWwzN3lDbG5TOG53eTE5VE1TTjlycS9YM3kzZUwz?=
 =?utf-8?B?ZTUxSVZKekFBckpTdFhDSUg5clZZamtRaDdYZTJaN3BGY2lablllNWFsS0pG?=
 =?utf-8?B?elIrUXYrQm92aUg1blJmYVFWcjJDcWpQK1ZoQ2gwdFZ4djkzdWdKYzB4OUlV?=
 =?utf-8?B?NmliM1NhakRraDRXUTlSQURiMnpaUkRYR010a3ZzN2x2YUhCNU9MZGpUaTRw?=
 =?utf-8?B?eHhtZHhIQzRvMEtHRW9FODNLRFJYc2FJUXFQM2hxVWZ5azdaMmpocFNaZUZa?=
 =?utf-8?B?emhlZitjY3RMdGh5alRDZkpMWk12ZHgwam9ISjlwWTA5MldnM3V0NHRTMEJU?=
 =?utf-8?B?SlhyNUFlRStWVUJaNGdTZmU4MzdSdVFLT0lnS0phbmlvMlVzZnBpS1NnWWVT?=
 =?utf-8?B?cGpaL1dVbWlYMXNIWnhKek1TRXhrS3kyTHI5MndPYWJWMGZVdVVWUHpKbXZQ?=
 =?utf-8?B?S29FM1pHUllOMkhaREJKOGUybkNVSThQblovVVVmbGNiUmJoUzFaMUx2M2hR?=
 =?utf-8?B?Uy9EYmFsdWMzaE1kMlZDdGloQ3pTVldlRENST1JUSGtMUndkZFhIa2psQXpn?=
 =?utf-8?B?V2F1VlpXcU4vOW5IZE5zekExQVhlWDhUWHp3RXFyTXYxOFhPSTVwTENCblBQ?=
 =?utf-8?B?SXhFL2FoL2toQngrRXl5S1NVelZNbHdHZUgwcDZLQmtTZ08vOTV5Y3FRYVFQ?=
 =?utf-8?B?WkIrUjMra0ROUVZKVXBHczRGRE1RNHE3dEoxZ1ZYSER6STUya2U4VitDNTNB?=
 =?utf-8?B?dlJROERCR05nQXl4Tm9vcm5JODRyVDBJcmhxbDd4WHRteW1rSVg2N0NKTGps?=
 =?utf-8?B?dkw4YTVzS3JVOEU5Z2tuQi91NFBEWWppTVZycys5OS94WGtIc1BEK0RGeVJH?=
 =?utf-8?B?VjNNb2Q4dSt6VEFrOFIxcTIyS0Q3M2xmZjhEaTdIMHhKaG03aGFCeXNtRDVn?=
 =?utf-8?B?Z1hPL2hKalN6VXNnWHE1U2NmcURVQkhPVEtLL0NxZGVhdUwxb3kwSGRhVFZj?=
 =?utf-8?B?c1VDZTR2cEc5WGJDcS9OSS8wbHo5SWg4MDJHc3h2SFpGZjM3M3ZqMjcyS1V3?=
 =?utf-8?B?c0ZSSUF1QTJHT3hHYjJKT3AvaXRpc294MWlVTm1kVWh5MHdYTXNjeWpiZFIz?=
 =?utf-8?B?M0ZQWEMrdjE3L3VWNlViNkJwSzJpSGRSUGxvSGxaMHlyNTlDc3dxM2R6NGRT?=
 =?utf-8?B?YzlEaGMyczJ3WUVPT1lDWFdMbm5tQXQxRGZjTkNxUjVtclExQ1Q5U0paOGJB?=
 =?utf-8?B?dlQvbHpIcDhldzZ3c1pvdjVUM1MxRHhoaWM4RnV1N2UxUCt6c2lySXVCamFi?=
 =?utf-8?B?UEpSc3U0Ump6eDVMNmFXQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am1EaUEvRUV3OTNGOE11dVZhNzBJc0J3cnhFRlRlMEtKSmlVL0ZaKytWTmNW?=
 =?utf-8?B?T3pmTWowd3FOakJBZDM3UW1mUUF4N1dMaVo0L1RaU0JuS2lPeHNGK09yVk4r?=
 =?utf-8?B?K3RGc2JPY24rbEwvYnoza2VjNWV6OFo0R2h0Q0I1NzBlejhTZGpwQ3hOSEVK?=
 =?utf-8?B?NTF5QUxsem9TeVVKc3lXcjUyL0doSnVRbERIRENDam4wOGpKRUUrejFLdm1s?=
 =?utf-8?B?TEtlRjdYM3c1SGpuY1N3NHdmNnUyY2d5bmV5b29YNkk5QWk2Qk93ekRrZmR2?=
 =?utf-8?B?MlF1TXpjbHNYaDg3YnZRQWRmV3h2bjJtL004Zms3MHJUTERpRy9VbEt2T3By?=
 =?utf-8?B?SlBNSm40b3JDTHlucEo5czBIam5KTXczSUFsamVHWEVoSmUwbU1JcUplQndn?=
 =?utf-8?B?V2x6ODUwYmFmaURMU2tvVkgzb0hmR1VlZUZXWTdrS1lwMUp3M3J4a2JQbHFw?=
 =?utf-8?B?YzJLMzF5SzNuT0J4bGlaVWhEUS8wczM5aTNsaDczL3ppM3E0aGR5TlkxNVlm?=
 =?utf-8?B?MkxoMXBSckViQXlIcmw3ZXR6YjlidUlsTzZ3SUxnRFE5blB3eWp1K3o3ekhH?=
 =?utf-8?B?RTE0THpvaHZvTVFQMml0MjU3WTU4a0t2OGhxUXI1ZTB6SWRQcUhHbzJZbnk3?=
 =?utf-8?B?SVdEclNPRGorbHRLbm1lVmJGeFlCdkFiUXN2RjJnSHlHM05nNnJMQ0xhV0M3?=
 =?utf-8?B?WDA4R09qaHNFWk1YNG9lTXl1YWhQSkhnY2tmbGl0SjRienB1aldjODNSNVJE?=
 =?utf-8?B?TDlZRWQrL0UyV3VxTFlCUHNYV0pnS2RIcGpuT1krc0M0aGNMQkRXS25PZFQw?=
 =?utf-8?B?bEJsM1hPRDF1Z0Fud1EybnE0YU15SnUvWXZ1RDQzMFU0TUtXOXEwalZ0V1NK?=
 =?utf-8?B?ZXBCQStTMjZUYlVvNG5zeWlmUW83OWNJSlp0L09wYVJ0aGVxZ1JPVm5rSHlG?=
 =?utf-8?B?cUQ4UXNMbU5rY2ZReFlDYTExZzVDZHFtd0d6UjNKc245dnpZQ1ZuMHBpUEtu?=
 =?utf-8?B?UVRPblVYRHBmT3RZdWpwSXAvRnJKaHRyVnVrcFIrQ0dyK01uVkFMN2JSMXBn?=
 =?utf-8?B?RWVnT3BpSzl2YUJCZGFkQUs0dDh3U1lWNXFVQTNjSUdEM0FNcDlwY1luOWZF?=
 =?utf-8?B?NUFVWFRoL1lYaHQ3RnB1RmhoeE94SEpwaEZtdkhrdkozTW4yYlJoalc4a3Nv?=
 =?utf-8?B?cENaQWRvZVNGQUNLREgrWmtEb2lWVEZuMXQzUlFCb2RSNXROOVBENUUrUmlM?=
 =?utf-8?B?QzkyYWl0alA1UWpreEYwNThIZS8rbGtuazRqaEZXSGdpbWN0Y0hvbGZhSEdj?=
 =?utf-8?B?R3VYcHo2UXhxaUwzMzFGWlZORTVlQlpIay9pdW1zdXVNbERWdkR6c3lmWGN1?=
 =?utf-8?B?YmUyVWFKc3dlNE9qdkhvYlJtUkdwRG9EaFZRWXB2Ylh2SlhqWnN3TWJhMFhp?=
 =?utf-8?B?U0w4QURPNTlGNmhKOUtMMkNKTFl1eEJvSWkzUlptMmpudmhvdGM3UE9GMkhJ?=
 =?utf-8?B?VkZrVkxxNGVxQkhNZFZRWnZWYTc2eGxFdmlwQ0taVmM1bmgxbDdoWnZzVDc0?=
 =?utf-8?B?cW9RdE1tMGkvSWpROWdKRjdxRU1OaXhXRG85TzVOMnZjZG03NktOV1lUTlVs?=
 =?utf-8?B?UURDNkdYWWFaUC9NY0pUckVhL01SMXpnVlNjRzZXcVhiZFowd3p6eUNXb0JR?=
 =?utf-8?B?d2pQWmo3aGRidmVmWFR1ak5VUVpYZnVpeDlqdTV0TEZCeUhDWEduS29YaXcx?=
 =?utf-8?B?L2JGd0lqVU5SUkhFUHZsL1hBSTU1TkwxRVJjQld1N0IyN2RyelJJT3hWdVNy?=
 =?utf-8?B?QVJaZ3JWRjZqcUJQRjlYOVgwcSs1U084d1hXb0VHU3dxbE9lcHVRT1FxN1k3?=
 =?utf-8?B?TGlveXJqZGRtOTFVeWRrc2NWZ1dDSFZ3SWFteUQ3MVI2dUZEbG9RdDdOZmdT?=
 =?utf-8?B?ZFJBZ3FqUXRDdXZpYWMxY3IrbzZzWU1kanI1aCtFOWNBNWRMRTdPa0tnUDM3?=
 =?utf-8?B?b0dpam53UHZVSnJJZkErSkVsZ1lyUjVud0tMUURqa2NRaXRaYkZRRzhGV3lq?=
 =?utf-8?B?UmU4K205RXFYMC9KdWZvWVRDMFZ3N0d5NjZHay9LVUJQeGxmSVBsRVl0Rlp6?=
 =?utf-8?Q?PXa9n4WZnf6cOKSMFq96Fiq71?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6da0da-7640-43d7-9a4e-08dcc7970b91
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 19:24:32.9915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/30E6jAUEINxA47NIaGz2pV6AhbmwmmiONTXm6kGykgi5f9LHabyOJJxE86IKDHNMOaXG+Btgg/XcN0Gk3K0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8411
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

Both patches look good to me. I'll merge them after they pass our CI checks. 

I've posted them for CI verification since you've added several SDMA resets, and these tests are executed unconditionally in our CI pipeline.

Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>


On 2024-08-28 04:34, Jesse.zhang@amd.com wrote:
> To enhance the SDMA negative test,  add a few new tests.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  tests/amdgpu/amd_deadlock.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 96da49002..5dd3bf9f1 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -127,6 +127,34 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Test-GPU-reset-by-sdma-badop-with-jobs");
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
> +			bad_access_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
> +					AMDGPU_HW_IP_DMA);
> +		}
> +	}
> +
> +
> +	igt_describe("Test-GPU-reset-by-sdma-bad-addr-with-jobs");
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-addr-test") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma-bad-addr-test")
> +			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> +					AMDGPU_HW_IP_DMA);
> +		}
> +	}
> +
> +	igt_describe("Test-GPU-reset-by-sdma-bad-length-with-jobs");
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
> +			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> +					AMDGPU_HW_IP_DMA);
> +		}
> +	}
> +
>  	igt_fixture {
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);
