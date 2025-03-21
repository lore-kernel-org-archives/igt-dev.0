Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8010C35FF3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 04:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E0D10E010;
	Fri, 21 Mar 2025 04:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iD1PvKeQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1C510E010
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 04:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742529668; x=1774065668;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DCPp1GE0wmeO7wR6Vw8qOyb3T/AGhfmqxnb+ZfjhB5M=;
 b=iD1PvKeQD+SG2JlOjifVcPQbcPui1rJXfcFovVbqUxKjhkuaVDiKF0iY
 acxuaEpB2SrFGew4BOJ1BtrHJ+IhmduBlhT4i3xakcTAN1eNXT1LS+hZ8
 HYKz7QumDWzLSBjmnuFgdzEgWbIFQegYHWZHwRm7EMHSpkQIViSa08E8f
 cOwx2h1aX1OHyuX7GG9JkUIyYk/EELI4GkpYRFKrh9N1I39h6KkNEsh+T
 EPHPYw1BxL1puGhpKGp0Amz+uARviOK2IIKys7UgrCg2kaGxiwqn8OqgV
 uYLz2uefo9rzY2xFmFcifHrpWmOCOSqyuk5Oej6UFvcxzwq7LBltTrTlo A==;
X-CSE-ConnectionGUID: qhHhqbfHRnOBZTV88g3NtQ==
X-CSE-MsgGUID: 2NuPEfRzRROOLv7PkwJnNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54005757"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; d="scan'208";a="54005757"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 21:01:03 -0700
X-CSE-ConnectionGUID: SO8LoKWDQmmiWc+Tuu+xgg==
X-CSE-MsgGUID: h+YbGOQbR+m4TtMcEG90SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; d="scan'208";a="128399970"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 21:01:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 21:01:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 21:01:01 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 21:00:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBF/ntm1uW81SaMPEtXf+CdLWvX3PxuQDqLcGCPAhDpkl0y/ZoEUWquHxnfLR/vpMldTHwF1LB//UsCJeBh+4uytL5C3o27B26IDon+eqX2xVEAgynSpZWuCjbSchih2uLJhLkZapFcjYD/2iGsoLJD2W2ZwuPpINP/1Wp/V2GmQ9V4E5AE1U5HrNrsJlu3E3etvM+6kM3O0NvTbX16Fs6HJLFqfr1KROQOjy3mFVzWSJ9oOZwirffE3s3BHRIhmP3+jex4cIxF9wyjkEYcJnSyeQxjmoN2bo2n375otIYDZXNz25T/oL1XEQMEWVuoLsxNEsjAWgLe4kyQL3DMIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MT7SFKei8XhM5ZxOHdw254kmcdrhyagO6ZDCfUVSYQE=;
 b=Wul2T/rKVT16wDC2QgoOfkGqfQ1J4UcJKO5y+djxviWkA13dlCXPvjeO5NoSeXL46VW92mLU2OdDIx4iUHTLD+39YpucmSJfPoyE4dhWS5ezXf9tBdiBW1uE+5Evp7KfgCqPnTj9+QEphtKPEey5yOuZUVSxTseV32FS3DTWPFfVw9/CJg+6Kzv3We6KY3msEWtzEiR7NV3CPTnYh+WlzFXkCWO8MRbP0+77MHg2vdzTHdnqmToTAD60VevUXY83SIRZ8NYPXMLC4ecgQtTVlQ/gfGarBToMxi0xTaGmT9n4HqWbo6vf0eEZ740hIgRkLkShedcdokSgqfKKzAWfyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.36; Fri, 21 Mar 2025 04:00:57 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%6]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 04:00:57 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v4] tests/kms_plane_multiple: Add dual display
 subtest
Thread-Topic: [PATCH i-g-t v4] tests/kms_plane_multiple: Add dual display
 subtest
Thread-Index: AQHbmYNfKiC0aSmc9027s3bcvmYvnrN8+IDw
Date: Fri, 21 Mar 2025 04:00:57 +0000
Message-ID: <DM4PR11MB6312AE1FE0530B1BB726523C90DB2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250320103243.823164-1-karthik.b.s@intel.com>
In-Reply-To: <20250320103243.823164-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CYYPR11MB8331:EE_
x-ms-office365-filtering-correlation-id: 65d90b73-1947-484f-2c82-08dd682cfc28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?M0wSiRTgcEM4uuKtDuf4HqCOCfQCdDJQ9WnH3tZ2XIv9zxH6yLAW61uW/IQA?=
 =?us-ascii?Q?t5pi4XPbjbLKyV8cXpm/SfAync/GuU47ej6i94xZz/KtjmkOhepnXzRAaAbn?=
 =?us-ascii?Q?5V4+OKfVGaMFDrAEerb3khNW9f2iAKeAZaMjg6QFnWx5eg5KrnWOAq/nj8ae?=
 =?us-ascii?Q?18zlWV4BkSxNZiNCKTA4GO0ZW3lMMSuhA4EbMeWqRKJ+nU4AwS8ZE+mf2Vao?=
 =?us-ascii?Q?K2ZPmxLEeT5y2IylS9AwZruQno7whIf11UqE+9D042eodsP9fztKNxgxCgoJ?=
 =?us-ascii?Q?tNPvunbkSEB6tKDtP4cdYk86D5rf2qfM0v65aq7fW1/pdOpuv5uHp5kKMIbo?=
 =?us-ascii?Q?rJgzsyCLd1G5ORMVOg8w5ngc5bW9UUCloYT+5RfEBilEDqIh0qowiNef1NU1?=
 =?us-ascii?Q?8o8qKd7+d1o/sr+cPoNGMp30KgUM0Jt6TdsFHyZs1fqF5RLToBkATH5bmPLW?=
 =?us-ascii?Q?5f9UHZMgSwZMb7fyVg0lGeJwHDBnqy88UUIOEvob/n8PU68tnnJyP7KkbnSd?=
 =?us-ascii?Q?Hv8EITzOy+uIDJTZXbRoi23sLJOxC1oBYy+pGeD09xPQggJZfFkrRQZv6eyU?=
 =?us-ascii?Q?kSldlBGatDNCOP0IaZtldFuNi92StWUGSrk+H8E6fxuEfIs4RT1E8tgDEuU9?=
 =?us-ascii?Q?OjZ0FOLfABdFbKWB226zal16mGODdsddSB2rd9nG1Zi1QpB3ghJFKLMNiBzH?=
 =?us-ascii?Q?AC6WaqYHwMvAllmkKWiiyJ1Vou0Cztmp+ZgYw9cYgPz8q+xZFxL+3HDZHBrV?=
 =?us-ascii?Q?+Xmpt6ULV7hrIWbhVQ5PySXqT/SeaqcVAqpcBHpqe3Bg6ZYyKsB3dz6wHZkB?=
 =?us-ascii?Q?+zfrDllsrhHzLk/TxEL0CAQ8NBsRP5z0yp2te0NyyO9uL7ft84C4CZ2yL3oj?=
 =?us-ascii?Q?kVdKktux2874dNGtyL1A1aIXpc3O1+AZR23xiyaB7x48Edd63ukf8n9SscEL?=
 =?us-ascii?Q?Jr+Hm/kbnN9JOBrsy3ikbDCLTPP9TAnCVuuBciIl8YmH977aMnZAXKVgIY9v?=
 =?us-ascii?Q?qlAL/CvnK3tLHh8SGOPmYkkbcLj7iJQ+QVwYTAebp6cE8bfXVdzb2iTLFZ8U?=
 =?us-ascii?Q?gIEYVaD7m8EE5zYyS2nH2GqX4dETtHjsOFzagARwH6Kp7Y+y4Om8WqOjYe/2?=
 =?us-ascii?Q?E135ayMBY3x/isJ1HSWZfgbxysHltvLWnrOsBuKa+pNLABj+499nmGoeJTx5?=
 =?us-ascii?Q?DEhH9ECRYvSXaJJ/zgodo8F8EpUgQy290gehhz6FUXPVcshVEctAzRi2OB+n?=
 =?us-ascii?Q?pJy4ZIWyYU+4Z0UrzvXwaHFHxDGTcnWWbLR/dWyy6Jvk6kJfyzM8HFHnMElE?=
 =?us-ascii?Q?rXuTvcybyXPAM4W4t/CiJAtGm97S4VXXrS8Gee1QlBQuVFWD1v/q5EC4FDmP?=
 =?us-ascii?Q?nOA8l0JZl8dS40ivmee732Nba51CP82HICp4yNrRMp/AnZ3fD1cqfEkcm9GP?=
 =?us-ascii?Q?IgucKLZHatDq90qdgWbUVtrrh3+mJNBf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CsRmC7HlXA9PDX/ctElJHNV55BAv6nHvmtbWvBei9OnnOoOUhKKv4XjS94/7?=
 =?us-ascii?Q?bkStnjX94K2V8ikr4hRA2H1FX7BMUnDJOHo2+uevk5P4q5H38Kjgw4Q/uBcT?=
 =?us-ascii?Q?q5qbaVMtQzMIFLkYWWDrwUNtSxmMMrKlfNN4TAQqGZzBKlQdjS59W6GgdmNN?=
 =?us-ascii?Q?Z1PI0URq5e03U7+WU5fAGs7dMVicYU3fKTWEU/1oVFLRHbJVqhfnfuide1Mj?=
 =?us-ascii?Q?lijGvsEDXGBuzM1u7y/smWTulq9/J6IrPpsGLj45FXpSdlz3LTFSvriHJ1DL?=
 =?us-ascii?Q?edqm5pveks2kb6qP9i1NwY3PnD0tkpYxrFZ6VNg2LPlHeDMJlm2T8SAOLnAz?=
 =?us-ascii?Q?t5Ik9VJnCKdZOzJS9Ii98VB4brPHmziwTX8m6J0yPExv3e4DR3HB3V5AWM2y?=
 =?us-ascii?Q?RWIEM9REA/6+YJ/BtyIdJwYA+HYl8cStzEkMjdTjZW+SGOESdjtKDQc2RfLq?=
 =?us-ascii?Q?jfFqvq0z3rKttDhVl7p88lQI8XtTq3slkbHGvv8HlzYEv77+4nMUqxD0kN+A?=
 =?us-ascii?Q?Rx5Hvnk+0OhA46cL1aEW6AXZgdDiSCPwpDeA64ZaNR+ShtcPXrhygLRvug+O?=
 =?us-ascii?Q?1Vqj766bVo1ecYmkpcSeDKzmyEH/Q+JVcgX7w520WTndK45XodN9RdQNqRvD?=
 =?us-ascii?Q?uTMI3UjMJOzpFqGyBFfldEQ+Z0VqIG3IDu9stv6Nbt48XJH4OBeNxFB9JY8h?=
 =?us-ascii?Q?eeKLg9O5VAnMYeuhESm9KmHXmPFU7rWCW8Yc2pdxOq70FPvPbp7oWddWtTVq?=
 =?us-ascii?Q?53hiMPImycHYf0aCu1SMzWSp7XQvnIBPCI/vd1eYmwqemy8dpzioov2+KDhW?=
 =?us-ascii?Q?PqO571SIoETigN2STaxA/ViWdwPb/WK1LN2aD6DiXmuXiK1Gw1tGCuOtbKhX?=
 =?us-ascii?Q?gc7UEBFC2/hcaAN1pEqmC6m5nbydY6KkyNtyoxXNXMBuQPJlz5VUiiOn1JXR?=
 =?us-ascii?Q?6MJ8WxrXJm9m4daM2Rf40SExWZtwtSdpYa58kh4kM9+pdRbUUwzEekf6K7tF?=
 =?us-ascii?Q?PG9iOnfhYpgTqXInNs90ciI6syHVBtWmU84MToSReKK/pF5wxUqttOA3Rcog?=
 =?us-ascii?Q?/MFNRFVtzxh1HNRPULTgTYZZCWehhF+SA8Hm161fTyJHoRoYwxKuvoylYY5c?=
 =?us-ascii?Q?PLS4ucEeiiszwLNCmgCrbc+KPDhOdH9DA8aeMJD9vEJOSx3DpGjgdvgxzXbm?=
 =?us-ascii?Q?HbhwxJ3gRTkLS0QW1hSxBScM8iwtU5k962aMuybaoTktoirt0nu+z6K2UOvb?=
 =?us-ascii?Q?h67kl466+ShOQqdBjEATJnIeqb5YHFd3Mdo5dwz+h8/zUthSYGF6tHS8LgtZ?=
 =?us-ascii?Q?XwhDIBRgpCtwKdhc4eu0/5q1GOjE3UfaoxEXFeC8V26VU7J+AkBNo/RY4q04?=
 =?us-ascii?Q?EvjlMWgHJfBFgORz3Ripd89Dlh+3hyr5ewMHo985XJM5/C3era4P+b0ZaWq6?=
 =?us-ascii?Q?gd/xc0aL7f0E+77EcGBFX4Yygl4/CiE+/sQ5HC+keGaNZcLSa4rmk0Ec7qB8?=
 =?us-ascii?Q?8boq9kOUlzrCm/Ac6H5+Zxeat5fi8vV1CWRkPMnwgeXh6GgW9QHNn6E++oNV?=
 =?us-ascii?Q?4lMhUbbKiELXgvuP6pU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d90b73-1947-484f-2c82-08dd682cfc28
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 04:00:57.4759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UcH+4RuVXLASO4TgER/4mjlYvZgaeyLSBNF9rKrVNHtsRhrNnR+AAdqPDtkjkkAQ2tRYwukKu2Xrt+rTv6BbSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: B S, Karthik <karthik.b.s@intel.com>
> Sent: Thursday, March 20, 2025 4:03 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t v4] tests/kms_plane_multiple: Add dual display subt=
est
>=20
> Add 2x subtest to verify MPO use case simulataneously on two display
> configurations.
>=20
> v2:
> - Update the test to use all the modifiers (Jeevan)
>=20
> v3:
> - Add modifier support check before starting dynamic subtests
>=20
> v4:
> - Use n_planes instead of hardcoded values
> - Free the displays resources after the subtest (Jeevan)
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_plane_multiple.c | 259 ++++++++++++++++++++++++++++++----
> ---
>  1 file changed, 210 insertions(+), 49 deletions(-)
>=20
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c inde=
x
> eda300b06..775c9fa0f 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -55,6 +55,18 @@
>   * @x:           x-tiling
>   * @y:           y-tiling
>   * @yf:          yf-tiling
> + *
> + * SUBTEST: 2x-tiling-%s
> + * Description: Check that the kernel handles atomic updates of multiple
> planes
> + *		simultaneously committed on 2 displays.
> + *
> + * arg[1]:
> + *
> + * @none:	 no-tiling
> + * @4:           4-tiling
> + * @x:           x-tiling
> + * @y:           y-tiling
> + * @yf:          yf-tiling
>   */
>=20
>  IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes.");
> @@ -73,10 +85,10 @@ typedef struct {  typedef struct {
>  	int drm_fd;
>  	igt_display_t display;
> -	igt_crc_t ref_crc;
> -	igt_pipe_crc_t *pipe_crc;
> -	igt_plane_t **plane;
> -	struct igt_fb *fb;
> +	igt_crc_t ref_crc1, ref_crc2;
> +	igt_pipe_crc_t *pipe_crc1, *pipe_crc2;
> +	igt_plane_t **plane1, **plane2;
> +	struct igt_fb *fb1, *fb2;
>  } data_t;
>=20
>  /* Command line parameters. */
> @@ -95,14 +107,14 @@ struct {
>   */
>  static void test_init(data_t *data, enum pipe pipe, int n_planes)  {
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +	data->pipe_crc1 =3D igt_pipe_crc_new(data->drm_fd, pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20
> -	data->plane =3D calloc(n_planes, sizeof(*data->plane));
> -	igt_assert_f(data->plane !=3D NULL, "Failed to allocate memory for
> planes\n");
> +	data->plane1 =3D calloc(n_planes, sizeof(*data->plane1));
> +	igt_assert_f(data->plane1 !=3D NULL, "Failed to allocate memory for
> +planes\n");
>=20
> -	data->fb =3D calloc(n_planes, sizeof(struct igt_fb));
> -	igt_assert_f(data->fb !=3D NULL, "Failed to allocate memory for FBs\n")=
;
> +	data->fb1 =3D calloc(n_planes, sizeof(struct igt_fb));
> +	igt_assert_f(data->fb1 !=3D NULL, "Failed to allocate memory for
> +FBs\n");
>  }
>=20
>  static void test_fini(data_t *data, igt_output_t *output, int n_planes) =
@@ -
> 110,21 +122,21 @@ static void test_fini(data_t *data, igt_output_t *outpu=
t,
> int n_planes)
>  	/* reset the constraint on the pipe */
>  	igt_output_set_pipe(output, PIPE_ANY);
>=20
> -	igt_pipe_crc_free(data->pipe_crc);
> -	data->pipe_crc =3D NULL;
> +	igt_pipe_crc_free(data->pipe_crc1);
> +	data->pipe_crc1 =3D NULL;
>=20
> -	free(data->plane);
> -	data->plane =3D NULL;
> +	free(data->plane1);
> +	data->plane1 =3D NULL;
>=20
> -	free(data->fb);
> -	data->fb =3D NULL;
> +	free(data->fb1);
> +	data->fb1 =3D NULL;
>=20
>  	igt_display_reset(&data->display);
>  }
>=20
>  static void
> -get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
> -	      color_t *color, uint64_t modifier)
> +get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
> igt_pipe_crc_t *pipe_crc,
> +	      color_t *color, igt_plane_t **plane, uint64_t modifier,
> +igt_crc_t *ref_crc)
>  {
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
> @@ -134,7 +146,7 @@ get_reference_crc(data_t *data, igt_output_t
> *output, enum pipe pipe,
>  	igt_output_set_pipe(output, pipe);
>=20
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> -	data->plane[primary->index] =3D primary;
> +	plane[primary->index] =3D primary;
>=20
>  	mode =3D igt_output_get_mode(output);
>=20
> @@ -142,21 +154,21 @@ get_reference_crc(data_t *data, igt_output_t
> *output, enum pipe pipe,
>  			    DRM_FORMAT_XRGB8888,
>  			    modifier,
>  			    color->red, color->green, color->blue,
> -			    &data->fb[primary->index]);
> +			    &data->fb1[primary->index]);
>=20
> -	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary-
> >index]);
> +	igt_plane_set_fb(plane[primary->index], &data->fb1[primary-
> >index]);
>=20
>  	ret =3D igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>  	igt_skip_on(ret !=3D 0);
>=20
> -	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
> +	igt_pipe_crc_collect_crc(pipe_crc, ref_crc);
>  }
>=20
>  static void
>  create_fb_for_mode_position(data_t *data, igt_output_t *output,
> drmModeModeInfo *mode,
>  			    color_t *color, int *rect_x, int *rect_y,
>  			    int *rect_w, int *rect_h, uint64_t modifier,
> -			    int max_planes)
> +			    int max_planes, igt_fb_t *fb)
>  {
>  	unsigned int fb_id;
>  	cairo_t *cr;
> @@ -168,16 +180,16 @@ create_fb_for_mode_position(data_t *data,
> igt_output_t *output, drmModeModeInfo
>  			      mode->hdisplay, mode->vdisplay,
>  			      DRM_FORMAT_XRGB8888,
>  			      modifier,
> -			      &data->fb[primary->index]);
> +			      &fb[primary->index]);
>  	igt_assert(fb_id);
>=20
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb[primary->index]);
> +	cr =3D igt_get_cairo_ctx(data->drm_fd, &fb[primary->index]);
>  	igt_paint_color(cr, rect_x[0], rect_y[0],
>  			mode->hdisplay, mode->vdisplay,
>  			color->red, color->green, color->blue);
>=20
>  	for (int i =3D 0; i < max_planes; i++) {
> -		if (data->plane[i]->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +		if (data->plane1[i]->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
>  			continue;
>  		igt_paint_color(cr, rect_x[i], rect_y[i],
>  				rect_w[i], rect_h[i], 0.0, 0.0, 0.0); @@ -188,8
> +200,8 @@ create_fb_for_mode_position(data_t *data, igt_output_t
> *output, drmModeModeInfo
>=20
>=20
>  static void
> -prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
> -	       uint64_t modifier, int max_planes, igt_output_t *output)
> +prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plan=
e_t
> **plane,
> +	       uint64_t modifier, int max_planes, igt_output_t *output,
> +igt_fb_t *fb)
>  {
>  	drmModeModeInfo *mode;
>  	igt_pipe_t *pipe;
> @@ -249,15 +261,14 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  		 * Here is made assumption primary plane will have
>  		 * index zero.
>  		 */
> -		igt_plane_t *plane =3D igt_output_get_plane(output, suffle[i]);
>  		uint32_t plane_format;
>  		uint64_t plane_modifier;
>=20
> -		data->plane[i] =3D plane;
> +		plane[i] =3D igt_output_get_plane(output, suffle[i]);
>=20
> -		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +		if (plane[i]->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
>  			continue;
> -		else if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> +		else if (plane[i]->type =3D=3D DRM_PLANE_TYPE_CURSOR)
>  			size[i] =3D SIZE_CURSOR;
>  		else
>  			size[i] =3D SIZE_PLANE;
> @@ -265,10 +276,12 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  		x[i] =3D rand() % (mode->hdisplay - size[i]);
>  		y[i] =3D rand() % (mode->vdisplay - size[i]);
>=20
> -		plane_format =3D data->plane[i]->type =3D=3D
> DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 :
> DRM_FORMAT_XRGB8888;
> -		plane_modifier =3D data->plane[i]->type =3D=3D
> DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_LINEAR : modifier;
> +		plane_format =3D plane[i]->type =3D=3D DRM_PLANE_TYPE_CURSOR
> ?
> +						 DRM_FORMAT_ARGB8888 :
> DRM_FORMAT_XRGB8888;
> +		plane_modifier =3D plane[i]->type =3D=3D
> DRM_PLANE_TYPE_CURSOR ?
> +
> DRM_FORMAT_MOD_LINEAR : modifier;
>=20
> -		igt_skip_on(!igt_plane_has_format_mod(plane,
> plane_format,
> +		igt_skip_on(!igt_plane_has_format_mod(plane[i],
> plane_format,
>  						      plane_modifier));
>=20
>  		igt_create_color_fb(data->drm_fd,
> @@ -276,17 +289,17 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  				    plane_format,
>  				    plane_modifier,
>  				    color->red, color->green, color->blue,
> -				    &data->fb[i]);
> +				    &fb[i]);
>=20
> -		igt_plane_set_position(data->plane[i], x[i], y[i]);
> -		igt_plane_set_fb(data->plane[i], &data->fb[i]);
> +		igt_plane_set_position(plane[i], x[i], y[i]);
> +		igt_plane_set_fb(plane[i], &fb[i]);
>  	}
>=20
>  	/* primary plane */
> -	data->plane[primary->index] =3D primary;
> +	plane[primary->index] =3D primary;
>  	create_fb_for_mode_position(data, output, mode, color, x, y,
> -				    size, size, modifier, max_planes);
> -	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary-
> >index]);
> +				    size, size, modifier, max_planes,
> &fb[primary->index]);
> +	igt_plane_set_fb(plane[primary->index], &fb[primary->index]);
>  	free((void*)x);
>  	free((void*)y);
>  	free((void*)size);
> @@ -332,12 +345,13 @@ test_plane_position_with_output(data_t *data,
> enum pipe pipe,
>=20
>  	test_init(data, pipe, n_planes);
>=20
> -	get_reference_crc(data, output, pipe, &blue, modifier);
> +	get_reference_crc(data, output, pipe, data->pipe_crc1, &blue,
> +			  data->plane1, modifier, &data->ref_crc1);
>=20
>  	/* Find out how many planes are allowed simultaneously */
>  	do {
>  		c++;
> -		prepare_planes(data, pipe, &blue, modifier, c, output);
> +		prepare_planes(data, pipe, &blue, data->plane1, modifier, c,
> output,
> +data->fb1);
>  		err =3D igt_display_try_commit2(&data->display,
> COMMIT_ATOMIC);
>=20
>  		for_each_plane_on_pipe(&data->display, pipe, plane) @@ -
> 347,7 +361,7 @@ test_plane_position_with_output(data_t *data, enum pipe
> pipe,
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20
>  		for (int x =3D 0; x < c; x++)
> -			igt_remove_fb(data->drm_fd, &data->fb[x]);
> +			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>  	} while (!err && c < n_planes);
>=20
>  	if (err)
> @@ -361,14 +375,14 @@ test_plane_position_with_output(data_t *data,
> enum pipe pipe,
>  	while (i < iterations || loop_forever) {
>=20
>  		/* randomize planes and set up the holes */
> -		prepare_planes(data, pipe, &blue, modifier, c, output);
> +		prepare_planes(data, pipe, &blue, data->plane1, modifier, c,
> output,
> +data->fb1);
>=20
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -		igt_pipe_crc_start(data->pipe_crc);
> +		igt_pipe_crc_start(data->pipe_crc1);
>=20
> -		igt_pipe_crc_get_current(data->display.drm_fd, data-
> >pipe_crc, &crc);
> -		igt_assert_crc_equal(&data->ref_crc, &crc);
> -		igt_pipe_crc_stop(data->pipe_crc);
> +		igt_pipe_crc_get_current(data->display.drm_fd, data-
> >pipe_crc1, &crc);
> +		igt_assert_crc_equal(&data->ref_crc1, &crc);
> +		igt_pipe_crc_stop(data->pipe_crc1);
>=20
>  		for_each_plane_on_pipe(&data->display, pipe, plane)
>  			igt_plane_set_fb(plane, NULL);
> @@ -377,7 +391,7 @@ test_plane_position_with_output(data_t *data,
> enum pipe pipe,
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20
>  		for (int x =3D 0; x < c; x++)
> -			igt_remove_fb(data->drm_fd, &data->fb[x]);
> +			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>=20
>  		i++;
>  	}
> @@ -400,6 +414,139 @@ test_plane_position(data_t *data, enum pipe pipe,
> igt_output_t *output, uint64_t
>  					n_planes, modifier);
>  }
>=20
> +static void test_init_2_display(data_t *data, enum pipe pipe1, enum
> +pipe pipe2, int n_planes) {
> +	data->pipe_crc1 =3D igt_pipe_crc_new(data->drm_fd, pipe1,
> +					   IGT_PIPE_CRC_SOURCE_AUTO);
> +	data->pipe_crc2 =3D igt_pipe_crc_new(data->drm_fd, pipe2,
> +					   IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +	data->plane1 =3D calloc(n_planes, sizeof(*data->plane1));
> +	igt_assert_f(data->plane1 !=3D NULL, "Failed to allocate memory for
> +planes\n");
> +
> +	data->plane2 =3D calloc(n_planes, sizeof(*data->plane2));
> +	igt_assert_f(data->plane2 !=3D NULL, "Failed to allocate memory for
> +planes\n");
> +
> +	data->fb1 =3D calloc(n_planes, sizeof(struct igt_fb));
> +	igt_assert_f(data->fb1 !=3D NULL, "Failed to allocate memory for
> +FBs\n");
> +
> +	data->fb2 =3D calloc(n_planes, sizeof(struct igt_fb));
> +	igt_assert_f(data->fb2 !=3D NULL, "Failed to allocate memory for
> +FBs\n"); }
> +
> +static void test_fini_2_display(data_t *data) {
> +	igt_pipe_crc_stop(data->pipe_crc1);
> +	igt_pipe_crc_stop(data->pipe_crc2);
> +
> +	igt_pipe_crc_free(data->pipe_crc1);
> +	igt_pipe_crc_free(data->pipe_crc2);
> +	data->pipe_crc1 =3D NULL;
> +	data->pipe_crc2 =3D NULL;
> +
> +	free(data->plane1);
> +	free(data->plane2);
> +	data->plane1 =3D NULL;
> +	data->plane2 =3D NULL;
> +
> +	free(data->fb1);
> +	free(data->fb2);
> +	data->fb1 =3D NULL;
> +	data->fb2 =3D NULL;
> +
> +	igt_display_reset(&data->display);
> +}
> +
> +static void test_plane_position_2_display(data_t *data, enum pipe pipe1,
> enum pipe pipe2,
> +					  igt_output_t *output1, igt_output_t
> *output2,
> +					  uint64_t modifier)
> +{
> +	color_t blue  =3D { 0.0f, 0.0f, 1.0f };
> +	igt_crc_t crc1, crc2;
> +	int n_planes =3D opt.all_planes ?
> +		       data->display.pipes[0].n_planes : DEFAULT_N_PLANES;
> +
> +	/*
> +	 * Note: We could use the dynamic way of calculating the maximum
> planes here
> +	 * like we've on single display subtest but this consumes a lot of extr=
a
> time
> +	 * with the number of dynamic subtests in this case. So keeping
> n_planes to the
> +	 * default value. This might need to be tweaked if we see any bw
> related failures.
> +	 */
> +
> +	test_init_2_display(data, pipe1, pipe2, n_planes);
> +	get_reference_crc(data, output1, pipe1, data->pipe_crc1, &blue,
> +			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data-
> >ref_crc1);
> +	get_reference_crc(data, output2, pipe2, data->pipe_crc2, &blue,
> +			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data-
> >ref_crc2);
> +
> +	prepare_planes(data, pipe1, &blue, data->plane1,
> +		       modifier, 2, output1, data->fb1);
> +	prepare_planes(data, pipe2, &blue, data->plane2,
> +		       modifier, 2, output2, data->fb2);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_pipe_crc_start(data->pipe_crc1);
> +	igt_pipe_crc_start(data->pipe_crc2);
> +
> +	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1,
> &crc1);
> +	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc2,
> +&crc2);
> +
> +	igt_assert_crc_equal(&data->ref_crc1, &crc1);
> +	igt_assert_crc_equal(&data->ref_crc2, &crc2); }
> +
> +#define for_each_connected_output_local(display, output)		\
> +	for (int j__ =3D 0;  assert(igt_can_fail()), j__ < (display)->n_outputs=
;
> j__++)	\
> +		for_each_if((((output) =3D &(display)->outputs[j__]), \
> +			      igt_output_is_connected((output))))
> +
> +#define for_each_valid_output_on_pipe_local(display, pipe, output) \
> +	for_each_connected_output_local((display), (output)) \
> +		for_each_if(igt_pipe_connector_valid((pipe), (output)))
> +
> +static void run_2_display_test(data_t *data, uint64_t modifier) {
> +	enum pipe pipe1, pipe2;
> +	igt_output_t *output1, *output2;
> +	igt_display_t *display =3D &data->display;
> +
> +	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
> modifier))
> +		return;
> +
> +	igt_display_reset(display);
> +
> +	for_each_pipe(display, pipe1) {
> +		for_each_valid_output_on_pipe(display, pipe1, output1) {
> +			for_each_pipe(display, pipe2) {
> +				if (pipe1 =3D=3D pipe2)
> +					continue;
> +
> +				for_each_valid_output_on_pipe_local(display,
> pipe2, output2) {
> +					if (output1 =3D=3D output2)
> +						continue;
> +
> +					igt_display_reset(display);
> +
> +					igt_output_set_pipe(output1, pipe1);
> +					igt_output_set_pipe(output2, pipe2);
> +
> +					if
> (!intel_pipe_output_combo_valid(display))
> +						continue;
> +
> +					igt_dynamic_f("pipe-%s-%s-pipe-%s-
> %s",
> +
> kmstest_pipe_name(pipe1), output1->name,
> +
> kmstest_pipe_name(pipe2), output2->name)
> +
> 	test_plane_position_2_display(data, pipe1, pipe2,
> +
> output1, output2,
> +
> modifier);
> +
> +					test_fini_2_display(data);
> +				}
> +			}
> +		}
> +	}
> +}
> +
>  static void run_test(data_t *data, uint64_t modifier)  {
>  	enum pipe pipe;
> @@ -503,6 +650,20 @@ igt_main_args("", long_options, help_str,
> opt_handler, NULL)
>  			run_test(&data, subtests[i].modifier);
>  	}
>=20
> +	for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {
> +		igt_subtest_with_dynamic_f("2x-%s", subtests[i].name) {
> +			int valid_outputs =3D 0;
> +			igt_output_t *output;
> +
> +			for_each_connected_output(&data.display, output)
> +				valid_outputs++;
> +
> +			igt_require(valid_outputs > 1);
> +
> +			run_2_display_test(&data, subtests[i].modifier);
> +		}
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> --
> 2.43.0

