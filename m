Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2A3C5AE59
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 08:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE9210E1CB;
	Wed, 28 May 2025 08:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aw5+fUjz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797CA10E1CB
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748420673; x=1779956673;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NOqU1RXBmmNXPRfOf0B/vNGBkeKaQ9Dw6JU5J6JL4Vc=;
 b=Aw5+fUjznJ9HLBUDFuxNf3PN+rm7zW7zCedCIvbJ2l+/DcBDdU7xdsJB
 qx1KLv5dYIoQjTy2Shgy1wagZw3keDtDyFlDv4fUP6kwLLQvbxOn1G/+U
 TXkm0koypVEYfg05LQrSUXs3+6/e2iQe5fd7DkMSyFqJR6YJCSZRklEYY
 PHBDyOA8iEiJm/aCw0L/Bocs/gE19eh8B+HTCD0eXRDMm0EVcUXTn0oEl
 K/MvNL7yxMeSwQ65SElMY9h7CHeEZXJjDGKZJRhc9uKSso3ze6o6aNfp/
 M3NRDMi/8YWZ4xmlWwEgbgqGRKHPa/JoxxjDy/Ul/HKExl/i0fKl+CBdZ w==;
X-CSE-ConnectionGUID: BlndroGfSg+wnKmDZOH1sg==
X-CSE-MsgGUID: 2Qp8yogSSTy1zag8P5BrYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50593071"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50593071"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 01:24:31 -0700
X-CSE-ConnectionGUID: ZD61kYpoTLWWXcHCokg/QA==
X-CSE-MsgGUID: +jtOMhCtRKqbYdqeZHP59Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143517581"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 01:24:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 01:24:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 01:24:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.57) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 01:24:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nryh7zHTyK4uM8ltEp4mM+tFFXOyyfycFyT7D3Yj/r7SnYxgpL2W/4MZlLK8pkLfmgEjTGtp1p/Ah84cr6t67qIU7dPKY10Gk/VJswmNATIj01sCUJcJkZiTLQaT47/5tm6jOraCGbxYxzWFmzbf4mAMgOicGhUoPNFx805c5PJneOOMVc8GWP3o2kX0x+mgv6T0MeISVx2quJOPf8hZGrF/bu3izJu/uIrY9vEvWb5BFok/rWKhu0CNlynm46KVhYL9PV/5bvEx6NNqb6C3P5rVg4Sd8MmGqplc4PVCylzFQMVpmXHJCryZBbQZzNeKaWZ8psyIoJemrUy05r8cVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcQxRGLUZ2Pol8EaYmlXCUkHZuipSzn8oGzH01Q56/g=;
 b=tJ2VtdES1YFTB0Bpn0hNfN+n7a/DRTYoPHzDFR4V+PewGT/cYzkoRurGlBgmLXDWCV4vc/g09v+7xKmIONuWwC8P/yV2ucDnaZeLN6GtxeZjsKwairVZjO9byWp1DZoiny7Z3K0LlyheY70kOh6kYl14OPTKqv0lQniRcpbyGdHhbGIN4OYAFn1IObur7nyNn+CAEO++NaujXrCVUVYVI9rfkBYucwP9LLhEU2y+dZSWjS6sm1Q8EleRI39rXY+JLFZxVZ7RB/O2dBpvAtq1d+OIWibrYceAds3MN2WY12UeQOspOUgjgTWMkTV30bRUNtPu5S2yELk/iD3ovQpmAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 08:23:48 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 08:23:48 +0000
Date: Wed, 28 May 2025 10:23:41 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 09/11] lib/intel_blt: add support for matrix
 mem-copy
Message-ID: <aDbIDROnBnbIbMOM@fdugast-desk>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
 <20250523080126.75295-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523080126.75295-10-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0359.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::26) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: e431aa30-d085-4cc7-6c1a-08dd9dc0f848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0swSGpzWnllSkZVamFMdlV2Wks2aEJaeVV6QUFGMEdkN1BlVVM1aysrQnZG?=
 =?utf-8?B?emFMekVwZExFTHdvS0ltZFVydGZLTlpnMmtrVm1XMENaclBPYi9FWXhPQ2xS?=
 =?utf-8?B?WlJlUjJnUXZ6QmpYK3pvOC9sYWkxbVVnVFRHdGM2bjVQVlJ5WGFXUURaOTRs?=
 =?utf-8?B?TE54Ymw5blo1dTJyWXBPdlUxUEE2UUpiNzF0QWV2Z0JVdUtucXlSMnVPeXNn?=
 =?utf-8?B?Z2pPcDNjWEJTaVFzSE03Mm9aWFpvK0dWb1krSHVGMmFjNnUwb1doaERnN1Z6?=
 =?utf-8?B?NE16ZE5BV0VlMlVYWVNxZ2R0Q0VFS2MzazlsdUQ4TldNN2ZSTkFQWTF5TUJF?=
 =?utf-8?B?OGpBYlBqRFp5dmk1RWlIelJpdm9FT1I5cUtkOE0vbVlMS0R5M1ZMeVdpV1ZV?=
 =?utf-8?B?QmIvdmd1RHdnY0RjQ1IxT25VNVZzZjJEdjBaQ0ZrR3NmcXBWSTlMc3d1LzZV?=
 =?utf-8?B?S0Zyd2E2Z2REWUFmTThUZVQ0akgvTGtiMjJBVnJDNEh4THRNeTNPSU1hVGlw?=
 =?utf-8?B?MkhkWEhabEhNU3RWYmFtN0R1UUc3RnFZR0xHOTJkaUFvMWY5Y3RCditwRDhZ?=
 =?utf-8?B?UzMvbjlZQnRBVFpvZ1pudU52V0hzWFpKd1JFRjJiMkpBZmFyek8wY1I4ZVU2?=
 =?utf-8?B?a0pvYzRkVERFUnk4WDRLS3hLQlpIY0pZajI5aXNhUE9saTE2Mkc1WVFNTHFx?=
 =?utf-8?B?QkpPN05wVXRYQ3I0aFJKN0dFL3hqVjNaT0pJM3FEWStvQWlHY1ZsUC9JNWlu?=
 =?utf-8?B?NzNRWm81blBkMXFpcVI4ZTlzS0JDYVo4VzNmUDZkNEFobmhBTkFXbWw3QlJl?=
 =?utf-8?B?VnBjTld3a3oyY3ptN1p4d3BGd0RUM2ZhZHBWOW1oM1dQUDVkL1g0SFk0ZVlD?=
 =?utf-8?B?QVpQK3ZRZzRRZFp4Z1ZEZmZJT1VyVEhkT1Y4YzVlVFV6Z0wzZzB3bUZtVkl6?=
 =?utf-8?B?bjBCTHdKY1NaVHF4L0RiUnhETWV0dWkyUTUzQ1NyQklrbnlaUjhHQVZmTnQ2?=
 =?utf-8?B?eTE3cWtKeEJpQk9MUW9abjhXbEVJaVBVY25wNWpPL2dPNmdVQnhLMmFsRFI5?=
 =?utf-8?B?dU5yOEN2bk9XcEtKNnRNMVdjMm94UjMxYzg5QnVCdkRBZVNlM2ZOY2tnRk1G?=
 =?utf-8?B?bnVaSm5odkFvcC9xNG5PQjMzWHlpM0plVGEyNGxVTVovSDh6WnlZRkpYY1Jr?=
 =?utf-8?B?cVoveGh4K3ZIbkE5RmI1OVhiWUhYcTNIUjNEcE40OHdIWXFxVWZ2YjBMQWlZ?=
 =?utf-8?B?REIwdTB1dC9qQzhNUk9WcTM3WTZoRHdkQ1NGeks2Z29YN2tUaE9BMGdvTklZ?=
 =?utf-8?B?Nzc4dE1rbDE0VW5STnhLdlh4cTVVU3ZvMktGYStQckNlUE1Rb2VVYVlGZ3BK?=
 =?utf-8?B?SFZ2N2pwWHpsczZ3SGk4YzJUUUpwZkVqQzJmL0U4Ukp2b1A0SE90bSsrVURk?=
 =?utf-8?B?S0gzaWRwc2lYUnQwMW5mVzV3T1NodTVNTnJuTDdXVldLbTNUUVdxUDVVSTN1?=
 =?utf-8?B?QytZZ1RDbmY1cExJOWx5V0xTaUFhd0I2MWQ4ZnoxTEpnK2pPZ1BoU2kzTlha?=
 =?utf-8?B?MW5TMGRRQktDSmNENWJLQUNoZ1FzUDRqejdiRlJ5eTVhY0pKMW94bjRpUkVz?=
 =?utf-8?B?WjZTemJEMm9qcGkvUCtXRVNBTHVHTWZjWHpIQUlFWHA0K0xKeExsL0MvcFNu?=
 =?utf-8?B?UnFRMGZwUUFqamJsek9xWXJGLzJDdWg2ZTY5WW1yZjVaTWZiVHR6bTNhZER3?=
 =?utf-8?B?NE1BbTQ3UmFmdU9yMzZXVDc0WlZXbEJEK0txY0hqNlhxQlV0Z0FGMTVLekdj?=
 =?utf-8?B?aUpJdjRqcHFYd3hOSGM5V1JZdk1ZTlpuRkJFbHpzYjY4Mkk2ZXRzZUlKM1F5?=
 =?utf-8?B?TVd0YmdDQ05wSFdWUElEQmdjSlI3cWZ3TDVLdWJNRXA3V3p3WnZLaERvNzJk?=
 =?utf-8?Q?kp+AC6R8SqA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWxNbXM4NjROR2dGaHl6dVE1SzNZeTlxR1BwNGdHdDM4K1lTMi9qaFh4YUNh?=
 =?utf-8?B?UjlibG5EcFY1NlB1bHBSOVBTU1pzWFNQRWtyaFJZZ0tiZENzd2ZkbGIxOEZG?=
 =?utf-8?B?aXRDYnlhQTkyMW8wSDI4ZmN3MEhITFFGWWtsVlp1bWlrYThLQ0NGa2dmbFpX?=
 =?utf-8?B?RG1jYTFzTTJQS2J4VTlscmFzZkovY3Z2MGFid1A0QmU5ZC9INTJ3MkdLMzBR?=
 =?utf-8?B?OG5rejdkYVVoNzZwT045OUIvZjBnMldRS1ZoT2svWTBxdzN0WHJwMUd3Y013?=
 =?utf-8?B?Ukh4emczVmR1QnZtQ2tCbi81anFsb1pHZ0tZRTVjWW9YZFZzdU1WbjFWS2dW?=
 =?utf-8?B?c0hiR0ROVjlINHdoWG9uMHFhNlowNEhxak9KOFVvRmdlNUUwZ0gyS200Q2FP?=
 =?utf-8?B?azJBNU1MYmxocDJKMWRDSDlpZVJ2SmZhNTRaYnhkbHc2WmdpZlZsYWs1Y3JF?=
 =?utf-8?B?VHZYbGY3bDRHT01raE0rYlpNQk5RWjlkRzFwSmRkMDd1MWhTRTY0cVVIeU9l?=
 =?utf-8?B?ZlRLT2JKR0pXb0wyWitlMGRGbW0yQkVBUmxnSnZRRXR5NDUwakRrY0xnV2pC?=
 =?utf-8?B?bW41MFoyRUJwbC9WMGgyampldDc1Vm1nSlRDbEVNTjB6M2k0SUYwc3RCV0dh?=
 =?utf-8?B?MUs1RjJDQ1ladkUyZlhaTzNnUzcwN2FWeVpDNFl0ZHhDeXpCU2Rod1lUN2Nj?=
 =?utf-8?B?aDdYSVIxK2FHZnFGVmxWY1V2WEppMC9tTWErMU9IZnIzTUNuREJ2ZWVMOFg3?=
 =?utf-8?B?QlM5RjRMNjBNWXBwOXQ3c1NEcVV6V2NOWHhuRnFDV1dDc2FUakFZS0Y4ZWVI?=
 =?utf-8?B?bWdLVFlBUnk0c3JicnBycFBpWVRmd2JjYW5BTlgxajVPeEtJYkJ2T200MWF0?=
 =?utf-8?B?UVFkeXVNZlcxejhUU1FzdUw5clhJSnZlaGJnSU9MWVpLc296Q1g5aGx2QXgv?=
 =?utf-8?B?b0VwWXFCZFp6dkRwdy84c3dWKzI0TWsvVjJYZzdFZ2lRYUVvS2ZZOXk1aFVN?=
 =?utf-8?B?L0VPRXc3M0NCU1BqM3R1Y05vK014VHdKTEMxWnZEbnB3U01Uam5ZbWovbW9o?=
 =?utf-8?B?V3VvaDg1ZURRbmNRNEk5OTI4M29OYUowYVhlbWNjQkhXTm9SUlBPaVArTVYr?=
 =?utf-8?B?alpWbVdnTVZsMVhhZXFJUkk4TE1PVFhrZzV2eEhrMThsWE96ekR2ZGZRMk8r?=
 =?utf-8?B?TFNqRGJWb0dhbzQrUzZvVldNVzF1a3FCNVVaUCtYaFhGaEZyTGJDdlJQdEdU?=
 =?utf-8?B?MXp3eWk1b09pOUZudVZRWU9QUndzMG9ybVVJWm9mc0VLVVFpWWkwbTRTMTQ4?=
 =?utf-8?B?ZVB3aTg1VlZrNkpPY25pSW5hdjdGWlo2b3RZYitteGNMbmFaNXErcmh5Q1Uw?=
 =?utf-8?B?dTQzZG5ZVGFzYUp2aFBoYktRamtZdUw1RW54Q0Nyci90Q1hmZ1hpdS9MTUZQ?=
 =?utf-8?B?SlVlTUpjSURHM2FsMkZua04xci9QNlI3MGNFbm5FN0RiSXJoeDlkYjVoR05K?=
 =?utf-8?B?cEZycGRpK3hnN0tFNEpEQnIzODlmNmxyOFkzdU9IL3VGV2txVUVnclQ3SC80?=
 =?utf-8?B?bUI1allydTJsUC91Zk01UDIrLzZmbnZnSUtudk83Tm9XNXhxbDhuaTNpWXN6?=
 =?utf-8?B?UnZ2WlZPRU1yQTVUMEJIZ2ExNFJBeVRZT3praFpmRVc5Lzc4SndOd3hCbHcx?=
 =?utf-8?B?N0NBMUFrMnBETkpLNDNXeGZuUWJURW1FMTlpK2U0Rmw3V2NDWW9FTG9YTlRO?=
 =?utf-8?B?NGpBSXVINXpUUG9qbDJGNzBqS1RVWE5TZ0F5b21DdEpIZitlNDRoWXdZOXJS?=
 =?utf-8?B?RVREbmEzTEZjUzVUVXV4R0FJOVNHTU4xUDM5UDYzWmRRTFdxeTFUUDA5SlRH?=
 =?utf-8?B?Wk1RbHl2QlpQRXFldDMyR25YRzVWRWZGSWFvWUJ4dCtEL2hPL0hya1o2MCti?=
 =?utf-8?B?ci9IcDgrZkRYangyY0VTT2k3ZXVXN0dhZEowNjdxdG4vSFh1akQvTDJoRlFv?=
 =?utf-8?B?amlHVjhTRXladXA1MS9TbllzUmNCdlBwKzNqbEo1cC9OVUl4QXFGV3hJK3k4?=
 =?utf-8?B?djNOM2FuZWdBZHhlS3FBUnVjN1NXSTJzQlV3VHQ1OXdvN2RkdjJzY0NZcFY2?=
 =?utf-8?B?b09WM0hwdnB3V1M3OHBRcHgzQXBjT2Q1ZHI4YWdwSnBxczM1a1ZWTkVlMHdu?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e431aa30-d085-4cc7-6c1a-08dd9dc0f848
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 08:23:48.2894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aIPUs/Ycp6e6PWNPbmSyHhLen8Stm1Lp3np2YRmrxkhLl2k/5Zqay8vK2reveK6JsMuOYQpLYLotCWSoyGceFDMxS1Np8/+KaMsoZjjIrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

On Fri, May 23, 2025 at 10:01:24AM +0200, Zbigniew Kempczyński wrote:
> Linear copy in intel_blt supports passing large buffers (which
> requires to be spread over couple mem-copies). For matrix this is
> a little bit more complicated so I left simple case in which

Patch LGTM but a nit: impersonal style is preferred over "I did X". 

With that:

    Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> pitch/width/height must be within mem-copy command limits -
> 18-bit width * 18-bit height gives 64GiB object so testing
> copying bigger buffer would be an overkill.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_blt.c | 69 +++++++++++++++++++++++++++++++++----------------
>  1 file changed, 47 insertions(+), 22 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 265f5ed50f..77a03aff4e 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1893,17 +1893,18 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  {
>  	struct xe_mem_copy_data data = {};
>  	uint64_t dst_offset, src_offset, shift;
> -	uint32_t height, width_max, remain;
> +	uint32_t width, height, width_max, height_max, remain;
>  	uint32_t bbe = MI_BATCH_BUFFER_END;
>  	uint32_t *bb;
>  
>  	if (mem->mode == MODE_BYTE) {
>  		data.dw01.byte_copy.width = -1;
> -		width_max = data.dw01.byte_copy.width + 1;
> +		height_max = width_max = data.dw01.byte_copy.width + 1;
>  		shift = width_max;
>  	} else {
>  		data.dw01.page_copy.width = -1;
>  		width_max = data.dw01.page_copy.width + 1;
> +		height_max = 1;
>  		shift = width_max << 8;
>  	}
>  
> @@ -1914,6 +1915,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  
>  	bb = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
>  
> +	width = mem->src.width;
>  	height = mem->dst.height;
>  
>  	data.dw00.client = 0x2;
> @@ -1930,34 +1932,57 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  	data.dw09.src_mocs = mem->src.mocs_index;
>  	data.dw09.dst_mocs = mem->dst.mocs_index;
>  
> -	remain = mem->src.width;
> +	/* For matrix we don't iterate */
> +	if (mem->copy_type == TYPE_MATRIX) {
> +		if (width > width_max) {
> +			width = width_max;
> +			igt_warn("src width is bigger than max width [%u > %u => %u], truncating it\n",
> +				 mem->src.width, width_max, width);
> +		}
>  
> -	/* Truncate pitches to match operation bits */
> -	if (mem->src.pitch > width_max)
> -		data.dw03.src_pitch = width_max - 1;
> -	else
> -		data.dw03.src_pitch = mem->src.pitch;
> +		if (height > height_max) {
> +			height = height_max;
> +			igt_warn("src height is bigger than max height [%u > %u => %u], truncating it\n",
> +				 mem->src.height, height_max, height);
> +		}
>  
> -	if (mem->dst.pitch > width_max)
> -		data.dw04.dst_pitch = width_max - 1;
> -	else
> -		data.dw04.dst_pitch = mem->dst.pitch;
> -
> -	while (remain) {
> -		data.dw01.val = min_t(uint32_t, width_max, remain) - 1;
> +		data.dw01.byte_copy.width = width - 1;
> +		data.dw03.src_pitch = mem->src.pitch - 1;
> +		data.dw04.dst_pitch = mem->dst.pitch - 1;
>  
>  		igt_assert(bb_pos + sizeof(data) < mem->bb.size);
>  		memcpy(bb + bb_pos, &data, sizeof(data));
>  		bb_pos += sizeof(data);
> +	} else {
> +		remain = mem->src.width;
>  
> -		remain -= remain > width_max ? width_max : remain;
> -		src_offset += shift;
> -		dst_offset += shift;
> +		/* Truncate pitches to match operation bits */
> +		if (mem->src.pitch > width_max)
> +			data.dw03.src_pitch = width_max - 1;
> +		else
> +			data.dw03.src_pitch = mem->src.pitch;
>  
> -		data.dw05.src_address_lo = src_offset;
> -		data.dw06.src_address_hi = src_offset >> 32;
> -		data.dw07.dst_address_lo = dst_offset;
> -		data.dw08.dst_address_hi = dst_offset >> 32;
> +		if (mem->dst.pitch > width_max)
> +			data.dw04.dst_pitch = width_max - 1;
> +		else
> +			data.dw04.dst_pitch = mem->dst.pitch;
> +
> +		while (remain) {
> +			data.dw01.val = min_t(uint32_t, width_max, remain) - 1;
> +
> +			igt_assert(bb_pos + sizeof(data) < mem->bb.size);
> +			memcpy(bb + bb_pos, &data, sizeof(data));
> +			bb_pos += sizeof(data);
> +
> +			remain -= remain > width_max ? width_max : remain;
> +			src_offset += shift;
> +			dst_offset += shift;
> +
> +			data.dw05.src_address_lo = src_offset;
> +			data.dw06.src_address_hi = src_offset >> 32;
> +			data.dw07.dst_address_lo = dst_offset;
> +			data.dw08.dst_address_hi = dst_offset >> 32;
> +		}
>  	}
>  
>  	if (emit_bbe) {
> -- 
> 2.43.0
> 
