Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79287D4415E
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 13:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9A010E638;
	Tue, 19 Nov 2024 13:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcXORxFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C42B10E638
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732023432; x=1763559432;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=5mmNDbw3kzb6CzCiFhhairaT7eBEiQoFtG3Kcol7tcM=;
 b=QcXORxFAV4MaaLfeiFW3Ytj7FweTnELiPjsdjdvP8ZZfWr/SCull2vxQ
 8mIEBz4Qd2dfui33FoZHlcurNASPe/6Zu0Il+rbZ95jQJMPU5qqo6xWJ0
 3Pwpcz0KFMN9f7jYWQuo/ZcBBkxtcuElWjyXN0sNC+gdF17WIFYfosX7J
 7nqJNo2brloFFj2YAkjpxfHDCLU9SmubgljR8EmVZMxF5UP+DyMAQWpY1
 p9w+PVbuEcRvs38tRi4W0FJq2BtumtH/fnSU0eJqTMUSyf/JJcLFgmpx8
 6W7n/XucuL/mWglSW85RxyxrIP1vx2weW4WH3LX+Mk7zelutqLRusWOxz w==;
X-CSE-ConnectionGUID: gE1PysehSRmvuA8swzVC/Q==
X-CSE-MsgGUID: henIPjHlSEqr/KUV0B0YIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32158095"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="32158095"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 05:37:12 -0800
X-CSE-ConnectionGUID: ss9iNTNLQPmXOOY+29uMQw==
X-CSE-MsgGUID: ZtPA/WbiT0GoubrLrAmskw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="120496615"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 05:37:12 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 05:37:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 05:37:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 05:37:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtOISK+JIXrAdXPfynggJ/3FZoNCdB179XcTLY0NHkZNlBl/Zom3EzekeM+OW4kpEYqzp1wgEN/icu3NJaF13714lUa+Y7MjHDoN9X6RoKuqYa2qknS3qbWjogqdQaKTyM9rbUdGaH6auaJmGUOZA639rXFVmQoOMJShXO/SDTPIraNPZwBEYgdLvfTAtjbJ8zKcnx9v287nyj/iIwxhtJ4Uk1gyNsdiY/fN97s8u21R7tiPaw5W8RcZQKopSi334H7vxgCkLDa3y6294hQPqna8VZGJWGGmVc3O8gNpP/8jlYwWRL4IWF98VLkOowh41T47o0ATHKSO3rFbdYB2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y889nFoIgUPAi6Kawh9K3PDTc0IHUf1jO4KjUeyi1SI=;
 b=KJNArOgGZ5dlKvf4yugfz6wxbry103T3vN7qgwL9jyW+yj9dFMNhcioUglSytdqy6Y19JcdQKlWQ7L6uhxBIByrMtsi31I+nKgaZ3jZnoLDvcuC6wZcUHBeZ1SMm2qJ+/3GMTneUCsydWWZB3Syw3w6P8Y3WhpnVGWGlCFbziM5g/YMIQP1DbMYm8iXIfsl5PGQ7EfBzY2rAiSnFJUE9iTSAJ6P151rxBoouKtytt6BaoJaGPmdclPG0fX7KZ790yzH9AzNP5RnPofx6SVK3zPrXJugqpr80fvuGLchGcXt/I9j+/DiA+N4X/sYqnqXcIcFS0AtLBB3UWMne48jlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ2PR11MB7671.namprd11.prod.outlook.com (2603:10b6:a03:4c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 13:37:02 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%5]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 13:37:02 +0000
Date: Tue, 19 Nov 2024 19:06:54 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: stop using KMOD_REMOVE_FORCE, again
Message-ID: <ZzyUdupwSLpq4jGL@bvivekan-mobl1>
References: <20241030234908.858018-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20241030234908.858018-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN2PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::19) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ2PR11MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb3a2ac-24e1-4b15-96e1-08dd089f3fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2RwWnM0UWUyYldGeGhUWmUzMStSazdtbm1VaUY5TWtTeEtkMWpkVkNkMEM2?=
 =?utf-8?B?cFo0Wm5rWEFNVW94d0dOYlo0N3VNSG9VVmttZytYT2J5S1B6YTJ5Mzh6NnJO?=
 =?utf-8?B?VDkvcjRwR0Z3c1pFRnBUNmxCM1E3aFFwRDArQUIreWFRTzNBdWJTc0UzUVRV?=
 =?utf-8?B?bzZYMTRuQ3BzZVV4a0VBcHhQRWtOS1NjcGpqVU1hQ3dLV2FrM2xTSStWM1VQ?=
 =?utf-8?B?SnNQazJqblB5WXF4bW1qbkFBNEZibDdEWUlwaTBqVk04QldLYU9TQk5xcUEx?=
 =?utf-8?B?YjZ6YThjMS9DR256eVhDVi9WZzM2NSsrRER1MUNOK3JUaVNnaWRhYXRBbnpo?=
 =?utf-8?B?NENzTS9telV3Ny95TVdZSUoweS9SYmxYUkp6b3pMUVc4UEtjbTJWZzBldHBI?=
 =?utf-8?B?a3pFSGcwVy9hdVZORmY4RDlDc3RWVWdaakpFbkVadFd1eUpoT0VicGxVbnJJ?=
 =?utf-8?B?aXluUkIyUDRaT0hJanl2Rk5pKzA1M002eGVGVzZiY240R1g1RmhTZG9yNDho?=
 =?utf-8?B?WDZ5ZWhONGFyVFRJbGJmOVp3VVZIRXcvcmgrbitFTitxemNodXR1R21KVnFH?=
 =?utf-8?B?T3NjVW8xakFiUGNobWRZdU5LOFBtRVJ2K1lkbHdOeXZ1RFg0MXF1Q0ZmQ1R5?=
 =?utf-8?B?MGY2eHcvRWFzVEFjWHBNdDVadmpkWFVHYW9OMFYwc09ZTjlybmpoSWF0OCtP?=
 =?utf-8?B?U2cyTTh4dzJuYjV6SGJiSmZ6L2FsRWFHSzRTczErWStrenBVWnVNQzhEeVlv?=
 =?utf-8?B?OStSclQzV0NJSEZJeStWbUNSYTdxSXVkZ3ZMb3d6ZjVPTFZ3TnFGU3dkWXRx?=
 =?utf-8?B?T3YvMnB6VGhCdncxUzVLdDFZaW5YUWtPZStGeEVFN3lGcVN4VktSWXozeDQr?=
 =?utf-8?B?dTUvZUppeGRvS0JDQ09hM213MzlwZm9Tb01rWGgrNWJLTXBrOUxNZjZ3TjNw?=
 =?utf-8?B?U09SR1d0MEZDUTMvRCs2bll3bGNnMVRRTHRZamxzNktCd3J0SGtmUElZbmpU?=
 =?utf-8?B?ZW5OSXAwaFNGSkU0K2RGZTJOeDFydWx2VlI2S2trN3JPZ0tWSXNkQ0tKV29L?=
 =?utf-8?B?Z1UrTktmTlJ6RDVYLzAxKzhTdFFmS0pOcFZiZzJJcGlrMUJsbnBMb2pyYi80?=
 =?utf-8?B?d2JzQWpmcTZNam96M2FrSU9Fa3R2bFEvMHFVWnFTUXdaYWxQVzY0NnRhaGRG?=
 =?utf-8?B?cGJ4L0tYNE5jcmNOMDFLRzZFenlFZWp5L2Y1SG9mNVJrT0xkOFpRMVk1ZUZK?=
 =?utf-8?B?MDR3aVRmWnZsT2R2Wlo1bVRCOGpZeHhnYVl6OVkyZElhNGpRKzE2MlFsaU1P?=
 =?utf-8?B?eEMwVFNDaDdML0oxT0g5SUNPclZFWklZVGtObnduV1liZFpyWkhNVGZjSDk5?=
 =?utf-8?B?STNtSGI0Y05kVlpOakM4RTdEdXo0b3JFMzhZNlJwS2lUdnQ5L3JSTjQ4ODhI?=
 =?utf-8?B?WjlnbGpVam5rcm5TOEptd1B1N1U4MldoaFRwbVN3MHZ4dFZEMFA1dmorS3U3?=
 =?utf-8?B?c0piNk5hZkdJZnRnV0VBVkFSM2RXRWRaRER2RW56aFI3UXgyWXFnYmt5dldp?=
 =?utf-8?B?Z285RzA1d0c4WlNINWovMjdPUjBDbTUwUTNXUlUwMHBlNG9ySGZ5b2lpMThS?=
 =?utf-8?B?MGVGSEQ5NjhIWE9raDBNY0tYbDB1RzVNajYvZnNZaUxiclRaWmRoQlJOdXVa?=
 =?utf-8?B?a3lEQzZQcE5WdS9BYTB5M1M3TDdhS3FCWldTYUZQbUcvck93QTdkOHFaS1pI?=
 =?utf-8?Q?VugupS867Zgq416263iV1vHlRxwEFv/eBnsYwyf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am5yUnV2UnZ3Q0ZJdlppUkFHRjduQWdWMjd0a3hOYndGZmRhN2p0dWo4K1RQ?=
 =?utf-8?B?Ujh0U1RoVVlvcWZwaUxJOWlmaFFSOGJOOFNRdjFMSkp6V2NOdnhMYkZpVnJv?=
 =?utf-8?B?cVE2NTZocThUd3FwbEY3ZU1TL2s5VEd2Q0lJSk9BOUFGY3lUbk5GNGgyRjhG?=
 =?utf-8?B?aHgxelkzOTR4aGpERVpaUVZ1SVB0ZHFnRVZyemlOdFBJY1A2VVFXSHVDVGtw?=
 =?utf-8?B?ak91SVRHU2hLYnBsVmlYalFiblJKbjNMOWpuZzVVaWxQajUwR0o3MEZkTnhV?=
 =?utf-8?B?elJKUHJ2eFRnaHN5MXNkVUpzTVpwc0ljZ2tpVERWY3d0cDlZSnRBcVRhTnJV?=
 =?utf-8?B?bEltTDB1K1N6Z2FuSlNSQ093aGxVSzV6cGtnTng1SVUwdU1aMVFsMzY5M0lz?=
 =?utf-8?B?MjRHYXJVcXJBRDJvV1pqVmFLMStXQXlVajlsb1FHY056dlhRV1g1VVlkMm9r?=
 =?utf-8?B?czhoRXpYbHdYMUQ0M2NWUzRjRklDakIxY3BZR3NiTFpaSkpCQVBLNmw4N1Bt?=
 =?utf-8?B?clJGTWFrYkJ3MllSZWlUSDI4THN5a1BneVhCbGhMMm9kenRWZnFBc2svMmU5?=
 =?utf-8?B?akt2anlCa2JoUjhXU1RiTytkTWQ5MW9Nck1UbUpOT2kzdUJuVnFxNE5NYW1Y?=
 =?utf-8?B?RldmUmdKcWNuQ1doUHhmYUE2RW9OTEJFT2lJQ0s5WWEvLzlmY0JsTGRqT21p?=
 =?utf-8?B?UmNoQjVGbkdwVEV5SjNVTlgrZG85Y1htbmM4WXd3MUFRTWQvT0tUdnU4WTA5?=
 =?utf-8?B?ZEFzUVN5SG9QMXVVcjRBa3h1WkU3U2FwZDJLV2hOcDc2SEFpaUxyZUphSisz?=
 =?utf-8?B?ak45MnNudTFrQU02dkp0TlRkVWpMSkhZVXlaakF1L3hieEszZDNqZWhPUmFi?=
 =?utf-8?B?ZTF4dmcyTkpZOU02SEQzcXdIOVRoOGJNekR3REJDVTJkSWVaQ0dCRml6a1Ur?=
 =?utf-8?B?aWJuaHZMaDdDdngvcnhSWDFqUlhEQkk3elp2ajRqaWpReSt1K0pGNytuVk55?=
 =?utf-8?B?ano2QmtXd0cySy9vTEdLTlNBSGQ3bGxaWXpMQ3d0bU9HMFFXTXhvVnZuQ3Q1?=
 =?utf-8?B?dmFaR0NGdUNLU21UUzlmN1JaL054UXQreGJTRmNRdmN2aFJrbWRMZkloTFp2?=
 =?utf-8?B?aUVsL3hGWVk4T2cwK0RBK2Q5Vm5lNkxHMWZjRzEreUhmWEFwL1FsdVY1QVBt?=
 =?utf-8?B?T1NZTERZeGd5bXhTTkRoRkxicW43U0ovV0ViQUNlcWdvNXdDV3lIQkJBaUF3?=
 =?utf-8?B?aEJ5T0JjbmZCSzhiejBGcThWSHBmeVdjTFV4VkNKakJZbEZ0YlQ4bVhBOHdE?=
 =?utf-8?B?NDFzdkJSRG5MaCtIaWRzVHFYM2U4dmxXUVBOWFNCOEtsalZJLzVVRlRtdE54?=
 =?utf-8?B?MGx1cTdRbHdkV3RRaThKSkRmYTZ5OCttemplRXB6UlgzOGdXcUNEWDBONUZK?=
 =?utf-8?B?elF3aUh1c2gyWGFiMEJSYy9TeENJMDFseXpFZzNoVkE5L0drTDFvbnZhWWpt?=
 =?utf-8?B?Um1zY0VYdVVSNWZ2TnFTOFA0cFp5U3FOTHNtUUFFQkpWQjdTLzlQSzdSYWhs?=
 =?utf-8?B?c281MzdWUjBPTVNXd3N4WW1OVkpqUzBlWVRzSjhvVVpxc28vbVZZZWRKaWFa?=
 =?utf-8?B?blRiU2h0VnZYMjgyN1BvZ3R5dzdhOFNvWDZIUzU3c0I4U05seE1Ra3RVQjEv?=
 =?utf-8?B?WFJldzdISmEwRmptVUJXVGNoK0wveWYxQVRISHZjU1hVYmdBTE9uRHpWOFZl?=
 =?utf-8?B?L3dZSmFSZjhrdVdtL1NQWTVRL0hxam5xa1U2VVFFNkdwMm11eS8xVFUyM2lE?=
 =?utf-8?B?L1FSeHBEZmdrNTJYL21yV0lOdGlncWJkRFRKQWcza29LN3ZsajEvNG5hZEdS?=
 =?utf-8?B?Ulo2c2Y5aWR0aU8xdnAwRmhxSks5TmZBdVo3a3ZFRXBNVjlQZWZLNE0yS05u?=
 =?utf-8?B?U2hlTllVTWpKRnZXRDd6TWdSMjZLeEdtN0JIbzdUcSs0aUorWWhZbkZJbTBB?=
 =?utf-8?B?VU54UklmWEI3UjJUOVNLcUhiQkhXeUpYVjV2L0N6YjNZbUltcmtyK3VQR3VK?=
 =?utf-8?B?NTlOTXYxbHFDenRvbys2Z3gzS3FkWWF1VVRwTW5IY1NoWFJ5MmRJNUlFYlJL?=
 =?utf-8?B?NXRJbjZEU3paMG5LMXF0ZGkrOGtjYUliYjlvb2VDMHRDc1NVQWVPY2Nqb1Za?=
 =?utf-8?Q?AOr3XK1Fh0igRWhlwkEIlHc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb3a2ac-24e1-4b15-96e1-08dd089f3fe4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:37:02.2676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lErqFXO8bGleyR8oB70zjuHy9dS9p9Pg1IIL5wVp2n3mbQSGKMFmZ5jPGjBKa+nWNvvMmN00Js0hLtWCahQfilZN71CQsw91p+c3+x1gM4ZJTcYfm2jBUnwd7JEoT+1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7671
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

On 30.10.2024 16:49, Lucas De Marchi wrote:
> Just like done in commit 93ad5b785ea0 ("lib/igt_kmod: stop using
> KMOD_REMOVE_FORCE"). From igt perspective, if a module can't be removed,
> forcing its removal is not the right thing to do: the test should just
> fail and be fixed.
> 
> If the kernel actually enforces KMOD_REMOVE_FORCE, then it would just
> taint and all tests get aborted. Lastly, our kernel config doesn't have
> CONFIG_MODULE_FORCE_UNLOAD set, so this is pointless for multiple times.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_kmod.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 75a0d057c..cc3e5e5b1 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1409,8 +1409,7 @@ static void __igt_kunit(struct igt_ktest *tst,
>  			char glob[1024];
>  			int i;
>  
> -			igt_skip_on(kmod_module_remove_module(tst->kmod,
> -							      KMOD_REMOVE_FORCE));
> +			igt_skip_on(kmod_module_remove_module(tst->kmod, 0));
>  			igt_skip_on(igt_kernel_tainted(&taints));
>  
>  			igt_assert_lt(snprintf(glob, sizeof(glob), "%s.%s",

Looks good.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> -- 
> 2.47.0
> 
