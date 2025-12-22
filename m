Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347DFE674B1
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 14:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04AC10E6B6;
	Mon, 22 Dec 2025 14:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpopSv/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C8710E6B6
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766412317; x=1797948317;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pQeX4QPfD52cYpbHls58X7VlDOpxm9Q3d0wlQqb+nKA=;
 b=XpopSv/VZGxykGfBRZmydCXQcl+H38kg90nXe5DXNx+E8lU3oILHk+8K
 P/IJpRejPmjkw9phP8GgOqq5x2QDymGIea3e35ddjkpZgKW1j8CU/yRAc
 mG1uv1xYQ3Ds1wSxfznmYLWLnjWRQAZuU4aOQv53GP2hDvu9Fim/WuRf+
 sec3zvnAbXUucwoLralGvisp8jZKst0dUUdwjb71xwQSPzvu4QIHqlf9A
 McXooV8R8L6sGltDEKvuLbLvr2Di3m45YArDPDS0WBu5pnEutEUtd9kpC
 MzSY+00ix0QaX72h8ibmt3RUybS7oO43uGduPpXg8LAJiXVYcLSvmOVMc A==;
X-CSE-ConnectionGUID: siVvxAxjQ7yrPQbvoeGSSQ==
X-CSE-MsgGUID: ypFxiWMLQdmuc6IeZOyJyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="93737246"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="93737246"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:05:17 -0800
X-CSE-ConnectionGUID: 3jXPBbJiTrGSeBP9Wxm7MA==
X-CSE-MsgGUID: /myrxJ65RnmZuNKJ0jHaKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="199567378"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:05:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:05:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 06:05:15 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:05:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJIVRCzTYUj2dcWcsGRD+gbCimkaAoDwGT09l6DFQyA7CVKZ73yrFZcqsrWjCCmEaS0vyz/29q4xjsZnE8ayWHSQYx5HWwKtRXuLXZ8Mq6KFEaY5WI9aflaxMv4+TqYdDEMkokSs83fqKPbBRi6X68SVvWYzYRBMi2/fz8pg5SwXvFkCQLK9eSxnITPF0gvOHR8w4lVLq157IlaatVrTw71cYac8MlkT4MjLbAMAgO9AygLBv/IFD8/dz52ACGvrKbBJmAXeztbsCjkm6x5gsFj/iwS9Jf1Y5RS9g0hlB8nmJRyH4bbsxGiiCn1WTgixb9DRxWQQ6BxrbS2D+P426w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8JKW11hQ5+e4PzZ5Ax3aywHndNgEPw1lNf/Jm1JneE=;
 b=Jy51dtKl+Wpw5+EGY01XmoZ1jMZMZzqR3cZjsKRK2czbU/Hxe2q55em/DTc/JIcf8cyAVIcNOO8mB7x7hB+OodFaAx5QpEhznf1qADM7EhPxoa7EvtSZw7PItT4sEuqKy/aRjZnITu0xWlO/eXf9MUuSV9OM2yiifbrXqBw0Swy8uBb2dodvggtIbuVPSayM/7hpImMjZkgSl5HxpxBTeV0RcGfkHMzD4X72aiv1eNhWsSzdceEljFKDtKmxULLR2O3oFaWyieDA04h+tR0gSBzhQBSgV60vvlrfazPUvvf67Yw4PMUd3SOTd6UQEB7Qq29nWDfIXXjF+38wlETyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS4PPF1DFB73954.namprd11.prod.outlook.com (2603:10b6:f:fc02::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 14:05:13 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 14:05:12 +0000
Message-ID: <45f51b80-71cb-4856-b42b-69aa49e65e40@intel.com>
Date: Mon, 22 Dec 2025 19:35:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v7 7/8] tests/kms_colorop_helper: Cast pixel values
 to double
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
 <20251219112606.1330425-8-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219112606.1330425-8-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::26) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS4PPF1DFB73954:EE_
X-MS-Office365-Filtering-Correlation-Id: c13491b7-9158-43ee-2bb6-08de41631fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3IxUDlMQ2R5UGpXczNrYU9uM05RTHpRTFZZbWFydmg2bmwveXVGZjBxNGFj?=
 =?utf-8?B?UGROWE9wUUo1WlhUc3NNTzJ3WUhaQWkzV2lueWw3c1pCUWRXTG5URUhwaGMy?=
 =?utf-8?B?U2hMR0VDZFpqRUlpNWZsSXZnWTdvK1pNTitYTHB6elF2NFRvWktZZlk1Um80?=
 =?utf-8?B?RTNwVHRqU2s4Mm51UE5KYmY4MWl0bTVtdWg3YlJyYWI2TUROclVOREtuZ3p4?=
 =?utf-8?B?bHpvREtldFEzVFZQQ3Q5Y0dIRGhTOHVmRHhyZnRqbUp1ZHNpaGxuZy9WN0RF?=
 =?utf-8?B?aEdocWNlUTFIN0VFYUgweE9PRDJoZUZMRUFUcHFaelc4bGpyU1JpNDh3NGJu?=
 =?utf-8?B?c0hOMlNveFNUbFQ2NEp1MXlzaXFqZUdkMDhvcDdwL2RiZ084b0NrVi9wZWJr?=
 =?utf-8?B?QzRHd01qRzNRR2E3RjRRNEVZWG5XWGpzN2V6Qjl0a21JMXJyYVRjc0FPMi9r?=
 =?utf-8?B?UlloMWVLTkRuUWdQOFhvR1B4WjNXODVGci96VHAzdDBUbHhZMXN4Ny84VENs?=
 =?utf-8?B?azVxZS82eWNsT3ZYS3JUTGZXSmkzN2dnUUxjaVZ5Tnk3R0wyYTNMbFJuaytH?=
 =?utf-8?B?VSs1dE4zbXFpaVpBcUdERnpOL1d2Y050WFRidSs0UzNNZ3RwTG9EeGFRcFN5?=
 =?utf-8?B?MGpjLzJhL3JqNkNzQW5CaHpwRityV3JqMUwyaGV0N1ZIRWVTbkFhQURFdkg1?=
 =?utf-8?B?YktTVkhpRDRRdm1sMmREU01BYVJSSGtTeEpnRVJkKzhGRUMzNUFnRktvYkJD?=
 =?utf-8?B?SVh5dnAvOHJUT0tNSjM2aE8wSjlOb2phOUMrRzlLSEtuUFhMaUxtczZsU2tM?=
 =?utf-8?B?dlRqN3V0MERwbmpvb1BJcGpuQlVqTE92bFRpV0VyMHlWRDZ2ZEtRUjM0WjFk?=
 =?utf-8?B?ejVOcXBXSGUyMklZRUtybjB1M0svV3R4MXBzTGZCaDJzeGJTZzJsTTAyUjRs?=
 =?utf-8?B?QUFERWVTbmJNL3lSakFxd25Ea09SWlI1OHp0R0EzUXVOOUdaNGFEdGZ1MVRV?=
 =?utf-8?B?OUQ3VWpsZDRBelAxN3MzcE1YMUlDNEhKbEhjTVBiZGFYQ1I2enFzMDVtOU8v?=
 =?utf-8?B?c0UvbWprUVlXOTdNMXQxbFVQd0VuQXVCRTdrblBtckloa3p2NlJkU1FwQVNz?=
 =?utf-8?B?K1BEWE5mWjB3VGVINGcxZkxOc0pzY1QzeTNyeU5xd1ZPd1RhYWhQY2lwU28y?=
 =?utf-8?B?OFFQaGt4Y1VmSm8xK2Q5Qk94b0pYS25jZHdJdkw3cHdPQ1lWS3ZnTFJYNmlX?=
 =?utf-8?B?UDRRMUU2VTI3R0NhSkhGMUhkNmJmTFB5R1diNzJkV1FRcVNuOFo2cFBGbDJN?=
 =?utf-8?B?Z21yUkdKd2Q2SE9WREFhdDF2YmpFSExyTHdzOXZpdU9vWkRVdXgrUUdhT3BN?=
 =?utf-8?B?L3Mvc3RHZmV5VXlMakorK3p0VmxaVEtOVUtDUm05eHRQYm5XcTA0UDBkNHk0?=
 =?utf-8?B?MTUzWjBTWUxxeDJsaWRFTGk2RVI4UTY5RUt4U3FhRFd5cGZRa1U3QkRnajBW?=
 =?utf-8?B?YjJkamo1dVJjeUN2aUxrS3RUZy9qZlBRSTh2QTFmVEdwTHpKNFAwdEcrT1My?=
 =?utf-8?B?UDlWMUdRa2UyaXZwTFBGaXp2UC9SOFhWYUk4OVRTeVZnamc5b0hBVlhTcTll?=
 =?utf-8?B?VnFQdGdZRmVLbmNzZ203N1NJWjJQbUVicXZaYzRPOU9mTmQ0L0NHUUg5YUJs?=
 =?utf-8?B?bFVSeEJmVlRwNkI5MjIrMjZsMjhBTVZubHRTTmpOUkx4NXBPNTlubWx3WElJ?=
 =?utf-8?B?V1NlVHZuc2ppaUxoRVM1L1pocTBkcWlRQzVrelNycUpRcFcvblhxTlE1Rzl4?=
 =?utf-8?B?bVoyQUtBVXVzTzlVb3ljeTdpMUhlL05DMGd5czhqUGhkNDFYbkxZU1Vsd09V?=
 =?utf-8?B?eUJsMFhJQ2Vud2N4NVdBaWV6bU15eUVHMDBiR1JsS3U2RHNJcTJYeGVXQ1ZZ?=
 =?utf-8?Q?bX+n3xDEADQwusLcxUfwKS3/F/Rrf9DD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OC9FenFMTEVvVkY4dHEvRHJoZDlOLy8zcHg0Vnc2U0NaZ1MwS0dJaG1seGdP?=
 =?utf-8?B?VVFHdXZqRTB0NXd3Y2xrdUVoc2p5anBPSUpVZE0zRGxiRzlWREJEK1dONVpV?=
 =?utf-8?B?aEJaM3hJeWZEN3ZOZG9HRWNkQmJRK3lGYm1iS0ZTTU9ON3ZZb21XMEpLcmdO?=
 =?utf-8?B?T0dsZ1dEa0dPZCtJdStNU1VrLzNvdmlNMk9ndUd1NWUrMy9xVGoweGt3VWgx?=
 =?utf-8?B?ekhVK1BuYW9vcTFmeFlNTEJUWkpsc2ZNWGYwZzBiNDhhQjJrUWwyQVZQcmVG?=
 =?utf-8?B?V201cnQ1R1BOMk1nay9GK04vUFlCNStxamxTeEpRNWVjMklDT2lzMWN5bFBr?=
 =?utf-8?B?T0dITmFxdmh1TEpPcFZsWDAyN1BLVGoyUngxVm1pcFRLZHl4MW9HUWF3V0Qy?=
 =?utf-8?B?VjhnT0Q2cm9jQmd6UUpicFFldEk5Z2tPUG5pOXlqQm9pMGJjZmtQSFk1NVpu?=
 =?utf-8?B?NkdUazlqTVlYY3ZvbnJqNEN5bFdGR3VDK3QyR2hNUWVLOXRUeFhIL2haa2ZS?=
 =?utf-8?B?b1R3VzFCajdkaVI4MG5pT2RXd1FwRU1SalRjeHp4REQyTFBmQ0RxbFMvaXZj?=
 =?utf-8?B?ZmxzcW50UmwrYjV2ZUM0Y1F4ZHM3akhNUUtpNWN1ZGo0UHduMXJtUjFSMzRs?=
 =?utf-8?B?V1JIZmJmMUUvWUhQck45VHRuMlBrclU2ZGQ2dE8wazdUcld1NmE1TlRxdlhs?=
 =?utf-8?B?emJtSVNOTnhPTkVhdVV0cy9BWTR6bWhNcWJOM2dvTVJacWduNkx2Vjl0V2tR?=
 =?utf-8?B?T29yTVIxV3FjNjROeHczQ0IxWlJ6K2dNQlE1L0pkZHJWZHUzOC9iRzVub0gw?=
 =?utf-8?B?T2RFbzIwWmQvYWx1c2J4U1p5M0FJWkVqRUpVUHhsUWg3S0hpMEJhbHB3Q01R?=
 =?utf-8?B?SkdOdjB5RzJlVGswdmh0LzM0K3kvQngxZFRScGhMQzJ4eSt4TkVQU3dzVFhD?=
 =?utf-8?B?RTVYS3N1Ni8yRWtLbjlVeE1sYWhCaVpKdnV5THNrMEY0dlJJVUJoNS80Y1p3?=
 =?utf-8?B?RE9jT2kvTDlpays1MGlzZ3JxQkZpb09ycGQzVjBZc1FibEs1NFpOVHZMWnhk?=
 =?utf-8?B?cldGOHBVTnhhM1lvaldHaDljczZ1T1hCQWZMOUJDbHpkVzlwWkF5c3RkdHBk?=
 =?utf-8?B?VmZJYWtmZDhMS2VmQWdxV1ZyRklHeDhEdUVKdXBLM25aOHFQZEc2bkVTb2Zv?=
 =?utf-8?B?eGcxbkxDdUt6L25iSWRMUEtzMTlOM2d2MWV3eThEb1QrUU5MOUtYUnVWYlR1?=
 =?utf-8?B?TDlVbXgwZG53cldsZlNOZWdvRjRodHpQaUtlQmQyVGhGY2RHaExpV2RJWFk1?=
 =?utf-8?B?VThSRXlGclJTRnRFbmhMQmxCYWttUXBLd3hwN0ZXeWI5ODFzaGRxdUNwTGdC?=
 =?utf-8?B?KzlaQ3pzMk8zZ2lobjdEdHNMaHZCYml3Z254YU9TeHd5SDA1aHRDR0tqY2hK?=
 =?utf-8?B?OHYrTHF5WkJZbk1pM09pNzF1T0hpYitmRkN6YUVZSmRBelh2V2Y1dGN1Rkpq?=
 =?utf-8?B?TjcvS2ZXRkhaai8waWtoNnppczh2SEVEMUw4QS83TmxzMFBjWWF0UVdNTDhK?=
 =?utf-8?B?YnlHYUFPOE9UOWJaNzVJUXhHanN4RTZHWDU4c1FhWmRzT21FdEhqV0lCMnZN?=
 =?utf-8?B?SXBSdUtOVU52MXprNTIrdGs5NHNJKzJSMytEa0lFcTgrRW5TcWtWa1RDbnJv?=
 =?utf-8?B?b2hvWW5MWkFmSE9uSG9lRENnNUc4YysvVmlINmFWaTM4MjFjYllsWmxKV1VU?=
 =?utf-8?B?cGRDQjZQTWZUZjM5RmpsbHFEdWxmcVdGREZFQ0w4MFZka2Y2RFBCTGcrQnhR?=
 =?utf-8?B?RndBNDNnVVYxNlQyR1NpMTI4LzlydHBGZzRvbkJiOW0wdHllcUVTSmcrUVpQ?=
 =?utf-8?B?VzIrbzM3UHpDOWg1c3RlRVFlWVJRNnUvbTZzS3gwV0wyRThHbmJITk1YZGNC?=
 =?utf-8?B?cTR5USsrUDkyRVhydkVFYlJPZUdaVWVpd0JkeERGOVlSMDZxbmk5TDB6aTdE?=
 =?utf-8?B?MFJ3akx6cGt2RW9Fc3o3RDl5U25aMTdSd3lFc3EwL3o4S0FBakl3V090NVFs?=
 =?utf-8?B?QzlMQWN4R0R6aFdXUmIzQ3oxMnZUOVIzSDNnY3JOR1FCWGJTNjFVWGxtdlJ2?=
 =?utf-8?B?OVEwTkRGOXc4eHlsVXp2SGpndFhCcXNDVDV6NDF6T3M4WGFRQUVVV1YrTlhM?=
 =?utf-8?B?TkNaN3U4VUNaejlyRGE3K3hPcFhvaUREajR2USt0K2NiMWlqOWlQTGxXMnc0?=
 =?utf-8?B?Qzh5a0lDWURGd3dTR291WUlIVGsyalhlQmQ5Nmw3bE1Ec1BYREQ5RHM2c1VI?=
 =?utf-8?B?NGhHUEFaalpwNXZCMVZqRys4VlhnSmFTUis3REh4NU9aZmNVUE1kWWZpRjN6?=
 =?utf-8?Q?HQcLGST0dkmXeZlw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c13491b7-9158-43ee-2bb6-08de41631fe7
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 14:05:12.8827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03qdqSyR/UrmxFCFIZCOTWRuXHTC+zvQ9YuPdbkwa6WFKhJ8tBQUxaF2+Cu7QYZdMyRIl68+jRk4FFWXzWZZcUearVWttNEPQWHgtgh8g3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1DFB73954
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



On 12/19/2025 4:56 PM, Swati Sharma wrote:
> Explicitly cast transformed pixel channel values to double before
> scaling by UINT_MAX.

We should mention that we need this to avoid overflows for values 
approaching 1.0

Also move this patch before the patches that deals with MAX LUT values.

Otherwise LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_colorop_helper.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index da95ec72d..ffc81f01c 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -300,9 +300,9 @@ static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
>   
>   		colorop->transform(&pixel);
>   
> -		colorop->lut1d->lut[i].red = pixel.r * UINT_MAX;
> -		colorop->lut1d->lut[i].green = pixel.g * UINT_MAX;
> -		colorop->lut1d->lut[i].blue = pixel.b * UINT_MAX;
> +		colorop->lut1d->lut[i].red = (double)pixel.r * UINT_MAX;
> +		colorop->lut1d->lut[i].green = (double)pixel.g * UINT_MAX;
> +		colorop->lut1d->lut[i].blue = (double)pixel.b * UINT_MAX;
>   	}
>   }
>   

