Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CDFC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 06:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FFB10E0E2;
	Mon, 26 Aug 2024 06:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gE1fZKf9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF05F10E0E2
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 06:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724652522; x=1756188522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lZsmbv0M3ikDF//Uv7CZhFGSO8Z1/W91+s+puSSnrws=;
 b=gE1fZKf9tdpkRsJjOBrrzakOtY0KITRUwR5YBv/JEGNahCoBo4EE1q2v
 qfw76p5d8jMDoESeGPpxjvt2OtR+Ca/n1yzjj5crNMCvBmE5PKvbSBzQ9
 zOEhrTOnWaKXkhKiaWAneceqObagOamsQXUv2pShQSiY61qlAY4RLyA7A
 qzpCweJ9BMWYJ4/p7qbmJ9SrRF6NKa0cco51lYTrvorrWjwMDMY/WDAAQ
 YIvrQRA8IqgAuxzclnklKkfHq1oWc8cUmop4sRXADcQPGOXslQUKgrx16
 oUZCAoZCjLc38IPyJJMgSFT/Gl+3dGefSTkfW+jhIrSEGjiRhpBDtOp/s Q==;
X-CSE-ConnectionGUID: 1WJvvVL0QgKTWzHBrEVVfg==
X-CSE-MsgGUID: r2kOUbNTQe+mmJPFKo5gfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26850119"
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="26850119"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 23:08:41 -0700
X-CSE-ConnectionGUID: I9gb0+66Q+KXbMo3G9kKrA==
X-CSE-MsgGUID: Xi7EX0mjQJyO3CsCFwouDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="67217815"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Aug 2024 23:08:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 25 Aug 2024 23:08:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 25 Aug 2024 23:08:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 25 Aug 2024 23:08:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3ySXyHXca52honuyyWue4/atFpQ4vhgLwhe48SGuykvrLS1njUw+Jhr1G6SXsL/wlG1dKZ3lOiW2iyJeM/+5w+T+rXeQ2J3WZtuqaPN3+H9PHPCwmkm2uUOaugiQyo6748yUj+h4jiAoOW+JzjRJdu/eRYOCPA3z9m33rrLLZXR6Di2joUrZvKS1KSdpVIt1NgrrUECWu9IKBLqxa0jm5qpq8LpEbzgjOd/EUgEXJWqA7fwu/oRMhmOGvPt4gmXCuBId40dnA9KVrqK03ZvFA8TaWr/ag4yi0t7HwhrvibDqnDIBldrNLtl40X4B1D/6Ns+jnyxBPYSHvLB4KjAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYlNaBmj87CWTLWf6KPGXVVpIJ5locM7Sg82Utnqh4E=;
 b=Lp+jqGorwv8bRPNSPCrD7VwkCWaGZAsPoZu3qZbNc/6XTq5oadX+OyWYv8Tkx0t2VjXAIlMdJYX9E6AA3saXnGygyGVyi9ktRssFTIZ/KdGvMuiLXat8SUofVYg2rbx2X08d979CGwqVF4t94AOkCSF1z1joJGKHV1SYCQZlvDj/jLuWEmO4af6+kSXM6Qadyr6XmE4I6CAw0ZvVFEuKZABOVbFTzUQRljh6Rjrx6JJ0HITUlGGEx+c5no69qvu9ZlEQRZllibsDPFLyBAMOMIw+/th0KU+BawE87FbLPxYkWWM+PVO63OLswONxbs5fzv5EGeb7KvjWEyFK2QDPrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:08:39 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%7]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 06:08:38 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [i-g-t 4/4] tests/kms_vrr: Add more logs to skips
Thread-Topic: [i-g-t 4/4] tests/kms_vrr: Add more logs to skips
Thread-Index: AQHa7USwkdfWhhG8I0OcNZo/X6g7srIxQZowgAfgE3A=
Date: Mon, 26 Aug 2024 06:08:38 +0000
Message-ID: <PH7PR11MB60531E02A3881AB4C4AE388AE78B2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
 <20240813053845.2567954-5-bhanuprakash.modem@intel.com>
 <PH7PR11MB605304E98446D57DDF4DBC02E78E2@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB605304E98446D57DDF4DBC02E78E2@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|LV2PR11MB5999:EE_
x-ms-office365-filtering-correlation-id: 9dd4c6f9-cf60-4269-0d99-08dcc59586c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Q7BNaj0cZiASD+AVWvZr/Q+/Vi2HPJc9oaBht+dswTF8Juq5Dy1BUfERXyBk?=
 =?us-ascii?Q?DjibM8YitsA6kpJTFGPBJMM+SxTPwaYQC9F5odCjMrw6h2y1X8uAedrBpkHm?=
 =?us-ascii?Q?Vk7TWePROZX8cW80zSxyA7aorfCVVcty+XOEh7SYrBvDM+l8WTd/UfqrxHd2?=
 =?us-ascii?Q?Fc+933IoXNiiB+ByaVXlZbpj5iI5D//7tkXfaizECTgyqshyhFOiA06Xni5d?=
 =?us-ascii?Q?neHNFKx568GnXCT2cuVCsAtVah+q6K1LPaCjhD2WHc+6o5ybdXKMGljd4Wey?=
 =?us-ascii?Q?7PLX1Cq9o/HE/mpdAEaJKM8aggfeePrW+DJNinwo9fMFLNyGthQ0BMygrKda?=
 =?us-ascii?Q?5TMiyK83DeKE3TrxoEb5cF5oZcMNmseYAlSMKPxn9WNhzNas8oFDPJd/Z1Qd?=
 =?us-ascii?Q?9kR0SiB1T2ZvI8m95qUfwz5CIMeO57Q1wE13TjNZUbhRddP3KFxANudaGXxm?=
 =?us-ascii?Q?Q7mkft/z54gvOepGF0BA5M8LzO8Q1+3jC+yvwyLW9DgmwIajxps6Jgo0LOxQ?=
 =?us-ascii?Q?6pW3xY8VLheLB7AcjklVRGSWM78Ql2/BdCrBlY2e2gL35JdOI7sk98+5kAZs?=
 =?us-ascii?Q?pXKxLQTvoQqxcXdQyLIuSnsYRqQ6q1uZPG/ioSYfLTjsI+puSyIr9+PxHd94?=
 =?us-ascii?Q?+HJFFATy9hNqk8iT2oZW6Gm6MQhGd3VNjah7GfXKhKRmoITkq8KWPGyPTpuf?=
 =?us-ascii?Q?ka2NDzejc3gJwi+YlTXJvi5HG5Ak/92GaIN0bXyB0oTm27hqzz1t06N+khrh?=
 =?us-ascii?Q?XcI7d7IpOzqwJZ1l0s9pPYwrLxBkJPyYPW1J6vEmZsbVc94ALERSH2gGO3ZH?=
 =?us-ascii?Q?A50hNBNvSd5W1kjXRfAJBEnsbkfX+N4DBfTLHypfVyvwLddygvgElZqd0j/x?=
 =?us-ascii?Q?lYvGqFj/gdTsJ/K47Vi5+/+c+mxiDcL6LxD7JbnWyqTIAFxIJZ846ujb125e?=
 =?us-ascii?Q?s+MNn/AItB93m+nJ26kRKaZCjcs2LYLf5P8HiJFQZBlXMv/JSzl3mY/mA81U?=
 =?us-ascii?Q?tKo5LnBCKUME8LQxX7W0dxIP+TbXermqrxXaKjnq9I0SjSyet0tt/gCZLzb1?=
 =?us-ascii?Q?RPasssuq55h4rzCtS4cAGFKKq1CEIsE7lXU/yWfCdhUjU8xJ5/1mFHCPPVRG?=
 =?us-ascii?Q?CANmtxfsZ0w5vqDddRmF/W/0kcfUl4vWaTv2wneHf866cJ92pWGD+fI6BlHq?=
 =?us-ascii?Q?veseNAIMQyqyz4rppt4Edtjq85ohO8iHpPKj/f6C7cDzVcZfeOoumDWMCK3I?=
 =?us-ascii?Q?gNX5Jg9RMISgKJv38yEJMjAmzF/tkG1aNGr1awEjLScA/B3iuMP1MOkEwl8s?=
 =?us-ascii?Q?5IXJgo1ookbVzKsgnixiwIYudGgjLkw6Ghup+V7VASQARJCPF34bxJSFrsob?=
 =?us-ascii?Q?TNIURPk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/d6V978E9AsbdUioDvb0GPu6bcQ1tRa/kN20k9swxexGN98eHHtiQQV98981?=
 =?us-ascii?Q?poPBPk67ahVeLlmPGB3v6OZTk/gPqLMdKcF+Ft/9QSJL90q07p0RhsO3qApy?=
 =?us-ascii?Q?XObwY+q+F4p4D+leaAxwV+r54wWXIAbMgNb8DT/UqIb7qxN5cFeGOmjw93zY?=
 =?us-ascii?Q?9cBMPgq0nRxgl7lGr0ZSc2y10PVoJnpxOSWtU5xnr1y6t4HFq5SYlg1g8EXM?=
 =?us-ascii?Q?gWiF1kyMAMvndlRjiOB4YZtlTD1AKNKEQvEOdPmmUBDJOeF4YjbQeNzvpU7w?=
 =?us-ascii?Q?m3m72tN1tY560rvQLEJJkGlNL/OqnPHAaIMi3lcf1/qMJ1zylbeToCJwK7js?=
 =?us-ascii?Q?8TYedUocjCeK3yekGTAuKCNBMHMgRzGYF5Owy8JgYI/63Q2AsrlUumB/mo6e?=
 =?us-ascii?Q?k/oW0Bniwq7ALHnkS9NI0kPrB7sjjgETBNKW2GyUgdAPJBtufvszmwi3CRlL?=
 =?us-ascii?Q?VJx5/IPbjy/FYAAATrxmWBVVkovfZMCz975poW32pEQadYMSYvbPywvG5owm?=
 =?us-ascii?Q?j8qeMvy0fKY7wv4bIGxAFsNgKJ7ivLwCPAVHNf8pqqZa7X56islodb4nUHDM?=
 =?us-ascii?Q?Ho1ZHKDUtK4imTcyarmhUW17wm+51kIRzBFt4/6mGPt2uPMRVOULKwdEQ+Nd?=
 =?us-ascii?Q?vBUCCDPGe7gW2fTPoi4Kly8hzWWYQIhUKKgJslQlWIeUTNWlHTDUoMifwv8I?=
 =?us-ascii?Q?03zz4em8WgGjVoeKt9UeAhq3VAEEsx1IUg//EHvveap7sPN+fQQL4hfT3mXW?=
 =?us-ascii?Q?ZnqnVfNtXBixMNYm3oPxDAs2Eo8OPoLvUku/7RpmzKmiPie04wxZNOIsQwo7?=
 =?us-ascii?Q?Rp33RyIcvqyH3MKb4J0QS2U1+v8W1zXn9HZjwkJ5oPGgDXRKgcpWmuv52McP?=
 =?us-ascii?Q?uG9alFgY9GEWkHyyVdRYMAnXXoy6Qcuqb/9JZqNWLr57t9y6UuPjPKk2z0AK?=
 =?us-ascii?Q?xFWwRja9wTeHZGXwSU7qNPd7IH5A9RFgFB0Aa0Swmb66rDWkNKU0OSCXI1eX?=
 =?us-ascii?Q?s44rD2J3cZRsGd1fy4ZhouhFgBM9IqNZ+D6Etbl9oV1F3jPuQLfnZH37LjIk?=
 =?us-ascii?Q?Lr3mrDAbAlNaiTk5DAg8BAXh0oqls2sOf9gGm0AlbGFzMe1KyuAkU/a5fCps?=
 =?us-ascii?Q?JlrMiOvxvYx6Ego1JjIP3mxYwX0Ih7x3fiJOBV9gojfiGJJ3G2dBY4yEfrDv?=
 =?us-ascii?Q?XDzW1XUA0OBvwhRdHSKCSmNCCE71fO7y0mrezTyumsmBAc3wa2FlGvuTNTT8?=
 =?us-ascii?Q?6Mmizjy08ro6ODWyxIhPrKJO3x06HOS3NMHje9n03AgCnibK9kA+o0SshPaA?=
 =?us-ascii?Q?0xGMaSp1WPHxU0OWHQo68pMOfzCbGWk1W4FAykJDIz7EWYzVYVeL6z0tft8J?=
 =?us-ascii?Q?uSUAwWCSnyAjFrdWJU32zC4VW/l7pQ7a1x2KBMfOIK6hIlpnmqEEGNOvL2iT?=
 =?us-ascii?Q?ticKBU6CAnmHVRtXJ8Kn9uxWiy/89kndYu4uQb4WkjImq9sbixLNPAXTt5Zg?=
 =?us-ascii?Q?vFvO0xrqh9H9J2akdFXPmULl8Ry743gTkqot/ux/LT8GET8WIlUbiP+6NMZt?=
 =?us-ascii?Q?nZOjpvZ0qkxoMNVC3NLj23XkgUG/l6VJIKgknjTo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd4c6f9-cf60-4269-0d99-08dcc59586c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 06:08:38.1013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tgP73NVdJ35ykpvAkZQ77kJj/H3BmGlqOiuMtZ4OdGeOpIONyquPO0S+8UexQw024SxjnGsGfx89Fv8NCbDTzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
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

This patch LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Samala=
,
> Pranay
> Sent: Wednesday, August 21, 2024 11:26 AM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: RE: [i-g-t 4/4] tests/kms_vrr: Add more logs to skips
>=20
> Hi Bhanu,
>=20
> Please check the igt@kms_vrr@flip-dpms test on below link as this test is
> skipping and it is passing with IGT_7967.
>=20
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11563/shards-
> all.html?testfilter=3Dkms_vrr
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Bhanuprakash Modem
> > Sent: Tuesday, August 13, 2024 11:09 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > Subject: [i-g-t 4/4] tests/kms_vrr: Add more logs to skips
> >
> > Debugging would be easier if we had logs available for test failures
> > and skips. This patch adds print statements at crucial points to provid=
e better
> insights.
> >
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > ---
> >  tests/kms_vrr.c | 29 +++++++++++++++++++++--------
> >  1 file changed, 21 insertions(+), 8 deletions(-)
> >
> > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index
> > 4fa3df417..36a22eebe
> > 100644
> > --- a/tests/kms_vrr.c
> > +++ b/tests/kms_vrr.c
> > @@ -879,12 +879,14 @@ static bool output_constraint(data_t *data,
> > igt_output_t *output, uint32_t flags
> >  	data->debugfs_fd =3D igt_debugfs_dir(data->drm_fd);
> >
> >  	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR
> > | TEST_LINK_OFF)) &&
> > -	    output->config.connector->connector_type !=3D
> > DRM_MODE_CONNECTOR_eDP)
> > +	    output->config.connector->connector_type !=3D
> > DRM_MODE_CONNECTOR_eDP) {
> > +		igt_info("%s: Connected panel is not eDP.\n",
> > +igt_output_name(output));
> >  		return false;
> > +	}
> >
> >  	if ((flags & TEST_SEAMLESS_DRRS) &&
> >  	    !intel_output_has_drrs(data->drm_fd, output)) {
> > -		igt_info("Selected panel won't support DRRS.\n");
> > +		igt_info("%s: Won't support DRRS.\n",
> > igt_output_name(output));
> >  		return false;
> >  	}
> >
> > @@ -894,7 +896,7 @@ static bool output_constraint(data_t *data,
> > igt_output_t *output, uint32_t flags
> >  			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> >
> >  		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
> > -			igt_info("LOBF not supported. \n");
> > +			igt_info("%s: LOBF not supported.\n",
> > igt_output_name(output));
> >  			return false;
> >  		}
> >  	}
> > @@ -911,8 +913,11 @@ static bool output_constraint(data_t *data,
> > igt_output_t *output, uint32_t flags
> >  	 *   - Limit the vrr_max range with the override mode vrefresh.
> >  	 */
> >  	data->switch_modes[HIGH_RR_MODE] =3D
> > output_mode_with_maxrate(output, data->range.max);
> > -	if (data->switch_modes[HIGH_RR_MODE].vrefresh < data->range.min)
> > +	if (data->switch_modes[HIGH_RR_MODE].vrefresh < data->range.min) {
> > +		igt_info("%s: Can't find a valid mode with refresh rate (%d)
> > greater than Vmin (%d).\n",
> > +			 igt_output_name(output), data-
> > >switch_modes[HIGH_RR_MODE].vrefresh,
> > +data->range.min);
>=20
> It exceeds 100-character limitation in a line.
>=20
> >  		return false;
> > +	}
> >
> >  	data->range.max =3D data->switch_modes[HIGH_RR_MODE].vrefresh;
> >  	igt_output_override_mode(output, &data-
> > >switch_modes[HIGH_RR_MODE]);
> > @@ -922,8 +927,10 @@ static bool output_constraint(data_t *data,
> > igt_output_t *output, uint32_t flags
> >  		return true;
> >
> >  	data->switch_modes[LOW_RR_MODE] =3D
> > low_rr_mode_with_same_res(output, data->range.min);
> > -	if (data->switch_modes[LOW_RR_MODE].vrefresh =3D=3D data-
> > >switch_modes[HIGH_RR_MODE].vrefresh)
> > +	if (data->switch_modes[LOW_RR_MODE].vrefresh =3D=3D data-
> > >switch_modes[HIGH_RR_MODE].vrefresh) {
> > +		igt_info("%s: Not found a valid low refresh rate mode.\n",
> > +igt_output_name(output));
> >  		return false;
> > +	}
> >
> >  	data->range.min =3D data->switch_modes[LOW_RR_MODE].vrefresh;
> >
> > @@ -933,18 +940,24 @@ static bool output_constraint(data_t *data,
> > igt_output_t *output, uint32_t flags
> >
> >  static bool config_constraint(data_t *data, igt_output_t *output, uint=
32_t flags)
> {
> > -	if (!has_vrr(output))
> > +	if (!has_vrr(output)) {
> > +		igt_info("Driver doesn't support VRR.\n");
> >  		return false;
> > +	}
> >
> >  	if (flags & TEST_SEAMLESS_DRRS)
> >  		goto out;
> >
> >  	/* For Negative tests, panel should be non-vrr. */
> > -	if ((flags & TEST_NEGATIVE) && vrr_capable(output))
> > +	if ((flags & TEST_NEGATIVE) && vrr_capable(output)) {
> > +		igt_info("%s: Can't run negative tests on VRR panel.\n",
> > +igt_output_name(output));
> >  		return false;
> > +	}
> >
> > -	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
> > +	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output)) {
> > +		igt_info("%s: Can't run VRR tests on non-VRR panel.\n",
> > +igt_output_name(output));
> >  		return false;
> > +	}
>=20
> - Pranay Samala
>=20
- Pranay Samala
> >
> >  out:
> >  	if (!output_constraint(data, output, flags))
> > --
> > 2.43.2

