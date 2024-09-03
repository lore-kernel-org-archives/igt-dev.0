Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF0FCD3430
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 08:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2332E10E3EE;
	Tue,  3 Sep 2024 08:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANKVjmJv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA7710E3EE
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725350466; x=1756886466;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hzG3W2q0Gwfq+JX/UCxBJfKZcD2bJaIiem4w2Qi38uk=;
 b=ANKVjmJv9Zn7rxzcuqaaG8f5xjwE8amagWywQjl0JN2Ey2n3NlMVLP7p
 1JoizCPruRGwwA5keuE9231aSYk4KX6i4bRhQc4RJdFlk2vtnwvjaY7uN
 JgG9q8pqDCIJj1NQgZDSjXgN1n0sge2d+UmT8y6/wreYY0rPcJQRxBw3T
 /MKd5TN/+c7ca4m3UvIHUKfEh54nGjzyORSRmfSCMD3+/CguOlQTLVWQs
 oXI4amNkHU32Ncb9kvqnwcsEQhg7bIB8qYMRveexrmgik97rjrSc6QIak
 Zytmf7nwYw36xVoyMt9pDvs91/oW/295VEB70CGat8XjnCjUfIcK1Kugh w==;
X-CSE-ConnectionGUID: yz9i0fZ/R1qVn4y46ChcbQ==
X-CSE-MsgGUID: 3lzBiFaxTqK/wwL16+JNRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="49334191"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="49334191"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 01:01:05 -0700
X-CSE-ConnectionGUID: afbzwVonSd+h6QNLNFaMBA==
X-CSE-MsgGUID: 5S/05zCoTDeMUBEr2nyVsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="65325004"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 01:01:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 01:01:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 01:01:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 01:01:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 01:01:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnJdWPZhGL5xnfK6q/rl24vtwIw72vYmj+JoV2VvNTA3LzEiXTTC+iM5OIUAKKTvDlzXsUaMJ2VdBgClud+//xbgWWGTigClUQWOFCjKOxPPMFCMXVNvXMbVQdKeYdSs1js91nIW7U03MWF/UJ5HGcmKsw8ytq8+vALYWAyPRVRhFubUsivxjJ1n84Q0tSYC4Pc05XbgGjSwBvpjqBdTPslOrPgjO59bYlLV+UoCbkjEL/vyDFuNSHMJmpkclw7UVFBSvXYoz5s2CaAUWJsew4z/mJ0L4fS/bEgkWJ1mAvNAi6Nm1SkYfCFRFZ33Q8o7DX8s7rCBvWj/uzSOHWf4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8Pgy4Juc3gfbPyCqI4+BB/LM7Z25Q3fTLmbMwwf4lM=;
 b=PEVFNX4W8MlQFOfDVHZVShZV5k62KEqecaa6N72kcNhSGijs7U/QJujsk65fJZoBxGfaN/FDjswZcfDcAadxPSoKWJP1sZ2io8TWi8p24019dq11d58gftQ3bhdHM6bEOsFQve6RR1Lr61d+ZhevE0yho/h7jRc/h5waHkslZwq4yj52JRKGRrhbvvDGW5HUNB2BBxrWrVRNpbLBEQwUgA7rfhCQjCEgscGqbob27QYYgOwigHbTb9dm5OQeByI0KhZW/0C3yIuhj4M2//mDYd1zwFxmtH2ODTlCNJ2iaX3AwhtE2HXKTIWMfR9URDZ2dJGBbBAiFsub8F65U7REZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 08:01:02 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:01:02 +0000
Message-ID: <068e4c76-6db1-4bf7-9dd6-607ec7b25e99@intel.com>
Date: Tue, 3 Sep 2024 13:30:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/kms_3d: Add more logs to skips/failure
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>, <sameer.lattannavar@intel.com>
References: <20240829065252.1014292-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240829065252.1014292-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|BN9PR11MB5276:EE_
X-MS-Office365-Filtering-Correlation-Id: ba906069-f588-4836-5579-08dccbee8db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1hvVlR6MVNaVE5nSGNwS3JBdUE1YzYwUE1FdTJGNGJCK0QzbmhpWUEySHRi?=
 =?utf-8?B?bzdGekJrbCt0ajFLNkpMd0hZanBvT2hPRWhyVGpHOHhPSGNZOGliQXpqazFG?=
 =?utf-8?B?TkhhVGgzYzZpOFZPdmNSUEFNUWVLTk9leFAxTFoySVJnWWlCZnQ0M0pKMExl?=
 =?utf-8?B?VDF6YU9vVy9YYmZzSmV4bjZDY2pTNUlJQWRHU09MTXBBWitPUCtoaGdXQ0lu?=
 =?utf-8?B?UWl0UyttZk5kdWRWZXoyaVVvdTNTV0loYk5tOVAxRnA5NmpFdWJiYjZGaTRQ?=
 =?utf-8?B?K0NoVVJub2M2cEJrZE5QUzA5TTVtN2h2ZU93b1p6b0NranFKek05a2VFb3Rt?=
 =?utf-8?B?bStndzl2M0M2NHczSFBnSmhqVjAwMFFNTm5UblV6VFBJcG9yVEpDczIxczRm?=
 =?utf-8?B?WHlXUFlhMUJHandLU3VCNnVTOGdXemw3ckNZZjlFSXhlMDhQcEh6aXVzZTg5?=
 =?utf-8?B?d0RYM3lyajc1S3pEVzdGNDlsM0pEbjBYZ1RteE8yZ0htZUk3dHpaVjNVaXlW?=
 =?utf-8?B?WCtweEJxMTdNVlZTa2FkS2VvU092a1BzMjVmRXdnSkJoZEgySkEvandMd0NX?=
 =?utf-8?B?QjRSMnhPNFg0RFlRNGZCL2Y2bTR4bnZGTGJ5YVNaOVNndWpNU2VQSXBpbzB1?=
 =?utf-8?B?ZUtWbDJNSGpveEwyMGY1YlhpdzV2aUppWjZRMk5LdjRCcFRzK2hQaGJ1ZTNx?=
 =?utf-8?B?UkJRQ2pxWDM1SmVjV2dEN3VxRVM4dGpuR1B2T0F3cUJXdE9YbVMvMUpSaXEr?=
 =?utf-8?B?a2RNcHovK00rUGM2S3QwN29qQ2JYN095VjFqdUlGbVdBL0RibzV4czhaRFMz?=
 =?utf-8?B?bzIrSkl1Q3pPSjBzc3B4MU50NkRGSEZQckM4QU42RDJEWkkvbEVWblpxQ3FT?=
 =?utf-8?B?K0ZHbkVNekZUZXRoU3h3cnIvM1FpSG1jVjROR2J2WEUyOUl5UzFyYzJQUDc1?=
 =?utf-8?B?dExGRjNCYkhsMDVmbXQwbzF1ZzZMc3RDUlBXVy9IeC9QUlpwT0RCZU4wbHF5?=
 =?utf-8?B?bzBIcllSa3kvVnBDN3JDVm1Rc1lCd0NrMHdzSGdkZ3dNeUh6TDdOQ1IyR0ht?=
 =?utf-8?B?MnE3WkMwbGhPRkRVS0t3bFhvVFRlUmE0RTVaVjV3RDJFQWhaYmF5a2UxUmFB?=
 =?utf-8?B?UE5mY0NUeTlVYXh2RitWUDB3SDJkdnFOcE1nSFBCSS8yYXQxQVVoR0djMnlG?=
 =?utf-8?B?eUtYM0h4bnBORnJLMi9lTkxkbFdYakpjZmJKNStTS3VXMmtXaXphUWxrMXRW?=
 =?utf-8?B?SkorTnlBWGlPdndyKzdORjF1dmZMWWU3N0VKdU9qQ0FKaVRQdTYyKzFqUWpZ?=
 =?utf-8?B?RENaYXFFQVFsRXZKZ215MjFUTDQycFBGdzFvK0FYV1U5eitTZVNnYythWGVa?=
 =?utf-8?B?Y29OUG9RUHVjbU1YazhIY0dnMUQyak9jWXI4YVhncFBkQzhxUWJET3VlSHRR?=
 =?utf-8?B?WU9QeGRUNDgrcEUzbUsxaWNSM0JvRFJRNFpmTmVYQnNoTERoUmxpZlhtbUgr?=
 =?utf-8?B?Wm14Wkl2eVVBaUNsVktQVStqMENnZXVtNFJ1aEhjeXF3am9vdUE2Z2JmdzFk?=
 =?utf-8?B?YlVURERpU3BVNXRpdDg2S29YNXpNRVBZbHpoOFhWckx5RmlBaU0rZjZVdU4v?=
 =?utf-8?B?aWZZYkFpb2JCSk9kbHpMVnZuV1NqdFp6Q0xYdVlScGEzaEQ5OWNRYzVueFRF?=
 =?utf-8?B?WTh5N2RJczZTNzdDcHkwYURqYUZ3RTk4OU9VVHRRM1N4YXF4OWR0enJBTURL?=
 =?utf-8?B?cHNNMUFicTArTnc2M1JnMnRFTzNIRjJxNGJKUTFNdE1UQ1ZuVldxS1hGQUNT?=
 =?utf-8?B?am1FOGp0bk5BWGw3OHZldz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0x5dDZHemJjNDl2Q2NFRGVGdDg2NmVMd3h0bUorRThaTktGNmFJMys4UGZ6?=
 =?utf-8?B?eGswV1hRU2srVTZOcWNHa1lYT2o5V2VHRm1VMWZNL0ZDbGFYUXFkZHRpVE1M?=
 =?utf-8?B?dSs5UXE4Q0VWdnJxWEJsRXZjVHJUTmtwVmtGcWlUV1liQ3BtUWFVbmxKcjk3?=
 =?utf-8?B?R3pYUnNFLzZnZXhtSzlBcWN2ZzhrL1lQaEd3TStYUmJkaUxScmpmb2JhMzIz?=
 =?utf-8?B?ZFBQQThqQ3lrNkRlOE9FV3lUQis3aFRyZHBoMGYxM2s1YUd1ZkZwdWJ5YnBn?=
 =?utf-8?B?bTVhdG9tcXJ6ZHcyWFJFOEJBWnlmSWNSUFN0blJDUU9MN2dGVU9YRGJWSWlC?=
 =?utf-8?B?WGJCcWQ0aGF1VTJIcVZScUlZSEdKTDhxV1ZHdWxkWExpcWVXNXh3YXFnQzdR?=
 =?utf-8?B?RHg3MWN3YjJ1OVhhcnNhbnFaL0ZuL0FtOUx4MnZ3UkdpLy9nMjNqWWt3NTBx?=
 =?utf-8?B?bTV4bnJRZk45SzBHSUZNSEJkYlIvbGE2NitaRzBUSEdSY0ZxaERrZTQvVlFa?=
 =?utf-8?B?dGgvU0trNjJQOUNSaVZPY0FiQkFZRHJBbUlPYllxZnJhSW1aVkttQW1WR0hq?=
 =?utf-8?B?eTh1cDR5WDJ5U0FYQmpaYktXVjNPQlI3ZlVLTU5ZZzZKU0xRbUh0TkJCV3Rx?=
 =?utf-8?B?QytucldmbURPVmsxVktFdG8vR1ZxSFhvQnJRZlZkZExDY1ZFbGIzbENxRE5I?=
 =?utf-8?B?aEFyS3U1bHptM1ZjT0F6NjRYSHU4R1BGL0MzSjlzVDBrR0l5WVdCUXdOTGx4?=
 =?utf-8?B?Qi9laEVxeDlrdmNsWTViQUVHT0FoN21uRGJDM3VoRFEvbkhMMHM0M3hXUWJT?=
 =?utf-8?B?MS91M0NaSFAxT0xJY2gwMENpM3A5cTcyU1NOeWY5TjBqcFhyUlYwb3FnQnRn?=
 =?utf-8?B?enJjNmEvMlJCYmx0WS9xcVVDbkhzcTQxeFJDUjYzRGtqKyszdHFSWkN5TEdO?=
 =?utf-8?B?T3B5bDY4YUlGWmMwRG50NHF4VVJ3SStCY0Q5SWFwYmtxNkxwcFVmSC8vK04w?=
 =?utf-8?B?azE2eHJGcTQvanRPTDZhUHJtK25Hb1VxeVNHSXNVWVpHYWp5RUgvVmZCbXRj?=
 =?utf-8?B?SW00dHhwZVlGRk4xMnNLZjZKVm51SWRORmdSSitIKzRucjB1MEhhN25WYmdD?=
 =?utf-8?B?UGM0TndIKzRVVnRJOFBZU2JpUXVGVkpsbmZXKzFMVkRvMkwwQWJGbHpNdGVl?=
 =?utf-8?B?dW9POUxBV2V2RGNnMERoeFY1MDJPWHZ5Um9ESDZZY1JkdFJVcitpWjZwZE44?=
 =?utf-8?B?ZDFWL2JWVFU3YTZnZ0dZVWtJQjlERmxlOUcrMTdzRUtGUU42cFR3TUUxTTlp?=
 =?utf-8?B?SGVyWUZ1UjZXMVduRHZBd0xvRnl5SmZjZjRRZk02Q1ZDTThNY0xsU0ZGSWt0?=
 =?utf-8?B?NVhhRXVvK3RUQnlLcWpKV3JUQWozc3J0WHpLaE4wWno2eUpVcmlRTG1YSlFy?=
 =?utf-8?B?SDJ3Rkxlak1jcnlmbjEvbkI0ZG5LSkk1VllUWWp6R2V0aEo3R0NBeVpkSXRo?=
 =?utf-8?B?RGJYM2lSV1FlNEZQWkM5NkI2Vk80M0FIbGo3Nm1qa0V0NVpXUUFLaFo2SXBs?=
 =?utf-8?B?cloxUE1pYWlOVGZJbi9yeW0rdVQwdHNEcGlXT2loOUJqeDR5cUN1R1RFVmNS?=
 =?utf-8?B?emZobkxrNDBHZytQdUw3ZjQxNnhrUnNpVjRwMWw2ekVvU0NoQXFMVTBQa2M1?=
 =?utf-8?B?SXMreGVPcE90R2ZTeU1pNUJsU1k4bnQramhkZWJhSTZYVEdEWkZCSXBNRlYz?=
 =?utf-8?B?WHVtT1dMODJjTGZidG5SM3ZVa0d6aWRaNERpa1BMK3h0MkFid3k1Z0dpS0Er?=
 =?utf-8?B?bEhQN3JFWW9xbEdqaUNaNmNNemtXcUFNMWVDSUZlSUQ5eElaQVpBTUREY3VK?=
 =?utf-8?B?d3VFa3pKdW9XUkMybHNlZnlTZGpRbWhUWkY5M3IzRVNFVDhhL0w2MnBKNEJK?=
 =?utf-8?B?VFJ5VHUzODNMcDgzejd4R0t3cXhjVk5UbC9tOThObC95c2lnVzJ2ajJaQkZz?=
 =?utf-8?B?SkVKWDRpM2lIT0JXSEJOTFhyVUtLdWhuUktKT3BUUmZpSUxtT2hZdHhrZzZt?=
 =?utf-8?B?WnNRZXVkSlF0NHFKT3czbk9OeG5qeWMrRk1LSlByYVp4ZmFGRFdlR1hOMDdC?=
 =?utf-8?B?VnJGZm5vMjRGWC80aWpoeGY5d1VsMVY4b25MRDJVYUxEQTRIaktha09VdzVj?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba906069-f588-4836-5579-08dccbee8db8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:01:02.3722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XnpMbjsJB+lvc5fyfgNQXcv75jMHKSgSIsFoPjZTBmJsOkIfrik68lxi3JQDSDw5nPOU8CBCLzMIHVDivwi9SrCaTxPjayyS3gvK4WFSVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5276
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


On 29-08-2024 12:22 pm, Pranay Samala wrote:
> Having some logs for test failures and skips would
> make debugging much easier.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/kms_3d.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> index ad6c45e9b..f1726b71e 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -55,7 +55,8 @@ igt_simple_main
>   	res = drmModeGetResources(drm_fd);
>   	igt_require(res);
>   
> -	igt_assert(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0);
> +	igt_assert_f(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0,
> +		     "Failed to enable STEREO_3D capability.\n");
>   
>   	/* find an hdmi connector */
>   	for (int i = 0; i < res->count_connectors; i++) {
> @@ -65,7 +66,7 @@ igt_simple_main
>   		drmModeFreeConnector(connector);
>   		connector = NULL;
>   	}
> -	igt_require(connector);
> +	igt_require_f(connector, "No HDMI connector found.\n");
>   
>   	kmstest_unset_all_crtcs(drm_fd, res);
>   
> @@ -85,7 +86,7 @@ igt_simple_main
>   			mode_count++;
>   	}
>   
> -	igt_assert(mode_count);
> +	igt_assert_f(mode_count, "3D modes not detected.\n");
>   
>   	/* set 3D modes */
>   	igt_info("Testing:\n");
> @@ -95,8 +96,12 @@ igt_simple_main
>   		int crtc_mask = -1;
>   		int ret;
>   
> -		if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK))
> +		if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK)) {
> +			igt_info("%s-%d: Doesn't support 3D MASK.\n",
> +				 kmstest_connector_type_str(connector->connector_type),
> +				 connector->connector_type_id);
>   			continue;
> +		}
>   
>   		/* create a configuration */
>   		ret = kmstest_get_connector_config(drm_fd, connector_id,
