Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB12C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 10:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DE510F503;
	Fri, 19 Apr 2024 10:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="laFI/VMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC2F10F0F4;
 Fri, 19 Apr 2024 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713522217; x=1745058217;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n/PeO3jWVjWY/aQGkp0jEbkhbioLkwvDqPiF4RRGmyo=;
 b=laFI/VMg92B6/lahva/bMYcXeTnx1DHcKjLqLGESoq7cllmK5OoiSofb
 Mco0qRNweZ3r7x3twOXS4KTtM5sS+ug57tQZT5nYMK7pdACDQHKo5x+Pe
 h/LpP99dwl/VfMcclBxGHZeY1bfzYXcHa+YG75U0cHzr1eVWXvQj+uQxs
 iR0vUSwO5vuFU4FeS1wPNdamyzXHCifd2C/AMrvdTK2TO9dJ6VwmBtBed
 IHrnRkCYcPLHhLA/PNsESorZvj2LRRNT8FYi2RESTkjpFBSoGcFi/yg/3
 Dyia3jmnqPG6zgjs0TjF8WLFh0+WbaxgLgDY2WD4QcYgKTkBargBenBWW Q==;
X-CSE-ConnectionGUID: AdCmvd0UR0y+leYWPmhjQQ==
X-CSE-MsgGUID: MX4YS+G1QnSSifUgLNfYJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12898473"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12898473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 03:23:36 -0700
X-CSE-ConnectionGUID: 4aUyQ5erSvOCN8ufnul1nw==
X-CSE-MsgGUID: mgC4WdiITq6XQ6J3gTTYSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23790728"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 03:23:36 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 03:23:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 03:23:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 03:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehq5CcUb6aPYRc8QLRwzhy6+1kztse9LuMWBMt0S5MoiiA0F6sTPVnLOD8T5wH+cVYghAHpDrmTFxwSZYOoXi2sdwggKksiYpqNI/ubx3MJxNPOuC86iXzRkmA3ULsOyTD+IzCD1wXfUOnYrHYQg/io+ZdN6CcsvJ8NOnEVbHVdMy0Bp7U62FZcw6yvxSP5xvB0QWjA1yx4Ukbhl9fQvhrgDy4hdCl6k9UyCqfXF81GhjfcW8EcEVVh4cU3O6Eaw6czQKuzQPRlcTlPF8evxGHEYbljHvXgjZX5swnFHJL84fjqSrYSRFDvOsf7GjlyDDcv1n0sgZVw71QN8+ZPqrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/PeO3jWVjWY/aQGkp0jEbkhbioLkwvDqPiF4RRGmyo=;
 b=TKGgI8pL0HB5FmKh6WbnIFcrrmiifjbRYdzPobtnj5aLx4VOoYe6VsMVbzHDWeZYbU+S1WMMOMgJWgrIii3QP9w6mtd4HnoPE/IZTaofcjz+y/avQ+/3C2qzNE2Vblp9GkeSPWsSKDo8ZI4KNc0R1e5o0u1Lz/J1oxc1Nps3I8exIuZ9XKGSRej0YBIIjOgbjdcmh0YSsQoaTWPi4PzUPpq90lKzp5qZndR9e+8sOGiYg3iSuRtoi98CEi8KNpO0e2ZbkvB+Ho2g+YQ88MeDZshOrrU8agqlDWckkkQk1g+1ynoz+keGx4MPftzNv+UbtRutEJbfgseHM5oqkSV/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.14; Fri, 19 Apr
 2024 10:23:23 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5%6]) with mapi id 15.20.7409.028; Fri, 19 Apr 2024
 10:23:23 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL3hlX2V2aWN0?=
 =?utf-8?B?fGV4ZWNfdGhyZWFkczogVXNlIGZkIHJlb3BlbiB0byBhdm9pZCBjb3JydXB0?=
 =?utf-8?Q?ing_global_data_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMveGVfZXZpY3R8ZXhl?=
 =?utf-8?B?Y190aHJlYWRzOiBVc2UgZmQgcmVvcGVuIHRvIGF2b2lkIGNvcnJ1cHRpbmcg?=
 =?utf-8?Q?global_data_(rev2)?=
Thread-Index: AQHakVZ1+Gm5ePJs5EqQlJWV/H1mFrFtmhOAgAHKVmA=
Date: Fri, 19 Apr 2024 10:23:23 +0000
Message-ID: <PH8PR11MB675368F98050FB35C7717D65F20D2@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240417142607.193339-1-zbigniew.kempczynski@intel.com>
 <171342033048.1484551.4427391781925272219@8e613ede5ea5>
 <20240418070229.b27ijfjlnzsik7eg@zkempczy-mobl2>
In-Reply-To: <20240418070229.b27ijfjlnzsik7eg@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|MW4PR11MB7102:EE_
x-ms-office365-filtering-correlation-id: a4882abb-78f1-4ecc-6f38-08dc605abe6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 67qi3sb6qfD8c+cfsiO99w/h6DamNoz1eb15ad4qGzcRC9rcDsXjZQuJvbFXxd/I0HuyLz0sCR55KVObtmyclNBTYB2sxwXLekps9YSP2oPgAvD39kvt+eHJHo9JLvqBPznih8fdWPUPutbXOkjc1d0AfTKwFqXwgVLMeggXtHGWK1eX6jeaFy+ns4Mv0SxtbFYXb2mMKh1dFeQ++HNxMC9aAS1+UtVKNQQFJf+1Wr1qajRaNtl21VBWAvM7zkJv44Qa+nhaQtaJakww1OWFLrX1o9kqlVWAcD0mH1YQ0eU5B6fylujCUThp8vdk4MdrySnjLvmYDUjBiKGqpq9vmDvegvS9KbslVOHUsvM3+KsDifay2l4dAepAAA8P6sdfbxvkeMsTB/Eid8927PehE62q2YB9c5dyK4A7d2UueLyu1Ctnea13m1DyyHK6gghZh03m1e9+yYpTpXU0jbLb5VH9qBkOIfYpyVP9c9r660k81JLVBOExBggJ57tjkTWM/1+HxfYWWdlkYtZECuxImNqzPHm2ckAVbc2E+/RlwMx/6ndTNpE5R44GhNj1PWtMIMM+VjrOgs4R2lhW5pKjR/gAX0Z1NFor4tcrl5YQ3gNi9CW7cCubYHdCjJstIjaWtFNKfxmPh2lWq2goXQpJq1jpAgeSyZOz5Z5hXcvBZkI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2Z1dm91MFdpblg0TmJqbTh0NXNnMXlBai9FNmNkb2tIcnFETWJtMzUyMFpI?=
 =?utf-8?B?OWVVbzk1cG5nbTdtRWZPa2tqNU0xUFBEbXZvdnltS2Q2cXV0L2pIbm5CTUVw?=
 =?utf-8?B?TjZRUDVlaE1nRU0zNS9jZkVUajdzdStzNWwyUmNGL1psRnZCaGYvcHZ2eGlv?=
 =?utf-8?B?dzhmWDl5cXBSNC82TWVhR2pMMlJsMEJ5MzkwYjlMdVRUQkU0bU5MU09LblZa?=
 =?utf-8?B?UVpKbEJZTVEwNHpuWXM1Rk52cGhYRm1WQ090Q2dTNEFCdGxLcnh0c1p4Qi9G?=
 =?utf-8?B?T0NJV2tDSmFVdFE1U2ZiTWhIM0ZzTzZkMlgvZW50TFF5VjdnbzVOUnN4Wlhp?=
 =?utf-8?B?NnVjc3J2MlVoQlJ6MDBiRnA1KzJHSGJIVWkxM1lDSFJOaHM5bDltcldwNU5Z?=
 =?utf-8?B?TmtReE9IQi9vZ1paL2wxVzZpSG94MlJsNHFXZ3VNcmVJYzJEaXFyYzlHWSto?=
 =?utf-8?B?MEVPVVg1R0NuVXhublVEdHdsZEhNRkFkMkluMXowa1p3M2FOaVJlMHcyc3pa?=
 =?utf-8?B?QzhsNEJ5WjFyaGtYTGNWelpLYnFROWRRNjJzUDJ0Ymc5UGtkcjR2Z3dQRU1V?=
 =?utf-8?B?ZjdRVlpIUzhpcjBSdDZlYk5PZm9SMWxPY2kzYjZaNnNwWjdvRFRjNTMraEU5?=
 =?utf-8?B?eEZMMkxyMXo4RnR2MFZiTmFqb1R1ZE1vNjE4VTFURXVsN1EvS2FXWXd4cnlj?=
 =?utf-8?B?RXJjTUdUUk1HQ1VZTW84MjhSSUNHcWdUYzhXTDc4OExEYVRtZ3UxdHlLTHlW?=
 =?utf-8?B?M2pZMTd2dmcwYzJIQjNnM21aS0RvZUh1Q1QwZ0hqTVNVWEF3d2FiMXA1em1W?=
 =?utf-8?B?K2NBTWVtWUdvSEtERU9qMS9na3JGalRyeC9abnBSbEVGZW9RQlh4SmkwZUdp?=
 =?utf-8?B?cWp4ZWkxNHl3MUM4bzhBUkJRQmZYNGxpL0FqcHkrL3dCMGM2VktqNWdsWjRL?=
 =?utf-8?B?RmJabmxLL1FIQk4vc3JSSlkrVmFlSi9TdDdiWko2WFJSaTdHOGF6N1BVK1Yx?=
 =?utf-8?B?TzRadTZDaXZPWEZnb1hvRlAzeWlnOFdUT0hlQ21OZkYzNEtPaWc3ZmRiRUtT?=
 =?utf-8?B?UGs1MFRVWXVpNEZwaERwS2JFRFI5OVRVeW1uSkZ4ZGNFWmtyRnNZWHk4aVdl?=
 =?utf-8?B?MHhhRnhOMlVXanoxV3NIblBTV2R5TVpJNnV1SkVDRGdHd2RnTi94VGlrd3dH?=
 =?utf-8?B?dDN1d2p1UTBPVlVKRXJtVTNadTI3Tjd5Yk1XQ2lGdUhoZGR6RzRjTkpXQy9u?=
 =?utf-8?B?WVpuMHRGTzBreE8yZklld0JHdHI5UnJBYjI4TVM1aUN4VHhZYW1UQVZEN093?=
 =?utf-8?B?bWRsWFR4VnVBOE9xZGc2WlpiUmFxdndkQnNIbWl5aEQ5K1cyMkxKSFhvMjdy?=
 =?utf-8?B?UUIxYW03NmlDV3h4eHhHdUZiWmxJVllCa2ZaYldKc1Q1MExwU1VGbkNPVnpi?=
 =?utf-8?B?MVF5YnVXMVpNc1JKKzBWL0hiYWxtUWl6V2w1WVVIR1NSa2wxRGtzRVFOeFJh?=
 =?utf-8?B?clZsL2lqNFFSaHpLTnpmYUV3VG00dlJtZ2xUS1ErUXJqKytMWCtLNkdBSENi?=
 =?utf-8?B?UGpGa0ZXLy9KU3hPZkNIak9BWFk5WlNLcWZsVlEzZEVSUmt5WkRjK3kzUmxw?=
 =?utf-8?B?NDJ5V2dwZUd0TW1pOXkwVVFjMjlZQ3NJQkRaZGsyQkNRRktOTHVCbzFIK3Ju?=
 =?utf-8?B?eEJuc0hJeUZ0ems0SXcvbVFJZWJwY3BFeEl1R1ZLektHSnFzN1Qwd0F2NUVm?=
 =?utf-8?B?M0Jrd0luaExuTmF3MHUzUkpYbTV1VzVadkRVOUx5UzVtMkpSWGV0RXhpQ0hS?=
 =?utf-8?B?anhFdjlkVnlEdTFHK0pNMHFsK2pNQ2wyaGFjWWVBdGpNQlF6dUNuZ3BNM3Q0?=
 =?utf-8?B?aDB1UkxkZ3ZqaFNVcll6bmxsNCtOajE2OHNWMGJNY1dJZWtGZXkrNlBOVmFU?=
 =?utf-8?B?R3BnZ0VOTklYNnFXNFNKZjByMXVjWDBmZ1FPOHFBTU5wTVFMdzkySnlpUGJv?=
 =?utf-8?B?V0pwb1lEVjZReFNFemNBbE8yVXNlU2tlQ3ZGVEFtRy9KSHNGblV2Mm5uTVVk?=
 =?utf-8?B?YzNLRXdjRkRLVXlQZHBxL1hiL3RlUEhvaVFKaUUyamdOTjBUZmEwQ0Z6KzVI?=
 =?utf-8?B?b2F0UVZaTE9zWW52TXpFUktYa3Y5bWVjc0V0dWFFbFhPWVV1MkNIaFhkaXgr?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4882abb-78f1-4ecc-6f38-08dc605abe6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 10:23:23.7186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bTjV8eN2povw5m5P1mUli+qiMw6gvkcZSDLoQez1s+Qg5c8Ua5DzP7cgnPaDGD3hgtq+ZZPhJjt9caB9GN/lGicmj/sz05hYKTJ/D2EK6CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMyNTYyLyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz4gT24gQmVoYWxmIE9mIFpiaWduaWV3IEtlbXBjenluc2tpDQpTZW50OiBUaHVyc2RheSwg
QXByaWwgMTgsIDIwMjQgMTI6MzIgUE0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KQ2M6IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTog
4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMveGVfZXZpY3R8ZXhlY190aHJlYWRzOiBV
c2UgZmQgcmVvcGVuIHRvIGF2b2lkIGNvcnJ1cHRpbmcgZ2xvYmFsIGRhdGEgKHJldjIpDQoNCk9u
IFRodSwgQXByIDE4LCAyMDI0IGF0IDA2OjA1OjMwQU0gKzAwMDAsIFBhdGNod29yayB3cm90ZToN
Cj4gICAgUGF0Y2ggRGV0YWlscw0KPiANCj4gICAgU2VyaWVzOiAgdGVzdHMveGVfZXZpY3R8ZXhl
Y190aHJlYWRzOiBVc2UgZmQgcmVvcGVuIHRvIGF2b2lkIGNvcnJ1cHRpbmcgICAgDQo+ICAgICAg
ICAgICAgIGdsb2JhbCBkYXRhIChyZXYyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIA0KPiAgICBVUkw6ICAgICBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvc2VyaWVzLzEzMjU2Mi8gICAgICAgICAgICAgICAgICANCj4gICAgU3RhdGU6ICAg
ZmFpbHVyZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgDQo+ICAgIERldGFpbHM6IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTEwMzcvaW5kZXguaHRtbCAgIA0KPiANCj4gICAgICAgICAgICAgIENJ
IEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gQ0lfRFJNXzE0NTk4IC0+IElHVFBXXzExMDM3DQo+IA0K
PiBTdW1tYXJ5DQo+IA0KPiAgICBGQUlMVVJFDQo+IA0KPiAgICBTZXJpb3VzIHVua25vd24gY2hh
bmdlcyBjb21pbmcgd2l0aCBJR1RQV18xMTAzNyBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICAg
dmVyaWZpZWQgbWFudWFsbHkuDQo+IA0KPiAgICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNo
YW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICAgaW50cm9kdWNl
ZCBpbiBJR1RQV18xMTAzNywgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtDQo+ICAgICgiSTkx
NS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmciKSB0byBhbGxvdyB0aGVtDQo+ICAgIHRv
IGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2Ug
cG9zaXRpdmVzIGluDQo+ICAgIENJLg0KPiANCj4gICAgRXh0ZXJuYWwgVVJMOg0KPiAgICBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzExMDM3L2luZGV4Lmh0
bWwNCj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDM4IC0+IDM0KQ0KPiANCj4gICAgQWRkaXRp
b25hbCAoMik6IGJhdC1kZzItMTEgZmktYnN3LW4zMDUwDQo+ICAgIE1pc3NpbmcgKDYpOiBiYXQt
bXRscC05IGZpLWFwbC1ndWMgZmktc25iLTI1MjBtIGJhdC1qc2wtMSBiYXQtYXJscy0yDQo+ICAg
IGJhdC1hcmxzLTMNCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gDQo+ICAgIEhlcmUgYXJl
IHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdU
UFdfMTEwMzc6DQo+IA0KPiAgIElHVCBjaGFuZ2VzDQo+IA0KPiAgICAgUG9zc2libGUgcmVncmVz
c2lvbnMNCj4gDQo+ICAgICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQGd0X2xyYzoNCj4gICAg
ICAgICAgICogYmF0LWFkbHAtNjogUEFTUyAtPiBJTkNPTVBMRVRFDQoNCkNoYW5nZSBpcyB1bnJl
bGF0ZWQsIG1heSBJIGFzayBmb3IgY29udGludWUgcnVubmluZyB0aGUgdGVzdD8NCg0KLS0NClpi
aWduaWV3DQoNCj4gDQo+IEtub3duIGlzc3Vlcw0KPiANCj4gICAgSGVyZSBhcmUgdGhlIGNoYW5n
ZXMgZm91bmQgaW4gSUdUUFdfMTEwMzcgdGhhdCBjb21lIGZyb20ga25vd24gaXNzdWVzOg0KPiAN
Cj4gICBJR1QgY2hhbmdlcw0KPiANCj4gICAgIElzc3VlcyBoaXQNCj4gDQo+ICAgICAgKiBpZ3RA
Z2VtX2xtZW1fc3dhcHBpbmdAcmFuZG9tLWVuZ2luZXM6DQo+IA0KPiAgICAgICAgICAgKiBmaS1i
c3ctbjMwNTA6IE5PVFJVTiAtPiBTS0lQICsxOSBvdGhlciB0ZXN0cyBza2lwDQo+ICAgICAgKiBp
Z3RAZ2VtX21tYXBAYmFzaWM6DQo+IA0KPiAgICAgICAgICAgKiBiYXQtZGcyLTExOiBOT1RSVU4g
LT4gU0tJUCAoaTkxNSM0MDgzKQ0KPiAgICAgICogaWd0QGdlbV90aWxlZF9mZW5jZV9ibGl0c0Bi
YXNpYzoNCj4gDQo+ICAgICAgICAgICAqIGJhdC1kZzItMTE6IE5PVFJVTiAtPiBTS0lQIChpOTE1
IzQwNzcpICsyIG90aGVyIHRlc3RzIHNraXANCj4gICAgICAqIGlndEBnZW1fdGlsZWRfcHJlYWRf
YmFzaWM6DQo+IA0KPiAgICAgICAgICAgKiBiYXQtZGcyLTExOiBOT1RSVU4gLT4gU0tJUCAoaTkx
NSM0MDc5KSArMSBvdGhlciB0ZXN0IHNraXANCj4gICAgICAqIGlndEBpOTE1X3BtX3Jwc0BiYXNp
Yy1hcGk6DQo+IA0KPiAgICAgICAgICAgKiBiYXQtZGcyLTExOiBOT1RSVU4gLT4gU0tJUCAoaTkx
NSM2NjIxKQ0KPiAgICAgICogaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBleGVjbGlzdHM6DQo+IA0K
PiAgICAgICAgICAgKiBmaS1ic3ctbjMwNTA6IE5PVFJVTiAtPiBBQk9SVCAoaTkxNSMxMDU5NCkN
Cj4gICAgICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAcmVxdWVzdHM6DQo+IA0KPiAgICAgICAg
ICAgKiBiYXQtZGcyLTk6IFBBU1MgLT4gQUJPUlQgKGk5MTUjMTAzNjYpDQo+ICAgICAgKiBpZ3RA
a21zX2FkZGZiX2Jhc2ljQGFkZGZiMjUteC10aWxlZC1taXNtYXRjaC1sZWdhY3k6DQo+IA0KPiAg
ICAgICAgICAgKiBiYXQtZGcyLTExOiBOT1RSVU4gLT4gU0tJUCAoaTkxNSM0MjEyKSArNyBvdGhl
ciB0ZXN0cyBza2lwDQo+ICAgICAgKiBpZ3RAa21zX2FkZGZiX2Jhc2ljQGFkZGZiMjUteS10aWxl
ZC1zbWFsbC1sZWdhY3k6DQo+IA0KPiAgICAgICAgICAgKiBiYXQtZGcyLTExOiBOT1RSVU4gLT4g
U0tJUCAoaTkxNSM1MTkwKQ0KPiAgICAgICogaWd0QGttc19hZGRmYl9iYXNpY0BiYXNpYy15LXRp
bGVkLWxlZ2FjeToNCj4gDQo+ICAgICAgICAgICAqIGJhdC1kZzItMTE6IE5PVFJVTiAtPiBTS0lQ
IChpOTE1IzQyMTUgLyBpOTE1IzUxOTApDQo+ICAgICAgKiBpZ3RAa21zX2N1cnNvcl9sZWdhY3lA
YmFzaWMtYnVzeS1mbGlwLWJlZm9yZS1jdXJzb3ItYXRvbWljOg0KPiANCj4gICAgICAgICAgICog
YmF0LWRnMi0xMTogTk9UUlVOIC0+IFNLSVAgKGk5MTUjNDEwMyAvIGk5MTUjNDIxMykgKzEgb3Ro
ZXIgdGVzdA0KPiAgICAgICAgICAgICBza2lwDQo+ICAgICAgKiBpZ3RAa21zX2RzY0Bkc2MtYmFz
aWM6DQo+IA0KPiAgICAgICAgICAgKiBiYXQtZGcyLTExOiBOT1RSVU4gLT4gU0tJUCAoaTkxNSMz
NTU1IC8gaTkxNSMzODQwKQ0KPiAgICAgICogaWd0QGttc19mb3JjZV9jb25uZWN0b3JfYmFzaWNA
Zm9yY2UtbG9hZC1kZXRlY3Q6DQo+IA0KPiAgICAgICAgICAgKiBiYXQtZGcyLTExOiBOT1RSVU4g
LT4gU0tJUA0KPiAgICAgICogaWd0QGttc19mb3JjZV9jb25uZWN0b3JfYmFzaWNAcHJ1bmUtc3Rh
bGUtbW9kZXM6DQo+IA0KPiAgICAgICAgICAgKiBiYXQtZGcyLTExOiBOT1RSVU4gLT4gU0tJUCAo
aTkxNSM1Mjc0KQ0KPiAgICAgICogaWd0QGttc19wbV9iYWNrbGlnaHRAYmFzaWMtYnJpZ2h0bmVz
czoNCj4gDQo+ICAgICAgICAgICAqIGJhdC1kZzItMTE6IE5PVFJVTiAtPiBTS0lQIChpOTE1IzUz
NTQpDQo+ICAgICAgKiBpZ3RAa21zX3BzckBwc3Itc3ByaXRlLXBsYW5lLW9ub2ZmOg0KPiANCj4g
ICAgICAgICAgICogYmF0LWRnMi0xMTogTk9UUlVOIC0+IFNLSVAgKGk5MTUjMTA3MiAvIGk5MTUj
OTczMikgKzMgb3RoZXIgdGVzdHMNCj4gICAgICAgICAgICAgc2tpcA0KPiAgICAgICogaWd0QGtt
c19zZXRtb2RlQGJhc2ljLWNsb25lLXNpbmdsZS1jcnRjOg0KPiANCj4gICAgICAgICAgICogYmF0
LWRnMi0xMTogTk9UUlVOIC0+IFNLSVAgKGk5MTUjMzU1NSkNCj4gICAgICAqIGlndEBwcmltZV92
Z2VtQGJhc2ljLWZlbmNlLWZsaXA6DQo+IA0KPiAgICAgICAgICAgKiBiYXQtZGcyLTExOiBOT1RS
VU4gLT4gU0tJUCAoaTkxNSMzNzA4KQ0KPiAgICAgICogaWd0QHByaW1lX3ZnZW1AYmFzaWMtZmVu
Y2UtbW1hcDoNCj4gDQo+ICAgICAgICAgICAqIGJhdC1kZzItMTE6IE5PVFJVTiAtPiBTS0lQIChp
OTE1IzM3MDggLyBpOTE1IzQwNzcpICsxIG90aGVyIHRlc3QNCj4gICAgICAgICAgICAgc2tpcA0K
PiAgICAgICogaWd0QHByaW1lX3ZnZW1AYmFzaWMtcmVhZDoNCj4gDQo+ICAgICAgICAgICAqIGJh
dC1kZzItMTE6IE5PVFJVTiAtPiBTS0lQIChpOTE1IzMyOTEgLyBpOTE1IzM3MDgpICsyIG90aGVy
IHRlc3RzDQo+ICAgICAgICAgICAgIHNraXANCj4gDQo+ICAgICBQb3NzaWJsZSBmaXhlcw0KPiAN
Cj4gICAgICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAb2JqZWN0czoNCj4gDQo+ICAgICAgICAg
ICAqIGJhdC1hcmxzLTE6IERNRVNHLUZBSUwgKGk5MTUjMTAyNjIpIC0+IFBBU1MgKzM1IG90aGVy
IHRlc3RzIHBhc3MNCj4gICAgICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAc2FuaXR5Y2hlY2s6
DQo+IA0KPiAgICAgICAgICAgKiBiYXQtYXJscy0xOiBETUVTRy1XQVJOIChpOTE1IzEwMzQxKSAt
PiBQQVNTDQo+IA0KPiBCdWlsZCBjaGFuZ2VzDQo+IA0KPiAgICAgICogQ0k6IENJLTIwMTkwNTI5
IC0+IE5vbmUNCj4gICAgICAqIElHVDogSUdUXzc4MTEgLT4gSUdUUFdfMTEwMzcNCj4gDQo+ICAg
IENJLTIwMTkwNTI5OiAyMDE5MDUyOQ0KPiAgICBDSV9EUk1fMTQ1OTg6IGE0ZjU2NjQ0NGE2NDVi
MWFkZTFiOGQ5NDhmNmUwMjg2MTM2YjJjYjMgQA0KPiAgICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNr
dG9wLm9yZy9nZngtY2kvbGludXgNCj4gICAgSUdUUFdfMTEwMzc6IGE2ODUxYWMwOWNkZjczODkx
YzZmZmFiYWM0YWM2YzFhMDQzMjQxODEgQA0KPiAgICBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvZHJtL2lndC1ncHUtdG9vbHMuZ2l0DQo+ICAgIElHVF83ODExOiAyZDk1ZGY1NzU3ZWI5
OWE0MmVhOWFjMzBmZDc0MDAxZGVlODA0ZDAzIEANCj4gICAgaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLmdpdA0K
