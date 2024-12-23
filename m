Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F13DE77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 04:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC7410E1F3;
	Thu,  2 Jan 2025 04:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPlUKFma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B5510E520;
 Mon, 23 Dec 2024 11:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734954619; x=1766490619;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uPCnYI+MxjtLgOR58QNpaIwVntT4N+MX23nG77TGMqQ=;
 b=NPlUKFmaa8kEYMhtuZYiWpYg2J9AnJuccCxbZUEZ111SS6o/zhtQFCQB
 vE/1XsZL+cZAOa/4jQL3lTSvLyj+1ynCsqY181mmCTFDIx7/+3B6xLf9Y
 UYuCqhxOt1E0iMdlcUF+JYHAgKthves1RSD81jFsm5w03ZUfY73S35vEX
 Hy9QqjFJiqY6DoYtcd/z27STQWQ1C75Lm5iLiJHh0bcgUFmTcvbIiDnX3
 wl/jwbw/kBc7OcpXijseVc4Di1u0dUZ9Qd6XzICQf2pPrtSBl8Y+1h9ab
 VHjmZFk/I72S1x80hGTa/2iI2KfdBok7YDzaRJwssYehWpfsO9qWtZVV/ w==;
X-CSE-ConnectionGUID: kzCItbr6RHK8WQgpQ+Dh+g==
X-CSE-MsgGUID: FAI8ETXZT5KGqdkkSEByQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35312879"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="35312879"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 03:50:19 -0800
X-CSE-ConnectionGUID: /KLckJ4VTna/l47FvMJr8A==
X-CSE-MsgGUID: GLMuwutGSX2N8LW0yN9G1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122462950"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Dec 2024 03:50:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 03:50:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 03:50:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 03:50:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2E/ggjeoT169PzUE+6/IqWKuYVMKbrPePiU/q8iFxPMIOG0aTKvnFl+I3dww4jF+LvYrIWLOIwo8EBAF+zOfZZXLvunQ6R7oRbgXStJ5DCBhkuOMuKOUCl2AAY5IzQY/uJdtk1biZFGkSfGnU4ojhFNRLhsu7U0k4c38iqewMqcVG+byJDvE4err8JV2AHDT3qyzPq51gqzL1XT7GWXQxep20+0B7Q5zvCQwLZyIqJewQSHYABcz8lYXwwLCpJinCqlmDD/BKgYYJ0ydtUZaomUhY4ZIM82OXuTqI2le/zjmQgyJugrLwQFhe4qwhoVOKi0TCi5o0twLCVgoYNQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPCnYI+MxjtLgOR58QNpaIwVntT4N+MX23nG77TGMqQ=;
 b=rKQ9hKzsxaiG8bV4a5lqzZkq9si/P+M4LVxx6jdodA8ip/+Pu1edV2hqSVW5reBS+6jdWedjNBaS+ePhdh1ulsKJgDCNVFMLC9UBV074B1FyruEWojzImKJ4Xsub4LQSW659NwJt72kKkKsg6BnAWSJ1u70Fu8/iwu9egBlcymuMBq4tzMSMdwIOZXCWHAI8gMTSow+eoThe47dJQiPifOCN7RBgNG/CrOo64HHl27m8oqEzuZ1ugrLdX9U1gYbJAe1YLxiMoT6oR5Lzads+Dx1G4hrl43wc/7wa1WQP7cL4Hiek+W/KkVGH/N/a/AxxI5UjjBspuocfUYSkSMmDuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by PH0PR11MB7614.namprd11.prod.outlook.com (2603:10b6:510:28f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Mon, 23 Dec
 2024 11:50:11 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 11:50:11 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVs?=
 =?utf-8?B?L2dlbV9leGVjX2JhbGFuY2VyOiBEZWNyZWFzZSByZXF1aXJlZCBsb2FkIGlu?=
 =?utf-8?Q?_`full`_test?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvZ2Vt?=
 =?utf-8?B?X2V4ZWNfYmFsYW5jZXI6IERlY3JlYXNlIHJlcXVpcmVkIGxvYWQgaW4gYGZ1?=
 =?utf-8?Q?ll`_test?=
Thread-Index: AQHbUssDf+xbjpnexUGJzP7aWAvKhrLzqiSA
Date: Mon, 23 Dec 2024 11:50:11 +0000
Message-ID: <CH0PR11MB5491A2588F64CA0E11E63E47EF022@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <uupn5abwcptf6p4zdaz4ozl5utjcwij2sjlebrlgkqw3xupxma@nvacr67vd6tf>
 <173459519840.350813.12374231105564545373@b555e5b46a47>
 <ubvcocnm4cpxgp2vszjsposstlt7mvn6goqqsytxaqsldjwiul@fi2r6muxx2xe>
In-Reply-To: <ubvcocnm4cpxgp2vszjsposstlt7mvn6goqqsytxaqsldjwiul@fi2r6muxx2xe>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|PH0PR11MB7614:EE_
x-ms-office365-filtering-correlation-id: 995fb296-d6d3-4c31-d184-08dd2347f4f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZENDK3ZzanE0aFJTMDA4dFJyVlNTOHRaR3FoVGgrVlBBL0NsSHlMeVJldFFR?=
 =?utf-8?B?djNaV0J4R3kyMzk0MXEzZEh2TWRkV1ZzQWlEUGFXbktIK0VwRXdLY3hyY3Yy?=
 =?utf-8?B?d2tTRXhNRDNwM1ZCK3ZCcGF2OHUwSDZRZk5QWnRqSGFpZDJaNHpDQXVBMlph?=
 =?utf-8?B?STZwQ3hKVFJGaFVvL2xsWHFEL1ozTm9ld24weDlNNHRTblJlTk9TYjhyRmt1?=
 =?utf-8?B?VUlZcVhtV0xnVm9QMWZRbElSVVByTmxrUlFJRStqODhZajRpSHhNUktKcDVP?=
 =?utf-8?B?Sjd4bGF1ME1ySWlHRU5FdEs4TC9LcE5aNHg2UWZrQVVVSUl3OExRZ3JCQWJV?=
 =?utf-8?B?ckQyTzg3SjNVZHFya0grT29IdzNUVkV6bnhUK2traTIvWitDYzdhOU9MZExH?=
 =?utf-8?B?L2VaQzE0RVdPNFZSNEpXL1puTUpRdzBTeTI4c2xFT00wMUpaRXl3UkFDTEVm?=
 =?utf-8?B?Nkxnb0V6SktpQXZ0VGFJMERoOVJlS2pEdDlLT2I0SmNxb1Y2YktCWThzY3l1?=
 =?utf-8?B?ckMvakY5WjJDTU90V2FmcXEzVmRDWmtKaHIxMk85L0pLc09rQ2dnVmo4Uk5n?=
 =?utf-8?B?N1JRSXRDcHk2WTdWdU9FWkdkZ3MwRndyM3NrUzQzMFJtcG5GMzlzSTVITXcr?=
 =?utf-8?B?SzdFTFhkK00yK0lUcERZOEZRZ0FscUxxUVFBUnZHN3lKelJYNDNqdmpTeVBl?=
 =?utf-8?B?bmcvTkFveGpLOGMzQU9Nb0p3UU5pREVUQmZubFpMcDVDZ1JURkdORUlmN2JI?=
 =?utf-8?B?akEzREVCWXhVclIzTHdwYmVBVmh0MG96K1VEZ0xManpkV1IyY0hSTVBwZXAv?=
 =?utf-8?B?S2lURVZER0xJeUI4TW1uZnhXVXFBbjhxaUJTcG1VWXlyRVRROTNUK2JVYmhL?=
 =?utf-8?B?eXRjT2ZGZVJzRjBxSkMxZTl6dFdudFVqb1dWTlRCZk1nZmFWN3ZuTDBnMXZy?=
 =?utf-8?B?WWpiVXd4UThqS2J2UkxibkJZQitGUnRFUlBFc3cvR2JjeEtxaWxMWVRzcXpY?=
 =?utf-8?B?L1Y3ZjR2UEFWWWhQby84SEo0bFNZb2ZmcjJYR3ZpS1FQUkw3RGFrQW9pVkRr?=
 =?utf-8?B?MzVuVWV4cDJMYzJCUWZES25oSUVLYUFEcXpmOWlDVkF6SnRuNzBtMlE2R2x2?=
 =?utf-8?B?V3ZLT2JBWEJodXpYLy9iejQzWk5XMkFweWJMNThuYVVSeEMxNlBNTk5BOVVL?=
 =?utf-8?B?U0ZpWU50bitIaVZiNndRQ0pJUmxUNDJIN1pXdmF3K3preU1aM1R0VTFQVEFt?=
 =?utf-8?B?c0FIcFZIMW5qUktibTRVODJGakEzVFA0ZG82aWl0WmpYUHgrSVBBVWR3bUdy?=
 =?utf-8?B?ajRFWXFGZ0UvamplYThNbG9YWjBmV1V4dE5KNm5EUkRqdDQwbkRKVEVXc2h4?=
 =?utf-8?B?M0R4a1B5NjcwaDY3MFVLTkcydnBldC9pVm1CRzdUYmJBWk50aERCYk1leDJX?=
 =?utf-8?B?bkRaVzZmQ1RMZTFHSDA0RDZnbzBMSU5jOFZQZjhYOG5scWFRczhaSkhkb1Zi?=
 =?utf-8?B?TnlaWTBaOElwZDM4SUZLUWNMc3dMeFc5UW9ra0k1TFQ0Wk93WkZuYTR5QVFj?=
 =?utf-8?B?L3pIWVFqZktlL1NQKzRoT0FhL1JRZXA4ZS8vUGdwVHBQbCtEdkFVanFsZitN?=
 =?utf-8?B?aEswY0ZBc1FhWGc4L3ZjRXppS1lwMUNCUmkrREo3VXJuajEvWFVPcCtxelIz?=
 =?utf-8?B?VkNKTG11TnZrY1g3NURDWDgxZlF6RmVHeUhxL3krWFlGQ3hicVQzamU1bTN4?=
 =?utf-8?B?c2Y4WkJOZHJ1TnFtQ1h1QWxta01HRVlCQzM4UG1TYTZzZ1VxNEhvZmJvNkxB?=
 =?utf-8?B?cjVoN2NoTlIzNU12RXJDRG9ma3RkNllMd2sxQ3dWa0c4YktITXBKTVZWQzJS?=
 =?utf-8?B?V21KNEV4YWhRMjBSQ2tENnIvZk5mRHM0MTdCdmFTZ0JqTmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGo2cnp1bnNwK01qUFhKOVZFd0t1NTNMcXhhZjVKUHNxaWpscElJQlhRZDkz?=
 =?utf-8?B?VWNlc08zMkhHNW9JQU9PZEpUYTlGVkpGYTRGNWhDeU83bURrKzlRTWwxUUZY?=
 =?utf-8?B?M3JPOWd5VGVmZnFudDFmSTB1QUxieUNIVnJFT2JjVW96cTlSMXZyb0dTWmlS?=
 =?utf-8?B?RCtheWhLMUlVb0paVHlITXNRKzlmcVY3V0x2MHgvZjVRZnBNOENJYmZLRzZm?=
 =?utf-8?B?N3k1TXhTMVFUb0tpVjlDR0U0RGVSaEp3cTZYeVlja2llWWRzUms0M3NxdktP?=
 =?utf-8?B?Wm1lTSs2QzBWUUdYTWticVFIcTdCWHVRTG9lak9TODhXOHV0NmlMVDlxbnVa?=
 =?utf-8?B?cjhzV2oxZ0E4MW5raWg0VzJ4cm5Yd0ljU1ljU3lKR2hXaXFwWTNObWV5eGN5?=
 =?utf-8?B?NFV3U1RNcGFEQVFxbkpJdHhuNWIvZzlIRHVkM0R3L3lXMlY1VmhIMmRoZlVI?=
 =?utf-8?B?Z1NPOHdMNkt6WkQzRVVNeHg0QUR4Ym5XcnlJeVJZUC9ocHl2T2RTQXR2cE5I?=
 =?utf-8?B?RGpoUFVUbXNxNjREb1IxaXo0ZEZQLzVmZ3JYK0hzYld6OTUzU0hMMk9xZnA1?=
 =?utf-8?B?QVl6WTVYcmh5ZXhCdXBwVklhUzFHby9QK2hZRlErajBHSU93d2xkTWNhVHFI?=
 =?utf-8?B?NEhONTZ5bHlFaTliUWxFVzhtNGJvMkZOZW8wVm1OVWNjL2owazJnL29QUVU2?=
 =?utf-8?B?bW9Dc05oVWo3ZGpDS3J4VVM4a0pLcWliYlNKRWRYZ0Q1K3JIdW0rY0s4ZURu?=
 =?utf-8?B?TGdHYThaaG9yM0JCaUpkdnJwcjBIQ1F6MERnTkV3WThzQmUvZnpGVEp3NnEy?=
 =?utf-8?B?RFMwVGo5UTJLY3YwTFNqNnlqZjlnL3lqN3NlbFNHM2h0TWlhMDZrTWsvNGF0?=
 =?utf-8?B?RWY4emJIaEMxdkRJN1dmR2JTMldsWnh6OWxrY3hZeEZzRUpSbURQRzdYQXpw?=
 =?utf-8?B?a2hNZUVNS0txUnVnUDg1U0dYQnNNWnUrd0llYm0rSFpRRlh4M2FlbEZyTU05?=
 =?utf-8?B?YWtWT3JhWEt2ejU1ODZTVi83T1Vod1FRa29IRHlEL3p2MEdHdnJpMHBONHVO?=
 =?utf-8?B?eko1MXRVNys4aitMdFpVVjlqRWJiZ096b2JkSkhla1BXUHVYclU1UkF2bmE0?=
 =?utf-8?B?QTAwOHNOYk1BcGVzRTQ4N29wdGQrSUN4SU5sd0hVd0thYlhHZjRGSVc3Smd0?=
 =?utf-8?B?ZjN6UlYzcWIvSHVtNXozOGNSTHNVS21oemVFbmRnSXY3b3N6ckZHYjNRelU2?=
 =?utf-8?B?ZlVyNk5pVnBQcktWNE9xQjBzdEM1bkpHb2RoWFJ5TUkwZStudDFoNWo1ZVA2?=
 =?utf-8?B?Qm03eXJMTCtYQmxUUG9BS0ZtZ2MxSzVVejhjbFB1SDU1b3AraW5YUDAzNThh?=
 =?utf-8?B?bU96bEx6cW9kTGF0U0tORGhWOTNUK01GZ2xMNFlIVy9SczdYWVdudW9Rb1du?=
 =?utf-8?B?Sk16SmxlcjM2dHZoVXo4TTZJVjBNM3IrU0VvNXFzYWVReFl5SUhZc3BxV0Zl?=
 =?utf-8?B?MlRjK1hISG1DU1pLTFBlY1ZVb21BcjJGa2dWZXRZb2tkYnFNY1RGamdOM1VB?=
 =?utf-8?B?VzJUMHV3RDk0NnRVbEUySzllVW1jcmxvMEtOcjUwSFJweExLT28wdE51Q08w?=
 =?utf-8?B?S0VKVmtEdWppT2x3dUFUY0tTNG5yeFVvclFLbzl6QjAzN0pnbUJMd2J6aFhp?=
 =?utf-8?B?c2xkV3hpdUx4clkvZFBjTmdtcU5ra0ZTd1Fyd21KMDlDczNVWjB1ZHdzbTVi?=
 =?utf-8?B?eFBJS2xLWG50aWUyZDBFUHNSZ2VoNjg3ZVVJZWIzL3VWS2JNeStZL0dHZEpT?=
 =?utf-8?B?bWk0bjc4ZFFvWGZBV2RWdGVwbHRJU0hvTWEwVFRzQTc3N3dkYU9zbkdsdXEy?=
 =?utf-8?B?K2Y3M3pmak02YTBpbFRFdTVrWUhvOUdCd3BwaE1LYTFFWS9kQVdCSU1nbGxa?=
 =?utf-8?B?Z2ZBd0tnN2RZMXNGMFdPZEpaUVoxWlFNdTg1b0ZXZ1YwZ2w1TGNXc0pXVi9Z?=
 =?utf-8?B?RStWVXdIaWVmbVVHazNaSy9RZ3ZyaWZNS2hHT242Z0k3UzVhcDAwRWJUbmZP?=
 =?utf-8?B?M0VyTlpCY0J5QWc1WXpKeCsvZGFJUXVVWmlEa3JqS2RuaWE3Yng4elpSTEdi?=
 =?utf-8?B?NU80YVRJVjhNRkV3Rkc2dnZxRXhtRlZqYnM2YWJLT3dKc0EwWnNOcnNpMitV?=
 =?utf-8?Q?xIbtpkbYorbZUnUQghstredCidaCUxbtn8snoF4s5K9g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995fb296-d6d3-4c31-d184-08dd2347f4f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2024 11:50:11.5541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eUrGY7UbY1grHNw1o/BBxqn7Hm/y/mDN/u/2cS47F2fJzOX+iL1x1KsX6JNfCi/iecFCDGmd4KLAofBsXCfJMm3pTCKHpp1VTKtPYKv637g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7614
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 02 Jan 2025 04:15:35 +0000
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

SGksDQogDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MjczNC8t
IFJlLXJlcG9ydGVkLg0KIA0KWGUuQ0kuRnVsbCAtIEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgY2Fu
bm90IGJlIHJlLXJlcG9ydGVkLg0KaTkxNS5DSS5GdWxsIC0gUmUtcmVwb3J0ZWQuDQogDQpUaGFu
a3MsDQpSYXZhbGkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2kt
aW5mcmEgPGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZiBTZWJhc3RpYW4gQnJ6ZXppbmthDQpTZW50OiAyMCBEZWNlbWJlciAyMDI0IDE2OjA2
DQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBpOTE1LWNpLWluZnJhQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1
cmUgZm9yIHRlc3RzL2ludGVsL2dlbV9leGVjX2JhbGFuY2VyOiBEZWNyZWFzZSByZXF1aXJlZCBs
b2FkIGluIGBmdWxsYCB0ZXN0DQoNCk9uIDIwMjQtMTItMTkgYXQgMDc6NTk6NTggKzAwMDAsIFBh
dGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogdGVz
dHMvaW50ZWwvZ2VtX2V4ZWNfYmFsYW5jZXI6IERlY3JlYXNlIHJlcXVpcmVkIGxvYWQgaW4gYGZ1
bGxgIHRlc3QNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2Vy
aWVzLzE0MjczNC8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0K
PiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIENJX0RSTV8xNTg2NV9mdWxsIC0+IElHVFBXXzEy
MzM4X2Z1bGwgDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAqKkZBSUxVUkUqKg0K
PiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJR1RQV18xMjMzOF9m
dWxsIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0K
PiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8g
d2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gSUdUUFdfMTIzMzhfZnVsbCwgcGxl
YXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9k
ZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiANCj4gICBFeHRl
cm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lH
VFBXXzEyMzM4L2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDExIC0+IDEx
KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgTm8gY2hhbmdlcyBp
biBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0
IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18xMjMzOF9mdWxsOg0KPiANCj4gIyMj
IElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+
IA0KPiAgICogaWd0QGdlbV9laW9AaW4tZmxpZ2h0LXN1c3BlbmQ6DQo+ICAgICAtIHNoYXJkLWds
azogICAgICAgICAgTk9UUlVOIC0+IFtJTkNPTVBMRVRFXVsxXQ0KPiAgICBbMV06IA0KPiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyMzM4L3NoYXJkLWds
azIvaWd0QGdlDQo+IG1fZWlvQGluLWZsaWdodC1zdXNwZW5kLmh0bWwNCj4gDQo+ICAgKiBpZ3RA
Z2VtX2V4ZWNfYmFsYW5jZXJAZnVsbC1sYXRlOg0KPiAgICAgLSBzaGFyZC1kZzI6ICAgICAgICAg
IFtQQVNTXVsyXSAtPiBbRkFJTF1bM10NCj4gICAgWzJdOiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNTg2NS9zaGFyZC1kZzItMS9pZ3RAZ2VtX2V4ZWNf
YmFsYW5jZXJAZnVsbC1sYXRlLmh0bWwNCj4gICAgWzNdOiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyMzM4L3NoYXJkLWRnMi02L2lndEBnZW1fZXhlY19i
YWxhbmNlckBmdWxsLWxhdGUuaHRtbA0KPiAgICAgLSBzaGFyZC1kZzE6ICAgICAgICAgIFtQQVNT
XVs0XSAtPiBbRkFJTF1bNV0NCj4gICAgWzRdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0NJX0RSTV8xNTg2NS9zaGFyZC1kZzEtMTcvaWd0QGdlbV9leGVjX2JhbGFu
Y2VyQGZ1bGwtbGF0ZS5odG1sDQo+ICAgIFs1XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIzMzgvc2hhcmQtZGcxLTE3L2lndEANCj4gZ2VtX2V4
ZWNfYmFsYW5jZXJAZnVsbC1sYXRlLmh0bWwNCj4gDQo+ICAgKiBpZ3RAZ2VtX2V4ZWNfc2NoZWR1
bGVAd2lkZToNCj4gICAgIC0gc2hhcmQtdGdsdTogICAgICAgICBbUEFTU11bNl0gLT4gW0lOQ09N
UExFVEVdWzddICsxIG90aGVyIHRlc3QgaW5jb21wbGV0ZQ0KPiAgICBbNl06IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE1ODY1L3NoYXJkLXRnbHUtNC9p
Z3RAZ2VtX2V4ZWNfc2NoZWR1bGVAd2lkZS5odG1sDQo+ICAgIFs3XTogDQo+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIzMzgvc2hhcmQtdGdsdS0yL2ln
dEANCj4gZ2VtX2V4ZWNfc2NoZWR1bGVAd2lkZS5odG1sDQo+IA0KPiAgICogaWd0QGdlbV90aWxl
ZF9zd2FwcGluZ0Bub24tdGhyZWFkZWQ6DQo+ICAgICAtIHNoYXJkLXRnbHU6ICAgICAgICAgTk9U
UlVOIC0+IFtGQUlMXVs4XQ0KPiAgICBbOF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyMzM4L3NoYXJkLXRnbHUtMy9pZ3RADQo+IGdlbV90aWxl
ZF9zd2FwcGluZ0Bub24tdGhyZWFkZWQuaHRtbA0KPiANCj4gICAqIGlndEBpOTE1X3BtX3JwbUBk
ZWJ1Z2ZzLWZvcmNld2FrZS11c2VyOg0KPiAgICAgLSBzaGFyZC1ya2w6ICAgICAgICAgIE5PVFJV
TiAtPiBbU0tJUF1bOV0gKzEgb3RoZXIgdGVzdCBza2lwDQo+ICAgIFs5XTogDQo+IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIzMzgvc2hhcmQtcmtsLTQv
aWd0QGkNCj4gOTE1X3BtX3JwbUBkZWJ1Z2ZzLWZvcmNld2FrZS11c2VyLmh0bWwNCj4gDQo+ICAg
DQoNClRoZXNlIGFyZSBub3QgcmVsYXRlZCB0byBteSBjaGFuZ2UsIFBsZWFzZSByZS1ydW4uDQpU
aGFuayB5b3UuDQoNCi0tDQpCZXN0IHJlZ2FyZHMsDQpTZWJhc3RpYW4gQnJ6ZXppbmthDQo=
