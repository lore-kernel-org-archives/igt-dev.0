Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A620BD5E133
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 11:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6065A10E1EF;
	Tue, 16 Dec 2025 11:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HtYQZ6Y+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE40210E1EF
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765883806; x=1797419806;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q9qea43UonNvpmH1eCByrWTMsWpy4Abf2Hf4+lNiwQM=;
 b=HtYQZ6Y+44Nz196SRVnOpoirER9ozFAaNh9cRNCMWYgSBUPXnJR/WS8S
 SNMFx5MKJI3OqGpRkgy37hqABdiKfdRKfJUWGKpXabwmA6fOTSq37KHnD
 0HqlzcaroxZb6+FsgxjIAm94SBBjIOq+cDQevt89zuHgn25huwqrIEP0N
 tEv9atXirZrogv2fbtUDd3kRUPZkTZ8a9wd6P19N5vx00+rmxYAw65kek
 oC1DuD6PYgeUALQ2vFC90qsIjbvlkWUnjdbdeTxFrFt87LUwRL9ceObVi
 7d+nqXe7Nrdv1u2Z2hGFYfvRVbRNpDLDGwCVE5qMFWhLXlWs5LBiYIlxR w==;
X-CSE-ConnectionGUID: eKXS9PWPToyfccLwuaKeEw==
X-CSE-MsgGUID: fXfN2krmRymYSSJ1nqm+mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="90454544"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="90454544"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:16:46 -0800
X-CSE-ConnectionGUID: Rtd9IwhGSxSns4i50k/DdQ==
X-CSE-MsgGUID: uJE9OGDlS6ukO+RHn/aLdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="235399854"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:16:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 03:16:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 03:16:45 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 03:16:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8CsPXr/GbFjYBBb+KXmQuOKCbV2SO8Uz7Aze7Y+SDWuCQgdirZ0bawUmc+gmaZDCW0JqtX2xQyXRT95TPmLIE6qlFcOsAC3Qrt8rseZE/HZyAMJWvIcAoMnTxS3IoncuQSZy8av0O3EmyK7llCdlZ/IsVQq2dDBHSphZfH/R3FD1X5A5xw2OjYd6SFgNpmQbaibLSlCut7fq497tp16I6b9z8oRHkUxc2i0KF4IPp/JF5lX4ZD21i4YQxs1qfGEfg/FgZTw8OgUA2F4OzPOopJ76HB40ceJaDWpMQc+mGQCNZdh5GsWg7Y06wk46LwMIh1kK2qKKgENN10W4H6bRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMHHEVLCKgIrhbSyVnk6lTSOh1S0y8YndygJxV9KAOM=;
 b=glk7ofVHyLoXOIyMxGnHDl2eEuzDzdaEuq6uuDmJpHNi6pZXZmSjSf1N9NO6WHx/ZCZKp+9Z9dxZ/udiBBesTCvZS2yJTwOKIFr4pCsXX/6gtOT7NZ4pTgTKTVLYkDDM2TI0gvh61vYxXXxp/lpuFwbhX/mAqVGjZtuOTFqa0qlh2PzlikZKeE6bcDoy4I+YBa/fyOooeEVcM3B/4CViDvu1KHx0xyOUhC+kZ9mKshEhlieW49Uasesepg3ijMUUpbyEes9GIFyAr4FobabnkyS4ylVJ6OGkvUnIyNZFkXI+FfpW+3T8TqxCoyBKXRMUT4S2zoFtfxxsUmgkRIgZ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 11:16:41 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 11:16:41 +0000
Message-ID: <7766cc98-72b9-4d10-8b1c-3360c072baea@intel.com>
Date: Tue, 16 Dec 2025 16:46:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 1/2] lib/igt_device: Add API to get pci device
 upstream port
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20251212165830.28286-1-karthik.poosa@intel.com>
 <20251212165830.28286-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251212165830.28286-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0192.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 114ed7fa-6ecf-480f-5128-08de3c949689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0ZROVNySGY5WnBNZW5MeW54aXF0dk16WDJxQnF3V0JCek5zcE12UGl4eVBI?=
 =?utf-8?B?ZHN2TmJzci9pV2xPbDlGaEFDSkFCUDZrcExQYUtZa2J0S0NQU1JzL25MNVVn?=
 =?utf-8?B?RFlseks4V1hnVi9jYkZ5eU1LUjRzaUVvWXRWaU5SZnB6eWFwRC9kcUVudXZE?=
 =?utf-8?B?dnFSMUQyanNtZ3dJZVM3dkJDNWxNeHVLcGxsUjhrQVRVY1JXOXRtQnNrQm15?=
 =?utf-8?B?OVZWbE9hQzFDQ1o4anVCZ1JJK0gxeDR3dDVtbyt6S09MNXFDVks2Y2p4QTUx?=
 =?utf-8?B?TGpET1I4WXNpeVpxaXN6bUpEa29OZ2FPMUZtbWx1ZGVBbnllcmFTZWxSalVV?=
 =?utf-8?B?RWgyV05Ma3UvK3NsdHd5Y2UzaHhGSEViYm55UXVHRWZ6VE5jbWN3ejN0TFlJ?=
 =?utf-8?B?Ni9TV3MvTEJLVzd1VEtPNW1pZHc2TUU2VnZSTDNBRW1WbzdjVlBOZENMM0FN?=
 =?utf-8?B?eXRkanhwWnV5dTVlYUNqY1FlSzlKaC9QYkU3b214N0pteHg2d1YxRnBzUENE?=
 =?utf-8?B?RzAwaElnMGxkeU9wYmJWMjBLUU9nTi9jeG54bmlrS1U3MktHVlJ4akxYYmJj?=
 =?utf-8?B?Z0VrdlBXUzB0VDFtakJVcVo1d0JQc1JWbk9UaDcwaWVHSVBzWFQrczhWZEM4?=
 =?utf-8?B?V1ZBL3ZFRUYvQWNtZEdLNWg0K3pDZlczTXFhSWNKdUJGS3FVNkswUm5STGN3?=
 =?utf-8?B?NzI1b1UwTExqMUZSV2hKKzBaOHZOVGtQejNRK1haOWYxOFBuOFdCalFPYkYv?=
 =?utf-8?B?Y2VqM2RTRUs0clUvdjFIS1JzNzBBWDJkN002UUdKcnVjek03WlpDR3NxK1pn?=
 =?utf-8?B?S3hSQlNZM0NodDNHajZGOXZSMkxJM2taTmxGZ0pQRzdNZE8vZ3g0SWVTZGp1?=
 =?utf-8?B?cUlFMDJndVZObndmQUU2VlBLcGdnak9KRW4ydGdMVWNaRUtYK2IyWUJSeVJ6?=
 =?utf-8?B?dUtFaDMybFVCZEEvMlFMSnlxbkZPZkRwWnZCSlBndVNJanFYdWRYdTJOUVZT?=
 =?utf-8?B?elMvUUF0Tlo2SWNkazR4NVlHanJzRHF4cHVraUh4b3VXR2FycVZtZml3dFQv?=
 =?utf-8?B?cFdRb3hoTXF2TWFBa2s2YnEvdjlNd0hPUlZyYWszRnJxL1h2dVFjbEhmeUM5?=
 =?utf-8?B?UDlCOTM0MGhvUmtCM3JEaFdMK013Nnc0aFJndVUvbzJJMG1SVVBZNk5XYTVY?=
 =?utf-8?B?ZExxSGpZQjVVaTRkRUgwL0tNd2x0bkVVTDhac3o4UitvdmZKUDl3eHBPcksw?=
 =?utf-8?B?TnBnekpnYmdzdlBqK0NXWnRUQ0owWVVjbDUzSm56R2kzdXFkbTNjV3dUN3o5?=
 =?utf-8?B?VHBxZ1VXYXcxWTRBNS9NWUZxTU1jUHFPRWFoSldVMyt4SDcrWUFBZXBDV0g5?=
 =?utf-8?B?bWhWbkFxU1hLK2VsWFprL1d5RFRpc2o3NTYyMEE5dDFmSnlndXFRQ3lnR1ND?=
 =?utf-8?B?SWtQVlhBWWZTdThDMGxETTBZaWdIS0g4N0U1d2lwQldkQyttM05uNE5LZGRh?=
 =?utf-8?B?dmxDenBwSjZwS2YyQUV6NXpBUk9qU0lvM1ZwQmd3WjVwbVhrRkhHZXJzREh1?=
 =?utf-8?B?NjRGS1h4Z2ptQk5TTkpDYzNlMmlYQnlkSDZnQXBQL1d4R2FUVFFTVEhLN1Bz?=
 =?utf-8?B?MDRYLzJOenN6WUUxTTNPdzRFWHVQdHhhLzA2cjk4d1lrTXhvMk43ckErbkJJ?=
 =?utf-8?B?dno3Q0VNb0VLMTZibmw2Q1d3TkdneHgxUG9lT2R3blNxSjliWnJsSk9TZHFo?=
 =?utf-8?B?Y0hpcmFZKzlSbGZtcHRoV1U3T0V5VVNweWFJSGw2N1Nkb1U4S0poTk9JMjR0?=
 =?utf-8?B?Zks5eTZncEdQYjQ0V3NSZ29CZ2VyZnpGWTBReHhZWlU5S05NOGFZRzdGVHFh?=
 =?utf-8?B?cnM4MDkzNzQ4VVF0UWk5WDRBb0MyemJXSG5hdVdjR1lGYlJYVGJKNmJZejgy?=
 =?utf-8?Q?I9okVF6aLI4jQgq5VqMlvqXCubQ8E8uK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVg0NG9uRG5sMFZhTC9VNU43REdEZXVtU2w3SnpSVlpMVU9zTjllOCtRRFhK?=
 =?utf-8?B?VGhVRDRxTzdYRXhsQy9aUFp4b1o2bjQzanJHTUJTeFp3M2ZFQ0pGeUNGRk9Q?=
 =?utf-8?B?TkxxZVRVOXl1MktCaGhPTjFEL2VWQ1ZEUXU3ZzI3Y0RiM3ZUTDllWTEzN2Mz?=
 =?utf-8?B?cHFKbFl1T0drSE5hT1l0SU5UaGFpcDFEQndraXJmQlFRWE5SRUFsSWFmZ2M3?=
 =?utf-8?B?WWxoV0NDZTBqK29lRURZSStyRTNGM1pYTkJ6bXpmTlNlcVBBUi8vMFZSZ3NU?=
 =?utf-8?B?VEtSTjA2QmRGSWNRb2YzWlZUc3JBTW9sd2tPc0RVWDl0OS9qalRKR09ZdVhC?=
 =?utf-8?B?SzZpN2VYS1hoejVsRDc1NGNvTE1zaFdFWFFNelZEU0hZMDJEK3FacTBQWVFP?=
 =?utf-8?B?akhDWUJZNmVoSENrTXo0dFpYMm92WTdNNTFadUtZVElzVHVkb1NOMGUyc2VE?=
 =?utf-8?B?Z1k0bzNiYkZKQnNNRHRrd2lBdlNNSktpSisyRVJYZXZ4R1Q4RDRlc1ZOTmNy?=
 =?utf-8?B?MVR4bHhXRTFHT0lZbTl4Vk9OMCt1dEcwVU1PYnkxNTl5eC9xS0pyUzcyOHhC?=
 =?utf-8?B?RENaU1V1aThuQVNLbnZxTGJlSWg3Y2NLY2ppd2JqT3UwT1pGdE8yanpmV1Nu?=
 =?utf-8?B?b3RYcjJoQkY3ZkRZWDVzQ3dhLytLK2xuQXN1b01ERDJuVWh4dGIyYzZoQ3lQ?=
 =?utf-8?B?alRhWXpCSlF1dzgvalJpeHc2QmlSUmJtcUhTbHlNVkZRQ0RYSStWQkE5Q2NL?=
 =?utf-8?B?NVFrVWRMSm1kVU03TzVVcTI0Qk44WVZVSXF3ZDFFb3N2MHpFZ1lVVE40em5m?=
 =?utf-8?B?UFUxcW8wYU8ybnBXZENPV3EvTGd4YWVnanlmZEZrQlM3OXBtRWxjcm1pWEIw?=
 =?utf-8?B?TXpGMXQrV0p1Rm0yN084R2lucW5raHBUUWQ3dk12aXRZZ3RNREpsTjlXeFdw?=
 =?utf-8?B?bjErZ2RLYXZNWm9pWU1nbEI2UFEra1BqQVU0NHp2LzRRU04rSCtFeFloUjEy?=
 =?utf-8?B?TEtIUVVNcWdaNVo0NmFYeWZodXhDSDExMTEyMEs3YkVTNFYxeFpldG1IdEx4?=
 =?utf-8?B?TVkvdC8vUytJQjQrdElCVDlZbjh2SDNCbFNGYmNPVjFmOFM5TFpwdCs3UmQv?=
 =?utf-8?B?NFFVUjRrQ3g4VkZnejhZZSszdkJrVjRPaENIRmpXMWRmd2xRMEVUeWovZjRZ?=
 =?utf-8?B?UTdDSCs2YlJpMnZpaUQ4YkNIS0NkNE9tMjdOZ1AyVTR5TENnalhHSFcxVDB3?=
 =?utf-8?B?QmRJdExkbE5HTFhEMkNpUHF4d05oWlJMdDJMSG9sWi9yUUtSdFlvU0QrT3lz?=
 =?utf-8?B?SGVWdW5PL1hMUjhwOHp4Nm10SmJDaXdDWXdydEI3RDdqQUU2VEc5NElsVnBP?=
 =?utf-8?B?ZG5VNlpqd3NyWnR5c0JKTURXRVhpQTVseSsxNGNUWlZ6TllJcHNJZFFXWndI?=
 =?utf-8?B?K1RvQzF2RkJQbHd0c0piaUlEanVDTlRqODRhT25Xa1BoYTVHY3RSWWd5Y3Jj?=
 =?utf-8?B?bUVERWVxL0YvdnVLcFFLeDVHYXVHQWhBL0ViaHhZdGxiejk5aTE5QjY5dmw5?=
 =?utf-8?B?UnNTNU83QW5qb21hKzlnUXN6bi8xNFJMaWhUaWRaeWx3bUVqRFg4UWZxZFhY?=
 =?utf-8?B?TjV1QkNKMEwySWV0R1E2eit0bnNXazkvVUVlUWhPWTFzNnJURXpaaHUyRWZF?=
 =?utf-8?B?SllxRnRyTCtPazlrSWNnQkFhVDNyN0puNWxTMzcxOEhPNlhhUmV2ZkszZU01?=
 =?utf-8?B?MURTbEpJOUhzdkNEUHRLeFVzZ3lCMGx5VmYyem9lZDhXV1l4czVYczgxczZy?=
 =?utf-8?B?MEx0YlhrcHFOdlROREJNbVVLK2xGN3FQN0VuU0N0QjQvRjYwMm9wK1I0ZlpU?=
 =?utf-8?B?Z01KWGxwUVIrTENYbDdNSnZCWStBRG5KTld1bUZWcUV5eEZBTmNzNGwrM2Nu?=
 =?utf-8?B?eEY3ZWFrbFV1VGM4YmpOYVlvcURxYlMvbnFBcjZLRFZFVkhXTXJGRTcrMnZL?=
 =?utf-8?B?NjdtNWcrVjdzK3ZPU0VSM1dMdHdtTnV3MEt4Z3kzOWVSQVpOcml2TmhoQTVI?=
 =?utf-8?B?N0JHRFpWS1JNZWpzdVNuNXpscXE2UnZpSW5EcEpHVVBKYk4xUzdKYmJtaldt?=
 =?utf-8?B?RmNVKzdBWjZmOUZuLzg1d1dqYUNFQjhweTczYVdOVkE1eU1kNGFBVVJBK2Zw?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 114ed7fa-6ecf-480f-5128-08de3c949689
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 11:16:41.4767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4r2KmZrkVObrdGMWqkgHGh4JDFJjLQ/topYtnySLUu7F4SqqJ6/oQu6diL8goqqcAxy4OwKQnEddkv7berYqdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
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


On 12-12-2025 22:28, Karthik Poosa wrote:
> Add API igt_device_get_pci_usp() to get pci device's upstream port.
> This API returns struct pci_device* of the upstream port that is closest
> to the root port within the device's hierarchy.
>
> v2: Avoid igt_require in igt_device_get_pci_usp(). (Kamil)
>
> v3: Rename igt_device_get_pci_usp() to igt_device_get_pci_upstream_port(). (Kamil)
>
> v4: Use device type from pci express capability of pci config space
>      to identify upstream port. (Badal)
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   lib/igt_device.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_device.h |  1 +
>   lib/igt_pci.h    |  2 ++
>   3 files changed, 45 insertions(+)
>
> diff --git a/lib/igt_device.c b/lib/igt_device.c
> index c24f6a58d..fda261d8b 100644
> --- a/lib/igt_device.c
> +++ b/lib/igt_device.c
> @@ -32,6 +32,7 @@
>   #include "igt.h"
>   #include "igt_device.h"
>   #include "igt_sysfs.h"
> +#include "igt_pci.h"
>   
>   int __igt_device_set_master(int fd)
>   {
> @@ -308,3 +309,44 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
>   	snprintf(pci_slot_name, NAME_MAX, "%04x:%02x:%02x.%01x",
>   		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>   }
> +
> +/**
> + * igt_device_get_pci_upstream_port:
> + * @fd: fd of the GPU endpoint.
> + *
> + * Looks up for the pci device's upstream port using libpciaccess.
> + *
> + * Returns:
> + * The pci_device of upstream port of the device referenced by fd, NULL on any failures.
> + */
> +struct pci_device *
> +igt_device_get_pci_upstream_port(int fd)
> +{
> +	struct pci_device *pci_dev = NULL;
> +	uint8_t device_type = 0;
> +	int offset = 0;
> +
> +	pci_dev = __igt_device_get_pci_device(fd, 0);
> +	if(!pci_dev) {
> +		igt_warn("Couldn't get pci device for fg %d\n", fd);
> +		return NULL;
> +	}
> +
> +	pci_dev = pci_device_get_parent_bridge(pci_dev);
> +	while (pci_dev) {
> +		igt_debug("PCI device %04x:%02x:%02x.%01x\n",  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +		offset = find_pci_cap_offset(pci_dev, PCI_EXPRESS_CAP_ID);
> +		if (offset <= 0) {
> +			igt_warn("PCI Express Capability not found\n");
> +			return NULL;
> +		}
> +		igt_assert(!pci_device_cfg_read_u8(pci_dev, &device_type, offset + PCI_DEVICE_TYPE_OFFSET));
> +		if((device_type >> 4) == PCI_DEVICE_TYPE_UPSTREAM_PORT)
> +			return pci_dev;
> +
> +		pci_dev = pci_device_get_parent_bridge(pci_dev);
> +	}
> +
> +	return pci_dev;
> +}
> diff --git a/lib/igt_device.h b/lib/igt_device.h
> index dad7bb047..781a72235 100644
> --- a/lib/igt_device.h
> +++ b/lib/igt_device.h
> @@ -35,6 +35,7 @@ int igt_device_get_card_index(int fd);
>   struct pci_device *igt_device_get_pci_device(int fd);
>   struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
>   struct pci_device *igt_device_get_pci_root_port(int fd);
> +struct pci_device *igt_device_get_pci_upstream_port(int fd);
>   
>   void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
>   #endif /* __IGT_DEVICE_H__ */
> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> index 92b9cc392..84355e9dd 100644
> --- a/lib/igt_pci.h
> +++ b/lib/igt_pci.h
> @@ -20,6 +20,8 @@ enum pci_cap_id {
>   	PCI_EXPRESS_CAP_ID = 0x10
>   };
>   
> +#define PCI_DEVICE_TYPE_OFFSET 0x2
> +#define PCI_DEVICE_TYPE_UPSTREAM_PORT	0x5
>   #define PCI_SLOT_CAP_OFFSET 0x14
>   #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
>   
