Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF42C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 09:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27319112B51;
	Tue, 16 Apr 2024 09:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJlRC2f4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA2A112B51
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 09:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713260122; x=1744796122;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U3dZLqvlMWGSAaSgXHDQlVenAQvecvdd2P2LtrWtMys=;
 b=XJlRC2f4rrqgo1aUoU5Pmpeh+LoTi1H9bkvbrUxFPcwn3Q0q6BGhvXIF
 Y5h8RMtUIYDGGH4vLbK04s5Hop1wb5GreccQV/oioqlFzcHufBri29pI4
 LIU3pGfBkh8TQVBwe75hTehrh42ILA27b5ZbhmO7vpbqVULOO8XD0OVgI
 KIStkagFhW6XkQpa0a4L3I3niPQnCWTem0t53UO0yPB86ENkbqvGUAGOj
 S6wRaIiNhwNAOxB/Tr3daMq12BY1/V7hbwjFE75dhZdu+lGUwu7YXy/uQ
 DCFreOjHunhLNB/b2LjvXVB1r2/BMOi7EJ9zQjarUV/LqGnq+tKOlRcEZ A==;
X-CSE-ConnectionGUID: ls3Jd59bRAq1mXPJLoaBzA==
X-CSE-MsgGUID: M8Xx1y1/R5G93ajjS3/1Vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="26142650"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="26142650"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:35:22 -0700
X-CSE-ConnectionGUID: ttzAZubaQbWN632UVSepHQ==
X-CSE-MsgGUID: muvsoXwIT8uZpo5w8rQlfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="59652775"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 02:35:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 02:35:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 02:35:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 02:35:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 02:35:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXcHT1uTzdDN7m6ZGDjVOYMCj4JYytMXC4H072T1I5dUoFO4PpswduHp4i/Wz+7aGvgyFClB6Ws0u2FIdx8LhXab2cMhI8b12YJX/vXJH3/j7HG1N0nXd2/Zr1F4qhOl0cOCoUZ8yCQqfDomBFxMExfffGY7LcoR/w/Zil+7qo/x6mW714tLbhws/3wxSGWmUp25WDdIzauziILXlM9qF1938Hpn81YvBPE6/9a8s11ECc3DVnMudwgDLSNflb7xT2ZMOhW+7qGEBxP7oOywi6hD0gj1FfB2VW5lzgTEiwqUgg21AoMZq4tiZJyOw40qSYUX8dLtTkL/xmCLbIRegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6uzf/xUlsr08y3a4tZoRHKZrmtVvEWg5k1ZTTsvCTo=;
 b=FgnVNGh3jOfc5WHkJz1O7wQ7yikmli3eQSKO7TQq/x8OCcWPGvf7xUklRWJdLJISocwlhrYOm3KZ+zu0JDYYkn7cDd4u++I/ADHV7c5rzOLqqZy32KxJJjoLE3FfzZglQX66wl7WsaPd4OipQRpwSa9GOyCtcz0B4CN7S8sRxinAYnVLXW4tVqs5yDjOZ1HHEYPuNsxgEDvRo5wdMU04MtnHrV1CZqCJ7wMAKf/AOmQPYQ9LwnabMzG1v8USlPDpR0mqoOHye+EMy5HT2jhKlLCc1zEwjGqfme0o8lOYvTEeQmoidUAFgU3FpuHlxDGS8Mwve8H7aoCEN3VXYKxqZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by MW5PR11MB5908.namprd11.prod.outlook.com (2603:10b6:303:194::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.43; Tue, 16 Apr
 2024 09:35:19 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7472.027; Tue, 16 Apr 2024
 09:35:19 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH i-g-t v3 4/4] test/intel/xe_query: Print
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM
Thread-Topic: [PATCH i-g-t v3 4/4] test/intel/xe_query: Print
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM
Thread-Index: AQHaj0QzrKmRD90TxUGuTZAxoxo0oLFqpBSg
Date: Tue, 16 Apr 2024 09:35:19 +0000
Message-ID: <MW3PR11MB47486554221C0AC22613EADEAE082@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240415143528.4107-1-nirmoy.das@intel.com>
 <20240415143528.4107-5-nirmoy.das@intel.com>
In-Reply-To: <20240415143528.4107-5-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|MW5PR11MB5908:EE_
x-ms-office365-filtering-correlation-id: 6e6a5acd-a54f-4813-bf19-08dc5df887d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /L/Fb8eSKv182G8LpbOzjgua9wiwJ2r17TzwQX5HF03pv0j4tJajLcTpB86fdiKK0vqJRF9VjSUfTOTWdyw9Ku9U7Pcg8bNSpsEDs3dtTFurnCLOj6sLI0zeHzLEKu9AfkrMarVR40VQ0jjylqGt4ZT2KZNVp1tTiT8t0CVsmNLsBUItshbwC8m7+B9rjBm1Cl30111s/LXk4CknQQVV6BusVFUDxKpCyjGv6XEWbWUpqLm3XI+c0rGia0YXiBrD7c9A27xIERxSpsxgd1dp5FcRCoUtl88xXQqm63HR9vB/0Pqv5GVB8a3wv6JtEDDYUxlKfY7ae2ZJ6wK0tiLzxvbsuT+3bJk8wE72fT+ylWSo/XrAyooCBhgmvLF5ZR9QYdBMfKWYRKXZdfVc/tJTFH6E4JGOqdFZkiE3IGAQkyl0JOOYh2dEg3O5fOgWfsSRmHtn3P4wSvAn3cLCJUshAV4+h/Iddu5K0IhPIa8BlakCR0zwpQ0BS8Mj4z59LtNJKzuySLsdz2GZryeWtFsfh2HZDXk5NiqP29/jL7YkLjhrLoHSQJ2IgBntfuZK5rehSQ4BFc4L4S9+mi8tAGBUW/YlZhJ6AmM+gN9J7l3iyp+HrZ+zq5XANBdoYFjPs+RSU3RJU8Yusqk0Oiv99wJ7HznAq1QyNzJzchC20GJI4jzJphWBX09/RHZWqdBkyc6+QBjtYNCUqTrqIUyj8Ysb9w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?berivCxvvRIPV2dNFCbdpgzQteO7UAoNa03s99D7hYr5sxUyvVc4XHJAb8uw?=
 =?us-ascii?Q?X8hxsKP4AUXqu1TRJSVluZKoG/UNFIBMRSnOk4A96pqwV+3rRctWpV0m+NkM?=
 =?us-ascii?Q?HBAGdDOlk0Ty5nO5D3M4ECrGNmXn1l1qJzyr8kl8WaTd/t48n+WbioSe0l1V?=
 =?us-ascii?Q?W9bueQGUyts1Qe8FZibMiZygUfTgZgNVHBe/Tb/+rRDyPTk1kqT958n33XIu?=
 =?us-ascii?Q?7sXK2ZIr49+1zhq9IY0PODNDQu/kXTcX4dyNcaX1QOVpx555tYyc0GqUdNTU?=
 =?us-ascii?Q?sxOgrT9m9QayPNaDRP/F5u7TGNdzcyBYpBzTjbk1Ab7VpFdIskyEiOBJim5R?=
 =?us-ascii?Q?Y9vvuKP1chL0XBUza/ohY70VD4G/zhRypX0VTtf5qpX+U/qjqL5kCo2Eje6I?=
 =?us-ascii?Q?53BuK2KmXG8BRHH8vzQO1l3CdrbAq0lF5EGynSNdMLGq8dEPtIDiGzX5Dli0?=
 =?us-ascii?Q?wke4AuYeSp6v+hbm2S3NfQfuyTOr2RAE16O1bGtEQUf2Al1OUe+I+5lqdZ3X?=
 =?us-ascii?Q?SnqFPfHsqFZ2rMOV/OeT8PZL/nK0fi6DkQDP/JB5b+PG3Wdbm7pB7YH02XUN?=
 =?us-ascii?Q?1KnTOzM+NTXyvfc5urqau3PuSCWb4BsLyAEfLn2aaxILCBXMkt5Ntqif3Usw?=
 =?us-ascii?Q?A6EUV/J5oS7yebuJp0z0BuUw70T3gyCkgxseW37EHPvp9HGQuQXC9CIqI1iY?=
 =?us-ascii?Q?a0O6yCwEjLE8nm0MrXogLAOhn/7yqZ3SHMdF1FYRoeoBrzoldUIew3dhfVUf?=
 =?us-ascii?Q?6Zzl0WefYhOozmgSGMA1TRqNqiRzP0afHzq8JWGbRKhnGZH+nW7ldPuD3pGD?=
 =?us-ascii?Q?1MhmaXf4cRkJPhXIMy7M9JepZxtPBiRYotqcMwlrF01FQH62yy5OvKxKeW+5?=
 =?us-ascii?Q?YsMhNANFOUdwFx/GWPrnqBON/3NRtC8aaWdJJeDPINFklHpgnMElqqT8KHOp?=
 =?us-ascii?Q?ECk1Xkktl175q4IxNRteM40Zl/zJDyg6dmnKZCXTlp5xqJ+tpFuaa4F6Ia+X?=
 =?us-ascii?Q?AA420oh9TGkZ5XDJXM9VXmU4q3TUDROaJh+kd/ANt0ASvEOp93l+qkl3xAVh?=
 =?us-ascii?Q?BkAJU12KGawuHsGwhyCSN9oHy2hJTKEXr6Or5+n4sAczGiKDVeUFTTzT28Hx?=
 =?us-ascii?Q?aV8GccS4e3Yu5wSmDtkiMCQkBmKgz+pt+vgn3Q6gQy/sxpjNIlwXiee72lgV?=
 =?us-ascii?Q?ShnqryRemkvEIS9j7RTohbqsgurZIjz0QWw8Wat8D0tBU2ZD+VmiirFDBoPL?=
 =?us-ascii?Q?1O5jcF16j23aO1I34+3N/3LgNYklxSPtTprS2GgK7kDIl8IDq7LgiEvbATkW?=
 =?us-ascii?Q?Ws+oCcOrNG1/WF7DBdwP9+9buZrfalo/YNmeoQ9TrYxrDKoR8Cb9JOWyN8e2?=
 =?us-ascii?Q?Y9Nc4f1rEJ0ag6nFlR3XzzNJkLnuclAK7dURIM6qJTLWD1Q3RC9klEv4kjGt?=
 =?us-ascii?Q?hkuChBCRatUq0Jxqu4vz6VKPsPtbzhMGEbe+RQb0U41L77zaRVpp0Y4PmXwu?=
 =?us-ascii?Q?oWEzHHlLfmBTTZEJ70XQO+KnBVyxJsYyGtTM5Y4KsB+IdPVk3u48Sq4A113e?=
 =?us-ascii?Q?cTeawdHAQH3N4TM0HYn1dFuyA4/7PLpp8xweFOYtE0saeK7qneK9LpgLdZiV?=
 =?us-ascii?Q?KQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6a5acd-a54f-4813-bf19-08dc5df887d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 09:35:19.1795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JhpJhIR01sFMjdoA4y5lKAfpWXIAWpQgpueRt0T5OAMA8eONhiNJ+MHT3X4x2LuVNePWAhNMo2oe3h8QbV0Q4l2ekxq6Hc1Fqa8/J13wo5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5908
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nirmoy
> Das
> Sent: Monday, April 15, 2024 8:05 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>
> Subject: [PATCH i-g-t v3 4/4] test/intel/xe_query: Print
> DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM
>=20
> Print DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM query
> config flag.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_query.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c index
> a5a2dd7d4..f74fa4797 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -428,6 +428,9 @@ test_query_config(int fd)
>  	igt_info("  DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM\t%s\n",
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
>  		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "ON":"OFF");
> +	igt_info("
> DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM\t%s\n",
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> +
> 	DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM ?
> "ON":"OFF");
>  	igt_info("DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT\t\t%#llx\n",
>  		config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT]);
>  	igt_info("DRM_XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
> --
> 2.42.0

LGTM,
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
