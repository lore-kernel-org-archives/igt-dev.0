Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B787FCA6015
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 06:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616DA10FE99;
	Fri,  9 Oct 2026 06:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QE690fDd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C4210FE98
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 06:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791526906; x=1823062906;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TTWt9KPOQVQuMjvWY9rnvhC7bMZOMFfmEnRGxY5AHBo=;
 b=QE690fDdgpqHGOwUqzXhsJUVhKcyUC65CYBYJJ0d9lxWxLclPSK2hnUh
 4Cnxuk7yORLCe31CpIx+hhB2jd8OOdQ9v5SNtomnPwDrrNr7eQWiuYKRp
 NcGMFWoiwwYhEm6TDT6cFk4f3Jy3oQDPfoNgpcyl/SM2Jy4kkhz5ZSll+
 ALC3xYiGR85GXkf+qOit27++VTZiTojZmCQVrhosXqCAnr/maItDqOOEW
 66N7la92/p+3qxF0B48Wchvh3uQ9079Bs+tWAPeiw3DqnCNgWvsh//koI
 Hi2/bKqp2t9LstcF5ADbEubeqKCX9F3lO+lYJjreSIyu03JWwkGDngvej Q==;
X-CSE-ConnectionGUID: VAaMSLQgTm+Fszv2Qjfzrw==
X-CSE-MsgGUID: CmjuTjg3RbaQToPkB7EqEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="331240"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="331240"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:21:46 -0700
X-CSE-ConnectionGUID: 6aBNDVEsQTOxEY0mF80brA==
X-CSE-MsgGUID: d8vghO3kTFGyHzF+SE/MKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="571513"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:21:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:21:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 23:21:45 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:21:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtS7bANqVhBJUkYPVcmbq+4+ZHW6k5aj7jQvvV31f6vqka4/YvHmovZvjTRMz2ovvZjz6hrqfK6OEtSpzNCRqL67U/+K6qah1tggRvm0+C8+PJTeApeG7i0LFWS8M1EMX8p2EY5WLG6KilJyhllUM0Lh+nQLGYhYKg3p4nKCjiiVbQK7FvY9GEWYR+EXi21PRdlDZ22cisS81gYT83OrJhJ/NUfetqVLbtvVvrWA0XRz6ZkZ3YEXG6QD1XIMBJijpKsv9QTup0Y3Ie3/eiCbGgQH/JjG/b1CNShHfqbLQADYysZWOxES4+mLKFQ28n8HZld14X6d1fyRZ9/n7BUfeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItOUJhyo2jCg5WNwC4sUfbpSk3XYs2bw7cJ1YxXiSfQ=;
 b=TtVfpLTVwZBg5q7FZpanMzfb0N1uizTr4zbASwPrV/pKGWxYAvx2TFgUeSg0942HrkVXQBWQZcc8us0XjQuHIujryK/ZaZvf2p6s7PCj1Ey5wNfvRJ8J3E6EvvRCacSFjxYVR4h/DLqQWx+W5QWSE8zFPTFLhFK4VOajKs5k9zZ0Sz/oHqvuNA/NUvy+rSQqW6gnFk2Se2beeex4fDN/iFY3wSy0S6lnNgMQUuwVLJZ+HBKmsHSByBXYM0PqTl6wRIEfIuhOVoEUlcNzL5vlP2WHEyOzD2C584XH2FjBsCV/n57GtCQTnQ4cuCGUdogkUV6yttAyAywLMy+ks4E1Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by SA1PR11MB7063.namprd11.prod.outlook.com (2603:10b6:806:2b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 9 Oct
 2026 06:21:33 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%5]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 06:21:33 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v2 7/7] tests/chamelium/kms_chamelium_hpd: Add HPD
 from runtime suspended D3hot
Thread-Topic: [PATCH i-g-t v2 7/7] tests/chamelium/kms_chamelium_hpd: Add HPD
 from runtime suspended D3hot
Thread-Index: AQHdV67RCGT4CU3ZSUCGsEbxTKgk6rb0uhXw
Date: Fri, 9 Oct 2026 06:21:33 +0000
Message-ID: <MW4PR11MB577605A1FCFD24E999B26679DA922@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20261009052625.419259-1-pranay.samala@intel.com>
 <20261009052625.419259-8-pranay.samala@intel.com>
In-Reply-To: <20261009052625.419259-8-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|SA1PR11MB7063:EE_
x-ms-office365-filtering-correlation-id: cd127166-e948-467d-584c-08df25cd90a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|3023799007|56012099006|4143699003|11063799006|5023799004|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: urvac7i0LZh+VEhbQWcjImLfRLuENcQ1EAq7ujP2IPaddJsFpaHFjNbJrsGTGuk1W2aZMFwXSyakIB5yvQ8bmE3XvjiHnc3zNBbkOuu5SV2GSFXr/tar05wBsdHFJXogdzqL9jU6cWennZW8nMvE7SbjrfSgvFLW6s783INaQZBEKPX+uvuaYFiFZbUS12jSUphfOTTRoQlOG+Ls7pAvhLPcYxCR8Hca4vXsIxzPwhMZKfM0SkskTRZtdMlFGonWV6yyULUuD6iAStxeWZXd5jzxlY2LyDJaDNFLugU+Pzcr3ux0Ro1intRQjtZIU7+QCxqVXrTCpPwTAF7hqpeMLvKDxMtiLIX1vgxjUg9B9FlS43hqWUa5Hm3N0mgvVAbapqItgr3TSlH/ilacpk3X2IGfbqQz/VJ0XJuJ3pJ6w5viHuFs0MfqY5K8lyzqiMcKipqK7Hlg4ayVHy7Gj/k/yHOIlDb4DfgiBFPCuC9yUdjDKQtmFCN/ZaleMES0ZEYq5SKhGUTKVw5hmnmOSB5czp1QdB+tfKJ9P3lrUGJCfve4JuNowbbt4zRyIblCahzuI0nJvGP4IejNvhlyQUvyEG2wNgEhvp/b/3s9/k9d8280BBh3aIirV6jUfOpZlqJuvG0PiDR2kIOKkJpC8rmLDYg9JEcoLvMuPNrrLGe6ZhnpqP0P/gSOS/efkZye3ZmPilGO91LvMZVQAmnb1loCinaaoRQVeWYIqKY+2MI0l9U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(3023799007)(56012099006)(4143699003)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jVsZCWPcdq7dohFQXYZp6RlV4B9OKL02tVac67IByU5QYkUqM/EblCxdZaYP?=
 =?us-ascii?Q?tPuiqyxEKD5S5LYRSuQG1no+IKTMb4CyKkFIODMxebdEVAYRNyLrzb0ZRpye?=
 =?us-ascii?Q?u4liy7ICoB9jjY2nGK+H8uHuFsus8JG30fHfGOEXlvs7GuYK+pvRwvJKAAGJ?=
 =?us-ascii?Q?5fJSxAtEXQdZx8scv5KYkL2OaLKFiM/a+sufvRN05qvA6cLH5MwuB4/NQlzV?=
 =?us-ascii?Q?oBgcg4am8OhHchLQwa3aRzguEC1OLH2ZVz1O3/Mfryj4X4pt+LfoJjL0Cj1n?=
 =?us-ascii?Q?nKfHPJiiNpeSFa+iZ25FUlFMf0z5DRqwTA+de+ANZyih5e4N69nWc1w+KvgO?=
 =?us-ascii?Q?4TFGT9irLFUVesB+BCTPp75vLXMU0GUujK8KMaIpFZYyMs/SR4JwBaTfrQvB?=
 =?us-ascii?Q?GrML3+mH9adgtko2ojnlFVB3z7DqXcr6R4qa2XkwtcjpZe+kPApLeAnSiI49?=
 =?us-ascii?Q?tLd0Qb43s0zHzfNlcJU1aPpZR3Ha0C9Gzs6OsF/+F21n7Rv6hjpz7BE4M0ck?=
 =?us-ascii?Q?jAzehqHsUfgvxrk8V3ZS3EX4hklU2jrzHS5/fMyFb+8YU1JJBTRGGn+tY4SP?=
 =?us-ascii?Q?CTExHGFc0JzkBV67+KfmQ7S7eVMWv9pHNu7CUOYe77+SvcHPFCKDLopJweMe?=
 =?us-ascii?Q?98ZFPnvtz8sy9Nf9B8KfT0mSYdnF6mJNHUSsalgTPQLEIr4Hefw84bS2IOGo?=
 =?us-ascii?Q?1+oHHbmfM+KYZ9fEabbdYZi3Y796K8fAP+iwE3nwfCIzvz39/SsASXoJlAhn?=
 =?us-ascii?Q?cvPeCXmc9IdeEl3IEQAZl2lP3GXgH8jfgk7CAjdkqMo+9/VJFwLD50G5uoGx?=
 =?us-ascii?Q?BwxOsFvEc4+tO23eJz+z+iFmVRR/gpQnS3HsoyhGlMxSI5t3f366J5QE9MTC?=
 =?us-ascii?Q?gkOpnkWCnJBO6C/XGKjNfQNCPC/IyID4K/N1Ra68vmASifjTQ//6Z7oGKp6j?=
 =?us-ascii?Q?DcOEBv3T+FTefddT/dhlKWMXnVTkk/PV+OE7xKL4F48srz/UXT05uJ4+5hmU?=
 =?us-ascii?Q?a7TCaXYql4N1GzpUp+mk1QU6Kc8MZ0xFlanPImtMP2yY8D1PvAQ9igseQAkL?=
 =?us-ascii?Q?fsk1/nnUOkccjIXG4VHhOvaWu1BJ/6y6SZJkY7y5/PVelnuSlHvaX+gMVmeG?=
 =?us-ascii?Q?sFlDm3wxXcENpDLwm+SR0JQvi7OgH8EcwEuWVHe4xPumdvdAErNwaJjD/qNc?=
 =?us-ascii?Q?MWtKwCA4Is3YzvFhp2eRgzqzIqKYhVO22hC4TMJNOMPJQTIajqv1fUN32EIW?=
 =?us-ascii?Q?hvMHHDlxKql0/KLmppatHfgSM1Kc3zTVS1TjlCzS9zwk1CRkEKS0fClvYiaU?=
 =?us-ascii?Q?9wU4ypFB3rqqzzSeewTPzc/cC4zMv0fH0dsFBVjfzWGCiXoH/eXiXGbnoqIw?=
 =?us-ascii?Q?V6Hk4VFM0PnVTiGaMEX9UfLnyWQlTwWVAyrwmnmBiwqs9D4EAuY18JVxHyds?=
 =?us-ascii?Q?hFcZ3My4rLK4i3jpblqS3G4oBZa94NVFZvlQdFw9195Q78FjCBFqqb7/bZ+0?=
 =?us-ascii?Q?wOfjkmSZgNoSDvSqG/yz2JCgMIZcfa5WI+zumcxDbPyttOPL3HsdcNkUJxdu?=
 =?us-ascii?Q?+MqnVMAmqzG4VYhm/lk5MbaSmGzoWU+ucuLVak2J+yTFDC6e6B1wO+UG8IX/?=
 =?us-ascii?Q?YD6rCt19VloZNr1Mt86tyIiG8NsqO2e2lwakofaU+l2DZso1no6BES6yQb9v?=
 =?us-ascii?Q?oGhZ7znUesAZfOTZy9mD13wQFFdSvrb3dvWLleMOaob9RrnX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: v385LUPI8DvqZOkobmWISjWOO+YCaEAJtHVf2SWUU6r4EmcsmLNnODzQd7OyVzr2BEUAOE0jStJet/eJpBMyk0xmfItIpgvzb9YFGU50/fy5GoIbd2K5upCun04CAYD8XMsLuR7MRocSJ6PP7Y67BnWMIwAIcYc6grpAwSrjbN5DQV3GzCXh0XgolxUxJECeD0uswPQqkbofVAjmh/VuGIMc7CipuFsN9Bo2p6Z9W33vFtgnIXOhIDfL9RMVWPw06dgilQKz9ZXVB5uzT514eSRvYRmqsUQwMqBY5zS196Lvc9eNQfuS0dk3ju3RGPtz41SASLNR5q752fQwxX58JQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd127166-e948-467d-584c-08df25cd90a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 06:21:33.5032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JU3Fu9UqISlhwZnsAdY6Ix5mIwcfJce8ujdJQ/gy1z6Qi/2db1KuyM5wV0TVid6hUWWvefS3BTLZ9ycNc+YvRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7063
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

Hello Pranay,

> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Friday, October 9, 2026 10:56 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v2 7/7] tests/chamelium/kms_chamelium_hpd: Add
> HPD from runtime suspended D3hot
>=20
> Add dp-hpd-after-runtime-suspend-d3hot and hdmi-hpd-after-runtime-
> suspend-d3hot, covering a hotplug signalled by a PME while the device is
> runtime suspended in D3hot. The existing *-hpd-after-suspend subtests use
> system suspend instead.
>=20
> Checking only that the display comes back would pass whether or not the
> driver fell back to the ~10s connector poll, so the subtest runs two phas=
es
> against the same suspended device.
>=20
> Phase 1 parks the device in D3hot with PME_En set and samples the D state
> from the PCI Power Management Control/Status register across a window
> longer than two poll periods, requiring that it never leaves D3hot. Any
> resume there means polling is still enabled.
>=20
> Phase 2 toggles the HPD from the chamelium and requires a prompt uevent,
> an updated connector status, and an increase in
> power/wakeup_active_count. The counter is what shows the device signalled
> its own resume rather than the host initiating one.
>=20
> Both phases report the D state, PME_Status and the counter delta on failu=
re
> rather than asserting a cause, which separates a device that never signal=
led
> from one whose PME was not delivered and from one that resumed and
> dropped the HPD afterwards.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/chamelium/kms_chamelium_hpd.c | 344
> ++++++++++++++++++++++++++++
>  1 file changed, 344 insertions(+)
>=20
> diff --git a/tests/chamelium/kms_chamelium_hpd.c
> b/tests/chamelium/kms_chamelium_hpd.c
> index bd8731c02..1135019c4 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -33,6 +33,7 @@
>   */
>=20
>  #include "kms_chamelium_helper.h"
> +#include "igt_device.h"
>=20
>  /**
>   * SUBTEST: dp-hpd-fast
> @@ -114,6 +115,18 @@
>   * Description: Toggle HPD during Suspend, check that uevents are sent a=
nd
>   *              connector status is updated
>   *
> + * SUBTEST: dp-hpd-after-runtime-suspend-d3hot
> + * Description: Toggle HPD while runtime suspended in D3hot with PME
> signalling
> + *              available, check that connector polling stayed disabled,=
 that the
> + *              device woke itself up and that uevents are sent and conn=
ector
> + *              status is updated
> + *
> + * SUBTEST: hdmi-hpd-after-runtime-suspend-d3hot
> + * Description: Toggle HPD while runtime suspended in D3hot with PME
> signalling
> + *              available, check that connector polling stayed disabled,=
 that the
> + *              device woke itself up and that uevents are sent and conn=
ector
> + *              status is updated
> + *
>   * SUBTEST: common-hpd-after-suspend
>   * Description: Toggle HPD during suspend on all connectors, check that
> uevents
>   * 		are sent and connector status is updated
> @@ -152,6 +165,33 @@
>  #define HPD_TOGGLE_COUNT_DP_HDMI 15
>  #define HPD_TOGGLE_COUNT_FAST 3
>=20
> +/*
> + * The KMS helper polls connectors every 10s, so watch for longer than
> +two poll
> + * periods: a single delayed or coalesced poll then cannot make the test
> pass.
> + */
> +#define PME_POLL_PROOF_WINDOW_MS 25000
> +/*
> + * How often to sample the D state during that window. Config space
> +reads do not
> + * resume a device suspended into D3hot, so this catches a poll induced
> +resume
> + * that is too brief to stand out in the runtime PM accounting.
> + */
> +#define PME_D_STATE_SAMPLE_MS 100
> +/*
> + * If the device never leaves D3hot, all elapsed time is accounted to
> + * runtime_suspended_time and runtime_active_time does not move at all.
> +Allow a
> + * small amount for one unrelated wakeup rather than requiring exactly
> +zero,
> + * while staying well under what two or three poll induced resumes would
> cost.
> + */
> +#define PME_ACTIVE_TIME_SLACK_MS 100
> +/* Tolerance for accounting granularity and usleep() overshoot. */
> +#define PME_POLL_PROOF_SLACK_MS 500
> +/*
> + * A PME is delivered as an interrupt, so the wake is expected to be
> +prompt. The
> + * whole point of the feature is that this is not the ~10s a poll would =
take.
> + */
> +#define PME_WAKE_LATENCY_MAX_MS 3000

It is not always an interrupt. Without a GPE / PCIe PME route, the PCI
core PME poll delivers it within 1s. The 3s budget is fine, please fix
the comment.

> +#define PME_HPD_TOGGLE_DELAY_MS 1000
> +
>  enum test_modeset_mode {
>  	TEST_MODESET_ON,
>  	TEST_MODESET_ON_OFF,
> @@ -383,6 +423,302 @@ static void
> test_suspend_resume_hpd_common(chamelium_data_t *data,
>  	igt_cleanup_uevents(mon);
>  }
>=20
> +/*
> + * Name a D state read back from config space, for failure messages.
> +PMCS cannot
> + * report D3cold - a device in D3cold is resumed by the read itself and
> +answers
> + * as D0 - so an unknown state here means the read failed outright,
> +i.e. the
> + * device has gone away.
> + */
> +static const char *pme_d_state_name(enum igt_acpi_d_state state) {
> +	switch (state) {
> +	case IGT_ACPI_D0:
> +		return "D0";
> +	case IGT_ACPI_D1:
> +		return "D1";
> +	case IGT_ACPI_D2:
> +		return "D2";
> +	case IGT_ACPI_D3Hot:
> +		return "D3hot";
> +	case IGT_ACPI_D3Cold:
> +		return "D3cold";
> +	default:
> +		return "an unreadable state";
> +	}
> +}
> +
> +static void try_hpd_runtime_suspend_pme(chamelium_data_t *data,
> +					struct chamelium_port *port,
> +					struct pci_device *pci_dev,
> +					struct udev_monitor *mon,
> +					bool connected)
> +{
> +	drmModeConnection target_state =3D connected ?
> DRM_MODE_DISCONNECTED :
> +						     DRM_MODE_CONNECTED;
> +	int timeout =3D CHAMELIUM_HOTPLUG_TIMEOUT;
> +	uint64_t susp_before, active_before, wakeups_before,
> wakeups_after;
> +	uint64_t wakeups_at_toggle;
> +	uint64_t susp_delta, active_delta;
> +	struct timespec start, end;
> +	int latency;
> +
> +	igt_flush_uevents(mon);
> +
> +
> 	igt_assert_f(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUS
> PENDED),
> +		     "Device did not runtime suspend\n");
> +
> +	/*
> +	 * Intel graphics devices support PME in D3hot but not in D3cold, and
> xe
> +	 * chooses the target state itself, so there is nothing to force from
> +	 * userspace. In practice an integrated device always lands in D3hot,
> +	 * since xe needs an ACPI _PR3 power resource on the upstream port
> before
> +	 * it considers D3cold at all. Check anyway: on a device that did drop
> to
> +	 * D3cold there is no PME to observe and everything below would
> only
> +	 * exercise the polling fallback, so skip.
> +	 *
> +	 * A device in D3cold answers this read as D0 rather than as D3cold,
> for
> +	 * the reason described above pme_d_state_name(), which fails the
> check
> +	 * just the same.
> +	 */
> +	igt_require_f(igt_pm_pci_get_d_state(pci_dev) =3D=3D IGT_ACPI_D3Hot,
> +		      "Device is not suspended in D3hot, so there is no PME to
> "
> +		      "observe\n");

A few issues here:
- This runs in every try. If something wakes the device between the
  runtime_status check and this read (or in the 2nd try after the 1st
  passed), we report SKIP instead of FAIL. That is exactly the spurious
  wake phase 1 wants to catch.
- For D3cold the read itself resumes the device (see 2/7).
- For iGPU, d3cold is never capable because pcie_find_root_port()
  returns NULL; _PR3 is not even checked. For dGPU, D3hot can be forced
  with vram_d3cold_threshold =3D 0, so "nothing to force" is not correct.

Please decide D3hot once upfront (power_state sysfs) and use igt_assert
here.

> +
> +	/*
> +	 * PME_En is the direct sign that the feature engaged; without it, the
> test
> +	 * would only be measuring the polling fallback.
> +	 */
> +	igt_assert_f(igt_pm_pci_pme_enabled(pci_dev),
> +		     "PME_En is not set after suspending into D3hot\n");
> +
> +	/*
> +	 * Phase 1: ensure the device stays in D3hot while idle. If polling
> remains on,
> +	 * the KMS helper will resume it to probe connectors.
> +	 */
> +	susp_before =3D igt_pm_get_runtime_suspended_time(pci_dev);
> +	active_before =3D igt_pm_get_runtime_active_time(pci_dev);
> +	wakeups_before =3D igt_pm_get_wakeup_active_count(pci_dev);

The window starts as soon as the device is seen suspended. Leftover HPD
retry work (HPD_RETRY_DELAY 1s) from the previous plug, an HDA runtime
resume, etc. can still wake the device, and then we blame polling.
Please let it stay suspended for 2-3s before taking the baselines.

Also 25s x 2 tries x every port of that type comes to ~1 min per port.
The idle window is needed only once; the 2nd try can go directly to
phase 2.


> +
> +	igt_assert_eq(igt_gettime(&start), 0);
> +	do {
> +		enum igt_acpi_d_state d_state =3D
> igt_pm_pci_get_d_state(pci_dev);
> +
> +		/*
> +		 * Distinguish self-woken resumes from host-driven ones. A
> self-wakeup bumps
> +		 * wakeup_active_count; a host-driven resume does not.
> +		 */
> +		if (d_state !=3D IGT_ACPI_D3Hot) {
> +			bool self_woke;
> +
> +			wakeups_after =3D
> igt_pm_get_wakeup_active_count(pci_dev);
> +			self_woke =3D wakeups_after > wakeups_before;
> +
> +			igt_assert_eq(igt_gettime(&end), 0);
> +			igt_assert_f(false,
nit: igt_assert_f(false, ...) is used in two places. Better to assert on
the actual condition or use igt_fail_on_f().

> +				     "Device left D3hot into %s after %.0fms of
> "
> +				     "a %dms idle window.\n"
> +				     "wakeup_active_count %" PRIu64 " -> %"
> PRIu64
> +				     ", so the resume was %s.\n%s\n",
> +				     pme_d_state_name(d_state),
> +				     igt_time_elapsed(&start, &end) * 1000,
> +				     PME_POLL_PROOF_WINDOW_MS,
> +				     wakeups_before, wakeups_after,
> +				     self_woke ? "signalled by the device" :
> +						 "initiated by the host",
> +				     self_woke ?
> +				     "No hotplug was requested yet, so this is a
> "
> +				     "spurious or still pending PME rather than
> "
> +				     "the polling fallback." :
> +				     "The polling fallback resumes on a 10s
> period, "
> +				     "or 1s while a delayed event is pending, so
> "
> +				     "compare the elapsed time above: a wake
> at an "
> +				     "unrelated delay is some other client or "
> +				     "driver taking a display power reference "
> +				     "rather than connector polling.");
> +		}
> +
> +		usleep(PME_D_STATE_SAMPLE_MS * 1000);
> +
> +		igt_assert_eq(igt_gettime(&end), 0);
> +	} while (igt_time_elapsed(&start, &end) * 1000 <
> +PME_POLL_PROOF_WINDOW_MS);
> +
> +	susp_delta =3D igt_pm_get_runtime_suspended_time(pci_dev) -
> susp_before;
> +	active_delta =3D igt_pm_get_runtime_active_time(pci_dev) -
> +active_before;
> +
> +	igt_info("Idle for %dms in D3hot: suspended +%" PRIu64 "ms, active
> +%" PRIu64 "ms\n",
> +		 PME_POLL_PROOF_WINDOW_MS, susp_delta, active_delta);
> +
> +	/*
> +	 * Belt and braces on top of the D state sampling above, which covers
> +	 * resumes shorter than the sample interval: with the device parked
> in
> +	 * D3hot for the whole window, all of the elapsed time is accounted
> to
> +	 * runtime_suspended_time and runtime_active_time should barely
> move.
> +	 */
> +	igt_assert_f(active_delta <=3D PME_ACTIVE_TIME_SLACK_MS,
> +		     "Device was active for %" PRIu64 "ms of a %dms idle
> window, "
> +		     "so it resumed for shorter than the %dms sample interval.
> "
> +		     "Something is still waking the device while idle and the "
> +		     "feature saves no power\n",
> +		     active_delta, PME_POLL_PROOF_WINDOW_MS,
> +		     PME_D_STATE_SAMPLE_MS);
> +	igt_assert_lte(PME_POLL_PROOF_WINDOW_MS -
> PME_POLL_PROOF_SLACK_MS,
> +		       susp_delta);

susp_delta is uint64_t, please use igt_assert_lte_u64().

> +
> +	/*
> +	 * Phase 2: fire the HPD and check the device wakes up promptly. The
> +	 * toggle is scheduled over XMLRPC, which travels over the network
> and so
> +	 * does not disturb the GPU while we wait for the uevent.
> +	 *
> +	 * Take a fresh wakeup baseline rather than reusing the one from
> phase 1,
> +	 * which is a whole idle window old by now. Phase 1 only requires
> that
> +	 * the device stayed in D3hot, which a PME that resumed nothing at
> all
> +	 * would not violate, so the counter is not guaranteed to be
> unchanged.
> +	 */
> +	wakeups_at_toggle =3D igt_pm_get_wakeup_active_count(pci_dev);
> +
> +	chamelium_schedule_hpd_toggle(data->chamelium, port,
> +				      PME_HPD_TOGGLE_DELAY_MS,
> !connected);
> +
> +	igt_assert_eq(igt_gettime(&start), 0);
> +	if (!chamelium_wait_for_hotplug(mon, &timeout)) {

uevents are flushed at the start of the try, ~25s before this. Any
uevent in between satisfies the wait immediately, latency goes negative,
and it still passes the < 3000 check. Please flush here just before
scheduling the toggle, take start before the XMLRPC call, and assert
latency >=3D 0.

> +		enum igt_acpi_d_state d_state =3D
> igt_pm_pci_get_d_state(pci_dev);
> +		bool pending =3D igt_pm_pci_pme_status(pci_dev);
> +		const char *cause;
> +
> +		wakeups_after =3D igt_pm_get_wakeup_active_count(pci_dev);
> +
> +		/*
> +		 * If the device stays in D3hot, the wake is from PME. If it
> returns to D0,
> +		 * the HPD was handled by the driver resume path.
> +		 */
> +		if (d_state =3D=3D IGT_ACPI_D3Hot)
> +			cause =3D pending ?
> +				"The device signalled a PME that was never "
> +				"delivered, so the PME is not reaching the
> OS." :
> +				"The device never signalled a PME, so the
> HPD "
> +				"is not reaching the PME logic.";
> +		else
> +			cause =3D "The device resumed but sent no uevent, so
> the "
> +				"HPD was dropped on the resume path.";
> +
> +		igt_assert_f(false,
> +			     "No hotplug uevent %ds after an HPD toggle in
> D3hot.\n"
> +			     "Device is in %s, PME_Status is %s, "
> +			     "wakeup_active_count %" PRIu64 " -> %" PRIu64
> ".\n%s\n",
> +			     CHAMELIUM_HOTPLUG_TIMEOUT,
> +			     pme_d_state_name(d_state),
> +			     pending ? "set" : "clear",
> +			     wakeups_at_toggle, wakeups_after, cause);
> +	}
> +	igt_assert_eq(igt_gettime(&end), 0);
> +
> +	latency =3D igt_time_elapsed(&start, &end) * 1000 -
> +		  PME_HPD_TOGGLE_DELAY_MS;
> +
> +	/*
> +	 * wakeup_active_count incrementing means the resume was
> signalled by the
> +	 * device itself, i.e. by a PME. Unlike PME_Status, which the PCI/PM
> core
> +	 * clears on the way back to D0, this counter survives the resume and
> so
> +	 * is not racy to sample here.
> +	 */
> +	wakeups_after =3D igt_pm_get_wakeup_active_count(pci_dev);
> +
> +	igt_info("HPD to uevent latency %dms, wakeup_active_count %"
> PRIu64 " -> %" PRIu64 "\n",
> +		 latency, wakeups_at_toggle, wakeups_after);
> +
> +	igt_assert_f(wakeups_after > wakeups_at_toggle,
> +		     "power/wakeup_active_count did not increment, so the
> resume "
> +		     "was not triggered by a PME from the device\n");
> +	igt_assert_lt(latency, PME_WAKE_LATENCY_MAX_MS);
> +
> +	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
> +	igt_assert_eq(chamelium_reprobe_connector(&data->display,
> +						  data->chamelium, port),
> +		      target_state);
> +}
> +
> +/*
> + * Mirror of the driver's own HAS_PM_PME_SUPPORT(): only xe reports
> PME
> + * capability to the display code, and only from graphics IP 35.10 on.
> + */
> +#define PME_HPD_MIN_GRAPHICS_VERX100 3500
> +
> +static bool pme_hpd_supported(int fd)
> +{
> +	const struct intel_device_info *info;
> +
> +	if (!is_xe_device(fd))
> +		return false;
> +
> +	info =3D intel_get_device_info(intel_get_drm_devid(fd));
> +
> +	return info->graphics_ver * 100 + info->graphics_rel >=3D
> +	       PME_HPD_MIN_GRAPHICS_VERX100;

The comment says 35.10 but the value is 35.00 (same as kernel). Also no
need to open code this; we already have intel_graphics_ver() + IP_VER(),
see lib/xe/xe_query.c:
> +}
> +
> +static const char test_hpd_runtime_suspend_pme_desc[] =3D
> +	"Toggle HPD while runtime suspended in D3hot with PME signalling "
> +	"available, check that connector polling stayed disabled, that the "
> +	"device woke itself up and that uevents are sent and connector status
> "
> +	"is updated";
> +static void test_hpd_runtime_suspend_pme(chamelium_data_t *data,
> +					 struct chamelium_port *port)
> +{
> +	struct pci_device *pci_dev;
> +	struct udev_monitor *mon;
> +
> +	pci_dev =3D igt_device_get_pci_device(data->drm_fd);
> +
> +	/*
> +	 * Without driver support the device keeps HPD polling enabled and
> phase
> +	 * 1 would fail rather than skip, so gate on the platform before
> looking
> +	 * at the hardware capability at all.
> +	 */
> +	igt_require_f(pme_hpd_supported(data->drm_fd),
> +		      "Driver does not use PME for HPD on this platform\n");
> +
> +	igt_require_f(igt_pm_pci_pme_supported(pci_dev,
> IGT_ACPI_D3Hot),
> +		      "Device does not advertise PME support in D3hot\n");
> +	igt_require_f(igt_pm_has_wakeup_support(pci_dev),
> +		      "Device does not expose power/wakeup\n");
> +	igt_require(igt_setup_runtime_pm(data->drm_fd));
> +	igt_require_hpd_storm_ctl(data->drm_fd);
> +
> +	/*
> +	 * Need both: PME is only armed when device_may_wakeup() is true,
> and
> +	 * without wakeup support the PM core never records the PME
> wakeup.
> +	 */
> +	igt_pm_set_wakeup_enabled(pci_dev, true);
> +
> +	/*
> +	 * Save the poll setting so a previous test cannot leave it disabled an=
d
> +	 * fake a pass. Polling must stay enabled; the test checks that the
> driver
> +	 * does not use it when PME is available.
> +	 */
> +	igt_require(igt_pm_kms_poll_save());
> +	igt_pm_kms_poll_set(true);

This doesn't guarantee polling is actually running.
Also nothing proves that 100ms sampling + 100ms slack will catch a poll
wakeup on this machine. So phase 1 can pass even on a kernel which still
polls.

Can we add a control step before arming PME, something like:

        igt_pm_set_wakeup_enabled(pci_dev, false);
        /* resume once so that next suspend re-evaluates pme.enabled */
        ...wait for suspend...
        igt_assert(!igt_pm_pci_pme_enabled(pci_dev));
        igt_skip_on_f(!device_woke_within(pci_dev, 2 * 10000),
                      "Connector polling not running, can't validate\n");

        igt_pm_set_wakeup_enabled(pci_dev, true);
        /* resume again, take fresh wakeup_active_count baseline */

This proves polling is live, and the only difference is PME armed or
not. It also gives the real poll wakeup cost to tune
PME_ACTIVE_TIME_SLACK_MS.

Also, igt_require() here comes after we already changed power/wakeup.
Please do all requires first and then modify the state. Restore happens
only on the success path, so on fail/skip the next subtest (hdmi after
dp) runs with the modified state.


Thanks and Regards
Kunal Joshi


> +
> +	/* Don't let our own toggles trip the storm detection into polling. */
> +	igt_hpd_storm_set_threshold(data->drm_fd, 0);
> +
> +	igt_modeset_disable_all_outputs(&data->display);
> +
> +	mon =3D igt_watch_uevents();
> +	chamelium_reset_state(&data->display, data->chamelium, port,
> +			      data->ports, data->port_count);
> +
> +	/* Ports are left disconnected by the reset, so plug first. */
> +	try_hpd_runtime_suspend_pme(data, port, pci_dev, mon, false);
> +
> +	/* Now check we notice a disconnect signalled from D3hot too. */
> +	try_hpd_runtime_suspend_pme(data, port, pci_dev, mon, true);
> +
> +	igt_cleanup_uevents(mon);
> +	igt_hpd_storm_reset(data->drm_fd);
> +	igt_pm_kms_poll_restore();
> +	igt_pm_restore_wakeup();
> +}
> +
>  static const char test_hpd_without_ddc_desc[] =3D
>  	"Disable DDC on a VGA connector, check we still get a uevent on
> hotplug";  static void test_hpd_without_ddc(chamelium_data_t *data, @@ -
> 500,6 +836,10 @@ int igt_main()
>  	connector_subtest("dp-hpd-after-hibernate", DisplayPort, &data,
> test_suspend_resume_hpd,
>  			  SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
>=20
> +	igt_describe(test_hpd_runtime_suspend_pme_desc);
> +	connector_subtest("dp-hpd-after-runtime-suspend-d3hot",
> DisplayPort,
> +			  &data, test_hpd_runtime_suspend_pme);
> +
>  	igt_describe(test_hpd_storm_detect_desc);
>  	connector_subtest("dp-hpd-storm", DisplayPort, &data,
> test_hpd_storm_detect,
>  			  HPD_STORM_PULSE_INTERVAL_DP);
> @@ -538,6 +878,10 @@ int igt_main()
>  	connector_subtest("hdmi-hpd-after-hibernate", HDMIA, &data,
> test_suspend_resume_hpd,
>  			  SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
>=20
> +	igt_describe(test_hpd_runtime_suspend_pme_desc);
> +	connector_subtest("hdmi-hpd-after-runtime-suspend-d3hot",
> HDMIA,
> +			  &data, test_hpd_runtime_suspend_pme);
> +
>  	igt_describe(test_hpd_storm_detect_desc);
>  	connector_subtest("hdmi-hpd-storm", HDMIA, &data,
> test_hpd_storm_detect,
>  			  HPD_STORM_PULSE_INTERVAL_HDMI);
> --
> 2.53.0

