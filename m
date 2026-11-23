Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C472606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EQLpiJQC;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=A+LuoKsT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E754410E4BE;
	Mon, 23 Nov 2026 16:08:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE1710EEE5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795450032; x=1826986032;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VzaRZtDxOQHrFea7O9mNtjO21Zij+U1PDRN8XFfBVDE=;
 b=EQLpiJQC8nZ1eYRpJHtWdbyCichFZICr0IqPFPo//x4Bc9QVjoNvFKMv
 zjaw7Q64Ki/IHWlAVyYxLD5rtAk6xpvQ+tu68od4liUl3x4H3rjOBkDDB
 3JyWw8gtawMiufalP9bOEZ9qqEuUYXp8c1c0K85bFkLnXuxc1AR+b52hl
 WhgK3NOQ9NsQBUuu11nVe8HOtzLhsS75+6vFqbKglVbyknGpd48RO9Rou
 fRbb9/bixrJiyiWTLJtCGAkR7tBjZsuMUc3WXiyQWX7+KE+LvKBKsrOix
 ASO5NNehEW17/MjnpiaddIZi/nHsNZC0yhdVdBfpm1u+qtkrORfYEd7xg A==;
X-CSE-ConnectionGUID: rnE5toWKTCWOI1YKEHtiyw==
X-CSE-MsgGUID: 8AQwr2dLT2eC54JDSrBWtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4150964"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4150964"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 08:07:10 -0800
X-CSE-ConnectionGUID: Y8ahC3AfTOmRKEt1LHtHMg==
X-CSE-MsgGUID: mBymHojaSIONPbOJ4H2NDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11892810"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 08:07:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 08:07:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 08:07:04 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 08:07:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahjqEqP7vGAc/coCWSVkt+8X+LMfjJNunitYrMYCzp5AIubIRKm3DyG+WsErYdfcz58mkdSUbHLLVMS7s2vg4mvRzw+uUNz8sjxq06p63Kf335mPKdNNa3Cd29xRQJlsBt3cf15gt0J5fB3k/+gtDOrfaXQ18dimSBPLZdQDoaHuF634x4LKdBfIOcz4IuRlN5ppZoHBp6u4L+MD9vA7OC7sy2W/VxVmcyldzpcIrSjF98AG82FGSAZZmWQEN14m/t6Gw1B2J+6Fxgc9k22ptcj99g4WfuvQRqH8W57Ics1i6bHd/UH5KjW5d6lQFKVchcgZfDAGljnWA2YvX90NOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzaRZtDxOQHrFea7O9mNtjO21Zij+U1PDRN8XFfBVDE=;
 b=YmnNUQiwH5bL7Ari09ERxywaeIvH+Hm4BhzpJ9HQVVbhZ019+ry2pdLXs6ptUegpzh2Tg6wwca6ugWECbhGKiZov7CFlOpNrbbT54kDAqZK3c01ZY5RiVUgmQ/Mn/+KHvaB+ffishKOPMsALAIaHKyds7Ii3oQyC2bziB7ziF6iJIvZKOM8zLWVMyCq1jij1UQL1kp0ncpMhdgg6DoU1LQg+DbyqTVT975KYH/rX8J87K9g25WGgTHgp6vK/NdDEQUu6wIswmloKmgcHGnXXmm8/RC2oEkbg0/VgjMbFmE1dyHn/6E1opfPCInxIN+b1ungtCOlYz/q7ud3S67xRiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzaRZtDxOQHrFea7O9mNtjO21Zij+U1PDRN8XFfBVDE=;
 b=A+LuoKsTiNBmC7AuK5gIhj/14YBLSk8hJp2CXYQec7Za5FDG7CXYNT43rLkSNnw+9L8zjCfgJLmxdGUmjv7RhEJsUHu8ZT6CvCaP3hSsuOBWO0QPdPOyVnjgIdN4PTcLYx/2G93yKvtE7zl2a8ei7eHcC9UMUKlHANRk76phbkE=
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by LV2PR11MB9597.namprd11.prod.outlook.com (2603:10b6:408:379::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 16:07:01 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%7]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 16:07:01 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "contact@emersion.fr" <contact@emersion.fr>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nikula,
 Jani" <jani.nikula@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>, "gildekel@google.com"
 <gildekel@google.com>, "markyacoub@google.com" <markyacoub@google.com>
Subject: Re: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
Thread-Topic: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
Thread-Index: AQHde0lw3+lEOqXxXEKlUBY0kZ8207c7wQYAgAAA4wCAABDagA==
Date: Mon, 23 Nov 2026 16:07:01 +0000
Message-ID: <d513043d046bcf2b2d7bbd788aee4caa350a1156.camel@intel.com>
References: <20261121115236.124211-1-contact@emersion.fr>
 <no3gurwcnsisfnjvfezh4xub7a6b3jw4wyxjyl4h5wr5rraq6p@gfmxhhez5xm2>
 <6369f30cf5d7dc9346589d34fe3e3c6bcaa41cbd.camel@intel.com>
 <_AyHlId1OFTsoV5vKPYws3tD9Eby8_rd9Jho0Sqiae49jcQKNbgWnkdSdJKbzix-27LaZzQMdQR3hHeLo0ICb9ZQXnuR6M8f9yVmDxDA66s=@emersion.fr>
In-Reply-To: <_AyHlId1OFTsoV5vKPYws3tD9Eby8_rd9Jho0Sqiae49jcQKNbgWnkdSdJKbzix-27LaZzQMdQR3hHeLo0ICb9ZQXnuR6M8f9yVmDxDA66s=@emersion.fr>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|LV2PR11MB9597:EE_
x-ms-office365-filtering-correlation-id: 4df1175c-bac6-4f7b-6e77-08df497bcf03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|38070700021|56012099006|4143699003|10067099003|11063799006;
x-microsoft-antispam-message-info: suIN2+4Ab47EmOB9UWJAUoji/Dlk3TkWumRHrFiPmZf1xfNjoZd2G33RL0I+zfIsbBSs6vQxlG7iu638+mQ2dPauV5tUsVuPn5iEs7GJ+Tis0HgPPyQMr+0ymYFIMK6y9Ep2G0BkjHq1cEg2UR3BwwXT6cAYsLqpWQwvX8rrUMa8sPSkQl7ADzi6kEpNxM+ogqfYXhpilmMffHwA9+og8g8aczekdkQl4hjEs7xQ/0hx+MBqAwyK3o00ltN8GROrAXkk2jxi9EYj83kCYTbr17UssDeJvkBBEfajCXQrc6WA7F32Qv8irA4Q3W4C5ULM0Mqtp/M/f94LGllvG8U0+tl6lTN/MD3iyfUh9Z5XkMpa5vaSNJuSe8Uv4rACDUaGQtbRmlcG8nJ8DBEzXDmvoOiK45O5ZrcT5nMQPB6Je3okR6tYlaiND69QCZBx8JmJtyjxkcr6eO6K7MR/R/RxvPyf4MuzRjHxAd0g67jdVNoFnl5GzFSNQWeg7LPBUtjIG80UoTttboGi5iAMw60fmSLfWRfdqLmWDzd4ku4p0z7Vg5z0BRT9uG61FiGEm1EV+4oKviKqaDh7UsqkaCAonvVBvTY+VH3GSRbQgMxS0Q59tiv8ljCLdccRLz+KPJvjMK5zrOZmQ5qAm4hLlor59TzAJ4R2ffK8Lj6XzQQ1Um3H4vlFGk/SCZEoN0NmD0pPzTJe7D1KjDd+fjyYlWAXwfpcI4D+9pr6OpDoYwYqYsQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(38070700021)(56012099006)(4143699003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWtuTlFaNnBPSjMyNHlhakZxOHpRVThTWlI4UUlWaWRpVkNQTkhmR2QxZERW?=
 =?utf-8?B?MWZNRWlabUxPcGpqL3RCaXkvQkltQnEzaUNtTlkyenFqSSs2QjA3Z1puN2wz?=
 =?utf-8?B?UjFGaEo5NnFqYWo4Y3NuSXArTEV0VVhaWFpKczhFbE1ZS25uQ21mNUovN1Iy?=
 =?utf-8?B?SU9TQ0hzR2poS09nNXdaaW0yRVBEUXNqaHEreGZPZDBxYmZqVkJCT0VWNEdy?=
 =?utf-8?B?bkp2YXZMbEoxR0VUSnJ6dG4xVjhodWlmOGJlNldUR2lNcFlDRkh2Q25tSVdn?=
 =?utf-8?B?K2hKVXdHR3EzSVl2RHhzb1JIckp0bFJiT3B0REtiU095QjRtaG5oWGRMWjF4?=
 =?utf-8?B?cWF6NFNRZTRHdmhuTzlnQ1prTUxlK3NHZU1abzZreDQxNUpyS1VjaUhKbDFs?=
 =?utf-8?B?ZE43RGRmeDQ3Y2M4ektHWFlSbWI3TSt1bkwyTHpQUzNFUjBrcDJGVnhwbFFZ?=
 =?utf-8?B?alMwSFVJbS9wMlJsUjFsSjJ2RFZTcml5V2ZQaG1qWGl3b1JzY0hES01BYWx1?=
 =?utf-8?B?SmtCRnhFSldlQXYyTlRwYjBSd3hIUGhFVmtDSUxsdFIzbG5rcXkrUDFPaDJs?=
 =?utf-8?B?L3lqTlk4dlNOa3FMUncrL1E3cDhYeUsyNCtjaExoQ0ExNEhoMDh6RHRPbGpm?=
 =?utf-8?B?ODZMTVIrL1h3N0hVZytiU0lSancyOXNIak5kOWlvK1lYVzdwZFZxS08xbGQx?=
 =?utf-8?B?WDBFd0lBb0NLM2kvTkZMMnFNN09xUkRGQ055VlFQOENpYzQxU0Rua3IrbEdy?=
 =?utf-8?B?ZVZmN2JkeERhTUZYdjFIVU16MW1Lb3Z3bm5oK3p1T1hSaUpmY3hyTFVaTlQ4?=
 =?utf-8?B?aUo4bUs0ZjRsaTdSbWZQM0RPbWdEV0FRSG1JSDNsNjdtOTF1bnllbUVOeDh3?=
 =?utf-8?B?NkVhMFJLVVVzNjRiWGIrblNYOGxNaFFycnB2OC81cXZ6RU51emRpSWtkQmsw?=
 =?utf-8?B?RVU3QWNBRVBXS09ndytueitUcmpmVUlmYnhmT0JIeEtPZVBqNzFISjJkL0ZU?=
 =?utf-8?B?RnVFTUFWcVc1TmZSL0h4Z3Q5QlZZNW94dWJhRkJ1QXluSk11OWUrSjR4ekJ2?=
 =?utf-8?B?QjhFa01wUHVmdXN3QytFTmdQVzQxUXRNb0tldUxOUG9CMzNtT0RQQkVKamJD?=
 =?utf-8?B?MlNXS2lTL2ovMXJpZVMzT1c5T2MwZzMzVkphRkRHQ0dMSU5SU0w1OXJQWGs0?=
 =?utf-8?B?c1E3UDJUdjRHaTQwNTNJTGZJRkcwL2pYZ3I0ZGU0MHRSOVFyaVcyRFY1SnVS?=
 =?utf-8?B?K0NhV3lQVS9ORFJCd3R5eGFJNTlaOTAzckxEVWk5V1NPc1c1ZVVhUTUreHdz?=
 =?utf-8?B?eDdqRmFIRG5aQjRYSjU5clp5eHcwbkdPbHpwM2JsVmxCeCtIbzlqZXkwb2ow?=
 =?utf-8?B?KzlNZGlGaXVWREdHL1Q3YXVpRjdydVBDa1F4SlRyNnZUaGVNbkVFT2NMZVhM?=
 =?utf-8?B?VHFFWFJobEttemZCS08rR3N6RVRLdndPTWRNNnQrdDMvUm9ZSG80aTR5eWcx?=
 =?utf-8?B?VXFmWG9RcytEZnZUYjJEemJzWTgxbU9ZN0gxVm1SZFZXdXlsQ3pLV21mRUsx?=
 =?utf-8?B?SUVFK2RpUzBDUSs1N29jQlIxZlc5Z1NmNmNlN1Evcy9yVno4RC9TQUhhNXdV?=
 =?utf-8?B?TWhUMEloa3U5aFY4SDgzTEVhYTY0L0orWDF6bXREQmFXVHdWY1QvOG5HdFJm?=
 =?utf-8?B?a0h0dkVNVFpjVjNvNnJOOFkxTXFzVHJxUmFUczFVcjE4dk1wZVZzdDkzeFA3?=
 =?utf-8?B?UHl2SmQva3hIZzlvUzNVTytKSTlkK0hJanZ1VkdITTNIZlE4dm1XcVg1eXgw?=
 =?utf-8?B?WTBjaW9FWnFsYXgxdjdSdmN4TFgySnB1UElReWtqK3IvczQyTzNCYzM5TEkw?=
 =?utf-8?B?UFpSaVRFNitIVnU3NlVHYkZleEU4ZlAzVHRiU2c2c2RIaFMzdVVFNnQyTHZT?=
 =?utf-8?B?TzVGcDhqZW41b1dlRys0QUNzRTlGVWhLT21qMWExODJLNlozNTFWNmlKWHox?=
 =?utf-8?B?UHl4ZVNpNU42dFBOOFJQOEdDaW5wMWdxNVd1U3M3N2lBYU4ybXdDRm1ybkor?=
 =?utf-8?B?QWtOb21uMmxxRUYwbm9YM1AyNzFnWUpEUExJNE9SQXFNV3Z4UXprK0xjSnR5?=
 =?utf-8?B?TmlZa25KZHN0V3pPT014WU1JSlM5MU1WZDQ4cldzVFAxc1dtTG9zVlpkL0ZZ?=
 =?utf-8?B?S1VzOWRNUloxMFpObnRvbjRFYWdoM1ZNSGZ4a2s5OWFhYVFSQTJ5S21JeEtk?=
 =?utf-8?B?R2p1OTJjMmxtVHFpV3lUTFVYM1B0R1hGcERqdnhrdEdqLzA2U1RWaDI1VFd1?=
 =?utf-8?B?K25XTW1VVE5PemVFU1M2T2lrMXRERVNKUmlzRkUrcFZaeWdYV0tiSlJKVDQ4?=
 =?utf-8?Q?cVDhbkOqS+MKBVk0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3810A775461AB418AAC11B852A19B29@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CesSOblhYrkWZpVZQPk7y2quZJcuY2WsbJvARWCW7QmfxfJwuqdV/twt3szzmHYWoK/bZtyjmJS63hvdnFhRxOr7qm0eXL2V9r0qyuQgZPwoEdvUHTudpp+CQUYK7J5lBLmKbyo4Bek7RYK7mCY3GqUnhHBdWyiWdzg5HflPEsSjr+AxLYbfFLDwcysBLmr5t02s/YzahEjA3uWgCKoa4EfOVxIK8DQQvxTajJYRwGqLrhlYQuVD0bQ+I05lPAuoIl57HairwnqzFm/kk5JJZ7zOhI9LLzMAJc5qrn8HdlKA/CzruT1nenUiJq8PfCCjYDtJNitkSX2jGaoNrMOXgw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df1175c-bac6-4f7b-6e77-08df497bcf03
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 16:07:01.2429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JEljj24kLMLuakhoyWZI3acRLhJfeCG+dDV6O2Scdhwla1kQJ3JqhgZNxWlNwjhxRm6DjE1UU9rQr0qa9YY9sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9597
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCAyMDI2LTExLTIzIGF0IDE1OjA2ICswMDAwLCBTaW1vbiBTZXIgd3JvdGU6DQo+IE9u
IE1vbmRheSwgTm92ZW1iZXIgMjNyZCwgMjAyNiBhdCAxNjowMywgS25vcCwgUnlzemFyZCA8cnlz
emFyZC5rbm9wQGludGVsLmNvbT4gd3JvdGU6DQo+IA0KPiA+ID4gUGxlYXNlIHdhaXQgd2l0aCBt
ZXJnaW5nIGFzIG5vdyBpdCB3aWxsIG5vdCBidWlsZCBpbiBDSQ0KPiA+ID4gb24gVWJ1bnR1IDIw
LjA0IGFuZCAyMi4wNC4NCj4gPiANCj4gPiBIZXkgU2ltb24uIEludGVsIENJIHN0aWxsIHJ1bnMg
b24gVWJ1bnR1IDIwLzIyLjA0IGFuZCBSSEVMIDggd2hlcmUgd2UNCj4gPiBkb24ndCBoYXZlIHRo
ZXNlIGxpYnMgaW4gdGhlIHJlcG8gLSBjb3VsZCB5b3UgbWFrZSB0aGlzIGxpYiBvcHRpb25hbA0K
PiA+IGZvciBub3cgKG9sZCBpbXBsIGFuZCBuZXcgaWZkZWZlZCB3aXRoIEhBVkVfTElCRElTUExB
WV9JTkZPKT8NCj4gPiANCj4gPiBXZSB3aWxsIGxpa2VseSBkcm9wIGRpc3Ryb3Mgb2xkZXIgdGhh
biAyNC4wNC9SSEVMIDkgaW4gdGhlIG5lYXIgZnV0dXJlLA0KPiA+IGJ1dCBpdCdzIGEgcGFpbiB0
byBtYWludGFpbiBhIHNpbmdsZSBleHRlcm5hbCBsaWIgZm9yIHRob3NlIGRpc3Ryb3MgOjwNCj4g
DQo+IE1haW50YWluaW5nIHR3byBjb2RlcGF0aHMgaXMgYSBiaXQgb2YgYSBwYWluLiBDb3VsZCB3
ZSBpbnN0ZWFkIHVzZSBNZXNvbg0KPiBzdWJwcm9qZWN0cyBmb3IgdGhlc2Ugb2xkIGRpc3Ryb3M/
DQoNClRoYXQgYW5kIGEgR2l0IHN1Ym1vZHVsZT8gV29ya3MgZm9yIG1lLCBhbHRob3VnaCBtYWlu
dGFpbmluZyB0aGF0IGlzDQphbHNvIGEgYml0IHBhaW5mdWwuIElmIHlvdSBjYW4gZ2l2ZSBtZSBh
IGRheSBvciB0d28sIEknbSB0cnlpbmcgdG8NCmZpZ3VyZSBvdXQgaWYgdGhlcmUncyBhbnlvbmUg
d2hvIHN0aWxsIHJlYWxseSBuZWVkcyB0aGF0IDIwLjA0IGJ1aWxkLA0KbWF5YmUgaXQgY2FuIGJl
IGF2b2lkZWQgZW50aXJlbHkuDQoNClJ5c3phcmQNCg==
