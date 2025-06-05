Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB43CC5B543
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 22:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F30C10E316;
	Thu,  5 Jun 2025 22:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nf4jdR0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74C810E316
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 22:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749163015; x=1780699015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xD1l6HWDEIcVjJ1C++Shkz7TeEhqHOMTCWETKFbkhv0=;
 b=Nf4jdR0GH/UOBK7x4BuE8AgdIVj9trncdAkfnECDvaL6EVMvOebaqbuW
 s7/qnZ6vM5yTqd7BCtaQ8J+Ny2FMD6lYjJp32OhfKMVFQD86A6Q/briEN
 f9XllVQl+FELrMkU3SC6U3desXx5h8JpXeYXYlkUuSzWinSNRwn0QpwrB
 tAsKmSMpEjK50tKGCr8w77rAFQw8v/RhfAfMvfVg6Zs8Q+wHQI0auAaJQ
 BonULCqilkPu52y4AatM5GOvROVOSzvCTYClKHJQ3LSPQ0ty0FB7L/Pjr
 D7rS87DYFF1lYfRO/s+2fFAmSYqHWk52pkcMO1MwNJjinFAQnvkk3mnyy Q==;
X-CSE-ConnectionGUID: CUGjuKnSRI2tIFYcLmLNPA==
X-CSE-MsgGUID: 9qmCMdT5TlmbeyKbpYbp+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68862148"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="68862148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:36:54 -0700
X-CSE-ConnectionGUID: S0QbmBXfQJezXvKZQiv0ZQ==
X-CSE-MsgGUID: CraRVdAyQL2waB1iLip6OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="149487245"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:36:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 15:36:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 15:36:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.69)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 15:36:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUA/Lxt+co8IDrdcWTHY64DWdc0gwU7Cxu3EBSysKkx12I+m1Di52kcPQUbuHGatoqKKXF/PKtqm0ZOKem7tIyTrcKf/Og3jbO84qg/x6i6gJDBOh3CC4Lv+J0BQW/EzKIvOrzhB4eTMFNyFodqGiWO3CBALBwKODeOuWk7ses4oXUGLWa9QkuF25VxA3j2exuFXqnLMXQiIIDtyDtknibBCjGnrWXL/z+4no3elTkxkXsTvma4z9laxvSxe/NUUkV6Tbrgg2xHR3OqDef1hCIbQ597pe1iWTFjzZmYK105Y5+CtFZKlDK0xnJFniLUcvpr4sOka3vzrpKqAzTUfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2aceBURLrRxfE1FXxAK8jBxLEkjj2dDR1O/3dB1CiE=;
 b=V82xWDRdfXuht4kb1huDT+CjQmg3lRHrDUlG6cDFC+32CPaImkNxFM0lwkCyBy0BIXCXglsVUzd1TYv2PI0m5vu/ZYOhwgWCkRCSSzt7AaxMxQZ2LSFo16a6XDKWPdCArbaV00OBlMOse5acgHJLSuMo8Yd7Vmb2bRg0rK14iRlMFZZpIhsufxz6HtyHsf+ZcEKsXpO7aLbuAt3AniQtWn8NddSEPPgcWa336AQYsf40pqZXy+IGXwFh3fwJMB+5QUAeIHX3uTLHhoihzQR+P+ctnfviwEWypAHA1+D7RdZMr3+ICT6iu6VMflXBQFLPzeNGc/UjlCEnHFkeuJX0hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 22:36:23 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Thu, 5 Jun 2025
 22:36:23 +0000
Date: Thu, 5 Jun 2025 15:36:21 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag
Message-ID: <aEIb5SxURvhJSmug@unerlige-desk.amr.corp.intel.com>
References: <20250604181827.1502650-2-umesh.nerlige.ramappa@intel.com>
 <CH0PR11MB5444B0248786C82E4B071015E56CA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444B0248786C82E4B071015E56CA@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ac508b-6eef-4575-cffe-08dda481669e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTYrQzAvMnFNYnNaREpNd0dHd3BncDQ3dHRCOU5nV0wyVGJ4bjVMYS8yQkcz?=
 =?utf-8?B?K0s0MmorM3RuZnZyVW5VZzNxb21qb0lYUFdyUzBEZkpzcXo0K3NJV3RIVnZE?=
 =?utf-8?B?d1QvMmRzWVpYUStJOFI3alRLUFA0aFpXbWtndWtjZURTK1JFTWY5U1NsVER0?=
 =?utf-8?B?VlBRM3dSeWlUUDBaM3hhRm9BcUdwT0hodVl0c2FUdkNVaEJ2eHkzOXNDZlc0?=
 =?utf-8?B?d3BIUC9SRTFxUm80K1JCOFJBMVRuL01NTFZ6L1FRcHRJM3d2NGk4VThYWlRz?=
 =?utf-8?B?OFpoNWl2ZTgvYkVORi9kYlZsMVRmbUVVcWpaYnR5QVpiQy9DUndRM3FqbVIz?=
 =?utf-8?B?YklWTVFHc2Z1V3BJY3puL0dNNUJlVzk0OU1RNEVjSGNXQjVkMU1yeER3YTNP?=
 =?utf-8?B?ZTVoS2x3U2draVNQMmRTd2hKQW8rNjlPdXlEV2JnaDQ0WjJTN1FjRGk4VU8r?=
 =?utf-8?B?NEVGaTJmQSs2a3lrZWsySXNQVEFUYUUwTGxQZGkzeVRUalVKaWwydkk4Y0dL?=
 =?utf-8?B?WFVnYThLTTgveTBUUkpjVkVVSmMrOElNdVVIVmVzU1Q3Ykxqa0dnTVQrNU1r?=
 =?utf-8?B?eXM3RXhqemMyZlhINk1CbVF4eXluUkpzT0t6Tno0d245Y2J1R1Ayb1c1eDVM?=
 =?utf-8?B?c1p3cGllVktyVHQ1Y3RsckoxN3dvYi9icFFnZjZUTW9pOUVOWm53c2lWK29R?=
 =?utf-8?B?M3c2RGVEQU1qTUgrS1FjRC9uZlB0ZTBrT3R6Vy9hS1ZBM3QzU2tEQkhpVlN1?=
 =?utf-8?B?aGlFcjBmNUxkaTNZNmhJak5XZWdjbjVZWnEwd0w5UUM5dURuajRTRTlRc1Y5?=
 =?utf-8?B?UjFMeHhtVmlGbnlUdlZFOEZHS00vRXE1QUNUZ0NSbzJBTlVySnUvOVh2ZnJa?=
 =?utf-8?B?OWJNWTMyRkF2TjZ5SHBTK0VWako1b2tVaUdXeUJQSTV5b1VqWUhCS1phbE9V?=
 =?utf-8?B?c0p2dy9QVlhuVnBzVmJ5N2FQYzBHZDk4QVJwZGxNRTAwdmRQMFBzbk13OFY1?=
 =?utf-8?B?QkhDRjE2cFY4QUUyUkp3L2JJK05sNE02NDdiQ2VqNWswaVo3TVlNVEJ2bERp?=
 =?utf-8?B?MnJGc0luRXAweU8wNWUzQk1sZGN1WENxRS9Ua29nZVV1YnJFd1l4cGgxQ041?=
 =?utf-8?B?MHdEOE5xTS9tWXZTR3FmRDBqTUE0b1FkaG84c3NSUCtzckZJSmxSc0c0T1ZJ?=
 =?utf-8?B?RFBmTTVSVkxlWStrS0JJTDU5Q0IvTFpvT1I3blpuTEwvTTdvQ1h6MEtvLzJs?=
 =?utf-8?B?bFN3UTkwYWRWYXhVR1ltZGdhUDZsRlc0UUNjRUhtbXdlM0thenI0S1ZmRVdM?=
 =?utf-8?B?TmtPRmV6UXY2OVZYK1Uvaldod3NVUGN4dVZhc1A3d1pRYTZaTGJ1b1hhS3M1?=
 =?utf-8?B?L0tmbVVMZHJ6bDMrU0h6Y2JmVHVCZFdYeTNBcmJMUk5CcEJtbzAyaU5VY2VI?=
 =?utf-8?B?cmJUMERyZVJrRitLOTRHSnp4a09iSVhKdVlSdGNQK0NmRXJ1b0tKeURqd21x?=
 =?utf-8?B?SmZmMWtRdE8wNUNZY0crWHBoSGpyOVVyWXArVFZpYzljRVg3S3BiWTlZWXFa?=
 =?utf-8?B?bysrblJ4QmxxbThGNVdZTUNCZ2pSOHJsU2Q5d1dSMHZMc2FQbkJNN1dHZWVo?=
 =?utf-8?B?VUNpOE44NU1EMzlpQ3dTV29hS2dnanoyK0UrSXkyUHREVlJrVTVobDFESHR1?=
 =?utf-8?B?WmwyajRiTVBnQmhFSytBV3NuYlVMQy9QNXpYTXR0eTV2aStocnAwZUg0UDA1?=
 =?utf-8?B?OTJQRG1sMHQ5bU56WUxWN1J4MjRJSVZZTkRzUXJ1bXMzTmIycHVQMUFkaWxQ?=
 =?utf-8?B?WS8yN1FhU3lJbkZGcnUrNGhrY2MreGtCZ1hURkVJazgvNzJIYzl0VkRQa1Q4?=
 =?utf-8?B?cVZ1Y0VoQUh5Q3FjbWZRSHA5WWU5QmNialRzcUpPS3dDcDVmaVFmc09xa2dP?=
 =?utf-8?Q?hg+qIFVXycI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEZsNHp1UGloU0E0YzFuUTJtK3RkWnk4NjdyZEtCc2ZXNjZTTzlqVTBCa0RZ?=
 =?utf-8?B?Nno0WWNvVUFlMlo5VVdLc05VWWZ1Nmh2b2RHNHZwWWR6OHhqdlYzRm5SVm5v?=
 =?utf-8?B?eW5RY3YxbGRGdHhDTWJhSUR0YkZrT1RIdERobEZ2d0FuVDhzSDUrem9ZcThG?=
 =?utf-8?B?NTFUc2xMUTB0WXgvYzJqLzUwUTJoSyt6V3lxa0pWOXlLbzZwdUR4ZkFYZm14?=
 =?utf-8?B?NzIrbEU3V2M4QlpPZ2pTZHQ0bm5qa0ZMUE9jeEhnNFI4NEloSUZhdVRSZ0Ja?=
 =?utf-8?B?WVN5TitSaFRJSjFVSkZENzZqS0VnN3BFd1FUdXJxak1kWGZFWVMxc3QrbkRy?=
 =?utf-8?B?QWtIZnQ3WkQyeHlhQXVRNG5OeG4wdUw3S0V0ZFpISGlnakdzQ09sSUdvRmN2?=
 =?utf-8?B?d054UUswdUFCWGNzMlNQWG45eGRJOHpENTI1d0x2SEQxWk8wUVNOSk5RbjBK?=
 =?utf-8?B?QVU3WHhYVUZZd3c4MGlVbytEN3gwalI4aUtZQTFzdEpjdzN0MVMrL1BxcVo1?=
 =?utf-8?B?U01xdC8yMVFkcHdFbWQ3bXAwTWh1SWd2cmJWZFJNZU5mZVA3R0VpcEtzdGN6?=
 =?utf-8?B?bjV5UUF5S2N1eXdRSGdFNHZ2ZHJFWGIwNXZrcTQxTlZqVldJZkJ4ZjVTQ0Zz?=
 =?utf-8?B?NHJ3WDR4ZVNiakZZWDkvTTY4NWdXZ0h5TkhQSTJ5MmdQdUZPcHVTZzJ6L0xw?=
 =?utf-8?B?cEJjNHNDQ0w3TTdadS83WUhwb2lSWmI3bVhwbTNTbEM5SVlqS2dzZTVSaG5i?=
 =?utf-8?B?WjA0bk1uQ01KenE0YjkyTEhuanZlMXQ3ZGhQNDdmZEludnlFYlN2cm1EWlly?=
 =?utf-8?B?Qk9xZWdTa09WTEl3azMxNUtWb1VyVGlOTWJYMnNvM29jR2YzTjdZYUp1Y2Rq?=
 =?utf-8?B?WExVS1M5Qng1MkdVS0ZaVHIzdjQ4NTBYaGVnVGJXUVVMZkNlV3RERzRvRVZt?=
 =?utf-8?B?T2Zxb01QTjMzelJLNzUvMGVpeHNhVGpVclZRQ0l3Qm9BOE9MSE5EdDhlb08x?=
 =?utf-8?B?ZWxlTXlxNkVDMWtEYTRPTlpxRnZjOFhHVE1PWGpsZDduRlg4QU12aHZOVWJs?=
 =?utf-8?B?SXM3dktEaUVCMTZuVENsUExTSTRKa042TUczNFBneThJQWJpQ2grUm9EYjJS?=
 =?utf-8?B?SE5Za294S2RXVDBQb1g0UnFSNmoyZ3k4SUpkKzRHOTNpYUMwT0ROUTN5TTZh?=
 =?utf-8?B?WFlPVXpHRkdyaURmMndkOFpRek0vTXIrTVpYb3JQbFIrdjlISVozOU1hMHp0?=
 =?utf-8?B?dGdDM1ltZmU0cEdJdVU4YU9EMWhlYmVNbWdFaDdudVNqVk1jS1FNRWdDK0VE?=
 =?utf-8?B?ZXFLb0NjVnluVkE2Rko2TW02UVJ2VXZxbDlsNWw1WW9WL0VFUjNMNDhVcUEv?=
 =?utf-8?B?OHVqUTVHbnNCcXRlZUN0ZjlWN29JVjdzcDFzZlEwOXFxWGRMdDVKZ3BROFg0?=
 =?utf-8?B?ei9IM0piTC9PV1paQ3lqcWd2eTlCSVhyenpnWnNnSXJXek9mVTVtSnhIT1FV?=
 =?utf-8?B?U0ZmcXBCWGVLYkZMYXhXMXQ2VS9UNWMrNWpFekdadzlleGY1VEZKNmZ2U0l4?=
 =?utf-8?B?VWNXcnZ2cmNMMDlKUXliYllQbkdVUEpoQWpQYmZqTjZqMS9KOSs4cVppTWk1?=
 =?utf-8?B?b0o3TTE2L2pETlFNbDFLSlFoTEoyOUtjbmNxbkdFcWNpOWdCaGFBK250dUlo?=
 =?utf-8?B?aUdQUG1YbWc4ZUc3cEpCUmN6c0NDbVFyODZZNU51cjlMWTZSTDQydFZsSFEy?=
 =?utf-8?B?MmMxNVY2ZVhIMUNDY1dadXYvOHhkNis3VXN5L0Y5M0VOc0ZqS0pXLzIraHVO?=
 =?utf-8?B?UkVVWXl6YzVHNGw3Y3pYbmR5WnRmTTQrY1dwSFE1V0hvQ3o3Z3p1dE5RRG9N?=
 =?utf-8?B?SEtmVnRTbFc5ZTdrUjZMSjBkUXlwL3Fic2VDR1J4TUdnVGx0aGNwd0kvUEZr?=
 =?utf-8?B?bXBhT1loR0hiY0daOHV6Tlk3WWNUUlZYZDh4aENTQldBd2lvWmV1Y2dtRHgx?=
 =?utf-8?B?UTl6UkFMQXRHTXBOZmpSQzBScjJqVzh6blY5emRRY3JOVmJXRkpuZVBOYzhZ?=
 =?utf-8?B?Z0pacU9UcXNaVUhPbTc0VmtqNy9kcllEQWVDLytSc2hDNU9zdkh3R1ZvNTVP?=
 =?utf-8?B?V2R2bmhXQzY1dTBIbVZ2c0dUVXQzNjBIMjArS2hsWC83cmJiRkhOSVpBdzYy?=
 =?utf-8?Q?s4OhdA4wYtHXba9UBsebbYw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ac508b-6eef-4575-cffe-08dda481669e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 22:36:23.7774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mf7lvdmwbbfT39z+yBd8X05Z47RHpt1NK4Wx3ROwSkrBas9FJ38SyWoNPf+er5CfHCrjQUixxYoQvsJAYn377a1qkOEhVijoGUsBTvoOPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
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

On Wed, Jun 04, 2025 at 11:23:13AM -0700, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Umesh Nerlige Ramappa
>Sent: Wednesday, June 4, 2025 11:18 AM
>To: igt-dev@lists.freedesktop.org
>Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
>Subject: [PATCH] tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag
>>
>> A copy paste error sneaked in the flags. Fix TEST_WHILE_ACTIVE flag.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Good catch!
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>-Jonathan Cavitt

Pushed, thanks

>
>> ---
>>  tests/intel/xe_drm_fdinfo.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>> index ad7b45b1789c..17f66f1defc1 100644
>> --- a/tests/intel/xe_drm_fdinfo.c
>> +++ b/tests/intel/xe_drm_fdinfo.c
>> @@ -73,7 +73,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>>
>>  /* flag masks */
>>  #define TEST_WITH_LOAD		(1 << 0)
>> -#define TEST_WHILE_ACTIVE	(1 << 0)
>> +#define TEST_WHILE_ACTIVE	(1 << 1)
>>  #define TEST_ISOLATION		(1 << 2)
>>  #define TEST_VIRTUAL		(1 << 3)
>>  #define TEST_PARALLEL		(1 << 4)
>> --
>> 2.43.0
>>
>>
