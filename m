Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F23E77199
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 19:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE1110EF12;
	Thu,  9 Jan 2025 19:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3rrBaZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBF110EF10
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 19:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736450034; x=1767986034;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZqWgYn5ukAoUXJEKzQvsXolOFBlOXhbhoSG453W+q3Q=;
 b=A3rrBaZYmOpWegCV8FkQD+J0dZG0gjRN0hD7fkqcH25AhPoSIBSHj6+F
 99IXAo4V188PXT1yO8u8aq6BjuqBn4CCthOfkJlBxItVD8YnZKZcNAtEX
 f1R5ipUT8LrN0th63lzG8VnapBzYT0VI6RmmFcdvZR3eS1MjAREbCnrTf
 vVABMF5aNzQrLjgTnt5d+V2KITjQCTCZ0lsBmA7oQA1VcmGnJq7YHkQYu
 ldwG7JDBSi+FClN3RDKRs7aFcs2nPH9mYNAReE4ldUca+ZJsVALuA1gps
 rLViHI0bkINYHACmAFpKf9kXhSZ/4S+FPGmgQeJEybgrc2YASWAyVTavB w==;
X-CSE-ConnectionGUID: pz7UyGy4SI+s9kGaxRjkng==
X-CSE-MsgGUID: Hn06TXbyR8e/AwCWt8IfEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36422412"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36422412"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 11:13:53 -0800
X-CSE-ConnectionGUID: ei2ZEgulQiO1Pg5+t4EV2Q==
X-CSE-MsgGUID: XCCHgufjSYClf/fS4HS8kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="104048667"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 11:13:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 11:13:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 11:13:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 11:13:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQN8a79wdCpBl5WCKEZowN1FhDPOvew/C1lyppMJknNkW4DiNJh1gICk39/X/NYPLgjjeqpfMQETm0SlaXyA+FHaqm56DA3sj/Jjq56jH8xeyK9SpyU57tTO3ildT4R5s+BzBR9mXN7INXFvo0fYu8fdgL0Q+ibuJ22wP4vIvn4Ne8y1Oy+vsFdq1ZxRjLpAVpJm1SBi2SbAV93sqYS6G5PVagDCLJVJBP/Ece7UAvONG0FaILP4SK4sebP16KHVzOEWRPbbWplDmF5m3Es2qmzqV2C8m61M+30c6M2pCIWUNualp7OKEkYKPg8hPvkv3A69IvVnAQ9VGHefYXZUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtPTcQF9uTR0xqtuAiN3HJmn9A1zWjgsWsHlif5lhLg=;
 b=vbzjT1tGLbGK9lKpZVQ/XeECgMFoanbx4X8SuS0+v+3MdnGRI5G+BX8wbHQ3LTbw2PIDnkzUWWPnGtZB+xKJstolqQMIWAw85m0MUax54r04U7L8MfLzDFg76XsrwESOZ7yYvDHl3dOF5K00KgC7duTHF67dO1wawGOcJXmhjETEZ1w8QEyVicAo9VYYD5oqUENJTktim6Ji0dZ9ynts2fiuIYLrXdd00f2VTCfk2WQ6l3y4/S4mNOXJnsWj5BUG59Qco26OIRjxSCzm+o6ZqlEd2fdWG1ITyh499T4xiU67jhlH80LSoo7te729AqCQz0jtcZsV1d3xYJjOQ+kdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA3PR11MB7628.namprd11.prod.outlook.com (2603:10b6:806:312::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 19:13:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 19:13:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "stylon.wang@amd.com" <stylon.wang@amd.com>, "Rodrigo.Siqueira@amd.com"
 <Rodrigo.Siqueira@amd.com>, "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "gregory.f.germano@intel.com"
 <gregory.f.germano@intel.com>, "Taylor, Clinton A"
 <clinton.a.taylor@intel.com>, "Vivekanandan, Balasubramani"
 <balasubramani.vivekanandan@intel.com>, "Yu, Jianshui"
 <jianshui.yu@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_kmemleak: library to interact with kmemleak
Thread-Topic: [PATCH i-g-t] lib/igt_kmemleak: library to interact with kmemleak
Thread-Index: AQHbYsHzoBn2OZ4Cq0us/Dro48E/MLMOxtNw
Date: Thu, 9 Jan 2025 19:13:21 +0000
Message-ID: <CH0PR11MB54447CADD954E7C595A002D3E5132@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250109181027.90402-1-peter.senna@linux.intel.com>
In-Reply-To: <20250109181027.90402-1-peter.senna@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA3PR11MB7628:EE_
x-ms-office365-filtering-correlation-id: 70ceba04-7ccc-4332-d75a-08dd30e1aed0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/fUGPo/z6xmNTCMIR28GKnwgF/3iONCzg1pT7v7ULcujxRj5IW2+n63l7IWy?=
 =?us-ascii?Q?wG/0xHPojH6fwOJaE0jRij68gyWohODkDPCARG1DIOkwSfZQatrr3pxfXzOK?=
 =?us-ascii?Q?N2iwc+8GRzCW3akCTreLrOqdSeV33244eVn5e1GfoKnbblbFROul7ikTae6s?=
 =?us-ascii?Q?CYiYNhnGdRV9VNpJLsvMYnhuAizqD39/qSlnO1zIYmn3N2D5hmhMS3eiLj24?=
 =?us-ascii?Q?FXCRrbAFAIyH4ZSPnbAneBEsj9f/jVRODIDALGPu/MPHGOUZtgl2eVEaoBat?=
 =?us-ascii?Q?0ZO6bPTOwgZp+/DhX3WT4v45A+wBCNtx4qoDOreueYBLTqXqE0zLSp6YM/+V?=
 =?us-ascii?Q?ispUWgz2/P1uYqvkJqqr5zqti2Qjzsmub5smHnBHfZUxyYFbb2utgOU/SPXD?=
 =?us-ascii?Q?UcH7YsWYxj8RTb6mZImXTzCJsx1qjom1/XrehX7HWhyWcaUc2tTEZmS7z7ok?=
 =?us-ascii?Q?TgVsR6nV2wiT06peXCuSix1D2laOOoXQiRosyohrWGkP0eTO0Z85pibfnjFW?=
 =?us-ascii?Q?kqzmXUcf9mbJZLsJGY4VrU6VoUiKjIRXo5P4YK9GHD78B39iPe5NHocG6t6f?=
 =?us-ascii?Q?6D3BiH08MPgVRLMCfZkZ8dqNFJzD4QX9OzQYTVhlARxnC8yvtHzUXqE5Fou0?=
 =?us-ascii?Q?XX2034XMw92vcLhfQISNa4KUxtCpnwTJzBcPS7YP5MYOZXrFWiByJKr/+x3Z?=
 =?us-ascii?Q?rOFEUTaoy451BpX/4NPlZSP2Tdq2qbUfMY4iONzNKkMwt7u+05QWO1uqZPWp?=
 =?us-ascii?Q?SbrYiWdAULy5P0uUkjtTBA629hZzJtwb2DAze6hcNjqhjj3gJXQJJP1Hxcxf?=
 =?us-ascii?Q?EeP0adAveegpNWBAfeDBBv0huKdrhhjSKdTpPGUWxO5WDUXtLHQBzbuatcvE?=
 =?us-ascii?Q?9YuCXprki/i4+u3AHjHTi+jNq87g5LWmqhZN+jXnQD/7ApKwuPO7vIfcMBNv?=
 =?us-ascii?Q?kcPmA//VTVnnBtFf/ZfVGLhBnyyqNo2V/7FNApr516N/gjTFy6+Nfv5+9KG3?=
 =?us-ascii?Q?iHzhSRT8KR4Emu6a3ASH9HTNelrZEy0GJfSU/xS5MEmoQSAt9nUHUJRQJv2s?=
 =?us-ascii?Q?3F8syPZNxcPE52BkAUoCPs/e8nxu9WiPHrqr07m1KHUUC9RPazM4g4Xn70cT?=
 =?us-ascii?Q?iKL82OCHdJZOPWWmQ8nfJPvegpgw04hMV/HrU31Q16dfpFuSuD0XSh0h6WMs?=
 =?us-ascii?Q?mYoKCMH7ufDWRPVUhNJ9RN0jyUa+nOuRpizkLrIbrBBWfzIp03Fl5q0dxq6b?=
 =?us-ascii?Q?hREJkJ3f2/HPDbCVMo9CU37jYHVAw/UQ9XqnrYDcEenu56aFCMkzkDrrdswm?=
 =?us-ascii?Q?Ht4WdCVGRsQhOcTp04PMRWo9UuRZxggo10RPOVExyrABiKI25o8V+7hNDX5j?=
 =?us-ascii?Q?8HdiXwUPeas1w+pxnexN3+eWxujG97ruDHayarjIcHD8NBQO+JzJP+Dpub5e?=
 =?us-ascii?Q?RR79lUWWbpaFwcEdJ4CRxIM7ClRGLk/b?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QfVknwBjj8C/9qisSt6hx0Wdsc1mElbwp8u6YWzAQA/ZmaNCN+/dZWvt3ksx?=
 =?us-ascii?Q?RqbipFrsJUrEdGwavfodPfyTMk7Ij+ZFc+oSM61Eq4j91PgEdVh0F8uqit49?=
 =?us-ascii?Q?8w/LulUXt+e1Jt3HcQapZg7nwTfoMms7ND1t9nlezDSjTSKCIBiuRxZeIw52?=
 =?us-ascii?Q?wATDJCke0/Uh1MMe6PuNTU0LwVjU9/NQHNwVl0VM76vO59Xx+k6uwWMbch2/?=
 =?us-ascii?Q?531j7TV/Mtr4f+xFUu62HuMy5RIci8aROwbDs9UPfhtEFHNQTRsOp7pPqFuF?=
 =?us-ascii?Q?7pC0xVrUHf8aBlbE3XGe04FyNCxFs2bEpGgfaKqETUmTWu+9w3LZcGbj9tQl?=
 =?us-ascii?Q?mte8ZkFwjR5tXBZ95+VqOlPNQUZIAkjBoOfbn5mtc6RItNsd8/1hsINo8tA/?=
 =?us-ascii?Q?21Ijz67vvGnEFsrBRviQgO1EVrj1YDU/8OW4KNK72P1Fi0FLVY6d/IfiK9t7?=
 =?us-ascii?Q?X9ph2fj+6cG3+Il3L3qzrgiNF2LpP+qmkR1dc4B02qvqAX7ARbA9nv52UNm9?=
 =?us-ascii?Q?EWr5RhwV37Qz/6Fo8SUUe7r8RpHY+HxM/L2SH8CtvcqXoz30Ue2EA6SrsmeV?=
 =?us-ascii?Q?ifY6JotnUJqsPZMYUdTRhkjjb5NiUURnEtE3wINX7u1qpkyYc1yzRzqG/327?=
 =?us-ascii?Q?t9uyinzrWKsdn/dI6fEg3g20lOfd4HFKNLsvisO0MpJr02hXXytm30fLFZPw?=
 =?us-ascii?Q?5At+tmXeG5UJ1yKVooaTmZ6f3fQ6gEP2bFASOq8hmtqS1ryYhud/EGtv5jUQ?=
 =?us-ascii?Q?snr9Y4CiaokovdQ9fN1Df6KQ95UwhyOifiBATbtrknFbX2eBh9s+VrfYKUSY?=
 =?us-ascii?Q?jO4ZhIH2QIqg0v7+6UAnnGj6SjFv+PX3/OvNvHJZn6qzkkMbPihZSqHMyikH?=
 =?us-ascii?Q?sKqm/RtuaBqlrkztbdQhVvApMzj94cFfoyPOHotb9wwSz78X+cjwtneCzJ/Y?=
 =?us-ascii?Q?BonBIJRy61mv7/L4SkXBy/w/G7PTovy+zbtYcLK4i7XA+irae9n03aopCTUQ?=
 =?us-ascii?Q?m0qVC2cK+Mmnl7pSKwkQLT3sJG19mVCu2Vqpc2BJV3C2+LXoYpVt479EjedU?=
 =?us-ascii?Q?EA+xXLBKU/ARXqtqcLB02P4CPBVodHyHAxe/1N7mhhpkBHOYapCzHMFEyGUj?=
 =?us-ascii?Q?HSH4dS294Z1csFEnAx5mXZhhJD/zE/Cy4lUAIJJ1bVyb3/K2OlDASyReAINO?=
 =?us-ascii?Q?QVu9Ki6X0oXhdVHj8riHMiOcxu3h8bNygIg97xs8K6BIFJdwRUdLOwKf/2W0?=
 =?us-ascii?Q?lIcysVlLXqCyRfVcrnCdGVdkZl8LyhRipNU2QFbFEX7lDWD9GOywerkgrpeE?=
 =?us-ascii?Q?4sljJxz+LlSt39q8jsP2Sp+ddRlxRJpjXGz6HUaVldoZb7hOo8wZgEmIyLcn?=
 =?us-ascii?Q?LKvwgfvh+oAdw1uRM81py/flZ2noOv8Qvn4yDcE/OhyO3WrPfugTMecA85LB?=
 =?us-ascii?Q?bwy/LONPKLZgCG5NBq/Bo2nvfaaMq8MSKbgc/HFAdKlFA8JS33z0NSoJDhiW?=
 =?us-ascii?Q?Y5CfLj6hRCYMCoEdMw2NA0x8u90ioGGSUx/LeoYPjVdji2FRIbyd73e6BHp1?=
 =?us-ascii?Q?i3ZJFbPv7AF1d7odSSeLPAljwPWIvPl9X7zmZL6z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ceba04-7ccc-4332-d75a-08dd30e1aed0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 19:13:21.4911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tL+MZEIL+xWuRYIJJNgtW7RguG1O++K5jK5CPshT2yPH+tidV5Az1+i43kvHFT0fuXcOB0iqA3ZlNRVjMDmwDev8TutcNeb/4cgIGZdvMB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7628
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
From: Peter Senna Tschudin <peter.senna@linux.intel.com>=20
Sent: Thursday, January 9, 2025 10:10 AM
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>; stylon.wang@amd.com=
; Rodrigo.Siqueira@amd.com; Gandi, Ramadevi <ramadevi.gandi@intel.com>; Kno=
p, Ryszard <ryszard.knop@intel.com>; Lattannavar, Sameer <sameer.lattannava=
r@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Saarinen, Jani <=
jani.saarinen@intel.com>; Piecielska, Katarzyna <katarzyna.piecielska@intel=
.com>; Roper, Matthew D <matthew.d.roper@intel.com>; gregory.f.germano@inte=
l.com; Taylor, Clinton A <clinton.a.taylor@intel.com>; Vivekanandan, Balasu=
bramani <balasubramani.vivekanandan@intel.com>; Yu, Jianshui <jianshui.yu@i=
ntel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmemleak: library to interact with kmemleak
>=20
> Adds a simple library for interacting with kmemleak ispired by
> 'tests/amdgpu/amd_mem_leak.c'. Also adds unit testing for the
> library.
>=20
> To use the library include "igt_kmemleak.h" and:
>  1. igt_kmemleak_init(NULL) /* Returns true if kmemleak is active */
>  2. igt_kmemleak_clear()
>  3. /* Run your test */
>  4. igt_kmemleak_scan()
>  5. if (igt_kmemleak_found_leaks())
>        igt_kmemleak_cp_leaks_file(*dst)
>=20
> CC: stylon.wang@amd.com
> CC: Rodrigo.Siqueira@amd.com>
> CC: ramadevi.gandi@intel.com
> CC: ryszard.knop@intel.com
> CC: sameer.lattannavar@intel.com
> CC: lucas.demarchi@intel.com
> CC: jani.saarinen@intel.com
> CC: katarzyna.piecielska@intel.com
> CC: matthew.d.roper@intel.com
> CC: gregory.f.germano@intel.com
> CC: clinton.a.taylor@intel.com
> CC: balasubramani.vivekanandan@intel.com
> CC: jianshui.yu@intel.com
> CC: jonathan.cavitt@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Some nits below, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  lib/igt_kmemleak.c       | 149 ++++++++++++++++++++
>  lib/igt_kmemleak.h       |  17 +++
>  lib/meson.build          |   1 +
>  lib/tests/igt_kmemleak.c | 289 +++++++++++++++++++++++++++++++++++++++
>  lib/tests/meson.build    |   1 +
>  5 files changed, 457 insertions(+)
>  create mode 100644 lib/igt_kmemleak.c
>  create mode 100644 lib/igt_kmemleak.h
>  create mode 100644 lib/tests/igt_kmemleak.c
>=20
> diff --git a/lib/igt_kmemleak.c b/lib/igt_kmemleak.c
> new file mode 100644
> index 000000000..c3f0f06a7
> --- /dev/null
> +++ b/lib/igt_kmemleak.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (c) 2024 Intel Corporation
> + */
> +
> +#include <ctype.h>
> +#include <libudev.h>
> +#include <stdio.h>
> +#include <sys/time.h>
> +#include <time.h>
> +
> +#include "igt_core.h"
> +#include "igt_device_scan.h"
> +#include "igt_kmemleak.h"
> +#include "igt_kmod.h"
> +#include "igt_list.h"
> +
> +/* We can change the path for unit testing, see igt_kmemleak_init() */
> +static char igt_kmemleak_file[256] =3D "/sys/kernel/debug/kmemleak";
> +
> +/**
> + * igt_kmemeak_init:
> + * @igt_kmemleak_file: update the path to kmemleak file to enable unit t=
esting
> + *
> + * Check if kmemleak is enabled in the kernel, if debugfs is mounted and
> + * if kmemleak file is present and readable.
> + *
> + * Returns: true if kmemleak is enabled, false otherwise.
> + */
> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file)
> +{
> +	FILE *fp;
> +
> +	if (unit_test_kmemleak_file)
> +		snprintf(igt_kmemleak_file,
> +			 sizeof(igt_kmemleak_file),
> +			 "%s",
> +			 unit_test_kmemleak_file);
> +
> +	fp =3D fopen(igt_kmemleak_file, "r");
> +	if (!fp)
> +		return false;
> +
> +	fclose(fp);
> +	return true;
> +}
> +
> +/**
> + * igt_kmemeak_cmd:
> + * @cmd: command to send to kmemleak
> + *
> + * Send a command to kmemleak.
> + *
> + * Returns: true if sending the command was successful, false otherwise.
> + */
> +bool igt_kmemleak_cmd(const char *cmd)
> +{
> +	FILE *fp;
> +	size_t wlen;
> +
> +	fp =3D fopen(igt_kmemleak_file, "r+");
> +	if (!fp)
> +		return false;
> +	wlen =3D fwrite(cmd, 1, strlen(cmd), fp);
> +	fclose(fp);
> +
> +	return wlen =3D=3D strlen(cmd);
> +}
> +
> +/**
> + * igt_kmemeak_scan:
> + *
> + * Trigger an immediate scan on kmemleak.
> + *
> + * Returns: true if sending the command to scan was successful, false ot=
herwise.
> + */
> +bool igt_kmemleak_scan(void)
> +{
> +	return igt_kmemleak_cmd("scan");
> +}
> +
> +/**
> + * igt_kmemeak_clear:
> + *
> + * Trigger an immediate clear on kmemleak.
> + *
> + * Returns: true if sending the command to clear was successful, false
> + * otherwise.
> + */
> +bool igt_kmemleak_clear(void)
> +{
> +	return igt_kmemleak_cmd("clear");
> +}
> +
> +/**
> + * igt_kmemeak_found_leaks:
> + *
> + * Check if kmemleak found any leaks.
> + *
> + * Returns: true if kmemleak found any leaks, false otherwise.
> + */
> +bool igt_kmemleak_found_leaks(void)
> +{
> +	FILE *fp;
> +	char buf[1];
> +	size_t rlen;
> +
> +	fp =3D fopen(igt_kmemleak_file, "r");
> +	if (!fp)
> +		return false;
> +
> +	rlen =3D fread(buf, 1, 1, fp);
> +	fclose(fp);
> +
> +	return rlen =3D=3D 1;
> +}
> +
> +/**
> + * igt_kmemeak_cp_leaks_file:
> + * @dst: path of destination file including the file name
> + *
> + * Copy kmemleak file to dst.
> + *
> + * Returns: true if copy was successful, false otherwise
> + */
> +bool igt_kmemleak_cp_leaks_file(const char *dst)
> +{
> +	FILE *src, *dest;
> +	char buf[1024];
> +	size_t n;
> +
> +	src =3D fopen(igt_kmemleak_file, "r");
> +	if (!src)
> +		return false;
> +
> +	dest =3D fopen(dst, "w");
> +	if (!dest) {
> +		fclose(src);
> +		return false;
> +	}
> +
> +	while ((n =3D fread(buf, 1, sizeof(buf), src)) > 0)
> +		fwrite(buf, 1, n, dest);
> +
> +	fclose(dest);
> +	fclose(src);
> +
> +	return true;
> +}
> diff --git a/lib/igt_kmemleak.h b/lib/igt_kmemleak.h
> new file mode 100644
> index 000000000..c0c187847
> --- /dev/null
> +++ b/lib/igt_kmemleak.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright (c) 2024 Intel Corporation
> + */
> +
> +#ifndef IGT_KMEMLEAK_H
> +#define IGT_KMEMLEAK_H
> +
> +#include <stdbool.h>
> +
> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file);
> +bool igt_kmemleak_cmd(const char *cmd);
> +bool igt_kmemleak_scan(void);
> +bool igt_kmemleak_clear(void);
> +bool igt_kmemleak_found_leaks(void);
> +bool igt_kmemleak_cp_leaks_file(const char *dst);
> +
> +#endif /* IGT_KMEMLEAK_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 640513e6c..24423ef37 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -96,6 +96,7 @@ lib_sources =3D [
>  	'igt_dummyload.c',
>  	'igt_store.c',
>  	'uwildmat/uwildmat.c',
> +	'igt_kmemleak.c',
>  	'igt_kmod.c',
>  	'igt_ktap.c',
>  	'igt_panfrost.c',
> diff --git a/lib/tests/igt_kmemleak.c b/lib/tests/igt_kmemleak.c
> new file mode 100644
> index 000000000..e683158a5
> --- /dev/null
> +++ b/lib/tests/igt_kmemleak.c
> @@ -0,0 +1,289 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (c) 2024 Intel Corporation
> + */
> +
> +#include <ctype.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <zlib.h>
> +
> +#include "igt_core.h"
> +#include "igt_kmemleak.h"
> +
> +const char *kmemleak_file_example =3D
> +"unreferenced object 0xffff888102a2e638 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   00 00 00 00 00 00 00 00 0d 01 a2 00 00 00 00 00  ................\n"
> +"   f0 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc 2df71a7e):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2ed18 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   38 e6 a2 02 81 88 ff ff 0d 11 2d 00 00 00 00 00  8.........-.....\n"
> +"   f2 7c 03 00 00 c9 ff ff 58 ea a2 02 81 88 ff ff  .|......X.......\n"
> +" backtrace (crc ec2a8bdc):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2ea58 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   38 e6 a2 02 81 88 ff ff 0d 01 a0 00 00 00 00 00  8...............\n"
> +"   f6 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc f911c0d1):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e428 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   58 ea a2 02 81 88 ff ff 0d 01 35 00 00 00 00 00  X.........5.....\n"
> +"   fc 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc cb8aaffd):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e008 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   28 e4 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  (.........-.....\n"
> +"   fc 7c 03 00 00 c9 ff ff c8 e2 a2 02 81 88 ff ff  .|..............\n"
> +" backtrace (crc 7f883e78):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2b9e5>] acpi_ps_get_next_namepath+0x1f5/0x390\n"
> +"   [<ffffffff81c2cc15>] acpi_ps_parse_loop+0x4a5/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e2c8 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   28 e4 a2 02 81 88 ff ff 0d 01 73 00 00 00 00 00  (.........s.....\n"
> +"   00 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc 338c016):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e378 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   c8 e2 a2 02 81 88 ff ff 0d 01 0d 00 00 00 00 00  ................\n"
> +"   01 7d 03 00 00 c9 ff ff 98 e7 a2 02 81 88 ff ff  .}..............\n"
> +" backtrace (crc 665fb8a7):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e798 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   7c8 e2 a2 02 81 88 ff ff 0d 01 98 00 00 00 00 00  ................\n=
"
> +"   1b 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc b7a23a1c):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e0b8 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   98 e7 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  ..........-.....\n"
> +"   1c 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc 14d67a9c):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\=
n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170\n";
> +
> +static unsigned long crc32_file(int fd)
> +{
> +	unsigned long crc;
> +	char buf[1024];
> +	ssize_t n;
> +
> +	crc =3D crc32(0, Z_NULL, 0);
> +	while ((n =3D read(fd, buf, sizeof(buf))) > 0)
> +		crc =3D crc32(crc, (const Bytef *)buf, n);
> +
> +	return crc;
> +}
> +
> +static void test_igt_kmemleak_cp_leaks_file(void)
> +{
> +	char src_file_path[256] =3D "/tmp/igt_kmemleak_test_XXXXXX";
> +	char dst_file_path[256] =3D "/tmp/igt_kmemleak_dstfile_XXXXXX";
> +	unsigned long crc_src, crc_dst;
> +	int fd;
> +
> +	/* Emulate a kmemleak file */
> +	fd =3D mkstemp(src_file_path);

Nit:
Should we igt_assert(fd >=3D 0) here, like we do in test_kmemleak_file?

> +	write(fd, kmemleak_file_example, strlen(kmemleak_file_example));
> +	close(fd);
> +
> +	/* Init the library */
> +	igt_kmemleak_init(src_file_path);

Nit:
Should we igt_assert on the igt_kmemleak_init, like we do in test_kmemleak_=
file?

> +
> +	/* Copy the emulated kmemleak file */
> +	igt_assert(igt_kmemleak_cp_leaks_file(dst_file_path));
> +
> +	/* Test that both files have the same content */
> +	fd =3D open(src_file_path, O_RDONLY);
> +	crc_src =3D crc32_file(fd);
> +	close(fd);
> +
> +	fd =3D open(dst_file_path, O_RDONLY);
> +	crc_dst =3D crc32_file(fd);
> +	close(fd);
> +
> +	igt_assert(crc_src =3D=3D crc_dst);
> +
> +}
> +
> +static void test_kmemleak_file(bool test_write)
> +{
> +	char tmp_file_path[256] =3D "/tmp/igt_kmemleak_test_XXXXXX";
> +	int fd;
> +
> +	fd =3D mkstemp(tmp_file_path);
> +	igt_assert(fd >=3D 0);
> +
> +	if (test_write)
> +		write(fd, kmemleak_file_example, strlen(kmemleak_file_example));
> +
> +	igt_assert(igt_kmemleak_init(tmp_file_path));
> +}
> +
> +static void test_empty_file(void)
> +{
> +	test_kmemleak_file(false);
> +	igt_assert(!igt_kmemleak_found_leaks());
> +}
> +
> +static void test_non_empty_file(void)
> +{
> +	test_kmemleak_file(true);
> +	igt_assert(igt_kmemleak_found_leaks());
> +}
> +
> +igt_simple_main
> +{
> +	test_empty_file();
> +	test_non_empty_file();
> +	test_igt_kmemleak_cp_leaks_file();

Nit:
I just recently read through your prior comments, and saw that it's not pos=
sible to
convert this test list into multiple subtests.  That's a bit confusing, tho=
ugh I guess
that's because this is a lib test and not a testlist test?
It's unfortunate this is the case.  I can definitely think of one or two wa=
ys we could
go about breaking the test into multiple subtests, but it would be quite cl=
unky and
over-engineered.  Something like:

"""
int main(int argc, char **argv)
{
	int i;

	if (argc =3D=3D 1) {
		printf("Running subtest: empty\n");
		test_empty_file();
		printf("Running subtest: non-empty\n");
		test_non_empty_file();
		printf("Running subtest: cp-leaks-file\n");
		test_igt_kmemleak_cp_leaks_file();
		return 0;
	}

	for (i =3D 1; i < argc; i++) {
		char* name =3D argv[i];
		size_t len =3D strlen(name);

		printf("Running subtest: %s\n", name);
		if (!strncmp("empty", name, len))
			test_empty_file();
		else if (!strncmp("non-empty", name, len))
			test_non_empty_file();
		else if (!strncmp("cp-leaks-file", name, len))
			test_igt_kmemleak_cp_leaks_file();
		else
			printf("No such subtest named %s.  Not running\n", name);
	}
	return 0;
}
"""
Yeah, let's just stick with what we have currently.  Besides, I see that th=
e current implementation
follows what is done in igt_stats.c, for example.
-Jonathan Cavitt

> +}
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index df8092638..bcbea9ba4 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -15,6 +15,7 @@ lib_tests =3D [
>          'igt_ktap_parser',
>  	'igt_list_only',
>  	'igt_invalid_subtest_name',
> +	'igt_kmemleak',
>  	'igt_nesting',
>  	'igt_no_exit',
>  	'igt_runnercomms_packets',
> --=20
> 2.34.1
>=20
>=20
