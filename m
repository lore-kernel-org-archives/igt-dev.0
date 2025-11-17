Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780C3CEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 13:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F10010E0D5;
	Mon, 17 Nov 2025 13:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cK7DtoIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E522410E0D5
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763386860; x=1794922860;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JHbw23Kz+YHXNNktHaM0566kGyIF9pPgPt6OYXrDVwE=;
 b=cK7DtoIMVT8w3aXOcqP5+ckqmAxTNgfMNcIQwKF5tVBOZijiGay3s/PC
 nL3pLxCSPLf9OK+jaXOZTgoy8TgK5zdvcCYfEB4vJtInN1jHD7+gJxNI+
 bUqtYN/Qzh4h4CIq96WlvldloQgmGcV8+Cnf7jPJYalOBQzq6AqgYxM7z
 lTeFsSdsKPjUruiT8eRC99xEHrqHtonEsNuumKWyEhTW+NEkBu2wRqhTm
 NjIZp3BLPaGG0s5+0dexokz/Xtzqo7kFwYo6gomEl43o/rBPcTeSCiodv
 DNGxJ7Pc8FL3NyZjVYadmmYXUBqyc1nldiE0WLok/tFSUt3+RDn32VoVR A==;
X-CSE-ConnectionGUID: VJw+6EjJSF68f0Qa7ewdDA==
X-CSE-MsgGUID: WFUqnjWySh2lLqRIty/zeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76845109"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="76845109"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 05:40:59 -0800
X-CSE-ConnectionGUID: eY2jbSoJScmrXQV92ef1Vg==
X-CSE-MsgGUID: 5WtBQz3/SV6eS8KM5mFYLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="190114086"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 05:40:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 05:40:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 05:40:59 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 05:40:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXCylUq5bHIUkxzUlzon0FwzLkjnyjbgV7mm8UZX2BBu+iAcS++9JdIn/PyIghZ7gg4Ri437A/oy5tOhKBtunXgcvGOvtT7UN6i1N/zx8n9TBH5BO1+kFsRB3p5yb2tFGixXQdi2Mmfu8UBvcLd/5BgIq0phhblv8blyZKSEaCdW3FOhC4EE6iBkdHJ6mxO7yyfnogSixcDvonG1Ac4Ar+68SXEPkzYGt7+I5bcx8bkK92HB7FX5/2DCltLn85qMdOOvOABceEUEy03dUDyBg1DncbMiIMdW58hhRyzAnjP6OAYne2Nx6vk31c2mkON08x92vZ+hHjcXAflXnerzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1eTiwyBsgxxDvBNlvlfAw8p51uUdJ8IWXbhi+rQDHI=;
 b=Ma38Ald5A0nydDIwIPfGCpV/d0Bny/nLYL7ZvH2P6JAI+1hCWJDx0lUWEgRVazJ7Lcukrv7yZpvhY7unOlENss2fsm42N18+S7TxKKubgS/XTKiiBkTTuoZDx7WTIyxqgCravktRJzWxNWpq8zjC0z8A2GsquEUXqAeyyXmKikr3DO/r749i6JLHr9zs4ZDwr4S4OSqnspjLiUe5ASBlWNN/67iz1rnwfL9+sZ8VOs586nbPi4LgdpiFK42ofrxq+Z+Qka2PnM+f8r7VmQHPcRPJltggZlZFNX64KZYo5amPy9gn62PfZaXlGRAq4s5JBX1fi5Ah8dNnsCiwf1aOfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 13:40:56 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 13:40:56 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v2 1/9] tests/kms_writeback: Add support for
 intel-specific formats
Thread-Topic: [PATCH i-g-t v2 1/9] tests/kms_writeback: Add support for
 intel-specific formats
Thread-Index: AQHcVHk0KGK38LcSq0mvujTkCXULEbT24bhw
Date: Mon, 17 Nov 2025 13:40:56 +0000
Message-ID: <PH7PR11MB6053D1A96FE04512DAEEF14DE7C9A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251113085801.3088957-1-sowmiya.s@intel.com>
 <20251113085801.3088957-2-sowmiya.s@intel.com>
In-Reply-To: <20251113085801.3088957-2-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH7PR11MB6499:EE_
x-ms-office365-filtering-correlation-id: a24164be-d1cc-4345-d864-08de25deef4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SMexa3D11kT4S2jEwS2jsSyl5kgpvkz52i6A+G9B9ilDASJoth6kGGW8H8iD?=
 =?us-ascii?Q?U2TNbw3aCknZBoZnI35zNiwUtmVE7/RkqRZY773DpY+ZZbyzByaspTlDT/Nn?=
 =?us-ascii?Q?B8O9tYrJJBreaIRrAD+riN1mnZw1eINQqkXA4dSWaj7G398xVRX+wSkXgsx9?=
 =?us-ascii?Q?o6thX9gDw54imeofZGpOrdYzMBEcKEV86UWqv47R4MzDbZLQhf+5zddd0sk5?=
 =?us-ascii?Q?WND+bMa3WA5iEOJOSIatDZcI+adoXWHByQXKoaAPDUbSkuiC2xOC3xFkmux8?=
 =?us-ascii?Q?fROwgCmcsFv6bo+wlm8KH5VYYmL789HAPyiHA2ehM56gi1YPZ5dQT49zHUDH?=
 =?us-ascii?Q?tcjo4wix5BFdKR20GjR3yt5PjBE0l2kAi82Bz0BAMDJzRvu1haCl/JC9w3n8?=
 =?us-ascii?Q?IMLAqu/X6CebNYjB4iIua9wlh+oQRNvUquxP0+8JAWffgsIEWyJH2ld2xou0?=
 =?us-ascii?Q?tUsnnmj2PGIWH1lAfst5SjwFbcj7zrWsH5oANrWulknGAH7drrlN6EoMcd+F?=
 =?us-ascii?Q?07rojFO0sozSREMuaPoPACajJD8jJDExDqDTgzKSFpCAu6lGJds3sv2qxdYA?=
 =?us-ascii?Q?4fgTDlr/+bMP6zNjPsjett66sydpZ7QxXy4ZkROiPgmpd0bb5IdSu5qg9R4m?=
 =?us-ascii?Q?R+Ul6wqQtfcOpM+My89Nbwcw+9T82GEMtsGJovTRts3kJfC7WUiyoSHSSlw0?=
 =?us-ascii?Q?7tlVp0GMVJaXuiAy8/hsUgeL4Z98PNhsnLi3oxLr/LEzF9Xb8/5jVgwiIBh/?=
 =?us-ascii?Q?0HKXd+7gBcZq5tNBfqhkT0fLAbRXxgCf11trzETbvX+QIBPA74J8DbYlvMUo?=
 =?us-ascii?Q?73Wcm+XxK53hl5Nft4QbjblXH+j7lKnGUC56oNw+s3twYPVkd3JLfMAVqIdm?=
 =?us-ascii?Q?PkJ3TXWrTzS7+4KEEm9DQ4YBkrqC2ac959jFVdNXfUDuGcpLo7y7NKJ+GAYE?=
 =?us-ascii?Q?LcZPOVYVAqLcNc4nO+nx6+3PlMcU+Ysc1maX1fKr0wbZCEAPsEFBqwxympwr?=
 =?us-ascii?Q?OlH1OER4NFRHo/zEZ2f6fi3b86Nx462aXrmV2mSwz3fA7coYEy6irCx16hS5?=
 =?us-ascii?Q?UL9f9g3FtimNLqlToo+QxOOwTDg5W9LHMD9RBTS33AAzEFrSGpdEaagVK5f8?=
 =?us-ascii?Q?RPoH2JhMPqbostMZy7w/+iTQTO7sU3w9+hERgavbkVzuec2epGVLBoUJX4w3?=
 =?us-ascii?Q?LWs/3GFc30stx33PggjlrGBnCBLC9FFkMw2ncvn+WelX8t+F72cIlRpxFVae?=
 =?us-ascii?Q?AWBau6xSJylJ/84b10nw/yhu0wHPfSpMDSwSWcEOAjFjcb2OPawmm+e5JmhQ?=
 =?us-ascii?Q?6cFQuoUeHsZcHJyEArYGUyVnbktNHfp1jBXLqwjbFprIhmOlrhm1XuglpoeL?=
 =?us-ascii?Q?KMua3hJRxSW2NIKVcFKTWRHXHviz6sRzS38WmhuG7SR5M0QT/gSOcF/QGMb7?=
 =?us-ascii?Q?0fe7gtEgEjnbgmeE2wcmJG+DSuMXmdowkLyhgRQjzrVO+Gwp+sLe6ccDAIg/?=
 =?us-ascii?Q?4s6YkyMLiHcb1gIBYOVwyikS/sFOLXB8/yad?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1a57UZ0698DGDMYhpT5qnrEcoaVDPkLdLhh7Jv3YaHVJk9WeesZfKmL+qtvO?=
 =?us-ascii?Q?ap9Wdld6ogfxnKlrzV9mFNRJRcQlMzmfLTto/Bfp+RZr+tqFybl3mwScHlvl?=
 =?us-ascii?Q?ET7l+j/WRG/yKqq3viIhgwZs0DTmYVcfo0nViEBijfPQ0cdd+g9G+rocnniY?=
 =?us-ascii?Q?Z1QSqKMsO28oNyDN10klWHoIxSflxIjWaaes4HCyaoMS5NxwaRcDmulRiDLr?=
 =?us-ascii?Q?ZBaXtaQ3b0/t25WlVm2azaICUZGA2RNnzfaVji7/pRyOjmpaRN5DrCUL3wUu?=
 =?us-ascii?Q?9iCer2B+CNnHHNJY7t/GbZ/sFqNk/1vq6+8IfXqi1iwcH0Q3BJVwMFQnG8Pf?=
 =?us-ascii?Q?igD+jNq6PJx8cABcIGacRoXZCtOXkt+roNSWd3JbKSlRjphRaLLw/Mw4AphL?=
 =?us-ascii?Q?0HT6kDd4VkOQURIRfzgkw1Mx8eoyVUCvhlUntMljJMTmpmwJGkMJ3T586iYd?=
 =?us-ascii?Q?EVlEGFWx3Wbg2cJVLYYIphIPEJr7J8JBywXQek8JF7OHBtkxIxmTZtQf/Yde?=
 =?us-ascii?Q?4Z1aEU9u53auH0w1Mkl/YwCmnMynZGOaVbpJSlTtcIkvKa27gDiNU76MiBcJ?=
 =?us-ascii?Q?OeExCaETf1lAYrFCLzhL10tYcu3MUeYb0HlbCZCCXTpKGU2WMDIiKNXSLNSw?=
 =?us-ascii?Q?n6a8EFxDsrJIoqFl/CYZYiGPbuWYH0wWAxPoV29p6FZvprVRi9ech1fLL6qz?=
 =?us-ascii?Q?xJYvwzRj8PHDhZi++cQ7evn74WxhgZN5c4E2GJ+4PzMBsyzb+bnaW9qhy1QB?=
 =?us-ascii?Q?HMHcGGqvMtI10MOxzWfzJYZilWTELEGlwhjjQpDf3sDkisRZvEkHzluXp7Wt?=
 =?us-ascii?Q?mgawY+LQTByf5jVrcCMoyivV8wwVk8t1k2RrUBjg2ID/YhlLiTXM/if1EgQE?=
 =?us-ascii?Q?KkH9q9X/5H7z/6R9VIbq/UMJY/T4BLhiiCr9sHBLleVh0kzFLbH7b+k5wXJ5?=
 =?us-ascii?Q?MkHZnvQsXqtylMaZgKz/uzamD77lESEpltNNcmL7ve1cwDdKwXEz1FxBRzNH?=
 =?us-ascii?Q?v8VAqITSveWg0U5cnKuJUVxrIb8fB0QwCxBlBsRMsI1m+QfB8sIQtEzr0PZz?=
 =?us-ascii?Q?qBJBSyLSceK7f6uKIryige51SyuxUH0HhgF7x91dqxKXWKV14hwRgHq6JZs5?=
 =?us-ascii?Q?bWmDSXOiXSnNt/3RFHVnP69LL4fy1JwyT5jaZ5Br/Bvb34UMYdrbU5ozSV36?=
 =?us-ascii?Q?Wx9n4p+FsDcuQrHMcN86IQml8cNboMQVikB4EkECFfYP2t9pdWIpcm/jkCxk?=
 =?us-ascii?Q?a0MzDx64wLYmk2Bt7O28+Oo2rYUbJfGIDLCTmfZFnkY82Ncg5V9nSWDypnP2?=
 =?us-ascii?Q?mOqIMFv8yqKEksblkRUNzoZQAWqf8WZcHOckUk8q1zFvyZIdhIj4YXXBaKdz?=
 =?us-ascii?Q?tNVGcE0W1IBkdIY8qPeiGoAk6Ukqorul8v3KgH5yMMHtoefu/b/zAzcQ8ZMW?=
 =?us-ascii?Q?qP4TO+DRrk0RwWjzj++fPDGaOpCgvWRnVikir4ycNGEoa+IgDTl1WQKPMHa+?=
 =?us-ascii?Q?K9LwJkEof10aVeo/A/bP18ZTpepu4Qk4/sC3PwuXnWC0rp+tBPql99bNS+zO?=
 =?us-ascii?Q?Kus7RkR9rK/9mHbxd7bc0wJwWl3Wzutp9ioN9+Bh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a24164be-d1cc-4345-d864-08de25deef4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 13:40:56.0562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CePJcIFQBMSil8cbxBHlOvgLwyJqCxWh6OJ9mY+DoT8IsdWIR7lLORNtz5oy7QwE478QlTInOrjs7aW0kkXCcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
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

Hi Sowmiya,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Sowmiya S
> Sent: Thursday, November 13, 2025 2:28 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v2 1/9] tests/kms_writeback: Add support for intel-
> specific formats
>=20
> Integrated BGR formats supported by the intel into the supported format l=
ist
Can you include the Bspec id which mentions Intel supports these formats in=
 writeback (if/any)?

>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Apart from this code LGTM.
> ---
>  tests/kms_writeback.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 1b81088d7..de0f67a58 100644
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
> --
> 2.43.0

