Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F19AC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 06:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A1310E645;
	Thu,  8 Aug 2024 06:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqvD0eOD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EBA10E645
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2024 06:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723096827; x=1754632827;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=20NTO83VIpijPV9IlyEksHpuIwo2P3LBilVKW2YJF+s=;
 b=KqvD0eODqoMU0HC2pc57U1vd+NXKTV8jF3dUAtrCt4713nGHND0urv1e
 +u/gAYRq0zcUGhbH/dM+nMn1OSPwc6SGj7OE6QwMguK2p31nzf1hEvp/Z
 avlOIF5VaQhPnexUAy966dPDfgYWQYsMpGADw8WchtHH2ipfWZlElkFJr
 VsjTnjLc2h34HnUd2o2Q+GfBbjkkx6WlUx2nv4z1gi9EQxNBxBP5gOfR3
 YC+vkrz+bXHd1ZdzYEpUyW2Xhozl7jstgF3EolMQt+AgAhIFr/3IC+CBM
 LJWXcGfvEsfYoCzoYZtiTC+Jsz1h9utLZtgkSxA1SbTJ9dahGDGtFz45L A==;
X-CSE-ConnectionGUID: mTZZ/jJuTxWyWDynx5QkfQ==
X-CSE-MsgGUID: k92aBKyTRxGBD+g0D8m7gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38708192"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="38708192"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 23:00:25 -0700
X-CSE-ConnectionGUID: jnSfePd4TheC1AzFGLI0eg==
X-CSE-MsgGUID: JnABBRi6TuugGRmqBugyng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="61217593"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 23:00:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 23:00:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 23:00:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 23:00:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 23:00:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJU3CC6m1W+UiSgsuq5ezkZmmpDgSu1o+PiefTmXt0uPJYpY5LUzpSH5i9Tw7phkFa/6FO0KaBvHJm8NFxSSo78h9HO8frg+IpJ1AzixN+Rrvr/6iKphg9prwSNSw/SSXjvl7TAEP+fWZsi9UgJrVg2hP1wk33QPBjA63Gt+XG1phmFs8GStmSid1WIBdzSS54ARjyvX3ohL84rGMewC4IPPiWH9Qe8Z6eZpQ3rcL62wTafWHAnZfrav7bHkZeJpsb1Bz9c3tWzbzglKu5a1e0FpftyqiF5CjEY8RTm1bc1JxQVdxQPIYu/JQGNSsMVcuKiwGZcxswniTOEJdCm6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+sqkAZndd2gTy+yJwN3IMadcjGBeqGcuSJWzFckk34=;
 b=AZpczZdzntXzai5J61KB7GBSht200irriqu/wXSuJztQij79rTd4wWzwbEcof//HFpUBiwk+twj+aTqIwo0D98tFle8hoxH016KO2Vb3vWpvWYQsZNRAkCUlIKSNFSOmhDiHtqjcHkBUmK72DvQ6ztJjP6xs6lmhwCR4evxGr3BY4TOuXq7lI4IMzrUoNiQ/BfTqPqME16ze1Vii72JoRowApP2gJJ4gddth+eaoDvVmmTTu+MUELytwETl1niosxEs/KQ6lEbNoY+fS80O5ot2FYm36N8bq7XrtzVeR8yQO/Do+fISNycHQVHhLrl6/dRSlCNufLUeRCIPAYv+w7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Thu, 8 Aug
 2024 06:00:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 06:00:16 +0000
Date: Thu, 8 Aug 2024 01:00:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/xe_spin: Fix xe_spin_wait_started()
Message-ID: <sih52mw4xzqzapnhcqjabp2rwikajr5rfowok5l5ahvexkv4az@gn4v436ibbz6>
References: <20240731033504.1426640-1-lucas.demarchi@intel.com>
 <20240731033504.1426640-3-lucas.demarchi@intel.com>
 <20240731060652.w3zpciijmu3myvdn@zkempczy-mobl2>
 <20240801054254.eycl66ikumhryetf@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240801054254.eycl66ikumhryetf@zkempczy-mobl2>
X-ClientProxiedBy: MW4PR03CA0270.namprd03.prod.outlook.com
 (2603:10b6:303:b4::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 36935f74-d9c9-405e-28f3-08dcb76f6018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmFua1VpTWxQK0Zkbkg5Wngrc1lkMUV3UEU1dURvTi9ZOVB2ZWpKdUp1bUtK?=
 =?utf-8?B?S3V0MVkvN0g2RCtNWFRkQVNtYzh5M2ZibVhzeE9CYXQ4Z3ZWRVNwbklFNVl4?=
 =?utf-8?B?dGlKRnovbU1vN3dqekd4Q3Y2ajUwdUpIKzlUSWtyWGZkdU51RG1EZktSbHp0?=
 =?utf-8?B?Z0RIRnZZVGEvOVNwSklLbWNsSW93WU1XdloyRVc5dnBOcTdnL3JzTDVmd1RT?=
 =?utf-8?B?WStTajBuQUxiYlR1TWN6OXAwUWJVZTdTMnZQTFBLa3ByN0JGcWhVM0NsNXJF?=
 =?utf-8?B?V0hyWXUvdHhGSFVSQVFCMlY5eTlyVW1URldpSzNXdGpYWkdlS0hLeG5QV01H?=
 =?utf-8?B?eWl6M3BkS2lVRHhXc2g1UEVxZCtrTjZsWkxmZGxlYlZmVm12Q3FkTHl3SGN0?=
 =?utf-8?B?QWxVYkJlZG81TUl5SnVsRlM4YWRkVU03L0lGYTZlUGJzd3cvcHVpZGVMdTJV?=
 =?utf-8?B?UUhBZCsrV1lYYmVmSyt6UmM5dEF5dWZaek5zTnlzeVpZV0xseWRpYU9HOFdW?=
 =?utf-8?B?dUxZMHhDVGpuTXEzQ2F1dVNHR2NvTkovcEFNY1AxRmsxZlordCs2WVpJSmU5?=
 =?utf-8?B?N1pGcy9MRUEwOU8xL2wxS1drYWVJblYvQnVpZ1R4SVJHZE4yM3hFbUZVQ2Vy?=
 =?utf-8?B?ZWpMVDRlNlRpK0tRc1ZFaFFLVWxoR3ZQUEVqLzVJZXEyMWM3cGNiWjNML2d3?=
 =?utf-8?B?eURpQnI3N1VHQko2UzdNTThyQmNiKzZmeVp1WXVhbkpBRUhsSHZXRVRnMlJl?=
 =?utf-8?B?eWYxeGRrK3MxaUVMMDYzN3VPamNVdVdmTzQ0eXpPejIybkI2ODdheWFyYmxm?=
 =?utf-8?B?eU5HNTRjMmVHcmlJTFlpU1V4QSsyVDg2bCtHblhtdFJteU1zZW1TaWIzcGxD?=
 =?utf-8?B?R3luYXdaazBYaTRGbm1xeE92SjRUcG5uK1dUNDY2eTNmSWVJUGM3NHhFam90?=
 =?utf-8?B?bjVVeWZJRktNRVM1dnZuTVFNS2tuQ0loUGlWbFEvb2dLd1d3RmpMYzlaVFRE?=
 =?utf-8?B?NFVEQlhLd2tNNm4vWmZzQ1RkVk9xSFN6S2ZZYkswWDQvOHArbVlqSzFVdjhu?=
 =?utf-8?B?dndBWDl4ME45bTI4Rkoyd3J2c3ZYVExzTGFyNElwRHd1TGZWMzdENm12NmQ1?=
 =?utf-8?B?WlhsUHVIYmVhMlBla2RmOGRnU2N1QTF1aDdUTFZ5VHdEWlZHbjNDMGRDd1pV?=
 =?utf-8?B?M0ZKcFZHcStGWTFqZ2ZCNER6WWxwVWVwVkFvVlhlTXN0WTNVWnpReWE3YzFP?=
 =?utf-8?B?OEhRQ3hrbXVxQzlwUGZPRzNXeWpyUTBxWGpvU0w2TG5XZ0R2ajZrREFaS1Ja?=
 =?utf-8?B?THMwSjBwbEVuc1FtNUFpbWNESzIra1ViN2tXZFZpdmNvUlRaZmhtUSszU2tz?=
 =?utf-8?B?cU9wekZDUFdvNzJQaHJDeVRNREFlYzh5NGJFRHFobmIycUgvWlovT21EWnI2?=
 =?utf-8?B?R0lLNmVaTVBLTzRYNWlmL1VoUUYyODQ4YlNOSlpYZEowRkdJUmxmNlBBWVBh?=
 =?utf-8?B?bVQ1aDJTQlVUZXBPMFYyeHY2KytOMkNFRGsxaEJPWE5EK2tpVjQ5QU9qaGJH?=
 =?utf-8?B?R1dJMEdDYkxOYUNBZDk3LzBDYUkraCtTK2Vjd2NmblNDS3hjUkRpS0NFTjMy?=
 =?utf-8?B?VGd1T25MTkp6alg5eTBXTXhVV3FDb3lGMWIzaUhFY25IK0VUL2ZxSnp4V0dw?=
 =?utf-8?B?WENTRyszYVVUMTZpb1U2NHl1L0JCT3lSL3dFSTVUbzNpMDZqVk4rT0NMMWZo?=
 =?utf-8?B?R3E5MDRCRi9MbmhHaG9nMmVaVW10aWt1MlQrdUpYa2U2dUR1N05JVDduUHlT?=
 =?utf-8?B?NytUa1AvV1FWS1g0WEJ1QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFMyWTEzNnVRYlRISzFZRURrSDJvTExnMmJRdGo0anpsa2s0WGRmb24xMGho?=
 =?utf-8?B?bGZkcVowNFZMK2llc28xdnI1ZVRBWmRmZHF5Y3BiVXZKbEtmMzRhZDZmQzlZ?=
 =?utf-8?B?dHlTeTRkNjZTbUhSZCsxMDhvQTJkZFozUG9GTmlMS3p6TzZtWWlCenltRkNQ?=
 =?utf-8?B?K1V1ODN2WnhvWTYwYkpHTVJ3WE5vQXBsWk9oMDEvTCttTDBUaUZHY2xpenFI?=
 =?utf-8?B?VUJ5WE9iaUdXcWFpeWttdldRQ1ZsS0ppTmNSRi9Ed2haRG15WHVTVkZudmtD?=
 =?utf-8?B?NWJ4c2JGOVY5ek1BSURYcmhKSW1kd1RhTk9TUU0vS1ZRcTI3SzhTN0loZ3NH?=
 =?utf-8?B?RzJLNGlpbExpVDczV0VnZE1lOGR4OUhNam9tMG9VUVVscFhBc1hWcnFJd2tl?=
 =?utf-8?B?NzVqVjdKZVFoYUxVcWxMYXFNWlUyd3o3c1BxeSthdC94UEZ5ZDUybzdrOVA0?=
 =?utf-8?B?WlppVm9TdXNTaGxuV1dSeUZXaEk3NnJlZHlpVXovTXByeUk3RUg5K0NWdC9Z?=
 =?utf-8?B?U3ZkbytTOXpqYWIzK0RZeVBaMkRGaHFLOHNKdEc0cy9LRXpVSW9rOHd6dG9t?=
 =?utf-8?B?UHpUeDczWnFpSkwwZ0dJZkozZDJlZjQ1Nkl0N3A4YlV0dVFqeW42ekJ1RjlE?=
 =?utf-8?B?RUlYMDlDVWNtNEMzVHBWaGhvOUt0LzlSODZWWHJ0TExIMkJab0lxZStIcDln?=
 =?utf-8?B?NHhFUFpMa2JyME1CRlNpd05RZWJqUWRuR1doNVB6SmIxeGtoMXA3N3NUMmpW?=
 =?utf-8?B?RWR2cTFQMjhIdEt6UEorU1haNHRENFBBb0szYmw3TUlMU1F3UW9wM2VSWDU2?=
 =?utf-8?B?R3VCUU9aaEd6WkhLSld3M0NWZEs1OG82RXhPSEFvOVl1QWw1S3d0akkvd2JB?=
 =?utf-8?B?U1ZoY0dFMFlzMktnQ0RIL1FTNDVTUFZiOGRpN0FuMHdTNjFweVR1V1NOWHFM?=
 =?utf-8?B?ZWQrSGJqK2JzMDUvZ3dmbE0raUNEWkptNUtpOWlTTUJYeDdKSjIra0pZUktM?=
 =?utf-8?B?RVBSQ1IrSm5oZ1NzK1ZaT2FEUjdPaUdZUGxFd0R3b0xQbUhCQ1hMN0FudEFM?=
 =?utf-8?B?WUhuNmVZZ2JzOWs3TDJzaW1oUFlaZnhFdmtia01KYi9OQURwT2FuZ25NQVNs?=
 =?utf-8?B?VDdsRzM2VWpzSXl5WGNxR3FYY3I3ZlBZa3VFbzk1YWpENzkyZ25LOTZQcC9X?=
 =?utf-8?B?Um5CWWF6R1NCd0w2ZzJtVEoyQWVENWJ3TWFJall6dFpyV2RabmRqWVdmdmtv?=
 =?utf-8?B?UG1ock1XVFJ6eHpKZkkxVFRsTkduV3NaK25walRBOUQxanBIb21zMFJHU2l0?=
 =?utf-8?B?L2lONGZuZVpxcFlvRGlrMWI3amlUYmNRNytyalh5YVovLzFnUzZYRVU1STZv?=
 =?utf-8?B?OFl5bHpmZmNDeklNZThQdjBWVFdoSVVpMzdoSGxCcHlxT0d6dTExeUxwL2dW?=
 =?utf-8?B?RUFrUWJFNE1uLzNaMDRWZFVPRmo0Z1RMT3djNlRQSzY1QkxaYlRPWjh6ZlFq?=
 =?utf-8?B?cjJWUFg0aFV2b1RpWDgzNWJSbUZXMDZ3QjA2NFVOUTcvVWNwelZ6cTBWMmFW?=
 =?utf-8?B?TngwZmlYOUFITXhQSDAvcUtFb3FLdmdBVlp5bWdXTWk0OC84dm1VTmFKS1U1?=
 =?utf-8?B?bnBoNUFsY0QrZWVvN29FTVVWMHprd0xtd3BkdWRjeFFjbFBXYzRCU1NkTmQr?=
 =?utf-8?B?anh1cnRjWDhnYVdsVVdlQ3VlYXgxK3h3QUdUNVBIZU9oSERjM0RmZFR2amx0?=
 =?utf-8?B?M3F1cDhaLzNkcm02eXVTdkxDcS8vdGRXYmRLUEp3TGlmcXlkaWJFOUZxeHcz?=
 =?utf-8?B?QkNvWmJtdWZTQytOY2dZbjNlZ1lJdEJtbCtyWURMM0JYek50b2hONmEzQ21U?=
 =?utf-8?B?c3liZ3ErNDhuUVZGWjlvWXNkYVlVcXJVZWhIdFJPUFlJN3NJZVJWOGkrRDR1?=
 =?utf-8?B?SGVCRVlGVWJaWGJhYkozNXhmRjUzdHY2Mm1lM2RiaEptaUNVNkNtTVJoZVlE?=
 =?utf-8?B?VjBLZDFWMUFCbmNzTExJQ25RWVhYaVc1R2FOQ2pHb1VIay82LzgxR0pxOU9j?=
 =?utf-8?B?Qk9yNmFQZjZjZG1uRHYyNlNtS09wS1VPRWtMUjZXQkNockNQMVdzSzVGNE5t?=
 =?utf-8?B?WmtVdkRJOGhVK2FMYVMvRTNVZGZITGhaRy9kOVZmb0Z5YzVSQ3B2bHNoM29S?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36935f74-d9c9-405e-28f3-08dcb76f6018
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 06:00:16.3566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bv7Lw8IMv99k0s1W5GHQJi9aj69UZMPEjPW4n2FgoPU61MNTsKLJWu+eUJ3cvdkjtoTFeEe1ik0DfE105NMLNY66yvYVTlPQFBfM/3axElw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
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

On Thu, Aug 01, 2024 at 07:42:54AM GMT, Zbigniew Kempczyński wrote:
>On Wed, Jul 31, 2024 at 08:06:52AM +0200, Zbigniew Kempczyński wrote:
>> On Tue, Jul 30, 2024 at 08:35:03PM -0700, Lucas De Marchi wrote:
>> > Use READ_ONCE() to guarantee we are actually reading the memory written
>> > by the GPU and compiler can't optimize it away.
>> >
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > ---
>> >  lib/xe/xe_spin.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>> > index 3adacc3a8..43a7a43c2 100644
>> > --- a/lib/xe/xe_spin.c
>> > +++ b/lib/xe/xe_spin.c
>> > @@ -166,7 +166,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>> >   */
>> >  bool xe_spin_started(struct xe_spin *spin)
>> >  {
>> > -	return spin->start != 0;
>> > +	return READ_ONCE(spin->start) != 0;
>> >  }
>> >
>> >  /**
>> > --
>> > 2.43.0
>> >
>>
>> Hmm, function is exported and would expect compiler will always
>> read the memory before return. This is part of .so and I don't

right... I was thinking the whole thing would be statically linked to
the tests. Now I see we actually have a libigt.so

>> think this will be inlined to the caller. Where do you observe
>> gpu memory write is not reflected to the cpu?

I didn't. This was just my braindump while trying to understand the
xe_spin and going out on vacations. Now I'm back...


>>
>> --
>> Zbigniew
>>
>
>I wondered about local inlining the function or optimizing which
>will prevent from looping the read (endless loop after single read)
>and I got this when code is optimized but not position independent.
>I mean -O2 produces:
>
>xe_spin_wait_started:
>	cmp     DWORD PTR [rdi], 1
>	jne     .L6
>        ret
>.L6:
>        jmp     .L6

I was actually thinking about xe_spin.o and calls to
xe_spin_wait_started() in the same compilation unit. Could that
function could be inlined and folded in others like
xe_cork_wait_started(). Disassembling the build I get:

void xe_cork_wait_started(struct xe_cork *cork)
{
    d1bc0:       f3 0f 1e fa             endbr64
         xe_spin_wait_started(cork->spin);
    d1bc4:       48 8b 3f                mov    (%rdi),%rdi
    d1bc7:       e9 b4 15 f6 ff          jmp    33180 <xe_spin_wait_started@plt>
    d1bcc:       0f 1f 40 00             nopl   0x0(%rax)

As you said, apparently no, as the function is exported. And xe_spin_wait_started
does do the right loop.

>
>Only -fpic prevents from this optimization.
>
>As Jonathan gave you r-b I'm not going to block this series,
>it is just not necessary imo in this particular case.

Yeah, I don't think this is needed at all. I will drop these 2
patches and keep only the first one.

Thanks
Lucas De Marchi

>
>--
>Zbigniew
