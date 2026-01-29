Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A241D3F09E
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 05:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0821B10E263;
	Thu, 29 Jan 2026 05:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cfu67OxR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF9C10E263
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 05:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769665607; x=1801201607;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nApyaDMQJ7j6iVwEUNYDnzzmrSml5tzAHrN2x/jE3KQ=;
 b=Cfu67OxR6qX3+y3j1GNBxPrM3DtjaplRC0rZMOHmkpVIQiKVJuDWX7nw
 N0U4hTvetp7PRDFKWnO0nsdLJ97WNpPvtcbIDtxI7ou4WsIZpgPny5Uoe
 a+w7D5BfYhhSIH2Lx+wdHvhdKMFkTmwoELeRFO4hA1QpDsCwQcVQ5aT1V
 /HDRNVrskdc1G4XWOc27zdR2tziXrg1cuA0IFKYDJGaSWrnBi6m6Y/6df
 wD0I2UQEd1G5Gkx40EexLGw7LKRwDXjcUw07CJoQCvn1lAv1X0+fPtV21
 3HysJSEYlSL0HVLBHjS08pwdsSXsA/c4kw8fe2hSmAYqU6uUDmf4bpksC g==;
X-CSE-ConnectionGUID: nbtIsNQ1RByGLKGEGlL2ow==
X-CSE-MsgGUID: viuqn/GcS0ehBH7sDmwp8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81622737"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="81622737"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 21:46:46 -0800
X-CSE-ConnectionGUID: 0dBpqqD2TVqeYhm66dS+NA==
X-CSE-MsgGUID: SUlRNTbgS1CY8lwqV+wMGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208569631"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 21:46:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 21:46:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 21:46:45 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 21:46:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAGPsyibef6hkXFz++1Rrk4GvRp+xE8F+Ff0R6Dta7m7VskaQzifzd26FL7K2RMjr8CVqI03EyD6mo4Q3H7BQVAmLBk7bCKaqs5LB6+guBjXjDxu5i1OnmfDLFG8WmReTDPt/8GmKi3Agnsz9KqVJfx3zvm8w8cm4HUt+XZkzeSfQf8AvlGrb4AmnnkaOXdQoPTOzOZbIPnIV/1/d40q+npJ53U/AMX7u4JwdNPxyycrw4naaLbZ3fOMGc72D5vwSBeNOSxJ+AEB5vSLE+D5TP6sKW3BFnZROZqkprJexIGZRws+TRMHCPr3k0aBcRMnEyyLgfBQfc0fqjk1ucXwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jma4mIbseWhgPdC6C8GMqjXL6+XpPePGKE8tqutVZGA=;
 b=YUX6VfL3Oyt8G+rv8peCAEEoC/CydnY8QTNzXm1soc2vNyFdjvbFPgiDXpLMNqsAZIitsmPopDocGPBIQwlUUqunBkRHg8CN3rN5/Qh12wCwIdBUhd/5XRqDwLhwAOBmJLQB48PCDfHn5q2gMWaD38cnsq1z66W7Yv315/UFMMEYyoZIeRgWPsogtuG9qBT2qGc/mXJM4VkfsJbneGEYEktvpIumI8+maLMnMKmIcwNCZcnL0AfZq4vGsDQsU82ls56PZbsoBmR1Psbmps+H6iLYdvRH+rptCAU9wM+3V6vH3ei9I/WI6qQ6P/DFZUnjNiqBHm6udBq1CoBEarg94g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 05:46:42 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 05:46:42 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Manna,
 Animesh" <animesh.manna@intel.com>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] lib/igt_psr: Fix selective fetch detection
 to check sink support
Thread-Topic: [PATCH i-g-t v1 1/2] lib/igt_psr: Fix selective fetch detection
 to check sink support
Thread-Index: AQHcfs3XDE8gmLg5lEWUofsUQGw3vrVow96w
Date: Thu, 29 Jan 2026 05:46:42 +0000
Message-ID: <DM4PR11MB6312A16CA2A04C75FC299E49909EA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260106053002.104612-1-santhosh.reddy.guddati@intel.com>
 <20260106053002.104612-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260106053002.104612-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: animesh.manna@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB6665:EE_
x-ms-office365-filtering-correlation-id: b1b93044-3600-4d30-863c-08de5ef9c7d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?S20JpGz64y8Prw20NtXgfwGQNRcvNYQZM82OjBVFPavkqdLRaRIw4UYSLPpQ?=
 =?us-ascii?Q?BTWESKkjql7XI+uUPAe6I4ORaIBHp9tcXKIyPNusA5SutJPd2flbuLI5dsLA?=
 =?us-ascii?Q?Pf1F1TjVTZ4bjL1o9cvR68CL6Vunm7BJSFvmOjr+iyzvQ8PdYh1V2n1e7Q/3?=
 =?us-ascii?Q?Yb4LTThvHdzJ5qljm8sig/CJtJOeNMSeP8WGyrbhPERKt6Oc2pbH8GvYjay2?=
 =?us-ascii?Q?4hrcaiMK/tqgfQ1NezozTDhHg18/5fuIFlPw2C7lfjQkQb2WQV0QuaYUJXtH?=
 =?us-ascii?Q?0IlP6IDFrFwA4UelxwXXzrzOhKx2+Z6hV3rsgkV0W04JGMlEAaBikCyNsOzv?=
 =?us-ascii?Q?lqnAPPU1s4xq1attorTRNWnIYm5gOZb9/NPbynZQBae5IVjkJTiNx99Kd50J?=
 =?us-ascii?Q?LEo7JWn6P1lfEtM5Pa5ovzDwOIeLTgWtvOZEBT7sjjqngXrj2Un7P5k9A8+n?=
 =?us-ascii?Q?s38cP7mQVJ6YpAk4ygUUPH9AVV0Q7U28sx6MBz9GQ7rFLYZpc0hst7lFMpbI?=
 =?us-ascii?Q?YY9Mu294mMtI83oqUg8sUXXX2jh6A3YY766kU+TvAvzNfzR7cbzjw1SLgJJG?=
 =?us-ascii?Q?hETWeQnmtLOia/9C2UG2gyaqivE5O/Lo2LTPQSzekbbO4NwJ3GB+hvI501E7?=
 =?us-ascii?Q?he8WK62r0+tylLytRUTgRuwADa6jFqGsRW7ZYZd7PlXyovOoIO85hnmQMbEy?=
 =?us-ascii?Q?uEVi5AiZ2TgTHpxJq1Bj1LpNSSpWDszm+gkLywkhETY6v6U5voPi2EHTWcs2?=
 =?us-ascii?Q?Fq8dquAL9d6nHrz2IR4BaTKEBPRs7eQ+GGgbKA1DzY9xXm+LCjT+sFflVhdz?=
 =?us-ascii?Q?RJXa8H8AX6hBlnU6KgEMjmV3Bg3QfsbIBkzzC34mfPN8NBbQd9n9SJUGPAbZ?=
 =?us-ascii?Q?siJAKUDHFBYOpE6uZlsmPKKCFPn32H5kVcI82UKAltHNYylj5oJs7pBvVfeR?=
 =?us-ascii?Q?aqU+A42pNGe5dNaizjXQFRe2QPBtrA1xSgvu43jDERrGUjowVSWfUzNPT+hr?=
 =?us-ascii?Q?j0sQwZmkZrN7i3j8LxVNU7nY9YjZxlM23fDetb1B3wozBUjk7HcVmnA4R35t?=
 =?us-ascii?Q?mO1cvYa37pfkHNus9Zsah8t9wS2FaOCVCg/0C6K5iLos4gu/oX6suU2dSPAp?=
 =?us-ascii?Q?tiJjRWvDBwwDeLSt5lc22WYiw/QzwNOoLA8O9ivcKvOq159AoQZ36H7AtjT+?=
 =?us-ascii?Q?yRbEiO9AcP58iziKQdagQ/8KDf6pVLt//xFRyLR9zcNvhj/+PYq2fU62oyh/?=
 =?us-ascii?Q?hSTj3pzfiXNeJE0ZknpyRDmTAJKWr+u2KbGxsAEyGMV9SmZh/m/OU79DXGOf?=
 =?us-ascii?Q?aw9PSrS78trm9qwtHlFOGMV2l20tZb+kCNBl++PC0mCrBwJkbA3/uXuT0QIt?=
 =?us-ascii?Q?L+Rhk+HM2zmmafkYyF8QdsHI9+RFZMXZt6oE6UlgdZYC0xBmVgrLClZ6TWla?=
 =?us-ascii?Q?iNDW9WU/+PvfHJLEf9ZzxaYXnscG38OnpE8JmQxdvSsFIWOFNRMuecQAQLXf?=
 =?us-ascii?Q?5E1d4bEgHd/2kFJOazW84g5yOT19kdMOiA8dwuRkqqORTLKd01QOHP4KQde4?=
 =?us-ascii?Q?+ofW/nO3VDjGx/4fbtq/sZQ40eA1+nY95h4kt+uyItErDr02QNFr7a/ivXI4?=
 =?us-ascii?Q?LPorD1nIqA94VsrHYl5eBQY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eRFdXxaN3TRCzizqaIHmSYTxF0FLL4MwLW15fim+6ElJn5tAioaiV81T85H0?=
 =?us-ascii?Q?i6r2BdmA0FSzvSTAsr42db4Y5Qo09d6XZ6b67XR/wQ/B1daW+7clr2hDbVXd?=
 =?us-ascii?Q?AiswTGP8xGUbzNYi+w88ZgTgFrRaSHvgRl3KQ7HGmENTFDojrtvx+o+4j5on?=
 =?us-ascii?Q?ptsjexPuBq5wTWmlE++xwLXHFHJ5h63HWHo93b12Y/Pjv/oEQC9K1tC8ZjF4?=
 =?us-ascii?Q?FDWaH9dgQ/MehY4S/HJiIBOtlUxajbbJC2YILaL587+ENHBlE10VMYpz/+WO?=
 =?us-ascii?Q?hmtxh80sIc6IRy3bXHs/yFk5+K8qu+RawnbVX+HNFWv4HMPpYuaFx1jj/1Dm?=
 =?us-ascii?Q?073X+kiKzyCcppjXkqDPbvdfAote7K2IGnLt7Dk1nt53PzArd7pi9k0qkYkP?=
 =?us-ascii?Q?Apzrhg2nLquIbHNjHewbtDwcaTJYHapLrTGFHWi5JBIGpHoYPxLMAGi9nhQm?=
 =?us-ascii?Q?c3o4rSDQbvSNg2IaKt4NfSheV+dkxbsGBpgfi1ijEGe4YBGZ8jDLSRytUJqR?=
 =?us-ascii?Q?ZtBhatpBkCscP38iLfN240NMIEIMCCqbUFs0FqHZ8FzvmmLinYwPjoTp4N85?=
 =?us-ascii?Q?TrzJuDJfjf6oEKAMU9mrDMS7Uh5X4DpSxuuVPM33GZBrr9xFxTf1d9BseSqF?=
 =?us-ascii?Q?fsYLMze+hh+fKD+dlvTN8Cph4XJk0WnLs8uu5SEUVUGiiLVGD9XghAn2wxQo?=
 =?us-ascii?Q?jSdEj3DR8SWseY9n152vpbfC1jWp0tzPK8KGvKikfWSZu/hs5jyMC5DfVQEg?=
 =?us-ascii?Q?Mu+hIRK3O8P6J+XVGWC8EfR0d3EZcxa17je2PrdcXYPOjFMKanz4qbCVmHQ9?=
 =?us-ascii?Q?dGlU7Nf6pifph2+NUOxjkgUcm/Q+wrmDiwNLJxD318JCWBPKrkH/cyzTeaL9?=
 =?us-ascii?Q?B9GMBpBfdxBD6YMrCoDUuucqM+BonuvSwOOiuDYKrdNoiUskMd2vnToJaD3Q?=
 =?us-ascii?Q?SDlnKgTr84Wt6pvgQlmsu1nDq+Qm6+Tcy6phQb8DVCExdFujpZwJHy67qxs0?=
 =?us-ascii?Q?RJXH/72FARoKhLLIU3OLZmcv5iVUPnJW4Hke/VzT1fF6TbchNCS2hro7+k4Q?=
 =?us-ascii?Q?NAn3V5Y431kWD6U7yqKgA8VBW4nmjV2zsxrCLJoMJNswgnLRqNzWBECdrQIx?=
 =?us-ascii?Q?y6hy9iLlY6odWBljMcdeTg7483SrbbYTjRCSri3uAU7Fq2DZfE5YPSzwFR+i?=
 =?us-ascii?Q?5p8A++dphvgmuDUBxT6M4QMVJablgXX2Z3VwhuZwfxUGiboJZgnMua2ccpFS?=
 =?us-ascii?Q?mSAc1VVWPV7y9JJpaVsrriDCLLmWQEEZSm3zWSEX4Z1HxGeevulLvIF5O7SW?=
 =?us-ascii?Q?Mgsi7yyNB3ccZ3q5BBTjA9Std1lL8EfrYxCMEbWwVZAsyZXqG1j54HJuYSZQ?=
 =?us-ascii?Q?zdJOLi3i3mzyn9tM1DyrmxCi/aMAGPgdRGUUQTsfYgySxS/bQhchkdsm8VZ5?=
 =?us-ascii?Q?QVnQJRzbPFlvMNF5KrBw9iGCvMY1yZfvmkFHJXw+mQFPouxkAfZplOfPP26t?=
 =?us-ascii?Q?1Dg7MzNSQF3hEm1sO+T0K76K38imLmqOdiTV+3wXukCHO4GeVz44QOqB68hi?=
 =?us-ascii?Q?qltsfj52Ob/GfEhsQztglkO18QBgds+Orz/+VeshJWQrjppKzbAx6oh7zALn?=
 =?us-ascii?Q?+TF8W0blCO9+JfEH4o8ln2oRs61J2PhaY/rEdVfGhFq6VmIKuRcVIIU0+hyR?=
 =?us-ascii?Q?IGpkAtZg2MQNHZ54m/qKqYGFdw2zemO1W/18D1Ju8sW1V+8/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b93044-3600-4d30-863c-08de5ef9c7d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 05:46:42.5346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3BNkB4bmtSCoGWHavBSmrqiRwDS6cUDJ9WHB1eKoAr16HvLAEK9ADoN7d+XIyemLnrC0SoVuDuhQyZlSXEx7eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
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
> Sent: Tuesday, January 6, 2026 11:00 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; B, Jeevan <jeevan.b@intel.com>; Reddy Guddati,
> Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1 1/2] lib/igt_psr: Fix selective fetch detection =
to check
> sink support
>=20
> The i915_psr2_selective_fetch_check() is failing to detect PSR2/Panel Rep=
lay
> selective fetch capability during test execution, causing tests like kms_=
async_flips
> cursor subtests to run when they should skip.
>=20
> During test initialization, PSR gets disabled because of display commits.
> When disabled, debugfs shows "PSR mode: disabled" without the
> "PSR2 selective fetch: enabled" line that the code was checking for.
>=20
> However, the sink capability is always present in the debugfs output:
>   Sink support: Panel Replay Selective Update =3D yes
>=20
> Fix selective_fetch_check() to also check for "Panel Replay Selective Upd=
ate =3D
> yes" in addition to "PSR2 selective fetch: enabled". This ensures tests c=
orrectly
> skip on PSR2 selective fetch capable panels regardless of PSR's current
> enabled/disabled state.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_psr.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c index 7e50c3dc6..1504ef110 100=
644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -50,7 +50,14 @@ bool selective_fetch_check(int debugfs_fd, igt_output_=
t
> *output)
>  	igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>  				sizeof(buf));
>=20
> -	return strstr(buf, "PSR2 selective fetch: enabled");
> +	/*
> +	 * Check if selective fetch is currently enabled OR if sink supports it=
.
> +	 * When PSR is disabled during test init, we won't see "PSR2 selective
> fetch: enabled"
> +	 * but we still need to skip tests that are incompatible with selective=
 fetch
> +	 * if the sink supports it.
> +	 */
> +	return strstr(buf, "PSR2 selective fetch: enabled") ||
> +	       strstr(buf, "Panel Replay Selective Update =3D yes");
>  }
>  static bool psr_active_sink_check(int debugfs_fd, igt_output_t *output) =
 {
> --
If we are checking sink capability, we should use psr_sink_support instead =
of modifying this function.=20
Here we are modifying the selective fetch check by adding selective update =
logic, which may not be the correct approach.=20
@Manna, Animesh what is your input on this.=20

> 2.34.1

