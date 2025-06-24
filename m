Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE35C71157
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 05:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A16010E4DF;
	Tue, 24 Jun 2025 05:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8zZXeKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C1110E4DF
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 05:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750743964; x=1782279964;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4H4AYaYKhXO0YJwFhbD5BpOZPmhIosYbhqDfc9ezveo=;
 b=F8zZXeKhtA1GAaSU7np6gBexROD3tIN0WyN6nmhf4ZCnrcxzwbjxJ6jt
 hf7KdqWIT024XJV0EJnQm4++cRRPPIfLJasTHD4dZJCT8urVNBfGA92g2
 3VNUEI38q8gtvDeXbI9hqjnwxUyMCmdrHn9PjMd2kSa4QnXAlBAbGp9tC
 gPJ2/V8Cey5hUnZoSRq725hBz3OiW0NZWwFKak6WAk57lEbIrTw64ijB2
 kVlh/hGIupSnKTkj0secOapTGpeXZvo6/HzVmyz5HhyMTkmInSYH2FCop
 fiDXr47EdLKp+lKgPe8lD46lsZIHmGTZZ8aA3V+GnYA5zU3uArdGJkgQK Q==;
X-CSE-ConnectionGUID: Hg5ifkAhSEec7XLVAtZbTw==
X-CSE-MsgGUID: NGu73VuwRveZvgLqPNS+DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53101851"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="53101851"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:46:03 -0700
X-CSE-ConnectionGUID: bDW4GNZ9Rou4mx+3kLJbUg==
X-CSE-MsgGUID: jEBPqHmWTkOWCPCzPOGmAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="156108856"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:46:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:46:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 22:46:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.75)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQDMigkFn0GqVDTYT3AcsvEYNZ4p+0Y9tbCrty5TmmQr5zjVb4g7BK4zqo3xNjWnWz1ivare47QqQiRxo8TUUn/i75Wm7sihzxU34xZrF2plKo6xVg27SO9smYunFpth5b5UqVTGwryqoPp6Tr2oAjIvvWZX6T0+BtNPlitslCvyLFMo+he4y1GwavY3/y3H4RQMQt3Whp93pnL1mpcFlEXIYIdA1SMQh3Mt/2BY4WaPxtMLYqT80v9DyoKa7EglImJH3/tiTrmBqsKTutRY0MlPHMl75Y/UttN5OWdUUgTjf9EUO7vA1OKT5rEAVZkX4nODjVZt2iPVFGAQ0VjkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhuOp/+E3rw2uRXe2T7A28m+Iac55uDFMUVXw+Wp/Jo=;
 b=tQKHOWkYQ1x+L72vF/nnx5Clz5pgkCbbqHR0BaYkvKyUxYZcOwZWPVUE3AwRHyKFOlsxch3WYcQKaktOycpJgo10aVqdHYbqgQIg812/+9KMzFz05VBTOjxBs8zsZxakv3hLS6EMELhsVLdyqjPPy3k1TFp5DsmMhie/W7L1yUGD1ChJP5PHjY2LkTMSNDQ3s70jAgprTWCICVjwYdfzOwh1SmPbn+xggLsuSMy1KtGkEtSNR3kXMUe9izdnIoVOEuFgEmCQz+MO2X/Wc43Qcw1DYYOh8RSrM9mUGkQpySUDxrNY5EPTXLNElwbd5xvMrY9E92//nsr8sqpAAWwQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH0PR11MB7542.namprd11.prod.outlook.com (2603:10b6:510:28b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 05:46:00 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:46:00 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 2/3] tests/kms_async_flips: Add hang subtest
Thread-Topic: [PATCH i-g-t 2/3] tests/kms_async_flips: Add hang subtest
Thread-Index: AQHb4QyoYzuoXrHa1ECY2xz0sWfkM7QR03ew
Date: Tue, 24 Jun 2025 05:46:00 +0000
Message-ID: <DM4PR11MB63127DB8D6E6F7D988DF7B4B9078A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250619112334.744213-1-karthik.b.s@intel.com>
 <20250619112334.744213-2-karthik.b.s@intel.com>
In-Reply-To: <20250619112334.744213-2-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH0PR11MB7542:EE_
x-ms-office365-filtering-correlation-id: f6fcd10a-6e1c-4dce-fe74-08ddb2e2662d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dlMYgFJvwR4BSA64+iQO9NSgtegTaIRKMNBKhfnItTTNwA2wSLLP1tzw3QP1?=
 =?us-ascii?Q?auFEOuIHt/S4Tmjk8RXbL2ebtM2SguYyhVKgjsLQgZhZYM+NxFvNus03zjaQ?=
 =?us-ascii?Q?Kn8s5iCt9NWd91lLYKot/RCN22XiPNftor9MbrHnUlSb6d5fjAE0iWEfwg+/?=
 =?us-ascii?Q?weFzjLToQhzjC0ooVSBUQpKFxpn7+3Pq7M6iCLPfwuBZQO4Asi7hAhj57BCD?=
 =?us-ascii?Q?mDhauCSxxiFMVnI/zspbqa4TqfhVRO8/DFK1B3V2dYnRkbSzq2adZu+uNld5?=
 =?us-ascii?Q?hh+R7DXxRkmZ9ixTxnl09tcq64F/YFC8H35VJqzd8Z9Xc8WqjNqiuZ4g9BzD?=
 =?us-ascii?Q?6CAyHMOslR+v5JTaUlpzqtqkLr731HGDSAaXjtFiD2WK7HJEwGO13rz4J1RA?=
 =?us-ascii?Q?2octg9Z+1T61ln0yc631PATL1LowbV6o/oy8YUf2+kV09873MgqEErC9r1ic?=
 =?us-ascii?Q?70r/Mub6bZomRec/IDn29bdaV3LiBuI14romUcXmJeYQ0UwXLcca/W3eH1xJ?=
 =?us-ascii?Q?La5cODZKZJ1EwoA/7Jc/9RTwZ1NyVOzTd9GpsDYQ/U6TBnTandTnD7qqMwHM?=
 =?us-ascii?Q?BjCiJo9piueyV5VzfalCwD7bpg9D3wWGtHXYSWUEkFtTsXcfKUjb+APeRMJf?=
 =?us-ascii?Q?Fm/bX3Mry+BaAUteU5V4tfJb5kOT/cJzjoixzPjuT/Z/YczfcuipSJrM712H?=
 =?us-ascii?Q?7YjrVt6Ik4qqIWtI92oZt5J+epbjhQ/MVpKFsb9DUvRW/8cl1OvTc8oAUIdC?=
 =?us-ascii?Q?8nsUT1TGoI95qHZo3LWcr5V7XoVkw4Dgr1RGJ/6OOR/L+ZJfUGyiWdrI+lL6?=
 =?us-ascii?Q?zWVvBqxQDhHLW0W3AG3XI7LPK9n2jfAt+yzi8sl0fu7kYwRcVds2oDqgG156?=
 =?us-ascii?Q?kURL3PLjTU9vnnePeFK9YGHryyd/2Kk8AV9fvJmlIN31Hws562H7QuGSnLB7?=
 =?us-ascii?Q?QJCr2ecQfxPTmF0fKECp9jQvaKdusBu02hxlaCGFcMm5/yM8onPzP3vjNf03?=
 =?us-ascii?Q?NWyWQHpeok0pSYgqkVuYi7607fMNdA3X3Fcp4dKQoLnGNfzQRZdl945OaOsD?=
 =?us-ascii?Q?yhS0ZX+tn9EMGaBgjljAnNUnNVAKLn9y0p5BB5ultPl+/JKxHWjQw+u424HZ?=
 =?us-ascii?Q?KrPWzYV+b7wIW5EIWp1VYSIWy02Gv5vKAkTnazgzvwDjI3QB122NFIEqw61B?=
 =?us-ascii?Q?jOFWo0PPrC98sVJgzWLcWP8yDrVWKQlXihmg/jmF+zWPSE5uKQiqtczay2y6?=
 =?us-ascii?Q?P/KzxO7G4z/VCLmKkbsEIx/TGImLdARLPlZnB2zxCHhjRPdzshDw/NVn7t3S?=
 =?us-ascii?Q?vO5lfyKTwEemkBup+OrWSQQyVhN3snQAsvaksKa6RcW8uNO+meb9SWqTWto5?=
 =?us-ascii?Q?bqBc6QW6bb+a+7+sLgP/0ak4ew51aSXWk8g+iDu9/XVxwOL4ZumpXnAxvXxF?=
 =?us-ascii?Q?JHdCyYkPBMa3j8Db4MjbtVXY4UlHyJnGFxh9LIpoGQmmYJ5XwdLr53vF8HgB?=
 =?us-ascii?Q?uVSmHi4XVtLE81o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1H4/BLnML9YT/Jr3TJxIf+PQYIcz9w9DUDVC1J7fzEHRo+AfFCnfQgE99yKC?=
 =?us-ascii?Q?lqKDBs1HvGBCjnEooJxBtaiSHYcb1/YR0eQc9sFLHg1iKaM0d8UArZ640sug?=
 =?us-ascii?Q?Xp6QRBsIE+MoIcH5+2hhIrBUhce5eyhB14fj6Adfdc7UB06LI1R/r6hMSXVc?=
 =?us-ascii?Q?lg7wGwnHx3WaM+3QzT/FJQh7yajqM8Un/C+nbUfHwnMdsUDOXdVAEbHVu/nl?=
 =?us-ascii?Q?tfeX98UFfjXOp/ADrn7ZgEVWQxAeynRXdXMvBm8k7piIt8ZYaKI8fJpwQK//?=
 =?us-ascii?Q?8Ss+bjdJwNV6SfyU8ueWxTcBodpz18dq+vHJN2AO1UclHAMxXvWOc9ig3irq?=
 =?us-ascii?Q?EfyOXENDFgk5jhnUIi1MQwRFuBbMljAECzVjPtibSNoPddb9ljfrEW/pr0yO?=
 =?us-ascii?Q?DZiwd/lxGxA9VNXkLyNbnyG8821DmRZzj4/jXRa8krdhuLrWZBbiNWnN9sHh?=
 =?us-ascii?Q?1wPBoDD0+Z8BPp0OcQiY8bGe9rTMvWNpeY2b/HDhvyHgJirpVXfD5CSAG8oS?=
 =?us-ascii?Q?EYhzTexCmiBc7GMij7GHZ0PPxCBjsOgPskZDJqS4D9VK7R4nbPCHF+MpQncK?=
 =?us-ascii?Q?k7h5u02BT9UcEZE5PBgvpUGJ9O6TPPf7hVr0y+tV2ikPVaDJcTqmdmBW+Ky6?=
 =?us-ascii?Q?QBCr/3KAETtAMtNoSX91ry7WARTi/JxVFaXUwTRHSeYbZBW0CmhK6IJN8JqX?=
 =?us-ascii?Q?Pdv64QE1q0hjtXnzYByOe8rE/v0hQZkcrJmifgUKbOM2R+RQvKYoG6YMfIzL?=
 =?us-ascii?Q?3OvHPF2NRMpTBQo07Yh8Rw9/HegExIa7IccEjaCwa6XvG2c2lq2jDYW1kdNR?=
 =?us-ascii?Q?el/C/lH7YlBDKkPi6Z6vps4t9Ria2bx//exwf0MbuHhbG2NCrXhAER0NVoYN?=
 =?us-ascii?Q?2JpiBPig0plVp85mJ0s2loqF+EjshVIdn1vfG/RAeKbFvpfdo2exEiV1kypu?=
 =?us-ascii?Q?4+PSpMqDvqQGEz41HlqbLoNhYBPfgbyZWlq411V/wNq6vAvMgDRxf8jhfuqi?=
 =?us-ascii?Q?wpA8VjTa3y0W9ISSZb/dVGTGaxKdS8Pt7GGIaB5dp0ihKlstvp7EPRuD99WW?=
 =?us-ascii?Q?Njt88YoYBnMY18SHMpEsgMY5CguGelqDSutk2dmwjMfY4GeOMQm5JkP06v9+?=
 =?us-ascii?Q?v2awQ6YDMxm59ON2f9W4G91QFuKsv7nVgVZNsdkUaR+b2tFIOpGlAfUN0L+T?=
 =?us-ascii?Q?1waYXbBeL6OvVChwaz7L3tkkUQLeku3/rs7evujvtDZsrGDOGsBpT76BGEnX?=
 =?us-ascii?Q?BB7lcWiRs28zX/v20ajmb4RxyuPI4ITc9geIkiXObFDygtBI+UN6+UOCu5uM?=
 =?us-ascii?Q?UaFZXtvX9GYEgNFbaO+lvq/UTMkODEP3WOTdebIHrFXJZPV+dLG/dHSpjRO9?=
 =?us-ascii?Q?Q8UYGSZOECHGsmyZsdRRX1jH5dGpWSyTdEWqwg8okU5RNAe/NKM1GkUu9Qhu?=
 =?us-ascii?Q?yJWo1+/G2spWCXXvV+33xKj+LTdBXkuqVS/4s4q/oUkGEl7C179e1EFf8xY1?=
 =?us-ascii?Q?hA4XjJY/qjgr64ta1UXk4ASoVf6lWriQizXOlzd01kvoUOTYUzrVROPtfWmr?=
 =?us-ascii?Q?2WvbjmJpZpBjiG5OU+Ig/zPEibIYOqzDZYNAJww7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fcd10a-6e1c-4dce-fe74-08ddb2e2662d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 05:46:00.2948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/hdI7Z9/HqivBLVu8uWB5Zrg4NgJwJx0hDSE6BsAB3zXrayPrTYiuUFDvwMchlz665Jr7oabjKDWoe8JahPrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7542
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Thursday, June 19, 2025 4:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Murthy,
> Arun R <arun.r.murthy@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t 2/3] tests/kms_async_flips: Add hang subtest
>=20
> Test functionality of async flips with hang.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_async_flips.c | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> 0f2d932e4..8587e4675 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -86,6 +86,9 @@
>   * SUBTEST: async-flip-suspend-resume
>   * Description: Verify the async flip functionality with suspend and res=
ume
> cycle
>   *
> + * SUBTEST: async-flip-hang
> + * Description: Verify the async flip functionality with hang cycle
> + *
>   * SUBTEST: overlay-atomic
>   * Description: Verify overlay planes with async flips in atomic API
>   *
> @@ -132,6 +135,7 @@ typedef struct {
>  	enum pipe pipe;
>  	bool alternate_sync_async;
>  	bool suspend_resume;
> +	bool hang;
>  	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
> @@ -376,8 +380,10 @@ static void test_async_flip(data_t *data)
>  	int ret, frame;
>  	long long int fps;
>  	struct timeval start, end, diff;
> -	int suspend_time =3D RUN_TIME / 2;
> -	bool temp =3D data->suspend_resume;
> +	igt_hang_t hang;
> +	uint64_t ahnd =3D 0;
> +	int mid_time =3D RUN_TIME / 2;
> +	bool temp =3D data->suspend_resume || data->hang;
>=20
>  	igt_display_commit2(&data->display, data->display.is_atomic ?
> COMMIT_ATOMIC : COMMIT_LEGACY);
>=20
> @@ -433,13 +439,29 @@ static void test_async_flip(data_t *data)
>  				     data->flip_interval, data->refresh_rate,
> MIN_FLIPS_PER_FRAME);
>  		}
>=20
> -		if (data->suspend_resume && diff.tv_sec =3D=3D suspend_time &&
> temp) {
> +		if (data->suspend_resume && diff.tv_sec =3D=3D mid_time &&
> temp) {
>  			temp =3D false;
>=20
> 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
> =20
Can we add a comment line describing what we are doing here.=20
/* Trigger a GPU hang at mid-point to test async flip recovery */
With this minor suggestion patch LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>
> +
> +		if (data->hang && diff.tv_sec =3D=3D mid_time && temp) {
> +			temp =3D false;
> +			memset(&hang, 0, sizeof(hang));
> +
> +			ahnd =3D is_i915_device(data->drm_fd) ?
> +			       get_reloc_ahnd(data->drm_fd, 0) :
> +			       intel_allocator_open(data->drm_fd, 0,
> INTEL_ALLOCATOR_RELOC);
> +			hang =3D igt_hang_ring_with_ahnd(data->drm_fd,
> I915_EXEC_DEFAULT, ahnd);
> +		}
> +
>  		frame++;
>  	} while (diff.tv_sec < RUN_TIME);
>=20
> +	if (data->hang) {
> +		igt_post_hang_ring(data->drm_fd, hang);
> +		put_ahnd(ahnd);
> +	}
> +
>  	if (!data->alternate_sync_async) {
>  		fps =3D frame * 1000 / RUN_TIME;
>  		igt_assert_f((fps / 1000) > (data->refresh_rate *
> MIN_FLIPS_PER_FRAME), @@ -1032,6 +1054,15 @@ igt_main
>  		data.suspend_resume =3D false;
>  	}
>=20
> +	igt_describe("Verify the async flip functionality after hang cycle");
> +	igt_subtest_with_dynamic("async-flip-hang") {
> +		igt_require(is_intel_device(data.drm_fd));
> +		test_init_ops(&data);
> +		data.hang =3D true;
> +		run_test(&data, test_async_flip);
> +		data.hang =3D false;
> +	}
> +
>  	igt_fixture {
>  		for (i =3D 0; i < NUM_FBS; i++) {
>  			igt_remove_fb(data.drm_fd, &data.bufs[i]);
> --
> 2.43.0

