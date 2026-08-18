Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC38C5DF74
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 14:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B992B10E00B;
	Tue, 18 Aug 2026 14:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pkgoOxOi";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D58A10E00B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 14:30:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCvNkD+gy/I366XxkG9BZADAppzkIzq92UtzuichpPEsKsXfK/v1Yt+/iL6e24XJfnm+9qBSo9Dd1rqHUwzTGI6DkuHD+JVYQ2I6uIwYl2OxbNDX+GxwKfZUIQ/ZKIK2nRjgWk84dbMatNQsXnDcz+B6Pntzp7clfyJWtzq8H1Suyd6U3n/qCtSLpya0ridRdSuNptlBVqn6f3J1KLJ6rZB09SIeU6nrXont8YB+utLwNo8pe2EhvYcA+xISKQa2lOPBRjvoZL4xN5qDR4dITA14cnYMKO/9mGusqj+kXQg21u/TazjAjDgZLSgY9k2pvt0Dh4J6x2q+wt76W+ScGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyNDz9RwGeOgRuRC+fxwTavZZTx/mLVhNBo7Gx2cT8M=;
 b=uIWtqUmde9Bx565VoikWkRXzHvNmxhxSCQHS4XoixWZqGDo6jyEnQHNdqA3+nZSd2tVSvOIf+Scl65sUJN+r7LK0eL5wnScONzrap6VsSN4WK0UHySAL6EW9Lea/w4qWFCq/RYQr4ciDjm4iiL2aUEV0qKEMoZNMMPAnzAJ+pUuvjyMzZJOBOzsrm/o+O9qYhcePnlqs4vkwYF3KnFXR70n4zHGUrMTy23GLlXoeafs+0Lp9M4EERHupMu5Y5XqNfZGNpAUQdBxdO2y9XGM5btUSgp3zpKw3Ki0SVDdcSHHRD398SZVIgg35KsTkHHKhNdYU7rT0mD93VnGmGf9wcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyNDz9RwGeOgRuRC+fxwTavZZTx/mLVhNBo7Gx2cT8M=;
 b=pkgoOxOicUvc8btn5rZH4ifWtAmI7LfGttN43vD3zJ8qRCZAmPIjzBVBzNWNAVQjG/BYfcjpyciBzqzQlWpJrHj2Vq7Ax842QiWili9z14qKmtsB+kMO4GlviVfBWNsfXjvJLTfN9JxVZvc1BbAK+rcs1KGfMB/kxEySklflIAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Tue, 18 Aug
 2026 14:30:30 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 14:30:29 +0000
Message-ID: <2216cc39-92a4-4472-93c9-96ac89b8d6d7@amd.com>
Date: Tue, 18 Aug 2026 10:30:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/6] tests/kms_color_pipeline: skip if not an
 intel device
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Uma Shankar <uma.shankar@intel.com>
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-7-mwen@igalia.com>
 <62e1b4a3-ba46-4117-a3e3-05f9866aa614@amd.com>
 <83fb4a66-cf7a-4ebb-be39-d3f51da4baa6@igalia.com>
 <9e390216-298b-45c5-9ca7-f8b65ae957da@amd.com>
 <4a5e0dea-1a44-4e5a-97c5-530e61a92ee3@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <4a5e0dea-1a44-4e5a-97c5-530e61a92ee3@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0135.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::16) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|DM4PR12MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: a8dfc50a-a330-47e8-830d-08defd3540db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|23010399003|366016|18002099003|22082099003|56012099006|3023799007|6133799003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 0DFzALZwsSbkkhCq8u6R13dbmX7G/nyH+dYnJMA1PPWD3AlfNpk7QOk2dPkIZRYjC5lP0hOQTBM/3yfbEt1Bdqnq8rcxeCsnK5zwBZX94Fv+uwVbv0JaPyk5XMnCDV62Dd19dwt9WQJXubMpBeXLhn8gtR4EAg0tcmeXIrATPfaUecsiFnHcFt6EhUx8CVYl+2yfOxGEB7dXVY3ijyO6baLT8PO/K8XjZWAqAnNGzIXQe9H43AT2ivbD2c0FUSTguj9TUtRTHDbzDLgStl8CmDaI3zcVVH71170+3GNlYXe8wE8T5vEWyGTTfauxH1mdlfEKBY/+UtAly/RreypK3ZE70Sa7UHROELFizhNnXoDYpYAGnrj1nuJIgUiE+tVgJIXoAaeINnGSl7a+TW9mI5/LXl9OYEU7ZsJdO7rPPTAkZLeW/Xs/0o2PaYMBimD1G7lnt+lm2MuIJlgMDtdbOCFTex7MySksj7kPpsEKfMPJEOkqxH7o8JE1HfUq9dLQkvMcmAd7Hc22Ak3YGbi0CjHrS8ZHpfKWNN2dewBr0672KO0VEgMS89eaW1L7ct2Ic0qd9P0FvyFdrc1fpx8/FmdDZ/WoM7l5vRvbfnFpKD6y7NqMBCaw+i9SlwBU09vXWmCHcjspB2PxjANLRF4glLTa5ZIOo8Z/0EPa3/TfmWo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(4143699003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGo5QldlWUtObDdaTzJjMnE3cyt4Zkh0R3BCUmZac1hxN2ZXU1FqUkFxM3hU?=
 =?utf-8?B?bVdSK1NpbjBmb2VHd2JrdFBzNHZ2aWVzS05ST0hGRVQxQTlrckIzaDdNWUQr?=
 =?utf-8?B?a0tRNWV2bStlSzBySS9WNkQxRjJiRWlMTXRqMW1oSkdHTWRxSkd1Sll3UUdK?=
 =?utf-8?B?V1lQRE0rYmdKaGhIWlNEVC9yMHVQYSttSnhrQXBZbWtGUVJzM01lamJrVUMx?=
 =?utf-8?B?WUFmK0tNNEQrQlZHQkVZK0Z2ZFFMVEhxTzE1R0N3V1BLTk5QWXUyWXZhS1dy?=
 =?utf-8?B?eUdMVWQyT3c0bUwyeGJXZUxQQ2pZcHF6ZGVrN200OFl5RGJQaitLL0lMYlVC?=
 =?utf-8?B?R3lWTll4TjVyaWFtbk14amlROTY4TXB2OHBUVmw3TE9VZ2dGaEdvRnlkRUxN?=
 =?utf-8?B?Tlh5am5CTm5RZWdoUTJHWHNkZ2doM3ZrdnFvWHJRSDZNRW5TaERnNnQ0Ujcv?=
 =?utf-8?B?UmVoSC9UNXhlNC9ZTUVsL1VWdGQwa0IrOGZHRjNTcUhZR2tmSFBhak15amtz?=
 =?utf-8?B?eTJ4eDJab01TY2lyUWRrcVVlVWJxQ0xnT2dTY1UvODBQQnI4NjJpUGlzcXZu?=
 =?utf-8?B?Z3Y4cWx2R1B1QUpFWnRkenBlbTFYeVFIRVYrRFdLSmF2Nkk2OHl6QWV4RzBn?=
 =?utf-8?B?UWJsSyt6elJaN1c1T2JYVURVR2NWcTJYVEFtc291ckZneGh1b0FHZ3BjeitR?=
 =?utf-8?B?ZTh2Ymw1WFpubHc2WVowVmQ4aURySE0xVVVPRkpQYm1yelVBSytNL3hHdnF4?=
 =?utf-8?B?OVUwTjRhb0kyenliRFM0emtDaE5hOTVQdTljOERRZnZuRVFDMzIxc2VySzI0?=
 =?utf-8?B?OVVXbjlrT3BFOWlKVndhaThyWkt5bGhQQkhMTndramwwOEZZTDhVKy91NGZY?=
 =?utf-8?B?NVd3QnFIaEdGa1pieHpvZWkwTWY3WGlmVnI3a2RZMjY2VFArVTEwN1h6ZXl0?=
 =?utf-8?B?SXRKdFd4Rnp1L3ZvclJVR2ZhNDd5R3FIQjkxM2xZUDBrL2lkZWNLb1VpT2Ew?=
 =?utf-8?B?RmRzQ3l2dWs4cTVKT0d4VGd4ZVhsczFjNW1lNUlmOEJPM1Q5L2EvejhGQm5j?=
 =?utf-8?B?T3hkZUJNVGRWaFFNQnVKY20vYlQ5QW9EbU9wNE1jT0FGbG1YVEFoU0VHY2FL?=
 =?utf-8?B?UWRPU0pDaDNTUThpWjV4aWUvSmE3NmM3WGRya0VGSzRrcndvT0kwclRwN0FQ?=
 =?utf-8?B?dmY3dDJZZC9RR2dGbkZKcTdRNUY2T2h4RVdkN1N5dDN5T2Fkd2drS3IrWnVT?=
 =?utf-8?B?WEJtK0NTN0xJczQxVndGUi9lZFU3SUkxcWl5T3poYjFpcmFBVXdEMFlnbysx?=
 =?utf-8?B?eHVzeXdkdHBRSDI3ZTFTQllGVzdnVndHYk1kNm5WTUU0Z1l5ZGI5Y3dBL2oz?=
 =?utf-8?B?VXJwUDJrQXFoNGp3cGloeDJneWVuUkphWi93elR0R29zd1l2YXduQ3c0WnNR?=
 =?utf-8?B?Qkp6ajFOOXlIRDJEVDlJOGRTc0ZNZFo2SWFoaTlyZFJHNUlBZ0p4Rnk1anFs?=
 =?utf-8?B?WXFBVU9UaXR5SFVuNXJrRllkNXA2MlNIenVJZXpGb2t1a1FqTXRZS09CYWVq?=
 =?utf-8?B?Y0hqeWQwRENwamdtdlpXc0tyVGcyNDJUYmljVVpGbnJNOHAyZHBPc2xkZEVr?=
 =?utf-8?B?NFFVL1VhR1duR1B0cVZXRTA4Q0Vmdzd0Mk9lWTI2aXV0b2ZSNzA4ZmtkMHVP?=
 =?utf-8?B?UklXQ1g3T04reWt2VTZGdHJGSi85ZnovWFAwMm1BOHE3aG8yUXVnZ2hOSUNt?=
 =?utf-8?B?M3BBZDc5MGlBcmFMQjdOTkhmNkg1cXcwQS9QelJaQTNBaEtSaFhRTUlzVlV4?=
 =?utf-8?B?Ykc4NXdydEZ6aFp5UEc5QTI5UzRERmZ1K1ZoMW1iSkxreHFFSHlCc1krTmhj?=
 =?utf-8?B?SVlXMmRSK1hBc0VtVFVJRzlwYmtrc2ZmbnFMQUhucUVyYnVvVUUwVG9uUkc5?=
 =?utf-8?B?eVVVeExuYmQ5R2ErdkdWY3c2WFpxSTRwUVBPSlh2U0t6U3NMUzRHOU9zaC8z?=
 =?utf-8?B?Sk9FZm9mcUtjWGNpbUdLL3ZySS9BN2l3N3YyOUZLZlEraXVTVHdISDRCOTM0?=
 =?utf-8?B?dm5UbktaTFJ6dmRhYTV2bUJiZkdPaHEyUndpalMxMHNqYUx6d0U0WUptSmp4?=
 =?utf-8?B?b3h2SVBOaVgzMTZCZE9WRGM2Q2x1RXp2RlZqNGVrQkV0RUNDcStscGZXWGI3?=
 =?utf-8?B?RVNINnVhUTJJZXFOSllUUmlDeERCZmhMYXlIclNpQTRPQVJRRTg4VlUraHB1?=
 =?utf-8?B?dlZQRjBsU0VmTWxRZWRqK1dVa0wvYU95UTErUjdJZ0VpaWhKQTd4cXd6VEVT?=
 =?utf-8?B?RDliRUFtTU1iaGptL05IS2Rpemk3emZsVVNQdnBybng4UWZWVldnQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dfc50a-a330-47e8-830d-08defd3540db
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:30:29.8327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWoPAHdxb89fCaL/nnMdoausEzm3UbCBq0MrFmmUREzIeeUD5v3wAkEL3Y28Akla75B0ipzBMxvkuv4GOHWNjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772
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



On 2026-08-18 09:54, Melissa Wen wrote:
> 
> 
> On 17/08/2026 17:39, Harry Wentland wrote:
>>
>> On 2026-08-17 11:19, Melissa Wen wrote:
>>>
>>> On 14/08/2026 05:55, Alex Hung wrote:
>>>>
>>>> On 8/11/26 08:23, Melissa Wen wrote:
>>>>>   From documentation, the test requires i915 or xe driver, so make sure it
>>>>> only runs with intel devices. In addition, it's a CRC-based test, making
>>>> Should this test be moved to tests/intel/?
>>> I kept it as a KMS test because kms_colorop relies on writeback support, but writeback isn't present in many drivers AFAIK.
>>> So these CRC tests can be used by other drivers if they don't support writeback but support colorop.
>>>
>> In that case the test shouldn't have an igt_require(is_intel_device...). It should
>> use a generic check to determine whether it runs or not.
> 
> What would be this generic check? Something like "CRC support && !writeback"?
> 

Something like that might make sense.

> I took this `is_intel_device` path because on one hand I think the test could be an
> alternative to other drivers that doesn't support writeback, on the other hand I see
> that the current design is not generic enough and I can't ensure it runs well in
> other drivers - for example, rn it doesn't meet AMD's requirements.
> 
> My reasoning was: "the test with writeback support is preferable (kms_colorop); if your
> driver doesn't support writeback, work on the kms_color_pipeline test to meet the
> requirements of your driver".
> 
> I can check how it goes with VKMS and what's needed to make it run on AMD (probably
> the active primary plane is missing here too). I just don't think those drivers need
> kms_color_pipeline since they support writeback and color tests work better by
> checking writeback output instead of CRC.
> 

I'm just tired of seeing is_intel_device in "generic" tests. I guess that's
why Alex suggested moving this to tests/intel. One could always move it back
to generic tests if another driver sees value in this test and actually makes
it generic.

I don't think a CRC-based color test would work well on AMD, and it'll likely
have challenges with VKMS.

Again, not a blocker, just a statement about "IGT hasn't been 'Intel
GPU Tools' for years", which is sort of true and sort of isn't. It's a bit
painful for parties that decided to use it that are not Intel.

Harry

> Melissa
> 
>>
>> Harry
>>
>>> Melissa
>>>
>>>>> kms_colorop with writeback more aligned with color testing and
>>>>> validation. Other drivers should work on adapting this test to their
>>>>> needs if they are looking for CRC validation.
>>>>>
>>>>> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>> ---
>>>>>    tests/kms_color_pipeline.c | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
>>>>> index 78860a845..3978745a5 100644
>>>>> --- a/tests/kms_color_pipeline.c
>>>>> +++ b/tests/kms_color_pipeline.c
>>>>> @@ -372,6 +372,7 @@ int igt_main()
>>>>>            igt_display_require(&data.display, data.drm_fd);
>>>>>            data.display.has_plane_color_pipeline = has_plane_color_pipeline;
>>>>>            igt_require(data.display.is_atomic);
>>>>> +        igt_require(is_intel_device(data.drm_fd));
>>>>>        }
>>>>>          igt_subtest_group()
> 

