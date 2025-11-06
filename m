Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D38DCCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 03:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E9B10E004;
	Thu,  6 Nov 2025 03:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+Smu94d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8CC10E004
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 03:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762398128; x=1793934128;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XiKYMzQ9lNhqU/1eDPVzZLi6jTVpThcDFqTewHTUFwo=;
 b=R+Smu94d+AP4a6aKJDJ3NqLZ8MkObqu1QaREx1GOMAxJBXfqWJbFYDmM
 ABkETfDJEh4M24+5p4YuEwwImOoYCmQm3557wmlZbQSxPnFVpma4d6nsw
 5VA2DW6y7ikx75WWGjPDf9Y5EOYMAXHa5Tp8gks9bU/ZZ9hEjajkeWjV6
 5hlIfP9DqGMPOGdmV8jKHmSpTIj+4TRWddOYPCkTV7lN0UOwRm97nrH/y
 u/BQEYecz3ESxSy4yrdjaT45URMK/2IReX0z51FFFl7TFmEyk1kkjUeDH
 U5KXVhF8gz8KR24lWK/hR3qFTL4GD6LMzI31TP39WhSmFqTNhbizc5+OR w==;
X-CSE-ConnectionGUID: c0CmhDbuRy+5Ve2Zf+H4LA==
X-CSE-MsgGUID: 2lUEfL6+Q2mhVSpzkqZeCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="74819297"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="74819297"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 19:02:07 -0800
X-CSE-ConnectionGUID: 0AepNd44TsCWbjc5FeUGyA==
X-CSE-MsgGUID: H6hy0KUeRKuG/xPwfZQU5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="187581731"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 19:02:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 19:02:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 19:02:06 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 19:02:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATbrl9ZipW1ANy827F/XZVw2puqFdD/gpFFb1+1fywkYVH6AIdiVjbFfM9GWk/rjoAT2vxV4qRRgo7s6QVDkzIw7pjArkq3KWxl7ichazaOTu2/LVal9VIqjG1brp9VSj8JXKhKmdebPgpS5E9+gjE8zX3G6KE/mJc7IT27vcNtTjKfUoU6OZNVR29NWU5hrR+xj5npC+++Fc888HiaG6HkqEe0f7+130NeW7k3VQsa9tjzEgjGl/TuygfuHDO3hXTNE6Q7yX3ja53lyz0IU0MM9V2JNmpTBWn9CQ5zyMUYwxDaPwgVfYnC1ED1SYYN8H26cJFb+hRm2QsRHgALFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ulu6E0RP0YO3FECy8rB67qG6GYnOtq9sg3llokeNpp4=;
 b=JzNzxi/dAYfgidYmJwqf8Zq1DVdisHekGNwFgbwFfgWR5xGIpNfp+ehwy/pVT1i8EpeykYpfdZ3gZea1rDn/Paqvntp0b2P5Pj0k4Sbf9HVuHZDqDVpK4wL7tl9WC4mSi3owsQ7ZYWlGCZifA70PwKmGdgPsUgcggvoZL6dKZkiXlX85a1iqHRHj6a9rcp0wx1lFhGTfO8W3CqtGf/fWDTbqgraHnssWJASC6/5SaAydEwZOvBCfzYUuiTBSe5nW8/Qam9GW100MdifC+tPdUr+xkde1R7fXvRMKjuR1q7O9nmol2EHxrMlz+5h0BcMZfz8Lok7Bb4pwJWWyLzfdFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 03:02:05 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 03:02:04 +0000
Message-ID: <c6824d74-709c-4edc-81db-e935158ad5af@intel.com>
Date: Thu, 6 Nov 2025 08:31:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/pciids: sync with kernel commit 5e0de2dfbc1b
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
References: <20251105185020.261265-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251105185020.261265-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA2PR11MB5051:EE_
X-MS-Office365-Filtering-Correlation-Id: 951309d1-b17f-4981-a6a5-08de1ce0dd50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXhUQ3ErcGg2bURGSWNZdjZVam1WNzlzN0lPR1lFSHhaeHFDZ3FUSlJ4T09r?=
 =?utf-8?B?VW5EUmVVdi9RTVJRS0NOQUt6cEdOUW54YXhGemE0SGF5STUxb2l2MVhhbTha?=
 =?utf-8?B?b0VTSURQTERJVVpwaGNkcjlhS2Y3NUdtdVk5M3pEd0JuaUp6NEdTMkpic2U4?=
 =?utf-8?B?MWJYSDVidVVCdlFNckNmV0tKYWU1azduRkZZallIQ09sRXR4dHJNUmhESEo4?=
 =?utf-8?B?aCs3Z1duTzNuTGlCVkR5cFQ0UWwvZXpIRHc3U3BvQzNQMC8yQXdBc1I5OHlI?=
 =?utf-8?B?dHBEeTNIaEJLeWg1QVlwTVJJZU8vV2srM202MVFEcld5S0MrajAzQkQ1RWR0?=
 =?utf-8?B?Q3FtWkR2MVlTK2pYNlhOR1lXYS9YOHNkYmM5dVIvcldpNlhqWEVEV2N5ektI?=
 =?utf-8?B?amEwa0p6ZG1UWHJKUmZSdzZvUmpsREZTcUZVbmErYXJWcHhEcmt2Ty93L1JY?=
 =?utf-8?B?bU00bVhnaVh4MFBsYVRxUk1YdG14U0EvZU0vK1ZyQ3NWT20vUFNNMzNXSEhk?=
 =?utf-8?B?bUtuSmF6V0FGUHFJemx3bnF3MTArL3kxZk5DTTBMU3lnaXI1bWMyNjhJbFM3?=
 =?utf-8?B?NW8yd3hqOWx1dkZyUW5WUG81N0pDbU1pL0xYUVVldHJkTG8wWTltWC9XMWEx?=
 =?utf-8?B?elhTQmlYU1ZxUlkxcDJDUDJZbHpIVENYOGJxaTIrQ0dmSVhyNmUweEIxQ3Jh?=
 =?utf-8?B?YzB1V1hDNWlHdWFVejUrZ0FQWjlZQzA0VlE5TVIvakJIZ1l6WG50QjlOUTl0?=
 =?utf-8?B?eDFHbHU4Q09NMXovcFBmTi9NNUQwTUVPZHphM0UzQ3VSL1lQblk3Z0Zzbzdp?=
 =?utf-8?B?MDNSbmdNRXhvSUVNeHJsMTJHY2NhMEd4SjlJTS9mY09WT2R4ODQrUS9meC8y?=
 =?utf-8?B?cmtvKys5emJvUUNRcEJOWnJPTGxBTy9WUVR5SG9NTHp2Z0lIbm4yVTJxR3FF?=
 =?utf-8?B?TVJuRlI4dThQSjdZYjZtUG1xejdPV2loaHE3NGo0b1hxdkVOWkNEaVE2Qmt2?=
 =?utf-8?B?Y3pUMm1vRVhZSXlXcjRmZHVjZmkyeFZWSldyQWp4NmQvRjJ3SFhzRXE4eFJJ?=
 =?utf-8?B?Z2RhZVJVMWdQQTdwb0VQc2VDSG5nbE8zelFZVFRySmFJREZLTjFtZ1NlQ2RX?=
 =?utf-8?B?bXNoYUxMdnZjVVBzdThzVDRlVFJrZjFBL2ptOE8rdVNyM1hCOHdYcnVBak1r?=
 =?utf-8?B?YUY0ZjIwTUpuMVhNWEpIUU9KVXJBcTg2enBZOWxQUTJEMXB5UlkrWXNhOTlM?=
 =?utf-8?B?TzU4WTkzTlhGU3ZjaVpXSVQyK3VoVmg0eE5ZWDc5cWpwSVhpVG1FbjdVZEYz?=
 =?utf-8?B?eUNHclh0NG15a1Q5S1paNXN1ZlA0NTMwYnJSb2dlelJLNXhpMzJuSGJoNEN4?=
 =?utf-8?B?NlJlK3FpS0t4WXQ0NGhkL1R0SGx0bWZJb3ZSRkVDTyttMTBnUitjUE92Vk9z?=
 =?utf-8?B?dlhlOUJ1UU4xSTg2M2Z6NTc5L3l4RTJZSkpxRkZPbkF2OVA0SUl3ZjJKcnRv?=
 =?utf-8?B?WXRkSDNqaElsd2hpU2NwZnZJbWh6YXNvZWRObDg3R3RnTjhpcTRkTGtjOTZH?=
 =?utf-8?B?NUVlRmM4N21jMTlzTUF5azVwTGo2T0xhUEN5UXMxUmtSbVdaQ0QzeWNNMGFF?=
 =?utf-8?B?Mjc0bGxJMVl6OTBVdk9aaEltL000VlFnc1hyak5UbVJEL0hyTnVjeEt0WlJ0?=
 =?utf-8?B?SmlaN2UycmZJZXlHM3RnMkU0QzN2UXVZbHhQdi9SN3NvVzF2bkwxSGlYYjJz?=
 =?utf-8?B?WFhsRzhUUlEvUGlKMkZZV1lLeVN5UDZvNTJub05HZ0loWEJoYmFpOWFYWXA1?=
 =?utf-8?B?YlNxWllOTnNPMlFDQzVPZEVEWlRMb0x1b01zUHVETk1tR0VvanZBelFvcUJs?=
 =?utf-8?B?d3MrR2dIdG1DaWZiSlF3NERLOStlTjlnOUJBZWpiZUlYMmpIdzBoN3hPNEl3?=
 =?utf-8?Q?CVyOYSieL59rhsFDnVBnST9//GVAFaMk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlJmcG1sVE1Qbm56TWVnQm1nRDc0OHh1eEdkM1owaHFPZ0ExOERWaFBLOGlN?=
 =?utf-8?B?b29KWlBTZUR6Rjd2T1MxUUZmd29XZk9NZ1NOMWdEdjV3bDBXTHVKWU9ZSmNY?=
 =?utf-8?B?Q0JwOUhmNnZFYzk4WDNWM3F0Q1FpVURjYkdOOGErMTVNWTVxUHdBL3UreVJl?=
 =?utf-8?B?T3ptVDVFQUU3RWVLOS9nRDdDeXRmTkE3R3ZVWHBzSzdrZHFiL3RQTFhmMlNt?=
 =?utf-8?B?TzhpUkhBWDh2T1p1UE9aRnYwZyszOGsyRVlsTFV6b0Z1UWZHKzh1VUxhV0xM?=
 =?utf-8?B?L1pBNVplN3dGZm5MdEZUN0ZPN2doamUvR2J2b29iallqS3B1VVpTYjl2M3Js?=
 =?utf-8?B?Q3owZkx0QmhXWUVaMmQxcXc4MTJJUzNlQVNJQzBNNE1FRWdFbHlvSlFvRGtp?=
 =?utf-8?B?M1JzM3V6R21SUDFzcFBBWExxdUNQVDFwUHhHM2Jybm9IRFZwR1o2dkVXcG1S?=
 =?utf-8?B?SDhTYkpwWlFWUWdXc2lmWmd0cXZSb2NBWm9INkkrZnFHRWlkOXhLdExDWEl6?=
 =?utf-8?B?QS9yVVBQZGZpQnVNVXlIcWo1KzVTV3NxSDdwRm95eGM0Z1VpY29CelNGOGQr?=
 =?utf-8?B?a1NXOXd0bkdkbXptTzJML0haM2MrVlpUVWZDZTg3MzlXUU5MNC81Wjhwaytr?=
 =?utf-8?B?UWFBUkorNXJlRkJjbnJWSUlSMDBQdWI2ZVhjZzFxbTlzeFdQNkczaW1yenpn?=
 =?utf-8?B?Ly9DUlhZY2RHbHZWVUNOdjFnTTJxZml6ZVpmQTA4anNmdHNaall0R2NRbXlt?=
 =?utf-8?B?RjdBTmVyQm1pMnAwd3lQZDdsQmh4Z3Q5UmZjMUo4OGdON2U3Vkdkd2dXbnVY?=
 =?utf-8?B?cE1udWxYWWZ1ak9aOWZLK3VlUzZCOE44b2lJY2daaXJGNXdNZ2lRdzU3Z0Fh?=
 =?utf-8?B?M3F4SFhvTWtqZnNmcldaclNiUDJUQWpmWm5Ea05NejdqTGVTYW9yOUlER3Js?=
 =?utf-8?B?QVlrK2R3VG0vbnJiOUwybkdiTzF0SVpTUWI3YnpiOUhtTzRjUjVvQTJRYVdp?=
 =?utf-8?B?V21rdVlzbzE5cTl4bEZzYSt6eXFGYzBhSytFcE13TEFxWTJ2NER2L0hLRjhT?=
 =?utf-8?B?L3o5SXU3UXF3RUI3WnM5OGFnakJoYU1sbGxsSXErNTh6elZUY2VkaXJLSkkx?=
 =?utf-8?B?RG1lN2ZvbmNzSytucXdmMTdXVE05WUNXTytBTzZwaTVOdDZmSE5abXIvNUMv?=
 =?utf-8?B?VkZ6WFhkbGwzcHhtZ1d6Sk5HT1NhbXFqUTB2aHhpVlBHdFE2WDcwbm1JZTRk?=
 =?utf-8?B?TEZ4Z1RqOW9ENjNBQXlzK0Z6K0k3VDg5cm9UakNGT2h0VGxiWFE5a01zTER3?=
 =?utf-8?B?UU9QZDBTdEQzbHYvZ2U4UTV5R0FaVFpvZTlDRTd2Y0VGQnRKYmtlNXUxNlY4?=
 =?utf-8?B?cWFxOVJsWkMvTnozL1RGandybURNS0pBQzYwVUZobFR4ZnQ2OE9uV3BISDZL?=
 =?utf-8?B?aWt3RHlCK3Y1S0tZNHJWUmgvMHBlUHZJTUlBR2p6WUlIU2Ezb2NSTFp2ZVdP?=
 =?utf-8?B?aStZMjRpZnQzRkNWNG52WmhCcms4bmhTQU4rRXhpUFlZRUhwalB1Vng3R3Iz?=
 =?utf-8?B?VUhJUDlLb1hKTFFjaU1BdUlpR2FuV3dkMUVMNDQyZEt4R056eVhObmRUTkwz?=
 =?utf-8?B?VmxJd2lXWEFiZlljcXk5SFNLWENRMUJYUFZraXhrSDB3cS9WYUhTemNiaHNH?=
 =?utf-8?B?eGdQQzV3TmhSbVRMQVJmdDFjdmpyeHJ1Q0pjdzZnekVLdjAzeHlHbWFlaGhP?=
 =?utf-8?B?UVVOaUFRd1VIQktEM1BBTEZrODBlYnNCbjBIZW5sSTA4WTRGbzZCenEyTG9T?=
 =?utf-8?B?MmpOMStzanlaOTc5VFJJK1hmZEg3UGt1Mi9VS2xaN21Xa09OUUlBTWVXdkV5?=
 =?utf-8?B?YnJBNjZWcHVaaGtBRzM3TStRbU9ucEtudmxaNmIzSWVKSVJBTnhHQllRVlpT?=
 =?utf-8?B?R0YwTXNHQU5KUkkrdGozdVkvdXpxN0poNVl6ZjZzdDB3RW9JbWE1VDhVbldV?=
 =?utf-8?B?bFdUZGh5QVNGWGttaUVtUmU4T2hBak5kVUF4SHM0RkRRa1ZacFBxRzl4dDdC?=
 =?utf-8?B?WktVQWE5R0xZYWhvbHp2RVVGbWFWTnFVcFk1YnpqaDRHem1yNWpOdUVES2FN?=
 =?utf-8?B?V0kwR0dXZkNqTzlmeW9WQ0ovQlhyR0FiZnFweCtsRDVpZC9aN0NCMHB0RGxT?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 951309d1-b17f-4981-a6a5-08de1ce0dd50
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:02:04.8678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/gHfViei4cliLGz90FlYV7pYwCWsoY650zcJcinqfOhRVYaLYkJxodgS14/HH4j90huhHKDQV1XDw5ifMWOgN9G/8ZuoImpTIkK/ZTmeeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
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


On 11/6/2025 0:20, Kamil Konieczny wrote:
> Synchronize PCI IDs with drm-next kernel commit
> 5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
>
> This adds CRI (Crescent Island) to known PCI IDs.
>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   lib/pciids.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 9f095a99d..6e53fb4cd 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -893,4 +893,8 @@
>   	MACRO__(0xD744, ## __VA_ARGS__), \
>   	MACRO__(0xD745, ## __VA_ARGS__)
>   
> +/* CRI */
> +#define INTEL_CRI_IDS(MACRO__, ...) \
> +	MACRO__(0x674C, ## __VA_ARGS__)
> +
>   #endif /* __PCIIDS_H__ */
