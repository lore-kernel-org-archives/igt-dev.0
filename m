Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20CAC369C2
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 00:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9587A10E3D3;
	Fri, 18 Apr 2025 00:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M633K+tW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6077510E1A9
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 00:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744934488; x=1776470488;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=xP1L010hT0tSC/maD5jrewjSupobo4NMlp2Ai7lP/MQ=;
 b=M633K+tWB12dMaSMTpbMZOHfEDBadmblhiogCAC7S98WQ++OcxLLT4Mq
 o0/eYu7y5BBdyM9u4yqvSMIfGs8dvI2x7RoJGXvhV//rTqfW4DawRVN7U
 HXN3vlKNdi+Y0wV7dg5oOGpXtfemeSSVXXk6JThO3uDcjsyE+1ct11mlY
 dq05pc45yP6KGWNfof5K4CzJeITRdg1gtQyud35eA6kxqEtHw8MDk3ifS
 scX3+k43F23rP90ckAYSj9AY7Csppk2X5+8XaHzeWbE+pgXHP3OafS/vv
 A1gsGevpfH+FjQ/GZXicQlgT7ec5+IJ/OkRxajJG7ub0Qzy0V1bWjJJWt w==;
X-CSE-ConnectionGUID: WrtaEA7jQdGBGW56OTP6+w==
X-CSE-MsgGUID: 1LUW3m20TsyFRpegmVlYAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46729342"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="46729342"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 17:01:27 -0700
X-CSE-ConnectionGUID: /NDe36vKQqeZ2AMUXol+tQ==
X-CSE-MsgGUID: 9ZpbNgTYSVqrC2U2aJ1Nxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="136078039"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 17:01:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 17:01:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 17:01:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 17:01:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ru1q143D4HjOte0TlzkteWD0DCaI/bdH8ZzNmUHx3I83NMIJWvbJDLqx1SXtpy8pu+BXcLFc3KifouY9ooJvf2AqA5WO4ber75b76GVANVKDfz5RM2nX01iKQgJAfAfy8EmuDJSSrElj2jFngYViE3HxrgfEbE6cNhSYwp4IZ4ehJsRvGKoRN4zGBLWzJtWUCB6yIlSb75cjlPzmWFj/cKca/kswPfP4QkIxuwgxJWGSXtjkS/8B7qpswDXt/xP70MRmWC7Xx0d1osY8OdXUwkYkF9yVrrsbUEIO7EcRYvr9Fedm6IXqZ+XBRg/W0phf0h+A56QdGwj/yVw8Xlxjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PncA57xIRPTiEW6zwexPMeuqW0Ae2JnTZYWQyZVxbn0=;
 b=HVHtGyEtm6+o0Znv1KO5Ugsa9HMYoZ8tjCSYT2oRRlInnwEVz2HTrTjkIInIgSMDgkgQJtsS6tdn8V+MnJLbujktce6UFCdgt0FpcuyKhjB/xPAnHdNdvQMmu2LT0nriOJ/dqBgw8JSWCBjmYeaxSOchNWbSZHn9nxhrSL5CKlRvAjkgETqpaNaaKQfMrgew7ehVSgccet0WhUkogI6yRQJV4ErUx/Bzv/Hco6BCqvhrNPiGQADJSsGIC7CVue1LBeeXcQUzcWC7gUnhswgAZJY8oPJWKwDNOHWALNGEupAA5rylTw0rKLrk7bsQEq+ba5uJIScfhrWKYP6ADRblmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BN9PR11MB5258.namprd11.prod.outlook.com (2603:10b6:408:133::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Fri, 18 Apr
 2025 00:01:23 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.040; Fri, 18 Apr 2025
 00:01:23 +0000
Date: Thu, 17 Apr 2025 17:01:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?=
 =?utf-8?Q?e_for_tests=2Fintel=2Fxe=5Foa?= =?utf-8?Q?=3A?= Save and restore
 errno in get_stream_status
Message-ID: <aAGWTaAcCGZ7nayo@soc-5CG1426VCC.clients.intel.com>
References: <20250417223931.5504-1-umesh.nerlige.ramappa@intel.com>
 <174493420024.16585.15089815704662541286@b68e5b3b99e1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <174493420024.16585.15089815704662541286@b68e5b3b99e1>
X-ClientProxiedBy: MW4PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:303:b8::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BN9PR11MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: a22fc05e-48f5-4e40-bd7c-08dd7e0c27b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3VHTy9ET1B3L3pHbGNVdFEvOVBBMmFpaTRXc1hKaFNpMzBhS2JnYjIxaGE5?=
 =?utf-8?B?UDN1ZENwT3pkUURpUXFOY01KWnBjRUQ3b25RRmU2NlJ2eXorbitzaTVPbkx0?=
 =?utf-8?B?ZXUxQ1Y1Nkp0VzIxdUpOMzJ6Vk4vY0dvODlBQXcrTUtmSkxVWERxNEZ2dDVu?=
 =?utf-8?B?NzNiVytiYmplbENxNThYbjNDZHR3Z1FnZ2dpWVg1anFPZW5DU1VjYTlBd2lU?=
 =?utf-8?B?WlA5a1FzVktaWUk0UEp5Wnl6Y3NSSnF4WHFKeFRPaDhabVh4c1IzaW52SHpQ?=
 =?utf-8?B?djhIK1NSNFNXa3JjY0JjNHVuMnFJK3ZVOHVZWTFoRHBuOUV1WHJLdFFjOWtR?=
 =?utf-8?B?Rkh3QUE3bEhXTEowMFhHOXNrTUhMUXhpd2lJR1hOWHUweUFLNmdYU2pnTWVj?=
 =?utf-8?B?RW5hTGdSdlQ5RndPZnhkUnZBT2FqMTRoK20wK2hkMzRSZHA1STFlTjYyRUQ4?=
 =?utf-8?B?N01sSWZwdyszb0FqOTI0SUw4UGxDc01rSUtKZUJjN1JPMTNWUVd2bStyQWk2?=
 =?utf-8?B?SGRpd1ZGQ3VxWE15SXR1UStqay9hZU9OU2VFd1VVR3Y4dUNuNmlzWVV3czcz?=
 =?utf-8?B?cEMxVjdiM1VvWmRRMEZOOEs1VnprcmlJQXRDbm0vQk8vZDFHaDVoZmQ1aDdG?=
 =?utf-8?B?ZzBld3R3bmU4c2dLRGxHakxCOUtvL3Qzam4rOFlOak51bGJXSlRwOWdEWUxk?=
 =?utf-8?B?VVNmQ05RYlN0R2sxNFNiR0FWd1RsaW9pN3BqbmhFeHFVN1Z1UkFmd0RPVlpF?=
 =?utf-8?B?ZTZLYnliNFg1Wi9lb1lQNU1GcWpvSTZkbkdjZXhvNDNIYzY1aXdqcG5BbUox?=
 =?utf-8?B?SzZBSENJc3ZqUktXVnhLZGJ1cVdBVlpuaXVHeWNlMXZWT3N0TlJSdW9Yb0dL?=
 =?utf-8?B?UW9KbTVJbWVvMmhNblVMaVh1TkNHenRtTzlXWkl3MWw5ZzBidTdiMjUyOUEy?=
 =?utf-8?B?TEV1QVJQWExad0phUUV3TkI2TDlhUFFtWko3cmRNZDNkeDJkYUQ5c1ZjeEdP?=
 =?utf-8?B?Y0dLb0JzVjY4SnUycGZ0M2ZiY2szWlZHcGY2eFhBRlpVZDlxS1dGenViSVd6?=
 =?utf-8?B?MVlMTjh6TnFxQWMxTS9WcklXdFBJUTRWKzBQQmV2TlM5bWlpV1FkRXFET2ZY?=
 =?utf-8?B?L3ZDMk1vcFpaZ0l2Rk5zMU9BZHZ1MUM0T1E5VTJWVWhHQ1dsdVN4cFkrRjFX?=
 =?utf-8?B?aWlRNElWT3pNZmgxYVZRb1pXaGp5aTBzRXlEQWxpdUdoN1gwaDl4TmhaUVpC?=
 =?utf-8?B?VzFGVXFiTzlRck40bHRVSUtHV1R5RDVUTGE1eC9YL1IrREpQSEp6NWRpRjJ3?=
 =?utf-8?B?WmJKcGt3bnBOeVpVQS9leUYvK1k4SUxVcHZwalUvMk01YnZIL0V3WHpuaElS?=
 =?utf-8?B?eDVpQjBuMFpzbzEzTm5MdmlhMnAxT2R2eXpOSXRLQ005YWdUQUUxZ0thSnUy?=
 =?utf-8?B?TjNLMFJydVBoTmNhMFMzNDhrYVVLaUg2RWtLUjZHRWg0L0tlaW81blZJcFpD?=
 =?utf-8?B?V0FkMnNpVm5nb2M4eE5NdENwazlxQ1QyYlpFK1J2SmtYWVlNT205SHBLRzNC?=
 =?utf-8?B?SzkwWWI1VVpLSVJySkU1ZjNxL0VLSGtTWmw1eVRFeDdmb1hDR2dOdXFCMFN6?=
 =?utf-8?B?QU1LRUo3NnRpQ09aL2wwLzlMQms1T09uMkY4d0oyNjMxTlVxMElJazhySUxF?=
 =?utf-8?B?WTVQRktuY3Y5T3UyeUZjbjRJZlZKYlB5a2hKRlNHc2hROUc2RTMzbXNkUjdY?=
 =?utf-8?B?aEdZeTNwbWVkTTV5RFplRWNJWEYxWWs4bEQ0RE5QV0p6NFFlc2cyYVMwbVNJ?=
 =?utf-8?Q?XXivnb5FRN5YPQpFSe99TQXt2QARAgecT6GWo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjJZSGUzdlJFWkpWZXdoMnlaUHRXcllDNXU0VncyZDd4SThic3NvaVA2REFE?=
 =?utf-8?B?S2Mxa05zek1oLzBINENCdFZmM3V5cHMzKzNBeFFnZU5zZXBHR0pzUzZKUnpQ?=
 =?utf-8?B?akRpVlh1VHJVY3JVSU41Y3pLS2YwNUpHaFc0OWVRRlg4QzNuNDdSZTlCOFQ1?=
 =?utf-8?B?ejA1YnRpN1o4NWNzZmorMEdyWnlORW9aU0xVMU5DRWkrMWJYV1doU1BOSWhW?=
 =?utf-8?B?UjBzenpZV3JPTmhWdFZjMFZVM0I2cHRGblk1ZmNRZmV5QzBsOFp6QjlLM04v?=
 =?utf-8?B?MzM5cU5VdENDOUY1WENvNFB1TEIwSzE3Z29rSU1nL0ZEK1lqaW42amQ0cFZt?=
 =?utf-8?B?K0UzQlExUnhhYXhiZ0ZnUzhkRWJxemQxdVhIdTJOVVhTeHVMWVdINXBZeVhl?=
 =?utf-8?B?TWU0NVFsendwR0c0cjJIeFgvS2l5ckUvbW5yRjBRczcyaXgrVkR1WmFqV05U?=
 =?utf-8?B?QXVxVEI4U3l0dER0b3BPUEhyUmNNdU9rRXgvbTM0UXNTcVI4cGI2K1BBcVYz?=
 =?utf-8?B?cTBsc2JyWkRrYkh4L2Y1SStieGRQMzdWZEw1MVZXSnZwK0ZYTnh6dzVJU3J5?=
 =?utf-8?B?cVNxdTE5MDQ1YmVTdDlrOGFnN3M5RWNQZWxOeE5GZlJkQWZ5S2h3anpVQVdT?=
 =?utf-8?B?L01WMXp2RE9hN1ZKRS83ZGd2dGdWRXZYcTZ3NXhyOXFmU2RyKzJNU2NmeVd0?=
 =?utf-8?B?RkQ3S2trNWVhMmwzdmZOcXpNOEdlY0luUlU2UVN5bjJRamFJbHJna1k4Mk1v?=
 =?utf-8?B?WktEbFlSMWNrU29lRlUzU1BZbmtsVlA3S2ExS2FObWYrenJvT0hSS2Q5UEtX?=
 =?utf-8?B?MUJYejF1dHNXWW9pL3VoeEtWMENUNWlWMVVOcGhGdVRQbHpwM09zVE5sak85?=
 =?utf-8?B?Yng3N1pITGNUMW9yTmdmWUtlSE5VWnJWdmh6RTliZ2owRWczM3RsL25oT21H?=
 =?utf-8?B?NzIvT0FoUGRlSi9EQ2VmS0EvTkMyaU9VOFpSYkhXcWNjUEVTVnJUZnM5RFVw?=
 =?utf-8?B?U3p3MFNOdDZyblAvRlpIdXduTkJxQytWL2phM3k1SExWdG9YZ2UrUlRnY0tr?=
 =?utf-8?B?c3VBRUVzQVdJdFM2MWVGUnZURVY1WmJiaUJORGF5Y2podkJPR0labHNnOEpt?=
 =?utf-8?B?aGMrVWptc0t5dzFPUVRCZ1JUbjdOTU16MEplVjFQbGNMakpxYjF5OUQ1d0ox?=
 =?utf-8?B?Lzl2L0NCZFJoczc4czhzWWw5a0MwMkNtS3AvMittdUtleVcvNE5sQVFtajBK?=
 =?utf-8?B?SisrWnVQMTNEVWZVNTVhRVM2RXRralpwSHdMd09EdmZ5bTdCaWZseVNpWktI?=
 =?utf-8?B?S2NESm1vNkV2L1FYMWxBSS9TbWhuNGpkb0E5aUpHTXRPV2xCOEgvUlNBbSt0?=
 =?utf-8?B?MStsRThkeXNmSHJkMlZoRTRabCtEaWhqUklQTFVla1R4cFk5eWJCN2YwV25j?=
 =?utf-8?B?ZHdJczQ4SnRiQTRrM2lNY3VMcHZRM2xJK1U0NkRGQlJEZktBTDVUcVMveTlS?=
 =?utf-8?B?Yk1uWlRjSTZvWXdDMFFpTUlIRU9jZDJGTjBsTTNCVW05ck5mdE9pSHpjNEdn?=
 =?utf-8?B?STNFRkFSeFgwdkpncm5NY0wxVWpsMGFMdjcrZzJoTVBXS3RmUHV2Z1EyRmFx?=
 =?utf-8?B?L1VIMlg2Wm1weEdIYkFMYkRsMEZCdTBUNy9uOUt1TEl0bElMc1dCdDhrZFZF?=
 =?utf-8?B?eEZhY3NpTnBycENxK2NmcXlOWHVxQ1JMbE1wR2QyRXRRRXdyYmNDaDZiR0Nx?=
 =?utf-8?B?RGZaVy81QkZ2MGtvek1kS01XODVFSmlqMWd0ei90WEp1R1Z6SnpZRXVGNUU2?=
 =?utf-8?B?WXZtRW1QMFV1d29Pa3Flc0ZPdGRoNjhxdlM2MGoxOXR5Rmd1cTNOWERvZDF3?=
 =?utf-8?B?c2pPZ3lYSjdoakM4UjJVRXp4Wno3bURTNDNNblBCNldIZy9VZG5nL1g4Q1FS?=
 =?utf-8?B?WUpKUUdGU3RUZVZWRjIydHJEckYweTdYR2x0cDJuZkd5MllibmhXb0xEbENq?=
 =?utf-8?B?aXlOT29BNXZvTjJUcENQNzFKQXdBWUV2S0ppRUFIRytvc0ZMbGNuWkRad0hY?=
 =?utf-8?B?YkpodFFqSkxEMmdSczZIdld6NVpMNWpNSWlSVHh1eFhFWHBUQVJra2xOaDB3?=
 =?utf-8?B?UmJIMC8rY3MvR25GQWVEQmtwUHF1Sk5pL0Q4ZjU3Tk1zaFVNcnFJWHZSd3RK?=
 =?utf-8?Q?Y7Ev7vlUDJOn3rERDgEZd5o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a22fc05e-48f5-4e40-bd7c-08dd7e0c27b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 00:01:23.1162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGHK5HnJfHW6p9R9DxaRpXYJGzGuNxp2djNGO3OJaXPyyu7BAYEvEw4IhWjQjcv9pqdaW2he2W9LtBf78+Xqb4QtseAmUFQw7bYLSL0PBek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5258
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

On Thu, Apr 17, 2025 at 11:56:40PM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  tests/intel/xe_oa: Save and restore errno in get_stream_status   
>   URL:     https://patchwork.freedesktop.org/series/147945/                 
>   State:   failure                                                          
>   Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13005/index.html 
>
>         CI Bug Log - changes from XEIGT_8326_BAT -> XEIGTPW_13005_BAT
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with XEIGTPW_13005_BAT absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13005_BAT, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (8 -> 8)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   XEIGTPW_13005_BAT:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_pipe_crc_basic@nonblocking-crc:
>          * bat-dg2-oem2: PASS -> DMESG-WARN +55 other tests dmesg-warn
>
>    Warnings
>
>     * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
>          * bat-lnl-2: ABORT (Intel XE#4749) -> ABORT

These look completely unrelated to changes introduced in this patch.

Umesh
>
