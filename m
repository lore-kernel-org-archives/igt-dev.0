Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D876BC43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 03:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EED110E197;
	Tue, 14 Jul 2026 03:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jv/Rs9hq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBE210E197
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 03:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784001466; x=1815537466;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=huI7lbE4GeQPa6gGR2ZhiWoigZEgeNobt8QsQ3Xe7uM=;
 b=Jv/Rs9hqL1wBWqk7SD7AL1cbCdRAw5luyeTVY/mCrpuUcBOYmaXU6gYi
 xT1CJFJwxFb3SY2OJfegkf+fFcBNYuTrFg5PMZgy6PR5LX+l3aZIt8OLy
 R9dJkJDeNQDWKc6C97XS8TbHKwTyHeI+gTSQeGnmlwD+jTfM3NV1CCIi3
 UYajm98zwFk9MnPQIfhjylhLi3PfPqqEOn+JxUrordnWuHXf6jfw6SA9W
 7DiilO6wh0BYGci1ePu2x7vQDNWHVkxMUkwtrqgp1kqSNj7eL7Cg7XQXe
 g4jlk30LYrAW1p7uqD73aW9fa6Kq9YIXxaa//XG3oGQZ3ApzZ5EiosBxl g==;
X-CSE-ConnectionGUID: IqaEYGjnRsCmTX6G+Lm7Ug==
X-CSE-MsgGUID: 9i5xa+QHQumYN30FUu7b8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95982202"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95982202"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 20:57:46 -0700
X-CSE-ConnectionGUID: GsQOGeDaSYSkkmaLvaTrAQ==
X-CSE-MsgGUID: CVVEtv0UTG+4UgpWDM7osw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 20:57:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 20:57:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 20:57:46 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 20:57:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAHJU+Yf4jyx/Qb4Ckku5EmfrQunAm7kExIjvw0pEQscp6h4VTpkHAGVioGXfS6UUpJkfCbpbNfc9XbaBgsGr8fAhzUS3dNiA/l+OANZYT0JlFqeupAKoWB+myLTX+ZrQjpe85kGowmKBqwS2sKeYWqFHMVaxWckrcKoSdorgjKsImdDROTqleSxQcMJsAI0hyndimfhzUt8JfcM1EnUxaXARv3hbNS7uBwCHCYAnP/k1e1xf4xrAm1ZcfyOpBZ/ik5UKNxqiew9fVDjhhrGyXHgzC1bx2+7fVYZlTd7D+qFxPw4DqPBbW5S2JWsKmornG1F4Y9VZWtIlw0LCepGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLuv4bvqek6AJK+12SJVXvKp5smHrsnx7O56euJbBVc=;
 b=rRVtg9likT3ytrypywpkgpIqCT5hjOOOveNx/zCIMHLJpV4KtqoyM37lbdZD/6yR+ejqxxHktViXiVIf8RNda3P9FlxtrTXr+KlthCZ+a+NkV1Rv7A8Czrm9kXT1YrXZvLLvaXuoXmtaIE9jZk84F/wrBQe77zIT2T9OO3kaxpm+r2VR+9EQCs3mEWoiUsBhPQduECcG2DIfqD7r5JBC8sTBNjPAmN0RhJNn/ToDjiTen0AwUJVVFBlZnU5k7EGlK+qlbvdXwwhFTsTJH/whHzxDyXX7ChxJ7IbQYQJjBkCsCkDeGLI6NCc5I7BsAe4m4ymK9+FgvW0EPpX0rzUFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 03:57:35 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 03:57:35 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_force_connector_basic: re-baseline
 connection state before comparing
Thread-Topic: [PATCH i-g-t v2] tests/kms_force_connector_basic: re-baseline
 connection state before comparing
Thread-Index: AQHdEq4xWKjnz2Hn1067l+HVgNu/OLZsZEfQ
Date: Tue, 14 Jul 2026 03:57:34 +0000
Message-ID: <PH7PR11MB6796CCB0C33818710369C2B4E5F92@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260713080227.3989038-1-suraj.kandpal@intel.com>
 <20260713095819.4020111-1-suraj.kandpal@intel.com>
In-Reply-To: <20260713095819.4020111-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SJ1PR11MB6179:EE_
x-ms-office365-filtering-correlation-id: f188ac58-8e29-4a7a-0d64-08dee15c09bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|10070799003|366016|18002099003|56012099006|22082099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: sTkBpjU34vMMF1eFc4VMsVzT84lU4XZpscnwhZuL6GXLH2Hfc/Zu80ucJqwuqvC6Lr19eLYlIPpko8u+ulqAaGonneI49Iti7g2JnE1UDMDzQlNDMyaQUodklalnZdJRdw0lVcr1CxHrvzcOgZy5THuMW7Lrj/eIb0+sSsRf+nB7mz2SxfRfRM5EchKbprApmJv7g/WYlHBSmxbAmr54/3AZG49HnPw0mUacw62H2NUYdx3ogVlkldlAU9I/jn6OjZaZdrrDhQOUFHTCPOUTN+3Bth+j7M4Hay1wjN6tWJwVa2aginRjo9X3oszvxeBYEIigIsqPwQaNAmf10/QFUJilOAnqwDc//vet3ypXBSiLV3u0pC3qTcMug2mUDi8l1a9fj5EeTkpQP2ABeEgLcItujZJHhWzb2eHS8sgRaNQDrwHVbLh6hPPTxClZKKCCEv9zC6Wf1rD60wIitz7QhxKjwKML5p337diYVcYKtuV8GvsDBZMN57+vR03JyStwBBlrvtiWZizGtTYN3GWgvXPJUpw8cKQ1pK/0FCxfBhr/Zm5qyCXZRkycvzxJ0FdUCy0XvP/undt763YfgOXFBQvqCamn90ezemcfmeIrofBngZE/rRPsjOpaa9htAMuqPr8ze40QJ/esGhp/Zhy/VqIqWtfS7w9XsdZSL/qB4mOzlUo2UMlj8A7mV6IGhH3mw440vnmo/yeB8cYiVXN0Ana9i8A3ZTve/VibHOAH/SU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(10070799003)(366016)(18002099003)(56012099006)(22082099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vR4lefg7pi+8onOulpxMmxsXQeVtqs58WvWfzmValwj5ExW3Y1WBFKPVlIbA?=
 =?us-ascii?Q?tpvQ4XX4/+yu2WZyPOyxgRTUhuRFSTB6/SYdnw6bKm2NV/EGTktnHSFHA7Of?=
 =?us-ascii?Q?twwjGtUh+gDHiGqzZNLxLWyafiNT4A5c2jRq8y5ZW0xvISS823S4vBImMBQP?=
 =?us-ascii?Q?f8UHoN3mc1oemwivdJcBjMbMGDWVnaLyoKI0vrKlxy7/CUfDg1waWOlvhc8s?=
 =?us-ascii?Q?lfQLrta3E1EP7MlH78bHfqY11VpMypIpg23ttY0QODY8OWz86PxYbsK4qJhj?=
 =?us-ascii?Q?n1McXi1dqxXCn0ktnKSYPnszE+rVP+XWtWcFVn6K1BludxtGoCgmZFU8C5is?=
 =?us-ascii?Q?wElx/v1HmnRSzxsaDOGmXzepxybfNm9t1l42osiVBTRQp2chkFaQu4IZPEvg?=
 =?us-ascii?Q?AuNXEXykdc08opY3h0AoD5lQqZfJP14qCfeyFYpBkBSJUaKGtKNlYFzJioIV?=
 =?us-ascii?Q?iJL2mtpBbpca8R5ed5w/xP6xTj18onuELhj2cNK7lrt1mdRVdzNFs2Q5xt6x?=
 =?us-ascii?Q?qnUG8sQtr8ZeW+GN15Zfy96zHqJH77p7LJRFUnRpZllRL4IR6sJ/xuCAkOae?=
 =?us-ascii?Q?NIOTYF5FOW8A5b3f+mHwhzjho9PAwd8mFUtximZJX/rCfdmxT/VJb0ghYz+O?=
 =?us-ascii?Q?CM7kdci6rcWTG9KqcGIn7ek3UzhYmbA9Oi1X5Y4pw4N/qV2CyPOH7pGURHuw?=
 =?us-ascii?Q?FyVORfA0d0MthR81k0O2+HjhRVvGklK8VkTdE1GOsOafq2xLbI6o17oxauza?=
 =?us-ascii?Q?PSbBu8IcGT5vZn7Kw5RQbVkl62jaeIjFK0D6wzyuxaYAYSZotpzFZ3vEp/jL?=
 =?us-ascii?Q?zYzHz5FgcWFk8rr3xp2hQHqV5zyka5mXlCNXptSx2RnacfGfis722gL+RgLD?=
 =?us-ascii?Q?KqL9ZLroszLOnPrNfTye8+j1QsKtBQXWod8V3XBIq1oFNTsYNubPo70Vzgix?=
 =?us-ascii?Q?BcPeDm06YX+Q+FkNQolfGoylynlWKN03VyIpfjGiPNOBgKM2Wk4vLuUhbNGc?=
 =?us-ascii?Q?vvh/HqXtkCEutHYd5tVgQJdO6+aMEdVUtNGhJtkZF/c0Z/1YWC825URaFW/h?=
 =?us-ascii?Q?akYF88qobpw+NhYQ8R554xitujkRXugMPpt47NQkMAZUwiBgJDoiS/+/fiVN?=
 =?us-ascii?Q?o7r1XDQ4Ui1t9bCQdl4PntUkTFJGORhI3QondQQ83CP+HAFDUZ/xqJIYH0Py?=
 =?us-ascii?Q?KfsZIGkPSjMnenobMAXqhc5IPQUGjvL0nG8Qdb9zaSH7eLNGT27VpVyJuXrg?=
 =?us-ascii?Q?Ssw51pcHxBcDHD+fF6lJUSscXrUDfB4zR46sLF1SHFTMrzi6nKft/XS0iCxG?=
 =?us-ascii?Q?hWjYB4XPBkyWa4aR8/WSqEDnKT610I/PCsNGJAG5I+0iLKu2/VwMzSiMv+Rd?=
 =?us-ascii?Q?7XTpdeKA6R4JlQv0VGlmPb05uhPmZTjLe9m8z4IZSFezfl4N0eqdcZgWwcjZ?=
 =?us-ascii?Q?+hAEGdnEkH/XHOf6qMakxlVbx8pLxkmna3jKqdHtRbjucR60OJOHfuhjXbbh?=
 =?us-ascii?Q?iUV3UzXtuj1iirRSjDhyFr3gqurcePLBYNAvevz6AlxX1XveCqTyrGND+BsI?=
 =?us-ascii?Q?8XdTermuy9pui3c5mScmbH+M2J5Rp1DE1lGwdI2YAvIwqOEjVE9l3Z/+/KY5?=
 =?us-ascii?Q?h799EMIteknRFmBKNubpg+rsqa1k4UPkJRnJslWfb56KlYgzfudc9PXVQz8j?=
 =?us-ascii?Q?cCRmTWlH2/vItZnAg78cl+ZCJai9EHRiGh+vG4jNT1FOcI9Igq0kCcI+LVJ6?=
 =?us-ascii?Q?p72q+n/76+n9QtlMp3VSDzK+DGhA6Z0qzemT6jPrATdgwznAa6BT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RjKQtu4k4Da9q0Wokfa8Rt8f6gzYg0JZmZ9XE93SgZP2wd+EQdVTk5Uiqa94jJMG3qo/VvmZm22qrPu009FxoOJQI9P1Jhr5rDDwU5IW20t0djnrfTYo54oUmB31ibwAqP+MQr2TQIrUUgaXSBh23P9lUgrY9+HWjkFUpXBi1Zw82F8BtxGDMAqbeXZEGhVQXDNByJ6DEFaeXMHndyf3q8NbwRKT4r6kLBSNgbDmqo+dd8CnQPrCiQXDi1o0gXYoEIVKnRDR6jpxii3ioVSKZ4A5+gJ6NaqriWzXAXv7x/ENyZoZrTbS0+D2a/13tDR0tGF3iehdcmKurcGD8/hg3g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f188ac58-8e29-4a7a-0d64-08dee15c09bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 03:57:34.9582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WIIATUVWyhIsJEUpcL/i/pSCvbX29nkgSXgjjpmXR+IkVqc5z5i/tEioyEK61ytvK3MeRh+Mu0Ay20im7kymQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 13 July 2026 15:28
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; S, Sowmiya
> <sowmiya.s@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal,
> Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_force_connector_basic: re-baseline
> connection state before comparing
>=20
> force_connector_state compares the end-of-subtest connection state agains=
t a
> snapshot taken once in igt_fixture(). That snapshot can be stale (e.g. ad=
aptor
> still initializing, HPD disturbed by earlier power transitions) or reflec=
t a leftover
> force flag from a previous subtest or from igt_handle_spurious_hpd(), cau=
sing
> spurious failures.
>=20
> Take a fresh baseline inside the subtest, after clearing any leftover for=
ce with
> FORCE_CONNECTOR_UNSPECIFIED, and compare against that.
>=20
> Assisted-by: GitHub Copilot:Claude Opus 4.7
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>

> ---
>  tests/kms_force_connector_basic.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_force_connector_basic.c
> b/tests/kms_force_connector_basic.c
> index 4ea6b0e8c..c4252ea02 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -177,7 +177,7 @@ static void force_load_detect(int drm_fd,
> drmModeConnectorPtr connector, drmMode  static void
> force_connector_state(int drm_fd, drmModeConnectorPtr connector)  {
>  	igt_display_t display;
> -	drmModeConnector *temp;
> +	drmModeConnector *baseline, *temp;
>=20
>  	igt_display_require(&display, drm_fd);
>=20
> @@ -185,6 +185,10 @@ static void force_connector_state(int drm_fd,
> drmModeConnectorPtr connector)
>  	igt_display_reset(&display);
>  	igt_display_commit(&display);
>=20
> +	kmstest_force_connector(drm_fd, connector,
> FORCE_CONNECTOR_UNSPECIFIED);
> +	baseline =3D drmModeGetConnector(drm_fd, connector->connector_id);
> +	igt_assert(baseline);
> +
>  	/* Force the connector on and check the reported values. */
>  	kmstest_force_connector(drm_fd, connector,
> FORCE_CONNECTOR_ON);
>  	temp =3D drmModeGetConnectorCurrent(drm_fd,
> @@ -207,9 +211,10 @@ static void force_connector_state(int drm_fd,
> drmModeConnectorPtr connector)
>  				FORCE_CONNECTOR_UNSPECIFIED);
>  	temp =3D drmModeGetConnectorCurrent(drm_fd,
>  					  connector->connector_id);
> -	igt_assert_eq(temp->connection, connector->connection);
> +	igt_assert_eq(temp->connection, baseline->connection);
>  	drmModeFreeConnector(temp);
>=20
> +	drmModeFreeConnector(baseline);
>  	igt_display_fini(&display);
>  }
>=20
> --
> 2.34.1

