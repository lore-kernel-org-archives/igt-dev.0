Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4549DFC72C5
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 07:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF80B10E3D5;
	Mon, 23 Mar 2026 07:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzLnGQse";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCF610E0AD
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 07:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774250892; x=1805786892;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UElN8d1ExGwxVlYtwd4MIW1o0uQsirH0lQ8gkGp4Los=;
 b=bzLnGQse0vcRUHqX7X34ySDOGtD8RK1hylBAO97/CJMiXwxOGT9nwkso
 8SexWZfT9lrEJLyRxU/MD/X+1tJsfKlc0hpcuMsBo4WCEKp5aa9Jw4L/g
 hsAyZHGeNMzgI+6TuR8kpoDlOVEYpl+dRb5Cnral0cHHqIt5JkSL7xeWu
 omS8Q6CxC7kfqB0JNd3v3MNkRZUYcsalt7Iim4pVzFDpNBDMjrQO9kXL2
 F4wAY0xCOQi1CB2H2VOiYJR5Y0O0Kl9SIr5xl66L+MvOrkWz5Jc0DukCt
 CiG0MUoyS2XI5MCm5t60BhaKHTe2huIn0nNZJHNhQCbxy6NF8If3rr1oj A==;
X-CSE-ConnectionGUID: z6oMy2LvRBWIEfa9lm3Dyg==
X-CSE-MsgGUID: jmt84R2yQBGzXKu2kxEBaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="62800744"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="62800744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:28:11 -0700
X-CSE-ConnectionGUID: CpTAM7/vRxWXx9Y5HXLcSg==
X-CSE-MsgGUID: TD+F+LTCS1u6SbARAue2TA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:28:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:28:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 00:28:11 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:28:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOfbGABNl65LLNTfWuae3OGKmjEx+huGhGLYCnk81f67ZFP7rZNWbmxw9Q2NTFfXshAYR2swZYA1b8BMwisB0+msPN66KxYMy92LE4wmsMMudJRuvxVtqfRv8Njl2rIyi2zRbNmOw4MiEYuqTypwcCzaTrwQsO6H/2PyiP/4fVK+FUFIxUnk1wM1ytebi20TFP7Ymd2GKYZA9FbuPCEV9U224X4vsEAESocIYGIyq1EW1fw7Zh3TRsfbZxfrNDoxnz0mmgJixTMesKSk00wufez2KLvWMrre6WJunKSjzRfbRV3NyWn4WN14XWynLRxdVlzB/UpztWn+9gNFk16/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvOwFgNiIwSCQMNjsm49ue+r41E0meRfHRvTPCIjVoo=;
 b=O6fKpF4v4CFtA416VHaLvQx3fjOahGBBLN3oKdrghR50VUcEkG3Z3q2ygSnGH9RppDbcPI9d6c18+BBgk+t8avcaxK/QAfwfOJfr3keTcH/T6rfTQ9S76jQEl5eCiVB5S9Sv8OlF8cVeWGl5MVuxvUhdMqQN3cKxBo9IhbMxdMbHaop/mOQ7CcLvzqHvgWZ+Ml8rXgbMFDLj8vnSb2HeITzYgiqc9jTjxPHmjEejvfZJuUdQf+YTY3wCgQ5znahk4QCDFO/U4fYE50iLJjMSCzJe4+sli8DXD0BP18dgLwD8GiIaFXlSsuzWgNFZE54mMg3R+yX2OWQP52NDh7V2HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ0PR11MB8269.namprd11.prod.outlook.com (2603:10b6:a03:478::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 07:28:07 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 07:28:06 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH  i-g-t] tests/intel/xe_pat: Add negative subtest for PAT
 index
Thread-Topic: [PATCH i-g-t] tests/intel/xe_pat: Add negative subtest for PAT
 index
Thread-Index: AQHcuoTvPXaE1g9huUOfD0ic5vkT7bW7t/hA
Date: Mon, 23 Mar 2026 07:28:06 +0000
Message-ID: <CH3PR11MB8434695944F53F10AF03D4E78D4BA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260323052130.1627555-1-nakshtra.goyal@intel.com>
 <20260323052130.1627555-2-nakshtra.goyal@intel.com>
In-Reply-To: <20260323052130.1627555-2-nakshtra.goyal@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ0PR11MB8269:EE_
x-ms-office365-filtering-correlation-id: 8e5a4f8d-b2dc-46b1-9fe1-08de88adba3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700021|7053199007|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 6UJeryOj2/kGbMEu8QBOGsBOqFYoeUay/fLwilgN9pSaw3yQhBDOCEEDnAj+69b5Nf77Fv2WHM3SLuNZfdVKO05m1bJ2v4Zt/yqHZfeEs/8tt/x5htTnQNjrM7V2UsPDl/FSpBiZp3gLgPyqj5f8dNyw77HCX/lzfNhYKczFAm+qEkREJmRjNUF6bw+dYYjQp1UiC8EtfL88GxpZiAVDh82sBX9c4ZNd+5KkkW/YLNXXER2NRrrL/ITFRLAhPjEpSn8+j4jX0rJHi16RVhNfgnLluCN3a4Bt3e/9+VhjJn++Pwl1W2XkHkmez/xj5/XUt3KerSXfKM149BwRJPlFgGkGU4ybfmvCzZ2IhSVc4KcXKyvdp178ZGzDaInoy6rG+ZkXPimWXniM9wJSpiXz6xh/tLvpeXzUTbor3B21L4BzfDXk9iPHttb0PWfODbnPCphAe9MS0Oawp7jwMseQtIdDF1PXeVlPNgslSyN3V3sGL00/1Yjo/c/d3b+jM9F1T6DL2BmlxdPQzydIpTiH0CMwH/MLI88YS3+3lLAgNOdjcorad7XPZAQp/DfexTfPGUArR4Bh478fWX+9I4uCcRRWypyi+m9/hMCZHE1aRKhCJV35UCSJMe3llrAw7j0CHLPw/aPdLyVz5+6FUxX+6WQEZ/qLpuR4fjzz1SyqA6P34OFeYCAIkr6N2+0btsZsKYK75NUb3rI5kEWA4AtefGr2FVxX4N3pfKQUhUSSAyk632DsAqqvGxV885SaiKmD/6ZECGIYLH75ojKqMhUsOvsO8Dsssi1a3/mVNha1szw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700021)(7053199007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+uDsiaNKvBDDwQb/iK7OyEo0sglk2rcj5j07m8fYtzMdCICRNDnLjFLCzWKq?=
 =?us-ascii?Q?+PTF0NuTJq/3YhwcuGdVryEa5/DIFmi+4l3krGC1D2+uWAKcbZTHCMyzENVU?=
 =?us-ascii?Q?a2jaKKBLAo9Y0c2tobdo5DmEYuoWyX+6XZXDVmHf8A91HHPO5qC5Fv6E/G/l?=
 =?us-ascii?Q?W898G14L8hngMo/acbCPHQyS0VlQMfRiHKg69bYOmXTV7oD56/63qDen+oQI?=
 =?us-ascii?Q?4+XEhwMRGRtvklf6iMm5OfDEhWYyQVkrF8C/WD/Ns7cFFOCnP+s3Zuq16XjL?=
 =?us-ascii?Q?VqTHm3h/85IcuwzK/hhzEhR7FNvW6NoJLBntZmeVRkt03O0PzLJhPQQoRtjS?=
 =?us-ascii?Q?ayKeBUxiiMc6dYGaBHSxcuODNlk3kwx0mo/u6un6kajpS8pSGfdkSpRo85je?=
 =?us-ascii?Q?9cAfx0tcDALTGUJSg0WZ4qQM6BnY4h9aT5U0X/dq/ewwk8/teTwVhQIDy1ks?=
 =?us-ascii?Q?AUiOHC3bG9udN6bc2FQIz5qAO7eeypQMWP5bfxOo6Px+zu3USsICk4fxRPxW?=
 =?us-ascii?Q?L318FPlvzauuWpvxYwlFXUs9w//P+1h7hiaCVosMUd2Czxnf08lTeFLpTsHA?=
 =?us-ascii?Q?dYaiD0q2W3MUrXQGyC8PH4D1SKm+r1nw3wzW0lDF66IPvyO1lNmywBBxigRz?=
 =?us-ascii?Q?fBeKi38CYHA9XO1kTxP73xRNrVlsw1t9n/rQnnIJi9Cg5qst0pD9pxyg9eYI?=
 =?us-ascii?Q?ZBO/0e72uwNFwVXEhosrOA5D1d8FZCNF60bj1YAlgrRhSlC2kZD30aawxZzQ?=
 =?us-ascii?Q?X5AV38WtFTFRDGo9QR6GqRUa4LZhdOR5FTrnVNku9IB3Sq9zWEUM+XZhvlZa?=
 =?us-ascii?Q?coIHX4CbBJWnAD1qjbNUU7tyEO/YLewipxQ8BkVw2ezz3gVA+xwdvc7akpWG?=
 =?us-ascii?Q?4NsIDJQQT/uA+0gmno92Cggot+5BY6wUeHbHukpxUDl13qHkv+TOdMuNpXCw?=
 =?us-ascii?Q?4rW82wLpBarBEsr+WwS5f/4hvK3q56Paj55vH9vjvch4/aT2Zj8zxGlwrrj1?=
 =?us-ascii?Q?F8CfUMncs1Qq4FKICsc2pjMVjsB6mgxbtitif81Yxkd96mN1DXpUFoF45kI2?=
 =?us-ascii?Q?mq0xKypLNLMwieTHjD/bWwN1yQAip4bXTt28I0cROmbMjsU3YvIlAHO2v79Z?=
 =?us-ascii?Q?otpQM7QQYweG4+uP78wfW5w/e6gIsgCSa/yIXnDHOmWMHTM9jF86NgefNzQp?=
 =?us-ascii?Q?GDX9Hkrpcku+eoSDNph/GP2RwSRs2IC3iGdW3VOIX5U6oqRGh5RgrQHE5626?=
 =?us-ascii?Q?RGoqtsom6CjssGn8SLx0TgcNZl7JRYIaK8AL7/Ax24UD2ub5oam9fpcU4+h4?=
 =?us-ascii?Q?JzeXhn3ggmnb9UHFh8pLwpNrrNeJ/nmMGwU6XNjNA7lgY4bpz23DHOpjos4T?=
 =?us-ascii?Q?7Ki+G9nc2Y8S+3Cfm3D/2X3Zzse87MzhAO/acUmBi9wAss59iz/ZhOA+gZ7F?=
 =?us-ascii?Q?dvmKaSBEndilLYsyK7pao+pbRGMgjMgLHLXnwFiZSmURxqaGfIkmO+qx5/Bt?=
 =?us-ascii?Q?BH4K2znUA91hsiK7SGubsbJ5ml/w2QGDT0+qLYXeCkajBFZ8TP6cSt3NFY5J?=
 =?us-ascii?Q?AIRlYoRsr/FAuwIRQ3FiS8yHe+qS4MDJWQB7WesrcdZOIE0/Fn/Vyuat0lal?=
 =?us-ascii?Q?wVTxYNoBJi99w0IyIdgaQF0XKQlcrUA8RBQfjc5IeUJuEc95kRiRRhC1GDYA?=
 =?us-ascii?Q?1e5Qqo0QVEYoTRQYNA695yQXX2RQ5pp3nfoakKOX14Ma3AS20wNsl0YV7dCe?=
 =?us-ascii?Q?2eHv7JmDAEkV2aihAC9PTni7QnEuQMvzeFRcq8TYONB2WKIuxfDmNch7xDNW?=
x-ms-exchange-antispam-messagedata-1: IADHPL0xT8U80UKtys4G/+qNfSXW2/aQNRs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YK6qkg2Xl/IuQptBcy19LalJyCyQq52c2Aay+FcajHcmWGaJWk6AunncJ4wZoQpy9lPMpIC4clunFGK3AsG1LWApoDPvA4Vcrt9F8Fxcn2QI+P7yuqUXPww5+xx2qLxWVhj69MSF//TrxdCQ99PlFNxsF6vh3WoNpj9EqfDNab/lBehVht2aPKxm4M+j7g5oAC8lGbb7bDcvif5ejCaC+cP5S5O+AeNFGo7lE+nTBWQ7ca08YqJiWfVtp7jMAPt0aaiJMWqWjc66zx1/Skr4FeSptCarCiHL53Ck+0/wcVajCePugfCGISuLA2E56M4zQpFm14nOxImuCIak1MeQSg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5a4f8d-b2dc-46b1-9fe1-08de88adba3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 07:28:06.8112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /I8j3q5n76BEktMnPsxu1memJDMMP6D8qj7clF+ORtVRzkPk1In+R+fdnhXGG6EmR9IC/Wal398sSI5IJ2v0Tk5dspaOfDyEUSzH0+icrhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8269
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
> From: Goyal, Nakshtra <nakshtra.goyal@intel.com>
> Sent: 23 March 2026 10:52 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_pat: Add negative subtest for PAT i=
ndex
>=20
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>=20
> Adding negative test to validate pat index restrictions, extending tests =
in
> userptr_coh_none and prime_export for  (XA + UC) and adding new svm test
> to validate for diff indexes ,  (XA + UC + 1WAY) will pass in all cases ,=
 (XA + UC)
> will fail with EINVAL
>=20
> v2: Adding validation checks directly inside subtest call instead
>     of different functions   (Priyanka)
>=20
> v3 : Correcting subject as per requirement and addressing nits (kamil)
>=20
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_pat.c | 67
> ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>=20
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
> e91b037a5..a550c7e6a 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -34,6 +34,11 @@
>  #define XE_COH_NONE          1
>  #define XE_COH_AT_LEAST_1WAY 2
>=20
> +/*
> + * PAT index 18: XA (eXclusive Access) + UC (Uncached).
> + */
> +#define XE_PAT_IDX_XA_UC     18
> +
>  static bool do_slow_check;
>  static char bus_addr[NAME_MAX];
>  static struct pci_device *pci_dev;
> @@ -82,6 +87,10 @@ static void userptr_coh_none(int fd)
>  				   size,
> DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
>  				   intel_get_pat_idx_wt(fd), 0),
>  		      -EINVAL);
> +	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data),
> 0x40000,
> +				   size,
> DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
> +				   XE_PAT_IDX_XA_UC, 0),
> +		      -EINVAL);
>=20
>  	munmap(data, size);
>  	xe_vm_destroy(fd, vm);
> @@ -755,6 +764,54 @@ static void pat_index_dw(struct xe_pat_param *p)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +/**
> + * SUBTEST: l2-flush-opt-svm-pat-restrict
> + * Test category: negative test
> + * Description: Validate that on L2 flush optimized platforms, SVM
> + *		(CPU_ADDR_MIRROR) mappings only accept pat_index 19
> + *		(XA+UC+1WAY) and reject all other pat indices with -EINVAL.
> + */
> +static void l2_flush_opt_svm_pat_restrict(int fd) {
> +	struct drm_xe_query_config *config =3D xe_config(fd);
> +	uint32_t vm;
> +	void *buffer;
> +	size_t alloc_size =3D xe_get_default_alignment(fd);
> +	struct xe_device *xe_dev =3D xe_device_get(fd);
> +	uint64_t svm_size;
> +	size_t size =3D xe_get_default_alignment(fd);
> +
> +	svm_size =3D 1ull << xe_dev->va_bits;
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	xe_vm_bind_lr_sync(fd, vm, 0, 0, 0, svm_size,
> +			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
> +	buffer =3D aligned_alloc(alloc_size, SZ_2M);
> +
> +	igt_require(config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> +
> DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR);
> +
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer),
> size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					intel_get_pat_idx_wb(fd), 0, 0), 0);
> +
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer),
> size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					intel_get_pat_idx_uc(fd), 0, 0), -
> EINVAL);
> +
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer),
> size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					intel_get_pat_idx_wt(fd), 0, 0), -
> EINVAL);
> +
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer),
> size,
> +					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					XE_PAT_IDX_XA_UC, 0, 0), -EINVAL);
> +
> +	free(buffer);
> +	xe_vm_unbind_lr_sync(fd, vm, 0, 0, svm_size);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: prime-self-import-coh
>   * Test category: functionality test
> @@ -890,6 +947,11 @@ static void prime_external_import_coh(void)
>  		      0);
>  	xe_vm_unbind_sync(fd2, vm, 0, 0x40000, size);
>=20
> +	igt_assert_eq(__xe_vm_bind(fd2, vm, 0, handle_import, 0, 0x40000,
> +				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL,
> 0, 0,
> +				   XE_PAT_IDX_XA_UC, 0),
> +		      -EINVAL);
> +
>  	xe_vm_destroy(fd2, vm);
>=20
>  	/*
> @@ -1771,6 +1833,11 @@ int igt_main_args("V", NULL, help_str,
> opt_handler, NULL)
>  		}
>  	}
>=20
> +	igt_subtest("l2-flush-opt-svm-pat-restrict") {
> +		igt_require(intel_graphics_ver(dev_id) =3D=3D IP_VER(35, 10));
> +		l2_flush_opt_svm_pat_restrict(fd);
> +	}
> +
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  	igt_fixture()
>  		drm_close_driver(fd);
>  }
> --
> 2.34.1

