Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B66C98315
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 04:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF4610E359;
	Mon, 19 Jan 2026 04:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMYk1CHm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94FE10E359
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 04:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768798586; x=1800334586;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2DxIYRmjj93/WPe65TbBeZ1LUdAc+iN7gK7NRfAaSF4=;
 b=aMYk1CHmARXMFIx3T5NjbCtztlUVknv2IevGAk1qQmpaDa/ODU2y7RN/
 6Wm4UBI7ZcV69yKOp//wLBFesplYJAb4+RVVzMUChvAJ4gg27Mwml3jGl
 Wj53rm7Gy1Mt7EvVZu7nI+Ar9zLsZFtFkO2UVWnKghjZiIunxhEEN+LOI
 e3z07iNP/aAwqzwFDaIwk/9wkZ/v2DfrT3KDpbJmC/pIHYV7kYM3CSr+/
 M2/AS9KBeAQmXFs50neYDbeVG0SdrBL7NWQdtOXDeJVoK2labU4hWV1cs
 o0yxLD8UrHkECuTwwrYj3CXIpsIjQWdU5zCGIpznXuEVTz3svFe1s5DAF Q==;
X-CSE-ConnectionGUID: VCQXkRs1QPOinhpLEYQqaQ==
X-CSE-MsgGUID: uVKP0ENCTWuVsCFTB0Ah4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80728597"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="80728597"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:56:26 -0800
X-CSE-ConnectionGUID: A6/zSDd5SmKsoazpJHcTHw==
X-CSE-MsgGUID: Y6WHOJbrROGiFGT0+jR8SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210253594"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:56:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 20:56:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 20:56:24 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 20:56:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dS4qaPXmOHo/knJVDsXl3Cx6CkfxyHcS1U55M9+e1Ah0fF1oK4Q8cP8yE2+O8FB2QW9Z3yk0SjjtENlGOjunbE9vAhLwQpSQ4EFf3F22N4Mw9eraR76B0bvgeobMxYbOzv/7TBYia5fbVofqo316bbT5Sxtu2DErpkF0g5tGT5doscUOJbjNL7qkMYiFiMkVbg/fxJcd/IpAYIH+KMgoYlYWtFbUUsIwUWh4MDvPyUDk6rRmW7dYIK0LTzRpNkxVKEzo1pGOrzBu9l2Xhh+TWP6IlHuRSY3yok6dhB6dz8wfwpbpFH8XFNJnet1IhRo0B4eDxYF/fyqZvenyYqQWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frIYixJaBTfQkLt1WvDNKpevvBIG4Eky3Puc6aw0zgE=;
 b=DMNKfqLPqbiHYu7Kbm8iTRCt3CRaFs9IpK2oxU+ydroC5PE5czlTyh4hR69DaJQsVSEEHgxVwF+o4aDtK9bSlqEv+ZzK8liJ7oeZg+P0HT5PeXP0AkyTaT2KtY8E1ztXvECCCv2rsbW/rKZT4uYvlGqVE0DgPd5Sbw0z4XCdoHRJKT/TiBMsTMnWm/SsCKzahNRrHDHndZHdlLsofUlLcZRpwwZOP5MHBicfIljcQehX35IuRs4fWuvykMUg8jjWvfN8XcuJS9MMmt/ptb6qelwnKiD03QimskYRdrVRNArTu5zHIOSk9+aSzjW270zgf1xKsVM5A1useMdAJ2wrHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN2PR11MB4566.namprd11.prod.outlook.com
 (2603:10b6:208:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 04:56:17 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 04:56:17 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 4/8] lib/igt_fb: Add helper to get bpc from DRM
 fourcc
Thread-Topic: [PATCH i-g-t v6 4/8] lib/igt_fb: Add helper to get bpc from DRM
 fourcc
Thread-Index: AQHciP7Uch6YkNrHGka2ZimO3K2WpbVY7cUA
Date: Mon, 19 Jan 2026 04:56:16 +0000
Message-ID: <DM3PPF208195D8DB4D546E01F594039E5EDE388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-5-sowmiya.s@intel.com>
In-Reply-To: <20260119050732.110985-5-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN2PR11MB4566:EE_
x-ms-office365-filtering-correlation-id: 3baf3c76-faa7-4648-e298-08de57171461
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?NvTgnYIgzXQCkVwjDGCGJFT+o2ZS1gv5LKyewXZH5o3/qFjmsSqg/X4kWP0B?=
 =?us-ascii?Q?x4tXB+L2uxPw0/LBQxQLnvS70QrfYJIlZCxgespwCFr0J5CYsOa3rLl9wyS7?=
 =?us-ascii?Q?FYKcweA4VMiq960shVYt0RoOEUdLqcxopgosvkOeHqj2vLRN7epZW0YDxHIr?=
 =?us-ascii?Q?au2nTGrYvOdnAHDAEU1UQJMo4vD6Z0KwgCCzeC/NA5pm8fVLdFkXK6iHf25C?=
 =?us-ascii?Q?st+PHGzaAM5ueFB5HUJmjYU+Py8IakgIgW6vVYnQPgv34Lqjj2s96A6aT1/m?=
 =?us-ascii?Q?pBk7iNv9ta7owVYrTQP2ScC7g1nMJ82Un/bvousLh4Ubydsvoxihe4KHmWES?=
 =?us-ascii?Q?h96Deoeu0pSNK0wFM3gd9J+TTqoZRljdc+5hEppPYGIgNKipYpxi3VyIeGOC?=
 =?us-ascii?Q?UUNxx4uLLJW94jTKogwkpiQGuOe5NfNP3zPBSc0gQ/NqdKlolkAP98HOMdds?=
 =?us-ascii?Q?sC5NBbH/wM4Yn0Mxt8Lhf/TfLCGFcaaF+ufA3tJrmHhsJ+1I2dNVP1CVX4xf?=
 =?us-ascii?Q?+Xz3uscmbArIlYdTkowuNVAVNt6Xca/4A82xg5G6bZfYxwlIq/SvdwikIfYv?=
 =?us-ascii?Q?iKkyzk4cgMAvraZiNLISI+uEcM64NMGeMbeccApR7OzLSNbxY0wbGtmYGxQN?=
 =?us-ascii?Q?DG4/Rz8u10CheExZB62xXYbC9/q39dC5qRkUbWZwNIEnuAkcmOvyDVln+D6N?=
 =?us-ascii?Q?dGXFoXypZVjM/Zk+C0qRiMB45ISjE6DyEA8sZ716fa/5wQziJcCat0mEyjcV?=
 =?us-ascii?Q?+Twj5Uug5xchX7hJh9jZBSAsXGifKQJg+nE2kn8wN8iHhu6d/2JWUJi3Gf8C?=
 =?us-ascii?Q?I33RZAezC9ZCuYTJLjIYTGVvrPLxgs1c48UWociBm5/XsZdUFceLWBSomN55?=
 =?us-ascii?Q?JjStTlf2kIJ7NwUhmGkxT60AV1RvLZ6MznebEwcQ9fTDzRghOlNp2kzBfsKf?=
 =?us-ascii?Q?TQucQzRKbZDMoA6JlV0GnxKvmcs26eAOy8p48W7BSlq+DiAEUXzuC62ZVuq6?=
 =?us-ascii?Q?jm0JGNvDDeXbhPppOGwx1GAAuRYHZCdZccFzoV76OA9u+Z7glTe62d8Jsay1?=
 =?us-ascii?Q?Hyd8/2MxPG+fv3nxvZ8zGBbDlSGy5dCiY3VHtC9izxHL6oHHlh0813/o9aSo?=
 =?us-ascii?Q?0hus6hp6DDRYH5kFET3fhvUlulBkkHg3lxt66LtAKk0kS3tFYzP3TKaTEgFx?=
 =?us-ascii?Q?ApVLYbRB9MYx9Vv0WR4Bo56ZyyxqUfNs3dFmaFV21+cyKMMWA14XIODJrmWU?=
 =?us-ascii?Q?roJwPIlk8CrDNkDAU+sL9wu6KEhoNXrvNjgiOH+SXN10SO+ecdRoqkOK6eJZ?=
 =?us-ascii?Q?Jg39xSwIEckakRR+WwPvOO1j6bF1qDtiqQPw5c1k/eJKw7Q7f20uN5BTqXAn?=
 =?us-ascii?Q?r7T9aAEKYj6XjcbaT7zeVBQpxtpMAqaB+wBjOjJn5gvFQLkw2DNaNzaEPJ1p?=
 =?us-ascii?Q?n/Kvy0NoDAX+wpEEoaWumlfgvkxsRrNRvKp2YNBs4xBgyvFsdvwQrOzr1gTH?=
 =?us-ascii?Q?uzcOyxxqezmJHP9jSJTBuWvawUrWpNbZ8rJBO9RQ0dU+WA8za3rnufitJWnD?=
 =?us-ascii?Q?ksh5orPDRweUgQeid7nMomuqMvAn24s+CmOZcvgqN04pWTaWA3BZeCa4RLpY?=
 =?us-ascii?Q?t2KBGSCyNKWYZD6jdHu0qI0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6/TZjFdStrIClNMsAVYqCynMY2T2OCXgSecA6NQQHmYNQRz6kizblWr6uJxm?=
 =?us-ascii?Q?oihNrvTVIv6CBYYdTKXf+4yki/mdsUkVqWwPb+LBllJt4SaguCmCrMP/vofQ?=
 =?us-ascii?Q?y8t7FvX0BgaCMZ/NubWMmqwI1MxZJs76E7FxYef/B7XJmQhjsegwjQARbUfr?=
 =?us-ascii?Q?3sWHSRHzdKwi9nztDrt2j4iXEra79aiVsxgfe7Y0Uz1q0MryfXj6R6ZfjMtj?=
 =?us-ascii?Q?/zTTQxK3DBngoImkpVZLzw9dbTEvuY15PwW+NIIq4OnBG9F3tJFnn6ZQ0zIy?=
 =?us-ascii?Q?HGgANsVcDuy1vxSkj3Iowl5Gh64j1xaOyMKwXzNl/X4ZoJRjEsegH6Vi00D3?=
 =?us-ascii?Q?0XgNxjZ4bX8fDTgsy/jaaYtm85MubDgGrcz3VtunRZ9aMdNmsx6uCm4InU+g?=
 =?us-ascii?Q?rvYjdlIXgBd0d8z5pZqZiYBkHxr7Us5T/RRRayq5vgryZBtvgJnhzvekXgXZ?=
 =?us-ascii?Q?5/ZkG4gckJk1fR8WDQGYkt/hMXpB6wV/rU4ml1bMZMhY9jH35ZcWaY2mumkW?=
 =?us-ascii?Q?BuDiocYCN5aDT/pthdITcy7gOdCFaub1sKnYqEjh1o6UuzY9/z1c8mWSn4KS?=
 =?us-ascii?Q?K/Sxg2H4HJT7Fpouf/3Cqn1FQHB+48ExQEWK8HFqsJSQxp2rBs+Iu3JoKOyN?=
 =?us-ascii?Q?aohI+vfiYfqwuTazn2o37aLmWJYucMHQKDByXiqlRu1rRw5XLSFlzotmO1PG?=
 =?us-ascii?Q?LI9IkNzPYUiwLY+692Uy9yg4XlHiozX3aiz+aaQNQuH7Pmyx+3Oc0fcY9p2L?=
 =?us-ascii?Q?Xlo6hgkcDLHqkb6Khgs7vyM2quCy6yqCzLKYaRzW6vIK0CsY99amtSPR8fbS?=
 =?us-ascii?Q?TBQD3CXRQWovKSk23V0bmfMYVqhS55zp9vXJ1oMAR78N3hAZ8pkTNwRfxu7y?=
 =?us-ascii?Q?aoTNIfHPKfhtYmFx/0w4r3AEJqGJU8S+D5/hBPkg5u/8N8+o24anruikEX5y?=
 =?us-ascii?Q?MPxlqKQevC8paE56zMc4Cd+V2NFruofoEAxukJFuEgS2eNxMzJjBTstGtUh/?=
 =?us-ascii?Q?7VA/4aQuejb0IdbfPPeRlMItjCRk4/Dv6WURwAQWEnSdX9C37unTfk36Op9Y?=
 =?us-ascii?Q?UF/GQ9uJVFyjbOZs3uExI61YBFsdnVDdq4Y4sLo+HQVVTx1UvpX8rLj0eMtP?=
 =?us-ascii?Q?pxrJjYMuRCBJO/ynGtiTA1pANVfz7WAlI7NVxBDMO059MHlzmCwYJ2Fn4HgY?=
 =?us-ascii?Q?P1fy1991UXveqnS7MC16SE7YlQ4bXNPrDMnh2ZXhKNaj8Ut2hEhJ04NVUrNK?=
 =?us-ascii?Q?ZlVL8Hdt3tp7yDMlGp3nMnpJpIqeCtZ7nKWnoMaZsJ2oAwrb+VKpCRDti2Lu?=
 =?us-ascii?Q?ZM3prl/7rdclvBL1SQnCjL8pKbdyHmhXHOdMm82SYRZnahQFQtIeKDek2amu?=
 =?us-ascii?Q?rk+RKcMXvcoDtgMcxrPfILBGmi1vPJDx+p6xsbS/6HP30afV6Tufq29aX0Zc?=
 =?us-ascii?Q?Mzh3pUp5e4zPA0098f+zMMK12ROKtdcre55JJrq65dSZfZ/675yI6wZF0/wL?=
 =?us-ascii?Q?FpMhWHJ7cvgB8W9yfeLr8P77QuerBkKBXKcluNrB4apXE5bsUDVlDN33IPoY?=
 =?us-ascii?Q?74OqeOCy4xSxwwQ3FpSBWPefyeZCfhVi0sSG/3oaBHSX+rOmTqz9eXCT3DSr?=
 =?us-ascii?Q?3kWKuW9F76D8jXG7DM6yQg8bs8L37DWAAK4VKyRIBI8FFunald9wsiR4/T+L?=
 =?us-ascii?Q?qIQag1sIzZj0RUrC48pX7U4qficcxzUFXZAG/950L3toBOo69N7hKSiiciIw?=
 =?us-ascii?Q?NvbZHrJyDQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baf3c76-faa7-4648-e298-08de57171461
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 04:56:17.0652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xbO0cffBPEn/ioAKOwRhg9tYkGcaaO0p/ZsTeIwR0yzUwCMYwDU4J+mP1f5u2a/xT6YVma45+ZuVzjK8OrHcvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4566
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

> Subject: [PATCH i-g-t v6 4/8] lib/igt_fb: Add helper to get bpc from DRM =
fourcc
>=20
> Introduce igt_drm_format_get_bpc, which returns the nominal bits per colo=
r
> channel (BPC) for common RGB DRM fourcc formats.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  lib/igt_fb.c | 33 +++++++++++++++++++++++++++++++++  lib/igt_fb.h |  1 +
>  2 files changed, 34 insertions(+)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 3a1553d48..b3575d266 10064=
4
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -5083,6 +5083,39 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_cr=
c_t
> *crc)
>  	return 0;
>  }
>=20
> +/**
> + * igt_drm_format_get_bpc: Return bits-per-channel for a DRM fourcc
> +format
> + * @drm_format: drm fourcc code
> + *
> + * Returns the nominal bits-per-color-channel (BPC) for the given
> @drm_format.
> + * This helper is intended for RGB formats and currently covers common
> +packed
> + * and planar RGB(A/X) variants. Non-RGB formats are not yet handled.
> + * Extend as needed to cover additional FOURCCs (including YUV) by
> + * adding explicit cases.
> + */
> +int igt_drm_format_get_bpc(uint32_t drm_format) {
> +	switch (drm_format) {
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ABGR8888:
> +		return 8;
> +	case DRM_FORMAT_XRGB2101010:
> +	case DRM_FORMAT_ARGB2101010:
> +	case DRM_FORMAT_XBGR2101010:
> +	case DRM_FORMAT_ABGR2101010:
> +		return 10;
> +	case DRM_FORMAT_XRGB16161616F:
> +	case DRM_FORMAT_XBGR16161616F:
> +	case DRM_FORMAT_ARGB16161616F:
> +	case DRM_FORMAT_ABGR16161616F:
> +		return 16;
> +	default:
> +		return -1;
> +	}
> +}
> +
>  /**
>   * igt_format_is_yuv:
>   * @drm_format: drm fourcc
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h index 8e5907dab..844b27ff2 10064=
4
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -222,6 +222,7 @@ int igt_cairo_printf_line(cairo_t *cr, enum igt_text_=
align
> align,
>  /* helpers to handle drm fourcc codes */  uint32_t
> igt_bpp_depth_to_drm_format(int bpp, int depth);  uint32_t
> igt_drm_format_to_bpp(uint32_t drm_format);
> +int igt_drm_format_get_bpc(uint32_t drm_format);
>  const char *igt_format_str(uint32_t drm_format);  bool
> igt_fb_supported_format(uint32_t drm_format);  bool
> igt_format_is_yuv(uint32_t drm_format);
> --
> 2.43.0

