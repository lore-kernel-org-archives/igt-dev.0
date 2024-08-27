Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3165C5320E
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B68C10E02A;
	Tue, 27 Aug 2024 05:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYi0OIar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2C710E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737511; x=1756273511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=izIqhehgGZMwRDKznKPFhU63EiU/cwVPXx9c0u61tLI=;
 b=OYi0OIarld8YduARy/GbCuWxa9vKDAaiZN/AL+acFasnf5rlPwlrMf6u
 XTvGTnrf4FMCshds1Nk0Mp9na9FmrSENOBJx2Vpc3bdezo6alPN9rv6sQ
 LwjvinQ/078CpQb2felk8HrBajg82jp6IM3hSt3ZC1WJxKHJEL5xbkApb
 nUsQrOFoIaRPpCIcG3Mb+oAow2NcNzzmFphvGh7E5ixiGcbv6fSUBoJPQ
 +DSd+MbA53V2eOnIVLAgWIg/OLaxrzTWllwVZA+DFMPoy+SAB0hHhC5t+
 R3GFLaQ0o2Hy11kCCv7GtVDxLgTsTvuO8yaQzrXXaZgcQVzAkhxk8Nuc9 g==;
X-CSE-ConnectionGUID: aDA1PGOqTdOgEaCXGPLmnA==
X-CSE-MsgGUID: R/iaKFhwQtSFqqw1APAZeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34346713"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="34346713"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:45:11 -0700
X-CSE-ConnectionGUID: YxBChfGoSR2i6aAo5EHoMQ==
X-CSE-MsgGUID: 7PjZVPMWR6OSDUAuSoOaVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62909443"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 22:45:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 22:45:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 22:45:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 22:45:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 22:45:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj/mc4m5wu2gAWQ+O7yAaYTulg8spPA0fWOo2/UWWfnN3MJPNeb7NfdymStJY436r9DN3n6tUJAflWD3aijtgwG30/xGs2Bxok9kB4fJpskonyAyxCkRLwJykBH1B/jLLOY9Ot9d7VfCWwlrFtcCw95wettVXMiw7V7Sn/wCynoF9e+ARHlZGu4z8PGmwGUBdch/IhRZX7LDqXe+I8GngqnhV3n7uNv/Afpr1230UhlyzWIPku58JAnZmycxs+cFuCQquZcurFmmpfWjf/+TgA80XW9L5eSaFVmkwD7IbSgBruWAxEBaMhiZ/bK1k7S6Fm8/EZFud+0Qolucy6kIaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZWsIrhgHFbaSyf7SzwIVNjZ2bQ6Y7JKP0JuDljy078=;
 b=uLt4MNfthEhybfk0um/cy5CLuW891vQ4ExH0++HOLor5Z+G1uHWqXs4l+ZKyN1NBStgwcdqRGLsjPvAl4KrX7GBSjV3n8P1CdAIkDoh95fZhe2Tg4+AP7oqBGgwlmMcGJcisSJf9tVaSQxMG/4CHe3vZuMLZZpshdRdtY5mKo/qinORG1KLNdA2CuBnDFoU9ezl5pWKJPDJNzZzVxnwG4LkI2ZmYRsYyMHCoOQV7KRk6+XuU6kytQ9u1RoZYc5JQq73Kcq0lTcQwFbBQc9Ma9pqxO0AT+Z+MwfwhA+rTLA6NIS7oucUw8Vha1s4mvBkM4Qf9eiCZjV8O788tlfl9hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 05:45:07 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 05:45:07 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link
 rate/lane count
Thread-Topic: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link
 rate/lane count
Thread-Index: AQHa9yisMQwx+JoERUyDJCEUji3xVrI6maWg
Date: Tue, 27 Aug 2024 05:45:07 +0000
Message-ID: <DM4PR11MB63123743419625C59FBE74BE90942@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-4-kunal1.joshi@intel.com>
In-Reply-To: <20240825200612.4036178-4-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH8PR11MB6928:EE_
x-ms-office365-filtering-correlation-id: e6e36ae7-0753-4270-136c-08dcc65b6817
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ojA85/5btjrB4EUqHTmINNTrjoWtrsBHRk4fdnmIgjLvpk5YYTtHgoVP0RMN?=
 =?us-ascii?Q?kO0srh+2u8oQx4IvCxFePjKsV8B4dVpMQCUSEY0kleZbHZA4Vq1hOWCOnTC8?=
 =?us-ascii?Q?VPYyMW+hRuLfl4q2+ZaQBz9SxNk/NKTfgyToGoCh++mHbi/EPenGyTDBPQX1?=
 =?us-ascii?Q?0m36qtr+BdX01EywUn/5K++vSaYwviEG6fwHiiYmf2KXdFXb6LtJOAT/pZGr?=
 =?us-ascii?Q?6JjpaMoR1pDzsdwsyXt4Qq+6LgRr7IF7BsdDKeRPSI1Q/aFomhsLgH3n1OD8?=
 =?us-ascii?Q?8a1zJfImcsRP1I7CziE/ytcQi1i/bte7cyDTh+bgFOhSw/fKdLngBbyHs/oA?=
 =?us-ascii?Q?aLLKmKj3wLorgAdL2ECnx1Jnzfc/xJzYiaYrbfVl8375bjKcHdKGq/X5SLup?=
 =?us-ascii?Q?Mwq4UycZNtwJOxU8Kg6A/OHgLHynE+HS5/E/xuJG2P+SU1GEeL2pL0PQWzq2?=
 =?us-ascii?Q?hNAgcyQGxP5pjvQp2lb/3XYjgJHvX9UFig9M2WT5kcUbM01KDuxtIi2vDpbU?=
 =?us-ascii?Q?vwuFGcTaTFHSZN8ZZSMLMlOjV3D2Z3mF7nkqHH6EcJFGMsgGeGocM+es0v16?=
 =?us-ascii?Q?aXv+Y/SasHnu2jrbw+jQouAgTOBvrOTlicNeuxVrN4H6kbM10BZ6KeUSOTIq?=
 =?us-ascii?Q?qAaWWBdAfO7qdWDc4T1cRBXNL5cyKXncjIvTq8xMAYPK4nu8cOPPswMMpPuT?=
 =?us-ascii?Q?iVhq6qqOlWMowv2fmdRmVc1BOHriVWoiRMHqelENbxPc2SrrS3MwRiR1u7j5?=
 =?us-ascii?Q?qEueMYixZmjqqIHYJc4rx7Tzxicd8bzeTsX0neIGAR/0PitUomVt0KNyEniM?=
 =?us-ascii?Q?UJ2lwlf3dYEGpwP95dvjTZL29UrYw+NAbMPvNeGiToZV/gnbJs/Fsy0fCKbl?=
 =?us-ascii?Q?gSJ1xsAG6cvdl1lg2jDTtVxW3EGd35fnZRxznXfwW/lrTkO7/eIBBgzkEfdl?=
 =?us-ascii?Q?QgU41LfxXYTMM2KbOTjB57tPxqq5RuutIDWyhMBVhzIgYEShC8t27/YKaUit?=
 =?us-ascii?Q?tiEFuDZHp1wgVk2k4fg+htLjkuWX4sdTMHftSF3lhGCF7qUtaAO9//3HsfHV?=
 =?us-ascii?Q?/3QpbEal4sc660Ib9oZyShaPjAsrI1kc8/6MFIeVpxNXBZ4w5kHubtZfPvZA?=
 =?us-ascii?Q?b8dfXQYgTgJlQ7qdJ+lPmg6jJNt6lDOuUKBGBeFFrdlQU7H8hC0XpdicuAeA?=
 =?us-ascii?Q?+rDXt5ReD2pzyZkvND57OlXQsEoQsNOAXjG3PJss6ZVDEDDDPMY/PGa5jiBx?=
 =?us-ascii?Q?tgQvfnM8YqeI7N8mZSIXb2+U0KaEy/LYQBS2gzOeu0u8vOiSSt/eX+9QI9IH?=
 =?us-ascii?Q?HKceocSkqny60AJryBsE/wbeMT8qBXGX5x9/0zc3czbPJhlEmlUEezGMA0R+?=
 =?us-ascii?Q?Ex6HbfNFz08EUS6EuYNLpFC4prj1sICnoCzcSRuFgTyV2ZuXmw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KJm0MmnOrOsvIAg/Ow3xfCeEuR6KG6YUVihn2peHcU+x5fia7u0KX3JgNZgt?=
 =?us-ascii?Q?doh8MKrlqSTUUa3MpLl7B8LFLqzDmqkhTRAVPitRjShbmZ2mqsOrwy6IEmSL?=
 =?us-ascii?Q?1otJ8ukFLq/8dyL0a/WEElTuR/gb0E1CNu0/oJezbdimKKcbT1TJpvuoflLG?=
 =?us-ascii?Q?UtNqKVclH0L2QFI8pOrTh0rl34gD2Ts1LLm4/tpTWOl06QOjQp1nzt2SKSRB?=
 =?us-ascii?Q?j/nAbP21fW1eS8hruDjcJOLW1DOiizn4sg0CXFphik8tkkoC+9WdykXEpqqs?=
 =?us-ascii?Q?t3imXgi+jGI10hQW3sOUkv/2B0YSTL2r+/Rk8Q1k7xnlYFiDSU/vwgbnpBKN?=
 =?us-ascii?Q?rAPEVH9lEIWnt2kefe0iEgPeh6oLlWGEt41ry4mLVBztqCeaXKy/vf1eFxI9?=
 =?us-ascii?Q?gawa7/95YwxXZeFkxvuRA0g1eBG7GzaQmc6hTpvqqZMjS5F6sdAWt9PlV2QA?=
 =?us-ascii?Q?rGTiEYO2vaMjp5BWz/KLHaeGDwqsjE29yvzURETL2iuVKfSNl+XqCCdATv1L?=
 =?us-ascii?Q?OqayL24Lkifa6aJH7FhJhTf6QaZ2WeZRakHnZ6ZTCKlkA1XqGLBFMhp9hiWK?=
 =?us-ascii?Q?RcqLDPi3Pz9tvfBVsr04oVlGh4dH2JPluUi4orTL1Cac9IzTjidzrX+gTlLx?=
 =?us-ascii?Q?U8Nhj31LTd4iPTSvZpx9dt277/Ane+PtLNnsaZPVhl59O6UbTdmq2RKodbQ2?=
 =?us-ascii?Q?lh+DQzqbuzTlr8CYkDZJAAinZaX3Que9deSp3ykV2s7EcEOfrpm9kddMespd?=
 =?us-ascii?Q?z1qO6jHjQL+fHHVhOoLJez3XQa0nZGJvYN9XeN3suJJKQ03AUWJF7f3/jD1P?=
 =?us-ascii?Q?Eza7mFggk22JpYURoYberqaIOEc02p8Y/3Y3c8Z7e9neNCpS5JnHwkPsQNkM?=
 =?us-ascii?Q?fkfu3LQHPW8jEB181tns0LGQA9cmx7c7AKlp1v+amfX2qwLObrTbb1MZnYCv?=
 =?us-ascii?Q?cC3IZmh6D38cYE8ExwL+npyhDcDHs4xld6Wt5tLUUKtp5i+ETmJH9K1rWI7H?=
 =?us-ascii?Q?UpzYrrE8pZ5OYGxpInds4I/mvSMSCvku5sIuCqt2G5BVetVkcAz8hJwH/hZF?=
 =?us-ascii?Q?VLCWD+cr8qF2WKAnGUMxxNtqvf9S48/Oho5VrWAfVyihJ+X8h8lshbSFhuM7?=
 =?us-ascii?Q?G4Vh8YpGCG8DXcv5+E3M+D78zLz+ZXi1BnOSePE6m19IdErIRI+2PYb1Eg9W?=
 =?us-ascii?Q?ClfshJgX0xLTBdLGw+YzgoWoKH1KFMez7C4gf6KbzY2ASOQ2tIT83YPOdUy0?=
 =?us-ascii?Q?53kyUU97H5SNKS/D6IfZtxIvQzzXcq/WSi3LmZJpaicCUf+jqI9JT1FDGqxG?=
 =?us-ascii?Q?yQ21Pyel7/hisU5RTddPwgcg5rSmt0KmW1WtMlE9odjR7Y8zUsWCwv6twEuu?=
 =?us-ascii?Q?jChC45Zik8J1i4ybOuuDw4Kde36zuoshXCTD6iMa6FxW3iJkGKZRSVhtlf69?=
 =?us-ascii?Q?NjfJ+gxWNxGL2EsdgW6bCeyByOBuLWOQXjrWoRhllU03lWSzGmiclWGj7tMX?=
 =?us-ascii?Q?5U+tJhQl7Tf14NLE0aHjMt6I9ERig9hbYxy6DrShyaYDP6J9P0c3LpwYfAAL?=
 =?us-ascii?Q?+vVhJ8i1ROjwhITj26E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e36ae7-0753-4270-136c-08dcc65b6817
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 05:45:07.0268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /E5GImuaB2GXTKGjylvHl4pwkVX9YoeLwVE3MEFW7jz8nwjSbO1OCgwBNxYqkzhSIl8XX7KUJK79UB6bGe3l3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Monday, August 26, 2024 1:36 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link
> rate/lane count
>=20
> i915_dp_max_(lane_count/link_rate) debugfs files expose max link
> rate/lane count for connector.add function to get max link rate/lane lane
> count for connector
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 58
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 60 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 4ef7f4d7f..21ea8550c 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6763,3 +6763,61 @@ enum dp_lane_count
> igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
>=20
>  	return lane_count;
>  }
> +
Is it possible to reuse the function igt_get_dp_link_rate_set_for_output & =
igt_get_dp_lane_count_set_for_output=20
To get max rate using some logic.=20
> +/**
> + * igt_get_dp_max_link_rate:
> + * @drm_fd: A drm file descriptor
> + * @output: The output to query
> + *
> + * Get the max link rate supported by the sink.
> + *
> + * Returns: Max link rate supported by the sink.
> + */
> +enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t
> +*output) {
> +	char buf[512];
> +	int dir, res;
> +	int max_link_rate;
> +
> +	igt_require_f(output->name, "Invalid output");
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name,
> O_DIRECTORY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector
> %s\n",
> +				 igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir, "i915_dp_max_link_rate",
> +								  buf,
> sizeof(buf));
> +	close(dir);
> +	igt_require_f(res > 0, "Couldn't read i915_dp_max_link_rate");
> +
> +	igt_assert(sscanf(buf, "%d", &max_link_rate) =3D=3D 1);
> +
> +	return max_link_rate;
> +}
> +
> +/**
> + * igt_get_dp_max_lane_count:
> + * @drm_fd: A drm file descriptor
> + * @output: The output to query
> + *
> + * Get the max lane count supported by the sink.
> + *
> + * Returns: Max lane count supported by the sink.
> + */
> +enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd,
> igt_output_t
> +*output) {
> +	char buf[512];
> +	int dir, res;
> +	int max_lane_count;
> +
> +	igt_require_f(output->name, "Invalid output");
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name,
> O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector
> %s\n",
> +				 igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir, "i915_dp_max_lane_count",
> +								  buf,
> sizeof(buf));
> +	close(dir);
> +	igt_require(res > 0);
> +
> +	igt_assert(sscanf(buf, "%d", &max_lane_count) =3D=3D 1);
> +
> +	return max_lane_count;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 9d42a2b35..1d3226c5c
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1249,5 +1249,7 @@ int igt_get_dp_mst_connector_id(igt_output_t
> *output);  int get_num_scalers(igt_display_t *display, enum pipe pipe);
> enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd,
> igt_output_t *output);  enum dp_lane_count
> igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
> +enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t
> +*output); enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd,
> +igt_output_t *output);
>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.34.1

