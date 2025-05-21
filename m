Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086D7C54E65
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 20:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D9410E71C;
	Wed, 21 May 2025 20:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCeqYkYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6311A10E71C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 20:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747859146; x=1779395146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Anh+FE3P+4YKzIcMKPKJ0VG77HCiGjrf3X3CPnCehyM=;
 b=oCeqYkYFNDriJeBSmxfGs7MKNfXw8E0+eTsvbFTbnhoCu6cCkzmpgeIq
 53xt7kAojZq7BN4xEbTjcwpc008LiYSj7Bxr5tkIWk+BYHvq2jtbscTPw
 Zp9T+ZcckFoM7aYtLdg3ey1tAxIryv5bQNGvFyq2ekTNYlIzlUsFGd7M8
 KGqE0jJpdVhpibBY7eZpOfCa5KaECYEWXiTvHXxbPS2I7kAt4naQp6xGJ
 IvDMA+OZQ4/0zzypNijmkOfW/6v6mOTP2yFREtz01ao8tbGUsz0ecXtxG
 Agwthlr6aebhdzDnh9qpwQowjxcfHP94iT1S1dKPz7Z8et2uu+ddSSBf5 g==;
X-CSE-ConnectionGUID: G52drYdCTUO2yde/JFBueg==
X-CSE-MsgGUID: Fafh55E4RzOTMnZfc0xBBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49957495"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="49957495"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 13:25:39 -0700
X-CSE-ConnectionGUID: nGEkHza1Rc+LPZ/M8AWYyg==
X-CSE-MsgGUID: imyM6ivGSuq3qJsryuNuuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="139993820"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 13:25:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 13:25:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 13:25:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 13:25:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E09IzqY4PPZp+HG4cr4t0IjFc3rZrRYQOzBPX7UJYNmOQZLWhQNMOzcSW6lFgfK8hKdyA17ANqH2w/RvkiRpuPZsrBTw43KLfHKau76Ea+3aPizUAxMLnSZls+oDmWd9gF59poDnbCdlN+HQGu07A5aVbj7fDAyw+IrteQXrmboQ6VWwJpmzEv4C8BXNfnQAU/sAOYX1vY5efDOVPawMaWbF83+UeiXEdPkBRPN9tDNmt7sMXVQ7678sKtALnhEkwZPkDShPwcmBPq14SML4S76I/fYVlpic0CvOQR85IRPIkxAnqIs8qg0zLgyBDbdyOci3DopEjPxb93XIjH6vpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlpy1ORuZ2xNNjvITbpxv5ruZrCGk2B3Zysv2+Xpgok=;
 b=LPdZQc9nPxDYIh1RuxpWOdhmJNCYIU25VHtrYZVH1ODX8L4/AxwqsbBIOP+PMe1QshF6Enw2wAfjdnzUcd+BwCzWNrSwxqcjpXjKtaKzgSy6UZXZdF58f+rh9nkE+TGDDPZEBOIzRNPqzXyd2Vc5TVQf054QzgVkRogFvR89y45IUlp9XcYcKeD43Y/swCTMjju9dzl81fN6xuywXC5cwxzy88dveaxKUxVea9TUb2btv8yD+OqPS1K/i20nlVQcrnGezp7YHGhrLKfGDzdPcBdHcF9wLtUALBh9XVhz/E31KNxZzmYVNRgk1in7JgoIC4284GF9GRARJ/kzFiz7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB8275.namprd11.prod.outlook.com (2603:10b6:510:1ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Wed, 21 May
 2025 20:25:20 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 20:25:20 +0000
Date: Wed, 21 May 2025 13:25:02 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_oa: Ignore other errors when looking for
 buffer overflow
Message-ID: <aC42nt8WKPAbJPf0@unerlige-desk.amr.corp.intel.com>
References: <20250520195249.326080-2-umesh.nerlige.ramappa@intel.com>
 <87o6vl4tar.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87o6vl4tar.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:303:b7::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3aa437-025c-4282-ce22-08dd98a59b6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nkh4elE5T3UwejQ2UUpHTitaaER0c0pDekV5eG43aWNzS2tGQWhvYi9DY2pj?=
 =?utf-8?B?STk3d1FUM3BQN1RuOFNKOWVjb2gvREhUL2ZGK1NPREsyc29FRTRKRHhWOXZS?=
 =?utf-8?B?bE1NdzJKOGg3cmNCcm9rNlBnRVZlNHFPTW5teU9ncjUwY0xiWVBEWExoTDJZ?=
 =?utf-8?B?SU5sZkc2OHZZRi9qaFdZYmdEaEZWZzh2UVZZOVFCYUpiK1BCWituYlZMTHMx?=
 =?utf-8?B?TG45NVdKNUZnbVlnM2lKVTNjRDk1NVNwQjkxcHpSb1hXcGZYNHlPRHZCWUlP?=
 =?utf-8?B?dHh4RGF5VVc0RFZJWVByRDlhZXE0Q296dmZIUWV0aGZhRGQxTlJXNVBNWmVY?=
 =?utf-8?B?UlpmZ1FQTzlQY1NwT1VjWHZzejhqTFVDTFBtTk0zak1lTlgrenhYd0hTWkhH?=
 =?utf-8?B?V3N5dS85ZFhrZmpoOUlGU3VaLzJKR0JwUytROTk0cyt4MzVPNnhWTjhCeFZP?=
 =?utf-8?B?a1YrZWJtY1dUNzVITkNDSURJeHpOY2JqWHFpTkVoUllQVDZXK1YxVm52dXlK?=
 =?utf-8?B?Ry9YbVNpS0dtM3d4TThLc1Mxc2hSajJ6MlZreG1sZnRpckNSVmhFdGlUMHI0?=
 =?utf-8?B?S29SOHRaOUN0N0JJUENOd05WVXlUYm5PeHovQnQ4NWF6RysyYWlWSUpJcUlu?=
 =?utf-8?B?bnF6L2tYbW4rVyszclF2VndpM0FYZ0hqQVhaSDg3em5OcXBkWk0zaHZGVTVB?=
 =?utf-8?B?K2FlZEM2RVIyRE9pR1d5UkpqeXJjSjZrZWl4WFFiWWJZVUN4eldIVG5mSEUw?=
 =?utf-8?B?bE52Q2VhaENJTzFqQmJQamdGTjduNEJ3SDFmdkkzM1lTcWhJTDhPZDk2Q21t?=
 =?utf-8?B?Zk05WWNUOHd0VDlyUVJSYnQzL0JpNlZ3a0VMcytQZWl4dXRFMTNhdkwrbjJ3?=
 =?utf-8?B?aDFwNzZGcjNZVUpkZ0xNaTdxVXJBcHBaanNBRmU5L00wQmNRN0ZKNWRNQ0pw?=
 =?utf-8?B?NFB3L1NSL3hLTHhaakNURDBTQUtxdFNPOERJZnpIVUdyRGcyUzFBbmtWWll4?=
 =?utf-8?B?TEFhUTg3SHJDTHEySkFldUxWSlVUSEdnMjdKQVo0MTJpWDROdDdNbnZWU08r?=
 =?utf-8?B?VVV2bnpBNW0rc2M2ZklUY0ZhNnp4ZEdoNFJsY1ZNNE1RVzhZWnpuMDlpb3lZ?=
 =?utf-8?B?RlV3bHNQZHVhc3cxdzh4YUlyU3QrVnRrdFNaOUZteTRJM2tCOFlhUWRWL3NW?=
 =?utf-8?B?bnVxTzNLZEZKcjJNdEljaWU0OVpzUncrU09qQkEzOGxFRXhrb3Q0RnFROVdv?=
 =?utf-8?B?ZGVocjUzdDlaM04yRjFnM3dvMS9pSVVsOXk4TzdOclcyVEFLcjJ4alpGTC9F?=
 =?utf-8?B?RkxLaWZwMmZoWlgzWFQ0ZGl6bWtEL0hEMjhqZVk0d2tMY3BtT2RCemZvcXNC?=
 =?utf-8?B?aGY4TzBVOUZwemIvYThmbnRuUE1BRW9XRGdBNFAxY3h5Skk3bTV2ZGhiQ1py?=
 =?utf-8?B?Q3Y5cVYzalNyVllHZnlVRTVtQk56MWdsYXZIZkwrZG0vMXY0ZytRMDJpWFlT?=
 =?utf-8?B?d2M0SWtqZzdZVDVVR0N4OGdOMU0yckxnZDNnMWZ4ZXJjZXZ3WHNtbHhsUW40?=
 =?utf-8?B?RUg4eWRMb1JpSVJIMzVxREZ6SGZaUW1VS3Iyd0UyTlNFYTlLQjZwWHc5TVk4?=
 =?utf-8?B?RVo2UTY2S0tEY0hOZFppUXIwNEdFVk4rOUpnU0ptaDVNRXk0WjE1R3M1N0oz?=
 =?utf-8?B?UG9FWWVPVXc3K0E1enRyRDc5dm5GdkdQN1RrUDVKMXk4VFI2TlBQejhVZ29R?=
 =?utf-8?B?WFBTekRONXVoMXhla2dzWnZSTk9zbEFOOTZXczBUZmlUTDN1bnlNdFFMQVpC?=
 =?utf-8?Q?MVhrDUTkmxLsuOHg8ftmmVRvpx1oVxHRBD/lk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjhOQ0I1VmlYR2I5ZVl1N01rZTF4ZU4vZDh5N2pESFJ1TGMxTkFuOXZTMnFp?=
 =?utf-8?B?RGx6MXQ2WVJhY0I1S1VidHFvZkxSWTFBaXRlQlFyVk15Zmp3R3BHaXpuSUNj?=
 =?utf-8?B?ZmxQZjNrK0daR0VKcWZTczNTUEQ3bjdJcjlLNHpFM2xxVDB0ZE5RQnR6WXdW?=
 =?utf-8?B?ODRNdjE2TkFXSHJYS21SKzcyNW5YbXZQTVJ3NlZXMEgrZ0lGS3VnYURLT3lY?=
 =?utf-8?B?V2VTdC9XWUpCT1BBVXdnWUZTRG0wTG45ZXVocUg1dW1qN2hLZTFvNFBpMFZG?=
 =?utf-8?B?WE04cTNRK0Qrd1crR04xTysrcXcrOTZpakFmTFVpSzY1M0x5WG1LcnZSWkx3?=
 =?utf-8?B?dHBadDdvRFhKbkRaZ29CWXJHaGlnOUlsNHFQTm9jdmw2ZDJsTEVoN2Q5WC9N?=
 =?utf-8?B?TGZSL3ZFZnQrUFdVaSs1L25HazdIL0p6QWMyd2RnQ2NUS3ZUSVNIK0d6b0U2?=
 =?utf-8?B?Y0N1d25JNGlFUTlnc3BpeG5zYmJjUzAvWEk5b0tzNEVCUlJkbTRYUUs3QWRh?=
 =?utf-8?B?R1hSRXBWdFhYKzBjd3pjT1VBLzV3dk1KUmp2d2puc1lOdkNURk14Q2xNQjJ5?=
 =?utf-8?B?MGV4WnFCZGh0R01qNSthRzFiSlRLcWp1TUxiNk9KNkh2d3l2RGJoYnc1VFFH?=
 =?utf-8?B?UHN1RFcwOTFRWnA0K0VTR0w4U214eUFkNExzNmFDUmxNNGQ0TW91NCs0cU9J?=
 =?utf-8?B?RU1ySUROcmpWdExwd0ZZZmRLWVpicUxzdzBZQjdPM0UxcE80M1lZZFZBakpY?=
 =?utf-8?B?RXlLTkpYeDY1M1F1UkZxdG1GZzRFNHNOWDZVUnk3eWE4SjA4dTdyVklWR0w0?=
 =?utf-8?B?dTAvQk83c2N2WW9ueDQvc0tOYm5ldS9sU0VXdEVvdmdCWmw5N01FaTNWenFs?=
 =?utf-8?B?Q3R1OTMxWVFsTS8zZ25LVUZNTS93U2E4K09FMjN0TjRUTGRLM1Q2RWxZeUtP?=
 =?utf-8?B?TGVWR21pK3hYQU05dEROTmZveGExNWVGR2d0ZG96dW1xQnJkOW5PdTA5am9z?=
 =?utf-8?B?TzVLaElWQUQwREhpN2YzK3dYUzR0T1Z2ejVmMGk3cVcvZE5BeWJMdnU4RjBp?=
 =?utf-8?B?SUxobi9uQnMvWEQwOWdkL1MyUnFnS2poTFl3MnVTazU0UHBid3pBV1U1YVNa?=
 =?utf-8?B?SjVDakNIUitSbUhIZXFybHpzVUxTOCtVR1dnUEpqV3cvVHQxZ0FPeGVDZytN?=
 =?utf-8?B?UmxseHd6K0UwTktRSmxDZ3U0Ymt2Ym93Mm9iTEhtcFpTSzFVamhBejlWMWhH?=
 =?utf-8?B?MXlNR0JXUytWTkpOM0p0R2cxUXMvZTF6SWN0b21MM3cxSUtHaENFc1BjUk5P?=
 =?utf-8?B?MTNIZUcxMVBMaE42aFFmcXR1dmxlcEpGQ0hkcWJMc0tnR1BrVktlcS9KSzJY?=
 =?utf-8?B?YktmM0g2eXNwVUZwUWdmNW5KTXRVRFV4RnV3U0RGZUxtUG5VamNzZkR5ZG1G?=
 =?utf-8?B?eGRGb0hXVit0VEhJUWgySWJHNnNZbGl5NTNCUXBCR2czOGN1bUNlMmdxQ2Fy?=
 =?utf-8?B?Yy9YMTNuOGxjdlZ2NTVqSU1BT1Q4NEwzMWgzczN4c3N0YlBlbjVFTStkT1k5?=
 =?utf-8?B?KzJVRlVnOXZlS2MyNDk0TlhNbWtVWmQ2TXMyeGZMcUxDZEtFb3llNDBoQ1hv?=
 =?utf-8?B?b2lNd3crVW1vVVpWVVVoRlRyZWtVem9XamR4cm84R3QrU1lacENwNDhZM250?=
 =?utf-8?B?eTNEUVJHNWpMVnB6NlNRRTB3ZGtMdjNITjZubXdoeWJSQWdtcnljdzQ3cnpm?=
 =?utf-8?B?RFVnZjd0Sm4rMlgvc1NUQU1ZdHhBejBwOFFhY2VndlA1dVN4aWtDZElCUW5y?=
 =?utf-8?B?M1dxK2JCVVA3ZGhRaHZQUXVidzJXWms3dUREZ2RQZERBOS85NmR0ak9DeXNP?=
 =?utf-8?B?c3didldKc2UrbTdJbDJZb1lsRy9uN3FWRzhtalVhNnVKdmxVYnI3ZXZTbTBn?=
 =?utf-8?B?c29zUmg5SlBEN3RHSkUxeWw5Z1drdUhMS0RReWJENXd4bFdoZ3BtVUIrZ0gw?=
 =?utf-8?B?cThkRkpmYmdaazB0QWdLU2tadDZab080RDV3SmRCZXRkRXZPRm9zQThnalE0?=
 =?utf-8?B?U21UdkpoWmppc1oyQXB2dzVoYTYzQUVYQ1I1MkdaWm1QTTlSczJJTGpwQ0xp?=
 =?utf-8?B?eGVNaWxHcDZ4UTNoa2h5RklFMXYxdklJODEyNWFxeUZjbWxiNlFYeWIva0hz?=
 =?utf-8?Q?vwmD274LRs1f1sBBTj2lEV4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3aa437-025c-4282-ce22-08dd98a59b6a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 20:25:20.2208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhT7k7NY7vWqsStt1gJNpJZRLcU6weg1DjvktQdh0ta9jFt2xc4UnbMnQy6MlbOLO0lYS2WnLaMteJvAmpN5FvnbJxtLwHxnAqjqnl9EsDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
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

On Wed, May 21, 2025 at 01:12:28PM -0700, Dixit, Ashutosh wrote:
>On Tue, 20 May 2025 12:52:50 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Occassionally other error bits will result in EIO and prematurely end
>> the buffer-fill test. For this test, ignore other errors.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4565
>
>From CI buglog it looks like, a REPORT_LOST (0x1) status is returned before
>BUFFER_OVERFLOW (0x2) status?

In this case yes, but I have seem other occurrences where counter 
overflow bit is set before buffer overflow.

>
>Patch generally looks ok, but a question below.
>
>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 17 +++++++++++------
>>  1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 73841a359daf..2022c5cb3955 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -2520,7 +2520,6 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
>>	char *buf = malloc(1024);
>>	bool overflow_seen;
>>	u32 oa_status;
>> -	int len;
>>
>>	igt_debug("oa_period %s\n", pretty_print_oa_period(oa_period));
>>	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>> @@ -2535,16 +2534,22 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
>>
>>	errno = 0;
>>	/* Read 0 bytes repeatedly until you see an EIO */
>> -	while ((len = read(stream_fd, buf, 0)) == -1 && (errno == EINTR || errno == ENOSPC)) {
>> +	while (-1 == read(stream_fd, buf, 0)) {
>> +		if (errno == EIO) {
>> +			oa_status = get_stream_status(stream_fd);
>> +			overflow_seen = oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW;
>> +			if (overflow_seen)
>> +				break;
>> +		}
>>		usleep(100);
>>	}
>> -	igt_assert_eq(len, -1);
>> -	igt_assert_eq(errno, EIO);
>> +	igt_assert(overflow_seen);
>>
>> -	/* Ensure buffer overflowed */
>> +	/* Make sure the buffer overflow is cleared */
>> +	read(stream_fd, buf, 0);
>
>How does the buffer overflow status get cleared? We are still doing 0 size reads?

Hoping I understood what you are asking:

It would have been cleared as part of the read itself since the KMD 
implementation is doing a read-modify-write. Right? After that a 
subsequent read should have that bit set to 0.

The 0 size reads do not seem to affect the OA status update. So the KMD 
state should be pointing to the last values stored during read().

Regards,
Umesh
>
>>	oa_status = get_stream_status(stream_fd);
>>	overflow_seen = oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW;
>> -	igt_assert(overflow_seen);
>> +	igt_assert_eq(overflow_seen, 0);
>>
>>	__perf_close(stream_fd);
>>  }
>> --
>> 2.43.0
>>
>
>Thanks.
>--
>Ashutosh
