Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491A5E93817
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 05:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0AA10E142;
	Mon, 13 Apr 2026 05:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eekqFlWQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F26010E142
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 05:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776057226; x=1807593226;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=na1lEZoyG2tW52NDaffyMgE9IQMnPGTE+HQlZfNGPMA=;
 b=eekqFlWQWxFrYuWQg/DJ9OR5VY5v7M5a+5wTxp7dyIAmzYBxQILATPb4
 5SdOuyN5g/BwYX1dPvyzeIFuKM5eFe8NxaRbc0dtBv8sOkO9Do0j8lNCk
 EGV+UmjTCJiF0SrLEqTfm/TraeLUYkdwaxA9wAbLGjt8B2tSOEV8BqJQQ
 3IThPTFNBaW/hhR1oDiHTzjz8XyE4IrTJILIikCZ2wDLg15AJK9+AAXXd
 qiNfDm4ppP/H0TxhRjY7y4Pe71cA8MSFcIYVdbZxIBY1WRtkSmmvxQdgi
 YzI1CRJ9OmIwJdCIeQ06eq7zU+0U8FITNsZ9UQ/L2jEGG/7340JjOF3IM g==;
X-CSE-ConnectionGUID: of4aB3LrTMKch6Jrr4Hmlw==
X-CSE-MsgGUID: Z9FXM4gfRviLz92Q5eQpJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="94559543"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="94559543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 22:13:45 -0700
X-CSE-ConnectionGUID: 5L0YsmHIR5GuHIGfEw3e1Q==
X-CSE-MsgGUID: BPgNyeOuT6CqDZ+gSkrrxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="252869682"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 22:13:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 22:13:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 22:13:45 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 22:13:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmbfsZ3drqoTpa9hyQviiny0HqSdLouC6W2gGIcBbujaUsdh+rDvugrTuanNSU9qRLCbQ2IC4U2+gWQufZNcNYHKD9+pM9ngmkKicYJpd189IcFcRayVErP5DjjBDNUIlo/z5u9I96JvuI7J+vZpzOeNWGEBDj58OzkbEvCKHzLwbTJC+mbnrJgwRC1eSX4gT1R5MIW0jxY2G7lr2GpzcmxR9Q7bHr52VosdDn/96dsCYz4MHy6rrdhscYYs7XueY3yfRReuIcUJv0wPAzuCju+WABP5w73ZyzuG6HXnQnn40kBj4WmF1w5npqkDLShW7Eub+7MiuHI0taV/4KOItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=na1lEZoyG2tW52NDaffyMgE9IQMnPGTE+HQlZfNGPMA=;
 b=erQtPZKsdgCgYbxVUarOBDpFZfidAKHq6QL1X4U3KTAoOHMYszDoXvzBKZHe+EZbvUZpz9CRwzuQ2faIZRdgxosHB6mTwVd/hUk6cSbYn3Cn7k1E7fFo7Wng9qWiWNWBgbU/pA9b4pu20ryCPDyJ07C8Tv1bTECD1G96dEzEBrwfKXXwek2xAPDGJVQASCo/beOQIElreGKxEPVAYg0/z1KNV9IUU1G8v+6Mq3KWxLbCT3sS5LYmYnN37zFskSOfAFHS51AGjkJghc5fLVUnLU9RDPsw2e1Z95lVzLjyUSvbaKHfjn4o3nL/1Vup87vrnBGZsE8YVcG5kBygmR9rsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM6PR11MB4562.namprd11.prod.outlook.com
 (2603:10b6:5:2a8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Mon, 13 Apr
 2026 05:13:41 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9769.020; Mon, 13 Apr 2026
 05:13:41 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/7] tests/intel/kms_mst_helper: Add kernel-doc for
 existing function
Thread-Topic: [PATCH i-g-t 1/7] tests/intel/kms_mst_helper: Add kernel-doc for
 existing function
Thread-Index: AQHcwe6kf2VXGlNnuki0W0pAJiHH57XLJgrggA1KDYCABBGksA==
Date: Mon, 13 Apr 2026 05:13:41 +0000
Message-ID: <DM3PPF208195D8D300FE929678F484983B7E3242@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
 <20260401160627.1338526-2-kunal1.joshi@intel.com>
 <DM3PPF208195D8D55ECFE3FCDB212EB2C8AE351A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <20260410145449.7hehy6g6ecilfmx4@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260410145449.7hehy6g6ecilfmx4@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM6PR11MB4562:EE_
x-ms-office365-filtering-correlation-id: 3af49678-07bc-4beb-b667-08de991b6d93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: XCpx+aZPYkWFfwXAayIRD1O5yjKAKrBPNMe535Kza+xLpLc+M8J6xQ7iZddWUpbyUNkT9dUFCTKgNMfztP+cFnbLPFKNFmkTC6P0UClH7dguSsLQ6ZzvXl+TWaCFUIFyjPPKud2fHXfaj4KhNnV5kPz7olw1Eu9Z0fuGrlm6f/hn0Wg9R1euW+pMp7c9e6vDzEr5eWD1DWIvtwMzzuvIVabu4QChB9pl5TfSl6mLKnA4C+rpMkNJgyMkA8i3mQgFNgxoy3kDKXpOs7uv71AbmL6BI2fLmJDcgB2EEa0s6j6fd3fFfmiAR2M4kFSDLuS0jU1xE6XZaRiK1cmLM/xKvXq2wbr7DZpZv+9z5fZcaf3rDXdJ0lUtsWH39yMvUJuk4D2A/MIdDEKWF+f1rJgNgI1aUC+Hw/4T2yFtNXy3jy/tbpVYsqCgMdATJgmZGMZMIIwaEHzBSCsOBP/ooVWXHdSmGDB1W5tdmyCq+UNbBl3fZ/kxiu+6Ja8SfiNi0XqmD4W4Bku/rNAQ4ruLYhCbkTfJRlohqX4vG0xHm1HWboy06+Lx6zmEplgUcW67ZzrF6G8Tob0JcZ7CayYhr1xfunVCxrwE1UpRnEB/oEHU1drZ8fhTHPFs5KJIEkY5WSgoKdhoP4giL4WUFFrd8VOf9KhhGcKfk/MqDLfcyLH9FT5TRwBKrZXbOfqJn8qprsvLgDRbEQkWoeJ2qVyL0kuE1XBHgZrBqPLBKb0H+Vg9baNQeuU7jpFkl5PqzeEdST6NMJbbHVImpM5fgZFdvWtGsI7VVPwXEWBA8/Hip/VoDxg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlNib2ZCd1QyaStDVnM2dHZDbytMNjJWaFg1eGVLdHdwV2dtZy9jNDE0TmN1?=
 =?utf-8?B?MFFXdkluaVArSlA5Zksyc1hqTEpkeG90TXg3OEw0eUhhNjk5bFNFcFRrRzFS?=
 =?utf-8?B?dDMrSE5NVytGUmloMmhpSUlOZ0N1R2prVk44c3BrQWlsOHV0NUM5T3JoL1Rl?=
 =?utf-8?B?NmlNSmxERW8wNDI5YXZESExWRHN2WVFnY2VsRkZyTTUyUGE1NFcwbkNKSzVu?=
 =?utf-8?B?a2VLRUZLaHArQjlYZDdGejhLU013YVduK2JDSUVLWVF6a3dUdmRZNzduYVZn?=
 =?utf-8?B?YVNhTnA2WCtTN0VrY21sOWRVbmZPYzZNbWJQQldMaDl5V2ZDQUFYN3dxd0pa?=
 =?utf-8?B?Z0RCbGx1ZnR0TlUwTmFVRDdwTm9KcjladjNNci9pYVRmRE8rZzNqd2NQWW1P?=
 =?utf-8?B?djVaWnNaZDMybXlueGFTb0hybDM0NjZpMHl2WVZXMVNVMFQzTzNhdVZIcmtD?=
 =?utf-8?B?RzFpQlhTODV3d1lpTThUa0FlVTI5VnFCRXBHM1hTUXI0Y0xDNEY2SmxvRFJE?=
 =?utf-8?B?VUt0dzUxbVlwcGRCVklwcTNUNXhreUVXT0s4cmFFY2JabUJTcWZmQ2lPclEx?=
 =?utf-8?B?SVlQbXMrSEh3WGsyQ0hiODU2SlNqQXFmaXp1WDFuekZ4bEU2RWk3V0hUNVRv?=
 =?utf-8?B?dzRTNk9uM0pWZ1VPdFZvTGFHc0d0bEZ0aFI1b2NNQ2U3R04wVWZSVURKeUla?=
 =?utf-8?B?ekpLVkFFek1LcFI2ZERyQVl4dG1yaGJBdnhUZ1VXWWUxQlhob1JnajRCaWVO?=
 =?utf-8?B?bkpyemhPSHp1RWpZMEZ0M0tIclQvSjB3aTBOMm40U3g1Lzh3MENPcjdSSDNI?=
 =?utf-8?B?NTVhK1VNaldyUnBodzVRVnFIemJua1hmdUJoVzZjb0JXcTNGTkt3N2JoR2Q3?=
 =?utf-8?B?WnlXRzBuZzFZcDRYN25PcDhXcjdoY2dZZmhYb0NrQ0ZIM3lDZG1OSFVvMFQw?=
 =?utf-8?B?eVM2T3cxTFRoZGEwc1crTW9pS0J4cHhPcjNnQVQrODJyN2NQTWJha25UaE16?=
 =?utf-8?B?T1ZrQnJYSWtFZXMrMEVwTUJ4UmhnYlA0V0lpdXMrMEpabnNPTDlBOXdHbFor?=
 =?utf-8?B?alFtU1JMWlRyR1IvVG1OTzNKN1lUdG5SbjM2MVBOZUVXVGZvYTJqMUdmQnBs?=
 =?utf-8?B?SE5yRWx2LzlZaHNGY0ExekUyNzRUVG15ZmpTYjlHSkl6a1ZuanMzdnZlSklx?=
 =?utf-8?B?OVByTHhsQkZ1cTFCanM2L1ZkdFNaSzBTT3N1QlBDYi83UEVIYzBjNG85RVVY?=
 =?utf-8?B?T3ppeFVDRDE0N1k5VDNIdkpBVXJCbHduZmVQT0tWUUdyQzRuQms5RGlGQnhk?=
 =?utf-8?B?am00Y0FlS2VtMjByOXZmUkVKUlRYR01FaVRpbzVKeHNQMUF4UVRZNU5QbDVS?=
 =?utf-8?B?UVNJYkltUk84d2w4QjZHeTljU0VFd0Q3STBQdDN0Yit5Ui9Ob1B1aXdJdS9r?=
 =?utf-8?B?aHp3c291dnhVbjlwUm9aQi9mUlp5UndsTEttWjVUZjZIRHdzT0VoTk1uYXND?=
 =?utf-8?B?U2ttZDZ2NVI2dG5kY2JPcEEyWE5MOE4zcHFTaDZnQ3VzYUFhdzBzM3lBZEs3?=
 =?utf-8?B?QXBNMWwwZkNBSXAxbUMydkxwdzRKM0ZnZ05qQW52SFg3cmpjbFI3b0hLRE5Y?=
 =?utf-8?B?TGZJZHQrb3JSQk9PSEtqTWNWb1ptM2JkQ0F3eEVtVzZRSGpKNS9EWmtXWFVu?=
 =?utf-8?B?VytQZWwwRER4eXJhYUswK1hxN0ZhdTYzUmZmTXVML29xSnJaQThJdXhPSW9y?=
 =?utf-8?B?dkxyTlo1bFZtM2Njb2J4bkNCbmRsOW5vVGI2dkNJZ292NTlsanNoTkpNVFJy?=
 =?utf-8?B?akIyTDErTGROVWoxbFUxdlFRUkdTYkdwOG1IL1hJMTF0NmUzb3JJRXg2SHZs?=
 =?utf-8?B?eU5oSGcwR1drdGRqSkhDSWQrNzk2TkE2UDdqSVFqTm9TVTNrVVNGT2lGYWd2?=
 =?utf-8?B?MVhDeFRsTjI1cTZ3UXdTMHhVQlJvV3VEcVQrL3c0NHEzN1FIYjJnMmFQK3B1?=
 =?utf-8?B?VkhIUTNLQU5jaStybEFYYlArVHY5WUVxR284VCtDMWNIMzBwcHBmQVJxV09S?=
 =?utf-8?B?ZDBlMUVUQ0drYVJxdXJld0x0dktvVTFpNW1GR3pPeTRkQkFYTm9MZjVnL09K?=
 =?utf-8?B?RUxwQ01VUXlLYUlFZlVselh5T0RNU1RYVEJzNlpHZHlDV21IVm40WGVsUXZy?=
 =?utf-8?B?Uit5S0Y5dlo1UU1jUUVETzZBbkpRZm0xQlZaSG4zaUFUdUVjcGxXQjJWdVU0?=
 =?utf-8?B?QjJ5cWJCREg1bGVHWmZ6eEtjaEI2MFFFcTZUMVFMNk00cFhxcGNHS1grWWFK?=
 =?utf-8?B?NXRhL3Rnbm1qc0lPelB5QmJTREYvNDNzc0JFeGVaNkhtd3h3cXV3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RuKwCXkfR5ypmwVrmLLcxFOddhDDH2SaD5GuNIKYbnQbnHGXU5zJKUmfcVD1Dti5DOtjF4tNbfa3i2OAxUz4LkCdBOIF/5Dev0fslo6eMH75FGDtyFdkOLDgqDkRgxgcmsOBNu8PcAyNQRJUmFgc6x9BkxoY8XQNfR7gUF2o3WMl+N/ZwA8U7JYVt/2oxnPD7FxSQenBgEZYODUuAI8HxWI0wWiBvYLb1T8IS6xjQpIcnwyqyc87XyYwIeXcJMep5saxSg6YNEZZFDkLNhzxYwww5q5Imw6zWj7Z+mLBCmgFb1Ilx8RZCN98bD3VkBsKwumMiDnq3rTiBzK6EKVbXw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af49678-07bc-4beb-b667-08de991b6d93
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 05:13:41.4322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BP8agwhVo219wTTGMJVUBgJSRna4Qkofxdpvf/G7yrdcULrcluX9Je8FPW9/4VQpJzMBNJlyLlLN0uBEdqYLAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4562
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

PiA+ID4gQ29udmVydCB0aGUgZG9jIGNvbW1lbnQgb24gaWd0X2ZpbmRfYWxsX21zdF9vdXRwdXRf
aW5fdG9wb2xvZ3kNCj4gPiA+IHRvIHByb3BlciBrZXJuZWwtZG9jLg0KPiANCj4gTWF5YmUgd3Jv
dGUgJ3Byb3BlciBJR1QgZG9jLicNCj4gDQo+IEFkZCBhbHNvIGEgbm90ZSBhYm91dCBhIHR5cG8g
Zml4Lg0KPiANCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLdW5hbCBKb3NoaSA8a3VuYWwx
Lmpvc2hpQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIHRlc3RzL2ludGVsL2ttc19tc3Rf
aGVscGVyLmMgfCA1ICsrKy0tDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwv
a21zX21zdF9oZWxwZXIuYw0KPiA+ID4gYi90ZXN0cy9pbnRlbC9rbXNfbXN0X2hlbHBlci5jIGlu
ZGV4IGFlZjc0Y2QzMS4uMzg4NTljZmZjIDEwMDY0NA0KPiA+ID4gLS0tIGEvdGVzdHMvaW50ZWwv
a21zX21zdF9oZWxwZXIuYw0KPiA+ID4gKysrIGIvdGVzdHMvaW50ZWwva21zX21zdF9oZWxwZXIu
Yw0KPiA+ID4gQEAgLTUsMTEgKzUsMTIgQEANCj4gPiA+DQo+ID4gPiAgI2luY2x1ZGUgImttc19t
c3RfaGVscGVyLmgiDQo+ID4gPg0KPiA+ID4gLS8qDQo+ID4gPiArLyoqDQo+ID4gPiArICogaWd0
X2ZpbmRfYWxsX21zdF9vdXRwdXRfaW5fdG9wb2xvZ3k6DQo+ID4gPiAgICogQGRybV9mZDogRFJN
IGZpbGUgZGVzY3JpcHRvcg0KPiA+ID4gICAqIEBkaXNwbGF5OiBwb2ludGVyIHRvICNpZ3RfZGlz
cGxheV90IHN0cnVjdHVyZQ0KPiA+ID4gICAqIEBvdXRwdXQ6IHRhcmdldCBvdXRwdXQNCj4gPiA+
IC0gKiBAbXN0X291dHB1dHM6IGZpbGxlZCB3aXRoIG1zdCBvdXRwdXQgb2Ygc2FtZSB0b3Bsb2d5
IGFzIEBvdXRwdXQNCj4gPiA+ICsgKiBAbXN0X291dHB1dHM6IGZpbGxlZCB3aXRoIG1zdCBvdXRw
dXQgb2Ygc2FtZSB0b3BvbG9neSBhcyBAb3V0cHV0DQo+ID4gPiAgICogQG51bV9tc3Rfb3V0cHV0
czogZmlsbGVkIHdpdGggY291bnQgb2YgbXN0IG91dHB1dHMgZm91bmQgaW4gdG9wb2xvZ3kNCj4g
PiA+ICAgKg0KPiA+ID4gICAqIEl0ZXJhdGVzIG92ZXIgYWxsIGNvbm5lY3RlZCBvdXRwdXRzIGFu
ZCBhZGRzIGVhY2ggRFAgTVNUDQo+ID4NCj4gPiBDYW4gd2UgaGF2ZSB0aGUgZm9sbG93aW5nIHdh
eSBvZiBkb2N1bWVudGluZyBmdW5jdGlvbnM/IFRoaXMgaXMgd2hhdA0KPiA+IHdlIGRvIGluIGtl
cm5lbA0KPiA+IGlndF9maW5kX2FsbF9tc3Rfb3V0cHV0X2luX3RvcG9sb2d5KCkgLSBGaW5kIGFs
bCBNU1Qgb3V0cHV0cw0KPiANCj4gSSBkbyBub3Qga25vdyBpZiB0aGF0IGlzIHBvc3NpYmxlIHdp
dGhvdXQgYnJlYWtpbmcgYWxyZWFkeSBleGl0aW5nIElHVA0KPiBkb2N1bWVudGF0aW9uLg0KPiAr
Y2MgZmV3IG1vcmUgS01TIGRldnMgYW5kIFBhd2VsDQo+IA0KPiBDYzogSnVoYS1QZWtrYSBIZWlr
a2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gQ2M6IEp1aGEtUGVra2EgSGVp
a2tpbGEgPGp1aGEtcGVra2EuaGVpa2tpbGFAaW50ZWwuY29tPg0KPiBDYzogS2FydGhpayBCIFMg
PGthcnRoaWsuYi5zQGludGVsLmNvbT4NCj4gQ2M6IFBhd2VsIFNpa29yYSA8cGF3ZWwuc2lrb3Jh
QGludGVsLmNvbT4NCj4gQ2M6IFN3YXRpIFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiA+IGFyZ3VtZW50cyBsaWtlIHlvdSBoYXZlIGRvbmUgYWJvdmUNCj4gPiBEZXNjcmlw
dGlvbiBvZiBmdW5jdGlvbiBsaWtlIHlvdSBoYXZlIGFscmVhZHkgZG9uZQ0KPiA+DQo+ID4gUmVz
dCBMb29rcyBnb29kDQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IFN1cmFqIEthbmRwYWwNCj4gPg0K
PiANCj4gRm9ybWF0IGhlcmUgaXMgd2hhdCB3ZSBjdXJyZW50bHkgdXNlIGluIG90aGVyIElHVCBw
YXJ0cywgc2VlIGZvciBleGFtcGxlDQo+IGxpYi9pZ3RfYWxzYS5jIHNvIHdpdGggY29tbWl0IGRl
c2NyaXB0aW9uIGZpeGVkDQoNCkkgaGF2ZSBubyBwcm9ibGVtIHdpdGggdGhlIGZvcm1hdCBidXQg
YSBsb3Qgb2YgcGxhY2VzIGhhdmUgZGVzY3JpYmVkIGNvbW1lbnRzIGZvciB0aGUgdmVyeSBkaWZm
ZXJlbnRseQ0KRm9yIGV4YW1wbGUNCkluIGxpYi9pZ3RfY29yZS5jDQpJbiB0aGUgc2FtZSBmaWxl
IHdlIGhhdmUgZnVuY3Rpb25zIG5vdCBmb2xsb3dpbmcgdGhlIHNhbWUgZG9jdW1lbnRhdGlvbiBm
b3JtYXRzIHdoaWNoIGFscmVhZHkgYnJlYWtzIGRvY3VtZW50YXRpb24NCkNoZWNrIDogaWd0X3N5
c3RlbV9xdWlldCwgaWd0X21lYXN1cmVkX3VzbGVlcA0KT3IgZXZlbiBrbXNfbXN0X2hlbHBlci5j
IGl0c2VsZiBpbiB3aGljaCBib3RoIHRoZSBjdXJyZW50IGZ1bmN0aW9ucyAgZGVmaW5lZCBkb24n
dCBmb2xsb3cgdGhlIGRvY3VtZW50YXRpb24gaW4gaWd0X2Fsc2EuYw0KDQpUaGVyZSBhcmUgdG9v
IG1hbnkgcGxhY2VzIHRoYXQgZW5kIHVwIGJyZWFraW5nIHRoaXMgZm9ybWF0Lg0KU29tZW9uZSBu
ZWVkcyB0byBmaXggYSBsb3Qgb2YgdGhlc2UgcGxhY2VzLg0KT3RoZXJ3aXNlIHJldmlld2VycyB3
b250IGtub3cgd2hpY2ggaXMgdGhlIGNvcnJlY3Qgb25lIGFuZCB3b250IGJlIGFibGUgdG8gYWRk
IGEgY29tbWVudCByZWdhcmRpbmcgdGhpcyBsZXR0aW5nIG1vcmUgd3JvbmcgZG9jdW1lbnRhdGlv
biBzbmVhayBpbiBpbnRvIHRoZSBjb2RlLg0KQWxzbyBpZiB0aGUgb25lIHdyaXRpbmcgdGhlIGNv
ZGUgcmVmZXJzIHRvIHRoZSB3cm9uZyBkb2N1bWVudGF0aW9uIHRoZXkgd2lsbCBjb250aW51ZSB0
aGlzIGN5Y2xlLg0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+IA0KPiBSZXZpZXdlZC1i
eTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiAN
Cj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4gPiAtLQ0KPiA+ID4gMi4yNS4xDQo+ID4NCg==
