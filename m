Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E560C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 22:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34EB10E00A;
	Mon, 14 Apr 2025 22:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLOgMDl8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D35410E00A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 22:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744670504; x=1776206504;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=peZQJAvtAIj2HSByJttJ2AcpNRw0Bga4OG3jiHw9uvw=;
 b=FLOgMDl8gANwDKJYuD+pFnwa+SH4V0yw0PA/8FhdMLeZxbgxe4zOhFKl
 cd6bs5MhoTPOo1HJTs/Exwnx+2jxtvdfa6dpUkrGiUF7QKDugLUY0hC7N
 /C9iPvcMObbAO3Xj+5Q6s+pmlkiv/V3nfJ8QNtr2z5JQpVbm79gyOYIwX
 v+EjbsmU08lxuP2OySruajxeI+Iy+QCZT35rBQfpBJH1p3EjHFGNxbzLL
 xGBYU2fu2c2soCnUM2yB9arwe69YaOpCJChJzJcpgWz3M5CvTEYxwOzjh
 8wzl3pg/9kZrZP2mcr5QDolLBB/YQQmsH+kbKQLNUm4Fpc933BqaxmSee A==;
X-CSE-ConnectionGUID: Zra2iUAaRsudw9o8/h75/g==
X-CSE-MsgGUID: 2bZl1KtBQFKe2htJXACFSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57542285"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="57542285"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:41:44 -0700
X-CSE-ConnectionGUID: 6NjubM0GS6WHElx9ETJnag==
X-CSE-MsgGUID: hjVgWZG0QKmjVkXrNA7GIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="153124539"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:41:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 15:41:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 15:41:43 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 15:41:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rE0BqbcYMItIaZNvgCXb9owjkjJ0nX86e8Pj3g2pdEEv4NQjjMPYbIB2y48W+NLvAZ4OtHE1AtJ8I5NWjR4+X59mzT5/hE9VhbJEjnpK8ZAJuEtbKwMiPPprrXXaYqm9Q+UGpwtSBmgTJOwP6eQ805etGQhwWe+yyRCeAPik0HiBF692fCTawkCUxnS6Pp8qD/+RigEillUMGrI57oQJtf43x/YexdX6QoK1nAiNcVy2Cf7jeqQ4YrnotBf0ByljTjITyS9/X6lis0eqCPcCcrq1g6TM3zZcrYw3VinKs1jQl84vWQqootKPeEeuRo3il9G+b0pE2VByLvkd6xpdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pmz5HbQUWcmBmFTE3KmrIQOzJFDiT4s3LqImsz4HTWg=;
 b=wCww5GJHUvRpNoZs4uncm+pWlIUKyPA2K4CFcBr4aDIbbb2eebSxr01iWYOlAp7LqaBQM1aWnsf67B+EA4QTIIDfnqZ3AIQWLHREowk53nieD2CKH46jHZVgev+hgFSnObrVVthbSB5u1zOjR3B9br804Xhz5bvGCPOujobrPor1USzhahPSZzb3KFfqF4WbJC9zOJrSc9+9k07PI/UamZGAhC9bJs7DZWryeo7aqUKU4UgJVwdnwNy9kM2rSOeN4vTdKj0fH00EENXJgLcf3Czq9t5yA9ZOQPiKKc6nhvil4dl891FgW/i6m/JnUvOjcM8IZ+h+KpbrAgapbnISjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB8249.namprd11.prod.outlook.com (2603:10b6:510:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.46; Mon, 14 Apr
 2025 22:41:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 22:41:23 +0000
Date: Mon, 14 Apr 2025 15:41:22 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 6/6] tests/intel/xe_oa: Use TestOa metric set also
 for OAM
Message-ID: <Z_2PEiclcjnk6STY@unerlige-desk.amr.corp.intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
 <20250408181210.1052760-7-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250408181210.1052760-7-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b2e0a7-3896-4754-9215-08dd7ba57c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXB6c1U4cy83VjZnZjZHbzVybTVyNCtobDFCMlpJeFROVThFZU9JZzJIalcv?=
 =?utf-8?B?UG9nRXVaOVFvVU9xeWltZEV3MWErNHRqZjNvbVc1a2VUdW9aTEVvNk9ZU0M0?=
 =?utf-8?B?c21MdzFXYVdPa29FL2Fib0Rhak9WekU5MlFoWU05b2lJc0hXQTYwampSV3N1?=
 =?utf-8?B?K0VPWlJJamZJd1JmaGdaT2twcE1JUTgyNTNWQ0pmN1VSYlBmWE9DeXNlYlR0?=
 =?utf-8?B?UTRGQnNiQ2NtY2NPQnpRZzg4L0lYNkpxSmFDdnlNV1pkcHo5dHQ0THROM0pU?=
 =?utf-8?B?cEJ6aGM2TnlCRFNTS0JnTXN6Q0lPOWthSW9oTHBzSmkyeUlTVFpMUjNJRXd4?=
 =?utf-8?B?YkhiSEMxL2JUcDV3NnJDWmRFdDRnd2NGR2FILzh5TEM1djBGck0rNjdMTG9o?=
 =?utf-8?B?SlFtQkdHNis3V28xNm9aUU5XcGsvK01TL1l2SFVENmhYZXpaUS9hL0pXMmZq?=
 =?utf-8?B?aXZYMFZVeVY5RlVyUGxTZU80WUFuVmtVQUJ6eEdFeG5vSndmMzdwOEEwSGtS?=
 =?utf-8?B?TGp2SzVTL1FYWWpSSTArNmdsc2xMdWhXQ2pGYUZPeHlXZjhLcXN2SFcxMXhU?=
 =?utf-8?B?N2U1WjYxeUJUWmlaNVhLNFZwRnlLZjU1dSsya0pUUVFqdEFXME9EOTZVZjkr?=
 =?utf-8?B?SlZHWTRmUE9rNmFVK28xanZRWTlNSmJRUkVFSno2ZW9ySmhvVExDWmxJUThz?=
 =?utf-8?B?a1pKZ0lSVFNxZ2dwUXBEaE9SbGg3L1k0QTJlNitRaHVHVVBoNDZlQVpHRDhm?=
 =?utf-8?B?VnducnEyb245eTkxWUZuTUhHc2JaTFV2blN5bSt3dzF5UFdOK1llcUJHeEts?=
 =?utf-8?B?MDJvZVlyTVU0ODBNNmZrTU01a3lYSE4rb0IwYkZUbXB4eXpid3V0UWg2RWtV?=
 =?utf-8?B?Wi9mNm5jMThjeG8yM0xTVE5mSTNxQjFNSFpHMUt5RytCcFc1NnBVTE01U1Iz?=
 =?utf-8?B?TC9PS29hQlRLMFArMk9rUmNCYzgxUDVYbG5zT1VmenNIWmVEU0JQQkRDMjZt?=
 =?utf-8?B?bkM0WmNCUWtnRCtLdms5bXBHMWlLOW8zM1BwOGFiSlpOb2pQUk40Sklib2J2?=
 =?utf-8?B?bzN0ZGM3STNSVkVDOEl5aEpoVkU3NFJVNDFDTmJNT2NrR0xxd1Q3a0ZUcXB5?=
 =?utf-8?B?d2xhckpLNHo2Nk56Q0t6ckVtNjdkVm8wWHJHV3dnby9mVkkyYU1VL1NuZVpt?=
 =?utf-8?B?OThQNFVFd3dISkdFNnVVZ1A2dnN2aFpYcmRSZUNGY1lpL2x5NGF0QXZPUEhV?=
 =?utf-8?B?RThkWjMySCtsYmhRUUpteXB6eUhKeGtldHV3c2psV0NLMnI5UGR0TnRaWFNY?=
 =?utf-8?B?R1Rhb3dYN1JtNFlGdDhqbHl4MGdCbCtLWFZzT2cvNkFaTlhuZ21BV0Z3T1hj?=
 =?utf-8?B?SE84c2dsOVAwUGozQ0dhamVJbkVIYnFpM1Fod1R6dUsrVmk2djFFR3hZTHpI?=
 =?utf-8?B?SmV2SG9iNGFqd1p2KzhxZmg3QTZLZG9WSW9hSnFFN2NQMS9lZUU0VXVTMWMx?=
 =?utf-8?B?WTExL0Q3N0dYUjVPZFMvOTRiVDVVSHQrVStyem5KRkZ6blM5MVRSRUpmVkEx?=
 =?utf-8?B?SHVIZE01aDlta3p4elp3dnFaM3hqaDVQcmdRNTlJdk82ckYrSE82TUcvdWNZ?=
 =?utf-8?B?eUpVT2hSNkZlb2tDM1FEVStFTXUyOEFCNUxhRUZTVVFrdnBiUmJSQ3NSTmkw?=
 =?utf-8?B?dEc4ano4Q0VnUm9uZG5FYmJDdmdxMzJRL01hbm93dnFyUG9LWGdJczdIRTJu?=
 =?utf-8?B?QXI2RVJOZVJOazdJK1crSTdadlo3YUhacWlvRG81RTFZUFNnaXpvRHROQU5a?=
 =?utf-8?B?QkdPMW1TY3dJVk1iVDU3RWtCbVI4UW8xdkI4aDZXdm5RaG5hQTdtOWxVakRa?=
 =?utf-8?B?ZG1FZTZLUzRxMnFvYUIwVjdmYUZSM2d5b0hBSzBNSWhhTlBLekZWOVhxUXI3?=
 =?utf-8?Q?RsjEg6Vxc9U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cytxdU5YVzBud0ZEOHdKQVR3QXp2Wm15K3g5bnl3d1pTN3h0Umo3bWZUMGZh?=
 =?utf-8?B?QllOaGZCbTVGUDNRK1JpdG1QSkZKNzVKMnJLQzhyOEZtSTNoL092clljWkJM?=
 =?utf-8?B?TTRmOVJMUDY1by9mY1JwMVA1cldPMnIrWWlXRHhDOHFMMUR1WkdSTEZyNS9v?=
 =?utf-8?B?b3FaWXVzM0xMalNlVjRNT3JqK3hmWXhkSEVWeWZ3eWFENzg4TERLTVJkends?=
 =?utf-8?B?TDNHcHpIK0J0L08zV2FaZGx2c2srTkQyV0ljcit1b0hiTUt3WTRXTlVjV252?=
 =?utf-8?B?K0gxUWFNdzIvQ1pya2lXWjlzRTVmUUJFc3BSN2lLMlNjNm5RNFd3UjkyQW45?=
 =?utf-8?B?SnhSaWxaY1lQNFk4aG9DdGpmTEFSSW5idEpPSTI1N29aak9nYjY4S2hrcjYz?=
 =?utf-8?B?a0hjb1VQRWxjZ2RFemhKU0FET0dFME9ZdmZlZmp0M1pSaW5US1dTZHI3MWo0?=
 =?utf-8?B?Qno0cnRYZSticEFBTjdiZXMxMWViM3h3ci9MTEhjY3Z2SkROUnUwRmlGczJ3?=
 =?utf-8?B?ZHN3d2JCbGlQTTl2RXc2M2VvU2lQNkFPSHZGcmJHUkhXQ0YyMFdqYkJZazBs?=
 =?utf-8?B?ZXAzeXRxNllCZmdUaHIxaGttcjJka2VJUzE5YzZ2T1hEaU1lZ0FueGZUcUVi?=
 =?utf-8?B?aVUwZE9BWGZ4S1prS3MvT0tEYVBjcUJ5TWMxUmFRb0cyM1FQbWozdjM1S0NY?=
 =?utf-8?B?S2REdjBxMGxacEdoS0hPdjl4a0RnNGREQ3lUaFRtVWtRSGt1bXhuaDUzOXY3?=
 =?utf-8?B?UExWNHd3Q21VYXJ5eVlEZzdIa0hWSjVObWYxQVpGZUhncm5RU0JJU3NVQkZZ?=
 =?utf-8?B?a2F4aXVFc2ZjelJUSFBTRDg3cXVmaFJQOXpsZmxXTFNHdnJtWm1SMnNPeEVG?=
 =?utf-8?B?cGQwOVVzVmlXT2p2WFk3K0Y2Wm81N2hkNmpDT1BFdHVqaUtjN2huL2pjYnM5?=
 =?utf-8?B?RHM2L3R3UStVSjk0Y01aUVV3VDNCSWdSYkFmcGVFekNUdTRHQVNhVHJNQ0h4?=
 =?utf-8?B?RVd3dU5FOUZCSTZWS2luaEhkdFZzd2w4SWJnc3NCQ25SN0YxZThJYTZXeHJF?=
 =?utf-8?B?MHRmakpkYzVTOEo3aTduRkRXd0dTd0dnQ0lTQVV4anVQRnYvWkJ2eW9Mc245?=
 =?utf-8?B?R3ZhanZObzRUbDJ2OENZRWpVb01zdnJ3ZHdhbGhtQllsbVNoNHB3c1ZOM3Q5?=
 =?utf-8?B?NjJOdmxMSkFVeGNRK1I0ZmhYdmY4Um1PWGJvL2ZGTUZQOVRGS0hMWEZFRlVM?=
 =?utf-8?B?RlNXZzZ1Vlc3RlZCbkJHbjZTaU5vTENxdEVrZUlWclgwanN5QVRpOFVEYjlD?=
 =?utf-8?B?M2JXTFUzMS91MnZpQ1A2YjZYOGJjUWtFUDVUZnZUQW1wWnFmSVI3aXpVeU81?=
 =?utf-8?B?ZzdvNjVyeGtNUXIrL29mODZ3d2g2L2VUMVFrRkVWS1NpSUQxb2IzSHFWYlJK?=
 =?utf-8?B?L3RheDRkMnFoN2RlOFpTWnhyYUEyaEVMYWRPRHdIc2JrUzlsOEg0MjBhbEx5?=
 =?utf-8?B?ck83VnJnWDFlek03TGtJNFNKaWVjUy9MbERTS25lK2JyU1BCVkRQeHIzN2ty?=
 =?utf-8?B?SCtQREVZcEtoSnZVZmk1TUREUlpNSGRCenI0VzRKbHZ6KzJEYlZRRjA3dzVG?=
 =?utf-8?B?eHlhUFdCbWdwUWFXYk9GMXhJTk83bzVaMmRMdWh4RzNudnZoVzNaZnIvS2Fv?=
 =?utf-8?B?ZkhjT0hRdFNuNUZhaGZmUHlHb1BBdndGWnY5THVjN3JsQWovaWNhcTB5OE91?=
 =?utf-8?B?VGxDZXFOd2pWbXo4eVVrbmIxci9vSmRiTmFNd3FmR1BvS0NFRnB5YTdNdEZ1?=
 =?utf-8?B?Z3dobEJRd3BZanIxaWJUOFRuUTlMNEpIdWpEMC9SL0xnbW9QeU5DWDVPL0N5?=
 =?utf-8?B?Rk03VDhBeFp6R00xVDJ2VkhJdDZiUk5NOTM3d05BQ2U1Y3hVaThJMThUd24x?=
 =?utf-8?B?cXE1UDd2WFdRMVZzQkx3aXd0REJLYllBejF2cTVISXVIdlVtWmVPVkNEall6?=
 =?utf-8?B?K1BuWnRLdFlYWElId3V3Smg1ZVhUQVFlem5sU1F5ZlZBY1k0UUpXWVlHU0c0?=
 =?utf-8?B?TG1jdWhHT1pIdS9FanN0ekZKeEdLTHBlNk9iSndsWVArUWV2bzgvaHNQM3J2?=
 =?utf-8?B?TVV3UXdnRjRPZ0EzYnhpeGJGZEQ1VThVK1FjUGFRT0FEQUVMQUJWMDRLVUhO?=
 =?utf-8?Q?gRBadEnfUvKwxBJKQ+UbUUI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b2e0a7-3896-4754-9215-08dd7ba57c05
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 22:41:23.8538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ORwbFdMHp3+P5e/ki6SpbJyrq25aOXK+JNh5TktjACULtDRCydeFEs370rGB2HrtN0/wH+tdiQDLe5tYfI4jzatiQ8XjrZl9AXrrT9tHAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
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

On Tue, Apr 08, 2025 at 11:12:10AM -0700, Ashutosh Dixit wrote:
>The only means available for testing OA data is the TestOa metric set, so
>use that also for media OA.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

yeah, TestOa of OAM should be good enough.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


>---
> tests/intel/xe_oa.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index f3ce37ff5a..0914054460 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -338,7 +338,7 @@ static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_cl
> 	else if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
> 		  hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE) &&
> 		 HAS_OAM(devid))
>-		test_set_name = "MediaSet1";
>+		test_set_name = "TestOa";
> 	else
> 		igt_assert(!"reached");
>
>-- 
>2.48.1
>
