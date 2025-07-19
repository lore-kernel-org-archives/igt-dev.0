Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7608C83F27
	for <igt-dev@archiver.kernel.org>; Sat, 19 Jul 2025 14:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BA610E025;
	Sat, 19 Jul 2025 14:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQ5BJBXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA3E10E025
 for <igt-dev@lists.freedesktop.org>; Sat, 19 Jul 2025 14:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752936130; x=1784472130;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=m60baQoQqHJM9bah2Un2BvUFsNbzNiIQGvE+D0rpHJk=;
 b=kQ5BJBXZ7XnQQTLsrE7pD+/o2QaEu4jbp9uOKJRxiO2j1dJZ1thMWMfX
 euLi5J42FKBjG1zSyxXe+2+r2OOp5XSGGCw3QuiaKICVpWzwMiW2ddvEr
 fjLltNpKP7oyTqvI1GEoHda0+e6xFtUvM12aaYKIYjakuKaZtG0WsnBGC
 ONg41cnQBYUi8smiLfTq9l5kNMAi3A/rLmeTK93OMFpFvWZ/P4NcSw/4O
 nL7dWjs89xyot88MLNWfQkzUAzWSnTuU0Q6uBqtIc+9f+IM2lJCypWlOW
 OGACCyUYDqxN60gp/DrQqD6miuEAV2QPAlxngTgZ6Sprf5kVZYXF+dbKK g==;
X-CSE-ConnectionGUID: QFB+buCATUKeT/JRYyfKTg==
X-CSE-MsgGUID: j+dFa/WDT/eejydYGEqQ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="55063269"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; d="scan'208";a="55063269"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 07:42:10 -0700
X-CSE-ConnectionGUID: Aki8nvTYRFmg2GAVZRElsw==
X-CSE-MsgGUID: VJaowJpRQ26gE6FudbAmpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; d="scan'208";a="158995342"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 07:42:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 19 Jul 2025 07:42:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sat, 19 Jul 2025 07:42:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.79) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 19 Jul 2025 07:42:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2+eSSMu6Orj8jke2FKXXZNvtG6FE63ZkZ3T7xpSnNmQjdYsNC1VTJJpdjpus4CG1ZXMX+O1Ianb64JGguWrsqWDL0/yWfkRdFW4moGGNEc+/UdhlsyvKl3SogNnUU5znsPyT4CjcqR9buifi8qMF1Ryteee/QdPrUHOAMt8YM8nUc48EF5ERuXPIi9yoQwM/GZq09hNfpaHxJPJK791hDR5mRiRdSmRBwFay+1jykVhiUA+tlv0e7JU636tyhtA3zHfkHHqOBHZ68dFBr8QghtIfaYJ76dZO3ASGnFSDo7B6Y42HXWqlPpBhf3Wg2QKanSWYy6ixBPidA4NHe/1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m60baQoQqHJM9bah2Un2BvUFsNbzNiIQGvE+D0rpHJk=;
 b=yFtFx020cEwQOIzeKVwSMZPEj2gdSNvDGIrxHL1Sct2kknwLXrRVBnOv9RfUZbw/8f8nMdTJvPnjblfs+X9R8b1MWQ0IDx381MoyVrY52OdGUw0LdviU5PEvlJy+gE8UFPztvVVQEAa3V2hRfQLc0E2S3Hbq/GM08G/hAsZP2kJYRafQXQwXL6c4JFqZ9zFDN7wSEpPV6HmTiPtD15iPe59Bq+KELteXXo7exGAoHJSHHsn6bdicgpdldxqoeb1i2ZhY4GbSmeyJYhFWCPbnOvX6g371r+C4pFdqQAUaUbqC9wy/e2QZx1CvpL2ulNroqFEMSTVsGZ+DOAS9IWvLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by MN2PR11MB4551.namprd11.prod.outlook.com
 (2603:10b6:208:269::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Sat, 19 Jul
 2025 14:41:47 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::9178:9855:9cff:ce77]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::9178:9855:9cff:ce77%4]) with mapi id 15.20.8922.037; Sat, 19 Jul 2025
 14:41:47 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t v1 1/3] intel-ci/meson: Use follow_symlinks only for
 new meson
Thread-Topic: [PATCH i-g-t v1 1/3] intel-ci/meson: Use follow_symlinks only
 for new meson
Thread-Index: AQHb9/bZ2yV3vQz+vEeebcDXZNRVTbQ5hpMA
Date: Sat, 19 Jul 2025 14:41:47 +0000
Message-ID: <0a2dbf0ff2e237b08fc5db9f716650458841e016.camel@intel.com>
References: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
 <20250718151521.105886-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250718151521.105886-2-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF75D68BA1B:EE_|MN2PR11MB4551:EE_
x-ms-office365-filtering-correlation-id: ad46aec8-5009-458a-1eef-08ddc6d263ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bnduM25XN1NWUkd4T3B3MUVGcmw1R0tKRno3bHhteUVUYjkxWUdtZ3k2RjNu?=
 =?utf-8?B?d1NSQmhkRlYzc0Z6VjE3STFlVEJjb09TeU5qSktyZWp6VGE0VWhYTUlOSkpL?=
 =?utf-8?B?YlhzYWNmVXhld05MRFZrOFdaTW5YUGtwNWZaQVh6VzdwYjAvM2FUWFNUVTRq?=
 =?utf-8?B?NWl5Y3Q4L3FQSURoS08vZXhVR0N0N3VrNy9tTHNPWWVkc2tEdzVaVGM4SzUx?=
 =?utf-8?B?QVQrSEtPUjNKVCtVUmN3SzVzLzZUam1rb3AvZG90TkszZ3g2Q1ZOWm8vN0RX?=
 =?utf-8?B?ZHdmcDQ3T1J2S2Ewai9KdFdxemJhY3JSWm50MlE5NjlpUDJYSDFzSmtZSnlv?=
 =?utf-8?B?YTlCNUV3NHdOQVcrcDh5YkcvSVBpYU9VWEZNSHhyREJRaEE5NFBNTm5USGRD?=
 =?utf-8?B?MHlIeEtuRnZaaEluRnlQcFFZS3lCTncvZ0g4OFVwTFhRdmhaaEpEMy93bURj?=
 =?utf-8?B?NjQwZFJXOFNybDZwTks1a21Ba3h0WWwrWGNndFQzYkJEM1JiTGZwSWpxRUtu?=
 =?utf-8?B?NHp4c0pHeW5TV250SkY1RGR3NnVVZ2ZOc2JLSEF3VWhXMDN6YXlqRWNVWW1O?=
 =?utf-8?B?WGFQeTZQTmNGU2gwRVd4WjFFREZVeGRFU3FyUmVid2ZGSEZuUlBFS3YxOW5C?=
 =?utf-8?B?M3VGL0JHRDQyU2hPQTNacjFwZjQydEJXN3dhREFGZTYydjNJRnBCVmRDSitF?=
 =?utf-8?B?a0ZtVmpnOHh3NFFXQkhENkRMeTd0R1ZGUzd0ZDArVHNQejhNdzhNM3o1bFBh?=
 =?utf-8?B?eEgvWnE3cENjSTV0MXZOZ0NOdEc3cUFOVkwvOTRXZjI3Q0xmTURSVnNBZmNw?=
 =?utf-8?B?U2xjeUtYR2JtU2NaTHFBTUlPeE5JbXF6bDg0dXFaRWF2QXVjTTA0NkxDWlZN?=
 =?utf-8?B?UUdSZEs5cnRDQkxVWlZKMHBDRVUzclJsUEV1QnhqMEcvU1JCcEM2cU5KR00x?=
 =?utf-8?B?L0JjL0VpbUtDY1JiS2VPV0h1eGhYMmx3UUVGYWtVcHZha25kVFVkK1M0NThh?=
 =?utf-8?B?Vm9vQSsrZVJyaUpQUytNMFNNcWRBZmk4MDlpa21rSnc4S0E3aG1sWExYMUsw?=
 =?utf-8?B?Rm1WQXdXY2ZpMzlyZzFFVHBUVjc0TFozeGtxUEdPUTNHM3VIM0RGTlF4ajFL?=
 =?utf-8?B?eGdOaUhiNXpSY0hsOWZvWnFoSzQrMml5a1FwWkZBVllzMTBTYnBHWTFwTk41?=
 =?utf-8?B?TjViV2l0aFg5bTI2RjBseGpQZEVMSWY4bUJxQlFQMkNNR25KZnNhcGdZazBz?=
 =?utf-8?B?b3ExWGVtTjE4anhVaHIzb3d3aDh2NlEyODl5cWVpd0JhZWhwb3Q2VHBpZlll?=
 =?utf-8?B?VlZsTnl3Mnk1VkVZZzc2cUd5WWpFbklTMU5oRHZmbmtnVVhyejBDYW5veW04?=
 =?utf-8?B?aFV6L25IL1dyVEJZUnQzSDM4TW1YK2YyZ1FRakc4aWpVOFNMdGlqVjJvZng3?=
 =?utf-8?B?VStBY1VRN0V5OEtHV2tyWCtjbUN5OHR0WG5TZm0rZzIyc2VKVXo2QUNqMEtW?=
 =?utf-8?B?czlwQjFMRWQ1Z3hNeWo5TmdpSFhnemxqd0R2dDVqWmJ6OGZMYmNRbUdMZ2hG?=
 =?utf-8?B?UzdzVElkaldpMlgrWEJ0dlVwTlh6YmxyK0txUVFlNVVQTEVyUXZFMmlkSEQx?=
 =?utf-8?B?TlFBTVBPNC9YK2paWUZwSHBTVkpGTDZjOEltaU0zYklsN3FCNC9qSE0wcDVM?=
 =?utf-8?B?cGhtMks2dnArMElBQmlBQ2cxSEtpaFMyY3pQQ282Q3FWa2IvRGFXQ0gyM01D?=
 =?utf-8?B?SkpnK3dLMFRsckdkREIxWHF3VTNjOEhiMEVnK2E2c3diUzY0WXdLaGNOc0kz?=
 =?utf-8?B?eDVUT2sraVpJTFR4UjFpemE0SS9EZzI5SDlGbnNSd1pxRHJHMWRGMWpIN0Y5?=
 =?utf-8?B?YXkxWXNmaDh2SE5IQlNaS216dW1RVmYvSkxrSE8vOVp3Y3N5SnhVQmVTQ1E1?=
 =?utf-8?B?WUM0UTYrQlhPMStuUytsT1VIbkp4WGRTZUR0dFdCOGdFeXNwNWJjWnBTbmdt?=
 =?utf-8?B?RXlaVVlQd2JRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF75D68BA1B.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2hZa2xiQzZLNjY2WFFaQ2ZKaEhxNmdVRTJUUmJXVzdybXdNNGdNaHJ0K0Rr?=
 =?utf-8?B?T0JsZWd4ZmI3NXR0QnYwY2VRdG5odytLLytGQ0pyTWdqRlN4YzJhWEZvTlZo?=
 =?utf-8?B?ei9SNlpzZ2N5VzBSSkRONks4Y3FPUi9pWmJZWjlPOFBVYjJ3WTU5ZUpJSzVt?=
 =?utf-8?B?V3JiU3NnYmQyQ1JpS2E2Lzh2ejhKL25CcmRWTnQrRnhTTEJQaFBUOWViV05o?=
 =?utf-8?B?aGEwTWpSVDBQcjd3bGxrWXR5RE5la0ZTdm8yUG5vZjFQMkJ0di83RVBpWVlG?=
 =?utf-8?B?SUJtbTl2Q3NzU05kQ0dYWTF1clpVb21aMWpDRHlLd2M2QlNaa3I5REhDczFr?=
 =?utf-8?B?WE5iMlRQQ0RSL29CRlFvR1E5Qk5VWHlYVmZIWXRDeS9kRVBTTEZ4cmkwbFNC?=
 =?utf-8?B?WXc3Wk1IdDFRMzE4Z2hqWUdqNm82cXB3RlBPR3ArRGNJWGlnMFFWbHgyaDNv?=
 =?utf-8?B?UW9LYWhWVWkzSmdMcGdXS1FqSG1PanBFMGZNdDVKa2djVWJKVjRuNEZadkR0?=
 =?utf-8?B?TTdPMWNiRWl6b2xzbUR2cjUxZEE1L3RBUm50dmRuWmJwc21NSWdCbGpjeWc4?=
 =?utf-8?B?ZjJ3RG1VelhIS3A1R1o3MXVTdjNRTHV1R2hEMzlaaXdieU1ybzFTdUJ3WXJy?=
 =?utf-8?B?ZDVHRHlYNGlZVlhlUFhXWmwrTjVWZjlIL2FpdVhZTzFCRlNLVDZ4T0tESFFy?=
 =?utf-8?B?YnNqLyt0NkhsL3RFRGoyVnpGZGhHOEdSYVMzMUNkY2wxeFpNTUZtcldsTGV1?=
 =?utf-8?B?ZndzOGp6RFFJWWNVeHc0cjlUSWczMVZlRklkb0JzM2o1NXVDSTd4bVJjUGE1?=
 =?utf-8?B?MnYvY0hlbGs0Z0hHOXg3My9hNSt1UVpIZXhsSmRhUEFvSHV6YUdpL1crNU9z?=
 =?utf-8?B?a213RVpqZ0tLdlhMZFVmQ3VtZUwwZ1p2MU04Tk5uYk1VdE9FR0dDV3NXWjJm?=
 =?utf-8?B?YTdLc3F6TGFDSW5ieVU4dkVrOExYY1drVGw0aHVUb1BHcnMyWlpGTVBYR2dE?=
 =?utf-8?B?WktlenVTQVVlbndBUUtQWkFLc2RndXhxOU1XU2xxTHdlejN0UFVBeUxCOUd1?=
 =?utf-8?B?a2draXlhSHZFWHc3aUJoNnVLZ29YN283MEFqSFNYSHoxa0FFTkZwVlU5NEVN?=
 =?utf-8?B?OXVURmVCYk94Y3lWWW9uTS9Ja3Avc29Mbno5SjNNR1BuZzNxbW1kSlkwN0Y1?=
 =?utf-8?B?Wmk0cERCU2FtaENncWVEdVFzQzYxTWtWbE1QYVkySG9GNCthR0NOa2ZYNDdI?=
 =?utf-8?B?UDdvdGNURU81QjRnbTZCWUNFVFRlc3RyTXVvWTlyMXdYT2FmNU1ZZjk1WWg5?=
 =?utf-8?B?YUdLVTZ5V1R0bnNYWVlseWhvSUNZWU9RbjZEUG1DRDYxR0JSeE5HWFZyaEFz?=
 =?utf-8?B?dUsvZGZEN2pYelphd1lZbkhyWnRqNWQwSHVCWC82US9kb3FrSE1TVUFQYXFC?=
 =?utf-8?B?aHhzSEVRK09NTTcyNHFrc2Z4TzF2M0hPODEybkl5aStRZHNTc1drc05yMkZS?=
 =?utf-8?B?Wi9xc3EyQm9DY3pVSnpRQjlWcThDZk4zMFo4NWJnSjRqRTA5ZHVwejZQR041?=
 =?utf-8?B?ektlS2NkR3ppdmc5LzZxdEF6elVyM0YzVzM3VDRMSlc3Z2thVnNkcW9uRFN5?=
 =?utf-8?B?SXpqaDVIRVAxM0I3S0k0cEthd2pqMVZkTXF0aThUOTBleC9ETHN5MzFXenVS?=
 =?utf-8?B?bGhRc1FPcDFVWjdkVU5sTG1SS3p1MzlVQlBTem9CMERsSHBhL28yMGg5Zys2?=
 =?utf-8?B?REFaMjUrMlYzSWVaTTdIT0VzQlIyNTdobmJCNllkWDN0U3BVWThoSjNqMmRr?=
 =?utf-8?B?TWhnSm5jdTdIZzkyc3BwenNaaXRzY2xjc3pEOUxQNnkwd3o0VlRYVHc4Z1dH?=
 =?utf-8?B?cFdIQi82R0pVdzlBSDVMc0xHamxKd0I4aVB5bDJjUWVnRWlIWTNER2lZK09t?=
 =?utf-8?B?Q3hNNzQ5NElNNUNRMHNYQzE1elBvaEx0Mk9ieFoyOUFuVlNFeElLTUcvTjM4?=
 =?utf-8?B?eVJxSmZmbDhsYTJ4aEFFejM4WTJTZlViQktKcmVVTG5kYlRGUkh5Z3R1L2Y3?=
 =?utf-8?B?c0M1NW1SVDk5ZVdOYncwUnc4Nlh4QUxhNGpOSnFlVUFkQ05IU3p1ZXdLZkV3?=
 =?utf-8?B?eWt5RmpYS0VMUktjcVpFYTNtZXNzQWNVU0wrVERhMG8renJuUlVGN1RFbXIr?=
 =?utf-8?B?N2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <817AF597A45A714B9DBFB814E9652DF7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad46aec8-5009-458a-1eef-08ddc6d263ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2025 14:41:47.4086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s6QPX38EzgucoMv6C33k83Iil1MwKZ12EXMHESdkuCgCe8FLBzOZDo0wH3SdMdzTK23u1yfGUcZkWdFJsXKDFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
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

TEdUTQ0KDQpSZXZpZXdlZC1ieTogUnlzemFyZCBLbm9wIDxyeXN6YXJkLmtub3BAaW50ZWwuY29t
Pg0KDQpPbiBGcmksIDIwMjUtMDctMTggYXQgMTc6MTUgKzAyMDAsIEthbWlsIEtvbmllY3pueSB3
cm90ZToNCj4gQWZ0ZXIgYWRkaW5nIHN5bWxpbmtzIHRvIG91ciBDSSBmaWxlcyBJIGFsc28gdXNl
ZCBhbiBvcHRpb24NCj4gd2hpY2ggbWFrZXMgbWVzb24gdG8gY3JlYXRlIGFjdHVhbCBzeW1saW5r
cyBhdCBpbnN0YWxsYXRpb24uDQo+IEl0IGxvb2tzIGxpa2UgdGhpcyBvcHRpb24gd2FzIGFkZGVk
IGluIHJlY2VudCB2ZXJzaW9uIG9mDQo+IG1lc29uIGFuZCBicmFrZXMgYnVpbGRzIG9uIG9sZGVy
IG9uZXM6DQo+IA0KPiB0ZXN0cy9pbnRlbC1jaS9tZXNvbi5idWlsZDo2NTowOiBFUlJPUjogaW5z
dGFsbF9kYXRhIGdvdCB1bmtub3duIGtleXdvcmQgYXJndW1lbnRzICJmb2xsb3dfc3ltbGlua3Mi
DQo+IA0KPiBVc2UgdGhpcyBvcHRpb24gb25seSB3aGVuIGEgbmV3IG1lc29uIGlzIHByZXNlbnQu
DQo+IA0KPiBTdWdnZXN0ZWQtYnk6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNv
bT4NCj4gUmVwb3J0ZWQtYnk6IEthdGFyenluYSBQaWVjaWVsc2thIDxrYXRhcnp5bmEucGllY2ll
bHNrYUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC1jaS9tZXNv
bi5idWlsZCB8IDcgKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL21lc29uLmJ1
aWxkIGIvdGVzdHMvaW50ZWwtY2kvbWVzb24uYnVpbGQNCj4gaW5kZXggNjBkNGUwZWI4Li41OGYz
NDBiNTcgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsLWNpL21lc29uLmJ1aWxkDQo+ICsrKyBi
L3Rlc3RzL2ludGVsLWNpL21lc29uLmJ1aWxkDQo+IEBAIC0yNyw0ICsyNyw5IEBAIGludGVsY2lf
ZmlsZXMgPSBbDQo+ICAgICd4ZS1zcmlvdi12bS5ibG9ja2xpc3QudHh0JywNCj4gIF0NCj4gIA0K
PiAtaW5zdGFsbF9kYXRhKHNvdXJjZXMgOiBpbnRlbGNpX2ZpbGVzLCBpbnN0YWxsX2RpciA6IGRh
dGFkaXIsIGZvbGxvd19zeW1saW5rcyA6IGZhbHNlKQ0KPiAraWYgbWVzb24udmVyc2lvbigpLnZl
cnNpb25fY29tcGFyZSgnPDEuMy4wJykNCj4gKyAgaW5zdGFsbF9kYXRhKHNvdXJjZXMgOiBpbnRl
bGNpX2ZpbGVzLCBpbnN0YWxsX2RpciA6IGRhdGFkaXIpDQo+ICtlbHNlDQo+ICsgIGluc3RhbGxf
ZGF0YShzb3VyY2VzIDogaW50ZWxjaV9maWxlcywgaW5zdGFsbF9kaXIgOiBkYXRhZGlyLCBmb2xs
b3dfc3ltbGlua3MgOiBmYWxzZSkNCj4gK2VuZGlmDQo+ICsNCg==
