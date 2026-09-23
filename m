Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF6AC9830C
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 14:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D92C10E8E7;
	Wed, 23 Sep 2026 14:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gg9rsnKm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0FF10F080
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790172056; x=1821708056;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=J1noE3iR/WTwd7JI1658a3Yn+UGZSXBXXd1G5Vp329M=;
 b=Gg9rsnKmG7kFmIr+X9luFmgjoPg/seyx8V1ResBcL6rC+gaf3n1mI5q8
 0v1bB7hJzPnlS9htBh+Yj9HMFGdoEeL1S0yFrFPKtYcotky7Du6JCLn4+
 xhjNuL8t7F6+s0Ou6SjUp90VA7GF8tHoDDlrqKtxxRAMEUaU+om8HguGw
 xaHQ+y+YLzsKVu5lJCpdehF9NwvX+UHPNGRsYsGuJ9n8mSG5ev7je5YYY
 5F2GH1I27GO1SD0QXdam5RSBGBno5MhOfXpiMCl4orpMCl3UOM5Z6m/ZK
 XdUn4Pqj81qVOHAhbWO+my1ozHD/FTztFCCXWzIAqRKoTwKY9l+Br+W3F Q==;
X-CSE-ConnectionGUID: +G4TffHwQqeusadHb+awcg==
X-CSE-MsgGUID: yPAB0IJuQ2udo31cTNZ68Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90002326"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90002326"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 07:00:56 -0700
X-CSE-ConnectionGUID: XsqbkKR4T2KBGNjOKdssdQ==
X-CSE-MsgGUID: w23iQuIeTVCAB9n6N5HxDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="272236673"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 07:00:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 07:00:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 07:00:55 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 07:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNjPeVrQl4RedDgNF5g1+lyIlYHty3MYusExPC0NarKzdahG3L7t9C/Wv6J9hjdb48wSJgnQKLkzwa3kJY19a8vWdV6nZCKhfIrVllgud3Mw1oe640lmoGTMi/3yJ0Z1+ho3sCggiT3Zj0yEAk1thlNjYATcTKDIBvGCCYwIcU5EX2ptg0RbGaiFRcgHpAHmeeOYAZJROV4EKtGt5HZ3Mn3id5awi1/1aG3IHjIB7R04cXgqOYQxsrTFkO0jUsOiNyVO4XQmGpxaAMTdaOZ6C1LP0xayk4njbZjPajTAvB6uz53nalJgbXyvkg0QDKlHGOHPWEs8gOCfOnue5h82Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t582YscvwxMsE7KAFbuOuscWxqvgEIaZHJErL5GXjAg=;
 b=h9xVbbrjdWJ2oNBi/GOt65n+MTDaQddXqunYu12P/rqYC2DZU5QC3coI+0U1YXsf4MP1Ms07NDahVF9F7/mrIgIW1SxjAvLesQxLGk4z8mGLGhF0Pwt2HLyIcszJ3ngX5ko73umr56tBWiDHj52Hyt4A3zM5RWNWafonOcIXP7VpxQ4ARkAfdyE9mug1Gk5oO70cWU4k2HLCfKsaAsAbJyOEKQ6auvv/zQI5GA54P3dcKX8RBKrEAtDk1QbFyWrsGTBO36rMf2Jh5R1FVMDHkqbq0aT5wnwIkxSu9dhQqRBON0o5FOj+s7DgbkJRa3LebnL3uOpMPIw+4pk/gWtd9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 14:00:53 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 14:00:53 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 13/13] tests/intel/kms_dp_link_training: Verify the
 trained link from the sink side
Thread-Topic: [PATCH i-g-t 13/13] tests/intel/kms_dp_link_training: Verify the
 trained link from the sink side
Thread-Index: AQHdRZRnljf/AZiXfEKHJ4a+prIhr7bcPI7A
Date: Wed, 23 Sep 2026 14:00:52 +0000
Message-ID: <PH7PR11MB6796F0D325933E5FCEBA8B76E5822@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-14-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-14-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|LV3PR11MB8696:EE_
x-ms-office365-filtering-correlation-id: 04288334-b8f1-47aa-3a2f-08df197b14c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|5023799004|11063799006|4143699003|6133799003|10067099003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: H4UerxInAHkMWn3j1R3GTe9HVq75Lva8shgEBnk0qxSsmrkQM7OqbYi7B9Lic6Let3SCbciiOAgJZVblBUMkyNi9mk1NsDYpnpRHh2032XOrLOYbUFaShYa4mq+lNmVaQv7WMldDDKG8phDLGsEOpsJt5h6lCkmGt1ZvM6Bj3DwL3CxwGQSJq766rBYTW3aEwP35uHF3gnh/1P6bobxefEI4CMKqLwZvr9t/pGwMvrRzXJ5nyRK/HLM5GMm55whKSDgp7DHiFJOX7gzP+8tBZRUXQcLY42OKe/iXzhPKznp+QYHVBvLhWgczF5En7m+QMLXEhgcbxVzqUTnpxumGADacQ4ESK9qPdaU5bHoc2iLPU+S2FfWhaYrWFlock9bWrNB8hk2e9iI25iW5eczrpxk1LbzfQIynUn+MVad1Y4ImUFDrZAIYRmjnW5QLOg6Pp/tIifxhaADSwqnW/L6d+8wrZW+UNQpshMAKKh9xXHKgwzd/6JQbuc/Wvp7LuJBBmgTDHsFo4xUew0ZAq9lA9ZsAt5xjpVQXOz6Dcyhq9iaTtehG6N/8km2FjTsux0KJ2+09F+ouc9t80YyA6bENjBTlcS53JUND6oWyUjUAyCa8rcBnK8kWgHvaK5le8Ekk5SXT9FrA2UV/ZaxjIa5Zh6T7HG1E/oj5vw93WKvyJjxCh7EKKE7WVO5k31a0vtcI7vvEUufD8uU9B+oN62K+DKKB9QieW4SCUevbKnum56U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(5023799004)(11063799006)(4143699003)(6133799003)(10067099003)(3023799007)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?npr2Kacp2GcJSowFyZEYKQacgIl+TZ4jEqPTXAWFyW3uhuQu5WRgprpEe+GO?=
 =?us-ascii?Q?MRAawQLQQVVKB/4FJJTqt4oQtdR6n1vSQWAakKwm3w0YD6JigI3ESVY5Hq21?=
 =?us-ascii?Q?+RGeDsAkKK6sjqimjBkK8fDUxM+dkq2gt8Xc1enUZvFxhYN/7uFpSYhNQG02?=
 =?us-ascii?Q?UVQzni0z5R8x4n4JmQzqFASyG1oOZx86Uvs6u2GiBPmhASKiPV4CSiw7cvvz?=
 =?us-ascii?Q?Uscp/+xuDCsWbxW26XX/ZQgtKOkVRieh8f2Ov7LdoE1soZzvAWaTqgZBHKiC?=
 =?us-ascii?Q?VH1/Q5UZQO2LO09Aqq57MdAyyKTm94PeynV50MdUPTBQ2LGhU2wq/wu2KozT?=
 =?us-ascii?Q?E2GoVpjkNl8QPeP5UsC8lLJz6SrDJvNO/JARig4Pmhi75tj9IbuHXaQDCYtP?=
 =?us-ascii?Q?ydvMDaNVKNYaBZHd2L5Z7VasTCnZcjTeXwKtaOCfPP922XEQuXh0YpVcRPsc?=
 =?us-ascii?Q?18APHlLf96ez0rfQex6usYrwk+jf0a9kxfFhnYQgLFU0M2bmJ7mAvu7j8ZZu?=
 =?us-ascii?Q?QOO+riNFpunzQ/K8lJRxiSpdLE2hsJWvqqgFnNq4JPqWK6uLvHrnUJCD1uIK?=
 =?us-ascii?Q?8irDpBdMkvs2RSvQGCXY5pns1yLIaknL7MgX9btNDNJtKO0lBtDbqca19umB?=
 =?us-ascii?Q?A8oV2fgRyt8OSkYOIWBKtkpPFeUlqaVNk5Ngne3De4cEntE5bQZ+aWXPV0r2?=
 =?us-ascii?Q?WKV8HZe8w1KI892HTclpW8SJWmDwinpOrEvE+JUe5OLNLOqGnlI5645L0Up6?=
 =?us-ascii?Q?uusYjEzivLa/xPo9s981xGAwNXhb44fDCXvFObvVRKIEWlQ7BfM6cNO2l2d6?=
 =?us-ascii?Q?3TC05B2pdtPCzoknlOas0BJoC6iiJM0EipRMwTmc9Wno8/tdQT/EJ28kVk3Y?=
 =?us-ascii?Q?ZBT7tqtQOYJe/kOyUKH2nm2xie1JWgpXbUZ7upRIkUyMvnv87GFrSW4lBxlx?=
 =?us-ascii?Q?tgrj97ZU1H5JoMJbdaM1piB52glQ/bbzq7wxqv++X6VGV3+jMBrqlDzPigdf?=
 =?us-ascii?Q?1TZWdwi6/ElepVWGqtwvUuDgCuffRMQPlhBuXKD2KfOvVOzvFzSYG5f4yVuD?=
 =?us-ascii?Q?vPcp7p33LXzuKh2LlfeFiPTdWrXRnGElZIKYeQuM2IjXkxjW8IFVfUDMdXCU?=
 =?us-ascii?Q?2kETSXV4cPvD5kAXsvA06n5KuXs3Aae/9UwGadzZqTLH8y8CHonYAdsjsdSY?=
 =?us-ascii?Q?faALhQih4TcFEQcY5pXdtx7S8FEqlS5KvgjPjFd6zj4DMb75UJF71R8OQ+tW?=
 =?us-ascii?Q?7EztadkYZ4Icm6rro/EflymsCj4zaOjpCgblSg1nGc4i40QB+CXMtgKJIVfh?=
 =?us-ascii?Q?Tpq1UqyJZA2lTB67qU1Ppb8h675QN6jIrqNjn3Hts/QbnNt9SPSiuHB39QOy?=
 =?us-ascii?Q?J6BqBoUtEv1ir1glCU0dqU5MPL8hqelWq2ONuD0DMro7e6DhtebEJYlmWzku?=
 =?us-ascii?Q?7O5fOn3obPsZGusWPej9tYdaqmuD7DSRsrc5SbKfA1bQGh2sDsEeRR2fh/C+?=
 =?us-ascii?Q?lunK8GE5hvZhzc3bEMy/hjPkE3Ai93iz5u5Xbch3XC8MCP6048+9/Zfe3TgY?=
 =?us-ascii?Q?XuPjGT3pCovbQeLaa64QkpHwi3+9SF3RuvtOAqdpFNAOeM8DaH1we1YkbBVO?=
 =?us-ascii?Q?SJXB0zwv9ny0NzP50uZ7GzVx9Wj9BcHZfc8MesJPyTjLUU7ZJMz3t3xl+Mgo?=
 =?us-ascii?Q?614tT0kxS7A/eHiNpSUPefUnJxPTJyYB50yH0QK5KQ6tDyEx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Hlq36zsS0KqsHGfJV4Ju7LQ+Wd6hTKrXkErkpbCXSDpZfgb9PwOeBLaCM7Kx4S6SoKz8KcoSdR3TL5p12wv7nofVFWKFmUxMO3kY60Eg5+48hwCv7CJXBrlHAzVu0z82H059kqitFYwM7GEG9IxsaZ0cJvC1vrbI51pxYRjXyBCLPWKzFAo72yg5tRlSqiK6vgZeEIWFl5EU4zly6sPyMxI4W2tsbaFcTb8dWb6e4iK8t+sz/VOaozjpi9vaIBsao/mxyR9Wrq9WrKpo/pp3Wc3pGA6eKmtyHSWoKwHf3QUI5A9RZZPnvyOvCePNp6jR4Wg1MefyxuPy54A7skZ+rQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04288334-b8f1-47aa-3a2f-08df197b14c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 14:00:52.9889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGi2owN3GHKVoY/xI/b0hTOWQsYA4GkxM9y1KcGnfO4BJTnxDFQ44hYDkn8HMWQtlKHUmCcK5Sx2enJZn1/VSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

Hi @Joshi, Kunal1,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: 16 September 2026 10:18
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 13/13] tests/intel/kms_dp_link_training: Verify the=
 trained
> link from the sink side
>=20
> The test reads everything back from the driver. A driver that believes a =
link is
> up when the sink does not would pass, and the UHBR subtests infer 128b/13=
2b
> from the rate rather than checking it.
>=20
> After training, ask the sink. MAIN_LINK_CHANNEL_CODING_SET must select
> 128b/132b for a UHBR configuration and 8b/10b otherwise, and the link sta=
tus
> must show every lane in use locked. That is the only direct evidence that=
 the
> coding the rate implies is the coding that reached the wire.
>=20
> Skip when the DPCD can be opened but not read, rather than reporting the
> configuration as trained on evidence the test failed to collect. A missin=
g AUX
> character device is treated differently and only logged:
> CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV is not enabled by default, so there
> is often none at all, and that says nothing about the link, whereas AUX i=
s out of
> band and answers whether or not the link trained, so a read that fails on=
ce the
> device is open is a result in itself.
>=20
> An MST stream connector's AUX reaches the far sink over sideband rather t=
han
> the link partner, which is the end of the link being trained, so use the
> topology's root connector for MST. The root reads disconnected while MST =
is
> active, so find it by id instead of walking the connected outputs.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 91 +++++++++++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index 229eb3d69..a228b5493 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -55,8 +55,11 @@
>   *              link.
>   */
>=20
> +#include <string.h>
> +
>  #include "i915/i915_dp.h"
>  #include "igt.h"
> +#include "igt_dp.h"
>  #include "igt_kms.h"
>  #include "intel/kms_joiner_helper.h"
>  #include "intel/kms_mst_helper.h"
> @@ -80,6 +83,7 @@ typedef struct {
>  	uint32_t devid;
>  	igt_display_t display;
>  	igt_output_t *output;
> +	int aux_fd;
>  } data_t;
>=20
>  /*
> @@ -323,6 +327,79 @@ static void assert_link_recovery_idle(data_t *data,
>  	} while (elapsed < LINK_RECOVERY_TIMEOUT);  }
>=20
> +/*
> + * open_link_aux - Open the AUX device at the near end of the link.
> + *
> + * An MST stream connector's AUX reaches the far sink over sideband
> +rather than
> + * the link partner, which is the end of the link being trained, so for
> +MST it
> + * is the topology's root connector that has to be asked. The root
> +reads
> + * disconnected while MST is active, so it is found by id rather than
> +by
> + * walking the connected outputs.
> + */
> +static int open_link_aux(data_t *data, bool mst) {
> +	igt_output_t *output =3D data->output;
> +
> +	if (mst) {
> +		int root_id =3D igt_get_dp_mst_connector_id(data->output);
> +		int i;
> +
> +		output =3D NULL;
> +
> +		for (i =3D 0; i < data->display.n_outputs; i++) {
> +			igt_output_t *root =3D &data->display.outputs[i];
> +
> +			if (root->config.connector &&
> +			    root->config.connector->connector_id =3D=3D root_id) {
> +				output =3D root;
> +				break;
> +			}
> +		}
> +
> +		if (!output)
> +			return -ENOENT;
> +	}
> +
> +	return igt_dp_aux_open(data->drm_fd, output); }
> +
> +/*
> + * assert_sink_agrees - Ask the sink whether the link is really up.
> + *
> + * Everything else the test checks is read back from the driver. This
> +is the
> + * only check that the sink agrees, and the only direct evidence of
> +which
> + * channel coding reached the wire.
> + *
> + * A DPCD the test could open but cannot read leaves the case
> +unverified, so
> + * skip rather than report it as trained. A missing AUX device does
> +not: AUX is
> + * out of band and answers whether or not the link trained, so a read
> +that
> + * fails once the device is open is a result in itself, while
> + * CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV not being enabled - it is not by
> +default -
> + * says nothing about the link and would take every driver side check
> +down with
> + * it.
> + */
> +static void assert_sink_agrees(data_t *data,
> +			       const struct i915_dp_link_config *config) {
> +	bool uhbr =3D i915_dp_is_uhbr_rate(config->link_rate);
> +	int ret;
> +
> +	if (data->aux_fd < 0)
> +		return;
> +
> +	ret =3D igt_dp_channel_coding_ok(data->aux_fd, uhbr);
> +	igt_skip_on_f(ret < 0, "Unable to read the sink's channel coding: %s\n"=
,
> +		      strerror(-ret));
> +	igt_assert_f(ret, "Sink is not set to %s at rate %d\n",
> +		     uhbr ? "128b/132b" : "8b/10b", config->link_rate);
> +
> +	ret =3D igt_dp_link_status_ok(data->aux_fd, config->lane_count, uhbr);
> +	igt_skip_on_f(ret < 0, "Unable to read the sink's link status: %s\n",
> +		      strerror(-ret));
> +	igt_assert_f(ret, "Sink does not report %d lanes locked at rate %d\n",
> +		     config->lane_count, config->link_rate); }
> +
>  /*
>   * train_link_config - Force one link configuration, re-establish the li=
nk and
>   * check that the configuration took effect and survived training.
> @@ -366,6 +443,8 @@ static void train_link_config(data_t *data, bool mst,
>  	 * count resets the recovery state, which would mask the failure.
>  	 */
>  	assert_link_recovery_idle(data, config);
> +
> +	assert_sink_agrees(data, config);
>  }
>=20
>  /*
> @@ -564,6 +643,11 @@ static bool run_link_rate_test(data_t *data, bool ms=
t,
> bool uhbr)
>  							       data->output),
>  		      "Kernel has no intel_dp_allowed_link_configs debugfs\n");
>=20
> +	data->aux_fd =3D open_link_aux(data, mst);
> +	if (data->aux_fd < 0)
> +		igt_info("%s: no AUX device (%s), sink side checks are
> skipped\n",
> +			 igt_output_name(data->output), strerror(-data-
> >aux_fd));
> +
>  	/*
>  	 * Enumerate with the forced parameters reset, or the set being read is
>  	 * the forced one rather than the one the driver would pick from.
> @@ -603,6 +687,11 @@ static bool run_link_rate_test(data_t *data, bool ms=
t,
> bool uhbr)
>  		igt_info("Output %s allows no %sUHBR link config\n",
>  			 igt_output_name(data->output), uhbr ? "" : "non-");
>=20
> +	if (data->aux_fd >=3D 0) {
> +		close(data->aux_fd);
> +		data->aux_fd =3D -1;
> +	}
> +
>  	igt_info("----------------------------------------------------\n");
>  	return num_dynamics > 0;
>  }
> @@ -718,7 +807,7 @@ IGT_TEST_DESCRIPTION("Test to validate link training
> on SST/MST with "
>=20
>  int igt_main()
>  {
> -	data_t data =3D {};
> +	data_t data =3D { .aux_fd =3D -1 };
>=20
>  	igt_fixture() {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
> DRIVER_XE);
> --
> 2.25.1

