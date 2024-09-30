Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BAACF6499
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 02:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255A410E03A;
	Mon, 30 Sep 2024 02:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfuKqu31";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993DF10E03A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 02:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727664954; x=1759200954;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5wWXtg2W/ToK5DZAk2yvD5nEqAUvuxcZTehVKkZXPwU=;
 b=mfuKqu31MeccoRFrYSk3bHoperqVeIRJVfzz9Iq1mi6J1XbI/EgXEaKR
 WRSAYfcYGYdtowx3p4LH4aseLA/BDWJuRcGKoQiSZWtM+dnfbdj/M/qM0
 ur1zxSjHErko7rTPEtoUs3hFZwgdkVK7iKdXY0Z2PVRAoCkWnFjxjgvYL
 JWKUbOFiCt10G7fXL1HoPAD7wt+iIBHcgI2ocJZxVY1erMj0QIEc0wwdT
 EI+lIoWXTi8nj5t/Qmzq4wFQZ7pl8gYsCWxXwiEjt/b/NrEpFsIS+Eh8Z
 eoCtqhMp2ksfxb8qW2CEWeKMHFh4mVpOsvQmLlSaxuyCxK8hV/cVP+QET g==;
X-CSE-ConnectionGUID: g0Yt6DUYQLmFAlcHELDzlA==
X-CSE-MsgGUID: EF58VT39TguDClwe/3XpBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="30436255"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="30436255"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 19:55:52 -0700
X-CSE-ConnectionGUID: YpfmHXDKSDuVKABxL0PfUw==
X-CSE-MsgGUID: c3E6+tAOTOq6blHV7v+ALA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="103939023"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2024 19:55:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 19:55:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 19:55:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 29 Sep 2024 19:55:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 29 Sep 2024 19:55:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGjdou/ZU9OUoMPqBpJp8G+7yEXSOJ/k5BPvJMlBMXwcH0Jbdnd5osGjCat6latJm8GP9ofNTtRzDPLeU7b9m63Rusa0oQymtLMQW+wi+OneRLWgJiU2rnaGKqc8SAWId1KP3/CwSK6UeP2iFJWu1XGONrqOSbDDOGJQaHvou3TdF/ZWP7qs8HNzIYPDPT3+9/z1yFQCYenzjLWL8ZCzeRkzAcRUsGycpnxF+vOET4/veOayzki/FR4mV+QLr4jB+c7Dw8GJtlbUi+fv1LVv7QZoOZqjZFNeH0AGpTs4fiFMqpifdHd8PwDhsB234X0WkqOEjGXxnKByjTELK07F0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wWXtg2W/ToK5DZAk2yvD5nEqAUvuxcZTehVKkZXPwU=;
 b=A9ikyamxok1bChc74Tr5NlxtxfNERr/CKqImw4Lkiru2/gmklp9FJV8VWECSFGR+3hiRUN26Zh4KnjRrP1MpDYynup39h6E2GEkhU5sgQBoaNCuZoOYuopFKe6sqS2hZEzxHksV3BzpJnqFCpxoqamOxhteZ7GRgN3EoS67s7B/0EpAfUCnup8dv+cRYEpKwAsKhp5mIUClVPdWDK/Sjp4nv0XEfqZJ2WSfX69DbR6y1eO6yIn/DVNQRXuT8/LGAnA84TCfDETydc90Cfnz0iyTQTZAsqqqxdrkKR52gPyRoNjoJIGMOHjPcDqZmNhJdzi1m8juaBBhsykdXTucorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ0PR11MB5037.namprd11.prod.outlook.com (2603:10b6:a03:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:55:47 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:55:47 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Das,
 Nirmoy" <nirmoy.das@intel.com>, "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Topic: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Index: AQHbEJWgebA1ZIGeJUSY1YbVqBRTOrJvpzDQ
Date: Mon, 30 Sep 2024 02:55:47 +0000
Message-ID: <CH3PR11MB8434CF8AEE478D5ABA2C47B08D762@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240927043544.1782340-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240927043544.1782340-1-sai.gowtham.ch@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ0PR11MB5037:EE_
x-ms-office365-filtering-correlation-id: 6a81645e-3f7d-4566-f354-08dce0fb627b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?M2NIR0RoTmw3bUx5R3pGa204NVRvZXJLWFQxbTVNNjFHY2NiOU5IcXBaU0lo?=
 =?utf-8?B?b3czUWhVamp6RXJaUW9UZ1RzUzBpWk5MMENzbXpXUnlzV1pBcERWYW1WSXFh?=
 =?utf-8?B?K215aTYxeGJyVkJWTVltYTgwTCtXQ0JQS04ybWIwTEs3ZXpiYXBTS0EyTGgy?=
 =?utf-8?B?dkppZUJDMmRaWmxrOGEzRXVObkQwNFRPK0dMaHM0cjl5czdNM2k0ck9HbDZD?=
 =?utf-8?B?aTI5d28yVVVzLzBzQUxkY1JpSzEzWnFqOXBZL2lwd2kvR0xpQXhlN1pJNkhr?=
 =?utf-8?B?cUkrZW5mZmhOMFJsc0pTQklzSG9vREpXMUdMRGtjR05mQ2JIU0xmWDdKWmJP?=
 =?utf-8?B?dXhad2RNNVVWZ3hhSzNENTVvSnBQcTVqS09JdjRVM1dQRjdIMGdyWTJwNTdn?=
 =?utf-8?B?Nit3T1RZbnNta05QZ3BuVDJ1SGlTOEI2OHllZVQvNnM4OWgrc1lWV1NRS055?=
 =?utf-8?B?OTVJZks3M2x4K2dGVTl5T2QzQWRFdWNSMjc1YlpWTXZmektHdzZ2Sm1PMlZT?=
 =?utf-8?B?WCtRL3pjb1FtNkhSajFaVnVza1BSb05mUEYwQXprQmpBY2w2TWU5YThhcUhh?=
 =?utf-8?B?NTg2WVdGNGpJQVh6Zm15VGxkc2NQYmUyTGN6c2ozeFRFeWI1S2hnOXgrOS9H?=
 =?utf-8?B?K0Z1Q3phckVpZ3pub1FPQXBXaWpRRmx6LzZ4ZUkyWW91UEswTkJEcHNMWlNu?=
 =?utf-8?B?V0lFd0hQSXFVRktURU9BUmxPWWxnaCt6SUxzNDVHbGRQZkZjRWJjK0Y4MU13?=
 =?utf-8?B?REdJMnczdWU4U1lkdkFDanJJWHNMOW9GOGVLNnBtRldKS3RRcU4vbWV1WmNq?=
 =?utf-8?B?R3V6TGhRMzN0dm95eTltNy9HU1VhWEpSaWxrNXNNS2ZGcEtsZVR2RENNOGVT?=
 =?utf-8?B?MVdPdnJGcEtjUWg4cm5MVjdhWkJkbS9wallRcG0vM2M0bG40L1RTZWRZK2I0?=
 =?utf-8?B?cGFEQlppZEFNRGtnQTJwTW8ycEt1Q2E0K3NqTVNtQWNFRno2YmVFczVxL05z?=
 =?utf-8?B?Rm1hN0RrRDE2VENveGNRY2d4ZWtHRENCNTlJOWV4SjJndEtULzg4dEFrT0hs?=
 =?utf-8?B?elRaQ0tETTJHRittQkJjaTRFYTBiem5tcXNpUU5uOWg1UzB6eE9aYm1qUE9Y?=
 =?utf-8?B?U1BNWFEybXQxQitaYVpocTlqbjBSNmprcFNwb3dkalh6K0NrZTAvOVdzS0Jp?=
 =?utf-8?B?ckUwTWJ2SWZEcUtPSHFoSzhPS1ZtVDFNYy9Tc0JnUW8wM2twWTZZcFh3MkJh?=
 =?utf-8?B?UFF5THpCUURVTEd4ZjFnSVFDKzQ4bjEvQWY4bHRjWWx0akRSZzhJZUU2NDNB?=
 =?utf-8?B?Y1c1RXNZYkpCUFBPQXBQbEQ1VTZ3Yk1kcTlHU1FzSDZjQlhCYWZhVXF6NVA0?=
 =?utf-8?B?OFJ2d2xXallsMVVhRFZ3aXh4UUVxWmhsdjJEZzZDUWdUOHMwdnRqdHZYaFk4?=
 =?utf-8?B?L0QvbkZJL0NKTnRxeDk4TFI2RjVIRjhLRVFtOFNJc3l6YlpRSlVGTXlJanNG?=
 =?utf-8?B?S2RESHNEM2NwTkV4Z0xIQ1BKenNDS05qU01EdU9EbjNKRXdoSWJpWW9KOUF5?=
 =?utf-8?B?T3BXNCt5ZFpMdDRsY0VJS1BHWVQ3MDU4andSeFFjZkdNMk4vNDNSemhyNU5C?=
 =?utf-8?B?aURRVk5nc3VEa2k1SUR6WkFWTzRJNWZBeTdPNFNkSDk1WXVWR3E4MGtlZ0xp?=
 =?utf-8?B?TWd1TFVSdDFIY216NFNnYjhHeUVhck03SEN4M1RHY2pnNlUvbkZSYzFxejZN?=
 =?utf-8?B?ZmtBVFF0cFFVcWpvSDlzUHN1VnRVTDV6RG8zelI5Y1ZtTCtMZjB4MnFmSkdC?=
 =?utf-8?B?V1c2bDFmb1h2R1hndXBxdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGZyYUZGWDkvMWJXQkluNEhpSTlyYXN1M0VCMjlnc1lQcUI4V1VhczdqWmU5?=
 =?utf-8?B?S3liMDdUTCtDMUdTZWpWdDl3aVd3alF3dEFLSWpPNk1pTDI5cnVSMlVYQ0hs?=
 =?utf-8?B?Tm83dUl4ZGdaclh4ZTA5WjZvL3gvNEdpU1hyQ3AzclF6dlErVmgrTjBWQi9i?=
 =?utf-8?B?VVFsR01NNWFNYm1yTmR0RE5RaGJjM1pTalNBMmRGdWxLNjZvL0FFV1gvcisz?=
 =?utf-8?B?SjhpT2l4UHJxdDJpcVB0RDVRUy9qMkpRaExKRUs5aDRZbE9zcGRtdTZsL2J6?=
 =?utf-8?B?cTc3cTFrYXBadWRWWm92bUZ6SEsySHdvOWlzeEw2RU5XZ25WZ2VsTlVUREUv?=
 =?utf-8?B?MDNHcWR2bFNCOHNZenljODJzM3BoMFVYNkhMa24xNVJVUWpsTVp3RXVWZlBS?=
 =?utf-8?B?ZGN1Yi9RWlZWdVJrOU50U013bUJ1ZS9lcUN6N3JPVkxJYVMvNi9LYVJwaUVY?=
 =?utf-8?B?UFcrL2MrbW05ZUFsL0Q3RWl2MTdXZ1dqVGZ1N0szM3luMUxOajI2RkNHT29n?=
 =?utf-8?B?VXM1dFJRT2RnTHZsYUppZnUyOUVKMVE4Sml5dWJ1ZUMvc1V5UW9GeWdsMTlq?=
 =?utf-8?B?YlM2SGtpZWNpc29KOE5OS3ZNZDMwV0o1NDREc0FQcVFON1ZsOG16bkIxaDlZ?=
 =?utf-8?B?eFFWWXlHZE91YnpiSnhvZWRqNzJWcTZONTl6RTVOVm1CVXF3YkI3ZGJnOVVr?=
 =?utf-8?B?aDRmLzd2ajV1T2ZqK0dFbTQ3eGJGM1czTy9EZzZyWjRyZy94blMzUHhQWkFn?=
 =?utf-8?B?QnRsSGRjcEZWQVJDMVRiaGFNSWl2S09aZ1FmZTJ5dEhhUlpVc1pzeStScUph?=
 =?utf-8?B?YTl4bUFudGZuMVlLemh0U0htSVpJeG16NCs5ajQ0YWN4MGVheEZPWGMrM3F3?=
 =?utf-8?B?MlN1Vmd4cHF1ZGJuNjByeFdQL2pQWEFXdTBFUGVNSS9XcWx6dkNLTGY4Mm90?=
 =?utf-8?B?T0pYcEVlUnArS0ZhZDFhazh1bUh4L2gveHJHbC9lenN3VE5jUEljQ1NENkdR?=
 =?utf-8?B?ZTB5VXpEVXpyL2J0M1FxanRubnllL2hRc3dWL1kwbDVWYXI4NnJDckpmZHg0?=
 =?utf-8?B?SGFFMXJqZzQ2K3F0bFpMd1Vucjl5WWhkWGhFYm40Tlhhdms3Q25GOWFKMEJB?=
 =?utf-8?B?ODE5ZUlCRFc4Vnp4b3VWNU9VNGFWRVgyK3lVVlloRVF1SCtvTW5oK2ZrS1BV?=
 =?utf-8?B?eFh5TjM2Y3JmeGVMSTBETWVma1hHNVJMaTlqNmtHc0kvUTF1aFV6YVZpdk9a?=
 =?utf-8?B?VzVaNjM2S2NxcG11SElzQTNYZWk2cDZKYVhLcWdEUG5yUzhIaGR5NHl4Z0Fh?=
 =?utf-8?B?T2ZVL3lUclZsamN0b2szSFdjWXVrWUpZbDM1SnVIR3VVRUEvOS9SQzRScHJz?=
 =?utf-8?B?ZGpjTE55OHlUQS9iakliQWdEYlRyQ1hXLzNrVDQxT3dYRzJBN0d5V1RWWFF5?=
 =?utf-8?B?RU9hTzVlZUdUMk41d3p6RnE3U3dvM243b012Z3ZkVm1QckZvdEUwNHlGc21E?=
 =?utf-8?B?dEFlY1EyWmQ1R2RxdmVDRExRYlpxeTh6QnVMV3pJV1RKYzVIbW1SK2psN1BQ?=
 =?utf-8?B?WEN2ZVY5cEp4eCtYRzgzck9VSDNaUFNPR1I3NHRuUXVRUkd5SkxCUVRma0N1?=
 =?utf-8?B?dXJNRUZROHZUTk9XblZXNnVvVUNWa3VwbkRETDhHNFFPNXg2TnM4QWt6RDdL?=
 =?utf-8?B?TER3eGVNZW5ETGpwanZsSjl6QnVSVkxwMW4xMERROGhGSjBtUGhrcGw5Q1JJ?=
 =?utf-8?B?ZnJEUzluaVVNc0NMZ1VHOG5Bd3dRMmYrZmZNUDJzYlExYzJrMC9MQytvNzlJ?=
 =?utf-8?B?cngyRmRESnNCZEdwU0RrbU85a1FoNGdicWx3ZmVVc1MxL3lkY1hVbzhVa2Fr?=
 =?utf-8?B?MTJ5R2lTeDkweXoxb3BqVnk3eENwbzVuTkk4S3BxcnFMYWJCNis0Y0s5ZlAz?=
 =?utf-8?B?OFZKbkJ6YUFZRlBRbVR0eHRXWG1zMExSOTltN0xYalMyY2pZQkRuQmpjRGxn?=
 =?utf-8?B?empqejljcGJGeTk5TUNOaVNNb20zdzNxdWRGbm40NjI3dlEyQTQ5NU83eFVL?=
 =?utf-8?B?ZHdYbmJYYXBzMXVGRFRMTVJ2Y0xKU3g2UC9TNU1TVmwxOGdCR2tITHJla1hv?=
 =?utf-8?B?SExLM2lLZGxVNnV3TEoxYW1sODdXZW5OYmVRZk14UmtyUng4UUN6WjBhOUdi?=
 =?utf-8?B?SWthRWcwZmNrUHB1TkVFaDhFaHAzUTBKMm5hbFl0QVhtTHBCaGJZV05lUFpJ?=
 =?utf-8?B?Q2dqMkdYQjFkUWdJeTZmRXVWWXVnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a81645e-3f7d-4566-f354-08dce0fb627b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 02:55:47.3013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1IkzMnyu75cgHV/wVReVzrpoDISz1IDk7SKR1l7Tx0b/gw2JCF3K2IZgUDXGKCcW6VG4A4rh09/s24YrCOfc5pctNdMfsDcdR8aOEapIMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5037
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

TEdUTQ0KUmV2aWV3ZWQtYnk6IFByaXlhbmthIERhbmRhbXVkaSA8UHJpeWFua2EuZGFuZGFtdWRp
QGludGVsLmNvbT4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3Qt
ZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YN
Cj4gc2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tDQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDI3
LCAyMDI0IDEwOjA2IEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGFz
LCBOaXJtb3kgPG5pcm1veS5kYXNAaW50ZWwuY29tPjsgQ2gsDQo+IFNhaSBHb3d0aGFtIDxzYWku
Z293dGhhbS5jaEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvaW50ZWwveGVf
dGxiOiBBZGQgdGVzdCB0byBjaGVjayBUTEIgaW52YWxpZGF0aW9uDQo+IA0KPiBGcm9tOiBTYWkg
R293dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiANCj4gVGVzdCB2YWxpZGF0
ZXMgVExCIGludmFsaWRhdGlvbiBieSBiaW5kaW5nIGRpZmZlcmVudCBidWZmZXIgb2JqZWN0cyB3
aXRoIHRoZQ0KPiBzYW1lIHZtYSBhbmQgc3VibWl0dGluZyB3b3JrbG9hZCBzaW11bHRhbmVvdXNs
eSwgSWRlYWxseSBleHBlY3RpbmcgZ3B1IHRvDQo+IGhhbmRsZSBwYWdlcyBieSBpbnZhbGlkYXRp
bmcgYW5kIGF2b2RpbmcgcGFnZSBmYXVsdHMuDQo+IA0KPiBDYzogTmlybW95IERhcyA8bmlybW95
LmRhc0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNhaSBHb3d0aGFtIENoIDxzYWkuZ293
dGhhbS5jaEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfdGxiLmMgfCAxNTQg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgdGVzdHMvbWVz
b24uYnVpbGQgICAgfCAgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNTUgaW5zZXJ0aW9ucygr
KQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVsL3hlX3RsYi5jDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfdGxiLmMgYi90ZXN0cy9pbnRlbC94ZV90bGIuYyBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAuLmVmNDRhMTA2OQ0KPiAtLS0gL2Rl
di9udWxsDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3RsYi5jDQo+IEBAIC0wLDAgKzEsMTU0IEBA
DQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ICsvKg0KPiArKiBDb3B5
cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArKg0KPiArKiBBdXRob3JzOg0KPiAr
KiAgICBTYWkgR293dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiArKi8NCj4g
KyNpbmNsdWRlICJpZ3QuaCINCj4gKyNpbmNsdWRlICJsaWIvaWd0X3N5bmNvYmouaCINCj4gKyNp
bmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiArI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+ICsj
aW5jbHVkZSAieGVfZHJtLmgiDQo+ICsjaW5jbHVkZSAiaWd0X2RlYnVnZnMuaCINCj4gKw0KPiAr
LyoqDQo+ICsgKiBURVNUOiBDaGVjayBUcmFuc2xhdGlvbiBMb29rYXNpZGUgQnVmZmVyIEludmFs
aWRhdGlvbi4NCj4gKyAqIENhdGVnb3J5OiBTb2Z0d2FyZSBidWlsZGluZyBibG9jaw0KPiArICog
TWVnYSBmZWF0dXJlOiBHZW5lcmFsIENvcmUgZmVhdHVyZXMNCj4gKyAqIFN1Yi1jYXRlZ29yeTog
Q01EIHN1Ym1pc3Npb24NCj4gKyAqIEZ1bmN0aW9uYWxpdHk6IFRMQiBpbnZhbGlkYXRlDQo+ICsg
KiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4gKyAqLw0KPiArc3RydWN0IGRh
dGEgew0KPiArCXVpbnQzMl90IGJhdGNoWzE2XTsNCj4gKwl1aW50MzJfdCBkYXRhOw0KPiArCXVp
bnQ2NF90IGFkZHI7DQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgdm9pZCBzdG9yZV9kd29yZF9iYXRj
aChzdHJ1Y3QgZGF0YSAqZGF0YSwgdWludDY0X3QgYWRkciwgaW50DQo+ICt2YWx1ZSkgew0KPiAr
CWludCBiOw0KPiArCXVpbnQ2NF90IGJhdGNoX29mZnNldCA9IChjaGFyICopJihkYXRhLT5iYXRj
aCkgLSAoY2hhciAqKWRhdGE7DQo+ICsJdWludDY0X3QgYmF0Y2hfYWRkciA9IGFkZHIgKyBiYXRj
aF9vZmZzZXQ7DQo+ICsJdWludDY0X3Qgc2RpX29mZnNldCA9IChjaGFyICopJihkYXRhLT5kYXRh
KSAtIChjaGFyICopZGF0YTsNCj4gKwl1aW50NjRfdCBzZGlfYWRkciA9IGFkZHIgKyBzZGlfb2Zm
c2V0Ow0KPiArDQo+ICsJYiA9IDA7DQo+ICsJZGF0YS0+YmF0Y2hbYisrXSA9IE1JX1NUT1JFX0RX
T1JEX0lNTV9HRU40Ow0KPiArCWRhdGEtPmJhdGNoW2IrK10gPSBzZGlfYWRkcjsNCj4gKwlkYXRh
LT5iYXRjaFtiKytdID0gc2RpX2FkZHIgPj4gMzI7DQo+ICsJZGF0YS0+YmF0Y2hbYisrXSA9IHZh
bHVlOw0KPiArCWRhdGEtPmJhdGNoW2IrK10gPSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPiArCWln
dF9hc3NlcnQoYiA8PSBBUlJBWV9TSVpFKGRhdGEtPmJhdGNoKSk7DQo+ICsNCj4gKwlkYXRhLT5h
ZGRyID0gYmF0Y2hfYWRkcjsNCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiBTVUJURVNUOiBiYXNp
Yy10bGINCj4gKyAqIERlc2NyaXB0aW9uOiBDaGVjayBUcmFuc2xhdGlvbiBMb29rYXNpZGUgQnVm
ZmVyIEludmFsaWRhdGlvbi4NCj4gKyAqLw0KPiArc3RhdGljIHZvaWQgdGxiX2ludmFsaWRhdGlv
bihpbnQgZmQsIHN0cnVjdA0KPiArZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpKSB7
DQo+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmNbMl0gPSB7DQo+ICsJCXsgLnR5cGUgPSBEUk1f
WEVfU1lOQ19UWVBFX1NZTkNPQkosIC5mbGFncyA9DQo+IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFM
LCB9LA0KPiArCQl7IC50eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9TWU5DT0JKLCAuZmxhZ3MgPQ0K
PiBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTCwgfQ0KPiArCX07DQo+ICsJc3RydWN0IGRybV94ZV9l
eGVjIGV4ZWMgPSB7DQo+ICsJCS5udW1fYmF0Y2hfYnVmZmVyID0gMSwNCj4gKwkJLm51bV9zeW5j
cyA9IDIsDQo+ICsJCS5zeW5jcyA9IHRvX3VzZXJfcG9pbnRlcigmc3luYyksDQo+ICsJfTsNCj4g
KwlzdHJ1Y3QgZGF0YSAqZGF0YTE7DQo+ICsJc3RydWN0IGRhdGEgKmRhdGEyOw0KPiArCXVpbnQz
Ml90IHZtOw0KPiArCXVpbnQzMl90IGV4ZWNfcXVldWU7DQo+ICsJdWludDMyX3QgYmluZF9lbmdp
bmU7DQo+ICsJdWludDMyX3Qgc3luY29iajsNCj4gKwlzaXplX3QgYm9fc2l6ZTsNCj4gKwlpbnQg
dmFsdWUxID0gMHgxMjM0NTY7DQo+ICsJaW50IHZhbHVlMiA9IDB4MTIzNDY1Ow0KPiArCXVpbnQ2
NF90IGFkZHIgPSAweDEwMDAwMDsNCj4gKwl1aW50MzJfdCBibzEsIGJvMjsNCj4gKwljaGFyIHRs
Yl9wcmVbNDA5Nl0sIHRsYl9wb3NbNDA5Nl07DQo+ICsJY2hhciBwYXRoWzI1Nl07DQo+ICsNCj4g
KwlzeW5jb2JqID0gc3luY29ial9jcmVhdGUoZmQsIDApOw0KPiArCXN5bmNbMF0uaGFuZGxlID0g
c3luY29ial9jcmVhdGUoZmQsIDApOw0KPiArCXN5bmNbMV0uaGFuZGxlID0gc3luY29iajsNCj4g
Kw0KPiArCXZtID0geGVfdm1fY3JlYXRlKGZkLCAwLCAwKTsNCj4gKwlib19zaXplID0gc2l6ZW9m
KCpkYXRhMSk7DQo+ICsJYm9fc2l6ZSA9IHhlX2JiX3NpemUoZmQsIGJvX3NpemUpOw0KPiArCWJv
MSA9IHhlX2JvX2NyZWF0ZShmZCwgdm0sIGJvX3NpemUsDQo+ICsJCQkJICAgdnJhbV9pZl9wb3Nz
aWJsZShmZCwgZWNpLT5ndF9pZCksDQo+ICsNCj4gRFJNX1hFX0dFTV9DUkVBVEVfRkxBR19ORUVE
U19WSVNJQkxFX1ZSQU0pOw0KPiArCWJvMiA9IHhlX2JvX2NyZWF0ZShmZCwgdm0sIGJvX3NpemUs
DQo+ICsJCQkJICAgdnJhbV9pZl9wb3NzaWJsZShmZCwgZWNpLT5ndF9pZCksDQo+ICsNCj4gRFJN
X1hFX0dFTV9DUkVBVEVfRkxBR19ORUVEU19WSVNJQkxFX1ZSQU0pOw0KPiArDQo+ICsJc3ByaW50
ZihwYXRoLCAiL3N5cy9rZXJuZWwvZGVidWcvZHJpLzAvZ3QlZC9zdGF0cyIsIGVjaS0+Z3RfaWQp
Ow0KPiArCWlndF9kZWJ1Z2ZzX2R1bXAoZmQsIHBhdGgpOw0KPiArCWlndF9kZWJ1Z2ZzX3JlYWQo
ZmQsIHBhdGgsIHRsYl9wcmUpOw0KPiArCWlndF9pbmZvKCJ0bGIgaW52YWxpZGF0aW9ucyBjb3Vu
dHMgYmVmb3JlIHN1Ym1pdHRpbmcNCj4gK3dvcmFrbG9hZHNcbiVzXG4iLCB0bGJfcHJlKTsNCj4g
Kw0KPiArCWV4ZWNfcXVldWUgPSB4ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sIGVjaSwgMCk7
DQo+ICsJYmluZF9lbmdpbmUgPSB4ZV9iaW5kX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgMCk7
DQo+ICsJeGVfdm1fYmluZF9hc3luYyhmZCwgdm0sIGJpbmRfZW5naW5lLCBibzEsIDAsIGFkZHIs
IGJvX3NpemUsIHN5bmMsDQo+IDEpOw0KPiArCWRhdGExID0geGVfYm9fbWFwKGZkLCBibzEsIGJv
X3NpemUpOw0KPiArDQo+ICsJc3RvcmVfZHdvcmRfYmF0Y2goZGF0YTEsIGFkZHIsIHZhbHVlMSk7
DQo+ICsJZXhlYy5leGVjX3F1ZXVlX2lkID0gZXhlY19xdWV1ZTsNCj4gKwlleGVjLmFkZHJlc3Mg
PSBkYXRhMS0+YWRkcjsNCj4gKwlzeW5jWzBdLmZsYWdzICY9IH5EUk1fWEVfU1lOQ19GTEFHX1NJ
R05BTDsNCj4gKwlzeW5jWzFdLmZsYWdzIHw9IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMOw0KPiAr
CXhlX2V4ZWMoZmQsICZleGVjKTsNCj4gKwlpZ3RfYXNzZXJ0KHN5bmNvYmpfd2FpdChmZCwgJnN5
bmNvYmosIDEsIElOVDY0X01BWCwgMCwgTlVMTCkpOw0KPiArCXhlX3ZtX2JpbmRfYXN5bmMoZmQs
IHZtLCBiaW5kX2VuZ2luZSwgYm8yLCAwLCBhZGRyLCBib19zaXplLCBzeW5jLA0KPiAxKTsNCj4g
KwlkYXRhMiA9IHhlX2JvX21hcChmZCwgYm8yLCBib19zaXplKTsNCj4gKw0KPiArCXN0b3JlX2R3
b3JkX2JhdGNoKGRhdGEyLCBhZGRyLCB2YWx1ZTIpOw0KPiArCWV4ZWMuZXhlY19xdWV1ZV9pZCA9
IGV4ZWNfcXVldWU7DQo+ICsJZXhlYy5hZGRyZXNzID0gZGF0YTItPmFkZHI7DQo+ICsJc3luY1sw
XS5mbGFncyAmPSB+RFJNX1hFX1NZTkNfRkxBR19TSUdOQUw7DQo+ICsJc3luY1sxXS5mbGFncyB8
PSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTDsNCj4gKwl4ZV9leGVjKGZkLCAmZXhlYyk7DQo+ICsJ
aWd0X2Fzc2VydChzeW5jb2JqX3dhaXQoZmQsICZzeW5jb2JqLCAxLCBJTlQ2NF9NQVgsIDAsIE5V
TEwpKTsNCj4gKw0KPiArCWlndF9kZWJ1Z2ZzX2R1bXAoZmQsIHBhdGgpOw0KPiArCWlndF9kZWJ1
Z2ZzX3JlYWQoZmQsIHBhdGgsIHRsYl9wb3MpOw0KPiArCWlndF9pbmZvKCJ0bGIgaW52YWxpZGF0
aW9ucyBjb3VudHMgYWZ0ZXIgc3VibWl0dGluZyB3b3Jha2xvYWRzXG4lc1xuIiwNCj4gK3RsYl9w
b3MpOw0KPiArDQo+ICsJaWd0X2Fzc2VydF9lcShkYXRhMS0+ZGF0YSwgdmFsdWUxKTsNCj4gKwlp
Z3RfYXNzZXJ0X2VxKGRhdGEyLT5kYXRhLCB2YWx1ZTIpOw0KPiArCWlndF9hc3NlcnQoc3RyY21w
KHRsYl9wcmUsIHRsYl9wb3MpICE9IDApOw0KPiArDQo+ICsJc3luY29ial9kZXN0cm95KGZkLCBz
eW5jWzBdLmhhbmRsZSk7DQo+ICsJc3luY29ial9kZXN0cm95KGZkLCBzeW5jb2JqKTsNCj4gKwlt
dW5tYXAoZGF0YTEsIGJvX3NpemUpOw0KPiArCW11bm1hcChkYXRhMiwgYm9fc2l6ZSk7DQo+ICsJ
Z2VtX2Nsb3NlKGZkLCBibzEpOw0KPiArCWdlbV9jbG9zZShmZCwgYm8yKTsNCj4gKwl4ZV9leGVj
X3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWUpOw0KPiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZt
KTsNCj4gK30NCj4gKw0KPiAraWd0X21haW4NCj4gK3sNCj4gKwlpbnQgZmQ7DQo+ICsJc3RydWN0
IGRybV94ZV9lbmdpbmUgKmVuZ2luZTsNCj4gKw0KPiArCWlndF9maXh0dXJlIHsNCj4gKwkJZmQg
PSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gKwl9DQo+ICsNCj4gKwlpZ3Rfc3VidGVz
dCgiYmFzaWMtdGxiIikgew0KPiArCQllbmdpbmUgPSB4ZV9lbmdpbmUoZmQsIDApOw0KPiArCQl0
bGJfaW52YWxpZGF0aW9uKGZkLCAmZW5naW5lLT5pbnN0YW5jZSk7DQo+ICsJfQ0KPiArDQo+ICsJ
aWd0X2ZpeHR1cmUgew0KPiArCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gKwl9DQo+ICt9DQo+
IGRpZmYgLS1naXQgYS90ZXN0cy9tZXNvbi5idWlsZCBiL3Rlc3RzL21lc29uLmJ1aWxkIGluZGV4
DQo+IGU1ZDg4NTJmMy4uMTdjODA4YWI2IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9tZXNvbi5idWls
ZA0KPiArKysgYi90ZXN0cy9tZXNvbi5idWlsZA0KPiBAQCAtMzE2LDYgKzMxNiw3IEBAIGludGVs
X3hlX3Byb2dzID0gWw0KPiAgCSd4ZV9zeXNmc19kZWZhdWx0cycsDQo+ICAJJ3hlX3N5c2ZzX3By
ZWVtcHRfdGltZW91dCcsDQo+ICAJJ3hlX3N5c2ZzX3NjaGVkdWxlcicsDQo+ICsgICAgICAgICd4
ZV90bGInLA0KPiAgXQ0KPiANCj4gIGludGVsX3hlX2V1ZGVidWdfcHJvZ3MgPSBbDQo+IC0tDQo+
IDIuMjUuMQ0KDQo=
