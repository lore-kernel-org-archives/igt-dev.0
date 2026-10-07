Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8824CCA6002
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 15:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325C110E60B;
	Wed,  7 Oct 2026 15:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKUkSzXh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F96510E4A3
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791387598; x=1822923598;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=id+v0karwm9RHLwaVXDxZKo2ySVVbJr2ndvGa5F5xzY=;
 b=QKUkSzXh79b7Vvu1vZ1lKzzJ6hJKCHV2vVeyP9zW+NBKcGF2pQ8wRj14
 NXyuopY2kfK8xetr8W35UPYPjZYCLeH5IgIkLkHGJM9BlSAcnBvsKzu2x
 jfFaDTfBxQqdqU1/6upFajjt9Bmcaw5D0WQLZWjVL5IsShm+H5KJabfUu
 zqLExCoV13mRa5WggEaSiPjlw4oyWey56yJO/KTnyjPipp3fvKWzh4Cwe
 HC2kZO8WGrnrAOAcSgNH+WX/3v0oqTYnAn4Z1ErS5NlLMAvVTprt6dsgz
 ZQ5f4M3E1nmE1xwFn2jZFB9eivg2Z9uSTW8RQ9+dBN24ZDs2AyK/S6eoQ Q==;
X-CSE-ConnectionGUID: STyT6IE2T0SqlljQdhFBQA==
X-CSE-MsgGUID: EGyoLFc4R/i8nXjZd008XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="148991"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="148991"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 08:39:58 -0700
X-CSE-ConnectionGUID: pQrZaMbgTQqWLWVayXl+kw==
X-CSE-MsgGUID: n1M2PKt6TA2HrWTgKOP0qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="277584570"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 08:39:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 08:39:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 08:39:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 08:39:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prJJdNO0+KjxnzQ2aOBoxqNOpvmmAYdE5vQdSU0crEuQP2jiZZbhGzzaj4VSjvvlbscuXO6BrtJj6Qu6bDhUAV2F5TqgjjSaYTGPkCfr3aQ047VuXbIHEl8ZDZcPgNVxBrVF5y3FZzrHwHv6HXanVBatTVnjwlzQeZNE7mB2YWcOTHkGdYLM1NMziQEquxOSrCdcBwJirEbWjEijZ+k1ovr0kG7IdjpVZyZDlbGgpe2iBWgXNLSl8B/T1tceohXw1I6boiVDb+FqdKa/4vFdC7C7n+YDQPhWuCSVK2EvCsFwnDB6oWX+apoUttg3MDcGXIbqYPE1Mf++/kD0eqkRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYjpXmniUaz/UD3sHOqfnkSNdxWco8IodLvcF2iDYCw=;
 b=kM0mm/22TsEOg+abNXUXo46voPxKcH1BkSbhv/8MOjuvcwAIOMoZK0DEY1NMYv3Y3ppSWjjXsdlr/3bcdnvkpwhi2NMVzu03QLGwubW/2B0BlCdrWO/956eYyUOvAhUZirXC8En7djGPxxWiXoIHE+AxN+DpTXPdHyck0BIhZxQgmV8rZu12y6ovmoWQOqVXFi2luYDu0WCXUcFaLQeUQ+lAlcKvxx8pwwnJgCNfFBRp4s94w6SX2WyVP7pi75UqimkJ8P5SSGw6kXqV0XtDQQzg2IXaiG5fI3GDgqYhtWYld+7qmoP+mAHPmRjyWh3FbYWyxY5mkd9c7DPTkPzpSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by BL1PR11MB5285.namprd11.prod.outlook.com (2603:10b6:208:309::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 15:39:55 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%4]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 15:39:55 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
 igt_get_free_pipes_mask()
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
 igt_get_free_pipes_mask()
Thread-Index: AQHdVkAd8O5+c6fo9kOMpqQeFbByHrbyFLWAgAAhm9A=
Date: Wed, 7 Oct 2026 15:39:55 +0000
Message-ID: <IA0PR11MB7307BF7CC98754A56CB542B8BA942@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20261007-joiner-v1-0-b40826411fa8@intel.com>
 <20261007-joiner-v1-1-b40826411fa8@intel.com>
 <5b5f1fcb19f9c6052bd0daa857c5997bb9b08130@intel.com>
In-Reply-To: <5b5f1fcb19f9c6052bd0daa857c5997bb9b08130@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|BL1PR11MB5285:EE_
x-ms-office365-filtering-correlation-id: b61e0abe-1430-4beb-c9d6-08df24893c53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|10067099003|3023799007|38070700021|11063799006|4143699003|5023799004|56012099006;
x-microsoft-antispam-message-info: Z13jkIvmGzi56qufRZG+S1Go0naUESpfeXRGRjYfz3ZhdlebL7ephmMCOV96e+b7WN94w8qUpABJHSRvTc1dmMFXor/U55r68pgD0XxNrvEYHFjs4CLGNszvGwxv3BfP4v1vyHIIzDeAJNFTyYCZBG+PvD8lO20ficlLYaMQH3mnJWYQKajVsbAkvwLDETvZ4VAfOxoh42QJprl2E/YVbjS7jLp2bYLBh1IqBFRVTIwFOvoHdiowHNG284b88ULLDuJohgfovEByojm7iHKoIZXBahW3Hh5spTzayW3hPrdZyAyl+YQd1s0+ozLtoDVx/SjrNyZ1tmktXttt44CZCzb9chb3ICJEXHriVJML1znPZkvHVnKYFdzoH9bkdWko+2RfYRrQgWBwhowQoSmArI/A9+msbMj2xdoi6FdWfRSKXMj+YM12uWTDpZLutiOBUxrESwOr/Cxk0ibck+1oTki2uYwCLguRL9IHO5lwNryR57XO3KZ15N8FQWq2G2MbyPTqSTdgAslkUDFyWxlcUel+hisoh/8KzlaNLtIBZhEy0Zao0wYaqbPuPb/2gdkdygwyRr3AhyLV9T7hFl3Cxztun6+AoC8LzYztkz05Qb1cEhMDwpYePp8t28Z/9UdJ0G3YGVr48Ir2sZ3az0xy8GT61mIctYHol4Dmq1sDOiCMQE7AGVqaVo3XUN5HqSv6LGFO4q/NI+bv7MfGQfSzf0XrLoA8ZfQOt0PHC0OFpDk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(3023799007)(38070700021)(11063799006)(4143699003)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QJU1tNmYWSkSKtzX1bYjjOs+5ur+88egW45C5oZ885VyzYUoGXcosjVmBaoq?=
 =?us-ascii?Q?wvsIxVZv77Kl0foAC6zhsKR7aRmxZN2iySd0aLTSeO+t/ERuN3aexPMYt+mI?=
 =?us-ascii?Q?FbNBNntXCFG2U/88uFZ54A/NRDNuFtz0NFrBQKGy4bYqXX4CrSmlZdpwBML3?=
 =?us-ascii?Q?+n3pI/Z6X89/h3WDHiZtMPyCQZRhiR69KqjFPsxd/WjmGiKfo1dHolFjG5BP?=
 =?us-ascii?Q?D3WmQdGm9MrVaqVLcUJvR69Gekdw5DNbOTTAsiMUcvh6FLF2XmKeJvIAGEJ1?=
 =?us-ascii?Q?PA1OPHyzMNZ4CwErUPEMVzOqIuXmTO44dufN+aWK8J0/mBxDEiHgOPQplf20?=
 =?us-ascii?Q?yZmCfo0GHMmgEL+s5TH150nXIONJDhuAlnAZcTk8Oc9PxzJj+zem1VxerWtH?=
 =?us-ascii?Q?fICKW7GJzI5Q1LXcjh4MbaFbVnMdIKoO40W0K0PIy8VJh8svjk1WjrPtUr1x?=
 =?us-ascii?Q?gAvDyxYOSsljFdVE02ggnvrOxb+Mr9KiPMlUMeAknXqJhmZZImC0My9meCAD?=
 =?us-ascii?Q?x/yrY7/mPVJlVhBmPItcd1bWZTyVhVrp50eOX9QW+mTQltacSc53DxX+7Abm?=
 =?us-ascii?Q?02FsOtnmHv36WZvqSLiRpvwDy67jL5aZH0McD6XVO/gWq7OaR01t9RfhnbCI?=
 =?us-ascii?Q?EBsPY8YGiBtGp22DBykejpwdTC7ErU+r2yYSr4srRk+MH24hb8zAQGZ+VXUi?=
 =?us-ascii?Q?wWSkJG4XDEJjaJPIPRLzjhx8MVYCJHUfdLYIzbYZ+MI6jQ/VeN7SYYhpP5nX?=
 =?us-ascii?Q?MKXR3DPgwd6IIUh8Ahi4XObgCUcVAMXkOaj9i+k37HIKoKnPeJCE4QWdkI8n?=
 =?us-ascii?Q?hFBlxhTCVQ2RnEBxTBZP/RwsKCv44ct2VHPZYcHjWgLoOUq11wQZSt8+NnR4?=
 =?us-ascii?Q?xYWkNb4mEKneV02Cz8uINVMYQHVHNAJb5zknG6A/RKqR+f9Kyts+fgZi7Ad0?=
 =?us-ascii?Q?0uxDdg4qAIMW7PxKPNUI1FKsTt4F8nE0RF5M1EeAh7V2a+27yiz0AKdiwo2o?=
 =?us-ascii?Q?lg8kwEhfK/sepReQjiL5B4/8aFfWcWqPjmhCKSBOEQr9XFky2bwgdPzcFSep?=
 =?us-ascii?Q?6He3f78n+in40u7GuvohljOAh4q/vtCj9AsW7MLs+lCKPbsm0EWjpWoVUyRC?=
 =?us-ascii?Q?z3G61+3YKjBO0vhbmgyFznyuv6MghsLD/zCcU+xjtptYgl4s5eiDZYM+jZ+5?=
 =?us-ascii?Q?MPNrmmqnEbPf1HEkqOqCunLMi+L91sMjR/2BwA1oJE/cZ3mxgLQXl/XsKats?=
 =?us-ascii?Q?F6uE+B+A3OjbPMvSJ52krTeMgiZgGdM7GnWdm0L/cmkSi2iN4SRqyfcq1Qby?=
 =?us-ascii?Q?1C8mfZRyyyLniA08FCDx81PxIWYQlwrZFOFbAOAe89HyzwvyFoxJ6T3Si90d?=
 =?us-ascii?Q?/7JwIkYohm17rQljGDWErVq8PrWC2qMzEKb+UKOaMKL20rcUxWHbBHhpLZvR?=
 =?us-ascii?Q?HAhkMbrFiHHpbUGAEnaHzZnoRj0oiSkMmXGrLvOyId7WL233F4BkOU53YXIU?=
 =?us-ascii?Q?ppae85zRRTQrtQchuFUuL4qSEsBSiENjOzCadECT2fNivQKY6VzYinwm0qk4?=
 =?us-ascii?Q?7ypiQLcppnWMCXWGT6gtXVFf0X40TMeTnjnzDY2/Tv78ZyxoG7qOqusyetVc?=
 =?us-ascii?Q?KQjVihoIgG45Ooz2HZ4ockTaa88UfEXMCZOW+yT9NnHakXaPGZaiCj3Gd0Mp?=
 =?us-ascii?Q?O0onWtszxu7NIykXbxh+NQVl2qAmMx5NgzrTGa7rztqpd4jiv1kmW4NDi+Qs?=
 =?us-ascii?Q?A90RxWsoDg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qMmy+L5xosNzVIrRcjuZI+j6/QyfjsxuMhjTF9AXAjvLb/mPM7RCDxzD9uv6FsKaS9JE+dds+ZgFF9Rw2WxZ5kRrQ9Q1PlN//lsAPSDInxLWZRSx2C+b0cXPOIVr1jCiTCDl5k6hkVyodsq3MuLNiuHTHF5l38uDsd588JYd/t6A1vBJ111IRESuHENnLIbbRCsQVSrt6fRLVuEVSrlI5/GObaSoptb25+rXNjJkQ73YLAvn+/WIo2SQi0rhTR0zukZTFvHhLcx1FvtTzNbwuJc9DQN9y+E1F0gl70xYqdXTam6M30CJznfPRAlDwPbHjg1Bm1UgcPcl4zXTO8DjOg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b61e0abe-1430-4beb-c9d6-08df24893c53
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 15:39:55.0902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WjmT04jLiXZ/6Co7DtMmTfS9x5mkVqW4HfXnSO0WfQidzOPgJBQEYGAK6Ntg0S6Yfwr54mJkLFXU7ettFSum7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5285
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
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Wednesday, October 7, 2026 7:05 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
> igt_get_free_pipes_mask()
>=20
> On Wed, 07 Oct 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > The joiner tests derive the set of usable pipes from the pipe count
> > alone, which assumes every pipe is free. A pipe already driven by
> > another client is then handed to a modeset, making the commit fail.
> >
> > Add igt_get_free_pipes_mask(), which gets the current CRTC usage via
> > drmModeGetCrtcList() and translates it into a bitmask of hardware
> > pipes.
> >
> > drmModeGetCrtcList() is a recent libdrm addition, so probe for it in
> > meson and fall back to plain CRTC enumeration when it is missing.
>=20
> Why is this so pipe based, and located in kms_joiner_helper?
>=20
Agree this is generic and not Intel specific, will move this to kms_helper

> You could just as well get the information about whether the CRTC is avai=
lable,
> like the IOCTL, and then use that information in the joiner.
>=20
DrmModeGetCrtc or others will not give non-KMS enabled CRTC, i.e the second=
ary pipe in case of pipe joiner will not be detected.
The new API DrmModeGetCrtcList added in libdrm will give all active CRTC, K=
MS initiated and active CRTC but not initiated by KMS as well.

> It's not helping to plug the pipe everywhere, we should be heading the ot=
her
> way, and only use it at the last point where absolutely needed.
>=20
Yes in real work compositors can use the way you suggested.

> And there's nothing Intel specific about the IOCTL, so this should not be=
 hidden
> under tests/intel either.

Agree, will move to kms_helpers

Thanks and Regards,
Arun R Murthy
--------------------
>=20
> BR,
> Jani.
>=20
> >
> > Assisted-by: LLM
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  meson.build                     |  7 +++++
> >  tests/intel/kms_joiner_helper.c | 66
> > +++++++++++++++++++++++++++++++++++++++++
> >  tests/intel/kms_joiner_helper.h |  1 +
> >  3 files changed, 74 insertions(+)
> >
> > diff --git a/meson.build b/meson.build index
> >
> d7bbfd9698e5616ab777ac58128192ba1e0bec23..f41588c9d73361dbfd405de5
> ea8f
> > 764c6768a9c9 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -129,6 +129,13 @@ endif
> >
> >  build_info +=3D 'With libdrm: ' + ','.join(libdrm_info)
> >
> > +# drmModeGetCrtcList() is a recent libdrm addition; keep building
> > +against # older libdrm by falling back to plain resource enumeration.
> > +if cc.has_function('drmModeGetCrtcList', dependencies : libdrm,
> > +		   prefix : '#include <xf86drmMode.h>')
> > +	config.set('HAVE_DRMMODEGETCRTCLIST', 1) endif
> > +
> >  pciaccess =3D dependency('pciaccess', version : '>=3D0.10')  libkmod =
=3D
> > dependency('libkmod')  # igt_procps.c reads /proc directly; libprocps
> > and libproc2 are not needed.
> > diff --git a/tests/intel/kms_joiner_helper.c
> > b/tests/intel/kms_joiner_helper.c index
> >
> 36168030475c2725130e6c8ad924dcfb971a07f6..235e227fe9d82f598d0bd7df
> 57ff
> > 65d73d717ad0 100644
> > --- a/tests/intel/kms_joiner_helper.c
> > +++ b/tests/intel/kms_joiner_helper.c
> > @@ -113,6 +113,72 @@ void
> igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *m=
as
> >  	}
> >  }
> >
> > +/**
> > + * igt_get_free_pipes_mask:
> > + * @display: The display structure containing pipe information.
> > + *
> > + * Get the CRTCs that are currently usable and translate that into a
> > + * bitmask of hardware pipes. A CRTC is reported free only when it is
> > +neither
> > + * enabled through KMS nor active in hardware, so pipes claimed by
> > +another
> > + * client (fbcon, a compositor, joiner) are never handed out to a mode=
set.
> > + *
> > + * The returned mask reflects the state at call time, so query it
> > +right before
> > + * a modeset and after releasing the pipes a previous commit was using=
.
> > + *
> > + * Returns: bitmask of hardware pipes whose CRTC is free to be
> > +assigned. When
> > + * libdrm lacks drmModeGetCrtcList() every pipe of @display is reporte=
d
> free.
> > + */
> > +uint32_t igt_get_free_pipes_mask(igt_display_t *display) {
> > +	uint32_t free_mask =3D 0;
> > +#ifdef HAVE_DRMMODEGETCRTCLIST
> > +	drmModeCrtcListPtr list;
> > +	int i;
> > +
> > +	list =3D drmModeGetCrtcList(display->drm_fd);
> > +	igt_assert_f(list, "drmModeGetCrtcList() failed\n");
> > +
> > +	for (i =3D 0; i < list->count; i++) {
> > +		drmModeCrtcInfoPtr info =3D &list->crtcs[i];
> > +		igt_crtc_t *crtc =3D igt_crtc_for_crtc_id(display, info->crtc_id);
> > +
> > +		/* A CRTC the display never enumerated is not ours to use. */
> > +		if (!crtc)
> > +			continue;
> > +
> > +		if (info->in_use) {
> > +			igt_debug("CRTC %s in use: %ux%u, fb %u\n",
> > +				  igt_crtc_name(crtc), info->width,
> > +				  info->height, info->buffer_id);
> > +			continue;
> > +		}
> > +
> > +		if (info->driver_active) {
> > +			igt_debug("CRTC %s active in hardware, not enabled
> via KMS\n",
> > +				  igt_crtc_name(crtc));
> > +			continue;
> > +		}
> > +
> > +		free_mask |=3D BIT(crtc->hardware_pipe);
> > +	}
> > +
> > +	igt_info("%d of %d CRTCs free, free pipe mask 0x%x\n",
> > +		 list->count_available, list->count, free_mask);
> > +
> > +	drmModeFreeCrtcList(list);
> > +#else
> > +	igt_crtc_t *crtc;
> > +
> > +	for_each_crtc(display, crtc)
> > +		free_mask |=3D BIT(crtc->hardware_pipe);
> > +
> > +	igt_debug("libdrm has no drmModeGetCrtcList(), assuming pipe mask
> 0x%x free\n",
> > +		  free_mask);
> > +#endif
> > +
> > +	return free_mask;
> > +}
> > +
> >  /*
> >   * @drm_fd: DRM file descriptor
> >   * @outputs: array of pointers to igt_output_t diff --git
> > a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
> > index
> >
> a0ab75b2c165084b643ead3f3ffc05cf5364e90b..14083d25c6f09e0577f123130
> 697
> > c34c2b6a15e4 100644
> > --- a/tests/intel/kms_joiner_helper.h
> > +++ b/tests/intel/kms_joiner_helper.h
> > @@ -11,6 +11,7 @@
> >
> >  void igt_set_all_master_pipes_for_platform(igt_display_t *display,
> >  					   uint32_t *master_pipes);
> > +uint32_t igt_get_free_pipes_mask(igt_display_t *display);
> >  bool igt_assign_pipes_for_outputs(int drm_fd,
> >  				  igt_output_t **outputs,
> >  				  int num_outputs,
>=20
> --
> Jani Nikula, Intel
