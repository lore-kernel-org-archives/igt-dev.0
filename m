Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25B2CD4F2C
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 09:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F8710E9B4;
	Fri, 12 Jun 2026 09:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtHaitth";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282C410F350
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 09:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781255089; x=1812791089;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mu5CBhjOzOV7jc331gl0wOkw4bKul61VQ+keXR2mRAE=;
 b=PtHaitthLXiW+DeKgVauzWc8NCMwfChSTV8ah6vRMyZ8s73Si0ivYaX9
 iwXBwMIWKhdggpo233GcsCD+/wZ6O4Xb2RdUpU4l2LSigPvQYAOYJb5N7
 64/nFgxyj3Vp9OuZvh9eMrePX0IeWP5Nz3RaZ5x6gwByr1SGfP7NXdQzl
 LV45tjA2U8C55rO+8IqqZFuPc3DA7KO2cgsxMTSoQRm13HRQtnUHXkQKT
 lCfxazg4AgVWxjR7l/vqjGsEbkbTT3Sl0R2yFyIUwwB61IsT0SiHx4hiG
 Xll7OL2fFkM75U+JzV2eKXjiewEY8u8n3FmS7KcVB6azL9cLkw33SG5zB Q==;
X-CSE-ConnectionGUID: ij6tE0SjTCypBAJZbrvgPA==
X-CSE-MsgGUID: OtsXUCGLRBq5o7dH5KAAsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81989126"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="81989126"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 02:04:47 -0700
X-CSE-ConnectionGUID: EiLfLWwSSzuey9gdX0j0Vw==
X-CSE-MsgGUID: fj7Vm0niQnuXxl6NmjpnSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="270810614"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 02:04:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 02:04:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 02:04:46 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 02:04:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7arpKx5BOwZRPhvIXwRhkL/oHfO7Uj35hkk+7eV9wCfeJvo93xYO5QubgVyinuqJHO2dCRvhlCIZPIpQxykuIXiDBbaHcJz1sy/R6hojyVqalYwPcKJH43eqDED6HsaoYK41LlWNMjDp0JA09t2/+e3qOiprJg0cA/pH/a8ZnKuUqYSvc+xEOjFzEY+klVPBOEwj0BTvikbh8cdFPz4E8pFSOeS8J9rm7b2WLCbJFIyaOdGnVzC9nLCwawX1Y+vYhc19sL35DRwllwQI2PoKxRShKukrG+Rt4xFi0Y2M2O/4Nc72vUj36uAKaNMc4ExmyrtsZvS4DaHczr2Hkc+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//FJrt/q4kVuPaF6TYQSrSkIedSuMWE2Y9TjGvbaX4o=;
 b=TS63zSqy46DHV4ZKd6QbY7EtS48mPVcGWuJ0pvphWaucOHr1qakC8o7L3BoKdHoMlRNimZjZM8v39vubNO08AFgu5V8t6Z1igLDRWCWG97mippLEPtF3jQt2iBGbQ/AmLCe7vl3WTN3W1vtDRQzIXq5N4oaaXCmDFCSkKj7X9xSIeKH1UvpnJLyQ8/Sy1nN1zKtzaHgL3TS2uxl/cY/1MN1tu9stwWeEd7MGsCtztpKbPfyBtvudPmmLkVfobg35eU9ODmHoSqlkWP15z60Sd0+s+rckps//bztwweF6kbzpdnFKwTB4tPD12JOdP588OAL5Ebv/Di1xPkRVjS440g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by IA0PR11MB7750.namprd11.prod.outlook.com (2603:10b6:208:442::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 09:04:37 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 09:04:37 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: RE: [i-g-t v2] tests/intel/xe_madvise: Skip purge tests under low RAM
Thread-Topic: [i-g-t v2] tests/intel/xe_madvise: Skip purge tests under low RAM
Thread-Index: AQHc+icn3Q66b/IdeEO7C2fDmYXz6LY6oJeQ
Date: Fri, 12 Jun 2026 09:04:37 +0000
Message-ID: <IA4PR11MB9251A213ED1965F900FC01C799182@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20260612045035.1942635-1-arvind.yadav@intel.com>
In-Reply-To: <20260612045035.1942635-1-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|IA0PR11MB7750:EE_
x-ms-office365-filtering-correlation-id: a16f159f-7de6-40d4-78b5-08dec861a0f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: WMpL1oHWpZwA41zFWY1Q/j9K98xxM9IJjraV1Xwcjv64QsAiT5GgCUx+mcaeMgbC1bBhoRR+vazgNSjwEi9dgun63aPD+LRLJhMpxV1Tw/WXmSPxodpnPRg9kuCmVAI8bma13Zh8l9knhV/ptpJL1Q7yjlbkzkMZQPnmk240Z/HaDd5lDvDZwHJ3qHd04XE+ShwRs/f1GJYdXkpcao94IqT6+zPnQaLCqsT9GWW2NzhCNsj6obN7X2cvXEfi/5wu2P1g4AfrlhhzL5reSzPlNNN2IAQo92f5hJ/MkIJqqWsHJeTDUYdtBCdXZsDMCn2Gw+tUNYbUK3QgqAkTNtA74KprlP3WBpvFhvXQBWOx+tiZW/sdVcxdVlRVdPSl7zG3p1SM0ZAT0xJsqL2VkTdsfy93ckGRfPBjK92Wyz6Qvit6Fr0CiRFjgzKFwrc/S2lEr+Eigpe7Qx92jY/ubYSmAD/l7IitY5LvMJCb5ZcczybQ/h1VyCqhXMV64g3RZDOfShGftPHNDCfWaPF+XdhFk3SHHwfQs8r5tl4BYqU+BqSFha9n2U0ApW673AKFo7RxBKVRY9ur8FyomIG6iaPAIeS50tV8+befHEucIv5GllT8HVyZtQ6P4Z8QYpFK5juvfTNV4+9Q2qKnbr6PkBjz3SkSxh8xkDW2yU7khOsoaCD26ftI2q7w+eE5mYhqCxK4WjqNMFDIGiIe2s0Batas7jESNbWINQVjQZfe79FOkHWy6iJo7ERPotPLzQwb/a94
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gi5XBoUIxAHZwWOQPsM6yXdvmdmVEob0PLK5Oo7Dirl7JjTDbl44ay0RfWLc?=
 =?us-ascii?Q?VdI5dX1UdnHjeUN2ZPl1vFYP8QUh610ecxK5WwzBQIjBPirDp7+VE1JtDQ2g?=
 =?us-ascii?Q?zX0Hs2HTtma04LYmGoXlowkbjRHvlEFmMgJ6iICwvBZfaFEbRvuscf7GT85c?=
 =?us-ascii?Q?VS8BNSTDcOUq7YN4jL97fDsKuDH6Bj6pUe24eHFMxVCXYYNzYwmHrsvj7zVo?=
 =?us-ascii?Q?tytcMgUNM5xBKp0nuKe9/1zGc54oAtV/Orx+j7mNyGeLewCQn1/0R56Vh8ne?=
 =?us-ascii?Q?j1RQHIEu0vAFPzdrLA1yD6G9rL5RAWG+F3QVLHaRHJL8UhHaaR0A3k7uanx5?=
 =?us-ascii?Q?vU5nU6BKiWS5MKZXCPSAYLcV5PduOLWRVb6lvPpXfVnshG6mU/aWeTUhG/yz?=
 =?us-ascii?Q?7JzYILB7lDqMhG4jhE0XQG+LKQltL2WlY4VMsUHlTFQTNjnfit40JDu+5QJ0?=
 =?us-ascii?Q?PZJ3fJECTswgdMBjUI4ts5ayz9eBVtg4JSilDrJR2WKarYg4beTxaI1xRqRa?=
 =?us-ascii?Q?58OA1gNiHkHamBbdIvNmwVU38lsqAeL3o1JqwpyBrjcO23DEOPoyvclj3Ito?=
 =?us-ascii?Q?We8ELvaeVxuZe2/GVcdjBJkmVu/NklSWNLhwLCkjzjvcNWZoWrRTUh9oK9o9?=
 =?us-ascii?Q?taFSJI4lAr9AqFh9qa04/+uVw8dm2GjDa5KgbJotSmcjQa9R4BXXLbefOj4u?=
 =?us-ascii?Q?vxITJUpWANLZDQfMNI3ISkqlUToe99fxuZevWkEMLScnFHWI3QGDdmMNTQ+D?=
 =?us-ascii?Q?/rlmQqFUNZE00GyUb5rVsF7czrEMXiIAcvVF3icktieL7ez1EQDdZo3L5G1H?=
 =?us-ascii?Q?M9VostTySYZsf7g1tU8yPAos5u8mntetQjTZP4YvrJnOpWoRVo7hzdPDyCch?=
 =?us-ascii?Q?XU3+h/ZBm8i33Vf2EWdVjPBa4A7BTCRctAfMkWjjnTF2WmUt9fqC+QviQ2f4?=
 =?us-ascii?Q?t9jYwDU0j0j7BAqc/OfoR/K/xwO5joB5WuUZAMo+6DvxAM+WcjWjuyBjkH1b?=
 =?us-ascii?Q?8mJJ7yZ9SAZidX7KiDNfxgCm0WRkFr4WQFHBYeQ2grgufXZ3SmtlAyd+ajp0?=
 =?us-ascii?Q?WhQ8OYxXEmKKyMrRWbHIXlTzFU7dT7yQ7/os/dfQLj+gH35/U6HDvL4ZcwMA?=
 =?us-ascii?Q?SpSvdztGnUI4GFHCxqIsjgStg12ipV/gxFm9f4Fcb/DyBCqEg0J1YR/bIcKr?=
 =?us-ascii?Q?xnp6CKRTY8pRWd8FabHTVapP+3CrAWDwPtPooBTYuGzCqM/bx73TS10K/8Vo?=
 =?us-ascii?Q?fr3bFjtz+itDQnW2ma0Y188OH8h2rcAGQE6HO8W+cAV3xO6UZ6REo3AvS13O?=
 =?us-ascii?Q?iRXThXwtR7fyb1a84jGxofat6tMi9m+byDbFyeQSrPpANBKflouMWuTavmV7?=
 =?us-ascii?Q?UbAZt3+rGvMtr7tO1CB1K5UK/sY3kDoYfnLEsYeRQwkBZq7T5/RhsQub7cLj?=
 =?us-ascii?Q?PW0+lfs9N4AzH8N0yetDRDpkILsm4ML1vcczInEAAcc54aP2d1zCT9lpJL8n?=
 =?us-ascii?Q?Slh9koo4uCvmI8zRJp/suuz5hKQBY/FYC5f+O12lgKTLwtGrXwSZcexgIVaj?=
 =?us-ascii?Q?QhE6cKN9R/aVKDeP1jjvlOp0Iz9InfUsRl603Q9/qxEA8huSHG7ntG1WbOax?=
 =?us-ascii?Q?WEaYCyeyUIaVAVQm0BVu6GjwkivbNNZXudToVMIzXlnNnlJMhI07S6LSelRo?=
 =?us-ascii?Q?S77UHYuqKMV+wS7xu9KDQBswDtjjceP0m/emimbgrO93IOkVFlens+F+OcHQ?=
 =?us-ascii?Q?hqivoOp8Fg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KXpe7Zlu5uAgz/HSBWkCpLzUt2UsqkZL5UEMuFw/Czam1J3CQe7XwJ0DjBa9/EpVy2FGzo8jyvRqnXx8HJjGhdggr8L1PgMNnQ5J+eSAP/W91WcC9fNDXBsFvmHNTSi7IefgjNUQwP8JIICXCjRGqwD95sUawqP4ZNiDKMSwsgpzhE/6J/nKZVgLGlH4iX7Hso6N3u8m7V9vX6ZQpvQUL6a53QfKxWU1wANk2f2c9eEVwmkpOWErENrVOZ24NFmiL8upsqNXeFGzIfVWxcuTtMzvG+WQBtOhQZX3U6WQ7/cccvq+LXhdcV4KsMR20LKU3Bs6Z7PPIj8dCF2fHoM3Og==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16f159f-7de6-40d4-78b5-08dec861a0f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 09:04:37.0452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vLoSdRAnpQ26QnyhPKRom97KxQSObiNjsGy2+TuvsgwiP//37sDK+RSEyN0YJxhnpD5s6FEZWj4KtcQBj7hzny7BzgLveg/BU7237FNo+Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7750
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

Looks good.

Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Arvind
> Yadav
> Sent: Friday, June 12, 2026 6:51 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
> <pravalika.gurram@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [i-g-t v2] tests/intel/xe_madvise: Skip purge tests under low RA=
M
>=20
> The purge tests create memory pressure to trigger BO eviction. If the
> system is already low on RAM, this extra pressure can push the machine
> into OOM and kill the test before it can clean up.
>=20
> Check available RAM before starting the pressure allocation and skip when
> there is not enough memory.
>=20
> v2:
>   - Drop unrelated chunk/max_t() changes. (Kamil)
>   - Keep the original overpressure calculation. (Kamil)
>=20
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  tests/intel/xe_madvise.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index cdb115d7e..3fc8b5f65 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -101,11 +101,17 @@ static void trigger_memory_pressure(int fd)
>  	overpressure =3D mem_size / 2;
>  	if (overpressure < (64 << 20))
>  		overpressure =3D 64 << 20;
> +	max_objs =3D DIV_ROUND_UP(mem_size + overpressure, chunk);
> +
> +	/*
> +	 * Pressure BOs are faulted in and kept alive until cleanup. If the
> +	 * system is already low on RAM, this can cause OOM.
> +	 */
> +	igt_require_memory(max_objs, chunk, CHECK_RAM);
>=20
>  	/* Separate VM so pressure BOs don't interfere with the test */
>  	vm =3D xe_vm_create(fd, 0, 0);
>=20
> -	max_objs =3D (mem_size + overpressure) / chunk + 1;
>  	handles =3D malloc(max_objs * sizeof(*handles));
>  	igt_assert(handles);
>=20
> --
> 2.43.0

