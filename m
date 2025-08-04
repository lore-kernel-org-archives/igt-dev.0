Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76561C87FDA
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 05:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1032110E2B4;
	Mon,  4 Aug 2025 05:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrGrliUl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A273210E2B4
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 05:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754287175; x=1785823175;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iEsTiTRdcp4RimlVNtGsTOgI8Z4Laz1Y0wX7X3svZuU=;
 b=WrGrliUl4gtlFnSHXHewPbDP67OXRd8jAZ1xQYcqglEI0ZV1OlKHOfiO
 Fp0xdXzkZ6qQvLpbYaErrO/01mMvRQ5nBetHv0AG2JIOuhaHB6dXnhsGh
 PA/qaVwBfDONoijjxWffxXej3cvV5ifGmNMNqhyTwFFYF3bTZW/xNSM8v
 CXhBzaer8seW8CeLmTZC+c8dHYo0EATjdu/Cdh5Qp/UlNbC7xaO3ksXJG
 2cDZTuNe9AFR4pZ4u+MwNHXzyRlR/3rZHNvqBSTnIHIoa4g60VohktNiz
 M9P+j0/i+SiYhSO7+w754ZnkEoMGz0DRRBwmnHiPvbdv6FFV4ZkKR28y8 w==;
X-CSE-ConnectionGUID: s+b8YdNpSYWptIVsR2lr4Q==
X-CSE-MsgGUID: F90+9bTyTNakKnYcZBAqKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56673902"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="56673902"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2025 22:59:34 -0700
X-CSE-ConnectionGUID: 1+5e4rOxT1CXGr9n97wXeA==
X-CSE-MsgGUID: B++hhyaZTjW9VetY7c5NsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="163343242"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2025 22:59:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 3 Aug 2025 22:59:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 3 Aug 2025 22:59:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.86)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 3 Aug 2025 22:59:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nc+QXMk1BR6eoN5FynaAD3W/GFMhrkteMGfE2/K0MZdZuXrEKPnBXlC8uQ9vKoneNnZecCz3ywID6nTCRTIXIieKGoSViLMCYXUgKiUd1ptJYaHBUXkqNSV22OFP5Li7YenKG55ykQcxqpwNtdbh3jmRrIpwQAN7u0IB1fIAjnTNjYQOEd1+tVxCHlIKg3/JXp/S2hKHqYpqLA4dX9CijJUyIRn9ttLrLKt3Z+C+BnTc78lxYMYrYhGEku8vW6aFy5C5U+rABTrAXNiCvPy6VDxeStRzgRTNcs2ZfTYKeQieSbx+KOdEYVq6dGb8Qu1APBRz36HZXavLXOb96mDBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRSxNxf7WgK7ZwsawptvS1LzNw8gIZTcyT6aGkNQhq4=;
 b=LR2dTPVieV0VijxQ0VA3HDRlnpUAnmMd4OlZyEEkgvRW+qFaQ9nBC4OfQodersdu9CpwS+IwKqq3OaNn6Nj00dqvzYpxjfSQL1hx6GeVVVhDWRtnF/g51bHVQ1fSa3gkkbNse2JcqW6Q0fv/n6NhiHxocc6WDOTKA+tMFedoe9nqQf3dKtAHiExm5t8PBAiPg2f/JDnha5Ga8uQFqWf3Xe9/L9i6+J3jvoYahDQkti/5VHzx/Mac17cmCEbGFrT0qfidC7vog6X8QukFCXWOItxBYDfDNgygKM81O++lOcPddzTmzGrahvR+Qy0rj9NbCVlcnO+xAlMEhAKJZme7KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA0PR11MB7257.namprd11.prod.outlook.com
 (2603:10b6:208:43e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 05:59:31 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 05:59:31 +0000
Message-ID: <b0f44763-20c7-45a3-9f5f-26e62a8e21d3@intel.com>
Date: Mon, 4 Aug 2025 11:29:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] tests/intel/xe_exec_system_allocator: Add prefetch
 sections
To: Matthew Brost <matthew.brost@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250714170309.2949211-1-matthew.brost@intel.com>
 <20250714170309.2949211-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250714170309.2949211-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA0PR11MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 20aeb3f5-0f99-4d45-45d1-08ddd31c1424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjQ0V1FpZUQrVXRLSGFQV0hnM0hzNmR6aXhxUDlnMWFIOEZ5ckNNRTBnL3Ur?=
 =?utf-8?B?Ty9XSytFVEsranRMdHpQYVh4VERlRFZOWnlzSXZkZkx6bUQzcWRUcmRpdVdi?=
 =?utf-8?B?Mk4wNlhKRkczSDhrRFlsdnczUkRMdWk0enhMaEZET0VvMFJlQWFwNERGb09R?=
 =?utf-8?B?NWkzTUNPYzZocDhHamdEVlcvVTdZZUxmeWY2Ym9CbHFoaEFScEM1R29DOHV3?=
 =?utf-8?B?SWpobVp1cUJvejY5dk1XUUlGUmd3c3RnL0hwWlNNbVRnMkVvUmlUZWdLc3BE?=
 =?utf-8?B?N3loRWUzbE94RnVDcHU1d0h4K3E2aW1sRDc1Yk5uMjRQdHIzZkNocEJieDlU?=
 =?utf-8?B?TXhrbmd1WDlOOFU0L3RYN1RRVnNCNVdMc1NwMUVwaFZZQUNJY0dDTzQwWjgv?=
 =?utf-8?B?OXZqQkdiSFRFK0pNOHk1VlVENm0wZmpZbTNxRnNaV0JaZnM2VVhoUkI2S1pM?=
 =?utf-8?B?aEgyV3BTVWVFTWZsM0x2K1g1RSsrbkQyNW9yQXZjVXMwbG9aUGRvZlc1amR0?=
 =?utf-8?B?Nlp3RmVrVnZxUVlTMmtpUEJxbzU2ME1EeGJxelgveEh1UFRrR2pEQmFYYnRK?=
 =?utf-8?B?RG5lYWZTSzNEQnhUYnRKN3E1eFJsTVAremFsWHRKRDlxRm9UOFFSRzV0ZnlU?=
 =?utf-8?B?QlBKR3M5b3ZSakxSVTA0MkplK0ZRVVBkekJreEM2dFlXVE1QOHNGYSsyTStN?=
 =?utf-8?B?RVduVHNvL3lSTW90TGdTTjhrVGovUFlCWHRaMGs4OFVrN0RtOUVSOHVDU3Er?=
 =?utf-8?B?NTJiSVFjYlZYV1hqQWIvamlDTzloSm9iU2lXcDBKbGxDQ0FxY0ZHNFE2UE9j?=
 =?utf-8?B?WUZmYmZrMlAzeWdQZlM1Q1ZxMTNlbG0zSE9mU0Y3YWwvME0xNlBrNWhKVDVi?=
 =?utf-8?B?NnRZTzhwQS9rcUc1WUM1M0k2Z3VEa2NYL1VLRkpSRG1TNjBTQ3FZcEsxTEg2?=
 =?utf-8?B?Nm5yODVLUWlJcGlsUS9xVythMm1qTmJGaUttNVBmZ0ZQcW8rL0taN2pqU050?=
 =?utf-8?B?cVB3L1hYVWRBRElTN3JZSFVnYVJZZ2FCSUNKQkRVWDNLYkhiYjNWZ291ZFdY?=
 =?utf-8?B?NW4yTmpRUzUwQXUvOUU3YmVvMEZJZWlxTnpUVm0rVjVubzRlWWtNWVhqV0ZK?=
 =?utf-8?B?WXVvaGZiUHFsM3R2dnhIUk9sR094aUdIa2FBRVpMN2NCUkVsWnV3OG9EZVZn?=
 =?utf-8?B?WHpsdmlTUTFMMG1PdHJiRlUwZkhHcXBBajdscHhBblBTUitmU0k0cVp4c3JX?=
 =?utf-8?B?NFFTdTdRWHJveUg2ZkpycGJOcExhSzUzZXl3TkhqTDB4NFNUR0NTYStBSnNG?=
 =?utf-8?B?bHFMaHNta3EyaWNwQkNmS0lTZDF3TWJJd25Oc0hCekMrdC84cWtkeVBMekdJ?=
 =?utf-8?B?cDBQWENyYTl6aXdxYnBDbXkwaVdYTGkxTFNkNldha0pMekJ4UytqZ2dnYVhs?=
 =?utf-8?B?YzZPSklDUlRYZlk5U2NibDVnSEpBdFFiTVd4WmF6SGU5M1JZQWMxQzNKeEdt?=
 =?utf-8?B?bGJ6dmVmdFkrV3k0L3hESkszNzB1RWdKYlhEVXVYNEpMeGlad0tUQlU1aDhv?=
 =?utf-8?B?VHFUNlRzdHRPcWxzbGovNGc2UmhveTdhYi84blMwNlUrUGc1azVUM0pZYnRz?=
 =?utf-8?B?RWFKUFU3dnNCWFU2ajZ0U1dhRHBxdzJaZDNENVlEWVp5Y1hEbjZzQ0NneUFU?=
 =?utf-8?B?bFR1azRVd0Vtb3BLTXdTTkRBclRKSll3amZIZ3BhNTFiSHByTlYyWVYwRndQ?=
 =?utf-8?B?bXhkbzFnT0wwWklHTm1hRWFJOTdqVXNweHJZMDJLUkdqZWpyMi91MHh0eFA1?=
 =?utf-8?B?TEIxdEJSSFc4TTBNTmZiamE1ekdtMExGSWxQbEFSY2QrZVVmMzFiQkM5dkRx?=
 =?utf-8?B?ZXF3dlVhOG5mb2VtdGdLemhhVEVhbWNjV0NtbGpnNFU3WkhKRVFYeVpxM3Bz?=
 =?utf-8?Q?Q+ALLjzzZO0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmdGN3lCMHh6ZFNmOE9aOFNGaDJRajlQbWJTbFJMV2JGeWZZN1VOZlMyS295?=
 =?utf-8?B?RSsvT2x3MzBBZGhFbUI1RXVaTmlKUjc2bWtBd0RRR3RLc3VYcWlqbUNvT2tH?=
 =?utf-8?B?dnlnRmh5eFlMZVYrK0gxd3ZyaDNPQmpYNlZsa3hpZUlWMTY5QWhjYmJOVExV?=
 =?utf-8?B?OHpBRUQ4Mmt2UTBDdWx4QXVEZUNFVVExQmsyS0hiMmlsTHU0QXc0Q2VpalRT?=
 =?utf-8?B?UFFxb0t3am9FYlhtZGJFQ3lJU1BvZk5WanpPNTJiNzJWcDFnYzI1eDFscGNa?=
 =?utf-8?B?aDFQUzd0TUFuL3hnc3BEdlIyWWdCckdFdlhXNVloS1p4M3UrQzNOVmNvZFpI?=
 =?utf-8?B?WjV3enlyMUczYnZTbWN6RjkwSmJtQnNpb25oVW9kQ1JXakFVUitaM1Ixdjc5?=
 =?utf-8?B?QWJtR2tjaG5yWE1yM3JTMGdLT0tLZUdQSEJPZVByUnhnd1NKUnl2ZEY2cy9m?=
 =?utf-8?B?ckI0eFRheFZEcW1ISnovMTBIbVRKakNxRGM2TVpqUERWMUhYa1A3UHBrYURy?=
 =?utf-8?B?amZtUDFhd0d5R20xU3VYTElNMHJKV3dUMmJkaTg4eVhMYjh4RTU4TlNRNEM3?=
 =?utf-8?B?L2pBV0RFZEZiQkFPRXppczNsM3R1NXllM1RWSkRGQ3NHUmJDV1hhN3JwYkhD?=
 =?utf-8?B?a2pVN0NIZXREcHBCYXJ1dG9yaG1xaWlLRjRSM0dKa0Q3WkxKTzk5WCtZVVR6?=
 =?utf-8?B?VHhxUC9MY24zdWdMZmhVSk9ETFl6M2dBcEVpVFZhTnAwTGZFRm1RbzEzRUJU?=
 =?utf-8?B?M1RXVU1HTVRmWmFYZS9TdXo5aU5QbTk4Ti9qaDU1Q3RFZllUOEl0S2cvNjVh?=
 =?utf-8?B?SVQ0RFFOK0F5OUFXV3BDSUIxTnVtai9KYUpDVlFEd1hJNVdtT2ZwYTlNcEVG?=
 =?utf-8?B?ZVJIU0tTQ1QzaVBuM3J6TVJYTjZOYTE3SmQya3g4VHlvaWJIUFQ3SUJLUjNZ?=
 =?utf-8?B?ZnJyY3RRcTh0Q0poaWNJam1uQ3gvcDY3d2JUVEpUblhxbDF5Nll5eGJ5U3Rl?=
 =?utf-8?B?dWxEcDdGekZoVVBLWG1mdEEvTlZQeGtTcVRoRy8vREI2U1BOTzVRVkVOdGtT?=
 =?utf-8?B?QlBWS2hiazQ0d0V4dTlaYmZKcU85cXpPM2dGeVMrM3crVHZkYUpOMUhDNU5E?=
 =?utf-8?B?cE1NcFFJbU1LMVJ1czh4a3hBemx4WjBCaldOVmZLcy9MQ2laVGlWZmZZMUs5?=
 =?utf-8?B?NFE2RURiZXZjK0p5MU9Wa1o2OHpJcFBCaXJlQmgvdkxLYVhaL0QyUStEVkhO?=
 =?utf-8?B?L0RCNEJpNVBOeWhYbjJjcTFUTE1YUHo2R2gweUhwRjVtQmhjZks4K0lzSkJL?=
 =?utf-8?B?SFZhSnpKUm5yN2cvRHQzUXVhUkdmYU9lakk1aVRQRzhMYXhQUWlMZER5Rkp5?=
 =?utf-8?B?Qm9rek1PK3pPMWl3dHBGT0hmSy9paUtucUZwS20vanZiUUN4VnJtWU80TE5y?=
 =?utf-8?B?UTBhT3lRN2wvbDNic05vVEZsY05jc002SEJnenluSHdRV1o3cmdzZTBQZDE4?=
 =?utf-8?B?SVUxaWJuL3FzOEFDL0pQb3JwM0ExcGhkaXFGcEswa2xEZ2dSenZNRDhCR05P?=
 =?utf-8?B?c2RSWmhzbzFORndUUXM1MElxTjFYckVJM1AwWG9pK1MxVHhxZWczSVlFN1RL?=
 =?utf-8?B?Z2Qrc3krMzlTUGhPY2hFTC9VZ3NQcmR4R2RJOE0zZkZidEx0ajROZktiKytS?=
 =?utf-8?B?RlM2RXFKRGk1VjBkYlVWZVRGR3hjZjB2OEpJemtYa2ptbDhteTcxeElIYVUy?=
 =?utf-8?B?S1BhT1JRbTh3WGs4ZDVJS3dZczZESW1LT0FmWWFPWk0xNTY4UW5yWDlsRlRR?=
 =?utf-8?B?djIvNEw3eHVCZzZRU2RTRkE4dXNqcTlXMVlrQkY0ZHpDRENXNVJBcVZrSGpO?=
 =?utf-8?B?OElLcXhudklJdm9vU3p2SG51MXV1b2F3bVd0cFZDTWlMT0pQKzlGdnN5UUFK?=
 =?utf-8?B?VGJmZU9ZbTM3TFFrbEtJY2dTQWh2V0dZQ05IR1JtOHdHZDllTk1wRzArY1dO?=
 =?utf-8?B?RjU5dW8zbVF4YlMzNktiMnoxOVlPdngzYmk3MEkzekNrRjBnOEFLdUorUndm?=
 =?utf-8?B?NUdYQ1dKTU9DTno0UUJXUDVqOXZYdlErc2FjUko4cUFOeXNhN2RMeHhYYysw?=
 =?utf-8?B?U1lxMEZkaVl6MldpbTRQZ3NoM3o4OHJjdVpQT29ENTJDWDd6ZldWZzdtdEN0?=
 =?utf-8?Q?Nh8irbkNQVrg5GHsaBX9FpI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20aeb3f5-0f99-4d45-45d1-08ddd31c1424
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 05:59:31.1478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SCSoAH78UOs45k29PXPKuOGp3abzeyX0UdBHUnV8BTheoIelTKGVgIqsIemXNg+P8ahQ9JCz1+6w3/QY8287RNHcTJqXPUZJKlQuJw7R5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7257
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



On 14-07-2025 22:33, Matthew Brost wrote:
> Update the test_exec() function with flags to initiate and understand
> prefetches. Prefetching is tested by verifying that the fault count in
> the GT stats has not  increased. However, a mismatch does not cause the
> test to fail—instead, a warning  is printed. This is due to the
> unreliability of system allocator behavior; the  added sections
> primarily serve to ensure that the driver remains stable.
> 
> That said, if the page fault counts are consistently incorrect, it may
> indicate a  problem in the KMD.
> 
> A prefetch benchmark section has also been added to help profile
> prefetch behavior  in the KMD.
> 
> v2:
>   - Prefetch initial buffer on SRAM devices (CI)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 121 ++++++++++++++++++++++++-
>   1 file changed, 116 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 65d281c784..f8d144328e 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -21,6 +21,7 @@
>   #include "lib/intel_reg.h"
>   #include "xe_drm.h"
>   
> +#include "xe/xe_gt.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   #include <string.h>
> @@ -770,6 +771,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   #define SYNC_EXEC		(0x1 << 19)
>   #define EVERY_OTHER_CHECK	(0x1 << 20)
>   #define MULTI_FAULT		(0x1 << 21)
> +#define PREFETCH		(0x1 << 22)
> +#define THREADS			(0x1 << 23)
> +#define PROCESSES		(0x1 << 24)
> +#define PREFETCH_BENCHMARK	(0x1 << 25)
>   
>   #define N_MULTI_FAULT		4
>   
> @@ -878,14 +883,17 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>    * arg[1]:
>    *
>    * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
> + * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
>    * @malloc-multi-fault:			malloc single buffer for all execs
>    * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
>    * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
>    * @malloc-mlock:			malloc and mlock single buffer for all execs
>    * @malloc-race:			malloc single buffer for all execs with race between cpu and gpu access
> + * @malloc-prefetch-race:		malloc single buffer for all execs, prefetch buffer before each exec, with race between cpu and gpu access
>    * @malloc-bo-unmap:			malloc single buffer for all execs, bind and unbind a BO to same address before execs
>    * @malloc-busy:			malloc single buffer for all execs, try to unbind while buffer valid
>    * @mmap:				mmap single buffer for all execs
> + * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
>    * @mmap-remap:				mmap and mremap a buffer for all execs
>    * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
>    * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
> @@ -896,6 +904,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>    * @mmap-remap-ro-dontunmap-eocheck:	mmap and mremap a read-only buffer with dontunmap flag for all execs, check data every other loop iteration
>    * @mmap-huge:				mmap huge page single buffer for all execs
>    * @mmap-shared:			mmap shared single buffer for all execs
> + * @mmap-prefetch-shared:		mmap shared single buffer for all execs, prefetch buffer before each exec
>    * @mmap-shared-remap:			mmap shared and mremap a buffer for all execs
>    * @mmap-shared-remap-dontunmap:	mmap shared and mremap a buffer with dontunmap flag for all execs
>    * @mmap-shared-remap-eocheck:		mmap shared and mremap a buffer for all execs, check data every other loop iteration
> @@ -907,6 +916,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>    * @free:				malloc and free buffer for each exec
>    * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
>    * @new:				malloc a new buffer for each exec
> + * @new-prefetch:			malloc a new buffer and prefetch for each exec
>    * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
>    * @new-bo-map:				malloc a new buffer or map BO for each exec
>    * @new-busy:				malloc a new buffer for each exec, try to unbind while buffers valid
> @@ -941,6 +951,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>    * @mmap-new-huge-nomemset:		mmap huge page new buffer for each exec, skip memset of buffers
>    * @mmap-new-race-nomemset:		mmap a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
>    *
> + * SUBTEST: prefetch-benchmark
> + * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch
> + * Test category: performance test
> + *
>    * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc
>    * Description: Create multiple threads with a shared VM triggering faults on different hardware engines to same addresses
>    * Test category: stress test
> @@ -998,14 +1012,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>   	struct test_exec_data *data, *next_data = NULL;
>   	uint32_t bo_flags;
> -	uint32_t bo = 0;
> +	uint32_t bo = 0, prefetch_sync = 0;
>   	void **pending_free;
> -	u64 *exec_ufence = NULL;
> -	int i, j, b, file_fd = -1, prev_idx;
> +	u64 *exec_ufence = NULL, *prefetch_ufence = NULL;
> +	int i, j, b, file_fd = -1, prev_idx, pf_count;
>   	bool free_vm = false;
>   	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
>   	size_t orig_size = bo_size;
>   	struct aligned_alloc_type aligned_alloc_type;
> +	uint32_t mem_region = vram_if_possible(fd, eci->gt_id);
> +	uint32_t region = mem_region & 4 ? 2 : mem_region & 2 ? 1 : 0;
> +	uint64_t prefetch_ns = 0;
> +	const char *pf_count_stat = "svm_pagefault_count";
>   
>   	if (flags & MULTI_FAULT) {
>   		if (!bo_size)
> @@ -1136,6 +1154,43 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		memset(exec_ufence, 0, SZ_4K);
>   	}
>   
> +	if (!(flags & FAULT) && flags & PREFETCH) {
> +		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +
> +		aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
> +		prefetch_ufence = aligned_alloc_type.ptr;
> +		igt_assert(prefetch_ufence);
> +		__aligned_partial_free(&aligned_alloc_type);
> +
> +		prefetch_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
> +					     bo_flags);
> +		prefetch_ufence = xe_bo_map_fixed(fd, prefetch_sync, SZ_4K,
> +						  to_user_pointer(prefetch_ufence));
> +
> +		sync[0].addr = to_user_pointer(prefetch_ufence);
> +
> +		pf_count = xe_gt_stats_get_count(fd, eci->gt_id, pf_count_stat);
> +
> +		if (flags & (RACE | FILE_BACKED |
> +			     LOCK | MMAP_SHARED | HUGE_PAGE) || !region) {
> +			region = 0;
> +			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> +					     1, region);
> +			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +				       FIVE_SEC);
> +			prefetch_ufence[0] = 0;
> +		}
> +
> +		if (exec_ufence) {
> +			xe_vm_prefetch_async(fd, vm, 0, 0,
> +					     to_user_pointer(exec_ufence),
> +					     SZ_4K, sync, 1, 0);
> +			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +				       FIVE_SEC);
> +			prefetch_ufence[0] = 0;
> +		}
> +	}
> +
>   	for (i = 0; i < n_execs; i++) {
>   		int idx = !stride ? i : i * stride, next_idx = !stride
>   			? (i + 1) : (i + 1) * stride;
> @@ -1186,6 +1241,25 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		if (!exec_ufence)
>   			data[idx].exec_sync = 0;
>   
> +		if (!(flags & FAULT) && flags & PREFETCH &&
> +		    (region || flags & (NEW | MREMAP))) {
> +			struct timespec tv = {};
> +			u64 start, end;
> +
> +			sync[0].addr = to_user_pointer(prefetch_ufence);
> +
> +			start = igt_nsec_elapsed(&tv);
> +			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> +					     1, region);
> +			end = igt_nsec_elapsed(&tv);
> +
> +			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +				       FIVE_SEC);
> +			prefetch_ufence[0] = 0;
> +
> +			prefetch_ns += (end - start);
> +		}
> +
>   		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
>   			addr + (char *)&data[idx].exec_sync - (char *)data;
>   
> @@ -1277,6 +1351,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   				} else {
>   					igt_assert_eq(data[idx].data,
>   						      READ_VALUE(&data[idx]));
> +					if (flags & PREFETCH_BENCHMARK)
> +						memset(data, 0, bo_size);
>   
>   					if (flags & MULTI_FAULT) {
>   						for (j = 1; j < N_MULTI_FAULT; ++j) {
> @@ -1359,6 +1435,26 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		prev_idx = idx;
>   	}
>   
> +	if (flags & PREFETCH_BENCHMARK)
> +		igt_info("Prefetch execution took %.3fms, %.1f5 GB/s\n",
> +			 1e-6 * prefetch_ns,
> +			 bo_size * n_execs  / (float)prefetch_ns);
> +
> +	if (!(flags & FAULT) && flags & PREFETCH &&
> +	    (flags & MMAP || !(flags & (NEW | THREADS | PROCESSES)))) {
> +		int pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
> +							   pf_count_stat);
> +
> +		/*
> +		 * Due how system allocations work, we can't make this check
> +		 * 100% reliable, rather than fail the test, just print a
> +		 * warning message.
> +		 */
> +		if (pf_count != pf_count_after)
> +			igt_warn("pf_count(%d) != pf_count_after(%d)\n",
> +				 pf_count, pf_count_after);
> +	}
> +
>   	if (bo) {
>   		__xe_vm_bind_assert(fd, vm, 0,
>   				    0, 0, addr, bo_size,
> @@ -1370,6 +1466,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		gem_close(fd, bo);
>   	}
>   
> +	if (prefetch_sync) {
> +		munmap(prefetch_ufence, SZ_4K);
> +		gem_close(fd, prefetch_sync);
> +	}
> +
>   	if (flags & BUSY)
>   		igt_assert_eq(unbind_system_allocator(), -EBUSY);
>   
> @@ -1435,7 +1536,7 @@ static void *thread(void *data)
>   
>   	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
>   		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
> -		  t->flags);
> +		  t->flags | THREADS);
>   
>   	return NULL;
>   }
> @@ -1553,7 +1654,7 @@ static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
>   
>   	fd = drm_open_driver(DRIVER_XE);
>   	test_exec(fd, hwe, n_exec_queues, n_execs,
> -		  bo_size, stride, 0, NULL, NULL, flags);
> +		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
>   	drm_close_driver(fd);
>   
>   	close(map_fd);
> @@ -1604,14 +1705,17 @@ igt_main
>   	struct drm_xe_engine_class_instance *hwe;
>   	const struct section sections[] = {
>   		{ "malloc", 0 },
> +		{ "malloc-prefetch", PREFETCH },
>   		{ "malloc-multi-fault", MULTI_FAULT },
>   		{ "malloc-fork-read", FORK_READ },
>   		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
>   		{ "malloc-mlock", LOCK },
>   		{ "malloc-race", RACE },
> +		{ "malloc-prefetch-race", RACE | PREFETCH },
>   		{ "malloc-busy", BUSY },
>   		{ "malloc-bo-unmap", BO_UNMAP },
>   		{ "mmap", MMAP },
> +		{ "mmap-prefetch", MMAP | PREFETCH },
>   		{ "mmap-remap", MMAP | MREMAP },
>   		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
>   		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
> @@ -1626,6 +1730,7 @@ igt_main
>   			READ_ONLY_REMAP | EVERY_OTHER_CHECK },
>   		{ "mmap-huge", MMAP | HUGE_PAGE },
>   		{ "mmap-shared", MMAP | LOCK | MMAP_SHARED },
> +		{ "mmap-prefetch-shared", MMAP | LOCK | MMAP_SHARED | PREFETCH },
>   		{ "mmap-shared-remap", MMAP | LOCK | MMAP_SHARED | MREMAP },
>   		{ "mmap-shared-remap-dontunmap", MMAP | LOCK | MMAP_SHARED |
>   			MREMAP | DONTUNMAP },
> @@ -1640,6 +1745,7 @@ igt_main
>   		{ "free", NEW | FREE },
>   		{ "free-race", NEW | FREE | RACE },
>   		{ "new", NEW },
> +		{ "new-prefetch", NEW | PREFETCH },
>   		{ "new-race", NEW | RACE },
>   		{ "new-bo-map", NEW | BO_MAP },
>   		{ "new-busy", NEW | BUSY },
> @@ -1801,6 +1907,11 @@ igt_main
>   			processes(fd, 16, 128, SZ_2M, 0, s->flags);
>   	}
>   
> +	igt_subtest_f("prefetch-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
> +				  NULL, PREFETCH | PREFETCH_BENCHMARK);
> +

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
>   		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
>   

