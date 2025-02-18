Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F9CC02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 07:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6575310E1B9;
	Tue, 18 Feb 2025 07:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuHyeNxf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C61A10E1B9
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 07:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739865108; x=1771401108;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nrPPvsh7h9Pvt0WCvddPZwDFLgxbdI6jOO86ApDtLqc=;
 b=OuHyeNxfuEALyRJH7m1MUGQPr/7fFRkaPfeIhR804wLl9Pfr0v65uzpU
 r0ANASy3kJaY5B+yg6qSnS825ypO4rXP/zYd7aMHmMNGyORdLvm/yU3IF
 lZq4ku0pET+cfqv3ZKytmwL3B7xpH37qd0QhagdccnTF7BYQ/IOL0hr5P
 FihAIW7eKRr+H2TColr6egqDCT/haLvxjiuPpoHIw9PrGFES0sh4YE87D
 OFlaamSzPHLvhXB58AXY5OuEWRAgNkd3dKVZQrZrQI0S9o1ZIXahKjX7g
 5+6fxl1GiJii0Z0a7ejlLlbwhdcvG8o7FUJBcND3BXcAEBdhzIZ5wpUsX Q==;
X-CSE-ConnectionGUID: E6pzsHeYRQ2xc73bdT7rjA==
X-CSE-MsgGUID: xyG3kbSlTlWFMhYMuWDswQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40804753"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="40804753"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 23:51:47 -0800
X-CSE-ConnectionGUID: NRyVYlTRTnmFxrV5dFNihQ==
X-CSE-MsgGUID: JVRdp2GUS5CNIlEzHjVSaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114784792"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 23:51:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 23:51:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 23:51:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 23:51:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pk67ks9wzrnsoKHSq3NJs84HuQN9xd8v47s1+PqQM0X1qFPOWLogy3TvxhU2BeDQoP1tIIav5Fsj/I5LxPLptg8v8gZhNsmDXLGgG+Po5xx85PwkiG9X/8YaFpG2zqTPVV4ktJKuoAqxCe4AyEGnqgaZ2c2UbscOHLauPwDUduPAwcX1qyQGpBUfWAqoUml3uld0X2XBJjmIb0KOhZb2TCcUY/1HgxCe2zZqkoTWvsfyw78HXdooPHtA3rrGB4trp9nR4IstFBgMaDqNDy5/av1kuFKg+b2GQm1FubQS4WFuD0MOM6F0meAHoJVeJj4psprWWLItUNjrejIEV5Hkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZH5Ck2bJfOLFm3d4qH6F/aYd8SwYgJczyy1dBWCfFs=;
 b=J2epI4AWzAXkJAlNbFM+IJENEOeP9PKXA0e0d5r4cmIsPjMMtTeyZfGirIT5ve4IfediBsw7dEVZZfzF9MIz9nALdNmlL7TrEp7WQ3FlX97XR6H94aZEIkZaaamX56aVkyrbC5zb+1rGfK4WSEXrObGKb3cXfSiF4kfE5RhVrqvs6+6dDM4L7iyeqgftDaE2lZkFmQGsWGsip6w6ka2mvHS6yCdcbycD2sgR5Q1NNYO/CKDGUTZ+Ho9iczHzLf9c0fsNl6DATf93+av/YDdbKZrM0VcRC8Y2iD72KP2zEA5w0iFoJCM17u5cqhI6Qa3yOaeSGF1Sz1wPA0F0jTPq4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS7PR11MB6200.namprd11.prod.outlook.com (2603:10b6:8:98::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.19; Tue, 18 Feb 2025 07:51:44 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 07:51:44 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 1/4] tests/intel/kms_joiner: refactor
 set_all_master_pipes_for_platform
Thread-Topic: [PATCH i-g-t 1/4] tests/intel/kms_joiner: refactor
 set_all_master_pipes_for_platform
Thread-Index: AQHbgQT+kf1sCSMiP0yZs1x9sEmQ27NMsbMQ
Date: Tue, 18 Feb 2025 07:51:44 +0000
Message-ID: <DM4PR11MB6312C63D12F83B3266618F1C90FA2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250217064239.2019316-1-kunal1.joshi@intel.com>
 <20250217064239.2019316-2-kunal1.joshi@intel.com>
In-Reply-To: <20250217064239.2019316-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS7PR11MB6200:EE_
x-ms-office365-filtering-correlation-id: 28020b39-473f-467e-64a2-08dd4ff116fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?y+qJ+90z+NZdkSoPEGOjWqR8JuvgGbkgDRIZbFZFD3av6ZEjgEwuDAxoqx2/?=
 =?us-ascii?Q?LxB3LYN/YEovAIHZRBMSa+KArKOPdrsQl9aiTb+qREvVSSAu0gx/MJX6RmLr?=
 =?us-ascii?Q?iQ5cxqSTZlXzxRN8vpNi0pwgA3LIypPxlKBtctr4zaYk6V4nBHNcFv1BRrvL?=
 =?us-ascii?Q?8jy0kCjv/de+eZ3YIC6+NXD7pyE/AHqsRUEmKAYSuxYlJ+lxJdXS3ncrYtkl?=
 =?us-ascii?Q?TkmeWOdx65js64K2WVw0upJSuu7xodH9TqgJRkdEJjFNdM008+oGX3a4b76C?=
 =?us-ascii?Q?vilee+gdGvtMuJGo7x1ZN9HmRaMBoWo+pScFTswHXSLWgte/rSs+5ZSYmMFh?=
 =?us-ascii?Q?KK+oK9Wvth7vlr2Xh2jY+jiN4Z5AvTIyuQfVTeZIersUCzCIz4mH58mIV98y?=
 =?us-ascii?Q?nlg+4ueJVGN2HPKFJ729MaoBd10/ix/D7NdqBTg4ChLeNJ5p2s2bTFV7e23x?=
 =?us-ascii?Q?b7zVNNlzV2aPzZP3g5tmUoL0di1n0xwGadq6HsTbqs/DWKuhoKgb8Iy7heYz?=
 =?us-ascii?Q?VR20PjqtAk6hOKl0/Sm04zsrRyYNRY28XAtQiUJPW7Ut45QVlGNoKRxRONaA?=
 =?us-ascii?Q?K/cA6n4H5LswHaJncmHLJ+eR6KrhzV+4Dhn3SsWqh/NcqXHgJdMIFEhyS9Ji?=
 =?us-ascii?Q?Fpobk+FH+DbR7egh6CcnpAq3d+8JsUfIbnM+IpXa3991pQCtLoAKfXqua3os?=
 =?us-ascii?Q?tQFShaQkjWDJlHszQOHG7no1AhRHjhfGZ0V2/CXCfAmxJQrUfDEH0OVLtWlj?=
 =?us-ascii?Q?AouWaZ1xTyDswJTkw7uGFwVLYqgLAc8o7rp0Cgq01Vrsn26rFq5L7zaLJrRB?=
 =?us-ascii?Q?9GfXN6DGpfGt5LnQQ3PIzbJQffwLT36G2JXmP4Yz/kj6KpKd5b2rfNUVLRIP?=
 =?us-ascii?Q?cMPSnyHGo74tO6ASqiNY9BDyzXEwaE5bIeDeJW2KNoH8Kn6CeH5bRIZJ+5yR?=
 =?us-ascii?Q?3qIaSKgeHcaoNbRsZ2DjLKulYG5GXrvlsSUaRJNu14R01BQRWIXdg6FE3GOr?=
 =?us-ascii?Q?hARoDAGmOtuV4YGUajhNVNQGVZbzWIQsegUxa1Jwq8dx7IaD6vnchoh9DhRW?=
 =?us-ascii?Q?TnlgL6a5my6JNboiraYajIz+ivMgx9jNnZPNpzh65COqyojf0fgvBNZDquT/?=
 =?us-ascii?Q?jMk3Np3Isx6QvLvKnDnoeT/nPXhhjLeeum6JR5Scmo1+KPxyAogJd1RKuOwu?=
 =?us-ascii?Q?FY8/2ErWRNQrreCQzf7CYPSvxf0xFPEWZWYAcG/IrWjuh1lixhYCHVKHShB8?=
 =?us-ascii?Q?4YgJETennezFJFYgaHBi+vBJlY7BUKYDhIVMiuehrL8I9cYAB8+gH4zGbZjD?=
 =?us-ascii?Q?X3F8MWpiTyUydfbe5VpamN0QyhhmCG1Hbgr7us3xVmaSVwCU2D+fUjsbkn7c?=
 =?us-ascii?Q?99aQJeP70s1bs1yn+WHstm5XW6Z+Al2bVCKpiECdnjDYJfmoT5XCHeOoR+7O?=
 =?us-ascii?Q?n6qOqg4VcnWeVNuaH1PnNjlCxCztFDsM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Xy2jQpBUQxscyyXpHv1VHtK+I5qrlIJOEoGOM6x5dxpFJuO55evpUGkqlktv?=
 =?us-ascii?Q?Vilb4js4T+uaKB+13XboyoMX543wP3v6pCCWTmpKdrBYWPSxwiJ+9cGGlmBF?=
 =?us-ascii?Q?ECXN4cwQ52a9cmur23XCl7T1X2GpzJ3IMmV9BhJGtoXWhlGg4sdy8KTM3pGK?=
 =?us-ascii?Q?GFFKm/Ysbg8nEAvG0Aj+CvbrhnCkpgK8ttyOAWCtqX2MmZ2Cjn03puFHIAPv?=
 =?us-ascii?Q?IOX1RjKIgI3UQcXZUmFPZ/2AuLBAvrYeWsVz+YRBxXqcEMlhepwsGAPKVP85?=
 =?us-ascii?Q?tvebGl3VhslupltIJN+wxhl5RQuIfZPSCP2p145kmHlyAQ9lzNIj7ct/GyrN?=
 =?us-ascii?Q?VxuoWwOjLNq4GHYGm19pLLEsR2kJSx6Y0R9aWe+8cUDgBVfEQ/j7ruatYBuA?=
 =?us-ascii?Q?hwH9vN9By9+aPp7F/XiKEFuDq5MvgybXDVTpPANILKJxPDwLAVDbGp9imCn6?=
 =?us-ascii?Q?0RJ9zGou7xR1ZkYKs0LAehFCuCUlUjwG21Eyb3GqwdEx3m5QvWm/wRgo7jse?=
 =?us-ascii?Q?mEpMLccI71Zd95ojdGcsT4x8r25tXRQw3fRB9kcy/A8Eix8sJN5nBCm+2OQO?=
 =?us-ascii?Q?goHtY/ELBbZUK1Oy6XdChokpgjL60MmZJtaaNWp4dXnpX3Kfl53W7Nr5yVeX?=
 =?us-ascii?Q?5l2W12/7O9oQnvjAoOgLCGhCRZ9jdjHE2wblNKHgfc+G1Gzoo7tJ8BVOWkJ8?=
 =?us-ascii?Q?rAU7M4/0YFOo89Vh952L8PX5qxAUKesvAtjFNltupKb0ERkf2Rdg/NzntbZx?=
 =?us-ascii?Q?gqS0AcPWPTyc9Us2Cg/lcdcYLfLsFVRLXI2cSzBAPc5uGxSfWWp56jJsohRd?=
 =?us-ascii?Q?wQQnFApyhCK5b7Y8JwM+0niUndDul1vc7KlmEuPmjRXU5eBckloae8UdjD71?=
 =?us-ascii?Q?W1/p2oAfeSJTTOHd9abFpY8dAtejdLN9j2M7SCllqQWUtG0tzA+LMIazFoDZ?=
 =?us-ascii?Q?XXs9CczO+sQ+kvvuWjvbCf/GNKrrhPBtO3xFClseetmSky1yg9NAP0iqxDkG?=
 =?us-ascii?Q?Vo5NHKzX+HUeVlTtuZJqsUhgcmgVc+G9BrIFWKuPsWfPn5PgF5UjuaZuy61a?=
 =?us-ascii?Q?EKVLDqJKLSTiZWzyC8IAph9CspTcEmTvrBqwbAyL6Z72ElDlmiqXY6CzVQP3?=
 =?us-ascii?Q?ATDcoabAfDDZbDKUNPS8PbwaIPGewxv1royYbVqYNEYCgpdaykgpfh64TUJ3?=
 =?us-ascii?Q?eOaGFGvrXzusCtCZ9mgpuqTFq5n4B1XsWYlAzyv2zQy9ROeKYVP2KmABNdIT?=
 =?us-ascii?Q?/qSZb2GcL9OCkK41RD10n4LSQR59Mth6BjtntHtg3uPmDlTm7+BFkiMxAkbL?=
 =?us-ascii?Q?6akNEDIBNh/sGc1/YeZzsSM2RS+QIJKJXD0hmR9xq4f/7P0TgSWz4WrMNImS?=
 =?us-ascii?Q?Z7MqtALHO4gQtmAWE9D/m8bWCzlnufu4h9yd0zZ48rkwrqESoVeF2Qf1j756?=
 =?us-ascii?Q?c9u9xD8x/ZHd9CYduc7isR816byBVRY9Pc9lFhDLerxIxSAJoPEiOfqSlyXP?=
 =?us-ascii?Q?qDXpayW5hJeoZlBh5Jt665ISQrGIVFlLnNwNbTb3vkJz6uKkU6UD7JAQ/+9B?=
 =?us-ascii?Q?C6B8lv7Z30A3SfsPJYE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28020b39-473f-467e-64a2-08dd4ff116fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 07:51:44.7579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dxm/Jue838JyrGD2VhBAxbsqVkC8Xow3CubudehIjPabw3DorWC4DxEoYAaqeHQ82umPTdpWsu9VcfX/cXcDPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6200
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Monday, February 17, 2025 12:13 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 1/4] tests/intel/kms_joiner: refactor
> set_all_master_pipes_for_platform
>=20
> refactor set_all_master_pipes_for_platform for readable code movement.
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_joiner.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c index
> 062a0e49d..080e8ff52 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -106,13 +106,13 @@ typedef struct {
>=20
>  static int max_dotclock;
>=20
> -static void set_all_master_pipes_for_platform(data_t *data)
> +static void set_all_master_pipes_for_platform(igt_display_t *display,
> +uint32_t *master_pipes)
>  {
>  	enum pipe pipe;
>=20
>  	for (pipe =3D PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
> -		if (data->display.pipes[pipe].enabled && data-
> >display.pipes[pipe + 1].enabled) {
> -			data->master_pipes |=3D BIT(pipe);
> +		if (display->pipes[pipe].enabled && display->pipes[pipe +
> 1].enabled) {
> +			*master_pipes |=3D BIT(pipe);
>  			igt_info("Found master pipe %s\n",
> kmstest_pipe_name(pipe));
>  		}
>  	}
> @@ -561,7 +561,7 @@ igt_main
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
> DRIVER_XE);
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
> -		set_all_master_pipes_for_platform(&data);
> +		set_all_master_pipes_for_platform(&data.display,
> &data.master_pipes);
>  		igt_require(data.display.is_atomic);
>  		max_dotclock =3D igt_get_max_dotclock(data.drm_fd);
>=20
> --
> 2.25.1

