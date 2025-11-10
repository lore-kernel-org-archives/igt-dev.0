Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694E6CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 05:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089AE10E2A7;
	Mon, 10 Nov 2025 05:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOcxgw99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B1B10E2A7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 05:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762754124; x=1794290124;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6l+o01SToQSwXJOrciL211WP0+7wUJ0OrWvH+sHhx20=;
 b=HOcxgw99B98dox8ryqcqEDwmfsqlqxlqE+LvFH1yu7rkUrZWthjIlZg+
 N+6J3eox6cnkO4YitbHFKXy3wNKQM/+2sbtkzwWfcWtF118DFMgNLneNX
 0+89lDyl+A7o+k8SptwrU1NN+k3RCcyZutqFywGwNHTHoobrN1C1JVUr/
 b6U2w8gAYEEYqpbQsd3umyT8yFFgtUqhOxb+65QKU3CnVWACwUuy/KqD0
 GlXh3KI47YXFn1ya5C1tEuMLgY7ky3anLFgGbh8K42phc8JqcLgi/U0Rt
 b1OQDfYbLcrgeDD+rKENXYoqhUtPPs0CZ1RuyhdmOWzOnaR2Aup29/PaQ g==;
X-CSE-ConnectionGUID: apkPmhR1Tp2QGXDKMhtivQ==
X-CSE-MsgGUID: DHkjJEWFSBu9tzGW/RgeKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="82197808"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="82197808"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 21:55:24 -0800
X-CSE-ConnectionGUID: BSgbZABFQCylippflnGPbg==
X-CSE-MsgGUID: hRBIPmCGR8+xrYaZwsf1ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188329061"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 21:55:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 21:55:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 9 Nov 2025 21:55:22 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 21:55:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwJM77n5qKc+0bRcKh7herVwuWE64qHKQusiCpVmvJqSiJk6iy27lllExMysc4uPYTzqkx5l6XZJsk5WOHjHwEWBfBz7XmmOJYIBv9zCmxEuy2VyCxvplrRi0PUQevS50JfZxAUtPb3JeVgqSlzpqzd2IQnP999zB7uWd7CpAdrq/gKETvyNKGEEAQFKvoyY6u335Uey6abk+6HsgVJLf8MpoTQ0l+02e1/ZlF8PLukG74Q35M5kyed5X1Cf+spHQDr3IwFonw6IPEu9xWQcc+GkaxYeeF+2LjPTWQSEtfaA+RduZudQ75oGvxS3rWiMEQM93DKwenZudS38cKMPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jnd7+LeLyf5Zqzv68RbaWvADcrtTvcHgNXAY3LZVVzc=;
 b=Nd5lJZ+4bLeLE71/5JjcEfs9FX7YUw+c7LZcmAn57RP6tLb1Z0veRuBcYvFPpiy1FWz6sOUz6wEuu98aDgB0xiIb0VrGmQAY+YSpBKt4aS7mKgorNrXkKLowN9mz3kpaMyv9OlLCSLT0tnX1zHwYbHXG6cn8Pq9XiRvqE8IOiknVl+sOQglGfXa8mL7pkH0/2RG1pp1nfUwZOuEMQi6KxEqxIDdFLQFc6u+QJtMaRCNZsn+7lcpPPrOlk93GWOYSdgevAqDDXbB3JVCkHv6KvOTdw++V1eKefSiSUntziEW9dnIwk+BWIQYvuTAWUxLx8Uaou0v79LF4kfGZ1dVN/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 10 Nov
 2025 05:55:20 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::301f:fd22:1d06:eb4a]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::301f:fd22:1d06:eb4a%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 05:55:18 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel: Adjust test documentation
Thread-Topic: [PATCH i-g-t] tests/intel: Adjust test documentation
Thread-Index: AQHcTbSZ8MLYiyu3+kWq6QA/GbgFVLTjVciAgAgZnWA=
Date: Mon, 10 Nov 2025 05:55:18 +0000
Message-ID: <CH0PR11MB5564B7AD11D2C74EA42A67E198CEA@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20251104175819.13809-1-himanshu.girotra@intel.com>
 <CH3PR11MB8434F388A8B5176D3347C96A8DC5A@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434F388A8B5176D3347C96A8DC5A@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|MW3PR11MB4571:EE_
x-ms-office365-filtering-correlation-id: 3f1f5985-c572-4af8-a153-08de201dba7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Bz3q2hYzY3nB0OQUGxqDkOYcUiX8UZ1oGAoal6AGoHbzwKSLIg8jwnPUM71K?=
 =?us-ascii?Q?2HWk1g4/g8whxrdX0k+Wvxnz/BZuG1IcfyUfdfCDzFZPS4irhK+e4JihnXek?=
 =?us-ascii?Q?Bh9ZGK5nUNGh2CSqfIeAx6nIUa1ib1rJlCtktPaliALVFKcBitNVHpNvYd4+?=
 =?us-ascii?Q?jROXdAlKzCGppBXZSw/ZAOm1lsBADDs8pqs2aUPP549uBNfqJSnsmzyDWGv0?=
 =?us-ascii?Q?CO1x0ueWMYUnmBXIrSxGfoobCka/HSVe/RBZgwwN6PU4zaLfIQU6SmtBrfCG?=
 =?us-ascii?Q?tewdSS2oKi6XI3jww2cPt2PqpakEJaCiFy7Utrt0GrooibB8pvKjarEe6Nw+?=
 =?us-ascii?Q?yNstRTaEVs3fe7i6P2G40z1S9on1wDIdw8aY/yDCQpmnr8FI0mk1J87/nZBH?=
 =?us-ascii?Q?jD9JhWgXeTjPp7DsPmXGwuYH+DJoXBSGim+qJdJomCuBpJzfhbaki57XKISp?=
 =?us-ascii?Q?0JsekdDKh6LIRM8eCpAhFJ0jrqtln//cpjODMOveRfzxALrd12cRzW7lvUyD?=
 =?us-ascii?Q?eW88w/nuSdv53/dQ42TDduOwpLbO6mscWVFs6bmvFCck9XOsKzERnfKDH9oS?=
 =?us-ascii?Q?k+HAUPGaoOtnpJ7nZd22EpmxDvcrcNZH3s3ZslmtW69i7gmYMl+TOWUVDIf1?=
 =?us-ascii?Q?FvFj3xucif56D5YSz0waM6ICNNJCe/RAvZRg+jWbn+B4veMvrsGHs6Ltjrcb?=
 =?us-ascii?Q?IsfP1RzdjHjR3JA9PY7jpxRPd/if5Ls1Y3L+KigCiu0bEMaWHfz4Vgr2ZD4i?=
 =?us-ascii?Q?tDKj3cE9ETwKpfEg6FabAAN+3AJI/fKMKOgopRbuIJhzeGOZd+Zd8aBjswgN?=
 =?us-ascii?Q?T8qvFu4BcRyUeqbgM6B01KcxCdPzRmsq7o90p95hJMYSf6LMVFP/72XoaieP?=
 =?us-ascii?Q?EmcJ98pgwfG2OeKbA20eH28+Q0qmrEqEvt8Zh9WRhhgYYM0clfx1l5uffaj+?=
 =?us-ascii?Q?XqaBAUMpRX4TIIQ0btn5Uh8Q0tL/VyljcSQBS2uLQ6hXyEKfyFNIpVEciOZC?=
 =?us-ascii?Q?z1Ioua+8duQ2i2EBorT/2vgif9h3ULkGEvpNh9ZhoANoAj+9Zb5q4B+wtCbl?=
 =?us-ascii?Q?Teud2/D5XmuQwL9KddwIHzleC2stW3a4NCbZBjVLVKz4ZhvBbDjv7wMX6xFY?=
 =?us-ascii?Q?XchMJyLLkOUuH7qsS4OD1PkJCHximz1rFgdLdy/bn2SEif1sB/w3iAy7v9S9?=
 =?us-ascii?Q?Myq926qDhmdb7yKf6E5TTakRhOz9rb6vFPpSgB+rTwVrMR3FC47mUiH+Fnab?=
 =?us-ascii?Q?ybpyocWpc/qOuXGx1wpFdTkv1s38jYIRDY8KEh2VsOzLA4na/IMlMzsbyGn0?=
 =?us-ascii?Q?EJp4+9Dq18wS803R9Kf3vhp7mQpvH+5O0gc5fHkxi7d9XLqpGKvgCVyg0GuZ?=
 =?us-ascii?Q?gg18MQRB7AueO0ro4LbBr39OwproWbHWn/tTHPeqH04Tj2s9CStxgGjo3L4M?=
 =?us-ascii?Q?j1lgpkuzY4TQzNSmTBncxQzPKiEH32VZl8mhsDTCnK/+qhJGSAgBObGxc0hs?=
 =?us-ascii?Q?WQRHY8aUp98QoPxRbpEumIbb/eG+rUsdcUl1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YesPFEyuAMD6MYxfrqY3l1ET8vqaaa7FdX5hSBycTCJ9hk1cBZJ64gKBS5vT?=
 =?us-ascii?Q?g0CmCyEA4erFMZLDHBu5tigedHGjc+UnH2Xty1gqpZIc1MiLLzoAPFMW+Ml+?=
 =?us-ascii?Q?OkHyqw2fsem0vW55Rb0DZjuSKZdOCHTSRWFFAYnACdeKAvP1CTk0+3Nz7q2/?=
 =?us-ascii?Q?/SwBV0GXBDo72nIFMuvOK3DqiaMvALHK/R/tsu/7R0Ndw+V45vyAkIVUkheO?=
 =?us-ascii?Q?jG8f4z7lv4ka1/oOM12CtLBkpqJEwrVJZlqUedC7sEb04f7O5IX2xrUXZlCr?=
 =?us-ascii?Q?7/gg4DeUgS3+2mEjWRaoNOAQyG/mVfyIgatyJKXx3FJEs4KBvAsEK7mEEp60?=
 =?us-ascii?Q?3i7DWuVXfUvJ2HmZGtQLW3fdJSLReA+hN9UiRfSsxPGpVHyg439Q6MldrhU9?=
 =?us-ascii?Q?hB7T50M6ZBxOMQVL1NJ0E4KzMdx7gmUdM/17NT6AAnCF6UqUN23WBgV1nyg1?=
 =?us-ascii?Q?jzXUP6Sr4H5+5BbiR3zXuNbTSLlDW2ixlF5dgsETPxv8/9vZ71md2jBLHjCs?=
 =?us-ascii?Q?A+gJy8H7NQ5aXkrL3Odu4sIjLUEI1sHAJQA0ZDmVsEn4FgdMrB9YgPFE8fiE?=
 =?us-ascii?Q?sJvb2ktzjL2njW6qkZfgZ4zbkykxP3TqqSPM1wypSsluB7QMVUL/+RSWbEzJ?=
 =?us-ascii?Q?sN53TbvKjYU6oiAndOKrJ7zcPRi3qTlBJmVQ1fNZYg/RuZtxNVKOP8m+48Uw?=
 =?us-ascii?Q?g1llTvLtUr6mxebYl26adcc9DZuh6wlNKKa2VOBwnittUUy/fwDFqQbGwPsM?=
 =?us-ascii?Q?ll5Yj9zhqWP4VS1qMGqsAeHp5RtF4dJDIWgBdR6+P2lBsUfoQxURtLGy66c3?=
 =?us-ascii?Q?hJFYhRqG6GaohG4e6Awzz2amx4D97quL4tMg+AGZBPkWYQD1fQQabSocw7VO?=
 =?us-ascii?Q?NXJzQPs6jB9zQrXwivLdm2OOEEbWozyOTPQK8hcWvxduy9fLIHlsZwtpKrJW?=
 =?us-ascii?Q?oUb0iU2n7Ry8fTN7aH6e2bFxE7KdKLLzjsbno2vOGI70h0OE2gkUnaSLvutY?=
 =?us-ascii?Q?Z7aY0Vrva6w41qykhfBmmnTU3IHo0sf23KDFeS5I7H450mbEhKRvYC1TGlCA?=
 =?us-ascii?Q?uIGFIp4B20uK67RrdgxinUiwy+tqZSBywgl29kECLwxPTd+HtD9vvL2pE7WP?=
 =?us-ascii?Q?2TOI4icmdesO02pW5pf/sgOzY8ITz9TstL0/e0VOXFqMctEUd7EBi7bfriFa?=
 =?us-ascii?Q?JXlT1Ke1p+C3uxgMPKKkaJ4kbfMle60W8hw9QRQlHYOxEKRmpDcUHLHIk9ur?=
 =?us-ascii?Q?ApRmcpEXFeR8ebvJOdEBF6myHVaHQdjpLfDfHwSPAbrKBROdYkcKB/KdnYp3?=
 =?us-ascii?Q?vkt1oqeZu6XluYNwJ7Zt9Uqrde2K/+jjxrx2eYZkdKo3yjZVjSuz2CkKI6Lc?=
 =?us-ascii?Q?gTgTp1hm2vgR+Z1yTWu1dxX0BEvCB3MjupifEoCynu9reNX5aO0jtdwnqvlq?=
 =?us-ascii?Q?MLU2TBgrDHwhqjpLZDET06uOjmIubmEaMI33HISEcEr0uDTLzVwJnD6SrukI?=
 =?us-ascii?Q?EjfqIYBW90H8hn+XGQJ27bAtvseNmR+xo8Lh8EPuRAXhn5MjwAQVglkMqiqG?=
 =?us-ascii?Q?NlixgEjcLKW9/3//pQDf12s4EoIFPd7Mpqq22Udf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1f5985-c572-4af8-a153-08de201dba7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 05:55:18.7784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y1+0DgvGje0BGSR3jvc2wo8kFF+ia+llrfwVicCFXDbxmiwwLozMDVxtLFGBpVxc+SfZTZ/+tS1K3qJrXCCUiiVBZ1EyRuogHvUuSB/E8lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
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

Hi Priyanka ,

> -----Original Message-----
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: 05 November 2025 07:35
> To: Girotra, Himanshu <himanshu.girotra@intel.com>; igt-
> dev@lists.freedesktop.org; Gandi, Ramadevi <ramadevi.gandi@intel.com>;
> Konieczny, Kamil <kamil.konieczny@intel.com>; Tahvanainen, Jari
> <jari.tahvanainen@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel: Adjust test documentation
>=20
>=20
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > himanshu.girotra@intel.com
> > Sent: 04 November 2025 11:28 PM
> > To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> > <ramadevi.gandi@intel.com>; Konieczny, Kamil
> > <kamil.konieczny@intel.com>; Tahvanainen, Jari
> > <jari.tahvanainen@intel.com>
> > Subject: [PATCH i-g-t] tests/intel: Adjust test documentation
> >
> > From: Himanshu Girotra <himanshu.girotra@intel.com>
> >
> > Change mega feature and sub-category for multigpu subtests and some
> > other legacy tests so that it can be fetched under correct Feature Buck=
et.
> >
> > Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> > ---
> >  tests/intel/xe_create.c          |  3 +-
> >  tests/intel/xe_eudebug.c         |  2 ++
> >  tests/intel/xe_exec_basic.c      |  9 ++++--
> >  tests/intel/xe_peer2peer.c       |  4 +--
> >  tests/intel/xe_query.c           | 55 ++++++++++++++++++++------------
> >  tests/intel/xe_sysfs_defaults.c  |  2 +-
> > tests/intel/xe_sysfs_scheduler.c |  2 +-
> >  7 files changed, 48 insertions(+), 29 deletions(-)
> >
> > diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c index
> > e8b8bb025..f0a3f737a 100644
> > --- a/tests/intel/xe_create.c
> > +++ b/tests/intel/xe_create.c
> > @@ -383,7 +383,8 @@ static void create_execqueues(int fd, enum
> > exec_queue_destroy ed,
> >   *              buffer sizes.
> >   *
> >   * SUBTEST: multigpu-create-massive-size
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Functionality: ioctl
> >   * Test category: functionality test
> >   * Feature: multigpu
> > diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> > 4a2c43635..f0d32f6f8 100644
> > --- a/tests/intel/xe_eudebug.c
> > +++ b/tests/intel/xe_eudebug.c
> > @@ -932,11 +932,13 @@ static void test_read_event(int fd)
> >   *	partial unbind, unbind and unbind all operations.
> >   *
> >   * SUBTEST: multigpu-basic-client
> > + * Mega feature: MultiGPU
> >   * Functionality: attach multiGPU
> >   * Description:
> >   *	Attach the debugger to process which opens and closes xe drm client
> > on all Xe devices.
> >   *
> >   * SUBTEST: multigpu-basic-client-many
> > + * Mega feature: MultiGPU
> >   * Functionality: attach multiGPU
> >   * Description:
> >   *	Simultaneously attach many debuggers to many processes on all Xe
> > devices.
> > diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> > index
> > f652ab6b2..79dace331 100644
> > --- a/tests/intel/xe_exec_basic.c
> > +++ b/tests/intel/xe_exec_basic.c
> > @@ -58,16 +58,19 @@
> >   *
> >   * SUBTEST: multigpu-once-%s
> >   * Description: Run %arg[1] test only once on multiGPU
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> Does sub-category really mandatory here? as mega feature is conveying sam=
e
> meaning, also, xe_eudebug multigpu tests doesn't have sub-category , ther=
e
> just mega feature has been added, then why no here also just mega feature=
 is
> not enough?

The subcategory might not make sense particularly in this case, but in gene=
ral, it makes sense overall for the IGT code. To maintain uniformity across=
 the codebase, we need to add something for multi-GPU test cases as well.

Regarding your second question: when the subcategory is not explicitly defi=
ned for each subtest, it is inherited from the base entry for the entire fi=
le. In this case, it is taken as:
Sub-category: EUdebug framework

> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-many-execqueues-many-vm-%s
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Run %arg[1] test on many exec_queues and many VMs on
> > multiGPU
> >   * Test category: stress test
> >   *
> >   * SUBTEST: multigpu-no-exec-%s
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Run no-exec %arg[1] test on multiGPU
> >   * Test category: functionality test
> >   *
> > diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
> > index
> > b777d2b66..c2b724a52 100644
> > --- a/tests/intel/xe_peer2peer.c
> > +++ b/tests/intel/xe_peer2peer.c
> > @@ -18,8 +18,8 @@
> >  /**
> >   * TEST: xe_peer2peer
> >   * Category: Core
> > - * Mega feature: General Core features
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Functionality: dma buf copy
> >   * Description: Peer2peer dma buf copy tests
> >   * Test category: xe
> > diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c index
> > 2de88fac9..d320f3ec1 100644
> > --- a/tests/intel/xe_query.c
> > +++ b/tests/intel/xe_query.c
> > @@ -184,7 +184,8 @@ const char *get_topo_name(int value)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-engines
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Display engine classes available for all Xe devices.
> >   * Test category: functionality test
> >   */
> > @@ -211,7 +212,8 @@ test_query_engines(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-mem-usage
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Display memory information for all Xe devices.
> >   * Test category: functionality test
> >   */
> > @@ -275,7 +277,8 @@ test_query_mem_regions(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-gt-list
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Display information about GT components for all Xe dev=
ices.
> >   * Test category: functionality test
> >   */
> > @@ -350,7 +353,8 @@ test_query_gt_list(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-topology
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Display topology information of GT for all Xe devices.
> >   * Test category: functionality test
> >   */
> > @@ -414,7 +418,8 @@ test_query_gt_topology(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-topology-l3-bank-mask
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Check the value of the l3 bank mask for all Xe devices=
.
> >   * Test category: functionality test
> >   */
> > @@ -486,7 +491,8 @@ test_query_gt_topology_l3_bank_mask(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-config
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Display config information for all Xe devices.
> >   * Test category: functionality test
> >   */
> > @@ -543,7 +549,8 @@ test_query_config(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-hwconfig
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Display hardware configuration for all Xe devices.
> >   * Test category: functionality test
> >   */
> > @@ -582,7 +589,8 @@ test_query_hwconfig(int fd)
> >   * Test category: negative test
> >   *
> >   * SUBTEST: multigpu-query-invalid-query
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Check query with invalid arguments for all Xe devices.
> >   * Test category: negative test
> >   */
> > @@ -605,7 +613,8 @@ test_query_invalid_query(int fd)
> >   * Test category: negative test
> >   *
> >   * SUBTEST: multigpu-query-invalid-size
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Check query with invalid size for all Xe devices.
> >   * Test category: negative test
> >   */
> > @@ -628,7 +637,8 @@ test_query_invalid_size(int fd)
> >   * Test category: negative test
> >   *
> >   * SUBTEST: multigpu-query-invalid-extension
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Description: Check query with invalid extension for all Xe devices.
> >   * Test category: negative test
> >   */
> > @@ -793,8 +803,8 @@ __engine_cycles(int fd, struct
> > drm_xe_engine_class_instance *hwe)
> >   * SUBTEST: multigpu-query-cs-cycles
> >   * Description: Query CPU-GPU timestamp correlation for all Xe devices=
.
> >   * Category: Core
> > - * Mega feature: General Core features
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   */
> >  static void test_query_engine_cycles(int fd)  { @@ -815,8 +825,8 @@
> > static void test_query_engine_cycles(int fd)
> >   * SUBTEST: multigpu-query-invalid-cs-cycles
> >   * Description: Check query with invalid arguments for all Xe devices.
> >   * Category: Core
> > - * Mega feature: General Core features
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   */
> >  static void test_engine_cycles_invalid(int fd)  { @@ -929,8 +939,8 @@
> > test_query_uc_fw_version(int fd, uint32_t uc_type)
> >   *
> >   * SUBTEST: multigpu-query-uc-fw-version-guc
> >   * Description: Display GuC firmware submission version for all Xe dev=
ices.
> > - * Mega feature: General Core features
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Test category: functionality test
> >   */
> >  static void
> > @@ -946,8 +956,8 @@ test_query_uc_fw_version_guc(int fd)
> >   *
> >   * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
> >   * Description: Check query with invalid arguments for all Xe devices.
> > - * Mega feature: General Core features
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Test category: functionality test
> >   */
> >  static void
> > @@ -996,7 +1006,8 @@ test_query_uc_fw_version_invalid_mbz(int fd)
> >   *
> >   * SUBTEST: multigpu-query-uc-fw-version-huc
> >   * Description: Display HuC firmware version for all Xe devices.
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Test category: functionality test
> >   */
> >  static void
> > @@ -1011,7 +1022,8 @@ test_query_uc_fw_version_huc(int fd)
> >   *
> >   * SUBTEST: multigpu-query-oa-units
> >   * Description: Display fields for OA unit query for all GPU devices
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   */
> >  static void test_query_oa_units(int fd)  { @@ -1063,7 +1075,8 @@
> > static void test_query_oa_units(int fd)
> >   *
> >   * SUBTEST: multigpu-query-pxp-status
> >   * Description: Display fields for PXP unit query for all Xe devices
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   */
> >  static void test_query_pxp_status(int fd)  { diff --git
> > a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
> > index
> > 393e56651..f21ae94e6 100644
> > --- a/tests/intel/xe_sysfs_defaults.c
> > +++ b/tests/intel/xe_sysfs_defaults.c
> > @@ -7,7 +7,7 @@
> >   * TEST: xe sysfs defaults
> >   * Description: check if the sysfs engine .defaults node has all value=
s.
> >   * Category: Core
> > - * Mega feature: SysMan
> > + * Mega feature: General Core features
> >   * Sub-category: SysMan tests
> >   * Functionality: sysman defaults
> >   * Test category: functionality test
> > diff --git a/tests/intel/xe_sysfs_scheduler.c
> > b/tests/intel/xe_sysfs_scheduler.c
> > index faafabd29..90d4ab8fd 100644
> > --- a/tests/intel/xe_sysfs_scheduler.c
> > +++ b/tests/intel/xe_sysfs_scheduler.c
> > @@ -6,7 +6,7 @@
> >  /**
> >   * TEST: xe sysfs scheduler
> >   * Category: Core
> > - * Mega feature: SysMan
> > + * Mega feature: General Core features
> >   * Sub-category: SysMan tests
> >   * Functionality: scheduler control interface
> >   *
> > --
> > 2.50.1

