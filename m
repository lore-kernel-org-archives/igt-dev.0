Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13198CA0EC4
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 09:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0ECB10E110;
	Tue, 12 Aug 2025 09:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iiG3jq2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8256D10E110
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754989927; x=1786525927;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=klGUCn2SwJZebmgm2FSTqxLCx3ym1fFagiyAYnYOFHE=;
 b=iiG3jq2k5/LnBC64C4mPpCzhMh99g/racdLex5zZyXM/QxCU+b5wg92p
 u5DPTOun7smJVzzyh1Aqymi8kPCz46GVwK93EJB8/+PMkgOSeBbPTRdJO
 CAbobB7rj0mTBJ2/ovEonTJwc/VJlKF+EYZPwwNHBe67i4p+tyx5JtcP+
 YYx9SUNAC3Am8rJUqTa7QhLLO5MRVbW1/1UdBFAxbDRmP+z5ao4TlVVM4
 931oz+R5D6x5tC3DN1lpDgmD/zkW6jtD5vbmmZ7RilcePK2oF5wAFSoc+
 07+Mgck6Dy+Xkql9iAS2ro0B9xWxAQEmIub4rzV5mEy4oRR4HLAkiBCsa Q==;
X-CSE-ConnectionGUID: tUMp1sBNS+ymu6tIZgNUXg==
X-CSE-MsgGUID: 1I+eHVrJSi6DSPSo7Sob5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67860772"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="67860772"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 02:12:06 -0700
X-CSE-ConnectionGUID: N87kyA7ORyOlKq5lzkIVmw==
X-CSE-MsgGUID: z09EREQpQpaQAh8HzDBykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165338197"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 02:12:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 02:12:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 12 Aug 2025 02:12:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.64)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 02:12:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkrHtC7jviBCyyQDksgU3ibnKa1Ue8WOGuzv2uehZ+Ph/YacmQKguNMTNP+T/TT7GZFoZJio+yz0M0s9dDK84uDfwhT6L/h1zRVmHh65wbU//MUwNX43MI5dwHFVQ0/BivUot+svdQAhBh1bYqkty+utQyKI46drzVzK/7A3zL4FAdbQ9powEN189POrQZdmvEqwHWN1Jl0JOHDPd33mP3zkT1GSIyJcBqWgE8Dyd2hpRTKJJlGnXVc3OjqLob8mq0fgyekta+eSdX+CPt8XG4yt15S2DxhrAbkrksNJ7Y4jyLMJbK+8McjVQa61T7HzKe4Ro8QR9GxMMOKJFy262Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCoVDHPmtwwAuYu7fGJyw9qf9/a2pQ+j9ztyKkg7xkQ=;
 b=Brn+Uju05NVMkCXovkwr0apnqY2PoNQObKMBcnb71VqKtVYK5Xh9rD5TL2ZO6Kdf2w325iaVaCw1mWe0j8x9uXMhI/6MN+l40MAToQMWcoDffbzjvrqi70zICmGL7+56GW1ra4n79CUOCBixTKWNRIKMvFJhbYU53bDPW3Dc1mhUlfgqHiZ8NI/znYyOOjQz4pnnJ39TsIyZ9XbJRFPrOKWF17NnTEu7mOpBJgyX2AjnISUriLDIfcvBxGH95AJxvmWYluMaog2bc29fpxyZBMW92t/GvQ6C1MNCBB5VvbsiC+ZkUeXfUTytWsHuDBIJix5b9NxtfmR8LTLVXRDeGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ5PPFE5BD61D44.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 09:11:58 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9009.021; Tue, 12 Aug 2025
 09:11:57 +0000
Message-ID: <bf5410b3-cc19-4a16-8f59-def4e4c4a7f9@intel.com>
Date: Tue, 12 Aug 2025 14:41:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/kms_hdr: Set HDR meta-data while testing
 for panel capability
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250811075850.28146-1-chaitanya.kumar.borah@intel.com>
 <20250811075850.28146-2-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250811075850.28146-2-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ5PPFE5BD61D44:EE_
X-MS-Office365-Filtering-Correlation-Id: a148365c-8043-4413-1424-08ddd98049a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlBTUjEvdUNUV3o0dXdlR040Z21nejQzVlNYT2hPN2RDYmpMUEhHcXduS0tR?=
 =?utf-8?B?Mi8wTmxzUlBIbE5nK1lpditOQ2xtbnNSd2NiTXpQNWRPamZJNmdMOXdtQURW?=
 =?utf-8?B?WmxEYi9MbUFHMVZ5SHFWVnhrVGVSUXNGTmxzdXJHWXYrYncwejdOeWloOHZD?=
 =?utf-8?B?ckZLdFdRN3BFVHp5akdOOEZwUDlhdS82NWthZHJXdzgwQnViUDdYYmp5a1V1?=
 =?utf-8?B?ekFSMXlONGwwQkQ3bjRwS0ZhaldqQVpTblE4R0lKRkhqNG5IMENHMFJBVWlj?=
 =?utf-8?B?YWlXK1lhQU5xWDN0WWpuOGlVRktmSzdQUnhRTHY3OUkrUWlibDlRd0sweGpQ?=
 =?utf-8?B?WFJWazFyRDczeEY3RjNWSk0xZGdGcDhnc1M2NndPTDNTQkJkMysrcWZxQXZF?=
 =?utf-8?B?U0ZhQ3hXUzZTc2lzKzJlb1BmbmZjeVRtUUhrL1NSb1FvaFZja0ZQWHhpTWdF?=
 =?utf-8?B?OWJFZlZyc1lPK2VIUks0U3pkUUVWMTlIWExsdFNwRGFWQkdiL1o1aDE5emNq?=
 =?utf-8?B?WFNGUjlkWTRpZnZtb3BqWXI3UmRadndlalBrT09ncGluNm50ZGlrcVhuMHRn?=
 =?utf-8?B?c09EYU1pRHBmZkxHSXBVRXJiRGZmSG1VWXRmWmx2b2NGZUZuNFZmWUlEeHNn?=
 =?utf-8?B?ckNpeENVSXV4QkZzVmRPeTJoTFBONDZBai96RTE1aVRqdzdKMW5RaHczK2hG?=
 =?utf-8?B?eGYyUHJ6WXBTOEJac3Q0Nmc5TzRHWjd5aXdkb1kwWUN4NUJNMUlYN1cwSzBY?=
 =?utf-8?B?ZjVWNUp2eE5naWNUWDJ2enQ5bU0ySGRmcjBqb21zMWNoNWJ2WWlrbzdFY3RY?=
 =?utf-8?B?aWwyNCtMSms4L0UxZ0JDV05GUHBMQzF2NS91cnRneTYxNldtZ0FJR0ZmM2p6?=
 =?utf-8?B?S21Oa2p4dDRjcFRkR3ZaVm1lbWJheWkzbVVGeWxsbXpMM3dCMldTN1VpOTN0?=
 =?utf-8?B?ajFFZUhzS0FMY3d1UENHdGcxRXNsTzVuTzFlOHlqU2c4T2VydGVmTlpKYmh0?=
 =?utf-8?B?ZElnWjAvUGQvWHRwZ2tXMUpnY3NtM3YvVVkxR3dWYjhRMDNwamg5clpnSFR6?=
 =?utf-8?B?REtxS1BuRGk0VWszRDZ5eitaaUFMME5SRUZsRS9zTVoyWnNYZENObjdmaWVa?=
 =?utf-8?B?WVM0bnd3TFdSVTJWeHAzWTFUQmtUSFI5L2VIWkh0eDcyTDc5NEdMZyt3aFow?=
 =?utf-8?B?ckVOelh1ZHZIM212SXZrRlZRcW9LbVZvZFNUaEQyZyswdXdEZlFvN3Jad0dF?=
 =?utf-8?B?NzJtOUtVOFZITFhCZHZIK1JUL21jeTJGSkhoUzByc0ZEQXFDcW1KU3lkRjdH?=
 =?utf-8?B?ajdHNUNKb1RaN0VhUG4vMkI1NDBaY2U2SFBScDBmOGh4RW1JbGJvaWlLMWZP?=
 =?utf-8?B?S1YrbkhIS0ducmlvNFZSdnd3TEt6NUcvZVlrZzJkOVZwZVFaZG5lbjJVRjBI?=
 =?utf-8?B?NzdIOUNyTjhVNFlOUHg5VjZqK2FudVR5b0RqY0dPS3NwYm1tR3o3RzRCMmJ1?=
 =?utf-8?B?UmhIVnowL1RwZkdKT0RqNHhSZUNjV1d6Skg1NFZhT0QzRGR6a2xRWGZJY2g5?=
 =?utf-8?B?d1FHZWxMUFFXcTVuMjg5VlZKQklvc1o2WjM2VTI2dHRDMm5sMkpzWWFJRXFE?=
 =?utf-8?B?aDhiOTRFdTJHSnRWUXB4ejdvM3M2RDBXWlBoRmppbGF6cjdZZVNMZFlySjdu?=
 =?utf-8?B?cHpoSDhHd0pybTU0WTdyTGtSK0F4VjV1a2l5enE2cE93cVdrVTZ2SWtkcjhm?=
 =?utf-8?B?UFB2eitmcjN1NDBSNm40akEyZ05oZUwvcVJOQ1laOHBZaXdkRUFzUkREL25m?=
 =?utf-8?B?U3Rrd2g5MFh6NnlVTDRqOHhFWjQ0VUhGcm5CejYxUTNwa0J4ekRGaGs3dWpM?=
 =?utf-8?B?WGJyc29IZEowLzBEekZHVWEyWThNMkRFZjVNOEdKZFNjNERUWGJBalJoV1h2?=
 =?utf-8?Q?7bbDY+q2NF0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk1nb2hWS2Fxc1Vja2xJYlR3ZGQvSXY0amtrTitXZHNwU2d3bFI4WG4yY1BI?=
 =?utf-8?B?WDRSNldudnBjN0Y0WStDY2pKWWdTZTZ4MFBVaUo2d0tXY05FSjJMSnZyWHlX?=
 =?utf-8?B?L29HNkU1SER3VVRtVStrZkFlQ3RKaTIxSXpvMHJyYVBadk5SRzJaTmgwOXdH?=
 =?utf-8?B?TDJWbUlJV1BycFFLdkFJanpLV2xEQ1hCU1RTZVN0VjNlMG5ySWRLYUZXQXhm?=
 =?utf-8?B?amV0MDFUdCswZXhnei9YOU5Xdklqb2J0MEQ5TnFGTDFuczNEMVRmYkplQURq?=
 =?utf-8?B?RzJEYWxqNjhaYWRxUHdYODNXZFFZbTFUTWVkZnh3OS9JNzBOaG42aTJqMU1w?=
 =?utf-8?B?YkNSTmlnQTUySm14MUZDZSsrWitCR0FyazhKYTBUaHAveUtJNGNuRVEwNkFq?=
 =?utf-8?B?VWdoM0pVeUQ2MkU1ZndiYTdBUDRUMGN1MWJHMElHd1RVOVU1RU8wQk1LU25q?=
 =?utf-8?B?dnJhM2xEZVNOSDh6cDJhb3ZhdklGM05WQlFPM2FGVUNpYjcxZHVRVFRXM0xj?=
 =?utf-8?B?T1NidXZlYlhhS1ZTVG9Nb0hhd1lYODkyWDhZS0U3d0dLQmh2aU5oWU93VU5W?=
 =?utf-8?B?enMwOHNyM29vME9UVVQySUVNaEJESXNkRjlvN0t0Nkl0U3Zuc0ZJOXE1Nkpa?=
 =?utf-8?B?T2U0TGVGM3E0Qm82ak9WM1FSR29lQngxSXJSTDE3Yi9rd2poVnloWE9ZKzBL?=
 =?utf-8?B?TlBXVXRWRlV0WmY2RTNBY3ZQL3pSc3ZEY2JnSDVLM1g4NG1qNmI2emt3SEI1?=
 =?utf-8?B?VUgzbjRJWndKaGhFT2pJOUtxMjVSTmdNZ2RvTWJKTisxTWdTZm9FTzk5QWRV?=
 =?utf-8?B?c2ErbHdhRXQ1dWFrZm8zYlNtMjFQWmpRaURDM2xNZ3NXVnc4WGExcUxWeWJK?=
 =?utf-8?B?QThjemhoQVpVeTB1eUo5NytHV01ZY1BwaHp4VDlGVXdFRzJCZkczSnhTWjEz?=
 =?utf-8?B?SmQ5dDdHcE5mWkwwK1RWd2xoV0lQN3dQK3lWekNPMEtyWXZzSUIyTSs2TEVz?=
 =?utf-8?B?Q2JQbUw0ZzkzajYwRXBFSlhsNnJvOWM1cWg2aVBaYVZ5OW1uUEdadjB3RzFK?=
 =?utf-8?B?RlcvMlpzN0d0dXJvVEpVa1VQYmVpM3dKVjVBVjdKdjJNYWFVb0p0Y09wMk9K?=
 =?utf-8?B?RkJNZERnMTFKQXBzR2ZjMzZCMFEwaXBkY2lVZ2w2eEV2UTVDMUZFazdiYlFl?=
 =?utf-8?B?d2hBRDF1WUF3YUhTMi9OOTh2YkZFTm1HeEgrSFJKZzNIY285U1NmZG9PUDFP?=
 =?utf-8?B?RjRwdWZ5a1kvMVZNbkdkNnB6VlYwZ2VPWkRJSThEWUwwVlcxdVhWUFZXWWxS?=
 =?utf-8?B?WlZjUWdRZzFiWC9RTzFKVnI0Rk1jMzZQMWVzb2ptRkFlOWNJOGh3OEQwSkdk?=
 =?utf-8?B?ckpYV3VMb0VSR09QTkRVQ0Jvd1RNc0JWODlDa2w0QXFnZXhyUnJjMThjODUx?=
 =?utf-8?B?Smdpd2ZNZjcyck9WeGdQRkdoYWNiUEpydnBCK05qdHBKL0c3WUNSVlE2MS8r?=
 =?utf-8?B?VUhrWHB5VUlNaXIvNU9jaXRTdG1NbHpJZFVKaHhlK040K1pIejkxRGR4NEx2?=
 =?utf-8?B?d3FoRCtZcyttMjR2UlZrR0t2eDJnM0hXMWFiMUJ6TE9Vdm0zcW5yR29kSDRY?=
 =?utf-8?B?Rkk4UG1LQm9XUTBGRXNjdjVNY2t4T1YvbGZ3ZHBsSU1SdlFzNTZ1K1loam51?=
 =?utf-8?B?QTdkbFc2cXlabGNnNWtBQjJLUlp0VU0zcVcwOVVyNXZCVzc0Z1FTOG4va3Jo?=
 =?utf-8?B?OWJVdXptekgrSy9uYlozWmRZREpoVjVjdklyL2ZhZ1NRRWg5SnVrTml4ZVd4?=
 =?utf-8?B?ZTVWcmVpbi9va0I4QXFvdkxiZjFIRmhYWEtSS01TRXhqQ2RWZk9tVFJpdEU2?=
 =?utf-8?B?L2hFRlcrMU5COEtHU3BpTVFLalBmSjA2L2JOUm9oTkVHSHFuQitJUzBsMEho?=
 =?utf-8?B?VjlNTlFwWkt1UXp0WlB4SDBuOUZnQTJwZ1lxa3VEK0FuZCt5bFNkSENUaVMz?=
 =?utf-8?B?Tm1JakJ1bk9sRUlrandpMWl6YW5sa0k0K2NEc3RqbXV0SEJXYzk2QzUrSUxJ?=
 =?utf-8?B?WlBYVzVDdUFicHZaSFd6cW1TcjNOUHpoVmhwQURrU1I4N2s5TWZpdXZCTmJV?=
 =?utf-8?B?QzE3WXV0c3daWFIyZURaSXJ3b0tGd0Ntbm5ScHVsaU9iOFV5TzJuQVR4VGYr?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a148365c-8043-4413-1424-08ddd98049a4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:11:57.4127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwCnqtY4AZy0NJChtFbN3k89tEicf1WHjkffNgkH7LbKh7l84YzY6Co+sFLw+cxfDQLCv205hjqEj7lnh2TilQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE5BD61D44
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

Hi Chaitanya,

On 11-08-2025 01:28 pm, Chaitanya Kumar Borah wrote:
> Checking if the panel supports a max_bpc of 10 is not enough to tell
> if the panel supports HDR. Set HDR metadata on the connector before
> going through the modes. Reset after done.
Can you please add closes tag gitlab# for the bug which is getting fixed 
(if exists) ?
Also, please elaborate "why" existing checks not enough?
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_hdr.c | 114 ++++++++++++++++++++++++++----------------------
>   1 file changed, 61 insertions(+), 53 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 33b6c42a6..76e103ac4 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -153,6 +153,59 @@ static void draw_hdr_pattern(igt_fb_t *fb)
>   	igt_put_cairo_ctx(cr);
>   }
>   
> +/* Converts a double to 861-G spec FP format. */
> +static uint16_t calc_hdr_float(double val)
> +{
> +	return (uint16_t)(val * 50000.0);
> +}
> +
> +/* Fills some test values for ST2048 HDR output metadata.
> + *
> + * Note: there isn't really a standard for what the metadata is supposed
> + * to do on the display side of things. The display is free to ignore it
> + * and clip the output, use it to help tonemap to the content range,
> + * or do anything they want, really.
> + */
> +static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
> +{
> +	memset(meta, 0, sizeof(*meta));
> +
> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
> +
> +	/* Rec. 2020 */
> +	meta->hdmi_metadata_type1.display_primaries[0].x =
> +		calc_hdr_float(0.708); /* Red */
> +	meta->hdmi_metadata_type1.display_primaries[0].y =
> +		calc_hdr_float(0.292);
> +	meta->hdmi_metadata_type1.display_primaries[1].x =
> +		calc_hdr_float(0.170); /* Green */
> +	meta->hdmi_metadata_type1.display_primaries[1].y =
> +		calc_hdr_float(0.797);
> +	meta->hdmi_metadata_type1.display_primaries[2].x =
> +		calc_hdr_float(0.131); /* Blue */
> +	meta->hdmi_metadata_type1.display_primaries[2].y =
> +		calc_hdr_float(0.046);
> +	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
> +	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
> +
> +	meta->hdmi_metadata_type1.max_display_mastering_luminance =
> +		1000; /* 1000 nits */
> +	meta->hdmi_metadata_type1.min_display_mastering_luminance =
> +		500;				   /* 0.05 nits */
> +	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
> +	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
> +}
> +
> +/* Sets the HDR output metadata prop. */
> +static void set_hdr_output_metadata(data_t *data,
> +				    struct hdr_output_metadata const *meta)
> +{
> +	igt_output_replace_prop_blob(data->output,
> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
> +				     meta ? sizeof(*meta) : 0);
> +}
> +
>   /* Prepare test data. */
>   static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   {
> @@ -380,15 +433,6 @@ static bool is_panel_hdr(data_t *data, igt_output_t *output)
>   	return ret;
>   }
>   
> -/* Sets the HDR output metadata prop. */
> -static void set_hdr_output_metadata(data_t *data,
> -				    struct hdr_output_metadata const *meta)
> -{
> -	igt_output_replace_prop_blob(data->output,
> -				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
> -				     meta ? sizeof(*meta) : 0);
> -}
> -
>   /* Sets the HDR output metadata prop with invalid size. */
>   static int set_invalid_hdr_output_metadata(data_t *data,
>   					   struct hdr_output_metadata const *meta,
> @@ -401,50 +445,6 @@ static int set_invalid_hdr_output_metadata(data_t *data,
>   	return igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   }
>   
> -/* Converts a double to 861-G spec FP format. */
> -static uint16_t calc_hdr_float(double val)
> -{
> -	return (uint16_t)(val * 50000.0);
> -}
> -
> -/* Fills some test values for ST2048 HDR output metadata.
> - *
> - * Note: there isn't really a standard for what the metadata is supposed
> - * to do on the display side of things. The display is free to ignore it
> - * and clip the output, use it to help tonemap to the content range,
> - * or do anything they want, really.
> - */
> -static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
> -{
> -	memset(meta, 0, sizeof(*meta));
> -
> -	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> -	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
> -
> -	/* Rec. 2020 */
> -	meta->hdmi_metadata_type1.display_primaries[0].x =
> -		calc_hdr_float(0.708); /* Red */
> -	meta->hdmi_metadata_type1.display_primaries[0].y =
> -		calc_hdr_float(0.292);
> -	meta->hdmi_metadata_type1.display_primaries[1].x =
> -		calc_hdr_float(0.170); /* Green */
> -	meta->hdmi_metadata_type1.display_primaries[1].y =
> -		calc_hdr_float(0.797);
> -	meta->hdmi_metadata_type1.display_primaries[2].x =
> -		calc_hdr_float(0.131); /* Blue */
> -	meta->hdmi_metadata_type1.display_primaries[2].y =
> -		calc_hdr_float(0.046);
> -	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
> -	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
> -
> -	meta->hdmi_metadata_type1.max_display_mastering_luminance =
> -		1000; /* 1000 nits */
> -	meta->hdmi_metadata_type1.min_display_mastering_luminance =
> -		500;				   /* 0.05 nits */
> -	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
> -	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
> -}
> -
>   static void adjust_brightness(data_t *data, uint32_t flags)
>   {
>   	igt_backlight_context_t context;
> @@ -652,6 +652,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
> +	struct hdr_output_metadata hdr;
>   
>   	igt_display_reset(display);
>   
> @@ -701,6 +702,9 @@ static void test_hdr(data_t *data, uint32_t flags)
>   
>   			prepare_test(data, output, pipe);
Please add comment here, "why" this is required.
>   
> +			fill_hdr_output_metadata_st2048(&hdr);
> +			set_hdr_output_metadata(data, &hdr);
Don't we need a commit here?
> +
>   			if (is_intel_device(data->fd) &&
>   			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
>   				igt_info("%s: No suitable mode found to use 10 bpc.\n",
> @@ -710,6 +714,10 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				break;
>   			}
>   
> +			set_hdr_output_metadata(data, NULL);
> +			igt_display_commit2(display, display->is_atomic ?
> +					    COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   			data->mode = igt_output_get_mode(output);
>   			data->w = data->mode->hdisplay;
>   			data->h = data->mode->vdisplay;

