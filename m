Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478E9C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 19:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C0D10E0E4;
	Fri,  7 Feb 2025 19:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMHcfpnc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AC110E126
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 19:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738955624; x=1770491624;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=c0bsGqXzAjrJlBlapMWspaidP8CsXrBuX6b1r2ow6cM=;
 b=LMHcfpncTfxwe449IG2++wDq1EOHg2zYws5yxe3qhT9lY1rfXyTZMex/
 dZVz2O5gJ2Y+SozZEYKWvdKV4aUuhn1kCfUyeJ0h67gam+sCrE2tEMRAw
 34YAOXbr7NEJVuQnp87hjhAgeeu+nEoJxOan2IMfTilElj7vAU905tKeU
 CLpnxpWvTaQz6UUN1wfM2ZET+YWJ7WXZDIa7M/j4cmTLZ8NbKO2tM6ZxG
 VyrZ5kqsOev9v+sTKnzauu+0JiXFv7GialcyEpi9c9PEddIsSQat9jQVU
 vgR2fb8dKQoxLDqRxdiKAa02e4oonURhYwd2oYltSpXeMTxTjMW4m1wpg g==;
X-CSE-ConnectionGUID: W5mt1KQOSm61va9jgqNEsw==
X-CSE-MsgGUID: SOjvKUwDSlOsK5pSfwSGsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50587875"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="50587875"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 11:13:44 -0800
X-CSE-ConnectionGUID: LF+/78NxQRuNezo9gXKEDg==
X-CSE-MsgGUID: RSYXgw+jSoypN2mRn0SJ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="111520355"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 11:13:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 11:13:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 11:13:42 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 11:13:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iq8AV+rHyxoJG5g5Jixwx2wxeJfNoO/+ujBmXYNZO7x8CxwymiENf3nwgDEq5UsqDmjrySEHH/tBM0BaFGlzBdAcr09wqR/MWKOlH7oUbhk9BgiDxV07rdZUMf9o46GRufu8sApmGcYk8X88QCxOAYgfNxvv3SA94XiqgBh16kMv3hw4FPQRUMH2zBlIPqUS5xz7BcfT04w/YFVuVw51VJ0BWOkPd5MQeYWusJ6mNwd6QFJ6dhewb2u0lgHkfjMoVyv6XM/VV1pz/dnrmvGSAaSqil6BVq3R7UEisHnv98VSPc4KCT0POhGUOBzGohFc9HHWDqwxzWsoVV3H/Va5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVfS/hfWZ6l/+DB8UQSLpDlt7Nsgn3+U7Zx4NXoDWaE=;
 b=LX3Qf5wH9YFHCSjbT9D6ktpf3RmxBzR5jZYha7v370HPk9W8LNKTYI6k0IA7uChrxffUWJvfKek53WPTP0dMTr796ZjYbkUy3BXS9bEN1TN6SKag6b1C96OdxCub5lKi8hu8UqgKzBsy25ptspdMjZ373tmkJJ0RP7Scr9h1fhvI10NqTqskhmtrjcQKINSGuW239Jwbf5A+hMtW0tTGQuBJ5SGZ9NB0hGTFmmSF6ISf3+MKJFauvFHtiD/yUdM8VuO9Ac1PoeciOrFhy2weEqzFlUbbFUsVD1QuyCmtRbpW5WKDasH0A84x1A9VMcOpHPwWCuORZAN6xxyvATWXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 19:13:11 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 19:13:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250130172149.3657144-6-lucas.demarchi@intel.com>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-6-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 05/10] runner/settings: Match serialization to
 parse
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Fri, 7 Feb 2025 16:13:07 -0300
Message-ID: <173895558746.1963.18303137497681364078@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:303:2b::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: bac9b549-81db-41a9-9643-08dd47ab769f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zk9VMUx1Q0ZUZFFwWVRvWkt0d202REtkR0R0NFRuUWFBSGJaMHNuR2d3T2pV?=
 =?utf-8?B?V3V1RTJhRUNRRFpGemc1V3VPc0FKZzhYaGhaYk1xaVRBM3l0TVJEc0ZXcUNL?=
 =?utf-8?B?aFkycmFXZTJhaE83R3pSWVAraTI0dGhCbmJiSTByc0hzdkVENDFsVzU3YkFJ?=
 =?utf-8?B?ejJORlp6czhVNWlHenl1Yzd6R1RpVlUzcCtSQzh5cjhjQ00yUExCQnFOU0Fm?=
 =?utf-8?B?ZW8vVWc1eTB0Uzd4OERWSGhUVGtEMkJkWlVXbE4yRTZqM0MybXcvN1lKVGsx?=
 =?utf-8?B?U2Z5NVExWGgyeHZNQjFsVGFURFU2aCt5TDdQQm4vdXJaeDJEZVRnSEk2Ri9w?=
 =?utf-8?B?MjJvOUpTQmlBbml3NkRzVWJ5RjcrcHlZK2JGVU0ydkhLUmlOQnlpS3ZoVlhh?=
 =?utf-8?B?Z0ZGZlR1TCsyTnRtMjVnR3IyY3owbWFNMTRFQ0cwYXl3TDNTM0dTWk5KbFdC?=
 =?utf-8?B?Z2pXZmd5dWRCQUhRVUp3bC8zUlVZTmpFNnh6MWpHMUt6cVJ2RGhOaDBYR3dl?=
 =?utf-8?B?d21Ua3dLVEZYQldMNEFOVmI0MXE3RXhvbkNpMzVCODRlK2ZMNUJGKzhjRjJF?=
 =?utf-8?B?bzZ5Q0ZXYUF6LzBGQWlmd1hWVkFjSG5icVV3cW9wNVJ4MmRwbFphdENCNVpR?=
 =?utf-8?B?aUJSbzltaHRkdVFXTmIyQUVSTmtPcy9SM2V0YkNFdThtbjNYVVJrclJ6cGlq?=
 =?utf-8?B?UitpZ2xkYU5mUFY1RU9YWXhyaEdTQ0tHSVc2QmRhWDA2RjVSbDJ2aE9YUmx4?=
 =?utf-8?B?bnI5bzZBQ2RVbG5CM2Nja0E1TGRUbGlVNVZRL0ZwOUJOeDZ3a2pWeXd3UXk1?=
 =?utf-8?B?MnJmc3d5dkNUQkpTSThnVmZzVGE1SnMzZUNUZzV4K3BuMWZIdFByMVZFQTN3?=
 =?utf-8?B?ekpKdmEya0lWSlBkZjRoOXU2dTF1aGZoNTJhUnNGcEF0T2ZOR0lFVXFMVmFt?=
 =?utf-8?B?SXNsTlVkZyt6b0d6UkNlY2kxeWVnU1Jsc3ErNDJyaUhMUHYyUlZPdXhtNm1R?=
 =?utf-8?B?R1hSS3NSWHJqVU0zaG1UNVdKdkQwWkVJd1pWd1FZV2dUMjZrYmRHUGUzQ1ZU?=
 =?utf-8?B?VlRvMjN4WmlUVGc2a21vSmRhekRneVpiaFpPV3VTZStnaVBieEVqUzc0NzlX?=
 =?utf-8?B?TS9qZTFLRmdabkNIMGlEdjIyL01ZeXhxaTBZc0tDbGhoc2NtU2xRL2VqRXRw?=
 =?utf-8?B?QTd4YVNXOCtuNXFTSUR2Y0loNzBKYmxRc01hS2FFYWwrRWt1cXhYVlM3ekdQ?=
 =?utf-8?B?enBpUWduM0dZWXJIQnptaitBamZtenp2dUk2RndYS0lWcWRvTDJOdCtDcWJt?=
 =?utf-8?B?UmQ2My9WS0VQMnp3b3pDNk5LUjU5RWk3by8yZXQ2NVAwOVZTL0xaVExrRXFo?=
 =?utf-8?B?ZGc3TGZLK1N0ME1Td0hLUEtRRUtLY2NWWXFESkZITTVQYllNVkhVUEZjU2RV?=
 =?utf-8?B?WVNzZ2JRenRwZ2VtKytDeW8vYmtpNzZLdndrWDhtWHNEUnptakpEd29QRW81?=
 =?utf-8?B?dC9ZSjA3WVFMbW4rUnhpVlp2V05UMWNTcy83NHJEMmlKOHB2QThPcDVTUDNq?=
 =?utf-8?B?QkU4cm9SdHZ0bjBzbnNJb1Jja3hSbVoxaWQyQW5Wb1FpVk9JdkZBbVJEbXVh?=
 =?utf-8?B?QnFsSHV6SEFIY3lnSXVzSkNBeFl5WnJkVVppUHBaVVlsT2ZzaHltVVBiazBR?=
 =?utf-8?B?NzJmSGJhTkJEV0dESjBxUEIvT3RmQ3pRRUgvWU45bko4bHpldWNZZytEeElI?=
 =?utf-8?B?Ym51YkZxM0Vmajg2K0xIRTBNeVpiUkxmQXovT2h5NHpvam1HMWYwcmUvOXFK?=
 =?utf-8?B?QnhON2ZwRXRCVVNJNDJTSGlUSTdlWVdsQXNoc1g2ZGV4Wmpic3B2UlJ4WUZm?=
 =?utf-8?Q?X8Q1pbeD82ZwX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1AzZ1k1OU9IdDJOTnZ0SDZzS3lhWXU1ajNxdER4Q00vVFRaSkhiZGJaVnow?=
 =?utf-8?B?Z2lQRkZoRHBtcEFuRGFLT0g3S1dWY3h5RWJrdGNLY2RWdG5EdS9HQzNUZ2lO?=
 =?utf-8?B?MFQ1MHg0UWs3ay9qVFlXdE50T3o3NzJON0hXSmg3Mm1wakRseVJnV1ZmckV2?=
 =?utf-8?B?YnQyUGYrSHdjaGxLMHZjNEVPZHh3Njc2aTVCVXhXWUtacWMyYTAxZ2kyQTcr?=
 =?utf-8?B?ZEcyWkNENGNaTVNlMTBncGZBRlQyZ3NYL1BXb1F0aWNUZjRscTlJVXoxRUd3?=
 =?utf-8?B?VnI1NHZXZGs0UDg0Q2duOE1VQnVhWXdaTnFNTUUrU2VkL2lPU0lLSnM4ejRV?=
 =?utf-8?B?UklsZjI0VGRwaTRlWDVJb3FhOFRRN0VSUHRYRUpRTTFpVFNVNWgvU2lKY0kw?=
 =?utf-8?B?TWlxaUFDQTNXNldYNlE1SGVIQUpZbEU5cnRIMmFlSFB4NGNUQVh3UDdrMVJT?=
 =?utf-8?B?Vm1nUWxZZ3Q1Mm9YM1d3QXNMS0FVSjNpY1M2WlpvTTlVL25sRGlKMGRTaWFY?=
 =?utf-8?B?MElHNjBWZnE2eHdRR3NSL3pUQklRc0VMaXF1cmFpbURJblpNVGNiZzRDdDlE?=
 =?utf-8?B?WmVoaVBSTTlKQnFjclpXSVFiRnZpdXREMzk4N3pGS1l0dFN4R1NMNGxyRFBM?=
 =?utf-8?B?elNzMHFqMFI0QWtlZU4vYzdTS3pna2tleXIwcU9DdFg2UWttNVpXdWdYNGlH?=
 =?utf-8?B?SE9la3dwcGZnay9kU1ptSHV4VHJUTjhtbVdIQW1RUGFtTjlTSUdtem15U2Ix?=
 =?utf-8?B?aEgrNkxmMHpRYk9scEpkdGY5OXdWelVXcUpMQkdlbXRlbkxRYUVEOFVTbm1K?=
 =?utf-8?B?bHBVb05IUVBoc0kxcGRpb04zZThNNHUxSmQyWWxXcUE5eDZpUWtnSUFkTWJ6?=
 =?utf-8?B?RFlBSERvUkduaXg1NEE2ZWNNeHdIaTFvMFBKK0tHWnFTMlFmczhHd1ZQS2Ux?=
 =?utf-8?B?TG9LWTc4QWhZQnFUb3JtcEJnd0Q0b1ErZk52RXlvYlErZkg1N1hsOC9BQXZu?=
 =?utf-8?B?K0tqRUZTY2htTDFQNkhPWDAreVV3UFpQemVack1xc1VmRS9Nek1jT0dNdXY0?=
 =?utf-8?B?T1AzNmlzeUV2V3k5amc2QUd3R2Foem9lRG5vZm5EK2RhWFM2ME1JZm9WVWRz?=
 =?utf-8?B?dVA4VEU3eDhGRGJBK292WHVIaHFwd09xVk9wSnN3WmdPWVdUNXBibzh1RXlM?=
 =?utf-8?B?R2VGSUZ1Y3hQRHJuekRET2R0ZThBMlpZOEx3SWpEZ05NVVdaQjRRQ2JJbzBq?=
 =?utf-8?B?ajdna3lwaHUzNExtYTUwbFFDalh5Rk5IK01tTUFoQXE1Ympzb3IrSWhqZ0Jo?=
 =?utf-8?B?Zm05NjJSbE4zTkU0dndyYXUwYjRXT0pIUWljYkJnb2QvRHpGOWZaK3NiRmk3?=
 =?utf-8?B?eDlHMTlpbVR3ZVFOOUVDNWR6TldFc3VQL3FvM0dGL0t5TURhcWRySWEyV0Iz?=
 =?utf-8?B?c1NNVjVIVUdNUjI0SFBSOTJFWVdaR1h2Y3M3N1NvdkRtMVFxQWNqTGdGeTJN?=
 =?utf-8?B?M0JiRUN3b0o3Ui9qclZsZGFmeEhac2NNR0hKWkFKYjhCeVhoUGhsd3Y1b2Z5?=
 =?utf-8?B?bS9RSG5OQ1lDSnc3Q3htdWtVK2h6ak16OXN4NUZwYUY5MkZkZlJRbWVGdldX?=
 =?utf-8?B?VWEvdGYvenRxOWxYcVFSMXIrVGdLOVJ1T2g4S1h3NDJpMDhnekJwR3d2Z1Za?=
 =?utf-8?B?QnpxakdLeWJsRmozZUxIS0FCNTlaYzRybW11M2lxTzhqSFpzVDVUL2JVSGZw?=
 =?utf-8?B?N3NPYWpZaGNQbklkdFNLZ2RabHJ0M1doYkVMbzlpTmJ1TURsQXNSQU9xUnVa?=
 =?utf-8?B?M2JpYnRNbjI1c3cyWjJlN29EdGozYmR2SjZMZU0xT2c2cGN5TnlSQ3FOVHUz?=
 =?utf-8?B?YjM4Y2JRQWhVb3JDMzg5YWRONXBWV2NQMVdIbGE5eGtxakIwVDg0dGdHMDZF?=
 =?utf-8?B?K29oOENtc1VpanAxaXQ4cjBCMmcxMVJxL1JHMmNqUk4vZFhkMlczM0xXTjJC?=
 =?utf-8?B?eHVIcW5TcStINVl4dzh1K3l4V1JPalRvT0IxU095RHJDSVlyMm1ZUEZNZ3NF?=
 =?utf-8?B?U0xjVDFEKys4c0pYVmdNUXZNVWUzSTNaRCtETXRMNEZodUhSYVhTd1cwMlVS?=
 =?utf-8?B?bTNnakx3TG5IaUdNc0NmZmp0RjlWSEVHL05Dbm9aK1NreHFURU0vRklBLzhl?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bac9b549-81db-41a9-9643-08dd47ab769f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 19:13:11.2833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAPkoufH+wMzFYYkcp4jyESFNI25EObxCuRi/1EUZpUg9h3UESIJUQyyGiDMNxq0Lcyi9BiqbycMy+2UgT3GEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5894
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

Quoting Lucas De Marchi (2025-01-30 14:21:44-03:00)
>Use similarly named macros on both sides of serialize/parse.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> runner/settings.c | 58 +++++++++++++++++++++++++----------------------
> 1 file changed, 31 insertions(+), 27 deletions(-)
>
>diff --git a/runner/settings.c b/runner/settings.c
>index 340d3802a..73d8aa13d 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -1052,10 +1052,12 @@ static bool serialize_hook_strs(struct settings *s=
ettings, int dirfd)
>         return true;
> }
>=20
>+#define SERIALIZE_LINE(f, s, name, fmt) fprintf(f, "%s : " fmt "\n", #nam=
e, s->name)
>+#define SERIALIZE_INT(f, s, name) SERIALIZE_LINE(f, s, name, "%d")
>+#define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%lu")
>+#define SERIALIZE_STR(f, s, name) SERIALIZE_LINE(f, s, name, "%s")
> bool serialize_settings(struct settings *settings)
> {
>-#define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n"=
, #name, s->name)
>-
>         FILE *f;
>         int dirfd, covfd;
>         char path[PATH_MAX];
>@@ -1097,31 +1099,31 @@ bool serialize_settings(struct settings *settings)
>                 return false;
>         }
>=20
>-        SERIALIZE_LINE(f, settings, abort_mask, "%d");
>-        SERIALIZE_LINE(f, settings, disk_usage_limit, "%zd");
>+        SERIALIZE_INT(f, settings, abort_mask);
>+        SERIALIZE_UL(f, settings, disk_usage_limit);
>         if (settings->test_list)
>-                SERIALIZE_LINE(f, settings, test_list, "%s");
>+                SERIALIZE_STR(f, settings, test_list);
>         if (settings->name)
>-                SERIALIZE_LINE(f, settings, name, "%s");
>-        SERIALIZE_LINE(f, settings, dry_run, "%d");
>-        SERIALIZE_LINE(f, settings, allow_non_root, "%d");
>-        SERIALIZE_LINE(f, settings, facts, "%d");
>-        SERIALIZE_LINE(f, settings, sync, "%d");
>-        SERIALIZE_LINE(f, settings, log_level, "%d");
>-        SERIALIZE_LINE(f, settings, overwrite, "%d");
>-        SERIALIZE_LINE(f, settings, multiple_mode, "%d");
>-        SERIALIZE_LINE(f, settings, inactivity_timeout, "%d");
>-        SERIALIZE_LINE(f, settings, per_test_timeout, "%d");
>-        SERIALIZE_LINE(f, settings, overall_timeout, "%d");
>-        SERIALIZE_LINE(f, settings, use_watchdog, "%d");
>-        SERIALIZE_LINE(f, settings, piglit_style_dmesg, "%d");
>-        SERIALIZE_LINE(f, settings, dmesg_warn_level, "%d");
>-        SERIALIZE_LINE(f, settings, prune_mode, "%d");
>-        SERIALIZE_LINE(f, settings, test_root, "%s");
>-        SERIALIZE_LINE(f, settings, results_path, "%s");
>-        SERIALIZE_LINE(f, settings, enable_code_coverage, "%d");
>-        SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
>-        SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
>+                SERIALIZE_STR(f, settings, name);
>+        SERIALIZE_INT(f, settings, dry_run);
>+        SERIALIZE_INT(f, settings, allow_non_root);
>+        SERIALIZE_INT(f, settings, facts);
>+        SERIALIZE_INT(f, settings, sync);
>+        SERIALIZE_INT(f, settings, log_level);
>+        SERIALIZE_INT(f, settings, overwrite);
>+        SERIALIZE_INT(f, settings, multiple_mode);
>+        SERIALIZE_INT(f, settings, inactivity_timeout);
>+        SERIALIZE_INT(f, settings, per_test_timeout);
>+        SERIALIZE_INT(f, settings, overall_timeout);
>+        SERIALIZE_INT(f, settings, use_watchdog);
>+        SERIALIZE_INT(f, settings, piglit_style_dmesg);
>+        SERIALIZE_INT(f, settings, dmesg_warn_level);
>+        SERIALIZE_INT(f, settings, prune_mode);
>+        SERIALIZE_STR(f, settings, test_root);
>+        SERIALIZE_STR(f, settings, results_path);
>+        SERIALIZE_INT(f, settings, enable_code_coverage);
>+        SERIALIZE_INT(f, settings, cov_results_per_test);
>+        SERIALIZE_STR(f, settings, code_coverage_script);
>=20
>         if (settings->sync) {
>                 fflush(f);
>@@ -1149,9 +1151,11 @@ bool serialize_settings(struct settings *settings)
>=20
>         close(dirfd);
>         return true;
>-
>-#undef SERIALIZE_LINE
> }
>+#undef SERIALIZE_STR
>+#undef SERIALIZE_UL
>+#undef SERIALIZE_INT
>+#undef SERIALIZE_LINE
>=20
> static int parse_int(char **val)
> {
>--=20
>2.48.0
>
