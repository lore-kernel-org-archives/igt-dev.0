Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A48C54E4A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 13:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6380310E738;
	Mon, 26 Feb 2024 13:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atln4COY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA44110E738
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708955350; x=1740491350;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8uNC+Sg/ERLG4vFD2rAYVrQxYOFfdMsrkEFylUU1r90=;
 b=atln4COYfJmqmFpCSsku/0Hr0/5tk2xKfAyGlgdfgW9dDnSX25XqjMrt
 smVBKvvL0ZAMVKu25XlvCXFBPRvj3yTrg5IrO4dFvaynCHrgdHcTGci/W
 SJCoDGUMFi0eTPcPC8jHdP/hG7OGODb800lgQzfbHrUx7JRw/OuffeS0E
 bvY4Or86+gkp3r6voG9r4FEnE1mHN1NXG8Lm4Cqe+X/NjpKNOYOmGBH9e
 7bn90eAPGPhXBKdtFss+jPwz8zx/6/dkE5fR5j2euHx1ZskgDlAeRgAlt
 G/x2ne207Rs3qUb7ITuqoQd7jyCmj8lKGpxjD1t31yo/lSGTb5WO9gser w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="13880945"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="13880945"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 05:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6807918"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 05:49:07 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 05:49:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 05:49:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 05:49:05 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 05:49:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJBMbP4gVbZY75jhGrfOZh67nzyr01FJxzVSr2i+7+LwcGKRyhArgYAhmJ7oUGGRJ0oZZIDz6ZIQcaIJYVouh/OmxUT0OCpiXSs+v2UGFLuW+RXXfjXDhy1s/VMSDM91D6hFf7EufldrcdUEJ0VA7KIFjViHQaEuyzSXnXxdc4zVz4GenlzLshemoGTp0cXRsFaBaoP2e5fMaI8BUcJQ9SnUN7nVkH1yoblklJR0b6B1gxoh5setSj4xKvMEcuYu88KAuOpbSuyHXJrA0eCawN+ovYVFosfyDxuMCI5GdxaTXETftkSwVm96i7L3sC69tAAUIa0KUUzxcpNJPc56ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHCRHrn8QlxjhkSsahzKQ4ZFoO/R53U0IccV7byQYBY=;
 b=WmI/YsIlCts254b06zHdvYxTBRgmUMHWuq12iAwPIg30tyB2Pbk/+9KB7xWgeYbKN0vrSty+lmLHmjQ79RSSXsmCMru3ucfxaxckgMQUVBZUFFssV8HiJYKFmhyRN57kVWRjRGf3hoZC8wohOf6b9WWZotAo6LkIHCf8o/oSZHRCyyVdrvbDIM9AdfIvZ+lBeDDt/eHwlaR/XldWk0H9upsEPS9FUqxkBlnrl2FOoosvsyxJJX1SctNdTPRxo8xWCCg/vBPiqVIJfycAiA5d8aqqLaG3qj+Snlgh7XsK4iuPuoOTl4/W/ISzAwGkg4z99TnDdSTHt018iKeK4/loqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.21; Mon, 26 Feb 2024 13:48:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5%4]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 13:48:56 +0000
Message-ID: <02843e5f-f7e2-4fe2-90ea-98cd2e2b25ef@intel.com>
Date: Mon, 26 Feb 2024 19:18:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_gt_freq: re-introduce exec tests of
 xe_gt_freq
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <aravind.iddamsetty@intel.com>,
 <badal.nilawar@intel.com>
References: <20240222054532.454378-1-riana.tauro@intel.com>
 <48378e1d-5eff-4dbf-b4df-92048f168e30@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <48378e1d-5eff-4dbf-b4df-92048f168e30@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 45db0bab-1fd0-4946-634d-08dc36d1ad57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0xU8nmdAOOrLQq1mnvvSvAEyaB6H1adO4eXYpGVY4GHZrZhtgASiY/vPe5ECmMv/8aKoyrwmh/HY322OTryJ+dSxbpHR7WlUrwIlauyM5kxtyf9UE/z3RmVBkzeaCSr/dOhHEd947wISs0AmLN6wdPONmgkdWUHqdowysvYf6Yxnrm7xdPzFl85+XnHsiw3O3nQ6EVWjp65KDgYTpX6qMsP3hidaKCtPVInY4svd6bq28Rjb09c1NsMxCTzC3U7Go5/dJnlcDk4g6cfqwnCWFH7oibVx61xSyXUsgACj6wmWHQtvhgb5bE3wVWg5IayGfV9q+cHzcvX6g++n+WF9kZk9twlO/LGE/gScNsw/Bq6ZBHA7ykNkSqwEEXa9VBUPvSq6ltRjKmqTc2cT5pu7B8ejR3cYJAAVAvGMrsX48K0abUTS+ZqxyzUwe/u5u80mkfdykR6LZf2GPGWFC5E+fIa3YHm6l3QY4SXI9nLheuHfq93xghagIkeHUpTjFVxboviWE9q99exGODUu6buuUnugGYIcf+rnkryEX0FggBiBdrOb1+6Cf6uZd+40APSzWNbwl14UE+rmHjUhLoQUxfk74MchnbqKgDlJQqsLPCt6g3O+vMiHSLapebIx8Xkgzedp2NsuhDuvM7SgMOTlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWViQmdVMmlmVlZWNkk1K0hyYW81amVWSVk1QWRMZit1bWhuZTZjRTVBTWhW?=
 =?utf-8?B?a2RFeDMwWjIxWFFmYkxqd1hESnV1VVpuWVlWMm9MRFZEdzhaQ3YrZTBzMWNY?=
 =?utf-8?B?RlRDcDBiK3V5OEZXbE9xK0dXenRZUi8rUCtDWlJDMU1pTlJCRGJLTVg0SHVR?=
 =?utf-8?B?R0hwdU12b0dnS1lJQWV1dmlyd3hTOGtlRFpqUndPV2R5TkFaa0FQdmdrZ2ww?=
 =?utf-8?B?ZUd1cTU4Z3lSWlBiamVZMjNORnVEc0IvNEpIekVNdTNnWVpPVVNDUDMyYjNB?=
 =?utf-8?B?ZEtJcHJJUkgrQlk2V0x2aWZtOE1DZ0Ewc0hOczExNFJQNTBTTGJmRUZsNm0z?=
 =?utf-8?B?WlJCajNtR2h3WC95bzl0Wlh4bllhSS9jSWgwb1lkQ3N0UTNDS3huQW8wNUc4?=
 =?utf-8?B?Q2ZncXQ2VTFobWJ2QXF5cHpiY1JHeVBpZ1lQUVlia29ESkRUUy9zamRIa1dw?=
 =?utf-8?B?YU82S0RhTExjbWF6UzQ0N0dqOHFKTEd5dXhPNGdRVUUwOVBKQXFHdWZGaHRB?=
 =?utf-8?B?L2FYNTVOU1d6dWVHdjk5azhhZGthKzM2ekRzOFBtTU9rbDhMdG5tZ0xXS2ln?=
 =?utf-8?B?dXZTeEw5Mk10ZE5PR0Nkd0NIQWJrWmxUTk1hbnhFQktWODF6U3VjRmM3MmZw?=
 =?utf-8?B?OHJTYmJqUjViVGJWSmJya2FMeUNpR2xnWFVpMVhBMStzL250VE5IT0ZyTHk3?=
 =?utf-8?B?YUZuZUNvWThVbzJaREpCUEovVHFIa0tRaHNCWUVYVlVMR2RqaE1YNUlOdjNB?=
 =?utf-8?B?bExsMko0bFgxOVR5MnhYbFFaRDNQUWl3U29UTzN2clpKNWR1YWNyTG9DOUhw?=
 =?utf-8?B?YUFkOHozMWJlU0RFMnQzTVNqWng5ZHd1U0hFeWVLOE9udDNiVndHaVh4WU5F?=
 =?utf-8?B?c2lHU1orQ3RyQlRNUVRCcjMzRDErYncvKzJSTlBseFJETEJsdFI0cGp0MG1J?=
 =?utf-8?B?ZGpJK2RXT1NkSm43ZmtMVXRDZXc3cEs4dXBkM0hkVEdFYzBBTzZrekFObnpj?=
 =?utf-8?B?VUdUM1dQUytwTnphcGhnRXdXaGpad3ZQL09tcEVmQkVqendlTkR3VmJyV1lq?=
 =?utf-8?B?YnZqQkU2UUlqYUdYWkZhYWx1VEhqYWhuVERVZE1ySTNRZHMxaFNCeU5Lb05V?=
 =?utf-8?B?bkRnK3lodmJNNWUyVS9GbnZtUmRtd2U5cGdvbmtFZVRhcVFRZFdWMzh1THQz?=
 =?utf-8?B?RGhzVEZQTm9LWDlpNjQ5UGV1ek0xRmlLMlVuVE9NUGttWWlvVzBQb2ZaRkN4?=
 =?utf-8?B?ZGU4aDVoQ2hjL0Jhbk0vbVhITEtuN294bEROekVGZzlKUWVwU2dYNWVEN09F?=
 =?utf-8?B?MEtGb0JVOWVnYzBhMnN5bE5wWGM1anZta2tMeHNJdGVTVCtCbklZK3NKNjQ1?=
 =?utf-8?B?RFNwY0tXcHFSVmIxZEd5Qkltc0RiTjFSWU55MTFTK2YzWWo5ZEFLcTdkVlVS?=
 =?utf-8?B?MDAxNldiUzNCUVpmL2diMG82cWU4aHYvWm5BWjVmMUhyYUVnQXpUSkVxM2Fk?=
 =?utf-8?B?bVp6WWVtb1RKQVVVb1pLQloyWXp6c3V0TnFNblQySm1MREJrcHdUT2JTNlpR?=
 =?utf-8?B?VDMwaXJoRngvMWFqU0pReXhHTkQvRVMwN3VwZ2dYQmVTZTZzbGVmTlVMZU5G?=
 =?utf-8?B?cVZSUXF5VGd5V2VCNEsxSFZtb2x2NGxiWkcrVHpXaDdsbTF6cUdleXJoQ0hj?=
 =?utf-8?B?K3lnczRReWZERXFSVHBTTEhJclRJLy9DeldqZFI1alNna1M5VHpicytjS0w1?=
 =?utf-8?B?ZURuU1NCc1VaRWxwK3UxdGd0aDFweGhFc2tac3ptcllTck81UEVoOEd3YW9s?=
 =?utf-8?B?UXoxU3lsYkpWdkg5UlYrc0Fhcll3ZDlwTHh6LzZUSyt4dkJZUXNQYk9ieTRH?=
 =?utf-8?B?bk4vN29pMWF1M0phV01jUGc1YWprWmRmbGRiTit5bi9vNHUzSkcvUHR2dUEw?=
 =?utf-8?B?blJoMzBWOTRSa3VROG1udTZUWFBQUGV1aWRmRmlScnpLa2lFd3N1RGdQc2N0?=
 =?utf-8?B?L1dhTUV4WVJKRWFpRmcyZHJHM2p1RE9LK2wrYk14Vkg0TEJhNzNNR2NrdFN0?=
 =?utf-8?B?M0FBZ21xYmdBeG5wb3kyaTBlbGtZMnhWR1lqZnlaUmZyTldmUS9xWE9EekEx?=
 =?utf-8?Q?LwNojKsUUao9OwQwD8C3pKlnS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45db0bab-1fd0-4946-634d-08dc36d1ad57
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 13:48:56.8100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/H0oBZ0JWAFvyPPGnTD0dkTKj5neFyvj1q+vMnD2lbiu8bEez0wh2k2fzjfv4hZR5x31Y2BACcdViJejzv4PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7378
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

Hi Suja

On 2/26/2024 4:38 PM, Sundaresan, Sujaritha wrote:
> 
> On 2/22/2024 11:15 AM, Riana Tauro wrote:
>> The tests freq_range_exec, freq_fixed_exec were removed due
>> to a design flaw which caused failure in tests. The workload execution
>> finished earlier before the frequency validation when gt was set to
>> run at a higher frequency.
>>
>> These tests are being reintroduced with a spinner based approach
>> in this patch to avoid such failures.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/intel/xe_gt_freq.c | 106 ++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 105 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
>> index bf63e4298..f0de341cb 100644
>> --- a/tests/intel/xe_gt_freq.c
>> +++ b/tests/intel/xe_gt_freq.c
>> @@ -17,6 +17,7 @@
>>   #include "xe_drm.h"
>>   #include "xe/xe_ioctl.h"
>> +#include "xe/xe_spin.h"
>>   #include "xe/xe_query.h"
>>   #include "xe/xe_util.h"
>> @@ -153,6 +154,9 @@ static void test_freq_basic_api(int fd, int gt_id)
>>   /**
>>    * SUBTEST: freq_fixed_idle
>>    * Description: Test fixed frequency request with exec_queue in idle 
>> state
>> + *
>> + * SUBTEST: freq_fixed_exec
>> + * Description: Test fixed frequency request when spinner is run
>>    */
>>   static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>> @@ -217,8 +221,10 @@ static void test_freq_fixed(int fd, int gt_id, 
>> bool gt_idle)
>>   /**
>>    * SUBTEST: freq_range_idle
>>    * Description: Test range frequency request with exec_queue in idle 
>> state
>> + *
>> + * SUBTEST: freq_range_exec
>> + * Description: Test range frequency request when spinner is run
>>    */
>> -
>>   static void test_freq_range(int fd, int gt_id, bool gt_idle)
>>   {
>>       uint32_t rpn = get_freq(fd, gt_id, "rpn");
>> @@ -319,10 +325,88 @@ static void test_reset(int fd, int gt_id, int 
>> cycles)
>>       }
>>   }
>> +static void test_spin(int fd, struct drm_xe_engine_class_instance 
>> *eci, bool fixed)
>> +{
>> +    struct drm_xe_sync sync[2] = {
>> +        { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = 
>> DRM_XE_SYNC_FLAG_SIGNAL, },
>> +        { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = 
>> DRM_XE_SYNC_FLAG_SIGNAL, },
>> +    };
>> +    struct drm_xe_exec exec = {
>> +        .num_batch_buffer = 1,
>> +        .num_syncs = 2,
>> +        .syncs = to_user_pointer(sync),
>> +    };
>> +    uint64_t addr = 0x1a0000;
>> +    struct xe_spin_opts spin_opts = {
>> +        .addr = addr,
>> +        .preempt = false
>> +    };
>> +    struct xe_spin *spin;
>> +    uint32_t exec_queue;
>> +    uint32_t syncobj;
>> +    size_t bo_size;
>> +    uint32_t bo;
>> +    uint32_t vm;
>> +
>> +    vm = xe_vm_create(fd, 0, 0);
>> +    bo_size = sizeof(*spin);
>> +    bo_size = xe_bb_size(fd, bo_size);
>> +
>> +    bo = xe_bo_create(fd, vm, bo_size,
>> +              vram_if_possible(fd, eci->gt_id), 0);
>> +    spin = xe_bo_map(fd, bo, bo_size);
>> +
>> +    exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>> +    syncobj = syncobj_create(fd, 0);
>> +
>> +    sync[0].handle = syncobj_create(fd, 0);
>> +    xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>> +
>> +    xe_spin_init(spin, &spin_opts);
>> +
>> +    sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>> +    sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +    sync[1].handle = syncobj;
>> +
>> +    exec.exec_queue_id = exec_queue;
>> +    exec.address = addr;
>> +    xe_exec(fd, &exec);
>> +
>> +    xe_spin_wait_started(spin);
>> +    usleep(50000);
>> +    igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
>> +
>> +    igt_info("Running on GT %d Engine %s:%d\n", eci->gt_id,
>> +         xe_engine_class_string(eci->engine_class), 
>> eci->engine_instance);
>> +
>> +    if (fixed)
>> +        test_freq_fixed(fd, eci->gt_id, false);
>> +    else
>> +        test_freq_range(fd, eci->gt_id, false);
>> +
>> +    xe_spin_end(spin);
>> +
>> +    igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>> +    igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, 
>> NULL));
>> +
>> +    sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +    xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>> +    igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, 
>> NULL));
>> +
>> +    syncobj_destroy(fd, sync[0].handle);
>> +    syncobj_destroy(fd, syncobj);
>> +    xe_exec_queue_destroy(fd, exec_queue);
>> +
>> +    munmap(spin, bo_size);
>> +    gem_close(fd, bo);
>> +    xe_vm_destroy(fd, vm);
>> +}
>> +
>>   igt_main
>>   {
>>       int fd;
>>       int gt;
>> +    struct drm_xe_engine_class_instance *hwe;
>>       uint32_t stash_min;
>>       uint32_t stash_max;
>> @@ -352,6 +436,16 @@ igt_main
>>           }
>>       }
>> +    igt_subtest("freq_fixed_exec") {
>> +        xe_for_each_gt(fd, gt) {
>> +            xe_for_each_engine(fd, hwe) {
>> +                if (hwe->gt_id != gt)
>> +                    continue;
>> +                test_spin(fd, hwe, true);
>> +            }
>> +        }
>> +    }
>> +
>>       igt_subtest("freq_range_idle") {
>>           xe_for_each_gt(fd, gt) {
>>               igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
>> @@ -360,6 +454,16 @@ igt_main
>>           }
>>       }
>> +    igt_subtest("freq_range_exec") {
>> +        xe_for_each_gt(fd, gt) {
>> +            xe_for_each_engine(fd, hwe) {
>> +                if (hwe->gt_id != gt)
>> +                    continue;
>> +                test_spin(fd, hwe, false);
>> +            }
>> +        }
>> +    }
>> +
>>       igt_subtest("freq_low_max") {
>>           xe_for_each_gt(fd, gt) {
>>               test_freq_low_max(fd, gt);
> 
> Functionally lgtm. This test had to be revised due to existing design 
> flaws.
> 
> I'm not sure but there were some naming suggestions for the subtests 
> during the initial discussions.

spinner uses exec too. So the names should be okay.
If there are any other suggestions, i will change it.
> 
> Do we have the tests passing in pre-merge ?

Will add it to fast-feedback list and resend to check results.

Thanks,
Riana Tauro
> 
> Thanks,
> 
> Suja
> 
