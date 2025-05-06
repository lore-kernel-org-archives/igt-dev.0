Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219FAC3ABBE
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 17:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF0B10E6DB;
	Tue,  6 May 2025 17:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EaxZwLx7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD17010E6D9
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 17:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746553031; x=1778089031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mwgx83XO1DuRyh+y4xOSk0V+jDZ6xH3Ohf2Z4UkbCEQ=;
 b=EaxZwLx76YUeFEdqmxaptkhEaCl/6FHHADO/Dw5BRIqGGG+hBPYmDP//
 1DsLOTvHMKNOEVOYNb7j3mI2aabgiVSq470J/nakYcsUaXMOfJMULpsof
 j4o84RqR1Jc/mgLh6vGQlGovQbvzJcfUh6GmME3I/YtDo/9DDvcWquUSJ
 BEKh4BhDVHDO2CHHcH9Rrmj4vsT18V+mrcotffQ4P8J4wJfY6kh/fYi9H
 H4w7HEt8cYneCjMB8syTCagJCkwrG6F6uGVdlg8qbfSqDnq5P/eigguFY
 eY9RTQLirBawy5cji3o00AkMIEhV0BIkbOY9JxzNmVxCEtXiKAoHgKhN5 g==;
X-CSE-ConnectionGUID: F0aeRHV9Ry2nDCqk9X7lAA==
X-CSE-MsgGUID: SSRwV9QZQEaz8il8cvI/4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70747427"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="70747427"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 10:37:11 -0700
X-CSE-ConnectionGUID: kUxglAdiRnG8mpvFQSAmKQ==
X-CSE-MsgGUID: /I2BkQnWQ1SWu4KS3I4GmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="140874839"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 10:37:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 10:37:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 10:37:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 10:37:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xU1zY+gkT2JhirgXTZX69oT3nwDmp/NhSzMUKhK2sZr3VFC5r4FSsfHyXBc6IWB9sUZ87XlKZr3adS5NS1ks6LzSKrb1UnHoSDbrm/Jx5TQISLCm3126bUgrE2BdxUNx7E/j2DnADuFr/p2YrM3bXlfqJcsDxRzpIdB1haOiF06Ot/BUihLHFO9Q/aTEUE1610XfQpAMXieK+NqfZiRSYoGV+zHu75OfbTmyxrIv7Ni4Cat304cNW/bSe/F4BDItTk7M54YulvUuyoGjUuof4tGVGc/jigijAadF/bWeXkx1nAwbDmRpy3Icz1zGwu2F6QYH/Aly2J863+m20qIyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LSNTzrt4QIMysvjiePWiX3/loZOpGU1WEcnRXL+lOc=;
 b=mauXwi8aOAPaIQ7MBtQq5XyxrY/S1HMTNbiAn/s3tpzmzzx1uG2SbCkHfBOd7ODis3e3wIqrOpVUImj/E03VMIojEiOMa6PG4cnx7L0hPpsbvXk+9sa1b+A4h5t8z5BuB608lfBwR5ZY0aFE50EC2XWUB/pSiYBv8pb3vnRda8qL7MsN9I0GT6uJ412/Uuz5xU3K3wWAv5muwKG9+B9xx8LchhYTlQG82awC95CQLOqVHTzJa9TmtRRX7Rf1zP26Gys0MQnk0W+tY/ZtBW/pMgY+zxWC6Ta2AT///wj1dxDT3tnUFlXX6AP3+SQZx5jHUqbiL782CwtV1O95gErzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB7782.namprd11.prod.outlook.com (2603:10b6:8:e0::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.25; Tue, 6 May 2025 17:36:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Tue, 6 May 2025
 17:36:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Chauhan, Aditya" <aditya.chauhan@intel.com>, 
 "Dugast, Francois" <francois.dugast@intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] tests/intel/xe_fault_injection: Suppress Guc
 CT dumps during fault injection
Thread-Topic: [PATCH i-g-t v2 1/2] tests/intel/xe_fault_injection: Suppress
 Guc CT dumps during fault injection
Thread-Index: AQHbvo2GwUCWzFvnKk6KYc0Kezd7zbPF3b2w
Date: Tue, 6 May 2025 17:36:58 +0000
Message-ID: <CH0PR11MB5444D288BE2B76ECD78AA844E589A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250506140351.29612-1-satyanarayana.k.v.p@intel.com>
 <20250506140351.29612-2-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250506140351.29612-2-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB7782:EE_
x-ms-office365-filtering-correlation-id: b8028019-bb64-4edf-688d-08dd8cc499fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RThboKzSXdGcq5Arfjj61xBFkdl76kkqI0AQNI0jT0/wJwgelb2NcqPJsh8S?=
 =?us-ascii?Q?AdFfoHnTM6FnuY06YEDflqtwMlk1co4mvwCBgEn/vxw2O98aV72T3LzpwAKe?=
 =?us-ascii?Q?eeh85HqTaSaz2RFjH79HHpYH4Cfxly1vYukaDmKY/15Q4ORjclCQu9z8fkL4?=
 =?us-ascii?Q?gVd69LZl4jPezatDfRf03IjtQxzaqrsMXEhU0OD8pt6c2YZTaGaNjL4L2bo4?=
 =?us-ascii?Q?45aJoc0FW3P3AvzERm2gk/Suk5fEtiuCu1jneZHHiD901pCUYU0Mdlxa9+SA?=
 =?us-ascii?Q?240U30kvE5dJKMnv4eYqRtXYOW8sR2gAAoL3khkoIxdHbNcYR742zjEGpgly?=
 =?us-ascii?Q?GMHvXoEIS/WD9ZcdqnKCUoS/XGm0nBzQYtC1P5vxvLXvUh2AhqF7OwRByMyl?=
 =?us-ascii?Q?t3DTAS8VdM2Sq43S2DkQon0bJkfNsdUl9dE46iX0NauoBzQJ3f+s+dtriITG?=
 =?us-ascii?Q?pPUELL+Irwk+61IOwUMclP79X8E3sHJTtI1RmLuLU6MPSGS8J3RM7ohhXn0O?=
 =?us-ascii?Q?iGSknbL52GwDUzdb9j7gyPXh2CRmnNDHWgSKA0Xi9ziD/Q682Q0U/9xlj0Os?=
 =?us-ascii?Q?/XowxOD2oLsnGKbZaXmK4ELQuDmVrKoPK+H2zxU5IVZndgdWihdlIFan3uNK?=
 =?us-ascii?Q?29LXBuYzRBlAia7uQMlxAHlXWIfZjFdZ0HqvYpIM6ipTG6B80QLKoZJULrNl?=
 =?us-ascii?Q?CLauYna9e40oCx/gPaQUOXTsZuS2xcJsrV3dvwhVFqpthz9lOboiXU6529nx?=
 =?us-ascii?Q?vPgqDLNG9VlIEhdLyuWemaow2/O3bHzK5SBMkflbsZYdY1mI1CY048JK5KvX?=
 =?us-ascii?Q?golBwuRy3bOA30OHO26g4kQGyLw+28F1hT9Vg/bV22tUDDc2fPVhoJ6g3Irq?=
 =?us-ascii?Q?4Wuh6HaYB+umle/D+HEETStgY2PKwOU74emtC0LfDdCrE7w18Xwr+RD/+sp5?=
 =?us-ascii?Q?06MN9AtbOnSfcbvBMQKWs3bSpXiuZI84kqMn7Hzn/hPSRSZ4yD1QqeVzGSpI?=
 =?us-ascii?Q?t3KFqogO28dZU1i90D5PlAnqxxNwpS4guOz0s5y1qb/C74ZJ8U1dCsaE9GHy?=
 =?us-ascii?Q?r2EfRqyJTrCA1YpS9DVHme6GdZtJBLf67gEfjXFA0xMRMTmdA9oyP6JspFRV?=
 =?us-ascii?Q?abdRt8Gbeku/YFe6OHGkovB5zu1aaagoPoWfF8PTfnA0bSr+4EwpN8gzvaXO?=
 =?us-ascii?Q?gzX1UYr1sRBvCNsiSRKhzn5K+4jrtDSzM6XaixOoSRG+/oyuGDTHJR5j+ytB?=
 =?us-ascii?Q?1ivkguptqhguMfv9qMf9q1zDAV1DJyUawmUlgAGi1pkUIX9hu5sqkVZw2zt+?=
 =?us-ascii?Q?ZLMNedjjaKJZtwMCbZy+XhRKmKu410xEtlU5RIpFc36JIob7Jv3FaqvZhScF?=
 =?us-ascii?Q?v9Za1cHu4CQ/4RMrPOC3pMOvdIhvG5paelCuQUPewFi8BZP5MuSFnGvcXMbK?=
 =?us-ascii?Q?Sev9CTSFUS8HOG3y+iHrWEiaQiSDnDDi1r18QoKqQDbMzbIOEYtjWhKkv8hr?=
 =?us-ascii?Q?iP1saV+bqgflZnw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZVw8jsq2e3EJJieIc/1h85psgv4ynzeFtjgGoysl9rJLWYTNzlrFnnamXmjx?=
 =?us-ascii?Q?v0N38zfmtuiqR9Ofsr7S6Jaq9oVhBKl1nQcWP/yIr/aoAaU1kXf6ElSySzy9?=
 =?us-ascii?Q?2p4R54fXfdbkVLsWAzHYgxkLTaaR40PFhTuUXlL0qWWqWz7JGU0LyCl6yrFl?=
 =?us-ascii?Q?iVgYucd4DECZMP3rWEMTtLLpxEtFaiOrDmvCZnDHb0msE9MBnlJWe0QVpLvq?=
 =?us-ascii?Q?4ahURF6fTTm9bXFI88r8FAU7TEkzF3rbWLF1VtjXp6hW+jfeaf4UGQUn4tjg?=
 =?us-ascii?Q?CP4VD4qC/aW9SZk1edHEQKSILY0DEUkgPsU1wzygUVWajxF81i2FsRX97i7a?=
 =?us-ascii?Q?+slrmNS3KCSpcSaQ999+yVYCMwae+vVJRcS1z/6D3JadgX3cgRvB+NdiQuQt?=
 =?us-ascii?Q?DA0r5Z9KdRDZI6IpxQLg3L7Mh1hVk9piI05S8PeLxL5NGmr8J9G3ldn6x9y6?=
 =?us-ascii?Q?yjJqCSqLhIv1dQ/WsP0EEtDajD8WdNysrzc3BUT4IY1fH2rdpCNCmGNZKnss?=
 =?us-ascii?Q?qDcRRKq+momZeWC7PNwmriYPmY/mrMxiL2D6fmLqyGBphzdBPhOicJ4GO9lE?=
 =?us-ascii?Q?vQLwhDOalW87uUxB3Tnq0ONu5wd+znCg6Zg4g097mT3AG/1eA3nAdAyme2SW?=
 =?us-ascii?Q?1akkXIL9v7pk8C/xffvLsaYNvINhzstuWilExd9A0aFSDAahlRsEYnVLJsqF?=
 =?us-ascii?Q?MJo8fevY9WP4KKvi1mKRctyH+z38ClpYDHoCWl/j6C+5BL7OBt+GNsTuCBzi?=
 =?us-ascii?Q?A/vlueHrQzG9Z6dPWjLB+UvQcpiS57VHxRC+KuaG3Oq7XGEXepW5AY/QWVR+?=
 =?us-ascii?Q?I/NzZO4gkwkzg+hDyB32ycs9KpGpXb1f8wgWeCgqeEWGRhHEwsOBsw0Z6qVI?=
 =?us-ascii?Q?cpG0NyH1cg6CWW2HqYK/Y6AmgvH4E76MV+aZ55RBN0KynUej7g/biYtx22WP?=
 =?us-ascii?Q?FlBYQ9jvKtEociDUjem5OYLwgvJfKJ6QPoBwiAQ2XXej7CnHgah0H9zB+TST?=
 =?us-ascii?Q?YAp8hZcvwbL2/NrAi3yBek9MJBzmscL+m+US7gn8qyT4Uu45TGBd4uuWGFkk?=
 =?us-ascii?Q?cYFwLDbblLfufbUab6xnWFJHxhak56vOLO0mXd9wEg/oxy77CWTb1P/FtPN3?=
 =?us-ascii?Q?Zsh/lxRJVtDQSkzwdmMeEkqbVjUYiQBsjqnC9Vbrjc5oWVwssyqHDyfXgFdB?=
 =?us-ascii?Q?N2dTygseyOUeA8RX+3HEakrzorEoOQLtO0OC+XvmP/1vXrVeRX9gT9jlwkKD?=
 =?us-ascii?Q?iywo61+OSQEZuyO5gvM96CMKo1fUa9IJAUiF9aGUJcMGAlu/opJJmGW6rh9X?=
 =?us-ascii?Q?sLFAn2PhXqKKdLHsj2dXp574E0B34Qf8HULTdMHiL+MN77TVSC4pHCXDj5QL?=
 =?us-ascii?Q?Lmj58BNIJxkyjbKe8UEPUjaHG1n0bY6sVy68zipEbqtk9eL4GRINh7sYJ+Gm?=
 =?us-ascii?Q?4l18atV63ROGHAjx5YBlfWb1f2IZXqPP95TFB8YQaMwq8l51GKXFh2HdFVvv?=
 =?us-ascii?Q?HMg7z5PX2qh9pdmXsjF2ECcZyXwojUGcefyarslqbqMlfAz+dNuT13CdP5ih?=
 =?us-ascii?Q?JETWOUu68V4ihUVVUO7JQ03P6mcChYMVgWZDMYug?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8028019-bb64-4edf-688d-08dd8cc499fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 17:36:58.1013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZxm7JFXRA2FGE39GIkAeMezitdOU+9gz6e/UEOkl/4ukBsmkZg4ZXcQnuf7IWs9nGvjZ5MQ4XecT+Yxx0/tTcrO3xcI9dsPcXqCO0xm91A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Satyanar=
ayana K V P
Sent: Tuesday, May 6, 2025 7:04 AM
To: igt-dev@lists.freedesktop.org
Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Harrison, John C =
<john.c.harrison@intel.com>; Chauhan, Aditya <aditya.chauhan@intel.com>; Du=
gast, Francois <francois.dugast@intel.com>; Laguna, Lukasz <lukasz.laguna@i=
ntel.com>
Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_fault_injection: Suppress Guc =
CT dumps during fault injection
>=20
> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> functions, the CI test systems are going out of space and crashing. To
> avoid this issue, a new helper function is created and when fault is inje=
cted
> into this xe_should_fail_ct_dead_capture() helper function, ct dead captu=
re is
> avoided which suppresses ct dumps in the log.
>=20
> Inject fault into xe_should_fail_ct_dead_capture() function along with
> xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct dumps.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 602e4cb39..82d730a7c 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -121,6 +121,22 @@ static void injection_list_add(const char function_n=
ame[])
>  	close(dir);
>  }
> =20
> +static void injection_list_append(const char function_name[])
> +{
> +	int dir, fd, ret;
> +
> +	dir =3D fail_function_open();
> +	igt_assert_lte(0, dir);
> +
> +	fd =3D openat(dir, "inject", O_WRONLY | O_APPEND);
> +	ret =3D write(fd, function_name, strlen(function_name));
> +
> +	close(fd);
> +	close(dir);
> +
> +	igt_assert_lte(0, ret);
> +}
> +
>  static void injection_list_remove(const char function_name[])
>  {
>  	int dir;
> @@ -234,6 +250,10 @@ inject_fault_probe(int fd, char pci_slot[], const ch=
ar function_name[])
> =20
>  	ignore_faults_in_dmesg(function_name);
>  	injection_list_add(function_name);
> +	if (!strcmp(function_name, "xe_guc_ct_send_recv") ||
> +	    !strcmp(function_name, "xe_guc_mmio_send_recv"))
> +		injection_list_append("xe_should_fail_ct_dead_capture");
> +
>  	set_retval(function_name, INJECT_ERRNO);
> =20
>  	igt_kmod_bind("xe", pci_slot);
> @@ -271,6 +291,8 @@ static void probe_fail_guc(int fd, char pci_slot[], c=
onst char function_name[],
>  	for (int i =3D iter_start; i < iter_end; i++) {
>  		fault_params->space =3D i;
>  		setup_injection_fault(fault_params);
> +		/* Clear the injection list  */
> +		injection_list_clear();
>  		inject_fault_probe(fd, pci_slot, function_name);
>  		igt_kmod_unbind("xe", pci_slot);
>  	}
> --=20
> 2.43.0
>=20
>=20
