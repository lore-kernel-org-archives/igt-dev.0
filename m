Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B92D58D5A
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 15:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015D910E2D0;
	Mon, 25 Nov 2024 15:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLthqQ16";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC9010E2D0
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732548541; x=1764084541;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=o1QwD/TMO3G2hPRadDULdc2OIWzE1KZ4OYPguys3ROA=;
 b=VLthqQ16K9jK7tbhqvINEJhWlH5PeEcaCcRtbo+jvcrC69bHT5P92R6I
 GjMB6HjJuFdH/gY0LnBJZq01CpS/y4HpOEn3VV86GVB4wcKtXnniIREDx
 buvNJ1rs7P7thlej5LZIKy0S4gQGi3d/a755Z5hjE7APsLRX3WnaIRC5E
 6UDdh7kRrwnb0LrFJRLU+/YoTr5zoMz3Htp2Sb5sUkiN4CSdam8Zn6+KD
 dWYi6UcgJ4n+Lr7LaVH+QywLtHzNF4VVerkeVU2yni6S2paIc9DROBl6j
 +ABxaDEpQbgU00FzSpymc6BMYSXlOIS3EPdlznfA7acYv24quJle3p1yf w==;
X-CSE-ConnectionGUID: bGOCJM6nTkqNiC+0TyejzA==
X-CSE-MsgGUID: jzD/aZ5PR5+TR19F0Fg6Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43728165"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="43728165"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 07:29:01 -0800
X-CSE-ConnectionGUID: 8k46rCTVSca8xMtWp4qh4w==
X-CSE-MsgGUID: kUBiU81dTIyNIBNC37xfZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91082499"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 07:29:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 07:28:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 07:28:59 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 07:28:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Isx1iCEFafLcxbtU0UgwfsS6suzkoS3CjvtoW7vUlwFxaInalxFyfmhcAv5DQ4rh4W7FztQAUKdwWYVXEHb7q09T8iqE/DWP4M8qdbinE+MBVnYG7ddXLisBrnymuqmWLdYyaDfTziM32TBFyDy8PaLTdthFFw7iLbOk70KVWYW6lOSINp6MFR9GNP5wv2+51Ca5uRWQnL7gnEkGGeuwef0ekRGYKFTm1mNY2zSRGc+UOZAX0NUR3Wwdwviwa2bMLAWtM52UJo6/eQO1b9KrOFmvA2G18wFcRvndlvIIK0sRbXvqENwaGcv9m5VXYmpfzP424PdEVdTuYnT7zsqutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oSd+XEOvAhXloBCubAfYWV0iUdvk0W9QjMNcJtOgJA=;
 b=jqvOdat0jRbUP4E2Z2ClqHNBZqUR2Bj6UmF5sbo5gQ8r3Qx4vJCDvrg4TpEJ6zkwIOTYwaXo8dSS58toNl4kqUHeHOD6fdXkzXiEx1eYUMkvmM80LewEKUt6nFmSRWJRqJe2BzGl38vxBiuzQTedhGZhBlhYn5XTfeH0/vURzIb9UoMK+anjA2J8+e3UdNFNWztnuRznqNL+Pce5H70iUMuflb7XtUZ6FlToapdmhYpJdACkFIDVMvUT8scMZzVzAzF6Tk55E03mHapTqqslCniJbytP5Aa7TGjs+DVRtVHsTebTJN5nnUPUDVyLZ6j8isa2W6nr1kOeD/5QpRBVWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH8PR11MB6902.namprd11.prod.outlook.com (2603:10b6:510:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 15:28:56 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.8158.023; Mon, 25 Nov 2024
 15:28:56 +0000
Date: Mon, 25 Nov 2024 16:28:46 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests=2Fintel?=
 =?utf-8?Q?=2Fgem=5Fexec=5Fbalancer?= =?utf-8?Q?=3A?= Disable parallel tests
 on execlists (rev2)
Message-ID: <ele2amqx4wmntm4ag3edsx4p3fsrhnarc334dxddyf3uwmjxkd@24dktkkgxwmr>
References: <20241016132718.36457-4-krzysztof.niemiec@intel.com>
 <173152270728.3708786.9899068163518890450@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173152270728.3708786.9899068163518890450@2413ebb6fbb6>
X-ClientProxiedBy: MI1P293CA0028.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::20) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH8PR11MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 484fcf30-bce9-44aa-d1af-08dd0d65e007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXRqZWliaG9jWGRqcWtLdC9IMWhsaWtmc1l0dmw0a2RUZ3dHbHEyNmF1R3Ey?=
 =?utf-8?B?WDhYbHc1YmFPSWZqTW10NkZHL0JVUDJFcG9WMnV6Z2ZLOWJVdm1NV1ljSmhU?=
 =?utf-8?B?ZGVSOHprbkMxUUVWVk1vUlNPMXgvVTNhOHpYWXBFTFIvR1ZVbHU0T3JvUlBk?=
 =?utf-8?B?UDJUejluTndJaWc1akorcXBldll4cXFpdW4xZlZ4RGNINk9kSS9EZ3o4USt2?=
 =?utf-8?B?Z0xyT3djK2FQU2dEMGhDY1UvbmNGejV0TFJDeHFTQ1pDTy9oYjRydHJsUVhD?=
 =?utf-8?B?OVJ1MGNFM2gwOFRrWVJIdHh6ZW1xdDJMMlJ4WkxhaUt3Z3J0UjMzYmFSUzVZ?=
 =?utf-8?B?bmdxRVBWeEZBSE1WQkhRSldiOTVxOW4vL2QrMUtwZUFWWEJyWTdUZE1CREwr?=
 =?utf-8?B?ZEJKbkRSMnZvODdKS0dBWVFsckI5ZzFqRmRFTEJFTDBkWEluejhQNi9jYng5?=
 =?utf-8?B?NTdraEliakRVNXlkTHVPZ2N1K3NvMG1nYytVYWQ0Qk9Cc0IwejJ4dTVSbDRS?=
 =?utf-8?B?a091WWE2VkM4Q2xqeE42UEc0MnkxRGl2VFk0d0ZIQjZPVlYzVWVFVVNDb3VT?=
 =?utf-8?B?aWJzdHRhdDVUT2JZMmp5eEp2dTJmVUVsbi9qUVJzdjBOTVJVTVRZRUE2YTNX?=
 =?utf-8?B?R2ZUdXE1NEdnWDZCZnp3RE5SbGlteUdJLzZxM3FEcnNvMzloVzdiZjZEVDBh?=
 =?utf-8?B?Tm1nQXBoMlJ0a2lRdVUySXQzRmF5RTRhL2xUeG9wQlN0VDgxb1doOHRiM2Jq?=
 =?utf-8?B?VHVXditDcVdWN1UxUGh6M1pWVHFUVnU3My9VSE0yWGFzTVhtMG5rRVlpd2d3?=
 =?utf-8?B?Y3p6SzdUNnlvUnBEb2F1TFVvV1M1eWFyNGZSTzU5eUdueGhWNkhlQ2VUTnpC?=
 =?utf-8?B?YWo1eGxsRlV2ZUQ2VWNnR2llQ3JqK2NLalk0M1F5MUZGaXRqZHhTcG1DM0pN?=
 =?utf-8?B?RHorcVU0eVpDclRwVWlJMUtFeVNaMFVQVTFlQ0Jrem1lallLRUtNWVB5eS9G?=
 =?utf-8?B?dlJtSmdEbXhUeTQxcVJkSlorVWJxKzFjL2hzTTFWUGVJUW9lOWdNYWJCeXFz?=
 =?utf-8?B?TEJzZkEzd1BURkxBeUtlaGFVK2ExcGQ3NFRERWFuNXU5YWIxdWIxVGp0SEVx?=
 =?utf-8?B?bnRtMllRakVNcEE5TFhjalI2aGU5RHRBbTF5Z2QwV1IxR0NFdThRN2xYazQz?=
 =?utf-8?B?Unh3bzBWZkJsM3ZpdnRGZ0gzWFlBVWxLRGZsUnhoYXZMemt6T3NKOVA2aUor?=
 =?utf-8?B?LzhBTnhCL1FxZVFTdWJ5N0E4aEpVK1RpWWxnaSs1UFI2MFcyV3JKNklESDcr?=
 =?utf-8?B?WndzRUVXVUJMOHdVWENmZTBPN1l2MWVGdlZITnk1eGROQlVDa1BMSm1kOWdI?=
 =?utf-8?B?UHRvNEw5N3lCb0pGRlJ0RXlrc05vNnVRZG4zNjR2Qm9CSlJpT1N0b0xPdlla?=
 =?utf-8?B?b01wakJraXE4K0c3MFlBVzdDSU13c0M5WkM2dU54WlFSRSsvWC9uaWczaDVM?=
 =?utf-8?B?M0c3NlRzcFhaZ2lxZEltVlUvSWRVS29DMUJNRUQrYjBYekNlYk43MmI0NDFR?=
 =?utf-8?B?czcyTkQyR2JkKzJBNXJUUDV1QWRRRHYwSUgrVUVMQ0phNklPejlLRFNGNjcz?=
 =?utf-8?B?by9oaC9qVThvQWFBekZaTzEvSE5MWWFSa0dtTUtvb2VzYWp1WGxDNWxZdUVH?=
 =?utf-8?B?bmFUQXdJU1dkRTY1T1dTM2F2WkJoRmt1RGI2a0VlcFlwVjJoanc1Wmo2NEZm?=
 =?utf-8?Q?HnLeMV1PfmSif9773E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3Z1VWlSM0RsazNGWTNsYUxuenR5SzZWdzM0dEZYeGI1NmJmakw4enduWVZF?=
 =?utf-8?B?a1pkbmJwQkVoZERrYWxIQWZpK0ZNc3d4ZkwvNE1wOEpZTFU5SlVMb1Y2YnYr?=
 =?utf-8?B?RkF1cVg0M1RUWkhMWVYyZHhvdVJIVnJRYVlTRDhYSXdmdDNuTU9icEI3NDRB?=
 =?utf-8?B?NkdrMG83YUJwTWZtMUZqdFdNZGdyNXltUFRjSXcvN0N0RDRnRXZIekVyMEFL?=
 =?utf-8?B?ZVN2cGJtYUVoV0QxaTZocXlOM2NCRmhsbEU2WkFBeHlibmM4VnltOU1sV0ZB?=
 =?utf-8?B?cmhab09MSlB6NnJGTFdlbmRrWFN5a3NETDQrUTkzWUFNWmF1bkxkMWQ3OE95?=
 =?utf-8?B?dHp6MWoxU2dHMGJIYjdESm5OUWRNOUpkN0Z5NWl6L0E5bFIvSFY5LzJDM1ZV?=
 =?utf-8?B?OVkwaG8zdXBZYWxlT2E5MHd3SnRiMDNzTWZENDlqTDdRbmRSMVBNU0tuU1FX?=
 =?utf-8?B?by9EdExyeUt3aE1SN2h0ay93eGlHRS8wNTQyKzZ1c0gzejc3QnlEdlNrQndq?=
 =?utf-8?B?SUl4QW5UWTY5ZTN6M2w0OXRPV0k4Q2U1VjJFc2NySm1GUzVjMmlXanB4a1Mx?=
 =?utf-8?B?cXZtYUFuMmhoNXJQeWlNV0RJUUNCTC9jd2dOTWw3OWI5MnlWOXNxM3FJQlJP?=
 =?utf-8?B?UDZsVGpOQTRTTmV4eFFCc1lsOWNCSTM0ZmJnbjV0ZVNOYStQK2xkV1dtZG0w?=
 =?utf-8?B?SVBNRlpiZ3IvbGhHZVdaTE95UWFWZWc1eHpiMkV0MmhqVFVyT2I2anFQWVNw?=
 =?utf-8?B?MDA2cFlTb3VRanVPNjloNk1wZGJyOWlOMmhidXRBdGNrY3JNWWlQNUpPOW1G?=
 =?utf-8?B?ZGpmcWkxSXVaeE5sQ3BwcmIxMU5zWEFPZkd3RVFOVXBnZEdGTGhiR1VabUk1?=
 =?utf-8?B?azVjQmk2dGVsZlFQYmc1aHJBYkhXUGVmd2xMcW9kL3NGTkxRbkRybmU2SkUr?=
 =?utf-8?B?RXdYbkN2L3NwNlQxeFo5Nmh3bnVxZnpHZElsOHN3UklUTWNLb3NaYjUxY3JZ?=
 =?utf-8?B?Y0ozVmdtODltVktDM3h4TjNYUFZLRTRoSmJBSXdrNmQ3WmtOYk0veENkUWhi?=
 =?utf-8?B?UTRrTmRYeTZWM0g0b2JVZEdhMHhpR3lHSW96VDlCcTNOR3ZPOW5WdWNpbS9i?=
 =?utf-8?B?SHBZYmk2amdTU2ozZEswL1dQSXFXYm83MGxhUVRRZnl0YlJlcEhmOTdveEU1?=
 =?utf-8?B?dU8zYVQzWmZvNXNFY1FXRFM3UEhLOTRQTEp4M3ZIdmlnOTk5WWU2MVZJNkNX?=
 =?utf-8?B?eWtibXpHcUVUcTljM1VONWRjQ0Z2emFJY3p3bmhYTHM1RVZoK2p2MXdocVJ1?=
 =?utf-8?B?VUN2SWhYSDJNSTdiQW9wUEhTMUZhOUNHUVBoOGI5N3FlM2VzclVjZmxQVlZQ?=
 =?utf-8?B?ME1acXVRSGZxalVXNWhSSVpHM3BqUGZFdGx5eHp6dmp3TkNOaGZEYVo2U0pu?=
 =?utf-8?B?aEQva3Fzdlk1MEdqaW9ITDRnNnYrbUdmdkhmU2tYMUxzMTJsTWpFWHJSK2Mv?=
 =?utf-8?B?RU9sTkxTN2xHallCVkd6RVN4Y054Rk1HYXIvQUFDLy81aXNMWUJpa1lIa1Vn?=
 =?utf-8?B?WGtJWnlrbmNFOXh6c1FwUzhKQ2JwWTN6d0NObE9xOXpSNGhudVFhbFZZSXRR?=
 =?utf-8?B?eEhLRG5SS3hXRjkrWHlzQlZuUkRBSGdISDVUZGQxbEFsMnIxZ2xvYlFMNDVw?=
 =?utf-8?B?U0E5T3VwQm5JMGhSbTlwaUJjWHl4TDBmN2VjMEM3UjRQc3NSYTJZRllpMmdr?=
 =?utf-8?B?WTltZ3ZTNk1YS3pnOGN3d1lqVEY5ZnFUeVpDaFhVZHh0aTE1Wk9IRGtZRCtW?=
 =?utf-8?B?VWVFZDk4RDRhR1VPaGIreVdRTVFFNWRvTU1sdmtoRTRGM1BjZ0tpWnVvakJ0?=
 =?utf-8?B?c0JyWlVXd1pyS2NMcFNuRCtXWUpOUE8rakt1d0tpem5QY3hJTFpNWWg5NTl5?=
 =?utf-8?B?QUpqQ0ZGaURNc0R1cEZqN2k1VnVlQnpPRlQyYWNIcEFabTFicHk4TThXdnJB?=
 =?utf-8?B?Y09hM0U0RWdOUWJpU3I1QW8yZCtmSm9taCswWm0zcmpqa2hoeWRBdlh1Uy9C?=
 =?utf-8?B?T3dhSjl0QTRTZTgyN3FMYVFDUWZ4UkRocnpJaDhEckliMjlFTEdRL1FGWno3?=
 =?utf-8?B?YmsvQ3RrZFhEeUtsMmlRaHNmejJEOVRBSEpIbis5d3NEaHRLMmhnU1h2bTdH?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 484fcf30-bce9-44aa-d1af-08dd0d65e007
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 15:28:56.0316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlwt7BfgUm3VlylCz7V/TLnoCjAb/lGvQnIGzRjEX4VJY2sKKD3zWpGLvsu29MbeR52eQzeKORNv8x7/LkO6s2MpMaHj7aXiqxBa9hUvElQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6902
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

On 2024-11-13 at 18:31:47 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_balancer: Disable parallel tests on execlists (rev2)
> URL   : https://patchwork.freedesktop.org/series/140062/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8106_full -> XEIGTPW_12087_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12087_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12087_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12087_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8106/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12087/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
> 
>   * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
>     - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +3 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8106/shard-lnl-6/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12087/shard-lnl-4/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][5] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][6] +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8106/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12087/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg2-set2:     [SKIP][7] ([Intel XE#3309]) -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8106/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12087/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   

Not related, the patch touches a different test.

Thanks
Krzysztof

> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12087_full that come from known issues:
> 

(snip)

> Build changes
> -------------
> 
>   * IGT: IGT_8106 -> IGTPW_12087
> 
>   IGTPW_12087: 12087
>   IGT_8106: 05659c7f2840938c4977668143e6c60a46ca509d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2221-169c7cd31a373ed31054abb423981856eb5fb119: 169c7cd31a373ed31054abb423981856eb5fb119
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12087/index.html
