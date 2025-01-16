Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19B7E77188
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 04:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9039410E8A8;
	Thu, 16 Jan 2025 04:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSlxjF1B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A34A10E8A8;
 Thu, 16 Jan 2025 04:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737003120; x=1768539120;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uGWJ/VqplIwKdM3YzwFHTJQbYhfo3/0BDEmD0hNxHII=;
 b=jSlxjF1B65OU66pwy/JI/JouRWfWI8zfbiUZIclBbluJaKjnCG1D2fZb
 BZS0YmQhMfnVZO1M6r6yxc2+p3UdzbMe7nktop3NcdzfdPryGtE/O2gRS
 mOXnlCTREe/zehaBg41Kyd/kY8dcOlp2yFaOhAuv2yUO0MX7pnbbUfpfQ
 9ZNSOL13bY9tZDgosEQPx3SBzzahthk7VwAcQuGVG/v/eIH1AzjpQDTJ9
 L8WSg6UChG8dRZQRPXHzZNcRFWFCWAqbBKvFezMvWbDz59vMjQotHFbBO
 t45V24L0s+mT5oEkWN1X0dgf1eBduP4CQaN12f0H9YqF2c3uIviYOU7eY w==;
X-CSE-ConnectionGUID: acW2UxyqROq9NZVuC7WIOQ==
X-CSE-MsgGUID: aduWqZLtRe+WVWHXetQ3Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37486238"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37486238"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 20:51:59 -0800
X-CSE-ConnectionGUID: fGGKvMK0R0y9ldWviufxeA==
X-CSE-MsgGUID: OD8LJvQRRkSoJrZKV1my6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="105952561"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 20:52:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 20:51:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 20:51:58 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 20:51:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwH4S0wOKyjXpX8VUu9DHAh2FpSorU1OtgmYGCDPoHbbZxjt+rHh6D0Ev1tlWI6Hv+vRa4PgcaKPiYBIQvJOKqL8YEDoZWIIe3yy7Da8qJeZfdg5G3APtD/+QovzMLbPyn8w1nspOyX5y4ptAWUZJ7yf94+X7j4eC4vxa6Awn7oQQV5SM98KUYTCd040+koeLe0O33CcnhqVd0rTnzXWDRqHSQArl9SJY/VqR1+jSzVjgLltbSHUeLaVAf/w4Jhv18HoIFLFh84S8t9QSuYo0qQMvUg2fChosz6OyEgJcVVf7WAofUReMP9krW3c08GDAg7Tltjf0ZirMiWv/zY7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGWJ/VqplIwKdM3YzwFHTJQbYhfo3/0BDEmD0hNxHII=;
 b=DvkcgxB+Hs2tWaOxyqg4lNuroXZrx3mkAL3zoo5JRnehQLMxaKUjzPAJ5vjdNwBPFW9ZvplWHOMLL2D3GJ5a/PfC7kdaNEstiiUsDty8yowYSAj2TAFZpNjL31HEJFNveMcIkOwsuCLG5nOw2VRvJ7pjZP18SJUREdxLyrrYo7vRvtMZW9ZUFOpBQOcLd/JH+ry7oy2bSxiFFQ4XhnnYIWL6j8zTz2IR40ZzTWGJx2W6MErxhgAlHFAmFSRL5ubJ1+RV2BD5teXK9Q/aw444dKu0WdbiqqNU73rXWKj2qTMCXQN1a61UzPAz++UkxY9IFAgwQC0KdEyd1cq79SUhjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 04:51:21 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 04:51:21 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGxpYi9pZ3Rfa21l?=
 =?utf-8?Q?mleak:_library_to_interact_with_kmemleak_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgbGliL2lndF9rbWVtbGVh?=
 =?utf-8?Q?k:_library_to_interact_with_kmemleak_(rev2)?=
Thread-Index: AQHbZlyjc1bXLJ1ItkSdOG9VsaAtB7MY2ChA
Date: Thu, 16 Jan 2025 04:51:21 +0000
Message-ID: <CH0PR11MB549176A6125CD21C59A4A190EF1A2@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250109181027.90402-1-peter.senna@linux.intel.com>
 <173677284723.3237056.1486075895877836651@b555e5b46a47>
 <480075f3-8914-47b4-afd7-4b73658996d4@linux.intel.com>
In-Reply-To: <480075f3-8914-47b4-afd7-4b73658996d4@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|SJ0PR11MB4927:EE_
x-ms-office365-filtering-correlation-id: a79a0412-c053-46a3-783c-08dd35e96c4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?a0Q5Q3ZHMjZxb1l2Z1VGQ3BaVHQ1WEN4UXkzbXo1S3pNZDVoR2g5blFXOC91?=
 =?utf-8?B?VHFmNlhWYmVISEZZWmlaUHYxQWF3d2ZRZEJpSHJUSVB1SkdDR2dDTVNzWHZW?=
 =?utf-8?B?UTU2SkgzNmV1RXh0RDBMZThZVkQzcFhSWnlmbDY3K1hOMEViZ3VMWE1xM3N3?=
 =?utf-8?B?dXNuZ01XMEtpVXhHY2tveExicHh2eGdVY2FTR1h6U3djcE5LcnE1M1U3UmJU?=
 =?utf-8?B?UHpjM3pzYUFaU3h6eWhmdEkveDlQSy9Nd1ZkK0xGZ0pZY29qNmpWUFRXL2tz?=
 =?utf-8?B?elJqU0FaRVRpQkY5cmVUZUN5SmJYdVhrcEd3NHJoNHRmeGh5aFJia0JzUDU1?=
 =?utf-8?B?TG9FUkp1Tk84aWFIcjA0aFFHK0FOZHQrb3VKeGZqTFp5a3diQUp2U21wQUFZ?=
 =?utf-8?B?UnYxeXNGRDVpVVFIMmlCOGMvekpFMUJiTk9aR3QyM0tIWWY5WW1HNGRVQjJw?=
 =?utf-8?B?Nmh2c0RrM3o4WGwrZHVxM0FoVHFQWTlxZmdHY3FUZjdUeGY2cGU2QkNCbUkr?=
 =?utf-8?B?MXJQUWorU1E0d0c5cGVsMW5sanhmWWlEQ05ZTHpQR0k1bzc4Zk8xMlVyd0k1?=
 =?utf-8?B?SmtkS0Rka08yRU5FS1FqcnlzRXREZmlvSlhQNHE5Tmo2SWhhMUJOY1ZOcS82?=
 =?utf-8?B?ZG9WV2wyam9sT2tZNDlaL25oVWVJQk9ncysyRUxZN0haYUZlMFdBeVp1RWZE?=
 =?utf-8?B?OTRONmM1STYyVVZwMG9MYWZubzVSK0NJUG9lZ29XVjN0WVdUWTVnejAvMUJH?=
 =?utf-8?B?WGFLQjVPcHNiUTB4dS9NMzZIeWRwTno5YmNUQjFmVkpRWUlsM2J1SHFGM1Zk?=
 =?utf-8?B?bVhaSldKd0dZcVE0aXFqQ2hnamp4RlpqT2VFRndwNWVPdGV4eElEN05HTXg2?=
 =?utf-8?B?ejlnZjFWR05SUU1Lb3FGSEFPaDJxb2pqdGQxTFRBVlJhWU52UzZsTmhRclFR?=
 =?utf-8?B?ODVGWitEbDFrN0psbHArM1VjckFPdDl4Z3QrK2Z0RVVSdVFpc2JzbXdHTjMy?=
 =?utf-8?B?ejBkdjN5ZmVYRGFqb3hzbnp2emUwRk54YUoxQVlDYXlwNnBzSlZoTTVBTE5j?=
 =?utf-8?B?OTk3d2dwUzJ3NXBUTVVZWFAyYytEMXA0Q09VdXJ6THJ2MjhDd1V6ajhVUWVY?=
 =?utf-8?B?bFFJKzVYL2JycHRaOXBwR0wxZUJ4TkpVc05zOXAyZEsrMnhlcWVkYmRRWTdL?=
 =?utf-8?B?M1JEbStRRUhXcE5PbUFZb0c2em5VQko4aTRtOGxvS2JFYTVNNnppbjltTTNW?=
 =?utf-8?B?R1NBUHBNNFpTTWpKc1N3Q05vYlY2bkFYbVNoNCsrYk1PamFYckVYU21iZW1V?=
 =?utf-8?B?YmxSWUt3cGkzWGMzVzBIU0lidkJmWW55QXJRcStWdXBJK0lpYk5sa2taVHJP?=
 =?utf-8?B?ZU9wQzc5K1JUdXNhQllqTmVHeEhlM1RFendJYWE0TFpnalo5WEY4YldJZHdu?=
 =?utf-8?B?Q0hlTlpoM1BGRjg5QTJCMENaSVNFQjN2STNoZDZtd1QvVExxRDFkZEJqWmgz?=
 =?utf-8?B?KzYvNmtnaTRXU0htUkIzbzJlbWZvVGU1di9ya0FSOEVCd2RwZU9WVVZLc3pJ?=
 =?utf-8?B?bUJSK0w4bmlva2xqUmp5cmFxbDhYKytuMXV2ZEVNWVJjZmRKT01aWTVObVBS?=
 =?utf-8?B?dUNEdXlRMXg1U0EyaDNrUHNiemRFMHoyVVB6WmtNYWhnRGY2MGlBYW1ZaEQ4?=
 =?utf-8?B?SFhLaG5rWUNZbU1VR0VRZmZGRXJxSllXeUlnWkVMV2pHdHQzUzJ5b2JFbmFv?=
 =?utf-8?B?U1A1RkNpN1JQQnVjZWQzK1J6NGVlczBsd29FU3QyVmZsdENHMm40MFpEY1N0?=
 =?utf-8?B?Z3Bob2hrMEdqUjQrRmJkNnkwUERqdU1STDBMS1p1UjJZZnVVTjJnZXYrT1Z4?=
 =?utf-8?B?alAxdExMNmNRNHVPemN0K2F5aUdmeU5wUDZTYk02MU9JWkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlZOemNSbWpqeStuWC9BeWFrMVlLSnJqUGJObWtTSk1reTZBY0FWU0l1cG44?=
 =?utf-8?B?QWdlNnhERkdWdjQ1VVNpNVlWaHcxWVhtZXlZMm0rSlZrN1pDVUJDczZzZUY1?=
 =?utf-8?B?aUxUaGYwUTl3c3JKZm13UVJwblUwNmlqemRIT2E1ZEt3dHhxa0tKYlZVazQ1?=
 =?utf-8?B?Qk5EQW5nbVZEWkgvSlpCNkxrUllOa0FETXZuN2VpL1BJRTZwNFRwS29pd3d1?=
 =?utf-8?B?VVFkdzJRU0JyRjB6UnhwaHZ5bi96NDdVL3M3RUpsS2RMcjhDUnRtdzNzQ09l?=
 =?utf-8?B?b1V5NTE1d3ExTXJzTUc2V3lRTGpLaWlEalBVZVZRUkV3Y3BwWFAwZWhobE5x?=
 =?utf-8?B?SDQzMUh3T0Z4ZkpsWDlKNWpJc3VVWksxSkhxWVZaTkE5Q09rRGxZTXhPTDAx?=
 =?utf-8?B?SmZXdFd6TGtrNnNOdk1TZWl2c3hId3dhdngvVHpTbXRwTCs2UVNjNnA4YUJT?=
 =?utf-8?B?aVFOK3BJdGxnTlpJTjhsT0hiVEs0UVJtZzVVSGxCb1krbFJGczNXeklySzRT?=
 =?utf-8?B?SGFmbGNRcElHZTZaVmNvNHFVaUczZGpHeFI1V3pUcEt2djJHYzZsT0xCOXVE?=
 =?utf-8?B?ZTFhYnhEcUlIdGZibjVwa0JHUkg2SkpQVS9uUVFZZkpFWG44c0xURlJtNlRF?=
 =?utf-8?B?dEd5S1NOYzFndUJGdllaLzFBczdhTmF4S1VVWFlzamo5ZkdrMUdBZXhiYkxw?=
 =?utf-8?B?UWtNMnZIOTk1WmRCNHRPRzhrblU1MmJ0TnVlTTEvMHArbFZ2cGYrWWlIMnZM?=
 =?utf-8?B?MzcxR0R6eHpueUxWbElsNkRaTmNlb29iQXNkMmg4cjRBKzA0RnF4VExsS0di?=
 =?utf-8?B?TUxtYm1VTU9ueUgvVWNWRldQNWkxd1pXUk9pZnVSVStrR09BdUo0d1NsNUVu?=
 =?utf-8?B?ZktqNlZxaW05ejhqejNPMndGQTZXVGkzS3lKTXNKYlR6WklyMzU1UXRKNC9n?=
 =?utf-8?B?ZWc2Q25LUGx4R2Q2dm8vRkpUSGZtdG5aVXllbER0TE9JSW9peUtuMXA0L1RP?=
 =?utf-8?B?eXRodGlva1RwcXNObjhNNzZKQ09BM1I4OFNYY1p0R3F4Y1hyYVhZSG93VUpT?=
 =?utf-8?B?dm1NSkU1b2c0TXpUSiszR1czSXFHanV2dFBiekUyanJ3RXkwaDBkUm9oa2tG?=
 =?utf-8?B?Y3ZHTXdLZzA4TnFyczEwNGkyNHNwS05ZK09PenJ2UmVDRDdHOWZFcldqdkhZ?=
 =?utf-8?B?dWtIY2N5Tmg5bHlmdDcxSzVMQVhnYW1PRmRpS29uSVVxbDB2azV1R2lZWFU2?=
 =?utf-8?B?ejJTYWNJSnVWc2c2NUJ5Q0h5RjM1M0VHTFVPQjhrQkFpbmRpdHpKeGhibmxS?=
 =?utf-8?B?KzF1d3F2azhKR2hYcHRNM1IvSWJZdnFwcUxqamRKY3BiU3ZkdjFrdmpTeTRx?=
 =?utf-8?B?NVFmaW9LUG5vZkVNRGdhK0dkZ2JDNHNzdHlueWpEeFZ1bTAxRis0alFnb2Jz?=
 =?utf-8?B?Qmhzd3crZXlkSERxWURHNEZMNGw2bDRzL25Vd25WMWh0UWRxN3NEMEp5ai9T?=
 =?utf-8?B?cFdzZitZVDduTHlING1MOCtCWkc2MThYRTRtQVUxelpNbjlhNjh4ZVE3K2VH?=
 =?utf-8?B?bThtUVZYQlNLM0ZNdWZpYnhHUWx2cmlheVljQkpXTys3N2hoMmJUcWxTZjhW?=
 =?utf-8?B?MVdqa1Y0eWNpVSthdHBWVEN5TzBxaEFXbFl0MEN3VlU1S0trU1ZySHpXTHRa?=
 =?utf-8?B?NzcrUGErd1BrZEJELy8xVjExTHdLTjQ5ck1wdDV4UEdDazluSEJkZ3JneVdE?=
 =?utf-8?B?dHdaVWlvRVQ0U3NJWmloRzFEamZDZ2lzK3RYRzdxK0w0Rlc4QnNwanZkMHFi?=
 =?utf-8?B?UmlZUUtKdjZHUWttdWprTlFkTnpwaWJTdDNyRFY1T2ZOcWxpVys5bzFiVmhh?=
 =?utf-8?B?TDdBL3RoSmJmRkRyRk8xektNK3NYeWZPTUloVjVNQVdwWmhiMUpPbG14b1o0?=
 =?utf-8?B?VXhpL1pOcE84ejBSa2hpdjA3bTJxc3hpTm44bnRSSGpkOGU0ZFJyUmdzM3J6?=
 =?utf-8?B?MnFGUDZldTBnMlpIYUFaMWFwU3BsNlFBWkxFbFZWUG80emtrNElMRGZLa25E?=
 =?utf-8?B?QmV1R0N6c3R2WUg1ZGM3dHpRRTgwdFVsTG5sUy9aUGlVTDlPTWZicDREUHRF?=
 =?utf-8?Q?fkMRRutIy6V6X6CGX+7aRrtCK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79a0412-c053-46a3-783c-08dd35e96c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 04:51:21.6464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mE26fsXPDuz+joZH921GCb4a2qlV9SLxsEj5GxNnZPNlxheHZsliiPR86sq3EuaNJ1v2qaTNNQnYPEXXdxQNZn5vgLt60gGs9ff9kfDXPwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
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

SGksDQogDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MjY3My8g
LSAgUmUtcmVwb3J0ZWQuDQogDQpYZS5DSS5GdWxsIC0gQWRkcmVzc2VkIGZhaWx1cmVzLCBYZSBj
YW5ub3QgYmUgcmUtcmVwb3J0ZWQuDQppOTE1LkNJLkZ1bGwgLSBSZS1yZXBvcnRlZC4NCiANClRo
YW5rcywNClJhdmFsaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1j
aS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mIFBldGVyIFNlbm5hIFRzY2h1ZGluDQpTZW50OiAxNCBKYW51YXJ5IDIwMjUgMTM6
NDYNClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkxNS1jaS1pbmZyYUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5GdWxsOiBmYWlsdXJl
IGZvciBsaWIvaWd0X2ttZW1sZWFrOiBsaWJyYXJ5IHRvIGludGVyYWN0IHdpdGgga21lbWxlYWsg
KHJldjIpDQoNCkRlYXIgSTkxNSwNCg0KDQoNCk9uIDEzLjAxLjIwMjUgMTM6NTQsIFBhdGNod29y
ayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogbGliL2lndF9r
bWVtbGVhazogbGlicmFyeSB0byBpbnRlcmFjdCB3aXRoIGttZW1sZWFrIChyZXYyKQ0KPiBVUkwg
ICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQyNjczLw0KPiBT
dGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBj
aGFuZ2VzIGZyb20gQ0lfRFJNXzE1OTM0X2Z1bGwgLT4gSUdUUFdfMTI0MjFfZnVsbCANCj4gPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4g
U3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMg
dW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEyNDIxX2Z1bGwgYWJzb2x1dGVseSBu
ZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5r
IHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2Vz
DQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xMjQyMV9mdWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIg
YnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0
aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJl
ZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVybmFsIFVSTDogDQo+IGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI0MjEvaW5kZXgu
aHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoMTIgLT4gMTEpDQo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBNaXNzaW5nICAgICgxKTogc2hhcmQtZ2xrLTAg
DQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+
ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9k
dWNlZCBpbiBJR1RQV18xMjQyMV9mdWxsOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiAN
Cj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGdlbV9leGVj
X3N1c3BlbmRAYmFzaWMtczMtZGV2aWNlc0BzbWVtOg0KPiAgICAgLSBzaGFyZC1tdGxwOiAgICAg
ICAgIFtQQVNTXVsxXSAtPiBbQUJPUlRdWzJdICsxIG90aGVyIHRlc3QgYWJvcnQNCj4gICAgWzFd
OiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNTkzNC9z
aGFyZC1tdGxwLTUvaWd0QGdlbV9leGVjX3N1c3BlbmRAYmFzaWMtczMtZGV2aWNlc0BzbWVtLmh0
bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9JR1RQV18xMjQyMS9zaGFyZC1tdGxwLTQvaWd0QA0KPiBnZW1fZXhlY19zdXNwZW5kQGJhc2lj
LXMzLWRldmljZXNAc21lbS5odG1sDQo+IA0KPiAgICogaWd0QGdlbV9leGVjX3doaXNwZXJAYmFz
aWMtY29udGV4dHMtcHJpb3JpdHk6DQo+ICAgICAtIHNoYXJkLW10bHA6ICAgICAgICAgW1BBU1Nd
WzNdIC0+IFtJTkNPTVBMRVRFXVs0XQ0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE1OTM0L3NoYXJkLW10bHAtMS9pZ3RAZ2VtX2V4ZWNf
d2hpc3BlckBiYXNpYy1jb250ZXh0cy1wcmlvcml0eS5odG1sDQo+ICAgIFs0XTogDQo+IGh0dHBz
Oi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI0MjEvc2hhcmQtbXRs
cC02L2lndEANCj4gZ2VtX2V4ZWNfd2hpc3BlckBiYXNpYy1jb250ZXh0cy1wcmlvcml0eS5odG1s
DQo+IA0KPiAgICogaWd0QGttc19jY3NAY3JjLXByaW1hcnktc3VzcGVuZC15LXRpbGVkLWNjc0Bw
aXBlLWEtaGRtaS1hLTE6DQo+ICAgICAtIHNoYXJkLWdsazogICAgICAgICAgTk9UUlVOIC0+IFtJ
TkNPTVBMRVRFXVs1XQ0KPiAgICBbNV06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzEyNDIxL3NoYXJkLWdsazEvaWd0QGttDQo+IHNfY2NzQGNyYy1w
cmltYXJ5LXN1c3BlbmQteS10aWxlZC1jY3NAcGlwZS1hLWhkbWktYS0xLmh0bWwNCj4gDQo+ICAg
DQo+ICMjIyMgV2FybmluZ3MgIyMjIw0KPiANCj4gICAqIGlndEBnZW1fZXhlY19iaWdAc2luZ2xl
Og0KPiAgICAgLSBzaGFyZC10Z2x1OiAgICAgICAgIFtBQk9SVF1bNl0gKFtpOTE1IzExNzEzXSkg
LT4gW0FCT1JUXVs3XQ0KPiAgICBbNl06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvQ0lfRFJNXzE1OTM0L3NoYXJkLXRnbHUtMTAvaWd0QGdlbV9leGVjX2JpZ0BzaW5n
bGUuaHRtbA0KPiAgICBbN106IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzEyNDIxL3NoYXJkLXRnbHUtMTAvaWd0DQo+IEBnZW1fZXhlY19iaWdAc2lu
Z2xlLmh0bWwNCg0KVGhlc2UgcG9zc2libGUgcmVncmVzc2lvbnMgYW5kIHdhcm5pbmdzIGFyZSB1
bnJlbGF0ZWQgdG8gbXkgY2hhbmdlLiBQbGVhc2UgZml4IGFuZCByZS1ydW4uDQoNClRoYW5rIHlv
dSENCg0KWy4uLl0NCg==
