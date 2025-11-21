Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EB5CFC280
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 14:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F5F10E023;
	Fri, 21 Nov 2025 14:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKvAreN2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E556710E010
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763734281; x=1795270281;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sqxG78AtRUVYnOJYpCMmfYco7v7RdSFLfeAQNmxDGi8=;
 b=BKvAreN28eRh9vVnEeC8RML0wgsqD0QiJQ9SlCaLT/DvOShGkXLqLXC8
 Rhj0DC220XUhDE+zI/FRhNzlMy1T/p2bl0TItme7VxM1pXMY+p6fBESz6
 KbIDQxcF4s1BupZv79Sj2N/0V3Ev/du5CXLlcttHdnd8NA69vK+7GJ8IV
 clmYa2qOwu70g2Qhm0A53PYumaxG2zugaxXJftkO7MwOY09aVm/dope7G
 PQKEua9Q2LlrX56pdKfocQ+pbahhpSFaeJgoDmWCJ+VZMwKwTTP/NXtI/
 +XdgGwiVJGIj02B29vt7VImY6eXOgPDwr3zEsf17MJm+USjYpqNLLpXHe g==;
X-CSE-ConnectionGUID: InHA4LFQSxa++/LbiKdFpQ==
X-CSE-MsgGUID: uZrFYBKqTeCYHLBxScmgbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="91308128"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="91308128"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 06:11:21 -0800
X-CSE-ConnectionGUID: i3/dGLVKSbyb0122ZwmujQ==
X-CSE-MsgGUID: jYO0OHNbRuyVIlh9i6HKQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191381086"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 06:11:20 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 06:11:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 06:11:20 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.66)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 06:11:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwLpSVWssOECtk1UomfSPR9o+W152o7oydM8218WmY2UR/fAGt3j4Rk1GhNoMxRDNxBrZBINee0+ZX//tDset0Rr8XIQdTTPykS7I9hU/eDQsg/JbNFFvQKgy38KKJ0TgrnAftXFXiWr0W8IxYNhfo1uhtEVQNouvGgu99AUwZxv4plJrTvbytJ9TvYojGgwo6bhRnhEU3HpawMEbyd/L5URutjSCLhWQ3vyoYF85KXTro70nigaSd59+9FhNMZer0WuruwCB1wJcRj1+Z7Nin71UnoXOVVVHnAxySv+efBrU4wliKzzXPyXp+hYTYBpkZ5v0zyR8kZulsX5a/Yi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eesniu2QgiFnh4nMSzt32jgW2P3BRMLbL+9WM3enxz0=;
 b=TA0Ey7Fu+oaGJkIIvc8tdn2eFy/AnLVq2Bnj4ewUriCmcc+De8Di6ZojvyG9Tqe3bZjmebXOBpoov11hZ7k/bnCugheh0AzalbWDqhh0rcXc+iOBaVm5iplxGp5YhADvTlC19+RqifhN6xrI8nwJQmzQDeav8z5e1Sxx5aMo4AOH+svuKMFbbCfdEytNHFZxI/gedOerTG5ui57YRa3WJfzu4mm+SeEGfVnx1eDVjxH5qNEWREd315CHocO7d9D5FPO9Y6/WyHn1Df4Y+IsgiQdGgViCFmmpqLYcgds6HpLRZqOm4U6sfhWjQwGKZo07hOMXMAY53pN3Rv1Gcn6tDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16)
 by DM6PR11MB4561.namprd11.prod.outlook.com (2603:10b6:5:2ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 14:11:17 +0000
Received: from BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c]) by BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 14:11:16 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Nishit" <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v7 04/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU atomic operations
Thread-Topic: [PATCH i-g-t v7 04/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU atomic operations
Thread-Index: AQHcVMIT+5AGyn4M/kKa1m560luZ77T9Nukg
Date: Fri, 21 Nov 2025 14:11:16 +0000
Message-ID: <BN9PR11MB55292BEDBEE57F51A83A9A6484D5A@BN9PR11MB5529.namprd11.prod.outlook.com>
References: <20251113170456.635343-1-nishit.sharma@intel.com>
 <20251113170456.635343-5-nishit.sharma@intel.com>
In-Reply-To: <20251113170456.635343-5-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5529:EE_|DM6PR11MB4561:EE_
x-ms-office365-filtering-correlation-id: 07d76930-c999-40fc-aadf-08de2907d63b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?sJa5UNgR/0WxOE3zFA8YQNAz3In+cPptL0NXfkBP4G6V4lKkIFvizcgDWAee?=
 =?us-ascii?Q?RRjaWCq5yJl9duH1a9IJW08cW8iBcJIlVUyzJnaMlDaQ/uSGh0es+ycn4Io0?=
 =?us-ascii?Q?/ji4pJjZqFKTATUslJlEwnLRPOi7fDouKy3sJIDYdZeH/o+pqGiI4G0K4R4I?=
 =?us-ascii?Q?OQr8KQuqd3gGIOXVuqbEcD2dPbdmRQH4oRRg905oKfhQcnuPq03sK/IM9yg8?=
 =?us-ascii?Q?pWCCIotAhZb4QLd0IiI3BI+Anfw5wht9miWH3zxVkLlClXBq4/xJVabibl7F?=
 =?us-ascii?Q?5OFqObZeKQDihgBsCqKyoSYiNR8S+pgdKni+1CrYJWZQJwUnS6OhmhVoq3zX?=
 =?us-ascii?Q?Ph4YQeXt7yTzTxsp9KErmcCxpUV1F9vtQ7euanTliHChG7IBJ9unQisW/oH2?=
 =?us-ascii?Q?J/RgSWhQ7FciyYb+0lI/WHyQNemex2VV+9ZkptRiv/I5lpczO0VGF37ZidU8?=
 =?us-ascii?Q?FOvwrg/Pksi8veohpmHARhIh9X24oEDRRKFHVzM9GtjfKwH2kXwQKITDCc3z?=
 =?us-ascii?Q?glMdV5kmp4d4Fm0xJ4QsgiVx0tTaX+4tWyqf0NWhA2cZgDp8B42KzM9PFq8V?=
 =?us-ascii?Q?/sdvAwoVGFg8Vq4EjJWmWj10Bx0z4nL4v1y6Ff2O2uIXCPEabIrdVYXf+B5A?=
 =?us-ascii?Q?yAvZIfG/T3nJuwV2guAigOj48LodtTNOiKnFckEiOEZ9bnvfChhFZ1vQOCCB?=
 =?us-ascii?Q?46mAy4qNLCeOxcxSz8bKcXwIcpvOtU7WWDXbnQeY+HL/zjDblTxzjEtHTceI?=
 =?us-ascii?Q?G00rMTCIACP7CIF3G4wpoU4emvyGF+vsL/qOUcQJMkfuGKPhcV7VuK3vA3IA?=
 =?us-ascii?Q?lZK4Nc7T0ByVXO98XSmNjMm8ERl9sCLal3ec2jSMVaab8WSjFNXoII7tELkJ?=
 =?us-ascii?Q?BtDLfFd18CC1vAdOn37iKLvVBgx0x6zs6KLvB9uRLj2/boS0o+gPSOjUN5L4?=
 =?us-ascii?Q?munLTRcjSXSWobTKn8QGLMdI6yRevS9OvKIgtq2fC5UdWtRHl5jhyJf8oh9W?=
 =?us-ascii?Q?dubsgmGgdq6cJ/YLoNnShZpA/9HfNpKO4kZd4jBW2knYaLOwQHAVS4PeiM+B?=
 =?us-ascii?Q?lg86ekDseJXFkzZxIHCbhk0we6oIbdyRq/WCqoPPgI64uBF3LApZcyFnVd8/?=
 =?us-ascii?Q?K+tXHbcSZFSZ6SnWeQ6i6RAGlWJ1wStmohuWLYhKMyjccY+NfbZk5JB5OlU+?=
 =?us-ascii?Q?mRfrZSeVO7S80M4c2bCT9CMDfXACian2Hyj9L3RSzS66WWrAmb9tnnyCarF1?=
 =?us-ascii?Q?lg7KIXeLk6l/m55ETozINP17jrOF+8o6NYK3PEADU+Ygwk5nJRCD7L8M4aJN?=
 =?us-ascii?Q?+qGkTpDsq/tJFpHBBeuyab+q5okhXAkQaU/Wy0EDtW3HE8K1eIMppgws1aGo?=
 =?us-ascii?Q?nDHEzVZdPS62O6jL9h6+0AJo6KQKcw0pjCFHN2inacDlA6Nx7FU//hfwCCs7?=
 =?us-ascii?Q?Nn32mT2rvQjv920ZyTi1SSBVxP35bbtNMqKg80VEzYfdkIL16LaIDBpfgxCZ?=
 =?us-ascii?Q?1Sj4VZZBwoLXmBQfacTn5zU50JHTfBSnlYBv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c2AE9Fv6sDlT0JxueiqdvDFL2DBCa3oNRMuzM1dmHLWIun7WbYbp8NuGMZPp?=
 =?us-ascii?Q?kw9U3j5o8hsS01UZGwe6LUP8B2wCvXkJUMeKjPaIKTRUrvIu85wnhRMnEYZ6?=
 =?us-ascii?Q?hqjsoNscQSNgA9GUU6Dl1ZBN1GrsjlBCq1Z3I2gyn5lKBwHr4rj10sxt9PWN?=
 =?us-ascii?Q?OfDb5MLRsmYJw4H1fWayMaDG1J+LI3R8as0YrDvgxog42RcVze+EQVjpvm4l?=
 =?us-ascii?Q?lW4B7SMJJksGZeMPEOtl+GYrsWnj1spYVGIP/IjU8VtbHUSaG8eROtBh7Xu1?=
 =?us-ascii?Q?bsTHgsWw6Atf+H+4I9g29c7sv5saWDmmmgwVrjQusDJVOt0uHCxvYQoHkik8?=
 =?us-ascii?Q?eWJKI8WYp1MaezQd9Cs1jtdt4TJP4PVjI3YqQ100KP4PUrM+s/GavskyjhP5?=
 =?us-ascii?Q?PN/jwrzJEMna03wlLd5Qs5P7DyPcegAbUqc9d3qKjUg4Ew8NFxZVvykbzaXx?=
 =?us-ascii?Q?JeFz0bOTPLnFzCqjCbcyqF6zbU60+NStF0KOt0PMWwCme51rKN4asifqJ1lw?=
 =?us-ascii?Q?7bs3IbIMkzIetRJ0qiyyW8h9UGjkn+uAIeqzLCi3xSdPUC3icV5ndHTiAUlq?=
 =?us-ascii?Q?XdwM+9bJ0THZYXL6g5BtSZVPXtVGX19PS1Ep1jN5jDDl4N8XR2bXiBvOVbE8?=
 =?us-ascii?Q?apGUNRJZsGsQUPAl9JcuytjvJaLWzF3AcNI5qXbW+RfdtMosxyQSOeqg3P2l?=
 =?us-ascii?Q?Y+Rab+9kfXRtJ1dutK39D3PrGRly8fyL0NFAc1EsBasyFTariHxSA0sdiKxi?=
 =?us-ascii?Q?KUFEFvkPQ1oSy/bgUMenLPjoEuorLvxBEWwl2VHen+KYFtRy8IoxY2H2mN9z?=
 =?us-ascii?Q?PtzWIKGdljJ4HymJ3pnEpqgsEbcoxRKYt7HSIUEEY+cansYNTzYrW31ZeMKI?=
 =?us-ascii?Q?BUsRDxtdbH6x5FULPX7Vi9+t3TWfworB7NUCeguwFgucujnv958l3az77Awv?=
 =?us-ascii?Q?SHgA8jRHGscg6fUktjPIBdv6V0xNTljnuZhtAqJ2DFwHwBnpHOHQC8afZvA4?=
 =?us-ascii?Q?AyEJMI/Fh65Fyvil91y/cVrPFYVuxczLShKNEHHzDybCLENy/l/GhIQ87Stp?=
 =?us-ascii?Q?Lpo/PSTPiMwGNWJM8RbAlsqMUHFygklLaVY0epWlHt49TeUImwSvw8Rhg46y?=
 =?us-ascii?Q?7dvBAQB/mt57JseVJLljDgayUoyZ6yhrx2pnXUTOX4GHjhq0SJcLIA16MA/u?=
 =?us-ascii?Q?EyEgGd3MXrZXpceRGvnph070MiOuuhhWfAOFNXVH+UpmAg9pu7c77UH5ktJy?=
 =?us-ascii?Q?1zLxhJDMNOZ5UkWtuuQjByjBLI//xopKB2T9nEM1Mhyc8pW3gui+cvtRIuut?=
 =?us-ascii?Q?Hs0ZRw3r4FP6YU/aLFC+Q4bTz8ScxA3cDLytj1mAOtYZWoxjlY8Ci2ECEizd?=
 =?us-ascii?Q?a10kYtBegqjaiRZ2Cgq2oa8BbgIQ0KI7sFeZ0RaHO8l6s69Vp3oPFUe9vFEp?=
 =?us-ascii?Q?p3nkkzR1ZZ4z7qntbkuJt3ysnUPZE9nnmQRB0ak+BmflGRSt95WxZF8LfDQb?=
 =?us-ascii?Q?GCSIy8j5vnEi3N9XMCrMt+LNnoQKYRtup2P651zcyIhhOoyEQRBXIogwNTdu?=
 =?us-ascii?Q?3zohRUVg6ql+PQXvc+RA+/uHMf+S8ZR7wojK9om+mCTyQKdV6BUZkzg5RelH?=
 =?us-ascii?Q?uA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d76930-c999-40fc-aadf-08de2907d63b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 14:11:16.8817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nr5U02TW2h6Ocu7JNcAMROCJhr/r+rAfTr7yYM/MdJ9NRcoqCKpBHkza3RBMmykN7aBBONDMOVtX+3xNQgFHhH4Jm/i/HVdqBy7VH7aHyYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4561
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> nishit.sharma@intel.com
> Sent: Thursday, November 13, 2025 10:35 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit
> <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t v7 04/10] tests/intel/xe_multi_gpusvm: Add SVM
> multi-GPU atomic operations
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This test performs atomic increment operation on a shared SVM buffer from
> both GPUs and the CPU in a multi-GPU environment. It uses madvise and
> prefetch to control buffer placement and verifies correctness and orderin=
g of
> atomic updates across agents.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_gpusvm.c | 157
> +++++++++++++++++++++++++++++++++-
>  1 file changed, 156 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.=
c
> index 6614ea3d1..54e036724 100644
> --- a/tests/intel/xe_multi_gpusvm.c
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -31,6 +31,11 @@
>   *      region both remotely and locally and copies to it. Reads back to
>   *      system memory and checks the result.
>   *
> + * SUBTEST: atomic-inc-gpu-op
> + * Description:
> + * 	This test does atomic operation in multi-gpu by executing atomic
> + *	operation on GPU1 and then atomic operation on GPU2 using same
> + *	adress
>   */
>=20
>  #define MAX_XE_REGIONS	8
> @@ -40,6 +45,7 @@
>  #define BIND_SYNC_VAL 0x686868
>  #define EXEC_SYNC_VAL 0x676767
>  #define COPY_SIZE SZ_64M
> +#define	ATOMIC_OP_VAL	56
>=20
>  struct xe_svm_gpu_info {
>  	bool supports_faults;
> @@ -49,6 +55,16 @@ struct xe_svm_gpu_info {
>  	int fd;
>  };
>=20
> +struct test_exec_data {
> +	uint32_t batch[32];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +	uint32_t expected_data;
> +	uint64_t batch_addr;
> +};
> +
>  struct multigpu_ops_args {
>  	bool prefetch_req;
>  	bool op_mod;
> @@ -72,7 +88,10 @@ static void gpu_mem_access_wrapper(struct
> xe_svm_gpu_info *src,
>  				   struct drm_xe_engine_class_instance *eci,
>  				   void *extra_args);
>=20
> -static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
> +static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
> +				   struct xe_svm_gpu_info *dst,
> +				   struct drm_xe_engine_class_instance *eci,
> +				   void *extra_args);
>=20
>  static void
>  create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
> drm_xe_engine_class_instance *eci, @@ -166,6 +185,35 @@ static void
> for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
>  	}
>  }
>=20
> +static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
> +
> +static void
> +atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
> +		  uint32_t *bo, uint64_t *addr)
> +{
> +	uint32_t batch_bo_size =3D BATCH_SIZE(fd);
> +	uint32_t batch_bo;
> +	uint64_t batch_addr;
> +	void *batch;
> +	uint32_t *cmd;
> +	int i =3D 0;
> +
> +	batch_bo =3D xe_bo_create(fd, vm, batch_bo_size,
> vram_if_possible(fd, 0), 0);
> +	batch =3D xe_bo_map(fd, batch_bo, batch_bo_size);
> +	cmd =3D (uint32_t *)batch;
> +
> +	cmd[i++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +	cmd[i++] =3D src_addr;
> +	cmd[i++] =3D src_addr >> 32;
> +	cmd[i++] =3D MI_BATCH_BUFFER_END;
> +
> +	batch_addr =3D to_user_pointer(batch);
> +	/* Punch a gap in the SVM map where we map the batch_bo */
> +	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr,
> batch_bo_size, 0);
> +	*bo =3D batch_bo;
> +	*addr =3D batch_addr;
> +}
> +
>  static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>  		       uint64_t dst_addr, uint64_t copy_size,
>  		       uint32_t *bo, uint64_t *addr)
> @@ -325,6 +373,105 @@ gpu_mem_access_wrapper(struct
> xe_svm_gpu_info *src,
>  	copy_src_dst(src, dst, eci, args->prefetch_req);  }
>=20
> +static void
> +atomic_inc_op(struct xe_svm_gpu_info *gpu0,
> +	      struct xe_svm_gpu_info *gpu1,
> +	      struct drm_xe_engine_class_instance *eci,
> +	      bool prefetch_req)
> +{
> +	uint64_t addr;
> +	uint32_t vm[2];
> +	uint32_t exec_queue[2];
> +	uint32_t batch_bo;
> +	struct test_exec_data *data;
> +	uint64_t batch_addr;
> +	struct drm_xe_sync sync =3D {};
> +	volatile uint64_t *sync_addr;
> +	volatile uint32_t *shared_val;
> +
> +	create_vm_and_queue(gpu0, eci, &vm[0], &exec_queue[0]);
> +	create_vm_and_queue(gpu1, eci, &vm[1], &exec_queue[1]);
> +
> +	data =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(data);
> +	data[0].vm_sync =3D 0;
> +	addr =3D to_user_pointer(data);
> +
> +	shared_val =3D (volatile uint32_t *)addr;
> +	*shared_val =3D ATOMIC_OP_VAL - 1;
> +
> +	atomic_batch_init(gpu0->fd, vm[0], addr, &batch_bo, &batch_addr);
> +
> +	/* Place destination in an optionally remote location to test */
This is not remote location. It local memory to gpu0
> +	xe_multigpu_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu0->fd, 0, gpu0->vram_regions[0],
> exec_queue[0],
> +			    0, 0);
> +
> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
> +	xe_multigpu_prefetch(gpu0->fd, vm[0], addr, SZ_4K, &sync,
> +			     sync_addr, exec_queue[0], prefetch_req);
> +
> +	sync_addr =3D (void *)((char *)batch_addr + SZ_4K);
> +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> +	sync.timeline_value =3D EXEC_SYNC_VAL;
> +	*sync_addr =3D 0;
> +
> +	/* Executing ATOMIC_INC on GPU0. */
> +	xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
> +	if (*sync_addr !=3D EXEC_SYNC_VAL)
> +		xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr,
> EXEC_SYNC_VAL, exec_queue[0],
> +			       NSEC_PER_SEC * 10);
> +
> +	igt_assert_eq(*shared_val, ATOMIC_OP_VAL);
This test only doing=20
GPU0 writes -> CPU reads=20
GPU1 writes -> CPU reads
GPUs NEVER communicate with each other
Only tests GPU -> CPU coherency
Missing GPU <-> GPU coherency

am thinking if we do below operation it will be good.
GPU0 writes -> GPU1 READS what GPU0 wrote -> (GPU-to-GPU)
GPU1 writes -> GPU0 READS what GPU1 wrote -> (GPU-to-GPU)
This test GPU-to-GPU shared memory

-Pravalika
> +
> +	atomic_batch_init(gpu1->fd, vm[1], addr, &batch_bo, &batch_addr);
> +
> +	/* Place destination in an optionally remote location to test */
> +	xe_multigpu_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu1->fd, 0, gpu1->vram_regions[0],
> exec_queue[0],
> +			    0, 0);
> +
> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
> +	xe_multigpu_prefetch(gpu1->fd, vm[1], addr, SZ_4K, &sync,
> +			     sync_addr, exec_queue[1], prefetch_req);
> +
> +	sync_addr =3D (void *)((char *)batch_addr + SZ_4K);
> +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> +	sync.timeline_value =3D EXEC_SYNC_VAL;
> +	*sync_addr =3D 0;
> +
> +	/* Execute ATOMIC_INC on GPU1 */
> +	xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr, &sync, 1);
> +	if (*sync_addr !=3D EXEC_SYNC_VAL)
> +		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr,
> EXEC_SYNC_VAL, exec_queue[1],
> +			       NSEC_PER_SEC * 10);
> +
> +	igt_assert_eq(*shared_val, ATOMIC_OP_VAL + 1);
> +
> +	munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
> +	batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
> +	batch_fini(gpu1->fd, vm[1], batch_bo, batch_addr);
> +	free(data);
> +
> +	cleanup_vm_and_queue(gpu0, vm[0], exec_queue[0]);
> +	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]); }
> +
> +static void
> +gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
> +		       struct xe_svm_gpu_info *dst,
> +		       struct drm_xe_engine_class_instance *eci,
> +		       void *extra_args)
> +{
> +	struct multigpu_ops_args *args =3D (struct multigpu_ops_args
> *)extra_args;
> +	igt_assert(src);
> +	igt_assert(dst);
> +
> +	atomic_inc_op(src, dst, eci, args->prefetch_req); }
> +
>  igt_main
>  {
>  	struct xe_svm_gpu_info gpus[MAX_XE_GPUS]; @@ -364,6 +511,14
> @@ igt_main
>  		for_each_gpu_pair(gpu_cnt, gpus, &eci,
> gpu_mem_access_wrapper, &op_args);
>  	}
>=20
> +	igt_subtest("atomic-inc-gpu-op") {
> +		struct multigpu_ops_args atomic_args;
> +		atomic_args.prefetch_req =3D 1;
> +		for_each_gpu_pair(gpu_cnt, gpus, &eci,
> gpu_atomic_inc_wrapper, &atomic_args);
> +		atomic_args.prefetch_req =3D 0;
> +		for_each_gpu_pair(gpu_cnt, gpus, &eci,
> gpu_atomic_inc_wrapper, &atomic_args);
> +	}
> +
>  	igt_fixture {
>  		int cnt;
>=20
> --
> 2.48.1

