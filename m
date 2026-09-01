Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FAEC61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 15:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6284610ED48;
	Tue,  1 Sep 2026 15:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PFG4ARik";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012071.outbound.protection.outlook.com
 [40.93.195.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0BA10ED5E
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 15:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2XG+fkKr/U1ET3xWZKt9TZRkxIlrYsDxMYowXGxeMdu/O95zJZCP2NgYoTAeWREsXLq797twtuDzuC4y+yD9xIQWK/0nGUWr71aW++0Qr0EHmIZkdFjwnHsW6jVQhK4H4Imkc7r51zyF89BGmmKDbLqDTJc8DN0t+j8rgs1e/Lhl8oKrFnoh5dbOJ4LsJlL4Zo6ykWjGj6NCIj64BFxoN+7lwpA/OxMLIwDWts192+LRE0IeThEZvqWVpLuAkBGSmtDU84ye32pM5qLaBBelgO9nxPSYqEwWzBIom2GttgK7oiM2Sex5P/RDOJ6gwL33CYKstZ1M/8wTJMauc1Rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMXyW/w3nxJ5eQd5g1r1vurlbJhN5STFlmgzGgZMww0=;
 b=Ji3IC+1l33hu/9fMU75mmzW0kXiAfjap+1FP414Gie4C02zRkt/1pD87jJbF1MIREkXhn0LIsDHFJENh6KtZTSq2GgBsB2s1a8M6mNCMXp00kBRPozGaynLhAlNxXLHI+v0acBc/QrDhCdEy/R2Y15+06DVaDjjDUNgon175lh1NpMlVPnXKOdKc5w2xG4ZLWUKTjU8Ulm6ZF/YHINvhy0GYs5e5y4XHtr1cRrNv32aPvaPU64FV5SqeDjKCYSe0N83+Gb9evl1scMFzF7yd64QMkijWZudSLEEcimxIvxNAXhVQ3k8t05vFXh3oDDJdeTyRVFEm0YhWK7W9YfqGGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMXyW/w3nxJ5eQd5g1r1vurlbJhN5STFlmgzGgZMww0=;
 b=PFG4ARikSJY/LozudhloZmfZcoAyuzfvpkz+2bw03UBYNCuoo9edcqX8puPnT/5+RCyX+vnk2mpmIQB/PmPBZJ1U9aWUL9QkG/Wt+N4RfE8Sg0oGAOYRNkm3wGoVwF60Q2UDqMIoCc+TdajLBKzDnWuXIgKfZI/MozWl39XWhkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by BL3PR12MB6427.namprd12.prod.outlook.com (2603:10b6:208:3b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 15:13:41 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 15:13:41 +0000
Message-ID: <e022b211-4cb7-4f2f-9ab3-1872243de898@amd.com>
Date: Tue, 1 Sep 2026 11:13:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
To: "Sharma, Swati2" <swati2.sharma@intel.com>, "Zuo, Jerry"
 <Jerry.Zuo@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "Broadworth, Mark" <Mark.Broadworth@amd.com>, "Hung, Alex"
 <Alex.Hung@amd.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
References: <20260827185355.378279-1-swati2.sharma@intel.com>
 <20260828095854.7apqo5c7hy3n7oet@kamilkon-DESK.igk.intel.com>
 <7f78ff21-e4bf-417c-bf9d-c605b13a4beb@amd.com>
 <7fa2630a-424d-4156-b18d-0b4b3e50df23@amd.com>
 <CHXPR12MB9992204E4BC30CC3411A15975FE5AC2@CHXPR12MB999220.namprd12.prod.outlook.com>
 <33ec7288-0774-4449-8bd5-4215ca982ebb@amd.com>
 <96bd463b-6a25-4b3d-9eb3-80cdeccdf349@intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <96bd463b-6a25-4b3d-9eb3-80cdeccdf349@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0059.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::16) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|BL3PR12MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 6975300a-439f-4d9e-b9bf-08df083b9b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|11063799006|56012099006|3023799007|22082099003|18002099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info: bj99z/7SMowrWfQ3PPkPJqJJ3AZYtynztEIskx3pvN1gsA2SWwfLDB3A+XHaZT5DZlcvhD3O1dV2j8PY+rh9qJQU7N29mRrSJS5d7EDnkQ8aVxEzHXl6UTnoFdXyQqi8zuOrYczTfyudaiIpTH7WIE5gz6wXLxZFUF+8Yn26Pq0EBUjH3GfwpTN9Yc9tatYivR5ZAg0Gg0DUteAvkTErXC1yhzQdhWl+/p5t5fRhNs0CHvZXyJy4+6FQXKx4MK2eMLrKaTtw8rOOPekAUfX25VYEXwLSrf7u4d8pCEvwHgmqrdTR+Wrdv0M7sIc6l1Iq4dJ29zepYLCRUUkTI7BN1Jz3sBg5rF6oaWiNMJw89GvQxsHw1MnlDtW5hdGh7WGhZZPFMUnUNsJfqRtrdXuMH0qfxlLNjcLThqtx3UFFmo8FuRIPIQCJQBsGqCaIOgD8lbiTGWDIFExPM1FtCH7FJEcTweGGusha4Yr1zkiEKCYFU1/Ix1yUOnM/yXIllNK6ftZS3rSWay77nlZR6vv8Hm8fFPGTFkK9UhI1qbQKOphWcWdJYHWJfQZoUNZiOGL5fAzobfV5Ygsv9c57raSUgDUNPiUV+rV9yLB4VS5Q8U+K6aEvd1th1n+ij7iHjl3x+h6dbUVmkazWpdbSuYCAThnHDPl/KHWthM2mGv1sMug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003)(6133799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzVYNENhQ0RzcS9HdlgrUUJ6OGpSTTJoRnUyaXYyNFlrNEZaQk1weW5uaG03?=
 =?utf-8?B?Z0FXWnRtY0k5cFI4TkNZVEZlWmpMQjVYYmlic1JMRktaUmtiZVhFL3Bnb1BL?=
 =?utf-8?B?eC96Vk1DeFRUbjhtY1RiaXVJTzE4dlc3UWd5VnlxbzRjV0xqNlJhM2J2NnpE?=
 =?utf-8?B?bm8xbXk4R3RrUFg0WFNkRmVVR2llQkhSZUVoMEVZNjBnSUlYaFFoVGdxMEY4?=
 =?utf-8?B?ai9mQVRxaTYwUitQa1dxdkF2QXN3K1pRSlRyakN2dFlNNXc2SEl5VWt2aElp?=
 =?utf-8?B?bEdYUk51N2FTQU51bFJDVlRUUUdxbmMzMll5TWpWZ3BSL2svWHFZbmt0eDZ3?=
 =?utf-8?B?Y3p1S0Z0MjlsV1kzMm1qYnNEL1hqV045Ty84K2VkblgzZHpLSmUzUHVWSGJn?=
 =?utf-8?B?TTY0R1pOdW83S0JTTnVIR3cycDNjaXhTTGYyZHlIT3B6SGhRUjBWc21lenRE?=
 =?utf-8?B?aWlwYWNuTGtrMWZaQkZLd2lUS01BcFZLWTRETWRzQXRZWFFNTHJja1JVTXdW?=
 =?utf-8?B?eVU5bkZPTDl4N3NnOHBHYWhYNy9hNm9KSm5hS2x0SzlTandJQzZ3RmRDc2pq?=
 =?utf-8?B?bDZsY2tPUFJWVUJ4ZjR5amp5K3RUNTVBdUg1eWdGZzhSSmJIN3B1VzM1SGpu?=
 =?utf-8?B?eUNZdzF5Z05qNW5SR0RIZm1CODJBSFJRUVUyYVNrK2VYMUl4NXV3MmUwaGVK?=
 =?utf-8?B?NUhCYkw2MW5OMTVST1dUYlJvY0hleGxDUlgzRjA5dkFlVTFOeHpjWjVSL2J6?=
 =?utf-8?B?dkIwNmREUGFuK3VOcnVxZkJodHpYekNtY3haelVWVnVsN1NVUitxbFRvNzJt?=
 =?utf-8?B?MENzZXJ3cVR6eXRwbWx6ZFMvbXhHL3Flam5QeGFDNFovQWpGRkZNVUluMXVX?=
 =?utf-8?B?cGxkM1VMUjFoRUFONHh2d3p6dXlTVWlURmtnOHVLSjl5ajNCVDJ3SkFZUThl?=
 =?utf-8?B?T29zYTNRNldORjlvSGtPcENBRjhueTdVTmVzNUk3MHQxdVhKWXdjeFVGZkp1?=
 =?utf-8?B?cVRXam5iQ3dZSXJoaWtCQVdURmxTdHV6WnBFcFJwZUI5YXpBT1psd24vN3lq?=
 =?utf-8?B?VHh1TlpheDFCdUY2TEJqYkJuU0NZL05MeWUxOXhTTEdUMUtieDZCVldKVW11?=
 =?utf-8?B?bjVoT0o1SjA4bUN5eW13cEpCQktGbVVZMjFGeStrQ1o2YVRGUWVVZEtKVlNW?=
 =?utf-8?B?SHNJQ1RFMFlsMTlUWXNZemcxOUVtV3I3b3EvVDJGNUFsVEU0bnZOYnAzVjR4?=
 =?utf-8?B?MVgvMTJrU0VhQzdyNHV4Ym5rOFFGMVN2S29OaVJpZ2M1TkxtYzQ1R3lwT3k4?=
 =?utf-8?B?cm0vRU96d25keXRMbXlsYVVhQk5HQjZLSDZYTmpPNVRsUUNTRnhjUzIvQjJo?=
 =?utf-8?B?T0JQNTNpRCtFNzRwcmlneWUxTnpvZ3d5dE9SeUNYRndBSFRCTXl0RzNHZ0Fx?=
 =?utf-8?B?RitzR25hdm5lL2RGWk9ydXVGd3RqMGFhQUZRRlhMUzRGaE44Nm83bHBOL2k0?=
 =?utf-8?B?OFZkMVduQjN3dUxibnZodDR5QnovUzBSMkc0bklNSVdhVW8xMkpMbkZySkhK?=
 =?utf-8?B?T2hUVVYzbEtoNTJwandXWDE4TDhtV1hvT2wvYnFNYzR6S3lkRTZmcGFML3NR?=
 =?utf-8?B?UllweHZsU0hKWWtVdlRQQ21sSDBEcUpZMVluMGRHeWpHdnFBUHBvZ3lFb2Jt?=
 =?utf-8?B?ayt6cXl1eVNwM3BhR3Z5bDI1RFNkckJVcjRQakVkZjlSVnIrSnVnQkIwQWNm?=
 =?utf-8?B?ci9qeGFmTmFURTVuczQzUS9tZ0J2VVdrMFlxQXRkQ3Qwb0FkQTVTRDFrdDRp?=
 =?utf-8?B?am5FMk5hMVVhakx4TnJycWRPNFc3RVJsenhkcUN2cXYyV3NQeXp5WWhkb2Q5?=
 =?utf-8?B?cldLR2JieWtSd05Ec1FzMjF5UWkrclVwNnVab0VkQkNDbG90SG9UQmozeHFF?=
 =?utf-8?B?cUNsc0wwV0Myak5RQXVoNTFGVG1oWDZpUVpOR2Q0bmFwZUhUbnY5WGFETkpX?=
 =?utf-8?B?RjUvZ1Q3UzV6djBqaU0ycXRhRW4rWW1iVHV4elF2cUlpNWIvWTg3N3FJcU42?=
 =?utf-8?B?TjFtTDZrVTRnRThxWFhtM2d5a21JMWlDV0NHRmlUaU1ML1hOdloxY0pWUTVX?=
 =?utf-8?B?Mlcvdk1xbE95bVVWd2RiTFdwQjZ4QnhDbjIwNHNjaitoQVpJYzNNRXdFckwr?=
 =?utf-8?B?SXI5dEx3TVgreDBmbDR3dzNqeVZjbW9CaFgvbzJkYTU5YStFb1hhMmRVYU5n?=
 =?utf-8?B?RVRBZ3ljeGpoM3hoNDVPQkpJM1dSQUxoKzJjZkNnWTBOOHVFdzl1ZVN2Qkt2?=
 =?utf-8?B?b1hRTVd1WmliUVBDQkk3UzJTUHhHZ08rNjZQSFg1YUNQMXZVYi9OZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6975300a-439f-4d9e-b9bf-08df083b9b1f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 15:13:41.1120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yxu9w02uZB1S0x+FJIKyjAlv8pho16SIItcomriJzsSxNXExUFknDfwDLziazbz8P75y4/O+wgpyAYxyPXWTgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6427
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

Yes,

Acked-by: Vitaly Prosyak <vitaly.prosyak@amd.com>


Thanks , Vitaly

On 2026-09-01 04:43, Sharma, Swati2 wrote:
> Hi Vital
>
> Can you please rb if everything looks good at your end?
>
> On 28-08-2026 08:26 pm, vitaly prosyak wrote:
>> On 2026-08-28 10:53, Zuo, Jerry wrote:
>>> AMD General
>>>
>>>> -----Original Message-----
>>>> From: Wentland, Harry <Harry.Wentland@amd.com>
>>>> Sent: Friday, August 28, 2026 09:35
>>>> To: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Kamil Konieczny
>>>> <kamil.konieczny@linux.intel.com>; Swati Sharma
>>>> <swati2.sharma@intel.com>; igt-dev@lists.freedesktop.org;
>>>> chaitanya.kumar.borah@intel.com; Zuo, Jerry <Jerry.Zuo@amd.com>;
>>>> Broadworth, Mark <Mark.Broadworth@amd.com>; Prosyak, Vitaly
>>>> <Vitaly.Prosyak@amd.com>; Hung, Alex <Alex.Hung@amd.com>
>>>> Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
>>>>
>>>>
>>>>
>>>> On 2026-08-28 07:04, vitaly prosyak wrote:
>>>>> Added Alex
>>>>>
>>>>> Hi Kamil
>>>>>
>>>>> On 2026-08-28 05:58, Kamil Konieczny wrote:
>>>>>> Hi Swati,
>>>>>> On 2026-08-28 at 00:23:55 +0530, Swati Sharma wrote:
>>>>>>> Rename the AMD-specific HDMI compliance utility to a generic
>>>>>>> igt_hdmi_compliance binary and update the build rule.
>>>>>>>
>>>>>>> Keep the existing AMD debugfs flow for pixel-format forcing. Skip
>>>>>>> that operation on Intel devices until a driver-supported interface
>>>>>>> for selecting the pixel encoding is available.
>>>>>>>
>>>>>>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>>>>>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>>>>> I will forward this to few AMD GPU dev to make sure it will work for
>>>>>> them, +cc Fangzhi Zuo <Jerry.Zuo@amd.com> Harry Wentland
>>>>>> <harry.wentland@amd.com> Mark Broadworth
>>>> <Mark.Broadworth@amd.com>
>>>>>> Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>>>>
>>>>>> Vitaly, can you forward this to your devs and/or CI team and help us
>>>>>> here, please.
>>>>>>
>>>>> Added push for testing to our internal CI :
>>>>>
>>>>> https://gerrit.core.linux.amd.com/c/upstream/gitlab.freedesktop.org/dr
>>>>> m/igt-gpu-tools/+/1951
>>>>>
>>>>> Hi Harry and Alex,
>>>>> I hope you are both having a good week.
>>>>> I am not entirely sure if the DAL CI is executing the new remote gerrit
>>>> correctly. When you have a moment, could you please help me look into this?
>>>>> Thank you so much for your time
>>>> Not sure, but I think things in `tools` would require a manual run anyways.
>>>>
>>>> Jerry, can you have a look and review this change?
>>>>
>>>> Harry
>>> We ran amd_hdmi_compliance from CLI. The only change is to replace with new name igt_hdmi_compliance with the same parameters (-e -y -b -t).
>>>
>>> Should be good.
>>>
>>> Regards,
>>> Jerry
>> Thanks a lot Jerry and Harry for fast responses!
>>
>> Vitaly
>>
>>>>> Vitaly
>>>>>> Regards,
>>>>>> Kamil
>>>>>>
>>>>>>> ---
>>>>>>>   tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} | 9 ++++++---
>>>>>>>   tools/meson.build                                      | 2 +-
>>>>>>>   2 files changed, 7 insertions(+), 4 deletions(-)  rename
>>>>>>> tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} (99%)
>>>>>>>
>>>>>>> diff --git a/tools/amd_hdmi_compliance.c
>>>>>>> b/tools/igt_hdmi_compliance.c similarity index 99% rename from
>>>>>>> tools/amd_hdmi_compliance.c rename to tools/igt_hdmi_compliance.c
>>>>>>> index 2af4c0bab..ece0abd1d 100644
>>>>>>> --- a/tools/amd_hdmi_compliance.c
>>>>>>> +++ b/tools/igt_hdmi_compliance.c
>>>>>>> @@ -833,12 +833,15 @@ static void force_pixel_format(data_t *data,
>>>>>>> int pixel_format, int conn_id)
>>>>>>>
>>>>>>>    test_init(data, conn_id);
>>>>>>>
>>>>>>> - fd = igt_debugfs_connector_dir(data->fd, data->output->name,
>>>> O_RDONLY);
>>>>>>> - igt_assert(fd >= 0);
>>>>>>> -
>>>>>>>    igt_info("Setting %d on connector id %d\n",
>>>>>>>                    pixel_format, data->output->config.connector-
>>>>> connector_id);
>>>>>>> + igt_skip_on_f(is_intel_device(data->fd),
>>>>>>> +                       "pixel-format forcing is not supported on Intel
>>>>>>> +devices\n");
>>>>>>> +
>>>>>>> + fd = igt_debugfs_connector_dir(data->fd, data->output->name,
>>>> O_RDONLY);
>>>>>>> + igt_assert(fd >= 0);
>>>>>>> +
>>>>>>>    switch (pixel_format) {
>>>>>>>    case 1:
>>>>>>>            entry_name = "force_rgb_output";
>>>>>>> diff --git a/tools/meson.build b/tools/meson.build index
>>>>>>> fbc6c0a00..68c31da92 100644
>>>>>>> --- a/tools/meson.build
>>>>>>> +++ b/tools/meson.build
>>>>>>> @@ -183,7 +183,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
>>>>>>>       dependencies :
>>>> [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
>>>>>>>                       lib_igt_drm_stub, lib_igt_tools_stub, math])
>>>>>>>
>>>>>>> -executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
>>>>>>> +executable('igt_hdmi_compliance', 'igt_hdmi_compliance.c',
>>>>>>>       dependencies : [tool_deps],
>>>>>>>       install_rpath : bindir_rpathdir,
>>>>>>>       install : true)
>>>>>>> --
>>>>>>> 2.25.1
>>>>>>>
