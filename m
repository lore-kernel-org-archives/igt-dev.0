Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F02C282D3
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 09:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E7210E26A;
	Wed,  5 Mar 2025 09:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maSp9FOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545E810E26A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 09:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741166640; x=1772702640;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=glisKwBXHnWN0DsoIeLX8XNwiIWjX7+MLvM+tg+64t0=;
 b=maSp9FOC2cKeGF+1RHW01sip+mmMohoQeAc0uXdKaaCyyhVrMe4WG5dQ
 3Lom1Dq5No1i5t9kHyFLkvvrveieZILSM63YNnA+BcgfF1Zc+kPeE2xUI
 Fsp2N9SULHx9dWULUbuWKjSFDmyRrYXN242qqUJY6n8jjzpXS3riixVYH
 O/HrO6etlkCtWO7qBaTSBWbKEHWy0zCQB94aXyRGXu+JYsyPzIHGfmFFp
 Jv4Q3vrgXe5DlGweWPC+BLewJD1oBuZ4QtyKrWoZfOb5fnTPpCjk29NGK
 dSUYndsjb5JEu5FmVEVQvDRfT5vVA4Px3wckdRY+D2Zjlu2mONYAfLKWS g==;
X-CSE-ConnectionGUID: vD7WRN69QayKqA+vDGzCfg==
X-CSE-MsgGUID: hr3sAiSvQbqm8QXC2Jha/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42008630"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="42008630"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:23:59 -0800
X-CSE-ConnectionGUID: Ueybk7aUQCuLGwhVuGdngQ==
X-CSE-MsgGUID: WUAhg5BKS5KveK+appb35A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="123233442"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:23:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 01:23:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 01:23:58 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 01:23:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dp5ajW/pDqPvJMr3uRYdkwKIOeF2qCgd5SvnOZ81gA+CEjTikgMMtfc1VID2EKwxyWSbf7bzII5FBYn8GdYXlVk8HJTaaXxhmOhAkI1JxLyr9MAZcBBzB0uh3F185xjK7GCAlkcIzeUWdToR/zWY7d26w1Zbq3KWD7IFM7+MbDEwq0oZB+zexFGhFPqakYe4rc5OuIbYFUAcrfmh53LxI1wFXZDzYitHdmuKNiRFgIy81H3bVju9NSY/bEPKHOzhK+t8a2Mcb8oDwMyVnFqYYm9AhkG5Azp4w1uU6tLLlCDO8QSTYx7OM4Mo+ZvBbLonM7+fsy4Dju+PwGLiuim/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mckcX5ctaqxTiklnlAYVtg16cLqVgQ4ooMG7gUMZeRA=;
 b=e2gSlJ0u1uPDr/ykPULpge0yOnW5ReCEkRJ2xYMDLmUAY/Ibm0Q/BmFNMXHZ/uzCUD47YJmaE9lbAvSNzgL6T3T+WaPEOCc1qlV1I8cf5DgAZVjS6GN0t9DbSw0jRjRPmjIsbTIjvyraaw1Gn+ndZWgAf40cVRJEqAZal/pBAxhmtKFf8v4/rlWTtP0uDTrfKBDwKOiGdc0mQOJ5d3d9IAfRgNT3ekCauFBt4JhavKZuzgsoA1x5zFLZFJWlxJPoz2aOMXZ0TvrP08W+lBEvigQPyWLfOwbrs+0l+ONf/Xdb/mXz+Kc+8//ooNvliN8F+kmIsz5u0qvb1tGquSBGww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.16; Wed, 5 Mar 2025 09:23:56 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 09:23:55 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v3 2/2] tests/intel/xe_eudebug: Add subtests for
 eudebug/SR-IOV exclusion
Thread-Topic: [PATCH i-g-t v3 2/2] tests/intel/xe_eudebug: Add subtests for
 eudebug/SR-IOV exclusion
Thread-Index: AQHbjSMeUX/jrgj7m0Cy3mem8pJPybNkRbkQ
Date: Wed, 5 Mar 2025 09:23:55 +0000
Message-ID: <DS0PR11MB7264C66EFC3C0935835FC954D9CB2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250304163227.49986-1-christoph.manszewski@intel.com>
 <20250304163227.49986-3-christoph.manszewski@intel.com>
In-Reply-To: <20250304163227.49986-3-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SJ0PR11MB4976:EE_
x-ms-office365-filtering-correlation-id: db2dfd98-20e8-40fc-8abd-08dd5bc77401
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?ekRWgtDHaoOLqwMnZN4lNTMtihXPwk3DoSmqrp9t916dom4cTAlzmBPN42?=
 =?iso-8859-2?Q?H9XjJLaV3gLKWcDpCnfMJVx6t+7j3Dzz2CDyX5GwerZjqzoUg32/kc6JvZ?=
 =?iso-8859-2?Q?KhjvULQ+GnCPkfrMcrLWpI/hxrvk5xLzN6/AM+2zWoGqAh4GfZ9KqjBQd9?=
 =?iso-8859-2?Q?Ok/+RsdyBdyQsImAUoHndpL0mh83tUPzd8MtXTRQBBbfiPTZCWO/ZERlIA?=
 =?iso-8859-2?Q?ZeHvLIk6ZXAZIv4qgYYDrqSQbW404VqOtyl0SxaT2dMj9VsKJUsu9NBqa+?=
 =?iso-8859-2?Q?WealcE7u0j7OtN8FLb3SiD9ayLmcR8M/fEFBnQCaEjFm81HdfHgQjb90JF?=
 =?iso-8859-2?Q?888cZGNnK8rCAUIXQXQi+ViWM1d7PxuEpMhFzhcJn1J1yAYbm3S1YlZyuA?=
 =?iso-8859-2?Q?4d6FbaV+3sfgewp3RDLwQK32BmDNykGcBjVxGgezgQmBGhocLC+MrpnY0Z?=
 =?iso-8859-2?Q?zIkZXIodYZOJp5WFxFALW28aNKY+0zF1jlLAguybDXbE23LXe3H3ol/dna?=
 =?iso-8859-2?Q?RMmxHZpw1UgJ/6GMFQ6ztpmGFtf/72SkOJCsSvMIB20Q8TRHG02edE+gkT?=
 =?iso-8859-2?Q?8nDgggHJNnlJ0ghGKpQrdA1WCdrUSRn9Q3II0FQTU+moGg+nriW9c2V2wU?=
 =?iso-8859-2?Q?rgsQNIeF/doXCANh/cLTGq1I5dNLLVBegiJh510LLSMoiY02sDzRWmVGkL?=
 =?iso-8859-2?Q?HAhnN62sy0GBZQ3Vhd/6dpTTh3ao8KAn/5cV2xK8dKo3rMFpizfHfoG5ry?=
 =?iso-8859-2?Q?CDM2dHzu0YLJSDJ0MqMk6gSAB5D4kX4rX6dbZuH7BaK9g0vaeBT/xjs0Lu?=
 =?iso-8859-2?Q?wNfHtepEfr6kgWjoozPh0fPwPnVNrZeUKryGMh15O8+Z1Mqxaf8WudnQ01?=
 =?iso-8859-2?Q?El3YRl4Cuu1ODYEAsGbzfot88L+DGPbL9JxHk0O6uzxvbNf54LXjj7E49q?=
 =?iso-8859-2?Q?+2dGR982YJUeu/XLj34OBwLznUTjw9TQlu0opejjPiUCIu31fdMzFs25S/?=
 =?iso-8859-2?Q?la64iSYWHhR/xyRKdrF5beHdbOn6ujDqpFMB4/LdwhaPjbFhC86lzAuRgk?=
 =?iso-8859-2?Q?I2OByNNumqiGrILL0CoOx9m+42eWQbOK9jeVP29nTe614MCrkhdl2B9OWz?=
 =?iso-8859-2?Q?jtub53Wj7ZBlPuaTD0Z+hxA1UPOdp8r36/ZMa2ZmeeWT0C0vJUVIUBPeXc?=
 =?iso-8859-2?Q?CtV4RB9mdIU4dqR2d1hYi9dg42Jw+HscK+pgP8Qg3yZet/eHGeARxpXKGk?=
 =?iso-8859-2?Q?dpNsiKrOOunZAyQfnnvKd7G2tO8fUTbfvH161JmB34FwgJzPlbXpa0CKDN?=
 =?iso-8859-2?Q?Hl9xbfZJebsqdFiED0f3d/HBWIOdtgUIdbjfDjcbWwgJKKq5iLFQss45Bi?=
 =?iso-8859-2?Q?GPNpA9a9xjyFfjzkZFbaKhS4xvuGLBzdFb5hyHw2g/Vk6kAAEAW1NT9Z+R?=
 =?iso-8859-2?Q?NWX+Kf1HrEqHBhg3HMu7YUw+1LzB/9ZHIiP0HW6aAwy4GK6GVUBSIapFS7?=
 =?iso-8859-2?Q?P5WV0vQJTvSZOJ6rsHLWY4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?hmNKC21dqqhfXkErJvBVQhTqUypTI1PiOtFvOagLZk7749sek21Tt4rJEY?=
 =?iso-8859-2?Q?gIGk4rDnDCA2tUPzuNtnMa0WcqY4o0hye1D1w8w8hF6G7bda5eYagHICQy?=
 =?iso-8859-2?Q?19X/vFjGXnHh7nDvPnJGS2a+DbRxz5L7O6eEByEm8aW3h6O4x4sGfzb9qs?=
 =?iso-8859-2?Q?Oo28Kjlvd+d/X/48qJ6GBKu1VQAQtf8z9Qjcx0uvsQyBp+sGZS9J2f/lPl?=
 =?iso-8859-2?Q?MgIkQGGt4ic2KMh9Ydsb/ZFcfg2N74FFLTB6o34EYqbWnJ3ZoMQMWtDNo6?=
 =?iso-8859-2?Q?x2q0NVFSEcQi+byAjue17jb4jJRYaRREIkZ5dBERKhecIiew5LsY5wJVF2?=
 =?iso-8859-2?Q?PD/ssoUo3dEfMK4PRM6z+l0ejCPj1tNFxX9KLqaVhyWjcXqDMwcD4L2Lvh?=
 =?iso-8859-2?Q?EvGtuF4LQ+Nu+QVG3h1rHvSnZEgU8sLpzsAnAlru7DpGqkTeRzpiiY1CoV?=
 =?iso-8859-2?Q?3l5dHH9/L77+1BFIBdDQWA48HWOrI3O/xri/16yXdqjLZOg7YDRcCLA1O6?=
 =?iso-8859-2?Q?lq/fa3LAzgLZXr1xTPoWshXwYcTwnCrcHbkQYL8g8pQIaMuF9IvOznahlr?=
 =?iso-8859-2?Q?Xpmr4ZKJohEfLAD57bYza/J0RmOCAh6DS1mW5g/tZprjBxaXQHv+EVpZ4b?=
 =?iso-8859-2?Q?Cm9A9M3joEVMIvC1B1bcZj6qW+abYnV/a1KEZduAI2Nu6LLPY12F5PoQJ7?=
 =?iso-8859-2?Q?D/5xqltBrtkXUwF3WJTPDF3kmWOudsEH2V6XtbPGJ12byrxaVOx7UUKiPB?=
 =?iso-8859-2?Q?Z/OXHpXrynaMLak9Nnj+vnwaNxPHjQaF17UfxLe9Z33q4wL8OmjcbllWoO?=
 =?iso-8859-2?Q?jKL5ru7lJJG2pOnraGoMlpvW+1UBPHh6nCFcZ3aswg0Srlqi90U+If9sxw?=
 =?iso-8859-2?Q?OKP4gwlcNTQd616BiHS1CB/8Yh0BjAAo1DAQyMr9p654H9OFsd/JV7oM+U?=
 =?iso-8859-2?Q?0/VOwswZfjOTpCMx8Mw1iD75Zpgf5B50xMRYFAqShXhzwJQaWUlT3/KVrx?=
 =?iso-8859-2?Q?1INhDkSJls9qV659JGG5ZDvn4d1KkDKB1yNR/T3t/hwfxaEbErjGv6tJrz?=
 =?iso-8859-2?Q?dMmZC3HH2leJm583yVVh4m9dkS9fa92pB0lcFV9USBFO5ibAPG/L8GVybS?=
 =?iso-8859-2?Q?U8nmOpg1KCopY95mhixxOJ9yhlko4rCXz+alS6GzJem2KkOnaVTLAH1dmC?=
 =?iso-8859-2?Q?RB6pcjhZHai85lYoCluS6uDQD6LUOS6OeFhLM5EXkGw6c92X6rPn6zGTpZ?=
 =?iso-8859-2?Q?xZjmJO8FFEpsJMGLI7hW55kboHaz1VqQzDREVBYR/sNpzHWWHCahhHXsO9?=
 =?iso-8859-2?Q?1u1zqxI86X2JcahNDJWQZryXAaCto7xzFiRrOG9PNDc13HLJn/3iWMOync?=
 =?iso-8859-2?Q?V/HbEcdQ9CYko9v8+sMOOY/2SVQmTgmzOBaz9JHCQtKqyVdGuPqZf8rFwN?=
 =?iso-8859-2?Q?1MTdaKZ4sYK2BYPTNY4JggQd+yqxBGCTZ+SAseFUhLrXib+PB3watj4g83?=
 =?iso-8859-2?Q?jyD7DLt3CuqYhkv6PmvKl9B0RWdQQRJMAMcWVH7EOeAzQwUq7vThJvtJGy?=
 =?iso-8859-2?Q?qvMZzqHX5AmWaNs7AvdePE8gSgjp7/zxzDxENrOoZuaFX4XbTB18HF9BR6?=
 =?iso-8859-2?Q?y31FGeD601gQckzG3E13cozTT7FamIPUFSWTqfIK6oMcH5CDZ2iP3jpQ?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2dfd98-20e8-40fc-8abd-08dd5bc77401
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 09:23:55.9095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZxlqykEZ1S7m7rlKL4H0VElcXA0ecU5yN5DxTyHESEd3lHw4j6XUwZ+f6vCVw5GOIRDuw7C61FDpZ8MWXrbuQdB1aOwyycPhz1FeligngIsKxLItUQpplCqo1xV+X70E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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

LGTM,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, March 4, 2025 5:32 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>;
> Grzegorzek, Dominik <dominik.grzegorzek@intel.com>; Marcin Bernatowicz
> <marcin.bernatowicz@linux.intel.com>; Mika Kuoppala
> <mika.kuoppala@linux.intel.com>; Laguna, Lukasz
> <lukasz.laguna@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Manszewski, Christoph
> <christoph.manszewski@intel.com>
> Subject: [PATCH i-g-t v3 2/2] tests/intel/xe_eudebug: Add subtests for
> eudebug/SR-IOV exclusion
>=20
> Eudebug is not supported in PF mode with VFs enabled and in VF mode.
> Provide subtests to ensure that:
>   1. enabling eudebug is not permitted in PF mode with VFs enabled
>   2. eudebug sysfs toggle is not available in VF mode
>   3. enabling VFs is not permitted when eudebug is enabled
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug_sriov.c | 148
> +++++++++++++++++++++++++++++++++
>  tests/meson.build              |   1 +
>  2 files changed, 149 insertions(+)
>  create mode 100644 tests/intel/xe_eudebug_sriov.c
>=20
> diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_srio=
v.c
> new file mode 100644
> index 000000000..eb13981bc
> --- /dev/null
> +++ b/tests/intel/xe_eudebug_sriov.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright C 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: Test EU Debugger and SR-IOV interaction
> + * Category: Core
> + * Mega feature: EUdebug/SR-IOV
> + * Sub-category: EUdebug tests
> + * Functionality: EU Debugger framework
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include "lib/igt_sriov_device.h"
> +#include "xe/xe_eudebug.h"
> +
> +static bool has_vf_enable_eudebug_attr(int fd, unsigned int vf_num)
> +{
> +	char path[PATH_MAX];
> +	int sysfs;
> +	bool ret;
> +
> +	igt_assert(vf_num > 0);
> +
> +	sysfs =3D igt_sysfs_open(fd);
> +	igt_assert_fd(sysfs);
> +	/* vf_num is 1-based, but virtfn is 0-based */
> +	snprintf(path, sizeof(path), "device/virtfn%u/enable_eudebug",
> vf_num - 1);
> +	ret =3D igt_sysfs_has_attr(sysfs, path);
> +	close(sysfs);
> +
> +	return ret;
> +}
> +
> +/**
> + * SUBTEST: deny-eudebug
> + * Description:
> + *	Check that eudebug toggle is not available for VFs, and that enabling
> + *	eudebug with VFs enabled is not permitted.
> + */
> +static void test_deny_eudebug(int fd)
> +{
> +	unsigned int num_vfs =3D igt_sriov_get_total_vfs(fd);
> +	bool err =3D false;
> +	int sysfs;
> +
> +	igt_debug("Testing %u VFs\n", num_vfs);
> +
> +	xe_eudebug_enable(fd, false);
> +	igt_sriov_enable_driver_autoprobe(fd);
> +	igt_sriov_enable_vfs(fd, num_vfs);
> +	igt_assert_eq(num_vfs, igt_sriov_get_enabled_vfs(fd));
> +
> +	for (int vf_num =3D 1; vf_num <=3D num_vfs; ++vf_num) {
> +		if (!igt_sriov_is_vf_drm_driver_probed(fd, vf_num)) {
> +			igt_debug("VF%u probe failed\n", vf_num);
> +			err =3D true;
> +		} else if (has_vf_enable_eudebug_attr(fd, vf_num)) {
> +			igt_debug("VF%u has enable_eudebug attribute\n",
> vf_num);
> +			err =3D true;
> +		}
> +	}
> +
> +	igt_assert(!err);
> +
> +	sysfs =3D igt_sysfs_open(fd);
> +	igt_assert_fd(sysfs);
> +	igt_assert_eq(igt_sysfs_printf(sysfs, "device/enable_eudebug", "1"), -
> EPERM);
> +	close(sysfs);
> +}
> +
> +/**
> + * SUBTEST: deny-sriov
> + * Description:
> + *	Check that VFs cannot be enabled when eudebug is enabled.
> + */
> +static void test_deny_sriov(int fd)
> +{
> +	unsigned int num_vfs =3D igt_sriov_get_total_vfs(fd);
> +	int sysfs =3D 0;
> +
> +	igt_debug("Testing %u VFs\n", num_vfs);
> +
> +	igt_sriov_disable_vfs(fd);
> +	igt_assert_eq(0, igt_sriov_get_enabled_vfs(fd));
> +	xe_eudebug_enable(fd, true);
> +
> +	sysfs =3D igt_sysfs_open(fd);
> +	igt_assert_fd(sysfs);
> +	igt_assert_eq(igt_sysfs_printf(sysfs, "device/sriov_numvfs", "%u",
> num_vfs), -EPERM);
> +	close(sysfs);
> +}
> +
> +static void restore_initial_driver_state(int fd, bool eudebug_enabled, b=
ool
> vf_autoprobe)
> +{
> +	bool abort =3D false;
> +
> +	igt_sriov_disable_vfs(fd);
> +	if (igt_sriov_get_enabled_vfs(fd) > 0) {
> +		igt_debug("Failed to disable VF(s)\n");
> +		abort =3D true;
> +	}
> +
> +	vf_autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
> +		       igt_sriov_disable_driver_autoprobe(fd);
> +	if (vf_autoprobe !=3D igt_sriov_is_driver_autoprobe_enabled(fd)) {
> +		igt_debug("Failed to restore sriov_drivers_autoprobe
> value\n");
> +		abort =3D true;
> +	}
> +
> +	if (__xe_eudebug_enable_getset(fd, NULL, &eudebug_enabled) < 0) {
> +		igt_debug("Failed to restore eudebug state\n");
> +		abort =3D true;
> +	}
> +
> +	/* abort to avoid execution of next tests with invalid driver state */
> +	igt_abort_on_f(abort, "Failed to restore initial driver state\n");
> +}
> +
> +igt_main
> +{
> +	bool eudebug_enabled;
> +	bool vf_autoprobe;
> +	int fd;
> +
> +	igt_fixture {
> +		fd =3D drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(fd));
> +		igt_require(igt_sriov_vfs_supported(fd));
> +		igt_require(igt_sriov_get_enabled_vfs(fd) =3D=3D 0);
> +		igt_require(__xe_eudebug_enable_getset(fd,
> &eudebug_enabled, NULL) =3D=3D 0);
> +		vf_autoprobe =3D igt_sriov_is_driver_autoprobe_enabled(fd);
> +	}
> +
> +	igt_subtest("deny-eudebug")
> +		test_deny_eudebug(fd);
> +
> +	igt_subtest("deny-sriov")
> +		test_deny_sriov(fd);
> +
> +	igt_fixture {
> +		restore_initial_driver_state(fd, eudebug_enabled,
> vf_autoprobe);
> +		close(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 711eb899a..a2db178fb 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -333,6 +333,7 @@ intel_xe_eudebug_progs =3D [
>  	'xe_eudebug',
>  	'xe_exec_sip_eudebug',
>  	'xe_eudebug_online',
> +	'xe_eudebug_sriov',
>  ]
>=20
>  if build_xe_eudebug
> --
> 2.34.1

