Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D7EC3ABBC
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 07:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4432510E2EC;
	Mon, 12 May 2025 07:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCZxPEt/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D63C10E2EC
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747036140; x=1778572140;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S8PKkM4HUy1UYMXwPkBkWttvon4iu+59O0AhL1AvXH0=;
 b=NCZxPEt/UbcufSwKWekl/SSwkyyPQur4GIa91st3yIAjYOypxHoQ1bgy
 1p9tdgST0nq3T+ILEkOHXMR40VaqlXqVPT1kkGfcUVz3244npFO3UL6n9
 pyhNgjf1lZnLqC1my4nVOpV/Fq8LiufXlYsrgRbDO2edZbCrMrU5eUI2m
 a20wn9kFWyTfeCRg2/TkNWKO1RuCTNItNrLkoy81TCFO3uIiHtPXZXbPm
 mJtuBAqYzzcUyydUXTR5VE3CZdujGSwMVcMqWOhavpY1Ni2JKFk0QI5f+
 n/cSZKgspHvcq4XxKr3q9kukckbm4Abu7bCLup5Ux8O88SDNGa3treUdM g==;
X-CSE-ConnectionGUID: 1vEVURKQSvGEIkBB4QR6MQ==
X-CSE-MsgGUID: obWSPvxgSPKI4DcogvsJtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48938620"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="48938620"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 00:48:53 -0700
X-CSE-ConnectionGUID: at3+PybqTOiv7VOiTNcKdQ==
X-CSE-MsgGUID: 9nqNdm+HTLGZGWmpVmLrPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="142409949"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 00:48:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 00:48:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 00:48:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 00:48:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s68QVkB7GBUitAJ3uxGLzCLRyW9ZEDCB9dZnye1qtlmpsTPvkJUTbXnHHDjD3pHJGfoXFmdM9SUHHy+U7W4DpvKvc3oXp9hyX9i1brHn4+AND73rTJQCa5WOEBx/xZ2d8gfKyJfFb5NRSRQzdQLcRpZWB+DSbyI17QNr0cWEJT5UmcfSFv+GKIdLhGxUL07VdXc0ftowSlktHH/khpVkAdA2g4Dob1sHSMLPmVK61I2mrkY0cY+P7BNw7ANb6pGRGAamu2WaBVJ19dMfg/mZE1Z5PbSfSGZjqAVB7SlFv52EnPZTvUFX0kYzyu2EawEsCeuWkmJ10oKGNQdgAQWxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKRnGYRfAJVhiCP1mzUh6URolQz7PlYOa/3sU5RGMGw=;
 b=gEpNRLTLyqxjHnhGXjLVS+ApJX2dfTAOUTluF0z3fff94XUVXKaCAMGOP5Zyi2U8B9NUBHi0tmT1HECBDPdE3f3zjXveIWHG5JfqD9VI8jU39SRzALsA/KK865tvGeGJ2aQqsY7tkPuxqL3RUEcO911OIHimCAnDevdggj+/e1AdSTaiOXyvv6py9M0wqkpwuLUaWdEGy6yDdPPhVeR/VQgtffWJm3/y7sScBGxfROJ/xxuwmyf5cl0SmpZdqJ/En8gZ+nj1Oer6ym8/U7Xbbwt+/3a8r8bTwtp6dBvblY+ed27NV/jNM8nVab44UQimnDUJpw/dlU7+lr2P4+4eUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS7PR11MB7807.namprd11.prod.outlook.com (2603:10b6:8:e3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.23; Mon, 12 May 2025 07:48:43 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 07:48:43 +0000
Date: Mon, 12 May 2025 09:48:35 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/xe_spin: limit width/pitch for mem-copy
Message-ID: <aCGn0-bixj-y2_2x@fdugast-desk>
References: <20250509074645.56169-1-zbigniew.kempczynski@intel.com>
 <20250509074645.56169-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509074645.56169-2-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0183.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::21) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS7PR11MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: da4aa082-98b8-4839-f55e-08dd91296acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGFhaHo1Ti9STWorV0NDanBxdFdWL3l2QVhFWkFwREpwZHA2cHA1VndJRG5z?=
 =?utf-8?B?cmtuY251ZVIzUFJQdkNKaXhYK0JZdkloa0piUEVrUHJnZy8xMW1mbmpiRWtL?=
 =?utf-8?B?eUpxYkVqREh5aTBZSEFqV0pjU2Uxd2dtb0U1NHQrcW9ab01aRG4zcHRCS1lo?=
 =?utf-8?B?Qk80YWdXMGRUVEpOSmxteWxNWnN3VDVJSXJqTHJiK0tkNFczRzlDc2NJWjBh?=
 =?utf-8?B?R2svTGozQzBtajhqeU9XRUpZYmFhRG5MOXJST3ViRjRlTExiV1lXQStFdS80?=
 =?utf-8?B?RUVZSzZDdzlLZFlhWk9USHZmVmwvUWQranZMeUYyeHNqWWlUSTczZWZ5aklp?=
 =?utf-8?B?diszbmVNTXJqZy83M2s5N2dOTDBFYm5Db0dWQ2dEK2Y5S0VOaG11UWk5aGNh?=
 =?utf-8?B?eHlMYjVzNUlPeE5HUDNuZ2tnamIwWkFvME44OHFmd21TaGljb0NGWk44NWd0?=
 =?utf-8?B?UVJrVzZDNGtCWXJZQWt3ckozYitEZnJjOGJlRktRMzhoTHV6Q0t6b1RqT2l1?=
 =?utf-8?B?QTg4UElTbk5xNjZFSWpXbldoaVB4SFlJN042bWhxanEvSWF2a0gyZ3NWMlNE?=
 =?utf-8?B?ZmRjd3V5VTVFTHN6dEJIS1RKd1U3aHFKVUFPUk53TEFyK0xLalZuTG8waHlY?=
 =?utf-8?B?T0VtQVY2TWROTkpIazZnSjhaYXFiR2FBNllDODFRNXJOc2pUWXRXeVYveXZF?=
 =?utf-8?B?WTh4aHJ1RW1mZFlQajNQclhWS1VGODlzRFpVMFRseDRwV2lnY3FRZXRpVzZ5?=
 =?utf-8?B?MHR0eW51Z3BxZW9ZMUN5a2RRc2Z0WDFZTjRoRmZwam1jNG90aFNNZ3pQa0tl?=
 =?utf-8?B?djBrbGFid1MrRmVFV3ZWNEo0ejlsd0VKdk11R3R1dDN6Vk9jQXlROFhhd0NY?=
 =?utf-8?B?d2h0cER5OGhqMkRsSnRNVEtaclZndXF2Y1Fod1VVbDNhQkJGVXY0U20rZE1E?=
 =?utf-8?B?WURpWWJGUHU1S3h6MjhWdFpZKzBhSDRtVW0zazBUbnBVUmxLN1o5clhpVnQ0?=
 =?utf-8?B?aDRNSU9ETzYyYW5hWWw4TDdoc2ZPSisrOUU2SGlFMWx0dHNubktnSnI0bUZt?=
 =?utf-8?B?L2ZkSGpBcVh5WVdqd0N4Uk5wM0hYR1JnNGdDWEhXNEF4S3EvUllGVFVPME1s?=
 =?utf-8?B?S2FxeUtVOFNQSDdYZDNiSVFRdlo1NWQxanc3dEVMNlR1YjVQZDJlTGVzT2lS?=
 =?utf-8?B?RFBtcU5jVmlNeFFVcVdDcE5LaEE1OXo4YlRNa3pQSjNXbWhkNzMvbnQ0Q1ZC?=
 =?utf-8?B?OWZkNkkrempIZDk2d2x2Wmd4M2UvYThaRFc4bHliN05SRUE0ZDhwYmk5bXR0?=
 =?utf-8?B?NnVQamZXM2dRS3lRQXc2c2N1N3BlVEhFOEFzbHB1OFZrbTZKbStuVVB3by9W?=
 =?utf-8?B?RVVTQ29Eejd1Tmh1Q01UaU5LcXprZjQ1dE1hemFxeExmMjFNSm0ycmgxTlhX?=
 =?utf-8?B?Z3NzcWRUeGUwZEdHNTNiUG1WSCtTcXlFcVAyZEtwcVRqRmo4TVBzY1B1Y3JC?=
 =?utf-8?B?RXFpZENTZnpBQkV1R2JUcEVSVGtpUUNqd1Jwb1NoWHR2azBjaWVEbjhPSkRm?=
 =?utf-8?B?VnpPZGd6WkpScmFlTnFnTHdySVN2WUx4bW1obTEveGdpMzEzMFpFVGJSVDhC?=
 =?utf-8?B?TFhpbnFST3VQbWpsSUNlcm96Nlcrajc4SSs2ZGU2L0ZCdTlKbW52RlBZbDlP?=
 =?utf-8?B?Q05QSkZ4ejhxWGtGaitGakpHV2VHeWNaSUFsNzZHU2JsRmhDWjRMbmVRdVM1?=
 =?utf-8?B?MG4wSS8zSitxUEVYNDJOcEZBOXp1SzRQRHk0aTNIRk9OYUhEN1Z4TFRXRHkv?=
 =?utf-8?B?WVFKYWRrZnNmNGNrS3JtMEFEblc0MzFvTmdTWWpRK3g2b29tQnVkZy9DcjlQ?=
 =?utf-8?B?cldWTUNubGFZTTNXaWpKWjZYbmlDb0ZxL2dZUGR3YmNteEFGZWhhZFpTZ1Bk?=
 =?utf-8?Q?hAYopknHW50=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTBpT1NlcmFDK3JINEZtSHA2Ni9wQm5yZXBueWtoV1lOdmNEMXhjKzk3RW1q?=
 =?utf-8?B?NkdVWnlJZG9RRDNXZ25aeCtjalFhSmg2NjNmWlJLRU1KT2liY2ZKK1BBZHdQ?=
 =?utf-8?B?QmJGQnJlbWUzUERkTXdTN2lxY2wvWHA4Q1FZTXlHcStDMUxlR2JpdzBTSGFk?=
 =?utf-8?B?Rm44Q3ZPaUc4VlNwdkl4cTdTTlhiaEFGSEJQcE10bWJlU1kwWS9mTzRWMHVy?=
 =?utf-8?B?dzZaVFg0TmNvOEU4U09rVGlJdEtlM0xZM0tFMytTUWJIUW8vc0JSeDdISEpX?=
 =?utf-8?B?cXZ5SUxybjhuekNMV096NlRjOElYNit3TGx1QllBSUJCQm5PMGx0Ujd3dzJz?=
 =?utf-8?B?cVNLTVZUWE4zeGR2R3gwSHBlWkE3dTYyL0E5cy9BNHZONjlBY0s4N1NOZ2x5?=
 =?utf-8?B?M2swL3FOQVFFbDIzTWM5R0tuVnY5M3VRVGNCVDFHVnRhWlBCenhyaGNGbjho?=
 =?utf-8?B?anJkZFYzNHBieWZ2OFhpbU1VL201dUNIKzVLdzcvZXhzN25Sc05mOXJOUm5r?=
 =?utf-8?B?dXBFbDFRRU5ucVhyekFVQ0VDalluZ2JDQi9xVEpJaHAvVU5CSnBVTkVOY1E2?=
 =?utf-8?B?MlJkZE1kYmF1djk2UWdzcE9kRnB2VXAyalBmQTZMdm50RUl5cDFqRFVpUzZp?=
 =?utf-8?B?Tk8xZWlTWlNra2x4MHBBVzZWQ05qbDg5aFNSUWRhd0M3UUphcVk0RFgrNGxY?=
 =?utf-8?B?MjN0UStweWF6R3RkcFY1Z2NJS3lGT1dKSy9RUnhoNTVTbHR3YjB6YWFldFRZ?=
 =?utf-8?B?V2pBY1R4bEFBWVhrN3p1ajFFWkNFVGRnb0xGQzV2SC8weHZyQ2V4SXR0WG1Y?=
 =?utf-8?B?b1JpSTRadG1uRFlydmdEYk15ZWVweTJmN3J2U0UwVkJmam5kcXYyU1J3c01i?=
 =?utf-8?B?ay9wYUdXQzQzNDBLKzluaXhyOFRNZ1crSGRkdDlDM0NDYjErNDc4VXJrTnhC?=
 =?utf-8?B?UVYrRjFkd3AzOE1hR3RMSlFQSEtiZDB2QTF3QzJadlpmQUNraUVSM3I4ekdJ?=
 =?utf-8?B?aUJTV3IxZTFnMjVydFpnY3FYQU9BMkNtYTVRTnQyVGtXd3F3TVl5SEU5djZ5?=
 =?utf-8?B?SE9RVm51L2hNL3c2dVUvK0QrM3JMMDYzOWNBS1h3bzZVbXZzREVBR25zM3FP?=
 =?utf-8?B?c3lQazVaODBWbWlMUG9UNHljc2E2VTQxNzFqQ2hqcUhxV0RTbStGc2s3RlZh?=
 =?utf-8?B?cDdnWTEzTFlOUWtybUdMTm5CSW4wVkZscmxwUXNhSXdMOGZscTNra3FEclRx?=
 =?utf-8?B?MHNFYWhjeDg4VVRCUjhObTR5SFp0endHWW5ZU2ZPYWJoVVp0Y1M3NlpTWExm?=
 =?utf-8?B?SXhPQnh6ZWVHeW1nYjY2ZW5BWTMzTnpNbE94cWFUUlFkREZGOFdhV2RoQTR2?=
 =?utf-8?B?ak10a0tEYytZVlNEV05wOGRqR1RIMi81cE9ydjZFU0dzalZkZmVvSDQySkoy?=
 =?utf-8?B?OEZPcjd1Z1B6WTlGdkZRZy9QeWJxdnc4dUp2bWFRaUszbEtJdExadVY1Szh3?=
 =?utf-8?B?amNiMmlQVERTcFljS1drejJPTS8vTXBVV0wxL00zNzl1dTlDdHdZOU9qb0hD?=
 =?utf-8?B?S2h6YnZoV3BOaVN0SWtrbVNEcWZVd1hXVXJpWU5iQURrclFrdC9vbXpFNlRN?=
 =?utf-8?B?UTVPNFBjQk5zZmU4V2NEYUltaStNS2FGRkkyNm1TUWJ6aWltOVAxaXAwYWo4?=
 =?utf-8?B?emVlY2o4c3NMdi9LaURrTnlWRWJnRitYeGloZGREUXJTR2hBNE9KQzVxL3RY?=
 =?utf-8?B?TWxQQWZSVmFzWEVMTVl3YkUraHdJMTVDLy9TNnI1ZDhXSklIcHpCaG1UVndV?=
 =?utf-8?B?RFNJMFB6VzB5bWlzYzV6MmFUYm9uY1VRbkVzV3B6Uk1IV1gzNXpaNThPcjZu?=
 =?utf-8?B?NW9ic2RRZysrQ3IyNXR2TnY5MksrQ05CWlNGamgxeVp5YkZsUWd5eldEbHBS?=
 =?utf-8?B?d0R4L3NKUkxSN29FMTFDbENZNlhza3BYWGtlMldYZHFGVW5Bc2wzTGZ4bllk?=
 =?utf-8?B?S0VFVzU0dnFRalJiaGtpdkZsZis5blVLY2Fpcmo0TG1XSHdYYTMwaVJ0dzNE?=
 =?utf-8?B?VkVONHRBNmtUQ1VPZUxsUkNIRDZMUXVRUUx4SVJPZWFhdjFqYW5iR3NvR2R2?=
 =?utf-8?B?QVZuMUhPYzZReGwvQS9PNzE1Zk9WVThHYzZmdWpPYnFNaVd3aUJnbnBvNUJx?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da4aa082-98b8-4839-f55e-08dd91296acf
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 07:48:43.0417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOqH5MnbpTwOp7sjbNn8I1X+GZP4iTBou6CPAXeMZGGMY5B9m/uu3y11OeKv1GGCaBDafag9Uw7hhDpCnrpKAT5OJt+We4O0yws1eRH0+lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7807
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

On Fri, May 09, 2025 at 09:46:44AM +0200, Zbigniew Kempczyński wrote:
> Mem-copy for byte copy requires width/pitch to be max 256K
> (higher bits have different meaning and setting them might lead
> to undefined behavior). If witch/pitch are too high limit them to
> the maximum possible for the operation. Asserting might lead to
> test stucking in multithreading scenarios so displaying warning
> was selected instead.

Might be good to add this as a comment in the code to prevent someone
from replacing igt_warn() with igt_assert() in the future.

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/xe/xe_spin.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index a92903b6bd..7ff06cab3b 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -126,11 +126,36 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  	}
>  
>  	if (opts->mem_copy) {
> +		uint32_t src_width, src_pitch, dst_width, dst_pitch;
> +
> +		src_width = opts->mem_copy->src->width;
> +		src_pitch = opts->mem_copy->src->pitch;
> +		dst_width = opts->mem_copy->dst->width;
> +		dst_pitch = opts->mem_copy->dst->pitch;
> +
> +		if (src_width > dst_width)
> +			igt_warn("src width must be <= dst width\n");

Should we not also override the value in that case?

    src_width = dst_width

> +
> +		if (src_width > SZ_256K) {
> +			igt_warn("src width must be less than 256K, limiting it\n");
> +			src_width = SZ_256K;
> +		}
> +
> +		if (src_pitch > SZ_256K) {
> +			igt_warn("src pitch must be less than 256K, limiting it\n");
> +			src_pitch = SZ_256K;
> +		}
> +
> +		if (dst_pitch > SZ_256K) {
> +			igt_warn("dst pitch must be less than 256K, limiting it\n");
> +			dst_pitch = SZ_256K;
> +		}
> +
>  		spin->batch[b++] = MEM_COPY_CMD;
> -		spin->batch[b++] = opts->mem_copy->src->width - 1;
> -		spin->batch[b++] = opts->mem_copy->src->height - 1;
> -		spin->batch[b++] = opts->mem_copy->src->pitch - 1;
> -		spin->batch[b++] = opts->mem_copy->dst->pitch - 1;
> +		spin->batch[b++] = src_width - 1;
> +		spin->batch[b++] = 1;  /* for byte copying this is ignored */
> +		spin->batch[b++] = src_pitch - 1;
> +		spin->batch[b++] = dst_pitch - 1;
>  		spin->batch[b++] = opts->mem_copy->src_offset;
>  		spin->batch[b++] = opts->mem_copy->src_offset << 32;
>  		spin->batch[b++] = opts->mem_copy->dst_offset;

LGTM, let's wait to see the CI results for v2 with the fix for xe_spin_batch:

    Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Francois

> -- 
> 2.43.0
> 
