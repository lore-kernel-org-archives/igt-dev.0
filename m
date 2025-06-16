Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D813CC71159
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 17:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEC110E089;
	Mon, 16 Jun 2025 17:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+E8qzKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2699610E089
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 17:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750096132; x=1781632132;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Rx/3OqrebC3QLGBadSHKDQatDACbHNcMKGt9d9VpVA=;
 b=F+E8qzKEXTsl77ODPGh3ugpy2hmlwK4qBiPdbPhlYsby9DaUaJcdWTFQ
 FGDakYfzHGe7SRfYrUSnwYkMSciN3h7KK72WrCTkFgFZImRi9z7QwllLA
 iIwqJQwMragWWDqIBpaEqxY0/uzPpoLf6e7rGuoXvUNiclsIbQpGzlcxm
 0k9iU/BnjhTO844i61EMQ+4ca7VnpUgW8OPWM0BYc3TvzRGYNb3Vhl2jL
 OeMhn1N3dyMukwiPsW6Jjjg6q7yBawAwJM/NWBvGcE6IvdQYjlUtYHCwe
 G6MuhRjALb9jIugPyD5il1F2tAH6n+LiMl/hyBAcEILVHKZq/EkDBwUM/ Q==;
X-CSE-ConnectionGUID: V3/I/cDkRV6bJIJScKCg2w==
X-CSE-MsgGUID: gpjM38nTS7qDlkjmyFe9Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="74784776"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="74784776"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 10:48:51 -0700
X-CSE-ConnectionGUID: GiUIt8stTZ65X3f221ll8w==
X-CSE-MsgGUID: jYnQq87NQCqkRONecVunzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="185800001"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 10:48:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 10:48:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 10:48:49 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.65)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 10:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPLYKuNLKhAUcHmmK1JHqtTps/WH0NhzX5jy7nI60eO2kXLk/gzphhFUWQ76ZloN1jQEW1KNca/koXQ0TkuOruxjrv0bfZhNC17hl5lUwwBA2chY6gOwfAlkPCv1D/a2PqW5bN6Sphd1Sho0PhmhAW96t9NTllC1eBEgZ278QUu3IZnOFzqE8b0ECs4WQ6opeWR4xdeIT7/Qlgzx6Fiyh1AzuF/E0D+04+alisjk7yA6BWH+0s55ZlIFTj+L4ju43QAjU+MTWyu1BEbbT+NyfrSEMClOCRq/bVGiMfSkRHIwdjhKrKfYdws4E6w/GjioE7yw8fkO6JADuuOjHzOdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGG+Hp6tMcYpDn/aLUSbcMbh8uJb+zj5qtmXsxhJnQc=;
 b=zDDm+y6zsK3xdiEUf/uX777qzoL5478EplSFJSnJWSfjQSarkoiNUVUuJCf0nRGVVfKUXnX4BXv5Nz6sak8NDqbJSwuYU0/J1dbH0d7jXeglfqf3IwXjp+pZOktSg7OavXkVrOYQKUn/6HBYU+PLfjZM6RM3S1SDc+PtcaxWQW7x9DxIu7gW8rOHl4Pdux6QaXcKUqL+zHqzDoe/Ic6gVjFpuKtWtn/HIqCanGyo4XpbjPGPYD1xDN7/AbVHqHBl5N+JDtXzLduCF0uLB/P1Ck1bxmHDj6MRWlevqHE96qP/fswMZjqyHtj8d/brUGMjGK6AADu8AvsEWLrzCaokiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6772.namprd11.prod.outlook.com (2603:10b6:510:1b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 17:48:47 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 17:48:47 +0000
Date: Mon, 16 Jun 2025 10:48:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] drm-uapi/xe: Sync with OAM uapi updates
Message-ID: <aFBY_XKDD1Ukv649@unerlige-desk.amr.corp.intel.com>
References: <20250614010827.3477175-1-ashutosh.dixit@intel.com>
 <20250614010827.3477175-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250614010827.3477175-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: YQXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: f72a202c-173e-4f3f-47b0-08ddacfe0bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDAyRHR6YitrRE05aUp5Yno3RGEvaWVQS2RzWllzREVuaE53aFN1YUZzdDg3?=
 =?utf-8?B?K2ZhbXJEcXF0WEdIUlB2L1VwKzA1Qm5xd2FoYzBtQnpsRG5vNjhIRStkWXF0?=
 =?utf-8?B?R1NJQVhDeHNXd0lzS1J5Q2pLQWgxZ1lud1FJbS8vai9Vb21KOXovamJsYlpj?=
 =?utf-8?B?OVhhcUNjc1RWWE9WbFJBa2dURGd2dzkrVU5EMkhwTFdKTEJzN2E1RWk3eWFv?=
 =?utf-8?B?VVhIMFdpZnlhZTlGazFaREZZMWRnRDJnT1BuNjBvZnl5U0oyVFFGcEtzUThi?=
 =?utf-8?B?L0ttMzdoSmI3a3h0Tm5hK3FaVy8zMjJnRVpKVTNydTM4enhvcjZHTXZLZHpx?=
 =?utf-8?B?K2lpdWJvWFRxZDUyMHJ1b2V0SW42OVdvK1cyQno4cU9EMTBOa1JYQ3NQblBH?=
 =?utf-8?B?ZTdQVThtUDJDTGNzVzFDMG9sanFQUmdkMnYvcVd5NW5CbFRuWDdpM3cvYmZW?=
 =?utf-8?B?RmQ3eWN4SU5sNDFlWGJ4elBhNXFUbDVvZGMyVFB2Z3QySU1hRll0ZWlDNUV1?=
 =?utf-8?B?UUtKZDhWcVcvcDFMWTE3cC9mbjJzdERmTUhtTjB2d3oxRUsrejNLSUNxeWRq?=
 =?utf-8?B?L0RVM3FEWURCc09tRkhDb1htYUFGSzVGR2t2RG9XNGtiOEpmbXc0K1FUUTJx?=
 =?utf-8?B?RzlGOVRwWks5SnFlTEFLWU1xNUVtOGpLQlpmdFFhOFVONWhwenUyVHFMUmZo?=
 =?utf-8?B?Wi9zSitTQXZ0MXRsUnJ2bXVNc3JvamEwTTJpd0xobFRmRkxLTmZpdVk0cVJs?=
 =?utf-8?B?Sm5tZEs1V1ZQRXFodXdONEh0UmNHV1ovblNmRmx6WFdXczgwVUpWU2RsWjdS?=
 =?utf-8?B?ZkRBTUlmM0kwZU81MldNVURzb3BEZVFwdzI5M3ZtQTRjbjBUb2svbml5U0wz?=
 =?utf-8?B?Wjk2OWVISERpODljQzdzVjF0TUpUd0dDUnU4dEJpZUVweWxVNEVUUVltYTJV?=
 =?utf-8?B?Zi96V01QdG84V0ovZXhsY0p6eW1hdDJKdkovZzVST3VPVUowbThEZTBUZk5s?=
 =?utf-8?B?dVVMTTFhSy9Oa1hQb1VSVkdLU1B2KzNIT0tONlB1c0l1QnN5ei9KM2xiSEox?=
 =?utf-8?B?aWtyeTNrUlQ0VW5hRGU3SFo3SEpINlRLbFJlVlJEVU5HU2tRWUh2K0g3TE5H?=
 =?utf-8?B?Lzg3WnB1am1VaUhMMmNEKy95M1JycTFIYWs3NjYyNFYwK0NWWkF3K2EzOG12?=
 =?utf-8?B?UGRwcWg2OEVQdlYyYkFJNFBDVEluL1NJcUVsSHBzTTMzMEVhekQ2TUlGVUc1?=
 =?utf-8?B?cFN5cXdEMXRzNEdwNGxrWE9sSzlPRHFIWWdLSnRkVDVLKzJ1UFhoRXhwa3Rj?=
 =?utf-8?B?aHVyOUZ5eldFWGxyOGZ5aHNlcE5yRVBOZzRlN2tzc1g1TjMwSC9YZnlDV3N5?=
 =?utf-8?B?Z3hIbFFWajRPdk1HUzcvVnpRRjR5OTA4MFloTk1SeXhFcy9sUmxkRFJHcnRQ?=
 =?utf-8?B?VkVocE9Fd0NCSU16ekNLOVorbnNxU0xCc1dGMDRRc0xld0FOMzJuSkVQSkFn?=
 =?utf-8?B?Zzh5SFVrd2xaMGtCNG9oYzdSMU9Sek1jNTJwck1WUGx0bXpldGF3TzExZGRp?=
 =?utf-8?B?bTRlVTVCVGdZQjk4OFVxQkc5dDJPR1R4ZEthYnQ1VDdqOGJhSGYvaFdzWkJl?=
 =?utf-8?B?SEFRZC9pOWlyYWZUMXo1UzREM1pWVm5aUmdsMjZINnlCR3U4OXZOS3RGcFVj?=
 =?utf-8?B?ODRQTHQ5eEt1dWszK21zOGtheEdQc3BqOTVRL2tMdEJGeFU5Z2owUFdveDdt?=
 =?utf-8?B?dzMwY1NDNDJtSG5INkJiYlZBOG14TzU0bG1WVU1TQkVJTUplWU9IL1d2SXZU?=
 =?utf-8?B?aHF2cWtGUEdqWmN1b0VuOHZHZldhZkZKUEJXamhxMmNrNS9nd2gyd0krSHoz?=
 =?utf-8?B?bHU0ZnRuS0hsdEtmR1hPeGsvS0JDbWJSZ2h5WUlIcjUwbklJUE1HUkQydzZI?=
 =?utf-8?Q?ov8DA6ebiL8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2IrQzFzamJOQVB0WVk0TS9ZQlhvdlZmb3ZYUnlmQno5NWdCcmtONmZmQ2tO?=
 =?utf-8?B?Zm5RSm9CcDc5dDVVQlIwTkp3Uzk2Yzg3RFd6ZDJEbmtYRFVibTl2bHdJcVlR?=
 =?utf-8?B?Z0tZQTgzNTJtcWdiU05HWHBsbEVjNzMwT3ZlWTlzeXpDdXRNdldndzA1N3JB?=
 =?utf-8?B?RjcvN25TMTNlRDVCRE03WFpnS0c1eUt1djgybTMxTFd5M3ZLb0Z0blNuUEZ2?=
 =?utf-8?B?Y1BFbFBvSjFWck93ZExCdXlFMW5QNFFTZTRaRVhkQ1pqY1luR0ZZTDN5bXZ3?=
 =?utf-8?B?cDFsU1M3R2FZT2lQSmI0RTdKeDJleW1tbVMzYmFGNjJNOFJEYzQ4WXpHUmw1?=
 =?utf-8?B?UHA2WjhZMVRTZUZwbkN6RVhmbGVHakhlR3lwakkvaDNORmdUZHgrazdERWNu?=
 =?utf-8?B?eUdQWXlrTTNZZHpMcnNmQWVIODk0ajhIaXBrT09yWUg5U2Z2YktvbkYxRGJv?=
 =?utf-8?B?SnIxSkNBWVZVbThLWmt4eU9KZWM5NUJQUEFBQk9kclJ0N1JZd1YyOXYvbzhI?=
 =?utf-8?B?RFpWczBkTnQvVnVab2djRFRpRkRvWnRmMTNuNkUrU2ZoOGhNUldEbXQ4aW1L?=
 =?utf-8?B?Sk1wZkltSTN0Z1kzQm0wYkhVTjI0Z0hUcnpNb3hTcXhDUzdXWklkbFhyVzha?=
 =?utf-8?B?SVNqRWttZDFHdGhWTkozUzd1UEJ4Q1Brb0dLWVJzN2RmekMvNElOTUprcFFU?=
 =?utf-8?B?ZGR3RGN3eGlUWG9FMVhsRWs5dmNHYmdXeFJJZml6eC9SNFA3KytBaElDQlRE?=
 =?utf-8?B?dW94WVdVTTMxYTU2bUI1U3hVenhpQ3lFVDI5aEt0M01jVjhBbUhSR3BtWjls?=
 =?utf-8?B?UVFTWnF2cEJwMDFSYlFCMGUvZFpobXppWEhJcHNuZnVaWXowSWlpWDBpVzRT?=
 =?utf-8?B?NStnZjBjSTZMS0hiN1ovUFo5V25OdldoRHh4WWxMWlR6d1E0b2EzNnZYSVZS?=
 =?utf-8?B?V21Jb3FQcWgwWGVpZWNYRkVWNWF4L3VaWWFmb2FPN2o4UkVPR2lBRE84Y0gw?=
 =?utf-8?B?Tjh6VzlzMmh3dmdCaTR1RVAwWjZCZDRUWWlHV1F0NGtIMXJhMkpyWVpHV0NO?=
 =?utf-8?B?UVpPd1ZXWXl3VzZsTFoxQ1cvS3VSWVlvWWlWbUpIbnJ4RVV5L1MzR1hEbVlL?=
 =?utf-8?B?eXVJWmd5RS9pekpzTSthU2pFMFVYaUZ1UjBpU3RxOUNQZU8xdFhsZXh5ZXU1?=
 =?utf-8?B?VzVKNUg2YW9KNEFlMEJEMDNKV0Y3akxEaWtoWjExbHVneEN6d2JGSlJ3UG5t?=
 =?utf-8?B?NVV4dmFHazBEbXlGb3lUTmlpbi9XQkoxWFZCSXVNMnFJQm9GOXVsRHQyTENi?=
 =?utf-8?B?MTVyRHJoQldJUzg4WXlVbm80bVYyemZ3UEdzTk1ZTkxybTZWTVVGQzJWTnNu?=
 =?utf-8?B?TmhvUVd3MGQxVVQ2bGwwcU5PWllhYWVnTGRDVGFlL0pUUmRVTEx5K1J4NGt2?=
 =?utf-8?B?eStCN1RXcFdNM3hGSGV2cDhzRllKZ1RSYndjTEo1bE5qME1vanVGL1dGdnVi?=
 =?utf-8?B?Y0czV2xERUwrMUpOZStPcUtiRXFvOXljNWF5ZHJJWERRTkxKVGttaGVjWHRx?=
 =?utf-8?B?NDAwbktmZFZYeTVwK3NCZDB4R1FEUTc4a2xkTTlZS2ZFNE1pQ0w3YndxRDBj?=
 =?utf-8?B?ZEViZHJrcVFuUC96RHprNFZpNWFDNWwvU0ViYmlVM3J2U3hyZFA5VDNtWFM1?=
 =?utf-8?B?MkU3SXBLcjE0MXBJK092cnZjYllaNnVXUFF5R0Z5dlY5MFJ0aDgrbzdBOElV?=
 =?utf-8?B?RTYxcUhuZmQyeTU0WUtrNUhsU3oreXIxVXJZWFNvTHEvZld0eFk0TkozWnBN?=
 =?utf-8?B?OThKbWFLOG9TSlZUSTBha2JwQ1RVM0phYSt1THpNMHN3NkYvSTBsWEVjeWNN?=
 =?utf-8?B?Uk9YOTJETW42b0UxVi9ibHZWV3BmOGl2TUloR2FnZzhPcjV1MzVwRnFOeXc0?=
 =?utf-8?B?dmJicFZGSnU5R2FBQVlNaERPMHBEWkFqTWw5VnRUUUpMZ25JQ2hVWFZzbnQx?=
 =?utf-8?B?T0hvZkl5bGQ5dnkvYlNwTk5nUU9Bd1h4UzBBMkpZeE9LUHVmcVZnSXloY0E3?=
 =?utf-8?B?TENyZWJPMGZXbzR3THdjeDh0bW05R2c4elI5a0N6TEZtcnNoZ0dPOUdOdzNo?=
 =?utf-8?B?cTNSWnVUUzZtR3FXWXlLWjVGQ2pwbzVZdFg1SUttM0diOXRHR1o3QVFXcUh3?=
 =?utf-8?Q?wNJCbxCnePwUKhJsqtstmB4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f72a202c-173e-4f3f-47b0-08ddacfe0bd1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 17:48:47.7673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUj6PZcTX/IzfkkBCFbnJaXJ47LF7i7OOnzwOK/IR1MUSpKKichWnlGbIrBBmfpXnLN9ms+K9fOegTxeSdgYeJfYk7vi/o4PjbZZr8JkIsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6772
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

On Fri, Jun 13, 2025 at 06:08:26PM -0700, Ashutosh Dixit wrote:
>Align with kernel commit TBD ("drm/xe/oa/uapi: Expose media OA units").

but this pulls in pxp comments too. If that's intentional, you could 
just edit commit message to make it generic drm sync.

Irrespective, LGTM

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
>This commit will be replaced by the actual commit for OAM uapi changes
>after OAM kernel changes are merged.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> include/drm-uapi/xe_drm.h | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
>diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>index c90fab1b00..a52f955936 100644
>--- a/include/drm-uapi/xe_drm.h
>+++ b/include/drm-uapi/xe_drm.h
>@@ -1210,6 +1210,11 @@ struct drm_xe_vm_bind {
>  *    there is no need to explicitly set that. When a queue of type
>  *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
>  *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
>+ *    The user is expected to query the PXP status via the query ioctl (see
>+ *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
>+ *    attempting to create a queue with this property. When a queue is created
>+ *    before PXP is ready, the ioctl will return -EBUSY if init is still in
>+ *    progress or -EIO if init failed.
>  *    Given that going into a power-saving state kills PXP HWDRM sessions,
>  *    runtime PM will be blocked while queues of this type are alive.
>  *    All PXP queues will be killed if a PXP invalidation event occurs.
>@@ -1612,6 +1617,9 @@ enum drm_xe_oa_unit_type {
>
> 	/** @DRM_XE_OA_UNIT_TYPE_OAM: OAM OA unit */
> 	DRM_XE_OA_UNIT_TYPE_OAM,
>+
>+	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
>+	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
> };
>
> /**
>@@ -1633,6 +1641,7 @@ struct drm_xe_oa_unit {
> #define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
> #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
> #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
>+#define DRM_XE_OA_CAPS_OAM		(1 << 4)
>
> 	/** @oa_timestamp_freq: OA timestamp freq */
> 	__u64 oa_timestamp_freq;
>-- 
>2.48.1
>
