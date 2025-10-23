Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA83ECCD1BC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 07:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C06B10E894;
	Thu, 23 Oct 2025 07:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSEours1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460D410E894
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761204527; x=1792740527;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AVsq4PYmKq4DQVbMIilVDP8EGZZMFrTgbj3RpqAJQHI=;
 b=FSEours12ubiXinEBBFR9qHBpL6NfIecAQOQEC2FLs+jIxixqNouPsQH
 q/mEVeMkfBxP8i4z8lr5CQUqFr1Mk5Rn2TBbB6knuIrxGLF1ZDXM/Wq9p
 OFSReAGnKM1KsvTy7stMLoWu1x8lTw+4CDCsXi/5rAglIrZNIgGUfbn4w
 1r85tSFwyD2hWlZy1Si/ca5SVBIEYwkRwiJ/GrydrHsDceWkkqz9GPrXs
 a9F7GLauilg/klz+rebNIi2R7r84dN0W2sxCi6e8/R62/Uv80ikVpDjIJ
 sl8LhECI+VHLqNmd1/DV3eQoKlbvgpQlFNwJdGrEAcJHRPFA7ZuQLg+x0 g==;
X-CSE-ConnectionGUID: L7t7DzmCQTm9TJ0HFJvVcA==
X-CSE-MsgGUID: Fz6C0KVKTzKYUX2mnOApSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67011071"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="67011071"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 00:28:46 -0700
X-CSE-ConnectionGUID: FVwQ0DIxRoaj3izosOwafQ==
X-CSE-MsgGUID: C9hP77kJQ4e5wLyQKp+TQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184015757"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 00:28:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 00:28:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 00:28:44 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 00:28:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLpDIH9ktr2yZgxwcJlpF2PplquMcn5mCIN3ufR6oI3NBIwZIoaP1E+VE3WYpa1YFptdH4LWjDjj2qRb1XL15JQaMTeUsofvvH3BWEVjlk49ONCK/3TAXI3PN/QOOAgph6vYep2wLn/31fYI8aSI1N+AvnEFwCDdx2INMh6Bbsd8/55sxB8mV9wLrpbh+fR+CAgq1VzYZOnzfJAEcWLnFBAb3O+uJooIUiPJ3UhCbUPu7RFV8iLxQDiJYCFAKRM/n1p//NEx4xB39VQkuE2Mzsv8O9lfqyzfH9szrccxmC1kR34kSoVbO5E96HzLixSDNPx/+zGbXTSaY0+3Tu4R7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXZ13pWzhsLepdxKKLLeUa1S+59g4tiK8a5Ul/VZtOw=;
 b=rmOmhXOA5XzQKR4iPb3uXayybPKZdl02MbKWkf2D+1QROps9PnhWs7wfDoPYOzJmQFXBvUZ+KbWrpnCvbDql25vyB39ggkKNhaoUlgM4xLtSEFT9Jfhv1Exwyo+vwT7l3bM0HI1PiuZq9NwXNq+O5fMaXDyWhWT1KLb69R5U3V2RMuqwZGrH+4oBQrFN2Kgh9yhI2FjZz+3AIPU0ZMdgapGdnJ+I4iEl+GyiA5R2PPvCZwS0FAy8fG+gscgK8Cfv4vIUW7+8qqT+jee+UZoh8HKMnsFbvN5UhpLgAiD7e5FvMSR+xNXNEX/U9six72T2kLAVHQ8nlSztsRavfA1ckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 07:28:43 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 07:28:43 +0000
Date: Thu, 23 Oct 2025 07:28:34 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v1 3/3] tests/core_getversion: Add new all-renders
 subtest
Message-ID: <4plddsev6mr6qp43a6lqvxo4b7mfy6ll6qfoqzwmccoac254dd@nll7lgzwimgq>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251020161846.156952-1-kamil.konieczny@linux.intel.com>
 <20251020161846.156952-4-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251020161846.156952-4-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: DUZPR01CA0302.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::19) To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|IA3PR11MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abd78ee-5710-4599-8fd4-08de1205cb82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVFPUmhqdVNQOGxISWQ2Z3lnZXhvS1VIS01Ray9ldEdMUDU4dHdUQTBKbFlj?=
 =?utf-8?B?UlFJRGF1RC9HK3IrVXV6bzJQM0t1TGtGeTBuakVsdm9tNyszM2tRdkt3akRa?=
 =?utf-8?B?MDhPN0xGVFFXWkxNa2F3dCtQdmh6Tm1hOGRyMVFlOHNDbExWVlROV2E1Q25q?=
 =?utf-8?B?TVhLTTNsTE1KS2pxTmIvRE9OcHdGeEVKQmxqcjJMUlpVQ2g2ZHkza2ZFTElQ?=
 =?utf-8?B?Q1U4RmdCVXRDSW11eTQvR1ZheWI1d0s0bFozbU9qVlBtVG5qeERqVHVQdCtx?=
 =?utf-8?B?L1VBblRLeTF2S0p4cUlITi9NS3VXUHhYS3VzYTN1MElySGFuMXVibHQxcHMw?=
 =?utf-8?B?VWFlWnlkTkhEREJzSS9SbkkxNDNLTHJiU3lXbHpTQlplaWZCTFIycjU1NkN0?=
 =?utf-8?B?aUR6TDNxQTQvQnBtT05tMnFxaGNGSEFLQUZqbHlLNGxCNWRQaGRMc3kwSndR?=
 =?utf-8?B?Z3d2cUZoZW50QXdyQmpnbmk0OTkzQ3Y4RENEWDRoWnJiR3N1ZUlpbEtYWHpM?=
 =?utf-8?B?ZFlkdkVEampiZEhjcDl6VnBoNFM2WTdOWEMxUVJNRk9zNG5jbVhOR1gzOTZJ?=
 =?utf-8?B?bng5MHRMckpoYUhrcGpuaW5tL3dGeGNldWRuYThnek1QRXhTOG5vMDFjL3VE?=
 =?utf-8?B?SEdES04yY1UrK1F6WDdQc2ZzMXUvRGJxTXJMNmpxb1IzVTNSREtaMDU5bnI5?=
 =?utf-8?B?d2t5MlQ5K0xhTjhwbkpCNnVJdDhSRDVKNTkwdit2cjlCLzBlWGMzY2Qyckxx?=
 =?utf-8?B?R0tzK20rUnF3RWVwdkxLTGUvSzVCQ0F5ZmVVeVhabGhCNXQyYk9EeVVwU2ZF?=
 =?utf-8?B?OEVxeThpY2pWNGxoN1pPSTMvaFBVa1JXR2hyRWYxTFhWY2NzeU1SKzJNMkc4?=
 =?utf-8?B?bHRWR056S1FXL2Y2NHN2MFZJMllEcWNucnZnUUQ0TkRPRzhsUUFHODFjWnEy?=
 =?utf-8?B?TDJVdFFkNFZuL21VVTNNZGdwMUZ3ZFJlQW53MW1tRTJ1dkJVTUEzUndQWUtC?=
 =?utf-8?B?WTNjZnJLVk13R2d6SmdDUzdaRHVaR3cyOVhHQys3R2xFM2NYbDhBK2QxdFYy?=
 =?utf-8?B?UDF3cm1IK1U2bXhPeDhoRkY0Z0ZIVkRmS1FWUUJ4aTdsWVdKcUVzNktBZE4x?=
 =?utf-8?B?MU9ZRk5VUUVhRUFYUXM4clZxM3B3bGFnRExyMytHbm1tMDk3a3p0T1ZuclZO?=
 =?utf-8?B?Y21yRlRnOEt2aWM4UHBzSE9MS04ySEQzcFdHWU9KSEtycTQ0VjJsUHZITW1S?=
 =?utf-8?B?Nm14MWF6RjVpMjhlTUdsY2N5dC92bENwNFo4M2lpS1RMUjltNGR5aDRmMjVh?=
 =?utf-8?B?Ti9vV0VwL2N0V0lNcldVWVJWQkdDZVNEU091aW01M1B6TmxXTkdjdGNnYit5?=
 =?utf-8?B?N0YyazEyRll2L1hIMzRxV1JhYmpORGRHdmNQc0I4WlVTZG5PMjZjbG9GRHlD?=
 =?utf-8?B?L0czSjVNL0lVMnFQc1kySmJrcTZTeUw3T1MzeUpBY2VvRlFDNm9DQ0hXZTY4?=
 =?utf-8?B?eWRCYzNIR1FhTVBXamFOTS8vSnd6TDFCU1dsOGxhRjhxU1h4WG9oTjhpUkYv?=
 =?utf-8?B?azdkalRaV3RaenFuYTErSDBEQktwRWV1Znk1andnRmQ5M01EVlZvWUszVTRE?=
 =?utf-8?B?ME9wNEhFMjBjTEh3VVp0ZmtFVStIc3loSWs2QTFjWFhyaWNvbTlXeEVGdjhL?=
 =?utf-8?B?ejFEWkUrQzZIMllDSkNaeUdncGM5WW4wYzBoRE1ob05LZFRnTDJDemZReEZn?=
 =?utf-8?B?Q2syS2JaL0FsTWhlQUx1bEIveml5RFBBdE9mZ3M4RTJKMFlhb09ITENjbmxL?=
 =?utf-8?B?NytySm9WRHZzSkVuU1JHK0lkQ3pSKy9aYnRRb3NRdGhaQVAvc1R6RFl0TzBt?=
 =?utf-8?B?aXljTkEvbENnempjM0E0Z0VtMTd0U2VXbDdhRjdpTjZyTkt6U1BYTmo3VDVo?=
 =?utf-8?Q?ihrrzcdo6Jh24SsWml+R28+0/J29aXdc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnNvYURabEdPVWY4WnNaREdldXhwcXluYmVXTzZ0NnEwRXlXMWRMbFdxMVdF?=
 =?utf-8?B?T1FsRnAyRG5PVVo1RExVV2NNSmFEYWNCOGl6dXhxcm9kM0ttZ0hwbFRGR2JS?=
 =?utf-8?B?OFhPZ2ViM01QcFdRNm1VY1BzV2ZtMFBVaHJ2bEVNYytvWVpGVkhzTi9yV25s?=
 =?utf-8?B?TUpEaGIvY1hLc1UwT1hZRnNyM01hbjlPRldjUlJvMWhjT0lDK1I0dnpYTFRN?=
 =?utf-8?B?cGJxOWNKV20vVEtjUnJYVE12UUZVZzJaa1crMXYrZmRydmsrMHowU1Vvc1Zi?=
 =?utf-8?B?NDRnR3pNUGJLVEQvejhrV25PT0IyOEo3Z3B6OHEvZGtjZ0NkS29RY0lPL21o?=
 =?utf-8?B?SGpTbVpHWVowN0JyMzczejNvU3lOQk1mcExYY3FQTWVoNFJvU0dHUjJnZ1Vo?=
 =?utf-8?B?NmVzN3dycmwyZExwTjlmVDBZVlgyenBOT25wa1ExQ1VLYlU3Slc3NkxDOW9Z?=
 =?utf-8?B?UlJ3NkNCb1BnRUR3d28xcFBMb3hZK3JvcE1taHordklLNXk1Nm5URTF6MzR4?=
 =?utf-8?B?SlJYTE02WHhYNG1BNEtzVTNLc3V2dkh4MmYxS0Q2eGovbGtsVGR0QS9sUEI4?=
 =?utf-8?B?TW91MHlCYjNCMVFXck0yR2VyVm5zWHlNaWdsUDk4NmtCQU52ZDhGR1BoMjk4?=
 =?utf-8?B?UUludFhCRVkxVW9hVE9QZXZLeEVSdHpzVDJOOFhYcWJKVHlWU0MyemRaR0Y1?=
 =?utf-8?B?OHhBUzhna2pNRXlyajdnZ1Nib1VsSUs0NUpINnZqNVpKUGRDSXpsS2R4SkxH?=
 =?utf-8?B?dXZsdE1KRS9LMFJUL2dzdHhpSHJ1VWNTeDhMb1N1RmlzUzlvK3hPd3JndXdR?=
 =?utf-8?B?ZVhFZDBmNmlLOGhLNUJpVmIzWUJHVWlRa2RjSHY1dEdnb1RsTkRGM01qQ0gr?=
 =?utf-8?B?SCtwVzA2cHVtbFFMWFowbFhDZ05WcFVqY3lFMWNraWF4Y25ta1ZLK01HSjJx?=
 =?utf-8?B?SEUxZ3c1eklqdXdzYWdpaFFUakFPV0ZuRTJ3bGozWkh6bXkzdHJ0akZhenhj?=
 =?utf-8?B?UTQvN3FKM1J3cFBMUDJ4VkhGVVVHZnNVaGtWcHlnRVJsSm1mSWQ4VlBTckRX?=
 =?utf-8?B?ejlWUmV1RWd6ZG1UZVJZdGJLZjFUNHQ4UHFYWWFyNndLQlg2REtwWXM1ZmVG?=
 =?utf-8?B?cmxncDVldlFMVTkyUVB1RW1FV0lnOC9oNDdmTzZ1RkRWMVNuZXkxNmNrN3Zm?=
 =?utf-8?B?Y3hJckRlV0Z1NE4vcVVjbDZoYW16RVNMYjRNMW9zeEROR3FSYThKblB4WlZF?=
 =?utf-8?B?N0QzNkU0Rk56WkNKYnR4UHBFdk41NVRmc3ZnWmdYODNMY2dlbXRQSENKMEJy?=
 =?utf-8?B?MDlrSFR1T2tBenFaaGZEQlVCMnF2YklZZ1p5em5oVk9yamZGVER6NWMvSERx?=
 =?utf-8?B?a1RHYU84OStrazNYZHNmZ3UrbEJHS1RoRytralFOcXdQMWlIblJuYTdPUUtj?=
 =?utf-8?B?QlVib1huR1pQcDJaY0Z2THIwQnYwQjZOMkRyWXBjRjQzV2xseXFMbTc0Mk0y?=
 =?utf-8?B?ZThjSlkxV2M0QkRoY3VITTArTXk1cnFpL1lXTmdEZ0xvcjZvU0QwVjA0V2xq?=
 =?utf-8?B?SUhVRmpHelQ1S2tnNEZQZmhCSksrZ1dUSUhwaEQ5bUVBa1piT0JnWFJGTlZ5?=
 =?utf-8?B?UzdaNmRIdWQybFhMOWRvRWFDN0Z6WExZTWprZTBNT1E4TWhFdW1SNmhDKzRU?=
 =?utf-8?B?MmJkem1tNU1DYnpGTlJCWU1BK01BNk4vRHhUZnc2d1krbEo3YkdTdS9yOGZk?=
 =?utf-8?B?Ujh6ZnRlVzBrREJQY0ZtSGUvT1g1MTltTWluZkpwL1dVYk9yenhsRFg1NHM5?=
 =?utf-8?B?L0VqMkNxd1cxOW5vSFhDNHF2aE9LREJJNjhPT09VZU1VY1JWVkM2U3BYNzNi?=
 =?utf-8?B?azRjejJOSXBUSEJKNWkydExrUkZ2Z1RkRVdVaVgrNW9hV09qclVkKzBUSWZr?=
 =?utf-8?B?anJCd0ZUeDJNRFRUdVRlaklseXRtV0tqZVVQRlR5RWdXMzYvTHd3SzUrMFJM?=
 =?utf-8?B?ZThsTTNndTJRdzRDTjdzbkRMaUNrOXNkZnUzc3dUVDJHZjk2YlhGb2xWK2Iy?=
 =?utf-8?B?VlorZG5aUzc3NkI5YlRWRUt5Z2VIM2lTaWRBUnFHSE5SVzBtN0RJMXhmTSs3?=
 =?utf-8?B?Y21UU0RTMzhoZ2dSU0xOa0NyMzA0TFYwamJOS2Z0MFJwNUVnNFEzTmo2SHE5?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abd78ee-5710-4599-8fd4-08de1205cb82
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 07:28:43.2698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lUNhyH2e5hoWwV4N9ZuNjl1DtPMcrcwktxxpccr75vgteNZWtOGdIMLEEr72YzLCPZY8ngimEL2HHI14ZlPbqtV/hDf9mt9RsfHu4aoZPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8986
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

Hi Kamil,

On 2025-10-20 at 18:18:46 +0200, Kamil Konieczny wrote:
> Create a new subtest for renders in dri folder.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_getversion.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 32378f985..834d25430 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -43,6 +43,9 @@
>   *
>   * SUBTEST: all-cards
>   * Description: Tests GET_VERSION ioctl for all drm devices.
> + *
> + * SUBTEST: all-renders
> + * Description: Tests GET_VERSION ioctl for all drm render devices.
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
> @@ -65,7 +68,7 @@ static void check(int fd, char *dst, int len)
>  	drmFree(v);
>  }
>  
> -static void check_all_drm(void)
> +static void check_all_drm(int flag)
>  {
>  	char info[256];
>  	int checked;
> @@ -73,7 +76,7 @@ static void check_all_drm(void)
>  
>  	checked = 0;
>  	for (int i = 0; ; i++) {
> -		fd2 = __drm_open_dri_card(i);
> +		fd2 = flag ? __drm_open_dri_card(i) : __drm_open_dri_render(i);
This flag accepts anything in the int range, which may be
confusing if this function is ever used in more than one place
- people may start passing any number to indicate that
__drm_open_dri_card() should be used. Maybe adding
"#define USE_DRI_RENDER 1" and passing that would better show
the intent of this parameter?
I suggeseted RENDER, because to me it is more specific than
CARD, but "#define USE_DRI_CARD 1" would work too.

>  		if (fd2 == -1)
>  			continue;
>  
> @@ -86,7 +89,7 @@ static void check_all_drm(void)
>  		drm_close_driver(fd2);
>  	}
>  
> -	igt_info("Checked %d cards\n", checked);
> +	igt_info("Checked %d %s\n", checked, flag ? "cards" : "renders");
>  }
>  
>  igt_main
> @@ -105,5 +108,9 @@ igt_main
>  
>  	igt_describe("Check GET_VERSION ioctl for all drm devices.");
>  	igt_subtest("all-cards")
> -		check_all_drm();
> +		check_all_drm(1);
> +
> +	igt_describe("Check GET_VERSION ioctl for all drm render devices.");
> +	igt_subtest("all-renders")
> +		check_all_drm(0);
>  }
> -- 
> 2.51.1
> 

-- 
Best Regards,
Krzysztof
