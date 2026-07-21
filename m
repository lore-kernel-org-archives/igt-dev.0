Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A52AC4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 08:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3F210E6DE;
	Tue, 21 Jul 2026 08:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPFbydmT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C5D10E64A
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 08:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784620949; x=1816156949;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KFADOtqkxl2rJ+X7AM2t3UuDgyCigJoQNR+wnCHimxE=;
 b=FPFbydmTVukQug++qgik3Wxp8JDUAHCPCStNpabugbDhDWrNsqnyNx8K
 NND99Zv28/9TasRraqGQ4T5Y4fId5xkWbC4Hqs6kIVpEoi+36EK0SbVuT
 lQJgY25fDXI4PhYSJJ6t3nF5nPH6DKwFp39IIxpU9CXy62ckywuP+0Hyq
 TVQF+iGFksuuIPAssUcuLuu6ZgkJlSdJ77SWrE28dTTcbnmkUd5hK8U2+
 SE6Z8o366VoI8ys4E1KM8xlcM0a6XfY7x+1/G+TkIgbQ/ku/s57t8wFJ6
 JPdnzgsA6UeUCw7DjKV3lgh4rm9n7TE33scaWGMZovB/Y9/+SOeV777UP Q==;
X-CSE-ConnectionGUID: qqHHn3oWTaG2bGdJwZEBMA==
X-CSE-MsgGUID: 3kn1brdaTpSzZRgdmhbs/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="107999927"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="107999927"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:02:29 -0700
X-CSE-ConnectionGUID: QjQ9bwzwSZKR07ZkLBJHKA==
X-CSE-MsgGUID: kf5c5BFDSI+BBEw18dJhhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="257754372"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:02:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 01:02:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 01:02:27 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 01:02:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJKr4JsyCZpVPO0YfdxoThpEK+kK0JVb6qzDewbROXPfqWz+pO08winqF6aUi//XStSzEvwHgYctcBB9gDG60BykvVQpZOZd5KpBd2FUzg7Oz3l83opgvgmyDmIbJcvfFF5rFSw8VaqhnfrSHtB5nVrzEsu5xuwzCgRn6ls33ff78a3ZrYYr0k+KircJIOwqdnGmeVPQKUnrLcTGZz4qdnFVEygMVwn2pFjixHe0FnIdrq6BfMU14B2G631pTz80DH0+RMOa2pxNzOdzGt5uzEkz9GmaVbZYqw2GLeDIdgO6m+mVfvMp3z8W7Sv6ylKMEUC6Yuurs8Sgbj/B+0VnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFADOtqkxl2rJ+X7AM2t3UuDgyCigJoQNR+wnCHimxE=;
 b=C15DcLnbGD0y2u/yOxPJQfgyDIzAknQcU9HxG/a0rnqwCaXQKh/CZkMm/m/b0b6c4llT1WUxd0tIQe1R2efCgxAcv67r6V0E0vs5tP83cYZnjCTAX6ZlOWMJm1OIIZS25wU99zTNYqfw2bJRbyx6cmOwIlBr4iVBlIJKLITm0cEC1WCxc+EDmQIyHlWxU/lyM2JJXpCLhpIzMXvjw8VraRllFDkeVJQ73pDbcQfc7kPfghVobHilh1tLP1Gsg7dzT+WceQHi7VO7hePshluwaU+MsgYcfUwqSIdk/g5sjs4HtutggpWt3VJWAA7QaEu5ygdVq3LkBdrYMxB5yV3GyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 08:02:24 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%3]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 08:02:24 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t v1 12/16] tests/kms_sharpness_filter: limit #outputs
 tested during suspend
Thread-Topic: [PATCH i-g-t v1 12/16] tests/kms_sharpness_filter: limit
 #outputs tested during suspend
Thread-Index: AQHdEqaofBsT+fpc30eECs2u9QzjRbZs/EVggALcQgCAB9CRoA==
Date: Tue, 21 Jul 2026 08:02:23 +0000
Message-ID: <IA1PR11MB64672294E9F2A39D0656A80DE3C22@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-13-michal.grzelak@intel.com>
 <IA1PR11MB6467A9718AEB60E607D3A09CE3F92@IA1PR11MB6467.namprd11.prod.outlook.com>
 <964bf595-6ab1-23aa-5df4-404d491d6943@intel.com>
In-Reply-To: <964bf595-6ab1-23aa-5df4-404d491d6943@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|IA1PR11MB7198:EE_
x-ms-office365-filtering-correlation-id: 05710668-fc02-4bfd-0aab-08dee6fe65ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|3023799007|38070700021|10067099003|56012099006|11063799006|4143699003|5023799004;
x-microsoft-antispam-message-info: ZKi3B/bizjFzReCR14j2HqZTPRrdMq/6jY+hpFujnegcNG5kDQUUuN7c+Pz3F8DUu+2+9BDwJR56vnjsFkHKAKJ9H73V6pwKvvH9YSaGVv2iKFP8f3isItH83vQEQXEI1KbTgsQ/UNyDppmkqh0HPNFhLRwNGOk6DiQ5P9NxwPZ8ZnDHt0YGXDgZernC1e2dc0943LD+ZIHihb9BBBueSzg0NehMzetSLMhf7KeVmj9DQcVyr+t2lY/RhmzkGTiR6+1gk/wdgZNO8v9El7VVO3vdF6Q44dcQZHwRSKZU7dmw7xsfHfVg1uPLA1U0WlzFOKbwAXgF0sRWM7WqodxHf2xcIBoJ5rJMUmrcYKRWdwOZneWbUTmqXi9MBdO9VfAKFHE+uTtJHX6m8+MnooaLIPPn51UNXb6JXfmgdBF+v7qhl8KFXtVb6huLyjKX8yJ58l0wFMBlX2xu7otnKmMnbs4ihP4PtPcWyRd3NLWHutGw4n6KTRAJOOj14XKbi/oF4Uuqip7Nl1G3/66xk/bmm77kY1qgkFQRZCsF+LKzSaLmnJmNDJY8Xbm9RcOE/E/hFgdQ/ojdmqotrWXVExeWye6p417v49iHwaZLChfFxwBG0Y+DtvNzmpveCQeK5yWNIhlgd7XaITlLwGSKQ2a6LglfwbcXXMrukf4SajzUGxF5BLJRV0NbsSLS31c9upEQqnKPVjW2RAAUV5o/PqNL1+wxSGY7CFkBO4KD+inMIlA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(5023799004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDBCYi82U1dOODhadllNc2dXeWtrQU5mdXVxc2dzbTRkKzBDcDRhVFRWWUtC?=
 =?utf-8?B?akVLQkRCWXFab1BpWFU1RzhUSVZxeVZmTm50ajB1UnFKd0pSQkx4NE5XQWdm?=
 =?utf-8?B?R1BKWnBLdVJNVGJ3NFZ4RkdHb3BTRXZKY29rNis2WkZaMitCWXE4emlFS2pq?=
 =?utf-8?B?ZFZhZXRkVWlZT2FsdnlTbEh4NHUzYnQwWkN4UUJpWjI5OXp4M2VsS1grYXhT?=
 =?utf-8?B?b3NCQnZwUUwyY051bzVYM1VVUkJnRHRaUUVmaVowdUxpeTZ4ZmkwQjArU2F0?=
 =?utf-8?B?SE9KTHdrQXBtN2hucUxxK3VtVU9tWHNmcjVQV3lXWkhrMG5yRXVWeXQrOThO?=
 =?utf-8?B?UUIxRzVVUE8zRmJ2bEtFcVNFTExSYktNcmI3NGtYRlp6QVBRaEhMdDNEUkVY?=
 =?utf-8?B?SFJnT3MwNFZqRllUdTdKNGoyNnJKZnVHUTNFVXRpbXUwYjFLOXNJeVcyU21i?=
 =?utf-8?B?V0htY0t6WHVVNTF6b3YzdUE5NVNEN1gxM0xVQytOZ01WT3ZPV0pkd2FqMWtn?=
 =?utf-8?B?cmJKSUZsU3ZPaS9xbE5qSkpzQmdsL3RnSitBY0JQYXBMazNaOTZhSEN6WXEr?=
 =?utf-8?B?K2QxSWxMR3VPWWdCVGhqZ0ZFbkhHaTV6cW1LbkZ2THdqTmRMdTRZOWN0K2Nk?=
 =?utf-8?B?cUY4S3VCakl2a3k5c3c0RjJQc3dxNTUzQ0hOTUVSWVJaeVlYaE5nZkpMRzVL?=
 =?utf-8?B?Y0ozT1M5Z1ZNUVJORysrTmtROXg0eEZ5amRabkdYTWlDVThwZVRnOHpxamty?=
 =?utf-8?B?MTBvbjB5UGY2YXZnUTJTUHA5UGU5NE1kWkRZUGY4WWlQS0xFd3lWbThiK0JG?=
 =?utf-8?B?Mlo2bEpXdlVKTXR4MTFtWFoyd01RSnBsN0UvOFR4VGlHRjZXU3B3Vm81clhj?=
 =?utf-8?B?S3V5RlVNaVZRcW5VTGZ6bGxBUUZ1cDluTmRsVXd6QjBVQkY4UkxtaUNkNGdu?=
 =?utf-8?B?Z0ZESGZLOHlaQ2RWYkRNREJ4dUhTaHkvUlJ0Q2lQUXV0MEd3VzlDTUIreW1o?=
 =?utf-8?B?ZlBtM1E3RkVpdFl0ZGpFakxTOUFRN01BQm16OGNyTjVoVkI0KzFjRXhqaytp?=
 =?utf-8?B?aXp0SEdnV2tkZDZGZ3dUWjJIUTh0b2lIa05leXJKSW9NdTNPc2RoTnVadWNv?=
 =?utf-8?B?OTlIQmw0S1lYQ1dIb0V4WEFQNkY1NEdXZW8rQS8xUXBnamhuZWRRRkVEaCtL?=
 =?utf-8?B?aXYzZldZdnlhWGV1VmZBdUNneDZxV3hxVi9YOFFRNmlEcng5Q21MS3ZLMDJ4?=
 =?utf-8?B?bXREMjZwZGVkUlZZbGNReTdUS1dDWGw2amRlRW5lek4yUnAyaWIwSmJHN0pM?=
 =?utf-8?B?czN6Zk5WQVh4amhpZ205dlZDSmcxSEdFaU5mSVhXKzJVbzVybU9XQTBBQVlw?=
 =?utf-8?B?WWdXUXptQnZySml5bHNiSEIybFgycnBwVUo5bWlpZFlwU2k3LzB5TzlhczJT?=
 =?utf-8?B?dnhGLzdPZzRlN1M0L1JNcTJWOE9Oa2wvbFI4SUgrOUpZMUtsWGRiYnB5Sk9n?=
 =?utf-8?B?dVdna01xcUdBeGgrNUtKOFBOV0c4Y0NSYVVrdUNIN0xwYnpLaURyVWdpOCtB?=
 =?utf-8?B?bzhMNHJ3aGxRWEpZQ2lPN05pd2oyL3RmTmRVNk1wd0RpU2VOWTVnMVV6YmRZ?=
 =?utf-8?B?ZFpad09nU3ZkQ3UxNFhKd0kyOE9MMytXUDJZWUpXUzV3alh3M3ZhVTdCU3RK?=
 =?utf-8?B?UC9VRXR6TEd4VGl0NWE5SFM3aFpWK0ZGaThWS0lRRkRadExZR2lYczBxaWhY?=
 =?utf-8?B?SUNKRytnenVuaWtjZ2RZK2sydW9ZQ1o0RG91RXFMTTVEbTNaSXc3elg1S2Qy?=
 =?utf-8?B?RUFOUTZ5OTkvR0NReVFQeDVCZHJTL0JvVlhBQzVjQmZ6eVlpTmJNbWlQTnVa?=
 =?utf-8?B?Q2d3Y0JLN1REWlNxRVlGanFCTmZISnQ5U09MOXIyUDdDaTVLQ3lWQjRsM1hr?=
 =?utf-8?B?ZDM3cm5PcjNkQ1Fsci9HZE9SNGxlSnhPTGgwZU56dCtMT1pHRnFOYzFSZysw?=
 =?utf-8?B?eXlkOWtOTlZyNUp4Z0ZNTUhrTG40cG1nWk4vUFEvcUl0blVUMVhIRmh6dnVJ?=
 =?utf-8?B?eGN1c0tEYVNaZVliVTJQc2hIZGVRSHhwUUdHYjlVRFRsbnh0R0c3cVRYN2N5?=
 =?utf-8?B?Myt4a2gxM2ZZc1V4bnVCOXJGSCtwWjhobEx4dEN5OHpXRWhjNmNzSUk1WFhX?=
 =?utf-8?B?UDNRRXkvVVJDM3hGNWkrMUFPT1ZVbFlBdjZzNGZQa28wczJFM2VabEd0RFRy?=
 =?utf-8?B?N1RvWW9vdWpqT0RzTWd1d2s0UEl0ZFRvU1J0eWtQc3g0dXI5dzljT1lkNVBt?=
 =?utf-8?B?di9hUHJpSlo3TnBlVkdhdzdxN2lJNUh2QzZJQm1Cam5pNEpYbVZLdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bF71kUCtK8/BuQBJ4njdGT2FOIrbA5FXfP+VzKZPahB1UeeeZpuB4o8l7gDt60n5NFVJCgdIDFJruHH5MR8BR3ZH0PU1TaPoCdFLOPM+KckQ/ITHtlWUTovOUVb9tJxG5yxJsDVN8vqCpekLpbuvZjJb2ZajQmUjHj2YYNP/U24afaEVw5J3NoFhmFxZkuoqPbTfjlE9h2HOuodap35xXvIFAvUFMpKsS7DUXjg+UNXJjZLiOpjhS1bWyqI8sDIA0POr4kY2WIPAlOKUkoRQjAycai1fCEQG/3DGZyMrU5v73RDC4eQl7AnzOCcLqAsema7HEANcvXIZgaN4HYy/NA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05710668-fc02-4bfd-0aab-08dee6fe65ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 08:02:24.0146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Dnwuu2+9x+b6b4WoFyhRIQQno4xwY9E9kbd1bYSUbuDDtlnM9BVzZ03GXp/kXFL6Az+4O7WeTRcMDp9vxC/AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3J6ZWxhaywgTWljaGFs
IDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDE2LCAy
MDI2IDI6MTIgUE0NCj4gVG86IEdhcmcsIE5lbWVzYSA8bmVtZXNhLmdhcmdAaW50ZWwuY29tPg0K
PiBDYzogR3J6ZWxhaywgTWljaGFsIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+OyBpZ3QtDQo+
IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFRoYXNsZWVtLCBNb2hhbW1lZA0KPiA8bW9oYW1t
ZWQudGhhc2xlZW1AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIGktZy10IHYxIDEy
LzE2XSB0ZXN0cy9rbXNfc2hhcnBuZXNzX2ZpbHRlcjogbGltaXQgI291dHB1dHMNCj4gdGVzdGVk
IGR1cmluZyBzdXNwZW5kDQo+IA0KPiBPbiBUdWUsIDE0IEp1bCAyMDI2LCBHYXJnLCBOZW1lc2Eg
d3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBG
cm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBC
ZWhhbGYgT2YNCj4gPj4gTWljaGHFgiBHcnplbGFrDQo+ID4+IFNlbnQ6IE1vbmRheSwgSnVseSAx
MywgMjAyNiAyOjI1IFBNDQo+ID4+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiA+PiBDYzogVGhhc2xlZW0sIE1vaGFtbWVkIDxtb2hhbW1lZC50aGFzbGVlbUBpbnRlbC5jb20+
OyBHcnplbGFrLA0KPiBNaWNoYWwNCj4gPj4gPG1pY2hhbC5ncnplbGFrQGludGVsLmNvbT4NCj4g
Pj4gU3ViamVjdDogW1BBVENIIGktZy10IHYxIDEyLzE2XSB0ZXN0cy9rbXNfc2hhcnBuZXNzX2Zp
bHRlcjogbGltaXQNCj4gPj4gI291dHB1dHMgdGVzdGVkIGR1cmluZyBzdXNwZW5kDQo+ID4+DQo+
ID4+IFdlIGFyZSBpdGVyYXRpbmcgdGhyb3VnaCBlYWNoIG91dHB1dCB3aGlsZSB0ZXN0aW5nIHN1
c3BlbmQuIFRoaXMNCj4gPj4gcmVzdWx0cyBpbiBleHRlbmRlZCBleGVjdXRpb24gdGltZS4gSW4g
dHVybiB0aGlzIGxlYWRzIHRvIGhpdHRpbmcgQ0kgZW5mb3JjZWQNCj4gdGltZW91dC4NCj4gPj4N
Cj4gPj4gQnkgZGVmYXVsdCBsaW1pdCBudW1iZXIgb2YgdGVzdGVkIG91dHB1dHMgdG8gMy4gVGVz
dCBlYWNoIGNvbm5lY3RlZA0KPiA+PiBvdXRwdXQgd2hlbiBwYXNzaW5nIGNvbW1hbmQtbGluZSBw
YXJhbWV0ZXIuDQo+ID4+DQo+ID4gV2hhdCBpcyB0aGUgcmF0aW9uYWxlIGJlaGluZCBudW1iZXIg
My4NCj4gDQo+IEZvbGxvd2VkIFsxXS4gRm9yIGttc19mbGlwIHJ1bm5pbmcgMiBwaXBlcyBhbmQg
bWF4IDMgb3V0cHV0cyBmaXQgaW50byB0aGUgQ0kncw0KPiB0aW1lb3V0LCBhbmQgNCBkaWRuJ3Qu
IEFsc28gbmVlZGVkIGFueSBudW1iZXIgdG8gc2V0IHRoZSBsaW1pdC4NCj4gDQo+IFsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9pZ3QtZGV2LzIwMjYwMzMwMDc1NTA4LjEwMDM4OTktNS0NCj4g
bWljaGFsLmdyemVsYWtAaW50ZWwuY29tLw0KPiANCj4gQlIsDQo+IE1pY2hhxYINCj4gDQo+ID4N
Cj4gPiBSZWdhcmRzLA0KPiA+IE5lbWVzYQ0KPiA+DQo+ID4+IHYxLT52Mg0KPiA+PiAtIHJlbW92
ZSBhYmJyZXZpYXRpb25zIChKYW5pKQ0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYcWC
IEdyemVsYWsgPG1pY2hhbC5ncnplbGFrQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICB0ZXN0
cy9pbnRlbC9rbXNfc2hhcnBuZXNzX2ZpbHRlci5jIHwgMTggKysrKysrKysrKysrKysrKy0tDQo+
ID4+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
Pj4NCj4gPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19zaGFycG5lc3NfZmlsdGVyLmMN
Cj4gPj4gYi90ZXN0cy9pbnRlbC9rbXNfc2hhcnBuZXNzX2ZpbHRlci5jDQo+ID4+IGluZGV4IGYy
ZTNmYzk0OTQuLmFkZWM0YTYwYzUgMTAwNjQ0DQo+ID4+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19z
aGFycG5lc3NfZmlsdGVyLmMNCj4gPj4gKysrIGIvdGVzdHMvaW50ZWwva21zX3NoYXJwbmVzc19m
aWx0ZXIuYw0KPiA+PiBAQCAtNzQsNiArNzQsOCBAQCBJR1RfVEVTVF9ERVNDUklQVElPTigiVGVz
dCB0byB2YWxpZGF0ZSBjb250ZW50DQo+ID4+IGFkYXB0aXZlIHNoYXJwbmVzcyBmaWx0ZXIiKTsN
Cj4gPj4gICAqIGlzIHNlZW4gd2l0aG91dCBjb3JydXB0aW9uIGZvciBlYWNoIHN1YnRlc3QuDQo+
ID4+ICAgKi8NCj4gPj4NCj4gPj4gKyNkZWZpbmUgT1VUUFVUX0xJTUlUIAkJCTMNCj4gPj4gKw0K
PiA+PiAgI2RlZmluZSBUQVBfMwkJCQkzDQo+ID4+ICAjZGVmaW5lIFRBUF81CQkJCTUNCj4gPj4g
ICNkZWZpbmUgVEFQXzcJCQkJNw0KPiA+PiBAQCAtMjMxLDYgKzIzMyw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc3VidGVzdF9lbnRyeSB7ICB0eXBlZGVmIHN0cnVjdCB7DQo+ID4+ICAJaW50IGRy
bV9mZDsNCj4gPj4gIAlib29sIGxpbWl0ZWQ7DQo+ID4+ICsJYm9vbCBhbGxfb3V0cHV0czsNCj4g
Pj4gIAlzdHJ1Y3QgaWd0X2ZiIGZiWzRdOw0KPiA+PiAgCWlndF9jcnRjX3QgKmNydGM7DQo+ID4+
ICAJaWd0X2Rpc3BsYXlfdCBkaXNwbGF5Ow0KPiA+PiBAQCAtNjE0LDkgKzYxNywxNiBAQCBydW5f
c2hhcnBuZXNzX2ZpbHRlcl90ZXN0KGRhdGFfdCAqZGF0YSwgZW51bQ0KPiA+PiB0ZXN0X3R5cGUg
dHlwZSkNCj4gPj4gIAlpZ3RfZGlzcGxheV90ICpkaXNwbGF5ID0gJmRhdGEtPmRpc3BsYXk7DQo+
ID4+ICAJaWd0X291dHB1dF90ICpvdXRwdXQ7DQo+ID4+ICAJaWd0X2NydGNfdCAqY3J0YzsNCj4g
Pj4gKwlpbnQgb3V0cHV0X2NvdW50ZXIgPSAwOw0KPiA+PiAgCWNoYXIgbmFtZVs0MF07DQo+ID4+
DQo+ID4+ICAJZm9yX2VhY2hfY29ubmVjdGVkX291dHB1dChkaXNwbGF5LCBvdXRwdXQpIHsNCj4g
Pj4gKwkJaWYgKHR5cGUgPT0gVEVTVF9GSUxURVJfU1VTUEVORCAmJiAhZGF0YS0+YWxsX291dHB1
dHMgJiYNCj4gPj4gKwkJICAgIG91dHB1dF9jb3VudGVyID4gT1VUUFVUX0xJTUlUKQ0KPiA+PiAr
CQkJY29udGludWU7DQo+ID4+ICsNCj4gPj4gKwkJb3V0cHV0X2NvdW50ZXIrKzsNCj4gPj4gKw0K
PiA+PiAgCQlmb3JfZWFjaF9jcnRjKGRpc3BsYXksIGNydGMpIHsNCj4gPj4gIAkJCWlndF9kaXNw
bGF5X3Jlc2V0KGRpc3BsYXkpOw0KPiA+Pg0KPiA+PiBAQCAtNzY2LDYgKzc3Niw5IEBAIHN0YXRp
YyBpbnQgb3B0X2hhbmRsZXIoaW50IG9wdCwgaW50IG9wdF9pbmRleCwNCj4gPj4gdm9pZA0KPiA+
PiAqX2RhdGEpDQo+ID4+ICAJY2FzZSAnbCc6DQo+ID4+ICAJCWRhdGEtPmxpbWl0ZWQgPSB0cnVl
Ow0KPiA+PiAgCQlicmVhazsNCj4gPj4gKwljYXNlICdvJzoNCj4gPj4gKwkJZGF0YS0+YWxsX291
dHB1dHMgPSB0cnVlOw0KPiA+PiArCQlicmVhazsNCj4gPj4gIAlkZWZhdWx0Og0KPiA+PiAgCQly
ZXR1cm4gSUdUX09QVF9IQU5ETEVSX0VSUk9SOw0KPiA+PiAgCX0NCj4gPj4gQEAgLTc3NCwxMSAr
Nzg3LDEyIEBAIHN0YXRpYyBpbnQgb3B0X2hhbmRsZXIoaW50IG9wdCwgaW50IG9wdF9pbmRleCwN
Cj4gPj4gdm9pZA0KPiA+PiAqX2RhdGEpICB9DQo+ID4+DQo+ID4+ICBzdGF0aWMgY29uc3QgY2hh
ciBoZWxwX3N0cltdID0NCj4gPj4gLQkiICAtLWxpbWl0ZWR8LWxcdFx0TGltaXQgZXhlY3V0aW9u
IHRvIDEgdmFsaWQgcGlwZS1vdXRwdXQgY29tYm9cbiI7DQo+ID4+ICsJIiAgLS1saW1pdGVkfC1s
XHRcdExpbWl0IGV4ZWN1dGlvbiB0byAxIHZhbGlkIHBpcGUtb3V0cHV0IGNvbWJvXG4iDQo+ID4+
ICsJIiAgLS1hbGwtb3V0cHV0c3wtb1x0XHRFeHRlbmQgc3VzcGVuZCB0ZXN0cyBmb3IgYWxsIG91
dHB1dHNcbiI7DQo+ID4+DQo+ID4+ICBkYXRhX3QgZGF0YSA9IHt9Ow0KPiA+Pg0KPiA+PiAtaW50
IGlndF9tYWluX2FyZ3MoImwiLCBOVUxMLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsICZkYXRhKQ0K
PiA+PiAraW50IGlndF9tYWluX2FyZ3MoImxvIiwgTlVMTCwgaGVscF9zdHIsIG9wdF9oYW5kbGVy
LCAmZGF0YSkNCj4gPj4gIHsNCj4gPj4gIAlpZ3RfZml4dHVyZSgpIHsNCj4gPj4gIAkJZGF0YS5k
cm1fZmQgPSBkcm1fb3Blbl9kcml2ZXJfbWFzdGVyKERSSVZFUl9BTlkpOw0KPiA+PiAtLQ0KTEdU
TSwNClJldmlld2VkLWJ5OiBOZW1lc2EgR2FyZyA8bmVtZXNhLmdhcmdAaW50ZWwuY29tPg0KPiA+
PiAyLjQ1LjINCj4gPg0KPiA+DQo=
