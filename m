Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73635D0BB5B
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 04:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F9E10E89A;
	Thu, 24 Oct 2024 04:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPBWBk+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7504510E26C
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 04:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729743200; x=1761279200;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6+dkFW+x7LeRREZ/wPiCjyAfKOLNGL6v22KPJ15ZgSk=;
 b=DPBWBk+Nr/T3CN2P+hnJV/JRzkL0RZavfjgwYP51Qfp3/kGLuFqdqTXV
 gl9PlFcexOEKyGqNk2Zq9sEqYEg1blxUq8eWTjwwPWfUjgDs2CNbIafMF
 UbKfjXDKxuW84ow0SydPUSfuw5AXQdz9PWcYqUMVaKdvRMYHu5gRSX5Mg
 88z2+xLFH/M0mbtbPsk79XdKcHXJrCQRJRappntGPePtRx72iMNyOeJ9S
 0yRRIP+uaaXFZ0HkI/S6PLW2u1yYp+BKn6mc40nj5yjBXcy2GvfngnDVD
 //wVINCUAIK0OPbikh3aW7zedKwyvhvzSu7oMOF8FYSNiOp78du8Sn9RZ Q==;
X-CSE-ConnectionGUID: y2oCxy1gTmuaarndwg/E0g==
X-CSE-MsgGUID: m+X2sjesS+i5sRG7kgQMmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="32219745"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="32219745"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 21:13:19 -0700
X-CSE-ConnectionGUID: mfpS+CO6SPGgPaIhO4206A==
X-CSE-MsgGUID: FT6w491AQlWkbUiL0vKogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="84439937"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 21:13:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 21:13:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 21:13:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 21:13:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpNWilE2iNcSYtcyoHGdIRHRc4RB4PlTvsJE2ObPLgIj3RFugJ4VHTfTuJwpZveK+Tofh9pCn4NOe+pn0YOA6OkWdqGFq0Ct0LaKR10WlOc/UngMOY3xB+PfxZ0vcNh9BpjJQ0T7AoaUD2UBGNFruKX09SGzwDCSez93/2rHH9F8oI3wjNjPdFv+HFNni9f9CFSjF42uYGrCOaLI55esCOZfrvtegfLQfi9B6VVAFAEJrBToCRuCe4YbgKv0yA6JHdJBS/XYJlMZDyoHVVPKZlkHdF1RddVCPL7GI1blkmODusfLYoxMKR2emuvh8k/xyMlJb26NvOn4qdaDojuAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KUxBR+2nsaic1cSFIpncFV6/Q28QjVSdTKAjz5Memg=;
 b=O32w5DZGKMTibrcz3EHykL4WNDE0PmO7Y0mI7/LszcbAr+xbbWCmU8W9F3d7RNYz3xz7PH3eqoDRaWn81C2qq3JIGHXpiBV4sN/M8O/oVu7Dwt45sboBCXliktz4LyvlU5divUHMUEqTRQDlM8O43AFkFRAhdVrmbWvPACNdyOaZN+vw/XdPFjRmxxzZ2+dYFKQA50d8ShXBpYc/wmecZMNKKhK00zdPtwZXUVoeEelXUzjEcyqi5roy2WsTiCZYkF21GcSnANMjvV9J1rhFh0LL3POdR3IB3/R1oreQix0WSoKCwKt1KN+0AQqKOVZiBptBRxPMzw86T+qDyWHykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA2PR11MB4939.namprd11.prod.outlook.com (2603:10b6:806:115::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 04:13:10 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 04:13:10 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v3 3/3] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Topic: [PATCH i-g-t v3 3/3] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Index: AQHbJHvJQ4a/JK29J0y6yu9crEPX1rKVTDdw
Date: Thu, 24 Oct 2024 04:13:10 +0000
Message-ID: <SN7PR11MB67508DD58B8B79DCA39EF56AE34E2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241022121042.2295042-1-santhosh.reddy.guddati@intel.com>
 <20241022121042.2295042-4-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241022121042.2295042-4-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA2PR11MB4939:EE_
x-ms-office365-filtering-correlation-id: 53b153e3-54ff-426e-8884-08dcf3e22bee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?WNmBCMpbqEYLD3iBPf6eJRnHUJICTTtsWAGohGeJkmicpJ+wMbHX7vG6suZ9?=
 =?us-ascii?Q?6mCg6v8XdT+nExqoWch6NpwuBk+D8a2W7/Icf3hsV3bg0oSOFoAT2i1RbAeV?=
 =?us-ascii?Q?nUJ6g8k7EEZIBni9z8tzNVzte8piExwEuGisFn9FQlW3lNn70EYMME2+4LkM?=
 =?us-ascii?Q?0rY+2FNsTEOSsa8ypTyZVC5UJz6wfQT39NJbT2fjAy8YZbUWBQWA9eS+RU+3?=
 =?us-ascii?Q?8Xdht/LYYMC1fI51COspTtQbkagXMsl4KHReWz411R+BbNBMfLLnbF1qL2Hj?=
 =?us-ascii?Q?yhZnqhhSsQUmDYvdq44zIy6Q61BqFblMuJPgMGaC+Ef7hYAN3S9yjRF1BjvI?=
 =?us-ascii?Q?lx9ZUTCviIHaHoFcZTp5I6bAeUZA6EeXfBWbZMNJKTPspzdCFjObkT6H6bny?=
 =?us-ascii?Q?PvPmz2BswZX4N+RFuzdTH5NCjlK+aX1edsCDq54S0XMKjRJ0hXMRioBmx0Fu?=
 =?us-ascii?Q?fK0H6Tp9a65TZYTKVV+hqnnZAVxEE8VYaQ0ZtfDwKohezmJZEeBB5JFD9F8n?=
 =?us-ascii?Q?OgKJYGjcb6sUUKdQmCy1YO/e+fewPRX8FCYDaJzjN4PFbpzMxWLqSyGUk1u/?=
 =?us-ascii?Q?u0sfN8RhNNu/2TWOq4CQ2W5OUBUupDcrpP3drWSVr8oqUFjCqKUvZWozyIQh?=
 =?us-ascii?Q?C/QZaPWCLMox6Ku6XgWzGTygKQsFNC85xxBC+eNj9DZ/oldEz7RBnpB3ed47?=
 =?us-ascii?Q?5PWgUjDyES3NK3zhlEWO25kyKOvax4dhiFOdYz9BkPD7Jm4KOYRdTzGtQWRv?=
 =?us-ascii?Q?sUQxFKXhxvogbnSeKOknzt4Nj9ipsx81j0FoVKv2m1kWS7mkkvJj7Bn+IH75?=
 =?us-ascii?Q?yuUM0r3kq0Gm/nW3rC1XZNS2Xp18lksSmmWVmoR7KoFmPsdC+BZdH8OWc/29?=
 =?us-ascii?Q?eFOmWCSiEvksbHGT237ldtsgvEDLfcxXLKzlxKmVincuj9RCXKQJGygLFrhm?=
 =?us-ascii?Q?GbtvZAouGdgdyre99Tfhv1uuphoXf/LFryuLM57VJ1/eZwc/azAdgSkJX7vU?=
 =?us-ascii?Q?mJeDUSkRO1K7z8/gCEqlCIjOrAWXoRhhSVzxJYQBDvQfBzA9ZBN+tE+j6eap?=
 =?us-ascii?Q?pAwgHkmDJkG1a5/BuIAe3OIn2mDSTbW8hQHo0uJnqWh3K+jaf8XCzRFUxv1Z?=
 =?us-ascii?Q?OLzCAXkBIQg+4z7hqt0lU/jWDu6m55a15WphhqlYImNqbIo3t+CW0twPLlxE?=
 =?us-ascii?Q?E7Tdn3JoCEDWCfUPkMTnX6sts/N6SJuQ4Fms+rbjvOJnun+uliMVTTuTncjO?=
 =?us-ascii?Q?y6SDpnKEBm52wdRtfYjMEd8YtTgr7aDZ0MxNQKMV3YXQVFG0oibXG/vnsAps?=
 =?us-ascii?Q?AbZd+CCebZy1C0f7SF4Ii8SetdsqMtitQOioWveOlPLzrQqtoX2j9lZ7FGq/?=
 =?us-ascii?Q?WOc6QVs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0WrKqxLBKZRVnLm2M/VWNoIIZlwrztg/dplzyJez2sO8hXmP3q6OxYa1Fxuz?=
 =?us-ascii?Q?/LsnTQxTz4fLLaMkSrmunhJihxCrYSHXdt72g7Xa1vxqpwjG8MC/OpjE5w4R?=
 =?us-ascii?Q?LyfR8ghkL088ynG1wNrKfD96fcb9NkVqopUoG98ALlTS76723nsAm3fcvKuQ?=
 =?us-ascii?Q?ob/k2p40BC3ECD2YFSxmIhvIl9+oHH9ZWo0VXf373c9wNR4zemTcOIWX+KyA?=
 =?us-ascii?Q?hMTODgDdVeJd9uh9WrcxQ/4a7jUgwj4WO8D820vf0z4KtHrOvOwHHU+YP4H9?=
 =?us-ascii?Q?U1zal/222TiWwevMKqL9/TYZ5RP6Eeo0goGgZPvPPjePEKjA8ei2kh8uX/8l?=
 =?us-ascii?Q?iv2v+wVSt3t5Y060/26sB89tiO7X5UoRRrWUTtKedyQiZ+qCiQLBAnXzzG5g?=
 =?us-ascii?Q?yCqnud5nVSUch2GNOPBfyjQO8B7kBKRNDGPOe+KreZ365jD9CnEFwNMv/l+i?=
 =?us-ascii?Q?R0ViEPEnFW0GTgucLnUQTh/E1HSWxAdsgzj/gIFUoTnGg2+oAysX/Ou1WcGH?=
 =?us-ascii?Q?jtXzJcH9IahSPy0UrXyHMzZLMUCcspSx6XJM2/ADqiLHG03GXfGe6Mnzpz9R?=
 =?us-ascii?Q?p6aGKsKueovGtf75e9ofgsMjVaXdN45g9pDw/fa2sAx88IL4ZSoeLBkauc+n?=
 =?us-ascii?Q?aNO7/ay8aQpCEN9a38pdO1NpANg+P12lAcGWbsYt6VEIwZ5o6SO5a5v9ZRK9?=
 =?us-ascii?Q?PQKUtvXcgQ3GkCbg0slW+3fFuOkc4r14H8TY9H8rvxgvMxoGlyBMAJoBt69O?=
 =?us-ascii?Q?X0FjCFfVcT/mchHeksdWSn3Xf0li5SWkQwVDVn8h4IvCI/TPzF+dnkApxxap?=
 =?us-ascii?Q?QweAj1puyuZ/HQHWxKaBDCkOIrMVfXf9OYwy6h9LAf3PDQYlyP5w9d3vyZuD?=
 =?us-ascii?Q?X90PvtWcegmwlqDNr+UmPBZnVTWLj27aPE7R7XAl67nnPDBCHY+SifvJk1HH?=
 =?us-ascii?Q?dliGfA8EiRcqSwjfp2he/HESQrxSPHpvfV8zlYRhbL/NgmmyJfluV89Erv6y?=
 =?us-ascii?Q?VtoFHHw/w4KbirU3N/3cA/7T/s/anldFxhEOCXbjdkXnFRHSRGD4+i4d3rGG?=
 =?us-ascii?Q?oXPpw1k+Enmlanc4/mCGGxQGoqFkg2MFlnznXyatzWpOlUey7q909LwVLSTh?=
 =?us-ascii?Q?2Mhc6lwmUEVz/jnJPwU/Gk+cU8P8heN+aZFr7x+48pLTUGD7oF+LlfxEtlVw?=
 =?us-ascii?Q?WPbUxLejNGIJPJpGpxDyTNYzz2+0dEft8o2oTy+BNLCyGJui5WeMUEt16b+2?=
 =?us-ascii?Q?F2zTxU1aw9Yq5dYYASwNe6QlxJFGF2a4oaQ+bLyrkbnxzNZjV4KVTlSfMGRW?=
 =?us-ascii?Q?rOE/UJ6frfWc2GJaHNIkTXK+0uJydWcAPNPmZQCiRw765O+d7vpWz+WXPIO1?=
 =?us-ascii?Q?7EeOyeuuBsmkD0BXdHgp0bKdwmWtc9sFO/dUQnpLftaTGXilocnFNlRM5cjw?=
 =?us-ascii?Q?Au++8qmiE5axqp217v6VItJdig1sjus30pcIfjfuemVqDO+w13MfMcUIvsnq?=
 =?us-ascii?Q?R7ODaCw6kcEIO0i5HUIvwtXrXMvoQE8HYyt4+I9QaV8UufERlwKLe3jaSot6?=
 =?us-ascii?Q?ccG01k6cQUHulO26FFuRE6Xw5I//BV4jQwQvSJ5h?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b153e3-54ff-426e-8884-08dcf3e22bee
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 04:13:10.4953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6GPp8/L7URmJRaKsQKCZ4dcXKJfwo0C+btMD84dVR4SHfrE4db6JDBWKFzS5qZ66p6iC4CclHxzBP50Yiq3SXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4939
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
> Sent: Tuesday, October 22, 2024 5:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Samala, Pranay <pranay.samala@intel.com>;
> Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v3 3/3] tests/kms_hdr: Test brightness manipulation=
 in
> HDR mode
>=20
> Add subtests for backlight control on hdr enabled edp panels by changing
> brightness via sysfs.
>=20
> use igt_backlight_read and igt_backlight_write from library
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_hdr.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index f123c6b36..be55fe646
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -64,6 +64,10 @@
>   * Description: Tests static toggle with suspend
>   * Functionality: colorspace, static_hdr, suspend
>   *
> + * SUBTEST: brightness-with-hdr
> + * Description: Tests brightness with HDR
> + * Functionality: colorspace, static_hdr
> + *
>   * SUBTEST: static-%s
>   * Description: Tests %arg[1].
>   * Functionality: colorspace, static_hdr @@ -81,6 +85,8 @@
> IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>  #define HDR_STATIC_METADATA_BLOCK       0x06
>  #define USE_EXTENDED_TAG		0x07
>=20
> +#define BACKLIGHT_PATH "/sys/class/backlight"
> +
>  /* DRM HDR definitions. Not in the UAPI header, unfortunately. */  enum
> hdmi_metadata_type {
>  	HDMI_STATIC_METADATA_TYPE1 =3D 0,
> @@ -100,6 +106,7 @@ enum {
>  	TEST_SWAP =3D 1 << 3,
>  	TEST_INVALID_METADATA_SIZES =3D 1 << 4,
>  	TEST_INVALID_HDR =3D 1 << 5,
> +	TEST_BRIGHTNESS =3D 1 << 6,
>  };
>=20
>  /* BPC connector state. */
> @@ -448,6 +455,30 @@ static void fill_hdr_output_metadata_st2048(struct
> hdr_output_metadata *meta)
>  	meta->hdmi_metadata_type1.max_cll =3D 500;   /* 500 nits */
>  }
>=20
> +static void adjust_brightness(data_t *data, uint32_t flags) {
> +	igt_backlight_context_t context;
> +	int r_bright, w_bright;
> +
> +	snprintf(context.path, PATH_MAX, "intel_backlight");
> +	snprintf(context.backlight_dir_path, PATH_MAX, "%s",
> BACKLIGHT_PATH);
> +
> +	igt_assert(igt_backlight_read(&context.max, "max_brightness",
> &context) > -1);
> +	igt_assert(context.max);
> +
> +	igt_assert(igt_backlight_read(&context.old, "brightness", &context) >
> +-1);

No need for extra line above

> +
> +	for (w_bright =3D 0; w_bright <=3D context.max ; w_bright +=3D 50) {
> +		igt_assert_eq(igt_backlight_write(w_bright, "brightness",
> &context), 0);
> +		igt_display_commit_atomic(&data->display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		igt_assert_eq(igt_backlight_read(&r_bright, "brightness",
> &context),
> +0);
> +
> +		igt_assert_eq(w_bright, r_bright);

Same here

> +	}
> +
> +	igt_assert_eq(igt_backlight_write(context.old, "brightness",
> +&context), 0); }
> +
>  static void test_static_toggle(data_t *data, enum pipe pipe,
>  			       igt_output_t *output,
>  			       uint32_t flags)
> @@ -483,6 +514,11 @@ static void test_static_toggle(data_t *data, enum
> pipe pipe,
>  		igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown
> EOTF [0-9]+\""), 0);
>  		goto cleanup;
>  	}
> +	if (flags & TEST_BRIGHTNESS) {

Add a new line above if=20

> +		igt_require_f(is_intel_device(data->fd), "Only supported on
> Intel devices\n");
> +		adjust_brightness(data, flags);
> +	}
> +
>  	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
>=20
>  	/* Verify that the CRC are equal after DPMS or suspend. */ @@ -685,7
> +721,8 @@ static void test_hdr(data_t *data, uint32_t flags)
>=20
>  			igt_dynamic_f("pipe-%s-%s",
>  				      kmstest_pipe_name(pipe), output->name)
> {
> -				if (flags & (TEST_NONE | TEST_DPMS |
> TEST_SUSPEND | TEST_INVALID_HDR))
> +				if (flags & (TEST_NONE | TEST_DPMS |
> TEST_SUSPEND |
> +					     TEST_INVALID_HDR |
> TEST_BRIGHTNESS))
>  					test_static_toggle(data, pipe, output,
> flags);
>  				if (flags & TEST_SWAP)
>  					test_static_swap(data, pipe, output);
> @@ -734,6 +771,10 @@ igt_main
>  	igt_subtest_with_dynamic("static-toggle-suspend")
>  		test_hdr(&data, TEST_SUSPEND);
>=20
> +	igt_describe("Tests brightness while entering and exiting HDR mode");

You are not actually testing brightness while entering and exiting only whi=
le you are in HDR mode
So the description should be " Tests brightness while in HDR mode "

Regards,
Suraj Kandpal

> +	igt_subtest_with_dynamic("brightness-with-hdr")
> +		test_hdr(&data, TEST_BRIGHTNESS);
> +
>  	igt_describe("Tests swapping static HDR metadata");
>  	igt_subtest_with_dynamic("static-swap")
>  		test_hdr(&data, TEST_SWAP);
> --
> 2.34.1

