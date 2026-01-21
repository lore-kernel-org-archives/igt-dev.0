Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAE1D262B0
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 06:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCEF10E6BF;
	Wed, 21 Jan 2026 06:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGofiSIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBD310E6BF
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 06:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768975923; x=1800511923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=GlUC1lOQ4Pap0jpUqzuYFnTkVtbYAbriKhbG9uqrx5s=;
 b=HGofiSIMPswuTgu0lIiF2YIWmVnhYHJco+YmdiA40Gsih25NB7jLwItQ
 5dmBrjpm2KQYwGE3hRwiIHVnurY06Un53U1L3JXLsnn+KF8DCAZ4i2yED
 5OiAdss4cK6ovRAGKs4Mr7oyOq7qwdqYqAIJr282gsFkkIMZwAhAm67QA
 zQMAVRppqRFlnB7Rzkyo7XCiUFUhhvD7u2RJK4WpD2sr/krm5qf4BHc6f
 lp5skiN+fEx8oRC8HfCcoCZ21jErUVoVYOwMNBm6BkEZ909NyRpQAozhR
 dmNesAco8y1nuVNFWvIdS9eBTd6hnopV3RwVS8sWQWbMZW9m5UW6TzSKU A==;
X-CSE-ConnectionGUID: ES1Jrhh7QD+yg+JWzzi/WQ==
X-CSE-MsgGUID: OKOrtlrUTWyaU0KCOX5J7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70108197"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208,217";a="70108197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 22:12:02 -0800
X-CSE-ConnectionGUID: Su2trOpWTCOlHmdJI1X3DA==
X-CSE-MsgGUID: c1RQnLUVSvaR9Cl5z9vfog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
 d="scan'208,217";a="205983563"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 22:12:02 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:12:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 22:12:01 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:11:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgD25LQhJ5bYeUg9lup/SMSjwTjMnrHo4XQA/InwZ6NM++FJHrUXvBtB6u1+e5tP4Jd40I3SYOeEjtMXtStXQmofpt/tn3BXRa31nWY6+FqAeygAI2AjBIg3DckJAiURML6B2g0HJ76QJ38AHwGCNXmvBxrD2MuVOupx7Eb+8FHmimeR76zmm4J7rdLKc2cYqB/sVbJV75lUNFw15n14qyqZdyEF7/NdvtE3RqLPegNbcoTUNJ2DPEaXDy1dVR+TzxwjUCfkutvKbIm4bU9f5e9mfRYhdHxirBKNQngplGQkWYvrUHbOR91SvkWohPe3zjtNYyvvOBiBg4C6EgIfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Zq474Cv9ckpW0jcHVbuYXItYiQHSiLQXUoKhBlQrIg=;
 b=c0y8LH3FkvSfTOr4CytQ7MmCeayL5TLEOQkcND+Sd9hIoXtZzWj/Ea79cZ8AjcC3/o2jLrPJFAlWBqurafdAYHu8f5ZnPQVBWfbgdTv5989CVMaAwnrcnIaHl+UEbR55FQezzfx3/7hmve7q5mhDMVOShBim5Vt9yO1DCBHP2QWW98Icoyc2gqnG8ADoKwqWlciEQEk4VzAFTpHkcUVUKRpFYNtZ5kFSfHyCLTdQpvWZ6Ic9HJbqX5i2VNfhkk8bxGqGjmzo4H9wBDFaRBe0R5LQk2RzX2C6ILq7NDb9TIhviZpQfTkp79/ab2z6JzrUzf3EXYBIehAlvJdITzJtFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 06:11:55 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:11:55 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Santa,
 Carlos" <carlos.santa@intel.com>, "Badrappan, Jeevaka"
 <jeevaka.badrappan@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Topic: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Index: AQHchTAmGZobl9qsjEqU6WPrCWHrl7VbDpwAgAEgjzU=
Date: Wed, 21 Jan 2026 06:11:55 +0000
Message-ID: <CH0PR11MB542785B6A77ADEE33727BA689896A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260114082323.2534785-1-s.sebinraj@intel.com>
 <20260120125838.t5l4r7nrz5j7m3c6@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260120125838.t5l4r7nrz5j7m3c6@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DS0PR11MB8717:EE_
x-ms-office365-filtering-correlation-id: ec95a807-c9af-49ae-0aab-08de58b3fa84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|13003099007|38070700021|7053199007;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?gDR91pT2CHIeOTFRLLHqZ2jg+RS3n/ByTjBZVAl/qrqOQ7TqzpnC66k35/?=
 =?iso-8859-1?Q?IjeHYZZmoLj0UuLEff/BbSvrzuD30BRvO7tEcSL62lTOMXaphmw4D409S+?=
 =?iso-8859-1?Q?Stx39HlhXBYVeKAN2fTp89dfaO2+NiI2PozSPSb9OVDQm6V+37PLl9UpDU?=
 =?iso-8859-1?Q?dHE+pn9WAAk8VrAemlxR+Cic4OcrqpfWAIlcCitfX2M5RMZaINQHvsr+pn?=
 =?iso-8859-1?Q?8+rFABUbPW6Tn0WwIatOaCDHsTbJGyjh5K2UHpNTne/gfmtxl3BdkG2bQP?=
 =?iso-8859-1?Q?6CzYAuMDVtTL2fOSgPM99RfhrMUlGlieuzgHVGHJLKYjNBYezKjQQU8GKt?=
 =?iso-8859-1?Q?rkkpVzN4E6kqyomKW1WmffF8nV/r/VgluMYlr4HAHqbgg9/+zlg9JU088P?=
 =?iso-8859-1?Q?1QRnKg02vuj5Lk+uzaV5xY9mAJ8yLlv3r74Ux4TCGUdP+iIBqfrMKdc/Gm?=
 =?iso-8859-1?Q?piMveIMFE6p98wwZ3wQdv9sdxSReahuAOHe9KKujsT5CndRt7oefqZGFoF?=
 =?iso-8859-1?Q?eLDwFdXnF3Z0H8LUR4pFPvjx+5LIJfqG3LiUTIX+IpJPzsIEkfktobPVqC?=
 =?iso-8859-1?Q?lNHn77bkUPTcUxRtvFIro+hfwPQmqs44MdVBtE5SJDJYM6wysofeycU0hp?=
 =?iso-8859-1?Q?PrIYWEA947UfJWujKKSbvpsLNUIJzpGuenE0ovG1hQSONcpqP7HOiwUGlr?=
 =?iso-8859-1?Q?P1uY/zuLLqDFWewmS4gvzokx9QJB6D6oJH9tDHsfj9Oxu0scpave9cD9Bi?=
 =?iso-8859-1?Q?bESCbmB3CRcnHD6YZ0DzAqOm1GM1bJbNaNQWCMyGFaJSbJid11hE57wZ57?=
 =?iso-8859-1?Q?PYAHRxPkTg7xEX1+b1mor9W/Clx3/4FuJH845IRVB68oG0hDn5mYoRWYX5?=
 =?iso-8859-1?Q?m9WzpDHPWo9ZihY0S7yTV7pdgb6XOuIvlCFLTke1JBFfh9eSwCwAeSUOL7?=
 =?iso-8859-1?Q?xWSzhGskz54De23bC8COC6YJCOevjAY8fojyFkSc22smKK1+zDmuOpAjrr?=
 =?iso-8859-1?Q?QovLPGNMynbx5p3V1rc+h7OilbkIVS8J20QYtYmEc8CXfMbWpbuu1vZF+h?=
 =?iso-8859-1?Q?uzIuh30gh9dcGwfbVQbrOaTxTaYPoZqHvC7Em/vJ0+xRB6nhPHefYCDDef?=
 =?iso-8859-1?Q?ayzSxUSS1y6FEUQh7GV9w96PZWJrJKfSR+/8l98eaJB4Jfe7F4nb1hQscD?=
 =?iso-8859-1?Q?XquJmG4A820LjXz2gHEBSrPncq4sGtJQnlV9bNyT11hieVE43XwZTaBOBX?=
 =?iso-8859-1?Q?eKV9GS1oZVDdjDBlsSZpihzLj+LIQuyvpOrk6+fEhtyANYWg7z0h4uWHal?=
 =?iso-8859-1?Q?Shm2mUYrqQ/GD86O26pH6PfUViLO5EazXK2v5RbuI3i7nhDO5XyHVUy7lf?=
 =?iso-8859-1?Q?Vtd7VaIhSZNN3aK55po76yiDS4LnRqJjxTIG74ANaJs3ANf3za5y90xlr3?=
 =?iso-8859-1?Q?6Yo5N4mN2BeLnH6RqmzNYLjIvf5JRFyC+2Vs9OOQdPlyQjnC6nmUHF7IGL?=
 =?iso-8859-1?Q?z14xtiBsyKWp7EKGWj63KjTEW01PCACNY4DEPZ0LJgfuk2ElHmcyS/rryo?=
 =?iso-8859-1?Q?3e4N8eLaUBwNd4PugccyGgIW/Xd4QYKtZ6L6L2m+Y3lyDICzhNpEQAuuv8?=
 =?iso-8859-1?Q?y/fGz1RvCe2VNJym4hfWQewhSZaQKcgk+T?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?k8buHnDNljW0zOlpNS37cAuvHD4PGQ0ALMDWjRF8XIX9Pu71lDYjFNlrqX?=
 =?iso-8859-1?Q?ZECcsrEOT6kXkUKGVQot5UfETlYfM/3g66Sb+yn15HjwjRFwQ8RFIm8pE3?=
 =?iso-8859-1?Q?8vOeTGgpjzcMfEcTv/PVAuZWlTOgQoMdkvf9qqoWa9GAQxMKe3gT5dZ8Yw?=
 =?iso-8859-1?Q?celldlz8zT7lib4chIQ4kUno8VUgVPLucDtVLSbT7rrTWOM2z4NuDzF8iO?=
 =?iso-8859-1?Q?QWBOzWAgRY9JN8nL1IIjXqA1W0933FNStw6mqVilcSajZUSlYLL4sJKE+W?=
 =?iso-8859-1?Q?EswY8nULLxAO6A2Q09a3vzUa4GxFt4c/qQQnPWVRfgL+DL2SMJqx0+Xcnk?=
 =?iso-8859-1?Q?uLbGZUQS0htvIJAZVcehk0LlFd6LGr4nqO93A8pyCrylw3beX8wYnT8JJN?=
 =?iso-8859-1?Q?5FS1VKjfcLDYA8QazpA6r4BwXtMiidJ7X6olLAPLKP6x988jKEYcldQ7gF?=
 =?iso-8859-1?Q?JNVVDkOzqdisv9mlekBJh3w+QbpxWWlYADOt3MmursTJIkzdP9R6f1f419?=
 =?iso-8859-1?Q?ycVGzHnNFWKiTIiYj/RF894VGSdGzOkFdrtwdZQZP/8smrdk0e6yIIte5P?=
 =?iso-8859-1?Q?dpD9kJZ20sPoQpaup6KnyUsboh4JOagY5dUbOk/Wzh8UObxOgRG1DvCqIZ?=
 =?iso-8859-1?Q?GDUynQsdBf9MUoc7sBsm0qJ9bK6XcqjEdtr69ekhL1/vm3LSmXORELJgtu?=
 =?iso-8859-1?Q?EUtQcZPkVKLPO79nbLIsT09EJvmFIWlrKXzkFgSVJa3zG0MKtY7w127duR?=
 =?iso-8859-1?Q?RZnttxkZ5uxQfAPTMR84hf122EWVDc2/bJHqAFVD94kgy3h98Efqxa7m4S?=
 =?iso-8859-1?Q?63Y/ymi4DFCvMrua9k5bCMZnpET80JXavSHC2vnxcnk/OwK+dfidqcWRIG?=
 =?iso-8859-1?Q?skB+d+/Fq7KYps+ytz1Y1qZ83kzdRrXI76h8UYbEQrc270yjMyZ+iRpj1B?=
 =?iso-8859-1?Q?Q9lzpOMcGQq0jblhjAvWeoy5vZ8/PD+n1Cdky8fsoT2f1HDCStT2MvN3oP?=
 =?iso-8859-1?Q?g6xw1Slv2E5PXyqYcxccBe80/tlT8e7Cm7p7TUXXXP6HVZgC/xRUFgLPKe?=
 =?iso-8859-1?Q?6I0+EmrxjkKSqef01XRpt1J8SNhPX2ZcTFnCWi4eKU4s4UeVY4saNKsKqM?=
 =?iso-8859-1?Q?YfvpCyzMsOVksLbZ8M4tRT+cwQyZCoOFvYRxL5XSu3tKaR9r0SPiI2OmkJ?=
 =?iso-8859-1?Q?MCqxP5Z/XrpTZTq/ZSIG5/npjDGkoJP6HU4/sQ35DvwcIE1XAyWwA/Cp+/?=
 =?iso-8859-1?Q?bsa/0xvM5AeoulndEuNUg13RsxN7k1ps9TLi5lH7YVlrdGyX7mNUOVqgmX?=
 =?iso-8859-1?Q?tBr1PM/zk6XcWadLtgcE+mXaz/0dLhNX8QLfndQZF5z7Fj43tIcZzXQgTM?=
 =?iso-8859-1?Q?wPAh/i2iifeKTLE3YJGwKwjE82b2woD4jLXpNewCfITKOF5qikkOzLJSBs?=
 =?iso-8859-1?Q?MGRLLNNDe+3Y1YaZRCSEAkefh3ck7qffrkLRaIHZGhl3NS3Eaw5o8G60v+?=
 =?iso-8859-1?Q?ExWQ1UV/n+F0LK3Grm9CSQJGM8SEnR7/hw1pcXD5hP6/dgKsL8elKuhWVP?=
 =?iso-8859-1?Q?PMacCvSijbpsOXjJwvZFZ0TQl+/1vRn+k8egFxwQWJZ3sIwGXaryVoBkOC?=
 =?iso-8859-1?Q?XGaTcgYXlXtWbkTOA6IDK+hB71aidrINBOwB9qbChsx4ON+SIGIxSDb+8d?=
 =?iso-8859-1?Q?9iXr/oeujtJ2b0BJdoYyvbLwIxz5dqUHBSEdKQP4ODfgt6Ob2TZVuXgNfP?=
 =?iso-8859-1?Q?dGM1HTDI5UDloUTGRNgm3no0DWN6crey4Y7fuY6dOZRoOk?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB542785B6A77ADEE33727BA689896ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec95a807-c9af-49ae-0aab-08de58b3fa84
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 06:11:55.8180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1gFhj00BWmZNpV7gtt9/BCrIa3oJV/WIGL9rrpbSaFeMqdWHdSCO968BQg3+yYILxfmp2R9ZX+f3ltagvO/8CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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

--_000_CH0PR11MB542785B6A77ADEE33727BA689896ACH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Tuesday, January 20, 2026 6:28 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Santa, C=
arlos <carlos.santa@intel.com>; Badrappan, Jeevaka <jeevaka.badrappan@intel=
.com>; Karas, Krzysztof <krzysztof.karas@intel.com>; Konieczny, Kamil <kami=
l.konieczny@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczynski@intel.c=
om>
Subject: Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit F=
encing

Hi S,
On 2026-01-14 at 13:53:23 +0530, S Sebinraj wrote:
> Add a new test to validate explicit fencing.
> This test handles multiple planes in a single atomic commit.
> This test addresses a critical scenario where drivers must correctly
> synchronize planes with mixed fence states.
>
> Test Scenario:
> - Creates three planes: one primary, two overlay
> - Attaches fences with different states:
>    - Primary plane:   signaled fence (simulating completed GPU work)
>    - Overlay-1 plane: signaled fence (simulating completed GPU work)
>    - Overlay-2 plane: unsignaled fence (simulating long-running GPU job)
> - Submits all planes in a single atomic commit with IN_FENCE_FD set
> - Validates that display waits for ALL fences before updating ANY plane
>
> Bug Detection:
> This test catches driver bugs where:
>  - Planes with signaled fences update prematurely before unsignaled
>    fences complete, breaking atomic commit semantics
>  - Fence states are mismanaged across multiple planes causing visual
>    glitches or corruption
>  - The driver fails to wait on all IN_FENCE_FDs atomically
>
> The test uses sw_sync timelines to create controllable fence states,
> allowing precise validation of fence synchronization behavior. An
> OUT_FENCE_PTR is requested to monitor when the display update actually
> completes, enabling detection of premature updates.
>
> Implementation Details:
> - Uses sw_sync for creating fences with controlled signaling
> - Monitors OUT_FENCE to detect premature display updates
> - Validates atomic commit integrity across multiple planes
>
> Background:
> - A bug regressed for Xe driver on PTL (Android) i915/display handling
>   of explicit fences when provided two or more buffers at once,
>   with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>   https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>   use of explicit fencing in the KMS Atomic Modesetting APIs.
>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tests/kms_explicit_fence.c | 372 +++++++++++++++++++++++++++++++++++++
>  tests/meson.build          |   1 +
>  2 files changed, 373 insertions(+)
>  create mode 100644 tests/kms_explicit_fence.c
>
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
> new file mode 100644
> index 000000000..d3cad5904
> --- /dev/null
> +++ b/tests/kms_explicit_fence.c
> @@ -0,0 +1,372 @@
> +/*
> + * Copyright =A9 2026 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +/**
> + * TEST: kms explicit fence multiplane
> + * Category: Display
> + * Description: Test explicit fencing with multiple planes and mixed fen=
ce states
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + *
> + * This test validates correct handling of explicit fences when multiple=
 planes
> + * are updated in a single atomic commit with different fence states. Th=
is is
> + * critical for catching fence synchronization bugs where the driver mig=
ht:
> + * 1. Prematurely display buffers with signaled fences before unsignaled=
 fences complete
> + * 2. Mismanage fence states across multiple planes causing visual glitc=
hes
> + * 3. Fail to wait on all fences atomically before updating the display
> + */
> +
> +#include "igt.h"
> +#include "igt_aux.h"
> +#include "sw_sync.h"
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/eventfd.h>
> +#include <poll.h>

> System headers should be first, then newline, then igt.
Also, sort them alphabetically:

Thanks for pointing out, I'll change it accordingly.

> +#include <errno.h>
> +#include <poll.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/eventfd.h>

> +#include "igt.h"
> +#include "igt_aux.h"
> +#include "sw_sync.h"

Regards,
Kamil

> +
> +/**
> + * SUBTEST: multiplane-atomic-fence-wait
> + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence st=
ates:
> + *              2 planes with signaled fences and 1 plane with unsignale=
d fence.
> + *              Validates that display waits for all fences before updat=
ing any plane.
> + */
[cut]

--_000_CH0PR11MB542785B6A77ADEE33727BA689896ACH0PR11MB5427namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<b=
r>
<b>Sent:</b>&nbsp;Tuesday, January 20, 2026 6:28 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Santa, Carlos &lt;carlos.santa@intel.com&gt;; Badrappan, Jeevaka =
&lt;jeevaka.badrappan@intel.com&gt;; Karas, Krzysztof &lt;krzysztof.karas@i=
ntel.com&gt;; Konieczny, Kamil &lt;kamil.konieczny@intel.com&gt;; Kempczyns=
ki,
 Zbigniew &lt;zbigniew.kempczynski@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test fo=
r Explicit Fencing
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi S,<br>
On 2026-01-14 at 13:53:23 +0530, S Sebinraj wrote:<br>
&gt; Add a new test to validate explicit fencing.<br>
&gt; This test handles multiple planes in a single atomic commit.<br>
&gt; This test addresses a critical scenario where drivers must correctly<b=
r>
&gt; synchronize planes with mixed fence states.<br>
&gt;<br>
&gt; Test Scenario:<br>
&gt; - Creates three planes: one primary, two overlay<br>
&gt; - Attaches fences with different states:<br>
&gt;&nbsp;&nbsp;&nbsp; - Primary plane:&nbsp;&nbsp; signaled fence (simulat=
ing completed GPU work)<br>
&gt;&nbsp;&nbsp;&nbsp; - Overlay-1 plane: signaled fence (simulating comple=
ted GPU work)<br>
&gt;&nbsp;&nbsp;&nbsp; - Overlay-2 plane: unsignaled fence (simulating long=
-running GPU job)<br>
&gt; - Submits all planes in a single atomic commit with IN_FENCE_FD set<br=
>
&gt; - Validates that display waits for ALL fences before updating ANY plan=
e<br>
&gt;<br>
&gt; Bug Detection:<br>
&gt; This test catches driver bugs where:<br>
&gt;&nbsp; - Planes with signaled fences update prematurely before unsignal=
ed<br>
&gt;&nbsp;&nbsp;&nbsp; fences complete, breaking atomic commit semantics<br=
>
&gt;&nbsp; - Fence states are mismanaged across multiple planes causing vis=
ual<br>
&gt;&nbsp;&nbsp;&nbsp; glitches or corruption<br>
&gt;&nbsp; - The driver fails to wait on all IN_FENCE_FDs atomically<br>
&gt;<br>
&gt; The test uses sw_sync timelines to create controllable fence states,<b=
r>
&gt; allowing precise validation of fence synchronization behavior. An<br>
&gt; OUT_FENCE_PTR is requested to monitor when the display update actually=
<br>
&gt; completes, enabling detection of premature updates.<br>
&gt;<br>
&gt; Implementation Details:<br>
&gt; - Uses sw_sync for creating fences with controlled signaling<br>
&gt; - Monitors OUT_FENCE to detect premature display updates<br>
&gt; - Validates atomic commit integrity across multiple planes<br>
&gt;<br>
&gt; Background:<br>
&gt; - A bug regressed for Xe driver on PTL (Android) i915/display handling=
<br>
&gt;&nbsp;&nbsp; of explicit fences when provided two or more buffers at on=
ce,<br>
&gt;&nbsp;&nbsp; with 1+ already-signaled fences and 1+ not-yet-signaled fe=
nces.<br>
&gt;&nbsp;&nbsp; <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D=
"OWA19dc0360-4dd0-1eb5-94f7-4a839cdb465e" href=3D"https://patchwork.freedes=
ktop.org/patch/662982/">
https://patchwork.freedesktop.org/patch/662982/</a><br>
&gt; - Adding this test so that IGT contains sufficient testing for the<br>
&gt;&nbsp;&nbsp; use of explicit fencing in the KMS Atomic Modesetting APIs=
.<br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/kms_explicit_fence.c | 372 +++++++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; tests/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 373 insertions(+)<br>
&gt;&nbsp; create mode 100644 tests/kms_explicit_fence.c<br>
&gt;<br>
&gt; diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000..d3cad5904<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/kms_explicit_fence.c<br>
&gt; @@ -0,0 +1,372 @@<br>
&gt; +/*<br>
&gt; + * Copyright =A9 2026 Intel Corporation<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
&gt; + * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&gt; + * to deal in the Software without restriction, including without lim=
itation<br>
&gt; + * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&gt; + * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&gt; + * Software is furnished to do so, subject to the following condition=
s:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice (including t=
he next<br>
&gt; + * paragraph) shall be included in all copies or substantial portions=
 of the<br>
&gt; + * Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO =
EVENT SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING<br>
&gt; + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHE=
R DEALINGS<br>
&gt; + * IN THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * TEST: kms explicit fence multiplane<br>
&gt; + * Category: Display<br>
&gt; + * Description: Test explicit fencing with multiple planes and mixed =
fence states<br>
&gt; + * Driver requirement: i915, xe<br>
&gt; + * Mega feature: General Display Features<br>
&gt; + *<br>
&gt; + * This test validates correct handling of explicit fences when multi=
ple planes<br>
&gt; + * are updated in a single atomic commit with different fence states.=
 This is<br>
&gt; + * critical for catching fence synchronization bugs where the driver =
might:<br>
&gt; + * 1. Prematurely display buffers with signaled fences before unsigna=
led fences complete<br>
&gt; + * 2. Mismanage fence states across multiple planes causing visual gl=
itches<br>
&gt; + * 3. Fail to wait on all fences atomically before updating the displ=
ay<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;igt.h&quot;<br>
&gt; +#include &quot;igt_aux.h&quot;<br>
&gt; +#include &quot;sw_sync.h&quot;<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +#include &lt;stdbool.h&gt;<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +#include &lt;sys/eventfd.h&gt;<br>
&gt; +#include &lt;poll.h&gt;<br>
<br>
&gt; System headers should be first, then newline, then igt.<br>
Also, sort them alphabetically:<br>
<br>
Thanks for pointing out, I'll change it accordingly.<br>
<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +#include &lt;poll.h&gt;<br>
&gt; +#include &lt;stdbool.h&gt;<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +#include &lt;sys/eventfd.h&gt;<br>
<br>
&gt; +#include &quot;igt.h&quot;<br>
&gt; +#include &quot;igt_aux.h&quot;<br>
&gt; +#include &quot;sw_sync.h&quot;<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * SUBTEST: multiplane-atomic-fence-wait<br>
&gt; + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence=
 states:<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 2 planes with signaled fences and 1 plane with unsignaled fence=
.<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; Validates that display waits for all fences before updating any=
 plane.<br>
&gt; + */<br>
[cut]<br>
</div>
</body>
</html>

--_000_CH0PR11MB542785B6A77ADEE33727BA689896ACH0PR11MB5427namp_--
