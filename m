Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25185C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 20:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28BB10E5E2;
	Tue, 13 May 2025 20:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXDm8LyL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F79510E5E2
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 20:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747169874; x=1778705874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/wusy5EtACYQUY4yTaui9W+HeHyZ8jkBxyYg3dLLjKg=;
 b=MXDm8LyL8IIo03iAQv1ZqE1GxluY8Sizg5TOjtBbc3KaPrqjpca9B9Lx
 t6QFR7JdFudK0YjKLgtCiaKGXTaLiXmtkWR1YFgSIk4bKdZjffFtMuc0M
 0yWWdcDFsN0c/8Yn0qJF7tHTu/XnQ6UrIqos29N6V7lZDpyZVkhjtvgeS
 GRxAk2GWvb8A0E7tGCUxNk2M9AFMvDu3X81JHUZrAgUun5v7UJWeM3L9h
 94QnfivgMQWJGPV86WrOWH3KLQAKQ6Qvp19I9OnnwYGcDmmiEG9rG1Zia
 4stg/hArRueTVozvmqiniSGoaaTYzk/1f7REV3PFFUFFJBH5phVCuVR6l Q==;
X-CSE-ConnectionGUID: cYSS2knQRRGdKDrqi5p2Bg==
X-CSE-MsgGUID: 08gJbEeWRXuC2VDvy7KL9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49113403"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="49113403"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 13:57:53 -0700
X-CSE-ConnectionGUID: cpfvMgSpSHeaE1fBFWbr/A==
X-CSE-MsgGUID: SXQYRStmQRyWd/T2uT4ILA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="141854350"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 13:57:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 13:57:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 13:57:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 13:57:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwfSnUVbapMWv5mJDL/NgSj68kly8OJFGJ0esHlPiaJpazQ1Zm4qdLBBcr1Ar3HxfRuTLwEoJpbiCPyGV6/CurX+2iUWYKDETnJo5NMYnSigRvgtqzoUlVJZrSaZRFfNqB7/6e+df7PBrtvKiFuPODWNO1tge4I6bZAh/AwJWrVghTTrLFbakrPy3Cb4kfLaSzoBC+JcrSwWybkYWi45bFD8y4du5Imwe/6OAE+NxtNueFoOQ5CAuKfrMrbE9MLS2BPzIuVZEXTf3Q32KWZfviFzfhwmmyDGXMDbY9br5XWDJKIZaKZ+7/ButKN+IlEeEVqInMoRllRDB2iSS88ZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBDsEDKEFSOc7giJQgyZaFC4WXWktG93ipq3l8SuHek=;
 b=Lf+n3UfjZS0lPOgZf4Da16O8vLhsLhexADOFEDiRrEtf7mOaD1JTE/herLAAvhOuESrGEKHxtBMU++NtCqoYkcNRPe//m6aWPm4AU5X9Gm0/2/IqZU/4jYhxm4ETS0eFxJYGjgeKFPIqPZbQVT8k5jTPF3LVtMEYXk1FViA1NC312t1N+cSPC+ux1RFlXTcQuPnCgKX6Dyv4MwCGHWQ9HK+2KuYJj1lC3Q/ZUED5z+Mnjn7y2vutII/zWquEOHoX0T8QzmK9sR1xGqGSprA8OzEy2hvDuZyADJo1FB8BMfL0NpFz6mIK965u8o47r0bYVC1vK8SCCdXSTP4QYEFRPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Tue, 13 May
 2025 20:57:49 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 20:57:48 +0000
Date: Tue, 13 May 2025 13:57:41 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_eu_stall: Do not check for
 presence of data on simulation
Message-ID: <aCOyRTu5s_Is5etp@intel.com>
References: <7480b4adc93d3606d60d718d269c92791c22df68.1747105491.git.harish.chegondi@intel.com>
 <85a57glavf.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85a57glavf.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: a0980f5c-1062-48d9-3cfd-08dd9260d12c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmZkSk5PYmN0VU1mQzltOG5zU2NxOU9VOW5hVVdtRFZXVUpBYW5nUENQdXNu?=
 =?utf-8?B?UXdUUzVyek9sUGxWOXZHR3ZCUkhYZWlDNXR3ZDcyeUhKbVFQLy8wcGp6SER0?=
 =?utf-8?B?NXBrL08xT2VpQndUaDJUQTg4SlYwS1B6NFVybDM3V0ZVeUJQbFNVamowbjBJ?=
 =?utf-8?B?Y3JYNVBxeEtib0UwcDVEVUJYVjNIL1N0WkJOWHZBYmdKWjZjZ2VjZkR1d1hp?=
 =?utf-8?B?R1hnOGhCTnd5MSt5QUFBT1k2UmZyZ0xkYkEzUlpqa0dlRVd4RGpYL1M5Y3Rx?=
 =?utf-8?B?U1NsZU0zK3RvU0pnV1Bsc0hSSDJtUmJnTCsvTkFEald3VjdvajVYNStuc0c2?=
 =?utf-8?B?bkhCUWdnVTJldzd5a05RWGhyemppaW91dlBBTG4yWXVRVGtQcjRCb0pOQ1Zu?=
 =?utf-8?B?dFg1bndja0dEMGhFbWUrOVdsNjVEZEhSL0NXdDk4bUtwQUgyemhMWnJNRGFN?=
 =?utf-8?B?aWhWRHFoeHFSV2RlajdvQTRLM3NubUFBQ0NRRWs5eGNvZkVxM0daK0FGanZJ?=
 =?utf-8?B?ZGJ6NFdVQnpiOTZxcnFKKzgycFlla3hjUEIxOThIdS9zTktDVHdlaSttRTJE?=
 =?utf-8?B?eEdyR2VuME1ndEF0QzVPaVNkWEdFMXpqY2ZRb3NhdFU2Lzg5RW9tUzlUNkZP?=
 =?utf-8?B?ZGtpVmJhVUdBR3R2LzFIS21KaUJRbXphUkxnSWs0d2JrMFBoTzYxUFFGZkIy?=
 =?utf-8?B?M3ZpN3R6ckNWbTdvRVBSOHBSUUlzMEZzZDdVUll3ZnNKRWVmTno4RkxZUHdW?=
 =?utf-8?B?Y2FwTkZBL3BVTTBxOWVTeXA5ZW40aXU0N21IWGM3OXl5SWR4RmYxYml1TG90?=
 =?utf-8?B?Ry9ES3BOSzNGNElSZmNlS21ac21LY3gxOWM5cUNpQkJNcGgzUU41bFQrRU9P?=
 =?utf-8?B?WC9GNExsWWoyZkNMdUk1Tjk4Vk9tWE1tazg5SE5LMGwrVStoM0s5OVhRMjNs?=
 =?utf-8?B?SmFDSklpZVlrN1NoWWxXUERLakJEQTFOQmtpenJFS2d0R3h1dW1ZbjlUTVRH?=
 =?utf-8?B?cmQxNmVCUlNpRFkzNC95UEllMy9qcEdsQ3BvRHRpNis5TkZOTVVyMkNHU2Jw?=
 =?utf-8?B?d3BGWld6bU10MGp5L0g4L2FZV0pkZnQ5aWxIUGN3RTlZcFBrbGV2R1RaNUp1?=
 =?utf-8?B?aSsvZmZDaGp4cmU5Qkw5L0Jucm4wZ2hid3dWWFVPaWFzMjZmY1htZmpzeHhk?=
 =?utf-8?B?UWFvZWNNQ2VnWmsrZSttVEl4Q3djOWZEZmM0QVArMUNqbHJSc2RjMjhQaUZn?=
 =?utf-8?B?SW1LaWtLaElTMkZHUzNMQzRsUnZMcWxNSGxoR3pWQzRXL3ovVG9pRk1iazZ3?=
 =?utf-8?B?SVloKzRuK3l2OGIvRkZZeTkwbldGWW1aV0NmNWRtUm9CdGhIY3VzY1lWTGoz?=
 =?utf-8?B?VmUxbzltVWJxV3NEZXBhdWRHUHFTZm9UODdwOXdTb0h1K290aVlHWXlVZVM1?=
 =?utf-8?B?QjhrU1U3RHlZWXZEUGxhSDl5NU5RTm55NzFjb3dDNnhxaGRYbmVhcUFCT01X?=
 =?utf-8?B?VFFqN3Jyd1ZLNnYrck5adWc3U3JDcURQd0s5MWJuejAxNU0zMUFDMS9Lc2h0?=
 =?utf-8?B?THJ1MmJOT0VIdUFockVUb3hSc3BZSVN3OUZSMjVQc292VEIwdVlZejd4UjQx?=
 =?utf-8?B?eENDWmFzOUJEbkw1UU9XUlFVL1BZeGVKM2JETGR5emljaTFOd2o5N0RXRFNH?=
 =?utf-8?B?bHJNMnBBeW1SRmhMUUVnVmJBVzFSOGNoK2l2L1diVDBWWkJqbXg1Yys1dFNh?=
 =?utf-8?B?TFBIUWVmS3dlVnVGTmpTQTZ0c2dINFlwOTFRL1BwUVdFUlprSVorUzA0RVM1?=
 =?utf-8?B?SlpuZVh6UzRMS1NqYU1STEJEL3BnSjhUZHdibW1pcE55ZVdveGpONFFUNnBR?=
 =?utf-8?B?aW9JaWV6ZkhSZmN2OUZZMWkzWWdlSEtXeHN3SG1odU9KeFloZVNwZVVjYUpC?=
 =?utf-8?Q?/Uzpfmo/TNM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzB3SHp2dkpsYUJMZE5qODJ5RDA5Qm15a00vVlRGQmJMWVlBbTJKaXdKdkp4?=
 =?utf-8?B?aHVoQm9SemhLb0hScFY0SHhpSHpIMm4zY3diRzE5bHRoZnNVT0hNL2h3M29K?=
 =?utf-8?B?NkRjbDJMYWhiMTNmNDNqMVQvMWozNGZZQkNpdXJhQWYvNUl0K1l2TkhzdzJF?=
 =?utf-8?B?cklZMytsc0s4SnBwR1pxQ3ZLS2I0aWprZUtPNWRjaXRkL29yZTJ3d0FvSlcx?=
 =?utf-8?B?SHQ2Y1VWdDl0VjlGWitwckJuMDJqbWQyZDE2ajBrU2RRRUJHNVRiR0xNU2dN?=
 =?utf-8?B?dC9EV21TdFBRSmRxT2Y1SlRmVGFuVE4zZEtiaFQ1K3JzTUM5eWFsdHliVWRt?=
 =?utf-8?B?RmhsUFZGdUh5QWZkSnRkTEFOMjBVcjdDTHJFTkw0TTNoOTEzSmRmaVRNMDI4?=
 =?utf-8?B?KzN6S0NmRGU4eFgzLzRQTzQyempzL1pESHltcjFSYThES3k5V0M2L3RFWEND?=
 =?utf-8?B?ck1CZ3RYUWhUME1JeXA4UkhjM012QXdMRjUyc3Z5bFpCcHNnaHZpQVRuNjNO?=
 =?utf-8?B?NURBWHRFc1p2OFA0YzhWK05NNVd0QUo0ZXdwV2R0bmhQWThaeVpxU0F5MTlM?=
 =?utf-8?B?TTVCSlFrN2IzYTlLWC9DMzhSKzBhZTZlYU5oNWV3Y0hQcEl5QnlxNXpjbXAw?=
 =?utf-8?B?Q21ScTUvTjdJdmduWWx6LzFxSU1IVEJONUFLN09WS3pWVkw5NHFWR0IzQ0V1?=
 =?utf-8?B?RzdqQklLeWpibE91bHZRNmRGeWNabXdicXVVai80N1oyL3Z3NGtlamM2b3pj?=
 =?utf-8?B?c01ybFc3dWdqZmVpWDZpcjBkTS8xQUphclNSZWtHMG1DRS84ZFlEUnphUEcr?=
 =?utf-8?B?T2UzRldnOVEyL21xT0hGWEg4cVhJRUU1NVJOZUx3SUJIdU5KNllUVldTbjFB?=
 =?utf-8?B?S2s2MnFqNFR2Wk5SNTRtUXhJZUJXQVk1dU9oVklmSTIvNkltci9zbkxER2p4?=
 =?utf-8?B?U3NLSHR2KzRkRWxVZ1lsemcxUTc5ZTdnYW5UVmxjMWYrc1ZZTG5pU3NlVUZs?=
 =?utf-8?B?bXZTYTlKNmttK3VTeE5aL3hlZGpnQm53Q09wWk9jVlNVazBteW83OS93cGFS?=
 =?utf-8?B?SldYRGExbHRkQ0pGRUdSejd1ZUZwNm43b3FuS2JZV0E1YVRXR1U0OXo2bU5X?=
 =?utf-8?B?Z2l2ekUrQVJJMDhiRlhEOHhGWE04ZWlOZFA5OXVLQlNPSjcwc2lMazcwWGJX?=
 =?utf-8?B?VXdMT1l4TGc3ci9LMmpiNXFtK1Rla3ZzN29ad3k0TWNBT0I3Y2pva2ozRTBZ?=
 =?utf-8?B?MXhJcUgrNnU1aFg1aXBvd3VlQ2NyU25yV1g1ZzkyNktDSENTcmh5U1Zvc1hH?=
 =?utf-8?B?RUJEODROeGozZ09qQ1FXSCtEcjhNMWlrSXducVpKMW5qckNEczdSNlNqekxG?=
 =?utf-8?B?Yk9KRE1STDlFUjl6M1BJeUNRazIrRUpBaEV2dXJXYWJWb2N3RVJoMWpUSjlD?=
 =?utf-8?B?N0dnRm1DcUtUVXBVZnB4Y2ZXdGJyMkJWWDI5WTZYNjlQSkhMZlVCTnd0T2Qv?=
 =?utf-8?B?OXpjdVcybUtLSlQ1SlIzb2J0dFNBYXR4VHo5N2lOZ3JtdjdOWFNVeUVmNGky?=
 =?utf-8?B?MEVXTHdncXU5WTdBVHh5WStKY0pYc2cwalRvN21vaGFBYjl6QmY3TDh5VnE2?=
 =?utf-8?B?MEExYUx2M0Q5UkFXOEgyMlZUR3N5by9ZQkljYkF6Mm5XL0VHemMxM25tZkE4?=
 =?utf-8?B?UnRRNElsMmhRS2dqRm5aaDRRL0FNS2RCLzloQ3dZM1ZONkhYSnRqZ0FaYkdI?=
 =?utf-8?B?bDFsVUlkdE11dnd2T1gzRWtJUXA2S0VNcEc1ejBWZ0IwUmUwMnl6Snh2SzVw?=
 =?utf-8?B?TTNqNDNIQms1Z3c5aDVvUHF3SCsvRnNwYXhHVlh6cG44M2c4SU5Vbi9VeDdP?=
 =?utf-8?B?akJWbnQyek9TMDZEa3J4VjA1ZzZ6OWdpdVk2MEU2VnhkcUR2Mkx6WEZmMFpE?=
 =?utf-8?B?Tks3OEU5cG96MEhzeUpScGkwV2preTdQdE1SSnkzMmExNXVOeDVaNitWMkFy?=
 =?utf-8?B?NUN2Y0EzRTRML1ZIUE5UOUM4dVBVd0dsWWF0cmdUSmdCRHhNa0YyQXhrSUlr?=
 =?utf-8?B?Sno4clJWL0Rlc3B5WEFpRlA4a254ZkdNbDBLZkowZDdjSGhPREtWTGN0SExV?=
 =?utf-8?B?RzRkSUg1UmF2ekozcW4wNjZPR2FORkRhTkJMdU16S3JoL1pTeDdTUUJ1VWpi?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0980f5c-1062-48d9-3cfd-08dd9260d12c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 20:57:48.1885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXniwRzMAOqMYqEvEdwUCFXWvtTd+BC7Lvm819PkaIpkKrsKrkf5IOJ8YzVfnEJowT4syUbulYANnPeoDv6NAxsfGbmVrr7OTE46qcAK/YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
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

On Tue, May 13, 2025 at 09:43:32AM -0700, Dixit, Ashutosh wrote:
> On Mon, 12 May 2025 20:07:38 -0700, Harish Chegondi wrote:
> >
> > Some simulation models may not have full EU stall sampling support.
> >
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  tests/intel/xe_eu_stall.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> > index 411c30871..bdfa0fc4b 100644
> > --- a/tests/intel/xe_eu_stall.c
> > +++ b/tests/intel/xe_eu_stall.c
> > @@ -586,7 +586,6 @@ enable:
> >
> >	ret = wait_child(&work_load);
> >	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
> > -	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
> >
> >	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
> >	if (--iter)
> > @@ -594,6 +593,9 @@ enable:
> >
> >	close(stream_fd);
> >	free(buf);
> > +
> > +	if (!igt_run_in_simulation())
> > +		igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
> 
> Do we really want to move this here? Wasn't the earlier location better
> since it checked num_samples for every iteration, whereas now we'd check it
> only for the last iteration?
Hi Ashutosh,

Initially I didn't move. When testing I noticed that if there is no
data, the assert triggers and the following close() and free() are not
called. When the next sub-test gets executed, it returns EBUSY as the
stream is not closed in the previous test. So, I moved this check here.
Anyhow the data from the first iteration is checked in the blocking-read
and non-blocking-read subtests where there is only one iteration.

Thank You
Harish.
> 
> 
> >  }
> >
> >  static int opt_handler(int opt, int opt_index, void *data)
> > --
> > 2.48.1
> >
