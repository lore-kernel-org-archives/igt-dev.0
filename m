Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3553E99055
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 08:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F27210E1A3;
	Fri, 10 Apr 2026 08:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASF4RxKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A22B10E1A3
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775809374; x=1807345374;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mGFv7A9q07fd7sIO++tP9HenykB3AkkOrOjp82zAI00=;
 b=ASF4RxKTEnkvb17f6+zqog9tXbJMAFNhtBia4ciarGESv5Usjty7n0P7
 OcKHqONiyYXxvc5U7WjdhSrDIOsUEu2J5lvy0XZTJl/YvxJjOOBdtWCOW
 ooQZb2X1NFdhGFaCfrF9mTc6IcFA9JDPWLFW54enBADictR2rdnYq5W/U
 lB8Dn9FTWjcBPljq07X4pcgdjulqCJNi8PEWfsRq7QM6laFiHIx/BdAVh
 zcO1Q0ftf0vQmXfJE40HQnJ6s/zpo+PCTooBBABNoxQMg16XDxl9G34mU
 gO9WlzNKcd2wvnZkPB3st0q04P/yDM5ZQdd+gGGB7Y1gZqrsHiEUP+2l5 w==;
X-CSE-ConnectionGUID: ZUHH3UQRR7K5+JZY8jkkYw==
X-CSE-MsgGUID: o5qg5IFeS1WgM4a2zZfdLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="64361198"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="64361198"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:22:53 -0700
X-CSE-ConnectionGUID: qCLrT2CjQ7WFfI+k7ifTBw==
X-CSE-MsgGUID: rwQhqgFgSvm0C8K1vijgvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="229301457"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:22:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 01:22:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 01:22:52 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 01:22:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYwwD/73fcPZFfvzy0b7K+tD50pwdv4ZIWWE7icoj88QdyXqKsReZopTjN3fSKf13bD8CG7ZBwRl3wvW+W23MtwCsX6lBDhhi2hns3uoQ2lHYDJvbRhL/8ZMtl3N+NhWU09dP/CA4sB7orv4XfCYQr1VFVuk7fHjxJpsfiUpwa9cdA0eTqD6t+C5a2O1rBjrlTZDKhOEZ1m8LwkO0XaQWPMKDqdINQ7HNVeNHzjAPQy4zmSnpQ+qWPZhBm/DuMv8uRJSSL/AFwKpJpo4AMy9ecFCBL1mzGrvkznQurLd7oBUWz0oSqIM0BIXp8VdaHZ8Qra9wqrsHVNRYBVh49keeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVj0DXNgY/ejvlxpkD953+hlgI/ALnm+1O/KiA/i7/k=;
 b=WJSOgy/l5fyyDF8jCedb2Iw3AeQbKenESqtd0FRhkh16teGreiZgj/82wnhi6X/5Z3DH/EM2xNHCnRtp2nVFveSFMK5eCu4dF0ekOmjDWZcUMUuEVUnj0EXFPd1t/P/cbpUZk1edL/aVVEht0DycZRwAvkRD3EIQkaaKNO6suY3tvc3bZXI7V/lX9cimcJafAGTp6KfyHQRo7HIXINFO85Pz9KJSLxK12vfI8OYigNaFwWZLMNH2OedahreWdoSuQVKUKwWVdEQUKdIktZXjHiXe8xEjC3blbOH8hdhTnYHH16lXqh6OjEz4bD/IlgCYoWBIn5o6cVF9oV7svaRxIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by IA1PR11MB8097.namprd11.prod.outlook.com (2603:10b6:208:457::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.33; Fri, 10 Apr
 2026 08:22:49 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 08:22:49 +0000
Message-ID: <958dbd9c-cbaf-48aa-8375-16e7b8f304d3@intel.com>
Date: Fri, 10 Apr 2026 13:52:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 5/9] tests/intel/xe_madvise: Add
 dontneed-after-mmap subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260409070118.2211602-1-arvind.yadav@intel.com>
 <20260409070118.2211602-6-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260409070118.2211602-6-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0177.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::10) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|IA1PR11MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ded91b6-ef85-43c2-b42f-08de96da59d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: uIjphssveQGozdnajm9Rxe2QrAZehFUhJeTnFq5SL6MSfaO+DUGpqR5FLZlNIhpFNSivqGLAAsnCufSCzx8bM0YCqnXHaIEKsLNs7Kz73PNqlGxSkqSP2EJRRLf/TlM6BJJaIgdVWm5CxZF5mlvpus7IYT6i8JWugo9YpWYZK2PCEXB/cg1vaiva3tn4HJfLZXFD+6tMuyJkDef5EOwCJgb9U/5nJNfxdRU1TK01qfGj8kpyEXtggG3HEd9IzrgCH/GDrYbwjBw/T+BIYJC3FTTLrmF8roaqlE7JE/+2PEAHSFNVTswGogAuSTKreXqjFIvHEFj1ey2Etx6dYc57CdA+Yf0pGBERcL5ZTvKfLphCl+cM+YA78Ul1MBU3CspcoYWZyvEtd3JFRlrw5n8V3ueIHJLJS1eKmFzJMRgKnxHAgCdRg0o5v2ar6ncfjEuJn+1J5PL/j7TTtwrwGobC3jGYGaIjshRpxOmQ4sT5NjA07Tbt1P9HKmnr00N0/K6asrrheVOeq2m3YYJbPcyR8I5hvzWWRDOFqmsO3PA6KpMyivla6fhgEN5TMznbv4PjGZaePKxrtqKkIuwptQbraj6Xd8AxCUYYaZMR3EkNvYxcO3GU2asllhl69VKdzMEROUXmRWFoogVhBaVErtDcAIacXiOKOPwC7BArpfUDvoWLyif9Cy3F/lORzPxRLIzGA42P7Q6YjXetjpIUxiFKkxBTs9EsFSvj0lhd9W8pzX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ync0cXNZSmgwMXBEai9nS1JrcForeDJxcnVCVU10MTZzNXNXVUhiclErRHZ1?=
 =?utf-8?B?OW5XdEE1aHp3SlA3RFVKSUZDUzlrY3BOQ3QwWjliVmhBNlVPOEttdFdhSDFR?=
 =?utf-8?B?dlVJYlNuVzdMbkhrWmVqclRsUTVaNXB5R1BudjBTVy9NRHBQSUpVa1lWR3Zp?=
 =?utf-8?B?eTFPRlZWR0RhRFZ1YUp6Z0UwZGxWYy9LcXROalJpK2ZBdmxYSy9jc2tCRlVH?=
 =?utf-8?B?SGRNRGllTlFvVG91SWdUVXloM2VVU00wYkI0RnExQ09Sc3lCWVRYcHNwQmFw?=
 =?utf-8?B?UC9LdU1ySVpJVWZUekthc0JRQzV6R1pJMGVqd1hzRVdJdkFaaVlmYXZOaU4y?=
 =?utf-8?B?S0hJRlJFSmYrUjVLaUJZYVZ4bHVLRUUzbGJXOWxsUWs3aUNNZWF0MDc3cFFi?=
 =?utf-8?B?YkxYa2hRVml5eEV3YUNUZnA5K21NY2VEdlk2dDNlU1FKS1NtSWJhNEUxWnZY?=
 =?utf-8?B?NGI4elVkYzJiVkNma0NLMURIMW9MdDFtY2oxR1RxR2lZYkRVVHo1Zk54K1Jm?=
 =?utf-8?B?NVNybkNVVFdNUzRxU0VFK25lcnlqbTh3ZmlNRFJVeEJyMWxuYzNlRndCWGYz?=
 =?utf-8?B?VlNBQXRsK1N2UWF6NlNVb1VkU0tSd1RIaWx3bGsvQksxWmRKblJNeHlGK2M2?=
 =?utf-8?B?Vk8wU1ZYOHJEeVJDSmtVTHlwZWU0ZVZ3ZlhabTEvcjBSUEpFN3lmWjlCWFNx?=
 =?utf-8?B?TDhkbUJ6b0hxT3FnRE1vZndzbEVKL2JlMThOendWSnR5ZEdkbWlySWtRUFNZ?=
 =?utf-8?B?bDhqSHV0cUYvMXhoWHV1Q1RqaHFMMjRtZDI4a04zNXp4eW91WjdVOCtLUytW?=
 =?utf-8?B?OGUyYno4S0NHQ3pYcFJnRzBvUm14T3lsZTF3cXRTbzVvQjM5TThrYitQdGdu?=
 =?utf-8?B?dUxPZ00vSHhUclVLNmQrM1hWVG9kR0liUE1zb0hFVU5XV0J4VnorQTJXeitj?=
 =?utf-8?B?RDhGVmV2L0RXWHdKZTZKV24vTDhYalFvSVVEMUl4eTZpV2krbCtDeFN4TDd5?=
 =?utf-8?B?cU41cE56WGtnalNXNFdvekJ2ODJVUGFoN0FvZFlYSS9MSXBMbEZxRHMvdlcy?=
 =?utf-8?B?MTFRYmZRNWEzRDN6QytyRGViYW5Xa0V0aW5tSVdHRVoybXQyUFlXTWwzSWhT?=
 =?utf-8?B?Smlac2s2VEcyK1BKZ1FsUGdZWFRPcm5ZL2EyMmhGTStEb2ZVZFdjQXFzcDZN?=
 =?utf-8?B?YnRpMTd1ZjNIWXlpaEs2TTd1UTRmbkMwVVltaFltMGpaYThieEpYT25YT1px?=
 =?utf-8?B?bi9XRjlDam10QURNODZQdmpYSGtSTTBhTFVZMUNUU2R1YjBKYytRQUZ0eEtF?=
 =?utf-8?B?K2MzeXpBVjhzQkR3TDBHWGtma3IraklocUVEL3VMR05yN296YzlzVGdMUDI4?=
 =?utf-8?B?d21PamtybWRYZU0rYmU0Skh0eEdmWU5WdEc1UC9ld3BWR1g5T09vNGlobVNu?=
 =?utf-8?B?bTZhRDNqK2E1NzNWM0J1S3o3Qk5YQ3drcTdjRk9vZ1REdE5pZ0NSSDlXQmNj?=
 =?utf-8?B?ODlwd2IyMEh3RlI4NUhYS3lyMUtxNWNtNzRONlF2bkJqdzloc0xwYkhOVzhR?=
 =?utf-8?B?M2tVaWtJMDcrVlhYZTJvTHRjM0F2RWRFdTFCSWp0VVNWTThab05aWlR3NTJY?=
 =?utf-8?B?QWtWTTJJYkM1cG1KQjVjK1kzTkxxd1ZOVUFTVk9YaFREb3AwVTE2SXVXUW9x?=
 =?utf-8?B?RGd5NFppMDJ3MU9xLzBFWWx4RW1OQUxaMWQ1TlAvbUt4L3ZKc3BCTXA3RGJF?=
 =?utf-8?B?aVRxNjNXQzduRmxlL2tZRFlSZ25lUEY0WWJyMmhFemNVb2FkN2Vza1NBaXBi?=
 =?utf-8?B?ZWxGTWR2VzA3Rmg0SGcrNWpLdmJkYmJUZ084N1RLU3VBMzNTaVdsS0FZME14?=
 =?utf-8?B?clA3ci9KQXY2a1ZUWFJOb0M2cTVmaXFmWm1VdDBINWo4ck5QQ0dncG1DWkE2?=
 =?utf-8?B?WmZRRGN3UjVSamZrWWl2OTNRTXpidUhEeDFzOXVFSGJHN3BuTVBFS0V4NkVl?=
 =?utf-8?B?T2xwbzM4aS9WMXRRaDF3NHd4UVZnNnBlaTZGQ2ZucTZ6UWE4WEtBb3pTeGNI?=
 =?utf-8?B?NTZXTTZlU3FJY3VWT25NUzNyTTNndTRFK2VNV1BsTExESUJuWEw1a1pMRXpn?=
 =?utf-8?B?ek10WURBUDZUN0JjWTU1SlQ4b2RncGtuMFJXT2VqcHgrNjZhUlI4bUxIMTlS?=
 =?utf-8?B?cnFTZ0xxNUFYZFJvVldiNEZ4enhpNDBKSjcrODBMUldjWUdJNFl6TFJBWHpr?=
 =?utf-8?B?MTM3a0VQZWtEaHJFZ1NPMjBSTTBSWHBqdUcwNnV2QlIxa1ZLeXRvNHVLcUpG?=
 =?utf-8?B?SXNHNzZiTU95YkhscXYxYnVhbEdkTG5vN1V2Tnd6YkE5MU4weS96QT09?=
X-Exchange-RoutingPolicyChecked: UUrTfz4E0ibg8qauOqURH2yycgXkmPxHuRcgom26YXIp+tWxeyIw9g10LGFsKFHbHwsUbdRXtrj8dr5Kf8fkcQzbLeBLy0E1/WKs6+60/jgV39ITaK1wzYhlkfna73xWnVN4aXg4OsLq+QIAAG4K7IOXa3hKnrq9fG776J6YO+aJAbQL4q8bf8huO2benKqoaAdaggrUq4hNfAwjOJp2qBr1ev/VXr6J6vOXZkPM5JlKWczIi1wnJavasSndOJhIlmECqCV1zs9Q2x9kpewDAh0Eo0nL4+7aORu967gYfwH51GZCJO9K64itf+Tlukh0zrA2iFKKx7fbzMHsF1LMQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ded91b6-ef85-43c2-b42f-08de96da59d7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:22:48.9106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nf2wQtuZdkdbqRkJaOyUwRRGWkZHyPszh0AEBFZmR037p6gqXa4FMBRd72ESB3RbqLUZ1BpIcZMxaEAkuMMadA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8097
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


On 4/9/2026 12:31 PM, Arvind Yadav wrote:
> This test verifies that an existing mmap becomes invalid after the BO
> is marked as purgeable and purged. The test creates a BO, maps it,
> writes data, then marks it DONTNEED and triggers memory pressure.
> Accessing the previously valid mapping should now trigger SIGBUS or
> SIGSEGV, confirming that existing mappings are correctly invalidated
> when the backing store is purged.
>
> v4:
>    - Added proper resource cleanup before calling igt_skip(). (Nishit)
>    - Added assertion for xe_bo_map. (Nishit)
>
> v6:
>    - Fix sigsetjmp(jmp, SIGBUS | SIGSEGV) to sigsetjmp(jmp, 1). The
>      second argument is a plain boolean savemask, not a signal set.
>
> v7:
>    - Move sigtrap/jmp_buf in this patch. (Nishit)
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 71 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 71 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 619d64b46..2d5acc347 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -153,6 +153,13 @@ static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, uint64_t addr,
>   	return retained == 0;
>   }
>   
> +static jmp_buf jmp;
> +
> +__noreturn static void sigtrap(int sig)
> +{
> +	siglongjmp(jmp, sig);
> +}
> +
>   /**
>    * SUBTEST: purged-mmap-blocked
>    * Description: After BO is purged, verify mmap() fails with -EINVAL
> @@ -227,6 +234,64 @@ static void test_dontneed_before_mmap(int fd)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: dontneed-after-mmap
> + * Description: Mark BO as DONTNEED after mmap, verify SIGBUS on accessing purged mapping
> + * Test category: functionality test
> + */
> +static void test_dontneed_after_mmap(int fd)
> +{
> +	uint32_t bo, vm;
> +	uint64_t addr = PURGEABLE_ADDR;
> +	size_t bo_size = PURGEABLE_BO_SIZE;
> +	void *map;
> +
> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
> +
> +	map = xe_bo_map(fd, bo, bo_size);
> +	igt_assert(map != MAP_FAILED);
> +	memset(map, 0xAB, bo_size);
> +
> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {
> +		munmap(map, bo_size);
> +		gem_close(fd, bo);
> +		xe_vm_destroy(fd, vm);
> +		igt_skip("Unable to induce purge on this platform/config");
Same Nit as in Patch-4/9.
> +	}
> +
> +	/* Access purged mapping - should trigger SIGBUS/SIGSEGV */
> +	{
> +		sighandler_t old_sigsegv, old_sigbus;
> +		char *ptr = (char *)map;
> +		int sig;
> +
> +		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
> +		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
> +
> +		sig = sigsetjmp(jmp, 1); /* savemask=1: save/restore signal mask */
> +		switch (sig) {
> +		case SIGBUS:
> +		case SIGSEGV:
> +			/* Expected - purged mapping access failed */
> +			break;
> +		case 0:
> +			*ptr = 0;

Here if suppose SIGBUS/SIGSEGV is not hit but mapping is invalidated, 
here you'll get segfault. Remove *ptr = 0 and club case 0: and default and

let it assert as available

> +		default:
> +			igt_assert_f(false,
> +				     "Access to purged mapping should trigger SIGBUS, got sig=%d\n",
> +				     sig);
> +			break;
> +		}
> +
> +		signal(SIGBUS, old_sigbus);
> +		signal(SIGSEGV, old_sigsegv);
> +	}
> +
> +	munmap(map, bo_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -251,6 +316,12 @@ int igt_main()
>   			break;
>   		}
>   
> +	igt_subtest("dontneed-after-mmap")
> +		xe_for_each_engine(fd, hwe) {
> +			test_dontneed_after_mmap(fd);
> +			break;
> +		}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);

With above changes LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

