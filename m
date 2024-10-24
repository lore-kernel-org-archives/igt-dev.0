Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9E4D0BB59
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 04:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7558910E89A;
	Thu, 24 Oct 2024 04:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBkp5av8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9604710E89A
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 04:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729742584; x=1761278584;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1HsL0jqPEHJkHsLYFOpgaL9BAPuXwg280ZTvi3z2dFE=;
 b=PBkp5av8zXvoiJ7wLKEyWOcL+O/bkNyJvK/aJA9p9Aj4Ykjz4W4N5av7
 13Rtjc9YqtUcaNqvLVMpcM7yQ3dJwRTKjz05S/GSuGhU4XznEJG494tz5
 yfjYEhZlVXskPFJ4sTStDPveJ4WHX6qLhizL03rdlMWchWOgAhQIANSFm
 yuqCZV4HQLvj3gC0R7/VBiRC/OoxTRTu759p41enunw4Uq8E9wg/TyOTb
 Zf9+IN+6oBTaPuNBInuQCM4cGD7wcWRMZQD4fyTM43B0hJXDJ+prg8g7s
 ZVAgQxUFM+/uSLzu5HWeNH8VnKi1gq+c4qnKh5w4O55nLMHsJ3tNX3Qnd w==;
X-CSE-ConnectionGUID: L+OwhFwdQeSJK3g9YdISTQ==
X-CSE-MsgGUID: HGyRVuk7Q4CacIf/BKZaTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29219183"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29219183"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 21:03:04 -0700
X-CSE-ConnectionGUID: lD3O7a9nRnCANSgrfPjluQ==
X-CSE-MsgGUID: ngvtVdhGS2a5+DvCkdpOsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="81291494"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 21:03:03 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 21:03:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 21:03:02 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 21:03:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lr1vBGlY5JUkn2ao/UmHN46H06W975RuNBQOsRs6mWdBC0+3xh+T6k3Cmg5wLTpjyn3ioX9vuRwbADrS/gNGSzMDqV4ma5gb+Ab+eov5+ECYw6aB4Yo6ePNgzWo+v14BXTDAVxmKUQzPtZ+OAHoqRZCpm6IhRcWqbDiksgUxlKSXoEQsT1BLE/6fD+IUzOTeDopjKII3DEsE0X6Kn6Ivc2PJnlZJOyQgO72z7nzdvJdy/dEHVUGGCyWn4IdjhpX3ogr1HY3vkq7ouJRaoY7wheLTfwg57BhOXgc1iMKifZoj5eRq11j1U8pZCoKm8ozMXaEjrxscr+n4qCP0BxuKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvcyRK1IY2qCUiQL+swZlhVQ0KgOsrv/eqTEKeDeqy8=;
 b=eiCco6di2rHVi5pcGaZUj802koBOrF7vArhm0DCenP7gThZgQtlEkUEwFDbINN62itrVj3vLmLZYUecqb3nPyIZQMfM1PXka2Uo+8RgxuYJBB9V0lL295J+hrN1JBvrbpColwemt1ZCqva3JvofEF0fLb170eVLTAUZk3e+47W+FaWzVmXfgflaXVNjmtzXd2vc6Cf+ooBNv7BRL6nZf03sOQ3stlsYO9g1QmiIibzTVeXFmATZUvmDKhFDEGNkpRNN2/N9KVqCLALYlKAdHCNVnM1ebtUnfefb+8gl8tqepO/jsgjqNWnkUsZkgKqbMI6lhd/qZhKam67XhoUyNAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 24 Oct
 2024 04:03:00 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 04:03:00 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v3 2/3] tests/intel/kms_pm_backlight: Refactor and
 use functions from lib
Thread-Topic: [PATCH i-g-t v3 2/3] tests/intel/kms_pm_backlight: Refactor and
 use functions from lib
Thread-Index: AQHbJHvMhIkF9ku4IECJ/aLsJ8iewrKVSg6w
Date: Thu, 24 Oct 2024 04:03:00 +0000
Message-ID: <SN7PR11MB67507E05D278BB0D03D67AA0E34E2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241022121042.2295042-1-santhosh.reddy.guddati@intel.com>
 <20241022121042.2295042-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241022121042.2295042-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|LV3PR11MB8554:EE_
x-ms-office365-filtering-correlation-id: 6a66efd7-e96a-47c0-78cc-08dcf3e0c037
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Vk/QlV4Ln2jXa7PDANX+tOjMRUtfffJKDgNRtj9lS/J2ZkofryYnfNy4FvDg?=
 =?us-ascii?Q?YFVoO42vvRS07JrsDF955X5mvSZWaIWAp2Oc9B9oIt7u2XFhl5Mxhh8TARe4?=
 =?us-ascii?Q?nZf/xcX3ktJCHzQcOOq/T3vRIBjW7qhzW9VTKqq+q+i/u3UZOpnnlfW8AvyZ?=
 =?us-ascii?Q?HbMw4z21c5lGiM9LwBj8vxS7tdfYfZlI3JftxytcxrsamIkZuW2DiLbgNnnf?=
 =?us-ascii?Q?7oUIAsBrAgUGFD+TUnt6leCuZuegcObP0J3P9syTXmfFvn3CduKhEotI6jRv?=
 =?us-ascii?Q?pvQpvHIkENP+B8hm4YUDFDUYuNGRNGvGMD9Sma5Put9XQwgb0JrT1jWLPRti?=
 =?us-ascii?Q?HbdqGKnGDKrHl5ZxTn0Ik2CT533oCvcxFvmm9avvuEM+2QYZU4YEe+yVa/Ei?=
 =?us-ascii?Q?ieDxrjDLuMCQ7iouEuI71eHojAZLGeEuW77Tjr63s0FmhrBQmpj+ZkG3wanF?=
 =?us-ascii?Q?h4LhaL3vtuHoU/mv4KhtX6mCZ6h4wxVSmxCxamHNOI1UOYPPiJR7She7NoLX?=
 =?us-ascii?Q?t3h9psR/0RRXCSpNBOGzHkmmi5YLu3luzYy5kPXYHalB8LimHdd/Ei4KYhm2?=
 =?us-ascii?Q?HS70TDRooYSZb9ODzguKn25NgwjHQ1FAnsIyz6UmUTUiS6fZcixeSaj4l0Eq?=
 =?us-ascii?Q?MqDcH9FXAXv+QzyF3VEhA4dbfPoKNePayxxQJfZFX7Utw+lN9aXMdzZTC6SE?=
 =?us-ascii?Q?0l1st7Ut5tJwzgjUQ8BxU1r/LjFiNf8a5ox0swNoJgYEeAk6D//B6zJ+2RNF?=
 =?us-ascii?Q?mjw53rElRngcShBs1XrMnUndOZbJHgD93Z44rWFSCuJ9q+k6QY8Ub6fd/sQj?=
 =?us-ascii?Q?uoSfCVi9jmE7uIjLJm1RyTNTexGHFX3aQFCnkYan0fHsT5FD7B7kLc/43pVK?=
 =?us-ascii?Q?JuDN6lfTbX8kQX/YX4SKXzXmGAPZAUawHL1J2FKWMKPQfjnBxrYfjen5ArSB?=
 =?us-ascii?Q?DYpGO+LMWCGIl7L5h2sBjxHQdjJhj2iig17E8W1+U4Ur8qquZaUR1df0DWc9?=
 =?us-ascii?Q?mGgFdRWGAMMGHqjrFr9qPD05x1sMwVNzncILTHOdFhWVyD8rVMm3dAsjYVv+?=
 =?us-ascii?Q?a2Siq5I6K6wh0/7vDR4do7bmC6KkPAXGBAc+YSwDgGAOrz0Tzg5Q/mYzr3I9?=
 =?us-ascii?Q?57UuA2HYQpEj0ERRXT3lhYarVasahN+wEHyPJft8/XYydATY5/OxZAAKVxrJ?=
 =?us-ascii?Q?d9+5fyVs/PEKifFjfAVFRnijat/zJaWjn0qanSS3jFh32D4nWE2Z27JKG1+M?=
 =?us-ascii?Q?jSE4tYtT1lf/SQ7N1Pqd4jzGMkqg+UFUCta72sH0mAsYtwsd6S7JwTORG2kn?=
 =?us-ascii?Q?ppFG7csTTeUx3YcbqdAlPqMP13E+JvoxSuOd9d/ZFkEnKq3XvzAr4At31MT8?=
 =?us-ascii?Q?w59mKCQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O+u7PHZzDJNJ1OXscCCf2cLc4mSuP041ELQXaiUFD3+Hx+Jf6ouLXJiwCoNN?=
 =?us-ascii?Q?sfTdP5tQ36UWTOPk9FtfpXW48MP4eEgF8HubGNEOEVhK/PgDiX67eYJCWgKj?=
 =?us-ascii?Q?Bar7FYQ+XSWChDB4BbdhjF5Q9aJCyEU0grfeeZGNBj3iXDH+yF6bZ8Fqv/Hg?=
 =?us-ascii?Q?gWA0TSOIrufsYNRCsoBwYD+y6zzHmOMbh8mIdpPuxkGBFpLKb1/jCtiW/Sb8?=
 =?us-ascii?Q?n5JvkP+StM4JBc6FrXp4B1syM+iEjNDk2l/EyjEjy6KwhoSx+JmzMm3T4U1B?=
 =?us-ascii?Q?mH8rJAdn+cBPUfv0i9kH3jVdbRebYNcRAMCwt7zkzfJmUmCktsuAG7p8p4xU?=
 =?us-ascii?Q?XMK5hLsKz84I/SPNhY+KjB6FJvkwlsTg2ENv+szMnQxN6KSoyAFroP8LwpDh?=
 =?us-ascii?Q?/CVdqgjzJbiyPbYa/qeUJ6XVshmzxDX5RinQ/3M4rlRCOXnRFgZLyWH1pvo5?=
 =?us-ascii?Q?yjVmMMugAiHB24mjRwz8ipMFnnXWMIlkrHZG6WS7T8Nyfe6m4WGazphcodfF?=
 =?us-ascii?Q?o8i/fqJi2px7E4wRrvNb7sZxoyO2wI24+Gpi9Nr+c1at2nnWWCVD5wBNmlG1?=
 =?us-ascii?Q?zBsezc/P8t3/7wripEBwiB96kYKcQJZOn91UfVofmv5bIZ6968jv2T7JVREs?=
 =?us-ascii?Q?ewnqOo1AgP+qpgNhUiWj8g8NtRsRYSDyq0f2d9MKU4JD7JXzExl3VEecVZhR?=
 =?us-ascii?Q?Q7iKP6DxT9s+skasgEEhCmHm5KbyOz2BjhCkvbxw/IURfo4hfmEiM4ecv5et?=
 =?us-ascii?Q?jNuLuXlMluN1//z6XbRIfpshZHoANJFb6MceaiKcSk+SOo+4Dk7/90lVq5tN?=
 =?us-ascii?Q?KHlS9twc1mxxSTqBRp7sxYS4phW1zLxN8wLQ3i+4FsC8+IssigKBeqruYwg3?=
 =?us-ascii?Q?LdHLog3tyfBSfDOS38eJs6s9Fp4APVg1ETKc/JMiSPMf+VLjoZHg31KcNc0z?=
 =?us-ascii?Q?YUQ5KyunfB0+0e2gFo31rasS3LpfHYJw18yiTerbmS/spYIpdAHlBQMm1xbU?=
 =?us-ascii?Q?QGwAyAABmx2NJb1iuvPOCII9WvD2gqOpRIUlr3TiUD+CDdjryeEHH0v0kNpB?=
 =?us-ascii?Q?hs+yC6uTAWMFAWgeFkuws3x02MlcXbZiN9SXwJC66gST9C/0YZOap4HLDib6?=
 =?us-ascii?Q?vJ0vehdCefVfI+k3V3HVHJs3ZL6SUfmPfFZad1wZnBRqpSIPewt4jL1ivT4C?=
 =?us-ascii?Q?1cmWMtQPZcFrZWHQsovKdGX2rluSNl6fwisUFhtIxkvtmejKywr69h0nUZkQ?=
 =?us-ascii?Q?Urvwl4vyWFpZooc5S5ofdWe8dh5wdI27riCbOMePDrji+Rpe6bVec0m6hXFw?=
 =?us-ascii?Q?vEHkTUkXn3aKOR+6epzHPJMYvFmJ/6MdtZA5gGuts382hQD2rQWkMaXU0UtM?=
 =?us-ascii?Q?XDfUG72sJmzgmoF8KSqWVDR97Grz7i/iNBsaZklM/5DGAaCb0GJO2B9iTE+r?=
 =?us-ascii?Q?At2NnvBBCI+oAOFbjds8lr/o9fiFxKklOv6vR1iNLys6z2z++ynFwEbrBE9x?=
 =?us-ascii?Q?OlWWJWxwhk1ch/jYSo+v7pwDDORm3HbjXsjaNJCbQUaDSCUqkXBoMmjxdI8g?=
 =?us-ascii?Q?Yx7vX+JDTmg0AGVjNJliqssy6tx87/2MT5Kw5v0z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a66efd7-e96a-47c0-78cc-08dcf3e0c037
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 04:03:00.2547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i1T72MuluMwrgrk7SjNw+ls8y2taUqBT5GQvkE/5UjcPe+BQFecoVwOdgRp0tQYrJLehfY/31oaGYJwIRqZgjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Tuesday, October 22, 2024 5:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Samala, Pranay <pranay.samala@intel.com>;
> Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v3 2/3] tests/intel/kms_pm_backlight: Refactor and =
use
> functions from lib
>=20
> Refactor to use igt_backlight_read and igt_backlight_write
>=20
> update struct names to maintain consistency.
> Move struct context to library

No need for the blank line above otherwise LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> V2: update backlight_dir_path with BACKLIGHT_PATH.
>=20
> v3: rename intel_backlight_context_t to igt_backlight_context_t (Suraj)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/intel/kms_pm_backlight.c | 108 +++++++++------------------------
>  1 file changed, 28 insertions(+), 80 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backligh=
t.c
> index 196b5af03..8b59725ac 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -72,13 +72,6 @@
>   * Functionality: backlight, dpms
>   */
>=20
> -struct context {
> -	int max;
> -	int old;
> -	igt_output_t *output;
> -	char path[PATH_MAX];
> -};
> -
>  enum {
>  	TEST_NONE =3D 0,
>  	TEST_DPMS,
> @@ -96,65 +89,17 @@ enum {
>=20
>  IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
>=20
> -static int backlight_read(int *result, const char *fname, struct context
> *context) -{
> -	int fd;
> -	char full[PATH_MAX];
> -	char dst[64];
> -	int r, e;
> -
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH,
> context->path, fname)
> -			    < PATH_MAX);
> -	fd =3D open(full, O_RDONLY);
> -	if (fd =3D=3D -1)
> -		return -errno;
> -
> -	r =3D read(fd, dst, sizeof(dst));
> -	e =3D errno;
> -	close(fd);
> -
> -	if (r < 0)
> -		return -e;
> -
> -	errno =3D 0;
> -	*result =3D strtol(dst, NULL, 10);
> -	return errno;
> -}
> -
> -static int backlight_write(int value, const char *fname, struct context
> *context) -{
> -	int fd;
> -	char full[PATH_MAX];
> -	char src[64];
> -	int len;
> -
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH,
> context->path, fname)
> -		   < PATH_MAX);
> -	fd =3D open(full, O_WRONLY);
> -	if (fd =3D=3D -1)
> -		return -errno;
> -
> -	len =3D snprintf(src, sizeof(src), "%i", value);
> -	len =3D write(fd, src, len);
> -	close(fd);
> -
> -	if (len < 0)
> -		return len;
> -
> -	return 0;
> -}
> -
> -static void test_and_verify(struct context *context, int val)
> +static void test_and_verify(igt_backlight_context_t *context, int val)
>  {
>  	const int tolerance =3D val * TOLERANCE / 100;
>  	int result;
>=20
> -	igt_assert_eq(backlight_write(val, "brightness", context), 0);
> -	igt_assert_eq(backlight_read(&result, "brightness", context), 0);
> +	igt_assert_eq(igt_backlight_write(val, "brightness", context), 0);
> +	igt_assert_eq(igt_backlight_read(&result, "brightness", context), 0);
>  	/* Check that the exact value sticks */
>  	igt_assert_eq(result, val);
>=20
> -	igt_assert_eq(backlight_read(&result, "actual_brightness", context),
> 0);
> +	igt_assert_eq(igt_backlight_read(&result, "actual_brightness",
> +context), 0);
>  	/* Some rounding may happen depending on hw */
>  	igt_assert_f(result >=3D max(0, val - tolerance) &&
>  		     result <=3D min(context->max, val + tolerance), @@ -162,31
> +107,31 @@ static void test_and_verify(struct context *context, int val)
>  		     result, val, tolerance);
>  }
>=20
> -static void test_brightness(struct context *context)
> +static void test_brightness(igt_backlight_context_t *context)
>  {
>  	test_and_verify(context, 0);
>  	test_and_verify(context, context->max);
>  	test_and_verify(context, context->max / 2);  }
>=20
> -static void test_bad_brightness(struct context *context)
> +static void test_bad_brightness(igt_backlight_context_t *context)
>  {
>  	int val;
>  	/* First write some sane value */
> -	backlight_write(context->max / 2, "brightness", context);
> +	igt_backlight_write(context->max / 2, "brightness", context);
>  	/* Writing invalid values should fail and not change the value */
> -	igt_assert_lt(backlight_write(-1, "brightness", context), 0);
> -	backlight_read(&val, "brightness", context);
> +	igt_assert_lt(igt_backlight_write(-1, "brightness", context), 0);
> +	igt_backlight_read(&val, "brightness", context);
>  	igt_assert_eq(val, context->max / 2);
> -	igt_assert_lt(backlight_write(context->max + 1, "brightness", context),
> 0);
> -	backlight_read(&val, "brightness", context);
> +	igt_assert_lt(igt_backlight_write(context->max + 1, "brightness",
> context), 0);
> +	igt_backlight_read(&val, "brightness", context);
>  	igt_assert_eq(val, context->max / 2);
> -	igt_assert_lt(backlight_write(INT_MAX, "brightness", context), 0);
> -	backlight_read(&val, "brightness", context);
> +	igt_assert_lt(igt_backlight_write(INT_MAX, "brightness", context), 0);
> +	igt_backlight_read(&val, "brightness", context);
>  	igt_assert_eq(val, context->max / 2);
>  }
>=20
> -static void test_fade(struct context *context)
> +static void test_fade(igt_backlight_context_t *context)
>  {
>  	int i;
>  	static const struct timespec ts =3D { .tv_sec =3D 0, .tv_nsec =3D
> FADESPEED*1000000 }; @@ -218,19 +163,19 @@ check_dpms(igt_output_t
> *output)
>=20
> 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIV
> E));
>  }
>=20
> -static void check_dpms_cycle(struct context *context)
> +static void check_dpms_cycle(igt_backlight_context_t *context)
>  {
>  	int max, val_1, val_2;
>=20
> -	backlight_read(&max, "max_brightness", context);
> +	igt_backlight_read(&max, "max_brightness", context);
>  	igt_assert(max);
>=20
> -	backlight_write(max / 2, "brightness", context);
> -	backlight_read(&val_1, "actual_brightness", context);
> +	igt_backlight_write(max / 2, "brightness", context);
> +	igt_backlight_read(&val_1, "actual_brightness", context);
>=20
>  	check_dpms(context->output);
>=20
> -	backlight_read(&val_2, "actual_brightness", context);
> +	igt_backlight_read(&val_2, "actual_brightness", context);
>  	igt_assert_eq(val_1, val_2);
>  }
>=20
> @@ -286,11 +231,11 @@ igt_main
>  	igt_output_t *output;
>  	char file_path_n[PATH_MAX] =3D "";
>  	bool dual_edp =3D false;
> -	struct context contexts[NUM_EDP_OUTPUTS];
> +	igt_backlight_context_t contexts[NUM_EDP_OUTPUTS];
>  	struct {
>  		const char *name;
>  		const char *desc;
> -		void (*test_t) (struct context *);
> +		void (*test_t)(igt_backlight_context_t *context);
>  		int flags;
>  	} tests[] =3D {
>  		{ "basic-brightness", "test the basic brightness.",
> test_brightness, TEST_NONE }, @@ -339,14 +284,17 @@ igt_main
>=20
>  			close(fd);
>=20
> +			snprintf(contexts[i].backlight_dir_path, PATH_MAX,
> "%s",
> +BACKLIGHT_PATH);
> +
>  			/* should be ../../cardX-$output */
>  			snprintf(file_path_n, PATH_MAX, "%s/%s/device",
> BACKLIGHT_PATH,
>  				 contexts[i].path);
>  			igt_assert_lt(16, readlink(file_path_n, full_name,
> sizeof(full_name) - 1));
>  			name =3D basename(full_name);
> -			igt_assert(backlight_read(&contexts[i].max,
> -						"max_brightness",
> &contexts[i]) > -1);
> -			igt_skip_on(backlight_read(&contexts[i].old,
> "brightness", &contexts[i]));
> +			igt_assert(igt_backlight_read(&contexts[i].max,
> +						      "max_brightness",
> &contexts[i]) > -1);
> +			igt_skip_on(igt_backlight_read(&contexts[i].old,
> +						       "brightness",
> &contexts[i]));
>=20
>  			if (!strcmp(name + 6, output->name)) {
>  				contexts[i++].output =3D output;
> @@ -383,7 +331,7 @@ igt_main
>  	igt_fixture {
>  		/* Restore old brightness */
>  		for (i =3D 0; i < (dual_edp ? 2 : 1); i++)
> -			backlight_write(contexts[i].old, "brightness",
> &contexts[i]);
> +			igt_backlight_write(contexts[i].old, "brightness",
> &contexts[i]);
>=20
>  		igt_display_fini(&display);
>  		igt_pm_restore_sata_link_power_management();
> --
> 2.34.1

