Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B298FC61DC4
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 00:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD9310F1F9;
	Fri, 28 Aug 2026 00:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mYytvgCR";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010014.outbound.protection.outlook.com
 [40.93.198.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC1410F1F9
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 00:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWTvS36BxePk/xPFvm/RcBJ7AMeV1gkbJEnR+tOzE90spbD6lttRe2zJ0DxY7//I1+OPSXrY5hqKpUbZPGkVxsxXTqIuam6TMYtOnEUnavQjxON/5sbNkF9Gwk3Ug6uM6prTiB6QCVTEMyulSJGvzJO8gDSB91ufx4N4W8QjVbirvwhIWbBxaulp8FJC97ElHK9Muf5Y9NQzt+rgmdKRlw4B/wlumPq9q3ea9o8q0KJio0bSUx2wyJ+ZLRJn6Lr+HbfIa0dV2DIYBO3Vf+xod8ErkZHnRPu78BRUZ3NkG+kUTWNK2xe21U9h8dCeo3qghtIBj5WRnQwla5PoOJUndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJ+ug4X1kH0GIefC66grVBV43hpJI3rpgDQkGSny63s=;
 b=U9FXt9YOxnN2dbqn5kgOUeQ1gLDsVmXSKA4WDeumbGC149ouMZVnhjJzAAx0KWbCen40ZPyCYeuryXYO1465YbAIvUEjXTy60VQeQXgvLSYL5iFLzB7ZHTNKw7cSiNcGjKChDpRfXUXOHsiKuIzme+j1e1o9WPkhUJvxEej2yKmsYaMY8kFtwhL5D9Rk/lrK2YLRGuMOqtcahSmq2u6ei3E0gz16zLfJ1kjl+RheUFAgdhsdYiq2plLwNocOk26iXACiuhBWBTL9DI6+UYfQuewne6Q4Cp1FhvVQV6eznH1HcMtoEnjElMEk7aMAT0prAqqO9vdi0u4Nd1NSY8yEiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJ+ug4X1kH0GIefC66grVBV43hpJI3rpgDQkGSny63s=;
 b=mYytvgCRscASJS9xLZ/rdcFRQ2oT4yBokExJL2PZF0l0/Ff44Tt+szPmb6LEY2027jSC8pcie9RUl1S8GniTpUnRHDcbJ5pU7tNeVHTzT2b4VNQv3lR5XSBlNrnfRq/XIvh3ajn62x6RGN5tYKnNYhsTtdiY7C4Z1pWtAM+oebw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH1PR12MB9672.namprd12.prod.outlook.com (2603:10b6:610:2b0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 00:15:47 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 00:15:47 +0000
Message-ID: <bd02d25f-fb9b-4f38-b189-0449af5ff897@amd.com>
Date: Thu, 27 Aug 2026 18:15:44 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/kms_colorop: Use local variable for color pipeline
 cap
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
References: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
 <31a2d660-7968-47e5-ad3c-e32dac8c1a36@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <31a2d660-7968-47e5-ad3c-e32dac8c1a36@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:303:85::18) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH1PR12MB9672:EE_
X-MS-Office365-Filtering-Correlation-Id: a4cb01f9-fced-4f89-110c-08df049981e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EJb/x0lIxmsEoH79/82NgaGuDCl+92u08tD0YQshpvwCN+pZgQTmznqgjsAOm/H++vDv6VSKwgTxW4FPGbqz1/EhaI4psOUPdGS/JrtthBUrZPQmMQfPLJl2kngHb/KO3TYaC+cfw1nFZdZeQzCD72NjtNGGcH7Od8rbtPNLLC4EPWbcy/1MdEQ0S11MO4RMnXHjYigl9rLifR0riRvA8AgFOSBl+RKItmJmJ9Uj395TSUYcOvi3WVOVXf6Bu51lLToVFSeFNqbdCHUYx8kYvQKW7fbs/NUWIHAKZYbr2ULRQlfIEOugLQUCtDWtunIy2vHOU0XtHOVXgu0mPu4KSLUtYYu6VnEtWnSdkEFLCIXLYsFgdrElOhk758U4JXpY3oqoT53lrUaaDZyMau0lEn3w4ghDax4lOTgjaE3IsSxFGbXdI+3qAytsQcR83LgPlp3Is2+NmJxsLqE9Wf+l08SyoISRS7dB85ZKYlpeksK/SePoOxrlSPAypSRBPdzF4GerxooZQTgpTdNNu8PQoM+gUZn7GS3PBBE/UUJ6y28aQTHZUM3m1WxHHFaF10CVAVFIupuwuu+GK3GrSlcqk1zLVjFl32RXeVjzKyFctLCeUJpneP6UqHsZYNeJBcEl6CbupkfwhhMi5MnM/G9R2N7rbe1qm/a3GYIdSdPbtf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGQvTVlyQnFXT3d6L0cwLy9xbHJCeTg1YTlNRGNxRjJ3d04vdzI1SUQrcks4?=
 =?utf-8?B?ekRXRURlSWp5TGZlUVJJUXFkc09Ca05CQVFTaFY0TmZWdUxmM3A3aUlObFNN?=
 =?utf-8?B?by94TnRYdFNNWHphNXNZYkwxL1JVelFlWnVlMjVhMjhwdFdlOGk4Ky9Lb0Jt?=
 =?utf-8?B?dlE3blpYTjZHc215YW4yS2haNGhEdWZXQTFyRk80ZUV5aW9ieTBTYjhWV251?=
 =?utf-8?B?dk1SR3I3OXNueFIvZmExc1JkKzdUZ2crMmxmR3RPTmJTdXlnelBWTGVva2JM?=
 =?utf-8?B?eEFCVHFnN3VnZ3lpeVlCUFdyMWc1WGJJN0Z3Zi9lQ294S1VJY0o1SWdCYkk2?=
 =?utf-8?B?M09IaTZDV3FRQ0JYSjJ1YU1VN0hNbHUxSm5VcWpsdGxnYXM3c3VXMW5HSVhT?=
 =?utf-8?B?SkdwUGFjeHczbTJLNEQwRFRDSGpmdHBwTWJjSlpvVW83REFJaWRVMmlPcVdK?=
 =?utf-8?B?MmRrVlhqeWhMaEQ3TVR6dFNENkJ6ZFA2aG8zRnRLdGZjOXZ1eXRKNVRLMENP?=
 =?utf-8?B?eDh0OUMvRk1qMmpJdVQzN0UweHlac3VpVGo3TCt6aFBWOU0wTW5xSTNrTGFh?=
 =?utf-8?B?RlBTdjMyTmZOaUFrclJ6V01waEppb2ZnZE4zdmp2UWF1R0RFUHVmS2lnZVdp?=
 =?utf-8?B?WGRyc1BWM1F5Y1ZEbk5JdW1UZFV4V0VxVVMzb29EZytXNEtWYU84dkhDMjJr?=
 =?utf-8?B?YXVnVXI4K21HcHl4elZNY0Vxd1oxYndPRlNEVFl0bGtCaS9LM3V5WVRxUHgz?=
 =?utf-8?B?NkdqSG5mM1BaenJtNmtkam00U092M21xM25DbnlEbUI2SUlnVTlSODJaVmpB?=
 =?utf-8?B?SlA0TUZUYnpKbkYrMHEyeWtvZFNSekQ1bWNzNXJHbi9tdUJUTTcyc2xselBm?=
 =?utf-8?B?RVRtb1U5UlFEb1dyU2tEZnlhSlBYNEFxa09lTHdBc1hWQUZnejFvc2dwVTYy?=
 =?utf-8?B?TGsyU01MY0FJbWRFaXBKYUN4ajA0TXhJem94aVhUUHFtLy9IODVDVnJnVW0y?=
 =?utf-8?B?UmEzdnltdlMrRnUvcVd3b1FhYUphY2N0MjlscVYyYWEyZTM4RUh2VTFlVmJ3?=
 =?utf-8?B?OFpleXYxUU9vQUVFWUVXL3FyQ0haS1ZycDRVRmNZdkRqd2JPM3F4YVIxdUdM?=
 =?utf-8?B?a3owVTUrSXpLbnJ4SVFWdGhHM3A5Y0wveDNUVUFZRG1WM2xQMnNXOXZXYWFV?=
 =?utf-8?B?ZVFZODJXTUlleUU0bjhyTVk2ZUlkZy9RZnd1bTZjb0lMYU9ZQkRBWlNzWisr?=
 =?utf-8?B?c2pwcDVMMUVlaEpPWGVzUUErdUp3OWF5RHFWWmtpWVhpdFd2aGVNQThvNktC?=
 =?utf-8?B?L0ZtSDY4aVgwQzJ4N0Q1cTA5TzlXWmszMERjMlIrc3BhSDRhYUQrVTZ2bFhu?=
 =?utf-8?B?TjJTcE13SnRDVTQ5Y01nVUEvaW5FcFoyVFFNcWQzMHJKY3dCa2MwZkRCVDV3?=
 =?utf-8?B?SWpFUHUvTzFMNU9ZSWJpdXllZFJRc0hhMzlzTjJsR1NxeE83WnBjaDI1anlU?=
 =?utf-8?B?LzhPUkRjNUQ0SHB3d090Qmt2dnFpbXpPbmtjZHpqQ0RGMmZlL1pGMnR3K2ZS?=
 =?utf-8?B?a0dKaE9saVZmWWp4cWtiMGkxa2VLSkJxTW16UlBudjdlWFJScVlBSE1KRHRY?=
 =?utf-8?B?cGVWT0g1eEJJb2JlL3RKNWZzRWxxNmJMTjF2QlFiQktqSFNLZlBtS1lCR3lS?=
 =?utf-8?B?RUNmdS9vSU1WVnIydEFEeDhhQkMvc3Zsa0FqUFNHMzVkdWczS1VBY1pLaFJx?=
 =?utf-8?B?eWllb0t3K0ZmUkFsMDh0enQrUTBDNDllUmZnYTd4YWh4RVk3dURnajhuRzN1?=
 =?utf-8?B?RTRZczA4QzRQMWhkQjJGcFBQUlVCbjZ2NE5VNEMxNmRGUjYzMFlJeEYwS0xr?=
 =?utf-8?B?Z0F4OVBNc1Zib0hZd3I2Y0ZvSkJPUUR4YUg1NVVoK1hWc0tKY1gvVjlPK1lD?=
 =?utf-8?B?Q0xiaHdsTGVoSXd4bUkyaXpoU21RL09FQm5WcFQrOUcrY1AxOG9xUmlMZmpl?=
 =?utf-8?B?T2F0cjBvblpQei9kMnZGSy9CU3R1M21lTTlQdzY5aFN4bTg2c1M3UDQvdjA3?=
 =?utf-8?B?WXNGckNSN2lPWjl3cmE4TFdkQ1BvV25uaWNKUXpOSVN0TzNOaEdPNHY0anVB?=
 =?utf-8?B?Vy9CWm9aMDBzMGVqMUpEZ09yZWNhS3QyMVpDdkY2TDNIS0VJLzJlTUlRVGNr?=
 =?utf-8?B?ekJxSmNCcVQ1bFlHcEJtZWpBZmZXOXkvaW1reDQwNUNBZmkvTmV5Y2pzb1hX?=
 =?utf-8?B?V1FkZ1VHd09BWXZLYTZHblNSU0ZvT3ZtUStkaUdLNjhWSWVWSW9tRVF2WUJV?=
 =?utf-8?Q?Cys45MZM0F3fDYNJfQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cb01f9-fced-4f89-110c-08df049981e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 00:15:46.8920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+3F7uvtcMMUvl8ltalCjp/nxx7raMaolrX8+UNksIUjsFEBj7aGyqJ3TcVMYOb/cXn1YuOgibZxUeDJtLUv8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9672
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



On 8/26/26 23:31, Sharma, Swati2 wrote:
> Hi Chaitanya
> 
> Patch LGTM
> 
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> 
> Also, it seems we have duplicate igt_display_require(&display, 
> display.drm_fd);
> 
> It is required once. Anyways, its a separate patch.
> 
> Alex,
> 
> Can you please test on AMD driver with above change?

yes it ran fine. Some inline comments below.

> 
> On 03-08-2026 01:33 pm, Chaitanya Kumar Borah wrote:
>> Following the pattern in kms_color_pipeline, set
>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE once and stash the result in a
>> local variable, then propagate it to display->has_plane_color_pipeline
>> after the final igt_display_require() (which reinitializes the display
>> state). This avoids calling drmSetClientCap() twice.
>>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   tests/kms_colorop.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>> index 16db0b8ad..d573d2ceb 100644
>> --- a/tests/kms_colorop.c
>> +++ b/tests/kms_colorop.c
>> @@ -406,6 +406,7 @@ int igt_main_args("d", long_options, help_str, 
>> opt_handler, NULL)
>>       igt_display_t display;
>>       int i, j, ret;
>> +    int has_plane_color_pipeline = 0;
can this be bool?

>>       igt_fixture() {
>>           display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> @@ -417,15 +418,15 @@ int igt_main_args("d", long_options, help_str, 
>> opt_handler, NULL)
>>           igt_require_f(!ret, "error setting 
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>> -        igt_display_require(&display, display.drm_fd);
>>           if (drmSetClientCap(display.drm_fd, 
>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>> -            display.has_plane_color_pipeline = 1;
>> +            has_plane_color_pipeline = 1;
>> +
>> +        igt_display_require(&display, display.drm_fd);
is this igt_display_require() necessary?

>>           kmstest_set_vt_graphics_mode();
>>           igt_display_require(&display, display.drm_fd);
>> -        if (drmSetClientCap(display.drm_fd, 
>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>> -            display.has_plane_color_pipeline = 1;
>> +        display.has_plane_color_pipeline = has_plane_color_pipeline;
>>           igt_require(display.is_atomic);
>>       }

