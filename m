Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1460C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 21:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFAF10E6DE;
	Wed, 31 Jul 2024 21:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0PnY1oC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ED410E6DE
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 21:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722461975; x=1753997975;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DGmQsvOmW2Tz5LaxuUBjqcmqcomqsFkyLjOADOrIyig=;
 b=L0PnY1oC7L9ogD/JZggRx88qZWLNpiU7tkBymEQuxXoGY281d1xO4DF5
 jX1qIBfiSVDXmXWcpYxSmILC//wM3d+RWOu6GetH+ycnGogw6ahAuXZ7K
 nMR0m2GU9y1IjNt4VhvXDGqVzCec34dR7v9yk9yc1gSi7wDJRi170MGm/
 2xEJQl801waDW05x6ewkz2TXl/MdJVCJwA5FQ6Vv8/5MK221SbywwMp7a
 TXY/tRaFHbL8hhXlWLy8LLgp1Zpbh32443OLjyNXzNYGJvFd6CfzpED87
 ikFz7DVG/Gw8MnxFiXuogHYwh/i1Cmk7AclB5qXJBaIPgrFtOxSncvNhO Q==;
X-CSE-ConnectionGUID: sJHRYxYWQ4KcW5BsRzgNnA==
X-CSE-MsgGUID: +XqriY8aQUax06tYZYZ1eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="23288907"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="23288907"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 14:39:35 -0700
X-CSE-ConnectionGUID: YJ8QwqvwRs+mIBiTGEu/ng==
X-CSE-MsgGUID: 8V+yu6ajTBmx6RaYsG2Hhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54886693"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 14:39:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:39:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:39:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 14:39:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 14:39:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEBYYyxADxC9a9GvPd5gKsCIJ4/kulgv99qnmo4a7D5H/X5JRsFgYVZyBmmDpql1BjQDBA9NG3KJ7Bb/Yvtp6QHriAwAGwHRkKVOwRQgGO1QTTFFJISk3FoKn/8N2Rgk0as4ofnohbR4BvKpQv2C4pLuYA1J6lXxwkCimh2+JU8n7eVyfd6DcKAYxc+DoPoyQHtL4V03bLfVqSIAKciN4Mm4BZkE0Vs95QwY9+W9/KdKhWfFgBxNp6xWTZOOoA9TfOFN5SLiOQnPGTgb4q3w+hqFVpbxUkPjPtpgABlVIbd3Tsx23sbhTvlLTqZGn0B+Q8XevnWoNPLdB7FXu5JemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVfVupaj332APvdI8kb0/TcPIYYFkvwiNabQc4bz61Y=;
 b=QkbJJ7I2UiSjIH8y9R8XtMTUOomIorcAt9V2BjzmK06HR7dQRxCqAwDj4E7x2mGvR+ylQFcJus7fhe0mdv5sxH9jCOqCfPWR1Z9jvqQZX/bjehyGjCBpv2skJQHS019lDob8LX4c6SxRQVtef/vtM+pT62CNqNJfOzjF/JG2epk0573bkembEyByTPfvUYept6mi1OdMxL2WAnAFdTe/efkwsXAFs/OTh4iwEKxOQhRPeVUbTUg9pVxuUKcJDrhoIhK4k/oPLFq04UJbA6zXAnT+J7aJIiMy0HWRH68TjWutI44+W2hZb54eEe5BPf8XWQu9BM2ATd6aZxZ8WPcDLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB8042.namprd11.prod.outlook.com (2603:10b6:806:2ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 21:39:30 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Wed, 31 Jul 2024
 21:39:30 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 3/3] lib/xe_spin: Fix ending the loop
Thread-Topic: [PATCH i-g-t 3/3] lib/xe_spin: Fix ending the loop
Thread-Index: AQHa4vrDsOsjuqPDlEmb3QA0j6dbjLIRXdbQ
Date: Wed, 31 Jul 2024 21:39:30 +0000
Message-ID: <CH0PR11MB544471415A5861F3AD3CDB6AE5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240731033504.1426640-1-lucas.demarchi@intel.com>
 <20240731033504.1426640-4-lucas.demarchi@intel.com>
In-Reply-To: <20240731033504.1426640-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB8042:EE_
x-ms-office365-filtering-correlation-id: a7f1fe4f-c81f-41e6-81b2-08dcb1a94297
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?wX8EAhQkQHMqBvEtcr4DleNcqxpgXGyawlI8igLsQV020pMwrU9k2VcvzAiw?=
 =?us-ascii?Q?zp2F8HarwYuNUoWJ1h1h8jVM8VD7C3aQWUYDqbPaJR6fkVjS/MW8ZFfudgdX?=
 =?us-ascii?Q?EVfA87MOThQHP3/tLlFGx8erUp/EwIz3oHDedE2UqjapWVTM+D3GZtfKT7ZT?=
 =?us-ascii?Q?u9Tcbvs0LIwexHZY8ZmGrcJt5Nzf6gXHGd2Qc36PVjVq8J61W15cdtiRH1qQ?=
 =?us-ascii?Q?5MII93MBlaDaBB0FrB+5f/2MO5b9n1BGcIeH6W9u4hDfszu56upgrOVELqH3?=
 =?us-ascii?Q?CqMANWl2z+8rbMyvgRpzfTt+gKvbIqQFJk1yKrkVc0nPysDMUuocn+oiFuI7?=
 =?us-ascii?Q?9/IMmF2iI5yHFM29Pyf543eUBW9FftHucL7PnTZY9y8IxJJPaxTOqryscu5h?=
 =?us-ascii?Q?BDHTNornUfItvxy1h4LBNzdJqRewn+3OWAXSaZM4UvBdlayhMXqk17CfDtl6?=
 =?us-ascii?Q?kNIBtAEkK/TXyP4fJvHGtB1wL5OaCakWprkoL8/quIs6mVXbd3AdZ0zoAima?=
 =?us-ascii?Q?HxJdA72M/OLzzFYkP2DToxMe5Lhc6qK2sxoRFsfD73IYQGn2sb5A2vqxeqOu?=
 =?us-ascii?Q?z7n5DzjgATt185oFi+8O0reVkrJudN4bz7n3BJBx3QntqTFObHL3uVmhW3ur?=
 =?us-ascii?Q?vtWNeTy9QgiberZWvQ0N5E4aHEsO5rp8eoKRRSZAPecnHsj1r2rIatZb/qWt?=
 =?us-ascii?Q?jE1Ep6haY9waEvgsvGMNj/4AtqKuwj2AoncAF4up6zPj5Cfmcb/tQ65vpLnj?=
 =?us-ascii?Q?14JoS9JPvSVtC6O4qW/s4WOxU/3HBEIOqnE1GmENhW9iSYQuIsYBmYQmYUEu?=
 =?us-ascii?Q?usPS6PWFvbQNcFPnq7Bj2wU2N/AOdrucgRMNqZdMMB3L/Y64YjMCeJVqSowT?=
 =?us-ascii?Q?Td4Njlfk38uoxWRZLAMbQZ7/7xCwC8JuO19Lle6QjWYCwbvA+VYkLHOa1Tof?=
 =?us-ascii?Q?VS1zgSZoEjKywPTQVkTMrZIEKX4gys0j7Imx3pX/GVBivp0LanO42y3BbkXy?=
 =?us-ascii?Q?Kd8PH75Zo21P/GpKdWnHX+2ajHU7Wx4/5VH5nX/4M2pti18p7loACC6KQbK1?=
 =?us-ascii?Q?1Kv27t40VLnTh7fCwMuVRbQrYlE5IBLPQDMtdv9pX/CWrZ0v0x5hoDva7nKN?=
 =?us-ascii?Q?rOkqTYcl3G0DCyqDg2vrdd4CJxGWLmVRfZpav0ct+ph7RfH4V1qqPghz35+w?=
 =?us-ascii?Q?l4sfIyLbwqOGhnSnkaGf8AakiSA+IAKOQIZ6Re6O0Od8G2DmEcfj++o1UsPY?=
 =?us-ascii?Q?IA9k96tkf2VrzRNs7qmKfM5q2jFjCuWWAu+PC5X6jINWUP2adZSam4QmkaDl?=
 =?us-ascii?Q?v1R0LPsH9PoZ+0Y5dsYx3tZs6Qf+K3Q0PC2dHHV5pgg/Q/7SDwBj0Olwgj23?=
 =?us-ascii?Q?R9hcwJC/TnpZsZRm815Jp7JVknFR/N8YrXZSPFvgpI5S8OYnZw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?thdonyr0kR/RS0uea83JenfJBcaIl/uisCVi8IS6d4TqQ+aBa7/mWkAhE5XJ?=
 =?us-ascii?Q?BiVLoqZsmnOmg/Y/yabimCJVBr6U0Rtu47qJEgPFaXlxCG+xtbqga42Iy4lY?=
 =?us-ascii?Q?0AKhA6Uy1rI3Nlo4fSl07zQRPRUmcu4Tvgr4jy3eIA3HgNcy7uehotSwvGMa?=
 =?us-ascii?Q?hiX9+Rm5QHZ1vsqv4cTKVcM/zqHiO1pLv4O3GmLRtvW9EwGlFaz/WTTXJL9D?=
 =?us-ascii?Q?zZyzfU1i5fYxSuqBNBSlBarY1gqp3iVhkfRXaPbnYuWi0L/yxQd4O3umVmku?=
 =?us-ascii?Q?u3dHP2UqWZXDRicLYGt8YY27ahy1/0lLwcg4aRcUczmdpe6E4ddXNXnTUXoU?=
 =?us-ascii?Q?PRu6sjHxcIUvg8k/T4A1N67ntfpTRj5MR+kthnnvW1BQ6tW2Gj+3wCoQusHC?=
 =?us-ascii?Q?YnfCtAWzKKKsmcUimrIIVDMv35tnsrAv+ubhUck2a9Hv16TjJFkMZECTbA1Q?=
 =?us-ascii?Q?PpX4Z9zaEFZ6Fomdg0/hDSW2dseSeKUTYMZaf31HQvBXs9B1QVSzGhA91gV1?=
 =?us-ascii?Q?Q+72nrjmZ/MtAltGLo5BpAt+xac7sKQw5q09/Wlc2hiZaQhm3WiN8KmQbrPD?=
 =?us-ascii?Q?kaDUTVhdmsaX3FjmZSLg+ytLQ3Jw4Ub6nTvJk+goqAYwQbQy41AVksTtyF81?=
 =?us-ascii?Q?su5hLcO1+3sscGTl65sykGRYWo9uY33Mu2SkPq1BgBzK+vjk+Wx79Vt6tvb+?=
 =?us-ascii?Q?iynwgme+9pymrITZyrbi/fcFJ/W9TAAV7hnLoX1SovYztzes1fuHCuVcsnmd?=
 =?us-ascii?Q?4xVeQGarHyhhtvmv8W8pVoK/aF2xKWjRFaYxkAKbBYSHUhhoMNbSaOtwtZwB?=
 =?us-ascii?Q?aOFoI3j0NERsuDjPYV7KLKu3vQAd2me4YGbQBDbchvoSejXFr7r8B7g4DNkx?=
 =?us-ascii?Q?znusB4z/6JA1F1ESSlyAmvDpKJ/cOTNfEhjez73Li7G/jz6w3+1zwZT9qv4h?=
 =?us-ascii?Q?8FYNL42cKIzxaw/Ebww3TXm2L7yYZyczezH58VR4wI+O9c/Z+tUNcKQAsNyJ?=
 =?us-ascii?Q?9qSX2vPPWUVPkYKSC4oHJltZyc0cZwLT2ZLvmsTR1xskP8w0lF8iXsVhblEk?=
 =?us-ascii?Q?hGNodk/+mQHpihdzNTDcJrrQJjk8rhQH5ul7DgsKkl3P4Cj/itMrxYNuZ9xS?=
 =?us-ascii?Q?b75d/1l4yDGrT1AkXueRYkaNYjTD96exj0/8mUMEJSznn4DtpaqNzrrK9CIx?=
 =?us-ascii?Q?fYTlc+lqRA5gZ8EKqLJ0/NDuTMyTJAzh/x4E076ILwWuyHWTFLauKj8BAk5J?=
 =?us-ascii?Q?L6QSv2wRB7nldHJB7mRS6JaqYRrJoRct6b2MugrzlK3L8QMaGLb2VJJ0UKfM?=
 =?us-ascii?Q?2f8fryKQ4uJ+XpW1ImwKNH6PJvvPu8K+SQM1AoLZZhuxWVOzZCyrErXv2jwO?=
 =?us-ascii?Q?8oCVEWQYaJgKTDjmbUtQ3hFXFdo2xhCDm279Nu3SCYoUai/YbNeI7QN6IzZs?=
 =?us-ascii?Q?QlpfC8NR2qviFuPpjEU1BC7q9/To0v0dFEWjH45SCOgvZzgErkRWLqyXZenw?=
 =?us-ascii?Q?q3N8OW/h2AWOpc0DrK6my6d45rmDfmvuAXsWnygOn6Txs9qhAunkK1RHMW4a?=
 =?us-ascii?Q?pRkxK/BWdlluRWuonNmhrpJ8VxiKFlLrYXqkJqQC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f1fe4f-c81f-41e6-81b2-08dcb1a94297
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 21:39:30.4140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQnj97W/bxKHJO1tVx7PmmiQtLJTCLOz+Z+0QeD7+Z32q5PnhjEvoxU9STnqhAFQ+YW9XviwuDwGYWf9rZl6xXwpaoMXoD/l2GsvFK3jQ+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8042
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Tuesday, July 30, 2024 8:35 PM
To: igt-dev@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Brost, Matthe=
w <matthew.brost@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/3] lib/xe_spin: Fix ending the loop
>=20
> Less likely to be a problem with optimizations than the started
> condition, but let's stay on the safe side. Comparing to igt_spin_end(),
> that one uses a sync_write() to force a MI_BATCH_BUFFER_END in the
> beginning of the loop that has a even stronger guarantee.

s/a even/an even

My question from the prior patch applies here as well and is still non-bloc=
king.

Otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/xe/xe_spin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 43a7a43c2..f8b225125 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -183,7 +183,7 @@ void xe_spin_wait_started(struct xe_spin *spin)
> =20
>  void xe_spin_end(struct xe_spin *spin)
>  {
> -	spin->end =3D 0;
> +	WRITE_ONCE(spin->end, 0);
>  }
> =20
>  /**
> --=20
> 2.43.0
>=20
>=20
