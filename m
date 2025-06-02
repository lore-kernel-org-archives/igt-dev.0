Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FED6C5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 21:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F4310E039;
	Mon,  2 Jun 2025 21:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l31fJq4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EA110E039
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 21:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748899497; x=1780435497;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=szKyFNNSG6ivSreVCK6QeFmn4IEvInNGihICA+ef6sw=;
 b=l31fJq4AoVSf4A567BVkSOZoZOTTJ151P56TWjKZ5rcv9BAuOp3f8S+f
 mNQ7R+iDXGuOdXeNiiwR1MO/vu/knhCh5Rd3+3kP7r6+tEMqlZ2Y3bx2C
 xsaEdEn/9mpV8igBmYlJpyjEVxEOjHkpg5oYN1SKwzx37koxQ42gr8mBJ
 c4X1vH3Ddc5prR4jO5+RPpJ5UhQI7UIe/U/W1GdMcd0e5rT89sg4o33Nw
 5NgCEqvI5qn1O1Gy0qS+TZx5/Y/424mojLOfBuKLHY1iQEnN4TOWuinp6
 C5k7b8JWPZ7HTLcuG30KROJPiWQtCURd9bkKztd+/59N3nv7iEyrLOpF1 Q==;
X-CSE-ConnectionGUID: r/I1goWVTTWJ1q/6ivVe/A==
X-CSE-MsgGUID: Lnlq9wMURcCONDtxgr5VzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68349797"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="68349797"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 14:24:50 -0700
X-CSE-ConnectionGUID: B4JRQAenR6i92+mLayuqwA==
X-CSE-MsgGUID: VZEwgQsHTeeUnO9P3xg8PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="144681379"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 14:24:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 14:24:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 14:24:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.63) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 14:24:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAAnOJ6GH7zXHhMNEi1cEuqzA0ng58RcDDLN0izhaOa/evj4wmFGrMgJuYPCWCwQV6D4brRn4/vpwKqaTD1t0gYkxsjHr0LloxKHlshdm3l0goa4tF7v9h0RISwURRwPH0DFKPjrGR3G3m76CuNTazw0/D5WA3etiDxFbvr4NUz83Ts7jSR5ZmeMF6CKMvTNWZBcF4R/rUGf8HQJ5b5dWC+uDtrI8k5DivYcEVsEmqx4vLeDtf+aF1Geb2SKZYEOBq0uoZsJT20cVwUC/nScB/L+QG9e2LxbzCr1B2J0jBsnUK8SsSnpOhvpicyK5eQa+MO4IqsadAeSvHznyFMg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21UItIamlZrSQZMUyn6nBFSmXmKWfiQTcaLHOf6fE9I=;
 b=BrJTiM7CmnVPyiMNnPOU1+XH3aqgnorwNhGnFx9U1o1fiMt5wLID6CsLZDrn6ajRk45T8lm+Xpzxj/f8S5OBFAQaCyygfl9xcgJSau4gqjydMUPLjrlW2852VrufqFWp0FmfnxvxmulVrJodWS0mixN53cGBPpMD5SrwF/oYT1mj8SRhrCne7kb4OiVqtKqEY2HlY+PsvObkwe+6HhmsY3m+Joeylz9mt1VGt4KT8DUqlxu4zK7nKBisIUy4EqCj8vB3VzzyrR0ku30TC6M4vhx4/B9hlkBqkRgjXpVlmwHA6Ee/ZWMZI7x+NhEk/3Xs9Ni/4b6A7PRwMFE8XqGA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18)
 by DS0PR11MB7879.namprd11.prod.outlook.com (2603:10b6:8:f7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 21:24:47 +0000
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8]) by SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 21:24:46 +0000
From: "Grzelak, Michal" <michal.grzelak@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1 1/2] lib/igt_psr: Skip the test when PSR is
 disabled
Thread-Topic: [PATCH i-g-t v1 1/2] lib/igt_psr: Skip the test when PSR is
 disabled
Thread-Index: AQHbxAE5DKMKyt+Qb0SXx4jLC3m2W7PkeJiAgAvnh9A=
Date: Mon, 2 Jun 2025 21:24:46 +0000
Message-ID: <SJ0PR11MB50721CC4FBE56C699B83FE5B8F62A@SJ0PR11MB5072.namprd11.prod.outlook.com>
References: <20250513121918.2758842-1-michal.grzelak@intel.com>
 <20250513121918.2758842-2-michal.grzelak@intel.com>
 <DM4PR11MB6312170FB25617B0A4A490AF9065A@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312170FB25617B0A4A490AF9065A@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5072:EE_|DS0PR11MB7879:EE_
x-ms-office365-filtering-correlation-id: 18c80197-b4a2-4e3d-e5e2-08dda21be658
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?B2EakvvAHKynuvrsrjv9cvQwC2LoSKRrd1zJUz0mF/xyhY4WYtTr3xWWbX?=
 =?iso-8859-2?Q?XfkMKlzhEClGt4BoW9ZFOSWopPB+tU+Sh5EY/63UXLwCj4CFTi7MuASyQK?=
 =?iso-8859-2?Q?/Zzp6EzAkDp4zN6BL1eRsqpfaDt3WMn99OxyNu07w2GgxGM5E/jGxzIpck?=
 =?iso-8859-2?Q?mAGIphKZdUYj9XwJyydaLtSONVId/RpnY+gIaRK618Ycywi+14BDHbqVE3?=
 =?iso-8859-2?Q?Y0Z1FD6YomkY+Z/2Tb676MylDEp93CWr0PcwxlmY+MfCziiB55rWZ2+koi?=
 =?iso-8859-2?Q?UeNghuB/EG9BOL19HbSUr5p+OmEiaoVICdPo0FqHfVuXyKStzoLOZg+D3B?=
 =?iso-8859-2?Q?MYnI1yMnVvnSR40fpZn/dZn4k7fjQklUMM8aePOGotLTn0LTd8Rcoo9Fg7?=
 =?iso-8859-2?Q?XPn+6yDoiXt+rEwC8Jgl6mSbQZrIbqqZTtcShW7GPsheXf0zG6vBv9xD96?=
 =?iso-8859-2?Q?ehh5ihW9lOS9/7HZw8U/2Muf2ROn6dsiw2Y66yA0ObFXAAyGu2bJOSl0xI?=
 =?iso-8859-2?Q?tvRybbokKWEWRciDNEqBld8eoqM4WciEcxKd++WGCjQZ0VMXGj8MmlFrTU?=
 =?iso-8859-2?Q?RSogNEIhqYxcfetD85eIyK5B68E2SXK/mUefDlaY3+JYtWP4izPCFH1XST?=
 =?iso-8859-2?Q?Q9hd+Fe8Lfkv/X9HviEN6iXTJjBUWTTBXUJOM9N04WRD7sPaTAGFcQPRf6?=
 =?iso-8859-2?Q?6M/SdCO9gkLwnG3etXRvkP9UOMKqhWuFmt3fCRWkfyH4TMAofmrEN0HXcG?=
 =?iso-8859-2?Q?k3q5D1ecn9KRj3QUvj5/bxcXzMrJ9FGLCdi8vXr1WwyzjNZhpk6v0dx5US?=
 =?iso-8859-2?Q?rvk9TkC1/e2sePvgcqTPEMFItTL//BfLpWQmoCH2rp4tHfmP22tFbsO4Ss?=
 =?iso-8859-2?Q?UqO8j79tTeM83xX8yZ+2PakMofQ0SOwnqxBDTO9olkyX+VNCNvcxi41Nqq?=
 =?iso-8859-2?Q?g/yCAhAihm/frqTtvZFUTaD05fo+XEBeDu9SWsUVVYMyPxlxCiaY9VjZFJ?=
 =?iso-8859-2?Q?ybiRIRQC1SJRBXk1n9ubKoJRpP01ujg3cfuArwb0gRQ6a+ectJgjik0wwk?=
 =?iso-8859-2?Q?jfE+E9IFgZiz2xxRHfbix1phCiMYrz/EREJOwehW/dlEIsK6r+h6p+C2ns?=
 =?iso-8859-2?Q?sRvP0vUU63kGlLlZXFNDkqjn4yz1qWUC4zCAOdLFfapDvgJ0VjU3eWO9pi?=
 =?iso-8859-2?Q?CnSngRn0bA8n/hworzquTSoOyPWj3sXCtOpjrklle1tV1l0GFWjJkp9MMX?=
 =?iso-8859-2?Q?vTAhpy0oPRMM6rmGzPtrEZNEJqoA55YYIAXHJa0DqJs+6rbp/PS6mrsFAt?=
 =?iso-8859-2?Q?dZ0Zy23pGxonLC+4dPp3HtDZv9X2NLwSg2WA6nGVBCj9Ug3rRE5IinLquH?=
 =?iso-8859-2?Q?nqMTz/eQ1p5dyI8rWLSe+Ab1uM7J3RYYAOMZiPbay1BVRvpAYffU8ZzU5S?=
 =?iso-8859-2?Q?1M2QdQis9gnZqEhWpiBochPr0f9PO/dpLes70grZGlyZ+lpR9sK2gCDBUu?=
 =?iso-8859-2?Q?FThdgmhKyYVtWLyFBSH9vVeY8HDs/F521crdnI2sktgg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5072.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?A50wwg131ZDDTY2SFneHRbK7gF89Lp88x1Zf7OyVN091Q14nzKrOo0+/ye?=
 =?iso-8859-2?Q?fRJClH8d2fKx8ovq7ZnYgJJMC+DGNRvjByeUVjhXyX4xwOfM7lx/L9wSrD?=
 =?iso-8859-2?Q?3RIj+TsxCRKdjuDIyJeXF6RSn+B0cuBYGkhRm2b/7DMYoPG7Oi1drVAttS?=
 =?iso-8859-2?Q?mGRyfGODqhDCEzcAOQ/jDbTWIV2z8GMNyttKzLixCml6NIMdXAaImwey9m?=
 =?iso-8859-2?Q?Q5doeNHr9lSOv9vojD6WEokZokQ/bwA7JxAYOhte4yBs6HDjsSKrwi3gFx?=
 =?iso-8859-2?Q?UXIIfv2Rr1d9gQkkU6kkSikifANrYSMmPtCghQx2qzo0dxhVrPf01g10vD?=
 =?iso-8859-2?Q?0clvXbaTTFPYLbhj0dKHuxZj3nGwgy6IKmEmg3oGD43IjFr317nW47ZVQd?=
 =?iso-8859-2?Q?sM8EJ6r/e9GuvhxT9cQRyTR7Sqo0s5RIqHBYslUF5yGgiFafE0IhgQWr5e?=
 =?iso-8859-2?Q?B8aAfHxyMH2RKhxNgCpGLNHFgwKl/86OCkjTAAV/dPZkn8z9MubxA3kSqW?=
 =?iso-8859-2?Q?Z3IA3pxpA7gpZGJDl8TmwWPf0d60wy5dkK1qUiaBfdF6W3RyU/I9PVHzoI?=
 =?iso-8859-2?Q?HwslQY0nTyy3tjNKnC1rDy4T6D3Ksws4cjorDkUj5SeWqUdZJu67oQhmed?=
 =?iso-8859-2?Q?HqGTFVdfnngOcVb6KeYDOsuG5+58cRhbkMswP7ZFJKjDNdm7BWMdC/Tnha?=
 =?iso-8859-2?Q?YKKsOppNXO4OBQsk08PtwftJrd6r5NOGffoyD0ZjZ34tEm3/Y2Ec6FOFLj?=
 =?iso-8859-2?Q?HT3x2VNTlqidOvlPmpucSNonrbjTXvxevzO2ZI7co7dTSSRp9Qhay/xe5J?=
 =?iso-8859-2?Q?HMAz9gy7wL2nY48+DOB+NUTwWqJtvgJ0aDGUV0VwTAS1LXFl7bUqvYCzSz?=
 =?iso-8859-2?Q?32M76c9L8aueeGHkj0r5uk5WChkPz4Plp7Unr/PsarMOljg+kzL7+0HviH?=
 =?iso-8859-2?Q?yj7igyCAb3OE/exfLjVWYM8XVENNNrUH/spO9Z4p4kSHLvtJsJO7BZVJV2?=
 =?iso-8859-2?Q?4dszVge/BHllWSrl/SM1fHgsEqIaRaR4nkiQ5n4Hy5bL9SWuTeziBzwFpr?=
 =?iso-8859-2?Q?fngQAPCpXVLkD8Tw9Q5e9H2qzdZO7PNf/QMW0bJyyRp/XnUYxcPzkE9eKy?=
 =?iso-8859-2?Q?XVKcnd+J8uXBx1/9GIfIS88SBf6Fm0/t2ZkayxE9uZuTDOIYkANlfiQR9G?=
 =?iso-8859-2?Q?R0lWvwvaX7c910QWSqU1NKW4KBhWbhQHedyO2i/LmQxfNM//LHr/vHqNgT?=
 =?iso-8859-2?Q?9jcLPhX7PX0+zfg4H/W0pZpwMqRdwLsKYRCZQEynxRR+MSmVxfY9syUeCt?=
 =?iso-8859-2?Q?xppx74+W9PjzU52NZKoTkIOpDaSx3hZ7mvNdWR7nvRIsttmMVUPZrykJqh?=
 =?iso-8859-2?Q?l+9rKZz1pmG8dwXCTifFQFeLqM112+dxkOnjK5CZEtLVTeSFl4RAv6lVkZ?=
 =?iso-8859-2?Q?Z3JKkGEq0dgBlTS9eGUIMNRLaX2sDislERE2DoUMbKMo0vDKy9hOocXzdn?=
 =?iso-8859-2?Q?mMfRK19A9/kp5HrZEnpa5yszw+pSERnQ8NeXC+d8sWuD/nSVkd+jrrtM/8?=
 =?iso-8859-2?Q?N0TGUcr1c4d3rxpvKLjrJgbEqUjaAuh/EZEKfXxawx/lFmH8DKLZYG0IVs?=
 =?iso-8859-2?Q?3wotkuEPnoqZ5dJJlMj2ncX5n+wd0HfJv/?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5072.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c80197-b4a2-4e3d-e5e2-08dda21be658
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 21:24:46.8814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: udWXBvrb/jDfCuq2ZBlILm3rCnpA6Cm+vQ7T0UN+E7t0HTJBaeQzORgB88JJ1lCduXLvXl2sLHA1caAz0NWXfOf4oGIJD9UH9TsOQ41nKFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7879
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

Hi Jeevan,

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>=20
> Sent: Monday, May 26, 2025 7:38 AM
> To: Grzelak, Michal <michal.grzelak@intel.com>; igt-dev@lists.freedesktop=
.org
> Cc: Grzelak, Michal <michal.grzelak@intel.com>
> Subject: RE: [PATCH i-g-t v1 1/2] lib/igt_psr: Skip the test when PSR is =
disabled

>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of=20
>> Michal Grzelak
>> Sent: Tuesday, May 13, 2025 5:49 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Grzelak, Michal <michal.grzelak@intel.com>
>> Subject: [PATCH i-g-t v1 1/2] lib/igt_psr: Skip the test when PSR is=20
>> disabled
>>=20
>> If PSR setup timing is not met, then PSR will stay disabled and test=20
>> will fail anyway. Skip the test upon finding that setup timing was not m=
et.
>>=20
>> Signed-off-by: Micha=B3 Grzelak <michal.grzelak@intel.com>
>> ---
>>  lib/igt_psr.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/lib/igt_psr.c b/lib/igt_psr.c index 3d8f1949b..f35051ebc=20
>> 100644
>> --- a/lib/igt_psr.c
>> +++ b/lib/igt_psr.c
>> @@ -38,7 +38,7 @@ bool psr_disabled_check(int debugfs_fd)
>>  	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
>>  				sizeof(buf));
>>=20
>> -	return strstr(buf, "PSR mode: disabled\n");
>Lets not change the format here. We can still keep it as PSR mode : disabl=
ed/enabled
>> +	return strstr(buf, "PSR disabled:");
>>  }
>>=20
>>  bool selective_fetch_check(int debugfs_fd, igt_output_t *output) @@=20
>> -122,6
>> +122,8 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode=20
>> +mode,
>> igt_output_t *o
>>=20
>>  	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
>>=20
>> +	igt_skip_on(strstr(buf, "PSR setup timing not met"));
>> +
> I think instead of printing like this. It can be:  PSR sink not reliable:=
 yes (setup timing not met)

My current understanding is that kernel on JSL reports that sink is reliabl=
e. But it disables PSR basing on the setup timing. Thus, questioned lines i=
n i915_edp_psr_status with this change look like this:

PSR mode: disabled
PSR sink not reliable: no (PSR setup timing not met)

I thought it looks a bit misleading, because it seems like we are giving th=
e reason why the sink is reliable, and not why PSR is disabled. That's why =
I also changed the format, to include this case. Also, because of that, in =
the IGT test we would still need two different checks for skip, since "sink=
 not reliable:" is independent of "PSR setup timing not met".

What are your thoughts on this? Should we keep the reason after "sink not r=
eliable:", change the format, or something else?

Best regards,
Micha=B3
