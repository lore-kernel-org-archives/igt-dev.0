Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82420EC047E
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 09:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055FF10E6A8;
	Tue,  3 Mar 2026 09:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRumZx9/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CB310E0A5
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772531447; x=1804067447;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IWStdwNWRmbnHFRVIwDb4xp7Ae3EIstKh5TEhHw6U8I=;
 b=WRumZx9//WQJF2rJMaf7znR4bQdNbcgPwLWksMsE77LROFdseGEEYjre
 Ce3U4yYvyQOaHnK3z+fqm2nvlerlzRTk7rPnJ0GLDTrsWlLJCobaeKw8/
 bmteC8D4rbD4VFl2uqPRrgTg5Ust/r89h5zXoVkNannB35MpBx8hIpVmJ
 N1IIsrTibN3+Bi5VEGqsUCifOAkStgJiAAsPPzl0+ExeaZMfEIhD7v5Ky
 Y6Z0U4Qjq01zDAxsFxBsfZ5R+GFy0CqUSWMFqsFnf44Zdphj/faPv4Vxm
 PUn9iOTEcZTL0uFJsDdu8blHKLBZPd/cmQm9yfUdfjDHPOEiEDKyzhbOr A==;
X-CSE-ConnectionGUID: 0S0WBb4nSn2TpqcoyIiMxA==
X-CSE-MsgGUID: rIUVWCy9SISI/EwQaVjiEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73625895"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="73625895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 01:50:46 -0800
X-CSE-ConnectionGUID: 5HjmMj07Rtuzt3q4v9opRA==
X-CSE-MsgGUID: ceURQA5FSaGan09wEh5yJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="217932069"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 01:50:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 01:50:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 01:50:45 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 01:50:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GU5bBHJxB2dqEoNbiqPinhJ/rv4trCdrJFLDW7ittBzsIpopmcoNk4BGqZdQWAhtdGIMUTD/88WTa7PMpayIODYT0mFEEKrjaUUQzblrid115t0MX/1T7TZC6ecaFL50Ol0rosHtHwe9ceQBm5TmY+xr6WXFjhPB5sOX2HJ5NHvvTI6Q9bno0akZKAZ4lTB8BkOG3TMOv1CFuyJM+rhbf43XAkKsEdvGn42GTN5rgnlljcnaPFP/uTk2xHZDAyYb8aZPZTxAmT/pR2G8dQOl4Md83k7Sp9vmL4x5AUhHjDsCrRFLXRZrNxym2x9ZWjMk6wzB1c1Bwh1VVfBXwCu3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mdX8DMsJcA33HwKuQb2InG0fFNT09tEshcQogky2Bs=;
 b=loXTWEhxvCR0mUFIOLFhqiLnvuJAWFJAC4GkHEiJXjqQMx49AY/+lMkKSGL50oA5bCvSXtB/DDjR5Om8AZkUevXubbr27ep7+bzUxQpTWjuaVXxOJbHSBKJw/NCU+fl8H9TPFqyvpWOLF+BcS7kc12zaq3D/AFIL5+Xdl272r3NmyBX8+IBnIRquWcwvuUY9ABhITpY4YAEehnSE5wcXG24Mja1CTDzzENdyK2U04dEVat9dE2YIgIitzg/sXc5dgSLHHR9yZ4KEsPlHP569RIUOK2jvr8aQxXI+1TH+zMSLBUbULuYQij1F6qjXYpH8lOhdeRWzn+VaPqxY9cBWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 09:50:42 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%3]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 09:50:42 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] lib/intel_pat: Handle platforms without compressed PAT
 index
Thread-Topic: [PATCH] lib/intel_pat: Handle platforms without compressed PAT
 index
Thread-Index: AQHcoMMWrml9ttl4fUS87m0IAi6uZbWcpJMw
Date: Tue, 3 Mar 2026 09:50:42 +0000
Message-ID: <BL1PR11MB552518C35C193641C8AC3DB9847FA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260218103608.2015045-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260218103608.2015045-2-sanjay.kumar.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SA1PR11MB7061:EE_
x-ms-office365-filtering-correlation-id: 67520bc3-a3ce-4c5c-2b69-08de790a5576
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: OxL/zp8KkKeHFlPd2wvm4erOD+WwNQx/fjpHfjzsYOSe/EqzpG5Y+Wk1JfbndaXyXFllwYY/DqmJ5kZo+vx8qTRgaXNiEzc0A9E5ZbB+RRhsQgQLDWb5dMyQqSC0RwKUjZKUaLDfc/+aTcIfW9kuTXELl3OQpzr8oxdytNWYuCfcvyi0/gRJLUcgWm3yZ9wgkDVS2XlEo/tnk7P2uPhCyhEQgHBrj9fl/I6hSzllFXz0SSoM05r54aOZx9oqsifQxZ/EP8xiMzldQGRiJgLZIk89kWYNsp2KYfF6cPci/8r/qdek3zdvlZ+06q7ecA7knAA79y+ZtGhIewrYhCMBfEsCuoot4GqZRH3aVRiSXPDyTPxSZsL03fEldBi5yD/zzwumWCc2+KC8+pcHUMOmEALCSb/mrPxxJIETOZ416SenjShWn6RvFcSDhImd7xzv+8QRlfoNq9qLJy7+ueEyimBDwFkmlhZ6FaYOJ3BbaQqLenGT2MMxn3RY/rGMJly3Gq2yNTU2yqoTuCMB+ZR4i7l1oDlXgy7qth2RbVmu2Mub9AFKgxmd3hLMZt62T7uplMw12lM0/YQTaHglc2T3lLv/TyLrrE7W/rhuT6bMeIlSPR4OKd7yzgYARKefuaA63A6D4IcjBjyO4eZHN7Au0KEV4V5xn3w8/arN115F52LfORZZskpjoKnrF4zH166/uLbhmzLe0tgCJMWJyj3Xog5/JAi0VRfzFGFQDoFKIIb5cGybXBgObwAbs7BDL2haPv8BoVrEtgmdYU73nVsFSWOPrSnXD9c79BPxPy7BT/4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p9OgO1BKVKoiVxRQZJuh/Rb7DOV9YqwvEwMJPQomqL1l8sJEL9IewtD2mkTQ?=
 =?us-ascii?Q?urE/+4tA5jcFJDQCCntPTHxfDKQu6p5TLTNPYl6PEE9/67P9mMLQsyjQ41/S?=
 =?us-ascii?Q?5p9K/SKJOaOeg14HeaRdm36xnrN0RrFlRwQbuChF66yKo7ZPkt3VL6jozHXT?=
 =?us-ascii?Q?ws/TLs0nuK8qngunayOu169TwGkzaH2bupaHIdUxpIHhMt+eq56SV9HWCMs/?=
 =?us-ascii?Q?3fYnmgIWbUfN+P8z3IdXNsNovdw0fwQDOn5xMmM0txD28J4EjqtP17JEOLnC?=
 =?us-ascii?Q?SUM20e6OZtGr/QiwEqCtJub1Bz1pPNKQQM/HOXGEy1O9KoqYALDiUjHBl0t/?=
 =?us-ascii?Q?WmAqFtniZJQcaqWsvTruUK7yEPaQCnZbr88L0uyb4vaYOSjgJBHWx9RxjlKy?=
 =?us-ascii?Q?GQMj1gEhqgWRmRSrXRPAM7CTQ+LQY0PyxhwTn7S8SKzokcpb85Bs8r0SxNYq?=
 =?us-ascii?Q?YKbbHC7QuVjDKFuke+llTumRKscsTpgLcOW16ktRZrqdtTD6EA9cZgiKInOX?=
 =?us-ascii?Q?flkPpCLApG49KonZHbnraE8y9grdJuJoI/eMdzx00dE+fh5BM76UPE94riI4?=
 =?us-ascii?Q?JIWnKf1q8XUU/qP8vh1fQouZ3uxQTP+TfrGYONQCEWOVu6jfuglCBqIOEIkq?=
 =?us-ascii?Q?RcfLluq4iVqiYfdVcXIwuRNFCW4OiOG5/YMAQZ8JMayh+5Pwlx7LNPw/2mF+?=
 =?us-ascii?Q?x70fd2HoOENiFULjaxAm6DGxDRfBX0hbED+nWp1Y66ZRSzHSktG5d3FtbOlv?=
 =?us-ascii?Q?GBoXvy3KK3g29fm1PA3cS3JRRO8IIZQqatHrR3HiF9JdhZSdBY2zhh9d+gA1?=
 =?us-ascii?Q?JTZncy9qC/CdYRwGQIzy1ICH4zWlnL97RQOgFv/wWqRh26QCkGtMtCTjuBt/?=
 =?us-ascii?Q?68oTCBVQ6mYV2YMpUZegv8976jEVJckj+6ePUUoKvDLHrwg2qHoUWC6fNWCR?=
 =?us-ascii?Q?bGTIg8VlG93Jtu5FJZFQtJ1ScfT1M9gaVAcyGu0fgRsvbjobX/W7IoR5hrDw?=
 =?us-ascii?Q?8Q385FcZXd/RpfHZqJwKQd5klfMNLzFdyU8ELjO/pE8VIVK2/XGnVTKLRN2q?=
 =?us-ascii?Q?6OXSs6lYGzSWdz3Dun0de8wP2apUC8kEgvvLE+HyAkiOWZ+O+wqXdZ4gpf2b?=
 =?us-ascii?Q?TyAzkSqTWO0T/9McsXFblCj8quICKaNieCMjnKpNc5HI8DzRvoX3O5A9p9IK?=
 =?us-ascii?Q?Q3CUKNYg/cZlBqQf9OBe8lDdLqBexz86cigIX5fFNuegZyTXVv6LHqpPsqjy?=
 =?us-ascii?Q?a2fFyNqxxWvG12EcUP7xjqMGnNQV0mgzuj9O+ji55TOErV9VxU6G1UyIq4bP?=
 =?us-ascii?Q?YFBxzK3GCiWwAd+9qSDJM1lPhXiMLWGDWHpvxjN/W3vw+zWjV9Unr6SKkMrB?=
 =?us-ascii?Q?Btod2omSnfEEy6xO9OHdJ+henRTzusKFTukAq03UAwsqOTHQJAmK97ABO8Lt?=
 =?us-ascii?Q?1r8rTyCVeawHvdE53HDzF1Lu9ov0WMpkmFVHJJsy8rhi0q8o/yN53tTpwSqA?=
 =?us-ascii?Q?nl3BjjYwWiF37a+zIyxoRcXkznGeBopvAU/uSQ3G3TAkl2G2yCqsA9f0NuWL?=
 =?us-ascii?Q?lA921dPhoDmGa/mpW6ZXMWJ4pAXChXKmFdkZ0ROgMxmuePNUo+R4udqTmPxF?=
 =?us-ascii?Q?QzQ7oq2mDqS0rXEK0/GdL04XA2k75j265fStecgKrRtjjtU+sjKxxpBUUGd3?=
 =?us-ascii?Q?heGcCZp2ilIDVS2SVA1HK7nSG86ODdrbmfE+JalYT6RHMcWvib/ynTtXbUTM?=
 =?us-ascii?Q?5aDKLiD33g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: txdqnMzB4jVU7u04AlM8YdNQXhcD4p1HtmHMSHnLfZQtQyh5SCdRt5ixUPpVvoGjB7YSNhoXy5GD0ljVX49S/rZavCpZtXrTAb6xffUTFCbV5TMPy5lULlHPi8h2x39C7mEtEvOltDcCGFf+bDxFGFJlsuNB2PtdECgLxzs5bwordGI/DqxNFshl7Ky6SZNfbab4wIyXVpkYyXGtR7BgXstkVf+WD5SRbfmhZM9OFybwu/iSl+AW7gcEYYaNxQjaBdhZFtRQC0HghYutXuSoxvZtgz3DJlZ81i0S3SPkA1wRfcVPHeYp8nSJ/5AP83pZEtHDRVG7LZ3QklXTrofS7g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67520bc3-a3ce-4c5c-2b69-08de790a5576
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 09:50:42.3369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: utoR1b9t0Abd2qgpXPHsuks9dqJG8lh8T9lRVDK//AuLAJ/wC+d8eKcIcVQj/FDbcjp7bIFxT5ugepnS9sV/szG+UfqFVfonOO/GslkQ9t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sanjay
> Yadav
> Sent: Wednesday, 18 February, 2026 04:06 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Auld, Matthew <matthew.auld@intel.com>
> Subject: [PATCH] lib/intel_pat: Handle platforms without compressed PAT
> index
>=20
> Previously intel_get_pat_idx_uc_comp() would silently return zero on
> platforms where no compressed PAT index exists (e.g. CRI), since uc_comp =
was
> zero-initialized by default. This could lead to incorrect behavior when c=
allers
> assume the returned index is valid.
>=20
> Fix this by:
> - Adding XE_PAT_IDX_INVALID sentinel to detect unsupported platforms
> - Initializing uc_comp to XE_PAT_IDX_INVALID in intel_get_pat_idx();
>   only platforms with CCS (graphics_ver 20/30) override it to a valid
>   index
> - Adding igt_assert_f() in intel_get_pat_idx_uc_comp() to fail with
>   a clear error instead of returning an invalid index
>=20
> Also update the bo-comp-disable-bind test to distinguish between "CCS is
> disabled" and "CCS does not exist" using HAS_FLATCCS(). On platforms
> without CCS, the compressed PAT bind check is skipped since there is no v=
alid
> compressed PAT index to test with.
>=20
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>  lib/intel_pat.c      |  5 +++++
>  lib/intel_pat.h      |  1 +
>  tests/intel/xe_pat.c | 30 ++++++++++++++++++++++--------
>  3 files changed, 28 insertions(+), 8 deletions(-)
>=20
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c index 9815efc18..d30bee453
> 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -98,6 +98,8 @@ static void intel_get_pat_idx(int fd, struct
> intel_pat_cache *pat)  {
>  	uint16_t dev_id =3D intel_get_drm_devid(fd);
>=20
> +	pat->uc_comp =3D XE_PAT_IDX_INVALID;
> +
>  	if (intel_graphics_ver(dev_id) =3D=3D IP_VER(35, 11)) {
>  		pat->uc =3D 3;
>  		pat->wb =3D 2;
> @@ -155,8 +157,11 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
>  	uint16_t dev_id =3D intel_get_drm_devid(fd);
>=20
>  	igt_assert(intel_gen(dev_id) >=3D 20);
> +	igt_assert(HAS_FLATCCS(dev_id));
>=20
>  	intel_get_pat_idx(fd, &pat);
> +	igt_assert_f(pat.uc_comp !=3D XE_PAT_IDX_INVALID,
> +		     "No compressed PAT index available on this platform\n");
>  	return pat.uc_comp;
>  }
>=20
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h index e9ade2e2e..e5dd8a0af
> 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -10,6 +10,7 @@
>  #include <stdint.h>
>=20
>  #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or bet=
ter
> */
> +#define XE_PAT_IDX_INVALID ((uint8_t)-2) /* no such PAT index on this
> +platform */
>  #define XE_PAT_MAX_ENTRIES 32
>=20
>  struct xe_pat_entry {
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
> 21547c84e..052b7b699 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -844,15 +844,18 @@ static bool has_no_compression_hint(int fd)
>   * Test category: functionality test
>   * Description: Validates that binding a BO created with
>   * the NO_COMPRESSION flag using a compressed PAT index fails
> - * with -EINVAL on Xe2+ platforms.
> + * with -EINVAL on Xe2+ platforms. On platforms where CCS
> + * does not exist, the test verifies uncompressed access works.
>   */
>=20
>  static void bo_comp_disable_bind(int fd)  {
>  	size_t size =3D xe_get_default_alignment(fd);
> -	uint8_t comp_pat_index, uncomp_pat_index;
> -	bool supported;
> +	uint16_t dev_id =3D intel_get_drm_devid(fd);
> +	bool has_flatccs =3D HAS_FLATCCS(dev_id);
> +	uint8_t uncomp_pat_index;
>  	uint32_t vm, bo;
> +	bool supported;
>  	int ret;
>=20
>  	supported =3D has_no_compression_hint(fd); @@ -868,14 +871,25
> @@ static void bo_comp_disable_bind(int fd)
>  	igt_assert_eq(ret, 0);
>  	vm =3D xe_vm_create(fd, 0, 0);
>=20
> -	comp_pat_index =3D intel_get_pat_idx_uc_comp(fd);
>  	uncomp_pat_index =3D intel_get_pat_idx_uc(fd);
>=20
> -	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
> -				   size, 0, 0, NULL, 0,
> -				   0, comp_pat_index, 0),
> -		      -EINVAL);
> +	/*
> +	 * On platforms with CCS, binding a NO_COMPRESSION BO with a
> +	 * compressed PAT index must fail. On platforms without CCS,
> +	 * there is no valid compressed PAT index, so skip this check.
> +	 */
> +	if (has_flatccs) {
> +		uint8_t comp_pat_index =3D intel_get_pat_idx_uc_comp(fd);
> +
> +		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
> +					   size, 0, 0, NULL, 0,
> +					   0, comp_pat_index, 0),
> +			      -EINVAL);
> +	} else {
> +		igt_debug("Platform has no CCS, skipping compressed PAT
> bind check\n");
> +	}
Does this test needs to be skipped here? If yes you need to use igt_skip
And handle the resource cleanup
>=20
> +	/* Uncompressed bind must always succeed */
>  	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
>  				   size, 0, 0, NULL, 0,
>  				   0, uncomp_pat_index, 0),
> --
> 2.52.0

