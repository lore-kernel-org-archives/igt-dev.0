Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C286D68B18
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 13:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444D210E2AC;
	Thu, 14 Nov 2024 13:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/2snEAG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8162B10E2AC
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 13:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731591459; x=1763127459;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=vva0ykxl7ln0sDg42ENDs3vdWwHiQCeqmZvabJnReH4=;
 b=G/2snEAGK8QFBtO+yeSZdJjgoyZxIA98lDRA1CCCC9La9sJA0y1M0c6T
 gtTMdtux9gWenABoNyL8JB7BAyrq6h5MH5Mb/HQsuewQtJHPYwDs6eW7+
 L0q+V/utkNksHPpOE/BUzIGMvTIH214PNf/i3MdHrCDkb/Mtv41UTbwwI
 3mbi7O33FRybhUfRlJTPD/prOHu25uJn2LPhnz/JlzpTH1bkjAgGW6gBM
 LMrc1FHLOgZm9y8u4EvZrBxlFddvuUePatkZzqbO9H/+oJhge6KtfEu6H
 gRHnNxr4dtQVz6r2wMDrlZZGSiELfqv23cn265h3ncwqhbjgs1ksMbxhO g==;
X-CSE-ConnectionGUID: iSOpTCpCS7m67820e2DaOQ==
X-CSE-MsgGUID: I917cnwARcmXRXxeJp++MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35245915"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35245915"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:37:38 -0800
X-CSE-ConnectionGUID: X32flTUtTwKlze5iMWVU9A==
X-CSE-MsgGUID: +2hDWohcQ6+ipO0BnTVZvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88324052"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 05:37:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 05:37:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 05:37:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 05:37:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgEDNLlBYmXLpO+ucAzwu0bxZj8Q5Y6cXBfFQEJQDeVhyYil/pTnjrpWjUG80zR5K8/gGqLYorEgH6iGbxYi0J3MqpwGUUtZYaqyNRlLm+fMWpMqBz9PjB56ld72Vnhgr2PZh2dyYf10qdcG1FK356kzBUvJBW7aCMlbcmFaw3b4j437ZqPhfhNXr8JnVkOTPs6Dn+8dGEf3axy2oo1Cs285nCufZXi/POcs6PwGbvfPXMhEKD3XV2kfAe7MeJtLHSsWnCS2ms61KPeiKMsXnK47BbtG/sClvuQIWDU+NI/O1CqzQ9YBGUlRMAwpsQ6Mf89wMYZralw+KBDsalZa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vva0ykxl7ln0sDg42ENDs3vdWwHiQCeqmZvabJnReH4=;
 b=X+zbbhJVj1ZqaTunse5CjPIiVrnIdPwvGYgadLYbUHi+3V5yAmENXp2UC9l/wGe5ciPHxjBE/2QWhFlP74aymWsdSmP2AcXrqLFhB5mqDL7LUvPaWxFmqr79+Jj3dSfVumVI1FqyXHWoRp5Aa9LSmMGuLnzWx3asy7BGdwCWQ++AI46lG9V6AEF3QlA2fwKLHUDlUE+dO2+ZYzD8Hhk+q2oD9RUJwf9sTBuP4W8PX5kT+fn1gxP7HoibwK0VHHEAZCSNFiFawC90gix6Y1czj6LFow+D+WyPa70H2iblvFY6HikSGOKCTZLL2jRb++Yc4VJPyoy4KZo5M1HKJwlNCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 13:37:34 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 13:37:34 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/3] tests/xe_gpgpu_fill: Add offset-16x16 subtest
Thread-Topic: [PATCH i-g-t 3/3] tests/xe_gpgpu_fill: Add offset-16x16 subtest
Thread-Index: AQHbNo2q5PgklqIA902J/++mY9YpJbK2x5mA
Date: Thu, 14 Nov 2024 13:37:34 +0000
Message-ID: <1ec7897ee62a62a7adeee65adf74355d3d281ac9.camel@intel.com>
References: <20241114120616.70229-1-zbigniew.kempczynski@intel.com>
 <20241114120616.70229-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241114120616.70229-4-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SJ2PR11MB8449:EE_
x-ms-office365-filtering-correlation-id: dd9a2981-7038-4e81-5823-08dd04b17edf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QURxWkM1dVFCL0pWUFVIYUFHNlJSaHpFbjhlSDNYRElMZXJ2VlZVNUhYOU82?=
 =?utf-8?B?b0FuTjRFaVJQOWJpY0JjZjY5eVlhK2xwTlJrTXRQUSttV3ppSGpsOHFsWmoy?=
 =?utf-8?B?MysweTI4UDhySnNyNis4U21Qd3pvVzgzajhxb2xuZ0RDL2NiQmw5WGZaTHFx?=
 =?utf-8?B?S2ZmdkdEVXV4NGtUaDRlMnpQWC9WSnlMNStGZVR3MGlwZWFwMlppNGVFbUwy?=
 =?utf-8?B?ZzdvbFR3OFl6QUpKTmM3UlpFNll3emYybGUrSzJIWENla0FKcE9ldDNWbjRR?=
 =?utf-8?B?Mno1NFNmWlljdDJlbjJOTzMxTXI1TE83VFhhMTFpQ0FvUEI5T0xxNEpuU0Rt?=
 =?utf-8?B?aCt2RUpDOFBpcnk2QUJGOE9xK3Y5eXk5Yy9hU3lUay9CSzE1Ykl5NXJMN3Zz?=
 =?utf-8?B?amFMRjVhWkUwT21GSCtMWkI3SGxOVDhRSnFoZUJlSmNYeTF6WmxWWHZYaVd4?=
 =?utf-8?B?V015blhMQWNZRUZPdjNOazZJSlo1c3JOZzVDYVRLZ3ZaTVFya1VDVXlDZDNH?=
 =?utf-8?B?RHFIUzF3Wm5sY2ZNc21wU1gvcUdZT0s0czVzU2p0SURNNTZldDJNek5aNURI?=
 =?utf-8?B?UHNCQnd6elFpM21kUHdTaTg2aC9XdFFQQ2FBejV2bTRPVzB3N01vTFN5aEE2?=
 =?utf-8?B?LzJEOGh1d0RlNFE1MytuUDgzVStWcWpUdllubE1naHFPM0c4WVc3MmhxM0pt?=
 =?utf-8?B?cWpQUnFLQllVenRTNTkvcWIxQ1lDbE1ibVBvUDZrZUs5WGhlNDc3dmZ6KzZD?=
 =?utf-8?B?REZNNkJjaUlLTWNqbDFRMkRiTndwMDJPWVZhSzVpS3VnRmdsNzVUbGR3R2pj?=
 =?utf-8?B?cklES2ErTUZTQ0dCRVVvS2lKancwbXdYT0ZQSzJ1bGQxUGRxVUZ6V09iZ3Y2?=
 =?utf-8?B?anJ0ekVEODNQQU1KWUhxWjdQa0k1RVlPWVpVOTR0SzZTVVI3S3h2VlR4bHlR?=
 =?utf-8?B?OFlkL21NbkhHZjZrb2dxWFVUYWhKVWxCdnBnRFVQVC9CYytJb2lUb0RTWkgr?=
 =?utf-8?B?aVFtWUxWdzZ5ZUtHZ3hZWnhvc1ZFenZyZk5BS29scmhyL2xhdWJjYXdCbzlQ?=
 =?utf-8?B?R2VDejRMTll4ZkNrc3FEeUlvOW1YNVN3bEdpVVorUkJxejlYQUh1Um5zUS9J?=
 =?utf-8?B?MnRlYkI2NUxrdWYxYjlsODkzbnNtNG5JZFBUaDFRVkphbHNVcXZFYmRUV1Bq?=
 =?utf-8?B?VC91QmtNK1FQZFB1N20vWFRKTytSZVhPRDhBeW5zRElyNXU2U0ZSNEEvL2NI?=
 =?utf-8?B?Y0VDbFoyeUd1cXMvSzJIc2g1WURJR3hMaXdPeHRQYjl2emd2RzFLSzQ0R2Rq?=
 =?utf-8?B?Ly8yemNJREd5eG1BRjBOMTVWbXpCV29ENTJMdlpTM1Q1Zk43Zi96QUlqZTNE?=
 =?utf-8?B?ekRFRlllZmVCOXpuN1YrblNCTW9QMk1xMjJtUGpBOTlRWCt1RXFyb1VNL25j?=
 =?utf-8?B?clhweTlvTC9mVjZBQWxuSk5sV3NnTVFwMXpidUlwenRnWS9aOGxTMGhobFBY?=
 =?utf-8?B?OTJ6QUptalhqMlh4c1FaYVZWWXdmK25TK3hTQ20wSjFxUDBSYkoxN1pLVEw5?=
 =?utf-8?B?dnoySzRqTzFHcnVQaTNCTmRGUmg4cTVSKzRqUG1RWGtWcnl1MmxjWUxVV1lx?=
 =?utf-8?B?MENabmREN0JDUXZkZmNoYTR3MVJVeldpU3BkRXgzZ0tUQ25VdkpveXhZaWNJ?=
 =?utf-8?B?ZGFhdXAwWXhwQysrSnJYR0RxdVRvWEs5a08vdDQ0akludnBPMFFURHdCOThU?=
 =?utf-8?B?QWVUaXkxcHBoR1h0WmFXTG9yMVFMeXRqQUl3NStWWmYwTi9hRjZ5ZzFVNW93?=
 =?utf-8?Q?wfrmNi6lNcg2TNhqWDMZR+L6NYPFj7BlQyzmc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEhrM0s4bGl3WmVkYzAwblhRNXVTR3pwc0xKWTJaTkdtUkxLbnRXbTI4ZUpY?=
 =?utf-8?B?WmxyQUs5WDlVOG1sK3NVcHAyQXMxbTJtQ2ZEVUw4ZnhyM3pWSU14MUlBOFZm?=
 =?utf-8?B?QytWbnJpRlBOaXFZOVQ5R2FBYmJydzErUzc2dmF3S3c5OC9maVNvYk55eUtD?=
 =?utf-8?B?MUd3SHUzZFZwN2ZzWVNzSVY4VUNsYWh3Z3dMSWJLV29rR2t2blNkQ0JYU2Vs?=
 =?utf-8?B?akMvVjY5RWlOMktmWnhCb0ZSaDRmeGxkM0paZisxcDZqTHppbkkveVMvRGd3?=
 =?utf-8?B?VUg4SVh4ZWdSaEoxMCtWZW51SitBWTZSTExQVHdVeFIwMDhwNTBPMVJvUi8v?=
 =?utf-8?B?SVEvK0ZZTWt0S3NITVNvQmtXN3FRckpnN2ZodDV1T0xEZ3VUR2k2VzlPWlp6?=
 =?utf-8?B?K2tlbkkva0E5SzdFc0NYMXBiNEpaaURzbmtlVlVpSEtJeXlwdGwrRnFOSXZr?=
 =?utf-8?B?Y3JSQ1FraW9qbjFlcGt4Q2szOEdOajRxOGROYzl3RUVzZTlTcVF2bWw2bVNX?=
 =?utf-8?B?SWM2MS96dEo3Y0s4N09xYVBuOU1xUlNEM2U5R0YrZTZid0tsNEdpbmxvcm85?=
 =?utf-8?B?QTVSdlNTN2tIaytNSVVqSTFXSU1hbC9idk1mRzVSbGswTHNOSnBsSzFUS1pq?=
 =?utf-8?B?WVFhM0owSWNFYjJhaGh1VHJTOVlCNnl3ME1RTmRudE93Q3JkaFFuY01ZTnNj?=
 =?utf-8?B?RFg5Y2dEVmFjRkZ1ZktZMGE3S2FScUpCWGRFKytneFNhaWV5Wkg1QWNGbmwy?=
 =?utf-8?B?K2tueW1RQzFqQzYwdlBINUh3bWxDcEM0OWdJeGVpbUlsOUxMbVYvS2tLaXBG?=
 =?utf-8?B?dno2SVliQVg3WVI0eGUwZGdnK2xraWMzd205WXR5cVp5ZzBQNDZiekcwWGxJ?=
 =?utf-8?B?UC9CeVQvdjhTZFlHUkl4N29VcFJIK3B4anJFMzdVTE9rNUhOaDZmNE9RWGxY?=
 =?utf-8?B?VjBEMUJVVnN6bTV4VVMzOWxQdzc2ZUYxRzBBVFRPVlJUT1o0ckp2a09zaGo5?=
 =?utf-8?B?bmFDblBGb2V6dXVuL0JNUWFkemJ5UUxWck1IbnpCVmRLeDY0QTNOZURXZlVu?=
 =?utf-8?B?cDRoQUdQNWlIK0MvYzFLUnFmcjhyUVJPbHpxa2hrV1QrRmx1OTE1YXFhbE1h?=
 =?utf-8?B?SlZYNmU1c2hkOHM1R1VPUXBNSnNlMGpMNkFTOHZwZit1M3NDTXJWVHludlVS?=
 =?utf-8?B?dnd0QzZMb0V1VDhpYVJHazBOT2JkbXhMMmNBTWlYRnlUN2tQS0xpTERJWjhS?=
 =?utf-8?B?MThCUEhkbjNWcit4NnVHTVRvd01MMnRHWm9YRlozd1JibzI3MHM2VURuQSt1?=
 =?utf-8?B?T1I4WUZCejV6b1daaWd5SVoyUER4WXRobnlnT2hTakRreDh0N2NhZkRSSHFU?=
 =?utf-8?B?amhyRlo4ZjVYSzRUbnh5U3JRY1AvQjBXM1hJTHJLNHVtTzFLM1JndVFTRDYx?=
 =?utf-8?B?QzF0S1c1STdzb21PU2E2Slpvc3o1Rnd4QnpqeU5Qb0lqMWNxTitmZlpJaDlK?=
 =?utf-8?B?VG1xVDdTSHQyZ1FES2oyNWthSHdBRyt6cTJrWFB3RTl4NUMzSVRGVTYxeUhT?=
 =?utf-8?B?bXp6RmZLbmpyZXRxajN6WnNoOFRNK0dvZnY3c3NDMzBmVzlQa0RTRk90NHF4?=
 =?utf-8?B?OE1NS3NIaTFvU0NYNy9jUWhVTnZDUXM0TkNyZDZuNHJRMU5TNFVveW1RajFl?=
 =?utf-8?B?RmFSdGppVmJTYVpoNjFWOWU0My9GQjlnZ2dnZXY4SXEzR3dJb0txUnpWVlVM?=
 =?utf-8?B?RlFNQ2t5aEZVcStyOGszMHcyUEV0QU9LcEVURXFRYWNuRk1qRW9La3orR09x?=
 =?utf-8?B?YkVKZ2EwcXloMXc5YTFCNzczZThQemFrS1JWQVo0T2ZzVDM5MTlQa1U5Z1NJ?=
 =?utf-8?B?U0JiUWg3VmNueTdOUjMrREpzWGFnT1lOSTNwNk14b25lQjZ1OVdHbzQxQ1Z4?=
 =?utf-8?B?M1F3WXZLSlJzbkRzUWc0cmQvVTJLQVFqbEVhQmlhTFRWeERQcUJUUFA5Q3Vi?=
 =?utf-8?B?ZE1EdytzZnZmdStHKy9KdHRyYzRKdFEwOVVkNldSc2pGMU93UW0rakZVM0Zt?=
 =?utf-8?B?bzU4UmF5ZUhDRTVLWjVCa3FpMkhBMUhnS3Q4Q2xwcWxLamNTcTcxa2lINmY4?=
 =?utf-8?B?TWRXQTcxNytKYU1JaUQrM3FraXFpWlZCTjJoakFXZXdUM3pEd0RRTU94bUlE?=
 =?utf-8?Q?lqmoW+RxB3/TO+ClJ2HC0Ts=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0B8DEC94031EB4EA156C4457EE79FCE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9a2981-7038-4e81-5823-08dd04b17edf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 13:37:34.0127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SrCXNEoj7FmcdSJb49jkAl0p2A8L4/b27ndqMjcOUHjD3ih15if71ssIH62r2B4ED3ifBoToGJMAwxgRRePtCyPtxaVQZdW6VLFly0AmVpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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

T24gVGh1LCAyMDI0LTExLTE0IGF0IDEzOjA2ICswMTAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IEFkZCBzdWJ0ZXN0IHdoaWNoIHZlcmlmaWVzIHJlY3RhbmdsZSBmaWxsZWQgYnkg
cGF0dGVybiBzdGFydHMgYXQNCj4gb2Zmc2V0IDx4LHk+ID09IDwxNiwxNj4uDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGlu
dGVsLmNvbT4NCj4gQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGlu
dGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnpl
Z29yemVrQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9ncGdwdV9maWxsLmMg
fCAxMiArKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZ3BncHVfZmlsbC5jIGIvdGVzdHMvaW50
ZWwveGVfZ3BncHVfZmlsbC5jDQo+IGluZGV4IDgyNjI1YmI3YzAuLmUxZWNmZjgyMzMgMTAwNjQ0
DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2dwZ3B1X2ZpbGwuYw0KPiArKysgYi90ZXN0cy9pbnRl
bC94ZV9ncGdwdV9maWxsLmMNCj4gQEAgLTg3LDYgKzg3LDEwIEBAIHN0YXRpYyB2b2lkIGJ1Zl9j
aGVjayh1aW50OF90ICpwdHIsIGludCB3aWR0aCwgaW50IHgsIGludCB5LCB1aW50OF90IGNvbG9y
KQ0KPiAgLyoqDQo+ICAgKiBTVUJURVNUOiBiYXNpYw0KPiAgICogRGVzY3JpcHRpb246IHJ1biBn
cGdwdSBmaWxsDQo+ICsgKg0KPiArICogU1VCVEVTVDogb2Zmc2V0LTE2eDE2DQo+ICsgKiBEZXNj
cmlwdGlvbjogcnVuIGdwZ3B1IGZpbGwgd2l0aCA8eCx5PiBzdGFydCBwb3NpdGlvbiA9PSA8MTYs
MTY+DQo+ICsgKg0KPiAgICovDQo+ICANCj4gIHN0YXRpYyB2b2lkIGdwZ3B1X2ZpbGwoZGF0YV90
ICpkYXRhLCBpZ3RfZmlsbGZ1bmNfdCBmaWxsLCB1aW50MzJfdCByZWdpb24sDQo+IEBAIC0xODks
NiArMTkzLDE0IEBAIGlndF9tYWluX2FyZ3MoImRXOkg6WDpZOiIsIE5VTEwsIGhlbHBfc3RyLCBv
cHRfaGFuZGxlciwgTlVMTCkNCj4gIAkJCSAgIHN1cmZoZWlnaHQgLyAyKTsNCj4gIAl9DQo+ICAN
Cj4gKwlpZ3Rfc3VidGVzdCgib2Zmc2V0LTE2eDE2Iikgew0KPiArCQlncGdwdV9maWxsKCZkYXRh
LCBmaWxsX2ZuLCAwLA0KPiArCQkJICAgc3VyZndpZHRoLCBzdXJmaGVpZ2h0LA0KPiArCQkJICAg
MTYsIDE2LA0KPiArCQkJICAgc3VyZndpZHRoIC8gMiwNCj4gKwkJCSAgIHN1cmZoZWlnaHQgLyAy
KTsNCj4gKwl9DQo+ICsNCj4gIAlpZ3RfZml4dHVyZSB7DQo+ICAJCWJ1Zl9vcHNfZGVzdHJveShk
YXRhLmJvcHMpOw0KPiAgCQlkcm1fY2xvc2VfZHJpdmVyKGRhdGEuZHJtX2ZkKTsNCg0K
