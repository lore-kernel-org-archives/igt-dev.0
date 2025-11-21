Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B46CFA74F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 08:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C94F10E7FE;
	Fri, 21 Nov 2025 08:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wy8pvBGX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E8B10E7FE
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 08:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763715484; x=1795251484;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PZAtWUCkLTl6TQBpyAu//CyG94/QIEBFUOcGhYOqhz4=;
 b=Wy8pvBGXP5IBkT2h2rh9CSNPqOfLh6jpFC2TVPULYCVX0fQrHlN8ft+m
 7B5e4HC+lDdlNYrrUlH7CGpuL2+5NbeQRWt9PzQwOZWguDGtYzg9h6XRg
 ehEILyQTx94rBe6anfSaw6dnQuo56EQ9TDgwzLYleqiJ0ORARlYAp8yYx
 Jv3blPriZEySUut6Ap5O7uXSdqRfOVeAJSqNXbOR9e1n2j8nlUQd48GJG
 9RM0kMHYOPdwOaLuVSYLjLibTUhSSHs07Kv/BaudiLGaFnGH/8lCkktQo
 Ryu5JYdq+Tb0j/yIxFoLs9gRk5Nk2izPauEbflmHdPno8ZixyKiOzoAF5 A==;
X-CSE-ConnectionGUID: A2eMC3O9Sh6hmhUs/eAiFg==
X-CSE-MsgGUID: JrRIyLZ7TRismX9F+n9iFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65737849"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65737849"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:58:04 -0800
X-CSE-ConnectionGUID: XfCboQ1DRk+m2ntaMpf1Ow==
X-CSE-MsgGUID: n0J6r+xtTZ+hlndjaNUfKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="215001841"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:58:04 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 00:58:03 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 00:58:03 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 00:58:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/4e7Y77LLmvHI8vS9/aoIFjEjJFNjw8i7kW6Cace5/dc16230PV9emHe6ZYSGl1VRFrWSj9G47XT09YXJdDp2pu1n/lCD4drp2AX6Me3vW7Ot2YfUlx+hlpbSAmiVXCoG5O5ZUTRlb1q/WxjmBJr7bB3SBpkUoY/ZM8qt5ZkgtX6/cEFpdpmuL3t3ZCzuoaUKxl+zTKgP3FMJmvh4q7NGRCu5k5dux+uPvAq1xeqyXfb68F25iIJteaMaYtv/CvT+4ULI8cSag3g+7M5E404KD1gmImYYzqg+GvUZTHNMrA6uQspqGUDa7p3nsOzE1wo5/WdDCR5xoCUX3ARdG+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVsFWxNOw3E/hbUaHOJUv8Xsob5E4J+CBNgSHmCaatk=;
 b=YkBX8noouwW6O4dhjAf4ZKD/jlJ7oZT+/4Xa+LkNb8pP1u2cZSw7kKZUqsXfcJmTQVsdikJfzGrhoZcmzgWoZVwu6Xeoqlz6B41xNDlp4RJ6WDfIj35H/r5kz3KPEnAlCT/BQlOJFUHQRXRxbv6szfNTtJQbehHhokGaaT7kf6JGLEXNh99XFUOfRSYG5TPGPcAGdwSgONMBsqMwD6NzZl1k9M7C2XHNItLuwB95ay1riCZro/MFk1xnrWFyfzR8kcTrJmxFovJXom1EtlaLRTph54pwevaeVB4O6CfafPGKsJbPNofuzXJSzhRfhljZKtwtPbwO4Kmh8FaOGfSQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS0PR11MB6400.namprd11.prod.outlook.com
 (2603:10b6:8:c7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 08:57:56 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 08:57:56 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 05/12] tests/kms_writeback: Refactor format
 handling in commit_and_dump_fb
Thread-Topic: [PATCH i-g-t v3 05/12] tests/kms_writeback: Refactor format
 handling in commit_and_dump_fb
Thread-Index: AQHcWqlvY25wCDKnH0uQoE5Rrlw257T80zzw
Date: Fri, 21 Nov 2025 08:57:56 +0000
Message-ID: <DM3PPF208195D8DBE8B81BA00A20F4B1C97E3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-6-sowmiya.s@intel.com>
In-Reply-To: <20251121055839.3116906-6-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS0PR11MB6400:EE_
x-ms-office365-filtering-correlation-id: ae8998c9-81b4-4a90-8adc-08de28dc1055
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?nyF9n9t58NM+kb0DWjUJuiJppHhxkc68+3+6PKUbGSy0WKLMNFgchijwjFG4?=
 =?us-ascii?Q?6hCeQF/lFnDHTvOEHeT/7AZVNpUWLge6oZe/acz0KU3ODfKx75kwS6RkHjzO?=
 =?us-ascii?Q?3JTwiujpPOQwu8pbQz8d6I+OZP2S/TZB8Umulm3c4SrOkPPVj+x6hrYkCWak?=
 =?us-ascii?Q?0kWXrAkkMMP6p2Sp6hyaoU4QcyQGMC80pc4+/WVDjO5NSWQCs5hIe3DWWN+k?=
 =?us-ascii?Q?aTX1mTEGFCfPDr1WaRuhqoPVPGFp4gth/nLn+VEYOwF23WNrB5C0TWAbfxJT?=
 =?us-ascii?Q?sznQGqITtjh6rJG1wdBWIrwH1/bUk8veFd60u2ef0dpjf8SH440gWGv6AI8D?=
 =?us-ascii?Q?KhqlbEH/tW3qhY08ZacYuq+Rl4WH/SfEZUpq0cXSaFf4PazBMRqqHRWsFbCl?=
 =?us-ascii?Q?WHll/Ajy1ZoYPhl9SccqsTSoiaFrSygbPy9ZsPF9xFcIGVbAmLqkahh/eadF?=
 =?us-ascii?Q?nEUSq0jV/Sw0Hk3PHxA1wfhll7FocXNOLnnPT3CIfVbMQ9eJPKbab4xt+dTE?=
 =?us-ascii?Q?aLvGmAJy69JVgVZHn+vFV5B0BrcAf56j1ZEd5CH/PcTvVrMrY3QaZXk5chI3?=
 =?us-ascii?Q?elTOlckhc+8cINOMvwKx8uTrN12+9Xry2kJEuitBZNvtI3oveg7luJr0094E?=
 =?us-ascii?Q?8cT+JulGuYc9JAR7GI3Gopo2Yg7qqgV/F8SAvgun9bB3Use/xhrca9rrIAsH?=
 =?us-ascii?Q?5Vc4jau3Z2J9jWh2hI7bSfUoJn0xrWZ3RVd7kMvFevsN6lH1ipQcAHRBEZ+V?=
 =?us-ascii?Q?8RnrpGmtxZW3+2c8Oy+bZ14v8q7ChszKwyJtPTTViUPlBsbnQZxKytA/UiZh?=
 =?us-ascii?Q?9y0H2lciK4qaH19fSeIsRnAUwNKnY9NVY/E7gIxrSwTv66EigdkVfXXjcrrA?=
 =?us-ascii?Q?H3/pH2Xy0q9O6JJQ9ilx15T9wdUrJRKsBs91gamgghRFkbiggcZtdedzITTn?=
 =?us-ascii?Q?pwveml82Z8YswAKjT5wGmM45bUAU7ch0577gUh6O9omSxC/g4rNZ9lezql3s?=
 =?us-ascii?Q?k0hl5IpFo1gNBQ89v4P8epXGZbOA5kHPgw+SfmdQxPFjWuNXkCDhhrrOHYem?=
 =?us-ascii?Q?yXYkpf6gfbzcTIK/eqVkFh8e20oc27VSmMwAJSWwY2xKMh1bnpdRDLIL+bW2?=
 =?us-ascii?Q?p1GS/viYSxYNKfc9l8TVqn6OYQttU/MJROn286lV1swbkwivjWEqoB3YN8g+?=
 =?us-ascii?Q?mV0+pY6fqeNhuXBplZS0LWGp5UROGXdg4MSfLhx1CiZhzHtOh3LNdc7sy6yD?=
 =?us-ascii?Q?/PspdnsVGw/whUuv4bx0hahQSRgCm0IeaCQqJKbqUiUSWR6cF3mv3XXL7Sh2?=
 =?us-ascii?Q?LHIDwTBtPGOVQnbQwz+IOskCSuDpPxLLjizqTjH6g28tRK04t7Qxhsn7apFP?=
 =?us-ascii?Q?3IWelnK0cEh/zngJ2ICq+McEhmGeu+hE5dF5+RgVU2QUGnm1V4k+NgAt2ac0?=
 =?us-ascii?Q?r3kNfZUtulpmA++0srIHkdsik9GKUmwVWY14SIopA3EcmXlw5wbkv/JxrHiB?=
 =?us-ascii?Q?ZPKZz8H1oJPo7SgK8jI/itDB7UltvGCUSc4q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?armQddDIIrxxj9mdBftjZF3cFtI4PD/WhMmoAZcioJ0baojRR9CM92fZcMtZ?=
 =?us-ascii?Q?I986SO9G5GrBq7oytjwE+3u4M1iEKASgF0o3x1XTmoqVojsSukb8t3vDIvs8?=
 =?us-ascii?Q?RDG2fLUYi6TL+MurK8vEwYi/GkaDarmkYvJiwHEIuTwn6LuPn2JpRnxCPzEg?=
 =?us-ascii?Q?BjJ/VhOgPQPTEuwGkT6gHABLrO149i4+x3HMD4iEqvq4wiexQBtfjdgHfQBh?=
 =?us-ascii?Q?15F3Yh5IZYxMl+83eM7+xMZJILzauCm/DPa978HEFK1rrfSU2mDfqIujPbIk?=
 =?us-ascii?Q?clwAMwpeC+JzHPdbDVtO1M7X1x4LXWQm6GEmkcIRy8ZAnRc308yXpW1ExRaS?=
 =?us-ascii?Q?9I3tGCzaOogvhyflN6IfmkO8kx1iPE3WlSJbxb5tfB1Lzzk5AET7YaL8TF8h?=
 =?us-ascii?Q?Fx29Y8Ygs6AjVtv/KpQMa0Wb4B8SbniuHLDAAtgU114gvPn/OWwbKEoyjRjj?=
 =?us-ascii?Q?LZ+FBkW57dmUX5Wr5NAi8kCcNMQT8m1UgOlKz4AzJy83radoKsoYPN8eJe7C?=
 =?us-ascii?Q?2ZMbP2Ri3M3nhTq3QQfLl5nOk5Y5GiB8Jh/3iMYaG86NwtwuNxWuCeH24PJ8?=
 =?us-ascii?Q?uwLIEtGUXqVhR6y0WPliRm91kXX3jHSNq5kYoiqZZ7wENMutfdHpQxizG97U?=
 =?us-ascii?Q?dgGRbysxr7ePtheAADFzfIr35NV2ReKaiR+lEK50/lkMdwbL5bv3e5b/h9gH?=
 =?us-ascii?Q?6QFuzMSZLzoJ//49GW1HbKtbY8eD4U/ClJERx5R0Lo90eUlGZ5zb1p6NpE6i?=
 =?us-ascii?Q?T/nzypOAqbeto4GhESghA2SCZ8guG1c9zu/KjFlVN/3a6jEeG7EUB5GFK4eq?=
 =?us-ascii?Q?POF+hzQw8fQRQO8Zl4byTiNwYPCzT+DaXrFOVR8uwBBaH+NU6INdLwmmxaZu?=
 =?us-ascii?Q?05Cg80pUlxOupVj4gioKwMk4qn69qM4YQVh85Wc+rV1NsXSNFlhirie2ON/L?=
 =?us-ascii?Q?dZi7rnLV/1JGrFNZgGXDr/xwMrltCciohgl+hGI6k2eg+jU0DZMhZ7XBWtpX?=
 =?us-ascii?Q?52z2AqtO9wKWgUPVtPl4gvIYxlgtIt0qnLeBzen69PQcKvpQIsyeSPYC5oJp?=
 =?us-ascii?Q?ai+iF4fm2VWUUzlMIRsmhtEsyeYrIxC795EQvbg9sVbAMR1kdBLJVEUepW8J?=
 =?us-ascii?Q?SXWmEQjx7luPCQ1WXGU33QilClwDTMKcWoaWqAOP7B5Hmfq2hi6W1UOwnhe5?=
 =?us-ascii?Q?4FkVshvvSglDThVjnQXGAGRu6Yvvp9qpytpDYjMdxBuGpdXOZYQoNlhNF1I/?=
 =?us-ascii?Q?KmPhPtI1JxNmarSuCnMbO99dyHEI3OvvJ1NPgAzvuaWPEIBPvYApB53SS/f2?=
 =?us-ascii?Q?ElSUsG5R42C2uDrm7605OuD5JHCM15xUFZZPwq/HTBlsSU5luW/4S0EYnTek?=
 =?us-ascii?Q?lzElZ/6PnDIPU8ng319lGYVT03E7uVehZBbM6cJXaHgDjrjds4sLLNEKwgEA?=
 =?us-ascii?Q?rbVelspyaQJJh+nqdW2QjYz4K2mY4ef+VHEq8gta+PoA6iU2iAJCA7Pkzugl?=
 =?us-ascii?Q?TRMlmfew/bxEbeArSepbiQ435cpZvG3Duw9GOC3ZxwEisgdYI0cuS/COp30f?=
 =?us-ascii?Q?uyWzJ6IYZmSlOJt3v50zjEYpXGzQnKI/rpH6nmfS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8998c9-81b4-4a90-8adc-08de28dc1055
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 08:57:56.5095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ln6Ws3s4jnMIpUhSD2VKg+UnKilr99bDVl0LyO9hs/VLVVDihNXQgaJs3cP46HpH8QMlEMlcnr2v33j0AaDBRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6400
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

> Subject: [PATCH i-g-t v3 05/12] tests/kms_writeback: Refactor format hand=
ling
> in commit_and_dump_fb
>=20
> Modified commit_and_dump_fb to select supported formats if provided;

Should be a period here .
Also keep your grammar in imperative mode. It should sound like you giving =
a command to
The code so this needs to become "Modify commit_and_dump..."

> defaults are applied based on the platform when none are specified.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 45 ++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 40 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> b6d38ab28..46fada8b8 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -444,7 +444,7 @@ static void do_single_commit(igt_output_t *output,
> igt_plane_t *plane, igt_fb_t  }
>=20
>  static void commit_and_dump_fb(igt_display_t *display, igt_output_t *out=
put,
> igt_plane_t *plane,
> -			        igt_fb_t *input_fb, drmModeModeInfo *mode)
> +				drmModeModeInfo *mode)
>  {
>  	cairo_surface_t *fb_surface_out;
>  	char filepath_out[PATH_MAX];
> @@ -452,17 +452,51 @@ static void commit_and_dump_fb(igt_display_t
> *display, igt_output_t *output, igt
>  	char *path_name;
>  	char *file_name;
>  	unsigned int fb_id;
> -	igt_fb_t output_fb;
> +	igt_fb_t input_fb, output_fb;
> +	uint32_t format;
>=20
>  	path_name =3D getenv("IGT_FRAME_DUMP_PATH");
>  	file_name =3D getenv("FRAME_PNG_FILE_NAME");
>=20
> +	if (!data.wb_fmt && is_intel_device(display->drm_fd)) {
> +		format =3D DRM_FORMAT_XBGR8888;
> +	} else if (!data.wb_fmt && !is_intel_device(display->drm_fd)) {
> +		format =3D DRM_FORMAT_XRGB8888;
> +	} else {
> +		drmModePropertyBlobRes *formats_blob;
> +
> +		formats_blob =3D igt_get_writeback_formats_blob(output);
> +		igt_assert_f(formats_blob, "No writeback pixel formats\n");
> +		igt_assert(!(formats_blob->length % 4));
> +		for (int i =3D 0; i < formats_blob->length; i++) {
> +			format =3D ((uint32_t *)formats_blob->data)[i];
> +			// Skip zero or unknown formats
> +			if (format =3D=3D 0 || strcmp(igt_format_str(format),
> "invalid") =3D=3D 0) {
> +				format =3D 0;
> +				continue;
> +			}
> +			igt_debug("Supported writeback format: %s\n",
> igt_format_str(format));
> +			if (format =3D=3D data.format)
> +				break;
> +			format =3D 0;
> +		}
> +		drmModeFreePropertyBlob(formats_blob);
> +	}
> +	igt_assert_f(format, "Given format not supported\n");
> +	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay,
> +			      mode->vdisplay,
> +			      format,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      &input_fb);
> +	igt_assert(fb_id >=3D 0);
> +	igt_plane_set_fb(plane, &input_fb);
> +

This whole block is not needed according to me keep it simple.
Do not remove the input_fb as a argument to begin with.
When creating the input fb just create a drm_format variable that gets assi=
gned
The correct DRM_FORMAT if intel device or not and no need to get the writeb=
ack formats blob here and assert it.
This function isn't a test of that sort more of a tool to see if we get any=
 real data in system memory.

Regards,
Suraj Kandpal

>  	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay, mode-
> >vdisplay,
> -			      data.wb_fmt ? data.format :
> DRM_FORMAT_XRGB8888,
> +			      format,
>  			      igt_fb_mod_to_tiling(0), &output_fb);
>  	igt_require(fb_id > 0);
>=20
> -	do_single_commit(output, plane, input_fb, &output_fb);
> +	do_single_commit(output, plane, &input_fb, &output_fb);
>=20
>  	fb_surface_out =3D igt_get_cairo_surface(display->drm_fd, &output_fb);
>  	snprintf(filepath_out, PATH_MAX, "%s/%s.png", path_name,
> file_name); @@ -470,6 +504,7 @@ static void
> commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
>  	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
>  	cairo_surface_destroy(fb_surface_out);
>=20
> +	igt_remove_fb(display->drm_fd, &input_fb);
>  	igt_remove_fb(display->drm_fd, &output_fb);  }
>=20
> @@ -599,7 +634,7 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  		if (data.list_modes)
>  			list_writeback_modes(&display);
>  		if (data.dump_check)
> -			commit_and_dump_fb(&display, output, plane,
> &input_fb, &mode);
> +			commit_and_dump_fb(&display, output, plane,
> &mode);
>  	}
>  	/*
>  	 * When dump_check or list_modes flag is high, then the following
> subtests will be skipped
> --
> 2.43.0

