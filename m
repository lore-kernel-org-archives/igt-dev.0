Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C49C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 05:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1311310E253;
	Wed, 29 Jan 2025 05:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iW/U7pY/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D9710E253
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 05:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738129983; x=1769665983;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DKBh1Wm7WVuhFkwJqL67mjXs9uNkzFPlk0cx7Oq4Kz8=;
 b=iW/U7pY/Z+FVa2BdfRNd71xoopSva9T9ksNHQvb3Mjr0Uk1RiDSf8/I4
 TdpnyK5C0flTKZyJ9LFM6A0GTYv9ZLnNrUaOO+qU+7CyNAoDP8eAi64wQ
 inVS+/e+ZToNjKNROod1Hv/guebjwXvB04NBFg2EEegWMKWOwTNDeGljD
 ME/jufJnGrQyPVLieB9Bl28foECKinfFk+Eg4JigoiQROAVV9PxCmzpfp
 PKARta6UJrueC+32+N1jieEVc5WxLUrgWJYIyzEuL/Yeqr8Nvhy1X6vZ+
 15i3LA90iZ5iKT6O9v322QdbNHpBkeFWP/v5ECba4O9AoU7AAz/2JQPOl w==;
X-CSE-ConnectionGUID: CL+LBHx4SRqA0VHWrB11fA==
X-CSE-MsgGUID: gY+1OMN3R1Cb5rDR7OUalQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38516654"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38516654"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 21:53:02 -0800
X-CSE-ConnectionGUID: sevUY8sVTx2jqS3TyTIplw==
X-CSE-MsgGUID: Nb9pazafQjOXsSl4XaWq9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108790883"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 21:53:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 21:53:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 21:53:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 21:53:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jejjaUVyj8EILnpmh2I3Q0lfPoDXeznOvh5TXUI/t5n5lvVC3XXPWcwP44iR6kfDNUtGbljBbnLfvhAXemujl0fgz1wDT6FVCxPYYQTctWpJ73DU8hhp4tYidR3Qvz80BkaxIVMf17IXEojaK2E1ur+tyEEq0phBEKxHunZ1CGPqbDiDhGztqTWpHWTeTGEA9J4yflBanM8mGqH4e0TYMJIkRL8V7nev24EX6HjPMOJypLVt2cfaGmxCflFQTwjjAFtd5+Pux8/STvZ56B/mDTQcs7/Pu8zYloxfbVPW3xAcI3Kv68tAcBEwCfmihM4o7voVQFI6SU2NTyPA+UE6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EO66EswMXEZCRFUBEQ4fiuH2JziE4Gy2kC8I+csNpQ=;
 b=QjalsKPrb35d1zMGzS6DSBr9jhqSVO5HxTkXdbW1uv7lBMVJyC5yKigRLKxj2Un3RyvF9xZc9xduDtWAshC1q3BRv3EnVYlCgiN2LMhRXb3ZSXHy959LPLo87d+0bDLPq4zdwR4i3sqi2MI7wVmHT4fHrT74V76R8OCo2eU8itBzyXFhesjNgM8EjkGeRjIco7qB8VH9S/I1zR8fcttpZfXr8E73RbKac2ImdiuPF16WRVAgTk6ixN7kSMNoBnST7awJb8ZWbHCVRAKfoQi6Dt6JkPCLHCdWJrnZbYQhlyCsQlcz31HfJMFdJrtBkr7NH5hVUyywmg0D9yLqBg/Peg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 05:52:59 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8398.017; Wed, 29 Jan 2025
 05:52:59 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce debug
 loglevel dynamically
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce
 debug loglevel dynamically
Thread-Index: AQHbYrhQGQYg0n/dG0mLmEH1pnIB4bMtWpewgAADMoCAAAC5gA==
Date: Wed, 29 Jan 2025 05:52:59 +0000
Message-ID: <DM4PR11MB6312B18F72BA78223261ACBE90EE2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250109170729.47646-1-pranay.samala@intel.com>
 <DM4PR11MB6312EC7D5F28BF763D54292390EE2@DM4PR11MB6312.namprd11.prod.outlook.com>
 <PH7PR11MB6053A2C9161DCC045CD65E67E7EE2@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6053A2C9161DCC045CD65E67E7EE2@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SN7PR11MB7638:EE_
x-ms-office365-filtering-correlation-id: fdfd4ec3-0a30-41a5-a65f-08dd40292f97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4tZJdc1B3Btx+h8pA1FfwmLtyxAmERieUQBvSMTPzkmx33htLLPR+v/oevFQ?=
 =?us-ascii?Q?50kA92btFBJvwtk04ZfCqKOnALgToxgM1ENzmabTY1/8Qd5CLSLAjZLQSQOC?=
 =?us-ascii?Q?+DRfstJ/WBqathpW8KTekgOSp7ec8rYYCUKuTQip/isaDdBwbdJlTFr7/woZ?=
 =?us-ascii?Q?YgNh45n71cM8BQHoopcY2aE61VFNWrCAX2g5R+3zGO3H+kX05WWN2khxRzrt?=
 =?us-ascii?Q?TChinn/a0W8v7IM9ZQ67HLtHXF4CJk5BTikiu5M3AMHD2YOgALslK1L8RoQs?=
 =?us-ascii?Q?w8TwbBYtV56yZNwq+XVvyIDp5mH8qQQZdMzLwvq5ktLTqg5aWSSX8NPcDF2n?=
 =?us-ascii?Q?6MiZ4Y4y+9aUOFIviHsZkBIkcjKUziSXxx6Erpe4hL3uBry6BorMqSaVQZqO?=
 =?us-ascii?Q?uN1P3K4IbO8+DFD+G4NT7/DX8xOSMJV6TDB3OxYweqcOzVnRhrd3lxIfqknp?=
 =?us-ascii?Q?HLRRDR35MFz7/w/VsoMOk/DrinL1HWr3Z8e08qvknT11918/JRQWctK1v+eR?=
 =?us-ascii?Q?HrjRL2x7PFkZ8Q8F/vV6YQCobaosQK5hYregwhqDXV/vNexI1FDzcCs1MceL?=
 =?us-ascii?Q?5NF1Of96g61m0HtfOuuzlVOYpAGbXfSlSzbMuQ0WsAnQBX2rQXXRyYQtlgrb?=
 =?us-ascii?Q?/RN41EMaRUU91uc1ESamNb3oCQBx1X44zEx46wGwLjDQMqxrPsdfcdoocutO?=
 =?us-ascii?Q?JtFAGlRzQnuInFBVhn7wTYjHScI3IVanRQJP/k5yH5aZIH/QkGl+oUg5ugTX?=
 =?us-ascii?Q?KDlqAFPfsNDq09wm6eto2WK8L/IAXJY8Hy7aYxiXgZrWuzpwV7STpO4mCFU4?=
 =?us-ascii?Q?6KQvTlA2lVZsTIDtfCruVAjX9XDPxQ4pgyKDqrw5WeUaUIfZ9A4X9AwSb0NC?=
 =?us-ascii?Q?S6Q4Wr5qASXLkIILjq78gohmvod4xlbT7nk6ini6CdMJiZdswRomBreL4ZOv?=
 =?us-ascii?Q?4pWoSgMIlcd3bGBJAwbXNOx0WTb5NtyB94g4LZZsbrXHQwspZsdNWRAvaXCQ?=
 =?us-ascii?Q?0EV63yhPg40KZrgW61EwzI3i2rlge4wf8o8GEinVkp1y9nSSp7lnWkA1osif?=
 =?us-ascii?Q?jhCFnx+8/0kZwlw5KmYV4duAwoHMP9e4hPkOQHS29fG5lAKq6drywY+nPiUX?=
 =?us-ascii?Q?abVvYxdy2ZTzU1n+kfQiIMNFrnETAIbYM0fpjn2KxAh0XN7kGBFrL2mv8tIo?=
 =?us-ascii?Q?nIBm3tMd9ct/4mt6AmSTgHFhtF1/b0kC8fF9SGuhIiVuQJ3Y+uc9RQ2f+vII?=
 =?us-ascii?Q?xdCEdYrwrgfrAdQb44Lz/SpaC2Teh4IcO/U8Nu6VrgkylySobsPCI9M8v8j4?=
 =?us-ascii?Q?EOPhlXJqwLU6ri/TdqL6IEZAPKD+RLUhVMZzXyw/SU3yvwfsfVnb30iW2Rd2?=
 =?us-ascii?Q?kXXQ8h1gsKryD6o5hq5/vU8uKCZjJlhAD9Ag3hc2Mu93ChupzzLtSzbwQw0L?=
 =?us-ascii?Q?z6+Mbk++5dg329GfPv0Oe8Vhivj3v6Jm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yzYaOpsA70Kox5oLU4pJyyGmoVDp8M7YZkMAPGGsELR9tm1dsoSjuQSuXY4x?=
 =?us-ascii?Q?z204Bd1IUUBU6EXVtdvwM9zaDIhjVjEeJXglU7bICPoIYPJUXmPWJ8afoSWY?=
 =?us-ascii?Q?ALTap/B6rdKp0cJKRIkVAyV/wPCTxUPkqo72DwouF9eJ5SdxdxtH4Da41VmG?=
 =?us-ascii?Q?KB5SaUo7K5bvIm/9mVMI96HTVg9Ya8YskwLM9kCIY4TmDd+yThqw7vl309p8?=
 =?us-ascii?Q?FxWT372Flt6ZmZnC3s3IGW8h8H8cGSuNaYhj9Xerctmt0tQme7xHFhXVoDhx?=
 =?us-ascii?Q?6J+JuJ3tSPluLV5PRKF1NPqAacaGdyeIk+gA80C02a79I4WdtZWzJX98g7XF?=
 =?us-ascii?Q?ktsXYEZmGYhAaaP8P9kjDYhIIQVSfW3wDt+VBRUFGpB57GB4E+gMVTFmfn7s?=
 =?us-ascii?Q?PuYirCFWCc83ozdmzjj3ZUqMEd+thvSR45doUGOVWX7JVKKU7zJMxdftx1IT?=
 =?us-ascii?Q?B4quF3D/FXfQhsTSXfRrVyWDIkjH75Rhht1NVo2hqZy2MCmyn57LkldtuZsC?=
 =?us-ascii?Q?rlgqR8zbMfDkKUef60B4KaVG6h9DuUHK3Vg/9FSattrdZPF3e4SHUE1gUmw5?=
 =?us-ascii?Q?dBlzqTVesCwK4jNwsjWz+3cca+qJra6qsLePUPaLmytTSnbIfwf4hC7MVv4l?=
 =?us-ascii?Q?9yZ0ynaGbgBkBlYeOA9K+MSgdypW+9tRmtCIYiJY+lSPGBgXB9fXttL56MQh?=
 =?us-ascii?Q?Xhi+gqXvE7341EC4xtaX1IjSXbKa1GSImEh5lmHoq3ehKTs1GOvBJ6o8nktk?=
 =?us-ascii?Q?i5JfpaiyEuBKghCcbiV5WR9Akn9+xVy17EoEqHe85IsWr7/NzJV1HSTrT8UX?=
 =?us-ascii?Q?HJHvu2OZIlOW2xpHbXYw8YmqFny2+n4huquyReMB7IK1twByR5Bdoz6ZKenJ?=
 =?us-ascii?Q?Y8oQrYJODSPkjbKrlVVQf61pY1QrB5W47OMTD6I1WQL3NpcSAWWbZPTYQrUa?=
 =?us-ascii?Q?Dm3piAIfzraCouVus7VA534ay+jv8A6a3fCguE1+NGB5js+MQmvzX+SLFInT?=
 =?us-ascii?Q?6Al8jA0sGJLhSZKAn4v5pliu1UgCOyQH2MJ9DWuu7VLBzWlWBh6TvGf9u6BJ?=
 =?us-ascii?Q?1E/BlCfp8ZUsMGkRrYmxma0A9CC0R4jsPnTQc6uaTmhbuDcZd31SWfezDmwY?=
 =?us-ascii?Q?6vgtVJKgVMx9VJMMBK7weSYa53w2aZz/oUB3iMI/Rqt/MS5phDQLQiOhUcQ1?=
 =?us-ascii?Q?4bmMPftZNdw3liO1PK8mPSQFUj4M48rP3jnu7PI9UP01RNDTihmMRM8qYbZJ?=
 =?us-ascii?Q?ZRdHD4+GRj/2m0V369z7OtdLU402+YfQ9Ve6w8tcggasFHTvg1R+UPMwgWkn?=
 =?us-ascii?Q?AU6he+aoNscOfBfTV5aqaKUMXldhu2+u1G4530rx121nFUVHOL8zXGd2foRb?=
 =?us-ascii?Q?wfck75HFrp4IsujeKXinMBpicI2ld9JxHHcahCM+uBouHPBD/+hdNPSX1RT4?=
 =?us-ascii?Q?1NaSfWvoiqCzUfwbMY2+Fh1dA4Dlpos5LraO475y12V4vd820x9t1vhHKOeG?=
 =?us-ascii?Q?gqwBYGP6xC8hPFcjPJOPn0wN4hkrwMckorZwdaJD4WCvhU/X2sKgv8y06xQr?=
 =?us-ascii?Q?6VaOPmMoeAMBDb7R47I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfd4ec3-0a30-41a5-a65f-08dd40292f97
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 05:52:59.2341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 19nCPwT0nxVBUcTjdsg/T5XrDCsfokxfoPg9is/tkD3HvUCodOFr/GgqrxVMsj2R3XeOQS6Srq8/exwDc12MLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
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
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Wednesday, January 29, 2025 11:20 AM
> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1 <kunal1.joshi@int=
el.com>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce =
debug
> loglevel dynamically
>=20
> HI Jeevan,
>=20
> > -----Original Message-----
> > From: B, Jeevan <jeevan.b@intel.com>
> > Sent: Wednesday, January 29, 2025 11:10 AM
> > To: Samala, Pranay <pranay.samala@intel.com>;
> > igt-dev@lists.freedesktop.org
> > Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> > <kunal1.joshi@intel.com>; Lattannavar, Sameer
> > <sameer.lattannavar@intel.com>; Samala, Pranay
> > <pranay.samala@intel.com>
> > Subject: RE: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback:
> > Reduce debug loglevel dynamically
> >
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > Pranay Samala
> > > Sent: Thursday, January 9, 2025 10:37 PM
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> > > <kunal1.joshi@intel.com>; Lattannavar, Sameer
> > > <sameer.lattannavar@intel.com>; Samala, Pranay
> > > <pranay.samala@intel.com>
> > > Subject: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce
> > > debug loglevel dynamically
> > >
> > > This test is getting incomplete on CI environment because its
> > > logging to many logs.
> > >
> > > So dynamically reducing the debug log level to 10.
> > >
> > > Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> > > ---
> > >  tests/intel/kms_dp_linktrain_fallback.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tests/intel/kms_dp_linktrain_fallback.c
> > > b/tests/intel/kms_dp_linktrain_fallback.c
> > > index a05e2015f..415005774 100644
> > > --- a/tests/intel/kms_dp_linktrain_fallback.c
> > > +++ b/tests/intel/kms_dp_linktrain_fallback.c
> > > @@ -14,7 +14,7 @@
> > >   */
> > >
> > >  #include <sys/types.h>
> > > -
> > > +#include "igt_sysfs.h"
> > >  #include "igt.h"
> > >
> > >  /**
> > > @@ -391,6 +391,7 @@ igt_main
> > >  	data_t data =3D {};
> > >
> > >  	igt_fixture {
> > > +		int dir, current_log_level;
> > >  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
> > >  						     DRIVER_XE);
> > >  		kmstest_set_vt_graphics_mode();
> > > @@ -398,6 +399,14 @@ igt_main
> > >  		igt_display_require_output(&data.display);
> > >  		for_each_pipe(&data.display, data.pipe)
> > >  			data.n_pipes++;
> > > +		dir =3D igt_sysfs_drm_module_params_open();
> > > +		if (dir >=3D 0) {
> > > +			current_log_level =3D igt_drm_debug_level_get(dir);
> > > +			close(dir);
> > > +
> > > +			if (current_log_level > 10)
> > > +				igt_drm_debug_level_update(10);
> > > +		}
> > Once we have completed this test we need to restore the log-level else
> > this will affect the rest of the grid.
>=20
> Exit handler is being called in this function igt_drm_debug_level_update,=
 and it
> will restore the log level while exiting the test.
>=20
> Regards,
> Pranay
> > >  	}
> > >
> > >  	igt_subtest("dp-fallback") {
> > > --
> > > 2.34.1

