Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAB0C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 13:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B415E11318C;
	Wed,  6 Mar 2024 13:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kjtj+CR+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841AF11318C
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709730918; x=1741266918;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wMCKUSoveMxLzHYm8tFfpB8EJdC/Coie5GNfR5zcj5g=;
 b=Kjtj+CR+YgDBJkgld3vCX72VnRqJS2PLvZCzQjCbtvvMfrf85u1nZZse
 5aVmaO0P9Z/YLnEbfqHmOE16NtAVJWVT/69FG563WGGFRfXsZyjh1395x
 L7/5RpDWTM0OKGRscq/yvebXikX3KY1icrvfoOICzj5uGxFqOaweUg7/F
 4rOpbkCURQfBhqhpin3OG1c2zphQV2el2/LgPeOTXb7gquPSCG0Idzoci
 eGEqyzVDnLxa6OFO5CXJGHnV8Z2hLilJ9rMxAQ/t1H3WsI0YjKVBoetFv
 hJ1kqcuqh+lRPJLRZ9j+I6MmvyvQJXyiEQtGISUbYrc1/NoOeRMK1yfVl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4204257"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4204257"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 05:15:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="14315294"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 05:15:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 05:15:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 05:15:15 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 05:15:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyB4jbdPqUlKoLkaYyimhx1k/v0/2BCxr08HcqzIUTRtn8nPLwBNGNSy3tJHlEzqAMjtYBtTJlvxEbQOU/tfd7QzKpTeiOG3nkbqdi/xjNx1V3nX2/N4ar03FRNsiPSPd/NgtmHuolBt6btDT1Em14hxAwtKWW6WjY9cYDhvUzVjArr10XLD1MqPAeHn9xx36E+ag/jbQlWoReanbEU9z/DlmfDwoOZBTzoJUxW1NSD0DX11XQqLz4EJ4vsgRSPOCe1yAVFFwMdUuR6KQ/s5huC8HZdYWZ9HH4lyOxE6XwmbRhyGQE92tQ86r0v68e3Ysn4OuFmntm33F6O8T/Ytxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEYKaN+2sK6J2DVsM7j58t7xZoyh6gjwhWH14sUj4Ms=;
 b=jcsUgK9yMWFJSzXg/wMtGzS55MQ2JVryMBy2rVsf9mR+NnSs5NETbZOV2EleJhYaDRD+dbkBKk+kEOM9Xj4xpuupeAL+nwcK41MCA093sEiWSh7xgQahuHX/CI67DR+2vK14Muf1D8eW/sAKO2LP5V0eXvd0jE8wGIOgVSRzqf4GDuhmoLtuSe1XmKEqyoGOze0VPdUSCa73zi0xsHC2i1CUROWf4uiWlNKjD4jXL7I9XZYjA0NU4CPNxaN1xCKWhwESZR1oZX+h/2e4LNJpWLA7DaFA/IInQQ8IBGuoO+lKHpCoCNynChGQ0gpr5WkTygeFYL45p0OCU2YKmpHJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by DM3PR11MB8672.namprd11.prod.outlook.com (2603:10b6:0:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 13:15:12 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 13:15:12 +0000
Message-ID: <de9585b2-d745-48f6-90c6-cc189b290eaf@intel.com>
Date: Wed, 6 Mar 2024 18:45:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_big_joiner: revamp
 kms_big_joiner
Content-Language: en-US
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240306052509.717026-1-kunal1.joshi@intel.com>
 <20240306052509.717026-3-kunal1.joshi@intel.com> <Zeg9KosfNa0Lld1C@intel.com>
 <2d71c76c-8205-47c3-9c5b-57671296eddc@intel.com> <ZehGg6Vkqv06MbzN@intel.com>
 <68466e6d-81af-46ce-ba10-ec38bdb06392@intel.com> <ZehPOZqqhLjX1nLY@intel.com>
 <215c1cb2-0157-4002-9ab0-c99d5ed4e985@intel.com> <ZehnG+6PgQMEia9W@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <ZehnG+6PgQMEia9W@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0241.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::12) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|DM3PR11MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa675ca-12c4-4ce2-c183-08dc3ddf7477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ry33gVSr+6qdFtBG2AeswVTtpykcHZnq6D4KSMiAGnLH/Ai4KEAy05jg2AKnm2sGTTPRxzUcucsaFbcD4SxQ/B0IQDrJz2xzqM6xksIxEMTw8J/ulofiGaZw7CVsYqvm/EN/so37aKskTwcbNgmKrsVofbPs44KMwJRlgtQM8xDZelfLwwScQjGDHXvZ5XJEwfGrJXQXk/3kr+10UXfa+aThIsjnwAcxTfEuJfxu8vBBEMAivk6d4nhblC7Vt8RVuoljTeNg/tBuJtTMWgNuJpbMTkrXsfs3r7+v+0Mb70k+eGlMMMIgwRl6dmPAnl/aRkP4lJaObEHsX6CrMKIeNfc3rbHdOEltIrl0VOJCxgH193nkitxAmOkD/Y7JX/BYE7oM0hRhqOM6reuacQA4xxAJXBGPNrPxdgHvqNesp/8cb2qi3zzWdsN5SxJxclfY2rrmbXvW6pPHuE+F9/rMDN8SjWyH0vuLEDwDhJb+5ber7eeVybVLTgf7lk/4HS/h5Za27R7BnKfeLdjKFh+3YYQKzTy33Wzrx28+iUuie3b6tHwBSD5XRL08E6NsFeXu3rcKsLeI0iSdDU4qzJaL5loMYjP+Ox13P7m4Uvf3Kmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVFWQnF3WDJKSlp0VmVwY0xSWXpxVlI3VStQV3liWC9rVXRBSFgrVG5jYWMy?=
 =?utf-8?B?dE5GMHlWV1p2MXhyc09ENlRWZjY5S1lGQzkyaGVPT2JyUXIvR05LSEE4T0lJ?=
 =?utf-8?B?a2tnTDA0aEdDRXk3R1hjd1BoVlZaZU5ldFo0ZHcxcnFVZEZZMWxOcUtzMTN5?=
 =?utf-8?B?V2ZkU0V5S21zWFR0N3dwNklCMy9ZMjFWUFYzQUlCUGxHUTM5S2F6a1FGUE1F?=
 =?utf-8?B?YXFzOGxHR3M5angwaXFNL2FGcVJJZW9ycnVvNmRRSGhlUDBtbUFaT3ZaUUl6?=
 =?utf-8?B?NTdCU0Noem1KSnJza2dIdmZBTmdJR0NzUTd5dFlQNlRPMnVINVAzRkYvM2ho?=
 =?utf-8?B?SkgwQmxGQXFEMERNeVpnREhBQ0ZyRThKdjE5bjFDYlpFbnNNSDRkSGt2NDhO?=
 =?utf-8?B?dXVVQVhaS2JncWF4b3Y4T3A2SjNzYjhZME1jNHZnYi92U2xSYnVwcmtZZ20w?=
 =?utf-8?B?RURPcFJYdGVXU0FseDlhTFdLSUJUNE9CMUYzMlVRSnl6aHVPTVpFQjNxVS81?=
 =?utf-8?B?WHBDeEpydk8xcml3bmkxTXpJb1NJbGowVzlKejd4U0ZKOENwbGJuSG16czM4?=
 =?utf-8?B?eW9Sd3NPWVM0eXhpK0xyMmRERmUvYXU5b1E4eGNBSlVEV0UvVXREeTd0cExP?=
 =?utf-8?B?SjJ0cWVjQWw4WlFWbDlSREs0QVQ1UWxyazcyRUxWaTRYMlhUUC9OblZYNmlD?=
 =?utf-8?B?b2VLYSszYWFKcGpHZk5SSFJBUG9mbzJ3d0U0dHhrYldqU3ljZDF4a2t6T3Yx?=
 =?utf-8?B?N3pyUFJmam9kZTJEemRhVzNSUlhBVlg4dFRBbXEwS251SjRWdUhjQWVRN2tB?=
 =?utf-8?B?QjZsQmRoYjRYbkVwK1JJYVJoMENpWWxhYW92RzZxY2lDam05UWNya0tvb0pG?=
 =?utf-8?B?eVlmTGN3ZXIvbnpjQWNMS2V6WVRISnRlTFRic2lVQnRSR2lXeFJ2emFwbkRY?=
 =?utf-8?B?YzcrZkJvL3lYM0U3ZjVKN3NVbWZHeTVXamkrSUdsMmNDR3RWVUZGYlI3N0Mx?=
 =?utf-8?B?WmFGWG8walk0cHNLdHllVzd5RytGR2x1WWpzVFZ2d3N4VW1Xb3F0Uk9kTjdn?=
 =?utf-8?B?UkU5SzdKbXQvcDdXd0N1M3M2ekdpNGUzUnJBK1BzUHltbk9sTDhWZ1Npb0ZI?=
 =?utf-8?B?NWdwMVFjZmU2Q2wwanFVd3BCTDladE9JNVNrNmlYRkpjTFV3S2NHY3NnUi91?=
 =?utf-8?B?Vzk5ZkdNSDkwSk55MjRGYTgvZHJUd2pyOGh6WkhMYndsQXF0VC8yMXJ6RG1l?=
 =?utf-8?B?UWRZWkZZVWJoUHFVdFBYZmxHRnMvdEgvZ1kwZlNGNnBSNFJvVDdiUmR3aHR1?=
 =?utf-8?B?Z1FBMEt2QUFNWGlnNjd4c0FiTzJOT0NNZ3Z3VmJlRmR4MUJtdUJZSmRta25r?=
 =?utf-8?B?bTJib0l6di9Wa0lUM2t5UFVxa01TQXBvemRzNEVyQTlGWTRTNW1ZdzJla20y?=
 =?utf-8?B?d0xhdzhNNUd5MzJEa0hXenZNa0kvRXVYZk42ZlVSS1lWbVMxMm1OOEtiOWZ3?=
 =?utf-8?B?Y21pY2xaWkVidVhWTVUwOUNvZ3ZNWE9XQVhBZWh0NmZzZm9qaWpZNG1WVDRK?=
 =?utf-8?B?ZVIzSXp5bjBDVW9ZYTRUWmtabXFqSFpmTmlvaE9TRGZ4UHVkYmMyY2RJRWI4?=
 =?utf-8?B?SmYzcHRJcUtpcG1zUXpxRStNaW1ldkxodUE1SmJDMXBIbzFQeVVVRXhYbCs5?=
 =?utf-8?B?M0JJQktlcFhMOTVadEVDc2cvcVk3bkpMVnVXZElsSlZtbmhNVTIrTzY0NlR2?=
 =?utf-8?B?TUxjWmgzU2ZBZXdiUmJ0NFhrTHk2UlpndnQxZ25odXlScHNrZ2hHRWdSR2gw?=
 =?utf-8?B?ZTJhVHJlOXdqUXhIQ0Y4SjMvdndRRXpCVVV5MzEwRHU1MUIyaW1nTHVxd2FM?=
 =?utf-8?B?aXdCQWpOejJGbXFNNnRDeGI4dWhIMTlLN004RHlIdjFnSmJhM05URHQwQ1Nu?=
 =?utf-8?B?cFFRY2dNb0lGQXZLMzI4bXVROTVDYnZ1RVR1Z2V4QXdyOTFzN1hVQmFvaito?=
 =?utf-8?B?bXFTZWZ3N05LQXIveWZjTVhEWlVSUkZCZVlPY0tRZjR0ZGJYZE4zTzJWWmVG?=
 =?utf-8?B?cjJYOExKcDNreFJiT01KbnJ1ZWpEb2xvVHhoaWcyNTBxQlFna0I2WHlMVmJJ?=
 =?utf-8?Q?rOQI4UShcMPND20j9/oYh3vql?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa675ca-12c4-4ce2-c183-08dc3ddf7477
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 13:15:12.4469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7dJuF5Ue6tgWn1BmbO9UVAFJXe/lNNDzR42Y8hjUppZhEO/V+pPzMxTNxBA5p/p/RaIhI+U4pxX/1LZm2F5iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
X-OriginatorOrg: intel.com
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

Hello Stan,

On 3/6/2024 6:22 PM, Lisovskiy, Stanislav wrote:
> On Wed, Mar 06, 2024 at 04:58:54PM +0530, Joshi, Kunal1 wrote:
>> Hello Stan,
>>
>> On 3/6/2024 4:40 PM, Lisovskiy, Stanislav wrote:
>>> On Wed, Mar 06, 2024 at 04:11:03PM +0530, Joshi, Kunal1 wrote:
>>>> Hello Stan,
>>>>
>>>> On 3/6/2024 4:03 PM, Lisovskiy, Stanislav wrote:
>>>>> On Wed, Mar 06, 2024 at 03:41:26PM +0530, Joshi, Kunal1 wrote:
>>>>>> Hello Stan,
>>>>>>
>>>>>> On 3/6/2024 3:23 PM, Lisovskiy, Stanislav wrote:
>>>>>>> On Wed, Mar 06, 2024 at 10:55:09AM +0530, Kunal Joshi wrote:
>>>>>>>> big joiner outputs are statically assigned to pipe,
>>>>>>>> rewrite to assign dynamically
>>>>>>>>
>>>>>>>> v2: Don't change license (Bhanu)
>>>>>>>>         Add documentation for generate_combinations (Bhanu)
>>>>>>>>         Print the pipe name (Bhanu)
>>>>>>>>         Remove unwanted commit (Bhanu)
>>>>>>>>         Move combine output logic to igt_fixture (Bhanu)
>>>>>>>>         split revamp and force joiner (Bhanu)
>>>>>>>>
>>>>>>>> Cc: Karthik B S<karthik.b.s@intel.com>
>>>>>>>> Cc: Bhanuprakash Modem<bhanuprakash.modem@intel.com>
>>>>>>>> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
>>>>>>>> ---
>>>>>>>>      tests/intel/kms_big_joiner.c | 391 +++++++++++++++++------------------
>>>>>>>>      1 file changed, 187 insertions(+), 204 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
>>>>>>>> index 28678b958..ba4097d8b 100644
>>>>>>>> --- a/tests/intel/kms_big_joiner.c
>>>>>>>> +++ b/tests/intel/kms_big_joiner.c
>>>>>>>> @@ -43,16 +43,19 @@
>>>>>>>>       *
>>>>>>>>       * SUBTEST: basic
>>>>>>>>       * Description: Verify the basic modeset on big joiner mode on all pipes
>>>>>>>> - *
>>>>>>>> - * SUBTEST: 2x-modeset
>>>>>>>> - * Description: Verify simultaneous modeset on 2 big joiner outputs
>>>>>>>>       */
>>>>>>>> -
>>>>>>>>      IGT_TEST_DESCRIPTION("Test big joiner");
>>>>>>>> -struct bigjoiner_output {
>>>>>>>> -	uint32_t output_id;
>>>>>>>> -	drmModeModeInfo mode;
>>>>>>>> +#define MAX_OUTPUTS 256
>>>>>>>> +#define MAX_COMBINATIONS 1000
>>>>>>>> +#define INVALID_TEST_OUTPUT 2
>>>>>>>> +typedef struct {
>>>>>>>> +    int combination[MAX_OUTPUTS];
>>>>>>>> +} Combination;
>>>>>>>> +
>>>>>>>> +enum joiner_type {
>>>>>>>> +	BIG_JOINER = 1 << 1,
>>>>>>>> +	INVALID_JOINER = -1,
>>>>>>>>      };
>>>>>>>>      typedef struct {
>>>>>>>> @@ -60,273 +63,253 @@ typedef struct {
>>>>>>>>      	igt_display_t display;
>>>>>>>>      	struct igt_fb fb;
>>>>>>>>      	int n_pipes;
>>>>>>>> -	enum pipe pipe1;
>>>>>>>> -	enum pipe pipe2;
>>>>>>>> -	struct bigjoiner_output output[2];
>>>>>>>> +	uint64_t big_joiner_outputs[IGT_MAX_PIPES];
>>>>>>>> +	uint64_t non_big_joiner_outputs[IGT_MAX_PIPES];
>>>>>>>> +	uint64_t combined_outputs[IGT_MAX_PIPES];
>>>>>>>> +	int big_joiner_output_count;
>>>>>>>> +	int non_big_joiner_output_count;
>>>>>>>> +	int combined_output_count;
>>>>>>>> +	int output_count;
>>>>>>>> +	enum pipe pipe_seq[IGT_MAX_PIPES];
>>>>>>>>      } data_t;
>>>>>>>>      static int max_dotclock;
>>>>>>>> -static void test_invalid_modeset(data_t *data)
>>>>>>>> +/*
>>>>>>>> + * The generate_combinations function generates combinations of pipe allocations
>>>>>>>> + * for a given number of outputs
>>>>>>>> + *
>>>>>>>> + * @output_count: Number of outputs to allocate pipes for.
>>>>>>>> + * @pipe_count: Total number of available pipes.
>>>>>>>> + * @pipes_per_output: Number of pipes to be allocated for a single output.
>>>>>>>> + * @combinations: Array to store generated combinations.
>>>>>>>> + * @num_combinations: Pointer to a variable that stores the number of generated combinations.
>>>>>>>> + *
>>>>>>>> + * Example (output_count=2, pipe_count=4, pipes_per_output=2):
>>>>>>>> + * Combination 1: 0 2
>>>>>>>> + * Combination 2: 1 3
>>>>>>> I think this might be a bit overcomplicated - just for your information, we can't deliberately
>>>>>>> choose which pipes can be used for bigjoiner. On some platforms even only certain pipes, can be
>>>>>>> used for bigjoiner.
>>>>>>> Moreover the way how driver decides, which pipes are going to be used for bigjoiner is basically
>>>>>>> this code in intel_dp.c:
>>>>>>>
>>>>>>> if (intel_dp_need_bigjoiner(intel_dp, adjusted_mode->crtc_hdisplay,
>>>>>>> 			    adjusted_mode->crtc_clock))
>>>>>>>              pipe_config->bigjoiner_pipes = GENMASK(crtc->pipe + 1, crtc->pipe);
>>>>>>>
>>>>>>> Means if you try to do a modeset with resolution > 5K or exceed max_dot_clock on crtc->pipe,
>>>>>>> then _always_ pipe + 1, going to be used for bigjoiner.
>>>>>>>
>>>>>>>
>>>>>>> Stan
>>>>>>>
>>>>>> Thanks for the inputs,
>>>>>> Goal here is to try various combination possible,
>>>>>> Suppose a platform supports 5 pipes(A-E) and we have 1 bigjoiner output
>>>>>> (DP-1) then we want to try
>>>>>> DP-1 on PIPE_A
>>>>>> DP-1 on PIPE_B
>>>>>> DP-1 on PIPE_C
>>>>>> DP-1 on PIPE_D
>>>>>>
>>>>>> Suppose a platform supports 5 pipes(A-E) and we have 2 bigjoiner output
>>>>>> (DP-1, DP-2) then we want to try
>>>>>> DP-1 on PIPE_A and DP-2 on PIPE_C
>>>>>> DP-1 on PIPE_B and DP-2 on PIPE_D And so on, Going forward this will be
>>>>>> useful we introduce any feature which can allow having more pipes per output
>>>>>> also.
>>>>> That won't work. BSpec and current driver code allows to use only _adjacent_ pipes.
>>>>> I.e if you modeset PIPE_A with 5K resolution, then bigjoiner_pipes mask would be
>>>>> PIPE_A | PIPE_B. If you modeset PIPE_B with 5K resolution it will take PIPE_C as a
>>>>> slave and so on.
>>>>> So for instance of you had DP-1 assigned to PIPE_A and DP-2 assigned to PIPE_C by test,
>>>>> _driver_ will still reassign PIPE_B to DP-2, in order for bigjoiner to work.
>>>>> That logic is implemented in intel_dp.c, as I mentioned above.
>>>>> Also you can check the BSpec Bigjoiner programming description.
>>>>>
>>>>> Stan
>>>> I think there is some confusion here,
>>>>
>>>> Below is result of the test that was executed with current code
>>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-arls-4/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
>>>>
>>>> Assigning pipe 0 to DP-3
>>>> <7> [44.263216] i915 0000:00:02.0: [drm:intel_atomic_check [i915]]
>>>> [CRTC:131:pipe B] Used as slave for big joiner master [CRTC:80:pipe A]
>>>>
>>>> Assigning pipe 1 to DP-3
>>>> <7> [44.568716] i915 0000:00:02.0: [drm:intel_atomic_check [i915]]
>>>> [CRTC:182:pipe C] Used as slave for big joiner master [CRTC:131:pipe B]
>>>> Assigning pipe 2 to DP-3
>>>> <7> [44.909690] i915 0000:00:02.0: [drm:intel_atomic_check [i915]]
>>>> [CRTC:233:pipe D] Used as slave for big joiner master [CRTC:182:pipe C] So
>>>> we are leaving one sequential pipe for a output,
>>>> Please let me know if i still wasn't able to explain properly.
>>> Yes, that is correct here. I was just trying to clarify that we can't have all
>>> possible combinations unfortunately.
>>> There are only certain scenarios supported, so could be a bit overkill trying to
>>> approach this combinatorical way, but rather I would see this more like introducing
>>> some mapping table, containing valid mappings or something similar.
>>> I don't think we are going to have more than 5 pipes anyway soon.
>>>
>>> That way, it might be way easier to check with spec and maintain this code.
>>>
>>> In case if more pipes are supported per output, most likely it won't be that straight
>>> forward as well :)
>>>
>>> I would add something like "get_next_master_pipe" function, which you call for each pipe
>>> which is allowed to be master. That function would also take available pipes as a mask.
>>>
>>> Then it returns next avaiable master pipe, considering the available pipes mask.
>>> That way you easily generate all allowed combinations, by just modifying available pipes mask.
>>>
>>> Stan
>> Can you please provide more info on this only certain scenario's supported?
>> Or just an example where this code won't work will be really useful.
>>
>> On the overkill part, this to me will only have the combinations which are
>> valid,
>> Maybe we just need to exclude those certain scenario's which are
>> unsupported.
> On some platforms, not all pipes can be bigjoiner masters, some pipes can be fused off.
> We can of course hardcode this into algorithm, but that would be less readable.
> Would be nice to have some table or initial structure to be able to explicitly regulate
> this, without altering the actual code.
>
> Stan
I still don't think this is a good idea to have static structure which 
needs to be updated again and again for newer platform
also we need to define what pipe need to be used in case of 1x joiner, 
2x-joiner and so on respectively.

Or this idea is just over my head.

I would just update logic in below code to discard this fused pipe

         data.n_pipes = 0;
         for_each_pipe(&data.display, i) {
             data.n_pipes++;
             data.pipe_seq[j] = i;
             j++;
         }

>
>>>>>>>> +*/
>>>>>>>> +static void generate_combinations(int output_count, int pipe_count,
>>>>>>>> +				  int pipes_per_output,
>>>>>>>> +				  Combination combinations[MAX_COMBINATIONS],
>>>>>>>> +				  uint64_t *num_combinations)
>>>>>>>>      {
>>>>>>>> -	igt_output_t *output;
>>>>>>>> -	igt_display_t *display = &data->display;
>>>>>>>> -	int ret;
>>>>>>>> +	int i, index;
>>>>>>>> +	int current_combination[MAX_OUTPUTS];
>>>>>>>> -	igt_info("Bigjoiner test on ");
>>>>>>>> -	for_each_connected_output(display, output){
>>>>>>>> -		enum pipe p = output->pending_pipe;
>>>>>>>> -		drmModeModeInfo *mode;
>>>>>>>> -		igt_pipe_t *pipe;
>>>>>>>> -		igt_plane_t *plane;
>>>>>>>> +	for (i = 0; i < output_count; ++i)
>>>>>>>> +		current_combination[i] = i * pipes_per_output;
>>>>>>>> -		if (p == PIPE_NONE)
>>>>>>>> -			continue;
>>>>>>>> -
>>>>>>>> -		mode = igt_output_get_mode(output);
>>>>>>>> -		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
>>>>>>>> -		kmstest_dump_mode(mode);
>>>>>>>> +	while (*num_combinations < MAX_COMBINATIONS && current_combination[0] <= pipe_count - output_count * pipes_per_output) {
>>>>>>>> +		for (i = 0; i < output_count; ++i)
>>>>>>>> +			combinations[*num_combinations].combination[i] = current_combination[i];
>>>>>>>> -		pipe = &display->pipes[p];
>>>>>>>> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>>>>> +		(*num_combinations)++;
>>>>>>>> -		igt_plane_set_fb(plane, &data->fb);
>>>>>>>> -		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>>>>>>>> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>>>>>>> -	}
>>>>>>>> +		index = output_count - 1;
>>>>>>>> +		while (index >= 0 && current_combination[index] == pipe_count - (output_count - index) * pipes_per_output)
>>>>>>>> +			index--;
>>>>>>>> -	igt_assert(!igt_check_bigjoiner_support(display));
>>>>>>>> +		if (index < 0)
>>>>>>>> +			break;
>>>>>>>> -	/* This commit is expectd to fail as this pipe is being used for big joiner */
>>>>>>>> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
>>>>>>>> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>>>>>> +		current_combination[index]++;
>>>>>>>> +		for (i = index + 1; i < output_count; ++i)
>>>>>>>> +			current_combination[i] = current_combination[i - 1] + pipes_per_output;
>>>>>>>> +    }
>>>>>>>> +}
>>>>>>>> -	igt_display_reset(&data->display);
>>>>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>>>>> +static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t output_id)
>>>>>>>> +{
>>>>>>>> +	igt_output_t *output;
>>>>>>>> -	igt_assert_lt(ret, 0);
>>>>>>>> +	for_each_connected_output(&data->display, output) {
>>>>>>>> +		if (output->id == output_id)
>>>>>>>> +			return output;
>>>>>>>> +	}
>>>>>>>> +	igt_assert("Output not found\n");
>>>>>>>> +	return NULL;
>>>>>>>>      }
>>>>>>>> -static void test_basic_modeset(data_t *data)
>>>>>>>> +static void test_invalid_modeset_two_joiner(data_t *data, bool combined)
>>>>>>>>      {
>>>>>>>> +	int i, j, ret;
>>>>>>>> +	igt_output_t *output;
>>>>>>>> +	uint64_t *outputs;
>>>>>>>> +	igt_plane_t *primary[INVALID_TEST_OUTPUT];
>>>>>>>> +	igt_fb_t fb[INVALID_TEST_OUTPUT];
>>>>>>>>      	drmModeModeInfo *mode;
>>>>>>>> -	igt_output_t *output, *bigjoiner_output = NULL;
>>>>>>>> -	igt_display_t *display = &data->display;
>>>>>>>> -	igt_pipe_t *pipe;
>>>>>>>> -	igt_plane_t *plane;
>>>>>>>> -	igt_display_reset(display);
>>>>>>>> -
>>>>>>>> -	for_each_connected_output(display, output) {
>>>>>>>> -		if (data->output[0].output_id == output->id) {
>>>>>>>> -			bigjoiner_output = output;
>>>>>>>> -			break;
>>>>>>>> +	outputs = combined ? data->combined_outputs : data->big_joiner_outputs;
>>>>>>>> +
>>>>>>>> +	for (i = 0; i < data->n_pipes-1; i++) {
>>>>>>>> +		igt_display_reset(&data->display);
>>>>>>>> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>>>>>>>> +			output = get_output_by_id_or_assert(data, outputs[j]);
>>>>>>>> +			igt_assert(output);
>>>>>>>> +			igt_output_set_pipe(output, data->pipe_seq[i + j]);
>>>>>>>> +			mode = igt_output_get_mode(output);
>>>>>>>> +			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
>>>>>>>> +				 kmstest_pipe_name(data->pipe_seq[i + j]),
>>>>>>>> +				 igt_output_name(output), mode->hdisplay,
>>>>>>>> +				 mode->vdisplay, mode->vrefresh,
>>>>>>>> +				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
>>>>>>>> +			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>>>>>>> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>>>>>> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>>>>>>>> +			igt_plane_set_fb(primary[j], &fb[j]);
>>>>>>>>      		}
>>>>>>>> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>>>>>>> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>>>>>>>      	}
>>>>>>>> -
>>>>>>>> -	igt_output_set_pipe(bigjoiner_output, data->pipe1);
>>>>>>>> -
>>>>>>>> -	mode = &data->output[0].mode;
>>>>>>>> -	igt_output_override_mode(bigjoiner_output, mode);
>>>>>>>> -
>>>>>>>> -	pipe = &display->pipes[data->pipe1];
>>>>>>>> -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>>>>> -
>>>>>>>> -	igt_plane_set_fb(plane, &data->fb);
>>>>>>>> -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>>>>>>>> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>>>>>>> -
>>>>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>>>>> -
>>>>>>>> -	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
>>>>>>>> -	igt_plane_set_fb(plane, NULL);
>>>>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>>>>>      }
>>>>>>>> -static void test_dual_display(data_t *data)
>>>>>>>> +static void tets_big_joiner_on_last_pipe(data_t *data)
>>>>>>>>      {
>>>>>>>> +	int i, ret;
>>>>>>>> +	uint64_t *outputs;
>>>>>>>> +	igt_output_t *output;
>>>>>>>> +	igt_plane_t *primary;
>>>>>>>> +	igt_fb_t fb;
>>>>>>>>      	drmModeModeInfo *mode;
>>>>>>>> -	igt_output_t *output, *bigjoiner_output[2];
>>>>>>>> -	igt_display_t *display = &data->display;
>>>>>>>> -	igt_pipe_t *pipe;
>>>>>>>> -	igt_plane_t *plane1, *plane2;
>>>>>>>> -	int count = 0;
>>>>>>>> -
>>>>>>>> -	igt_display_reset(display);
>>>>>>>> -
>>>>>>>> -	for_each_connected_output(display, output) {
>>>>>>>> -		if (data->output[count].output_id == output->id) {
>>>>>>>> -			bigjoiner_output[count] = output;
>>>>>>>> -			count++;
>>>>>>>> -		}
>>>>>>>> -		if (count > 1)
>>>>>>>> -			break;
>>>>>>>> +	outputs = data->big_joiner_outputs;
>>>>>>>> +	for (i = 0; i < data->big_joiner_output_count; i++) {
>>>>>>>> +		igt_display_reset(&data->display);
>>>>>>>> +		output = get_output_by_id_or_assert(data, outputs[i]);
>>>>>>>> +		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
>>>>>>>> +		mode = igt_output_get_mode(output);
>>>>>>>> +		igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
>>>>>>>> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
>>>>>>>> +				 igt_output_name(output), mode->hdisplay,
>>>>>>>> +				 mode->vdisplay, mode->vrefresh);
>>>>>>>> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>>>>>>> +		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>>>>>> +							  DRM_FORMAT_MOD_LINEAR, &fb);
>>>>>>>> +		igt_plane_set_fb(primary, &fb);
>>>>>>>> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>>>>>>> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>>>>>>>      	}
>>>>>>>> +}
>>>>>>>> -	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
>>>>>>>> -	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
>>>>>>>> -
>>>>>>>> -	/* Set up first big joiner output on Pipe A*/
>>>>>>>> -	mode = &data->output[0].mode;
>>>>>>>> -	igt_output_override_mode(bigjoiner_output[0], mode);
>>>>>>>> -
>>>>>>>> -	pipe = &display->pipes[data->pipe1];
>>>>>>>> -	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>>>>> -
>>>>>>>> -	igt_plane_set_fb(plane1, &data->fb);
>>>>>>>> -	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
>>>>>>>> -	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
>>>>>>>> -
>>>>>>>> -	/* Set up second big joiner output on Pipe C*/
>>>>>>>> -	mode = &data->output[1].mode;
>>>>>>>> -	igt_output_override_mode(bigjoiner_output[1], mode);
>>>>>>>> -
>>>>>>>> -	pipe = &display->pipes[data->pipe2];
>>>>>>>> -	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>>>>>> -
>>>>>>>> -	igt_plane_set_fb(plane2, &data->fb);
>>>>>>>> -	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
>>>>>>>> -	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
>>>>>>>> -
>>>>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>>>>> +static void test_basic_modeset(data_t *data, int num_outputs,
>>>>>>>> +			       Combination combinations[MAX_COMBINATIONS],
>>>>>>>> +			       uint64_t num_combinations)
>>>>>>>> +{
>>>>>>>> +	int i, j, ret;
>>>>>>>> +	igt_display_t *display = &data->display;
>>>>>>>> +	igt_output_t *output[num_outputs];
>>>>>>>> +	igt_plane_t *primary[num_outputs];
>>>>>>>> +	igt_fb_t fb[num_outputs];
>>>>>>>> +	drmModeModeInfo *mode;
>>>>>>>> -	/* Clean up */
>>>>>>>> -	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
>>>>>>>> -	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
>>>>>>>> -	igt_plane_set_fb(plane1, NULL);
>>>>>>>> -	igt_plane_set_fb(plane2, NULL);
>>>>>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>>>>> +	for (i = 0; i < num_combinations; i++) {
>>>>>>>> +		igt_display_reset(display);
>>>>>>>> +		for (j = 0; j < num_outputs; j++) {
>>>>>>>> +			output[j] = get_output_by_id_or_assert(data,
>>>>>>>> +						     data->big_joiner_outputs[j]);
>>>>>>>> +			igt_info("Assigning pipe %s to %s%s",
>>>>>>>> +				 kmstest_pipe_name(data->pipe_seq[combinations[i].combination[j]]),
>>>>>>>> +				 output[j]->name, j == num_outputs - 1 ? "\n" : ", ");
>>>>>>>> +			igt_output_set_pipe(output[j], data->pipe_seq[combinations[i].combination[j]]);
>>>>>>>> +			primary[j] = igt_output_get_plane_type(output[j], DRM_PLANE_TYPE_PRIMARY);
>>>>>>>> +			mode = igt_output_get_mode(output[j]);
>>>>>>>> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>>>>>> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>>>>>>>> +			igt_plane_set_fb(primary[j], &fb[j]);
>>>>>>>> +		}
>>>>>>>> +		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>>>>>>>> +		igt_assert_f(ret == 0, "Commit failed\n");
>>>>>>>> +    }
>>>>>>>>      }
>>>>>>>>      igt_main
>>>>>>>>      {
>>>>>>>> +	int i, j;
>>>>>>>>      	data_t data;
>>>>>>>>      	igt_output_t *output;
>>>>>>>> -	drmModeModeInfo mode;
>>>>>>>> -	int valid_output = 0, i, count = 0, j = 0;
>>>>>>>> -	uint16_t width = 0, height = 0;
>>>>>>>> -	enum pipe pipe_seq[IGT_MAX_PIPES];
>>>>>>>> +	drmModeModeInfo default_mode;
>>>>>>>> +	i = j = 0;
>>>>>>>>      	igt_fixture {
>>>>>>>>      		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>>>>>>>>      		kmstest_set_vt_graphics_mode();
>>>>>>>> -
>>>>>>>>      		igt_display_require(&data.display, data.drm_fd);
>>>>>>>>      		igt_require(data.display.is_atomic);
>>>>>>>> -
>>>>>>>>      		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>>>>>>>> +		data.big_joiner_output_count = 0;
>>>>>>>> +		data.non_big_joiner_output_count = 0;
>>>>>>>> +		data.combined_output_count = 0;
>>>>>>>> +		data.output_count = 0;
>>>>>>>>      		for_each_connected_output(&data.display, output) {
>>>>>>>>      			bool found = false;
>>>>>>>>      			drmModeConnector *connector = output->config.connector;
>>>>>>>> -
>>>>>>>> -			/*
>>>>>>>> -			 * Bigjoiner will come in to the picture when the
>>>>>>>> -			 * resolution > 5K or clock > max-dot-clock.
>>>>>>>> -			 */
>>>>>>>>      			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);
>>>>>>>> -
>>>>>>>>      			if (found) {
>>>>>>>> -				data.output[count].output_id = output->id;
>>>>>>>> -				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
>>>>>>>> -				count++;
>>>>>>>> -
>>>>>>>> -				width = max(width, mode.hdisplay);
>>>>>>>> -				height = max(height, mode.vdisplay);
>>>>>>>> +				data.big_joiner_outputs[data.big_joiner_output_count++] = output->id;
>>>>>>>> +				igt_output_override_mode(output, &connector->modes[0]);
>>>>>>>> +			} else {
>>>>>>>> +				data.non_big_joiner_outputs[data.non_big_joiner_output_count++] = output->id;
>>>>>>>> +				kmstest_get_connector_default_mode(data.drm_fd, connector, &default_mode);
>>>>>>>> +				igt_output_override_mode(output, &default_mode);
>>>>>>>>      			}
>>>>>>>> -			valid_output++;
>>>>>>>> +			data.output_count++;
>>>>>>>> +		}
>>>>>>>> +
>>>>>>>> +		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count > 0) {
>>>>>>>> +			data.combined_outputs[data.combined_output_count++] = data.big_joiner_outputs[0];
>>>>>>>> +			data.combined_outputs[data.combined_output_count++] = data.non_big_joiner_outputs[0];
>>>>>>>>      		}
>>>>>>>>      		data.n_pipes = 0;
>>>>>>>>      		for_each_pipe(&data.display, i) {
>>>>>>>>      			data.n_pipes++;
>>>>>>>> -			pipe_seq[j] = i;
>>>>>>>> +			data.pipe_seq[j] = i;
>>>>>>>>      			j++;
>>>>>>>>      		}
>>>>>>>> -
>>>>>>>> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
>>>>>>>> -
>>>>>>>> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
>>>>>>>> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>>>>>>>>      	}
>>>>>>>>      	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>>>>>>>>      	igt_subtest_with_dynamic("basic") {
>>>>>>>> -		for (i = 0; i < data.n_pipes - 1; i++) {
>>>>>>>> -			data.pipe1 = pipe_seq[i];
>>>>>>>> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
>>>>>>>> -				test_basic_modeset(&data);
>>>>>>>> +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
>>>>>>>> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>>>>>>>> +
>>>>>>>> +		for (i = 0; i < data.big_joiner_output_count; i++) {
>>>>>>>> +			uint64_t num_combinations = 0;
>>>>>>>> +			Combination combinations[MAX_COMBINATIONS];
>>>>>>>> +
>>>>>>>> +			generate_combinations(i+1, data.n_pipes, BIG_JOINER, combinations, &num_combinations);
>>>>>>>> +			igt_info("Number of combinations for %d outputs and %d pipes are %ld\n",
>>>>>>>> +					 i+1, data.n_pipes, num_combinations);
>>>>>>>> +
>>>>>>>> +			if (num_combinations > 0)
>>>>>>>> +				igt_dynamic_f("%dx-big-joiner", i+1)
>>>>>>>> +					test_basic_modeset(&data, i+1, combinations, num_combinations);
>>>>>>>> +			else
>>>>>>>> +				break;
>>>>>>>>      		}
>>>>>>>>      	}
>>>>>>>> -	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>>>>>>>> -		     "when the pipe is active with a big joiner modeset");
>>>>>>>>      	igt_subtest_with_dynamic("invalid-modeset") {
>>>>>>>> -		data.pipe1 = pipe_seq[j - 1];
>>>>>>>> -
>>>>>>>> -		igt_display_reset(&data.display);
>>>>>>>> -		for_each_connected_output(&data.display, output) {
>>>>>>>> -			if (data.output[0].output_id != output->id)
>>>>>>>> -				continue;
>>>>>>>> -
>>>>>>>> -			mode = data.output[0].mode;
>>>>>>>> -			igt_output_set_pipe(output, data.pipe1);
>>>>>>>> -			igt_output_override_mode(output, &mode);
>>>>>>>> +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
>>>>>>>> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>>>>>>>> -			igt_dynamic_f("pipe-%s-%s",
>>>>>>>> -				      kmstest_pipe_name(data.pipe1),
>>>>>>>> -				      igt_output_name(output))
>>>>>>>> -				test_invalid_modeset(&data);
>>>>>>>> -		}
>>>>>>>> +		if (data.big_joiner_output_count >= 1)
>>>>>>>> +			igt_dynamic_f("big_joiner_on_last_pipe")
>>>>>>>> +				tets_big_joiner_on_last_pipe(&data);
>>>>>>>> -		if(valid_output > 1) {
>>>>>>>> -			for (i = 0; i < data.n_pipes - 1; i++) {
>>>>>>>> -				igt_output_t *first_output = NULL, *second_output = NULL;
>>>>>>>> -
>>>>>>>> -				data.pipe1 = pipe_seq[i];
>>>>>>>> -				data.pipe2 = pipe_seq[i + 1];
>>>>>>>> -
>>>>>>>> -				igt_display_reset(&data.display);
>>>>>>>> -				for_each_connected_output(&data.display, output) {
>>>>>>>> -					if (data.output[0].output_id == output->id) {
>>>>>>>> -						first_output = output;
>>>>>>>> -						mode = data.output[0].mode;
>>>>>>>> -
>>>>>>>> -						igt_output_set_pipe(output, data.pipe1);
>>>>>>>> -						igt_output_override_mode(output, &mode);
>>>>>>>> -					} else if (second_output == NULL) {
>>>>>>>> -						second_output = output;
>>>>>>>> -						igt_output_set_pipe(output, data.pipe2);
>>>>>>>> -
>>>>>>>> -						break;
>>>>>>>> -					}
>>>>>>>> -				}
>>>>>>>> -
>>>>>>>> -				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
>>>>>>>> -					      kmstest_pipe_name(data.pipe1),
>>>>>>>> -					      igt_output_name(first_output),
>>>>>>>> -					      kmstest_pipe_name(data.pipe2),
>>>>>>>> -					      igt_output_name(second_output))
>>>>>>>> -					test_invalid_modeset(&data);
>>>>>>>> -			}
>>>>>>>> -		}
>>>>>>>> -	}
>>>>>>>> +		if (data.big_joiner_output_count > 1)
>>>>>>>> +			igt_dynamic_f("invalid_combinations_with_two_bigjoiner")
>>>>>>>> +				test_invalid_modeset_two_joiner(&data, false);
>>>>>>>> -	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
>>>>>>>> -	igt_subtest_with_dynamic("2x-modeset") {
>>>>>>>> -		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
>>>>>>>> -		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
>>>>>>>> -		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
>>>>>>>> -			data.pipe1 = pipe_seq[i];
>>>>>>>> -			data.pipe2 = pipe_seq[i + 2];
>>>>>>>> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
>>>>>>>> -				test_dual_display(&data);
>>>>>>>> +		if (data.combined_output_count) {
>>>>>>>> +			igt_dynamic_f("invalid_combinations_with_bigjoiner_non_bigjoiner")
>>>>>>>> +				test_invalid_modeset_two_joiner(&data, true);
>>>>>>>>      		}
>>>>>>>>      	}
>>>>>>>>      	igt_fixture {
>>>>>>>> -		igt_remove_fb(data.drm_fd, &data.fb);
>>>>>>>>      		igt_display_fini(&data.display);
>>>>>>>>      		drm_close_driver(data.drm_fd);
>>>>>>>>      	}
>>>>>>>> -- 
>>>>>>>> 2.25.1
>>>>>> Thanks and Regards
>>>>>> Kunal Joshi
>>>> Thanks and Regards
>>>> Kunal Joshi
Thanks and Regards
Kunal Joshi
