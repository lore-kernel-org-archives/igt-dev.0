Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7440CCD1AB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 07:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8977310E708;
	Wed, 22 Oct 2025 07:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XKndpEk0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C878C10E030
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 07:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761118901; x=1792654901;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=El8UWHjmm7CnaahvQORjotiP9R2QHbhrjwSmxPTj2wM=;
 b=XKndpEk0d2twfeQIr5f/TDG4vZ+vrTVlDUC7tXrcvUJuq5ZK1F5r8D29
 cfwE12tjb2U017mjVgxK+B+3l1zsqnjp3QZkYCTy9v0CkN0JDyJ0Hrct2
 gUGSPevbyFq7snVmQVdGdKhT7ckE3NOkiugZRCnK0kFdiXALDkRSROtAW
 hFyJNV3p/nMO7b2DJIC8KuRuW+ydJQnhsay31SEydv2k1tBHTe+IJvWo+
 u6Mo2OLAa2Y/Ps1ZaZj1A0lX4bEVwdW7NEEGP0KRoeBdS8itt0mZNF2K3
 PiqUQse72SzVWc7AZC2F9ISzi5hDjKgqCoRRxBcO2dwc3xMsLWa6WTN0J g==;
X-CSE-ConnectionGUID: wKZmuasIRfO+yLkpgMMGDg==
X-CSE-MsgGUID: Zwss6twUQOOcME19FJRgVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62289137"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62289137"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 00:41:35 -0700
X-CSE-ConnectionGUID: RRlY+0KUSoeYuwKVzHpbeQ==
X-CSE-MsgGUID: ZgqpqBsZSo6iEhr2NgnVjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188079201"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 00:41:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 00:41:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 00:41:34 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 00:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwIQ85Rg9xvj0h83spAx/5kxEZlw0tZdmEYTq1JIT9B+aGy0jqry0wN/kBuu1dqcMQMvr1Rj/BRATxXJMbx1fbbJM39BBLpQzQZBIRc1dUVFocDigSHRWxphem0erTjCYhbPfEt3c75VLI5G2nMh+NCt4WVDwLW7dZSz40szJ7YowtCxVjqMCXEQctU6g0dcwwsnRBczOTTk7QjTi7gDYj6/+SmeBhXctq9ZXXfQTHc0AfQ9JKwtSANTLDv/29QdjXzsGdypHnkx4p+lupVUXfsGn+g1U6p4fk0TKAFO86gzNrSMSEkM7hZY6f5No1q0iAxdzBSSKwp+cedw26VOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIOUA/h1nA3GNfrACIu4qTLnbp7Noh7XD/Z2AZB1op4=;
 b=gGgEYrV3tKy7i0ZPL+vFpBxuNmRjnWLxxSL5bIdnCSMMPvpTbDnUTylO4L7cDEuscI8HqnaL2BojLYHPz5FN6BdjmXwZ7x2nkNj7qgxGxPXy5LXTxOVLyAinhLGR+sMXx3sn/Rp6O0FHaDV2EbcC7R0FJbK2mAP0WAGIpqdWlBVPvDb4EAKm7IkBJcTlv2PdOmB/nayYQvCLZsLZDUv2YdTfhkSksBjO6qQfmZun33GFuATYQrPYaO5GSEY/P8YJu8IyG8h9apnQahw+RlH11MFmyHMNaQbuijS6BvfILJOe9soLgP5CQLrxobVxP/a9YihXzJGsb1Ek++KH15rtiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by PH3PPF496D5EAB2.namprd11.prod.outlook.com (2603:10b6:518:1::d1c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 07:41:31 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc%6]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 07:41:30 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "B S, Karthik" <karthik.b.s@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Gil Dekel
 <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 "Project_Global_Chrome_Upstream_Group@mediatek.com"
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: RE: [PATCH i-g-t v2 3/5] tests/kms_content_protection: Exempt outputs
 with no EDID sink name
Thread-Topic: [PATCH i-g-t v2 3/5] tests/kms_content_protection: Exempt
 outputs with no EDID sink name
Thread-Index: AQHcQrGys/UleFFOIEWFPJPthsW3fLTNyPyQ
Date: Wed, 22 Oct 2025 07:41:29 +0000
Message-ID: <IA4PR11MB925142A61A3E7ABF695939A899F3A@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20251021173912.4050926-4-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|PH3PPF496D5EAB2:EE_
x-ms-office365-filtering-correlation-id: dd4dafe5-c76d-4ae9-1c12-08de113e6a2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?R3+jY4TDL+Ii1WorQIaTCBLbPdwyTnIxnBxRPm50QwBC8PStyNXHo+5BCZ3h?=
 =?us-ascii?Q?VWct9BzinDrRwtuA5ldHurLL/zlkzXeIm9RhSMe/kSMvyudllVzt4ckCk0Hj?=
 =?us-ascii?Q?s2Ceq5eEX80/7kNSJ6cOgRAlh1onqU1jVX8CD9LMOkRTkf6E89/JCRiJywsA?=
 =?us-ascii?Q?A5vyx0jNxYbOGLR3l8MRvhq2R4GeueDl5/aAwB1N7OQEUkl1fIgPo67l9xF9?=
 =?us-ascii?Q?Xr9hJymOeDufz75DaUS87/gIOb9noUc+tg28X2ViEh6nge+ahYuH5HsiIniO?=
 =?us-ascii?Q?rtzDOvJR31906OPP8jmTCK9/Wwv90Onno6wan3OoAtQ8wNlejBPL0bgvpg6v?=
 =?us-ascii?Q?BPmeui4kyfJgLVCMMClyg99ZIx3q5Rg861EN9R7Xuj5M5HVS72Ys6PmeQtLW?=
 =?us-ascii?Q?PLRiayJrkahlCAgSC+I+o21cSN6q5dp1xb5Ukm7AGK422M5KEQ4pE+RzUS+U?=
 =?us-ascii?Q?7csxJkOsBOMEB5iDl6d/vrekEu9bO3iKhgwXXqn4baxQ5HfmpkJmU8i9evYr?=
 =?us-ascii?Q?alWVpQ5uGs7YqRlKGI4WxmZ5USzt6XmO5xJG66ikcpG1cRQhNAjq0LyE9zmo?=
 =?us-ascii?Q?dZxKt1pO1A83Qi6QcwJXuNS1+tQ6QNSEclepxRbDPtFJQ2hiBH1NRGhs9LkW?=
 =?us-ascii?Q?0PgobNwQhuW/QtvjnhsI/EIh/CsnyApHuZuu+f5U7c2UULVV+LZ/2j0nAfDY?=
 =?us-ascii?Q?k2ITXTAvgFEtzlWASkCciKevpJpcrCAV1Ot341cstz19P8oezNGbP4tmxMWt?=
 =?us-ascii?Q?xczRLeiRO6rSKOabGxiNGSHsbTX8ZUTQK5Yf0LRB5nN9kqqj6tGC+4YFt4kN?=
 =?us-ascii?Q?v+HeV6mh6OkLQv76fWK+petqKV/WuXQUhIWPCzAw9C1LJj6bq0VhLKR3M/tb?=
 =?us-ascii?Q?YplFb1ydkC2bT12um+82mkRJHtwVB9Va0DfPn9n1JdzuQ+gKEa5FN288Pj1p?=
 =?us-ascii?Q?2ouy0UGtBA+ezE0W4v5BNSuzwTKfQIE5ZOTt29tXyRD7KYHZyAs3lHmT0HlD?=
 =?us-ascii?Q?Qd3xNIAmfrqugKCP7CRKTMUsceKWyupSJkV2rLNhu65Ae8XQt310gY2ARGgV?=
 =?us-ascii?Q?196OmUyybfInMAR8DwMClmsGIZdzgAwGJV26YaXrtl71TmJuBl2jWwFElMXQ?=
 =?us-ascii?Q?YtcpTHzLoCCiEj6ECR9i83Q/FtUb4cyLHW062uGr/itn0jnIT+6nnYUVZ8+r?=
 =?us-ascii?Q?ONd7OxQcj5yc97/DRB18m8zy6GzyzrXo0y4MX0cfuKY8htWJcgjX/d39WqYC?=
 =?us-ascii?Q?PKhTKRkZwKlftNgFFuZNnFlxvzSvTVkJfZY+wb1LDM5bqQswC0O/y1MXDIPs?=
 =?us-ascii?Q?bPPaPPyA9YmIWI56mxdMbxu+sTIFGemxHru7MMh8z0AV3+5BEJ3bxJZE4cxn?=
 =?us-ascii?Q?GPwSkgJp946qnfq7cu2Q8OCcjZM1enc22lPM8C2SvzilS4hFcgjlalHBmTEa?=
 =?us-ascii?Q?kzL7LbxIXPVE1vWWAlrhCoIoGHP9juL8h++5wIKZwALaGjITbCztS3HQy4DY?=
 =?us-ascii?Q?x51pFLvDRFrYWiyoBEq90i7qY/1dq8E/eBF9tAL78j1vw1CDDNjSGY7neA?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wQIMu79IGhUMVq9sxtYMhyLSw+1cLPKhrxSDpwAnP3vOKGIdssVLkSAZhcEb?=
 =?us-ascii?Q?mPEQoQAO5nsVe++QyxQ6Nc7MHrCKxqHnJ1BKEl3tICV7UHy74i9ya9VxVRWw?=
 =?us-ascii?Q?2CwlYgHJpddDUsgCEN4qimON+DdzlLaA95woDg8eg1CSFRPilNyFQhaBewae?=
 =?us-ascii?Q?onRUCHKwPto1+OdMtELhqSdsqLjIkuOPkwtaQVC5pjACr8Q7eoPfWUhoXmHN?=
 =?us-ascii?Q?GB+B6FGUhQ8cBMWUiwm8FE+26ZUvHLV+728/+li8ObfnCj6Y9ntDYTxbiBaT?=
 =?us-ascii?Q?PNhcYZzBXy6cbG6cgU6Ls2/tiKv6bz0lnFf5zuAnJcdx7FncVZc7L5xZbcYm?=
 =?us-ascii?Q?HkCGDXHxW/7E/9gX3/t+xzPS60osukunM8xPoL1njlYdLBaiJzP0x3XWLGqG?=
 =?us-ascii?Q?hHU13DOhsrVsJS99gFX9EZsOMDPm3XSeq0SYknIJbLvOCJuwS17I9V4G4hTz?=
 =?us-ascii?Q?/vrsblZc0QpTqf/qrZsRjE+R2rBnV8xVq4lBX5vBhGDqCULUFl7zqqkiHRCz?=
 =?us-ascii?Q?XUeJXWxdSYdl698noqVaVxJh/7Facf6DboYNsAi4bqPfvBt82ylgB0tSMNEq?=
 =?us-ascii?Q?uqHspYyEWCpN0m0Aq54yJkOY+WbmwFHcy2VUftRtfE7p2ya+coa/bLNafeuk?=
 =?us-ascii?Q?iBuRSr7rhLY+6X2i0GT9pQ32atf1JMYQSO25GzVRbqu43I6zmIgUBllhm6AS?=
 =?us-ascii?Q?BtEF5qhn5nf6KZ71zGxn5oO6intzWA9tTEESh5UqKS6eYOLfbgeDgTD2MVZj?=
 =?us-ascii?Q?auorNCWwX6K99U2GeKLdG6ukkgj/jdGa8tMC8OCEeEeFH+O5VamUbN5epJdc?=
 =?us-ascii?Q?8FmD7F99cHNWWwgbKX5l5JA6M1r+1y4l/r+QPVHqQFWMiHVrPKhSZl4vuIw+?=
 =?us-ascii?Q?GtjI/rz6UJnl69oNBbEWBgyDe2LCcqj/EbIb+T2v3e7uX74TDe2jPK6jl9QG?=
 =?us-ascii?Q?B5Uz2zynYlMOWXgwb6PIEXxt76Ax9fgmmdfOl9QtIVQBc0enDsrTz5DcPIPx?=
 =?us-ascii?Q?GKlXgnlDFTQvESDPRcnPb9pDy8VwMlGsgn3I/18xYhMZdFSODN2ye73Dku9y?=
 =?us-ascii?Q?nWU3hB8Mk9BIyAG8STXyRnouptaVvxaJlr6tnnxBJXZJ0lBZsC6y/X93iNKI?=
 =?us-ascii?Q?/6fuGSDrvc8ttpKNvOGdnbG3YB1pGl+KF64ZCYbgWpArSMW/yEHreFShAf9z?=
 =?us-ascii?Q?6ozG9EfiIpigBSs8ioGk+vkBYCpnsnU50mhDL1WPTcmXTARL0mD+zPA6UQZ7?=
 =?us-ascii?Q?YPHBi3ValWt+XrzcT5AXc7SMTT9IrQuy8KdLWr+CXpNUfzDvpXip9UiyQpuK?=
 =?us-ascii?Q?rNmAzt29cFvVpJeXw/nKMFpxdnmtSeDfZ2BRUqkWFaz3gh/8c7pPPyC6lxUI?=
 =?us-ascii?Q?hdUA8ZKoKboQ6S+/ooADb4lwmQNQAOvfSVQ9D81ZMcpochg+uHdOBY21X9b0?=
 =?us-ascii?Q?VrLZt2h/57/GUYlK3ap3hNFOmWyql5Ew3RAa39tJ2xqNuOEzzx94OPTYNUvD?=
 =?us-ascii?Q?9QDbWd57J2FGP3jF348Ek0+5P+gOAjw5gvXmNBLK44isc3yE3WrdjUAcUz/I?=
 =?us-ascii?Q?L4wriog59axk1RbeH6y4ejZ7RxNcE8SQCvLi88ky?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4dafe5-c76d-4ae9-1c12-08de113e6a2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 07:41:29.9706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQuvLj99KZ/Zr3SJlmQHRH1llh0bGeqUywDmSEP4EP7T7apn+bAsXjlAK4e+ELxQy+MxicNaux2TneTMNJqX0Fji8Fhbq+/P02BlzmHlHHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF496D5EAB2
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jason-
> JH Lin
> Sent: Tuesday, October 21, 2025 7:38 PM
> To: igt-dev@lists.freedesktop.org; B S, Karthik <karthik.b.s@intel.com>;
> Sharma, Swati2 <swati2.sharma@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Juha-Pekka Heikkila
> <juhapekka.heikkila@gmail.com>; Bhanuprakash Modem
> <bhanuprakash.modem@gmail.com>; Fei Shao <fshao@chromium.org>
> Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>; Paul-PL Chen <paul-
> pl.chen@mediatek.com>; Nancy Lin <nancy.lin@mediatek.com>; Singo
> Chang <singo.chang@mediatek.com>; Gil Dekel <gildekel@google.com>;
> Yacoub <markyacoub@chromium.org>;
> Project_Global_Chrome_Upstream_Group@mediatek.com
> Subject: [PATCH i-g-t v2 3/5] tests/kms_content_protection: Exempt output=
s
> with no EDID sink name
>=20
> Mark outputs with an empty sink name as test exempt to avoid
> unnecessary test failures on panels without EDID sink name.
>=20
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_content_protection.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index e056951c92f4..c461e5b5ceda 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -618,6 +618,12 @@ static bool
> is_output_hdcp_test_exempt(igt_output_t *output)
>=20
>  	drmModeFreePropertyBlob(edid_blob);
>=20
> +	/* Not all monitors have sink names */
> +	if (sink_name[0] =3D=3D '\0') {
> +		igt_debug("no sink name\n");
> +		return true;
> +	}
> +
>  	return igt_is_panel_blocked(sink_name, hdcp_blocklist,
> ARRAY_SIZE(hdcp_blocklist));
>  }
>=20
> --
> 2.43.0

Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>

