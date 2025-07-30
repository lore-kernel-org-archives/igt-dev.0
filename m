Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4FCC87FCB
	for <igt-dev@archiver.kernel.org>; Wed, 30 Jul 2025 14:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C697910E6AE;
	Wed, 30 Jul 2025 14:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5Ez9S+8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F6D10E6AE
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jul 2025 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753886500; x=1785422500;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SRQBeXP6aNeSj6X0ki5/fc/OEWLbleTafJbE1Izon9A=;
 b=i5Ez9S+8YTuG04WpwDcoOl7cPFaWu9olluyDH3rHZtBu1oXiRAskgOTf
 /wgKXlCfHqhv8Zkke6r0kUySTMZ+isKRpCJ7mz+OXIDi6UbxWTlOAV5Xg
 N/EWpt+O/7U4EM2srT20Y/AZCcG1CXlkPZ9hYd7EDAUXLwZhekjdTtghL
 Xn/iIo/NRziTDBPj3GoghLIPj5FGqo7BovKqN/thed/gXIk8tVPwwVSYI
 CCC1brQT/cct1rhDlfPFMlxuMnxdepSlT5X48HxZp/HRaANoMUDcWUveg
 BXg6VpdMRlC+TMOHHQag6yCYvwHn3TKTUytVwTQKWboFkQE1xR07ti2WV A==;
X-CSE-ConnectionGUID: 474lq8O7Q+ayAHScwp/zig==
X-CSE-MsgGUID: 9/crjlMaQCq+vycFD1nLCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66886409"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66886409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:41:40 -0700
X-CSE-ConnectionGUID: nohsyrGtSC+2x1M/zFU1Cg==
X-CSE-MsgGUID: +592qyBuRuGSHInHpA/40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163451655"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:41:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 07:41:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 07:41:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 07:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKj7TVI4SR2KSyW7QBspmCIgWCPKIrYeDYYha5qJUe/w9iZ7KjY3LNTraWyFi5g8pAU3soi7JHT6NcrtWM6rMfuNWqK5aaetp/CayrrTJtMFBrJuDYIrg49svqDS1p2RLquB54rfo4M+jHHRtvivF2zrqKdOXFm0/kS2lEWLa7sndGraKGIoewT7X/VAYwv1MBMLOKRDPrtaaqLei23FSMeqg0ClG2CGR1IfyLXEsM8fSBErT831m/LL/Gl3VnDZD01iZx9H5Zvirkba+gxQ28luTDXrEkYg5uJw09Wbx4HhSI3J26ezutIQ7+NQM9+BzPtBJrt33nf7lRX+yJegiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dqnl8HibJbdnvmBISgHh8jM9CiFGgZP6ggivpKgrEwU=;
 b=NYQzcyR+ihF08lONRT+1DZFUHAdWetR6SWb24jTjrJT04Jq+WTvk7HaXcOfRXwBMh0/l+SSG9ZS3aA5NypLxHvMyczYG0A0jWDjl7LRN5YXqVitc/4w065yXZNe//0KU3/LqzydYlC9pXsLt/7zyqR7AUZnp6mAnVYWWEdcn5QXfWV6NOslDhLrW12I1jjtDlriqEfEzob5JZMtFitGgzlXTZ3HCUW4E6i4M1SGFZv9+F2PvXYTopQH2NX189ffyoxJ8m1ul7WAot+9sHdu9DiZ2HqvHPUp/ATKHUIFi3PLxMjaS5KnACf5vj9yGC6fXEvYXSHjArtGDbfZxFQdQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by MN6PR11MB8220.namprd11.prod.outlook.com (2603:10b6:208:478::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 14:41:08 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6%7]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 14:41:08 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/intel/xe_pmu: Skip tests involving engine
 activity on vm
Thread-Topic: [PATCH i-g-t v1] tests/intel/xe_pmu: Skip tests involving engine
 activity on vm
Thread-Index: AQHcAHKAqNGzNWHpp0KD4pqTYrkD5rRKvPOw
Date: Wed, 30 Jul 2025 14:41:08 +0000
Message-ID: <IA3PR11MB93048086BA1FB46BE120F210AC24A@IA3PR11MB9304.namprd11.prod.outlook.com>
References: <20250729101349.3208545-1-soham.purkait@intel.com>
In-Reply-To: <20250729101349.3208545-1-soham.purkait@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9304:EE_|MN6PR11MB8220:EE_
x-ms-office365-filtering-correlation-id: 1323f6a2-f61e-4de8-89cd-08ddcf771f2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KSJsH61zFHSolChQHgFMKvglIpaYTQJIIejz3xGfvCX/dz6thvqxfJRa4C02?=
 =?us-ascii?Q?tqQ28YfJt7Bwwj8i+KHFHYO0DvtdfeAMGMVOIfSyTiYBpULSTubjAYl4HtJW?=
 =?us-ascii?Q?8cMRCaMQWF/FUuhWfli2EB7/0NJxo1K8JM8SFdjUkY/gySbq2AEYhsz3SgRO?=
 =?us-ascii?Q?gYnQ0YaXutzqSVCNsENUdczfhqKYm6C2lnDmHgS4r+KGKVDJrkoCmhgMsIKb?=
 =?us-ascii?Q?t2mD7+LiL6actMO31v3Okhg+ScCBSx4GbNzGb8NhbCksVXGcSHerglVZfkuV?=
 =?us-ascii?Q?fwuA2d2P9MwuiWvLoYR9nK+/e4Er3umy8v32q3NNFHCvsOTkbA9CdLLwIDCW?=
 =?us-ascii?Q?b8IadmOXcB/hju0wiBN+zG6iR3blSwiJALOI5AISG+ecDRC8TBP1KflN73o4?=
 =?us-ascii?Q?E1Hj/7fXI/6d/dmeA/8kWa3+oIjN3nA70eY2bN7uAt6O7MzR1FncjHc4DSt5?=
 =?us-ascii?Q?ixj9lPRljUFyk9fgnhHikBqziPA/GLaRmurwvmxu3MSXiBjeEEnb6pxsv4s2?=
 =?us-ascii?Q?UbJmwv0nBBpekA6e/OKVk/Uvh0Jv+h/e1fcElaxxMLGpgBVt7o2R72h2rdrE?=
 =?us-ascii?Q?HKpSKlFW1Cl5N2X+jc8+9Jxw/stq6X4QEKlnnZAdOEgp2P+Mk7quMZdIOqA6?=
 =?us-ascii?Q?dwI45hHNsq/mnBdsZsoTp6o0VDnqvfAV2Fp/OztlDszMBlV5k9elg3DHpLfH?=
 =?us-ascii?Q?8AqiDSY+nnEnz4ul4u/hK5hqQzEJDny7hJn1n/ck3ln38GuwJYQ+Pe3CAZBP?=
 =?us-ascii?Q?poxliIvKixyoE/IR5gBnqM7/Ot6Y7irvjaRi7VuSAivem7DpCrpNTZvJoCCv?=
 =?us-ascii?Q?WyF5rrX+1XBFARwQp/HUfb3wlJ8Gf4gxDwAtX8VyY1Y5N6yaum2oeJrSwuBS?=
 =?us-ascii?Q?frNIxxsHSu4Iv3Xym4/lNsOdHz0ulp32CV+yNWUwbVAHkyXUnfAo0shghcEA?=
 =?us-ascii?Q?6BuGdoUEj25fscGwpN9kOU8+xdI7z2i5U4c9Y6rn39YdkoUtnOGn67AGz93/?=
 =?us-ascii?Q?UR3RKt+Bg0n6gBUnaYF6M9OHPQpWOC/3MP1qAWDu76USH1TccP5RI57LqgJY?=
 =?us-ascii?Q?sLp3Ym6DC/ud4n31TOj97gUqEl5QrxJR4dTR/Sg53SR/Izk66XKvm5kJyrG1?=
 =?us-ascii?Q?I6P0EBng9gZwZv6w1VIsZsoSJQXeQUCTrwsdgz33goWEMXKpGWzatq50y3+Z?=
 =?us-ascii?Q?i/6vLg4qLngv07jjLXBvBwZ+ph+RNEJky97TpaOAwfZqq5cT4geuFcNG4tbd?=
 =?us-ascii?Q?KJLO9UJUbGWIzEHx3+V34Z+nz9PidX+Dg/arwTDqgFf/7TWNhR1e+FJiuoi5?=
 =?us-ascii?Q?+Xd0ajsq4ZDv/5c5OqDrljDtpTEVYBWpdqeuq4qYMBfUn7LKQfCny3H1LxdR?=
 =?us-ascii?Q?mr4yom51kufE7myZ3YNygcznMJAwyAPkj0Hj9Y8jDQn5kZSGl1zyBFonK/ly?=
 =?us-ascii?Q?Pz2vchYTiIrSVoYOigS0aAxlZfCDCg9XTH7nPNEDbNAX0jcXjzsvIw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hltW+F4YNysCIRsx7JsInj63kyttGgqxGCV1nOEdGcPdpInLbyeWhlTIky+V?=
 =?us-ascii?Q?GX3fOYCMyjr2oqEaSx799cJ7/trxRhqMsS/PZY+2rQH5Mr/HGUAwfIQb5Hum?=
 =?us-ascii?Q?kjXsmQj5002meiY2HYERIB/FUeoeEhQH8Y0tyY9mtYN8hKWcEJ3Rs4Qfo/f0?=
 =?us-ascii?Q?GTorgL+OW3eA6HeD6XNvx3egmmEDpaPTMUgQrjkhScgyHw494HsMhvOAcoTs?=
 =?us-ascii?Q?7rhHpysiZZpAw9ZoD87P7siZ5383aPAAWzL8HJQZNmuUanvuK43IgzbaLkh7?=
 =?us-ascii?Q?i5bZml0M24Zb7qvXBqZb2IITwv9QEA0C/qteA7legbzciPPdONgmMI1wOtfH?=
 =?us-ascii?Q?uI8Ly0QqU50cyAcH4WhnmDDu5+L8apr3WnaKr+ME5J7Rir/Bf26tw6pJD17m?=
 =?us-ascii?Q?pGcxyLP3T1aeeLaYox8k87gNmHOhKp9wldkClSWD+u++m1M5erY8upjEyHqj?=
 =?us-ascii?Q?m5eKTn8hbN777/t/oyBYFm3L2z2Iv073RFpbDW1wdd0mDfHWExcRqS/XVXxS?=
 =?us-ascii?Q?yiZ95BmvhyVnqbihAjLhtdonhKx7ch9e/CUXXGajbfpy/qaLRULzYcmHWn1Q?=
 =?us-ascii?Q?ZFHyrX3s1TywWy9T8cbEX/W+WRNnBe3qREUvl2jBvQqBclormZ8wKH/ft154?=
 =?us-ascii?Q?C16XKt5pi/3W1wyutEWWI2rV27n1qnO6m9VKdIpKB063BEKBOAXIYipVwBmT?=
 =?us-ascii?Q?GaXG4NYwlig8wdqik672p260h8qLc0iHtKFvtKpx1/r/rXpIsUd0hAyOG84a?=
 =?us-ascii?Q?F211Sr3MylMTlXl+V8V+oAZqk9AjJHCL99eOPNn/z4sXSx2+UFWSnBk4W2VF?=
 =?us-ascii?Q?Z5+Ejxca3mhTWmJNdsqPNnKkw8MprSCUPvJGPn5SDeNN/rS7HYvJZYvJZ+70?=
 =?us-ascii?Q?42QXgd/Wkb+fuH+Gw4CuAqbAUJsTm2O/wXRQoLl4ACFLFmhedywhkamwvqhT?=
 =?us-ascii?Q?+CuySAlLam0l4H/PaAs0mwFDevJNgNTVum3pMsU1fz8EEcZxxtGMhAjUfLrf?=
 =?us-ascii?Q?sFpliujtRI+H0krahmULgx8roofUHbmnxzuUnxl4xmoGqodkpRnAN9BHKrEK?=
 =?us-ascii?Q?t9xpXDwmvWqsYB/b5bVJSnvTXvuaYQtZM4fkQnXdIA17smGPeKw7K+0rzaRD?=
 =?us-ascii?Q?t+h0SildNx7BPETbMUIi1H1AaOHVRVTgCo4lwVZc49grkaBAv0YNjmFM1/BZ?=
 =?us-ascii?Q?FByVEVG6rRdiqAehig3tz13pZI1Y1qsjEGRtTtdAdqVM2xjRbugfgtP0HgCb?=
 =?us-ascii?Q?GfWhscEjw0noIWmTwvqy+kxD+yE0WPEegnvCHwLy1TCRiSydrGTIkWfg/P19?=
 =?us-ascii?Q?Xktl3qRHQObPI+8bg3dkb5S/FSZJJTShmMP/lD97M8cnLfdJ954WDm8Tj5Fc?=
 =?us-ascii?Q?M+zgW/lIUedGi4XOweeUEHgKbVN45Hm2w1sIOcMTruZ9bYskNTOCEG2W1LCT?=
 =?us-ascii?Q?BiWDRhsyIx9ZbN4Vir0tybH3jaW0IiOy1PdAmisee+Hd7JIrPQntw5cwlccg?=
 =?us-ascii?Q?00TWdUaQ7DNZ+xRnu4p84MzpKF1jc7GZP+k+Esi1iCI3rtM2kEILeaZwaRR3?=
 =?us-ascii?Q?/ezgiy2ZTmokZpfXYp2ldhqmnklD6X0VEDwq4BvI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1323f6a2-f61e-4de8-89cd-08ddcf771f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 14:41:08.7628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YU7OuM/KGSdEkT203nHIKoFpZFuPgoH8884/k5nD5afPSYZG73z4ulm8V7x2tLnamc2PN7iz7rG+ib/jh5IVO50bXoVgp7X7emgNx5sETGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8220
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

Hi Soham,
I see that change is generic and does not just work on VM but in all cases =
where feature isn't supported. I think commit title should not mention VM, =
it could be e.g. " tests/intel/xe_pmu: Skip test  if engine activity featur=
e not present" or something along those lines.

Jakub

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Soham Pu=
rkait
Sent: Tuesday, July 29, 2025 12:14 PM
To: igt-dev@lists.freedesktop.org; Tauro, Riana <riana.tauro@intel.com>
Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; De Marchi, Lucas <lucas.dem=
archi@intel.com>; Purkait, Soham <soham.purkait@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/xe_pmu: Skip tests involving engine a=
ctivity on vm

Skip the tests and subtests involving the engine activity if the engine-act=
ive-ticks event is not present for the respective device.

v1:
 - Add a variable has_engine_active_ticks to check for the
   existence of engine-active-ticks event. (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c index 0e5a7360f..b=
0bd235e6 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -106,6 +106,7 @@ const double tolerance =3D 0.1;  static char xe_device[=
NAME_MAX];  static bool autoprobe;  static int total_exec_quantum;
+static bool has_engine_active_ticks;
=20
 #define test_each_engine(test, fd, hwe) \
 	igt_subtest_with_dynamic(test) \
@@ -113,6 +114,17 @@ static int total_exec_quantum;
 			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class),=
 \
 				      hwe->engine_instance)
=20
+static bool _has_engine_active_ticks(const char *device) {
+	char buf[512];
+
+	snprintf(buf, sizeof(buf),
+		 "/sys/bus/event_source/devices/%s/events/%s",
+		 device,
+		 "engine-active-ticks");
+	return (!!access(buf, F_OK));
+}
+
 static int open_pmu(int xe, uint64_t config)  {
 	int fd;
@@ -191,6 +203,8 @@ static uint64_t get_event_config(unsigned int gt, struc=
t drm_xe_engine_class_ins
 	uint64_t pmu_config =3D 0;
 	int ret;
=20
+	igt_skip_on(has_engine_active_ticks);
+
 	ret =3D perf_event_config(xe_device, event, &pmu_config);
 	igt_assert(ret >=3D 0);
 	pmu_config |=3D add_format_config("gt", gt); @@ -907,6 +921,7 @@ igt_main
 		fd =3D drm_open_driver(DRIVER_XE);
 		xe_perf_device(fd, xe_device, sizeof(xe_device));
 		num_engines =3D xe_number_engines(fd);
+		has_engine_active_ticks =3D _has_engine_active_ticks(xe_device);
 	}
=20
 	igt_describe("Validate PMU gt-c6 residency counters when idle");
--
2.34.1

