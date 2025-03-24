Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEDAC36001
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 05:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CE810E0D4;
	Mon, 24 Mar 2025 05:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gj0SKPBf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC93410E0D4
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 05:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742794231; x=1774330231;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ihn5FZtBM/BNJVhnPLrvwiMlgWlo2nbiqbR69RYqAlE=;
 b=gj0SKPBfUzzYBz9gUnjaRK20sARLAi6gO/+pzaBZZEp6uk2hww2WNZb1
 iRYlR8qjfNSTILrYp4mpsfr1hXiiEqQqzh4ak0kuC/igZgXj39EdRNQCS
 ia0x8sUzM3MO2NWi4PJKmaA1Lx90y7WQB1U+iXOv5hMJVBdXR4VaasyY/
 Tv3Mulf5lSkDfnEWRDvebAMeUCMLpQkUXCBMmCMydN9Pj+V0fztFnPk91
 vhPxZrMd93qBZTKLYN24twOQ8TljwCUAi3XNFQgR2JVXMwwRJp0i7vN4k
 9rkTAX/rUE9LY5XwFb8xt/eAs+WdhseFhZCv5vng9tgSN80S/cuPs9Q6K g==;
X-CSE-ConnectionGUID: uIRlxAlXTCGWHqcX00ioCg==
X-CSE-MsgGUID: DLQXIn1xTg+9SWx5JbTHbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43991126"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="43991126"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2025 22:30:31 -0700
X-CSE-ConnectionGUID: jbZevvcASiaDORSQAoeHow==
X-CSE-MsgGUID: 4XAb0gLpRV6Fm/0T+io8hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="124461630"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2025 22:30:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 23 Mar 2025 22:30:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 23 Mar 2025 22:30:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Mar 2025 22:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqNGigHbh1/p3bu0pkFM26htt/Wa/XfMLNsP6qYlFB7gsntvAXs+nhO/dwJs2qKyi6zbUwG+1k83tCPrmdwh0hUL3BQhYRvfkCb4kE6KPlADIuaFzltmoNyZsTToOxzK999IRDe8c+r97rlzMwIfIlUM6Rpw1haSh6xoATry99AnbPUbZ3WoAXc7mJbSxUkud9gimqmgDUGAnrKb8NsH71FKDozojsHiOAnqTe06Pr9wlIsMma7xMBwI1UHwpUMhyedSwPVng6a4hRTnrc5bBEPlyMMb0CoRbrLz6op5Ah63/hA9JfLmG/14yIn0LzisfNiWWPqs1J5OIHwqkbQhpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/Oe/x+w5J/lkDDpwqyr7pUMjWg0PWpLu0HBWNkvcZM=;
 b=G8tBnwabkcGrWElSrja+PNlY5g8JfK+pSXJywBbIwno/+woh6q/zPC0eWbhRICI7p6ctiPAIkejy+Hkze8SRGr9Tve9yGnh18VXEoRuwl+7N8oIH4WCYZpd4zclk0MpkHUQU6aejhrx0F/FsCj/2+wgD+FfiJXJ4TINSvWIBLppVn4QWGOstzB+mh8kWsDlMn6MfIKP3nAvyHvtxsRIPyW0KPHBhk91SHh3Vm+pnqnwmEF7LYW7TRypuPixIBWoR7NDR9PK984NW3Esj0vep4DV87n/iqVpjQt2HovTw+/ScFIVsw4nLAQFY/OO1yZTbQMAIMUuNsk10MMb3hsUTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 05:30:27 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 05:30:27 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, 
 "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v3 1/3] tests/intel/xe_pmu: move xe perf device to
 fixture
Thread-Topic: [PATCH i-g-t v3 1/3] tests/intel/xe_pmu: move xe perf device to
 fixture
Thread-Index: AQHbmk7OWUBoxbXVXUmmPZ7Y2MEAGbOBxsHg
Date: Mon, 24 Mar 2025 05:30:27 +0000
Message-ID: <LV3PR11MB86951D08DEF0CFDD156B0D31F9A42@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250321110958.3557106-1-riana.tauro@intel.com>
 <20250321110958.3557106-2-riana.tauro@intel.com>
In-Reply-To: <20250321110958.3557106-2-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CH0PR11MB5219:EE_
x-ms-office365-filtering-correlation-id: b0aacbcb-a288-4142-377b-08dd6a94fc55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?94Dvv6lO89yVP3Jzli5ycxKeMkwlWP3KUOg+I2bAsnTU2z8XbTkvEu2vn1Dp?=
 =?us-ascii?Q?BOtBdDQQv2NW9B6/C8BgkUSy4zFrWFtKZncKbJvOf4AcS/Xw1huWekRSeL+f?=
 =?us-ascii?Q?+kQqOef6lbcP+t0JVXtDAdvTyA3499zlRjF9mnfhym1ywtxDjuVBj/lUANcI?=
 =?us-ascii?Q?4CBufxJQm19g+619XMto9QRJzDrZh//Q+ThXDYdgJ+qnkq1u1TGoJbx+qFoY?=
 =?us-ascii?Q?t+k7CiOYC88Or5uEdNWbCcr0SR7jkJsXLRhXa6LrONv0GgvNNbA2cCs4Gk57?=
 =?us-ascii?Q?0IchK6+TbVzXNnya1TGmlidoCT6lq2+EmdzM0gPoZx3w0m80gBdEjn/ZlN7j?=
 =?us-ascii?Q?CHSCdaeq8eY8pHeG83nyCKdfIYDsFftBEYq6HsGqoeyzQaWAac4/dsfMp1YM?=
 =?us-ascii?Q?qgCGCvInHlYubdEIU+YEMdtZg4ZPlYVsMerOK5G++TiLey6fLeyUmmRC2XAm?=
 =?us-ascii?Q?z38ZS4FWYBnWFp9vro59J8MCoN+NeCePYB/y+IqxhWXbsTpHLgEbwxsJGXwV?=
 =?us-ascii?Q?6CxhqPWNxReC78wlrSrFhu4rVcNMmyAeuFyaXRndWnzeHIl45sJHLuSlsxNi?=
 =?us-ascii?Q?Mx8KaKEOyxnYfzwdNsIN9c3u+98nus7cAMvbeN4m00cZue946r5jmdK9CleE?=
 =?us-ascii?Q?e2IMX3b4/OF3yVbPeWqnD+omeNHkfnij73BH01IcJCGACSP/tNubgfYruqcp?=
 =?us-ascii?Q?qRCHRqnJqhzFqD2LB3/nWQpxOpm3P9oWkWbqvC4H97CRlh3YI+CJpR4NrCWy?=
 =?us-ascii?Q?sCT7jDUBQUbtJ+OUzEGZlW4Xm+JDQMUoAPWatcA74qxqjRPA7AntuNqP5+oI?=
 =?us-ascii?Q?a40hDsLtTXIien8TcZZeeG95MV38QhLYOZiIWn6V9ExQJg1EllVbtOhw6qYN?=
 =?us-ascii?Q?uDHSE82NxGJP1jG55sF+16f14EJCCMnZ9xqUiWzPO8YjzWVBWyaDMI44eYP8?=
 =?us-ascii?Q?GcjEJ1EpS1wZgIKH6USS148fm6eD0LcU3RbQFnb4Lo5t0M1q6ld9d4sOCTTw?=
 =?us-ascii?Q?Iij/1dDdZbdj6B6FXiHCbQ7ksOdsJ/NLEfVEjY+Tlvw4LU0k9+TVi1YePjq4?=
 =?us-ascii?Q?2FxvD96tCtfuzzODXLn6fP9o6K11XB/qatyQVaUrA+oUrvQpMLEzwxvHncJq?=
 =?us-ascii?Q?obxdEuecs67iNUyIqtawIV5j3pRZAH1w7dwaEttnaN4rIogY2vaeBeIcY2gn?=
 =?us-ascii?Q?DDVZocxURrMQWUvXYUb+C6qD/OZ+rH/BUmiLtqX8GWxUDB97eLz8iYtRAH8c?=
 =?us-ascii?Q?VhOJZJlafieg0ZmwKb4MwsOok1FdXfhHT7/DmwccVAUH+oOday7BGfWhwrBG?=
 =?us-ascii?Q?ZM0BBnU8/M2WaE3EpZUDdWG5qU9khRAnFtopNFbOrPUR2aBuxbmgXymhadC2?=
 =?us-ascii?Q?d83x8Cpu1xi1/RyqM1Oefl4oyFXX6D59M9OVaD9raeQWShsPJ9d8YhLoLE0O?=
 =?us-ascii?Q?fPe4q/LQJmuaXYkyApaTmjdaZEKrcbmI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NdXuvWw89SBA/rSHKzk5B1J6vo5NLRZ98Fct02wKkpSXWF9Uqprz5HMnqpcY?=
 =?us-ascii?Q?XBQZ06krURyxm1NoYSH9qPZX42ByrAALndDKapGOqZb86YvGqCr8JdmGWc1f?=
 =?us-ascii?Q?LvmJdYxyUARPzLEA73/amQ08hhd3THBf4oYXhTWpsUL68gZrAjvr7VCy+ao1?=
 =?us-ascii?Q?7bwaGQvjZglLwMzBfkYH12k5oAUkEFrV9bDp8+oAI7apj6uSjVXF7mgUSFln?=
 =?us-ascii?Q?tdtzWRqbDLhnugY+fJCXTv+xB8H2pTzMJXir/pXO2qUamnpd5yt7EUg2MFrW?=
 =?us-ascii?Q?ONpuNAJZQ1bAQhpLtQC5ye3LKiufD7jNENgUd0MIiRPGSOuQFzGS0VDiTifH?=
 =?us-ascii?Q?eROmps9vLLKD1nRrqhrgLUYiRu5g3vQKGhx8+KmKsirkMlvj00zeJtBTq+gE?=
 =?us-ascii?Q?ZM8CNnQPgPocsCcdwtIq5kCnJhit/M9pJMu2Xc8yJETacix0xwkMulqjEr+X?=
 =?us-ascii?Q?Ta/lB3e+BI1NA7PTMESaooQqpAGTdz8vli+J8xDXRy08vGRv8GCQBJyK8Xmg?=
 =?us-ascii?Q?2pSd24ImnWS4sY30V+t6ChshjxkJerF2Kar6ngk/JUUrxW9efZdZC7EBB+eS?=
 =?us-ascii?Q?Dcd07AzxtY56I2ZqJ83v5pp64bZnUDluI3b/IIzinmK7zFtrcSZyoFB1UUZG?=
 =?us-ascii?Q?xbsKFTMeV5ZpYj1Umi7VmbeoZHASidZX2a6mruDsQVkks/ah/5eP/WXJCvD1?=
 =?us-ascii?Q?TVoL0GkpKmCXTM3xx8MussNSn4dn3qxjwMzniM3ukrCEFGRf1NxV+HN/ajX2?=
 =?us-ascii?Q?XhPLkP4Bi9p6y96RWZGV6GFxuCFllsDw6lWwQn9ZoyaVA/iI74vdbAIPQT/H?=
 =?us-ascii?Q?XRyh7ZAKMRdXW9EK/0kKJHeYBxv7NmsrTRqBUe4NhPscLFTjo07CltDsq7+1?=
 =?us-ascii?Q?P7MdS2zEk3R4ljAnC++GLSnJOjaICDxu5vOOKc63BNcyMskqv1aTdkxEhoyn?=
 =?us-ascii?Q?LVVA5EZyZpQaxp0gyjOSs81fAmLHu+BPNPOsAvRhfohjSxhl/xFEH0L/+iv1?=
 =?us-ascii?Q?Es5XmUdy4up36EyPzVnUxhzJbZfBYPgT1/6vd6hjSQmBoXlNVFDLD2BFFH5J?=
 =?us-ascii?Q?syXvCH+eshvYKpDsdsPv9LnQRzpoG+c8LA7IxQXKn+wEF1KhGkyjzjl1yEKK?=
 =?us-ascii?Q?FRJhp65tUSgLbS5R0odTuYYFWtwi3Y4TWHQV9mUm5JbBRMfMrtyMrXnlA8JE?=
 =?us-ascii?Q?ThmH1uCBU2APbKJZoS34Nu2rijTWZrq5d9w9rKdWqQnX8QsU/u9oRhJX5syx?=
 =?us-ascii?Q?ci2zNHSA0dmIEu2rX1MFnDN5M1cJZV1i9PiboHfJIO2m+TFFYJw2Fhf91wJ+?=
 =?us-ascii?Q?rCGA5lAttYg6aq6SqvzNaO6riuCm1DflcH9tMvbA3+HitSP4Wl9ZRR9CCyrU?=
 =?us-ascii?Q?YA0ZuI1KIbIGrftKx7G0nQybLGnRGtognWlLcHYq8t8gueNw+f7cCblbTBov?=
 =?us-ascii?Q?oe7sQmNs6oZB9JLB5GiedGn3JLy/kxWNxk4CIabaNud67XLTf/IHxb8YB9n5?=
 =?us-ascii?Q?T7BxRG3/QD0bEa/gFZkzYEM2Ga/BtnCftkZQVUA+DROYyIXQjxT1odhwQf70?=
 =?us-ascii?Q?z2x/zbqOsnnr+mn6mFJcpRD+lHjcMZcbdmoISzHpd7oCVB73YmhGtGT80dVR?=
 =?us-ascii?Q?Cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0aacbcb-a288-4142-377b-08dd6a94fc55
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 05:30:27.7129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TaO5vLqjKGUrMO1kekYL/oyHfAH9LFVSWgqVh3zB2TOpwy+rDW02mnQqALnkJ2bsMc+4RtYRMY1+e4QBtSzHxPwKQRUmNgwZFHtN6tqxoCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Friday, March 21, 2025 4:40 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Nerlige Ramappa, Umesh
> <umesh.nerlige.ramappa@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>
> Subject: [PATCH i-g-t v3 1/3] tests/intel/xe_pmu: move xe perf device to
> fixture
>=20
> move xe perf device to fixture and re-use instead of
> initializing multiple times
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/intel/xe_pmu.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 66edf24ad..f0959abe2 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -26,6 +26,7 @@
>  #define TEST_TRAILING_IDLE	BIT(1)
>=20
>  const double tolerance =3D 0.1;
> +static char xe_device[NAME_MAX];
>=20
>  #define test_each_engine(test, fd, hwe) \
>  	igt_subtest_with_dynamic(test) \
> @@ -92,7 +93,7 @@ static unsigned long read_idle_residency(int fd, int gt=
)
>  	return residency;
>  }
>=20
> -static uint64_t add_format_config(const char *xe_device, const char *for=
mat,
> uint64_t val)
> +static uint64_t add_format_config(const char *format, uint64_t val)
>  {
>  	int ret;
>  	uint32_t shift;
> @@ -105,21 +106,19 @@ static uint64_t add_format_config(const char
> *xe_device, const char *format, uin
>  	return config;
>  }
>=20
> -static uint64_t get_event_config(int xe, unsigned int gt, struct
> drm_xe_engine_class_instance *eci,
> +static uint64_t get_event_config(unsigned int gt, struct
> drm_xe_engine_class_instance *eci,
>  				 const char *event)
>  {
> -	char xe_device[100];
>  	uint64_t pmu_config =3D 0;
>  	int ret;
>=20
> -	xe_perf_device(xe, xe_device, sizeof(xe_device));
>  	ret =3D perf_event_config(xe_device, event, &pmu_config);
>  	igt_assert(ret >=3D 0);
> -	pmu_config |=3D add_format_config(xe_device, "gt", gt);
> +	pmu_config |=3D add_format_config("gt", gt);
>=20
>  	if (eci) {
> -		pmu_config |=3D add_format_config(xe_device, "engine_class",
> eci->engine_class);
> -		pmu_config |=3D add_format_config(xe_device,
> "engine_instance", eci->engine_instance);
> +		pmu_config |=3D add_format_config("engine_class", eci-
> >engine_class);
> +		pmu_config |=3D add_format_config("engine_instance", eci-
> >engine_instance);
>  	}
>=20
>  	return pmu_config;
> @@ -144,10 +143,10 @@ static void engine_activity(int fd, struct
> drm_xe_engine_class_instance *eci, un
>  	uint32_t vm;
>  	int pmu_fd[2];
>=20
> -	config =3D get_event_config(fd, eci->gt_id, eci, "engine-active-ticks")=
;
> +	config =3D get_event_config(eci->gt_id, eci, "engine-active-ticks");
>  	pmu_fd[0] =3D open_group(fd, config, -1);
>=20
> -	config =3D get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
> +	config =3D get_event_config(eci->gt_id, eci, "engine-total-ticks");
>  	pmu_fd[1] =3D open_group(fd, config, pmu_fd[0]);
>=20
>  	vm =3D xe_vm_create(fd, 0, 0);
> @@ -202,7 +201,7 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>  	uint64_t val;
>=20
>  	/* Get the PMU config for the gt-c6 event */
> -	pmu_config =3D get_event_config(xe, gt, NULL, "gt-c6-residency");
> +	pmu_config =3D get_event_config(gt, NULL, "gt-c6-residency");
>=20
>  	pmu_fd =3D open_pmu(xe, pmu_config);
>=20
> @@ -233,6 +232,7 @@ igt_main
>=20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
> +		xe_perf_device(fd, xe_device, sizeof(xe_device));
>  	}
>=20
>  	igt_describe("Validate PMU gt-c6 residency counters when idle");
> --
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> 2.47.1

