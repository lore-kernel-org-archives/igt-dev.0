Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCC8C87FC5
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 11:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5807F10E667;
	Tue, 22 Jul 2025 11:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpzjNq9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA0210E667
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 11:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753185460; x=1784721460;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7X7K7nmywWBn/43DXK51yVFJhB/Ncn2vo1sLK6fgeIk=;
 b=LpzjNq9puNSNDVmXa34IAs+F0Bd0PU1IFD8cqdcTVZ0VuKb0pzCUi5cG
 4dU/w8yptRU5RnwCjBa41sVH8rphQrjn/tWd1OvaTKBTkJR3GMc6E5mQp
 paENNLC1E7oFrIGDAw+RpahdN55LITAzryCWmZPu9yLwxbVbGa35XMq/R
 wx62hKXPBvW5N91oSpoCuTmU2pKqNp39RwQeHOEGhzkEL1dwI4iavan8Q
 tZX9FZp3o1IM8310sSnYWMVUJ4X5/KfQO3cOimKvOHee+HZB6fz3w+KfF
 GXBC4j+NZVHLLJcrTWvrA3B3iB5uL6vYdUt4PhcI6//BTE95uJcUesobi g==;
X-CSE-ConnectionGUID: Bm5l5SzuR1e4pPygNHi6kw==
X-CSE-MsgGUID: 9dNVXZ3ZQKiTQhe1plZEYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59229024"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="59229024"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 04:57:40 -0700
X-CSE-ConnectionGUID: uG9e2LbBTvus6aYo2BLYCQ==
X-CSE-MsgGUID: U9JRtGeyTWuz2u6dOD6XRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="158435117"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 04:57:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 04:57:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 04:57:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 04:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKZDUazWxWnxVhjt8XSVsdp+/bmaKxCiMK1tzoTsQ+6NfGK7btVhwsCFcsxrigxNpXjTwx+UsAD1Ggaex6ycKXdpGz2lhGEJVYl57/HJibj6E3ZcD3rbQhDfOO80TDMN3hmzM2zlHh5/3vAlvleJWmEUsAl6EnS7s4pIc5drFe87XgXiKzW4GEhXRnvAiV0h9OvyMK9s3NaX+Eg51T3k5rLrEkhO9NLs3Gy2zU5haj3ewL/TVNdjA6Ctg3BCUgCeLhzG5A7+x7kUERH0fWqAwE8YmNisTDgtXAV6odEQ5pRxMNeMLesp9xu1hBKvj22mXNG8w3IGSiJqQuAQ3V8qFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZwaLHrCF3lTVzfIpzJ9Oe+gMTA5GoFRdVpf62l1M2I=;
 b=Hhc4sQYraPHVsNZtGQBC0CzSVi/kPsAIFFiRcUf/0xAhpmPdW+H4GY14j9HKASRUYoW3b2wjSiMlO1IFboxy8eRmafxsQc7RyAAixF1QiMuLaZwrWnhKewhto5kz5M/nNGbvk5VQjaq6BIE4+5mSAAtgMUHRkWxRyWgqKBzWUWaVkTke27cSPkVXYOr+WSRibboVfm2h+VBs/A+0oYlY3m4g0uoZXRIuDBfSGjbZCISXi2iuRwRHsE5X1UGCBITHip2gWc09ikOlj1/Alij6TM8WsUuT+fDwTpPApHctrjL/Phhj0Y1YTHjHdvYtujwxNXNjQPkQG1TAuhXtIFtvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 11:57:36 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::b358:b7a0:d076:38d4]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::b358:b7a0:d076:38d4%5]) with mapi id 15.20.8943.028; Tue, 22 Jul 2025
 11:57:35 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
Thread-Topic: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
Thread-Index: AQHb+Mq28Zub37GLeE6+S007IYOu5bQ8ZRAAgAElK4CAAIJ5AA==
Date: Tue, 22 Jul 2025 11:57:35 +0000
Message-ID: <MN0PR11MB62070599B42A46DCAE1CC69B955CA@MN0PR11MB6207.namprd11.prod.outlook.com>
References: <20250719163101.3459754-1-raag.jadav@intel.com>
 <aH4YMMLcvuiRS2l9@kuha.fi.intel.com> <aH8OHZquwBBvODfQ@black.fi.intel.com>
In-Reply-To: <aH8OHZquwBBvODfQ@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6207:EE_|CY5PR11MB6343:EE_
x-ms-office365-filtering-correlation-id: c82b3f86-444c-4dde-b0c0-08ddc916f2d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ut9qH5rZM4dHlL+4pXrH76QJSg0qPuFZWdHsPF3RM25AKV7k7udA8kWgdNpg?=
 =?us-ascii?Q?sTsKjnYIepqbZv2ioC9epeuynu+MjG+N71n1/elqZF615lJg7KwIm3JMvnC1?=
 =?us-ascii?Q?6YFgoFJ+Hc81pxm/ZL/lxhyQTmVOPs+eylWX1R978uLnPdULb9AokC14PWkl?=
 =?us-ascii?Q?OM/Bx8TUsUpbwwx3WEVORgtgGsJn890DPsUC2DIWzD0+1XYNGK0L8AflOFMC?=
 =?us-ascii?Q?jLaOiy3KJ2vxn42IfcZ6z8mhT0f2CzztSpkDmTp/IiMutmli2K1oP9XPjBWt?=
 =?us-ascii?Q?zanW/bfay56eLRFOl4E7FxIaJ6mGxVKfEsTegafw/lUCwOmJxL/LWf1gSRZ1?=
 =?us-ascii?Q?hHIDZ4AjY8HRL30xr+kIwMX3JyG11g1c/+fYAPaAm1tsdNS0gzt+ZpFnCMLZ?=
 =?us-ascii?Q?IafwR/6MM45vB8fEOJb8u0DWpmPB/+BOZ6QI+jHJFKhHyc8dzMY9uGH1jmHM?=
 =?us-ascii?Q?EON5DG+4rvc8ZjsIShre/EQ1yBMz02F7nwrj33JWgF+ZwtW6oAV53YgJmnwO?=
 =?us-ascii?Q?zAAEhNf3vB9efwQXj6F3ShPM3npMwzG1zhtwPy/hVP7CZIDfK5soZ8u2pdjp?=
 =?us-ascii?Q?3l3CLjV7ZVThNdcdF4n/Zj9q8dsRNTjUOBu1EiQTosGV2lEO+nziUHlWwjIA?=
 =?us-ascii?Q?6SCXLYKnF4DhnmmqeIPQW1L9xszlN6BhuswnRR4VKsrLU70qFsKRLsPWAmTU?=
 =?us-ascii?Q?FkJX/40r043dlpfdQfQWEsqfBwQ+cc1771PDpUuXB4I7pvho8ZORQ84w1YYW?=
 =?us-ascii?Q?7a6F7SmE1cthoMh8X/8KnddrkgMmwUpSihe1WeaKZkZmEZ+/Axrk34zXV9+3?=
 =?us-ascii?Q?Oe1nt8BKDnxiLkpq6FcK+x3aWBe2XhF/Y3PncsMglK3Xvx6XN08iXZc4sZqJ?=
 =?us-ascii?Q?nvZ58aHrozapS9i7I337VYWg/znxbXVOPNPEQUhuIfJD1JCqxMnRkzhrEXSE?=
 =?us-ascii?Q?EpEYCUuC8t3ZU4LT+KfQmnuDUxQQXdERujcBO760LP9BuXNbCsGfwpUI/tEK?=
 =?us-ascii?Q?1bqdzF7Y5AfljCdbgSopIsSn0Pkgn/ZX0kBnfNuYYfYbsl0Dq32NXdvfVWVO?=
 =?us-ascii?Q?bNWaR0XJR+hUgJyEw0sMAGZXT1a5gIRq+Dw/aeq2OQoSgt1c7SBa58EsziS+?=
 =?us-ascii?Q?lk0WOMKxCmE1HJYdg61s49jtmdHz2vkchde30QyF3P7hyq2VvDL3HL9QfO8J?=
 =?us-ascii?Q?pXkL2XCqALWj9TOcDNnl0+RpBIUQ+2VNfvm8kBiu27FkKeHChqj0GIKMa4V6?=
 =?us-ascii?Q?zYmfctnzHUC7v1SvAAPCBq6H2k818P1rpLy9ZCFJp4I5nfXG67F8Jqyxjqug?=
 =?us-ascii?Q?qQkPu7Rk7UBbo77BHiVWd8xd0sqKst3ht5wjgO2rep7YTYKMffY7xZPuNRVL?=
 =?us-ascii?Q?g8AcXkaWy/KXtrfDJrO198soPRLaRlKpGe8oyvqZxyie2F4XlhA8krdw+38c?=
 =?us-ascii?Q?TE78TS+3NMaSiWsIXQ2/w+O8gdTYKuv0f6FO8Y8VN+FIg3Nfsf9fgQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gqn4lWovjMlI5bcC4vM7gGjkkICbaK1FnSZbjCAn39t4+7FjLQx3m51ukfV/?=
 =?us-ascii?Q?vao2scakNgulDUobWxbj9xfufYRfChASHx4YXEQeuSuEH/Qg8Itg50SqQLEP?=
 =?us-ascii?Q?mEpGaWbBmB2l+llEzWJf6oCE/FWnWN+vecjb87UukEPz9FudRGsZB7WXqoyB?=
 =?us-ascii?Q?ETg3vk2sNDYDlVk1EiRXC/Yp8SOz+nOaqen7Y8nYRvDg3ovn5cXgLzjjbmJb?=
 =?us-ascii?Q?Vrk2zUQ+XDeiq/yDTjiP8yazPM3qLdr8EKCNYol8EHH/stL/BB2ZfWrDDGSj?=
 =?us-ascii?Q?GUmCOjSyyuNr71WhTorDVJ9NkaikALkRvvJjcuoMQEDSlHNBAxRjx2koKmlE?=
 =?us-ascii?Q?CAa7K0Ho/AsGL++uVp+E9yOZXHOvJV1mA/jQZQ4CFSsN1TahBVuCN3EnmDPP?=
 =?us-ascii?Q?C1PoGaqiw3tzblCt7FUO8a4w2hghj6Z6F/eW6M4Ey6qR5frp2oAwg5+fE3Sr?=
 =?us-ascii?Q?zplq2f51FfiVDwqX7jE3cf/Cylu9DJnTrC0xWG/Y4/d1xWW6RVYFVyKY6/os?=
 =?us-ascii?Q?1Ag5yza6yqdUtWPbVHIQ6wf5tsuyQMdjdAMwZQucT9sxt0GQUA3IQEJ8/QQk?=
 =?us-ascii?Q?9Mo3HL2l96llV/CzQh+QamRrdaEmWYjpTPfWfIehyRW9/yvh9c9DklvxEKKn?=
 =?us-ascii?Q?U6ZL1Ffa0iS5SfRe/oGEK7vqY7aKJxp9neVN4GVfZrbuFcYsSCIYJY5ddHAb?=
 =?us-ascii?Q?wWL/jLH9vVLZzr7Q7lgb6+MkY5bGf+HJlDuOFr8I+TnBYPA3upeG7avgPQbA?=
 =?us-ascii?Q?bH1PLaS0fEOSH/SDLTj8ODcA2lHGQxSIdD0ppSgUYkgHxCvbtN9Z8sUQvn11?=
 =?us-ascii?Q?YGW1kSUqIsN4o4A2xDO2viPPw8NWppeK1GirNFqYC7TSSL/SR13GZxFNVYjt?=
 =?us-ascii?Q?yqn8+Cn7HjC+jhK+dkqkV3zJIQMAlVbXYwO4V50z8nyzPQ3eKlcNG+1zm8XL?=
 =?us-ascii?Q?P8FF5uwD1Y01AE8xciJsToF8j6BHMCGGfP7bDRw53ysB8KUqEPcQdfX4zxWs?=
 =?us-ascii?Q?tlmE8hHWB9kiGgtHske++aF2tOcpEX8EkzlrhGzlqZ70PR7it66MJZl2GZGE?=
 =?us-ascii?Q?ADDMiC4bGlMw6ytIH+17/HvYhp7EU5zaOqwtpQZO7HA3eu8MPSiyjtPcHuUx?=
 =?us-ascii?Q?VdnUsbrIpF6FNruPrK+CYsmBoQA1nxLJBB9fw7spRxvL2XLT5cvzc5k5m1Pi?=
 =?us-ascii?Q?fDl3x6+U5UFR67SVe9C9KwWJ8+VmmiuymitbNqlIW6UZp4a5irFvIYbRbfDJ?=
 =?us-ascii?Q?UmZ/xpVO2Psflz8JuzEf4S9ESmBY5HG9TI+yU+lTNCySCIoCvr89lezvU/06?=
 =?us-ascii?Q?L0nrABzyl9Mk8VtScbXQF5pHDA+na6Krv/xUX/Wk4/IEvgXEPWaMuzpGy9l3?=
 =?us-ascii?Q?HZSD/5S9DcwUZAcq6UnjtF00OWI6lzgfJCw2ycggZqETCk8TlJSQectYH4dW?=
 =?us-ascii?Q?epNLnB3rARsWRcOLrkVG50CLUIlaKNpLwlzSWTmPROsT1YT5T4tTR1njAMJW?=
 =?us-ascii?Q?3lhuSWFAsFCG+a08965aRcTu7qQ1lCryLnKwfCj8A5Rg+CqFreyIkxqLIX+D?=
 =?us-ascii?Q?RZDs62gDWX9M6bCPfq16Fd0FR9R5xXvDGW3HSpdo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82b3f86-444c-4dde-b0c0-08ddc916f2d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:57:35.6615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 650BeuA9JGf7FV1Jge+GUwoFpsJxdZb5O0JDzDqLA7jjEniV955UR7A5P2uyzWnVZb9rEaTCGFzaEKV6Z7hKNG6HnUkJeQnGSxB0i2kyA0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
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
> From: Jadav, Raag <raag.jadav@intel.com>
> Sent: Tuesday, July 22, 2025 9:36 AM
> To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; igt-dev@lists.freedesktop.org; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> Tauro, Riana <riana.tauro@intel.com>
> Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
>=20
> On Mon, Jul 21, 2025 at 01:36:32PM +0300, Heikki Krogerus wrote:
> > On Sat, Jul 19, 2025 at 10:01:01PM +0530, Raag Jadav wrote:
> > > Introduce subtests for i2c adapter which is used to control on-board
> > > OEM sensors on selected devices. This will test D3hot/D3cold
> > > transition after i2c adapter access for the devices that support it.
> > >
> > > v2: Define macros for AMC constants (Lucas)
> > >     s/index/adapter (Lucas)
> > >
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> >
> > Looks good to me. FWIW:
> >
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>=20
> Thanks Heikki.
>=20
> The BAT failures seems unrelated to the patch. So anything I can do to mo=
ve
> this forward?
>=20
> Raag
>=20
> > > ---
> > >  tests/intel/xe_pm.c | 98
> > > +++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 98 insertions(+)
> > >
> > > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> > > 16b5fc686..ca935d518 100644
> > > --- a/tests/intel/xe_pm.c
> > > +++ b/tests/intel/xe_pm.c
> > > @@ -11,12 +11,18 @@
> > >   * Test category: functionality test
> > >   */
> > >
> > > +#include <dirent.h>
> > >  #include <limits.h>
> > >  #include <fcntl.h>
> > >  #include <string.h>
> > > +#include <sys/ioctl.h>
> > > +
> > > +#include <linux/i2c-dev.h>
> > > +#include <linux/i2c.h>
> > >
> > >  #include "igt.h"
> > >  #include "lib/igt_device.h"
> > > +#include "lib/igt_kmod.h"
> > >  #include "lib/igt_pm.h"
> > >  #include "lib/igt_sysfs.h"
> > >  #include "lib/igt_syncobj.h"
> > > @@ -38,6 +44,10 @@
> > >  #define PREFETCH (0x1 << 1)
> > >  #define UNBIND_ALL (0x1 << 2)
> > >
> > > +/* AMC slave details */
> > > +#define I2C_AMC_ADDR	0x40
> > > +#define I2C_AMC_REG	0x00
> > > +
> > >  enum mem_op {
> > >  	READ,
> > >  	WRITE,
> > > @@ -779,6 +789,87 @@ static void test_mocs_suspend_resume(device_t
> device, enum igt_suspend_state s_s
> > >  	}
> > >  }
> > >
> > > +static int find_i2c_adapter(device_t device, int sysfs_fd) {
> > > +	int adapter_fd, i2c_adapter =3D -1;
> > > +	struct dirent *dirent;
> > > +	char adapter[32];
> > > +	DIR *dir;
> > > +
> > > +	/* Make sure the /dev/i2c-* files exist */
> > > +	igt_require(igt_kmod_load("i2c-dev", NULL) =3D=3D 0);
> > > +
> > > +	snprintf(adapter, sizeof(adapter), "%s.%hu", "device/i2c_designware=
",
> > > +		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
> > > +	adapter_fd =3D openat(sysfs_fd, adapter, O_RDONLY);
> > > +	igt_require_fd(adapter_fd);
> > > +
> > > +	dir =3D fdopendir(adapter_fd);
> > > +	igt_assert(dir);
> > > +
> > > +	/* Find the i2c adapter */
> > > +	while ((dirent =3D readdir(dir))) {
> > > +		if (strncmp(dirent->d_name, "i2c-", 4) =3D=3D 0) {
> > > +			sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	closedir(dir);
> > > +	close(adapter_fd);
> > > +	return i2c_adapter;
> > > +}
> > > +
> > > +/**
> > > + * SUBTEST: %s-i2c
> > > + * Description:
> > > + * 	Validate whether the device is able to suspend after i2c adapter
> access.
> > > + * Functionality: pm-d3
> > > + * GPU requirements: D3 feature should be supported
> > > + *
> > > + * arg[1]:
> > > + *
> > > + * @d3hot:	d3hot
> > > + * @d3cold:	d3cold
> > > + */
> > > +static bool i2c_test(device_t device, int sysfs_fd) {
> > > +	uint8_t addr =3D I2C_AMC_ADDR, reg =3D I2C_AMC_REG, buf;
> > > +	int i2c_adapter, i2c_fd;
> > > +	char i2c_dev[16];
> > > +	struct i2c_msg msgs[] =3D {
> > > +		{
> > > +			.addr =3D addr,
> > > +			.flags =3D 0,
> > > +			.len =3D sizeof(reg),
> > > +			.buf =3D &reg,
> > > +		}, {
> > > +			.addr =3D addr,
> > > +			.flags =3D I2C_M_RD,
> > > +			.len =3D sizeof(buf),
> > > +			.buf =3D &buf,
> > > +		}
> > > +	};
> > > +	struct i2c_rdwr_ioctl_data msgset =3D {
> > > +		.msgs =3D msgs,
> > > +		.nmsgs =3D ARRAY_SIZE(msgs),
> > > +	};
> > > +
> > > +	i2c_adapter =3D find_i2c_adapter(device, sysfs_fd);
> > > +	igt_assert_lte(0, i2c_adapter);
> > > +
> > > +	snprintf(i2c_dev, sizeof(i2c_dev), "/dev/i2c-%hd", i2c_adapter);
> > > +	i2c_fd =3D open(i2c_dev, O_RDWR);
> > > +	igt_assert_fd(i2c_fd);
Can you wait for runtime suspend before triggering the transaction to test =
gfx transition from d3 to d0?
Thanks,
Anshuman
> > > +
> > > +	/* Perform an i2c transaction to trigger adapter wake */
> > > +	igt_info("Accessing slave 0x%hhx on %s\n", addr, i2c_dev);
> > > +	igt_assert_lte(0, igt_ioctl(i2c_fd, I2C_RDWR, &msgset));
> > > +
> > > +	close(i2c_fd);
> > > +	return true;
> > > +}
> > > +
> > >  igt_main
> > >  {
> > >  	device_t device;
> > > @@ -889,6 +980,13 @@ igt_main
> > >  			cleanup_d3(device);
> > >  		}
> > >
> > > +		igt_subtest_f("%s-i2c", d->name) {
> > > +			igt_assert(setup_d3(device, d->state));
> > > +			igt_assert(i2c_test(device, sysfs_fd));
> > > +			igt_assert(in_d3(device, d->state));
> > > +			cleanup_d3(device);
> > > +		}
> > > +
> > >  		igt_subtest_f("%s-multiple-execs", d->name) {
> > >  			igt_assert(setup_d3(device, d->state));
> > >  			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
> > > --
> > > 2.34.1
> >
> > --
> > heikki
