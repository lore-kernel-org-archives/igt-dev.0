Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96CCCA1005
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 23:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C1E10E06E;
	Tue,  2 Sep 2025 23:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9D3Mt/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048A710E06E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 23:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756854906; x=1788390906;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SMafKw2tnwbVImUUaQAB4xXwWVcl1o/ASOQJVJHUz6Y=;
 b=H9D3Mt/f0TJrpgSfxuqXBAXq0dXxDG9yEc0cSVW6hsH5MfYmfoofPk2q
 Rqw+EdGbcBHZJjKgeXbfmZR6B7SUL/OKtY2yY2mbg4pdT0NSGbHN21HAv
 MBEj2PLdhCeNlBvM7x7AJ0kbZAM7LbL90Uyz6CpRu4H48SjBz2YBu6U9l
 zmsCfveZjAEC0xQR1TbOsRuVdKBEBAcEYt4Fzr65pY2UuaR3jg6IPdAMb
 bF1NRHh3wculJvjl02E/HLwruGlvkuyDGXDXUKK/FAh4svxZ+SId67HD3
 6ORSgoYk+zfphahMKcx6PoPNkjy5H2+Bf/239T6HuNcKwADB4M7UWpbr/ A==;
X-CSE-ConnectionGUID: owV/9iMWTKqFGf3P/fVB6Q==
X-CSE-MsgGUID: W0yhwK7rTt+Pa6WXGDffeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="84577259"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="84577259"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 16:15:05 -0700
X-CSE-ConnectionGUID: DPi2Df1bQ7KD/hheTYiP6Q==
X-CSE-MsgGUID: gAcQ/wlSQFK6BjmbCu+8xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171391505"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 16:15:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 16:15:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 16:15:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 16:15:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaesDqFn6FIBdWzc9vLaNWLlB3BemFdpGcm4t0FYop+5EhrUamjiBDkXo+RqaLF+s3AMX4eIqD47o/s2i1ogTVMhJEAu+OHnMfmaCnMZSmo/RRVdUF3LE1Lf+2eLAh/oIoC1UdSY5pWNQK8MQWBg/Q/LODNGpqXqQ4I12z47LpaeHHVFB4LUa/5C3jq209Rj64OngWL03rh5f7i88KGvs/3jp8HTS20AaBQ21m76GAJGECUvSghgfTmhp26ZEp2UOtfAty38NOqF436tEUC1wlk/aAMydx2NRgwApghH9WfnGINqpgZX9sAKBNgp3VIhUao+bPEw7LKJXdDSfJl38w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlhFHNO6tDSm+ti4ZbX/h1sQNLxNUef139zBl9CLsVQ=;
 b=O9fwEGp2t2mlKH9m0rNXIz6aMiTuuPpmi99kz3eTUbNrMVbojGGdjeLWyM3O4/QuXGPYNX1CuQH87vNFHx0Qgh5Vxa1cLAazyvMRriy96pFxtIKZbkHjJ2yrW/24pGjr09W8F4Id6VA5XS4Y7BheVOFDrJizwKwu9WEWxUkIopmv0dNOizy6yupx05QdNcKFMEY6EVIEzQ4q+6VQccRTisXCQwdkt+BWUarntNlZ03AQPG72eh/50DhLuWmYK/vYV2AJS8aUzBujqczmAnFc6qcw2E5cmM2FNulzKsY23ggu4PnwLCZVgOyyuZ0pcxQc/csenfKTcZW6MpOUL7XL1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 23:14:52 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 23:14:51 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC
 modulo 4 restriction for ADL+
Thread-Topic: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC
 modulo 4 restriction for ADL+
Thread-Index: AQHcG+Knwpxiv/OlvE6w0/DMP1UoI7SAdHGw
Date: Tue, 2 Sep 2025 23:14:51 +0000
Message-ID: <CH0PR11MB54443B06C58AB3FDD1809EB9E506A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250902083342.104956-1-uma.shankar@intel.com>
In-Reply-To: <20250902083342.104956-1-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB6621:EE_
x-ms-office365-filtering-correlation-id: f4b6e618-be32-46d0-7ec6-08ddea7684ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?fww6mg5OkuWBCopcj8+Sp/r0at1byBaAWPNTExxt75BHQevDJaLwPtbYrzIW?=
 =?us-ascii?Q?s3GrIsyVmQpZkDCJAHeaO3TymFEQW95ECAqm60NfqrUoApyUtbJ6ntLYT90l?=
 =?us-ascii?Q?TACyuONET1cI6FHEzMLwm4hy3vHslihks3ZtEZRIK+lifrTjr9WpgfOxvtgt?=
 =?us-ascii?Q?aCPNl1T9G9rBYDf/elekkMvVuBbALQ02Jt02eFrlMQJ7rpwJrs5j7XI0+rEc?=
 =?us-ascii?Q?znURNd/V+sl31otsO3QUq1IAdGKyXNzomHm6+apUTiQp8rAzv25u3YqG2qKB?=
 =?us-ascii?Q?5goAo88jhCeTRMs5AQDkzWHNpFbJlN70BCgUiKRfoJMZiS9L8AMw5W0Gl5Vd?=
 =?us-ascii?Q?EgwOpBHGjDZIhVaeXjMv22556u9P3xiOowWNQRDHtBRfqkRvq5ZDsgB+17nO?=
 =?us-ascii?Q?f/l9eS8dxW+6vNqLH2km2MUq6pKqivK73eurebdts9Jrt6Fxbm/Z/aIJZ1xT?=
 =?us-ascii?Q?z8xI9HBsnaNSDzcdAEBZcG9QISafHXk+JtyAcmYGfOXj+1qbGFtd/sfZPFZe?=
 =?us-ascii?Q?RkqQdqAs2QrTRG6v/pXZ/fCrRx+OVI4rhvMGi5ruamg1YBoWofrGveb47M9z?=
 =?us-ascii?Q?W1kFAJAecH5f74wAV+aZbTQ+7aISNvmUAQtDEthKlVf2eNKxFbqApnroEzXr?=
 =?us-ascii?Q?dTAgGs6X9f/he6ATr+qTgYvAHekloBl9IjQ5AbBgiIvSa5oBuGWZi/x1wOCp?=
 =?us-ascii?Q?no6OVm0NsS4YT/vD/b4P0MDY64AulHIpdX16meK92lT449tbLQkrbvGbInCR?=
 =?us-ascii?Q?5Z24b0ITbynhKNkIAYhk5ytkcV8Rkv7D0pK80MpSwI505JodrZP5GaJnZmT8?=
 =?us-ascii?Q?MeRDVL6NRnhrFsJ+nVKykALB+4XRw3WboukSsC09AferffMawZxlp9gKd3be?=
 =?us-ascii?Q?3sukMnqA3sdvnzStz9l+Hqt6c+PJyPOj2AN5RPfJ6y78S1Xh399vXKLS0Qxv?=
 =?us-ascii?Q?upawIatjvXZrHz9gCpctVNvcx5dXQhxdNnK0SpKd4dJLgeVwvFo2On/3hDn9?=
 =?us-ascii?Q?aCHqt02Dsu3mUasy4X/YPs/+7OB+QrYlUEHH2j6boSJmRM5M2W0tNkZhwwy+?=
 =?us-ascii?Q?IOU2KTgIWK8ePL2ng11PVUcSQe9bm20+2Jq2rYJTBas/ebPPNauDpPCozGfC?=
 =?us-ascii?Q?X/sjByBZaim6+8lQ2S308E3jaoVEqvtSAXU29RtOd4fL5i2Rb2qNtVYjqQqp?=
 =?us-ascii?Q?iMY+KjX4KknmNZ1E85avCEs6ELSHVHi7HzpeP0GPPKfsfb4K5KPmEBHubt4O?=
 =?us-ascii?Q?9IME2yKck3UtKsXGT7lYTWpxgZpi6Ibu1zn6uzcRFld9zGkaIFJ1hOBSElTB?=
 =?us-ascii?Q?Tz+aAYWTmHmzMzdaRjuR62zLD/iATY1AlFV+dEHT18vdxJ0MrLZUMs4CViqN?=
 =?us-ascii?Q?fa7iPD1TvrWPu/g6Z2Gms4oJa/4Y/sKtQaV1Vc+s4PzSdDwGOozjn8mYrkAI?=
 =?us-ascii?Q?AaxlZ0kaqqIgN2DNyMSjZjsJCbNNFmi4FgGHSw1WsTvyQy+Bf0yUSw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q/MYar0uJmBFUKzLSx6Q1VpfFjHsjCjG2ddIjEaAg7CzmbUiZL6dZ/xIkTfK?=
 =?us-ascii?Q?BjHfZANo4H7JjkfVfGhhmBn4WBrAaMI059u8hGgyqM2fZVpy1GLfNa+lwqVD?=
 =?us-ascii?Q?h8Y6vrsrzHwkIzh/N2kdDzqvIGRA/6idf2U5kHUU9LdMpjIyVvssIQryvTxn?=
 =?us-ascii?Q?NBFCXnnN11gmILSb1d3DncgaKRYLCsAfGRVjdlsUWupImf2W149ibZOsq5nf?=
 =?us-ascii?Q?bs2lhXJCRNVAgYz1UhF+uIwQFvRCaHOHP5gImtQCaz4CN9DO3Lx7Dmc1cCJm?=
 =?us-ascii?Q?6LMjhGSYPo62tP+IZ0LZPj60VeKQTkccF0qDbpXnhVmXRXLG/fUi7Dzzp23A?=
 =?us-ascii?Q?YbLOvvUGf9iO65a1FqJqC93wrXrs9WcflN6ox0cTYnoXXvpIf2ZxzJO780iB?=
 =?us-ascii?Q?crHacoFRenZgNzXLBniTp4ASp3U09drKdrc/LRTr+uMYh5YvuYAhO8b7ZKty?=
 =?us-ascii?Q?vma3wMHexLAqkZuHqnSWCtEJvliJrcD/z3Ol950QHbhdyCQWRUtCKRmxRgxg?=
 =?us-ascii?Q?NzqkInS93ypysSOVsPK0KA99UTo5jCO5HRjxhz/m+hIN5fK8oMPYZLfzHKYg?=
 =?us-ascii?Q?D/bAis5GWW3simGPSPKGPK/pYI9xxhINv7mBE+pw2J+0nomYAU5p7Sm9LCaA?=
 =?us-ascii?Q?dhoV6ZIAmzPTygQ/x17P3yN2qj9OBS3jIFm6oNZghiIAfDhBGQ5qd2r6y5wf?=
 =?us-ascii?Q?fFEhQwZasq4Aw8Ihe18PPuF1LGyuQ4oBLpHDp0Z2nApZCI0TZnLczYs6ipQ2?=
 =?us-ascii?Q?MWbWxyNLNqirM/979VfPiAi3XV0fxYTG+MPLb/V2/68rKaFTWAWxpxyd58fH?=
 =?us-ascii?Q?vnoIlfDT3Z2sSISuPqhSnIraEhromjVf+cxReZqnoseoFe2xpQAx4kXsbDsd?=
 =?us-ascii?Q?ymWHuf/m+932GorAVU3d9tplhYfi0zH6NDSRIsQb3Dpw3QifuEVnL0ieqy/b?=
 =?us-ascii?Q?4jJS7S+ggjTLFWF76tOJvya9R6VV2HbZxZIBRb6sz+NtA1ou/KCjkCtS/VCG?=
 =?us-ascii?Q?dZHd3A92DMIk3xdxT22p+UUWWWwFl179RXPdHm1zWXG55D2MRNYGdhQjgxiK?=
 =?us-ascii?Q?BGywk0TThbrodFGNUcCPr9j6wLKgBYWrngpZyCVJFs7bbBHIGEGzXmjWLYUy?=
 =?us-ascii?Q?OWDfVW+VbLcw+u7PewJYOY1+TynnjBZHYwvkGRuOd5IGLB661HdNTZNv2TmR?=
 =?us-ascii?Q?Scm8YZThmdNHECsnxaQPdhQ/hZDgVKV1t4QiaJBwFU6vIWtf0ZZVB9Ltc+7n?=
 =?us-ascii?Q?bu1wHn4AIZra6F8MTwthBF8/BvebnvsT3OAf3Sy2qBri3QHTSz81P0SQ2aMD?=
 =?us-ascii?Q?cEqJaiK+uOIFN26HewIH+bBgVMnn+mJcw7jGBE+0/FHxmc1uKnm6gFMdzPir?=
 =?us-ascii?Q?XF9CUMl64On8VMt61W9y6U3NwzWaAtdbnrmakXZnvA8jHEcBDUP/IxLHAJPY?=
 =?us-ascii?Q?chT6hrcqSo4GElxoKyZm34EL5tBqQJpQs7T5MLGVK7sC8jpvAGF2jRHBvrZ3?=
 =?us-ascii?Q?50cGSSyYc0fzBJUVrpo0Nd55ct8AkN3X8+JK1zRmxnJ1Wv9Jtyg2wuoRWikG?=
 =?us-ascii?Q?8Rv3U1TK0F2t84recRxft5eqFJN3d0+0IZArSgWrliAbu3XQC1SUpxto6z7j?=
 =?us-ascii?Q?IXucbsvKzPI6HosRNlmBi8s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b6e618-be32-46d0-7ec6-08ddea7684ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 23:14:51.3310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0+BPe/rW83nz1e//Nn8PlHDnJ7E4faLwfAW/VILsJhiTwOZ2OfE41iJDxmzEUpreRRxpQxdKDa4HrcAS8DWZwgDC81hFJoU6o67NmgtuEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Uma Shan=
kar
Sent: Tuesday, September 2, 2025 1:34 AM
To: igt-dev@lists.freedesktop.org
Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; B S, Karthik <kar=
thik.b.s@intel.com>; Shankar, Uma <uma.shankar@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC mod=
ulo 4 restriction for ADL+
>=20
> FBC restriction where FBC is disabled for non-modulo 4 plane size
> (including plane size + yoffset) is fixed from ADL onwards in h/w.

s/ADL/ADL-P

> WA:22010751166

The phrasing here is a bit difficult to parse and sort of implies the
WA is the fix to the FBC restriction for ADL onwards, which is not
the case.  Try:

"""
WA:22010751166 does not apply past display version 12.  Or, in
other words, the FBC restriction where FBC is disabled for
non-modulo 4 plane sizes (including plane size + yoffset) is fixed
from display version 13 and onwards.
"""

>=20
> Relax the restriction for the same.
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_fro=
ntbuffer_tracking.c
> index 061e996cc..a97001770 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -3496,8 +3496,8 @@ static void scaledprimary_subtest(const struct test=
_mode *t)
>  	do_assertions(DONT_ASSERT_CRC);
> =20
>  	/*
> -	 * On gen >=3D 9 HW, FBC is not enabled on a plane with a Y offset
> -	 * that isn't divisible by 4, because it causes FIFO underruns.
> +	 * On gen >=3D 9 and till gen12 HW, FBC is not enabled on a plane with

s/On gen >=3D 9 and till gen12 HW/For display versions 9 through 12

> +	 * a Y offset that isn't divisible by 4, because it causes FIFO underru=
ns.
>  	 *
>  	 * Check that FBC is disabled.
>  	 */
> @@ -3505,7 +3505,7 @@ static void scaledprimary_subtest(const struct test=
_mode *t)
>  			    reg->x + reg->w / 4, (reg->y + src_y_upscale) | 3);
>  	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
>  	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> -	do_assertions(DONT_ASSERT_CRC | (gen >=3D 9 ? ASSERT_FBC_DISABLED : 0))=
;
> +	do_assertions(DONT_ASSERT_CRC | ((gen >=3D 9 && gen <=3D 12) ? ASSERT_F=
BC_DISABLED : 0));

NIT:
It isn't necessary for this patch, but in the future, we should probably re=
name
the variable 'gen' to something more descriptive, like 'display_ver'.

-Jonathan Cavitt

> =20
>  	/* Back to the good and old blue fb. */
>  	igt_plane_set_fb(reg->plane, old_fb);
> --=20
> 2.42.0
>=20
>=20
