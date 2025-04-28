Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C967C369D9
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 09:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0371A10E3D9;
	Mon, 28 Apr 2025 09:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOOlJhq1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703E710E0B1
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745830777; x=1777366777;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=UM9dNYHEYBhtY2Ij2/QV8hG84hzsvgBz1gK7JPh7D6o=;
 b=OOOlJhq1olnWZA+ymDlzBcPAyrmqk5pMCY/rEpTt8aMq5tAdFv67ahwL
 93CpV5BnJRlQ3W9EDdFybmCrfkODVNsbiNHVZp9jHMpylFrn4T4Vs/J3y
 Cck/66Shk3FSaYWTcPs+eZWi6PHBpmj98qw2XwnKx6KCjbgKNmY8Emfjh
 hF2f8h3OPZLt9Ze8tldR/4hEu3kXeAO5SHFw9EJ4wJV14BDNwEdu/Uzac
 Svy9gMSR4NN7LBzXeMMOsp+OWft7DomCK5pZrKcbuAb/gosCSYBJ4LjGR
 t+7+fS6Izylqjv6Ia6Yn+Ku3gssWbyRN6rvHD+lby1W2TnbjVCraZaMEK Q==;
X-CSE-ConnectionGUID: iS3QuguzR2yQnrEhfej2sw==
X-CSE-MsgGUID: ssao6bs+Rr6tS2Fp9rDyDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47539869"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208,217";a="47539869"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 01:59:32 -0700
X-CSE-ConnectionGUID: K0pzeLGZTrCg5qSzUDTeTQ==
X-CSE-MsgGUID: csa6jOjOTVSMYNSe8HXcNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
 d="scan'208,217";a="133384085"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 01:59:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 01:59:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 01:59:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 01:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgYffVHmP65LddQEKi6wvpWruenIUZz3XTUk45TBbnq+e/Y9KZo1INXtBSZpKqkDmAeSpY7we8riaGHgtodY1hfx8iJKo8GEJX3UtsI/AoJKL0Nz0Ya4j1Rl07VCDpN57Xw6cVa86GRsAKjCgmykryGQ2Hb9T30AGzcR0iV89eHRO6tHjQt/8MovF3uKnNdBMSsUoke/qEeWCbYeyaQzEf6uzFUKKYp7knuiZPA0dcBXJzHQfdCqjLOe3zpyyk1slSrSx3idSxX9qPhoacd0YNN5naAN/P2JR7ZIqNLpxq6D23ZhPKbM8ztTyp8+891Yf1M4O0MJn4VLRaX8/j2j+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWjmLWjZQvd35Ch+pgik5Y0zrqVHo/HMvPKRtU6x05U=;
 b=GrbFC2YCHmi8LBsiZDP6E6o6ggyfjAeOnkQ0h1YtqRc5zBOgXmXRsotklnWSzsPUQdlsO5QrPCpaXfRVezPi2/C6cTVpiWMa7wD+6r4iBXddDqbtNhN+yAOlQFxJ7f3RW5rWHmNLgdM33ftl0t+9fg0NStIn5cq7jDPxHD/V3r018j4EW9cFrpKWyAxWP2Qj9ZPSZo1/uhCrEZtNBY/kfObJHaPVk812AUQg0AGhv7eOP8xXdsRDD/EgG95pYgEyxgZR2r+rKhZo/4toPml8gNRQRiBLNYTj24TuGlYyo0wZ1HLATuVmlQD/w/3UJAqGenosHtTzWIYcJkdYUufWzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 08:58:45 +0000
Received: from DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2]) by DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 08:58:45 +0000
Content-Type: multipart/alternative;
 boundary="------------OzBEM8fTBAVzoH0gUBZocQXt"
Message-ID: <e86fbec9-3025-451b-b767-32aed38be5da@intel.com>
Date: Mon, 28 Apr 2025 14:28:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_pmu: Fix frequency stashing issue
To: "Anirban, Sk" <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250425180658.2533825-1-sk.anirban@intel.com>
 <3f88eb7e-f2e9-4b45-8b6d-61156db5b2e4@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <3f88eb7e-f2e9-4b45-8b6d-61156db5b2e4@intel.com>
X-ClientProxiedBy: MA0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::6) To DS0PR11MB7766.namprd11.prod.outlook.com
 (2603:10b6:8:138::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7766:EE_|CH3PR11MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2d4662-d6e9-4138-ed73-08dd8632e1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXFPM2JnY1lZaHV1cGFQOWtoc1lWU2hLTjhWalhsYi9ocFJDNk0rYk9YdW5n?=
 =?utf-8?B?angzSThoZlI2WkdDRUI5WUZjSStScmlYOSt2Wm03bjFyc0RXNkdCREQxcVh4?=
 =?utf-8?B?Uy9GTmV4UDBnMTdnQW5LazFwRWhxTml2UlUwdERaOXI4VjI3TEptSWtTSERH?=
 =?utf-8?B?bHRibWhONk9PNSswdDBUY3RneURUcUxXeUNBNldFdEduMDd3QUxOODJEVG9M?=
 =?utf-8?B?bnNOcWtrbGErK2FPZThQL1dhU0F4NHBoajMzVUl1ZkFYYnJyUTUxdHp5MHhJ?=
 =?utf-8?B?dmlkSlpNMjJVN3dRTkxKYXNsNVBSdm45RnJDSkFMZ2dtZDJIcTBlZ1Z0ZkZ4?=
 =?utf-8?B?ZTMvZGtpMXpZTUhQSkh1d3dNbW9LTjUvVTVhaXQzck1ucEVTTTlVc2JidE1V?=
 =?utf-8?B?RmFuaWtXYWpnbytHUDVkZUN4RVppM3FQdXZNTHgrL0NNci9VMkJhRjE4Umx4?=
 =?utf-8?B?NVZnRjNNZW9kUmF0bHVseGJPQUJmUWNtdVI3UGdDZHBQTDd3NW9mQ1BObDlw?=
 =?utf-8?B?N0VvT1pwaDZOTEpsRTRPcmlQVEpCSkFjMlBCandqWmgxUjUvWkV0eHk1ekh0?=
 =?utf-8?B?akpIUkYzMk9OakJzVWl4YWFnZjg0YlBJelVvR1MwYmJBWklleHc5cCtiMjN4?=
 =?utf-8?B?OUN3UDlUMW96bG1ZVWo5VFlueDNXL25WT0svUk9pOHkwN052c0JTUE9IYXRs?=
 =?utf-8?B?VExVN0tYaGRNTTBpMGptK3NXR25JMXlzOTF1Vnk0QlJhaytKdzlJK2l3VkJ1?=
 =?utf-8?B?aXNqUi9NbW1YcFFQNnQ4TmJaeUc2Yk8xanh1T2gxZklCVFpMbk54UUdJV1Zr?=
 =?utf-8?B?Vm1aaFJUWGw4R2JwQzdNR0lKaEgwZTNuQmZ3TDltWC9TQnZoRDRiQlFqYzh3?=
 =?utf-8?B?aWRxdVJKQUNheUdOTVhoNWFybTQrdGZqRmFveWp1ZFlwR01QZitnSGpabCtM?=
 =?utf-8?B?Mm13WWEveGUrK1dlUjJ1Ykl0NzYwc2RkaHkxT3pPNnVqU3ZlMm5MMUd6eVlj?=
 =?utf-8?B?NC9DR1VEajc2UmtHMnR0VzFRcmJVQnhkckFBY0Z6ckxVbHA2TzBEVENJaXJ3?=
 =?utf-8?B?N2l4S3MxNFRUWFNlRW1qWlZDQUhWcHpkVEV4R1c4V2QyQk8wZXAwdnVXQS9y?=
 =?utf-8?B?OHltSTZZU0N1Z2Y2SGtML0k4dEpuMEhZeE14bkE2SUdLVndVVUprMjVGWjNj?=
 =?utf-8?B?MFdaVTBRdDVRYUI4MEpXR09hY1lZTnZPOEIzVjJjNk0xMXprSmIwTk4ydmdr?=
 =?utf-8?B?T0I1cWhzOThnQWFnSW10NzkxekdXQkdZUzFoS2pzZkVtUXNvZWxzQlZTcFFk?=
 =?utf-8?B?Y0pVK2ZkcFZkT0JxNU13T1VJL1g3UTBQcW9OdVFiVk8yMTNQSzBrOGJvbkF1?=
 =?utf-8?B?OXY1QTR6eUgvRWZwRWs3YnhmYjhRSmRUQnpGampoQWNLUXFyRUo1akk5VU1r?=
 =?utf-8?B?N0xFWjlCN1ZzWGo1UmZsTm44OVVOTFR4L1pQenlQeWNUVjFoUGZ4SlorVVhv?=
 =?utf-8?B?YUE3UDR1LzlzVXQ3UW56eTIxb3dzT0YzYTZEMWZ5bkNFdy9KM3dZKytnU2ZG?=
 =?utf-8?B?MzcvTVRvZGREdmdPNmVNVENNN0tNMlZLY2NxZDRiOUtma1NRNVhIVW5uY0V0?=
 =?utf-8?B?UldIR0gyYTdkc3BkeG02dXFYZE4vaDNJUnlxQVRLcTFhcnRoZng4S1owZGwr?=
 =?utf-8?B?VDJoQldER05PNzhMWHdrclhjSWhtcml1dy84djJUbVlwRFN3RnM1dHZEWVNm?=
 =?utf-8?B?UUxpVmJiZGd2L3gyRUIxY2ZrNVMxRjVqNkM1ZEpPQmw2RnBKb1lld3ZReWNP?=
 =?utf-8?B?VGpYYnpMMEJNTHh0RVZDMElDa2tIOFJpblpjMVYvNXo1U3VtL3NyMDhsaGVu?=
 =?utf-8?B?MHMrNHp5VUZYOXNKbDlaOHoyRFZjR2pSbmxNZ3JSdllwSFFJMUFSOFpEdE14?=
 =?utf-8?Q?tUit4nHO4uw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTNGd2lkclBGNjdTZWZFQUR0Uk5lOW1kQUZscFQ5K1F1bUM2ZXJoUjlaa21T?=
 =?utf-8?B?S0Rod3lCaTZHZFZBajdhMUYvUFpTWGo1UXVUOGROS25TQ2h1bDZzaFlCWWd4?=
 =?utf-8?B?V0t6bHFHZGR0Y1ZxVjdyektjTmp6eFNxaklQR1ZtRlF0RGZTcXFjMTI1VjJP?=
 =?utf-8?B?WDZuY2dISEpHVDlyVDZoc0xIU2FTK2hUN0U4aHhPRXdrRUJkUTFzSUY4cjRk?=
 =?utf-8?B?NUcyckxSYWRiOVk1T0NVVmY5SG03OUIvUldMK3VlSVkrbitDQXgyOHFGanZS?=
 =?utf-8?B?MmVGNitsRmQ5QkNVZ2JlMVcrckgrQTRyd2NsRzlRZ1ZMc2pDc2VyRzFTNnlJ?=
 =?utf-8?B?dHZCeVU1cFEzbFNaNFdEWkJZYTk3OTF4RjVwWEo2QnJVNmVFTjljK3ZEa1dp?=
 =?utf-8?B?WjdqT1J2YXNpTnBTQ1ZUYmVhaG5WOG9ZQ0ZJaUxPbE9aR3RQRG1zOTFPTk8v?=
 =?utf-8?B?R3orUXFSdW5wMThwM1k2ZE1JaGJEdXQ4RXpwU210VVo5UjlOUE1pN1RGaXdK?=
 =?utf-8?B?TjRNNFZEMU8zaFEyMW54QWxJQ2FzT3A4SHBvWDNBeDBMbTRmUGtTT2pkRm1u?=
 =?utf-8?B?VVVJeDdOK1NveUZndDN2SEE0VzFnZTJDUUZYNlZUNUNQTGhYbUY4VzdtU2N0?=
 =?utf-8?B?RG9hTFlXZHl4RkJzb1d5MDRKVW5IT05WZ0FKbEgyeFdVR09OZEp2dnZBNlRU?=
 =?utf-8?B?MW5QQU4wL0NBemREMEt6Z0kzNC9mbUl4UUh1UFlHTnZmSXRXZ2JoRGI2Wnd2?=
 =?utf-8?B?bC9MSCswUGV3MjNFT1ZDamtXUHM4cHp3S29jVGN1OGZ6ZUpqZUgySFhDUEVT?=
 =?utf-8?B?S3Q2emh3TWs1Y1JKNWd3N0o4WVdJK1FuY3p4MUg5d05KbW4rZy80d0QvRDZx?=
 =?utf-8?B?NXAvNUV2VHNrRjZZaGFlZSszWlkrUkErVDVxcVVETmNGN2YrWndxZ21Ic25q?=
 =?utf-8?B?TFF4SEY1ZE9VSmFyaDNmUjI5ZGIzVDM4VE1UODB5a085c01maXBtUTI3YThB?=
 =?utf-8?B?WWdOVlREK3QxNFZhVWtjOVRzY25qVXd0Mk9qNGNMUHhJNHJ3UGhyRGZvVUlV?=
 =?utf-8?B?Z1VxbUJ2T2kzUTJTa1J3aVRmSTk1ZWVOSnlqRzRrbTg1Z1lySVFnbEFsWExN?=
 =?utf-8?B?QWRheHNPQ21HSlFya3gzWFBYSmxJZWRBY0R1TkZuUm9rc2hoZFJMbEY3NHBD?=
 =?utf-8?B?dDQ3WlRma1VqSkR6V1g4eitrUk9uTWE0d0ZMRlpSeHVibDBhRS9aOSsxcitY?=
 =?utf-8?B?Zk84ZlFmQzZVOFd4eS82MTJSL1V6N0laNVl0aE1EUFN1S2RWeWYvaUtaRk03?=
 =?utf-8?B?dGhRaGNSMXkyNWE0MysvZEJTMEttM1NWNzRLMEVkOWRUU2xrdnJicGlnYkcx?=
 =?utf-8?B?MTc3TVpvUUlzMHRNa1MySWkvVnl6czhnQXBBeWVYMnFXMVByc1dlTVJrMkwy?=
 =?utf-8?B?NnNDaE5NUGQyN1NXNUFJczNOaTdjQk0yNmVlZGdyaFo3ZXRSWkVna1ZDZm1H?=
 =?utf-8?B?ZGVRMm1KTVJTL3ZXTnNBMUk1QXZqVDdBS1M2c1JZZnIvZG9iQnFxSFRZS1FR?=
 =?utf-8?B?QUtOMzVmRHlSOEVKRk1Wa0NMZjc2d1hqa1FxT1psWUtlRHdCR2IzUlZIbWVO?=
 =?utf-8?B?c2taUVBpWVI1VVVPeWNTbWIxYnJFdUFrQ00zdHphZ1d3MDlBVU8yRlhiejhr?=
 =?utf-8?B?VHBIRlRCM0hVWG81Vjg0ekhPRS9oZHRZeFBucjJ3T2prODdoUDlnSk12R255?=
 =?utf-8?B?MlIrN0FKZlNqVWhvMXY5NE81R2d4S2YzVktpWlprSTF1a1F2eUdhc3pGaytn?=
 =?utf-8?B?Q3pLbEY3OHVRT2dDUVF4eFJySlFnUXROd0xHQlhmZTBwL3FaVmg2Kzg5OTVH?=
 =?utf-8?B?Wi9UVFFwN1g2NkVKcGEzSkVSWWZwUzhDb3hIZGxEWVRXUnBMVUo3anQ1cUFU?=
 =?utf-8?B?emxXWUtqSFZyZVNjQ2JyazErY2QxV0VQdVVhZ2xYdkQ3eUhXdnZWMVIwdDZ5?=
 =?utf-8?B?RG5RQ25oK0VYSG1WSlZ1ZGx6a1BiZTdBa3pDTWs5K3JXTGNpR3FzeitqbkRl?=
 =?utf-8?B?ekVXS0c3STNtMUc3ZW1CS2RQZ08yeFlsbVc0elJ6S29qVjUvL0ZldVpSRDFw?=
 =?utf-8?B?ZmpRUXJZblZoMUNZVG5XOVNkWTRPWWhRTUF3NnRYV25aTlpuaXpaQjFhWVk5?=
 =?utf-8?Q?+cX1kVhdvIFKNXHPEoVq55k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2d4662-d6e9-4138-ed73-08dd8632e1bf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 08:58:45.4185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4SLCapl+3hik2T2JtuWr9D3ypqs9p2rkJeWFoe2y1gLmOOocdmhAtc3lG7lVd1AbCgtaKduQdOlOiqDG3x6QU5nL4vZPRVFIhziTiHchcgZFNE2LsAD9LMv40K9YtMB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 28 Apr 2025 09:28:04 +0000
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

--------------OzBEM8fTBAVzoH0gUBZocQXt
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 28-04-2025 11:06, Anirban, Sk wrote:
>
>
> On 25-04-2025 23:36, sk.anirban@intel.com wrote:
>> From: Sk Anirban <sk.anirban@intel.com>
>>
>> Resolved the frequency stashing problem by accurately
>> dereferencing the pointers, ensuring the minimum and
>> maximum frequencies are correctly restored.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_pmu.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 589c7cbde..094dc0c6c 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -527,8 +527,8 @@ static void stash_gt_freq(int fd, uint32_t 
>> **stash_min, uint32_t **stash_max)
>>       igt_skip_on(*stash_min == NULL || *stash_max == NULL);
>>         xe_for_each_gt(fd, gt) {
>> -        *stash_min[gt] = xe_gt_get_freq(fd, gt, "min");
>> -        *stash_max[gt] = xe_gt_get_freq(fd, gt, "max");
>> +        (*stash_min)[gt] = xe_gt_get_freq(fd, gt, "min");
>> +        (*stash_max)[gt] = xe_gt_get_freq(fd, gt, "max");
>>       }
>>   }
>
It looks good to me.

Reviewed-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>


--------------OzBEM8fTBAVzoH0gUBZocQXt
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 28-04-2025 11:06, Anirban, Sk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3f88eb7e-f2e9-4b45-8b6d-61156db5b2e4@intel.com">
      <br>
      <br>
      On 25-04-2025 23:36, <a class="moz-txt-link-abbreviated" href="mailto:sk.anirban@intel.com">sk.anirban@intel.com</a> wrote:
      <br>
      <blockquote type="cite">From: Sk Anirban
        <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
        <br>
        <br>
        Resolved the frequency stashing problem by accurately
        <br>
        dereferencing the pointers, ensuring the minimum and
        <br>
        maximum frequencies are correctly restored.
        <br>
        <br>
        Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; tests/intel/xe_pmu.c | 4 ++--
        <br>
        &nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)
        <br>
        <br>
        diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
        <br>
        index 589c7cbde..094dc0c6c 100644
        <br>
        --- a/tests/intel/xe_pmu.c
        <br>
        +++ b/tests/intel/xe_pmu.c
        <br>
        @@ -527,8 +527,8 @@ static void stash_gt_freq(int fd, uint32_t
        **stash_min, uint32_t **stash_max)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on(*stash_min == NULL || *stash_max == NULL);
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_for_each_gt(fd, gt) {
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *stash_min[gt] = xe_gt_get_freq(fd, gt, &quot;min&quot;);
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *stash_max[gt] = xe_gt_get_freq(fd, gt, &quot;max&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*stash_min)[gt] = xe_gt_get_freq(fd, gt, &quot;min&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*stash_max)[gt] = xe_gt_get_freq(fd, gt, &quot;max&quot;);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; }
        <br>
        &nbsp; </blockquote>
      <br>
    </blockquote>
    <p>It looks good to me.</p>
    <p><span style="color: rgb(36, 36, 36); font-family: &quot;Cascadia Mono&quot;, Consolas, ui-monospace, Menlo, Monaco, monospace; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Reviewed-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a></span></p>
    <p><br>
    </p>
  </body>
</html>

--------------OzBEM8fTBAVzoH0gUBZocQXt--
