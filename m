Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3684C5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 16:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B48310E261;
	Mon, 17 Aug 2026 16:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sYAAHPwc";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4D010E261
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 16:08:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7OLhxgIlHpyzFTgjdI9cJM62QKBcV/jdERitscKni7tfEBSq11rjSHXBHzGJ47TCnK81IZqk+cdygUan2GMMzsG2wvDjPwkfl2ut2NfIcfyaWQhhJIAmZsnbw+/+L1kg1aEYdapKjMApnIvqeWIoZBURz5hr4Ye1g103tGUwkjoxyKy9EkxtliuzZEPCN2iBZcBT18FCVOpluLpGzAtSsColAY7ohkXq6ueMD6svCG1VAb9KNA4dh1M66xEprBFkEOFbETK32HQAPSMJSjG7gKBcshMqxPQrRc2qUS/ABlDxitHN9CJBns+zEK1XVbUvvvjp9HFEbI+Wp1TXfIOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcfKasu7XPIjCK0aUfRt725+CUf60HX7q4i7eWUZMVM=;
 b=htTy/WtWjZuEL89oNPMrD3aGe72idGUUExG71vD07QueVv4rXRJlo6YPhVV39R6qTwdhmLynt7FczSmY5lbhgggcOnWwtvklBlT7QBpBq2PksjXvTl0TO2maW7fYva9Ad75VIe/xmtS4cxdrSZhPvmPoQVIinCOnIl00xB1QvsW1hbyYUdk5EQH6b4ebOUHcClsWWHZEjzS1RTlkR8knM/IAUmRpQ916C85E0ZOc1SoP9amQyRccTJOQ4xVyxmWnsN6y8K+/nRRDXfPBoMqcwwTpbaS8z86ubfoLoMnW3bCKgzJdnQrpY8s03AfHSl1eD0MFbvpcA9jgtg9sgeUk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcfKasu7XPIjCK0aUfRt725+CUf60HX7q4i7eWUZMVM=;
 b=sYAAHPwcvr5i63Ay0oVBVBkfIbITO4x8hPeHEhM3llrp0dzu9AI6xYlQ4pcMKGREDCSCjHylej/YZzgGaUAkCY+82glKgjwZA13tIWvjzYZySW4lXd8+7dzypMKu9Fpq7vTBYIDXH5eg/pLoibmbm9xTQRSvr7F6JnoZh0zuRBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 16:08:26 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 16:08:25 +0000
Message-ID: <d3e26168-276b-48ae-a85c-11fa87e5ebb0@amd.com>
Date: Mon, 17 Aug 2026 12:08:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/6] tests/kms_color_pipeline: skip if not an
 intel device
From: Harry Wentland <harry.wentland@amd.com>
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
Content-Language: en-US
In-Reply-To: <9e390216-298b-45c5-9ca7-f8b65ae957da@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0169.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::20) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|CH2PR12MB4167:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e192fbe-7a21-4e3a-5101-08defc79c468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|7416014|376014|1800799024|366016|11063799006|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: oinxVryGTuF0ksuq9zTzFi+D+LpkurVjpfYZX/r+PS4g+HauAJC6wf8HoRpbxjVwWbYmXHDTAW3NvHTSgMqSkv2jv42CGpRxRa21aTJCwDcWkEleZQxps+IOyV7+wuA9l9eBTXMvF0yzNVINStoLFajqFmpAjm1pV61y+s7qkFXREqG8NZiJngpD9IJyyWsklVlUbldZgSSaxw4PwQQGrWThkIluG+mQlkosoy8gelDl19nxkEMdNk4v3PATT+WzqdGBR8MfJ8giUsbuAKjzVeWm51qI0d4HfVtpv4abiGhfIxbVGYsNXsScFsDmrGpZJYPnGv6+DnqF+NFZK/VbTR/U2MAOfaQsZI1vGKCFcOq0t41ODi8snnE80u7ykpHGrG5LPBp1oB2T7F6NiomXKdeNeWDOIOdqlEWFC+9KSIyM3FifUrSjJiZ63gwMc5YKt3/2w7jqWFWN8+eAWbCVyiiVzdERZ21fBB45Y07KkXvCgMAUslWZ/1gJ7QeBy+BKBWDNxijBNc734cR8W87PKqiOP7nSrCquznJSQyQIByvRnssZECRx3YR7w2WYVWCZ4pncdHIPMKB5qSxNbP7ai0oam+HMxdxmXbeCtlKAvGaUY6PWXDDVhmYcLuiavsdbxqDAQ/lQrHsfgaunrUk0XUUmAfajo85uXwHvm3ZO+dA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(11063799006)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVp1ZzBsVmRrQ3BmeDJrdG9SQ290bkI5Wjk1TFVra05DNm9SMkVGNVRzRHk1?=
 =?utf-8?B?OUlqL09pMTBiNGIyZEwyMWVxNjBOc1Y0OXhSVXVLbnp3amYzVmw2Tkc2N2Vh?=
 =?utf-8?B?R0ZtSHIzSTVqTjIyUHVXM0xzRzNoUnlkNFhoWmw2Tk01YXNrdmJtQXdhU0k4?=
 =?utf-8?B?QVg1djVKeTRUcUsyQWtjaHkvNlRVWmRqQ1ltYXlmak4rRzNqOHFJS2VBUDk4?=
 =?utf-8?B?bVVuY2ljZ0dGY2tjSER5cUVVVHJRTDRWa3ZYcnhGeFpMSkdiZzhNZmEzeUth?=
 =?utf-8?B?VGw5cll3ZldtaVpib2VoWFlTenJaeS8valk0MXMzU3B5MldwODlRZjBrVWhE?=
 =?utf-8?B?T3JEclNaTm5QeVJxenlTVDVyYjlOWGt3N09ZVGNFMTdDaHNJeDJabVJWOEFp?=
 =?utf-8?B?WnBaaVpPZDlkNWZjWjhjWExMZ3BnL1JmdzB1OFB5eGM4OExzSE5VLzJ0ak9w?=
 =?utf-8?B?MzUySTh2SW55YlNMWkpiMS9rd1V5M081cEhNTWRJS1lQSm9RS3F0WnNNZUpp?=
 =?utf-8?B?TElHNllId0VBdFl3ZUkvY29xblNwOElxallPQjcrR2JYUkVpN3FvRXdGRWxK?=
 =?utf-8?B?c1FrU3B3Q01iRVFJSEwxcGdBckRiMlpZZnBWUzg5MUVQZExvZXlWVFU2SGdp?=
 =?utf-8?B?cmp5NnlYT05nS1hjQjA0aW5ZRnV6MXIwVDJ2WFJad1Fwc3EyM1lnUVF0TXIy?=
 =?utf-8?B?ckNXdE9wcWROVUFUcGxta3BPZ0VTYTc2cUVUWHFmRVN1T0Zvc0JPS2wxZGxo?=
 =?utf-8?B?RzlXWVBkeTJUODE4UGJaNE1oY0F0d2Uyci8vcXNzUWh0S2NyWW5FZS9oaDQz?=
 =?utf-8?B?bXJEemJFbHFuY1JIOStKaVpESjFxODFnS2lMSWQrSi9uOHFGQ2lMVTJjaC9l?=
 =?utf-8?B?SzdpcWxtRXZWYUtYeXVVZ3dmNmo0WmkvV2ZCL3U4SHIxZkVZMk9KWjVMbDR5?=
 =?utf-8?B?ZnRIeVlGckVyWWZjRFFVUmltUlk0RDUxWVlUSURwKzlsdU81MzhqNU1hdGlY?=
 =?utf-8?B?MFl2RUlubitsdW02N2dWK2tGRENSUDdTQXl4d2dzZTNkMlZDZFcvVHdkZElL?=
 =?utf-8?B?SXd2YXh3OHhiTnI0SHcvOWVIWEpIN0lRRmJ3M3JOVk1zSlEvT0FGOHM1N0ZJ?=
 =?utf-8?B?UnJmVEVuOHVnZ1VZZk15dm5GOFJWZC9XbkxESTdVeWRvMUxtV2x6Uk9UNnpO?=
 =?utf-8?B?alY5VUxjdDlkdEF5L3RhSklFcjR4bHdzV3lHeGMrb2FEclljNXhuWFhiQStU?=
 =?utf-8?B?YUNwai9xNndVaUgzQi9RdWYzd09ZVk9FRkJyYVBoNVViNzV4TDhJVFdoNVZv?=
 =?utf-8?B?bGY1S0NQdURsbWQrcFFpTlFaRXgzYW1WelJWdWVweFVEUU80dVNMVjhhRys4?=
 =?utf-8?B?eHpXVkVJcGlkR0NicVROaURwb0NpOE1lbUFBRVNSdC9raEhicUUyMXFTeWZw?=
 =?utf-8?B?S3NWb2cyRWhGZVpQb3paMEpDZWlNMEh6SUZxTXJnU2NnY25iZCs5cFhuMHNp?=
 =?utf-8?B?NGF0T3pGOGdUbnM4TjVrZ0l3ZXZNSkcwd0M3VnRvZmM5MFpjc3FuQVlwc3p5?=
 =?utf-8?B?T3NvaHAvSDFUNmJNc1Bkb1p6T2xxWmhGbndteEIrazdXWFEvVjkyM1VzWGFI?=
 =?utf-8?B?VHI1R1dDMERYV2UxaVpqQ0JSaW1KZU43cTkwYlV3c3pBYWpReDVvdmFVaEZF?=
 =?utf-8?B?MDdZcmdCVE5ZSjI3ajNwaDZxTVNOWmVLUU45ZzVuMjVTa3NHdEZTNWk2TExs?=
 =?utf-8?B?d1RkM3JlVjhmNER0a2VWM21WTlM0U21DdXJnMGVSaldNbVVxUUlJT0hoWDZJ?=
 =?utf-8?B?QzIrdnl1VXNPa292cEJKOVJHdG11V3pJT0pvcnFHMThMZUVpRHk3VUVvQ3dn?=
 =?utf-8?B?dFdnWU1tNnI5MFdPTUNkZlNtU3JVd0owT0RCdkRsTkZ4bHpzcVM5SWdKdnBO?=
 =?utf-8?B?cUwyQ2dQbnBSVkVGSmp4QnJFL1RTOElFbS9UVHNRSGZ1VGtxVTNSNTlwbkV2?=
 =?utf-8?B?NXJ3Y0hsU01aR3d5bE5JaDZSUmVSZ1RZbFlrVzVYVHZobk00L0UxMUU4bU51?=
 =?utf-8?B?cmc2SnRwYXlXeHFRa2o4UXNqcTY5MElGREV0VzJWR2JlZFc5OHRqeUJ3b1Yv?=
 =?utf-8?B?cWEwNWh1ZHkyNEdaOFluWnZuN0d4UGExMS9CazNPQlRSazlqamlBSkl3Ukxy?=
 =?utf-8?B?MDhuaVNMK3hEVUpESkNTcW9zN2d1NXNlU0trOEpoS1REYmE0SVkrZy8yQVRS?=
 =?utf-8?B?UXRBdjE3TTJUajNrOElqVVEyOThoUlpsNEFyazJHU1FJNzVVSnViZlMyMTg5?=
 =?utf-8?B?TmEveUhEei9iNEwyTllaN3lQdTVZMUhUM1FkVmkrL3JwR0VydThzUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e192fbe-7a21-4e3a-5101-08defc79c468
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 16:08:25.1786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcStSdXi2qx3YBovKq3CtuIAXdPPHmCf5778RpD5ecjhjqct5svgH9ThrmQXhOUFniM7MbrXQBnVpy0jAOZEmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167
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



On 2026-08-17 11:39, Harry Wentland wrote:
> 
> 
> On 2026-08-17 11:19, Melissa Wen wrote:
>>
>>
>> On 14/08/2026 05:55, Alex Hung wrote:
>>>
>>>
>>> On 8/11/26 08:23, Melissa Wen wrote:
>>>>  From documentation, the test requires i915 or xe driver, so make sure it
>>>> only runs with intel devices. In addition, it's a CRC-based test, making
>>> Should this test be moved to tests/intel/?
>>
>> I kept it as a KMS test because kms_colorop relies on writeback support, but writeback isn't present in many drivers AFAIK.
>> So these CRC tests can be used by other drivers if they don't support writeback but support colorop.
>>
> 
> In that case the test shouldn't have an igt_require(is_intel_device...). It should
> use a generic check to determine whether it runs or not.
> 

Not a blocker, btw. I just would like to see less "is_intel_device" in "generic"
IGT tests.

Harry

> Harry
> 
>> Melissa
>>
>>>
>>>> kms_colorop with writeback more aligned with color testing and
>>>> validation. Other drivers should work on adapting this test to their
>>>> needs if they are looking for CRC validation.
>>>>
>>>> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>> ---
>>>>   tests/kms_color_pipeline.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
>>>> index 78860a845..3978745a5 100644
>>>> --- a/tests/kms_color_pipeline.c
>>>> +++ b/tests/kms_color_pipeline.c
>>>> @@ -372,6 +372,7 @@ int igt_main()
>>>>           igt_display_require(&data.display, data.drm_fd);
>>>>           data.display.has_plane_color_pipeline = has_plane_color_pipeline;
>>>>           igt_require(data.display.is_atomic);
>>>> +        igt_require(is_intel_device(data.drm_fd));
>>>>       }
>>>>         igt_subtest_group()
>>>
>>
> 

