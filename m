Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA22606A326
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acLSoS2f
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D12F10FA5A;
	Wed,  4 Nov 2026 08:29:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2679710E841
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 08:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793780909; x=1825316909;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=n7CcJvKlCObi0sa1RE+dJzX32T7JKraWcdYXPb/isYA=;
 b=acLSoS2fERieM9SpfGGULQ8PI1RTNgDm3yAB/WenswsJhEUiRXXduv7G
 esCiSpUjkjjhj8tDjGD1iZyFy77hQoTq1OPqTDO0Mq/h+s2jAbgqtdD+l
 r6rWQHsnE8g/EIy+ZKSLf3tzHvPieAykLhUkvil4sD5oYMqgPSKnrQq+W
 gxX4HG/JqhKTkhi1pThviRLqU+31lNqB3YvYHgah7aLqpl3t5kYbvCk6u
 5sp+/KHoyoeSUGWc2EaCVnDzxoTsSIX6fQ8bQIGPihqMc4vaH425hvTIu
 IjusMYMuiyD3E2IAybv/LKw55N9pPTkh/KxMEKiYsXG/zv7Q1vWHT2bLB A==;
X-CSE-ConnectionGUID: RZ9BF4/4QzSrJOZV33kh/w==
X-CSE-MsgGUID: p+LBPABaSkyo3DW0SqAqWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2540470"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2540470"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 00:28:29 -0800
X-CSE-ConnectionGUID: 9qXpcUzvR2KepxpJC65vvA==
X-CSE-MsgGUID: a8KssXjPRQGISOUWDpY+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6721870"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 00:28:29 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:28:28 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 00:28:28 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:28:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unJfUP4j/1XHrF1USBlr+sFYLJRU/cVxsjXduZ/mERGySqBpMkuja9eLyIqsTGsx7R4tol5us3+B+l5kQaoMNLqDsXFBkRVKSgE/DTES+m02hRsFq7jEp238K2hzBWW31O5apLvLnfygzPWis9zhlgEXq/2WWtz3wrq/OEb5WjzUc0r96PHqFupm62LmQViRChjv9/zQ3dEBZe9Pqnd2jSJBROKuX+IJuDWbbvnwtsaj6BszSz12NHlXSksd8Dyl60yktGwJbkmuz4ZdXjLmMFy14BRTa0rv5I2ITt83xCHjo3Zz00yDBhd0x9Yw0MrvU202U0DpqcUaxEbTZK7h2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f92tldYwN3eMr+6ATjvQoBSNxK+3n5OLnklB+HFUnH4=;
 b=aXJz6ycC85UPpDShcbd8sgUMJOvFGE+15Yzb5P0QodUpNY3PDxaELIL/q/qGS8L0Ls3QLdT+6GKuthdp0X0G6KaOpJkNnr1mi24c2b7mqpiCP85JtUnb0sFm/eetIizOTHBrpeA1JJy2t8AY0DLK/RjloGqW+7ZPE1yB1/8lWzOGbsu4xA+YROQlN1+i7yYe5vpvknGwYmRQJ7wlq8kS/UCpSsKJawNsQV0aNiIfQ9/PX8QuLwLj21cQN9EUZIZmCz+dqH7PrlsaCkzxa1cnVdfoWR+1ZDFe/thqvfUmnU4OCJ+pINg2tL9r0iOxUx6gBYIU6ZBPZVCrL3WxXxeHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 08:28:25 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 08:28:25 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] tests/kms_plane_cursor: reduce CI debug output
Thread-Topic: [PATCH 2/3] tests/kms_plane_cursor: reduce CI debug output
Thread-Index: AQHdZW4Nq1o2h01qWEibydLspUXQJ7cdoKNg
Date: Wed, 4 Nov 2026 08:28:25 +0000
Message-ID: <PH7PR11MB6053076889D403F55A3438B7E7682@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20261026171836.1434992-1-jeevan.b@intel.com>
 <20261026171836.1434992-3-jeevan.b@intel.com>
In-Reply-To: <20261026171836.1434992-3-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SJ0PR11MB5165:EE_
x-ms-office365-filtering-correlation-id: 83f51a20-cb08-45e7-2c59-08df3a4d9851
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|4143699003|11063799006|261009223027099003|261022075727099003|261022105027099003|261102123227099003|261021121427099003|56012099006|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: mrW2g9DtZpfsO8TzT5xoiUn6RSHXQCJsS+0a5yytl7BlCGslgBafBQkwk5D9VASv5gvUS1W5bbVYNSiE47F1z+jDdZLPbrxqPN2bdV0oI35NX+5rwJgMFQMAKJIntZRgFpy8a3uRFa1sOOfbD81HaCGjB5ckA3QqdsYNMBCFuFjbh+iB1xV59Ur9CX9qlM/2H2H8SGQS6o53hoqQuDM1jyE/BvvvUNsnCSZiaqrCgxVjJbX9P+h7bNpOMfuu9ThEB19bAdDJe06wCY3FO4xgqM8FikPwI3Gv6P5BJZjFuIe3h9zlq7i9q1aIMjjbQEuwHnPorJ40ep0d4aTyMbhbOOAMKY+Dofy8cilxJZdhE16bCFKDiA9FtgQTxyMCVDji3a9e5LSfJHUvAYLPhC6GjBsOyoCcWB8pNPLhknbGdH4HsPg9aypBVWu0oqVt/DreYjSAKdcB8rtXEb2YVOHN90fmAf0FiMQ5C1JM7wQAUj4FeK3ilXhSXt2hQoZLaNhy557SlE4CEJdsN1fCA0KGtmGjqoYmaLQkKZrpVpemLMWV2vVDwMLzHWLy6EkX1Zh1gl/MuFBGTAU7eeX70wMYxXRigVHci+qiWAOA0jowTIUmogNr3/+oG29yH6kRxgaGQ/FQ2/v3YiMqcjlUSaDfjG0UYkUrb1NWc47A8dvGQUI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(4143699003)(11063799006)(261009223027099003)(261022075727099003)(261022105027099003)(261102123227099003)(261021121427099003)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G9O+BfwC7DJmvqrgM5FiA0V328CLZPRxa/P3uKctDAfsfHI5H+0wZ2tXKdI4?=
 =?us-ascii?Q?nBI5LT4wAOO2d3dUkc4LFQlD92S1Flx6wejIVcFzGVxmq4GXLvb0qgbHifvL?=
 =?us-ascii?Q?kOF9KDzqgjb2AsuVEpQwadqvpXl9x+0MjtCubaJZBDTyiSuZKylHOvJDLHHC?=
 =?us-ascii?Q?bNqujyIh2p5/KIaJFcLS+lVnsPmfSMpjxdDyZrS1LRUBaAtHLBo+Z5vTyERy?=
 =?us-ascii?Q?iK3EBsO1ixpaXmyQwvEVnoebCCyCGl9gnYlr9jPob9/BfJrweBoKi4YbQ53T?=
 =?us-ascii?Q?tFxC+qd93psRbkGQEJVVqAOEXXHKe24ePXr1qEX+tlbx754Dha78uVYcWZ/s?=
 =?us-ascii?Q?LqcymYWVQzjnM1dQRkp+nRGpnbG/FweR2WoBixxqa8qHDHU+feLNHxKXJLhi?=
 =?us-ascii?Q?Wk3fzZJ8aEysHGEA+AQrIWtv3hW9F9uj5Vhot/dlNICfVeLyJuHnPmnSKukN?=
 =?us-ascii?Q?mpWUVEbAnK5F9hSqyrpcJoMSUItWaSVH3Ufg80DHxTx5vjq7WNw+bTODtomm?=
 =?us-ascii?Q?p8cQatXItwfATTK+xR2XFc4lCfSdja6kmj3lkuMfj/AYKA9iTrkZoq7PF9z8?=
 =?us-ascii?Q?zGcB5Xahl1N4BPg84m5QKpyNKm9ELM9z15ZFCnox9+Z5vD7ig8//GSV2rz6w?=
 =?us-ascii?Q?dME9g/Z2dXoTvlS/h+aomP9KDu+vwHi/+IXIKZ76eRHBUXevY1DjwB+NUWfT?=
 =?us-ascii?Q?+YC5Q98E1s2Kk4QeFdZdO9a4fyTkaVJTd4cuI/YmUQSkor+PHIBc/JRlYbYX?=
 =?us-ascii?Q?6lQLv6scItkGOIxAgvnkbC7VbgpywEKaD9E1qfQTQoozWRUrEN5jia+F3QRJ?=
 =?us-ascii?Q?7sLUwHnY5aPCHZOM56J88c4h574Mo/4SnsLyNIZFApLsm1HWQeED3pmQBuHE?=
 =?us-ascii?Q?Sss8mEXPSurAuuwTRi+9LNdrXzi3/lw3kNVwHg+SExvgBm0YCdsbART9ziAy?=
 =?us-ascii?Q?dSfRit3420o8lERsEgBv9c2Y9nYZrl7Gy5RSli34VZl9OFltT+84L/ZT9SLh?=
 =?us-ascii?Q?JkuX77eeBbUeAFIjLO1Ph7h7zdyOYJPHDVuK4GAORWxFVPFaV15d7AB3/tea?=
 =?us-ascii?Q?97Iu358vHhVBsV+0TTWwMfihaxM0Lor/PXCr2FaJ/9m+a2zMhTOY7fuhbzj9?=
 =?us-ascii?Q?DWZpsuYA3I+QeaFyFt3C4aNgSMPNxqlLmYkA8ziCUsnWkXQ0KHvPpP59Q1dl?=
 =?us-ascii?Q?jOwf4NuFjz00IFWAachT2NlTxI1KA2L4Vj6yUs1i4A18GSj3eGHQzfC6kfrI?=
 =?us-ascii?Q?bIiaaQkknxdb7ljupp5Bp1T2tIlSKp/teCP2bRN1PCqLHcAIgtLfC72q2s7u?=
 =?us-ascii?Q?vKF8J14ZIP2wqF1zTODN6HBArCUIUhZbCF73Tj4PZCkDaWphy+nwWgjT2GZy?=
 =?us-ascii?Q?bfwV3JsbDTx57Hz9OftwoXhd7NJdIOsr/RQcYm+zCaALBpxk2MolCod8UPk1?=
 =?us-ascii?Q?yJ+lH3aT4qa8oflqfgF/IMNo5xNj5f2cdT0mwQdxGEec9TPVFF12PNIspnhh?=
 =?us-ascii?Q?owXC5HWwlBpeeWcvJ+k3zDsoktiwe3TjQIVy05/QUTti3wtFMT2rNu2tvH1o?=
 =?us-ascii?Q?kzrG4E3mNnGR2+ASA38rPm86bMfCzjj8iN7UxppzpJA/kZJUWj6M2uzubq1R?=
 =?us-ascii?Q?BMCNFwWRTrWGW9IDPD8NcjLo9pvW+BTwVtsb3nutHMyJkbgNmRFvuMMTu6MS?=
 =?us-ascii?Q?Fx6XuNcDn6IoACTI6h1BE4k3ZCdkQbBILQrrV370fau56XAgjQCC07G7Ygjr?=
 =?us-ascii?Q?t4/2yzFTFQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fHWc+KXDvim600PpizyompoWChEDli0uuHpTDMSEi+737cJfxx9ZjZS/RH+tB7CHsZCDT4UhwrTRwnx0VMNJ76LClN/cYRl5sf93iOlGk0Zm16IA7Vt1FKd9NgW0WygUZE1HTc9YI94soMJ/rg1iJssfdqeeTIfIyYxRYFO6BRoexw5oRocAkh1Dj3lbCdkSQuaIeOE7SgfeXkRu42nfygWA+LnsXfhlXDcs1URZS1sq3MfS0j84KVo9xgHhNdxpLEnoYCfUD9LZqy9hHt+fDLo9xKiaV3l6XX1GFgXBlzX9SHL5I0aHjgym1k48EDqMZKX2waXpg5cplR8OBIrkHA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f51a20-cb08-45e7-2c59-08df3a4d9851
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 08:28:25.2037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1pcLZ/HD3I+Hlxj6ilyo/WUw3ccOgXBGMGAsBNj2C9//H/IVl4q2fVcyTyDWYpBpGmqzKS/aRkG9XQyIzsP0Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jeevan,

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Monday, October 26, 2026 10:49 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH 2/3] tests/kms_plane_cursor: reduce CI debug output
>=20
> Use DRM_UT_CORE in CI to reduce KMS log volume while retaining CORE

Saying "Reduce" is only accurate if you know the CI default mask.
Wording it as "replace KMS debug with ..." would be more precise.

> diagnostics. This applies to all subtests, including overlay, which repor=
ted
> truncated dmesg output.
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16960
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_plane_cursor.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c index
> 4b69f1a17..9c6aa7bf5 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -29,6 +29,7 @@
>   */
>=20
>  #include "igt.h"
> +#include "igt_sysfs.h"
>=20
>  /**
>   * SUBTEST: overlay
> @@ -322,6 +323,9 @@ int igt_main()
>  		igt_assert(ret =3D=3D 0 || errno =3D=3D EINVAL);
>=20
>  		kmstest_set_vt_graphics_mode();
> +
> +
> 	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> +		update_debug_mask_if_ci(DRM_UT_CORE);

Apart from this, Changes LGTM.
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

>  	}
>=20
>  	for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
> --
> 2.43.0

