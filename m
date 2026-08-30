Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48697C61DB9
	for <igt-dev@archiver.kernel.org>; Sun, 30 Aug 2026 18:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668E810E20A;
	Sun, 30 Aug 2026 18:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXUnOCYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE1D10E20A
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Aug 2026 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788115703; x=1819651703;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wr+sviAxLY/HbfzSoZtMvhqw4gG7JDZsAvE0NAZvwXY=;
 b=BXUnOCYNEQ7CiGHqA7yyII9XPIMkMB9wHQvs7H7Boafxg654xHSoICK7
 0nYHFtbFt5dYmfCOiFaha2uDNu5015anLjUfQISWYE0xLUGSQQjjhEAU7
 0gKj0xU77yfJRJ1qGLNz7D1UHFy1eZ/MCb8h7GJtgXPOtZ85bCkJuWIPT
 BL2hYKJ8vnbGOmrj/+V9rMNY0gl9AiGargrxUcyL4VjnDuKRrCi72/bJW
 Z3wlR5GsRBgIHeWgGGu2H9MgvRh2wmV930Qby3TYYOdSJvP5BDCgm4fjf
 +f+AfYYnHjJl/S7SYhRvIz37xN7I0ks1x30z8zkt7oz0GdtmPU/YxlGzE w==;
X-CSE-ConnectionGUID: l5UXUNmyTPWR6i9ak51K/Q==
X-CSE-MsgGUID: 2OgYdaoMQI+dCv1Ugijc1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92219003"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92219003"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 11:48:22 -0700
X-CSE-ConnectionGUID: 2L7aLTZgRgq4kRhUM6lMww==
X-CSE-MsgGUID: eGtoBeOATf+b83jMychwzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="262486269"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 11:48:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 11:48:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 11:48:21 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 11:48:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqS3eTCRZmu33jGHth87YyCXbO87IknkOZ7fPe1Ec7QPW6YxLBsvPco8lhUPZyeWHDescPls8OAoAUhTOJGMMXnmgutyio0VfkXi5plBC4zQ7XFTp02p012RtLCt085xVLZEFKvbXT0ycCQLS4y2fZEBERAB3UDNZmuJ4Ob1mJmGhgT2H5wPxpdyHGsgrID1Dwlpa8vj48dKWuWXa46oE6Ke5ddVFWZba8g6AUJyCpVIUcGc0dYmcOa6S87/QKsIO/oUfYwFvUCJ5SSFHV9G/IDWzp0rYjGnrq9Wz97GOPS7VOsV3mwtyBgnHYjpmy7eji3Gjn+ZV63ninpQWxp2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wr+sviAxLY/HbfzSoZtMvhqw4gG7JDZsAvE0NAZvwXY=;
 b=Lhl5vsbvH3k8CA+Ms1bphfSVlAj4TMf0mrObSelF8pUN7lGTyalKWk9IY2hmHYERyL8/d73c6heeqYajT+U1se7wgo5BoWT/nPKnMalDGpDU/T7mJkeWfZMKLzPrNVjnf260hyiNc+ckafWUJLxLq1kpRadGiXWXg77Gn5uwqGpLYAJDSpyvB7DV3d063Bim14CSXuwX77dVqMKjamHC3eK/eB3mgQrzuU0L4PDUcWRn/JZtLrJoQ9HX9pQ6f9d0/iuKnE6IakZfjGpjc9Rf5GAADjV8AMSUnGyiUh1rU3xyHZKajKYDHHKHNXeWN+CxXwp6K+JL9DGjUL9F+g7Aiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 18:48:16 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 18:48:16 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v3 03/17] tests/kms_async_flips: split outer test
 loop into two
Thread-Topic: [PATCH i-g-t v3 03/17] tests/kms_async_flips: split outer test
 loop into two
Thread-Index: AQHdMWtv9m9LkVCKOk6B8M0slPt5+La2+Yyg
Date: Sun, 30 Aug 2026 18:48:16 +0000
Message-ID: <CO1PR11MB491341D10B56BD337C3E8F47E4AA2@CO1PR11MB4913.namprd11.prod.outlook.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-4-michal.grzelak@intel.com>
In-Reply-To: <20260821124834.1974029-4-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4913:EE_|PH7PR11MB7003:EE_
x-ms-office365-filtering-correlation-id: 843bbc39-190c-437f-9776-08df06c740b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10070799003|38070700021|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: 7jp9V2YGCZhIphEe6petcdY+3lDC+MUA/yC9CfCJxRC+rwVX6fqz/grNjO2TYnPa6P5Qnz8BCW2kdV2oLvg4ulqbQ/88MCmeUSY5U1EQIRedyOfyZ5OVTURqowbgOf00zt8ilHEqbv0kzt9r83jIYE6t21mEXphZO/O9oIa0ZxROmINJ5lqBcGXf6yHaSBDPZV0QM0jLNDERavqR8IEYVzV0tuMbVuXeC8YP4CPkTmrCImafYPviPOJMmXpy0KTjeK9YK2UVyKnRMYlek48+tKAIxISfQsWvbsQht6y/dVbmqZFYoaWQDQw0YbgkzX7WbcBSlOYINmT5ei34SVemUsFwfFockRsrcNeZoMRn4OHYs5LoW8YwO78rINFGAoumcwYBqGiX+VkZFjvcURO74PyZk76rVTa+tW+PlgTgLxKEe6BRvbk8ZyVVsiMANFxhp3xikNsKpRAFrH+hn1BF6KzMbJCjO3g5G/hy1t6CEmSFvM7wGd9r1GnREPstlSxgMIl35EYve5SB4rWxqxtYCBfNHYyZRNU2gpR7S9QykuWoPgQrM93fj3wxqxQux5dPUQpPfmuaeXqp4atVakYQl6gK2xNQjN/rCFt77AITRPrk/6vK9i4wU/VRA3ncE5bUL+ihvE0GXxBSl813y7Sa/n5iJCatp3rwNS/hnwGdenZB1ao3RBy/kNJkhXBblrjNX74//MLZ4z5YZSzcHPsDoGdBIDi664D2xtaKumQWU+Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10070799003)(38070700021)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWlSUWpwRkRLVy9HbU9YRDd1TlpaU04wMWlxbHY0S2FpdFVHdi9Zd2lONXUr?=
 =?utf-8?B?eHRiY3lWTkVvU1RPWkhhaFl1K2QxMU9VY0d2VjFDL2xKVXlzQ3RXZDhMd255?=
 =?utf-8?B?TnZhT05hL2p2OTh0M3pCVDRxeHNMTXJLTVE0bDNzYUV0OWlKa2o1WTZOWCtW?=
 =?utf-8?B?WHhrWHFZSUFyS3FVOUZzbnN0clFSWlF4NWg3VlVsRHJybVlra3YzS1BMWFhw?=
 =?utf-8?B?b3MwaEh0SnY5ejNiYWZtQmI5Vlg0T2pmcEJwVW1DL1gyRXhkWFhwei9PbzR0?=
 =?utf-8?B?dXM4UmRzUDIrTldPSHphdFYxRU10bzJLbThESkR5eUVySU5ITFh5RUpFWDRJ?=
 =?utf-8?B?UjYzVVg2WkpqTUpvQm1QaEpvYm5jaEtGc01XZWRxQStkc1Jhc1I2MEphU3F4?=
 =?utf-8?B?NlZ5enR0dGZQWWU3Rmc3ZDJHL200WGNDSkpGZHltcFRqVk1MOFFrUmJzbUJv?=
 =?utf-8?B?d1pKbUZVSnVUdEdGUlFzU3RsQ1phS05Rby9ZR3d3RnkzbnkvQjVvbnVUWThM?=
 =?utf-8?B?V0owZXBZRmVPZ3BWL1U0SzBycjhyWUtKc2N2Q2pCZUlaWm9vMWxIcVcwQkxi?=
 =?utf-8?B?Ui9jamUxSmZLeUF6cUZqNms2Q3R2OHZaTys3L2J3RWNiNEQvMXl6L1RwT0Q4?=
 =?utf-8?B?NGNBR0pVNnNTOEZoZVZBbS9BT0MwZFZvYUxsMWJXQllLd0IxcW5Jblc4aGVo?=
 =?utf-8?B?YnRnVnVLUlFwUlkyekpTcjYyVmVrZFc3bnoycERqTlNZdytKd3lDcGp1OW90?=
 =?utf-8?B?ZDJnN1orOXhoaWt6aFM0TkFjTFVSazNObVJ2VVhWTnZyVFBhVE04aGQ1alpj?=
 =?utf-8?B?S2JleDN5Vy9GTGgwM2Y4cnlnZC9VaWx4a3hzdVJDM3hJdHI3VjB3NW5tVndL?=
 =?utf-8?B?UUhac3puODJjZ2Nxc2NZekJoV1YxbGRVVlNYVGNaSDBtY0xNQXRDQzlQSXM4?=
 =?utf-8?B?WGxUOFlwcUVCWHV1d2N6K2djZHFTcllMSThydHppVmdGWUFSdnBTMC9ZdnBL?=
 =?utf-8?B?N2lCQkhkZG8zckVDNlIxQVZtWkdjUXJIUjBYSzFjRVVLOVN0TzhVNU9kOE1z?=
 =?utf-8?B?LzJVTENrSW1CQ080MDl0T0xmdVg2V1NvbzQ0UEtOOC9vZ1dHWFI3cEdYTnBJ?=
 =?utf-8?B?aVBPbTd6WU9STUZxV2V3dWVSaStMT2xrcWVwK01CQ3FUU2ZoeHlKeTNQZ2p6?=
 =?utf-8?B?cjJBT25vUnZGUHJOOTZLTEhjS3pTTnFuT01McjJSUVk1NmNmT1VXcnNyZnJL?=
 =?utf-8?B?UjBsZ0d4K3ZQL1RRWTdDT3EyeEgvenJHWWdyOWN3eXB2ZTVDMkIrc0pYak9G?=
 =?utf-8?B?T2pZOHdBN1Q4d0FET0hFM3duTGdxTHRwNkdnS1RPcG1DOU93R25JTWlMZnRQ?=
 =?utf-8?B?ZHR6VndDanZsd2dKOXQxU2JvYi9nNGlIUzZUOFI3VFM3UlM0aWtpQzcxaXV2?=
 =?utf-8?B?NkVmRy9oT1cvTjJBTHhxLytudUl2cEpJaWJhMk01SUJZbXZlMHU0QkpVS2Fm?=
 =?utf-8?B?SlhuVFBJRDJySVdNYUxGaUVwMEhXNzVoUGVxTzB5RDc4TWxXd3RFRUxnbGF2?=
 =?utf-8?B?TDBXaUhlb1BRRXhPUlRNNzdab2N2WnErbG1yL2NtaGZkSFRSK214QUpXTUNW?=
 =?utf-8?B?b1NFbzBWTlQyazJLQ2N5azJCUVI1RGJ1em9MRStucGdlVHRmdFhMNGtJVWkz?=
 =?utf-8?B?dnMvN0ZpUDk5WTF2MFFUM0ZvbFAvZ3V6NmxPZVlBZUx4dE8xcFBTRVlKZi9X?=
 =?utf-8?B?V2s4V3k3azZKL3l1eUo4YlMrMW1ZYWd2eHZqcFY2VlBGa0lQMW5RYjJ5MTR0?=
 =?utf-8?B?Z3NCMjVESkpaVE1jay9YeS91S1NjdlR2M0src243TEdFVlBvUUJ2eTY5SXhW?=
 =?utf-8?B?Y3RlTlpPNGI5aEt5YlY0R0xFUWhjTzB3S2RQR1p5ZWZMN0xiSFdUSnJtQnJz?=
 =?utf-8?B?WVNpeXZlWHNDUDlvSktkT2QxNlhQbFpvbjRVRjZhQ0xGU25KN2FxbFYzdmpU?=
 =?utf-8?B?ZXh3VHJCME5GL3h3SG0xWW41TUozYlVwM2hjSnMyOTM5bjZxQUJIQWlGOFRq?=
 =?utf-8?B?UTBZWXFTSzZMMG9DWko2UEVSYkxPQy9ZL3Q1Zm8rYVZjbnpEM3JaVW52aGYr?=
 =?utf-8?B?UXNYaTFSQnh6NWtNbWpoWkJxdnN4S2E5SjRwcEJUZmRFUDZPZ3dOUi9aVStM?=
 =?utf-8?B?TXV6ODhpVmxrS3BsbmxtRHBRSGlyTjRtLzN4WEdHc2lwMjA0SFZDSVg4ZEFV?=
 =?utf-8?B?TGM0OW13aFVWRTlzbFNOS09hdDd5c3FyY05mRGRYM0g1cFJ2NHF6N2YvZVBs?=
 =?utf-8?B?WEZpVzlYZmFxZGJZeCtYNDdEUklrMU0zS1pFU0czN2JzdExSUS9WbW8yaVYy?=
 =?utf-8?Q?3mVIb0G48q+z7vbRs85JeBReOFtC7SieSlmkHMX9Ylp9K?=
x-ms-exchange-antispam-messagedata-1: PqbioVWv3hJNVA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JdimgqpWq5ETudRIqedKTx0zlDzC7aa10q/wzANIFUxLZYzoQCdKCT5/f3CKecMvyEjZcN4gSvZTYX6UINp3jr+4Zy6Bvm04QMy9ppLPSYOaQqfrKozzZb5Ut3NgcKK0nqRAd3v8xahL6DbvQwPMFH87S5Ww3HC+9Yb1Nh0j8//M5fZ50u4ABWK8JuNUUENHJdZF2nHaHDMjCgbF96XsXkfV5N/Nl1TyU5rJJZLUgweswG7xFwVLO4Wr5hxCV5iLUMD+L7SF4jwPohapLW2XobBLuXYRireSiyTuOkqtrYxBFoLT9OO7B/qWr9T4UeDYL0LfZwOHNEA1i7hH4t+9aQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843bbc39-190c-437f-9776-08df06c740b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2026 18:48:16.3206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7FP++LZ/OI2nkBNtmdqJ68n6zQt9ef4JeNarFhklEuxgGHitqr1V0dRUJWYDIVmmT1RvKsxHqxvetvBF+efM7kxTin1ZquqUQUsH1IRQefI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBHcnplbGFrLCBNaWNoYWwgPG1p
Y2hhbC5ncnplbGFrQGludGVsLmNvbT4gDQpTZW50OiAyMSBBdWd1c3QgMjAyNiAwNjoxOCBQTQ0K
VG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR2FyZywgTmVtZXNhIDxuZW1l
c2EuZ2FyZ0BpbnRlbC5jb20+OyBUaGFzbGVlbSwgTW9oYW1tZWQgPG1vaGFtbWVkLnRoYXNsZWVt
QGludGVsLmNvbT47IEIgUywgS2FydGhpayA8a2FydGhpay5iLnNAaW50ZWwuY29tPjsgR3J6ZWxh
aywgTWljaGFsIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggaS1n
LXQgdjMgMDMvMTddIHRlc3RzL2ttc19hc3luY19mbGlwczogc3BsaXQgb3V0ZXIgdGVzdCBsb29w
IGludG8gdHdvDQoNCmZvcl9lYWNoX2NydGNfd2l0aF92YWxpZF9vdXRwdXQoKSBpdGVyYXRlcyBv
dmVyIGV2ZXJ5IGNydGMgd2l0aCBjb25uZWN0ZWQgb3V0cHV0LiBTcGxpdCBpdCBpbnRvIHR3byBs
b29wcy4gVGhpcyBpcyBuZWVkZWQgdG8gaGFuZGxlIGNhc2VzIHBlciBvdXRwdXQuDQoNClNpZ25l
ZC1vZmYtYnk6IE1pY2hhxYIgR3J6ZWxhayA8bWljaGFsLmdyemVsYWtAaW50ZWwuY29tPg0KLS0t
DQogdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMgfCA2MyArKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyOSBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jIGIvdGVz
dHMva21zX2FzeW5jX2ZsaXBzLmMgaW5kZXggZWY0YjI4ZWI1Mi4uMDMzNDhkOTU4ZCAxMDA2NDQN
Ci0tLSBhL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jDQorKysgYi90ZXN0cy9rbXNfYXN5bmNfZmxp
cHMuYw0KQEAgLTg3NywzOSArODc3LDQ0IEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0KGRhdGFfdCAq
ZGF0YSwgdm9pZCAoKnRlc3QpKGRhdGFfdCAqKSkNCiAJaWYgKGRhdGEtPmF0b21pY19wYXRoKQ0K
IAkJcmVxdWlyZV9hdG9taWNfYXN5bmNfY2FwKGRhdGEpOw0KIA0KLQlmb3JfZWFjaF9jcnRjX3dp
dGhfdmFsaWRfb3V0cHV0KGRpc3BsYXksIGNydGMsIGRhdGEtPm91dHB1dCkgew0KLQkJZGF0YS0+
Y3J0YyA9IGNydGM7DQotCQlpZ3RfZGlzcGxheV9yZXNldChkaXNwbGF5KTsNCisJZm9yX2VhY2hf
Y29ubmVjdGVkX291dHB1dChkaXNwbGF5LCBkYXRhLT5vdXRwdXQpIHsNCisJCWZvcl9lYWNoX2Ny
dGMoJmRhdGEtPmRpc3BsYXksIGNydGMpIHsNCisJCQlpZighaWd0X2NydGNfY29ubmVjdG9yX3Zh
bGlkKGNydGMsIGRhdGEtPm91dHB1dCkpDQotLT5OSVQ6IHNwYWNlIGFmdGVyIGlmDQorCQkJCWNv
bnRpbnVlOw0KIA0KLQkJaWd0X291dHB1dF9zZXRfY3J0YyhkYXRhLT5vdXRwdXQsDQotCQkJCSAg
ICBjcnRjKTsNCi0JCWlmICghaW50ZWxfcGlwZV9vdXRwdXRfY29tYm9fdmFsaWQoZGlzcGxheSkp
DQotCQkJY29udGludWU7DQorCQkJZGF0YS0+Y3J0YyA9IGNydGM7DQorCQkJaWd0X2Rpc3BsYXlf
cmVzZXQoZGlzcGxheSk7DQogDQotCQl0ZXN0X2luaXQoZGF0YSk7DQorCQkJaWd0X291dHB1dF9z
ZXRfY3J0YyhkYXRhLT5vdXRwdXQsDQorCQkJCQkgICAgY3J0Yyk7DQorCQkJaWYgKCFpbnRlbF9w
aXBlX291dHB1dF9jb21ib192YWxpZChkaXNwbGF5KSkNCisJCQkJY29udGludWU7DQogDQotCQlp
ZiAoZGF0YS0+bGluZWFyX21vZGlmaWVyKQ0KLQkJCWRhdGEtPm1vZGlmaWVyID0gRFJNX0ZPUk1B
VF9NT0RfTElORUFSOw0KLQkJZWxzZQ0KLQkJCWRhdGEtPm1vZGlmaWVyID0gZGVmYXVsdF9tb2Rp
ZmllcihkYXRhKTsNCi0NCi0JCWlndF9yZXF1aXJlKGlndF9mb3JtYXRfbW9kc19oYXNfbW9kaWZp
ZXIoJmRhdGEtPnBsYW5lLT5mb3JtYXRfbW9kc19hc3luYywNCi0JCQkJCQkJIGRhdGEtPm1vZGlm
aWVyKSk7DQotDQotCQlpZ3RfZHluYW1pY19mKCJwaXBlLSVzLSVzIiwgaWd0X2NydGNfbmFtZShj
cnRjKSwNCi0JCQkgICAgICBkYXRhLT5vdXRwdXQtPm5hbWUpIHsNCi0JCQkvKg0KLQkJCSAqIEZJ
WE1FOiBqb2luZXIrYXN5bmMgZmxpcCBpcyBidXN0ZWQgY3VycmVudGx5IGluIEtNRC4NCi0JCQkg
KiBSZW1vdmUgdGhpcyBjaGVjayBvbmNlIHRoZSBpc3N1ZXMgYXJlIGZpeGVkIGluIEtNRC4NCi0J
CQkgKi8NCi0JCQlpZ3Rfc2tpcF9vbl9mKGlzX2pvaW5lcl9tb2RlKGRhdGEtPmRybV9mZCwgZGF0
YS0+b3V0cHV0KSwNCi0JCQkJICAgICAgIlNraXBwaW5nLCBhc3luYyBmbGlwIG5vdCBzdXBwb3J0
ZWQgb24gam9pbmVyIG1vZGVcbiIpOw0KLQkJCXRlc3RfaW5pdF9mYnMoZGF0YSk7DQotCQkJdGVz
dChkYXRhKTsNCisJCQl0ZXN0X2luaXQoZGF0YSk7DQorDQorCQkJaWYgKGRhdGEtPmxpbmVhcl9t
b2RpZmllcikNCisJCQkJZGF0YS0+bW9kaWZpZXIgPSBEUk1fRk9STUFUX01PRF9MSU5FQVI7DQor
CQkJZWxzZQ0KKwkJCQlkYXRhLT5tb2RpZmllciA9IGRlZmF1bHRfbW9kaWZpZXIoZGF0YSk7DQor
DQorCQkJaWd0X3JlcXVpcmUoaWd0X2Zvcm1hdF9tb2RzX2hhc19tb2RpZmllcigmZGF0YS0+cGxh
bmUtPmZvcm1hdF9tb2RzX2FzeW5jLA0KKwkJCQkJCQkJIGRhdGEtPm1vZGlmaWVyKSk7DQorDQor
CQkJaWd0X2R5bmFtaWNfZigicGlwZS0lcy0lcyIsIGlndF9jcnRjX25hbWUoY3J0YyksDQorCQkJ
CSAgICAgIGRhdGEtPm91dHB1dC0+bmFtZSkgew0KKwkJCQkvKg0KKwkJCQkgKiBGSVhNRTogam9p
bmVyK2FzeW5jIGZsaXAgaXMgYnVzdGVkIGN1cnJlbnRseSBpbiBLTUQuDQorCQkJCSAqIFJlbW92
ZSB0aGlzIGNoZWNrIG9uY2UgdGhlIGlzc3VlcyBhcmUgZml4ZWQgaW4gS01ELg0KKwkJCQkgKi8N
CisJCQkJaWd0X3NraXBfb25fZihpc19qb2luZXJfbW9kZShkYXRhLT5kcm1fZmQsIGRhdGEtPm91
dHB1dCksDQorCQkJCQkgICAgICAiU2tpcHBpbmcsIGFzeW5jIGZsaXAgbm90IHN1cHBvcnRlZCBv
biBqb2luZXIgbW9kZVxuIik7DQorCQkJCXRlc3RfaW5pdF9mYnMoZGF0YSk7DQorCQkJCXRlc3Qo
ZGF0YSk7DQorCQkJfQ0KKwkJCS8qIFJlc3RyaWN0IHRvIHNpbmdsZSBwaXBlIGluIHNpbXVsYXRp
b24gKi8NCi0tPklNTzogSXQgYnJlYWtzIGlubmVyIGNydGMgbG9vcCwgYnV0IG91dGVyIGxvb3Ag
c3RpbGwgY29udGludWVzIHRvIG5leHQgb3V0cHV0LCBjaGVjayB0aGlzLi4NCisJCQlpZiAoZGF0
YS0+c2luZ2xlX3BpcGUpDQorCQkJCWJyZWFrOw0KIAkJfQ0KLQkJLyogUmVzdHJpY3QgdG8gc2lu
Z2xlIHBpcGUgaW4gc2ltdWxhdGlvbiAqLw0KLQkJaWYgKGRhdGEtPnNpbmdsZV9waXBlKQ0KLQkJ
CWJyZWFrOw0KIAl9DQogfQ0KIA0KLS0NCjIuNDUuMg0KDQo=
