Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA69CFD376
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 08:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A85310E5BD;
	Tue,  2 Dec 2025 08:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aq4G1lbr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F99810E5BC
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764664210; x=1796200210;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=T+Zg4gmmIS6N5zVTtuja3CLqP3QWv4pyToWIFp8tSZw=;
 b=aq4G1lbrJMH0sjnKUN9aKEvFOXTUYQO41cFAV5ytxWFY0b3avtbiuyWY
 S0sNz3JfROiTouWRpKFVWDIigWTO8Js7NiQ2XJdDoEVgzcmQFiTfDvcod
 0pn+wuj6aW1O3JzC51RJ5p7kG08/RXHtF2akgKFYJQumYG5To2lMkYfOc
 mtik0b3mT2GNrSk+kz9x7RBKzs+z23COXkyTesfANDD/bcqAfEqycmrGn
 GCTwLkX9TRGnDB56d5ilHS6d5kxvm5bpn9CLBrflcpwijoeQLX0Tv19cb
 DC8aN9qhVDqBf3HntddH7VI3JCfklUeKwF+yGQPaqLmWdyY/gFtsVqZuM g==;
X-CSE-ConnectionGUID: NOXC5TADS1egG4xl4Hfc7Q==
X-CSE-MsgGUID: rdPYBD6eTauzb86pdEflCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66567484"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66567484"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:29:55 -0800
X-CSE-ConnectionGUID: 6zUgBaEgTv6BG9iVihSlMg==
X-CSE-MsgGUID: f2NYhN8jSrqQoJpXFCA6lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="199441664"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:29:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:29:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 00:29:53 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:29:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zzj6xnLnntGR8XV9cpSTcPZToq0O3bces+pHBdUs/emrncQgVioJ2F+EpHHNRQLqJAzxW8Ud7TCGCqYqiwC5W40VA9KB0LUSUFgN5mEHSUkZpAHPcdE/xZFs/8jW+/GjPbQBWYMHlKsiSaJfw4doYdCekltT+hx0krZT75twhMhS2bOkKpQNqnVMCMGJzFbV7qq7bKnz2ErYD3RVjgUX2Z1H5j3YR4xR8YGAgtOPgG/lfpe6bXc7y72uAZcKxvVyGU5Nusbh4OoLgn+siODZdvKaUOeWQjtf+Jk/6XNk49m/f2lOgOztRqLtTGFc7PsFIZXKYRaZNMLrTJpMph7R5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+Zg4gmmIS6N5zVTtuja3CLqP3QWv4pyToWIFp8tSZw=;
 b=Or2GZxlMXTnDz3gzffIRR8NBGGrOX8JEO4o1JvSvWqsaeEDm7ILOctBLyAg/vhfsfPNJUv/OEw+vMH9hxmSiu83/grxG2jqJdEVyprAlnfxeU12CLDENuBLAzHsWWupr3gJfWyxiuZH1590YzMGAIywapXK3C8nP+HIHmD3FIZVaWd2BBbkbOzmq3hK2hD76bo9ydNpkUg6JE+yzneZiixwUSAc+5TS4Xa9/tA4TMDT0BNCD6+4AMNwZWxYhZYX92ye5Y96ANFnF0JLlQF4UNO1XtFgICe31LgFJ1JiBgudMBh+gou0GfmUGrLtlZFBIugq6Y4UYaQ5w3TfXmrpIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 IA0PR11MB7404.namprd11.prod.outlook.com (2603:10b6:208:430::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 08:29:46 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 08:29:46 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>
Subject: Re: [PATCH i-g-t v9 07/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU fault handling test
Thread-Topic: [PATCH i-g-t v9 07/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU fault handling test
Thread-Index: AQHcYqEwfHv6r74a8kKWvsJ24JQgVrUOBlwA
Date: Tue, 2 Dec 2025 08:29:46 +0000
Message-ID: <0fe8b842e905033d1fd934e248cb12cec0c8ec5f.camel@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251201090201.326595-1-nishit.sharma@intel.com>
 <20251201090201.326595-8-nishit.sharma@intel.com>
In-Reply-To: <20251201090201.326595-8-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|IA0PR11MB7404:EE_
x-ms-office365-filtering-correlation-id: 05b5c375-0fab-4380-4f40-08de317cf3a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?a3dpcWdXa2dENW9iakxlbmJyd3dSRlJJMnMwKzBBd3dJYkk2R2xZOC9UVkpr?=
 =?utf-8?B?anNPejBwRWxBTjRKWFZiZzVpL0ZOMExicnc3MXppRlpJTm83R0pRbHRvZ3NT?=
 =?utf-8?B?QU01WEdSZ1pSeWVOYXVOdUptSVpRWnRlRVA5U005OFo5b2NIbGFFcTJIMy81?=
 =?utf-8?B?MnYxcXQzK1ZxbHkrYmJiZWJSdU1OS2VQOVpDUFdrZ0tEb3AveEJnMXVqeDZT?=
 =?utf-8?B?bG9FMUxWOFExL1ozS0xsZmlodlpXcnVZSGY5TG1qaEFuMjFlbmR2Ny9WaXFY?=
 =?utf-8?B?ZzR6QUN3Q3RoN1Jzd2VYcVRvUkZPQVNRTDYrWWVGT3ZXYjN3L002Z2QvbitL?=
 =?utf-8?B?cXBiSzFIQlFMWHg1NlE2RFYrTGZZdlZCTDVSMGJPc1licU03ZUQxQlFSb05z?=
 =?utf-8?B?Q3BBK2ViV3EzSlFYa2k1MWpaSmJTTTlEdEtCNmlzWXlUcldqK1l5MnFxdVNH?=
 =?utf-8?B?SkZlNlRjWVJxbkdLRll4V21UWVI4aUsyZXBXTnVmblc1N3RaOERGSVhGWjUy?=
 =?utf-8?B?Wm9qWng1VWRKUEVZVGZiV3VLMVMzNGF2Mmt0UDVRZE5mWFYzV2tBbm4wZFd2?=
 =?utf-8?B?djVJSUp3OUlZMVFId2JNL0w1Yzg4S0FDZVR2cXBLOTE4T1IycldlU2J4UElE?=
 =?utf-8?B?V214czJiQWVMalVndFdZN3ArK2xNcTlCZXNzQXJNQTRQRnRMdEFhU0tHTzB2?=
 =?utf-8?B?bUpTYXhuM0laOTkxWFhpaW1uakZ3TFlqRHM2b0xWRjFjWm5Ka1U5MXpqOHpi?=
 =?utf-8?B?RGpCV0RyVjVhaU56RUFwakEzYWFCQUJOd2ovdkNRVzFvelUyM3dUaUhZV0dq?=
 =?utf-8?B?ZmlGTnRjeVJNU0pEcEg4V3FIZDJ4ZnNsc0NKU015N0pGNkNlakY5VG5rTWFR?=
 =?utf-8?B?QWZTdk1EL2R5MEhSV3NPbjlCWmR0UUEybXpTdC9qWDh2bkJWV1RLUHhiNWFx?=
 =?utf-8?B?WGRnaUdmcGNLTklGRFcrbkJ0ZXdaMXdFZ09QWnZOZVpYakVDZXkvRzQvaEhz?=
 =?utf-8?B?RlkwaGh4Z1ZVQU1LZWc1bjJuTnhoMkU5QVZLdW4yS1haVHA0cVZmRmNaNjJU?=
 =?utf-8?B?T2NUdHhqMUMycmZUcWN5WVZlV2xETzdzZzIvcUxzVkNQSkVSWnUxamVCRG90?=
 =?utf-8?B?OHhCSlJ5WDBSUGdrOEcrRzhkRzZJVWFxaXZBVndBWVl4TkdOK2ZQaXhnU0dZ?=
 =?utf-8?B?MzgrNHVuam1YNXRZVHYwL2JxMVFTUFdWNzJnRTRNN1NMa25td25XR3VCRUNB?=
 =?utf-8?B?SncxOWRTUmdWekVzR3Nha1Q2dFBvSCtkbzkxU1F3U2VqS29PQUVaSGVmdDgy?=
 =?utf-8?B?c1E4QkNFWHVqZVVmWnAxdG5weGlWcXpHSFVnaUdhYXdUTC9SVVRxWHd1MWJz?=
 =?utf-8?B?a2NCVHY3Q3J4N1pSTURzeVlFWG9mY3pUTnNRSlVSbnYvekVhTnR3Y2NCWmRH?=
 =?utf-8?B?M2NrL1dndUYyeWFFaEFMeTBSZzBTaW4vcUNUVkFRbk9iVEhXRDdEUElrV1h1?=
 =?utf-8?B?cUhjbGRxdHVSVUlUS2NGeCtVS2tnZmY5Qi96VWRLa0VvSDkwSmFMdDRIVmV6?=
 =?utf-8?B?ZTBNVHljcU5SbElsRnpibk01UUVuNzgxQ05UcUY4K3NKUHo4dFBuMFYrcEpV?=
 =?utf-8?B?dUpacTAzK3NMaXhBbmZpQVEwMm1XNzV6Vm4vVHNvWnFyTHJka2cvTjF6WWpV?=
 =?utf-8?B?Y1QzNkdrREp2cmtiSUNmeVJaU05qWWIyVStzdzZpS2c1TmxmeVhTTDNDcmZn?=
 =?utf-8?B?VlFIaW5PY2NHcThmaCtpRmt4QXA2Vi81MFZLdENDMyt6VTNZdmVEYmlQTlJM?=
 =?utf-8?B?WjdUaDFySVQ2anMvdmtYZEs0Rlp5ZERMNENJUS9XM0hESldieXRHSVVpanNv?=
 =?utf-8?B?SEtZL09PWjNDRGtEMVZpVHRFRGNqUkNKVnlpcmhoWW5mTjFyaWJaUTBFbVBF?=
 =?utf-8?B?UWJtTGZDOWRXTUdNYjhMREExaDRQcTd2UkZHRUV6cU55SGJvUlc3eU1tNmhl?=
 =?utf-8?B?cFJpcUdxcWdUZ3I3U1lQY1BrY1FvcFZxdFlCelMvR0VCVFBVcHNOeHE1T1N2?=
 =?utf-8?Q?LCmqj2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHVZUWFWTWhwT1AyY2hqaVZnbjhEem8wd2J6OEt6bkcyQ2Q2Tjc0UTJtdFZv?=
 =?utf-8?B?eWtWbTR1OHdJSHFOblhMZXUzWnI2Y1QzNmh3WW80NSswSERQZzlyRUpZSDEv?=
 =?utf-8?B?aXNBV3c5RnFqcGxUbHBpcHVBYlhvWTRsUG9GRzFCSGhIa2RmbWNzaDFMWXdr?=
 =?utf-8?B?NFFLbE1LbHZaaG5DM2FKZVAvMVpuWDlscDMzOU9jem5manI4QmN4YnpXRTU4?=
 =?utf-8?B?NU1SaUl6ME9oM0F3RFZqTzRYMHF1T0hwVTJHNUJoVURIVmY0bk95aHhRMkRu?=
 =?utf-8?B?OXR3VE9INzJKMnNKL2RmemJTRzcrZHpickQ4bGJ5M2c1ZEhYL1c1L3dzR0JT?=
 =?utf-8?B?KzFtV080SWdxZGlGcXlpMnJydCtpTmtaN3pJaDhsaHo1M25KaEFIVW1mQUlN?=
 =?utf-8?B?dlFvc0w2OEdkRk5ZeTIxMjMrWW9kbms0VGlVMXowUnhxNllvOXZDb1FFWXRQ?=
 =?utf-8?B?dEZ0TXRJNG5Gc21FQ0c5aEx0WHYxTHdMUTdIcTlvaXZ1blZtN3dYZk0xRGFz?=
 =?utf-8?B?eHU0eHJxOEVCUlBsL3k5b3g0SzdzVkh5allVaTdEOGlvbTJDTEdEKzB1dDhm?=
 =?utf-8?B?WlFwMFlsb0NKbVgvcGFHOEhaSkFlL05KN2psVzlYS2dIaFpTc1dwYkwrZ0Va?=
 =?utf-8?B?L2toUHd0RzVaWUJEbFk5cWJCY1dOanpva2FMeTRwbFJ2OGRsRlc4UUlEZWFM?=
 =?utf-8?B?c250L3k4NzlPSlMyeGtPNGI3VG5NTUlDWmxvdHdFd25DVlQ0QjB3WUFpdE5C?=
 =?utf-8?B?OHhINEcza1VUMmwwbThsc0R5d0xkZWhSRE8xQUpNZi9meSt5UDFYRHRMNDdM?=
 =?utf-8?B?cmE0SGlXem1pUWhoMUlHdUdWaHZXNWRMdmNlSzN5ODdJbGhRNlN2Q1RZK0ZV?=
 =?utf-8?B?V0tSQU5xdU5wZUFLOHdTU3ZqeG5OMUFzZE83SHgzM2t0dndWdjNlejlmODV4?=
 =?utf-8?B?Sld3V0NGUFVQcWhLeGlRRVdweWVtL0RaL0FSZnJ4NGZsazRoVXlMQXZsQzNj?=
 =?utf-8?B?RTd5WlVLekJmT1JaZ2NyMW5nYzZDRnNSQ1BZc1V5NTVqS0t1ZHU1N0h4b3Vt?=
 =?utf-8?B?ODdvV2VaRmxYTVcxU0xjMGcxVUFiZ0l2b0hVTmY1NldZU2pVMFVMdGtCTzRi?=
 =?utf-8?B?cmNlc2Q0TFQ4R0tJSU5mRXBoMFZsY3pwNStabkhvRHRKVXlKeTJrcVcxOCs5?=
 =?utf-8?B?M3g0ajgrMmVBNzlBRDhjMVBqbmVoMWhGbUdQOXNmYkdRQkRaK3pGVHVpOXhH?=
 =?utf-8?B?VXZIZU1PWXpQS1JDN09OMW1oaVk2MDU3TmI2SVFFUkxEWXFSTXpVcFNyUlBI?=
 =?utf-8?B?dTErTjVXekZPQ2t3Mno0VWNIcHpHQitkSVRVckErV0llbW9rV2h0NmYraHhX?=
 =?utf-8?B?SDhuaGFhWlo4c2lnR3lxNjNraDVHUk94ckZveDBoZDFxM0tFWUNiemF2a0hR?=
 =?utf-8?B?NkNXcUxVREFEd3daclNuZjg5RzAwSXd5K3FqOWlDMkIwZnhqdHhFR0J4Snl6?=
 =?utf-8?B?b01YNWlucTFZV0NRWFRUREwrTHcvYlVYZmg0MGtLelFuaE9tTWovQUtKTHpt?=
 =?utf-8?B?b1BERnE5d0duTXdKY211eWRxWFJWTkc3SEtidUFXYkMwRC85TlZxc0N1R240?=
 =?utf-8?B?UCtZVXFnOExHd0tOMlNkVHUyMUtmb2dBcDZPL3poVkNzK3Y4SDV2akZ3MjFN?=
 =?utf-8?B?MVRRSFY3eHlBUWxTdHdSTlZkVVZKamRYcHZzV2wzOGJWa1RHOS9udHZjeUlG?=
 =?utf-8?B?TnVnRSs4cWJiQjIybHRHMkcvZzRoaHVsM0JFWmlZUUljWlEwSGRRWVBNNlhN?=
 =?utf-8?B?YXQwUzczN2JLQWd0WjNRYVc5ZUFiMFN6WituZnYwMmdmNlVXNlhHWVBaTGdq?=
 =?utf-8?B?a1FTK0RqTkk1NEN6aTZMQm1FcDJhaUVpMkZZRThXa2RRVGtNYkJjUHdFQnV2?=
 =?utf-8?B?QTlINkh6ckNKYnNtT29wLzhXOXREc05VRm9IeDY0OGxsekdvdFBlOEIzdzls?=
 =?utf-8?B?V1NtM2VybTAwL3dZYjdrMmpKcktJbE53V2ZJcktNaUZGMlJpSE5rVkdpYTF1?=
 =?utf-8?B?aU9QUFhXNkdjM1QrRUFnK1ZrSjdjV1o1Zm15N0VDdkdybVMrZFc3M0ZEcmEr?=
 =?utf-8?B?SHM2Y0EvTWFjLy9rQWtHektUREpJM1Bpd09rSFEyZTdWNkZGOXBRc2NBbFVH?=
 =?utf-8?Q?Y5LWzbQpF/bDCBAfp2URsJVduuF5euEgcNx1SAR2OMHy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DACE9EE4376B7044BC84BB64E568C9AA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b5c375-0fab-4380-4f40-08de317cf3a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 08:29:46.3393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sQSSW47lBjfT7mQOPRJp30vlwLvwbHUftZMHhGT1Mi+2lGXM1rdoXCbXRecihfA7grwhD4qA9bUDyabRfWPaWb+I6rUMv3OXx4JZmEPhIjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7404
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

T24gTW9uLCAyMDI1LTEyLTAxIGF0IDA5OjAxICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBUaGlzIHRlc3QgaW50ZW50aW9uYWxseSB0cmlnZ2VycyBwYWdlIGZhdWx0cyBieSBh
Y2Nlc3NpbmcgcmVnaW9ucw0KPiB3aXRob3V0DQo+IHByZWZldGNoIGZvciBib3RoIEdQVXMgaW4g
YSBtdWx0aS1HUFUgZW52aXJvbm1lbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaXNoaXQgU2hh
cm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgdGVzdHMvaW50ZWwveGVf
bXVsdGlfZ3B1c3ZtLmMgfCAxNTENCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNTEgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL3Rlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jDQo+IGIvdGVzdHMvaW50ZWwveGVfbXVs
dGlfZ3B1c3ZtLmMNCj4gaW5kZXggZWZlM2RiMDk5Li43YTA2ZTI4OWMgMTAwNjQ0DQo+IC0tLSBh
L3Rlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX211
bHRpX2dwdXN2bS5jDQo+IEBAIC0xNSw2ICsxNSw3IEBADQo+IMKgDQo+IMKgI2luY2x1ZGUgInRp
bWUuaCINCj4gwqANCj4gKyNpbmNsdWRlICJ4ZS94ZV9ndC5oIg0KPiDCoCNpbmNsdWRlICJ4ZS94
ZV9pb2N0bC5oIg0KPiDCoCNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5oIg0KPiDCoCNpbmNsdWRlICJ4
ZS94ZV91dGlsLmgiDQo+IEBAIC04Niw2ICs4NywxNyBAQA0KPiDCoCAqCU1lYXN1cmUgbGF0ZW5j
eSBvZiBjcm9zcy1HUFUgbWVtb3J5IGNvcHkgb3BlcmF0aW9ucyB3aXRoDQo+IHByZWZldGNoDQo+
IMKgICoJdG8gZXZhbHVhdGUgY29weSBwZXJmb3JtYW5jZSB3aXRoIG1lbW9yeSBtaWdyYXRpb24g
dG8gbG9jYWwNCj4gVlJBTQ0KPiDCoCAqDQo+ICsgKiBTVUJURVNUOiBtZ3B1LXBhZ2VmYXVsdC1i
YXNpYw0KPiArICogRGVzY3JpcHRpb246DQo+ICsgKglUZXN0IGNyb3NzLUdQVSBwYWdlIGZhdWx0
IGhhbmRsaW5nIHdoZXJlIG9uZSBHUFUgd3JpdGVzIHRvDQo+IG1lbW9yeQ0KPiArICoJYW5kIGFu
b3RoZXIgR1BVIHJlYWRzLCB0cmlnZ2VyaW5nIHBhZ2UgZmF1bHRzIHdpdGhvdXQNCj4gcHJlZmV0
Y2ggdG8NCj4gKyAqCXZhbGlkYXRlIG9uLWRlbWFuZCBwYWdlIG1pZ3JhdGlvbiBhY3Jvc3MgR1BV
cw0KPiArICoNCj4gKyAqIFNVQlRFU1Q6IG1ncHUtcGFnZWZhdWx0LXByZWZldGNoDQo+ICsgKiBE
ZXNjcmlwdGlvbjoNCj4gKyAqCVRlc3QgY3Jvc3MtR1BVIG1lbW9yeSBhY2Nlc3Mgd2l0aCBwcmVm
ZXRjaCB0byB2ZXJpZnkgcGFnZQ0KPiBmYXVsdA0KPiArICoJc3VwcHJlc3Npb24gd2hlbiBtZW1v
cnkgaXMgcHJlLW1pZ3JhdGVkIHRvIHRhcmdldCBHUFUncyBWUkFNDQo+ICsgKg0KPiDCoCAqLw0K
PiDCoA0KPiDCoCNkZWZpbmUgTUFYX1hFX1JFR0lPTlMJOA0KPiBAQCAtMTA1LDYgKzExNyw3IEBA
DQo+IMKgI2RlZmluZSBNVUxUSUdQVV9DT0hfRkFJTAkJQklUKDUpDQo+IMKgI2RlZmluZSBNVUxU
SUdQVV9QRVJGX09QCQlCSVQoNikNCj4gwqAjZGVmaW5lIE1VTFRJR1BVX1BFUkZfUkVNX0NPUFkJ
CUJJVCg3KQ0KPiArI2RlZmluZSBNVUxUSUdQVV9QRkFVTFRfT1AJCUJJVCg4KQ0KPiDCoA0KPiDC
oCNkZWZpbmUgSU5JVAkyDQo+IMKgI2RlZmluZSBTVE9SRQkzDQo+IEBAIC0xNjIsNiArMTc1LDEx
IEBAIHN0YXRpYyB2b2lkIGdwdV9sYXRlbmN5X3Rlc3Rfd3JhcHBlcihzdHJ1Y3QNCj4geGVfc3Zt
X2dwdV9pbmZvICpzcmMsDQo+IMKgCQkJCcKgwqDCoMKgIHN0cnVjdA0KPiBkcm1feGVfZW5naW5l
X2NsYXNzX2luc3RhbmNlICplY2ksDQo+IMKgCQkJCcKgwqDCoMKgIHVuc2lnbmVkIGludCBmbGFn
cyk7DQo+IMKgDQo+ICtzdGF0aWMgdm9pZCBncHVfZmF1bHRfdGVzdF93cmFwcGVyKHN0cnVjdCB4
ZV9zdm1fZ3B1X2luZm8gKnNyYywNCj4gKwkJCQnCoMKgIHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8g
KmRzdCwNCj4gKwkJCQnCoMKgIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNl
ICplY2ksDQo+ICsJCQkJwqDCoCB1bnNpZ25lZCBpbnQgZmxhZ3MpOw0KPiArDQo+IMKgc3RhdGlj
IHZvaWQNCj4gwqBjcmVhdGVfdm1fYW5kX3F1ZXVlKHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmdw
dSwgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gwqAJCcKg
wqDCoCB1aW50MzJfdCAqdm0sIHVpbnQzMl90ICpleGVjX3F1ZXVlKQ0KPiBAQCAtOTIzLDYgKzk0
MSwxMjMgQEAgbGF0ZW5jeV90ZXN0X211bHRpZ3B1KHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8NCj4g
KmdwdTEsDQo+IMKgCWNsZWFudXBfdm1fYW5kX3F1ZXVlKGdwdTIsIHZtWzFdLCBleGVjX3F1ZXVl
WzFdKTsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMgdm9pZA0KPiArcGFnZWZhdWx0X3Rlc3RfbXVs
dGlncHUoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MSwNCj4gKwkJCXN0cnVjdCB4ZV9zdm1f
Z3B1X2luZm8gKmdwdTIsDQo+ICsJCQlzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5j
ZSAqZWNpLA0KPiArCQkJdW5zaWduZWQgaW50IGZsYWdzKQ0KPiArew0KPiArCXVpbnQ2NF90IGFk
ZHI7DQo+ICsJdWludDY0X3QgYWRkcjE7DQo+ICsJdWludDMyX3Qgdm1bMl07DQo+ICsJdWludDMy
X3QgZXhlY19xdWV1ZVsyXTsNCj4gKwl1aW50MzJfdCBiYXRjaF9ib1syXTsNCj4gKwl1aW50NjRf
dCBiYXRjaF9hZGRyWzJdOw0KPiArCXN0cnVjdCBkcm1feGVfc3luYyBzeW5jID0ge307DQo+ICsJ
dWludDY0X3QgKnN5bmNfYWRkcjsNCj4gKwl1aW50MzJfdCBmaW5hbF9yZXN1bHQ7DQo+ICsJdm9p
ZCAqZGF0YSwgKnZlcmlmeV9yZXN1bHQ7DQo+ICsJY29uc3QgY2hhciAqcGZfY291bnRfc3RhdCA9
ICJzdm1fcGFnZWZhdWx0X2NvdW50IjsNCj4gKwlpbnQgcGZfY291bnRfZ3B1MV9iZWZvcmUsIHBm
X2NvdW50X2dwdTFfYWZ0ZXI7DQo+ICsJaW50IHBmX2NvdW50X2dwdTJfYmVmb3JlLCBwZl9jb3Vu
dF9ncHUyX2FmdGVyOw0KPiArCWJvb2wgcHJlZmV0Y2hfcmVxID0gZmxhZ3MgJiBNVUxUSUdQVV9Q
UkVGRVRDSDsNCj4gKw0KPiArCS8qIFNraXAgaWYgZWl0aGVyIEdQVSBkb2Vzbid0IHN1cHBvcnQg
ZmF1bHRzICovDQo+ICsJaWYgKG1ncHVfY2hlY2tfZmF1bHRfc3VwcG9ydChncHUxLCBncHUyKSkN
Cj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJY3JlYXRlX3ZtX2FuZF9xdWV1ZShncHUxLCBlY2ksICZ2
bVswXSwgJmV4ZWNfcXVldWVbMF0pOw0KPiArCWNyZWF0ZV92bV9hbmRfcXVldWUoZ3B1MiwgZWNp
LCAmdm1bMV0sICZleGVjX3F1ZXVlWzFdKTsNCj4gKw0KPiArCWRhdGEgPSBhbGlnbmVkX2FsbG9j
KFNaXzJNLCBTWl80Syk7DQo+ICsJaWd0X2Fzc2VydChkYXRhKTsNCj4gKwltZW1zZXQoZGF0YSwg
MCwgU1pfNEspOw0KPiArCWFkZHIgPSB0b191c2VyX3BvaW50ZXIoZGF0YSk7DQo+ICsNCj4gKwkv
KiBBbGxvY2F0ZSB2ZXJpZmljYXRpb24gYnVmZmVyIGZvciBHUFUyIHRvIGNvcHkgaW50byAqLw0K
PiArCXZlcmlmeV9yZXN1bHQgPSBhbGlnbmVkX2FsbG9jKFNaXzJNLCBTWl80Syk7DQo+ICsJaWd0
X2Fzc2VydCh2ZXJpZnlfcmVzdWx0KTsNCj4gKwlhZGRyMSA9IHRvX3VzZXJfcG9pbnRlcih2ZXJp
ZnlfcmVzdWx0KTsNCj4gKw0KPiArCS8qID09PSBQaGFzZSAxOiBHUFUxIHdyaXRlcyB0byBhZGRy
ID09PSAqLw0KPiArCXBmX2NvdW50X2dwdTFfYmVmb3JlID0geGVfZ3Rfc3RhdHNfZ2V0X2NvdW50
KGdwdTEtPmZkLCBlY2ktDQo+ID5ndF9pZCwgcGZfY291bnRfc3RhdCk7DQo+ICsNCj4gKwkvKiBH
UFUxIC0tPiBDcmVhdGluZyBiYXRjaCB3aXRoIHZhbHVlIGFuZCBleGVjdXRpbmcgU1RPUkUgb3AN
Cj4gKi8NCj4gKwlncHVfYmF0Y2hfY3JlYXRlKGdwdTEsIHZtWzBdLCBleGVjX3F1ZXVlWzBdLCBh
ZGRyLCAwLA0KPiArCQkJICZiYXRjaF9ib1swXSwgJmJhdGNoX2FkZHJbMF0sIGZsYWdzLA0KPiBE
V09SRCk7DQo+ICsNCj4gKwkvKkdQVTE6IE1hZHZpc2UgYW5kIFByZWZldGNoIE9wcyAqLw0KPiAr
CWdwdV9tYWR2aXNlX3N5bmMoZ3B1MSwgdm1bMF0sIGV4ZWNfcXVldWVbMF0sIGFkZHIsDQo+ICZi
YXRjaF9hZGRyWzBdLCBmbGFncyk7DQo+ICsNCj4gKwlwZl9jb3VudF9ncHUxX2FmdGVyID0geGVf
Z3Rfc3RhdHNfZ2V0X2NvdW50KGdwdTEtPmZkLCBlY2ktDQo+ID5ndF9pZCwgcGZfY291bnRfc3Rh
dCk7DQo+ICsNCj4gKwlpZiAocHJlZmV0Y2hfcmVxKSB7DQo+ICsJCS8qIFdpdGggcHJlZmV0Y2g6
IGV4cGVjdCBOTyBwYWdlIGZhdWx0cyAqLw0KPiArCQlpZ3RfYXNzZXJ0X2VxKHBmX2NvdW50X2dw
dTFfYWZ0ZXIsDQo+IHBmX2NvdW50X2dwdTFfYmVmb3JlKTsNCj4gKwkJaWd0X2luZm8oIkdQVTEg
d3JpdGUgd2l0aCBwcmVmZXRjaDogTm8gcGFnZSBmYXVsdHMNCj4gKGFzIGV4cGVjdGVkKVxuIik7
DQo+ICsJfSBlbHNlIHsNCj4gKwkJLyogV2l0aG91dCBwcmVmZXRjaDogZXhwZWN0IHBhZ2UgZmF1
bHRzICovDQo+ICsJCWlndF93YXJuX29uX2YocGZfY291bnRfZ3B1MV9hZnRlciA+DQo+IHBmX2Nv
dW50X2dwdTFfYmVmb3JlLA0KPiArCQkJwqDCoMKgwqDCoCAiJWQgcGFnZSBmYXVsdHMgZ2VuZXJh
dGVkIG9uIEdQVTFcbiIsDQo+ICsJCQnCoMKgwqDCoMKgIHBmX2NvdW50X2dwdTFfYWZ0ZXIgLQ0K
PiBwZl9jb3VudF9ncHUxX2JlZm9yZSk7DQo+ICsJCWlndF9pbmZvKCJHUFUxIHdyaXRlIHdpdGhv
dXQgcHJlZmV0Y2g6ICVkIHBhZ2UNCj4gZmF1bHRzXG4iLA0KPiArCQkJIHBmX2NvdW50X2dwdTFf
YWZ0ZXIgLQ0KPiBwZl9jb3VudF9ncHUxX2JlZm9yZSk7DQo+ICsJfQ0KPiArDQo+ICsJZmluYWxf
cmVzdWx0ID0gUkVBRF9PTkNFKCoodWludDMyX3QgKilhZGRyKTsNCj4gKwlpZ3RfZGVidWcoIkdQ
VTEgd3JvdGUgOiV1XG4iLCBmaW5hbF9yZXN1bHQpOw0KDQpTYW1lIGhlcmUgYXMgaW4gYSBwcmV2
aW91cyB0ZXN0LiBUaGUgcmVhZCBtaWdyYXRlcyB0byBzeXN0ZW0gYW5kDQpkZWNvdXBsZXMgdGhl
IHRlc3QgdG8gdHdvIHNpbmdsZS1ncHUgdGVzdHMuDQoNCk90aGVyd2lzZSBMR1RNDQoNCi9UaG9t
YXMNCg0KDQo=
