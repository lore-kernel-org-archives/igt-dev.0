Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091B0D7830D
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 11:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90E810E6C5;
	Mon,  2 Dec 2024 11:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yu0gIIsc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6416C10E6C5
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733137809; x=1764673809;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Hu5aN3fkISc6he4gHHDS3nFdEpfPtsLTkvD/w0AUAA=;
 b=Yu0gIIscFPPsiu1HMxrwNDjet3t89hFbQdfnio8bufBK8pF38daIO7ZU
 28WjUrdDrCpOvIIsVyDsugVulStjF1peyG3BoRO+5D9QLEi4zXR5wA0ex
 08UcUqAZhDBo/o29jG024935RYLlnbLQCrEqKji9ApXcJn/JJAXv3bRqK
 8u+tCo/tI/lVIpg9xLh26OgVfn1SsJnNTq51Il7Bu9PUvPCKPL8e2w/P+
 gwgg+dIf6+wKClhXi5NDFufRMIQPB4v0QIgkh3iRJ7LoPDNA1mF8OibZS
 b3gvbDvDI+f3t6PBdYiUkZ0t+Mx84qjBUxdyGc5O7xoq3mfu0FHuWCZXe Q==;
X-CSE-ConnectionGUID: TtCnENAWTkCr0o/8WGdssg==
X-CSE-MsgGUID: WLife2vZQ4qfE8CPyMGEGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="36163948"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="36163948"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 03:10:08 -0800
X-CSE-ConnectionGUID: pIe7t7vbT1ubmsK1grvCLw==
X-CSE-MsgGUID: vSlmJHUNTQ62gyiZ9icjEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="92910301"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 03:10:08 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 03:10:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 03:10:07 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 03:10:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmcwLoEK2nGIkic/T/CtNvlahySmRB09GYMg2NHXZbkKcKiLW+eTb2s+lF9OzShx5mhuakYLgdSXyiiREPilVqv6eh/tABPm5fLliiY+PhoY5eKUGFwtRb2rQTeesWKLCnDgnmcJ9WJD4P7aWGWpFsbxo6WHsd/yKPr54gT6n1cYyJ0G1b3zEnwHrNvxyYnlFwwj3ntDhyb+WyT3L0DsAgm1BYPovxHv8srPSQH9l4/UATC8O4/HyhKdV9CsdIoL+2mA52Au0Jjf32kzk3VPkeP24CdW5TpKh9usHR7tm6NuQoDh6LcdVIrXQifnR+xtWXZ4T7F8xLq5nSqG9gbeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wtri8dki3uSYqE5oyN03pDRchvgFsaz0J/T1HcuEuWk=;
 b=S0BoP7IOjc6Z7t36+09do8u6ZX0AHLLjF/f+AbgOip+SmWymhb2aLzKLsRU7banhExQ4jxdTL91/VYBg8qL5SmBNFAmS2ecrBuZEvfY7GmIOxF7ATTMlyFnEzgdS4RYd7oJN5E3nWEHyVSQVLPnIHTDg0fzJqhiloVI99Ea4OlMZlK7NfYPRs2/nHuOQn9s9inK7n7LticJcyir8GO8romXOYWVAMUagPXNrn9y+yNDnuS3z0WbMjhS/B1uh4nsYb6oDRK7H1OJHWnqBLVT7PYGGdCKTLc71l27sEKYqY+ZnlO7QhV3xyWl5gd+j0c/bZbeBYLCw25O3PNU2nkA7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Mon, 2 Dec
 2024 11:10:05 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 11:10:05 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_dsc: Split max_bpc constraint
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_dsc: Split max_bpc constraint
Thread-Index: AQHbRJcGGL0lUcJ+HESaZzyQdEBV9rLSxOrw
Date: Mon, 2 Dec 2024 11:10:04 +0000
Message-ID: <PH7PR11MB6053A9B428396F52FE88A90DE7352@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241202085127.1785594-1-swati2.sharma@intel.com>
 <20241202085127.1785594-2-swati2.sharma@intel.com>
In-Reply-To: <20241202085127.1785594-2-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CH0PR11MB5284:EE_
x-ms-office365-filtering-correlation-id: f8903861-d936-4c6f-bca5-08dd12c1dfd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?LyxW9pnuDpBlFhUBHVIiCre09wbzb1D+BU+e6mW+v9uG1Uua/nsJjmlWudrl?=
 =?us-ascii?Q?kY8wLR3MPwaAONJvrBGU+Oqqs+dPoioyqtNoGul1wFbai5bB1oY0Harmum+c?=
 =?us-ascii?Q?IeNcc41fq5s0kSxoyM6Fdx3SuIskWzplC+pURV4WHzIBHukKgkd/Rd5hZQaM?=
 =?us-ascii?Q?HyBLzyY3pQVPQtma7J+t780Flrzqu0tUxC9/H/2NbTn/cczCKCinsRwqhdwj?=
 =?us-ascii?Q?s+PWP2gFhQpoW5UkwUjypCFanX7rVkLtr4PkNzd4gv7OAnQsSPPfe4mHCrkb?=
 =?us-ascii?Q?NWS5eHO8juwC8CxXZbmM8fFECH3crBirS8OAFBOWh4ZrOyhXeey/DKK9hxr+?=
 =?us-ascii?Q?sDvHOlovEaREbTTDcdNWWThf5C8lh8iNd5Xl6BfThfmtMScfWpLRWxzoej8x?=
 =?us-ascii?Q?N9NgBvrX7rTXbOQN7EhFuZuncqmmmv+GPNKhwOo9NTuv8JfvHJOWSnVtiYwq?=
 =?us-ascii?Q?GP3nl3Ii0JSDVG5JKW8fGDtjH0OHEvbR/kUtEozLwPD/w2vGOt8EUjtQ7Ngv?=
 =?us-ascii?Q?IXzWO8Btiwqn28oFg5Vm2EtTXV9sxp2PLqg4fxcHVk5Sv8xPZLKygsqhG3Zm?=
 =?us-ascii?Q?1iCpM6X64JWpwwGMC838RQ/97n45eJVqFvn/vAZUEnG5ZkTfsli75LUtpeGe?=
 =?us-ascii?Q?7tDgiII2Pn9L4570IkZiC1lkuuARiVvcF5MaKbfQbeusJnS1fT8tp/0HMWSM?=
 =?us-ascii?Q?IjOmh14NITIlPNeDzgO+avdPmI1CE43dwRzCndySbEBMyI+Dwn2fZLcSE8wx?=
 =?us-ascii?Q?4Wam00vji6zuDDEpav5QZL+fL7yLl1au88hSetnAzT21ggzw2pSwFDZlb6jB?=
 =?us-ascii?Q?v20B4gLNXcpWBY9OQIlJ3wPaGMuZPz4R1/uj0jsQ9qwWFvjWugiHBNz288nU?=
 =?us-ascii?Q?oOHG5M5qz19AmhCHBMpHAbVajxxePLua2T5qbqjMlDV4kLm//7EFIGlFE5IZ?=
 =?us-ascii?Q?CL0yrGw1t2KF1x5p2k1v0C5wm/j8UiMMcy/DtGqUO/ExrvicuJo/m20VWdIg?=
 =?us-ascii?Q?TEzqu1vK81P1E+kiDgNoBRXMassBXY7DReOfqvCUxOh1woUZYgsA8dybsdiC?=
 =?us-ascii?Q?q2WZNlNCweVHBg7pE/s6bKYIVr94NqLbL4+xfCr3slhdmwenC8AAasMGnAo9?=
 =?us-ascii?Q?s/ecQ6sf3v6JBkEPc5ukNqo5NYwLnEHaqjU1Ok7FI/QQqIzc/xb0FMUATB2h?=
 =?us-ascii?Q?5/BFGLydj2QwB8yjzg+j/hxgbKg08XGYgBXWiJrPowg1y8Go8A18YlpS3wkC?=
 =?us-ascii?Q?sCl07+1LQCBzo92vQVpciqva9aSAL+4ZdymFxwMjP4+o4mTithjeaEnMMKjE?=
 =?us-ascii?Q?ykrbPBRp3GOIXM08QwYptkvNYV5635Sn2fhJGoxG0Ucl/TckCkHsx+X/0XlG?=
 =?us-ascii?Q?juX6vtNZ4jji2yd3XnTfoyCpJkDdWL7S7ZtLKUiObe5ToeDEWg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eUy0NIIsetwCaUipLs2uCrHWpba4xtDDQeemEgK7adANW9C0ZVorYdk65qjl?=
 =?us-ascii?Q?DRdolbv7mTu0ImWkds/uL3Oys6BHICCBffzHFT8zPGeDlOQiq3OgYk1DNajX?=
 =?us-ascii?Q?qVOhvKEgvt9s11bXwhc6nhUyYL1n47tjK4xY5U1pe9AXDxRSpfrTmzyMedUJ?=
 =?us-ascii?Q?MhmNi50/fLA+EcQbY1iVMdy4yzwkT/Z1Mc256C5hqjZm9LoYIgNLn2TPEEjh?=
 =?us-ascii?Q?zIDhy2XwaHCxo3edFvDqT8GcnP+z3sBNFvwGj7br6z3BzAlg89luLgYtAqqc?=
 =?us-ascii?Q?On2NaLqLfJws3j4zboANberTcDgyLif+5RUvwnsUhkUW0F4a/AAl5TMfX1It?=
 =?us-ascii?Q?RVUBNhgJpBK5uFgixQtUzYBk1EgzjbJrNkxjj594hdR9Abfy9NV9AMzklKjw?=
 =?us-ascii?Q?umIhDd54inrWAgoYWFyxaDVvjoALxF73Ofs5cVEpmq88p4FctXI/ke1X2LpY?=
 =?us-ascii?Q?PZjDGI75yJYlPL00Oc14Apv/HD7Od20hTgrH3yrciAeOX+ycu8PPxn/M4pA2?=
 =?us-ascii?Q?7vsyLJ7ksrSvdv0sjsD2Uwx60gMZTjkn0QASE0Gi3KZxz771Hl0iY9JcKJAb?=
 =?us-ascii?Q?qlo2FJu2Gj+6lRtOfnI9QwbtHyy8s6D9QbfF/0N5eBdjFoavVw2j5j42Xz9f?=
 =?us-ascii?Q?Bl/oaACp3sfWAqaPbaC+pZ72+2kcVplUC40qkhbtoB0+KenuVgvi6dGrX8Pr?=
 =?us-ascii?Q?CZJSe7wokmXP90wD/Z1RtLhuKrcWQtA+YEmmttWfBVC7dx2ttWUbhIU/ZnT4?=
 =?us-ascii?Q?DiCOEF78Ljje+lUsLKzuLWKvxQMJ6V1ENn0YR3NvU2e0JlPgEGwQ6vnYaqy/?=
 =?us-ascii?Q?FuIL1DhOUq6XYDDLSkQcohEOHglZqGpIj/ZoEXpNVKI2nXtmNyb5it3zxQpw?=
 =?us-ascii?Q?A2P0B0Lm5XLhT57i5nk85sAlbTbe9qmTAWpkgVWlUt6cre5b4H1XvxAjOYT3?=
 =?us-ascii?Q?e0crJ8OGaF89+GVm4OBvia9/4POw4Okt/q5nc99+qfnFYXKW8C89qCSeyZFW?=
 =?us-ascii?Q?4Xkz92crn3dYDOlzV3VNJVKTaHLHmkrraFNYzAjkGLL/B0zgpjnyPElocYf/?=
 =?us-ascii?Q?00TtZt07RQPCmtmMJHLL4Fe0qwCCBxtxZbZS2y9y51lKXTY5fdaERWulQGEp?=
 =?us-ascii?Q?KjaQW1FlvrNbPyCaUfyAJN9KDJbkAMeDcIMef5Avm5mlD7A9xenh1ArBbZgW?=
 =?us-ascii?Q?uwfPDwSuYPQmmgnhDDkngSNva8y+eSqAlxHImYFxEJFuYQPzI1PzHh+0Gkgx?=
 =?us-ascii?Q?XIsUtMgAKewp1/fZUrP0LXMbf1bxkaQ1L3DHUvdq+wixYJZPD6TKwIspOD7Z?=
 =?us-ascii?Q?DCZR8fmtZsEtB/Acz/w542kRPoUvIaVDuJf/5+y0krGM5LU/5mk/LG1PYzaB?=
 =?us-ascii?Q?iaWTJGXFxXhIB7xEqPyx+RCwVHSAL9f3rFx5EOyR79wgRCwTh0q4pxLPdR5q?=
 =?us-ascii?Q?WqjUC3w+uFXJadccegfC1hfcRzcvuMM3u7dT5AAQFN72P4SCfXi/VnNywzwW?=
 =?us-ascii?Q?4FmoUH/f0mkaZvUapH4PPqxtqAo8ezHzqRIzZBPBpSoNqVZCyN5JqYBn2ND3?=
 =?us-ascii?Q?Zau9PewjwrtodaLToik8MQnadG07dnB1BtrzCzDJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8903861-d936-4c6f-bca5-08dd12c1dfd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 11:10:04.9189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aNmrGwWFElT1ld98ABL0Cf5jm1OFB80LcR3R47rVtjgMF/1UffJPpZn4LxG/zuCN1XUEokcpNeoz8CmH8xsRsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5284
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

Hi Swati,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Monday, December 2, 2024 2:21 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/kms_dsc: Split max_bpc constraint
>=20
> Split max_bpc constraint and add igt_info message.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_dsc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c index
> 9b48caf76..5508e7a9e 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -281,10 +281,14 @@ static void test_dsc(data_t *data, uint32_t test_ty=
pe,
> int bpc,
>  		data->pipe =3D pipe;
>=20
>  		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
> -		    !check_gen11_dp_constraint(data->drm_fd, data->output,
> data->pipe) ||
> -		     igt_get_output_max_bpc(data->drm_fd, output->name) <
> MIN_DSC_BPC)
> +		    !check_gen11_dp_constraint(data->drm_fd, data->output,
> +data->pipe))
>  			continue;
>=20
> +		if (igt_get_output_max_bpc(data->drm_fd, output->name) <
> MIN_DSC_BPC) {
> +			igt_info("Output %s doesn't support min %d-bpc\n",
> igt_output_name(data->output), MIN_DSC_BPC);

line length is 119 columns, exceeding 100 columns.
> +			continue;
> +		}
> +
>  		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
>  		    (!is_dsc_output_format_supported(data->drm_fd, data-
> >disp_ver,
>  						     data->output, data-
> >output_format)))

Apart from this code looks good to me.

Regards,=20
Pranay Samala
> --
> 2.25.1

