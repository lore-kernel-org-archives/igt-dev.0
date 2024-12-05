Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71C6E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 12:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CA110EE4C;
	Thu,  5 Dec 2024 12:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZL0Cq2J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E241310EE3E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 12:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733400923; x=1764936923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JZq4T8c7ySeO3DynHVSJolm0E0Aqmb/4UZ40sewGP6c=;
 b=aZL0Cq2J5kFr5Neg9v7jprI4JkvBPazIeBuGu99Cqx8O/G7f0BSxeqqb
 Fm9BR4wLlAk3vTvYlbsS2N/6/9Wx0oVP32dlRutNI9mBZd0LczVQ+vva7
 l45xQeBG4WnaxQp4gtWMbTtUwPAINvGzLArxem+wNWrooMGPwTKsWg2IB
 TU6AEDbieP7P97W33dJC+fff106hIbBsFpZLXQp8AAdzs1KyryDY97yPn
 ScKjHhbsB268/pO6bRW6PIa8I0Ov5Cyr/WVBqrk3TM/Oz2fVxLB8NsObE
 7PN7gO0M/sPmghjqPnw+U5E3p9Y07mOwFbz+Yg8YGP6Hwrww1BKaObIAI Q==;
X-CSE-ConnectionGUID: Z3I3MouoS+WkE6WjDrSf0w==
X-CSE-MsgGUID: z+H8NypqR1iIBKU49BHG/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45087409"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="45087409"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 04:15:23 -0800
X-CSE-ConnectionGUID: LEcSfszXS1G9mOjWro/efg==
X-CSE-MsgGUID: 25aj3loJTX6DFDn7Zu84Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="98146835"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 04:15:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 04:15:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 04:15:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 04:15:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzfMsPzNQRkf6Vr583gO0ODrYSDBSYw104wuDdspxT9WJ8FmlHE0HKZQAprafok1LMt4l6Gx6LgDWhuJJ3frXMPMdTymCppIp9X5DQPY/My+8rrq2Nfuv67fO1w0z+pRKt2bwsKiayZL584DeoWj5t0xeVPCzBlx1gt/JWEeAfGfSsS1PxVU5dpQa1ome/PkKSwCxn4j29SKQj9rbTSLGHrNdD2TP/35rakljs3mcx+G2tK8Y8bbIGG+ZftkDBiAHladvT4o2IT4/hN7MDFoWp027sIzLAbcZPzi1Y5kqO9bkGwoG6J+jD+v62kHEuTnO4yUxaHWyg/gA0h+30Sa/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqgDOg2N/u1D2G4ARMKuBsOqskHUF2Bnz16Ob+f8lmI=;
 b=bMAvnhAGGPQB+4dZPIbkjWVzP4yQITJO3/aZKz1lKN/8qmmuhOFVOQWEadfCdW7XBItV7FFUN8nxSY5t2a2VfTEsA9Y5DpULk2gd+uGV1xVX4ixpDJJfwkccIbA3nS+s4zmgkL5j7VRsIsO8X8jY54b1G3j1YasNPnZ2VTH/4VABBTS1nKwBL9ZoQTiXk2s/l+9LT1UvKKQRbw46oW27AAdfXS9rYDMpZPMyqPE+zWJIb8WCC+UH7toIlgyY4/O6T/svpEUF8xicYbhhdwgWBOA/OND5lCUwuCUAqN1vk2oFP+kDtGWojabb6+IY22iqSC+1s16o0c5ll+h4N6qWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB5031.namprd11.prod.outlook.com (2603:10b6:510:33::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 12:15:14 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 12:15:14 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>
Subject: RE: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Thread-Topic: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Thread-Index: AQHbRps2NzRtZGKB3EyGLIlzhavVtrLXj4yQ
Date: Thu, 5 Dec 2024 12:15:14 +0000
Message-ID: <SJ1PR11MB62043338AF6E4A908816FA3B81302@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241204222347.108788-1-jonathan.cavitt@intel.com>
 <20241204222347.108788-4-jonathan.cavitt@intel.com>
In-Reply-To: <20241204222347.108788-4-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.brost@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB5031:EE_
x-ms-office365-filtering-correlation-id: 9dd21614-f9d9-4e91-0003-08dd1526792b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4xiC/FplII2SFD+r5vBFpCXH5TvegXZE8j+gjMh1q9GJEpdgXZ/b3820WbJp?=
 =?us-ascii?Q?JgcqDepkqsUT6NY4esJi3IF/Hthj8LqeGDYXt2uvXKNEwGUAcwqWpOzfcrZ5?=
 =?us-ascii?Q?iBiCGgXBQkq8xrpKVWf2EG2/kH/OuAjFdnq6YpM/ZMQ0TBn8I0K/72488spv?=
 =?us-ascii?Q?j+aUJNIInn6CBexrfU/YTSzxY3y6qjGeeiENMquU2olM/rc2CftAa3VPz+q4?=
 =?us-ascii?Q?Dpfv10pDkI0Gh84zPz2sXkUYdUNwYyxdM94+cgwqMLVI2fyjyCmURgFYkQap?=
 =?us-ascii?Q?qu1LXtNXFv1lSUnjKW3M24aQT40xzet7FZPchkxvV6UkqEfVJUmX+cqIJ7Sx?=
 =?us-ascii?Q?aPkI3F6UK10WhuUYZfE1cxzhqg5CId2lZEJIL0dBM7CtKMRxY+8bF2ODIyz8?=
 =?us-ascii?Q?k3ekFTTH06TWMJqGUSovmI8kaGSGOuHwP1CC2G+CISJ2JZTPxRaKERKQMH/h?=
 =?us-ascii?Q?3gO1kOq0Es4BqcmCkxBsc4OgiPW9hAIyHQZBBaOUXEAu8XxGcKkIPuCsf55E?=
 =?us-ascii?Q?+EAYejEUfOOUWw800GXW7NeW+rxdf51gyvKyLJYeJAtW2OnFh5pemXn3G39l?=
 =?us-ascii?Q?Ga7YuEeCyEa2KCtQ66bqLBHlkpbcFi6gWRXIDYrsJHL7xd4s32hnjC7E1juu?=
 =?us-ascii?Q?qg6HBNGlsYLgMR9K0T+ecT2pnnsuksMB0pfZq9bzR0WixUtkEzE0B9ts6KWx?=
 =?us-ascii?Q?J/WghyYdDdDgmoEN/I1pzKvlfQ8eRG/qvkfd3lUsbNv5xwTmn0E0q+kNK1T2?=
 =?us-ascii?Q?3RyWyOpSInVSiCefgt4uFHiu9hjyt8vYEZAOD81tqe5XQSbcexLHt02SU12k?=
 =?us-ascii?Q?uPNkDBVOC3W9u4lGfyrQJbe/m5L38woLJ3SpD8nXle8CogvFo2uxB/18SQrP?=
 =?us-ascii?Q?EX9DwMp/og+rsS6gg0EhuSyInZOiOPKTQ2+JMMjcDQygQk0c7rEkHXMSKHi7?=
 =?us-ascii?Q?ZvsJRj4Isccw8UilZ7p1uUbFfWzHvO95SkpGZ8kjrLa7oFdeULM5KaSumLE/?=
 =?us-ascii?Q?Y+Zs+7+aF6uhwqEIcmNvBt7opvKhD+lRyNsudwgqO9nzkmJijfM/xvsW2gav?=
 =?us-ascii?Q?a0xHOzxV97EsLAguMRvcmjOs9TupN+6Fe5U02PrUJvqThq/PBqbsFiA62Hlf?=
 =?us-ascii?Q?3fMeQXMPRv0V+QCUl93bXUeq+AmQOjqJ/Su2uofrCCTrQ7Rg/l7M7LOi1dDB?=
 =?us-ascii?Q?JQx2BRF9e94kjv5I2zXW16ZwASD/JI18D88lwAqtVHknl/ucvhbZzfIB9RQL?=
 =?us-ascii?Q?9ZqCUofNJRXP2wrzQMkEd5RaFKoe3WLBBIP6kNAYciaM3wA+xouzhdyaY42J?=
 =?us-ascii?Q?3f7jZ2iknDwojzl3Wnfcf2jh8YIG30Nh4WtCwOdQPxk/shmY1KRSIm56D+tS?=
 =?us-ascii?Q?cwjbbZQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xMB7r978zuLFXESwz9L7g/IKK+Vm6PE5Bp6XklvTowGWK1E2Pq7Y6CXrxZ8m?=
 =?us-ascii?Q?vp1hELzQzjR8e/0Oq7x2L1+YG1g8sqwrqQ1a45rrMEkkRwzxU+XD26DUJiKb?=
 =?us-ascii?Q?k801KrsUQNhvY+iSs2MR1tTPDg/JzOw1cOlXOiH5Myisq+E8IDtBZEgm108w?=
 =?us-ascii?Q?LY7MIU75euC3UDc920kDrZ8jDwNunQgWrR79IJamXLvci7JK5+CIW+ttJAtl?=
 =?us-ascii?Q?md6neQmIkXBpMsvb3cgNSCTEVBujSqOEESWQof2pZorJLrpU5xCJoB/BUxXk?=
 =?us-ascii?Q?reme2JDJ2VDEc5E51b76b91g0vN7j3xzUX/PitnEcviPGqWtavsiJfDsT6dk?=
 =?us-ascii?Q?TH46Bj5AO/1QIkDK8R9Scmfj91thF4V3Ece852j0bIHwtWLIDcY2Uq5r4BID?=
 =?us-ascii?Q?qRQxNRF9D6Zm5WCot4d/jd3GsHSZ/5we7tFxhb9hZDau+U8CzlbP8KcX8i/2?=
 =?us-ascii?Q?Tooj23pcJTzkviIucb82ACQFqJx8xWB6vrsBdb+vnEvqkuDshRBYF2n3dqv3?=
 =?us-ascii?Q?7mS/4Pftyr+Ee98pUueRri4Cg3W03KhkC5gazb2m2LQDrr7VqpEOOJHMfvnv?=
 =?us-ascii?Q?Xr8Iu0tw7WBBSibdXOHljgWRwLw203Bdz0kh1qMJcpKudThSGLdYmwfN57lC?=
 =?us-ascii?Q?ZIa8Ss7EGuTyrtr7NT5mL7Fkq2bEjJMqsRA/Jp5y70iOuikz0jayYAXMWzKb?=
 =?us-ascii?Q?tpu0p7NsyxmSuRB3JPJVM7G+7hoj9RnTNfy3hP8V72f6H4hCxYfdxUMNo++E?=
 =?us-ascii?Q?uWfHRN1c0ZJv8ooYP5ukSeSIpVEWlZUH20L7d3EETwsbxeE5r1dz9Jsy8iXj?=
 =?us-ascii?Q?f9v9nC5ly4tHRQzWuEkpeaL12QC37VSiJrX0ESVzL1tyKGeMWlsDF13NfNoY?=
 =?us-ascii?Q?m+9LlN7Hu314nkx7l7wg7MM9wtyXa16sa+JO544Ofsj2qGw3fCTfP9DE5LED?=
 =?us-ascii?Q?TN3VJIFDDgTbRbgpm67cqJiO1Sl32xh9STU9yj56RWpKmJgsInQJF+MFjcsV?=
 =?us-ascii?Q?37hitQZwDTp7tGqpqyv/dXTbY1YcgodnF4N7qIhCfMJQCO7j7nZ10TGdcxa3?=
 =?us-ascii?Q?WjUS3d1zrCsP1/RELid2HxBU4hhnAEMJU0I6qbIen5Islzy0Foex0NNh04IM?=
 =?us-ascii?Q?j11MAJxRpL1Xvm6s27+VoG0inI+mWRIXu816r0/EdQWZNdP+tg+eRh8MA6E0?=
 =?us-ascii?Q?dHE0wUXhHMc3a6VrKuChdA/gV9hoAAIseOzDaLhHH9xPKcYUFYzt1MkoD/UO?=
 =?us-ascii?Q?MMgYPKqMysU7NR84u5z4KlQZHDnwOmjpQvK7qtlTjVuPxluicaLeqBZ03Y4d?=
 =?us-ascii?Q?zypENgx4NAVExfB0Jgf8rdnnndUYuwU2mJHMWf0C1FYhX39/VYkW4GTxE046?=
 =?us-ascii?Q?wqgFK5jf7Bz/UwjLhRp2vAsGBhQPhbzC5HogCtJHBqE5ffR9OyI42IueW5H+?=
 =?us-ascii?Q?unnwz8t/P3MZ714jemkhrBk5fEAUMviCIqW3zNZMypK7SN1MgCaWOI3WUBvD?=
 =?us-ascii?Q?z7TQkSqBXMASDosdZYATNBOMHF0KC8Ic6zsKwJrjMpXqsXjnD1oF/c77+H7q?=
 =?us-ascii?Q?r3TavNfFzLgD6y3p5C7+AaZ7fmZZBUlNol3R3b+a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd21614-f9d9-4e91-0003-08dd1526792b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 12:15:14.1926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 870jaJMI6k4xUyn1fYpvPkhjfzeX82GHdgx+BB2SO4Nl2mJxromTYlHaSMsEfXKxuOPYIz3R7SfbfjFHFxaYvlHM1iwKw55no8WuhtAH3pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5031
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
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Thursday, December 5, 2024 3:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg
> <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>;
> kamil.konieczny@linux.intel.com; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration: Restore
> preempt timeout
>=20
> The subtests of sysfs_timeslice_duration modify the preempt_timeout_us an=
d
> timeslice_duration_us values.  However, while the test does restore the
> timeslice_duration_us value at the end of execution, it does not do the s=
ame
> for preempt_timeout_us.  Because the value is not properly restored, futu=
re
> tests can end up using the unexpected preempt timeout value and thus have
> unexpected behavior.
>=20
> Save and restore the preempt_timeout_us value during the test.
>=20
> This fix does not apply to xe_sysfs_preempt_timeout because only the
> preempt_timeout_us is modified during those tests, and the value is corre=
cty
> restored before the tests end.
>=20
> v2: Also restore preempt_timeout_us on test failure (Kamil)

Restoring timeouts after test looks ok here, you can add my r-o-b for that.=
 But if there is value already set via sysfs manually which is not default =
values then we still have chance to hit the issues we are fixing here. I ha=
ve tested this manually what I am talking here.

I think restoring or setting up these timeout values to default before othe=
r igt tests like igt@xe_vm@bind-execqueues-independent is very important or=
 else low values of these timeout set manually via sysfs (echo value > time=
out) might fail the test.

Although I am not very sure storing restoring timeout values should be base=
d on default values or not. @Brost, Matthew any input here?

Tejas
>=20
> v3: Abort on restore failure (Kamil)
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2976
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_sysfs_timeslice_duration.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_sysfs_timeslice_duration.c
> b/tests/intel/xe_sysfs_timeslice_duration.c
> index 899093a9df..752672691f 100644
> --- a/tests/intel/xe_sysfs_timeslice_duration.c
> +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> @@ -115,10 +115,11 @@ static uint64_t __test_timeout(int fd, int engine,
> unsigned int timeout, uint16_  static void test_timeout(int fd, int engin=
e, const
> char **property, uint16_t class, int gt)  {
>  	uint64_t delays[] =3D { 1000, 50000, 100000, 500000 };
> -	unsigned int saved;
> +	unsigned int saved, old_pt;
>  	uint64_t elapsed;
>  	uint64_t epsilon;
>=20
> +	igt_assert(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u",
> +&old_pt) =3D=3D 1);
>  	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u", 1)
> =3D=3D 1);
>  	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) =3D=3D 1)=
;
>  	igt_debug("Initial %s:%u\n", property[0], saved); @@ -140,6 +141,9
> @@ static void test_timeout(int fd, int engine, const char **property, ui=
nt16_t
> cla
>  	}
>=20
>  	set_timeslice_duration(engine, saved);
> +	igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us",
> "%u", old_pt));
> +	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
> +	igt_assert_eq(saved, old_pt);
>  }
>=20
>  #define	MAX_GTS	8
> @@ -159,6 +163,7 @@ igt_main
>  	int gt_count =3D 0;
>  	int fd =3D -1, sys_fd, gt;
>  	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
> +	unsigned int pts[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
>  	unsigned int tds[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
>  	int *engine_list[MAX_GTS];
>=20
> @@ -184,6 +189,8 @@ igt_main
>  			while (list[i] !=3D -1) {
>  				igt_require(igt_sysfs_scanf(list[i],
> "timeslice_duration_us", "%u",
>  							    &tds[gt_count][i])
> =3D=3D 1);
> +				igt_require(igt_sysfs_scanf(list[i],
> "preempt_timeout_us", "%u",
> +							    &pts[gt_count][i])
> =3D=3D 1);
>  				i++;
>  			}
>=20
> @@ -215,8 +222,16 @@ igt_main
>  			while (list[j] !=3D -1) {
>  				unsigned int store =3D UINT_MAX;
>=20
> +				igt_sysfs_printf(list[j], "preempt_timeout_us",
> +						 "%u", pts[i][j]);
> +				igt_sysfs_scanf(list[j], "preempt_timeout_us",
> +						"%u", &store);
> +				igt_abort_on_f(store !=3D pts[i][j],
> +					       "preempt_timeout_us not
> restored!\n");
> +
> +				store =3D UINT_MAX;
>  				igt_sysfs_printf(list[j],
> "timeslice_duration_us",
> -						"%u", tds[i][j]);
> +						 "%u", tds[i][j]);
>  				igt_sysfs_scanf(list[j],
> "timeslice_duration_us",
>  						"%u", &store);
>  				igt_abort_on_f(store !=3D tds[i][j],
> --
> 2.43.0

