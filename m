Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1E9C2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 05:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF01310E106;
	Mon,  5 Jan 2026 05:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7I3STYP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19EC10E106
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 05:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767589952; x=1799125952;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1LGHQtS+o8MO5rKA759T+K4bvO25qGDDbyDEc2CzU0w=;
 b=e7I3STYPNOjq7ehIwMkuwm0gUpj7EmTFrBb6uJChkHS3KJUvFYWHoL8K
 Eetmmg8jMFX7fwQPUnduAhP3mvh9k8Tpx8sUKcIcnpr+SjpAPp6Z8Aw8e
 ycnaUjNxa8JyB7Qv8atSBVQKHZoDZMhJKGJTF0Yw9+PL4aOlcGZ4wk07R
 BFrWW1j69yRpiKhiocpqR4Uw38diBdBkMW5IvLfZwWvsk0FMnL/7btwD7
 K0y3K78bW9uKdnKAMYqyN6tON6fJp1z5BPm2ifmBNyvoSL2sjK5/3bxhm
 A5bLOPt/4vHaZzRoghZo8ocAYnGomVCt8yvmBJesIu1O2QAtlJTg9ZqwG A==;
X-CSE-ConnectionGUID: +ALuzqziSJewzN+Rf7pHIQ==
X-CSE-MsgGUID: 95S69GMgSbSYEhWbS8jaPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79589001"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="79589001"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:12:25 -0800
X-CSE-ConnectionGUID: xQsyHeHjRHS+VcCHnF2FsA==
X-CSE-MsgGUID: SipCvvBrRr+0Q6hl3qWECw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202326944"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:12:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:12:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 21:12:24 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:12:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlSya7da2J4K69pOUdIDe5Vlzy52URnOrdfHgKs/3O2FxK36OJun6noDR2C+Nz3GjL0UwDX1Bkg/mGOWtQ/70UR5plalBeLXi3b0fZTFVTCxDI8VauK8/31LDI3StPXZIgHT2yMFCIlhSKHYQDceLSGBbZlWbIUCOt1vfW63aOI8rG+xjiQRcpD5EhEhEq84Y+tHi7ICylFJHqmXdjw5d0vNedJpGnd68m70EACoqsJhocDf4LmDLv4nxNtV9p/ID1dC3cGVGe+qcWihB7GSmwpAYM2pAUs4H0pOCgfFfFFTL5iHj0Yw93sWtyjRXEzhbtsIoRiByHeEm3GgfbnTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlJ0ZUIbOQtoYXUF0vBUWKcax1u5DujtCZ9LYhiU170=;
 b=x4vHp0hxo5vUclD51BEY+RW8K4q9ZbPaU2jar/j7KOS5lGpP3PG0aWO7f1J4E96BXO5+8gEz0xAy6OmUJiyCckBFl5K3/rf+7PVcsB+5jnqTOvvnc9P7QGelUTbduJnFhE6YSW013LtfbMWHJ0xEz0XXD3xsDQLX5KcwSwx3CfnK2tZSFubE/CUHYhVKcrLQcXluD4+mUt2Mr6hf4vufd2iYhPdgvlIMlv+NQdP6n9f2KU+k/x29DTtdHkAsyM//4dC7cpIXB69IBHQ2L4fi9huc4Rx4huxLPly+Kx8X7N+LYnotXCjiZdWOF+sgmagQN2f/3qmWO6djuTRHqwp2pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by BY1PR11MB8127.namprd11.prod.outlook.com
 (2603:10b6:a03:531::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 05:12:22 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 05:12:21 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t v7 3/6] tools/intel_hdcp: Interactive keypress
 thread for menu
Thread-Topic: [PATCH i-g-t v7 3/6] tools/intel_hdcp: Interactive keypress
 thread for menu
Thread-Index: AQHce66Knx6zXeBnbEK258dJOLrp17VDCoOw
Date: Mon, 5 Jan 2026 05:12:21 +0000
Message-ID: <DM3PPF208195D8D0042FF9FCA3C5DEFFDBFE386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
 <20260102060835.89725-4-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260102060835.89725-4-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|BY1PR11MB8127:EE_
x-ms-office365-filtering-correlation-id: 12bc2e19-4f1e-422f-aaed-08de4c1901a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?g8VkaSMLFDCppWqxUekaTD5wm+3AwLTf+xN5yHZsvULd9XRE7zyxaYHOBJr3?=
 =?us-ascii?Q?b90km7kEzbe/2G9/s1AEHVkR5rx9j6KUK1DVIdBx+p6d7dlZOHbyZ8UtqWsp?=
 =?us-ascii?Q?yx1CBAzR2egEOr2w3RyGnVh5kz7ULpa0DUlBXrUQEwIc4UM2zTyekmvf/t9Y?=
 =?us-ascii?Q?fVOYEd8Y7Cs/keJUi2hoNzAGZaSnGQUZGfHGDaVZ5/MRXZW94sXm2a67QI3S?=
 =?us-ascii?Q?VOU4w/TZO0q30CpAGesV5+d4FByOkPInnYZa4seexk9Np55egMypim7zb1JS?=
 =?us-ascii?Q?aLxga7odkuOHM2F9DVZ6xkQGEx+IOerYMEvnAakxCNpDVWvaEgZdHWZs+dL9?=
 =?us-ascii?Q?cSP2Oc2M8tHusm9BrxxqHgFb4+goZNx8u1Z6oUy7huyIXbza3TtG7/DIj1r4?=
 =?us-ascii?Q?ZGKODbTTWxSOhRCXJ86/AcOEHtu1o/k4PyyXSc6/QE8J0GaSIsNm4SStfsCp?=
 =?us-ascii?Q?GWfzu4AaycAoft8ufMkDTY79ayd7IMl6iN5viaG6DR0Jge0bUquhBrArhibF?=
 =?us-ascii?Q?Z4AMB7hZlLfQ0rF795+7DOPSaa1ER+n3m5PSa6PL773ooL5ZBOrBih36WKc9?=
 =?us-ascii?Q?80PE08R0oY06aO3ylkYqzxODtmFxRElcph4uCiM3ekItjnK3hLqXA4qv5A5h?=
 =?us-ascii?Q?eTQCXWlzxby0rM+QutvjwbNxEPQjqpt8MG+Vh1YtlshqNutkLa0fLF4zIM87?=
 =?us-ascii?Q?VVn8BJCrENcz+3EhHWqU/eqib1pt/Nwnpsqf31Lu7lz6EWVEP9Hv26TdzcW3?=
 =?us-ascii?Q?Jd6Um/rC2LwwsoIqvPFGdyf0i474NNN86P6dvEZoAEJtVbeMI/WQwqCdP690?=
 =?us-ascii?Q?WSX6Wxykcaa/f9kiHk6JRU3six5H/mmvnPpsn83mnabEIrYqfkxZoUofM1+x?=
 =?us-ascii?Q?kii1K9nnWbaIZSKkA4tt+a42JMUQBD52HQIwc1EiMf0uw/xqva4/nO2e952D?=
 =?us-ascii?Q?eZD0UBI6hVr9llGsnE5n+xdyZSDNvogMecyo5mUOZXUqTGQbYeaTWx7fIQS6?=
 =?us-ascii?Q?LK4URElg8j95xbc7KvEDw6fIh9mUU1k7zfFYDRgBXMjGiciuQdyTcPC/Q7Ut?=
 =?us-ascii?Q?kKZr2iuiJaM4xmOjGpXmlkuCx9gQk+8myFR8p3hydwyCDnWQdbZsYQWC53Wg?=
 =?us-ascii?Q?7tQTHyO4MMVdxCXWBErlBLtARXvOo9R3cDTdk0RLoKM4KO/ZElhRGbOewaCn?=
 =?us-ascii?Q?wzBLtk9iAyDj/8IvoPh+aMmyDLEY/XAUoXEyse1am1wvYFniYgPQUnec/RyB?=
 =?us-ascii?Q?Zjp1l/DRvZGJ9dnVDCeuUK2XHeX6ayzrCUltbmQMo/FPkyUbb54ufw2JYfYY?=
 =?us-ascii?Q?bIdxLBEhYeGmFT/CnwKZn8oaEv4jOEs5Sp43pPZOpO6knwDXJuG6/cTkog9h?=
 =?us-ascii?Q?/Je3jFcO0va1ctaUjuShAVVDDIqipMn6d27eWYaS9j/3EswXiniGxBfBtsk0?=
 =?us-ascii?Q?XdFLOqbUwJxQUA6yYWC+f9jv8gEq5PigiWzL9Bcw2G4f6lbLDE1x5j9xpz4t?=
 =?us-ascii?Q?hWkOvpF59lzw05MDhfYWWDOh2vgeMOW9sE1G?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dCBeNaII0GQGq2LihL3aw7TyV7vyB8OBxlnjzToQUUX88jJWauUluAgRnRO4?=
 =?us-ascii?Q?6PIp35/hiiyIWlzQ6Lkw6+6STQJTSBL2drLYYuooBM1I76FxtV8Ixx3IvKRC?=
 =?us-ascii?Q?GC9NFVCT4w5dgQkAePFGAVXenfHS/gVck4Zjx07Zxu5zRMIBBH0A0ZcEGcal?=
 =?us-ascii?Q?eTkBVI28fOkAXPPv0rm9lJrjBG5fLz7kn12Hj6glR4SAVMOCBPkKjG2fgn5o?=
 =?us-ascii?Q?uYljqx65cTz1R/LO82yPf+CaQIdp3/lOCEc328l7L5o1YfC1d8kptYpptegh?=
 =?us-ascii?Q?xqK00E7KvwOFnqYaz+WbGTfLqF250rcWkIVl4aRqmoT5+rY/ObxhgMmjl2nA?=
 =?us-ascii?Q?pez2KLQW4rolIDBOfmKMYnb7T0aTT3K4g4CTEmZH7jctsCkQbRxSFyWr5pVp?=
 =?us-ascii?Q?/eWemzTRliqDyr138OLgLYImN3R+G78/OsJQ3iYyYLsbFsuKuFZFnf6P2OQQ?=
 =?us-ascii?Q?M8E7y/B/zeuheS0Vik0E3uNf1SV8uyw3btY9fi1uKcjB9NDKo14FBpgb6iu5?=
 =?us-ascii?Q?HTPseXXNIh8j/ufFtLVpbYkmOj2kf5afEWwtpQ3d5BPR48l52n0guhV//rwi?=
 =?us-ascii?Q?ZvHNIeGyf5nwtjRyC7fQhnz9EoGtUuRSQbpPisXLd/5c884DpSzwkDpLnES/?=
 =?us-ascii?Q?Oey+QJzempTMwmwmLxSud03FF8JfmNQrY+Jvr1lD0e93RBBgXCROZba0ZSEV?=
 =?us-ascii?Q?b67pt8DvC32/8ImLJa9omVyep6q1i8vOmu210yxS/qtsMRgEKqRhPP7kkzUZ?=
 =?us-ascii?Q?bBfafXQEKsJ7KhD6MGU+u1lKRFtpZlq85N1jrl0XsiseDHqeG1QwjFNSHdbk?=
 =?us-ascii?Q?gdI1Yyc+wNcBfwhTTGgi1RvX2557ZXxIJ2LmzqwHOZNLzxuy275++/1RL5fF?=
 =?us-ascii?Q?HZwtgE3fexUmiqNuXxVJXnhCkPUpbHz7iRnnnmYYuYc4aI+Ca5C6sXnOXi+d?=
 =?us-ascii?Q?fV28ra5fNe9FKQBEWJiKtMF0fMuL7o6wkm+b8VW6OXkdD9Iia3qW7xsQYGsm?=
 =?us-ascii?Q?OEYQx13H1MB1MdAEdgnnLkdtK4J3caGAqzTB3ePdmthAXaSvEh6nIjXaSV8W?=
 =?us-ascii?Q?VBcWwbGrtmc7akMsdwWDFvJkKejixPg4vvKqtofSvkvuL5q3GMPWx/SvxrUL?=
 =?us-ascii?Q?PkB0nx6CJPam6txC1aHmyJXo7eCbPPp6LGMmanYf5lj300krLpXPs6aY8eSE?=
 =?us-ascii?Q?jBEg8tVeu4qpUnIzhK5da5gBeHPTIdfY4GiPzBpbbaP7aPPhHW0K6VTcmVLK?=
 =?us-ascii?Q?XYCtIzrNXsWfoXl47OgN4WoNnAdS/qkDHAFMAwmUcwuVZFdDBLGwsuH3Moq7?=
 =?us-ascii?Q?eGfcmWvma33Etl3veLrsRfwIUCw5cL+ph7gSSHYvs+AwtOzcvKECa7//y+2X?=
 =?us-ascii?Q?q04xzrjQIzpojj+YM1yy9yOOIeoyPmp0C5W58l1qMKK4c0lLKYhM93ULYaEM?=
 =?us-ascii?Q?csEFBBBfcb839b4UM3rg56grxeIW4aPUK82xeWvdd+EvovaAFgLgZeM+vVB7?=
 =?us-ascii?Q?WJJ9YQ82gGJTKIF0zZJ8LWgTkAzCkGUaEcvpmDIi7o7acsN6R1sALUG5GZ0l?=
 =?us-ascii?Q?IlpeMHk+H3mPCcrYMzZQ3GZ1ZfbdAQiHPKvElxCPEC1U6QaePLm/JurXdSqG?=
 =?us-ascii?Q?R+pqONR9bZfYkjiOeQW522WY8obrf3TLf1IusP8FyhQ38AaLOjHmIGC8fYOL?=
 =?us-ascii?Q?oqzEXspJrucZ8+NdqenKTAb105/6tpXsEVpS5agYGTK/LUDmqR0jeHTfUndf?=
 =?us-ascii?Q?yY4Ev8lv/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bc2e19-4f1e-422f-aaed-08de4c1901a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 05:12:21.8407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31oS81Gi7cHB7Rz6wCpmAEAqKNX/jQX4mdzZSq3WnPtudFm4xIcCpz/j/5PRi2vRpuLiXiE9j8IP3wvIdap1CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
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

> Subject: [PATCH i-g-t v7 3/6] tools/intel_hdcp: Interactive keypress thre=
ad for
> menu
>=20
> Handle user input asynchronously with keypress_thread ,enable interactive
> HDCP via user options.
> Update print_menu to display available actions.
>=20
> v2: Handle invalid user input like choosing an invalid connector or non H=
DCP
> supported output
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 161
> +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 155 insertions(+), 6 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> 129968b7a..9cfbc0576 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -5,6 +5,7 @@
>=20
>  #include <fcntl.h>
>  #include <stdio.h>
> +#include <ctype.h>
>=20
>  #include "igt.h"
>=20
> @@ -29,6 +30,11 @@ typedef struct data {
>  	igt_output_t *output;
>  	enum pipe pipe;
>  	enum hdcp_type hdcp_type;
> +	int user_cmd;
> +	bool running;
> +	pthread_mutex_t lock;
> +	pthread_t video_tid;
> +	int selected_connector;
>  } data_t;
>=20
>  static void set_hdcp_prop(data_t *data, int property, int type, int
> connector_id) @@ -184,12 +190,156 @@ static void get_hdcp_info(data_t
> *data)
>  	drmModeFreeResources(res);
>  }
>=20
> -static void print_usage(void)
> +static void print_menu(void)
>  {
> -	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
> -	fprintf(stderr, "Options:\n");
> -	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
> -	fprintf(stderr, "-h,	--help		Display this help
> message\n");
> +	printf("\n=3D=3D=3D HDCP Tool =3D=3D=3D\n");
> +	printf("1. Get HDCP Information\n");
> +	printf("2. Enable HDCP1.4 on connector\n");
> +	printf("3. Enable HDCP2.2 Type 0 on connector\n");
> +	printf("4. Enable HDCP2.2 Type 1 on connector\n");
> +	printf("5. Disable HDCP on connector\n");
> +	printf("q. Quit\n");
> +}

I believe this code is very short live as in it gets deleted in patch 5 whe=
n you add the menu lines array
I think its better to introduce menu lines and loop to print the menu in th=
is patch itself.


> +
> +static void *keypress_thread(void *arg) {
> +	data_t *data =3D (data_t *)arg;
> +	char input[256], choice;
> +	char *p, *rest, *q;
> +	bool tail_ok;
> +	char *output_name;
> +	const char *hdcp_support;
> +	drmModeConnector *connector;
> +
> +	print_menu();
> +	while (data->running) {
> +		tail_ok =3D true;
> +		printf("Enter input 1-5 or q: ");
> +		fflush(stdout);
> +
> +		if (!fgets(input, sizeof(input), stdin)) {
> +			printf("\nExiting...\n");
> +			break;
> +		}
> +
> +		/* Trim leading whitespace */
> +		p =3D input;
> +		while (*p && isspace((unsigned char)*p))
> +			p++;
> +
> +		/* Find first non-space and ensure rest is only
> whitespace/newline */
> +		if (*p =3D=3D '\0')
> +			continue;
> +
> +		choice =3D *p;
> +		rest =3D p + 1;
> +		while (*rest) {
> +			if (!isspace((unsigned char)*rest) && *rest !=3D '\0') {
> +				tail_ok =3D false;
> +				break;
> +			}
> +			rest++;
> +		}
> +
> +		pthread_mutex_lock(&data->lock);
> +		if (!tail_ok) {
> +			fprintf(stderr, "Invalid input format\n");
> +			pthread_mutex_unlock(&data->lock);
> +			continue;
> +		}
> +
> +		if (choice =3D=3D 'q' || choice =3D=3D 'Q') {
> +			data->running =3D false;
> +			pthread_mutex_unlock(&data->lock);
> +			continue;
> +		}
> +
> +		if (choice >=3D '1' && choice <=3D '5') {
> +			data->user_cmd =3D choice - '0';
> +			/* connector id validated below */
> +			if (data->user_cmd >=3D 2 && data->user_cmd <=3D 5 &&
> +			    data->selected_connector =3D=3D -1) {
> +				int cid =3D -1;
> +				bool valid =3D false;
> +
> +				while (!valid && data->running) {
> +					printf("Enter connector id, blank to
> cancel): ");
> +					fflush(stdout);
> +					if (!fgets(input, sizeof(input), stdin)) {
> +						fprintf(stderr, "No input;
> aborting action\n");
> +						data->user_cmd =3D 0;
> +						break;
> +					}
> +
> +					/* blank line -> cancel */
> +					q =3D input;
> +					while (*q && isspace((unsigned
> char)*q))
> +						q++;
> +
> +					if (*q =3D=3D '\0' || *q =3D=3D '\n') {
> +						fprintf(stderr, "Cancelled
> connector selection\n");
> +						data->user_cmd =3D 0;
> +						break;
> +					}
> +
> +					if (sscanf(input, "%d", &cid) !=3D 1) {
> +						fprintf(stderr, "Invalid
> number; try again\n");
> +						continue;
> +					}
> +
> +					connector =3D
> drmModeGetConnectorCurrent(data->fd, cid);
> +					if (!connector) {
> +						fprintf(stderr, "Connector %d
> not found\n", cid);
> +						get_hdcp_info(data);
> +						data->selected_connector =3D -
> 1;
> +						continue;
> +					}
> +
> +					/* Validate connector is connected
> and has encoder */
> +					if (connector->connection !=3D
> DRM_MODE_CONNECTED) {
> +						fprintf(stderr, "Connector %d
> not found\n", cid);
> +
> 	drmModeFreeConnector(connector);
> +						get_hdcp_info(data);
> +						data->selected_connector =3D -
> 1;
> +						continue;
> +					}
> +
> +					if (connector->encoder_id =3D=3D 0) {
> +						fprintf(stderr, "%d has no
> encoder\n", cid);
> +
> 	drmModeFreeConnector(connector);
> +						get_hdcp_info(data);
> +						data->selected_connector =3D -
> 1;
> +						continue;
> +					}
> +
> +					/* Check if connector supports HDCP
> */
> +					asprintf(&output_name, "%s-%d",
> +
> kmstest_connector_type_str(connector->connector_type),
> +						 connector-
> >connector_type_id);
> +					hdcp_support =3D
> get_hdcp_version(data->fd, output_name);
> +					free(output_name);
> +
> +					if (!hdcp_support ||
> +					     strcmp(hdcp_support, "No HDCP
> support") =3D=3D 0) {
> +						fprintf(stderr, "%d does not
> support HDCP\n", cid);
> +
> 	drmModeFreeConnector(connector);
> +						get_hdcp_info(data);
> +						data->selected_connector =3D -
> 1;
> +						continue;
> +					}
> +
> +					drmModeFreeConnector(connector);
> +					data->selected_connector =3D cid;
> +					valid =3D true;
> +					printf("Using connector: %d\n", data-
> >selected_connector);

I believe what you are doing here is asking for the connector id from user =
then verifying if the connector is valid or not
And has HDCP capability . Why not just display valid connector id's that ar=
e HDCP capable and then only verify if the correct
Option was chosen by the user ?

Regards,
Suraj Kandpal

> +				}
> +			}
> +		} else {
> +			fprintf(stderr, "Invalid choice: %c\n", choice);
> +		}
> +		pthread_mutex_unlock(&data->lock);
> +	}
> +	return NULL;
>  }
>=20
>  static void test_init(data_t *data)
> @@ -251,7 +401,6 @@ int main(int argc, char **argv)
>  			break;
>  		case 'h':
>  		default:
> -			print_usage();
>  			break;
>  		}
>  	}
> --
> 2.34.1

