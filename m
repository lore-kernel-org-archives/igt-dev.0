Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6E6C3DA6D
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 07:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1647A10E3E7;
	Mon, 19 May 2025 07:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJNmmkJt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DE810E3BD
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747641451; x=1779177451;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rbjIatvFRWPKHrx8Qez58JRWR9apvlqscHOstw/wlUg=;
 b=eJNmmkJtnuZs8sR2Yn520+HKb+zBY3M+dkoEUqzLtTThQ+ica+amXdSg
 8kWydJSzr0KNJa9oe5cUVgjRjsHlIVeKezrW7TgHneTU765yOHisxjvRT
 j/6/aClIaZRZhQw5sXqwKV5mNl1JKwPDXWXfNh1qHPYcTIyBSQP4+zLHj
 httfKoZNMWcW2oRbSlgqhoiUZKGVd+84+zZ63vUZwMD3S74pCufJY/L0H
 ehXkko0n0as0QtpJVFWc+zAMB60K504dW1oAatEgi8hSpboHP8eiz6kf1
 8o56bSgg+hVkMYleyRPX89e8ZGZUkUKijitLoN1O1pu+ts2wisBtG+0iG w==;
X-CSE-ConnectionGUID: 0bAzqgGQR6aJYVu2s3iUow==
X-CSE-MsgGUID: sf2hxm92SRyljrAhjwe6JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49230375"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49230375"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 00:57:31 -0700
X-CSE-ConnectionGUID: aDnHeHsfTneavH1DUuC+vw==
X-CSE-MsgGUID: 9c90HxwXQza1hqIyUPm4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139806534"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 00:57:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 00:57:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 00:57:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 00:57:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vggDJBHNNtCycdRYROPX7sUDjfFmMFgZPSvmJH32jt+ewUfadJLxq+nYXTC4oxUPVBJkzrYqTmrd41TD63I3npAgbkL66fl0S2zoOPxr3AVB9UM1tGEEIWiUm5dBBAOfhP/dsaMAtwn+SJIwb27Ixfi7mL2rs0qPNcR/qNMBmlnC7N4IAtewdpF5LuPEKxqdR4u0PSdwIuOgAxL8cdLupvg4MXj9G1qio9mpS1CUaZqJVJ6ZZWk/P3K4FDN2eb3YTN3xuRPS3zfShE+O3qb9VLBsUv6GYac9C+e6KoJFV41yRpyzLKircKLPF/+oex7juAEtUFQAnOwQf8+HvIKAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dovzTf9fiqAfnkONO8c3k7Re3IJKCWmW5QHslkTIz8c=;
 b=CR9/mkv6gfI/crktiZ+1/fLEG5jfpHQlCwJqMLwmulNDAWnNUghlwa1DsLSZuiurNrTT8G4gbMGdAgXl/PTrXq6eH5sp//3BASGeWq0A8YluO/e2UtDm99VbyOr34rc1PFuJW+H1qqRTbtvzfAQGdb3ihSjsbwv0yKKiC8IhwZwpwK0NWXn3aY6cCWBXZsiF3dGWIlSIGVF/16oxAlMcJdVFoR+PmWQUaAzDdqnKK0gl7421y5MZck/Y3kvOhWdboYMANaJQft+l8Nk0R41yrE/u5oEfs9MlScHNIuTRII8t3iMm6x5kvVMngUEHpqttldc3oSDHnKpWio96vLS3AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 07:57:29 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 07:57:28 +0000
Date: Mon, 19 May 2025 09:57:25 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 04/15] tests/xe_copy_basic: use non-zero pitch
Message-ID: <aCrkZWSc_qFsvORm@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513185811.897232-5-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZP191CA0027.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::16) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 315c1b88-8132-49a0-cf48-08dd96aacd38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzBaWDBjTitXU2JUK1FIdlBXTkxjaHVCZU1CeHdWNXNYRDVqSzlYSTRTakNm?=
 =?utf-8?B?OUxxcjVGZlFHTmNwa3ZhRTR2S0s0NmJ2cTA5OUViQkkwblhGWE5jSUduelZ3?=
 =?utf-8?B?V25TYUN6S1hRdmluZjZUcFR6MVpUQXdLM0xzNTZ0aUFBc25rQjFjblIyWnZ4?=
 =?utf-8?B?aW1wMG9lRzJORlhCcytTVGJ6S3d0b0J4NUdBaU1TSmR3eE5sMTFsQlB2bnJU?=
 =?utf-8?B?S2ErNDVreWpOYXhsZzNYYzN0WWtZWHRlWHlJT09aTWlOVmFYQlNWaEhRMEFH?=
 =?utf-8?B?NFdac2ZTUncvajVIcnpDdWNLL3kxWi9GLzIybk96NW0xOCtTYTJaZ3JZOHo1?=
 =?utf-8?B?QzBDelNQRmV3aElyUzNrTFd6Y2djRDlINDNxVnliSVNjR0JJQi9lT3BwZ3FN?=
 =?utf-8?B?REdTZm0wb0lVenIwQzZUMzg3VWdQRHpsMW5jQkFmMTk2d1ExRnRyMU54SVY1?=
 =?utf-8?B?ekk4ajZZeU9QWlA2NFJoTGVMMzU5ZGdxV0NnNEVDd2x2K0pmTzl5MXEwTHBa?=
 =?utf-8?B?cHBIUDFSaHRMMmFmSkZuSkdwT05VejRXNnAxUC9FenVNdnllaXB3c1lTZlBh?=
 =?utf-8?B?dGNMd0pQWXJid0pLR2dDbEEwVDBnYktiQzBMK1hMeWVCY0NVSXFKMDlFYTJh?=
 =?utf-8?B?Sno5ZUJPOTlhOUhKSlBQd2pYSE04dk5DZ3ZRbGZsUjBMWkc0bzJmdTJCMnZz?=
 =?utf-8?B?am1rS0xOSE5PN2dwSEtNaXIzSUFlc3ZsSnpTY0xPMStQYWw2VDNaYnpJRWZ0?=
 =?utf-8?B?OGlSTjgwZkU4UUxIYW9pcTJyakNUTCtZTWVDNitPQmVrQUlUZFFiVjh0TG1R?=
 =?utf-8?B?ZDJZbWQ4ZnM5OEthWktTTEhOSWpUV3lqWWRMbkdCTUlvTi9ENVVUc3lQN1lW?=
 =?utf-8?B?TUUxeFlGSnJiQTdZWFBhUmhZaUsrK0k2LzQwTzZmWTVaUmJNMm5kbnQ0OWdP?=
 =?utf-8?B?TmczOS9jSHIrM1ZnY09UdUJqN2E5TEZGVVRya0VzS3JlM2dVZEMyN045SUNv?=
 =?utf-8?B?RFllWEtPYnhSS25VUGxsUGg2Wml1aFQ1RFA3MzhxZjRQYm42SWlwdWRwWG9N?=
 =?utf-8?B?SGx0S1JsUUM3TnRnM0JYbWFBRVppdTBCY3p4VjVPTzFIRHh4SWlmOUVVWnB6?=
 =?utf-8?B?cmpHWUZlV1JyQ2pVNjh3anJxbXl6eEprSjlmS201dXV1TlNWUTgvUjZ3K2VC?=
 =?utf-8?B?MjZtbFVzT1M1NjRUSnRkTWFaZFUzZnZQVFVrbGc4RGZ6Tk41K28yYXcxSHlQ?=
 =?utf-8?B?QmthdzlVWHB6YmR6eGFLcHpPeTNTekhqejVsWDdQbVNhM2k2QmQzQ1FWR292?=
 =?utf-8?B?L3RhSkdQZGY1Y3VoK3JSME4wejRFTkQ5OFJERGlZT1FoWTNMdFpyOCtwcDVN?=
 =?utf-8?B?bTV4akN5WG5PQ1RJMmkwWWMyOWdwNkNrc0Z6REh2MUN6ZS8waklOUTBsL0o1?=
 =?utf-8?B?alFIb25raFZWK3VkRTFpdFBTK3RrQUZFdG1QbkJ0d1R5cVp2RVFBSkRrMU5D?=
 =?utf-8?B?bERZb3hNbkFpOWtFUzZac0FKWktDV0I2cVNWNzRRamQweDVQN3Vwa1RnQkZC?=
 =?utf-8?B?Q1pISllqOWMyTUFyZVNWT09KVlM4R0dSTmZOR3VOSjVDK1BqYmZEaklvNnoz?=
 =?utf-8?B?dStUazNYMXVwOXA2MlF6NWZrVy9oeklIN25WbnBqUFU2UDRRSmZCN1BzK0Jy?=
 =?utf-8?B?RFJRT2NPUW9YODh0Rko3YUQvUkU5WElSQXoweU1ibU05SWs3Y0FGM1lqcmJ5?=
 =?utf-8?B?aWR6SjlRRnoyTW9JNU5kZy9RbkFjREh1blJlcjRyZW1aaU11WWtFQzEvTWdk?=
 =?utf-8?B?UmxPWS9lTjdDR3RWMTZzTXZKOVZlb2VHTTN1VGhRYkhJMDVJYkhwN0tPUlpN?=
 =?utf-8?B?U3JSTSs0eVBOR2dhWmowcWxEbytya3ZQKy9BYXdzWVA5QStyVExIWGVZbmtv?=
 =?utf-8?Q?sjKZ6orlBlk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vnoxek5ranZES1I2TkE3ZHEyNEhTeVlqSDl5M2dzR0M0WTlqWWdJYVU3c2kz?=
 =?utf-8?B?Z0tyRkhMTW0zeXpYQXBjMmlXK1o0KzVRR3paclcwVzhuRnZZRUhXK0dseVdC?=
 =?utf-8?B?Vjl2NEpITmJkWEZKN25NZHUwYThVSVc5aFFNRjNwYTkwTytWMU93b29GWmEy?=
 =?utf-8?B?QllWaGlzTzlmb2MzbWhxaG1Ba3A4amdTeCtMenRMdHRhbXdWWWdTZWVlUjhM?=
 =?utf-8?B?ZkI4VEVoNjRSNEtIUFVnQTNjeEMwcXJDL0Nnb3JzNVdXV2Z4L1Q5SlJrTEJZ?=
 =?utf-8?B?eFpZWG5qaWI3eFhWcG9ESWZRQzd4eVVIaDExNWhzUVBnS29rcStvOEI4bkR3?=
 =?utf-8?B?WnZ1YTdNbS9KWHR1WGR5TkVIdlBvOGNtRS92L3ZjeFFqSU1LRW1jUmV2TWRs?=
 =?utf-8?B?UFBDWDhFVU5TWjlWeG56dVoxVk1MalBwMzJxeGRJdnZkWktEWHl5VjlSL3I3?=
 =?utf-8?B?QjR2cjZ6ZmdkSEE4dFMzQ3phSVBvU3RYY0lod1d4UXNkbEcwYU1OZnBsazBh?=
 =?utf-8?B?NHVoZ3F0VGJwcVl2RExEL1RQU2J4bVErVVYwUlcxNHRpcEh4NVVTd05ZNkNy?=
 =?utf-8?B?cDc5ZVJWcW9nUDNkOFlKVU96VmNBaXJOaWZsTytranFMUFVZOWV2Ym9za0RB?=
 =?utf-8?B?a3J0YWx2c29uSGlBNHg0U28vVTRFZVpnbWZTWit2VXpMUi90TzlVUjBsK040?=
 =?utf-8?B?YWxGYUZxRkJHbmhzME9mNHU5aGsrSTFTam9nazBlRHdhc3pXcUxheXlBZkp0?=
 =?utf-8?B?cFFmMGd4WXVhR21XS2svUkJOdlU3cE1zOHdSL1hHNHJYVjlBVW5JQloyYng1?=
 =?utf-8?B?UHAzVndMd0hxMHBhMUloT2dyZEJXNDZRWVE4ZXdibnJheWJPVGQ2NncycWZY?=
 =?utf-8?B?dG0xNzNtWXBOKzl2MisvVDhkQXU0MEZWNXBYcnExQXpEb1JQdWdzZ0NyMnMz?=
 =?utf-8?B?Z0lOaU0vVmpkbVFacDNxall0V3E1ZTV5NkpSNHVqYm5lNjMrMGhnOEYxemJP?=
 =?utf-8?B?UDhaTnZjN3R5WGtscCt0a29aaUxPSkZtcGJMMm1HZ1p4eVh3amNJQSs4c0FS?=
 =?utf-8?B?dnVZRmdNNHlFOEdmWGc2N3JHY3l1M2tFZEw3UUhFa1lEYWJuSWVLZlZTM2VG?=
 =?utf-8?B?b3hZVjRibWczMThBaHBhUS9oZlNSOW52Z0JMclhnOFJsOEZVOSs5Vkg0czBs?=
 =?utf-8?B?RCtUdE9XaGRqUU1JUEZUcGo4SERWTHZPWmJLSXdQMHl1aWlhcWMxUHJXUXJq?=
 =?utf-8?B?bUs5aEdZcUpJcHZGWmpNYUlrdUpjKzdiMnZzNTAreEhLenAvdDAwQm5QYnFD?=
 =?utf-8?B?NWtqdjlRZXBmT3NFWFRRVjVDeHk2czdVNzRsalJtRDROR1R5dXdtNVJjTlYy?=
 =?utf-8?B?R0sxd1QxUWtBT3JrWDZoOVNuaVR2VkFDSy9Uc2RaaUx3eDMvVCtMcGdnaUhp?=
 =?utf-8?B?bXp5Z0NvTmdwWGJKYzBuNGVhem9oajZhVUtWc2JMenhhVkE5WllUM2krQWsv?=
 =?utf-8?B?dDJlaXpBSkdncGpXam1kdENLUzNROVBiTmxNNUZiTk55VHBWQmpuWHhvcHJI?=
 =?utf-8?B?N2cwemtqRE91aWNGamxXZldmamRiWHZIaUp0ampabGROc3I1elVLOEZuMVBi?=
 =?utf-8?B?aVBlM3pmQ3E5dlZmUWVaZmZlT3g1K05KUjdMcjZYbVpuVk1hN3pxTHZHbEFY?=
 =?utf-8?B?TE5LekIzVlhYL05wVDBPV0lhdUc0RUZtcUVmTExxL1cyMmRDUUgrSkFvTkVw?=
 =?utf-8?B?R0htYzIzR2R1QU42amtvYjFFMGhRelRvQSt4cWJQSVZ0LzBIdEYxdTZ2cVVD?=
 =?utf-8?B?enVoK01OUzYzandnQmxUd1BGSk85M215K25ya01BaGZxRXBYclN0TlVpWUpK?=
 =?utf-8?B?RzFnRkx4SkhhS3ZoY256SUhZMm4vT1JmeVpiY3Uvc3VTWjFpUGtRS1BaYWFn?=
 =?utf-8?B?Q1JacXExUEMrZklNbVVXSjRxODNsSHdjdERYa01jeDRSaEdYbjRKMnFTM250?=
 =?utf-8?B?emxEVmprZXc4eUNLQUpidFBBOHhCcWdEQjZkcXYxUjdyY0s2QU11Yy9DM3hq?=
 =?utf-8?B?dndQUmJlL1owVStFQ3RCdzlHSGs5TmJ6S21nUFV6bGFETXNWRUFuNUxOaVBa?=
 =?utf-8?B?RDVPekFhalFTbHptVGl3dWljU3luNHREdDc0aUU4d1N1UWptT1BnZ05tRDVk?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 315c1b88-8132-49a0-cf48-08dd96aacd38
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 07:57:28.9008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMLs12gQCLZ7ne+dkY3lJ9zNCzYGDhke8hoABHeXPykytT99OyUCo+rPVeLLNq8TwoMn0V06Sh2+lv1dBfedg8XA7Lv8T2vc8MmuwZskLxc=
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

On Tue, May 13, 2025 at 08:57:59PM +0200, Zbigniew Kempczyński wrote:
> Passing zero leads to use turn all bits on what's incorrect. Pass
> width as pitch to avoid undefined behavior in mem-copy and mem-set.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_copy_basic.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index a43842e398..d4300b85c0 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -57,10 +57,10 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  
>  	blt_mem_init(fd, &mem);
> -	blt_set_mem_object(&mem.src, src_handle, size, 0, width, height,
> +	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
>  			   region, src_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
>  			   COMPRESSION_DISABLED);
> -	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height,
> +	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
>  			   region, dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
>  			   COMPRESSION_DISABLED);
>  	mem.src.ptr = xe_bo_map(fd, src_handle, size);
> @@ -108,7 +108,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  	blt_mem_init(fd, &mem);
> -	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height, region,
> +	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
>  			   dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR, COMPRESSION_DISABLED);
>  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
>  	blt_set_batch(&mem.bb, bb, bb_size, region);
> -- 
> 2.43.0
> 
