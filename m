Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E009BCCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 09:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AFE10E85C;
	Thu,  6 Nov 2025 09:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lg7Fg0aR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DE510E85C
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 09:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762421258; x=1793957258;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zBvCXZ1Oz5HGdAV3sCEFu5rmA4GyTEeO4Bis2zF8da0=;
 b=Lg7Fg0aR4IlgAXsp/wpcMz1h4OYse4dXQa5tgImibHiL1dDf6prSWgB0
 MDbDe/COf/R8BBXkFKIxMWunLBF96+kEgbMiruJgNTZmwjD/K1IgQtlNM
 lqUNDLUJqqjnqmxEL25l3CnfJ+mg5BmLcjltaxoYnC1MOF9W6PXcwSJ90
 76SneeBHOPOBFJOHL1W2Id4Xyz7tRfJ9bOyCfiN1B7JEJGmpzn52Y1ERU
 /Q/cKVWyInoymSiEDJixIwIaumTtbdxNxbqn9p0y0Qj0bl8DwZEW9PqFi
 eruJew66dUKkyH2xuTjJiVVk3T45trhLzY0x6cB7SemM8bT3lJfPGMfJo g==;
X-CSE-ConnectionGUID: QMl5bve1RHS4IAyr84jL7g==
X-CSE-MsgGUID: fN6J/7ATQKqhfbyKynog9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64591127"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64591127"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:27:38 -0800
X-CSE-ConnectionGUID: CHMRokf9R+Ozl2shh60HFQ==
X-CSE-MsgGUID: Soztl2OES5afool9/ssATQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187991623"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:27:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:27:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 01:27:36 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:27:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkFtMpw6g05IWXMyhQW/aLogXcDGp/ZnvfYGKiqh3jx1aCwm/o/B6/YNbWuM/AQXVv+dGk64ejO+UyRhQajorHEUjAzmNwgjNvuOPlv4JZJJVF51foE6sxJ6IJFm6TkOQceWq0VIHiIj4ISo9z+rodKuCDumykA64AYauHajCx8oBYTQZAxG6lZCUUtn+IvHRT9oNQaCHNHK4/R7SOP9FQmd4XBQZ/M19gHbtSTfjqKtQO/HdvaDA/BrNrz1RqS2vGtkomETuzHrGId3BbhDmHmw46L/03KFOUe+IDJJ/BM+ctAeFnfJ7aT18m8u35pJHmZhiZsl5i8VlUz/0UMLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+agUbgAoPWR1I4QHAiiHD2GDhw3v0qaldT8Kp3udPU=;
 b=kdpaxX6ukL7DBOMxi4piJ8CiltGQbCm7Iy1+rz5wFdYvyU4WWOB3TRYdxb5Qawjylo1kj//H6SCSxHyyu7XlQwBbs6cXzD8Ss8B6LfJ7kcGtO6dfryKUVmt7eJF+7mXYf8aeXOAxuha6p0RAJP3xYZ/SEtJPtOxhdgPXjS2WqY+H4Qn2Ncy9JJ6vcB9ykPzDVYdS0YMzY2O1/GCjTjheDGS3cFMxEjHQ/ojHzBxJwImqQzEKlDSPjfo1bi6G7YQN/o55I6RlTI1bSTBwDTgjs3DIxaCY0EmK0+IeS3IOXlcqUCBcdgLP8tEph3Rx/WxErPbtWAl5daEaFT6YWGe8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 09:27:34 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 09:27:34 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1] tests/kms_vrr: Avoid NULL dereference on cleanup
Thread-Topic: [PATCH i-g-t v1] tests/kms_vrr: Avoid NULL dereference on cleanup
Thread-Index: AQHcTtuDFBFuw/C7E0264ayCTxWCo7TlYQtw
Date: Thu, 6 Nov 2025 09:27:33 +0000
Message-ID: <CY5PR11MB6344132D4932373CCD3C4366B2C2A@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20251106050851.1502869-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20251106050851.1502869-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|IA1PR11MB7319:EE_
x-ms-office365-filtering-correlation-id: 32e11e6e-3d09-49fd-a096-08de1d16b796
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jn7xAGFlDTmQ5FfKiBcjbt1SenwyEZzMU8LN1CJKTTi/5P0UOeivNiT4bpXR?=
 =?us-ascii?Q?70JdKWAvsFYsmt5j98FrP+DUPzlr7mT8+64LqPMaApEp60k+CK60ROasNuT7?=
 =?us-ascii?Q?KEky5HsrKvPsoDtVYy44X9+RG0C+qW7FDuVDw9fnEVTyP2elvPE5Zi+UTfTZ?=
 =?us-ascii?Q?BrAoC3QBtOLcahSwZ4Pexm3Rx/lrcSnl7BEEPyL1NFFoXWSGtmmTM/mL7GP+?=
 =?us-ascii?Q?bgv24kiG+9ihZ8LYij06PqeUZG/UauBy5toSXMfqb5ej9DtyhEveqe/iKgMk?=
 =?us-ascii?Q?oQJL5KeKHgxlQkmMIp8wGkxyCwHr4jyw7j7Gn+mpRV980M9NxH4Swr5Giyk+?=
 =?us-ascii?Q?Z9fcYVTBPzbP8vy0fDRJ84oFKEWxhSt1CfnY/tsFdeLvqKSszy7gagnfyXLZ?=
 =?us-ascii?Q?TRB61sOT4YmXp5SPLIH+SL/iSPkKDqSKvCG5mZvKd9jJcp8Pi5yaBcrWJTZj?=
 =?us-ascii?Q?YnBh5uRAZCbYkQesBvnOehkwVY3L64KN/ihFXvS8D+5tCmTiPy+pinNKe0SV?=
 =?us-ascii?Q?wY64WVv+mhwW/GSSfvWuYN55jgO2tjzcsD1nR8JlX3O5el13pMTEaY4f/qNG?=
 =?us-ascii?Q?UQXO4NfAr8cZNEg3bgDNATug3Fm+dVq/YPp0xSNasPcVL8K9E9KXm4BWSPYh?=
 =?us-ascii?Q?N+vqyZiM15QdOz881o0WayPTObrBKAIOCP269FFVthpSOl6BcDwzD93gI8sA?=
 =?us-ascii?Q?keDU0A9ko3CdwXLAcoD44omB2wLxcUdErney+Uzr2PXD9hy9cKfRIAf/madN?=
 =?us-ascii?Q?QtBMhC8Jlud8f9lOB+sMqoraJJRsq9sXOIuVZU8tuOFfErX84DgZpe186fwr?=
 =?us-ascii?Q?m1eloeefyUKol5iIAiwoAeUJJf+pAvOLkqeOr6kx27hL5wret2llLPa6fpS8?=
 =?us-ascii?Q?0uHJYkZiqvuYG6M4VmvylvsNVfMjOYiiLnsxuC4KOCSXgyQIMu7hj6mk4HTg?=
 =?us-ascii?Q?iBIoI1Xk5pJS5DT+BuDMSP5HLF4lfnlCeL0xMVjRVQ2hBSkTX+UebOwm7z/7?=
 =?us-ascii?Q?fj3GxP5lEFdPgG9ruCv7b6GXd4RSqJa+XUmt+B1F8bdDPpi9Up5UMdqmTrUC?=
 =?us-ascii?Q?ID1CcuMxYFihjSImfVbCRplPzWI1kUw2qHTWahVs/tNUCy0jyqT53badYnLr?=
 =?us-ascii?Q?fYyaVOccwHnywyzc+E8wb1vPc1JbbXerybRHg97+lm94BvYBZOA9lhOLg4dm?=
 =?us-ascii?Q?VUo4R3LKU7WgdpoPJ/oUXdub7Z/xpmHKHZTibeEWG+0cdaf4axrYf4mZBMK+?=
 =?us-ascii?Q?nwVcRuECuZQNrICF2yr6cPrFKrmZb0JL8Cu7P7KB+uUtCuMQnYO+VedmSV+w?=
 =?us-ascii?Q?aTjiwvjcxTXlg1OtaX1H0DR4e744RLt9gwkQ5n6A8ZUesLltkNm6sr6/Wq7+?=
 =?us-ascii?Q?sohlKLlPYALR/GlMQtpNPAo0uu1VMyEaLnuG0+VrMYMKURiP4KSEy31YQOyk?=
 =?us-ascii?Q?2qK/dGQWIFVyFVeZ47dMEy4I/sLWSwb/EiJ/PB1zVhN//eClrdcrfnKZaDSm?=
 =?us-ascii?Q?mhPdybW4obySXIlrt9Wr0kAPLCeWVs+x4zD1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EabeOmJzVi91ykLdUvCiHyYfJVVagpTkBD2vhXMM0s2hg8lZouiESN4GuFY8?=
 =?us-ascii?Q?F75shLg4h0tXa9rSd01hgGb4DUyBBeS0wxa9cY5IyjQfGMRibCARppUSHvGq?=
 =?us-ascii?Q?/vvO68e41iWpsAYLWGNayX6oV7WRzzU7ZslZmLHQawxRJKxVqWtAg0tNPvZS?=
 =?us-ascii?Q?vS2MUFHFp9bKtfBbwv4cO/rKS46XogOQymTuYb0k+xasRU6K1Emjehk3N5Eo?=
 =?us-ascii?Q?xjDv4KYz6sPxXN2PM6NqAFhv8wUXFsIbv4/fA9YcFf8c6Dn9L1oziisHQvsy?=
 =?us-ascii?Q?gG4wgSSLtax2qkZUADORHhgE7y0S0Ipb2JuLaDeJjWPMiDuerX2tviZxJCFv?=
 =?us-ascii?Q?47bnRuwf7Q9HXEWrsKU9O0Y9643UhRULsyOLZEfykihOHH9c39qqBh5zeOb1?=
 =?us-ascii?Q?Kgz3OU5XahuDiu+ASgbAaknXJalmTIjG9Ep2gn3vs0BRzNMi2T+XwTl3EUxW?=
 =?us-ascii?Q?/jbd/XkDUpFPX5vJDENgTn6JgkSuk3KIcXZnY3HhIrdoW1eERaZ2SX4Z3FVk?=
 =?us-ascii?Q?BBuc7JYpakOIgsiXUfln9L57xNUMHJDGulQV5j5oekY3I+7Ejr8jxeoeJdaN?=
 =?us-ascii?Q?MR4BaauHg0EdS3eXR5BDbptmNFQdwFSq3GkKBXCs4ZCewLpulgZyLjJXIDSG?=
 =?us-ascii?Q?HDiUxLvJW2BiNpnSnwmS0ola03IVMqvCClJkgQgeygd/fYrdGWMCy5xLCgAT?=
 =?us-ascii?Q?FOEO3kSZTauiV2cNnx0Xe6jIeSrpiv3AN6vOVs3VdVbhOj3GZxSv/C2WuUJy?=
 =?us-ascii?Q?i58Kv+UmVp/VvYF2G/xStjZlIfkri0zEJoR54kzB0yW4wTSscaU2aTLznxjb?=
 =?us-ascii?Q?SG20DSU/HNW58z+KtdUlYovFA24SHRP4jdwl33uOerQ7DWVIp0b6d+SRh6qG?=
 =?us-ascii?Q?hFoVWYpFIC+iMT+2weBffC/e4gl72sfe7rfGk12x217I+TP+6/UpUyu6xIjB?=
 =?us-ascii?Q?r9xDr5SklFLTmvkARPr3Kkdj9VsLPQBUUbyPLplS039ObiNWIA0EGFZJDE8Y?=
 =?us-ascii?Q?vcdEIszjxJNLWgetSQxbK4MW4txrCgMgjfDHgHlsYEUYFgCPDUHDwWFgzFMJ?=
 =?us-ascii?Q?CH1qHEFVIbdezHlOvnLjZrLdkJDkHa73qLXvaU4Xryzh2xuYMloSEyDyXyj7?=
 =?us-ascii?Q?B6BZd2UPwMT5xfx+iGsP/S3b/UkeydwRmdJK6fLnYrlYUf7dcut5F5qXSWWx?=
 =?us-ascii?Q?QYBLpuiMDXFSd2FraiiCdAUKevGshV3T+8OGXp02Xbk2X1mZVSSoYstFw6S9?=
 =?us-ascii?Q?KjUoH7pa6nhmihCwoGMJkiYT9I7F9j5bLiH7RH3b+G9LfxwjiHQrVxqGI/3/?=
 =?us-ascii?Q?dcUxQ/ryLoSBO9IEtrkGi9lsZbRUrjXbcrpIHLgVpf1krAYjt/0lLqfLgko4?=
 =?us-ascii?Q?e2pOv0jpup35enZlSaUslci2MnlFXsuGT0aw/o7YvOs9X5oxwaqivxQ/Pxai?=
 =?us-ascii?Q?bFMzU/zXW6Vk0DOYEGScPzj/A5DiGXl0TOnZXOT+98Raqiz6KV8G5VeHSzTh?=
 =?us-ascii?Q?YI2q8rp2rxpcoscVAq9jkU5gyX8ZxS52bu6GWeJ0wpq3C1UregMwqFG9iUqg?=
 =?us-ascii?Q?ZNWalXvWWgbk8yu23rUMInmy2DS6E5rGNEuPG5UtXCIl3wYnmo3g9D/hr0u5?=
 =?us-ascii?Q?u2maIwXCP/9BYAmYYHzcT4Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e11e6e-3d09-49fd-a096-08de1d16b796
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 09:27:33.9474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BCbUa5Bu0iPbsWy8rtnAEE2y9d/0pN6SC9umSeDWWF/Pz/Fyt8HZ67HBA0VcYGwrdOZoCFz3upTJif+YccIfuJaBJEbGqw0vce/h0eA9737dBLXpFjWi5LSplb7upom1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: 06 November 2025 10:39
> To: igt-dev@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_vrr: Avoid NULL dereference on cleanu=
p
>=20
> Add a safeguard to prevent a possible crash during the cleanup phase of t=
he
> VRR test.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index bcb756202..a403de473
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -961,7 +961,9 @@ static void test_cleanup(data_t *data, enum pipe
> pipe, igt_output_t *output)  {
>  	igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED, false);
>=20
> -	igt_plane_set_fb(data->primary, NULL);
> +	if (data->primary)
> +		igt_plane_set_fb(data->primary, NULL);
> +

Please add fixes tag before merge.=20

With that fixes tag looks good.=20
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>


>  	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_output_override_mode(output, NULL);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> --
> 2.43.0

