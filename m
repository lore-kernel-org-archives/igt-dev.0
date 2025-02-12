Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B436C021A0
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 14:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C961110E8C8;
	Wed, 12 Feb 2025 14:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7JgdWsN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB3D10E8C8
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739370722; x=1770906722;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=7qZiKu1064QQG1rhcLi48To2h1OF1tO4lPJQIXmtNps=;
 b=Y7JgdWsNigRsaY+aJwvXa89e47RWvk6xWlWE+QDtVJmVlzRQtmDtLiNK
 FEpQXx2PCy31leY5XWc+R5+D+bRY6BSAbDkbu5tzUOw9zG3Sklmdc1CMC
 ab1JeYeOVfFHPzILttS7zeJoSZ8S81gyohVv2HT+5bLtgLnTsUktRFstN
 NSB3h2nS6f4/gPYoDrQjGts89Pr6WB+4spTeTVpzkR71DCbks9rvSkYBF
 ly5/EWnYFQtlB9mZjACFY2QbXMhRhIhR/XwKTTPWyoe94EB4oIP7SP7Fk
 v2f3949pmfDso/Tk/1xUKm2zxbGq+SP/2FV//wGB2RhiQmbtwZWFB7/IR w==;
X-CSE-ConnectionGUID: 281jWJBiRimjGN5nYRC6kA==
X-CSE-MsgGUID: MXpkh/JaSoCmItQ3UNR1/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43793171"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="43793171"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:32:02 -0800
X-CSE-ConnectionGUID: vFb5SiwhTWu3ifflYYgHVw==
X-CSE-MsgGUID: r6i+wzWrSz2JscRxeTCKOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="112820403"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 06:32:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 06:32:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 06:32:00 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 06:32:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez5cx+9QFwU/8e7v44Mfp0yrkns0+GbaDXPXv0/3/ETbdILyWfff8p6UNtTjhgP+kpFgS2JIWTxp832LX21VVORA3JgjygaFlXMZVJdMFQPHIRlAUs78kiLmhWggS3X+EZ0Evmh4C8QBf5aBByNhKPeyIijxfX5c3D5AdfDvTC4PtrkVoTnFMdDyOqbo+7NVRLpghsUff+9MIwge4ZGbVw++/5nT/3osLNVLAXckNhKPtRnsNd0lcdejM2/+TPG4OQTDQqltZC8i3PQ5KSVY0jAVgKOr5T7HAn5Y9QH72HqaNewU+mQCtkSBEn/11imUBGOfhN4ZnSJDKL4cXcQx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qZiKu1064QQG1rhcLi48To2h1OF1tO4lPJQIXmtNps=;
 b=X/804xReyNqZhXz+6V9LyeRm7W+UVjIjnw+3yOdPc+Vf/GxunakHl96Ke+FvaiqyEhYBzZY3dRAjnMJciraOW69jrMkCahON4/1bxzYcAQkpae/yVwuDqY1gvUIUXlTcxBIkrp8p1fdeQhmx9QjcNvzn+iLq12E4V+tcRH/4RnJKSouB7Ytrpprl9iNyYk9oY1aWmAQK0f663362M+8GKzPAkby/5FbIQF28qJLOlKaCSgVwIRLUzS1/Tv9nZguJMGQSmbPMJpp5m+99BXiaTbtHtRUrqkj5UR1GYB1MGPQ8o4R4OfFcblaYPDRVsmRMC126JqBLC1RiTkTXARkcbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 14:31:16 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%6]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 14:31:16 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "Musial, Ewelina" <ewelina.musial@intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>, "Grabski, Mateusz"
 <mateusz.grabski@intel.com>, "Heikkila, Juha-pekka"
 <juha-pekka.heikkila@intel.com>, "adrinael@adrinael.net"
 <adrinael@adrinael.net>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Brodzik, Konrad B"
 <konrad.b.brodzik@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "peter.senna@linux.intel.com"
 <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
Thread-Topic: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
Thread-Index: AQHbeKsMTfTlXcEkHUyPpoEH5+j2nrNB2zoAgAAJo4CAACKOAIABcuWAgAA/EoCAAArRAA==
Date: Wed, 12 Feb 2025 14:31:16 +0000
Message-ID: <538d6ea4b204946527411550ec74876ccb77f2f0.camel@intel.com>
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <20250211092108.enj3kzrlh3rzh6rk@kamilkon-desk.igk.intel.com>
 <d137decd-4adf-474b-a56b-1398ef5472d1@linux.intel.com>
 <IA1PR11MB6097AD4DB631A02EF73EAE1886FD2@IA1PR11MB6097.namprd11.prod.outlook.com>
 <c246f66564337e7778abc23b23fa1ad7400138c1.camel@intel.com>
 <20250212135231.6lxk2j5ezg72glra@kamilkon-desk.igk.intel.com>
In-Reply-To: <20250212135231.6lxk2j5ezg72glra@kamilkon-desk.igk.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|CH3PR11MB7673:EE_
x-ms-office365-filtering-correlation-id: 3afdb661-3c59-4f70-3cd1-08dd4b71e88f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?T3U1NndQQk55ZmVkc3c4Mnhoanp3VlZaUUMwdkpRZlVnVitzOWxCRkpwVGc5?=
 =?utf-8?B?U1hmWHptM1ViU1RqYm02U1lWTHVDczdqbHZoYUZJazlnbm8zbTh2QnUyem5N?=
 =?utf-8?B?WFVlMmc3NHJaSmlZSDJzaGhobVBkV25hYkxGcWZFUDUrWDFaaDBnQ0dKVFF4?=
 =?utf-8?B?WmI3MUdpRlZZOEgrdzEyQm1HZm1Ld3lVOTZQMjVLNjFtMFBBMENLdzdOQVdO?=
 =?utf-8?B?VW5pQkxWbDVhRjZFRmpGRjZVV2R5YXFWUHF1UE9tSWljNW11b3RRVFFLMlFN?=
 =?utf-8?B?WmpYdll1TjQ4YUovYVJqcGhJNjBiTGJCRUNiK2pmb3gwb3l0Zk5pSUJxcElo?=
 =?utf-8?B?SXVXMU9IbmpMbWV3NGVPRk1nSnQ5WHBFZzU4Q1V2N1p2VVpiM3VaOEx2VExL?=
 =?utf-8?B?a3F2Wlp4VEl4V2Nodnl6RVdyQ3d6YVQwQTg4WmFqUW9hK1BWalFPNjlvU2p1?=
 =?utf-8?B?ZnJGOFVKRWpyci9UZGd2R3hWZmQxcmZtd0xDMkNBZENwZ0t5cmJBb29kemJj?=
 =?utf-8?B?Rm4wMU1DZEkvOUo1ZWNMRFNSRHZYZ1BKMksraE9KeXVrb293cGp1TnNRdnR5?=
 =?utf-8?B?VHpESTlpSi95RVREVGtyYTEwaEN0a3MyS1BRUHV1M2NvdnFzUHQ1a3J0N0dP?=
 =?utf-8?B?a2ZGdWlEQ2F2MEFGczk4QS9YbWRmbGNrblFXL09EVG5BNW9GdXhHRXUxN21Z?=
 =?utf-8?B?S1hZSXVyU284MVBqdThSTDJpelVFc2FqYkJ1NEsyZWNlMWVtdTh2OW9ZYkFG?=
 =?utf-8?B?MGlJSU1zQmxqdGs0WFpFdGZ5eVQvcExUNjZNeWJCbG9mR2kzL0MwbVU1MW9K?=
 =?utf-8?B?SG50cnkyQ2RYQ1hOam5KczBOMzdaZXdSMEkzcGNydk5zazJpajZuYUxIclcx?=
 =?utf-8?B?dHM4TW8yWnhESHAxQUlMVCtGOXhHeVJaUGNudHIvcTRMMk51YjBaYWNLWDUr?=
 =?utf-8?B?TTJTdHlRcGp2akNEajlLREpBczh6Z0FmTkNJQ1Axb0FCTndIdFh0YS9LU1pE?=
 =?utf-8?B?TFg2U1loWjZPNlhjSXBLRjRQdTg4alAyUmxDekxMbUtmTUJmeVJMRTFSdzJY?=
 =?utf-8?B?WjA3Y3NqNURDR1hobTdiZUtwQk0raDF2cEYzQk96N2ZYNURzN2JkZmg2c2Vn?=
 =?utf-8?B?a294N3JBZk8xRkkvd01CR3JUb25xMTQySDJjYTNwQjhpVGw3elhRQTZxTzJL?=
 =?utf-8?B?Y0x3anhVcmY4S1VIaDdWazlRSktUTzdHWlJudDhvbHFxbjhUYzFFNUM0dWU1?=
 =?utf-8?B?cWYrcktuRkNDOG1lMmZoTzBOeVVGQWtZRitpYjRmbUlmYVA0eHBENVphWHBv?=
 =?utf-8?B?R0sxM0djYmJNZTJKR245SFRhdFIva09yZnVscUNQVGtZdjY1WUNQZzBQUjBn?=
 =?utf-8?B?ZmlqM0o0MW9HYVdTdkRCSzVNZWRiYWlKQmNWem8wQ3pzZXZGd3FBb29FZ3lO?=
 =?utf-8?B?eUlUMzdWWFRCRkk1NVN5VUJ6NWk5ekRRaG5YZEFyL01uWGNBQTdtbUhObEVp?=
 =?utf-8?B?R1RlSnJwd2x6emV3ZDMrSWc2NHEzSkdVQ3psQkR4RFd1WVJ4Qm1wbk1IeWNK?=
 =?utf-8?B?Mm9iTVdMd3RCQy9nbmVJYzQ0Z2Z6RnN0YXhoR1RMSmppOWdJaGk3V3FjVXZ1?=
 =?utf-8?B?V3pKYWU1VWo5dVhQVFB4WUlzcFZvc1diM1hMbFVsWkNIdjNBWCtIZ25zM0tR?=
 =?utf-8?B?azV1TkZuUURJSWdpUUZWVzloMjBGenFNRGxhREJmSURMMk5KUjllU1p4cnNZ?=
 =?utf-8?B?OXFJTmUvNHp1L2R1WHVSWDIyRVdYcVE1Z1c5L2tvZzZMbmxDOWxIWEpWVVNp?=
 =?utf-8?B?OGRqUG8vK3JySVdpTzJxdWttdlBPMGtnYjFwQkE2RkZyMHJmRllLQlF3SUo5?=
 =?utf-8?B?WGN0NFVPdjQ5cURzem9iQ2IxLzlMZEpPa0lIV3RUYU02UFBvNmpuK25QdDd2?=
 =?utf-8?B?VXhhSXBtK0FEQldCREVBQVhJRTZRR21CY0VsUjNDRCs5dldKRWlCUE1uWUcz?=
 =?utf-8?B?enJ2cDF5eXF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(921020); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGU0aHVHKzFpYjVDa3BvMHFsUG83UnFlbFVubWc5WEE1U2FtaTBXMUJJaVFh?=
 =?utf-8?B?SHlwK1pVWEpHRk8yWG0rRE53aDVRMk5TZ0ZtRDAvdTBYRXc5V0h5NERnV1Q0?=
 =?utf-8?B?dDNzeGNNb1lGSXlUYnluMURFelByTkkxcEZIbi9ackNxanFoN0pKQXplZFgr?=
 =?utf-8?B?blFiRFdTbzFyS3NCRVJYK1htZHdzWEZXdUdHc1RGUTU5d1VqQmRnaFZrd0dO?=
 =?utf-8?B?TkpDbmlXaHliWk9oQmJKMjJueUk4b0d3UHhJS0N6T2dNdmRMSEw3eW9LWHhp?=
 =?utf-8?B?djFXVGhkaTNpUldVcjR5ZDlRM3o2bjRDaDU0dksraVJmSlFlemIveVBiUjYx?=
 =?utf-8?B?d2Z0TlBQTmhXKzhuR2wyZHlFMFZmVENRZWhiZGVRUkJ1USszSmFaMFlJWWtx?=
 =?utf-8?B?a3A3VU94NTlVWU95OWIxNll5VFNGRWUrQzFaZWdCYjJuczNqKzJmQmpzdjk3?=
 =?utf-8?B?ZktaMThhR0JML0FkYjdWa0R5L0xEU1FVbDhBNkpzMFhKc3ZpRjFOekJxMlNP?=
 =?utf-8?B?SmdwQnlDTnNJR0s0dXpmWE4zK0RGeWVMbFN4Vnp1cVBzVTVpMm1wMHNCYStL?=
 =?utf-8?B?SjVxbjY0clc1dGVIeGMxK0xZZGdIR2MrWTFDVG5lalBGVkdrVyt5MkllRVRq?=
 =?utf-8?B?UUc0SzJmdUVjUlZ1QVNES3NWVmg0Sy9NVnROandxZjExc2hBenNZcDdEQkxE?=
 =?utf-8?B?ZWFXakN1WHcybzRtR2JlOWYzZHg4YVRYZUlZVklJZXlMTzF6eC91QW5OenRK?=
 =?utf-8?B?SjZ2MWJLM3J3WlViZlF2R3JsYUs2RllQdUlYR3JXQTVNOWNRMWNkckRoOGo4?=
 =?utf-8?B?RkR1TlVWRGpsWFh5ZThTSGtGVk54K0FDSS9XeThKMmJMMXpKcHVoY2EwU2h4?=
 =?utf-8?B?RnpDb1c2TDRZMWlqVklFOEE4eWVyd1dDTHcrRlo4SDBySDNvUUM0c0NSeTV3?=
 =?utf-8?B?NThRREgrQmdKcVhiaW0yOHhwdGo5OHdaZ3Q0ejViTEZ2UE9Uc0FUUHhIbjJu?=
 =?utf-8?B?VnMzelppUDRxcC9nT2psWmdDd2gwbzlzVk1zK0NiTkxyYytQU3h6cys0ckRR?=
 =?utf-8?B?Ujk1Z2dtcjAxWDQyNk42aFZMaDI5dW1RVnoyNmxWMG0rWHlCRU5USk5nSm5z?=
 =?utf-8?B?dHUyUEk3OS9pWkcyOGVnYmlmeFlFMFd0OHROWEhZWEU1S2txeCtEK2QrcUxY?=
 =?utf-8?B?VHovZmx3eEE3MndVbGY3OC9wekdqbzlhZGpta0pzSjNaK09pTXl2M3NFZC9F?=
 =?utf-8?B?eFV4TGxMcWh5RG4zbFBtVEo4eVczTnJBbnNiaksvQTFacmVadHdrcmNVYndj?=
 =?utf-8?B?NGJ1U2VySC9ubnRKaFlqYU5HY201SmVmVjFKQTBCNkZCaG8xSWZ5R1IyQ1Zo?=
 =?utf-8?B?cHN1WDlyVDBxRlloYURIdkJobnpnaGN5THBLVjdpYXFBTDlHVTI4SE1RcXhG?=
 =?utf-8?B?R0N5azdzSTRYV0ZmSVI3cVZuMHhqMDZYT1VNM2pCUCtGVFcvUFVKaXVQREtZ?=
 =?utf-8?B?SXZDMjhNdm9CbjVXRksxanp2UFBlYWxMblRjUWgzZUJJaXNjeGpJL0xqRito?=
 =?utf-8?B?RGt0WEp2L0RHY0VaZU9hOURUWURzbUdrOVhFQnF3K0dpaFdWYnZiL0tkaFB4?=
 =?utf-8?B?NExQVTdDL2t4Vi9ZeCtSeVdtMHBlcW01K1FSdnhpQ0pBaWN4MG1BUVJZRThk?=
 =?utf-8?B?ZlBIM3oyWjE2RDdzaEc0VURRaTIxbUZQZzBnK1JqZTk5NnMzaWZLMW5yM0Ji?=
 =?utf-8?B?R3czMDJLOFJMUGtRclNVMWhSTVdoaDJZbWVDRStpUjgwRkhrYURBdCtTUlc1?=
 =?utf-8?B?NDFIcGR3a0xxSE5FZHhwanZ6NCt5ME4wQVVSWGFKL2hoRFZ6V01wMHNQN1lQ?=
 =?utf-8?B?bTZpbkxIQzZDQkRzbVpkaTlheUROMjFrbS9oUFdIelgwT0ZUS3Rld2dOckpJ?=
 =?utf-8?B?RnB6NDJ0dnR5TTViTmdac1VNaFJLL0NJQ1B3QUNleU1iZ1dDN1QyWFVjUlUw?=
 =?utf-8?B?dVd0eHlWb2FmY0Rpd291eGZ4SEFDVTUrc2NHWCtqejB1MU9JMnYvR2JyTXlG?=
 =?utf-8?B?M0N2QzNldEU3UG9wK1lkallVQVVCOHVjRGR4L1JpL2xhUW5iRDEza21lbW1F?=
 =?utf-8?B?UHluYmwzbzlQc25LWTRIamtvKzlvaGtocmlmUTByNGlTbFMva284akRhUjZS?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AE58C53E52AD6439CA45006AD747CB2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afdb661-3c59-4f70-3cd1-08dd4b71e88f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 14:31:16.0978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7/KnHPhmmgzrJt6CR7hpcEcwswRQpDPBIXcm8ZlV2+IyDUXonmaZirWljVpmQZu0VwAgEm9QoigSXdLrBRm3jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
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

T24gV2VkLCAyMDI1LTAyLTEyIGF0IDE0OjUyICswMTAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEtub3AsLA0KPiBPbiAyMDI1LTAyLTEyIGF0IDEwOjA2OjQ3ICswMDAwLCBLbm9wLCBS
eXN6YXJkIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyNS0wMi0xMSBhdCAxMTo1OSArMDAwMCwgUGll
Y2llbHNrYSwgS2F0YXJ6eW5hIHdyb3RlOg0KPiA+ID4gSGVsbG8gUGV0ZXINCj4gPiA+IA0KPiA+
ID4gDQo+ID4gPiANCj4gPiA+IEhpIEthbWlsLA0KPiA+ID4gDQo+ID4gPiBUaGFuayB5b3UgZm9y
IHlvdXIgcmV2aWV3LiBQbGVhc2Ugc2VlIGJlbG93Lg0KPiA+ID4gDQo+ID4gPiBPbiAxMS4wMi4y
MDI1IDEwOjIxLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+ID4gPiA+IEhpIFBldGVyLA0KPiA+
ID4gPiBPbiAyMDI1LTAyLTA2IGF0IDE2OjIxOjQ3ICswMTAwLCBQZXRlciBTZW5uYSBUc2NodWRp
biB3cm90ZToNCj4gPiA+ID4gPiBDb21taXQgZGRmZGUyNWYxNmJhICgicnVubmVyOiBBZGQgc3Vw
cG9ydCBmb3IgYWJvcnRpbmcgb24gbmV0d29yaw0KPiA+ID4gPiA+IGZhaWx1cmUiKSBpbnRyb2R1
Y2VkIGEgMjAgc2Vjb25kIGRlYWRsaW5lIGZvciB0aGUgRFVU4oCZcyBuZXR3b3JrIHRvIA0KPiA+
ID4gPiA+IHJlY292ZXIgYWZ0ZXIgYSBzdXNwZW5kL3Jlc3VtZSBjeWNsZS4gSWYgdGhlIG5ldHdv
cmsgaXNu4oCZdCBiYWNrIHVwIA0KPiA+ID4gPiA+IHdpdGhpbiB0aGF0IHRpbWUsIGlndF9ydW5u
ZXIgYWJvcnRzIHRoZSB0ZXN0IHJ1biB0byBzYXZlIGxvZ3MgYW5kIA0KPiA+ID4gPiA+IHByZXZl
bnQgcG90ZW50aWFsIGxvZyBsb3NzIGZyb20gYW4gaW1taW5lbnQgcG93ZXIgY3ljbGUuDQo+ID4g
PiA+ID4gDQo+IFsuLi5dDQo+IA0KPiA+ID4gPiA+IHdhaXQgdGltZSwgZXh0ZW5kaW5nIGl0IGZ1
cnRoZXIgd291bGQgdW5uZWNlc3NhcmlseSBwcm9sb25nIHRlc3RzIGluIA0KPiA+ID4gPiA+IGNh
c2VzIG9mIERVVCBoYW5ncy4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBCdW1waW5nIHRoZSBkZWFk
bGluZSB0byA0MCBzZWNvbmRzIGtlZXBzIHRoZSBhYm9ydCBtZWNoYW5pc20gc2FmZWx5DQo+IA0K
PiBbLi4uXQ0KPiANCj4gPiA+ID4gDQo+ID4gPiA+IGltaG8gdGhpcyBzaG91bGQgYmUgb3B0aW9u
IGZvciBpZ3QtcnVubmVyLCBJIHdvdWxkIHByZWZlciB0byBub3QgDQo+ID4gPiA+IGFkanVzdCBp
dCBsYXRlciwgbGV0IENJIHRlYW0gdHVuZSBpdC4gT3B0aW9uIGNvdWxkIGJlIGVpdGhlciB0aW1l
IG9yIA0KPiA+ID4gPiByZXRyeSBjb3VudGVyIG9yIGJvdGguDQo+ID4gPiANCj4gPiA+IEkgZGlz
YWdyZWUuIFdlIGNhbiBhZGQgdmFsdWUgbm93IGJ5IHBvdGVudGlhbGx5IHByZXZlbnRpbmcgcHJl
bWF0dXJlIGFib3J0cyB3aXRoIHZlcnkgbGl0dGxlIHJpc2sgb2YgY3JlYXRpbmcgYW55IGlzc3Vl
LiBUaGUgcGVvcGxlIGluIENDIHNlZW1zIHRvIGFncmVlIHdpdGggdGhhdC4NCj4gDQo+IEkgd2Fu
dCB0byBhdm9pZCBidW1waW5nIGl0IHRvIGxvd2VyIG9yIGJpZ2dlciB2YWx1ZSBsYXRlcg0KPiBp
biBmdXR1cmUsIHNlZSBteSBwcm9wb3NpdGlvbiBiZWxvdy4NCj4gDQo+ID4gPiANCj4gPiA+IFRo
aXMgcGF0Y2ggaXMgYXMgc2ltcGxlIGFzIGl0IGNhbiBnZXQuIEkgZG9uJ3QgYnV5IHRoZSBiZW5l
Zml0IG9mIHRoZSBleHRyYSBjb21wbGV4aXR5IG9mIGFkZGluZyB5ZXQgYW5vdGhlciBjb21tYW5k
IGxpbmUgb3B0aW9uLiBJdCBpcyB3YXkgbW9yZSBlZmZlY3RpdmUgdG8gc2VuZCBvbmUgb2YgdGhl
c2UgZXZlcnkgNiB5ZWFycyBvciBzby4NCj4gPiA+IA0KPiA+ID4gQW0gSSBjb3JyZWN0IHRoYXQg
dGhpcyBpcyBhIG5hY2sgZnJvbSB5b3U/DQo+ID4gPiANCj4gPiA+IFRoaXMgbG9va3MgbGlrZSB3
ZSBuZWVkIGEgZ29vZCBkaXNjdXNzaW9uIHdpdGggQ0kgdGVhbS4gQEtub3AsIFJ5c3phcmQgQEdy
YWJza2ksIE1hdGV1c3ogY2FuIHlvdSBjb21tZW50IG9uIHRoaXMgYXBwcm9hY2g/DQo+ID4gDQo+
ID4gLSBJZiB0aGUgY3VycmVudCB2YWx1ZSBpcyBnb29kIGFuZCB0aGUgcGluZyB0aW1lb3V0IGNh
dXNlcyBtYWNoaW5lcyB0bw0KPiA+IHRha2UgMjAgc2Vjb25kcyBsb25nZXIgb24gZWFjaCBicm9r
ZW4gcnVuLCBpdCdzIGp1c3QgMjAgc2Vjb25kcy4NCj4gPiBDb21wYXJlZCB0byBldmVyeXRoaW5n
IGVsc2Ugd2UgZG8gc3Vib3B0aW1hbGx5LCBpdCBjb3N0cyBtYXliZSBhIGZldw0KPiA+IG1pbnV0
ZXMgb24gYSBiYWQgZGF5LCBzbyBpdCdzIG5vdCBhIHByb2JsZW0gaWYgaXQncyBvdmVyc2hvdC4N
Cj4gPiAtIElmIHRoZSBjdXJyZW50IHZhbHVlIGlzIHRvbyBsb3csIHJ1bnMgdGFrZSBsb25nZXIs
IGJ1dCBvbiB0aGUgb3RoZXINCj4gPiBoYW5kIHdlIGdldCBsZXNzIGJyb2tlbiBydW5zIGFuZCBs
ZXNzIG5vaXNlIC0gSSB3b3VsZCBwcmVmZXIgdGhpcw0KPiA+IGluc3RlYWQgb2Ygc3B1cmlvdXMg
YWJvcnRzLg0KPiA+IA0KPiA+IElNTyBpdCdzIGZpbmUgdG8gYnVtcCB0aGlzIHRvIDQwcy4NCj4g
PiANCj4gPiBUaGFua3MsIFJ5c3phcmQNCj4gPiANCj4gDQo+IENhbiBJIHRha2UgaXQgYXMgYWNr
ZWQtYnkgYnkgeW91PyBUaGFua3MhDQoNClllcywgdGhpcyBpczoNCg0KQWNrZWQtYnk6IFJ5c3ph
cmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCg0KDQo+IEkgYWxzbyBoYXZlIG9uZSBt
b3JlIHF1ZXN0aW9uLCBkbyB3ZSBuZWVkIHRoaXMgbm93IG9yIGNvdWxkDQo+IHdlIHdvcmsgbG9u
Z2VyIGFuZCBpbXByb3ZlIGl0PyBpbWhvIGl0IGlzIGJldHRlciB0byBhZGQgb25lDQo+IG1vcmUg
d2F5IGZvciBDSSB0byBpbmNyZWFzZSB0aGlzIHZhbHVlIGJ5IENJIHRlYW0gaW5zdGVhZCBvZg0K
PiBoZXJlIGluIGNvZGUuDQoNClRoZSBwYXRjaCBjaGFuZ2VzIGEgc2luZ2xlIGRpZ2l0IGluIHRo
ZSBzb3VyY2UgY29kZSwgb24gdGhlIGxpbmUgdGhhdA0Kd2FzIGFkZGVkLCBhbmQgbGFzdCBjaGFu
Z2VkLCBpbiBsYXRlIDIwMTkuIEl0J3MgcmVhbGx5IGZpbmUganVzdCB0bw0KY2hhbmdlIHRoaXMg
aGVyZSBhbmQgYmUgZG9uZSB3aXRoIGl0LiBMZXNzIGl0ZW1zIGluIHRoZSBhbHJlYWR5IHllYXJz
LQ0KbG9uZyBiYWNrbG9nIHBsZWFzZSwgbm90IG1vcmUgOikNCg0KUnlzemFyZA0KDQo+IEkgbWVh
biB3ZSBjb3VsZCBhZGQgdG8gcnVubmVyIG9uZSBtb3JlIGVudiB2YXIgSUdUX1BJTkdfREVBRExJ
TkUNCj4gYW5kIHRvIGlndHJjIERVVCBzZWN0aW9uIFBpbmdIb3N0RGVhZGxpbmUsIHdoYXQgeW91
IHRoaW5rPw0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4gPiBUaGFua3MsDQo+ID4g
PiBLYXNpYQ0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiA+IHdpdGhpbiBvdXIgaW50ZXJuYWwg
Q0kgc3lzdGVtIHJldHJ5IHdpbmRvdyB3aGlsZSBpbXByb3ZpbmcgY2hhbmNlcyBvZiANCj4gPiA+
ID4gPiBwcmV2ZW50aW5nIGEgcHJlbWF0dXJlIGFib3J0LiBGb3IgdXBzdHJlYW0gdGVzdGluZyBv
biBKZW5raW5zLCB0aGUgDQo+ID4gPiA+ID4gZGVhZGxpbmVzIHZhcnkgZnJvbSAxNiBhbmQgMjUg
bWludXRlcywgYW5kIHRoaXMgY2hhbmdlIGhhcyBubyBpbXBhY3QuDQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gQ0M6IGp1aGEtcGVra2EuaGVpa2tpbGFAaW50ZWwuY29tDQo+ID4gPiA+ID4gQ0M6IGth
dGFyenluYS5waWVjaWVsc2thQGludGVsLmNvbQ0KPiA+ID4gPiA+IENDOiByeXN6YXJkLmtub3BA
aW50ZWwuY29tDQo+ID4gPiA+ID4gQ0M6IGV3ZWxpbmEubXVzaWFsQGludGVsLmNvbQ0KPiA+ID4g
PiA+IENDOiBhZHJpbmFlbEBhZHJpbmFlbC5uZXQNCj4gPiA+ID4gPiBDQzogbWF0ZXVzei5ncmFi
c2tpQGludGVsLmNvbQ0KPiA+ID4gPiA+IENDOiBrb25yYWQuYi5icm9kemlrQGludGVsLmNvbQ0K
PiA+ID4gPiANCj4gPiA+ID4gaW1obyBiZXR0ZXIgaGVyZSAnQ2M6Jw0KPiA+ID4gDQo+ID4gPiBU
aGFuayB5b3UhDQo+ID4gDQoNCg==
