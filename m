Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648F7C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 18:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300A510E277;
	Wed, 19 Mar 2025 18:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VC5BC4XG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5340210E277
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742407203; x=1773943203;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ej+wvFcVP0KY5SUcs0PIMnDSZWawQZmpZAxi0ZVN9gs=;
 b=VC5BC4XG1MTQwbQGjmX5H5qrEQK+ip7sLM0egqRW1MCf/nhGB1gLGYC0
 HzSCMKi+94cJ85XeTOlotOa+Eq6w+vgHRgNwlF9vAZXCC7CwqfXZH2hzy
 jT8AJ5pF/PxMYoKIMOe7011Pf495m9Y4K+CwpNfpDm0bDVY02ztTDalHX
 V6sTnawns3UNTsWsG8qb3VHjW9fBVDl4ijHeq27gzaa3Deq4XFtv7kAEK
 aTPr0ksQiuCEuf+kagpKpvLwdbTPgPYDGlumgL7FMsuXN1IvEIdmuEEJo
 63whCpR6PTaQTZMoHB5RzRLbPk8OXL2A3xpStu9VyusYLo9dW7ml2ww70 Q==;
X-CSE-ConnectionGUID: /+6jfuSNSM2kfRY17E78/g==
X-CSE-MsgGUID: ga527rLLQ4efdMvLOmGrZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43798589"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43798589"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 11:00:02 -0700
X-CSE-ConnectionGUID: 56FX2s0YTcKAPkYFhFEWsQ==
X-CSE-MsgGUID: FTpKB1wZSs6oFhVlUefiag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="145929177"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 11:00:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Mar 2025 11:00:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 11:00:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 11:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brZzGwD3rZUbgz9ZDT5EJjKk+QjF4qgY5opb+r7JTKZfSn2a8VSU286BNJKlHwbjglFVynPMc/oznqG+M6TOa9Kt07o+m/G2L27fYsUvcYIBWtYj0LeqaQyQRXvEqAi5hJG1j6+EIJuqD3Zjjxqxjjnr426H9o6k9zgc6pkzqumwG7WZ7b5EwIxcxns1GA9/pYcedS8snQrbaEhBkDKQAZ+DzvcgOndPCBCNlanGoK9VmfVSVkJvJS55A4m1YtoP1mTHk/RycuNHOoIXT4Y3nk92OnNuHGZm+42y7whfCdBWMvK3jc7t/D8THtzQsT533xsYBeOmTSUrK9/N0zxK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAMTJhgny6XfdqGqjub/duMgOjmKzPDy3fTNJfGnEGc=;
 b=eYSt9oDeq/EBVAAJ74SYBfvjZ9sFt9+V6iI+VwkHbRi5qmQ1jmAolnn+CuBo2B6yDqJgeMBN/8Q6oyc/IpKId/As0Et9KiLmbC8IeTZuyDWLnxVX967MKRVtj3rFrbZAV5DAz3ZVtxIKKBUb+BMr4LF1jmU+pHYSPkBF8PUy8nekL0F3vJAjl2UvOkze/lrdSbZEkhXN/pHSWlEyx01vXU42Xz296qUoxeyalmu1uU+FlxOoEHdueh83xi98NEaz11k6BGJWoz+OHrNwGOnA/r3eW/Hqaky+kAhD7vYy+4CrhsS8ZAJ1jm93atBgZ4nKWAlqrlKH/o8ez3tDFs3UkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Wed, 19 Mar 2025 17:59:57 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 17:59:57 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_kms: Use get_max_pipe_hdisplay in
 joiner_possible fucntions
Thread-Topic: [PATCH i-g-t] lib/igt_kms: Use get_max_pipe_hdisplay in
 joiner_possible fucntions
Thread-Index: AQHbmJXXf42lZ7qx6UaRjSY0dd4/u7N6v56g
Date: Wed, 19 Mar 2025 17:59:57 +0000
Message-ID: <DM4PR11MB6312C5E5E228A137C711513290D92@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250319061244.769947-1-karthik.b.s@intel.com>
In-Reply-To: <20250319061244.769947-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB8133:EE_
x-ms-office365-filtering-correlation-id: 017ed0ef-5a49-4f52-0def-08dd670fdc26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bqP2nofVMdDqTdbrsqjNig4nHmibOppMJ5Mr0lZSDL0nqLVz9T7buK1pRemc?=
 =?us-ascii?Q?QWyKHqN2iJ+29JPD8Bd2M491yt52yNp6HNXc0wWOLv97cAltsW9tqSj/7xm2?=
 =?us-ascii?Q?WYXjk72ao7lCQ8ZEM9XQDwgSMeKJDm69PUpA8b3EQRUxRMAiI13o+iqaIdAt?=
 =?us-ascii?Q?/FPLDUDhlVH4KIb0TECOSibcxoJ3GzVD+PDyeD1tiQuB8MKlKcMJvH8WfHrw?=
 =?us-ascii?Q?Zy9fQVu51d6MQN0/YFI/xoG7Edc3tFnNjrQlb+Il3zFb69ET5GubwFI1m2+x?=
 =?us-ascii?Q?U2P36Id/nCmQZEPeu/PwhlDw1fVGOf2b94i8SI9ohm6Y0PRWTpg4OHkCJiph?=
 =?us-ascii?Q?dn7o2317IYoze8rlWHpkR8U4Nrq5zidQ40+KrMlRgOvyfLYUuERbBHjLVL6j?=
 =?us-ascii?Q?jTEat5wyrLoq/NXFhb3nYgLfNtGYCU2clUUy+UyoRVxrAa/xEbj/FvtEoaDl?=
 =?us-ascii?Q?G/P0NCzvvTmaJ9ijBONZCqEh9Na2r4zoZF2C00EiY6ckckmCDWUw1cJMR0Wb?=
 =?us-ascii?Q?xc+W5rbmEPqmbntCeCKqmeLZU6KKWvZTQqg6U9Nxd2seDDDWgSxvw+TbM8bA?=
 =?us-ascii?Q?KzyHWObB8YrVM/MeXfuM7MfS4P0dH8z+qGk8UgJMdT/uD+0Fx8m/oYX8XO/i?=
 =?us-ascii?Q?R5JtiStOH3e3hYbNWplCKw3jVCrF66jCVsyfhZ6pjunP+occYssocb3F2IIP?=
 =?us-ascii?Q?tPSH+24ugJS2y/d2amWILVLw93bqiO/X9i2q38flDJgcfmTvNpnjUwHjty2u?=
 =?us-ascii?Q?OO1gRnMugJs5GlXvy2xvOlBMZZXq418hDKQ8FHsEuMUinrr1fEOYFIV89RMf?=
 =?us-ascii?Q?TcZBRH0kaM+YOrbu4Hmvo71Y9AcISSaRgbYf8DhliEG9BJ2G2EX38n2CYdx3?=
 =?us-ascii?Q?q2hotJGjN23UsmjO8EahvAqfBPTeUMmBttLVI+5ZttYKS67RAN2P6TT1O4Ap?=
 =?us-ascii?Q?20XobZmalA5+PfbVazmx4VfL2vUcrfdjwcxq2gS8rFqgvuH1CcTfNT4SwCC6?=
 =?us-ascii?Q?sk+v93V39JQQHJKTTzGABl51a5g11n0NcAmKSLvr21iQ4f4Bn3LjCyIkX3ZT?=
 =?us-ascii?Q?zPPD6N3dr/yNn0XSTfxm0v9YSSEx67ah3Pbxy7BSnLj6W71iBFQxDrsBfZkd?=
 =?us-ascii?Q?IgO5jJtsE3io9ASgvuDdhvzLNFLuXrjFfTzPYY2NYVmo2axZOOGhOUZyKrPg?=
 =?us-ascii?Q?ze582gewUd9oF5PtnyhRxM/U0lYkzIuQLvVrgoyzkJqYfcA5HTh1yN8R27f+?=
 =?us-ascii?Q?awrpVpUQGiD+YCdavE26wcv1c7ZZ7ZI1pl5Y9C+Q6yP08wY9FbIYdFcHZfCN?=
 =?us-ascii?Q?eAuNspMRCPH9hDOEdZYYJetbFQAbKU16x5QUsHTliMHpb2tMF79b8R3obuuy?=
 =?us-ascii?Q?IEmV4FyTiZXqxT3yz3DEYkJ9xWdR2/i3X/BmMnoG+rTbhFUT96d8S12ofMB2?=
 =?us-ascii?Q?jH9ICPhsHdhxlNk8GG0GqT+urZfrsuKu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/HaIAU17unKl66ZiDbBrd5g5/mhECNd+1LKpI8BMBSZcoMw6I+MIjbW6pNEG?=
 =?us-ascii?Q?SKV9TItgOFIfopBzN/rZK2y5vXj9vqJZNgqvjtYDWA55UoKSSW4xF6aWs8fx?=
 =?us-ascii?Q?TLK3WrdXUYGr8LnGMb9ODiKqjVKKekevrXbiwg9vU+nREa03igpjQ+E0bXQk?=
 =?us-ascii?Q?wEk3fubdKXLuOqo2PNTRF9boG27YELP94N3AXEkRyB74NK7oOAVzBlQqSWj9?=
 =?us-ascii?Q?h9wiHuTkD1Xr+6LDI7mg2DKd6mn/q7gKhLK8vL+ediKe38mPR2tGGJhwGlyX?=
 =?us-ascii?Q?Pw8irTN+ohEDdxTRoUnfmWz2mqdDqd3dkSCXC1HewJA3CzG/Olo6zYHAaEXi?=
 =?us-ascii?Q?BP3qDc/hUnHdB8D1NyVgd/fcaTj0Ldy1QJPx9pdWZwKNjytxcpBlZUirSwo/?=
 =?us-ascii?Q?oP6wxxH+8wpFs/rsE611YdEROxcD0PZfbDp2DI6wm6Jb1tcPI+841V5FtxAP?=
 =?us-ascii?Q?chhfLQVLMGV4LsiLb8zM+PnT76c9qmr7LgYHXvyT3MWCHdUtZsYAfMKsVftC?=
 =?us-ascii?Q?0pnAxxCcuXJziSQetBgP3smcjnfjw4onXT/XQsWLhCC/aeIWB6u4yQd9FNjZ?=
 =?us-ascii?Q?UuOXrnoxZCiZYpv4bpb1XAQwYdcE8DGqYCFimCZuEzmApltCYvT5+Zbv5BFN?=
 =?us-ascii?Q?ybxpMi7DUHrNDXpHqKostNSa4BLCuHjeQF3NO7hAUHJGMjv/xkO07iXtL7Cl?=
 =?us-ascii?Q?2+XuS8Qz4+WxHY6IbIMzslaHDVr6nXHmYZCVIrpnbTMRSbdZj3LZqJqCupUA?=
 =?us-ascii?Q?oWvAgJud56o9MsBwA2au7Z2yI4PBbuYTPYKuqVl9jL1iQcUmd9zo/igEyLbb?=
 =?us-ascii?Q?4KfN6VtU1wNtZGmYPfmFLtW0BC4qjYY7gqgJ+vNIQYpIH7PHUJAWwSSDC+Gs?=
 =?us-ascii?Q?FB6a8hBbXpusC/cNTmePBratL23RMDAndDY3sqyFseKfcTzfqpUhMZ3XktKY?=
 =?us-ascii?Q?hmwBecsHPvezMnXjyz3wnXdkXjmIX1Rwkz0vT5/MxUk0a/1zHF2g3PlTJ+6j?=
 =?us-ascii?Q?qECnKnm0L3xQll3i33KdcNpRgaNelKXxyc7OV+BUPFzJScakr//+imPTGHeP?=
 =?us-ascii?Q?qT7Z5oeoKHIJOHwsCDAsD6QyhvmKLA8d+WsGHdpFuaBwbtJVG4LMTXuiUH87?=
 =?us-ascii?Q?+UnWXfPJ8Te52y7lWQRfmnifWn2HeYD/YpsVGXTClUvCsPoruz/oYLoz1KyI?=
 =?us-ascii?Q?HyEjXLeQC7JfeaBgfRysJha+D8WLA77TI1QeQ1cfa/m1JICXRJq9RxVmsNPm?=
 =?us-ascii?Q?34W1e7jCfdpLLsgiVvp3GKMmghFnq5bi5jP3Pj6tqYh2T0sVHsg3nA4ht7f3?=
 =?us-ascii?Q?dNKXvU2oH9fce0dZ7QqdmKUU0PvyRwEEyLG7pzg7SQG0Qzwg36CGyxXzXTsx?=
 =?us-ascii?Q?emK0qU8P45Ghi/runWVgywbO3JKmIRbNw1bAdCFq6JEtrTOu5iRGiJZYzlQZ?=
 =?us-ascii?Q?HUR0kG28g7CmdN0eBFVrSI2cEQhKUWIZd3QGOcNvBXwzEeenR/wdsNM5jPco?=
 =?us-ascii?Q?kGw9QT9Ui7uH36rOgJgLGp3m6xM4sTgZTEpTfr5u1AoYu//LhBCiC9ps6YA2?=
 =?us-ascii?Q?N0o3AfC8xIqqvB/eDks=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017ed0ef-5a49-4f52-0def-08dd670fdc26
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 17:59:57.1992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JhA9P2tKpiuEEbVDO3sGR8tZu2SOPM2VQHjwXjiW33Arg8NHoMJBtcoYJYFxibiCn6NaraVfG1mTFjGVcEbk/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
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
> From: B S, Karthik <karthik.b.s@intel.com>
> Sent: Wednesday, March 19, 2025 11:43 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; B, Jeevan
> <jeevan.b@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t] lib/igt_kms: Use get_max_pipe_hdisplay in
> joiner_possible fucntions
>=20
> Update 'joiner_possible' helper functions to use the existing
> get_max_pipe_hdisplay helper.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  lib/igt_kms.c | 45 ++++++++++++++++++++-------------------------
>  lib/igt_kms.h |  2 +-
>  2 files changed, 21 insertions(+), 26 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index cc3bb3ae7..99c8707c7 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6428,6 +6428,20 @@ int igt_get_current_cdclk(int fd)
>  	return read_and_parse_cdclk_debugfs(fd, "Current CD clock
> frequency:");  }
>=20
> +/**
> + * get_max_hdisplay:
> + * @drm_fd: drm file descriptor
> + *
> + * Returns: The maximum hdisplay supported per pipe.
> + */
> +static int get_max_pipe_hdisplay(int drm_fd) {
> +	int dev_id =3D intel_get_drm_devid(drm_fd);
> +
> +	return (intel_display_ver(dev_id) >=3D 30) ? HDISPLAY_6K_PER_PIPE :
> +						   HDISPLAY_5K_PER_PIPE;
> +}
> +
>  /**
>   * igt_bigjoiner_possible:
>   * @drm_fd: drm file descriptor
> @@ -6441,13 +6455,8 @@ int igt_get_current_cdclk(int fd)
>   */
>  bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int
> max_dotclock)  {
> -	int max_hdisplay, dev_id;
> -
> -	dev_id =3D intel_get_drm_devid(drm_fd);
> -	max_hdisplay =3D (intel_display_ver(dev_id) >=3D 30) ?
> HDISPLAY_6K_PER_PIPE :
> -			HDISPLAY_5K_PER_PIPE;
> -
> -	return (mode->hdisplay > max_hdisplay || mode->clock >
> max_dotclock);
> +	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
> +		mode->clock > max_dotclock);
>  }
>=20
>  /**
> @@ -6469,7 +6478,7 @@ bool bigjoiner_mode_found(int drm_fd,
> drmModeConnector *connector,
>=20
>  	for (int i=3D0; i< connector->count_modes; i++) {
>  		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i],
> max_dotclock) &&
> -		    !igt_ultrajoiner_possible(&connector->modes[i],
> max_dotclock)) {
> +		    !igt_ultrajoiner_possible(drm_fd, &connector->modes[i],
> +max_dotclock)) {
>  			*mode =3D connector->modes[i];
>  			found =3D true;
>  			break;
> @@ -6478,20 +6487,6 @@ bool bigjoiner_mode_found(int drm_fd,
> drmModeConnector *connector,
>  	return found;
>  }
>=20
> -/**
> - * get_max_hdisplay:
> - * @drm_fd: drm file descriptor
> - *
> - * Returns: The maximum hdisplay supported per pipe.
> - */
> -static int get_max_pipe_hdisplay(int drm_fd) -{
> -	int dev_id =3D intel_get_drm_devid(drm_fd);
> -
> -	return (intel_display_ver(dev_id) >=3D 30) ? HDISPLAY_6K_PER_PIPE :
> -						   HDISPLAY_5K_PER_PIPE;
> -}
> -
>  /**
>   * max_non_joiner_mode_found:
>   * @drm_fd: drm file descriptor
> @@ -6567,9 +6562,9 @@ bool igt_is_joiner_enabled_for_pipe(int drmfd,
> enum pipe pipe)
>   *
>   * Returns: True if mode requires Ultrajoiner, else False.
>   */
> -bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
> +bool igt_ultrajoiner_possible(int drm_fd, drmModeModeInfo *mode, int
> +max_dotclock)
>  {
> -	return (mode->hdisplay > 2 * HDISPLAY_5K_PER_PIPE ||
> +	return (mode->hdisplay > 2 * get_max_pipe_hdisplay(drm_fd) ||
>  		mode->clock > 2 * max_dotclock);
>  }
>=20
For ultrajoiner hdisplay logic feels off, we need to correct this.
Need to check spec and update. Correct me if I am wrong =20

Apart from these code LGTM.=20
> @@ -6591,7 +6586,7 @@ bool ultrajoiner_mode_found(int drm_fd,
> drmModeConnector *connector,
>  	bool found =3D false;
>=20
>  	for (int i =3D 0; i < connector->count_modes; i++) {
> -		if (igt_ultrajoiner_possible(&connector->modes[i],
> max_dotclock)) {
> +		if (igt_ultrajoiner_possible(drm_fd, &connector->modes[i],
> +max_dotclock)) {
>  			*mode =3D connector->modes[i];
>  			found =3D true;
>  			break;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 27b545f52..0381c82ad
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1252,7 +1252,7 @@ bool bigjoiner_mode_found(int drm_fd,
> drmModeConnector *connector,  bool max_non_joiner_mode_found(int
> drm_fd, drmModeConnector *connector,
>  			       int max_dotclock, drmModeModeInfo *mode);
> bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe); -bool
> igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> +bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int
> +max_dotclock);
>  bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>  			  int max_dotclock, drmModeModeInfo *mode);  bool
> igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
> --
> 2.43.0

