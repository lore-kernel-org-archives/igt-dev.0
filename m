Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50116CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 06:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D744A10E0F4;
	Wed,  1 Oct 2025 06:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4zzcr8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A6310E0F4
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 06:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759301319; x=1790837319;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sGnbW9DelKvI3SVNUa5i6pXw1kQt7qC3yDgThmIQoyw=;
 b=W4zzcr8Yqkf1g7hMd+3XPjbk9/D1vOtw23EDr70VVV9FcqU07r30mjCH
 pEjdMrVeiDDPV+kkBuJbTFwjjVPUOqE0DgWBsSDOXV7wPcTUhlTgKZY0D
 QYvLMURSwdk1GAgNxwxOyRs1QxwcsDoSU4jPmCBFhkPdVzZQ3zvGTrYbd
 xuQceX5lNYy8+UVvfBx1WJb+05U+lYSUoc/tXcv2foahWwEzY38npPzty
 TBnrA7BZjD/mWnCG/C4pvNRJPb2+prn6pAvbXzFsKaPbebJP1cWfrO+aQ
 L9Ug5bohBJ38BGI0kCuRgCgK/4aSvQgFFGiTB82Dg3h1TxPHLXON1yUah Q==;
X-CSE-ConnectionGUID: cYsSbxbrTVaQPa8iAESAlg==
X-CSE-MsgGUID: WNB2QiKBShemwPCh62Ow7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61674865"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61674865"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:48:38 -0700
X-CSE-ConnectionGUID: QyAAMsbXT+yKKzMtESFvLQ==
X-CSE-MsgGUID: zlENB964SRSyabrsrjfYbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="215851994"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:48:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 23:48:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 23:48:38 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 23:48:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mz7ZRuS7BpjA6XkC/chXEPt7pN5Auaw/+I4PUT8A/qrBWU+wppqDQdaTF6ScQrgp9FiaGWAPLkdvPxL/cAMFrwgg5Jgb/yL9syIt7673ODuxzqRYDrsev77TnmaIyogleXtdZwab1FbWx5KbayGWGRqjx60hbup8sYYr9c1IfBU4o+DQ+K20+HV3S01xc/F4ircrz7l+v03U2YWEzVObDmO/oLjGkiAu6t4+vGVm3yQzxGp9kwzc3br4XSp6EHOGWo+AxT75+lHvBmo9Y/I+lWDW2dX50jJJV+Sbz4yx35oYlChaKUXHMWKukpAc0+M3L98hqpeAzBSL15iVEJovHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pGJPI7/xI21D3XTRwLPcABvUqXbwyhIl5AbXZEow5c=;
 b=M/sPDXzm9ITmlLjLx1vmpQIMxSv4iuQnJ/GQY+H3Ejx5QzQb4DJVDuXL1fo0Rl/iuBcoRUubn1S2qnfb2ZlMepdoQKSl9YgdN3JOttOg8KC3LAzNHiaLIhYUJPUiylGY2Ve4TVVPiTNn45aUoR+RyGafKXw58e9LaMZfumx0FTurcye9IxebWNP3mnai72LyfRbJKQblNQj+BQDFFiLYDsOBMweXHmblM9jdGfB5qfXLMLI+/qAGaoLTxEPotHwH1a25d00j7hD+SnxmXhCdxQ4AaB0Jeaa4Y2seCZX+ePRy1GIeKNYiZ7w1F6UIfERqNNeVuzYlYMg5JPxh2hd/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by CY5PR11MB6281.namprd11.prod.outlook.com (2603:10b6:930:23::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 06:48:35 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:48:35 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/xe_pat: Use blitter to copy to uc-comp
 surface
Thread-Topic: [PATCH i-g-t 2/2] tests/xe_pat: Use blitter to copy to uc-comp
 surface
Thread-Index: AQHcMhb46nzVVOuQYUaAExIvtCN24rSs2l/w
Date: Wed, 1 Oct 2025 06:48:35 +0000
Message-ID: <SN7PR11MB74895E2CF6F7F3F05FDD8CEA85E6A@SN7PR11MB7489.namprd11.prod.outlook.com>
References: <20250930143130.186193-4-zbigniew.kempczynski@intel.com>
 <20250930143130.186193-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250930143130.186193-6-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|CY5PR11MB6281:EE_
x-ms-office365-filtering-correlation-id: 2789cc23-2b12-4b1a-df52-08de00b68b7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?DOGtAOh3D8ouCy6VrQmI8NkUuuCf4zqNKKDGyk/mRyAEsKZrxErLOXnagj?=
 =?iso-8859-2?Q?voiV8xBLPItet4SlKJ16XeUy8qJbtkOv0UXQs/BDZmYOdOZzLlIAGJ+glg?=
 =?iso-8859-2?Q?lsvY+95sKCMK95087Hj5JlS6LVLkPQBGzym0oZigDBI9wvK1Db6eYNRI6R?=
 =?iso-8859-2?Q?N8UoEKLMZccRID+wRfx2XR4V62kty168a5hmKH3tYDHKGlmAUi4zTxrgrc?=
 =?iso-8859-2?Q?h/2jD8isB+WGzW0sos34NfNMbwwTompFfFcD57eZxnCC15Jol2KWFGH+gk?=
 =?iso-8859-2?Q?CmMdgFqHWlc4Q90hB9F6ZItIfuGKk8HiDNG8vpc4AsCxH93XSKB4HcdSMk?=
 =?iso-8859-2?Q?Y1rrQOp0nle4st3S6tKck0TYRgXmQuRUs4F7lvWNc1gNS3O2w5VJ4vF+P7?=
 =?iso-8859-2?Q?rkJyP9sk0IxOdUblDXV3qTlbXZlN2YTVhqb4IMUY7KIEQIGE4WzLStIpRg?=
 =?iso-8859-2?Q?8jzItbDtRH3ilrqlYvLekb+/wG39pqxLob8nsWCt9fJw3MCyaJQS4HQrW/?=
 =?iso-8859-2?Q?jjx/8OnfbLb2q4iQ4LZsxcsZXVP6WR7qYibBXBjsnOliiItgolW6TWQ+Gb?=
 =?iso-8859-2?Q?5idY+h8d7EHoucBzQJNoi9LUcpArBurm5o8TtSFl6cwSOU/ywqqRKfkAuU?=
 =?iso-8859-2?Q?HXN7wh23P3jnjBUwjUfxHWUwBT/Q13rCWVSdzKL1TNi6OZ0kCSWTXkADHz?=
 =?iso-8859-2?Q?FLb7ntEjoDcLmHvyRAZMks/J/8tx5KK9J83y6TjORJd6QqGGb8mQ16rm3a?=
 =?iso-8859-2?Q?C7dBJ6IgEAtyqx9HYOPG5rfI0DOsCuyMqaqx33qS3fbzx06xlX59Xh3adZ?=
 =?iso-8859-2?Q?cOadZrh/TNxV1Z+X45Hv3JWJTjV3MIWzyNS3laZRiCZckBwjTJkXFURCfi?=
 =?iso-8859-2?Q?tGxkEatDGgNtCwGbtm03z8qQPx1ek8dF/rH/nPNmpdY4yRoBFLSa9wwjQr?=
 =?iso-8859-2?Q?TwZhWT2ObwtVu1J7fp6ACbx244tZZejIWXQ9CIiSyU9iwNcwDq3ZnZSuLT?=
 =?iso-8859-2?Q?cdXW+7fCHfJHBjms6GKElt7WCUj6UsT5YqPOYO9QmLM7shRZl4aCrCHAzm?=
 =?iso-8859-2?Q?Fwtqukse3m2U7RaDjpz7Eklyy+IoSponYEk42jW6CD8jr85zzRLxIUrEKe?=
 =?iso-8859-2?Q?kXTtjh3CM+dJEHgZVRscVe8fkz/zrLvj4qLhP43vAtiMCCaBKXxYmdr8qS?=
 =?iso-8859-2?Q?ra560Y1+wxklVT2v4UIVs3e2zX70PgQuEQ0RFokJNGquoC7YD5PLWCFNur?=
 =?iso-8859-2?Q?1MDz81amm3YQS4E27qUAw9mPRp96cioWLPT92CpNEjCqZRGR2SeN+HNRsa?=
 =?iso-8859-2?Q?4a7Pe2Q+gZPLG9SoO2m6kY5Q+4N9i7TEJJkzD8d2BaO5W5sMzfdBPcv9GA?=
 =?iso-8859-2?Q?WG487oRduYYJY9WDMQQtQQoxnxeezPPbFFziQIp91XK3odh/TtBdc0xX9f?=
 =?iso-8859-2?Q?knlaup7QULAwiK5MWB/ec7V11872QC6H0FZieoFBpN1AQ2/fpAUGkQGgX9?=
 =?iso-8859-2?Q?U+yWUj5426W5mVs96dHRl6S2Li3hnPxy16vK+zLQ2hE54yYxbzyYE/USMK?=
 =?iso-8859-2?Q?jw5ktPOaPiKO6PYC8uLce7roCmSv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?M013dRazy2wLMJgcHBCyeytP9wSbyRbffHN2zi1uY0lul+0dqFPBrSh9JE?=
 =?iso-8859-2?Q?KdW6U3mmv1AQ1O7KqRzDs2BSDb/N3igrQDED72c/iDmqcY7WhRLZrVeYNB?=
 =?iso-8859-2?Q?vQeChXWA0Kxmy9T+X7XOdkzDODOR1GYrzyrJ7hZQwQjcfNYI4Hgn8246Ip?=
 =?iso-8859-2?Q?t/dsm14ROpG7YguUs7pMSHTfNgEpFVEv+KtrqVuJh3C/ENqCfzidUpzZ3r?=
 =?iso-8859-2?Q?rMEgl4Tyk8F56zdo85R3ipOWQYtxWnT5B5Brjug3ICrvVs6uLzmhaDEuhL?=
 =?iso-8859-2?Q?/B3H/McDFA1aSjs7UcPchKSpZ9/JaFXWv95nX2kP3xGYzp8t9f06/40Rrr?=
 =?iso-8859-2?Q?GvWyYtGbLAk/eFpNZLrurPcUTXmgAMcYEiXXGw1uY7fD1YHYTk0Dy2OMNA?=
 =?iso-8859-2?Q?toHMTEsj+FvEDqcJcvryyCHT+8tTB5PPRKDht6LVy9s6t0GSJyogzt+g7h?=
 =?iso-8859-2?Q?2CzU6bWHZENLLhecybmGR/oDOyhlLjzyjoPVmz751VnEY3TFEM3gWKSdW8?=
 =?iso-8859-2?Q?nupCtRoOnQ/A0WU9BbM5xaaC9RE6Lkh9YfRt//y2+7+wx5WMy6pq4vuNWB?=
 =?iso-8859-2?Q?4feGebM3mcjK8Qwt6DKit4BRbBVHaYUAFNialWcd/J1IrMu7c9LPpDhl9j?=
 =?iso-8859-2?Q?D/l0lwcMeQBf6H+faDXce+7VdRit3E+Gb+ryDh4y+KnhsgjLoVTROgOeA4?=
 =?iso-8859-2?Q?uYI+3iEsVIkJwLRrZHDPkgm+v3bxE0ifc87njamfa/rFygZ5qXsdOt9uPA?=
 =?iso-8859-2?Q?qV4UheaDoDMkioiKAqu0AvpAaJFhPxQgvpoI/YlBB78r8AGWt7r/O6lO0Q?=
 =?iso-8859-2?Q?mc1ql3RcXOPbbOnhxzKZ8c3IMJ00pcKFq+IE68mtTRkGLTIXnTvQ2/XEnb?=
 =?iso-8859-2?Q?yxskCNXN7W77S/yPLLVaTU5pNZEfiCTdCfcmK6VYOhAcSA4nwcVVaUF1gT?=
 =?iso-8859-2?Q?gT44hUjjw8oekCpGN4YBIy84k2DbqGWDjj0g1EVG2hy2ADg3oMTkQ7bFrH?=
 =?iso-8859-2?Q?l2aX/GyGmbRsEOhtdvUrMsmwr1Tn8CHouxU25ybSEyWXTGipPXWJlO+9ke?=
 =?iso-8859-2?Q?fbL+CW+4OCizT/a+BxoSAYEW95toSK5chV/k5Zkz2RzCUXoScEf0nXyVCF?=
 =?iso-8859-2?Q?brUHmh/ZKCjADeXqsMgCTa32j+tqm0laSUYorOQMF0xTCEhMWQVtKzKq/I?=
 =?iso-8859-2?Q?74qX7Jfwr0W8PLHCfLzCAZFojQy0gpr41q9zax/Bfi3z7QmhIMSXG6bLEm?=
 =?iso-8859-2?Q?dxQWdIRVhSS7dom/eJy8TCrFNbBYPIl5rOPvWrfiK1HZ9D+C5seoZpZm5H?=
 =?iso-8859-2?Q?qBDbJmE28MwX8d7jCzGlxnOv+8xf7hdvLlCsLfQuPJNdcorBBjPOrO7ijB?=
 =?iso-8859-2?Q?bCeENH3jeg8mB+itGXybdO8peCp/DFAKcFIyFo+J40j1DLfxLx7swD2zxC?=
 =?iso-8859-2?Q?998CJyCwS+o+ntBWFmXpkW8Y79dGklibRzIC4sVWzdSxbl3dDtCMko3d81?=
 =?iso-8859-2?Q?V/P0sqKeAFihmSZrX9izTviop89jnVVWZfZ4hvq2peEY5n6DXYriegurLQ?=
 =?iso-8859-2?Q?o+YYbrnFjMvUJl+y/qRV+O2hKEFEIAuVE/G1BNTmtszAYLKsJvKjpy4ayq?=
 =?iso-8859-2?Q?oj8azvqL34tOp2SVafbygv6eQVWgeuSCa5mZAEzUnPWnfhEQZ4jxbPW8cL?=
 =?iso-8859-2?Q?RBC6iV7STLzWo9RCyQxL5RH5Ig5i5DIft3ni62+I?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2789cc23-2b12-4b1a-df52-08de00b68b7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 06:48:35.7301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /XSxEJ8wtbLXTAeinubFRRsuaYAQuN2WJ1Fjk7FtBeNfrA4J/0WJmEMdDHdez470xKemAkFaMSTcyXbBOmzy+wvoEfcrjZMoHZqieMWySP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6281
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
> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Sent: 30 September 2025 20:02
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Auld,
> Matthew <matthew.auld@intel.com>; Goyal, Nakshtra
> <nakshtra.goyal@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/xe_pat: Use blitter to copy to uc-comp s=
urface
>=20
> Writing to uc-comp surface with cpu mapping is out-of-spec and might lead
> to weird effects like not decompressing previously compressed (during
> eviction) surface.
>=20
> Specification requires to use blitter to write data to such compressed su=
rface.
> Use bounce buffer and blit from it to uc-compressed source buffer used in
> render-copy.
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5507
> Signed-off-by: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nakshtra Goyal <nakshtra.goyal@intel.com>

LGTM
Tested-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

> ---
>  tests/intel/xe_pat.c | 35 ++++++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
> 8bb0ac167d..59dfb6b111 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -23,8 +23,14 @@
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
>=20
> +#define XE_COH_NONE          1
> +#define XE_COH_AT_LEAST_1WAY 2
> +
>  static bool do_slow_check;
>=20
> +static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode=
,
> +			      bool force_cpu_wc);
> +
>  /**
>   * SUBTEST: userptr-coh-none
>   * Test category: functionality test
> @@ -419,8 +425,30 @@ static void pat_index_render(struct xe_pat_param
> *p)
>  	}
>=20
>  	/* Write some values from the CPU, potentially dirtying the CPU cache
> */
> -	for (i =3D 0; i < size / sizeof(uint32_t); i++)
> -		p->r1_map[i] =3D i;
> +	if (p->r1_compressed) {
> +		uint32_t tmp_bo;
> +		uint32_t *tmp_map;
> +		uint32_t tmp_region =3D system_memory(fd);
> +		uint8_t tmp_pat_index =3D intel_get_pat_idx_wb(fd);
> +
> +		tmp_bo =3D create_object(fd, tmp_region, size,
> +				       XE_COH_AT_LEAST_1WAY, false);
> +		tmp_map =3D xe_bo_map(fd, tmp_bo, size);
> +
> +		for (i =3D 0; i < size / sizeof(uint32_t); i++)
> +			tmp_map[i] =3D i;
> +
> +		xe_fast_copy(fd,
> +			     tmp_bo, tmp_region, tmp_pat_index,
> +			     p->r1_bo, p->r1, p->r1_pat_index,
> +			     size);
> +
> +		munmap(tmp_map, size);
> +		gem_close(fd, tmp_bo);
> +	} else {
> +		for (i =3D 0; i < size / sizeof(uint32_t); i++)
> +			p->r1_map[i] =3D i;
> +	}
>=20
>  	/* And finally ensure we always see the CPU written values */
>  	render_copy(ibb,
> @@ -867,9 +895,6 @@ static uint8_t get_pat_idx_wb(int fd, bool
> *compressed)
>  	return intel_get_pat_idx_wb(fd);
>  }
>=20
> -#define XE_COH_NONE          1
> -#define XE_COH_AT_LEAST_1WAY 2
> -
>  struct pat_index_entry {
>  	uint8_t (*get_pat_index)(int fd, bool *compressed);
>  	uint8_t pat_index;
> --
> 2.43.0

