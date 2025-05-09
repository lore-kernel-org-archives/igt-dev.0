Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C753EC3ABCC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 14:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE5010EA49;
	Fri,  9 May 2025 14:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBnAzMPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC74F10E2BE
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 14:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746801965; x=1778337965;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zAmp+fesKXJE4r8Jje9JSBLv9xPu7HO3h+PqZTrUxEs=;
 b=hBnAzMPwUQrh85/J0zM7QUkls5ETvETG/8LmD0zbtisA6hZbYVTDY640
 QTLZNEYrwJjAFzozagxlH1bFWEi6pNHdqMkvPLQbEG0IZlTj5ZfU63WI9
 HGCl08EBSSXdPn3/sCRfmFv8MSp4oJfm5DsFCzyQjpyz7ZOoNavY5MLlm
 /eau897By1XVmnOjNE8+2xOsWy+GVxBNIcIAowciPVXNIaofR67HJ4va3
 cb7vItbKwNcv2BLg3Ttja2vaopaN9ANNRHeakNbwCa0G74xFO/3sY9jj3
 YWby0Xu0kjjPui6u1p498bw6z/KEY+1ipmth5qhvMnwehPKZncrt1/XFA Q==;
X-CSE-ConnectionGUID: sHO057GGTlaV98DBsRL3qw==
X-CSE-MsgGUID: 61EXXCAYQCSlruAOXoNuEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52285948"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="52285948"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 07:46:04 -0700
X-CSE-ConnectionGUID: J4oQ5giYQVCXed5OKAbebQ==
X-CSE-MsgGUID: IJMzhnTMRCmhSGfoLKIsjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="136563568"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 07:46:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 07:46:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 07:46:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 07:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GS6GpnF3Y9biInwGKxSDquEFsFc5DB5xzAuqe68t+ORYHrtAEBoQei9HXRVzlwUZe4ubZcrKsJkN5DbSYLkQeBfGNSlCSMuIYkDuN4KtshtyCHA4HwJcfBdtYig9YaoPT1uPSl8/M8XbGXOBdhwrmH7eNhcYXXm1Wb66Ujk++F+8qr0md/W5LXfA2hESOLde41RswRA8SX+VrAbpEES9MKiGj4JtiRhgHBHlIoClToL9Tqms3gVODma91CP3NnN9TuiW3eLimRd89vzn4V4O5Cix8SmXcGet+ARMvokpsnaWVvc47Uw60QE0CbipFy2N+2dS2ET9mfI0IJje2Xv1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xjjyeloz8wbwMFV8j5Mr+TQ6x4c5sLxsoDF+t+yY8k=;
 b=PDS8cNFNPiSr1BDs745booV82Nw30v9qQQineRrLPgs9QYSmtN35iXVlU6bB+p5Qx2ZE2K5q+tSfqs2wG63fqH0NGs0ptHqHXePm3c5f7HR6ddHB1V1UMDarNJ/zG73I/5QQNNbJkc/YnBtnFlIX01QJ0yWY+L/MGxM+/x9IkSBJ7VFIstdVpsx2ug/MN+iz2YNYWGQhWs+4Fukav7lqdGtU+7e0op2VBHGt/xAx13u+oH9FGyH6TyeJakYAzNiggUwEy7lQ4trXJItkXyU7nb7I2cmhnYxU2y3XmeSjykA8gT4HXAgYj9ZJ+N/+0FSjkAi077iJylGu68jSOiBXQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 14:45:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8722.024; Fri, 9 May 2025
 14:45:33 +0000
Message-ID: <f1d9df11-b55e-43f4-a1c8-c800f35aa98f@intel.com>
Date: Fri, 9 May 2025 20:15:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/5] tests/intel/xe_pmu: Add tests to validate
 engine activity on all engines
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
References: <20250508055006.734259-1-riana.tauro@intel.com>
 <20250508055006.734259-5-riana.tauro@intel.com>
 <aB1Fie-8Cxg66dAK@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aB1Fie-8Cxg66dAK@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPFDB7809488:EE_
X-MS-Office365-Filtering-Correlation-Id: 175498d7-7b71-417d-c978-08dd8f0826c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M29GMnVrbHpEV3JRT2JpSGl0bTNBZGIzUG4wcU5VY3ZwcVdIRURHMmlUNFU1?=
 =?utf-8?B?UUdSWDlnMDNaSXpvZkw0UnZZa215RUwvUC9IYU80ek90T2hQc3JMUVlxZnQz?=
 =?utf-8?B?ekxRdFhvNlowaXozNjVEb3FUc09VQVl3RmJSd0F2cDhOZXhFNTNRQUZzVU1R?=
 =?utf-8?B?ZVkyUWtqbmovNzNhQmhNVEc4aUpTUG91a09mbHdIYTJsZU1USE03MkZkNlJw?=
 =?utf-8?B?aFpXNGxLdGtuZnc2aGx0QTBwTU8vOXFoTUIzUW52TmEzb21rLzh0bGs3S0I3?=
 =?utf-8?B?Q2x2VHdwQjJ6UE5CN2dUWEJGVWE4Z3h4MnVRL3doOVg2WmdIanRHWElsY2I3?=
 =?utf-8?B?a3RyUGJJdFlGZnJEMHdXQ3VOSitRUE1OVW0wR0VlM3YzRThYMnNnNk9IQ3VZ?=
 =?utf-8?B?cW1HUlZrcDlGSFI3T2hoQ3FJTzlBUkFyUWRCR21FTjluY3p2NEJQWG82T09H?=
 =?utf-8?B?R25BenAxcVczWTNHZ2gvcXZ5cVRacDk3S2ZTeWwwZURLN3B0Z0NJLzBGTnB2?=
 =?utf-8?B?MVV5SVdhMVZPL2dIcjJxMHM4WTBwKzBWMnc4UlFrZUFpMjB0d1dVNVVWN2xu?=
 =?utf-8?B?bmNaMmdPTzA2KzFrRHdldExVSiszVkJTVmN1cnJwZy84VVA2Qk5ldkwvNE9H?=
 =?utf-8?B?aG13VWt3N0JmNEVDUjJMZmM0UEt1NkNQdW1CYlNvS3dYUHZRd1h4dEVJbE5k?=
 =?utf-8?B?MGFCZzNxUDFqOVRPZG85N2ZrWjB5dzZCVEdWYjdKeWZsMndNcjVTckE4V1hy?=
 =?utf-8?B?aXVDMDhUSlZyU2xmS00zYVIwanozd3UrUm9RREZFaWZOM0xmbzk3ODJENUNt?=
 =?utf-8?B?SEJyLzRabS9SWm0xZ09jektueDZ6V04yWHVXSWMwVVpvK25LZmdPY0ltZ1hG?=
 =?utf-8?B?a1ZGSXNFS2RzUVp4Z2JQM1IxenJwOVl0bWMrOUx2MVZBT05QOFJSUUkyd2Nh?=
 =?utf-8?B?bEh4SmhpTmpRMGhHTUQ0MkliaktVY3dnRnZ5WXR6UG5xNzNJN1czcVhXNjEr?=
 =?utf-8?B?eDRSY2crK2NaRm41dU1mTUlWbGUwdHZ2TFJlbDFST0NZcmF0QzNFMVJ0VVFB?=
 =?utf-8?B?U3NncjlOdk1oSkRKY01jRGJ1TWI1c3Yvd1hnYnFtSjN0T2QveG1jc21JcXRZ?=
 =?utf-8?B?b3o3ZXozRGpxSWh3Tk9zNjlBNHdqVSsxTUU3SFp5TjZUaG9MaU1sMG5ybExC?=
 =?utf-8?B?REpQcWNEMGpoMlF6RHdteUxQeEhyZmNuZUtVMFdvdVcyS0NuRFQ5bU12akpr?=
 =?utf-8?B?dDVienNLTWhBbHcwMWt6L0RmbitCdFlUcVZHU2xUaHV4L0tmdWJ3SHUyVm90?=
 =?utf-8?B?T2FGZzBGMThZaWRLdVUvV0FBemhTOEVUaXNZUWJOOFlaTnZKWG54SU9Gd21k?=
 =?utf-8?B?dWdFcmZpaTZNdVRkaGxTSkpoWkpydVE5OWdWLzc0SUt2OFgxTjdNb3p2Q0di?=
 =?utf-8?B?RllMWE9IVHpUU3pRQXlrN0wvTmdieEk4SHoxQWM1MFlXRENVY2swSFU0ZkhU?=
 =?utf-8?B?SWN4ajhWUzlyS1h1NDJyNnZNSEZQbUZJZW81VURyN0ZBUDdUS0pPcWcyRHRF?=
 =?utf-8?B?Z2NONnRJWG1tUU93MXBGcTJQZ0N1ZUt2Zzlybkt1NHpjZFVQY1hQdUx1dGdD?=
 =?utf-8?B?cDUvaGliRXl5Tm16RWtjdjZuODEwZEJWRkJOeTNBNmVVSnNKOGtzSndEaGZ6?=
 =?utf-8?B?WHk1bXkxamVTNDBMQVBDQmZiNDVucW4wNDZWbWFPQ1YzMTBlb2FpS29kcGNZ?=
 =?utf-8?B?NWpmSzBnMXRkOUpKMVZzaWx6SzMxQjRqbWNzbHlXRDE1RkkxdklpTVg1KytH?=
 =?utf-8?B?dDhBS2lXTURNS0xpeUx1N3AyakdjQ0hMdVdpY0E2WVZGQnpVYVA4S3REdjlR?=
 =?utf-8?B?RUgxc2o1cmN1VWtPRTNsYlF5cS9JSEVyc255Y2NwcFZ6c1ZDb2h6NWFxRlA2?=
 =?utf-8?Q?zmAc8Utk0JM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVF2VTVSMkpoTWJVbnBoRVE5SmtlSGhkdmtnaWFmUGtUNnVvRWNPNVh4bTJq?=
 =?utf-8?B?a1h4OE1zN2ZTTzlhbE85RURhcUE3WUJFNTlOY0cxNkM0TFJzK2lvVjBEdDUw?=
 =?utf-8?B?VFRkUFNxOTFPUXdkS3pjRE5ZK2RBV1NSUGhleDAzUXhuRVdraDJ3ZUZDZzR4?=
 =?utf-8?B?amlIclVVa2dPZ0JSYlFFQ3FJRWZhR2hJbll4TUV4VmdYUkNDQ1h4OG9kRUFX?=
 =?utf-8?B?ZmxvTkkvZm15Mzg2Qk9NL2p2d3NTWFNNbzI4bGR2bGpYM1pBelJxblNKSWxB?=
 =?utf-8?B?cjlncUI0M2c0OHVCYWtNaW52cnRZQjAxWDJhNzl0aTJTajE2Z1VZVWc3WVZN?=
 =?utf-8?B?NGxoK1lPdzUyajNXdURCWG9QM2hydnd4SkVDUGovaEZidXNweWM5NFU5VUZ0?=
 =?utf-8?B?UE9UemgrUi9FRFl4eFFKd3M4UUd0K0VNMEt2SWVERUU0cXMzUlFCNjJlSUhS?=
 =?utf-8?B?aGpFK083TjhOTGNhUzhndmRta1ZwQmk4MUlMcFA3eEI1aG5NeGtXZDlzN0ls?=
 =?utf-8?B?a1Mwd0dmRDVRTVRCNU41bElLR0V6akc0Q3ZSZSsrMDZnSUR3UmRUTkgvSWlM?=
 =?utf-8?B?OUVveGNDWmJncTUwRGVTMmVRYnBlMkZFUzU4R2RCRTZGbUdXU3V2QUd5R0Vw?=
 =?utf-8?B?UzgrbVZUYlVQd1hFSmp1RkZ0K0ZjaWVPb2tpRTczeTZ6RlZFVCtZeG5sTnZu?=
 =?utf-8?B?aWpGSkIzM0tKZng4NjVsOXBxd0hPaitxK2pJcHUxZXNVRWc5eVlSeXlNcGd6?=
 =?utf-8?B?RGZRaGJNK2w2eXArTjVzNHFQUzJQbU5qQ1RPL1ZxYUxvK3ZWWXJEL1JoMnl6?=
 =?utf-8?B?VmRWaXZmbFMvTkZEcW5jS1V6VnRGc2FTU0VpcHgwQmM0UXFIeTV4RExuVkxU?=
 =?utf-8?B?YU9BbjIyVmdIdHVqWVBRYWtvbjhCUHJacHRrZXFvL3QvdEdxak1JU2R1TlR0?=
 =?utf-8?B?OXFCZTltU1dhVTA5bzNiTFNVZC9mV0oyZFFkNXorWGpPWUVwbXdyZzJWczRj?=
 =?utf-8?B?dDczTS9mYU5CNFl6VkErTXFYQStSUDYyMGlDMTdkYXhESnU1RHpzMUZWWTdM?=
 =?utf-8?B?d1NiUkhJaWlic2pMRGszYzFSaXlpWVRrbHJyY3o5VGdnZis2M3BkcUVxRDNL?=
 =?utf-8?B?NmNEOEFNYzMwcDdnbXBLMHpQakhuYTZBRWE3bGJkRDV0b21OSmpOL0VlNCs1?=
 =?utf-8?B?Z01UWGg3alU2N1VNKzh3eXZVT21ZMlZraUd5eFB6RjIzdk9qbTRKOExVQldB?=
 =?utf-8?B?V3ZObDJnRkhNOTgvaXlNL3FWcGYyMHdXQ3FEY0dXRDZua2huZitnS29BTXhT?=
 =?utf-8?B?ek9ycmFPaHp5eGRWUTJobEgram41cmZhbDZyQUh4ek9FT09TeDl0aUVqYXdy?=
 =?utf-8?B?M0o0QkNBMXdsRkphYThnaHEreFF1Mkt4eDE1SGJMZFlpUWUwOTcxYm84a1JU?=
 =?utf-8?B?RWtPOXUrTmZ2eVRiVEw0b1J1NWE5YmJlazRseXIwa2xPNWFyVVFGMGo2eDMy?=
 =?utf-8?B?dVk2RlN4VlNRU1RaNjlxdjVsSk1LaVFKSVNJNWU4RDhTdW8xdEhPc093bmIr?=
 =?utf-8?B?M2trTnh2VnN1VjdwL1FaOCtraC9FNGd2UnY5Z2lubjBkZkhpUEdodEUva1Bh?=
 =?utf-8?B?U0NFZkZTQnRuaUt3Mmd4cEtmb3VDZFArRW9hcVJlclFKM2xST0hGakk0dHRu?=
 =?utf-8?B?ekExbVUxeEQxbFg5U3RJbkxaRXdZeFRLbVBvTTBxTUNiUXJUUlBEWWdNaFRI?=
 =?utf-8?B?bm9PVnpJUHRwRXY0c2ZYZ2ZzQXNLT25BVkVySk93T0xkUnMvY2U2VXFyMWJa?=
 =?utf-8?B?cm93aFdYOHNUUEdXN2szSnhPbDR0RExEMmw4bjM0VVhKOCtQNFVMcit5djV4?=
 =?utf-8?B?R21WenVyNHp5NVUyM0dMM3VDQzZrcEI5NDFXODB4L0ZwdjJvRFBjemJmUHJJ?=
 =?utf-8?B?ZlA0L04rREh3ZkkzL1RlQXgrTUg0V1RMb3lUNE9pZ05ESVZKQTlRUXEzMmtC?=
 =?utf-8?B?VzZwZ1VHelJBcG4zOFRFTDdSeXQyY1BvWWVIRHNlK1k5WHRIZURtbEdFVnZQ?=
 =?utf-8?B?elNjNzNLU3JtTXhaSCsrSE9WNlNuV0ErYXJsN1Q1T3p3Tm9MT00vTDFqam84?=
 =?utf-8?Q?8cZTqWDXP8aQHWRWLFgzTbGa2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 175498d7-7b71-417d-c978-08dd8f0826c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 14:45:33.4039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8p3W0y2BrbcLVOeAqfUlM/5b5ntBaEv9PdcPrYwoCyOACucN+GF2Q2xGO5EJflMjNOzrrZDRW2rmwS9/6l4ixA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
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



On 5/9/2025 5:30 AM, Umesh Nerlige Ramappa wrote:
> On Thu, May 08, 2025 at 11:20:05AM +0530, Riana Tauro wrote:
>> Add tests to validate engine activity by running workload on
>> all engines simultaneously.
>>
>> Also add trailing idle test.
>>
>> v2: use allocator
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> tests/intel/xe_pmu.c | 67 ++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 67 insertions(+)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index d78b8bea5..2df460b07 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -32,6 +32,14 @@
>>  * Description: Test to validate engine activity by running workload 
>> and trailing idle on one engine
>>  *        and check if all other engines are idle
>>  *
>> + * SUBTEST: engine-activity-all-load
>> + * Description: Test to validate engine activity by running workload 
>> on all engines
>> + *        simultaneously
>> + *
>> + * SUBTEST: engine-activity-all-load-idle
>> + * Description: Test to validate engine activity by running workload 
>> on all engines
>> + *        simultaneously and trailing idle
>> + *
>>  * SUBTEST: all-fn-engine-activity-load
>>  * Description: Test to validate engine activity by running load on 
>> all functions simultaneously
>>  *
>> @@ -319,6 +327,57 @@ static void engine_activity_load_single(int fd, 
>> int num_engines,
>>     log_all_engines(num_engines, busy_idx, TEST_IDLE, before, after);
>> }
>>
>> +static void engine_activity_load_all(int fd, int num_engines, 
>> unsigned int flags)
>> +{
>> +    uint64_t ahnd, config, before[2 * num_engines], after[2 * 
>> num_engines];
>> +    struct drm_xe_engine_class_instance *eci;
>> +    struct xe_cork *cork[num_engines];
>> +    int idx = 0, engine_idx = 0;
>> +    int pmu_fd[2 * num_engines];
>> +    uint32_t vm;
>> +
>> +    pmu_fd[0] = -1;
>> +    vm = xe_vm_create(fd, 0, 0);
>> +    ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>> +
>> +    xe_for_each_engine(fd, eci) {
>> +        engine_idx = idx >> 1;
>> +
>> +        config = get_event_config(eci->gt_id, eci, "engine-active- 
>> ticks");
>> +        pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>> +
>> +        config = get_event_config(eci->gt_id, eci, "engine-total- 
>> ticks");
>> +        pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>> +
>> +        if (flags & TEST_LOAD) {
>> +            cork[engine_idx] = xe_cork_create_opts(fd, eci, vm, 1, 
>> 1, .ahnd = ahnd);
>> +            xe_cork_sync_start(fd, cork[engine_idx]);
>> +        }
>> +    }
>> +
>> +    pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
>> +    usleep(SLEEP_DURATION * USEC_PER_SEC);
>> +    if (flags & TEST_TRAILING_IDLE) {
>> +        for (idx = 0; idx < num_engines; idx++)
>> +            xe_cork_sync_end(fd, cork[idx]);
>> +    }
>> +    pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
>> +
>> +    for (idx = 0; idx < num_engines * 2; idx += 2) {
>> +        engine_idx = idx >> 1;
>> +        if (flags & TEST_LOAD)
>> +            check_and_end_cork(fd, cork[engine_idx]);
>> +        xe_cork_destroy(fd, cork[engine_idx]);
>> +        close(pmu_fd[idx]);
>> +        close(pmu_fd[idx + 1]);
>> +    }
>> +
>> +    xe_vm_destroy(fd, vm);
>> +    put_ahnd(ahnd);
>> +
>> +    log_all_engines(num_engines, -1, TEST_LOAD, before, after);
> 
> okay, I see a new variant here ^. Looks like you are using -1 to 
> indicate that all are either idle or loaded. It should still work the 
> same way as here if you split the helpers.
> 
> Ideally, if you want to do this, you could use one helper and just pass 
> an array - check[num_engines]. Each entry in the array would just be 
> either TEST_IDLE/TEST_LOAD.
> 
> Any approach is okay with me.
> 

This approach seems better. It'll be one function.
Will try this

Thanks
Riana

> Test itself LGTM,
> 
> Thanks,
> Umesh
> 
>> +}
>> +
>> static void engine_activity_all_fn(int fd, struct 
>> drm_xe_engine_class_instance *eci, int num_fns)
>> {
>>     uint64_t config, engine_active_ticks, engine_total_ticks;
>> @@ -683,6 +742,14 @@ igt_main
>>     test_each_engine("engine-activity-single-load-idle", fd, eci)
>>         engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | 
>> TEST_TRAILING_IDLE);
>>
>> +    igt_describe("Validate engine activity by loading all engines 
>> simultaenously");
>> +    igt_subtest("engine-activity-all-load")
>> +        engine_activity_load_all(fd, num_engines, TEST_LOAD);
>> +
>> +    igt_describe("Validate engine activity by loading all engines 
>> simultaenously and trailing idle");
>> +    igt_subtest("engine-activity-all-load-idle")
>> +        engine_activity_load_all(fd, num_engines, TEST_LOAD | 
>> TEST_TRAILING_IDLE);
>> +
>>     igt_subtest_group {
>>         unsigned int num_fns;
>>
>> -- 
>> 2.47.1
>>
