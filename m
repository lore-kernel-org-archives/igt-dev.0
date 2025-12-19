Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DD5E668A2
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 23:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A198410E008;
	Fri, 19 Dec 2025 23:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9T64CBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2E210E008
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 23:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766186319; x=1797722319;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hX1qYSkTS8cAiVqNecKCMubqzsI7ftVwMstBDDx2Km0=;
 b=M9T64CBtRkV8570TwTnWHamhifFU6kQjhRIqLZTL9ReDKsZUJPYIS7ey
 /YiLS1Ey2DVilgW6Obtk25qVD+KAgk7HSoE2fRJxASmbxsGdVn/VkJO+i
 Ng8DtCuydXX44DXDAhMQOYashfU1h6ULFGcCYtDkoE0DUvkXGrNFV7fDx
 1EqY5WDq4auA0x3+WbPpDJvQMu6gLVdDfv204yqsVB3a/Q2lQaMlje3CT
 1qU7Coe8O0cpoNy7zDXWAkirWZ0b0wsQVIGSMynuXqv9Ot5E4g8fUdK48
 gBXXRN83YeAbI6XFYx32Pkn2Vn3/+xb17diB6dzw4GZ5SN6Q8p88RJqqh A==;
X-CSE-ConnectionGUID: xXRk9ErGRh2h74zgF9jwIg==
X-CSE-MsgGUID: Os+/jvx1QDarKSkUN1IzXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="85566667"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="85566667"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 15:18:39 -0800
X-CSE-ConnectionGUID: pwqfAbDfTnO+kwXH7c6ZFQ==
X-CSE-MsgGUID: Xq185sRwR/ipcC/evutyng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="198975206"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 15:18:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 15:18:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 15:18:38 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 15:18:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m01Ct6uwGpQqvZa2vcryVneUJriDunwreCTx+bZMycsVORBDoWEo0+6rOgAOkwMxDBOsURBYmelabCS3dcMIz3uc14iBR/4bChNrdseizAWadiYMqoSsTlcIfpKjaSCMoFgrsdp/30Yrhi4Pc94r6iBrDNERdOCHrudi0Fap39CVBUu66wumjxqe2R/iy8dRH5R9L1Gq1w2LxVAkCBPZ89bLqZok7acJtC+447fQv7Sp3n+jyMfbcxm+dAAJv+ARxW5TqLPcfYh/e+GNsXlxBuBjrnTzGqUSjiwZbpxtFz1Q7sq3b6W6BpS1CKmhBVhGuepaYjcYs8DHiRCeIAnrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqmmV6OzthEqbVYefopK3xmV+2wG4cGemhSNWtDjhYk=;
 b=pnHE80TM0TasBvSB5UxKdDkIm7YzokTym8JG6hC2ZhUo6+nh1CzObZaBSC3jLFu03/ZnMeOjzxwgEKh9B02TGLgwu17RFK2RTykUulenzWKpnG/J9RTjPSm5JMSioHO+LD9Gx27U0PpoJnSlaOSAg0QAWGHsnszo9wVqbnRmkKqxcBCiUb9dNsLgKIWOpejiVkBPZ3pH/IguZJwgxk+aL7PjLixFGcsxMbzaXOxT+zYzuUNhrMmj03GGJJhfodn23Y8anddzFpxVjHvJg6FB+PItV1fGz5xXWM9/IURchGR0j8WAqmAzt2exP+hWKDC78GAQBvf62hlf5mYDkGaj7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 23:18:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 23:18:35 +0000
Date: Fri, 19 Dec 2025 15:18:29 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_oa: Add MERT OA unit
Message-ID: <aUXdReuFFRDeI9Br@soc-5CG1426VCC.clients.intel.com>
References: <20251215222935.2002656-1-ashutosh.dixit@intel.com>
 <20251215222935.2002656-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251215222935.2002656-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:303:b5::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c00219-f10c-40e7-030c-08de3f54eed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGtFU1pJL1g0VHZ1UHhzVDN1Zm1RREtVR2J6WklMS3FXOEtESzZrdERSaVhj?=
 =?utf-8?B?VTZkZm1ZSGYwMnRTbzhSQWp6czFzQ0JpamxmNzE3TWpLMjBLQXNIajBvTDAw?=
 =?utf-8?B?UWtPNlNzOWZST2RvMjkzWGpETUtCOUFHV1AvMFJhZTBlM3VaN0NXeFdGWnpR?=
 =?utf-8?B?Mzd0d1pud1VqdVpLd1ZLQWZodG14Q2VldG9jYTJCdkIvQmZRZlkweXJrSy90?=
 =?utf-8?B?R3NKdHJCUUtxTEdYUm9kK3g2bUxJWUhSd25sbEJGTnArczlmQlQxc29GTFFK?=
 =?utf-8?B?QXJtY25IaDlMMzV1VTVFOWRocTIwbUtFMG9TRXhkSWJPZndYZklLOFN1dnVl?=
 =?utf-8?B?dEViU0VyOEFtRTJEaWpEM3g4SC9uY3RjcXVUOVhVRjRoS3hRd2MrUzhITUZz?=
 =?utf-8?B?aWNZYndqSkpuMGZtWnZTd3NvSWkvSjJCQTVTYXZqTFQ3UTBNMjBHTENPVlgw?=
 =?utf-8?B?a1ZVcFdWVGhYOGoxT3FsS1Q5c2p6TXVvMXpmSGlmUk9Ma04zUkIxWTFaYk9P?=
 =?utf-8?B?VnVYMWtBWHNYeFlhcld0bkZLQVF4eEI4L3g1SUx3ejJYRHFFK2NkSVptcEVz?=
 =?utf-8?B?WG9JN1VBWFg2ejZ2WnpmTDYwVXpzZWxqQzczWE1aL3ovRUhOT3djbTFQQjc4?=
 =?utf-8?B?TUo2Q3BrVnVBcGhBWnlzR1hZZ1VuRzJ5Q1FIYlFwWkpZcGZKd2lSSVNkdkI3?=
 =?utf-8?B?dDJpdE9maEZPaDduUTRkT09QRkRINU1iRGhEQjQ5SlNERnU4QTI4eEhqQ1Mx?=
 =?utf-8?B?SFlwREhKTlRLNUI5blY4dDBVTHNWUjZoVk4yaWsrM0NWOW94WTNqN1Z1TkJy?=
 =?utf-8?B?M2p1ajZUbXk2aDFWVTQ3U1ZnTk9RWE9hb1VmOGhsc2NWa3pyRENsWS9VclhE?=
 =?utf-8?B?QkVWNTRMQXZWUTllQ1REY0lTVkpCTzRtcCs0SjNSYnhlWmN3Z1ZSTjFMOXBs?=
 =?utf-8?B?Q0F2b25oM3N6QmIvRFZQN2o3a2ZPWXRHOGQwalY1c1poaE5QRnBMUno2QmFD?=
 =?utf-8?B?ektDak03c25oT0VHaU9lTGFCZlZZRE50SVdKNnQrSjNhT293dGs4SXNBZDY5?=
 =?utf-8?B?dythU1hlT05pUXBNSGlGUGtOQXdrM3JrYXRXRHpLSmR2WDU0d0JjanRIdTJW?=
 =?utf-8?B?cExQMDlVT0NWR3ZWUTVYZCtDSVhjd0xwSHVoTS9WVGFpV1VlL29GRVdYa0Ev?=
 =?utf-8?B?YkY0cTFPOVRsMU14dW8vMS9LZGI4VnQ1aG5wZzBaUDk3b3RHYkt3cGoyNTI5?=
 =?utf-8?B?OTdzVER3cjNLY1FvNnhqN0c5SFM5NkMxSjNVS1lkTmRlVGJXYWJuUHRPTnZy?=
 =?utf-8?B?WE1ncm1ab01XdWhVVXNzYWM3ZDRTNzh4dTQyYzc5OU43VFpHTkRXTG9NSjBB?=
 =?utf-8?B?dW1RSWZJQkRLQU9jUlQ5TGR2VGN3Wm9FUi84ZG5XL2ZZRmRIVG9HdEh1Njdo?=
 =?utf-8?B?bEU5eHZUQnpYbXhMTHZrTVhGS1JVUUJYcUpzNHJvU3NYbUFPNjNYNTZ0ZVJ5?=
 =?utf-8?B?cmY1cjdUWUpIVENYejBPRXJZblVGdkxrY0pyWlMySStWM24xTzF0ZmtkZXRi?=
 =?utf-8?B?RXlXSnRjaURIWkpybldkZ211QVdzS2h1TFZVam02R0lqcmhVU2x6bXp0SXdC?=
 =?utf-8?B?aWM0dmNpQ2RqaVl5L29TdE5KQWFiMWExUlM0MGFwUnN5SGRjbHNEOS8yd3Fo?=
 =?utf-8?B?MHRsMTc2eFpJTnlST1JpR1hiZVpSRGlLcXVHb1JDcnAyaXN3cmZYN3czTC9s?=
 =?utf-8?B?KzE4eWpFcjZOd2tYRGVNbkMwSzY0TVp2WmhMY3prL3ZCbWZkR0l0QU50ZHph?=
 =?utf-8?B?U2hVS3JvcTU3Qmk5ZUkyekVLM3ZkZU1FNGZJbGVwNHVSS0g2SkFqbTlkSjdq?=
 =?utf-8?B?TFdGak5hakI2N04xTzNCaVorMFBPanFhUTZQRlBRTW5WNnAybC9YaWh3K0tM?=
 =?utf-8?Q?9JSbXBtmAkA9FJ+ghOLXw5peL18PHTyL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2VzNHUvOHdTUjA5SnFnM2dYK1o0VDk4WDduamNEbkN2V09XNDRDWTlEM1NS?=
 =?utf-8?B?SzA0aDZRWG1KU1M4TkFtcUhyMnM0TVNISC8wR3l2WkFDK25ML2dCZkE1Q0xU?=
 =?utf-8?B?bUk3dklFZzN2WTdFTWU3SlNlN1ZBeGVLRG4ycmY3TkFEeXFvR0RpTlhTSU1v?=
 =?utf-8?B?bHFGV0RkZUw2RTRaVENpZjZwelJTQWxqMmVldExhbjFNRWN3ZHlLcTZEbXJI?=
 =?utf-8?B?R1IxUDlib3l3cDBCbW52TVYyTjkra2V0dlNhYzVXVjJrU0VIbVdoVHJUK0l1?=
 =?utf-8?B?TmJ2WXFBNHI3b0p0WktobWo2NmpaODNJaTIxZWNzUUd0SWt1UXpIa1hzNEFD?=
 =?utf-8?B?SkdWUWE3K1RQc3gzRWg4b2o0dVc1V3lMTHdYUFR1aGNiQ0ROc2lKa1l0blRR?=
 =?utf-8?B?VUVlajJwamo1bnVZdkl4ZzBITW9seGc2eTJVUkJ2YngySExRc0o1aXd2L0Fm?=
 =?utf-8?B?dFJHTUQ3S1lCeFNCQzVacjNjU3FTb29jeTdLMm8zNkF6S09Pa21WWkd0T2pm?=
 =?utf-8?B?K0FiM3JzVSt0M09IRU9oK3NBcXFtYkxURzFvR2FOV2FabGIxSU9yUmV5ZmNH?=
 =?utf-8?B?azR4N2xQeE1GMVRUa2dVbzZUMHh1ZW10TllWc2hScFlGYzZqQUZ0YldGWWlG?=
 =?utf-8?B?ZVkya2xOcjNoT1ErQS9hVzZUalU0RWo2SkNqN0ZaZ045MG1tS3pCTUdzRko5?=
 =?utf-8?B?azNYTk1uTVhRNmVBSFlVRXh0VS9IQW5MbHEzak9XYXYyZDJDcno3UHY5S3p4?=
 =?utf-8?B?ejgwUjVwS2hFeGJCVytsZUJ2MG9xWGY0QnEzdVdzMzNNaXovaFljc3p5VWd5?=
 =?utf-8?B?SzhWMzRJdzBiWlY5UGVrOURnL2NhMHFHV2hWSXRoeWtUb0dxTCtMb1BPd1Fk?=
 =?utf-8?B?dzdQY2FQczhvWEk1eEtuWTl0VjhSRWkxQmp5WlIxd2FjNlczdCsrbklGUkVB?=
 =?utf-8?B?bjlPdis2S2RXM1dVakI5aElYZ3l2M21RYzdER0xtK0Rna0QyeXlKMHZnUmpF?=
 =?utf-8?B?OEoySGVMSU1LS0ZYdDBrSHAzOXJnOXE5Y2ZjWS9WMUU0Nm14dTc3STY2NzBi?=
 =?utf-8?B?aWVSVzF0d0pXSnFYMG0xMnI1V08wWXBtZUxPL0tBWUZsaDlXTzhqazVZWWNW?=
 =?utf-8?B?amZWQlZpWkgxTFlJTmdpazBwS0lyR1VYZkQzWjM3THQyeXlvZFdMVHpRSmRa?=
 =?utf-8?B?emxRR1BzUU52NVdLRjlvRGQ5bUNscEVnOUZ5UFd3MEhtQUcvUmRMUFpBWjNN?=
 =?utf-8?B?M2lEc3FNYmhEY1J3cDZhMWI4YzIzb2I3Q2V4Yi9BdWpxSEdiOWMrNzBISVc4?=
 =?utf-8?B?WlNLcFNhUWxQQ25PR3M1R2VUaFIvdHVtVUEzMjNocGRVL2VQSi9OTHhnNEF2?=
 =?utf-8?B?WjZGOFA4OXpzaHhQOTRNd21xSkZHcXZ3YWVDKytzeGtqeXd6elI3MFlBMzdy?=
 =?utf-8?B?NGNVaVdSZUZzbFNIbFlaSDNtRmxMaldZK1dRRkcvWjB0NHI3MUM2d3VvVDBB?=
 =?utf-8?B?UktmT2NlQjYzYTc0UHFmQzBjK21kWGRXQU9FYkRzSUovUm4wMnVxUktIbjlJ?=
 =?utf-8?B?R0djNkdlUjA3R0oxZTJuZkpMNVMyUENWSjFjcjM3UHN3Qmlxbmt3ZmJPenN5?=
 =?utf-8?B?M1FRZlFHUnZxVVJOL1dmbHNxcjFlV3BQZ1FKTTg2bllnY1p2TmM4bEozSFJ5?=
 =?utf-8?B?SHhKbkw2RG9nTHFtRDRIV3pmTHNPa25QVzhsSEFpTCthRTl5alVsUVBTY1Mz?=
 =?utf-8?B?RzFodkdRaUErMHFlR0c3Z285ZnhjUVBnSDQwenkybWxXRXdNWVVWSUhESStC?=
 =?utf-8?B?alJOSHFFc2tGUW42SkRyL09Gb1NydWU5cDU2V2VSOXZQdEtjN2IyY2FiQzF4?=
 =?utf-8?B?UTJvdmd0RzdidEpvTWJGWHgyWjdPQ05ocDVSd0Voa01XVU9ZUnNtdUVQSTM0?=
 =?utf-8?B?NGFUMVFkWnhidFBpQ0tVVDRGREtEN29HYmNJRzZyMkxac3RhRGZnT0YxOWhk?=
 =?utf-8?B?dkRDbGlUSzVDV2g4OGNETUg5c2t3d3NVbmRleXAvZVZ2bGlXRHBlbFRPSXZs?=
 =?utf-8?B?b0tZMGtFTzZnc2wyQ1kvWkxtc01oWGRUQWQ5VUw1dWdjM2NVNkJ3Tm5haWda?=
 =?utf-8?B?MmNJcDN0WmZNWFBWNms5SDdxZ2lvZUc3Q3JSRnFCdlNwYnMza0pneWdLQ0xp?=
 =?utf-8?B?Z0psWlVydTJETms5eHV1THFRNVdqbDRWRGpoUTRIK1ZhdGZTRExyQzY5Zmtk?=
 =?utf-8?B?ZndBZzVDYjlNOTRtVmhDMlNJOFBOVFhWVEU1RHdnRW4xMTJuQU9VdnVob3M3?=
 =?utf-8?B?KzZLWjhBdTdMMXN6cGkvY1lLUzRaT1R6aFFiSS9ZSUJZT0tqV05oL1c5aTdo?=
 =?utf-8?Q?c9sZerdeEOaLDUmw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c00219-f10c-40e7-030c-08de3f54eed1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 23:18:35.1237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wwl9HYqOgaXDdcgb3rspQSstW9mgS8inoSmzOf5Ye4fdhIb+z9gkPvgU9iG+NMQ6jLhhgxPW3y2KvSevKpPxXoqc7ZlJumZ7NT4awJ5N8VA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
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

On Mon, Dec 15, 2025 at 02:29:34PM -0800, Ashutosh Dixit wrote:
>Add MERT OA unit which allows __for_each_oa_unit() to run the tests also on
>the MERT OA unit.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index a9362f2045..474070e238 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4026,6 +4026,21 @@ static struct xe_oa_regs __oam_regs(u32 base)
> 	};
> }
>
>+static struct xe_oa_regs __oamert_regs(void)
>+{
>+	return (struct xe_oa_regs) {
>+		.base		= 0,
>+		.oa_head_ptr	= 0x1453ac,
>+		.oa_tail_ptr	= 0x1453b0,
>+		.oa_buffer	= 0x1453b4,
>+		.oa_ctx_ctrl	= 0x1453c8,
>+		.oa_ctrl	= 0x1453a0,
>+		.oa_debug	= 0x1453a4,
>+		.oa_status	= 0x1453a8,
>+		.oa_mmio_trg	= 0x1453cc,
>+	};
>+}
>+
> static struct xe_oa_regs oa_unit_regs(const struct drm_xe_oa_unit *oau)
> {
> 	switch (oau->oa_unit_type) {
>@@ -4041,6 +4056,8 @@ static struct xe_oa_regs oa_unit_regs(const struct drm_xe_oa_unit *oau)
> 	}
> 	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
> 		return __oam_regs(XE_OAM_SAG_BASE_ADJ);
>+	case DRM_XE_OA_UNIT_TYPE_MERT:
>+		return __oamert_regs();
> 	case DRM_XE_OA_UNIT_TYPE_OAG:
> 		return __oag_regs();
> 	default:
>-- 
>2.48.1
>
