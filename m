Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A397CCD185
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 07:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A55E10E26B;
	Wed, 15 Oct 2025 07:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FyhPTUkc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49E010E26B
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 07:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760513190; x=1792049190;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AJ1a3U5ercBC1ypAMhW0PLrIzeNrJbCYfej+mnFtI4s=;
 b=FyhPTUkcBw68Bk4Ao1VIcAwmJQVzVQykZ58jcBoo/ta/L1Qwl2/79WMU
 n/LrydPiDKIYS55sK9tQR4m3t1t/3A51danG70Dk0ghaRRLJ00+E5UmvY
 KeiBWdPtVsv8rg6LW8CfwiUQ+UQ/S1+Jf/7ggMsSyIVcpEkRpAFoBCN65
 Ij+JoaB/lcJqBC6GIIs6KkDZZF1ORA5uU79dZcLAHQtty0GccVCNEVTUS
 5nmzCv+bBv2cRB3wO7/cLJC3wa1sf3Uh7xASl+T6zCPHJtYNOV2aqGunH
 Ku92leazF2GulzgVbBiZ0ZqVUJ/Sv8KSvhQ+UaXOCrq2uIX3pjC0e7NIG Q==;
X-CSE-ConnectionGUID: bgxULy7eRkuC3CW2sqoI9g==
X-CSE-MsgGUID: uWrRwr10SD6GWEsgR6EFOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="74130632"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="74130632"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:26:30 -0700
X-CSE-ConnectionGUID: QERspOjPRS+Bf9MXiF84CQ==
X-CSE-MsgGUID: e7nC75CRRvS6n6D1crA8Pg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:26:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:26:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 00:26:28 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:26:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BC1hW1MrwG7+Yp696XfJbkQR5t1FF8WfoTkx8HO7DO46cTqvP6u7sNx/uuHXGQAI0rbPepWsPqHUw+oYz+zSbsYs6MaA/5Iu4TTgRQWG1gvFGZwqijQ4O8mYhiGPtmGNG28WWZBF9CGijXxDXtnIjyJQDO3Cl3dU1kTBW/y7hzzUvJ6zIc7McY03V3Q7503XD+jrHK2RmEPCENJp2vHCGpZTR7n698n1kknKyR3BDGv9pTR1YXt2OftaZtC+/JwGn2szDMTBQCqZuaa24O2cCfwh7soA8pYrPe0Lo0t1gaz814GDt7nB+qf199Rx2zl4oDc/vfkkJZrELuYUIyihIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPh1F7ZkRkkXaHf6ijJWePfdHxzMboMsXfdtcYJSwCk=;
 b=d38giOuJt748YopzylnzGDuIeSQKvEh+ki1O6cew1rUmFSGFTc+fCVnGgjqbouT9mppPE+nbkDinwRk1u4kE9RNT+0XO0i4bdCe34L/Kll76CDxjSiZEwLB+Q59GAHOFBgCGr1ynKOIf93+LsD26ah0Kg/kl+BRF+rf60XUXVDdJ2Bz6nKV5Qv1PodEvcr5kMyHbV+z4qXRlFzdQGtEHrxcu7K8eeS2Ej1yosL552+p7YwPs70Nur09bc/rT/RPd1hbHJcPvb1f2zukLbe3B2KOOdWdQKNp+T9fBVGpjWYXSzXru3QHOj8pgdJ/0xjE/m6y68vNJMhC0zbtvlm2sdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by CYYPR11MB8387.namprd11.prod.outlook.com (2603:10b6:930:c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 07:26:27 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::112f:20be:82b3:8563]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::112f:20be:82b3:8563%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 07:26:26 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel-ci : Add Xe Multigpu blocklist file
Thread-Topic: [PATCH i-g-t] tests/intel-ci : Add Xe Multigpu blocklist file
Thread-Index: AQHcPZ8mnrL/6abkKEC7knxIbN5WzbTCzqOA
Date: Wed, 15 Oct 2025 07:26:26 +0000
Message-ID: <IA3PR11MB9013243C10D56B98B9C11D3A85E8A@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20251015064406.4076-1-himanshu.girotra@intel.com>
In-Reply-To: <20251015064406.4076-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|CYYPR11MB8387:EE_
x-ms-office365-filtering-correlation-id: ef0d42e3-1473-44d2-5b6a-08de0bbc26ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?EpqWrXKyg8aqCDhijEhUHKgWry+JvJV6mFTrEkVrFm1I1OCSeoKLIup7Kjq4?=
 =?us-ascii?Q?imNovQ2A2V2hyxRXdxBN8NvCs2fHIJDCdjUxc8fAr8CpAVArWwoxJV5l2E+y?=
 =?us-ascii?Q?3o70/1Czd2PMrFXe5tkTkareQUNvy0dkRorLwfTB9SZg+A5r2xy9A5IbBJrL?=
 =?us-ascii?Q?QbRLmAV1ap2IEvSZ7wrUMMV3w7AvbtIjKYsDPVp1AzRm7kFVxH9fq+phRRRW?=
 =?us-ascii?Q?HQWodIzTALGLL2+XuS9DdSAExrn2n6AGbrANpbf67UaEzpIwKA+veBXfdIC4?=
 =?us-ascii?Q?pLVJoI6m5bbZBx1sPwvEhUu/XaZ3wJGfQWoBb0EPrbKPWuwpXRlOnsILtgXM?=
 =?us-ascii?Q?Bgichjdcw/n2AR8UuX1Ji86FLzjJFZIv/DWQ+kFn1xz5Gpt4mHlErbuTTu+9?=
 =?us-ascii?Q?Z3eVfjGFKvSSXfLJAdxS8pGsY3mHgBFrbF0cjjJg6zTgz7zuo9G59BVKpMUs?=
 =?us-ascii?Q?QYD3N0QYKTECDg8CkqL2xmgF9CDcJ5ua+t3oPvgffKBRMd+pNB2qd5TW2Rgi?=
 =?us-ascii?Q?lFJ8k6UaOsW8FbMIHAloH7684Hc/yIQxpNPAnrfuzi/o7+dfvdp4sN7Z53FR?=
 =?us-ascii?Q?m0Bd1Hw0sa1/yhL5Dn/4BFkC4GegGoSURuvMPlVvzMO9N/EEYJv029M9JvRN?=
 =?us-ascii?Q?GpF2pbDgCGS/VuXGZv+V1QqZDZfVabXOX58Gyoc4kEif3OnljKNBqHCUqxWM?=
 =?us-ascii?Q?lghvUVYZFqgBtPS2BPJyWk3/E2RFs4BNLrvXpnLOIJ36LCRUgU8fJbpoRicI?=
 =?us-ascii?Q?6xJ0+d2e0ucXaiLYkGA2Ce6VQJtwi/XH0wi3jk735u6L1vmxoCvyJPBK5Clo?=
 =?us-ascii?Q?HAElyOZqvW5q1Z5OBX2jMNgKKSIvy9bUuS1ldoNi5+mc1BkMD5ue9G1b2GEY?=
 =?us-ascii?Q?glSn8bUDInx8JmFlTg1J3MN4k4f2qsXGgdrKYD3T++zKMmXMa2F+EcYwoMzi?=
 =?us-ascii?Q?wwoklbGe7q+yFAxD2sQX9/K+yo2T1OSiUMCpwl0Ns5lW8h2LcSzNYw4hywSi?=
 =?us-ascii?Q?fD6Mdkqzk8RWEUQGqhVpm7MsjSERBA3FWsHQ5mHMVd1HYfp+dDwwQ3sKm5DG?=
 =?us-ascii?Q?pCvbAFnTpofug778bOk8ImBoobPLck7bqDGDRBa6qKYE2muPqRXSmxXnw0a6?=
 =?us-ascii?Q?nyVjUcz5LSDXiG3nnuUT6K9/kVbqfnUiCq6wUrEBu1HlMyliZrg2tYTR2OuP?=
 =?us-ascii?Q?OKr5x+uZpuAY9gsedp8SNlYvdnTAxX5JxY+kmgtRiRSs9Zsh6svtJJ2dM7Pc?=
 =?us-ascii?Q?3X9ZfWCHuobKUGpX7mD8LdKqjcwvPWmGHm+Osnk9IcFC+bU8zXdG+IMhu99f?=
 =?us-ascii?Q?Zbhp8SJtjPceUe/m8TCLIZLtKUniC1ZjLgnVvSkTysHigH2QIJ7ZarsDhNql?=
 =?us-ascii?Q?mCKRkV48yXRtrKH0kxwccsOuqLOH8KUkQGpwr1H+/76BT1lF9Z8u9QqVDzYK?=
 =?us-ascii?Q?pyybSFVujiDgkT9fGNEbDora1dR3uQ1MZBRsmhWV7ZPWa2RNkheGY06H7Bkw?=
 =?us-ascii?Q?xMov3z3QT3Y2RNAxjBcY9Qj5XTIBGhZTF6ji?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PT9E5R8dsFqQ12dkPsFnDrPwzD45qg246QUO8h95iignUXW6ePBQQf6j6SOH?=
 =?us-ascii?Q?qXZGCvrdakEG2kqgCI4sM2MCmwPcwENO9Ukvn6q5c825S0dOpuELqkLk50Mb?=
 =?us-ascii?Q?s6ef03176QrRhQ8yjBE/m6Y8XO2eKdIQIzvuMAvq5NQWlGCh57KWYKHgxylq?=
 =?us-ascii?Q?3WhvRpnWrv8qHcggJbMLJxgsl34pnsAbG/y6HOfkWBrXPhaZTn0izp9qdPAA?=
 =?us-ascii?Q?HdNG8KrTOXFSO5nnBM8SVUWaT2dc+uGR7NFZweNt+m6ucC8eaAJ8z+NK3gAz?=
 =?us-ascii?Q?rl2Ec5POCiFF+ziIboidPfKYFz/o3zPELvrsRxW5qAG1gtXkiENgCNI9Ho64?=
 =?us-ascii?Q?DV5ws2ikOMFo6ejjK01J3OoIqqlYyG0z0pYdPEpxIOCMatFvoIAnutsHXWF4?=
 =?us-ascii?Q?1RguIzhFaOHBt8eoaN+Ylu+N2/hGJHpmjI5OA0CKuO5inpLXXTDDA2TyaCbN?=
 =?us-ascii?Q?6DORdXXYUciKRhXG8hMQ/MayJXBPBpQmI1qzMqvOdeqoNj0P+arxjz85Dw/S?=
 =?us-ascii?Q?B6/rvTzfbw+BqizeT36C+QkvXc+kNa5rI8eI2gEeUlJOGkT80UT4G2Ix+qbG?=
 =?us-ascii?Q?wAWJzGVR7A8011/2UZhX28cM9XNmocz6HXOOioO4AvShArtBOE0OvEIvE5v5?=
 =?us-ascii?Q?Su8F27KJ9WgKWFTE/9IIg8UVcYV7b5Vx5WO8ccguWZTvnekdG5Um0j6ERVtd?=
 =?us-ascii?Q?j6wNJGWnHcccZvHk3hJL/4DSbReQWnU+b4Z9kGk5s9ydv4hLLgGRlZSDlEgf?=
 =?us-ascii?Q?zmdO57P5BVKPN2herib+7NnHV/zDA266lbs3Vzg9jS1dR7tiELmChzQKJhD9?=
 =?us-ascii?Q?tkd0JZCw504T/vHiJECWonJERjIPTNsVE7sQQkEeiXElHpedJGfbJM/03nZV?=
 =?us-ascii?Q?2CK0IBH/L0FgE6ficEfHzJ5GyPnoEB6UcPeNNc5uqb+tiwozncIsu5vgJ2SB?=
 =?us-ascii?Q?5Fw7baiVCoEcdVFCdT9zpSi/AwgCVjcxS0QiYgT7bPbj13uWL1HQ8mKb/rkd?=
 =?us-ascii?Q?BnpDzEi8EREjbcgCoA4rzt0LMsNyJ9Ahr99BiNxe3io6CfeotvTtFflwvL7p?=
 =?us-ascii?Q?0MqpNEa4+OaHqu8nZlbguIjrGzeiDElIIKPtJqe6tH9L8jeB8Gmtk1yV2lne?=
 =?us-ascii?Q?DqDTofZi9R6vQ9YGIo8zB0fTQkiGD8W0spsF4+U79d179zWDK6j5S96nZfUG?=
 =?us-ascii?Q?W0QL8zXcA/h3HqAtOfCjCx5mms2JHQVkGMbFlnl58aX+S0PfAkpk43maGaAb?=
 =?us-ascii?Q?weRjVdDpLxZAeI5QGZSYg6NF7oHVZuFX+WT/nSS4j1TXmwSs1A8Qrz/WWHZB?=
 =?us-ascii?Q?m8VyWIAdKCO0gM1sMpm0j7uMgl8dTH0t8b8ngWY18EOLpGMkaEA9gfiGcQB5?=
 =?us-ascii?Q?LI9vW3FSihopVHTnEJiajakWH3VknbmpubP+EBXTcYdGNQ+TpGOIT21/3FxP?=
 =?us-ascii?Q?UEHhS25plW1dyBAUSwghOUMzArEywn4uDidPTGnKI4tGwed36KOqISXd2tRY?=
 =?us-ascii?Q?KR6cXgm5J3r2QDQ1RD2VC+Cnxs6tJOz+v9KbMK14bbjl6RnDCmoLlukCQ0wD?=
 =?us-ascii?Q?tNG6IoVikv59PSKN/CwvwsJWDfN+/t/zsvd0kbk6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0d42e3-1473-44d2-5b6a-08de0bbc26ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 07:26:26.9008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YJLrjO0Qi1Mg1tr1V+f5hfH2aebhqZrrkh8q7X8qC3lOnBL+uFNCU8XhLoTKH/r4Un3P+2/VlIfw6NeidR8IG1JenoL5yorD8dXAne6cOTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8387
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

LGTM.
Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: Wednesday, October 15, 2025 12:14 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>
> Subject: [PATCH i-g-t] tests/intel-ci : Add Xe Multigpu blocklist file
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Add Xe Multigpu Blocklist and unblock multigpu tests from core specific
> Blocklist to display the metrics on Grafana.
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel-ci/meson.build               | 1 +
>  tests/intel-ci/xe.bmg.core.blocklist.txt | 7 -------  tests/intel-
> ci/xe.multigpu.blocklist.txt | 5 +++++
>  3 files changed, 6 insertions(+), 7 deletions(-)  create mode 100644
> tests/intel-ci/xe.multigpu.blocklist.txt
>=20
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build inde=
x
> ca50e93aa..0c3b79d51 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -21,6 +21,7 @@ intelci_files =3D [
>    'xe.lnl.core.blocklist.txt',
>    'xe.lnl.display.blocklist.txt',
>    'xe.lnl.eudebug.blocklist.txt',
> +  'xe.multigpu.blocklist.txt',
>    'xe.ptl.core.blocklist.txt',
>    'xe.ptl.display.blocklist.txt',
>    'xe-fast-feedback.testlist',
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-
> ci/xe.bmg.core.blocklist.txt
> index 25da760aa..15dbbf2b8 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -18,13 +18,6 @@ igt@xe_media_fill@media-fill
> ################################################################
> ##
>  igt@xe_pat@pat-index-xe3p-xpc
>=20
> ################################################################
> ##
> -# Expected skip on single card machines -
> ################################################################
> ##
> -igt@xe_peer2peer@.*
> -igt@xe_query@multigpu-query-.*
> -igt@xe_create@multigpu-create-massive-size
> -igt@xe_exec_basic@.*multigpu.*
> -
> ################################################################
> ##
>  # Expected skip - small bar not supported
> ################################################################
> ##
>  igt@xe_mmap@small-bar
> diff --git a/tests/intel-ci/xe.multigpu.blocklist.txt b/tests/intel-
> ci/xe.multigpu.blocklist.txt
> new file mode 100644
> index 000000000..387c3413e
> --- /dev/null
> +++ b/tests/intel-ci/xe.multigpu.blocklist.txt
> @@ -0,0 +1,5 @@
> +#####################################################
> +# Blocklist for Xe MuitiGPU tests
> +#####################################################
> +igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).*
> +#####################################################
> --
> 2.40.0

