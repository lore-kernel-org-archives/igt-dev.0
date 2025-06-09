Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D63C61CE8
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 13:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E64610E11E;
	Mon,  9 Jun 2025 13:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2uo6sky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE3710E11E
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 13:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749475770; x=1781011770;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KnB1c+AzY8wEJ2rfpHXvj31dtUxorU5aZjSkonxDb28=;
 b=e2uo6skyXsQcNxoPsxYzvmzs01d/fgVp17ICrTHMZ8rd+vYeCInQDaPd
 AX9932sSfxzW3lX9KkY8+6HvCg9ePD9FL292fwau8iB58cdAmUiw9iVDp
 2wveP8YV1iRH3sY8kTy3+VZSqgi0wo9frdErk4ftXhX11Ou7wl0GEJF8R
 wExaBL/1Wvct+xDDvM6qTDuDXCg/uRgJ2qNnRdNJszJY87KBhajdRH/Fl
 OfKMjJBO3zXZMqaHQ8A2YSngxASK66zUcv42VxSuw8DUhj74F4lLt0tLW
 0vSQlLQIEivXFbeTrQhJzRrDwpBpHXdoLJpLeBq8DEnwrEc+d/AmzaiwR A==;
X-CSE-ConnectionGUID: Vu0sMrKdReSEghblnaUazQ==
X-CSE-MsgGUID: UV/usahoSWaoMIkt4UjEDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62205751"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="62205751"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 06:29:30 -0700
X-CSE-ConnectionGUID: FGDeZ1/WSneJqAP3FrrPyQ==
X-CSE-MsgGUID: RiSJKCI1TIuGxZZSGshOQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146390289"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 06:29:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 06:29:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 06:29:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.75)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 06:29:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdChLeJYA9dy1HCvvoMtFUwlisxdgKDVVy2xnp2g09jCMj6yKdWD+L3JYnVBgn2s0hdRf05UNoQjZNT1tPBTNCMqh0XI86KP4R6HzNqFJe9t1idv1uGf6J24SuWYF7ak0JD6OMp9w8nIP9euRAkPJ5V0OptgLaWf4674NbEA5K5ZMonuQxzGLefc63dtZz7N2osU67FgXEmNoFWE//byi5REwYKCr76HHQjnB4Sx522yp72M3qTSlW2Jg+jCGIhrqsPZLn4KhYkzZbCZYbFR+YE8HMyQFv9R2tnwicKiJZqETGgh+kpI9tLpzTaur7S6F9eH4y+QNAjIABSDGgx2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeCLrbBhp2cvYQivS/r9V9x/tNxdVcpD1xsqu/TCfbY=;
 b=KYSBeNPpPj4dDdJ+1MQvAwWiIzwgd5+V24XoW5In463Yh6RI9YDZI4nkHcg3fnY/7oPlsqUJoy/IIaHVXiHviF0zbjGcuUOAa3XFzkflAWaOw5HdnWqin7221ELEavCVF5MPYML8yH++ztUufv+wgVpeazSAKhBn3YTxZXOfMhIHKOC1Xp/NI8/YyyKYmCmfkFmIXHRpKbcn1BfN8jsOcG2m6b9RaMWMZd0jMHqdp2ykKLx4Bf4jSafhCxAsZ0K3DlvysRF70O3q6etrTf6YOv+YjeV1B3Hq9xD32UHG5cRkDtEWSQ/lk7+qYsOIpe5U0ycV4cNH16SB7U3XQhFK0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by IA1PR11MB7294.namprd11.prod.outlook.com (2603:10b6:208:429::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 13:29:26 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:29:25 +0000
Date: Mon, 9 Jun 2025 15:29:15 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/gem_eio: Fix SIGABRT in kms subtest
Message-ID: <ttnqeyjdl22rvjtesb6issmddneg3ihnjxobiaeywreph2cgxx@m4le7b7rjni7>
References: <20250605184801.118619-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250605184801.118619-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: DU2P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::22) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|IA1PR11MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: a759e081-4802-424c-6b8b-08dda759a73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjVsMW9CK3Vmby92MXNOOW52OUxaakVNRTF6R2dLT1JvSEROamQvRGdzQmht?=
 =?utf-8?B?TnBxa1Jpb3RwRVpIMlJhMjV4QVhoZ3VSaWEvTXU0NnlsWE94QUNkcTVEQURD?=
 =?utf-8?B?b3B3WlFLWkRCcE5GTWZyWlJHdmpQczVwdmpucStxbTViakFDYXk4aWIzaDN1?=
 =?utf-8?B?MHlXS3FWcGlEYjY2anpqSmVxK09jZU9SLzJhOW1qaVMzTGd3L2hLS1RDUGEv?=
 =?utf-8?B?eGxnRGg2TE9aNzdEa2dMWjZ1bFlJWE5yY0NMbXM3NFVnaXBteDhxanArMG9U?=
 =?utf-8?B?bFJOL2pWckFjWGJVdjZVWG5VQnErWHNaYlA1cnhzYlFCeGZvT3BKMkJhWXBQ?=
 =?utf-8?B?WUJIbFEzcEhBLzZTWEFEYWVvRjgwSXhudHp4THVQUTZPY0s1cjBDK25zWUtN?=
 =?utf-8?B?eFZWWURNOEwwY3VDaTdhcncrdVJqbjd3WEIyRGRtNnExSURsUnFTb2VBd3Q2?=
 =?utf-8?B?WkM4UC9iRUlMSkFWcWZ1MGc5ZFhuRXpBbmN4anlRaVhDeGFvTlA1Yk9NcEd3?=
 =?utf-8?B?UGxQak5zODgveVhyRkkwT2RaRGJTdzI3YlFKRnd0S0piYVp4L2ZCdGNnTlRI?=
 =?utf-8?B?VmlSTU5URFhpT0hhSlRxUkZoVlBrOSt4VVIzOHRPNWdEYjRXT2M3V1VzMHFL?=
 =?utf-8?B?d29YNHRUSHd6OElrS1RzRVZ3ZUt5czBILzYzY3lYbk9QY2dlQTFUWVp5TGly?=
 =?utf-8?B?bGprRDZuT3UyWGJCZmJ5ZGV6VjlMYWR4aHlNcE5NWFpISXFwaVF4Y1ZNZXdh?=
 =?utf-8?B?NTE1bmdDM1lpVzgzcTZBRS92M25zUEp0aFVydTFoKzVINExWdWQrWTMydTRW?=
 =?utf-8?B?WFNOOTdKaWY0aHcvMjJ0UlYwcVhYMUdaMlJjd254S2t6Qk12akx4ZUd6cE9V?=
 =?utf-8?B?MjcwaXZzNjNYUWpNSmo2MnpUeU5HOExXdFBENkVjQS9mUXBYL2ZPbklCazZR?=
 =?utf-8?B?QW12ZkpFNXIxdmx6L1cvdTU2NUpJd3RtTnlLSEFIc1lhcUNDS3IzS1R2b0tK?=
 =?utf-8?B?NW03bGdneFNOb1A0SEhWZ3g0eFY5c3lSQlZYU2tYQ3dSRm90RFZGZFBjWU4z?=
 =?utf-8?B?ZTBEd0lGcjVhU0gxaEQ0NmQ3NWRzQXgzSjk0Rjl3dUFOei9kTDh4U29lUEp0?=
 =?utf-8?B?aVBjZkZhWWFTemNsa1E0NjZ5Z1VENnRKVzdFcHhqUjZPVTJmZGsxR1FpblE0?=
 =?utf-8?B?Q0NRZjNQaWhFYytMVGNsYWpsbEUyUVJ6NVlaK1UzeVdZQ1Zma1dWNXUxT0FO?=
 =?utf-8?B?K1VCNDUwUDcyN3lTODJ0bUc3aUEwQldaRWgyMmgxaVZyYkl6MGFZTTFJQStB?=
 =?utf-8?B?TlhFUXhreDdmU2l6SThkOUNKRTIyQlZqVVlQdzFkeUk0YTV4VXFabjh1WXg2?=
 =?utf-8?B?bEtaUFZsYlBzeEhtaGZBVXhxWXdEWFJvaUcyWGxmMjNpT3crVUo4cFRZQkww?=
 =?utf-8?B?UGJ2SlJUaFhJQ1I2RWtXNmY5allpNVlCQXhNcC9IWUZFaUowMVUxZmZweTBS?=
 =?utf-8?B?SDZkYU1qK3NSVUVjNVRqR09xakhPem1aeU9nY2xrVXkzWkFQM1F2OXdzbEFt?=
 =?utf-8?B?MHdtSHM3bmUxdmRVeHJjb1NrdjJiYlEvYzc5T3ZGeFhYZXB0cDYzMkNLWlpL?=
 =?utf-8?B?L1UzdXdCVGcxaUk1M2JLTVh3MlZpei9JZEdSYkdhTWxET2hWRTdkenFRT3ha?=
 =?utf-8?B?bVJ0Q0tBR0kraWtETHBDK20raEhiTDlrbUlCMTVLN083c2liUFVkUmtSbmFW?=
 =?utf-8?B?cVNIWHRZczEvQlNobXFDdzhOY1lOYmlPTWp1VmtrL3ltYzJVcFNEYUVuYVdG?=
 =?utf-8?Q?1SO6aRNdY0yp+QaCflrcJhGW2IHpuN7tugN+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFZkY1VFemFPSHQ1WGRMUWxzcG5JdTlWMjJHak5EMDhlUXJKR25tVnBGbExK?=
 =?utf-8?B?NFNVYWFQNXFuMWFDUjBZRDdIV1lYang3a1VTWlMwSW1uaXY2ei9PdVAzeU9S?=
 =?utf-8?B?bUVkVHFPT1VSTFhlNE5OajRTT0RwNEZuNGhoUkM3Qnp1ZHM5QWVyaXBtZU1q?=
 =?utf-8?B?bEg5VjZLY2FmZWRON1YrcTFMTnNpWCtHdXdjZGE2am1SOXlxUjRwK09HdFZH?=
 =?utf-8?B?RnFuT1BCdXpQZlJ1SURLcHpkWHQrbk1FVGNvaWxoaHp5Q3NxR2U5UTBUVWRL?=
 =?utf-8?B?WFVCZjBnODR0eDFybDdCWnpNMG5OclJnR1plWCsxY2RjZWM5QjdabTUzczRT?=
 =?utf-8?B?NDVkTnpzVC93TUdoOEhmcGREN0VzTUlGcmNiam5RblQ1YzBCdEZaVjViU2xT?=
 =?utf-8?B?MzNPOHpSSUNzRjZNbzR0OTlHU1RmRzNHZVNwVytXYjd0anFQUzMveHEyZEYv?=
 =?utf-8?B?ME1UeEdvOGNwdXpDL0ZtQ0hWUXRGTWp1eGdHS01YaURFNURySHV4bTlFME9w?=
 =?utf-8?B?QTI3WnVlbUluQ1V6cG5yZklQaDBKV1ZEYmVKZ040YWpkVVVvaURQWjAxTVFK?=
 =?utf-8?B?TlMxaUFTWG9meTBkOGYxcSs1azlnRnJLZG16TUhFUklIUlZyVXJydVhURXNC?=
 =?utf-8?B?RGZUZGVCMzNacUdSMldrNm1oSVVLcEJMQkpKUEtaTmhvazlrVGVZNzNoNmhV?=
 =?utf-8?B?MmsvVmZTYnpwY0tCcmxYL3g5bFNhWGdpZmtjdWFhSjRDV2k5ZjU5UEVIZDZD?=
 =?utf-8?B?R0ZkZFBZRlJhdGhibm9IaEVUVk85dXhIdUczelptcGcydU9PMFloM2lJZ1l2?=
 =?utf-8?B?UTIrUzBxKy93N1BQZEtxbWszaUY0a1o5cEwxY283VEQ4N0diK3d0TitBeGZV?=
 =?utf-8?B?S2xPRnlSM1ltU0xRUVE3VFdaSEFJM25zSWY1UXF6Qi8yYXFObExYU0JCbGQ0?=
 =?utf-8?B?SHNCZDUzSkMvZGlKaFhwSVl6a3RDUHNBY21oU2FrSjlpUVJpbVZraDc5UVRS?=
 =?utf-8?B?WkJSMC9PNWtqYmNHd3B5WDNWNDUrLzBScTBRbDNLQlVQendmbFFBRXQyenY2?=
 =?utf-8?B?Vm8zL3RLS1dtMFRqeFIzS2xCSEUyd1JFNDgyc254RlFwUm4rT0xWWGhKOWF2?=
 =?utf-8?B?RDJGNk9MQktDNUpSWXQwSGZCYk9scnE0ditOczlxa3hheUp2L25nVVhKaEFo?=
 =?utf-8?B?MXZmOFl3V0JwRy94T2FlWEgrTTIvbUgya05kSEg0TEtyUjlGd1FoblRSN2Ns?=
 =?utf-8?B?U2p1eEFhc1k3aG5sMlRlSjgzV0d0K2h5cndVZHFJMjl6NTN4dGNpNVlhalov?=
 =?utf-8?B?THNNY0dla2tlK2E1SUtqSStsUmllV1VaSlNVbTBESWt4OFgrS2p6bXN6Y01u?=
 =?utf-8?B?R1N4YmVIc2JrMTRrL2pIREFWMzFGbmJFdVhvSFZvaXpIVkJuVHZKUmg3R0k5?=
 =?utf-8?B?MDN5dEw3bUh3azE3SW52NTM3S3oyd0hTS1ZpWXdIVys3ZlBudXM1OXVQMUU1?=
 =?utf-8?B?UTUyNEJSMWZsTmdLWmhsU3pFQzVVVnZ0REVNbFd4UVNzWVFjcGt1RlJoSHkv?=
 =?utf-8?B?YVByN2NueUNaZ0o1VERPTjg4ckFkTERUOG0vN1ZpR0JiVURPTHBhRHM0MHVU?=
 =?utf-8?B?Zk44S2l5eHdjQy9WRERHRTdaeGxzYk4vYUpBVnF1Rmc4YzFyMDdPWkYwVzYz?=
 =?utf-8?B?TkdVd3N2eStkMXFicndIZDBWYUVhS2JSUFIvY3FmTVhuN0tZZUhlZ0NURE5Z?=
 =?utf-8?B?OGdweUxaaE1BYnptSER1T2E4NnJOOWQzYmMvMm1CVExhd3ZxSVN1T2lJTm5r?=
 =?utf-8?B?L0VkS2dTb2tzcTVzdGorN2gxcEJlMUVnTDduMjFPNDBCY1ZyTnVtUmlnTGEw?=
 =?utf-8?B?SDN3Um1jc2RWTlBFbFZLSWp1dnR5Y2lYRzRPVlIrV0VBL2hFQjVMd05jRFZX?=
 =?utf-8?B?ZzlPNGdteWxSY3ZKUEZKK2lyZVYwNmdNMUVObFp2UTFWUHhaQUxjYWVHUVNI?=
 =?utf-8?B?RU9NRDNGeGNFSzQ4TkFRWmdPTU5zWFl4eG1sWnpFdlNRYVp6WXZVaFZTV2pl?=
 =?utf-8?B?RWtncFpHbVhXZ0RLdWxMaUxPZEUwaUxESGVLNGR3VEZMbE9ZeCt6dEtNQk01?=
 =?utf-8?B?LzdHTjlYOG5EZmkxWmQ1dlEzMi82WHFiWEk1QklGdmVtNG5QbGx1d3l0QS9t?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a759e081-4802-424c-6b8b-08dda759a73d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:29:25.8663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNgq4G6L+ljgnKGmdduPgV37fBr66X/Pb488vP5kVQgAuIXfKTHDv0e7vsoFFURyVeYBqrHR7KwmvbQA63vLH1kUIFBlvVT4eojTaVAkvrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7294
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

On 2025-06-05 at 20:48:01 GMT, Kamil Konieczny wrote:
> Subtest kms runs display helper in a separate process, which in
> turn prepares patterns for screen and there makes additional
> checks resulting in skip. This leads to a SIGABRT as igt_core
> require all such skips in main process, not in child.
> 
> Add this check before starting a kms subtest, also move other
> skip checks into one place.
> 
> Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13658
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_eio.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index b65b914fa..d6384efe2 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -1188,14 +1188,17 @@ igt_main
>  
>  		igt_fixture {
>  			igt_device_set_master(fd);
> +			intel_allocator_multiprocess_start();
> +		}
>  
> +		igt_subtest("kms") {
>  			igt_display_require(&display, fd);
>  			igt_display_require_output(&display);
> -			intel_allocator_multiprocess_start();
> -		}
> +			if (!gem_has_relocations(fd))
> +				igt_require(gem_has_contexts(fd)); /* for display_helper() */

This won't fix the bug. The bug isn't contingent on the conditions not
being met - igt_skip() checks if the call is in the main thread before
checking anything else:

<code snippet>

void __igt_skip_check(const char *file, const int line,
		      const char *func, const char *check,
		      const char *f, ...)
{
	va_list args;
	int err = errno;
	char *err_str = NULL;

	if (!igt_thread_is_main())
		assert(!"igt_require/skip allowed only in the main thread!");

</code snippet>

The change that's proposed here just duplicates the check outside the
test itself, but the check in display_helper() is retained.

Instead we need to make sure that we *never* call igt_require() inside the
thread, because even igt_require(true) would fail in a thread. In this
case it would probably mean rewriting setup_context_and_memory_region()
to be igt_require()-less, but we also need to check what other tests
rely on its internal require() for their requirements. But I assume
it's not many as most tests seem to respect that checking requirements is
the first thing that the test should do before it does anything else.

Thanks
Krzysztof

>  
> -		igt_subtest("kms")
>  			test_kms(fd, &display);
> +		}
>  
>  		igt_fixture {
>  			intel_allocator_multiprocess_stop();
> -- 
> 2.49.0
> 
