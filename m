Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE588C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 18:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CB510E751;
	Wed, 27 Mar 2024 18:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIK0fqdO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56F410E751
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711563918; x=1743099918;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UKO9oHXrkIsbWG4fgS1CM7qYlIq2/9jMWizT55U4p8w=;
 b=AIK0fqdOCnkryYz5d0OL6OZAaoYmTVbwtXfn9XfajcH2ahqV3QpAj1YT
 dW8QSe4slJm2QFtMQQhosCEAsqOwYvpsf6EOIDclizz9+HUU24xWTYMBW
 1A36ANCq+asbt60zsl05XtgX454wU2vcQ5vPE/5gkxEHLt5vD2GrWh9pW
 biVrXR3zU11nXwh6MEC/iuuA7Pm9VJGLyKJFm2We7vOMVPjCh73tmYE9p
 kdD2GqEocvvD20LdD+Zjf3tpPSUZzy6FUB59yXAeMDwLs1k68xQC4CpoG
 zYljfyJ90WgDApD0ftaShKTxD7l6ina9cbRUWLhRF2dE6bN4n9EHKh0Gc A==;
X-CSE-ConnectionGUID: 16nz/IAiRNCra0d+6FtCNA==
X-CSE-MsgGUID: jhtRDeq/Q7anbfHp7E+azg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10471322"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="10471322"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="53857895"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 11:25:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 11:25:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 11:25:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 11:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APiZryCSHmhX1BYQKVqvVGYvCLq9fYdu8Rd0os//mzwYReqRm8tS1L2B+xzy69bS9uYUoIHnAtq3clc/xXh4H0/L8WYT8QxK3KZYXmuY2cEOhWor1zjnuKrerPl3cC6PqFWs6F3y2r7Xw8cKsGd7ge1aCF398JTOvcrpjw3mzH/5McFKWW7NY/7SYnMCvMrvDqsFxv1exqADYa/O5VL2EykxEY9wvZ4lzudsIxldaJpO2mGv5JntL/e0DjPSFPx0M3NF2utZgNvXTW72I119QG7w+NI+uALY+pOWXTVjoCdtLGr5BLprlaWc3pSfnE8EEkh3Y2DkWEGCnfo1p5M1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLTkrcjD6ZMiOEfY5Nd/OcqGHiK5JgAdLOPJw+Sh7MM=;
 b=GbrjtMPajb1qS1StDnkOGdY7yzvrwgvYiggQvm42+/mTN/lOLiJP4g/yW8JEJ3FNWcEl1MOIHiDyOikGCZPpwAMw8GwgGWccIkZivM67jr2v9+Gbnk9hhi5tYGBH1aEhEaQ/upajJy1I5L5z6kg9r6TPVanq/L/IReVzbNlq/koKHENbQUq5iq9qO8pmgPDpbLyRUCAlgSoj3jCChlAT7Dl12dC5esYgxF99h25cTnMfMMJzynAmrpwUFKHPgVuYX7J9Qsi88yFJagnpe5Ilc+HTV+FTxyVcfS0uwHMx86y6Vg66eUH9eKJutvs/bp2pGIa/KEqOP8TVS5Oi7QAfxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 18:25:08 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273%7]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 18:25:08 +0000
Message-ID: <d9b33040-0372-4fd0-ba63-4f9e42ba31b0@intel.com>
Date: Wed, 27 Mar 2024 11:25:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm: Fix WB caching PAT index for
 coherency mode
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20240325212700.127810-1-jagmeet.randhawa@intel.com>
 <20240325212700.127810-2-jagmeet.randhawa@intel.com>
 <SA1PR11MB69916004963FDF5C1987A6B192352@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <SA1PR11MB69916004963FDF5C1987A6B192352@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::18) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|CY8PR11MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a09a290-8a19-4aba-08dd-08dc4e8b3b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Er2S7vilSrICHwwJnxDFxs/8cZuLbb9Mn92khrWTW0JVx3JFPOuZ1Kv9QirF3lhqSU3WLIsYr2/Tcs44j0uDq22rWi5tcAgxUYYHmkqqwVH5srMf0kPkV5JB0yXV46ObxIAl82b8HmoPhG+wPue7SoWfaX5lAgnaYnDKJT065j15D3Y7cZh7KNjFeCQQre7ibnmwOStvgTSnukTVunNZrya/h+lBO3R8hqU+iX5Kdwzt3DAsWhr6Aw3bAFusFhc/7Zxg9knc47yZIpWhU0/IrfD5NnepaNYWAQwTl5FrIgn8mgpQneQmNJ+hoETO/3QTBL0QiAMM+ha0u4fe+ER403+k1CrQNyiBacE3X5YY4z5T4iQ5dN4Hkj7UWZGz5hE2EIwHuEYC7SR1am6ZlLnb2TWk6BsoIlFzvxruEjZ+5DUNJp9VeRX7hFOEzI/vtKAe8oaN9sFyBvZOtzP2mjoiZxrGIOdruSFRSwZDcJ6YlN+gN/0ZncWKU7xBhx+/EupjKksnYbuXMBA0xIW+HIZQtchDFZfQDqbq/GNQR9xfxCvV2FnaiDo2KzOiNIkRS7AtD/vQU+OszyzI5H5cxiB6BGiewmKrbCadAYSS4z5Z8NDeo7fzXq/DJNgyMr1xi8xEcGL/hVydSN+j4d8MQSKwfJBtcutYL+Us3x1sbWQIFlA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGFZZVVVWEdVUUt5L2RERkJrU3o4K01XTUM0YVhubi9ZT1BEb29WRkZqZyt3?=
 =?utf-8?B?ckVIcUh5Ullsb2xHdG1zamkwdGNWdStVWWo1ZHB4ZGpPT1FORVNPcDQ2Y2Ir?=
 =?utf-8?B?VFgzSXN2TlVvT210d0JBSk55WUsyUlhPc0NXcHZGbUp3T25pR1A5RHVONGNU?=
 =?utf-8?B?WHlNbVZBQUE5R3N5VGo1UklpUGowa2tEZFRYL1g0SWVhSEpXNlgvWWlJMGZ0?=
 =?utf-8?B?RlJwQml2dGk5TzNuYkQwcE1nalJIbzFxSktnOTBtZE9QSFYwNlpqTVhRa2lI?=
 =?utf-8?B?MFlnblVEU2Fab29vdW9LUUNnM1ltV3JRVXdPL3I1NW1qVC9FUmtzK250cmhJ?=
 =?utf-8?B?VmV2a2FGb3k3M3BBSFZKbmhzZFZRZmhQV01pem1rUHY0dWNWVlFseG1Kdkdk?=
 =?utf-8?B?ZEF0ZUVsNG5jcDlKWVd5eGZSUnZQUUFtcVRqU2VUclBFd0xSVVRMdFNKcDRo?=
 =?utf-8?B?OFhvaHI3TTlMTENKWjJnT24ySWl4cEJlQjV5T3FBTU5xRGI1ZzRiVkhUOXln?=
 =?utf-8?B?ZHhSYlpTZ2pLeVRFeERQV3RpL0tsRFIxcFlwb2xkdENEcmtmZVlWSGYvSVVN?=
 =?utf-8?B?clFiSFkrZm1tVVdqUmtRMnB0Y0l2TiswTVRzZjl2TDA0RWpiQ1B3MzVMMGo4?=
 =?utf-8?B?MW5PN09PdHhnMWwxSlA2STNiV0pkNlJWaGJWbjFUcklERjF1Ukh5c3JZVFJU?=
 =?utf-8?B?RE10dUdYb3l0Sm0rSkREN3B6UERvN1hpbjRxVnhGQ25MLysya2p1NUVpcjNZ?=
 =?utf-8?B?WkZ1YTU2SXVTMklYNTBmZmMyV3BOWi9Ib2M3aVBwdjBOWHB6M3hsR0hDTXJv?=
 =?utf-8?B?THlvK09EWXdWVWlRMTVIc1lwY0VJQ3FPcmhEb0V3VUF6SVduU1pKdWQzZkt2?=
 =?utf-8?B?U0NqYlQyRUJ6V3dycDZZL2JtTHRnQStzY1Z6RlM5Z2psalY5RVE3bWVaamJi?=
 =?utf-8?B?OEdhdURwN2VuZ044UXdRT0JkQTF0UktpQzJUWUM2SzBYb1hEdHdXTU5OSjZL?=
 =?utf-8?B?WmJkSHh4OXZNSXN0eVVCWnN5bWJjZ2d0dWxTK3JLczFFdE9ReDdVSXY5NlRV?=
 =?utf-8?B?WVE2NXNsRHllcXhHdldJcU03aTNiaUpZQVJ2Y2tqVFBoaFJxOEJvenY0Nmtt?=
 =?utf-8?B?bjFUZGFTK3V3T0tvTkFiK3BqVEdnemljLy9aMEZQSWR1Qk5SVnZ1UFZLL2Z3?=
 =?utf-8?B?S0NQUkc0d2RUQmE1aWlxUGkzWGtvd2hHbEczN3ZxVVRTVllHaklXakF3TlJz?=
 =?utf-8?B?WjRVZEl4aWJOd2FlVEpLMU9lMlNhRXhQZGIzVjhTVlhaclFsZUFJS3NnSzR6?=
 =?utf-8?B?MzBDZ2tqL0FGT1FGenlOczg0cHdVSmpWODNzcDNjNVZFMkJZZTVsZTFHazFm?=
 =?utf-8?B?c3U2VTBBekdLZVBkZDNaaEg3ZnRneFFBNHI4ZkNicjNDMVdhQ1FnUnFVWTl5?=
 =?utf-8?B?WUhRTFhOMCtienFMSVZPdjIvTnY4SDhJKzZ0dUZYZjFCNXVhVGJCMkQvelFM?=
 =?utf-8?B?bC9ZQXRQMXhRbTdNSFRxaWc4WmNodll5VHlUZVZ2akVHa09wcmg5UWVySmJP?=
 =?utf-8?B?UEpIRzQ4ZldFU3kvZkdCbUh5QkQzTnpKZDhCck8vWDl0RWFxWHdMeWVVY0Vw?=
 =?utf-8?B?YkdVOURZdmcxdVVpazc4dFRXL0ZEM3lBZWdkbFpLbWtVR3U0ZHhUUFY4ZkV1?=
 =?utf-8?B?MEF4eUo4UHlwdHRmekpmTEhKSXZzTU5QMk42NkNPdWhqMXY0TnFvWVhDMnpV?=
 =?utf-8?B?TjE1SjdhQ1dGVFlRUUROUklMbmxJcjRONWwvUWdjMDV5OGpjTXQvV3dSYWRP?=
 =?utf-8?B?eEI4U1J2RlBaeStINzJMVjMzT1U4Wk13MnJjK25EN1doZEdkcjZMQkVRRldZ?=
 =?utf-8?B?VkF2Mno5UjF1ZzFPc3M5eWE2WlR0ejhSZmsyM1pIY1RWc0ZNcUZVTklxUG83?=
 =?utf-8?B?R1lDaXZhMmxsWWZTWkZnc01ySnZDSkM4VEJLVzAxNk5mQnBXVGYzQ3dOeThy?=
 =?utf-8?B?UEdkbFA3YnZZRVFCNERpRGpCMnphWm9JM0Evd3BtOWdPVDVQYXd3RkxjeTY0?=
 =?utf-8?B?OXFhQ0w5WWhDc0lXb1FmT2gvcEdMbEdPZVZjZGZVNFRqMk0rNGY0Si94MGxp?=
 =?utf-8?B?VGx0RkFyaVZZY3RONlpwR28rOWJoWlVYTjdRQzFmWmJqN3dIcnF2VHZqZnd3?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a09a290-8a19-4aba-08dd-08dc4e8b3b91
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 18:25:08.7659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CImhmq3itGDNJslqbPmKbWVQymuhtlEUBW0z2nlLSmKiQFdf3bSmODc71S8uaZ7lqAJOyXdyIkN1d5MOeeeBiygGl25Nom8AIsQ33Wu+qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7828
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


On 3/26/2024 11:46 AM, Zeng, Oak wrote:
> Hi Jagmeet,
>
>> -----Original Message-----
>> From: Randhawa, Jagmeet <jagmeet.randhawa@intel.com>
>> Sent: Monday, March 25, 2024 5:27 PM
>> Cc: igt-dev@lists.freedesktop.org; Zeng, Oak <oak.zeng@intel.com>; Cavitt,
>> Jonathan <jonathan.cavitt@intel.com>; Auld, Matthew
>> <matthew.auld@intel.com>; kamil.konieczny@linux.intel.com; Randhawa,
>> Jagmeet <jagmeet.randhawa@intel.com>
>> Subject: [PATCH i-g-t] tests/intel/xe_vm: Fix WB caching PAT index for coherency
>> mode
>>
>> Resolve a coherency conflict by setting the
>> correct PAT index for WB caching with
>> intel_get_pat_idx_wb(fd), addressing the
>> mismatch between the default "XE_COH_NONE"
>> coherency mode and DRM_XE_GEM_CPU_CACHING_WB.
> I feel the description here is still not very clear. Isn't a confliction b/t the default cpu caching_mode and default pat_index?
>
>   Again, XE_COH_NONE is a xekmd *internal* concept, not part of xekmd uAPI. User can't set the XE_COH_NONE mode. I think this is determined by pat_index....
>
> By looking at driver, I figured the only not allowed setting is: cpu_caching == WB && a pat_index which indicates a XE_COH_NONE coherence mode...
>
> So maybe something like: driver doesn't allow cpu_caching == WB && a pat_index which indicates a XE_COH_NONE coherence mode
>
> The code looks good to me. So it is reviewed-by: Oak Zeng <oak.zeng@intel.com>. Improve a little the description message if you want.
>
>
> Oak

I agree, the description has now been updated and better explains the 
code change,

Thank you!

>
>
>> This conflict occurs for VLK:54352.
>>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Oak Zeng <oak.zeng@intel.com>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>>   tests/intel/xe_vm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
>> index 7c061c497..1f458174d 100644
>> --- a/tests/intel/xe_vm.c
>> +++ b/tests/intel/xe_vm.c
>> @@ -1789,6 +1789,7 @@ static void bind_flag_invalid(int fd)
>>   	bind.bind.range = bo_size;
>>   	bind.bind.addr = addr;
>>   	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
>> +	bind.bind.pat_index = intel_get_pat_idx_wb(fd);
>>   	bind.num_syncs = 1;
>>   	bind.syncs = (uintptr_t)sync;
>>
>> --
>> 2.25.1
