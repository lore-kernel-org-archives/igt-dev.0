Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A35E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 20:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1339610E42E;
	Wed, 18 Dec 2024 20:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYH7jL9S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35F110E42E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 20:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734553764; x=1766089764;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X5dBf4WrAT0y+udrtZFTJJzmOovpkwp/H1HfST2KhEo=;
 b=nYH7jL9StCKVtDaKitU5kGlHRo1oxbZCaERadcqAvp/9RA+CvnapcQBP
 F1fXjhdJUlRNOr3jnChW4+CZ6zEmif/8Z3ofK5v6NaGtNS9iIDxCPDSQx
 8GxdYpzeJPe6BPQyrUD2eI20s5SiE8drmfaUweKZXKRwuddXcVx+zeoAI
 /uMYxg4BxNnqleGIClCFOEGmwyndMp8NU9B6Osd/2mqpAbtoOcujjvmVK
 iE/gMf8DX6wW+Q2n5AEX3sEONJnBmxcHHVb+EEp8xMY4hDKNdZ3Lr261v
 qgkSeOzcK65YbWzhx360FAIHPVAlzRX82Jp0mXCA98JVWH5mIeG8s/Sd+ A==;
X-CSE-ConnectionGUID: ueeX3o79S9i5+M8FPkYjzQ==
X-CSE-MsgGUID: 65Z2RVITT96oG+bQujEOmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34938833"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34938833"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 12:29:24 -0800
X-CSE-ConnectionGUID: 8g5V9b9HSIyNs6cACt+QNg==
X-CSE-MsgGUID: QMAiufb9QiGcxE6hWegUkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98455376"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 12:29:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 12:29:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 12:29:23 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 12:29:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/01yo4wx+qh7VCnUTKG3ncjOfcbRbODB8vEPR30sgAfVO0dVMe06ovTtSW3FOgPD1hc+Y5nfSXaCswMyqVqB92JZpO9XTEmS0mZl2Ns/vezpJ1dce9fbBg8EFZFKgcORwuzBi64myEoO7AzEGRy41WDrdhIERKo/117dj2pKnJLZMHD7onbY0+g5dKZJPzUUv4rID8wbpYBtuwq67Ht5I0N+zcpGS9ptUYMLhWKlWix99nMs3pAuJoip2bRKwK3zv07mJFxWEEOgkHXzHI1CbRqEvL5YjhMkc4es5U/fULkHh6Gl5YaBPsHNB7e0ZmUIYKO0NGEB0Ndbp9Uyz0YYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDoXrRT01KZH0E6tasbt4jjUuEvfBuGTLscu6NYfMxY=;
 b=aCY/rDOUSBmBkMXnk8KGJp9nOcj9qRl6VQXV4LK+0AEUlwF1JmrLK4DR6MvsoI0SR8TXjfOTVy6282dQbNB1vrF/n+TpbEQIdZHP/YZo7NEuwGoUsqnFMoE2GpaG8mmnlmY65WrZbJj7WOYw26XWJ/PB1g8H+CT/HpUKbUdWXyY1uz407NVH6shISzHbSEhgxCcjzk5KdJF8cTAWnrbG8GO9wocUEpVdaCYTIK4C1Gjdw1CiY/uZQuy9/iMpx4zkW975o8mdFzrk0Um3YAysAROYM6tXYBJNSVM0oqXaChQ3fJpf3UaQKJYm0Y3wka79wAUomFeSnBxG1PiwVplGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7478.namprd11.prod.outlook.com (2603:10b6:510:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 20:29:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 20:29:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/core_getversion: fix driver closing
Thread-Topic: [PATCH i-g-t 1/2] tests/core_getversion: fix driver closing
Thread-Index: AQHbUX+35G2ro738gUycszjIaCRh57Lsc6AQ
Date: Wed, 18 Dec 2024 20:29:21 +0000
Message-ID: <CH0PR11MB54448A63E5EC453391A22FB4E5052@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
 <20241218190418.126565-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241218190418.126565-2-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7478:EE_
x-ms-office365-filtering-correlation-id: 2922ffb9-47a3-423d-e61a-08dd1fa2a771
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Sp/5WrvdTz4bpXgnxSMmg2haTbynNzESRBtsEwxmh9U7bL1do3Zpiz1D516w?=
 =?us-ascii?Q?qnOEWWawZchhZ92zzCgY7248xpbpAcrkDpnhuX6F1XVJm4tyOtBzAOu1EMXO?=
 =?us-ascii?Q?XkoLJiEVJjIJKmLbCJZkp7IQh662oA6dPL4v15oDBI3URci4jLevn9hf7iJ9?=
 =?us-ascii?Q?UjUenpN9N1Lt7fxGOPwWWplICd55ncG5PWo11H5Mykth4lEnHJwVC2Q4t8jp?=
 =?us-ascii?Q?PEWOtZEOxruzqQNhzVmnch0JJOTy7SqGNCoqaWVsYHa/IT3vEefAIDv0oqb+?=
 =?us-ascii?Q?j88yGFZhG/makCn84DclCaKC5snJ+/u9i44r1bs9HUEbzib5HccT8QjOvM+9?=
 =?us-ascii?Q?m7DYSlorCu7NPB8jv+PwZBVcJmPpWaYMG9aTDXpVFVClfGD52kpy+oqJdggN?=
 =?us-ascii?Q?R1IKmf7qD93DPSoH1VF6WIwHw4iidlwTX1DF879DGd/KgvYNuUMWxJmHeRv9?=
 =?us-ascii?Q?83qV4Z4FFuC+AyDk8li386WMwbM+aE15864WDfIwWPC4RtiADTQQruxE/Oni?=
 =?us-ascii?Q?tiZ8F8CcfboQ9y7BcXoqclX+pN2SZbtWObchjfx4ddR2gbHJWw44h/7o36hF?=
 =?us-ascii?Q?pxsbEX6F9M2h5Jnjz1nhN1cVSyFr2RSrKBPbC3y5yUv0sAZZIWjsuHa+XGaL?=
 =?us-ascii?Q?FMFUz+HC4pOrrs4xy2wih+P2eqTM9+MctCVyFj6hqjw1mdupP3i5kfCZhT/6?=
 =?us-ascii?Q?K4z6es2DUO8CBbFZZ9gN2AkkPrQ4IgDPb1eMFfdTpEzx4mCdfKBbsk7Gz5fW?=
 =?us-ascii?Q?WgQTwT1sflNguKf8m+ocl5P91mXD0ppverCKBT+ER+GTHmPqDR0PmwYKvoY6?=
 =?us-ascii?Q?3+sh3WktBzVLA1xOgX071zKvSOFngv+VMcj+/M/n3nCpKjHmyJaFe5bVM9ZO?=
 =?us-ascii?Q?2lHUJtDfmauWwrRbO3gP3W5Pwwr12RZKIyhm5eZUc6ds/JnBkXGkkHKLj8H4?=
 =?us-ascii?Q?k6JLktChFNQ0CuxFQTl0KVRG8/F4SNkJiE2ft2Hpfk3CsZYmO1NIrN5LqLsV?=
 =?us-ascii?Q?XOrc9yTIhv8Ak/M12kVb0jNCCyXzyd8QHvKigpTIeAwGBovBhvbD/nwEtGF1?=
 =?us-ascii?Q?J9aOxaDlLL38aOVyU3miKIwMkUkMfVsk0rwNF+gxo52f9YK762U96lgL+hS9?=
 =?us-ascii?Q?S2Njfdwjpobc6SawSBix4+WpkrcNQKg+ufoDs5dHLisz/S2gGcuwOa6NKMnv?=
 =?us-ascii?Q?M6mM1NTzKK30IVvRWvESEDG3/aducqKwsbDWAo0cR5WyIIJszaPtNdRNOTtX?=
 =?us-ascii?Q?OXWvD7GqqQKVSNpTJDcW2QLBAy54dlhuFshfZsC/OLtxSMAM1Fj+2O5W4ikA?=
 =?us-ascii?Q?9QvNO1+gZVg6xAVAR51F2XE8DPBcFaPosmiHhSWn6+k0ADpYzp5kGshesGhj?=
 =?us-ascii?Q?M/4O7eWvowYmH1BWFLSgdwsMEVcJ39RWVfBK92pFYXTSez1RgOIqm0ogDTl6?=
 =?us-ascii?Q?9DnXTlvdyi9utpOb0XAHGZHizpPKi/Rf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2ApsMLnKXBHWtIlDp6TlmJTmSctb83vn3WpCpC7nAQ1pyajJY3mK1XZSywzA?=
 =?us-ascii?Q?lvp3TJJHxo/OOWuDJwx/pYXGuwCy54fFulcHHS2SyacPsNIH7+C+VT1s7iIl?=
 =?us-ascii?Q?vGusuWOfqnVraAzuQYKpV7Dpv5zpGz9F9w+dGhCxUTgKiyoXdQfz97D5C820?=
 =?us-ascii?Q?59xIej0fq1zP1C1l5PjYBQfLxTPQaOW4RTTOWxk23LBsbsZkwA0W5tnwlLS6?=
 =?us-ascii?Q?0nAAudPFW6P8Tz2OeR3WoiAc7oXFOMbRSN476cmIM1Rj3FAmZVc2sK9FsLnn?=
 =?us-ascii?Q?hjw4TMNZZR3WQnbyNqAVScydCHjZsV3/n3owOM8OXdiplNaKAiWNDpa8KD8k?=
 =?us-ascii?Q?godk0yD7AughU9qLChjgpVhPe4czt6muOhOniKl437+/FK/IViMVD8HYfF76?=
 =?us-ascii?Q?E+B6bl/fKYWfLJpyEP2ZAvxwxEAYutJh6Ymc/0MtcJGkAH9qzSFOJ+OTQ/rt?=
 =?us-ascii?Q?Acn9Q7oNihJdYy+wEWvZc8vFNGIvuraiXziem8Ba3F388WtjZ/vj3dY/d8VS?=
 =?us-ascii?Q?sQcBQgsg4ffBV1tA1/C3en7uLx9SI2oxf8f962yWqYMiQLe7dEhYigwGciwz?=
 =?us-ascii?Q?4UnorS2P+BufWOxPHGUUbMDSk+q3/4EaQjeI7rTljqYVlGRo1WpeXeioSDVd?=
 =?us-ascii?Q?8ruFAvNoEU+JpOJjCWCYo16YHIk9xeCER/lTgQS4AtEoi3+EZNIGGEiBfENa?=
 =?us-ascii?Q?9wqQUOKTh0GPcpOLQGuheuzE1Ju+3AlfJWvI918NBvUeVOqNhRF/in/8JCe5?=
 =?us-ascii?Q?0iDFU0pL5bOl3tzfx3vfvcySPtH/PJKeJmnAJ7kJWH6SC8jA+X7xuPlQUwEV?=
 =?us-ascii?Q?s/D2eNEkRDHvwWhyCJBQ/3embFo4ZutMM8bfWkuShGqW8XzGSnhNoPTasK/c?=
 =?us-ascii?Q?LCH0spHsOZQ/7C7CVfaXYrssIEqI49/ccsL94PxGn91rJ+1ULpviGI/vLLU2?=
 =?us-ascii?Q?IwW8N7HfWwdlSz+aOxXXWHp1UcxMSUF+SNLpktt8hMnS9a/7MNabLpOrFmbd?=
 =?us-ascii?Q?0aknoPe5k7lmQ38UzI1tleQpG4dtprbAxF1CWbnpltFJPl0fkwb4gh4OB5T6?=
 =?us-ascii?Q?8U6nIBFDkjQ/wdexsM3YXHsJKVFy3VTdcV5kvavC2hfa/hs2IbUBBZO3Itp3?=
 =?us-ascii?Q?PTxIArECB5MTFqdobCvhiYXn3x3NpVUg15Bd+Lmu6cTMvrUkFr5VX34hmM+g?=
 =?us-ascii?Q?d6xHfnbnJjlfBlm0j595ElFXpKckwRoG6CVcyzNEt/ANrwUhu3GNDFdUwXLI?=
 =?us-ascii?Q?l0NehKTXNBR29eY4u9lMuwfAy/bh2wlgGWEWACFpwkO2jYuKILt0momsVE5y?=
 =?us-ascii?Q?iGe8+9cc9h1wHTHyk6G0v+tynhFFANKmx7TQsW3UqyM2mEo62ZH3wuvBryG+?=
 =?us-ascii?Q?g3s2ckFdkczgCfLQ5T6L2VcsjjMtBMRjvZYvwyB/Xi799Wlq9VpFzsGgxF3L?=
 =?us-ascii?Q?UAcH5EpH+MT86IpmespJMmIL7mdRtC4SraSzLgdORvOdhSJ4fWkQ3Kn2Qxp0?=
 =?us-ascii?Q?0TEVUvHlcgZTlE3+9mJZkP6+CYTVySNJBUPGnxRpFtlnVhHVQVXjxWKhjC/M?=
 =?us-ascii?Q?uXlRX+EAJ0ZtVlwgsjZlkLfdkd3Q0SKkcOZ+HVIx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2922ffb9-47a3-423d-e61a-08dd1fa2a771
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 20:29:21.0471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U4rMM00wsZK8026IrF2P4eN+QHrVFvNUP0WMDWn7blLVVdnuLtVUk84tGeSIANAJc2dQCOpZdZfIlCv8vUIbwEeLm6OBoVi3DQDtLxU+As0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7478
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil Ko=
nieczny
Sent: Wednesday, December 18, 2024 11:04 AM
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] tests/core_getversion: fix driver closing
>=20
> Test uses __drm_open_*() functions for opening a device, so
> it should also use corresponding __drm_close_driver() function.
>=20
> Also while at this sort includes, system ones should be first.

Maybe reword that last sentence as:
"""
Also, while we're here, sort the includes field.  System includes should go=
 first.
"""
But otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_getversion.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 158133da7..0842b7db6 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -25,9 +25,11 @@
>   *
>   */
> =20
> -#include "igt.h"
>  #include <string.h>
>  #include <sys/ioctl.h>
> +
> +#include "igt.h"
> +
>  /**
>   * TEST: core getversion
>   * Description: Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's drmGe=
tVersion() interface to it.
> @@ -77,7 +79,7 @@ static void check_all_drm(void)
> =20
>  		check(fd2, info, sizeof(info));
>  		igt_info("%d: %s\n", i, info);
> -		drm_close_driver(fd2);
> +		__drm_close_driver(fd2);
>  	}
>  }
> =20
> @@ -102,5 +104,5 @@ igt_main
>  		check_all_drm();
> =20
>  	igt_fixture
> -		drm_close_driver(fd);
> +		__drm_close_driver(fd);
>  }
> --=20
> 2.47.1
>=20
>=20
