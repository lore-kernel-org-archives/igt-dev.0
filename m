Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A2CC3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 23:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C887410E5D5;
	Tue, 20 May 2025 23:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzRbhAd7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A232010E5D2
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 23:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747783424; x=1779319424;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d8ynD+FUGOFlcI+B6+qOc9VfM6FocJaR7LlrZaEMsuI=;
 b=KzRbhAd7q6uV+Wo+dNb718cMNtIz1BllpwJCbndlEUhLdAUp4BZd2FzP
 Y1fpdX9ZliVNj56Je2Z0FKgLxFDnbTLzALGfkeGQSTYZy/du0Y0Q2qRnw
 BiYmLb8ICJPygzrA8EjbrCX1TkKCzu/4NiwgYVirn24pTvYDk7skWK5pl
 +eh14xi92HG7wZkDcw9kdVvnVkKEMYxKP+ag4MABxcDT0t7FtWBUmzDl4
 g9vQB4Kc47rR2lOI7i2Eb6BcBhEvqJHy2HFEeQyyTjmlZzR3/0bOSHAl8
 rAQmnWx9z9TxLCxO4XqtBQBOCr5q+NA8NIvv8QAqdY6vvfhmSF9oo1OWJ A==;
X-CSE-ConnectionGUID: bvMDPbHqTHWkk1l3HAdPVQ==
X-CSE-MsgGUID: 16fIC6lTRQmExs3yDnjYew==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49875831"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49875831"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:23:43 -0700
X-CSE-ConnectionGUID: Qr+p9ylsRaK6Cegu9Zme7g==
X-CSE-MsgGUID: LwnrKonVTH+wLHtS367+bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139745035"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:23:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 16:23:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 16:23:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 16:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+jF1QVq/IWPpJ3LCByW0gkmRnCDS5SC9k6V5NC/MacvrfDGUph+Ip3wr7ESvdf6xIvvg+sjkSdBaAKNwlmeJ0z8r5VR0YBqT2NJ+KjZ9gKiyxPGpHJT4n6P0aqYUkyiMvUcr8NQqSb6mhiEUFLElBTVcx7K+7T64wjyANTifY/BPNZ8IteoYgX3/RYYgUzj7JQ5OQD1K3z6kMtL9S6zfb4fxivUIO7e+hJUolfpCOyvrFQAof077Kz6FD080cH9oDJPLs74uGaNGEVdWgZ6wVdyOluw/surX6V2+SDk/jhAojv5Dk1O7X9nh73pYcswXYPjtAWUoTHvL9h0l53D3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MapmwWvRq7rrkywFco4LFfYbZMCJMEZ1eaQTDJAllRU=;
 b=XDL81Y6I5DRwIl+e10U9BBGTcwIeiv8ScjD/us8JHzRXbxdrz2epzQsWQSCYDzYeXIB/0FJJEduTS79gxbrUVmXEE0An/qVdao3kAnsgWxJnAnqk1jTUE4qbCOU519DJQOlKyusjp3xDoICqmAmxpVTmMVCWxFerlYx+kEaJ3sjNPl7FPe83YUQLcRNI0bBV4CM7w9qW/F57Y8E5VM7l7N/LEs5JDnKu4Zi/0F+RuznzmSMyeYjJl1pqoj2oJSmRXq2STdh+3BFtNBWgrFaNM6RXgBE/j51/DqTxBR38eWFPhLxCpTIrXZ0EyA/Z2r4/TuYs+1ZsiH32FikHnF91jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 23:23:40 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 23:23:40 +0000
Date: Tue, 20 May 2025 16:23:30 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Add test to check for
 active contexts
Message-ID: <aC0O8ikmP6AP6jng@unerlige-desk.amr.corp.intel.com>
References: <20250425192102.1551877-1-umesh.nerlige.ramappa@intel.com>
 <14ccfccf-2d7d-4381-9688-9945ddbd1491@intel.com>
 <cfwmcfrcyfi3l7xmqzkvzsqfqmq6oln2p67kwsqpnxfx2bhjyz@arbemoopbn3q>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <cfwmcfrcyfi3l7xmqzkvzsqfqmq6oln2p67kwsqpnxfx2bhjyz@arbemoopbn3q>
X-ClientProxiedBy: MW4PR04CA0089.namprd04.prod.outlook.com
 (2603:10b6:303:6b::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa3a313-b0cb-4664-0691-08dd97f55a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cER4RDZlRU1wYmwzbVQ3OTNkRXBqdFplVTdCOHdla1NRYS81MkJhZ3Ztd3J2?=
 =?utf-8?B?SCtVNDZqTTRCSDNtZEJiUGdmbUZiQmQwb0VTN2tkbmVRYzZ3NVI1M290Rkxz?=
 =?utf-8?B?Q0FjRzdqczJLT2tGU0RuM1ZOWUduTTdtMmw5S1REb0hZL2RZOEQvN0NIZXBr?=
 =?utf-8?B?Um5SSjQybUh1MUg3eGIxUFJTMlRUM1oydEE1VkZLRFN0eDdhRCtld204aUor?=
 =?utf-8?B?N09EbDFQYTRIMUM5dFBhSGlucnBaMGxjQkxscDJGUHI4ZmU0QXZVZVN6Q1Z0?=
 =?utf-8?B?RVJMalpoNjF1MWRhaGhqRXZqcnNkLzFHajU4ZUUxNjRiaWVYWDBFdjE0c1JQ?=
 =?utf-8?B?SFJyY3Z0cXBqK0JTOEEyYUMyckUzellGTGI0WC9sL1hOYzZrOStoL09BRis5?=
 =?utf-8?B?VGdiQU9hRTJLdzVjQzh4cFZtWmZ5aW1RZ1hGRlg3MStkdW9BdURqc1hsQnk4?=
 =?utf-8?B?U2xHRnRTZVBjMUFNWThPTGVveHovRTRNOGIzcUZnN05tajJEQlRxdEF6cXVm?=
 =?utf-8?B?M3dESzZVQzRCV2dnc0JoVnB3VnZ4dzZhOFpEQ3BKMTliVmZaSlJtM1BmWGVY?=
 =?utf-8?B?U3dzZ0hmVzhPbWN1M0pab0xnRDIrTXdsSmM0aXdJM0l0TFFmZDlLTjBxYitv?=
 =?utf-8?B?aGxPRkZtRzVWcTZGekkxVllWNEE4OFlUQ1FKYlZReWlpOFBNdzQ2ZVI0QitM?=
 =?utf-8?B?VzhOcVUyZnY1UHdBQWJYRi9EeFFmWklSak5Yd2theDlVSHhyNE5GQkZ2ZGMr?=
 =?utf-8?B?OVlCS2ZZa1JnRHM0eGVRRkJGRUR3aUNTK3c0NmtEQzdHQ25jQ2NaVWJMSzRL?=
 =?utf-8?B?d09Rdmp1UmFlM3I1Nlh3a0FOS3NPTVo0bXZ1S1NYc0ZIWnA1Vk41Q2JqeThR?=
 =?utf-8?B?Z0c1dnJzRVRyR3JXVmJCUjdFTjE0NHFjL3Y3MVZlVXpRMTV6blc2QmtMck9w?=
 =?utf-8?B?WHpFd0tFbzJsTzVic2RFUmdrQzZzcVY5MFFFcDllNGtMMXJoNm1jcEVWTTNy?=
 =?utf-8?B?WEJFMXB0d1VyY2dBZjIyU242bEVjU0IrU3RncloxYlNaYk4rM041NjRNU2ts?=
 =?utf-8?B?M3RMbW85bDJacVRjL3o4VXpaZmd3elhmVHd3S2Q3Tk0weDdnYThMdEZzb25Z?=
 =?utf-8?B?S1JScHE2UElpL3ZxREhRcC96QUh3ZFd5M1hkU2c2KzdPTnl3aXlobS9TOW5T?=
 =?utf-8?B?aHNBV0E5Yk1kWk42bEdOTGZHb2RHbkUraWhoRDRaSGdUaHpNS21LUURQd3BL?=
 =?utf-8?B?eElXOGxkY1ZCdEYyWEo1cjZhUUh2dUpIRUpIYndPNXdoaXBncFJwejZnallj?=
 =?utf-8?B?T0o3MmhadHliWDlPSFpIWnQ2cFVwdC81ajEwcW1qRzRHZkFKZnN6TzMzT2FJ?=
 =?utf-8?B?RTJGMU9ONGhzRXZXc1hTSmFndjZWRHkrKzVVT3B5a2U0ajI5RW03d29yTXN4?=
 =?utf-8?B?eGorbFVSaWd0emVWdVRiMTBvRHhNcXgxS2FodG9iVjdONGs3eGJVODAxcU11?=
 =?utf-8?B?bTg4YUNZM2dOSTFMWW13eFdsOU9EdmVDbWdlYmY0NWVXNE8zd1psNDZzMkha?=
 =?utf-8?B?Zm5zWmdsNEJiYVdta2UrZE5yV1VaOHFmeFVyRlErcjRUL0RMK2h3VW1BQ05o?=
 =?utf-8?B?RFFkVkNYaGhBa25BaThXQjhhSThKb3pXOFN6UkpsRDRNZE9hRGxQMjZmSW9z?=
 =?utf-8?B?Z0tFaSt5RTFUVEsxZVZGZ0c5QmFyYisvL1hic2x1OEJPM3J3S0h6VVpnK1Zt?=
 =?utf-8?B?d2lEZ1l4elB6WjdVeWx5eHpmWjNXMDlRSE05QlNYZGhGRlE1aFpaSkpoaC9j?=
 =?utf-8?Q?Hl2bemzz+2PxgAorF2PXmJHNOl8D2i1cggYHU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkZCK0VUWGVKZDBKR3V2THgvcTdGV085dmNwTi8xMGhXY1lSRERaS3VidXRq?=
 =?utf-8?B?RDk3MzZMSmwya2I1LzN3cGRlUWs3a2p0dWl3RTRINy9WaWZEMTUvREZURUNr?=
 =?utf-8?B?QVdaTXdmeTVDQ2VMRVlwVG1Vb3hlRDhNUk8rREZUb0tSWG1kQ1JJNWVOOG9X?=
 =?utf-8?B?aW1wcFFqblhDc292S1Y2T2wzelh5UFJlNGQwRDVlQXk1YW5KOUFNRkwrM0lS?=
 =?utf-8?B?cUZnRG5NdXp3UzhHM1piOGQ2TWcxQlVOUytuQmxZWkdDUFdoWkRva3NpWVc5?=
 =?utf-8?B?QWo5U0ptekVOcStTZDZnczhUdUhqcGZPb2M3OWd5NGYwV2RvZ1I5dVk0cGps?=
 =?utf-8?B?NzdkOHNhSFdIYUEwSVZWVHNicWx6UTRNV2JXYkV6aTFmeGtPcTNCK3BZMTdW?=
 =?utf-8?B?aUFWNytWVnM4Sit3d005NWpaSjh2NDNTd083dkRMOFhIZU9mby9iblA2UTVQ?=
 =?utf-8?B?c1ZNSmJoZTFmNFZDRlI1NlBoUmdyanRLVUZicjFURTNoN0poVE1Zb1VOV1Vr?=
 =?utf-8?B?aE15NG9yMnJJc1JzSTlCUXR4eGFNaXVyUE5SakpYOC9KQUEydTl4c3RScnFO?=
 =?utf-8?B?SWsrcWt3WTRaM3p6aDcxZG1WWTl4ZXM5VXhWNnhBR243TVZRTzkvZTlFd0Va?=
 =?utf-8?B?S0h6KzZMWnZaL2xROG9zN2lGZldHQm1BK2t0OFd3ZXRHcllPRnF0UG04a1BB?=
 =?utf-8?B?QkNlaTNMY1BMNlJMdFZmb3QzNG5kM0RJME9Hd0M5WTFGNmdhU052YW42dDIx?=
 =?utf-8?B?eDVVVHNUT2phak0zZEgzTmIxNldnZ3dzai9tSUk1SnNzZitIUkJ6T2w5RUwx?=
 =?utf-8?B?TkRmRklwY0gxbG45VTYreXBjZGwzdVFvd090MmJaWG9TempPYTZoMjZZOGhB?=
 =?utf-8?B?d0hHNnh2ZnNPbXV4cjY3MnFYMzk5NTkvZW16T1VoZS9IRDI5MW5jOERXWUZy?=
 =?utf-8?B?bDF2VnVXNCt5RFZPdDNmTEViNnk3NzVhdUVVclh5ZjRwOWppU201Y21nODJT?=
 =?utf-8?B?cUJsMC9jdGZUUkRtU2VoSUY1MzNqUEdjZEE0STl4V24vRm5BUjJ2bmtZYlBq?=
 =?utf-8?B?ZWJTQ2svQytiQS9rVDAyeGpDNmc0b0oyS0x4VjNROERvMWlzTnZGcTM2enBR?=
 =?utf-8?B?M01TSEo5c1ZCRTh5Z0pQUGE1UHNPRzluMTNTQVRxdnlWQml3TW5qOVBGRTJW?=
 =?utf-8?B?VEF1UmExSnJFaWhiS1hsMGkyeDNSdDI0OTczSFRyeGxNMVlWTFlNUjNyeCtK?=
 =?utf-8?B?dnR0RjZMVlA5OGVYMXllZzBObTJ3MWJvUzc3cy9qUWJXTU9mYitkcHpUMEdw?=
 =?utf-8?B?VTViQWp1UktodUlyMEJLRHNVNVhuMTZDdVFLSnNLVXlwcEYzVFdoaCswNlp5?=
 =?utf-8?B?Y3NKbGJmVys2YWFjczZOckthNkRMZEdLSEx1ZFNkZVYxdkxhK2xEQmVTN1RU?=
 =?utf-8?B?MHVTRkNmV2svL0ZWbFFEUUxOYWxxQzM0T2Y1MzdYTGd2UEFwZlFjTHVpNXls?=
 =?utf-8?B?MHpoTjVrOG91STBQSEJ6SnRKUEVKdG0yNGpyT3E3b1RDcDdOOWtvaU9uT3hj?=
 =?utf-8?B?eDJjaDJlQXE1NStzZG5Sd3ZvaSs2YmlRMEZadEIvaUs2em04WXU2YXZlbXpB?=
 =?utf-8?B?WWxWUHlHb0l1ODViWnNMdHJmZzhUQm1FOTVQdExVYktDM3dScTV6eFhaNmhs?=
 =?utf-8?B?bW1GQnhxM1JiVWFsclJKU1FzbUNxQXYyU2Z3MXFjaHIvMEFDZGEyL2xaS1E1?=
 =?utf-8?B?SEx1dGxqVkl3K3J3anFCYVRHY0NWV3puSXdjYzQ3QVRGZUVVUWtVOFIxQmRX?=
 =?utf-8?B?Nzgza1lkM0dSMzRSem1VTld3WWRMNXZuVEdnWVE0U3VZOWRndDJzSkFrZ2tH?=
 =?utf-8?B?WlA0VUhRR1VMQTRnWXdmTUpmWlg2NGRSWkFwcWRLNGJwRmVBeGZiSmFFWUp4?=
 =?utf-8?B?dlJiQmxheVU4Zm9URWZVTG5IUTB0SEhvZG9FRXZPd2QzMlpscUNWY0ZhV0ZN?=
 =?utf-8?B?RWUxcFNTSHJydE5HTE5vdUZ2dzhXR0hONFh2M0U1MnVpUGluRkZabEtTYU5L?=
 =?utf-8?B?K3JsU2JienZCR1U1SStNNFpvK1E3b0E3TTcxL240emZsekhTOTZ0TVA3ZFdk?=
 =?utf-8?B?RUs4cEllSjZGYUNhUmExYUkreWQyc3QvSFJlaGRIaEsydVNoejRmOXJQMzBT?=
 =?utf-8?Q?s3ISuLpM6zqUdhy4EN2i/Q4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa3a313-b0cb-4664-0691-08dd97f55a8c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 23:23:40.0313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JBdnYUcB1VWrcftnwfX/VMGG+cp+afc0gN7JwhBMwhostoklF+LLTRayXSlkIyvv5SJehrFcgadJlMzaK2vEBeV7zwBc0E3saFMm0GGW4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
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

On Tue, May 20, 2025 at 04:12:30PM -0500, Lucas De Marchi wrote:
>On Fri, May 16, 2025 at 10:49:37AM +0530, Riana Tauro wrote:
>>Hi Umesh
>>
>>On 4/26/2025 12:51 AM, Umesh Nerlige Ramappa wrote:
>>>Add a test to check if fdinfo returns the correct ticks when querying
>>>utilization for a context that is currently active on the engine.
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>> tests/intel/xe_drm_fdinfo.c | 12 ++++++++++++
>>> 1 file changed, 12 insertions(+)
>>>
>>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>>index 9a8811b4cd2f..73346ee9b1da 100644
>>>--- a/tests/intel/xe_drm_fdinfo.c
>>>+++ b/tests/intel/xe_drm_fdinfo.c
>>>@@ -48,6 +48,9 @@
>>>  * SUBTEST: utilization-single-full-load
>>>  * Description: Check that each engine shows full load
>>>  *
>>>+ * SUBTEST: utilization-single-active-full-load
>>>+ * Description: Check that each engine shows full load when active
>>>+ *
>>>  * SUBTEST: utilization-single-full-load-isolation
>>>  * Description: Check that each engine load does not spill over to other drm clients
>>>  *
>>>@@ -456,6 +459,9 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>>> 	if (flags & TEST_ISOLATION)
>>> 		read_engine_cycles(new_fd, pceu2[1]);
>>>+	if (cork && !cork->ended)
>>>+		xe_cork_sync_end(fd, cork);
>
>wouldn't it be better to add a flag to be explicit about the test
>behavior?

TEST_TRAILING_IDLE is the explicit flag. The only difference is that the 
active utilization implementation came in later. Otherwise the active 
utilization was supposed to be the default.

>
>right now we have the following combinations:
>
>	- 0
>	- TEST_BUSY | TEST_TRAILING_IDLE
>	- TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION
>
>TEST_TRAILING_IDLE is kind of pointless right now as it's actually tied
>to TEST_BUSY. Doesn't make sense without it, does it? So yeah, maybe
>drop the TEST_TRAILING_IDLE flag and add one for this.

I posted these changes here - 
https://patchwork.freedesktop.org/series/149290/

but not seeing a whole lot of benefit from dropping TEST_TRAILING_IDLE 
and replacing it with TEST_WHILE_ACTIVE (if that's what you meant).

>
>I'd call it utilization-single-full-load-while-active. And update the
>doc on top of the function to differentiate them.

I changed the name in the above series, but not sure what 
documentation's needed on top of the function. Do you mean add some 
explanation about the flags?

Thanks,
Umesh
>
>Lucas De Marchi
>
>>>+
>>> 	expected_load = flags & TEST_BUSY ?
>>> 	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
>>>@@ -769,6 +775,12 @@ igt_main
>>> 			utilization_single(xe, hwe, 0);
>>> 	}
>>>+	igt_subtest("utilization-single-active-full-load") {
>>>+		require_engine_utilization_data(xe);
>>>+		xe_for_each_engine(xe, hwe)
>>>+			utilization_single(xe, hwe, TEST_BUSY);
>>>+	}
>>>+
>>the trailing test can be renamed to load-idle and this to full load
>>
>>Test looks good to me
>>
>>Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>>
>>> 	igt_subtest("utilization-single-full-load") {
>>> 		require_engine_utilization_data(xe);
>>> 		xe_for_each_engine(xe, hwe)
