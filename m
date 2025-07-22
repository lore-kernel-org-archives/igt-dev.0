Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76659C83F1A
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 13:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C1010E2A4;
	Tue, 22 Jul 2025 13:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y3JZXR70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9EF10E2A4
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753191080; x=1784727080;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6u/jfA93PSyjXnCIhDsVP8tPN/dNTPUAJAv9rTNzFRQ=;
 b=Y3JZXR70Yg2P/TVpS1G6aBM6dhBk2j4K3WHagipkZQU6CRStSDSogByg
 RnyooYk+SYq0ZDFNyao6eJ2wfYVCf8MeFtpsEa7uAg68wMFrI9vCgcJIS
 WMut7C7rBCJ+3k0vrrR00k1NcsU2rm3neWsgmoOA97u/y4gnQ/0Slbfsh
 AgO6kDDYhDYtLymAnCSzxXPIcGw7w0kSCiGya0Iv8F+EmDqFzfzP8qCsV
 72pTlLmkh94VJeHDJUdIWH+1Web5pAQPrwIrOadz0WjOX+myAKAa0oZi7
 n1aRnpxCLl7xUfxB4w6IlDSCfQ2+35UCy2jWE9NkH+uvY4aGOxeMu48wb g==;
X-CSE-ConnectionGUID: fbqTRPInSC+0If4Dp4VXCw==
X-CSE-MsgGUID: 0m/3y9xmSumxO5HSRPdorA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55552865"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55552865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:31:20 -0700
X-CSE-ConnectionGUID: WVtmzidaSHqGuq86nVZn1Q==
X-CSE-MsgGUID: GMFzkpy1TQuDByTjx0I56w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="159215864"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:31:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 06:31:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 06:31:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.75)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 06:31:18 -0700
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by DS0PR11MB7442.namprd11.prod.outlook.com (2603:10b6:8:14d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Tue, 22 Jul
 2025 13:31:16 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38%5]) with mapi id 15.20.8901.036; Tue, 22 Jul 2025
 13:31:16 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Dandamudi,
 Priyanka" <priyanka.dandamudi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under
 memory pressure
Thread-Topic: [PATCH i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under
 memory pressure
Thread-Index: AQHb9kgv5jozjFE5+E+NOeiqE9ZsebQ+KVKQ
Date: Tue, 22 Jul 2025 13:31:16 +0000
Message-ID: <BL3PR11MB5747D9B6BCD1DB53F4C69DFAD05CA@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20250716115237.3279176-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20250716115237.3279176-1-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|DS0PR11MB7442:EE_
x-ms-office365-filtering-correlation-id: 6b5075f9-fd46-4512-ae97-08ddc92408e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Oe5Qfo/q2c/UQjz6zglTxIncoX8JJNn1b3khLHdxcQFMru1G9siTqL2Z4S6E?=
 =?us-ascii?Q?E6C+j12Z+UwmvH3vawIaG0yA8uBH8VoqFcCc0Xp5Pb3XfJJpsZFXMBrqpVIP?=
 =?us-ascii?Q?tX4hxO9OfNV91uXMUmB7bow7zaoen5wqc0QMAJyeo0aNj980J1Xu5qhgGmFx?=
 =?us-ascii?Q?rIoAwR/MV0farmRM001AsGOQ4M+qG521CcDjA4JRjgBscU8yanOKlsLIFVdP?=
 =?us-ascii?Q?hzmt7qYG+ECyMcWGKC4BX633TriDVKaBjk5nWaXFtjWnsvusp68IIIcyWLpf?=
 =?us-ascii?Q?VuZ+Omyn+rT3Hca4qZCAZdTeukI8Vxl9z6+I7ZkIt1h7bqorPgseiNfEwtK3?=
 =?us-ascii?Q?uh27t2iLhfhbuoV+VBYqm+oAXa5F8Ve/dFMeFbWuqsYrLR2fKYOSAtoEhvh6?=
 =?us-ascii?Q?/7JRKftSQUccXqQr+ffTFwICWA5bSxAxg6LOcJPRT9frwrGdUGjvPFiflBAk?=
 =?us-ascii?Q?fOUQW8G5g0X5gABzFeg52a/0ySmw5mtnAp0eGy2Qz3iBfp265Tih4v2JzBKl?=
 =?us-ascii?Q?jSC7VknEDM1C881/6r5y5IG3r0hW61LYv2+1V+gQYnXHa28+LCSvx2laLaB7?=
 =?us-ascii?Q?E2yol1VazTtgYWq5ElcKTvDt6jdS9SVrRgHKG1KpMHbFSZk5/JmWanN/Zia1?=
 =?us-ascii?Q?wTHtAwYERnDwULEfU+EIXeQeXQdo5Ex4w7doyQTt/yReiBgWbvUQrCMlZjsS?=
 =?us-ascii?Q?/wMmkpNhzCgILKjdveg2G7tWdNnaQfa2VTd/p7uN7RolqxPrsXnvLjVxDdlw?=
 =?us-ascii?Q?shA199KtPe5877eU6qt6mluOmgd3DGtPm9KywkNNe0WNqcbwAbctP6pBnq1F?=
 =?us-ascii?Q?I1Z51xaVHIyWXaNR0KyXZsWeV8JxrmX7MTWdzfU/HWZf5LzWfFIGU0DxXYQI?=
 =?us-ascii?Q?IESZtL+xI73Mmrzoc8NUAPnileEThFQ3/wIC6ygi66ABFGQbAMhTXwfmRW7U?=
 =?us-ascii?Q?7smd552gyUmxOOfoAZjvBSskeGBYQbzaBlRVA6ewKoSBaC5ou7nhi3jVflPL?=
 =?us-ascii?Q?o7KYnbwEsX30o8JDwSvPIviiaunxIs2d1WKqIVrTzZ/CjYb7pMsVvWkNKlO7?=
 =?us-ascii?Q?iENg3EhewS1blc0eaDWBFRCi8qHYTco7QvgdAF8Q2sVbZbvyFlWaEEql8PzY?=
 =?us-ascii?Q?Y5Bzu0FlCqPMFck087REe0yLs7O+RI4qP+2D9odVQDP6a+eai6TEhcDVGEHS?=
 =?us-ascii?Q?i2o8+m+61aAKKjDbnY2E5LUQbe/tDcxAm8XF6Bs+mMmStCNstTMjsPVfQbLn?=
 =?us-ascii?Q?YCCOO9dkP6Kyj91pLcIihl+rCq378PO0u6oJXbovL/tpchKFD9RYyQ3/cLbK?=
 =?us-ascii?Q?HbKQpPhPHBK0miSdzpxwPr9Q0SLQICroDlLswMe+BwRqvufMPGDU1sFLV9yV?=
 =?us-ascii?Q?PIp2bkJqaTseWLGKA5BWvDV6y5aGjhZY3yYari4sa9iK/ynJoEVfLsitvmC+?=
 =?us-ascii?Q?isVLaUJszV8ibMsw0SA7qnBp/vgv5KWlCtOcPJ/8rmGBk/SB6FSWaA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IKyiq0RJVSe5BC+9XZzY16pUZlPxXqtF0NJhWb2UI0zPElagEuJHowu9CcSL?=
 =?us-ascii?Q?UcSWk5rlTahjYS/RERhtFHch5t3uuNBfExUEjkPI2zVPRbJZht5jKszWFHC9?=
 =?us-ascii?Q?8S5bmfrOVd11El9gNFHd8/YcvYwcF2V/x8QKmronfPYqvwyW4QSSDb2mjCWF?=
 =?us-ascii?Q?EmoFeARBxmjIPib/dvx2xRq5z8wgOa3N57/eobB/z05NkQIyC/yheekuMHwJ?=
 =?us-ascii?Q?5PM3B1igXUfkMdUicJvHZHJUCKiHPn0A8lx6ZhcPSv6ao0ymlUdk/QMZxdB3?=
 =?us-ascii?Q?hiRaIF1NEYuRSeNZbesARNZiChAXCQJnRZaoOpmrezjkPxQghw02rKQFJZo2?=
 =?us-ascii?Q?zwm/GxJVb7gCIwrzCqYTKeXJIXv86YltW3NqaGrumhEhUOyqvKR54BEVsPQ7?=
 =?us-ascii?Q?NDtPgerpBwRptjnptwPk4CX4rmbd6uAWOvK6r45h1ccIvu2HzvXN6GWfX49j?=
 =?us-ascii?Q?KrFKZCA43FyIbbO7IB855CMhpE/EOKBBDO9uRziRgXXvUK7QAfp568VlXrOL?=
 =?us-ascii?Q?GKbASc/MakZLxuDFk7noOX2aX3zdmPqJxJqUBfqoc0R18El1sjxHqd4d5Ig/?=
 =?us-ascii?Q?VcAZMDLAsVlRlIpHVUrIBDB5nNDUFSbA1ESKMDiiNV9Z6/sdoRAUFrqfP1MI?=
 =?us-ascii?Q?I7cQQMAwmAmgGMS6sxkxC4NSF5jW3aUKHYA/qWL7H6F1FDSY4IBOETUpvhnc?=
 =?us-ascii?Q?Frc4EdDKLs6gWXH5FSLdO1sLuCO+TiSwUSWg2dDIRAUUQK2GQE/9/cZSxcr8?=
 =?us-ascii?Q?+Florzy8HOGWVFK0n4CFiSxGomXn/k9X8HaDWrLfyI4Hg3B0Kzh3m1nsaGYG?=
 =?us-ascii?Q?Pp7U71WgJ0cIJrcFFPAZ1ZUFGftqmXzMFS5/PzvWX+B49yFDtJljVenREn0c?=
 =?us-ascii?Q?hEb1lRoMBTVWa8GQYxGHLKN5GMFpLAN2nuMKfbNsXEWTY1FSLwfdf/61qRyf?=
 =?us-ascii?Q?eRxkPxLHWFK+n1KYHfwNXhYTYuKa3cDZ0myb9wA9qFQtN6oGpAnu0kQ9SlB1?=
 =?us-ascii?Q?ClsVTLAmhDY9xmXgPbNyfweAVclyPnULwazGOUtNkVu8Bd3sLaw6cWHWxs08?=
 =?us-ascii?Q?7RFiyflJ2q7k07GX+cNVN70l2WV+ultWfD+B3fC8SQHBtQYp33yqx+FlcDlO?=
 =?us-ascii?Q?Vlq24MuSxYI+yJgEXmC+zAT5Boks0XHAdX7x9w+LvvxtynQrAp0NJtpU+PDD?=
 =?us-ascii?Q?1a3vE9cz0LKsgR+JgxvcGlRsYMvCT/a9E77CHptV1+LAZNXTisJ2bl7CspV8?=
 =?us-ascii?Q?Q4aqcRbVKU1nI1vFaYoGbVI6UMfzcCZdvhbw2N6EVhUWzuFasAeAa0qniqp+?=
 =?us-ascii?Q?xkA3srNNIqZzdE7IAR6oOkosoj4VYw345O6ZwAJ9PjR8GL4UWLtGci3/Ks9j?=
 =?us-ascii?Q?rafPWUfsqNCMJgBd0mg5tmzoqx0eBta4fOymlOhOekvzjdxlc6O/5K5o8vB8?=
 =?us-ascii?Q?JmMUmLYrkt8g/Ewg96fgRjSeCWgdiTtFpnCSwdnt1Hxov164Ip6YWRdhR3z5?=
 =?us-ascii?Q?z2cTfY8Pz7nPvgLoQSvt5TvjvLZ8lxwyodc8Vx7t4SSPcS0X+brW7wZuTDKB?=
 =?us-ascii?Q?Vo6hERTMwGVrOPPHA06QZbMOrGW8UXNHLJ5mSDy1?=
arc-seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ed0ebFAS1rRQKYhoSFIjDkJL0s6QWRx8JN2ma5Q+2ax0GA7c5k/P4nhprPJnVY907lryg/obUbuhJMCVkTEtL9DR+d/CXDkI9wFTboRpi3GsUKDf7rheLG5yjTtlm5L+jNGlD8mqVPo9MgZWLInndqhzPEWEaNz0fjrKa43xA8nvZReQeH72u8/u16AuJeTA31dr7udRO3h9MIOsIvTS7tl9jeITk8fGKhR8TiqUO60ueRyZWsINiboDjHCpePnAJ9oE57gigqwYMp9JZxqf3CWFOcGZRkCeYO+iZ0ymJnlEZh6DylARmZ7lkIWEHZr7hKdXT/c0NqKbTpxKw5ghNQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b91oXuoheMzDfvHCs2O6+LQ0J6zm1w1V+bKWk/m7FR8=;
 b=QpSv6N1pGOuJEfB1MbLkMJ2XTt0VM06zAMZZe1a5buQKCk3cz7etuI6y8jH+6siDn3N8z3ByE3iMxdU84TJd9nuNmQjsoXRh3lD3ekgGg97c7VigDHCA72ek43HwXPcF2c1JOqVr51XdKYGTT6MxlcC6FK2J2ADECstsSgZf1Furmw8RI+ibj8RGFcc4HyiZs6c0X9RPDY1hjhxA4cNP2q0vJXzPev/T58pYLYl0nmhL1UaJAZl06L/J+/1/swVv9m48ci49DGelec/lS4vMC05UwG48oQrEkh82baKguZnDJonSgXZWBHTsDM4y6H/+Pd6+Te02MgtKY9KAcw+B3A==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BL3PR11MB5747.namprd11.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 6b5075f9-fd46-4512-ae97-08ddc92408e0
x-ms-exchange-crosstenant-originalarrivaltime: 22 Jul 2025 13:31:16.1169 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: uwyWZO7srUCT0hK5VJiWtTHJGXP/Qnb+ALoa/Kvej/VvbAc14gv2Ip//K/1Yi0vlDFofGhC1laKTQZNOGKpjSWuokPQJB+3ImEujlifWlhE=
x-ms-exchange-transport-crosstenantheadersstamped: DS0PR11MB7442
x-originatororg: intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Priyanka,


>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>priyanka.dandamudi@intel.com
>Sent: Wednesday, July 16, 2025 5:23 PM
>To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; igt-
>dev@lists.freedesktop.org
>Subject: [PATCH i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under mem=
ory
>pressure
>
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Add a test which create buffer objects on an LR vm and vm_binding buffer o=
bjects
>in a loop until it reaches OOM.
>This is to check that buffer objects on a single vm doesnot get evicted an=
d instead
>report with ENOMEM in non fault mode.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Test looks good, could be good start to test Out of Memory. However In feel=
 few subtests can be included like testing exhaustion of system memory,
OOM with different buffer sizes, may be a concurrent allocations can be som=
ething like testing OOM conditions under concurrent allocations from multip=
le processes or threads.

>---
> tests/intel/xe_vm.c | 65 +++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 65 insertions(+)
>
>diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c index
>c1abb08bb..e808a0b4e 100644
>--- a/tests/intel/xe_vm.c
>+++ b/tests/intel/xe_vm.c
>@@ -2368,6 +2368,65 @@ static void invalid_vm_id(int fd)
>       do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);  }
>
>+/**
>+ * SUBTEST: out-of-memory
>+ * Description: Test if vm_bind ioctl results in oom
>+ * when creating and vm_binding buffer objects on an LR vm beyond availab=
le
>visible vram size.
>+ * Functionality: oom
>+ * Test category: functionality test
>+ */
>+static void test_oom(int fd)
>+{
>+#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull #define BO_SIZE
>+xe_bb_size(fd, SZ_512M) #define MAX_BUFS (int)(xe_visible_vram_size(fd,
>+0) / BO_SIZE)
>+      uint64_t addr =3D 0x1a0000;
>+      uint64_t vm_sync;
>+      uint32_t bo[MAX_BUFS + 1];
>+      uint32_t *data[MAX_BUFS + 1];
>+      uint32_t vm;
>+      struct drm_xe_sync sync[1] =3D {
>+              { .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
>DRM_XE_SYNC_FLAG_SIGNAL,
>+                .timeline_value =3D USER_FENCE_VALUE },
>+      };
>+      size_t bo_size =3D BO_SIZE;
>+      int total_bufs =3D MAX_BUFS;
>+
>+      vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>+      for (int iter =3D 0; iter <=3D total_bufs; iter++) {
>+              bo[iter] =3D xe_bo_create(fd, 0, bo_size,
>+                                      vram_if_possible(fd, 0),
>+
>       DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>+
>       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>+
>+              sync[0].addr =3D to_user_pointer(&vm_sync);
>+              if (iter < total_bufs)
>+                      xe_vm_bind_async(fd, vm, 0, bo[iter], 0,
>+                                       addr + bo_size * iter, bo_size, sy=
nc, 1);
>+              else {
>+                      igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo[iter], 0,
>+                                                 addr + bo_size * iter, b=
o_size,
>+                                                 DRM_XE_VM_BIND_OP_MAP,
>0, sync, 1, 0,
>+                                                 DEFAULT_PAT_INDEX, 0), -
>ENOMEM);
>+                      break;
Line space can be removed, Please check indentations.
Rest your code looks good to me.
Acked-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>+
>+              }
>+              xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>NSEC_PER_SEC);
>+              vm_sync =3D 0;
>+              data[iter] =3D xe_bo_map(fd, bo[iter], bo_size);
>+              memset(data[iter], 0, bo_size);
>+      }
>+
>+      for (int iter =3D 0; iter < total_bufs; iter++) {
>+              sync[0].addr =3D to_user_pointer(&vm_sync);
>+              xe_vm_unbind_async(fd, vm, 0, 0, addr + bo_size * iter, bo_=
size,
>+                                 sync, 1);
>+              xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>NSEC_PER_SEC);
>+              munmap(data[iter], bo_size);
>+              gem_close(fd, bo[iter]);
>+      }
>+}
>+
> igt_main
> {
>       struct drm_xe_engine_class_instance *hwe, *hwe_non_copy =3D NULL;
>@@ -2759,6 +2818,12 @@ igt_main
>       igt_subtest("invalid-vm-id")
>               invalid_vm_id(fd);
>
>+      igt_subtest("out-of-memory") {
>+              igt_require(xe_has_vram(fd));
>+              igt_assert(xe_visible_vram_size(fd, 0));
>+              test_oom(fd);
>+      }
>+
>       igt_fixture
>               drm_close_driver(fd);
> }
>--
>2.34.1

