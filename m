Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E003C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6FC10E959;
	Thu,  1 Aug 2024 12:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWULkQ34";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA0210E959
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517028; x=1754053028;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rY6hmvanFEiFIGI1qnynayXkR6ah2+tY++FxDh9YBN4=;
 b=iWULkQ34YFpT35eBxP9OmfsARbG9bgdjrEEgVkTYRKfsG+4g7fnOnCJ9
 i45gM9C36LdnjOv1QwsGV/6gmk+CUHe8gsDG/qwOeFnpO9rm46npxBIi+
 hglm1sb03vhsx84Ic417cP2RSDc/YYoOmqEMBYBNzMQDcMIEBkAT0cQK1
 ADH69ApNd+xsNcWm/EVeNNhuja41vBMMGrJIdeC1l6Fgt1DIvdnXa+d8l
 i3l0TdBFgeOjdRjHKo31rv4oZGHC86MRd3EhVhS8kd35OiF/LCsKQhLPn
 Zhw3+4uPtpFvg8KgiJue1BRr/sOk4zQC2phsaIwdThUTAhS1gnIh4XpQF A==;
X-CSE-ConnectionGUID: wGIz1bOqRgW2tf+I+1+gNg==
X-CSE-MsgGUID: IsvjPShHTxKhKB8AouPMpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20587105"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20587105"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:57:08 -0700
X-CSE-ConnectionGUID: DbwV3cDfSHquR/VG0azl+Q==
X-CSE-MsgGUID: IxXAHB7SQemy5UvExUPuhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="92554821"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:57:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:57:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:57:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:57:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:57:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEnJ6vhctu8MrEny/t44xfELPuDyyb0pCkwT5rw0tSvFvGE9HH7b3c02nm2+3TB49zCep9v0uzsbId7Y6SYjN89r4brT8WNk6Kd3EF8fMd/5YczPZmEy4SsLGjwgF7xP/anbM9dTeeKu1g8iKLQLNean2d2z9OrEFYdpU0tqjTlkmI0mYxE9XhCTHpQZSta63RseawES+GvaHvQt8QgtnXckrv3gygWgBWLRN0qg3J3/Shl9nlN80Ggmssz83slh1BeU0Mj2bUj01RxBgxLkaMD8gD+cmbpWw8kfoMuf/THq74NGf9t1Jb3gIYArG5ZrGqJrOS3KV2L4J5aGbE4qCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IveReRuc7QueHb0yx9+ucZMuAjlAE3ncgJCObCyZR/g=;
 b=nuC8D2Yn/uKSqn93YExMO6ro316rbOvLxdhblA20mQZA1B1etzwaZjy3S7noYyL9vg1RF43fcdWJGL9zHEqwQ7xI8+r7w5Mrwy81Bo63bN9U0duuQHZJ1boa72fwe1qKjLsZ+iQrvyMOq0twGk+blaJnSWU3wIlCAVbaBpdTNXPJVhD7KFVMgYzfZ2fkSkConxu+/fsmaD7liVacL4MfKpFUiZcCZrUIrYuWxbNpMBF8LHUMVSbxV6F/LLAvvGj2650761nT8UPUBzsOrRgxbSvALLosXxCy+ACFJXDpKMXG8jlZjRWnUs7bV6ra5GOpfCskjO7KlfScYqI187fYBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.30; Thu, 1 Aug 2024 12:57:04 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:57:04 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 39/66] tests/xe_exec_sip: Check if we reset due
 to unhandled attention
Thread-Topic: [PATCH i-g-t v2 39/66] tests/xe_exec_sip: Check if we reset due
 to unhandled attention
Thread-Index: AQHa4nZ0AROLEEYadkK5KpjMfvFaxLISX5aA
Date: Thu, 1 Aug 2024 12:57:03 +0000
Message-ID: <DS0PR11MB7264BDD71D154FAD3863CB47D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-40-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-40-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|MW3PR11MB4553:EE_
x-ms-office365-filtering-correlation-id: 6174edd2-dadb-4762-86f2-08dcb2297105
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?ENnyjgLGpxI6Paxm202k/uSXuKNATlZ4Ky7vxorL7WiKPB1SBGrOc3Wk6q?=
 =?iso-8859-2?Q?lY5cbExYSV57WFj1QsKSsf/z+Ec+zYOa1Wx/TbcrbtXyxlGzS8+J1DAFFs?=
 =?iso-8859-2?Q?D8SF0axKPoqJwJ/cGeMHS6ha+zVtO20IxouOOX083RGNR1fQ/7x2IqPm0p?=
 =?iso-8859-2?Q?wWiRHT6I3giqHv72+PtgzBCoI7MbKaWL+mEB6Ne/sNRFeZTRGzeA7/wT7i?=
 =?iso-8859-2?Q?ACbaNQ4OB1C4PFjztTtYrKLziIRpJlt3VGGciOIkWqFt7pOcZpr4CmoNtF?=
 =?iso-8859-2?Q?Bzd//p0lgs/rPim9bRRWRFK76I3lVgT6LECBnXZbJ71Tkl4hhItpuBnE6d?=
 =?iso-8859-2?Q?pTveZKT+IHuLMeGsl5WOnyd059f0E2VSTT2vd1PpXIyq5iTE9D9EBf9MNx?=
 =?iso-8859-2?Q?OdWebCcBkrTXBdNxw6wFq/51aeGAFwr6GX31b5KOtnpxV34Z5jvxNqDY4c?=
 =?iso-8859-2?Q?e54Fob8lG07/eRSskb5pKJOI2QHwKb/nxKDrww4JlYkpUB+eRpm1Bxxim/?=
 =?iso-8859-2?Q?ci8k6D1RtDu7DJPihnmdYUEC+0BBW9J4AVtnoAQqpVMYrKCe7rMld9z6Xl?=
 =?iso-8859-2?Q?b8el1GqgzejKSzmUc7v76XRH1hRdEyBWGIsvhL7NkIDhzbDRkQ+jDArL94?=
 =?iso-8859-2?Q?/nuca6Y5lDOMAguglblOqzgXa0Ir+1hupPSIyt1SDRpz5OJmafqTWSbFnu?=
 =?iso-8859-2?Q?SxbGQAl7j+3fCYvc3VHFRgayVMfgXtAa7w9RIPfFD3XtvK4UQvbducodjy?=
 =?iso-8859-2?Q?rg4D/P3BIAAG6GELhAflxEp9EkDdo6kZgrOX4pjOvloj7BAV2XqX5i63e4?=
 =?iso-8859-2?Q?lUaVvcyQFyzCRFYTOTqvHmwelTWWGOl1UEnA5fmAOAlXcnl1vVX4kZW4YT?=
 =?iso-8859-2?Q?Wep6I90ebwlJ+0Vl/kzavaQr1CwMEqnNEUFApi8Dw93AwtWUxaEnj0YFwh?=
 =?iso-8859-2?Q?qew9yUmUIKlRZdrooCZoq2GCnTBUqrxOOgZWOHQ8/kjK5qvQF9jMuSXD6y?=
 =?iso-8859-2?Q?oVKHD4L8tmB5/LlH23y/bCijZAWMkLBKescnYo2NS6LT7QkpxDYJZzi6PA?=
 =?iso-8859-2?Q?RXuhyLsUreHxO8EywZgnEmBq0SqKhc3MKYR+do93H3y2BWPpSLwJ61itgB?=
 =?iso-8859-2?Q?JfqbkipGIgeY7JJcxEuP/I93fm3Tvm95nRy2W1Ov6PvnyUfPRvaFxWzXyt?=
 =?iso-8859-2?Q?IbosBjYwMT9aoJMy/mgJNlspU9q+rrDSk84s+IcUlG1r1uMckx0u33VRlU?=
 =?iso-8859-2?Q?3EweozHAKvAkv7mClp+D/GwxyDa63Jc5MGH8jCiepKcfjv2yOEut4WL5CW?=
 =?iso-8859-2?Q?vuInwKVObsaWNA6x0zqh4zOcgOTrSjN9lIa56LUatT76+CzHP0gNOljm4S?=
 =?iso-8859-2?Q?wYpd/if83DqL2D/KnoAeVxjzxuKKY4DHbIEr+Q7OqLS78sqyZeOutOyPrT?=
 =?iso-8859-2?Q?/1g3bBF93C+AbpzJT2csVPrz23JEqZ1O6qOyaA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?05lIju6VWSgwK0LImX+6rL+QNFWSapfI0t6PKRBr+dBgwBjPNiQjQcWvm3?=
 =?iso-8859-2?Q?n0myToECc/YCl4CrDsmK6LASFiDI6eD6Aq09hoKI592IdlYu+gmJSuOJmT?=
 =?iso-8859-2?Q?27MxZQrC80FcDaj+bBMs78B95jXS4Z1ul8a75MrRLpoEscxxUXosZSax6L?=
 =?iso-8859-2?Q?uGRo/51FX/JHmBKUgC2s7LiiXzl/iq46Z5CiM817GMGlYU4Tu5wqlG8Z8f?=
 =?iso-8859-2?Q?iVCMBWCKBz5azoV88jqEJ3WhFMvepx4/S0GlxgJL6tUeDHj8y1eqvaPDpm?=
 =?iso-8859-2?Q?bPrU34mZM1+tYx8V87/KWpgCRcq1ywlxySIEYxkNuYnrLSdvNmIGIs5YBR?=
 =?iso-8859-2?Q?ii78v9i6xWFs6VaLR7uiJd9LSefHUa8qPL5rqOW4rjxFOZygy1rRDyTCIa?=
 =?iso-8859-2?Q?gg3P9O67SdhKjGgjf6O/x10n07xlSMJyDr4jEWHeShST/31p5HuZks3Pe7?=
 =?iso-8859-2?Q?qbmzIAwbwulGqLsgoCpjkjmP+3dhgnIK6b1FN7j0hulrzbCvSXLfdvLWkY?=
 =?iso-8859-2?Q?w9OhRjkwPxTGcr3xmy55Rd9x/Lxn7qes7bgyIaJzuWhsMQVVNUp3pSHwmr?=
 =?iso-8859-2?Q?rVfbSk2C5MMmrgY2sa9Fr+JJgv7dws3TVLW1vM6x1ePScsmDLcyDBREjnV?=
 =?iso-8859-2?Q?JImnaYKn4r/Nw8cqr+wjc8Et6i0K0yLYTEFEVic3JJEumOzIWNnkrleMoV?=
 =?iso-8859-2?Q?XGkJXiJ7iEV9LXbwHGTpbaWjavPf7LQxBICUUUE2SDah3q0gRowqILd7qr?=
 =?iso-8859-2?Q?XdTYJOX0xyP6mmQf2hHdeVX13tbOP0T2V+qlY+nsQTFvxi7/20Jbyqnire?=
 =?iso-8859-2?Q?gR50UuNBMQhed3/ZjTMWzvWxk7OHmCpGUMYDmT1m0tc+d4S7liBNGKYWtY?=
 =?iso-8859-2?Q?Md5AKb48rkmbYxL/d4LJ914VMuqDXuTDC+pUw8HK3sPvrVC/nu+DFUOwbR?=
 =?iso-8859-2?Q?Mz9o2fqrAKC5FJLDgvkFGFRUpS8GzPUUcJM0vS0DoIt4uQE4wWnDLbfZ5E?=
 =?iso-8859-2?Q?vnYoGPmSXZ2aoviHXCIul7UWP0JeY0QmmNFuuulNqrViWVxAGQs8gD1i8V?=
 =?iso-8859-2?Q?YGm4tFWfCd7aRBAcNFmX2QKSXSoGa5nNlpLOwNAx/r70ve0IyBbAruwRNW?=
 =?iso-8859-2?Q?xUd87FaN9j8Lc1PeDA0LAXI3Z2YwQW/UJ88Sr6USVBjPEPSbqtMfugesnP?=
 =?iso-8859-2?Q?GKp+/HKOWguXZIUw6gCEPT5ZFVEQ7l7QQarBzYMQ9WhipIPahGGmFwBdrW?=
 =?iso-8859-2?Q?F3Z2/ilsyc9C6i8NBByQ0V3cgq/rrolvzdwqutkrX/cnO7SC1pDq4Gw8Ju?=
 =?iso-8859-2?Q?I5QI1VTGA+uE042BtboGHUzY5++/QgL9JxhPZM+ppmsyiYjJAdlFArwydv?=
 =?iso-8859-2?Q?xf8OcJ26OQwBVq2Ld3XY831meG03u2XI0avyvmDvxz8QjPV4Y43zz23EeO?=
 =?iso-8859-2?Q?koTg6+MSd1odKT8Aw2euT0hxy58WDkdArRWf3mdSEZO1Djj7Iz9Ng4Lmyo?=
 =?iso-8859-2?Q?mZN4aI+d5cMfjNE7uhlH/fOCDPkxxhsk7Dl00xC89Gk2OhH8am6bBTc8gB?=
 =?iso-8859-2?Q?tAaBnyV3Nv3mvfqdtPnVHzt/2GqWTlY3rU6hhwSSiS8r7Lgp6ggOVH6SHX?=
 =?iso-8859-2?Q?1xis6FBd5ATK0MhUl9LfhJ56U1Erne4Br3r9UfB8/73MGnrWLPDLcWSrws?=
 =?iso-8859-2?Q?zWG5tKe6v6fHpsDRakc=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6174edd2-dadb-4762-86f2-08dcb2297105
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:57:03.8928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HwMi1c2AuQ2n/mQqWFM+T9/JSZsIdXEciuDvKtk2OobtTqQ5UNtZ7qLVCNQVO3JoN862vDlsrgXrgmuSEUdtmVqq3Rl5OO/iMwJxFbWidT1C33ILr5XbtyYTsPFSU08v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 39/66] tests/xe_exec_sip: Check if we reset due =
to
> unhandled attention
>=20
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>=20
> Add breakpoint-waitsip test which checks whether we reset upon unhandled
> attention.
>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_exec_sip.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c index
> e52889818..1b0accb3b 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -40,6 +40,7 @@
>  #define SHADER_WAIT 2
>  #define SIP_WRITE 3
>  #define SIP_NULL 4
> +#define SIP_WAIT 5
>=20
>  static struct intel_buf *
>  create_fill_buf(int fd, int width, int height, uint8_t color) @@ -97,7 +=
98,9
> @@ static struct gpgpu_shader *get_sip(int fd, const int siptype,
>  	switch (siptype) {
>  	case SIP_WRITE:
>  		break;
> -	/* TODO: Add alternative SIP instructions here */
> +	case SIP_WAIT:
> +		gpgpu_shader__wait(sip);
> +		break;
>  	}
>=20
>  	gpgpu_shader__end_system_routine(sip, shadertype =3D=3D
> SHADER_BREAKPOINT); @@ -211,12 +214,20 @@
> xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance
> *eci)
>   * SUBTEST: breakpoint-writesip
>   * Description: Test that we enter SIP after hitting breakpoint in shade=
r.
>   *
> + * SUBTEST: breakpoint-waitsip
> + * Description: Test that we reset after seeing the attention without th=
e
> debugger.
> + *
>   */
>  static void test_sip(int shader, int sip, struct drm_xe_engine_class_ins=
tance
> *eci)  {
>  	unsigned int threads =3D 512;
>  	unsigned int height =3D max_t(threads, HEIGHT, threads * 2);
>  	unsigned int width =3D WIDTH;
> +	struct drm_xe_ext_set_property ext =3D {
> +		.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG,
> +		.value =3D DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE,
> +	};
>  	struct timespec ts =3D { };
>  	uint32_t exec_queue_id, handle, vm_id;
>  	struct intel_bb *ibb;
> @@ -228,6 +239,7 @@ static void test_sip(int shader, int sip, struct
> drm_xe_engine_class_instance *e
>  	fd =3D drm_open_driver(DRIVER_XE);
>  	xe_device_get(fd);
>=20
> +
>  	vm_id =3D xe_vm_create(fd, 0, 0);
>=20
>  	/* Get timeout for job, and add 4s to ensure timeout processes in
> subtest. */ @@ -235,7 +247,9 @@ static void test_sip(int shader, int sip,
> struct drm_xe_engine_class_instance *e
>  	timeout *=3D NSEC_PER_MSEC;
>  	timeout *=3D igt_run_in_simulation() ? 10 : 1;
>=20
> -	exec_queue_id =3D xe_exec_queue_create(fd, vm_id, eci, 0);
> +	exec_queue_id =3D xe_exec_queue_create(fd, vm_id, eci,
> +					     has_debugger(fd) ?
> +					     to_user_pointer(&ext) : 0);
>  	ibb =3D intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL,
> 4096);
>=20
>  	igt_nsec_elapsed(&ts);
> @@ -292,6 +306,9 @@ igt_main
>=20
>  		test_render_and_compute("breakpoint-writesip", fd, eci)
>  			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci);
> +
> +		test_render_and_compute("breakpoint-waitsip", fd, eci)
> +			test_sip(SHADER_BREAKPOINT, SIP_WAIT, eci);
>  	}
>=20
>  	igt_fixture
> --
> 2.34.1

