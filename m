Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57838C3DA45
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 18:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FCF10EB37;
	Thu, 11 Jul 2024 18:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRFRZhjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8DB10EB37
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 18:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720722547; x=1752258547;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gQSLb62wKBnTyocQKkTG0q1B+UFVb6nbQoaCdUdCkeA=;
 b=lRFRZhjNTUCJ6ODrlBCHoSCDpkfz4lIEg/Dg6N/FwLCdm5SrwHudH3va
 i1+0NSa8O9eiRW5LB1MD5Wn1dw9szWKyep0Gy4Dw5H4nL4I9IWyuVqrh6
 dUns3Z5lUEjd8p4c5g7UZUX6K75OhDhnupP+Ma9m1i8KsH+flt83AsyDM
 omPzRthZXJuICzrtS3x3yB6TD6SWE+NnG+wkC9oe+nCzcc9M2qaNC1Kak
 8h4hcDV5raCwK7NxikBri2MwghlodD0Mv3wnL/E/y5+VSN6IYO1W6Cmzl
 GlrWtaeXZPrltWFVbUkbAyYpg5HaxpRN7gPsoCqg/ki7AY7k3VVWY1NB0 A==;
X-CSE-ConnectionGUID: 184c5ySNT0e5k9X7xQ4rLA==
X-CSE-MsgGUID: 0uNAxp+sSAOxJrkMC4FniQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="21041210"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="21041210"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 11:29:06 -0700
X-CSE-ConnectionGUID: w/tTmmJUT7W64XjepQS+og==
X-CSE-MsgGUID: 8Wd45SkPTSCWhiA4TUNwLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="52963583"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 11:29:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:29:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 11:29:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 11:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntxpGG9OrqvzJtq763pyIxlILuI+h3GY7VVWLRgBVT0TzSeF9YZaGLv5QIk2Zj0EF2YF9dSV1CyER5/yVTRgY7wNY2z1JZMs1aOOv5kp0H/GtBVmqNds+LhizAaFtd6ddiGIcV6YiP8386zVfye6tz+0Xhk/0nBB8hyyknR2tbFabpdRlcokM5yhYNyyEVdDkEI1l15q6stYLz8g4Qm1dkhxUUslNxELI9v//Zl+d1YC2Zynrg+dV5PXd5CRTg83IrheEOrHwQ4zAkVIBVC8Q8eAUqZId5DYRWYCQNOD/gdG62K3YPIJcWq6VeUSuWiwITn8kl+ODk/Y87hMkltB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Bjl12BPn2PP71RnVQ+TZjF1MekZDMTF7zKOPbTz02w=;
 b=xhx4AT0kts/S3FTVgVV5749O2SkfLKLQL49lVkA0PNJTCz7nSoj5/R65DLlbeOJKN91FyUGhtM3TEuxFok+Vp83WEAuEBZOlkiULnXp7/XvLzMzndVR8eeFPxo5ilI7vl+JTvXyWhTgujc39v1kCMtbn7Pquj1ZLeWz7Oq5HOUGpkjQLkzgsLqjzQ16GjCsvSKsQEeZzSei48QNYp7R6Q2q0tjyKFE6yJ9Wnf69reSj5vkVf+4x2eVyFShCpr9rZpYG00pbT+XmbqncCFzCX+p4snvh5c65Qp7nLG03aDBdBgTscMZseSHcwMlZITRpSejKw2CaoUwD8DmS54+Vhyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 18:29:02 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 18:29:02 +0000
Date: Thu, 11 Jul 2024 11:29:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t v2 04/10] tests/intel/xe_drm_fdinfo: Add helpers
 for spinning batches
Message-ID: <ZpAkbG2v/7plCgAo@orsosgc001>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-5-umesh.nerlige.ramappa@intel.com>
 <o73rxaucq4ul5cuyl4j3r6dynatc6rt7npip3npxna4ffeangn@nzr3um54pt5v>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <o73rxaucq4ul5cuyl4j3r6dynatc6rt7npip3npxna4ffeangn@nzr3um54pt5v>
X-ClientProxiedBy: BYAPR06CA0051.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV3PR11MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 380c6b6d-8600-4300-f310-08dca1d7569d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bERmci9aYXBNMVdyRGI4L1JYMGFGOXpvOFdkTGxOV08rck0zaEhXMStpVzY5?=
 =?utf-8?B?UExJZ0VjM0l5cGxscWVVOUo1d0xqNWc1RjF5KzBXb202NklVcFowQ0NoVVhE?=
 =?utf-8?B?UlRqYzEyYXdyZGpLTDVCc3RKcnEwY0R4S3NHbkZKa3BOMEZqMDZPRTA3WXlt?=
 =?utf-8?B?Q3BFaVREUmRhTllUZ2ZQcFVQSVd4blB4dmxtUjhFbVZnOWR2WHhJSGpQZHZ1?=
 =?utf-8?B?bkpsL0NPa3RicnlPSVFSbXEwY1JYR2w1RWFvZ3BhMmhpWEhYUVJwcjFtZXdN?=
 =?utf-8?B?N2IwWnp0ZXdxcWpiZzdiWmNEalB1ZEVDU2VsbnRIYzRSWmovRVlISnpDSVQx?=
 =?utf-8?B?Rm5OdlBIQUtEM1ZaT3psL2ttR2RGT0xBem9UbnlaOEpHbk0vUXdvb3pndXlm?=
 =?utf-8?B?eE9iaVBjb2locDkrbFgxNkVYZ25QWGpMeUVJRE5ZdDZmTy9STUxkQTBDNWdv?=
 =?utf-8?B?S0hPbE9nSzV0bFlhK2lKWHpva2JnSGlhWlBKc0FUR0pMUVFvbFZvOHhreVBX?=
 =?utf-8?B?bGN5WU02R29LZmVwU1Y1SE5EeGJTYmJ0Q3JuTVVpd3c0dkdkOFVsUUprUjhM?=
 =?utf-8?B?WGJSSGs5VXBFby9KZWVCY1dZQzN5dVhWZDlSOERLdUpkUnk1U1RydnNBQ2sy?=
 =?utf-8?B?RlNIMUpYeUhONTA5VHltK2lETXZPZjVPNzF4Vmp5NEpCa055SUxZT0Q1Vy9Z?=
 =?utf-8?B?VmdITWc3eVZGZDVkS0I2ZTgvSUlFQzFrV25WWllIdGhOanlKNzZXRzdqbWs0?=
 =?utf-8?B?dFdSTmlhS0M5Yzd2eDE0Mk5zcmFQTFNoMlRPSTZEOEI3dVk0ZTcwRDBNckVx?=
 =?utf-8?B?ZjJrcmlRWjdESFZ4Y2NDSmhtbUxWK1N6K0FSdTdWbjZEMkJNdXFlTXZmUGFi?=
 =?utf-8?B?TjZkVGtKTVhoMFJmT2lhd0VmazJkMkovZmtWcHNQSlczWkt6aGdVVDlPZHh5?=
 =?utf-8?B?aGZhaUsxN01NWEt6VDJpeXhaTWFWSWpTc1ZHTnUxOVN5TlgvY2pqcFpibnd0?=
 =?utf-8?B?VTRyMWYxZHZKaUFaME9LenpudHpjcmV2RUxQM0lNMm1QNWU0a2RnUkRuL1FJ?=
 =?utf-8?B?MVRvWW5KNTRId3FIM1pGTnc1UEpJTUhZNHNTR0FaVDJPUWtkeFNOcVQyWXNS?=
 =?utf-8?B?K1hYL3ppZXU2UTZrYUNhbTlGcDNieGdWNTR0ODhtU0hEbnJ1azlreG5xaVN4?=
 =?utf-8?B?VGZKQmxsVnplRFU3dHJPVHlzUDF4L2hFV0xtNlZCVVErKzEvYmpzcFNXY09s?=
 =?utf-8?B?cnpySlFHSUFCUy9hdHZYblZqaGFzU0tDYVNqNW5Od2tIbFhKaktOV1hsL1N4?=
 =?utf-8?B?dXRaazk2UUxndGE4dTVKY2JXejJNb1o3aGtOYXZHTmsvS3ZUcWRabVhXOWor?=
 =?utf-8?B?a3plcFE2VEhEd09HTXY4dklPWHhOQ3ZtbGNRZGxhNlYxZEMvNTBWc1k0QXcy?=
 =?utf-8?B?bW1nR3ZOeStGYnAzdHI2VEhVT2JBQlhJcjUyYnFsRmlUU2VHV3VxWkpEb0FE?=
 =?utf-8?B?Si8rTldUZVJacjZJaEp4RmZFbm56SEpRMnh3dnA1VEYyZ3pzM1BQaWpjYUFT?=
 =?utf-8?B?a2U0LzY5UTNBQUo0VmhZWHo5UDRZb0VsUk5JUTRPN3YycEt2NC81a0MvUTVM?=
 =?utf-8?B?UFVpdG1uQUxjQUErUWpJMTlWUDI1Q3dXSUNQL093bW9JWUhHT2JhZ0VHQzFh?=
 =?utf-8?B?WWg4czdUNXNsMTFvSEYybjVIWFFLVzVSVFZjenRjS2ZuM05qdGdIZjM0WjMx?=
 =?utf-8?B?bDhtRUdDNXZZaXBmZkpURE5qWm1wS0NPekh5UjRGeXZ1YkRwVW9HR25CMEZB?=
 =?utf-8?B?RlBnWHJOdEEwMDd5cFVpZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek4xS2FQK1hubUl2QVFYYWcwREZlN25XdmpwenEwQUFNWTNkWlZsQ1Zuckkx?=
 =?utf-8?B?OXFWV1RYdGN2QXRrRnlMZ1NSWXVsZmwzWjViVjZQaWw1MERZSU1rZ2gvVWdI?=
 =?utf-8?B?d0M3MUpKTlJ0bUh2M3c2aVZkMnpra09uZVcwQjNFbkE2OE1Pd1k5emFQMi9X?=
 =?utf-8?B?T1FDSXBITFhVeWpGSTU0WXJLbzZMSk1Iejh2cDQ4ZXloT0pocDNwTTRXUW5s?=
 =?utf-8?B?ajJUOG5GSy9wTzhvWEZhMnNKbW82VUFBUXhLVnl0cTRvZGRTSXFCT1NpM2xE?=
 =?utf-8?B?a1RZZSs4ZFEyNHZKSFVYbzVRNlM2L0JKSlR3emdFRUdYdUt0eEhCNnpQalZo?=
 =?utf-8?B?WlZlM1dTRFFHQkVkNmF1dG5JUmxXdENWTEswUzlnZ2h4R0RKY1c4ZmRRSlNv?=
 =?utf-8?B?VmJadXlVYnFMa01iQ0ZzemVDcmJ0WGdHcWgwQyt4YkdqS09GMUJoc21Oam0v?=
 =?utf-8?B?NlJKS2RtTFdUYnQ1SzF3UHZKOEJ3UXRXT3hla3RhOU1aZm1aRUM4WFpQWHBx?=
 =?utf-8?B?QlliRVQvcmc0b0l1b1JIQUM2UWhCc2Rna1FsMlBTdTNWWEp6VUtrUEJpZERz?=
 =?utf-8?B?UzJFZXhlWU01Q1EwWEpTWHo2Q2VGRTR2VXlGa2grYjUrbHh4OS9NYnUzNnpW?=
 =?utf-8?B?V1J3L3JJZGJjVTBFNHJic1NTYzNBOTFCWWpPS1FMVEZjTzc2Q0h3YmFQRlFk?=
 =?utf-8?B?d0NhaHJrRWJxSHAyRW1vV2N3dkVCcSsxdWRxZjJzSUN6WFhUYVlEdjhMaHNr?=
 =?utf-8?B?VXRCbXFDdmlsS3VPNGsrS1QvMS80KzliRWlOS2FaYjJINHFuei9TZ2VxYmkr?=
 =?utf-8?B?Q0pyU2JEa3IycUwrVWFWMTlad0FUbHYrZUIxQm5pT2FVVWR4YVllK3hJaWlY?=
 =?utf-8?B?Z0p0VnhJOHB1bTRacXh0Y0tWdHFYeTZ4bmVrT3dPTVpnNVRlUnpUWnRCK3Zq?=
 =?utf-8?B?NDFHSWQ5WWdjSzdKSmRhRnpmbmZyVURTZExiSk1KUnlVS0pXMFN5eFB6ejdQ?=
 =?utf-8?B?OElMQ1dQYTlEV0draW5xTkMvcU1kTG9CU0FrZFdTaitsdnhNY3ArOFdEbUYx?=
 =?utf-8?B?T0Y5OExnWlMwRzdCY2o1RWlrSWpleEcyZDE2Z3lQQm0ydjlWQnNwdmRWcXI0?=
 =?utf-8?B?WndrRzlBUHBlVFdyNDVLeHdrcm9ScU5FQ1VrcVJvYVQxRXNpSHFEM21IenZu?=
 =?utf-8?B?bUhldjFmQjlJcnN2VzdSVmdRWGNUUGlzaEJmSSs2YVhqVm9jNi96Z1ZMRlFa?=
 =?utf-8?B?aWZwODBkamduUDdVRnhJcXRYblpjd2piTXBIZEp2ZHBDMTBKZ0ZBb2Uvcisv?=
 =?utf-8?B?aHBIMk0xbllLUHFBT1d1bU9VZFg3eUdoaHpyZjRKZWF4T3NqcWJ3cmo0WDZH?=
 =?utf-8?B?eWlRTWl1djFxR1hQaFVBcDViWXk4SWFoamJDYWdoY04zS1NnRmc5WGFDS2lG?=
 =?utf-8?B?Z2ZvanRCV01tVEdDRkN2aE5wYU1kR3FGd2l4RlNrUkFEZjRsZ0thdFMyOFVO?=
 =?utf-8?B?YnM3VThmT3creEFUMHoxcnhtOGxEVFlDaGNlUE95d2JpZE1LZ0NJdWlob3Rq?=
 =?utf-8?B?RDZlVXlnOTRncHF5Z2RteU0vejE4U0g4ZXY5SUU3ZnFGZEIyM0NsVDNsc1lo?=
 =?utf-8?B?ZC92bzB3NkNudXRJTTdlTFV2WWhrOXFEa0pLNlRXVWpmdDRsMnBpanV1aE1P?=
 =?utf-8?B?anFVQ2ZvVDNlZnNvZmt5SzFydTc0K1dpK2VEMDdEL014QkV3S3dHdjc4L1R0?=
 =?utf-8?B?Z20wazBHZHk3TEVlQXBaYTU4blYvUFA3U2lKb0pvaGIxd3U5czIrUmpUWm5F?=
 =?utf-8?B?cE4wYW1EVEtub3prZkNack40ZzZKNmxqV1cyUHU0ZnFTUmJjUG54eFhTRDBy?=
 =?utf-8?B?ZjIyRlNsNHo5Wkd5RjlNb3l4ZGtzWU92b0VnNDdsL0JxbmJ2YkpDT3ZNVHlv?=
 =?utf-8?B?YThib0g3aTlVZis2NWRxbjZxZVEwTGhHYXp1alJIMWZtVWowTGN3VnIyS0FB?=
 =?utf-8?B?TzRrS3dUWmdlZkZYU2dmeUQzS1Jvc1VVdDNZSjNmTkxZZUNqWnJGd203NFM0?=
 =?utf-8?B?RkR3aXNzT1RqejhDdHZjWVdpRDR4cUpqOFVDS0JHeXN3THdlRjRJVU5ZdVVq?=
 =?utf-8?B?d0VGRzhBc1BsYzQ1dmV2Mm5kK2UyM3NZYkpodVJRYlFZdGhxcWdCTlhpTVhx?=
 =?utf-8?Q?HvzyqmN2GYllobGC9ZJ48cE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 380c6b6d-8600-4300-f310-08dca1d7569d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 18:29:02.4362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+28a1mZIsPd7fCemUyNoYUV91JMZpbwtJEWt9zisRcYUBboKkTjV8rXlz5G1F50JIuh7LIjzkZummGw7gYsYdwzX9wUXOdNeYhctaX6Nnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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

On Thu, Jul 11, 2024 at 07:46:23AM -0500, Lucas De Marchi wrote:
>On Tue, Jul 02, 2024 at 05:25:26PM GMT, Umesh Nerlige Ramappa wrote:
>>Add helpers for submitting batches and waiting for them to start.
>>
>>v2: Remove xe prefixes from the structures and helpers (Lucas)
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>tests/intel/xe_drm_fdinfo.c | 135 ++++++++++++++++++++++++++++++++++++
>>1 file changed, 135 insertions(+)
>>
>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>index c697f3e53..037f25e53 100644
>>--- a/tests/intel/xe_drm_fdinfo.c
>>+++ b/tests/intel/xe_drm_fdinfo.c
>>@@ -54,6 +54,17 @@ static const char *engine_map[] = {
>>	"vecs",
>>	"ccs",
>>};
>>+
>>+static const uint64_t batch_addr[] = {
>>+	0x170000,
>>+	0x180000,
>>+	0x190000,
>>+	0x1a0000,
>>+	0x1b0000,
>>+	0x1c0000,
>>+	0x1d0000,
>>+	0x1e0000,
>>+};
>
>where are these numbers coming from?

The hardcoded number above are arbitrary, although I don't know if 
that's an issue. I did see similar numbers in use with other xe tests.

>I'm looking at
>tests/intel/xe_spin_batch.c and the lib/xe/xe_spin.c implementation and
>I don't understand why we need to add so many helpers and handcrafted
>things in this particular test.

These helpers are just a break down of something like xe_exec_balancer.c 
-> test_exec(). The helpers are still using functions from xe_spin.c.  

The breakdown helps control some execution elements for batches like (1) 
using a single address space when running batches on all classes, (2) 
configuring width and num_placements for parallel/virtual cases and (3) 
provide some flexibility to test utilization when the batch has started 
running.

Regards,
Umesh

>
>+Matt Brost, +Zbigniew Kempczyński to help help here
>
>
>Lucas De Marchi
>
>>static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>>{
>>	struct drm_client_fdinfo info = { };
>>@@ -329,6 +340,130 @@ static void basic_engine_utilization(int xe)
>>	igt_require(info.num_engines);
>>}
>>
>>+#define MAX_PARALLEL 8
>>+struct spin_ctx {
>>+	uint32_t vm;
>>+	uint64_t addr[MAX_PARALLEL];
>>+	struct drm_xe_sync sync[2];
>>+	struct drm_xe_exec exec;
>>+	uint32_t exec_queue;
>>+	size_t bo_size;
>>+	uint32_t bo;
>>+	struct xe_spin *spin;
>>+	struct xe_spin_opts spin_opts;
>>+	bool ended;
>>+	uint16_t class;
>>+	uint16_t width;
>>+	uint16_t num_placements;
>>+};
>>+
>>+static struct spin_ctx *
>>+spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
>>+	      uint16_t width, uint16_t num_placements)
>>+{
>>+	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
>>+
>>+	igt_assert(width && num_placements &&
>>+		   (width == 1 || num_placements == 1));
>>+
>>+	igt_assert(width <= MAX_PARALLEL);
>>+
>>+	ctx->class = hwe->engine_class;
>>+	ctx->width = width;
>>+	ctx->num_placements = num_placements;
>>+	ctx->vm = vm;
>>+	for (int i = 0; i < ctx->width; i++)
>>+		ctx->addr[i] = batch_addr[hwe->engine_class];
>>+
>>+	ctx->exec.num_batch_buffer = width;
>>+	ctx->exec.num_syncs = 2;
>>+	ctx->exec.syncs = to_user_pointer(ctx->sync);
>>+
>>+	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>>+	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>>+	ctx->sync[0].handle = syncobj_create(fd, 0);
>>+
>>+	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>>+	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>>+	ctx->sync[1].handle = syncobj_create(fd, 0);
>>+
>>+	ctx->bo_size = sizeof(struct xe_spin);
>>+	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
>>+	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
>>+			       vram_if_possible(fd, hwe->gt_id),
>>+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>+	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
>>+
>>+	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
>>+					     hwe, 0, &ctx->exec_queue), 0);
>>+
>>+	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
>>+			 ctx->sync, 1);
>>+
>>+	return ctx;
>>+}
>>+
>>+static void
>>+spin_sync_start(int fd, struct spin_ctx *ctx)
>>+{
>>+	if (!ctx)
>>+		return;
>>+
>>+	ctx->spin_opts.addr = ctx->addr[0];
>>+	ctx->spin_opts.preempt = true;
>>+	xe_spin_init(ctx->spin, &ctx->spin_opts);
>>+
>>+	/* re-use sync[0] for exec */
>>+	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>>+
>>+	ctx->exec.exec_queue_id = ctx->exec_queue;
>>+	if (ctx->width > 1)
>>+		ctx->exec.address = to_user_pointer(ctx->addr);
>>+	else
>>+		ctx->exec.address = ctx->addr[0];
>>+	xe_exec(fd, &ctx->exec);
>>+
>>+	xe_spin_wait_started(ctx->spin);
>>+	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
>>+
>>+	igt_debug("%s: spinner started\n", engine_map[ctx->class]);
>>+}
>>+
>>+static void
>>+spin_sync_end(int fd, struct spin_ctx *ctx)
>>+{
>>+	if (!ctx || ctx->ended)
>>+		return;
>>+
>>+	xe_spin_end(ctx->spin);
>>+
>>+	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
>>+	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>>+
>>+	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>>+	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
>>+	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>>+
>>+	ctx->ended = true;
>>+	igt_debug("%s: spinner ended\n", engine_map[ctx->class]);
>>+}
>>+
>>+static void
>>+spin_ctx_destroy(int fd, struct spin_ctx *ctx)
>>+{
>>+	if (!ctx)
>>+		return;
>>+
>>+	syncobj_destroy(fd, ctx->sync[0].handle);
>>+	syncobj_destroy(fd, ctx->sync[1].handle);
>>+	xe_exec_queue_destroy(fd, ctx->exec_queue);
>>+
>>+	munmap(ctx->spin, ctx->bo_size);
>>+	gem_close(fd, ctx->bo);
>>+
>>+	free(ctx);
>>+}
>>+
>>igt_main
>>{
>>	int xe;
>>-- 
>>2.38.1
>>
