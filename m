Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA68C54752
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 08:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481A010E16A;
	Wed, 28 Aug 2024 08:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jmd0/fvY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B0F10E16A
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724834810; x=1756370810;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zR0LWGBzv/HaeAKlToQ9burZCJFzaBglBxDrIIWdzYc=;
 b=Jmd0/fvYaA4EHMa5W/wxSMPv75x7PfUUyyX14i2Tq7NfzuP+Og2BDk5w
 CLFp4ecrbWLI/Tr+XqEKERLaH70pf82z3NITW6nT/ibFqQX5lihkHMU+H
 wybuuXqJhtcgNVhCYKl9DYguqMseqP6IqMEeZSX9B9F+d6Dl2Ob45Wknc
 BAeQx4wab6qEbl6/OZGEkH7pt6idDJ1RgoLwDUIibC/HFk0jKaja2cH1Q
 Xc2/2kl8JnCsbg+rSTumdd/QAPSDI7uztVC3uD277SPNBS2ZOENEpOtio
 3hUs+3B+qrBvZJrlQ3hdAPO5yGYisMStgzI9fdNjWjmXBvdzIlYw6VDKp A==;
X-CSE-ConnectionGUID: eu5eJ9F2SU6vciZfXvAQ1w==
X-CSE-MsgGUID: PkIkvaNRQ8qYcYZDKet/Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45870457"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="45870457"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:46:49 -0700
X-CSE-ConnectionGUID: 6i/QQkOrSoSfC5m2EyUZYQ==
X-CSE-MsgGUID: qXWUHHOLTBGKk4szET+4oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="62813478"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 01:46:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 01:46:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 01:46:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 01:46:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 01:46:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ye1BDtHZecOd97hxaqJJIxZVg5e/xhrGJNLVFiq8kTlyvaIIC0/tlrrtIh+fzK1TTCjpONFdHNuxaJDo7j+dzUiJ50dchowWCiVmxH7x+UMZJXk0WjkNRsXQAJmMnMPspVAvIwqkKgSuwm4sGbdMFj/P1SY0JDB1iwnfvqKSC1n5YYvuzg5PHJK29rWC+t7ouSwCvg2TsXXMIiYk2JzhN/RSmT862HjqqYFq9GvklB7ONQwCA4YFJWgzECkwLICxZ5isTlYLjCZWbHQd/519MmI7quWh5ATArthKNB8JEHiLAVDk2urdO1j31FcMFgdp2zVWlSTFGZVdikKnb3gJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWjKQX1lM+8hX1vrSA5BWNsX3DGn80b6tp271GU0KoI=;
 b=T3MPytc6H9E/AFdtEDswAx6r+48wsXJQqZcMzeOMVB6bagcwhelSz8hx3Y0mtOxOMrUegmoqKYPMHWjjsEqvEJkONrueehsXNTrb/FD9754LnLeyTvc4NO05NA3tiRz0B36qA/RnpmWnXD4kXxR9Nct4rQwgWLzoKGpkSgJ4Yn1a1dzF7bfpqAyIesQGAFi3enXEiUJBjZCl8l3TXGvRBVVymFTh3/BcpZuApVDq7HEm6Ud1QhO6VR2u7cKNOmhuvniqniLe6QlLrPdx5HsNeza+6Kk4DXbduC/oIGNwwJsB5PishCiXY0xPF7x1e3EUi4Al3e6bQKATEMi/g5Cc8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 08:46:46 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 08:46:46 +0000
Message-ID: <44e18951-3b9d-4aff-a590-efd39e0a7a70@intel.com>
Date: Wed, 28 Aug 2024 14:16:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend
 without display
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
 <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
 <172468301865.6014.9946879676247551400@gjsousa-mobl2>
 <82a8af36-642a-4747-b085-924c02e6308e@intel.com>
 <CY5PR11MB62119DD080EF001546D7D41C95942@CY5PR11MB6211.namprd11.prod.outlook.com>
 <172476290898.3066.9682588878616653824@gjsousa-mobl2>
 <CY5PR11MB6211B873C18594896BD21FA295942@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB6211B873C18594896BD21FA295942@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH7PR11MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: db4d82e5-6974-4d4a-fee0-08dcc73df2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU9PV1VTNHZvUUhGQ3pRdGFDOG5LU1hUY2RGUTlXMlNEYmhzcWJadi85dTJM?=
 =?utf-8?B?RE9WTitLeVdHVFNTL2ZOYnZIYTllVzU5TFoyMnJFN3RXY1QzUkxHZnlEREh2?=
 =?utf-8?B?YzM0ZHAwOFU2Q0t0dmpONUo4NDlWMkIveEEzcU9TM3BESkY3SGczNG1YV2hu?=
 =?utf-8?B?bnpta3gyYTNjVGtaejBiU1ZoeDlHWlJFQ3I4SjM2ZmI2LzJwWTRRNldzTmhY?=
 =?utf-8?B?V1NPYzVMM3lZN2tCSFVBQXptVWd2L3Q3RFFqNGxNbURtaDh6UUhwT0xrQmZH?=
 =?utf-8?B?T2xIN0ptRE5MZzhBUmVFTGR2V0lKSFUwL0tUL2liRnNlNVVQem13TU1tR0Q5?=
 =?utf-8?B?d1lROXhxWU5ZN04zWUhaQ0V1dnJYZUZDRzJPaVhwRFBRWHZEZFUraUltVkRF?=
 =?utf-8?B?MlIzNm52TEFwRXNQbTVWOVVNTVRNR0UrKys5SmFwYU42aDN0Y3Vrc2NTRllQ?=
 =?utf-8?B?VmNJdFpxcG1PRjM2SXgyUGtka2tRQzU0N1ZBMjVBSkRNWDBydGRUTTltU3hs?=
 =?utf-8?B?Y3B4WVkrQTBMeVEvdWxORmpuUVdtN3cvdWx0L09HQlJoU3dBRjhxWXVnQmRi?=
 =?utf-8?B?MGNzQm1HMkZOT1BseVI4eDVaa1lKRFYycEEyRkFvL3kxQ2Y4NTFmeERIS0ZH?=
 =?utf-8?B?dVl5ZmZ0M3VIS292d1FodER1UGJpR2g5Nzg3RVFJYjN5dGZOMkF4TnZneGtx?=
 =?utf-8?B?L2IrbkVIN3JsRkdacjNXRTNBR1QzSllnT21aSWRtMVZtVEc1a2JyRzY1ODJH?=
 =?utf-8?B?UUtGMHh0a0VMTHhqbUFHMTI1V3NMME52MXlBNE1RN0o4MWwxNEVHeTUrOUg3?=
 =?utf-8?B?M1FUYk42T3JRMkdoRTlyalIrVWRQK2NneVpjcGZJZDRjR203bmRrZjA0c1hj?=
 =?utf-8?B?VG9rVkcyMWxpb1JwVzFGMFF1M1pQYXliL1NRZ3VyalVjQjUwdTk4M2pIeDNC?=
 =?utf-8?B?NDFhd3Jjd2pIV0V0WW12TjQxOGw2eHNicFIxd2s0Mjk5Ujk0SU04Ulpjdldu?=
 =?utf-8?B?MFRvdG9qU0dPYWhuZExlYnpQV3dlbWV6ZUhWN3B2VWY0UTI2NE9Oc0loV0tN?=
 =?utf-8?B?TGprQ3BGQ054Q0ljVENCVHlSN0NRaUdDS3RVVjUxV21nQzVvM2UwN09PaG92?=
 =?utf-8?B?R3NzZmRTaTRXN2FIU2Jyc2NMQVlpdTR4NGxmMTU3azgrLyt4VEpoc3BONiti?=
 =?utf-8?B?M2J3TitCcGJTdHk5QTJJR0R4V1EvTk5BUWtmVUNSY3EyQXRidGU5VEhlZVBr?=
 =?utf-8?B?VmNEcWdHR01aR01vMHZCYlhZYXN6QVpab0NFVlNYQkN1KzdaMXlmdHFYeExQ?=
 =?utf-8?B?UVhWLzc0Q0l5KzREUXJrOTEva0N1S0JtWkNvakdubVhlNFM0Vk85RjIwQzFn?=
 =?utf-8?B?c1Q2blZIbDJXdWxuT2NmNGNoRDlOOG5iTkRjemJuZUpqVENONVY1YTlLVlFt?=
 =?utf-8?B?NDdvbVRReFRsZnZGaGkrRHp4VnRZZjd3SzhoSjJkR09ueEt4dmZKUTBkQXVM?=
 =?utf-8?B?U0VVRG5PUlhTOG9IK3RLY0Z1RlVpdGlHdUdoS2NGQ2RMQzBGS05QYlByT2NC?=
 =?utf-8?B?VlFLZDg3dDlkRmxZRFlranI3dWFMaVY1ZWdmb3dNdW5KV3M2MWRBU2l6dE04?=
 =?utf-8?B?K2xwU2VTS1RxNUlSMS9qUlhWYkQzbmxVclhxRU9hZzQxTGY2dldzYkNnYU9U?=
 =?utf-8?B?RVl1cWpoL3FuZlUrYXFzVVovV1c1TmlpQjJ0UnczaWtpUFBSaUZTQS9Idmc3?=
 =?utf-8?B?Sis4eHFsZVR6TVZqdGpSbnNGOXBPVHJIOVJray9pZ01xcE1KdDM0dWd6M0M0?=
 =?utf-8?B?K1RYbHk0TGtLOVdQLzdxQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N09tSUZWY1RlY1pQZE5ieDQwdC9udjR5dUhsWE9uR09TMkpFcmg0dHI3WXpu?=
 =?utf-8?B?RURscWE1bjFNQnFWUm9QQVlBRjdFVXZObWsxRnBRN2xWbjRESWNrZ0dtbFVH?=
 =?utf-8?B?UUNINEdRNEZJVm94MThhc1hsS3dQTGhKcFkyV2p6cnpiUXdiZjVYZmEvQUNy?=
 =?utf-8?B?alV1SWV2bjArUDIzWEpjcnZXdTZIeHRZYzBEejhWN0FpMjlpRnF3ejk3bjZ0?=
 =?utf-8?B?RkFyc2pTRlV6cStib3RqRnY4aHBuN0JFR09PdXd0cndaNThWNDI1T3doNmVR?=
 =?utf-8?B?QW50dkx1NDRub0t4ZCtYM3pVa0p1dS9qaUhzMVN6K25ZQVdBbWNVWHlNL2Mv?=
 =?utf-8?B?V0hoZmpKSldINUpVQXZaM1FmSXVObDYzakliRHM4dE1XbUVTSGw0b0N4dFRi?=
 =?utf-8?B?eFhKYjZ4V1QvMjJOb3V1aTJnUWh6c2hiMkEwSkxNREw1Tkgzc1o3WEtHdlVQ?=
 =?utf-8?B?YzFGdU90cWNiUjVwaTA5M1NrRjlISVBBTXFuYVRPZSs3ZWE1MnZKTHFuVkdP?=
 =?utf-8?B?K3lHamVGZ3lVMjl6OFlKVUVKU2NqTnZZZGZmVUZyVEQ0U1ZsMFRMdGV6czJp?=
 =?utf-8?B?MFd4OWhjNkh2MmtwWENHSFphUUVVLzdQcDhCUnNia3V2cjROc001N3JkUVlv?=
 =?utf-8?B?TmErUE1mRGF2Nm05RkFrUXQzV0RoY3NJVGYrVy9IeGM1OENSVlFSeFQrVVVO?=
 =?utf-8?B?eVdPSTR0dnFhZ1M5NklNcTlndTE2UzYvKzJVVExTbURPU3pTNG44alJTTU5z?=
 =?utf-8?B?VlJUWHhIdXdtcjN2RnRPM0JRMHc3K2pzNVpjcVExeEs4bVlBZVJ6OGtWaHBE?=
 =?utf-8?B?bVFyMzkyajVJKzFVSy9zbXE3T1Eya0VUcUd5bFU5cWVxZExoNk1WZjQxVHIw?=
 =?utf-8?B?S25RSGJrU0JqZHd0ZTdndTV0S1hwSGhyZEIvM1I3cTJvV2d1SmdsSmQvZVUx?=
 =?utf-8?B?YUJWMmFDb05CcVJObVozS0RsbVJEUGZ6TkdsVW5kQVJ2blhGZjR0RWlJTktU?=
 =?utf-8?B?eUV2VlpaR2pPQnVJTkp5eHpLc0NkaHdBMWp1c2crNlZkcmtzVUJxWDcxaGlz?=
 =?utf-8?B?d004bU5PQ3NWcG85c0gwejE4aEpkb1M5alhtTHJURDJqTm0wQzYwb2Z2L2RW?=
 =?utf-8?B?Vm9jYWx2WVNPc2VTZlpndGJ5QkY4NzZROXZvTmtDWDRydWI4RE9qWDVGMkdL?=
 =?utf-8?B?MllOajVKd2tDcndtNEVNZUw0clZtR1FVWTNZbm5hMmFRcFJLVVlrYXZOQjBw?=
 =?utf-8?B?WUVxeWU2WVZVVnZ3bmx2SkR2QmFaaVFLNVgrcmd4UzA3UzlieXA0ZU9RWVUx?=
 =?utf-8?B?bFppSTMvWDBSRkswSU04YlZZSGF1S0dSaTl5TUd2eTRzOUNtYWdKZmJtU0Rz?=
 =?utf-8?B?VDZCNnZ5MWZuQ0ZXcWZrYkl0TkduMmF0SHZTbmRIY2YralozQkFmOU9jTjQ2?=
 =?utf-8?B?eFU0QWU2Mk1ramJuaC9pdkRIeFoyQUhxLzdaZERicFVKb3plb3ZKRjlyMFJP?=
 =?utf-8?B?OEozVzc5eG9DVm9mdDF0RjZqdDJTZU9tNndKOFZGSHpJUGIzdWRlWGV6VXQy?=
 =?utf-8?B?V0U2azVzMVg1aTdNN0w4UjlBN1REalpWZ1hxVFhXUkRVYXV3TG9LakFrTkhr?=
 =?utf-8?B?TVpSQndlbVdoQ01vK2IyVm9BcmZwY3cyZjlCSjF5TlFjRDFORE1TR0lsZE5S?=
 =?utf-8?B?YktEcTRPanAzM3pSWDBnSVBTNTlHNm44VENKVHJrcUlrVFA3My9jSC9qc0NI?=
 =?utf-8?B?TzZXajZJOTZoQzRIaUk0K2I0YlFnTkJDdTkvSmpvU3Y0dE1oRW9QZ2dKKytM?=
 =?utf-8?B?ZWd3SWNUWmdNK0FmY3RKWGlNQm9HRkhsMHI1MmF2SXFIa2hXM29kaW9CdnpF?=
 =?utf-8?B?UFpWSGFEelBrQ3J3ajF3TGRJamRrSXI2dnN1WGxLUXZZRjVpcXpwdTJUNDJG?=
 =?utf-8?B?all1dm1CNm1maGhleHdXUk90U21GT1BpMUhIRFNxb3UxR2JPV1JYaFdxcktW?=
 =?utf-8?B?U2hjMm94SVhRRTlWTHpKU3UrUUxLV3M3UFh0c3hUWDk4eXM1ampCOTNmS2pr?=
 =?utf-8?B?dkYydHFZVFBTMGU2ZEVmNW9UN3NKRUd1YlNjcmw5L043TFJTTGd1dThSSm9j?=
 =?utf-8?B?SnYxT2hXNmxlV3JlNWM1ODFMamh2bkdDL1BLVG9kSHQ5aWVDN2VFWVhWcFpx?=
 =?utf-8?Q?tLxA1x5qUWZxqFPxG65x0p4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db4d82e5-6974-4d4a-fee0-08dcc73df2c2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 08:46:46.3820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znNKW7Sj+VVkQw2hM6xAQUhWr/z5hLA1X0ZeGClipID2dJVc63dPIE1zRcEUj45ZWL3cjGxwTYVTufn3s/7vUcQEjhAxosr+RTOwFL8nWKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
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


On 8/27/2024 6:24 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Sousa, Gustavo <gustavo.sousa@intel.com>
>> Sent: Tuesday, August 27, 2024 6:18 PM
>> To: De Marchi, Lucas <lucas.demarchi@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>> <sujaritha.sundaresan@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; igt-dev@
>> <lists.freedesktop.org igt-dev@lists.freedesktop.org>; Piecielska, Katarzyna
>> <katarzyna.piecielska@intel.com>
>> Subject: RE: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend without
>> display
>>
>> Quoting Gupta, Anshuman (2024-08-27 06:29:06-03:00)
>>
>>> For s0ix DC9 is the pre-requisite rather then DC6, DC9 does not have
>>> any depende ncy on DMC.
>> Maybe DC6 and DC9 are pre-requisites for different S0ix sub-states?
>>
>> - BSpec 68851 says that DC6 is requirement for S0ix.
>> - BSpec 68857 says that DC9 supports S0ix with more power savings than
>>    DC6.
> DC6 is pre-requisite for runtime s0ix with PSR Display On use cases. Which is irrelevant for system wide suspend.
> Thanks,
> Anshuman.
>> --
>> Gustavo Sousa

Hi all,

Thanks for the comments. So if I have it right the only final change 
here is to switch the param to disable_display right ?

Thanks,

Suja

