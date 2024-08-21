Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B97C52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 05:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B710510E63B;
	Wed, 21 Aug 2024 05:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFKOBzdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6254510E63B
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 05:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724219776; x=1755755776;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fuBvZpOeM7G28ep8+XaJJZC3s3JPKiPuG1r8anu7YsM=;
 b=VFKOBzdbDMUCgAZf9oe8bpvs4IWgjZzEoP3BRXsOm01Fi2RfR8MueUOb
 zRf3WUzSlxljK8jdvSXfFKfVp1mlSjeZNFffhM5oO0bbWXoB5q+eal/gn
 wVoDANLFFP6tpnPvT0yEzMZyYoHBkcZLyMwFoYa4nF7LJ2RnHCM5qsTFF
 zZlaqU448lB/k6hHChub/IgZS3kWoP1+g+bZbN1mu7HUt5wynzVR+0U/o
 vYJIwv6ZASYsUWT8WDQ9KzHwIjx3WfbQYI3wt+Hi59VD45sSXRdmL7+t/
 5fxoJb5luyvzg2JOgLc01OxU7rNspIXSRNqTeCqX9T/U8m8ePnN5PgItL Q==;
X-CSE-ConnectionGUID: AckEogutQEiniHv1LXubpw==
X-CSE-MsgGUID: PE/FXK8MSriuSK2ZD/Vv1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="25455334"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="25455334"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 22:56:14 -0700
X-CSE-ConnectionGUID: vY4+txmpRLupQ0f/RmSsxg==
X-CSE-MsgGUID: cdOw/4oOSk2hLKS/HCRjdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65937642"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 22:56:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 22:56:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 22:56:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 22:56:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YY22qnWXE+ActVa2a2KZdX75VOkcaD7v6UQytvltiXYrBLmCExeWz5Kgwk2g2DZt0tpOcQAAv5kCDc/+5Fh03E4HvTUGjc07vAH29JToQAwqL1/flyG7vHM7/wvrYjoyW8Tl6RhtK44EF8E5dDeoPa0bGn6CUEn55k0HaDYqlad+Z9RvKrAl9DM91dmIxyxwGpop9BjCtwJgPp9KU/QU8amiO8LQm+O6LeA+hqhYVG+g+50u1y37EA7N+KeidIRsDW92g+iLJ36yrNERIZTnpnwrLXVzJIgXIoY1fz95L6FAxqvVKvhu/CGsglN7Ydd9DWjHKZQdUcf+UeUIhTgAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=td+9eouuWgG6vjRIQT8dCmDMShebRZf6sw67NiQ0TiQ=;
 b=NtbqhOHE0QSOiijpdW095//4lNl6jIZkQ+l8xSYFj6/Q31XcqbcvfAmdT8SAiCVjoIjMFAM1ldb0CeAT6liql7l7kf6ju+w1//GQs7k5WniLXF+7Ff/jGSmyaAPgwDK2aTLFvQdVmY8Mzfv641MP5GNrd5qt/8z9GnWR0aZLcLk7R1Qq8KHMwoq+bmt99QEzxEGfuejJ24a0Hb7+7ndbYXuWa/96QqhhtRexeEQnOBoGSfg8ikQWAbqeT09/8bH4qgifXMZAe5SvhvXy5/Hz6JTMSEGgSzRA4XlKmLPVYNPFo0McuII8bZhxEhoox+J0XU/bv6PNpIrkwcVonVqZEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA1PR11MB6846.namprd11.prod.outlook.com (2603:10b6:806:2b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 05:56:11 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 05:56:11 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [i-g-t 4/4] tests/kms_vrr: Add more logs to skips
Thread-Topic: [i-g-t 4/4] tests/kms_vrr: Add more logs to skips
Thread-Index: AQHa7USwkdfWhhG8I0OcNZo/X6g7srIxQZow
Date: Wed, 21 Aug 2024 05:56:11 +0000
Message-ID: <PH7PR11MB605304E98446D57DDF4DBC02E78E2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
 <20240813053845.2567954-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20240813053845.2567954-5-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA1PR11MB6846:EE_
x-ms-office365-filtering-correlation-id: 74f35ef8-3440-431a-d1d9-08dcc1a5f563
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?PevFBfUvIqGPstd+z+2raK3g6w2ELvPnJUSKb3DdpwnZCNnSybJG47an68G2?=
 =?us-ascii?Q?XQxJ6HrMqI4TyDmp2GliSGSx5Br46HnetWYfVDZsjNhB0nDD0mhuuynwophe?=
 =?us-ascii?Q?1a5zKe7XZxMZOMmbt9N8jzlaPZE4Et2m6GmmpPm9cv7d+yO3iQvEGXy0kADx?=
 =?us-ascii?Q?NfAtawoidV5TvWSoyi4jekmqB2AFU19YjwPPNyaEZUi8AfY6h50F9bIRFR+m?=
 =?us-ascii?Q?8MXJZxeItf4vp4GPt/D27DTudL0EN48lFRCYO2M4q45BPEqAg7c8WZ9RuS6J?=
 =?us-ascii?Q?Qmxh9kzRcRoUWoav7vSALjiuJZT+BALOepcys1kpG+MTqKGRfSJc38jj8110?=
 =?us-ascii?Q?NXNZAeFp6pgvr/vYSb8BmzNaRLZ5XSIwibsbvT9ckchmyUUtuGIULz2HjmFV?=
 =?us-ascii?Q?avULBm59A6S3+g63U13wCvjcVovGVkLmIIYqHEIcN4gm9lLpSwdLqIk3EHPl?=
 =?us-ascii?Q?MZEuXjwPqP8VpyfXVkQDhfwPwXZ6y1/aW9Ja4kmhuM4gdmHbgyMDRP8qK9zy?=
 =?us-ascii?Q?qBY8sSpofhasGbnvMYpXpQdynvQJAOmEt41X2HRo7aWxjVKfsAceGPoZ+r99?=
 =?us-ascii?Q?h1jY4rh9cJxLv9fB5ajYz9ocupnyWxiu8E5U0CzlZETANFAnF1WlmMqGTkI7?=
 =?us-ascii?Q?xC1Myalzfr/6f9TGnwUFXB/Dbc4Dzb6nEvDWmFHWv0OcvKaiCAd+NwsnoZbQ?=
 =?us-ascii?Q?fCzufzY7CL36U3+vH/620LNEB6E/m5oxApILnMKjsB+MNRGowNO1AxCCY1Fu?=
 =?us-ascii?Q?9p4I0v957CNPtBIihAsJAIU2fz0rzNe6/fl/y1fWRFIdRQ0y0xwp5TOsqwpv?=
 =?us-ascii?Q?OI9A2KIoQKL+1+d5JWd0bvLP6n/1K8PCpthjEG8tKvB1VQ8Cm3FTFga87n9h?=
 =?us-ascii?Q?Zho9ECgRioXUnt0M3ki74Bxim4xmxPVt+j85fRHd6Axs+Cw8zzzrz086qARM?=
 =?us-ascii?Q?YDjjJL6iYNvqTreq0upPmRkelWLH96sJ/JFIjNQvTSQPIMCt0dSF40SmfX3Q?=
 =?us-ascii?Q?ImTnaYAS6syzz/lnPKxn36Xz52tv6VYnxYtO/OFzo2tHaNU7Lq/Vt18a7auJ?=
 =?us-ascii?Q?A5VFSTkQii2u88VSOGxxYFXm+N3yyTmMFflhVI5c4jR4lt4+M010zxgA0ApV?=
 =?us-ascii?Q?YghSX6DU6nQ3YUq6Pb9rSeatz67wI3VU4yLSx5Pc9X5ZNzuqcQc/aDo2nrFK?=
 =?us-ascii?Q?rkBS7QuBQxy+BPcO2ql7b/6i+kIz7CoNjTNbgo1MR89PXzKEOlnpwnSkyEO9?=
 =?us-ascii?Q?LvCeYN8bnjTctewANr+IpUGLMmGQd353zLvDJ6bh5/bvX7Vbr/MZiGW4Hdx6?=
 =?us-ascii?Q?B0Cqg7SLYVl60FPo8Wma0b6JRNCiBoNZg6xAvCtZpSQO4VEpPME88aP+xulU?=
 =?us-ascii?Q?KsgW++o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B0EpQqbAvVUR5CFdzI0yxP3pdNFZV+dnWjw8Wen8yYy4Tfe27n0EFiFhrtD/?=
 =?us-ascii?Q?2Ht/FORGClljR/PaK69ATCFe8PY0ickQkEeUS/xdBKDy9QnRz6vNm2BVGhk9?=
 =?us-ascii?Q?Ytf7Kl/TDVvL7Zj7UqnWl48SFT0RNBPIlULwXDxLPwsOZojwWUhhh27TpJd3?=
 =?us-ascii?Q?ePfPYCADVXnuWl0wrJ11Enxq/qSigxnCINOdpxVjVfuMtw2KCvJ/tP8VDMG6?=
 =?us-ascii?Q?1d0tbh9FuXTGKogGDLTura9gfxpoOiWMwsQDeMWir0OkaFbMMpUYEfmP2k+b?=
 =?us-ascii?Q?emYzg5uxxeduNoSjmBwJFyH8D28TzhG7na7T3w60901LGZSmR8yYsUWWPbtZ?=
 =?us-ascii?Q?HOQJ86XyGkisBD1n0/G5xnPbt12aQVAYlVgtcLpX9b2jdznaY9hKtSpbjTex?=
 =?us-ascii?Q?PTQDr3LFbvYilMV8gpMte1R72WMl9UpKwhUHPhwuC1LTliFkZlfM/4xp8jw4?=
 =?us-ascii?Q?0UARQkP9L4HA3IYWx5Iz/Nvn4tuoi+TrTP6PEgYic3vRcGHsG8lQJm0W3y2J?=
 =?us-ascii?Q?znDPnsF4TbSyyOwdWi0kstyD6oCoJo0Gj+Bi4w4Fm2MUy4SnpXhbg3Myk9lW?=
 =?us-ascii?Q?ECDOw0XStVHCV+T+hY31f17O6AEVUzr1BFb/LWb7ao8IaP2H/spNncvKpAmX?=
 =?us-ascii?Q?zeXsmoKBdr9wiKHbOHlvlYb9MBVGj+6CTx0uIEj+gbkzJY/FCSd/S/lJxdIR?=
 =?us-ascii?Q?H+4S7bBkyFsI1cmKWBCUe98ZiWHtdEjjoIbAolF24gZ2JNvckyO+1dVKHdP8?=
 =?us-ascii?Q?CMrX2C24UYaks7sfbUoDfwsB4PxPTJMwpHzseTRlDvibOPZlF397DoCvy5BJ?=
 =?us-ascii?Q?Wms4DWKdHQUuIJ/55qg1wxDn6MaHX6BBJHp4/K6m0q1A6/id/kKcmCGxlnG4?=
 =?us-ascii?Q?4Op6kMCGDb/U4Kn8tBkMuFtCOeUcWLHwnHkuqPktv/d3Tie5gUr2grsWJvsR?=
 =?us-ascii?Q?BEMCWKB+fTFhGeJJB/miFg3o/v8YbJRTMhbzN6vY0R2tD++sxfG+YFCOlM2J?=
 =?us-ascii?Q?VHOuSQ0Aiaomi+G9kGP2C4W4eyuDZGHZ3SUmKZ6m173OB0dDVSQFBwI3OohJ?=
 =?us-ascii?Q?xO0BVzRTVevRkGw0XmVxSDCJjOAPMWCLUseA7w56HecRHSQVHnDWSs4dKVz/?=
 =?us-ascii?Q?t/urAhozShDC3euRTIDbsb9RiZc4ZRT7x4JiJm8tFA5Hdt1J6d7qqRJgLcGq?=
 =?us-ascii?Q?BYlzj37EcFsc7TmA00i6jXahGVinx3AgjOfCf+x9BYGPeEQrsCxnxIUfhGLs?=
 =?us-ascii?Q?8N0lSUiHtP+DGSpD8/fiwusHBRAvoBDcUIPjY5xRwfU3x32MiizFNefu7G5o?=
 =?us-ascii?Q?Ma4x22rqlFklZiTu5ErmPAvBQN5bsG7XOI57VN5vWP/Tyug7T/HAjD1j4mbh?=
 =?us-ascii?Q?tGEe3KWfTe6PEwmqpY2SEZHRNJihmLztu2S85Pq9RKxO/Om0MS8hZfWFH0k0?=
 =?us-ascii?Q?dXQVtMx4dLCwhA6AC7RsLbbv3Oh4u/Ou+dBrZrQp6synVpfI+TnvNEsNUDyM?=
 =?us-ascii?Q?iESIPIIk/tsE/usn8hJLanCPdMvhH5QoYFG/84DQEukwMjoRqvIXJZoB/YaA?=
 =?us-ascii?Q?KtSikkrXVu8PTWMimQA8KHYuJK9bwF0bfls9ar27?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f35ef8-3440-431a-d1d9-08dcc1a5f563
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 05:56:11.0431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UM+/Hovg7GAUGeRE94cnZV9qcAcCn/tP7U5dT2zVd2njT7gUEdEtpdhUZBxnQkiVrOrVh+QXGFL+sCg7nNCAUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6846
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

Hi Bhanu,

Please check the igt@kms_vrr@flip-dpms test on below link as this test is s=
kipping=20
and it is passing with IGT_7967.

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11563/shards-all.html?testf=
ilter=3Dkms_vrr

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Tuesday, August 13, 2024 11:09 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t 4/4] tests/kms_vrr: Add more logs to skips
>=20
> Debugging would be easier if we had logs available for test failures and =
skips. This
> patch adds print statements at crucial points to provide better insights.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 4fa3df417..36a22eebe
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -879,12 +879,14 @@ static bool output_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  	data->debugfs_fd =3D igt_debugfs_dir(data->drm_fd);
>=20
>  	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR
> | TEST_LINK_OFF)) &&
> -	    output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> +	    output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP) {
> +		igt_info("%s: Connected panel is not eDP.\n",
> +igt_output_name(output));
>  		return false;
> +	}
>=20
>  	if ((flags & TEST_SEAMLESS_DRRS) &&
>  	    !intel_output_has_drrs(data->drm_fd, output)) {
> -		igt_info("Selected panel won't support DRRS.\n");
> +		igt_info("%s: Won't support DRRS.\n",
> igt_output_name(output));
>  		return false;
>  	}
>=20
> @@ -894,7 +896,7 @@ static bool output_constraint(data_t *data, igt_outpu=
t_t
> *output, uint32_t flags
>  			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
>=20
>  		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
> -			igt_info("LOBF not supported. \n");
> +			igt_info("%s: LOBF not supported.\n",
> igt_output_name(output));
>  			return false;
>  		}
>  	}
> @@ -911,8 +913,11 @@ static bool output_constraint(data_t *data, igt_outp=
ut_t
> *output, uint32_t flags
>  	 *   - Limit the vrr_max range with the override mode vrefresh.
>  	 */
>  	data->switch_modes[HIGH_RR_MODE] =3D
> output_mode_with_maxrate(output, data->range.max);
> -	if (data->switch_modes[HIGH_RR_MODE].vrefresh < data->range.min)
> +	if (data->switch_modes[HIGH_RR_MODE].vrefresh < data->range.min) {
> +		igt_info("%s: Can't find a valid mode with refresh rate (%d)
> greater than Vmin (%d).\n",
> +			 igt_output_name(output), data-
> >switch_modes[HIGH_RR_MODE].vrefresh,
> +data->range.min);

It exceeds 100-character limitation in a line.

>  		return false;
> +	}
>=20
>  	data->range.max =3D data->switch_modes[HIGH_RR_MODE].vrefresh;
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
> @@ -922,8 +927,10 @@ static bool output_constraint(data_t *data, igt_outp=
ut_t
> *output, uint32_t flags
>  		return true;
>=20
>  	data->switch_modes[LOW_RR_MODE] =3D
> low_rr_mode_with_same_res(output, data->range.min);
> -	if (data->switch_modes[LOW_RR_MODE].vrefresh =3D=3D data-
> >switch_modes[HIGH_RR_MODE].vrefresh)
> +	if (data->switch_modes[LOW_RR_MODE].vrefresh =3D=3D data-
> >switch_modes[HIGH_RR_MODE].vrefresh) {
> +		igt_info("%s: Not found a valid low refresh rate mode.\n",
> +igt_output_name(output));
>  		return false;
> +	}
>=20
>  	data->range.min =3D data->switch_modes[LOW_RR_MODE].vrefresh;
>=20
> @@ -933,18 +940,24 @@ static bool output_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>=20
>  static bool config_constraint(data_t *data, igt_output_t *output, uint32=
_t flags)  {
> -	if (!has_vrr(output))
> +	if (!has_vrr(output)) {
> +		igt_info("Driver doesn't support VRR.\n");
>  		return false;
> +	}
>=20
>  	if (flags & TEST_SEAMLESS_DRRS)
>  		goto out;
>=20
>  	/* For Negative tests, panel should be non-vrr. */
> -	if ((flags & TEST_NEGATIVE) && vrr_capable(output))
> +	if ((flags & TEST_NEGATIVE) && vrr_capable(output)) {
> +		igt_info("%s: Can't run negative tests on VRR panel.\n",
> +igt_output_name(output));
>  		return false;
> +	}
>=20
> -	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
> +	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output)) {
> +		igt_info("%s: Can't run VRR tests on non-VRR panel.\n",
> +igt_output_name(output));
>  		return false;
> +	}

- Pranay Samala

>=20
>  out:
>  	if (!output_constraint(data, output, flags))
> --
> 2.43.2

