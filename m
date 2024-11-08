Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8CBD5C0EF
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 15:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D3F10E9F2;
	Fri,  8 Nov 2024 15:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OdD818Wi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4558510E9F2
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731080338; x=1762616338;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Io8kEjXNPRANxfPrCzO3uGsL13pkPnKzjK/9Tc3wIgc=;
 b=OdD818Wi1KIybJgr8jdrQ5djHhgGXAcTOAveNCe/ICMLy9ddSDOVW3wS
 0mGhbfEBBfFD5WOfdc/ji1NJi2Qc3cSDRilVehuDsViyvpbuv1IKRzMhW
 Mj3uYBdVIjlxfJQP4ShbfCItBEw5orzzbtppeOJsG7BQNwZPHrpzvdszi
 qQfHuVArWhpcfk3nS83DSMMjB1V40Sb7+YAMYmL8Jide20YYW3XkMklI6
 kJqtJwn4Rl7tD8t+c84v0stEMZJEHYd1FPoDADtL2gkF8GA238JPboVoR
 yJvcAijBiaPtYaKGkFmbkzhURCd93uvyiVxh1A5RtIMEIneOSJh8DG1kt A==;
X-CSE-ConnectionGUID: Wr1Vi1N0QOqvcEtl+MllYQ==
X-CSE-MsgGUID: RwLWGBc8StGn1T9uZPlUug==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="48482303"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="48482303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 07:38:44 -0800
X-CSE-ConnectionGUID: 45vderclQTCl8DQfGy7eQQ==
X-CSE-MsgGUID: fWduG/0NRNusZ33xlimU5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85995633"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 07:38:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 07:38:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 07:38:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 07:38:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNuKm5OntLsRvqA/PROhHhBkqLuesMQqopfOBr401STGJEmXWI1IyVCIeSEjlOw3ZextDN7+DCA1Fm1uoNTQ8vqte2fmyiG7wAhFWZ7OMAd9IU7QtMqbsIYcGqmHrmuRAXfT8tYbOwQhSKbrTYibzTjkVLlOtAXAWISSBGUClAOridmyE9k1novHDO1/PXu21LgofYRnWpFUrwH4BophSb/C24Kp4VSwUazz2hhKmPyrnsKrY8wqS8PwlApusGmVahI+fc7yFknkO9JL4jO6UELY9PiuXPJvH25cCZ0HtKoWwUlX5qGvAEpubbODKPxyIhGVoKLFgCOZQqjbb9wCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3ugm8+syFedt4jTxUSGSY2DTHbnTYJd6BKYqMDlGVE=;
 b=a24zYI4EsiU0m01NjDfFDIPVmpuHedtJPRRI/7+QJOj6QsYRGBJGKkXP3cyxBgvWBp74WJTgq0D6mFuoL+nSdiapyjMh8rcRpUhLHgGW/i7XJ9u0goUKctlxvsYwVVoYsQQ+/U+9Gr1ZB+IB77rAXfDnnn2ZHeaflqWFPTcDGAcmm6wo9NoFL3FEMlgX2o71uLuKSbUJMlVvpARe9rF3yPZRm22ZmVoHJ7YIrkAAOnd6lMYd+bIWM1IZqdbME8Q+vhX6XY+s1nhmnxhy70G83hqkkMDGCN2Zh9LaHCadoSDP9Rb4fmLK0B70VgMUFgqTDxapzCvfzijlBW4DJ7OlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 15:38:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 15:38:37 +0000
Date: Fri, 8 Nov 2024 09:38:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Pravalika Gurram <pravalika.gurram@intel.com>,
 <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/2] lib/xe/xe_spin: move the spinner related functions
 to lib
Message-ID: <tqgdzleut7wpszlynppxjydouilfhyg6eu4s4xguslqnuayl65@r6lpibhpw5jt>
References: <20241108074403.366318-1-pravalika.gurram@intel.com>
 <20241108074403.366318-2-pravalika.gurram@intel.com>
 <20241108090141.yppjx5ilbwkw2lmi@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108090141.yppjx5ilbwkw2lmi@zkempczy-mobl2>
X-ClientProxiedBy: MW4PR04CA0358.namprd04.prod.outlook.com
 (2603:10b6:303:8a::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4800:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cdf96d1-432f-4ad3-67b5-08dd000b69c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlZnSGF0NEkvOVR4NVVpZFpNYWlKd010LytEYzNCd3hzWlg3VDFBTVJoaHNq?=
 =?utf-8?B?T3lwcUpJdE9Jb1hhbFIzK3FxYllrK1FZd1E5ZithS3ZqTnN2dmRodGt6OFJl?=
 =?utf-8?B?MUQ4TGtKcnRMUnQrenFjeXJ6TDBacHdFaW4zT1dPM1R3R00zOTJSOWFlaEFI?=
 =?utf-8?B?cWlJQllidDBMalY5NkRNbXNqYjM5T2xUUklDL0dyWHZUTEtsVHByVnhmUE1S?=
 =?utf-8?B?Uk9rU1hiSmNtMUU1TFVOZFU0cmdxak9EK2Z0TFlVcnF4aUxLZWNhNmdMbkpD?=
 =?utf-8?B?aGFNMmUvQkpLMjArYlY3cEx1Mm1KLzRXdjJjZkhJVjFxVVpQbVc2bDlUOU15?=
 =?utf-8?B?T2VwdXBZc0UxdEJ3Q3BxdVcyc296L0NGcDBrUThtTzREb25yU3hRRnNvZmlD?=
 =?utf-8?B?cTd1UEFtNzBrSUhNeGZQV0JBVWw1S1BQYVRrWHE3bUtOc2NOdGJteTdQeGtM?=
 =?utf-8?B?T3EyK1dVSjBMenZhRFg5Z0p3enFYb002V3JFZ0xnQUN1d2Z1TElnekNydDNl?=
 =?utf-8?B?L29lMmxJWTJtT3owWWVtSGdLbm0rMEVSM0RKay9JK1dJaHZ5Zzg5ZVhyMC9S?=
 =?utf-8?B?amxOZEdMRG05NVNpeXRKVlJUeFdvWEdITFcyc3JSSjZ2bjVpek5VVWxhenRN?=
 =?utf-8?B?VUZkOUQrbXhCMCtlRnh5OU0yWWlaeGo5MXFKalNrb3I2RUZjemYrdTYzQkpy?=
 =?utf-8?B?SjBkSko3V3JlVGFvRk9XNnoweGZBVWlkZjRoRWQ2bERnQkVMdkZ4MnZRYVNZ?=
 =?utf-8?B?M2R2THZMV0dUQmNmTDIzY20yYnU5V1NqM3l4UU83VE1adG80QTdDT0xadmtm?=
 =?utf-8?B?bUc4QUFwQ2I1cjVkdXVPczRZQWN5WlhJZW9MRXpIU3FSRG5JY2lBNVJ5dVVl?=
 =?utf-8?B?WHJIb0pWbEhGeUUwekxiT0t1dE42WElWUDYveXBmS2NveGkvdkN6ME03eERt?=
 =?utf-8?B?UkhGR3dxREhrdGt4LzJxVmtDc1lBK0cwOFZ1R1ZpQnVJQW5WRXVnVkxBMW5G?=
 =?utf-8?B?amJIMVpiRFg0RWYvTzJld2NJWGN6QVhJVmUzaDZ5RWJMU3M2QlpsYnNwYURJ?=
 =?utf-8?B?R2FZZHNDdEl3eEl3Zk5xLzNLWVpSYlgwcEJHLzl6dFp2MWQ5QkNwa2hmVTVu?=
 =?utf-8?B?N3l2anVaRzVTcEcxNGRTaWxVOWNpU3dhODFYRDJnbVBVRVB0ZHRLcTBMeFdJ?=
 =?utf-8?B?cWJ2M0tUdGFWNW1FbmRCV3NBR3pmTytab2o0T081b0xrYjNoZUIvYVg2RlBl?=
 =?utf-8?B?c2ZLTy9qSldXKzF4K0hmTmh0amdvZzVIWWJ3ZFhSNm1RUVA0ZVpPMWN1WEx3?=
 =?utf-8?B?MUtmaGU1WXNTMjVjRHdRWXVOMnppU2VRWk9LTGRPMmV5SXBCYkdadUJoK3dJ?=
 =?utf-8?B?azV2TCtHMlJlWkxzeWtxNDZlbmdXSklIQzd2VXhvQU5aaHhjZ1Rjb1dhalUz?=
 =?utf-8?B?VzNCSUxFblZnblJGSDE5RVVZM1NvNHd5Vm4vdU5MZ2hpUXlVU0ZFVEFxZGNq?=
 =?utf-8?B?TVhVNjQrMUNuSW5vVGFHbHV2d3IzZEhMNDFpTkZnOTZ5ZWlKWHJJcFNyRVov?=
 =?utf-8?B?T1dYSjI4eGFtTFlhS1V3REsxdXhFOEhQRklYb2x5RjZnVXozYmNpNU5DeE14?=
 =?utf-8?B?L3IwWG9VSUNjL0NVOUVYbGgzZFNKNGZSRGRJaDEvcUticC9RRlpabnQ3TUgz?=
 =?utf-8?B?L1FVSEpYQTJXemZhYVFUeC9mNldMSkkwa2xFbUptcjVkdElvUTA1emg3TzF5?=
 =?utf-8?Q?vfrLhrBssjSy3US8J6ST4gqAWF/HgjbdhgiW0yY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmhNYitRekt6anRNRE4vVFZXVTVzZmpSMmYvL1ByYjRFemE0ckp4SUZWc0NK?=
 =?utf-8?B?Nk9UMGlDRFEvdHhoL1BhOXh5NlQwaHlYLzY0azc4c3lLK2E3TXZFWFdVQzRT?=
 =?utf-8?B?b1M4RTlGUFBYZktmSm1Qb1JYNkZJcU9BN29NeTAvbmlBNExrbTIwMVhPWDJP?=
 =?utf-8?B?empkVHlYMExTRFBxZWNsdTJvaDUxQ0dITEdwTWFKY2tFZ0FQbVBtSmpCZGNS?=
 =?utf-8?B?dTRMMGQ1Q1lVQWY2WDMwb1RHN1VZNVowMFlvMjBMOU9DSU95WU12YU44T21u?=
 =?utf-8?B?VFFjdzBDSm1zL0dQbE9JazZNZVFqclczMGlIQWNuZ281VnZUcWc5NW1wMENY?=
 =?utf-8?B?SnNXalBWY3Bid0d3Sm1RU3drSWZXWm45S25ZREF0M2NUVFRzQ3c2VzFPZGYw?=
 =?utf-8?B?YlNZWUFwZmg0Ym0xR1F0aXBOeGFoUWptc2haVXB5RHB3ZzBRaVRZcWg1d3Bo?=
 =?utf-8?B?QXlxakJOSXpqaWJYM3dZbkZZL3JsMm1QU3c0dDZiVkQvREw0dEZYNlF4dUI4?=
 =?utf-8?B?QmhTWnRHd1R4SGh1cWplaWpXSE9SbFhKc1dUdkhCUFpzaklKdUExb1IzN3d5?=
 =?utf-8?B?ajhNaUxXODZQK1Q0YSt6TDhPZjZtOTBiRTVhOHpSOEluYVArd1R3OUhCMksr?=
 =?utf-8?B?S2p3OWFKc1NiR2pOUVAxMXBoS2tBYXRKUzlnNXk3dmU3dGViYWkxSDFzQkVN?=
 =?utf-8?B?cHc1ZVMvUHdrVGhCN3VjQ0lvaHRXekxhd3pkWXBhbjB3V0hCSFE1S1JZdzJJ?=
 =?utf-8?B?dVpGOTNLRmRtK1hGU3NYakFobHFOZ2ZneGdGZGg4MWwvTDV4UndBeXphSm5L?=
 =?utf-8?B?Y0tBWG9hWHkzZmlVSzQxWGhJVGJ0YzZUT0ZWZUY5RjlVWFRkcWxsL1RDM0JM?=
 =?utf-8?B?ODJ2NXFndmRmQStKaU5kM01ZUmdIYzRseU9rRHpnSnF0ZjRkVW5EK09jRDF5?=
 =?utf-8?B?a2pKVWRnbEE4Mzd5a1k4YkJ2cXFTT0JEL1phTlJXS2hjbWViS0cvMjZqN0tS?=
 =?utf-8?B?N0Z6Ymk2QzFCV2x3MzRYaUUvUUdrNkdqd2o2bTFtK3RpTjBUNWVIMjFDd0V6?=
 =?utf-8?B?dXdQU1BiVWQ2S2xoWmh6a3hrSXVROXNkZTVOcjF1NW1VY1RuOEdhWGJTMklV?=
 =?utf-8?B?ZGNKbUZET3B1QlBvOGxMVDdzUmdzMEdVbU5tUkdESDYwZ2dlRHREZHFrWFR0?=
 =?utf-8?B?dXhBZk1JanlEQ0tOeHhWZHF1c0Nhc3FFdDlZOEtIdlcrSnVoK2paTWJiMTJu?=
 =?utf-8?B?a2prWEpGYkpuZFhpQkdpU2ZkaDYxZXRLZktlRDQ1dmZQekhYWXNSa29mdXBT?=
 =?utf-8?B?SVR2ajZRSFpTNWpQNE9BWW1HbUQ3bDc3NHdDdWd3eGd0ZGwyNnhiYk1xcjdK?=
 =?utf-8?B?NGNyYzhlaFRvT1E2OUlUUXN2UVoveHZtTGVhN0QyM0ZscUVDZlEzRkVxdWRW?=
 =?utf-8?B?SjkzbXVWaHE3bVNLRHV5SDF2K08zY2hnSThTZ3FOMzlxc0ppLy84WXAzTnNK?=
 =?utf-8?B?ZzRoZEpIR1lHSElRMzZ1dVdycFRSbUtIZUxBQWxvakErZCs5aVlZNm1VeVZC?=
 =?utf-8?B?ZFltb1F2M0NPMUprTmd1Vm14MVYybEhQaS8ydWdpcGJvZ09ZbS90YXJaOUk4?=
 =?utf-8?B?aHFjaHJ0Qnd6aUJhZmtJTnIybzF2MWlKL1NzdWt6YzdONHlMUmY1WXhTZmNi?=
 =?utf-8?B?dWhTT254eGVtM0hhQ3ZBNkFIVlFvOEI0V21hRWU0dDh6VkJMQk51VmpFbjZq?=
 =?utf-8?B?RUdVMnNQSFNZZW9rQS9OTkdheEhmOVl5b2dWTHRrN3h4NmRsWG1HMHNvUFRV?=
 =?utf-8?B?aWxEOGtPckl0T1RpMWZuTXJRa055OWdOY1JCNTNNRkRWRjhCdVBEaHdQUkV0?=
 =?utf-8?B?bFFMam1xUU42Y1Mwa0E5bjd6b3I4SzBjR0c2cXE2OE1RbU1URW9vVDlETi9K?=
 =?utf-8?B?bXNocE5pYk1CQ2ZEQVRvLy92VkhJUyt1aGVIVnBnUjMzSGJxblJTUEJvWEhT?=
 =?utf-8?B?dTFkdjRjRUJ1cWs0RzBzM2tqd2kyWVdYNlZlUkIreUljd1dndUtKWEVOSFBw?=
 =?utf-8?B?ZGh5MC9hNFNGb25MajlFM09KVEVseUxVR1RZL3RzMVBMSHdQdkxmU0tLRVk2?=
 =?utf-8?B?UXIvbmlNSUpES2VUc2prczNSNmdNT0Z2ek5nM1d3Mm1iNXN6RmxwR1kvUVU5?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdf96d1-432f-4ad3-67b5-08dd000b69c4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 15:38:37.8035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTcW2CUINdOUcqpwVGCyLNDE2ze3DphqrIC+6kSi86DNbjCzgl3xcwPblgKVsSuVh4j1KBNQefPdFgg0Q90tTh5f+/ZCDGPwquy0X1lWa0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
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

On Fri, Nov 08, 2024 at 10:01:41AM +0100, Zbigniew Kempczyński wrote:
>+Lucas

Pravalika, please keep me in Cc. I don't watch the igt mailing list
close enough, particularly when it's a follow up to a suggestion I gave.

>
>On Fri, Nov 08, 2024 at 01:14:02PM +0530, Pravalika Gurram wrote:
>> move spin_ctx_init,spin_ctx_start,spin_ctx_end,spin_ctx_destroy
>> to xe spin lib to avoid code redundancy.
>>
>> v2: use allocator based on developer preference.
>>     change spin_ctx to xe_spin_ctx to avoid name clashes [Zbigniew]

but we already have another thing named ctx there, the rename doesn't
improve it.

 From lib/xe/xe_spin.h, what should be added on is

struct xe_cork {                    
	struct xe_spin *spin;       
	int fd;                     
	uint32_t vm;                
	uint32_t bo;                
	uint32_t exec_queue;        
	uint32_t syncobj;           
};                                  

I don't really like that name, but we can do a rename on top... or we
can rename it now and then move things.

>>
>> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
>> ---
>>  lib/xe/xe_spin.c            | 115 +++++++++++++++++++++
>>  lib/xe/xe_spin.h            |  22 ++++
>>  tests/intel/xe_drm_fdinfo.c | 197 +++++++-----------------------------
>>  3 files changed, 172 insertions(+), 162 deletions(-)
>>
>> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>> index 3adacc3a8..b611ac5c1 100644
>> --- a/lib/xe/xe_spin.c
>> +++ b/lib/xe/xe_spin.c
>> @@ -292,6 +292,121 @@ void xe_spin_free(int fd, struct igt_spin *spin)
>>  	free(spin);
>>  }
>>
>> +struct xe_spin_ctx *
>> +xe_spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint64_t ahnd, uint32_t vm,
>> +	      uint16_t width, uint16_t num_placements)
>> +{
>> +	struct xe_spin_ctx *ctx = calloc(1, sizeof(*ctx));
>> +
>> +	igt_assert(width && num_placements &&
>> +		   (width == 1 || num_placements == 1));
>> +	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);

I think those asserts are fine for a lib since it would be a programming
error.

>> +
>> +	ctx->class = hwe->engine_class;
>> +	ctx->width = width;
>> +	ctx->num_placements = num_placements;
>> +	ctx->vm = vm;
>> +
>> +	ctx->exec.num_batch_buffer = width;
>> +	ctx->exec.num_syncs = 2;
>> +	ctx->exec.syncs = to_user_pointer(ctx->sync);
>> +
>> +	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>> +	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>> +	ctx->sync[0].handle = syncobj_create(fd, 0);
>> +
>> +	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>> +	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>> +	ctx->sync[1].handle = syncobj_create(fd, 0);
>> +
>> +	ctx->bo_size = sizeof(struct xe_spin);
>> +	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
>> +	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
>> +			       vram_if_possible(fd, hwe->gt_id),
>> +			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	if (ahnd) {

we need a better set of functions for handling an optional arg like
this.

>> +		for (unsigned int i = 0; i < width; i++)
>> +			ctx->addr[i] = intel_allocator_alloc_with_strategy(ahnd,
>> +					ctx->bo, ctx->bo_size, 0,
>> +					ALLOC_STRATEGY_LOW_TO_HIGH);
>> +	} else {
>> +		for (unsigned int i = 0; i < width; i++)
>> +			ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
>> +	}
>> +
>> +	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
>> +
>> +	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
>> +					     hwe, 0, &ctx->exec_queue), 0);

this assert should probably be handled as an error, and let the test do
the assert. This way this can be easily used by others libs and tools. I
was chatting recently with other people that it'd be good to have a
gpu-stress (whatever the name, may be xe-spinner if not generalized) so
we can easily exercise the engines.

>> +
>> +	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
>> +			 ctx->sync, 1);
>
>@Lucas
>
>I'm looking here and I've doubts what's going on in 'utilization_multi'
>subtest where width > 1. I mean we bind only addr[0], but according
>to exec with width > 1 I assume addr[1] should be bound as well.

we may need to change that to generalize in the lib. In the case of that
specific test we setup the addr per class:

	num_placements = xe_gt_fill_engines_by_class()
	if TEST_PARALLEL {
		width = num_placements
		num_placements = 1
	}
	...
	for (unsigned int i = 0; i < width; i++)
		ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;

So if width > 1, all of them point to the same address.
To make it generic I think we will have to change that, yes.

+Matt Brost

Lucas De Marchi

>
>What I'm missing here?
>
>--
>Zbigniew
>
>> +
>> +	return ctx;
>> +}
>> +
>> +void xe_spin_sync_start(int fd, struct xe_spin_ctx *ctx)
>> +{
>> +	if (!ctx)
>> +		return;
>> +
>> +	ctx->spin_opts.addr = ctx->addr[0];
>> +	ctx->spin_opts.write_timestamp = true;
>> +	ctx->spin_opts.preempt = true;
>> +	xe_spin_init(ctx->spin, &ctx->spin_opts);
>> +
>> +	/* re-use sync[0] for exec */
>> +	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>> +
>> +	ctx->exec.exec_queue_id = ctx->exec_queue;
>> +
>> +	if (ctx->width > 1)
>> +		ctx->exec.address = to_user_pointer(ctx->addr);
>> +	else
>> +		ctx->exec.address = ctx->addr[0];
>> +
>> +	xe_exec(fd, &ctx->exec);
>> +
>> +	xe_spin_wait_started(ctx->spin);
>> +	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
>> +
>> +	igt_debug("%d: spinner started\n", ctx->class);
>> +}
>> +
>> +void xe_spin_sync_end(int fd, struct xe_spin_ctx *ctx)
>> +{
>> +	if (!ctx || ctx->ended)
>> +		return;
>> +
>> +	xe_spin_end(ctx->spin);
>> +
>> +	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
>> +	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
>> +	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	ctx->ended = true;
>> +	igt_debug("%d: spinner ended (timestamp=%u)\n", ctx->class,
>> +		  ctx->spin->timestamp);
>> +}
>> +
>> +void xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx)
>> +{
>> +	if (!ctx)
>> +		return;
>> +
>> +	syncobj_destroy(fd, ctx->sync[0].handle);
>> +	syncobj_destroy(fd, ctx->sync[1].handle);
>> +	xe_exec_queue_destroy(fd, ctx->exec_queue);
>> +
>> +	munmap(ctx->spin, ctx->bo_size);
>> +	gem_close(fd, ctx->bo);
>> +
>> +	free(ctx);
>> +}
>> +
>>  void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
>>  		  struct xe_cork *cork)
>>  {
>> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
>> index d65adb05c..18706dcdf 100644
>> --- a/lib/xe/xe_spin.h
>> +++ b/lib/xe/xe_spin.h
>> @@ -43,9 +43,29 @@ struct xe_spin {
>>  	uint32_t timestamp;
>>  };
>>
>> +struct xe_spin_ctx {
>> +	uint32_t vm;
>> +	uint64_t addr[XE_MAX_ENGINE_INSTANCE];
>> +	struct drm_xe_sync sync[2];
>> +	struct drm_xe_exec exec;
>> +	uint32_t exec_queue;
>> +	size_t bo_size;
>> +	uint32_t bo;
>> +	struct xe_spin *spin;
>> +	struct xe_spin_opts spin_opts;
>> +	bool ended;
>> +	uint16_t class;
>> +	uint16_t width;
>> +	uint16_t num_placements;
>> +};
>> +
>>  igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
>>  uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t ns);
>>  void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
>> +struct xe_spin_ctx *
>> +xe_spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint64_t ahnd, uint32_t vm,
>> +	      uint16_t width, uint16_t num_placements);
>> +void xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx);
>>
>>  #define xe_spin_init_opts(fd, ...) \
>>  	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
>> @@ -55,6 +75,8 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin);
>>  void xe_spin_wait_started(struct xe_spin *spin);
>>  void xe_spin_end(struct xe_spin *spin);
>>  void xe_spin_free(int fd, struct igt_spin *spin);
>> +void xe_spin_sync_start(int fd, struct xe_spin_ctx *ctx);
>> +void xe_spin_sync_end(int fd, struct xe_spin_ctx *ctx);
>>
>>  struct xe_cork {
>>  	struct xe_spin *spin;
>> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>> index 5fd7c0416..91ff4a5af 100644
>> --- a/tests/intel/xe_drm_fdinfo.c
>> +++ b/tests/intel/xe_drm_fdinfo.c
>> @@ -367,133 +367,6 @@ static void basic_engine_utilization(int xe)
>>  	igt_require(info.num_engines);
>>  }
>>
>> -struct spin_ctx {
>> -	uint32_t vm;
>> -	uint64_t addr[XE_MAX_ENGINE_INSTANCE];
>> -	struct drm_xe_sync sync[2];
>> -	struct drm_xe_exec exec;
>> -	uint32_t exec_queue;
>> -	size_t bo_size;
>> -	uint32_t bo;
>> -	struct xe_spin *spin;
>> -	struct xe_spin_opts spin_opts;
>> -	bool ended;
>> -	uint16_t class;
>> -	uint16_t width;
>> -	uint16_t num_placements;
>> -};
>> -
>> -static struct spin_ctx *
>> -spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
>> -	      uint16_t width, uint16_t num_placements)
>> -{
>> -	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
>> -
>> -	igt_assert(width && num_placements &&
>> -		   (width == 1 || num_placements == 1));
>> -	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
>> -
>> -	ctx->class = hwe->engine_class;
>> -	ctx->width = width;
>> -	ctx->num_placements = num_placements;
>> -	ctx->vm = vm;
>> -
>> -	for (unsigned int i = 0; i < width; i++)
>> -		ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
>> -
>> -	ctx->exec.num_batch_buffer = width;
>> -	ctx->exec.num_syncs = 2;
>> -	ctx->exec.syncs = to_user_pointer(ctx->sync);
>> -
>> -	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>> -	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>> -	ctx->sync[0].handle = syncobj_create(fd, 0);
>> -
>> -	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>> -	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>> -	ctx->sync[1].handle = syncobj_create(fd, 0);
>> -
>> -	ctx->bo_size = sizeof(struct xe_spin);
>> -	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
>> -	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
>> -			       vram_if_possible(fd, hwe->gt_id),
>> -			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> -	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
>> -
>> -	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
>> -					     hwe, 0, &ctx->exec_queue), 0);
>> -
>> -	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
>> -			 ctx->sync, 1);
>> -
>> -	return ctx;
>> -}
>> -
>> -static void
>> -spin_sync_start(int fd, struct spin_ctx *ctx)
>> -{
>> -	if (!ctx)
>> -		return;
>> -
>> -	ctx->spin_opts.addr = ctx->addr[0];
>> -	ctx->spin_opts.write_timestamp = true;
>> -	ctx->spin_opts.preempt = true;
>> -	xe_spin_init(ctx->spin, &ctx->spin_opts);
>> -
>> -	/* re-use sync[0] for exec */
>> -	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>> -
>> -	ctx->exec.exec_queue_id = ctx->exec_queue;
>> -
>> -	if (ctx->width > 1)
>> -		ctx->exec.address = to_user_pointer(ctx->addr);
>> -	else
>> -		ctx->exec.address = ctx->addr[0];
>> -
>> -	xe_exec(fd, &ctx->exec);
>> -
>> -	xe_spin_wait_started(ctx->spin);
>> -	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
>> -
>> -	igt_debug("%s: spinner started\n", engine_map[ctx->class]);
>> -}
>> -
>> -static void
>> -spin_sync_end(int fd, struct spin_ctx *ctx)
>> -{
>> -	if (!ctx || ctx->ended)
>> -		return;
>> -
>> -	xe_spin_end(ctx->spin);
>> -
>> -	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
>> -	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>> -
>> -	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> -	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
>> -	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>> -
>> -	ctx->ended = true;
>> -	igt_debug("%s: spinner ended (timestamp=%u)\n", engine_map[ctx->class],
>> -		  ctx->spin->timestamp);
>> -}
>> -
>> -static void
>> -spin_ctx_destroy(int fd, struct spin_ctx *ctx)
>> -{
>> -	if (!ctx)
>> -		return;
>> -
>> -	syncobj_destroy(fd, ctx->sync[0].handle);
>> -	syncobj_destroy(fd, ctx->sync[1].handle);
>> -	xe_exec_queue_destroy(fd, ctx->exec_queue);
>> -
>> -	munmap(ctx->spin, ctx->bo_size);
>> -	gem_close(fd, ctx->bo);
>> -
>> -	free(ctx);
>> -}
>> -
>>  static void
>>  check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>>  	      int class, int width, enum expected_load expected_load)
>> @@ -535,7 +408,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>>  {
>>  	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>  	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>> -	struct spin_ctx *ctx = NULL;
>> +	struct xe_spin_ctx *ctx = NULL;
>>  	enum expected_load expected_load;
>>  	uint32_t vm;
>>  	int new_fd;
>> @@ -545,8 +418,8 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>>
>>  	vm = xe_vm_create(fd, 0, 0);
>>  	if (flags & TEST_BUSY) {
>> -		ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
>> -		spin_sync_start(fd, ctx);
>> +		ctx = xe_spin_ctx_init(fd, hwe, 0, vm, 1, 1);
>> +		xe_spin_sync_start(fd, ctx);
>>  	}
>>
>>  	read_engine_cycles(fd, pceu1[0]);
>> @@ -555,7 +428,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>>
>>  	usleep(batch_duration_usec);
>>  	if (flags & TEST_TRAILING_IDLE)
>> -		spin_sync_end(fd, ctx);
>> +		xe_spin_sync_end(fd, ctx);
>>
>>  	read_engine_cycles(fd, pceu2[0]);
>>  	if (flags & TEST_ISOLATION)
>> @@ -574,8 +447,8 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>>  		close(new_fd);
>>  	}
>>
>> -	spin_sync_end(fd, ctx);
>> -	spin_ctx_destroy(fd, ctx);
>> +	xe_spin_sync_end(fd, ctx);
>> +	xe_spin_ctx_destroy(fd, ctx);
>>  	xe_vm_destroy(fd, vm);
>>  }
>>
>> @@ -584,19 +457,19 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
>>  {
>>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>> -	struct spin_ctx *ctx = NULL;
>> +	struct xe_spin_ctx *ctx = NULL;
>>  	uint32_t vm;
>>
>>  	vm = xe_vm_create(fd, 0, 0);
>> -	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
>> -	spin_sync_start(fd, ctx);
>> +	ctx = xe_spin_ctx_init(fd, hwe, 0, vm, 1, 1);
>> +	xe_spin_sync_start(fd, ctx);
>>
>>  	read_engine_cycles(fd, pceu1);
>>  	usleep(batch_duration_usec);
>>
>>  	/* destroy queue before sampling again */
>> -	spin_sync_end(fd, ctx);
>> -	spin_ctx_destroy(fd, ctx);
>> +	xe_spin_sync_end(fd, ctx);
>> +	xe_spin_ctx_destroy(fd, ctx);
>>
>>  	read_engine_cycles(fd, pceu2);
>>
>> @@ -610,18 +483,18 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
>>  {
>>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>> -	struct spin_ctx *ctx = NULL;
>> +	struct xe_spin_ctx *ctx = NULL;
>>  	uint32_t vm;
>>  	int class;
>>
>>  	vm = xe_vm_create(fd, 0, 0);
>>
>> -	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
>> -	spin_sync_start(fd, ctx);
>> +	ctx = xe_spin_ctx_init(fd, hwe, 0, vm, 1, 1);
>> +	xe_spin_sync_start(fd, ctx);
>>
>>  	read_engine_cycles(fd, pceu1);
>>  	usleep(batch_duration_usec);
>> -	spin_sync_end(fd, ctx);
>> +	xe_spin_sync_end(fd, ctx);
>>  	read_engine_cycles(fd, pceu2);
>>
>>  	xe_for_each_engine_class(class) {
>> @@ -631,8 +504,8 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
>>  		check_results(pceu1, pceu2, class, 1, expected_load);
>>  	}
>>
>> -	spin_sync_end(fd, ctx);
>> -	spin_ctx_destroy(fd, ctx);
>> +	xe_spin_sync_end(fd, ctx);
>> +	xe_spin_ctx_destroy(fd, ctx);
>>  	xe_vm_destroy(fd, vm);
>>  }
>>
>> @@ -641,7 +514,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>>  {
>>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>> -	struct spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
>> +	struct xe_spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
>>  	struct drm_xe_engine_class_instance *_hwe;
>>  	uint32_t vm;
>>  	int class;
>> @@ -655,14 +528,14 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>>  		if (_class == hwe->engine_class || ctx[_class])
>>  			continue;
>>
>> -		ctx[_class] = spin_ctx_init(fd, _hwe, vm, 1, 1);
>> -		spin_sync_start(fd, ctx[_class]);
>> +		ctx[_class] = xe_spin_ctx_init(fd, _hwe, 0, vm, 1, 1);
>> +		xe_spin_sync_start(fd, ctx[_class]);
>>  	}
>>
>>  	read_engine_cycles(fd, pceu1);
>>  	usleep(batch_duration_usec);
>>  	xe_for_each_engine_class(class)
>> -		spin_sync_end(fd, ctx[class]);
>> +		xe_spin_sync_end(fd, ctx[class]);
>>  	read_engine_cycles(fd, pceu2);
>>
>>  	xe_for_each_engine_class(class) {
>> @@ -673,8 +546,8 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>>  			continue;
>>
>>  		check_results(pceu1, pceu2, class, 1, expected_load);
>> -		spin_sync_end(fd, ctx[class]);
>> -		spin_ctx_destroy(fd, ctx[class]);
>> +		xe_spin_sync_end(fd, ctx[class]);
>> +		xe_spin_ctx_destroy(fd, ctx[class]);
>>  	}
>>
>>  	xe_vm_destroy(fd, vm);
>> @@ -685,7 +558,7 @@ utilization_all_full_load(int fd)
>>  {
>>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>> -	struct spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
>> +	struct xe_spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
>>  	struct drm_xe_engine_class_instance *hwe;
>>  	uint32_t vm;
>>  	int class;
>> @@ -698,14 +571,14 @@ utilization_all_full_load(int fd)
>>  		if (ctx[class])
>>  			continue;
>>
>> -		ctx[class] = spin_ctx_init(fd, hwe, vm, 1, 1);
>> -		spin_sync_start(fd, ctx[class]);
>> +		ctx[class] = xe_spin_ctx_init(fd, hwe, 0, vm, 1, 1);
>> +		xe_spin_sync_start(fd, ctx[class]);
>>  	}
>>
>>  	read_engine_cycles(fd, pceu1);
>>  	usleep(batch_duration_usec);
>>  	xe_for_each_engine_class(class)
>> -		spin_sync_end(fd, ctx[class]);
>> +		xe_spin_sync_end(fd, ctx[class]);
>>  	read_engine_cycles(fd, pceu2);
>>
>>  	xe_for_each_engine_class(class) {
>> @@ -713,8 +586,8 @@ utilization_all_full_load(int fd)
>>  			continue;
>>
>>  		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
>> -		spin_sync_end(fd, ctx[class]);
>> -		spin_ctx_destroy(fd, ctx[class]);
>> +		xe_spin_sync_end(fd, ctx[class]);
>> +		xe_spin_ctx_destroy(fd, ctx[class]);
>>  	}
>>
>>  	xe_vm_destroy(fd, vm);
>> @@ -741,7 +614,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>>  	struct pceu_cycles pceu[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>  	struct pceu_cycles pceu_spill[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>  	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
>> -	struct spin_ctx *ctx = NULL;
>> +	struct xe_spin_ctx *ctx = NULL;
>>  	enum expected_load expected_load;
>>  	int fd_spill, num_placements;
>>  	uint32_t vm;
>> @@ -767,8 +640,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>>
>>  	vm = xe_vm_create(fd, 0, 0);
>>  	if (flags & TEST_BUSY) {
>> -		ctx = spin_ctx_init(fd, eci, vm, width, num_placements);
>> -		spin_sync_start(fd, ctx);
>> +		ctx = xe_spin_ctx_init(fd, eci, 0, vm, width, num_placements);
>> +		xe_spin_sync_start(fd, ctx);
>>  	}
>>
>>  	read_engine_cycles(fd, pceu[0]);
>> @@ -777,7 +650,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>>
>>  	usleep(batch_duration_usec);
>>  	if (flags & TEST_TRAILING_IDLE)
>> -		spin_sync_end(fd, ctx);
>> +		xe_spin_sync_end(fd, ctx);
>>
>>  	read_engine_cycles(fd, pceu[1]);
>>  	if (flags & TEST_ISOLATION)
>> @@ -797,8 +670,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>>  		close(fd_spill);
>>  	}
>>
>> -	spin_sync_end(fd, ctx);
>> -	spin_ctx_destroy(fd, ctx);
>> +	xe_spin_sync_end(fd, ctx);
>> +	xe_spin_ctx_destroy(fd, ctx);
>>
>>  	xe_vm_destroy(fd, vm);
>>  }
>> --
>> 2.34.1
>>
