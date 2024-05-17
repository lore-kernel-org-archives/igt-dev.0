Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937B0C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 17:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAC510EF20;
	Fri, 17 May 2024 17:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUZNIXNZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB26010EF20
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 17:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715965633; x=1747501633;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QpEqQdENBxTMB/f9vEvQdjeLFENZUVQaNI8+Sp+VsOg=;
 b=GUZNIXNZq+1a6Q+PmCrSAGKDSaGpIMEsh0YD1WvSa06KGL3qqTRzPf0r
 XBbr2E4gQtihU4N0+sdohJD8D1i0kFpnfsDVMsaf5411prW8BskzCint+
 0zjc02D0+Jm6nQMavfaHdIdzL6cvXNnivTidvVfJo1h8uWhLiOZmtBMZ2
 oeKBohon7fPzhMLZ1X29UbeWAp5IwVliOEbw4UJo15O0BJGbvR5Fildsp
 CT33EADUKOlJ3Gwlgb07VeSYPNaBQwzZWAB/A9Li1RF9+mwsYk8Lre1ba
 8ECcXEIGWOHJvNbiZpGeCXsDpkKq4R5GupcMBdZmU67drxhMzkLujDKa5 A==;
X-CSE-ConnectionGUID: rC0Xvgf/QN++/4W/LaoJAg==
X-CSE-MsgGUID: nIsRpPVgRX+oj07Vp4w6ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12279804"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12279804"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 10:07:13 -0700
X-CSE-ConnectionGUID: AKUtZo5/SUmkYtFIn1FHfw==
X-CSE-MsgGUID: ZozMfMm0TBuzC7nmsq+Wng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="32003810"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 10:07:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 10:07:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 10:07:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 10:07:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 10:07:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QP5LPX22emtHMRViZF1H7+wG+B84yPk3bSxkbMSLMYZCSGYWmnbLUXYDkLw3iXTGsexHFMEAUY+TGfH7aW6lV8QYZ7nA3ghiGiNc1fWWpEt0hgW7wCoYGH9eC0mtp99rL/zk9SLf8qcoCTW+T8Sx+21YV5oetA5QJZijVQOhtGY6oi12b+HSaEvhVJrZglfMmLmijst7OB3mxCh2cDIEECHjXwC4/WGg109D9xiVwNcw7lr4ua5W7W0Zto62HZt1m3EHrWYAxGRiJTv6pT+icYoz6eYpOCOaRWfIFgCsrcoR73xF1eHyv6U0QDwFFD933IRevHYssn1bOt3AODjQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meQ62le8Z8XA7A/w2zP0kDj5tKTnHbR616E6ymSCGQc=;
 b=JoqNV3WvHZltxdjrGDPRpjceiG/616Y7tmykp5udhb1ZdzYSzCb8gObX6cWwR4z+GHj0KorjpPKEvrKfWA3lGGT68+qiVeEqqkSkj/RhQEnZxkg6kUh3C1kPvjDHGg7XR2xKshu4SfaLKe+zYdmo2nJc9NpV5jsbqNFx8rHf7XkIJuFxn+8wMOifWhTrwVPZQQWbIiQ39OEPDnVbr0m9/2nhgRYwZ1gKFGesytQvrFLU8TH8o8bA/mQUxL5SEsJJ9emdTjodevY46Kl+wflYQaHz+4MoIHXEAJjbhpD4uuW0erSelrzngp+FCPxOV3KZJZmZqdUy4ip/uUgoNggNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by SA0PR11MB4541.namprd11.prod.outlook.com (2603:10b6:806:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 17:07:09 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2%4]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 17:07:09 +0000
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH i-g-t v3 03/10] tests/intel/xe_svm: Add SVM basic tests
 using malloc and mmap
Thread-Topic: [PATCH i-g-t v3 03/10] tests/intel/xe_svm: Add SVM basic tests
 using malloc and mmap
Thread-Index: AQHaqE/nwPQ3Yx2J7UuB2ugsQILSrrGbf26AgAAoq/A=
Date: Fri, 17 May 2024 17:07:09 +0000
Message-ID: <DM4PR11MB529375EFDB1C734F43CF5F7D9DEE2@DM4PR11MB5293.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <20240517114658.810283-4-krishnaiah.bommu@intel.com>
 <SA1PR11MB69918B933EDEF45D617D2DD292EE2@SA1PR11MB6991.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB69918B933EDEF45D617D2DD292EE2@SA1PR11MB6991.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_|SA0PR11MB4541:EE_
x-ms-office365-filtering-correlation-id: 818efae5-e2e4-4467-436c-08dc7693c975
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?7/sKbLrTkHMjzfqSYKawb24V7hQTXWHMKYSGQzu8TofzD/bmUnc4dc+vjMGp?=
 =?us-ascii?Q?tQ2EnlXvYtgcaIyQeeLMXBQxUPur0g0AOVFZfF1MA9VPpW3KmzE9ubkXno0r?=
 =?us-ascii?Q?vcHgFYfJ/oXTgJHQ73MIIdHCHr4qAjgUs9H+Gt9RXmT0LJHHVsZXxkrbaZJ1?=
 =?us-ascii?Q?ZyQqU2zxg59eg2y0MYAmzFRyrRWE5fVC7xLI3QB5ARNmUjgk0pGKBUc65TPW?=
 =?us-ascii?Q?h1JQeOEl9P4sqe+/OpQ+P5zp4QiFWtTtJhmATp0RaWnYkVFTa+j6PLgXnnF9?=
 =?us-ascii?Q?SzcrYrX3t+I5x3dO3oZANTijdjzgzD9MCTlk2nwgFeLO+y4aCktDwH7HHhtq?=
 =?us-ascii?Q?uv9JKyRI2ShKUDmYkBHSlsy2gIeJhFU5mnpTZdT84+rjub72xB1S1ILJpdSq?=
 =?us-ascii?Q?pS/LujZljJcFDRr2dU/3Pj/05BK/PlKk3QxUmo7OVEKicBLiAnpQr67FNirU?=
 =?us-ascii?Q?fuq5dsJ3w93EanGh4h5iqTeQOPSNl3e2QLv7cAHnz8gscGn3dIJZwXzgcieP?=
 =?us-ascii?Q?+pl0grmMztMxWdLFRliUycEnQsu7Ag3VBa78rpy79t0Y3EzYVreGqqXOJ97+?=
 =?us-ascii?Q?lYD0s+QZLOKZT+kzII/P/Zc80Jm89Tsn66VEqzdERH+DtDKQlM6pXdHA8xBo?=
 =?us-ascii?Q?WEsFoqjQlYqZqgDSDC8q3S6q4zxDwT14IKZLI2PAHn9kbl9mxDcA+bSldkOs?=
 =?us-ascii?Q?UapBrgb3sgfNRHHuRqlC9Oeu110jNodSYygIu/GS/I/i34sRMp0jnDQh+m3T?=
 =?us-ascii?Q?QJZ1JKpWUA6NduiLcygTu60jN8ctJDX+k5//z/eLHMrbjjvKkguhwBskBwhD?=
 =?us-ascii?Q?DD0Bpqn8VlGSKo9e+VJd/Jhztko72sSA4B9OrNTwuyCBy4Xw11jbDRjUsAtZ?=
 =?us-ascii?Q?yksiif1f37yMuAYS3bdups8E6U+93cFf/XNx5bCwLEudwg3qth9Oya2IlDP/?=
 =?us-ascii?Q?pJAb222FVOmArg0ebx+YCIXkvU38TWjLiUPO9Yl+0lrIHZwkEvm1ATIZzk1w?=
 =?us-ascii?Q?WMC9Bcs8nxTs3XHSuQ3GaPJ5HPqIQAPaLQMPHWce7zUsk/vsUDwfvUrPieeD?=
 =?us-ascii?Q?BeuXmXyLxZ8kyykBTkUAJCv3vtyW6kbsBnhFZOwHgoMo+h2kuujl5H/nbbK6?=
 =?us-ascii?Q?Ghug95vBmyu7yx9SF570Og49lclXgDLM+1fdDpf5FaykmqLeih8VHtDLZRf0?=
 =?us-ascii?Q?TOpNsUN3CPLLNvnXFQzmuuaaQBeNCtT/J3gw1UiqrWLHI+c7CrLEFHekeXF2?=
 =?us-ascii?Q?BXqJmh4otysoPPJ9KNpkrTmJzKKBHdjHBa6meTS9E8Q1xvqoiqcbokj3ZrE6?=
 =?us-ascii?Q?50humdkGWjk8J1MBYHmaUUboClR/et3/ddysLlqUJyLrpg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ly91PPUDBBamWyPkn3RmqImUmZsXTaObqYdrvsuuD5iPQ+RnN3uENfjlq0ey?=
 =?us-ascii?Q?SIkJCSmUntAWDZdESvtRX9dzHhTOx/OIuX2o7BqX1H2BmLN8I0HGTBToZe6u?=
 =?us-ascii?Q?zjrTyYVxw2NphJsk8ZDNwiXmj6D7v04Sfa2oOJoHouWIRoHj+4Jrmhqy4YyN?=
 =?us-ascii?Q?MmPif5XdZwXXfGc8sClxFVImwYWqAiQru3begapxwKAETbhvgyME02MEi4QY?=
 =?us-ascii?Q?uB3N1+05hZgdPBeyJlR3Zm02S42adID9jMuQxdihnGf5mktN4cP1ragBg05W?=
 =?us-ascii?Q?EdYvR59/BokUk4qM6QnHEpCTIeyg6bLoZ3eHRaYkeZkzX+OzRRfx1PuSrJ3O?=
 =?us-ascii?Q?19Asrp42Pj0jqdDKJ3iLNoipN9V3WwciUC4Iu1e/y3Kmsl9RQaLhkhR8YA/q?=
 =?us-ascii?Q?YUiPUnrP04jjSqZk9vK2Hpacw0jJCbjZFLfOY+6kWhOyorgp3ig2ufisFdF5?=
 =?us-ascii?Q?zvYwsVXRljEQqu9s6MWgwYxTsPnWOHh1wp7rnt/kgkEBee6dZMi6ok/e5tde?=
 =?us-ascii?Q?r/p85syW92Ji/aqMrTylzrwW7m7TgAEjdfqua380NCz861+yuoRUIlYCAAyY?=
 =?us-ascii?Q?dvCND7ZwWpSJ41iKRSzu+YpH4qMclwoklb7E/APbfMOGPEnIQE73F1GjGcK3?=
 =?us-ascii?Q?S1S1elqUuLPCsEBX3DSZLuwAmUmP5baJFrjwf6KGd72JfbHKIcfqXZ/vfPZc?=
 =?us-ascii?Q?siSUwW1UpNdLooaHy3Zh8cqEryKelZvQG9r6WF6KPquRtAvX6DH/hJFlDZoJ?=
 =?us-ascii?Q?xjq42zw7QBJmLLLnDk+WJLz2BuoRkMl3rnw5npYuGjW2kDTUDLcSmPbh8kTU?=
 =?us-ascii?Q?MMGjslktQqytqEdxpwQTLZY345GNXjtbGIwwsIC0+RvyIwx5QONwrqxUfPL9?=
 =?us-ascii?Q?7RVYmFY+RTKsAj0LfP/tRHTg1PPk+ky/N9yLE3tnrD5EE9ow/HX/1A/maIAd?=
 =?us-ascii?Q?UnvE89I/exlVqmkGWXkpbCdO35c3dRy/hvh2sFWwsPB+NOcKo0LNt0P0sFxP?=
 =?us-ascii?Q?G+AXJa8EVkQUoQ4f0mKR8IG8f5m8Xz7Ikbb9RMwiAUn0SNJNNPAweSAmCioy?=
 =?us-ascii?Q?aWDArGYBbYGdqB7P9MlHO4V5PIRKAhf3RZttZXZU36vt9Q+WhQYnT+ZoCbkY?=
 =?us-ascii?Q?Kljd1xg4Uo14dO7qzhoZIih6kToNELDwpWJWz9NaaVLTZj5PZf0QSOkJzz83?=
 =?us-ascii?Q?bwx98Huw8StVI9yzOYvdz2fkPxxE4a5W+lLK2tFBFk9O6DRK/NaTrQYcPBrV?=
 =?us-ascii?Q?ZDt8zzTj+CSXHlXdbCAcNaxym90MeBKvyuNGLac7S7mMdCBdYbJjx6RdOvXc?=
 =?us-ascii?Q?iIwF1VTqBPMN7+zjTZSt5mOaEuWo+u22ciLu7+rgOxIBBrYOXl2uDhoky42j?=
 =?us-ascii?Q?csQzJ1EkBLFqhXJ3FNyzUK6LUkeKM9CSzQ0NwIqd7/OqZe8hGGQmI4/5/3vn?=
 =?us-ascii?Q?fG7iiCOz7L5XAbx0tjtdK2UR+8VggEBJRmpsKnLdXFuQ8EgOjG8UqQ8h5Sp4?=
 =?us-ascii?Q?RhqvXkGMa+TOQoRlbQuD0JRwEaZJQLinaEMwS0qNgRsvtXEa47CqkMj69gXd?=
 =?us-ascii?Q?c2JIh+nM/+U8TC92Puess00hnMSikbxLmBQn7vYYZz494/2ZqrsKHLaII4/J?=
 =?us-ascii?Q?tmht+yn+0u+PxDGVsAjVuP05aRIBS0tzyQNrITYkt010?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818efae5-e2e4-4467-436c-08dc7693c975
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 17:07:09.1909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0rWFiC82CyaIxGbiiAvjfXxM7O3s8tnMobBkWEpyCkyE6gq52o7fPjW82NbY9pK4Y053q6BUnE+tcjfpo1G5s18rKQ6Kk8nfdVgTrKAzpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4541
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
> From: Zeng, Oak <oak.zeng@intel.com>
> Sent: Friday, May 17, 2024 8:10 PM
> To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: RE: [PATCH i-g-t v3 03/10] tests/intel/xe_svm: Add SVM basic tes=
ts
> using malloc and mmap
>=20
>=20
>=20
> > -----Original Message-----
> > From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> > Sent: Friday, May 17, 2024 7:47 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> > <oak.zeng@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: [PATCH i-g-t v3 03/10] tests/intel/xe_svm: Add SVM basic
> > tests using malloc and mmap
> >
> > Adds subtests to verify the basic functionality of Shared Virtual
> > Memory (SVM) in the xe driver. The tests ensure that memory allocated
> > with malloc or mmap can be correctly used for GPU command submission
> > and data verification.
> >
> > Subtests:
> > - svm-basic-malloc: Verifies SVM functionality using memory allocated
> > with malloc.
> > - svm-basic-mmap: Verifies SVM functionality using memory allocated
> > with mmap.
> >
> > The verification is done by writing a specific value to the allocated
> > memory via GPU and checking if the value is correctly stored.
> >
> > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  include/drm-uapi/xe_drm.h |  1 +
> >  tests/intel/xe_svm.c      | 52 +++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 53 insertions(+)
> >
> > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> > index 0b709b374..69c8792bb 100644
> > --- a/include/drm-uapi/xe_drm.h
> > +++ b/include/drm-uapi/xe_drm.h
> > @@ -973,6 +973,7 @@ struct drm_xe_vm_bind_op {
> >  #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> >  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> >  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> > +#define DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR	(1 << 4)
>=20
> You introduced this flag but didn't use it.
>=20
> Use it to perform the whole address space vm bind in th igt fixture.
>=20
__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << 47, DRM_XE_VM_BIND_OP_MAP=
,
                                DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR, 0, 0,=
 0, 0);
I added this in previous patch, I forget to add this in this patch, I will =
add in igt fixture

Regards,
Krishna.
>=20
> >  	/** @flags: Bind flags */
> >  	__u32 flags;
> >
> > diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c index
> > 6302af95b..741961529 100644
> > --- a/tests/intel/xe_svm.c
> > +++ b/tests/intel/xe_svm.c
> > @@ -21,6 +21,12 @@
> >   *
> >   * SUBTEST: xe-basic
> >   * Description: Basic test to verify store dword functionality using
> > helper functions
> > + *
> > + * SUBTEST: svm-basic-malloc
> > + * Description: Verify SVM basic functionality using malloc.
> > + *
> > + * SUBTEST: svm-basic-mmap
> > + * Description: Verify SVM basic functionality using mmap.
> >   */
> >
> >  #include <fcntl.h>
> > @@ -75,6 +81,44 @@ static void xe_basic(int fd, uint32_t vm, struct
> > drm_xe_engine_class_instance *e
> >  	xe_destroy_buffer(&dst_buf);
> >  }
> >
> > +/**
> > + * @brief Tests SVM functionality using malloc or mmap.
> > + *
> > + * This function tests the ability to use malloc or mmap allocated
> > +memory
> > + * for direct GPU command submission and data verification.
> > + */
> > +static void svm_basic(int fd, uint32_t vm, struct
> > +drm_xe_engine_class_instance
> > *eci, bool test_mmap)
> > +{
> > +	uint64_t gpu_va =3D 0x1a0000;
> > +	size_t bo_size =3D xe_bb_size(fd, PAGE_ALIGN_UFENCE);
> > +	uint32_t *dst;
> > +
> > +	struct xe_buffer cmd_buf =3D {
> > +		.fd =3D fd,
> > +		.gpu_addr =3D (void *)(uintptr_t)gpu_va,
> > +		.vm =3D vm,
> > +		.size =3D bo_size,
> > +		.placement =3D vram_if_possible(fd, eci->gt_id),
> > +		.flag =3D DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> > +	};
> > +
> > +	if (test_mmap)
> > +		dst =3D mmap(NULL, 4, PROT_READ|PROT_WRITE,
> > MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
> > +	else
> > +		dst =3D aligned_alloc(xe_get_default_alignment(fd), 4);
>=20
>=20
> Hmm, I currently assume system allocator should be able handle a allocati=
on of
> 4 bytes, even without an alignment. If not, it is a driver bug. Let's rem=
ove the
> alignment for now.
> > +
> > +	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst, 0xc0ffee,
> > +eci);
>=20
> Maybe change the dst_va parameter of xe_create_cmdbuf to void *, and do a
> cast inside xe_create_cmd_buf to cast the dst_va to uinit64_t. this way w=
e don't
> need to cast every time we call xe_create_cmdbuf.
>=20
> Oak
>=20
> > +	xe_submit_cmd(&cmd_buf);
> > +
> > +	igt_assert_eq(*dst, 0xc0ffee);
> > +
> > +	xe_destroy_cmdbuf(&cmd_buf);
> > +	if (test_mmap)
> > +		munmap(dst, 4);
> > +	else
> > +		free(dst);
> > +}
> > +
> >  igt_main
> >  {
> >  	int fd;
> > @@ -91,6 +135,14 @@ igt_main
> >  		xe_for_each_engine(fd, hwe)
> >  			xe_basic(fd, vm, hwe);
> >
> > +	igt_subtest_f("svm-basic-malloc")
> > +		xe_for_each_engine(fd, hwe)
> > +			svm_basic(fd, vm, hwe, false);
> > +
> > +	igt_subtest_f("svm-basic-mmap")
> > +		xe_for_each_engine(fd, hwe)
> > +			svm_basic(fd, vm, hwe, true);
> > +
> >  	igt_fixture {
> >  		xe_vm_destroy(fd, vm);
> >  		drm_close_driver(fd);
> > --
> > 2.25.1

