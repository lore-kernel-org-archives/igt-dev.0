Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B30CC4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 13:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBC21125F4;
	Wed,  7 Feb 2024 13:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FeREuj2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA2111326D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707313792; x=1738849792;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=jkpqoTfMgSJI6iM8q5FA6nl5JDcWJHKNICcyfugfHDQ=;
 b=FeREuj2kMdHMzrkGZ5mYU4Cs6ggJZiwDRVfvMQdwMwmxKK/2GO5oBFiA
 a4izWv6avw9rPVJ++4KzEloOCJRh0syB57uUjWJ5QHTPPeu685redUH1a
 vnSgXo6yKV2y1yiOUG/7oAwcaUeAiWABr4SSQaZm0Jfd1edldiDl2v061
 pZHGMadho/ob/7zbNWOGjMqKR3Kn+hoVpDx5fUy/VMIfHeoj+L28NhmMf
 kFbDXoyfMsPFAzpq1kXwi0RlOJAy2AdITe0aNJO0gnOmhha2tzmErg69X
 xfgBQsrYybcmZRvA5OPwj+osI6pn6nVdHNKL54jW406tuHYX5/hz3DKof A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11632788"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208,217";a="11632788"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 05:49:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208,217";a="1368476"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 05:49:51 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 05:49:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 05:49:49 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 05:49:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 05:49:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n16Ouu8jGEwozhgTHr744sSTzGzsEcilKVdJF/eqoxRK80B3S3B6Iykop86xzMoSCb9d4LY0s0qw02O4Freq14+4ArdYGhKuLegi4F8smJb3N44yfCqqKgwGpg9BIDiVWCyWFiER1Vxy+YlGwUFDeqBSy4u2ATavz/ENYuz68HLd6N5EWStzzjgtpK5XmQsxaL4gQoEixolm5zubZIQL45Tdr7vbvUAlGE8xFKnA8VMLGNUFpc+w6spUnD22uxgtk9m79xbzoz4wDNeN5EB2eOkLL5h3+M0FMi7lDpVBdh1uw1wAg01URvhM+VRAgNGpPnsyC7KdSkjIY2f5hyNvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6/PfDB0yxbg24ztZta0cvKBnWc4e8pBQa/lFqBYTNs=;
 b=nBGBz3Nn+QiDi4AU9tiZv7KKq5ogt3Jz2yRwmr50hPL7g6EBhy5wABJFs42ci7Or7+tuAGSsrDkFrx1foYlWs0Kf7Gk1vkV4jozD32EheCizaZDcugEKuNhDrbRT1b3P9fs2dlvxTrKaoegG36qQSIUxR8X2L0m9r/29TSuUauGPj3V4uA63SzO24ktCWG3K3iZQQW3vT6sQU3Xv5M/mIfr1Bbp3cj4aHISdXk+rXjBkDkQLu1dYOjaYuxHqAgpq7B/g4MKCfX69pAPN+CL/11cXhNA9P9ibuNQ2X39n137k9eNnhZ+VlZH6ufKE71RB0jTjyusGyfy16ByLZZdRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by MW6PR11MB8437.namprd11.prod.outlook.com (2603:10b6:303:249::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Wed, 7 Feb
 2024 13:49:47 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7249.038; Wed, 7 Feb 2024
 13:49:47 +0000
Content-Type: multipart/alternative;
 boundary="------------U9fgwaTsPr0Nj8KVGgM2bBpy"
Message-ID: <47184213-3590-4208-97a1-4ea17b22ddba@intel.com>
Date: Wed, 7 Feb 2024 19:19:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_psr.c: add support for panel replay sf
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
References: <20240122074914.1161997-1-kunal1.joshi@intel.com>
 <20240122074914.1161997-2-kunal1.joshi@intel.com>
 <c714df322b6063e6f59051e97a0cc9fa2c9ca4b9.camel@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <c714df322b6063e6f59051e97a0cc9fa2c9ca4b9.camel@intel.com>
X-ClientProxiedBy: PN2PR01CA0246.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::16) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|MW6PR11MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d41c98b-6f8d-48f0-9d4a-08dc27e3a55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1v/Kt9Y1M6KvBEvx0wEF/kmKUnn6Z8Xp0ZnyryU2Rlv/ubA5ZxdJkPOdRVQBiXya1B6Oz1eLw7U+4pBgTfysUyMbvCV7o6CqeyxovVnUrc3MCsFw/yW6p0RoBSZZrV2IncDEhzbmEIuIgEBJ2AS+48+rbEzBOXJEXGX/G38CVY48dlWGnzuEl4ie8VVIUSNdxotiRRy3G6CnEEPpsWjGR2aj2B8M/eoId4+8+Srh+89oOu/8B88/49gbyz9WjART/p1HVboJ9BbOdQwwbKXc9AR1t6guCBZNV3odAYoktCoBCcBflT6cl2//NNPiOf58v14r5DNqV8McAd01oLTjM8WohhooGXLBt6ywTvCfeQCfjF63cNOUmjpFBGBQliD0VXtbXtAhSaRaK+GPrE9O7YjY8anaX20ohEeYf9AJ5mdIyy55L2KJCf+/CMJNG69x2mJmgADrRaN/qcDWBudf++AtkfCL6YeneYi2AbZsrkDOkkEPALuM4uoo+CqJPcNEKAHz1UdsEfa72TmH1N/mt4+9Hxhmz0PwKl/iIBxa0kPdKHDgSiDwnBe40jnl054biV6DDwXoVMVOoSbAMOpjAeyCyoGVqKKqrxtwXLSOV83MSTi8pvqZJXiyvY/W1fRD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(38100700002)(83380400001)(8936002)(166002)(82960400001)(8676002)(4326008)(54906003)(66946007)(66556008)(66476007)(110136005)(316002)(5660300002)(2906002)(30864003)(2616005)(6512007)(107886003)(26005)(66574015)(6486002)(966005)(6666004)(53546011)(6506007)(33964004)(478600001)(86362001)(31696002)(36756003)(31686004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXVhckw5ODRRZW95N2l0QUpmZnVNM0k4UVlUcWdhSGcxaHZYT3JFaDh6YlBP?=
 =?utf-8?B?akIvM2Q5RmZudDJGV0pMOG0raTAzbjR5VVJoOHBCaGpSV0J1dzRhY0NyNTUx?=
 =?utf-8?B?Z2Q1ZVpwMFovcXg0VnB4MzQ3OVhrQUQzNDNSTi9lcGhGRElUc0ZtUnZlbkxq?=
 =?utf-8?B?aVNLSk56L2plNE14dlZ2dzdWQnlDdW1YV2FJeTVJMnJ6c1NSaFQ5STRlazNs?=
 =?utf-8?B?ZGwzSmROVDZtNW4zM1d4ZUQvMlFvSW4wdlozTlZFN2c1Z1d2dnkrV0N1QXdx?=
 =?utf-8?B?MU16QUk1eVZ2ekNOc09BRi93SjlEak0rWWlXRXgvSnM2c2wxMitRaWVocms1?=
 =?utf-8?B?UzZPZU1jNXVoTUZTcCtONE1SRldJTXFad0JkeGk4YkdpMFdHcU1rZGhNaEI4?=
 =?utf-8?B?d2R4V2JLbUhYQ0tST2xWMjlrazFmMnlROXl0b2pkbGdHYXJnQkk0Wnl3TzZr?=
 =?utf-8?B?RTN2Q0phQzFGaG43Wm01eElSeHZndDMvc2U0SXZ2b3FGOFF2MTcrdTZ5M0N4?=
 =?utf-8?B?UXRMLzc3ZjA3cWFuNEtXMjJFYlpoc0p2aWpiZUxiU1hOVk9pZkxMQjFodktY?=
 =?utf-8?B?Y1JrUitYMGVmQXl4L0pkMGt0M3NaM3dRS0tLcUNBSThGZ3YrdnRzb0V0alJS?=
 =?utf-8?B?bXV2ZDFZdDJNcVAxUVQwUzhTVUkvQ0xEMXNiN2x6SFdQanRWYmlhWHlrT2dK?=
 =?utf-8?B?Ynd6YTl4TEVIVnpZdmUzTGJ2L3JUTHFSR1pweTlGUitNN214cWRwV3FOd2Qv?=
 =?utf-8?B?WlVCZTU2UkNRRXBia1lwcENqc1lGUHlQaXI1VVlqakhERUtTZXc4RWYwN2w2?=
 =?utf-8?B?eXpVT0JESExBY1dYZ1NSUEJBSTloN3VyS2ZCalFOOU5pelBSSEE2OXRFSUF0?=
 =?utf-8?B?ZUloWXllTzZLUlI2WW5IMzNhZS9uVVA0MWY0b05RNEMvWEU0ZDJRK2FnRGJJ?=
 =?utf-8?B?OGQ2bk9aeGF2VlpvZzdHTjZvYnpianh0T0tEY2dnUGJjeUR5YktDL2tZam9E?=
 =?utf-8?B?TlRjZnVTRElyS0s5Z3YvRVBNL1BLSTFWRzVmTzRIVUh1K29iaFNmbTFJRE9n?=
 =?utf-8?B?Sk9qNC9JV2Y5UHFiSjB1UFBsemRYWWh6Z2RwNHVEUmRzT2hiR0tuNmZZQk5l?=
 =?utf-8?B?N1dXTnNzaHNWWmlYd01mVU9OZ1ducEhGc2FZOGt1WHc0R0NMcmp2VzFsaUVp?=
 =?utf-8?B?TUh4NWRyT2JpbHQyVnprYWdjc3FFd3NiK1ZzRzhlYlh1aWkxMkNDbzBINDQ3?=
 =?utf-8?B?NU4weGY1OVhmaS9RUWtNRzJVcThZYzRNeXJQWk10Sm5sVzJyYmNNSkpydkJZ?=
 =?utf-8?B?YXhlMHFCMHZnUmhDRmZtVnJRS0pOckN2OUVsRE1nd1oxMnhsQ0JGNW5SRE5p?=
 =?utf-8?B?MG45TitvakpRYThSeHNLSzJZbEFhVkVRR0QrZ0NjQk92SmJPWTdqZTdvOENM?=
 =?utf-8?B?NzdwbGd1UlZSeS92Yko0MnFTakdEM0l5YWZvd2pjVHBpTVAvZVZpRytUcDdz?=
 =?utf-8?B?TUFvRFhOMUFnMUYxcGgvTGQ5SVdxOThVU3djbVhiQm1qVDdQTUEzT0JnRWV3?=
 =?utf-8?B?SEZ3SFo0NHNTUm9CR2ZmSGsxNHVWNnUxeWlLbG1xR1pRbnRPUDBMS21SRG9q?=
 =?utf-8?B?MmFyemFBTCsrekdqcWZWaWd2ejdZZkdUSUd5YkFuV1kvTjJ3Z0VhZSsxMmJo?=
 =?utf-8?B?d1RLcjMyZWFEbC9aSzc3ZThveFprMGxtQTBkK2tNRko0Z005c1VxdXZMb1R6?=
 =?utf-8?B?d3BaL3Vjdi82bmJJY3Q0MmxTM1l2M1ZtMnh0WStHTnV5ZThFcXg0eFhZWHlh?=
 =?utf-8?B?Z0RoL0pKVlJxUmEyMW5mZ0M3aVhxMzI5VkxLRWhKalRId0p2Y3NXdUlGeDcw?=
 =?utf-8?B?Tzd0WkhyT3hxWEljVDA0aGcvVU9mY0J3a1dOeURzQnJGZS9oa2F4TTh2dFV3?=
 =?utf-8?B?Qm91ZzRPZHNJSEl6SkZVQWllUWxLcXMzSGsxRy9nakgweUYyUnhFNUtwSlF4?=
 =?utf-8?B?ZzVZdzVCVktLL2tkR2x2M0Z4M0xubVlzS0tFd2VZdmVYQ0ZWVUlDb2FyaFEv?=
 =?utf-8?B?NzB3Sk4yMGlvWVZLM3M1SHZMT0ZTbkFlSDZOQlp4R0RUQmsyVlhTa2k5OXp4?=
 =?utf-8?Q?PF5rWF7VGOis9D+yS1qsMgcYP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d41c98b-6f8d-48f0-9d4a-08dc27e3a55a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 13:49:46.8889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v113Apm72Nvx8NF8AuUtyCIef76BAS2q3WYihLPWqeBH7F+VEKD9tYWrLSz2ZdXrK5HI3MvAXmFDpcGxpq5B2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
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

--------------U9fgwaTsPr0Nj8KVGgM2bBpy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hello Jouni,

On 2/5/2024 5:30 PM, Hogander, Jouni wrote:
> On Mon, 2024-01-22 at 13:19 +0530, Kunal Joshi wrote:
>> modify functions in igt_psr to extend support for validating
>> panel replay selective fetch.
>>
>> Cc: Jouni Högander<jouni.hogander@intel.com>
>> Cc: Animesh Manna<animesh.manna@intel.com>
>> Cc: Arun R Murthy<arun.r.murthy@intel.com>
>> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
>> ---
>>   lib/igt_psr.c             | 46 ++++++++++++++++++++++++++-----------
>> --
>>   lib/igt_psr.h             |  6 ++---
>>   tests/intel/kms_psr2_sf.c |  8 ++++---
>>   tests/kms_async_flips.c   |  4 ++--
>>   tests/kms_cursor_legacy.c |  2 +-
>>   5 files changed, 42 insertions(+), 24 deletions(-)
>>
>> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
>> index 663bac163..1123c8d98 100644
>> --- a/lib/igt_psr.c
>> +++ b/lib/igt_psr.c
>> @@ -37,14 +37,21 @@ bool psr_disabled_check(int debugfs_fd)
>>          return strstr(buf, "PSR mode: disabled\n");
>>   }
>>   
>> -bool psr2_selective_fetch_check(int debugfs_fd)
>> +enum psr_mode selective_fetch_check(int debugfs_fd, igt_output_t
>> *output)
>>   {
>> +       char debugfs_file[128] = {0};
>>          char buf[PSR_STATUS_MAX_LEN];
>>   
>> -       igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status",
>> buf,
>> -                               sizeof(buf));
>> +       if (output)
>> +               sprintf(debugfs_file, "%s/i915_psr_status", output-
>>> name);
>> +       else
>> +               sprintf(debugfs_file, "%s", "i915_edp_psr_status");
>>   
>> -       return strstr(buf, "PSR2 selective fetch: enabled");
>> +       igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>> +                                                       sizeof(buf));
>> +
>> +       return strstr(buf, "PSR2 selective fetch: enabled") ?
>> PSR_MODE_2_SEL_FETCH :
>> +                  strstr(buf, "Panel Replay Selective Update
>> Enabled") ? PR_MODE_SEL_FETCH : PSR_DISABLED;
> There is no need to change this function. "PSR2 selective fetch:
> enable" is valid check for both of the cases. we will have in Panel
> Replay case:
>
> PSR mode: Panel Replay Selective Update Enabled
> Source PSR/PanelReplay ctl: enabled [0xc2004a99]
> Source PSR/PanelReplay status: IDLE [0x04000000]
> Busy frontbuffer bits: 0x00000000
> Performance counter: 0
> Frame:	PSR2 SU blocks:
> 0	0
> 1	0
> 2	0
> 3	0
> 4	0
> 5	0
> 6	0
> 7	0
> PSR2 selective fetch: enabled
>
> See:
>
> https://patchwork.freedesktop.org/patch/575163/?series=128193&rev=3
>
> BR,
>
> Jouni Högander
Thanks for checking this out, have float new series addressing your 
review comments.
>>   }
>>   
>>   static bool psr_active_check(int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output)
>> @@ -246,6 +253,8 @@ bool psr_sink_support(int device, int debugfs_fd,
>> enum psr_mode mode, igt_output
>>                         (strstr(line, "[0x03]") || strstr(line,
>> "[0x04]")));
>>          case PR_MODE:
>>                  return strstr(line, "Panel Replay = yes");
>> +       case PR_MODE_SEL_FETCH:
>> +               return strstr(line, "Panel Replay = yes, Panel Replay
>> Selective Update = yes");
>>          default:
>>                  igt_assert_f(false, "Invalid psr mode\n");
>>                  return false;
>> @@ -305,7 +314,7 @@ void psr_print_debugfs(int debugfs_fd)
>>          igt_info("%s", buf);
>>   }
>>   
>> -bool i915_psr2_selective_fetch_check(int drm_fd)
>> +bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
>> *output)
>>   {
>>          int debugfs_fd;
>>          bool ret;
>> @@ -314,24 +323,24 @@ bool i915_psr2_selective_fetch_check(int
>> drm_fd)
>>                  return false;
>>   
>>          debugfs_fd = igt_debugfs_dir(drm_fd);
>> -       ret = psr2_selective_fetch_check(debugfs_fd);
>> +       ret = selective_fetch_check(debugfs_fd, output) !=
>> PSR_DISABLED;
>>          close(debugfs_fd);
>>   
>>          return ret;
>>   }
>>   
>> -/**
>> - * i915_psr2_sel_fetch_to_psr1
>> +/*
>> + * i915_pr_psr2_sel_fetch_to_pr_psr1
>>    *
>> - * Check if PSR2 selective fetch is enabled, if yes switch to PSR1
>> and returns
>> + * Check if PR/PSR2 selective fetch is enabled, if yes switch to
>> PR/PSR1 and returns
>>    * true otherwise returns false.
>> - * This function should be called from tests that are not compatible
>> with PSR2
>> - * selective fetch.
>>    *
>> + * @param drm_fd The file descriptor of the DRM device.
>> + * @param output The output for which the conversion is performed.
>>    * Returns:
>> - * True if PSR mode changed to PSR1, false otherwise.
>> + *     True if the conversion was successful, false otherwise.
>>    */
>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
>> +bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
>> *output)
>>   {
>>          int debugfs_fd;
>>          bool ret = false;
>> @@ -340,11 +349,18 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
>>                  return ret;
>>   
>>          debugfs_fd = igt_debugfs_dir(drm_fd);
>> -       if (psr2_selective_fetch_check(debugfs_fd)) {
>> +       switch (selective_fetch_check(debugfs_fd, output)) {
>> +       case PSR_MODE_2_SEL_FETCH:
>>                  psr_set(drm_fd, debugfs_fd, PSR_MODE_1);
>>                  ret = true;
>> +               break;
>> +       case PR_MODE_SEL_FETCH:
>> +               psr_set(drm_fd, debugfs_fd, PR_MODE);
>> +               ret = true;
>> +               break;
>> +       default:
>> +               ret = false;
>>          }
>> -
>>          close(debugfs_fd);
>>          return ret;
>>   }
>> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
>> index 36711c0d4..5dc70f23e 100644
>> --- a/lib/igt_psr.h
>> +++ b/lib/igt_psr.h
>> @@ -46,7 +46,7 @@ enum fbc_mode {
>>   };
>>   
>>   bool psr_disabled_check(int debugfs_fd);
>> -bool psr2_selective_fetch_check(int debugfs_fd);
>> +enum psr_mode selective_fetch_check(int debugfs_fd, igt_output_t
>> *output);
>>   bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t
>> *output);
>>   bool psr_wait_update(int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output);
>>   bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output);
>> @@ -57,9 +57,9 @@ bool psr2_wait_su(int debugfs_fd, uint16_t
>> *num_su_blocks);
>>   void psr_print_debugfs(int debugfs_fd);
>>   enum psr_mode psr_get_mode(int debugfs_fd);
>>   
>> -bool i915_psr2_selective_fetch_check(int drm_fd);
>> +bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
>> *output);
>>   
>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
>> +bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
>> *output);
>>   void i915_psr2_sel_fetch_restore(int drm_fd);
>>   
>>   #endif
>> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
>> index ecf9ad77f..c826cd7c3 100644
>> --- a/tests/intel/kms_psr2_sf.c
>> +++ b/tests/intel/kms_psr2_sf.c
>> @@ -994,6 +994,7 @@ igt_main
>>          int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
>>   
>>          igt_fixture {
>> +               bool pr_or_psr2_selective_fetch_supported = false;
>>                  drmModeResPtr res;
>>   
>>                  data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
>> DRIVER_XE);
>> @@ -1026,10 +1027,9 @@ igt_main
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
>> +                       pr_or_psr2_selective_fetch_supported |=
>> (selective_fetch_check(data.debugfs_fd,
>> +
>>                                      data.output) != PSR_DISABLED);
>>                          coexist_features[n_pipes] = 0;
>>                          if (check_psr2_support(&data)) {
>>                                  pipes[n_pipes] = data.pipe;
>> @@ -1041,6 +1041,8 @@ igt_main
>>                                  n_pipes++;
>>                          }
>>                  }
>> +               igt_require_f(pr_or_psr2_selective_fetch_supported,
>> +                                         "PR/PSR2 selective fetch
>> not supported\n");
>>          }
>>   
>>          for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index a0349fa03..0ab8ea429 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -391,7 +391,7 @@ static void test_cursor(data_t *data)
>>           * necessary, causing the async flip to fail because async
>> flip is not
>>           * supported in cursor plane.
>>           */
>> -       igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd),
>> +       igt_skip_on_f(i915_pr_psr2_sel_fetch_to_pr_psr1(data->drm_fd,
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
>> +               igt_skip_on_f(i915_pr_psr2_sel_fetch_to_pr_psr1(data.
>> drm_fd, NULL),
>>                                "PSR2 sel fetch causes cursor to be
>> added to primary plane " \
>>                                "pages flips and async flip is not
>> supported in cursor\n");
>>   
>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>> index 0017659d4..f453e2998 100644
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
>> i915_pr_psr2_sel_fetch_to_pr_psr1(display.drm_fd, NULL);
>>          }
>>   
>>          igt_describe("Test checks how many cursor updates we can fit
>> between vblanks "
Regards
Kunal Joshi
--------------U9fgwaTsPr0Nj8KVGgM2bBpy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello Jouni,<br>
    </p>
    <div class="moz-cite-prefix">On 2/5/2024 5:30 PM, Hogander, Jouni
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:c714df322b6063e6f59051e97a0cc9fa2c9ca4b9.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 2024-01-22 at 13:19 +0530, Kunal Joshi wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">modify functions in igt_psr to extend support for validating
panel replay selective fetch.

Cc: Jouni Högander <a class="moz-txt-link-rfc2396E" href="mailto:jouni.hogander@intel.com">&lt;jouni.hogander@intel.com&gt;</a>
Cc: Animesh Manna <a class="moz-txt-link-rfc2396E" href="mailto:animesh.manna@intel.com">&lt;animesh.manna@intel.com&gt;</a>
Cc: Arun R Murthy <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a>
Signed-off-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
---
&nbsp;lib/igt_psr.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 46 ++++++++++++++++++++++++++-----------
--
&nbsp;lib/igt_psr.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 6 ++---
&nbsp;tests/intel/kms_psr2_sf.c |&nbsp; 8 ++++---
&nbsp;tests/kms_async_flips.c&nbsp;&nbsp; |&nbsp; 4 ++--
&nbsp;tests/kms_cursor_legacy.c |&nbsp; 2 +-
&nbsp;5 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 663bac163..1123c8d98 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -37,14 +37,21 @@ bool psr_disabled_check(int debugfs_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return strstr(buf, &quot;PSR mode: disabled\n&quot;);
&nbsp;}
&nbsp;
-bool psr2_selective_fetch_check(int debugfs_fd)
+enum psr_mode selective_fetch_check(int debugfs_fd, igt_output_t
*output)
&nbsp;{
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char debugfs_file[128] = {0};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char buf[PSR_STATUS_MAX_LEN];
&nbsp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_debugfs_simple_read(debugfs_fd, &quot;i915_edp_psr_status&quot;,
buf,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sizeof(buf));
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (output)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s/i915_psr_status&quot;, output-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">name);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sprintf(debugfs_file, &quot;%s&quot;, &quot;i915_edp_psr_status&quot;);
&nbsp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return strstr(buf, &quot;PSR2 selective fetch: enabled&quot;);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sizeof(buf));
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return strstr(buf, &quot;PSR2 selective fetch: enabled&quot;) ?
PSR_MODE_2_SEL_FETCH :
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strstr(buf, &quot;Panel Replay Selective Update
Enabled&quot;) ? PR_MODE_SEL_FETCH : PSR_DISABLED;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There is no need to change this function. &quot;PSR2 selective fetch:
enable&quot; is valid check for both of the cases. we will have in Panel
Replay case:

PSR mode: Panel Replay Selective Update Enabled
Source PSR/PanelReplay ctl: enabled [0xc2004a99]
Source PSR/PanelReplay status: IDLE [0x04000000]
Busy frontbuffer bits: 0x00000000
Performance counter: 0
Frame:	PSR2 SU blocks:
0	0
1	0
2	0
3	0
4	0
5	0
6	0
7	0
PSR2 selective fetch: enabled

See:

<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/575163/?series=128193&amp;rev=3">https://patchwork.freedesktop.org/patch/575163/?series=128193&amp;rev=3</a>

BR,

Jouni Högander
</pre>
    </blockquote>
    Thanks for checking this out, have float new series addressing your
    review comments.<br>
    <blockquote type="cite" cite="mid:c714df322b6063e6f59051e97a0cc9fa2c9ca4b9.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">&nbsp;}
&nbsp;
&nbsp;static bool psr_active_check(int debugfs_fd, enum psr_mode mode,
igt_output_t *output)
@@ -246,6 +253,8 @@ bool psr_sink_support(int device, int debugfs_fd,
enum psr_mode mode, igt_output
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (strstr(line, &quot;[0x03]&quot;) || strstr(line,
&quot;[0x04]&quot;)));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case PR_MODE:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return strstr(line, &quot;Panel Replay = yes&quot;);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case PR_MODE_SEL_FETCH:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return strstr(line, &quot;Panel Replay = yes, Panel Replay
Selective Update = yes&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;default:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_assert_f(false, &quot;Invalid psr mode\n&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return false;
@@ -305,7 +314,7 @@ void psr_print_debugfs(int debugfs_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_info(&quot;%s&quot;, buf);
&nbsp;}
&nbsp;
-bool i915_psr2_selective_fetch_check(int drm_fd)
+bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
*output)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int debugfs_fd;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool ret;
@@ -314,24 +323,24 @@ bool i915_psr2_selective_fetch_check(int
drm_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return false;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;debugfs_fd = igt_debugfs_dir(drm_fd);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = psr2_selective_fetch_check(debugfs_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = selective_fetch_check(debugfs_fd, output) !=
PSR_DISABLED;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;close(debugfs_fd);
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ret;
&nbsp;}
&nbsp;
-/**
- * i915_psr2_sel_fetch_to_psr1
+/*
+ * i915_pr_psr2_sel_fetch_to_pr_psr1
&nbsp; *
- * Check if PSR2 selective fetch is enabled, if yes switch to PSR1
and returns
+ * Check if PR/PSR2 selective fetch is enabled, if yes switch to
PR/PSR1 and returns
&nbsp; * true otherwise returns false.
- * This function should be called from tests that are not compatible
with PSR2
- * selective fetch.
&nbsp; *
+ * @param drm_fd The file descriptor of the DRM device.
+ * @param output The output for which the conversion is performed.
&nbsp; * Returns:
- * True if PSR mode changed to PSR1, false otherwise.
+ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;True if the conversion was successful, false otherwise.
&nbsp; */
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
*output)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int debugfs_fd;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool ret = false;
@@ -340,11 +349,18 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ret;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;debugfs_fd = igt_debugfs_dir(drm_fd);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (psr2_selective_fetch_check(debugfs_fd)) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;switch (selective_fetch_check(debugfs_fd, output)) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case PSR_MODE_2_SEL_FETCH:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PSR_MODE_1);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = true;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case PR_MODE_SEL_FETCH:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;psr_set(drm_fd, debugfs_fd, PR_MODE);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = true;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;default:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret = false;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;close(debugfs_fd);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ret;
&nbsp;}
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 36711c0d4..5dc70f23e 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -46,7 +46,7 @@ enum fbc_mode {
&nbsp;};
&nbsp;
&nbsp;bool psr_disabled_check(int debugfs_fd);
-bool psr2_selective_fetch_check(int debugfs_fd);
+enum psr_mode selective_fetch_check(int debugfs_fd, igt_output_t
*output);
&nbsp;bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t
*output);
&nbsp;bool psr_wait_update(int debugfs_fd, enum psr_mode mode,
igt_output_t *output);
&nbsp;bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode,
igt_output_t *output);
@@ -57,9 +57,9 @@ bool psr2_wait_su(int debugfs_fd, uint16_t
*num_su_blocks);
&nbsp;void psr_print_debugfs(int debugfs_fd);
&nbsp;enum psr_mode psr_get_mode(int debugfs_fd);
&nbsp;
-bool i915_psr2_selective_fetch_check(int drm_fd);
+bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
*output);
&nbsp;
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
*output);
&nbsp;void i915_psr2_sel_fetch_restore(int drm_fd);
&nbsp;
&nbsp;#endif
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index ecf9ad77f..c826cd7c3 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -994,6 +994,7 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_fixture {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool pr_or_psr2_selective_fetch_supported = false;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drmModeResPtr res;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
DRIVER_XE);
@@ -1026,10 +1027,9 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_info(&quot;Big framebuffer size %dx%d\n&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.big_fb_width, data.big_fb_height);
&nbsp;
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(psr2_selective_fetch_check(data.debugfs_f
d),
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR2 selective fetch not enabled\n&quot;);
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for_each_pipe_with_valid_output(&amp;data.display,
data.pipe, data.output) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pr_or_psr2_selective_fetch_supported |=
(selective_fetch_check(data.debugfs_fd,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.output) != PSR_DISABLED);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;coexist_features[n_pipes] = 0;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (check_psr2_support(&amp;data)) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pipes[n_pipes] = data.pipe;
@@ -1041,6 +1041,8 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;n_pipes++;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_require_f(pr_or_psr2_selective_fetch_supported,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PR/PSR2 selective fetch
not supported\n&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for (y = 0; y &lt; ARRAY_SIZE(fbc_status); y++) {
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a0349fa03..0ab8ea429 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -391,7 +391,7 @@ static void test_cursor(data_t *data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * necessary, causing the async flip to fail because async
flip is not
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * supported in cursor plane.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_psr2_selective_fetch_check(data-&gt;drm_fd),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_pr_psr2_sel_fetch_to_pr_psr1(data-&gt;drm_fd,
NULL),
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR2 sel fetch causes cursor to be added to
primary plane &quot; \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pages flips and async flip is not supported in
cursor\n&quot;);
&nbsp;
@@ -704,7 +704,7 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * necessary, causing the async flip to fail because
async flip is not
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * supported in cursor plane.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_
fd),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_skip_on_f(i915_pr_psr2_sel_fetch_to_pr_psr1(data.
drm_fd, NULL),
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR2 sel fetch causes cursor to be
added to primary plane &quot; \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pages flips and async flip is not
supported in cursor\n&quot;);
&nbsp;
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 0017659d4..f453e2998 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1849,7 +1849,7 @@ igt_main
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * page flip with cursor legacy APIS when Intel's
PSR2 selective
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * fetch is enabled, so switching PSR1 for this whole
test.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_psr2_restore =
i915_psr2_sel_fetch_to_psr1(display.drm_fd);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_psr2_restore =
i915_pr_psr2_sel_fetch_to_pr_psr1(display.drm_fd, NULL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;igt_describe(&quot;Test checks how many cursor updates we can fit
between vblanks &quot;
</pre>
      </blockquote>
    </blockquote>
    Regards<br>
    Kunal Joshi<span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------U9fgwaTsPr0Nj8KVGgM2bBpy--
