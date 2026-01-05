Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50281C2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 05:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12BF10E1FF;
	Mon,  5 Jan 2026 05:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lm5gHGQP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2273710E1FF
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 05:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767589284; x=1799125284;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VfYOChZOkRPJJ+/PVrvxP/8E4UE/ob3ifb04V/P6Xjo=;
 b=Lm5gHGQPkw36rUraoR6ZmSU6dP+9t2b4QhUoMkpGFggh98sejEURxp5J
 QYI5tBT6zuCWayFKPfhO2hVZ9fFvC9XUMaMzxDtAN8UXL4RpEgg3+HQdk
 E9qOG3Ry/9ax6gnViUOdNPoY81kvfSW3UTOM21mDbx/x07UQiVrOI9fvE
 H1PpPj4kxqUPfyHD25zdilW1ELIMuxJm78daCKYouSUKdq7g3tWwF7EaT
 AZlQFj0cxriYfEZAi1tysK4JfANGXOkCz7f5YtYgU59od6qWfycxdb6Bm
 GlyOcYYYvuwtAPT7MCClrBKV7Howf2m9H1ueznuKvbJJ2ynCgTuiCJ49p w==;
X-CSE-ConnectionGUID: CpuYnPzBTAKExaE0JLTtkQ==
X-CSE-MsgGUID: YB5pWImVSvew4jrWj+dRIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79588176"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="79588176"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:01:24 -0800
X-CSE-ConnectionGUID: Is77hJlfSSmxdetZZxRVGA==
X-CSE-MsgGUID: 9/TIGTd+R3+M6BjZjJppFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202347580"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:01:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:01:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 21:01:22 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:01:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyIFqW9Y195qQMefo7xTTEWAfegInrUJ2qJ2KuKUVLVUJnYLTmYPRWodGAUQ8hWg2sx6OBlktZoRkdugaDdj/m0Gn3Hxb9daANxVHO+27elH2TJJvM2vp6efXULscy6fi+KLUoythL0ENbvyi6k1GNUMcS9lY8v4Mwa6oDj/JcJ9mUB9UXNN3qXyDSyMJ/29JMHrOsI21qiSgNKTBHBWDPu3qC1kPO+PEj/6RY8DWP/WQdKABhxGNzxGTvRq/Z3ugZcFtWcIrXrnbvgUyZdE+H/8o/l0senVEGRbmx4Hos7nXCUAjnIHRzNBWIbKJ8jtCP8WJqAhLDjry6+B4hpAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPhYzFlMkqexglbppST7xiWUQCzNv0UA2wDm7PvgI50=;
 b=ccFKCUU2B21hTGojNcjqet3wdCKTAIR133OWFm6Ok6QuLy+ByZENzowA9DSvINLjoBJtm+T8L/cegDjWYs4E2BDzeGC6VeiHjIK6gJundXoWIlB8+XlWE3sJCbPmu2U4hnyOW2zipJBYrLEGoRzCg5GpeSHsnSfaOdk4OwO7hTg6OLw5kw5hUbXTIiA+FWv4kSEfbtqgTMsisZInJx0+4xIB6QvwWhbzA1BZk4euY43c3viTciuvswPa0U3tW9GNcTnqXXrakD2i7r3Hw4KFe7xa4EZ78I0xKxM9nEGkZUNYU3GITU69GTKI+WoW8aP1actDLEp+c/DZ8RkvmOGa0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH8PR11MB7071.namprd11.prod.outlook.com
 (2603:10b6:510:215::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 05:01:18 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 05:01:17 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v7 1/6] tools/intel_hdcp: Basic init and cleanup for
 hdcp, constants, enums
Thread-Topic: [PATCH i-g-t v7 1/6] tools/intel_hdcp: Basic init and cleanup
 for hdcp, constants, enums
Thread-Index: AQHce66HV6b78uV7m0KpYEiov19xGrVDCB3w
Date: Mon, 5 Jan 2026 05:01:17 +0000
Message-ID: <DM3PPF208195D8DBA266F55FE9517556062E386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
 <20260102060835.89725-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260102060835.89725-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH8PR11MB7071:EE_
x-ms-office365-filtering-correlation-id: c824a81f-a266-4072-9c3c-08de4c1775e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?c1FMFeaVsH0rWEOnaI9ls8fcgdrnnlJk9Loy8xQ2g+rhLjb6G7hM6ivAntjA?=
 =?us-ascii?Q?Us2hG5C/ZOKMaKEdKbXFF7PzDkpHve83UKs8ATpXNsxMlWtYahWF+Ahkh93l?=
 =?us-ascii?Q?z9izaVUaxKNfXeGRX2XbhlwFzD9+gk6ViTj08C+hFg3yW3tB7GRURRxNyZqZ?=
 =?us-ascii?Q?KlUxmZedfqEFZwvBcyPXZWeuNCeA7WbD05ZmeWUOEGUnE4RwZcDns8pRldZs?=
 =?us-ascii?Q?0RTgFE1rNrkCbUS6zR2LXYpt+hruYQa9Jv99MWoM0qvxljA2LDdURAGi05Vf?=
 =?us-ascii?Q?tYjmmVl9uvqKrn16HA1MZUUHMPCoSlNpstorcFR8LG4AnblzL5WrN+xp+zKM?=
 =?us-ascii?Q?A7W+/sWMXHAtOifQUhULraAVrFGzK4y2tMV9yOD4AYTnjiOui9WfzzY73yo4?=
 =?us-ascii?Q?i2ZdOhadZJCU2GZ/v1tJvIPC/sAzVG+RIYGvq1ByFiu8bFL8smWWrMTmHgoi?=
 =?us-ascii?Q?t12gV4KOucBrwOJfmhhlpy+n2Dxt5IEjqb+BdCqwsubfX5+dmYUVW9E/pdmc?=
 =?us-ascii?Q?iq7+eCEAr1+6EcTjHrl0EHrgai3OvwMvA/glI+RtZtkJSTDeXYhtrxecvaqd?=
 =?us-ascii?Q?9NHunCiSCwOAYRY/lDLT9gUtR9G89rIf0aJqZYSlUzh5AjHGpBTtjHomCn61?=
 =?us-ascii?Q?TbuZi8TkW42M96MI7mJ4gShYYss3RmPZYWW37Qb3pWE0nTmJ+yepPf+zu0Dg?=
 =?us-ascii?Q?wpk7eMKCJZIfU+Dplf8HmBQ6Y/WOIIxrw8c0THc85PnoLJ7znNGaek7Y34ix?=
 =?us-ascii?Q?YNszvcVVsZAW5NViO5E4yPftMCJdN3H6q7buWMCyt5oOJzSzd5Z0ZVdI0XSn?=
 =?us-ascii?Q?/4CyJ8MxqratXkBE4rj5SVdd/zrh/0kIS4F5dkzSzqI4+8sYvIbKkiKwtrjM?=
 =?us-ascii?Q?gUmIv81aaJEqhtvcwOpfE4GoIckPDcmf3mXF30PTbI8ePpSdccuXaJeNpmb2?=
 =?us-ascii?Q?FU3uVzv4tEXq5MOYVcPCM7KFIvODScBMggoXfnjRAQksxWDTh8IXJzVdu1zM?=
 =?us-ascii?Q?uKymOvC0FB3KRxgiN3Q/qgPnRpMGk13JCifoK4QbgkqC9rV5iOb91NE1sTui?=
 =?us-ascii?Q?0VjbH7v+2Xow3gqZ78eDwIHFrN0cfX27FjFU9ZSVDJ0tFCNJ/Jg4lqN4PWSy?=
 =?us-ascii?Q?2usmRdUXzteVZQhy/hYRrWuP6GKxLrKqA4uar12wdbHPyV74sFz9IMSu4wUN?=
 =?us-ascii?Q?9FrY8ltLI6B55fatrvU3yRPqE9h00BKB14Tk9UINOCKR6wl6y/m8AhQSCZoq?=
 =?us-ascii?Q?cESFLennkBz09Lk8WKVCdowyseWN3pjxTQcgY4oUvuz+aG5ygVCfOwJL9sB8?=
 =?us-ascii?Q?RL/cQ+/4WlR+xs5HPcNaorC3WdXj73EL+1doJJ8Cf3kZjP2paS7D0Tbzu5ZE?=
 =?us-ascii?Q?hHL20yudUMuDEOfMDQ03wgM7c1wDSI6bU5yhTmCBWacZRub3E+v+m/UkZttw?=
 =?us-ascii?Q?6BgKV+3fKYEAhwNPj9vl0Qw/fEZj3dSXZCOzUn6wTxEVttJxCZ5XR94VAtTz?=
 =?us-ascii?Q?UoIxK0sfsEwfWZcwBtABppdkguwkRKbSopNY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vz7y+nM/322RJRR/ZjMN+oO4IiTIHyi6IGOPV6Acj4fBwLWtXQV5nBndWPva?=
 =?us-ascii?Q?wSLVIX24U2YjRszGTKbaQU0vsRsXbZzaW1GlLJjuax/O9GGKognqAx8FDUvK?=
 =?us-ascii?Q?9pLHASx1GcGjApCDOME8Z7TKiheK0nXBLRKcPATAEeEWtuLMO8R6bbHjs/R3?=
 =?us-ascii?Q?ExXdvM3Xl+FH9jJxkXJ0vGNkJJbupnNMTNrbGY9N6JsDrRGvLJt1DT75fMLZ?=
 =?us-ascii?Q?ZhLv25PhURRTxd4pv99sjoDyCUFt0vSILx7gXI4Jfl8ZIA+bmwLt75kNWYaD?=
 =?us-ascii?Q?eud+XvTNPTky5z0pRoUeaGUc/WJbyXI0R7AWpUsT6BQpMcxioF+pC/0g8qJY?=
 =?us-ascii?Q?72MQfvQQ7WoKHTG3EL/gHOwdxZYcv0kFDcQWrOhCo2GkbVv7UbsGB9CgyBaX?=
 =?us-ascii?Q?kL/FYToRW43twihjplbhWv2kQMOSJQczxrAKyS49sMR8TzLoqj8zG/0r/kEX?=
 =?us-ascii?Q?p5j4fZ3VVXH1AGK3YfVK05OlsA4AqU0iBGDMwYFMYCzok1VmVwLUujjnlzrT?=
 =?us-ascii?Q?hOadwgo85g4zGKGxbiftb+85hGOcY3gvzgnje6idOh0qiBKszucfWNUXLsBi?=
 =?us-ascii?Q?N/CSQVz6RN3QiNVoebMj7GzvXlDJnqZrQQEFfMChSyjy9YLjSLxfau/PjSMm?=
 =?us-ascii?Q?B/G3ZL9M+a4vaBuQsvAe3vRmpFcDcksOAsOG6TKE+yZjIDCwHlqJhvO8ES65?=
 =?us-ascii?Q?zV8/new3s0WMblIAyJ4DkTXDvEHpFOLQmfUrT2w2ltP479vLoCYwtUPojptn?=
 =?us-ascii?Q?O184i6jwvDn+vsxbyGqD2Vy5aViKoKJht93M8HunCLpyZOmBZylgtA2ytgoe?=
 =?us-ascii?Q?e6dnPWhXwPLpVfSr/7GhWGmvEW571qAI3JLp1xNnysYkHGhVPWIGr+xkgUn0?=
 =?us-ascii?Q?CF2huyZSsWFTaJ43jpnTcsRqrLQKuyzx80gUI+LsE4MTy1oV2YyjGgO8IGnw?=
 =?us-ascii?Q?8gbGvgFOAmlAk72LQ03LjpML92J2RMxUwyykE8MwPv6u4KNRosM0NV5EA9TZ?=
 =?us-ascii?Q?R36QXh/UtQTQSPGYc21xusvaf39z2S/yRqXrqMAldrUOYm4OgIRAXJFAtFLq?=
 =?us-ascii?Q?gMawlTZn9Mp6T4Fg4GqZ6zTbVytoyOSeHOIT1r4cJT67JiCC0WCs5Hf3S3cT?=
 =?us-ascii?Q?USsX2fzcQRG7sxwbE90LIAiqR9Fz9FFYaIoJIoVCKnwLxISv4pKv+FtxlQ8V?=
 =?us-ascii?Q?xxzIIxrIqoEvLTK6yhRRk3pKF/dioz9JesoC4ngURXEPzC+k/L0hsmL+gXxs?=
 =?us-ascii?Q?qr/vT+nUcbqgHcbtULRC0VACVm++Ly3X2h4JyF0iJ+q+vcndQ6O/jo0j4N8M?=
 =?us-ascii?Q?FchmK4bSg1GcfSgAVb0UjU4QrOlpSMevqKV0ySzJ65Wo6KaG4FC8ScdCpId4?=
 =?us-ascii?Q?9hwHG2SkV30GY2U58lvJLXGd2CbDBnBdYXReNlYK3XUwu6+Zi1pdtyE68Ow6?=
 =?us-ascii?Q?pRX0fvw44/nalIGA0gRjrCkM2f88f1kA0LlCOI+5r+aqaEmlqhxsuyAaC4aA?=
 =?us-ascii?Q?njJlvGvCOTQuXD39FYSp0z/DPJAPWYWoe3iZJpaCF+ZeiVXsOg+KhE0dcNhy?=
 =?us-ascii?Q?K/WrUxBOYfSta8VeJNe6zovn/k8kchmg3Rvb85Xgdy9rJ/3wEbfaSDTJQ5Wq?=
 =?us-ascii?Q?iLTmGtPoGHswuITQiQ1t4QveEkLRuh710gAr+2EWOesGW/RU8l+W9pc/fyxi?=
 =?us-ascii?Q?bMQwBwHnPiZfuVZwAdh0lqahUFzAAzYCAVQTn0qm1ian3Usef7mNRpA4JlYp?=
 =?us-ascii?Q?RxNfqcPQ4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c824a81f-a266-4072-9c3c-08de4c1775e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 05:01:17.8526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4N50OyEjrStJ9LCVo74TfCYJr/ynjx5lBMgE59sO1Dxre1wwIIcx3ADW2nMS60iLLu/Ho7hytwc/Z/Qq9tnow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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

> Subject: [PATCH i-g-t v7 1/6] tools/intel_hdcp: Basic init and cleanup fo=
r hdcp,
> constants, enums
>=20
> Add hdcp enums and constants and proper cleanup for tool on exit
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tools/intel_hdcp.c | 45
> ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> 8ec698828..ae2520b03 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -10,11 +10,25 @@
>=20
>  #define MAX_HDCP_BUF_LEN	5000
>=20
> +#define CP_UNDESIRED	0
> +#define CP_DESIRED	1
> +#define CP_ENABLED	2
> +
> +enum hdcp_type {
> +	HDCP_TYPE_NONE,
> +	HDCP_TYPE_1_4,
> +	HDCP_TYPE_2_2_TYPE_0,
> +	HDCP_TYPE_2_2_TYPE_1
> +};
> +
>  typedef struct data {
>  	int fd;
>  	igt_display_t display;
> -	struct igt_fb red, green;
> +	struct igt_fb fb;
>  	int height, width;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	enum hdcp_type hdcp_type;
>  } data_t;
>=20
>  static const char *get_hdcp_version(int fd, char *connector_name) @@ -90=
,6
> +104,8 @@ static void print_usage(void)
>=20
>  static void test_init(data_t *data)
>  {
> +	drmModeModeInfo *mode;
> +
>  	data->fd =3D __drm_open_driver(DRIVER_ANY);
>  	if (data->fd < 0) {
>  		fprintf(stderr, "Failed to open DRM driver\n"); @@ -97,6
> +113,32 @@ static void test_init(data_t *data)
>  	}
>  	igt_display_require(&data->display, data->fd);
>  	igt_display_require_output(&data->display);
> +	igt_display_reset(&data->display);
> +
> +	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) {
> +		if (!igt_output_has_prop(data->output,
> IGT_CONNECTOR_CONTENT_PROTECTION))
> +			continue;
> +
> +		mode =3D igt_output_get_mode(data->output);
> +		data->width =3D mode->hdisplay;
> +		data->height =3D mode->vdisplay;
> +
> +		igt_create_color_fb(data->fd, data->width, data->height,
> DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0,
> &data->fb);
> +
> +		igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data-
> >display, data->pipe));
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		break;
> +	}
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC); }
> +
> +static void cleanup(data_t *data)
> +{
> +	igt_remove_fb(data->fd, &data->fb);
> +	igt_display_fini(&data->display);
> +	close(data->fd);
>  }
>=20
>  int main(int argc, char **argv)
> @@ -123,4 +165,5 @@ int main(int argc, char **argv)
>  			break;
>  		}
>  	}
> +	cleanup(&data);
>  }
> --
> 2.34.1

