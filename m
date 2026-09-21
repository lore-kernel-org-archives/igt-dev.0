Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9ACC982DE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 08:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F5610E39E;
	Mon, 21 Sep 2026 08:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifKN9pwc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8AD10E359
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789979969; x=1821515969;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FExHD+enr/CZkCpvTdGKorkr+f6ozuhtzGJ+Uh9wCa4=;
 b=ifKN9pwc19Zp2KKA64ZMyZoIoo6P1DVJf7t6NdWDS2dt6so8uFNRhsQE
 LOR+8qn7kSrvQgKSXtnCXm1uUw9+gXmaf5nXvrCXKTnZO1OpJNqX/Ahtn
 GjDtUmDoZPaiBl4i9LYmN1WPIzILGRiIK0xIv0NzojA9a8QYBIY2EfqhL
 44n9Jbw1U9TqYPhJxLwuEp0q69CQV8yAOQXO+FxNo1n4p7bPnd8Qi6ueK
 XscjocUsBFb8la1yH21k2dgvykp1IT697/Q5xWsddxhx6/ErvuYB0pbuA
 dp5W39HCHI+2aNovEeoWr7lzVx0+uFkzHMyBDJiDdRjqzdTuKyIlMtKcU g==;
X-CSE-ConnectionGUID: VpObRU58SJ2SPyLg2bmeqw==
X-CSE-MsgGUID: dbI2sLfASeus4CE49AJuxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90345631"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90345631"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 01:39:29 -0700
X-CSE-ConnectionGUID: 10HtmOFkT2C/r26b7vP44A==
X-CSE-MsgGUID: jHmZktB1SbyBOso1cAA69A==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 01:39:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 01:39:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 01:39:28 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 01:39:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+yBFuKKOgKd5pLUa3jkQY1JgCJUtskwh4Z5BPamqX9cmfD5DHfNROLvoI+kPion5jUpZfnjaoMVv0H6aLWnMX7siHvLdMYWYcAFGVGV2Nx0JDpvCFXLDbJNdlTpX1pEZsE7gFKBkgimCvUJrpF98EThLssB9Z9au06S0d/K2h6x3dAgUE1WzLHx7VZKw5WXnAkwXs4SopnPmI6Ukk9sycjW20QSR0xRylO/OEGRf8UVjiBqctFPbqB4x2GT855/9NY+04AVUxmEIv8E/ZeJ1FM5/qSrzLsqlvt4zMulWfgDP5WV4LfHWPi1bGWbjSF7WK6enj8QDgruYfy6oO0/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7JsdMUDGd0y+aQ7IED5kq/K9WjqdgMuoyf2cFjO5vY=;
 b=ST0Ww0LKd/PCnF6Vpaos4CZauI5I7Vafhy95ingBWodx4RWezGWoAsbuKfu+FqMdeU6TQwIb/T0M57e1NAOvlxtmUeW669AigDukCPtfJgSObtcOjrtlzbhfevrUxMUINi8NTXRgUs/0pIXyQIoOGO4A7++5ijY6VZBq3qH3WDRR9/zkcg/NblEveeBhGQl93QfHpLjuBRp6m7CSqxz2f3SBwkb6NqPntpBn5Nn0Ep0qOq3PKs8+2qiFtaQ286+IR3PYv4HlglRFMgnvNe+7/ziP9IMZNd3BdJsxlhWKYU/+a8Fndi0yJe1zGG/mJmor/dX5IKCV9blXCm6Cc8CLTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by PH8PR11MB7989.namprd11.prod.outlook.com (2603:10b6:510:258::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 08:37:37 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 08:37:31 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 01/13] lib/i915/i915_dp: Add helpers for the allowed
 link configs debugfs
Thread-Topic: [PATCH i-g-t 01/13] lib/i915/i915_dp: Add helpers for the
 allowed link configs debugfs
Thread-Index: AQHdRZSDY81nH8XHu0KK5C/Wn/IF8LbYvYJg
Date: Mon, 21 Sep 2026 08:37:30 +0000
Message-ID: <PH7PR11MB6796647C713B934D21F37A6DE5842@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-2-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|PH8PR11MB7989:EE_
x-ms-office365-filtering-correlation-id: 6ebd42d7-ced8-4327-185c-08df17bb9369
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|10067099003|3023799007;
x-microsoft-antispam-message-info: 9W7/6ig5GSQBkR3fnN0xiDzDMujoojTwEQOzjfETVQ9pii4uh+A+UKRwGxTqg58rTYqZTLOrUf9aCdNAC1TU0X+gVUl6Il8roKdNA7c8BqYcBOARhGzyT7i40ahPa+CuF059EbNKjvk/aCRM7F/CtYRwcbfK7NIYvm4AFgKmgstaZyZcmFiSr79xfVG0rZQSVkdSyW00P2ru5RKBuTWKJKvvalYVViG95edH3gcQfdbFvW6hxz9tonlZMoJkjcEfHEdjJ27ONJEILP1uozRR2cvUneGcPN7rzUyUtMLXOcGWY4pSr4TTefXm03u2rq1QAWeK+0ZHx5Lf5Qt5jhCfTvQzZFZ+TWw00m5WhNdfi3uhZ2MtyxnMcx9Z3FvT1oYZpZnd9CjdH7I/tOn9IKf7bAK8nRoOCWuziXRYxoA34sIolq572IAB8T6x62wN8qTnzQeLbVyyT02X7XNB4q5LQWk0ZckiHVREWCo2CJgN8afsIRUnK+iUKTeb12NokgbEEPvUXkXe2LvlmVvMQkfx+rLBiMrh59ugNcBgsSa8TQa5qcOczCYL+Dc1x2kn+WBVbbQTC3+6eTyciLWzc6Qt2CDfXDQtr4iUgNesowCVaP30MMGun/apvYdsHfoEt2+ypeqEYQRbWUymGZ2/5L88Dm/baNmtUYxRIPb/+lE/CEAfgECEbLjd9lJYZXdR37lHQTVMCEJBE72l4SrGioD/NzbOF24Xagw6YVfn31ru/Tw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rvFS2rEDCidteHJPGJt06egVkT6pRXqsmbkEIzo5XDvZUmb84tLqTp77J9A8?=
 =?us-ascii?Q?H9gpTIVvQbrJ+RB8ExvN/caZqhVm1IX4rgY1zWVxKlQbZychMrwLTlsmy5c8?=
 =?us-ascii?Q?/hnSSsnkAEiQ7QC+gHqtb+En4KYGnTCodu8mnDSydwKBzrynzGxgQmZ5fO+f?=
 =?us-ascii?Q?JqOUm3ig4LGAt1Bq+6QOeM1dALBoQJEWEl2nVrj3NCPxdY7ONdxDRsf+ZVeo?=
 =?us-ascii?Q?opa7OjZFyTJZ7dU7TFwQLKH8fivl0zf9Ch5lvsh6yns22Rmznr70esAPgV98?=
 =?us-ascii?Q?cThecMjbFldzdDb8OmKtrlN/tG8hj8QE70OLyQlOHnQY4+k5HkJ5AWKZ6812?=
 =?us-ascii?Q?Tt76Pzc97aPku5dAyrMl1BaKWR7MjLcQRa0li+9x3+xY9O7OMn1j2oAqnPSQ?=
 =?us-ascii?Q?zmG/7HVfA3QQR1nF5q4wQP0DADvS9O+zVkOsJNJT9Mljt2urrOI9KGr33OPF?=
 =?us-ascii?Q?y34S9yjPdTkHbLhOn0dfYIWQBV0fVB2BwvPoPzPRltYaHqCGPRY0fxba8jON?=
 =?us-ascii?Q?43jvKlMzmzAxjQdHnYxitJfalDBG6usjuRjrNowcs2Kgh/8oTSaGu294umtf?=
 =?us-ascii?Q?UCNelZLdCURFjGq6i0f1poX6Qtmix89SUoFpIvsbZ+HbI59DIT0hACplIwPQ?=
 =?us-ascii?Q?MZ5JZQpAxzEpxO89cUk8f9EeO6f8g1gHxsQoRl52MP2JZG4u7iy+G+pDzjpa?=
 =?us-ascii?Q?7twO3bqK8odeGTpvGNZ6tur1XdrPl2KnmP3SEAbgwPg/m+1jXxHfvfNkmpDr?=
 =?us-ascii?Q?8B3BkQiWg0RzoLzv+vJ/q3lWSnx9iXeqgVoiLX7pB+2WGPmx+mmjRWtIjqbT?=
 =?us-ascii?Q?+C6ujgoCopnf5ebrYVwfKYUJT+Lspu5PaqrcrQ/fBD2FoMwJm2cODzVARnF/?=
 =?us-ascii?Q?EZt3VfUDJDJNAbn/uDlSV3OYzyij9+0DTZEg6Yi0vWJhVw6ZTzzXt10wNQM/?=
 =?us-ascii?Q?ReiVrUCGxgV9kwyNkb9TB2vjPXnf0YOpMK2Mzvanm2EJGdP3Nh9QLtWNGpbB?=
 =?us-ascii?Q?H8pBt41ElqYMca1ai5HJU9R420Vk+D/jLar9W7pw+j2lJPuj8JRqoQuUJ7Q8?=
 =?us-ascii?Q?IwCylDxv9AlDRKNzAtX0W7VuChs6OQd5MbwxS/gXhZkgU/ciKceGnpciUYo8?=
 =?us-ascii?Q?s9GM6C3rH+7jXfleAH6/X7vfJK25J/E8F2Pq1sVrUuIvZqvNLKk8remgfobV?=
 =?us-ascii?Q?Da0kOZ9+AKU6qqB1KcdbN/Kcuyezmm86kYUprUfu+OCiqgO8DeiORsgx+KAC?=
 =?us-ascii?Q?/evkTEzAeP33tAzrX925HJWS68E36Pw0SVuIfgd/9xajWmCfIqEuO84Etums?=
 =?us-ascii?Q?1fx2rLmDo37CXoWAgm6aKMoOutYbdKXCtTEoDTzp33gncFhJewhw4C1ttzJg?=
 =?us-ascii?Q?O0FkqEkwNeZDervCpYe5CX7TmE58C6LtHUW/iqIri/bZ+crHOghzvPeV5gYg?=
 =?us-ascii?Q?j6jbIMM9X1sxK3iBysZBoxMsGmyZ0TJraTxB12+DKb6p8nZlK7Ti84nrjIxx?=
 =?us-ascii?Q?vLcMNUTb/CT+TvHYAeWlFKObGcOD/QPUvxxo39Doo4SrsByM0KxL+BBxi8tA?=
 =?us-ascii?Q?oHvA6Jo1QbFNhCSLiV2RHhUy2qiPkGUaEH/RKDkEAGOD3hnk86jECEGGpMIO?=
 =?us-ascii?Q?nUy0IXAYRBwwbmFzuQQZPNMceLWhaUHm2xuv6cI+w5++dX22eNxZ5SEAtFNO?=
 =?us-ascii?Q?5YJkXidKNayTCpshXSsWUYy/ECq6tPuyx1mnc+wMB3URFVZP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sfIFXDjQTBJE0sbZqK/H2itvGQGHIefgC47R5IiCuh1hLcaFEiV7yh+g2YZOlh/XfGtaiFMfbEB5laLgXKDgxe/DnCYIhA+HJxeeBOvLxBGnLlWyAOcCWZdhGoERVJAjiZJOqFQ09ylQaNaxj5Qu8W0vfcTRDzwfa32p5gGNCHKpMb/9+j2JHUxuptTk/dRVM1+dGgf4j6WQ/ctATBvxUmi1n8tutqjdM+UChzZ+X54HlxTGnI9j/kZcMXI/HrMDfYsEmEwbFaWF0B230S8rBnU7lRmX76tItv15SK1OQCOYxviaF2+x3i7kMXn/G9ThMuK894FlK8Whbevo/zWLhw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebd42d7-ced8-4327-185c-08df17bb9369
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 08:37:30.9208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BStbN/HgsVaRLijDdcp50ugVZhwRnss6a2cv11yYBRt/GPnnGfhnhwKnGdBwMQeM+JaWTlX48x/YKui22K48+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7989
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
> Subject: [PATCH i-g-t 01/13] lib/i915/i915_dp: Add helpers for the allowe=
d link
> configs debugfs
>=20
> i915_dp_get_max_supported_rate() parses i915_dp_force_link_rate, which
> lists the source rates only. Writing back a rate from that list which the=
 sink
> never advertised still succeeds, and the kernel silently clamps the effec=
tive rate,
> so a test built on it reports a rate the link was never trained at.
>=20
> The kernel already exports the set the driver actually picks from, the
> intersection of the source rates, the rates the sink advertises and the c=
urrent
> link limits, as space separated "<lanes>x<rate>" entries in the per-conne=
ctor
> intel_dp_allowed_link_configs debugfs file.
>=20
> Add i915_dp_get_allowed_link_configs() to read that set into an array of =
struct
> i915_dp_link_config, and
> i915_dp_has_allowed_link_configs_debugfs() so a test can skip on a kernel
> without the file.
>=20
> i915_dp_get_next_lower_rate() already reads this file, but only for the r=
ate;
> the lane count of each entry is discarded. Keep both, so callers that wan=
t a
> single rate do not have to handle the whole set.
>=20
> The driver lists the configurations in its own preference order, which di=
ffers
> between SST and MST, so callers must treat the result as an unordered set=
.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  lib/i915/i915_dp.c | 81
> ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/i915/i915_dp.h | 17 ++++++++++
>  2 files changed, 98 insertions(+)
>=20
> diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c index 3d570f7cc..aba=
6aa8d5
> 100644
> --- a/lib/i915/i915_dp.c
> +++ b/lib/i915/i915_dp.c
> @@ -37,6 +37,12 @@
>  #include "igt_core.h"
>  #include "igt_kms.h"
>=20
> +/*
> + * The driver allows at most 10 link rates over 3 lane counts, i.e. 30
> +entries
> + * of at most "4x2000000 ", so 1024 has plenty of room to spare.
> + */
> +#define LINK_CONFIGS_BUF_SIZE	1024
> +
>  /**
>   * i915_dp_parse_marked_value:
>   * @buf: Buffer containing the content to parse @@ -391,6 +397,81 @@ int
> i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output)
>  	return max_rate;
>  }
>=20
> +/**
> + * i915_dp_has_allowed_link_configs_debugfs:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Checks if the allowed link configs debugfs is available for a
> +specific
> + * output.
> + *
> + * Returns: True if the debugfs is available, false otherwise  */ bool
> +i915_dp_has_allowed_link_configs_debugfs(int drm_fd, igt_output_t
> +*output) {
> +	char buf[LINK_CONFIGS_BUF_SIZE];
> +
> +	return igt_debugfs_read_connector_file(drm_fd,
> igt_output_name(output),
> +					       "intel_dp_allowed_link_configs",
> +					       buf, sizeof(buf)) =3D=3D 0;
> +}
> +
> +/**
> + * i915_dp_get_allowed_link_configs:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + * @configs: Array to store the allowed link configurations in
> + * @max_configs: Number of entries in @configs
> + *
> + * Read the link configurations the driver currently allows on @output, =
i.e.
> + * the intersection of the source rates, the rates the sink advertises
> +and the
> + * current link limits.
> + *
> + * The driver lists them in the order it would pick them, which differs
> +between
> + * SST and MST and depends on earlier link training results, so callers
> +have to
> + * treat the result as an unordered set.
> + *
> + * Returns: The number of configurations stored in @configs  */ int
> +i915_dp_get_allowed_link_configs(int drm_fd, igt_output_t *output,
> +				     struct i915_dp_link_config *configs,
> +				     int max_configs)
> +{
> +	char buf[LINK_CONFIGS_BUF_SIZE];
> +	char *token, *saveptr =3D NULL;
> +	int count =3D 0;
> +	int res;
> +
> +	res =3D igt_debugfs_read_connector_file(drm_fd,
> igt_output_name(output),
> +					      "intel_dp_allowed_link_configs",
> +					      buf, sizeof(buf));
> +	igt_assert_f(res =3D=3D 0, "Unable to read
> %s/intel_dp_allowed_link_configs\n",
> +		     igt_output_name(output));
> +
> +	/* An empty set of allowed configurations reads back as a bare newline.
> */
> +	buf[strcspn(buf, "\n")] =3D '\0';
> +
> +	for (token =3D strtok_r(buf, " ", &saveptr); token;
> +	     token =3D strtok_r(NULL, " ", &saveptr)) {
> +		int lane_count, link_rate;
> +		char extra;
> +
> +		igt_assert_f(count < max_configs,
> +			     "More than %d link configs on %s\n",
> +			     max_configs, igt_output_name(output));
> +		igt_assert_f(sscanf(token, "%dx%d%c", &lane_count,
> &link_rate,
> +				    &extra) =3D=3D 2 && lane_count > 0 &&
> +			     link_rate > 0,
> +			     "Failed to parse link config '%s'\n", token);
> +
> +		configs[count].lane_count =3D lane_count;
> +		configs[count].link_rate =3D link_rate;
> +		count++;
> +	}
> +
> +	return count;
> +}
> +
>  /**
>   * i915_dp_get_next_lower_rate:
>   * @drm_fd: A drm file descriptor
> diff --git a/lib/i915/i915_dp.h b/lib/i915/i915_dp.h index
> 5d17713e2..c818b3937 100644
> --- a/lib/i915/i915_dp.h
> +++ b/lib/i915/i915_dp.h
> @@ -10,6 +10,19 @@
>  /* DP link rates are in 10 kbit/s units; UHBR10 is 10 Gbps. */
>  #define I915_DP_UHBR10_LINK_RATE	1000000
>=20
> +/**
> + * struct i915_dp_link_config:
> + * @lane_count: Number of lanes
> + * @link_rate: Link rate in 10 kbit/s units
> + *
> + * A single link configuration, as listed by the
> +intel_dp_allowed_link_configs
> + * connector debugfs file.
> + */
> +struct i915_dp_link_config {
> +	int lane_count;
> +	int link_rate;
> +};
> +
>  /**
>   * i915_dp_is_uhbr_rate:
>   * @link_rate: DP link rate in 10 kbit/s units, as reported by the @@ -4=
0,6
> +53,10 @@ void i915_dp_reset_link_params(int drm_fd, igt_output_t
> *output);  void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
>  			     const char *link_rate, const char *lane_count);  int
> i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output);
> +bool i915_dp_has_allowed_link_configs_debugfs(int drm_fd, igt_output_t
> +*output); int i915_dp_get_allowed_link_configs(int drm_fd, igt_output_t
> *output,
> +				     struct i915_dp_link_config *configs,
> +				     int max_configs);
>  int i915_dp_get_next_lower_rate(int drm_fd, igt_output_t *output, int ra=
te);
>=20
>  #endif
> --
> 2.25.1

