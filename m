Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ABCCF11F5
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 14:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B1710E919;
	Thu, 10 Oct 2024 14:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GyBObG8l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1C310E903
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728569176; x=1760105176;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DjmHu/zK0EMW5jsC6Em6Fju4mnMa9JHtlaG5Hp3I80s=;
 b=GyBObG8ls105hjcdWLIeJAV1obs1jThI6rksm/mKU52C8736L9jV3NFf
 HJE2NZ9uZA+/uH94legPqMIbzsWsEqjsaL5Dinftb1oExeWz3ObMhPHD3
 BK4QEEzKiCwwhLYDIbxCodc92tOraslJ5ITn68o/aBweWlPxK8zoconDh
 zeM1Tf5A6px9qExASaTMP/2Ysud4qCGlRZ2AuI2mL2Dn4Oawkw61i7Z0t
 WimPTzceTypZz/nahfWxJMEsQhgtKB8XFzocoO104CCiIqc677hsi5l3/
 ETxFNAe4EN1F0htqiH47ORsMdB/COKMpYjzaxGcygheZEkzq8IDudiHBG g==;
X-CSE-ConnectionGUID: 0Edh4hrGQfKTl3h4K9NR+A==
X-CSE-MsgGUID: Asw+HDxFRqudV0xNIC+8sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27398601"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="27398601"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 07:04:11 -0700
X-CSE-ConnectionGUID: gNsQk3qhS42puN53UbLEiQ==
X-CSE-MsgGUID: IdAWxmJiTmyDYIcaVQ1vvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="107327509"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 07:04:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 07:03:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 07:03:58 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 07:03:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/W+PlKN4DYNod3UhuBuHEM/prCmzJNVq4c744/b8oJYmp4uvXFqizw6lJEBWEwFnk/sE4fgPzqXRHHGLufHekKPwE6cPWZqrqTE05F+jjULq5VvPEd8QVb+hH4aDMObsgHmPWqPMiYRWjxVXDOMQsPabKD9wBitBIQfvLKAobWEGrPQoZpF04ATjPL8pw43Jy/yLHxS+teNFWx25DsXZPwDSpVMAHRB9rqUPH55DYde3mhY1m+KRvi2Zxt4DOtYnYMwoMtSPav6I5DrY8qc0GRBZ/7piMFqtzNG36DlDGOtLZSjWTTzvrXogMf01wZI+5X4mzOXExeuUUgItMpHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GClkdt98A2zUytqnQQ6X3QLkG9D58jp8+lIoltL0CAE=;
 b=CdxakVkEaVE/PtqiPTlvBecA2a5I4M81dKq94/7luY+yTJV0/tfL+AX463dTt6/Ctfvnb8fxaotCHVvW9kpFpnouElAOEZCN37ZiD0nKmv5OmiNZKBJdCNzdlyhe1alWs1mP9MXNqndTSQO6CFysBzgECqS4cXCXKTrA2wzwOtE7Mt0KieOgmGifGIC2qwIHRFxrbPF4MGAPqm1lrQwRkKXe5M6+G3fsmrUc/bQBVBJj4LYH3OQX/vEf6fZR/4M5pdE265FnGiVIhogk3L2TR33ODtvVyDKev+rvJ8PrEwvsaKgHwZoDheTgpFqeaEiqgGXPvDYBOFvgKFJyJLaaZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 14:03:38 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 14:03:38 +0000
Message-ID: <a5c8c157-7f9e-4ea1-ac83-1f840c930e79@intel.com>
Date: Thu, 10 Oct 2024 10:03:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/1] xe_exec_capture: Add xe_exec_capture test
To: Peter Senna Tschudin <peter.senna@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241007221348.3559076-1-zhanjun.dong@intel.com>
 <20241007221348.3559076-2-zhanjun.dong@intel.com>
 <df92b1e5-c6cc-4bc6-b3ec-64eca44239e1@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <df92b1e5-c6cc-4bc6-b3ec-64eca44239e1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c0d238-db9e-4de6-c1ff-08dce9345671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHlCNTloSTFkVnhRcU8vL2tWb1p1SmZSbytCM1o4bWw3NFB1ZXNHeVU5TklI?=
 =?utf-8?B?bjRYSWtWaDJ1OFJtY0FQdTM3clhTYjh4YnBHazJxbkhmanNDNDNkQ2JNS3ZW?=
 =?utf-8?B?Y2Noam8wTDBtTFFoNVo0YVF2VFpFbFEzRVIyRXZXUE1qQlF0REp1L2cyalhh?=
 =?utf-8?B?a2xPcGZvOXpuSEc5SjlyZlEwM1BRQml1OW03U1ZrZGJyL2E5NjFlK0hWQUFO?=
 =?utf-8?B?Rkg0aDY4K1hmNlEwMklJNHVjM29CT2Q2K21hK1UxaDdrN2JMcVJiTjMvdzdO?=
 =?utf-8?B?TWdSTWlOaGhZdk5KNWk4a1drZEdLeGsxbjVna044Y3BBdkR3OHIybFpIclpH?=
 =?utf-8?B?V09SWFpEODhIa3VXbkxYZmtGVXo2d0hKRkFvYUNoV2tLZUZ6QmMxbERzUzlj?=
 =?utf-8?B?enQwcDFveE9IaWdpOTQ5SGZnRm5EWXgwLzJXeGhyc0pMb1lnbzVBRjhBemhs?=
 =?utf-8?B?czl2UE5mb3N3M2c2cGNlc0d4SGlPdGVDVjhnQWdTbUNDSEtaTmtmZmd0ZzB4?=
 =?utf-8?B?aUljdmxxQ2pveTdMOWR3ODZxdFdPMW1oOERqWUxiY2d1ZlB0QVRDN1hoWGdB?=
 =?utf-8?B?YS9UK3VlQUxxYVFKVnFtSjBsdVNpYTZDOGpsUko3cnFWYUFnWFdFc3h1TTlT?=
 =?utf-8?B?MGJtQWMzR0RCc0NUYVVsaUtmbU83azBHQVVwV3VteFF6YTcwNXZTMHRvTDRB?=
 =?utf-8?B?NTE3UUhDaGc4U1Q1Y1kxRGdwaGtvbWFMWmFxWmh6cW9tNnpQNzl5cU9zVC9L?=
 =?utf-8?B?SDNIdllVU0ZpbWlOYjdWKzBLSHh0bGRoY3FRbzl5bzIzcFhNNFMxODUzUGRN?=
 =?utf-8?B?UlVxTW1mWjJMMEl5c25SdkRSWSs2Rjc5WklUbjRJZEhyRjJsUW1jbmJNWmc3?=
 =?utf-8?B?ZDl1VG5oSGJ0Nlc3am1PMGJLM0lzaVVkOUdnUWJZM2tPdHlwK2xMckdZSUNN?=
 =?utf-8?B?NVk4RlBnaHVjUGVLZXNGOENscFU5UVlkWTJOTktqNXFTT0ZNd0VXUGpyVGRl?=
 =?utf-8?B?enFmZHFIbzhKZ1hrdTlQb1BrZ1Yxc2U4WmVZSmY0RlQ5c2lQRlBLNld3eXhX?=
 =?utf-8?B?MHpFNkdSdGZpUzJJT2p4Z05hSjUyaDZiYmFtYi9rKytpdk5sOThlTDJENG9U?=
 =?utf-8?B?Rjh4ZmFnRG5YcDQ4emZ1NDMvWitSZlNha1UxQzFvK3oyNXliVDJsVDdvSG5I?=
 =?utf-8?B?M2E5UTZzVEZ3Q3RRbHhFemtYdHVHM3krL1hySzlVb2xrUFRNZ3htSVpYeGht?=
 =?utf-8?B?a1NZTm1aakVod1dSdDdrZ2JuQXdRcERiVC8vVHpqWmRlYzdOM1ZoWnJ0emNT?=
 =?utf-8?B?Z3o2QVpFcG9KZ2VRVDlOMUhkQXFDcTJPQmpJU3JSRkhmS1BhLzhYcnMrTDRl?=
 =?utf-8?B?RkVMZEx0eUNDZWVha1hSRzVxZW1rNmtIdmtDbDcwU3RmVTkzZTVBQmNRY2RP?=
 =?utf-8?B?M2hhdkRoYkVHMndVMTNsdGV1SitSSWI4am1xYlpaNS9OYmlTRnZITkJxeTJT?=
 =?utf-8?B?ejBoSDhLN0FtR1RyWkNWS3dMNFdHRDMyc3dHOVdrcGM2ZnJ6dFlWYURLV1ll?=
 =?utf-8?B?VThZZ0RLd1lPeG5Kc1B2ditkNmxSNnl0SjY5YjA4a1RMNnRudUVjTklRTTZ1?=
 =?utf-8?B?NWY2Q2F5WnptanBNdUxBZGVTVnZKTmJyUktjN0ZOWkpnZ3plSDNoTjhXa29h?=
 =?utf-8?B?ajhBZzMyZDhqNjhlY0ZNaWpOSTBWL3B0dFYzUmdabXJWUEFvWW96cHR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzhvRTFHTmoyMFdZcEl2M2hTNnVaK29iOUYrWTlaWkJWTU5tL2IvRkdmNUp5?=
 =?utf-8?B?Zmk2N0htVS9EcXlHNWJmNXBjVzdMTFpIMFU2L2U5SkN2N0VyYUVrR0RsZXlj?=
 =?utf-8?B?QnFXOU1VWUtIYXRpb2JyMkE3SFdCUTVVSEM1TGUzVXdBRnlDRWhqZzYyV1JE?=
 =?utf-8?B?cTA5VENQRUkwbWFyTEhNb2xoRFJFL0JkK3dxalJoV29PZHBLelp4ejQzKzdx?=
 =?utf-8?B?ZXdIRUlvQ1lGcTJOWnV4WjRJOFV5RXpWYUJ6WlNQZFpDWnpVTi9UWCs4Tnp5?=
 =?utf-8?B?c2tBdHhqTERTbk04VHZKRkpFR01MSWRPYkdaeHJ4WXI0VWxRcVJFdml6bDkr?=
 =?utf-8?B?b2pyVTQvY0paUkdqejJjMkxLM0FyeEFDRjJwUnFpK0JUTWxKVk1RdDlqbklZ?=
 =?utf-8?B?NysxUWQ4YVA3V29WMFlyMU1zb2Y3OTFPS1JvQjZjVy9aOVMvb3U0SUdxL2Q3?=
 =?utf-8?B?czhFcVNqcjhHLzlUQi9RODJMMys2NGZmUXozbDlaL3VaeDBxRXgyelJYNmJa?=
 =?utf-8?B?WjFicFNTaFUramlmU01wMDlDNTdPaTRrbExDa2NWRG9tdmJoblJNOEsyWkJE?=
 =?utf-8?B?ekIrb0pFQWxjSHNwQzJGT0pLampPOEhKS1ZVcVFPUlc5cFl6TFlNREM0aHV2?=
 =?utf-8?B?eVlFWHFwVFJtVktuZHZXczd3OVhtSE54VENpa1FkUkZoRnNUS240eWdadjVs?=
 =?utf-8?B?b1dSS0MxYUx0bmpoTk5CdXU5TUE0d2dPMlA4N0Yxc3RmLzRLUnZBTHRMaDRC?=
 =?utf-8?B?UWZyMXNoZXFIbUZuWjVIOUwzRkVjaDlDbzNyRUZaS3gxTjVMbjlianBRRlJK?=
 =?utf-8?B?V2xrTWt6dTZpN3A1SHAwUjVQOXNvc21IRnRGVGZaaVZsWnJkYW0wUWZ5Z1Uv?=
 =?utf-8?B?cGo4WTNUaXNIMW9reEFqQTd5dmxISkdrdWxlQXNDa1lmUzU5bDVGU0Y2Slow?=
 =?utf-8?B?UW1hTXo1aVFxR3k0WUlxeWh1ZUZkMDJyaDFXVTNYeWdqbXRJYmovOVVZSXdF?=
 =?utf-8?B?aEFEb24xZnZkeGR5SzRpVGd5cjlmV1ZsZjhnb2N1MUJ4M0RPbklxdTRnNERF?=
 =?utf-8?B?eU5wYWU3NG9tanpwR3NXaW8zRzJNK3BDUjFRbEFMSkFyTDYzN3ppTTVLQ2wv?=
 =?utf-8?B?Tlh0bDdPZU9jK0dENGdPMVBrK1p1N2Q1V0JJS3hrVjh1STJzTXUwSXRTN2RG?=
 =?utf-8?B?T1JlNk9uN25xb2k1amMrWHR6a1ZRZEFZQ1dmZjJUcS9ZajdxaTRVbmhkaVFu?=
 =?utf-8?B?MXdwdHIzR3Y5ZnBYMVhvWHI5aU1aZGE1bW5UVCtzWHd1RlYybFpjbm1pejVI?=
 =?utf-8?B?ZW1ESjJqcU9DY3lPMElRVXkydHZ6a3MyUE9pMjk4c0ErdGxPZDVSYTVBdHlD?=
 =?utf-8?B?QlRkT3dRZ3pTYnhnY1NEbnBqZG1sUkczSnJpV1JleHFhRVNLRDViWExMU3gr?=
 =?utf-8?B?Nm5VSE44RjNycHljY0xvK1JVYjVrT3RwMTl3QWZSS1l5NkZ2bmd4c2FPRHNh?=
 =?utf-8?B?dWtpNkJ1WUhnSEsrb3RSQ1ovaHFkMktDWjR0Y1NYa0dLN0Y5OUJIQThMc2Zi?=
 =?utf-8?B?b3ZKV2s1RFFoVHNwQzZhdUtNVzZjdWZLdlJGMlpMbElUd0dGV0ZSK0kzNHhU?=
 =?utf-8?B?dmtLdjZlWWxFamhhYTJsMEppVWtiYUJGRGR4Q0R1RHg3cU9zRkNYbHRiZ2xr?=
 =?utf-8?B?S1JSL1M4elVhV2ZPVUc3bjRIZk40SGdxWHFuV2JHWk0wTVFINFg4eDdMWmV4?=
 =?utf-8?B?OFVSVHNsa0hIRGZFYTJKTnBLVnJ5bkRiY081MTVJWFo0M2hQOEgwWDdkNndU?=
 =?utf-8?B?NWl5ODFSeWhrNDhUMVIwZjVoOHI0WnJsUXJkUXErSUpVQkc5NVhIYmI2enNn?=
 =?utf-8?B?TmZYc2ZpcU52MmNWOEZVdlNkYXVieFo1WkJKaVdhOThiTVQzandDSDdsTkU5?=
 =?utf-8?B?aWxJSGljKzZ5M3NUd3U2QWk2T1MrbEc4dWhtZ1ZndGRqNWV0RkY2eTVtUWhF?=
 =?utf-8?B?azhlZWtwajRzaEtVUDBQRUgwT1B3amNQejMyQzA1dWUzdHlNQnBIbHVjK3Bt?=
 =?utf-8?B?Qy9zd3Ryb1Jwb2NJcmtYazBITStzditLdFBGNHZqT2h4SUhkbk9ibm5PWHlD?=
 =?utf-8?Q?kvwYzfMEeA8k9oT04iUPKao4K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c0d238-db9e-4de6-c1ff-08dce9345671
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 14:03:37.9846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +W2SCOv9H/TnfstcHz19swxKW7xiv4+cWy7vrh/bJ9fY79atcng9IRiQW9msBHrHoYq1YNXnMpAmQHZqtBpQtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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

Thanks for review my patch, please see my comments below.

Regards,
Zhanjun

On 2024-10-10 2:06 a.m., Peter Senna Tschudin wrote:
> Please see my comments below.
> 
> On 08.10.2024 00:13, Zhanjun Dong wrote:
>> Test with GuC reset, check if devcoredump register dump is within the
>> range.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   tests/intel/xe_exec_capture.c | 227 ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 228 insertions(+)
>>   create mode 100644 tests/intel/xe_exec_capture.c
>>
>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
>> new file mode 100644
>> index 000000000..3ca137989
>> --- /dev/null
>> +++ b/tests/intel/xe_exec_capture.c
>> @@ -0,0 +1,227 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Basic tests for GuC based register capture
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: CMD submission
>> + * Functionality: Debug
>> + * Test category: functionality test
>> + */
>> +
>> +#include <ctype.h>
>> +#include <math.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_syncobj.h"
>> +#include "lib/intel_reg.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +#include "xe/xe_spin.h"
>> +
>> +#define MAX_N_EXECQUEUES	16
>> +#define MAX_INSTANCE		9
>> +#define GT_RESET			(0x1 << 0)
>> +#define CLOSE_FD			(0x1 << 1)
>> +#define CLOSE_EXEC_QUEUES	(0x1 << 2)
>> +#define VIRTUAL				(0x1 << 3)
>> +#define PARALLEL			(0x1 << 4)
>> +#define CAT_ERROR			(0x1 << 5)
>> +
>> +#define CMD_BUFFER_SIZE		1024
>> +#define MAX_PATH_NAME_LEN	512
>> +static void get_cmd_output(const char *command, char *buf)
>> +{
>> +	int length;
>> +	FILE *handle = popen(command, "r");
>> +
>> +	fgets(buf, CMD_BUFFER_SIZE, handle);
>> +	pclose(handle);
>> +
>> +	/* Remove trailing space */
>> +	length = strlen(buf);
>> +	while (length > 0 && isspace(buf[length - 1]))
>> +		buf--;
>> +	buf[length] = '\0';
> 
> Would it be something like
> 
> buf[--length] = '\0';
> 
> instead of decrementing the pointer? Honest question, I am not sure.

Thanks for point out, that's a bug. To be fixed in next rev.

> 
>> +}
>> +
>> +static void find_devcoredump(char *card_dir)
>> +{
>> +	get_cmd_output("sudo bash -c 'cd /sys/class/drm;for dir in $(ls -d card?);"
>> +		       "do if [ -e $dir/device/devcoredump/data ];then echo $dir;fi;done'",
>> +		       card_dir);
> 
> As mentioned before, please use only c and don't hide privilege escalation with sudo in this way.
Right, will be converted to C only.
> 
>> +	igt_assert(strlen(card_dir) > 0);
>> +}
>> +
>> +static void rm_devcoredump(void)
>> +{
>> +	char command[CMD_BUFFER_SIZE];
>> +	char card_dir[MAX_PATH_NAME_LEN];
>> +
>> +	find_devcoredump(card_dir);
>> +	sprintf(command, "sudo bash -c \"echo '0'>/sys/class/drm/%s/device/devcoredump/data\"",
>> +		card_dir);
>> +	get_cmd_output(command, card_dir);
> 
> As mentioned before, please use only c and don't hide privilege escalation with sudo in this way.
> 
>> +}
>> +
>> +static void check_capture_output(const char *tag, uint64_t addr_lo, uint64_t addr_hi)
>> +{
>> +	char command[CMD_BUFFER_SIZE];
>> +	char output[CMD_BUFFER_SIZE];
>> +	char card_dir[MAX_PATH_NAME_LEN];
>> +	uint64_t result;
>> +
>> +	find_devcoredump(card_dir);
>> +
>> +	sprintf(command, "sudo awk '/%s/{print $2}' /sys/class/drm/%s/device/devcoredump/data",
>> +		tag, card_dir);
>> +	get_cmd_output(command, output);
> As mentioned before, please use only c and don't hide privilege escalation with sudo in this way.
> 
> 
>> +	result = strtol(output, NULL, 16);
>> +
>> +	igt_debug("output:[%s] expected:[%lX-%lX]\n", output, addr_lo, addr_hi);
>> +
>> +	igt_assert((addr_lo <= result) && (result <= addr_hi));
>> +}
>> +
>> +/**
>> + * SUBTEST: close-fd
>> + * Description: Test close fd, check if devcoredump register dump is within the
>> + */
>> +
>> +static void
>> +test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>> +		 int n_exec_queues, int n_execs, unsigned int flags)
>> +{
>> +	uint32_t vm;
>> +	const uint64_t addr = 0x1a0000;
> Can you label the magic value with something meaningful?
Sure, will make it a macro define in next rev.
> 
> 
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 2,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t exec_queues[MAX_N_EXECQUEUES];
>> +	uint32_t syncobjs[MAX_N_EXECQUEUES];
>> +	size_t bo_size;
>> +	uint32_t bo = 0;
>> +	struct {
>> +		struct xe_spin spin;
>> +		uint32_t batch[16];
>> +		uint64_t pad;
>> +		uint32_t data;
>> +	} *data;
>> +	struct xe_spin_opts spin_opts = { .preempt = false };
>> +	int i, b;
>> +
>> +	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
>> +
>> +	if (flags & CLOSE_FD)
>> +		fd = drm_open_driver(DRIVER_XE);
>> +
>> +	vm = xe_vm_create(fd, 0, 0);
>> +	bo_size = sizeof(*data) * n_execs;
>> +	bo_size = xe_bb_size(fd, bo_size);
>> +
>> +	bo = xe_bo_create(fd, vm, bo_size,
>> +			  vram_if_possible(fd, eci->gt_id),
>> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	data = xe_bo_map(fd, bo, bo_size);
>> +
>> +	for (i = 0; i < n_exec_queues; i++) {
>> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>> +		syncobjs[i] = syncobj_create(fd, 0);
>> +	};
>> +
>> +	sync[0].handle = syncobj_create(fd, 0);
>> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>> +
>> +	for (i = 0; i < n_execs; i++) {
>> +		uint64_t base_addr = addr;
>> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>> +		uint64_t batch_addr = base_addr + batch_offset;
>> +		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
>> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>> +		uint64_t sdi_addr = base_addr + sdi_offset;
>> +		uint64_t exec_addr;
>> +		int e = i % n_exec_queues;
>> +
>> +		if (!i) {
>> +			spin_opts.addr = base_addr + spin_offset;
>> +			xe_spin_init(&data[i].spin, &spin_opts);
>> +			exec_addr = spin_opts.addr;
>> +		} else {
>> +			b = 0;
>> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +			data[i].batch[b++] = sdi_addr;
>> +			data[i].batch[b++] = sdi_addr >> 32;
>> +			data[i].batch[b++] = 0xc0ffee;
>> +			data[i].batch[b++] = MI_BATCH_BUFFER_END;
>> +			igt_assert(b <= ARRAY_SIZE(data[i].batch));
>> +
>> +			exec_addr = batch_addr;
>> +		}
>> +
>> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>> +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +		sync[1].handle = syncobjs[e];
>> +
>> +		exec.exec_queue_id = exec_queues[e];
>> +		exec.address = exec_addr;
>> +		if (e != i)
>> +			syncobj_reset(fd, &syncobjs[e], 1);
>> +		xe_exec(fd, &exec);
>> +	}
>> +
>> +	for (i = 0; i < n_exec_queues && n_execs; i++)
>> +		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>> +					NULL));
>> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	syncobj_destroy(fd, sync[0].handle);
>> +	for (i = 0; i < n_exec_queues; i++) {
>> +		syncobj_destroy(fd, syncobjs[i]);
>> +		xe_exec_queue_destroy(fd, exec_queues[i]);
>> +	}
>> +
>> +	munmap(data, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +
>> +	check_capture_output("ACTHD:", addr, addr + sizeof(data->batch));
>> +	check_capture_output("RING_BBADDR:", addr, addr + sizeof(data->batch));
>> +
>> +	rm_devcoredump();
>> +}
>> +
>> +igt_main
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	int fd;
>> +
>> +	igt_fixture
>> +		fd = drm_open_driver(DRIVER_XE);
>> +
>> +	igt_subtest("close-fd")
>> +		xe_for_each_engine(fd, hwe) {
>> +			igt_debug("Engine class: %x inst: %x\n", hwe->engine_class,
>> +				  hwe->engine_instance);
>> +
>> +			test_legacy_mode(fd, hwe, 1, 1, 0);
>> +		}
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 2d8cb87d5..b724a7c6d 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -284,6 +284,7 @@ intel_xe_progs = [
>>   	'xe_exec_atomic',
>>   	'xe_exec_balancer',
>>   	'xe_exec_basic',
>> +	'xe_exec_capture',
>>   	'xe_exec_compute_mode',
>>   	'xe_exec_fault_mode',
>>   	'xe_exec_mix_modes',
> 
