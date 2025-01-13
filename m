Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79E4E7719E
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 10:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9642710E61A;
	Mon, 13 Jan 2025 10:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jn/n+Guf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D462610E614;
 Mon, 13 Jan 2025 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736762797; x=1768298797;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=byrHmf10M8u/bTKm+UrfqSkS+6u/z4KyrXXiF1ZquT4=;
 b=Jn/n+Gufh+XwoS7RWSnk1X0unojiChggDsqKpJ9O7m0SaTaYE7EBzG+H
 qtfgOGsc4g0HBKthS0AMa5gvCnJNGmoWWFhJscpdR6uiW+9aNgsywa66O
 wQD5VF40Z5KFkQBCNjvhfBnSTULlfHHWqMeGIjkxUHzXeeRMEhuj5TUr4
 UPNDpzwfL8vD204Hkab+XOTdWRsBG4Km3YvomtKnIC+XfUuUTzBPlAf1j
 pV7cBRqGo6NkP26jrHFN8tuHxMbzw3jzj/i5Mv3ZwRRqp3cy2ecsnMpHR
 Y8aIaD5p4BlQfPMJ+c0ZggN4XsvgHZFepOAmY6rF0oRfmoD0tE8GTRyvM Q==;
X-CSE-ConnectionGUID: ie2KG4tKSY6GJ8QwRcgzjg==
X-CSE-MsgGUID: 4MwuNCiHQJiJwKMYqiA/YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="39831413"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39831413"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 02:05:42 -0800
X-CSE-ConnectionGUID: 9OKPk/a6Rs+TS4a/MGMXjw==
X-CSE-MsgGUID: kGckAUuhRS+CcgG2dbybpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127682232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 02:05:41 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 02:05:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 02:05:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 02:05:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3C2RmJMetn1s6La7vEWgqBS5dw4QYgwh3iNWEWjVibFexbO0YXfAQVY2TKPZywG3L94AdPnd05OO8cUFxuVmHsAqXtI4kD+nNdcn8W0mu8bML72qUSc8RVdtaSIBP6rueKN/NqfNa5dFx6LUVIiEbXFZI6VEiNLDmGPEftIciFFQFrAF8pzCZBL7sJyqIDnOjzpedx/cgjcFsmc5VGiFq7abbdw+yG91nFI9gjtxIYzhsNTBLtfJ8s/1G9z1BAE8MMYpeLWfpEZ5uCYyExIsaSDvOuvFwG1JBTU4ZYfk1htH1sc/R025PMtZOJZQR7BD+CJNIkWOPHvxv0ucCYDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byrHmf10M8u/bTKm+UrfqSkS+6u/z4KyrXXiF1ZquT4=;
 b=ac/sFv28k15q8bf4cJ9cnGvYlE10HxyFOj/I2dv1K04L8rMGId8nEWDFLhbXGTVUR2cikjqp4BUC+cg+boLJyV6EyGk0CjU7uPOz3bndgcUqYG8hQE4/y2Uk5LQihBSBgCVPv7Fao8Y34wmTT2R89RRIiU8Kk2CbvjuvWvxgf7lNE7jp5bXT4cVhsduum3vr9sGmhAq8k5FG2DYbVxXDtbT/2+g7csf2oDh7J9NI2GOv7cYTOijrAYhe1XPdRtGoqw7seKabNiQRY+PuY8oFOjMewfvd/KT/ZmOE16k1KUZNwOE4iVzURQ7Q1AOhJN7GeeMTWcMNHNcb2NydvOVf9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 10:04:58 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 10:04:58 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBsaWIvaWd0X2ttZW1s?=
 =?utf-8?Q?eak:_library_to_interact_with_kmemleak_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGxpYi9pZ3Rfa21lbWxlYWs6?=
 =?utf-8?Q?_library_to_interact_with_kmemleak_(rev2)?=
Thread-Index: AQHbZZFNyllN6FWYukSfNnfdluyjhLMUepMA
Date: Mon, 13 Jan 2025 10:04:57 +0000
Message-ID: <CH0PR11MB54915E678540E7FA1AE67E17EF1F2@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250109181027.90402-1-peter.senna@linux.intel.com>
 <173667139526.2829460.13324038630832694591@b555e5b46a47>
 <70130f72-1bb6-492b-8760-e5a523109e4f@linux.intel.com>
In-Reply-To: <70130f72-1bb6-492b-8760-e5a523109e4f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|DS7PR11MB7739:EE_
x-ms-office365-filtering-correlation-id: bcc404e0-8ff6-412f-136d-08dd33b9bc72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?eldLM09jNm9vU3Rvb3NyMVFJUG11UXRuNDJrbzdOWUttWU9VVFMwRW0yQUVY?=
 =?utf-8?B?T2JET1B3UDZ3dVIrdFBNYVVyMkg5LzZMWC96OHdjdzFEQStxYTRZQmNkSTB1?=
 =?utf-8?B?bUEwYmd6Y01XSEZuMUUxSXlicUJNSmdISTkwaXI0MFBlZHJwNU5xc1Y1OEQw?=
 =?utf-8?B?SFRROEVrMitQVDZQT3dJczllS0Vyd2p4eVZNdVVtR2V5clJwM3RHblRvZ08y?=
 =?utf-8?B?dWhnczNwL25YTDdlY3c0ZjFyQ2xzMzcyOEg3ZVVObnN4b1ZmYXNLYXpEdDA4?=
 =?utf-8?B?UjBFMjRwUGR3MGJPaHVkOXRLUFNSQ0JxZ3JGVld3a3p6QkhWdVM5S2ozZ3RG?=
 =?utf-8?B?WGl2aHRldjZQRlZUekdDbWNMb0JmS1Avc0dzUEJuMEE3WFZmZ0hXOTAyNzRj?=
 =?utf-8?B?Uld0M0ltSnZjbDBPZWlkQXhsZURVK2JWbjViVmVMZENyRFJ0cm80c1d0VHFS?=
 =?utf-8?B?REJWR256bkxGckd6aUFOUmxrK2hpdHpjakFTcStUckt5U2lJYUEvNTNJdVJq?=
 =?utf-8?B?aVh5NWwrOWFWdmlIUGRrb2ZyNytiVzhSMU1TVlgwWEhHaUNrM1c1ZmZrS0ho?=
 =?utf-8?B?ZUxzaThBNi85ZisxRVh2YW5PRGpPOXdXR0hXOGYwb0lwbVRzcEVaQVpPVzgy?=
 =?utf-8?B?aXIwVVAxY3M0NnBpbjkxMHFob3VpTWhwUU93MkloMW9aTlRIRCtYaVRXR0dF?=
 =?utf-8?B?d2VmOFFLdWYzSVhIaDY0R3Vxd3JYdEUwRkFleWhGNWNxbHl5dGtzRjg0RlVu?=
 =?utf-8?B?QkkrcnhrNC9uazdqM01vNkVCend0R2J3OGE5QzdLaEpnT0laSGp0ZUhHeHJE?=
 =?utf-8?B?Z3RWOGlub011TXZObnRySi9ya1Z0TUFXeURTcVZOaTBRczg2SEMwM3ZiQ3px?=
 =?utf-8?B?eFZYWndQdEJoRUV4ZHlDUWExcmZDNHhxWGpKeWtmNjJMbzdmWHd2bnM5VkJs?=
 =?utf-8?B?T3pxKzZTNU9PQS9uVGhQOVIya25rcTdoT0xxMW5HMVA3L1hMOGJVZ0M2TC93?=
 =?utf-8?B?VlB1cFVIYXZxTjNPR1FQTUZ5Yjc0L3NVQzVSeURjZlUrYkx0L1hacXh5NzVT?=
 =?utf-8?B?eDlPY05JL1Y3NnFPeldjVHZES1Q2MThCVXdpN0ZFU3Iybnd1QUFhUEpKb2or?=
 =?utf-8?B?SEpyaWFLR3phSWwxTXN4Wk54TU5DUFVmbE8rV2IxbUdKaWdTMm1INElpNVcy?=
 =?utf-8?B?bWc2VExYTU1CU0RmSDdMcW42c0VjamhOUk1DTEdsd3RTVWtvc1luSkZSdVZz?=
 =?utf-8?B?MEloaDZLNmFscjQrUDFUNzBVc1hnU1U0dUM2aDVERXFFTzJmUDZjcXA3Wmpi?=
 =?utf-8?B?RTliVDhKMVJwdDl4VmtaSEVldCsrRzk3Mllwc2JOTTA2K0JldWRtSXlrWEhI?=
 =?utf-8?B?Wk5QdTFyMmpobnpmZGRZMnUvVlRZU2taTjF4a0UvZ2NsQjA0dVFQc0pZZzRK?=
 =?utf-8?B?SUhlQ0Y3YTRxRkpDN1d2aDBPdlZWZ1FIU1NSK0tVb0NNdTZobjRoNmphOGwy?=
 =?utf-8?B?dGJvRnloazRDeXBUSXlzZDkvNXNwMFN3Z0Y2VjF0RUM1bEVwb1pYRDF3NWU1?=
 =?utf-8?B?YTNZZlBCOW9XQzFNWkhFM3NlZUs4d2FiaHBmb1EyVHlkTmsvcG82bThkU1Iv?=
 =?utf-8?B?bmVrWlRHRkdMNjNjM3FodEo0TDdkLzduajhPbmZXNHF3RUJTZ3MwRm1aRTZt?=
 =?utf-8?B?ZHlLVWo5OERrYTgwZS9MN1JuZ2dkcVdGbkJrRmlEUlFONnpUVGlwcHg2NWpp?=
 =?utf-8?B?dVhXQjJKbVc5T1NzU0I2SmNMY3R4U3R3WVhlWUZqenFoUkdJK2pRalRheitn?=
 =?utf-8?B?dnNPU09sYkl5MHpDWG9mbHZrUHdxbG9UVDIwRlRkeTUrVzRkVjc3c08xSU9G?=
 =?utf-8?B?TmlUYnhFdkVtcDdFeFFRQzNVVGRwc0ZmcjVVaTQxUEJ2T1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFlZS1JtTUNEVDZ4ZGk4Mk03V1JVNm9kVzI5bWxiNk1NcHdUaEEyL3VIK1pK?=
 =?utf-8?B?MExTdHE4MFYvUE9VSEpSYlI4eVRFRXhsYmp6eGs0b0l5T1dkREU4ZitTWno0?=
 =?utf-8?B?QmRMOWFHc2xQT3R4ZElzbjBZUDNiRlVSY1R2NTY2VGZtVlZ0dDJOSHFnelFL?=
 =?utf-8?B?Z0pIdEZpOGxaamxBbk1IeWhweXdMbXh0a0FYTDUySjd6SE5Galc5UCtEbk1S?=
 =?utf-8?B?RnBVQnNzZVVNVTlBVjR4aG5aamV5MTlFeGFQTDRyL3hXWXN6bVBiOWR4NXpB?=
 =?utf-8?B?QTAyRXdIU05LaUJvQ25LZkRwaXlvUzJaMzZab00xOUxpVjlabU92WlVuTFpm?=
 =?utf-8?B?dG9VVnArWXI2dnlua2xjSG11Q1JaWnhBSUNUejVyWklTUUJ4M1VHVnZVZmhY?=
 =?utf-8?B?NVJHWW5jYXdleWRMNldtanFuK0ZLUkNyTDN6SHNhSFBERm5oQ2J1OGExRS9J?=
 =?utf-8?B?Uzc5MXpzaG12YjZVZ21HV3Z5TDVTZ093MnM3cmpGYkd4dGorbmRBQUlPWElq?=
 =?utf-8?B?RjdRV21tRDEyd0V6YUN0S3kvRkc4dXNEV090WmVGZVFwVGYzZ2hEVWJDUUlW?=
 =?utf-8?B?QXBsRDlLaVpEV3R3V2lyb0hYSHlpdTdNaWx0SHdKVTF0aDJxbWQxYW9ySFlT?=
 =?utf-8?B?U3JXRm5Ibnh4MHNHQzVGcE55OVNwQVNyMGIzMlRWdlJVQ1Z2Qkdxa2NFMXQ5?=
 =?utf-8?B?UUxMTFBxa2I0SlVnQXNCZDMwZXFnTW9aQTZ1eDhnOG9laFY1dFhCODZRZ1JE?=
 =?utf-8?B?VHNMWVZSaTNTZmhXeDNpSG04M0JyT1BYZEcvK2tablNYZFphem9rRkZUTkUw?=
 =?utf-8?B?RDhNc0NxaUxpN0V6OVE5NUp5cUdScFpDSzhtSDdSUGQ0YlNPQldYT3IwaXZj?=
 =?utf-8?B?amI1a0J1alVDNnBacURIMWdRM3NoQzJXdExIbXJBREhjVHlDenJYUTRpcXgw?=
 =?utf-8?B?NDlyTjYxU2s3YVlzdlJKenJHM040UzdxWTE2UU11aVJtaDhpYlB1aFZscmh4?=
 =?utf-8?B?M2YxbGlYR1pSNHRKbE5CTjIrZkU0c0pwa1Y4Z3k4d0RTNXhhK2trbWhURktW?=
 =?utf-8?B?bXlwcEx1YkZmSWplZTZTSFV3WHRvNXVzQXBseGRWSnd5MHpkbEV0Q1RTRlJv?=
 =?utf-8?B?YUYxdk5iMmdwMVBidmZKK3k0TDVIUXBFT2VGbGVOL0xhZ01NSEQ1aXpGdUxn?=
 =?utf-8?B?RFZTem5lRzVtVE11WnlDNGc0MHJNZWNiWjVIK3lqTlNib2pzZzcyNERxc01X?=
 =?utf-8?B?MXM5eVlvT0pNc01ubDc5L01DVU52RVBvUDF2TUtuditxTlZZWVdNVjh2b0Ew?=
 =?utf-8?B?WVBrVGx0SFY3SnRLWVRUYmx0QlpyY0lVYjBzWHJxZUFneWdaeGV2aktSbnBK?=
 =?utf-8?B?R1pSczI3N1cvTlI0aXEvVWdnMGRPNkg0R2lPRkR2Y0VzYmRHSHZvUkVwdGVu?=
 =?utf-8?B?Z0tVdFg4MU8wbHhOMVE3SHNyZVprV0lFV1h0aHVEbitEbDNLdk8wdXhtTVRL?=
 =?utf-8?B?Vi95NndRbFVHNFNrakN3eS9IODRnTVQ5VXBrZ0tvSkhOOG56Ni93YnVVbFdY?=
 =?utf-8?B?OC9LRWxVczJsNVZwdHhDNTFUTWFkbC82WlVGZnJZRmhzMHc0YldSc2hzQ1I2?=
 =?utf-8?B?Yk9ldXpPYWRPUVZoeFFFT1VCcWp3OUZMRk1qRkpuaXJMUitFYTRtZG1XMWw1?=
 =?utf-8?B?U3Y5NXRIelVXMlJpZTdYRFdPS281Z0hPbzFDdHpUOHYxTHRPdmRVUWF6Q3Zl?=
 =?utf-8?B?Z2ZOQTdCMTI0YUJxQUpnRnMyUkxxeWhMSERtbnI3aFV0bFgzek5JREFvSGU3?=
 =?utf-8?B?Zm5KM3dzZnRTd3BvYUgydFZ2NFZsYzhySXVjOUdQM21BdEdXRitTRE4ySFcw?=
 =?utf-8?B?b3BmL3VrOWlCb1laaXZZRmNHSTdWd3hYQnJ2cStEUDNXenNoM2RicjYrVE1C?=
 =?utf-8?B?UENwU3hFaGxpMk5NOVYyZmc2N2lOWTVvQ1pyT2UzQmR0d0ZsVWpQcE9lRmZE?=
 =?utf-8?B?ZEFoaWVROTdmQmNNRExpY0ovV05IMkxqNVY4eUdzZ2tjdFBEbVo3VXdsM21H?=
 =?utf-8?B?YWRRMmFVWWdMK0RZS3U2UFR4WHpVRXZSdWJFcVRScDk4K2psVTFwSFdBcnU0?=
 =?utf-8?B?eklVcVZ6eXVSTGFIWExwMFJsUzJWWTJnMFZab29yd2c3VmIxUmc1dUJvaHR3?=
 =?utf-8?B?TUtQR0dka2VHRFN6aG1FWXkyMlFEc3liTGwzakhGVGFLd1dMUG1udFh3NzhG?=
 =?utf-8?B?emVOamxZV1ZMVnVELy9nNXRuQmVnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc404e0-8ff6-412f-136d-08dd33b9bc72
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 10:04:57.9875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hq/5A+qcEa6j85RmHaAtDamjhq2MO1EgY5PwlXVmu5lfReTeQ2C3vnNW7bPKjEpr4rsfmP2O/69tkHZQz0b5Y0J6W3VggpgNDXMnc1l4Uqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQyNjczLw0K
WGUuQ0kuRnVsbCAtIEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgY2Fubm90IGJlIHJlLXJlcG9ydGVk
Lg0KDQpUaGFua3MsDQpSYXZhbGkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5v
cmc+IE9uIEJlaGFsZiBPZiBQZXRlciBTZW5uYSBUc2NodWRpbg0KU2VudDogMTMgSmFudWFyeSAy
MDI1IDEzOjMwDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEk5MTUtY2ktaW5m
cmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTog4pyXIFhlLkNJLkZ1bGw6IGZh
aWx1cmUgZm9yIGxpYi9pZ3Rfa21lbWxlYWs6IGxpYnJhcnkgdG8gaW50ZXJhY3Qgd2l0aCBrbWVt
bGVhayAocmV2MikNCg0KRGVhciBJOTE1LA0KDQoNCk9uIDEyLjAxLjIwMjUgMDk6NDMsIFBhdGNo
d29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogbGliL2ln
dF9rbWVtbGVhazogbGlicmFyeSB0byBpbnRlcmFjdCB3aXRoIGttZW1sZWFrIChyZXYyKQ0KPiBV
UkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQyNjczLw0K
PiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cg
LSBjaGFuZ2VzIGZyb20gWEVJR1RfODE4NF9mdWxsIC0+IFhFSUdUUFdfMTI0MjFfZnVsbCANCj4g
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiAN
Cj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlv
dXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIFhFSUdUUFdfMTI0MjFfZnVsbCBhYnNvbHV0
ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3Ug
dGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNo
YW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIFhFSUdUUFdfMTI0MjFfZnVsbCwgcGxlYXNlIG5vdGlm
eSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8g
YWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2gg
d2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiANCj4gICANCj4gDQo+IFBhcnRp
Y2lwYXRpbmcgaG9zdHMgKDQgLT4gNCkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+IA0KPiAgIE5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBob3N0cw0KPiANCj4gUG9zc2li
bGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRo
ZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gWEVJR1RQ
V18xMjQyMV9mdWxsOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3Nz
aWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QHhlX3BtX3Jlc2lkZW5jeUBjcGct
YmFzaWM6DQo+ICAgICAtIHNoYXJkLWRnMi1zZXQyOiAgICAgW1BBU1NdWzFdIC0+IFtBQk9SVF1b
Ml0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9J
R1RfODE4NC9zaGFyZC1kZzItNDMzL2lndEB4ZV9wbV9yZXNpZGVuY3lAY3BnLWJhc2ljLmh0bWwN
Cj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUv
SUdUUFdfMTI0MjEvc2hhcmQtZGcyLTQzMi9pZw0KPiB0QHhlX3BtX3Jlc2lkZW5jeUBjcGctYmFz
aWMuaHRtbA0KPiANCj4gICANCj4gIyMjIyBXYXJuaW5ncyAjIyMjDQo+IA0KPiAgICogaWd0QHhl
X2V2aWN0QGV2aWN0LW1peGVkLXRocmVhZHMtbGFyZ2U6DQo+ICAgICAtIHNoYXJkLWJtZzogICAg
ICAgICAgW0lOQ09NUExFVEVdWzNdIChbSW50ZWwgWEUjMTQ3M10pIC0+IFtETUVTRy1GQUlMXVs0
XQ0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lH
VF84MTg0L3NoYXJkLWJtZy0yL2lndEB4ZV9ldmljdEBldmljdC1taXhlZC10aHJlYWRzLWxhcmdl
Lmh0bWwNCj4gICAgWzRdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50
ZWwteGUvSUdUUFdfMTI0MjEvc2hhcmQtYm1nLTEvaWd0QA0KPiB4ZV9ldmljdEBldmljdC1taXhl
ZC10aHJlYWRzLWxhcmdlLmh0bWwNCj4gDQo+ICAgKiBpZ3RAeGVfbW1hcEBwY2ktbWVtYmFycmll
ci1iYWQtb2JqZWN0Og0KPiAgICAgLSBzaGFyZC1ibWc6ICAgICAgICAgIFtTS0lQXVs1XSAoW0lu
dGVsIFhFIzExMzBdKSAtPiBbU0tJUF1bNl0NCj4gICAgWzVdOiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RfODE4NC9zaGFyZC1ibWctNC9pZ3RAeGVfbW1hcEBw
Y2ktbWVtYmFycmllci1iYWQtb2JqZWN0Lmh0bWwNCj4gICAgWzZdOiANCj4gaHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdUUFdfMTI0MjEvc2hhcmQtYm1nLTgvaWd0
QA0KPiB4ZV9tbWFwQHBjaS1tZW1iYXJyaWVyLWJhZC1vYmplY3QuaHRtbA0KDQpUaGVzZSB3YXJu
aW5ncyBhbmQgcmVncmVzc2lvbiBhcmUgdW5yZWxhdGVkLiBQbGVhc2UgZml4IGFuZCByZS1ydW4u
DQoNClRoYW5rIHlvdSENCg0KWy4uLl0NCg==
