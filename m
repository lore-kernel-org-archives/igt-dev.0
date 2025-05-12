Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130A6C3ABBC
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 07:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4E310E138;
	Mon, 12 May 2025 07:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDaLLlw7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A9A10E138
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 07:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747035515; x=1778571515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fDcOnool/hp02lxDhusTRkSCJqfGqSUbksha9DeD0Ao=;
 b=eDaLLlw7o20Vq2pqGRF9SWc8Mt3b8H+EJo7Y+orC6rvhIvpakUElXdbP
 OIherYa6JzzhFetj0eEPJRAI1lzdcQDGR8DkvMzqO8QdUJgOJJZQDvs3T
 Vt81wC3hG5GZ5UazQL2PWDt43eZlLwZDsd0YKyofk6G7VpO26dvsxiow7
 /CbFs6JkqfuQL5IHOlT4LMOJinxtqMSyK5Ev8lioACgBxlRxaALu4P8C+
 FVNBjC1BYrxwDIGQa6XkqQMAAijcrk242ggQ31+SS2j3TLjRiwMTfKSEM
 zjdiMOPJwhkf9JR/hnq4YK63H3tOrmU0eFRjVACw2m07zv8MDkpUIZcBI w==;
X-CSE-ConnectionGUID: hgzME+VzQo2+xnYbH/T42w==
X-CSE-MsgGUID: kiIIMZNwS+Gr8a8MpinpiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48971208"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="48971208"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 00:38:34 -0700
X-CSE-ConnectionGUID: gxgKYTklSXelk1dvGOO8yQ==
X-CSE-MsgGUID: 8V3+668sRJGbwv5n+coD4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137146870"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 00:38:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 00:38:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 00:38:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 00:38:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxVwkuRb4bocN/jbpwnzNJs0Vrc6/yPqRtu6cE98M+kN7t61aWShQ+GHeKIR1sPCtHsuBF6tvMQyxcUs0KGOpwmxRNOR4Kqxdl2iXRnOzlY1vWaBnQPIjbFkF9yc2MRG6LII1LjfYdtJiyL2kFfhp1XdahEX4wREjejSeDHlsYJmbrzS6H4iO4gg2pBFSKQkyupYdb7OHzDrn5CJ9LE5Mc/I8isPlmq/Yhadtp8u+m3BKgT9Px/bVcMHBiwDmbpMZxDgu3qtoTlZW82RI+McgwVPYvbwBA2hXeZt+YS6tLlHWmyw5IdE9dzbtthcV8YaDMITOSh1elbXtvM9VIWgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDcOnool/hp02lxDhusTRkSCJqfGqSUbksha9DeD0Ao=;
 b=xEzqVtjbqwVw4i2x6NQBCNTjOtNZZvXjXsNKmn1Cy/eHRl9McRlmHLXXVi44s7HAHhRl8nXTvBKcxYOx6k6U728x2XQQVit6lfI2zrLgpwue6p1pkby3NfqA2uBOvJhWCmjcJ4dqdhwkAGNQYzUUV3RipVYRnoaqwLTzmmlmKMlqfO16oQpHalAkk75mP1BeVQ1XrqMLMs+HJuxyCMPf+3L6NEpJRJ4RZGXd+u2oOY49koGeOmYItJmWamP9RRay0O3K0xe9g2VEX8g/8w/Ms6kc/zYopR9Cx2eKAm8A869Otr2Gh/lBVhBiZNYUl6dsoS9MuaF85GTcnZZI75ounw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 by DM4PR11MB6333.namprd11.prod.outlook.com (2603:10b6:8:b4::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Mon, 12 May 2025 07:38:31 +0000
Received: from IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240]) by IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 07:38:31 +0000
From: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "markyacoub@google.com" <markyacoub@google.com>, "seanpaul@google.com"
 <seanpaul@google.com>, "Santa, Carlos" <carlos.santa@intel.com>, "Singh,
 Sapna1" <sapna1.singh@intel.com>
Subject: Re: [PATCH v4 00/15] Extend IGT to support Android
Thread-Topic: [PATCH v4 00/15] Extend IGT to support Android
Thread-Index: AQHbv2mH2BiZKyAXjE+sg8KFsJJdmrPOoM4F
Date: Mon, 12 May 2025 07:38:31 +0000
Message-ID: <IA0PR11MB735323BC1ACFD4D7ECDFBCFAED97A@IA0PR11MB7353.namprd11.prod.outlook.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7353:EE_|DM4PR11MB6333:EE_
x-ms-office365-filtering-correlation-id: da445338-9d70-45bc-a685-08dd9127fe6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?/p/AiEOf43mYPzZaFcBrSgfqoMLm5mQuFtMtTOLCrxliosxvC5ZzM1zfav?=
 =?iso-8859-1?Q?DjHfWcjRoBFGvI3iRrjpH4x1y6ZfY53tNUtMotUObYJtwc/TUzkpC6Y1qK?=
 =?iso-8859-1?Q?imeZVD8IYCoOvIHMptFycIyajmZThnSsjQIBvCv7JMikm4uLCUiXeg2S9N?=
 =?iso-8859-1?Q?nsxyUD6R1eaNdxUf1VuboQJiogUks5W31QiJ7kF4Hu0JF2CSpS6iU/w1n4?=
 =?iso-8859-1?Q?EpTZ3oh7MnmtG7p48jufls55ZgWlBRzsPkFqwHgoA+p90ejuuPOc6xth6f?=
 =?iso-8859-1?Q?MURL2BTlVVl2BVJ3RGQoGopyjLX/74Q1LqexDZw2Yap5+Y4iZYHjwXDiQ/?=
 =?iso-8859-1?Q?i7p2/MZ4aHqiD9wrZ11SxvZpYqTQWyQrHZfBnn3baRxva5wHa5thDN6yOJ?=
 =?iso-8859-1?Q?L86wb099zXbD8FiPVTll4wdjBVC+pMQnyl4kBXcfD/wox9oZVblpL6iD16?=
 =?iso-8859-1?Q?muWhom5B5jle19JhLkmvokToCgFUhIjv2037IZc3+DEm8sWWuz4Udftwl5?=
 =?iso-8859-1?Q?zh/jzZrB6Q73iBTzDxQbX9HYsI9VGWBkUMyiMj/buciqM20HhsYhBPIoJb?=
 =?iso-8859-1?Q?0iS2kdwIidxBJgjgzHHmVOjw5r9MtX4DSs6iCkZkoDrQZrIIZiHg/yG3I5?=
 =?iso-8859-1?Q?6UBAGTNVbVi+PGpmyO/ScL78l2hNJHrOpXFuu6AUjTUrKTa3nD0VR25lqO?=
 =?iso-8859-1?Q?xl4BNSwXOk3eHsaA/QMUtO4HFoxskRja+PanWniQVTzHI+zIJdlbz/UDi+?=
 =?iso-8859-1?Q?dz11IY8hNBYOgRLiBMZ7D1h1B1VoClLhEVwFYv6RLsT9RWfRHRkr72iUyI?=
 =?iso-8859-1?Q?2/BLdsqj/ltpi8YyoQxoTN6UeywqReYR+SnfK8RKbwOTwvfrAXMNJMnJyp?=
 =?iso-8859-1?Q?J8AIxfIUZsJt+fTd7UkJLLFwNKi4U5y/hWsQ0JdV23ld/VeW2SvqEqHVti?=
 =?iso-8859-1?Q?KUChy3kOEDFeG1/15BICaLi3gbReUzd7cBMxX93SYYVCiMCvsIfyrpU4Ur?=
 =?iso-8859-1?Q?mong6gTK+h0PavZZB7hseeo1Xb+GDTnKM7GWIcaa7f9bXo+JLDD7ZSbzjp?=
 =?iso-8859-1?Q?s/raFqFgyiDKSD4qMUrBuwvGv9mHgZm53PVmwYL/3p+wnCw5uCb0bHyVrU?=
 =?iso-8859-1?Q?RpJ3tKSjZfwIVemjposibjrL2gCQR1wO4fIhNfAnZQhJrtelNR/CxdSHbL?=
 =?iso-8859-1?Q?8AdIkVY6EallQFBHubnNXpF7h9Jqd4eRmanarI2jwvh7QQdaitBch4ZKLh?=
 =?iso-8859-1?Q?8iWZ+7Hx8Yky+CGH1sGWax7jLNQhL4Ze5e9ZPkXDHHkH/bKk9PD3WSWWov?=
 =?iso-8859-1?Q?8eqUbYvG8q2JTEf6damEiCIluQzoA4M4eCTdOEWJjyytteK7X9jTe16JeT?=
 =?iso-8859-1?Q?hy9hfgF6S/nLWOC3vTOFsVDRpDmfeoibFZESKiqfL/CY6mCvazSkWjC7J3?=
 =?iso-8859-1?Q?/8T6Tt13P070wiNow2+n17vHdPZbznRu/a+2YXeq3GDRjYbc1sze2gjXKs?=
 =?iso-8859-1?Q?/cw8j9F2068jhyPG0bSqJ/fpX4OQJVKYLTbtOAbYuLzA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7353.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?prMqpC08wCObhinzCMiiPvgO+HszFVgjHJbTDPToBPletCbksjV0I8nzBU?=
 =?iso-8859-1?Q?I39v6P8mPNplaFRrg/PG2M1vdUNBWTnsL4+Z5Gj0JtY6vPqgsR7EjvfJqn?=
 =?iso-8859-1?Q?GIcPLNYiCwD5lYS8RSHjhv2oI1wgB+Rz1eYxqUOIKD16dMS4+66yYrmGMH?=
 =?iso-8859-1?Q?CoETs33ciavExXMDkgGYbZzbsksJuaL9JKHkjRJQ4sMs/UQdSkjfgLpWvg?=
 =?iso-8859-1?Q?0Z+jYmIZ6x9qTJK0qrjEl0QQQwC5OtF88r7GQOeU0ankJ3L9AzBfEi6w4+?=
 =?iso-8859-1?Q?TMXqA90r4o+6QrYXEIjGAL0Fn5nLEI17C1y0gsUIwMj8xEcIcK+z2W2KhZ?=
 =?iso-8859-1?Q?jay5LVjEczchDRObnkqnJz+0FXXxXj8XDc5kJBwXKJney7MXumsdAK0751?=
 =?iso-8859-1?Q?YNj9tIgIaXvi95s0zhXXSFZLBlC5X1DDGs7OGLyYP7VyLl/3Jqf5/H8A/v?=
 =?iso-8859-1?Q?+rqu8n9HXlCUTdQ1OFXT9FIoCMf+zKYn9FP1arnnq80Yobl28QzfxeTJeP?=
 =?iso-8859-1?Q?aA7YTUxXDkie5Jv4eyB/oRgUKqr/V1ptStQi3W6AC4mc4tgkfXzJj1CIJH?=
 =?iso-8859-1?Q?AlN64kvwSzul28SQA7L/3MCI/Q0WSu+Ufc8yaqngWEDXgjWocVtHy0FDWM?=
 =?iso-8859-1?Q?i1iAa9eY4eMcgS/NCXrzRxNSCy1Dl3m3FLsWpULb9j6OeIaRdTw3pEz/jh?=
 =?iso-8859-1?Q?TNzxDX4mbYqe5kNJM0d7oVEY4/+dCRmKQ74mha8AHJ7Lmf7zLWvm+fQTAq?=
 =?iso-8859-1?Q?C7ZHAi4qVV99uWxwdNiT94In2p4Hhjpyqwqawjw4KjU8tAIlKyFqUz99vE?=
 =?iso-8859-1?Q?d6vg8mtoVyiXFntp7fHHvXai2zLEQpiiuhwsrU6D6Zul4bO+WAh1GlkEyw?=
 =?iso-8859-1?Q?kB7EmQYR3vXfeghvFzxAkzlyor/T4S0gsvsrLW7htE2zU86ksxr3shK6zo?=
 =?iso-8859-1?Q?ZBQ0VmGIjq18Di9aDwi5KHQh2tlhba7YEu9BBCpYsJiNXii8VGWDfsE0w2?=
 =?iso-8859-1?Q?faC5rhBYotU0dv1c2/x0ODC+sdVUG1KiwUgmsvo8DfYPePRxFma7MK9LB8?=
 =?iso-8859-1?Q?HpaRGI9JJ71JbE2MyWv2MXzY+qSME213y8AAdCtJ56iq7S6F9rUoQWO7FK?=
 =?iso-8859-1?Q?dRtwxg4v5WRRc8OAyHlexfnvqgZXkCUJIAcWkJAvkDbuHmbUUDslstYUlW?=
 =?iso-8859-1?Q?TjsoC05G8+BIjSjDPQDoISd6E03WAMJkk05I8QzStd46XUd4Eu6Yxxr5+h?=
 =?iso-8859-1?Q?gsr7ul3mfXVTWDW+vMEl1cmefwnwFVsFGRV82c/7kcyfSYCHuqVc30gMpk?=
 =?iso-8859-1?Q?13TEhEkXZDInT/1aK45A6Eq5LsyYDjIiuk9sgySqWo9gSmSYzGHhNATkAI?=
 =?iso-8859-1?Q?sgVCALaLHTqv+PzkrvYp/z3wvNtEdlUdT4B6VwyH8qU3iF7vq30Ik+hnh8?=
 =?iso-8859-1?Q?pXtFh0BP6ZDOLDugzpgungHASTmOIrTzoNuDn9zOfuvdUZBnx8H3H+Qr2A?=
 =?iso-8859-1?Q?Zq6eINg8xB2qHknvNGT6MJlXp9Zz1JCWvmzb4W/BxdyvdPwaJTO515BAET?=
 =?iso-8859-1?Q?/xA0QU8eht4+7wEMpJktz5sPLdGB1TPD1suCbgkjcfmaDpnZtHL4kWy2S5?=
 =?iso-8859-1?Q?a21XIdzeHtPPpljOiETWXZ84w7TeJW/tXN?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7353.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da445338-9d70-45bc-a685-08dd9127fe6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 07:38:31.4510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z35EawBwnPgud5hDBKIISzeYIkEVHxy3aKnQ81r+ezppNg1zXtaw0mdikC+BV6w5n1McJQvJYVjfNo7T+VBEW1Qw8wtQpdCqfD4Ju/ZOfFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6333
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

Hi Kamil,=0A=
=0A=
> The primary objective of this proposal is to extend the functionality of=
=0A=
=0A=
>=A0IGT to Android environments.=0A=
=0A=
=0A=
=0A=
>=A0Enabling IGT on Android will allow developers to perform comprehensive=
=0A=
=0A=
>=A0testing of graphics drivers, ensuring robustness and reliability across=
=0A=
=0A=
>=A0different platforms.=0A=
=0A=
=0A=
=0A=
>=A0By providing stub implementations for libraries that are not natively=
=0A=
=0A=
>=A0supported on Android, we will bridge the gap between Android and Linux=
=0A=
=0A=
>=A0environments, promoting code reuse and reducing development time.=0A=
=0A=
=0A=
=0A=
>=A0Changes done:=0A=
=0A=
>=A0- Create stub implementations of GLib, libunwind, libprocps, and=0A=
=0A=
>=A0other necessary libraries to satisfy IGT dependencies on Android.=0A=
=0A=
>=A0- Replace glib hash table with igt hash implementation=0A=
=0A=
=0A=
=0A=
>=A0Note:=0A=
=0A=
>=A0- Incase of linux systems, system libraries will be used whereas for=0A=
=0A=
>=A0Android stubs will be used with reduced test coverage.=0A=
=0A=
>=A0- Support will be provided to maintain Android support.=0A=
=0A=
=0A=
v4 patch set addresses the review comments given for v2 and v3 patch sets.=
=0A=
=0A=
Thanks and Regards,=0A=
Jeevaka=0A=
=0A=
=0A=
=0A=
=0A=
