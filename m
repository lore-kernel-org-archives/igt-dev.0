Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B62C021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 13:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9EA10E28F;
	Mon, 24 Feb 2025 13:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWpbZlK0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC9F10E28F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740403272; x=1771939272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hinrZ3nZ1Wj5wIj47M76dLgtvgppmu9c9fVPaq3/sF8=;
 b=MWpbZlK0O5/4YlJ8/phv7TaF7RbYCaJc8vh5doRIzUcnxDFj0BI3xwG2
 qljXei6NtbwjlCm0kpRwMH/JOo7ygRHTJaveRiCu12aY6WrbsBdXhY1P2
 bshdfDfGbH79XhH7Xm0apviPUVA1PfcqiOnd8EuwmmjGwE8eed70L98Mf
 7oKJyCJUT2km468JIKmXUFXQHeUf7npEhODw3SkSsodXVHvKcxuePxLWB
 3HynuHnpPqhWvfkD3zhMLBz4Xax3gPHj6//h7dpdnafmolwiJcfqYi8r+
 e/UdrSxGoTtnsB74Z59TsLU0uKm0Vtt72MInXVqq9vy1u1ukzpWx5vdQu g==;
X-CSE-ConnectionGUID: jh/i3lbtSj6QVK1iuL5JsQ==
X-CSE-MsgGUID: 9TMJ/SyaTbmkEiyT1/Y1TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40344896"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="40344896"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:21:12 -0800
X-CSE-ConnectionGUID: jJ8qZVp8TXWQA5rNUSElAQ==
X-CSE-MsgGUID: yfBN1QoxScOPLTzgKxuG9g==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="146909177"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:21:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 05:21:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 05:21:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 05:20:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBwBm1F7CQsbAcfcihikNvyHS/kvUJJDrQ8zI9hOJRVCAkZIH7Hmh3KSn5Qh1n7ddH+/wvj4+CpU/b4HHMV+mkh/HT5gN08HCzr/gw2+RKnSbzxRpspqJnzxRcnoTlSrQCjV1lri5OAP4VcbY05oh5qY6EL+nk//G4U9GnylpZF582Y2DiKdnMdrVeWAIjHVwO6q1ikiifn9QBR+e2foI5Z3YcFsIxQq2E0kKeJzDAaR9iUygYllBRlErWQRJDtpz8uNUtV2IgsrddVMOGf0p78QP9n4weDT0dgtihrSF/KrJdsSX6q8kIdlFUk83vEyYVtbFCSJYBufUIv0Li7zpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBdxUjboYr+Qa9FNM4DlzFn3/Z3Qm4XZkduOKV8cDOg=;
 b=FBPPAe8Ft/yyJrSb4NJ7yQECPlszEzwbgn2wclrtyrzZ49wDgSEoshbU3jGfwoK0sixGofx2l0+c6NI/oy+1MelbH/865hbFY0a/lQRXXq/f0kJ+cGnx97AbH9kndkIMWdi17uPBowPmMrqyyWzmdVVwGTdFok178lkyIIEEJUnPjz89v4pFAAgkFODYvO+Pox9b8/W0i6vNZ+ynp2ScCTIi8QUjmcJTmGbs5vwu0OFrnT+qVEnxdWcHzasDWMBLxGCp2wYWOlk/tPVv6oJIWAsrTcfx/nN143WOdqHAKbGj++5vXFqIPqC5wJmQoUvvJNi1XxvzeMmS0DBDZSvX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.21; Mon, 24 Feb 2025 13:20:23 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8466.020; Mon, 24 Feb 2025
 13:20:23 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] lib/xe_eudebug: Export
 __xe_eudebug_enable_getset
Thread-Topic: [PATCH i-g-t v2 1/2] lib/xe_eudebug: Export
 __xe_eudebug_enable_getset
Thread-Index: AQHbg6gcBJJzbic+F0KPSM4gs9zuYrNWdc2g
Date: Mon, 24 Feb 2025 13:20:23 +0000
Message-ID: <DS0PR11MB7264387E53B0498D29A192B2D9C02@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250220145912.37735-1-christoph.manszewski@intel.com>
 <20250220145912.37735-2-christoph.manszewski@intel.com>
In-Reply-To: <20250220145912.37735-2-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|MN0PR11MB6012:EE_
x-ms-office365-filtering-correlation-id: 7b553163-a00e-4ccc-48dd-08dd54d5fe98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?AxsU6/6lBWsHpTQ9JJhkqObKZUYQtpx1mLKcwbeLmbsrbNY61oUZNOsvKO?=
 =?iso-8859-2?Q?8s6SxEFf9mP76yYTXwv0UdJrYl4+zoi+nZaniAJy2Ib/cEDdDe0+aYEQin?=
 =?iso-8859-2?Q?8HVifWA5TkdY5GInuTOo4mhW57d1Bilpm3Dej830aAF3ZPfh96P5C/hJzy?=
 =?iso-8859-2?Q?yWolBDPlShLLNoXo+H1Njq9WbWnO/Mx/9taj/xSgH5UKkuvsGXLOUnkFvl?=
 =?iso-8859-2?Q?0sG829yy0/Rf3kSKHXXQZ/ymMoop2l56WiUQticA7IPNCvmZdlRCdenlQn?=
 =?iso-8859-2?Q?vBfqNscOvFqh+VsG84b0WyzL8/h38XUYh9hBmHYT/sZRKdu7Ygr71trCH4?=
 =?iso-8859-2?Q?OY39jyxCEWPL+02+0IquB4K8sOvhMy8apGCsggsWVgnfVKmY8l27lXBFC4?=
 =?iso-8859-2?Q?Apz+XGBrB7OdYtFmtSHvfDuCfTNLskwKE6YazEEmj2nXXt4icjRM2Hhm5E?=
 =?iso-8859-2?Q?DyeO4FVfUo1bnCFNTjVynkCE5ZJsU7C00hEUQRV4QuIrUV4kawReAOZu98?=
 =?iso-8859-2?Q?fG23ttz4tUEEJu59ASYl117AMjRwMowPRr0TNv+7qD/jg/YXnHJl9sf2cj?=
 =?iso-8859-2?Q?pylfxgkf2h440hKDScsPb1Jp7k1y7Etw+zAETZQ1Lh1j2TPvCqWPcXQVKQ?=
 =?iso-8859-2?Q?jdleg2POAZv3Mgzwg/RQv7WW5MjKZjYsNY9vu7lOrZOAp6vyyVtVN65Eh/?=
 =?iso-8859-2?Q?YTZS/UqNpiKbU0HRJcP3k5RVyxUTeOyln0yyh2SZygmtalfmqAsK1p91Lh?=
 =?iso-8859-2?Q?1C8asMkcnKyggoaY8Ln07vh4Mx9coeiJxlRJfTZW0oO1qz4xHnPp71e4oJ?=
 =?iso-8859-2?Q?P7WoU7b6FP6Xk5vBNEJUn6XRUSB1KHclrdppkqm3/1w1jMCfKHhofD8pzZ?=
 =?iso-8859-2?Q?Qz7dyePWXOnzprgL5g0qqajGXFYDA3PUZ32lbKc79xEmp4byOAf3rhanfH?=
 =?iso-8859-2?Q?oFNqbsiLmaS5Pp57iR1Qpl56FA1rNVRDGqlJcy87Lpx0yHiNjy7MmwP2Dz?=
 =?iso-8859-2?Q?mt98fX3LaNXxwCgyLE3dVSpRfdZ/ZMmGv3AhffCsedXuD9cF1NEjdA0Z8B?=
 =?iso-8859-2?Q?Hy5g+zGKbeGgTEOBD+LPekbbgwY3eQwWiT3aGt0owvq9/rXphOsnDX+q7V?=
 =?iso-8859-2?Q?GA9hoMRx5ZOuCjTrcaXI3yw8+B9/7onJsODQeMA2STMYusZhF06HP3tfWP?=
 =?iso-8859-2?Q?odY2jt6wcfV65/UpcqBOQbalFP1VGzqsWCOpKWHq7SQJICNEmgJOudGHsu?=
 =?iso-8859-2?Q?eVLgc1F1TOnqQv27asLyxg7dzfQPQbgTFEoKecDqqrG/6IXQ/tR0IvRZhG?=
 =?iso-8859-2?Q?Mh3lej0lOd2JA1+57nCxky7H/imBIWWM1fVvjA8Nimc8XfkBNgQVwnxlK/?=
 =?iso-8859-2?Q?OOrEZuqa6yj+KvH2glPCPPLs7qVF9ocCFrAOSpGy0FiaPE/Lgwx0KXIRRF?=
 =?iso-8859-2?Q?anjBRxYv7reux6EqH87KJNsw+w2oI0HT1DLUuznEW2aWVI8VIaQuBHnU5F?=
 =?iso-8859-2?Q?8C1kPMDmYP2m0AdKoU/Tmk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?8AgbgBBorrr5TLxKlnfmqrhJL5mYszA+zKgCwJUomS/+th4e6zd2btU3nW?=
 =?iso-8859-2?Q?/LigcYHGC3nyOsaCyHYm2K52l/j8gAvsGKOSjbErHicXQKu0eHa/1nzo+1?=
 =?iso-8859-2?Q?SFyD68emBaaLA3XVueLNI0C1xVfLaA0nMbRqdQXQpeKXcxwpxAC9oYPIrW?=
 =?iso-8859-2?Q?04I/CEVKuWtKBHLCd2dh2Cf+adqQ9SIgEFIg96Gr51REN+QmAxlok3TqT9?=
 =?iso-8859-2?Q?H1vQrX563+WAj/uP5VnFoAnXiIvXiZKJyU33raANOYB2T8z/xlqPCvU3Bi?=
 =?iso-8859-2?Q?Dm9ex9naqBwe776+IleTjF7JxIHKJQW5iRp8J3zSsW8RVEJc8xgKH3z29W?=
 =?iso-8859-2?Q?ch5GI5eI05bo+zs722YVcpAcV62ZKtKix4WlfWd5BH/elc7eerok7XmqK+?=
 =?iso-8859-2?Q?9IvwQ/TgNv2wYYOFTd6O18GmtpN3R4H2RcolIWAL0xHTMae5DheDk39Iln?=
 =?iso-8859-2?Q?rJxNPcFUvcRETZ5Y6UTsxjly04do97il4rBDwTWmVLVwK6Ax3Hnanna9f0?=
 =?iso-8859-2?Q?e6YGIAHLHhtms+kBzOFXVUPSwYaIKFHO8evYUvraNigmMN2IJhoYqfaLLF?=
 =?iso-8859-2?Q?xgTWOqE4pNFwnj98SZrHf2lTgO39RUJRAwAi6i/daUuKXa4zOaikahoqJG?=
 =?iso-8859-2?Q?9NdXMfLSDcFhvuua8RxjJGaWUMsxPQZSeUMnyOoeVB93ClHMnqUh08yd8+?=
 =?iso-8859-2?Q?V1p2L16j43hBlmSEF4AcwBOpa3/4DVZZB7NMqdNnvo93MZpOj1U4mdVUfr?=
 =?iso-8859-2?Q?BmRmoQrNqJSfHtqxTzCdBeep7PY8n8bMYUlTNtNQgwqaCq2bRN586Vv3lK?=
 =?iso-8859-2?Q?/JRjymWs6z25HIDldqv9F1f4glEE7qvzBIMQKzFeOMdZhEdYHAro9z9nGp?=
 =?iso-8859-2?Q?sU1lZd80XDClw73tg9PzPV0FStzdTHG8P6jQgE69FU8T9g24b3Q82wfxeK?=
 =?iso-8859-2?Q?eczhHTqtwPDafMH3c1XIL4YEk+aa2fQcLNdlxtNQAZ2CO8NP0IrXgDtYnW?=
 =?iso-8859-2?Q?mOVdywPLG/LxTNzpkX2tfIuSbl+1r8RNhVRjyWBAE/avoMZU1jvAyQmY2g?=
 =?iso-8859-2?Q?BNthk1Ia43aKJBZD+SLNQjexdyw41LNCzkEjpHKHkXPYsF5+2v8n2wHiUW?=
 =?iso-8859-2?Q?9QEQBXevcev6+ytRcyNsB9qUz7dnjW6oaDbmq6J7uZnKyfnCSY8c7OWX78?=
 =?iso-8859-2?Q?/I2rw1gCuf1AVI36fG4/E9dNP1l60AmN0/a2DrAaS1bB5duM76GXQfzdhX?=
 =?iso-8859-2?Q?D8ACT0MhM1q/wd+3yRS1THt6NQQYCrxCnbodQiQgPFkxYlrE84pcRS8hvj?=
 =?iso-8859-2?Q?PH1bww6RwZ4y3AaSsiAxzvU2iMUlFeliNKIXnUuUt+hzIPXqid/oahRnVv?=
 =?iso-8859-2?Q?SSExO2SYZPJIyKCfdjb/ihoFVs6quuTfDC1tgKAHsYCfpBWJisvcIiRaSG?=
 =?iso-8859-2?Q?aMlgeOshqKlJ5MGLOsL8ROpcNWZRiTp/A/s4NJz+fIGtb9/u/6RUXOwkfD?=
 =?iso-8859-2?Q?WpMKoxFYCWeV7UkAigq7BaYXrRyE/OqZtr4YlwzrY2TWnjbl1hblFTFt6X?=
 =?iso-8859-2?Q?p2f7tSm8FQ/GIkxvK8mFhs4fHLgjYyNEbK7WYPvvoHclULizQek9yHafgO?=
 =?iso-8859-2?Q?LPN/+oWJir9NCw5QzMEIYP7d8iPu4hCZlW96XFTyTkmaPQpoZA77LfRQ?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b553163-a00e-4ccc-48dd-08dd54d5fe98
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 13:20:23.2134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DfWCCDu/sCFwIkUFFgu55rSAFR80E92teH/NXWruxKnU4tfNayzVuMZM6zUU1gM7GxFYb5o1nhoTr41efuwK+dLqNzrfnsHeVT26OaH1TeRPdPQ/Co3JtDTjeUYH8Hrh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Thursday, February 20, 2025 3:59 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>;
> Grzegorzek, Dominik <dominik.grzegorzek@intel.com>; Marcin Bernatowicz
> <marcin.bernatowicz@linux.intel.com>; Mika Kuoppala
> <mika.kuoppala@linux.intel.com>; Laguna, Lukasz
> <lukasz.laguna@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Manszewski, Christoph
> <christoph.manszewski@intel.com>
> Subject: [PATCH i-g-t v2 1/2] lib/xe_eudebug: Export
> __xe_eudebug_enable_getset
>=20
> Export __xe_eudebug_enable_getset to make it possible to catch error
> code in tests.
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 15 +++++++++++++--
>  lib/xe/xe_eudebug.h |  1 +
>  2 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 1205d945b..04f0e86e9 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1710,7 +1710,18 @@ static void metadata_event(struct
> xe_eudebug_client *c, uint32_t flags,
>  	xe_eudebug_event_log_write(c->log, (void *)&em);
>  }
>=20
> -static int enable_getset(int fd, bool *old, bool *new)
> +/**
> + * __xe_eudebug_enable_getset
> + * @fd: xe client
> + * @old: pointer to store current toggle value
> + * @new: pointer to new toggle value
> + *
> + * Stores current eudebug feature state in @old if not NULL. Sets new
> eudebug
> + * feature state to @new if not NULL. Asserts if both @old and @new are
> NULL.
> + *
> + * Returns: 0 on success, -1 on failure.
> + */
> +int __xe_eudebug_enable_getset(int fd, bool *old, bool *new)
>  {
>  	static const char * const fname =3D "enable_eudebug";
>  	int ret =3D 0;
> @@ -1767,7 +1778,7 @@ out:
>  bool xe_eudebug_enable(int fd, bool enable)
>  {
>  	bool old =3D false;
> -	int ret =3D enable_getset(fd, &old, &enable);
> +	int ret =3D __xe_eudebug_enable_getset(fd, &old, &enable);
>=20
>  	if (ret) {
>  		igt_skip_on(enable);
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 823c7f6ea..3adde5f6c 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -171,6 +171,7 @@ void xe_eudebug_client_wait_stage(struct
> xe_eudebug_client *c, uint64_t stage);
>  uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c);
>  void xe_eudebug_client_set_data(struct xe_eudebug_client *c, void *ptr);
>=20
> +int __xe_eudebug_enable_getset(int fd, bool *old, bool *new);
>  bool xe_eudebug_enable(int fd, bool enable);
>=20
>  int xe_eudebug_client_open_driver(struct xe_eudebug_client *c);
> --
> 2.34.1

