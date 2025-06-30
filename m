Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ACBC7EE2A
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 05:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E43A10E388;
	Mon, 30 Jun 2025 05:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWKSo9Q6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4851510E388
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 05:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751259728; x=1782795728;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FSCCqBPzVK0YbIIJT7uJht+cpmf1LXKl0cnJ81n7LjQ=;
 b=eWKSo9Q6ASOzXuHEiEk91NTbBaS+mC9KpnEiY3nsN2xrmcT7yTDmH6RA
 HwlVcwwe/lnCmtkZxc6L1JlLA4ehgbwBrLtrjzgb9190U46Kme+WCujBL
 /OM1ENHvPZ/O6nWnlsworX4QJ1RbcFX24NZAkolZqWhzmbLmSc0VaPdJO
 mCSs2MKrwyxIj+wUz6SV0eua7bWNydNPn2YEq7TfQzjG0XbeSoj7tRT50
 I9WadDGi0dPJuFE26urLipz8AVAmNkJAdJ5WcLIfRZBQtVxU6wu+isozI
 ArkMcuyPvNpsVCQKsd07ZlJLVf51OGmzgceszofA6397ACmcjVtX0C9na A==;
X-CSE-ConnectionGUID: nvMPZ21YS/+gWEnAlW63gw==
X-CSE-MsgGUID: FrAUXiPWRvmd3NwgIl1Iug==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64826146"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="64826146"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 22:02:08 -0700
X-CSE-ConnectionGUID: 1kw+um0MTU+2InIoD8MA0w==
X-CSE-MsgGUID: S6XVj+mwRuSb9aebI894ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="153449554"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 22:02:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 22:02:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 29 Jun 2025 22:02:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 22:02:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEeuRWH9RYwdFvQowDYNYnSv+OgsU3Fq6OeWYss/ZoXP2ki48j+z9oo+8orh0/U32cHWyLYJ17/dTjTr/E0jnKtJAsKAAMVfIsQQLOPNIfb+ID8W82Sv3zoW9nWtd5UD8mcw3Az37LQsIb5eJWxKck5EeVSKIIYjjhdCY+MQTLYzI+efm0Fu1qfOqjWtv7uMA2jEal/v+BSEvsAZC57lnyy39XUSHjKkMpcHes8Qb+g5fP5ezFdiZgH2Cndt6S48B688JJBV38l21D1izLMhs1M83iu2fyr1X1qcFYRQkxuNyY0H+C2q7dfm+42BbcxacN7SP3FYG1Yq685WJQvxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHaBmbZr8fonMK0HyZwQQE+j0mktoDiBJ6NiSIBPOkQ=;
 b=WIyBlddmVN2nIcHoIrpxG+qgjaB65ag+ypODwjjOnFOve46uC/olaC1i20Bqyy8vLDjvuzajsCXLczSdNuELi5iA1N+olPbz1qLIcT+L9CHIzhCsDPky3KQukU8CT2GZJw9UwqgXODFAmIS5TRYIfhEgUQgQMT7LyDEC4Ij9K3j2Ai2tLX0kD/YodcgHxiAu5kUU8OdAZghSKSQU+31G4DPGVTKvp/VjpjClQwwzcXkbXpdBDxHbueOYCNBGBB6WzwQfx28quxOt3ASvRglBxWCTgaeIA/oh5tUdrMym7y0x7Pl4XMjXeSmkD0yTxjlCo2fjivALQrUtE5UUL2s+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH0PR11MB7711.namprd11.prod.outlook.com (2603:10b6:510:291::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.30; Mon, 30 Jun 2025 05:02:01 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 05:02:00 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH 1/5] tests/intel/kms_dp_link_training: rename to
 tests/intel/kms_link_training
Thread-Topic: [PATCH 1/5] tests/intel/kms_dp_link_training: rename to
 tests/intel/kms_link_training
Thread-Index: AQHb5cuWxoUASTTCP0ypQi1xHebge7QbLEAA
Date: Mon, 30 Jun 2025 05:02:00 +0000
Message-ID: <DM4PR11MB6312457279FCAEA389D5A3519046A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
 <20250625123402.3929358-2-kunal1.joshi@intel.com>
In-Reply-To: <20250625123402.3929358-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH0PR11MB7711:EE_
x-ms-office365-filtering-correlation-id: abdf9449-e887-4943-e6f8-08ddb7933f7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RS39uLwVChJKnanQwrHv7X6WwJg/z08eszNFkA84aQ17+xNA31aCVp5U1T84?=
 =?us-ascii?Q?FJtu1ZR5xcyvlVQSffSicGZgKLLxJiDySE4nsIXvp0ncJAMJqWyl0ccXYTUf?=
 =?us-ascii?Q?pq2yMnTpIpv9TPkHH9MrSDJUXOjVzYYBT7eT+PZpuWhUeWZAIYJBOU7E8h10?=
 =?us-ascii?Q?yLo1enG8IBuLtMpVHnW5SbzMVr4WSDvFNbNXljRJmHzKpbKle+C9KNSF8if0?=
 =?us-ascii?Q?aVTP/Y7V4Tk9/K9Zd98uyfXFSWsnVnylOCov9MO3qHIORQ5w4G+7NVao8UtQ?=
 =?us-ascii?Q?/7EWg66VE8FK/bfKGFmlKfXWdtbHBeYYQtozcqzmYpBkMEuvTqYp1FDARBab?=
 =?us-ascii?Q?XbV38ecj1OEpEkFVzDsEc1O2BQh3IoQ2GAxYpUOjLpL51YlMoyenNCYfU5MH?=
 =?us-ascii?Q?xodz/PE4m8Aah9GNE1UFxAaoyxMg7geMo4kfPCKGDscxpjjRDE127OPq1xYy?=
 =?us-ascii?Q?NYHHDCz4NGQrDJzV3zQA67X6swNNTZK9J+olS0gkuiGvP4KQtfhouhUUD6kP?=
 =?us-ascii?Q?XJJbuqrRka/3IagEMkmvwBU2setJq+NQvGruDT95gSu4FWoi3qqf6ReGL1/m?=
 =?us-ascii?Q?6WpAsc5q3gqtYlnfmStgGjvCTpnh5rqajbChVYLonbEqfJf87WCTLR4uLuuG?=
 =?us-ascii?Q?aFR5v0ZdvJJcKWFuMGVtb/yTT/6hTGsk3twGxfQQ6g/6FpMI3oBt/cajTR8c?=
 =?us-ascii?Q?o1BK+rrXw2PSJJZhkBvy1r2oVBsxefXTRTIYoFbN60EM6fUvthGAxVu5OWA8?=
 =?us-ascii?Q?ehvv9D5NUudmk1yVM4Q4ZoDJVO/xVAZ0kWFsNpZ8fSNBu0cucY0m1AjvL0OQ?=
 =?us-ascii?Q?Hu9Fw3uaT6hs8PFCtqxJ/qXWep6nY0kOF6vFuSbF8suJ3j5XynKC8pBDZ/w/?=
 =?us-ascii?Q?envZCvNjt61jgQJNqJVC9MlueKdMNyPjeDkIq+OphZH7E5QgMI+FXWtTKL+D?=
 =?us-ascii?Q?pdJVFOQSIgf10KWZ+LPkESkM9Pw15K/qFyRFkx8jK2sIw72zu4Pa08uM1+me?=
 =?us-ascii?Q?x8tvpfDd4Nqkgk8rwPcJ0lj1Jj++2PxJrDUcd/6ibW1mVU6pFlkb2FnTiTYq?=
 =?us-ascii?Q?vZg95BFuconPraaMBei8dQINkqHGK9+jlGhIQwvUWOBzfVfRtvB0+AXc/Gzv?=
 =?us-ascii?Q?SEEZT2N8Y1wG+SyvbzLmLO44bsnnSOhS4hV+Vy24PKBChCcp2imp0DD7wcac?=
 =?us-ascii?Q?e08P9Czkyj5TbdPfo8DcVvURT1safJW9tE2jinOLV3H9MUca9RdAcLQDuJTk?=
 =?us-ascii?Q?3K9ap8E0W/jfBwUVs6aAy+NCZBkamIgM+SruC6RGZepd5RKGKqrycecwoIdB?=
 =?us-ascii?Q?W5jAcaNkx+FcNAraIKCPRzwQritv3qP5ccwseWGPTpuwJ9TVm0StGX4kigKE?=
 =?us-ascii?Q?2h1yksdFob5eRb+hlNp0Y1Oiqmo1GgcXV6yZziDNOEnj386eTXVPAc0c3xYw?=
 =?us-ascii?Q?m/1GEyKBaWNtsAEspvC5/nmWLY2Qb5BKYtcXStvSrDJH0MhUmEU8Ng=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Slo88b+/0h2zC2UP13IlTVl88+LV12F8y/TTDOK1IoNNwF7hquECYqlwfkq4?=
 =?us-ascii?Q?dSUCZARolcB+Ppka+RfdiQSBPQRif1mwx90MqQbrBmYZJB4APUgVcha2zwAK?=
 =?us-ascii?Q?mNfJqfLylRguX8JEh8/IYoFte7vrFSl2/bqsEhS62mX+/ZGM45ZnuExGCcMR?=
 =?us-ascii?Q?vNUZzL7LtOyAG90MPxcvD1l8QOkcbqS1WtuUTKPr0MXHmK0pQG84QQGAsOtL?=
 =?us-ascii?Q?H+DF0qPStOmwz/HKeoSILCgtqfMOnf1x2fFPe8mFT9CqSMDx1rjO8PWSpTWA?=
 =?us-ascii?Q?8wIJW5RSYbgmwh9otfIF9GDLXlc8X132s1Q/iyWjC//lEz4cWA/6esQecX7C?=
 =?us-ascii?Q?KBGwKBNIB5JKDWNh23stxIcb1ByRqchnFKYrO3gGhUU5phXPsgD1JIDALRpU?=
 =?us-ascii?Q?+ltbqYw4AL3dTpwPg1rMTOMUyE3olYsK4js3WXbi8o14fcjTNJ5L3r7qCH8N?=
 =?us-ascii?Q?bq5JS7PV3mGP4nUGPamwt7bvDgl2k+9sEE5RPEUihm5McUuQkqhxDv+RSPQT?=
 =?us-ascii?Q?9nDRIUNh7U9xB1HPFW5FiGaJZMIH9gtLxZoGrIea7zylCXfvNSpa28IM+SXF?=
 =?us-ascii?Q?ehUesOEmm6g3uXMM1q6RmLb4al/P9norGuvIc7ItM3Ro+KJVDsJOAXlnE5yH?=
 =?us-ascii?Q?DftKCRyo96NNlxFfU1jmP3p+35jjGrRSEYMIsE1cFW3FqlGHH6WGJRN1m+to?=
 =?us-ascii?Q?cyRZA7MhIN8kWYRF9jbNo4Ig9IlNze/nV6Vn3wjeE8ZLUxreNCtyU6rG6nTN?=
 =?us-ascii?Q?W9R8a2+on/5eI7GG5hSfDAU/YnKGEPOmFXogFF9GQlUUtFg3Z8iZdCcT4j/7?=
 =?us-ascii?Q?0tc1KixD4evgt/qzL3J01EHVUJ27QTuJXdyldCN6ehfVt94gkk1EeedEUy90?=
 =?us-ascii?Q?qJjZ6nnJF09y59zbZjeoQmktuujS59Ncj7RBnZ9l1Zg/rMnfhKRsoMHoBGd3?=
 =?us-ascii?Q?MqOACiq153F4ldHLqhhAz/9ESjywbWtKgYDadnE0P7iufyM6YCuz57UFsmtm?=
 =?us-ascii?Q?+Mrbp8oHX090wuq1PmEgn5PusrOkrTsc5Y1s4XWd1YaBv8WXm/l0DyaSHfFx?=
 =?us-ascii?Q?KEfbi+awKs5tpCkscdRIdbcRGMMQuNhkqdAiGu2jkQgf6JCvvOI0dXrgxJJu?=
 =?us-ascii?Q?92eMq2zo72oCNZ4pHuAxXUXFq4Rg4KGInzsSm3eZ04VGf9PDOsLJ9TXFXosP?=
 =?us-ascii?Q?oLYzKFJzNRLBRGt1X0jRBYGfio3Vusq03u43gKB/j7/WtFgQEwpNvWuygrd3?=
 =?us-ascii?Q?Ztc/Ifu+HdruMdz+Oz5Az1+tq7xV5BvJM+/Q8Jgr9dsUF35ONOwy3xQ468sY?=
 =?us-ascii?Q?uDRNrhjVKT4MxEkTBlPrlV/wl8R86UlBCEZZsSNqK1bJT9pGl8MHpMNIxfZ9?=
 =?us-ascii?Q?4e/dpHtDnT85EqNPqbsc44KdFM2DCJLy7aBWPbbeLFf+qiDzG9bJZA4l9XEY?=
 =?us-ascii?Q?gO9JrA538SVQH/JcNKmFrVYePMjSvJE0Tk8JaNNrOI2dy76pnVTSeXRYTegF?=
 =?us-ascii?Q?yddPCEd52V9Uq9gAdygZxR/h9A7jWCNYeXLfk07oUCrXwtGptlCO+QBAIS4E?=
 =?us-ascii?Q?xzZ54W2WFmB24L+OuC8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abdf9449-e887-4943-e6f8-08ddb7933f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 05:02:00.9153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RDpr2fbxfcYbrPflERxeKfG40+prj+TKpwxcs0LsJiV91msPZYk1NI84e3Y11CvXpbQ8ru2ai2jQ9b6n1hMotw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7711
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Wednesday, June 25, 2025 6:04 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Deak, Imre <imre.deak@intel.c=
om>;
> Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCH 1/5] tests/intel/kms_dp_link_training: rename to
> tests/intel/kms_link_training
>=20
> Renames kms_dp_link_training -> kms_link_training and update meson build =
for
> compilation
>=20
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  .../intel/{kms_dp_link_training.c =3D> kms_link_training.c} | 0
>  tests/meson.build                                         | 8 ++++----
>  2 files changed, 4 insertions(+), 4 deletions(-)  rename
> tests/intel/{kms_dp_link_training.c =3D> kms_link_training.c} (100%)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_link_tr=
aining.c
> similarity index 100% rename from tests/intel/kms_dp_link_training.c
> rename to tests/intel/kms_link_training.c diff --git a/tests/meson.build
> b/tests/meson.build index 55bcf57ec..bfaa84389 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -245,7 +245,6 @@ intel_kms_progs =3D [
>  	'kms_ccs',
>  	'kms_cdclk',
>  	'kms_dirtyfb',
> -	'kms_dp_link_training',
>          'kms_dp_linktrain_fallback',
>  	'kms_draw_crc',
>  	'kms_dsc',
> @@ -258,6 +257,7 @@ intel_kms_progs =3D [
>  	'kms_frontbuffer_tracking',
>  	'kms_joiner',
>  	'kms_legacy_colorkey',
> +        'kms_link_training',
>  	'kms_mmap_write_crc',
>  	'kms_pipe_b_c_ivb',
>  	'kms_pipe_stress',
> @@ -377,11 +377,11 @@ extra_sources =3D {
>  	'kms_dp_linktrain_fallback': [
>             join_paths ('intel', 'kms_mst_helper.c'),
>             join_paths ('intel', 'kms_dsc_helper.c') ],
> -	'kms_dp_link_training': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_joiner_helper.c') ],
>  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>  	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
> +        'kms_link_training': [
> +           join_paths ('intel', 'kms_mst_helper.c'),
> +           join_paths ('intel', 'kms_joiner_helper.c') ],
>  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],  }
>=20
> --
> 2.25.1

