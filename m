Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF2DC3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 04:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6474610E4A8;
	Tue, 20 Aug 2024 04:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqP5kp+M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6437010E4A8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 04:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724129695; x=1755665695;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BvF4qDOkgq5KtONmvtOadrpfiFNGltJDfoW3by6FOR4=;
 b=HqP5kp+MeN/+NQcCcOZSBiPsnZql8kNEn8gIYSOxWZqF8MUWzWSNhQD7
 mwKB1oweMeWDFrMqXFaqbI0+owXxmR5jLiN0H22KszAF7FwbFpAOzJl+K
 2MrIT5S+MbQx0vJ8x44QEdGjFnLNw8P/VvT41bzTYG1FBeCckBSevo1iz
 Qc5vnus7Nxf6jbtddi8YzCo+Ra+NpuqGnrZ8EX9mOzuGBfL+bOG63/cAm
 DC1MfOc11rrb5chQoXt33X/81TwGYdlvUaX3i9a1NPboCwZ03IjtYhV1Y
 k1HDSTHCGrIyqms1aCRWyzCr7LJBZEG3AwOt2BmPIYvlKXdy4/8oQUFiR g==;
X-CSE-ConnectionGUID: 8BT45wFDRfOO7mMZlJl8Qg==
X-CSE-MsgGUID: YF5FRYRLQj+lOdSnoXHbMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22569079"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22569079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 21:54:54 -0700
X-CSE-ConnectionGUID: tduHNdaxR5CaV9EsF/VbSw==
X-CSE-MsgGUID: Q8b8NDNPQe6VOJ5Mo5eDtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60569722"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 21:54:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 21:54:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 21:54:53 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 21:54:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIT0A+ZRcMuIQWQ8OBK1sqC3CLP1yrCLcBfMC6mlg0GZpcClBBfhtyK/GgZ5GSY/MjtNqUhIckmf55KPqKEXj9S5BbRvg+j8WNf9vKry0SUexrrew3aqfRK0Ao8Gy4ZabTlyDEdCEPYBGxCJt6ce4mdFA71Lpa82mZCHKTBIMyhNpjyLizdL6nwyHmulIgIgMswCnKhGXMY9CeOlSzodcNRL6hygkT/T/LebI5AwZyQ/o7LjUxDQS5c4WXLZ09hZncTl/sddYKxTI4umjN8oK8DIt6f3/b82zkMCATdXvHa4LlN0wqX4EnAT5yBh9vgX4igom/4F+l4O/8EXtGA3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xH0p01njR0Hocrr0kAgt7kEULNWf1OxXWOzha3YkdN0=;
 b=qJ1b7b2mjszeThXq1ecTK20bbEXtl90ip6yWBuz+g/2xuc52Fcz2nZXQYpOQ6Wm3FeKfwXmzj8WtYg8Iqy17oDkPBtS3suECb+8xWEenre/F+P26CoKvd47GP3baxkWeWCC5o7YUC/CZiRXdc2JzpyhzspZ6OxjX+cjihMLIkbtNqj3EmFQ1tHiJ81P2mcfXjd8zyYys3Z5VzstH+uGokEWhfP/ga9DpOANEcGM38kLwdRglMP6zvaqpltpSUE6IzewJhvpk8Tqldh3ggKVZQ8PmvcFKxysctgZu/9YP1wVFEfmp78kzXbaXP1jOXpXjeBH9qFSFk59+ThUf/UUrsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 04:54:51 +0000
Received: from MN0PR11MB6301.namprd11.prod.outlook.com
 ([fe80::9937:be81:6c0:505e]) by MN0PR11MB6301.namprd11.prod.outlook.com
 ([fe80::9937:be81:6c0:505e%7]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 04:54:51 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_3d: Add more logs to skips/failure
Thread-Topic: [PATCH i-g-t] tests/kms_3d: Add more logs to skips/failure
Thread-Index: AQHa5wNW7gcqiI09A0yS2EDMo2Z9o7Ivqoyg
Date: Tue, 20 Aug 2024 04:54:50 +0000
Message-ID: <MN0PR11MB6301CFF3C23912653C0EFF01908D2@MN0PR11MB6301.namprd11.prod.outlook.com>
References: <20240805064712.970488-1-pranay.samala@intel.com>
In-Reply-To: <20240805064712.970488-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6301:EE_|MN2PR11MB4678:EE_
x-ms-office365-filtering-correlation-id: 0987258b-99d1-4716-c7fb-08dcc0d4397f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?c1sHLA6xDnWRJ+LkgDWApbS4bvdwySVHEzA80RlsFaTXImoIi6tBIUalU0qZ?=
 =?us-ascii?Q?gnyDNjiTvsmOGXF19QXBSIZY0UN3pj1pZacESpc8cXReIO4A4JfaOcwPU4Fa?=
 =?us-ascii?Q?4JfceTRlwi5I7VEuY9E1tZV1kHsJOMjVXXYoMkFubpezwN1QBLmPlJnyIb6u?=
 =?us-ascii?Q?ZlwxXCo6NZPJ/odawH7IpyXltsZYtVXUZMmjV7GtZ/tdB9wRivnCrMmSXLpx?=
 =?us-ascii?Q?jSlvzQcfqhSNxVmre1CqMf1yZfLt39L5CQtgZrKespjOj8Ltodh33WoOLsri?=
 =?us-ascii?Q?6zhBvzdfcKwkyB+Q2StSLebZhjmiDguEun6aOllMcfZMU2uoSCaYpdwWdUoY?=
 =?us-ascii?Q?UBc458ZVcQlXdfvss8bQpKBYH/cCJrdLX/lVK7irvk1GaFcJnllKX9QM1mi/?=
 =?us-ascii?Q?UCj1QDontudcHX71sU4n9QU+FYfsos8Sug5dy2okLpzGp2y/NKkZZtP6RWLw?=
 =?us-ascii?Q?e6xMXlVS9vc0u9XnLsDz7C0DA7fyFa2fntmdHGNdCeQQLGz4ippoQt6VEJs0?=
 =?us-ascii?Q?mq02ZnJNN4/nXPAoQgp0/s2VRBY6q4mgsmxqaSAAEAsEMMleGCyRk+cvSinf?=
 =?us-ascii?Q?DOoHY+Os9/ts9jo0Ver3xty86Sxm3d8cyPWwInEe53HM0F41spPuR2BoKFkJ?=
 =?us-ascii?Q?18LtbaReZjw9eFdMbIsKRfyLzl/hnbr1JZ62cnja5HWriURGIdGoVvvDoJQF?=
 =?us-ascii?Q?ZiRBNpkABhUSltkaYjcPzMavOQsdYd3M8dnQ3VtpC5jCyk9BnWnIWmREKPug?=
 =?us-ascii?Q?Zal2whoEyWNM8FzwCXAGW2ACtecfQQ1ds2OuTMBv4KhH2qfeyf1h3TI46pUj?=
 =?us-ascii?Q?kejAV0D68zgdqAbDLKXNEefX3g7LNa+Gi4sFAeWntzzvmciwK61EWrlQGPpS?=
 =?us-ascii?Q?+9tKy7jlzpsPiZL0VrRxx0bZ7upyTvCvF7KCK3b4kAMhjewbnn7CkoiFStW9?=
 =?us-ascii?Q?vvEccVLLO1bVkZwGFyWwAGNtIhtbU6oqGGaQ4OpBqdf4ZAHgupGLPUsFutbv?=
 =?us-ascii?Q?t79V6qPWEEtwV1J9uVIMn1Rk7DT2lBvcl5EcnV39HenaJNp1mTAf8yJfaKEV?=
 =?us-ascii?Q?ER5A7gIBz1ez/Mq5b/OxGeo+uKWqdsS3TB1W0x89+PamfOYzoeMKkjz6nQdB?=
 =?us-ascii?Q?ntCeMImIJogk85rJKIocDj07IzLOmf/H8gx+yVpXmDXPL0bczjGn+BucNaCV?=
 =?us-ascii?Q?+jWm9bTAwF/QHhkNFV9kdb1b6i4W762m76DvLQphCJHl+0sxZ+9NLn0gMJrA?=
 =?us-ascii?Q?TbDIypDFgop0VlexGE2JFl0gVR+P76U9bWESPovTaTOovh8xguabYDfLu7qO?=
 =?us-ascii?Q?BPfgQAPfkiQ2Rp4YdBZ0O7baBin0tEdLmvyKJV03qpCOQPBipTZKc4YEpBmL?=
 =?us-ascii?Q?ZQkTzqkYRA3D2hz1Ssz9hJh9fOzQLhhsqX6bEn+55ToeFPjmwQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6301.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1h2NnDy7Pl3zs3Oam+ZcfwvExaoBbNPCt252ynxM7dbiZ0lJRiOYToPorz7x?=
 =?us-ascii?Q?oQWIBIfcunFvM4UixSDKYRaTfSKJdLCq2j3knccFESXNWePWfx8gxwcQxYJJ?=
 =?us-ascii?Q?AIJYhE4omedIuv+DEIE+M4mBlCPnoKeoDLRtcHGWsfhVuZBaoXprOGwdqjfh?=
 =?us-ascii?Q?lhEPXEB4cxMp3qz/fQ7YYRNVPKtDtPnUQ+SB+0jVSB2B6S2zFf6TXgDQb3a3?=
 =?us-ascii?Q?wcd4ofPt6uBrL4ICX6CsVH08cX2tMpKsa+Zss4rSEemdTuXhnTVseGkgqfQC?=
 =?us-ascii?Q?f5cziLER6SVTjMPLwlS+J/8STkRZ9g4rhH1tXXdyDDUvDS5ozXPVzO4Ejtvv?=
 =?us-ascii?Q?C28Z1bJU9OTXjc9px8LsIs30ZJfr9IalIlnt7m3JwNeBIrfjpHUsCU6SA6Ev?=
 =?us-ascii?Q?CfX9puTYb9X5HA1u+fGwPF0dl+zfL5QXQW7uZeNBWsN8s54GRv79djuk5TjS?=
 =?us-ascii?Q?DtGwlyEUy/DGKWjPqd88VOswb8HVwuy298u7q/Gk3BHWRAt/9Hg1Ql6a6rVq?=
 =?us-ascii?Q?6/iTj5zVzUWAG8arD+0y42SNaRmqthM/mC+gWg200dR8icC3MoxWpXcR+Wxd?=
 =?us-ascii?Q?m+XnTfLg445Avj1IKYTyGUctN9083Cp/aibsAavwgQwomo4IJt4aybtrSnE9?=
 =?us-ascii?Q?YNoeP6dfXIUIbBz66qQVo33CimwK6pskLMupN3A6Hvap1nyRcIYN3so886JD?=
 =?us-ascii?Q?TxOUX+YJQjwk/5LBVA9ac/WK7jy8WYf/bhbZxTCN+Q9Wy+L/JGslzOhHxCAm?=
 =?us-ascii?Q?SHgU1yg+e8tJmY1rvDdCflVIT+oynXwts8bc4bfjcqgmW7f8nywsPKqqPeL9?=
 =?us-ascii?Q?eBDHPfBikGL5BNZbtxtM7Jcx9CiDD6gw+yYoF8ht6gngX3qS8o6UenEK0vYt?=
 =?us-ascii?Q?CIYm0b9BnV2/RsDFTt64fsJfHlqMYAD3R3qsvmv4Eb+F87DHR7KnAAoHNs8O?=
 =?us-ascii?Q?hQutHig+5QahVQnKY/FlhEfXPkhPjWedfOYuldtt9Du8axqg0ZHxhJ3i84Tv?=
 =?us-ascii?Q?tNpSb6b3TSueg+vfY3gBZraldKSvvpccu9Dvk+i0kM2TI3jZZnx/mlqAof92?=
 =?us-ascii?Q?E6NCdxXH+6j61uDfU4yvcQ3e3mMKT8MyCzPqTr5R4BtDGOMJQ2+P8BPHCPFA?=
 =?us-ascii?Q?DAWIEZltuICvPav1LRz3isID2kpAwEF0qWCgOuonkkz2Aor8TDeDcGKVlAK2?=
 =?us-ascii?Q?K/RVqUMiXrNE7kMiC4foAwo33JX+ss4lHk2YyeJ969qILWJjqka/nakkRhri?=
 =?us-ascii?Q?RcYitt9haqgouhjLnQlK2JFHZKzbWNQo1lTo/hl4AD9HBYSIgyrNEUBksLA5?=
 =?us-ascii?Q?X+zrozQl/niUEPagJTyhuwjgqaTQJ4W/SFDPuFXcIvexwT+6dqjGrl7WrcD0?=
 =?us-ascii?Q?4i8bku6Sl85sw45bpgvbWZVWPPs6TWUIaS18yurOjCMeQOjWijxkD3TZ/Ywb?=
 =?us-ascii?Q?/womhHaqPtwMCmNcAJGHU2+nrvtd2PXQzgQgta/yASqmGxT4U87mHhNKKkiL?=
 =?us-ascii?Q?+G400/6Ho154X3BjT1wKd9U1VfB5Knof8yIRSS2rwHKActcwpzqBnefBpMtw?=
 =?us-ascii?Q?Tt3NoS63tHdCapmd8oM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6301.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0987258b-99d1-4716-c7fb-08dcc0d4397f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 04:54:50.9748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nQSp5ot4JpgB9fTE6puLiC7mwMgf5bQC5sqx7wIZ8AR++sMGcNh5Dn/A6GO5yujc+AYnyO/DmyM6Q5aichmxMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: Monday, August 5, 2024 12:17 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/kms_3d: Add more logs to skips/failure
>=20
> Having some logs for test failures and skips would make debugging much
> easier.

Check the commit message once.
LGTM apart from that.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_3d.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c index ad6c45e9b..f79fa62da
> 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -53,9 +53,10 @@ igt_simple_main
>  	drm_fd =3D drm_open_driver_master(DRIVER_ANY);
>=20
>  	res =3D drmModeGetResources(drm_fd);
> -	igt_require(res);
> +	igt_require_f(res, "Failed to get list of a DRM device's major
> +resources\n");
>=20
> -	igt_assert(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D,
> 1) >=3D 0);
> +	igt_assert_f(drmSetClientCap(drm_fd,
> DRM_CLIENT_CAP_STEREO_3D, 1) >=3D 0,
> +		     "Failed to enable STEREO_3D capability\n");
>=20
>  	/* find an hdmi connector */
>  	for (int i =3D 0; i < res->count_connectors; i++) { @@ -65,7 +66,7 @@
> igt_simple_main
>  		drmModeFreeConnector(connector);
>  		connector =3D NULL;
>  	}
> -	igt_require(connector);
> +	igt_require_f(connector, "Unable to get HDMI Connector\n");
>=20
>  	kmstest_unset_all_crtcs(drm_fd, res);
>=20
> @@ -85,7 +86,7 @@ igt_simple_main
>  			mode_count++;
>  	}
>=20
> -	igt_assert(mode_count);
> +	igt_assert_f(mode_count, "3D modes not detected\n");
>=20
>  	/* set 3D modes */
>  	igt_info("Testing:\n");
> @@ -95,8 +96,10 @@ igt_simple_main
>  		int crtc_mask =3D -1;
>  		int ret;
>=20
> -		if (!(connector->modes[i].flags &
> DRM_MODE_FLAG_3D_MASK))
> +		if (!(connector->modes[i].flags &
> DRM_MODE_FLAG_3D_MASK)) {
> +			igt_info("%i: Doesn't support 3D MASK\n", res-
> >connectors[i]);
>  			continue;
> +		}
>=20
>  		/* create a configuration */
>  		ret =3D kmstest_get_connector_config(drm_fd, connector_id,
> @@ -120,7 +123,7 @@ igt_simple_main
>  				     &connector->connector_id, 1,
>  				     &connector->modes[i]);
>=20
> -		igt_assert(ret =3D=3D 0);
> +		igt_assert_f(ret =3D=3D 0, "Unable to set CRTC\n");
>  	}
>=20
>  	kmstest_force_connector(drm_fd, connector,
> FORCE_CONNECTOR_UNSPECIFIED);
> --
> 2.34.1

