Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23AEC02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 07:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834DA10E7C4;
	Wed, 12 Feb 2025 07:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dz9S0n1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A253810E7C4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 07:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739344941; x=1770880941;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KhKnI6EHqLB/8o8aZhf5LtBb04Ja4csFwXlx2gTwjwo=;
 b=dz9S0n1n0gueys7zGZi94aROcx5cyFIAER8CWCLIUXZamD+YoZTFjIaz
 8dPSlXOWObqtgbLBcbXisY3OXO7GDqOBSAr1FsNEXXzO3B7QDbgjFS4S/
 6M+08wUXF8XU58B7dE2FCFT44We5DT3qPoIS1cNpIdfnpwnl8bro7bq0T
 qotmpT9uVoj5HZWjZAdhbNP1mvKgZ8cfeaoOMvX/MiEGk9KkEloz07YHj
 Deg/Mr1I3P6LR9wNvLaA+YdgdA8WoTxfrTFIYheAQs93wxuMsn7TdF3by
 UwH4uG2+KSoG9gEIEXnOkom050b6WyHTAMWUm7Wu4fJEspz+cFYzJMo1E g==;
X-CSE-ConnectionGUID: ioME7hCxTjO4EVsZ4Rs/JQ==
X-CSE-MsgGUID: wxHG/r2tSwuQk4jlzU70mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="51380867"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="51380867"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 23:22:20 -0800
X-CSE-ConnectionGUID: VZsyxs1CSki7LvbHQxHlTA==
X-CSE-MsgGUID: UMGq2cUKQZiXyE967B0A6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="112956473"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 23:22:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 23:22:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 23:22:09 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 23:22:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyludaJmXdQ4s6/Bf0KmzYX6UGadoPXOuUGDPSIGTgTvGOVBezxp4TiBxd29ZhpIuE6woV7uw/8oxwqGuon7jE1Y0vrmUjHToo99nDlBTheiHfHreEVIh8moSej+Dgw7fSYy4LZh5EojEGK91GEnbOTWuqFyJCUVxLjFSI92cy8Fu8QEJXE8daMy7RhZIIZNc7W2Qv0LOfHODtnkOmwuvlhZntLEiT5zNmQeSnijX+IE3EikhpP3zXwAlTZCFxpgCD7ngFZuF1R4Yr+0WobOX+i5XWyulYh/DahUxZf0qVUwyX+pc+zAt5WX8TLIIuULqfmxAeRqaLVy3iVIMct0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mndiGr9exkLjOZljSIBLoTyHYFCJKXl6fMI/OQe7Vsk=;
 b=A6aKz8zNb2RTuv7kfB/P7XHHkIVEg0b2D10lxS+sdiqNDdilFJkaF/TM5zU+GMDZdlh1B09QaA5fUKHpxcrsW/63U0UAsHgzKKZ6byklOt2IQdUFhnM8UWg4V6kNB8c47UpJH7hmgjriVeduF5/p1NMnGnqsoVgdEDjAFwdSGR/HL8Wci0KpYKNJ7HrKOCk/2aiMAKPGcaDB7HjuJgR+R9qffopcJcQkOLlKpEABUBQcjiyGEMseZ9iLxqBWqth8hQFxJJZAdDX7lXiWukF/y19gVYxVM8wpB6DaC+AR7tnVLcx08wCauYuy5ktvL5LeBz1w0sz7dZDIvH4smvDCPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.22; Wed, 12 Feb
 2025 07:21:59 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 07:21:59 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 0/3] tests/intel/kms_joiner: Add a new test to
 validate non-joiner mode
Thread-Topic: [PATCH i-g-t 0/3] tests/intel/kms_joiner: Add a new test to
 validate non-joiner mode
Thread-Index: AQHbfR6gfCaVQtFXzkSKGIYvFAITBbNDQ0cQ
Date: Wed, 12 Feb 2025 07:21:59 +0000
Message-ID: <DM4PR11MB63122D963E9BA5D80AC8A6CF90FC2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250212073604.1580120-1-jeevan.b@intel.com>
In-Reply-To: <20250212073604.1580120-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|BY1PR11MB7984:EE_
x-ms-office365-filtering-correlation-id: c4c124ea-c4ab-46ee-a337-08dd4b35f02e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ccqNh6UYprI31mYClneXQlPdAMcw3fgTCFOe7up7tO4pznHPSl4FH51TuzTr?=
 =?us-ascii?Q?nlVjAUo5cP8iRPnMVmHwabiDIOkP8TPu4A41BEzGnR5gGDr3z49U6LS1QORU?=
 =?us-ascii?Q?YO4fxlO/RfwdgdvyWnGccXpLAH1X08CcnaYCKgpwwh7fEff25JBwh4aS+5Cy?=
 =?us-ascii?Q?ul0s/4QwrZdwPoo0pbH5qLJM9ZDxdBd8GplJ30Hpn4IwAKDAz3vPgp6alEF/?=
 =?us-ascii?Q?rNb9jyGrWijBPBHHdSRhkIZ7Azxf8uMCwIDllqiXpaoomZ27h88vITSPtdI0?=
 =?us-ascii?Q?CdQ4vWeSJHEQ712zwpP7Mv7IoVIW4SECfE33XRVH6mK7QxZydw4V79OjSkCp?=
 =?us-ascii?Q?pQHXCleSxWXACM5VC7+iWVCMZWLuv33WuTXbmnVm0qqRKj2y49gqyIrVMj/X?=
 =?us-ascii?Q?lHRc5v5q22IIfjpIeM1FWY/duC9G2R9DqeARaeJKSA7l22em/gYjM4bh0pmB?=
 =?us-ascii?Q?+fhMlzwMCkL518h8pH+2rYq6TERzv38vloo/hH+iYU05VxJ/bpIPtdy3DqEw?=
 =?us-ascii?Q?o2NwD6t4DNyvjEhkDlSrHo/Pn7ZyRljkcwyauS9z4aYhF0G9KII9zIqY2eLS?=
 =?us-ascii?Q?QK/mfft/KMRxYPlUULg0XWqgG8NRvE3Ba5DFPlHxiJZbQl/AkKcx4Y2HSYGC?=
 =?us-ascii?Q?sq7+cxfMdFYkJlLqLzRMC+Y/P8z4oaGi2/KAuViaIXHjaV1JEHoELC6Mk5s5?=
 =?us-ascii?Q?s5UcG0wQRHw4lbdtPr8sPg3nCEwuXbLYq7PKNMe0jd7l1sEP0W4F8Hvqi4FE?=
 =?us-ascii?Q?TQ7cpmK5+PhaUHv22MJ0QPA1jIGI1RtLxlUJpL/noFo8iKOY0oi3qRXb8F0D?=
 =?us-ascii?Q?/xPkrhQW1A3xpDx20EczDG2JGI+wesrsUpFsTIt/+v8RekhkB8s/D3H1N2tC?=
 =?us-ascii?Q?tCUal4pPxqGMEAz52H+JNuyIRIHnAA5y+VYhtligWWgO0YPJRRomTs6NZVil?=
 =?us-ascii?Q?Mt7zJP1ukCCKG/6YQA3QAISs1K+1x3vSfCRNjKpS6BvvJzu87vI657DfNp8q?=
 =?us-ascii?Q?b7cI1/Q1ICWp77mlZIRhh+wILZpuU0Az7oCGobh2HA5cz1+kX8F7uZyHxtyb?=
 =?us-ascii?Q?ecIcObF5CLpbS/frmjOk7Ay5L9Tp1jGJ1TtHLaq6SwrhgxRCGLJo0eGfCxdd?=
 =?us-ascii?Q?qGgPkSQ4jf6XFdnaPWT/UUgSxtYvRnEBRn7IBxgyyTLnDLN1a8cS4Br2fuBm?=
 =?us-ascii?Q?3WtG+vX7mVbeWHnr6aioMXvVeaCOYM77NH0MW7G2iXn1hpZ7B1kEzhHW+zO6?=
 =?us-ascii?Q?pzPOX2mpsLEncteF6EnkFQo6tGhmtnZV02XHKnwccn1R+bdfbX52/NBxOtiM?=
 =?us-ascii?Q?8MkiO4kaYSvs3E9fWYOI9oIwGI2mU2CZr+yRvy3pDufRMz5y01EzVjIGd/TE?=
 =?us-ascii?Q?bHLP2HgcUXhIVyxgUZ1zNUejYEA9f62GinRT4Rb65kh8kQjX99ek7vmdr1uU?=
 =?us-ascii?Q?rliBzqsj9WreQrj60Gl8vyFRvar2dNMv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rfijCG17CYHE0O9+AOWLmODjlO1raEw+ngmds5n1wjvV2JK1gxoX8R31jugo?=
 =?us-ascii?Q?+7UlqEH41Z0oDv4sSAfswcjbQFuVdd5WzPIm0Kd5cUuKEW4GTTjYc8CNy+67?=
 =?us-ascii?Q?gppFDSwR/YqQDYliUVYjL7mLNuex0bAGKxanY+BHty6y9GWeaSM7QQDoAdIk?=
 =?us-ascii?Q?GdUk2WDN7yuIROXPAE/NkPDvEon/4hEe8Q5qgiN0vSOjIa+XxAle7JnMnc3g?=
 =?us-ascii?Q?lj44xBDT7uJBWH/wJPygFkGlsWW2DM9ahkJ/9XKSV9LgBbhlw+PwVbkOlqOA?=
 =?us-ascii?Q?O2aZzxCAgt7k70zh4Kr0htSjtlQ7p+bISMlhRVlDjaADnP3ze7RAI2o00KGx?=
 =?us-ascii?Q?+m1Uw+ss6uc+YfNCVHxN4HWs43hfX7OBK26sWXGF8IBoDs5STOknTIxSfINE?=
 =?us-ascii?Q?hIT548+BskqawGQYIRVthSI5ED3ckkwyoZBe7RWA5dPfUgP2TTWLJjplHBNB?=
 =?us-ascii?Q?dgINOZixCwDqb4bmSTAO7X0WvGWzhCtPl2k0fP2IW+mIzd47kkpVXd/OgGCO?=
 =?us-ascii?Q?8zjP+1mO7rgyT0Zzz6Ftl+4HjOBqt+z1mqvLX8ghgbmWHVA0DnMsp5OC8A6X?=
 =?us-ascii?Q?3g3zC1GBydiH5PjUVdGbNHnmHsjM2+0PQi/lrHzfyVzaaETci4OVyumOjmkw?=
 =?us-ascii?Q?dY8+lbdlb5qwFlm/mkGB0L3ja3nRnfaWKDhjOWXargjYf4z7/otaYTi7nwya?=
 =?us-ascii?Q?kDsh6OCKMebbMqshC81vGrGXgXeT8Tkj4mkSXWw29L0/OqtrHoEiK4GdY6rB?=
 =?us-ascii?Q?7nYlVU5ehdt1Vit2dmZp4ZFaQ1n0t0/2ih+Eds0c2hqfIcdWDdQkUfhMU0gt?=
 =?us-ascii?Q?a+KjXhIiyqlj6BNCGWXcK9Qw1xq+wiDntZcadMQHiKzPGrfBVAkbBX3tShQv?=
 =?us-ascii?Q?NXj2jb7EMdpdv8yDuZnN5vTlnPlrDOYOaD+2nYgGJLLTBBV5uPCkcFF3oeg/?=
 =?us-ascii?Q?/ZrIFcIIIJVtQjwKSjQMz7db3fZxVlg3ZEA9x3gCpX6hAtEVFfVQyoVLwoJc?=
 =?us-ascii?Q?vrmR9HEISiu3zYbucBvNc7wgbqHuCx54adJmMVOdJ0u87pv1DYJ1+FtvIy9q?=
 =?us-ascii?Q?nwCbZmS4uSkBdQWa1gMIuqAyUTM6oZZ3jd/hDggIU/JhdpqBIk3455cb9nSP?=
 =?us-ascii?Q?p20AIJLl5rnq9DlXbWr5/oFbmLaCU8C2CVtpuxg5Vv1+yhoRC4NhxXCmx/BQ?=
 =?us-ascii?Q?E1W596FQjnZx4TTIapy3tg6MkLK4w7lHEe4Rm/U/lebILHpAcWRnb2Nly1IY?=
 =?us-ascii?Q?xqTo6WT8uFeVSCLAZfwnb6nfpYabSjNB91oQc+L72O7wQbAHFvFpweVbhSs9?=
 =?us-ascii?Q?Yqq/7f6PHmDuJ5+f3fQQNxMdEUfxENt8OkXMauiSFwFvXabfK0dYo80qQtYA?=
 =?us-ascii?Q?jr43sVv5OsZlmb5ESAxOxOJFPh1K9WSa15MurJs0QtepS0ivR/MB/WDTSoIy?=
 =?us-ascii?Q?m0fXxqQblRlsib9wu85ZX0y0UZGy9k5Laksu0SWRP+Zbje0NppDOc/VjTl8p?=
 =?us-ascii?Q?HAbfSUXz30u8RByGLK897LwMDDici86KKm4zxivoW1AlBtt6FhXFRvd63/G2?=
 =?us-ascii?Q?FEAfspo8C/RVZaeBLEU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c124ea-c4ab-46ee-a337-08dd4b35f02e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 07:21:59.1311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /nLk+6gn57LTAyBKwSW4JiO2KTq6dr/go5E79pi0q3KT2wJn4YXaAP7iFhm8k6laknQTQz9MNhXlNpHLXGSt9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
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

Adding result from local run :=20

./build/tests/kms_joiner --r basic-max-non-joiner
IGT-Version: 1.30-gf377e6725 (x86_64) (Linux: 6.14.0-rc2-xe+ x86_64)
Using IGT_SRANDOM=3D1739350394 for randomisation
Opened device: /dev/dri/card0
Found master pipe A
Found master pipe B
Found master pipe C
DSC not supported on connector DP-4
Starting subtest: basic-max-non-joiner
Starting dynamic subtest: pipe-A-DP-4
Appplying mode =3D 6144x3456@30
Dynamic subtest pipe-A-DP-4: SUCCESS (1.780s)
Starting dynamic subtest: pipe-B-DP-4
Appplying mode =3D 6144x3456@30
Dynamic subtest pipe-B-DP-4: SUCCESS (2.241s)
Starting dynamic subtest: pipe-C-DP-4
Appplying mode =3D 6144x3456@30
Dynamic subtest pipe-C-DP-4: SUCCESS (1.874s)
Starting dynamic subtest: pipe-D-DP-4
Appplying mode =3D 6144x3456@30
Dynamic subtest pipe-D-DP-4: SUCCESS (1.858s)
Subtest basic-max-non-joiner: SUCCESS (7.761s)

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Wednesday, February 12, 2025 1:06 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t 0/3] tests/intel/kms_joiner: Add a new test to vali=
date
> non-joiner mode
>=20
> Added new lib changes to find non_joiner_mode and updated test.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
>=20
> Jeevan B (3):
>   lib/igt_kms: Add lib changes to check if joiner is enabled for a pipe
>   lib/igt_kms: Add support to check joiner mode limit
>   tests/intel/kms_joiner: Add a new test to validate non-joiner mode
>=20
>  lib/igt_kms.c            | 76 ++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h            |  3 ++
>  tests/intel/kms_joiner.c | 65 ++++++++++++++++++++++++++++++++++
>  3 files changed, 144 insertions(+)
>=20
> --
> 2.25.1

