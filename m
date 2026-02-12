Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15786ECD6F7
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 01:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB7210E6C1;
	Thu, 12 Feb 2026 01:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjZ79Mtx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E9A10E6C1
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 01:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770860467; x=1802396467;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=tDrDctG/RgvpUTuVYkMlP4rjmYFYSg+qqLIO3g/JK2U=;
 b=JjZ79Mtxa+fSey/PY1m4wR7BpCBpQRKj1vrmS7D395TYpyK8eM21DK66
 vdcKgWsJkBQjW0SLOLUrVH1Y3Or/vemIQfMiuw271SaR7dz37+X+Ff/CR
 urXXeYcdfkD5Udl355Up9attaBGVjCVKA4pzDx4SEGF6qYf29kz7ztONr
 u6qi3GBLSzXCWEZ+WFOLu4tEzSd3iDwcNsPfO5C5ErWr6h5dPaLCGu91k
 KcEH0YRt38Iaq4jaJhubzWAEhJcPXiplqWwgdsVUiGOSVYNo/8OaAGpta
 GOzLfJU/sHPZfYQ5TzpexrjwVKKpE5VLK2NojdKHF33ogGOeQenWldOkV A==;
X-CSE-ConnectionGUID: 5E0mDc9uSwGYU7xrikIAeQ==
X-CSE-MsgGUID: bKZdbGsxQWyUGgMuo9eWaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72011575"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208,217";a="72011575"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 17:41:07 -0800
X-CSE-ConnectionGUID: cb9ncB06RuOe8P/u2ogXRA==
X-CSE-MsgGUID: eNtCOCYNT628v1q6IuKVoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
 d="scan'208,217";a="235406692"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 17:41:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 17:41:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 17:41:05 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 17:41:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGxFAxg/hG2BFAM6zAq15YdlPeFE5n3m0/gN+y4oVPybiQNR6be8KSPVY4dv+DzMfHfpwaztZELAo7vTH/vNRhJB3RUuBck+DTA4OZilwPbvyHYnNgj+n9nxkXSFDude05XeNLc5qpTYDcCl+6igzvhnj/GPGf2+IYtcprVom8Jx+didFlDOWRVlUPesTfkMO8HWHmczZyNbT1zZST4TfZFrppzNN9GbkfA/Wa9Jsx+rRGlbbqGvv3rIGl3fToZkjTSqYV2CRpFSMislMbzts7TQJsS4Z1XW/PYieX+RrRsg9CMxTHXBSScjYcMu40y8r3Cdla9qJnHtQoxgwuuPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xh8drlq174CLBPaZfCm7CJoJrh3yO5aiolMHhbTSSsw=;
 b=g0Nrr44zzp7FTxE08tTvYppMAxIkDbCqm139HgzcRRTjtITdZP9AYGN/U5pEQtGffQWZ18gvd71/uXRyQupsXd6asgAQ+pU2iYPViwPeCFPeE0r7Akhr8n07UU+8pLnanDGMFhTNikvxGc6cSczSAya/mlO7ZFmBfE+Nzq40tKl6+1hiD4pUVsddufPcV7O1I2ITsA1WOZirGGlJE7q/PeDRpAHehLyYzeVo6fxIhT9DLDhVBJAkWKChuIPge5wcyLcQ7+8jbWK0a/Cj/6mr2mKmP/XI61AtGD52jcDS58b4XsSGWP3TatGhYMBKae9+onsQAfIipe5l4PnHHES/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SN7PR11MB7665.namprd11.prod.outlook.com (2603:10b6:806:340::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 01:41:02 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 01:41:02 +0000
Content-Type: multipart/alternative;
 boundary="------------9Vjshw0JZXAXNg75cGOkmWH6"
Message-ID: <735a3190-0757-4cf5-ba1f-f6260647626b@intel.com>
Date: Wed, 11 Feb 2026 17:41:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 3/5] tools/gputop.src/xe_gputop: Refactor
 xe_populate_engines to close card_fd and use direct ioctl calls
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>, <ashutosh.dixit@intel.com>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20260130095318.644256-1-soham.purkait@intel.com>
 <20260130095318.644256-4-soham.purkait@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260130095318.644256-4-soham.purkait@intel.com>
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SN7PR11MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6468ec-9f7f-48ab-95b7-08de69d7c7d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjltRXZJVTN5M2duZC9tM1d5UHVRVjgveUM4bTY3cnFicHV5Z2l3aXNhM28z?=
 =?utf-8?B?U0lJWnFCSGV6ellZU0VGQTlnckFJdGVaYkJORGZRT2ZTMm9xajBkVTREbk83?=
 =?utf-8?B?WVRhRktpRzcwTHlmTzA5UExTZFZEbW4zZU1IWGl1NkdjUEIwZzFCVTB2WGdq?=
 =?utf-8?B?eUl5VmxFck9LZWV3Z0ovY0I1UlFjeklZRGpteHJ4U2xKbk5IVGFweXVUSXJE?=
 =?utf-8?B?eFN6eWZ5cnA4UWR0Yk0xLzVSc3ZsKytiQ0lsYnZKQnhnYktnVitwckViRm85?=
 =?utf-8?B?bDZOYXV5K1E3S2kwOHpLcTVGeUR1Umw5SnV3S1R4aGtFUDF1V1ZmdHdjQmhx?=
 =?utf-8?B?ajJ2OFE2aTJxVUFCRnlaQmZySjBLem9nVVZ4YnNoVmNtcDVkREI0ZjZjb0Ev?=
 =?utf-8?B?OWpnZjE5WDF3bGtqZEhlaHBnSzcrYzVVY3FkejA4OVVKUFFKS3ZhZExSbFAv?=
 =?utf-8?B?WlJjeVpnV3B6WG5UQUVWYzZOck5GaGVCY3d5c0c5cXRSeWcrUldRVjZkUWpF?=
 =?utf-8?B?b0RYeU9CT2dnZC82QVJaWVpnejFMNFBWaW05bFFMajBQN2JXaWhKbTdMTENH?=
 =?utf-8?B?Uld5b3VIV1ppK1l6S1d2RWdyeEFHWUhQVW9NU2VaZzFRMjQ1cG1JQjkyWnBC?=
 =?utf-8?B?bHl0NUJKaGhJb0xRdldwRUNJT2dkZ2VsdGxnZEtSYVNsVkZPSjFaMGpLbndM?=
 =?utf-8?B?SnZKUnJLN0tiN0V0UGVWSm00TzZHQU91bUNCSXhtT0dPZHlFOTljMHMyaGkr?=
 =?utf-8?B?Mjh3emJreUF1RzZIeCtEQ1oveENjNGlRYkhiTDd1eEFxSlVuUkROOGtJY0hZ?=
 =?utf-8?B?SWpvVjluNk8vNllTT0FPQVUzazhZSE91U3JtUWN2U01rakxCL01kZk95TGVO?=
 =?utf-8?B?L2tZd1MwMHB3SGpEbktFMHNNd1NvN0k4eU9Kenp1bjRyRE15REFNME1LQkt0?=
 =?utf-8?B?QUJpL2NycWJkV0pDdnRqckY2Q3RGNy9oaHNMbTliUGpDQ0JoSm5MMVFob1du?=
 =?utf-8?B?TkkvVFFnc3cxcHNZd1RiaEtQWDR5cktmdFZlQkJqYXIrSjZ6NWlvRGV6eldL?=
 =?utf-8?B?V1pteTZwOEZQWk5tYkpZYzVDZzNaS0h3L2VEOU1Uckg1OEdHMkZzeHNpVlFB?=
 =?utf-8?B?dnhLZ2dpQk9Pc1ZBVUZyMjByWllHcm9oL3VqRWdaamFSdEdpL1VnaVRvemww?=
 =?utf-8?B?dmtzbmx3cGV2MmJ3ci8xVy9zR3NpZHhOWTBWcDM1UktsKzk3QlhROGt5bW91?=
 =?utf-8?B?MUthYTFPNGYvRzl3dzJQODFtcWdRSmF2MFBiODIvMXFPUmQ1aVl1TkNyRzNH?=
 =?utf-8?B?dUpuUjF5N1VVcU5WWU5vYmp6K09WalhVYkE4K2hubjNaR3NTV1Z1aUt2NVp2?=
 =?utf-8?B?Tmd3VE1GQW1MSnVzOGJzSVNlNmM1a2RwVWk0Z1hXazdzYkc1YjlkK1FKd3lJ?=
 =?utf-8?B?NnRNRHBkanI3aGNKdFFYM1BwTEJMR3RUc2dkcmVELzVmNFFkQW9WY21ZOCtR?=
 =?utf-8?B?WUJ0Z09RVFA3U0hRUFYyNE9qNFJQMXdncWNwVTI5bkZkZUNrZG1HMEp0K3J4?=
 =?utf-8?B?TTZCb0FOQ1lFTm9RelByR3IvS1Q2Q00rbDFuYnNNbTZ5N2lDbWFlb1ZqSXEv?=
 =?utf-8?B?aFhsS0gxTXllVHNVeU92TWc2b1FGVTVhTWF2eGVLbHhpWkZuazl0WkYrT0V6?=
 =?utf-8?B?YTFqdld0RjVIUHYwT2psKzdXVHNiYWdPU0dCTy8vWnBjeEk1SGpkV3lkUVpL?=
 =?utf-8?B?Skc2aWpCRTl5TmZyVW5BVkcxSi96aXl4eEhtOCtGZkVTUTc4UkQ3ekVjdHo1?=
 =?utf-8?B?Z3dCMDFEV0hVaVVtdEJ6OEY4S1RzNTVWbjEwdEgycko2TTNtTG1SeDVid01m?=
 =?utf-8?B?QS9CTnNFQmdCalZJY0JEM2dkbGNCdCtlYUVwK0h2bjFYeExKOEk4R3ZFL1RN?=
 =?utf-8?B?VDc5RTRrNTEyamdIOVkxN1RZSkhZWUY1a1Bid003NktzaGhmZHhUNm15NGh4?=
 =?utf-8?B?Wnp0bm1QOGVsY3hHS0xJbmMxUFRSdytPM3E5MFdvdTFyRFYxSlZZRWpyMWdU?=
 =?utf-8?B?djc5UG5aazI1TmRSMC9ySnRSY1lHSnJRa0xWb29OYlpsWlRRMGJJMnRJYkNN?=
 =?utf-8?Q?y+dc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnNDV25sM25mbkR4a1RFOGhFaXQ5NUFERk1kTTFHdEpWVmdrdG1KaDd3S2Vh?=
 =?utf-8?B?VUlDU0kxcnk1M2EvbEtiTGVaanY0L0M4RnVsMnBxMm5Nc2xrczF5WWhSQWNL?=
 =?utf-8?B?UUVEL1NHUEtmekEybE5zd2hPSHp6Mm1zMVYvVC9Qc1dlM1NYdWZBeGp1dVRT?=
 =?utf-8?B?aXFra2JjVEc3bktLS2xaMFloZWpFR1RLSmNKOG5pQVRPYXVDQTZTSXhUaW91?=
 =?utf-8?B?SWw4NDI5OGhrM2N4NFZqNEN2RnBNZXBiWjdwWUZhUW9RWlFlTVhOMlQ0SG9i?=
 =?utf-8?B?Y0lSem0wcXkyNmMxL2ptNjhCUEJ6djByb1VEZi9Fdkl3OVZvN29CQkRUTHpk?=
 =?utf-8?B?RG5oWE05UXVLM1RtaW1IUG9CYU9hTVhnMUZwOWx6U0Y2RndzUUJJUXRQRnZi?=
 =?utf-8?B?MXBoREFWSlBSSTZ0ZFN4QVQ5UU5IV2tZaVNLZEVMcWpTMTRqTUppL05LWWc3?=
 =?utf-8?B?OEd1Y0Z2QzBNdXNPa2pCcjFGeXhXUHJmSnZEMmc0SmlMMk5qeWJLMVlKdHZ1?=
 =?utf-8?B?RFJJSXkxUXNxNllrS1liblRveGRsSUR2amhuVG9JSlRHaUJ2cnlnbDArajZW?=
 =?utf-8?B?MFZpandZTTVaQU02S3FNWnZub0tNSC95dW9MSkFzdTFibXZwNmhQSGFLYXUz?=
 =?utf-8?B?NER4ODVXUUttbkZKcUZ2VDlMNDBHMWJqQlQ3T3Z4cWZEdEhtbXdjVEo4ZTdQ?=
 =?utf-8?B?RGRYS0pnOTlZblp3QVFRSTlmR3Z3ZzhjMXZ6ckNpOWU2VTFoQWx4Q0xhSmIz?=
 =?utf-8?B?S2pUNXNPRy9VYXhjUG42dFNQVnFTY05tYWFYZHBId0RObGVoN0s0bHZoVEht?=
 =?utf-8?B?bm9EWDIrMkFyRXBMZlFwTXNaZ3JrdmxNbUkxQmxzOW5CNlZJamtNOWRoWTls?=
 =?utf-8?B?bk8yemNvZlZ3d0lJRjBFTDAyemVnaHpYL0NQb2NyZnV3aEFvT2tFbWFhbnpp?=
 =?utf-8?B?a0l5WC9qeWFmdVFqOS9ERTJRdmFDYjNPSTY0ZUpSQkNZMTdRc0hKenYxZzBj?=
 =?utf-8?B?Y0NidmEreVlVWm9CTTFPM1BBamFJK1ZXbDR3ZUs2T1N3UW9tRkFXcjhUb2ZY?=
 =?utf-8?B?Y3lIZEx5Znd4T0tERVJ6ck4xYWxIdzFNWXppUUdQM3pwOHlhMC9FdER3S3JW?=
 =?utf-8?B?bjVzT3A1MUdsUmMvb0ZuS1hVSno4TWh0WXJCWUtJdmRxa1RHV3VTSFJjaDFh?=
 =?utf-8?B?Y0NEdzcvWEoxSUJnUSt0VUJSTkNCMTMwVC9VZWx0LzZiYTA2ai9JY3kxNmI4?=
 =?utf-8?B?WWhnQ2RGK1BCR0VtRUNjV2xsbHc0QzArSXRjZGRUbDhpOU5OSlVkTXFHWjRt?=
 =?utf-8?B?VmRoVXdkeTlZYmVuQkw2VW5hT3BJSGV2eWg2WTBTYlY0Rkhzdk5ZMVVEZmc5?=
 =?utf-8?B?OGtHdFhBSHNZd2JsRDhqenJ4cHNleGxZODN4SnZLbWo0RnlaWDVCbFU5SkQx?=
 =?utf-8?B?ckVVQU9LNWpHUHZMSmJoR3UxdXVIeEhVM0NVaUpUME51ZW5iT2NKZy9OWkow?=
 =?utf-8?B?emlQU3E0RXF2TDF4cXpCQkIvUUtoRFJmMk1LQ1gvMThUSHo0M0FuR0t6QjJ4?=
 =?utf-8?B?Z0ZPUWlFN2dTTE5lOHBieUlqOWc1cnRqN0NKVkYrbTd6d0VlSk1vRU1xQlI3?=
 =?utf-8?B?bVNqQnFrQ3A0Q3crWGdVanZ1cUhacUV2c2V0ZzBjLy9wTnlDOXF3UzVPbXhO?=
 =?utf-8?B?MDB0Rk1vSE9hRnVQRWlzNFYwVE1qcWczMURVclBoOU9KbEVwc2VCOGRmY3ln?=
 =?utf-8?B?bWtpdStKeEhOdW14bjFNTC9ZRkdqYzVHc0lvQVBYZ2gvaEx0alhza3JVL2Nq?=
 =?utf-8?B?b2JiczU4K09JS3RWb2JIWTVEcGx2bExPTWp0dkVGeHZTVkNzWDN3T3ZkTG9h?=
 =?utf-8?B?YzhFdEc0YkhuWExkZGxyVG5RVzRtY25La0FSVVBZb2J6R0w5aUVFNVZSbmpw?=
 =?utf-8?B?Qjd5WlRrQUNmWVRIOWpqSnBFNk13S01EeXp2dnRwSUVMeEJyR01SVlNzVVoz?=
 =?utf-8?B?T2kxTFIyTTZzOWcrcCs0aTE0NDBUdjV4ZG43M2IwNlFEWTRKOU42Q3E4Q0Za?=
 =?utf-8?B?R1ZtNW9ZWmhYKzFDclNkdzZOQVhYM1RVZUlTQWY1T0t5cnUzSUVmT1g0SGJq?=
 =?utf-8?B?dldaL3oxK1BzM3U3WkMwclRuZ3lWenFxamtCUkJPQjFMQUhXZVZtOWpFUDQ5?=
 =?utf-8?B?blBGSEt6YncyTjVUUWlLUmpTc0dtVGdnb0ZXdUFONzVOME5DRmVlN25QYmpw?=
 =?utf-8?B?dXRPanlnSnJrR09RSmUzR0hndFVtMkJDK2I3QldsZkluQ0lndjdTYm1qTkI3?=
 =?utf-8?B?OHZrOTJDTGdFdWdIN0xqRmlZdXdhOWNUWkg3Sm53Vjlwem5xMkhFQnRUcERp?=
 =?utf-8?Q?mddE5MPymmMCp1bE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6468ec-9f7f-48ab-95b7-08de69d7c7d2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 01:41:02.6503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4NbVbEzZCsApWsvAokpwwLx7KdPJuYLQrq9PQkyU3dj1lnfCn9//XNkmbr0iwOnWitrwdvlGscYW63ZGT+yrzsh7gIiCqg+yUaaZIbzB3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7665
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

--------------9Vjshw0JZXAXNg75cGOkmWH6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 1/30/2026 1:53 AM, Soham Purkait wrote:
> During GPUTOP engine initialization, the opened card fd is required to
> query engines and obtain configurations for PMU busyness calculation, but
> leaving it open causes the process to appear as a DRM client, which
> conflicts with KMS test requirements. To avoid this, card_fd is closed
> immediately after engine discovery, and engine queries are refactored to
> remove the lib/xe/* dependency in favor of direct ioctl calls, simplifying
> the implementation and reducing igt test library dependencies.
>
> v1:
>   - Initialize pmu_device_obj to null.
> v2:
>   - Remove dependency on lib/xe/* libraries. (Kamil)
>
> Fixes: c8106465683f ("tools/gputop/xe_gputop: Add gputop support for xe specific devices")
> Signed-off-by: Soham Purkait<soham.purkait@intel.com>
> ---
>   tools/gputop.src/xe_gputop.c | 100 ++++++++++++++++++++++++++++-------
>   tools/gputop.src/xe_gputop.h |   3 +-
>   2 files changed, 81 insertions(+), 22 deletions(-)
>
> diff --git a/tools/gputop.src/xe_gputop.c b/tools/gputop.src/xe_gputop.c
> index bb2caa6ea..7793cd62f 100644
> --- a/tools/gputop.src/xe_gputop.c
> +++ b/tools/gputop.src/xe_gputop.c
> @@ -1,8 +1,10 @@
>   // SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2025 Intel Corporation
> + * Copyright © 2025-2026 Intel Corporation
>    */
>   
> +#include <sys/ioctl.h>
> +
>   #include "xe_gputop.h"
>   
>   #define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
> @@ -92,6 +94,7 @@ void xe_gputop_init(void *ptr, int index,
>   
>   	obj = ((struct xe_gputop *)ptr) + index;
>   	obj->card = card;
> +	obj->pmu_device_obj = NULL;
>   }
>   
>   static int pmu_format_shift(int xe, const char *name)
> @@ -121,20 +124,54 @@ static int engine_cmp(const void *__a, const void *__b)
>   		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
>   }
>   
> +static int engine_query(int fd, struct drm_xe_query_engines **engine_q)
> +{
> +	struct drm_xe_device_query q;
> +	int ret = 0, num_eng;
> +
> +	memset(&q, 0, sizeof(q));
> +	q.query = DRM_XE_DEVICE_QUERY_ENGINES;
> +
> +	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
> +	if (ret != 0) {
> +		if ((errno != ENOSPC && errno != E2BIG) || q.size == 0)
why are we ignoring ENOSPC and E2BIG?
> +			return -1;
> +	}
> +	if (q.size == 0)
we can check q.size just once instead of twice?
> +		return 0;
> +
> +	num_eng = (int)((q.size - sizeof(struct drm_xe_query_engines)) /
> +			sizeof(struct drm_xe_engine_class_instance));
> +
> +	*engine_q = (struct drm_xe_query_engines *)calloc(1, q.size);
> +	if (!*engine_q)
> +		return -1;
> +
> +	q.data = (uintptr_t)(*engine_q);
better to use to_user_pointer from the lib?
> +
> +	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
> +	if (ret != 0) {
> +		free(*engine_q);
> +		return -1;
> +	}
> +
> +	return num_eng;
> +}
> +
>   void *xe_populate_engines(const void *obj, int index)
>   {
>   	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
>   	struct igt_device_card *card = ptr->card;
>   	uint64_t engine_active_config, engine_total_config;
>   	uint64_t engine_class, engine_instance, gt_shift;
> -	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_query_engines *engine_q;
>   	struct xe_pmu_device *engines;
>   	char device[30];
> -	int ret = 0;
> -	int card_fd;
> +	int ret = 0, num_eng;
> +	int card_fd = -1;
>   
>   	if (!card || !strlen(card->card) || !strlen(card->render))
> -		return NULL;
> +		goto err;
>   
>   	if (strlen(card->card)) {
>   		card_fd = igt_open_card(card);
> @@ -142,39 +179,51 @@ void *xe_populate_engines(const void *obj, int index)
>   		card_fd = igt_open_render(card);
>   	} else {
>   		fprintf(stderr, "Failed to detect device!\n");
> -		return NULL;
> +		goto err;
>   	}
> -	xe_device_get(card_fd);
> +
> +	num_eng = engine_query(card_fd, &engine_q);
> +	if (num_eng <= 0) {
> +		fprintf(stderr, "Engine query failed!\n");
> +		goto err;
> +	}
> +
>   	engines = malloc(sizeof(struct xe_pmu_device) +
> -			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +			 num_eng * sizeof(struct xe_engine));
>   	if (!engines)
> -		return NULL;
> +		goto err;
>   
>   	memset(engines, 0, sizeof(struct xe_pmu_device) +
> -	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +	       num_eng * sizeof(struct xe_engine));
>   
>   	engines->num_engines = 0;
>   	gt_shift = pmu_format_shift(card_fd, "gt");
>   	engine_class = pmu_format_shift(card_fd, "engine_class");
>   	engine_instance = pmu_format_shift(card_fd, "engine_instance");
>   	xe_perf_device(card_fd, device, sizeof(device));
> +	close(card_fd);
> +	card_fd = -1;
> +
>   	engines->device = strdup(device);
>   	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
>   	if (ret < 0)
> -		return NULL;
> +		goto err;
>   
>   	ret = perf_event_config(device, "engine-total-ticks", &engine_total_config);
>   	if (ret < 0)
> -		return NULL;
> +		goto err;
>   
> -	xe_for_each_engine(card_fd, hwe) {
> +	while (engines->num_engines < engine_q->num_engines) {
>   		uint64_t  param_config;
>   		struct xe_engine *engine;
> +		struct drm_xe_engine_class_instance hwe;
> +
> +		hwe = engine_q->engines[engines->num_engines].instance;
>   
>   		engine = engine_ptr(engines, engines->num_engines);
> -		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> -			| hwe->engine_instance << engine_instance;
> -		engine->drm_xe_engine = *hwe;
> +		param_config = (uint64_t)hwe.gt_id << gt_shift | hwe.engine_class << engine_class
> +			| hwe.engine_instance << engine_instance;
> +		engine->drm_xe_engine = hwe;
>   		engine->engine_active_ticks.config = engine_active_config | param_config;
>   		engine->engine_total_ticks.config = engine_total_config | param_config;
>   
> @@ -185,7 +234,7 @@ void *xe_populate_engines(const void *obj, int index)
>   		}
>   
>   		ret = asprintf(&engine->display_name, "GT:%u %s/%u",
> -			       hwe->gt_id,
> +			       hwe.gt_id,
>   			       class_display_name(engine->drm_xe_engine.engine_class),
>   			       engine->drm_xe_engine.engine_instance);
>   
> @@ -197,9 +246,11 @@ void *xe_populate_engines(const void *obj, int index)
>   		engines->num_engines++;
>   	}
>   
> +	free(engine_q);
> +
>   	if (!ret) {

Not part of this patch, but looks like ret is overloaded here for 
multiple things. Usually ret = 0 is a good thing? Should use num_bytes 
or something if we expect asprintf above to return a positive value. We 
should fix this as a separate patch.

Thanks,

Vinay.

>   		errno = ret;
> -		return NULL;
> +		goto err;
>   	}
>   
>   	qsort(engine_ptr(engines, 0), engines->num_engines,
> @@ -208,6 +259,15 @@ void *xe_populate_engines(const void *obj, int index)
>   	ptr->pmu_device_obj = engines;
>   
>   	return engines;
> +
> +err:
> +	if (card_fd >= 0)
> +		close(card_fd);
> +	if (engines)
> +		free(engines);
> +	if (engine_q)
> +		free(engine_q);
> +	return NULL;
>   }
>   
>   static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> @@ -263,11 +323,11 @@ int xe_pmu_init(const void *obj, int index)
>   		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
>   			       &engines->fd);
>   		if (fd < 0)
> -			return -1;
> +			return fd;
>   		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
>   			       &engines->fd);
>   		if (fd < 0)
> -			return -1;
> +			return fd;
>   	}
>   	return 0;
>   }
> diff --git a/tools/gputop.src/xe_gputop.h b/tools/gputop.src/xe_gputop.h
> index 1e3856071..dcd82de7d 100644
> --- a/tools/gputop.src/xe_gputop.h
> +++ b/tools/gputop.src/xe_gputop.h
> @@ -7,11 +7,10 @@
>   #define __XE_GPUTOP_H__
>   
>   #include <dirent.h>
> +#include <xe_drm.h>
>   
> -#include "igt_device_scan.h"
>   #include "igt_perf.h"
>   #include "utils.h"
> -#include "xe/xe_query.h"
>   
>   struct xe_pmu_pair {
>   	uint64_t cur;
--------------9Vjshw0JZXAXNg75cGOkmWH6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/30/2026 1:53 AM, Soham Purkait
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260130095318.644256-4-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">During GPUTOP engine initialization, the opened card fd is required to
query engines and obtain configurations for PMU busyness calculation, but
leaving it open causes the process to appear as a DRM client, which
conflicts with KMS test requirements. To avoid this, card_fd is closed
immediately after engine discovery, and engine queries are refactored to
remove the lib/xe/* dependency in favor of direct ioctl calls, simplifying
the implementation and reducing igt test library dependencies.

v1:
 - Initialize pmu_device_obj to null.
v2:
 - Remove dependency on lib/xe/* libraries. (Kamil)

Fixes: c8106465683f (&quot;tools/gputop/xe_gputop: Add gputop support for xe specific devices&quot;)
Signed-off-by: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
---
 tools/gputop.src/xe_gputop.c | 100 ++++++++++++++++++++++++++++-------
 tools/gputop.src/xe_gputop.h |   3 +-
 2 files changed, 81 insertions(+), 22 deletions(-)

diff --git a/tools/gputop.src/xe_gputop.c b/tools/gputop.src/xe_gputop.c
index bb2caa6ea..7793cd62f 100644
--- a/tools/gputop.src/xe_gputop.c
+++ b/tools/gputop.src/xe_gputop.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2025 Intel Corporation
+ * Copyright © 2025-2026 Intel Corporation
  */
 
+#include &lt;sys/ioctl.h&gt;
+
 #include &quot;xe_gputop.h&quot;
 
 #define engine_ptr(pmu_device, n) (&amp;(pmu_device)-&gt;engine + (n))
@@ -92,6 +94,7 @@ void xe_gputop_init(void *ptr, int index,
 
 	obj = ((struct xe_gputop *)ptr) + index;
 	obj-&gt;card = card;
+	obj-&gt;pmu_device_obj = NULL;
 }
 
 static int pmu_format_shift(int xe, const char *name)
@@ -121,20 +124,54 @@ static int engine_cmp(const void *__a, const void *__b)
 		return a-&gt;drm_xe_engine.engine_instance - b-&gt;drm_xe_engine.engine_instance;
 }
 
+static int engine_query(int fd, struct drm_xe_query_engines **engine_q)
+{
+	struct drm_xe_device_query q;
+	int ret = 0, num_eng;
+
+	memset(&amp;q, 0, sizeof(q));
+	q.query = DRM_XE_DEVICE_QUERY_ENGINES;
+
+	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &amp;q);
+	if (ret != 0) {
+		if ((errno != ENOSPC &amp;&amp; errno != E2BIG) || q.size == 0)</pre>
    </blockquote>
    why are we ignoring ENOSPC and E2BIG?&nbsp;
    <blockquote type="cite" cite="mid:20260130095318.644256-4-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			return -1;
+	}
+	if (q.size == 0)</pre>
    </blockquote>
    we can check q.size just once instead of twice?&nbsp;
    <blockquote type="cite" cite="mid:20260130095318.644256-4-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return 0;
+
+	num_eng = (int)((q.size - sizeof(struct drm_xe_query_engines)) /
+			sizeof(struct drm_xe_engine_class_instance));
+
+	*engine_q = (struct drm_xe_query_engines *)calloc(1, q.size);
+	if (!*engine_q)
+		return -1;
+
+	q.data = (uintptr_t)(*engine_q);</pre>
    </blockquote>
    better to use to_user_pointer from the lib?&nbsp;
    <blockquote type="cite" cite="mid:20260130095318.644256-4-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &amp;q);
+	if (ret != 0) {
+		free(*engine_q);
+		return -1;
+	}
+
+	return num_eng;
+}
+
 void *xe_populate_engines(const void *obj, int index)
 {
 	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
 	struct igt_device_card *card = ptr-&gt;card;
 	uint64_t engine_active_config, engine_total_config;
 	uint64_t engine_class, engine_instance, gt_shift;
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_query_engines *engine_q;
 	struct xe_pmu_device *engines;
 	char device[30];
-	int ret = 0;
-	int card_fd;
+	int ret = 0, num_eng;
+	int card_fd = -1;
 
 	if (!card || !strlen(card-&gt;card) || !strlen(card-&gt;render))
-		return NULL;
+		goto err;
 
 	if (strlen(card-&gt;card)) {
 		card_fd = igt_open_card(card);
@@ -142,39 +179,51 @@ void *xe_populate_engines(const void *obj, int index)
 		card_fd = igt_open_render(card);
 	} else {
 		fprintf(stderr, &quot;Failed to detect device!\n&quot;);
-		return NULL;
+		goto err;
 	}
-	xe_device_get(card_fd);
+
+	num_eng = engine_query(card_fd, &amp;engine_q);
+	if (num_eng &lt;= 0) {
+		fprintf(stderr, &quot;Engine query failed!\n&quot;);
+		goto err;
+	}
+
 	engines = malloc(sizeof(struct xe_pmu_device) +
-			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
+			 num_eng * sizeof(struct xe_engine));
 	if (!engines)
-		return NULL;
+		goto err;
 
 	memset(engines, 0, sizeof(struct xe_pmu_device) +
-	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
+	       num_eng * sizeof(struct xe_engine));
 
 	engines-&gt;num_engines = 0;
 	gt_shift = pmu_format_shift(card_fd, &quot;gt&quot;);
 	engine_class = pmu_format_shift(card_fd, &quot;engine_class&quot;);
 	engine_instance = pmu_format_shift(card_fd, &quot;engine_instance&quot;);
 	xe_perf_device(card_fd, device, sizeof(device));
+	close(card_fd);
+	card_fd = -1;
+
 	engines-&gt;device = strdup(device);
 	ret = perf_event_config(device, &quot;engine-active-ticks&quot;, &amp;engine_active_config);
 	if (ret &lt; 0)
-		return NULL;
+		goto err;
 
 	ret = perf_event_config(device, &quot;engine-total-ticks&quot;, &amp;engine_total_config);
 	if (ret &lt; 0)
-		return NULL;
+		goto err;
 
-	xe_for_each_engine(card_fd, hwe) {
+	while (engines-&gt;num_engines &lt; engine_q-&gt;num_engines) {
 		uint64_t  param_config;
 		struct xe_engine *engine;
+		struct drm_xe_engine_class_instance hwe;
+
+		hwe = engine_q-&gt;engines[engines-&gt;num_engines].instance;
 
 		engine = engine_ptr(engines, engines-&gt;num_engines);
-		param_config = (uint64_t)hwe-&gt;gt_id &lt;&lt; gt_shift | hwe-&gt;engine_class &lt;&lt; engine_class
-			| hwe-&gt;engine_instance &lt;&lt; engine_instance;
-		engine-&gt;drm_xe_engine = *hwe;
+		param_config = (uint64_t)hwe.gt_id &lt;&lt; gt_shift | hwe.engine_class &lt;&lt; engine_class
+			| hwe.engine_instance &lt;&lt; engine_instance;
+		engine-&gt;drm_xe_engine = hwe;<span style="white-space: normal">&nbsp;</span>
 		engine-&gt;engine_active_ticks.config = engine_active_config | param_config;
 		engine-&gt;engine_total_ticks.config = engine_total_config | param_config;
 
@@ -185,7 +234,7 @@ void *xe_populate_engines(const void *obj, int index)
 		}
 
 		ret = asprintf(&amp;engine-&gt;display_name, &quot;GT:%u %s/%u&quot;,
-			       hwe-&gt;gt_id,
+			       hwe.gt_id,
 			       class_display_name(engine-&gt;drm_xe_engine.engine_class),
 			       engine-&gt;drm_xe_engine.engine_instance);
 
@@ -197,9 +246,11 @@ void *xe_populate_engines(const void *obj, int index)
 		engines-&gt;num_engines++;
 	}
 
+	free(engine_q);
+
 	if (!ret) {</pre>
    </blockquote>
    <p>Not part of this patch, but looks like ret is overloaded here for
      multiple things. Usually ret = 0 is a good thing? Should use
      num_bytes or something if we expect asprintf above to return a
      positive value. We should fix this as a separate patch.</p>
    <p>Thanks,</p>
    <p>Vinay.</p>
    <blockquote type="cite" cite="mid:20260130095318.644256-4-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">
 		errno = ret;
-		return NULL;
+		goto err;
 	}
 
 	qsort(engine_ptr(engines, 0), engines-&gt;num_engines,
@@ -208,6 +259,15 @@ void *xe_populate_engines(const void *obj, int index)
 	ptr-&gt;pmu_device_obj = engines;
 
 	return engines;
+
+err:
+	if (card_fd &gt;= 0)
+		close(card_fd);
+	if (engines)
+		free(engines);
+	if (engine_q)
+		free(engine_q);
+	return NULL;
 }
 
 static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
@@ -263,11 +323,11 @@ int xe_pmu_init(const void *obj, int index)
 		fd = _open_pmu(type, &amp;engines-&gt;num_counters, &amp;engine-&gt;engine_active_ticks,
 			       &amp;engines-&gt;fd);
 		if (fd &lt; 0)
-			return -1;
+			return fd;
 		fd = _open_pmu(type, &amp;engines-&gt;num_counters, &amp;engine-&gt;engine_total_ticks,
 			       &amp;engines-&gt;fd);
 		if (fd &lt; 0)
-			return -1;
+			return fd;
 	}
 	return 0;
 }
diff --git a/tools/gputop.src/xe_gputop.h b/tools/gputop.src/xe_gputop.h
index 1e3856071..dcd82de7d 100644
--- a/tools/gputop.src/xe_gputop.h
+++ b/tools/gputop.src/xe_gputop.h
@@ -7,11 +7,10 @@
 #define __XE_GPUTOP_H__
 
 #include &lt;dirent.h&gt;
+#include &lt;xe_drm.h&gt;
 
-#include &quot;igt_device_scan.h&quot;
 #include &quot;igt_perf.h&quot;
 #include &quot;utils.h&quot;
-#include &quot;xe/xe_query.h&quot;
 
 struct xe_pmu_pair {
 	uint64_t cur;
</pre>
    </blockquote>
  </body>
</html>

--------------9Vjshw0JZXAXNg75cGOkmWH6--
