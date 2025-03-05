Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF52C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 11:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F7E10E73A;
	Wed,  5 Mar 2025 11:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="musJ2qj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4F910E73A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 11:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741172912; x=1772708912;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ejsz3uwq5XAOnH4Os9SuTeB1K+w/VLgdhqfVUG0MB0A=;
 b=musJ2qj6G8RMMtn1j8fEpTRRwxwmCA4fO/3fUxqhZfn4rTCKVUo2GVgd
 RfBGpPyqwui+FaCfguOcsAJeMi5BcTvPKtIm7DkLhsLU69Jhbl5KHVv6S
 Razqh2D89U4EuFVSHiatfmZLaFH1HgnRXVcn6QYwq4B1hWuw9hJqzst9P
 Jfp4vntKL8S/AN/SCy3GrcF1kVYnDr5uDaWCwnBEEXZXZd2/uTCaz1FIP
 ruzmPX8fdA5SpPFU1gKFDHYtFrxxxkXGLvpvL8HHOfMctrXkFKeVUR4O+
 xdKnG5Fs0UrvlelhYSOE1LIo0xD0Pi5ycxOcRI8Y+9hVg42NUgUqfs3Hu g==;
X-CSE-ConnectionGUID: STXOFVCdRpGcsJiWYPf8Zw==
X-CSE-MsgGUID: RtmD+fKCS4WW8bZr0grIpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59544207"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="59544207"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 03:08:32 -0800
X-CSE-ConnectionGUID: 5z21f8AnQbiTlGHfJgVx4Q==
X-CSE-MsgGUID: uDD/tpCdSEC0g0bElVWTlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119165406"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 03:08:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 03:08:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 03:08:20 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 03:08:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCxRDuOoBLvX6oN0Lq42oIh8atMFVQIfhar9tNxwLYHxyUTh31qT7SVhzo/H3XskMA+zWjd9yqPqCaMSOEHl/VEWy5xbzdN7cGqjn5m3UeZ3cvbBuzOMVnh1Re6jKk/IT5TqI1wD7Ui8H4n6EAlKn5qWde5dNqrrakRSxO4KKdO6A+BLsIFZK4zNCJsHxOl84orCFEdAuD8rPZZ7aTVwLsC7qBPE3gTrFnYz4+FJwKXfRgpcZlQT5C991v6rDWARzOOy3GM9chIyHD4A+JaO0otYPBvCNEfNP2UBxzg6h2hIplKDsSaPlML0uvDmlDMDKBMrSPyvtTMHueJh2nsLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejsz3uwq5XAOnH4Os9SuTeB1K+w/VLgdhqfVUG0MB0A=;
 b=qw7O3SCqJDNTLNtMHtiJJO3rffDZu5Jx4peY1Dx9BcOiX51nsKtIq7hgytJjpnTh0PDrxYjWgIgqYzycfuhqpuusUuVJIKGOJlp6ayYdlA8WIboYtVdmaj53hOtT4LXQ677Oc8espvWWlLCkI4xi4t46etAjsKzlX8ryL+s6dCO3KQjtkiUKoaabKmSOrxInwxslqevGth8l6R3iMtRQKSsI99+Rhrci+iIPfcx+X/v1m/bSxXi3rzTDEg4g3y+Wly+7xc6hNp5FMZBDa0/TpAh2XjgW3wA5nQDyjgw2yMvzEAtPZRniQEf+OQ4V0az9XMSwkz42/07zcDi2Mn2qYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SN7PR11MB7467.namprd11.prod.outlook.com (2603:10b6:806:34f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 11:07:37 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 11:07:37 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v2 4/5] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Thread-Topic: [PATCH i-g-t v2 4/5] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Thread-Index: AQHbgp6i3dcFFdPDl0yODEUHmLrbF7Nkc7GAgAAB6nA=
Date: Wed, 5 Mar 2025 11:07:37 +0000
Message-ID: <LV3PR11MB86954727287428F44247E5E2F9CB2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
 <20250219073445.31423-5-satyanarayana.k.v.p@intel.com>
 <Z8gsjZarIvdxWlaw@fdugast-desk>
In-Reply-To: <Z8gsjZarIvdxWlaw@fdugast-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SN7PR11MB7467:EE_
x-ms-office365-filtering-correlation-id: 2bc2c5d5-a4ca-447b-02e5-08dd5bd5f031
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cU1XbW53Tm9EaVQvbmpmOGhmVTEvWGFIckgyNnFxUUpRUVlKUDR5Y0xiRno1?=
 =?utf-8?B?dFFXbmlJWGxHcFhObFc2T3FTM0lmcnVPUExRSHI3QzRxcFJ5YVMrRDlmRFRW?=
 =?utf-8?B?cm9mQThQRjFyMzNNSEZDSnVDYzhLY0JkZ056cUtCWDl0dGc4cUpneTFZZGll?=
 =?utf-8?B?cUJNQnYyWW4zTVB6VFcwQ2NEM3VlaTdmalpMMGdNZHNMNUs3TW1hTFdhSFNs?=
 =?utf-8?B?QU8ycWl5QU9IUmU5Z3NRTCs3VEMyNDlMY2w1b0FZZnBOczRmdWowRm1TdVVP?=
 =?utf-8?B?bHdTS2FpalB0UmZZdmJlL0M1enp5QTU5cS9uOEp2TUlpbWdMQ2RMdzBhM2NJ?=
 =?utf-8?B?NXg3cnU1ZUkwNnN4MXdocHJUTHUxQ3FrWXBrSCtMRFhmaG9yajN0aFpXZ0Uw?=
 =?utf-8?B?RlpROS9hNG56eFZwNkhHVlR6WGFvaENBWVAxM0tkdy9pZU5sUEpEYkVoNDVw?=
 =?utf-8?B?N0QreWtoUThlM2o2NjliNm5YWTkxZEFUUXkzU3pta1cyWlhQcjhiTk9GdGZN?=
 =?utf-8?B?ZnllSE1hVU85aTluMWVDNlZyOWZjOTB4NTRZVDN3c1VKMVV5bWVWdDMyaThz?=
 =?utf-8?B?L3pYK0lFbVR2Uy9ZVWtydjRHN3JOamZLY05lOVRUWGNzMnRoV0ZXWGVJVldP?=
 =?utf-8?B?ZmhxQyt0TjJWWldyT0JEeExYWlJCV0grV1pCWFV1TGYvU1dSQmRoZ2ZFVkV5?=
 =?utf-8?B?RGRPdHI3enA4bnJsWTAvVzlzQkNwcWFMZW55U1g3SHE3R2ZVZDZ0SHdlc3NB?=
 =?utf-8?B?eGRBa3VmS1AyNi9KTm41ZHBGK2dnMlI4M2JNU1UvUzBJYlhwQ09aMmRpSGpZ?=
 =?utf-8?B?TUZyQ05LdjF3MGNqMVQwTEhEcFRzYUcxME0xeXRzTUFQRzhBOE5kQ2VYRUpm?=
 =?utf-8?B?dWhvL2dYWnBXeHlrRFhzcVVsb3FxZk5oeWN0K3AvQ2ZSRys5NXpGeURnN2Jj?=
 =?utf-8?B?Ujl1VWkyNkVJYUFmZmN6dVhkY2VCNVJucWlTbFNBRzZLdUJkODBaZ1Z1MHRy?=
 =?utf-8?B?aFZ5OE9SNWVJbDFhT1VvYWRPUFVEbWcwdUhzM3JPY2tPcFpyQUNKWUExeWJN?=
 =?utf-8?B?SGxJVmlPTVhyS0RNZW4vSzJwZ2NiQlk5cTR2ZHFXR09QUjJEVFp5SDdRZU5o?=
 =?utf-8?B?eXJYLzBKRC92M0pzbHhjaUhXc0VDcXN1UmcwR2J5TWpjZFNXeTlrdUN0UGN0?=
 =?utf-8?B?VmpIY2JSaUtoME9oSnRuaG9PSGNEQ0xqdll1Wlc0MHdZT3YxZTRiWEQvRlpD?=
 =?utf-8?B?LzF0K2o5U1VPUk45bkE1ZXhuUTlWTHFwUjhXMGpuQXM0SmNLNS9xK3g5QjVr?=
 =?utf-8?B?VitLcytDNVlIcEJxOWNHanArT3hPbncwcm8wZVhtaFlWOEg3MmhrOHhyLzVM?=
 =?utf-8?B?ZXY2U0N5NXRGSFJCa3ZxaUlyTG9XaTh1V25WbjRvWDBYN25wN1ZxSU5ONlFT?=
 =?utf-8?B?eXBQS1EzNGpVdmlnNURNZ0U2dGhPL25tZ1R1bkhid3lKTDNXREdXaVRaMzA5?=
 =?utf-8?B?eTkyeEkvTldxVlBrMTErQStzVFJrR0V1SG15L1A5c01sT0hWYSt4bUsvekE0?=
 =?utf-8?B?ZyszYnRqbEplbzlvR2JQNnRPdm44d0FxZWZNS043Mm5XM0l4Q1I3ckRxS0Vt?=
 =?utf-8?B?K0gyNXZ1aDMyVm1PbTVsZkdNdjBEOTNsS3kwZW5SQlBBZERkRHdockRxclRO?=
 =?utf-8?B?VDNtbGZqSTRvNzY4QVhlM0FyYWNTdUNlVDZvanhJdUFZcGVJUjdzOWhEWVlz?=
 =?utf-8?B?WVpXTG9EM3R2R1R6L0dPbW00Vzl1SFpFNDM2aUlveTVBNHlwNDZjc25qUGUw?=
 =?utf-8?B?UnBxWHNzc0lUei9qa3d4bU04a1dEQ2Y2aVBncjQxRDRkUFE3UGlKSFl4U0RE?=
 =?utf-8?B?Zk51UC90Rm4rTlNrbWpuRW9EaUxqb09XSVNqNnJJak0zQ3pRU0tBNGZyVjVw?=
 =?utf-8?Q?OWLHIxPu/UyaPfgp6rzNYi2mrZZT3CvY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1BtQ004bzJpL29DVVU1dXI3dFhLMXVzbHRYQWFUUVZMMk1CeUhOWkR1dTBy?=
 =?utf-8?B?ay82MDhLd0pCbURuYTdZQzhxZWNaMlczRjdZV3hhRjFxL3JPZnVOb0J2cUNq?=
 =?utf-8?B?NVhGZUlwTVJqd045emlOVVFKRjNEcUVuU3pReEdHaG8yR08vVmdQNk9UcHMw?=
 =?utf-8?B?ZlI2STgzb3NPUmplMFJZMlpOc3FVVUorSmZ1WnhJcDA4RTNLOVgvelZqdFZn?=
 =?utf-8?B?Q0dSZlFpRTN2enZjeGR5YTJLa0FGaGxlMFhITUpsazQycTBOSFJPZkJXWUJi?=
 =?utf-8?B?R0FVazhUamZkUlNJQnNoN2twNzRQRVRnR2ZiNVFzcncxQ1lCRGJhWGNuMFlm?=
 =?utf-8?B?eUhyTzNEbjZ4ZEptNFdpQ0JKVUxFUW91WGZLaEQzUCtST1hLVWl4Q2FldlNx?=
 =?utf-8?B?dDg5dVNwUTFQV2NvRExiWkgrSEVaM2RiNnA4dTRKSzNBaWJ6SUxUdnZYcXR1?=
 =?utf-8?B?RUpwN1diUGlHY2RKR2JNY0EvYUl5RzFCQitHTUFRaUhsWkR3b0hhd2VHTnpF?=
 =?utf-8?B?eE9LYXIzclJjKzB1VWpnVGR3WXpDSkJSOUM5R21CRDdwQ2VDdjJIQm9LTm5x?=
 =?utf-8?B?ak9nSTVZSW5sRW1lMmR1QXYyRXlKcnhGVjk0aFkrNTVDNndsaVlJcGxxL09L?=
 =?utf-8?B?TjJoUTNSUDlpblIycTVybFRNZmFZLzc4aGxCR2RjMis1Wkp4NU1MUEZNWlo2?=
 =?utf-8?B?Mzgva0p4RGlUaVkrMUg3bmI2YlFGN3VyUmIyRlhwT0lwaTdMR3hxZTIwb2pT?=
 =?utf-8?B?cktxSHRSYmk4UkNReWpxSndpOXJaemFVOXFuYjFqcEtmemNraE9LRlN6YUkw?=
 =?utf-8?B?QWVYZ2Z5N3RXSnQzQ3o5cHJVbC9LbnhPSHdHeEdwOThVczBwQUl0a3lUaXB0?=
 =?utf-8?B?ZjR3OGV0U1c0dkJIK1NvUVdWWFBzSUwyMnByaUpqMkR6c3ZWajFHa3kydVpC?=
 =?utf-8?B?WEJlc3Mwc2tNbXNNM3IwVzJkTGJCdWphTzkrSHhRRngwY0RMaXIwem9Mdms4?=
 =?utf-8?B?d3FyYm96MUNwTGhIVDZUdXJTTXZkY1dXRWtMUUorMDc2VlQxd09nVnArWWZ0?=
 =?utf-8?B?a0pGVm9yMnFXSklnZ3RJZ3QxSWZXd21JK0kzWkdBb210Qm1zZDJPTkR3dXJl?=
 =?utf-8?B?Qkl6UHNOdmYrVEpGenRjbDBPQ0R2TGYxaWJJNzlpQnNNSnBnQzBucnczUkVW?=
 =?utf-8?B?OUF3cWQwaTV4MWU5MTVSb3ZlUU5pVmtOQUMyeXFmSGh3MkowRmxHNUNsMlNY?=
 =?utf-8?B?U2IyZG1abUtGY2dtM2VmR2V2VjFZRFg1UTlvQjc0dVVwMUtwVm14VWpUelhl?=
 =?utf-8?B?ZkdNU0QrQWtPRDBIQitUS1ZsZmhNZWprZWpuOHFSSTI1MjZHSVhyYzlLbGMv?=
 =?utf-8?B?WG56K0xRWXY2UWEwa0hITVdpM3crd0o0c0VqQnhkVERQVTZyVTl1NFNXTTRi?=
 =?utf-8?B?bjh4ZVBmcGJQRXVFQUt0dlNTQ2hlS0dyT1hEUzkwYi9yUDVFQ0U3a1lqS2o1?=
 =?utf-8?B?VjBFY0IvZ2RsQ1lSc2FmNVRaNjNFdDVUb29KNjRmUWU1NklKTzduOW5ScU1i?=
 =?utf-8?B?OFQ0WDIxUVJScmd6SytEYnFCZkVvOTNNamZPUUd2c0xBdmR6eUtJbGFab2g0?=
 =?utf-8?B?VWQwZVNZWjNPdTEyZndxRCtjdkhBTklVdTVBQUc4cndQdmFoQ2pocS9SRXV3?=
 =?utf-8?B?aVFvRmJoc3ltY3Jucm8vZEJqalU1dVoyaTNXMElzbjBzKzNQV1pXcWZCbURL?=
 =?utf-8?B?bjlNYTE1a2lyVmJTbzZhU0dBT2ZUSEJYTkZzQkFvaUtteEM5a2VndWRSTWtx?=
 =?utf-8?B?Q2tEQUxHNWlzT2p0RDFBZnF0YnN5a0tIYnA4YzBja1QvcDhJc3EyYlJ1V2c4?=
 =?utf-8?B?eTQ4elpFQm5ubGlPZDU5cmd3bmNHTUF6VXF6bkI4YmpDYlBDbmg4UGVZK0VK?=
 =?utf-8?B?UURMa1FtZGx2VndRaEZRU1Jtc1VjMzVaMGlrQkU3Ym4zblZCUXJ4NEgxcXRZ?=
 =?utf-8?B?UGZ4bjFFbFZlUDdQUUt2ZHRCdjZPR0U2Ykh1WXdrVlZMaGN6aHQ4S3RodW9K?=
 =?utf-8?B?cFhDUUluNDFnOHVySTJVbmFta1BwVTcyV2dwTUlNZ1c0TnR3VThYdmNESWEx?=
 =?utf-8?B?c2RYd2RZMnNYalV0bXBmQ3kxV0swWHJVQ1J1Rm5BczJka2ZiT09ZMlNzdnFW?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc2c5d5-a4ca-447b-02e5-08dd5bd5f031
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 11:07:37.1822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mxUBK7tmzhQ47GqiQegyDccnPSJjJLF4fv0eES5M15aSVAWtqm4S2wr7KemfGYcCp2sSv9iWImjAChgJOHTnoJPHqxwkfY3jokhXb1Q+/oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7467
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

SGkNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRHVnYXN0LCBGcmFuY29p
cyA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCA1
LCAyMDI1IDQ6MjEgUE0NCj4gVG86IEsgViBQLCBTYXR5YW5hcmF5YW5hIDxzYXR5YW5hcmF5YW5h
Lmsudi5wQGludGVsLmNvbT4NCj4gQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBX
YWpkZWN6a28sIE1pY2hhbA0KPiA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggaS1nLXQgdjIgNC81XSB0ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rp
b246IEluamVjdCBlcnJvcnMNCj4gZHVyaW5nIHhlX2d1Y19jdF9zZW5kX3JlY3YgJiB4ZV9ndWNf
bW1pb19zZW5kX3JlY3YuDQo+IA0KPiBPbiBXZWQsIEZlYiAxOSwgMjAyNSBhdCAwMTowNDo0NFBN
ICswNTMwLCBTYXR5YW5hcmF5YW5hIEsgViBQIHdyb3RlOg0KPiA+IFVzZSB0aGUga2VybmVsIGZh
dWx0IGluamVjdGlvbiBpbmZyYXN0cnVjdHVyZSB0byB0ZXN0IGVycm9yIGhhbmRsaW5nDQo+ID4g
b2YgeGUgZHVyaW5nIGRyaXZlciBwcm9iZSB3aGVuIGV4ZWN1dGluZyB4ZV9ndWNfY3Rfc2VuZF9y
ZWN2KCkgLw0KPiA+IHhlX2d1Y19tbWlvX3NlbmRfcmVjdigpIHNvIHRoYXQgbW9yZSBjb2RlIHBh
dGhzIGFyZSB0ZXN0ZWQsIHN1Y2ggYXMNCj4gPiBlcnJvciBoYW5kbGluZyBhbmQgdW53aW5kaW5n
Lg0KPiA+DQo+ID4gRXJyb3IgY2FuIGJlIGluamVjdGVkIHVzaW5nOg0KPiA+IGlndEB4ZV9mYXVs
dF9pbmplY3Rpb25AcHJvYmUtZmFpbC1ndWMteGVfZ3VjX2N0X3NlbmRfcmVjdg0KPiA+IGlndEB4
ZV9mYXVsdF9pbmplY3Rpb25AcHJvYmUtZmFpbC1ndWMteGVfZ3VjX21taW9fc2VuZF9yZWN2DQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYXR5YW5hcmF5YW5hIEsgViBQIDxzYXR5YW5hcmF5YW5h
Lmsudi5wQGludGVsLmNvbT4NCj4gPiBDYzogTWljaGHFgiBXYWpkZWN6a28gPG1pY2hhbC53YWpk
ZWN6a29AaW50ZWwuY29tPg0KPiA+IENjOiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2Fz
dEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlv
bi5jIHwgNDENCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9p
bnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYyBiL3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlv
bi5jDQo+ID4gaW5kZXggMzI3MzNmZWM1Li5jZjAzMzc3MzMgMTAwNjQ0DQo+ID4gLS0tIGEvdGVz
dHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9m
YXVsdF9pbmplY3Rpb24uYw0KPiA+IEBAIC0yMzEsNiArMjMxLDM0IEBAIGluamVjdF9mYXVsdF9w
cm9iZShpbnQgZmQsIGNoYXIgcGNpX3Nsb3RbXSwgY29uc3QNCj4gY2hhciBmdW5jdGlvbl9uYW1l
W10pDQo+ID4gIAlpbmplY3Rpb25fbGlzdF9kbyhJTkpFQ1RJT05fTElTVF9SRU1PVkUsIGZ1bmN0
aW9uX25hbWUpOw0KPiA+ICB9DQo+ID4NCj4gPiArLyoqDQo+ID4gKyAqIFNVQlRFU1Q6IHByb2Jl
LWZhaWwtZ3VjLSVzDQo+ID4gKyAqIERlc2NyaXB0aW9uOiBpbmplY3QgYW4gZXJyb3IgaW4gdGhl
IGluamVjdGFibGUgZnVuY3Rpb24gJWFyZ1sxXSB0aGVuDQo+IHJlcHJvYmUgZHJpdmVyDQo+ID4g
KyAqIEZ1bmN0aW9uYWxpdHk6IGZhdWx0DQo+ID4gKyAqDQo+ID4gKyAqIGFyZ1sxXToNCj4gPiAr
ICogQHhlX2d1Y19tbWlvX3NlbmRfcmVjdjoJSW5qZWN0IGFuIGVycm9yIHdoZW4gY2FsbGluZw0K
PiB4ZV9ndWNfbW1pb19zZW5kX3JlY3YNCj4gPiArICogQHhlX2d1Y19jdF9zZW5kX3JlY3Y6CUlu
amVjdCBhbiBlcnJvciB3aGVuIGNhbGxpbmcNCj4geGVfZ3VjX2N0X3NlbmRfcmVjdg0KPiA+ICsg
Ki8NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHByb2JlX2ZhaWxfZ3VjKGludCBmZCwgY2hhciBw
Y2lfc2xvdFtdLCBjb25zdCBjaGFyDQo+IGZ1bmN0aW9uX25hbWVbXSwNCj4gPiArCQlzdHJ1Y3Qg
ZmF1bHRfaW5qZWN0aW9uX3BhcmFtcyAqZmF1bHRfcGFyYW1zKQ0KPiA+ICt7DQo+ID4gKwlpbnQg
aXRlcl9zdGFydCA9IDAsIGl0ZXJfZW5kID0gMCwgaXRlciA9IDA7DQo+ID4gKw0KPiA+ICsJaWd0
X2Fzc2VydChmYXVsdF9wYXJhbXMpOw0KPiA+ICsNCj4gPiArCS8qIEdldCB0aGUgaXRlcmF0aW9u
IGNvdW50IGZyb20gZW52aXJvbm1lbnQgKi8NCj4gPiArCWl0ZXIgPSBnZXRfZmF1bHRfaW5qZWN0
X2l0ZXIoKTsNCj4gPiArCWl0ZXJfc3RhcnQgPSBpdGVyID8gOiAwOw0KPiA+ICsJaXRlcl9lbmQg
PSBpdGVyID8gaXRlciArIDEgOiBJTkpFQ1RfSVRFUkFUSU9OUzsNCj4gDQo+IE9uIENJLCBJR1Rf
RkFVTFRfSU5KRUNUX0lURVJBVElPTiB3aWxsIG5vdCBiZSBzZXQgc28gaXRlcl9lbmQgd2lsbCBi
ZQ0KPiAxMDAuIFByb2JpbmcgeGUgMTAwIHRpbWVzIHdvdWxkIGJlIHF1aXRlIHRpbWUgY29uc3Vt
aW5nLiBXaGF0IGlzIHRoZQ0KPiBleHBlY3RhdGlvbiBmb3IgdGhpcyB0ZXN0LCB3aGF0IHdvdWxk
IGJlIHRoZSBhZGRlZCB2YWx1ZT8NCj4gDQo+IEZyYW5jb2lzDQo+IA0KTWljaGFsIGV4cGxhaW5l
ZCB1c2Ugb2YgdGhpcyBlbnZpcm9ubWVudGFsIHZhcmlhYmxlIGluIHByZXZpb3VzIHBhdGNoLiAN
ClBsZWFzZSBmaW5kIGRldGFpbHMgYmVsb3cuDQoNCiJCZWNhdXNlIGFsbCB4ZV9pbml0KCkga2lu
ZCBvZiBmdW5jdGlvbnMgYXJlIGNhbGxlZCBqdXN0IG9uY2UgZHVyaW5nDQpkcml2ZXIgcHJvYmUs
IHNvIGl0IGlzIHN1ZmZpY2llbnQgdG8gZmFpbCBmaXJzdC9hbGwgY2FsbHMgdG8gdGhlbS4NCiAN
CiBPVE9IIGRyaXZlciBjb21tdW5pY2F0ZXMgd2l0aCB0aGUgR3VDIG11bHRpcGxlIHRpbWVzLCBh
bmQgdGhlIHJlYWwNCiBmYWlsdXJlIGNhbiBoYXBwZW4gYXQgZGlmZmVyZW50IGNhbGwsIGhlbmNl
IHRoZSBuZWVkIHRvIGluamVjdCBmYWlsdXJlDQogaW4gR3VDIGNvbW11bmljYXRpb24gZnVuY3Rp
b25zLCBsaWtlIGd1Y19tbWlvX3NlbmQoKSBvciBndWNfY3Rfc2VuZCgpLA0KIGJ1dCBpdCBjYW4n
dCBiZSBqdXN0IGZpcnN0IGNhbGwgb3IgYWxsIGNhbGxzLCBidXQgd2UgbmVlZCB0byBiZSBhYmxl
IHRvDQogc2VsZWN0IHNwZWNpZmljIGl0ZXJhdGlvbiB0byBmYWlsLg0KIA0KIE9ubHkgd2l0aCB0
aGF0IGFwcHJvYWNoIHdlIGNhbiBwcm92aWRlIHN1ZmZpY2llbnQgY292ZXJhZ2Ugb2YgdGhlIGRy
aXZlcg0KIHByb2JlIHJlbGF0ZWQgdG8gR3VDLiINCg0KU28sIGlmIElHVF9GQVVMVF9JTkpFQ1Rf
SVRFUkFUSU9OIGlzIG5vdCBzZXQsIGVycm9yIHdpbGwgYmUgaW5qZWN0ZWQgZm9yIDEtMTAwIA0K
c3BlY2lmaWMgaXRlcmF0aW9ucyBmb3IgYmV0dGVyIGNvdmVyYWdlLiANCg0KPiA+ICsJZm9yIChp
bnQgaSA9IGl0ZXJfc3RhcnQ7IGkgPCBpdGVyX2VuZDsgaSsrKSB7DQo+ID4gKwkJZmF1bHRfcGFy
YW1zLT5zcGFjZSA9IGk7DQo+ID4gKwkJc2V0dXBfaW5qZWN0aW9uX2ZhdWx0KGZhdWx0X3BhcmFt
cyk7DQo+ID4gKwkJaW5qZWN0X2ZhdWx0X3Byb2JlKGZkLCBwY2lfc2xvdCwgZnVuY3Rpb25fbmFt
ZSk7DQo+ID4gKwl9DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBpbnQNCj4gPiAgc2ltcGxl
X3ZtX2NyZWF0ZShpbnQgZmQsIHVuc2lnbmVkIGludCBmbGFncykNCj4gPiAgew0KPiA+IEBAIC0z
MzAsNiArMzU4LDcgQEAgaWd0X21haW4NCj4gPiAgew0KPiA+ICAJaW50IGZkOw0KPiA+ICAJY2hh
ciBwY2lfc2xvdFtOQU1FX01BWF07DQo+ID4gKwlzdHJ1Y3QgZmF1bHRfaW5qZWN0aW9uX3BhcmFt
cyBmYXVsdF9wYXJhbXM7DQo+ID4gIAljb25zdCBzdHJ1Y3Qgc2VjdGlvbiB7DQo+ID4gIAkJY29u
c3QgY2hhciAqbmFtZTsNCj4gPiAgCQl1bnNpZ25lZCBpbnQgZmxhZ3M7DQo+ID4gQEAgLTM2Myw2
ICszOTIsMTEgQEAgaWd0X21haW4NCj4gPiAgCQl7ICJ4ZV92bWFfb3BzX2FsbG9jIiB9LA0KPiA+
ICAJCXsgfQ0KPiA+ICAJfTsNCj4gPiArCWNvbnN0IHN0cnVjdCBzZWN0aW9uIGd1Y19mYWlsX2Z1
bmN0aW9uc1tdID0gew0KPiA+ICsJCXsgInhlX2d1Y19tbWlvX3NlbmRfcmVjdiIgfSwNCj4gPiAr
CQl7ICJ4ZV9ndWNfY3Rfc2VuZF9yZWN2IiB9LA0KPiA+ICsJCXsgfQ0KPiA+ICsJfTsNCj4gPg0K
PiA+ICAJaWd0X2ZpeHR1cmUgew0KPiA+ICAJCWlndF9yZXF1aXJlKGZhaWxfZnVuY3Rpb25faW5q
ZWN0aW9uX2VuYWJsZWQoKSk7DQo+ID4gQEAgLTM4Nyw2ICs0MjEsMTMgQEAgaWd0X21haW4NCj4g
PiAgCQlpZ3Rfc3VidGVzdF9mKCJpbmplY3QtZmF1bHQtcHJvYmUtZnVuY3Rpb24tJXMiLCBzLT5u
YW1lKQ0KPiA+ICAJCQlpbmplY3RfZmF1bHRfcHJvYmUoZmQsIHBjaV9zbG90LCBzLT5uYW1lKTsN
Cj4gPg0KPiA+ICsJZm9yIChjb25zdCBzdHJ1Y3Qgc2VjdGlvbiAqcyA9IGd1Y19mYWlsX2Z1bmN0
aW9uczsgcy0+bmFtZTsgcysrKQ0KPiA+ICsJCWlndF9zdWJ0ZXN0X2YoInByb2JlLWZhaWwtZ3Vj
LSVzIiwgcy0+bmFtZSkgew0KPiA+ICsJCQltZW1jcHkoJmZhdWx0X3BhcmFtcywgJmRlZmF1bHRf
ZmF1bHRfcGFyYW1zLA0KPiA+ICsJCQkJCXNpemVvZihzdHJ1Y3QgZmF1bHRfaW5qZWN0aW9uX3Bh
cmFtcykpOw0KPiA+ICsJCQlwcm9iZV9mYWlsX2d1YyhmZCwgcGNpX3Nsb3QsIHMtPm5hbWUsICZm
YXVsdF9wYXJhbXMpOw0KPiA+ICsJCX0NCj4gPiArDQo+ID4gIAlpZ3RfZml4dHVyZSB7DQo+ID4g
IAkJZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQo+ID4gIAkJeGVfc3lzZnNfZHJpdmVyX2RvKGZkLCBw
Y2lfc2xvdCwgWEVfU1lTRlNfRFJJVkVSX0JJTkQpOw0KPiA+IC0tDQo+ID4gMi4zNS4zDQo+ID4N
Cg==
