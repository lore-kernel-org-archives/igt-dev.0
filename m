Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8E6D75E22
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 10:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB8D10EB4E;
	Fri, 22 Nov 2024 10:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igFpxZtm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E687D10EB4E
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 10:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732272222; x=1763808222;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=z0Dca7MmCsk9heeNVwylkYrfSDth2x5WEP7FUoHXQyc=;
 b=igFpxZtmcj+BvdWEHDBKW//e+22PGtQ4n4QfKURQcUi7XdIvJ1baoEVb
 llX1/lkfvJVo3MQizdU3zPkMDRap35/EM7Er+fu6USD3szDF6j9f71OkM
 qgHbh3R/n6O1TmbKKi4PUyQRcR5gq0piWnAhdLh33T2vNHm1284/1m7Xv
 ft3rkifqTiI52e32feU+Eil9iHwmmZcykbOOxYBidYaq8V8Beddbe6EeF
 bjRXsXkdVVSbsJdPyzxJqM4MzgAiGJnyL4g6083g4TnKEFSlDlsQ12vjs
 i+2icjZ38XvoDlgX5Jajiy3rwni7OprOVkP5OzoWZDCKKnFa5r3N21rSd Q==;
X-CSE-ConnectionGUID: iet+jnNfQqqLqdUY12B8HQ==
X-CSE-MsgGUID: /eGGtnnlRM2Er7EsMsIZig==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32281306"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208,217";a="32281306"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 02:43:42 -0800
X-CSE-ConnectionGUID: +NlPx1r7QiGTI6DcP3Ci7A==
X-CSE-MsgGUID: kFjruDClSRmx6Pn6ZDFctw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208,217";a="90522697"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 02:43:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 02:43:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 02:43:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 02:43:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLUv2UM61Z+NKjuN0QbXxLAMroEL4GOMraNIlfrpx7ukKt4nK4lebL2WsWExUu4GUj7jr2t9nn6djlHzxStKuUQ+dJk2wx6pth0KPaRVv9McQnWOMviflfwP7g9MH6aenCvbe5P7ZNSV6ddqYNad+dktSFY7eLC1yitc/7dYXZqtMn7EVrl+YMC1iyMHdj6mufPlyku5ZhXeqNOoh4AM370O+RKcfMPHaS/m8M3uc+cO44mZWrSi1OPaIbbnGWY95RWsd8EtACJU2c6s6/Pnbbc1PYWyEY+uYOQY92PyYAEZnANrA0TWvYD+XAQEpy55ySmn+1KRiYnQOOJIxF3Xsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AExkAm97fR5Ph3DkngkozFyrA9zwN2H4/dOOKWRr+fs=;
 b=gM6Eu7HwotdnWerIiNfPaSlzj4PtjMSHzL2UD786mtopFi/iRgX7qPEOsNO6hKxPtu5mlQKQxNsKsXxc0RD9Sw+4HWwZQfBRz1vRW0L6a/0D+mbbgrmmJ6uscB/9aS3pJd68QE61oioTNlnVtZSIjNe1jpm1b9+DdK7+QP0l2iR02IzwdBOYcrtttwiqLaP7cXnNgtvRRRIH5RBZS0w2sj2sdMgFqv21QGozI/NZ6L2pSXyDflWkvL3xEjja6t2spGWmKkiSdCA7J5oh2y2w7N/eD1O5/lLcqEYI5kJdIpCjhDUeBZr67zI2K4x02uy2UQrvIrBAUzV+uVpgRYqDGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by LV3PR11MB8694.namprd11.prod.outlook.com (2603:10b6:408:21b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 10:43:38 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 10:43:38 +0000
Content-Type: multipart/alternative;
 boundary="------------cllSVayKQpwvvsJawk1hXb7p"
Message-ID: <ab09af6e-7c79-43b8-837d-cd0cae309635@intel.com>
Date: Fri, 22 Nov 2024 11:43:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 4/4] lib/xe/xe_sriov_provisioning: Iterate only
 within valid PTE offsets
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>, <michal.wajdeczko@intel.com>,
 <michal.winiarski@intel.com>, <narasimha.c.v@intel.com>,
 <piotr.piorkowski@intel.com>, <satyanarayana.k.v.p@intel.com>,
 <tomasz.lis@intel.com>
References: <20241121141851.631877-1-marcin.bernatowicz@linux.intel.com>
 <20241121141851.631877-5-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241121141851.631877-5-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|LV3PR11MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e9d8b9-e4e7-43b6-12a4-08dd0ae28608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUlpNEI1N1VPNjBuMGpwcUI4TFV6NjVUL2ROUDdnck1vRXdnOERFYUxOTk12?=
 =?utf-8?B?R1lGc3RIeEZLWWRYUWVSa1pTcmRCU21PTEZlZkJPcGhiVWVzL0VVb3B6NlZB?=
 =?utf-8?B?OWoxMExUbDZHdlVXNW5LVHZMTnB2OHdvbFhseXdZelBjbjJ3QWtkRi90VEZW?=
 =?utf-8?B?U1NEaHhnc1I0S2E2MEVVTUE4M2pwRGV1ZEtTRXFNRGg0TXMvY3NmNUZKdGp0?=
 =?utf-8?B?VTFUaC91Tk5acmR4VEVKYUFJbjV0ZjQySlNySmlJbzY1TlZUL0Yrd1NCNVNp?=
 =?utf-8?B?VGxFU1pSalQ0bXdJb042andCRWxnR2JSY2RWakJtdlFka0VSdkcxSnoxL0JW?=
 =?utf-8?B?bzVDQko1QktZNjdHZXhDNURwckdLWGdZb1hLQ3JweU90UXNqMzRIUEtrWUU0?=
 =?utf-8?B?L3R5TFZHRHhYbjNGQjYvdFRkZDMvYjR2THpOS3FxbWE0YnZoQ1plYTAxUk1S?=
 =?utf-8?B?bDMwejRWWUROT3ZIb0pqRHpadExNbmw5TUo1QisrTldmc1k2Q1ZMRFpVSk8v?=
 =?utf-8?B?MEswL3BFRFNRQlN0Y1BmMS9yU2FVZ2JCdjBITW01RG43dVgzSVIraU5kSnVC?=
 =?utf-8?B?NzUwZldpMkwzMjMza3NmZEp4NEZRd0VKSTVSM21mNEVnaTNCRDB1VElZMk0x?=
 =?utf-8?B?VzFjbFJFK01sR0dMN1BTcVlSNXJoc3QzZldPQXJYSXBKQWZ6SVQ0QU1Qa3pQ?=
 =?utf-8?B?OFlBdWRuSVVqNGVqS0ZOeDcvTDlkMzZMVHJHLzZ1QVFZR24wOXFtWklFa0s5?=
 =?utf-8?B?b1RQNXNzN2ZmTW5WdmRiWC9ZREgxUFhWTFNvMUI4T3l4dUV1OGJ6dkpTSy80?=
 =?utf-8?B?R0pNY0lveU9wWm05MkFScVpHWFBQeFJuWnBpd1BIQ204R1hNR2QraXVGYTEy?=
 =?utf-8?B?MGFvL2dyS0pIL1RCcUwrRWNhVHZSRjRJcDY3a2FQRUVtc3U3QVZZS3hKL1dn?=
 =?utf-8?B?UGFmc0M1Z2NYS0lHNlFmYWNCYVk4MC9ZcUh5MFBCS04xVHUxQVd5cWE3U3lp?=
 =?utf-8?B?dUlMd0Y3cSszM2dJNEQ0TFQ3WjJNbHEzQ3pPSjU1V2Q5TG0rU1NhUXNyOXNr?=
 =?utf-8?B?QnJVZ0VZQ2loNVBIWnhseU54UEtWN1U2UVNWUTFYbGEycTFZeFVUM0ZqNnNr?=
 =?utf-8?B?VU9JQlByN2NmTW9SU3ZTRmYzSGw2VURQd29xaGlEa0FTejdFRTIwTXRuL1Ex?=
 =?utf-8?B?WVM4R0VZeEFuVlBjZE1uaGFZeDh6TE1IWisveGJzcjBVZ0VVWTQ3VVBIazlo?=
 =?utf-8?B?aWsveVhEUDNmaU5zSEJKdi9zVjFwaWlTT0djZUVSNldEOXZrQ01xT2lLdWtB?=
 =?utf-8?B?NCtSMng3VlRuMGdYYWpkam9NUy8yTExkV0h6c1FrVkMrWmpqYjYwWXlXb2dq?=
 =?utf-8?B?RWVNK2Zkck84Q0FESUEyVUpYSEQxczZ1R1hpa3U0YlhBcjVmUzJJWGt6RGRB?=
 =?utf-8?B?Q2VKMGtBS1BBMHVmNkdONTd2RzdsTm1qeG9wZlduR0JzVHdKZlo4b2VSNzNj?=
 =?utf-8?B?eEYzWmV5SzdrenUrMUg4K290YUwxRTZmUHoyRXJ3d01BdHpzWkl1SXVhNzl6?=
 =?utf-8?B?cUpESndRTk9nTVE2eFV6NFVWbE00WXdWakt2ek5ZWGVBeW12K2pDRXdmdEVJ?=
 =?utf-8?B?WXRub0V3eUVKSEcvZlJaVnFFQVNYYkJVTHFZTlNuTUtVQmllTUlaZXpuSVpZ?=
 =?utf-8?Q?ypWTiuUodH5vXlnn6N1Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkNGUjNCSG9yV2ZRVHJSQVdlV0hPU0w0ZDk3MVVjMTNZNTlyS1JyQ2h3WHF0?=
 =?utf-8?B?U3dRL2pvbjNaWnhoT1JmM2owOUZPd2ppTzFSY2hoWkdJNTA3VThIK2V4aWFa?=
 =?utf-8?B?SFZ4UkpTeG5jamNteWVqSDYvbGZGSW0yKzRHbXFsbXh4SWcwUHlpT29xdkRT?=
 =?utf-8?B?WC9DMy9pOGN4eHROVzVBOXBzZjNkeitaeCsxTmVlczQ5VCtoSkp5Q0hyaGI2?=
 =?utf-8?B?alU4ak9pa1pDMHlKRW5rbGdCMWswQWdNT3pBSitSMUIvK1JtVjJoRTZiRVpP?=
 =?utf-8?B?NHVnVmRyUEZaZktWeDhzalVkZ2JGS3djVVRibVY2dytNVGVudk12bjVhS3I5?=
 =?utf-8?B?SFU4dkhWczlMdmRIQUdqSmUwbnpXN0FCVkQ2bVhHWmM4UmpKUENiL0wxb2pj?=
 =?utf-8?B?QUc3QkJuZ3dXRko0UElGWndPZm9YbGFIT3RVdVNjVTdPajBCWURmUlJOQ0d3?=
 =?utf-8?B?T0V2dEtIMjBselQwa1l3eVFxMEFzYnBZZjlTYkVyOWgrMTRXcVViVkhRL0ty?=
 =?utf-8?B?ZUJyRGhtSjlNVFMxMmg0eWJ6NFZLbGdEN1BtdUhobE9CWXArUnc1NGdTNjFv?=
 =?utf-8?B?bmlPdkVYZmJLUkZEYzdUWE5PWjlObDFhb2NzSWQzL0NGZ3ZtV01GZGphSkJh?=
 =?utf-8?B?NEVyY3BIbW1ncGd6c2llOUFvYlVLRmRLUGZLYWNkTjN5T25SaWRSQXYxWUd5?=
 =?utf-8?B?eFB5OW1pN1k4WEVzK1VEOS9GM2JIRFo3Y3lSNGowYTh0ck9XOGhscHp5VzN4?=
 =?utf-8?B?dHh3M056SEtMVVJkZFFkVUlLYXNtYWJ0NGhDYmhYOThTdFdSbGpTY041WVFY?=
 =?utf-8?B?WWl6VmV3OEI2dG5qMHQvK2dVTW9WdEhxdGs5dTE5RTNZcVlzUTBRZGI0L3lm?=
 =?utf-8?B?dFNjaXQ0dnNhNHk2ZStqODdrTlhRSmh1dVlDZmtiNVNnaitWV1oyaFRLZHZj?=
 =?utf-8?B?QnJpVzdXM1lZUEpJTVlDZi9SSkZ0R1IzWXFtYWdQSFg5eGcrdW9hZ3JDWkth?=
 =?utf-8?B?R1JjYlRvanVDWVJIeVAvOTI3clNMbGUrKzJZajZmM085ZE95WlR0MjlmRjVw?=
 =?utf-8?B?RnVOazdQODV4ZnRCKzBtV3l0N0pyUlJVM1ZiS1ExTEgwY3E3Sng3ZlVsZmRH?=
 =?utf-8?B?eUxrWjFoN3l2ZElOU2lmcStxMzBnbDF5LzFtd3NjMElWZTkvT245UUdNenRx?=
 =?utf-8?B?YjNLd3lENC9TNU5vV0RTSlhva2xmdGk2VHBlc0wwcGY1dTdaS0VTOU13ZXA4?=
 =?utf-8?B?VU8vRGZJZFQwcUNTWmc0SzU1cjlqK2IvT2hLY21Cd0dTbnpKcGtXTk8yYXZ0?=
 =?utf-8?B?MDFqRkIxd0JEM0xuazhWMjM3YzhjMStyTitRUExFdytuREthMlNqdm5WT2tL?=
 =?utf-8?B?Ti9yYzVtb0pCNW9ibG1PbStkMXdYbDVrYXRhOVptOEdOWmpsc2tuRkFmWWhS?=
 =?utf-8?B?Mkk5L2R2c25Ib1VxbkxJRy8rTDY5VVdQZFhXWSsyVU4wT0U2NFVaeUFMdC8x?=
 =?utf-8?B?OWwrMHQzMWtkT2k4WnpEMGg5YVRnV2hOS3VTS09YTXE1c09BamtOTk9WUUJm?=
 =?utf-8?B?TzVlNEJqdU5sblcySitVaC93WmVGblpHYTlsZ0VqMVk3OFJRY0JyQnl1UWFI?=
 =?utf-8?B?amc0eExGQW5KL1UrNGc5VnJUMis4ZVBoTVl1WlB4eFRQZXYzemJkY2Qvd0FM?=
 =?utf-8?B?R2RQdTJpNnN4VGl2cWpQZXlCNU1tVmhOZklwSXE3eEg1MzZaQWwzaSs4OWhB?=
 =?utf-8?B?aVZDdERSRVl0MXZzdnBHc2liVCtuYURsUVJnNHZiYmphL2RiUHRmT0JNdzhx?=
 =?utf-8?B?VU84Y1MyaVBDeGdISWM4YklmcnA4QU5pUk5OS2x6STFibFh5NHBQVWdkWXFI?=
 =?utf-8?B?dEJJcmF6bkpQb1FDSS9NeGYwRmViaE5PVEE3QUc3YWpadUhhNWhETFBUdjRZ?=
 =?utf-8?B?b2szRGNpVEtHaU4rZHRqaFhIZkR2ZDRlTU5YWHpqR0NDV0I4cGcxbE1nUW1N?=
 =?utf-8?B?Mk1ZZFgyZXRhMktMeHVBN0UvVldORVhFNXBDcTB2eTBXcDkxRmlKaXhMWTNP?=
 =?utf-8?B?ay9JRXdwRG9HVndVY1dHdUw4MjcvckhJcFVrOEd3bUZOY05FeFRBL2FVQ05H?=
 =?utf-8?B?UHgvVDVuWkRQREJlcHJhaXF0UHROY25GYU41T29HMnBONUNldEEzdUlYYkg2?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e9d8b9-e4e7-43b6-12a4-08dd0ae28608
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 10:43:38.6244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pvj0EnoffzgCZLPNn7gcHHSEz+yUILpc45an78FaWApyu3VRKMsNQNaTJCLX0KME3xWiB4Yl8ieefaenKS3tnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8694
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

--------------cllSVayKQpwvvsJawk1hXb7p
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/21/2024 15:18, Marcin Bernatowicz wrote:
> Update range-checking logic to iterate only within valid PTE offsets
> based on MAX_WOPCM_SIZE and GUC_GGTT_TOP.
>
> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3507
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: C V Narasimha<narasimha.c.v@intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: K V P Satyanarayana<satyanarayana.k.v.p@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index d448a53d8..67ae9cf54 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -39,6 +39,10 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
>   #define PRE_1250_IP_VER_GGTT_PTE_VFID_MASK	GENMASK_ULL(4, 2)
>   #define GGTT_PTE_VFID_MASK			GENMASK_ULL(11, 2)
>   #define GGTT_PTE_VFID_SHIFT			2
> +#define GUC_GGTT_TOP				0xFEE00000
> +#define MAX_WOPCM_SIZE				SZ_8M
> +#define START_PTE_OFFSET			(MAX_WOPCM_SIZE / SZ_4K * sizeof(xe_ggtt_pte_t))
> +#define MAX_PTE_OFFSET				(GUC_GGTT_TOP / SZ_4K * sizeof(xe_ggtt_pte_t))
>   
>   static uint64_t get_vfid_mask(int fd)
>   {
> @@ -112,7 +116,8 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
>   	*ranges = NULL;
>   	*nr_ranges = 0;
>   
> -	for (uint32_t offset = 0; offset < SZ_8M; offset += sizeof(xe_ggtt_pte_t)) {
> +	for (uint32_t offset = START_PTE_OFFSET; offset < MAX_PTE_OFFSET;
> +	     offset += sizeof(xe_ggtt_pte_t)) {
>   		pte = xe_mmio_ggtt_read(mmio, gt, offset);
>   		vf_id = (pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT;
>   


LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>


--------------cllSVayKQpwvvsJawk1hXb7p
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/21/2024 15:18, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241121141851.631877-5-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Update range-checking logic to iterate only within valid PTE offsets
based on MAX_WOPCM_SIZE and GUC_GGTT_TOP.

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3507">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3507</a>
Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: C V Narasimha <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: K V P Satyanarayana <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 lib/xe/xe_sriov_provisioning.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index d448a53d8..67ae9cf54 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -39,6 +39,10 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
 #define PRE_1250_IP_VER_GGTT_PTE_VFID_MASK	GENMASK_ULL(4, 2)
 #define GGTT_PTE_VFID_MASK			GENMASK_ULL(11, 2)
 #define GGTT_PTE_VFID_SHIFT			2
+#define GUC_GGTT_TOP				0xFEE00000
+#define MAX_WOPCM_SIZE				SZ_8M
+#define START_PTE_OFFSET			(MAX_WOPCM_SIZE / SZ_4K * sizeof(xe_ggtt_pte_t))
+#define MAX_PTE_OFFSET				(GUC_GGTT_TOP / SZ_4K * sizeof(xe_ggtt_pte_t))
 
 static uint64_t get_vfid_mask(int fd)
 {
@@ -112,7 +116,8 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 	*ranges = NULL;
 	*nr_ranges = 0;
 
-	for (uint32_t offset = 0; offset &lt; SZ_8M; offset += sizeof(xe_ggtt_pte_t)) {
+	for (uint32_t offset = START_PTE_OFFSET; offset &lt; MAX_PTE_OFFSET;
+	     offset += sizeof(xe_ggtt_pte_t)) {
 		pte = xe_mmio_ggtt_read(mmio, gt, offset);
 		vf_id = (pte &amp; vfid_mask) &gt;&gt; GGTT_PTE_VFID_SHIFT;
 </pre>
    </blockquote>
    <br>
    <br>
    LGTM,<br>
    <span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
      <br>
      <br>
    </span><span lang="en-US"></span><span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------cllSVayKQpwvvsJawk1hXb7p--
