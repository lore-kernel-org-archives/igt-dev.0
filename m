Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5591FCC9D4
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 07:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7762510E208;
	Tue, 10 Mar 2026 07:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdVQLb/h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D683510E208
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 07:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773128077; x=1804664077;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tK3KQFSBQaFCsmyEDY42Xd0QA2jO6vIJzYSRhNr0c0A=;
 b=MdVQLb/hxok/xnxNqt8TwF+xVRv+cEhpTNP2BNnrFX11MamcFpy8Zsxx
 SZrjbz1mOLI7PUeS0LzEmI520ZHC7fPo92O/XyEftE/tJAb5DkSfIW1Ju
 xtC7Djgb6CvtTEu9R1mrOJjSFPWj2nbJRmwX0a26HXA9a3tNBc2Neg54u
 2y0jPZkytOVzNIAuL2m7qVzaBws2ZK+NuH4HYZAMVP0KCP0mOKHBcRl/k
 GI2x3nD9fvZ1pToQd5dLdDEMcY6p+6ZjtW75jR43yg3FxZhpv6UGoHlWv
 0u1Un51PoS55Hx2F5RSpvczGd7t7YDpEV1TrjBVP1xGbdRZoPLoJpzb0n Q==;
X-CSE-ConnectionGUID: ot4ZJWX3R6uUcwSqizA80w==
X-CSE-MsgGUID: E0aGLSdqQhy4pWb8cCXrlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78043316"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="78043316"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 00:34:36 -0700
X-CSE-ConnectionGUID: 6sdWq6m0SDqkGuLrGa9nUg==
X-CSE-MsgGUID: gJfbarwrSdqxJNveSqPZ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="220062371"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 00:34:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 00:34:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 00:34:33 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 00:34:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGwYfMkB8GrI9xIMZdfhSnFANEaXmqlDW3i7YhzyvVkNZC0eCdir3PaYhqWttVr3tu/4G8tgRHvQsczIiHuSsv6NuGv7WbBxoaNVs/2pn9KZXzU8mDRgPXTI3NWdLvkVRZFrVs0hZtN4j/1ca/dBrrRs+pdIMgnBcxINUOiiwkAkq7u1RD4Sa2RVqoIVPkIWLSwsTP077PJyUobuIkx49szrHOUI+xInJB5mWY5T7DlL3G+8EgvUBMfYP0lWSdyn9z2mDnzS5l3gRH7zjEkDKmot9Y9T7OIEhJtiJPJdPaMWa1E9APRj+pWrbeBAPVRlaeqJ90gjaa5R7GCFsDRYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9l1X8FE0an879RdRJFKsZalUUFyzDzFixa5PS1QHmA=;
 b=hRhuJYnanFXG0zlSkkwqQh/UZyUvWU7iVx7plVjiLIikWrc4ztntiezjR69zAijBovJ+VaB+xrtzn5mL8vgrvJofBf5txxjgjLW0XugZe1rvRRUGo77pPyIA2XfYXAPtJeR7Ehuba7yoGDFAomeoGcZEtxAuOfl1dLo0tPn2td1ZwBjBCNqtSSwHLM7qKmsgVOBpHGz7WnNkwq45DfAT7xHkD5rw8Y+SZ7EGAmmNEWyVjKJgd14r8L56oU8gNF/q3EE9b1OTw26uqh8oVuH0f1he33QHZHllDa+k5hn9EyrNt4NVKXDYEYs2x/8oi5DyJJCnRaYknJxvemjcZPsB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by IA1PR11MB9520.namprd11.prod.outlook.com (2603:10b6:208:59e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 07:34:32 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9700.006; Tue, 10 Mar 2026
 07:34:31 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brzezinka, Sebastian" <sebastian.brzezinka@intel.com>
Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Topic: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Index: AQHcrIMfz/3MB6bA2EiTRrDZJ7K5FrWl86KAgAAF0ICAAT5QAIAALyZw
Date: Tue, 10 Mar 2026 07:34:31 +0000
Message-ID: <MN0PR11MB60345C6E4B5CF1715C0E3DFC8146A@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260305093025.3107101-1-mohammed.bilal@intel.com>
 <20260305093025.3107101-3-mohammed.bilal@intel.com>
 <DM4PR11MB6312FBDCA175D13650AD0EFC9079A@DM4PR11MB6312.namprd11.prod.outlook.com>
 <MN0PR11MB60341CACB076517AC25B5E548179A@MN0PR11MB6034.namprd11.prod.outlook.com>
 <DM4PR11MB631239D62A96477BD1FCF6A39046A@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB631239D62A96477BD1FCF6A39046A@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|IA1PR11MB9520:EE_
x-ms-office365-filtering-correlation-id: 26ef2bcb-37ae-4342-c855-08de7e777852
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: 1umhcAEATcQvaxHn9QG2xNh6AMnpNQL6oyYNfA9IMTMvW/ckzmrxOhIFoO3s/J0r76fammUnn96qI7hA3awbc5zRmUfYLe+l9QuJhD9dnmTCXOpp4iwGir+Dd1Mb8XuZYpe8Ctw2LYCp4vsGTQaovOjuy2LqsE0YIS+dNcCXE9LmjVqcpKhrZbIK4yKFrg3JaCXp4gSUy5ry5zM94TnDeF6F8IncGJYZ8l0lzyoC3fHw8ni+7QJvWfoGdjdUxIbH0KBc8zCA/J0cQOQjkW++l5WTdQvnhtYip4jmgNKoi98iwLlxYkb2AH+o/Y/Q2YQ4mfqiU/liDCx3hmV9/MYqzD+YqjlEtLRqPQFdS9+4MvYTxKKgRC29JLgvYVUUXMQw2j4OCOp0gq35ekJx/SDhIeHKavsGKIT9gdoQJqnfmR4Zi3Qi5kRi0y8G8NQcSzObn/hTX5+gRbcUImqp+26ph/0EEH9w/vCDgH0iQDfWDYKO1CNlx53CKqaXe8pj2IN2q/WoRNg0kSS7WNvzhImhGynPROSCIpaQ1ZIxgck0uvWClH9/i4e/VKGGSBbfcFI465ICnboDzfPK36bZHi3/lU4hC4Z/U5qUTPCrRc73vqQHITpXcpREntQ76VFtFzWYaDEcbu5aSmuYwNTm6CiovkJH3J0/koCEY0+tLgslWxP9o3nVFGP4xewHfQ3x2kHhlLuzggZ3fbNSe0Qe6fHTzYZNaesM47yHKcspecWhmGhwM0kOqKY1PzYcKfDktXb6og0xMhLnkRFl6tlq5DtaV5gZHyerKeWzRb1qsZjvdNQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ydoHcloNGVTb1HfqK//pI9hBWLhGQmYTtw1pq5h1k43Bg3xs0RZYRijwQ2dx?=
 =?us-ascii?Q?DI4c+Wlrlja+i/WjgExqOh0iILHuTBc193UPUe6wj09a08r4uVPQ9afQ52iA?=
 =?us-ascii?Q?pj3dJX+Pi3jsNTX8Kj8cM+gHM8uFNsrEejRvNfkfxAzwnow1UQtYKTuJOWlP?=
 =?us-ascii?Q?Z2+5o4bN0eyTsC6aMGcrptQjqUc9oM8nv8YXGBz4jNjD0PxbVPpW5I6ZggRS?=
 =?us-ascii?Q?3vxZizc/tgn6eGqmIs9iAQ9dryvy2+VCgifp0Rxy5OhIE2/6C6JJx3nlKpZY?=
 =?us-ascii?Q?THu5HMTE7C8iJiySZ9pThgP9cCaQ7L11RL2oXzX8X54eVOp9TE+hKfbY02CL?=
 =?us-ascii?Q?lzWdhWs9kott2ooQq6kCs2+CUpS96A1pJQdnsJlBxIUU61yQ2EUJ8GR/Yn3E?=
 =?us-ascii?Q?rAbLZsllV6ndYDFnqIApFYnf1aPzVl6nQQfL9oHFKsdAPDlgredq3gF0A+yf?=
 =?us-ascii?Q?U59JRopzRTMECpzvctpFQ1MXoNWabR09VABhq9kX3dqODV5T2HwLAH5/YMPy?=
 =?us-ascii?Q?RUOy1BBmG41CkmBm/EKSe+61tsodPcyDBwiI8lECMHD0VuYPv8VcmKnbfIPK?=
 =?us-ascii?Q?ZJTW9z12Wdil8D+hntdtRW59JeuU/xRL0BX/QeJpqr8RvDp+kLTym5SzQ9VS?=
 =?us-ascii?Q?nhQCrVs4fHQ8z0EZcLTR8W6mPz/qeGh9xh3Y44TystWJbUmFJ8wAPHPLvXKl?=
 =?us-ascii?Q?pWOmmKsjnraj9aTvIapXngTO+6B1ysVUZ06YDrRoXB69NfimnO3qmb5qNxMc?=
 =?us-ascii?Q?KeZx/eQd94GdGGmtlPNPtPQU0IEaXoc6URBWfBO18t25mjdXFVhCMlVrge7j?=
 =?us-ascii?Q?sZmAvm5QTSbxFpKpkfU/BTBhcMt//c5G7bck0w/NbzIhz3MTxdBPzsn0Mw1Y?=
 =?us-ascii?Q?HyzIaQW82cSeVyYiRuaT0KlqiBjX1qsomFu/UJwkf67twude18EkMSawfOUI?=
 =?us-ascii?Q?8yvXsW/RudSpZsCCqtmXNQl9YwrbakvuV4ctC0zLIX6jdIqoI1sv3ongF600?=
 =?us-ascii?Q?4uK52PViI6YOZ/0A9ZMXz6KHGMj7/FIOZx7DB5VIwl/yXsUUDwmRfoRcpObi?=
 =?us-ascii?Q?3ndgzS1XxN7AVLgpv2IfYQR9HznuXe8Jft3lYGUXM7JNbOOvsao7n6CaAk8j?=
 =?us-ascii?Q?sFjzHxBf6kpJVxLoHJwmf4bs5A5miWJu7eaSYNMJfDucJJUYtrCg0awSdAIu?=
 =?us-ascii?Q?CF0KhaJi1WDNO2vnNYh0gaL4h/TQn0x0zekZL9IRmroJu92/RtFtMTVZgrxU?=
 =?us-ascii?Q?zbh1is4TZtMifWrX+yN9R8V59jbJ7lE4p4gpAzEvagJ9D9mDdzDNK3408dcX?=
 =?us-ascii?Q?rj6qS58G+A0uELFqGoBCcCJ1tqNJjpYl+G15yuvCdNCUP/FQGeNr3uciuIAC?=
 =?us-ascii?Q?DK+u5ipwO3MUIuZc8Rg0lTekusAO6rwGkdEOTUTwIQhGjq6lLrSXwYLzC6UM?=
 =?us-ascii?Q?F6bWbkZOVmUii7/Rcym1bkVYSz0gRylhP2xRNG6l2xEJxHVvRoJChgJYVDoH?=
 =?us-ascii?Q?gWBfkylzMGMtbuS+I5BtiDHFrFECRMIH7zwqcSI+BuBiRtr5Lf2cgYJ9DP6O?=
 =?us-ascii?Q?7wWdL9nNRGPMEn3fFqOuVgCRVT3irJNjUIJP+WnhrOfLfNUjYKHabLehdreO?=
 =?us-ascii?Q?0pswh26W457zeoSV6yJin4BKtQbPZIeKB399MetKmb6udaG9/T265dYnUSvD?=
 =?us-ascii?Q?RmODoURWFBSJeB8Bq/qU+xRWPu3DicXmLft8d/pb5P2fqEMPZmhGQ+kqZp/u?=
 =?us-ascii?Q?rSSVEHb+iQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: J3u2GLd321z9XKHkJT3BpzOedVl+5hqvGom1FI0tTng4Ss3dysVwti5WXunovBNb/vuaVR98dExPXo02tpDs874BDm71tbmwVfMGYhbFAs8qpRmFXThOY77Z/0Oo8OynGERB7vB0Kcxu/5pW1B0ArfOVmJqYmrq4YnCYqeZRopESo6boAMZBoBn/pLlIZFzn/1MvTS2MNE+VppCXRvxgvnsktwNFbhkuLUDRnKuB1nrj6HbD7NMn79bIUcVLV5J87Vb02w2hIWJ7YJHA7V4LPrZ1IfeQ4mEJZZBY3VD6dvUPJEBRWQsF6ATTP1TGnkTfZUi8XXtr6Hq8BhVSFp89/Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ef2bcb-37ae-4342-c855-08de7e777852
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 07:34:31.7460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZPOE47duy+VBvfjz1bEdnmtdY1ZMZGPByUj5gZGGWEK+E6iJ7C3QiChs70W3NaHnDaw2hn10vVsT8X3LmXf4u+Rhlb/uRvjDxnWvNlXXfms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9520
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

Hello

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: 10 March 2026 10:13
> To: Bilal, Mohammed <mohammed.bilal@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Brzezinka, Sebastian <sebastian.brzezinka@intel.com>
> Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
> assertion failure
>=20
> > -----Original Message-----
> > From: Bilal, Mohammed <mohammed.bilal@intel.com>
> > Sent: Monday, March 9, 2026 3:20 PM
> > To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Brzezinka, Sebastian <sebastian.brzezinka@intel.com>
> > Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks
> > on assertion failure
> >
> > Hi Jeevan ,
> >
> > > -----Original Message-----
> > > From: B, Jeevan <jeevan.b@intel.com>
> > > Sent: 09 March 2026 14:53
> > > To: Bilal, Mohammed <mohammed.bilal@intel.com>; igt-
> > > dev@lists.freedesktop.org
> > > Cc: Brzezinka, Sebastian <sebastian.brzezinka@intel.com>
> > > Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource
> > > leaks on assertion failure
> > >
> > > > -----Original Message-----
> > > > From: Bilal, Mohammed <mohammed.bilal@intel.com>
> > > > Sent: Thursday, March 5, 2026 3:00 PM
> > > > To: igt-dev@lists.freedesktop.org
> > > > Cc: B, Jeevan <jeevan.b@intel.com>; Brzezinka, Sebastian
> > > > <sebastian.brzezinka@intel.com>; Bilal, Mohammed
> > > > <mohammed.bilal@intel.com>
> > > > Subject: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks
> > > > on assertion failure
> > > >
> > > > Fatal assertions can bypass cleanup paths, causing resources to
> > > > remain unreleased when failures occur during audio tests.
> > > >
> > > > Replace fatal assertions with non-fatal checks and route failures
> > > > through a common cleanup path to ensure proper cleanup.
> > > >
> > > > Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> > > > ---
> > > >  tests/chamelium/kms_chamelium_audio.c | 42
> > > > ++++++++++++++++++-------
> > > > --
> > > >  1 file changed, 28 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/tests/chamelium/kms_chamelium_audio.c
> > > > b/tests/chamelium/kms_chamelium_audio.c
> > > > index 2967e3c50..201be0ba2 100644
> > > > --- a/tests/chamelium/kms_chamelium_audio.c
> > > > +++ b/tests/chamelium/kms_chamelium_audio.c
> > > > @@ -389,11 +389,11 @@ static int
> > > > audio_output_frequencies_callback(void
> > > > *data, void *buffer,  static bool test_audio_frequencies(struct
> > > > audio_state
> > > > *state)  {
> > > >  	int freq, step;
> > > > -	int32_t *recv, *buf;
> > > > -	double *channel;
> > > > +	int32_t *recv =3D NULL, *buf =3D NULL;
> > > > +	double *channel =3D NULL;
> > > >  	size_t i, j, streak;
> > > > -	size_t recv_len, buf_len, buf_cap, channel_len;
> > > > -	bool success;
> > > > +	size_t recv_len =3D 0, buf_len, buf_cap, channel_len;
> > > > +	bool success =3D false;
> > > >  	int capture_chan;
> > > >
> > > >  	state->signal =3D audio_signal_init(state->playback.channels,
> > > > @@ -426,9 +426,12 @@ static bool test_audio_frequencies(struct
> > > > audio_state *state)
> > > >
> > > >  	audio_state_start(state, "frequencies");
> > > >
> > > > -	igt_assert_f(state->capture.rate =3D=3D state->playback.rate,
> > > > -		     "Capture rate (%dHz) doesn't match playback rate
> > > > (%dHz)\n",
> > > > -		     state->capture.rate, state->playback.rate);
> > > > +	if (state->capture.rate !=3D state->playback.rate) {
> > > > +		igt_critical("Capture rate (%dHz) doesn't match playback "
> > > > +			     "rate (%dHz)\n",
> > > > +			     state->capture.rate, state->playback.rate);
> > > > +		goto out;
> > >
> > > After goto, the stream will be stopped and the test will continue.
> > > The test should fail after cleanup.
> > > We can add a flag and assert after cleanup based on the status.
> > >
> > > Thanks
> > > Jeevan B
> >
> > Thanks for the review .
> > If you look at the code flow, the failure is already handled through
> > the existing success variable igt_assert(success);
>=20
> I think this assertion is triggered only after all cases are verified. If=
 the first case
> fails, there is no need to continue testing the remaining combinations. T=
he test
> should assert as soon as the first failure is detected.

You're right - the current approach runs all combinations even after a fail=
ure is detected. I'll add an assertion=20
after cleanup in each loop iteration.

Thanks,
Mohammed Bilal

> >
> > >
> > > > +	}
> > > >
> > > >  	/* Needs to be a multiple of 128, because that's the number of
> > > > samples
> > > >  	 * we get per channel each time we receive an audio page from
> > > > the @@
> > > > -447,10 +450,6 @@ static bool test_audio_frequencies(struct
> > > > audio_state *state)
> > > >  	buf =3D malloc(sizeof(int32_t) * buf_cap);
> > > >  	buf_len =3D 0;
> > > >
> > > > -	recv =3D NULL;
> > > > -	recv_len =3D 0;
> > > > -
> > > > -	success =3D false;
> > > >  	streak =3D 0;
> > > >  	while (!success && state->msec < AUDIO_TIMEOUT) {
> > > >  		audio_state_receive(state, &recv, &recv_len); @@ -460,13
> > > > +459,21 @@ static bool test_audio_frequencies(struct audio_state
> > > > +*state)
> > > >
> > > >  		if (buf_len < buf_cap)
> > > >  			continue;
> > > > -		igt_assert(buf_len =3D=3D buf_cap);
>=20
> The original assertion ensured buf_len =3D=3D buf_cap. With the new chang=
e, you only
> check for buf_len > buf_cap. Therefore, when buf_len =3D=3D buf_cap, the =
code will
> continue executing normally.
>=20
> > > > +		if (buf_len > buf_cap) {
> > > > +			igt_critical("Buffer overflow: %zu > %zu\n",
> > > > +				     buf_len, buf_cap);
> > > > +			goto out;
> > > > +		}
> > > >
> > > >  		igt_debug("Detecting audio signal, t=3D%d msec\n", state-
> > > > >msec);
> > > >
> > > >  		for (j =3D 0; j < state->playback.channels; j++) {
> > > >  			capture_chan =3D state->channel_mapping[j];
> > > > -			igt_assert(capture_chan >=3D 0);
> > > > +			if (capture_chan < 0) {
> > > > +				igt_critical("Invalid channel mapping for "
> > > > +					     "channel %zu\n", j);
> > > > +				goto out;
> > > > +			}
> > > >  			igt_debug("Processing channel %zu (captured as "
> > > >  				  "channel %d)\n",
> > > >  				  j, capture_chan);
> > > > @@ -489,6 +496,7 @@ static bool test_audio_frequencies(struct
> > > > audio_state
> > > > *state)
> > > >  		success =3D streak =3D=3D MIN_STREAK * state->playback.channels;
> > > >  	}
> > > >
> > > > +out:
> > > >  	audio_state_stop(state, success);
> > > >
> > > >  	free(recv);
> > > > @@ -587,6 +595,7 @@ static bool test_audio_flatline(struct
> > > > audio_state
> > > > *state)
> > > >  	recv =3D NULL;
> > > >  	recv_len =3D 0;
> > > >  	amp_success =3D false;
> > > > +	align_success =3D false;
> > > >  	streak =3D 0;
> > > >  	while (!amp_success && state->msec < AUDIO_TIMEOUT) {
> > > >  		audio_state_receive(state, &recv, &recv_len); @@ -595,7
> > > > +604,11 @@ static bool test_audio_flatline(struct audio_state
> > > > +*state)
> > > >
> > > >  		for (i =3D 0; i < state->playback.channels; i++) {
> > > >  			capture_chan =3D state->channel_mapping[i];
> > > > -			igt_assert(capture_chan >=3D 0);
> > > > +			if (capture_chan < 0) {
> > > > +				igt_critical("Invalid channel mapping for "
> > > > +					     "channel %zu\n", i);
> > > > +				goto out;
> > > > +			}
> > > >  			igt_debug("Processing channel %zu (captured as "
> > > >  				  "channel %d)\n",
> > > >  				  i, capture_chan);
> > > > @@ -661,6 +674,7 @@ static bool test_audio_flatline(struct
> > > > audio_state
> > > > *state)
> > > >  		}
> > > >  	}
> > > >
> > > > +out:
> > > >  	success =3D amp_success && align_success;
> > > >  	audio_state_stop(state, success);
> > > >
> > > > --
> > > > 2.48.1

