Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E532ACCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 17:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F13310E47F;
	Mon, 10 Nov 2025 17:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDYW5mC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6793D10E2E5
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 17:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762797322; x=1794333322;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0v1bD7kgnCtYTDffU8YEyDknF+m4VBOIBD7Gmm3ILYI=;
 b=EDYW5mC1KCvmY/wjGzWjrgDXgUCVHpDxuehl5745Xj+3zCT5uKJeSrAP
 zC8Vrg2f894D4flFq8fp0DgdjTcoUEiZVJrxGkChzgEcsJizoIRHdFg3/
 cu6amFUsfgqKY3Kn6m/Ftuls9vbFxZtQ2kDCcIylHtyjUZx1i5SQ/FCyV
 1CusCOyKBkBZd/QVFbZxfT3m3UKykCPz1Q9q1xQrXps0zs3regmz5eD2T
 mvO5oU4O1YHZfKquDG4ptX+dk9NKl8ikc/lG/FY7kuzVClRojcMdOrfE7
 dBBDkS3s5GUf3rxTQ7crjfX5yd0O64CQGIUUahHwut0RN1Fv54Ztj0S/l Q==;
X-CSE-ConnectionGUID: S0LxNtZrR8+WWfm+w2PcpA==
X-CSE-MsgGUID: m4MRyXOqTBS+00pWtZGWyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="87483523"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="87483523"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 09:55:22 -0800
X-CSE-ConnectionGUID: Su/mkCu7RqOILsksge9N1w==
X-CSE-MsgGUID: Faf6Ww7aTI+3fMvE9hCHTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188903094"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 09:55:22 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 09:55:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 09:55:21 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 09:55:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8bRfHM0F+v45n3+db1iMXhjWs4CWstU0boU/PoDZRhJykV72bcE5s75d9pocCqGYUNfJkqVUSVUj5EyUfa2hGhVZmtc8dE7iwXOwB8YLRcYY01uuduy3QNJNcfqoTSTPRyLd6KdOvAvorTYW+ewHlPm7aYoHPcPLrZlSon3EGTNm3MAIA2n4qEEVmdtLzVW6kmYQKRKJqZpQcPYixPFzCwHfVajug4H+iozZy+SwBijBoEEVGMA8OEdXpBNNtbjYPFeHMo2Apws3Zj7U73P+N8ySe3CkFrOY2fSmP7z7aU5J+Hc+Ivpph0prFVnP1R4Cedt94eKM7mOD8HL3RH9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWfJymu2uovqBLvIpskqYuh3G4VtW3yeSbNz3RouOFg=;
 b=fx+ANhpm4HlABfcb5QLvJ33zxkN4BbJpnjX7n31fLqbcYCahfG9lKlfXCXiW+TxWvLgzK9k4SOnsbPvdnqd/ma/9fex1ubCYTabUKDCFcNsngI8qJoBY+b3IumZCBo8JHxReUcWleJUTYh9ht6YDydkcjzpIOwvnkAk9qYLJNXXJiEOR5UkSGCSe7kJxFGVTKY7oqWjYhePnmUicPcYAFdvj9fuerYEMbo6sLAVuD6aemXYMg1keRHv/A5zgHg9f9I7Szxbu/SmiRlQHsq/Od5TT8df7vHdL7L4SG7rr5Aa/hyD92RWR8mQf/Nj+OUGlRXXh7NtBJ+rmMMXlrgxM4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 17:55:17 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 17:55:17 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 16/18] tests/xe_exec_multiq: Add submission sanity test
Thread-Topic: [PATCH 16/18] tests/xe_exec_multiq: Add submission sanity test
Thread-Index: AQHcSpVIeAcdCl73Y0CplspOVR7JnLTsPOsQ
Date: Mon, 10 Nov 2025 17:55:17 +0000
Message-ID: <BL3PR11MB5747A3026061E15571C4DD66D0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-17-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251031183555.1882721-17-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|DS7PR11MB7951:EE_
x-ms-office365-filtering-correlation-id: 13562f58-f132-4be9-8ae1-08de20824ebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bUxZv4m6r0g6qIODzvyYhJi1I4wZYsM0SqKau1Uc1ezGXt9swYCzb0uaRExr?=
 =?us-ascii?Q?agWhK21sNRXmwKtOLh4gcaFeJkM+HsXXR9Ff4h2IusVkoyVgLiUFKW6YSPu3?=
 =?us-ascii?Q?hBbqJ+7JrsxkVTvQhtKAmEd1bSVZrVruvb6UKNPPoXsEPkvDpc4hTIAErCq6?=
 =?us-ascii?Q?TW6g/p2bBwS0dYLP+COhxBFpB/0NJvCSemJHWyXruvQueROX7wW0CIviJdSo?=
 =?us-ascii?Q?u21wMulkh7oo4PIutTq32qJMGG696dyaS0tzfAw7yYXV97ucXghyUNnqWkLt?=
 =?us-ascii?Q?OTN+Bpqc5+8cyhFr2IecDPHhoxqzPBOMhbYaKMnsMXvA+ZGXEaQvtq7aJ2+O?=
 =?us-ascii?Q?5pEnBK6RrMEK7iqEU9pcqb6+A/zNQ7g48pWTNKSIHQlbVa8b6y74PVWJEapo?=
 =?us-ascii?Q?prTESPDdXUSwXJSWFLVBaYh4LFt6iSqqf9hSvu8iCkg4PTqOc6lPwuxHZIp9?=
 =?us-ascii?Q?ZkIVuvjGkRPdjV81Dnr6k3ZNaEOxz1ZVnmpF4/bSq2DNpRMd74L+SbEj4n84?=
 =?us-ascii?Q?RGJSiNfIGAGE7Sl2hQuWILquBV8ZzYl6vvzERx8SNGHHag1dLv7kpf/2Yzh6?=
 =?us-ascii?Q?Ys84HrC5+MZb5riGrP+rO5O3XI7WhyC5bUyQS7zcsSGZYyHb6paZSW24s+1O?=
 =?us-ascii?Q?XsIANal9hnUB6Pr4Eixzpvc8SYoYPijufTHKYoVvjLz+yGvbq9WCepPFCJnX?=
 =?us-ascii?Q?3zg5QV1XnJEsQAjW8Oawps6Qk5fV5X4ICOOPYTEGgNxYaxpikswIOLsWUUTY?=
 =?us-ascii?Q?MepYrVBeEjyWaaEqvPVlR78GyandoCeiXv11VShQA+42DWFks6G+QMzufKVA?=
 =?us-ascii?Q?UgyI8VR1VO67qdr8eXZrOi9Y1M6u3JiKUswkwdFnagUIrtePjSUyH/x3VV2d?=
 =?us-ascii?Q?GBwPinWAbVXmOf/03Y6VMwiVMpZORyVERVeF++ZdwiqtDnLPxzK278aIHRff?=
 =?us-ascii?Q?55wsSVkWwJiZAVC4ZNAc6ZcsnsQmvdDphO1J0uv7HmQpQlbEHeiTNQMNZ7zS?=
 =?us-ascii?Q?dwCn5H5FxXL5bKgw1nbHc91M6aoU8eHJdhmYrmywiSjOCm5oQeS0YLv66Tv3?=
 =?us-ascii?Q?Tw4dd+Fwt/jZFJmzk7oNEHsYkDqdFy7czvFwNp1L1inqp3rKsq4orFH7h2Ee?=
 =?us-ascii?Q?hVwkeodL48Z663ow/uWck0deZgpaLiT63HYpO2H/3VSMe/2GWatRQEExwugY?=
 =?us-ascii?Q?+CJAdQi3ixaEU1T/VIWetFychTJqPPrHBw6ekZWtofuWWx61TZTAgg8/aZj4?=
 =?us-ascii?Q?1i64LoYKwLeZ764Q6Hd9qBUIZDUBJmeMEeF7jdVS8xW43SE6FwS+tNAOGLAD?=
 =?us-ascii?Q?JuHm7cVweQ2O2JFHXMO2h659K/beX9Pj95dZ2mG11j43q85204y3NJqsx2Cr?=
 =?us-ascii?Q?EQU8SCsA4yAbys1mIIov+VnixCa7CI5aGkOA7gU5CzBxE0r/JOS75Yi2LtQq?=
 =?us-ascii?Q?C3MCTaxYhGI2AobSTw29apIyhlCD6G+QFI9wB1g22xp7pitQnXlxUZSqST2W?=
 =?us-ascii?Q?Hd4wyPkgCah9mn5zvsn4oDbyCj5uNQb3DzBx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K7QGKRHQ7uTym/1UXUiWgp6WCSBrXYc56n/LsJT330bjHX82z50BfPpvyQ3R?=
 =?us-ascii?Q?PTSdcpK6Gs+HUL+SYROgg32bLXm0TX6GvFTkJ+iHQW6gOmnZJISnIlHC2S2g?=
 =?us-ascii?Q?VPb6GhAisDtkeqFt9OdegWRpXOdPsEN+B/2DLhKmF7L7bP8ab/R8FbmE3gjV?=
 =?us-ascii?Q?/fxYK2Y++XQL5gP7Pmk3+TXr+Tv6QC5f+JwVZwa4ZMm7uMGjiop7Y7hjuZZS?=
 =?us-ascii?Q?mFR/YKyDhGoGSbjH1vGuWiBSjqV55l2HyGcqJq06WEhPaWQd2Ga9BX62IHJu?=
 =?us-ascii?Q?I0DJtY18CziYBqMWH74W8GoenuWXxsFQKCUcT+1lZfM0umRobgNQMFkxfO5/?=
 =?us-ascii?Q?5R+aJ6JIAPBJV/UHvPi12pgWozM7SXHhfJB/YED0xIEBIO9ySNtl1T6hq/Dn?=
 =?us-ascii?Q?om1EJTlacrhE9hNN/2iFkgA5rUlmRiGS6V+grMS0Uo7EBZ4E1kzZFVmkXB4J?=
 =?us-ascii?Q?mtMMLuLs2rMo/h+2xCrJFTmpK560d7uPs81ovJEJm+RwGKuSCnbaK60ZrSpE?=
 =?us-ascii?Q?NTtmWSp03nCS2oONxcVbskAA813wY2LCSgbCk/FBKwduiMeuZdPIFtlmaUMy?=
 =?us-ascii?Q?Ef+B+6Hq+D7Op1gLNNrGfb2bENbeK/AN8jJItj+im8vwGE9znrta7rS0a7LR?=
 =?us-ascii?Q?WdWayKfS6v1h6KVG6J3R2lbDogmleesqRdEnUNOejeGNhcT9xDq3svsHKBya?=
 =?us-ascii?Q?ZyjrNlrIu4teNRkWXtny3HHytx9fhPsLqDe7Jp4zBM8PidxiBlYkJ7sudZM7?=
 =?us-ascii?Q?vIREKwSvUwBEGN0YLPq+zfB/wjIVCwS567As+5AG9Z2AKLqCm7/JJvLog5A8?=
 =?us-ascii?Q?lVAzIrCXCo2uvfPSOFlNk45Hbs/XYvrOdVH3kFgICeML6lst63Bl/iCWyRej?=
 =?us-ascii?Q?YwiO+4CcIlXaxeTb9UIN/WHdv24t/2VqW8usAB2A+IsXYDyggP4Qy6aM9zsF?=
 =?us-ascii?Q?3V1aqXXujtEXRY+QlTmP68wL1FsdCggr1SNDi1NSVktC9NWKcZ6Pljl7cD3z?=
 =?us-ascii?Q?Sh8sZB7hGuloKELZoCcXrTgm+jqp/11nodPY6GC0qTJ1/gpW5lWvoZRwDzwL?=
 =?us-ascii?Q?JTJNLhkjWiYpO0F48OcHs47T4PpLBu8reXcNRUMW6UXlp0DGEuiotIYQoj0J?=
 =?us-ascii?Q?QwAW8g/Eu6P6sFXNiPU56BJOr/FSPtWh6eyUCqTZO1mC9Luw4Ae4YHcMN16p?=
 =?us-ascii?Q?OZFKFonywjQrDP6oljtJmgjhZf5HGf3gfehnGA+qA2LaXqJgaTcPXESFH8EG?=
 =?us-ascii?Q?Z5T7RMaG1yKrswjf0rgB35X5VtN2+XMyEO/1abI47l2RlBvWTAbKOwOtuZfE?=
 =?us-ascii?Q?1wJoK9w+9VSHGwvP6K9/GwYbWamEGSkKxBxxfLCvQcIr2Fpj3bAijuiBrihH?=
 =?us-ascii?Q?ZmeSZtpTGvPhZzh6gr786Crw5x/nUa5zGccqoA9KpFa1L/5pKA2otT2agcEM?=
 =?us-ascii?Q?CTck3lTYvuPSjczV6b4mhyQcJMk+nLIM7mhFaJzGGWPxBleQ9V7t/DHLzZtg?=
 =?us-ascii?Q?47IG3hQxZ28lQoG7alknVDMhe+Csj5SrQabtOda4+Zi3Y9Ev9Ciz68nZPNDm?=
 =?us-ascii?Q?WJrbKqvSVGY1VgHYoHRcGBWjJ2mZHz+0VJ6PGnot?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13562f58-f132-4be9-8ae1-08de20824ebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 17:55:17.1458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fCxpoBrch0Fha9VD0myJ/QDCOlqmlt/537FYygulc4Gmo1GKoviwG7Enr8ab4nPHGITQ4idwoOtR/5fT4uACPkuLO20h/Nx13gtbcIpg56c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
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

Hi Niranjana,

Please find my comments below,

>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Niranja=
na
>Vishwanathapura
>Sent: Saturday, November 1, 2025 12:06 AM
>To: igt-dev@lists.freedesktop.org
>Subject: [PATCH 16/18] tests/xe_exec_multiq: Add submission sanity test
>
>Add sanity test involving exec submissions in multi queue group.
>
>Signed-off-by: Niranjana Vishwanathapura
><niranjana.vishwanathapura@intel.com>
>---
> tests/intel/xe_exec_multi_queue.c | 138
>++++++++++++++++++++++++++++++
> 1 file changed, 138 insertions(+)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c
>b/tests/intel/xe_exec_multi_queue.c
>index 9cd4a7a16..10b89692f 100644
>--- a/tests/intel/xe_exec_multi_queue.c
>+++ b/tests/intel/xe_exec_multi_queue.c
>@@ -44,6 +44,9 @@
>
> #define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
>
>+/* Number of queues in exec sanity tests */
>+#define NUM_QUEUES		2
>+
> static void
> __test_sanity(int fd, int gt, int class, bool preempt_mode)  { @@ -216,6
>+219,137 @@ test_sanity(int fd, int gt, int class)
> 	__test_sanity(fd, gt, class, true);
> }
>
>+static void
>+__test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci,
>+unsigned int flags) {
>+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>+	struct drm_xe_sync sync =3D { };
>+	struct drm_xe_exec exec =3D {
>+		.num_batch_buffer =3D 1,
>+		.num_syncs =3D 1,
>+		.syncs =3D to_user_pointer(&sync),
>+	};
>+	uint64_t vm_sync =3D 0, addr[NUM_QUEUES] =3D { 0x1a00000,
>0x1c00000 };
Imo, constant can be defined instead of hardcode values for base addr/offse=
t.

>+	uint32_t vm, exec_queues[NUM_QUEUES], bo[NUM_QUEUES];
>+	struct xe_spin *spin[NUM_QUEUES];
>+	int64_t fence_timeout;
>+	size_t bo_size;
>+	struct drm_xe_ext_set_property multi_queue =3D {
>+		.base.name =3D
>DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+		.property =3D
>DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+		.value =3D DRM_XE_MULTI_GROUP_CREATE,
>+	};
>+	uint64_t ext =3D to_user_pointer(&multi_queue);
>+	bool preempt_mode =3D flags & PREEMPT_MODE;
>+	int i;
>+
>+	sync.flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
>+	if (preempt_mode) {
>+		sync.type =3D DRM_XE_SYNC_TYPE_USER_FENCE;
>+		sync.timeline_value =3D USER_FENCE_VALUE;
>+	} else {
>+		sync.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ;
>+		sync.handle =3D syncobj_create(fd, 0);
>+	}
>+
>+	vm =3D xe_vm_create(fd, preempt_mode ?
>DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>+	bo_size =3D xe_bb_size(fd, sizeof(struct xe_spin));
>+
>+	for (i =3D 0; i < NUM_QUEUES; i++) {
>+		bo[i] =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>eci[0].gt_id),
>+
>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>+		spin[i] =3D xe_bo_map(fd, bo[i], bo_size);
>+		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, ext);
>+		if (i =3D=3D 0)
>+			multi_queue.value =3D exec_queues[i];
>+	}
>+
>+	fence_timeout =3D NSEC_PER_SEC * (igt_run_in_simulation() ?
>SIM_MULTIPLIER : 1);
>+	if (preempt_mode)
>+		sync.addr =3D to_user_pointer(&vm_sync);
>+
>+	for (i =3D 0; i < NUM_QUEUES; i++) {
>+		xe_vm_bind_async(fd, vm, 0, bo[i], 0, addr[i], bo_size, &sync,
>1);
>+		if (preempt_mode) {
>+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>fence_timeout);
>+			vm_sync =3D 0;
>+		} else {
>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>INT64_MAX, 0, NULL));
>+			syncobj_reset(fd, &sync.handle, 1);
>+		}
>+	}
>+
>+	/* Validate job submission on secondary queue before primary queue
>*/
>+	for (i =3D 1; i >=3D 0; i--) {
>+		xe_spin_init_opts(spin[i], .addr =3D addr[i]);
>+		if (preempt_mode)
>+			sync.addr =3D addr[i] + (char *)&spin[i]->exec_sync -
>(char *)spin[i];
>+
>+		exec.exec_queue_id =3D exec_queues[i];
>+		exec.address =3D addr[i];
>+		xe_exec(fd, &exec);
>+		xe_spin_wait_started(spin[i]);
>+		xe_spin_end(spin[i]);
>+		if (preempt_mode) {
>+			xe_wait_ufence(fd, &spin[i]->exec_sync,
>USER_FENCE_VALUE, exec_queues[i], fence_timeout);
>+		} else {
>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>INT64_MAX, 0, NULL));
>+			syncobj_reset(fd, &sync.handle, 1);
>+		}
>+	}
>+
>+	/* Destroy primary queue */
>+	xe_exec_queue_destroy(fd, exec_queues[0]);
>+
>+	/* Validate submission on secondary queues fail after destroying the
>primary */
>+	xe_spin_init_opts(spin[1], .addr =3D addr[1]);
>+	if (preempt_mode)
>+		sync.addr =3D addr[1] + (char *)&spin[1]->exec_sync - (char
>*)spin[1];
>+
>+	exec.exec_queue_id =3D exec_queues[1];
>+	exec.address =3D addr[1];
>+	igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
>+
>+	if (preempt_mode)
>+		sync.addr =3D to_user_pointer(&vm_sync);
>+
>+	for (i =3D 0; i < NUM_QUEUES; i++) {
>+		xe_vm_unbind_async(fd, vm, 0, 0, addr[i], bo_size, &sync, 1);
>+		if (preempt_mode) {
>+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>fence_timeout);
>+			vm_sync =3D 0;
>+		} else {
>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>INT64_MAX, 0, NULL));
>+			syncobj_reset(fd, &sync.handle, 1);
>+		}
>+	}
My suggestion would be to add a helper function for sync something like=20
wait_for_sync_completion() which handles synchronizations in both modes bas=
ic and preempt-mode.
>+
>+	/* Destroy secondary queue */
>+	xe_exec_queue_destroy(fd, exec_queues[1]);
>+
>+	for (i =3D 0; i < NUM_QUEUES; i++) {
>+		munmap(spin[i], bo_size);
>+		gem_close(fd, bo[i]);
>+	}
>+
>+	if (!preempt_mode)
>+		syncobj_destroy(fd, sync.handle);
>+
>+	xe_vm_destroy(fd, vm);
>+}
>+
>+/**
>+ * SUBTEST: exec-sanity
>+ * Description: Run exec submission sanity tests
>+ * Test category: functionality test
>+ */
>+static void
>+test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci) {
>+	__test_exec_sanity(fd, eci, 0);
>+	__test_exec_sanity(fd, eci, PREEMPT_MODE); }
Why not add two subtest for exec-sanity and exec-sanity-preempt ?

--
Sai Gowtham Ch
>+
> static void
> __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
> 		unsigned int flags)
>@@ -911,6 +1045,10 @@ igt_main
> 			xe_for_each_multi_queue_engine_class(class)
> 				test_sanity(fd, gt, class);
>
>+	igt_subtest_f("exec-sanity")
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_exec_sanity(fd, hwe);
>+
> 	igt_subtest_f("virtual")
> 		xe_for_each_gt(fd, gt)
> 			xe_for_each_multi_queue_engine_class(class)
>--
>2.43.0

