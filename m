Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29B8C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 10:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A3310E98A;
	Thu,  3 Apr 2025 10:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDgJj76M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C76910E995
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743675738; x=1775211738;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PvnTjlgXUxWDUzX+ybqI93qE8XNpyEarnRxw5gYWqBc=;
 b=DDgJj76MuLZpHHw5RWKd+tpDPq7igvQcq8eBiKeMJhOrfJiUQQ6ruXss
 zwktGKIVtxIBjRXnfXgDzad8Ec3JERLbw+yFsOUnSTCTp2/tprogl9CID
 sx6rTVTJiOrqcX2IeY88uW1ct7nJ5bvNOa/rkbLurhrGwWt7gnxApSQOp
 qOyw3U3OY53k6aCDLi6Q4jD+yRorMMVKtJMhur8bpmkH//R9UeV+WlSxw
 tTrQoMyInEAJQzJASNDlW2IrKXngQoKbqagv9aB5wSYhE5jfUFwFBXw6H
 ZksaUc/mkZMhL0adjvy1jnAkfKCyiGOrYY07p6bfyUogic3ejD5RAvnGz w==;
X-CSE-ConnectionGUID: byBJkMY6SByyJ6boplszOw==
X-CSE-MsgGUID: arrMcV0xR2W8eyR4qqtIxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56447503"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="56447503"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:22:18 -0700
X-CSE-ConnectionGUID: Ht3JYX3QS7mEVrtrR5Nviw==
X-CSE-MsgGUID: qZoMk3bmSVK21v7ZAH8iUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127818238"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 03:22:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 03:22:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 03:22:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 03:22:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMZ6zl6xSFmyL4nR/DbfmScRwDRk/aLBjb3gtBqV2RDfqJAQaFdYZPJ+Udi7QeD81hPRl7+NYbrvYc7rldkcq7H2JS+GTFriFAD0LSOwjT3jFmiMK5KRXBs0yEhECiZp48wXdztQWdjGzBT27PcwhHykZC+mYtpix0o8j689EruT3cP8snnphkBeWwmzfzkjB5YYqbSgcEOOZvSQ6cOEUMWif8CXQLbIdDjSBaru39eSqQGCsoLWlPNFmWTJVc/FkrNJTK08230hJg0nAqhQmrR4nj9RAdclV7IpmSm6bUAroup5EfdV9HI2+CDvGwn72i6gy12w3YvJoln2gp9q4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPQOqKXkd6xEvRnOBXzYnDD4Ogm4YVysABlha5Y+eHU=;
 b=na0IcE6BaGVNPYBtlWuIuf4zesRSOEpI4zl5Her+g3lkIQ2MLn85/TEPaO7fIl9EySCGTo4by0fLGo0QxRYfllwTK8YA3a3h6hbrpvqlGlbfcv8oseGZSewtd69xf55oUUIn6XJjo/69gWZ6eA4bnrqv5uhEuphZ86SyKZpqJVbvlse6yP2eZ/Bxjhx74q3ZiOpuM0erdda7GgQ9S4MrZ35EITle+SsIZjXtEJZGFXVp1OiS7HTGkDGt9Tr8GnJ4jopgC9gr83mbLP/Rk/nL/qD1cJiikuob/Xm7RMvHQShG7QrE3sqE1pJE0NvqLfFCAHZ2NQ5o+DrMlk15JUFCnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Thu, 3 Apr
 2025 10:22:01 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 10:22:01 +0000
Date: Thu, 3 Apr 2025 12:21:53 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/intel_allocator: protect binding for
 multithreaded tests
Message-ID: <Z-5hQTpKGtTSLuvl@fdugast-desk>
References: <20250403083438.132035-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403083438.132035-1-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CO1PR11MB5169:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3ac2b0-0b9a-40c9-f799-08dd72995f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGptb01jT2c2all6TGw5K2dWYjZJYUlBVjJVcHMzQUFBQW92U2d0SGFrSzBn?=
 =?utf-8?B?TkhPZkg5bVdycjNKak5sNkZLdFh4WTN5c1VhQW9vYi9UWnZKdi8vbFZ2YWFs?=
 =?utf-8?B?UlNkano3cUE3U3ljSVc5QVhFN211ZHBxdHM0TUNiUit5SDZKNEhrd21HUEhM?=
 =?utf-8?B?RGNYRUNXRk04bGlqSUlmUTh5VUh2aGlmc3VaUEVtN2J0WGdFOE5ma3hyNFg0?=
 =?utf-8?B?RjFoUVVaWTNHcTBDcXlnQXVvZ1VXMy9EUTdDa3lXTUh5bEtXTG9JMzVNWVJE?=
 =?utf-8?B?aDNtSHlTTkZrMDFuc1REbjZxWlVmSit1MVp3d2cwSXdWNi9aLzg3VU44eXAy?=
 =?utf-8?B?SlpaV0kyRGhPWVZOTUxOYWFNVElYZlkyUXZkSG9XTUhPSE5OZkZOZ3lKcEgz?=
 =?utf-8?B?MXpBeGxQRmpEdUF6QzhwejJHYjBKai9zSGRCdk1MTzlJbXB4QzJoTUtuOU5u?=
 =?utf-8?B?ZUhIdTZsYndGSktMd05veEVUZGk3WnVSeU45M3BYRTRCZzFsNlJSWmZ6Z0VR?=
 =?utf-8?B?VlY2NnVBbXpxSlQ2eXpkeEJTekxuUUViajBUaFlMcHFxTWRqSEJsR2c5QnZJ?=
 =?utf-8?B?ai80Q1pQbzU2aGd5WGJTTDF2WG53OEwvZ2dNUWRaYy8zZDVyS2RsODFhL2lm?=
 =?utf-8?B?UFpvejNpRTkzRXBFQWF6cXRFTjVsRnc2Zit2UWRWdUw4TWpaWVhlTDd6M0lC?=
 =?utf-8?B?eUk1ZEkxMDM1ZE10V3NRUjZOOUQyKzBNWk1JVW42RkdxcDNqRlpuSU1XODRa?=
 =?utf-8?B?eFU4SFVtVElKang2MXN1VW93Wng0SUZHSHpvcUNQMHFLSHBTMVdjLzJhU0pW?=
 =?utf-8?B?aWhTYVZ4SWNGUVlqMExzZ2MzclNQcklNdEdMUFA0dlVyRWF5WUsxdXpMUlky?=
 =?utf-8?B?bm1IVnFCWnZkRWpOaWRScGFsZ2RORW9xRGxOdCs2Mm1SUHFqeE5ITHVZUkNJ?=
 =?utf-8?B?eHc4Q3pxMjNZWjVFMnVPTGhrMDZBZmRwTm1RL0pEd0psK045ZWMzMUJ6aGl4?=
 =?utf-8?B?eng1UVF5Wmo5VTBWcVRFTTVRZ3MrWkExSG9GdU1abForb29xNTE2MHVPNml5?=
 =?utf-8?B?eWRveDJvVmorcWRHNjd3ZnZkOG5yVzY0dnByQ2tDdW5hR2IvTlRtc0dxemY2?=
 =?utf-8?B?cy9tR1Z1d1duZ1V4Ti93dFNwSkp5dlVCbWtPeWZPQVM5ZlVKSm5FcDJPb2xr?=
 =?utf-8?B?c2tIdGx0OHhFZUcra25aaDNpRk8wb29KM1NXV3pQTXZmdFE5KzE3akJWZzgy?=
 =?utf-8?B?WWxsUWZHRzhDNHF5QU1DczdRNUxEdEk5WDdXb0hsMWdCSE1TRDV1Ukk1MHY2?=
 =?utf-8?B?bnJZdzdxVTY2eVZnV3hlYjZRK1NDYThRQ2piMzlxaHBYUlFQb1BEMW5YcjFY?=
 =?utf-8?B?RjVpaTJ3NEMzVzh3RGdUUkdNa0RRU2phdFJVTTRQaGJ2SDBMenVFWktkaXJ5?=
 =?utf-8?B?MXl3MDNTenJzdGZpZVMzM0twSG9PSllyTldLcVVaZ1dQL2pyMjJqa0tXR1hV?=
 =?utf-8?B?aGZpQ1JYNkRDUUw2Q0s4K051VjREYnRWcDVMb3R4a0h4UUxJSTBWb1Y4YURt?=
 =?utf-8?B?eHFDamF0M0NHRERORklSUHJtTThnck9vbldHc0VQWlFuY2xsYWZGb3l6d1NE?=
 =?utf-8?B?VzlJUHhVakNwSkJkRVllZmNCcUNjeTZuaVRsdHJ4Y0N4ZCttMlp5NkI4YWpF?=
 =?utf-8?B?TGdET0NHYVhlSWd1VzQvcDBUVmxhNTFhZXcwU1AyN2F4NnZsN215MGx0UFFn?=
 =?utf-8?B?aTVXSDRCTjQzVWVhUGJVeUtCZ2Y2RWxEUWlJRWZCSDkwb2hIQ0x1dHZXV21a?=
 =?utf-8?B?YUdsd25zR1o4Z3J0dkh1UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bCtLYmg0aEZzU2RpYnBIN25IbmhtbFNXVHNaZ2RkaGJaTTdrQkFIcnlsaFd5?=
 =?utf-8?B?QTh5eFdtYTBJQlBBbEExR2lQTlZPblRMN3dZVkwzTlFRS05ZU25pMlJWaWdr?=
 =?utf-8?B?TWFLcy90N2g2eEMzblZyVWV2cWZoZnF5bXM0VUUxK0pueUZ1UDJOTE5aUzFE?=
 =?utf-8?B?WXNTSm94ckEzTUtZUXFoSUw3S3MyTWcycndYNmpEc1hSYmFGSFIxaTVGaDZS?=
 =?utf-8?B?a01RS01vQ3hRWGt5bWpNdnRiSmg0SGRMdHEwOFlYTEFNUVFKTTh5VmJUd0Jj?=
 =?utf-8?B?bktVaFBlbE5qWWpOVzArL2laUDJwQ3hlazZNMnVSMUtRYmRoTzJlSnpKOHd0?=
 =?utf-8?B?K1JDSjdEL3RuKys5SkR5OTBLWi9XVmNrVzhWVWxqNWhEbUhkVW9SVE55V3BJ?=
 =?utf-8?B?Qy9ia1hzK1BLWlhEcHhrWjd0N3BYSndTSytxMTBxWVV0SUE2U00vVFlPVUNj?=
 =?utf-8?B?c3Z2YndGdHptMzg3MlIva3poVThzTllITkhnalVCeEFrRHZIb2hiakkvbkdw?=
 =?utf-8?B?QlViYktEK3RzRDkzYmdyMXk2dmV0ZEkvSnFjNlM3VXBvRW82b21iT1FJM2Jk?=
 =?utf-8?B?MTNSMUZvQnNLU3RPM1pEbzcrRUR4TjVCelJ1U1NkV1BreFRneFZEOVJ0Zzkr?=
 =?utf-8?B?N3Z1b0N3NTJFL01peU40c2Y2NTJRbjlUR1NwaUV0UXRnOWpiazNJQVlYNG5y?=
 =?utf-8?B?cXMwMGJyOXljT3VlMHduVXAwdEd4SlQxd3hmSU9GVXBuWWJDeGNmUDhMQXB1?=
 =?utf-8?B?Z1pvM0xVSGp6dDBBeFduL084ZlFIUlY3dDJoT3FHaG0wVE03Yy9xZkpKSitF?=
 =?utf-8?B?WmsyRGtoM3ZvbXFHYlAweXg0QWZ6WXNUd3psRkQ0QnM1TmxzTDdSdkpDamhV?=
 =?utf-8?B?YXpNcURoT00zWHREeU1tamR2b1NTRmF2bWh1ZVJpZzRuWEkzOWFFRm9URmlT?=
 =?utf-8?B?b1hVY2tnUktyelZmc3lQdnVvUDFHdW1mNXAyU1hqSmxIY1pVc1kvTDhEZ0tI?=
 =?utf-8?B?N1YwKzM4RmRWblFaUEViOVVIYTlTRGRoTkZwcUJROER1MytrOGl6Um9Va1hR?=
 =?utf-8?B?ZGpnWWdOR2Z1UXNGUEt6U3o1VHp1SWhpMzhBWkI1SC96aGN3djdTSjAzNjl0?=
 =?utf-8?B?YlVkeEszYWMwa0NvKzJUNlltenFXYm9EaCtYdmd2aHVVT3lObjZSU1MzQk1n?=
 =?utf-8?B?d3dGTFI0R1pqbEVzQXNNbU1vdVdaMW1vdUs2OHNmWW1zQmRKYjVYZ2dYLzVV?=
 =?utf-8?B?aVdmTk0xa1cybXZnRVVFdGNDeEFZdXNVQVEyUFZGU1hxSzRUOWIwSlNnZC9U?=
 =?utf-8?B?Q3E5aWZjZit0cUZrREJZZng5R1lqL3VWclk1WGFRai9jLzZ3djJ2TWI4YVRa?=
 =?utf-8?B?elh2TktKcWYxcDJIYnVNaGZZSkdKZE81RTBPRFNmbVBqWlBqcm5JZkdYZitN?=
 =?utf-8?B?aFJTYVFKQWpNV3MwQ1RIMTU3K0RySi9uV2pLcllYSThtWENzd2JSY3NyUXIw?=
 =?utf-8?B?VU9wZ3l1MW5KOG90bmFnTDhDWm5pNHVsRFZ5NzAvNzA1amlVa3FMN29HQkdG?=
 =?utf-8?B?Z1pQdnNvN29MWUZvOHRMWTZMRlJJbmFBSkRER3VoK0ZnZHNhSVhDaVdQR2JI?=
 =?utf-8?B?M3J4aFVSTFdVZGp3dTZ5RHp4OXMvRmFzYzVabnQ1WmhyRGp5S2FjdlN2Yklj?=
 =?utf-8?B?SnlQKzUvK0hhalJ0Z1BzNjQ5VGxiN0ZZNGpSdWxQTDNIYTZraXRqOEUvQTZa?=
 =?utf-8?B?ODBFLzBONzVnSGpid3Z2ZXV1MGJaMFBKM2hlOEUzQmszMGw4S0lSSmlCNVI0?=
 =?utf-8?B?MUlxY1pPemc4Z09iVGtnenRGbkNlY3lQQzd1bzBsS2w5WWhqbkNNZlZ5RmRQ?=
 =?utf-8?B?NmhFd3JuQUVqZ0JZWmlxdU9YVkdSa3ZnNFlDY0JVbXpaNWVONnRIY1pPVVFP?=
 =?utf-8?B?MFdsYnJ2Wk9hTThtbCtMb3BpVHpVa29VempoQlBLWUlScTBIVnZBblRKTWE2?=
 =?utf-8?B?bXJMY2xwSVAwTkh0K3BFanExS1poNVEwTkJ3amorVFFGOXBLNFIwL092TUtT?=
 =?utf-8?B?L25VNFhabmc5RDB1Q05nUTRheFJZS25abDg3czh0WXEvRE82b21PWmI4bk9w?=
 =?utf-8?B?WkUva3VRY25GS01zZlhMVjd3TVB5MzVQa1YxcmJBVmVGUGhKa2V4UXBJczVH?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3ac2b0-0b9a-40c9-f799-08dd72995f25
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 10:22:00.9517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wd/Gkh3f56/lTurM1YrBgut5ZcBIu7EQ8CGuH7n0gPBXLshsdfEMpRafMLQVzz89d0ep+NgUctuK9RsuzYltz2LeulE+JNmzy8sbyhCA5wY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5169
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

On Thu, Apr 03, 2025 at 10:34:38AM +0200, Zbigniew Kempczyński wrote:
> Upcoming render-copy stress test reveals problem where multiple
> threads enter binding code. Before binding/unbinding threads calls
> alloc/free which collects operations to be executed in single vm_bind
> ioctl. If first thread which fetches all binding operations from the
> allocator will be interleaved by second thread which in turn sees no
> operations are necessary to complete, it will start to execute jobs
> without properly bounded offsets in the vm (it thinks addresses are
> already there as there's no operations in the allocator).
> 
> Avoid this situation by migrating mutex lock to the place where thread
> performing binding will finish its job. This will ensure any other
> threads will wait until all binding operations are completed.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

I confirm this solves the problem seen with another series [1] on LNL:

    (xe_render_copy:8244) [thread:8970] intel_ctx-CRITICAL: Test assertion failure function intel_ctx_xe_exec, file ../lib/intel_ctx.c:467:
    (xe_render_copy:8244) [thread:8970] intel_ctx-CRITICAL: Failed assertion: __intel_ctx_xe_exec(ctx, ahnd, bb_offset) == 0
    (xe_render_copy:8244) [thread:8970] intel_ctx-CRITICAL: error: -125 != 0

So:
Reviewed-by: Francois Dugast <francois.dugast@intel.com>

[1] https://patchwork.freedesktop.org/patch/646197/?series=145831&rev=7#comment_1182552

Thanks,
Francois

> ---
>  lib/intel_allocator.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index 341db2a502..d22c70f1f7 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -1535,10 +1535,11 @@ static void __xe_op_bind(struct ahnd_info *ainfo, uint32_t sync_in, uint32_t syn
>  			igt_map_remove(ainfo->bind_map, &obj->handle,
>  				       map_entry_free_func);
>  	}
> -	pthread_mutex_unlock(&ainfo->bind_map_mutex);
>  
>  	xe_bind_unbind_async(ainfo->fd, ainfo->vm, 0, &obj_list, sync_in, sync_out);
>  
> +	pthread_mutex_unlock(&ainfo->bind_map_mutex);
> +
>  	igt_list_for_each_entry_safe(entry, tmp, &obj_list, link) {
>  		igt_list_del(&entry->link);
>  		free(entry);
> -- 
> 2.34.1
> 
