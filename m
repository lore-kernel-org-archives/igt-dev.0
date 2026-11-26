Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF9606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RS38WU4N;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=RUOiaLUk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390A31120AF;
	Thu, 26 Nov 2026 07:11:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7320410FEA3
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795676990; x=1827212990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7caf9Bb58e2EhihTgKmPMMYnj/3SXoAzVXO5DCE0RjU=;
 b=RS38WU4Ne6YT1aq9H6YT6xa1Uie2jbdrPBUkY4GMBJvpZwGTjQ/bWB5a
 u6RPr+JpyNjzeQfMOdijQPzlPbT5skiKfJHqza4WwyjAqYaHdiGllbAQ9
 LcKItHZ/mLukUonpTdSEtnOXEZLN/aoMtao5R65U9oqarYzlQ7lguIee9
 tynut8vT45/nNgCtEplxAJUzaozqpqCDk2HL/ghVVZUJhO8k0r4d0icvs
 Y+pBAY8Jc4pCXN4MbVAueC6yGBTMHIi2LY4z90TRxeKfAhyxBojz5tav2
 vXJDKWD+mZITS+jWB1DgD7DS8mhPKZkl+zt1YcrIpP90v1dsB9S6AsdUq w==;
X-CSE-ConnectionGUID: MZoJD16KQ0iUtZSrDMEflQ==
X-CSE-MsgGUID: DRUVDK9PQSKy+4S/08BhhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4485210"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4485210"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:09:49 -0800
X-CSE-ConnectionGUID: 0R1ZT2swSrmEq+mESgmp7A==
X-CSE-MsgGUID: /U8oWnKnQOS0ijTH2hlFGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="13865468"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:09:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:09:48 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 23:09:48 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:09:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5YixKIv2NoQA2mfwfji1RuYVSRIf8mDuL6CmoEJ23GwtrUQ7LB0+pcLavbCWyNssHzSQ9+7zBKo8lWXDfUxJ3wsx/ejgKHtEVf6t8xpaBJZHWXY2jIib0JvWnrAwUM/yJimg0j996jIpL5UZQf3iCZxxvuFQfA5JQgMPZKR77uygaSgWOmv1DveCDUbvHAweiWY7io0TKx0ixzmh1Wjis3AOuoiwB5zGWUgIye0a8XEBHkXyL/w3hNliQIhxOYKWkVqZAHjo9M+76jqxAlA5QERVcBWhDPzf6nUfcIMqelviC423HotWTpwPJN9JJp1rc3b5C0/ubPkN2wJrZthAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkoAMyg+qo/0ldZlirJy4aLP58S6gO9QC2uvTpI9Pes=;
 b=anquUOv47zXiRhReGWtO964J3HhHPktOL81RNqEs40dnLtA2XM7ThUIU61hCDXgGMmUQSZJfQq5IfgSQDxg2GrKemGETPTzmy4OGQ+gjBDV4O6ngF0oapwN0iqqj2V9ZeeydollfEhSKlMRKeEA+yzdz1g0bpxGVJYCoJeF2fw7NkwobicYxs/fG0n5WpQyLFkXk3AGOoF18EYLr4A8TmiI2Hj52n/+ImbAyCHCsmLeCzoVeQ64mkguIkvJrTddkEJoO9AzjcyYbzclUvX7tC6cZzFQWny5p9ogx/0r2wkGysUB2l0CXBL6sLo4OnDdyJoavVJvrCdLuKCk8laiMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkoAMyg+qo/0ldZlirJy4aLP58S6gO9QC2uvTpI9Pes=;
 b=RUOiaLUkjX7gjpER/vK7HOaMx7UwIXInywiDlQgx8BtmasmCf660fN6Jrrx5SwDfkGtrXB/5JFsABe5nzu7wBmlAi7KQD7ls8TqAN3sMy7KqSIpOp7UqcXGKk7SgnxP59ESRcCvn0ND5v7+yrIJSxl+4ptkAAqykkqquz3ScJaA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 07:09:45 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 07:09:45 +0000
Message-ID: <f4daa4ba-132d-4082-acd3-572a044a382a@intel.com>
Date: Thu, 26 Nov 2026 12:39:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] tests/intel/xe_oa: Add unbind/rebind test with an
 open OA stream
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <harish.chegondi@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
 <20261104005505.3232485-12-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261104005505.3232485-12-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0331.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::9) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|IA0PR11MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a38ebdf-5a14-4828-97fb-08df4b8c3fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: ZIOk5UMpn/BSbnYC1iN8RDgZDXjKqrpb7Ncl6RzOBeztu65OHfdP8CFzueKBCQCrinTo7CNqnZk3n1OhO3PZrC5TgttNRDjO3PdeARD2E1+bmaMuqHgjVDkFmfu6bxC2+xUA7G5hp1wrMSOn/15PmAb1c14ZCDW8VXq+zwaM4sIxGNxe12Hjub1oWNRh01SEdzKvLXwiyeNqM7KFeY86Gr566FAG4EICB57rQEu0bzDUsN+nKh8bYW8iUtzpY3I0lVJY6N1popMKDp23XXnPMz2Ycr/DdgmrAxMUPE9VWNbR18f/LRg5Gc+gQN+Mu3/JoB80Q7KrpM/V1WnHL1krwJfljIkz1dcWMfVCobA3Ym6oPdYZSS5qXgcrYu/yUK7ijktfEtgzFeqXnrK14A7fAyGYHA1wmBV7cicADiJIn0CgFASMNDKeAFG5Vi/7od9zZtrpmhcEAlqatfs2vgARxSKT/Q2egsjLbqKyNmZfJETcA0PoFhm8PVCZ9gOVNGN8gdBzJCCv9xqw6iiibuLPOEKI+Dgy68VhynYKSgaLgP/JlGwvcXhiOm2jY5OH4zAnE9hVD1+cVXUNMi/qJFxh6Tu0hMpcsBwPaRi4MT407aW9ATY3Zor24SzOQJQXa1wZqXz0yHAZW+tsKiJuCrQT3VWcPK0PnR5eboffn7RJAqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzdDREVIM0MvZlJzWUZLMVZJdGcxb2puYUlTWi96RjNHTmFIUXliLzFqWHBT?=
 =?utf-8?B?RzVLb1dlREZVWDM5eXp2V1lHTjNtOXd4c3daT3lteWhiU0pYMnZWNzk2Yllj?=
 =?utf-8?B?TWxzMEdaNWpZWVF5cjFySEZMR2tlTUxkTUttMm9NMWt2MDg0N2tWWjFtS1lE?=
 =?utf-8?B?YzBuOGUxU3RkaTNpbGs1UFBDNk9TYklGUmRSNXI3NnoyVDVDMXNmdUhnbWY2?=
 =?utf-8?B?NytsS0FhMmFwcmxoTmRCaWJkT0JIUzdVaUxXUzhEMk1EbUFtdGJmRmFGM0xV?=
 =?utf-8?B?RytXalhyanhGc3IzREZLaUE4S0l3elJMY1FXVENaeHJNMUFVZVdqNkpFT0dL?=
 =?utf-8?B?Tng1NStSYmwrVlJubU5zeHk1NVZ1ZWs2SnRwc0c0MFQ1MVdrK014R1ZQcGlM?=
 =?utf-8?B?YS9tT3lHVk1ZWXRDVWVDYy9VbWpicWJxTHFsRFllYXVDNTZmN2tDN1dGN2lu?=
 =?utf-8?B?WkhiQnlIUXp4TnNuM2pEc1JqbEFsR3Y1SUtPUTJ0eVNQN29vT1JxdnMraC8y?=
 =?utf-8?B?TUFGcXRLb3Iya3Q3V3VuRjVTbVhNWTFTSHdZTE45Qy9lbEkxSkxTWTFWdm5W?=
 =?utf-8?B?VXYxMkw1b1NXNm5qb010TXo3ejZqaUZYYmdlR0RhTEphTDNWOTFlb0VRL0FP?=
 =?utf-8?B?U2JZbjlaUlNRRUs1dTdyNVR5N1dLZzNFYW1LenJES2FwV0FBZlJWSlN4Rk01?=
 =?utf-8?B?OXZWUVdSdjdRc0VJWEZNTWNPbzVYMmN2THZuMTYvMUdtR3pxRGRtclY5bUdv?=
 =?utf-8?B?WS92NmtSUXBIeGkreWZVVENrYXZubjZBQzFtelFYN0hFaktGbDh6dU0vcXJD?=
 =?utf-8?B?dFByUC9mRENXMngrVnlGYVllbmNqRlNMbWtZbFVVNFVtWUdCYTBhZWpvN0d4?=
 =?utf-8?B?RCtZQVdXNm9STkxENUlsRDJlc0ZncE9TUFBBemx6VCtaSndUMEVXTndjRW1Z?=
 =?utf-8?B?dkFRUVdDL2FwNWNucVhIWjJGRXdNaFZxM2VEZmFFNm45M0hBN1A1cHhyT0Zz?=
 =?utf-8?B?S3h2SVBGeEtndVFYU0tKQzN3OG84UWt4b1FrUFAxeTgwRUc5c2ZlenlvMEI3?=
 =?utf-8?B?RlB2WEpEbkQ1SDNuWlZWcW12TnBhN3BKbXFqVENvbmV0dEpyaVd1UFZnUXBV?=
 =?utf-8?B?SmRTc0lWTjBkRE9mb0V4RHFRNGhqSm9zMkROSDhNbHN0ZngxUm5SMENNOE1N?=
 =?utf-8?B?N2ZVNTljN09vcHhFQ0tVeHNENm5HaW40R1pzV3J0VWhGWUVnYlpQd0dscnB2?=
 =?utf-8?B?RTU3Mi9KYTkrV1dRN1BxMUhDdDFtUFRmVlFWVnI0cS96YTExRkh3SnlibGxp?=
 =?utf-8?B?UHNoTEQrVVp3TEs4Ukt5RUJ1a2RQYlZkelMwc2s4RklUSHc5SHNnNTJ5OWRP?=
 =?utf-8?B?R2xPejJYNExuRDVjdnpWZ1p3WUpaTzhCTzhadktWeXNOOVpua2tFRVBHdTlT?=
 =?utf-8?B?YnNXdkFGeVhIeW5PU0NMczRNaWhBWU5hMU41N0dtZUlpdDkwK0s3WTFST1Z4?=
 =?utf-8?B?bzlrWmxqUXpIWlROWWFuQThZVWRtdTNOTDNsd0lkTkVEWFVWNG1vVWpkVU5m?=
 =?utf-8?B?eklndTQ2Z3ltYWRoODFZK05ZbEVWRHVNb21kQUpVZDB0eG9oT2tYcTZ5NjY0?=
 =?utf-8?B?NHNIV045N0o3bllmWjdCNFdqeHRoNGpKOER0NVFvQ08yVzY5TjFESlF5K2VR?=
 =?utf-8?B?UlVibWZlTy8rYm9WSDgxTzRiTkUwUjNFdXRyK0NDVUFiZ1dwdzdUVm52RjRB?=
 =?utf-8?B?ditkbm11SUh4VytxNXdpcXBabjIydExZSFladmF2RUc0RDYvS2cwYUJRcTV4?=
 =?utf-8?B?UUlXeWJvVHVlb3JGb2NqQVlwMEFJQXBBaTQ5bEpid0hOdXBuQTRkcDFmbmh0?=
 =?utf-8?B?ekhOUkpJekV5aUtQUUpIZDAweFJWVFVIczZodEhTMXJ5ZElrbkJ0N1FSVnpV?=
 =?utf-8?B?UjRxZ3RSOUt1dlIzV3U0ZFVUWWpLdU5XYmpxVzM5V1lvb0FtcldtQWxQdDN5?=
 =?utf-8?B?cmRwenVoN0pJN1pGam83T1BHZFlHRG5vRkI5eng5ZmN6SXVCU0lMSVMxbnJ4?=
 =?utf-8?B?OEhKVEFodW9JWlpVL3Vld3RSdEFEZ2ZITXhpcFlzQUpmend6UVcyUVRQb1dk?=
 =?utf-8?B?TExiUDFYc2NrcW40WDVNNExLbnpsTXhvVlJKTmE4UkdwU0dKOEFaR0tJSmtL?=
 =?utf-8?B?ODRZSys2ODZudFJhS0hpVEVhT3p4YzNNbDBXMUxxckEyYWw5ZDBNa2ltWlVK?=
 =?utf-8?B?NHNRZ2lpQ3hqTkpYajFnbHdrR2t1M016bGJNN0gzd0lyVnc2b1RORHA3WHU4?=
 =?utf-8?B?Q3phTEl5YW1oK2dNeUhyZ1JMbFVkMllYVWhRY2ZwZVV4d2JOVFBMZz09?=
X-Exchange-RoutingPolicyChecked: Sm2xCWfH9ha6JlCK0zrtKVwCT0l+fUOOV2KoMH7r1RY/+BMnnXu+s2QomRcaw8fpn1ijDcBoG/fxPJR0yjXzHy1ko6oGoUgjnnzyG/fjc9VHzvJPVgRWYfJJV0m7rOZ76xdVydeBgdFSKQycheldxYP9tDvpb9ju9cGLJ84A325VmA5GGzEbKSHV8zjrGMbvhabiHYfkJwvgT+BukiYaAO4up83opxnKJ3me+jc/cZBQGvgTqd6Um/sCW3AcnTchg5PSX8esFCNTkg3MB8u34WBAqVxq8pXUy2sZubJkcVrQqRaB7SPNYFhupF++fvLenjCw1bfzIItDQK7fgaSb/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a38ebdf-5a14-4828-97fb-08df4b8c3fe4
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 07:09:45.1682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yL+yYLq8rJbt/OKwnbnZ4XkDUfBd6JyNhoL4Kqdih+ZvFmDlYVJYd6fU3d9L6Rk8gJqjdp8fT6gkN6MAWfJ8ssfF8BLTryxUsF+vNhTGRxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/4/2026 6:25, Umesh Nerlige Ramappa wrote:
> Open an OA stream, unbind and rebind the xe device, and check the
> stream fd after removal and after the rebind: poll reports
> POLLERR | POLLHUP, and read and the stream ioctls fail with ENODEV.
>
> Run variants that close the stream before or after the rebind. Rebuild
> the device state after the rebind, or after a failed variant, so that
> the remaining subtests run.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   tests/intel/xe_oa.c | 239 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 239 insertions(+)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 8758ab15bf46..046d57c3f4e8 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -22,6 +22,7 @@
>   #include "drm.h"
>   #include "igt.h"
>   #include "igt_device.h"
> +#include "igt_pci.h"
>   #include "igt_syncobj.h"
>   #include "igt_sysfs.h"
>   #include "xe/xe_ioctl.h"
> @@ -2778,6 +2779,225 @@ test_enable_disable(const struct drm_xe_oa_unit *oau)
>   	__perf_close(stream_fd);
>   }
>   
> +/*
> + * The stream fd of a removed device stays valid but the stream is dead: poll reports
> + * POLLERR | POLLHUP and read and all stream ioctls fail with -ENODEV. This holds after
> + * rebind too, since the stream belongs to the removed device instance.
> + */
> +static void probe_stream_after_removal(int fd, const char *when)
> +{
> +	struct drm_xe_oa_stream_info info = {};
> +	uint8_t buf[4096];
> +	struct pollfd pfd = { .fd = fd, .events = POLLIN };
> +	int ret, err;
> +
> +	ret = poll(&pfd, 1, 1000);
> +	err = errno;
> +	igt_debug("[%s] poll: ret=%d revents=0x%x errno=%s\n", when, ret, pfd.revents,
> +		  ret < 0 ? strerror(err) : "-");
> +	igt_assert_eq(ret, 1);
> +	igt_assert_eq(pfd.revents, POLLERR | POLLHUP);
> +
> +	errno = 0;
> +	ret = read(fd, buf, sizeof(buf));
> +	err = errno;
> +	igt_debug("[%s] read: ret=%d errno=%s\n", when, ret, ret < 0 ? strerror(err) : "-");
> +	igt_assert_eq(ret, -1);
> +	igt_assert_eq(err, ENODEV);
> +
> +	errno = 0;
> +	ret = igt_ioctl(fd, DRM_XE_OBSERVATION_IOCTL_INFO, &info);
> +	err = errno;
> +	igt_debug("[%s] ioctl INFO: ret=%d errno=%s oa_buf_size=%" PRIu64 "\n", when, ret,
> +		  ret < 0 ? strerror(err) : "-", (uint64_t)info.oa_buf_size);
> +	igt_assert_eq(ret, -1);
> +	igt_assert_eq(err, ENODEV);
> +	igt_assert_eq_u64(info.oa_buf_size, 0);
> +
> +	errno = 0;
> +	ret = igt_ioctl(fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
> +	err = errno;
> +	igt_debug("[%s] ioctl DISABLE: ret=%d errno=%s\n", when, ret,
> +		  ret < 0 ? strerror(err) : "-");
> +	igt_assert_eq(ret, -1);
> +	igt_assert_eq(err, ENODEV);
> +
> +	errno = 0;
> +	ret = igt_ioctl(fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
> +	err = errno;
> +	igt_debug("[%s] ioctl ENABLE: ret=%d errno=%s\n", when, ret,
> +		  ret < 0 ? strerror(err) : "-");
> +	igt_assert_eq(ret, -1);
> +	igt_assert_eq(err, ENODEV);
> +}
> +
> +#define UNBIND_CLOSE_BEFORE_REBIND	(1 << 0)
> +
> +#define UNBIND_MAX_STREAMS	16
> +
> +struct unbind_stream {
> +	/* Not a drm_xe_oa_unit pointer, the query data is freed on unbind */
> +	int oa_unit_id;
> +	uint64_t properties[20];
> +	struct intel_xe_oa_open_prop param;
> +	size_t report_size;
> +	int fd;
> +};
> +
> +static char unbind_pci_slot[NAME_MAX];
> +static bool unbind_state_stale;
> +static struct unbind_stream unbind_streams[UNBIND_MAX_STREAMS];
> +static int unbind_num_streams;
> +
> +static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_unit *oau)
> +{
> +	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> +	uint64_t fmt = test_set->perf_oa_format;
> +	int n = 0;
> +
> +	s->oa_unit_id = oau->oa_unit_id;
> +	s->fd = -1;
> +	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_UNIT_ID;
> +	s->properties[n++] = oau->oa_unit_id;
> +	s->properties[n++] = DRM_XE_OA_PROPERTY_SAMPLE_OA;
> +	s->properties[n++] = true;
> +	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_METRIC_SET;
> +	s->properties[n++] = test_set->perf_oa_metrics_set;
> +	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_FORMAT;
> +	s->properties[n++] = __ff(fmt);
> +	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT;
> +	s->properties[n++] = oa_exponent_default;
> +	igt_assert_lte(n, ARRAY_SIZE(s->properties));
> +
> +	s->param.num_properties = n / 2;
> +	s->param.properties_ptr = to_user_pointer(s->properties);
> +	s->report_size = get_oa_format(fmt).size;
> +
> +	s->fd = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &s->param);
> +	igt_assert_lte(0, s->fd);
> +}
> +
> +static void unbind_stream_close(struct unbind_stream *s)
> +{
> +	close(s->fd);
> +	s->fd = -1;
> +}
> +
> +/* Make sure the stream is live before pulling the device */
> +static void unbind_stream_check_live(struct unbind_stream *s)
> +{
> +	struct pollfd pfd = { .fd = s->fd, .events = POLLIN };
> +	uint8_t buf[s->report_size * 4];
> +	int ret;
> +
> +	igt_assert_lt(0, poll(&pfd, 1, 2000));
> +	ret = read(s->fd, buf, sizeof(buf));
> +	igt_debug("Pre-unbind read: ret=%d\n", ret);
> +	igt_assert_lt(0, ret);
> +}
> +
> +static void unbind_stream_check_dead(struct unbind_stream *s, const char *when)
> +{
> +	igt_debug("[%s] checking stream on oa unit %d\n", when, s->oa_unit_id);
> +
> +	probe_stream_after_removal(s->fd, when);
> +}
> +
> +/*
> + * Restore a bound device and fresh device state if an unbind/rebind test bailed out
> + * half way, so the remaining subtests can run.
> + */
> +static void unbind_rebind_recover(void)
> +{
> +	char path[PATH_MAX];
> +	int i;
> +
> +	for (i = 0; i < unbind_num_streams; i++) {
> +		struct unbind_stream *s = &unbind_streams[i];
> +
> +		if (s->fd >= 0)
> +			close(s->fd);
> +	}
> +	unbind_num_streams = 0;
> +
> +	if (!unbind_state_stale)
> +		return;
> +
> +	igt_info("Recovering xe on %s after failed unbind/rebind test\n", unbind_pci_slot);
> +	oa_device_fini();
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/xe/%s", unbind_pci_slot);
> +	if (access(path, F_OK))
> +		igt_pci_driver_bind("xe", unbind_pci_slot);
> +
> +	oa_device_init();
> +	unbind_state_stale = false;
> +}
> +
> +/**
> + * SUBTEST: unbind-rebind-stream
> + * Description: Open an OA stream and test the effects of unbind and rebind: the stream
> + *		dies and the device works after rebind.
> + */
> +static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int flags)
> +{
> +	struct unbind_stream *streams = unbind_streams;
> +	struct unbind_stream *primary = &streams[0];
> +	int ret, i;
> +
> +	igt_device_get_pci_slot_name(drm_fd, unbind_pci_slot);
> +	igt_debug("Device %s\n", unbind_pci_slot);
> +
> +	unbind_num_streams = 0;
> +	unbind_stream_open(&streams[unbind_num_streams++], oau0);
> +	igt_debug("Opened %d OA stream(s)\n", unbind_num_streams);
> +
> +	unbind_stream_check_live(primary);
> +
> +	/* Guard against a wedged unbind/bind */
> +	igt_set_timeout(60, "xe unbind timed out (wedged?)");
> +	igt_debug("Unbinding xe from %s with %d stream(s) open\n", unbind_pci_slot,
> +		  unbind_num_streams);
> +	unbind_state_stale = true;
> +	ret = igt_pci_driver_unbind("xe", unbind_pci_slot);
> +	igt_reset_timeout();
> +	igt_assert_f(ret == 0, "xe unbind failed: %s\n", strerror(-ret));
> +
> +	for (i = 0; i < unbind_num_streams; i++)
> +		unbind_stream_check_dead(&streams[i], "after-unbind");
> +
> +	if (flags & UNBIND_CLOSE_BEFORE_REBIND) {
> +		igt_set_timeout(60, "stream close timed out (wedged?)");
> +		for (i = 0; i < unbind_num_streams; i++)
> +			unbind_stream_close(&streams[i]);
> +		igt_reset_timeout();
> +	}
> +
> +	/* Drop all state of the removed device, the drm fd also refers to it */
> +	oa_device_fini();
> +
> +	igt_set_timeout(60, "xe bind timed out (wedged?)");
> +	igt_debug("Rebinding xe to %s\n", unbind_pci_slot);
> +	ret = igt_pci_driver_bind("xe", unbind_pci_slot);
> +	igt_reset_timeout();
> +	igt_assert_f(ret == 0, "xe bind failed: %s\n", strerror(-ret));
> +
> +	/* Restore state for the remaining subtests/fixtures */
> +	oa_device_init();
> +	unbind_state_stale = false;
> +
> +	if (!(flags & UNBIND_CLOSE_BEFORE_REBIND)) {
> +		for (i = 0; i < unbind_num_streams; i++)
> +			unbind_stream_check_dead(&streams[i], "after-rebind");
> +
> +		igt_set_timeout(60, "stream close timed out (wedged?)");
> +		for (i = 0; i < unbind_num_streams; i++)
> +			unbind_stream_close(&streams[i]);
> +		igt_reset_timeout();
> +	}
> +	unbind_num_streams = 0;
> +}
> +
>   /**
>    * SUBTEST: short-reads
>    * Description: Test behavior for short reads
> @@ -5251,6 +5471,25 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>   		}
>   	}
>   
> +	igt_subtest_with_dynamic("unbind-rebind-stream") {
> +		const struct {
> +			const char *name;
> +			unsigned int flags;
> +		} unbind_variants[] = {
> +			{ "close", UNBIND_CLOSE_BEFORE_REBIND },
> +			{ "open", 0 },
> +		};
> +
> +		for (int i = 0; i < ARRAY_SIZE(unbind_variants); i++) {
> +			igt_dynamic_f("%s", unbind_variants[i].name)
> +				test_unbind_rebind(oau0, unbind_variants[i].flags);
> +
> +			/* Device state is rebuilt on rebind, or after a failed variant */
> +			unbind_rebind_recover();
> +			oau0 = oa_unit_by_id(drm_fd, 0);
> +		}
> +	}
> +
>   	igt_fixture() {
>   		oa_device_fini();
>   		disable_trace_log();

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

