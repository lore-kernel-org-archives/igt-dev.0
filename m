Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6DDEA7942
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 18:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7728D10E364;
	Wed,  4 Feb 2026 18:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NUciBfFy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F64610E364
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 18:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770229809; x=1801765809;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TFfGVvD3+oeYnlXIkuk3A8rdlU+qgskI5V/0kDPDSvA=;
 b=NUciBfFyNYYlzHEaZ6u1lXoNy5/6vnzP3lvJ13CaMFr5NfT5cSc14BzK
 4Pl8sOBef5XmKg/DAnnXJMg8aCpG4nkbjq0R6IadGgkVnC9DtwJOVLFSc
 z4/LP6kLpNRznGU3rgS/PQgwLNvrA/eJuuct/Mh4QZYnE4JGzCo4zTzF7
 wWSvQChqaypXDz3TTI4vK3q0KxU7rkYFlZaZ0I7N6y1kdIq+0/t0E2FaX
 QR97A5ORXOxg39NCJimFqZaNjLyjyexJ9jigBTY08CPrbuDJ4lwHAm1gU
 W7Ah4P51Cobug89StIN++X8aEx9xQT99f962Moa0f0VRfEQbykvEDlRoU Q==;
X-CSE-ConnectionGUID: h40f++oWQjmRPPEx6k4+Sw==
X-CSE-MsgGUID: PU8asIoqQAeWSmosrotTTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71592951"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71592951"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:30:09 -0800
X-CSE-ConnectionGUID: ZR0adiI4S3uhthmFq/QNNA==
X-CSE-MsgGUID: UIaagrlNR/WysR3UM3XAOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="209529948"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:30:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:30:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 10:30:07 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:30:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5T7uoso3iAhj3t1iitmT0qINO3iKUzUJSsWWUVMRITLSSdCMrCO3OQZvl1wmpHLJs65EcuVqYl8lxbSTuea9H5s6EvVzAGi2RK1mMSTb1ZPAh/MJCo8Fu9ELdlKjTrtQCAiq6waDSKfVFpdpXGHpcPcrTVWwlNyA1Im5y0ZvuZVsDRN8yy0E/LgeE1sWKNqrgHFC44UZchF+jbVt37mv/6Mu/SELZLKqm7uy+FuWXKUw3z/gapFf5IRc8BSI81VPHpZwoR1LiWpCTHMgGol6qVLBiUjBF4AeVIDpuUXLipBvaDqTD1YtHFfXskF6JdTPIjJQJdJ9Jrk0QAss+Gglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRnnmdkHAgLC9Dq823xu6c1Y7pASDnH0ATObUV+z37A=;
 b=aCRvEhfM0vjbnePB8a7B/jeDmn9b1Bw4IUfNU603JNA3bxjxMDZ2qx67SHe78q33fnkDjM8eJeoCYN2ht0hodDwC8H4zXJAcFg8Rjm9krwF+cd/JHWegFj2lYKyPDk0t+J/oxFYYWy93ztYafxSISWI5PUDcrBOERQ1iFRnN/Eq+xLNeIBZ9dY3wV7VkkkKEx8hjmaLYaEVZwLtnpDSCtqwLKs8P7Bp6XqpJykFm4E1IDjvx7z6k8VwpvH9zj1mDaenGNeoh06iu0mgGuZRoWW809u8AeKmW5SQLlUdstvYjc82QHFWK22/SRArYPbNuj+DtEAKbapIbo/aKhN6QKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 18:30:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 18:30:05 +0000
Date: Wed, 4 Feb 2026 10:30:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Ravi Kumar V
 <ravi.kumar.vodapalli@intel.com>
Subject: Re: [PATCH v2 1/3] lib/intel: suffix PCI ID based gen/graphics_ver
 with _legacy
Message-ID: <20260204183003.GX458797@mdroper-desk1.amr.corp.intel.com>
References: <20260122071530.1629046-1-x.wang@intel.com>
 <20260122071530.1629046-2-x.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122071530.1629046-2-x.wang@intel.com>
X-ClientProxiedBy: BYAPR02CA0062.namprd02.prod.outlook.com
 (2603:10b6:a03:54::39) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e88d22b-8bfc-4cb1-864b-08de641b6af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXdXTVBvY29JRWM1OWYwaFhVU25qOHJrVE43ZGczeE8vYXNITlBVRDI3cVJs?=
 =?utf-8?B?Tjd4YmF2cU1meHRVWVg2b3A4RE5TdkVuU0ZaVWJHbyt3S3Z3UkVQbmtxbkFW?=
 =?utf-8?B?ZWdLOENNTy9zRjRVTElWYUFmU1BrK2FJY0tuZWtlc01zOHliNUw2b2dxaWtv?=
 =?utf-8?B?Q3ZSK1BCV29OTVo4MnVXcDJhREpmSE1CT2YzT29oczhxOFMrNGhsZ25GV0NL?=
 =?utf-8?B?VWtzMGhackNiTFZaSS84TUk4N2pQSkNrZGNXLzBUNGM4cEpkUXdTSStoOUhT?=
 =?utf-8?B?Y3JEVThTTjNsc2NmakNKTEJBYTJmcERwM0pZanpBSjQzVXliQklqSkhzcGVV?=
 =?utf-8?B?NWFVSmVrK3k0elhWTTRLQk95NGdDUzZKR1FOZFAzMHdKOVg5RE9tTDB2YlR3?=
 =?utf-8?B?U09zSnVSZWU4UUdpSUVVTWRBVit2K04vN2VjSnpEdklWblZzT3gydE5WejFr?=
 =?utf-8?B?ZzJCaTI2bTRIOSt1UmlIZGxhZE0wR0E1TUpJeStoZlF4L2ZENjFkRmF4Kytr?=
 =?utf-8?B?R3VkVHB0eHpTUExMbCtZeXBES2ZyMjFFNFcybkk0UkpGUUNQbGI2bU9zaEx5?=
 =?utf-8?B?ZUxOYXNPYTZzMm0vdC9JeFhPT2NqcXhzbHdiUFVZTkd5OXZtekJTZzJDcTdh?=
 =?utf-8?B?Q2N0UGhDTlQ4OWFwV1FhcUNCZkp3cnVnSnRWSm8zVU5lNlpKYWhEUWpnamxq?=
 =?utf-8?B?amo1djd1Q0hLMFNSbGRVSk93eHlhMFY1YitmNVVPMlRHRUE0RXVYV0M4N2li?=
 =?utf-8?B?dHpYeWMrM0dUOTJzK3FJazFranFiODJORjljV29nblo4dWdlMW1pQzE0dEkx?=
 =?utf-8?B?NmZHZm93ZEY0N0VIZGwrVW5ZK0h6YmUvU3N2WDh6bmYvMW1IRVBNRFZNN093?=
 =?utf-8?B?Tm1RQTFUMHpQMms2eEZCeExUZU9CSkc1UnJGQW82L2ZIbEQvNlpBejFEWnpK?=
 =?utf-8?B?SUNzazdybzludUFLbWl4VUovbFh6L2FRQkpoa2dtWkI4R0tLNmxRZW5tcU1F?=
 =?utf-8?B?N1g5Rm9HVStmSmRyRThHQ0pJS3hCUEZYMUFrRVNsaDlOVVppbXUyT3U3elN4?=
 =?utf-8?B?OVI0bUkxUmVuSzExQXFnSFF6Y3BzS040WUlnSzBJU3RaOStYc3J0T1VDWGR0?=
 =?utf-8?B?T1d4WWZuUkUxd3RJVGtuVDc0bUNLNmpkVGxBWlBDb3lZSitRSkhFOXBsbjU3?=
 =?utf-8?B?azhQSDVJUmR6VFE0cDZaNDZ5bHliQzQ2ZzhGSWdvYW56Z012S2tqOVdacFJo?=
 =?utf-8?B?bUV2U01HTmdXeVFUbkcwcUNmSTZzSnZldm0yczNtNzBqOGVheGVGMml6Ynd2?=
 =?utf-8?B?cTZEOHFUZmxRYjBnenJMUy9jMHRHRW5FV0h4cjNzWTlZVDh2ZmtSMDRLeE1y?=
 =?utf-8?B?L0d1NmtlN1dRUThobDJqTnl0ZXVsM29Cek4xR1ZFanlORlN6NmVnU3p6Mlo1?=
 =?utf-8?B?WVpGK3BGa2c1bkhlV2lYRzR1aUhBbUVOL1YxMWRGMEZHd3N5aHRPdGdJSEFh?=
 =?utf-8?B?KzR4RWQxamhpMmVnRCsxSElGYXphZXJJN0ZSdGRua3VONUJPck9hL2JDZis3?=
 =?utf-8?B?NTVPcWJDdGhDWkY5cTFxcm84R2FBaU00bE1OOVpwSWx0elFPWWlsQlhodXR5?=
 =?utf-8?B?Z0cxb3hOSjM5YUdGRlpwY054YVJTYzFWaHRUUXpwZXM2aTBDWDQ2UUNVTlVj?=
 =?utf-8?B?RGgvU0Mva1ZFRmZ5NU5iYzZqL0NGcHNlcVhOOGFEc0h0dmoxbmlXU2FROXBK?=
 =?utf-8?B?eE92Q0YwbUJib3A0M2YxaVJySHVmUjVqb2toQUI0WW9HWG5SalcrWWNld2RT?=
 =?utf-8?B?NGhLbFNFdWd6dG03U2hpQVVKeGYzQUgxWVRrNUJkOXJ5dFdEVTJaQ1BDazZi?=
 =?utf-8?B?aHZFV1pJN2Q1SWlRZFQzZEVLeE10UXhqU1RsemhYNU5obWF0THhYZEllMG9P?=
 =?utf-8?B?aVhWTUk2VkFJSy92L2JsUUtkWnJSTEt2eGxaajYxa051VUdxYzUvc0l6MFZF?=
 =?utf-8?B?anMxL0pOU1FTVW5OM0JzV1RJMkhtQ2ZlYk1OYXlITmExZWgwQ1ZkRS9zVjZM?=
 =?utf-8?B?Tm9kR2hreXBhQWZLeDBaQWZHZ2FpZGZGUS90RnNYc2lLTWxxbEkzaU5MUCtl?=
 =?utf-8?Q?TkQ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDlSOUhzQ3MyNW8xUzNjb1R3M0Fad2NzTU1CMGxJRTMyQTMrWGErV05MdEE0?=
 =?utf-8?B?WGllc1RidHVrcGxrYWFBenFhK3VubXRpSmFTMDEvbnBSRTRpbmllNEZOZnBM?=
 =?utf-8?B?UEZSN1IwOWRWN1EyT3FPencreVRIQTJmOUEzQ1I1c25hVGdnV3pnV2lydERz?=
 =?utf-8?B?cWUxdnA4NktvZy80WCtxK2E1TGpmZ01IbUNHclo3YWpFYXJ0bnVkQnd6TGh3?=
 =?utf-8?B?a3dRa081ekpWVTU0SFJ5NEtINlQvNUk2MEU2N29sRHZVTnJMZHhlMitMOWc5?=
 =?utf-8?B?aFR2VDVROFF6d3ZEVVc2OHlPUDd1OHRVdE1IV2NXdjFRM0JDOGpEQjZibllB?=
 =?utf-8?B?eWhZbThQK1RTUE8vQzgzVlpDL3FyOXRuL2ZYbFpObUFMeEdsTVFPa2FXanRE?=
 =?utf-8?B?ZGJnbmVYdXh2b2xnT21TMCt4d3NIZ25BUEg3U21IQXFkZWdhQXRVUVZDN3hl?=
 =?utf-8?B?TVNQdnBzdEVEaHhKRVUyMmExY0FzWFRNaFBROCtkODRub3FkY2VMRk1YUFF4?=
 =?utf-8?B?ZEY3K2VNUm1jOFIyeDhvT2NUZ1N0aXdFeVhqaUQzTmZHMU5YcE9lUmM3VlFP?=
 =?utf-8?B?c2lZckJsMnVSL3NGcGdWaW13c1poejEyekdDUGw5UFZ6ckVIekdIbkFPSUdl?=
 =?utf-8?B?bzdReUlrbXUyeVBTR3lrbDhjTzdjdzFOVlNxcCtCY0RibEdTOFYxdXFuT1Y1?=
 =?utf-8?B?ZnhrdmV4Zk1wVkxqOVVzMXc3eEs2VjdsM3l1bTZVWUt3R1E4RTFqUk9CK2NZ?=
 =?utf-8?B?R2ZjQy8ycE9sc1JGSlZIUEtaMllvV0xIS3ZYNE13WlIrOVpmL1A2WHpjL2Z6?=
 =?utf-8?B?czQzbnZaWG0xMkQwcWhteGV0WXJpS2xoRWFFU2RoQ3BWc2tBQ2FQamlYUmx2?=
 =?utf-8?B?RkR5NTUwSXdWNkpVV0VQcTNkK1Q1dG1YVWovc2NTd1RIS09RdzJKU1ZsWENu?=
 =?utf-8?B?U281am9IeWNvZ1VMUU5aY2xKZXViREN6cDM4ZGx1WjVYRmFJZ3gvNHFBQ1l1?=
 =?utf-8?B?eG5jV01TWCtvTlVNb3crcllMNkxraXRlZk5hVFQ1UWhJRTZYK0JrdG15aTlZ?=
 =?utf-8?B?Rm5HZldIL0F5YWNrN1hPVml5TUVhS0lsVE9yTHBzcTMzMWY4aXpseWtQQkYv?=
 =?utf-8?B?dzFoWFAya3FXanRQR2ROY3ZZWTZYVDR5T2RydDVHak5pTE9lOVBEMCthSHRK?=
 =?utf-8?B?M1FFR0FaWFBoeHplWVp1cjF3bGl5VE9neE5kVUM1NmVXemNYc25VQ0dPYlNl?=
 =?utf-8?B?NnJ3eGVrRmFYWGpoemlraEQwMUxnN2N0Rnl1TjRCK3RNS25HM2NPYkkwbkZj?=
 =?utf-8?B?QUJSSWFwSFJjeVZxbUJVR0M3aFZEMHhOUktXQXpsMk4weUwxeUQzY2tGMkln?=
 =?utf-8?B?RzJXeVNraVFmVmdyOCt5bU5RS3pmUGVqRE00dFl5c1hGMm1lU2hrcnRaLzZp?=
 =?utf-8?B?b1ZjV3Z5dGtqTFE2ZFNkOXcvYXFyMFlXbFdTR3VuSUVveFRsSmNsWmhUS1JC?=
 =?utf-8?B?K1c1aFhVNzJMRGd3TDVOUW5DUEtYaHQyMk9XeSsvWnF6UFUvVDR0RjFFRitr?=
 =?utf-8?B?ak9vOFc4aGdVOWhXZGFYemIyQjlCS3hHbUdyM1M0NGVaYXpmcWg4RmRYQTdH?=
 =?utf-8?B?Wi8vNEF1KzlVdGRxcVZBTG1QSnFFeUNzd1M2OE5GY0g0bmV3YnJZV01NamVL?=
 =?utf-8?B?dTdRbEZ0dmFsSGRSNXhDcGNUODhaRTIvSHVpdzlFWXhpTlp5Nk9qUTdoZkpn?=
 =?utf-8?B?M0RuWlhaWE4wUzFsSW1HQXY5bFp5akpQTHE2KzFxdUp1OStsMUxRTnozR2ZP?=
 =?utf-8?B?cHBmM3ZTUUYrbXNSSzFxbURwT1BXOGp2OTVpaTRRajhaYWxjM1o0OWZUS3ZF?=
 =?utf-8?B?aDVhSnh4cFpFNkJKTTBYRDdRbzczRVd5bUw1K1JLdHNDUnVCZ0tQTTQ0cDJ2?=
 =?utf-8?B?Ri81N0dMY2w4L3plbStXRHVobmpRV1I5MUJ3dlVrRmsvSzFlbWM5YUx1dUdt?=
 =?utf-8?B?bmdzZkVCVVExWmVBaHB1M1VIRW1nM0dpSlNlcm44eXFDUDdOWGNRbE1iU01y?=
 =?utf-8?B?VHAyTEd2VTRNSkZiRUFUemZObmFaOXY1OTZENzg3anF1RGpzZ3VjM0duRGJT?=
 =?utf-8?B?cHpHQW1PMHNBYTZHQTFQcURpU2d4bjB2emZxd0dFeGJLWVdNOHlzMnpBMzR3?=
 =?utf-8?B?eGNOQkc4Sy9HVDhwTEM0czZML0dVNzdOYlphdlFzdy9HVkNLM29Md0hpeTNa?=
 =?utf-8?B?UWp2V3p1OGFBUXNYZWNKb0pKVDF3V1NQd1UrcDdaN2R4K1ZOR3ova2NsaEFz?=
 =?utf-8?B?eDdrZTJMZnhMak5ZOVhvMHJNcklIeThGWmlFaGZxNGZSUXdIYXpPVFRTOUJK?=
 =?utf-8?Q?QXbHaDL9cST94qCg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e88d22b-8bfc-4cb1-864b-08de641b6af5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 18:30:05.6098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UCW41Dcg8cyKWKYMpQ1pzXL6LzuBqcPZJ349cXd9l69S7TYkJS3y3+Td6cD4EKqZnq8/ulvCRSbpPL88awkfRLgNVfynfH7szVBYAB9C1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
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

On Thu, Jan 22, 2026 at 07:15:28AM +0000, Xin Wang wrote:
> Rename the PCI ID translation helpers to intel_gen_legacy() and
> intel_graphics_ver_legacy() across callers.
> This is a preparatory step for introducing fd-based APIs.

Was this [mostly] generated in an automated manner via coccinelle or
sed?  If so, it would be helpful to put the semantic patch or sed
command in the commit message so that the patch is easy for people to
re-generate (especially since the maintainers might want to re-generate
it right before applying if anything else landed in the meantime that
still uses the old names).

As a general note, I'd avoid using the suffix "legacy" since it's not
really clear what that means to someone who isn't reading these specific
mailing list threads.  A more descriptive suffix like "_from_pciid"
might be a better choice.

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
...snip...
>  
>  /**
> - * intel_gen:
> + * intel_gen_legacy:
>   * @devid: pci device id
>   *
>   * Computes the Intel GFX generation for the given device id.
> @@ -747,12 +747,12 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid)
>   * Returns:
>   * The GFX generation on successful lookup, -1u on failure.

I'd add some kind of disclaimer to the function documentation for these
indicating that this form is deprecated and should only be used in
places where there's no access to the device itself (e.g., DRM driver
isn't loaded, or a tool is being run in a different environment).


Matt

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
