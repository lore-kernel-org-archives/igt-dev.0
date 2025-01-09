Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B24E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 10:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223F810ED5C;
	Thu,  9 Jan 2025 10:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeDyh/et";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC4E10ED65
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736419646; x=1767955646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0Sn0ooE9gLAQKMByLXzdxpIwWc5iA4H5w11VnRfBLf4=;
 b=XeDyh/etyQ3nmclYXkR9li0HchWdbv40PF6s9mkKIaeoWKz+BbSe8XqH
 glARnFZ6wz3yECP0FCUBZ1aCSybEQpAKmUu2b9tQllvcQrWmRV6kTY19v
 U3bFUFK8UVXeEQ5cAUIS8g8G0k+thVBj8s0/M1keyHzFYux+93B3twkt5
 rU3Hv4CBQ64XjQaoflc+ShabffIZfPX4mj1mYxZGFj1LlMtEQEFOIZawn
 APODGWjlHuVdl2gdni35GKQO4E6K90nbsdiJ6Qf1COd1yJG4DVQCJCd1Z
 ZOCH3Fy4LyrIj+nngm+TKnvE0AgvOdoWkq8Zxz/KvCT3iKQb2rB2WuSrV Q==;
X-CSE-ConnectionGUID: kI8msymNTUi4UeOkbgOMMA==
X-CSE-MsgGUID: oZzW8yZdTIyeTqLqGh57HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="48035996"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="48035996"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 02:47:25 -0800
X-CSE-ConnectionGUID: UHEhwk2VRrexRUE0odHm1A==
X-CSE-MsgGUID: VeO3ELQOTBmAzsZJH2GPEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="103334773"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 02:47:24 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 02:47:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 02:47:23 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 02:47:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfnL3Y7uzijDCi7T85ooXPcTaLrsuwBJFd12HTaBkieCZoetRglgVp9z1C7BUkeou/nQtNqoFlkrNt7fWSB1jcVFYhGqD5llRlRGKH/2bMAR84FCUvaGTDlla+vBGclnB+vNZrglth4WW6KXX+GPsikjG/hVvj/6vy8Rl75cpipOdgVbNNzGCImM4Ypi/Sh1u4GqYjLtBazE6ynHu6DiG+DpTx51Aqi7qht8ypA+qW9VhmpO1I0PtGXyK2QX7CMmBpW1X59nMn50yOSuhJQDBNApRvi3bp/DBmprKmxk4PRhqhd+hUve4frfarOB5o+c3CI8DFgSG8sUWi2vcM9tzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qe3tVesQu2tDLltjaPrbXlyPbfQcpvvEEdLjUXHaKRQ=;
 b=gybYFJhnpHe52Co0/S61bTL/me8EWWMfQnOaA7aNOgR/TGJeBSPvIwgIMDnEpm3r7dccu2FcCiHtsP5h626Cr+KXkkRZNc0MXElrf/gcp9eatp8qEaAN3szvS90lZm7/hwmb2doXHkZAFZD46v19ogzSEfht9Q5efHW+kB94w/s8+uUetlFtn927xrAj1ODo+jMyZ9Jo4G5mT9kJjXD8EjUEb6MGN588Oj6y6TWUwOWR3plqQ80jT1kA0edhCuc5BaVEZzjhzyVTTYg1380HYXRyXhdcPdS+rqGdvE61J8Cqgud4o4myj9nA6LZFMLrB2/jFX0uJy06IjSYfMYC+3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH0PR11MB4854.namprd11.prod.outlook.com (2603:10b6:510:35::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 10:46:54 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.8314.013; Thu, 9 Jan 2025
 10:46:54 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH v2] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Thread-Topic: [PATCH v2] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Thread-Index: AQHbUcpRiOJkgnS9BE6lclh1GWEEGLLtpeGAgCC91rA=
Date: Thu, 9 Jan 2025 10:46:54 +0000
Message-ID: <BL1PR11MB5525A1158248E7726DDFFE1D84132@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20241219035609.680347-1-pravalika.gurram@intel.com>
 <dkyt2j7wyechttpdcdqs3xbi7sx7j64f3dohgw4rev6zndygil@mjxvzqstc6hd>
In-Reply-To: <dkyt2j7wyechttpdcdqs3xbi7sx7j64f3dohgw4rev6zndygil@mjxvzqstc6hd>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH0PR11MB4854:EE_
x-ms-office365-filtering-correlation-id: ff8dbc33-e942-48f0-c818-08dd309aee82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?h43chwjjcPpjArNo6aVhvB2rXu8hHDQiI27xrlmHqoG7fMfS+eTHu+HFTxWL?=
 =?us-ascii?Q?N8f+KkgCUsciiQtavcyr9OYNN9/jDSMyfySA7cbOEfTttHwGX2MIC+Z9L9Hu?=
 =?us-ascii?Q?Fz8KbRA+JKV6mxbak23VlBii1Kz82AXBxDnQrfThnfKINBVe4FfT+BN+PxBG?=
 =?us-ascii?Q?tGr/DU0FgA85GuspcSVWjxrqHeyKe9O579OD+ZmV3aj7uu6yiJl9rMDf1Ox3?=
 =?us-ascii?Q?vR9gSHDoDbccbycC/kWSc6P+FKaZn42No9dT5hFUMv0VdIoiLaVvHn1bxodo?=
 =?us-ascii?Q?gm4XqMkJ6+gRMdKD2DlI8OAPw/FCghA43qHWq1HX4g9BOy7wOvjTuCBCqMNz?=
 =?us-ascii?Q?VrEpBW2RKxRe/uWPeYZQ0tx/F0RV0vVNMeq21GAP6HbcB4JQfL3xe1UFhIXr?=
 =?us-ascii?Q?VcPcJH97JxvjCaJ4aAtCvVfeWhai1QkPibiPjiZ4yI37yXj0k+Mfnlq0YEul?=
 =?us-ascii?Q?cdNmfw7JRFXEMMxbGkRdDuxNlHfequ9phTb9e81/DYeTllIgoM9wBFqEiTiP?=
 =?us-ascii?Q?xysQuU6lUSmCwdC+E1i2BE8z9Ike5MHy0dUyCc8Zb+6B0mCjwRBxEOvcgMhm?=
 =?us-ascii?Q?gvFuSs6JdXjXvPCWvBKB52yI6g2HXeVrmgWG7ZA6wCOQrmUI2aiGQY9h8tFI?=
 =?us-ascii?Q?dCWrYDMR3xNEon/JDOv/wTIdRBjbyre8f5s0Dxn2+ddlWb87iaaTCk5E4iVT?=
 =?us-ascii?Q?C+/3d6YHx13P90K1JmE6G+nDnsRWthCPBx1cPloQu3P69KnII1bxv8Znr0Ju?=
 =?us-ascii?Q?KsrmVEaAYNwar32CbKADy5f0+V1EpeFxcW02r0nUDYlGJqBWXrYfznfMwm59?=
 =?us-ascii?Q?JGycVGVtOmH5sRvK7iLTbWwyeqJ5vkRo1qIW+StwWWQbfqYfqBgEQclckpV/?=
 =?us-ascii?Q?TBQsImyvfZT/xjE+a2t9uH7VFjP6S7l4oYb6GItixNSU9tol2CO7eO+uYbAL?=
 =?us-ascii?Q?AoVdjc1w6pn9b6LJXubD7ukdYWi2J7Q1Ar6hKL9aVvWukfdLjZcXBAlToRPA?=
 =?us-ascii?Q?V+85lgdxWbZ0bzjBBHQ0twKSGDQ3E7Rq4OcS5frC9BbC79Hcwr3hauXucYfg?=
 =?us-ascii?Q?6M6NPLQazt977ivVBBo/Cl+/60hmf7EZGVNgManSUVZoxIWfpdGwN3wFiZQ2?=
 =?us-ascii?Q?8/8OpzP8WOvL6H/k1rNUqf8eSAQd55fM/4QJ2ZUT6WVaVqjbvsGTRbzNJMnl?=
 =?us-ascii?Q?/fmP1QS/3BhATDwJidHAM5lWmTCYM/D3f6JsrfmBEd2BO2qmmK5Hv5RR/BfG?=
 =?us-ascii?Q?mfzAQ7jSl6AZNtP210J1G08Nf/e+uvTPoJIvmuSdjf4Vnf0Whog2f9n47rD9?=
 =?us-ascii?Q?gkLtsHA5QLPFvPm8SYDLrYQexMlYSROrQjxpsTHz28tYJXRv+elC/a87soKG?=
 =?us-ascii?Q?6+xbUunrWS8YHd6PRq6zoctY7pwVP1zMMV7aVsgidUovFN888IlXkK51/75x?=
 =?us-ascii?Q?uUWSJB9WyWLb5qdLCs2NrDCRrh38p3ZH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UODMId2ZgOdzzF4LINXGWGEEXQ32ESGCc1zFywGeKpw6FRyM2sivfOAP4Xj7?=
 =?us-ascii?Q?hliO9wy/Nai022TMT2fa0RfFf65StaXrty4+Fj494utnXVm/9uIdQBuhxs7B?=
 =?us-ascii?Q?VOZW/ROOk5NlF4Eg4aw4++q7v8dsmPwsdKwVM22PP8Dyb7SIcHqiyMj/xYwp?=
 =?us-ascii?Q?O57bwzrINYQSX92ShecFWCgpQlIbTB4toND5XzHv6g3MgpiGYvOpLtbT2I7q?=
 =?us-ascii?Q?QkpJfA92mqIi3Ppd5SErbn3T590+Xt4fibXwfjCAV+YK7LjiAe6W7pOYX8/6?=
 =?us-ascii?Q?I3LoU2wCeoZNvC2z/D/1JMVQwca3EBZGerddZXxz7i13ZEGT4Nzg8agOrF62?=
 =?us-ascii?Q?ZejLIapYrL+hqUvDEMUUUB7gU9D2v2IGrc+Ifi0askjEeMZlqi+X+7QuPbo2?=
 =?us-ascii?Q?L40j3m6YHRaWxhOzy+Vb3hBgxZXKXmB+9AgfW9K+0e2Tz2gIrNVYRPf1tjaX?=
 =?us-ascii?Q?l8aghdZ6rgb4KyIZ5aNdLOv32x8L8gnxMHWht9fj//SPhtcPjeN0cEw1ROp8?=
 =?us-ascii?Q?krRF9pse/smpOYd0gEd7i9cWDFFQL+xnnrt71llqlCQUnIczbLw2eitx1i6s?=
 =?us-ascii?Q?pptqIROo2GPW243qV+a3aLbCjBVX5ODKh9Lsc4mEkvuVqUz5T0GTG62OnPoA?=
 =?us-ascii?Q?URosTY2Cpmh/gutdcD+95M/I70dtjuIRvKZPKc3P+z9ovGvAhRJ+VmGWcWke?=
 =?us-ascii?Q?fBNqkTkCUEe4n35EFpCY/vbRf0QE7a3rPIdxfIAMGbGm0mpeYm6P3+WocX/t?=
 =?us-ascii?Q?zRC1FMBYsCiIZKqK9tj3/QEVNwtDr/d/z+o6nqV2lFnqkt84XYGjJzSZXA8o?=
 =?us-ascii?Q?FjCA8zG5E0R128SyWe8ZR90XKQv1jjY4VCI7xLGXDHLaLFJ3BxhmL8irHMmI?=
 =?us-ascii?Q?O38ovkjKevY6XTr4Vr8Un79b5zHVReBLAPRUH/HN47K08GcneeYeynXAOu3+?=
 =?us-ascii?Q?DP8COzaHmYaBk+BqMlb9ar9IRnq4Lve7Oq5Q8KfHNm5Z+vfjA7e1LxCPPg0E?=
 =?us-ascii?Q?88rBeeoxJPAThP7kgJNGX9n2Dk6dPUMzHNPDjZ4qd6TQ31BHEs5gQrAJIvGG?=
 =?us-ascii?Q?VhPKWbU78083+PdLwLtIrQ+8tPCMUQeXMzJ70LMAhF4g3qv3Fvwo2ChCMmkt?=
 =?us-ascii?Q?cXf+U1+haMUs6KnctwosL557w6IpJF7GrV99zn/v668aw4i12FJ3qUu2KwI4?=
 =?us-ascii?Q?rYiyTN5sRcGNKRfea4k1huTAYsMh0KVsH367xAvoFARtIPP/o2wSV+M2wYe0?=
 =?us-ascii?Q?i8HIuF4ygQM5o/czHPVPN8kwv1GP2nmPlCnH13HnAs7RfbRmLyMd43v8HmJd?=
 =?us-ascii?Q?+1mlPNzk67jI47nrDovSAiq07dakew8f4l8jqTRfk/HkDoibKYnW5zfEaG0a?=
 =?us-ascii?Q?/aoEOsmxMgHypJEn6bvt0C7uEb+jQCodrYlm/F1LqugYT4m90xUpvWfaRtt2?=
 =?us-ascii?Q?QeWXNDexAXzKCYWpiN8n9LntkjMu/xeZhySn1tbhyGkR9TqQGgqFV3zH+0z4?=
 =?us-ascii?Q?iYg335SG/bg0eqRNpPku5HLJuEEknKRmoK9CqXwy+j+UmfLdiGtnC5EhNfwn?=
 =?us-ascii?Q?3urloJDSdlbp326YOx4R9hequ620kIrwvjot/GQ9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8dbc33-e942-48f0-c818-08dd309aee82
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 10:46:54.1057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZkv7JnwcX11XeQiQJqX4nB0OshZD91JkX8hJYd2yotSN55WTz5SMskubgdR96FtY8c9Rn8j5UV9PCcRsv09zz0hlBsemfYCblw0mv7fHjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4854
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, December 19, 2024 8:16 PM
> To: Gurram, Pravalika <pravalika.gurram@intel.com>
> Cc: igt-dev@lists.freedesktop.org; peter.senna@linux.intel.com; Brost,
> Matthew <matthew.brost@intel.com>
> Subject: Re: [PATCH v2] tests/intel/xe_debugfs: Extend gt test to check f=
ew
> debugfs entries
>=20
> On Thu, Dec 19, 2024 at 09:26:09AM +0530, Pravalika Gurram wrote:
> >Read and dump  below debugfs entries.
> >ggtt
> >register-save-restore
> >workarounds
> >default_lrc_rcs
> >default_lrc_ccs
> >default_lrc_bcs
> >default_lrc_vcs
> >default_lrc_vecs
> >hwconfig
> >
> >Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> >Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> >---
> > tests/intel/xe_debugfs.c | 50 ++++++++++++----------------------------
> > 1 file changed, 15 insertions(+), 35 deletions(-)
> >
> >diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c index
> >700575031..a31de41a4 100644
> >--- a/tests/intel/xe_debugfs.c
> >+++ b/tests/intel/xe_debugfs.c
> >@@ -162,6 +162,16 @@ test_gt(int fd, int gt_id)
> > 		"pat",
> > 		"mocs",
> > //		"force_reset"
> >+		"ggtt",
> >+		"register-save-restore",
> >+		"workarounds",
> >+		"default_lrc_rcs",
> >+		"default_lrc_ccs",
> >+		"default_lrc_bcs",
> >+		"default_lrc_vcs",
> >+		"default_lrc_vecs",
> >+		"hwconfig"
> >+
> > 	};
> > 	static const char * const expected_files_uc[] =3D {
> > 		"huc_info",
> >@@ -170,41 +180,11 @@ test_gt(int fd, int gt_id)
> > //		"guc_ct_selftest"
> > 	};
> >
> >-	sprintf(name, "gt%d/hw_engines", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/sa_info", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/steering", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/topology", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/pat", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/mocs", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/uc/guc_info", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >-
> >-	sprintf(name, "gt%d/uc/huc_info", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
>=20
> these last 3 would be dropped from the dump. I don't think that's intenti=
onal, is
> it?
>=20
> Ideally this would be more than 1 patch:
> 1) replace the copy and paste with the loop
> 2) add more files to be dumped
>=20
> Also, it seems we are not actually running this "test" as part of BAT. I =
think that
> more than actually checking the asserts this would be useful to check the=
 state
> of the hardware in the beginning of a BAT execution.
>=20
> Lucas De Marchi
>=20
This test is already part of BAT
igt-gpu-tools$ cat tests/intel-ci/xe-fast-feedback.testlist | grep debugfs
igt@xe_debugfs@base
igt@xe_debugfs@gt
igt@xe_debugfs@forcewake

-- Pravalika
> >-
> >-	sprintf(name, "gt%d/uc/guc_log", gt_id);
> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >-	igt_debugfs_dump(fd, name);
> >+	for (int i =3D 0; i < ARRAY_SIZE(expected_files); i++) {
> >+		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
> >+		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >+		igt_debugfs_dump(fd, name);
> >+	}
> >
> > 	sprintf(name, "/gt%d", gt_id);
> > 	validate_entries(fd, name, expected_files,
> >ARRAY_SIZE(expected_files));
> >--
> >2.34.1
> >
