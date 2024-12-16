Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E89E7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 13:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329EB10E683;
	Mon, 16 Dec 2024 13:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnOAUTJY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B1810E683
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 13:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734356589; x=1765892589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s9DboEaY7HDUAzwzo7NhVahCjItEvtu9wCiiAMGzUTA=;
 b=mnOAUTJYWjnWUCckgYGeP4mfcY6IEC37T2XcGHqL545QX2p/Znf00TGO
 Wa458uLd8dHl2LSN5noKrGSb6CwnV5665jPQxbrXJWv1vujPF/pKi7Yj0
 Htw/SROlCfRKNHdsb8GXiqpmH3gCV0AwYOs7x2WTGvVGBDphsl0UHW3ul
 mAeaIvtsSr3N+n/WmKBydmNGRUDdroB/O7q2tpDkNwZtXyQ5XlXw73hvh
 oYmaiIh79w5q3LH2bbmOfFvI0S8WpNXMraCeutGcy7gwYK6uwdnHu57GE
 7mKA5x6Yz9H/dvfVq5mCn8taXbf2TlawdqElpTBQxxUUSufoJAbtMzOmw Q==;
X-CSE-ConnectionGUID: EYS1L0CLT8WOc+3GUO4aSw==
X-CSE-MsgGUID: 49ujZQs0SyCNFp1/FvAZPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34878786"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34878786"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 05:43:09 -0800
X-CSE-ConnectionGUID: tGLArHQ0QU6joYw/iZjYTg==
X-CSE-MsgGUID: k47L6cXZSXyFjMZzi691SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="97068894"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 05:43:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 05:43:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 05:43:08 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 05:43:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eG8PWV0fX8PN+pN5Wws26R78Jy38QGBV4OGDuYj9a7jehXFVgGwLnLe9NyMjYtkZy/SH5nUhhAfhI/kg6B05ufV+D7MuY2OWHomk/uAAvbuuOxvI5Jiic5d5tbjsZ6ZC9WTzZP3jUGcSXRzdxdzK/L12pTWjeO1RnzRx9v7+wlwN/AihsnFrI/fyAbIVBOSWQcnfnomlIYJRcJ6DKAmHXY5wwPRcDO0OKJGUOFOaIDQkBfLnSuM6KxdD7xwviA05hW4UumRzwm0O80msKY2ra9y0bnalhppV2z2o0fmrJSUpVJnHPoQKPAxSiXp+8SdelWHfr4JMcDUBuj9rP3tQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u79XiMVF1e3juyQLOK4M8a8RDW64MFHMpReWdsPhxyk=;
 b=spl6VVw3sTUW4IDtIlTKRoR4bPkiDysRGmqnHEOfxtvaj3WLFE2Bc77jJ46lvjAvazYKMBzXCYwdOBkR7ngQGeK68XVPWoMoaR/75+xpw8U+dP2uTCyZ3SNqIrCRR281Fb+H5id2pwZFVly9d1E+pCiGcGAVDlr0gg7DJOGmhIhohEq2zQwoJQrBxvJFrLlJiTcMyBPlhR9Co+Kh30k/5/YCkozHXgsn/kc6Nna4g86RQHYtccyVVz8bHxo9KcnN6bfAFM5SoGoG45SxoZSpB6O+NXJzTuuPijD/5EIH4e5Z4bDl3AhHUO13SJwuUG3TOQdBFDoUhfxG+lkD9U4/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 13:42:45 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 13:42:45 +0000
Date: Mon, 16 Dec 2024 13:42:37 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <chris.p.wilson@intel.com>,
 <eugene.kobyak@intel.com>
Subject: Re: [PATCH I-G-T v4] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <a3evoug4tajult4jtj5c4vn6plfh3db6mkvg3hludtqrptwy4u@khgd2axkfwpw>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <wk2ejntldlc7ayamr7iiblcmh6jumx5a563jpfllco56d4z53p@2ib6m5s55dfx>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <wk2ejntldlc7ayamr7iiblcmh6jumx5a563jpfllco56d4z53p@2ib6m5s55dfx>
X-ClientProxiedBy: DU7P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::10) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ0PR11MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b184637-104d-442b-2506-08dd1dd785b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTlLVzVvNkVBT0wyNFlkbmY4YXpKbnZGYkc5YU5PcGRZQmsxTWpza29iWVox?=
 =?utf-8?B?YlA2NXdZSGE1UlJPZVl0WVJ6VVJWdjE2WkptTG5YZlJaN1Q3SVdnbFpkRmZk?=
 =?utf-8?B?U1RtUHA3Qlpad3lReG9tTGZPYVJPNU9RWWVwOWhpU1BJZ2R6MjVsMkQ1U3Y0?=
 =?utf-8?B?MjkvMUdhdTRxb1Q5MUpIbFhiT1EzRXFNWlVQUXBBQm95NEd1Vng4YStEQWdh?=
 =?utf-8?B?V2ZaNUptUUI5R29Gazl4L0dyUytnNnVqNjlxSEtINFNTcGdYQ3VCQjF2Z0d3?=
 =?utf-8?B?WkxGUTZqajQ4WkRyQnhTaTY5SnRHTFF2OCtjRDJiYUJQV0xheENSN0lWVGZD?=
 =?utf-8?B?VFllMEZqQlhDWFA3akdvQVNBZ215Mlo0aStJa0VPR0NuS08vTThzbWJxeWlU?=
 =?utf-8?B?dVkzbjMvNnRxdG5NYWdWdm9KWGZLN21OeTBtSDF4bkxPWERKOCt2TWs5aUlR?=
 =?utf-8?B?SEpiM2tsTHhDbmMvN0d6L3BNWHk2aTZxdklBNWNDODkwZUd5YXpwRFJabXI1?=
 =?utf-8?B?NERsb1Ztb0lxMlZPWXp3QVJ4Q2tUWXR0ci9zRnRBTWIxRGV5RzJBSklnUmZj?=
 =?utf-8?B?Tkp2MHB6aEZKUU1aazQ0ZHgzRlN4dGhSTHRKRFBndGRNaURvSXpONDRvV211?=
 =?utf-8?B?L1F0bllzQnltN3dhT053b1BGV1h6dHRYSkZ0Mk1IUHpzalAxSUNWRTlvWnE4?=
 =?utf-8?B?MmRwTzFIKzYxdDFlU0VJWWJyY2RTcFlDZWIwZGpBSHV2T0NzQ3RZQmY3RFdv?=
 =?utf-8?B?bVdRZVNtYTBUNk9NWERVNTZlZXhiMzczVWo0TXB6TVFyU2xYSjc2L3ltUWl3?=
 =?utf-8?B?d2FBTHFwNVRUTzR4dVd1V0JKd2xiKzNlMEJDekpJa2NmSHA5UkpGZUFPVUNB?=
 =?utf-8?B?RXlGSjBmS3JhRFRmUzV3eEU2b09QL244Q1Jzc2p5Z2tHV0ZhVUtZTm5PK0Zq?=
 =?utf-8?B?SWMrQTRyV0RIeFd4VDdLSzI0RHQ3MTFVN2ZrZlRLZEExZEtlMVh2YzQrRHNu?=
 =?utf-8?B?MGQwNldsaEV1WTZsRWZpVFc2WVYzQVpZNDJ4UFI3WCt0WDFCeHVycXZPczFN?=
 =?utf-8?B?K1REQlIrVDFOU2taRnFGSGdBSkNwVCs4V1BlWFBjWjVhaVhnalZlUjYzbmdS?=
 =?utf-8?B?cmR4VkFUaDJTbTF6TjNxYnYzTTZZOC8rSkR6eHNrVWFBTEowL2l0cG1FTlFQ?=
 =?utf-8?B?MDE2Q3V0RFRnb2Vwb2t3c3NzTzN6K3NQbWw5NVZrTmN3ZFlUZEtSY1NNcXFh?=
 =?utf-8?B?eGVWSGpSVUowYWYzQU1HTHVvOXVoNFNra0MwSjZFSStQbytubW4yNzdkbVJr?=
 =?utf-8?B?NFJ5anBmbk1rRFJobDRxSGxPbTJSQ09mRzd0TFJLc3RDVnRaK3psTmVPcTJv?=
 =?utf-8?B?ZDREMWlOWmkrTUMzMjFXdDJ6c1J1MmJpbTN1VkNkYlNHdWpIMENLanh0aEZO?=
 =?utf-8?B?UTRmQ1IyNkRYVTdBd2FFUFp1dGp6R1h0UUVDUlRKYnlsVlNEUUwzc3RhWUEz?=
 =?utf-8?B?NmVTc05GUG1Mc1UxSmd4YndXQituVVphWnFXTmRQWCt5Y1lHNmJxSkF4UnFq?=
 =?utf-8?B?bm5ueGo3UkRETDFiWHVkZ2dvZ1BkUVVZUFAyc1dqc2pNdkhiaHI2cW0yM0l2?=
 =?utf-8?B?OEZLWVJmL1o2UFJhYWE4TDliS0VJTnIvQ09QbEJUVTFYY1lwVVJSUFlJYVVr?=
 =?utf-8?B?aHQyN0FOSHlvdEY1UWNKcHhPOWo0TDdjaG8ranM1a2dJbDlqZzQxS3ROYmZv?=
 =?utf-8?B?L3FqOHYrRmF1Y2Q0NEFqRmY2dlpWVVRSME42Zkl1QmgzK0N2bmlvSERnb3pr?=
 =?utf-8?B?VGRWUmNaUGpDMWMyOVYra09VaUh5bVpXaHd3eXk3MTBYNWJWay9TNUJ5ZDhF?=
 =?utf-8?Q?hKsPARhBKyfW1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmR2K2R2ZnJOUy9aWWxnMU9OdDZ6R2N6R3ZCRWw1UVd3Sko0WXJPZVIyVkFa?=
 =?utf-8?B?OFNhb2pheXEzMmhKVlFaTXlVbktBZHJVVHdQeTI3MXFnQUs1YWt4ZlhtNU0y?=
 =?utf-8?B?bXdaNDdKT0lxWFd3Q1Z0dHBMOWZDRXc1YjYxRW1BMnZabGtPSzU2MXZBWDdM?=
 =?utf-8?B?Ym1jWHUwWXV0Z1JyTXFONVI0d1BrS3JweFpLcHBlbXA1RW5UYjQ2SkFuSFpC?=
 =?utf-8?B?bXgwNFY0ZTIybHNFNVN0dlpBM1Y4Ym90N3FMUTBNQnFnaEI4MjBLNmVxSmJH?=
 =?utf-8?B?RFpWaXRXZ2c2aHExTzFacC9XL2daNmpUT3dPSm9lUkxDR0pKbk8vKytHcW94?=
 =?utf-8?B?cUdXUW9KUWxRNndkbTJBbFVFbng3ZjZlKy9iU0V3Q001MEpaUWVjQzVPVTVP?=
 =?utf-8?B?d2JwRDBuMXJxUlcrN0dNbmo4a1RWSDN6Z2R2QTJkNnBNamhxTFNDaXlyK1RQ?=
 =?utf-8?B?UUhJWHJlOEdMNTgyZlUxOXdJaDRobmZ5Zk1Ea0JPeG5TOXpadHdMb3crOXhy?=
 =?utf-8?B?c0pOd1NYTmpYaTRrNWkrQ1NBbXRwVlRpN3FjQWswZGlBcDNLK0huNDFkL2JL?=
 =?utf-8?B?ZlAzWHJrVzA5a1VyMVA0bWU5WXlOeGt3Q1IwUEJmc2RSR2JaR0hWcWpBNll4?=
 =?utf-8?B?Qnl0T3hlUkh0M21ISWJoMEpuN2thWGJzR1dZOUs3dzdCY2R1UmxYNVB5T0lR?=
 =?utf-8?B?NENDTHFiTEV1dmt3b1JQTE5MMldpVEJxN3QzWGxqNTdkMk1BM3orMjFma1Zj?=
 =?utf-8?B?MnQyNFZWKzJHWXk1ajU4bXpROGtxQmhLelJRbU9rbS84L3VEbjVnSmR3SEFB?=
 =?utf-8?B?RFhmcDRJUlFLN3dMV1VDWFFiaVJCSnBubjlIYkxUWlRKMGNQd3RNNThuQ3ZY?=
 =?utf-8?B?SU82VHJDd243d1MyRUc3YjZ2aUk3bEZ4aXlRd2lSNXpINVg5ay94Sm9tL3Y5?=
 =?utf-8?B?QnlycGhjZ1pweERkQm40TXd1NnBqL0s5US82L3VGRUNhQ0tBU2VnSUtLaU5s?=
 =?utf-8?B?QklJNlJOQXdJdWROVXFlUXRValAyR28wdVRQaEU0YjNweTdRY043NGZXOHFP?=
 =?utf-8?B?dXp6aEtKKzRFWGU2V05HN3FmUHpQK0tIRHE3NHFVcWhuMjhmZnlZWUJlRG1n?=
 =?utf-8?B?RUxSY05DV1N1MHFrZGwrbVNWY0tEdDN6NkFYMDBzVENXQzBpZVE2dTFhU1Ri?=
 =?utf-8?B?bS84ZTZsdUpqRTNpQVVIY21hdWRUL3J4SENWSSt1enpLbUEyelJkMFN6K2Jx?=
 =?utf-8?B?clRtL3BZcEFUWUEwK2ZLS01VU091UUZQWXI0allaL25DZkxscGZaV2lLMTdB?=
 =?utf-8?B?TVVvNWdMK2ZpMjIzaFhqd1dXZExqZkJaanFwMjlzcHhPSWpjbHJmbUJuTzVi?=
 =?utf-8?B?OFN1ZHVjWlkyMUFlU2wrNnVyOHcyNWwzQitXWUd6S281ZFFKUDNxT2p4bXVk?=
 =?utf-8?B?UW40YlZTMmwrN2RMNVI3NHo0Nkh4Qm01anNHeC9KbU9CQWZSeVBxdzVqMHJP?=
 =?utf-8?B?QXBoaWx2RzlrVWt0dXk5M2pQYUVtR3JkUGhmeFROMlloN3BUSkJkdFA4YnZy?=
 =?utf-8?B?THhQcGdkZ1oxSWdqYnE4Z1Y2NjhiMjFTZmZraFdhQ1NEWWY3RXBZTzZkc3ky?=
 =?utf-8?B?S01TbE44aFJoREpXa2ZGakxzUFdmclVlczk2QWtmZHA1bzJnVUROcHFIdUpS?=
 =?utf-8?B?VDhXS1YxZWQyYWZ5bE5uaVRHcVlxYlBUdkd5amhzUnhWUFVuRFljMGNOeHV3?=
 =?utf-8?B?NzdYRmlpUGVpU2xkQm5PcDNwY0RhNDRMMkdKL1BFZHBXOHJOcTBjVWFMMzNt?=
 =?utf-8?B?Rkp3ZkhXNkpUaFdGOXozNWJvZzFCdWl4UEY1ZjNsakRxcDdCS1BnaUcya3dv?=
 =?utf-8?B?ZzBNeUVqMWVEdmk0cjNqazAyL0NWeFlramliOXI4Wm5NV3F4ajJickRPRS9Z?=
 =?utf-8?B?OWNIeTNyRU1IY0tBN0pIWFBxaGhHNVlwSTFFU1Q5QTVBR0VlV2QwMDFLSTRs?=
 =?utf-8?B?T3ZIcTJoY3Vyc1pyaWJHR1laZG5rMk4xS1MrN0NjQWovSHZGZVFpbDhWZG50?=
 =?utf-8?B?UnU3ME1Ucy8ycllQZDhFYlptNEU4UXNxSy9zZEFLUFdLc3FxRGVBUU14U0tX?=
 =?utf-8?B?V0VXVWNBdEUyY3I3OU5rTG9iRjdUWEc4bzhaQUQ3eUNQOGtKbWxMSlVzNG9P?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b184637-104d-442b-2506-08dd1dd785b1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 13:42:45.6007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoIcHzVnk09WK+w4IRtHEyPYcmdT6NepAjmFAP8TB+SKdZd1/X+0/CZoTk4jW6ukYDLulPw7jE08HC/8WNpbGeGyRRnx4yO5XRKAXNcoFpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
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

Hi Mikolaj,

> +static bool is_rcs_ccs(const struct intel_execution_engine2 *e)
> +{
> +	return e->class == I915_ENGINE_CLASS_COMPUTE ||
> +	       e->class == I915_ENGINE_CLASS_RENDER;
> +}
> +
>  static void
>  test_engine_hang(const intel_ctx_t *ctx,
>  		 const struct intel_execution_engine2 *e, unsigned int flags)
> @@ -388,6 +394,10 @@ test_engine_hang(const intel_ctx_t *ctx,
>  	 */
>  	num_ctx = 0;
>  	for_each_ctx_engine(device, ctx, other) {
> +		/* Wa_14014494547:DG2 */
> +		if (IS_DG2(intel_get_drm_devid(device)) && is_rcs_ccs(other))
In previous version of this patch there were also checks to confirm
that:
1) the current engine is one of the two types,
2) the engines are different.
Are those redundant now?

Krzysztof

> +			continue;
> +
>  		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
>  		context_unban(device, local_ctx[num_ctx]->id);
>  		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
> -- 
> 2.47.1
> 
