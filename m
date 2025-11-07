Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45517CCF9F8
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 11:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94DC10E09B;
	Fri,  7 Nov 2025 11:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCc5Skan";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A548110E09B
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762516626; x=1794052626;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HvmMC38KILG4ZH7Hs6/exaBnxbO2U3GCLGE5kRIoJfY=;
 b=aCc5SkanaYDLP4rfTEVDjBPpgTCTRtd2C15jV5bGove7rMwCDDAy2ARb
 2pwXv5LRdNl4pvvgdT4zR+88pFLarvcifFV49u+RTzW2nuafsE9AtZChz
 YJLyRNEgpELr3ygbRiArLUyfs/B98lHJahlEJFZ2CygGzK6cC9habX70h
 C3KRZlDG73WkcCQiYVabbcmaHR4Kmn6zicwhgh3kTIIHOOT+Ua9PZezqX
 JZy7B0GifJu/ogTe3KQqHj3FoUPrgRhHubKu82GXsy2PWZFdti/ekZfFD
 MWhM/KB2rskLqkjU6aT5627Y66+gT7on4d+wPVWirE9J2RCJKT3ALGEpt Q==;
X-CSE-ConnectionGUID: VwuUyP++T+u8JPhFPDYoAg==
X-CSE-MsgGUID: 7Sru9JUUR7CPDdNU+uvBRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="87296728"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="87296728"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:57:06 -0800
X-CSE-ConnectionGUID: icJObucWRcKdm+p4zDrzuw==
X-CSE-MsgGUID: v2zf6VsTTZijZ0ocpEvdTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="187677049"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:57:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 03:57:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 03:57:05 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 03:57:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qj01KliMKTYlry6THFryZAddLgm3JCPOjmyjEMTb+9NLKfovtcSyjKODXyIVQzowAobvFPl4IKSrVR/wuMPy47G6mcf5Ln5LokuK1MWAruRJVOV5M7IClgxzWb7eKI+1IqOnf5rKUWdKrmcK0byW6CRCWvtsdi1IxG/tyKD3auLlgn3z0QAMfQcSh5jZcZycjaNFfT8T4KGjB0uiHYJTN0TpnIFMic8mcO3EmCdSp4lqVjHA6TcS+xkv+zjxaKyScoGcTBJ5c4JAuFK++wiVYbomR3RvZv8e3D2g9WFBJYKRsJA4g+1lSZfqa8Qb8NbORLSnMchd+qV3J0RX43RHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKnoZAHP5iZbFQwp8xCrBld4taJw6zXZsfAvjClXTXw=;
 b=GdJCtXqVuOE05bG2OSiBVRdhKPZl9SIWxzUWa8a6Ydj0S0/9Muuc7BVRs5P2qrfU877Tgw5uSvqrEChpVvOVGykcrJycgZzg+HDs422WK8HIqZd9eRuPX3+BwpeT2l7ViQzDmQIdP3ba23ilbEFV7pQ6mX1e+xvPgfC/jeiWj2oHX8FytditIxsutE+56GJneSEiIZaBgBnF4ofbYd5Fd3ER4Uag38VlF8DWwrMK4Veu2XB003096143/ENP6xzoNZkvSLfBYbwrpX3JEr4T6DOEBUaAPop65dv+IEU/gWndXDzRio00jYJ68k23k8t2V7FpkClARICoUNH7GtHC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by MW3PR11MB4683.namprd11.prod.outlook.com (2603:10b6:303:5c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Fri, 7 Nov
 2025 11:57:03 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 11:57:03 +0000
Message-ID: <8cdb9b79-680c-4225-8a8c-f6936be56bcb@intel.com>
Date: Fri, 7 Nov 2025 17:26:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/3] lib: Add NVL-S support
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>,
 <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20251106153419.1741989-1-shekhar.chauhan@intel.com>
 <20251106153419.1741989-2-shekhar.chauhan@intel.com>
 <20251107003741.GF3905809@mdroper-desk1.amr.corp.intel.com>
 <14a45301-1e9d-4887-8939-07222239b766@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <14a45301-1e9d-4887-8939-07222239b766@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::7) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|MW3PR11MB4683:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1345be-c4b9-4b82-d3ee-08de1df4c3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2lFOXVRa1l4QTFRNTgyYmlYaFhzWHkrRUdJZVRtMk93UmFJMThEbC9oZ2Uz?=
 =?utf-8?B?TXRBcWhJTW1WcWRHdG5QNUpoaVRXV2pCVnpxMGZ0Rjg0YU5ROEYwNmYrTGZP?=
 =?utf-8?B?ejhnejkrWVhXditCWk9PcXdZQTZhZnBBL2thaUFDaU9HempWWE5RV3JITTRo?=
 =?utf-8?B?d21XUFRnVmZ0dHdqYkNhK1Mrd1ZQbyt2cThUcVNQRnk3L0JQTkNNQnZoNDZB?=
 =?utf-8?B?RjFFS01ZakY2U1VqWlNlTHZzNEowbGlxaVJzMnFuR0NYYWVOaENKMkhmeW8y?=
 =?utf-8?B?SlRLMFFvMVE0YUx2Qm1MWnlETERNOVllWkllMmF0NHY3UkpMdjJwZ3JvOWFh?=
 =?utf-8?B?ejVJaXZOaW5jUnlSV05ZYXF6NGJONDZaU0lBVlBOM21HQWZ2SjdFaTNKRUFv?=
 =?utf-8?B?czRoTmVmNUt2TTNEUHIyNXZ0NjVndkhzaGNOT2JmeVVxblpENDl1WDV4SmVX?=
 =?utf-8?B?OHpmMW44SDJhRXNsbCtTVVkvNzRBMXU4Y2VrSXcrNG45VEtvWWtxT3lBc2Fl?=
 =?utf-8?B?alRXYStTZlRuWXFidWg4OHhSVEFJVEw2SnRZWHlqbUNhWm9rN1JXYUxhUFlS?=
 =?utf-8?B?U1BpSzJ4QU50ZmpaYzl4Z3ZpcXR4MUMwMjBpL2xPSVRRRlJPd3MwRFpYV09M?=
 =?utf-8?B?VXlnTllEQWZST1lmQTZsRUlLdTJTNGZLMTFOUzg2MnFYcStQMDY1ZzNwcDhU?=
 =?utf-8?B?UGoyTENlL1RBenBUdTI4VjBUUXp0QlJBcm1XYURUd2JqUGVJdDR5SHlzVDJr?=
 =?utf-8?B?dktsTzdaUkNSZnplWTYwWDB5cDc4dUVyQytURXJSRTBVN2pzTjFxTGVlV1Qv?=
 =?utf-8?B?QTRYOW1YSmRRSzRqMU9DRDBtMjFmUzBrOGFKYWdyd01OV1NWSmpTY1UxSG9l?=
 =?utf-8?B?Mlg3aC96eDBqdlV0OE45MDYrQVZ5ZnQ4WFpTMlpDb0pHZU9UNVlqKzZIWGRD?=
 =?utf-8?B?ekFnM2RqTnoyYUhaQTc3YlByRG51aG5UMHNZbHdGVmVwQlFvN0NJbUdTS3FG?=
 =?utf-8?B?VkYwd0l1K2gzWFYyREY4RFVWMjd6WVZBcDVVNyt4ZEx3b1pXR2p1N0FNdm4v?=
 =?utf-8?B?bnRMS05jNzh4Wld6czgwemlhdFRHTXdkZ3h1eTBScHNFbjdoemxWOEo1M2VC?=
 =?utf-8?B?aGtQcW90ZGF1cjRGV2Z6S1lDcGVFaXNiZFpteUlMc0NSRzlaNXpGaVBnT1da?=
 =?utf-8?B?UFU2RHZIVnNiRW9ScUJGYXNCdDJScEhBaHJSRW95UytINTVRMkNpaHJuUFgx?=
 =?utf-8?B?MFM4c05QVEtsVTdmcWxqdWg4eVBMT0RzVlpYV0lCeEdLL1hPcXR2NThjUEV1?=
 =?utf-8?B?MzNrdkZKTWV5Z3EvUEk1UnR2cXJtYWFPYXRqcllWTVBZRmRteXUvVkxVeWda?=
 =?utf-8?B?TkJmajIzdnJQZDRXbXBGRzZTNU82cUdOd3VhQ0pFVGJkb1lhUi9td2szOVU2?=
 =?utf-8?B?cUFCMVk2YXJtaGpCeFJLTVBxTzNKeE9vT2JCMU9zak5acDBwa1ZHcjhiQnJC?=
 =?utf-8?B?K0tKZThsb1cvN2NSYzg2bVY1TkZ3cU96bUxDbC81Mlh1RHo0d2I2L0dUNG5Y?=
 =?utf-8?B?MW8zbmRocHh2VGZkektDVWdnTHRqVDFzbU0xdVpRQ0dXbmVDc0RuOUpSeVhT?=
 =?utf-8?B?amNpMEpoWVBmZ3djS0lXKyt2aXZ2TWVwUUtmVWpmajRZNnkwVHdSVTQ0TDlN?=
 =?utf-8?B?VGFCZjFEQm0rRDNKN1RPb3k5Q1J4MklIMGRUbWlVUmY3Z0hlaDgreDBkN1A1?=
 =?utf-8?B?cVdSTUpZRzJyK092QzBsN1BtZ0xIdWJHeHdDdEhxdldESHltUitKN1lBdytB?=
 =?utf-8?B?SFVKMWhEUXY4aVpXNis0MkhmcFJJcjR0aVhOd3Jaa3BOR1dVWXk5dWo3TU55?=
 =?utf-8?B?Zk9PYlpMYmwxVEdnS2p2dVp3aHNpcVJ1TFdJOWcxKzNMTGx6bVZjM1lPYkQ2?=
 =?utf-8?Q?mcvnd4BY05a0jBSZfOTpO8UjQjRLHh7Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFlReWN5UlNrdkhXcWhPb2x6TEFvcDVxM3NWaUNhaUxuVHVNWm15aDdnUTM1?=
 =?utf-8?B?ejJVcklVMVdycG9lZ0tRVnpkcG04NmZPc3RJV2Q2ZTZxeWpwMW5yTGx5bk5y?=
 =?utf-8?B?WnQzMzc1TmE2VUhJZGtRbFJhbU84MEpnK3dDcDRZbEdkRUpDMCtwRHFKQ0Mv?=
 =?utf-8?B?K3REdU1XK05LaDN3dXF6WWM2bjRQd3JxS2dMaFJxQkUvd3d6MU82bk9lM2JV?=
 =?utf-8?B?MDhBRU9tSkZXSG5IcU1Ddi84NjhON3pXOURaVjFyNUNrV2lDMU9TNXQzZjM4?=
 =?utf-8?B?THVCaU5zRzgrek9vd1BMR2dwZ1RPbXJBWnl0ZmFuTDRDaFdkNHo4Z29qMzFw?=
 =?utf-8?B?RHVIS2Z1c05KWnFNMDhPTTdtQmx1RC9GOFR4dnAxY2pQa0RLUjYvTnlUN0VP?=
 =?utf-8?B?L21sMysvZFU4aEE2aVZQRHhrSlplVStYaG01VmdUc3RzZDdvRlhXTW4vdHJq?=
 =?utf-8?B?UWlBd3dpNEg5bUR2aXJuMTloeXNiQUtRTkN4S1lBRDdYQXRhVVZYUEdJYlF3?=
 =?utf-8?B?MW9vb2VqSTQ3TzhkaENnOEFWYWx2SFp1V1JjZit5dUlPUkFlWDRZakFTYzAv?=
 =?utf-8?B?S0dONDJibHF2cHpoS1NCdUpQWis4d2UwRDJVemlBVFpCTnNlc3hCWUZyKzFK?=
 =?utf-8?B?R3hBeXBwTGRWUFlMczlKdUpzMzg1NWkySnR3Zk91U09FbWZINjd4emZnQ0Zx?=
 =?utf-8?B?ZHpQZEJ4NlpLdzV6WkdQcUpiZlpQeHpscmZjdDM4ZkxkaHJsNWV3MVJUZW52?=
 =?utf-8?B?ODU3cU5sZWJ0SEJEODlNMnFvalNjcjVFUFRRNnpnbHJMTS9ybXlLa3p2RStk?=
 =?utf-8?B?VGtVemlINmhkS1pJY2pJbTd1UHJTMFg4Sk1sNWpYTDlWUkxVUEhDam9FTHg0?=
 =?utf-8?B?OGR2ZGcramxLV2xVWnpjaFNPNnhtOVRSK2ZRV0VDU0tKdnAyTldibU5VU0VZ?=
 =?utf-8?B?ZzB1dlZ6Q0pFYkxydGJUb3MvRnVzbUlVZEpDSytvVmU3a1Z0enVjKzlkR1dj?=
 =?utf-8?B?V1gzSDZLWlJwdmc1OWNSRDMzM0VSTk1SMytWU0hEV1pkNVZvaXR4VGt6blo0?=
 =?utf-8?B?TlB2WFhFenB3SW5PS0dxbHJZeFJaU3pSbks0N0s3OXpKR0lrMm9zUlFSZUJt?=
 =?utf-8?B?d2ExRlhVTStMVzNOdFd4K0p6TUc1azJsRkZyWmROS0FNLzAzOHl1aktQUnBD?=
 =?utf-8?B?cjBsT0dUL3o3R2dYc0ZCOWtITGRlaDJFMkxDVGRZcVcvNmlMazVuYlNGSVNu?=
 =?utf-8?B?ZW9DaUFFNTZTWEk3czlPR292akxybTgvcTk5WmtjbUYrcGoxMU9tdy81ZzVN?=
 =?utf-8?B?d0ZsQm5ZcCtoUExyd2JGNGhxd085NzUwWFBXTGlxVFNEczJmZEJ5c0ZMSWtT?=
 =?utf-8?B?VlQ5SVhJVEkzdlR2Z29aODQ1UnhkUVR2SkxjQWR6MEQyWURZOTlveEwxTHNU?=
 =?utf-8?B?U2NqVjF2eWRFYU85V0YwU2RLR1lva1pMWnRPNXQ0SmpGSFd2NzZLblo2dVNU?=
 =?utf-8?B?cnhlb3pVd3NSb1VuQXpoQjFkS2J6VUpIR2VOZWw5VG9Va1A2MDdyUDRqMXBN?=
 =?utf-8?B?RTgzWXNsTHdHbHl1NEJpOGR4Y2NwSUQ4N0xINGcwSGsrMkJlb1JKTGVlcTlp?=
 =?utf-8?B?NDN1amNZUStuYnFySFNjb00xblZFeW5keHR1b1czQ3U5V3ByaUdmR2FxMVR5?=
 =?utf-8?B?YXVYeUJsVGdKNWk5NHVPMXhNYXJHSThwTzFaTDdWdWROVG1TamkzTHplWE5J?=
 =?utf-8?B?NEhocEFNTFRGTEp4d3Nmcm9lYXNQMTNSYlhUUTZjcmY5eDkyVG5Md1cwMVYv?=
 =?utf-8?B?ZWVWYk5zU0E4VXViUyttNlgyMzgvT3lKK05tSGtUdlMvRllPdUJKdTVVVElX?=
 =?utf-8?B?UXR2UFVNc1M5R044MnB5KzZWT1JEMzRSd2FZUTB6TXc4ZmpYeXUweVpnSjZX?=
 =?utf-8?B?bnZ0UDk1T0xkTklWRCtQVi9uaEFDS2l0ZTRrNHZ0RFlqMXpvT05FeEg2R0F4?=
 =?utf-8?B?dWZ6MndmYTdrT2ZoWmZUYThzbWFqbnpyait4R1A2WDVhdjhwZ2J1WXREYTNK?=
 =?utf-8?B?N1h3eWFIRTM0N0w2aXVKb0RTSElsbFVNc1BWWVplSUdQUGNUenF5R3lDVGIw?=
 =?utf-8?B?Y0xQSHh5NUtZQjVDS2J5TWNqTStuOWlucmZkUndnTmJ2L29ORXdKdnBHYWJR?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1345be-c4b9-4b82-d3ee-08de1df4c3d5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:57:03.1151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJPRoDxq/NO1RjZZ5H6WGpdRfBt8WqMG9RFZFV+LIIKCg1IRXvU0yauA6Hf6aRtiRy1teJje0E0wJL69w/MITg+mgv4RtKxY9cCwrmdYthU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4683
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


On 11/7/2025 16:37, Vodapalli, Ravi Kumar wrote:
>
>
> On 11/7/2025 6:07 AM, Matt Roper wrote:
>> On Thu, Nov 06, 2025 at 09:04:17PM +0530, Shekhar Chauhan wrote:
>>> Add NVL-S device info.
>>>
>>> v2: Fix indentation/spacing for PantherLake and Novalake in
>>> lib/intel_chipset.h (Kamil)
>>>
>>> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
>>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>> ---
>>>   lib/intel_chipset.h     |  4 +++-
>>>   lib/intel_device_info.c | 12 ++++++++++++
>>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
>>> index 2f6bf788a..70ea78464 100644
>>> --- a/lib/intel_chipset.h
>>> +++ b/lib/intel_chipset.h
>>> @@ -93,6 +93,7 @@ struct intel_device_info {
>>>       bool is_lunarlake : 1;
>>>       bool is_battlemage : 1;
>>>       bool is_pantherlake : 1;
>>> +    bool is_novalake: 1;
>>>         const struct intel_cmds_info *cmds_info;
>>>       const char *codename;
>>> @@ -209,7 +210,8 @@ void intel_check_pch(void);
>>>   #define IS_PONTEVECCHIO(devid) 
>>> (intel_get_device_info(devid)->is_pontevecchio)
>>>   #define IS_LUNARLAKE(devid) 
>>> (intel_get_device_info(devid)->is_lunarlake)
>>>   #define IS_BATTLEMAGE(devid) 
>>> (intel_get_device_info(devid)->is_battlemage)
>>> -#define IS_PANTHERLAKE(devid) 
>>> (intel_get_device_info(devid)->is_pantherlake)
>>> +#define IS_PANTHERLAKE(devid) 
>>> (intel_get_device_info(devid)->is_pantherlake)
>>> +#define IS_NOVALAKE(devid) (intel_get_device_info(devid)->is_novalake)
>>>     #define IS_GEN(devid, x) 
>>> (intel_get_device_info(devid)->graphics_ver == x)
>>>   diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
>>> index a853f9ab4..fe452d50f 100644
>>> --- a/lib/intel_device_info.c
>>> +++ b/lib/intel_device_info.c
>>> @@ -539,6 +539,16 @@ static const struct intel_device_info 
>>> intel_pantherlake_info = {
>>>       .cmds_info = &xe2_cmds_info,
>>>   };
>>>   +static const struct intel_device_info intel_novalake_info = {
>>> +    .graphics_ver = 30,
>>> +    .graphics_rel = 04,
>> It's not great that we keep on adding graphics version and release
>> numbers in IGT for new platforms.  That was supposed to stop with MTL,
>> but we keep making exceptions for "one more platform until we get around
>> to doing the cleanup."
>>
>> I know Xin, Ravi, and possibly other people have been working on the
>> necessary cleanup to get proper version numbers without ugly hacks like
>> this.  Is there any chance that some of their work can land soon so that
>> we can handle versioning properly?
>>
>>
>> Matt

Feedback acked but I've sent in a new revision without addressing it; as 
mentioned by Ravi below, that he'll finish his cleanup by next week and 
then send his patch over mine. The maintainers can now decide the 
appropriate step.

-shekhar

> Myself and Wang, X are working on it, by next week we will try to 
> complete it,
> Instead of waiting for this patch  shekhar can submit his patch, we 
> will submit our
> patch on top on it.
>
> Regards,
> Ravi Kumar
>>> +    .display_ver = 35,
>>> +    .has_4tile = true,
>>> +    .is_novalake = true,
>>> +    .codename = "novalake",
>>> +    .cmds_info = &xe2_cmds_info,
>>> +};
>>> +
>>>   #define INTEL_PCI_ID_INIT(_id, _info) { \
>>>       .vendor_id = 0x8086, .device_id = (_id), \
>>>       .subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
>>> @@ -657,6 +667,8 @@ static const struct pci_id_match 
>>> intel_device_match[] = {
>>>         INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
>>>   +    INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
>>> +
>>>       INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>>>   };
>>>   --
>>> 2.51.1
>>>
>
