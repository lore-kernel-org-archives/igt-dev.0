Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93403C83F27
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 05:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E41E10E257;
	Wed, 16 Jul 2025 05:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzDwTBzv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97F710E257
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 05:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752643085; x=1784179085;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h4YPOZ37w/GIlNXyFheetb9yZzNMW6t1O2AwwwsAXlY=;
 b=XzDwTBzvbLTPyFpma8xpEKlpE0H9CYpkUdS1TxAOCE8LmZGvVGztoPd2
 eIhqaFxQSAwK9rO97uR7AzmKie4t5JPAiNJG7TY1frkRz9MsK6DpX2N5C
 KEKGY+nKpHVm7K+PaYxnR30WrfcnMtyq9R91Ntk5HFWVgPAGKi56oh5VY
 /K2XPOSAooZCLH5igsm1O+6HQFvogGRIAZTx6pe0OHLJW5/OubYA7jPjF
 60QpJNeK+mkqocecvbn8evRuPACG4L6+d+dKl4oMO7T7qbUhlpNt1DoJ4
 FCl7xfy0CELTAYIe1/s+4ADGdqmaSjdxVUI5jDzUtnnw4dtqGJxLaHWIh g==;
X-CSE-ConnectionGUID: lVjc2Ju0TM2S5isdJoP9HQ==
X-CSE-MsgGUID: gUoNDaEXRduEJC1+xY9sBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65137340"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="65137340"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 22:18:05 -0700
X-CSE-ConnectionGUID: h+3Ck5IJRrq4SIlAAmZo+Q==
X-CSE-MsgGUID: Hn61R+iSRWa6q2uPTlKqaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="181095333"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 22:18:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 22:18:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 22:18:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.81) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 22:18:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xy8qt41NQhup8D5g2CGH6oMVKp8gQmqEb1fCmowdTgqr7G+c1aAHudIXyHCYyOht8DOuM9/ACD+G7Y7z+9IOpUmoMS49O5YkhmJfc9QsdG3z2Pj5nozokVfEGmFuhuaW2K8UR95esOyBXVRmaMsPv0Jn5YpvrBZART0ex3AKXX+iDqxwZ3M7dCvW+sy2tiLLxr+kCJ4fb5PmXJLGhSnXPdo5rCqG4tD+TGUdigFpQPeJY4UKFrCwSBkKsRXwo6xSQx7VeMBWyStzRLCYfop/qlB0uhO1/EjOGxx1Paz1HeO6pKOLUpkFbhrzoi+OuFHETBkZsYZeAhpw8WnYKEAXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RytecmC9dOlGbWaQDQEaI+Ek3IIZWaSOwa+R82a0D4=;
 b=e6ram6IK1YXzm9dBgtf6F/yr+5GCqBb7J4ssoiY2V7kDglXLMcoQUKb6IKoI+uNd5VNWlb0Ea2xAc2LXjLkKzhKpW6jYqAgDpInJfTBjlFrTuwq6hITpGYbs9qoU1mbc02kYHhnOiEzOlVCic11baDtYEuE6t3M7WARnqCVQy+l+lwdgdWQOA8uATkfPDmO2Cc8WnI6ZbbUvuD1w1zNtIq9s916diO1iOLNaXcCkg6gjDv6/lbFt2CPwvIzjxmsCJADTvQ3qr0CLNAU63KEQOCSXY0nsH5N58iXfNcjngvOCD6dBDne6LNbaNfj1j22ANqZyfMMvPvfi6J0ASOKw+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Wed, 16 Jul
 2025 05:17:47 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 05:17:47 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_async_flips: Replace hard coded modifiers
 with async modifiers
Thread-Topic: [PATCH i-g-t] tests/kms_async_flips: Replace hard coded
 modifiers with async modifiers
Thread-Index: AQHb9aAGeu1jkv7t0kCtyhEjV39vvrQ0NVeg
Date: Wed, 16 Jul 2025 05:17:47 +0000
Message-ID: <IA0PR11MB7307AA7E554A4BA5D5DC37D0BA56A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250715154827.318741-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250715154827.318741-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CH3PR11MB7322:EE_
x-ms-office365-filtering-correlation-id: b7df4b06-ce8e-4e7c-dea1-08ddc4281a70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?V4ub9Ksfw1tkm1y1guNUkaGvIGyjWjN9+kR0f+YAbtcOICICrgBBPitFLUtj?=
 =?us-ascii?Q?F1WZgjJ3JRxE3d/CnGzF9wG+ZihfvcMyaqyA+kK9fJl+wu37o2aBhxdg7jkT?=
 =?us-ascii?Q?m0KkRvP3PWCJs+A0iiw3ol4O023w4tshnqqkPpW3LF9R7de2VwVp6ysqCvdc?=
 =?us-ascii?Q?Mi2OqFoUpSEEZeHA9TWCXFWZ4ksL/n5Cp4HrxISeuA6fhrCqZjDLBEy4MfVW?=
 =?us-ascii?Q?LtZv3n01iYJMI52wPjUgI3rDTZ72wBcKVwf512cPMaV5JdXkwDlMR51oM8Le?=
 =?us-ascii?Q?LxEBSJ57UYoAdm0A8WpKlI33lFz2kOC/97SdZLXJ3vAFMAPvdNYKzfCnxcQ7?=
 =?us-ascii?Q?4/CuHUn5x+sSnjlpV4pjgyV8g5bjUk9yyQda84nzlo8pzA4iuroSBo2eRA0O?=
 =?us-ascii?Q?7uCb0/TFbSIjkpB60hKbe7kP/LIPvNyPORea45pwdgn4VCF5O3BitUwsBiXx?=
 =?us-ascii?Q?I0jhZiSeT3PeJ/ZLQDV6ORpbK7SP9ixsB0FvsMtI//2QG3B4bPfuBytFyEIE?=
 =?us-ascii?Q?Ac18wyXw0M6CLwyk/J+5/xLI5GMjmP9JI0kdnxIlJnhbjUdo2N37FIpGb/uO?=
 =?us-ascii?Q?NDGeMHQt5j7E1VHqutEnCc9YGV3ZYNGej6nj3kpSVbYwFtyzV1w/cCKs073/?=
 =?us-ascii?Q?v5FQFdhrDRqHjzpERxF1W7DrGEUlFNiCb8ciGJI7vGbhpdR2ct5U08vYKMhU?=
 =?us-ascii?Q?HvR5tX0pxxqHQzqnF3QPuNKgRLzVsxYjvWDHQWhs+SLvtm2SV16PyyIbm7pC?=
 =?us-ascii?Q?2P3u6knMRlpnqFDLPix9voNpWe/HrDGPwCNQP+lZyJMhRouXK2R3JAh/b0xY?=
 =?us-ascii?Q?QjGcUPLGsqizzcxShE5+AYFc5phZqx/zkpwzm9Bjjzc8U31u+sIZlhqk9HA6?=
 =?us-ascii?Q?QiNys3IYmJI60+Ce7M1FyF6W3RV4E8QJZMfLMfy6pG5t13gJgRtbSec4tiOb?=
 =?us-ascii?Q?wYRKUMPasGPIceM6uz+x0Sa1VmF+0BgYfgT33RtAPAgMSKJ9ny9efIHfv4yQ?=
 =?us-ascii?Q?gqHpHFDvKGVaAj4xxH5a9HLfd+4tGopx+tSX0pMVkf2MtDhqutI4KUmZQfvP?=
 =?us-ascii?Q?zm/tVE00FwOHQEyABDHjq0zgsSllvCoIVVWuYUrk6VlhEiMB4b0Qmie6WIi0?=
 =?us-ascii?Q?UTMeAfZidhTGqrcJaBarlTfqOmAbaqzvlyi6ClTYshArW1HKO2toilipQtjY?=
 =?us-ascii?Q?l4Sv8Ex4cK7tvWzmLgRK0mKXm1xNcOXULG7Eep4uALL/8b0eNzYCj+2wbv0/?=
 =?us-ascii?Q?CDyJxNhM8HC3/o27Ur/NXbbnE2zIX3tpn7c65c4KC5gpDkWTkcc34TpaCz2d?=
 =?us-ascii?Q?yoEh0xC25PnvnK6U7BH9qjx7eztCPllUXEaVbQvusIGP595U+XGCFGHVbCja?=
 =?us-ascii?Q?pZU9O/2ZSeA6WdXsOFlmzaRpbKWE55uDTbVo9ZcJ/FgAfW6IelfkMsFgTLdL?=
 =?us-ascii?Q?Fww98wmwNyc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ube2KHJvRh27dHj/9wVvW/skegpbkUdSRTBcOgUzGsOLYkmAxd1NXHOYRIHr?=
 =?us-ascii?Q?uYJdnf+v9wrnY1CTvV4e7pm0KB8IOPOvLwEtrhtfklqTMR90DUbDHXGtLA+0?=
 =?us-ascii?Q?2vV7+J0jvcX9Px4Px076Ky/4gWtI0w9n82OFswDSlJEpagsS40VXpspbUfqN?=
 =?us-ascii?Q?7AybHxmR+AGnvO1XhoZedDDDk/PZpVQ6ucahFLIQxVQfUC03qoHJPIcwm9RT?=
 =?us-ascii?Q?pI18sOEA0sSLm9Sw7+DGreujqaDacH6wH5hFBBfvPNxbY1fAG74Wo2rhEIGx?=
 =?us-ascii?Q?FOxux3qDzq363yMsZfUwlQiqXqNZL0EhKnvQM1zCQH79M2new3LxpE1bqGf8?=
 =?us-ascii?Q?GeQYiYLmvVszmcQgnpRCQDxheA6IgQQQXwYNnTv9Ip3dkU5Rka1uh1xYxW4w?=
 =?us-ascii?Q?gnJWi9UEAgOkuNdfPp+CHLfVrcxchKLd0sUckwwN/HNesxU5k4tIi/mj9qG4?=
 =?us-ascii?Q?DiNVlaRJPAfTlETAh1yU5hFV2WOvdQXATSVgJUNRr8/f2EwdCAJ4CPptSWlC?=
 =?us-ascii?Q?dSQ7uCU2qAyyX29gutk78NYtMeleQT454WxphhMKLMs0MFPpqMavlsR5ptHD?=
 =?us-ascii?Q?tVpFcvI2pBw/qnhhiuohtWZOnyDinnCfwKdv769dw/jQ4GgqW5amBh6lkPtd?=
 =?us-ascii?Q?nzC3aVkuJYoUKuppsnSQ3wv6QjE+Gt0zrAkeHGqSYf6oGGg9UuhvxKHY3z9l?=
 =?us-ascii?Q?f9E4kzy5F/3XWpu1wL5cXxL+pJuMGOkJwMpszYDVx1OdSinsvQZ3I/lUVZyd?=
 =?us-ascii?Q?tJc98Mg5D83VvH7UI7fDQKc5cca9J2Jzw5DKLIwlgt2WGLMk0DSF5VExYOrh?=
 =?us-ascii?Q?NegXQRC6K9OhB2WFy/fERZRmXmfj2nqhwtBWTVTwhQ4QNZptUkgLbqvgXdF5?=
 =?us-ascii?Q?HA1cb5vtIF8Kgq1ZpVbwAWbmgCo9gIlgjEUhEsOL54+TfGcbVkzgXJ91c9F6?=
 =?us-ascii?Q?JEMm0g7c9XdblIyMsoH6q5yyE1utW66aBygqxG4IWsedAfI7uDfaKNxl73uV?=
 =?us-ascii?Q?K8BsGre4gltnuXZvI1zNs1IhWvHqlFfRTXZWzzYZlB8X59htoYDhE6BeZ0X3?=
 =?us-ascii?Q?RilK4wVM9iEpxFOqAZfCY7RZgy0teWwKPma0529/cQtnXBWaxHqybY/vRZ/x?=
 =?us-ascii?Q?4dBEahta99TGHN4CuytZXF0+AMMV1Gweci6wydGc4JDyts/0SyGPZj9bDui/?=
 =?us-ascii?Q?wUHLrrx0H3HlzsnKRP141GfLaB4miuAvF6UY9FJ5+W1YI+1bEuLjNr74D/a2?=
 =?us-ascii?Q?3mAVVaCdKa4zAiV22csBWHbR2wyTatAO3WW1CtvLy4wm/g7edXIJ1Cn7HwdZ?=
 =?us-ascii?Q?Rz+21ep5ZztBd0VQSFvH7Lcdhn51GoJPfJg9JKwCF+6uK1K5yuwvJCeChJYq?=
 =?us-ascii?Q?K0zZW8DxqfdIwYZaTvSLMdxbZxr56ptNgojhXqA1NC49YgsJaT6tkb1wDwQB?=
 =?us-ascii?Q?TLURgJV2VXNB0tXyzDREJ+Q/qHtGqOYv2PkZiLg2/yeAbj82pXjhR5DCeYiB?=
 =?us-ascii?Q?xjdBnfs2ggbyHQIo6ZK393gxVkYyeKhxEBI5TfXtoyUq7nhhBUfM2SQ0RfzO?=
 =?us-ascii?Q?SBLeZz+cet2US5Rc2qEyvnbEz0w89hT1rObuZj8g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7df4b06-ce8e-4e7c-dea1-08ddc4281a70
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 05:17:47.7215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AhK/EF1wezIHmXEWJdd3jCMjf5U7eUulcPoI11iUkasP2xwcSHX1OyahaAHnzOPD47goVm4L5nHdEZsYk+wPcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7322
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

> -----Original Message-----
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Tuesday, July 15, 2025 9:18 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t] tests/kms_async_flips: Replace hard coded modifier=
s with
> async modifiers
>=20
> Use the IN_FORMATS_ASYNC uAPI to get the list of async supported modifier=
s.
> select the 2 unique modifiers from this list to test invalid async test, =
removing
> the hard coded dependency across platforms.
>=20
> closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3768
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 35 ++++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> ddac904ce..ed95ffc96 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -598,6 +598,7 @@ static void test_invalid(data_t *data)
>  	struct igt_fb fb[2];
>  	drmModeModeInfo *mode;
>  	int flags;
> +	uint64_t mod1, mod2, found;
>=20
>  	igt_display_commit2(&data->display, data->display.is_atomic ?
> COMMIT_ATOMIC : COMMIT_LEGACY);
>=20
> @@ -607,10 +608,35 @@ static void test_invalid(data_t *data)
>=20
>  	flags =3D DRM_MODE_PAGE_FLIP_ASYNC |
> DRM_MODE_PAGE_FLIP_EVENT;
>=20
> +	/*
> +	 * TODO: As the async supported modifiers are currently duplicated in
> the list,
> +	 * the below approach is chosen to find unique modifiers.
> +	 * Get the first two supported async modifiers for the current plane.
> +	 */
> +	mod1 =3D 0;
> +	mod2 =3D 0;
> +	found =3D 0;
> +	for (int i =3D 0; i < data->plane->async_format_mod_count && found < 2;
> i++) {
Can the IN_FORMATS list be fetched to find out the format that is not prese=
nt in IN_FORMAT_ASYNC and use them for invalid test?

Thanks and Regards,
Arun R Murthy
-------------------
> +		uint64_t mod =3D data->plane->async_modifiers[i];
> +
> +		if (mod1 =3D=3D 0) {
> +			mod1 =3D mod;
> +			found =3D 1;
> +		} else if (mod !=3D mod1) {
> +			mod2 =3D mod;
> +			found =3D 2;
> +			break;
> +		}
> +	}
> +
> +	igt_require_f(found =3D=3D 2, "Need at least two distinct async modifie=
rs
> +for this test\n");
> +
> +	igt_debug("mod1 =3D %s, mod2 =3D %s\n", igt_fb_modifier_name(mod1),
> +igt_fb_modifier_name(mod2));
> +
>  	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -		      I915_FORMAT_MOD_X_TILED, &fb[0]);
> +		      mod1, &fb[0]);
>  	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -		      I915_FORMAT_MOD_Y_TILED, &fb[1]);
> +		      mod2, &fb[1]);
>=20
>  	igt_plane_set_fb(data->plane, &fb[0]);
>  	igt_display_commit2(&data->display, data->display.is_atomic ?
> COMMIT_ATOMIC : COMMIT_LEGACY); @@ -1113,11 +1139,6 @@ igt_main
>  		test_init_ops(&data);
>  		/* TODO: support more vendors */
>  		igt_require(is_intel_device(data.drm_fd));
> -		igt_require(igt_display_has_format_mod(&data.display,
> DRM_FORMAT_XRGB8888,
> -
> I915_FORMAT_MOD_X_TILED));
> -		igt_require(igt_display_has_format_mod(&data.display,
> DRM_FORMAT_XRGB8888,
> -
> I915_FORMAT_MOD_Y_TILED));
> -
>  		run_test(&data, test_invalid);
>  	}
>=20
> --
> 2.34.1

