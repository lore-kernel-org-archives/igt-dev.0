Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B797CFB440
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 11:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5E810E371;
	Mon,  7 Oct 2024 11:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVfMta0E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B81110E371
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728301577; x=1759837577;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zyM1p4cb/jepVpcFnpN/VoCFxbQLVhIlRFAg82jQRaE=;
 b=BVfMta0Ema3h15CBDLvMiwdkaRxHNsQuLhx1LNyIpkAV0O9p2Ry84F8q
 SkjAWSaI1ZKuk6QmLphubpcOcYEvKgf0qz48DwmnhFd3LVR9q7GWNrfYo
 6eUaobxhYHneaF2z0kHQRvs/SDJfEBMUZh64DHK9SbxPov3ehL/u/CSwp
 X2ySO4zKPIh0aoqjTN5HKUkQpR0uCxJg8dEXkHhCIpg52T7J4BUK/NLzI
 D3hTLhKbten0d++5LFqc67Q+M2WUjWo0nyIAktuSqs68eFKwHkQ25/do7
 B8xyhCJyeh0blyz6h19jcphIxPgGwj9oDn66jNdNLYArZkYdErxKHlS2b Q==;
X-CSE-ConnectionGUID: cbpQ9ky8QT2SXlWhGN/Iww==
X-CSE-MsgGUID: QmUe0sB+TeC7jWDmea7PuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27256312"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="27256312"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 04:46:17 -0700
X-CSE-ConnectionGUID: 3fzUPl4kRlSNnqDNBn8GZA==
X-CSE-MsgGUID: FrxKimQdSr6rG5fFlUUOEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="75120041"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 04:46:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 04:46:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 04:46:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 04:46:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 04:46:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqQOgwgxvAvLHyGIcylY54sHy3jHgcoknAkUcJyuM3uvCLXMf65/+Eb4N5FMKo8lJFyQlCHYUsNBGn6NqK10P3r9mOcDqbgLkHsQRQzlsMsmdKdi0cfO50yTIBJ49kIZyHkW2LeOGkEg0sECLcFEd4FBbSRetiLIXvhWErChJuIWEAwbIrQhC+zWnowVydABPDAI+nI0W12ZWJcGr8cg03Dssc7viQ2bh+Lhzv5J2pSiRlsJW9q9ghCdiGPgwzYscZRJXWL3ILRhF7zQJgFXUUjhP1k8E2GM9KI2c81flJ0BK0iBJSTmXuLvGVDnhpAXf5AHWbVTEYKXymDV3kiyog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyM1p4cb/jepVpcFnpN/VoCFxbQLVhIlRFAg82jQRaE=;
 b=N1uWOaLR8iXWGqMeIesWRbDGM35j01xLFypAEPKZYzgAafNucvluFfXmuvqHOfa1DcOfIMPOBwarbt21WkTXKjQvJCgTsA51WOgiYo4mQ3Wnh4mFH7tfq8ry96ld80VVIfWfIcv0HWi8Sq6VequSRZaZ53HhJ6JGZPjsRQVK9U4ve7pXY+ItT6cId4FlWxft4wouJYRaQT01abZnGpaH9Yuty1J/UFw6joC0Vf40jCCXwSAA/j6oFbWFdu7xwKDX4itkMNIP0hNJhAdFFDqZoiCHoNsFJWSY1zcn7jQDrdK0YwxpPIAjmQqcRYsgvXeFQ/7rFijr0JmYjHFgFxo1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 11:46:13 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 11:46:13 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3 i-g-t 1/2] lib/igt_sysfs: Introduce engine_class
 property helpers
Thread-Topic: [PATCH v3 i-g-t 1/2] lib/igt_sysfs: Introduce engine_class
 property helpers
Thread-Index: AQHbGKOcSngWf+MOBEyqgEF/OP0yZ7J7K72A
Date: Mon, 7 Oct 2024 11:46:13 +0000
Message-ID: <119b80b6a41d47e453dcac3a0b8a5bf50f3a7b28.camel@intel.com>
References: <20241007102734.5452-1-dominik.karol.piatkowski@intel.com>
 <20241007102734.5452-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20241007102734.5452-2-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|PH8PR11MB8107:EE_
x-ms-office365-filtering-correlation-id: 2a1a2486-4407-47ff-f6d1-08dce6c5a576
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?czYyanVqY2dqTmgzYk9NTVlZc3ZScnZ4K0FDbXNJeE9wdFZEblhIV0JVczl6?=
 =?utf-8?B?SW5zcm1OY0Fya0RwQjhSVUZVRUxVWGxQS1Y1bFhvS0lDcytuNzAyK053OExY?=
 =?utf-8?B?d3NyK3NLekw3d3VuYmFaVCtnZElWMkE5WnpQdEpUSTFGUTEyKzVaOVJKaUlB?=
 =?utf-8?B?Yy95T0U3NTEwc085RnBuMnJOSjlmTDdmRytNb2pQTTB2YmxVZFV0VE1nbEFB?=
 =?utf-8?B?WnBSOHZGSW5RRExEK0NxUi9IQ1lPbXUyeTdXU3g5YURyUnhrQ3RtVkUyYk9l?=
 =?utf-8?B?UkRvTWdPMU5ScDdnTlBhR3hiejJldkNTK0wybTRob3lic1ZtcDBrTHJVZDQy?=
 =?utf-8?B?OVR2QlpLZjRyQzVNNnFUTWhHeWlXOWFVbjdUckpFY2M4L2pqZHZ1UmRHby9z?=
 =?utf-8?B?ZmJwQURoQzNwN1NOcWkxbE1DYk1TMEhuSjhJbHE5OXRYQkx1VDdIUXZpdmh6?=
 =?utf-8?B?cmtxbWs3cXJyaEE1dm1lUGRZcEp3RGRFbkFvU2RkcDhndG13ckN6OS9LTU5r?=
 =?utf-8?B?OXlCcTFCVmdFd1R4ZUNYVS9SQ0FFdnJNZWp2OHhyYlpzRG5YVGVGbWxweUJ2?=
 =?utf-8?B?YlZWN1hqT2JXcTFEVFNsSE1vZk9UdjhqOUJWekc0Y1BKaGJHeG4rclk0MHBp?=
 =?utf-8?B?ZzhSUkxlTlNGRzFaWm1yU0toS244Z2xrcG1aSFNsVWoyTjk2Y1dqczF0SnZn?=
 =?utf-8?B?R2VFS0tPbWdRRWpHK01UQWV4N2s5bU1ORjBDYVZBK3o0SDVyUU91eXFLZjBU?=
 =?utf-8?B?eHpORTBnMGU1RlozbnlDMlY2RUtZT1NObHNFQmdzZVg0aitqNkdjdmJqNUpN?=
 =?utf-8?B?b0tCcW81R0lLSHJNelVXOVVXa3YrNkNjUWppVGFXQk9CbFNSZ0IzUGVhSUhv?=
 =?utf-8?B?OHdKZWxiQ2xMOXpGOHh1ZEV3UVpHMnpxSTBOSUxYMUFqRUdYQ2xFd2Jaa0lM?=
 =?utf-8?B?Y2UvRDNQaXB1ZUJUWVRIZVFZSTVHVUIwb2o4Zzd2MjhOOHUrdkdsaFVreUw2?=
 =?utf-8?B?cUhqOThqMVZaTjNJTFpyRlFSbGJrTzNtaE9KSW5FZ0JMUkswR3FGTWdvMmFC?=
 =?utf-8?B?TmhrUmZCZXB2dGJzZDg4R1hVVVhkRGNOVERHajRkU0s0S2pJbFl2cHE0QUFv?=
 =?utf-8?B?dll0T2VDNFpBbDlGSXpaZ1h6ZVJhQUo2L3BOVnRSYnlEbnlQREJ0QnY0dmcv?=
 =?utf-8?B?RGRUVjV0N1ZHc1VwTE9YMUtoSFBESHRGSzlLVUsvUGYyaEpXL2d4VWdMbEdX?=
 =?utf-8?B?cDRJT1pwRzB4TEJFT0VHcnFpVisvYVpTV0NKL1RHN1R2R1RzVXBseEdoS1k2?=
 =?utf-8?B?RUNCOXRwWkJONWgraTdreWpNNFBxUmpvL0NVR3JuM1BRTXlkYVZ1QWpWT3Bm?=
 =?utf-8?B?WmQrbmxXMjNnb2tnS0cxWHdVdGczMnpvbElWNXhvdTdSZXgwbGFwVGR4WGlq?=
 =?utf-8?B?K3UweUwrNS9wOG5zV3pPQUdESTlGQWIyeU8vbnY5OEZkQjlnV24xWlprRlZN?=
 =?utf-8?B?NkdxeUJwTTlEZ2o3K1REN2t4SkR2KzhyU1hhMVV1bzhGZTdNOGVXZmJzRXNU?=
 =?utf-8?B?NjZ0K0hDclZvNVhzMUVsWE5NWFBhYURiQU9FMzJQdE1qZi9PTnN6WEtuMDZ6?=
 =?utf-8?B?MEpPUXZNZldqWVpGZHluNytzbDF5WHlQVFVqbzh2VUgxdUJ6ZFhMMWNjbHFV?=
 =?utf-8?B?Q084elRlRmlkN2RqZ1BYU0hlTHdLOE1HVmxlQXNpUDg4VFRjMGxxd0RiMGRo?=
 =?utf-8?B?cUNmV2YySmYzMVB6UG50dEVXVE84cXk4VXM5azhNREVmUThBUlR0TGNNeU5N?=
 =?utf-8?B?WFAxUVNHWGtRN3FRcE41UT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2ZwUWcrRzJkMTRSOU5CSWMwMjV6eWk1V0dobjJlZ3B6cGw4T2lyVWJ4R1E0?=
 =?utf-8?B?UkNGd2d3cStnTFo1aVd5ZmloakpnTmdOSlFzZmFPYndsZ0VNTlVWMzM2Slh6?=
 =?utf-8?B?OFVQWjdINlF5Rk1taXF4dHB6NlNVcjV5cDRlZEhrTkZmdzVLY24yaVNSQmZW?=
 =?utf-8?B?SkZzSitTN3k4a3B2SUFPdDNZZFl5eTlBaUZwakI2V3lEV3pHK3d4YVJpVXFS?=
 =?utf-8?B?bTNWRkZUclo3TDFzdU5Cc2h0THlrS2orOHJOYVVYNkxPQmNFZS9jTi82Rk9L?=
 =?utf-8?B?NFRnczAxMXpKNThMM2JvdlRtN3I1eUxrZ2RoTUFjd21tL2U5eVJQZFhHRTUy?=
 =?utf-8?B?dEJidDJEbjA4SlRtVUNFZ240MGpBV3hSQ1NNSGE3VlljWWRRY0pMdUY5NDZt?=
 =?utf-8?B?Rzg4WDZhQk55VmMwdWgwbnZpY1FCU1BOd21SNmkwQUxnMGtaQTF6YXo0aU5r?=
 =?utf-8?B?Sjg5NHJLL0J3WkFZU3BUVExKcFZJMGhpRFM2Y2NFK3BXeDJXOGpsQWJvMkIz?=
 =?utf-8?B?N2pWM24zcWFPRUdJdUtqUUt2OUhaTnd1S0V0dE56SkVpejR3Vm5OWHVlcGov?=
 =?utf-8?B?OFh4ME15ZXMwcVYxN1F0MEVIWTgwb3RTb0VWZytDdHJOMml2S2lGTkYybWZv?=
 =?utf-8?B?TVROcUY3bFhpSDlsUUFXTzZBNERKWlJjUkZvWEJGRjBzdTF1TzFTbmNUMTN2?=
 =?utf-8?B?ODhTQzB3bllzTXRxR2dMcnhWV0NtMVlSRmNOYU5kZDVmK2NLTC9YRUtNT09l?=
 =?utf-8?B?d2srQWY2QWQ2ZnJoRmpuOWwvOW5najJ1U1h3RUMzU2p4bmt2aUlhT1pJMjFJ?=
 =?utf-8?B?SDhBdmh5dS9talJxNFlPM2VHK2ZBeFJvQUhqMGJLekJ2N1pKbDM2SXMyWHhv?=
 =?utf-8?B?dXRmbkZERmxxZi9hWGQvMFFhcVBKOU9vWXV0TDFYNkhJVnBWVitVc0E2YVJu?=
 =?utf-8?B?ZUEzVEU3S1ZBb2FnRUIxQzBZNzZCU29CTXovOWM5L3RBSDBCVU8vaElQWkFG?=
 =?utf-8?B?RXVHZFBmelpNblZlblo4K3pZOTAxOWRTVnA1M2RHMUlMQ05hOU0waGdLbzla?=
 =?utf-8?B?SENNQS92TkQ2ZnRqcEUzTHd4NVNXcDh2NThWS09yTmRDTmJBbW1NdE1kUEho?=
 =?utf-8?B?YXNKSjhMSzZ6em1rU1gvMnNkT2ZKN2czaURXUElWSE5lOXk3UFpYb3hvZUNm?=
 =?utf-8?B?M3FSUTRSTWc4Z3Q2ZFhQaUFFSldKcDJKTGlvRW5BWkxiYVcwa2dGaGlpbk9w?=
 =?utf-8?B?M0R5Uk5ETHh6WmhDMDU5R0gzQlpiTEcyUEhua0ZXaGMzQlN0bGplQjlOTzVz?=
 =?utf-8?B?TEJEUEQwV2c4aHhrcE94NVByUFMvT0pCakJHQVFCUlBkL00zeC9yYUFMV2Vt?=
 =?utf-8?B?aG9RYXBsb1N1eThTeGR6RXBvZzFScnlFejZHSGZObWkxOFBSQzJRN04yK2No?=
 =?utf-8?B?WDdCYyttcFJxN3dQOUU5NHVNVkcyd2h0dTdjQTlNNHpnZ1VzT0tnWGE3cTVP?=
 =?utf-8?B?MWErb2tzZ3lpWEZIQVRTa3Y5MVdPNjJMYXpRS2RsWTRTMmZ3KzNaZHpTZVNE?=
 =?utf-8?B?YVM1dDJYQkk5c2xmNStDelV3WWhheWQ1QWVCeU9DQ0hZYkhDL201OXRpVjdF?=
 =?utf-8?B?SzJkQ2RrQ1BZODI4eEY4L01wN2NqNjUvYXl5YjcwYnNIcnFJRzQrZEdoSXRt?=
 =?utf-8?B?ajZlMk1NNGtmN0VXUGp2K1JCTW96T0Q4WUtGQXM3bmVyaHZFSkM0TG4vWTND?=
 =?utf-8?B?d0VHVTFEM25KelVWekU2T2hSQ1phZVJGbk1TNmZMWjlXS1ZzSDJFaXREWE9F?=
 =?utf-8?B?UWdYdi8vYWd6SWdLNEZKdkRsVE5uZHVEdmpSTWJBUHJUMThaWVJKS081Skpi?=
 =?utf-8?B?TDczVGg2cFNDcFI2QzRSUmMyYmtncnE5OWZ1UFZkSC9iZ1RVWWdzd3BBQjFB?=
 =?utf-8?B?ODJjZHR1eUhuR2xCMFdQb0lSMWgzR3hIVXZWT2lXb1NESzF5bFk2cEU2R1Bp?=
 =?utf-8?B?TUVFcVJIeU1XQ0pjMkpoTGtSLzFGTGNQbDJ1SVN2dzJ4ajh4VURNbU45Nmd2?=
 =?utf-8?B?b3RKRy9tSENLTis5cE1kSXgxYnNLR3NNZUJzT1pVMms1RW04eHVZbFFkM0xX?=
 =?utf-8?B?ZjJVZkZhcXlSbWxxZjdNZG5OS2kvUkFQQWpQUHVNOU9xbTdkNWhSM2pvTDJG?=
 =?utf-8?Q?4Fw20861mrsYHx1W5jWmCAE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7F95B1B6C31654AB4D0DC858C52B11B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1a2486-4407-47ff-f6d1-08dce6c5a576
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 11:46:13.8688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Isi/SbKqpOQ67ojVUnuKwRpK26sx6xuqnl4sH0DIVLRMIMG1jjydbMWrXmvg8TtnRa8XnL88suIE3BmhGGQ8SskxfINnMkNdUp5bBtoj4oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

T24gTW9uLCAyMDI0LTEwLTA3IGF0IDEyOjI3ICswMjAwLCBEb21pbmlrIEthcm9sIFBpxIV0a293
c2tpIHdyb3RlOg0KPiBJbnRyb2R1Y2UgdGhlIGZvbGxvd2luZyBlbmdpbmVfY2xhc3MgaGVscGVy
czoNCj4gIC0geGVfc3lzZnNfZW5naW5lX2NsYXNzX2dldF9wcm9wZXJ0eQ0KPiAgICBDb252ZW5p
ZW5jZSB3cmFwcGVyIHRvIGdldCB2YWx1ZSBvZiBnaXZlbiBwcm9wZXJ0eSBmb3IgZ2l2ZW4gZW5n
aW5lDQo+ICAgIGNsYXNzIG9uIGdpdmVuIGd0Lg0KPiAgLSB4ZV9zeXNmc19lbmdpbmVfY2xhc3Nf
c2V0X3Byb3BlcnR5DQo+ICAgIENvbnZlbmllbmNlIHdyYXBwZXIgdG8gc2V0IGdpdmVuIHByb3Bl
cnR5IGZvciBnaXZlbiBlbmdpbmUgY2xhc3Mgb24NCj4gICAgZ2l2ZW4gZ3QgdG8gZ2l2ZW4gdmFs
dWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpIDxkb21p
bmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3Rfc3lzZnMu
YyB8IDg1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gIGxpYi9pZ3Rfc3lzZnMuaCB8ICA1ICsrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9zeXNmcy5jIGIvbGliL2lndF9z
eXNmcy5jDQo+IGluZGV4IGI3NzQ2YTFlYy4uMjZhM2FhMzFmIDEwMDY0NA0KPiAtLS0gYS9saWIv
aWd0X3N5c2ZzLmMNCj4gKysrIGIvbGliL2lndF9zeXNmcy5jDQo+IEBAIC0xNDE0LDMgKzE0MTQs
ODggQEAgaW50IHhlX3N5c2ZzX2RyaXZlcl9kbyhpbnQgeGVfZGV2aWNlLCBjaGFyIHBjaV9zbG90
W10sIGVudW0geGVfc3lzZnNfZHJpdmVyX2FjdGkNCj4gIA0KPiAgCXJldHVybiB4ZV9kZXZpY2U7
DQo+ICB9DQo+ICsNCj4gKy8qKg0KPiArICogeGVfc3lzZnNfZW5naW5lX2NsYXNzX2dldF9wcm9w
ZXJ0eQ0KPiArICogQHhlX2RldmljZTogZmQgb2YgdGhlIGRldmljZQ0KPiArICogQGd0OiBndCBu
dW1iZXINCj4gKyAqIEBjbGFzczogZW5naW5lIGNsYXNzDQo+ICsgKiBAcHJvcGVydHk6IHByb3Bl
cnR5IG9mIGVuZ2luZSBjbGFzcyB0byByZXRyaWV2ZQ0KPiArICogQHZhbHVlOiBwb2ludGVyIGZv
ciBzdG9yaW5nIHJlYWQgdmFsdWUNCj4gKyAqDQo+ICsgKiBDb252ZW5pZW5jZSB3cmFwcGVyIHRv
IGdldCB2YWx1ZSBvZiBnaXZlbiBwcm9wZXJ0eSBmb3IgZ2l2ZW4gZW5naW5lIGNsYXNzIG9uIGdp
dmVuIGd0Lg0KPiArICoNCj4gKyAqIFJldHVybnM6IHRydWUgb24gc3VjY2VzcywgZmFsc2Ugb24g
ZmFpbHVyZS4NCj4gKyAqLw0KPiArYm9vbCB4ZV9zeXNmc19lbmdpbmVfY2xhc3NfZ2V0X3Byb3Bl
cnR5KGludCB4ZV9kZXZpY2UsIGludCBndCwgdWludDE2X3QgY2xhc3MsIGNvbnN0IGNoYXIgKnBy
b3BlcnR5LA0KPiArCQkJCQl1aW50MzJfdCAqdmFsdWUpDQo+ICt7DQo+ICsJaW50IGVuZ2luZXNf
ZmQ7DQo+ICsNCj4gKwllbmdpbmVzX2ZkID0geGVfc3lzZnNfZW5naW5lX29wZW4oeGVfZGV2aWNl
LCBndCwgY2xhc3MpOw0KPiArDQo+ICsJaWYgKGVuZ2luZXNfZmQgPT0gLTEpIHsNCj4gKwkJaWd0
X2RlYnVnKCJGYWlsZWQgdG8gb3BlbiAlcyBvbiBndCVkLlxuIiwgeGVfZW5naW5lX2NsYXNzX3Rv
X3N0cihjbGFzcyksIGd0KTsNCj4gKw0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+
ICsJaWYgKCFfX2lndF9zeXNmc19nZXRfdTMyKGVuZ2luZXNfZmQsIHByb3BlcnR5LCB2YWx1ZSkp
IHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gcmVhZCAlcyBwcm9wZXJ0eSBvZiAlcyBvbiBn
dCVkLlxuIiwgcHJvcGVydHksDQo+ICsJCQkgIHhlX2VuZ2luZV9jbGFzc190b19zdHIoY2xhc3Mp
LCBndCk7DQo+ICsJCWNsb3NlKGVuZ2luZXNfZmQpOw0KPiArDQo+ICsJCXJldHVybiBmYWxzZTsN
Cj4gKwl9DQo+ICsNCj4gKwljbG9zZShlbmdpbmVzX2ZkKTsNCj4gKw0KPiArCXJldHVybiB0cnVl
Ow0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIHhlX3N5c2ZzX2VuZ2luZV9jbGFzc19zZXRfcHJv
cGVydHkNCj4gKyAqIEB4ZV9kZXZpY2U6IGZkIG9mIHRoZSBkZXZpY2UNCj4gKyAqIEBndDogZ3Qg
bnVtYmVyDQo+ICsgKiBAY2xhc3M6IGVuZ2luZSBjbGFzcw0KPiArICogQHByb3BlcnR5OiBwcm9w
ZXJ0eSBvZiBlbmdpbmUgY2xhc3MgdG8gYmUgbW9kaWZpZWQNCj4gKyAqIEBuZXdfdmFsdWU6IHZh
bHVlIHRvIGJlIHNldA0KPiArICogQG9sZF92YWx1ZTogcG9pbnRlciBmb3Igc3RvcmluZyBvbGQg
dmFsdWUsIGNhbiBiZSBOVUxMDQo+ICsgKg0KPiArICogQ29udmVuaWVuY2Ugd3JhcHBlciB0byBz
ZXQgZ2l2ZW4gcHJvcGVydHkgZm9yIGdpdmVuIGVuZ2luZSBjbGFzcyBvbiBnaXZlbiBndCB0byBn
aXZlbiB2YWx1ZS4NCj4gKyAqDQo+ICsgKiBSZXR1cm5zOiB0cnVlIG9uIHN1Y2Nlc3MsIGZhbHNl
IG9uIGZhaWx1cmUuDQo+ICsgKi8NCj4gK2Jvb2wgeGVfc3lzZnNfZW5naW5lX2NsYXNzX3NldF9w
cm9wZXJ0eShpbnQgeGVfZGV2aWNlLCBpbnQgZ3QsIHVpbnQxNl90IGNsYXNzLCBjb25zdCBjaGFy
ICpwcm9wZXJ0eSwNCj4gKwkJCQkJdWludDMyX3QgbmV3X3ZhbHVlLCB1aW50MzJfdCAqb2xkX3Zh
bHVlKQ0KPiArew0KPiArCWludCBlbmdpbmVzX2ZkOw0KPiArDQo+ICsJZW5naW5lc19mZCA9IHhl
X3N5c2ZzX2VuZ2luZV9vcGVuKHhlX2RldmljZSwgZ3QsIGNsYXNzKTsNCj4gKw0KPiArCWlmIChl
bmdpbmVzX2ZkID09IC0xKSB7DQo+ICsJCWlndF9kZWJ1ZygiRmFpbGVkIHRvIG9wZW4gJXMgb24g
Z3QlZC5cbiIsIHhlX2VuZ2luZV9jbGFzc190b19zdHIoY2xhc3MpLCBndCk7DQo+ICsNCj4gKwkJ
cmV0dXJuIGZhbHNlOw0KPiArCX0NCj4gKw0KPiArCWlmIChvbGRfdmFsdWUgJiYgIV9faWd0X3N5
c2ZzX2dldF91MzIoZW5naW5lc19mZCwgcHJvcGVydHksIG9sZF92YWx1ZSkpIHsNCj4gKwkJaWd0
X2RlYnVnKCJGYWlsZWQgdG8gcmVhZCAlcyBwcm9wZXJ0eSBvZiAlcyBvbiBndCVkLlxuIiwgcHJv
cGVydHksDQo+ICsJCQkgIHhlX2VuZ2luZV9jbGFzc190b19zdHIoY2xhc3MpLCBndCk7DQo+ICsJ
CWNsb3NlKGVuZ2luZXNfZmQpOw0KPiArDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsN
Cj4gKwlpZiAoIV9faWd0X3N5c2ZzX3NldF91MzIoZW5naW5lc19mZCwgcHJvcGVydHksIG5ld192
YWx1ZSkpIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gd3JpdGUgJXMgcHJvcGVydHkgb2Yg
JXMgb24gZ3QlZC5cbiIsIHByb3BlcnR5LA0KPiArCQkJICB4ZV9lbmdpbmVfY2xhc3NfdG9fc3Ry
KGNsYXNzKSwgZ3QpOw0KPiArCQljbG9zZShlbmdpbmVzX2ZkKTsNCj4gKw0KPiArCQlyZXR1cm4g
ZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICsJY2xvc2UoZW5naW5lc19mZCk7DQo+ICsNCj4gKwlyZXR1
cm4gdHJ1ZTsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfc3lzZnMuaCBiL2xpYi9pZ3Rf
c3lzZnMuaA0KPiBpbmRleCAwZWUyNTM4MjYuLjg1MmI5NTA1MyAxMDA2NDQNCj4gLS0tIGEvbGli
L2lndF9zeXNmcy5oDQo+ICsrKyBiL2xpYi9pZ3Rfc3lzZnMuaA0KPiBAQCAtMTg0LDQgKzE4NCw5
IEBAIGVudW0geGVfc3lzZnNfZHJpdmVyX2FjdGlvbiB7DQo+ICANCj4gIGludCB4ZV9zeXNmc19k
cml2ZXJfZG8oaW50IHhlX2RldmljZSwgY2hhciBwY2lfc2xvdFtdLCBlbnVtIHhlX3N5c2ZzX2Ry
aXZlcl9hY3Rpb24gYWN0aW9uKTsNCj4gIA0KPiArYm9vbCB4ZV9zeXNmc19lbmdpbmVfY2xhc3Nf
Z2V0X3Byb3BlcnR5KGludCB4ZV9kZXZpY2UsIGludCBndCwgdWludDE2X3QgY2xhc3MsIGNvbnN0
IGNoYXIgKnByb3BlcnR5LA0KPiArCQkJCQl1aW50MzJfdCAqdmFsdWUpOw0KPiArYm9vbCB4ZV9z
eXNmc19lbmdpbmVfY2xhc3Nfc2V0X3Byb3BlcnR5KGludCB4ZV9kZXZpY2UsIGludCBndCwgdWlu
dDE2X3QgY2xhc3MsIGNvbnN0IGNoYXIgKnByb3BlcnR5LA0KPiArCQkJCQl1aW50MzJfdCBuZXdf
dmFsdWUsIHVpbnQzMl90ICpvbGRfdmFsdWUpOw0KPiArDQo+ICAjZW5kaWYgLyogX19JR1RfU1lT
RlNfSF9fICovDQoNCkkndmUgY29tbWVudGVkIHByZXZpb3VzIHBhdGNoLCByYiBzdGlsbCBhcHBs
aWVzLg0KDQpSZWdhcmRzLCANCkRvbWluaWsNCg0K
