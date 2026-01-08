Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBD4D1489F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 05:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC5A10E55D;
	Thu,  8 Jan 2026 05:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kx8pMOzp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF6510E55D
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 05:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767851037; x=1799387037;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WcMxAK4CIz3kwHSxV5zjjkGIRosqOKCDiOdd+umSVvw=;
 b=kx8pMOzptRD4WJ65ae8stFKa3cwm6DR1su4JKkDYkz6Wf0vCGX4ZHXc+
 nXBULtHrGSvNr41oNiZ3+sodk05lh3x+uV380E+CNYkH0svdfuCbwLdcu
 1PrCB94lbcTKUdV1NdzYScDXyqW2frLadFswY8mp4DfrtPokXiVgsRO4k
 GZf+lqh8us0gPGuJ6YPQWwlST/GbS5MADZjXKd9Fz2mPoxAUmkr0zoYyz
 +nVnPCkt53JBSVO5RaK0EeMu50l4KEHW7TyqSVTMZs3eYItCzsCvP9jtu
 RhNdQ3LIRnyxiSLoBEWdrfD6uuEstFbnZ887NKyumjSoGA7tcaA8p9TX/ A==;
X-CSE-ConnectionGUID: FJzc1NUFRaKmeY2Aiygfqg==
X-CSE-MsgGUID: Jo3YylOXSCOu37dgiaaT0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69138846"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="69138846"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:43:57 -0800
X-CSE-ConnectionGUID: xsa4lky2ToW54GnYipy1XQ==
X-CSE-MsgGUID: AqYmWSRvQrSli4G0idIenQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="233818146"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:43:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:43:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 21:43:56 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:43:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaTY7w0Y4H2sViLIfmJxvRMbbIEP7pxlxvVqN1TmLlLalnBo/l1MDIt36wvlybTNJx/1pquOmIe1rQQMzwI/QSl6DMiFlHm7h8Uuds/hNl7mwvXyXsTd1YhFmot0g/a6kDlYPDCZwd18ugIA0sXfk5c46UbjRqY+boPY/9SILx+eL9+ukMSljXjgTWw7LiKy7Fll9m54xkOruzHo451OBS71E02tvAb3cl4z7G9ANG5UhF9f2K51P3PbRnU6glcO4PhcGqXTZt9uHgPUaCFGwAp3Z5K9TFeUG+Efn/czciYcQP73CwlgKiDNeG2VX7KvO9vyZRdk/gx0iC0ENyBgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxuQROnbCcdtg5zdlGufBh4irzury4+yli+5OX1Umww=;
 b=LVlkcPggkWMBFCa5nKwz9pQrKl4zGCejHbPeGM2q8VZqGZFKtpaNk6gymL9bQZ+InudPodGrdFqfXPDN0/Y7oDQlXVlUo436V4Yw01f3JmukBdZV0/roW1MK3ntJKsKsHZ0GyqgGIu4Q8Xe9Jf1oK/Ympc73AVXWBh93FVCVNxH0nM9LrJGqAsAqX2lFab3vXCLHbadUcn5kWSbaQZ8aMGqJZ309IlTeYOuCPdm1Mq097em+P3J/WVKy4/j8/zwzcE3DQ4dFi+ENRP6KoksOF8+hWeteaD4r4bCHhxXzgWhO+cI3Cwt2g0K2qbkZYQO+Cv/0UemmHIp4z6UN7lkMlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS7PR11MB6176.namprd11.prod.outlook.com (2603:10b6:8:98::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Thu, 8 Jan 2026 05:43:48 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:43:48 +0000
Message-ID: <c34b7f2d-7d3d-4cab-8557-0a874e00678d@intel.com>
Date: Thu, 8 Jan 2026 11:13:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/kms_content_protection: Re-create
 framebuffer before each modeset
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "fshao@chromium.org" <fshao@chromium.org>
CC: "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
References: <20260106102207.2530864-1-jason-jh.lin@mediatek.com>
 <30bf18ef-c09a-4719-a0ed-0c20d49ce7e4@intel.com>
 <e0e342ca008117af5f88ea8b022cbc07ce11c6e0.camel@mediatek.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <e0e342ca008117af5f88ea8b022cbc07ce11c6e0.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0206.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS7PR11MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b64b4f9-8dfd-4067-2d6e-08de4e78e523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|42112799006|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFNYWXo2WWR4cXVoS2p1SW9NNGV6TFczRVlFNXdkNDVCU2hWN1poZnJpZjFB?=
 =?utf-8?B?c3NSSVZWT2h0S1Q2ZWVySXhOQXh5UElMZ3dMdThTQXVXQVQxZ25vZVd3Zmhm?=
 =?utf-8?B?TEZieW1yZk5jK3ZGa25wdFJLQVFlZFlKcHFPMkFhck5leTE0REt6ZDFnaEZI?=
 =?utf-8?B?VVVWKzNDMmh5dlRIczVrRXE5dkRjMmc1MSt0ZDVYMm5FUU8xck11V0ZkNFQw?=
 =?utf-8?B?OW4rSk1qc1VkUUdFcVNCMkp0VlkzbWd3Zjd5YTQvZHR0RWRoa0JBUjFQRnZv?=
 =?utf-8?B?SS8wSktTbkFYTkt1OExWSTF2QVVwWmFGWHRjRW0wVzVaSFlKdGVxK1YvWEtm?=
 =?utf-8?B?OWVjSzVsRlZodVVaTzlOSUhPSEhkRXlIOWdUSVJublNqRCt6bDlkUDJGVHNE?=
 =?utf-8?B?QTA5Z25wekxPZVhTUEJBTnRaVDdYRjBHd2NTMlE2U1ZhejV1VlExbDAvcDll?=
 =?utf-8?B?MmJyZVlNSE51WGx1S0hrbVE0bWhrZEZQRjJVQXVWQUhweVFZSXRTcUZzbTB1?=
 =?utf-8?B?R3RhRHQ0aEpKZGdsOFdhOER5TTI2QUxFZlQ5VnRUNEJ6YThKVDhiMTFFMEg4?=
 =?utf-8?B?OWdaSklRUklPcS94YjNucEtMM0tMbmZyOXNmbngvVFpqMytJVkdsQTRyeXA0?=
 =?utf-8?B?WmV3WVkwZlREQm9iNlJ0aHFQOHk1dGtJYTVMeEFPaEF4VVZEMEFjc3llZWIv?=
 =?utf-8?B?YnV6R0lqUU10b3FLTjZLUmVSSGYvOW9CMWVYQW0vVW43SUFUM3BPc2pTVnNT?=
 =?utf-8?B?RjVWTmFCNG9rV2ZkMklSMjdGdGdSSkFQNDZyRFNGS1JUK2NnV0hSb1ROQjJ2?=
 =?utf-8?B?N2x3U3RwdVI0ZllUTTE0T2l3cUpmZ2NreGVvZTB1cW1pU3JvRm1JU0FHYlRF?=
 =?utf-8?B?ZTZCSGhtOFhQQ0h1N0NBcFJiVld0RTRUUGFVa0JsOUpKbHg3WHpVdDYwaGJF?=
 =?utf-8?B?bjQ4WkRRWHRBbzlodmtBTExQMnVzb3lJNGtNcC9seFdFYlAwTTY4cWhkOXdi?=
 =?utf-8?B?djA2K29xWWhNczYxTWo1TDA1QVJNL0ZYSmRKb29YTDJJSWN4bzlkT3p2SUI3?=
 =?utf-8?B?VC9TUkdnTW0xbEpyNjRrdlAzc3lmKzd0ZmR2QmljSnRNbXlsMnpvTUVaM2tR?=
 =?utf-8?B?N1l6UFUyNkFiOUdCQSs3RElXbGlwQkk1Ylg1cVFqNTdueS9LUGRVSlFXZG9D?=
 =?utf-8?B?RWllT2lvVU10Y0RkR3g5TFM5RVpDSlNjKzIxTWtFT2pzd1BGdWZEOGdjNFJ1?=
 =?utf-8?B?MlFrR0FzOXByQTYybXMvOU5scEppTm5wQWJJc0JqbGI4TkdtZU9Ua3VwcjhG?=
 =?utf-8?B?OUp6aWlWSG9KSGRzeUlmVWhyeTIvUmpLTHRBbzExMFJKeHZmS29idnRRanNY?=
 =?utf-8?B?bTg2UTFIZW02ay9sL2RpRFFWOGxrQmVDNkxFeGE0OU5Wc1NMWG9xRE5ad2pv?=
 =?utf-8?B?UEV2Yk1OSDdhN0ZhOUcwamRkZkhrV0xQQ2k5K2xBbDI5Q3B2SXNwSVFkc3Mx?=
 =?utf-8?B?T1h4VG1zTk5Gd0syZENYZXlFMkZqTVlTUEtTckhxSXM2a2dsdmVkQVo0YWtQ?=
 =?utf-8?B?d2R0cjQyTWdOVm9uaEh2ak5yRTV1SEdPSkd6U0xzR1JETEFVUzIwNUJkdUVE?=
 =?utf-8?B?R0QxdS93T3ZNb0JKSitmNmhvdm93ckRQSnpqdUQra0F1aERJa1U0OVZuS1N1?=
 =?utf-8?B?KzMzcDBVd2JGRWFsSXpQZ3JVd3dwb1UvaXVNRUxPaXBRZDZBNDBiSE8xdm9Y?=
 =?utf-8?B?UWNpQ0x1Tkh4T1R0akxRY09xNHVCazVQS01MOWZKNy83NlpTVWUvWHEraVJB?=
 =?utf-8?B?OWtXeUdYU1BKcWRIbGQ3QmlKdW1qRzhLQXRXbXMrSE5RbWwrMTBvTVQzeGpN?=
 =?utf-8?B?MlNrVVVnWFpxdzRCY2Zra291RzVOeWZ6R2pYbjVZc3lxblhUWWY1cG14MGxv?=
 =?utf-8?Q?6ZrNRpRFO6oWUZK2ZT84hr9kYGALgnCk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(42112799006)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEFqbDRwZGFHaFJvdDlzV0dUVWhiR2FSa2NGUU10Y1IvWFVQWmhsOEJuUUFk?=
 =?utf-8?B?MVFRU0JFdGt1YllUTFVHa0tTOGRJa0dMVlF5YldxWFhzMnFpeFAzOEFpT24y?=
 =?utf-8?B?dzBzbk5xUDNUYzk0bU9uOWQ0Vy9wMXNqV1R2S2hodVZMNWFQQ3dSd05PWGJW?=
 =?utf-8?B?dEExejdNSmxtbjIxV1d5NXI0TG5rYjkwZWRYVU1YQ3J4WkFMUGw2bXYvUVhU?=
 =?utf-8?B?NzJvNjYvSEVMc1dNdzVOR0ZwUFJTbnNEclBmZGRvVmZ2d1ZpUitMdVJDeEVN?=
 =?utf-8?B?cWNiYmVlRDAwNkRlNThSWkw2VDVqN2lmZEZkQXBhaHVjSTlTc2szVzk1SXE5?=
 =?utf-8?B?SVJKbERHMmtraFdpS01TT1JZZlQzdHZKMC9UWTA2dEV3WWJYN1VnRHhFWEJ1?=
 =?utf-8?B?NW9zL2xtK2RPZml1djM1Z2F5NHpaL01xbmxOZFU2NnR4WXZzbVZRUkEwWVdB?=
 =?utf-8?B?enM3ODJlZXpsUXk2U205TlhJVnI4aytGOVZkWkx0WHdKMGNIZVpsSXBkekdK?=
 =?utf-8?B?VWx3Znp0LzFDSGVNS2lhTWo2MVl1Y0VRWFMwZnJtRklxbXFWN24xRnJNRE9u?=
 =?utf-8?B?eUhRcytZRFhQbkZWcGFqZ0pDelQ4Skp6cE1wcEttZDNpRWNmU1Rlc25NYllO?=
 =?utf-8?B?cjM4ZzNQQUNCeXdlSHd1b21xa3BPMllPaFFFZXl3clZja1RsNUJLalg2ZXdN?=
 =?utf-8?B?a1BtQ09uQktFQkQrd2t4eU5Ba0pqYWt6ZzVrYm1YOTNPY1pRNmVWUkpWK1kx?=
 =?utf-8?B?VDIzeTZxS2xHU1ozZFhlOE9DSlNleFVsc1ZRbTFiMWNtTkhYdUNRQ1Z5TVh3?=
 =?utf-8?B?cDNEMHJwMS9CbmtRRzN6WjFOZDl6bnd0WlpNSk1aWUNnSklsdzZHUnBsR3F3?=
 =?utf-8?B?N3d5VkdaZ2UyZ3h5ME4rQlBKWTFhQkFJc21GQldhbjFzbTRtUUNOcnlvdmNZ?=
 =?utf-8?B?bHBHRDZDNVVRYnhsNGpVOW9raEtUMHlrTUJkOGxvQXdhZFFvd3BxVHoxNlJv?=
 =?utf-8?B?SWFrTmtHZ3dYODFoOTZWTXQzem1GNjV5U091WmxEN044ZkJ5ZzRTTVErbHdC?=
 =?utf-8?B?cVZGcHEwWmlaRFNIVU5HSURuUi8vYUp4Sk9hVEQvYmhRWERvMVRtOXNyQkVI?=
 =?utf-8?B?cUlndlhUalpJR2lWenN5bHZiMUljRGNIbFN6V1NQLzFTMWFJR0hlcFN6clBk?=
 =?utf-8?B?MUFmb2pxSVNtSGI1NmdWbXVENUh2N3l3Ky9Lc2wvMGxyNmwxRVpRcm5aRnlW?=
 =?utf-8?B?Q1MvNkZsbFJZREVDVm12OFJza1ZJeTZ3QVlBM3haZlIzNjkvd0pxcmpsQzRX?=
 =?utf-8?B?VFNNWTBRUFNxbUlQSm94VGpQOXBibXd0V2V1TU9lOGRrOFhIZ2VONjhBUnA4?=
 =?utf-8?B?eVFvS1VxOC9BbzkyWWVJWDZHbi9NQWNqMXdEd1RWZUNLZExkc3lZeW8zeFBW?=
 =?utf-8?B?NUZ4cXRKYVZvZ2JFOSswTFZXNElaemZGK08wR0owSjFUcXc5TlEyWE91aWpM?=
 =?utf-8?B?YUM4Q3Q2b0ZJSHFyeXRLd2g2dWQ4VkRMY1pJZzNQZ0t0aVVtQjBQS3hoamxF?=
 =?utf-8?B?R3BpS09iOXhaczkxakVyaGRscEVjOVNEUWxjUCtmbTE5TnE5eEdEMVIwanRN?=
 =?utf-8?B?NERYWVpjQ3VtNkFJTVZwMmViVGRLeU1VMnRuVEp0WHBNSHQyL0VEZ0g3RVJE?=
 =?utf-8?B?cjhobGhDaDZkV3FFMWVyRUFETGNhOXdXZzNPSis5L2MzT2tuT1NFSkNJM3F3?=
 =?utf-8?B?dWlqbG11eXM4SGRPQ1pmVGwvY3pRUHM4NXRJUkg1U2VNcHlpdmpid2lyMzlB?=
 =?utf-8?B?MjEzTjE4cElWS0JtUGwxZnRwSXVOZWorZDZQWHpURjhvUURnRW9PM1hhWTVn?=
 =?utf-8?B?VVZiMGpLWEJVLzg0bTZGeklNc09UdTl2WUlqMndZbHRyTzZ0YzZ1eDU0TFF0?=
 =?utf-8?B?ZmU1QUw0bjZUNXhmZTRCTGROclljSGxuUHdnVHRHeldiNVRGeVdnOGM3RXFD?=
 =?utf-8?B?NzZNRklrRjcydW5KcXVzMjVXcEp2c0NUUTRHTjg0dWVjb0NiaER3eHA1alF5?=
 =?utf-8?B?MkZVRXh5Q253cGRBTVpvMzh6T3FkNDUxdHJESnNCR1c2VjN6d2pDQkJtbERQ?=
 =?utf-8?B?TFAxWXp2Y3kwZWZ5QU9zNzhzZEIwTTNMdHZFRVdMR1dHRURubjJEMXB4azIy?=
 =?utf-8?B?OVI0MDZ2K05BdDBxUXpsenlKa1NjNE5vQXBSVGJsMlRrMjZ1RHVTc0JoNzZB?=
 =?utf-8?B?RW9SdHIxQVZaeWxsZU04aXkvUkNtTFYvbWx6b1lCN0tXZm80cWVOVzZrK2Vv?=
 =?utf-8?B?NzdzUGdXQ2trNlVMRnErMmc3bm9tbXJrTFJFY2JYRVp0dDJuMW5tUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b64b4f9-8dfd-4067-2d6e-08de4e78e523
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:43:48.5269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x11wqcFUhSAzlTpQoerZgds8UsZl5sys5d5G2y/r91PIMFhNHuy/c/LEUfoG2yFOh9vfC2hSwhN5sL8C0Of7rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6176
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

Hi Jason-JH,

On 1/7/2026 11:59 AM, Jason-JH Lin (林睿祥) wrote:
> Hi Karthik,
>
> On Wed, 2026-01-07 at 10:34 +0530, Karthik B S wrote:
>> Hi,
>>
>> On 1/6/2026 3:51 PM, Jason-JH Lin wrote:
>>> The red and green framebuffers were previously created only once at
>>> the beginning of the test. If the test runs on multiple outputs
>>> with
>>> different resolutions, the pre-created framebuffer's size might not
>>> match the mode of a subsequent output, causing the modeset to fail.
>> I see that the test is already creating fb's considering the max
>> width/height among of all the available outputs, so ideally this
>> issue
>> should not be hit. Are we seeing any actual failures which this patch
>> fixes or just doing this as a fail safe?
> Yes, I did hit the issue.
> Our first output has a resolution 3504x2190, while the second output,
> which supports HDCP, is 3840x2160, so the framebuffer is set to
> 3840x2190.
>
> Since out platform doesn't support scaling, atomic_check() returns (-
> ERANGE) when the framebuffer height needs to be scaled from 2190 to
> 2160, and the test fails.
Ideally it should be cropping and not invoke scaling, but yea as this 
test is not about cropping/scaling its better to simplify this test to 
avoid the failure.
>
>>> This patch moves the framebuffer creation logic inside the
>>> modeset_with_fb() function. This ensures that for every modeset
>>> operation, a new framebuffer is created with dimensions that
>>> perfectly match the current output's mode, preventing potential
>>> modeset failures on systems with multiple displays of varying
>>> resolutions.
>> If we indeed see the issue and go ahead with this patch, fb cleanups
>> need to be handled for the additional fb's created. Currently we are
>> doing fb cleanup only once at the end of the test.
>>
>> Also we need to remove the existing fb creation as it becomes
>> redundant
>> with this change?
> Yes, I definitely agree with this.
> However, I was worried that it would break other tests in
> kms_content_protection, so I didn't remove the existing fb creation.
>
> Since data.red and data.green are static global variables, Isimply
> called igt_create_color_fb() again to overwrite the original fb, but
> this could indeed cause the potential problem of gem_handle not being
> properly released.
Yea this is not recommended to overwrite the fb pointer as it will cause 
leaks.
>
> Do you know if I replaced the original create_fbs() to here, where
> should the original igt_remove_fb() be moved to?

I think test_fini() should be the right place to handle this.

Regards,
Karthik.B.S
>
> Regards,
> Jason-JH Lin
>
>> Regards,
>> Karthik.B.S
>>
