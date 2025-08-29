Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908A2CA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 18:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4479910EC21;
	Fri, 29 Aug 2025 18:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQPp+XRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147D410EC21
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756490748; x=1788026748;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=lYpco9Tb2Kd3nAmqWe9D437i50fRsWaxkdeVscby9u8=;
 b=HQPp+XRdx21XWeqWFMmzNCbM2yBASd9ElEaHnujQf/YLYVtYuDI8ibzI
 PX80foHNsYaNiFzSCI7k1I1LZmvtnMsY1iqDgtOGLS6r6TQuyjoEm0Ri1
 GlJ8cYsMdufDt99FrBoPjwcXS0sTfPRBweLD9n0+58HjryT+uwWMf0J9h
 QWkEE7YLf8P7F/pdRubjBWhVd2Tu0KcuIOy2IsZl/2ZV43X+s+UrZ/u3/
 O09e/ESxNCceHFIGWT/LGNotAEjqNmSm/ku4BfIAZP8W8B00DBjXySDkP
 VcR9d9jwL84MAahYUZmboO2NapTJWyP3ccdudcL2WzzOuInCv39sAWseM w==;
X-CSE-ConnectionGUID: ZSBFGyFBSfWE1+jcwscY2A==
X-CSE-MsgGUID: 63WUQak/TXmueCyljKpmmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58491171"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208,217";a="58491171"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 11:05:39 -0700
X-CSE-ConnectionGUID: ej2y9/TITka/JUQEDuscRg==
X-CSE-MsgGUID: FRMHf3rlS1Ox/De3FtPQ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
 d="scan'208,217";a="169736974"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 11:05:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 11:05:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 11:05:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.45)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 11:05:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIMKH3AT6wEJBIur7v8V6y+MD8Kwsu60jLxjlLQf0OdPMkEIrmxdv52LwvWyC35ZKmemgJf6Jr/wIZkw8ZmYbcB1UqRMMHcMq2FItH5fCtQUpd7ol9pKLJOMdTpBfjppFSrh6TCYJJkUyHNNTuIEOEiNzj9rYsS06lU0FK3NMVx96JTPijVWszw2uXq5vcNgQL2W6Gc2AA48wJ4DUXghoxlnOVM/Iimvc3yJ2WIbdF+tpCZux70xdB5O+p7m9KUjG9AwrzmGYxSqcT631EGG4l7riat8avcnlddYmKh0juSNTunfW00oj45Jk6NCbKLJyLzitq69A7p0AO8cW4VE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hG3y6GNJ0MMbnaFshI0DHvuetGrZ4pautdkrP7v+PUA=;
 b=gQoZcrz5/gsQDNAYxnjcNjHALpI73TjXl6vkkNn1JbSItlJuA9vlROMl2PH87U8QMsQGMDYDlwedzV9xAzxxRc4vi7lwMhCryV4wTG34dyuA6YVznM9fhkHAgu15nJqZRvFeLx0+K7XTLLkag2JPvCJr1077Sqh7RZ2xUUJr7699Qbx84FUaNy+SFg6ETC/VHX/0U13EbQx7rFlKEnTVeOMw8jFZd5qH2JlFLBIr5EW3bzWHOQ6uHKCmRbazWrZkjqhHHzksV2zSAvLFrP2u5iqu+yBizt20mX2imrPi17M1BB6mCJ6wbBbLeyFW0z1jw92kQd4jzZsEDqfWlICcOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CH2PR11MB8816.namprd11.prod.outlook.com (2603:10b6:610:285::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 18:05:28 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961%4]) with mapi id 15.20.9073.021; Fri, 29 Aug 2025
 18:05:28 +0000
Content-Type: multipart/alternative;
 boundary="------------068DoLC1O2S009VOtXqBXJoF"
Message-ID: <04379511-9381-4313-a09c-9a5a1e181975@intel.com>
Date: Fri, 29 Aug 2025 23:35:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v3] tests/intel/xe_pm: Enhance vram-d3cold-threshold test
 to verify VRAM self-refresh
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.poosa@intel.com>
References: <20250630051145.2572003-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20250630051145.2572003-2-sk.anirban@intel.com>
X-ClientProxiedBy: BM1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::16) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CH2PR11MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: 01396067-ef9e-488e-c9f1-08dde726a2a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHpIKy9CMUttTitGZVN3emZHdVZiOFp6MkUwUFVZOXc4VUVQVnZDcmNyZUxo?=
 =?utf-8?B?alZZblNLNjMvWTVneHpnenlML1pkUDg1NUllYTZhUndBZU9rU1lobHd2TFlt?=
 =?utf-8?B?REVmcEJEK2tzbmhJTGVYNTNiTmZTWkRmS29iMVJoeXEzSjVjQWFEZmg2VU15?=
 =?utf-8?B?K0V3WStNS2c4cTNzMzFyWFhrYUxKdDZZVDdXOW4zeW5pVkgxMC9PSVpWWWxv?=
 =?utf-8?B?NVM3RDNxcFlOMHl0Q0k5YjYrSXVpaDJ5aVgvQWlKMGIwRUVFZExkMGVSNGZE?=
 =?utf-8?B?eFltZzNqSGh2bTE0SVFZSW9YSmZPSFRzTFJoL2dvNjEzMDltZDlJRy83N1d1?=
 =?utf-8?B?SHhJc1Q3LzMybDdaTlMvb1VHQWRPREVoNWhtYUVLUDNXNFJzOGhlV2JRREpv?=
 =?utf-8?B?WEFLbWFha20rMjZ1QnRVOU9YbGpOeHZlT3dIL29CTlluelNKRWhhOTJTN3U3?=
 =?utf-8?B?d3VIdzladmR4eElUaWtIUTFmZzBEWEp5R3BNTUJXZ1VyLzdOUWtyRFVXQ1VX?=
 =?utf-8?B?dER0WjlMU2tndiszMkdwUG9FYkFDUjNKdklidkRXaHJoVXBXM3VraGcrUHNT?=
 =?utf-8?B?emVHRE1saWxueTNlNUFab21UMENqUEUvcXRtSUZ4NVhuREhwQXdjUWkwRzkx?=
 =?utf-8?B?Szd3bDRpdUptcGRIZzV3M1NqaVl5NUdxeVJsRlNFbi9wZmJ3Y2hSTE1uWWI2?=
 =?utf-8?B?NndBTmJxWVhTTkYyckxpalhxMUZVV3NuNGVjTDVUUXZ0RTRYbktZZ2xtZGY4?=
 =?utf-8?B?UGZER3VhMDRFRVJMVUpTcDEvcWlSeXVDTWc3NzJuSnIvSDQ1YkF5blcvdHRl?=
 =?utf-8?B?R2ZMc2NXUmxEUzJYZUR3a3ZFV0Y4MmQ3V1NKeDZFMHJWK3RQVVFhVThIOUFp?=
 =?utf-8?B?aTNGa0g1QnhnNzR6L2RIL3VPVXlzeDF2azloSjBTRXl3dFBoMXMzV2pRL2J3?=
 =?utf-8?B?M3ZaSDFZeTJDSjkrd09IdEVRdDNEc3JrakNHc0pHcHA2NVNuVzIzbDhOOFY0?=
 =?utf-8?B?U3dXS3FFUGRsaWNDWFA5eVVvRUZIaFRESHBleTh0WWR5eWRncFNFeWFXUkpZ?=
 =?utf-8?B?V3F5R0I3VTlxRWFIR0tidW1tR20xNG5acGZ0UHJVZWJPQk5Kem9taTdDOWhz?=
 =?utf-8?B?aGJTd3BTdFNkck1EaHM1amIzRjZSK1FadVlaYThKK1F3NGJtcVlJV2g3cENG?=
 =?utf-8?B?ekJaNTBHMFJEd3VIQmRjQUNjaGtCbjFadi9KQVZ5bEJKUXo2VVMyVmRwaDkr?=
 =?utf-8?B?MEt5S0hya3RCeDdEZUl0Qlc3dFRpRi9GWEY0bGZocGZsNEsyRDRtb1R0TGZq?=
 =?utf-8?B?QWhZRTd4MWl4Mjk4ZTJ3YUJjNmgvL3hnR0xZVHV6d21KcnBsT3BITWRkSmVF?=
 =?utf-8?B?ZjMySEV2aVVOclRlR2VUZE9UbCt4RUZGeHJsVUxTeDNzbmJYamZqT2ZMUFlF?=
 =?utf-8?B?R0VHUHJ1RFRyalIvZXBHQjRybVhkZmlJVGV2TVdIZTI2MERYb2toMG1CYlpI?=
 =?utf-8?B?RElmQS85bnNkUENMQ0ZoRG9XaWNSQjE5aTlWQmxEQTI0UkhLSi82WnF1bGlw?=
 =?utf-8?B?VUtMRXkyUGUzMGZ5TWQvQ1NNbUNDOEo3TEhOSUQvb0wrVlp6V1B4Z2phc1NE?=
 =?utf-8?B?eVVTRjNYbE1xZktuRGl6eDU5TFJPQjZINUhXVlliU292TTU0ckdoZXZ4ZHV4?=
 =?utf-8?B?YVRQL1p0ZDVnL3JPemRsYVJKUnBHbGV6TldxOEI3N1RSRHJOOHNNek5ESE00?=
 =?utf-8?B?VlN5ZGVheUx2RHVwQ29jREUvQk82MWZWaTc2VS9iOGxKL1FPOGxFbTNlK29E?=
 =?utf-8?Q?9/4y7xJQqtS6ffc3djIBLD9C7oxD48DhUF28A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFA3aFZjSEdhMkVZYldOb1JoaDNzSWZjYzN3Vm14dGtCR0kzRDkrZXY2QjlS?=
 =?utf-8?B?TklQaXRPM2NmZ3NIb3JWeXI3ajhya0doVWIvZkhNU0dGQ2lkMFFsV2g2T3Vj?=
 =?utf-8?B?eVhNN0lpUVlFd3QrcXAxNnFRL21GSGU5U1UyNllGamY3WGZEclZPVWlDZ2Jk?=
 =?utf-8?B?UFg4eTd3UWRyYzI4OVV2dGhJYWE1M0Uxc3RSWHVHZ0wvMllKeHNoZmtvZ3BF?=
 =?utf-8?B?c1JVdUNBZ2hjTEg2SE10Nm1TeEljb1VRUHNDSzlDNVRDek9CY3psZHFVQm9G?=
 =?utf-8?B?THdsZkhTSmJ0dEVyczMybHpuR2hZVEZBQ0FJUERRbnZEUzZmOUl0Y1lHeWhN?=
 =?utf-8?B?dThOamJoNnZRR0V4bGF4ekx3OUV0OVVTNDFwY1QrQTZEbUJjRDNpRi9aczlx?=
 =?utf-8?B?ZG9UMDNHK0phaVovUS9nR0ZaV0loOXdIbVRPUFVwWFN3VVRDWXp1MmxaVEdi?=
 =?utf-8?B?N0NtZWs1SnV5ay8wMVhDRklTaUJncUNOaXdmWW1DWjBPb1pOeHEydW1mbWx2?=
 =?utf-8?B?QkZzN004aS9ZTFkycFBtYnlFV1c4WUhnSEJPWEx5L05FZFlZNE1Xb2RKbGFF?=
 =?utf-8?B?MnZoMmVXZ2RiY20vSFBJV1BMU3BoUkM3ck1xQkt4alc2NEdMRy9yaUpKOXhs?=
 =?utf-8?B?UUZCL2dnSTZuQys1OXpCWko3M1dFazJZUFY4RUtaam5XTmRNWTc5Ny9pRlJL?=
 =?utf-8?B?d0twdk5wbUF4bkVKbno2b2djdVEyRitreVY1c3VlSlIzbVBhMS95UUJRVlFX?=
 =?utf-8?B?SXExSEJBSXhoWE9GTDlmMHgvcDRuVWxjcWJNbzdKdisydHBSMjUxNGx6bVhp?=
 =?utf-8?B?cFFDbVdpdi9HWXN4SmJRZVRxYU9TRWN1ZCtndTVqOURyc3NwZENxY1ZKUUg0?=
 =?utf-8?B?NFk1dG5VMFJyR0EzazMvc0lGdUJoUkZqNy9vTnkxekZLdWxndFpNK2RuYkpI?=
 =?utf-8?B?a01UWVBxMGpzM0c1R0FHNWlkN3p4dkMxelNyOEJQeHc1UXlEUFVjVFJtK0tX?=
 =?utf-8?B?VmVuc1kycDhreGpaWUw0R1IvWnV0SUFsTm1CaGRrKzFMU1kwUGNxdVFVdXIw?=
 =?utf-8?B?VmdvR1V3elFrcjZCUVFldDNQajQya0NzS3FYVWhYK0ZOVEFWVkJ1Skd0TUwr?=
 =?utf-8?B?K2dQSzVBcHlFdlVNdURzcmkzdStCZHAxckFHYTFOUlVlMnlNVndQbHpCUFFr?=
 =?utf-8?B?aHAxMGZXbzFlelp2bERhT21WTERkWVB2QmdLOVN0Q1FmQmoyUlZ3NDhvZFVW?=
 =?utf-8?B?cmdHYy8wbGh5eFNQSmxZMVk4ZkJETVMxYjAzLzlXaWMwL3VoTHFFMmJJUEdB?=
 =?utf-8?B?Mnc4TEtLYzc1akx0NWU5V0JwRnJrUDlVN2htdmhxMlVxU0t0OTR0Q3lnQVZs?=
 =?utf-8?B?YURXWDhwcXJPWkUwUU4ydmdkZ1lyNWthelMwQWpham1UcTNOZjZmNHp1Y3Ju?=
 =?utf-8?B?WllLNXJFYnNiTEVGTDZHRjM3L3N0Ym9ydkRhVnczNlEvZ0IxREppUnBBNUU4?=
 =?utf-8?B?WG9GbEdEZVFGN055SXBCUnFNUk85R0lVWEJSekw4bE5SUjdvSkNWZzVVYjV5?=
 =?utf-8?B?ZitGbGgrRnZTOXdxdTFxNFAyS0VVaGlyUWdHdHA1M3dHMG1pTncwckJyd3Ni?=
 =?utf-8?B?N0Roak1yRUpseTNpc3pXdUNHcGdJalNzZDVqbjlqUlBUNTcxSzJGeE1LZ05r?=
 =?utf-8?B?VXNSVjR3b3hMMDVIZ3VMZTNqQVJ1bmlORFlHVldlMkt3clArUERseW55bHEz?=
 =?utf-8?B?UmdtV1dySC9wMldhUFp6NW90dEhWTkN6ck5BTzZOeU9LYWdCbmJBd2RkS1dK?=
 =?utf-8?B?TzdlWEJsOEZmS1NCdWpjek5kTFZXdE51ZGlUb1ZVSnhCR3BuTXZwNTFKZVF6?=
 =?utf-8?B?MzBWT240bDNWODZkMFRhQ1JFSFQyYWRmSVptM2luSGFsRGpld0xxL0xXNW5E?=
 =?utf-8?B?QjdTVGdjVXp6RldEdVJZcWlES1MzQ2d0d25iWTErSkVPRnlLN21QRE5vdHBR?=
 =?utf-8?B?RE5oNDJ0UWVsMzJWZFQwSEZNamZDVmIrKzhEM0s5Q2ZYejREUlQ3TTFYMDhy?=
 =?utf-8?B?Y2h5dkpHT3dxU00xeGEwZjlOb2xmYldwVmJWYldnbFpDTFYyZWhjVTBoOXdK?=
 =?utf-8?B?QnovQmNpUytJeERGdEdVc0doTmNLZUVXL3gwekdrWFhzVzlpbjc2b2ovMk5V?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01396067-ef9e-488e-c9f1-08dde726a2a9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 18:05:28.4225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAJp62xcMGI1KoXbOE2pjEwIA/92moPGXLURNkiYqiRNUWAZJP1IxP3h6vP8jsxBQuLzi9Wdc/svsIQ8G9nkFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8816
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

--------------068DoLC1O2S009VOtXqBXJoF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anirban,

On 30-06-2025 10:41, Sk Anirban wrote:
> Update the vram-d3cold-threshold test to include validation of VRAM
> self-refresh (VRSR) functionality, by including checks for VRSR capability
> and ModS residency. The test now differentiates between D3Cold and D3Hot
> states based on VRAM self-refresh capability.
>
> v2: Buffer size reduced from 4K to 256 and 8 bytes (Karthik)
> v3: Update error message (Karthik)
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm.c | 49 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 7e9324eec..c9582d337 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -144,6 +144,27 @@ static void vram_d3cold_threshold_restore(int sig)
>   	close(fd);
>   }
>   
> +static uint64_t read_mods(device_t device)
It would be even better if you could use a generic function for reading 
the residencies.
Better to use "read_content_line" from the patch : 
https://patchwork.freedesktop.org/series/149731
> +{
> +	uint64_t mods_value;
> +	char buf[256];
> +	int dir, ret;
> +	char *mods_ptr;
> +
> +	dir = igt_debugfs_dir(device.fd_xe);
> +	igt_assert(dir >= 0);
> +	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));

Remove "gtidle", it no longer exists.

Thanks, Soham

> +	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
> +
> +	close(dir);
> +
> +	mods_ptr = strstr(buf, "Package ModS: ");
> +	if (mods_ptr)
> +		sscanf(mods_ptr, "Package ModS: %"PRIu64"\n", &mods_value);
> +
> +	return mods_value;
> +}
> +
>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>   {
>   	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
> @@ -561,10 +582,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>   	};
>   	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
>   	uint32_t bo, placement;
> +	int vrsr_capability = 0;
> +	uint64_t mods_value = 0;
> +	char buf[8];
> +	int dir, ret;
>   	bool active;
>   	void *map;
>   	int i;
>   
> +	dir = igt_debugfs_dir(device.fd_xe);
> +	igt_assert(dir >= 0);
> +
> +	ret = igt_debugfs_simple_read(dir, "vrsr_capable",
> +				      buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Debugfs vrsr_capable is not present.\n");
> +	close(dir);
> +
> +	if (strstr(buf, "true"))
> +		vrsr_capability = 1;
> +
>   	igt_require(xe_has_vram(device.fd_xe));
>   
>   	placement = vram_memory(device.fd_xe, 0);
> @@ -595,10 +631,21 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>   	munmap(map, SIZE);
>   	set_vram_d3cold_threshold(sysfs_fd, threshold);
>   
> +	if (vrsr_capability)
> +		mods_value = read_mods(device);
> +
>   	/* Setup D3Cold but card should be in D3hot */
>   	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
>   	sleep(1);
> -	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
> +	if (vrsr_capability) {
> +		igt_assert(in_d3(device, IGT_ACPI_D3Cold));
> +		mods_value = read_mods(device) - mods_value;
> +		igt_assert_f(mods_value > 0,
> +			     "GPU couldn't enter ModS!");
> +	} else {
> +		igt_assert(in_d3(device, IGT_ACPI_D3Hot));
> +	}
> +
>   	igt_assert(igt_pm_get_acpi_real_d_state(device.pci_root) == IGT_ACPI_D0);
>   	gem_close(device.fd_xe, bo);
>   
--------------068DoLC1O2S009VOtXqBXJoF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Anirban,</p>
    <div class="moz-cite-prefix">On 30-06-2025 10:41, Sk Anirban wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250630051145.2572003-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">Update the vram-d3cold-threshold test to include validation of VRAM
self-refresh (VRSR) functionality, by including checks for VRSR capability
and ModS residency. The test now differentiates between D3Cold and D3Hot
states based on VRAM self-refresh capability.

v2: Buffer size reduced from 4K to 256 and 8 bytes (Karthik)
v3: Update error message (Karthik)

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 tests/intel/xe_pm.c | 49 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 7e9324eec..c9582d337 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -144,6 +144,27 @@ static void vram_d3cold_threshold_restore(int sig)
 	close(fd);
 }
 
+static uint64_t read_mods(device_t device)</pre>
    </blockquote>
    It would be even better if you could use a generic function for
    reading the residencies.<br>
    Better to use &quot;<span class="cf0">read_content_line</span>&quot; from the
    patch :&nbsp;<span class="cf0"><a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/149731">https://patchwork.freedesktop.org/series/149731</a></span>
    <blockquote type="cite" cite="mid:20250630051145.2572003-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
+{
+	uint64_t mods_value;
+	char buf[256];
+	int dir, ret;
+	char *mods_ptr;
+
+	dir = igt_debugfs_dir(device.fd_xe);
+	igt_assert(dir &gt;= 0);
+	ret = igt_debugfs_simple_read(dir, &quot;gtidle/dgfx_pkg_residencies&quot;, buf, sizeof(buf));</pre>
    </blockquote>
    <p>Remove&nbsp;<span style="white-space: pre-wrap">&quot;gtidle&quot;, it no longer exists.</span></p>
    <p><span style="white-space: pre-wrap">Thanks,
Soham</span></p>
    <blockquote type="cite" cite="mid:20250630051145.2572003-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	igt_assert_f(ret &gt;= 0, &quot;Debugfs dgfx_pkg_residencies is not present.\n&quot;);
+
+	close(dir);
+
+	mods_ptr = strstr(buf, &quot;Package ModS: &quot;);
+	if (mods_ptr)
+		sscanf(mods_ptr, &quot;Package ModS: %&quot;PRIu64&quot;\n&quot;, &amp;mods_value);
+
+	return mods_value;
+}
+
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
 	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
@@ -561,10 +582,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	};
 	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
 	uint32_t bo, placement;
+	int vrsr_capability = 0;
+	uint64_t mods_value = 0;
+	char buf[8];
+	int dir, ret;
 	bool active;
 	void *map;
 	int i;
 
+	dir = igt_debugfs_dir(device.fd_xe);
+	igt_assert(dir &gt;= 0);
+
+	ret = igt_debugfs_simple_read(dir, &quot;vrsr_capable&quot;,
+				      buf, sizeof(buf));
+	igt_assert_f(ret &gt;= 0, &quot;Debugfs vrsr_capable is not present.\n&quot;);
+	close(dir);
+
+	if (strstr(buf, &quot;true&quot;))
+		vrsr_capability = 1;
+
 	igt_require(xe_has_vram(device.fd_xe));
 
 	placement = vram_memory(device.fd_xe, 0);
@@ -595,10 +631,21 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	munmap(map, SIZE);
 	set_vram_d3cold_threshold(sysfs_fd, threshold);
 
+	if (vrsr_capability)
+		mods_value = read_mods(device);
+
 	/* Setup D3Cold but card should be in D3hot */
 	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
 	sleep(1);
-	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
+	if (vrsr_capability) {
+		igt_assert(in_d3(device, IGT_ACPI_D3Cold));
+		mods_value = read_mods(device) - mods_value;
+		igt_assert_f(mods_value &gt; 0,
+			     &quot;GPU couldn't enter ModS!&quot;);
+	} else {
+		igt_assert(in_d3(device, IGT_ACPI_D3Hot));
+	}
+
 	igt_assert(igt_pm_get_acpi_real_d_state(device.pci_root) == IGT_ACPI_D0);
 	gem_close(device.fd_xe, bo);
 
</pre>
    </blockquote>
  </body>
</html>

--------------068DoLC1O2S009VOtXqBXJoF--
