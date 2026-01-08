Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D3AD1489D
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 05:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616E510E27B;
	Thu,  8 Jan 2026 05:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsEQw7mW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FC910E27B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 05:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767850035; x=1799386035;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lmBXOOym+OpivLMa8IJWieG2mCSfQdR07lmUFrVq4hM=;
 b=WsEQw7mWc/8uAa0kBoYLH/SclMF5CULrAVdph54yqzzGo7Xnuhl4q0mt
 SXVi2sdAwA55NjGqLbSpBhHAVxd5yaMgUrPOPhy+9ztZ/wjohHgy4QAJt
 L+3rU5iehZIBTUQY7WfCOrA9j0iky/hr/epkfDXK2Aj++qILntKmxfcm2
 XSx6/0J9iqIw7L0wpVda9zBYoksuxqgGHirv255E2T+9UwOtZRLOeQDFV
 KiKXm7WdurMgKc6aSxihTY805nyJUw+xEcStG6F3d1XlsuoPthSzfUBgk
 1jSf42xL4OaXt5S9ldVtJbhuEjjrZ++PTy4S0JO9GlWEVtShXsz4mUhMW Q==;
X-CSE-ConnectionGUID: 3nCN3UCeRxK2vqG66gVshA==
X-CSE-MsgGUID: yzYjUgTQT46ls9oFOnYGNg==
X-IronPort-AV: E=McAfee;i="6800,10657,5688"; a="69125145"
X-IronPort-AV: E=Sophos;i="6.16,1,1744095600"; 
   d="scan'208";a="69125145"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:27:10 -0800
X-CSE-ConnectionGUID: X/lQ5OAOS7eO6gMQJFJoqw==
X-CSE-MsgGUID: dezVjpfwQlOBnv9/CbhTHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="207588784"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:15:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:15:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 21:15:00 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:14:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXpgeqBVVJbn/ARF7YBCPvZq6dMdxwUPb/Wz4sUHGm4YCn3+CbzCgXlH+MxFCoyplZFUQ7EqIkflCqtQ4FJ/55wwn5yIWohQgeq82WnggHbjjz2WmKglcdPQDHZh+zIHHGMBHr5k3ibBmON9App59XbYTT5PkYPOMc4TaHg2dqn7E3ot1Fo3OPl78kzqu0igenHlKmEpgXewhL/m02eUgzEHpkp75x9rrPxiQMZNGdIdncqjbEO3mtJHBFGTevcQVWX3DXJa3FvnbHM2FHctKYxipCBeDNhqXhSlHrYo/VBhpL09meBFgfN5xOry3lA19vETlronC+dEgRA3Ub+UXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjd5mMZruBYseJwUo34XvP3fEcsSly8z0CpI2SdyzuQ=;
 b=YjZRZpRVmUuYu1ySulcty1OxMnfkx859DpTU4qVjuQ+je9l34YzluYcXsjMXqeGUAVM9f/xz5bQ60CNLHttjnVefF/8J+TgVHsVlX+PQAdLnHTjeTkQBcBrx5MA7sV7HUio4PxwMtdtW/OXUe5sZ/5WxP31XQ0wviePhPwN6xUeyL1wuNVDGe6hDVZsf2SWa1A8BAwmSIJGpSZUS2hhT0qzKOag/CXPruJTvI/aVE/nn1P2iuBkSWjLIK6U59oKfYZEoTGfUSxdoWjTES8yTv+m2oBRr6QMRlEeSjhp8BG6xkDgs4U4SZiWKbtTU60aSrc560zY8GRRJoNwb729pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH8PR11MB6856.namprd11.prod.outlook.com
 (2603:10b6:510:22b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 05:14:58 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:14:57 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v4 1/6] tests/kms_writeback: Add support for
 intel-specific formats
Thread-Topic: [PATCH i-g-t v4 1/6] tests/kms_writeback: Add support for
 intel-specific formats
Thread-Index: AQHcZDa0IhoMNK9TBUiD1llw29T7E7VH8tIw
Date: Thu, 8 Jan 2026 05:14:57 +0000
Message-ID: <DM3PPF208195D8D4ADCCDE63A28591F2793E385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
 <20251203094307.3187669-2-sowmiya.s@intel.com>
In-Reply-To: <20251203094307.3187669-2-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH8PR11MB6856:EE_
x-ms-office365-filtering-correlation-id: 15f386d9-4955-40aa-6819-08de4e74dde5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?A4CtBSeP16NeyUxn5odxU1aDRqh9YhdOM25soNpmUgm7g1+vlLdfy9vs1oMX?=
 =?us-ascii?Q?a50Kc60RtPz3aiKSonX/OOiR/zipbIXKbmELWnbfpDJrgILu+zzDEZ+AJLyj?=
 =?us-ascii?Q?3T9S7yvuwX42jWpZtWiH9JuUmF8RWEjw4nA3O+LeCFrKvtWCBWYUlPj51AG4?=
 =?us-ascii?Q?3YM6w4Bas9LQPP3MayACS+KcjBUwygbgLGR1gz44dL+HbxqRbcykvpbpLAKa?=
 =?us-ascii?Q?5zaIIzQHXNXBuah4w8J4GlpSRUekD1TO17hyCFciz6fWkxgYsc3BrmW44cd5?=
 =?us-ascii?Q?gfkdzg+byy/ReEJMpdO1jzSP+Y2h1H/pQJNQK9fswXoC5wzBQcZxV3B7GxWu?=
 =?us-ascii?Q?lXw8EwVNbntwESGRQ3sa9+t4uZaABTfgOJDCyS9yPjtQIxpK+M76uO1m/fqa?=
 =?us-ascii?Q?71k86vYJfEdo6DVSLgdIyK8ctxSFlIOoDsbSG8EKk3JH8lMS0BZxWOyK9wk/?=
 =?us-ascii?Q?dmwBKS116OU5KeKetgHDM41KzCroKbnH7hD8rshT1Dv8lPxQIb8K0c6dv4IY?=
 =?us-ascii?Q?RbzvhUO8yTdw2qf21gQp39KsxFeRRy4lLTM9MF1PU8yLAjMmVq8G9nq6XP6G?=
 =?us-ascii?Q?mAnrPs5dQjvDhZU+IumfdYSiyO9QguPe094qGLQHQzAklogn75gV+T3SMcIg?=
 =?us-ascii?Q?3kSDmg/Sp7apIXUvh1VNYyw/mbi+FFyI1vsWG6HZEEn5ro7IYtMifDYCl2pX?=
 =?us-ascii?Q?gV95U6yuxyOtvVYTcHepsK13UWvH+mcTfjONAj/eSelpewb67H2+g6ebzseD?=
 =?us-ascii?Q?Y4BQJYdGVAw+cRKI+ASUzr9sICMIWUZ+ToTUG9KdYwtALyRU9OXlmtXKOyZF?=
 =?us-ascii?Q?MqAvo4pgdMwBhYHiYgzvczqHQPhsMFrqv1pvHdWtiIUqHjLDMHcmS+PxTKeH?=
 =?us-ascii?Q?urKdAMfR0s+FaSNTdTtP2kjRgbfqab/gdAusjAYhlQEYSWtssbnk8dEkHHzs?=
 =?us-ascii?Q?cjVU8ndWKXFaVOepjblM2DFf7bta6izYChcURwN7Mg8rFUXwEvtpNuJQYRdo?=
 =?us-ascii?Q?0dUchFUcJwA2x5BRvTegbYuSRFzmY66BJTJNc1fTlVpvh8Fir33bKQwaYpGp?=
 =?us-ascii?Q?lKecguQn9HQipn4tOm5eN3e2dKvhjgW5cVR00r4fJYZlXDbOPea69EQ/cw+2?=
 =?us-ascii?Q?QQgVvtuQ8ZFNyFZr66nYRw8pU0+19rWkBP2OjZO+SjoShcDwZhYYDEXiVEnc?=
 =?us-ascii?Q?Itu/frWFY9BD8QONSdZD7Rm434iY/D1daerOO6HWfbaXGjsP7woOVSExzBve?=
 =?us-ascii?Q?xGZHKlPvV1t9LxbcDvEzxFWqeWrzN9YrE5Vsimw36iG7h6EspSFi9MQpPL5w?=
 =?us-ascii?Q?7Ho4yxjsChg0RJSXgROlRLJxsbKSaOR2Q03O0QiPfc9jxxxRxOxOknrK+ITU?=
 =?us-ascii?Q?3HbTxkQMKHCoeULuhWwaq5bNV2PAefhWpba8PK1EPWYPQcSHpJa004xX8V0B?=
 =?us-ascii?Q?laTAoDuF9HNS01/VJPUxEp8K6rgBoptS8K6TpKjQivaUyio5UuKv2r2VHEvy?=
 =?us-ascii?Q?bU9O24NAYNuUhgUHNGLEHSUMczja1H7E96rH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3wsH6rJncTijeXQPXpTRFQqJregX1IZfyVCNqb8H2N8QCY3OEuMWk8ZlScdI?=
 =?us-ascii?Q?xyFmtxcUJTEZjJSDO2w/U7iLTmQGG0QfUUEIXmR5KCrQbAWQidwA6eYGVbnN?=
 =?us-ascii?Q?dqlFFEI1B64MezvI4HXjF6RdA21WSrwuUQUQ+8l8mKu+kt6IJjXm/o4/2xpB?=
 =?us-ascii?Q?nEmquZvBZrEBtngKNdjoDCehmSWJJ+6NKEWL+aTGlBy77YOBe33JtfFIqtBV?=
 =?us-ascii?Q?evyocHOltuoI7DkkD6dMBz2pdm8yaRo8mGvYke6tPRRKN8TB/dqEi5T8LHXC?=
 =?us-ascii?Q?4eKGvzprfJAVfw+dRKCFvC9YTKbbSWBzMlZNFjZMSL0sk4RgSsCuXxHcmK5M?=
 =?us-ascii?Q?FhqW05SBnqLmaq2ar0X4Zw/hMBZlGl9Q18DNcWD1O8KswChS7AkqXJVKGiXF?=
 =?us-ascii?Q?GzkpgeC4shN3n7CVgGeHG0iR3M2VKNnSxVkBQ8wC186UtkGLZC9hxaif8HcR?=
 =?us-ascii?Q?i6uCICPXfXNsTzV0Nw7U+ruvj0gA/FsRv5xj2Ga02bR3pPMVnuq22wyGpbEV?=
 =?us-ascii?Q?Mp1ckaHqwD2b7xuU5lPjWuTSPg5LgyBUwOWDy3JZbJ8m8TbGa8mGPfHkvb58?=
 =?us-ascii?Q?HpM3PSxV1NkdIb5Nk5UhsUxDIpBRBsAbkLujJ4v1BDV8ZmP9Lix4oS+7c7Ie?=
 =?us-ascii?Q?Q+YRT6ROhpG5EC+el15e+Hxpm/xEfNzFfPi5hJ30D/2HbLJkzVxBHXWbcMQV?=
 =?us-ascii?Q?WpC4jweJOQAkp+8J9WjSA2C+fR5UNhVSVeqr7qMVmPeR/2r8xCnxg2RJ+NzS?=
 =?us-ascii?Q?HCLBsKWImRmNxn0cwSrvpAB15IL+DU4FGTwQuWm7VDNmy2gqzy9CmlC/0jeL?=
 =?us-ascii?Q?muZCKlDj2fkHQqARpvT2SyV9KGngYaCccsD3qOEfeRCHTb0ggiIwF2WE6uOX?=
 =?us-ascii?Q?X7ECCVTbf7YL0xynt2pSgQ7QyYlFwKMLRNNl6C22JqLEegRZ/od20NAVUKOk?=
 =?us-ascii?Q?uwtuNCctRCRze7kbIwLRzHTIfyBfh9UZXS702MJJ7WABdGz8TqL65KPey9Ud?=
 =?us-ascii?Q?NikdgAKGr8U5FGK1OB090+e9vyQRRibPo8Wvidl9Dzcz71dVvBn8zoHsuvcI?=
 =?us-ascii?Q?vRCX9eQ+Z2BBKteMPajG7anYvrFM+J8SRnDG8D1lmGFQxJ4ukCLLezPDAFHl?=
 =?us-ascii?Q?smitq/tkjdIBCpRptvqMfCyn7K+wyg+ALIJafhsMbU9S/SMv/5WXT7nl68IR?=
 =?us-ascii?Q?nk1PxdtkRFScKd6bD2ruPs3IBETpVdizK7q450OkLnpvpLIavrU5j0UJ9Up0?=
 =?us-ascii?Q?+bYb8R1Moo29tVLWhOfmWztbOkghbEpdAs1h2vAMakTZ9+pb162t8WUqACiT?=
 =?us-ascii?Q?+ALUpmne1fbnpw/M2ZPMB2pTPDntwFxgI02S68UfqwfhZlYHxGQYp0nf/MrW?=
 =?us-ascii?Q?K5jCFZ2B/rE2qqkoeY0Vz3hUBJ3T3aHmebFrb7iYwUnu4W78PoglJ7JLBDbs?=
 =?us-ascii?Q?2DPG4ioB+moGKLDNvSRous3eyvtebDKtFOJwbyOCTp34RCxmyNu9qdljPLqe?=
 =?us-ascii?Q?wBO/rEXzxNbia6lKr92AFPcPWYdyxil5/wXL7V9QutQbQU10buybF2fL3r3C?=
 =?us-ascii?Q?F853A0WJ4kHmHk4jgtsQogTm6dnM8651nO++NZgOKIbCjesNm+gTzqbZZgAe?=
 =?us-ascii?Q?PEknZP/HrUMZ3vS4eYvWDesGrUWmzfcPn2EsqNN9+YxFuWpH+0gD1jxS6HH1?=
 =?us-ascii?Q?/JFwaG6RQuR1m1AfGCjAEhEvCs7Ax/W+5ytNmvoAMw3Fl3WNBqwiyRdX/NhL?=
 =?us-ascii?Q?M7oSfZ/Q9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f386d9-4955-40aa-6819-08de4e74dde5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 05:14:57.8653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /QK7lNHAHuNCnY9iV2cFRZG2Raa+EW1o7KmnqZDPwF0rO942BuCto8Ar6at+SdOuiOCNmFzAslir7r9NQbXi3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6856
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

> Subject: [PATCH i-g-t v4 1/6] tests/kms_writeback: Add support for intel-
> specific formats
>=20
> Integrate BGR formats supported by intel into the supported format list a=
nd
> verify format before test execution.
>=20
> v4: Reframe commit message.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tests/kms_writeback.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 2fdb5bc16..15917d2e1 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -90,6 +90,15 @@ static data_t data;
>  enum {
>  	XRGB8888 =3D 1 << 0,
>  	XRGB2101010 =3D 1 << 1,
> +	XBGR8888 =3D 1 << 2,
> +	XBGR2101010 =3D 1 << 3,
> +};
> +
> +const uint32_t fourcc[] =3D {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XRGB2101010,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_XBGR2101010,
>  };
>=20
>  static bool check_writeback_config(igt_display_t *display, igt_output_t
> *output, @@ -101,11 +110,6 @@ static bool
> check_writeback_config(igt_display_t *display, igt_output_t *output,
>  	int width, height, ret;
>  	uint16_t i;
>=20
> -	const uint32_t fourcc[] =3D {
> -		DRM_FORMAT_XRGB8888,
> -		DRM_FORMAT_XRGB2101010,
> -	};
> -
>  	igt_output_override_mode(output, &override_mode);
>=20
>  	width =3D override_mode.hdisplay;
> @@ -298,7 +302,10 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
>  	uint32_t *ptr;
>  	int64_t pixel_count, i;
>=20
> -	igt_assert(fb->drm_format =3D=3D DRM_FORMAT_XRGB8888 || fb-
> >drm_format =3D=3D DRM_FORMAT_XRGB2101010);
> +	igt_assert(fb->drm_format =3D=3D DRM_FORMAT_XRGB8888 ||
> +		   fb->drm_format =3D=3D DRM_FORMAT_XRGB2101010 ||
> +		   fb->drm_format =3D=3D DRM_FORMAT_XBGR8888 ||
> +		   fb->drm_format =3D=3D DRM_FORMAT_XBGR2101010);
>=20
>  	ptr =3D igt_fb_map_buffer(fb->fd, fb);
>  	igt_assert(ptr);
> @@ -333,7 +340,8 @@ static void writeback_sequence(igt_output_t *output,
> igt_plane_t *plane,
>  	uint32_t clear_color =3D 0xffffffff;
>  	igt_crc_t cleared_crc, out_expected;
>=20
> -	if (fourcc_color =3D=3D DRM_FORMAT_XRGB2101010)
> +	if (fourcc_color =3D=3D DRM_FORMAT_XRGB2101010 ||
> +	    fourcc_color =3D=3D DRM_FORMAT_XBGR2101010)
>  		in_fb_colors =3D in_fb_colors_10bits;
>  	else
>  		in_fb_colors =3D in_fb_colors_8bits;
> @@ -419,7 +427,12 @@ static void writeback_check_output(igt_output_t
> *output, igt_plane_t *plane,  static void do_single_commit(igt_output_t
> *output, igt_plane_t *plane, igt_fb_t *in_fb,
>  			      igt_fb_t *out_fb)
>  {
> -	uint32_t in_fb_color =3D 0xffff0000;
> +	uint32_t in_fb_color;
> +
> +	if (data.format =3D=3D DRM_FORMAT_XRGB8888 || data.format =3D=3D
> DRM_FORMAT_XBGR8888)
> +		in_fb_color =3D 0xffff0000;
> +	else
> +		in_fb_color =3D 0x3ff00000;
>=20
>  	fill_fb(in_fb, in_fb_color);
>=20
> --
> 2.43.0

