Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE84EC982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 18:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5892810E40E;
	Mon, 21 Sep 2026 18:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W82MjMQL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B610010E34F
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 18:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790015345; x=1821551345;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lawiWJcpiWbmk6Y7MBDzZdqF6GiS4XXD3DT/MxlRqig=;
 b=W82MjMQLkEjpWShcZhYWQpkNsD2v1BiUluC2tTw7nl1BWcoxyuz5VFl3
 dS09zKcqvnUnzklZKfYzwtINEurgBagyDFEtqpMlHxpK7WeExgSrXbEqN
 U9kdy5v6Gsh4H1q2yV1xQd2JjMZk3xpOodgwOpEBkkFLGoo50aOjE12v1
 2ZTXAxr+73ClHQtbcLNL53B2UdJF2wznpE6VegM2826V0LscJ3OYSOQss
 4f0W0awEUwE5nQh/BawPXQfoHV7XkuoeiX7g3S5IpXJIEjqD6Rk4lJ9lW
 UjRLP5qah25w4ZiXmkioOLnlWySmji0mPVBCCiZXUahSfbLk8gXBPFaQa w==;
X-CSE-ConnectionGUID: ByqK4O6LQPetjpPcvOrE+A==
X-CSE-MsgGUID: dPRvdcZZQeCurTqEDJu0eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90575914"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="90575914"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 11:29:05 -0700
X-CSE-ConnectionGUID: cf7b0XZlSXalvs0/lmf78A==
X-CSE-MsgGUID: A5tW74QcRTW6ugT0VYHhhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="4098400"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 11:29:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 11:29:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 11:29:03 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 11:29:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTfAC36ixUVp1dZsRAdUT90+9mg+AGBXr/us+EcHkcg9UkjeeyfTQqbi0LEtsNunI8SgotL8dJuksd3YtpkMklmZ0x5BUKEb4VcDKTqPMTiZiiQmvO7XzOtcUOLkifSNITy8n7e936VSmafUAy1iK8oc6ycna1JLxDaQFhbyDYuPDIgRDOu8rnNjrfV0d7RnndGhbeZ+JjPWiOZhuP9cIr1NnBodY9IKA5HhRZRCPaS5bBYrHG5qJV9GXNf7LuMT+0OCpmkOgftMMe4nMMrCot/i8tqmgTLBoTpl0vz5+U13Zy6IIiOJHZTh/fMEYYLwxQ5wz+wRbNmYeb1TnOnqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svY395vtnOWmu0hJMxGUrNMLdsnYsEy3gXXVu65BjxQ=;
 b=s9UmfmJM/HzAwJRLe9e/qIrKQDAZEaIS0jt6+Lq4hN0uamMOqxpncXf0y6IRWO3CN6ePzOXVeaPAEaULj38V8qyIfqxQ54wm1OU9cYPR6oPz3OxHwrYa3LpjZOje3pKVXD7xnBVd35DcZqFHZAiu3FIrl9T7zabXshkunRI2i+RQbJafIlyXo/h05zjB4h+NDluzz4xyz5BV+e0C2oVY+ffOyCMCmnovlN1v4rnIQtcddGPiZQifNErNaVZ3fGNEcpg9Kn/sxxSK7jvJC14weHt/8l7yaVZgALRxEMQz4kv213bqu+DGBA4feNMDdmIvujKCCPi74jiO+FOpxi1VoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 18:28:57 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 18:28:57 +0000
Message-ID: <ff3624e7-c98e-43fa-80b0-02f46747fe57@intel.com>
Date: Mon, 21 Sep 2026 11:28:55 -0700
User-Agent: Mozilla Thunderbird
From: "Yao, Jia" <jia.yao@intel.com>
Subject: Re: [PATCH] tests/xe_exec_system_allocator: skip huge-page
 multi-process tests when memory is low
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <nishit.sharma@intel.com>
References: <20260917230748.1825181-1-jia.yao@intel.com>
 <20260921153834.aqh546y7gr5xqyxt@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
In-Reply-To: <20260921153834.aqh546y7gr5xqyxt@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:217::11) To PH8PR11MB8040.namprd11.prod.outlook.com
 (2603:10b6:510:238::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8040:EE_|DS0PR11MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0d5499-78aa-4695-b496-08df180e32a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|23010399003|366016|376014|6133799003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: aDMX5D8qPH9G03gpRzjCBystfgOy+Zti9otGnCX0CEWBqi96rFtGTCCXn9LZzZfcO2ACvB4Gf3mlJ6rvUSuVxn+mcFzn1Ga+2diORXJWL2cYCISLbXXsdMVGpn3V9mncHjAuVkmzzWU2ZBtDbesSE9/5AiT0gdMbujhORexXBzXUkRMj4/OfeNvJM75SUmU1XfoPso95IPzB3BZjmRVQurfnUC/Rg51TNsvRQL+GNmUMBcp2W2RpAADxRNtUn3AqpStxKpoERgRe6zNOXCtb5eE00vmpZru6E6KApf8S2J5gGM78/RiHcIn1jNGBlsmr0T/lVjSBb5WX3T0mnssZFf2u5Xh10LqXILETcq+9CVN9o2qSZeI0J40chKxdBUESgyCF+RGsvSt0idoSId72ZkbniMNlcEGf5xbDYtAm4qFjqKU7prgDuAk1re6ueBO5zuY0r8o28RNb3qmtMFNf/BmnAUDjmrYxNPq9Wjl2PNLQ94qff1fYbpIAbPYZPo9yY6qwfS2ssRD0B6CN/Hqs2rqAsMMnsBCM04pT+9pfbXk8xD+axxbbYUqxPIUnTlSvXXqKjb8SyheDnBRn6tja6PANmO8VTWbHMZ5xY7b1xPtkGUKR7HraVum4hwTaN2Ku
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(23010399003)(366016)(376014)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEJTbC8rOUJoNWxTYXdWWFZmdEFYTkIrakNwdmwrZ29uK0plSitabWJZZU1M?=
 =?utf-8?B?YzRVazdNdERGMVBzVnNETHlPa2ZIOUpHcGRWWEZwTG4vaDVXYjFaQitMUXJz?=
 =?utf-8?B?elh4c1p6bmtVZ1BQSTF5U3M3RWRuOWFlMU5LSU1ScS9RRTJRNmJuV05oU25Q?=
 =?utf-8?B?bnJ1eGk1OG5ja3NmQWhlbGo0ZmRjM0pBOWxWc0E4RGJTRmJvNTNrSmE4NVpy?=
 =?utf-8?B?QmEvYXEwRnFuZ1pCU1l6YVl0aFhlaG9Nb0JtTXVReXl2ZmMvR09KQ3JOTEQr?=
 =?utf-8?B?eEo4WmZSaDYzd1dTbHZUQzNxR0hybFR6N085ZU84SEd4cEdaRC9uZmZQU3g2?=
 =?utf-8?B?S1FLQW9Hc2JQT2lLQkRlcGRicWxFanU1UEdkZVQwYkdialdrcXBXM0lhbm1K?=
 =?utf-8?B?RE5mOFJybGR3TVJnbGt3MTdiM0I0eTE3ellVQWNXUzhUQWxGN05sMXl6b3p3?=
 =?utf-8?B?MGpTcURhMFJNamM3K243NkJqeGdsSmZhcDdyY1UvTUNUNE1KdTRmd1Z4dGt0?=
 =?utf-8?B?NHM3N3h3K29RazE1akpGcTgxcXRaU1kyRThlTFMrU1B3OVNqNk9ZVkQ1Mkp3?=
 =?utf-8?B?RjBqQ0huMjFxbS9pcUlSTDdyTFhqeDRVZzFsTy9sVkJaaVJUUG5uajNwVDRS?=
 =?utf-8?B?bGtUZXdqaGdkYnFLWkd6c20zZWMweDFqWVVWdE1DMHJiZUE4Vk1IMGtvN2pJ?=
 =?utf-8?B?RmU5c1AzdmpJNWYrTnJ0QmtLUmxFZ244NFhCaUZQSWpNeG1WZ0ZWcjJPT1dS?=
 =?utf-8?B?Wlp4N1BUM0hxZXJSUEhyUDVpMUsxcnJMeEpDM29uYTBzb01mSW94SUNyMkRD?=
 =?utf-8?B?U3R6OG9XWXR5Y1AvTkJwUFZ2cUdnU0RrTjh0SWVwYjhOUExINlNlM2p2SXlQ?=
 =?utf-8?B?L0t0aWsvNngxYUk0Mm5ET3JuR1RwamUyV1BHUnBhdFk4bEYwNWhPWU1ETTlB?=
 =?utf-8?B?MnRMbE9oalZjWmhxL2pxajlTVTBwakpYYmdCaU9wS2lYci9tY0VFTUt1bUNx?=
 =?utf-8?B?MEdBL0FnNVBmL3JRU3RYSnU3cmJhWnRmMnE4L2MvYmxCQkpyenZQSTF4RTBZ?=
 =?utf-8?B?dDU3OGpFTnBQSGdCV2U2RUtTbzJlamtTbHBkUHVuZnJ6STJJUjROZmdSZHBa?=
 =?utf-8?B?TE5HeVZ3SHBqaGRkQ3lHa2lMNG1CSlBKVjNxckNHaCtBLzBYTnlMVXJFWUpX?=
 =?utf-8?B?ck8rQmxBZjV4YVJnM1Jkb1JCeDdYZjVhTXBTSUpHTGlRL3RVNVBISnNPM3E0?=
 =?utf-8?B?cU1Jcjhyb3hMc0pzTjVSMC9wak9lQlJnNksrbU9NV0pjUGk1MVdSQWdlN0xj?=
 =?utf-8?B?TUdoWnROS0FwN1VXMFJWcmdFQXMzdzZvUTVwTW14T2lHLzY3a2ZwWFo3bTRw?=
 =?utf-8?B?OW5zTkdFN1dRSkt0MENuMk9hUW9EaTJ3MVM5RWh3MVlTNXFneUZYeGZ5emFS?=
 =?utf-8?B?ckxOYlhrWUpRQk9TTFZ3SHVCRVFKWDNzdm04T3ZHTVBWclN5azJYN2tKRWcx?=
 =?utf-8?B?azdGUzBhV2N5SEErUVFVT1NyQVhRYi92eGZhdWwxNTNvZVhXdUkxQXJHNDZ1?=
 =?utf-8?B?dm5uaTBVbGNBMXFBNVlvVzdodFdDQ2syazUzZUJoL0o2VmhIYjZGWVlUOWYy?=
 =?utf-8?B?R3BvK1ZpSjBCU0lsMUZWdVV6ZFI1dFhDc042ZEdoaFh0RXVKQkdkZUhTaTFk?=
 =?utf-8?B?azltanpQSGh3QUN6a2lKYVVRMlRrWlRONndXenJlTzBNdWpySzdwYkp3Wjh1?=
 =?utf-8?B?aUI2bSs2cEtGVWNSTk0zaDcxV0xqTkFkSWdFQTlWMFUwRGhINnBTaHpEejhY?=
 =?utf-8?B?VVd6Q2o3RVJ2bUdYVlRjbzltblNWT0kveStyZlNOc0tYSnpOTEhvVkVtemJM?=
 =?utf-8?B?bGdNWFJVUU5YdmJIMHB5RGxNcXpzdWR1WERMaUVWeTdSR2VlTUJJakFTNkVK?=
 =?utf-8?B?c0c2Sm9iVGhycklZMHZTdnpWSTg3ZFg4dmxudXZNbjJZNURZb2RneUlQTmtK?=
 =?utf-8?B?ZFFwc0pkS2pnQm9mdGE2U2Z0ejFSamZYZ2NFZndod0RDR28xQ3R5ZzBXTkVs?=
 =?utf-8?B?NkZoSzhlM1hvY0VJa25vTE0ySSs4Y2t6OXRJMDMzbnVQY2diSjd0V01pVHhL?=
 =?utf-8?B?ZVFDTjZTc2ZkSEJhUU5INDZKMUxHNHhCcnJtRGJJZnVneWJaQjJwd3dacmZF?=
 =?utf-8?B?VVZXNmpLTmV4bUduSHNKMlBkMUZXL3BJZ1FTVk5EbFczTG1SVENNVy9PWSts?=
 =?utf-8?B?WEdLRXJVY3JxSFpmMlk5ZlArVUVMMlBmN0VFOWV6VVBuQ3QwRDBRWS9wRFpv?=
 =?utf-8?B?V01aZVRETmtTZVkyR3NsalZvVmJIeWM3ZklCVFF2TDNkSlRaT0RFdz09?=
X-Exchange-RoutingPolicyChecked: TqGcjJAVJ2s6ANMt0ftt/n8JQ4ByH1o0xhnjThYOXVWzFR4BIBedFCy9mSfX6kNaJYCz/Xqw0bZIpRkQh8HXizdTEqZffnT3YHEIcJ/VnI/NhBlAOx01ANkg/O/TWMIHEQCuKPgQ0LjSK1BPuLg1KVY8mpEXGgpsdYBO+oPmDH8D+CIUpv9lp0RzWnKjWuovy4UatiSiEB/yJW3B5JVmsfeB8aqljC0EMakD20r0T54HJJO7UHl5rMa6zkK4A7jmAQORXBERn5kSkiXDMNJom/tjnhq8sqQBDjRpu8YI/VKLZloCNUTY8OsO971NRPAzwlcPpzjyLcu47mXiTbwx1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0d5499-78aa-4695-b496-08df180e32a1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:28:57.0844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: racFNZQDS9Zb7ei7dnApxJeqYfB1hKfMbJ4tHwTGeIAFeXMKDrrCh8zTxAEWWmCrOAIH/HDETOPeDvPjr8pP2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
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

Hi Kamil,

Thanks for the review.

On 9/21/2026 8:38 AM, Kamil Konieczny wrote:
> Hi Jia,
> On 2026-09-17 at 23:07:48 +0000, Jia Yao wrote:
>
> I didn't looked into you patch, only few nits,
> first about subject, please add 'intel/' prefix, so it will be
>
> [PATCH] tests/intel/xe_exec_system_allocator: skip huge-page multi-process tests when memory is low
>
>> The process-many-stride-mmap-new-huge subtest forks one child per GPU
>> engine and, with the MMAP|NEW|HUGE_PAGE flag combination (without FREE),
>> each child accumulates up to n_execs×SZ_2M of anonymous hugepage mmap
> --------------------------------------^
> please use ascii, better
>
> each child accumulates up to n_execs * SZ_2M of anonymous hugepage mmap
Will fix it at v2.
>
>> buffers before freeing them at cleanup.  On constrained systems the
>> total peak memory (n_engines × n_execs × 2 MiB) can exhaust system
> Same here, use ascii '*' for multiplication.
Will fix it at v2.
>
>> RAM, trigger the OOM killer, and cause the surviving processes to time
>> out waiting on fences (ETIME / errno=62) rather than failing cleanly.
>>
>> Add igt_require_mem_kb() that skips when MemAvailable is below the
>> estimated worst-case peak and call it in processes() for the
>> MMAP|NEW|!FREE path before any children are forked.
> Did you looked into Xe full results? It seems there are still an
> error:
>
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html
>
> but I do not know if your change should repaire it.
>
> Regards,
> Kamil
Regarding the Xe CI failure you 
linked(threads-shared-vm-many-stride-mmap-huge-nomemset) - no, my change 
does not fix that one, it's unrelated.

That failure is in the threads() function (SIGBUS, then 
igt_assert_eq(ret, 0) failing with errno=16/EBUSY 
atxe_exec_system_allocator.c:2205),

inside the shared_vm cleanup path that retries unbind_system_allocator() 
while it returns -EBUSY:


     int tries = 300;
     while (tries && (ret = unbind_system_allocator()) == -EBUSY) {
             sleep(.01);
             --tries;
     }
     igt_assert_eq(ret, 0);

My patch only touches processes() to skip the MMAP|NEW|HUGE_PAGE 
(without FREE) case when memory is low - it doesn't touch threads() or 
the unbind_system_allocator() retry loop at all.

This retry loop is pre-existing code, and I actually suspect it has its 
own latent bug: sleep() takes an unsigned int number of seconds, so 
sleep(.01) truncates to 0 - the "300 tries" loop basically spins

with no real delay instead of giving the kernel's async SVM 
garbage collector (visible in dmesg as "Skipping madvise reset for vma") 
time to finish, which would explain the persistent EBUSY on this shard.

I'll send a separate patch for that if you agree, but it's out of scope 
for this one.

>
>> Signed-off-by: Jia Yao <jia.yao@intel.com>
>> ---
>>   tests/intel/xe_exec_system_allocator.c | 39 ++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
>> index 305512dfd..1f57ab0a3 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -1173,6 +1173,28 @@ static void igt_require_hugepages(void)
>>   		      "No huge pages available!\n");
>>   }
>>   
>> +/**
>> + * igt_require_mem_kb:
>> + * @needed_kb: minimum required free memory in kB
>> + *
>> + * Report whether MemAvailable is sufficient.  Used to avoid OOM kills in
>> + * memory-hungry multi-process subtests (MMAP|NEW without FREE).
>> + */
>> +static bool igt_require_mem_kb(uint64_t needed_kb)
>> +{
>> +	/* igt_get_meminfo() returns bytes; convert to kB for comparison */
>> +	uint64_t avail_kb = igt_get_meminfo("MemAvailable") >> 10;
>> +
>> +	if (avail_kb < needed_kb) {
>> +		igt_info("Not enough memory: need %" PRIu64
>> +			 " kB, have %" PRIu64 " kB; test not run\n",
>> +			 needed_kb, avail_kb);
>> +		return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>>   static void
>>   madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
>>   			size_t bo_size, uint64_t addr, int index)
>> @@ -2228,6 +2250,23 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>>   	if (flags & HUGE_PAGE) {
>>   		enable_hugepage();
>>   		igt_require_hugepages();
>> +
>> +		/*
>> +		 * MMAP|NEW without FREE accumulates up to n_execs hugepage
>> +		 * buffers per child process (one per engine).  Each buffer is
>> +		 * at least SZ_2M after the HUGE_PAGE alignment, so the worst
>> +		 * case peak RSS is n_engines * n_execs * SZ_2M.  Skip early
>> +		 * if free memory is insufficient to avoid OOM kills that turn
>> +		 * the test into a timeout rather than a clean failure.
>> +		 */
>> +		if ((flags & MMAP) && (flags & NEW) && !(flags & FREE)) {
>> +			uint64_t n_engines = xe_number_engines(fd);
>> +			uint64_t need_kb = n_engines * (uint64_t)n_execs *
>> +					   (SZ_2M / 1024);
>> +
>> +			if (!igt_require_mem_kb(need_kb))
>> +				return;
>> +		}
>>   	}
>>   
>>   	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
>> -- 
>> 2.43.0
>>
