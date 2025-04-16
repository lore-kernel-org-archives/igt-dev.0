Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A71C369C4
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 16:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4848F10E070;
	Wed, 16 Apr 2025 16:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZpMJUkN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C9A10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 16:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744820413; x=1776356413;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bPuCGdfQWcHYsV9wFUE7e08JwWlTEUiIykp/TvPEluA=;
 b=IZpMJUkNP7vOeP2dludBcyhzloAc6pAC2geDt7u6jkHGhlIr7p5gWh23
 6Dhyj3PdN+TGOYVPBwFkV5D0KjrmMOkBgPHK+VPjzKC1u3leUp7KGWYka
 ZYOfbbTdg63BRl48rWVk0POiWhsB5tjzqUwBVPyAgGlPCl//pk0/wE42k
 /v834CWf/STbIBkwPhmG9A/D5ZUXa1DIK5+nsizVs03QCsCr1eHQSVl8V
 8s+gkSyVCA2kj+UueT0bahnz1B0brX8eSqbJYdT3o2/G89JjJxroApFL7
 uFn7ZGQ4HfUXGNBBQJbx031Phk4y7lbx2F9ZYmgmadjBDRO7+dtV0Pn9x Q==;
X-CSE-ConnectionGUID: maZLhZ7XT+GTLUB11L0HJw==
X-CSE-MsgGUID: 6VquefmfSouBqOyz7PMjHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46544485"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46544485"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 09:20:13 -0700
X-CSE-ConnectionGUID: LLvQSBpSSYmrhvY6YqA2yA==
X-CSE-MsgGUID: eaazwLmJT5KTzbp7HNuNtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="153719895"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 09:20:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 09:20:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 09:20:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 09:20:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8/UT31T2kReL19p/vZIqu1LYiyNLHq9YQRfgMY8m89CcSx3eWe9nafzABOz0l9msr06Lwj/5R2ljJqXycDOr5QBw+al2UC6ff4REa3+oOLmZTTNKkTbjG7JRgI281fuz/rgCtcIWkTenygNFGgdtiBqX/LTFntjH7kHstKNR39rT/0Ae5OEf+On0i8hSZ5tzwWnvX6omulwfRlAIIY1uu4mw0eYrANfhLIfwlCmnI+afZUMJHsdilqc/VeN2VoBTkQH43Pm3HUKMa9p/COrnIpM3I4EvfYRfVSa2mMGgyhiWXvLofgObvUpWeMgiRTS8/tlcYFvrNiOQwAjZa5Tbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoB27l01WVtwn5l3Sru5fK1zEQ5HIw470oHdiO+c5jw=;
 b=d1f0SLP0do8RFECxYevyzRd6m0eVnS9/CKSqeNSF4FCoy7W6E64fsoLmIjQggSIbse2QQ3mtUVO8PvnvMXDOrSl/RIcITpHPN2/W/KTxgsXdRE+bNbXGAdQgZkGroTDFwv5kfqDH2ZXvPoKWLHnVAyyylOcb8qUySIpwkdkBnWo7A7mNLif3skpQOsogpkTCFEYLlgwlWex2ytSId6rcbh+e3hje51LUPEGXcJkTAnK1gq+Q4ZFdNmFTmJhgmOooW0/WAEF/Skd7JLk+M81HqlzOMbuvcv+SnDOgzKZ34P6sFtDzlPgyJjXoWwBG2pZWkOSRyRLE++vrk+3SjAORdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 16 Apr
 2025 16:20:09 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 16:20:08 +0000
Date: Wed, 16 Apr 2025 09:20:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/6] tests/intel/xe_oa: Sanity check PEC report
 data for TestOa metric set
Message-ID: <Z__Yt3n23Lgd7Mtz@unerlige-desk.amr.corp.intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
 <20250408181210.1052760-4-ashutosh.dixit@intel.com>
 <Z_2XPsn5Up9KGb6T@unerlige-desk.amr.corp.intel.com>
 <87ecxtgy61.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87ecxtgy61.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 635640ac-4713-4f10-7500-08dd7d028e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFRNWm1CVXVTNjJyYjFIRHV3M01lWXZnMWNiVDhFN2FhSHZjaysySitocHNx?=
 =?utf-8?B?TVdncWNMV1ZOZnJRUnZ1dmhUTFVkQVJSdUV4NUhxUy85MXJqUnVjbWVVOTNp?=
 =?utf-8?B?a2k3NWVDR0dyZmRDVmtjWE5oNE5kSUtjTkZzRko3ZUpyQ29VMllNdENWQ1h1?=
 =?utf-8?B?bDl6YmwvemVXODFjWlRVUFRXdE5XT3loeVp5OUZQUjcrRksxYUx4clY4cDVi?=
 =?utf-8?B?ODd5aTNOZWE4b1dSQnZzRmZjeHgvZ3hOQlBDWFNBcEFaanR3VHNVZEx4L1Br?=
 =?utf-8?B?VmNYZTA2U0tSNS9keG0rRmJ5dzRNdVhHUVlRbVp2aWg1eXRoTElIb1VXN3lw?=
 =?utf-8?B?SnpvYWxCUmRCclVVb0Vwc1d3OFBYd09KdnhGVkxhSVplTVczMXVCVlp2Mjhk?=
 =?utf-8?B?R3hSbDUyR05ib0U2T1NDTDF2R3pFek5tRnFDemU4SmhkeDBtTEJuNHpUWnAr?=
 =?utf-8?B?eVNBSVl3b1RUbXhSWHd4U0JZZ0hqQkdmbURNQmtXWldyeUtzdHJTZERORmJJ?=
 =?utf-8?B?Y243ekxudXNFbUVpSmR0aTh0azdLcHo0OHAwUStYQ1FVd2FCTlQzSExuVWtl?=
 =?utf-8?B?VnpUYVBtdnZ0NHZrci9DWkQzQ2VZRVFuRzloV0R5azhKUDQwbllDSmttRXdv?=
 =?utf-8?B?UVI0Vk9QcHJLdHhmTy9HNUJJdnQzSktkV1BScVpNQzZIeWs0N01XQVRCbHJo?=
 =?utf-8?B?amNteFFZbnQ5NUE0a1RJZXFLUTlIMHhFay9ZMkdoM3Y5ZmJuUktSb0QzOXNo?=
 =?utf-8?B?b3NPZkVxMFFUd25TRlJYRUtkRnRaQ3BwWnE3SFRFT1UrTGUyYklGVnlPWE5T?=
 =?utf-8?B?NmpBZWZ0WTRvSVlsUjA1OUJLS3RtU3k4eS9SWjZYdllORDl4TjFCTFgvdlBn?=
 =?utf-8?B?ekJvYzZTY2dGdWtVeFpDZUFFTnBKUDVOYnpiVmdTUlBYczdrV1Q0cmVlRGdI?=
 =?utf-8?B?ZlQybmRLUURpQTk2T1d3dnoxd3pyb2JKZXBCREpod1N1WVVrcUhwK3ZIV3RJ?=
 =?utf-8?B?anh4UTgrNjdqL0hUd2cvMzk4TmdKbldrOTczTTB6dnVEY1hsc3RlajI0RUlV?=
 =?utf-8?B?Um5DMTV2YllxQ1dMUVExMzR1UFJMZGIza0dOTW9sNGFiZkZBYnFhR2JJUlM3?=
 =?utf-8?B?RnM0OHovQmV3Q3ExWVdYbHdpcDhkRWJvMmJoNnJxMlVScmlVc1RrdDE2OE9r?=
 =?utf-8?B?dFlZQXluUnBVMXkzSG53R3F0THRWL2N5eGtrVHhpWG5sREU5eHZtYzNnWmpZ?=
 =?utf-8?B?aVNQTmx1RW55a09aWGd2R0JFSEFJeit2MFlKQlVhTHMwWEhsVFkzV2FDeGZP?=
 =?utf-8?B?UHZSVkcwMWxGVnZjaG93VGFEcTZqRXBsS3BkR2N0WTJTQld2ZS9ZYVpHZkVV?=
 =?utf-8?B?MFFaWndxLzk3NHhpSnJ3a2o5eDhKaHVHdGZxeUQxMVltcmhCQ1pJdmhJYnVz?=
 =?utf-8?B?VDRyNWdycWVBMmJhYjlFRXQvK2Fma3F0TWZBVnBZYXg1MjVKQ2NGd3U5WDFq?=
 =?utf-8?B?ajdOQk8rc254cE5lQm85UUdKY2tkOSs5WE45bnR4UXltTnkySW9ybHh2aXMy?=
 =?utf-8?B?MHhNZmhCdmZ6aTd0bS9hSlZtSHNDQStyWXJIQTJycC9VVlJWTzJ3QVMyeGpl?=
 =?utf-8?B?NEh5WVZZaXJUbTRUY2paSUtWSEROT2F6b0ptUkdTSUxFbjVxeSszdElwNFBJ?=
 =?utf-8?B?M2VVd3ZpRUZTM0NoWGtHZGdwK3RST08xS0J3RU9aTXFCKzFhRktOc3VqVEdU?=
 =?utf-8?B?MzhpSG1rbGNQOXBsNnphTnRFWEdpVldEcmZ1a3k0NVhWaTAzd2NaaTZicVRi?=
 =?utf-8?B?d3RmbGNCT1ZWYk9wc3U0ZUVLd3JBWEdsSkVVMHpXbkh2ZkpiaXV1WFBEZWlH?=
 =?utf-8?B?WGpDcGM3WkVVbWlvTHJpNHQ0ZGFFNXQzVy9CWE9hZU5FVjcyNkRBOS81eXB3?=
 =?utf-8?Q?7cXduYi9JqQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YStRcGp5Q1pEc2ViSFhTUzFVV2o0MmFPUnpuc0FxaWk1c0RJa1BwNnBmVDJ2?=
 =?utf-8?B?MStmdzd4SGlLWDlDSzBUcXdsckNzaXNPb011ZXZzZnFoWlJiMUh3Wk9pQ2di?=
 =?utf-8?B?b1B5SnNERy9SS0xUek5RVlBKN2V0eEhVNEV0NS9FS1RsSGJabklqUUdrU2o2?=
 =?utf-8?B?RGltamVqTjdZdjlmUnBNSm1JNSszSUwyclAycWxqVGtkMHZCTnMvbjNIOHRF?=
 =?utf-8?B?ZDRQeG0rS2h1RlpsNForMjJsSmdVd1VxeTZqZzgwZnJveEVKQXdNUTZvRDFa?=
 =?utf-8?B?VHhJeEM1Z0JEZGN0ejZhSUc5ZnZkSEp6djdTakNhWUhVNFNxR09UTHFHSlNq?=
 =?utf-8?B?bWpMSE5Od3ZPVU5XUGdLOEsweVlhWnc2cDIyb0JYaDBCaVpubWdlVzV6bmdn?=
 =?utf-8?B?SHh0WnFnV1pKek0yTjVWcW5hRUg5WlJLK3pHRU1wckRGMEo0WFRmWVRGbjdD?=
 =?utf-8?B?a3NrbGI4d3JBcFJ2Q0pIZG16WkVFZmIvbWFaZTQxM0pqVkJYUjluc1RGVWVL?=
 =?utf-8?B?UWkvYkszUFFZZUFZcSswS0RHYWNNdk9pOXlvV1pxY2YrRDNPVGd5UW90VVFt?=
 =?utf-8?B?ejBmTUhudGkyZnRabEc4aHFSemRwT05VTGszYUtLVGRFWjNrbUl3T0J4d2li?=
 =?utf-8?B?ZkpucHo3bEpZNVhjN0dQUWJWZ1JiR2l2MGx4Z2I1NW1rZjJ4MVRQdzhiS3V3?=
 =?utf-8?B?ZTJ6NUdqQTNIeXhrMlV3S0RTUTdyV3JCSXFFRlpKRHBCanRsaENHVTBmRjE3?=
 =?utf-8?B?N3VOeFhSUy9zdFhLWHdvekVoMHEwR2ZxQkgvVG9QdDlUajBoL3lpOVI3UGxa?=
 =?utf-8?B?dzQ0eEVqRFYzQlRwRTNvUyswWDYwTTNBVVFSckczcFFIaFRtaWdHZ3hGYXZq?=
 =?utf-8?B?aVRjUGFocGNuYnNTaVdOeUZXVzRpNW1lVWZ1Q2ZEaEJqSXV6S2xZQ3kxWXk4?=
 =?utf-8?B?UXZLTDhsdEVLN1JjdjVQbnRnZjJTckROUFRLWFJBcy9hZTdsaGdhRkV3ZGNa?=
 =?utf-8?B?UmxwZjNGbEF6bVNGbGowV2JPWHNFMDZGYnBTVWNqU1dWKzh1VmhYMWJvd3E3?=
 =?utf-8?B?bjllSTVyaWhGNThoTm5qTmRMMHV1eXltcmRiaEg0TlR5YWtIY3BUV09OZWR4?=
 =?utf-8?B?OTZabndEaDUydHlEZGRaNjFyeFdOT1RLWWplL0hrcytEZ2xidzk0T2E4TXJJ?=
 =?utf-8?B?aDdrZm5ZNGxTSHNRck9Qb0RkYzFWeXNmL3JMNWZnWkZHeEJFSGliSWR3Vncv?=
 =?utf-8?B?QTQ0SmlzL24xVEthN2RUY3FmWEpRRnVES05YMHdMZ21Md3phbmlWcmp3UmtI?=
 =?utf-8?B?cWdUeUhvT0F6OTN0d3dHQnRVSUNOVjRmamYvRnVYVWwrN0tqK29qUlIvV2NN?=
 =?utf-8?B?VVpNUDlWTUYrZGpuWmZHeXlRZk9aUTEyaWxIRnFHOGtJbmc1elA2MTA4c2Qr?=
 =?utf-8?B?TEZQTXhIOHRPNmxuVE9MR0haQU1ENlVELzN0YXpyOXQxMC9DWXpRaHREWjBq?=
 =?utf-8?B?VGh1WnYvb0RCU2NCVjdldDA3Y0NSb25QUE9Ta0d3YTRzellod3hKMGRBMFNN?=
 =?utf-8?B?NEpHQVJZb2UvWm5VYWhVa2RUMUtZK1RLdHRiVU1UWFpSTm1PekxCY2tiNXo1?=
 =?utf-8?B?dzVKZXl6WVF3K3h6Y1dCc2FraXhGdUkxR05LOFdHNGRGS080cjIzYmQvVk9y?=
 =?utf-8?B?VzJsSTZsMDNIcWRvb3hmY2RMVmlzMjNBSGxINGVHZTMwQ3MwYVNwS1M5UjJp?=
 =?utf-8?B?bks4cUc3L1QzYW96TE1UZFJtYkhRaDF6RWJTcWlMSXl3b0djRTJPMzhDQVhu?=
 =?utf-8?B?dFZrOUw0VndYeDVVcExSUFh3RlZualFNbVVyWEpRTlFhK3hZWVJER21SSGQ3?=
 =?utf-8?B?dG9TdkwyamFpaVRxaFBrc1hFVWlqbjJvYnhPWmczWFBrTGoxK2RXTDFXRFdL?=
 =?utf-8?B?Q1JSTXRHSmtEVjFNRytiWEFaVGxycjM2bG53dm5zKzZ2ZXBTY3ZEcGtsQ1F1?=
 =?utf-8?B?akJyaFJrVG5yWWgwdVlpaSswWDFzYXZoOGJHTXdsRU5vNXNha0tIWE8yUHpX?=
 =?utf-8?B?ejBiZDlQV1l2MjliVEZzSit6Ulh6VW9ya3MvUTVZQ0krcmpoUkVOazVuVWdW?=
 =?utf-8?B?MFd0dy9ta1hEZDhrZldTYlBBcVJGVzdoY21MbXpFNzBYMWdKeGVmN2ZDSWhY?=
 =?utf-8?Q?zEFn5DpyAEv5ssHDsqyMY28=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 635640ac-4713-4f10-7500-08dd7d028e41
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 16:20:08.8537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRNHOBzaLwTmg/ncoP5CQcCLQfiW33tzocxogj2pXG28YyFtd09temEzJFH1V729rEEMJsaqs6Vrdxg74qupCaL69S2TAZ2t0F8ah8lpJJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
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

On Tue, Apr 15, 2025 at 09:57:42AM -0700, Dixit, Ashutosh wrote:
>On Mon, 14 Apr 2025 16:16:14 -0700, Umesh Nerlige Ramappa wrote:
>>
>> On Tue, Apr 08, 2025 at 11:12:07AM -0700, Ashutosh Dixit wrote:
>> > Implement sanity checking for Xe2 PEC OA reports. Previously there was
>> > sanity checking only for Xe1 OA reports, but no sanity checking for Xe2 PEC
>> > OA reports.
>> >
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > tests/intel/xe_oa.c | 121 +++++++++++++++++++++++++++++++++++++++++++-
>> > 1 file changed, 119 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> > index 2440101900..eaf97ae0df 100644
>> > --- a/tests/intel/xe_oa.c
>> > +++ b/tests/intel/xe_oa.c
>> > @@ -966,6 +966,115 @@ accumulator_print(struct accumulator *accumulator, const char *title)
>> >		igt_debug("\tC%u = %"PRIu64"\n", i, deltas[idx++]);
>> > }
>> >
>> > +
>> > +/*
>> > + * pec_sanity_check_reports() uses the following properties of the TestOa
>> > + * metric set with the "576B_PEC64LL" or XE_OA_FORMAT_PEC64u64 format. See
>> > + * e.g. lib/xe/oa-configs/oa-lnl.xml.
>> > + *
>> > + * If pec[] is the array of pec qwords following the report header (Bspec
>> > + * 60942) then we have:
>> > + *
>> > + *	pec[2]  : test_event1_cycles
>> > + *	pec[3]  : test_event1_cycles_xecore0
>> > + *	pec[4]  : test_event1_cycles_xecore1
>> > + *	pec[5]  : test_event1_cycles_xecore2
>> > + *	pec[6]  : test_event1_cycles_xecore3
>> > + *	pec[21] : test_event1_cycles_xecore4
>> > + *	pec[22] : test_event1_cycles_xecore5
>> > + *	pec[23] : test_event1_cycles_xecore6
>> > + *	pec[24] : test_event1_cycles_xecore7
>> > + *
>> > + * test_event1_cycles_xecore* increment with every clock, so they increment
>> > + * the same as gpu_ticks in report headers in successive reports. And
>> > + * test_event1_cycles increment by 'gpu_ticks * num_xecores'.
>> > + *
>> > + * These equations are not exact due to fluctuations, but are precise when
>> > + * averaged over long periods.
>> > + */
>> > +static void pec_sanity_check_one(const u32 *report)
>> > +{
>> > +	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
>> > +	u64 first, *pec = (u64 *)(report + 8);
>> > +
>> > +	igt_debug("\ttest_event1_cycles: %#lx\n", pec[2]);
>> > +	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++)
>> > +		igt_debug("\ttest_event1_cycles_xecore %d: %#lx\n", i, pec[xecore_idx[i]]);
>> > +
>> > +	/* Compare against the first non-zero test_event1_cycles_xecore* */
>> > +	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
>> > +		first = pec[xecore_idx[i]];
>> > +		if (first)
>> > +			break;
>> > +	}
>> > +
>> > +	/* test_event1_cycles_xecore* should be within an epsilon of each other */
>> > +	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
>> > +		igt_debug("n %d: pec[n] %#lx, first %#lx\n",
>> > +			  xecore_idx[i], pec[xecore_idx[i]], first);
>> > +		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
>> > +		if (pec[xecore_idx[i]])
>> > +			assert_within_epsilon(pec[xecore_idx[i]], first,
>> > 0.1);
>> > +	}
>> > +
>> > +	igt_debug("first * num_xecores: %#lx, pec[2] %#lx\n",
>> > +		  first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2]);
>> > +	/* test_event1_cycles should be close to (test_event1_cycles_xecore* * num_xecores) */
>> > +	assert_within_epsilon(first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2], 0.1);
>> > +}
>> > +
>> > +static void pec_sanity_check_two(const u32 *report0, const u32 *report1,
>> > +				 struct intel_xe_perf_metric_set *set)
>>
>> I would just s/pec_sanity_check_two/pec_sanity_check/ to validate 2 reports
>> and drop the "pec_sanity_check_one" altogether. We only care about delta
>> between 2 counters.
>
>Not sure I agree with this. Because checks in check_one and check_two are
>really independent. And checks in both functions seem to work (checked with
>checking all reports for non_zero_reason). And check_one allows a way to
>check each report independently. Can you explain what problem you see with
>check_one?
>
>Even if we remove check_one, I still want to retain the unused function, so
>I would want to add a '__attribute__ ((unused))' and retain it. Just in
>case someone wants to use it later. I at least want to get into git. And
>then maybe remove it later, if needed.
>

I haven't come across any use case where reports are validated 
independently other than checking if the counters are zero/non-zero.  

If you think that it adds value, you could retain it.

Thanks,
Umesh

>> > +{
>> > +	u64 tick_delta = oa_tick_delta(report1, report0, set->perf_oa_format);
>> > +	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
>> > +	u64 *pec0 = (u64 *)(report0 + 8);
>> > +	u64 *pec1 = (u64 *)(report1 + 8);
>> > +
>> > +	igt_debug("tick delta = %#lx\n", tick_delta);
>> > +
>> > +	/* Difference in test_event1_cycles_xecore* values should be close to tick_delta */
>> > +	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
>>
>> Maybe, within the loop you can have,
>>
>> n = xecore_idx[i];
>>
>> and that can be used in the below code, for ex:
>>
>>		igt_debug("pec1[%d] - pec0[%d] %#lx, tick delta %#lx\n", n, pec1[n] - pec0[n], tick_delta);
>
>OK, this is probably a little bit cleaner.
>
>>
>> > +		igt_debug("n %d: pec1[n] - pec0[n] %#lx, tick delta %#lx\n",
>> > +			  xecore_idx[i], pec1[xecore_idx[i]] - pec0[xecore_idx[i]], tick_delta);
>>
>>
>> > +		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
>> > +		if (pec1[xecore_idx[i]] && pec0[xecore_idx[i]])
>> > +			assert_within_epsilon(pec1[xecore_idx[i]] - pec0[xecore_idx[i]],
>> > +					      tick_delta, 0.1);
>> > +		/* Same test_event1_cycles_xecore* should be present in all reports */
>> > +		if (pec1[xecore_idx[i]])
>> > +			igt_assert(pec0[xecore_idx[i]]);
>> > +	}
>> > +
>> > +	igt_debug("pec1[2] - pec0[2] %#lx, tick_delta * num_xecores: %#lx\n",
>> > +		  pec1[2] - pec0[2], tick_delta * intel_xe_perf->devinfo.n_eu_sub_slices);
>> > +	/* Difference in test_event1_cycles should be close to (tick_delta * num_xecores) */
>> > +	assert_within_epsilon(pec1[2] - pec0[2],
>> > +			      tick_delta * intel_xe_perf->devinfo.n_eu_sub_slices, 0.1);
>> > +}
