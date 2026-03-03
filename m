Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E68E67A72
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 14:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CC710E0FB;
	Tue,  3 Mar 2026 14:56:46 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4E210E0FB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772549800; x=1804085800;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nHZ65/M3l1RA7NCSqr1BIJnetZG/41A4PY160laTGfs=;
 b=HWG6iwuzv72lSNzjtC37FTHnEgu1Ru56ZYN1ssYMZG27tnqPb9t0hgQJ
 sMgS+4VFWtlEk+BTRWGsc5FhjO5c6Happ8p+VoKOlcAdwaBgvvElMts6b
 OUHqsQy4GGXlPhnAE6y81L4bADTc/E7JdqCIhN8QIAxcC7gTXyIsiWfGP
 EmSRdQ7Ur6w2rAQEFPHEbLv8ixYRr63uzJZb+QfYcYs/JM4C33ZEQT287
 3BEaueQnnEn44ppSIk3xasR/XR7ooPWk2Gxgyy9fhfAVlawAbS12gDbW/
 0on71K4bePKgYdNhBHTGCllt7IDC6DrCmTEytADL+K3QhgqwgAGdgyj9g w==;
X-CSE-ConnectionGUID: rDBMRteGT6GtFTcUzVZhJA==
X-CSE-MsgGUID: zP3R6jjaSSaGfAWCgAP8Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99062061"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="99062061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 06:56:29 -0800
X-CSE-ConnectionGUID: V2XEtCS/SK2dN6DbDNZKBg==
X-CSE-MsgGUID: K0NyzMVpTzCY/jpRV1kVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217993392"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 06:56:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 06:56:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 06:56:29 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 06:56:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/JfvH4FYlw6dIprrMRX0uzpMJnemdI+GfE+ikdLi8ZG4AAGB0lINF5v/g4Lf9QWwDjEMYvGb02S4VGQ6ZADF+FfvtPe4NpADZ1QqPRLQbE+lIoTWFSX6nCQAcM/2CL6UCreAL+mMDJAiC5iUuRc6kKP65QrIFLHnNzu0kufY2Zw7rd/76Nwpu2TK8EgEd7iyyzTIhOccmv9TsR8Ff05M4gLD2LRaGANYFUacboAylkxOguJtuRPjHFXlhHctVMF++r24CE5ajlrKSu/k2ZBwlh/h8/eprwVvp2Bd2quaX8+Gi3OOxN5Fl6c4gejFrb5nr3zC++syQ0HateguAy51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLRrvFDjMyutzDOeKVJWZUgV38lGgZUTSnlvgNWp5fA=;
 b=PXvOIINNDwb6ejgiJupHUDrJnYvJ5rbniAfAhB15gqaYN1kNSe3jaStr1ZgHpIJqEcgQuUERuU6qObsqwCoGO1QPFL1bsiy6t3w4HxOdoxG/B5NA0TonCAEN5U7ee1XFh/fJ+vjOKXpHd/olA44FSCl50AeCyz4HnS9xZ0xT+er0I2i5/edZN5yuDXlv0FOl0knueFdjKaVR3OV+kRQgHXPv0NvntBUKxT38BC0pOP4nZ7cLtnmBlOAIjNy37JqrHvdTqRl6QU9A93pQDC2qsBS0jYxHblXummYTUNCqNBlu8MfIFWGMNSspGHEeXmU75InLZCkHq88Jw3bGadPEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by BY1PR11MB8077.namprd11.prod.outlook.com (2603:10b6:a03:527::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:56:26 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9654.014; Tue, 3 Mar 2026
 14:56:26 +0000
Message-ID: <d99df782-2a3c-4189-975a-a39d0d2fbf6f@intel.com>
Date: Tue, 3 Mar 2026 20:26:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 0/5] Extend compute userenv to support user
 passed buffers
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>
References: <20260303134706.41948-7-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260303134706.41948-7-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::10) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|BY1PR11MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: 348af5c8-2f90-4b18-f166-08de79350b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: g3cniRYfxCKqihQlTzjd7gddwxWAXttt5rZhKOoAsimLiS2pe+pei0eR9R85iCKGyQMOIPo8d3MdaDQWWZ8hEjbL7agBt8YKNAhXD30n77mb/jfHGfVgGkPcn9CzbjM8bpa6TQTj6uU3qw09ra3NJ7pef7q3m1JU+zg0p9j40h2PujghVBnMYOLFxoDRkj+KhsVgusbaG+kAaVUJYMpJ3X1CWTeAHRxn2zdTy5w3H1kYX8i226fucUf9DISmzKQXIWgkRpLFYE8RmLgLjyKChEVt4GThxmi5SEk8sBvRCsw4m/DAuSp4V/1PALFvSIW83D8sn9xa6asm+3uGsoneKsyzVhIT734pAL74E3uArE3P2uMeGcROSwcL+9L2BFUHxaio/NGfJEP9QbaofL7sAsEdAI6w4B+0QlNnDI2g/fSIrOaaQ3J3lWIN1UlIkWPT7dCKG2E+v7H4sXLoGXT7wKVqWcOEeaVGKKKuTlJtu3esPxRo5bPMnPVAOpl2O3vZHiy9GTMXLrPGsUOOQqtLKizdReCXR6Q0myEmltD/81Imm3hcxxxyK+EAPUYKePhPiLg1SAv8UiL+bDJxbZB1EzrfSIYl0sMCEtrnR+4Q6IpBaC6Z4kfZUNzeaKWMgnwwxmIxFiuo5mkAzIfV+I5ecLiQ009Dzm4EpGdsI0KkQmjQV1TlZ0OWNgobFj9YnG3Vg2XhnCIpB/bZNMoACUpdlEn6Zo6apIOt7Yq8JgyolVc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODkrM3pTRWFCNWJCTWFqRFJUb21CS1FGR0tWUHdHLzZ2d1loaDRxMFJLdDdB?=
 =?utf-8?B?UVpxYlhySW0ybFV4UVJGVWR0NkNjVVNJMDRUcGRHbkFZQWx4MkVvUnVGelNQ?=
 =?utf-8?B?N2c0MVNHaEdRWkZNY3N1bVNPUlZlY20zOW8waElxWlpSNUhyZEZKMDBoZnZh?=
 =?utf-8?B?NVdXZkJtSER6YmNFby91THZsQVZ4cGtRbEJIamJNUjRiYWdOTlVjbzIvMDYy?=
 =?utf-8?B?dVh1UWVSOWxvaDFsT25yaWJPaUYxR1hyZmwvTy9nSzdiRkh3LzZKdGsyZVVq?=
 =?utf-8?B?M0hwcWJ6ckxRdmxIdHB2UkwvYXlPelp4WmhRc2JXL2hkZlBUaEVZS2JESDRi?=
 =?utf-8?B?TnNReFQ4RTBHN2lVZE9rWmJtUTVYdEZQWENFdnNRb1FvQlR2WDZjN1IyKy9S?=
 =?utf-8?B?ZkhjbmxKcExJRk1KN3JpMlFBQmZZcTQ4T3B1N3MxT0NMZVhVU1VUSFdwQU9q?=
 =?utf-8?B?c1psd2xzSU9XL3ZVamxXTHNBVWJrOTlYYUkrM0xJQjVRczMxYTl2RWQ5S3JY?=
 =?utf-8?B?eWZJL1BIZHBLUkc4UmJORDFTblkxNkVKWC9LRjFKNitwL1BuS0VSa2JNa0ox?=
 =?utf-8?B?UzZ2TVNqRG53UDVBbkdDM0ZUR0d6WFo2MnJDRTRyR3JMZFREcnpNbW5LNU1k?=
 =?utf-8?B?MEJKQW1oZTBUQzJicDNlWWVmUGJUUTBMTlhNZG5wb1ZZRklUcnZnT01RZS9U?=
 =?utf-8?B?Rkx3aTNuSGdZNWJ2dmYvaWVZL1ArT0hlRStFNG1jOXdocWRra2w1aVUrQkhk?=
 =?utf-8?B?aHBsbGd1b2VwY21kZG9Nb2hxOFBqbDMrNUhHZnMzaUxJV1l4Vm9QMkRGbG9P?=
 =?utf-8?B?ZXZlcVEzZUtHRUJIV2g4dWwybFdhWFRYTDlNQTUvQTBhOFdrYTFSTWNMQTBw?=
 =?utf-8?B?U3VPMmxCSFhCMlRzMDQzUkRrMFlYb01YY29Fc0psTU9OL3dxT1lMTjBrbWxC?=
 =?utf-8?B?M25nQlVvVUtuK2c4dmZsMkxvK3ZRYTJPV3Y0RWlBSWNleTJ0TmFwK2I1WXNM?=
 =?utf-8?B?L2tMaU83anAyaU5XVy9KWGdQVTc4a1NhUjBkUFhuR0xkcnBpR0dsK3pxWkp3?=
 =?utf-8?B?OFk0bC9Ra1hEQmYrSHlNZzdXNng3NUFYNkhKUWlpQmRwVzhTa0NkS2ZZRVRl?=
 =?utf-8?B?b0JFaGc3aHdFeFhvVXJXdjVLQ0w3cXdGWWtkWFNIdkJyZDlTbXBNdDdkVDFW?=
 =?utf-8?B?bHZuMmszeWVueEVPV3lZTzJXYnVMK3NkSGMyVmxuMm1WcFB6aHQyNWFZcmsv?=
 =?utf-8?B?Mi9QYzhCQjhNQ2h5Z29idFhJTzZlOE04aDZpVEhIK0lnRHVSTkxZbEdNT05N?=
 =?utf-8?B?UmxDVVFPRkR4aVlpRUhTUzVJZ0pmc0k5TUo1NXpZVDNucStMSVVHc2xJNUJ3?=
 =?utf-8?B?UXBZSEdvTEhvZUc5YXIxazByNm1ORTdPWHAyM3RuU1ZlQ29Ob0IrUkRzNXl1?=
 =?utf-8?B?cjNBL1RrSkNQeXgzM3h4NXlFRFpWbURnWndNSjYvKyt6bFVHOHF5WE9qRWpY?=
 =?utf-8?B?Q2NuU1g3cUFKOW1vVmltK0d1MzJyTzdlNTdEME5SNXI0NGRacEdJNE55eTNj?=
 =?utf-8?B?N3c2S1NGSTh4ZVJjNkY3a3lMMjliM2pXTTVVZjZmajd3a2szVitCUFgxb3Rs?=
 =?utf-8?B?d0ZKOGNlOHFDOGQxUlp6akQ3ZXVDTTRUQjdBSUgyMFpTUEt4SkhlUFpZR3F1?=
 =?utf-8?B?bGNPUHhmOU5MQUlRTStzc3lkc3hIWG5UcUVEb3NYMmpsNHN2RlhqTzA5WjZ6?=
 =?utf-8?B?MFhRaUV4ZlAyMDloVEx5bGR3RU42c0NmR3hTMUFpbU9OQzdvN1hTa1NHc2lM?=
 =?utf-8?B?ZnBqVEhyVjdUcFlyc0F5bERSSHNXRFVta01Yb0gydlB6S0srY2Zqb2pwcUVH?=
 =?utf-8?B?UVY2cnRXeHdCTDBlZkhaSlhvd01yb0ZNc0g5eEtxU3hEenM0OTNLQ1BVcHY3?=
 =?utf-8?B?RUdRMEMrU3NYb0pKQXRodzZyV3JpWjNwSmRmc0lGdTI4YWpDRmlNUWpJeGkz?=
 =?utf-8?B?YUg5V0VDazBZbjV4UG5GNkRHdHNqZFNxZmVEMFlJSitIS0tvbEU3WGlIa2Uy?=
 =?utf-8?B?Tlp5Rkt4SWxYL0ZtL0lsSGxZZVRZcXBESG5Da1FESWQyQnAwVEpxU3NCdUlS?=
 =?utf-8?B?eG8vN3UxcEFVK3VTSU5wTmtaSnE0VW56Z1JZbDk3azBSTy90OFVydlFHTzFW?=
 =?utf-8?B?NmRRUWRIakl4cXNYaXVDd1FDUFNCVkUzcHZidGw1bytJMm1TbWZjS2lpUDU5?=
 =?utf-8?B?aDZYN2orOHRKWlJRdDQzeDhYMWdvaFpHdjA5S0VEV3M5VXFNdXJpMEpzRGJK?=
 =?utf-8?B?NHBsVGVUR3dzUHhmSFVXc09rZHYwNE5kYUVNbHNIVnQyYmZBYmdLczBsNVp0?=
 =?utf-8?Q?m/3jUmdk4T5+nNJk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 348af5c8-2f90-4b18-f166-08de79350b0a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:56:26.1751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlcxrAhjGFdBl+3ZqxOqPBjNrUyP+S2uH0gtLyCsDOEVT48D4+0J+gb0qS1IMOzRLsBTm1pxlpmlGVuwcMSfWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8077
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

Hi,

Can we have description like:
This patch series enhances the compute test coverage in IGT by 
introducing new subtests for compute workload.

The new subtests exercise various buffer allocation and mapping 
strategies, including classic buffer objects (BOs),

user environment (userenv) buffers, and system-allocated (SVM) buffers.

Otherwise LGTM

Acked-by: Nishit Sharma <nishit.sharma@intel.com>

On 3/3/2026 7:17 PM, Zbigniew Kempczyński wrote:
> Add support for user passed buffers in compute userenv. This allows
> users to pass their own input and output buffers to compute tests, which
> can be useful for testing specific scenarios.
>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
>
> Zbigniew Kempczyński (4):
>    lib/intel_compute: Add types for input and output buffers
>    lib/intel_compute: Extend userenv by adding input and output bos
>    lib/intel_compute: Use user offsets and loop size if provided
>    tests/xe_compute: Exercise user passed buffers
>    tests/xe_compute: Use appropriate feature in compute-square tests
>
>   lib/intel_compute.c      | 191 ++++++++++++++++++++++++++++-----------
>   lib/intel_compute.h      |   4 +
>   tests/intel/xe_compute.c | 154 ++++++++++++++++++++++++++++++-
>   3 files changed, 294 insertions(+), 55 deletions(-)
>
