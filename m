Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C977C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 00:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0903710FCE2;
	Fri, 19 Apr 2024 00:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0/+MzejU";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FD210FCE2
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 00:45:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJyVA3fG8OiswoTV+ViBnS6rcO8hIQ9yCHZtyUtXM1MNg/7an7DJyzX1xv0arQw6aRLmB+B1ctuLoRavmZ2ds+qdPOrWRQ03Pv/Hqf+a5z8G8W2iuY/XD/7Y0ZTFD4BWd2jMqA63dDtw4SoNoipdW/birFryNrM7vmc74ZLqpVqyYPxhIM7AbL6+GdUGB9YUNJsCAorW4l4M7JeVvOnmh7SVNEXMUbP6xCpjptMnuGPkKJoUoh7SsUdb7Yxwu5krbJ3DX5oHrfA6CLybzYolqYXaD3iOTBEd6BX/giIeLn9j9xf0ZC4aWifkR5AwGWXIi7IXgfdVP4B3JIyqs8Al4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQ/omr2aS6xDCtytGIFQUEERr2kVPiKl4ykPtMEf7KA=;
 b=OAFr4SyW6VIA1ZewPwiztUoe1pBE+v8C/ORQkV2+t/l6KZTTotkLzh9h/qv68Le/BmNO1FFwowXxLCMagQpVBEqkpCOnOCLcKs+YQxOIuKpUR8CKZbDsvkVmxj8ueIHgpO7ePA4adypZkXphjCYCqK57+Hmm0FRf8ZT3Xe34zXx5BYxaisB+UkywyaXSgFanC/UYQjDii6Z5hk7Z9pbcejsTmQJN6k7VgNlBD5cbw0r51VLuom+mcYZeABQmBtxOEbGE+/aVCRS1hGmXmgvVxLzHK3MHkRSR91tLDnyOr+dAm88lNgpVl+TE4Bpnhk70bueEacDNcI6zAq+uHdCGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQ/omr2aS6xDCtytGIFQUEERr2kVPiKl4ykPtMEf7KA=;
 b=0/+MzejU4UErEArsy0q953MJw4Bwv5O37RK3SURvJ2hn/PRqBspKv9CeN0VDuxR6SkUCKam/ActCvVy+SCVHuVAdXbuMFDtjOWys0MU9ldqwXTD1LffHmb7GEHspb15Eps8KeZ06D0694Xi5vSxV11sP+QzKMqKX/iE4df3/TsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.38; Fri, 19 Apr
 2024 00:45:05 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::6d8c:44ea:199f:b618]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::6d8c:44ea:199f:b618%3]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 00:45:04 +0000
Message-ID: <a154b26a-343c-4736-9109-9fb66f76457a@amd.com>
Date: Thu, 18 Apr 2024 20:45:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: add check for deadlock test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240417011701.321744-1-jesse.zhang@amd.com>
 <20240417090809.tu2bpfo5bebm5oo4@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240417090809.tu2bpfo5bebm5oo4@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0016.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::21) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: ace51eee-7d7b-446c-7996-08dc6009f414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vUhjoNdJsCy2XqjNIMUiCRqP44xZDQ+Iuy4sPqaSFWuP7CEmJsPE/HTFu6eiPVUwz118WXVZK0fI3SB0dreZcVNS747JYOBaHfq6yX7zQA+Hshydjs+q2hkTRGxvRMZUy4yD9ILtdgNLA9Ywu0ofXWZLh8cwOKJUC7s3VGvY8pCngCqJArd5v4GKef+0MPEyF6imLYflDqubRa/AceHh4tnuNUs+Rq9j50kwwrXD1l5KFIoNrvzOXpkI26Hf0v2/Xwp9uXTQMp+NbREZl6z3REDf5G4awwUIc+4h7eCWw9gs+s1mnEGm7WnxsaPpwT6JjhfHc4tlzOtxHp3LNfcKmQ/WXPbsAdGckxb06fK3OajW0biW9v5ual8c9V9osXzetgiIaSVC2k8BHUk+PiwahZjK/1PfyDLcs5VRpDsKt3v3rHRHXfxsy3S86kYtZ78M+22fbFsp80OcWpSKSP7rSQlL4aRr8aUaW2JuVD0ORK/b6GmKYT12NVqCCDf/jBYhwYFO+AjEZWw/dnPUD+8guwikZ1IQr6Rxd1ai7iNGuhn+XuDRQkjnzPMYW67Z9P1v2Rl2jCQ3iX7lYzf3P/boHs9QGBIDJO6gl9/MMsVcMYu5ioB/cFDr0V12kj5+wQVNkAE0JK1RlAZk3NHdFaararxlsaLW7t/yUQjt38+W7bE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlFkZlZYc2o1M0xDVVJCNjZHNjFDckxkVDk0cXo1VjR4RjdzOEpRZURaZG5M?=
 =?utf-8?B?WkZNOEpSVGd2UzF4RjhhNUI1TEgwQlJyckZPWWV0dE83cDB4RFNYRCtkQ3Iv?=
 =?utf-8?B?NFVPWWlMV0J3ZGZQeU1mWmZ0VkY4cHFTOE9SWTRaaU1zWE5zNlRXWFFIMjZC?=
 =?utf-8?B?VkE0U09jR0dPUGlMcWlYRVYzN3RldUlhbU5QVnpENDNaanhvcnB2SVNuMkd2?=
 =?utf-8?B?bTlSUnZLSGFVeG96Z2RTY0hoNkl3Nkl1TXdFR2YzWEVCZkk5ZWNQSHpjWFdY?=
 =?utf-8?B?Y3RUZkw0dHdXVVZBTHBtSWdwS0xvOWJ5eW03dSs5UGErRkRuSHlhd2p2MmFY?=
 =?utf-8?B?QXJnMytYbFBwcHIwUDRTeTBXbzEvNXh3dGZhMWQ1cFpwbXJWTGtjWk9oTjhq?=
 =?utf-8?B?ZXVMTjRVeGxrQVY5SWxhK1lySDdOdlE3cUZQS2JveDVWK2loNnd4YkREVUg3?=
 =?utf-8?B?MDh0d3B2eUtKYzhkU0t6M0ZmNEJPclVkUGtrM2VNK1gvOVYrTkpaTU55SWR5?=
 =?utf-8?B?d0QzMmlZeVZjbEYzcWNjUyt2MkE3REQ0VDJjOWZQNzBTMVRoOUszR2NQNitX?=
 =?utf-8?B?c3pzUW5XRXF6ODZLSUhiNktWQ2orSVhFcm0zNlZNU0RZMlAxRlZsVWkxem5z?=
 =?utf-8?B?MzUxVCtxSDJ4WnpFNUFZQi90V0tKa3greWoyaXZPZldZSGxZVHNQeWpkTldL?=
 =?utf-8?B?Z25NT3RHaDJndTFHaExWd0YrWmM3STFoUDY0dENoNnhEakV1Nk9ReXJXU3Q2?=
 =?utf-8?B?RmtESXhpMnczRnNKZ2ZWVFZKV2grbjBuQmkrZElhTm96K2p1L3pDOTZrcVdQ?=
 =?utf-8?B?V1paRXZFeXJWdkNYRE0vSldVMzRoMTJSRXY4TkZOK1ZWcHNvUDQ1S1NXTWow?=
 =?utf-8?B?NmU1NEJqRnZLamNiUTZlV1J5bktuNjJ1dFl3T1B2VEVxVy9FU2VMOHAxcDdq?=
 =?utf-8?B?OVRITTEvbHhzbWoxWXNjODBGR0xxcm5VRlk5TFh4OWJvTzFMMUlHWStPTDNR?=
 =?utf-8?B?bll2dmd6UjduQ3RFN080UU9DRTF1a2wrVlNWTC80bG5Zb2FnN1lBbWpKRGhm?=
 =?utf-8?B?RnhTMEU2S0dtejFPYXdrcW9VcVRmLzAxaS9MbE5QU1B2bjVtNEhnRG1aTk4v?=
 =?utf-8?B?V1R1NWVaMlhHaU1halV6ZU9hRFE2SFJlM08za0FkamtnMGVpT3JJMW9INEVP?=
 =?utf-8?B?aXMzQWo5Q1R6UFN3SDkvZ2VTbzFNTWpOY3dhVVhMbE52ck15dERsZ25zbGFK?=
 =?utf-8?B?WGQvM2kyMG5rcHRrczZHdEI3YkU1T09xd1M0YWxnS0hzL0ZwZmY0K0lhTVZ5?=
 =?utf-8?B?L1R6SUJkR3lNdGRsc0VnYmN5WlNhcjlmMWZCZmh5SWUzZjVKVHYrNWZreVNy?=
 =?utf-8?B?MnB3Nkl4a0hSZmtpT1R1ZkxaeEZUbUExUWtMTlRMUzdzMjBlcE05azVnODFz?=
 =?utf-8?B?ZXpLcXpLSGZTQjJNT1dxVHhIWTFVUndHeU4rTndVQ3d5b3hIN0FvbFFIb1Jt?=
 =?utf-8?B?blQvRndjSWt5Q2FVZzV0WUZ4Nm5FSkpZbCs1L29WYmV2cWcxbW5UdVUyaXhh?=
 =?utf-8?B?dWlncUtYSFdTZjJMSG0wNEIzV3pWZDhCMmg5L2U2cTBJMVZQRUhid2N2WWV3?=
 =?utf-8?B?Um9mV1lobldvQjBaMEd4Mi9hek5PRTI4OTFKeDF0SGdyVEFQcDZpZVIrOFQ0?=
 =?utf-8?B?d2xQSElFd0RpdnZFRTJsMHQ5b2w0ZEhHT3QxSXBVdGUyeTBJRHUyMGJPUEt2?=
 =?utf-8?B?cTE3NllhcytPdkhjdWRmTE4zeEVqZW1zaUdiUm9jZUIvZVl2Y3BnTmhnYVlw?=
 =?utf-8?B?NnQ5OXhyV2Yyb0tuMER0Q3dlOU40bFZCZDlxMm1zV2xianB0L2dxUkJvekF6?=
 =?utf-8?B?QVRXOVBIUDBtYUZhWXFzZ1JoY0VnaWdJbTBGMzFiWWhWcjRqVHdZTHZVWExL?=
 =?utf-8?B?UzdVeXdaamltbDY4S2FtTG5sajdoYjVITXE0OU40UGFiQXEyYWU1KzJhbHNV?=
 =?utf-8?B?N3Y1UitxUytZV0ozdk1YQnIxWmVDeG45bmJMUnpKZjFuUjF5UnJQMWd4Zkkx?=
 =?utf-8?B?bEVaOVE0aVRmVWV5blArV3ArZDExWVh2eVNsTXd6MnhhUy9nakh1M0NkNmNn?=
 =?utf-8?Q?9TwcOAlVDl4nQQlqVZ4vKE0TH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace51eee-7d7b-446c-7996-08dc6009f414
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 00:45:04.7896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxODgcMnFZZqNEMWOUYrddGI/hgGb8SAdF8AgjnoVx7mYT9KF9nNKN+yYIrT74Yc7lACiteG03kCYPfmYmwOrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308
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

Hi Kamil,

Thanks for your suggestion, we reflected it in our final commit.


On 2024-04-17 05:08, Kamil Konieczny wrote:
> Hi Jesse,
> On 2024-04-17 at 09:17:01 +0800, Jesse Zhang wrote:
>
> imho you could improve subject, was:
>
> [PATCH i-g-t] tests/amdgpu: add check for deadlock test
>
> and it would be better with:
>
> [PATCH i-g-t] tests/amdgpu/amd_deadlock: run only on GPUs supporting reset
>
> No need for resend, it could be changed at merge.
>
>> Only enable deadlock test  for ASICs supporting GPU reset.
>> The issue report by:GMP, Vikram <vikram.gmp@amd.com>
>>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
>> Reviewed by:  Vitaly Prosyak <vitaly.prosyak@amd.com>
>> ---
>>  tests/amdgpu/amd_deadlock.c | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
>> index dc7ec4366..7a27fae51 100644
>> --- a/tests/amdgpu/amd_deadlock.c
>> +++ b/tests/amdgpu/amd_deadlock.c
>> @@ -9,6 +9,28 @@
>>  #include "lib/amdgpu/amd_command_submission.h"
>>  #include "lib/amdgpu/amd_deadlock_helpers.h"
>>  
>> +#define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
>> +#define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
>> +#define AMDGPU_FAMILY_CZ                        135 /* Carrizo, Stoney */
>> +#define AMDGPU_FAMILY_RV                        142 /* Raven */
>> +
>> +static bool
>> +is_deadlock_tests_enable(const struct amdgpu_gpu_info *gpu_info)
>> +{
>> +	bool enable = true;
>> +	/*
>> +	 * skip for the ASICs that don't support GPU reset.
>> +	 */
>> +	if (gpu_info->family_id == AMDGPU_FAMILY_SI ||
>> +	    gpu_info->family_id == AMDGPU_FAMILY_KV ||
>> +	    gpu_info->family_id == AMDGPU_FAMILY_CZ ||
>> +	    gpu_info->family_id == AMDGPU_FAMILY_RV) {
>> +		igt_info("\n\nGPU reset is not enabled for the ASIC, deadlock test skip\n");
> This print suggest other name for this function but as it is local
> to this test it can stay as is. As it looks, you could run this test
> on these GPUs but then you need to power cycle GPU (or machine?).
The deadlock tests are skipped on GPU which does not support hardware reset, but when it is supported on GPU, the series of miscellaneous deadlock tests could be run without a power cycle.
>
> Regards,
> Kamil
>
>> +		enable = false;
>> +	}
>> +	return enable;
>> +}
>> +
>>  igt_main
>>  {
>>  	amdgpu_device_handle device;
>> @@ -34,6 +56,7 @@ igt_main
>>  		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
>>  		igt_assert_eq(r, 0);
>>  		asic_rings_readness(device, 1, arr_cap);
>> +		igt_skip_on(!is_deadlock_tests_enable(&gpu_info));
>>  
>>  	}
>>  	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
>> -- 
>> 2.25.1
>>
Thanks, Vitaly
