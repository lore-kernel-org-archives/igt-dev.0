Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961C6C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 04:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BE010E1C8;
	Tue, 25 Jun 2024 04:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ep3MgWgR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27C810E1C8
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 04:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719290677; x=1750826677;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cnK0IFmZ7AxNWi4w1jPEIN5jrPJqKrRhiAWdyc9frk0=;
 b=ep3MgWgRXRtvcGsWgEdFKEECgoSeMz5hNOzuJocEYm+M78IUUNf5ZShd
 PMPxynbYMWDvT5zpVvFy20+kROKQPPb/YFmrVSi91UFaEqp7g4/IJ9fYi
 e95xsD2RCwB62lAZn3GoHZs4X/waeRTsYB+HWSiIkcb/qy8rVn0amb44V
 7/2uAyRBDJFhBE7C8JN/9wx7g29k8Ore0nZZdkYDUs6WuI+UMRl90wu0s
 ujfGXQ0rnVx9fy4yXkxJeCu/TwNkLevvNuqsB4wGtPj6HIoIHwmqzusDV
 Rld5pEJ0Dha84Nl8FEt0Gepscs3GG826a8Yf/5EsTpr+6i5ybPhEiaiVB g==;
X-CSE-ConnectionGUID: NEygCb3GR2604DbWfYgyBw==
X-CSE-MsgGUID: FrZQ1xJuTPmggTieAhjxWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16042720"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16042720"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 21:44:36 -0700
X-CSE-ConnectionGUID: 8H5v20Z5TMuXxIBLIeXsiA==
X-CSE-MsgGUID: 2jTKkpYdTembqKf+80k9nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="43620429"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 21:44:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 21:44:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 21:44:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 21:44:35 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 21:44:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sk97pztjKpaxDIQF5+TpNjbiayCv1lQT+TBrS2tNcwYWMwPXoxs0iq9xPyieeXUNxr7UPksULb7+kgk603tz3IMT/yxl9oVUG0HIeR9GZvZ4GRUW/SBQxYMN2rl/iZECV1k+HCUFu3E6+XlFJz9JT1+0FtC+GjAwiylLjHtYFhJm7ECojT1eT+nyTDqxe4+eeByczGs3UmA3zkWYleJCvn+IYlYDmvf8nJIYvdtB0upBDucvU5/HomijSB/4aiOa3HrWCcF+oItKevgnJ3J/WVg9sNpxO4gt3bHIYYapJSsE889+Flnij80r1zbVoIF+ayjA8gcYDC4dhp8NC/B8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCeE5C/pgHbeS4MwJqZhSK+y0OOhrdHT5sBQyMq4xWQ=;
 b=S/ipEkBEPcBTp8aLVn6gRla34kPQmGM0Rx7niC0dcdppjb8BX2GVWcNz/CDR6SBhfwRpfJKLo0dHzHfpTha1xsQlDGXeiMfW4qZGB+fM40JL0eG0PO8JZ23jffIsiqteIRJGaEoyUthFCF4Lz9IGiPgw4XsSstQiFT6RQbWdGmAjd9nMpt5Tj7Ja5kpLybuJ8VGJkNYTgRs7XAz2sNzE8UGPF1Fl2QQl4DcmjTZhXzOQN4d+sZNJ/9n+1IxKQMWbTYOI65yHlt5+VQGfNwLxxFhWlROaE624PiTPU2rGfxoytWZRqu3JSjSlB0znjftPiPCMAvTeDAzimvxVtQWgzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH8PR11MB8063.namprd11.prod.outlook.com (2603:10b6:510:252::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 04:44:33 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 04:44:31 +0000
Message-ID: <43357750-3356-4099-94ca-93f21a626c80@intel.com>
Date: Tue, 25 Jun 2024 10:14:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 1/2] tests/kms_hdr: Fix bpc-switch subtests
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240625043136.257253-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20240625043136.257253-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH8PR11MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: cc03643f-474d-414a-c8da-08dc94d180d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXdsQ2N1T3BCWTh6TmNIUlFrNElDWmtNM3FGQ09temxDTElWQUg0UHRGL0F4?=
 =?utf-8?B?MjVmbmdtUmJISXoyZFI1M0d6akhyWVFJTTZEeFZKTGFrMlpid3JhZmZySXNL?=
 =?utf-8?B?WkJGL21FaHdmQXFtc1h4aXpkUG9XY3ZCbm1NY3J6TTRyQ0x4aGNYWVkrcDZn?=
 =?utf-8?B?RDgvSGZKUmtqRlR0TWI0bk94THgyM0VVcUo3RjdCRjI1OHRwbVduVGxmVFpm?=
 =?utf-8?B?WVRXT0hGVWlWL1ZtMmFwd1YrbmtGUWcvcnBhckdXUFpMWE43eTVLRmZMUy9z?=
 =?utf-8?B?Z0E1NFVodnl1eUZ2T210ejR4RWN5YVFuam1KZUR0S0lLaDJlOUwxVVNtTEtU?=
 =?utf-8?B?VEgxVFF4bm1oKytaTDMyajZ1WFByeXRvUHh3OTc2TnFPak5SQk9YWTkrTWVP?=
 =?utf-8?B?SmFmNWs2RE14RFBiSFU1RVJOUE56L2V2OG5tQmY0OFE5R2RyMWFsVXBhMkU3?=
 =?utf-8?B?bi9xL3ZmRDZZOEVHb2kydjV6T0l5UDlhdzF2bVdRdEhpMWJhU2N2RTVmQkpQ?=
 =?utf-8?B?dEJwc0NLbTRqc0g0RVMrS1VCWldMNDIyY3EralozVUxmRGV0eGtFb1l4NkRz?=
 =?utf-8?B?MVNFdStDeUlseVpyMzJDbUlZQ3pGc0Fvd0pkTk51Y0lRbmVOd1FacUYyb0cr?=
 =?utf-8?B?c1poMzh4Tnp1YndLcGFuV3l5ZXYrRHJrSTdmVjUvcEovVk1yTkFWZGlSYk93?=
 =?utf-8?B?NGV6bFFlSUxmL281ZXJVTVE4TVltZlRPU3A1L2pDdUc1WENSTmV2TjVXT0Zt?=
 =?utf-8?B?MzBEcG1TeFFxZnNzOVo2TTlqcnAyMEYwNmFuS3F1TTNZNUlLa0ZtWDduK2ZH?=
 =?utf-8?B?TkVQcVowQytackhrb2xUM3dNcGM2L0dNMXhKSUs4TjFYR2RwRHIvRTZqdFAz?=
 =?utf-8?B?WXg3YnNSdjVzckN6K0F3NXMwNk03SXo2aTJrWFZWaWtsdFhTNGhmT1Ria3pk?=
 =?utf-8?B?bjYzbnFIVzdLUkNPQk8vei92WHRXOUtIbk8xaGFoSnZlRUsvM3ZPSVJPb3RT?=
 =?utf-8?B?OHYwUjNhbTc0Y2xLQ0FXSUplRFR0dmRwYmlUWUxvalpRdyszMnN2SFJsU0lU?=
 =?utf-8?B?RFFJRWlnWU9tVVd4ajMyYVpxVkhXODBoMXVoaGRaOUE3ME5YTnQ5d3FqU2Vs?=
 =?utf-8?B?d0VsZlV0ejkyVTAxblVwS2VBQjBtQ2R2MHVnSVUxVWM0N1o0T1hXeTdZSzAr?=
 =?utf-8?B?QU5YcVVGVzhtTk0xbHV2SllqdmJMRURvTU52V2Z6Y2NRTklzWU1EMnZWVVdh?=
 =?utf-8?B?L0tBZTcrQWUrcmRnWm4rN3VMblREUENJOXR3Yy9RQ0ZWcUxrNnB1M3E3d0dX?=
 =?utf-8?B?ai9SQkRFRWhaWmxPbjZuZTAxeXJhQUxVZExaNWVXV2I4aXRndHRNSm5mODlK?=
 =?utf-8?B?Rk1mckZrbFhvbklOV3VwbjdYa0R3Y2M4UG1EM3lVMGE2SS8xZjFPV3dya3g5?=
 =?utf-8?B?bXFwRmlHeW9ISTk0aEExV3ByNENzN2dUd3VUWGlvcURuSUdSQjRTaHFEK0c5?=
 =?utf-8?B?Kzd3YUNqTjJ4TSt2MitqM3pIT0N6ZVBiRWg4UncyZ3VwcFVXVlBIeHhtZDZB?=
 =?utf-8?B?bjBBS3JEZ3hJZ0lUbFF0MTF4UWdlQUZhbW1BdjE5TTVPdTdrd1c3VSswamNm?=
 =?utf-8?B?cDJKTHd0aVJQYlpwdWVudjQ1cGJOMFJWOVpaTXVNTnptY1VyREltTU5ZRTd2?=
 =?utf-8?B?ZWpkZ084RDFRQ3huUUFLai9aRTRndUJlcEZkSEhFVEtlenM2QVRUdzE2cjVy?=
 =?utf-8?B?dzE0WjJPYUIwWGtEZ3prVmkrb3c1eXNYZVVRdzF1QUw5alJOY3dwclUwa2VO?=
 =?utf-8?B?M05wZUJzZmxWOXkxMWw3QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE9pa2R1aTFMQ2U0NDlmaU1PWmdlN1R4SXVUZi85TXdEQVdNN0htMzhaeURw?=
 =?utf-8?B?anhnZVg3U2c2Z2dCSU4zbEtjaG9DcS9OWnlCL3B4bithNEpUeWVtZ1VJUDFn?=
 =?utf-8?B?b3ZkdHFxd1dxYjZVeDRaWHlnZVdQRVI5dXFnTkVkczIzV1dPckJZR0NuSkZN?=
 =?utf-8?B?V3hDdm9nSWg3TGtoQkNybkRSZUNvQmZRUGRxT29ablR1RFJ4Q0NlWlNOUG12?=
 =?utf-8?B?K3Ryd1ZOeElWN0xhRm81Q1FnTmNVbDh3aG50UmNJbW82bks2TUZQSE9hVG16?=
 =?utf-8?B?QjZCTzI4ZjlQQzdzNklJazRCNTAzM013Skl0eDl0azhLOWhhMDdQTnhJY0wx?=
 =?utf-8?B?UXhsV0FmeW55U1J5dUFHaWwxQWN5cmVsd1hpNVYwNjQvdnRrRG80MFdOSHE3?=
 =?utf-8?B?Tkc5L1owZFFnTTZ5a0czNlpWc2tFOC9PQ1FJTnJuZHBXYTBkc04zV2RRTmNH?=
 =?utf-8?B?ZnRrNmFyZnJkekp2cUthajU4SjhkRUtxcmh5TGxKL3FMb3BZRnpFRDJlY280?=
 =?utf-8?B?NFh5UkQ3OW1tOHphMDVoVXVjYXpueGlQZ0VJNUhINHcwdVQrWFZkckRiYy9D?=
 =?utf-8?B?dmo0NkppQUZvbkF1ZVFBbi8vV1Erc1BLaGlyOElSdWYweVhGdHRJVEpVeUpR?=
 =?utf-8?B?ZTlwSFJwY2gwMUh3NS9PTzNCcW5PMDF2QjhVcUQ5UEk3ckdra0Z5b0lDcytY?=
 =?utf-8?B?QVJzVVRpWEFWcDhzcGhGNDNYa2JnTlNQZnB2ZlExenJqMURIejVmWWpQUTBu?=
 =?utf-8?B?Ukp5OU4xMHhYVVY3SVJyZG9STEJHZE1xRmNqNGRub1AvY25QQVF0ZG4wSWdP?=
 =?utf-8?B?WnFQcFQyMVRSZURDRXdrK1VPV0JibDc3QXJXSWJwbkg4SEFKQ1I3NlJlOEFW?=
 =?utf-8?B?ZW5UYUtsSy9OTE03cjB2NUdOZFZqbjVNUnFZZ0ZETU1xSDBQYjc4WnRJSjlM?=
 =?utf-8?B?WVV2ZG10YTRObFFmMlZ5bk90eC9abXJTaVVQVkZjTkVXRWt2TE5QWUhvMmk5?=
 =?utf-8?B?bkltUmQ1UzRaRGFnbXJtNHFSaitSQVk1QzVVeStjYmxYT01Tei9BSkR3YXhW?=
 =?utf-8?B?azZvWHlOOXRqUG55Zlc1a0NxTlJLTUVYSmZJNDJueWVHQ3pHd1RsR2t6Z2Iz?=
 =?utf-8?B?YXZQR3NycDk3YXJlckFaTGd0dGlsUVNTOVJ2eTdXd0ZDLzVPbksrK2pCbTBj?=
 =?utf-8?B?cTJSazBCM2ZMeE5zd2xjVG1MNlVvdEo2ZmdWc2NiZWlFQ2UzbE1aa3QvZklF?=
 =?utf-8?B?UDJwa2I5TE1LM2dha2F0U0lVbVZRRXVaYW80VWpoSkQrUEg1SkU5aEh4QVR6?=
 =?utf-8?B?TUl2OGllbmQzQU5VZzV1V3d3ZVRoUjJHQVdZeW1kdENaMExHdjdHdDN0NU41?=
 =?utf-8?B?elBNNWhucm5kTlRHamM4cGNmcEhmUkRvblZBR2hFM0Q4WGwwL1l6U09TVndp?=
 =?utf-8?B?UlJSUk42UTVkcjFUL1RBWHYreG85MyttSDh4bmVNWkVjL3lSbEx0SElTTnFS?=
 =?utf-8?B?VS93VVRGOWFPVy91UDZsWlVUcEovK3QySjBoZkI0b2pSUWJCSzBvZ2pYcGh1?=
 =?utf-8?B?ekxwejl5VVdDWndMODdFWmFPSitSMEllRTNBOHBadkthcnJnYkNaS0VrVTdx?=
 =?utf-8?B?MU9mQ0x4NmQ0TXBWcXJEZWdjYVdkajczanNyM2RXcnQzUXNmWDRpYzBheER2?=
 =?utf-8?B?c1dKOW9EN2tPdW5GdHFPQ2cyWWZCNjNxK29RbzVTYVpmTktjQzZ3SUt4V1hL?=
 =?utf-8?B?TkJyZVRnUlNrbExRVnN4bHVaTWw1ZStyem52ZCs3RjcyaVRIQWZsUVlUM0VC?=
 =?utf-8?B?UVE3a3BSM24vTlZGbldYbnAxYmpQc05rcXZtKy9qVkIwV2EwdDBsR0ExNEV2?=
 =?utf-8?B?QnJ0dk9KMzZuTnVmN2oxbEZRd3dtVmQ5SG5wMTNPdkZNelhVaDg3dlBzMHJm?=
 =?utf-8?B?WURSRitmaThEUnZ2SDFDRVVzNU5xTU84SUpyeDBYdmlIY0pDN0VvRVIydlZk?=
 =?utf-8?B?MkpxbTlSejZlV1NvWTZpVkVTNTJFbWVDaWpxdnVKcG9MNG0vMFYzK3drTlNv?=
 =?utf-8?B?eXV0WkRFQUIzTEgwLzlLVjI5M2FYYllpVU9BMnVuVFNVS2U0dGxBS0pvMzNH?=
 =?utf-8?Q?GyT8YMIS9QBA/yaL+4K62wm+Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc03643f-474d-414a-c8da-08dc94d180d3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 04:44:31.3809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/6kUUu3vkqQttkk3mjuVO+TdSV8E7GOkrW4QCTB+bs0UrEiu3EzLLD4ecHc62K0dCfnvXIPw4gC8v1H6sv70A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8063
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


On 6/25/2024 10:01 AM, Bhanuprakash Modem wrote:
> igt@kms_hdr@bpc-switch.* subtests are getting skip due to
> recently merged cleanup patch. This patch will fix the logic
> to run the subtests.
>
> Fixes: (4fe91292b) tests/kms_hdr: Use lib helper to check the pipe/output combo validity
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_hdr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 475463c21..36ebb4f4e 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -274,7 +274,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   
>   		for_each_pipe(display, pipe) {
>   			igt_output_set_pipe(output, pipe);
> -			if (intel_pipe_output_combo_valid(display)) {
> +			if (!intel_pipe_output_combo_valid(display)) {
>   				igt_output_set_pipe(output, PIPE_NONE);
>   				continue;
>   			}
