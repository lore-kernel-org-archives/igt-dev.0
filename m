Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142AFE7717F
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 02:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B872F10E1FB;
	Wed, 11 Dec 2024 02:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUaNDDH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB4C10E1FB
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 02:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733885508; x=1765421508;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IGzVPGxnw0MmOZKFBWBj1R89BMxlZJlMPyYs/sXr1LA=;
 b=mUaNDDH1zB2VU+MsQ/SRZQqGt/cWzW4x+2uXaz6318GCFo6jArW/gKG7
 MOBbz6r8SdI6M7xTfve5+e2+7DwZmibNjYU00oN8FfywPUmW6G12DEXxn
 Zi37sYYqeKfqRr2fCEaX2CuJX39p0Bm12cjsdx50L9xXOqXwAFs6x4+6b
 F1fE1lqMHCNS4zM+cttFQE+tv2e0iJiQ8nJB7yi4aTbSu0Go7oqTO8QP7
 c52MxgXO6y304mphrRYulSpkLu59RXQ3OuTy2b6TpByGUXm5FTGHdDcH7
 EukDE4tZcBCnVLWQpFIHQQgUAPpxqFmREOJlc1uI/KANwXi+LsO+SVbAM Q==;
X-CSE-ConnectionGUID: UphZCyi9QEOAyN1TIYxMLg==
X-CSE-MsgGUID: aIO+el8hSLedCp6DSQXUwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37087161"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="37087161"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 18:51:47 -0800
X-CSE-ConnectionGUID: C2OKWDx7R2+qG5aef/aU0g==
X-CSE-MsgGUID: txxZP8iSSOu0bcKcokPOwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118866513"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 18:51:17 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 18:51:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 18:51:08 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 18:51:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5aqLFVQne11NUw2aC8cFdUkcOilAefoEDEFoQXvPyuuANIswyfGC6ZnoGvCnq0p/KizzQstV8S2/pmTOsWdPqI6rgfCdWp1VqyvELvABBRbymJqAIl+2tqAxQSoLC8yvNS65O0XItHXbW9hv8yuCTBj10M4njC+026h/SMiIlL6+NBUXyJt99m1Fsx5YF3jjah5aYF9c/KRlh7UYOKo2YWMk66Rp+pBA4ezSsSP0S+4y+iTNtQ2ZVSULlwGFatdT+tTzUWBOx6lb1y2sV8vzCAvaynj98VcWlyZjkSsTPA3Gsrp6620y/r70jbnFsRubNN5NZnFCnpG/yJcSzGByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTO3I8ntTJiRKTUtmC8qWgmYChVuAyzCPOB5pIQojA0=;
 b=jfBKRg2o4+/r9WIfyOcAmBkPUSKUYCCKWP08YyhfRafgt7mQqUrU0uhWFecAWwx8Qd1/gzEHhfuq99lJghtey5/+AF0QO6anrP7LMI80DnXzxdreiUh0qVh/RzT+Qmc3hCq37xEiKZzRUTrd7ugoWV3RWfcRKiW3pREfOJo/UXMwk1jvrAh4flk1gotNZu7VNfH2YZp1vS3eHvNco5IJIIQ9VF2f5GAKomnyfyOpWfQjFxgzOWUnnfZjH4jpI1tLaA/lQIjCUau6+lplon5mGdB0uMr6emPKq/fEmvtG4NXIqu+1d1fKSHTwGNn97ccIxXm+oFq3MW/IeSn4i6G4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by IA0PR11MB7210.namprd11.prod.outlook.com (2603:10b6:208:440::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Wed, 11 Dec
 2024 02:51:00 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 02:51:00 +0000
Message-ID: <a02f1af5-2ebc-4bfe-b4fd-0c85680d3f09@intel.com>
Date: Wed, 11 Dec 2024 08:20:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/dsc: Add helper
 igt_get_dsc_sink_max_slice_count()
To: <igt-dev@lists.freedesktop.org>
References: <20241210135322.2117541-1-swati2.sharma@intel.com>
 <20241210135322.2117541-2-swati2.sharma@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241210135322.2117541-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::18) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|IA0PR11MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a6bd62d-02e5-45a0-025d-08dd198ea4d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE1kMW9GVHRjcjZYZzFIbHFFQm90SXBKSTY0RnpQTHdTdVAxMjl2d3QwdEM5?=
 =?utf-8?B?WWRreVRod0NoUWZweHZ4NGxMSFdDWjNhbDEwcUo1ZVJ6eG5WK0lCNlg4OVNz?=
 =?utf-8?B?ZmpqMU5hdEJPMHJJNDRFZEdKRm5tUWtvd2E0bk5Zb0h2N2YwQ25BalMrZ2pt?=
 =?utf-8?B?TE5ndUZVdG9hQ00vVWlRamFNVi8vN1RFVzBVbTJ5Q0kzRHoxWklUeXZBdEtB?=
 =?utf-8?B?MmRRV1p6cnh5K25KT3Y4am51dEdtYmRydWEySGtFckpCeGF2aUtha1VZUTlZ?=
 =?utf-8?B?NEFZbjNuZG94bTRUUy93b0JiUVI2V3ZLRHFvcnZQMldEcTVmYnNxYkVyajhF?=
 =?utf-8?B?NGpMdG01eDc1Q2wxanprT0o1QzRwSlNleXpPVUF5UVdxeTcxa21kQVdKVE5M?=
 =?utf-8?B?YTJIUE5iTFUwbDU3R1FNMVdpWGhYSHFON1lweUlXTmI3QWM1WHoyUFdaRDZS?=
 =?utf-8?B?UHF0bWlHbnhnOUhqbW94UWtycER5b0RNb2hZUW9ESkZMK25EZjVMZlJpbmxX?=
 =?utf-8?B?ZDRyc2JCWTRhcUZtcjA2U1FBSzdjN1NoeEppSXB6Mlg3QWFqZEI0Tm5iWDY2?=
 =?utf-8?B?d3h0bFdaMUhHMjZYSnNiZHRsY001Y0s4a2pUa25BRlJJdG5MYUNWWm5pVFg4?=
 =?utf-8?B?NFNNVFhEbGw2UnYvVWtocXZZNytvc0Z5MlB6b2ZIODlqUGEzZ1pUeUF6YnpO?=
 =?utf-8?B?MVBVVEd0amZwRWtpb1lxbmtiNHdERkduZU1qVXh4V2hoNnlrUnR4SjAwV3ZF?=
 =?utf-8?B?RlJIS2VyNEVxS05rNXVYdktGbE16RWlmVk93MFVRVVR4K25LZjFRSzgwVFBh?=
 =?utf-8?B?SS9EUVhCbXd3QVZ6YXBBNFQwZUo2WGpwMHpnWDFPSmRDZGg4ekJCNHFHak1r?=
 =?utf-8?B?TlhaNkd3UGlDamNSSHpXdEQ1RGJ5dXJtbGZDaWFucXBNd1E5RUMzN2VsaHhX?=
 =?utf-8?B?K1dUaTlJNElGSDRWa1FPVVUrQW9sQUJQNjd4WGhnTC83V2RtT2hQZC9QVHJF?=
 =?utf-8?B?ZDlEZzZwWWVWdGZKWHhYcnliNmZiQUhjMFZSV2VFbmEvbE56K0VMYnA3UW1n?=
 =?utf-8?B?UFdyMGJKQnRva211L2lONzdtTG0xQnRYVkJFVHJLOGFGaFo2QTBOd1BScCtP?=
 =?utf-8?B?VGNzT2hQV1EweHdTNDZMNHlsL3RQbmhGdTRoQk5ySURmaTNXaFhSODNMZlNt?=
 =?utf-8?B?WWlVVVJsU3hpVGV3bUkzYm9keEJOTFlGUEtPNDNRNkhwOFBiZnhtNTBKdmJ4?=
 =?utf-8?B?QVhFWm9EODFlWHQyeWFnRDVzNUh4Z01USEVESjJXQnpzV3dSOHFXNGhya3Ru?=
 =?utf-8?B?TXRvSVg5WVlKelRJam0xeDVReDhvd200M3U4NjRZLzZyT21OWktDRXhIV1pH?=
 =?utf-8?B?YUxlQlVFUXRvTHMzWkF2SjE1a0J1SW1HbmZUSlE4dzR2b2RRMTQ5L2g1dHBE?=
 =?utf-8?B?ZCt3dzQxMW81ZWc0OGt6ZVlVdE52MGJHdU55TGdLRGlMcVhiQXpXQkJDQzhI?=
 =?utf-8?B?bVFzMGdpNXZ2aVY3cGIrTFJvSnhEZ3FETnNsZW9DUnhDSU0rT3I0a3Z0WEtH?=
 =?utf-8?B?QW1qZEZhSGNUdkcrN1NpN1YzZEs3Q3QxcTdSeTYwYmtFVGJtc1lmSUxHZm9P?=
 =?utf-8?B?bUdRYUF5SDU5b2YzVjhvcitFNDZCYVdidjM5ZkZJUWJDeFNjbFcvU0FlUHk3?=
 =?utf-8?B?NUtaUEJKUmZUdmpIK2RKUEJPNlViRkNvYnZyVEJhWWt5QU43MmZlQjEwZ1Ex?=
 =?utf-8?B?Vk5Ga0hBQjNVRzJhelluRmR2TCtPeFdPUnBEOS9TTDA0VzlqRkZ5azZ4emwv?=
 =?utf-8?B?R2g1WE9udVRGRVZKRndiQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUdGN0JzOEl2dmJJQmEvTlJFUEVLUzNHdUI0aTFnU3JMN1IrV0ZuKzZKb3or?=
 =?utf-8?B?Z3ZFNm5SNkxIc2ZwVnplYlpUQUpKdGEwOElmUHo5RXRWeENXK0pJS0t1Q3hW?=
 =?utf-8?B?LzJOQlh3ckw3b0tvS1RYMVRZOTBJVjhsSUVPMTFIRjNsN0M1di9Hc2g5azl6?=
 =?utf-8?B?akJaYlNrcDQ0SkdXbUI1dG9oaHBOZXZYYTM4UVU3MzlOd1B1YTJFYU1yK2JH?=
 =?utf-8?B?aEJCbEIybmh0cVFaZERzaU0vTlhBWUIzRURHQlJxM0YrSHBDUXhlWitjaWxr?=
 =?utf-8?B?cmtvNXNpSFNKeW8wZjNOaFpkNnRIVGpNNC9PT1FlOHo5ZC85UzBydmQvZUlL?=
 =?utf-8?B?TzkxY2M3aTJoUlhLNzM2SVlUeHlJVXg0blFaellYT2NoaGxHdDA2UWZST0Jt?=
 =?utf-8?B?OWlYcmtVVTBFeTVzVkhST2JpMURQREVJa1Y1amViaWJTQ0xvSWc3Wlp0Yjh0?=
 =?utf-8?B?RktGdFkzOWFEL0VNUkppc09VOUk5b2U2bFJ4VjBlSTN2TnNNcmpHWFVReFQ1?=
 =?utf-8?B?K0d3RG1LdmVlWWMrWmtkL2xFVHBZWnl3NFRLbzlBM3RhZ0pLYzRhOWxHMEFy?=
 =?utf-8?B?VTlaTkRvbDFrNGhNQjJaYUlJZ3Q2MXVhSXFxc0xpYjZVNHN3dmNacjV2cEFq?=
 =?utf-8?B?N0d0cXRXZFQ0SWZzRzZ0cEVXS1VlWFhaWktQMHQ5Y21LNDZwWnFmNFRGa3ZT?=
 =?utf-8?B?THVTVmFlRmFkWCtWS1RrY1RpR3VPY0x4OXpRWDQ0UkFoOVhPOCt1d0svWHoz?=
 =?utf-8?B?QnZWK3UxWmlycy9TVDU2WFIxZVRxUXpqSmlxZlRYa1doRUNxVSt4UmFZcXd2?=
 =?utf-8?B?YnZvTUM2ZzlucUk3SFp1RUprR3FKVEpFSWEraDBTdVUwQng5RzZNYkNYOGh0?=
 =?utf-8?B?cDdvZ2p3ZVptWG9MaW90Y2tuM1RzSmlEMGJnN0dGRzExN2oyUEdnYzBUWTJG?=
 =?utf-8?B?Q1R4QTZlU25PWkFKNE9RTTVpbjEwUU5KcW9UenZhU0EzdzVlWWpwQjBoS295?=
 =?utf-8?B?UzZIQ2thc3RnaG5WSXhEZHR3dkFWWFQxT09ybjVtamZzNkN1NzFWM0ZSdTB5?=
 =?utf-8?B?US8xa1VhZHExdnJyTDJFT2FKejV2UDlZNllWRVpiam5tQXk5bk1abTdVUDk2?=
 =?utf-8?B?b2ZNbHM4bUNFZVNLU3YvWWVBbGZFcnhJamZCOFZVNFpQaEhFbDdFa09neHcx?=
 =?utf-8?B?N0xMclJMbHJqR01BRkNNZDNUQ29HYWo1K2hBSnhsRkVudlA5dDNmQllzYmZO?=
 =?utf-8?B?bU5PcUxoaVhveUtDU3V1U3ZmNXo5czlGdmY4SjRNejJMVTVpSmFRMEcvWDBr?=
 =?utf-8?B?bm1TSWMrdmpoaGxNT3BRaEZ1bW1UQWRCeXZxOTNQNTVqczZmaStUa2xBQlBo?=
 =?utf-8?B?NklRTUE5dFhBY3FDUlVIMUMrKzRSbDJCYlRqSU5XWTA5RHVkd0xRcmY1SzlT?=
 =?utf-8?B?ODZpSnJpNG9nMmRNZktSRUlqVHJaV3J4bE9CZE9McENJcFE4MlFuZzMvUkRU?=
 =?utf-8?B?R2V1RUZWYXdKK3RlK0wxMm1VMFRMeENid1h5eVNqeER3a3BwSk0xc3dka2cr?=
 =?utf-8?B?TlhZWm9pc1ZsMi9FdGRDNFJMUkZiWmtUM2JDRHFLWEx6R3oyL083RkxENlg0?=
 =?utf-8?B?VW1aemM5T0ZzcUVnay90WXlpakJXcUlkclFhdVZvTERxZHpHL0pLY3dZTHlP?=
 =?utf-8?B?RkxrdmJaVHBkcGp0cFRLeGpDT2s0TjkveHppQmtGT05zVzNzUXFZakZDUk1Y?=
 =?utf-8?B?QWRGeWdpaG9Kc3dMeWIrbVhMd3dVZjdIanphekhaUllDY1ZMSjdBalhIem91?=
 =?utf-8?B?TWNYN3IwRVAyZjZHbWdWRlljcHVYelVBZWY5a21pa1ZZMTlQMEEvOHZRay8w?=
 =?utf-8?B?NnBvdHhvR0w2Q0pacnBVMGgvQ0UydzlaWityaG1WclIxbFl3R2pZS2IrM3Ew?=
 =?utf-8?B?SjZCSkZzUExibzMrc1I1dFlzQWp5bkNDVDU5NmxoVkkwR3NLQ20yM1Vybzg0?=
 =?utf-8?B?TVBNekcxSmdMOVRHbmRPb0dCMWlTT1dKNkI2MTdwQ2NaVUk0TEMxSUIrRTAy?=
 =?utf-8?B?Nm9remVjLzJqZ0dOYWxuKzZ3ejZ1aW1JSStyNjdFTlJRL2VvK2pNWWpHYkd6?=
 =?utf-8?B?b2VObmJhMlM2ZmRCR0RoUW84QlFmWWRHUGNpdUVhQ3l3bER3UStaVHFUZGc2?=
 =?utf-8?Q?MEdz2O/EVOCIdqYZdY4AUYM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6bd62d-02e5-45a0-025d-08dd198ea4d4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 02:51:00.2227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0Ac6bZze6Gw47B2HBtn89fGm1oBj0C1xg4SE7jFCno1hapyw16XbwpjUnrFAeh6xOHsi9zR2DKnVQrXEyEOUMtVH/ji2CNv4q6eHNxC0Eqav6Goseb+lG2BRFoljXhL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7210
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



On 10-12-2024 19:23, Swati Sharma wrote:
> Helper is added to return maximum dsc sink slice count from the
> connector debugfs.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_dsc.c | 24 ++++++++++++++++++++++++
>   lib/igt_dsc.h |  1 +
>   2 files changed, 25 insertions(+)
> 
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
> index 229cd3298..8d259b734 100644
> --- a/lib/igt_dsc.c
> +++ b/lib/igt_dsc.c
> @@ -308,3 +308,27 @@ int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name)
>   
>   	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
>   }
> +
> +/**
> + * igt_get_dsc_sink_max_slice_count:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: The maximum dsc sink slice count from the connector debugfs.
> + */
> +int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name)
> +{
> +	char file_name[128] = {0};
> +	char buf[512];
> +	char *start_loc;
> +	int max_slice_count;
> +
> +	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
> +	igt_debugfs_read(drmfd, file_name, buf);
> +
> +	igt_assert(start_loc = strstr(buf, "DSC_Sink_Max_Slice_Count: "));
> +	igt_assert_eq(sscanf(start_loc, "DSC_Sink_Max_Slice_Count: %d", &max_slice_count), 1);
> +	igt_assert(max_slice_count > 0);
> +
> +	return max_slice_count;
> +}

LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
> index 7ab0917ec..3cf2d4e76 100644
> --- a/lib/igt_dsc.h
> +++ b/lib/igt_dsc.h
> @@ -27,5 +27,6 @@ int igt_get_dsc_fractional_bpp_supported(int drmfd, char *connector_name);
>   bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name);
>   int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name);
>   int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name);
> +int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name);
>   
>   #endif

