Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51C2D591D4
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 07:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BC610E353;
	Tue, 19 Nov 2024 07:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQhPACf4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2B410E5DE
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 07:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731999728; x=1763535728;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yd+4yKgwh69EN2UA8jHuEtHFHf85MJ/6vOvrX/PRlKk=;
 b=NQhPACf43kUuKXQG7VM46E95w/d7WUrSWI5twvcResJ6704rwR6O+ZXO
 XAXeTcR6+RpjbodBbgd0Kx9kewPrxVIquB0iXsXbnUMqYkcITQ3+UpJ8m
 9hjYTdp/vEfKL/TepItPJpUgXVjLResbOkT+FiDiTffGrINxVkO8G5WdF
 VKDPsJX42rfWTF3Rpd7rwo9GKOtr/zMk+r5y5radBSYQoKouV4ODtRdrZ
 XsBdZj+Megx2bj/TzmJKFCy+fB2LF+MeqI4D7lCynkTMz6CSMjSxRlV1I
 zqrdKaSLWj3NAxCZ5c6aMPg3saE3slXhUdZn77YPRgG4wSyDTNPhHTcr4 g==;
X-CSE-ConnectionGUID: tdW323FDQ7WVH78IcbKM0g==
X-CSE-MsgGUID: 3blAeqz1Q/CUylu0d2kDEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42612288"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="42612288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 23:02:07 -0800
X-CSE-ConnectionGUID: 8AMYF4fOSS6i53qU1tSCPA==
X-CSE-MsgGUID: jQvkcVB0TGmLeEuyaTMSSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="93922592"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 23:02:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 23:02:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 23:02:06 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 23:02:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abqpcDWNJdgdVp2E+JHMVz6+cIGmOOy6uCFAxOG2Q45lRGCp7GnJMnN9WSi0jqAwaO7TLZu//o6KOcfTwmZIouyGrG7NxYW0it5u/2h69VkkP8Ix/lZHMtzn0R8nndWWKApVdtsy5ZHW5mD/62XZBbqvZzxSFLlIDT1HwsLi9nSLL64rfzdwG9ril7TVgJr7hw7URdyxdBE0Xwfd9Mtg49Lk9aRaWj2tjblAqvHRRC5TDKIFBuXmqA+d2jYeCsZzTIW5exvYiZC861bQPbcQ1J1QwHYAS+hf36OJZbxOu41aRH46cAmM8Mwq0+2uIYKtj40AUiv7Dni1rtReqAQyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONS/PeJlwCIzOPXJ5ayKSdjwkSST4R1r102ENrfYCcs=;
 b=hjX6qkdAJa2g6bR/Rnc+puUFIXDHNpugjUDk3IYVUJT4J4pR1pOkitRYb+/RLLwambEvyJvz3QQruNxpwf3D9JGRYgTu3jNG7HQZyKK8xswqO34NBSEpe4i1mXEQayxyrkjKWN1JNDqRMZgsa00ej4CqgAcihp0NpGFSLM45pnSSV71tWhNTS8iriDeTF60bmYAmS8mB4Ly4QsNkfrl6deWFwWbSIcvRMy1OWsVjG1rWh1gZJ7+OeybNAJU2nl4UVa0dpAuWxA5peeE7x5LJxsgBh+VvLCSyQgIuZlLcAbLEIGWl7ByHaT+4ZZ8iqgC1qLEGqnN6X8v1rKS0uw4lQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 07:01:58 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 07:01:57 +0000
Message-ID: <8096edaa-6b95-4436-9938-cf0e92821320@intel.com>
Date: Tue, 19 Nov 2024 12:31:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_oa: Replace hardcoded OA buffer
 size assumptions
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20241118063223.3974722-1-sai.teja.pottumuttu@intel.com>
 <20241118063223.3974722-3-sai.teja.pottumuttu@intel.com>
 <85v7wkwar3.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <85v7wkwar3.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::11) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|CY8PR11MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 831198cb-b3fd-4017-2b5a-08dd08680ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEJOeWM3QzhkaXBGb1ZTbEhWTnNMM1F4WlVqeUIvK2ltMHJ3aXZ1R28xMUV4?=
 =?utf-8?B?UkRHVjRFRXpNTnI4azdyYnQ0VGJ6TWRJOE1zWHdXU1R1Z2RNYWlSVkxsWWsy?=
 =?utf-8?B?c3l0by91b0g0TlNGYVNqSUZUV0pvK2RGWkVZZkVObEV3NWdablBickZKck95?=
 =?utf-8?B?dmxwQkJ2b3BaZm5GbU05TkxUamViU2R3OW9RSXlVYTBCVzlTbVE5T1RzaGly?=
 =?utf-8?B?eUxCUmlwVWhqSzdQWFdqYXdQbWhaRUJCTnBWTmhYaDFudXNreVJJbm14SXdw?=
 =?utf-8?B?NGxRQnNsemJ3WklPVzVXUXcrQjgwK2l0b3pRS0RUaUYyQU1VMU9ZRlJZVTBj?=
 =?utf-8?B?YlVJWTJ4ekJVWlhwbmZWdUYwVndWM0JvSTYvd04wY1hTVHI1NzdFQ2ZubHp5?=
 =?utf-8?B?MEkyTGt0RGRJUjNQbGZ4VkZDa3pKWU81MW9VSjFRM20xa2JFaTAzNEREbEZ2?=
 =?utf-8?B?bHYzanROTklyckNVQzdmNUROd1k0NWZWaWZTdUdiSWpXTHhWNmlHVzRQcVV0?=
 =?utf-8?B?V3ROYXBZekdRa250bHdVMGxmVXZRN0tsVWZURGFtZGlkQXd0TER1Qyt0dG5N?=
 =?utf-8?B?aEhwdmpzWEhwNjBSNGVMeEllSXlmYTRWdXRncUVWMmdNa3Q0K0RIZVdjN3Bn?=
 =?utf-8?B?WXhzR0ZYNkxpRTk2ODNtektKdkVOdnN2UnV1NTJYQmFvd0xuMTNpOXRrTUJW?=
 =?utf-8?B?ZFhsanFEUDlxbXdOajB4MlZ6RjNVVXF5a3hleGRlQzZBaTl5bnhmWERuMW5I?=
 =?utf-8?B?WjlXbjZzWmtob3ZTd2dGUEJRcmJTTTRoRUJ2cVpzd2dFOW0zUkR3bGhwZnIy?=
 =?utf-8?B?K2FRb2JZU2VVbnZPWkRhdXdNUDdQeVE5R2VaYWNTc1owdkJhaVJzM3lyWWFn?=
 =?utf-8?B?a1ltWmxoRkx2Qkc0OFM3c0dpTEMyTFVaejJaNHRrNUlESVNzNmtxMmtXM2t2?=
 =?utf-8?B?d0ozdncvVGNSZGVkcWUrblNCSm1xM2dyMjFjdFd1eHlVTWFsYTZkQUtGTmR2?=
 =?utf-8?B?VFNBci84NWhOZDBmL3NmRWR2bHZLMWxraGpHcFVXTU9xeTZXODhpaFcveExz?=
 =?utf-8?B?T3hQRGh0NTM3aC96R2UxcENXVUxIWE8vTWhOTlBid1RHbnduYlo0cmpPM09R?=
 =?utf-8?B?YmMvMnVMMnlySmp3M3lBdHlpWHdXVFhlSmZLdW04c1JvSjhYd2lOVDZMaHRv?=
 =?utf-8?B?RDhPRUFKc0l1Z1p5NzBvOTRJd1Ezb1dUNS9LUjZ0QURlaVp2L1NkajJFeTR0?=
 =?utf-8?B?QzRhZFRsTmZSOC9yc3lhWEgzaFMxNTVXcE1xOHJ2ZW1jNW9GT0txdWI1elFI?=
 =?utf-8?B?K2tqdlN6di9zdkNQbTM2QWM4R2h6L211K3oxR3ljMklJVWxFbzFuZFU2bWR2?=
 =?utf-8?B?L2tPL0J6bllsdU03dThRUDNIbEJCTGdFaWFZNmpjM1F0MjVlcll6UG41YVVy?=
 =?utf-8?B?U1BFdlVtWDVoM3dsS0VSV2pOR1BTV0h1UWtvdVQ2Q1RaYUd4bGlBRk1oTDZi?=
 =?utf-8?B?aWNXc2RMdldmTkt0L1p2UktNdnRGbVF5WlhkcUN5dlRVS2lpOCtvbDJQa2VI?=
 =?utf-8?B?OXdQdXlOazBXVjdyQmJ6dk9oR1hlZTl2UEw0ZjhqTG1KWFhWYW5MK1BOYVI0?=
 =?utf-8?B?alNxSm5LNE1LSFFSLytSTUcvcmFiVEVkSGg4RDNPRkRwcHNxb0xDMitNdWxO?=
 =?utf-8?B?OU1KaGRNUnViRU41NE1ydVJLMERvdk9xOTZJQlR2TGJmS05jdHFFUXVWcGNO?=
 =?utf-8?Q?lQkReHbAZIQoAsLVyxPO/8Cb8PvxV6nPPDoQSGz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVcwV1VLMXN6NDJvUzlDQXIzUnprQkZwbldiT1llUWxOWFRZTVlsMFVHZE5o?=
 =?utf-8?B?T0VrVGZJeGs2WXVHU2JSdktOQXpwSWpaMTFYYktBMENTb3NBZUxieGNpRnNz?=
 =?utf-8?B?SytaWG1kWkJobGxnUjdCSXFwTWZCdmM3d1lJK1pUQVlXZHR2TTJ4cUR3OExD?=
 =?utf-8?B?aWJUZ1N1M3ZGc1pra2lyOFNrdHZvYXdHUE1OMitVd0RYNnAvMklYeUxWSThw?=
 =?utf-8?B?V3pqUVJ2eDlxNDl5T2RnZkdrUkZPSTJ4SXZKaER4RnF6VmZzVlMyL2xndFZp?=
 =?utf-8?B?YjNhZHRBRFU4NWJpZlkvUUhta2hwSkhHRU1sSG96UjFELy93OUtHdktLYnpx?=
 =?utf-8?B?bUtITSttN1dnWjlLMTBvV3lsYWhJS0pOY3NiSGNyUHRFVTFGeEx5b0k5Q1Ey?=
 =?utf-8?B?VDhiN3QyRTV4TCtEL3lhckE4djVBSDZXM0xKZXVzb0ZYSmFqUk1rRzNWOSty?=
 =?utf-8?B?MzZlUU1tUVAvZ2QyeGNZekc0TEZwV1NmZ2RCd2FnNEVYMDF1TjNINEVXMHNX?=
 =?utf-8?B?SDhVUkowek1pWjM2dnZFRUJtSXlFenh6aTFvdHNxVG1vRm9KbWtqRS9YSmVD?=
 =?utf-8?B?Vm4yYlhuNExKU0ZpVzJsUDhPYzVNZWkrU3JidHdSWmEzS1dBRkdmdG44MnJ4?=
 =?utf-8?B?d2RXYnM4M25XcHNtanpzWFNnYzBGdVJpRHN3SjhjNGpsaTJRSGR0NmxXTXRV?=
 =?utf-8?B?SnN4SVhMTU5xbUhMYWt2ZTlSOThEUnBScVFsSXJmc2VmUS9xem0rdVNZUUVn?=
 =?utf-8?B?RTR1K1hWU0hHT0IvbXg2cEVaMzdiMXlVU2VsTVpJTlZCOUlEQysyRXQyTXl0?=
 =?utf-8?B?SmtWdTdHRC8vc1F1QTArM0E2OENXOWZsTjhTQUtvRTJ3WEwrK05LSXNzaHJD?=
 =?utf-8?B?QTB3Z012ZWNVUHBtbGd2bWxyUzkzT1hzUGp3NVJOY3BBM2tMWmFaZGtkdW05?=
 =?utf-8?B?cm9Edng0ZDljYTJqa0RhalhhMEpHYjVuR09ydGJIRDhwRWUrOGtlMmMxbjB2?=
 =?utf-8?B?UXVvejdvc3JSTGxBaHkyc1NJWCsxdXFzY08yZjlJclByOTZRTlJVeGF0L2ZK?=
 =?utf-8?B?UGtNZWNFeU9Kb1dEa0tiWG5pMXBlTjViS3dscytTR1lwY0dtemYyTTNCQVN6?=
 =?utf-8?B?MnljQ1N1UFJmQTI3Rk9oNmpWUWw1MnhoZThyK2lndGhOczFxTDlJYktWZnND?=
 =?utf-8?B?WlZ5UEtoQWM4RG84RkxSbWFXMmNUeE5KVS9JUE5CekkyY0VoYnVmOHp0YVVa?=
 =?utf-8?B?VGJ1d3U2NG1hbFZMVEZScTUrWTFYV29mN0pMUlJpN21vZ2NKbklWNlpDRkh0?=
 =?utf-8?B?Uk1MTS9Oald6V003bWtHZCtRQU0yaDJkeEhwck5zUXhHK00rNXV4dVZ3NXZr?=
 =?utf-8?B?NEMxU1UrblJCVUptNkwxWUlnQ1BTdk1KeVpMZ0Q2ZHNkVmJYUFl5NytjZUsw?=
 =?utf-8?B?Mk5icTR6SFVyRFRKM2RZb0U5OFd6OHQ3ZXRoZ2RLMDhhcFRPNnBWZ2ZkTVp0?=
 =?utf-8?B?aTZPWlJUeTJySUtubmpReXZwenVYMk5ia3cvalpwL3krWHk2dkVxNjM1Y0hx?=
 =?utf-8?B?bXI5TW92cUdhb1p0ekdpRFFhOWpWMnAyZnQzNGZqQUNXL1BpbUhKcTAyY2w2?=
 =?utf-8?B?M0grb0NZb3Q4aFY5MDl5MWhYdThYYXBXWGR0V3FpZVlsL2dqbUxibHNYWE1h?=
 =?utf-8?B?ZzhrcTl0dklBci9TTnR6dGd2ajhhdWtIZktXa3hMd29lTnVtemZOTC9tQmM3?=
 =?utf-8?B?YlpXNVRuL3JDQXlCRm80bkN1OEEvTDNocncyVldGVGxNa2h4YXBxZ2RVU2F4?=
 =?utf-8?B?S3VoYU9MUnMwUmQ5UXl2WHFVVkR3VENpUmtRZENncUFBc3ZsZWhCblJjc0xF?=
 =?utf-8?B?T2poUjRmdTRyNldOZ3A1WTdCZHk1WUVZZmtEY3Yrc0NsLzZsMlZwZThMYWhm?=
 =?utf-8?B?U0llb2tHMy8zSExmTkpNSHdKRmtZVkZhdFBCUnI0MHM0MGxMZlRZYUlTVFBT?=
 =?utf-8?B?L0ZmVUNObURXV2Zob0gvNGFEVzdBcTRZazRvUit1VnlNOThHNVpGQTNiRTE1?=
 =?utf-8?B?Rkw4anM5MUJwczZlNWxGcFcwNTNyQWJyaHRyZVFhZ3BGRU5nLzdTK3d2M2pO?=
 =?utf-8?B?RUhpWGhxRW9PS3BvQ3dlVElPblo5aVFsR3FrUDlzaCtSU09YN0NIR2VWZ2cv?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 831198cb-b3fd-4017-2b5a-08dd08680ef1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 07:01:57.7949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rltkTQoFN+78GPFEhMBoE3ikuYwp2Wgq7ukQFEXJa2R4TtVMvBRGZRNzxexRCsXnE4D0WNtZSB8YqIx9hlYtLPZNS3nwL6eR6JGLrWH9k00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
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

On 19-11-2024 01:54, Dixit, Ashutosh wrote:
> On Sun, 17 Nov 2024 22:32:23 -0800, Sai Teja Pottumuttu wrote:
>>
>> A few xe_oa tests assumed that the default OA buffer size is 16MB
>> and had calculations around it. These would fail if the default
>> buffer size is changed on the kernel side.
>>
> 
> I don't think this is correct. buf_size below refers to the size of the
> user's buffer, not the size of the kernel OA buffer.
> 
> You also seem to be assuming that '65536 * report_size == oa_buffer_size'
> (65536 * 256 == 16 MB) but report size is not only 256, Xe2 default report
> size is 576 bytes and there are other report sizes too.
> 
> Maybe ok to do what this patch is doing for test_buffer_fill and
> test_enable_disable, but we need to be careful about test_non_zero_reason
> since that test is very useful for testing OA buffer wrap-arounds (and some
> corner cases there).
> 

So, my assumption was that in i915 we were trying to do

= (oa_buffer_size / report_size) * (report_size + header_size)

which we hardcoded like

= 65536 * (report_size + header_size)

And this was done to get a buffer full of reports and allocate user 
buffer a little bigger than kernel buffer as we had headers there.

I think this translated into just 65536 * report_size in xe as we don't 
have headers separately here.

Am I correct with this assumption?

1. If yes, replacing it with oa_buffer_size is fine for atleast 
test_buffer_fill and test_enable_disable right? As we were essentially 
trying to allocate a user buffer which can take all the reports which 
would fit in a kernel oa buffer. Am I missing something?

If that's correct, as we are already at it, maybe we can keep the change 
for these two tests?

2. For test_non_zero_reason I think I get your point that with the 
current sizing greater than 3 * oa_buffer_size, probably we could catch 
more issues. So, we can keep it as it is probably.

Thanks
- Sai Teja

> I'd say let's drop this patch for now and revisit later if needed.
> 
>> Replace such assumptions with the OA buffer size we get from
>> DRM_XE_OBSERVATION_IOCTL_INFO ioctl
>>
>> Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
>> ---
>>   tests/intel/xe_oa.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 4e4d0fabc..3b65212ae 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -2389,7 +2389,7 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
>> 		.properties_ptr = to_user_pointer(properties),
>> 	};
>> 	size_t report_size = get_oa_format(fmt).size;
>> -	int buf_size = 65536 * report_size;
>> +	int buf_size = oa_buffer_size;
>> 	uint8_t *buf = malloc(buf_size);
>> 	int len;
>> 	size_t oa_buf_size = oa_buffer_size;
>> @@ -2533,7 +2533,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe)
>> 		.num_properties = ARRAY_SIZE(properties) / 2,
>> 		.properties_ptr = to_user_pointer(properties),
>> 	};
>> -	uint32_t buf_size = 3 * 65536 * report_size;
>> +	uint32_t buf_size = 3 * oa_buffer_size;
>> 	uint8_t *buf = malloc(buf_size);
>> 	uint32_t total_len = 0;
>> 	const uint32_t *last_report;
>> @@ -2615,7 +2615,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
>> 		.properties_ptr = to_user_pointer(properties),
>> 	};
>> 	size_t report_size = get_oa_format(fmt).size;
>> -	int buf_size = 65536 * report_size;
>> +	int buf_size = oa_buffer_size;
>> 	uint8_t *buf = malloc(buf_size);
>> 	size_t oa_buf_size = oa_buffer_size;
>> 	int n_full_oa_reports = oa_buf_size / report_size;
>> --
>> 2.34.1
>>
> 
> Thanks.
> --
> Ashutosh
