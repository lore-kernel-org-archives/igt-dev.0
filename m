Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26C606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ESPuZkNB;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Zn1X4fTn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B2910E26C;
	Mon, 16 Nov 2026 08:10:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10D110E3EC
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 08:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794816561; x=1826352561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ya9kCYQflHDHOHR6N3H1H5pLGdxfakOBfNRTEKZUqJ8=;
 b=ESPuZkNBbK+PMTjprwdJU8HBsmrh3Zs86ngaT+lgoguW6inNqZ9W+0KM
 E2fl8TdFFNKlVxAqaAx/mwFTAgWWQ8Ret265Ye4wfzv6KfVUiuIUlA+PD
 Gm4Ku2RmiOABdCpSXGIimVfS8bLMCricUw1IHtYaa0KTRHnMTNwVAvH4Q
 z/2+UV6G8sDaEqhiA8QrNeppyfCVm/8x5iBTfAxps9djBRB9evqURuwzj
 wI3v48rSzKn3wKfVQAvrYGn4Rkv+5nRzWSuGEFuX+qHy3SB/vf8Mn7hG3
 WjHrZOpY/F+yUi5F8+svaR+EAbUgl0y/n2kZJZyb7k4ETY7YtXE25ppF2 Q==;
X-CSE-ConnectionGUID: Jv5xAidESqm3ps3LcPajGQ==
X-CSE-MsgGUID: ZrOm8yapRK+wdoPrkH9tPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3647194"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3647194"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:09:21 -0800
X-CSE-ConnectionGUID: svIJpQ0CS8GAolvlGNTYdA==
X-CSE-MsgGUID: 9NxCHik8RP68cyUoE7sH5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9409114"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:09:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:09:20 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 00:09:20 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:09:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMqvUCEPdQblF63go0Esq6O4cJKgCIg91bLnt9SiRRwhgARoDjI7iiV5yI5wfB2atIJ2qOa2h326VFX7JFVqV2ihXN839QMTlaUY2aBPJrwZYSNbXhQIt6ikCRUXCtvqGBgdUsu9AtghCLEVOqdISsD3C/HLr/paFzPgVbfoygyWzT2B68dNuvcwUa//Ie4HNVLmVnfvGJRqz6EvN42/44R48OAjfeQMHroyu6l7yXXaNwG9LQylV3GWRTfUUmSsujlFEhApyBjaNi+9bMgfh8oBKB7gp+FnQOueLS3c49e2hivxoeLNj5GJkQcy99YlBurD4HIEvrgFjUHJA4eH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ya9kCYQflHDHOHR6N3H1H5pLGdxfakOBfNRTEKZUqJ8=;
 b=SGZAhX7PzGfBwyryfZaLlpYWwUKvMS6UA/sONJAdiheHmSrTlD3o23FMAaS3KiljsvhtZEgOgGDRu4F6bMF6ezQC7SXjK2ZOc52sT4abVnUSzr6haYO1HH8EenuWpn235cLd4SQwlwdVv10QR288ipNlUMGMUXbyWy/2zCapVmFfQyxSwT77wfmgOERtFzyx9T7/uFckMLPG0XS4BapMqm1FtKu+z5iGvzAVrWGhxZfjpvLPv97ZHJizaV4M6VvCoN0AQN0sQfh9NuaBKhS+UWYc/RH8kzheb0E4Z0j0LXYFN+gZYsqPbCMWG7zAHRTEsC4zlyPlvb7lqnjvRvYmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ya9kCYQflHDHOHR6N3H1H5pLGdxfakOBfNRTEKZUqJ8=;
 b=Zn1X4fTnLxnjD3LNiTaM3enN5XQ8bWYVB+T5KXwOJ+9HVUm+FWOv1HQmBChcQAa1TMfLKcxCta+RLjQqpBrSrQfXeezVKKabWvDXSc5f2vmimJX9M4lJxvjBXFOhEWbEbKbphKn8DXuNRub03woE3icy5I7TZZS+ozjAXnqP4sc=
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by IA3PR11MB444632.namprd11.prod.outlook.com (2603:10b6:208:53e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:08:18 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:08:18 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "Grzelak, Michal"
 <michal.grzelak@intel.com>, "B, Jeevan" <jeevan.b@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v3 2/3] tests/intel/xe_configfs: Reload audio driver
 on exit
Thread-Topic: [PATCH i-g-t v3 2/3] tests/intel/xe_configfs: Reload audio
 driver on exit
Thread-Index: AQHdcdV5k3/K3bkWuUy/kdesHQtmzbcwX4yA
Date: Mon, 16 Nov 2026 08:08:18 +0000
Message-ID: <BL1PR11MB541381BFEAC9CBB59C79AE9CE27C2@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20261111114600.4104768-1-chaitanya.kumar.borah@intel.com>
 <20261111114600.4104768-2-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261111114600.4104768-2-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|IA3PR11MB444632:EE_
x-ms-office365-filtering-correlation-id: f2c0256c-88dc-4ab8-da74-08df43b8c603
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|261009223027099003|5023799004|11063799006|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info: 73PkzjS32pasjNKT3M7TMC+bwhENmvc9HqsvJx7FyW2Hp7DsUtRJ6B57p3eo5gK/QYJet+zNhZqPw6fclSRbF+PG9GpQcjuYZQN9tgM4OTkazpLSX5UBSvcNKDV+2fdDji3Y8YLevi71cxbFK56f13GarglUR36s7/gOpSwJxGKPZdTpUgEgR5Jy7yRvWCH0hgik1Dj68ufjX7OMBQPBAOKTzeqCNw63wE2Is8vZCkEWcF/x2NJ0y/kVjtlU/VZXgJ0m3FAeKkP6Y9pVnuxM9I/CNrjUmcSz5twlXzGc0ZQCsy5LQDyRpbQq3l9F1jbmgIBH6bImd/qJyI2jlhF7Tuwy8eBllJ2wDADPLXTkuGahfNmeIh6je/5ZcCOmRyJwVzX6179rwafEU8eAsAIxpX9BKO9BVrAaJF+iqjgLjyX6JoEohOauv8f3oeFEz3o3lQ3OyoYyVgCvn+9oSmNwrBPx0a9grW4WXT83KpZnB3n+KeAnkAf853MlxG/1GainMxrx7W9QvkCEwlX6kkvoIl2SZqnvGU2erSFCz1bzr7VCRo6s4nmWorAp5Seil9Jdag78hRjP0Yb0P34aJki0L6uUaEBsyQGM88l6cApm+H7UKM0wzq/g/RvP8TU5GGdFDzF0IO8L+8RITswEVG5l0GP6hTTXf1p0DCjdngHojDR6bd+U9pHAqTNeQdoXyW+4+1v+nsSsiB5qda0EO2d+IFWwgmc6Sk6OBsHAk0um1f8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(5023799004)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmJYQTY3RnEyZnVYRVJuN0VRc2FuU21iUXVWNmNzcXpLaXlUMFd1V0R3bnV4?=
 =?utf-8?B?L3MwSWpaczVmY0RCTHdUNzdkcU5qN2dxemRJSjhRUW5zRDdQK3h1YXh4Vlo3?=
 =?utf-8?B?VzVPdEY3c29wdGJqekt6ZWJRaXdKU0o2by9iM2M4d2MwMndSelpmNFN5T0JZ?=
 =?utf-8?B?UXVib3h5MUNpZ1JKbDRlNUlhcXg5TGxOaUU0bnVJVDViNHdWWWh6LzI0ejJo?=
 =?utf-8?B?dlJ2dEIxMVZLV1FpMWphaFlCTTk1UFdWRituWlAweWlVd0FEODBRbUNkOExC?=
 =?utf-8?B?S1pBbWZDcldGQW5OK05uT2sra1JPcXIyQStXbWRPRHdNS2tCNXRTck5DUkVJ?=
 =?utf-8?B?SngyTU14TzA2eEtqTFNxNnZKanBSSmdUNGlUNkIydkliaVM2T1VFYVRSOXNC?=
 =?utf-8?B?ZVFxd0NCTnlOa3d2OWgzZDV6RHZyRU1VWjJGOHNob2VmZDV3VFlOUzY2Vng5?=
 =?utf-8?B?TzhiWnVLYVZPdFRZd0d4anliZHJrVlhGRC9yWFJEaS9XRzIzOGpmQTQ1bkF3?=
 =?utf-8?B?bTlUUm1ZVWdoazNKWmI0aURMUHFvb0dtTWxLV0d1ek1rTUxaZmdmdmozbEJP?=
 =?utf-8?B?Qm5XUHFTaS8yM2UrR0JPYzRTbC9CZE1DU3RhSUllV3VubDk3bjhlZjBpM3dU?=
 =?utf-8?B?ejROZ3Q2QVByMW55VVkxTHhCcXN5MStxamVQcFNITjNFekJ6eU5UREVKRDFX?=
 =?utf-8?B?TjBBSnVmYndEa2QyU3VuUDBiallIZCs1Qkt6Z0pHOUYyUXc0TVZyUGRZNGFn?=
 =?utf-8?B?RmZSK2ZWUzFMLytQNytESUhaVXR3N1Rsb3R1TUpUcVJRc2hhZDU3V25QQ2Rp?=
 =?utf-8?B?bURHdGJsSmlxclBoUFlxNjczSGVxbnFQNzFlVlNOTVdPUWt4UUdyeTJNYk1h?=
 =?utf-8?B?YmxtODRzUFBxeWZKR2QzVFBrNStZWVcya0x2MHlWSkhvN2VRVzhDUDZKOFBo?=
 =?utf-8?B?U0lEMUxyTjA4OG9udHlaTkVqamhPNmRhbnA5Uk9rNUpFL21DZWduVnZOMVJV?=
 =?utf-8?B?VE10U2tkMWZvVzVrSWkxWEhXelFsQjdpendNRHNid3pwVUxaeitvZUpHTnND?=
 =?utf-8?B?LzZjRTllcmp6VXY2VW91VkMzY21OMC9XVHZJQkxrdTR1TzFrSVBKL29KQ3VB?=
 =?utf-8?B?Q2xHa2hhWnhBeW5uem8yWEh0REhCLzM5SEZNamtsekpGSlhCbzZqcXJEK3dt?=
 =?utf-8?B?REEyYWdXQWZDRHJLYUZVdTYvVmZPT21ZNHY5SVZUYWw3d296ZGt1aVZrZU8w?=
 =?utf-8?B?U0h3V2QzWEhleUNabFg2KzM5bFJZcmtHcHQ1VWdQTU9ib3ZEaHBzdkVlci9m?=
 =?utf-8?B?NjNTUUtDTXRIeVMrZXBwVHhGYmxFYWdxREFPaUJJd053VUtxTGZ0ajZqVXBM?=
 =?utf-8?B?WlI2SWdHdnY2dHVVUkNCZklsTDliUEJDcC90cWJvUmtJazhBMTFYY3hZRnRF?=
 =?utf-8?B?WDVuZkdvRnp1M3o3YWFOSWpkeDRVYmZrV0hCU2hyZU1CMVI2bVBHVVc0aVBD?=
 =?utf-8?B?ME1MVkZhak4rMXhwZzZYNE5LL00zdldaZ0IrNGh6amZrOXJVdVcvMVdQZnNO?=
 =?utf-8?B?SmMxSDY2cDNUaXVyNFJJV1l3RHBucldWekZ4cFpMd1p6SlBzMFpBc1FnZXZH?=
 =?utf-8?B?elVCTXNRcVEzcGxoUllqdHBsR3lKQ1FSZ094MHVObkorK3drR0V3ejV4aDZU?=
 =?utf-8?B?bmZWYXF5TWlqenJISVExUGxGNDBxSGlINmlYaFJuMUt2ZGJPM3R5R3prWWZ4?=
 =?utf-8?B?ZjQrcktHRER2K29FT21maXBJK2NvSVVjZjdaSncxMWljVVlKd2poaWkvbnlZ?=
 =?utf-8?B?cVZQVm1UT2JYWDh5cUR5bjJKcVBlcklvY2tJYm40RFFhQkZvK1JTSnQxTG45?=
 =?utf-8?B?QXVYSk5EMHpONHZ6a1FJanp5ekV5TmVEaXlFRUErcjllcGdBQUZESnJzY2ZD?=
 =?utf-8?B?SDN1NlRyS3prb0lxL0ZSNWpSTnRlZFFxdlNGNExHYkJaUjdXOUZqRlBsemhh?=
 =?utf-8?B?cVUxSGxlVnhkcEwrNGJ6WjlJbU5xQ1BpYndkR1NqbXRwSGZJWDRoK3VyVTRl?=
 =?utf-8?B?ZThZYTBnSTBJMU5md0NtRDFYTzl3NndCZ2ZmSk5YRkNqeFlyWEhjUWpkZE5h?=
 =?utf-8?B?MzJiTkRvM1gxUVhqYWtibDNXNnhwK0tqbG9UVTFBVWlEYjdCZjRxOWVBd2hT?=
 =?utf-8?B?dWdMUHM1VjJiaHkvNm1xR25iT0p4Uk9CSzRhNVNFOC9wVFJQSm1HSHk0aEZK?=
 =?utf-8?B?ZXNwaFVpUHNkVHlya2RKc2VxclRHR0VCeXV6bFgvOUo2NVdocENaY3BTM0VZ?=
 =?utf-8?B?T01ncGpwMlJmWEhYVW95WTRmWWwvYTRaR0p2dU1PK3U2OEgwVDdTQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JoG4B6hHEraFDyaH4Aa5YYk5tUw8BNLkDEO5mtcCdgpzKclWVrRtd2obYswd+nLipEbL2KNjkbZsByfjl+l5BoHV+c1ojwjJW287LXEFYLeWgE54kEXGPcqsxauatTkRzoI/cUL/TO3iluXcr6GiCdx5UT6jLR9sUoZY/M1L3/vwjcPhNEgveBcCr1tq8zRCzYoTqchn+x9bFzjyTbJKuuE63HBOc2v9tSnzmm/RYRLDT4yL0ZjohRtM4UOJ4NZxQKnbneEfM2heWC97TwyVIY4ieKoaX52T1Xe2Eid2w+TBVJ/6hpv5/PI5I38x3HELJMgt1dCTYXaw3ULHQiRt5A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c0256c-88dc-4ab8-da74-08df43b8c603
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:08:18.4808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NH2/63ovsS5qBmKsIcpRF4kReQk7kVW2RA3IFQ248ivNCVXQj1RNc4iVrlRHH87mvNb/0NVrRye2VgZpTgOR5BaTZfKYg3IBFIy2H0Qa3M4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB444632
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBOb3ZlbWJlciAxMSwgMjAyNiA1OjE2IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFy
LmJvcmFoQGludGVsLmNvbT47IFRhdXJvLA0KPiBSaWFuYSA8cmlhbmEudGF1cm9AaW50ZWwuY29t
PjsgR3J6ZWxhaywgTWljaGFsIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+Ow0KPiBCLCBKZWV2
YW4gPGplZXZhbi5iQGludGVsLmNvbT47IFNoYXJtYSwgU3dhdGkyDQo+IDxzd2F0aTIuc2hhcm1h
QGludGVsLmNvbT47IFNhbWFsYSwgUHJhbmF5IDxwcmFuYXkuc2FtYWxhQGludGVsLmNvbT47DQo+
IEJoYWRhbmUsIERueWFuZXNod2FyIDxkbnlhbmVzaHdhci5iaGFkYW5lQGludGVsLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIGktZy10IHYzIDIvM10gdGVzdHMvaW50ZWwveGVfY29uZmlnZnM6IFJl
bG9hZCBhdWRpbyBkcml2ZXIgb24NCj4gZXhpdA0KPiANCj4gQ29tbWl0IDExN2U5ZWNiZGQxZCAo
InhlL2lndF9rbW9kX3VuYmluZDogcmVsZWFzZSBhdWRpbyBiZWZvcmUNCj4gdW5iaW5kaW5nIHhl
IikgbWFkZSBpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZCgpIGJlIGNhbGxlZCBiZWZvcmUgdW5iaW5k
aW5nDQo+IHhlIHRvIGF2b2lkIHRoZSBhdWRpby1jb21wb25lbnQgYmluZCB3YXJuaW5ncy9lcnJv
cnMgdGhhdCBoYXBwZW4gaWYgeGUgaXMNCj4gdW5ib3VuZCB3aGlsZSBzbmRfaGRhX2ludGVsIGlz
IHN0aWxsIGF0dGFjaGVkLiBBbGwgY2FsbCBzaXRlcyBpbiB0aGlzIGZpbGUgcGFzc2VkDQo+IE5V
TEwgZm9yIHRoZSB1bmxvYWRlZCBkcml2ZXIgbmFtZSwgc28gaXQgd2FzIG5ldmVyIHRyYWNrZWQs
IGFuZCBub3RoaW5nIGV2ZXINCj4gcmVsb2FkZWQgaXQgYWZ0ZXJ3YXJkcy4NCj4gDQo+IEFzIGEg
cmVzdWx0IHNuZF9oZGFfaW50ZWwvc25kX2hkbWlfbHBlX2F1ZGlvIGlzIGxlZnQgdW5sb2FkZWQg
Zm9yIHRoZSByZXN0DQo+IG9mIHRoZSBib290IGV2ZW4gd2hlbiBldmVyeSBzdWJ0ZXN0IHBhc3Nl
cywgc2luY2UgeGUgYWx3YXlzIGVuZHMgdXANCj4gcmVib3VuZCBieSByZXN0b3JlKCkgYnV0IGF1
ZGlvIG5ldmVyIGRvZXMuDQo+IA0KPiBDYXB0dXJlIHRoZSB1bmxvYWRlZCBkcml2ZXIgbmFtZSBh
bmQgcmVsb2FkIGl0IHdoZXJldmVyIHhlIGdldHMgYm91bmQNCj4gYWdhaW4gaW4gcmVzdG9yZSgp
Lg0KPiANCj4gdjI6DQo+IC0gQWRkIEZpeGVzIHRhZyAoUHJhbmF5KQ0KPiAtIFVzZSB0aGUgbmV3
IGlndF9hdWRpb19kcml2ZXJfbG9hZCgpIGhlbHBlciAoRG55YW5lc2h3YXIpDQo+IA0KPiB2MzoN
Cj4gLSBGcmVlIHNuZF9kcml2ZXIgZXhwbGljaXRseSBhZnRlciBpZ3RfYXVkaW9fZHJpdmVyX2xv
YWQoKSwgd2hpY2gNCj4gICBubyBsb25nZXIgZnJlZXMgaXQgaXRzZWxmIChEbnlhbmVzaHdhcikN
Cj4gDQo+IENjOiBSaWFuYSBUYXVybyA8cmlhbmEudGF1cm9AaW50ZWwuY29tPg0KPiBDYzogTWlj
aGHFgiBHcnplbGFrIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+IENjOiBKZWV2YW4gQiA8
amVldmFuLmJAaW50ZWwuY29tPg0KPiBDYzogU3dhdGkgU2hhcm1hIDxzd2F0aTIuc2hhcm1hQGlu
dGVsLmNvbT4NCj4gQ2M6IFByYW5heSBTYW1hbGEgPHByYW5heS5zYW1hbGFAaW50ZWwuY29tPg0K
PiBDYzogRG55YW5lc2h3YXIgQmhhZGFuZSA8ZG55YW5lc2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+
DQo+IEZpeGVzOiAxMTdlOWVjYmRkMWQgKCJ4ZS9pZ3Rfa21vZF91bmJpbmQ6IHJlbGVhc2UgYXVk
aW8gYmVmb3JlIHVuYmluZGluZw0KPiB4ZSIpDQo+IFNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBL
dW1hciBCb3JhaCA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCg0KTEdUTSwNClJl
dmlld2VkLWJ5OiBEbnlhbmVzaHdhciBCaGFkYW5lIDxkbnlhbmVzaHdhci5iaGFkYW5lQGludGVs
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfY29uZmlnZnMuYyB8IDE5ICsrKysr
KysrKysrKy0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2NvbmZpZ2ZzLmMg
Yi90ZXN0cy9pbnRlbC94ZV9jb25maWdmcy5jIGluZGV4DQo+IDY4ZGFlZDY5MC4uMTYxMjYyYTFh
IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9jb25maWdmcy5jDQo+ICsrKyBiL3Rlc3Rz
L2ludGVsL3hlX2NvbmZpZ2ZzLmMNCj4gQEAgLTI1LDYgKzI1LDcgQEANCj4gDQo+ICBzdGF0aWMg
Y2hhciBidXNfYWRkcltOQU1FX01BWF07DQo+ICBzdGF0aWMgc3RydWN0IHBjaV9kZXZpY2UgKnBj
aV9kZXY7DQo+ICtzdGF0aWMgY2hhciAqc25kX2RyaXZlcjsNCj4gDQo+ICBzdGF0aWMgYm9vbCBj
b25maWdmc19ncm91cF9wcmVleGlzdGluZzsNCj4gDQo+IEBAIC01Nyw3ICs1OCw3IEBAIHN0YXRp
YyB2b2lkIHJlc3RvcmUoaW50IHNpZykgIHsNCj4gIAlpbnQgY29uZmlnZnNfZmQ7DQo+IA0KPiAt
CWlndF9hdWRpb19kcml2ZXJfdW5sb2FkKE5VTEwpOw0KPiArCWlndF9hdWRpb19kcml2ZXJfdW5s
b2FkKCZzbmRfZHJpdmVyKTsNCj4gIAlpZ3Rfa21vZF91bmJpbmQoInhlIiwgYnVzX2FkZHIpOw0K
PiANCj4gIAkvKiBEcm9wIGFsbCBjdXN0b20gY29uZmlnZnMgc2V0dGluZ3MgZnJvbSBzdWJ0ZXN0
cyAqLyBAQCAtNjgsMTMNCj4gKzY5LDE3IEBAIHN0YXRpYyB2b2lkIHJlc3RvcmUoaW50IHNpZykN
Cj4gDQo+ICAJLyogQmluZCBhZ2FpbiBhIGNsZWFuIGRyaXZlciB3aXRoIG5vIGN1c3RvbSBzZXR0
aW5ncyAqLw0KPiAgCWlndF9rbW9kX2JpbmQoInhlIiwgYnVzX2FkZHIpOw0KPiArDQo+ICsJaWd0
X2F1ZGlvX2RyaXZlcl9sb2FkKCZzbmRfZHJpdmVyKTsNCj4gKwlmcmVlKHNuZF9kcml2ZXIpOw0K
PiArCXNuZF9kcml2ZXIgPSBOVUxMOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB2b2lkIHNldF9zdXJ2
aXZhYmlsaXR5X21vZGUoaW50IGNvbmZpZ2ZzX2RldmljZV9mZCwgYm9vbCB2YWx1ZSkgIHsNCj4g
IAlpbnQgcmV0Ow0KPiANCj4gLQlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZChOVUxMKTsNCj4gKwlp
Z3RfYXVkaW9fZHJpdmVyX3VubG9hZCgmc25kX2RyaXZlcik7DQo+IA0KPiAgCXJldCA9IGlndF9r
bW9kX3VuYmluZCgieGUiLCBidXNfYWRkcik7DQo+ICAJaWd0X2Fzc2VydF9mKCFyZXQsICJGYWls
ZWQgdG8gdW5iaW5kIHhlIGZyb20gJXM6ICVzXG4iLCBAQCAtMTI5LDcNCj4gKzEzNCw3IEBAIHN0
YXRpYyB2b2lkIHRlc3RfZW5naW5lc19hbGxvd2VkX2ludmFsaWQoaW50IGNvbmZpZ2ZzX2Rldmlj
ZV9mZCkNCj4gIAkgKiBUaGVzZSBvbmx5IHRlc3QgaWYgZW5naW5lIHBhcnNpbmcgaXMgY29ycmVj
dCwgc28ganVzdCBtYWtlIHN1cmUNCj4gIAkgKiB0aGVyZSdzIG5vIGRldmljZSBib3VuZA0KPiAg
CSAqLw0KPiAtCWlndF9hdWRpb19kcml2ZXJfdW5sb2FkKE5VTEwpOw0KPiArCWlndF9hdWRpb19k
cml2ZXJfdW5sb2FkKCZzbmRfZHJpdmVyKTsNCj4gIAlpZ3Rfa21vZF91bmJpbmQoInhlIiwgYnVz
X2FkZHIpOw0KPiANCj4gIAlmb3IgKHNpemVfdCBpID0gMDsgaSA8IEFSUkFZX1NJWkUodmFsdWVz
KTsgaSsrKSB7IEBAIC0xNTYsNyArMTYxLDcgQEANCj4gc3RhdGljIHZvaWQgdGVzdF9lbmdpbmVz
X2FsbG93ZWQoaW50IGNvbmZpZ2ZzX2RldmljZV9mZCkNCj4gIAkgKiBUaGVzZSBvbmx5IHRlc3Qg
aWYgZW5naW5lIHBhcnNpbmcgaXMgY29ycmVjdCwgc28ganVzdCBtYWtlIHN1cmUNCj4gIAkgKiB0
aGVyZSdzIG5vIGRldmljZSBib3VuZA0KPiAgCSAqLw0KPiAtCWlndF9hdWRpb19kcml2ZXJfdW5s
b2FkKE5VTEwpOw0KPiArCWlndF9hdWRpb19kcml2ZXJfdW5sb2FkKCZzbmRfZHJpdmVyKTsNCj4g
IAlpZ3Rfa21vZF91bmJpbmQoInhlIiwgYnVzX2FkZHIpOw0KPiANCj4gIAlmb3IgKHNpemVfdCBp
ID0gMDsgaSA8IEFSUkFZX1NJWkUodmFsdWVzKTsgaSsrKSB7IEBAIC0xODcsNyArMTkyLDcgQEAN
Cj4gc3RhdGljIHZvaWQgdGVzdF9ndF90eXBlc19hbGxvd2VkKGludCBjb25maWdmc19kZXZpY2Vf
ZmQpDQo+ICAJICogVGhlc2Ugb25seSB0ZXN0IGlmIGd0IHR5cGUgcGFyc2luZyBpcyBjb3JyZWN0
LCBzbyBqdXN0IG1ha2Ugc3VyZQ0KPiAgCSAqIHRoZXJlJ3Mgbm8gZGV2aWNlIGJvdW5kDQo+ICAJ
ICovDQo+IC0JaWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQoTlVMTCk7DQo+ICsJaWd0X2F1ZGlvX2Ry
aXZlcl91bmxvYWQoJnNuZF9kcml2ZXIpOw0KPiAgCWlndF9rbW9kX3VuYmluZCgieGUiLCBidXNf
YWRkcik7DQo+IA0KPiAgCWZvciAoc2l6ZV90IGkgPSAwOyBpIDwgQVJSQVlfU0laRSh2YWx1ZXMp
OyBpKyspIHsgQEAgLTI1NCw3ICsyNTksNyBAQA0KPiBzdGF0aWMgdm9pZCB0ZXN0X2N0eF9yZXN0
b3JlX2ludmFsaWQoaW50IGNvbmZpZ2ZzX2RldmljZV9mZCwgY29uc3QgY2hhciAqdHlwZSkNCj4g
IAkgKiBUaGVzZSBvbmx5IHRlc3QgaWYgY29tbWFuZCBwYXJzaW5nIGlzIGNvcnJlY3QsDQo+ICAJ
ICogc28ganVzdCBtYWtlIHN1cmUgdGhlcmUncyBubyBkZXZpY2UgYm91bmQNCj4gIAkgKi8NCj4g
LQlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZChOVUxMKTsNCj4gKwlpZ3RfYXVkaW9fZHJpdmVyX3Vu
bG9hZCgmc25kX2RyaXZlcik7DQo+ICAJaWd0X2ttb2RfdW5iaW5kKCJ4ZSIsIGJ1c19hZGRyKTsN
Cj4gDQo+ICAJZm9yIChzaXplX3QgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZhbHVlcyk7IGkrKykg
eyBAQCAtMzM5LDcgKzM0NCw3IEBADQo+IHN0YXRpYyB2b2lkIHRlc3RfY3R4X3Jlc3RvcmUoaW50
IGNvbmZpZ2ZzX2RldmljZV9mZCwgY29uc3QgY2hhciAqdHlwZSwNCj4gIAlmb3IgKHNpemVfdCBp
ID0gMDsgaSA8IEFSUkFZX1NJWkUodmFsdWVzKTsgaSsrKSB7DQo+ICAJCWNvbnN0IHN0cnVjdCB2
YWx1ZSAqdiA9ICZ2YWx1ZXNbaV07DQo+IA0KPiAtCQlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZChO
VUxMKTsNCj4gKwkJaWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQoJnNuZF9kcml2ZXIpOw0KPiAgCQlp
Z3Rfa21vZF91bmJpbmQoInhlIiwgYnVzX2FkZHIpOw0KPiANCj4gIAkJZm9yIChpbnQgaiA9IDAs
IG9mZiA9IDA7IHYtPmluW2pdOyBqKyspDQo+IC0tDQo+IDIuNTAuMQ0KDQo=
