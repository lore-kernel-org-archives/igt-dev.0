Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE63D3B7CA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 09:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A3710E07B;
	Tue, 26 Nov 2024 09:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KoVQH1J/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9845410E07B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732612426; x=1764148426;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TuXb1jALGGpZAvaQ5Wm7YkCp2mmXxFIArDECgwRCkzM=;
 b=KoVQH1J/S8dfybINKMoWEp9x5VVAw1F1D/NLy7YFCtHdO17hv/dX/HU3
 owMcsEAIBv6ILPJi5UsZY99sfPjUOJVQlPuolM1DnOVfYGIeSzA9q9WSs
 r8RSbTQmXHDj53i3rWOLLI6mQgW7jaVFYBdYi2cJgHYkX/uYdGrpnmXHm
 07JqGIP54/pQ9VEYyMVKmBv8sllbI/gf0liPKIkiYG7FoillxPwr8RrdE
 E0NJvuKgmKV0WfP2Fk0SbaJiRjzQ8Fapg6JUohJTXzNYZweX/o3U5TuJE
 WgSHfmLetu0xPKb5IANeVUtKae8NYVt4/aVkw3zPT8LzWaIm2jRjmswDc A==;
X-CSE-ConnectionGUID: 72ZCRj9BQE6na4JYPXmxSg==
X-CSE-MsgGUID: s09C1Je2QEKC3T5IOABHgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32707103"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="32707103"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 01:13:45 -0800
X-CSE-ConnectionGUID: dd4R+ANsSOKEHzgID5OgJw==
X-CSE-MsgGUID: shHR/d03RGS1mQIGU5RmlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="129066727"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 01:13:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 01:13:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 01:13:44 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 01:13:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edCPLQfTgacQ7D1MPedq6MFdwWllaXhsFo7/1SrZ77E/tXzy2GOss3g3u0T53k1k7UAwAeMl7pS6a3XSxS9RoMppZr/v0C48myxwgg0yPnw2FzXApcSWfgMpCJ6cf6Rc8ixRHdFi4ozb33KCgbwZ8mU9Lcsnb70suvB3HQJD8ytsYXrzDqp+1b4vNjXPBVM+bSWC8XHf5XWzlBdRaO+8HDJELodPobPrPq4DZUClSwERDL70tEXGNuU7KsSXojR4pyUZG9N1rCSGqQqMlEhadMdyxCWSr277DOqwahxQ+9wTv9SpIeHg/Vfpnkheu4gqWOhrbqi39O/clIwCcyyUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuXb1jALGGpZAvaQ5Wm7YkCp2mmXxFIArDECgwRCkzM=;
 b=cPWaUaGigsMVDEtRNkKD9nXBlauxmXE/74slMw/LpV0JIjAG11ftHlLOGTMPKWbHKkL6AY8ZQ61eHKu2hAty4xh9wRlbJfxXIo12cRJvv7ZfLt4AT33u0B/aFpRUz/K+pSk5osKfBuDuewAHqBywleVz04VdQv3HN9MtSO6iD++3/cyH/xXWVH91pnViUWEmnOKhXuBli/Jten4aTk9NVwvhbWEBZo4LDncS0hnh6IApZc+lkuH9jskPA/hpzlKlTr8kbhWm8ZMfnddkGa+HvSkTNZWG86zK/biVk8Vy9fTCEHejOKvRrGwrmYqefaDa27Tr07abjOQQQEvfKSuD4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by CH3PR11MB7347.namprd11.prod.outlook.com (2603:10b6:610:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 09:13:41 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 09:13:41 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Maslak, 
 Jan" <jan.maslak@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] lib/xe_query: add xe_hwconfig_lookup_value() helper
Thread-Topic: [PATCH 2/3] lib/xe_query: add xe_hwconfig_lookup_value() helper
Thread-Index: AQHbO5uo6F4HYLS1xEOQ0uh7Ktg2B7LJT76A
Date: Tue, 26 Nov 2024 09:13:41 +0000
Message-ID: <8fa0c3c95b39349d40d73ce41811ccfafdd6c275.camel@intel.com>
References: <20241120222850.1497784-1-jan.maslak@intel.com>
 <20241120222850.1497784-3-jan.maslak@intel.com>
In-Reply-To: <20241120222850.1497784-3-jan.maslak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|CH3PR11MB7347:EE_
x-ms-office365-filtering-correlation-id: 5b316a56-d8f4-4763-8070-08dd0dfa9f10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RGZWU0I1TFN2T2toZHpDd3FheFN0UmN6MUhhLzRDRFRjNjFHa0tyY3FxWm5l?=
 =?utf-8?B?ajJ2NjdzR0dUWHI4cHVQUk9XVU9xQ3ZqTlNnT2JBc283WHRRUmY3TVhIaysr?=
 =?utf-8?B?eXN4dlltQ3pJN2VYWE96bGYzcTdPQlNseHBVWGhKbi9BU1JLUUU0d2haaDhO?=
 =?utf-8?B?WmVuVFVGa0VpSHpSZ3FqVE53c1NNQlEwQkRteW5HekpQek9OQUljdkdEWFMw?=
 =?utf-8?B?SXBRcDB6cUxBMW9zWnROeEd4RWg0R3JqVDFZcktNNXZud2daUUlVQnovaldt?=
 =?utf-8?B?K3R2ZGJKOE1FZ3RwWEVlNmZsMmNkdHNnOWtFSkNGUGM5Ums2cFo2T1ZncmZD?=
 =?utf-8?B?YzRSZlR4Z1k3YW9QZ3R6c0I2SG5XYkozUGt0RURDQ0V3UjQ0c0tjSjl1L0JT?=
 =?utf-8?B?VXV0NFV0RmVGcWx0QVF6Ylo1WmxRNU85dTRWenI5TUhIZWpKaFRXamxhQS9i?=
 =?utf-8?B?eUh0dWhzZ29LVWNaM28rQStNREJGU1RsaDZQSUZTaDZaWVF4VXErUnprczU1?=
 =?utf-8?B?aitrZSt3V1oyYUhDdE9ZNENtVU13dm1tVFNpOUpOSFpxZ015RlBvUUxmSkJV?=
 =?utf-8?B?Y0tjd1E4R2hwblFOYXBkQ3dBYTlpYzJ6NGs2akp1YlpSTXg0RGo0R3pxeUdD?=
 =?utf-8?B?TVNab2s0MTBtRnhRTFlJcEY0cGovR0I5T2xMYzFVaUFTR0Q2d0JZY1NPTnU2?=
 =?utf-8?B?WWROWnN6UWRqVlBCN2N3TmIyYWVERlRZVSthVmU5amxBbTIyRjFQZEF4aG9R?=
 =?utf-8?B?bGxUTXp2UHVuODV4T01LNWVzRXgwMlJ3LzJCY0pUUEJMUy84WGZjUklSbVNx?=
 =?utf-8?B?aXMwRmRJNnpHSllYK2FPNGlvVkl4eDY4cFVvQ2Y4cEloWHNwRlA0aHVtODJX?=
 =?utf-8?B?R3hBWGpBOG5GRXZSM3JrQWtuaTNsVFgyaFNOZktaS21xWUVBS3hTM0JpV09I?=
 =?utf-8?B?RUQ1MnBjVUlrdEovZG5ZVXlmd000Y0h4QzYrODc1c1FRWnYzaGJhL3J0aU1M?=
 =?utf-8?B?OGRsMmpGWVVaNXAwTHFMOHZCUkd5SUwvTkNGNXIxSDdRME1oaXpIOVBxR2Y4?=
 =?utf-8?B?SGhXekkwYzV0U1RFL01SVFk1Zkl2V00rclNHdU0wMFJPd3V2Z2hBb3QyUk85?=
 =?utf-8?B?cGM4aVJ5VHJwS0pwbGo1c3hlemxJcTJ6Um5jZjJRQzFBdXJDdnJhUlNjVGJj?=
 =?utf-8?B?bTFUcjlxUXA3YU1IK3B6MG1VeTRDTFpYNEtIRE10NXlUdlZsNkhhbzI5Wjlo?=
 =?utf-8?B?TDlmYWd4YlBtK29lU0J3M0ZFRjdtQ2I4YXBPRUtKSDkwaUlmU0R2WFoxVTNV?=
 =?utf-8?B?RTdoenhxTlBvMkNLSVBlekFHMjJHM01tazhYR0hUd21MdXJKMDBnMEtON0ZS?=
 =?utf-8?B?MFNHcUJWOEVXY093SXliYlpQZHlubzltcFJSUjQxYTNER2NlL1gxV1BUT2pN?=
 =?utf-8?B?ZWlLcm1Ba0VuRXlVM000YWpEUHlTRmJWSHd4ZVkwY240c0RXUkE5QWRMNlUx?=
 =?utf-8?B?aFlYUEtRVnAydTZ2ZWh4eml1cFAwY3ZPNFdhM0ZsUERUN01Ud3FNdTk1NDR0?=
 =?utf-8?B?MTVrd1U0TjQvUkRLTjExV09YUllCRVJIOVVqZTZBVTU5Vk9pL082bEZkdGoy?=
 =?utf-8?B?SFZrUG12VDlCUWt4a1lTVHhTaGhKTitCcFU3YW82LzgyNmxDa291Mm9LbVFm?=
 =?utf-8?B?aloyQXFFNUNJNnAreVNnL0U0Vklxb0JFWXR1U2JKWkpuS3M2Zmhmalk5QWRL?=
 =?utf-8?B?TDZHNGFKVG1ITkNwT2k0R1orV0xiUUNBZU1oMTVSUVdoVkxYclQ1dTU2aHAx?=
 =?utf-8?B?Z01ncGo5Qk5mWnRYamdRRmJNc0luNTRJSEJDRDZXSUFWUmpudHpiTUovZ2pV?=
 =?utf-8?B?K3ZxUnFqN3VLaklzZlV4M2luOWxQNVYrcStEYk5qWjl6Q3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MU1KbkNna1h3VXh3ZmZjUEpualRJS1M4RmJRc1VUZm5jeDdkT2ZGTFd1Vlow?=
 =?utf-8?B?bTJsemtWb0ZOSEltRDNFL3V0ZHdVZmFEcy9Jb2g3a1hwb21hR20zbkFyVXpI?=
 =?utf-8?B?Z2pJd25zRHZJNnBML0h0ZjJ0bmgwa055TzFVRksxMjAwR1pBLzkxd1JZSHpn?=
 =?utf-8?B?V0hUUDg0ZFFLVzJSV2NZN0lacENCOThLNlB5bFAwaHI1aWpTdWVDVzNreFJV?=
 =?utf-8?B?T0xMNlZMcklGeEVvUUVJK0JETlpRd1BIWTVoR094SC9kUUxhcTF4RkcxOW9Q?=
 =?utf-8?B?TzkyK0dXTjgxRHNvQ0RGenV3RlF4N3RGZlhVRFVoT1djWFM1dlFBa20ram50?=
 =?utf-8?B?SVozRSt5aGFZZjN4SkU1NlE5OVhMNnQzbkNXMHVQYzZXY2cwamJTVUF3dElW?=
 =?utf-8?B?WkF2V1hoR3VvWDM2aFV4TlRWR2NBcm1BTmRhT1pMZ0dBb2xFSmR4YTNOdmVK?=
 =?utf-8?B?UG50dkhVOXBZZGtrVTA3WkxET1ZSTlFqVk1pU2xZQ2hDR2hlYlQwOC9vSEl0?=
 =?utf-8?B?cmdES3hVcDdnK0ZkZ0o3cVVVRXVOaGIwSjRvcXJmT1NmbFBscHlTd1V2RTJC?=
 =?utf-8?B?WUs3K1J2T0prQUhSZ3N1VVZUTDJnamZwL1JoaTh1VDJOWlhTR3MrdlE3L2FI?=
 =?utf-8?B?ZTJkWGZxWEdkZTlvUkZTUnZEcU5MZllCN3c5NGNEeFVnV3piSzNXUWtySUxt?=
 =?utf-8?B?Z3hkbUFjeG56ZEpaUkYzclcxdGtOV2crUnBBdWUxc3ZDWGU2ZWVJQVVJQ1JI?=
 =?utf-8?B?cjlMTlIxR1k5WnIzU3g2Smlrdk1BZlQ2QTB0QTY1K2VWSW1EU3ljeGFJM0lu?=
 =?utf-8?B?QnpENXRlMm9zL2ZuSS84N3VzN05UdmVSb01CNVB3cVMzdTcyWTVRZnVYTnd3?=
 =?utf-8?B?aXN2WEF1Z25CWmU2cXZZTENCZCtZaWNRSDJUY3ZSM0k3SEJ4aDFDUnM0ZzNs?=
 =?utf-8?B?TDRrV2pFUVpXSmh4ekVFN0E5Z2kxYzVyQVBHdm5HbkdvQ1J5TzIyRHlmYkJp?=
 =?utf-8?B?eWVlQVRsQjhqcFpMVTdXS2FQeHNaL2lRWi9QbXlTSnV3bzRUWDNsVjVodHUx?=
 =?utf-8?B?YSs0TnBLY2VOZER3bzFqNjBzY0hHZkpjdnFiZm9DYjZhZ2R4UlZsUVVKZW4r?=
 =?utf-8?B?ZjhaTTBrdjdmOXppS1pEYVFyYmxvS2xVTU9Ga05Kc21kcFA4aFRTT0F3cmJG?=
 =?utf-8?B?REV2aGdwSlhVS0pINFZWTU9EYmxtbHpqdi9BMkh4MTBNYzVhU2tDd0tUYTd0?=
 =?utf-8?B?RU1ETmY2dXg2ZnhPTlZBQ0cxTE40dTYydlFxZ3BxYmNnbWdkVFdsY0RoU2lV?=
 =?utf-8?B?UHYrUldPb3hqa3JYb2RlT29NWlpVeUYxT0Y5cVM2dVpwYVlwdWZQMURPZDUy?=
 =?utf-8?B?MzRwSnJyWU12TkxKbFVKbUFFSFRjNmYxNkk1RVhNbEEvaUJzKzBoNW45RnJm?=
 =?utf-8?B?WFBkMzNqVnZpejg0cWFWb0lkaXdGc1FLbUhiby82aFdpR1hYbEpVTWMyRHl4?=
 =?utf-8?B?cWFLekNrdE03aUcyWjE2TnY1TUlRNUNobTBmbzdDTmRYbjZJd0MrYWlYT0hp?=
 =?utf-8?B?SStnMExWdDBxaUJ3NGhEemFFNmNPMWV0V294N3A3SUxuajZaRWlORThhZ3c3?=
 =?utf-8?B?dGlxVHJ2RzIyalNzUWRxRU5FKzU0bEFhckN1Y2ZxMHRJcXpyTlRGTnhVRHpt?=
 =?utf-8?B?dXdlYzU1UmZEVWZ4SWRmOEYzSGxXRWYrVkt0Y0t1ZS81UDlXVUN5bUJPaEti?=
 =?utf-8?B?R3QwNDMrL2IxaGVGNkIzMEFTMjJKRFFJU2RlRUFYUVo2YzFRYUFjT25abDM2?=
 =?utf-8?B?OEdrQ1BVMkhJZW55blBpaHpiQUdUNXZUQVMyR21SWlpBOUlyT2Z0a0NZbktM?=
 =?utf-8?B?aCtybGl2VmZSdFFudXFtdU5RVDRlNlNyYW1sNDdvNnVma3cwRU8zdmZLTCtq?=
 =?utf-8?B?Y1ZXR3djakwyOUxUODVwMW1CWU1xcUJXcFVMdXlhWHE4OTJpWkxmT2FUbzAy?=
 =?utf-8?B?dmdKSkpFUjVkeFBlYTlEZW5CdEpkVjhwNHR5cnBFRGdUMG10RW1YUkFRTTNj?=
 =?utf-8?B?UnlUOElvRTF6Q3dYWmVTV25NMnR0QXNsdW1iUjNiL0Z6SHlpN3RhNHVYNm9P?=
 =?utf-8?B?aU04NStDMUpSNjJUVHNSN1hYM1ozWXRmZXBuTEcvNFBwWHBTVmdBRDZrRWNR?=
 =?utf-8?Q?FXjo1CVwUAFtLfBMth/dirk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFAA7F8F1577F647B0F738EFA2374F05@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b316a56-d8f4-4763-8070-08dd0dfa9f10
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 09:13:41.7935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hUx82Rxtv+K9OdXSlPyTsAKWz8/EKW+Pk7iiDpKa/ujbTyIKOlGx1H3wXqXUjR45dXIIhy6NrfeJeSjFMkwbVc2PazjbardjnBzMqxQBnGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7347
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

T24gV2VkLCAyMDI0LTExLTIwIGF0IDIyOjI4ICswMDAwLCBKYW4gTWFzbGFrIHdyb3RlOg0KSGkg
SmFuLA0KDQo+IEFkZCBhIG5ldyBoZWxwZXIgZnVuY3Rpb24sIHhlX2h3X2NvbmZpZ19sb29rdXBf
dmFsdWUoKSwgdGhhdA0KPiByZXR1cm5zIGEgcG9pbnRlciB0byB0aGUgdmFsdWUgb2YgYSBnaXZl
biBod2NvbmZpZyBhdHRyaWJ1dGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gTWFzbGFrIDxq
YW4ubWFzbGFrQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIveGUveGVfcXVlcnkuYyB8IDQ0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBsaWIveGUveGVf
cXVlcnkuaCB8ICAyICsrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfcXVlcnkuYyBiL2xpYi94ZS94ZV9xdWVyeS5jDQo+
IGluZGV4IDQ5YmVkMDMzYi4uNzNjOGVkOTQ4IDEwMDY0NA0KPiAtLS0gYS9saWIveGUveGVfcXVl
cnkuYw0KPiArKysgYi9saWIveGUveGVfcXVlcnkuYw0KPiBAQCAtODM5LDYgKzgzOSw1MCBAQCB1
aW50MTZfdCB4ZV9ndF9nZXRfdGlsZV9pZChpbnQgZmQsIGludCBndCkNCj4gIAlyZXR1cm4geGVf
ZGV2LT5ndF9saXN0LT5ndF9saXN0W2d0XS50aWxlX2lkOw0KPiAgfQ0KPiAgDQo+ICsvKioNCj4g
KyAqIHhlX2h3Y29uZmlnX2xvb2t1cF92YWx1ZToNCj4gKyAqIEBmZDogeGUgZGV2aWNlIGZkDQo+
ICsgKiBAYXR0cmlidXRlOiBod2NvbmZpZyBhdHRyaWJ1dGUgaWQNCj4gKyAqIEBsZW46IHBvaW50
ZXIgdG8gc3RvcmUgbGVuZ3RoIG9mIHRoZSB2YWx1ZQ0KPiArICoNCj4gKyAqIFJldHVybnMgYSBw
b2ludGVyIHRvIHRoZSB2YWx1ZSBvZiB0aGUgaHdjb25maWcgYXR0cmlidXRlIEBhdHRyaWJ1dGUg
YW5kDQo+ICsgKiB3cml0ZXMgdGhlIGxlbmd0aCBvZiB0aGUgdmFsdWUgdG8gQGxlbi4NCg0KTml0
OiBJbW8gaXQgd291bGQgYmUgd29ydGggdG8gdW5kZXJsaW5lIHRoYXQgbGVuIGlzIGluIHVuaXRz
IG9mIHVpbnQzMl90LA0Kbm90IGFzIHNvbWVvbmUgY291bGQgdGhpbmsgaW4gYnl0ZXMuIE1heWJl
IHN0aCBsaWtlOg0KICAgICogd3JpdGVzIHRoZSBudW1iZXIgb2YgdWludDMyX3QgZWxlbWVudHMg
aWRpY2F0aW5nIHRoZSBsZW5naHQgb2YgdGhlIHZhbHVlIHRvIEBsZW4uDQoNCj4gKyAqIFRoZSBj
YWxsZXIgaXMgcmVzcG9uc2libGUgZm9yIGZyZWVpbmcgdGhlIHJldHVybmVkIHBvaW50ZXIuDQo+
ICsgKi8NCj4gK3VpbnQzMl90ICp4ZV9od2NvbmZpZ19sb29rdXBfdmFsdWUoaW50IGZkLCBlbnVt
IGludGVsX2h3Y29uZmlnIGF0dHJpYnV0ZSwgdWludDMyX3QgKmxlbikNCj4gK3sNCj4gKwlzdHJ1
Y3QgeGVfZGV2aWNlICp4ZV9kZXY7DQo+ICsJdWludDMyX3QgKmh3Y29uZmlnOw0KPiArCXVpbnQz
Ml90IHBvcywgaHdjb25maWdfbGVuOw0KPiArCXVpbnQzMl90ICp2YWx1ZSA9IE5VTEw7DQo+ICsN
Cj4gKwl4ZV9kZXYgPSBmaW5kX2luX2NhY2hlKGZkKTsNCj4gKwlpZ3RfYXNzZXJ0KHhlX2Rldik7
DQo+ICsNCj4gKwlod2NvbmZpZyA9IHhlX2Rldi0+aHdjb25maWc7DQo+ICsJaWd0X2Fzc2VydCho
d2NvbmZpZyk7DQo+ICsNCj4gKwkvKiBFeHRyYWN0IHRoZSB2YWx1ZSBmcm9tIHRoZSBod2NvbmZp
ZyAqLw0KPiArCXBvcyA9IDA7DQo+ICsJaHdjb25maWdfbGVuID0geGVfZGV2LT5od2NvbmZpZ19z
aXplIC8gc2l6ZW9mKHVpbnQzMl90KTsNCj4gKwl3aGlsZSAocG9zICsgMiA8IGh3Y29uZmlnX2xl
bikgew0KPiArCQl1aW50MzJfdCBhdHRyaWJ1dGVfaWQgPSBod2NvbmZpZ1twb3NdOw0KPiArCQl1
aW50MzJfdCBhdHRyaWJ1dGVfbGVuID0gaHdjb25maWdbcG9zICsgMV07DQo+ICsJCXVpbnQzMl90
ICphdHRyaWJ1dGVfZGF0YSA9ICZod2NvbmZpZ1twb3MgKyAyXTsNCj4gKw0KPiArCQlpZiAoYXR0
cmlidXRlX2lkID09IGF0dHJpYnV0ZSkgew0KPiArCQkJdmFsdWUgPSBtYWxsb2MoYXR0cmlidXRl
X2xlbiAqIHNpemVvZih1aW50MzJfdCkpOw0KPiArCQkJaWd0X2Fzc2VydCh2YWx1ZSk7DQo+ICsJ
CQltZW1jcHkodmFsdWUsIGF0dHJpYnV0ZV9kYXRhLCBhdHRyaWJ1dGVfbGVuICogc2l6ZW9mKHVp
bnQzMl90KSk7DQo+ICsJCQkqbGVuID0gYXR0cmlidXRlX2xlbjsNCj4gKwkJCWJyZWFrOw0KDQpJ
IHRoaW5rIHdlIGNvdWxkIGp1c3QgcmV0dXJuIGFuIGFkZHJlc3MgdG8gY2FjaGVkIGh3Y29uZmln
IGFzIGl0IHJlbWFpbnMgdmFsaWQgdW50aWwNCnRoZSBsYXN0IHVzZXIgY2FsbHMgZHJtX2Nsb3Nl
X2RyaXZlcigpLiBDYWxsZXIgd291bGQgYmUgbm8gbG9uZ2VyIHJlc3BvbnNpYmxlIGZvcg0KZnJl
ZWluZyByZXR1cm5lZCBwb2ludGVyLg0KDQpJbW8sIHlvdXIgYXBwcmFjaCBpcyBhIGxpdHRsZSBi
aXQgY2xlYW5lciwgaG93ZXZlciBsb29raW5nIGF0IG90aGVyIHNpbWlsbGFyDQpjYXNlcyAoZS5n
LiB4ZV9tZW1fcmVnaW9uLCB4ZV9lbmdpbmUpIGl0IGxvb2tzIGxpa2UgdGhlIHByZWZlcmVuY2Ug
aXMgDQpkaWZmZXJlbnQuIEkgd291bGQgcHJvcG9zZSB0byBtYWtlIGl0IGNvaGVyZW50IHdpdGgg
YmVoYXZpb3VyIGFscmVhZHkgcHJlc2VudCBpbiANCnRoYXQgbGlicmFyeS4gDQoNCg0KUmVnYXJk
cywgDQpEb21pbmlrDQo+ICsJCX0NCj4gKwkJcG9zICs9IDIgKyBhdHRyaWJ1dGVfbGVuOw0KPiAr
CX0NCj4gKw0KPiArCXJldHVybiB2YWx1ZTsNCj4gK30NCj4gKw0KPiAgaWd0X2NvbnN0cnVjdG9y
DQo+ICB7DQo+ICAJeGVfZGV2aWNlX2NhY2hlX2luaXQoKTsNCj4gZGlmZiAtLWdpdCBhL2xpYi94
ZS94ZV9xdWVyeS5oIGIvbGliL3hlL3hlX3F1ZXJ5LmgNCj4gaW5kZXggZjg4MzY1NzhlLi4zMGVh
NWFkNDEgMTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9xdWVyeS5oDQo+ICsrKyBiL2xpYi94ZS94
ZV9xdWVyeS5oDQo+IEBAIC0xNSw2ICsxNSw3IEBADQo+ICAjaW5jbHVkZSAiaWd0X2F1eC5oIg0K
PiAgI2luY2x1ZGUgImlndF9saXN0LmgiDQo+ICAjaW5jbHVkZSAiaWd0X3NpemVzLmgiDQo+ICsj
aW5jbHVkZSAiaW50ZWxfaHdjb25maWdfdHlwZXMuaCINCj4gIA0KPiAgI2RlZmluZSBYRV9ERUZB
VUxUX0FMSUdOTUVOVCAgICAgICAgICAgU1pfNEsNCj4gICNkZWZpbmUgWEVfREVGQVVMVF9BTElH
Tk1FTlRfNjRLICAgICAgIFNaXzY0Sw0KPiBAQCAtMTE4LDYgKzExOSw3IEBAIHN0cnVjdCBkcm1f
eGVfZW5naW5lICp4ZV9maW5kX2VuZ2luZV9ieV9jbGFzcyhpbnQgZmQsIHVpbnQxNl90IGVuZ2lu
ZV9jbGFzcyk7DQo+ICBib29sIHhlX2hhc19tZWRpYV9ndChpbnQgZmQpOw0KPiAgYm9vbCB4ZV9p
c19tZWRpYV9ndChpbnQgZmQsIGludCBndCk7DQo+ICB1aW50MTZfdCB4ZV9ndF9nZXRfdGlsZV9p
ZChpbnQgZmQsIGludCBndCk7DQo+ICt1aW50MzJfdCAqeGVfaHdjb25maWdfbG9va3VwX3ZhbHVl
KGludCBmZCwgZW51bSBpbnRlbF9od2NvbmZpZyBhdHRyaWJ1dGUsIHVpbnQzMl90ICpsZW4pOw0K
PiAgDQo+ICBzdHJ1Y3QgeGVfZGV2aWNlICp4ZV9kZXZpY2VfZ2V0KGludCBmZCk7DQo+ICB2b2lk
IHhlX2RldmljZV9wdXQoaW50IGZkKTsNCg0K
