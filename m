Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B06CE8D52
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 07:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DAC10E692;
	Thu, 19 Sep 2024 07:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+AHKcr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4B410E692
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 07:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726730796; x=1758266796;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HYdQWmkVi7EHJ8hxyWUKJ0nWVlJgtVVXIDouQQJyyiM=;
 b=J+AHKcr78eUzu4qbsCqtPB5FYAIcgCrHPxPgpvXj14lfNkuhrODX4jbG
 lQRUQomJfmR984fB1HOkHUawrYeFxHA9mMi6zM73uiZnTS48atBSBFLSj
 MmfvtsDD7nUxWC8yePwSx+ceJ/7bYTiA+cDUIlz8jNiAGY79x6ImjWlat
 fPgy8PNmqJ7nxQJWxHLVfTfXCk2iUUxqEXr6i1IgFwAoihw5aXv1OSj6y
 0MAB49L6+Yko9cv0W4D2yo1Pfbiizu023A74XU1W3Evbw7BJHHKBnk1jW
 rdt8TjZCio96oZqdDwuZvETyDC45C7PiJtMl2iORrs/EvxXQUPxgF5rgv g==;
X-CSE-ConnectionGUID: KTh9jFZBQCOEwA9yw0prmQ==
X-CSE-MsgGUID: p1mSCenoSpy6qex5Cvo2/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25619100"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25619100"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 00:26:36 -0700
X-CSE-ConnectionGUID: TXPA3UDiSXm06NpHPXL+aQ==
X-CSE-MsgGUID: UKk8M8m4SQyDHNNf2q9zdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74622950"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 00:26:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 00:26:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 00:26:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 00:26:35 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 00:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVuwckeAWz2LBLeHu6mPnXD+hjH6ZN3BE5dPgF9e3yI9lhnNK6MidkzRdO2e/7/yyCjjhDu85x9qIusK8hwBhX9h7Bu9MoPJrpG16r9WfTvbLQKlGncp8Gfs3Nk2nRGLw1hTH3t27/rq2dffYEluXwqpVCzspFjEkL4yEzAKinPzKcCdw0b96k7Oyb3H9xl+7wVAu5bjaISSB914AeeFp51pnXRP4D7fDeJIWsCbXHjX0SJemcL6JXmwRTH6ZLLLYeBOgV3u60m5VVP/asze2OsphkzqzedGKo417CsRxxg+CyRLLTy1CZePl1tc/QKdBcfOcWCXlmLRMA3M97EPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTFlJlUA0fa5X2yd16uAA/pyXcETRif12zFlYDuiwI8=;
 b=cQBOObbjVmpWMNJ/zRuQSpt144ZMd8DrE+5/IBehM+iuzLxpUm3berCC4U1xBWlL+oCUJMgPcAYy3GYjBJ3SKWFJt6hLrhhFwhI6hVgfavzdj2tlWRNzKkTVAZhWIG8HjfwzN/kqhEb4s4HL8gbDizOQ7DDOzVrGzWqmOwesFSwRnclRs5kKvNCu/DB6hjb4+1nA9rSldLWlAzP3zEJZrXHdqO2cTawVSXsOPyDPhUYJNg3TRdkrp1spNtH7KYXfr2872eYbGZvrtSXPS51+QuGH773neRukexEcqn4rzmnIGGGJezl/8iPZcmIUH3MYnWZcbQZFS0N2TjOSRgcVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB7759.namprd11.prod.outlook.com (2603:10b6:8:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 07:26:26 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 07:26:26 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_pm_residency: Print execution and
 sleep times
Thread-Topic: [PATCH i-g-t] tests/intel/xe_pm_residency: Print execution and
 sleep times
Thread-Index: AQHbClvuLLvl+5Z+r0SJe3nRHX2mUbJetXaA
Date: Thu, 19 Sep 2024 07:26:26 +0000
Message-ID: <CY5PR11MB6211881FE45A4CC469B203D295632@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240919063352.1607048-1-karthik.poosa@intel.com>
In-Reply-To: <20240919063352.1607048-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM4PR11MB7759:EE_
x-ms-office365-filtering-correlation-id: 23a63411-8f2a-488e-3c4b-08dcd87c5f02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Mn9m6tyeaLexf7yWjeOnsOArlkaVf2uqRY38c6LKmUkl7zFII5oihO5naSlO?=
 =?us-ascii?Q?s/wfZE/F2L9RmGkRgwz2yIKfBWNWtL6h7uISvTbaHvk7pViFMIr3A2+Zre+S?=
 =?us-ascii?Q?RCoa6GaAFeYvXUF90yiDLLr1DgiqpMEfyEr59SxxwqG11W/byUS3L4wh79x0?=
 =?us-ascii?Q?GIzI2OjfMiuB95wUY4hUbrsJOnJ7v0eQ4l1cSVrv9kBxVmHf/FbRdzCNUPQe?=
 =?us-ascii?Q?ESmvojWdCsvMS6Xc/f+Z7lu4/emwSo+bUdpyF+L9ltEAVU/Du/a6Ke3A7Pwf?=
 =?us-ascii?Q?Gndx/zKuoO/6tlUt6WtwZEWOSuiVekVi6jzzBFJlWoaQyrUUyneiQb5wcA5K?=
 =?us-ascii?Q?KZHY3ac6M7oP+btrp18GAVlX9CiMb7aXNep+OimvBlDVgwKS1Xhs52Hp/6CB?=
 =?us-ascii?Q?KVTuTb8eRrinhe09UYi2eG0IFIlEDZl+Sxm55OIA9OD4QEAXwI7j1b5zNw5M?=
 =?us-ascii?Q?HZhj5IUilzpmmNuqLchlE7XVYjCqSIKe+hrMXEtiIQKbxE/e6Ea8vmSrOQio?=
 =?us-ascii?Q?4DSCnRkqzYefyge3r5dCot9Hg775gM0lnyc7PgsyKfnXEliYXjPyTRiapJJG?=
 =?us-ascii?Q?7fJq8GcA8DwVTR/i0OsQq2qiwkaygEHwof0axsLdTCYG/PCguKsP7V/JUmIk?=
 =?us-ascii?Q?gEQMGAn1gSpMeytcs4nR6R3cCLGZ/cG6pL5QhOIXMYYKt1uo7RkykoxuECFz?=
 =?us-ascii?Q?0l2PwrScmSuuWFYOzhMWrwbiBwMr2tlI+n5pVgr1qx3Gp9XLHf36mRC0TOmF?=
 =?us-ascii?Q?P8gV5ucYKmL5wuZV9G3Undp7cuMPVXZXqQ7Jp8bFV7TCbhsA8btbhQzgAWcP?=
 =?us-ascii?Q?ejcQF2WhHix98V8Rx90+lSs03RaiX9t9d8DrW7VSs8PFgWQDEntwan7cCAWC?=
 =?us-ascii?Q?z68i7CKgZUEYAQMnl2fPQT1jbrygseuqbZ+/S7bPwpUve0JCQbTHkBKjs3+I?=
 =?us-ascii?Q?fK2lbpY/7oIRhYjQXJUM184cMEOadoUYq7Wx0XWsfhO7gvQSfWjN1dV9lvl2?=
 =?us-ascii?Q?C2RWPxF3UTlcKS0cycAQS4eKhTGDtInciESPHaC1MKOJolQF2+qFOcGGi+Yz?=
 =?us-ascii?Q?19IyrVvqi6BP8m47OB+Xr45W29SiD87SmJiPJ+Nni2bEr1FtQJjTL9XdH1E+?=
 =?us-ascii?Q?W6qU/b1uj5UVioUkLCJPg9jaiySI0bMhseO95FeCuzWrPDXVAWYZA/bi9C/+?=
 =?us-ascii?Q?ueDIDKh9xbhEAiNZ2G5ji4+BuTAKoYe/Y72ARMTQ07OumHIEIlfQfgdM3KXu?=
 =?us-ascii?Q?+P7asdAH0uq6Di+u2Isky8lWYaEtTTdbcHbs+uAmWwoUIJ3Fq2O7TDccH4Oi?=
 =?us-ascii?Q?tXeFY18BLnIhHx+ENUyEcgberTmugmNtSyZi/daGIzeiEHO4BdC+kBD9OwFr?=
 =?us-ascii?Q?aFRkdCYAF0g5jXGw2Q8qi87AqiGp+tEyH7b/pmg/IwhjBJ+aRg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e/4bJEIA5FXTNo85qmAq9EBszYv/7z5d5ZaDY6bX2nHzAv074G2avuaw0FTA?=
 =?us-ascii?Q?x+nFgvJbN6selzYQthD2exj9gZPy18atJhr+skKwcMr5S23dBwcaAFdAub0T?=
 =?us-ascii?Q?hg0sNPQp3j9mBAZ4HphXTgylCHn7n1wvR23ejejRhnnsqjPKQBf0d61T7pZB?=
 =?us-ascii?Q?/zH4vgfTj7YfOYNPZeoQ7TY9k+hIs290Dpp8txdqzrkDutWsz2u1WmCLBMwB?=
 =?us-ascii?Q?4GX6hVP1wLrVFfK9OKa4LI888ghJZFjKATfc0rqq0xoeK5zF2wXr9IRsQxjx?=
 =?us-ascii?Q?Yt6ujjyycvmm4TDoS7upzuIqnRdOefiYgQcKWWhaeZkRmMI8Vo/BNiQzh0l3?=
 =?us-ascii?Q?vlpRC8jCoLb+B68Xg653xQwrTJRNldYdkICO8nEfIWPyxIYwTdVBHkoji6bY?=
 =?us-ascii?Q?JuRDkxs/CalDzxN76VYLPjy5NCj5SzcFomyUQQznjfdJZuUe6oN94kkEvPZy?=
 =?us-ascii?Q?ymYr9kgFzuaWoneGa+vlyn3i4m8phD2HguXoiq8hne/IaHlT8CaGRBgXAPyf?=
 =?us-ascii?Q?vN/suuFjwdaSF8LZAj4zUZ/iTFAgvIPTtgJ20uDAP/lVXZOqx2bC6+6r7p2n?=
 =?us-ascii?Q?cxUqk+8WpkTeYXcYnBxfgzxnNEIf7eU6wTn8rfMYInEzWsNDidW2dI8dY0u4?=
 =?us-ascii?Q?amMvViu/2bqRWLNCIW6pRr6xGTD6UE5z3woPlVdDbNGKYO4XQ7H7iflTOEbc?=
 =?us-ascii?Q?qSx0KLc+caagCeZFFgm4My8hba/zhUGqANQO/0xWpl9wWFc4jpbp339Fsp8r?=
 =?us-ascii?Q?ekHTJWabcNeaQCVQYOCrE4TnSyxfCHjwQJeWT3SjHBQHA00J51dyzS70bjL2?=
 =?us-ascii?Q?Qvf/EGs6QB7xNl3dC9c4HBXmrJhdsJZO7h4M+IVzz4SpRj60t4hP7ebUy3VA?=
 =?us-ascii?Q?n7fR1GJuwZEcl9lnPDFp8m8nh1ePvN569vj3cv7YyIyp3qFZNCHh9c48pacL?=
 =?us-ascii?Q?YL2K+Bk13cZZ8kgPEcr3NhfQmut7+O6b2S4WxdwxnvT9k4E2kty5NDPMpe78?=
 =?us-ascii?Q?7NEXYUKK7AlBULMBwqssETFrTTRGkQC0Ze6QKxbpXTjNBTUrxaUTCqyu4EbF?=
 =?us-ascii?Q?/wtrRGE1VifDnO47ES62FQ521EIIWp8OJnNSg1osKc+aBC/6ibG6ria1ltJY?=
 =?us-ascii?Q?fvm1nPGhp6kZg+HfUjuoYQ0x5KWcARwyA2U0zGjpvpLe8vg7fE+GpY5B7dE2?=
 =?us-ascii?Q?6RVEoF7BR9SPPpaLWxTu0iDQ5+i4lbQqn2fgdq92zM/ONAWCPluML4D32k7p?=
 =?us-ascii?Q?7Ebht+yYizrfaCl8naa97/1gsD8JfA+5kFrbk2e1jDiMKtK9Yw2weDF2LDm9?=
 =?us-ascii?Q?CAYdgr9Z4Z3A0aNh3EL1/Si/PuCVHl6e8UtdKeENO4q36VzP3BTkg7Jt6GK6?=
 =?us-ascii?Q?faJPp4HL+u3PyLxa9oH9sIWMIhhT/F25glQJQVqe4MTmnFp21oF6i17srr/t?=
 =?us-ascii?Q?wI+2kg3mAx07CqWJmWgxUxkH6cWDfjCqZQAPdQX5rXRXW+RGEWNeu4Vt6nad?=
 =?us-ascii?Q?bzixekSixORWXFBi1gupCKwQLWZOTQ14OfSW+OQpdDV5yT7DmGo6t5+PtyIw?=
 =?us-ascii?Q?IS0uKKNet/2YlzWU1fpEVCO+9UV1tNj8TGOp5j3F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a63411-8f2a-488e-3c4b-08dcd87c5f02
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 07:26:26.1058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AElo8djqjikITN2UbcN/HYjW7lvCI2lQr7E/H5GQlR+fYIw4tUTBlQOOoIb37Tf3y958+L7zZRzMcfKQRnjrYz854eow2alxiyzlF4nkJMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7759
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
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Thursday, September 19, 2024 12:04 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa,
> Karthik <karthik.poosa@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_pm_residency: Print execution and s=
leep
> times
>=20
> Print the workload execution and sleep times of the test to help diagnose
> timeouts.
> This will show how long the workload ran and how long the test slept.
>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c index
> 0e687558b..3c3b33ab1 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -139,7 +139,7 @@ static void exec_load(int fd, struct
> drm_xe_engine_class_instance *hwe, unsigned
>  		elapsed =3D igt_nsec_elapsed(&tv);
>  		igt_assert_eq(data->data, done[1]);
>=20
> -		igt_debug("Execution took %.3fms (submit %.1fus, wait
> %.1fus)\n",
> +		igt_info("Execution took %.3fms (submit %.1fus, wait
> %.1fus)\n",
>  			  1e-6 * elapsed,
>  			  1e-3 * submit,
>  			  1e-3 * (elapsed - submit));
> @@ -150,6 +150,8 @@ static void exec_load(int fd, struct
> drm_xe_engine_class_instance *hwe, unsigned
>  		 * Execute the above workload for ~1% of the elapsed time and
> sleep for
>  		 * the rest of the time (~99%)
>  		 */
> +		igt_info("Sleeping for %ld ms\n", ((elapsed / 10)/1000));
what is the need of this print ? 'elapsed' is already printed.
> +
>  		usleep(elapsed / 10);
>  	} while (!READ_ONCE(*done));
>=20
> --
> 2.25.1

