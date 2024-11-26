Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD89D3B7CA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 09:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3985C10E3F7;
	Tue, 26 Nov 2024 09:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSn/XyW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FC410E3F7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732612624; x=1764148624;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=97aMOEYG66u0q18lRHzl2NwowHGV/f/KAh5rjkGq+rs=;
 b=PSn/XyW5l98SvyQW08m2PEY2y7xRLVwXDIhOwvm0/ky4BjRBpbwrzb5r
 su/4uUyHM3NY3Oh1mhsL3JmFcvuxkv/eqY2IhOHTGM/j0ckVBoS1laww1
 bFfc6DGkrffSCTz+nYgUzwdV/EXzeCj/G7WnB9AYoeCx2oIdxKpiDwtDx
 3iQtM8RasRarEODGcHCGoir9ksKsvS/kag2HrLx3OzcVOvpypjUDqIHIx
 2bMPF2Y8vu8pPfuhrXGANyY0AR4oWOqau1xxB0JPCQ+lhyTX3sNnhmW8k
 yepkdhV75aZfZHaZegS3+Cu+QhzGPOpgWr7Uf0Jbzji5uzxDx4Vyrk/BI g==;
X-CSE-ConnectionGUID: QQihkqOCSzqIU17m4clWdA==
X-CSE-MsgGUID: B1l6LnuuSzqZmQcjsHeuKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="55259616"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="55259616"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 01:17:04 -0800
X-CSE-ConnectionGUID: Rk5XrtUHSJ+qJlSVnfcO2g==
X-CSE-MsgGUID: ZR3w36SQTn2QqCC6ue+oYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="95971986"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 01:17:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 01:17:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 01:17:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 01:17:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFIT2hkE1SQ22Ts79p4J0cVd265FcaY+elkXGatqNShTphLK4sgMubSHCwFXh0R+9y5Sqeipxw5uDGPA0PlvT3/DZHoCVIFUPDlmXRJxaJdHGz7qmV3rl8Q2tnnRqt5a3iK3DJrEVylOBN7+lJYYDGMUHj1XA03+CbpcQ/qI4b7qM0detu/8FevzpfCJJ0g1exDxj9tSXcNaX7zKeoe2otRyujd3sZR+lg7sBzwRGTeU4vDRCz2YZqoRh5tqeUKALQmnVHTDHjPOLU2bJikIn+gHGRHT77bODneDeuGXf1cuzxG5YeJl+T9iZHfa5nYiSYo1ljXsqWo1N3cdWGmhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97aMOEYG66u0q18lRHzl2NwowHGV/f/KAh5rjkGq+rs=;
 b=M9fgYqu+mlrjKH1EVsDZF0vTUjGTx8ebaBP/33vdIg2l80kseQh4BadglloOFezNbDrkcAmEHir/N4Atu3dJxO7McHnRxQlECcJFO1lxRKOgdRGXr+Lavq2BgKXijQd1vSvxZcmtPa+l6sjHdW8Koa3/MbESg8bOnwa0+gNvYuAcfEoxuFMvRc3BElVlZgmispMvPLbBPOq2ko4zj0aGiYxc6hV0NtGeZhiZnFeYW9TnMOC/sYXh42DLsXy3L3Lc4u+P19PwFD5tzKDFVxFFwmsHmmV9ywHYu+s7+wGpDtK1WkHxGrRV7f85AptHftmeZ893IK5z1JD5mQZ7Mqwa+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 09:16:59 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 09:16:59 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Maslak, 
 Jan" <jan.maslak@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] lib/xe_query: add xe_hwconfig_lookup_value() helper
Thread-Topic: [PATCH 2/3] lib/xe_query: add xe_hwconfig_lookup_value() helper
Thread-Index: AQHbO5uo6F4HYLS1xEOQ0uh7Ktg2B7LJT76AgAAA7IA=
Date: Tue, 26 Nov 2024 09:16:59 +0000
Message-ID: <062711dc510ad61bf5b10cf317462fae33799f93.camel@intel.com>
References: <20241120222850.1497784-1-jan.maslak@intel.com>
 <20241120222850.1497784-3-jan.maslak@intel.com>
 <8fa0c3c95b39349d40d73ce41811ccfafdd6c275.camel@intel.com>
In-Reply-To: <8fa0c3c95b39349d40d73ce41811ccfafdd6c275.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|PH7PR11MB6699:EE_
x-ms-office365-filtering-correlation-id: 8dea918c-1542-4467-c74e-08dd0dfb150e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dFJDUTdnTUpkNjJCY2VESUJBRExWR0RWL3YyODBmd3Jhb0NKSXQrQzI0N0s5?=
 =?utf-8?B?OWJEU0JWNk4xbUlldi9ZRXdVSTRsNGVia2ZxcGpyY2pGRWtkbWxiY01IVXB4?=
 =?utf-8?B?clNzbUc1WGJPWUxjTGZHK0oreU9aNkNqWHFJQ1BOdVkxQ3BCMmNGU2NLTlF2?=
 =?utf-8?B?RXc2N01xeUdldFppcDVSQ1Nsa2dOaHJCV0dTMkZNandOOUY4YUZJTWUzc3pv?=
 =?utf-8?B?VTlDN2JodzAxbDl6M1A2Mmt4bHZHOTRMSzFUL05LazNMM0NTUTBlNjBwU2ov?=
 =?utf-8?B?dzJPSm5EQk5tUWFFTXBFeHlSWTV6NnFMdXgyUlhRbHFWTDJ0eW1RTksrVWIw?=
 =?utf-8?B?ZENPUVQrNXM1MXFFVVFvMW53RWdIdHl1WDlyNmNTcXFyVXRXQ21TamhJb2lD?=
 =?utf-8?B?Q2lybnZPNzd4VHh5aHV5TDZlOHk4NEs4Vzg2TC9Wa2VjTXIyeERQcWNGdTQ4?=
 =?utf-8?B?VlpyeXY3NzFnN09iNlpxVjFPZEtvb2lEUzJnVmNSQ1ZtQmJyZkpidEo0SzRN?=
 =?utf-8?B?a1NIV1p6cm5XbEJBcDF5OUJUWjJlRTB5Ri9FdDFBRkxld1M0YWpDZGN2Wk5z?=
 =?utf-8?B?OXhNSEZFbWNsdTVRN2FzN3BmSHIrcEkwMVlwWnhnWENwbjlLd1dLN3dtM25J?=
 =?utf-8?B?ZyswSGVCTkFSNCtkNCtHNzQ3ekxvK295S0Z2Y0duMXJLdEI5VGR6WHpJWkly?=
 =?utf-8?B?ZFRGclVta2RFL2kzYjBSYnd2WnpYMFVIRloyc3d4VmVCUllTb1pERTVpelZp?=
 =?utf-8?B?MzcxNHNTT09YUVA5aXZzY0g0OEErdlgyVDUzZkRLSGJJVzA5aWhhVVNXV2NJ?=
 =?utf-8?B?QUtSczFuZ2hhOFpZMjlMTTVEMlVkaWNqdFJJQnRDaGxyTHBmWmVMckNmRnpH?=
 =?utf-8?B?UUh2KzZsVlgwVDUyZmExbjNNVlgxRlhDT0l0eEE5Zkd6R2pNVGFRM05jZjcz?=
 =?utf-8?B?Tkp1UDYwMzA1RFVPYm1WNW1rcWxMTzRzUUdOTER1U2p4T1NKeTgxOTk5MkpE?=
 =?utf-8?B?ZXBGZFROekREeTFscTI0TlU3bG9ReWVBMDZsY2l1NUVXK1hvTjhPaUY5Sk1B?=
 =?utf-8?B?S09WMlRTZVArR1FxekpsMDM3K2N6N2pZa3hHYTcwMWx6cHRpejRKdm9pWHJi?=
 =?utf-8?B?aXh0MFJDZmFvSmZHa0NBK2VSSmFwTHkyV1pOV040SnlvOENFbHdFTWhHVGFD?=
 =?utf-8?B?eGJrVDdQWFRQbUMwVmsyKytWWmFxQmRLSGg4aFhuOURic0o2TmlOK29KS2hI?=
 =?utf-8?B?bW10VlNGTldqN2JmWHJKa3VlbVpNUzhqVURpR2Jwb2ZLWHBJYXkySnhMYzVM?=
 =?utf-8?B?WkFORlhxWHNXMXlWM3lpbkRMZ0lsTVpKYmMzemRjRUppamJmYU11b3R4bmUv?=
 =?utf-8?B?SC9Va1JKNStxQmxCQXl1cU1YQkZLLzFsaFcvR0poK1Q2OXFLeTlGRUI2RlJm?=
 =?utf-8?B?M1pDbjlHOUtqc2ZiVDNYK3BDRVRUYWFld0N1N093Z2owdjZhd1F0eStSa1lp?=
 =?utf-8?B?aE11QzQ4eVJ4NDBIcG5UZnlLbjdrTWgxQU1DK0hrVS9xMWh2QVIwcjE0b29x?=
 =?utf-8?B?eFNrSmlRbEs1MTlSQmpESTJiK2UrcHNyZHN1cktqTWs1dW04Q3ZsdlBrRER6?=
 =?utf-8?B?RmNhRVRiK1NBWFFBcVdVdW1NSFZ3c01RcnhhemxadDlrRzF6MEYwTVBmc0V3?=
 =?utf-8?B?Q1oxUHVabm1pYXZPZ2JSbTAvSmdFbmcvTVlvMTJHdnVpMWk3Y0xzaFhKcENh?=
 =?utf-8?B?MHpzZ1RBbTJmV05qWkNoeWV4NkRQZzJJcHFZdDlCbVFsZ0h5N3ExMXE1Y2ZJ?=
 =?utf-8?B?V0NJMCs0V0IydU8rOCtQeU1iWTl2RDFDZDVwZHJTbkFZc25EbnlXM1g0OFZG?=
 =?utf-8?B?cGZXbHdVcFFtZ1N3cjR4K0lzUjZ2bmh1Nm12UGhoY1RhWUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEpVTjNpbHJkbmdvYUwrSE9CckxnS084Ym5HVGNYeGZ6SzkxR2ZIOHM5M0li?=
 =?utf-8?B?YnZEaWxaSVF4UUVha2lubUVoQlFlM2tlSWUyUnh2bmpBcWlGOU9Wc2FTeWFO?=
 =?utf-8?B?OFZKREpPQXo0ay9mZ05Cc282NXpmVjRNd3owemtKRFgzWnhmaXNaSGVoem9l?=
 =?utf-8?B?Vm5aQ3J4WWUzRG1pemZ1QStkMlVzdUZKcXdlTW5iNUZzcDBCWndmM09RS1Nq?=
 =?utf-8?B?MVZSV3ZpeDlncDIybHo3M0pGOTdXSTJoazgxeE1zc3g2MVJkV3VTbWROUDFV?=
 =?utf-8?B?ZW5WbGdvU21BMGlBOWNXZi9KTkF2RW90cVJ4UDRhejFCWE81OFN0RlJKL2pR?=
 =?utf-8?B?L3ZsNzF5K29yZ2ZxZEM2SldwU0RWbHhmQWtGOGtBUlVOUmlmRFp1VWlWYkVG?=
 =?utf-8?B?YldZZ3N0Nm1pVThEV2ZxSE9JL1FDNWhHVkhGNmk5U3M0QlVJYjJsc0VxWU9x?=
 =?utf-8?B?ekp6Sk1GUmFKd3p6dU9LTDJheFJpR0ZueE5HbFRBa1BoSFpuVTFhSjVMZnpn?=
 =?utf-8?B?NGJZSGNwaHBuRUwrZUlRdnpmc2ZPTkZWajJBQU43c0xRSW12ZC9rOXBQQy9Z?=
 =?utf-8?B?WmpEK0Mvd2I4S2lTRnBJTE44QnB1L0NwVExlY2w4OWNPVERzKzNpT2dlQlRm?=
 =?utf-8?B?cW55aEw4bE5ybHEyc3FNdmYxQ2RNaERZLzNnQ1h6SmFSVzQ3dXQrSFR6cmFp?=
 =?utf-8?B?bWJ4K3NTZEhkY2w2SFlyYmdoazRJTlNhS29JYWxMc1pwVFp6UU9sS3dDdk9M?=
 =?utf-8?B?ZkJnaThna3QzUzJpZmRZOUNMbFNzTU5YZTliMkJCTmxoYUlSbzNuK1R0ZjFv?=
 =?utf-8?B?NVBWWld1V2JpOGFSTytyeWlXdVpMeUprZVV4TnVYWW5PSlA2V1VUODdwdlhL?=
 =?utf-8?B?bkkzakpSNWtuUzNEVmpWZTN6Z1AwRitLMStENHYzOE9Ha0kydXZtcllITHN6?=
 =?utf-8?B?cTB5S2MzZFZ6RDNjY0R2RFE4WWxpbHBWaVdGbithdU0yWkNaMXpNeWUxdUxv?=
 =?utf-8?B?aUdhY2JQZzk4WTdnQVhOQUpEcDhVY0tZRER0YVJsbXNXVjRGZmlSN3FZa0pR?=
 =?utf-8?B?S0FITHFsQkRjYjNiZFhoRHZSTy8zdWpuNHZNMEdYdkxxTVpMdnZweVhMNTBl?=
 =?utf-8?B?UzZnS29IU2hBR2lpd1hBcHRwdEQ3YVNYQndBTlNDRElWSVRoYThYZTlKTThY?=
 =?utf-8?B?bnhPQVNsMHlIRTNxUUJmb3BMd0V0VnNFRkk1NlU5Q2JjQlk3NDAzRld2Ukpk?=
 =?utf-8?B?QmxKQWhVNWF2SXZzVEM1Yk9MTHByMFpKb29OU1dtdXpDQlk0OC9VMEdvbHky?=
 =?utf-8?B?ajBaQjl0UWg4cGlkd24rZy9IVHpsRS9WR0ZLSFYyOHNoQ01mOUpYN1lFY3or?=
 =?utf-8?B?R2ljdEFQVkxjN21zM09yN2FVb0hYREJmNVZpYzdPME1lOEJYNHRrQnNEWFdo?=
 =?utf-8?B?T3BxbSs0V1ppaDloRFhzem9nVWVqUExDRVhnbGgxSUwwSVA0V1ZmLzdtR1k2?=
 =?utf-8?B?ejIyRHNSaUNGc3VwbmR6MFNFbW1EclFWM2pROXRkZTdrZ1A2U0hlOGhqOXpU?=
 =?utf-8?B?ZVp6QzdicUliTGxTcVVkd01RR3RmMHVWS1FmZGgxOEM3KzhsdHpLQTMxVlNG?=
 =?utf-8?B?QVlxZ2pkUVRVZkd2aUo3RlkzWWVCY1daUnpIQXE1bVNkR3hkRTdvOHQ5QkN2?=
 =?utf-8?B?NkdSV01OeFhsNDJVQU56cFBralhIV3NkNTNuK3B4Mnc0Z1Jld2F3WVUzRXRO?=
 =?utf-8?B?Sm5LRUVjOEI0M0VtUmNhZ2JUQVZCai9PM3FRTFNFbTltRXNIWFB6cEtuWjhj?=
 =?utf-8?B?Q09TVjVMZHlxU2hpazByNDNndnhtVzgrUmhLN0w0WWJ2cW1nSkVZS2dMUkZR?=
 =?utf-8?B?YkxUaTJMM29LOFp6dVdpc093ZFhJSVYrVnZPVFBvWmQwMGVWQVgzN0kwWDdL?=
 =?utf-8?B?cm5GaXZNdkI5aGdvMGdLWlFPR1libE1IMld1VmgxcWxFa2RpbkpMK3dySUIx?=
 =?utf-8?B?akJpRDRpdUxXSlcvWEU5NzJLNTZLU2lKQkZlR1Fvell5aS81R1NxbnRsY2ts?=
 =?utf-8?B?cUdXaHdsYjVDakJldldFMk5taEU5OXVBMS9VZjZuNjhCWll0K3FRUFAwbUxs?=
 =?utf-8?B?RFpIQXFYMStVQnRLU0t0WjBLbGJqU0tMZGY4WXMrcHY1RHBXejlHQk1pb1Rz?=
 =?utf-8?Q?AAT+Rm41OMQ2FMOWZufHIek=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE88BE46D9C688498E704EDB6D1FA28F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dea918c-1542-4467-c74e-08dd0dfb150e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 09:16:59.7647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y8HNfX1JeVebXfz6KiFBnRucMLNSMEiCvRNuiI0WcO6D/LbfPrP5YrSmhmjETEvZkzSt4J6qNm8i/jOjRAEqcIEkL0gYvbisOYltm8xwFVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

T24gVHVlLCAyMDI0LTExLTI2IGF0IDEwOjEzICswMTAwLCBEb21pbmlrIEdyemVnb3J6ZWsgd3Jv
dGU6DQo+IE9uIFdlZCwgMjAyNC0xMS0yMCBhdCAyMjoyOCArMDAwMCwgSmFuIE1hc2xhayB3cm90
ZToNCj4gSGkgSmFuLA0KPiANCj4gPiBBZGQgYSBuZXcgaGVscGVyIGZ1bmN0aW9uLCB4ZV9od19j
b25maWdfbG9va3VwX3ZhbHVlKCksIHRoYXQNCj4gPiByZXR1cm5zIGEgcG9pbnRlciB0byB0aGUg
dmFsdWUgb2YgYSBnaXZlbiBod2NvbmZpZyBhdHRyaWJ1dGUuDQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogSmFuIE1hc2xhayA8amFuLm1hc2xha0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGxp
Yi94ZS94ZV9xdWVyeS5jIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4gPiAgbGliL3hlL3hlX3F1ZXJ5LmggfCAgMiArKw0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDQ2IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hl
X3F1ZXJ5LmMgYi9saWIveGUveGVfcXVlcnkuYw0KPiA+IGluZGV4IDQ5YmVkMDMzYi4uNzNjOGVk
OTQ4IDEwMDY0NA0KPiA+IC0tLSBhL2xpYi94ZS94ZV9xdWVyeS5jDQo+ID4gKysrIGIvbGliL3hl
L3hlX3F1ZXJ5LmMNCj4gPiBAQCAtODM5LDYgKzgzOSw1MCBAQCB1aW50MTZfdCB4ZV9ndF9nZXRf
dGlsZV9pZChpbnQgZmQsIGludCBndCkNCj4gPiAgCXJldHVybiB4ZV9kZXYtPmd0X2xpc3QtPmd0
X2xpc3RbZ3RdLnRpbGVfaWQ7DQo+ID4gIH0NCj4gPiAgDQo+ID4gKy8qKg0KPiA+ICsgKiB4ZV9o
d2NvbmZpZ19sb29rdXBfdmFsdWU6DQo+ID4gKyAqIEBmZDogeGUgZGV2aWNlIGZkDQo+ID4gKyAq
IEBhdHRyaWJ1dGU6IGh3Y29uZmlnIGF0dHJpYnV0ZSBpZA0KPiA+ICsgKiBAbGVuOiBwb2ludGVy
IHRvIHN0b3JlIGxlbmd0aCBvZiB0aGUgdmFsdWUNCj4gPiArICoNCj4gPiArICogUmV0dXJucyBh
IHBvaW50ZXIgdG8gdGhlIHZhbHVlIG9mIHRoZSBod2NvbmZpZyBhdHRyaWJ1dGUgQGF0dHJpYnV0
ZSBhbmQNCj4gPiArICogd3JpdGVzIHRoZSBsZW5ndGggb2YgdGhlIHZhbHVlIHRvIEBsZW4uDQo+
IA0KPiBOaXQ6IEltbyBpdCB3b3VsZCBiZSB3b3J0aCB0byB1bmRlcmxpbmUgdGhhdCBsZW4gaXMg
aW4gdW5pdHMgb2YgdWludDMyX3QsDQo+IG5vdCBhcyBzb21lb25lIGNvdWxkIHRoaW5rIGluIGJ5
dGVzLiBNYXliZSBzdGggbGlrZToNCj4gICAgICogd3JpdGVzIHRoZSBudW1iZXIgb2YgdWludDMy
X3QgZWxlbWVudHMgaWRpY2F0aW5nIHRoZSBsZW5naHQgb2YgdGhlIHZhbHVlIHRvIEBsZW4uDQpT
b3JyeSwgSSBtYWRlIHR3byB0eXBvcyBoZXJlOg0KDQpzL2lkaWNhdGluZy9pbmRpY2F0aW5nLw0K
cy9sZW5naHQvbGVuZ3RoLw0KDQpSZWdhcmRzLMKgDQpEb21pbmlrDQoNCj4gDQo+ID4gKyAqIFRo
ZSBjYWxsZXIgaXMgcmVzcG9uc2libGUgZm9yIGZyZWVpbmcgdGhlIHJldHVybmVkIHBvaW50ZXIu
DQo+ID4gKyAqLw0KPiA+ICt1aW50MzJfdCAqeGVfaHdjb25maWdfbG9va3VwX3ZhbHVlKGludCBm
ZCwgZW51bSBpbnRlbF9od2NvbmZpZyBhdHRyaWJ1dGUsIHVpbnQzMl90ICpsZW4pDQo+ID4gK3sN
Cj4gPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlX2RldjsNCj4gPiArCXVpbnQzMl90ICpod2NvbmZp
ZzsNCj4gPiArCXVpbnQzMl90IHBvcywgaHdjb25maWdfbGVuOw0KPiA+ICsJdWludDMyX3QgKnZh
bHVlID0gTlVMTDsNCj4gPiArDQo+ID4gKwl4ZV9kZXYgPSBmaW5kX2luX2NhY2hlKGZkKTsNCj4g
PiArCWlndF9hc3NlcnQoeGVfZGV2KTsNCj4gPiArDQo+ID4gKwlod2NvbmZpZyA9IHhlX2Rldi0+
aHdjb25maWc7DQo+ID4gKwlpZ3RfYXNzZXJ0KGh3Y29uZmlnKTsNCj4gPiArDQo+ID4gKwkvKiBF
eHRyYWN0IHRoZSB2YWx1ZSBmcm9tIHRoZSBod2NvbmZpZyAqLw0KPiA+ICsJcG9zID0gMDsNCj4g
PiArCWh3Y29uZmlnX2xlbiA9IHhlX2Rldi0+aHdjb25maWdfc2l6ZSAvIHNpemVvZih1aW50MzJf
dCk7DQo+ID4gKwl3aGlsZSAocG9zICsgMiA8IGh3Y29uZmlnX2xlbikgew0KPiA+ICsJCXVpbnQz
Ml90IGF0dHJpYnV0ZV9pZCA9IGh3Y29uZmlnW3Bvc107DQo+ID4gKwkJdWludDMyX3QgYXR0cmli
dXRlX2xlbiA9IGh3Y29uZmlnW3BvcyArIDFdOw0KPiA+ICsJCXVpbnQzMl90ICphdHRyaWJ1dGVf
ZGF0YSA9ICZod2NvbmZpZ1twb3MgKyAyXTsNCj4gPiArDQo+ID4gKwkJaWYgKGF0dHJpYnV0ZV9p
ZCA9PSBhdHRyaWJ1dGUpIHsNCj4gPiArCQkJdmFsdWUgPSBtYWxsb2MoYXR0cmlidXRlX2xlbiAq
IHNpemVvZih1aW50MzJfdCkpOw0KPiA+ICsJCQlpZ3RfYXNzZXJ0KHZhbHVlKTsNCj4gPiArCQkJ
bWVtY3B5KHZhbHVlLCBhdHRyaWJ1dGVfZGF0YSwgYXR0cmlidXRlX2xlbiAqIHNpemVvZih1aW50
MzJfdCkpOw0KPiA+ICsJCQkqbGVuID0gYXR0cmlidXRlX2xlbjsNCj4gPiArCQkJYnJlYWs7DQo+
IA0KPiBJIHRoaW5rIHdlIGNvdWxkIGp1c3QgcmV0dXJuIGFuIGFkZHJlc3MgdG8gY2FjaGVkIGh3
Y29uZmlnIGFzIGl0IHJlbWFpbnMgdmFsaWQgdW50aWwNCj4gdGhlIGxhc3QgdXNlciBjYWxscyBk
cm1fY2xvc2VfZHJpdmVyKCkuIENhbGxlciB3b3VsZCBiZSBubyBsb25nZXIgcmVzcG9uc2libGUg
Zm9yDQo+IGZyZWVpbmcgcmV0dXJuZWQgcG9pbnRlci4NCj4gDQo+IEltbywgeW91ciBhcHByYWNo
IGlzIGEgbGl0dGxlIGJpdCBjbGVhbmVyLCBob3dldmVyIGxvb2tpbmcgYXQgb3RoZXIgc2ltaWxs
YXINCj4gY2FzZXMgKGUuZy4geGVfbWVtX3JlZ2lvbiwgeGVfZW5naW5lKSBpdCBsb29rcyBsaWtl
IHRoZSBwcmVmZXJlbmNlIGlzIA0KPiBkaWZmZXJlbnQuIEkgd291bGQgcHJvcG9zZSB0byBtYWtl
IGl0IGNvaGVyZW50IHdpdGggYmVoYXZpb3VyIGFscmVhZHkgcHJlc2VudCBpbiANCj4gdGhhdCBs
aWJyYXJ5LiANCj4gDQo+IA0KPiBSZWdhcmRzLCANCj4gRG9taW5paw0KPiA+ICsJCX0NCj4gPiAr
CQlwb3MgKz0gMiArIGF0dHJpYnV0ZV9sZW47DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJu
IHZhbHVlOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBpZ3RfY29uc3RydWN0b3INCj4gPiAgew0KPiA+
ICAJeGVfZGV2aWNlX2NhY2hlX2luaXQoKTsNCj4gPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX3F1
ZXJ5LmggYi9saWIveGUveGVfcXVlcnkuaA0KPiA+IGluZGV4IGY4ODM2NTc4ZS4uMzBlYTVhZDQx
IDEwMDY0NA0KPiA+IC0tLSBhL2xpYi94ZS94ZV9xdWVyeS5oDQo+ID4gKysrIGIvbGliL3hlL3hl
X3F1ZXJ5LmgNCj4gPiBAQCAtMTUsNiArMTUsNyBAQA0KPiA+ICAjaW5jbHVkZSAiaWd0X2F1eC5o
Ig0KPiA+ICAjaW5jbHVkZSAiaWd0X2xpc3QuaCINCj4gPiAgI2luY2x1ZGUgImlndF9zaXplcy5o
Ig0KPiA+ICsjaW5jbHVkZSAiaW50ZWxfaHdjb25maWdfdHlwZXMuaCINCj4gPiAgDQo+ID4gICNk
ZWZpbmUgWEVfREVGQVVMVF9BTElHTk1FTlQgICAgICAgICAgIFNaXzRLDQo+ID4gICNkZWZpbmUg
WEVfREVGQVVMVF9BTElHTk1FTlRfNjRLICAgICAgIFNaXzY0Sw0KPiA+IEBAIC0xMTgsNiArMTE5
LDcgQEAgc3RydWN0IGRybV94ZV9lbmdpbmUgKnhlX2ZpbmRfZW5naW5lX2J5X2NsYXNzKGludCBm
ZCwgdWludDE2X3QgZW5naW5lX2NsYXNzKTsNCj4gPiAgYm9vbCB4ZV9oYXNfbWVkaWFfZ3QoaW50
IGZkKTsNCj4gPiAgYm9vbCB4ZV9pc19tZWRpYV9ndChpbnQgZmQsIGludCBndCk7DQo+ID4gIHVp
bnQxNl90IHhlX2d0X2dldF90aWxlX2lkKGludCBmZCwgaW50IGd0KTsNCj4gPiArdWludDMyX3Qg
KnhlX2h3Y29uZmlnX2xvb2t1cF92YWx1ZShpbnQgZmQsIGVudW0gaW50ZWxfaHdjb25maWcgYXR0
cmlidXRlLCB1aW50MzJfdCAqbGVuKTsNCj4gPiAgDQo+ID4gIHN0cnVjdCB4ZV9kZXZpY2UgKnhl
X2RldmljZV9nZXQoaW50IGZkKTsNCj4gPiAgdm9pZCB4ZV9kZXZpY2VfcHV0KGludCBmZCk7DQo+
IA0KDQo=
