Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89A4CA0ED3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 11:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EFE10E776;
	Wed,  4 Sep 2024 11:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bo6+Jbsg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8247B10E776
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 11:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725449729; x=1756985729;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iAkteG/aBKdiRzku/6EDF6TJs3q+LKo4rVcOBVhsoVk=;
 b=bo6+JbsgZq2812d/SRPeeYMwoSRbc1ykBM4KSO2J4d3yAo0untLg5bXh
 xHDt8Kkp1ee/U1AyvPHC6o+W1L4ESGnNLZznno1qNBmUz0TGW5CuMy0un
 Yhxj/or/Goj0SUjtUQmNP/WRWXThDgtFV2frbQPxuG6p6P5kJZG/nbfAC
 yTOIidMTsJGB4h9Rd6bHsm5k2ef3PjAZtE6WwH+/jdRdfqOgMR9+hbwUX
 nj+ZimBBq54ywzcXkBnxosoB7I3JAB0qTC3oxC3zwjeFXkWrDNEzPyDJX
 wVeyWoMbCkCAyw9xegAuuOKehSoRCjRbH4nratQNanRQt4f9gxL5/IQuT w==;
X-CSE-ConnectionGUID: /pPa+4nvT8GCReC+9Tz0pw==
X-CSE-MsgGUID: j1Y1dMZTQGOCYHxgW4ULDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35464464"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="35464464"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 04:35:29 -0700
X-CSE-ConnectionGUID: hSgs0O+OSWSUDhnqWbXjxQ==
X-CSE-MsgGUID: oGkyzg4oQjG3u4K9nc3WMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="95974421"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 04:35:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 04:35:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 04:35:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 04:35:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8Pj/us+OXvYlJ+5ZU+Jgmcw6TaqrrY1itrk2endPCTWNYEZp1TQPNZGcNXhPiEpDXtcHskgdRCzooXhD+lXChop+tlD/xoGJwlvoNTcLGo82w/ZghDE9U0m3cNPQ0J/42UtejkBVja0pPxOHc63qyOcodOryIfPiSclKqCNMCtUL7tI8CPKZaOIMam5zV1v35Yu7nu3BsRBvAud9vjRBCJ3l7XF62/Fj8yCObrihOjm+36mc6/zyITiO2Z/VnScS/4UISYzmOqK7AqSK3vB4bfIh7i/+wSRrN8VR8UQ89se2wkdK/kH5/Vdfp/rcyARnOl+6KS2WMkYWdwfYwFS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxrDDZjHp7HbjOzPAfHDpssMIODjHdtRCXDn0M5O8bw=;
 b=qY7x9L9NrU2gIMyhrdTNqaJmpCGI4AEPUXIFw9fEmkIu+wSkN7q/qjMp/hAZlREdx9zCGvROHd+R86Y7dxdOWSG6Uz6KhinOBdRP3JPZwZplKW6NhCWP/LJXHUxeo8gs2tfV5Uws4RURMmF3ZLPYdMk5cX6Lk7ik55Q0KoF+fWxmh9tTuq7JCrxlCDsfLbQ58rA22TbWoVcirAPoMUJR96HT3QCWvfPmZQmNPE4r2Si3IeO+7u1GkG4vR7zamV3IX4JRTyVbN68AkNNd0fP6ptf+pbhwRYeRrLeeUcc8HJ5kUu6vKZajoh3q9GmOjkD0WIqpxKYMEsEdt7uTqQnqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 11:35:26 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 11:35:26 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t v5] tests/intel/xe_exec_fault_mode: Don't return
 early
Thread-Topic: [PATCH i-g-t v5] tests/intel/xe_exec_fault_mode: Don't return
 early
Thread-Index: AQHa/qrB1VYc3KPYfEaoEohh1dmpr7JHfKhw
Date: Wed, 4 Sep 2024 11:35:26 +0000
Message-ID: <SJ1PR11MB6204B5F5B936727546408328819C2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240904084504.32546-1-nirmoy.das@intel.com>
In-Reply-To: <20240904084504.32546-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA2PR11MB5129:EE_
x-ms-office365-filtering-correlation-id: faf92c20-9e17-4a6b-b4a6-08dcccd5abe0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?EIwS4QqiIQyXBsKnxaP6fVdS3vdlaP02FBPNMLaR5MwPBVpb8AxLE8yXy/46?=
 =?us-ascii?Q?4Hov40DBMDaRiDelx/N2U8YaBwPtKu2ILJSaG8rkSMmAMLwEeFe3TIU27wf9?=
 =?us-ascii?Q?F4U8no377jzj/6kZIAU7SRsDaflGJCDP4asTQ+SgxxU9BAmR2SbQFaiPUYUI?=
 =?us-ascii?Q?8QL6BXsxbFCIwU5uGqRCIcU8IRz6DM/VCiCwuuBALkZTflqE2hdG98D1xhE6?=
 =?us-ascii?Q?iubRouOHgA1XtBQEEeTpZnOm+uttN72XqPScfD+CP6BoU3jDmk5XTEL7/jT+?=
 =?us-ascii?Q?U5BZXQHXkdfYuWoq5Nm+4LO/uIlE67tO05PeFuurWvki5mBzfqucmGmUFF8t?=
 =?us-ascii?Q?o5wPMzBLguoZHPJM2PLcbJWwTxjaEjjUD5ocZx4aA/7AFMqKryb2zZKOym1M?=
 =?us-ascii?Q?m/EVRXBTGK0TbuzDyFqOS8n4e3M9XSQ9JqEeSxOhh38ZtuqXD3P0upjeQKB4?=
 =?us-ascii?Q?jWZWZUVoy40dYSdA2i17bvMmrLDbMe7sYyVSFkC8fTjfZOFTcVn289ogud8s?=
 =?us-ascii?Q?rNiReVhzxL535umCAtm8iKd28K/9TC/43Kkm5Ycysscq83PAIImr4SGFvFDc?=
 =?us-ascii?Q?ytEV0TP3Jm7mG8ZFuC2uTMEaJcSyyBsPwsKPnNXylT9733GbH+hnboZM1YQu?=
 =?us-ascii?Q?RB3huI8Ft8HAAahTOFzORJ31b0ChB7VHYzvFblBImBx/NUOd6f/xSpphIBHA?=
 =?us-ascii?Q?5uFGqhFq+M2c00s86YNNlnPzL4O4IV4el8mKzoXHEMkFEj11NfHI0FYXrmZF?=
 =?us-ascii?Q?ulMH6Yq7udHFrOqMNzS9wioZZokwVUETbn/5xDiHHCTRPo1LXJpJBJGhVzwS?=
 =?us-ascii?Q?6anvPb2sXtq+hw7zYXeLE/d0y1tgXN294FEBzVy8RWozoU789BBPFVRSPIgU?=
 =?us-ascii?Q?77GPuN7tgy6EBTujd8tBjsWCk3I01eTcswCNIYYosUnr0Q01o7GpHrWfOhmw?=
 =?us-ascii?Q?vqZSechw1O5pqSy3Gny9DfuohVv8qsk1EcLaGrW6pxh5WyZKlZy8oMe1xziz?=
 =?us-ascii?Q?bPvGpw21uEWx+mNuIUa+XQWORj0TKaq20ITsjDG0TNSmBqGJgc4Azxww5SYs?=
 =?us-ascii?Q?7PUJVEb/KPDbeMxC531Z2HQmfl6K/Smk9gYr3g4/s65UuJcbQ3eBwX8IvZOI?=
 =?us-ascii?Q?vYaeFIdvnw8Jd4R0CBPe9OaVQBPZZFmZQd5Ho10D3LHM9m6G5fmbl9wF79Em?=
 =?us-ascii?Q?CJ/KULMIRF7a6NV97kY6m6ysZdixJSP6rY/1WQZY2ZW0U7IVgdNEWTmypTmv?=
 =?us-ascii?Q?BHCby8/8ZpTeC6Hmac+D3BUh8LgmyJEsZChiA9b7bosBaKAjPy2Pr2JFbP5h?=
 =?us-ascii?Q?oFPN8FLWfINs4Oo8GM3CTsl4GJAwCW8LQEGr40oA0ETLqLdfu+HiI6iot+IK?=
 =?us-ascii?Q?zGXioQs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q0VwbFw8uKWnjw3VI2Ad/7ux7+B3XPDV1GWy4Mpc3YqE4OrX7zyijRoAghHA?=
 =?us-ascii?Q?vEl5D8LZTeWr0ViK7dFFdrSMVA/zPpfrgPucPfduuQ7QDToUyp/l0Eqw3exS?=
 =?us-ascii?Q?Pi965exiq9DZULGqV/gVpKV+Afp7e4mgJ+kzI5mz2A/2aB6TRbbWr+anNsh3?=
 =?us-ascii?Q?+Qe+jyUMHYkyu9pZW7e+29vpo33OdHU788KcOvuGbYwjm2l2BAgZqAaRYCEn?=
 =?us-ascii?Q?Oh6qjeuLqigUDKfN/r+QPCxfmf1GyNq5WZP1OJmNrP4rsSpM+LiapKHZuzBU?=
 =?us-ascii?Q?ECCp3dQIzsWQ/JZ3+O+dmlUgFqyTYodCoc9/mvVivnQ5ON/pDqcR39vjMMcb?=
 =?us-ascii?Q?EbqW30xw4CI10vMya4y5Ml6J0/FSmHeZG0kgfqpKqagy6LhJABt0ME43GlDC?=
 =?us-ascii?Q?XvzfMrxRXPtsBTGdqiut4tt3ZSRXQnCjc6+qeTjuvOMYbUn9j8+S5VvLqjS2?=
 =?us-ascii?Q?b2bYAM4/HUckEyF5HAdqI3cIBxAcPWAaryvAKZWzzSz1TfWKsLKdtCVkblTL?=
 =?us-ascii?Q?yWpF9jlsIcNtr5dQ6T/QGeH6OhzV4eY9hkO5VT/Qz5Dj2oSVvGeeeYTF/sxR?=
 =?us-ascii?Q?317LOpkrN/b9xa2mt5zJ3zk+sDyx+wSbDjYrL+DMz+B176oM4s2vKAMRRWUE?=
 =?us-ascii?Q?k4DEfFNzwpDjOjqqY1+92b+aKHQUuyqmT1V3CyeimjTx7xKCLFEiy5vgfPyt?=
 =?us-ascii?Q?9UW03vQRY4OImptj1KsvNYZ8xiDTkW2VLWiD4a0PwUBhbuTA2CrKcgW8FYAt?=
 =?us-ascii?Q?uUtBt9LMiWCb8d8awX1lA7eQ+ZGt7WbUlWPqtlHjl78ow8YtFSNm3G4Tm2PJ?=
 =?us-ascii?Q?QW+A8eocrMTB7z/7WdSj4p9yJdvn0To3fXlaBaibDOLUtanayTxGBpo7e561?=
 =?us-ascii?Q?17dtJusqwlCH33msolRWc9Tqm71RhwMIFHAczEPcdxbqZ7sAqQD3xwJk09Nf?=
 =?us-ascii?Q?K7L+16Q7lbyC/gSg0rfu4YM02MhQ9wDSMbYHyOGDI6wJekNyxawtWN0C7VAz?=
 =?us-ascii?Q?200USUUkI56/gnpUnT00qdpxSRE8xqyK68KHYBGcjpKIAXf6TKIQrMrShoHJ?=
 =?us-ascii?Q?FWa8/3X8uNGhitvz41SZJ8WgMrTsuA+5qvLwX29V1Do6iDnuWQFTHo12cwAk?=
 =?us-ascii?Q?WqPEPsV8fKolbVKXBURH3TgE5EDPQFsIifF5Q0XCZooJOICLceCmBEspZgoB?=
 =?us-ascii?Q?gzG0lHWoZOUdD9ye6Am3SSRWiMvMYPWISZSMdpe4M5OnbYKSbFr4Hych8PDD?=
 =?us-ascii?Q?67RxIsFth8aDC7QJD9Akotl6SqmRb09hjnx8fhuyFwvNCfmHFIXqD3NMA74b?=
 =?us-ascii?Q?BmPjU0C8q1Rfl/YaoULJGuNeGeelQH12KRWJDZBmLqG5uYSZKQt8Ts6L9nZp?=
 =?us-ascii?Q?LkqocDdXB5iKXZ2nNC6uz9blCru338ce3EdbwSHuYUnKtjHhLcKobNK1nWI6?=
 =?us-ascii?Q?KmStSFlDtwKP0uSRdFgk9aRhJTxHIq3Mf8syjs6t/047/w97eYVw2u8yRG35?=
 =?us-ascii?Q?rQzP3NOrgx4c4nyoYCufSqho5+9FgCUrC8G8LMA0cHgnu/WEBnMX7Oob3QBY?=
 =?us-ascii?Q?PeqDnRhfLVQ2ARbxKkVLa+COB0XU1ZS7UhqWY40z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf92c20-9e17-4a6b-b4a6-08dcccd5abe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 11:35:26.2953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /I5BdaaTuPKtaPUa0CS3/13n13LjgFGMGjC44zZstkNE2IGFl4nBLDBOLXtNRariY2NECRNui3nJvU17F8xKzp8Jacry8jGolJZNnwcyY5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
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
> From: Das, Nirmoy <nirmoy.das@intel.com>
> Sent: Wednesday, September 4, 2024 2:15 PM
> To: igt-dev@lists.freedesktop.org
> Cc: kamil.konieczny@linux.intel.com; Das, Nirmoy <nirmoy.das@intel.com>;
> Hajda, Andrzej <andrzej.hajda@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH i-g-t v5] tests/intel/xe_exec_fault_mode: Don't return ea=
rly
>=20
> Tests that are causing pagefaults should wait for exec to queue ban/finis=
h

Typo here it seems, " exec queue to ban/finish "

> otherwise pending engine resets because of on-going pagefaults would caus=
e
> failure in subsequent tests to fail.
>=20
> Not all execs will generate page faults and in such case reading ban prop=
erty
> is not enough but the signal should either -EIO or 0.
> so read that instead.
>=20
> v2: specify timeout reason and iterate over exec_queues(Andrzej)
> v3: increase timeout
> v4: check for signal status to be -EIO/0.
> v5: code rearrangement and other minor fixes(Andrzej)
>=20
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> index 1f1f1e50b..9cc51b7d3 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -324,9 +324,19 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>  		       bind_exec_queues[0], NSEC_PER_SEC);
>=20
> -	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
> +	if (flags & INVALID_FAULT) {
> +		for (i =3D 0; i < n_execs; i++) {
> +			int ret;
> +			int64_t timeout =3D NSEC_PER_SEC;
> +
> +			ret =3D __xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> +					       exec_queues[i % n_exec_queues],
> &timeout);
> +			igt_assert(ret =3D=3D -EIO || ret =3D=3D 0);
> +		}
> +	} else if (!(flags & INVALID_VA)) {
>  		for (i =3D j; i < n_execs; i++)
> -				igt_assert_eq(data[i].data, 0xc0ffee);
> +			igt_assert_eq(data[i].data, 0xc0ffee);
> +
>  	}
>=20
>  	for (i =3D 0; i < n_exec_queues; i++) {

With that fixed, I see its helping in syncing test progress and helps resol=
ving wait fence timeout. Following "wait fence timeout -62" failure sometim=
e " [174.208129] xe 0000:00:02.0: [drm] Schedule disable failed to respond =
" warning is also thrown. This might also help there.
LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> --
> 2.42.0

