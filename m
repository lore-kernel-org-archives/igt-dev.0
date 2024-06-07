Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4750EC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 20:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D923410ECF8;
	Fri,  7 Jun 2024 20:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="he9NqtXE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D5E10ECF8
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717793063; x=1749329063;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ksfDk7KI+Ix/YxhcPFzz7La3nfkCoQPClOtJ1N2pHcQ=;
 b=he9NqtXEq21ofZD3aD8HBuyldcZSBKqEgPp8JvdCegDq1CsCmcJm8/nz
 Q+NtP6dLE1BTjqachjcopLH1Q4whiGduFSt+3hg1uBBdWjP3mpsg1w/ia
 CfTSooTyuqI31MmO5dAY8Nwksm78KkVQ4QzWPfh+gKXB8T9IJhe0mT/Lu
 oyEtY5e5cp4g14he5NPlKF8xRHTCJBpWK/pe+oKytkceX6LxuxIGIDxr4
 3O20XCp/RwqPAx2S7kTbT+GY1pVqJ6TjvJmUXq9H+NbBKW8OEtXfXBfwm
 6TIQYa8B/UOf5qjqJKeAa3+pG6sefUIgBNTnRls0D2n1RTXnfyQ5VXzgH w==;
X-CSE-ConnectionGUID: Ifqm/qVBS3m4FLA65k1GXA==
X-CSE-MsgGUID: JaFLmbLvTJallb4ZFgz2ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25633267"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25633267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:44:23 -0700
X-CSE-ConnectionGUID: YpUiVxeFR1GlkLJANya2fg==
X-CSE-MsgGUID: GSJ3XEb+SO2Z5shtqZK1Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="69216859"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 13:44:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 13:44:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 13:44:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 13:44:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6fKOMIV9pJwaU3oYfCSvL3YoCcW3D8Q2vF/qR+uIdqJDKmtksZiNwyog0Zv0In/TEiXTAP4mnjTXwd2/SC7AqR6hnJdQPVE9AyfVAMBVPFBIXXDVK6gp8ZCHfdei8cTFrNBFPH3ZMNsb8u4s2jBk3DvAFDX3RB2Pq23YzE0qG7WAk7E44s3cSMXY44jnvdpSs0EDtSYifFBuZ8XPnrjVURzZznFYISxf4MLZRAuV7Ukg4he53JpFbdi3JbD+OFm8kS+6u1eb2e7D03X7LjMnfIaZUKIyqsI1m+L4+HexbI+fqZszQotpPeTfRT/gGhS8tyOH71CyfjGcC3KFTHGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czRzuWOgECT0iLyMxf/FTBTtnyC0p71CFU3bbsSqyT0=;
 b=HmtOcaFWr9Pu4Yvphha7WZA+4kcJljOTOqXzvbOR9YuKajTcaYAzwksqXgEBVXk4Tyu+FZF9FB+YghkcyD1aLQM+aHpYNO32QTk7p3RGpTIRZA8O5MeBx95U9s1aEo8JT0l72Fjch4sSt7uvV66br8vXPVzDD6gdlOq/Tf0KV6ZRM87g3SttAdY+vgR3tB/9ll+9aFPYZB6SYSCj07IvK81BJbRnzpXoREruvfjg1TpwZC9Y6AfP1RuCpcMuJ+W4KrVrD4lqQalYAnYwNRhD2FfwofNACUpfSlcfj+2vpnU+y5CiWkzaWUGLxGA1XdY9AiyZiWdNYe4/4+FLDhq38Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB6997.namprd11.prod.outlook.com (2603:10b6:510:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 20:44:19 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 20:44:19 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t 4/4] tests/kms_dirtyfb: ensure plane size is within
 fbc supported limit
Thread-Topic: [PATCH i-g-t 4/4] tests/kms_dirtyfb: ensure plane size is within
 fbc supported limit
Thread-Index: AQHauOsjicB7e7puRUuiCxzwpRJWoLG8xOnQ
Date: Fri, 7 Jun 2024 20:44:19 +0000
Message-ID: <CH0PR11MB5444828584D7B45152A9A493E5FB2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240607145732.285557-1-vinod.govindapillai@intel.com>
 <20240607145732.285557-5-vinod.govindapillai@intel.com>
In-Reply-To: <20240607145732.285557-5-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB6997:EE_
x-ms-office365-filtering-correlation-id: 9c441a8d-b9b1-49bb-338d-08dc87329ac9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?Rj2VjvE6bpnwzZUEF+k4dI0v46CfSUEvDRNH7GQ2lAZzPHeoWn5OmWMNfH6G?=
 =?us-ascii?Q?/e0ce7yIBfxXeB70UBWdSk4UwGkIkQpTZLxM9Z6mQtwBqQHrfY369P3Isexa?=
 =?us-ascii?Q?XjvacNncYgHfJNGHLuYeVXMWIi7rbGkkNeQHbYKOxfJ3ADi+WfnqW1/a5/bd?=
 =?us-ascii?Q?7P0VDmcTKWkLcxhBWnf/hHxGbnJxTpnRkYea5jJnvNMCz9mT7wVEVTgBIM0t?=
 =?us-ascii?Q?F6bvMJvTr267+6pDPM8nc2+tdxwOTMYPBxyVNEWbOlQl8hvsvhtvYkOJc6hj?=
 =?us-ascii?Q?egQG6A6UQHxFITO2caRpbEWUhVqGGGtE0pVLszBYDIvq+Z0ID63L1P4YVEGf?=
 =?us-ascii?Q?7Oky/XcWSzzKezBykBbDEEAQxTlRbOfpxp+PiLgD0NPmRoLejUMcdetiOAF0?=
 =?us-ascii?Q?oxdyYXfX1scoOsk886QqPolbs8XTCXvgdKIu8ceHCCRlLQK5UOSYoFZQJy4O?=
 =?us-ascii?Q?pXes2GJT6xK7/NZgKTXY5JMX8gPrgWgLyyX+Q6LH81s8tpxr1gLAovLWFDt+?=
 =?us-ascii?Q?CZb/V3bwOCU4W0eEsPpYma40R49D4zlQI/2Q+J1ky/c921vDmlBNM2eg6wIz?=
 =?us-ascii?Q?HW4I42fc6aULFakq2m0+bc0S3My4AtG83bMQ+d0PpPYjE6E5EnyREpTvgnUS?=
 =?us-ascii?Q?4KUyUI5pMcLzo8v1HT8AUbv8ObTjmMKFLkVP2QQWJYIVlxJUCI82kNCkIrAH?=
 =?us-ascii?Q?wLOf3sByh+6C595wnYY9nMYwcu+bus+DKGZ8jUTu+R3K6RgVQN7SKUwH+l/X?=
 =?us-ascii?Q?xu1nq7NDM/gdPb/B/KvangMmAHtCut8BqVj2mVrzTc5Saq/yN/DcWfJFvQe0?=
 =?us-ascii?Q?FtWapcU6fZT54C0vedBcNUuocJqdYuR3PlLcwzkxtuFd0uqsRd4QC4I5QdHZ?=
 =?us-ascii?Q?8izMyjtxaaavYDHlW8Sz6SnILwQqIsO60erh12uPrRcIzNFhAT0K3zm1Bpzp?=
 =?us-ascii?Q?iDNajBRXYVFfBA5LJD9PJfXZ3SGOwge60mlL1lQfKI/vJDafnu+paPuyMaH1?=
 =?us-ascii?Q?nIhuP64K4ADjIdUexXfYIgbfpZG2rP83wxZTZsBCrVNyh/KFq4ZyZ/x8hfGm?=
 =?us-ascii?Q?SSEbotIGAmDDmpPFbRlxHQCiXdN0ALrb+mOMV8x+PcTvVyxOg2mcLlilSa5O?=
 =?us-ascii?Q?ntvVN3WcdLwCXijYUYSImBk29/7Yciu3J74DSaZjpWofwZmlIHSrPnW1HIK0?=
 =?us-ascii?Q?Khbe7+/KH+2JTUxPTvy+fULzsetZMX7DMLRBxS91ezwB7CFCyBID9pP4Ed3p?=
 =?us-ascii?Q?MiqepHBgfxvVKI+xvj8+fBSJyiwWVUHeLediwACmA2VWarL8tm4Jysdkqb5p?=
 =?us-ascii?Q?1xZ3tC8Fyu3OQfHetCtneGTR1XSaK+P/PFJ0YIQ15nrpf2mDo/scwuNveaRf?=
 =?us-ascii?Q?zdQi1Iw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l+6z2GnrmGgpg7onHSzSfUfp1tdCIJ/yh1zAsw6QdyJs9+MaKZvbprLxaHeq?=
 =?us-ascii?Q?XTL95Paf2akkXstLwWELLYfqzg7j4GMJlqJPki07MjDFjcNK3u0LKAlP9zb8?=
 =?us-ascii?Q?7dqnT6sZoWbV9qGaPh4/cEvXA1ArLZ6Sc4341hV2KcXs9dBwoBdxnaqoL8/w?=
 =?us-ascii?Q?BMEJWohCVHqpyG80/E9cf1sTzqTupHDeih6Uz1dm/SlCOGftskz3dCpPY2Ex?=
 =?us-ascii?Q?uzr6xyZWmds7DxCvlwESGYZd/uJ41v/1/LS41mhbs4UateXidAzMn4xdIfRv?=
 =?us-ascii?Q?ZFc9CEWeJNyMyV+q7YZhm1RDJB7/Yq/OBA4zQCg2gllMJnZsfasA7Bvli9fc?=
 =?us-ascii?Q?nSW3/CUOnLA+1t6bXl7x3XHWDx5ut85s+XLYy4+qBoFeHjCSt2Jz6FfSDwMj?=
 =?us-ascii?Q?0aB8fmDQLvqHH0+fB5/v1OJJ93oMIkLdc6p8QIKdqZlkRxs6vYNHUdlxlH9M?=
 =?us-ascii?Q?PFZnAFp3ZVoipMnsEy6yw3/0qCASX1HKjj31t0Jf1XlNfm9fSAT4ZQp9Qm4a?=
 =?us-ascii?Q?PgppzMvZd1wWqiCYsVHX2cNUjUmqokOHic91O6SKyNYNFbJ16nww+ef2lmAg?=
 =?us-ascii?Q?dyOc7iFf4CnFq1WgLvPzw17p/ZF8JDDDhR2cnfKapE/YtzcuZuhxyEbY2kqc?=
 =?us-ascii?Q?4j3X/IO+D5Bzr5cJlr9n9psUobjbDxS4qlIrcbBOI/G0c10M1Hw6w/j1J205?=
 =?us-ascii?Q?OLu48n6r0hFa19AhZtYKi8uGFxYXKay9WewNz0fkKnZIOhQB4pJzTxhdPfHH?=
 =?us-ascii?Q?OfuvJAS6JPWA0smOZECGhJphhSh5On+MhH33gt+PfjsHPLPF+fc9dod1eAmC?=
 =?us-ascii?Q?fxrE1W+ClP2P432JP8IALTvH/4suXAFk6fE8bGDIwkCnPSsfR7xoThQTxc0H?=
 =?us-ascii?Q?3+Xj7M5KpVRvlbvo5AOGSFIzoPGyvqlKCpdeDKM3FRCTdvVQM+QihqJTS3Bc?=
 =?us-ascii?Q?DLojRO9Q9Ev0HSi1C6Jua65ISmmF7nHsJsJsinGcq81U2249RkThMH1MDWhR?=
 =?us-ascii?Q?rHvVK9g+b0ZoXOHpsmThsCISs5Asagk35/uxD1xgJZRz09W3joymj28EEzC2?=
 =?us-ascii?Q?NPUEVYGLC+jbbeaJMJol/esfDjo1he7LjcY6C90vBoCJFqX7zoD494S8DkaW?=
 =?us-ascii?Q?Ls+JAf4aWih4/SW0KHg65tf3q9U0hvfFGUP3XU+YTzbuyq9P7F+i3sl9rxPy?=
 =?us-ascii?Q?8D7FijzVf8lR+cKZrXmSENWOHFYqERLjNEBaQjcLqvNrwRJ10RuavDNLUY0c?=
 =?us-ascii?Q?wII/h5lwvsIHRXYscpH87g+4iIymz2R31Gx3AQCPVg8XFhZIxfLxAjtGYREi?=
 =?us-ascii?Q?a9AnmfB5RpIvNlqowNedrqfQYxGydrI50aQnGqgUA1pYbTgLfZfImVB0z5Fp?=
 =?us-ascii?Q?wvFlVfFz9eJAvW/lhAnjxfK4cmLbq3MUG/pCaVFewLPW+O9SfZ8kfjqHDrwN?=
 =?us-ascii?Q?dxgDYs1xI4j8/PxNYJ/ywXbfeGHV3K1u/UFGLDQu9MkmKLTp+x4XuoB/6VBY?=
 =?us-ascii?Q?UnSu/4ydb2+hXkRHVsAmWTnysxl4gO/OctFiPEcb3cYkMkHrHxAI5L9JBEUc?=
 =?us-ascii?Q?FnG/xUSSrGir23RQF+G5LV7cpO22Y+i6Suf6l3iF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c441a8d-b9b1-49bb-338d-08dc87329ac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 20:44:19.4188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pO/Lq2SpovOcNuKO4MImxq1BXDUhZB55Il56Ls8BRjS5nx9yzsfKzo6uSG+78JoKhkbw/Q/ysw7ER+MydNcuw+WsRkRZ+GVLlu/M/zRJpAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6997
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vinod Go=
vindapillai
Sent: Friday, June 7, 2024 7:58 AM
To: igt-dev@lists.freedesktop.org
Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Heikkila, Juha-pe=
kka <juha-pekka.heikkila@intel.com>; Hogander, Jouni <jouni.hogander@intel.=
com>
Subject: [PATCH i-g-t 4/4] tests/kms_dirtyfb: ensure plane size is within f=
bc supported limit
>=20
> When FBC tests are performed, ensure that plane size is within the
> FBC supported plane size limit. Skip the iteration if the plane
> size is bigger that FBC enforced restrictions.
>=20
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/kms_dirtyfb.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 2a32fab56..83042e206 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -102,7 +102,14 @@ static bool check_support(data_t *data)
>  	case FEATURE_NONE:
>  		return true;
>  	case FEATURE_FBC:
> -		return intel_fbc_supported_on_chipset(data->drm_fd, data->pipe);
> +		drmModeModeInfo *mode =3D igt_output_get_mode(data->output);
> +
> +		if (!intel_fbc_supported_on_chipset(data->drm_fd, data->pipe))
> +			return false;
> +
> +		return intel_fbc_plane_size_supported(data->drm_fd,
> +						      mode->hdisplay,
> +						      mode->vdisplay);
>  	case FEATURE_PSR:
>  		if (data->output->config.connector->connector_type !=3D
>  		    DRM_MODE_CONNECTOR_eDP)
> --=20
> 2.34.1
>=20
>=20
