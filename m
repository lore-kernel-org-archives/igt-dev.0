Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68E6D4662F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 22:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C6D10E0DD;
	Thu, 15 Jan 2026 22:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrQj9+Ur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D97710E0DD
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 22:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768515697; x=1800051697;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=dJuFFMzYOO+WTYekChw55e7LyLZWZKz8j0attAvPMQs=;
 b=GrQj9+UrdMnQ5qUxV96dYfJ42RxbyLY7HIAgmSuBQ7rsacDQxeOhrwD9
 gF0y7y9BKkl7TRl5ElY0kWX/xf43vVkJEloeBax1/lR+G4eUI/zEc+1G7
 sPkYEi7rk5yC1GC7HsWHRjQ/s80mGVQvzVCFsSNgqFymlbEfvSHiSgFX7
 8uuPtdUzlUu0ZhaMFZ0jXCmqI3aAbvYTNrtSo4ODvhmcbypCeRaUvPLD0
 sazX+wQ1RXsMHlV/CoWeancb5fXCvUtTQD6f5Ec9Ti6+VDMLmpEH0g9kD
 AKxa+wSiGZjteFq5Q2K1453g0FCwr2Mq/RjTTllw2BO5tVn2RZzKSSRR3 g==;
X-CSE-ConnectionGUID: N23zdZezQ5yBMCuZrTZRVg==
X-CSE-MsgGUID: X1uliTLRRZuxU6vXbcAFwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="72418860"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="72418860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 14:21:36 -0800
X-CSE-ConnectionGUID: Krg2tdDbRi6ub2WhOlnB/g==
X-CSE-MsgGUID: t7qxOm7cQXmeDHdSdH2xWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="236318540"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 14:21:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 14:21:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 14:21:35 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 14:21:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXnsNYi9SxGmGPsl7p9qm8xQOPrHpQyl4nQ/1ax5QbYk2IuOuLdGp+VlBy7YcXw7wkvWJ6QFq8Yz3eW3ODn8n73VjliwW+xM5Uy1VeOowh3GEhn9+U21P5Rryj48Nixo2FT7MCTOwP+g3cORU0e5mO7wpFLt6xLyomSqrcsbWxCjBAIIMEio8jkErM8mjHk/B9m5ixKbXhHemROkA5GfElDHiGa12DK4oZ68px5y1DgSPP95qDyr97qI9pJ08RyLs/eNd2ehojl65fmJ8NS1v6mstipgkwrIRiGaUuOA8KvxDgYEk8so+Mw/UmXtluY2YZ8MOxuWUqpQgBm9UHc6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJuFFMzYOO+WTYekChw55e7LyLZWZKz8j0attAvPMQs=;
 b=hG7LZVQ+5Fn36V9LRG9iO5wVDmjrgsio+p50MlkWKtQUy2Qo/m5Hys2hHYYVwLqpUsi73rMKFSyd9Zt2m8aMD8/R8RXnb+FNUZRzzeWyF9vjWORXky2Eeuyt2yMheiFJIrkkm/81D17ymCeFdRgtB6ODDtxOD/t/kX0DFRMdKz0Jurzcc0qJJwGPc1iHxImL8rOcASCNQdZZTkcn4em13/8KlqYsLQNFxUgjW8huCy+tC3p4vbXrlDyB9TO836C8QkwAXei1tW8yhy0cQKeQRx4hBNzDWQp2c5BvprPoYgWwpotAP0C5vrcqvlM/1ekmucF6xyPia81DgZukU0Uk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 22:21:33 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 22:21:32 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: Recall: [PATCH] lib/xe/xe_legacy: Cleanups in xe_legacy_test_mode()
Thread-Topic: [PATCH] lib/xe/xe_legacy: Cleanups in xe_legacy_test_mode()
Thread-Index: AQHchm1N1l5NcdBZ+0KP9Mv3399GaQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 35
X-FaxNumberOfPages: 0
Date: Thu, 15 Jan 2026 22:21:32 +0000
Message-ID: <DM4PR11MB5456B3D2F0757E28CE13EFBEEA8CA@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB8262:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 397b5863-57b2-4add-540f-08de5484703e
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?rgvcIYLFOXCmVMDIrDUn4Ura1RBUWtEgcMlCFTwfaQHbe7roScZE3XxP9qU9?=
 =?us-ascii?Q?8HmoUGVd1C1YlpWwYvX+QqrwRYOdWEyjfwMjMNXy22L70XgV+gFqUxfEovQL?=
 =?us-ascii?Q?Ek9XQcQJhppfdAAU2ASpyJhLBiF2YsqsEmMy7uR1TcAFzVPWCVzD96nuP+E9?=
 =?us-ascii?Q?N0XSVPHe6x9CbtTZkN8SGxhD+uKBfQlHYuIqdOQsx/Wqgdm+4tQuboTQJetx?=
 =?us-ascii?Q?jKRmpE3OZ0OiHjsUDqLzqQCGWQ8fNp0IThfk76vU7YKI/NfZFTcR/Z+5w0ZZ?=
 =?us-ascii?Q?/DLXWZcVNMUpTFXTCJ6JmW8Avh6Rhrqri/LwBH73+0SliGkFAPjd+FVSwOUb?=
 =?us-ascii?Q?cQg6+XvEaJg29IGrgNphjrYbxNdM5IcmV6LALBL8TBQGV4jXjFMyqI7QtL3n?=
 =?us-ascii?Q?iDYj00FxcDV/NLbYAhaf42MjhTXQ2lpMjDmjlaZVbXb9TnIgKUjXSdNGRKuC?=
 =?us-ascii?Q?Bd2kih8wI1yyrSwxQ7VIueacfvEIAZ65LH4yZ5N/LVipmoFXTw8WS0Nqbsfl?=
 =?us-ascii?Q?wfjQ5tNW9sA8Ip0I9Xp6O54RcNVoS15Jj5gVrLA2LGUINKtkTCLBXl55Tx1b?=
 =?us-ascii?Q?bOicztMUZ1qNyDspCnsak7suUW5Kg6eqLH65sDBbONOa9HM1/LWWFKW/dEL5?=
 =?us-ascii?Q?gG8vcoKbaxo+naf1Hhztg9XawzV2xOmJq/mDUz8Qi7V7iPWDK+D6eprqtiZW?=
 =?us-ascii?Q?+6XYwfk+cFcGQlJF9xJquP6gWModOB29shoZ1fs1PMkG26cbKpKyBq2ErLo3?=
 =?us-ascii?Q?ftiLM2fj/KvA+kGQGq5w9/KNmi8JOZEmUAZoeVLc0TsriiL64vWASoXSxpQ+?=
 =?us-ascii?Q?SpnbvQXECbTDi3C6ZSXIaOr9M7xUame6DebBVFqnjzd/xc+WdvSyKduqaoNE?=
 =?us-ascii?Q?CfT3cXrJm7hjxm/6sgGIATjDWJfWB+BWrBb2kaGZWJNIpFgy93z/3dG4YWwG?=
 =?us-ascii?Q?chaZUHJ/byG+U9qGZ64kHmV0N4b8CrbN0PeeQKvwvkOSt+I8PKSFFpMWK3re?=
 =?us-ascii?Q?6o3AYdR/A6nuDzdwJgQmWeL0zqCWLTdsdsJ1tIYme9nlA6APYzjDqYU3Hfts?=
 =?us-ascii?Q?Vo+9I10ZG5GAREuzAkoOTtuJaygz1veWt/B2As6qZCXWP70WiRQFwdBWyJRm?=
 =?us-ascii?Q?kiXzQaSPkAK+aKQzhXLLasBz6PZoCRrI2nwEqdiNc/WURnF2k93eihAVxnYh?=
 =?us-ascii?Q?v/GREHs6qslPlxrW3c0i9jwXHFoUyxXIxxbY0xeER+FDBcRUio2pJ2oIvGwc?=
 =?us-ascii?Q?moT/qx9/oLaF1kY/mipM4SIweL6OSiv2jaCmW4E+PJHyyjNI+LR6mTHe8/gZ?=
 =?us-ascii?Q?4Z9hWAcTBS7heSoD6ucl7b3xxPcB8whLjbwcbeecj7gUiGAgg+D1q2rFJNa9?=
 =?us-ascii?Q?0F7W/M4QrCjNuZooakvOr1Us7YmJZKtqBVRkmxDcKRvZm2NLRpwow3BuNPMM?=
 =?us-ascii?Q?ECXLH543dugxwc2aWTbQ5lNx/RLiLbIdIvNG5LidK9lmOWHSjvaG+yMAsJsN?=
 =?us-ascii?Q?fTu6YUiVJcojelldR8ImrK9PBWjkTo7/QHFwUTYl2HUteRHkpn+gR2XMVpIx?=
 =?us-ascii?Q?yKw/bvaFvyKegKXG3MzF1EbtJbAjY2pmLOZbOfk6F7/S+0R/J8k4XdCJsTxc?=
 =?us-ascii?Q?S8JW95ZV44+1yZKniZ52McU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UlLr14tFMuVhrHOFKleQlQVrM5x+DCkLEi2uR7/18umTPnCHS8qJyHbnPgil?=
 =?us-ascii?Q?shWWhbYF0uFC4mKWkk5T+JGbCANwdEvVqJjMAe8XASoCzhqc0QdguDejVPYj?=
 =?us-ascii?Q?6JHu2guqTVZxY2t3/SN2fKrpiGlJHEfOMSFmeKPTsWJsYqigd2W5jOg5myib?=
 =?us-ascii?Q?QXJN1XGOifr36kDse3D0UpypBgmCFRzPYFxmeVEsSdcLTxm+L/i5fuWqRgoR?=
 =?us-ascii?Q?dcOkgs2eQD2FR9ESxKu7WgbDSSDr8nBLg4gyBuc45hh7su1S0HDnmELNFja8?=
 =?us-ascii?Q?eHclGmt8Rb7XEoVB6amInBrBGQ+isFK18m59U5wfk2z6CuGpE2teqFKz2U4L?=
 =?us-ascii?Q?BzYHYGFay7Ff1wILC3kqByOOTqqkkgwbi5qNic5AxZEC2sQIlbkckKgLlagI?=
 =?us-ascii?Q?BEysxGy8X7nDTKT0sWNBeJUuLxSHajNCQ2xY+CA0JUYFkhXjq1uRRD+kY2YR?=
 =?us-ascii?Q?68tnrpopFu+vQsxX++BFGF0r0Lq6mqtxdXvVjRL/LkNnVuxFwg2q1Fab6H/w?=
 =?us-ascii?Q?YBGWRTO916DzcXAJUykHV43VAjFNXPWeFURpgutv75ohxr2WwlLCKjkaRA1I?=
 =?us-ascii?Q?/2GY+FZ55zBSVqKiKq2e4dbOOPWpX2r/g8UEJVk7HRPpEJe/j9rCOqdzpNxG?=
 =?us-ascii?Q?uScNwiFgEc0q0RnF2fyoXahJ8+RkNUnQeDqgZXlCoPAJpJiitzRZ/kVZAnUN?=
 =?us-ascii?Q?WhTnWSDV2riVzzpSQ7CqZAvFnwgqqho3ggDkjop5/aTIEoxg/VWkk3SzlMHU?=
 =?us-ascii?Q?vOGzSb3d/lgRn/28sBBabv0BkUCu/YbYbHmzMWUQcKHgXtNZSykcacwZUhhK?=
 =?us-ascii?Q?aImxJFOeEmiAFPsRWQ+IuTleTeXzmo+sx8UUKCXQNvM0sgMryJgEVvyZ+DPF?=
 =?us-ascii?Q?gZnsf5xfB91PFj/XntfeWjqV8zNbCv2xQgd5uPUZ6mZlTHEzpB9oVoUDoFWV?=
 =?us-ascii?Q?pDOEg9WvKCm7Iec2euk8yR6i1ipURvT7Y5ItOoWUu8mjjTOr6mWSqZzKbaQ6?=
 =?us-ascii?Q?zHEUjknzSLjSLzFoq0Tl7AFeav8W/HCDG4U2d3PcxGYaeCRU2wy9aMdJR6El?=
 =?us-ascii?Q?6SNnNKtinz43+nKYYfoM7n/RPpVx4nVuFdMzWnGNZHxfQ1M6OJ2n2K4kaUpS?=
 =?us-ascii?Q?UR2gPE+RJ9jLqQ5puuT+ZnX0GWh0yTEJGewyS8JEarZ/rucLdkJ03O790p4+?=
 =?us-ascii?Q?IjlnZE+PJEpHb5HTve6fxtjVO7Yqo52LBxd4d9IjfSAG/Q1oJKJmsJGjoA/1?=
 =?us-ascii?Q?0obehMhLUBoS0G6ly7BP4j55jwEj1n7qOoiWfiRhyek1dyvgsOYTb3seAh5n?=
 =?us-ascii?Q?5E9ZRTVEs5SUIFjeXB71Ry2IASRGZZsOEGi1oVpoLn9a8yals1hzoQbR/0UF?=
 =?us-ascii?Q?LJH3oeW9Oi5fCKr0vBYon9oMWeC4d9SixoLCgyDdpAE1I0owOjpJHV6uKGo5?=
 =?us-ascii?Q?vsjGC+Bv1eM3dzLvfw4rHuS/If/qv9q9yuFW+Z28rdniFlqh7ZV4kLvQBb/1?=
 =?us-ascii?Q?JswluUoUHNYKsBwXsshi4FARf8OSPOaPXNVgvKBSdxW5eeqT5ktCsDmSkAOs?=
 =?us-ascii?Q?CgWhltmzRuQnBAvh50CPcfFbgzzNOxLACChEbPQ0VWxSwrT8/zP9W86cpDiS?=
 =?us-ascii?Q?5kNWbHYzuHefKPA9ETPn4/CUZxrs5raQ54iJaGVBBZK6wJhB3KkOrEzNuLJO?=
 =?us-ascii?Q?6SJ0kU3l1Tb4EIn+EtLlUr304lPXcoxMydH+VVRBJJQK5bIz3tgzoBMPt2DL?=
 =?us-ascii?Q?SHarrk3nrA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397b5863-57b2-4add-540f-08de5484703e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 22:21:32.8321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B+4tCw82k+/wQdRF94WvgULgiqJl3ydm9fhkPLqGxXW3AbDeOsa1n38dRB+zIlHiBiyW/6135c0s4NU732+6aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8262
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

Lin, Shuicheng would like to recall the message, "[PATCH] lib/xe/xe_legacy:=
 Cleanups in xe_legacy_test_mode()".=
