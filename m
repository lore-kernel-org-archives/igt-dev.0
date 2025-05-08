Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AB7C3ABBE
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 23:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BECC10E226;
	Thu,  8 May 2025 23:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNYg8Usb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BECD10E226
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 23:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746747912; x=1778283912;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=01486/H3rjaWR9x8bBUNgkoXvZOGg8bFrgY8ZrZqDDE=;
 b=XNYg8UsbgM3JRPC1o4rIipyqZu1GMFm1ee3i53EHyeAJBosVciq87OJ6
 E0wARHV1xxaRNEJrJhbfLzWY5m1wbQX87Wwiz18RLxFAM7f3DJopIOh40
 6fTsm/WWrrUO1ZG87sOl8GS/VQnUzIpRSJHyN1baBnVgqW3QQvstI11rO
 nrnvMzK2wBOK/yzrC4aIg503tpQbuIw60dJNjbRG456kwAfi4qljuZ9CF
 BsPXPpGevBBtXeljxbQNSE3nCOFgyarPCQCgrWmHHk8uAs4V6bh98CAJJ
 wY+LYmU90hE/TPHdT9eMbyj+a/vlyg7RnUAfSAQ4j8s5I3Vh+VPLMid30 w==;
X-CSE-ConnectionGUID: YA3/9DOtQbOMHTWqsZO07A==
X-CSE-MsgGUID: pJCHmrmoSPuouilqqLjdzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52211445"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="52211445"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 16:45:12 -0700
X-CSE-ConnectionGUID: D+Inzb1lSrCKklhg/AW7zw==
X-CSE-MsgGUID: NNEUvkBdSNaJ81mX1Zs0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="136151290"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 16:45:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 16:45:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 16:45:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 16:45:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqHZDeFWFEMyn52Oh8ifbEk0AbsGOvau9QE3jVB38gtoCA5gcQhROZAOAVUj0D2j6K1K/ihWPXcMa5b8kK0OHi01P6v9nsEn7+QL4e2X/xwh2hiJmqs/DKM4UE3IfkgAZaJMJe/u8ualAKbZcPqHnVfkgTphDgf/cW2z2vS56rgsRZ2Wnrp5xN1IJp2hwk0imVQT8JfUJoAM7N95vqnM3FxYuAVUGAxtH+uF884Ko9gFqhUqU7Po45KihbqgX2p0s9qzQ8AweJv92V2OZf/b61IZzZy/hK4vk2cmByBzRXx2rPzTVz8s5sko6a5j6/EcCe19cvGax/qoTqLtMHLxtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLs+TXChFRTiYROoc4/PDGM0M3Ck12sm4m8t8VtBfRA=;
 b=J7q85n1M/sxmlSt5AJKh94F7Gphv0p45oC7fezikmQ1l/DslzZB24Kb0nsIGDOaRT7wQwCCV1JqtirQJjRriCB/MZyreUvPoDrLiGRqg7U/94n0KrwO1gLJLCT/4Ex1IyHyAjFNY12fqIBX4ZemneYOtEMckx2/aDW/iwJCG9w3i4kKjxcZTmEB3shEinhWKjAWLDFDy/cry9Uu4ixdfN6pgguOJduzkVX1lhC6avHjXXS7r0uyC3YY3AuJq0AwkIeRtx5quQTxP0FOE4zc29V16OTiPBgxZWbnF+RhLZEswpjEnpO/1wEIH+TGh6/8kSyPhpZed3kHJ2CckFkta4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6402.namprd11.prod.outlook.com (2603:10b6:510:1fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Thu, 8 May
 2025 23:45:04 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 23:45:04 +0000
Date: Thu, 8 May 2025 16:44:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 3/5] tests/intel/xe_pmu: Add tests to validate
 engine activity with single engine active
Message-ID: <aB1B9tpjF2RUKyJd@unerlige-desk.amr.corp.intel.com>
References: <20250508055006.734259-1-riana.tauro@intel.com>
 <20250508055006.734259-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250508055006.734259-4-riana.tauro@intel.com>
X-ClientProxiedBy: MW2PR16CA0039.namprd16.prod.outlook.com
 (2603:10b6:907:1::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: c24f0e9f-102e-4e42-b022-08dd8e8a5b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUo4aXNzV1JhSE9kaEhodHFNc20wdVdmKytZR0ZTYVN4QWVtNGNNZU5TSHVh?=
 =?utf-8?B?VzdqTVZwNEw5ak5zNVM1MzJFUE1ScmlUa25tWkF1eW11RXo2Sys0Nk1LTnFm?=
 =?utf-8?B?NHdBYUpiSlp5elFDR1lRd2VCUWNaZjVJbHNZeFFLUVNwcnl2cTRYNWtNcVZT?=
 =?utf-8?B?NURFdUYxQXV1ZXdWcW9MUFVPOE56c25maXBISkFVQm4xdXp5aDFjdmRqRUsv?=
 =?utf-8?B?bmV4T0U5VHVvN25IMmRBM0lTdGdJdHZmc3FjTlY0ZUpRR210anphek84M3pk?=
 =?utf-8?B?ZDY3Z0FZQ3ppaTFyR1VoY0tnLzZYelBSY3NtSnJkcVJydXk0bU9kaE14U1hG?=
 =?utf-8?B?S21XRWlCaU9wV0FXT3EzSlZFYU9oZHdyVmNwSHNTMjV4bGZRb0E1VjRkRmtY?=
 =?utf-8?B?VmN4dDMxN3JaS3Bha0FEdFZTaGUrQVJkaWU0OUE2b2xBK3BBemxHQ3ZuTEx2?=
 =?utf-8?B?MksxRUFEY2tFaUtCKzNBV1IwZjZtc1grbVVBN3B6alJ5aFVueFVXODFQTzVR?=
 =?utf-8?B?a2o0ZXVhbFBSRFo3Zm8rdUFVVkhSWnFzS3FYM1dPSW50d2ZLdE91WTQzaGZr?=
 =?utf-8?B?cXRvYnV3MDdNSUIyQWREdk1oVHB6UGwzU1NVWmpXRXFPL0s4U0VOR3hUYUtI?=
 =?utf-8?B?N05QOVdXYjgwOUNTeTRaTFJoKzJEVDdaZUc2L21OWkFmajd5WjVqQ2V6a0RP?=
 =?utf-8?B?Qlltb1pBMjlCV1Q3L1ozOEtjdk84WjZyVlVIMHhmUnV0SVlaOXJIM1JUNHkz?=
 =?utf-8?B?Y0JZMHd5UU9aRm1DSnE0eWJIZmNxWnNjeHV5MFFqcngyc3JXV3Q5ZVJJSGYr?=
 =?utf-8?B?UVpKOUtXM0ozdThZUGRKR2l6ZG1sYi9oUGYzUHZXNnpPWDR1emw5U0FvYy9k?=
 =?utf-8?B?Vk1wVjkxNmo3VHUxVkZFYzhjK1F0cDdmZ3RUMGpVSEdGRnd5ZlZ2SmRJQVAz?=
 =?utf-8?B?bkgwQ0xvT3dBVnNwb2RFUHNCNldhZm0xK0lDVFVxRWFWcWs0UCtCejRCa2Jp?=
 =?utf-8?B?L3ZzY1htOWR3bWxGdEY4eXdQYXRYR0ZiVHYrcXowRW5tZGI4TEhLK2NXNzBW?=
 =?utf-8?B?Y3pBN0w3SlFQaENVK3dFMmF2SWl6THdjUHFnb1BiMHU5NlJSTGJ0ZGM4NjNs?=
 =?utf-8?B?WHBzVVp6Vm9YMFg2VHpjQTZhYzF1b0N2SXprVVZRMENJUEtlTTQvOThmelk4?=
 =?utf-8?B?Nko3aXp1NmZGdDJLa01VTzhpRXNzUmVibGd3ZlBhR09zYmt5N2hESWlTNFpw?=
 =?utf-8?B?QjVDMnVTWlBkZy9sU1FRelltMWRHM2I3ZkU0N3h1clJKWEtad00wcVYreUNq?=
 =?utf-8?B?cVc3Z0kydHRVNTVKTVdKNlBraE15WGtNMVBsT2pXK1g4UG5MZ2wzVlJ1ZW1F?=
 =?utf-8?B?WUNEb1VQL0VDbXBpSFZtUXZHQXpRK1JXa2ttemNxbWVrTXBnUHBqSUdKeVZ5?=
 =?utf-8?B?WjR1dXo3dC9EN3JNb3IzWEVwVURiR0VZNDNvbVM2b3oxazhSRGFVMzZkK3U4?=
 =?utf-8?B?dnZ5Y1dHZ0RRUXVNTGVXU3dkb1B1VmI0b3BtOFExcm1sa1JaK0FtQ1lIUzlQ?=
 =?utf-8?B?T3A2bkF6R25GMjZEcWRqMDRCM0YyVmpEbnNSNkhPQWNucklST0M0bzZkUXEy?=
 =?utf-8?B?Wi9uQSt0ZWYvY3dZY2dhVkxyMCtFendBZEpJbzh3L0RsMVpvRXV4K1JuTHND?=
 =?utf-8?B?aGd2ZHNsRFJmbnR0bUF2bG0wNUhSSi9MbzFjbzgrVUFUNFliYU16SWQvOTZH?=
 =?utf-8?B?b0phMVphMm1xcWdKWFFVVjVBUHR3dUpsNTZRTnVyTkVrT21ERmZqamw3NERL?=
 =?utf-8?B?cWFQSnBFZlBXRGxkbk41MUxMK0V0STIvRm81OXNkTHByNWUybVc5ODVVcEFE?=
 =?utf-8?B?bUwzWSt4blE2dFhiUGdYcmF1Njdrbm5lQWVCUU04Zm1jTkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3hkcGFXZG1QaUxqUW0yNWJkK3B2UWhJYTdNdjhFdlA0L2tuM0ppVHFDYXZj?=
 =?utf-8?B?V3BQMEhGN25xMWRMZGdkTVdmV2FjWUs2TWhJQkNIQlZrQUwvYmhYVi96Vlha?=
 =?utf-8?B?cWR0dU15RDJCSmJJcWhFaUtjeVVKVzVOVkhvSGsyenRpT2s4SFJJOUtabDJH?=
 =?utf-8?B?bU9hWEtvOW9DT2lRczRuWEtTTW84Y3d0TDBOZWtydW9xQ2ZHNFdaWWxaWlVB?=
 =?utf-8?B?RjdRZWJ1YzlkeWY1djAramJ6ZmF5YllNVzNZQnRra3lROUtId0o2cThXOUl1?=
 =?utf-8?B?N2RrTlZFOGFZc2UxaTdrdUdQQnlFbWNLMy9mZVU4WGc2MGp2N1J5cG96clAr?=
 =?utf-8?B?eGhwSngrMVlCVUZyYnFqK2V2MEFrV05WSVQrRHdIUnJyN3JOZVp5Qy85bnBk?=
 =?utf-8?B?ZExkdU9oWTFQVDJaWCtPdEVSYjFQazI5TnJyZUgzazF6OU1La1h2UVoraVhL?=
 =?utf-8?B?aWs2NHIrYlVVRXZuT3d4OEV1SXVYMC9lN29JR2oxSlNoYmkxQmxIcGxEZUJW?=
 =?utf-8?B?TlRBVzhuejhMWlRIb0NGYU5KT1lLUmhWTVZhRlZtMmVxY2ViWExuVHhNbGE1?=
 =?utf-8?B?bVVXTWVQMTJkK3VtdldVa3pvQmJVQlN5dS9IV1VqNitpMTVET3NRZHBYVHRG?=
 =?utf-8?B?bVNtbmlUMjFwcGFuekJDeEVIMTloeW5VbDErcWRtUDhIRDNxSStsUHBvckJH?=
 =?utf-8?B?UFlWdXpYckdZclAzSHFRY0hQbm14UXVhbmVCUE1La3Bvekg2L2pYaTBxK0FV?=
 =?utf-8?B?aDlydHdxZS84VFZQaTZ5czJCcmFPQ2UyZjJGQU45QlJpLzZ3QkZHbDFxWTZo?=
 =?utf-8?B?WFMvK01pMFZoU25vTFdJLzl3ZmtUWVRIUzVOLzNwQThPblpLRUZ6Y1BOMWts?=
 =?utf-8?B?ZUFQWXRzY3NkcTFpWkRxN2NuYjNnRnB3ZlpyTEZXdGJtTFV6V2h0MXdwUEta?=
 =?utf-8?B?WHFzR3k3NEY0cWNmTExaZnBEaTBHT3BIL3FuNk9zOTZZZExrclBtbTB1OTQz?=
 =?utf-8?B?UGd6WEw3K21ibFZCTUdxTXRtN2dQQmFDSWdUelZrdUVHWUpKK0U2WExFUzh6?=
 =?utf-8?B?NzIwSjJJeWJ3eG4zaVFNbTRKdm80R2RrSE5RaTBYOXhQbityeFFuZVIvNEdB?=
 =?utf-8?B?RUYzbXltUld6cFM0QjM1ZTBPd1J0SzRZNEtxaEo2ZDM0bjVXbTlLc0xTZU56?=
 =?utf-8?B?bkZpS0Vyek8rT1NvanNvckZqMXpDNERDRnNDNldRdmxlQnpQOFRiT3d4Z1pi?=
 =?utf-8?B?b3k1U1JqZmdxa1pQQVBPOEx0cUl3WElxNFk2MCtOK0dxVGExUjFDWmZhUDN3?=
 =?utf-8?B?WGRaRUtWYUhzWUxGZmJWMXJadXFCWHJXM2hOOGJZQm1yeE1OSmVIZU9zUjVp?=
 =?utf-8?B?RXBtYXBIWlpDaTFneUxuenF6MnBwaDRCUVVRajJ0WFdVeHRqTTNNcGVLRndP?=
 =?utf-8?B?ZWJXQ3BxbTZhT25KWjFVNVdhWGxkNmVoNno5emQvUWJhQmZCcHJtMDZKVFZk?=
 =?utf-8?B?UUZlWU5uNjdXNzJwMHBNeGt4VHN2RkoyNTBkSWsrM2FhdmU1UjhXaDJYNFRC?=
 =?utf-8?B?b0x2QXp2R0hJcjB1Y0pxZ0xocjBVelFOZmtLYUtIRVQ4enQzZWpPRCt1dGNp?=
 =?utf-8?B?M0p4RlcxM3Bxd2JlbVlBdnRoSzBJTmoySHh0Ui9xNWVIQ3QzcjNLRG9qbEo2?=
 =?utf-8?B?ZnRwV2JVSENmNlJUR2VybEt6RnNYS0Q2Z21nWkVpSHVLSUZhYzB4dmNHNEdq?=
 =?utf-8?B?bzd1QUQ4aFJBd2tWODdHeXVLZ2dmeVpIVVZPQTAzL3pPVHdXWXY0eE52NlhN?=
 =?utf-8?B?eHB1YzFYSTcyZE9vTGFRSm9VY0g1ZFF1NWNXdVlMeWt6S3crV2tWWVFRc2lL?=
 =?utf-8?B?UkRXcmNTQ1dCeDhjYXdrVnM2N09XMGc4ZUpuTURaMTdHRklNUVlBSXFYU2ZO?=
 =?utf-8?B?YjlKNlpiYzF1VDFzNDlyaVVXeWZzQm1zMllKVTFtVXpSL0J3NnQxTllydjVR?=
 =?utf-8?B?RzBOYnVxZS9lT25TUHh0SHVFWjhYNHZVbVptRDdHcHlScnZPRThpQW1pK20y?=
 =?utf-8?B?WlFram1lV1VvMFhsdU9GU25lSEtyMXV1VU1kNHJFREZhLzU2RDFCRG82M2RE?=
 =?utf-8?B?Z28rajdWbjU5K2kwWDhyUTVVT0ZqVDUvVWd4S3QySWY2dDBCU3U5R2syRlFr?=
 =?utf-8?Q?rghplgkZtXC+qaIjz1+2GAY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c24f0e9f-102e-4e42-b022-08dd8e8a5b2d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 23:45:04.6158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhdOUXq0Y1UtYB1imQW/vSXfjOR73SgQhXWBId8heOXfCphfdhNQgB1cgfD/aW86fGX8wyp/wLGkM6yEbNeboUyP7j3Y9qzpHBrcB5w1QXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6402
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

On Thu, May 08, 2025 at 11:20:04AM +0530, Riana Tauro wrote:
>Add a test that validates by running workload on a single engine and
>checks if others are idle.
>
>Also add a trailing idle test case.
>
>v2: use allocator
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 114 ++++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 113 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 1ad927822..d78b8bea5 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -24,6 +24,14 @@
>  * SUBTEST: engine-activity-load
>  * Description: Test to validate engine activity stats by running a workload
>  *
>+ * SUBTEST: engine-activity-single-load
>+ * Description: Test to validate engine activity by running workload on one engine and check if
>+ *		all other engines are idle
>+ *
>+ * SUBTEST: engine-activity-single-load-idle
>+ * Description: Test to validate engine activity by running workload and trailing idle on one engine
>+ *		and check if all other engines are idle
>+ *
>  * SUBTEST: all-fn-engine-activity-load
>  * Description: Test to validate engine activity by running load on all functions simultaneously
>  *
>@@ -51,6 +59,7 @@
> /* flag masks */
> #define TEST_LOAD		BIT(0)
> #define TEST_TRAILING_IDLE	BIT(1)
>+#define TEST_IDLE		BIT(2)
>
> const double tolerance = 0.1;
> static char xe_device[NAME_MAX];
>@@ -165,6 +174,43 @@ static void check_and_end_cork(int fd, struct xe_cork *cork)
> 		xe_cork_sync_end(fd, cork);
> }
>
>+static void log_all_engines(int num_engines, int skip_idx, int flag,
>+			    uint64_t *before, uint64_t *after)

s/log_all_engines/check_all_engines/ since you are checking idle/busy.

s/skip_idx/target_idx/ or something else, since you are deciding if the 
target is idle/busy based on the flag passed.

>+{
>+	uint64_t engine_active_ticks, engine_total_ticks;
>+	int engine_idx = 0;
>+
>+	for (int idx = 0; idx < num_engines * 2; idx += 2) {
>+		engine_idx = idx >> 1;
>+
>+		engine_active_ticks = after[idx] - before[idx];
>+		engine_total_ticks = after[idx + 1] - before[idx + 1];
>+
>+		igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", engine_idx,
>+			  after[idx], before[idx], engine_active_ticks);
>+		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", engine_idx,
>+			  after[idx + 1], before[idx + 1], engine_total_ticks);
>+
>+		/*
>+		 * If flag is load and skip_idx is set, then check all engines for load except
>+		 * the skip engine id and vice versa
>+		 */
>+		if (flag == TEST_LOAD) {
>+			if (engine_idx == skip_idx)
>+				assert_within_epsilon(engine_active_ticks, 0.0f, tolerance);
>+			else
>+				assert_within_epsilon(engine_active_ticks, engine_total_ticks,
>+						      tolerance);
>+		} else {

Assuming this ^ is else if (flag == TEST_IDLE). I would make it explicit 
here.

>+			if (engine_idx == skip_idx)
>+				assert_within_epsilon(engine_active_ticks, engine_total_ticks,
>+						      tolerance);
>+			else
>+				assert_within_epsilon(engine_active_ticks, 0.0f, tolerance);
>+		}
>+	}
>+}

Overall, I would split the above helper in two:

check_all_idle_except_one()
check_all_loaded_except_one()

or any other name that conveys similar meaning. I feel it would be 
easier to read and debug once the asserts start kicking in. If you do 
that, you could drop the flag parameter.

Rest looks fine.

Thanks,
Umesh

>+
> static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> {
> 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
>@@ -216,6 +262,63 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 		igt_assert(!engine_active_ticks);
> }
>
>+static void engine_activity_load_single(int fd, int num_engines,
>+					struct drm_xe_engine_class_instance *eci,
>+					unsigned int flags)
>+{
>+	uint64_t ahnd, before[2 * num_engines], after[2 * num_engines], config;
>+	struct drm_xe_engine_class_instance *eci_;
>+	struct xe_cork *cork = NULL;
>+	int pmu_fd[num_engines * 2];
>+	int idx = 0, busy_idx = 0;
>+	uint32_t vm;
>+
>+	pmu_fd[0] = -1;
>+	xe_for_each_engine(fd, eci_) {
>+		if (eci_->engine_class == eci->engine_class &&
>+		    eci_->engine_instance == eci->engine_instance)
>+			busy_idx = idx >> 1;
>+
>+		config = get_event_config(eci_->gt_id, eci_, "engine-active-ticks");
>+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>+
>+		config = get_event_config(eci_->gt_id, eci_, "engine-total-ticks");
>+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>+	}
>+
>+	vm = xe_vm_create(fd, 0, 0);
>+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>+	if (flags & TEST_LOAD) {
>+		cork = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
>+		xe_cork_sync_start(fd, cork);
>+	}
>+
>+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	if (flags & TEST_TRAILING_IDLE)
>+		xe_cork_sync_end(fd, cork);
>+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
>+
>+	if (flags & TEST_LOAD) {
>+		check_and_end_cork(fd, cork);
>+		xe_cork_destroy(fd, cork);
>+	}
>+
>+	xe_vm_destroy(fd, vm);
>+	put_ahnd(ahnd);
>+
>+	for (idx = 0; idx < num_engines * 2; idx += 2) {
>+		close(pmu_fd[idx]);
>+		close(pmu_fd[idx + 1]);
>+	}
>+
>+	/*
>+	 * TEST_IDLE is passed to log_all_engines to test if all other engines are idle
>+	 * except the busy_idx
>+	 */
>+	log_all_engines(num_engines, busy_idx, TEST_IDLE, before, after);
>+}
>+
> static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
> {
> 	uint64_t config, engine_active_ticks, engine_total_ticks;
>@@ -544,12 +647,13 @@ static void restore_gt_freq(int fd, uint32_t *stash_min, uint32_t *stash_max)
>
> igt_main
> {
>-	int fd, gt;
>+	int fd, gt, num_engines;
> 	struct drm_xe_engine_class_instance *eci;
>
> 	igt_fixture {
> 		fd = drm_open_driver(DRIVER_XE);
> 		xe_perf_device(fd, xe_device, sizeof(xe_device));
>+		num_engines = xe_number_engines(fd);
> 	}
>
> 	igt_describe("Validate PMU gt-c6 residency counters when idle");
>@@ -571,6 +675,14 @@ igt_main
> 	test_each_engine("engine-activity-load", fd, eci)
> 		engine_activity(fd, eci, TEST_LOAD);
>
>+	igt_describe("Validate engine activity of all engines when one engine is loaded");
>+	test_each_engine("engine-activity-single-load", fd, eci)
>+		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD);
>+
>+	igt_describe("Validate engine activity of all engines with one engine loaded and trailing idle");
>+	test_each_engine("engine-activity-single-load-idle", fd, eci)
>+		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
>+
> 	igt_subtest_group {
> 		unsigned int num_fns;
>
>-- 
>2.47.1
>
