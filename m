Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD61606A33D
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 05:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ViKe08Zb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B513810E3B8;
	Thu, 22 Oct 2026 05:07:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4985A1122F5
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 05:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792645602; x=1824181602;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CRI1jRheAxk2RqQiLoLCmEVd0Yg1L4KvyKUk88dT0WE=;
 b=ViKe08ZbtdoziwAmPmfWY1gU0OwliqO4DbeLAYY+39xlXeGD2a3QGlaI
 oYiShVRdvNFSvU8iaQf3KY5T+pa1p6CTsUZX+z3CFg4bJHYe4NhhwemPo
 S1eKs1aEhJYlBA880/xZ3wMhTpQ9VvjepaG44UQNozgDMs4trLMsSudNk
 aLCgvVfmizP4qnRia8YprhXJe2+PsFwA+nAL85Ms5u8qMqtq9K0LGKkCS
 Y/8BbQGErr+G0M1qkHb5P23h+cfL89FLVjNcvX8lQ0FXu/HW+JsxiKxHx
 EnuBzAKvNvWy/bzgrhfI3WhCTWlmvHCMb/lIbepYh100p/Q4L4pB59WWM A==;
X-CSE-ConnectionGUID: NwdZrYZqTO20Lqa01RQS8w==
X-CSE-MsgGUID: 425rDbaCSSmGdV2Mxlxp4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1271469"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1271469"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:06:39 -0700
X-CSE-ConnectionGUID: JKJRZntmRqu6SWRsgLEmJg==
X-CSE-MsgGUID: kS+YFSrHTWiktgLLKmuRdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3672891"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:06:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 22:06:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 22:06:37 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 22:06:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nD+YDDGKMFbO6X7sulEIuSJRgYuw6dMd3sBXl900m4Qvxp5kfYCq0xFb6TwsuzxfJFvHwNZjHayOyB3d150YYNuG2vyFM1FcD3D83C5X0vqGDOygdrI62CfGRES4TSMhyeox8d2NMaerhnowZxhLGKeb7mV5HSLkYM1FkMQ7RRnEW/lzC0LlO599A66nG3UqrsCa4bxJR+bvdmtdWBMh8jpiGNQXSBj/9e/Nb40EjVHqOkyiwNAUjuqEKKfU07EKgPDecwPSbvUlOy13NLoK/kvrquiU1o9zH2d2XFLd/EN5g6b0qX39vNIs/MBzEliD6QIOrvjd+T8KAPWfguD/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZ1okI86l5KrMpP+8rkgAHbxk5HoGSpqsH9qYOAZd/E=;
 b=XEAR4jLM2fweju2kLdwv0Mv4wVuarsV8HeFHeIJJoZKS9CbGHn9RjvxHFLzjGXNR09oH6MGhTv1+2kwZ2DCwLe7/QlLSpt3IKaOW6mvQsxkAO/ikGbl8GZziIR8P/7wfQrkDM1sEayTatOEWjKzSyH+ncNWy5OfsiyMwBckgAsYu2EFkkoq73g5l2zAuJxr64ye/ibzISBNysz6vYMMfGDjiQ6bLikmyR7LQEIfiEkYmAmYhCZVDPUpFIafYuNWuvJJbN7IY7egFowEkUM6GoXBPT4Ra1xjOU1hfRwvc1E6JZSQQb8DM9+LezJzaavcDjhprQj+kQ0HCzKFvE+Vu1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by BL4PR11MB8869.namprd11.prod.outlook.com (2603:10b6:208:5a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 05:06:30 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 05:06:30 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use small
 modes on simulation
Thread-Topic: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use small
 modes on simulation
Thread-Index: AQHdYKDi+qrv/vO/kE+mkNPHOZFnxrcJBFRw
Date: Thu, 22 Oct 2026 05:06:30 +0000
Message-ID: <PH7PR11MB6796126D448F7B03A7EE3C03E5652@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20261020143830.772865-1-pranay.samala@intel.com>
In-Reply-To: <20261020143830.772865-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: pranay.samala@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|BL4PR11MB8869:EE_
x-ms-office365-filtering-correlation-id: 2e53ae8c-1696-4b02-560f-08df2ffa3bed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|261021123027099003|38070700021|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|261021121427099003;
x-microsoft-antispam-message-info: jXdmOiQNvPhFkXl9ImDlYcAcjAUqe3W+oN8XOe2Luy0bHMN461umQZci31Tu36Vlxfp1E93rUcDetWmq4O4neRtvOuTNKUfYksC28BG7lXH1CvH6qxTbKLdA8a07S/C1znlecA+DiBRtYtPlopkwWB2OYiQKa538c4Kk7skl/Q4n2Sg/ELPDpxA7jjXmDQlf8oIpCUbCu4BkHDpvTaPuKur0m5I590/aS3onMStZPPYPN4VTUE7fo7dbFvPrbxEF5vcDR9pQmhG1c/nJP9QnJpkEOP4tgOCsCTxLLagK+QW7vnyqowozPIjLjrb9geKqMP48GN84ZltfukWOyPLjZ0i/ni1aznumWHmMlq2TrgMLoAJeNr8jHA3rEk7xarr5MqPws+NxE2XVGlyNuIS4YzbkB3RNQsxSSUK/VJDMnf+WKifP4lv4D33PF72mDGCwqC5zs3TvUsrz4VGIEFLAEEXXqwbQ8V7rhH+1PYV4xmbCtYu8lbxXkQ/VdqQhmTByfmCjGuWlslr4q/A5jx0XP4d+Ye1VcFJfCQ6vzPr1jOeiOFdCFsMYysjbBdY5NdApABaQzWgPKBYU5lqdETlz22F1Zqhcj7q1oAysyWp6u1BwltqaTBiZvld2NuV7IANJb/GPJin/2XTcsd7SVeg87R17vQWfoUso+HzQYIubUI6KXA7zVmMNsGx0X5fTrFUkBj6SO06nQ4Or2VAcCK67MnJff0524LQZOJ1YW7T7Dac=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:ja; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261021123027099003)(38070700021)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?WTZLUHpQbnpiRUJaaTlhMXpEMUttaWhRVGRJckFJN2g5TjJCZGpWdG9Z?=
 =?iso-2022-jp?B?NHlxZ2FzMzJ2UDdtVnRNd1UrQzUrejdEZFlWSW5IY0o0eWhxOHlGWDJl?=
 =?iso-2022-jp?B?czlZYUxPYWxucHc2TlNvUW0rVk5jYkdBKzc1MEZSOWVrOFluREJybXFB?=
 =?iso-2022-jp?B?SWtFcjlEMFRJQzVKY2NLVTRBQmpqS2tRZzcxdWpOQTUyT1ZmZnBiTllR?=
 =?iso-2022-jp?B?bHgwVVBXRk45K1pNOHVyQ051YWZVV2NNSXc5UktkS2FCeDRDdVVxamZF?=
 =?iso-2022-jp?B?RmpOZ05XTTJUdXdBQmtmUVZFUVpUZnd5eDlLenFLTEdYaWtpOVhOOTly?=
 =?iso-2022-jp?B?a1pLYkh2UnVXQ1lwS3J4Zk0vWUdvY2JqUWVGOVBYUnFwbElJOWdXQkJ6?=
 =?iso-2022-jp?B?Tkg1TVllU3pxS0tCaE1INENqQW15SzJ5U25vajFQcjR1NXZiSjBjV3h2?=
 =?iso-2022-jp?B?TVJkeUJBTlkrVHg4eGdDaDNWUjZGWTVKY1cyTnlNMC9WL2phYzB3ZndM?=
 =?iso-2022-jp?B?cEpoN3p2bjI0SENFeG56THlCRlIwYkZ6Qm9WWHl2Q091YnJFK1Y1OWJU?=
 =?iso-2022-jp?B?OW15SllyUnRONFgvWGZOVTVGM3BzVEFiQ0gydEZ3bzVTYnRNbTVkcHhm?=
 =?iso-2022-jp?B?U0gwb1VZdjNlSDRyOXdYczdFOUFPUWV0alpxRksyT05oUmVtaVlMcWc5?=
 =?iso-2022-jp?B?Z2ZWc1FrQzBvL0xXNXMrei9hSXJDeTA1YWEyMEFUbkx3UGp1L29UNzdK?=
 =?iso-2022-jp?B?M1ZPK3E3NWQrMWJTYjN1d0ZPQWRVWDFlcEdrYnJ6dEtVdUhlNnI3SUc4?=
 =?iso-2022-jp?B?Z0ppQ0VPaUl5UkQrWTRKazIxQ08zSitnWE5KRVRaUkNtTC8rMDFFcXZN?=
 =?iso-2022-jp?B?R0Vwc1ByR1M0bE9tajgxZHhWMXZJRFN0VzlvVmlGZWtkck81SElMQnRy?=
 =?iso-2022-jp?B?UnlhVWVnQmNYVy91WC9uWnRzS1dVZ0RnVWhxMk1HQm4yMkd6d3M2Sm9s?=
 =?iso-2022-jp?B?RjZMVENyU3N1WlcvNEVZQ0NrditOQ21SLzZmQm8vRndEZ2JnMFF0ZW1G?=
 =?iso-2022-jp?B?d0EyRENpVHNGK2x2aUVyd1J0ZU9jU1lVR3h0NWllc0Y2aStURHF6YmVt?=
 =?iso-2022-jp?B?d3doVFlBWk81S0JvOXdVd1JISGluR2IrWjRZaW15b2pWZ3c4S0c5dlMx?=
 =?iso-2022-jp?B?UkUwQWZuNUh4cmhFMnlpdW9FTjNNeXVJaW1zTzBwcU9URVZCZGdpT2Rz?=
 =?iso-2022-jp?B?T3FMeFpLS2RrckVNSkI2UTdNNE85TGk5SU9zQ0JNaVZ2L2RySDRaUXFx?=
 =?iso-2022-jp?B?WkVVNkZBTEtqeEtoaUdMNWR0eE5BUEtLTFlIUExhTjhwQlpta2dETXFB?=
 =?iso-2022-jp?B?MEtGT3ZDTG1CZ3NuMUhvNFBSZlBrY3RVSkVzbTdpTENGSzFvN1FuUm5k?=
 =?iso-2022-jp?B?cjBidnFpQU9iaHRjWEpLb3NmSTJRT3pSbzAyYXpEM01OQjd4RXdvZ0Rp?=
 =?iso-2022-jp?B?YTYrK0lleHN4TzNUR1Vnb0tKK29rdEVxek91MExyVXI1K0NBY3J2M0RU?=
 =?iso-2022-jp?B?bUc1eUtpdTZFSVNQTmtzbHEveFRuVGJUZkIzVWN0cU1KZmFjbk9hY2E1?=
 =?iso-2022-jp?B?am9sOUdMeHgrUjVYS29aOS9KR1QyNSsxTGMyd2IwV2VJS0hxK0I2Tlkw?=
 =?iso-2022-jp?B?N0svZmxsb2FUR0x4b2JDMEpUMXNiOCtrYlJWZVlCU1pteE5lMjN5d0Ri?=
 =?iso-2022-jp?B?V2o3bVFVMFh1ZEZzZGdjM2RYdDI2c1VUT2NhMlF5N0Z0Uzg4LzFPeVhj?=
 =?iso-2022-jp?B?RitIUnVMQ3dDNU9sa3hISnRxMWNpTzZqUTJQQ0dOcU9hOE5nVUVlTWZw?=
 =?iso-2022-jp?B?L0pGV3JmcVI1blk5S3NXOWh0NnJHd2l0L1VVOEJFNWlZOFJVS0pzZk9Y?=
 =?iso-2022-jp?B?ZHNMTUhQb2sweWhlVlBmRlhOaDVnTHJyM2VrQTBWY09hbWlUOVJKbVZC?=
 =?iso-2022-jp?B?dGlFYUZQV29HWFBrcGVqV2NBZG9wRFpScTgzSUVaVldkQkRtSndxQWR6?=
 =?iso-2022-jp?B?Wm5IV0dDc00vdDRGRUtGTnMvSjdLSkZ6Q2dham5Lb3VPM3U1Vjc0Y3lL?=
 =?iso-2022-jp?B?N3BwM2JnU2F1WlFpMGZGeWhiTFZHbDJoWlQvVzk5Q21CWlQwWklxd1hO?=
 =?iso-2022-jp?B?Rmh2VW4vQmhoUVJjOWhOQ3E5QTM5SW8xNFJsL3ZKZnJnZnI1K3VaRjdB?=
 =?iso-2022-jp?B?aGhIQ1YvOC85K21aU01xWnNCRnhBdXgxWnlDUlF0V0crQmZnYUNmQnBR?=
 =?iso-2022-jp?B?UlE2ODdzUlNiQjFYbUNHVDUzeUtCajhBK1dhZU9pZ2h2TW02OVJJRmxP?=
 =?iso-2022-jp?B?UU9QRVE4bFpSNnNEOG16bzhya0xwYlB5UnRGU3FwREtxbTBoVURjanZI?=
 =?iso-2022-jp?B?dC9kYkY3MEkzM3dWbVJPNCtqTndKVWJheXczTFZaZ1prZGFkTStZVTc1?=
 =?iso-2022-jp?B?NUxzMHRj?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NOx1YbOoziKwApu2wlCxkII6jW7IBdYvkGE8qiy9T+RrKVqR+iSICPCD2HJcy9Z07K/QvJZoTse7yrdM3OpRsCsALdfKPOVBvLNEhczU5LEc6Dc0xgjBJC4fe08/Ep8MYoyc0iVCdFCCtO2rN99xVoCFM7WLe2TKqUiDum9BsAAWXyW4S9QT497YX8YHcG3wBzrHnel8t/7cSeayflxfNrBFNyp2chsB4zxRntI96lN9KWIkYAuk+wV/iyLboLioDfuGQMON22PX7D+WsBfFGgO91JJM3mmwSIwFLstYk8JYD9WWjN3J6eYYNkGZKyN4zRI5VwH7WsO92FE3rx3Jog==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e53ae8c-1696-4b02-560f-08df2ffa3bed
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 05:06:30.3071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I2/oJqfslxXQN4S+Qe4GDCL3KOtO8QWoK/XGp/rp49cJ2szEdoG2KYg7MBmli8D6W3f1jR8VI9+UCfZ+78Q6fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8869
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

Hi @Pranay Samala,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: 20 October 2026 20:09
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use small mo=
des on
> simulation
>=20
> Due to slowness of drawing on simulation, use the connector's smallest mo=
de
> and draw only one rect in draw subtests when running on simulation.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/kms_frontbuffer_tracking.c
> b/tests/intel/kms_frontbuffer_tracking.c
> index 8d5afdac2..3f345f644 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2997,7 +2997,7 @@ static bool op_disables_psr(const struct test_mode
> *t,
>   */
>  static void draw_subtest(const struct test_mode *t)  {
> -	int r;
> +	int r, n_rects;
>  	int assertions =3D 0;
>  	struct draw_pattern_info *pattern;
>  	struct modeset_params *params =3D pick_params(t); @@ -3043,7
> +3043,9 @@ static void draw_subtest(const struct test_mode *t)
>  	prepare_subtest(t, pattern);
>  	target =3D pick_target(t, params);
>=20
> -	for (r =3D 0; r < pattern->n_rects; r++) {
> +	n_rects =3D in_simulation ? 1 : pattern->n_rects;
> +
> +	for (r =3D 0; r < n_rects; r++) {
>  		igt_debug("Drawing rect %d\n", r);
>  		draw_rect(pattern, target, t->method, r);
>  		update_wanted_crc(t, &pattern->crcs[t->format][r]); @@ -
> 4373,8 +4375,12 @@ int igt_main_args("", long_options, help_str,
> opt_handler, NULL)
>  		if (opt.tiling =3D=3D TILING_AUTOSELECT)
>  			opt.tiling =3D drm.display_ver >=3D 30 ? TILING_4 :
> TILING_X;
>=20
> -		setup_environment();
> +		/* Full-size modes are too slow on simulation, use the smallest
> mode.
> +*/
>  		in_simulation =3D igt_run_in_simulation();
> +		if (in_simulation)
> +			opt.small_modes =3D true;
scaledprimary_subtest still does the same relative thing (half-size region,=
 quarter-size region, upscale by aligning to 4), so it won't fail or crash =
? the ratios (1/2, 1/4) are preserved. What changes is the absolute pixel d=
imensions and alignment edge cases being scaled: a 320x240=1B$B"*=1B(B640x4=
80 upscale exercises the scaler hardware differently than a 960x270=1B$B"*=
=1B(B1920x1080 upscale would. If there's a scaler bug that only manifests a=
t specific large resolutions or specific odd pixel counts, running this sub=
test against a tiny simulation mode could miss it.

Regards,
Sowmiya S.
> +
> +		setup_environment();
>  	}
>=20
>  	for (t.feature =3D 0; t.feature < FEATURE_COUNT; t.feature++) {
> --
> 2.53.0

