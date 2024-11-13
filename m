Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C9DD41C38
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 11:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669B710E147;
	Wed, 13 Nov 2024 11:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWlu3liN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9121810E147
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 11:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731496418; x=1763032418;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TJRoU6tJijVMsvhfJUto/Mr79K8sDyqS70argG0Zm8E=;
 b=HWlu3liNXpcU1nik8BAxrppQqGuSg6QApGr7u6KJOuay8oFSZd2XqzIo
 KaoMGKDPDnKviEm4Z45+l+1+8+NUgI5zU6QNQfBdlXYbLFBEbb205Oqrb
 q+iuTUeQXGoWxt5HMU8Gp317BN1EzNbSAnG6SQypVN4dHVTRf5hzXvk8E
 jyzNORrHtllkg1Keze1g4n/IfAT7hcrN77pyxOYJnqE2a7qJrR7tPKAX/
 GynzWx6EUay0RH2mxcHggOvY2YeJharAydVmJDk1agqJjCXFHOYmL/Oo5
 Ad7uWsHE8IaxKXy6O5tZQEaMGIS+FS6p3aXhP91Lbi96PACyfdFsVbbeA g==;
X-CSE-ConnectionGUID: t+Ug8ypBR0u5psfH5owPcQ==
X-CSE-MsgGUID: +dail3GBTd+rVbhOGShHig==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31347995"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31347995"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 03:13:38 -0800
X-CSE-ConnectionGUID: 8UdrvIFrRJecP9P9dwh8PA==
X-CSE-MsgGUID: K2q4OB63QcGXRPk8it0GVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="91881190"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 03:13:37 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 03:13:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 03:13:36 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 03:13:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKL1WmzPE30Xb6SyR5qWjlEJRIJdfzKCERTrNMk6gj9pLF79j75QYiFPkDnsleoXT9udos9UmW4mEGHsx0/LplAX4jKSuosS6LHg+ApTkNOlEI8KI+7ChDyobnKF/Cvl4sukTsGC1e7metwbY7olCtKSiL3Re96qVoBZXNqkNCznBJx5O0Gy6dbd/hT7wS55SVWkYkeg8jq3YRhJ8D6QvPPGPb7844WfdxqSCenJqGCnA5r6gaakXGsLdjWqID7mwjOowWgmfTBWaog581gNZ3RZbRsWv/g/27NM7UA5+GAkOf10xBbdfJI1uU1qeSs7bX6xFlDLpiEPwlk1jbWbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RC1rYQg3JNMNNmyEqbg5u0H5/j6Wq0RTCHFA8Y6aZLY=;
 b=YbRpRCohfm42M15ThWu00MyxUShS7LYpXLxCYb0m+b29TadTK5NiJQ0BOvVy5luBdui1CxkWVPYDIgVkS7S0urap30wYppehlRMUQArH4twyPBx17Dm3DHL3txiFTp5V4v5y3e9Ra95FFE6STpdl1vNO0JOS3KcBLCxWrYxxcfAys5mmAXC9f3WDn3GaO9o+Tylm40E9qiduHTZbAjRx1NgBe68kvrISr0M/3Rm+thb9QFgZ9JAC6wwQLHqCWTx/J1mhzejExncKY64pjgIdeHQY389htKzOgjKWauHvgZgoiNVTF871OlVXrxDFwxf4cNNcoTRIg9qACwI8vFTmww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA1PR11MB6393.namprd11.prod.outlook.com (2603:10b6:208:3ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Wed, 13 Nov
 2024 11:13:33 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 11:13:32 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Add skip condition for
 bmg platform
Thread-Topic: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Add skip condition for
 bmg platform
Thread-Index: AQHbNbt8Jmi7c4TYlEq+kFRTSSwn7bK1DTyg
Date: Wed, 13 Nov 2024 11:13:32 +0000
Message-ID: <PH7PR11MB6053E6BA8824A5D67A7940BEE75A2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241113110104.125403-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241113110104.125403-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|IA1PR11MB6393:EE_
x-ms-office365-filtering-correlation-id: f68d54cd-65d1-4f30-8db0-08dd03d435c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BHLqaxvT8NdzOx9yzKmuN6gFhBzIFr+6VtLmlPj6mcbxPrtUwAW7di6WtYba?=
 =?us-ascii?Q?qZiMYuF8ku7JC2d3Zx1/jZG0out/xAAr0FwZr2y37lUibmSWnh3NrDhSq3Lj?=
 =?us-ascii?Q?gO0aUXtkyEJZ/Ts2+TQ9K8Zl6XHBtsvwtmMFV27W7drkgtuBHa9tbGRhbSQh?=
 =?us-ascii?Q?+Q/DMp0+Z7jJVDGonmSBNihiekqyXCqjBOXX8RVdDotcozxzLZ9QyPvW/Q7/?=
 =?us-ascii?Q?6asUxK6wKOBI/I7Cft6iz9nQy8MVadRhxaueUGcJAJ+MV43HwvNIagym4glW?=
 =?us-ascii?Q?fp1rWw6WZuAl8g3mtEULdXU2LqfvqbZHy0ygcFE8+zNtVh5DrrhGJwmrHH9s?=
 =?us-ascii?Q?6d6kB0SPMBk3NpnpnwpeF8fAih9KVRtnuoi8cQa+FuvxeF8h8mn7Lnu8RT6A?=
 =?us-ascii?Q?EydbVUaJ+vZJFwBxpuJnodPD+qSWfL1kwg0uDz5aLTJkK6eVGKSDU/1iXxpb?=
 =?us-ascii?Q?PD3R4I5Qli6y91t10eOLuIF5D525rYhunjcXfG8/v8q1MUwlgA62GEG3erYh?=
 =?us-ascii?Q?uXYifmV3KQGDpfE1cJffwKyojrbuR6xXtPLiHFX3PnMgpqjT7ggDmAF7OtFA?=
 =?us-ascii?Q?g208cUqd/cNVG+kB0uh+raCCzMpjjdZ5nJaZ53NaH+gqUHBvuf1GFMCQEQ37?=
 =?us-ascii?Q?gnr2acQ3rYkZeDKtY5g0dGDGa7AYv2VDYIeYJRnEA5Q3pMrichNT+oS1ijeE?=
 =?us-ascii?Q?J1payiYYKf9q4uPp1shI+mnYDJe/EuMpQAy6vAB7B0359gNXVj6dinorWXCg?=
 =?us-ascii?Q?KgycU1seIvc7X/Z8HGJtXW/P4sUtg+fBjaoyqFp/S9881Rw1Kxb17WqqO40S?=
 =?us-ascii?Q?J8rduUABpIe0hkpiYIjnvd9SoE+cp8WLKu81VAc8I3xtDFA4jbkjFEfNe5Vv?=
 =?us-ascii?Q?uiGq05fahmf5zoLANdpKdH9YvuuNjyf0mNmKSmo+O6D42lCHsNCQ/3ywkBAj?=
 =?us-ascii?Q?0F3NGZQigJqG17ifJqnrXJG2TUvvVnSk7a2YyYltm6H7q7mB6O1ZMN+ATzEc?=
 =?us-ascii?Q?fwfdTLV6i9riR++ISmDuK31oKIb+cE/PV/r0Kor1XxHWMqhyMX6Yq+fDiSLy?=
 =?us-ascii?Q?8ddxs4035KH3B1uSPagGxjpLY77X95izEQqaKzsb1Lofe/Idd7FgRIlyopns?=
 =?us-ascii?Q?YA9Z4Um/AoyyDQ2nggg8/nbdQ3Z1Z99rYo6JHJZxqFWGONu3eW/bJcKV2KVK?=
 =?us-ascii?Q?Ez2yT2QK5KJuq5VFG6AR9emDGTAkE+BzcAwJcj6fXfg6nmHsELsuXMTUtGxu?=
 =?us-ascii?Q?kiDhsfhC367zmc7fw44K6rpSG5KB4zKZrw+NodDXKEDI4TCJ8OFvA/RmqFMQ?=
 =?us-ascii?Q?Vh+cifiH4z8PSNSOHysEGe+AlpcsNheZhssbGk6mE/zxhh8rb5Saj8OLzZTy?=
 =?us-ascii?Q?JnS+Shs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/NFUfxOfuJiLp1idVaLkNaTFS50oj/ouUzJY8JDxYkUsJyD0jMkQv09b/jpJ?=
 =?us-ascii?Q?lLKUA2glG/YO2i9ruVOp8BGw+jZKfvunA38H8utKdypaStL0ag0FBXa/aVWY?=
 =?us-ascii?Q?IjQCLYgZ8+OFybYPMng/oRELMZMTg+Y/V4HPb0f7xDnsyJT9oGY7ZkVRGkPF?=
 =?us-ascii?Q?onR9ELT9uMVJpsuxSFQDpXNeB7ZaXtOT439SjIX1yQKt76r8+A0lSrZbP8SB?=
 =?us-ascii?Q?YsDjt10d1MNM6DiBYaH5NoM3WsU1rITA4TSfyxGCyP8mQ7xLuEzO3CdFW/x1?=
 =?us-ascii?Q?LEyR6L8WFTIgJ40y6T7QWQjHw0MArHJE6Qn+DnsTzhjdw+FdxuPhl/+rxt+N?=
 =?us-ascii?Q?O1iABT97HlvQIQ7JFhMydhQFX6XaJC8KDiGB9PiHyOqvYw7RRWs2I3mOzyQ2?=
 =?us-ascii?Q?iB0/s9oTosuPLI01ptRxnLMlX8gHR2qioUkp4Sf2la5dqcjNDYO5u4UnhXkE?=
 =?us-ascii?Q?49NwkErAsLYlWavs/tTzlXDjG5tbhsSmjZFXqQaNXPF14Weefh23Dm0mCksO?=
 =?us-ascii?Q?rPwSbLIBwl4JYaOCqYhwf2ZINA7+6sGz4GbtIJ+P0mjW7TMpS4hwKCuAFXJO?=
 =?us-ascii?Q?fI0M6sSoR3sF27JveT398bfq2ROMlf7XMdJnpThvyAjL+rsWuY+2Uxn8euBH?=
 =?us-ascii?Q?v16MIiiCgOlvyzPWD57tIdEgwQDW/P2wAC+LkaflsW54J1GQ5OryrFh0wlJ6?=
 =?us-ascii?Q?YGSyPUVXcELoHB5lCeAbclj2HWQ7YzPQwemTg3/rryxBqKDOjkO+fM9RGfmw?=
 =?us-ascii?Q?xU1U8FXvCAw4psRbldGCH+cYQW+xZefGkLYhv3F2K+Fo5iA6x4+Rv+Zpl4uS?=
 =?us-ascii?Q?AphBr+LFM8EEP/BZFYkeK3GtaMhWaueUnEVMpycPAADZ5zwjowllkJv5mByg?=
 =?us-ascii?Q?Xp/u9iA0yYlqCPeBvJiSaWNODuOOzlU0IJjy8m2r8RMmPgHp5+4/kW2Mzvmu?=
 =?us-ascii?Q?V9Y0LkWzwaKoW2IwSszO+GvvRv4pLwEp8H4CAstMzthvI9JAIgn0HTuRsZDC?=
 =?us-ascii?Q?4fxyGG42sPdnqu3HRsO62ttVQheaS56WukawMCXGzwqZ7N7smcFkOeumafvJ?=
 =?us-ascii?Q?X1OcWvXepFQjix+IFsdHNwaNR+SBA77JyyDdEBIhRMPm8OuIadaVbwIlqlLg?=
 =?us-ascii?Q?e8BSk5uR5gPezQ0l9upBLgxeMQbmqyHhm+KhRaBCP2Nmwq4407Ij98Lsl9XG?=
 =?us-ascii?Q?nKQUvr5c8oT2yc61u/k+BL/HiNeGuT4n4XNttrv43xWuKWsaQ3mRBLxgN5Iy?=
 =?us-ascii?Q?37rKEL4S5qysx88GrCDuG2pneGPInkH+A81wTg1zbrExP9YHiQTu1bOmc/2D?=
 =?us-ascii?Q?jR5m4mG/q17tOfrhyHUBBzfrucsz/oa6SzOCsq3XEQT2gPY+ZHWNXaGANyWs?=
 =?us-ascii?Q?pQ0Wyr5WDlEIikfJllln6mCEeAzwovKlh+2M4pOU08p4o1/rFFioAN768pyX?=
 =?us-ascii?Q?cuLbKlpj/WS9XRpdDuqwzOEiAcjxWMJ+c2yWc/VKTr/DxbJq7/N+UoY0hYlo?=
 =?us-ascii?Q?xj5QdmL2dEeTB6PFVx3SK9wEzMrJAthrEcLyOlMz6XMC2Qs+9Gh/XDgdBdcF?=
 =?us-ascii?Q?osXERDezNVudujVpPgGO8RKefXpi4/59uG+hgReY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68d54cd-65d1-4f30-8db0-08dd03d435c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 11:13:32.5888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 366OKA2usNxmZDAIndvVeEkHeBvegKGC/ik40OaaqQu3Rr8WGkXENc2hhp+nCgRPFJvgyjqOO838I1XPJgOMSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6393
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohamm=
ed
> Thasleem
> Sent: Wednesday, November 13, 2024 4:31 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Add skip condition for =
bmg
> platform
>=20
> FBC test isn't supported on bmg, skip the test on this platform.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_fbcon_fbt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c in=
dex
> ab4819d23..59a000236 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -73,7 +73,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between
> fbcon and the frontbuffer "
>  #define MAX_CONNECTORS 32
>=20
>  struct drm_info {
> -	int fd, debugfs_fd, crtc_id;
> +	int fd, debugfs_fd, crtc_id, devid;
>  	struct igt_fb fb;
>  	drmModeResPtr res;
>  	drmModeConnectorPtr connectors[MAX_CONNECTORS]; @@ -418,6
> +418,9 @@ static void setup_environment(struct drm_info *drm)
>  	igt_require(drm->fd >=3D 0);
>  	drm->debugfs_fd =3D igt_debugfs_dir(drm->fd);
>  	igt_require(drm->debugfs_fd >=3D 0);
> +	drm->devid =3D intel_get_drm_devid(drm->fd);
> +	igt_require_f(intel_display_ver(drm->devid) !=3D 14,
> +		     "FBC isn't supported on BMG\n");
>=20
>  	drm->res =3D drmModeGetResources(drm->fd);
>  	igt_require(drm->res);
> --
> 2.25.1

