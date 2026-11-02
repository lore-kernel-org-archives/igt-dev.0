Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DBC606A324
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 05:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T1OZM6uE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A621F10E1DE;
	Mon,  2 Nov 2026 05:28:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1602A10E1DE
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 05:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793597118; x=1825133118;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KHGj5+MukQSnvLjmg3n80/yuc9svdIzTBJztb61HFDs=;
 b=T1OZM6uECwB9SsgVQi2dLe39uXtoJVM3RlYFZ1A8oqSqx2E+WQbwtL0S
 w9EoS/eFOz5ZiR+WycsV7j5F/zx9Cjw+1/+cdIxbUM84jy5+PstL8/TqC
 eQSYQHu4WsP+BONpZWPNN3FKOzmgQt4XD9XcV89FTg6zer+VLD0YfDFMR
 Ly8wv2tXncO4tGt01dXJtRlZQh3DW/TbpU+tvVmrxqJWKR6szmoBqGvLk
 foRhLlkCnRltjLiSOAsKxulSV1eEPB77Ad7Zs/VHkedwkowSwRarSlFTU
 7/ZCsJ8JhiwyMfakyMLJFEGrXEoN+SsJjBgmcniSFFuvXeB4NN/73xJqv g==;
X-CSE-ConnectionGUID: 6XMCt3tqQ5WhYWsYEdAJoQ==
X-CSE-MsgGUID: 3JSX60iwSEKNqOYdI7jXAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2283638"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2283638"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 21:25:17 -0800
X-CSE-ConnectionGUID: GSqO0xXWQ2CSOZ56ffMivA==
X-CSE-MsgGUID: eFiw31RUS32iLJ9HCpw6/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5866435"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 21:25:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 21:25:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 1 Nov 2026 21:25:16 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 21:25:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EvWGXM51faMijz0ffH54N2dWMPMpuJMy7nuykdWll4+xdRAawfkT/4iHSoGahGSnm/GwdRCACLUwjr4+rAqDpr+O2AIMmN/6JbVdgBDILa5DcRn4yIyBoRINeGjrOo49CE0H2HdawbYNpo2y4kh3F5NjIEqQddIu2DMFRZpfpLF6LoB/wJUvnoiCxcP7HCq2f3usu+Px740Dp/NDXxRtnhnanrQ+hsNzyor6k/9B7jOnId/63U/qalCYgCZ+hDH/QNtXWihP6/kGnZKJXYEQMu/D39+tfHvy4Ft5nHnetWcN1YlgDvSbdF6DBcynH3Co6/G4qvXYE9ZVWYgEzG8biQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHGj5+MukQSnvLjmg3n80/yuc9svdIzTBJztb61HFDs=;
 b=jEahczzbuwmIcpRcH2lfwjJsaGdImI0hJ9mw+//UPooVaKndQBj5ROHzgtoVIIwvrhBdVJdRz8ODEFMSAD9osCGE7KdVyeyFXEdwja4nrbJ7ywk+hw2ukbZFUmJHaOViudaC8KIZ0act7WLCbJl7R/cfjIchQWAMpisGe6kMaenCnTF34cTkG5lKRWM9O/GlKM1WWyeH0hnZDhQjpBx4+QzZEUvIgx5YQPeb/cjwhPMHghfAfH9gTscBuXoGYb7uk/AOowcHuNfuHJ1r7hn0b0T7lZz86pF2fTCej1nsxHip7n/drE5GqhNL7RDiHiHmjteh1gLsjAqakbosLW4BKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CH3PR11MB8433.namprd11.prod.outlook.com (2603:10b6:610:168::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:25:13 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 05:25:13 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe: fix missing vm cleanups in
 several tests
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe: fix missing vm cleanups in
 several tests
Thread-Index: AQHdYRmC9aX1gT5QEkShY1zTwXmHhrcLSjsAgA8IgAA=
Date: Mon, 2 Nov 2026 05:25:12 +0000
Message-ID: <CH3PR11MB84340A6C97B4480E506A0DF18D6A2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20261021050307.3268228-4-priyanka.dandamudi@intel.com>
 <20261021050307.3268228-6-priyanka.dandamudi@intel.com>
 <20261023155024.pm6otu27u2gjxd5p@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20261023155024.pm6otu27u2gjxd5p@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CH3PR11MB8433:EE_
x-ms-office365-filtering-correlation-id: 7cb77ef4-10d4-44b8-372f-08df38a1ab9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022105027099003|261009223027099003|261028144727099003|38070700021;
x-microsoft-antispam-message-info: lR4JCxGr7tTgCKKNRZuRp2fHdSCwviEwB1tbcvayRN56qCDqgxHTaS+1y31Coz1L+bDWZKKtKtJ8kQ9vmTEPV29XKmIV5l8jZ+7jzpbfzBtvaki0PMTsp9AoQV7OCjR7OFSt2PTn3CvYqi3nTTmBCAjMQDrxRhs/tPFNIzMr+FOE0ZI25ePnNwfZpGns51FgyPUYHElISEuvHUX4iHhPbJ64hXH10u1QTw8Vm1yrVBY6q2IsTdKZiMJPmYuP5YjFzKbI4Yci2sJ30C4iVOhpBPH/7Dbhv4sEFYamYFnjCy60Ia2paGKVW6a92iL43uk/T8zPovf2QCshK2C2jETnDAUu8V00EjlTzc6OK9pEqm3xbvyQvQGHNfd3jqOH7J2s8PIUzwZqRUqp8oQvfbNOCZmZveaonv105cd970iIuZkZnCqumvbdaJFIWOA2C09itPvdBV74LGTowabW7O5BMfqytSdpJHQbzOkUhj5gSx/ndxbuvsb05ZSFPTCpU3ICsto4UquYxNC0U/hhi9dbo0SdwinlIQl8xIo/8PpjTuJyQ/5HrgOvSn2A+lnd6D+YkA7PS6YBP1N3GDmMbGRwswMAjOOJ0FQnJo9NNzyoOEprm3qkarqJdHLx21nvOljz2H+Jbb1kiGj6DUXKx+HEWcigmCilVkRIsXuwc58FG4N0AJW5UWx6Nfs65Tc48voQRBv0V8dL+8g6M91zcbRPQPhuHZxSjlYP4SQI02Yaj6Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261009223027099003)(261028144727099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlY4Y01ueVlmNkNZVXZsUUlZWEJEa1JEMjNjS3lwNTlSUUF4WkFQcHRVblRM?=
 =?utf-8?B?RFRYb1lUV1BFWkRKOUdUaVBwaGY5eStOKzQvd0pvLzdTbEpZZUpxVG85K1NF?=
 =?utf-8?B?TzFSNERvOVJuUko0TnBIRjFrZ2V5OStOcnZGZDRnUmx0Q2NoME9xeWUrS0Iz?=
 =?utf-8?B?KzFhZkZSbWk4M2swbXJ1QzhMQzJDUzdGQVFPMW1JczRKTnFsQ1NuckIwRVNC?=
 =?utf-8?B?dm9BU005QUQ0TmhESStUS0RDT2QrbUZoUzBiZWk2OW5PTFhjM1l1WitRM1c3?=
 =?utf-8?B?K0NvTXlyaXM1dndjcDY0N2NscXJoQS9CL0VrNCsrZHlndStxSVFqMDRwRXZn?=
 =?utf-8?B?UGR0QlJySmNIMnAvb2doSytXSnBQRW9xT2tPWExhWStIL3JnTFRMZWd0Yk5D?=
 =?utf-8?B?NW8zTWg1bFlSdXB5Y0FMVTk4VzU5Q0xaK1A5WGpoMDAvdEsvTlc1MFY5dWY3?=
 =?utf-8?B?alF1dlVGR1dyRkdLRlVkOFU0TnhkeS8yRTlnY3RLV1ZiWnVGZVZLYkt4ekNR?=
 =?utf-8?B?Vkl3a1dXYW54TWJTZm40STJOVTNtRENwTHQ2MmhoMGRmcklUM0ZzNnI5Z1dh?=
 =?utf-8?B?RUNhOWxUU3RoRGgydGw3QlFxZVdXTHBNY0hObGtvS1FWS2xjaXZCZXN4bWsr?=
 =?utf-8?B?VnF2NnFIUy9iblJxV2dOMzVoR3U4RXY4VldnOXo2TTdqeWMvTTJuUGJuUy8z?=
 =?utf-8?B?elgzS3FjbHhNUnlSZ2FGbTExTVA2Y0VkWnZxN0QwRVN2YVd5bUxFRzlnN3BK?=
 =?utf-8?B?UStIUmkwMG1EelYyc0J6ZU1FaUUwSkRSdEkrZDRCWGVTaEhmV091S3Uvck85?=
 =?utf-8?B?Uzh3REZ5eEhVTDNkL3FuN0d2MmxhdmV3R1R0bXQzVEN1UHhTblA3NEJqTVA2?=
 =?utf-8?B?OU1qcitnNEgzMlU2LzNKbVJwRzRQM0hrcE52UVlHS3F3eWJFOERrKzRaMW1y?=
 =?utf-8?B?Lzg4Wm9sMERDWkxLU0RDSXZUWU84TTRnNko4Vk1janJlUFdGM0traWNpekhI?=
 =?utf-8?B?eDJNYnVick9vMmIyK2tvZk5QV0xaelRaU0U3NUdIWnRmZnNQMTlhQVRJeXdz?=
 =?utf-8?B?SFBWaGdSbkRkNUVSU0tRR1lQbU5oR21saklCTG1oYTFtckZDelBveWFqS3g1?=
 =?utf-8?B?OW9hemJ5V0xsR3lzSGFLVm8yUGhVU0Y4TmhhRUpaYU40b3NWd21qYlUzN0Jy?=
 =?utf-8?B?Y2J5dDJzR0VRbHdJbzEwbnRuTHpBRmlLTjA2RWxXRGZnU0FZUjdmNzVyT25y?=
 =?utf-8?B?VlYzc3FyaTRUYzgxdzJaT1ZqNm9mMlBGczJSTzJsNVVRbEpxNTBmVmQxVStO?=
 =?utf-8?B?MzZsY0NrYjZYTTFFeTY0WmNvdVdPZG9ZRTdEY1lyUmYxUHRORCtyNEtXMUdD?=
 =?utf-8?B?SmFtdlNNS1JDZDIxZjRZK1N2Qi9nMVZqSllxOEhqNHRXWXF1NEUxKzgxdVZL?=
 =?utf-8?B?VkF4bjFsa0V5WnI5ZVh5d3FNMC9xTEpKTjdHaEZLcDZkbmsvUHhWUkprWnN1?=
 =?utf-8?B?RU1MZTBXZk9YQkNyUXZlejJrWkVtbThock1FZjJEbnJwZ3BDRzk4T0ZMMGY4?=
 =?utf-8?B?dkhXcVVUcCtuci9EanRlcFM5M1lkd1pUbjQ2bWhDaldBWEs4NEtvVGlXS0Vh?=
 =?utf-8?B?VzgxWE5yM250QXZ2OHNvSDZpV0pFek5yNTRDdG80N0V3QVhMVFV2NXNpTUoy?=
 =?utf-8?B?L0Y5cFdVdjVoMmoydzIvVUl2SjlkU3VzTmlkWXBiOHR3T1R0eG9SandKWTBV?=
 =?utf-8?B?TkJJMmllM1VzYmJ6eDlHTHF2VEp6TWVHYU9YZTJXZ0JSaVFZUytIUGJXRjM1?=
 =?utf-8?B?cXJwQWZNYWxPZkhCUEpSYjEyN3pySnZaR21hWVZCVkZmSWVWYk1WaHhYMzR6?=
 =?utf-8?B?TUU3R0E2bDNtbGZDL0Z3NlIzUTNYeHRzNGQ2OUtrUVFiODYwNmZEcGlSZ1hj?=
 =?utf-8?B?NlJ6bm13WDQvS3hjaVFQeDk2T2wzQXZiVnVqRHRtZXk4RVd2YjlSZ1g4T3NH?=
 =?utf-8?B?TlZSQnlMU1pDbVhxK1cwSlRoNDZ5WGxVQzgrTDRON2VQMWt2Z2F5WE1aY1di?=
 =?utf-8?B?YTM4aDFreTZuci9oaGx5U05BSSs3cC9CZHZCSlhIRmhPckNKQ3pmTWkrUGl1?=
 =?utf-8?B?MWNraWdHM2JYQXlFVVExYURmVnU1WlZtK0pXNmZqNWRzN0wvRG55aU5IdC9T?=
 =?utf-8?B?Rk5QQWh2K2h6VDVIQzEvc05xbmFraVJXeHJ2Mnk1VWdzdG1SaTYzazVCUzd5?=
 =?utf-8?B?VWpueHYxckFLVzNtMDNOSzdYZ1pTZ2xGdUVJbVh2aUg5UHVpeDlvVTNzK3F2?=
 =?utf-8?B?RGdvSDQ3b08vcVA2d3lkZmFFVm16elFzR0pUYmEzbDBaTmtkWkZsSkdGMGxm?=
 =?utf-8?Q?HMMTuLyhIHhTHQbw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SdPxiqqLT3E/dI+eFeTD1+TlJcm7l2nICbbK+x94J8AMIJUHAw2aaEaWr9lqQ83lX55hyKo1qbECvw1Q1cF47SMiwF149gCic9ayDpmPQn8QxTUjA+snbChh3cMiLuLeO7yvKKPO1ngS6g1nH+tXQRNHLxHapSHY3+nzQYPCfwpTghXzwBfIbqPVeZwIuUvNx0KCYPegEFRENwMt9J/13RDdJ4U5kuLnC/PEP4Uw7mBtIlQwD0euN81soe1ldm/QOtenD+v64jbElZZfj/03dFQWj7I4EkXg6GEkDByoZ1MlTGQ6ydQeZVabCdeH1y3NyKnEEwwWYou5FMkY2VEetw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb77ef4-10d4-44b8-372f-08df38a1ab9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 05:25:12.9201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +CtfKGbQASG16HQD17AxfUrNtWQ6GJxilgSZq5p/blP2gY2gfQzZjPMF09uMb9OpJrtiTd/jO+97g8r5+mmZ1NtLNGLrPITv8gvvKIWa80s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8433
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAyMyBPY3RvYmVyIDIw
MjYgMjE6MjANCj4gVG86IERhbmRhbXVkaSwgUHJpeWFua2EgPHByaXlhbmthLmRhbmRhbXVkaUBp
bnRlbC5jb20+DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIGktZy10IDIvMl0gdGVzdHMvaW50ZWwveGU6IGZpeCBtaXNzaW5nIHZtIGNs
ZWFudXBzIGluIHNldmVyYWwNCj4gdGVzdHMNCj4gDQo+IEhpIHByaXlhbmthLmRhbmRhbXVkaSwN
Cj4gT24gMjAyNi0xMC0yMSBhdCAxMDozMzoxMCArMDUzMCwgcHJpeWFua2EuZGFuZGFtdWRpQGlu
dGVsLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRh
bmRhbXVkaUBpbnRlbC5jb20+DQo+IA0KPiBJbWhvIHN1YmplY3Qgc2hvdWxkIG5vdCBoYXZlICdz
ZXZlcmFsJywgdGhlcmUgYXJlIHR3bywgc28gYmV0dGVyOg0KPiANCj4gW1BBVENIIGktZy10IDIv
Ml0gdGVzdHMvaW50ZWwveGU6IGZpeCBtaXNzaW5nIHZtIGNsZWFudXBzIGluIHRlc3RzDQo+IA0K
PiA+DQo+ID4gQWRkIHRoZSBtaXNzaW5nIGdlbV9jbG9zZSgpL3hlX3ZtX2Rlc3Ryb3koKS94ZV9l
eGVjX3F1ZXVlX2Rlc3Ryb3koKQ0KPiA+IGNhbGxzOg0KPiA+DQo+ID4geGVfd2FpdGZlbmNlLmM6
IHdhaXRmZW5jZSgpLCBpbnZhbGlkX2ZsYWcoKSwgaW52YWxpZF9vcHMoKSBsZWFrZWQNCj4gPiB2
bS9ibyhzKS9leGVjX3F1ZXVlIGVudGlyZWx5OyBleGVjX3F1ZXVlX3Jlc2V0X3dhaXQoKSBsZWFr
ZWQgdm0uDQo+ID4geGVfZG1hX2J1Zl9zeW5jLmM6IHRlc3RfZXhwb3J0X2RtYV9idWYoKSBuZXZl
ciBkZXN0cm95ZWQgaXRzIHR3bw0KPiA+IHZtL2V4ZWNfcXVldWUgcGFpcnMuDQo+IA0KPiBDYW4g
eW91IHNwbGl0IHRoaXMgaW50byB0d28gcGF0Y2hlcz8gT3IgYXQgbGVhc3QgcmVtb3ZlIGFib3Zl
IHBhcmFncmFwaCBvciB3cml0ZQ0KPiBvbmx5IHdoYXQgd2FzIGxlYWtlZCBhbmQgdGhhdCB5b3Ug
Zml4ZWQgdGhhdC4NCkl0IHdpbGwgcmVtYWluIGluIHRoZSBzYW1lIHBhdGNoIGJ1dCB1cGRhdGVk
IGNvbW1pdCBkZXNjcmlwdGlvbiBhbmQgc2VudCBuZXcgdmVyc2lvbi4NCj4gDQo+IFJlZ2FyZHMs
DQo+IEthbWlsDQo+IA0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFByaXlhbmthIERhbmRh
bXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgdGVzdHMv
aW50ZWwveGVfZG1hX2J1Zl9zeW5jLmMgfCAgNiArKysrKy0NCj4gPiAgdGVzdHMvaW50ZWwveGVf
d2FpdGZlbmNlLmMgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS90ZXN0cy9pbnRlbC94ZV9kbWFfYnVmX3N5bmMuYw0KPiA+IGIvdGVzdHMvaW50ZWwveGVf
ZG1hX2J1Zl9zeW5jLmMgaW5kZXggZjIxNDg2NmExNy4uNzI5MWYxNzY3NCAxMDA2NDQNCj4gPiAt
LS0gYS90ZXN0cy9pbnRlbC94ZV9kbWFfYnVmX3N5bmMuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVs
L3hlX2RtYV9idWZfc3luYy5jDQo+ID4gQEAgLTIxOSwxMSArMjE5LDE1IEBAIHRlc3RfZXhwb3J0
X2RtYV9idWYoc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZTAsDQo+
ID4gIAlmb3IgKGkgPSAwOyBpIDwgbl9ibzsgKytpKSB7DQo+ID4gIAkJbXVubWFwKGRhdGFbaV0s
IGJvX3NpemUpOw0KPiA+ICAJCWdlbV9jbG9zZShmZFswXSwgYm9baV0pOw0KPiA+ICsJCWdlbV9j
bG9zZShmZFsxXSwgaW1wb3J0X2JvW2ldKTsNCj4gPiAgCQljbG9zZShkbWFfYnVmX2ZkW2ldKTsN
Cj4gPiAgCX0NCj4gPg0KPiA+IC0JZm9yIChpID0gMDsgaSA8IE5fRkQ7ICsraSkNCj4gPiArCWZv
ciAoaSA9IDA7IGkgPCBOX0ZEOyArK2kpIHsNCj4gPiArCQl4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3ko
ZmRbaV0sIGV4ZWNfcXVldWVbaV0pOw0KPiA+ICsJCXhlX3ZtX2Rlc3Ryb3koZmRbaV0sIHZtW2ld
KTsNCj4gPiAgCQlkcm1fY2xvc2VfZHJpdmVyKGZkW2ldKTsNCj4gPiArCX0NCj4gPiAgfQ0KPiA+
DQo+ID4gIGludCBpZ3RfbWFpbigpDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3dh
aXRmZW5jZS5jIGIvdGVzdHMvaW50ZWwveGVfd2FpdGZlbmNlLmMNCj4gPiBpbmRleCBlY2RjZTlm
OTNiLi45MTE3MmVlYTdjIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3dhaXRmZW5j
ZS5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfd2FpdGZlbmNlLmMNCj4gPiBAQCAtMTM2LDYg
KzEzNiwxOCBAQCB3YWl0ZmVuY2UoaW50IGZkLCBlbnVtIHdhaXR0eXBlIHd0KQ0KPiA+ICAJCQkg
ICIsIGVsYXBzZWQ6ICUiIFBSSWQ2NCAiXG4iLA0KPiA+ICAJCQkgIHRpbWVvdXQsIHNpZ25hbGxl
ZCwgc2lnbmFsbGVkIC0gY3VycmVudCk7DQo+ID4gIAl9DQo+ID4gKw0KPiA+ICsJaWYgKHd0ID09
IEVOR0lORSkNCj4gPiArCQl4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWUpOw0K
PiA+ICsNCj4gPiArCWdlbV9jbG9zZShmZCwgYm9fMSk7DQo+ID4gKwlnZW1fY2xvc2UoZmQsIGJv
XzIpOw0KPiA+ICsJZ2VtX2Nsb3NlKGZkLCBib18zKTsNCj4gPiArCWdlbV9jbG9zZShmZCwgYm9f
NCk7DQo+ID4gKwlnZW1fY2xvc2UoZmQsIGJvXzUpOw0KPiA+ICsJZ2VtX2Nsb3NlKGZkLCBib182
KTsNCj4gPiArCWdlbV9jbG9zZShmZCwgYm9fNyk7DQo+ID4gKwl4ZV92bV9kZXN0cm95KGZkLCB2
bSk7DQo+ID4gIH0NCj4gPg0KPiA+ICAvKioNCj4gPiBAQCAtMjA4LDYgKzIyMCw5IEBAIGludmFs
aWRfZmxhZyhpbnQgZmQpDQo+ID4gIAlkb19iaW5kKGZkLCB2bSwgYm8sIDAsIDB4MjAwMDAwLCAw
eDQwMDAwLCAxKTsNCj4gPg0KPiA+ICAJZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVfV0FJ
VF9VU0VSX0ZFTkNFLCAmd2FpdCwgRUlOVkFMKTsNCj4gPiArDQo+ID4gKwlnZW1fY2xvc2UoZmQs
IGJvKTsNCj4gPiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0
YXRpYyB2b2lkDQo+ID4gQEAgLTIzMiw2ICsyNDcsOSBAQCBpbnZhbGlkX29wcyhpbnQgZmQpDQo+
ID4gIAlkb19iaW5kKGZkLCB2bSwgYm8sIDAsIDB4MjAwMDAwLCAweDQwMDAwLCAxKTsNCj4gPg0K
PiA+ICAJZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVfV0FJVF9VU0VSX0ZFTkNFLCAmd2Fp
dCwgRUlOVkFMKTsNCj4gPiArDQo+ID4gKwlnZW1fY2xvc2UoZmQsIGJvKTsNCj4gPiArCXhlX3Zt
X2Rlc3Ryb3koZmQsIHZtKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyB2b2lkDQo+ID4gQEAg
LTMwNCw2ICszMjIsOCBAQCBleGVjX3F1ZXVlX3Jlc2V0X3dhaXQoaW50IGZkKQ0KPiA+ICAJCW11
bm1hcChkYXRhLCBiYl9zaXplKTsNCj4gPiAgCQlnZW1fY2xvc2UoZmQsIGJvKTsNCj4gPiAgCX0N
Cj4gPiArDQo+ID4gKwl4ZV92bV9kZXN0cm95KGZkLCB2bSk7DQo+ID4gIH0NCj4gPg0KPiA+ICBp
bnQgaWd0X21haW4oKQ0KPiA+IC0tDQo+ID4gMi40My4wDQo+ID4NCg==
