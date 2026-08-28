Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E922FC61DCB
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 14:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980BA10E286;
	Fri, 28 Aug 2026 14:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xymoQH+Y";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ABD10E286
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 14:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpVCf9fD8h1ehsBw7QdEAWXpXpexfmo74cJM43BgpDN0CqebiHt2dlTf5p8xa+URzILQaYNx9R0M8vTeU3F8TtDE+oYNTo8gIE8xJ7TZC/ahnCatoaJ3lAEjcpwoudsp4XV4OK5/9DiSIYpAN75W5GL3/JdSMjOXieALNF1A2CjOSFAJ4LElNsIEsjstpXxaLEhNeAmpNFFn2GJXqMqHoRQx8sB2jRFAyHSId83doowgPbLUJyyrI1DFPbYCMdictbKGOmjPZQKGz2EyzsreBKuoyGe6JgmY+CFPa7zo8j01gb1FNY7CqAcLi2fcMpRY3bwsVg3wyE8cLRH1bAPe1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpRSbls3rpBoNFABgCGbqZlZ/Ej9xSwWLEoxgJyhPno=;
 b=X156Sbsr+9MNY7T89r1XQRkQCyCS+AAUVHA6Hdt2bsHm1cBVPr8w8IQgktHYVLkB9v+WpEhprxN9AcsaVTwVZPeYEv4dM5xoCV2Va4KRFaqh1DkB7GHgJXHmIRiWXcG3e9dOKzoRTAqF3ea+fea9uKAq/8PIBxM686mmfLz+knJ0rQ/nlyxflZbsK5T6Pq8Q7m4Uhkd2zvfFpv8XTEEaPg0Syeukmm2v5xVPCGQo8Oly1TfiaWgWJOfeAJEMWcsm2JjrYfNwhih57ZF/9neEyUppemMAl0E30348K0C44KY4gV26Y7ivZf86rT3V6JN/VDDwYJ7zx/KxC18Z3Lo70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpRSbls3rpBoNFABgCGbqZlZ/Ej9xSwWLEoxgJyhPno=;
 b=xymoQH+Y8VQ/CyNjYYKeu2Oa877b/UDGsqjE32SU9AxhOr5C/3kArzN0G6QI5a3sVtigmkCd3ToU0IRb246kCIhEHQQFTDoTP7gsSIZ8ZBi/h3aL0qLiCbYUL67Np5IS5ZwMaWkbXgcqwRiLHmua+mRchILg8Ig5VHmwoBgB65c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by CH3PR12MB8912.namprd12.prod.outlook.com (2603:10b6:610:169::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Fri, 28 Aug
 2026 14:56:32 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 14:56:31 +0000
Message-ID: <33ec7288-0774-4449-8bd5-4215ca982ebb@amd.com>
Date: Fri, 28 Aug 2026 10:56:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "Broadworth, Mark" <Mark.Broadworth@amd.com>, "Hung, Alex"
 <Alex.Hung@amd.com>
References: <20260827185355.378279-1-swati2.sharma@intel.com>
 <20260828095854.7apqo5c7hy3n7oet@kamilkon-DESK.igk.intel.com>
 <7f78ff21-e4bf-417c-bf9d-c605b13a4beb@amd.com>
 <7fa2630a-424d-4156-b18d-0b4b3e50df23@amd.com>
 <CHXPR12MB9992204E4BC30CC3411A15975FE5AC2@CHXPR12MB999220.namprd12.prod.outlook.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <CHXPR12MB9992204E4BC30CC3411A15975FE5AC2@CHXPR12MB999220.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::30) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|CH3PR12MB8912:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d7163d-6cd6-40fc-bd67-08df05148bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|921020|6133799003|22082099003|18002099003|3023799007|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: o7em75hQGBfLxilZ4NWouo2NFpSHAfZRpTIEynCnPDCpcpXKz3dtRLk1V1Tmh5UBaKQBLk4s13rAlYrvJ0QQ413Ai1RiWBlfXtkdSHp2/Ov67iiuD7TaJomLj7M3U0MGfz8dS246o4bzeGi+/3rZnSOCDMvJ9I8P+vXgKi4GW3o3UYdj1+jU1VJsMnMOWUZW8h8mUj/W93BUqkE77kPYFNs4UDm8jwt03Wley36e134asDAEPIsbVS0yA/nz7FP60jM2ScHI9ZOH7OunvXOQMLAfyRKmJrVGugp0qPzj8L/4lLHV1rylt/u2hf6gVmK1SuCziwCnoP8Y8G6L3X3PspntHCyR8D6BY5TUAY4Y30G+LCP/asVrSetQs2ow/SVBAp4x0XHA7+ewqBwbRwWc3UdO4ztxMxiDxUmu1lAQQl10yOicp7VuPh3zFn1Wf0lGRfX6BcmsBZDl0z2KtxSh1wUWltvoAP1GvDAoTR/CBhgJL5xp1zW6QWhUWwW0s8gWQ8jmKeDeGj4NEUNdShb+16Jry+eE2TpeN6un7XCYV+8EEpnIYLnZxr7+8oT5y4Vq4K2GMLAn+Voaku8+YMku5PkC1e1hT86G8r7NJcCfuZXtK/4KttT/tEwucDthQRR4xJy4Lrkzv560STCDUauACy6Q7ns+fay9qz7TJnqLYyk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(921020)(6133799003)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzdNbUVxa0FPc2VpRFp0MWNMV1BKN3dEeWw1d2pWVDY3VVZ1QTArYVZZYzJG?=
 =?utf-8?B?QTF6ajQzSlRnZ3UrcTFVUlkvSnZ2RkxvbVNSM0hQdGdDeEw5eHVFWUtEQXJE?=
 =?utf-8?B?TmRZOUNIcEJaS1hwZy9RMDhyVEhmV25EUHhsaTl3UXk5VC9tVWNrN0wraSta?=
 =?utf-8?B?czZva2hJWnZFOVdlZTg5WXhOa1pmMVhlRHhTT2x5cUxFaXVGbHJZaFhkZVFk?=
 =?utf-8?B?MVhlV082TXR1ZExoV0NKVFk0MlluQ1ppRVVIT3BDbTRTRytkekJ5SGVZNjUw?=
 =?utf-8?B?MWM3R1gzMWY1Q25uQkF6cklrc2thdVRuN3VEN3B0V0tMeVVnRUVqN1JNdDc2?=
 =?utf-8?B?TGVVWDdycFBPZW0yRWg3clE1dzcwQUUxSDNDNHRNSUowc1M0ZDRoMmhMZzlL?=
 =?utf-8?B?Z0tSQ1dHNzNYUWJLRGVwUjQ5V1NNa3k5dzJrWmIzeC8rWlFCRVNyOG4yQkQ3?=
 =?utf-8?B?MUVBR1FQYlYxVUR3M3c5M0N2QWVjbzVVeStxS3FKVThNRDd6b2lhY2s1UHJO?=
 =?utf-8?B?UEV4UzU0Y1gvVkdNT3p3Y25lODRDMGpjNUhlOTZkcStJN1BOZGZOZGRpNCsy?=
 =?utf-8?B?QlRnU0RSczF2R0VwUEpSQkRzazVtNnE5ZDE5U0pRYzZrNlRUOURlUFVOcERl?=
 =?utf-8?B?aUFrRHNyTUE0N0U5cjBrZ1kyL1ZnSS9rY3BYRzk5eEZmUnpQa3Vlc2I5SGwr?=
 =?utf-8?B?dU0vSTJkUVhGWU1JTExPZmVwVDgyWC9VYmI4bit5N1FJVFl3MHVFRnQ5aW1s?=
 =?utf-8?B?RkNsYUJTLzBWRjI4eHV5aWlWeTh1THhGQ3J2TkpoRFROeGVUODVHak1URWVT?=
 =?utf-8?B?TTNDYnp5cWRzNm5qQ2ZWVGtGU2xiZEZUN0JCaCswSHZYdzh3T2UzYzBIM2lL?=
 =?utf-8?B?Rk5ReHhKVHFVWXRYMG1CTVhlSzd5TDZ3NkxOalQ3QmZndFJJYlJVdFBFNTJh?=
 =?utf-8?B?V29wcXVDRXZ2ZUtadmpKdVd0a3hidXZYby9mb3J2MWhiM01OVXZQMXJ0SHIw?=
 =?utf-8?B?b0tDZk53VUdxVHlkZkpkd2MvbURIL0Y0RWtzZ01tTGhteTNqY0VRSG0rdUVJ?=
 =?utf-8?B?QW9jUGJtSWtZUHZla0lkS0NtaHA4emIwdmdPRkZMaHFqYlRpVTJ1bFE2SXJ1?=
 =?utf-8?B?MDJRcU1Sc29MSnEzKzdtVkpRbWxpclB6V2FYL29xL3U0aDdwUEVpYysyZFRk?=
 =?utf-8?B?Y2ZFaGNhNm9SNEcyZFAreVA2RExybGtYc3p1RUFZbE5XQzJjeHNNS3hmSy9x?=
 =?utf-8?B?bmIxbjBXK3pPZ2tqeVpKMDU5VXdQOW9aejZZVHgzUHQxV21FSUNFNUpnYzE3?=
 =?utf-8?B?TzhTM0tVL3RiZHVzYjFRWGFPSU13MXNsNGdLOUlxRDNiZzFyM3FOLzdwZWVl?=
 =?utf-8?B?dlhCaDdBMGxoUEtmZVp6UEFweG5jR3RBTjNaMGM3YjNXQjZDc2JzMExTMnVk?=
 =?utf-8?B?VGhqZWdELzdIVlBPeldTVlRoZWEwb3NxcVgvenQyV2V1eGNqU0w1Q1ZJRTc2?=
 =?utf-8?B?R0MrQmVGOFJhZVFQdjJsRnFlbUY1WDVNL3phcGF3UGJtaTNPV2ExUFplVHBB?=
 =?utf-8?B?c3hVWnpNNXpkZXNSVWl6Vm04b0RPdDQ2RzRjZWZGanhteG0vZE9icFRuaTUy?=
 =?utf-8?B?clY1clMvekdiRzZoc3Q4Q0VvWVIxWE1uMEVQbDFyaXoreVMydC9KSHRSdzQ2?=
 =?utf-8?B?ZllGTGQ4Um1OTVNoUmt0QklZUkRBdTAvOW5peWYzbzF2b0hiaE9TNytxRm1k?=
 =?utf-8?B?VTRyNkx3dWV2dkZab3JXdjdxZ24yRkJkK0Q3b0dYV2NubFZHSjljU3BJRUdD?=
 =?utf-8?B?aDdKdk1pVXFTSGlxZmFmWmo5dU5XNDV2dm5aWEZUbytJYlBmcEhxMFBEMDVG?=
 =?utf-8?B?UHpmeWdoV3hwOFlieGV6Ky9xVjRIRk42eHFTUmlwUEFNWEdseE93S0YrMGtr?=
 =?utf-8?B?aitVTlNHdk5uR1krekdQcnlKZnhlcnpnaHNhN2dxSTE3WGpxNTRkdzVPbUh0?=
 =?utf-8?B?azAzL1BudG11d09BUUJCNC9VUzBOUEMyK0NucllDcWNQczBmTkMzRzNGUEdG?=
 =?utf-8?B?VmlaU0tIUHliWTE0Rm1QSkxOU0c0cEtWeDlFZWFtei9xTkovWGZEZU5yejU4?=
 =?utf-8?B?TVJFT2NZTEkvZmR5UmEzbXczdHBPam9wc3dSbkYraStOVFBmcHpsOENiWk5V?=
 =?utf-8?B?THJmVGtiaTZRVWRxajBJVlB5Yms0c2dhcTlYbjU4dzlNa2F1bTBlWDl2eFZp?=
 =?utf-8?B?TktmYk0zbXVXT2RjdkRpajEyaGRXejZIaFJyNEhwcVFLK1cwN0o4VkF2bndO?=
 =?utf-8?B?aWNtTjVnc29MZEJhZ3loUWx6NXNXK0w0Z0VpU0pPOTBXeU4wQlJLUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d7163d-6cd6-40fc-bd67-08df05148bee
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:56:31.7074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvtmjftQWTzpNOjqkHhRKl0j7RVRddI3zxYsn6oVbPtJJuQd0a9Ld/S9YKQgXKqJiNtR0HrZ6NcMV/+qLhLJvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8912
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


On 2026-08-28 10:53, Zuo, Jerry wrote:
> AMD General
>
>> -----Original Message-----
>> From: Wentland, Harry <Harry.Wentland@amd.com>
>> Sent: Friday, August 28, 2026 09:35
>> To: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Kamil Konieczny
>> <kamil.konieczny@linux.intel.com>; Swati Sharma
>> <swati2.sharma@intel.com>; igt-dev@lists.freedesktop.org;
>> chaitanya.kumar.borah@intel.com; Zuo, Jerry <Jerry.Zuo@amd.com>;
>> Broadworth, Mark <Mark.Broadworth@amd.com>; Prosyak, Vitaly
>> <Vitaly.Prosyak@amd.com>; Hung, Alex <Alex.Hung@amd.com>
>> Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
>>
>>
>>
>> On 2026-08-28 07:04, vitaly prosyak wrote:
>>> Added Alex
>>>
>>> Hi Kamil
>>>
>>> On 2026-08-28 05:58, Kamil Konieczny wrote:
>>>> Hi Swati,
>>>> On 2026-08-28 at 00:23:55 +0530, Swati Sharma wrote:
>>>>> Rename the AMD-specific HDMI compliance utility to a generic
>>>>> igt_hdmi_compliance binary and update the build rule.
>>>>>
>>>>> Keep the existing AMD debugfs flow for pixel-format forcing. Skip
>>>>> that operation on Intel devices until a driver-supported interface
>>>>> for selecting the pixel encoding is available.
>>>>>
>>>>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>>>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>>> I will forward this to few AMD GPU dev to make sure it will work for
>>>> them, +cc Fangzhi Zuo <Jerry.Zuo@amd.com> Harry Wentland
>>>> <harry.wentland@amd.com> Mark Broadworth
>> <Mark.Broadworth@amd.com>
>>>> Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>>
>>>> Vitaly, can you forward this to your devs and/or CI team and help us
>>>> here, please.
>>>>
>>> Added push for testing to our internal CI :
>>>
>>> https://gerrit.core.linux.amd.com/c/upstream/gitlab.freedesktop.org/dr
>>> m/igt-gpu-tools/+/1951
>>>
>>> Hi Harry and Alex,
>>> I hope you are both having a good week.
>>> I am not entirely sure if the DAL CI is executing the new remote gerrit
>> correctly. When you have a moment, could you please help me look into this?
>>> Thank you so much for your time
>> Not sure, but I think things in `tools` would require a manual run anyways.
>>
>> Jerry, can you have a look and review this change?
>>
>> Harry
> We ran amd_hdmi_compliance from CLI. The only change is to replace with new name igt_hdmi_compliance with the same parameters (-e -y -b -t).
>
> Should be good.
>
> Regards,
> Jerry

Thanks a lot Jerry and Harry for fast responses!

Vitaly

>>> Vitaly
>>>> Regards,
>>>> Kamil
>>>>
>>>>> ---
>>>>>  tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} | 9 ++++++---
>>>>>  tools/meson.build                                      | 2 +-
>>>>>  2 files changed, 7 insertions(+), 4 deletions(-)  rename
>>>>> tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} (99%)
>>>>>
>>>>> diff --git a/tools/amd_hdmi_compliance.c
>>>>> b/tools/igt_hdmi_compliance.c similarity index 99% rename from
>>>>> tools/amd_hdmi_compliance.c rename to tools/igt_hdmi_compliance.c
>>>>> index 2af4c0bab..ece0abd1d 100644
>>>>> --- a/tools/amd_hdmi_compliance.c
>>>>> +++ b/tools/igt_hdmi_compliance.c
>>>>> @@ -833,12 +833,15 @@ static void force_pixel_format(data_t *data,
>>>>> int pixel_format, int conn_id)
>>>>>
>>>>>   test_init(data, conn_id);
>>>>>
>>>>> - fd = igt_debugfs_connector_dir(data->fd, data->output->name,
>> O_RDONLY);
>>>>> - igt_assert(fd >= 0);
>>>>> -
>>>>>   igt_info("Setting %d on connector id %d\n",
>>>>>                   pixel_format, data->output->config.connector-
>>> connector_id);
>>>>> + igt_skip_on_f(is_intel_device(data->fd),
>>>>> +                       "pixel-format forcing is not supported on Intel
>>>>> +devices\n");
>>>>> +
>>>>> + fd = igt_debugfs_connector_dir(data->fd, data->output->name,
>> O_RDONLY);
>>>>> + igt_assert(fd >= 0);
>>>>> +
>>>>>   switch (pixel_format) {
>>>>>   case 1:
>>>>>           entry_name = "force_rgb_output";
>>>>> diff --git a/tools/meson.build b/tools/meson.build index
>>>>> fbc6c0a00..68c31da92 100644
>>>>> --- a/tools/meson.build
>>>>> +++ b/tools/meson.build
>>>>> @@ -183,7 +183,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
>>>>>      dependencies :
>> [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
>>>>>                      lib_igt_drm_stub, lib_igt_tools_stub, math])
>>>>>
>>>>> -executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
>>>>> +executable('igt_hdmi_compliance', 'igt_hdmi_compliance.c',
>>>>>      dependencies : [tool_deps],
>>>>>      install_rpath : bindir_rpathdir,
>>>>>      install : true)
>>>>> --
>>>>> 2.25.1
>>>>>
