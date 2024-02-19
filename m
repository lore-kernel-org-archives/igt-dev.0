Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A258C48260
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 08:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DEC10E183;
	Mon, 19 Feb 2024 08:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k23e+PR3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5BF10E1A1
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 08:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708330043; x=1739866043;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BYUvXG4bXcXSm+0LZuhv2NjVLVeAdzdDcDVegCtnvQM=;
 b=k23e+PR3bsfc+18+xQiBJ6apq83AhHmn7+603eMY1D25QICiBjBT6+DB
 AzJR9HzXmfAZgHSET1Lcp0tIaAwg+sHwCaYCCVS2LljfcZHpRfEMswkrw
 /6o/kEr2CTzu+A5qULgRJSa+KchFBQCG9iNsZ5xr9Y01Tr2wMQ4cqSTse
 p59NE6kH73SCOj9WSfwzjdp0P2oxhUqoy8e9FGloee6ieWSmlC4frIZHP
 Q92RU0iYQ5dn4tfGHvyGNHPfc7crwWIUmvN9USMRDLq1aPeeFmnBnKdDq
 B2A/18GZqZlMK0qxtVp3cZvu+m0Gru24/DtR9Sb5GStkT5q7FuGievR55 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2525167"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2525167"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 00:07:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9087140"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 00:07:21 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 00:07:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 00:07:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 00:07:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 00:07:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXWne8z6GgiT1NsCJ4tKgJGDB1l6W8iUV5oVM84PXz2l66ouVSb+iVyeWDteLkXNmw1t1bsQXfSKy3ZAv+8VTvfD/L2bjShdlTwxwhp8/MCrRqy+ddewcWme1yzoRO4asvLud20XU3jIiXNA/tmSW1xeZAZVvI8Ch6aISHdWJje3YLDfchHFtJ0ruigssMqb5/uLRIkFoZ8h7HYzpWqCLwDtJ/MnRvFNtTUMA1EvV9yR3r0ksyfU2V6AN3HierA4TSG35ugKWE1iaZf0kyZeWwlpT0eXyV30V7eE3/18WMpHxxwkcBiLUr5iLFKbgQ7Zb+d0Djb7VBgvHm7OFGR1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Pn9par1iaKSelKZIwuRzqmD2wr8xey+/t4DIoTg1NU=;
 b=OMTD5gyNmp3GNaiNSOtuAshR4YMTv/Tl9+sKVy8Q+XNtfKdmQoB4en2Jm33iqy6+ZtpJEvh2+XMVLW0RLNBI0Z5vBb9vw3Sgj/x98JQfLhg+uZ5iqi4XIQeMJmxD1OaJKFCbzDkibpSEanm5lMyJKKPqgEDxmDd3xTREFo1amOkOdJZrEYzKOm7NK3hUlwz7qSWqSzIAlDRI9h7s5A5ACjvXaBINT3gdKXGib8GFezjPjhM7dikgwjZYwQugEIX+fEWqSAuFC9mX0eP+NYHt7T16+hrZUtFtjVGeeoWnYyaKdHSkYfqr80a57h78pE/0DHRRvTMfbNNhyuzrOMih9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Mon, 19 Feb
 2024 08:07:18 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 08:07:17 +0000
Message-ID: <6f058d0c-0cef-479e-ba87-2e263c4220ea@intel.com>
Date: Mon, 19 Feb 2024 13:37:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/igt_psr: modify library to support multiple
 PSR/PR outputs
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
References: <20240218091704.2259937-1-kunal1.joshi@intel.com>
 <20240218091704.2259937-2-kunal1.joshi@intel.com>
 <23724dffbc7d0224ea26541fa34a17ad77cc6f36.camel@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <23724dffbc7d0224ea26541fa34a17ad77cc6f36.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::16) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1ff7eb-e93b-4d00-9607-08dc3121ca24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yGFeG1avAWD1AK1GQbX8d3ddf011ui+X5cXzfxLFPQNpPB7JSjpWEdsUk8nL9Jy01ClHu0Rqb28TkkrX3njQILOhODrODPFLTsUEI8/Lp6p7bAxgFJ+3do/QLwAiObBDxRViy8ajwObdsyheedSwXfSNM7Y2s22o1NWV+R9o4vXwBtVm4PImyGT8tFuse3k8c5tOozD6Kt4e3GhS2KQVNvjN0lKDl0q37JzCi7EFO6tW/yWWGzAD/RGbR0HVKGxAmc2npL+9VzFe8bWCpupPqdlIyCc7XldBRo9iaf31lp/XWBGQoVxp4Ikui9HqQdTWe9uK3f4XLjGrq7zrehz/YXemBtqiaSQn2Pj4O/M9qeNipovYVBV+23aBbtLfOt9lgaNeaS/78NS1xme+BsWzC3IqOXbGW3QIad1s02Pyd3XIDMAyPtWPf0myGf229cKZoqdrxiOtepAdxxI5nY+DmY14H3y7B1BbnKHUcPmmScUq9fECWwg9mr5LwGPQhSfe5qhWRl6Okv7x2bgpen74MjF3Rcnf9jvI8hCwXhFe15+zxNHdPkAHR683jBvqJC7b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(5660300002)(30864003)(2906002)(26005)(6512007)(2616005)(36756003)(107886003)(478600001)(6506007)(6486002)(53546011)(38100700002)(82960400001)(66574015)(83380400001)(31696002)(86362001)(8936002)(4326008)(8676002)(66946007)(66556008)(66476007)(41300700001)(110136005)(54906003)(6666004)(316002)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXhzM0J5bDJGVW9JMGFpdmhDcDZrdFVYSzFiUlhReThkOFZ4SWl1TVdEdVJL?=
 =?utf-8?B?djRHQ3J2QXNrNU9FUmZwd3cyakdWNVE4OHJONXNFeVRCSkY1RjlSZXpVSVda?=
 =?utf-8?B?RjVOQmxyQjhCRXlOS3Z1OU5QZDlvVlpMbEQxTVEzN1FYd3VCWVkzR3Y1dVBC?=
 =?utf-8?B?dzZPN3pzRFlNVzVKazArMkJ6ZUhpUHJXRk1vK1FzbGhNcVQyZlVhOUpUN21U?=
 =?utf-8?B?K3R5WElYc2ZkRlFyT2s4ZXFCekpNdnRIeXBydFBaZGlNMndyUWJIUm5yRW4z?=
 =?utf-8?B?NS9qaVVBeis1STdRYWJTY2VUdXpFaFVEQVFIVmlVRm81bG02M0R2R2tBME54?=
 =?utf-8?B?K1ZRblUydWoxRFIwQjVILy9EQlNKODRCbXJMWWpZbmdsaEwzQW9nZmJXNmJz?=
 =?utf-8?B?enRacGNTYUlrZmgrQWhWbFBUb1U0di9URkJlbUtVMEZ4OFpKblUzN0hSQXUv?=
 =?utf-8?B?Y3ZRVFNoMlVzRXlJcXZBd0ZjR2xlakt5NHdPeDVUUytCeFNESnE0WUdIcExR?=
 =?utf-8?B?dTU3ZlczdGVJTnA3VWxNbWcvdTdRN2tGY3UvWm5EMDBxREhGTDhNZW94MjVZ?=
 =?utf-8?B?Y1V2RzlyeHM5UGx3a2U5R3UzWktUbUtZWjBVdGNrZ3IxK0tTbWlaOG91RlNZ?=
 =?utf-8?B?NTVtaWdqdGd5SW80aG5aT2pIRDBIMGlSanpsaWdTRjlBS21yb25YUkhrUExs?=
 =?utf-8?B?TDhPUGR4cTFSdm9qZjFLTVZIYWZud3B4Wll4NEhJVk9yUmRuMEE3eElUbEpW?=
 =?utf-8?B?K3JDL0Q3R3BabGhaNDQzMSs0UUVZVHhlTUI4NmtrQzlGOHFibzF6REhXNk9E?=
 =?utf-8?B?SDFVTHZQMDdYTzNiMjZLNUFTNmxRUE1MOUV2YkxUN0t6Y3JJVHl1eUVJM0VM?=
 =?utf-8?B?a3JTelpaZW5yTE1LeWR0VThUUS9CVnoxSkVCMDJnbHIzMEJCREJKeFRMK05w?=
 =?utf-8?B?YlFOUUhTR1IxelJLbkcwd0t2TGJoOFQxd3pFTGxXSzQvS2xONzY4MkovUW04?=
 =?utf-8?B?WUZRVXhZcFdSY0VkQ2p1SUlkQTFrZkNrMFNqTFA3bjNOYVlLQk1WelI3aG5B?=
 =?utf-8?B?SlcrQ1NGVHFLY2NLZS8rdHYzeHNvWjNsRzJsYnVTUzk5cFhXREZOanBCMW1a?=
 =?utf-8?B?SHVSZVdFVklsUHhnK2JDOHowUW14QVFpV0t6cGpZU0NLeTlYNVduZitNells?=
 =?utf-8?B?QjVnTDlJS2NCZmhXYXlWK0NNaTJML25ZMyt5aXJTa2hSVm5yK0Y5RGhkYXcy?=
 =?utf-8?B?WStrTEF0LzgwakdXZWFISWR1ZlFpYWVpdlh3ZHBoZVZuSFpXYmpwTW5tR2th?=
 =?utf-8?B?eDliNlZmNjdyMXp0SmVSM1BxZEZRTXB0ZDVVL2pUNHV2NFg5cTJmL29NMjZm?=
 =?utf-8?B?QWRmdS9JUU5ORVdQNk9kZ1dTWWtxYWVMNml4NW1sWFkzSVNMdFkvYkpxNEhr?=
 =?utf-8?B?a1RKNG9oVFM3bkFwMVFiZlM3Qm0vUFM2WUZkNjBTRmUvc3licG9pVnJFL0F3?=
 =?utf-8?B?NW1JNjVtbXczUy9MTU81NTBwVGJQU0ZXT1lKTFp5bjNNdmRkanNVT3JtVkt6?=
 =?utf-8?B?MDNTWnJ5SWttcWhGaWttSEFNZnNqUGYrRWdZV2FzOHVKZVlPbHdnVkNMQ2Q4?=
 =?utf-8?B?UkNIZHdzbVU0U1JFU2JFczJNeWx3Q0NGbXAxT2VkUlo5REVlVjNHV2dlbUtF?=
 =?utf-8?B?OGZMS09UQVhwYTJUZFJ3OGRFNTRwbXZUOTBUTGVmRmRyaWxXZjExSERwbElY?=
 =?utf-8?B?VmVnRVVzSndEa2hxbVpKUFljMjNVTTM4djBpeDV2L29kZlBqS01ndlBNTEJR?=
 =?utf-8?B?aGJnQTdSbmZaZWU4cXBkSUQ1YjJOT2E2Sk9Ba3hqNjZWSDlLOGdOZkxoUmxr?=
 =?utf-8?B?TWxyaHZLU25yMjUweC9vQkxFVUtwclpGY09ybGpVOUxsZHczOVRCYm9paFpR?=
 =?utf-8?B?RHA1dnN1bFNCNGlVVEpGT2tLeVlla3Z1bHhZSkRUZVFicFljQXJObzh5SFp6?=
 =?utf-8?B?ZzE0b0ZqV0pUNUF3ZDVVS2hLSUcyOStaVWVxKzUzckdmMWdQSi8zdG1ack5D?=
 =?utf-8?B?SUZlR3U3OXZYL3dBSnJrbW13dUV2TkZ5MnUzL0dQQmpYM3B1YmxaV1c5Z0NH?=
 =?utf-8?Q?KTpW+JIUHXPj4lU50XSqjkX3F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1ff7eb-e93b-4d00-9607-08dc3121ca24
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 08:07:17.8202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYaGb/xLRxvqbxKb6XEPaH9O/qnnE2tk1eRZ89QNUqw9BVbk7hsLGH//GqyJtc5OXbWD4grQ62r1xnloMB3UxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
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

Hello Jouni,

On 2/19/2024 1:15 PM, Hogander, Jouni wrote:
> On Sun, 2024-02-18 at 14:47 +0530, Kunal Joshi wrote:
>> We can have multiple panels connected to the system so PSR
>> information
>> should be exposed per output. changes provide support for multiple
>> PSR/PR to be tested simultaneously.
>>
>> Cc: Jouni Högander <jouni.hogander@intel.com>
>> Cc: Animesh Manna <animesh.manna@intel.com>
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/igt_psr.c                          | 76 ++++++++++++++----------
>> --
>>   lib/igt_psr.h                          | 14 ++---
>>   tests/intel/kms_dirtyfb.c              |  4 +-
>>   tests/intel/kms_fbcon_fbt.c            |  4 +-
>>   tests/intel/kms_frontbuffer_tracking.c |  4 +-
>>   tests/intel/kms_pm_dc.c                |  6 +-
>>   tests/intel/kms_psr.c                  |  4 +-
>>   tests/intel/kms_psr2_sf.c              |  8 ---
>>   tests/intel/kms_psr2_su.c              |  2 +-
>>   tests/intel/kms_psr_stress_test.c      |  4 +-
>>   tests/kms_async_flips.c                |  4 +-
>>   tests/kms_cursor_legacy.c              |  4 +-
>>   12 files changed, 65 insertions(+), 69 deletions(-)
>>
>> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
>> index ac214fcfc..cad8cce05 100644
>> --- a/lib/igt_psr.c
>> +++ b/lib/igt_psr.c
>> @@ -27,6 +27,10 @@
>>   #include "igt_sysfs.h"
>>   #include <errno.h>
>>   
>> +#define SET_DEBUGFS_PATH(output, path) \
>> +       sprintf(path, "%s%s%s", output ? output->name : "", output ?
>> "/" : "", \
>> +                       output ? "i915_psr_status" :
>> "i915_edp_psr_status")
>> +
>>   bool psr_disabled_check(int debugfs_fd)
>>   {
>>          char buf[PSR_STATUS_MAX_LEN];
>> @@ -37,11 +41,13 @@ bool psr_disabled_check(int debugfs_fd)
>>          return strstr(buf, "PSR mode: disabled\n");
>>   }
>>   
>> -bool psr2_selective_fetch_check(int debugfs_fd)
>> +bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t
>> *output)
>>   {
>>          char buf[PSR_STATUS_MAX_LEN];
>> +       char debugfs_file[128] = {0};
>>   
>> -       igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status",
>> buf,
>> +       SET_DEBUGFS_PATH(output, debugfs_file);
>> +       igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>>                                  sizeof(buf));
>>   
>>          return strstr(buf, "PSR2 selective fetch: enabled");
>> @@ -54,11 +60,7 @@ static bool psr_active_check(int debugfs_fd, enum
>> psr_mode mode, igt_output_t *o
>>          const char *state = (mode == PSR_MODE_1 || mode == PR_MODE) ?
>> "SRDENT" : "DEEP_SLEEP";
>>          int ret;
>>   
>> -       if (output)
>> -               sprintf(debugfs_file, "%s/i915_psr_status", output-
>>> name);
>> -       else
>> -               sprintf(debugfs_file, "%s", "i915_edp_psr_status");
>> -
>> +       SET_DEBUGFS_PATH(output, debugfs_file);
>>          ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
>>                                       buf, sizeof(buf));
>>          if (ret < 0) {
>> @@ -90,13 +92,18 @@ bool psr_long_wait_update(int debugfs_fd, enum
>> psr_mode mode, igt_output_t *outp
>>          return igt_wait(!psr_active_check(debugfs_fd, mode, output),
>> 500, 10);
>>   }
>>   
>> -static ssize_t psr_write(int debugfs_fd, const char *buf)
>> +static ssize_t psr_write(int debugfs_fd, const char *buf,
>> igt_output_t *output)
>>   {
>> +       /*
>> +        * FIXME: Currently we don't have separate psr_debug file for
>> each output.
>> +        * so, we are using i915_edp_psr_debug file for all outputs.
>> +        * Later we need to add support for separate psr_debug file
>> for each output.
>> +        */
>>          return igt_sysfs_write(debugfs_fd, "i915_edp_psr_debug", buf,
>> -                              strlen(buf));
>> +                                                  strlen(buf));
>>   }
>>   
>> -static int has_psr_debugfs(int debugfs_fd)
>> +static int has_psr_debugfs(int debugfs_fd, igt_output_t *output)
>>   {
>>          int ret;
>>   
>> @@ -105,7 +112,7 @@ static int has_psr_debugfs(int debugfs_fd)
>>           * Legacy mode will return OK here, debugfs api will return -
>> EINVAL.
>>           * -ENODEV is returned when PSR is unavailable.
>>           */
>> -       ret = psr_write(debugfs_fd, "0xf");
>> +       ret = psr_write(debugfs_fd, "0xf", output);
>>          if (ret == -EINVAL) {
>>                  errno = 0;
>>                  return 0;
>> @@ -113,7 +120,7 @@ static int has_psr_debugfs(int debugfs_fd)
>>                  return ret;
>>   
>>          /* legacy debugfs api, we enabled irqs by writing, disable
>> them. */
>> -       psr_write(debugfs_fd, "0");
>> +       psr_write(debugfs_fd, "0", output);
>>          return -EINVAL;
>>   }
>>   
>> @@ -134,14 +141,14 @@ static int psr_restore_debugfs_fd = -1;
>>   
>>   static void restore_psr_debugfs(int sig)
>>   {
>> -       psr_write(psr_restore_debugfs_fd, "0");
>> +       psr_write(psr_restore_debugfs_fd, "0", NULL);
>>   }
>>   
>> -static bool psr_set(int device, int debugfs_fd, int mode)
>> +static bool psr_set(int device, int debugfs_fd, int mode,
>> igt_output_t *output)
>>   {
>>          int ret;
>>   
>> -       ret = has_psr_debugfs(debugfs_fd);
>> +       ret = has_psr_debugfs(debugfs_fd, output);
>>          if (ret == -ENODEV) {
>>                  igt_skip("PSR not available\n");
>>                  return false;
>> @@ -179,7 +186,7 @@ static bool psr_set(int device, int debugfs_fd,
>> int mode)
>>                          debug_val = "0x1";
>>                  }
>>   
>> -               ret = psr_write(debugfs_fd, debug_val);
>> +               ret = psr_write(debugfs_fd, debug_val, output);
>>                  igt_require_f(ret > 0, "PSR2 SF feature not
>> available\n");
>>          }
>>   
>> @@ -193,15 +200,15 @@ static bool psr_set(int device, int debugfs_fd,
>> int mode)
>>          return ret;
>>   }
>>   
>> -bool psr_enable(int device, int debugfs_fd, enum psr_mode mode)
>> +bool psr_enable(int device, int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output)
>>   {
>> -       return psr_set(device, debugfs_fd, mode);
>> +       return psr_set(device, debugfs_fd, mode, output);
>>   }
>>   
>> -bool psr_disable(int device, int debugfs_fd)
>> +bool psr_disable(int device, int debugfs_fd, igt_output_t *output)
>>   {
>>          /* Any mode different than PSR_MODE_1/2 will disable PSR */
>> -       return psr_set(device, debugfs_fd, -1);
>> +       return psr_set(device, debugfs_fd, -1, output);
>>   }
>>   
>>   bool psr_sink_support(int device, int debugfs_fd, enum psr_mode
>> mode, igt_output_t *output)
>> @@ -211,11 +218,7 @@ bool psr_sink_support(int device, int
>> debugfs_fd, enum psr_mode mode, igt_output
>>          char buf[PSR_STATUS_MAX_LEN];
>>          int ret;
>>   
>> -       if (output)
>> -               sprintf(debugfs_file, "%s/i915_psr_status", output-
>>> name);
>> -       else
>> -               sprintf(debugfs_file, "%s", "i915_edp_psr_status");
>> -
>> +       SET_DEBUGFS_PATH(output, debugfs_file);
>>          ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>>                                        sizeof(buf));
>>          if (ret < 1)
>> @@ -305,7 +308,7 @@ void psr_print_debugfs(int debugfs_fd)
>>          igt_info("%s", buf);
>>   }
>>   
>> -bool i915_psr2_selective_fetch_check(int drm_fd)
>> +bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
>> *output)
>>   {
>>          int debugfs_fd;
>>          bool ret;
>> @@ -314,7 +317,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd)
>>                  return false;
>>   
>>          debugfs_fd = igt_debugfs_dir(drm_fd);
>> -       ret = psr2_selective_fetch_check(debugfs_fd);
>> +       ret = psr2_selective_fetch_check(debugfs_fd, output);
>>          close(debugfs_fd);
>>   
>>          return ret;
>> @@ -331,7 +334,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd)
>>    * Returns:
>>    * True if PSR mode changed to PSR1, false otherwise.
>>    */
>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
>> +bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output)
>>   {
>>          int debugfs_fd;
>>          bool ret = false;
>> @@ -340,8 +343,8 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
>>                  return ret;
>>   
>>          debugfs_fd = igt_debugfs_dir(drm_fd);
>> -       if (psr2_selective_fetch_check(debugfs_fd)) {
>> -               psr_set(drm_fd, debugfs_fd, PSR_MODE_1);
>> +       if (psr2_selective_fetch_check(debugfs_fd, output)) {
>> +               psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
>>                  ret = true;
>>          }
>>   
>> @@ -355,12 +358,12 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
>>    * Restore PSR2 selective fetch after tests were executed, this
>> function should
>>    * only be called if i915_psr2_sel_fetch_to_psr1() returned true.
>>    */
>> -void i915_psr2_sel_fetch_restore(int drm_fd)
>> +void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output)
>>   {
>>          int debugfs_fd;
>>   
>>          debugfs_fd = igt_debugfs_dir(drm_fd);
>> -       psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH);
>> +       psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH, output);
>>          close(debugfs_fd);
>>   }
>>   
>> @@ -369,16 +372,17 @@ void i915_psr2_sel_fetch_restore(int drm_fd)
>>    *
>>    * Return the current PSR mode.
>>    */
>> -enum psr_mode psr_get_mode(int debugfs_fd)
>> +enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
>>   {
>>          char buf[PSR_STATUS_MAX_LEN];
>> +       char debugfs_file[128] = {0};
>>          int ret;
>>   
>> -
>> -       ret = igt_debugfs_simple_read(debugfs_fd,
>> "i915_edp_psr_status", buf,
>> +       SET_DEBUGFS_PATH(output, debugfs_file);
>> +       ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>>                                        sizeof(buf));
>>          if (ret < 0) {
>> -               igt_info("Could not read i915_edp_psr_status: %s\n",
>> +               igt_info("Could not read psr status: %s\n",
>>                           strerror(-ret));
>>                  return PSR_DISABLED;
>>          }
>> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
>> index 82a4e8c5e..372bef2b2 100644
>> --- a/lib/igt_psr.h
>> +++ b/lib/igt_psr.h
>> @@ -46,21 +46,21 @@ enum fbc_mode {
>>   };
>>   
>>   bool psr_disabled_check(int debugfs_fd);
>> -bool psr2_selective_fetch_check(int debugfs_fd);
>> +bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t
>> *output);
>>   bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t
>> *output);
>>   bool psr_wait_update(int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output);
>>   bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output);
>> -bool psr_enable(int device, int debugfs_fd, enum psr_mode);
>> -bool psr_disable(int device, int debugfs_fd);
>> +bool psr_enable(int device, int debugfs_fd, enum psr_mode,
>> igt_output_t *output);
>> +bool psr_disable(int device, int debugfs_fd, igt_output_t *output);
>>   bool psr_sink_support(int device, int debugfs_fd, enum psr_mode
>> mode, igt_output_t *output);
>>   bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
>>   void psr_print_debugfs(int debugfs_fd);
>> -enum psr_mode psr_get_mode(int debugfs_fd);
>> +enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output);
>>   
>> -bool i915_psr2_selective_fetch_check(int drm_fd);
>> +bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
>> *output);
>>   
>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
>> -void i915_psr2_sel_fetch_restore(int drm_fd);
>> +bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output);
>> +void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output);
>>   bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
>>   
>>   #endif
>> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
>> index 26b82e50a..c2411c824 100644
>> --- a/tests/intel/kms_dirtyfb.c
>> +++ b/tests/intel/kms_dirtyfb.c
>> @@ -127,7 +127,7 @@ static void enable_feature(data_t *data)
>>                  intel_fbc_enable(data->drm_fd);
>>                  break;
>>          case FEATURE_PSR:
>> -               psr_enable(data->drm_fd, data->debugfs_fd,
>> PSR_MODE_1);
>> +               psr_enable(data->drm_fd, data->debugfs_fd,
>> PSR_MODE_1, NULL);
>>                  break;
>>          case FEATURE_DRRS:
>>                  intel_drrs_enable(data->drm_fd, data->pipe);
>> @@ -167,7 +167,7 @@ static void check_feature(data_t *data)
>>   static void disable_features(data_t *data)
>>   {
>>          intel_fbc_disable(data->drm_fd);
>> -       psr_disable(data->drm_fd, data->debugfs_fd);
>> +       psr_disable(data->drm_fd, data->debugfs_fd, NULL);
>>          intel_drrs_disable(data->drm_fd, data->pipe);
>>   }
>>   
>> diff --git a/tests/intel/kms_fbcon_fbt.c
>> b/tests/intel/kms_fbcon_fbt.c
>> index 90484dccf..71e42f19c 100644
>> --- a/tests/intel/kms_fbcon_fbt.c
>> +++ b/tests/intel/kms_fbcon_fbt.c
>> @@ -277,7 +277,7 @@ static void disable_features(int device, int
>> debugfs_fd)
>>   {
>>          igt_set_module_param_int(device, "enable_fbc", 0);
>>          if (psr_sink_support(device, debugfs_fd, PSR_MODE_1, NULL))
>> -               psr_disable(device, debugfs_fd);
>> +               psr_disable(device, debugfs_fd, NULL);
>>   }
>>   
>>   static inline void fbc_modparam_enable(int device, int debugfs_fd)
>> @@ -287,7 +287,7 @@ static inline void fbc_modparam_enable(int
>> device, int debugfs_fd)
>>   
>>   static inline void psr_debugfs_enable(int device, int debugfs_fd)
>>   {
>> -       psr_enable(device, debugfs_fd, PSR_MODE_1);
>> +       psr_enable(device, debugfs_fd, PSR_MODE_1, NULL);
>>   }
>>   
>>   static void fbc_skips_on_fbcon(int debugfs_fd)
>> diff --git a/tests/intel/kms_frontbuffer_tracking.c
>> b/tests/intel/kms_frontbuffer_tracking.c
>> index 912cca3f8..023843161 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -2234,7 +2234,7 @@ static bool disable_features(const struct
>> test_mode *t)
>>          intel_fbc_disable(drm.fd);
>>          intel_drrs_disable(drm.fd, prim_mode_params.pipe);
>>   
>> -       return psr.can_test ? psr_disable(drm.fd, drm.debugfs) :
>> false;
>> +       return psr.can_test ? psr_disable(drm.fd, drm.debugfs, NULL)
>> : false;
>>   }
>>   
>>   static void *busy_thread_func(void *data)
>> @@ -2867,7 +2867,7 @@ static bool enable_features_for_test(const
>> struct test_mode *t)
>>          if (t->feature & FEATURE_FBC)
>>                  intel_fbc_enable(drm.fd);
>>          if (t->feature & FEATURE_PSR)
>> -               ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
>> +               ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1,
>> NULL);
>>          if (t->feature & FEATURE_DRRS)
>>                  intel_drrs_enable(drm.fd, prim_mode_params.pipe);
>>   
>> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
>> index 0d5824e67..7deebf83d 100644
>> --- a/tests/intel/kms_pm_dc.c
>> +++ b/tests/intel/kms_pm_dc.c
>> @@ -362,7 +362,7 @@ static void require_dc_counter(int debugfs_fd,
>> int dc_flag)
>>   static void setup_dc3co(data_t *data)
>>   {
>>          data->op_psr_mode = PSR_MODE_2;
>> -       psr_enable(data->drm_fd, data->debugfs_fd, data-
>>> op_psr_mode);
>> +       psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode,
>> NULL);
>>          igt_require_f(psr_wait_entry(data->debugfs_fd, data-
>>> op_psr_mode, NULL),
>>                        "PSR2 is not enabled\n");
>>   }
>> @@ -665,7 +665,7 @@ igt_main
>>                  igt_require(psr_sink_support(data.drm_fd,
>> data.debugfs_fd,
>>                                               PSR_MODE_1, NULL));
>>                  data.op_psr_mode = PSR_MODE_1;
>> -               psr_enable(data.drm_fd, data.debugfs_fd,
>> data.op_psr_mode);
>> +               psr_enable(data.drm_fd, data.debugfs_fd,
>> data.op_psr_mode, NULL);
>>                  test_dc_state_psr(&data, CHECK_DC5);
>>          }
>>   
>> @@ -675,7 +675,7 @@ igt_main
>>                  igt_require(psr_sink_support(data.drm_fd,
>> data.debugfs_fd,
>>                                               PSR_MODE_1, NULL));
>>                  data.op_psr_mode = PSR_MODE_1;
>> -               psr_enable(data.drm_fd, data.debugfs_fd,
>> data.op_psr_mode);
>> +               psr_enable(data.drm_fd, data.debugfs_fd,
>> data.op_psr_mode, NULL);
>>                  igt_require_f(igt_pm_pc8_plus_residencies_enabled(dat
>> a.msr_fd),
>>                                "PC8+ residencies not supported\n");
>>                  if (intel_display_ver(data.devid) >= 14)
>> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
>> index 521d4c708..3822b3081 100644
>> --- a/tests/intel/kms_psr.c
>> +++ b/tests/intel/kms_psr.c
>> @@ -519,7 +519,7 @@ static bool psr_enable_if_enabled(data_t *data)
>>                  igt_skip("enable_psr modparam doesn't allow psr mode
>> %d\n",
>>                           data->op_psr_mode);
>>   
>> -       return psr_enable(data->drm_fd, data->debugfs_fd, data-
>>> op_psr_mode);
>> +       return psr_enable(data->drm_fd, data->debugfs_fd, data-
>>> op_psr_mode, data->output);
>>   }
>>   
>>   static inline void manual(const char *expected)
>> @@ -658,6 +658,7 @@ static void test_cleanup(data_t *data)
>>   
>>          igt_remove_fb(data->drm_fd, &data->fb_green);
>>          igt_remove_fb(data->drm_fd, &data->fb_white);
>> +       psr_disable(data->drm_fd, data->debugfs_fd, data->output);
>>   }
>>   
>>   static void setup_test_plane(data_t *data, int test_plane)
>> @@ -976,7 +977,6 @@ igt_main
>>          }
>>   
>>          igt_fixture {
>> -               psr_disable(data.drm_fd, data.debugfs_fd);
>>                  close(data.debugfs_fd);
>>                  buf_ops_destroy(data.bops);
>> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
>> index ecf9ad77f..8e6a9e02c 100644
>> --- a/tests/intel/kms_psr2_sf.c
>> +++ b/tests/intel/kms_psr2_sf.c
>> @@ -1012,11 +1012,6 @@ igt_main
>>                          data.fbc_flag = true;
>>                  }
>>   
>> -               /* Test if PSR2 can be enabled */
>> -               igt_require_f(psr_enable(data.drm_fd,
>> -                                        data.debugfs_fd,
>> PSR_MODE_2_SEL_FETCH),
>> -                             "Error enabling PSR2\n");
>> -
> I started to think it might actually not make sense to remove this.
> Currently kms_psr2_sf is skipped if psr debugfs interface doesn't
> exist. I.e. PSR is not supported by the platform. This is with
> reasonable info "PSR not available". After your change it will assert
> below as debugfs entry can't be opened.
>
> BR,
>
> Jouni Högander


Thanks for catching this,
How about having a check before looping on all output to check if we 
have psr_debug interface present?

Thanks and Regards
Kunal Joshi

>>                  data.damage_area_count = MAX_DAMAGE_AREAS;
>>                  data.primary_format = DRM_FORMAT_XRGB8888;
>>   
>> @@ -1026,9 +1021,6 @@ igt_main
>>                  igt_info("Big framebuffer size %dx%d\n",
>>                           data.big_fb_width, data.big_fb_height);
>>   
>> -
>>                 igt_require_f(psr2_selective_fetch_check(data.debugfs_f
>> d),
>> -                             "PSR2 selective fetch not enabled\n");
>> -
>>                  for_each_pipe_with_valid_output(&data.display,
>> data.pipe, data.output) {
>>                          coexist_features[n_pipes] = 0;
>>                          if (check_psr2_support(&data)) {
>> diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
>> index 936b5beb3..437ee36f6 100644
>> --- a/tests/intel/kms_psr2_su.c
>> +++ b/tests/intel/kms_psr2_su.c
>> @@ -338,7 +338,7 @@ igt_main
>>   
>>                  /* Test if PSR2 can be enabled */
>>                  igt_require_f(psr_enable(data.drm_fd,
>> -                                        data.debugfs_fd,
>> PSR_MODE_2),
>> +                                        data.debugfs_fd, PSR_MODE_2,
>> NULL),
>>                                "Error enabling PSR2\n");
>>                  data.op = FRONTBUFFER;
>>                  data.format = DRM_FORMAT_XRGB8888;
>> diff --git a/tests/intel/kms_psr_stress_test.c
>> b/tests/intel/kms_psr_stress_test.c
>> index 7aea8e8a5..bca3bd513 100644
>> --- a/tests/intel/kms_psr_stress_test.c
>> +++ b/tests/intel/kms_psr_stress_test.c
>> @@ -230,7 +230,7 @@ static void prepare(data_t *data)
>>          r = timerfd_settime(data->completed_timerfd, 0, &interval,
>> NULL);
>>          igt_require_f(r != -1, "Error setting completed_timerfd\n");
>>   
>> -       data->initial_state = psr_get_mode(data->debugfs_fd);
>> +       data->initial_state = psr_get_mode(data->debugfs_fd, NULL);
>>          igt_require(data->initial_state != PSR_DISABLED);
>>          igt_require(psr_wait_entry(data->debugfs_fd, data-
>>> initial_state, NULL));
>>   }
>> @@ -343,7 +343,7 @@ static void run(data_t *data)
>>          }
>>   
>>          /* Check if after all this stress the PSR is still in the
>> same state */
>> -       igt_assert(psr_get_mode(data->debugfs_fd) == data-
>>> initial_state);
>> +       igt_assert(psr_get_mode(data->debugfs_fd, NULL) == data-
>>> initial_state);
>>   }
>>   
>>   igt_main
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index a0349fa03..2895168f7 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -391,7 +391,7 @@ static void test_cursor(data_t *data)
>>           * necessary, causing the async flip to fail because async
>> flip is not
>>           * supported in cursor plane.
>>           */
>> -       igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd),
>> +       igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd,
>> NULL),
>>                        "PSR2 sel fetch causes cursor to be added to
>> primary plane " \
>>                        "pages flips and async flip is not supported in
>> cursor\n");
>>   
>> @@ -704,7 +704,7 @@ igt_main
>>                   * necessary, causing the async flip to fail because
>> async flip is not
>>                   * supported in cursor plane.
>>                   */
>> -
>>                 igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_
>> fd),
>> +               igt_skip_on_f(i915_psr2_selective_fetch_check(data.dr
>> m_fd, NULL),
>>                                "PSR2 sel fetch causes cursor to be
>> added to primary plane " \
>>                                "pages flips and async flip is not
>> supported in cursor\n");
>>   
>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>> index 0017659d4..a430f735a 100644
>> --- a/tests/kms_cursor_legacy.c
>> +++ b/tests/kms_cursor_legacy.c
>> @@ -1849,7 +1849,7 @@ igt_main
>>                   * page flip with cursor legacy APIS when Intel's
>> PSR2 selective
>>                   * fetch is enabled, so switching PSR1 for this whole
>> test.
>>                   */
>> -               intel_psr2_restore =
>> i915_psr2_sel_fetch_to_psr1(display.drm_fd);
>> +               intel_psr2_restore =
>> i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
>>          }
>>   
>>          igt_describe("Test checks how many cursor updates we can fit
>> between vblanks "
>> @@ -2074,7 +2074,7 @@ igt_main
>>   
>>          igt_fixture {
>>                  if (intel_psr2_restore)
>> -                       i915_psr2_sel_fetch_restore(display.drm_fd);
>> +                       i915_psr2_sel_fetch_restore(display.drm_fd,
>> NULL);
>>                  igt_display_fini(&display);
>>                  drm_close_driver(display.drm_fd);
>>          }
