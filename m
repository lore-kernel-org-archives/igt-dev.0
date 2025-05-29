Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3B3C54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 16:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC91710E752;
	Thu, 29 May 2025 16:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eV/wDxaS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B07810E75B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748535873; x=1780071873;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yNv3CtDzL5UgykWDfL87eMX6f1s+nENpOUlLB4fAFv0=;
 b=eV/wDxaShGrmKo0omyHTlW+9uRTL/EyapvzpI98xuTtSx/Ih4zzIQTaj
 ND2SKPlz1wUdC45EaXtPX58RT2y681ryy/066jj4ZkaJ2yomdHE2CsxuX
 di+tMnEnLYfFCuNq0IhbR02pLn0KwWwnhDcNYBZ0DA1i5OLV8lkZNj+42
 DYe8SVj7ttHsjR+sh1hjuFziQF1N2+enNfmzT2ICwiRj/UZvLfpXm+jV5
 SbMWHi6r0fs0Jvqhni8S3/mCZBeV2oeZ1zz6GhirT81mTpQIvdGV0kwcR
 1ERm41JmrFcepyr46zlh0fd5h0CmzRqqSsF1fbtEcFTEWFL7meB4urYyc g==;
X-CSE-ConnectionGUID: 7uwgizkeS8apECu61MtIcg==
X-CSE-MsgGUID: Nxnt+E6ESRmRZEs8OoeAzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61272685"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="61272685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 09:24:22 -0700
X-CSE-ConnectionGUID: DtzUPAxEQ2ar2ExVt7i0yg==
X-CSE-MsgGUID: dbHQRmXdRlCrN/tyJjCCNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148395933"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 09:24:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 09:24:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 09:24:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.86)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 09:24:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ms0qhl5DvV59XG01JaOt9oSyHJ0nXs9/fsWG60jyPaVlAK6/K3wQEDUJCH5G4hsrI0e76kwReAQKasq0Zc38iXHzNQl8wv2+4k+XeAUoom8sYt786qWt3qFzCWOqK3RwQOyea4N32uC9MJAPiSWPTScMDUu9Dl+NvkZfMNkqMWm79zi98yuC67qhHbjWYmr5QzAlrBOdod4gZ8j6bm9oHhnO+4l8vC9bRxhX+YQdU2VpZLfbSz3IpShP6OnjqvMshxGgWTJQ/hSAGaJboTAJwuUwFtcDMWwZ1klWyUsP2LVb27329LpIVVLRg27a2/A9OQE+UFnZdsOKpa1NHdavXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okzq6KAPvfrTS3CxdGNE0lpvc4x2vPDcgkucBz0FShA=;
 b=XnNuYM22mGZ99KUyTrblUFhJnsK4hjVhy6RGVZMrSH/DH7+g7tnWWKmKjZF0hH5rOsA1VRZfoQeQPENlSrWxVIjVXm9Sexv5Hac/BqOxMgtNuYtpA04JH1WaG+bH+K0gyQb1HPKmOYqRTNHC6qbQn6DSdfKkpPpMliBc8mhdS3JASwnCdGX4Zfggwi7xab1vUWVr80bPELh041XEYFeVpJpG84KN6ameCSI+mI9JGRbuC3YBPNSqzGE5SiGlJ2sT+Uj+8djirWKdeMzcfkHDTUbilhU9ZruI+RduK/Pwn0IBU63QR832KfgYU239zoxipJMaAdQagoDul32KKjA85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 16:23:38 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 16:23:38 +0000
Message-ID: <b9aa7f22-aa4e-4f9a-9c5d-98d58066fcbb@intel.com>
Date: Thu, 29 May 2025 09:23:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:a03:255::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ1PR11MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 931626ac-1577-40d5-f7ad-08dd9ecd2ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c29sd1phTE1vcFF2U0lyMXR5dDdyQzF0b3NsRVBkUTBwRXJXVklDM0dSWHZH?=
 =?utf-8?B?OXNOckRuUHdDZk0yTWhtSktPM3NPUDdGR2QvbW5tMVM5cWxhamkyNjI5bWFn?=
 =?utf-8?B?UGJzM0JPWWRaZ1lYb1Z1c000V1FoSlpZZHkraW5YY0UrWXlpWkJOVGlINlNy?=
 =?utf-8?B?UC94WkxOL1ZGZGxPZHd4TDFEMDFJbWZZbCs3VFNVd1d2MW9oUG9iZk5KQzJ1?=
 =?utf-8?B?Y2ZhbmpTRS81cG5JbnVsUmRVQklPK0s1TFUyeVNiSTE5dnk5bTBEclFrc3kx?=
 =?utf-8?B?TUo0dVB5VXNCRE5VRytPS2J1TlcrVnZGRU1SR1hnZ0RSSlJ0MnBJVFpFNUhG?=
 =?utf-8?B?aHp6aXhudWxEb2FhWXhNWGdQOVcrUnlIdVpyeGJmMEJFdWpid0lISmsyRmNC?=
 =?utf-8?B?LzdTRXQzUUpUcGlIRTM1MTNkZVQwU1RQcEdoZm54ZEQxbE5vL0xsVThJRTRo?=
 =?utf-8?B?bkdKWjFIZHRPOGJKODVxQ3hwQUF5Tmh6S0MyYzdVVzNDMVlzWFhuVGRIOTFv?=
 =?utf-8?B?ZEpRV2dhcWdXMzlQNGgvcllxT0NvUUpBYzlOcE5PQk9DZWxpdi84MW9uVHAw?=
 =?utf-8?B?M2NEZktGQ3pDLzdpMHQ4L3lMSEQ4OE5YZlJZV2xJemlHKzF4WjBRcXByMFYz?=
 =?utf-8?B?VjZBZ2JRTC9YVXVCZkZMc293bGpmK0p4dlFoaU9JT3dsYmlQcEN2N1FZZXdm?=
 =?utf-8?B?R1E1RU5NdnE2Q3lNdW9lZ3ZTOVBFK2RyMytON2U1U3pPRHhPR0hEWk9QZTdw?=
 =?utf-8?B?RGs3WHowRjJZcUlJUmVETVVmOFBabTVwaWhjMGhtdEs2UytUbjVIVm5Bampr?=
 =?utf-8?B?ak1Ydkswb0JXaDVHTytxbVBPaUFUQWNNZ2pPaXh2S0JLWlJvTHNtVk9ISm1h?=
 =?utf-8?B?NEg5eUE4MytBaG1VdnRpdXg0OWd4Q1EwR3dnZTVwMlB5ak1DMitTYzEvaWtr?=
 =?utf-8?B?VkhJWkF2Tm9ERE1PZUhUTHJPcC9Oblg1QmlIVDdHZjgxK09lRUtQKzlHREor?=
 =?utf-8?B?bWFiT3VhalJOSVBEbVRGV3lTZGNQS3J0c3Q0TFhuYW5FZ2kwTVlCNmhsZ3VB?=
 =?utf-8?B?R3NrQ3MrbnpTbC9jNHR6RzNnbGpLRnhRdGlYRWwvVVdRMVcreHE1UldIRStl?=
 =?utf-8?B?MEZwei8yVFFraVAyQVBFNGpJQ3pXemE3cmMrRmRNbllKamZZRWVSaHpzSGRR?=
 =?utf-8?B?MEdLUVRHVURXTDRkcHpvNGYxRWo0R2VSbWRXNE5pRzhjUWI3a0QxdlBhalNI?=
 =?utf-8?B?Zmc3K21aVkRsYm1mcW91OXV2RkxJNUY4a0l1VGpKV3VHSVVtaFlwZExBQ3kr?=
 =?utf-8?B?SHRYTDcxcnRKWVlPTENWbTNsc1AwUVhYc1grc1NzU05mTHNtaDdpMXF2T3NG?=
 =?utf-8?B?QWM3eVJjL0d2SU4wUmE3eGpndUxORDNocmx1aEovcW5xMXVtRXVwc3pmL3lY?=
 =?utf-8?B?NXBKcGJNeXg4NjVOSHU1aEJiQ0hRNVdCMllTeTRNQWdyYVhtYTBzSlNFdEhW?=
 =?utf-8?B?T0xhNmN4NWhNT0p2ZmtZZmlHUk5QeDIvQ25qOWVkUURKWGhOVWtLYldsS3Qy?=
 =?utf-8?B?K25JRnRhOEIvS2lGSUZxNXVaSUVXU09GcjJQaHJLd1kwaFo1YmIzbmVUanh0?=
 =?utf-8?B?cno5N0NmWW9OQ093L0hNOTRNa2tRbDEwcUhTSE42ZDBIcXlIYnFXMVhINUsv?=
 =?utf-8?B?Q1JPd1V5VDBIMWUwL0V4bHlZeThqMHV1S055a1JzOCtwNGhFVXZOUTc0ZmNt?=
 =?utf-8?B?TGI1RjJUTVFBWTAxSzRaTDk4dFdqYks3OHYyYkt3V3FLZUU2b0s5YmJKQkhO?=
 =?utf-8?B?d2NFSDBrVzBQTE0rSmhtRzRGVlhDUk5UZVVHQUd0UkJsdndWYkp6VGR1bDBt?=
 =?utf-8?B?OHA3dXRnVTJTZVBKWDRhWkxXaElRY1U1NktWQk5uZ0NaVlBNUjE2aHhpaSsv?=
 =?utf-8?Q?rzdaa9z3CUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2d3c0U5ZkNpR0F6NGpGS0xJeUFjdEUzb281eDE5cWlaOFJYMHdVOXJzWWNJ?=
 =?utf-8?B?SzJSSmpGbmNjL1h4UXFDYlFqRTk1Wm9FdXVBVEVZVUpib3pFRWhBUGlJVDd1?=
 =?utf-8?B?ZHo5WVV5NUJlUWJRcUFOR3hNaHpZMGJ3REdrRGpTbzExeTZyK3lYcVlmN0pu?=
 =?utf-8?B?QVZ1WXNlSFg2Q29oOE1RUVhjTUJsNHExSmRBekw4d2xxZ1pKS1JlWG5DSEM0?=
 =?utf-8?B?WXUzSkJkUHhNZDJDOUQxRHNvMEsxOUJydXd6SkxlZWRYV1ZDUGFHdnhGQjVu?=
 =?utf-8?B?clpLTTdyRjVaQUo3R0k3d0FQMm9hcC85amZoNHZTUmtuRDVXc1dWYXdDYkpU?=
 =?utf-8?B?RzRwZk5QSTYyTDBwTzdSVURURFJnUkRvMWNFSk9BYlM0d1JlSFQ0a3Q2MU5q?=
 =?utf-8?B?c21HVllvMVlzeEpXMGs4cnJrb3VDeXZlVVYwU1hScWc5YmQ1SVB6SkdKSzRx?=
 =?utf-8?B?YnIyQXNKRXBjY252N1VPcHRuRkVNOFl0dWdwdVBWbmFVSnFTWi9UQmczL2xE?=
 =?utf-8?B?MVdoRURRQVZIV1dRUEZGTE9aTWdaZFUzY3l4UDI1ZXo0SC9TVnYrTmVYOEUr?=
 =?utf-8?B?UVBWZTl4V1B6R2c5b25sRXBEaXhvcXhqTmhkZmZqblBRNlZ4MUZXV2ZrRm1F?=
 =?utf-8?B?c1Iyc3l5TkpCRDVLVENJZVJXZDVldEFGb3MySml1eE1OTWVFSzQ4SmlhZFRt?=
 =?utf-8?B?OW5GM2UwNlNIQnpodGthanAva0hhcm5jazdaMXpKZUZ6M1U5QmxhY0lEWjd2?=
 =?utf-8?B?MEM2Z1Vla3R2b08rcEJpRDNnWEZ1UXhYZXpjdnlETS9JK0ZPeFFONmZNN1Vj?=
 =?utf-8?B?NUhRajFPa1RMZnFVcnNEamNlY1lOaGRVWGh6K01KYTVBTlVIQXBFSUo4c2Fu?=
 =?utf-8?B?LzVKMXJHZmZEWnRRVndiYm8rdkhZdUsxak1xR3hwM3liaXIvNllDZlN2K0tM?=
 =?utf-8?B?U0pTdVdVUU02V2dqbjNoOUUvTVdRUkpzMnBXbXpLU2F5ZE1yWE5hUDF5NFFk?=
 =?utf-8?B?bHNwNVRUWHY4czBaMTFRcUNyRUEvallZMkI4NDdUb1J6WUREeGludGk4MUpa?=
 =?utf-8?B?ZlVZOGdlWVlvaW5ZVG0zK0dLaG1GM0c1R3kwTU52UkRYMFZBYk9mdmM4c2VN?=
 =?utf-8?B?WFBIVnZ0RjkxKytkWFpiL2tRSXhwSHdua2JhT0pJWEphVEtVYkhvU3pENVJr?=
 =?utf-8?B?cXdEVUNaSVUzQ2RrZ0ZLQkZLTitWQXdYMXVtV3VDenV2RTUwL1pGbXFkN3VL?=
 =?utf-8?B?czZ3N0d4QnF0KzZKQmJEUk5XV292MHM1aEVqNCtXNDY0UmJRaWY1UHdxNU9h?=
 =?utf-8?B?RGtkN0VVNWFES2g1TnhXeXpNRWVJbGRmYkRNSDNveThTQlRHY3hCV3ltQUVi?=
 =?utf-8?B?akJ5TDBoOVhZa1FLK0o5Qm1aVzJiTC9VM0JIdjFyMU9ONzcwZ2FRcENPVlNO?=
 =?utf-8?B?UER3NU5HZUE4TFVveWZtcnl4WDhtK2g4TVBJcURFYWxCMW9lL3lpWFBieHFF?=
 =?utf-8?B?a2dvdmMweWtLZi9xNHhLLzVTNVAwZUhiUk9yYVJORkdEdTlpRTB5b0Jid0JL?=
 =?utf-8?B?Tmx0UWRGd3hRSXJXcXlOYTBKVDRUMDJ1d0tRS3ZQTmhvY0JSZ1FKZEhTc2Mx?=
 =?utf-8?B?V04wdjh0WWRhc3YrNUpiWm9UV2hsdFA2TmZ1cS9EWlNBLzBwcE5NMnUwZTZv?=
 =?utf-8?B?QmFsVUpNb3pmcmtlbWxzYVJFNC9kczYyMGNiYnZYd2JuYTEzRmJqaVR3U3RU?=
 =?utf-8?B?MENQVXlaRXFZUmxWS21IQ1RyaFl5cERZVlZLS1RmQzFhK3d3MUhWT1YrOHFr?=
 =?utf-8?B?VG15elgzY2NiVk5ZQVpVTFpIYytrNDNEaUJWY2Rwd3hhR21Pb2VpWFpZU0Js?=
 =?utf-8?B?cTdOTlBweEQ0eDJvSk83UElwWmFnc3lCUE9LMEdIQkhhdGdudjY3Zlp5OEZ2?=
 =?utf-8?B?Q3M3OXhKNi8wTEgvUm96OElMTzhFY0VSY3NWek5iSUJvRFpSNnJYM1dQOGI5?=
 =?utf-8?B?YkM4Qjlkb2w0Yk5xY1hjbUZ4VUNXNDF4cjIrdHNzZm1adVZqMEljTjFRTHZp?=
 =?utf-8?B?YWdTRVR2WlBadEYydFBnYzVRZmxyL3dNTGFRaExEVkVvdnROVElXR2dqalVF?=
 =?utf-8?B?MUJnM29PVS9PMW4rYUhtOWpzdGhrZGNIL29TVktkTzlRNU9SOWZNWmI3NFFw?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 931626ac-1577-40d5-f7ad-08dd9ecd2ac6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 16:23:38.1033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfUWa0fKV/kF1iyAOF6qzw668rLNOi4qeWmqunyrrTu0pEs/Tz6QP7Io9/sZzb49awzMf3lKQ2F9lX9AX0PfEh7uDZRPh4LK9knEogW9AU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
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



On 5/29/2025 6:31 AM, Satyanarayana K V P wrote:
> Currently, numerous fault messages have been included in the dmesg ignore list,
> and this list continues to expand. Each time a new fault injection point is
> introduced or a new feature is activated, additional fault messages appear,
> making it cumbersome to manage the dmesg ignore list.
>
> This new patch automatically ignores all error messages from dmesg, eliminating
> the need to add or maintain a dmesg ignore message list.

This would make the test almost meaningless. If the test finds an actual 
bug (i.e., an error we didn't expect), how would CI detect and report it 
if all errors are ignored? The only situations we would still fail on is 
when the kernel just dies.

Daniele

>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 35 +++++++-------------------------
>   1 file changed, 7 insertions(+), 28 deletions(-)
>
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index f9bd5c761..0dffbe5da 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -64,30 +64,9 @@ static int fail_function_open(void)
>   	return debugfs_fail_function_dir_fd;
>   }
>   
> -static bool function_is_part_of_guc(const char function_name[])
> +static void ignore_faults_in_dmesg(void)
>   {
> -	return strstr(function_name, "_guc_") != NULL ||
> -	       strstr(function_name, "_uc_") != NULL ||
> -	       strstr(function_name, "_wopcm_") != NULL;
> -}
> -
> -static void ignore_faults_in_dmesg(const char function_name[])
> -{
> -	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
> -	char regex[1024] = "probe with driver xe failed with error -12";
> -
> -	/*
> -	 * If GuC module fault is injected, GuC is expected to fail,
> -	 * so also ignore GuC init failures in igt_runner.
> -	 */
> -	if (function_is_part_of_guc(function_name)) {
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
> -	}
> -
> -	igt_emit_ignore_dmesg_regex(regex);
> +	igt_emit_ignore_dmesg_regex(".*");
>   }
>   
>   /*
> @@ -234,7 +213,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>   	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>   		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
>   
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   
> @@ -299,7 +278,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
>   	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
>   	xe_exec_queue_destroy(fd, exec_queue_id);
>   
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
> @@ -334,7 +313,7 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
>   {
>   	igt_assert_eq(simple_vm_create(fd, flags), 0);
>   
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	igt_assert(simple_vm_create(fd, flags) != 0);
> @@ -397,7 +376,7 @@ vm_bind_fail(int fd, const char function_name[])
>   
>   	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>   
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	igt_assert(simple_vm_bind(fd, vm) != 0);
> @@ -445,7 +424,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
>   	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
>   	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
>   
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);

