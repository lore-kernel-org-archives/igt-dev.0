Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80079C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 11:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4066710E1A2;
	Mon, 26 Aug 2024 11:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGGJjG2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FC910E1A2
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 11:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724670738; x=1756206738;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YPRIeyjkKCro6k9erUBsxpWF8OFUlULYBF7mEgpNUs4=;
 b=SGGJjG2elCiNuK5Tz3AlETuySX5/xpkT8dPqxUv6AasrcJDapgvzeSvE
 ymdRH4DirBU6A8Qf8S2VAXL+cDY9ZLp7TuGRNItXonYsvdfqC02ZU1KPn
 6svkikShPpky7bSuMa1GtGN+S8E7pWUAFxxwLLIK/WUKgMkm+qeiWamPT
 VrfSLaK8SehfYZRHgBT2IkeCGFxNbobTs4zV1oskwLX9VqwlfSScFfvI/
 R4JV17JB73rQ2PNfD2xVTrcEJn5avI/VjXoafMuvKvTTEngkqQ7wAKeFU
 4VHF5qHjd8kP133iJpiqUlC6+bE8pBneJWWqJ0Y5taLmutif/Mw4xMwat A==;
X-CSE-ConnectionGUID: Gv9m+AskROia1y6FjHK5og==
X-CSE-MsgGUID: BkMSGh/fTj6jBQ6yVTB3jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25977209"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="25977209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 04:12:18 -0700
X-CSE-ConnectionGUID: 3SJzDfKCSO+NQDo6goRt7Q==
X-CSE-MsgGUID: KoPCWFIJQEmbR61NZXA9CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="67173427"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 04:12:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 04:12:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 04:12:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 04:12:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 04:12:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTU66DdsQdBoKCBpMtEWSIBzFp9M/bZR/GNABZJGgRzuhXBgk9ltWl+LAwFa21we2SHeO92v7lA4ks4psXN2VlAZYP8cK51WYEAu3re0uddgyIXill8Uge+UVrH5zFbCIiNkMm8hsxShj/QBcG9ZFcavnO1acIY5iIBHB2ZjC3lkJD0etn1eAFFGcF7UtRBr88XFTuQk50CHyd/NmQFTu5vOgA+3Yi16YAHdsJONin1gfmCsfhqdw6QlFMF9zrYGpZeLt/gabRG8Sed4Lx0OaKh1lusei4ryzVjNJtqtD//zp58hMsCV1GOqMrfxFLMqwwM5sskHSKG7uonks+Hc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9n9RSJYxW9km51L9E2nqkEGet97N/BK5gkQzn3PorKI=;
 b=HHdnd/+1k2fB13pHxBM8SE5INFrLEqDA54wLyXaD2eC7X7BKjTZHcikieRkKI3ChwUe12E7ji8OV/hdP6NfISiKpVo86gLHOTCkyWd0+w6n8gemOISO/W33NPG7jlL8rKUNNxCpw7hC5U1JvQeHGauUnGYWuv7FlRpvTItZQBQuSiE7AENdS6zyBePYwZkDT1MbReSIdz73VvklX7Uec0BVm0OTbudjeL2Dz1/iHejgSDOnxVnlSvJkS8NwmNX9xma9BHhowTvSIeYW/xUY5bgmduLXxRi3wAijFmfcNWhXdSqcKOc8zua2iseptb9278Jg/7g3UTnaDFMbaHZH/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SN7PR11MB6560.namprd11.prod.outlook.com (2603:10b6:806:26c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 11:12:15 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 11:12:15 +0000
Message-ID: <d5cd630c-314c-4dde-9f4b-6a3e213f4587@intel.com>
Date: Mon, 26 Aug 2024 16:42:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend
 without display
To: Lucas De Marchi <lucas.demarchi@intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <katarzyna.piecielska@intel.com>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
 <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SN7PR11MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: b5aaca46-c1af-4c43-cba8-08dcc5bff0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDROdnBlUTZ5TFFFbk4rMnBuenE5aEFFbFJZWm40MXlKaHdCVk1uUUNsRmZr?=
 =?utf-8?B?b29oSTkyT0RBdUdjNGVJYmttS0p3TjNUNVlIQnczZzgwbDBOcDJXYjVhZGZI?=
 =?utf-8?B?NzZ3bmsrK2RITE5oRkJ1Uy9pQ0tSakJDOXcrYUNZcHM2ZHE5T2tQV210NVd4?=
 =?utf-8?B?SFgwaXRkeFZmbXpDM2RMVkdyRlRpbmdrT1paMUVDdXo0Y25UZUJCdU04dVRD?=
 =?utf-8?B?b3cxbU04OGdRWXBCVzdWRjlicFd5cGFaU01KU01hdzVQVit1cTMrclljRytO?=
 =?utf-8?B?UVBic1lZYTFlSFQ0dUdQWklaaVpUM0hxVENKU2UrZDBSU1pLZkNQY3F3WjZp?=
 =?utf-8?B?ZmRudFBQUFFtOVBTbDlIOFBvRU1VVjdFUTJpWmx0NGJWd0lyM1o2RzlzVDVR?=
 =?utf-8?B?ZnMvVVhiN1FyL0ovdzFEeWd0dVo4N1F4UE9mYWRObHR0TGJSQkdYWERFc2Zw?=
 =?utf-8?B?UngxdjNxUnZJeWR6Z3d1QXEzeFV1emVyampnSTNxTDVkYVJNVk9BUW1ZVE9a?=
 =?utf-8?B?VGFSMXNCeEMwaW1JR3dEMlBtUHhWZVVNcVd4RmFUZ3hVdEtoUkRLbW5IbkVD?=
 =?utf-8?B?TEU3QmpCN2k5TGFCa3l2UkdNR3dOMHRZOVd2QytPZGFnQ21xaThrV2FZTHgy?=
 =?utf-8?B?bE51N2lUUDAwSUpPVFozWFNkWGoyZmpQRE50UVJENFNib2o2Yk9ib1dFZ2or?=
 =?utf-8?B?eVJYZlZJR1FNLzQ5QTIxTVo2UnBkcjRoaWkwRGRzbEh3ejBWeWJJWVh5NmFG?=
 =?utf-8?B?cVdmR0JVR3dsV2hSVGNXUWhPcmxYdnJGVmVoQUhhV2hLMnhJN0xPYmtaTVI1?=
 =?utf-8?B?OEVqSk56ZXJNQnpKbWREZzNUdjhHbDQ2UlhCelY4YWZoZHN0STRGeTg1d1BZ?=
 =?utf-8?B?MXU1aEJic1BqSzV4bS9uTDdhdHZTZ2g1K09ka3pHYTlvc0V5UXRra0plUnlP?=
 =?utf-8?B?RTZsc3lMOWZpSjg3UzI2TFFwMXdkd2psWG9EK0hWa1lBT1ZvZkphR1pDUlRC?=
 =?utf-8?B?TjRtZEk1N0FlVmdKemZObTVKUmdOZURlRjRNcE8vYlJGeVhNQVlaZHU2Wndm?=
 =?utf-8?B?ZlI2VUE0dGdQTzQzeUJYM1dBMXZ3MkNFOXZTZGVkYWFmaGxhT0FGbWw3L0xU?=
 =?utf-8?B?Q3B4ODk0YUk2TExkZTlZWkptd2IycGlGL2d3OURVS0dQYU5iUzczK0J5emQ5?=
 =?utf-8?B?aUdvaCt4RmJzR0s4TWpIR1J4SE44VnR6dTJxWE5NVThpSzBXNW9vWnNGNWFF?=
 =?utf-8?B?VnBKS1FkWlZBYkNndEhIeUowK0x5cUtpUkRUdnlCcmVZeHBzbjA5d01sbExh?=
 =?utf-8?B?cjFTNWlHRXFJaEMxekVlZ3ZNV0Rud0MzRkxIM0xVMU9KNDBIUGNKUmk2VlJ6?=
 =?utf-8?B?M2Jwb0hwU0hDK3MwTnBVRG03T0hVRkthajJaQko2TDJ5akJYOVEzdWxLSFAx?=
 =?utf-8?B?cmpFTUVRVmdsU2pETmlOTjN2WHJPQnlScVlPUjdER05nVW1ZYU1yREZaSnlB?=
 =?utf-8?B?eXdIbHgwcEJET1VJTzVwRnRNTDcvVEJOZGZVUmpYS1dVWDdTcWRUZVlwS1RW?=
 =?utf-8?B?WG5RNVNoalVWNzFYNk1wZTJTL0xWZ0xFSnhPaFRiV3FTL0IvSnZjWmI0aXJE?=
 =?utf-8?B?Z3pXRWFsZlkwUjFFd1ZMV1hOeG9xK29IU3ExUHp1U2lrWm9uYURCVEYxd25R?=
 =?utf-8?B?YXFJcG90eWtHZDExYjFicWZIVGpoK0czWXJJblFRZVVOajdWVnM0OGtoMXhX?=
 =?utf-8?Q?c4EsETntL3nzApV0RM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2xxS2x5SGNQei9Ec1djZUhONWRNaVhXY1o5cGlPNDNueFROeU91QUh4NG84?=
 =?utf-8?B?M3ByRFZ0K3dBZEttRk1GclZaZGxOdDNlOGRoWlFIVVp3THpwNCtNZFBlREQ1?=
 =?utf-8?B?M29xdGRjWWNJNWVoWUg0R09pL3Awc1lVdzBnbGx3aEo2ZFBJVXJBVVVJTUlL?=
 =?utf-8?B?TWZOcHZXWGs5L3FKckg1eFF1bEYyc25maG8zaGRnMkZEUTFDTjVSK2hQSjNB?=
 =?utf-8?B?NkhPTHh4c1VLTHh4YVdhNDEzSWZKdlptc25ZVjRpTnhPYUh5Ym1tM2c4aytL?=
 =?utf-8?B?dHU0S2N1NEhaejJhemFmeENXT0NSLzBTL1VxSEVrV3NVNEpxOFk2SzdKSG9n?=
 =?utf-8?B?S2VwTzVOMjZhY1gxL0R3akRVcml5S090eXBaMDZaQnlkZnpGK1lneWphK2Qx?=
 =?utf-8?B?cCtkZytBS3RyRjQrMVdBTGRieUl1ZlRNU3lnT3JTTldVYm5VOGxRQktxTCtF?=
 =?utf-8?B?Q3Frejh1L0IxWFJoaWlTTk1EMDVWL3VaU0E5TTE3dDBnSTgrZ1I2Z01KanlE?=
 =?utf-8?B?aE52M2daOTl5bmY2SlJkaUpHZHR1Z3o4cnVoZkc3K3RHVDBocWhoaVN2MEcw?=
 =?utf-8?B?YkNjTEdGQ2Eya0VoREZqdnBTemR6R1hBMDNqYldiUENwOXZVeGpWNU5ZVm1w?=
 =?utf-8?B?dHUxM2kwellvU0cxNGVSVmNKVGd4RzRxVFlNTWh2ZHhiVUxyRUdYMWUzdGE0?=
 =?utf-8?B?Tm5LTHZpUk9USCt6Z3V6dGJ4VWY0NkI4UmZDKzBhVW0rai83YW5vZE1CZGZE?=
 =?utf-8?B?UW9yeGZLbE0vSEVwRUc4T2hpaWpITTJrSlRTQ0NuMFJrQ1g0c0pIb254bEQy?=
 =?utf-8?B?T1FDaU1EZlhRa05kZjZYTGdmdzVyMnhrL1crVUV2SE5UMVVHZEMxTmc4cmMw?=
 =?utf-8?B?VklSOHVpL2JkN2JWbjBTanpVdUttUEtMTFJYVWNpVC9XMGFUMjBJN2VIMVlZ?=
 =?utf-8?B?S2hIenR3dGJFckJVZzdMZ2RTNWpia1Vhc3NqWHNma1dNT3ZCazRTRThDOUw4?=
 =?utf-8?B?Mnk2c2tYQWd5N3V2c0o2U2ZCUlZlOXpTTlZDVkIvVUJ3SU85dVdyWTQ4VTNq?=
 =?utf-8?B?M0ExeTk3c1ZtSEhlL0RBUjRmRmRSanMraU5IK0ZFS3hrU2V1YWU4azR5VjF3?=
 =?utf-8?B?Y0t6TjhsSnZZZTRUd2tGSGNrZzk1SEN5UUVYSHpMeFJKT3hxMDdKcmR4Wk04?=
 =?utf-8?B?S1V2MHZqbER4bDlNR0JmRU5xcHpqdjdLS0lIVExqMG9XOVlsRk9VV1F2Y3l0?=
 =?utf-8?B?N2l5VXZuQm9tUjNMNUhGMXRoN3lNcUt3QmpkZGZ2bWlpdloyWldzdFFtZjJJ?=
 =?utf-8?B?UGlEYzYvYm16RGJGazZWdzE5NDQ0SVF4S0pPREp6RUJnMjlrRmNLMlR0YnhC?=
 =?utf-8?B?MGQ2RGJwT0hXSEVVUGREWDNqWThIdlRucExhL3o2dUZab3JVdUtBamM2LzZu?=
 =?utf-8?B?YkYvcSsrZmtmOHpPVlJ5SlJYcGR5dStsUEc3dit4cnkxQ28vT2RiM0I2NFEr?=
 =?utf-8?B?Mmw1WU9HREVBNUJRdU53MUNjQlVoN2RwdkhLTDFjTHJkODROVjViRDJVeS9z?=
 =?utf-8?B?NTR0WTBYZUxRNDJaZk9Ga3k0TThudFVPbGg3N0M5bnBhN2JxL1l4eEVBaHdx?=
 =?utf-8?B?ZjJNMkJWUVBOdEVmbGsweGV2MVJNamUrTVJRK2duNzdYVmlRNG9PUm1GT28y?=
 =?utf-8?B?U3J4eXVZN3FzNFplTmU1SENIU1gwc2N6TGxITEl5c2cvZ3BCUURrYURCcGt5?=
 =?utf-8?B?bFBQYzdIWlAzQUdhNXpNeDNwcDZrVWltVGxtOU9oRHBmTm9CTUc0c081Z3Z2?=
 =?utf-8?B?WDExQThkaHQyS2I2VDdNNXhSem5VZmt2b1pDYWVTcGIzcUUzcjRlU3g2cnll?=
 =?utf-8?B?aXFuTmt2amZHRUt6ekVrYzBTZUdvcS9uaUxnVmNEMHRYYU1zQzNQUHdKdFcy?=
 =?utf-8?B?WVRaWGlTOEtjS3U1N1dnK0cvalpobDJTbVlkTHR1MFVoWUZkZXlvMjVOTys3?=
 =?utf-8?B?cE9pY1Noek1pOUkxOWsxZTEvWDBRVlVVZWFmVm5qQURWTGF6dW53Q0E0cUxi?=
 =?utf-8?B?TGEwRW51SysvT1ZucHFBejNjZy9KUnA2ZDRRQ0JZbFlTbUdFR3Y5cnBRUDhq?=
 =?utf-8?B?QnhEeW1JWjNjQ05ZYVQ2V3gyZzJDK1l3L29WSmxTenVPbEZZdytGdFVtSmk0?=
 =?utf-8?Q?MJ9evPEA2CElgVH21tHLLvs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5aaca46-c1af-4c43-cba8-08dcc5bff0b2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 11:12:15.0577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3ZYXUf7Br4XCIVDOyAqD8g1fJ8DAt5cEjbP7IcwxugAvsxB0VUDA2WIiD/XhhbRtuBVahzWIBMG7uzoEvV+ruWJYTKMPoT+jiHHjm7iKnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6560
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


On 8/23/2024 2:31 AM, Lucas De Marchi wrote:
> On Thu, Aug 22, 2024 at 02:45:15PM GMT, Gustavo Sousa wrote:
>> Quoting Kamil Konieczny (2024-08-22 13:52:43-03:00)
>>> Hi Sujaritha,
>>> On 2024-08-22 at 14:50:58 +0530, Sujaritha Sundaresan wrote:
>>>> Add tests to validate basic execution suspend/resume cycle
>>>> without display module to rule out display related issues
>>>> from the suspend/resume stack.
>>>>
>>>> v2: Add normal reload cycle after running test (Anshuman)
>>>>
>>>> v3: Rebase
>>>>
>>>> v4: Change commit name/header (Kamil)
>>>>
>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>> Acked-by: Katarzyna Piecielska 
>>>> Katarzyna.piecielska@intel.com<Katarzyna.piecielska@intel.com>
>>>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>> ---
>>>>  tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 34 insertions(+)
>>>>
>>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>>>> index eee89428c..1623a56c7 100644
>>>> --- a/tests/intel/xe_pm.c
>>>> +++ b/tests/intel/xe_pm.c
>>>> @@ -17,6 +17,7 @@
>>>>
>>>>  #include "igt.h"
>>>>  #include "lib/igt_device.h"
>>>> +#include "lib/igt_kmod.h"
>>>>  #include "lib/igt_pm.h"
>>>>  #include "lib/igt_sysfs.h"
>>>>  #include "lib/igt_syncobj.h"
>>>> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>>>>   * Description: suspend/autoresume on %arg[1] state and exec after 
>>>> RPM
>>>>   * Functionality: pm - %arg[1]
>>>>   *
>>>> + * SUBTEST: %s-without-display
>>>> + * Description: suspend/autoresume on %arg[1] state without display
>>>> + * Functionality: pm - %arg[1]
>>>> + *
>>>>   * arg[1]:
>>>>   *
>>>>   * @s2idle:        s2idle
>>>> @@ -681,6 +686,7 @@ igt_main
>>>>          struct drm_xe_engine_class_instance *hwe;
>>>>          device_t device;
>>>>          uint32_t d3cold_allowed;
>>>> +        const char *opts;
>>>>          int sysfs_fd;
>>>>
>>>>          const struct s_state {
>>>> @@ -757,6 +763,34 @@ igt_main
>>>>                                            NO_RPM, 0);
>>>>                  }
>>>>
>>>> +                igt_subtest_f("%s-without-display", s->name) {
>>>> +
>>>> +                        if (!drmModeGetResources(device.fd_xe))
>>>> +                                return;
>>>
>>> This should be skip or save it (as global?) and run test on headless.
>>>
>>>> +
>>>> +                        xe_for_each_engine(device.fd_xe, hwe) {
>>>> +
>>>> +                                igt_debug("Reload w/o display\n");
>>>> +
>>>> +                                igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>>> + igt_assert_eq(igt_xe_driver_unload(), 0);
>>>> +
>>>> +                                igt_kmsg(KMSG_INFO "Re-loading Xe 
>>>> without display\n");
>>>> + igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
>>>
>>> This param was renamed to probe_display, see
>>> https://patchwork.freedesktop.org/series/137096/
>>> tests/intel/xe_module_load: Rename enable_display module param
>>> Submitted by Lucas De Marchi on Aug. 9, 2024, 5:30 p.m.
>>>
>>> +Cc Lucas
>>
>> And disable_display=1 might be more appropriate, because probe_display
>> would simply skip the probe for display?
>
> Good point. For platforms with display, is it expected that suspend works
> if DMC is not loaded? Otherwise we will actually have to touch display
> to disable it to be allowed to suspend.
>
> Lucas De Marchi

Hi all,

Thanks for all of the comments. The need for this test mostly stemmed from

ruling out display as being the reason for a lot of the random 
suspend/resume bugs we see.

So what do you think should be the approach for this?

Thanks,

Suja

