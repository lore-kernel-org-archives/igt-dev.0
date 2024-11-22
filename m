Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A016FE65D2F
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 07:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C6A10E0D8;
	Fri, 22 Nov 2024 07:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8nm3tgE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5F910E0D8
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 07:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732262099; x=1763798099;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yWMF1vltEumlMWlL2c+/Kff+HRtqjsouACtIh0/ofB0=;
 b=l8nm3tgEks45mL9QGFuItqM74rEUi60AIpFGl87Ms1JQ8Ll4VJLdeg37
 hneH068S+8l2tMcgGtMkCG9uCnCugc+VP/Fsi7/ALvL4QQWRBj3H3sfvp
 qfedSAJvnccqoouUtkMdYsKlaAjTko3doI4ABMopVRUeSIIGlVgb4/VSL
 Hi/jFbRcYYQXbYWyhRj8QjXrdNs/xClAyj4HdeixvhT/fpUKgaf5v+jpa
 HYNd3/xOugCwlL1Bb1DHZcpMg0XWams+FaiN4C+2OmzXwpC5e2P1Q83X9
 Cg0FMeJik1AeW5F8YmTYHPMD48hQzsxFBPup/+ohjDx9Hqr7fz9yonFt/ g==;
X-CSE-ConnectionGUID: YhA/9WpERWSrXRdpnu/vAQ==
X-CSE-MsgGUID: Fcw+IE9US/qGahA0WDFHKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32333733"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="32333733"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:54:59 -0800
X-CSE-ConnectionGUID: Rc9zHEaFRs2IhV8bdClYVg==
X-CSE-MsgGUID: /AknhdEGTCO0EbEenRltjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="94598840"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 23:54:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 23:54:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 23:54:58 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 23:54:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQzXo29JrWMUz0G3CjSeKFh4dZbdot9lkEcbdhRcIY5fJCFlRTi82tMULwB23fuy+udFiJzWZp22itYlmyYRKCdppxeSdIfC+IaRVdDhYeBHY3pzW1PtreGLXK34ICGfgJwUXI5nv8Grw6y/sOJAdm5at8ymfmijltR5032s3tIVt11R9KX6j+ve5bEWrf+2vHROekhiyiCvrladSuJwI3ln1yy1ePNAEqdxKPDugxeVjmwC/aiA2l8neeWK3feYUc9oO3MgSVWpbhzuy5oNI/UseFYcVbYNqOq37Fv7uHip2oiij5jra23064dkGS+l4yfeL8VEHN5N9QIXyWgimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cn+d2aUxK0EsFxKFaO8y14b+YqOvPTWI5/nBtiipBig=;
 b=niZVhWQlR7uZ16iEOV7FOI8jDChGopRO6KtDmVKQubQW4L/A2pKIPKjFWvNXkOXoF5+aKYrUgUUgWccXRad8I9JfG28Fi9G+i0ry3ZD17eNgDQNVBlSGxNugtwJukTXIuJksvAWFijSPvIyVnPWfi5dDK7i7Yfc5wKzk1HyyfYk3mGABzSBCyv3ROLV3sHsr4vALXPoScY99nFSTnxiidKozun4Qeji8mKi94qh0pXeegJ9/LN9fPlqPI7wunor6SaOGzqV97nCKjMuDDQ9uiz2JgVVHkdobW2xOAAfDWQc4JE35uhLoF5JbG3sCRSaXYxs2ocNNrcVNWGelGA+C2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 BY1PR11MB8008.namprd11.prod.outlook.com (2603:10b6:a03:534::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.24; Fri, 22 Nov 2024 07:54:50 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 07:54:50 +0000
Message-ID: <b170a6c0-1506-4fd8-b125-3a34784658bb@intel.com>
Date: Fri, 22 Nov 2024 09:54:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/4] lib/gppgu_shader: Add read D32 from ppgtt
 virtual address
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <christoph.manszewski@intel.com>, <jonathan.cavitt@intel.com>,
 <mika.kuoppala@intel.com>, <dominik.grzegorzek@intel.com>
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
 <20241121122230.451423-3-gwan-gyeong.mun@intel.com>
 <c03d8285-1a74-499f-b93d-8214131a5d19@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <c03d8285-1a74-499f-b93d-8214131a5d19@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|BY1PR11MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: 919798d4-4445-41d0-9c0d-08dd0acaf0f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG1XNnhlSWl0R0h2anJVNmFzKzFETTljczVCU0NHNHpBQncwVWZrdDI5U1h5?=
 =?utf-8?B?M0g1MWRUV0o5MXZ5TXVQU1N5QkZMbWZjWXZOVjJKR2RUaXpwV3YwYTA0bHNs?=
 =?utf-8?B?Q0hFUzZCbDA5YnJubVZqbDZ1NmxPQXlpNlA1S3pMbit5MmJjaE1CdUg3Skt6?=
 =?utf-8?B?dGtuZlRNYWl6QzNMazlSMElVcDkwdVBVc3FCVjFWMmErbGNSeFZXdlFVVm54?=
 =?utf-8?B?L3FsWmhEYTZvYm90Q05zeFNYMHczSnkwK2I4bHJUVCs3SGF4M2N1U082SElE?=
 =?utf-8?B?L2FGcThNenZnVld1SHdzRHo0Wk1qUkcxcUprcHozZnR4TXp0N2FsOURka3dD?=
 =?utf-8?B?VkQvaTM0c0x5L0lsdDhDbkdpM09PWFg0L2dicFdDRW5IT0J1R3BtcFRQMzhC?=
 =?utf-8?B?TXB3dlZDbUhhRDlnTVJNWllZS1RHRVNxZzNyZ0lYVlpqbTVIZFZwd0kxMXdU?=
 =?utf-8?B?T0xiaEN5cmV2eTkyekVJTzhUV3J1YTdUazFKK20wMnpJbmg5ajRPNERZOFRG?=
 =?utf-8?B?SXRtMSs5dmk1OVNlbG9pUWZ6cEgxNUg1anhORlV1K1NOM044eGlHY011QzZw?=
 =?utf-8?B?a0lFWnUreHphRE9RQ0hZb2I5MjVoZnc3TUVwMmh1QWdQb0hSVWtJUWswbnAr?=
 =?utf-8?B?ejNhSGpKWlcxN2k0NnZnM3oxWlhmSnlmaC90ZDBaald2Vkh6NzMvZDFobkQx?=
 =?utf-8?B?VU5JZG12aFVzNFBiK081azRqak5paWRiUE9qYnpua2tsbkM1NmNEamxMdGtL?=
 =?utf-8?B?N3JteDkvdEs0Y25qNVJBMytTaXlveW5lNlFnNG0xbWcyYnJKcnFacStqNXha?=
 =?utf-8?B?UktuTHVCNVdvZmFKajI3NlhtQ0lSbzZ5a0F5Sk9hbVJVcUI0ZXpjbFAyQm1j?=
 =?utf-8?B?N2FhUHhpOFM5alBGQ2dMOHljNWk0RWNsNS9aS3N2dC9OWDF5L2YyVzNoYkgx?=
 =?utf-8?B?aFlKNjVjQUpSWjRXaHJLVUNURTUzWHdmRnI3WTl6WCsxakJ3K0NVdHRPczRx?=
 =?utf-8?B?d2lkS2lsVjJ6NmdHaVYvbmljK1FacS9uVEhrY3FCYU0vaklFRUx2dDdUTklt?=
 =?utf-8?B?dmZ3dFNobXVSTzR3cythU1lLcCt4RjdiWXpnMHV3SE5kTHNPQURHc2RrTnBt?=
 =?utf-8?B?UWhuOURYelIwN1QxcWUwakpJZE54RXJOdEJtVTRLYmV5b0F0RnpZTkxRa1Ri?=
 =?utf-8?B?VUZYWVNUdXd1RGo2aURGOGI3TE9nZ1dqNk5EcXdqNnM2QldBbW02V2lDOXJh?=
 =?utf-8?B?dUZRaUtqU3JDRUFwUzF2U0FEVFVONFZEdlViWmd0RVhzcE5Gc2dqRi9KQWYz?=
 =?utf-8?B?dlR5L1FDM0hUbm0vVVhBRks0dytkSjBEeWtGUXMrNDVYd1VSTG96clh1aWp5?=
 =?utf-8?B?b3pyMzc5T1R5MFpxanMyYzZDRndMcHRPYzRKQ2VDejZDT2dTYTRXM0NsWU8y?=
 =?utf-8?B?N2FMWmowZWR4RitwbWRob2pMbWhVSUZPQ0Y1STVITmdTdEVhdU5Ic2twMVhJ?=
 =?utf-8?B?RmVFOE5wdHgzcGJjNnhremgvMTY3K3JXVzJ3eDFRZHlDaGNuUWZoRU8rZUpp?=
 =?utf-8?B?OTdBQTYxa2JDWjBabWJrd2w5MTdHc2F4WWtlYjR6M281U09pVTUwM0RYdDJC?=
 =?utf-8?B?dXFmamt1R1dMc1hJeFE1ODByWUhRUjkyZ2psMWhQS1dvbGVCdjM5WjRVcFZo?=
 =?utf-8?B?S2xyYWtWekpJZVJkZVBWM2VIcXZkUlo0UVhlci9XbkZhQ09VejlUcTdZVE1h?=
 =?utf-8?Q?vR+qO5E7cC1mNECDr3IIbYwoc6Ht3OVSFTU68li?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek9IZE5iVGpnMFdFc2NGUTk2cEN4YVoxTWU1L0RmRGlWVEpTQ3VOcTlIRC9s?=
 =?utf-8?B?REJxN250U2JzMVRnSWhTZVJIaTZXK2hyM2ExejFOZXJsLzZ5YlpQYjYybkc0?=
 =?utf-8?B?eHJxQnQzSUJmR3JBS0Z4TFBSYUFaUEVpejVjWWFITUh4ZjlsaElZRWgwbWNu?=
 =?utf-8?B?Y01WNGd4ZG10KzNLRlJJREtQN3ZPMDU4U21ieXRXWlBwMlB1SVR6bGxsUS9s?=
 =?utf-8?B?ZTlmQjRkUmpHUDNHbVgyUkRlSlNhZEJSUGtrbldNbm1nRi81YWZ2MzhIclZK?=
 =?utf-8?B?MXZ0SlhXdEVCcUZkS3lBa0NGUkplYnQxaW1MQzZTd3F1WWVweHUwYlJVeHd0?=
 =?utf-8?B?WXVVc0RFcTdQaW5CcHBlWC9rSEl0Q3JRQWhIQjlSVFJzZU90N21hU29raGxM?=
 =?utf-8?B?MHc1RmkwMFN6aWlnTFlDcUFKWHVySkRzM0VDb0Z6OEpFTmFMb0hxanNvTzdO?=
 =?utf-8?B?c1ppaWRmZlNnbWNOY0lGaDcvK0cyMUR5L0drV1o5U0ZqSjJMWGlyT2d0OHda?=
 =?utf-8?B?S1NnWldRbWFLa1Z1MXVDS0x3T3VIby8rZ3pPaXJQMFB1US9Wc0tOQkFrVUw1?=
 =?utf-8?B?WDFkTjBrWndBUXlhMzd1RGVJVEFrUXQxaVVTZ3Q1WDU3TjB1Y0ZlUUkyL0pM?=
 =?utf-8?B?dlFQT1ZjdGNaNS9aQUYwSHd6VHROWjFNaklvaFBTYXFsUnBLS1NXdlh3eFp2?=
 =?utf-8?B?NWErNkFlYVpKTFNtTFdpOWN5WE94MmROd0gwdkQvUEpHSlM1cCsrN0pLT09M?=
 =?utf-8?B?OW9TWWFtTS9tU0RES2hQOGdHaGxvRjBxNkVkZzVoT0NsU2lvUWt1dXNKL3h0?=
 =?utf-8?B?WjlQUUM1N2V0YW4vdi9mcXFYdkMzY3hXdnlxb0JNN3hnZngyNUxwb3RsRWQ5?=
 =?utf-8?B?M0F6V3NsRU9qeGlqOXZlb2s5WVltUXRYZm9sTVgzc3k0dm9FVFlHblR2OTB2?=
 =?utf-8?B?aWwwSVpzRWprUjZuenYzTVdjeitVSzRxUnJrbGJOQnM5L3JaM0dGNGdCSW9x?=
 =?utf-8?B?b1poMWZJMW5iaGZVWU9tMy9LWnMvNXZhZmh1azRSUmF4c0lVaVZVRTk0QURi?=
 =?utf-8?B?L3AxK0toblp0YzJBMHFxQnB1NDhuZldib09hd1c3RjBoUklNRUp2aDFYT3d1?=
 =?utf-8?B?ZURlRFlYSTN4eEJEVFB4a0JSa05EVDNwRDNMMFpHdmlIR3JGd2hhdHJrREMv?=
 =?utf-8?B?TzVBdkQzZ0JaQTNHeUFqUnpxQ0gvVm1uOTl4cGRHbzZDQ2ZVQ0ticnI1MzR4?=
 =?utf-8?B?cDBSRkcyTFV4THJqSENGVm1ISjY5Q0VwbXFjZDZwUHdvN0J2d1ladWk3cEpR?=
 =?utf-8?B?cGNacGIxT25GTktGalY5cmd0bk9wSXlKaXgxaDZCSXZhczFDdStRWmpjOEI0?=
 =?utf-8?B?M1ZqWXp6c2VINXpQa2hDS2RKQ3RubEtWNzdZSXZuOGRmQ0xBMVpET3hRQmNx?=
 =?utf-8?B?SDduY2o3ajM2bXdGYnh6NDI4YXFGWFNjand0bVNLMElTRXFqMmVER09BaExR?=
 =?utf-8?B?WW9UQkF4SDJjSkNCSHdaTU9jbWpxL1BVU2ZDeTNjVFlYdnRPc2ErbFhpcnp4?=
 =?utf-8?B?REtXWFBVQkovNVJHQzk2Tmo4Mmh5cFJqUGV0NVFrZm5pOVdyUGU4S3FqTkRX?=
 =?utf-8?B?UUl2OWcvSU96YjArNEVDTHhHY2lFS0FSRGNuT0R5VFdWZXlDd0w1SkJNMzda?=
 =?utf-8?B?b1pPeTNYazZhWEEzSXFhNmltTHVHNjQ5clRzaFp5TEVxUWFLQ2VFQXB5WDU2?=
 =?utf-8?B?K2JaZG90bXV4SjlySEpSVDdnTkJma0V6ZFRsTVd5MkNaUy9Jd0RjWndNRnBp?=
 =?utf-8?B?bTVjYk15aVlRdGJTUGxNYWIrWXgrSFhhN3Q4K1hZeVIyTGRyR0w2a3NMS2dQ?=
 =?utf-8?B?OW1pMVdBd09QaHM0czgzVkgzR2JWTlp5eHloL2Y5QmhIQVFVZkZyZUhiVTJi?=
 =?utf-8?B?cXNqc1d6TFN0MWhyMkwwOTZvcEJKbEluQk4raHZTZTg5TlphMVhVVmt5S3Qx?=
 =?utf-8?B?eW5UYVV3eHU2VDIwcUNzVC9UUjI4YkhlSldkVWEwR2lHc2hMSGdhU2R0Y25D?=
 =?utf-8?B?ek5wN2dJZHA3RWNDVUZyYmQzbGt1UE40QnNycXJPb3pTMnhVNnJrUE8reFI3?=
 =?utf-8?B?MEdRWjhvRmlqVGdmSlUzZkk3V3pKWENKekdGdEFVZ2thelMrdDN1NTZjRkwy?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 919798d4-4445-41d0-9c0d-08dd0acaf0f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 07:54:50.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NBGj8/GVKvvPTK8IcrWd55M0ufGEPz0VKNfYFLLRWuKn7HcjysBh3J+8VFHUTbnIj+WaM3vyPxD+bpLDCGblXobp+/XEGQHySyPz7CcvBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8008
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



On 11/21/24 6:14 PM, Hajda, Andrzej wrote:
> 
> W dniu 21.11.2024 o 13:22, Gwan-gyeong Mun pisze:
>> Create a function that adds the capabilty to read an dword size from a
>> given ppgtt address. Use an Untyped 2D Block Array Load DataPort
>> functionality of XE2+ with A64 flat addressing to direct accessing an
>> entire ppgtt address space.
>>
>> For the read to succeed, the given ppgtt virtual address has to be bound.
>> Otherwise a load page fault will be triggered.
>>
>> v2: Fix the function name to be more clear. (Christoph)
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> ---
>>   lib/gpgpu_shader.c          | 94 +++++++++++++++++++++++++++++++++++++
>>   lib/gpgpu_shader.h          |  1 +
>>   lib/iga64_generated_codes.c | 21 ++++++++-
>>   3 files changed, 115 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>> index d9da35895..147df3a3d 100644
>> --- a/lib/gpgpu_shader.c
>> +++ b/lib/gpgpu_shader.c
>> @@ -897,3 +897,97 @@ void gpgpu_shader__write_a64_dword(struct 
>> gpgpu_shader *shdr, uint64_t ppgtt_add
>>   #endif                                        \n\
>>       ", lower_32_bits(addr), upper_32_bits(addr), value);
>>   }
>> +
>> +/**
>> + * gpgpu_shader__read_a64_dword:
>> + * @shdr: shader to be modified
>> + * @ppgtt_addr: read target ppgtt virtual address
>> + *
>> + * Read one D32 data (DW; DoubleWord) directly from the target ppgtt 
>> virtual
>> + * address (A64 Flat Address model).
>> + *
>> + * Note: for the read to succeed, the address specified by 
>> @ppgtt_addr has
>> + * to be bound. Otherwise a load page fault will be triggered.
>> + */
>> +void gpgpu_shader__read_a64_dword(struct gpgpu_shader *shdr, uint64_t 
>> ppgtt_addr)
>> +{
>> +    uint64_t addr = CANONICAL(ppgtt_addr);
>> +
>> +    igt_assert_f((addr & 0x3) == 0, "address must be aligned to 
>> DWord!\n");
>> +
>> +    emit_iga64_code(shdr, read_a64_dword, "                    \n\
>> +#if GEN_VER >= 2000                                \n\
>> +// Unyped 2D Block Array Load                             \n\
>> +// Instruction_Load2DBlockArray                            \n\
>> +// bspec: 63972                                    \n\
>> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies 
>> both        \n\
>> +//    the block parameters and the 2D Surface parameters.            \n\
>> +// Untyped2DBLOCKAddressPayload                            \n\
>> +// bspec: 63986                                    \n\
>> +// [243:240] Array Length: 0 (length is 1)                    \n\
>> +// [239:232] Block Height: 0 (height is 1)                    \n\
>> +// [231:224] Block Width: 0xf (width is 16)                    \n\
>> +// [223:192] Block Start Y: 0                            \n\
>> +// [191:160] Block Start X: 0                            \n\
>> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 
>> bytes)            \n\
>> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)                
>> \n\
>> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 
>> bytes)            \n\
>> +// [63:0] Untyped 2D Surface Base Address                    \n\
>> +// initialize register                                \n\
>> +(W)    mov (8)            r30.0<1>:uq    0x0:uq                \n\
>> +// [0:31] Untyped 2D Surface Base Address low                    \n\
>> +(W)    mov (1)            r30.0<1>:ud    ARG(0):ud            \n\
>> +// [32:63] Untyped 2D Surface Base Address high                    \n\
>> +(W)    mov (1)            r30.1<1>:ud ARG(1):ud                \n\
>> +// [95:64] Untyped 2D Surface Width: 0x3f                    \n\
>> +//       (Width minus 1 (in bytes) of the 2D surface, it represents 
>> 64)    \n\
>> +(W)    mov (1)         r30.2<1>:ud    0x3f:ud                \n\
>> +// [127:96] Untyped 2D Surface Height: 0x0                    \n\
>> +//        (Height minus 1 (in number of data elements) of            \n\
>> +//        the Untyped 2D surface, it represents 1)                \n\
>> +(W)    mov (1)         r30.3<1>:ud    0x0:ud                \n\
> 
> 
> No need to setting to 0 twice.
> 
will drop it.
> 
>> +// [159:128] Untyped 2D Surface Pitch: 0x3f                    \n\
>> +//         (Pitch minus 1 (in bytes) of the 2D surface, it represents 
>> 64)    \n\
>> +(W)    mov (1)            r30.4<1>:ud    0x3f:ud                \n\
>> +// [231:224] Block Width: 0xf (15)                        \n\
>> +//         (Specifies the width minus 1 (in number of data elements) 
>> for this    \n\
>> +//         rectangular region, it represents 16)                \n\
>> +// Block width (encoded_value + 1) must be a multiple of DW (4 
>> bytes).        \n\
>> +// [239:232] Block Height: 0                            \n\
>> +//         (Specifies the height minus 1 (in number of data elements) 
>> for    \n\
>> +//         this rectangular region, it represents 1)                \n\
>> +// [243:240] Array Length: 0                            \n\
>> +//         (Specifies Array Length minus 1 for Load2DBlockArray 
>> messages,    \n\
>> +//         must be zero for 2D Block Store messages, it represents 
>> 1)        \n\
>> +(W)    mov (1)            r30.7<1>:ud    0xf:ud                \n\
> 
> 
> Again maybe 0x3.
> 
> 
  As explained in the reply to the “[i-g-t,v2,1/4] lib/gppgu_shader: Add 
write D32 to ppgtt virtual address” patch, this is what r30.7 needs to 
set as 0xf:ud.

Br,
G.G.

>> +//                                        \n\
>> +// dest data payload format is selected by Data Size.                \n\
>> +// Block Height x Block Width x Data size / GRF Register 
>> size            \n\
>> +//    => 1 x 16 x 32bit / 512bit = 1                        \n\
>> +// data payload format size is 1 GRF Register.                    \n\
>> +//                                        \n\
>> +// send.ugm Untyped 2D Block Array Load                        \n\
>> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc                \n\
>> +// Execution Mask restriction: SIMT1                        \n\
>> +//                                        \n\
>> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D 
>> Block)    \n\
>> +// bspec: 67780                                    \n\
>> +// 0x0 =>                                    \n\
>> +// [32:22] Global Y_offset: 0                            \n\
>> +// [21:12] Global X_offset: 0                            \n\
>> +//                                        \n\
>> +// Message Descriptor                                \n\
>> +// bspec: 63972                                    \n\
>> +// 0x2128403 =>                                    \n\
>> +// [30:29] Address Type: 0 (FLAT)                        \n\
>> +// [28:25] Src0 Length: 1                            \n\
>> +// [24:20] Dest Length: 1                            \n\
>> +// [19:16] Cache : 2 (L1UC_L3UC) 10                        \n\
>> +// [15] Transpose Block: 1                            \n\
>> +// [11:9] Data Size: 2 (D32) 10                            \n\
>> +// [7] VNNI Transform: 0                            \n\
>> +// [5:0] Load Operation: 3 (Load 2D Block) 11                    \n\
>> +(W)    send.ugm (1)        r31    r30    null    0x0    0x2128403    \n\
>> +#endif                                        \n\
>> +    ", lower_32_bits(addr), upper_32_bits(addr));
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Regards
> Andrzej
> 
>> +}
>> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
>> index 18a4c9725..07ed0fe1b 100644
>> --- a/lib/gpgpu_shader.h
>> +++ b/lib/gpgpu_shader.h
>> @@ -87,6 +87,7 @@ void gpgpu_shader__write_on_exception(struct 
>> gpgpu_shader *shdr, uint32_t dw, ui
>>                         uint32_t y_offset, uint32_t mask, uint32_t 
>> value);
>>   void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, 
>> uint64_t ppgtt_addr,
>>                      uint32_t value);
>> +void gpgpu_shader__read_a64_dword(struct gpgpu_shader *shdr, uint64_t 
>> ppgtt_addr);
>>   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>>   void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
>>   void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
>> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
>> index e97bcf042..721ac267f 100644
>> --- a/lib/iga64_generated_codes.c
>> +++ b/lib/iga64_generated_codes.c
>> @@ -3,7 +3,7 @@
>>   #include "gpgpu_shader.h"
>> -#define MD5_SUM_IGA64_ASMS a1ee0173014ab4cda3090faeca1cbae1
>> +#define MD5_SUM_IGA64_ASMS bdc80eeb9a11b97ff51422a39f4623f5
>>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>>       { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> @@ -79,6 +79,25 @@ struct iga64_template const iga64_code_gpgpu_fill[] 
>> = {
>>       }}
>>   };
>> +struct iga64_template const iga64_code_read_a64_dword[] = {
>> +    { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> +        0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>> +        0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
>> +        0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
>> +        0x80000061, 0x1e354220, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
>> +        0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
>> +        0x80032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
>> +        0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +        0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +        0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +    }},
>> +    { .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
>> +
>> +    }}
>> +};
>> +
>>   struct iga64_template const iga64_code_write_a64_dword[] = {
>>       { .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>>           0x800c0061, 0x1e054330, 0x00000000, 0x00000000,

