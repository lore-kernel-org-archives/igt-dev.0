Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE41C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 04:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30EB10E24B;
	Mon, 21 Jul 2025 04:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2P+4WjE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD54710E24B
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 04:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753072609; x=1784608609;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v3ECSnrFa7KgGQdHTluor2Gg+iTep1vFjHrfkGGKYQ4=;
 b=c2P+4WjED5WFd84zLNzQBQe4Pw+0kDVwDriZB/bB4TysZDrjwzzLjHVO
 W8C+KAw9eahpsw+7RzHa5Oo9yaYqjCDy35PCWi6+32UItQgL8gkxpaEwi
 wgq0o603KVj7FbM2D0TZRp6CldYAuyxh4LMCwoU8ES6pDoZDL18FJqRQv
 iPBSGWZxLRGUs0DaT0Hepjb9GeeG6JU+59PCxz5z4wjnBCq2NGX3Gu3zW
 A3YjabfQwVT1tqWTcw6G252L2kyj6YRpXzqOOAmX9ihY7SvTGf0FCMlv3
 FlwevFy841hlDmh2KPq6wrX4mOYr8l1seLtcC62jUsfIYMbGCpy3y/hg1 Q==;
X-CSE-ConnectionGUID: a3ygcDvYSnKPzCv4pjC2HA==
X-CSE-MsgGUID: /kHbGPvzRyqXftxkCHm59A==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="72846917"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="72846917"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 21:36:48 -0700
X-CSE-ConnectionGUID: TB0Fnk19Ri2ZTFVWQxCwog==
X-CSE-MsgGUID: CWKYCE2PSoOE5U30qJfuJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="195809916"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 21:36:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 20 Jul 2025 21:36:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 20 Jul 2025 21:36:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.88)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 20 Jul 2025 21:36:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dI+mBWfGs2EUpfXLheIavn6BHNZ1wW8tB00sy8kQFKwv4+pipysN5zVAvr042OuphrINAlGrN6pJxFiY0bOyrPsHHkmb1GoaYHj+LxmgEBPDJLtr/UZIAgwQbV0yryT/HS9M74+oJ9y1rkZCdCl7Oz+YAjdNZtc2QpuWV7of6MABnSwZkULImIl4+nsg3uk5v3kgiqYKgnoDOQHzXNybYV8h4AR5uqxzyN2/ib2I1AOyWUhHQTeX8QXwv6JOAB8wLHO2f9IVGyjCHt/vFhHv7eRn7iKFMmSRfidysxtZJySQ01gey0pjjr6PX67Hwxba5Mps4rVdaSLqdWPgIRgNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y/5iyS7vPIMxTNNmZIofLWJF1KbzGzWnduwksG+YDI=;
 b=iUn2gGBuHh8piPqOimFQQro1qawBLbOUKiufeAuKHP3jioEuaT+3ErD7kuQn7xosbhmXyma413wJZTAA+2bMFXKLcGfR3IVhcYUtqMWM2PctTlHfLGYpwOL/wPSovylpL/2pslTXNuF/xK0HXhy8Gvl7x4aODlxVMIPJ+YNsHnEaPYP88tNlleIQK5knozDVsYANOA4isOzRpWHzKyhUYxFoj/anFg9gMk+l1jbU94k92OmyIBRd6ZuZOUFwy+Gidnj01P8Ty4eG7GBXHaeeAWgztWrvWGlASYN5PmAGPYHPkKD5XBfmVpDtEsugls5Z6GUbImxpfZfFv3DepS2o1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA0PR11MB4573.namprd11.prod.outlook.com
 (2603:10b6:806:98::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 04:36:45 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%6]) with mapi id 15.20.8922.037; Mon, 21 Jul 2025
 04:36:45 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry after
 LIC failure
Thread-Topic: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry after
 LIC failure
Thread-Index: AQHbUS3QMq8OOsNISkmBTj4Y2IWHQrLupbIAgU6pjzA=
Date: Mon, 21 Jul 2025 04:36:45 +0000
Message-ID: <DM3PPF208195D8D1D4BD53A4DA93768C250E35DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20241218091826.3014999-1-suraj.kandpal@intel.com>
 <DM4PR11MB63122D7422D7617B9B3A3D2190072@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63122D7422D7617B9B3A3D2190072@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA0PR11MB4573:EE_
x-ms-office365-filtering-correlation-id: 28abb432-e14b-468c-7af0-08ddc81032e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?LHzoDks4ro2yuuQtZISBbUXSL9GwUO8udLm4FJyockZkugM8Vg+v56oH8gaX?=
 =?us-ascii?Q?e1ZoAMbJO4OzR4biD+UHGdZCsZsY6j+vg83ghx6S8brA8QOC7rT44mVjEBtY?=
 =?us-ascii?Q?dBKWn3Ax0pb0jl6TnnSOyWWCYgnF2D90cPsk+UpbnBWbpAKN3NJwA7uuyw0r?=
 =?us-ascii?Q?D/u9lRM666Iqf4CuPWw29+CCtLptIIxI1P2VkuIpLQKWnNBgaixjgRyn0nbi?=
 =?us-ascii?Q?57sNX3HZaXPxoA1CxjbbN339MRXDDr3s2ppPq/q8YpCXiEEbYljyJ/nreYkI?=
 =?us-ascii?Q?X/0i+Z16xY9SpmhzyThdmmiocyu0WHQ800jG/FZiyBI9MNd+nwTfw/7/mfj8?=
 =?us-ascii?Q?m7PE1lL5w+rxk+mspfnL79ZQb5ygRbPGhbWRUGkF65AajmJYS8e/vVlRAN8G?=
 =?us-ascii?Q?448gNQHhdY9njUACiTLdtlNe5bmKMqVCVkPtJO9TPJCglrtuRk5Xocro59DY?=
 =?us-ascii?Q?atHxJHpJghS5cPjCwTShQkHzXexTk5M6+PRJ9pU9g8XKje7Tmb3cOXqe5kOD?=
 =?us-ascii?Q?YnRdm2ei4GaQtCQZgO6Eu2CFJhMPiH87UnE1KplViBS1HkWCbN8zWbyJVmDM?=
 =?us-ascii?Q?pRX0PKWBg/C/eqkZdrlNZPr5HcNW7DAmobM/oWLXeI5Upb1xXGs835IQTAut?=
 =?us-ascii?Q?soThpSAod8noMEZA0g/14Ia0eeTWPLulNZpUpSGmh8Xyno7jSX+g+6dbMWY/?=
 =?us-ascii?Q?+IhlIn4/gpEXh4s1fJ6L8Gb7h2awtr8OZGhtVai8aryyEK4zha8qVQQas8eO?=
 =?us-ascii?Q?Y8itZDFfpt4/IEQEGnhyNIxuMTLrbWqULvQJzlLudw585tNpx6Xi+jeA8qWI?=
 =?us-ascii?Q?n/50u/jlYJosYTOf8h7Kg3AodQCJTtW1IJMqQ3V9Inokp9f6qDVwSy1DaGPJ?=
 =?us-ascii?Q?YeOb9HYTyfQnlrjmIJ8BeqOxmAklYFpnT+DH0Lc+KMFkK7tRzsG8qFZ1sx3B?=
 =?us-ascii?Q?+2Rr0indPhLSFl91+LaZUQEh+tKztDcIeSQUrPv0mjSvJIGzahtsP0FLB/g0?=
 =?us-ascii?Q?SkK3Ug4zeVS6DQDkjSTnkuj5zSUY5s/OHaNFDoHZ6IW/mIQ7OjlQqBkKiMVm?=
 =?us-ascii?Q?At8fiB+pNlwkRvqz3yIVley6+QnthdgCSuDuOVMj+Z/MEa1r7u9pXYc3bAJv?=
 =?us-ascii?Q?gbk3enDpZ7csK9gxKU0Jj0hnS4ue2HXfGRgoWxs4z61XI16o4hrRfxfm0dfm?=
 =?us-ascii?Q?RjCcHVq7hO0n16lO3i+DXcjIU7/gZiTFnqwbxcAXLmAnyNqIpB5/3AiJuJpl?=
 =?us-ascii?Q?bfb67+LEqzAqls4usm6XV8ENHJNeSS/6K5bs81z4v7Unx8dejBSG/druQ3vn?=
 =?us-ascii?Q?IxXTH3Lpd0DGdemqs1HBn4C0mIKJGcFY9GKSSGsdyv8w2jmUW3xICh42kwU5?=
 =?us-ascii?Q?SmrKJq7IMPQ8WKNuNJeIGuL5lFezSYWhd87MZTusOF95HQqI7CwQ/c+xk0eZ?=
 =?us-ascii?Q?g0iordZvWbQ07boXrGcR5+W0DiFdHuCt7GxsYz+z1g1Rr69+o1XnHw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/Uce7qe/UagJgKmskahSVfWelby9BoMrLoq57SVM8uNRAeVpSv3jCBRdz5iH?=
 =?us-ascii?Q?2TXH8W8poCnOFsHRwJSEzswhCiajFWqKcQMFI3fgKP3niRCUkdaBoLRS3vwZ?=
 =?us-ascii?Q?ht/xbNJQLtc9JyvvKz9+PHjU/tMYVYCW+OPumGeUO6ahbIJtV3OyLw4QwBru?=
 =?us-ascii?Q?y9QPnxMGLGKNtaZDjM8/g3/lrN3Iwin2ZSaZ3ckbhQuN/Ngk3dBoKBQ6F4hl?=
 =?us-ascii?Q?0aPj5o5r+iyhGFiCydF/Xw98YMbBhjg8faY4G9YVjBzCZwGhB+I9ZD5mLcA5?=
 =?us-ascii?Q?lEOAcJg5BGr1NlJINeGLgHz2sH6qol6gVJuLrNc7pAilVtiAcROTuL+3W6y0?=
 =?us-ascii?Q?QX8AmxAUU88kvNGSD7rjQpfyK/xP40xQeYBapfRIZ/u1VcaG40gb7ylmmZyW?=
 =?us-ascii?Q?JxkmnYWabmrdPoz24TOCYBfef93PM4fY8+LP4pCI7g6xAB3V3G8BjjIXBt0s?=
 =?us-ascii?Q?NBOrG0ny4YGjyJTwRjLVp3Ks4RUnZQOLQlkP63MssSKj+/mZYNblMf2/XCc2?=
 =?us-ascii?Q?pC5MDiQlxpmGkWyEhcfxt2x9Awd+2pkdiRHeZfhpK2a3MF18vndPeqXgG1j2?=
 =?us-ascii?Q?KREQ82nA093OTxsc/LG9WvVnY8rs2pl/PpM/c37ljwjkwUWiPP/BGU6hJMUF?=
 =?us-ascii?Q?2AnwN55D3nTAu1Pl76Ewtu1wtalPtrk7eJ7h91wicWB1qrIXDKjjKggkbt+8?=
 =?us-ascii?Q?Gtuo0HUC8+//uBtuWAzkMkOx+9KyoJMO85aOWqam4bV36YjWBmtpF3+UQrjZ?=
 =?us-ascii?Q?ezUQtRDdYm3YiDUAmv7klFIdtdduzeRJBOx6hx5B7NJOZuEDEDk8BYcvAVR7?=
 =?us-ascii?Q?yLIN9Bo5g+HIMm6uu+Asds0PmLktAPZz6nuINhVLzRBlFHxEtV/LkO0QgmO6?=
 =?us-ascii?Q?sOrvr9JtrIVk7k8xkI3Q5k6y+z/uEr/jQxbEt8IAxgAUrlOgJgwLurzT1VK9?=
 =?us-ascii?Q?NqvgRbsNehb+4SNO4N8gtd1nvB7ppwJ3DStFl7n2oh4prtN3lvLLI4HVztE/?=
 =?us-ascii?Q?onByHPMhlMmvelCPAZv2a8ymqX/Teeaw1MpBnuvf7GRbiTcqrym0XAmXCTz/?=
 =?us-ascii?Q?c8FntRX/Ham1v/oCfboKqBsD5EzXuhV+ekurri617M+u6V5FTlk80I285tS+?=
 =?us-ascii?Q?NmSALEJ16WlgMeFil9DbOL7Xe0Bw4QjdIPf+8O1r8L//62JPN6+Ze4n4ldoa?=
 =?us-ascii?Q?dIKnvFDktuJs6WxdccLPV27a2P25JtqVtqU4Az7FPrifEmaRPLB1dwwopzJl?=
 =?us-ascii?Q?TC+3S9DXaxQTqdXTSKOoa/eY9ecMLoIOCNi1jSPs4laAryqorfpxj08SbCia?=
 =?us-ascii?Q?cNRvmmDZQjQu/mihgDJyFO8yNVkuYQJyt6DTQ8MGmEfC5mr52s9aU/kWF3tR?=
 =?us-ascii?Q?4CISbxlNe1DMdvWviZtTa+waHYjlEjm0axqZaEOfd3jDL4dLQ7893c/cYuxj?=
 =?us-ascii?Q?fqzzpblcyo08q4PwS+eCSQcxu7icRkGicpjBWtBS0rGIr+GZwAUXDxd0Efif?=
 =?us-ascii?Q?6R5BqCaOaFnKgx5r0au0TSLNAs5MRpitCBAHc5wlTzmtsABxUPkxriRC7wa6?=
 =?us-ascii?Q?yV99JRwCmF73MGLcma0DpkKn0NukGMw9zT+sJBMp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28abb432-e14b-468c-7af0-08ddc81032e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 04:36:45.4990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JKw+vpn8sJOaZDD+6NVPA/Wuwmy7y3/yFEkC+GH38yqQ2o5IZq7DbVRE82VIaT39fJ4fAlnmSLn8RbyUz92nNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4573
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
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Friday, December 20, 2024 11:27 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Kandpal,
> Suraj <suraj.kandpal@intel.com>
> Subject: RE: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry af=
ter
> LIC failure
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: Wednesday, December 18, 2024 2:48 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>;
> > Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry
> > after LIC failure
> >
> > After LIC failure HDCP should be reenabled when retried in the
> > subsequent commits add function to re enable HDCP when LIC fails in IGT=
.
> >
> After LIC failure HDCP should be reenabled when retried in the subsequent
> Commits, add function to re-enable HDCP when LIC fails in IGT.

I didn't get what you meant by this comment here

> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  tests/kms_content_protection.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/tests/kms_content_protection.c
> > b/tests/kms_content_protection.c index 04dff7a05..5b3e8f00f 100644
> > --- a/tests/kms_content_protection.c
> > +++ b/tests/kms_content_protection.c
> > @@ -373,21 +373,22 @@ static bool igt_pipe_is_free(igt_display_t
> > *display, enum pipe pipe)
> >  	return true;
> >  }
> >
> > -static void test_cp_lic(igt_output_t *output)
> > +static void test_cp_lic(igt_output_t *output,
> > +			enum igt_commit_style commit_style,
> > +			int content_type)
> >  {
> >  	bool ret;
> > -	uint64_t val;
> >
> >  	/* Wait for 4Secs (min 2 cycles of Link Integrity Check) */
> >  	ret =3D wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
> > -	val =3D igt_output_get_prop(output,
> > -				  IGT_CONNECTOR_CONTENT_PROTECTION);
> > -	if (val =3D=3D CP_DESIRED) {
> > +	if (ret) {
> >  		igt_debug("Link Integrity Check failed, waiting for
> > reauthentication\n");
> Can we change igt_debug to igt_info.

Sure will get this changed

> > -		ret =3D wait_for_prop_value(output, CP_DESIRED,
> > LIC_PERIOD_MSEC);
> > +		test_cp_enable_with_retry(output, commit_style, 3,
> > +					  content_type, false, false);
> > +	} else {
> > +		igt_assert_f(!ret, "Content Protection LIC Failed\n");
> >  	}
> We can rewrite a
> 	else
> 		igt_assert_f(!ret, "Content Protection LIC Failed\n"); Avoid {}

Usually we avoid this but the practice is if the if block has {} then we ad=
d {} to else block for consistency

Regards,
Suraj Kandpal

>=20
> Apart from these change it look good to me.
> >
> > -	igt_assert_f(!ret, "Content Protection LIC Failed\n");
> >  }
> >
> >  static bool write_srm_as_fw(const __u8 *srm, int len) @@ -452,7
> > +453,7 @@ static void test_content_protection_on_output(igt_output_t
> *output,
> >  	}
> >
> >  	if (data.cp_tests & CP_LIC)
> > -		test_cp_lic(output);
> > +		test_cp_lic(output, commit_style, content_type);
> >
> >  	if (data.cp_tests & CP_DPMS) {
> >  		igt_pipe_set_prop_value(display, pipe,
> > --
> > 2.34.1

