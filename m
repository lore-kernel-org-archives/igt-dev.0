Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3C3C3ABAC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 12:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C2610E685;
	Tue,  6 May 2025 12:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlKZg+Kb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E5A10E685
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746535910; x=1778071910;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ughq0IQtxJlnOb58QJiWhSeGCNQMVrRumG8ogSUZSv8=;
 b=TlKZg+Kbt3eH5GPM4EljCcB1G9LRfQ8GyMY271bx/skLuUF9Fu0sKcm1
 XHtQti4AX/ou1tys2LTrIQ11/drLrfms5gKOJSlOHUYlEhZHuUixD3DZI
 +W5xQPIhZ/Cn8txJ6A6o8+JPFrrLuGGokpYjV8r3Xiu1GJADZzB7v1XkF
 DwHEi1H3GUXUxJy1WVhWiblZ7jlTZzzADPl8BDhRWBb3GgU66u/Iecfij
 12PSkufI6jkP+DmzFcXa9SNQGpuQnCZ1rQXS2esI/1b3B+jnWZQ5yvg6+
 2TZZjcWGtsxL7EDTuFeCITg2MPaskEJCVTdFPMRXiLY5VvzprSzadCn/Y g==;
X-CSE-ConnectionGUID: I629v8GZSbqtsOQnXvkvtA==
X-CSE-MsgGUID: XsnRHUfSSSyDoUcBAY8kGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48329668"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="48329668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 05:51:49 -0700
X-CSE-ConnectionGUID: DsKaJBFyST6WkrTGRpo44Q==
X-CSE-MsgGUID: aXQJX1/wRoSHudxl9LbPzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="140369980"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 05:51:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 05:51:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 05:51:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 05:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpKZp+o3Sf26a2ZSSvZOTagxiLeYcIKXpVVNFoVSmnNv+VT2X0ffMI9wZo2e7Jo9R8128dmxrH4nhx6QyLGo4CizxJZ99ZBLVdpsQ+lEtz9kn5P5M1jB9LjGrjriuvNiqdHoaEvACyTo/9tuDfZMXgYwKrtXgPFkTRhs2MuZwIU2mid/pi+GBhUswP6ddbr51QP35ShCXJKWpslh7F05/9tve13Vz+HDgswqaVdi/z5k2zJ9kagUTZCQyz5GRz2Lob8RO57iX2oZz/VIOj4ZPoP8WhzMZTycOeDT8u2QIlrrZtkRL66P2PT4beszY9HZUP++uucEM9sJ0HABj6ycrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBo9BOKflIjCxMqXQp33wHnmc4evp73n0aZR0DpvS6c=;
 b=zEFvRFGcMF4b0dlnxrBQq7+/Idr1HCKhgJS3D/ourOwsPVRcKJxOYOKMdZx/0VRTGiTl/oz2aOcI3Ft4xezsOh/417ZtHADWkV/1fR83XwNUhHR+OCJUqF3h04Qv4MD1EVauujxe82RxWVO0BvlNvbmQFYlYKixGrMkX76B5dsADY5+XKA02Jrmv06g6IFFwK0zZR7TZoqrh720BJ7b1+naJEqOY2ao1URAEUwq4UDHZjEhQnRveJkWuLkca1QCqPsu2AoDXCEgpHdBKkiWPhX+Z/sBK6ZCHZNL8gQzLE0KzG0cugW6g34xvgMuPM/uV2aQBLlfojRrFIsukoZ/K+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 12:51:27 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%7]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 12:51:27 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_pmu: Unprovision VFs on cleanup
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_pmu: Unprovision VFs on cleanup
Thread-Index: AQHbvm/tZmZR87iNo0SxmpP93CRQELPFje3Q
Date: Tue, 6 May 2025 12:51:27 +0000
Message-ID: <LV3PR11MB86959312120282B055C39F93F989A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250506101554.629218-1-marcin.bernatowicz@linux.intel.com>
 <20250506101554.629218-2-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250506101554.629218-2-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|DS0PR11MB8665:EE_
x-ms-office365-filtering-correlation-id: 5d55da2b-299a-41b6-ce1d-08dd8c9cb74e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?C7ebBOfMozxMJOIqIVGks1qLT1MkW4/amQHIYKTR+0MUFnW005U4x3Y0vzqS?=
 =?us-ascii?Q?P9E1QEXKTmsyWtKX8AwYIexpcq8YGfmceUTFQpO4ZquK5VuukUgVDiKBEWHl?=
 =?us-ascii?Q?9wdknkTtgQ8ReqteeQ0KkkSfGM8IgBxzV0ZyxE5RIUdjM1bm2FCQK/5yAho5?=
 =?us-ascii?Q?kigcsZM8zNj8/QCt0g56xsHkWgVcpSaql8G4w6gW6b7dZqWlT+V/YIPP9Hvy?=
 =?us-ascii?Q?Y+vL7pSnOATsoCkFJr7zH0ou/sml+llosclhGElTI48A0KHkZidBkXfXV1/k?=
 =?us-ascii?Q?AUkywOubBrvBRjn7fPFN+J7iuyMCD1XX5GIc4rkW/agvhoyXQMWtiDdUSGu8?=
 =?us-ascii?Q?f+yVqCCljZwPXeTqE1lBLCUahCjlz7q80GA8hfpXPs96qLPjMB9/KYYrKyWH?=
 =?us-ascii?Q?F9mEND2hwBEEca8nemX/TTmwT1xhGHtAXarJokZ7M5goxCzhDUI8TMS2Ayr9?=
 =?us-ascii?Q?+kJ1b/hl5H+/nh0BpTgTgpbvZwQl7D43SKlwWGsYl+V2yH50HaSXRJrExaXS?=
 =?us-ascii?Q?H+EPjnPN02Fofr8yhyZGVFeGNmxTYjH3CUnCqnk4OVLK5oL18uftSm6BfiKe?=
 =?us-ascii?Q?4FHoSA7oR0h5qYWfr2sSk9YUXE3R90Znr8gBHMN2VM/QvTm5P8cDAloafHDd?=
 =?us-ascii?Q?85YkcF8I4Y67ji1njaYAQhWeHql/j8LNI11DSZqteIXmryUaFJTiSGGRklJ8?=
 =?us-ascii?Q?W+EU8hxAvetkd22zA8T2Y6k5Wh1tsq9laM1cAf5Kk8rO2GLiEvMNsQPGDOdD?=
 =?us-ascii?Q?cSmsczFw3vOv+AGaufLKuaPjXvVe+oIv4Dv6gmv0DBQXMpt3J2beu+zLu3Sp?=
 =?us-ascii?Q?ODIMAP6zB8unzmAViZCzJZqOaP624G27pwJBBPwUclrS57zlmFKiarl+iKua?=
 =?us-ascii?Q?KqVj1HgHibR92qd+vEQDTuaNszH8KkBJS1Yf2KmCmFLRXcxihSiLIrq7UuzV?=
 =?us-ascii?Q?gUiJz8FvJqHnRUvthqNWEt6Gsc713gvKZXrvX2Jg03gHoPMXy7LaK5hb4RcO?=
 =?us-ascii?Q?hXiz9/gVT/sO2aqOywmWv0iVXNCivlor6cK0zefMqZaW96Sy5PkE07Pmqcrs?=
 =?us-ascii?Q?ff/+th8j+r+sB4MsHgJW+RZyVbf+AvHZ401zmsM43w/SpCXWMHQHBhWnhYYx?=
 =?us-ascii?Q?P7sPM3g/O4Iwfo4X/tKfz6AbJxpu30oc4kUVhIhfg/qg3BfpuqJkMQPzyihF?=
 =?us-ascii?Q?scs7mi3lkfCHvGxP/nBCnXGhAGez6T+WKMVc/YOEftdxiVRUiOJiQzZN7Agy?=
 =?us-ascii?Q?iQNngHYxaPyRUTZ9wDch7Y49dyJcqUGpNY+H4XK2p1Sfjj4DO7RKZYYG/xE7?=
 =?us-ascii?Q?ptGLH76RHW6JAdTj38P0+xj9qnNxMndnivUJjgNdTybzaXapVMsWOwh0J1yi?=
 =?us-ascii?Q?WWY0Qtulrb/lkg+LGU+HrBCPOi7bqAe1CUZp/ARUZDgKerxnscr6qO9GUhlK?=
 =?us-ascii?Q?EpPscvuXuO+qJrc6hBMBwKv7h6eYFxAuKEuNDvMSzfyU835zEuedhZUidYTG?=
 =?us-ascii?Q?ZIn2YJVvqdxXTqo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kNHkyUkpvS52rmDCS6KJBdctGKNUJAVW3+hkhUnlWR6U0C3Q7DmuQz7F7viG?=
 =?us-ascii?Q?qJ27oLuJQi1Th9AR/PZDLchluHgg0pT6xM771NriMPD4cw0aMThIsXchDyl5?=
 =?us-ascii?Q?6k1arNJSG8W1kpB1kIoTqWfcqYdlj3mq8nYm8z8k3WlEPQyd3p5++KUsSxyk?=
 =?us-ascii?Q?zowX5RgZxxvuWjGTfmdCQa05mEHPnTfWKq6RrrcKMb4d5r/doSFqAr1yz9vS?=
 =?us-ascii?Q?UN2B4iAxCbrJVysEqS8L2G7xSIYE60v+yBzFSEN2TjvKtaLPNr0gJBCWqGAS?=
 =?us-ascii?Q?Z2mCMCTELV/eqh9YMdGN0jOneXStqZiZq4Xxy0KRq9EXlTcnk0fj2MhOE3wT?=
 =?us-ascii?Q?OReCkwg51XjSz9ztFS8eXmcOz2+/cIsSW9D8taW4k3oEhnCWxQd8mKcjJGD3?=
 =?us-ascii?Q?Z+pYmn90dbdAsaBBKch95QnZb3KOS8CP/SHetplnmP4ZXOOARfpOhjkjKRk6?=
 =?us-ascii?Q?i0OoBGyJa3qnT1ITQ2sGuV5DueEtYsY04YBC6n8D4foch/JLlQHH3DSZVlb7?=
 =?us-ascii?Q?UtiWlaWkM4j8yzWPA/6PEh0xKyTmM1Jmy5SUw/W4EfFX0u+tiuYjCXp8ZfdM?=
 =?us-ascii?Q?V+oj2ku5mHv74gccEXmsuQ92UwXUZ0sV0FfNpjv8Lsw/sOhyNNJmcN8ZRGaO?=
 =?us-ascii?Q?8WdAYaD6xVK6n59Yfwyb1CkztjQ+7TFwWxzEwwjrgsnYPRM+a0txKNgd7oNw?=
 =?us-ascii?Q?2luqP2Nwx9Mgem42hWkq6yoMsWF54ltHyH9R3OAIUkMERKytWdenfRN2ovQ+?=
 =?us-ascii?Q?gPFLVc9v/AtFKuObyw1e4P1mUAkIDGGoXaCPqX9lJ6nmENVpedtGwzlWUhyZ?=
 =?us-ascii?Q?9RYC5mNsnAAr/pozBt9j1wk3Fy5pSfBPkwP0SvrlQVjhXHoawgsrpUPXlGKf?=
 =?us-ascii?Q?DW1shR4Sknnpg0SIPPMMTPG7HAibInNCxvVXUQDtlm62xcw5BJCIomAu13Ec?=
 =?us-ascii?Q?s7Sl5Drf18WOl3SjkSv8wGwYMgwROYpNbJ5Q3fr8foaCYn9prznnK4CqLLZa?=
 =?us-ascii?Q?njeitNaInHSuGXdJiGC86uHPMcB0WQCOJL709SAcqGOLTztr4lbGDFnrS4FD?=
 =?us-ascii?Q?i98LXxTCMhZrur61pn+EdUw+sVAnmCNpRCFDg0LBOKNQZsumXWYMz9ag4j4k?=
 =?us-ascii?Q?JLSNwrZjXc/mBLfE5ndB9muyg608R5FzcogD/0TSYj3/wJcqjXzVeVtJVs2W?=
 =?us-ascii?Q?vY0NRL2AHZDjy1TuUp382hxox4fLpi2Qi4VbRRgSEZ11ZmrLCASo3L8BCK+d?=
 =?us-ascii?Q?+9qahvPiQ/XsMPZB/oaW6ajMfhDSEKWH95v6u9eAGLJzTSYVQMChFz6eoXwL?=
 =?us-ascii?Q?wsItAm/nO6qP2PDFF3BlyXmCX70E1tVk7xf/GS6H6f5BKyaWhJBq5u3Z+RfO?=
 =?us-ascii?Q?d/+6GDGQWs65IR7u30VRkrHU/2108rhchy8K/8E8qXYkJ6fcaoKohheY1o/L?=
 =?us-ascii?Q?nfnYR5u6P1gtlyRYF4bhda4G5yCw+Z+zeJeySg0ItqqqOjqVj4cMJT+Es/Mg?=
 =?us-ascii?Q?tLJMoefrPtsFobwo7Wtnktiehq1yy7Ej05gYGwmsj42xjN6y8uUNgrUMBsMW?=
 =?us-ascii?Q?777s2pe1D5Fi56MlctN3CK6q2jh/Gc1/q9NrijbtNDp/OyW2uQ5/C/6cHHVL?=
 =?us-ascii?Q?oQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d55da2b-299a-41b6-ce1d-08dd8c9cb74e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 12:51:27.3994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h450LLVsJgFOeMbvu4GysoqRACLI0FbqRaT7P55j0RRmyhNmCe2AiyVhGOLfMCCCaDsx4vLO2AUTmDjpmUV+tu098oM7JUZNLteajvL+xm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8665
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

Hi.
> -----Original Message-----
> From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Sent: Tuesday, May 6, 2025 3:46 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>; Kolakowski,
> Jakub1 <jakub1.kolakowski@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/xe_pmu: Unprovision VFs on cleanup
>=20
> Unprovision VFs to ensure a clean state for subsequent tests.
> Rename disable_vfs() to unprovision_and_disable_vfs() to reflect the
> additional cleanup steps.
>=20
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/intel/xe_pmu.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 094dc0c6c..8cbbf6916 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -497,12 +497,15 @@ static unsigned int enable_and_provision_vfs(int
> fd)
>  	return num_vfs;
>  }
>=20
> -static void disable_vfs(int fd)
> +static void unprovision_and_disable_vfs(int fd)
>  {
> -	unsigned int gt;
> +	unsigned int gt, num_vfs =3D igt_sriov_get_enabled_vfs(fd);
>=20
> -	xe_for_each_gt(fd, gt)
> +	xe_for_each_gt(fd, gt) {
>  		xe_sriov_set_sched_if_idle(fd, gt, 0);
> +		for (int fn =3D 0; fn <=3D num_vfs; fn++)
> +			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
> +	}
>=20
Do we need to set exec quantum for VFs, when un-provisioning and disabling =
VFs?
Any specific reason for doing this?
-Satya.
>  	igt_sriov_disable_vfs(fd);
>  	/* abort to avoid execution of next tests with enabled VFs */
> @@ -596,7 +599,7 @@ igt_main
>  		}
>=20
>  		igt_fixture
> -			disable_vfs(fd);
> +			unprovision_and_disable_vfs(fd);
>  	}
>=20
>  	igt_subtest_group {
> --
> 2.31.1

