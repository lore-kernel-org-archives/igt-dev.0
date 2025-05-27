Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE27AC54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 12:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9972E10E4A9;
	Tue, 27 May 2025 12:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y22ZzAV7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C777A10E4D9
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748348396; x=1779884396;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NTYrZY4h1y4AuNaXv203Cv8s96OXUitLVtoSO4gy21A=;
 b=Y22ZzAV7K+6BcoqoM5kjFLxBlZjC6Q8DZIAn8b/Cx8Jk2fMr8jWSbrfh
 qwUKNb0QdrG3NXUIEzRJczFqQ16Vyws96kHFGzKUlzBu42i8LZ1kHCYua
 oHawjhSXojAPj+pET+NAvTEtbd8L5lcI1ThTvCp83X6glxO8jVTrm59Sv
 Fqvga5q8tTfkO0B8jzDHnobrhEEJ7PtxtRHCfrGcughnU8ZTumzcBqVUs
 ZVZELOQ7yAGqVOcPYCKsTi9zCZV1wC1CpivM98AItYFshquNEnoWovxEs
 V2hiJoJC2x8uSK9XTBrq0CIGRRPwKOQF3SLL8mQ37fkLSv7KHafbMPceF w==;
X-CSE-ConnectionGUID: TqkJIPbwTCWDTImMP+iWpg==
X-CSE-MsgGUID: H0shcG3iR7+kbKH++09KJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49586401"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49586401"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:19:55 -0700
X-CSE-ConnectionGUID: Y5BiI8B1Qe+Ouht3qZj+zw==
X-CSE-MsgGUID: 1B22H75vRYGTAMBTmrExxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="143402234"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:19:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 05:19:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 05:19:54 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.50)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 05:19:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lh7m/CFvwMhXn6aPml5w8FtPDYaRgyqd7Hf1/WO4WyHhYqKr9/FBrBUCkETKvQ+ZWyXVGmuJGt0P9Lc6Wm35RMY/OGQgJe75udOY3fqXLLG452Y13lKrMKluXrc7vSMNPhaKnji+lNXOtpusOITbMrrJmwe37yARlISWXQ17a56nrOSCZSz9PZLbC17upJkAIWKPNOTPattHPOYBdYl7vgbhvXnVUCq93wEJwqZSGOQ0aaFdb+iB0ZBe15g7IGPFB8aBmsiMwZWC3XWSBU0W32FxFmOvtZWUdHsrAy+U5z9cptEG8QBKh1NDTPShgjKrrvyaIfI+EKh3we8oMCmmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSV98AO53/d45PtREqA/HLO48DidasmupPtiqFmtxNs=;
 b=vUN49JcV8ZYtAN4BbYCOoaRjtRNdcmv9nGGkaHvi9NV/5o2pnt5mUVw4llqeB91Gs6nWL6GGJ9FuS/HnD2eqRWpunHmGIZDuIMEGVDnBNj8D2Hxs8aU1CWWHRR6m9Zlp9xPM1H1itFTdDEk1ujMos4++JcCKrkTaa+TfvOl2XVzTlvrO4wnx9/iD+WxQkpdDRRQ+wdEmkGrw34RB+h1LAmuXFxVeA1y2q1mwj4Mbmry/fSkjN/UIt3CG1/8pbbLWxeLzpXt6qMbrY5btEvziaGlQF/nj/wEy+hglsC0OuIRO2Rr2gwqFd3MGANPfkbSkkvqXGeBICMtb43F90z1J+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 27 May
 2025 12:19:11 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 12:19:11 +0000
Date: Tue, 27 May 2025 14:19:05 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 03/11] lib/intel_cmds_info: add blt_memop_mode
 (byte/page)
Message-ID: <aDWtuUBsgk89DgSU@fdugast-desk>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
 <20250523080126.75295-4-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523080126.75295-4-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::34) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY8PR11MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e3184f-d25f-400e-0a40-08dd9d18affb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFNHeHpWdEo5YXNWWjlLRkZpQURObjZIcE9ZbmEvdkxpTmFLWExnOTdBSFJS?=
 =?utf-8?B?MStxdkcyVmMvQVRSVzBWUHRKa2xaNmtYZDFPMWhYQjBhd3pCVktRVTdjKzU5?=
 =?utf-8?B?aXBxRVNOUjR5RElqbjNYNmtmMWFWR0hxL1FTYVIwV2poTWZtY2Y1cUN1eUdG?=
 =?utf-8?B?U2ZmaGVHMVpOMlIxZG85enNpbS9weWVaUkZMYjh5VTNqTE5yUGpsWnV0Yzhw?=
 =?utf-8?B?azAvS2U0YzhSYlJrVzNPMGFwT29yTTlDTVVKQ0Qvb256VnhKVGhndndlY1ln?=
 =?utf-8?B?dW9JaUg5ZHhUeEdORmVCdTNyN3hwR2xtNWlzWU1jV25FRlAwdlBOUTFkNlFG?=
 =?utf-8?B?a29ob2R1TUJETlA3YnpGZXhpTTd3WituUlZzSVA5TldqZmNETFRoUG1LeXF4?=
 =?utf-8?B?eHFFZVBmdHlGT243b1M5WmxMME40aXlzWXJRdmR5dmEzVi9iQTZoSytlS0hY?=
 =?utf-8?B?Z0txa3VKazBINFlzcjRyVzM4NlVZdTExQVBwQS9aTElUTUNtNlg0eU53RS9M?=
 =?utf-8?B?QlYrLzdxVDlIQ1FiZ1F2RC9zZDA4MW10UE96NFVWamJZZzR3eFlHUGNaa3Mx?=
 =?utf-8?B?RWVkWW96cnZzTEF1MXlYYTN1eHJtRkIxZFU4elo2R0pNcjlpN1Y4ZEk1SlNV?=
 =?utf-8?B?aUVoMVJIL2s3UDFwQURtcml2d014UmJ5VlVualNQc25ub3JUVGtpbkpPZWJ0?=
 =?utf-8?B?S2o2VEF6RWtQN0dFcHZHcDcyZDJBQ24zQ3B4SGVwZnJENFZoVjA3cG1XNmtz?=
 =?utf-8?B?dmlkM25rdGJQVFB1WTExNHIrQkZWTnRkaEdYSW1WbGxiVUpxS2tLTFVlN2hP?=
 =?utf-8?B?RDhNbE9MaVFrVGhCcVBtNE05dEZYMC9zZDNudHMzcndHa2tpMUxhaWs1QStt?=
 =?utf-8?B?cUg0dGt6N2tDSDJoVXZyaEJvY2VFL3Y4ZmlpRGxvN3RQVzlDR2hVa200cXVp?=
 =?utf-8?B?ZlNQdDQ5WGpGVm1WZXZLNVlWNCtodGVtc3ZwVWtDUyswekVhTzU2RExmUkNw?=
 =?utf-8?B?NG1zcjBjaThnZU9jSW1WaklGREtlS29yaERFN09PSjVCNDdJNGVrN2lCVGJ2?=
 =?utf-8?B?RVNTSmNSN3RQTEh6VW9GbEw2bGtucW5BeWxWNFFwL0pMSGNqQTAyYk9xLzY4?=
 =?utf-8?B?QzBtOHhqRTUyWm8zdGRyRUE3S1dSOExHYW9sMGZiTkIwd0pscVF4eXF1SGVQ?=
 =?utf-8?B?bTlQYWZnSWMrM1J2MmFYbklCYzB4Q2Y2NUEwNkk2RE14bUYzVTF6MW5ibm5a?=
 =?utf-8?B?b1hVNGlNUVlxVkoyQUEwYkRocHZxbTNzWkYwSHNEVUtYMGxrdUdhSlhHNXFm?=
 =?utf-8?B?dUNrQnpUZjNNMGdTL1FOSzZrUklhUmRjTEtOUWFTbE5zc1NQQVhLNVNzalJU?=
 =?utf-8?B?b0lFeEQwdTZIdE9tWHFyL2Urdk11ZzltbTVUTy9qUFozUkQrYXZpcFVRMllM?=
 =?utf-8?B?VUlOcWc5ZytaaVZtUmRzNjZBVkJUd01QellGM2tWY1kxcjFlOGVlSjlYK0FZ?=
 =?utf-8?B?d1dzbG94cUw3VG54ZTFQQ0JkLzhna2VzalpGRUF3cEVlNWlFSitzamR6V3l0?=
 =?utf-8?B?UVRybUlvcnB3VThXTkMxaUZML0NXbXk1ekdTdVJCV3ZnVlI1aXFYczFmWFRi?=
 =?utf-8?B?UCtTODhyYkt5dmlKbjI5SDhPMEdiZHNZNUVDYXUxMzFPZWdJbzRjckI3Y1Ev?=
 =?utf-8?B?Q3Z0RVBweFJ0RjVrUCsvNHRuMTJkQjdkWFFuT0l4eXhrd0F6dlVSYjlQdDll?=
 =?utf-8?B?Q3d4cWRPVGtnRjNPQ2hTaFRPcEV0TWxpUi9CNXdrcW1PdEhWd0l4OTNtM0Rx?=
 =?utf-8?B?U3pmVDBBSHIvVFdNcjJKK2RUNE1pRDRTVHRUS01mWFY0bFl4OFM0c0tOQ1hD?=
 =?utf-8?B?VXBiQkUyL0V5c2tLb09RMVUxRjQvaUU0WjRsNzFlRmcvVTlFSWpjMG1PQmRq?=
 =?utf-8?Q?h+XTlPMup7c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVQydExnSE9IU01MTmtpc1F6OXhqVEJ2TFBWMlpDWHlhZFNYZlZBRCtMaUZ6?=
 =?utf-8?B?bHVBRnBaUDJVTXN5Rk41ZStYQVV6NGZHL1ZmWnBXQkptbG9sNE9JOGRNdnlQ?=
 =?utf-8?B?TmNYUU4yaVcrOFhDVE9nUldmS1lsclNSbVpWT0s0cVRGb0tqYnZlcFRVSmdo?=
 =?utf-8?B?TC9yTGI5enA3T3NDaHhzMElwOTN1K3p0MU4zYy9JdVY0aUxEWW1za3JLcDdu?=
 =?utf-8?B?TlRoT1BiVmxOMGlDaTB6ajBNdnQxUkdhRkg4QmFlMjBlNzRSYis2YWFZclp4?=
 =?utf-8?B?VlpSaCtCaHFlWEJGZTY1WFVHWW43TXV0bU1BZjMxZHNib2dIc3R0NVgvazFO?=
 =?utf-8?B?czFieTAwMkk3RncvKytvSnZacnRtK2V5TWJXYVIrdDYrNU0yZ1RwUmRNZVVk?=
 =?utf-8?B?MzZXQWhqVllxMEVMR09Mclh0N3NQSml2UlV3Mzd5VWZlc21jcnpwYURLS2NZ?=
 =?utf-8?B?cDZGMFJOZnIzY2NCdWs5OUF2RnozdUswYy82N0RYTER3WmFIZFRrWjRnREFk?=
 =?utf-8?B?OUZpNnhtaThsRkJpSVB5UCs4QTJEWHBEZWxIL0pEazJZTGFRRlo1MFB1THZw?=
 =?utf-8?B?bDZjN0lvVytpOThPcWVSV3dsRU4xa20zUnU4cGJLOEFpQ3JqdTNxaGVuODVV?=
 =?utf-8?B?RlFBdnJGTHlYeitSTlpsQ1dicTRRYS9GNEt2aEEzdWdmU3QwTUVBQTd1WjE2?=
 =?utf-8?B?V25JU2hIME1aMXplcFNxN2dQVllCb0VxdzVsMVRxQWNpaE9xMzdrUFZFYW0r?=
 =?utf-8?B?MHBVbTF5ckszTE92V1lXanduOWlFR1BTcTNVdHpnZ291VnlocmJLNVpxR1B4?=
 =?utf-8?B?amc5SWlrUXlwaUhPK2paNmpwMy9IaWFSaFZJa0JnWm9PTVlIVzlzQXVGek5H?=
 =?utf-8?B?S041THRYdG0wc0MvSzcrMlQvZmNCSnNQUTFUTlE1ekdTWWlhVEx2ZVZRVWo1?=
 =?utf-8?B?Q3RrOE45NDVBTzQ1a1ROSHc5RWhJRytEUWFNWGlBaEZ3V2NGWUo1dTVQNHpT?=
 =?utf-8?B?UkRlQWtWY0RpQURuTWFTeW4rKzNUcW5tVGxjajI2WFRwUVRMWjVVV1JIeUFE?=
 =?utf-8?B?OWFtYzlWVU5wQUc0M25nYzJmQ0pHWE14c0xqbGFiVzZZRWxLOHBDWDdhVklY?=
 =?utf-8?B?Z3Y0ejMxNnY2b3ZKU1ZDamYxWk82bnlxcDNLTERXODhuSForT3I0NUFCRnky?=
 =?utf-8?B?VjlKczJpeDhINW9iUktBTWwwb3FwRjF3d3R0eXJzK0lZbW9Leng0QTVmVUJE?=
 =?utf-8?B?VHk4QjkxQkFiUkVKUVNJR1pXeUhPTG4vclNqVmZSQXR6UCtTOXF1NG80TjVQ?=
 =?utf-8?B?YThzQzNha28vanF3d0hhYTFMOFhVWEZjZjRlODc3UjhvYWtIRGtuSFNvZ09v?=
 =?utf-8?B?MW51ZGUzaUY1ZjV2R0NwMWJ5SEZuV3hkOGEyQ3pkTW11SlV4Y2oxRTBsd2pz?=
 =?utf-8?B?Z3kzb3hVNUtoMlJtVWk3NmJNN2RPT29HSFRGRm1HQUk2ZURER09zMW1zRStl?=
 =?utf-8?B?OXphQ2Rra1lsZnlEM1pTQ1U5bDROc3JHUjBpNkk4NXZFWDlEcERqTWZUWGlJ?=
 =?utf-8?B?NUh4dVM0V01VbGZIK3M2LzBSaGNzNzgvZnBaU1E0KzZNQXV6d3RzWVZmT3NR?=
 =?utf-8?B?ZFN6aHB4YkNXZHBheDVSM3RncnF6U01BOU53UlNHbXJnOWgyWWNabVJYelRw?=
 =?utf-8?B?M2pxRmJYdFBnbmJ5VTViL1lyak1Qc09iUVRUMlpwQkVhcS8zSnFSOENsS25z?=
 =?utf-8?B?VVgvMW1wOURsSlpJMDFaVmZadVByTkRGdjFqcWdjaEQvRHVXR1VOLytGY2Ix?=
 =?utf-8?B?OWJrZ25FVHdmUUZIeXpoYlhkZlQrcVIxeEJoUjZiUjQ1d0ducUFodUZEL3ho?=
 =?utf-8?B?YUVqNXltWmdMNWZLbWJ0alZybndUMVFzMGlYZ0IwcHlEZXdXdnJ1YXpIWFJN?=
 =?utf-8?B?NnNXUW5MajczL2hFdHZXa29jWGFVYlRWUDA0bXdQYmlDSEhoaGs3WnhSNHdW?=
 =?utf-8?B?WEdMdWdUVlFGZ2s3Q0E4T0NGZXBPNW1CZ09oM1Yxamp2YkJtSmZtM2xtQnht?=
 =?utf-8?B?N2ZEZXBtL3ZDZVljSld0MUFiM2NhUVkvUTAwZ1RPeHppYmloRHdjaEpXa1BX?=
 =?utf-8?B?anAxbVNvWU1NcnIxZ1Q3MEVCTHJpZ0taRyt1aE9PeE5Cb084bitleXg3Smxi?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e3184f-d25f-400e-0a40-08dd9d18affb
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 12:19:11.5235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBkMB8vMwejKIQxaihbYO0uQc/IDuqBY5hBZLRx1Ydxyuq7daPfpAFYouKD2tLZ8sCWP/UB0EKjOpLy1IFOeEZcUxgOnQrFkThuhNbPgsAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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

On Fri, May 23, 2025 at 10:01:18AM +0200, Zbigniew Kempczyński wrote:
> Add 'mode' field for further extending in tests. It is used for
> mem-copy linear type which supports copy mode in bytes or pages.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_blt.c             |  3 +++
>  lib/intel_blt.h             |  2 ++
>  lib/intel_cmds_info.h       | 11 +++++++++++
>  tests/intel/xe_copy_basic.c |  2 +-
>  4 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 4c90d157c9..6bfaf09a2b 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1802,18 +1802,21 @@ int blt_fast_copy(int fd,
>   * blt_mem_copy_init:
>   * @fd: drm fd
>   * @mem: structure for initialization
> + * @mode: copy mode - byte or page (256B)
>   * @copy_type: linear or matrix
>   *
>   * Function is zeroing @mem and sets fd and driver fields (INTEL_DRIVER_I915 or
>   * INTEL_DRIVER_XE).
>   */
>  void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
> +		       enum blt_memop_mode mode,
>  		       enum blt_memop_type copy_type)
>  {
>  	memset(mem, 0, sizeof(*mem));
>  
>  	mem->fd = fd;
>  	mem->driver = get_intel_driver(fd);
> +	mem->mode = mode;
>  	mem->copy_type = copy_type;
>  }
>  
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 9efa799881..f2509ab175 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -130,6 +130,7 @@ struct blt_copy_data {
>  struct blt_mem_copy_data {
>  	int fd;
>  	enum intel_driver driver;
> +	enum blt_memop_mode mode;
>  	enum blt_memop_type copy_type;
>  	struct blt_mem_object src;
>  	struct blt_mem_object dst;
> @@ -274,6 +275,7 @@ int blt_fast_copy(int fd,
>  		  const struct blt_copy_data *blt);
>  
>  void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
> +		       enum blt_memop_mode mode,
>  		       enum blt_memop_type copy_type);
>  
>  void blt_mem_set_init(int fd, struct blt_mem_set_data *mem,
> diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> index 88ba892645..17f60ce912 100644
> --- a/lib/intel_cmds_info.h
> +++ b/lib/intel_cmds_info.h
> @@ -30,6 +30,17 @@ enum blt_memop_type {
>  	TYPE_MATRIX,
>  };
>  
> +/**
> + * enum blt_memop_mode - memory operation mode mem-copy.
> + *
> + * Mem-copy with linear type supports mode operation in bytes or pages
> + * (page is 256B chunk).
> + */
> +enum blt_memop_mode {
> +	MODE_BYTE,
> +	MODE_PAGE,
> +};
> +
>  enum blt_cmd_type {
>  	SRC_COPY,
>  	MEM_SET,
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index 5681d4d6ab..f252d29fd4 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -56,7 +56,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  
> -	blt_mem_copy_init(fd, &mem, TYPE_LINEAR);
> +	blt_mem_copy_init(fd, &mem, MODE_BYTE, TYPE_LINEAR);
>  	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
>  			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
> -- 
> 2.43.0
> 
