Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF5ED2ED11
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E2A10E070;
	Tue, 20 Jan 2026 04:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Go3UHBiQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9A010E070
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768881634; x=1800417634;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ca++OvSC0vudQox4jF4IsUm46BY5Bc4vgGFiN1X8nq4=;
 b=Go3UHBiQINGs6kcasl8treXsqukZ4skNvJ+Y7zwRlCARDFkvcYu9+9/+
 8wsozL7wSkHho5IKcCaRvn7GhDoQHhum7Vwf/RRvvCqAJj4bbfV0hrwkq
 9Uz4Hl5DCuVDej1mEkrKuIpg9VrysFtnNa5oFvk8BDmeRiQwpYXPBMg8u
 sAOAz/4CN7aWHyHPewcA/nLY2TuaOJ/8UR2ynn/aQIkl4xrdibfLERRiz
 O9XOA1zSEnzf9Bt9dIvj5CawW3DkcQe+rh7NniaaM8vU9h1Qu/yaW6g4t
 9A7ld8V4daruS3hnR+R4dhzukhWNBs1Zmo7bdhZH6jptXXAZLrNJZOWHz A==;
X-CSE-ConnectionGUID: Jb+EvTKWRDW16COZ5Q5EXg==
X-CSE-MsgGUID: gLdiJcIEQY6ZqZYOgiRKBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69993206"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="69993206"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:00:34 -0800
X-CSE-ConnectionGUID: hYUxxqdGRe+UeEEdl3sDRA==
X-CSE-MsgGUID: y4wKVVt4QralM8N/Z5eFBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="210485665"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:00:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 20:00:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 20:00:33 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 20:00:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rN+QPmNyX5nsZt1fG7vWG3jPZNYfd3xGrY2273KVZ70j0+nqWfFSvpODYXpdc2KrVK5dT5QJUAFIcg66R/quMwL/8WPQzVMW/kZwDDDNc232kdgLRQQu/qBKgJgPy+Duh9MoGS8vc1vfNDTpl/ToKZOeM6TnZgCjAVOnz/1wlGOuvoaLlld1BgrTV3uBR5UKjPEP+bE7xvxpoxr3pbc7pD7MaPLcT0uX2zR/uKuJAod3usRc0PbyES9k9bjJIcazZaE7cdosGOyDZbywQVVbxaj0TC27jxV9ZWimjDiFG48fyVuV9QJqx+pJYL527digt4QPIorUJzSmRiqUHz9/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zj5+ja/gs8HsWqKxYvYrKnCDMx9n7cNF3C0Jk4Gl5Hc=;
 b=Lg5s9d4VAnyJB8uhr+XurlIPE+9e9+0F/IcTo9hzG6jCpgSA323GukBZCF48udq5f2A1HL+ieqnCWESQmvAPNuhM3RCrRPzwb1obRp5flPQxXvJDUkHDh4jojX7Gh2LwPjwr+i34QAYu712vxtu0hOnnh9eDhFtQeKYyT+Eix30THp/bqqWXaCTEnqk6+WNTboCAKNAwCkMtx+USTsxsiGWVRNCo3bCi5V9Wi9n5kbFKkl5p19WzkTvlymPFbNeznZ1oybshMBrjYNrXgNHsahRr+k5YIAiW+owe6QBnuJQV2YDa2LR8Nm47Mb5HtMRbIHuUAXeRPRAnTGuDpCnZnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB6348.namprd11.prod.outlook.com
 (2603:10b6:208:3af::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 04:00:30 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 04:00:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v6 00/10] Introduce intel_hdcp tool
Thread-Topic: [PATCH i-g-t v6 00/10] Introduce intel_hdcp tool
Thread-Index: AQHciUAOspcf9GWbv0yMwiuDpyS7brVab9HQ
Date: Tue, 20 Jan 2026 04:00:30 +0000
Message-ID: <DM3PPF208195D8D2DDEF87D70F5D82EB42AE389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB6348:EE_
x-ms-office365-filtering-correlation-id: 954f4f0d-2e22-4f02-dbb8-08de57d8743e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?pgTrG+EUkAJSIu/xItqwtWyvUusZAYVOB0AzImsrvwgLarJqXzkBaRBkPE4M?=
 =?us-ascii?Q?eni9fyHJpTqtOxhVMGmyAX8Zh+QPKI4v8aRne/sQmqosDDiWGKAm0k4wka1n?=
 =?us-ascii?Q?50jOb+QDQ2+PHjX3vEzsG6N3c6HIgQekHXx5eC3HRsPkz2ezihtB6kNdjzvX?=
 =?us-ascii?Q?UD15+7esDAO+OgDL+SXf4XwrWjV+sL7T1gqNyH0YV8hNioIP8TbkHl9jr5x/?=
 =?us-ascii?Q?BkebqOwkpMRamzRiOwc32fm3MW1awdmngr4mOB1XnUaXqBS+lOAXPziQ+BMH?=
 =?us-ascii?Q?PZooN2QefoLjR4BAcOd5+bsyLaitVGEYs8eAs5DCJXv6Lp6QkHcROTNwusyh?=
 =?us-ascii?Q?AgNyMR/ITw4E2rfo6R2DYwwhEbWBGiuzlLxy+bgcUel5G5BkRqUm038QN/KB?=
 =?us-ascii?Q?6FS/Y64qiuHnYUd9pp7E5Q5ahj+tSaxFhx7jt2fCT1MDPPUdxgBoxxnGcnBQ?=
 =?us-ascii?Q?JNVeGCeiYVpeKZWDAXKTy5ABU3lrO7CUnu4WR/Go1aZ5fRHP3qiSThnKFsF1?=
 =?us-ascii?Q?p4Y1MrhaCyUeuWpZrUDDZHEhedH5IK1hjiUcHBQC0KjZrvKaUUIop8K47cv3?=
 =?us-ascii?Q?U5sSFTutMl0kTNZSbOy0RS/nGAEyNb0OyWh/fSoK8phuEyjc+m/mZt41qypN?=
 =?us-ascii?Q?CKG5/V/hH0ZBlVaZCxbkiF6r4UN8QS6LxGwMPCyk59SpGJfxJtFDetzjnsTV?=
 =?us-ascii?Q?tEf/SCkXMz3FKpNPRijeXFA2+mW0nkBUJqkU4mCvMwZztSLyTMfKCL5hPjIG?=
 =?us-ascii?Q?NxflmlxGZQ6T72E0Nig55jOSnEXnRGYhCpCdV4cyxS9xYKgTkV4mAWl9xHbX?=
 =?us-ascii?Q?fJ6pNCIpTja/ihKLcdZPv1Xl1BZl1XKiBKiUlYOlR00hk88LSrcJFULZlsq8?=
 =?us-ascii?Q?TQ3ko1Vw4TyDLfHkIeQym8t+D+4D7RwF5nWQWzZwlzAU18VueaTpZ8NhWx7i?=
 =?us-ascii?Q?BbMcZ0iKQH2bj82o6wpNyg620FIXnnYwla42pRuqfzKM3aZiKJpkU5w0IeoM?=
 =?us-ascii?Q?zR0/ir8fetIGkvXxNehEgg7fgK33AjJcOl4FpZV/QK988brBLjuo/VEloK9q?=
 =?us-ascii?Q?rd4iw1unSuZPqaFSJI5QClz6PoX5dTZ1tiTwuyrr85F+TJ7sam2yI6/NX5iY?=
 =?us-ascii?Q?ymNpzzsIz9yamVVo5V+PFIVqj6fTNFnFFgzwE/Qa+/BVGAdtylhpC6REgUbb?=
 =?us-ascii?Q?Orwv2XjzqFtfx4xl9KF6voXW0nl0LfOgtVqpz8Y10NGf2NELio6/hjY9YUcY?=
 =?us-ascii?Q?+oo0SB81UAWnbdx32txz5ziG5V1171hB1Kd7ohezM/fR0UBLz/kblSh777aQ?=
 =?us-ascii?Q?6ESdj02KpwUlDW6PysYVSaaLVqomSE4v62VU5K7Dk/8mIJplGUB/GmkIrjTt?=
 =?us-ascii?Q?7zU1qX7WEg9Ydf8hS2fsU/4nqdZg3cHBXRXCrP0eGHvP9ECQaXPbaKktfC06?=
 =?us-ascii?Q?iggWUU4mEYN050fy09uW+OH75ZevzxVNTYWdbOYILLVCwqeNaNnmi38nd1DC?=
 =?us-ascii?Q?e7aPrwtynb74LDCt2jplZR8xicQNVLQeorCi/hCnNnF8MBkRPfn4H4YptJL1?=
 =?us-ascii?Q?HPM8pT/t92S/hph4uzYvxKkYzcFUjQe1+zM8mvp4WEUHurFMTQxPRF9shLh9?=
 =?us-ascii?Q?GNdErQjBfYofkpgPp8KRILo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0mmdrP/KDCVJC6qDrAbO8vw4/jMlkSBdUFlV9QyilBj/oP4qv9/XXTzzu4V0?=
 =?us-ascii?Q?+TygFnX3Mvf1XGispsyzRuMGa7IbVvsl9zwr6oe2WvC6qiqxbcwjO2I9ir1Q?=
 =?us-ascii?Q?xPOZp8NaEsGLscDWFM+d5kHlHov9iXQzYBsDMvLwtsOa8rI55Wygf5IAvbjn?=
 =?us-ascii?Q?Lv5KCaec32577FRhtgIRv9cd2thEzWl8gKG0Imq/DugoDshKNXC3ey2witkh?=
 =?us-ascii?Q?GoZMMeP8TYiaSq/ovuwMJs9S21EjIxMfuF5Ue3bcXfxYVuNYhXuzlzTZDhl6?=
 =?us-ascii?Q?lI3m5mmQ+19lYUl9uNQjvZSl5Ev/xtCHjjXooeJOWsggJmi6cQEEQ6W6SW85?=
 =?us-ascii?Q?5AF9SBr5RrieQNxneU5RC7p3XmQK5p3jlmAWbPWNrqQke9LHOizLsSYXs5c1?=
 =?us-ascii?Q?5oAewb4pMiFn2TfA2om3rorL+2fh/Q2elQKMZgiCtqxp8Ep4QX77VyNubZ+E?=
 =?us-ascii?Q?9n1znp420unfddGithWRNY1OPY5BhpNqT9sZ4cH/pCNrkGhL1Bq5wnw/C3mI?=
 =?us-ascii?Q?tlk+g6lGs5A9sU9Yblr9Gn/7zo81wkPueep7KAjLfLnssRN+D+MnShZdiqtf?=
 =?us-ascii?Q?bxEevH8wfeVIQmDpIR8qbUPPQw33Jrch4v3Q8uzPsXz/v4B5hNKOQtYcN7gE?=
 =?us-ascii?Q?Cyocf29k24i7FLXtdMsWxKziDM/OEvLqIyQvunx3sbUW/lIr4RrdZ8U8uwHh?=
 =?us-ascii?Q?AL62DHW9JAiMPgOduCEDioyGIfd4b2ySt4IBEZ0DERAp9BxOV1Abx/jRephT?=
 =?us-ascii?Q?WmKaYgppdSBMDCGrLqH/epx3Sw+ZpMCk0q48fuPAFvJ3BJx0gdqLk6zlP+uB?=
 =?us-ascii?Q?re/d0TX0K1WFhiEKKiXQT4VDjbhnOBS3GR+MNr2HVry3NAJrfgVwr7JHYwXG?=
 =?us-ascii?Q?g0UIdUD5ta/IH8I4fl+vPz4yrBKBuwfKDjoAiHkXe+/lCtDKZi7hLU5tuVsN?=
 =?us-ascii?Q?6p0kY5NZmUtGubNNMpT1mYtJGHhmpbKM0f49HAMfbsYU6f7TjiwXpj13AK+n?=
 =?us-ascii?Q?hq6As0wxQYXZ4m+zolwJ6Yz7m3C+z6jmbByw+mySBCeFlVDuMOirPzJM/yZA?=
 =?us-ascii?Q?YF7Wj24TeflZYTfAwoVbD+3qZyE5dOMtu4K39U1xCeOKq3BDlZnnSlc9DXDZ?=
 =?us-ascii?Q?QQuKwSTHT7IYPspxUiEvGF4A8iEJWaV7uk1Hd96ySUnVVQ6cySYz8qBK+NIW?=
 =?us-ascii?Q?UUW/ISiVnuxXbT4qBbyHyS/aWqf639WxZF+e+KkEju2l+eOHSHk6KvHpe+IP?=
 =?us-ascii?Q?J6ukhR2LFi+X5/wxYX0vAu43aJb1yjZo4xnB2vGsfD+bhM5ZKl13Rx3y+upl?=
 =?us-ascii?Q?3XAha5b67KmE1Jq7M+HWH4QrQHsjxjyO+Jo1B0CKzG6x36fop7ZCOaY+8MIT?=
 =?us-ascii?Q?O0nzbGGEBE5qMSSj4Ew/nKQgIk2bHZlOawfewgbyrCEBSPpEw/F3H9LYI5Pb?=
 =?us-ascii?Q?iIeVBhtjT7RYR7UE7sGUK88Ka+YsYyb+e8mHUEk/6fuZy3PtSy79REQdoDfb?=
 =?us-ascii?Q?79eHN5zcI0i2M0juezQrCBYWVafWXV4ThBYB1c1n0MBQd4BAE/xO9J3BrVMP?=
 =?us-ascii?Q?E5Nypo+mwO1VgbtTQodBqXxIOGPovNh5AL5CLhBx+w9yc4FK/4LkUi6wuFvq?=
 =?us-ascii?Q?Mo3aYZAC5WnLxDaZQE8S5vVgCUBr8+Dblwk/OnjCaIWyw39z5Z7nCxlF0qb0?=
 =?us-ascii?Q?SgOvDrI+YhDTbjpKcqWBxJEpHDgd7t/bl4Qz5BJRNoCFcZTsLavT63zy9TvV?=
 =?us-ascii?Q?egAMhdMBqw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954f4f0d-2e22-4f02-dbb8-08de57d8743e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 04:00:30.7722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8G3wDM6I5nSFx0jcuxgLjI40sPM/7fWOOVRfooPCoP/vLW02urrGNl+70o6fNIqPm2qK6IAGZPKcbLr93Sa0xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6348
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

> Subject: [PATCH i-g-t v6 00/10] Introduce intel_hdcp tool
>=20

Also I think yoo messed up the versioning your last series was v7 but this =
says it is v6 this should have
Been v8 and next one will be v9 , keep that in mind while floating the next=
 series.

Regards,
Suraj Kandpal

> Add a new HDCP tool for self-testing and easy deployment to client machin=
es.
> This tool helps diagnose issues, determining whether the problem lies in =
the
> driver or user space.
>=20
> Santhosh Reddy Guddati (10):
>   tools/intel_hdcp: Basic init and cleanup for hdcp, constants, enums
>   tools/intel_hdcp: Rename variable c to connector
>   tools/intel_hdcp: Add helper to set HDCP properties
>   tools/intel_hdcp: Add helper to get HDCP status
>   tools/intel_hdcp: Add helper to get HDCP content type
>   tools/intel_hdcp: Display HDCP details for connectors.
>   tools/intel_hdcp: Interactive keypress thread for menu
>   tools/intel_hdcp: Add video playback loop with thread
>   tools/intel_hdcp: Add interactive control with playback
>   tools/intel_hdcp: Implement timer to the video playback
>=20
>  tools/intel_hdcp.c | 687
> +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 657 insertions(+), 30 deletions(-)
>=20
> --
> 2.34.1

