Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37EECD5BCB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 11:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6266B10E7F4;
	Thu, 13 Nov 2025 11:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVwYT/vN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAA410E7F4
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 11:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763034545; x=1794570545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=s4fNtLFYkTOJ72lx/LsTWZiVbV+WHU1u45ItfZoN1nA=;
 b=SVwYT/vN2iYWHb7qTUkZY7Le4qyf6k9r1ADMc65w/wGfYvfmNXO+iLzK
 L0oEzQguyZlhCnD9gtL5xFvmGdx9ih87/WhwRBAJgZWsFMts9Tmx52VhC
 QGoUlatC4c3BmbgSKX3tDjW+uQqVp3zxUweT8SecxSAO7/UP56ThZnFaF
 kGLacwHFUyAoTJJKEJTmEzFjswXXfzFs70TRNlogUi8XxcK7Ku2zM/Tzt
 j4ez6+ArN8w9Iz+Luv4KU33j+PnEWdWaSr3Wcmxa8za78lXZk4IZdC0ym
 BLtcwdXONOHpW73b1NiUPh2PbnbRillSgG/RAeNeQ+cB7pFLIr2M36CHR Q==;
X-CSE-ConnectionGUID: nDSSsJMCS1KDY5Gquy/pZA==
X-CSE-MsgGUID: mVx3jKCoQ2KoAxFAK38E0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82508854"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="82508854"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:49:04 -0800
X-CSE-ConnectionGUID: sQb8Kxp1ThWfoKKGs3Uw/g==
X-CSE-MsgGUID: SOKBX0bPSfC6xqAgaLCvVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194649037"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:49:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:49:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 03:49:03 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:49:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6+YLe2vHFi90dcPommblBwhTXymyXQk3O8Z8ymSBOLFCuW8VngGSO7UsC2kP2rHYVbv3be8FTLa/O0regICHRmXJBhkw9WKotrqa0mq6C9Y54TkPGNhwsSOqU2G4co3lrhU72PuN718BBGjsKmiiIfrNfrjdu29kt2wq566mJU82MUnx++nGsZ0qGHmxw3lHRr2ZfZILXzykCzpzyYRdDOj05vpsuH7ZTGO5zgzd5nuwf3IzxZ0b57hNVGI0hyLiz+6l/KelmyvjmeLwn4zWXzU/IatIBxl+yjrfgWxPAYly0IatusD1sd0xThPljDGWMYsK5GiRvM+xx3NRgctuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8qYNBvcjb7MaxyOhJ+CFzFfS8Z5YmAfOoYPJv+QsHg=;
 b=nQ52Zl4gkmoGmp1H9as+OK2uegrU0XCBFAsaZXxPBeWJNCy+65q0646V2Pcf0qEIPCaJkB6bE2oTAFTozDmwAt4oMxtohD41nj15okXMiYGw1QX2sCMEH2Ucz7Fh+PbfeGA+qu+tj1JzaxVgLealLw+K2jOoFT5pezHCmpwmBcrCacRjdGuVM/0dR3UggGrg1tCZrCwMcsozlE1myrv/QGjukzbKatCIk34TloKBQnOQRw3XlhE2KYBKZt5C4fj+ZtMF1Z/3T1w3gqFi1w4zQyOvtucG7aQQuEml/+IqK0S4DTWW3wO/u72HWl9S/XaHW/xDxv6wC81c0hLR5FH/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 11:48:59 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 11:48:59 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH v1 4/5] tests/intel/debugfs: Add tile-dir subtest for per-tile
 debugfs validation
Date: Thu, 13 Nov 2025 12:46:14 +0100
Message-ID: <20251113114615.3736269-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
References: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 79502d99-c980-418f-b028-08de22aaa24e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzVOdzNRWGpEYUo1S1JuTnRNcDJCNlU1cklrRXFMNHltT3BxOG00Sk1xMUp6?=
 =?utf-8?B?cDBYNTF1bUlvUkFteWtDZkc5V1BmTWtIdzBqdU5QL05VZURhaVFqVEhLbmhX?=
 =?utf-8?B?Rk1hTk03dGcrTGM3YTA3NjB4VDNWdVcwWlhPMWNiYUxiTis1VVE3M3ZuR0lv?=
 =?utf-8?B?TktXQTh1VHFWaVlrMTFnclRCTGx0L2Mvd1pIbXp4WVhxcUE4MDBYeHNyMDcr?=
 =?utf-8?B?YW96UzJ3OHJ6M0d2N0NPSVlCbzRFMU5aTmVxNks1NmtaeEJaS0E2MGFFZ0Z6?=
 =?utf-8?B?YUVnVEpyNVdXR09MSVpRQ0UrdURCVW9NR1VReXJTM0FLTENjOEJrTDhmRWt6?=
 =?utf-8?B?QVFyemZ4OFhxbUdSTisxdGhwN2pHYzA5RTUvNHU1ampoMUpoYStzcnFwS0xl?=
 =?utf-8?B?UTY2UGxnb0dzSGo5SE5abU1mR3BJNVZpZllibGlQOHVTSUkxNXAySmd6azJW?=
 =?utf-8?B?VFhtNTdRV05zRGgrcWJXVnJENFlhYmhYaHQyNjlPbmcrd0Q1MHkyQjJkMzBr?=
 =?utf-8?B?WWIwWWgwdlp6cmFJRnVjb0dwK0Z5MW5oTk95OUxXVnVIVWN0SW54WkhCckxs?=
 =?utf-8?B?aXlDRWZKNkxSd3lFdnA4c1ZXdUsxL21QdjJkbDhXNUhFUGNzeDRQYk5RdFhw?=
 =?utf-8?B?Z1BrL2NaUnFlYzY2bVB4eHluMFpGZzJCU0lwdGxDNnNYVHQ5MFpFZkVTV0FN?=
 =?utf-8?B?aExHdUhNNExlSDFobW56bVRlUGc3b0RwQ0VRdEcvYzNHK0JKOXN6QzFyZWwy?=
 =?utf-8?B?ZWtWZTdlRmc4ODlRSXV4VXpBaVdQbFloS0VmTm50K0VhalJMTWhBT2NaODli?=
 =?utf-8?B?elJ0QkxLNjg3ekFmU01wRU96Q0RodjVMaW1BRmpPTURCb0dSVit6bkFuZHlS?=
 =?utf-8?B?UklkR2kwLzhURXZ4MkhIR1ZMK1lkMXVXL3ZYM2IrTjl3SHQ5elVmNXQxdm1l?=
 =?utf-8?B?QmI5V3JJOGJnVGVMT1ducmlFUG52TnlkdDk2Y1hQbytPU2I4NFY2N3ZqWUNU?=
 =?utf-8?B?aDJaK0c1WmdrczRDeW8xOHNidFFySU94SzdrNk1QbWFpVHNZT3krNlpqZGFy?=
 =?utf-8?B?Z1RHWVBDbFZxTDVqeHZ3ZDRTOVdQZ0pUb0FUUGNscWZaekNCQlBXaUMzVXlk?=
 =?utf-8?B?aXFDbGtlWWdzK0R5emxIbnN0ZVVldWxOQkdnUWdNRW55dUxpcm9VdWU5YVhW?=
 =?utf-8?B?K2JnTThNbEZ2bTk2WXJLMUp2d1gvd2tIWVpMK20zMWNldU0yYlFiQ2Y3ZWhP?=
 =?utf-8?B?c21DRUh2VVJrclRnSlV5aWpJT05KWjlSVTdRdmg2L3pBczR1bU96MWJXMXVk?=
 =?utf-8?B?ZFNRNDI4aFYrRzN2dWhVWjJXbXZGc0J6WVErN1k1OVJQZ21pSXROOEtNMjc3?=
 =?utf-8?B?WklnWng2VDhHemJsbFVnWndISVNJUG5kQjJLaG5GSEpqeUpsM29SWUVPY3dM?=
 =?utf-8?B?SEJ5VW9OeUpMbVgxN3VFeHNUMFRxbVZiTlRaeUNNNkJyT2xSSDlUdSsvWjZP?=
 =?utf-8?B?dnp5RDVHUCtIaGJxV1NrMG9WQmpIYUFYMnVkUEY1WTBWVldvVFNvWUJkT3Bi?=
 =?utf-8?B?U29Pb3lpaktpN3Bvb2ltY0VGbEdZTklkb0xOU2tTN01reHo5b3F3d0tyMzJT?=
 =?utf-8?B?U3pCY2g4c3B5VWNVWkxDZmlLU2ZlVVUwZVFKY0NiVXJYQXhYaGxxaEZvcFVj?=
 =?utf-8?B?d1VMTndPSk9nVHBad25YTDVLam5IalRNT0I0dTdyRmVMRGpVcHZ5aVIxSTVT?=
 =?utf-8?B?RzdXWkN1ZUlTbDkxWllYQUFTSFVFVnRjWURBWXlWVHdkazJ3Wi9oVkU5alpo?=
 =?utf-8?B?bUdkNkMzbU4yRWJ4SkVJT0NmL2RKSTZTZjlUNjhzWS96OUZJaUxrMkNZS3R6?=
 =?utf-8?B?ZnpkWjhISkUwMmV3Y2hjZi9iczhWSFh4TzI5WlNPYm5md3ZIUXhaWEhMblJr?=
 =?utf-8?Q?i4lkIc0GCb5QktLDzdtWewXd7lmYgvSQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVBHWUZCL1U4SWVGK0lPVEdSeGp0TUVPRm1JekZPNTFDOWdSYmpBa2dsQ3U3?=
 =?utf-8?B?QzJkYUQwMHowQkFPTUFVcGQzcytDZExvQit3RGJseVd4ZmxpSFFLYTlndGh6?=
 =?utf-8?B?N0F1VlpTdzZ4MFRaQlE0dGlUTyt2Q0h5ZFlLcWJvTVBxTGVPK3o0SnovNVpR?=
 =?utf-8?B?NUhpcmpZREVlUFF2MS9DWFRNZ21xdVZ1K0xaSGRTZWFHWTlJdzdaTGhaTzZ6?=
 =?utf-8?B?UnRpenVWeno2SnNnczJhT29IUUZVb1BSdWI5Nkh1OE01LzIxSGVraUhKSE84?=
 =?utf-8?B?NU83SGU5cWlIbGlaeEduNFlMS3ZJQnlObm5ua3k4OHZJcVZLYUs3MitWN3pw?=
 =?utf-8?B?MGt5Y0IrVENWenl0dHY4WUVFWmt1YlFwS2RZcklPdXphbzBDRi9iazN3Z0s4?=
 =?utf-8?B?N1V1a3Q2V2RLNW54K3kweDhkT0kzZ29jQ3NwYzh0LzdMTkVXZEYxMEFBTDdZ?=
 =?utf-8?B?c2xjZkRhOU1mYndZUHFCRDNNYndNSTM3WGFuenlCb1dwbWRrN0tyMlBORUJW?=
 =?utf-8?B?clZUK3ZEQkhPYURsSkRUQVdlOHV2TzBwYzBOOXhlbHVjeGRNZVU2L1BRM3Fa?=
 =?utf-8?B?b0N2aE9jaHowVDVTd2wvUFdmajZENWdCWk53NE1aSlJWTjFhSEpHZWM4dmdr?=
 =?utf-8?B?OEc1ODRqbFhpUnkwVmUxZG1wUC9PcWkvMlNYNWM0bHUwMmxidzZXK3JWU29Q?=
 =?utf-8?B?clpjdVl4blZKUGNmWEJzMVNCWWRQNDlFMndNM0JZelpFTXRLWTBwQnZpZkhW?=
 =?utf-8?B?NGlRNmxBY1loY0F5Y3FaK0sySmhKY0JWU0dRUmpMb1FtcnZSenVHdEsya09Y?=
 =?utf-8?B?KzhKTXNjdGZJSlpjNWwrOHI0c2RLOFJVei8xZlNXdDBmMHRUZVJDL09NV093?=
 =?utf-8?B?V0lUK1lQK2pPY2J6cnZkemJFOE9pRGVQQmJoTnhXWkhTYlRTeERUblRkenlO?=
 =?utf-8?B?OGV4WnlaVCt1VU9SWnROQ2JBUzlPWmVqbk9wRnY1Q2ZZcUNKb2ZuQ2Z3STA5?=
 =?utf-8?B?Y3VqdTNYcFFvaU9wcFkyOWNNSk5BN21NMGtRNkJmM2FuWjhBZHhJRGwvUmZt?=
 =?utf-8?B?NzcwSWl0QkdYellSd001bktIbXE1VmswMGg3QU1XRlNnRTI5VFVUSWVTeVpN?=
 =?utf-8?B?L0k3bEthek1LTzR3bnY1eFppQWZSS05wWEw3Sy94TlVzbGh3VXhlWkNja3FJ?=
 =?utf-8?B?L2hZeFJrYWtxRXVwVmRjaGZSb1VVQVVrRnNiNThZZHROUU5xMkhEQk1sSXAz?=
 =?utf-8?B?eDhaN0ZSWW5YYmkyQkxtTVd1dFFtaTdQbG51VEFPU1d3akN1QkdxMm40eHY5?=
 =?utf-8?B?M3lPTlNudURtdWp0WXNOandFUTg4VmNFSG8yNDdTclZEUGZYQ3lSQ2FQb1B4?=
 =?utf-8?B?Z09idXBDc0lySVVPeGNqTVBIVHVMVk5kcTg2N0hCdWdVbndZZE5IWStPeDMw?=
 =?utf-8?B?RU92azB0K0tJeEZCY0hJd3EzUW9yNzVGSmZwZUZuSUN5STNvMzh3TGpmMFhq?=
 =?utf-8?B?UVJuVWwxd0hQUHBFa2VVRnN4ckc3VFBHSUJRRmNSQmRCTEJXbGVHMXN3SVZ1?=
 =?utf-8?B?WXF5NWh1ZTNETExoU2FQNlRxaUZYZUhxc1hZZFJOdG8xaVoveVNScDBvaU1D?=
 =?utf-8?B?bXNzSE1GVG9adzBST0NBTnppaHNOeENOYm82MEErTTVabmxmUGJTREpNSlZk?=
 =?utf-8?B?WHhqZ0Z2ZFR2cExOY1NNcTEwY2RLNFBZUkl5R3Z0U3N3VTVmVjl2YkswTzNN?=
 =?utf-8?B?YWRINWdRbldsYkU4bXdrTmJSYmZURnZzWmNBd3pRL3BKRG5qUzFpOWtKSTF4?=
 =?utf-8?B?WS9obndDUWYxbUUwSFAxZGpJUFhtdmU0NWdpd1BSUFhwZVJNL0pTUTdBZFF0?=
 =?utf-8?B?aDZ0dG90YW1BMFlobFVTd01EZ0xES1IyRXBkcTR0TnRuNC9WMFZCRTh2Qm9n?=
 =?utf-8?B?S2RJMktsUkpRZytxSHIzd1JKUXZUYVNqaTlPMFZhRytWZmdSZTNmc1B1Qmhh?=
 =?utf-8?B?YU5ZS05IUjJHS1RJR2NXaGU4RW5DbFBGdDB0Wmw3K3Z1ZFFjRUpkQ2s0MXAx?=
 =?utf-8?B?OFFGZ0xhQkFFS0hZeXVqcVltRkxVZERXQk9EbndUSE1zN251eEtjTmFtVzlB?=
 =?utf-8?B?Zmh2U3BCeXgrVFR3QmI4QU4rRzhOek1YRm1tY2oxK0FXRFBIc2NIdExGM2M5?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79502d99-c980-418f-b028-08de22aaa24e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 11:48:59.7388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eTpBcwHPXcwrWQHX3JcRLoFJ2icReEHRX3G/x1jRxEuCukLoiGIj1HPfjDhUwkdl0q0MnErSGL9Hf2/0ub4cwtzAQB2Q0veBqE+K7IkmdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's add a dedicated subtest for tile-level debugfs validation.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_debugfs.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 2600880a7e..2824a48fa2 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -266,6 +266,35 @@ skip:
 	igt_skip("Failed to open debugfs directory\n");
 }
 
+/**
+ * SUBTEST: tile-dir
+ * Description: Check required debugfs devnodes exist in the tile debugfs directory
+ */
+static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
+{
+	const struct check_entry expected_files[] = {
+		{ "ggtt", O_RDONLY },
+		{ "sa_info", O_RDONLY },
+	};
+	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
+	int missing_count;
+
+	if (debugfs_fd < 0)
+		goto skip;
+
+	missing_count = debugfs_validate_entries(xe_dev, debugfs_fd, expected_files,
+						 ARRAY_SIZE(expected_files));
+
+	close(debugfs_fd);
+
+	igt_fail_on_f(missing_count > 0, "Found %d missing debugfs files (see warnings above)\n",
+		      missing_count);
+
+	return;
+skip:
+	igt_skip("Failed to open debugfs directory\n");
+}
+
 /**
  * SUBTEST: info-read
  * Description: Check info debugfs devnode contents
@@ -365,6 +394,7 @@ static int opt_handler(int option, int option_index, void *input)
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct xe_device *xe_dev;
+	unsigned int t;
 	int fd = -1;
 
 	igt_fixture {
@@ -378,6 +408,12 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_subtest("root-dir")
 		test_root_dir(xe_dev);
 
+	igt_describe("Check required debugfs devnodes exist in the tile debugfs directory.");
+	igt_subtest_with_dynamic("tile-dir")
+			xe_for_each_tile(fd, t)
+				igt_dynamic_f("tile-%d", t)
+					test_tile_dir(xe_dev, t);
+
 	igt_describe("Check info debugfs devnode contents.");
 	igt_subtest("info-read")
 		test_info_read(xe_dev);
-- 
2.34.1

