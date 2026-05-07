Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3527ECD3442
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 19:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B6010E590;
	Thu,  7 May 2026 19:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUmoOecd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D2810E590
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 19:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778181840; x=1809717840;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=PmAz2KXCDDMyDW8xMYS857yUfaU++ay9CQZXZmR3xdg=;
 b=TUmoOecdEmvJYj3WIRPow65a5nZVvcCEjGK4tvps+Z51M7LmIbUi5FPM
 6Ab6hhljaeM47nYIONWPYjgghSY9Lt4s9umoFopiLJjBgO3mD7WlZM+2Z
 Yp9/6nDqNTu9a56D/cmOlpg/0x3z32JOeNkzvOgE7riIujrveWClUle+X
 93w+0mI+VOMLTs2X3q32h5DeBhBDosY2O3gqX5cgy3WbAZbNZ91Px35ER
 7i/fdAzV32I98iu46GYL5XOQaOeYFNwg5UDBRA07E4NPyz37tV6osUfTR
 Lyc1gJUlqV4rnpu36L3p2WWMe8pI7QOfuhYstdU3F191bnwPznbeTxZeU w==;
X-CSE-ConnectionGUID: rH2HINExSHiHrZqDHqB+XA==
X-CSE-MsgGUID: 3uJSt4JOQGCaIl7nkqTiSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90523575"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="90523575"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 12:24:00 -0700
X-CSE-ConnectionGUID: qLMvzRTzTHWjzHxzJ4sgCQ==
X-CSE-MsgGUID: DZ6aT6w7QGyIFdBZlE3tLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="240891861"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 12:24:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 12:23:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 12:23:59 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 12:23:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwJk2zodhraQgBdJD+IGlSN+n3Cs0GXK1j0mFaHmleld4QBJppiZfAbnGks9xIscMKbtlVpiGdy6JKJu3a39dZ/zWvjbJCLEyR26ABOcNfOQfgkKHoQfJMemTC0Uu1kZDvVZfCRiEb7Ctwsteb5/LO4S1jEn1vH66+8uyxquyEmVFz7KxUX+EmHJR+S7TrW52oMXaoBe5JTYn7mZXfhi5xdvbfFtih+RtHzT/18bFERlBvSt+rXJs49i/PwJxB23rrl9i3tNDolZ9b0G7v/vZguon3Ek/R4N1qmCsrjHFpvpRbs1SqZHVXkl3bglJhVB5/UsGZ/4XczSWb7N8T6JaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmAz2KXCDDMyDW8xMYS857yUfaU++ay9CQZXZmR3xdg=;
 b=Hch5N9kuykspfnwecjKU6xvi2AecQOYQtskHUUdZxxQ817IJZbiiewEkwNXlVEQLSWj154bfU9cyP1I2vQW3sWL/LAPTtfIIORz3UxEYDEDhVXJonFiaKfQinnm1PHIw0/pbhHdT9NpJ4VC8MWn3miMM0cDTGnboaY0/1JbHmDX2Bf3t8bW5NDM332MMMx5O/OKIGneJM/wTXimQbkrEz64CNREKfYUTcT1RXqymSg0IWrDQvy4ERYZkhh6PZFTnyUQ6g3rJRD9r95iKUENJq8ZIcjL4IoBMqm7Y2qTlfBVv1HyVmj7S7K+ZUoDsgH3jm53VbiF8JHZiGhfzDowBFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 19:23:51 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 19:23:50 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 2/3] lib/xe/xe_spin: Add option for QUEUE_TIMESTAMP
Thread-Topic: [PATCH 2/3] lib/xe/xe_spin: Add option for QUEUE_TIMESTAMP
Thread-Index: AQHc3YbMQLbB7NuTykqfpH4X8FCvRrYC8usA
Date: Thu, 7 May 2026 19:23:50 +0000
Message-ID: <81b70498fab2a302ad8c131ef9d589dd7e39c230.camel@intel.com>
References: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
 <20260506183137.51479-7-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260506183137.51479-7-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB8802:EE_
x-ms-office365-filtering-correlation-id: 039189d4-ff01-476f-109e-08deac6e2b82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|38070700021|22082099003;
x-microsoft-antispam-message-info: hr7wxx58AxO7PEJz+EA9rSsmtl0NjtwBPt2Zg3y0r1c64Y/afjrc9qV8LbrTnTiFKLGcxzSQi4fkCTXhbN1DpkyPeMsczc6y3669P0K0DrHtfa0e1MKAry1hj4g9AVnhQ/V2mdC8sFcSfVqW9VhUqcwGsN13xyF/j1A0wpKUozOpmuVmYtPagbbSSDXIeaBFJxfaFBXXtCM4QkWoVMVub5Tm6bgEzl6eUtb7pD0u7EJ2f4KehmB+6YiLCXSoHAIi9H7QGwdMmeVWA05MEqF3yebrSt4LmM6i51Y1wNifOUfXscj0TI0c5GMZYFK4WcWRsKoO7Y0NeP07eEZuKL+GZ2U1++vHsIFLf4iHnQEvEa+97eeu+XlwJe2tsOKHUWpB/X3Ha/4Fz8/kFOiJbDMoQOkJTVVOg/hJ2oI1D+A0OYj1zTYpxIxqTiD7Q829N6Izb6ymOr9ifMqyVdeCKhu/wt+NTY+Ys/5gk3exx0psL3fsox1jH6hLXsU9yAiXOfpLmSfId5pK/2IRZ4DeqAf4MDFAkApdH6NFa/epcNP3nHmm5GETRuf1wSbCCgyTJBEfA/stXUsXO7bqETIr4+i+Bih4zzNA9wpByFWlOu4TxtnJlx1VOfcaieOc42KS2Xay7sk3PrPIKdqnAd4C9XDiOFVp6mMfujgrlSgeLZDZBS0YoDanBrijt0k/kglsQxoIbokEOXarToIsaqy7nB5iOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(38070700021)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0JZWkFwREdDY1BQQVB2MTN5R0V2N0NySXJaYWg0d25ubWtsdkg3cngzNURG?=
 =?utf-8?B?akZ2OUR1UTJBK01QU1pqYnYycFBKcml2NGxjdk9tdTNzT1VzcHJ1RzZOUGNB?=
 =?utf-8?B?QXRsaDZzeTBVSTBzS2kxZG5lQTBDeUpTblE0QjdMZWlVYTRTRExlMjdPUDNk?=
 =?utf-8?B?L1BRcXVpTnlkczlhQ0plWVBzKzczTEQ4ay9IbWk5VnhjdEdHTUV5RHg3d05P?=
 =?utf-8?B?QkFsb3ZMNDdEVHlnZzJiZytHRElxeDdQZHNGWUtBclhsL2N0ZkZnREZoYkt5?=
 =?utf-8?B?TUY5SlZCQXFKdk52c3QrNDAzQW1UWjVMa2NiVGptNlFTTUlUeEYxc1JjaTNM?=
 =?utf-8?B?a3hQcTZXRVUzMUhMVEZyWldyM1VTQ056b3J2VTRJK0FJVjRRNmpzb0pERi9z?=
 =?utf-8?B?bGpYTkZ5V1hsY2RzY2YxRHlTK0NFOXROT2RhaHdTZlVPbnZFZU1JSWdxNmFZ?=
 =?utf-8?B?OHdQTVkvUlpzOFdqeGJ2UHc1dEM2dXNJaUhlTm1raGREaXVFT0xGT0k1YUw5?=
 =?utf-8?B?QVc4OHRDV051VFJzK092ZnpSY2VJRE5yc3YyOWFvd2s5MWNhSXRzUmFWQW1U?=
 =?utf-8?B?M0ZFS3N2QW4vbCtqTkNrYThkVDRsNTFTdzErc0w4NjZhdEpTeHNRS2FuelRQ?=
 =?utf-8?B?cmtrQ0VyVkRyYnFtSHZ6N0s2M1FUc2pnd3hNQ2hmTmUwcitXcy9uOVZUaHhT?=
 =?utf-8?B?R2V5aC9CcmJETVBJdjBrVG1VcWVXbU4zM2ZyRVREN3lwM1p5cllEQXRtR2hY?=
 =?utf-8?B?NWVWd3paNXRweXhKNlh5SVF3Vnc4TWk2OWhEV2tBdFBYZFFibENmY0xzWkZv?=
 =?utf-8?B?bi9vUlBxNXkxUG50SUxucUtKWEhSZkJqb0pVNDYvRGM0Q2VvZVNwWkg3ZDQx?=
 =?utf-8?B?OG9CQmRSSGlpQ3NhN3BVZ2diaElpcThDNzhWL1ZvYzlpb2I1QkF6c2diWU91?=
 =?utf-8?B?Q1BCRjR1WDNOdGlZVFFlcG56WVRtSFozZm9CYmRTZXc2ZURoOHVwcmNZTGZV?=
 =?utf-8?B?SjdZeHl4aGs3Z05oVDRWT3huRmJVdjNsU3BYY3RhZm1HMms0dDJCOUwvaU1s?=
 =?utf-8?B?aDEzRzdBeC9wcW96TWMrRXdHcmpSWlpFMmthNzcxRTcyOW96MEFRSjNud3R1?=
 =?utf-8?B?TS90T3pPdksxMkN1YjlkbkxLRy9xN052QVdqWWZ1ZlBaN2dwcmVhVU5Wd3JR?=
 =?utf-8?B?RlNtQUlEVVVyVzNQcEZzT1UydTBNcnQzZVFQZldGc1hucEhqMXdGSTI4WWFR?=
 =?utf-8?B?WUNsY3dHVHljQkJOK2ZPei9QZURpRlBwZCtTV0Z5UGltaGlsdjlvZ2FOTkhR?=
 =?utf-8?B?Vm1OS01ucmxEcEdnVjdFZFFQdVJveThCdEYxVXdYVUhHTkMyazYzMGQwRk5F?=
 =?utf-8?B?NUFMSDEvOG9nSVlBM2ZHckp1TlhtZGYvMmhuVUc1UURhUnJtYTY0UWZzWXpX?=
 =?utf-8?B?SlNzVFFsU2RzeUxHTkpCSjRXL01TWVo1bmxKeW13bk5nWjlhN3ZUa3FETzBy?=
 =?utf-8?B?YnB5WlNCa2NyVm9ORWxPR2FNWVdJZDRmSjdQcTVwWmdOVWJxR2tiZVRLT3l5?=
 =?utf-8?B?TU9SVEtmc1ZFR1NOVmpBQnByT1lXdytKVk5sK2toN0tvVDFWUDI2WnlDb2li?=
 =?utf-8?B?cW1HMWIyVCsxaFVPMWswcUNwVnZDc3UzRVo2ZmpNZ2hxSnNrQWc5REtRNUJ3?=
 =?utf-8?B?aHBhWTBPbVBzMjQwYlBlTXZ0bzVqSEZOdWtuR05tYXVjc3dWazhXOWl4WTJ6?=
 =?utf-8?B?OElnUHgvN2o3T1JKb1E3RnVUTUVhdUV6SDVMQUtYaHJiWU15OHNCRStlTWtI?=
 =?utf-8?B?cnFEb2lTZFNWN21NaDNWeGo3QW94WTFRSUdQa1RQZXpqdFdlWFF5aFNyQ21K?=
 =?utf-8?B?dWtkamc1NVR5b3EwQjNDUlFtNUhBT1k4U0p4MW4ydWVmaWw5UVdMcEQ4VUFR?=
 =?utf-8?B?R0J0S0R2Y1kvSHNrUjZIN2pKQkNHcGJYWG8rRXhhZDZSSzlRMnZ3VHJwY05p?=
 =?utf-8?B?aXdETU13MVd3amFwM21ZanJZUzlhWVlMdzAxcng0OXB1V3F3QUkzVFBMTlpP?=
 =?utf-8?B?WXNqa3JsVlBlcUM4Z1YwT1dwRGk5NE9JcHIxdHBVcitkd2NCVnBSaVpyajFE?=
 =?utf-8?B?enpWdVBoU3ZHc1hQNWFkNWlEaFJzQ0g1b0lUZTVEN2lLZlJJVzEwY01xeWpw?=
 =?utf-8?B?aVVLVE5ZZjJFMW9oZXpyMitpMS84dVc1NlJKMzBYTTFGYVpLSzY3WG5RVW5Z?=
 =?utf-8?B?Q1JYTThIYlVuVjIwYjJDa0hza3dMSzY0YjV6QnczRjVNUzZDejBLQ0pkbDh4?=
 =?utf-8?B?YXZ0VjA5ekplUEc1S2FZTkRSTkEzeE1PLzRuR2JhTWdobU40bzFzUk5pUys4?=
 =?utf-8?Q?hNcqewnIANiYiUgU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <820DDD5E6CF2D3468C2E523260ABA778@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Jljaud7WExzbUt5r6oeKo4mTdJVe75sbWDbAYrUAGL1ebc6UI8278uPJAjCZyrSDUm3f/bUDMWYZkGnAtsjhzWlBbmGJyGSnxOBzxZB2sOIg9T4P/gF7IKb5Ms7GfsLttEg68o24hZDZwlfXQ1wgAWCmHmxl3zEzZPaMcA+6HrquYjGlr+EyO5GmE6GqaiUvwWD5vkNMTyop6ZzJ10l2A9cBkQ+xe3wnPz9dBSxmXdbPxkt+Fp1IWsJ6WR32ZOhz8bnQCySHaTFy/cJv4l9P0BFiU9JPikLJj+5IirLeWZq9hot/e9ESOccVBLp8D2UDV+F5McHnFsO8rHNlVP7dOw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039189d4-ff01-476f-109e-08deac6e2b82
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 19:23:50.8941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RVe2xZtkYQ8yUpAyb8n88kqUXIUxRbIZWz/HyW66o77MHzTIUZf7zFbfVMnoZD3Xf0S6HXgsSJGCK/F52ny/BefnLWfYjd81Ru9Qb87Qqjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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

T24gV2VkLCAyMDI2LTA1LTA2IGF0IDExOjMxIC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEZyb206IGd0YSA8Z3RhQERVVDQ2MzdOVkxQLmZtLmludGVsLmNvbT4KPiAK
PiBJbiBtdWx0aS1xdWV1ZSBjYXNlLCBDVFhfVElNRVNUQU1QIHJlZ2lzdGVyIGRvZXMgbm90Cj4g
cHJvdmlkZSB0aGUgcnVubmluZyB0aW1lIG9mIGluZGl2aWR1YWwgcXVldWVzIG9mIGEgZ3JvdXAu
Cj4gUHJvdmlkZSB0aGUgb3B0aW9uIGZvciBzcGlubmVyIHRvIHJlYWQgdGltZXN0YW1wIGZyb20g
dGhlCj4gUVVFVUVfVElNRVNUQU1QIHJlZ2lzdGVycyBpbnN0ZWFkIHdoaWNoIGlzIHVzZWZ1bCBp
biB0aGUKPiBtdWx0aS1xdWV1ZSBzY2VuYXJpb3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5q
YW5hIFZpc2h3YW5hdGhhcHVyYQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNv
bT4KPiAtLS0KPiDCoGxpYi94ZS94ZV9zcGluLmMgfCA5ICsrKysrLS0tLQo+IMKgbGliL3hlL3hl
X3NwaW4uaCB8IDIgKysKPiDCoDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfc3Bpbi5jIGIvbGliL3hlL3hl
X3NwaW4uYwo+IGluZGV4IDE0OTUyY2E5MGUuLjg3NDMxMDc4OTggMTAwNjQ0Cj4gLS0tIGEvbGli
L3hlL3hlX3NwaW4uYwo+ICsrKyBiL2xpYi94ZS94ZV9zcGluLmMKPiBAQCAtMjUsNyArMjUsOCBA
QAo+IMKgI2RlZmluZSBNSV9MUklfQ1NfTU1JT8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgKDEgPDwgMTkpCj4gwqAjZGVmaW5lIE1JX0xSUl9EU1RfQ1Nf
TU1JT8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgxIDw8IDE5KQo+
IMKgI2RlZmluZSBNSV9MUlJfU1JDX0NTX01NSU/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAoMSA8PCAxOCkKPiAtI2RlZmluZSBDVFhfVElNRVNUQU1QIDB4M2E4Cj4g
KyNkZWZpbmUgQ1RYX1RJTUVTVEFNUMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgzYTgKPiArI2RlZmlu
ZSBRVUVVRV9USU1FU1RBTVDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4NGMwCj4g
wqAjZGVmaW5lIENTX0dQUih4KSAoMHg2MDAgKyA4ICogKHgpKQo+IMKgCj4gwqBlbnVtIHsgU1RB
UlRfVFMsIE5PV19UUyB9Owo+IEBAIC02Nyw3ICs2OCw3IEBAIHZvaWQgeGVfc3Bpbl9pbml0KHN0
cnVjdCB4ZV9zcGluICpzcGluLCBzdHJ1Y3QKPiB4ZV9zcGluX29wdHMgKm9wdHMpCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFtiKytdID0gQ1NfR1BSKFNUQVJU
X1RTKSArIDQ7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFti
KytdID0gMDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJhdGNoW2Ir
K10gPSBNSV9MT0FEX1JFR0lTVEVSX1JFRyB8Cj4gTUlfTFJSX0RTVF9DU19NTUlPIHwgTUlfTFJS
X1NSQ19DU19NTUlPOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRj
aFtiKytdID0gQ1RYX1RJTUVTVEFNUDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
c3Bpbi0+YmF0Y2hbYisrXSA9IG9wdHMtPnVzZV9xdWV1ZV90aW1lc3RhbXAgPwo+IFFVRVVFX1RJ
TUVTVEFNUCA6IENUWF9USU1FU1RBTVA7CgpJIHNlZSBpbiBbMV0gd2UgYXJlIHByb2dyYW1taW5n
IHRoaXMgcmVnaXN0ZXIgaW4gdGhlIHJpbmcgYWxzby4gV2lsbAp0aGlzIGNhdXNlIGlzc3VlcyBp
ZiB3ZSBvdmVyd3JpdGUgdGhpcyBoZXJlPyBJIHNlZSB3ZSBkbyB0aGUgc2FtZSB0aGluZwpmb3Ig
dGhlIGNvbnRleHQgdGltZXN0YW1wLCBzbyBwcm9iYWJseSBubyBpc3N1ZSBoZXJlLiBCdXQgaXQg
d291bGQgYmUKbmljZSB0byBkb2N1bWVudCBzb21laG93IHRoZSBleHBlY3RlZCBpbnRlcmFjdGlv
biBiZXR3ZWVuIHRoZSBrZXJuZWwKcmluZyBwcm9ncmFtbWluZyBhbmQgdGhlIHVzZXIgYmF0Y2gg
cHJvZ3JhbW1pbmcgaWYgYW55LgoKWzFdOgpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvNzIzNTAyLz9zZXJpZXM9MTY0NjU0JnJldj01Cgo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IENTX0dQUihTVEFSVF9UUyk7Cj4gwqDC
oMKgwqDCoMKgwqDCoH0KPiDCoAo+IEBAIC04Myw3ICs4NCw3IEBAIHZvaWQgeGVfc3Bpbl9pbml0
KHN0cnVjdCB4ZV9zcGluICpzcGluLCBzdHJ1Y3QKPiB4ZV9zcGluX29wdHMgKm9wdHMpCj4gwqAK
PiDCoMKgwqDCoMKgwqDCoMKgaWYgKG9wdHMtPndyaXRlX3RpbWVzdGFtcCkgewo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IE1JX0xPQURfUkVHSVNU
RVJfUkVHIHwKPiBNSV9MUlJfRFNUX0NTX01NSU8gfCBNSV9MUlJfU1JDX0NTX01NSU87Cj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJhdGNoW2IrK10gPSBDVFhfVElNRVNU
QU1QOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFtiKytdID0g
b3B0cy0+dXNlX3F1ZXVlX3RpbWVzdGFtcCA/Cj4gUVVFVUVfVElNRVNUQU1QIDogQ1RYX1RJTUVT
VEFNUDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJhdGNoW2IrK10g
PSBDU19HUFIoTk9XX1RTKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
c3Bpbi0+YmF0Y2hbYisrXSA9IE1JX1NUT1JFX1JFR0lTVEVSX01FTV9HRU44IHwKPiBNSV9TUk1f
Q1NfTU1JTzsKPiBAQCAtOTcsNyArOTgsNyBAQCB2b2lkIHhlX3NwaW5faW5pdChzdHJ1Y3QgeGVf
c3BpbiAqc3Bpbiwgc3RydWN0Cj4geGVfc3Bpbl9vcHRzICpvcHRzKQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IENTX0dQUihOT1dfVFMpICsgNDsK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJhdGNoW2IrK10gPSAwOwo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IE1JX0xP
QURfUkVHSVNURVJfUkVHIHwKPiBNSV9MUlJfRFNUX0NTX01NSU8gfCBNSV9MUlJfU1JDX0NTX01N
SU87Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJhdGNoW2IrK10gPSBD
VFhfVElNRVNUQU1QOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRj
aFtiKytdID0gb3B0cy0+dXNlX3F1ZXVlX3RpbWVzdGFtcCA/Cj4gUVVFVUVfVElNRVNUQU1QIDog
Q1RYX1RJTUVTVEFNUDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJh
dGNoW2IrK10gPSBDU19HUFIoTk9XX1RTKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLyogZGVsdGEgPSBub3cgLSBzdGFydDsgaW52ZXJ0ZWQgdG8gbWF0Y2ggQ09ORF9C
QkUgKi8KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX3NwaW4uaCBiL2xpYi94ZS94ZV9zcGluLmgK
PiBpbmRleCBkYjBmZWJkOGFiLi43NWE2YWRhNDIwIDEwMDY0NAo+IC0tLSBhL2xpYi94ZS94ZV9z
cGluLmgKPiArKysgYi9saWIveGUveGVfc3Bpbi5oCj4gQEAgLTUxLDYgKzUxLDcgQEAgc3RydWN0
IHhlX3NwaW5fbWVtX2NvcHkgewo+IMKgICogQG11bHRpX3F1ZXVlX3N3aXRjaF9vbl93YWl0OiBB
ZGQgYSBTRU1BUEhPUkVfV0FJVCBtdWx0aS1xdWV1ZQo+IHN3aXRjaCBwb2ludAo+IMKgICogYW5k
IGhhdmUgdGhlIHF1ZXVlIHN3aXRjaCBvbmx5IGhhcHBlbiBpZiB3YWl0aW5nIG9uIHRoZQo+IHNl
bWFwaG9yZS4KPiDCoCAqIEBjdHhfdGlja3M6IG51bWJlciBvZiB0aWNrcyBhZnRlciB3aGljaCBz
cGlubmVyIGlzIHN0b3BwZWQsCj4gYXBwbGllZCBpZiA+IDAKPiArICogQHVzZV9xdWV1ZV90aW1l
c3RhbXA6IFVzZSBRVUVVRV9USU1FU1RBTVAgcmVnaXN0ZXIgaW5zdGVhZCBvZgo+IENUWF9USU1F
U1RBTVAKPiDCoCAqIEBtZW1fY29weTogY29udGFpbmVyIG9mIG9iamVjdHMgdXNlZCBmb3IgbWVt
b3J5IGNvcHkgKG9wdGlvbmFsKQo+IMKgICoKPiDCoCAqIFVzZWQgdG8gaW5pdGlhbGl6ZSBzdHJ1
Y3QgeGVfc3BpbiBzcGlubmVyIGJlaGF2aW9yLgo+IEBAIC02Miw2ICs2Myw3IEBAIHN0cnVjdCB4
ZV9zcGluX29wdHMgewo+IMKgwqDCoMKgwqDCoMKgwqBib29sIG11bHRpX3F1ZXVlX3N3aXRjaF9v
bl93YWl0Owo+IMKgwqDCoMKgwqDCoMKgwqB1aW50MzJfdCBjdHhfdGlja3M7Cj4gwqDCoMKgwqDC
oMKgwqDCoGJvb2wgd3JpdGVfdGltZXN0YW1wOwo+ICvCoMKgwqDCoMKgwqDCoGJvb2wgdXNlX3F1
ZXVlX3RpbWVzdGFtcDsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3NwaW5fbWVtX2NvcHkg
Km1lbV9jb3B5Owo+IMKgfTsKPiDCoAoK
