Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FA9C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 07:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F72410E33E;
	Mon, 19 May 2025 07:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X31Kk2A7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEEB10E301
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747641421; x=1779177421;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uWvitUsEN828o/TSEOrtAA1x5clcINRmTOZbhPId+Sc=;
 b=X31Kk2A7CQsSaQ37w0v3eudwTu+4/Da6bO+Axh8NgIhm2W7mQjQ5BeHo
 kwHXATJbxUvJZrsG93s/HkXyu1zcZWZIef81RHaCgNmrsnRozhSD/afxb
 Ynw2dOXk7xvgB9bCKWFPqWRAelK7ysH9+nBb06co4JDuCyV/XNNu1i44M
 st77A29z4M+n5XSCq0/zyEug3yrybGecT6jnBtNq1IfBynRfxt941CzAV
 RCKPt80a3m2x4DdfvBWaMnMBMjTOp5TtmoRef22ZvnUTPuO2TAYqHKR5A
 rDjeA9FOovJLvQ4V4ZXl7hGfl5u9n+4SsNrWY3HR/7fNowMDmewelnS3d w==;
X-CSE-ConnectionGUID: GwjrJVxCSqulA1Pfwg02lg==
X-CSE-MsgGUID: eHIM+XJnS0aoLzDamzuDlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="52161999"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="52161999"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 00:57:00 -0700
X-CSE-ConnectionGUID: O1Rg+YtjQA67Cp0dulxvjA==
X-CSE-MsgGUID: pkijY0fKTpmfP28N2IYcCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139203755"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 00:57:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 00:56:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 00:56:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 00:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekobrX9f8MKdrsbvDxnzTpkoXpFA3wMquS+EFBRTJGdZqHCfU2qPVdfWOoK53Y0liZLc2Ccyl1JxWVP07WDlJufSzgFcLCvvXYawyBQaymSFDiONfBVDeWwC9P5JD1DNu6H3d5NbmqK3cFqcYE1q/hWHamr/3KKOjbuOZ8HJCCwf6ZPYPBrIqRsHFmbHzRIUyZr37Xol3feOVbPogIs2tJRNoB24SBE9f60m5TGnU1DRVabvHqS4sjXreJcjR40kWbdNyyCiiF2C4sGbkHVn0Ka+ZCTRLrPSUzm/c6Zb6sSoFvxT7UAh3JepOT56RZAc1OpuycAvGfnbw5atIRAQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2F5LDXCGLrg9cP3b2kSsptMM14V9XI3JNbXbZS6y1E=;
 b=aYjCUe3D9zQn871obh1TPZcKN+Qu28bMpNjHH3/qqdxreIoBdZiMB5a5iW95vceR0sCw/dY7Th64yH3mFODli98jWbscKIDLz+dKiYK3Qy1i0XJugDN9mk2OuhXHtLfzLxEFte2S9Rw256o/j01ldEkivfpa9ZXafrkNmAUx9eYofzSrWboV3guSeUawS9n8ZAygdqtfnHEtNTLM/tcBWDfFB5wrf0/8aPNaAAy9p44HFSQ1FEQYfhOCvSAyhjy1CMybpY1ZVhiEqyQskNyx2u9/CjOHRvZTrN449obESJfwmPCRautwH2NXZ9Hi0R4xs1zl1qPZIHFzgBjosAFrpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 07:56:57 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 07:56:57 +0000
Date: Mon, 19 May 2025 09:56:54 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 02/15] tests/xe_render_copy: change width and pitch
 to be in valid range
Message-ID: <aCrkRgnUc2yXfuFz@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513185811.897232-3-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU6P191CA0070.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::18) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d09927d-a320-4e3a-7dde-08dd96aabaa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWxncllHdWJxMmNHUXE0VlYvM0F6Z1cwQkNIN0RTd2VOQ1VIK0w5TWNEMmow?=
 =?utf-8?B?Yjc5MVdSMytNSWcxbUxwdXk1UUExV3Y4QTZ1bHAxTVdIZmpsRk9VK2h0STFs?=
 =?utf-8?B?dHplbG1nNHozVGNWdFcxWk41dm0vMlZneG42WTI2TlNtY2kzRCtJbzhCcGRT?=
 =?utf-8?B?T0MvMFhlQVpLdndQQTRMOFgvUjlPZzZ3enc0M3F6bUVqTUgyb1kyMWdiTVFU?=
 =?utf-8?B?U0luOVVYZFA0ZWZMV3V6MmF6MHo3Q1kvWUhQTVhoVUdtZmdxcGFzN2dTUEFL?=
 =?utf-8?B?WS91WFI0QTJROGQwSUdtQVRkK2VGL3RrUU9JaXovdzduM0g5ZS9XeXZYc2RN?=
 =?utf-8?B?dC94U2FOOHdWRVRhZWtFYkVsWlA2Z0MyWGFBbExNek5WWUs3S3kwSmZGcGlU?=
 =?utf-8?B?YnVUMEpKNnZZK1YwQ3RlYlJpUzRxM2s4Qkt5RTdoRjd5V0kxTDFhVlZXdTNQ?=
 =?utf-8?B?NENPc2ZCamx6U2RMQ2c3OHpGdFhNTWpjU1RVSmRzYWxWREN3bkhwVnJLaVZK?=
 =?utf-8?B?bllEU0sybWMrdjVvQzlQdVVPZWdKWWlSdnRUcXpKdTJRZTdRSmUzMWU5QnlZ?=
 =?utf-8?B?TzNkNWNrQ3lZamwyRTRCQnZweFd1eHZYY1FGUHNtdG9yMGRKWUthNkQrWngy?=
 =?utf-8?B?ZUxIWVp1ZkJhUEU4Q3pHNU5zTjZmTGdCMFZJTEFwYWlERHFqWVBGUll6am5s?=
 =?utf-8?B?cFFxc2hneVZ6M3pDbTFBL0pDcTdiMHRYY0p6eXlRL3pIRmlLU05kTTNjYnp5?=
 =?utf-8?B?WXNaQldHQnZPZE8vQXQvS0hQdWdQRUlYUzZaYjB6Z1hKaTl4WnRtdC9VM2Uw?=
 =?utf-8?B?Qlk5ekErM2JJWFJMbXI0Um5sZlZvYmZlTHQySjNKYzN2bmtMSzFkWVpQRG1W?=
 =?utf-8?B?V0NmRmRQa3NpZ2ZnQndrNEtoNi9iQ2xOdWcrOFRMS29zdmtSNjVUcGYzVEEy?=
 =?utf-8?B?TXJwVE1yOENOUE4veGV0cW9ITlQ0Q1hscDBuMmEvMEkwTXduckVzRHE0SnNG?=
 =?utf-8?B?TGRNb3hNZm1OanR3NFQ3YWlkQ3RtZGJuVU5CYTZpeUgybFdZZ3hGYnJrNFBW?=
 =?utf-8?B?NFlnNEpDcW53eFdSZHNFY2dwa2NJU1plb2JoNGZJSDcwclVROTYyUFh6NGd4?=
 =?utf-8?B?UFJSVHZpenBuZ2hqeWU0N1hDSEF1MTcxVVlkUEZMVVlZZDNlbkdJMDhsTXZz?=
 =?utf-8?B?S0o1NEhuZ1gvNk1EclVGalAxdCtHTzVjR3E4NE5oUGttN3VjbU1GUDRsMllH?=
 =?utf-8?B?d21DWldXK2xhNXFnRnZMUkJhZHcrVUp3STkyN2c4NTFrV2JRY2ZnemFuZGdQ?=
 =?utf-8?B?TU5haG9Ec0pYUFBXNXJ4U21iYU9WQjFUcDJyaTRCeHhFMXRscFlrQUdEU09O?=
 =?utf-8?B?MmRqYjF5enVZUGRmckFvVGxYSnFDWjdyeWVrQ0NFRklBMGRLamordEcrVDZ2?=
 =?utf-8?B?VDdEV21lOEJGLzdkZHlnNVRKR1hYbEIyZGdLWHYxTVR0ek54U2NWLytxT1Zl?=
 =?utf-8?B?NVUzZXlscVhNUzNVZlRFKzU5UmdsQjNLdzZaL0wxS2VjY1ZvcHhwVnZRblJI?=
 =?utf-8?B?V0lZS0MvblJxbk1va3VqRkx0dC9keWo2K0lXTm5XR3BFZlZ2NDFMekFMZ2Vk?=
 =?utf-8?B?NkxnYXlNd0o4OUFzUUdKdVp4Z09TL3cwWlZJSTM4OE54NWJwVFk5UjZ5by9n?=
 =?utf-8?B?ank2NDc2V2E5T2lydjZabmRqK0Q2NHdtdnBwOVV6azI2S2dadGFVdFBXUVJH?=
 =?utf-8?B?SWRvQ0EwU2U0S3R3SWpWdXdJU3ZTc01kQmMwellCZCtUdVlTanVBVWhJWTVT?=
 =?utf-8?B?c0dyby9tMW9FSXhWSmptbHB0Nml5S0NwdXQ3b0ROV093Z1NnQ2tja0ppNXpO?=
 =?utf-8?B?eCtXdmRWRGhoaWYwVFNwRVdkcDdvc1ZCd0ZidTBqVnJQcjRRMUNaZVJzSGsv?=
 =?utf-8?Q?RcIk28DERyI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlV3RDd5TzNxTXIrdDFzQkZQcnBuZTBJemdGZVIxaHdjRWRYUG1wdzdVaVpY?=
 =?utf-8?B?L0tLT25XK1hvNGVVWnRXaTBjZmNvR1plZ0ZCa3NiSFNLNERQM0dGdDlza0FV?=
 =?utf-8?B?bmlJb04veUVid0RZalpEakxHelZoU3IrMDY0WFNpMkhydHljcmZBNXlvVzF4?=
 =?utf-8?B?QmtlK3B2N2ZUSzJ5SEdTQzNSN0Fla05vOWRzNHdZR2paQ0FNYlBZSWJ6UTNx?=
 =?utf-8?B?c0Z1NHJwVXdTREJPcG1Eb001TE1YTlJFSGpzdW5hSVBsc1RzeENkNGtlWDM5?=
 =?utf-8?B?M21jMzNzTWVxYlVwMjF2SEpTNTlySnl5MmprZ005a3U5bHMxUkRUZlVTcTJV?=
 =?utf-8?B?eEM2NlExR1YxVHNDc3NOQ21uOHgrMTdvTjRZdEF6TmxwTFk5TUVIMHc4c3NG?=
 =?utf-8?B?OXRaemMwZzV3YUlFNkVhRGhrcnQ3UmZveEdVQ2VzR2liSHlJTURySDd6eFhY?=
 =?utf-8?B?L05ZZjBEVFNyYWIxTmluckpxYlZqNDVCQjA2VDNtUHNxMTllOXltU3hucTdS?=
 =?utf-8?B?Z2M0UUpHL0l0alJZcWZnVkNuMEpqcjNPaEF5dDRNTkxnNGlQZnl3RzdyemRj?=
 =?utf-8?B?aVVnYllaZEJIbXdkQWFVRjF1djVFSXAveElWd3EvSlcxM0pnakdOeXFxeGF5?=
 =?utf-8?B?ZlN5TXI5NE9wTUlHT3NJZmtXRThYWmh3UXhFemJsbDBnWE9UL2wwMkJ3YVg5?=
 =?utf-8?B?dUdja3JqdVhUZTdnZWZYS2h4Z2pPWjVtdXRNbmVXVy9lckhGRk43cG9vTWtK?=
 =?utf-8?B?bWZ5c25BL241akZ4bWROSW5COVdaaERmcElFbVVNOWJSWHRIdDFQY21Ic2sy?=
 =?utf-8?B?bmZ4V0FGc3ZkeXlVYXlnbzVZZGVXYWxCNVdVQWxscXVuWDZ2eWtFeWE0UmR0?=
 =?utf-8?B?OENDcVJ0UWFBQ2l1WWRhc3JtUWZ2MXIxN1I2MjJQK1hJb3JJc0N6VElpeWVM?=
 =?utf-8?B?T081cGczcjY5UnY0Z0NHSzhOT0NVSFpIYXdzU21vczNWektXTXQrWE12Y2ZF?=
 =?utf-8?B?alVpYXVLZllVY2QrM2pOaEdJUHN4MDE2Q0ltMENPYkFibHg2bjNWcXltYWlP?=
 =?utf-8?B?dHpSNVJ5UmpvV1JkLzZiZTFjMjlHMG9yR1RuT2llUEhVYndMY3R6Z1U5SkRQ?=
 =?utf-8?B?b3d5cmk1WWdEc0NiYzBHYXFMRnBVSVA4TGdpYWZzQ0J3MFZCZlVjUU5XSFFy?=
 =?utf-8?B?YnlPMXZzMFhXKy9oTWV1amFkdmo4Q3hXTGdYRUxmU25PS0NJZ05vNkxOL1FT?=
 =?utf-8?B?aVpBT3JmVzVWZ2ovdURveU90NGZXL1RXbWhlcjNXeURtcGRuUkxXVTlFaTZP?=
 =?utf-8?B?RVU2Q0UzdHZ0K043N0tZaVJNRGh2RWRIWWtFdXRqeXh0UDZHWThLQlg2Umdp?=
 =?utf-8?B?RkdlQXE2eDZVQUFRdWQ0cFkwVnU3bGVONit6ZVV1RVpidktidjFIY1NQelJI?=
 =?utf-8?B?emR3WmtHYy9aVkFtUTVPeDJhQVE0bWF3NzBqU1pOQlpZQmNRcUNqSm5ycDZq?=
 =?utf-8?B?K1hwZ1pWMWJ4VkgxWVh4dHVHK1A4VlYzTExFMFBPU1JMei9JNG9BeWQzckZM?=
 =?utf-8?B?Vnk0K0h3K09kQWZHbm52cE9PWVg2M1pNREZURjQzUmdITnJnVUFGZmJqRlpT?=
 =?utf-8?B?WDY1K0t2dVFpRVNQY0x3NFZUNGJ1YjJaYzlrTTEydXBKWWszZHdqU1Z2cDF5?=
 =?utf-8?B?ZFk3c21YNTAvbHZPa3NIeVdjUXdLNmlrOE5USnJRdjVsQy9MbW9adXlVdUg5?=
 =?utf-8?B?Q21DQTczVmlkZk1QWHVtL2V1TEVNV1NuWmx1b2hhRm9QaWVTY21MSzltVVkv?=
 =?utf-8?B?VTUzZHdKeVhnRW9PZlhyUmFDWm5iZGxPVVgxV2g3aS83QW5DQ2pHc1dWYUJG?=
 =?utf-8?B?bThHYWFmNVg3cVdkbFZRN0JoQVJCbno4MVNoTFpRbHhBazdQblVRLy9UeWZm?=
 =?utf-8?B?cFd2b3RZdUM5MVVONFU5dmZyRFlSVWdSMnZrRWJiNDYvOFFkc29leis5OWJ4?=
 =?utf-8?B?MU8wQUt6cEd4cmVBdEl3VVpRbEJTUXNPRUNvUW9LMUxXOVcvUG8wakJLc1lC?=
 =?utf-8?B?TlcwUm55NVNIZlRaVy9BNlJBbFQxRDJrd3lIdnhMU1FmbENWaGxTSXdnclhD?=
 =?utf-8?B?V0RLWVlDbjJiQkxRcFQxYjRDd2xWZjQrVFhETTRVb0hwaXJSKzRWeHJFOXh6?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d09927d-a320-4e3a-7dde-08dd96aabaa9
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 07:56:57.7851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igcPS/LO92k/buG8aaKbPwbLc2on/ye0x3VCSGF6VHjGwJDm1Q93dYtzzgQLBlUNAqk0+a2KSPFcAC1WbmeeoeJYvl8NiSIbcuCZ7zBfsus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
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

On Tue, May 13, 2025 at 08:57:57PM +0200, Zbigniew Kempczyński wrote:
> For mem-copy (byte mode) width and pitch must be lesser or equal 256K.
> Limit them, avoiding setting inappropriate bits in mem-copy operation.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_render_copy.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index fadfd162ce..9f16537c1e 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -445,7 +445,7 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
>  			  uint64_t ahnd, uint32_t region, struct xe_spin **spin,
>  			  pthread_mutex_t *lock_init_spin)
>  {
> -	uint32_t copy_size = SZ_4M;
> +	uint32_t copy_size = SZ_256K;
>  	/* Keep below 5 s timeout */
>  	uint64_t duration_ns = NSEC_PER_SEC * 4.5;
>  	intel_ctx_t *ctx;
> @@ -468,10 +468,10 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
>  	/* Create source and destination objects used for the copy */
>  	src_handle = xe_bo_create(fd, 0, copy_size, region, 0);
>  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
> -	blt_set_mem_object(mem_copy.src, src_handle, copy_size, 0, width, height, region,
> +	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
>  			   M_LINEAR, COMPRESSION_DISABLED);
> -	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, 0, width, height, region,
> +	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
>  			   M_LINEAR, COMPRESSION_DISABLED);
>  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
> -- 
> 2.43.0
> 
