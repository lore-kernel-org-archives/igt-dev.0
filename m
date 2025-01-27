Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8DAC02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 15:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2252F10E321;
	Mon, 27 Jan 2025 15:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBVTcYK2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB02110E30B
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 15:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737993005; x=1769529005;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fGcHIkl/iL8PfKz2b4kDCE+FW+XmCVSvQ/Yhe9QiDXE=;
 b=HBVTcYK2AUff/eDvez1MYMU+cganG848Fzvonh2B1qy+IEArEzvljpEX
 crjXlBDL/5D2lOXZaLUL9glaWKu0urwKVPlGhgHqIAX6+P8Qvlue1o7Cx
 ozSll4xYDd4WnQ0T19cezSYbY3Y6jK1Ljit+6p9JFhJR+8H/eRyqeewkD
 aZXSkaYf78YapXNBe/uAebTUd8KwmW3rbVexb/DACwRf+tscWBMeS9uEv
 ukFHqz/LVU9d2oqpCgpVVXAQwPFEbEm90lLnC2vWa1IuNu6m2VvviyG59
 Xk1ZyML9KPsyl3INHIPU8/ayr1eSALmqKaQOiixKKDVddNoBY4yCeYSTX w==;
X-CSE-ConnectionGUID: PAvyDu+gRRuXhK23QMtAEw==
X-CSE-MsgGUID: F1Xo6x+yT0GMszp5RHIIfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49113733"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="49113733"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 07:49:58 -0800
X-CSE-ConnectionGUID: rKvnNIZZRVy5BxjfASWAtg==
X-CSE-MsgGUID: bcbg5ZyxRaWWetR8UBWP0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="139331869"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 07:48:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 07:48:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 07:48:36 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 07:48:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEIikQquXwEf7W2yfhese0yAviG1xR7HfrEdtbMC6RgJtrq73yzv8kgoL6aHt4Od0RAd0IOeGaRQZBcaD/F2RKfEuIhqza0gYRPwyG7D6+HtbSh8gd7eOPk03E4ijqb/7GRf7XLJV0W9lkuPlA64L7DkxVCquIzwt3Q55OJ6LbsSzXiEpGjVS8qJn0Wjs1CUbunJzQf/e/AHWsQ1WI8bTK9Iw0963j7FSDU5oJ8ciiISOTvM1sC8d2k7BFNi5V5cUDdUkfQfXqzuZxHvhIKK0ECiXAyigaDl0vEeNI4GoewdGLh6lthPZ3os9Luiy65VholH+6iFj2EVzW8DH3l6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QzmrMWC9OLxYFJnRLCtgayH7O/igAUYor5jyCtMWJI=;
 b=uUCICMP/2wPGADdkYsBjdztvHW5x8EOCt8+Ex3sccxYK6vGLKp2fv5v0nCErirephU68uEwMbgawuuA9xOoIjrY7h1727LP8FhzcLAE+4TJy77NgtIB0GnncMGPTUKBsykXFrCdiY7bRebJYvxUb0PKBR/bt732z6GjaCWFAbnP1f4NgxIMpmrSEzFQFjSsKWPH0ME1RlC2MrmkGDC3h61gyXoe0fmcah/sPk8UoG+814Uj21bg8mSMnh04O7H4SCiD93NF8NracF3PiHwyTyKc5gVa4/0JFMUaoQLpL+gGgJ2TzJBZ9QKVXbLwpoac81bvbVtClumePxl3QTXUYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB6503.namprd11.prod.outlook.com (2603:10b6:8:8c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.20; Mon, 27 Jan 2025 15:47:44 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 15:47:44 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Taylor, Clinton A"
 <clinton.a.taylor@intel.com>, "Yu, Jianshui" <jianshui.yu@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2 resend 2/2] runner/executor: Integrate
 igt_kmemleak scans
Thread-Topic: [PATCH i-g-t v2 resend 2/2] runner/executor: Integrate
 igt_kmemleak scans
Thread-Index: AQHbcNGscxiJCEX20kucCaZTR6eejrMqw34A
Date: Mon, 27 Jan 2025 15:47:44 +0000
Message-ID: <CH0PR11MB5444B240E300E6A1D55DF6E5E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <20250127152813.293529-1-peter.senna@linux.intel.com>
 <20250127152813.293529-3-peter.senna@linux.intel.com>
In-Reply-To: <20250127152813.293529-3-peter.senna@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB6503:EE_
x-ms-office365-filtering-correlation-id: 237e8721-c509-4fef-b3c2-08dd3ee9f09f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?g3lsbPVMxFmIc0fDnwG8Hu37QUUYl+D9Vg5yqcfDjASZMFQg4P9DsCQxTbGO?=
 =?us-ascii?Q?ZgU3XfsjXD5Omx2AuXD4Qgn0liVk8v7l5l4EKDzjv74R5i/Z0W/SGbNkgsnz?=
 =?us-ascii?Q?xP+U0l0vTlbsItqhv10alM20hxafath6uxuTDnxfeam+nxbHspGZPPbBeN/Y?=
 =?us-ascii?Q?AsWxT6v11oPa5woBHQoWtf3Azp9Ot5D89eOLaCcG+nbH9RApBbyXozb3qNxC?=
 =?us-ascii?Q?KIYYHCgiFCOneM4BaccNIeUD+LIAByBbxqP+ImI+xnBAvx8VIPR56ZOULxgQ?=
 =?us-ascii?Q?9nwCNgAaFeie9OYZkdA8NaINAOuhed8IVN7QLCLkimAMyejil/ixu965QCGN?=
 =?us-ascii?Q?s/D65I9+OA+TJ3o+Rd9AcKREeyziK6gp0g2tfmma5mDHv7VpgbDqq3a4wWla?=
 =?us-ascii?Q?QpK0BNFWRKWygM24EuDEgYTJV1k8qfD/eVV7pOSsJv8WX6wwrw6XThcfiWv1?=
 =?us-ascii?Q?hbjC3avLlvohZ8U3w02SRwvaJMYtrYxWmmm3Uqajdooeci6HNuUoeKBCMvfT?=
 =?us-ascii?Q?4S8t3bXx2CVDkB41t2Ey7lfvV5jVqHFJG0PWDVgJ/GW0wdPWnKN6en6TuhAk?=
 =?us-ascii?Q?V4Y6MB80GuYme+xBB33Ur4tn8P+8Tzt72KLmfIz2+7x8/nj3degTCG6Q8EWM?=
 =?us-ascii?Q?6zOxmLAAnbUYgaowOFLgWXdw7gKTWukIiY5q3mXBT45G3iE1yiuR6raVUEsc?=
 =?us-ascii?Q?vx20UH6lFRZZGrIC47gek3mQIGkT+M5HLfh2B+rzwVztMbxvH7ElmT6LbqGc?=
 =?us-ascii?Q?onfYIQGPwIXEMs+Es1dqkBMcbdlubgNrPzAU0c0iyVKlpYxyFq8RF4kBoUgN?=
 =?us-ascii?Q?Ak6EYnfo1JytkJdyg6/OnR9GTNJ8kVkTz4roAi29Ed2T7r5ZYRmMnGKv6SK2?=
 =?us-ascii?Q?rHboZIFgtM1D0TAwPBpYrFT0W8cTzRDRrI0HR+7fAcXH42rZYWlIZW0ABPlX?=
 =?us-ascii?Q?Rj0Zm5u7tTzncJ/iyHeddPJW9GfNcAKytBx2FyfPNYNQq//0SZHihNllZttg?=
 =?us-ascii?Q?sxEY8QH8XsbxwdlqotvLXrSdvj3erXrL410E1mpwKhkwH3PtRCIvGm4KKwjr?=
 =?us-ascii?Q?o1c70THsweIayXp8CCSCFMQaoWVYulHNRAzbo5YzyLdTTgmNM5uNH7nP99i4?=
 =?us-ascii?Q?NhSotw0a7wuBeNbVjQf7Uj8m9Ed1TGIZiMpXHTHuxADTuluG1UMp5TaVOzFz?=
 =?us-ascii?Q?VjNJr5UZTP6nzaJaAQaqIspT//8sg5rzCap0f8TKTrXdCCkLMgRrj+DqTzwE?=
 =?us-ascii?Q?mTSFqiHIfkwitvNqW39m/zCFpOP0kLRfEsQfy9oQ4Cth1EhZUd54UZkjWhZa?=
 =?us-ascii?Q?7g8Qkyp7jyTA+5MLR43Xp4AbFRqVixiNzfjJZWORuyqX2ANWfp2LKG7NB5cs?=
 =?us-ascii?Q?KDG/pg7zVJ9qXk6B41B/38W6gWURcXwaJn/MnXqgZZr0VGCj+dH1sM5Sm9Ke?=
 =?us-ascii?Q?Vor6PJPqfSm42ULlNl9Pdcw3ijqZ2j8d?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6PtaFBuRCV1H2Tyl5l3HDu2bwlGfMp4loMFM33ySUpmGphvMoMmrQxUeR9cS?=
 =?us-ascii?Q?dly0DPmhqm3yJt97MStpC+4fzqI7CuYvKLBl2KGdQ6N44/RuOPEeTt1HMsPI?=
 =?us-ascii?Q?ew9qP7bQVbamBgSiZvRsqn7aEhJrroiHlJzyryAz5jOGekqZHjYMKx3XLEXh?=
 =?us-ascii?Q?XyWGVm0GiGa8FIY+L+cIxEkd5tNccQt+ICnYfrDHvXqWiGw0W2g+I2rnzSA9?=
 =?us-ascii?Q?1jQOHzSBJt+lnSRJvezWzdzAlLVbtYd11Wm4pOmWB+urIda2gvb31gvBrp9V?=
 =?us-ascii?Q?Yvqjsz6xUxhzEYIcCG8hGHRgns4V8TKQCKnh2ayRds2V+VtmBBm0lto/artz?=
 =?us-ascii?Q?ToAFKH/tLu6g/jN5KckPy8DK1p+UcM8EZIePlQf80un3j0iZi4+MRjyJjbfu?=
 =?us-ascii?Q?L9f8raNDs8WTUHBJvbrZwKitwV7+pWxsk53KFCBwbb3ZccA36Nipl9VZy7Bj?=
 =?us-ascii?Q?j9DLycHWvEgB1HLiJ3lffdvO4fCvzoTuMy8hIjUuYN3cz1T0e0Gfq3uTeWcU?=
 =?us-ascii?Q?p2qpovnTNjAtPSPRAwg3dzgdQMVzd1DH5K6+DkgSNzHEDFWy6R++QzlPt0gT?=
 =?us-ascii?Q?yxiyFCPW2dvKETMsg9f3UnRhSRy5oIGxy6zDJPKj9Z3+OlcTuTqgWBbOXZAb?=
 =?us-ascii?Q?NvaDf8QVp0aYtXpSxHaX3+isXFcmiPhaEFARpP4vJnXsdeV1rfyFNAaLyYA/?=
 =?us-ascii?Q?+Wkg+Kg83er8oCoyyO2Aby6UKmveRkcjzZi5HUw0KZdpVAbS9YvCY5ClJu3+?=
 =?us-ascii?Q?zvbAufbsbFlI+kUTnq/J6GcBhc8XTnfPZ4jctKCSbjOu5sMnQOrkXpfHd1oU?=
 =?us-ascii?Q?qopUDWE1BpDpYPpQRh3pRs7fAYKFVYL7P3YoW6Um31KvdYI1XXpjrh8tL+8w?=
 =?us-ascii?Q?BNJxSUm7DssUvSeh0sthsvX+QaL9uCDrw/NoxWZGL6OXMJ+OYkqlYzaEJ9Gn?=
 =?us-ascii?Q?8aVhhtEdXRFbif66aBQrQKzx81YCJdoMzCjkk+Gw/yDw4OooXVMYMi1zLsvg?=
 =?us-ascii?Q?cHsRj8PkKRKDMsx9amOMmL6X8OhgQPWQEJfEmX19P/dte2OE5ZiemMzoTwPP?=
 =?us-ascii?Q?2r7JjxQuBZIZKVH3vZj2g2QAFdQISwe2hC/CjQ6Kt35oB7/pff7lmMQAhUwd?=
 =?us-ascii?Q?2jeFErt0597XNKZRl1nlSGaZRGXs1O4NGvs/RT1KfFHquahjoDOUslfJBCjN?=
 =?us-ascii?Q?pWseXDp6LGpi/vzz0mYWBxPgzj2LCdMGpfoZJheFySKUB2DqbrL4HssVja98?=
 =?us-ascii?Q?lm+3d0f1ZvWOOIUQ6jCkHcoEDvD8z4T9V0YptfB9UQqsOqC9NVp3xKcM5UIs?=
 =?us-ascii?Q?O+2tE8ofob11cX1U7S5tOqIOsaqd7y2uye+mL05ZjeK5qheB/ysTMJtXOxn8?=
 =?us-ascii?Q?h30c2zeDTdNehsTbPuaQLdA5SYpE/TfeaSNpdUFdaZmsbktdJCpB9OKQWmd6?=
 =?us-ascii?Q?QrQ63fVPn449WxfZ+KpysW0M+nSyzrAPm8OD1JwcrCUBS0hCvRpD2WCfbpR6?=
 =?us-ascii?Q?DdCcHWxD6SLa7jU67UDyqkAczMe0nflQ5VISqPGxscylF+eyrQ8ny5fWTZ61?=
 =?us-ascii?Q?ZWw0qM/swIw3W8mGAyjK+dwPfvvtW+NGN9DWkSbs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237e8721-c509-4fef-b3c2-08dd3ee9f09f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 15:47:44.1358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NT5Fk2LxvsSNdOOUP1UUY6wJfKfKKzQmNoCLgW7tnhfVgWdwah0lAmWufkH2tymupkXnM3Q82OcET/EKKgOvA5JsJPed/ckxLW2kPsNnlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6503
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

-----Original Message-----
From: Peter Senna Tschudin <peter.senna@linux.intel.com>=20
Sent: Monday, January 27, 2025 7:28 AM
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>; Rodrigo.Siqueira@am=
d.com; Gandi, Ramadevi <ramadevi.gandi@intel.com>; Knop, Ryszard <ryszard.k=
nop@intel.com>; Lattannavar, Sameer <sameer.lattannavar@intel.com>; De Marc=
hi, Lucas <lucas.demarchi@intel.com>; Saarinen, Jani <jani.saarinen@intel.c=
om>; Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Roper, Matthew=
 D <matthew.d.roper@intel.com>; Taylor, Clinton A <clinton.a.taylor@intel.c=
om>; Yu, Jianshui <jianshui.yu@intel.com>; Vivekanandan, Balasubramani <bal=
asubramani.vivekanandan@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel=
.com>
Subject: [PATCH i-g-t v2 resend 2/2] runner/executor: Integrate igt_kmemlea=
k scans
>=20
> Modifies igt_runner to include calls to igt_kmemleak(). Kmemleak
> scanning is disabled by default, so add command line options to
> igt_runner to enable kmemleak scanning:  -k, -k<option>, --kmemleak,
> --kmemleak=3D<option>. The options are:
>  - once: run one kmemleak scan after all tests from the test-list
>          complete. This is the default when not using option.
>  - each: run one kmemleak scan after each test completes.
>=20
> If kmemleaks are found they will be saved to the igt_runner results
> directory in a file named kmemleak.txt.
>=20
> Updates serialize_settings() and read_settings_from_file() to save
> and restore igt_runner settings to and from disk. This is used when
> calling igt_runner with '--dry-run' and then by calling igt_resume
> instead of igt_runner.
>=20
> Updates unit testing for igt_runner to test that:
>  - Kmemleak scans are disabled by default
>  - Kmemleak scans  be enabled by command line arguments
>  - The choice about kmemleaks being enabled or not is saved to disk
>    and restored from disk
>=20
> CC: Rodrigo.Siqueira@amd.com
> CC: ramadevi.gandi@intel.com
> CC: ryszard.knop@intel.com
> CC: sameer.lattannavar@intel.com
> CC: lucas.demarchi@intel.com
> CC: jani.saarinen@intel.com
> CC: katarzyna.piecielska@intel.com
> CC: matthew.d.roper@intel.com
> CC: clinton.a.taylor@intel.com
> CC: jianshui.yu@intel.com
> CC: balasubramani.vivekanandan@intel.com
>=20
> Reviewed-by: jonathan.cavitt@intel.com

By the way, it's:
"Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>"
You need more than just the email address here.
-Jonathan Cavitt

> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

[...]

> ---
> --=20
> 2.34.1
>=20
>=20
