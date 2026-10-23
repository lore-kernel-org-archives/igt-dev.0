Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D0D606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 05:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UIU07LoT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3876112964;
	Fri, 23 Oct 2026 05:02:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8981E10E00B
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 05:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792731712; x=1824267712;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pd+Ns92nwA+l/xGEwrtYMaIyQ9wtDglXzu7bWHgov2U=;
 b=UIU07LoTJde9cmvKTIxWBXCpYG4D9akotneESqpONXplIjVuVwB+e6bw
 fJlir7g32gKX3qaQj2QSwqHwBxYsf4e+3QDBnr6ecoYqjYJ+qXgr6b3my
 EZCGqwiWSzCOjqAdRZgV1kGZf/GNlgj0m6DBxsxgykIWjyBh8JyOlXsPj
 9rlBOzTPB2tto54YKhpf2Ff/kC6u3ZIO11SkiWaddMNycbHnMPzVFMMxW
 qyMeH5PzPXU3L7hDt3FA9SpV8pWb7Zuo8lOTxGvMqKCXLgFpbeboBZU3G
 VyVjdnYbV4OTpfIV2pZCXjA21p+Pvqk9J16BUA3uLVbOZU5/H3EM4LRKG A==;
X-CSE-ConnectionGUID: hH2Q+R8wSN2yBtuNHdHkGg==
X-CSE-MsgGUID: nKJsTHmYRJeKCQWKS+kzHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1504227"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1504227"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:01:51 -0700
X-CSE-ConnectionGUID: u8/5oZA/S7iGf0XRJ812Ew==
X-CSE-MsgGUID: Vbq+w9OITHCekj056niM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3869241"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:01:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:01:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 22:01:50 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:01:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nc3HUUHGZaudCm8Nutcm7mg6WBCcx7BbgjjRWx7zjgrBwUtntMAFbV1qSEeouGVREXf1lswTD3pDsuZCkifmB8nCYKj4o0+9YlA76JYKoz5cpUVgnvC4EDDrKP5lCpX4O9WqRxZLUX6ciTKZBuAQ0sDvI3Hd3XmqW8ACY99M/5cl6XVekIbvZU6c8dKCxMazix1Iet438USDT+GFbl0Njuhjj6Deb7F4eR8bh3IwwhOAo5aSd9CvnmJGhbKZVgUmlPgEol5dMISKR2LHP3xDVzdYLsBVh/Biumq9QsPszHD1PgHd6R5kUz45Fd3Ay06mI6RYQ03QsoGrwM3PMkUYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pd+Ns92nwA+l/xGEwrtYMaIyQ9wtDglXzu7bWHgov2U=;
 b=KidpTGhjOXkcn/qzvreTacyyWKvgt2FVplqk7CqzMO4U7BhAasBhrEkKdxxKqmQxYpXGLigUvmohN2f68Ouu3TAJRCOk8DNwBWQZYv9jDDPVuoB0t68yLGvUH9wtGjYoDJGXyIO8V5JBxh88A3WA0FNDST3fpobd8X5rs5i6fZLAdvwl/Zt88aO8YAShOQ1IrO4i+r5LuLEdmNcaNenRtYj1g0J7gGn5HNdo8K+rOB8HoRUMx6eo3R4p48BET9316dEy1T75LCxzVhPWh5Hhjl9OVNrEIS4DAS1OnGKe5Nlp07IzwKGqMZLg097rnWAA+WdAd9IaDpYfxrtHsYXfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 05:01:43 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 05:01:42 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>, "Grzelak, Michal" <michal.grzelak@intel.com>, "B, 
 Jeevan" <jeevan.b@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
Thread-Topic: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
Thread-Index: AQHdXLEgCFqiRnT7fU2fAHDjEvV8vrcKm8cA
Date: Fri, 23 Oct 2026 05:01:42 +0000
Message-ID: <BL1PR11MB5413188823D4E12C92070E0FE2642@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20261015140035.2686997-1-chaitanya.kumar.borah@intel.com>
 <20261015140035.2686997-3-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261015140035.2686997-3-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|DS0PR11MB6421:EE_
x-ms-office365-filtering-correlation-id: 49ea9cd7-1122-420f-dcb7-08df30c2bb03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|261022105027099003|56012099006|38070700021|11063799006|5023799004|4143699003|261021123027099003|261021121427099003|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: OTKb8O6o/EziGQzaHGHb2rnKHkbAv1ji7Ybt0d0DkMq4pM8VDeBAvCmO44XS4D/GUAT0zn5sFyyLMI6cqAuOUl2Vnq2CX27xPEHQ7z68gtB0KoZPqVQvaK6cL3Db1QEUDmOg3+kkrkM2guMZ22K3MIT6a2GyTrehKdRiWxerklg1fjVBvXPA6Rm9zcOysc0zMfnRytjMTagP5DExC/99WLGsP52GniOiYndkbw+aKaieZbyWptLsOzzwyH32FpZYR9hpsFmgbkCqfXiZO8NtLP66goaSspJfEEBpaGHM0LK/5TMCHLt2ORPv391n8K0BXN4vyO6QAWnbg05lfZhN3PA3jNNYGPTCpM2bxexsmGp+F+nYYhwIBiTc9eVd7wb4QJ4a/eTAMMdTlIIFnVVINQT8oZkvP1A/+f3SuqaFoSbfff4N0SROGCDYrtUW+kCYmgjlRTS0EmFMJ7LbL13Ktk1uiy9/jzxlpxGYYKJEZj7lf/DitvxkLKfm44E7dU4zTYRvDlOp1Sz1y87H6IOQCrEoYF33pQk0f9axqvjsp6RD11SHlozgdS3X1aIXvDm1fBECSAE+DlzI2btWgHBJzGDEuC233lzkj7O/WyI6x2YQQTCWShUhRWpe4lvPBtABR13AGP+5B6ZSElJHgavJbDQhxRqR+JGZ3r/C5sANKpEQWxWYRW3dBjD/v7Z6nRw519pPx1BatOTUnOQ9P8gDejoKFuNhkTjeE/jS0rQZbqs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261022105027099003)(56012099006)(38070700021)(11063799006)(5023799004)(4143699003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzVqamxyTzBJYnJQdUlaa2p4QW1jM01lYUR1cjBEc3ZKaHZiSW8rUnpMeWlq?=
 =?utf-8?B?dkhZdFZSRFQ5TkhzVTRaZkRkNy9CbFR3cDl2c1cwNkxFcW9lKzhQUDB2MVl1?=
 =?utf-8?B?NDI4VTFxa1RuZ21nc3FMb1pTdm5ac2dpM1BWc1A1ZHFFeWFab1lGZGJkemZo?=
 =?utf-8?B?NlRlZWVUV3M2dVhMNWJlYmFOTS9TTDVHZ2luNjBtNFNVcXBKQmphVEsrYjlE?=
 =?utf-8?B?eEsyTnY4UWZEbUFvTEpySDMvVHZaOFFHSDEzK2NCb3RPK0FnOCtjM0FtRVEv?=
 =?utf-8?B?SHQrTkZlWGNSdUxKcTNvZjJvSGtMQ1l2ck5pUE1nVC92M2dEbkdoeG9rczR3?=
 =?utf-8?B?TkRqOTZMRkQwM0xjdlhHdDM5bnNQOXlzRGFMYUdEcy9oQzB0NXVRN2V6TzhV?=
 =?utf-8?B?cDU0S2RPQUlQbmxzOFJmSldwbFFWMnpQSmFZT1JRNE0zajc4cHZocnR0MFpv?=
 =?utf-8?B?QzVUVXBRSU5ieDV3UTQ2bGN0WnNmS2hNT3JqY0l3WEEzT0V6U2FxWlV6czZO?=
 =?utf-8?B?VmNWTVdRaTBha2p6VzVsR2Y2ai9DNkJXZWxFa3BZdm1aMDQ0RFJ3UnpzZXI2?=
 =?utf-8?B?cGhNVFpoM0VqSUZwQUxJaTh1TVlIbUdNS0lYSi82enR3Y3ZXcGs0aUxqakNk?=
 =?utf-8?B?c01tOUVyYi9mZ0tJOHlyK1IrNHlmR0NtRktIeGZKeFFEeC9YMy9hRzFKbncy?=
 =?utf-8?B?MjBJWjRLbkZ3UVAvSDlseUZKalBKVkgvUTl1enpSS3JwdkdNT25iWG9KbkpK?=
 =?utf-8?B?RkdNYi92Ykk2Y2E4UjlaNkJvc0Z0YVpFUFhXNGlCZFB5UEFxZUJyNGJyaVhj?=
 =?utf-8?B?VGNGYTJXYmVDaHUwZVB4dWhoVnc5L0lKQVBESmo3a0RpWDRjN09BY1dkR1Y2?=
 =?utf-8?B?TXZaUEhyU0FuQzBOaFZEc3BLYzdJaUpBNkJDVitlOENvZlVNRVZvNzNtY0gw?=
 =?utf-8?B?aW1ndXcvVjZQWldUMzFQQUdKR1ZjbzQxcjJxdG01MGhoaWt2T3plMWdyU08x?=
 =?utf-8?B?TnU0S2dXQkE5MUcvS1kxZFFGVmpBemRCaUN1V3NWTWducEk3bG9UbExKeURm?=
 =?utf-8?B?YnRqemd5SG1CQTM3Vzc4dmthWXpTTnliTWZKV1lVUzIrTG85bzM5NjNEaFpa?=
 =?utf-8?B?eWNuOTdWaHJXODNLbE8raW4wNzJsa0I3dGlRM2d3SXJSV1NZMWQ3LzVHNTJo?=
 =?utf-8?B?RkdEYTZpekh6UDJCcE1Ea3ZqMmpqWnNicDdGUkl1bWdaT1ozOUhMbFdOTXNw?=
 =?utf-8?B?SGRnUnF2UmUvK0R1aXF2cXVlTVE3ZC81RTdCM0FaUTN3c3V6ZG9oUUZLbFp5?=
 =?utf-8?B?VHVQcW5wcDZEK0RkbGZqOHg3V3o3ajhBY0dkNVZINkhLcHYwdXNnN0hYYlZq?=
 =?utf-8?B?MXV3elBldlFwQUd1dXlacjFqMzNnQzVTSVZVV0lPWG9tVEJNNmpZVU9pTEpG?=
 =?utf-8?B?T2JJSWZXMTJjVU5rNlZpTjRvNGl1UkVhUHhyYTNwUmNBeHQvUHJhQ1RnbDBF?=
 =?utf-8?B?TmJqcHB5ZWh1ZGNHaUx0cUJRZFNQR1QwMmlvS2prY0tidFZnMEQ2eitaVVhs?=
 =?utf-8?B?dW9iYW5Tajd0VFJWc1A0SUN2ME00RWt1UmJHbDBJUEtXQXhaN0o3VXJqVm81?=
 =?utf-8?B?eXBIckpOa20zdDVSN04yWlB1aFNIalVheEdjbVJOMWNkdzhBazZlbVEwNFp3?=
 =?utf-8?B?OEVlVTk4MERCbWtucmRaWTJUaHVSbmtBMTNLNER0UW9FeVQ1eGJGUzJKVUZw?=
 =?utf-8?B?S0QwSit2WDNHSy9ENTlEanlvZGdEcTNSOW1HSkRWdjNadGlwOVRoUFBueWI0?=
 =?utf-8?B?QXpSSVFXOFRKMCtzZStKbnFoamZja2V5QWZ4em9UVkdHaktNSjc3clJFazBN?=
 =?utf-8?B?bmZOYy9yY1I4SjBTcEFiUmRpdUJncDVoTXhHRTN4MzV2QVVPZnJpdFllTHRm?=
 =?utf-8?B?Rjh4ZnplOTR6ZWpPZVJWL1kwVkhuWjM2WnhJWmtGRStMZkdIZHh5RTh5UUdP?=
 =?utf-8?B?ZDExWGRDVFdEdWY2eS8wVjVOZU1XVk1taU9sTklFUG5ZcEdtVkNqNk45eEpT?=
 =?utf-8?B?czcxSkZPZW9TNmcwcEFRbmpENm0wN2dnVlc3Q0lzZDYvc0tnN3JTSUhPcE85?=
 =?utf-8?B?YzQvRy82b2doeVVmcjNVTFJTdXlDMjl3b3h0T0FSRTAwM0ZONGg4Y3pQMDRI?=
 =?utf-8?B?dGdRQmZCb2VrbEc0alpuclZ4ZGNEMHhjdGExRVV6VmU3aXM1dFdXOEJicTd5?=
 =?utf-8?B?eUVFZFhETDhFemRoQ1BRUXUycmVmVE1LeDNZek9aYVhYL0UvMitiWDJuQlZh?=
 =?utf-8?B?N1c2bXdneHMyVHczci80TzZub0xlUFhFellDeE5GSU9MbFJmbjlsa0F5TUpO?=
 =?utf-8?Q?pdRKqkHiiJF9ESAE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AAruTypR7/DhwEm5UoaG0iqJUe5/FaxWE6q9d5o8GkcomIcORDoUEgkZvTUAjteRwe9ULA1HoZaNG3F8GbKdneSltKHO2xqWcfAWsWNNui96845v0lY/cJnYLZOtexvUxQcqfoqgIGMubMZ94d01UHM2GzAi53Hym1pd7cfVUc9WTquWiCbcT49L7SskwqC4SnV9wzCgJQxuN4kFDzZKWw4ewqZEjvLN/QV3cpRCGvEibs+cWixIlpk37xk5tGZ9ukT6BKTZeR77wMDKQzxp6Gsjv7rKHSGKt3s0sZdrW2BCAl1YyaE1quQOVcwDHv9pe3EDzTqK3RkidbIqWi4Rlw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ea9cd7-1122-420f-dcb7-08df30c2bb03
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 05:01:42.8668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eH/zdbVe2b7BZnQL9Fpq+DW8T19eJD3Ctr9Q/dSJdKr666CdA4+/y71aVDARdD2ZAsFslgzuw6WpFC2YgfqkuKRZS7jeVliNJ9kPKRvz8Jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIENoYWl0YW55YQ0K
PiBLdW1hciBCb3JhaA0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxNSwgMjAyNiA3OjMxIFBN
DQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQm9yYWgsIENoYWl0
YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IEFuaXJiYW4sIFNr
DQo+IDxzay5hbmlyYmFuQGludGVsLmNvbT47IEdyemVsYWssIE1pY2hhbCA8bWljaGFsLmdyemVs
YWtAaW50ZWwuY29tPjsgQiwgSmVldmFuDQo+IDxqZWV2YW4uYkBpbnRlbC5jb20+OyBTaGFybWEs
IFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWct
dCAzLzNdIHRlc3RzL2ludGVsL3hlX3N1cnZpdmFiaWxpdHk6IFJlbG9hZCBhdWRpbyBkcml2ZXIg
b24gZXhpdA0KPiANCj4gQ29tbWl0IDExN2U5ZWNiZGQxZCAoInhlL2lndF9rbW9kX3VuYmluZDog
cmVsZWFzZSBhdWRpbyBiZWZvcmUgdW5iaW5kaW5nDQo+IHhlIikgbWFkZSBpZ3RfYXVkaW9fZHJp
dmVyX3VubG9hZCgpIGJlIGNhbGxlZCBiZWZvcmUgdW5iaW5kaW5nIHhlIHRvIGF2b2lkIHRoZQ0K
PiBhdWRpby1jb21wb25lbnQgYmluZCB3YXJuaW5ncy9lcnJvcnMgdGhhdCBoYXBwZW4gaWYgeGUg
aXMgdW5ib3VuZCB3aGlsZQ0KPiBzbmRfaGRhX2ludGVsIGlzIHN0aWxsIGF0dGFjaGVkLiBCb3Ro
IGNhbGwgc2l0ZXMgaW4gdGhpcyBmaWxlIHBhc3NlZCBOVUxMIGZvciB0aGUNCj4gdW5sb2FkZWQg
ZHJpdmVyIG5hbWUsIHNvIGl0IHdhcyBuZXZlciB0cmFja2VkLCBhbmQgbm90aGluZyBldmVyIHJl
bG9hZGVkIGl0DQo+IGFmdGVyd2FyZHMuDQo+IA0KPiBBcyBhIHJlc3VsdCBzbmRfaGRhX2ludGVs
L3NuZF9oZG1pX2xwZV9hdWRpbyBpcyBsZWZ0IHVubG9hZGVkIGZvciB0aGUgcmVzdCBvZiB0aGUN
Cj4gYm9vdCBldmVuIHdoZW4gZXZlcnkgc3VidGVzdCBwYXNzZXMsIHNpbmNlIHhlIGFsd2F5cyBl
bmRzIHVwIHJlYm91bmQgYnkNCj4gcmVzdG9yZSgpIGJ1dCBhdWRpbyBuZXZlciBkb2VzLg0KPiAN
Cj4gQ2FwdHVyZSB0aGUgdW5sb2FkZWQgZHJpdmVyIG5hbWUgYW5kIHJlbG9hZCBpdCB3aGVyZXZl
ciB4ZSBnZXRzIGJvdW5kIGFnYWluIGluDQo+IHJlc3RvcmUoKS4NCj4gDQo+IENjOiBTayBBbmly
YmFuIDxzay5hbmlyYmFuQGludGVsLmNvbT4NCj4gQ2M6IE1pY2hhxYIgR3J6ZWxhayA8bWljaGFs
LmdyemVsYWtAaW50ZWwuY29tPg0KPiBDYzogSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4N
Cj4gQ2M6IFN3YXRpIFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IENoYWl0YW55YSBLdW1hciBCb3JhaCA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVs
LmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMgfCAxMSArKysr
KysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMgYi90
ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMgaW5kZXgNCj4gYmFlOWVjYTI3Li4yYmU4ZTll
YzAgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3N1cnZpdmFiaWxpdHkuYw0KPiArKysg
Yi90ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMNCj4gQEAgLTM5LDYgKzM5LDcgQEANCj4g
ICAqLw0KPiANCj4gIHN0YXRpYyBjaGFyIGJ1c19hZGRyW05BTUVfTUFYXTsNCj4gK3N0YXRpYyBj
aGFyICpzbmRfZHJpdmVyOw0KPiANCj4gIHN0YXRpYyB2b2lkIGlnbm9yZV93ZWRnZWRfaW5fZG1l
c2codm9pZCkgIHsgQEAgLTE1OCw3ICsxNTksNyBAQCBzdGF0aWMgdm9pZA0KPiByZXN0b3JlKGlu
dCBzaWcpICB7DQo+ICAJaW50IGNvbmZpZ2ZzX2ZkOw0KPiANCj4gLQlpZ3RfYXVkaW9fZHJpdmVy
X3VubG9hZChOVUxMKTsNCj4gKwlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZCgmc25kX2RyaXZlcik7
DQo+ICAJaWd0X2ttb2RfdW5iaW5kKCJ4ZSIsIGJ1c19hZGRyKTsNCj4gDQo+ICAJY29uZmlnZnNf
ZmQgPSBpZ3RfY29uZmlnZnNfb3BlbigieGUiKTsgQEAgLTE2NywxMSArMTY4LDE3IEBAIHN0YXRp
Yw0KPiB2b2lkIHJlc3RvcmUoaW50IHNpZykNCj4gIAljbG9zZShjb25maWdmc19mZCk7DQo+IA0K
PiAgCWlndF9rbW9kX2JpbmQoInhlIiwgYnVzX2FkZHIpOw0KPiArDQo+ICsJaWYgKHNuZF9kcml2
ZXIpIHsNCj4gKwkJaWd0X2ttb2RfbG9hZChzbmRfZHJpdmVyLCBOVUxMKTsNCkhlbGxvIENoYWl0
YW55YSwgDQoNCldvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGhhdmUgYSBoZWxwZXIgbGlrZSBpZ3Rf
YXVkaW9fZHJpdmVyX2xvYWQoKSwgc28gd2UgZG9uJ3QgaGF2ZSB0byBtYWludGFpbiB0aGUgZHJp
dmVyJ3MgbmFtZSBpbiBtdWx0aXBsZSBmaWxlcyA/DQogDQpCciwNCkRueWFuZXNod2FyDQo+ICsJ
CWZyZWUoc25kX2RyaXZlcik7DQo+ICsJCXNuZF9kcml2ZXIgPSBOVUxMOw0KPiArCX0NCj4gIH0N
Cj4gDQo+ICBzdGF0aWMgdm9pZCBzZXRfc3Vydml2YWJpbGl0eV9tb2RlKGludCBjb25maWdmc19k
ZXZpY2VfZmQsIGJvb2wgdmFsdWUpICB7DQo+IC0JaWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQoTlVM
TCk7DQo+ICsJaWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQoJnNuZF9kcml2ZXIpOw0KPiAgCWlndF9r
bW9kX3VuYmluZCgieGUiLCBidXNfYWRkcik7DQo+ICAJaWd0X3N5c2ZzX3NldF9ib29sZWFuKGNv
bmZpZ2ZzX2RldmljZV9mZCwgInN1cnZpdmFiaWxpdHlfbW9kZSIsIHZhbHVlKTsNCj4gIAlpZ3Rf
a21vZF9iaW5kKCJ4ZSIsIGJ1c19hZGRyKTsNCj4gLS0NCj4gMi41MC4xDQoNCg==
