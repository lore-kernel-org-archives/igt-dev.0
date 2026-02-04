Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67A4E95374
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 10:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B99910E5C0;
	Wed,  4 Feb 2026 10:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RknZBi3V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8923C10E5C0
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770201654; x=1801737654;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YZGEkePorQMk0qUtnJPr4XIRjO1tnRScS2fuOahJxck=;
 b=RknZBi3VF/ccONggoKgcAVsHo8yMZsccX28ER2eqpnRp2ObZjGHKqVNJ
 F4Jnn3JjMKcmUwT3Kj9GnClqvv8oX85keC3ophf+JlGEPbK/6Oig8/exf
 5adhqIz9obnpJ7hW92udmDJNGEf117gSJ9L1Jkvwn6yaCQDkBaF4loncX
 4qWPRNq6SilfEGHdAZNqc+781SJWtBRPT+s2z6leMhJtlE6z4sulok18+
 MqVgkwvWLtswl38gmV7DGw8kQ9Zt4rhgsJwz3Ogc0U+O4Ahm+hZy4idw0
 s2FmLZfj1d50YR/YiPrgPo0EaJPD5lqF7WF1pOsPckG3YZiQyyuig47rb w==;
X-CSE-ConnectionGUID: 2FJ2DzYAR+mTowhX/fLCeg==
X-CSE-MsgGUID: gWmsL6nnS9OEcH8L4Jw05g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81699498"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="81699498"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:40:54 -0800
X-CSE-ConnectionGUID: BGl8ZudnTK2bwkFSP1V6xA==
X-CSE-MsgGUID: XAkcsMyARVKK9zyFG/1iNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214666055"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:40:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 02:40:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 02:40:53 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 02:40:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=by7jyaIQhz+o2jIPu5HDgyanV5CuHQBHnuL32K3kemBDDGyQOFOTySdO55DRkoWW3/adf4Jc0PfBgldY336X6TIk+osTrLXIb4waemd962nkyo9709XXXbZfNn5kg5OfjJMGk6G9sC/YFp/oTFPcmmxy0GqjhWicoR7Sv75HfnW9UJqKZXPJnHvkNx4QkFGkWs0GsfNG99mJgV/l0BMUafSknC7louOZUtGtheW9vlOKd+Gbk6rVrk/c2Q4Dyb0EFfM49QBHzOIdkqRix5opa+M+iNBfkKRYcU1fPswdwFUWgXZZIgHNlhRuastP1wR1yw0Qg9FCkRBQditwh6caGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IadEJcasRf8/H7bGP88Afm8JnuvcSb9Q4wA9QkRVWoQ=;
 b=VjlWGtAjO0qIIHgi2BQ1M38RRAfOy9PNGCVMs45CkX2Bkq/6y/Rz3Ef5LzBW+pdEDqQ31xo87WIfyoPG14ocbl9eOtTV3d63+ZBumMJnpoenng0Z7hgVltXLPqLKHGjSIKwGAgeWNIRpE55sfmBAjxbcG2zlGz29VMVxN+GtaFeyhyAe5jiOrT7TJ2QDkHTzODZDglR8ZQpdhPDiFpq7Lc1KN34xjC8ODxomS6igd4rvmctTbQkDz8MdieJMg7ntTxu0INlOvcYTGmBgvEQtKSJ6+iqAjWaEk0HxjSZ52H/4NxBoAQBwqXCNnTvfBId5FSjcjdMZ9tzDEOfJ+944PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Wed, 4 Feb
 2026 10:40:51 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 10:40:51 +0000
Message-ID: <3d6f8947-4066-4734-9cb8-b4173e72d5db@intel.com>
Date: Wed, 4 Feb 2026 16:10:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_plane: Skip unsupported modifiers
To: <igt-dev@lists.freedesktop.org>
References: <20260204083913.1048566-1-pranay.samala@intel.com>
 <20260204083913.1048566-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260204083913.1048566-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|MN2PR11MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: a10daa1e-4a8b-4361-2306-08de63d9dd64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0JSWVpNZFlNVkxrWFppSm5OMzAvcGMzUUJ1NVZobXFzTWpxT0pSSGlaSFln?=
 =?utf-8?B?K1NrZXRUZVo5aUQ3V0hsSVRsY0R2UVRjVWdZQ3hXdGl1TnV4c0wrTUhhb0wx?=
 =?utf-8?B?V3VieFZMSkJxZkFGb2oxWWtVUzUyemUyc092ajEvd3FLKyt1dWdRZXlSMHIr?=
 =?utf-8?B?Ti9oNkFTMmQ2Vlpwdk8xSHVNVStjeHYyb1FUM3NmTExGc3RkdGxnRVVQSC95?=
 =?utf-8?B?cUgvY21WbndCd1krWkhWQ1pZTjhETGVDcXpvdjlDaTBPV3BhVnIzZ2VDUHdo?=
 =?utf-8?B?M2RNeDMyRnJKaWlkbUUxR0R4M0NZQ2xGK1h1N1FFYmJzQnZ5SFF3U1JJeGsy?=
 =?utf-8?B?ZHRnTG1KaU8yOUYvWGFGUzNpOENMVVFHZ29SekVCajVCZXRUa2dEMU9laEpp?=
 =?utf-8?B?eGp4K3N0SjA2dktuQkMzekZJdWgzbHpMMFJ1MXFjNU1OK3ZkMlZndmR1bllG?=
 =?utf-8?B?cEtqTWZOVWNqVTdNamRQcGYrREpEWVoxREpIMHp2TVlEc213TG1jaFFiV0pK?=
 =?utf-8?B?dzRNYXZickNSSFVnYzYzMnMwRHIzcklvdmFyLzUvSDhRdXFuOWJYMmhEUlBh?=
 =?utf-8?B?ajRUYStMeUs5VWJCRHdFcyswMzZqRFlBV0NjbUNGRnBtN0sxckRBSHVvVTRL?=
 =?utf-8?B?QnFwWVY4NTh6bHRFcjZlaVAyb1FLYkV1QllLcUJXVGQ2VkhCa1ZobDUwMGVW?=
 =?utf-8?B?WTRsTTVBM3pxcFU3eUVVWEM5YkQzc3V2QnBlNWNtaDM4WlJQcXJLN3JrdmY4?=
 =?utf-8?B?VXA0UkU4YlkweVZOQmIyT21wS015TlJzRGZudUw4ZXViSFBTMlBJYWNiekpK?=
 =?utf-8?B?aXJ6MlJWUjVsWXFaUzRFajlHSy84ZWVhYnFIUlBtYUU3VUxCRUkrRUdoNXNm?=
 =?utf-8?B?TDlNMXd1NzFLYkQ4NGRwYXJVWnF5UGZ4THlUdEIwTitsQ2wrVURQL1RObGpw?=
 =?utf-8?B?SG1UWDV5SkRZZmpTdlkvREwvU1E5WVZKeWV3ZE5JU0FHTGlzaFNtc25CRnFa?=
 =?utf-8?B?OFFTQmM4N1BhdHRzNW9OeHg4cFVibDFaNTFUMnJsUnRKQTloNW53V2tMdFo3?=
 =?utf-8?B?b0NVUkJlamVRVmJIR0VLblU3enlSRnhtd1ppb1FYZWQ2NFJtOU13OEtyVWgv?=
 =?utf-8?B?RCs2VEJ6YUhCaHF5R2RlN25NREdwY09WNXVuWWxaSENvbmM5aE5GQ0lYVkhU?=
 =?utf-8?B?UXh2UUE1dnJITWFMRkVOcGVFa0tTbzNqemxUbHBCT1luWU9tV3RKWDhaTzFL?=
 =?utf-8?B?cVE4NHZOSGlFdzhrL1RjL09xYi9zT1IzK3oxMzgrMlFYM1FzdFhSbERKaVFk?=
 =?utf-8?B?bTVyYTZwUFFZYnZXRzZ4elQwb0xhMlJpQmNOcVR4MU5zQndsVEFpOFRjSHRL?=
 =?utf-8?B?elVRbUxJZFV3UDI3a2RGMUZlVFBtcVpocnl1aGc1WWd5bk1MekxVemt0WWM2?=
 =?utf-8?B?QWgyRkdUblcyQmREaXBhN1dwWFZkQk00dUlQdE14ZjJEWERyblNHdkNTSVNs?=
 =?utf-8?B?U3BHdERMeEhnNEZxZGMvSHZSUlk0UGxVU0FsWGpRVG02T244eE9XSXRZVWVQ?=
 =?utf-8?B?YzNmczg0ZVY5eEVmYzR5S3BSU25mK0llOUYyVTRtTE5OUHlhakdZU0c2ZzRX?=
 =?utf-8?B?TVNySDlFbGx0M1dLT2pnMXN4ekY5T0hDOTN3ZUp5azV3UTloYVBrZ1FiMkN4?=
 =?utf-8?B?ejVIcVhEcGRldmpza0hVSml3NVlYMDJJMW1aMWI5ajFYS3hkbFdJbjhqNm9Z?=
 =?utf-8?B?VmVZbGlta2pYOWNmV1M1c0MzS0ZzdG00MjdTNnE1aXFuLzRiMDIxVmpvUWZO?=
 =?utf-8?B?bVBCUHk2ZVVMOU5FTDdjSkNRZEZ6ZHJ0WWhHdlRyaVFBRkhUTFc2K3ZVb05K?=
 =?utf-8?B?N0srNmI1QjkvZnBmcGg1cGxGdm9NMTJmYmkvQ2hZV1ZwZEd4aCtxVTkxUnZ1?=
 =?utf-8?B?Rkl5RXZsaExjRFAwVFFCQUNLWXQ1OEQyL2w3aC8zdkdUUU9oSnV5WmhnemZj?=
 =?utf-8?B?VXZ5c2pmV2Mwb1FESm1pbmo3czh6YzlnK3o4NHkzd2dsaVJyWm10NDB5Y1dI?=
 =?utf-8?B?TlN4SHBEUS9YSmxoYkVlRjM4d0EwQ0l1RzViR3ZQU2c1NVpXcWlheFFLTjE0?=
 =?utf-8?Q?K4TU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUptc2hrdmlBcWo0bjV0d2VMcUxtaUI1WUxINFl5cXliWVBHVC96V0pSdEVL?=
 =?utf-8?B?RkYzemIySkdjSytCOG8rbXN3M1hwaTFpdnFpN2F4b1d1N1NIaVpnTFdLd2Qw?=
 =?utf-8?B?NWVRYzdNOFEzQkROKzZRcUE0TWRVWmF6RmtaWnlMSFRnS3piRlhrVG91SzhK?=
 =?utf-8?B?VFVmc054aCttYXZBdmNmVTFuRk1tREQ2QUlvbjFMa21nUkQ4WVRoN0kzU3Br?=
 =?utf-8?B?clRzbnd6T1ZUZTM3TTI1ZzRrSWlxejNmRXhRUWxUMVVCbDdKZWZvZVBzTW51?=
 =?utf-8?B?Z1BZbGxTRVVBZHllQjA1V3EwUWQ2UjRWYWJEOVJsdlBMK2dIb2FnM3JRQmhZ?=
 =?utf-8?B?YWFIcDh6ekphL3pqa2RSY3c5dUdYbG5BYlozSkdEQ2t1UTdkOXJMVnZVdXcr?=
 =?utf-8?B?czgzYm9CWDJvR1N1TndRcDhxOTRacDZJZHMwK0pKU2Z2YU1WRHMyZ3NJU0ZO?=
 =?utf-8?B?VGNndE9peXN2WkpQR0VYaDMvQS94WERoUkJhb29TTzQrVmxCVzgxbnBoRmFO?=
 =?utf-8?B?bE1lQ2ZmdTVEclpYMHZmblRlQW5lWjgwUENtWVFlaEg5UW9HQWV0aFIreXVl?=
 =?utf-8?B?WlNFOE1ENHJBZ3E2K2FtWncrVnJPeXk4WC9EeTJtOVRXSWh6dEFUOVRhaStq?=
 =?utf-8?B?WFJWMm9iNzFRRE1RWCsrV3pZejEzWWpmUmxNLzN2M2JnUmY5b1h1d283aTZB?=
 =?utf-8?B?WkdGcFptU3hROUJmMFhUZlJxZVBnZ0w3dTVJNXlsUitxZFZLK01TTjV3WG5X?=
 =?utf-8?B?cmFOK2Mya01xdlJrcGRJZ1EvYXJUbGoranpYQXQvOEVsZFRCQmJ5QXNRQm9v?=
 =?utf-8?B?YjRtdUZEbEpwR0N3QmNHVnE5MU95Qi9ISE4rOU4rQURva0RSZ0ZqUmhaUVA0?=
 =?utf-8?B?K3d3cDFxcE1abU1CMlJDMTBjY2JNS1VYZmNFSDBqVUV4Q2dMSTR2QW5XdERE?=
 =?utf-8?B?N0xhMC9IaHFvMk0rVUsyam9qVFZ1ekEyRE9PU3B0N2V6ZGYxeTJ6QllrTVdw?=
 =?utf-8?B?ZzIvdHVkaGxFZEJibjlncjNOUlhkTnpybHJRZzRzUExaZGQ0bGhFM3BYQkJL?=
 =?utf-8?B?dFRiSEk0Z1ZFUjQ3RUJlcmNRWXl6QWY1Rkp2blRhcjgyMU5iOUViVXh6ak9u?=
 =?utf-8?B?RFVVanFsU2Q0akVBRDZqb3FKNWlVcmV2dXlLM1hpZC9QUFZrd2pEdll3ZVNT?=
 =?utf-8?B?dXVyZjNtNFNsc1JxQWtYczJaREtucFViWUtROEk4c1M3ZHF3NlpYU0FpNEND?=
 =?utf-8?B?R2lJWWpJV0lBSytNQXkyemgyREJ4MHdDMldqVXp2UThkRkhsaEdoY1grN3FG?=
 =?utf-8?B?ajVIRjgzaEdNQ0VHRkJGdjZkWGkxNFEwNXEvaFNscFU2S2ZiUUFRa2N2MWhB?=
 =?utf-8?B?dUJjMjIyY2dPemYvdmE0SDFKTTBDTWhXT1N1R3h0ME1CQ25DeURSSUZNcC80?=
 =?utf-8?B?ZHRkTGFGREtLSkxhOCtwN1JIQXVqdnhWNmxhMnQ4Z2N1Nm5IWXllVlpyREhB?=
 =?utf-8?B?bXVwZlpDYm1GSlo1TUNPenlBRzJWUW1IYTJ5QVM5T2VKTkFiWk5PQnh3cGh0?=
 =?utf-8?B?a3lyWi9kTWZJcnFHajVKK055a2RGR0RYUnFFZXU2V0NHOTB2MzVZZEtBQWVz?=
 =?utf-8?B?REpDdkluNWg4WmJwMytqRGZheHQ4b3JPVzVwTnNWRzdCU0MralRWRVFsN1E4?=
 =?utf-8?B?enorNUlhU2t0Ri9QZkN6dW1RR05nVHVyYndERkVvSEp3N3I4YktJUjMyRlFY?=
 =?utf-8?B?NE81WEhmNjBJQW5mNlplaVNpTHRZTkFhWWlhdXJjOVhzRG53NTYzZEU3Q0lF?=
 =?utf-8?B?S1dWeWNKT1Q5WENHR0FscS9CWGxvdzhwZnZaZGlOdVg0MkJEMk5TTUljU1dS?=
 =?utf-8?B?VEhkazNUbWNHZGFGTFYxbDZNdzhmWmRZejRSNHErOE94NEFINW0vUXM5T3hP?=
 =?utf-8?B?ZGxXQW9ES2FyV2VvcU5WM05JZG1ORE1KZExBVnNTVnkwdzdRMkVVb0w2K1hw?=
 =?utf-8?B?TkxJdnJsc0JSdC90M29NQ0dDcGFFc0loVUlRWWxVZlF4eDdKbHErZ09TUkli?=
 =?utf-8?B?UjBzTTRPS1ducFZnUjlrRUdYWWM4eUlSdXY0VUI1N1hJendQNFI3a2NFa0tx?=
 =?utf-8?B?RDd2TWl0VUQrWjlhcVM4SlFPd3phVkU4bmZUelQ3a1VoSEVSMFRyNS9SSFow?=
 =?utf-8?B?emZtaWE4MklkUy9BcS9mc29PaUtYV1ZESkZ0ZDMvbm1kN3RMMUJxc2JaTS9a?=
 =?utf-8?B?U0V6R01DZEZsK01aL2ZkVGc5MmQxd1BPeW8yRkpDajhUMklJZTJQR1M0LzFv?=
 =?utf-8?B?dDJsVlY3MUxFVGxTQkZLYVF3NFFuNDlzUFJweXBEMXR2eTFBcTZQMzFkUU9W?=
 =?utf-8?Q?b9v+NcPm9XYFImXs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a10daa1e-4a8b-4361-2306-08de63d9dd64
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:40:51.3850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVudjWMrbDdHDiuSN2CrnKazBOOw9EtBIMTYSrTSnw1IXBHUGP6r4tY8jwPvaUBTOPTjh4CKLD4MN9RkNX4bjTbeVU/0wriY16qoe5Nkemo4kcKCOAFrlBaVq2NERVrk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
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

Hi Pranay,

On 04-02-2026 14:09, Pranay Samala wrote:
> Skip modifier subtests that are not supported.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_plane.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index a7b1bf25d..69d06d627 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1495,6 +1495,10 @@ run_tests_for_pipe_plane(data_t *data)
>   	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
>   		igt_describe("verify the pixel formats for given plane and pipe");
>   		igt_subtest_with_dynamic_f("pixel-format-%s-modifier", modifiers[i].str) {
> +			igt_require_f(igt_display_has_format_mod(&data->display,
> +								 DRM_FORMAT_XRGB8888,
> +								 modifiers[i].modifier),
> +								 "Modifier not supported\n");

This looks to be a redundant check here , as the same is handled in 
test_format_plane.

igt_skip_on_f(!found,
		      "Modifier " IGT_MODIFIER_FMT " not supported on plane %d\n",
		      IGT_MODIFIER_ARGS(data->mod), plane->index);

Thanks,
Santhosh

>   			data->mod = modifiers[i].modifier;
>   			run_test(data, test_pixel_formats);
>   		}
> @@ -1504,6 +1508,10 @@ run_tests_for_pipe_plane(data_t *data)
>   		igt_describe("verify the pixel formats for given plane and pipe with source clamping");
>   		igt_subtest_with_dynamic_f("pixel-format-%s-modifier-source-clamping",
>   					   modifiers[i].str) {
> +			igt_require_f(igt_display_has_format_mod(&data->display,
> +								 DRM_FORMAT_XRGB8888,
> +								 modifiers[i].modifier),
> +								 "Modifier not supported\n");
>   			data->mod = modifiers[i].modifier;
>   			data->crop = 4;
>   			run_test(data, test_pixel_formats);

