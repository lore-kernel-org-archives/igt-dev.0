Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5142C3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 10:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665A610E60F;
	Tue, 20 May 2025 10:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfLzdEGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C03810E5B6
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747736355; x=1779272355;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=x4D+/c1BX/GXR0r+VlkVID8OrTAC0YOOkS93WKPoC24=;
 b=OfLzdEGdGxUJg9srXyXKXP1bjIH2Yzc4+NForPK6N2krGnGNqr5AWAKN
 CvVz+0H2Cl8ncMGv2CEPHwyZWv0zd5gR13iqcUkbd0CvaVrPV8YAarVkF
 KUKHMVzW9Tn1kYR41zG1mdUfEmmbNcJld1k46muZuqN0w1x3vflGUVxAr
 SI7W+fICr37hSyu7wEBp2tVQHu440nS3npJdCqkLx4df6hfpSfM9SkIEf
 OZZHMNoikdvlMkRzvYXA14NcossPjuMPfa6kAwqVhSak5qm4A1y4hKsP1
 6emPtQXRnn7irI4L/H0rdY1GxNSLp23pUIKM3FxQeFCBuAJTZDumgYyBe Q==;
X-CSE-ConnectionGUID: ZPXkzsFpQdeRUNwG1/YrOw==
X-CSE-MsgGUID: xNCQKHjdQLeFBlG0UDn47Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49565129"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49565129"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:19:14 -0700
X-CSE-ConnectionGUID: 1y/FE/1wQ869TzP+HArKLQ==
X-CSE-MsgGUID: LJxTHFnPQVuaaLK2kiJJLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144902819"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:19:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 03:19:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 03:19:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 03:19:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHk7ORqZDuHco4LoZAGjGSMbWfQvESryxJfBtacO1doJEnjuJ+05h4Iy5OIKAiyE7xFePJkgdb8zwOSNnoU7yyDz8EzE28tJ8rRm6g/NegyiOZytUL54EJyImNSyQn0r6J9debDbqFzIabdIqX4bE5ecnrrlTYgIndphHxnXJvzlDuFqnSefEBSl9Az2NKcOiswK8kSsYjcWpUvut9IQ6+ASzv6HB7/rfsKDVmYuQLdOpPSCDuC7khxjO48jw3YBzT0pAzRPwlaj6BFVbXBAEhk4M7HeF3E9OwFZ9IMi1YIlWA6QKn64hC8qf4m5uU8dE1dA0D2f/y669ZFRb965Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3nUpHXWoHDOSc1Soh6IZLCbwgLuQqEziEL4crq4uR8=;
 b=wcrrB9yKPs5BewiuQLGNOXaQIH526tH9PtorPp/mG0TQ9jJfmWwlAomTN/1GE/FmHslQiqR0vWC+cBTYX273tPj5izKOiKz0u6VNicOmbK4HM2A4MiIPWCIb2RqHQ7/riyxoh/N5acFwSKmJwKmhMZ+HvS3KJEt5L8zI6x2TA2kgHomDoF0AuTmyswzedSATZmFV1cSWq5RGEXHverghf8e2oVRMN0jLUVCaNMrt83LGzJDDZBZBl2LS/ED+2kVMeOhacUtqvsxTyeakql/6Ni15kVEtwvxXLstr5wFov1hpXggEgLij98CBrCg7zxvcYsNRODpcO70yCnh9ZJQThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6)
 by PH3PPFA061B3868.namprd11.prod.outlook.com (2603:10b6:518:1::d3d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 10:19:08 +0000
Received: from PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::1c5d:e556:f779:e861]) by PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::1c5d:e556:f779:e861%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 10:19:08 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2 i-g-t] tests/intel-ci: Add platform  Blocklist for
 Eudebug
Thread-Topic: [PATCH v2 i-g-t] tests/intel-ci: Add platform  Blocklist for
 Eudebug
Thread-Index: AQHbyW/xJfmk2lFRIkOVWQFKVr8Fs7PbTk5g
Date: Tue, 20 May 2025 10:19:08 +0000
Message-ID: <PH0PR11MB5949774F8E0628E2CEAC45BC859FA@PH0PR11MB5949.namprd11.prod.outlook.com>
References: <20250520101400.1522-1-himanshu.girotra@intel.com>
In-Reply-To: <20250520101400.1522-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5949:EE_|PH3PPFA061B3868:EE_
x-ms-office365-filtering-correlation-id: 7648c58c-1fb8-44e2-c9ad-08dd9787c1d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Ym9S2dWFXYkQwljtBQqr+518lWN8V1o0x6ofEnxK8kBQ5k3FBxkVkHvXEiZA?=
 =?us-ascii?Q?Ulod+bNCUzSNoVN+v5rXxTlAoDBTsuu0e+12bO5434tzwJ3DTIrLnx5fjOrQ?=
 =?us-ascii?Q?S5SGV5zKZjblHD97p7CX5jiuqW3iIEfpBdvO9oX/XlqF+92vO7vPlYWxnpgT?=
 =?us-ascii?Q?1BA4SWrlfhfy6CC2fcSvd/wOFoyvkLmSJlMNp1HDoWLy5Si0VXtIAjQirQbP?=
 =?us-ascii?Q?Hlxsu5obAD1d7PB3nEGScQ8JdW63BfaMdaNhurJOqzgFU7OHpiUjpUwmw0ay?=
 =?us-ascii?Q?GmHpIdvAXFUN+JkypnjXNR3OHWRx9DVcx8rQlcb4GnKen0kXwsL8/pgCrLRI?=
 =?us-ascii?Q?SYGkn91Z+Tjvv8MHk+1qVTiPV2+Mpsk4iywxz6XtQE2lCcHrn9IzcSkhCY7t?=
 =?us-ascii?Q?SjugwoFazotBAgwPVQr97ECF5A4piMxHRhdVdKNqOxU+zwasGlIq5p/emWK0?=
 =?us-ascii?Q?I8iBui43n3cYJZdCjKoi5oPDW+6A2WDRQI6EP1SlBVl+qk/OMyxeHGMQHJsH?=
 =?us-ascii?Q?3dLQ9dzvaximpxXv42xn/yCb1Mw18Wg3Vtw+sqyRxtq8nULv2p6XHygVqtb/?=
 =?us-ascii?Q?Mtg/Jr2SI6eu4Dy3Ycdk6BL92aWbBKBtz/WnbO0krghNexiWgx3/hb7Ishsl?=
 =?us-ascii?Q?wtNRTTXQJ19f8TewTwzUWAB2+mU9zmji8nHglEWMyLtcCRTAA9w0n7V/WRoZ?=
 =?us-ascii?Q?qtGZ8VJOwPRDPK8nv5+1pz55Ra/DA2816Zub1rx6ziAJcRZpfTQx8YWbLrMB?=
 =?us-ascii?Q?54Zio4lTudo/duZCeUXhHbzMacxvlh6uJ5zFkjVGsNNUYdu1bHXNgqsIexnd?=
 =?us-ascii?Q?YVCyfp7G9nxdF0tLJGfiNmLDwGzmuJAhJvHsddP/NsAhrqDCUDjIcXnyqEz0?=
 =?us-ascii?Q?ZxSEarg+UYM0jfZ7WyyNDFrvjrEO9Q9k4UNBWdt7oqX5KOGi1fVT1hUxPEOs?=
 =?us-ascii?Q?jJIq5qUMws+Bae7O4BPx7/oGkMMoVwH2oWlyBowS/t+9jiW9bC0eEC/xIW7n?=
 =?us-ascii?Q?43rYf4OZ5vVgzbFIVetlKFL5I1qEEo6PoGMgkNVi5AUR31Bjy11yaeg6rnJw?=
 =?us-ascii?Q?onMJFRCZUds7ErRJkJhosO19ELTbC5ujU7nGmkHHDR0oxX68D/0wadP6ojRG?=
 =?us-ascii?Q?rdt2GuoeTBVlC51dMS5KbJo1AsRVMeGP6CGK+iIGk3ngJEwajhzWvr6cuGiL?=
 =?us-ascii?Q?nv8o/hxZ0srp1mdBh9Pq5htmvKKR2yNbK6UrS76gsUGC1AEBQ2DCfXNovAWG?=
 =?us-ascii?Q?m6j/rDrS7Lq+znw2ipEq8mH1ezf3iF6Z6WPzAUmmM0KZMqm6WCblcmAPVRry?=
 =?us-ascii?Q?9h6exdDAWwVaptzPVkGXFDaPM78f0QtCg0Xe94lJpZLRVC76Y9Oh+octuoQ6?=
 =?us-ascii?Q?FKNoFDAX8VwBJmUxjlL7HsZ5Z0iHJESRzmvzIgnJ8e+AXxP0ORp1y2UkVR4M?=
 =?us-ascii?Q?k+F/nNxODRVb4/HvClqkPe4jjc1/+hORO114tbMtZwW1J8LSlarDDqkxcPBe?=
 =?us-ascii?Q?00J4BRxKeYmVjhU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5949.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8u/zW1d7FZr0n61nokBkFFlSsTvupCrCpihmbN82hIn7HeEy+Cb9TKjZvTLB?=
 =?us-ascii?Q?kLliOGdnhrIYV4WnopTP6KGVWUll1L7cnrB735Fpa/m3I5Y0qHiy/dtEGGlU?=
 =?us-ascii?Q?zF1cqbRxXn0OulPE3PlpF2mJkQ0rozaJcRZXj3iUf7J46Uk17VvDHPhXL4vW?=
 =?us-ascii?Q?K1LkWwDHRoD/U+qLPxBu8HWJ0DSgXp2Ddgt65mbC6ilNM78RvF9Zg8QCfrmx?=
 =?us-ascii?Q?aGqA70p5V9kpAfMCtPWD3WD7fSQ6lW9GzR9Wqb1AFlFCxyF+q//fyGD0utLM?=
 =?us-ascii?Q?jjMJ97YHiDgCWreZSr4qkXAHRN5Hl5yLMmoy8Fw6CdkvuIiBJ1KTMk/Toexl?=
 =?us-ascii?Q?hO3snPR6Z50+frO28PtSpBSPuGb6SOWeqoMZLbpG5+UPzlWGaWQ3xahW61Xd?=
 =?us-ascii?Q?m1bycaV6eIo7EuDM21MMmWTom0Sdqbn626DdmcaAHri0peWuR8Els7+HwOXg?=
 =?us-ascii?Q?TS2sNuS3t3uLe+8YI2Tlr87NUNKL8DkIm5OqauiWx/I0vwPliZQ9aygYbMA/?=
 =?us-ascii?Q?LiRKqHWcnqAvwVcOehWyuaSuyH+v/CipKF2bHQw6MDAsFxC/II0GAKE23eV3?=
 =?us-ascii?Q?wSdilE8MbRQJJl7A6gIi9kPW6eBtJZBhrvPCjUCfI7+zQ2LvV/QIL4GtPIjK?=
 =?us-ascii?Q?jY72Zfc2LGLy7O2B22D156uNLxgU6dw92uWQi5RxuHIC+jDCzcqqVHqdODO1?=
 =?us-ascii?Q?mqju1dIr/7RIcAHzIcnLElzZZuoepG/yaeDZaFrttgS5n7yyo9xWWc+novdD?=
 =?us-ascii?Q?p5nkpgxT9nJCc4m1TRv1cgkrvN9PZU2D2X77kclje4Q96iH63X3cZKCTRGAE?=
 =?us-ascii?Q?0/l261rgjbg5IsTVVYj0Vth6fet6JMvnhbm9+OtGGSm4ewyNvGIi5+4W0PMi?=
 =?us-ascii?Q?2/MbgSDYxdXjf1uW6CmjuZp26jwY/aH4Ya37kGO5UNEKh6Citg5YjgsuOLck?=
 =?us-ascii?Q?m7nv5ZwfWm7Te3t9SDkafHlLC7OPc3EFP+TlujZAzCJBEU1kXJf8g/KKNgcQ?=
 =?us-ascii?Q?SUOznXsEySGXeEoV1c6VSbhfHUTj73nwImUbwi+nP78SYGiMo/I0ijEYYQha?=
 =?us-ascii?Q?HaropwKcHSpyhFW1BoYnYNTLBwtzSb93ayPIBuQbFl/ISYLMxDCPMWGgdbmz?=
 =?us-ascii?Q?Xi3Q6HC2LRpAF6VUBKHVbazIbm9ktcJYBWTx2AFmM8KI/K7tNS+vtsz8Xolb?=
 =?us-ascii?Q?wT3FJgD8ZR0OGKNO/sMwjOfxRIcQU42wouDUTT7gMHdqld/Sq2M1SfebOkYF?=
 =?us-ascii?Q?QJq0t2A8Vp11p3VHUQBN0l4d+E7uphAjGPXdTp2ohL1drSaA8A9PnEBhL/Si?=
 =?us-ascii?Q?Yyay8jQn9F5JFD/IhwC91vW0HLoy5HA4W5dbrCHvmyAEZTzWhur2v/+leV/5?=
 =?us-ascii?Q?RX2rReIjaiJr77iPzqGgn0m+T4lptVqdbrDaMmxdyhfbES7DVTl2xjT8MGjO?=
 =?us-ascii?Q?rS1a/FhdKC1Q74m9FAuVQSSYhSY/45nz1qv5S3Abbn0B/YoZp/BNrrR1cLZb?=
 =?us-ascii?Q?PSTXyCtC0tFv4t0tmZH51lVuWv5sUVrvmGNB/8p4aBxNRT4Cs/ZjWgqhx0uY?=
 =?us-ascii?Q?xjlJlGuBOSJTH7uGhSuDtdRc5F1Lz3T5O+mRca4V?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5949.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7648c58c-1fb8-44e2-c9ad-08dd9787c1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 10:19:08.4658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oETOybzpGJEThqQifDgLMPHi4X7qH/wtZCvoNYAxheOoWp3MCEn/P54XkTBxbQ/NhoIdiuG4D4Ok3DtrxCKJbT9OeKTcNeAvEfaaZUKeYi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA061B3868
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

LGTM
Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: Tuesday, May 20, 2025 3:44 PM
> To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Piecielska, Katarzyna
> <katarzyna.piecielska@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>; igt-dev@lists.freedesktop.org
> Subject: [PATCH v2 i-g-t] tests/intel-ci: Add platform Blocklist for Eude=
bug
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Add blocklist file for LNL/BMG and core blocklist for debugger functional=
ity
>=20
> v2: Add files to meson.build (Rama)
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
> ---
>  tests/intel-ci/meson.build                  | 3 +++
>  tests/intel-ci/xe.bmg.eudebug.blocklist.txt | 5 +++++
>  tests/intel-ci/xe.eudebug.blocklist.txt     | 4 ++++
>  tests/intel-ci/xe.lnl.eudebug.blocklist.txt | 6 ++++++
>  4 files changed, 18 insertions(+)
>  create mode 100644 tests/intel-ci/xe.bmg.eudebug.blocklist.txt
>  create mode 100644 tests/intel-ci/xe.eudebug.blocklist.txt
>  create mode 100644 tests/intel-ci/xe.lnl.eudebug.blocklist.txt
>=20
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build inde=
x
> cb775e2f1..84bbdabc6 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -9,9 +9,12 @@ intelci_files =3D [
>    'fast-feedback-chamelium-only.testlist',
>    'meta.testlist',
>    'xe.blocklist.txt',
> +  'xe.eudebug.blocklist',
>    'xe.bmg.core.blocklist.txt',
> +  'xe.bmg.eudebug.blocklist',
>    'xe.bmg.display.blocklist.txt',
>    'xe.lnl.core.blocklist.txt',
> +  'xe.lnl.eudebug.blocklist',
>    'xe.lnl.display.blocklist.txt',
>    'xe-fast-feedback.testlist',
>    'xe-fast-feedback-chamelium-only.testlist',
> diff --git a/tests/intel-ci/xe.bmg.eudebug.blocklist.txt b/tests/intel-
> ci/xe.bmg.eudebug.blocklist.txt
> new file mode 100644
> index 000000000..661e3122a
> --- /dev/null
> +++ b/tests/intel-ci/xe.bmg.eudebug.blocklist.txt
> @@ -0,0 +1,5 @@
> +#####################################################
> +# BMG specific blocklist for Xe EUdebugger tests
> +#####################################################
> +igt@.*@.*tiles
> +igt@.*@*multigpu.*
> diff --git a/tests/intel-ci/xe.eudebug.blocklist.txt b/tests/intel-
> ci/xe.eudebug.blocklist.txt
> new file mode 100644
> index 000000000..e13a5cc2b
> --- /dev/null
> +++ b/tests/intel-ci/xe.eudebug.blocklist.txt
> @@ -0,0 +1,4 @@
> +#####################################################
> +# Core Blocklist for Xe EUdebugger tests
> +#####################################################
> +igt@(?!.*xe.*eudebug.*|xe_exec_sip.*).*
> diff --git a/tests/intel-ci/xe.lnl.eudebug.blocklist.txt b/tests/intel-
> ci/xe.lnl.eudebug.blocklist.txt
> new file mode 100644
> index 000000000..cabac8858
> --- /dev/null
> +++ b/tests/intel-ci/xe.lnl.eudebug.blocklist.txt
> @@ -0,0 +1,6 @@
> +#####################################################
> +# LNL specific blocklist for Xe EUdebugger tests
> +#####################################################
> +igt@.*@.*tiles
> +igt@.*@*multigpu.*
> +igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
> --
> 2.40.0

