Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07BCC77B7F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 09:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AFB10E559;
	Tue, 24 Jun 2025 09:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QU0YATW3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB0910E559
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750756762; x=1782292762;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YhGTELb1V2i4/xzgTlJIicnKF10kH2X8NHXuvTB6TrA=;
 b=QU0YATW3l0b9lKv+r4hKJBfoLrf8t/Wv2Nyc2Jn9jyU8zeAaQf0Oj6U5
 nUbuxWkxFx/FNRdk6nlt987KrwwsG02MzOOlDFREipB4TT4/uQ+4tou28
 u5dHJfyvLppeVGqAjzUkQLAg/oo2BRUO3yfs8SD6ESQ6mjYqKAZlVeInn
 BPgzGXqF/q+ICfHKd8HrSBOJ7QZP/8Eymjm52Xnlig82oTjnkSQBNi6dp
 FyfOhmBjrLKw5W5JsBIHVFiMu18cD8fXOQajwmXZTjeNkiKk+4WtnJK0M
 ppMqtwjJ+x43ToZkCdyCMW1PO4j8BXp/nWL0hW6m4ztZyP/Hl09T1kOgv g==;
X-CSE-ConnectionGUID: zOASgAC+Qvi8wrkh6PrNMQ==
X-CSE-MsgGUID: hUSmwOA0T4u++hGOBUmizA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53081433"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="53081433"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:19:22 -0700
X-CSE-ConnectionGUID: 1j+UAWTTThSTnXWJwQ05rA==
X-CSE-MsgGUID: lEyoflNFROS2vbLixKoHTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="151344985"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:19:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:19:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 02:19:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.64)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:19:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOgxb2TCHPxQ1dbn7gKf30FPakBhAFH6ZTV52qo/S1qAaX0I5SaoiJq0ObwF2h84QcM82KdQ7rLaREzmvpBZ9+znXi8Y0IjiYyX+YcGq5Sp30Idh7WmGfHG4ySFHvny/IiHObZP8Ff038I6lbput9uoH3TuNVJvnqGsRLqAHNBNLv9HPLZV8VKN9dbVpZ2gOGgr0Qjs5583YJSv/v3SBAhnX2KJ8kgv+/rQFST1MEYCPCnCRDh7yUNINjKTitm7lU6DpZWRDMK6Mq3o1Bj6cvH9iFM63Xzq0uDkoj8hZDaMMlpEG71TSUIOYHTsuIFw+ajE8YqHz2AWA5IBiyzzUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIBuF2fqB9VHEZhKDHekH04jZq84NZ0Vqk2hOtlV2XU=;
 b=w0nsDVhlKq3RTyQ0iwsrt6HkRG1k4BjMfaQpY1liFH4A1QMj5R7FWvyGg1KEHr7FXuAJMhhnaWF+AHC/voBba+uFPciquG9b+1z2QQ0M/tZ4DuA+TCBGgHtv55g8OMmJMzjFvixqQfbXvXgNq+1YErysV/q/fXpuHKdL7FEsw5WziJCTL1k7+xfbW5dXQa+8dnxDOwJPiDc99mHk2vdEk/1KIZPVIgUxej6QaA83sFamM0DZLOKXe5ilp4Lkl1gCLZU3xAhg9Y5QJveli949ppAscrAMv3zBpwdq0pUri8Vpmnmr0dRjF0KOMbO+ymt7cSmNcJ7z8O2/GPR5lv52Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 09:19:19 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 09:19:19 +0000
Message-ID: <840ab555-5a01-4cc6-9f91-9eb9abe31fd4@intel.com>
Date: Tue, 24 Jun 2025 14:49:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/kms_async_flips: Fix suspend-resume
 subtest
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
References: <20250619112334.744213-1-karthik.b.s@intel.com>
 <DM4PR11MB63120579DBD114F8C7AF860D9078A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM4PR11MB63120579DBD114F8C7AF860D9078A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b4eaf1-ec48-4593-a726-08ddb30032cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTlZb2pWeHc2L056aUszdndDTHRGWnlxYmppZWlsbm9DMTY5UDRYWWdrdlpC?=
 =?utf-8?B?UFUvM1RIeEZTZEdMTWk4ZVBPZE9pNE8vOTJoeGwyZENzSHNjWE9oTUFqcjJp?=
 =?utf-8?B?WnJPc1R6bzdrNHRJcDJodEx1Y2ZLb3lUSmZQYmgyVjlSTFJkWm5uWVljalVu?=
 =?utf-8?B?QU8zU29rUjF0ZnRFM0JqNmduem14WHFUUERWQXBxcmdPYmJjdnNTNkIvNGRN?=
 =?utf-8?B?VlBiS3kzdzU2cC9YSGVLOW9KalA0bE9BYk9VZzZueEUva2hnVGpMU1VyMWQz?=
 =?utf-8?B?dExaY3U5Z21QSlFjKytWU2o1Q2NjQkJYTW9yTDZ1cTlnd3d2OVdRUTYySjRx?=
 =?utf-8?B?emJvVkc3bGdQc1BKODBkUzh6RmZzTDhkVlFGK2NTNXFPcllWUjJRbDQ5UGlv?=
 =?utf-8?B?OEF4L1o0eU16SXNVc0JmNU5ZRzNtSFF5bThycnlkaC9UbEJwdDBoQnpCUTZB?=
 =?utf-8?B?SHk2bEZLQkYvd1d4czU4YWhvSi9zeDVpZTdaQnJRRWNYVTVtZmszZnNyVUp3?=
 =?utf-8?B?RHdBVDIyb25LTHl1ZHVURER5ZExYYlNJVzdFeEhjTzU0VWZScTVpdndXYkdN?=
 =?utf-8?B?WlMxQ2tUZ2gzVnRSQjNJNFhxa2pKVjJEMS9YMHduWU45VDlQZGtHMVZGOVRa?=
 =?utf-8?B?ZEdKU2ZqRm9VUEZiSVpVdHdJcFRpc1I4VlVhMndPMmJxamswbXUwOUgycnNs?=
 =?utf-8?B?NnN2aW9QMWdZcTFuQ3Nnc3JyZkgyWFJ0ejV5WUxVMm1YZm0zRUkwMjM2L3gy?=
 =?utf-8?B?SUh1UHBxbkxFUFB3Wlo4eXJweVZ5K3M0YlRySVNNS3dOUGlwWkdaTFJ2Q0E4?=
 =?utf-8?B?N213V2NpTHBHb0k2RldhRkh2cUhuSDlMMWt1c2N1emFIanAxa1IxOFZFcTBq?=
 =?utf-8?B?K1d0MGpkMzMrbmlsWWFGSGlsc3JWWGNqSHhrbGgrU1NoMFh2VzZyMHdySnhU?=
 =?utf-8?B?VzNjd0orVnczVktHb0dIWVZucGlmYWFXZUhlNWtITWtPZ2RqRVZ2Y1hST1Jh?=
 =?utf-8?B?MEhhTzB2L2lMMlFpVVFpUGFKUFYvR3FhOW92N2RtUHh5K0ZoUDRMNGh5dHF6?=
 =?utf-8?B?WWU3T1hXNC9lUERNTHlKY0RFMFBJYjQ1SmtCOUlNaUlML2ZlWFBQbzFRNm8r?=
 =?utf-8?B?RkZ1WmZRMlhVeXpJVXpySzk4TnB4S003M0QwZXFibzFob241NUJlNFNNeFdH?=
 =?utf-8?B?VlZGQlpXVnh3TEpnMXI1R3IrejAxVmpLZ3pwRUpxNXZpdm9ta1dxbnNZeWtn?=
 =?utf-8?B?eHdtR09yRWJhd3U3aVloeEZUN2dzZDVvd0xYcXJDYUI2R0hHdmcxMVMyWUpK?=
 =?utf-8?B?ejg0bXlSbGVVQWxSdE1FU2NMRUlMMlNSazA4U25RRUY3NEFuMjVlV3FCNHRk?=
 =?utf-8?B?N2JzQzlubGZvdkVDZlBYWVQ4NjVRazZMa3RYdW9ES3N3MGZZbmJ6enlNZnpl?=
 =?utf-8?B?S0VJZlAzZjFXaGFZZXJuOGRBZmxqUFRlUzRoakR0WWN4QkNHVzVGbHc1enlB?=
 =?utf-8?B?dHhqL0tZK25VUWVwbVNhTXF0VzBxRTRqT1dPcHZyMVUxNTFhNnVQcGp6NjlU?=
 =?utf-8?B?Rm45U1E1Ym9CWFFaSnczWnRzUnY2bndXUXcxdGIrdzdJaDl3OW92RmhzYlBO?=
 =?utf-8?B?c2lZRUtpU25ZMTFrd3diZVdwdWFHZ2JWNzgxV1Fpb3NBdm5aY3BJeW04eWFz?=
 =?utf-8?B?WUpQNEZvS3VTZVYxYWF1aDE3SVY3eWtGUVNYNWJrMzl2a1ZKQjBYMXdiUHV5?=
 =?utf-8?B?WTZqMVNUM0NQamh0Y2ZxN0RGeTRXemNqUDFMMDJ1UENSaEEvbEhYMCtwdjNW?=
 =?utf-8?B?bDdZR082N08xbFNaL0FHL1cyU0l1QyszL2xhMnRpcnM5cXZRcEw3OXAxOUc0?=
 =?utf-8?B?a0p2MG9sQXB5UUx2a2thSWRkM1BJcEpja002QzRISithc3JZdVVTSjRQK3dI?=
 =?utf-8?Q?zEpDzCDRcqU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3gwWU8xSUZZRi8raDJYclZwQTM1S3k3S3RvVkJyWVI3RmN3bi9qK2lqM2t6?=
 =?utf-8?B?MXdzMjhhLzM5WXkxUXRlOTZ2aTdqNGQ1c1BLV2IwK1k1aC8reWVNWkJtOVZk?=
 =?utf-8?B?OVJhSTc1b3hHYXpqVEJvVTVJcGJZZkNpclZQZVpiajlITmtnWDZKN1pZcFpV?=
 =?utf-8?B?cTJuc2RPRE9xcWtpbjlKWjBIa0VOY3RLYWtnb3pSWWlzeCtZSWdCQ0FDVHNP?=
 =?utf-8?B?dGFVeXhsdE5aN1hzMkNHdTRXeDJnb0RlZit1YnRTZWhFOFBUYjNXU2lVdVNZ?=
 =?utf-8?B?NjNYejNLSExNeUpKTHlXeDRNYytjMHJ0UkpaRll0eS9ha1NONm8rWTlsbzZW?=
 =?utf-8?B?U0doZm1CeE9BQkg0NWVON2ZidHlUUHZwa3RuaTlJaUdZMm5CWFlDUWlpT1NK?=
 =?utf-8?B?OWFuWm9hNmJhL0dRd1dsYlpIcHprOTlRS0ZaaEZ4NlUvNzJrZlkxd2tTbUhn?=
 =?utf-8?B?SVU4N0pEaXp4SUI2VmFnbnBHdzJQOEhjblRzM05nUk1PZDN4ZnFCd0haVTN3?=
 =?utf-8?B?VFlyZ0c5U1FzUUdBWmo0a01zKy8vcm1nUVhBZGNOR3lGMTBtdXRVV1R3N3pp?=
 =?utf-8?B?c1dUK00vVXJRbXNZZEdHTnJ6RHg4VldETEJ2eFZuRUtIQlNOZlg1TWlpd1RE?=
 =?utf-8?B?ZkxUZXRhc3FoNGZIbm15QTdRUXhxS3dRWHVKbWFwZzZNNmFmMjJVU0tnVEt0?=
 =?utf-8?B?T1VnMzV3dFZmd00wc2JicnJ5RG9VY0xEdXRPR3JKbU1ISnQxZ3NRK29xRDhX?=
 =?utf-8?B?YUxyTC9qeks4SmREaXltNGF0OW56cTErbjVTWjNWc3czNzVlaWZ0K1lRcnBH?=
 =?utf-8?B?aHE3YzBEdlpnTGQvMlZwbjZSem1lcEpxMmJWYUNsMFd3RGttMEZqNElzM2wr?=
 =?utf-8?B?dlpINllJdEVCcHFJNlNnOWIyd3hyVUg4cFpkdUhBZXN5eVNQZElSSTFMdDcx?=
 =?utf-8?B?TWxXc1ZneU1kL1F1Y29ZR0JqcXVmV08vZDJnajZyVWpFVUtWVkUzY1dFMEtz?=
 =?utf-8?B?bW5iNmRKNnRCMlMxaTFYcTcwb0FwWWlJSjVwZVRvVGJxRVdoR3pwY0RhZ2U4?=
 =?utf-8?B?d1A0NkNOK1BCZ3Qra2IrVFhtSWp2czhPSTFkMVZHcWptUVNoVnU3eE5zQ3ZK?=
 =?utf-8?B?SHc1MFpXZ3BDMVpwSmpSRFhyTml0ZGo2Y0lSYUd1MU9YYnQwZkdCNnlXWndX?=
 =?utf-8?B?Mjl0bUh3WENURXh5Sk5pQ3p2dVVEVUt5bHBWeVBrY2Y1dlRxd1hwKzMrL0hU?=
 =?utf-8?B?ZEZyMkZoMkkzNTFqNXowUjZsUFZ6VndPUUN0STZmdVFwbWRyK0ZsZExtV08v?=
 =?utf-8?B?QjZsYnJKK3pqZVFLdU01T3E4bDBsYk1HTjVWWWxqMlpadFl6OHMzWnJXQ3Vi?=
 =?utf-8?B?OHRsYytJR2lXMWtYU3g2VzdoNGMzK0phRnZwWk5CeWhNaHh5aDIvVGtMV1pQ?=
 =?utf-8?B?VDB1a21JdWViZFIyLzRQMnFwaEQ0Z3l1Q0swTkpzUEQ2NzFPdWVqa3hHRDhD?=
 =?utf-8?B?WFlGajRnaGZiZENGamp1Y3o5TlgwU0hkZjc3RXVXR2dSQ2ErZWtRcE9aQUZI?=
 =?utf-8?B?UTkzMHZpRDl6bGFhWWRlUmFIdENZMFhUSUlHVktPaVBFcTliOUJXL1g0Tmxk?=
 =?utf-8?B?Z3MxejJUaUhNZnZJdUltMHl0Q0Z2M3Z6dkpjWDcvUkd6V3pFbFhKUUdLOTBD?=
 =?utf-8?B?Wk1iTElMK2orRy80VVBJbFYvSzlJZ2xtcXF2WnVBQkc0SytNRkl3VTZJR0Zm?=
 =?utf-8?B?RzlVVC9tMXhsNjFWS3VtNGVpbGNxZXM3STlWQWFuZzVHUmJXdVZRWldRNTM5?=
 =?utf-8?B?bEV6dDI0c3oxV3lqRzlhZUg1Y1ZsTkN3SUxRR1Ura29VVzBEVGJaTWxMQUM0?=
 =?utf-8?B?VzlzeURTN2llMm1HMHBrQlJGbWwzQzM4aEQvcVBESVNiQkZsTTR6eXprZmlQ?=
 =?utf-8?B?allueU9xWVlTTXVuOG1odWpBL3dUeGF3YisrSk1EU0IrNWpXYWZLRnJEMGta?=
 =?utf-8?B?TWJ1eWpORUl0eDB6Q2dHK3BsUFM5WDBpRFEraVBsYjg2RG1PMEhOcmxVbkRS?=
 =?utf-8?B?YTVtb2t5SGxVcExQTDU3ZHU1RlNMZWVVM011b2UzZ1p3NDZKanlzNkZaM0d4?=
 =?utf-8?B?Nm0rMFIzQnJsb2ppcE81d05qVXhralpsdDN4d0lDdDEvY3N4aEZidDZFL1dq?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b4eaf1-ec48-4593-a726-08ddb30032cd
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:19:19.3355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erMDNEv41uG1iL9B2fnr/66D/wH5Dldf0RlTY+4FFTqumu4MYpHqj9UQsalW3zDqASZeWnUk4ES6j/P2Yach3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
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


On 6/24/2025 10:35 AM, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthik B
>> S
>> Sent: Thursday, June 19, 2025 4:54 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Murthy,
>> Arun R <arun.r.murthy@intel.com>; B S, Karthik <karthik.b.s@intel.com>
>> Subject: [PATCH i-g-t 1/3] tests/kms_async_flips: Fix suspend-resume subtest
>>
>> Currently suspend-resume subtest is only running on the first pipe as the
>> variable is set to false in the first iteration.
>>
>> Add a temp variable to avoid this and actually run the test on all the pipes as
>> intended.
> Can we add Fixes tag. If there is any issue around this ??

Thank you for the review.

Although we don't have a bug for this as the failure is silent, I will 
add the previous patch tag as 'Fixes'.

> With this change looks good to me.
> Reviewed-by: Jeevan B <jeevan.b@intel.com>

Thank you for the rb.

Thanks,
Karthik.B.S
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_async_flips.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>> 065ac9c49..0f2d932e4 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -377,6 +377,7 @@ static void test_async_flip(data_t *data)
>>   	long long int fps;
>>   	struct timeval start, end, diff;
>>   	int suspend_time = RUN_TIME / 2;
>> +	bool temp = data->suspend_resume;
>>
>>   	igt_display_commit2(&data->display, data->display.is_atomic ?
>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>
>> @@ -432,8 +433,8 @@ static void test_async_flip(data_t *data)
>>   				     data->flip_interval, data->refresh_rate,
>> MIN_FLIPS_PER_FRAME);
>>   		}
>>
>> -		if (data->suspend_resume && diff.tv_sec == suspend_time) {
>> -			data->suspend_resume = false;
>> +		if (data->suspend_resume && diff.tv_sec == suspend_time &&
>> temp) {
>> +			temp = false;
>>
>> 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> SUSPEND_TEST_NONE);
>>   		}
>>   		frame++;
>> @@ -1028,6 +1029,7 @@ igt_main
>>   		test_init_ops(&data);
>>   		data.suspend_resume = true;
>>   		run_test(&data, test_async_flip);
>> +		data.suspend_resume = false;
>>   	}
>>
>>   	igt_fixture {
>> --
>> 2.43.0
