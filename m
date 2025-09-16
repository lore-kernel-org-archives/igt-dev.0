Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9F7CAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 08:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B8D10E301;
	Tue, 16 Sep 2025 08:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rllz7Pfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF71410E301
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758009804; x=1789545804;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KaZdKuVkt3rJW+fDR0TnHrrCoX3y8KVVVHassy/sQBk=;
 b=Rllz7PflLJVphkthpcuhCxD/8NjynijJDCdak8/QqrVSFUzDXJ1t1bPi
 j6itZfZDcHjtGQ7y7y4nqaAdnaLS5yu6ym1dNCfdGepcdHz0Y3AiPUVgt
 ytRxQSoWTtvMNLNl2GhBBpAvXVqhH8DiUHdts7g6eZ2qO85JqX9w6QP6i
 5ydxv8avVnnnYcXHUSkTM2z9l09iO12ImAxK2MUY1PqGMk1Q2YHHNPlbn
 tSVLew11ywfSTVSUVF3/yM8egy5bNeMvZawwgNYYEbeue5i8UbM/bziQi
 R66app1pw9FzoWMOoOpbrFAH3Bjcb4RndNBjDvg7Wza1P+V96FLeUxvDo w==;
X-CSE-ConnectionGUID: 9hxHaEN8QOaABBvbEv5pLw==
X-CSE-MsgGUID: 2REE91YWQ9evHXpYKb02eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="85718547"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="85718547"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:03:12 -0700
X-CSE-ConnectionGUID: VpynUgTNQ/qSkxjlXE1pEg==
X-CSE-MsgGUID: JDY7L9U7SZOxAkAkEgFEXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="180119015"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:03:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 01:03:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 01:03:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 01:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTlF0+kv6U2uJlo35WJeQOFawsE9AwGZMfqyiob7udDiW9DnS+xHrQwWK70DsvPPhUW8FBImwgqNE1Ren5mvus7BLQ7sFrK8cjt55AgMEpeMjwASXra5m3GBaIfwDl9Rjq/J4jkmE3k16pzDoYD8VjfL8JPNeEdWq4vbQAWLx5QMVW7CIt4wVjmX2GFKjJU9mPw8hAqV1IZ8GymG/FbuppIXejQlg7xKm+5tSGJQLyiwMBeOQfSbl6FnADhnGzBiHA3DV+VbXTcS8+dTlNpuB7QVcpA+B6shB+11JpsSKwZpXWlkieU6zBQjz2z/JtjC0NI1xl3DI8K/UzxzX60yHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaZdKuVkt3rJW+fDR0TnHrrCoX3y8KVVVHassy/sQBk=;
 b=UtD3LKQKzRj6uHv9QzSQe5Uo/+XrUl0rIdRD6rdi6YEyueRrx/dwQdLdYFQPNkI9yDHzWZ33bP9WvPXpmL3DcKGD6Bqjx1Jf3ak5mFrM4/XKvqrrGo1y0/GVXSZ34BfBSoc7EQhn1Y+P9Bfuu4YDMPYZta/M/bqDED+BnDo33oT9nTsw0czCWM5XjQliLNa0Y8rwSXJs/gdIsJ5d40Haj7LwQVNZis7xVBreVQEUHKOm0vproLksLLSorjPv/xkCiuH5M0miRc6BmBkXhjnOoPqR/sR5c79bnE4Ihc9uCFMCn/N64OlZ0f09so0amUTQIq6ggPnHSVxSKeRPDvQRTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 08:03:08 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 08:03:08 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Reddy
 Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/kms_fbc_dirty_rect: Limit to
 single pipe on simulation
Thread-Topic: [PATCH i-g-t v2 1/2] tests/intel/kms_fbc_dirty_rect: Limit to
 single pipe on simulation
Thread-Index: AQHcJr9iDCt/BJLOvEmLRghF8+wyUbSVcysA
Date: Tue, 16 Sep 2025 08:03:08 +0000
Message-ID: <4e06515376206b6257524619027bf91cba77ebd5.camel@intel.com>
References: <20250916040455.267648-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250916040455.267648-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|CH0PR11MB5219:EE_
x-ms-office365-filtering-correlation-id: 13019a06-3d81-4e5f-0479-08ddf4f77959
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NnlRK2VYcHh5VlFuWU9ZTG1LRVM2OVVmQUxsdEZ5b1ZvN2p1NkJ4aXRUTWpm?=
 =?utf-8?B?NE1ic2RnUmozTkhWQ2pncGxyaVRhRWNxQnJOUnZtQU5yL2padWZhZjJ0WDhS?=
 =?utf-8?B?MndMdlc5SlBVRlJXZWROOWtZcTFRVEdPZGwxV0wzQjlZVWpyL284YzhBK1li?=
 =?utf-8?B?TjhFalRKZlNVNzhmNTI3MmZ3MUpzY1VsUm8zdlRac0NkTmVVRjUyM3dka01i?=
 =?utf-8?B?S3ZqMkZkblpyemJEMndDSk80RjNXN1gzdnFXbVZGT0YrUmlCclZwaHBEcmts?=
 =?utf-8?B?M2x0VHFxblcxZHBRZkFwUFY5UzlYMDFqdVE3aktkK3JXbDNUamFXMWN6d0JG?=
 =?utf-8?B?UE5lL2JDK1IxaDQzWmRMbVExMENCMkxRZVJET050UjFMSHhyT0ZrRmh3ZTZ4?=
 =?utf-8?B?WFlKYm5Pa1A3bUFZWm5DSVFwSHZyWUpuZVphL2tYampRNEFoZUR3clZHQ3Rm?=
 =?utf-8?B?ZGdvV3plNm52Z1N5bU5mdDFFMFVNbWhtWHVNNGZ6VzlhNUlIVXhobDNKS0Zi?=
 =?utf-8?B?Q3lZTHRTNkMyYWhUa0lyUDk5UTFoNDFwN3lFTkdLL2kwQVpMQlZnTFBKRTZX?=
 =?utf-8?B?Nm9LYVFnVjRWM01kdnhCNlNEOGZJbjBBYnkzSFN4VmN2MUdPK0RMWFBhVmNn?=
 =?utf-8?B?R2g2dU5rVmI1M1FidHM0YUk0T3RacEZPeHorTk9FS2x2Z0NTaVVvc3UyUnUy?=
 =?utf-8?B?blpMVlRzZ2xYMjd3N05ZWEpBellINnJVSjk3YnpOQ3AwUmt2UkZDcGlaMU1i?=
 =?utf-8?B?aG9qZ29GQVZGbHh3enpIWnJpeEt5MnNBRXE2eE9iRjllK0orNm54dG9GTXZt?=
 =?utf-8?B?UVFxSE1ZaURRVHpQVlBncEFWZ2xSRzJ4bm1KQUU4aWZqbTQxRVdaUGNDZDJ5?=
 =?utf-8?B?NDNxRUxkWkY1U3hkK0pqSzVEbW1jOUZ2ZktaSW9tRmpjV3ZRZFc3OGNjZGxW?=
 =?utf-8?B?V2YzemxKOGw4UkxHSDM5S1M3bTZvaUE1NWhhRlRNN2tWK0tDZ0FxMitIcStY?=
 =?utf-8?B?cFJXVUhRa3BZSFJCOEQ4NjRzdUpocy9vQ0p0anFEQ2hMazJuaEF6QWwvc0JI?=
 =?utf-8?B?M2NpRGRGN2xzR1U4bWtrTTZjYU1kSFZDb01GeCtCRlFJYWkvMkhnOTZqbklY?=
 =?utf-8?B?bkZJWFVqSkJDN1RUSXVtWjRuMEd1MmFLZGptMnY5Z1FYbk96MnhDNE83RnNO?=
 =?utf-8?B?bHVONEhPWXBZbVgxdUEySEFEdTNWSVN3Q0U0R01mQ0Zqc0dLaWhTZ3FGU2JC?=
 =?utf-8?B?YkpwaVJaU3RQZys1a3ZnaVRnRElYK3NITExVaFh3Q0RINXE0NU9FRVlPb291?=
 =?utf-8?B?THg2Q0IyYmlMUzNqUmNwdXJsZXpGT2VlcUg0SFJHVm9EZDF0K0UxWXhTbFRk?=
 =?utf-8?B?SEhPRUp6TXRqOVh1SE5QczYzR042MkY4cEpaWlBpNmhEUlMxeXI2c1E1Q1p2?=
 =?utf-8?B?UDNuZEhwbmxiaU83SDhhTlNIVXdyRHk0cHpUelYzMWNGT0xqaUtGVFFlUGEv?=
 =?utf-8?B?blI4bTI5aDd6Q1ZOVmt6K213cmR3VHdKM1lKbzJMOXExVnJCd1g2dFdJcDBW?=
 =?utf-8?B?Z2NRUW95NTFkVjE2N1pKcmxCVkk1d2J4NFRqOXQ2dE1vZGtsaENtTEc4WGpL?=
 =?utf-8?B?bGVFcXhoaWNRSng5c2w0cmplcEZJZGJMaGYxQ29pa2VQN205RlM3Z08zRXZP?=
 =?utf-8?B?blRyYmx3bEZ1a1pFNjdwMGcydHh4dzlqa2dyT3FhYTFSNnoyN1Z2NlErNjBi?=
 =?utf-8?B?clNEUEtGakU0QTRraDdNSCsrMGNuWGJGcElQaGliOU11akNCc1crMGJCQjZD?=
 =?utf-8?B?TEdtNVFzUUNLUCt4a05za3VIT2w3eGtCT3g1TFlmdi9FeGFQWEYrbEN4NUI1?=
 =?utf-8?B?c0ZBUmlpWk9ESkRpVzVjM2tKaHQ5bnpZMzJqdks1WlBtZ1RiWUJuMnpEQzE3?=
 =?utf-8?B?b2tLeDhlYmpseG10YTd3dVhvQi9VUVBxa1BHZStQdThhY0kxY2JjTHRCZXF6?=
 =?utf-8?B?bjdVeTA2UFh3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWhDellobzlORlNQZmZjazd5NTYrT0R4TkdudmlZOXY0ZUJ4NTU3RXVSRHJQ?=
 =?utf-8?B?eTMwSjIydGtKNnNQZ21JZXdEaFVBNHBSSEJsYmJldnFHTXN0dTl1czNVRXgz?=
 =?utf-8?B?YTNyL1JDMHlPNVZKMTBWQXBiZ3lsNUs0VmxxUDg5REpVNlFvNlJObWVTdkpW?=
 =?utf-8?B?Zm1zTUdrQXhOczJvUFNKZFluMVZaTTRwNCtyU1VCTTVydGVpYlF4UnlyUHpD?=
 =?utf-8?B?RnIvT0Nob0VYWlR4VVBhSW1rWFlkRk9qSFpVWXQyY1pPcC9oWjdFVC81RDRL?=
 =?utf-8?B?SGJEL2ZGMmxwZjQydVZNdGZ5M3BUS3l0dkVPVkl2cXVWVFh4bndjUFQrOXh5?=
 =?utf-8?B?SlF6RDArc1hkWFlxMExrK0pMSVh1ZmlZSUJ6cHphQUwvdlliRk82S3A5WlY4?=
 =?utf-8?B?WERKNUorcExUSUEyNUtJdzJVUmZaSUp1Q2k4Q08yLytnUmNoMU9NbXV4cHd5?=
 =?utf-8?B?L2NlOGY2UUJSOTRjT2V0WkE3NEtlLzZUV3BSYXFoWHFmR3VwcE5jQTRjZmxq?=
 =?utf-8?B?U1BoSFJGOHlsb3krZWl5ZUhaMWJGUEZ4UkRCL1IrMXhLaGE2OXN4WC9zdjVC?=
 =?utf-8?B?dkNDallIaDM1ZjBFME13Uk5FNmhxcGxRRy82NXYvL254OCtZQXNLTG1xanU2?=
 =?utf-8?B?NXVleFJoSHZObXE4RFdoNmpQWFdCblB0L1FxZEI2SHhWMG1rVTNJem9lTnN6?=
 =?utf-8?B?VDF3dFhaWnZ0OGNTQklPMFZZRFdMSXBQNXB0WW9iWDJQdkRYd1R1V3NrZ2po?=
 =?utf-8?B?azE2NjloQlhwR0JhMkdQMkxYNGxPbVh2OUY2dFZHNXRGVitZdWFmMXVZY0NB?=
 =?utf-8?B?eU1Uc2p1dVZDamJkMlRJaUczblpPTFB4WEtVRmlNNllkdGJJVnp5R3g5TXdG?=
 =?utf-8?B?UU5oU0xlaEMrVFM4bmU1SzJjalgzbjBnOWpIZnU0UndyMVJVYUZ6MjN6M0I3?=
 =?utf-8?B?YmoxZC9qaTBUYWt5QklJWE5ORUFEYWxMT1d2cDBYZmFpM1BDbDg2cnVUd2FL?=
 =?utf-8?B?b216UnpVL1llQWdEbkxkWktHUExYWEd2NWF4N0lUS3dSVmZmdWJ6Zmw4Ujdj?=
 =?utf-8?B?VU9zT01GdldFcS9XZFZEbVJNdFZ5VUJTZTl5Mzh6MitqWGVWSUlYdXNDQUlq?=
 =?utf-8?B?Wk5HbWg1L3UxS3MvVFhiSUt1SFRJSHNBSVFOdnlkc1JyWXAvRi9tckVWdDhV?=
 =?utf-8?B?UUpHcHhPalM0YTZYYmVwcnNvcFBiKzlKcVJVRHdGQUlKWlgvNGNSOWgzd29z?=
 =?utf-8?B?S1JCSStSa0xBaldFa1d1aDREUytUd3pqMFZIWmpsYVFrY09qb1I4MjhMMGlw?=
 =?utf-8?B?NkhhSHlJVEhnYThjUWx0aFpqdGxaVUdDZ1ptQnJ6cW5VU1dvTlE2OFdEeEFK?=
 =?utf-8?B?TUFEUTgxemFxeUlTZW9rWTlpWkY2dTdkU01DemhaQ3B1WGZVU0E2bXI5OEhQ?=
 =?utf-8?B?bXYxS3FBRXdYZmpBbHVWNGt6bHg5SExnZEtMdCtUNzdDT1JKM0JJTmhyRUNI?=
 =?utf-8?B?SldCV2pZNUFJRTVxQVk3WjRXZXdFK0srUDNyQ0RsMGxoQVduVitLZ3ZxeTVS?=
 =?utf-8?B?QVphTDZiTmN5blJoUWZENmxrMkg2QktuQWdrQ3NDNFJMYkliRDB4OTdIc2pH?=
 =?utf-8?B?T3laR3lHMGZjc0czSWpOaHk5ZG03dzMyd09UL0NIOU9qdnRxRXdSZHFGVGZx?=
 =?utf-8?B?RXVqdU53Q1ZRL0lTTDI3SmFDL3pHN1Q0KzQ2bzZaWmw2dzJKQk5oaWxjREZ5?=
 =?utf-8?B?QTlIcElHMnNjb3JHV1Yzb0VvSHE4cG9EcWNXaEhwcUtYZmI4Y2VUa2lmOCtX?=
 =?utf-8?B?ZlV5c1R4Zm5xRFI1MVRad0NqZEUrNW80elZpMzBZRS96em41b0U0UTBENE1h?=
 =?utf-8?B?bXZ4bHhGT2Q1YVpEajZUQmhHRzhjbGtkRjErYTRhRXU4bTd3UlllZGNOT2tV?=
 =?utf-8?B?Ty9RRnJRc1dSbTZzNzFKbE81OFlVM1hGS2c4cjAwc2lmTWdCRHlFQ052c2Nt?=
 =?utf-8?B?L0RsL3JMcnB3emoxZXRvOUFqVkx5dXZtWlErcVVGYTEvcGdkYUF4a1dTWk5x?=
 =?utf-8?B?NFdPckQrVFp4R0s5YjhiRGxaUk9LVmFIbGFBZlAydFFOZmFGRGFxdmJ4SElC?=
 =?utf-8?B?ZHZqaWtPS2ZSMThadVFLV0JEL09QMDFiUGswVFNaTjFiZGVVWlF2Y1BZM1pj?=
 =?utf-8?Q?6htwzMSTtYFt8zFOnoX1Sv8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE7B912E0A141848B19B209F836AE28E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13019a06-3d81-4e5f-0479-08ddf4f77959
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 08:03:08.6147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DqiqtCj1WMnlqncwH3XhyYwTXm4v1EB9h8ANqbpZJg/W18wTvhpkXijidfRMKINJk4ODfFmRlrAjcJgnM6nHt8NYXF3r1E7nHB4hzpuYL6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
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

T24gVHVlLCAyMDI1LTA5LTE2IGF0IDA5OjM0ICswNTMwLCBTYW50aG9zaCBSZWRkeSBHdWRkYXRp
IHdyb3RlOg0KPiBMaW1pdCB0aGUgc3VidGVzdHMgdG8gZXhlY3V0ZSBvbmx5IG9uIHRoZSBmaXJz
dCB2YWxpZCBwaXBlL291dHB1dA0KPiBhcyBleGVjdXRpb24gaXMgc2xvdyBvbiBzaW11bGF0aW9u
IGVudmlyb25tZW50cy4NCj4gDQo+IFYyOiBSZWZhY3RvciBsb2dpYyB0byB1c2Ugc2luZ2xlX3Bp
cGUgYW5kIHNwbGl0IHBhdGNoKHZpbm9kKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2FudGhvc2gg
UmVkZHkgR3VkZGF0aSA8c2FudGhvc2gucmVkZHkuZ3VkZGF0aUBpbnRlbC5jb20+DQo+IC0tLQ0K
PiDCoHRlc3RzL2ludGVsL2ttc19mYmNfZGlydHlfcmVjdC5jIHwgMjIgKysrKysrKysrKysrKysr
KysrKystLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19mYmNfZGlydHlfcmVjdC5j
IGIvdGVzdHMvaW50ZWwva21zX2ZiY19kaXJ0eV9yZWN0LmMNCj4gaW5kZXggMDdkNjE2ZDkwLi5i
MTg3YTU5NDIgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19mYmNfZGlydHlfcmVjdC5j
DQo+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19mYmNfZGlydHlfcmVjdC5jDQo+IEBAIC03Myw2ICs3
Myw3IEBAIHR5cGVkZWYgc3RydWN0IHsNCj4gwqAJCUZFQVRVUkVfQ09VTlQgPSA4LA0KPiDCoAkJ
RkVBVFVSRV9ERUZBVUxUID0gOCwNCj4gwqAJfSBmZWF0dXJlOw0KPiArCWJvb2wgaXNfc2ltdWxh
dGlvbjsNCj4gwqB9IGRhdGFfdDsNCj4gwqANCj4gwqBzdGF0aWMgdm9pZCBzZXRfZGFtYWdlX2Ns
aXBfdyhzdHJ1Y3QgZHJtX21vZGVfcmVjdCAqZGFtYWdlLCBpbnQgeDEsIGludCB5MSwgaW50IHdp
ZHRoLCBpbnQNCj4gaGVpZ2h0KQ0KPiBAQCAtNDQ5LDEyICs0NTAsMTYgQEAgaWd0X21haW4NCj4g
wqAJCWlndF9kaXNwbGF5X3JlcXVpcmVfb3V0cHV0KCZkYXRhLmRpc3BsYXkpOw0KPiDCoAkJaWd0
X3JlcXVpcmVfZihpbnRlbF9kaXNwbGF5X3ZlcihpbnRlbF9nZXRfZHJtX2RldmlkKGRhdGEuZHJt
X2ZkKSkgPj0gMzAsDQo+IMKgCQkJwqDCoMKgwqDCoCAiRkJDIHdpdGggZGlydHkgcmVnaW9uIGlz
IG5vdCBzdXBwb3J0ZWRcbiIpOw0KPiArCQlkYXRhLmlzX3NpbXVsYXRpb24gPSBpZ3RfcnVuX2lu
X3NpbXVsYXRpb24oKTsNCj4gwqAJfQ0KPiDCoA0KPiDCoAlpZ3Rfc3VidGVzdF93aXRoX2R5bmFt
aWMoImZiYy1kaXJ0eS1yZWN0YW5nbGUtb3V0LXZpc2libGUtYXJlYSIpIHsNCj4gKwkJYm9vbCBz
aW5nbGVfcGlwZSA9IGZhbHNlOw0KPiDCoAkJZGF0YS5mZWF0dXJlID0gRkVBVFVSRV9GQkM7DQo+
IMKgDQo+IMKgCQlmb3JfZWFjaF9waXBlKCZkYXRhLmRpc3BsYXksIGRhdGEucGlwZSkgew0KPiAr
CQkJaWYgKGRhdGEuaXNfc2ltdWxhdGlvbiAmJiBzaW5nbGVfcGlwZSkNCkhpIFNhbnRob3NoLA0K
DQpJIHRoaW5rLCBkYXRhLmlzX3NpbXVsYXRpb24gY2hlY2sgaXMgcmVkdW5kYW50IGFuZCBJIGZl
ZWwgdGhpcyAiaWYgKHNpbmdsZV9waXBlKSIgaXMgc3VmZmljaWVudCAtDQpmb3IgdGhlIGJlbG93
IGNoYW5nZXMgYXMgd2VsbC4uDQoNCldpdGggdGhhdCwNCg0KUmV2aWV3ZWQtYnk6IFZpbm9kIEdv
dmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KDQo+ICsJCQkJYnJl
YWs7DQo+IMKgCQkJZm9yX2VhY2hfdmFsaWRfb3V0cHV0X29uX3BpcGUoJmRhdGEuZGlzcGxheSwg
ZGF0YS5waXBlLCBkYXRhLm91dHB1dCkgew0KPiDCoAkJCQlkYXRhLmZvcm1hdCA9IERSTV9GT1JN
QVRfWFJHQjg4ODg7DQo+IMKgDQo+IEBAIC00NjQsMTQgKzQ2OSwyMCBAQCBpZ3RfbWFpbg0KPiDC
oAkJCQkJZmJjX2RpcnR5X3JlY3RhbmdsZV90ZXN0KCZkYXRhLA0KPiDCoAkJCQkJCWZiY19kaXJ0
eV9yZWN0YW5nbGVfb3V0c2lkZV92aXNpYmxlX3JlZ2lvbik7DQo+IMKgCQkJCX0NCj4gKwkJCQlz
aW5nbGVfcGlwZSA9IGRhdGEuaXNfc2ltdWxhdGlvbjsNCj4gKwkJCQlpZiAoc2luZ2xlX3BpcGUp
DQo+ICsJCQkJCWJyZWFrOw0KPiDCoAkJCX0NCj4gwqAJCX0NCj4gwqAJfQ0KPiDCoA0KPiDCoAlp
Z3Rfc3VidGVzdF93aXRoX2R5bmFtaWMoImZiYy1kaXJ0eS1yZWN0YW5nbGUtZGlydHlmYi10ZXN0
cyIpIHsNCj4gKwkJYm9vbCBzaW5nbGVfcGlwZSA9IGZhbHNlOw0KPiDCoAkJZGF0YS5mZWF0dXJl
ID0gRkVBVFVSRV9GQkM7DQo+IMKgDQo+IMKgCQlmb3JfZWFjaF9waXBlKCZkYXRhLmRpc3BsYXks
IGRhdGEucGlwZSkgew0KPiArCQkJaWYgKGRhdGEuaXNfc2ltdWxhdGlvbiAmJiBzaW5nbGVfcGlw
ZSkNCj4gKwkJCQlicmVhazsNCj4gwqAJCQlmb3JfZWFjaF92YWxpZF9vdXRwdXRfb25fcGlwZSgm
ZGF0YS5kaXNwbGF5LCBkYXRhLnBpcGUsIGRhdGEub3V0cHV0KSB7DQo+IMKgCQkJCWRhdGEuZm9y
bWF0ID0gRFJNX0ZPUk1BVF9YUkdCODg4ODsNCj4gwqANCj4gQEAgLTQ4MSw2ICs0OTIsOSBAQCBp
Z3RfbWFpbg0KPiDCoAkJCQkJZmJjX2RpcnR5X3JlY3RhbmdsZV90ZXN0KCZkYXRhLA0KPiDCoAkJ
CQkJCQlmYmNfZGlydHlfcmVjdGFuZ2xlX2RpcnR5ZmIpOw0KPiDCoAkJCQl9DQo+ICsJCQkJc2lu
Z2xlX3BpcGUgPSBkYXRhLmlzX3NpbXVsYXRpb247DQo+ICsJCQkJaWYgKHNpbmdsZV9waXBlKQ0K
PiArCQkJCQlicmVhazsNCj4gwqAJCQl9DQo+IMKgCQl9DQo+IMKgCX0NCj4gQEAgLTQ4OCwxMiAr
NTAyLDEzIEBAIGlndF9tYWluDQo+IMKgCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pYygiZmJjLWRp
cnR5LXJlY3RhbmdsZS1kaWZmZXJlbnQtZm9ybWF0cyIpIHsNCj4gwqAJCXVpbnQzMl90IGZvcm1h
dHNbXSA9IHtEUk1fRk9STUFUX1hSR0I4ODg4LCBEUk1fRk9STUFUX0FSR0I4ODg4LA0KPiBEUk1f
Rk9STUFUX1JHQjU2NX07DQo+IMKgCQlpbnQgbnVtX2Zvcm1hdHMgPSBBUlJBWV9TSVpFKGZvcm1h
dHMpOw0KPiAtDQo+ICsJCWJvb2wgc2luZ2xlX3BpcGUgPSBmYWxzZTsNCj4gwqAJCWRhdGEuZmVh
dHVyZSA9IEZFQVRVUkVfRkJDOw0KPiDCoA0KPiDCoAkJZm9yX2VhY2hfcGlwZSgmZGF0YS5kaXNw
bGF5LCBkYXRhLnBpcGUpIHsNCj4gKwkJCWlmIChkYXRhLmlzX3NpbXVsYXRpb24gJiYgc2luZ2xl
X3BpcGUpDQo+ICsJCQkJYnJlYWs7DQo+IMKgCQkJZm9yX2VhY2hfdmFsaWRfb3V0cHV0X29uX3Bp
cGUoJmRhdGEuZGlzcGxheSwgZGF0YS5waXBlLCBkYXRhLm91dHB1dCkgew0KPiAtDQo+IMKgCQkJ
CWZvciAoaW50IGkgPSAwOyBpIDwgbnVtX2Zvcm1hdHM7IGkrKykgew0KPiDCoAkJCQkJaWd0X2R5
bmFtaWNfZigicGlwZS0lcy0lcy1mb3JtYXQtJXMiLA0KPiDCoAkJCQkJCcKgwqDCoMKgwqDCoCBr
bXN0ZXN0X3BpcGVfbmFtZShkYXRhLnBpcGUpLA0KPiBAQCAtNTA0LDYgKzUxOSw5IEBAIGlndF9t
YWluDQo+IMKgCQkJCQkJCWZiY19kaXJ0eV9yZWN0YW5nbGVfYmFzaWMpOw0KPiDCoAkJCQkJfQ0K
PiDCoAkJCQl9DQo+ICsJCQkJc2luZ2xlX3BpcGUgPSBkYXRhLmlzX3NpbXVsYXRpb247DQo+ICsJ
CQkJaWYgKGRhdGEuaXNfc2ltdWxhdGlvbikNCj4gKwkJCQkJYnJlYWs7DQo+IMKgCQkJfQ0KPiDC
oAkJfQ0KPiDCoAl9DQoNCg==
