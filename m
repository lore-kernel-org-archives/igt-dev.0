Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0939EC54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 09:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107C910ED97;
	Wed, 20 Mar 2024 09:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqbWA22F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6994110ED97
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 09:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710925347; x=1742461347;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M0AIl1WafdXF0I02GjyVUeFpsDbl4WzeLXOCEBN2d7U=;
 b=lqbWA22FdqizD/ygrxf5PP6YTS/gXSHHDyINzXbnsL+anTCCDEkf300v
 iOObAG8vU7gD2yTL4uDinCk7Z2oDjYpVQ4MYN6VApCdDVICdYuTO8lW03
 Re6sNzDYvFrOeNm91sQsmxWExonHiBeIQ0VlTse3jegl0juDUk2BF7DgZ
 lyC6Ag8LjXnKciZqJoG7xa+97AcT90/EFV7mOn0B5bHDj1R803W4bzeER
 1UNkSJlJ/xjbsMajwILRWPVIfrcTrH0enFTWqh2qpfAVMxIuEnlLDoxEH
 azEMNLiz1km8rWCj1KTv3w8NEz8ZHcfCo/yLyLLC0CYIiR9mWljQu9m5a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6446175"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="6446175"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 02:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="14739361"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 02:02:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 02:02:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 02:02:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 02:02:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXuIsMwbnaIBT9Sc8ren5n623j8QTzfXj6PYFyCxc+5Ckj06Swpc9cNgr0DHGf9HxWSanoZW9z48RU8/T53RBHv/4K5tkZLlYrbH+YZHm+4xJMssf7a2wlaOYVeIBCBmL5a4HiKBthfO4LPhOlZrZgp4YfFxOt6cpjT0HFfytk0ff2JYyoY1Nh9TMzWoG8uBLUUOrXOYlJ2z+0l3lHAWKbbAPm5FY0DIgvpFAfGPqa48YQhi3XXPmsNubD6Mc086X72IDlubDjZ8fhdgjWQ1HsfqCLb6YxmF+Jl3lh1OxdImQMw46PDm4dhv1uvsufnjH/Ov4itT88yBGkDkHeEf+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNve4ocXedFh/r1bGoZ0OF5FfuKsZMVlsyrGdBcoUII=;
 b=MEd3yodbKLwvfRpp9j+0HNTDnQ3sdxZ6UCNL3F+7LX+AOcsa89qCpemHwUoL24BW1tbMc4UL3LAxbHseTWcj75D+Z9VnrxjPt/4SmB62SgFoOYiv75LyztOa82ksmAUHlHpE+dd4L8DHkctG7Uij21KTJqonSfCkwW9O+UFtliJLD915KWRhZdsQcv96nnyHM8i6IFCvtL3Mkr7iEj7QQaTnHwFhMlvAa5ZuYvA2kvLXY10FoSfTBleV1thwfRX8fZRrVGDRVVmew8i13aulP3WbLL4HfTBfO0at8ufXAndJzLuZME7EK56lODAiYByiRY73CSNLdapFqnfzekVhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by MN0PR11MB6230.namprd11.prod.outlook.com (2603:10b6:208:3c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 09:02:24 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 09:02:24 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid va test
Thread-Topic: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid va
 test
Thread-Index: AQHadSmoHlkSx81n4kG8VVbR5qbN8LFAYBXA
Date: Wed, 20 Mar 2024 09:02:24 +0000
Message-ID: <MW3PR11MB4748FC704113B52F57EB4D44AE332@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240313093249.2257541-1-priyanka.dandamudi@intel.com>
 <20240313093249.2257541-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20240313093249.2257541-3-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|MN0PR11MB6230:EE_
x-ms-office365-filtering-correlation-id: e2500a21-cf6b-4a40-5c5f-08dc48bc7583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pNj8mvqoOYBUweeflKhMGR+5cmz0Z9WdvVzsIu3lfOkKf89hIGvbRVlGuGMLxL+FP440kzTqq1xHkKHOTxfJahPwul8CsxDDmHahwdwF69kkFRA8/7Y/laccgWntwZvSPqC0W5jTLo/WOx9P021xs+pNzYVtcJs6Z2Hb1AhVrxbs87i3lvT1Z/4nZ2QyTiz9wiV5CxnAPszAVcFYI23AhzQH13Z+tINjmElizrphMuQDDl8qGSLs3EWYMGMHXIlovVIYSVDGklyqL8GWR2+LOTNEn9GjbFq40LQoh5pwldd/38AvXqymdDjDDNCCgRmQ0+yKpjAYI7xW42G5x1lQRoceSSbZGIiW8ZJStqfg0ysyVCvb5ESPMDddBcdp4Yb/l7YH1koU83ZhGHAYWeqRJnxZqfmTUVokRmNvEW0WbTer2QkL3YI95Fozidpb/or79TAIsezY7umxC80C71oXk2rphlt1zO1evL6i9knrztROA3vDBZfKihLf9fIPc8wgzN3r0addfkV1Y0sIHRCT8uIz4a3TEzYG8+Q3bjFTgwZdfcigJLDrcx00SED7cUnu7vab9QboZWYnDrlPNmmVU9W7rUIURW+JwxhZMV8VOHpqW9kaJZlTjp5Svo7PgKiJG/cCFbEyFuMJ//tJ6airzPtz0sAvQFBBPKIvxTKawlqKGQyhrs54cy14HBmUksgL/ePUTxhy5esPkuRmRLn3aA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cCQttlX9BQJwP30V27eB21W28ziV+w2GEj4Vuh1WgzXl/3G+JlFWWp3BtnQV?=
 =?us-ascii?Q?rjOubaWIe03hMooe+k8eYS5NKDNcDqAg+LammJgA/MH10Qx+BARxLjl7yimb?=
 =?us-ascii?Q?JrrkZ3x8CP6UvG/5NHl1yjW2aLhw8BxT9VEn7gXkJUB82V/wZvwxKz7hWde0?=
 =?us-ascii?Q?D0n1RUTNqzHQypDIyQf94jqBOugMhB8+NZUcOvmXXWst3LSIstGwYLK9dWQF?=
 =?us-ascii?Q?g+sKA0Nfm3XDX9M7cLxlGGFpPz7djnsk4SGbr2bBzAH9YX2DZ8Tl+kb9SxWM?=
 =?us-ascii?Q?luBBSrkmp7L+LW3cvIx4wuhAllVmFDzy7mGKHNlG94FhHUUsxe4RjMqfA8O0?=
 =?us-ascii?Q?7j9u6I5ouzVzw9hKBYiMILlSXLdVZn6WDFC7fg5PqokJGJabGzx56jdhdNLm?=
 =?us-ascii?Q?DyDfGu2X9oH8bIq2IuaiDFfck0p7yMq6X5oP6/ixdBnnZ3F0c+CYgo0s1FKE?=
 =?us-ascii?Q?i1A6sdi+NiVx8JFzjEZljQ53xadhuR9DBKMXrzfgD4nbMHf63xSugAGAeFHO?=
 =?us-ascii?Q?lSLWRbKCNeGcHTtM7M5AxJqpG2XC9cwAID/B9R76u59WEjmTRpzkqNSvMLef?=
 =?us-ascii?Q?2yyXCXlbm9+2D+n6ZSOdqLop/926K+bry0+3Y7lTEchV8KLK95n885p8oUew?=
 =?us-ascii?Q?XvpkuQqGgpuvOl30NJaYE7Y/XnQyIqMMJMUq7XSP5NFxmaW8ktAMSHIaWW/m?=
 =?us-ascii?Q?nRbRqKabKydmS1lyh6JI9uFXoWO/BtETioGEPXDn+RK7oh+lq7IVAHOdXRUP?=
 =?us-ascii?Q?CE9PJEHRmRnWq14OlZMrl11JoWQBcvROxfSI71mgWcyyzvZ66zmZ00zTnuAG?=
 =?us-ascii?Q?lv6hLoj9Hg3/QMiVFOAjEFa3Wn+O4dVbby6wRGEkPblcLkuMrEfeCy94Gasb?=
 =?us-ascii?Q?sZd7k7g/0FJQpwydIz3+1ZNeYBfGMa8bAvW+ZEQwHVpzkqN7g8ZwEVffLuyX?=
 =?us-ascii?Q?p9jbVC8aQNXR85iHwJsnH5wk3LeCQi1r8ycuzEev88ju+0ABGTTW0FDxNGhc?=
 =?us-ascii?Q?7i3cGLf+OYE70SjMym1BURotCK0dTw4UgYLqewKE3MaP0wCanId7GbYV7Z7d?=
 =?us-ascii?Q?Pbg1Fa6otQc5lpHMtykE+S4tvGpgkWFcnhHjWxnQrI9OKDxn7vccKurVXLI+?=
 =?us-ascii?Q?T1md8E4km08L6jo9/MX6YUGYA9Idkg6MTyuS6JNupCJ2eNOlbkiY+aKl6B/y?=
 =?us-ascii?Q?+neZFd99VLC+DbCoOBgbiqws/g2Qogbp+T/5KXoNhuDy3N64sjjfbUamr3px?=
 =?us-ascii?Q?paKnuitBlWgABWIBb2DQRLoO2O7iZSqYRHhq3JjhcIb70Qo6B7duGQyoKbmH?=
 =?us-ascii?Q?cLknlIPr/5MVSvH8ckWCQfevS+etgoGc/9V0j881PfZlBecq9bMiujfBnZ/H?=
 =?us-ascii?Q?wt3nJQYsohBYJW81WjCPtcOPJoE8FD1oXqk6nFZ21RsIwsLcxDKt1LGpQGRk?=
 =?us-ascii?Q?QV9ofLeaJyh3JRebo9W6ajpxJi8G7JOCc3aEAOMNUTgmmVCPTWkSNNKumeOI?=
 =?us-ascii?Q?l/LrsSjKRTI3nklnL3cTu+KcNOHOJw6uz1X7g2kchscW8B+/U11KSr4JJ8q2?=
 =?us-ascii?Q?tm1ge/jUAzWOD6DB5/GR+ry3heSbCKeW92qxw4hH+74LcIGwbfqbVuDUOmpp?=
 =?us-ascii?Q?aA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2500a21-cf6b-4a40-5c5f-08dc48bc7583
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 09:02:24.2082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iumF43hUrd4sQnKXaTmHaSnhG5oEEcG+bMHeOWoZ3qHv+fCwhoc096SD3PRsvHKSzP451TDS56qp4pMtSKj/oCSx/EkoGjaiqRd/yhjglFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6230
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
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Wednesday, March 13, 2024 3:03 PM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; igt-dev@lists.freedesktop.org
> Subject: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid va te=
st
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Extend invalid va test by enabling scratch page without pagefault and che=
ck for
> success of userfence.
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> index 0914e221b..9701d32ad 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -32,12 +32,17 @@
>  #define PREFETCH	(0x1 << 5)
>  #define INVALID_FAULT	(0x1 << 6)
>  #define INVALID_VA	(0x1 << 7)
> +#define NOPAGEFAULT     (0x1 << 8)
>=20
>  /**
>   * SUBTEST: invalid-va
>   * Description: Access invalid va and check for EIO through user fence.
>   * Test category: functionality test
>   *
> + * SUBTEST: invalid-va-scratch-nopagefault
> + * Description: Access invalid va without pageafault with scratch page e=
nabled.
> + * Test category: functionality test
> + *
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] fault mode test only once
>   * Test category: functionality test
> @@ -120,8 +125,12 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>=20
>  	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
>=20
> -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> -			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	if (flags & NOPAGEFAULT)
> +		vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE
> |
> +				  DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
> 0);
> +	else
> +		vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE
> |
> +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> 0);
>  	bo_size =3D sizeof(*data) * n_execs;
>  	bo_size =3D xe_bb_size(fd, bo_size);
>=20
> @@ -386,6 +395,10 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			test_exec(fd, hwe, 1, 1, INVALID_VA);
>=20
> +	igt_subtest("invalid-va-scratch-nopagefault")
> +		xe_for_each_engine(fd, hwe)
> +			test_exec(fd, hwe, 1, 1, NOPAGEFAULT);
Add INVALID_VA flag to check scratch page functionality.

Thanks,
Rahul
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}
> --
> 2.25.1

