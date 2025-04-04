Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205BCC36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 05:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C572B10E009;
	Fri,  4 Apr 2025 05:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbahEmyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6C110E009
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 05:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743743179; x=1775279179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eKd2IyUYeephTi+eyPNZtJO5fRisNfEmZhiNPTGLcrA=;
 b=GbahEmyjyiXPzkp6IhVJVPhfOSZueg/yChStjMtXQtaxkQmTOmeKUKBq
 5stfgTy8in6vZhLEMrVzal15XddZuQDolr2a2wq77EtkPz9ggkxVymmRX
 Y8tpdM88MWi3L7N3VAxWnGSHVbcUlwO00aaccMBP3TsktmX+6eRbXY4pM
 ue71ncvVy0u1fr3WiXvxfjb3HC7mHaG3vY0QemFhl5iaRs+8Li6HYBcaf
 pB0wSn86ibW+FHrdfS/EqHwaZ3QsCxBCBCsqlimN/C4kM/LH7mZF+d4S7
 OrvmSeuThigZ7rPvKOWLkIAMjDQaKo03mzHeWMiDIVqxuRr93NAhfRwsA g==;
X-CSE-ConnectionGUID: HzalMv1KTpmLuKF4IQlARg==
X-CSE-MsgGUID: deMtayOjQ0CrdLYr4oSplA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45350586"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="45350586"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 22:06:19 -0700
X-CSE-ConnectionGUID: +bqHyT4NRGyZ4/FLNWB6gw==
X-CSE-MsgGUID: na9jM2TkS1S9TvC4ch3zfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="158203908"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 22:06:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 22:06:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 22:06:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 22:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EynO4reWDVoXKyKIt+jPWzFG55TgBERPG7FEI3mmZOJ8GHpOZq0gkxevc4RbXrVeKeYWz7KGWYUkjQNz80NusSfBi+U3IIS1LvnRQTlrYW59fVBqWQo5lRS5kEjtn05+QeCXzUEs/x9656kYhEzeL1BLhxNob394D8/hbFlNznWm3hVjjh8IXBOHyePF/GpwMQEnHPaAZ91cPeNn92UDA73cnHyfSPpIR/wWcnbE8RpEYIbgZazAEt8RMLTZW5AkW7BBMDfPXXfAjvdMEV6Fl22DQ/SGtOs/BBLfMWrwCXr8fsLaC96PsGEdVFAha2C2rHd2ZwNWa55rbD3G1R+44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgO91VuBa8uKsvm0QqlQV3r1XgKsrzFfbhsuUZ8OLvw=;
 b=WETQiToJOAdNrowBdUAKbwZoBuo90yCpQ8xSgNon8FakTMg3jovJsWPHHCdo/2nXi6ezWWlyMmHLrwjeCqKSnyEaBgehxbFDGcpiqt9e8T2OUlKLgnS5MbMRUgnIKYobWXclO3pOs3wFenE79TCee+FGHJv9IE+qaIMEwxL/11zKlBgtqcfVo2P2Q0pq3xmOEX70QqqFGhHF4P/ZW/rgwoAuQnp/kpMJ1J5NphU/wqay5dPSQzC9W7z6g1WRKYxisd1bndvMqX8K8YGV/9DVBhhNpG+jpkDW28/L3vL+bZlUMTNsAq+rJEgxd8ZtisoeuI7aiGjWSQha7/3EkpmwRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA3PR11MB9063.namprd11.prod.outlook.com (2603:10b6:208:57d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 05:06:16 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 05:06:16 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_fault_injection: Inject errors
 for xe_hw_engine_class_to_str
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_fault_injection: Inject errors
 for xe_hw_engine_class_to_str
Thread-Index: AQHbpRFgdshjqJIKvUGrtdInpQZrt7OS68oQ
Date: Fri, 4 Apr 2025 05:06:15 +0000
Message-ID: <CH3PR11MB84342B9335758ADA4A128E9C8DA92@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250404031052.1848936-1-sobin.thomas@intel.com>
 <20250404031052.1848936-2-sobin.thomas@intel.com>
In-Reply-To: <20250404031052.1848936-2-sobin.thomas@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA3PR11MB9063:EE_
x-ms-office365-filtering-correlation-id: 349603b1-e900-4089-ec18-08dd73366d8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aZybz+HzqjcHbBtX1jRhmYYhjSii16YinkBW4cBAOjZFrlb2VWClzmySq8Sq?=
 =?us-ascii?Q?gMTUT3xPXk+PmBzWlNScquGfhrpSdo16raNhoZvERyv4J6fW5RHBtEMdthxf?=
 =?us-ascii?Q?7lPXXJjNJ/fHj94gpPTOvX4GL56WjczmcsaalNd0VFU/jrt1yIiuecTR8l9+?=
 =?us-ascii?Q?xL9KYwbfMZ2P718VZNuWsOMnF0da+sfeNC3ZlaiRbjWFqFLJB+yo7f/FItPB?=
 =?us-ascii?Q?Bgoiiync7VGUaMIyFgyMMAmphDixD/uspruIWEpqeeyGukWO2nqJURrHBjY1?=
 =?us-ascii?Q?oO10XKdBIe66sAi4vS5JG86qQlbB6l3No4NKstA4vnbeh40Jxf5HAXeWwL1h?=
 =?us-ascii?Q?uOVCJyPXTyvTgVFmrDk/CgmGn/EbhUgx2r4F/FUPTjyS2mGHt5WA0pxNo1+V?=
 =?us-ascii?Q?uqBNu/CsPeVewK1WW6L6rH+pml8Nwjhhz/Aj48VKKFOEgoNTU1EaTbUY5RGZ?=
 =?us-ascii?Q?8AUT52DlylzktrTtvcAo7so3mxZvSNqne5QCwaJyxIR1LWGtY6B6KXnA7RI2?=
 =?us-ascii?Q?cjYm5bIq/WsnuU0Jr9zGM24ktf0PODkd098blIxrmNrT+wdrGFyWrCDcDXcE?=
 =?us-ascii?Q?RrC/WXsKD1WbIG2gmeQNsHKGkfmV+he/MZiAGMCcOPMUc0FTBQU+jVWBUwlr?=
 =?us-ascii?Q?W0y4doKpsikafvZOamYjVUfmLJ3EcX4xkWryPv9FYrWuCGilEEK+IR212p9M?=
 =?us-ascii?Q?VeprwA6CG+mLxyyeKo7iNqy2CoTb8VlUciEhsM2zGWOUkfLFC3vTBVZRAXUx?=
 =?us-ascii?Q?CaMhHYI2KQbEFVw2LwrLbNKvU7+3zWJKLgfmWgn21m1mbuJ9FHrGkwxyKbFQ?=
 =?us-ascii?Q?YkLctK1Hh4CUWGcejdb8lhBNYALL8hkQ72RFttfq10Z7lsiK2WGZsdRUEjKJ?=
 =?us-ascii?Q?0P3p61dP8YpcuzWIGhOPxal4e+1ZrOX3o5Qp37xxLYhfeef/T95aun3SNpon?=
 =?us-ascii?Q?h6m987/Z555HdjkoIhJ5JS9Ydfkeo24L4dkoULLctfZ/nJuKNfglzM5Q7mcq?=
 =?us-ascii?Q?xQrLewWhs+v+SbI5N4gIYqcl88NZbz01l3PI8QQ1hy7jiU36RJRWFW6x4ldl?=
 =?us-ascii?Q?8+6P4mi5draJGzgwgH74rTVQ2eLD5IJQc/2TAorzfr0quIDGVN5Qc1rFN9Kf?=
 =?us-ascii?Q?La9hBRhX4+VYrSKnRx5LAn2IucSrJ6C8o7n1mEUhTgilu1u5obtlaKKAEL+W?=
 =?us-ascii?Q?fUETuijbhzNdgycch03buIgp41u28clkNspm8b88ibH83Y3GsDPqclS0PyRn?=
 =?us-ascii?Q?bXLhxTnkOG9tUxRdJ2IQ2MyBt7oH6SRfzt1nny3sUxNL6WzJlpkZEfE99P3o?=
 =?us-ascii?Q?e6WMh7Obten7lgl/D1mOiYjWyv4aYExbIyDR82PmQ7zq0JFM1D8EQAgMmPa9?=
 =?us-ascii?Q?a9tysIEBvp5hk18NHw1gJUF95JwX4Udrjg0kDzj8G5d1xjEONmgJiSjC+rmh?=
 =?us-ascii?Q?2frMz1AbNk/JcVWKqHL1MapI55UZiacG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ohXf2a8aL76OAXs012bhSFWfTk1Qmy6AhzvgGIiKOsMhORgJlJGrzA3uE+06?=
 =?us-ascii?Q?MWUexPGOpS6at34Acuq7HtnMmTJ/Zsy0h5nZZoamGG90ZpVFyd1UaMFgZFJ6?=
 =?us-ascii?Q?+c6rwOAkwLMLAlxaKAGwe3isSfso4LgMnAnbxWwkNr7zIpYA1vmMAww9A1XR?=
 =?us-ascii?Q?k2gX0qWBm2rZPr075WaFOGDGTEHr0NFh3yJqGn/LGPFbEVwOabaeM/mNRHAF?=
 =?us-ascii?Q?vKGCeZiD1Q52387TD4yOo90B6f6W8bZZJr8rhnnJWNWwrJqjB6/P62eSeDIn?=
 =?us-ascii?Q?j9KwD2/vYn6XKnwkiERchJOMbdT9f+/UuP0+17azoQkz/N0eK8bDw6rsE4nx?=
 =?us-ascii?Q?zU1WKTKSzCNDLfEYpqrdl3TyyOXASB9ZGdf3D+pRFkADmODwHeOgpDQWEGzi?=
 =?us-ascii?Q?a1xS+4UAyMMvyQ7ZXj9K6pp2cOiw2hnvq7K+lZFbocpOjdssaSN6r4IYqIir?=
 =?us-ascii?Q?dXfF1PSBZ07X4DoM0t/tbmfKcoMgu/Opk3tz3P+S2YYoasSisoMiUhJW9Fjl?=
 =?us-ascii?Q?x2wd3UanTAWRhVBUTW6nmYx5Za69tGO+CtOBmbL7pjCji0S2vnH9aOrIquPB?=
 =?us-ascii?Q?Svcs5z/5oKYccI+xoUqahuMnY5wpr8tmBuIWpi1lKUFaVpHXCRItJv38JNtz?=
 =?us-ascii?Q?K7RwmKmt0mjdJFvjGSFfnhH98i7WunamdMLYIgoOWHQHFbkPfLZTix5V6766?=
 =?us-ascii?Q?kao+tawAubOIL2HW0AJ+lCSVUCC1nhoNQVg4UOVc/8EOBwNwh9UnACcpDnzx?=
 =?us-ascii?Q?W6iGWiELD6a40DGp1kS9NQUL+wEBBJI0npiKJGcw7/eQrqFFHLoAmc/VJlT2?=
 =?us-ascii?Q?RdDVnJIGgYqCxvlj7obcO0svTHn9rkVHF5Dm0WzC6t7Qzi6CbRM4Ec0AZayR?=
 =?us-ascii?Q?rlALsJBl2cra3S/H9/KvBLjmsAfzcJCwI7zy8DQbqtgsVlukbJboU/0QgXDn?=
 =?us-ascii?Q?XQSUPgxx0Loa2ToDc5XS5orO8qTuqCW44a+SH0imwPV82nMHLGiUAgYZAIVv?=
 =?us-ascii?Q?tucNDOyNF7B4Zw1EVykg1dbcLG5yENv2hNtVUz9zx3DkTXK52cb+JYP/iyrg?=
 =?us-ascii?Q?QT5WPNSKTvOuV8kqvS4ScoNfwYO0HizjHv640rmJK/DCSeht9ZJn0VdLK2qu?=
 =?us-ascii?Q?hX0rIBNNqn8uzMGXLIlshkHOIYcNY9pt/CF/qhilgi5VE71p0uWWpMwdrCF/?=
 =?us-ascii?Q?phHvIQtKndjsBENXp+LzQXvV7/n4gggaj8M844ufYisqBpy0JI+WCLN05Kwp?=
 =?us-ascii?Q?rpP4phlO+DNng6oUHHWCgEM2t/iGLfBddaiIk5LyboUwg7N3QGcGR1zkViVs?=
 =?us-ascii?Q?CWAZAFBBhcKf1hNrIGj/Oej+yeOTB/5d2jLawT556gIeeejairl/97etmMpW?=
 =?us-ascii?Q?BYbg2ZEDr434q1q8K0OMnqUTt4EtnTu2BPVNdSAh1MWMcb/wXEiCXTZVD4S7?=
 =?us-ascii?Q?MbybjxIVO/dEO8S6NqUWbfjdmI/nb0iySk7B4E/uHXO65ZQySJpL5+DJYGQJ?=
 =?us-ascii?Q?7P7IBwnKp1jwgXM/dq7GgzdZ8UgIB6303nuf9PWC9CYjDyTZHuyQdYvBSDoO?=
 =?us-ascii?Q?ZJPasd1uWyJEQa7vlUXs9mQmKhkXcg1g/iWiNYsSSHKiOM6qRUympl/GA66/?=
 =?us-ascii?Q?VIIGNl+MyOXj67YPUAUsgTAU6eywoO8D/ioM3t/V7mg+yFWQUGGG73xYy9Sh?=
 =?us-ascii?Q?FYTG8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349603b1-e900-4089-ec18-08dd73366d8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 05:06:15.9223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iM+jpTJNnMvP2wrbwygtvCNzb/5frkHDLerwkapNqvDwc2EnkTM7mfJ4Qba4tQv7B1Cg4CJIJl6uMY4dtE0bU3xyuoJA0fSWvi6Ae9QquvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9063
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sobin
> Thomas
> Sent: 04 April 2025 08:41 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>;
> Konieczny, Kamil <kamil.konieczny@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/intel/xe_fault_injection: Inject errors =
for
> xe_hw_engine_class_to_str
>=20
> Use the fault injection infrastructure to make targeted fault injection i=
n
> functions xe_hw_engine_class_to_str and check the error handling in the
> xe_hw_engine_class_sysfs_init() so that more code paths involving error
> handling is tested.
This is already handled in the kernel, that is the code path is covered, no=
 need to add this here.
name =3D xe_hw_engine_class_to_str(hwe->class);
                if (!name) {
                        err =3D -EINVAL;
                        goto err_object;
                }
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 24c114ba7..94c1bbf38 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -173,6 +173,7 @@ static void set_retval(const char function_name[],
> long long retval)
>   * @xe_guc_ct_init:		xe_guc_ct_init
>   * @xe_guc_log_init:		xe_guc_log_init
>   * @xe_guc_relay_init:		xe_guc_relay_init
> + * @xe_hw_engine_class_to_str:	xe_hw_engine_class_to_str
>   * @xe_mmio_probe_early:	xe_mmio_probe_early
>   * @xe_pcode_probe_early:	xe_pcode_probe_early
>   * @xe_pm_init_early:		xe_pm_init_early
> @@ -388,6 +389,7 @@ igt_main
>  		{ "xe_guc_ct_init" },
>  		{ "xe_guc_log_init" },
>  		{ "xe_guc_relay_init" },
> +		{ "xe_hw_engine_class_to_str" },
>  		{ "xe_mmio_probe_early" },
>  		{ "xe_pcode_probe_early" },
>  		{ "xe_pm_init_early" },
> --
> 2.34.1

