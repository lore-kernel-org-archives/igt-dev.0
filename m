Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D81DE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 18:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F091210E0C2;
	Thu, 19 Dec 2024 18:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmJTjYfU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770D710E0C2
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 18:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734633551; x=1766169551;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=R7wA3yDkJb8zrsCSuSxPYg/cjFBQJ2ycvaWNGeehMt0=;
 b=FmJTjYfU6zOwc6XU62pKpt4MMc8bGd+yylfv8/t7b6cax5ojSo7tHl1d
 TTcCiWWf3tvoJmwY80gLh6sLMOYHK8jcfw24mBNz405bBXje9IDeXCTCR
 K48Pc3bumLVCl02vNr/zLmzjn4TJ6aE+nIRQX69qW+0V9hDV8JMR4Fg11
 T/vN8G+OEyIGaZDAHuduDQkFSIlPmyyfzkLBKXQyfcjBieBFC9YF580m4
 d0Ww+zS8MZW9Z4QjozaH5x3xEg+RGRdmmPOQbiDP8oJYnvCl6u+nd/+qF
 tmxwFn+44tP35P8OsKVHC0ePFaLh8CqA7cZo0BHWKj1Sp2hn5RyaQyDAd w==;
X-CSE-ConnectionGUID: OdbAuGEfQHaEiNBqK8CJQw==
X-CSE-MsgGUID: 1PvmsJ7XSdqHdMs1XUHtZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35054676"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35054676"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 10:39:11 -0800
X-CSE-ConnectionGUID: gu4uTAU1SHutbO3iFUb/MQ==
X-CSE-MsgGUID: jUl+8sJwRxGOeKb0DAZzWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98805606"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 10:39:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 10:39:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 10:39:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 10:39:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzTeTMQd+CH00hUBUhTj/5DMAorsN7WzV+22aOfPMS8LjFq8wQoBpiPE0NB2hd7KpRcAEsZsZvyVhl5K/fye/27SsjZD+JMTrpEF/MdAGlri29H8xHsDHrgyUa+gWpt+zTPaozhB6uIUKxZ0WBlToNsf0u/wXPntjfrKs10JptCw52TuDM/Ya4umXzUya7tX500u51syzD7aT6u0wEXwRQev1fc0GOecr2pxukYShAcOLpniSOKxYfgvUBKGOjjoOERUH6RQmWBDFsGpFm2imJp10ahvVE1JBsOUPYh2XOy4tXTJH2/+ERl0g5jKhnEsme6TjMLIG1pzWYfm3TMEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2woJl03XTpu5p70v075800XgnsOsjsFPal3HMVqfYck=;
 b=ENbLVbZQ2Rt69MqRcn4Y55nqe3EP4870Kihc+WhX5PCpetpvfcOkLYOulTOG8eK3WkCpYtyUiqjXZEEJH8kZU+9EFNIKJL4vdCsdjkB5d2yh+Qnk5jDnrLMKvfrIdFH4/QosZVEeJ4rkOWi+2iTAelf8cO0bSf6NAWUgafo892PfHFycHyRx/LD2SaFV6Q/P7FwoqPhYMzX7C+GX71Sz0E5vOSJX0WMLXZzuIBnv1VKdHZgzdzNboq10cyq/GHCGgBEO+/gk7MVD2d8c+vOBTmzXE3DikNVKA/6Vc6F3GFvPiOSglcHt0yHdIQ++vKpB84W8G+EKasI8Av4uZxLA+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7337.namprd11.prod.outlook.com (2603:10b6:930:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 18:39:02 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 18:39:02 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ujidcfwjkj5mvdc7nsfhbl76gk4vswl7ibqkwy24xieiwlpfer@ly57qp226qsh>
References: <ujidcfwjkj5mvdc7nsfhbl76gk4vswl7ibqkwy24xieiwlpfer@ly57qp226qsh>
Subject: Re: Add env info to igt_runner (was: Re: [PATCH i-g-t 4/4]
 lib/igt_device_scan: Fix scan vs bind/unbind/reload)
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 <ryszard.knop@intel.com>
To: Zbigniew =?utf-8?q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 19 Dec 2024 15:38:56 -0300
Message-ID: <173463353627.12700.9195378206658809784@intel.com>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:303:dc::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: b1636041-e265-4bc9-c0fb-08dd205c68c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGtOb003bk5NQ0g2YS9Fdk52Tk4rQVZ6d3laMjBUSDhDVzk5U2J3ejVEZ0Js?=
 =?utf-8?B?MlFVSno1K09SSHZsR0NsZ3lrcEdWL0N0Z0VValFHU3M3c2NJNDA4WFFqMm9U?=
 =?utf-8?B?L2NwVzc3TUlmeHJhbkZEYS8yenVDRnU0bXkwTk5lWlYzSy9lSTM1WFZ5M3Rk?=
 =?utf-8?B?TEtOKzF3bmJCZ1RVMnErUXprSkZlZ3YrQzc2bzNkZUUvcnVDTDFlaTBXak1s?=
 =?utf-8?B?cHFpa1Q0dDA3aHFONnIyenQ1TUdSSjR3a2ZLTHVFSzdiRlFuSlIraXllSXVx?=
 =?utf-8?B?V1AySVFCeWI1dGFlV1p2MFB6WWxxVUpZbjc3Z3IzZGlyYzY3UW84QlQvSlBu?=
 =?utf-8?B?TXk3NFg3ZytUL0hldUNQZXc0R2Y5eWZTTUVlc0RIVDB1K0gzVHFIN1dYdEx0?=
 =?utf-8?B?R0NYV0wvQ3YrdHpzVnZ6VnNxRjN4bmVIZTJsOHBjejJsb1NqUFhadVRsMHNW?=
 =?utf-8?B?TnVaTTBHNElvdW10UnBPOE5HckxWUndEc1J0Si9MTkNEdms0YU0yVXlxRkt1?=
 =?utf-8?B?WW8vMVFCRlM0VU95L3d3anRQeXNwbmRyOWV2b1BnVldzS3JWazhYK0RXaDkv?=
 =?utf-8?B?TDNaNGkzMWdQYjVXeEUrUG1OdldDaGdGK1hKVy8yNkJvanlyQW5sbkN0UHBk?=
 =?utf-8?B?WExBcUg2UzdTUFBaT3JjUDFBcWFraVVyTllNVnV0SFlCYndEVGtwNUd0aFM2?=
 =?utf-8?B?enhwbmNMcVFza2U0dk5HVWxxTDF0dVVjcTNtRFZDcHp4WWh3RTRKd3U3YkxP?=
 =?utf-8?B?YmpNZ0F0eXFZOEtvTWNhK1QxUnRYNVVRanRXMGh6ekVUVElVZ3JGSEtTbDVo?=
 =?utf-8?B?VGg2YS80RFpzSG5USlJscmlCMng3WnBTMklyRWRBZEdsUFA5ejJOSFZVN3lr?=
 =?utf-8?B?bXJBZnMyaGxmaFl1Rm5jSU9MTkFuQXBtbHhSbVM3QXRPT2F4WDdDSFVsWHBw?=
 =?utf-8?B?aklwQmRGNzV2cFN2Z0M5cHF3LzRteUF3dG1nZlJlYjU1WlZiYk1sRm1VM3NX?=
 =?utf-8?B?RGZxTFFFTlZheHdNUXN1UVFtWkVIdGNybE8zLzJmOFBzZXhmMkdyOXZXSFIx?=
 =?utf-8?B?ZWVxQ0xvL1o0ZURIeDRVTi9xTldIU0pnODBDMnVxZDdHcEQ1YmRGd3dWdXJP?=
 =?utf-8?B?eUJYRVAzWTlTYTFBbXlXd2xUWUpUYnJMUmtGUFk1SVFOcFBqT0RKK0I0Qzlw?=
 =?utf-8?B?THpMMlowclFOSDdCcldUbjBKNEdjSG16b2ZmMVk0YTdjbjZZcys5ajBoZlA0?=
 =?utf-8?B?c0hsQlVldFExUlhtRzdaU1NmbHI4TzVZRUNjYytONHF1TUNEQ05nalp3a2Jk?=
 =?utf-8?B?RUN4QXdpN09XTzBocDZxQ3l2YytVZkdUV3JFanNpV3JyK1NVdlI0ZjJGUHBS?=
 =?utf-8?B?UDFlWWJmWS9UcERzMUU5SlhKOGo0R2tQOTZ1R0dMaUpmOEJubWt6ckFxWDA2?=
 =?utf-8?B?WW8yMW5pYXRiN1p1QlRza0FWZDNGSEVwU0dBaUw1VE52TFZES1pQSjRnTTdv?=
 =?utf-8?B?bUUwcU03UlVMd3pXSS9ycldnbGJ1Rk56SjVUZTV1NjBUZXlXM2lmZ0dIWnR1?=
 =?utf-8?B?VU96THNGU3dBWXJxYzdtOURlOEdkYjhjWUhEQmRkcDJLMkZ4eHJaUjFiU1FC?=
 =?utf-8?B?NDBkNThvUHoyQjZHMzUzNExYZytqem1qcldaa2dVT25NL3Vpa1N5Zjh6aDM2?=
 =?utf-8?B?NmovZC8zRHkrK3dZUjA4UzdTMGN1RHhWem95OTFNMlVOaEw5cXdpNkFaOUFY?=
 =?utf-8?B?QUxvQllKaUZZQXZIRlBlbUp2MVhyWm1tMGRIS3hFL1g3a3ZiYnFCNGZOVmhN?=
 =?utf-8?B?Z0NUbHVDUGlvU25XSlJWa0wyQ2xPOXF4ZW5tSWxZbWErS3J0cXhtaEZvWTNT?=
 =?utf-8?B?c2E3MHUzdzlEemZlcVkrU1FzMUVvV3NHeGJORHV6UnRValFsQSs1RVU3NmtR?=
 =?utf-8?Q?tirBnXku5xpV+KRfa33fE1wYEWP2d94J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bml6V1pmS1BIN2Fsd3dNdVFKRVpJL2JvRmhyREpPb2x3T0VuS3orSThOR1Rp?=
 =?utf-8?B?TUEvVTRodTlUdmJ3VGJ3THl2RE5YdW5pckMzRk1IVXZqaE1LL0NYRDZFNlNp?=
 =?utf-8?B?bkZjL2FyZHVmQ3l0Z09Zbk00SnhJZVY5NGxSNWU1bmJvY0RrT216cmpodWtG?=
 =?utf-8?B?cTFFS1JubmRUcWdxZ0pneWZhak5wSG9GVkN0bU44M3JqZ3BWVVp4S1R2QkxD?=
 =?utf-8?B?UjRJcWhQc3JJT05naDZacUdJc2dyTnNlZDB2aXd2dkFaUm9obWJkVnMxQ0I5?=
 =?utf-8?B?OTNyNHkycDN5N29rTndKb1Y1d0hlZ2doQTBoRUMvcjUwNVFnZHYva2g5TlVw?=
 =?utf-8?B?ZXFWa3lPZmRMWG53eUNmNDltT3BlcFg1NjJZRkRGbFMwbzRmL1o1YmhaL0tj?=
 =?utf-8?B?TE41dzdza2tDQ2tvcFhPQkRhUHJOZnY1ZHNwSzNsNm9DMk5UV0tIK01BVXNu?=
 =?utf-8?B?emw0aWdDL3FGU1FsNmtTdFNDd3JrbkJXWHVKUWQ1YWdRZkJTN253WGdxbGZh?=
 =?utf-8?B?L01TcDNqaXZGOTR5SUVaOWk0S3Eyb3d4TW9XbWEzejVicXlKRnMwV2ZNUUtM?=
 =?utf-8?B?T0YwMjFyaDFxa2dQV0Y2S2FMdXNBV0FUeDYrVzJEUk8zaEYzUldsMzlTRmhl?=
 =?utf-8?B?cjhPM2hxa2hudXJYL2dzdnk3SVh0Q3BPTkJ6Tk5aQ1JvNEU5VGwrbjFWblJp?=
 =?utf-8?B?RGxDcFliYnk1b05YeEUxcVhyNzNYRXlBRWxiSisraEg3dVJ5R0hFVzdUSWdk?=
 =?utf-8?B?Nldsb0d6ZWZBT0hET0g0QUlQTW9YeFlLN0owT1l0TXkvbXR4TTRsR0VkQUV3?=
 =?utf-8?B?ZjNUSkkzL09QRFdRS0NYaVM3WU9lVlBESloyTGpMYWNtZWdBa2diM0p3L2t2?=
 =?utf-8?B?SXVDdkpUR0xWTnNSSUh5TlY1STVjYnhZdkh0ZzFRRDRhVGRuc0gwYVVJcHFI?=
 =?utf-8?B?Z2w4dmhxU2QyT2xaZmQvUktvSW5ROHYrUTBNRkk2TGZ1cE02S0hPdU1Md21v?=
 =?utf-8?B?WllyOWpNcEY5RERLVjA1VkQrTWIwWXJGYUx0M1NtRzJHUXlJTnpBVDVzaTE2?=
 =?utf-8?B?L0RnOWhzajMxMUZJUmFBZVpBVU5jQlNRK0N0KzBXazZMRHpOMDJzamNkUFY0?=
 =?utf-8?B?OEZWQWQvV0ZYQUZHRWcxTEdkSyt0aHUzTS90OXNYWW1JcWJ2UlBoL2o4MDJP?=
 =?utf-8?B?ZzRtTGJ0NVhtSDEzeXpveUVhc0ZzVDA5QXBUUGZESVB2azNmaDhFSVZsQ3Rh?=
 =?utf-8?B?NkxPZ01vemdzczJ6RDhsSGxtNjRWQlByQytwNVhBN2ppdXBmeUg3Zkg1N3No?=
 =?utf-8?B?dFRVSXJOWlQ2NDFVUERNR2tUYWJZa0J3OXhhQVdPTmwxU2YrZ05VYVB5aXJl?=
 =?utf-8?B?ejQvRDRyVFpHc2xsREZoN1NLa3dPbHh1bkZMdnBTMkZ5ZHc5aXB5RkFPaURS?=
 =?utf-8?B?OTA3bjAvU09ubzgxTmo3YURPemx5THlpUzZXbDFmVzJjOVE3QlJXdjJ2dmE3?=
 =?utf-8?B?VEVGeFZSUnM2NTI3ZEhQTUNTaVNJeFdFcEJBbGM1ZHBWY3pGQXlKTUhBcy9r?=
 =?utf-8?B?eWlGWHI3NERaOVFxSmg4L05aSHoxMkZYMWlLZnVINnlrSDdhWU9VNVFTMGcr?=
 =?utf-8?B?ay8xazl1cnlBdklOZ2ZlL2FVTW5CdkRRZFZJUWpUSTdpUFB5ZHZpQVdkcWJs?=
 =?utf-8?B?VkU5cXYycUtUY2NCNU14UklrVjcxYURkQ3N0akFhYlFmQ091MnNvdlBmZkZa?=
 =?utf-8?B?UWdwckxxVjVNL0xySk1DVDFYY0RCUVc0R0ZpaFdlU1REWHlCMU5sUW44QjBo?=
 =?utf-8?B?ZXZCcGhhR3NVVnU4NVk1SWloZFpmY29hZGRpTVp0Y08xYVg4R1FkWVc2N1lq?=
 =?utf-8?B?ZTJpK3Vxa3grWmpDb3pYYXQ5bTBsYWFpOWhWeVRRaFZ4QWRCM2VjaVk1L3Zn?=
 =?utf-8?B?S081MXArclhXUDYyUUZoNWtrOHRVUDk3YitlcHNINWcwQTdob0M1M1JhdHZL?=
 =?utf-8?B?cW8xY1B5cWlJRlhoWDFOWW03OExnUHhiVGpST29sbmgvcE40cGRncWg3Q2F6?=
 =?utf-8?B?R0xnWVZMUXpYNERNZHlkdHU5YTR5SWNLR2V1c2s4Y1VEdXY5TjdJTnJBUUlI?=
 =?utf-8?B?cnRzZElRdHZaeTFTMkJhTjNheEo3VzZUcC94M0RZQmpZbnRoOCt6dHZtNTN5?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1636041-e265-4bc9-c0fb-08dd205c68c3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 18:39:02.4779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 177RTWdhEU/Il35zv4zIATKIUZcKB6RpcePecc8Y5JEU+2uhm79WFHkjB3dq7NaWRDrxbl0oA775Afw8W2jxYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7337
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

Quoting Lucas De Marchi (2024-12-19 14:24:09-03:00)
>hijacking the thread and adding some people to Cc for the igt_runner quest=
ion.
>Previously In-Reply-To: <rnw3q6mhthnwyvowvszr2gllyjtbb2mozk4em272xlmkvm7py=
l@szbhtg3sd7d7>
>
>On Thu, Dec 19, 2024 at 10:35:00AM -0600, Lucas De Marchi wrote:
>>On Wed, Dec 18, 2024 at 07:34:19AM +0100, Zbigniew Kempczy=C5=84ski wrote=
:
>>>On Tue, Dec 17, 2024 at 09:13:24PM -0800, Lucas De Marchi wrote:
>>>>There's no guarantee a card will end up with the same device node when
>>>>modules are loaded/unloaded and drivers bound/unbound. There's some
>>>>fundamental issue with the igt's the way it is and it's also puzzling
>>>>from the logs it looks like the device vanished from the bus, when in
>>>>reality is just the SW state out of sync with what the kernel is
>>>>exporting.
>>>>
>>>>Re-scanning when trying to match a device is not expensive compared to
>>>>what most tests are doing, so simply force it to occur whenever trying
>>>>to match a card.
>>>
>>>I also should comment the above. It is generally true, but I've noticed
>>>getting attributes might be expensive. Even it may take up to few
>>>seconds, that's why I've added some attributes we don't fetch from udev
>>>(see is_on_blacklist()). If I'm not wrong getting 'config' was a cause
>>>to limit attributes we fetch.
>>
>>why would we get all attributes and exclude some?  Shouldn't we get only
>>the attributes we actually use? AFAIK this logic is basically used by
>>--device/IGT_DEVICE, right? What filters we normally use?
>>
>>I usually pass the pci slot (because I know that won't change
>>dynamically and cause surprises). Apparently CI passes vendor/devid:
>>
>>        export IGT_DEVICE=3Dpci:vendor=3D$1,device=3D$2
>>
>>(but it seems to vary depending on pipeline)
>>
>>Some devs pass the device node directly too as in a lot of places
>>there's only ever card0 possible.
>
>
>Could we dump the env and args somewhere so we know how igt_runner or
>individual tests are being called without looking at the CI piepeline
>sources? I was thinking about either having that info in the stdout
>output of igt_runner or in the json. Another possibility would be in
>dmesg, but I'm not sure it's a good option. Thoughts?
>
>My preferred option would be to have e.g.:
>
>{
>   "__type__": "TestrunResult",
>   "results_version": 10,
>   "name": "xe-2403-995cd30a4e222b6a7b4b40c36219e4937fd7109e\/bat-bmg-1\/0=
",
>   "uname": "Linux bat-bmg-1 6.13.0-rc3-xe+ #1 SMP PREEMPT_DYNAMIC Thu Dec=
 19 14:40:51 UTC 2024 x86_64",
>   "time_elapsed": {
>     "__type__": "TimeAttribute",
>     "start": 1734621126.8734231,
>     "end": 1734621288.5994539
>   },
>   "environment": {

Nitpick: maybe "env"? :-)

>     "IGT_DEVICE": ...
>     <any IGT_* env var>
>   },
>   "argv": [ ... ]
>

I like the idea and I also prefer putting that info in the results.json,
which makes general info about the execution more self-contained.

Does CI always make results.json available and easy to find? Depending
on the answer to this, we might think about additionally dumping that
info in some user visible log from CI results pages.

--
Gustavo Sousa
