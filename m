Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62943D0C601
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 11:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E7010EA7D;
	Fri, 25 Oct 2024 11:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZ3W4YLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F4810EA7D
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 11:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729857203; x=1761393203;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ODgpWbJ96ADhXnWPvwI1SXj/ihAPgevBBtsWa0ysapk=;
 b=UZ3W4YLbFuqWtQnp+6plNuWEX14g72l27qT5DnPy8zWcol54udaMHRrB
 sEXYu6ugBSn90SvOGGiUnSKkoUL5jk4wiEs7UP+EdjDOpdkbuLHqDwG1z
 j/yJyzn1m2KTs1EBLjfZz0/SX1WOdvSwNlUkp6dScgpeiDG0dkYJV7jBS
 FwjM9thr1DYqZPVx8uB/bkqhvKt2FmS3nyAYHBpEsnG0FkPUfNo6t4Rpx
 OvTtNL6s4o+cdcBI3kV/oxs6itC6e7yC/GqteH3aWrdHXPHWGv+sQI0wT
 Mt/yoLILn2khWqvp0OXl2jnynB/xt1tD931kqbUYQElrdy33wFM5LYxUa A==;
X-CSE-ConnectionGUID: KHJ7RGdnQFqkI0BJo07Q7w==
X-CSE-MsgGUID: fY/QPjETT7+gyBtSumPKKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52078944"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52078944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 04:53:22 -0700
X-CSE-ConnectionGUID: UJMbZYG7ReWnpnV/5tq7YA==
X-CSE-MsgGUID: W4gEdCGUQqecXZCcGKfI+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="85660553"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 04:53:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 04:53:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 04:53:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 04:53:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOqZOSqHH5ErSj/WxP/keNkqW+hgOOC9s8Yrl9iLXuW4rrIo99KAPgec7qOaUtyah29d+Wq/zcV7CoXOQ7M3yLiUM3RcogbM6AV74oI8AuuFh5/nDkiqqs4GmYoHRtFvoucxC8hh1sHsBSrfykR90MEzqAgcwM+bGn2hn8q0s1eO8ycoi2cMhfW8s+8+mB0HHnh1xUP0EpFyjzoCboCUqFAy95RU3cXw/zdTgIN7mKyUTuCx8tKMS0yigRG4TUnqGpnRNCcwNNU0lKsgMvIMh94xTNcbykN1ngHhqV3Qf6dhDm14G1jynK/MUJmLk6lR6E+8+dtkoOZba4SykQb0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODgpWbJ96ADhXnWPvwI1SXj/ihAPgevBBtsWa0ysapk=;
 b=Lx34/4gHjfve6hJpmuvww42ml+uFa6ktJLzL6KYEsrNrtqfnfHepyN7dwj6cqj5JOewVc5IkRgPNes/JrCBQKs60oBC2gR7A3gqEAy0K8vF9DBuKCfQ5HBY4WyyKwBU0yLvzeMYNwgNHOzyDAAaBiD6JAPF98FfVMJfwWhnIMIq+DJAFYLrX90M8UpL2gRa9/4BkmwocjUbP/xeodNhMl4tEAAQ8+TPa49/zA6zyOhtUNw2nhc3WB0g8CTsARMucScPuFzNduZ6l9JKlXyEmkipcUFuby3+QPU2W0IRxK1eluxbffOCOOm6y9hdaW8DfFHACUrRarBu1ZA6KfeIdQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS7PR11MB6245.namprd11.prod.outlook.com (2603:10b6:8:9a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.18; Fri, 25 Oct 2024 11:53:18 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 11:53:18 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_fbcon_fbt: Use linear instead of
 x tiled
Thread-Topic: [PATCH i-g-t v2] tests/intel/kms_fbcon_fbt: Use linear instead
 of x tiled
Thread-Index: AQHbJRH0endMvJE3V0aLgjoMU15qa7KXWqQAgAAELYA=
Date: Fri, 25 Oct 2024 11:53:18 +0000
Message-ID: <3eda828d15dc282e88de24dcaced61ac18dcb895.camel@intel.com>
References: <20241023060740.2573443-1-jouni.hogander@intel.com>
 <e26eb908-57e1-4682-8ba0-761440c32ef8@gmail.com>
In-Reply-To: <e26eb908-57e1-4682-8ba0-761440c32ef8@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS7PR11MB6245:EE_
x-ms-office365-filtering-correlation-id: 6affee49-be58-4e87-98c6-08dcf4eb9e14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?emFQVGl6andNcGtLaVY2WUE2aC9NV0NBVENCNHNaYXdDMFJHc1hhZzRaNVlh?=
 =?utf-8?B?emp2Vk1xRUtjREVBWHNRczNBUWxCQUsxazJpTmtyR2gxczFpSngrSGRvWlVz?=
 =?utf-8?B?SlRMUFh3RU16dTZXRWFjMEJGb2hIbWVUcmR6RUZ6N0ZxcEc1VjRQZzcxODNv?=
 =?utf-8?B?NUtYcDBtQytQd2FYMENrUWRQL1hNK3p4MmJDalM0UEZBK1RaMHJob2srdDR6?=
 =?utf-8?B?NUdQK1FBYm55aVN2dElpUUJEU2NjbUs2RUdKTURaMG1BRFpNaThQY0pJSSt1?=
 =?utf-8?B?dzNycXo0OFg3Y1lSMVg5a0h5OFFuUHdHMTM5WnlVQjA5ejBER2ZKSUtQdTZE?=
 =?utf-8?B?MUFFcGxPbGpYN0xocVpBdzlaOXpoOXFSMCtLQXVUeEZrOTIreEF0TTJsN2I2?=
 =?utf-8?B?N2xHRTA0ZkI5YUsvaEVVTlNUL3k4WXlqWHZwS3ZIVHlCeE5uMy9WZ0lHcVdv?=
 =?utf-8?B?b3BLL1dBbVdsMjJiZ2VITGVpbFZYY2s0T2VXNUJVd0xpZWhvdzRLMXRHZ3Ft?=
 =?utf-8?B?Q3hlT3o0Tkd6OTFlVmpNYVFwRzBncHNlekxZemVFYWJTUzBRN3JpeHhjZDBU?=
 =?utf-8?B?STBhN1FSMDZTTFprdDNaNjdmVmZNaWVwSlVxWUZteURIOFpLczltaEhLcjE3?=
 =?utf-8?B?N0pnM216a2JyZVQ2MWlMQ2tQTmh5aWFoV1FhcXY0TE9PeHRDcUpneGp2SXRa?=
 =?utf-8?B?cnY1a21yMVZ3dGhnUjNGTGVrQmE5b1h6akJwbTdUN3hybGhvOFdmUkprWXlO?=
 =?utf-8?B?MlR5WEkwcStJbTZnSEtzdXF4UUFyeXh4SUdTZldPSms3aE4vL2Ewa0VxbWlT?=
 =?utf-8?B?ejNoSHo2S3lxb21TY25tZmFIZEtBTUpPOFBoM3lydEtKWUk1c0dwZS9Ca1Qy?=
 =?utf-8?B?M2tuUEhCSWtmY2JscnNqZ2xIVzZraTEwbzQ1b1ZjVTRWWHFaRVM1bmZMLzB5?=
 =?utf-8?B?RFVIR2dqRzR5eGk1eXZrNFV0TVYxZ1hBMDIxZ1VrUVQwSVpybkxUdkVlWlZV?=
 =?utf-8?B?OW56MVpMMXAvb3R2MktDQlpEc2o4bS9WcUh6UWgwajFDMmRzRXB6VDN2dTgy?=
 =?utf-8?B?bHdURk5IM3hDaEpBVWdWMzYzemtWdzFOSUl1clBOR0JWVUozZFAxcjRraUhO?=
 =?utf-8?B?a0UxZTJBTVpGMnhrVnBFcHh2NkV4N1IxN1d6a3VEeXIrVW4vT3RvT2hQY2JU?=
 =?utf-8?B?Q2NiZFRFWGQ3dU51MzNiSmQ4WWMrdEN5L1B0TEQ2US9kWTR4VmRSdjhGeHNj?=
 =?utf-8?B?SjNyV2dUVU9KSGE3b1dhcGFXYytNeHBDSmNkSDVJY0ZVWTNSQkJmeElTSXFF?=
 =?utf-8?B?N3k2Rk1sSG1QaEVidmprQnNCYlNEYmxIc1R4dTBNd0VWdWg4eUV3UkNvRm11?=
 =?utf-8?B?VEpRVmJWN01PZnNEOEMxMXdxTEtMczVTdGc1dHdpV2hGRWhDSkhoeXhLVmZi?=
 =?utf-8?B?aWtHQVV5QnN6cUJFaFBsYmtlUGtKWDA2U0YwREwyVlNneG5LckQ4QUlmMW9x?=
 =?utf-8?B?aGZSb3VHanpuRlF4NjdSR2FFR29mdTlacXBZc0VrblVwenpRWmx2b0w0N3Na?=
 =?utf-8?B?eTNJOWN0NUx3cXBNSXEvejRhUEc4Qm5JV1Vtd2dRZm9RbU9SRVlZOEMyM092?=
 =?utf-8?B?bmtvbGJldWVCaVBnR2xFMmlUWHJyOXdSbGhVVE1LdXhqdG4xUTdYcnZDaXlX?=
 =?utf-8?B?eXRpbFExMXJlamQyMGtvYWQweUdJWngvd1hxRVZJTm0wYWVGVW0vdlc4dk9X?=
 =?utf-8?B?Z25QckhuRmE3VUdaL1RteDlhVktXMENCcEFqY3VxSW1MK0dsRm1pOS94N0tW?=
 =?utf-8?Q?YnH5u+1D5dp4SaD6xNYa/bmqQY0QZMhchTu9M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDBPQlNNcFAzd1NWWkc2OEdDS3BDQVlUcXJsbzBTTHhCNWhDMXRjdUIxUzY3?=
 =?utf-8?B?Zis3NUZhMDN2dUllelJSYkduVFg2c0NqRDZOdXNqQURzdjBEd2Q2WW81RmNm?=
 =?utf-8?B?VXprR1ZhckRXanRxc0ZtUlc0eVpRSnQ2cUY4dllENm1MMUp2RnNqVERuS1pU?=
 =?utf-8?B?MlNSTmRDN1YrMFFqRXNVaWFkak9CaUx0Qm54YXBCejdlYzFtTytwUzNHQWdP?=
 =?utf-8?B?cmNsdUpBK0tqTlJmK2k1dERENDJYaFdZRGY4SWJNNHhkTlI1SU1xR1NKaGQy?=
 =?utf-8?B?N3h1RmdORFM4MzNGNzJWNUxDMGxVVFcxMWZhQ2RXV1RqYXdIdzBjRE5scU5D?=
 =?utf-8?B?Y2ZodFViRkI1WkZtTFVPd1J3d0FSN0lzK21yMXExcVRuUjFhbXYzM2xSVnNk?=
 =?utf-8?B?ZXdnRGo2UUVUdENvdE1RNUhPeXdaWVgzaURLdDZ6L1N1RXl1d1BwK0JzV3NB?=
 =?utf-8?B?MXVyei9Hc3JjTU1PWUZyYzZjeVdNM3AvaFUwYXMwdWIvYU92Nmpmc1Z1b2hT?=
 =?utf-8?B?c05kTzVkazFDY2FuSjVxSjFUSFRXcEhpM0NOV0lwQkR6TUR3VXl6bUVKdmxr?=
 =?utf-8?B?cUNFb2tFdjhqNy9XM2RnVExmWUxNWGNKZVBRaEo2ZHVadVlqKzdMYVFiZnJK?=
 =?utf-8?B?ZTYxLzFlVGZSR3RIalN3K2IxUldCUUM0bk9kSHp2VEFvQVQ5ZjUvaFF1UGxi?=
 =?utf-8?B?cUNNd3dVeTBkZktBbjdxZjNtOUhuN2E3QWU0c3pLc1hRQm5DWjlPMHlTR3I0?=
 =?utf-8?B?NVdJbFdwYW9FeGpnSjNvU0xVSEhHQW4ybzRSeTBuNHQ1RmNNbmcydE5DMWpD?=
 =?utf-8?B?SDdOTUR0dVNQS0RvVmhERSsrb25KRHJjZ0VxYk5XSSsvK1VGMkxqbGZqOUti?=
 =?utf-8?B?STBLakR6dS9vUmlFZzVteUw0cHFHMVowSU5FN3lieXdKTU10NkRmNXdzQWF2?=
 =?utf-8?B?eFNWdXNSMTNiV2RzSUJpMzBZbHBPUDRjQUJhQmttd0E0M0w3ZERiM0tmUWJ0?=
 =?utf-8?B?WTMzZ2lmTERhQ2dCeFAweGppMHhCcEw2d00xNzQ3akxtd2FIQnRSQmlCYnND?=
 =?utf-8?B?aS9oU2crOUM2OU1LWjNLRTlhQVFnOUJ3NU9zL2ZIaXVTTU9pckVDdmVBQk0z?=
 =?utf-8?B?VllpNTlhVFc4YzVCR2VRZ2tMRDUzUFJZNDhaM0hxUjNweURrQ29VOCtoVTFT?=
 =?utf-8?B?NEYxYW5sWVg3QzJha293eFlqZUgycE16L2VEcUVESnU3S3FVQ0IzK3BUSHVO?=
 =?utf-8?B?SHhqbVJwS01oUHRwNUxaYTcwT3dhQjRIZHpqb2xOY3Jlak51ZEpUN0FjSkVi?=
 =?utf-8?B?bFZsMXFtdExRaWVlMzRySzQ3RzdDaTNDVCtTRCt2NkpFdGJ3Z1p4N1VaYUUw?=
 =?utf-8?B?bGNCbUZ0SjhSdnFDSlFIaWkza0FvbFBLQU1PLzI5K3k5bUloVnFyckZRV09Q?=
 =?utf-8?B?TWg1ZEMyM0xIbDVYeUM4TzhTRjBHY0g5Q0k5SjE1Wm9VRjhMUVkvdFcwdktI?=
 =?utf-8?B?OWNFWXkyQU9idWU2QjU1RVdIUFdjcFNjMUExSFlrMUlKdVIzd0F2OFJnWHox?=
 =?utf-8?B?cU5FZStCcTk5bDJqYklhbHg5UGhtdFVWa0dQaWRiZU5weWZuZUY3ZEdEeC95?=
 =?utf-8?B?SXRhNDNMaXVlUVAxQzM0WDB1b2ZpMTFlczdTb3RCVk9JLy8rcHBNRTMxYTFm?=
 =?utf-8?B?MzNhNkJyQVpDZVJJdHlrMkVXSDdsUDA5UHEwL0ZjblFFK3dJb0NTM1dUUEwz?=
 =?utf-8?B?cFVoQzk0aldNVjNpVjMrRDJUd3hzNVF4ZDhQMGErS0p0bWE4UFZlZXE4dVFi?=
 =?utf-8?B?aFlIOXhMck9MT203MkxjM0ZyTG5FSHNiUlJITnRBYzdNZ2hRZUpxbkRVS3Zr?=
 =?utf-8?B?azdrRFlCSzdnNUFQREpSWHY4SGFNWGJIRHhrNXJUdENWNjVaeDZOdHlXc1BD?=
 =?utf-8?B?clJOOFA4VThKS1gzWXpLRlljQzRhV1lXY1prMEN1cWhiaWxwN09rc3AvcFFR?=
 =?utf-8?B?UUlkTFZkQk5DQVhEVTRhVHJqNm1DeEdDNkNqSnZHbXNwcFFOekQvelhoZGd1?=
 =?utf-8?B?eVdFMTV4RTYxMTVUT1FNOSsva0tLZEIyaGFIOW1TV3h3QlhLNk9SSFoyd2pn?=
 =?utf-8?B?d25OeksreHFHV2hBY3didndUcXA1OTNHTVI3d0FlVjVzR1FOMCt5d3RDSWZF?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F668A0BDB681E64E8FE4BB479A2A164A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6affee49-be58-4e87-98c6-08dcf4eb9e14
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 11:53:18.6377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mvscziL0Z6PihvRPtFVqg977XBMt8Y6o3Zi8HrNVj+GGZ7LLtsumb2EqERUoDMTcVJbMLPfvKZCvLkBJ0f5ba6r6828soNtThDn4dpvrPnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6245
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

T24gRnJpLCAyMDI0LTEwLTI1IGF0IDE0OjM4ICswMzAwLCBKdWhhLVBla2thIEhlaWtraWxhIHdy
b3RlOgo+IFJldmlld2VkLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tp
bGFAZ21haWwuY29tPgoKVGhhbmsgeW91IEp1aGEtUGVra2EgZm9yIGNoZWNraW5nIG15IHBhdGNo
LiBUaGlzIGlzIG5vdyBwdXNoZWQgdG8KbWFzdGVyLgoKQlIsCgpKb3VuaSBIw7ZnYW5kZXIKCj4g
Cj4gT24gMjMuMTAuMjAyNCA5LjA3LCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6Cj4gPiBQVEwgZG9l
c24ndCBzdXBwb3J0IHggdGlsZWQgZm9ybWF0IGFuZCBvbGRlciBwbGF0Zm9ybXMgKGRpc3BsYXkK
PiA+IHZlcnNpb24gPAo+ID4gOSkgZG8gbm90IGhhdmUgRkJDIHN1cHBvcnQgZm9yIGxpbmVhci4g
VGhlcmUgaXMgbm8gc3BlY2lmaWMgcmVhc29uCj4gPiB0byB1c2UgeAo+ID4gdGlsZWQgZm9ybWF0
IGluIHRoaXMgdGVzdGNhc2U6IHN3aXRjaCB0byBsaW5lYXIgZm9ybWF0IGV4Y2VwdCBvbgo+ID4g
b2xkZXIKPiA+IHBsYXRmb3Jtcy4KPiA+IAo+ID4gdjI6IHVzZSB4IHRpbGVkIGZvciBkaXNwbGF5
IHZlcnNpb24gPCA5Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91
bmkuaG9nYW5kZXJAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiDCoCB0ZXN0cy9pbnRlbC9rbXNfZmJj
b25fZmJ0LmMgfCA0ICsrKy0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19mYmNv
bl9mYnQuYwo+ID4gYi90ZXN0cy9pbnRlbC9rbXNfZmJjb25fZmJ0LmMKPiA+IGluZGV4IDZkMTM0
ZWE2Mi4uYWI0ODE5ZDIzIDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMvaW50ZWwva21zX2ZiY29uX2Zi
dC5jCj4gPiArKysgYi90ZXN0cy9pbnRlbC9rbXNfZmJjb25fZmJ0LmMKPiA+IEBAIC0yMjEsNyAr
MjIxLDkgQEAgc3RhdGljIHZvaWQgc2V0X21vZGVfZm9yX29uZV9zY3JlZW4oc3RydWN0Cj4gPiBk
cm1faW5mbyAqZHJtLAo+ID4gwqAgCj4gPiDCoMKgwqDCoMKgwqDCoMKgYnVmZmVyX2lkID0gaWd0
X2NyZWF0ZV9mYihkcm0tPmZkLCBtb2RlLT5oZGlzcGxheSwgbW9kZS0KPiA+ID52ZGlzcGxheSwK
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBEUk1fRk9STUFUX1hSR0I4ODg4LAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSTkxNV9GT1JN
QVRfTU9EX1hfVElMRUQsICZkcm0tCj4gPiA+ZmIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+IGludGVsX2Rp
c3BsYXlfdmVyKGludGVsX2dldF9kcm1fZGV2aWQoZHJtLT5mZCkpIDwgOSA/Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBJOTE1X0ZPUk1BVF9NT0RfWF9USUxFRCA6Cj4gPiBEUk1fRk9STUFUX01PRF9MSU5FQVIsCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAmZHJtLT5mYik7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgaWd0X2RyYXdfZmlsbF9m
Yihkcm0tPmZkLCAmZHJtLT5mYiwgMHhGRik7Cj4gPiDCoCAKPiA+IMKgwqDCoMKgwqDCoMKgwqBp
Z3RfaW5mbygiU2V0dGluZyAlZHglZCBtb2RlIGZvciAlcyBjb25uZWN0b3JcbiIsCj4gCgo=
