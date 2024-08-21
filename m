Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9104DC52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 07:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CFB10E89A;
	Wed, 21 Aug 2024 07:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LB21UqB/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF6410E88F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724224579; x=1755760579;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=S21i2bqj9qbqGJGqaOpi7B0tZQxBghm8KttK2V8yKI8=;
 b=LB21UqB/6FZ5DDcgqEXQAo8fZwmNrprJIIKYqPqXC1bqHU2+qC1Q2oEI
 TGIVvXvZXqC6WPpcv2ZvgrYudy0VfWRqesXq345faB2Od9xp7DCbEUmiR
 xdlvk3IncoSUJEhuzkGl3Bv+iBU3kuETXpfaD3nXfR1UeDmu02E8wosTV
 t1/pGa+aCbrIuALRAxnUn9n298ngStrKS4+1waSS0UgncD8I+JNtsUzCA
 5SS/fk24KbP8vcl9Fe6D95RCLjpPpFpdiRftaLL6LTZG3Tvilhqn30zWS
 Q1mSqh2gO1P8OaEJLdfLzwzo8bTUAG5cGWG3eZMOIzC/NiEEZ+FgnQesO g==;
X-CSE-ConnectionGUID: wEdXVufwQBCJe0BCvpuVxA==
X-CSE-MsgGUID: G04fLafiSV6679ls9zGNGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33951639"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33951639"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 00:16:19 -0700
X-CSE-ConnectionGUID: L3c+C9ZYQUqc/qR/5MZKYA==
X-CSE-MsgGUID: dX7TVEkiS1uZ+Vgy7zQg1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65874971"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 00:16:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 00:16:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 00:16:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 00:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gvz+SwJWtkJmjRMmrV59v0yADbj7ZIZdClKDkFjfSujmuq+Hvwnsmfe+JVMA+L1ds69QWLdbO+fLSsF7vrVvEz5JVp+wKj0nv4k5fbhASGXFdAekSt0yKU5wxJSJ9b2FER33V1jM0fXyA+xole7gSDjCvV4fC0mzttKye0+zCzwi4U+48vjxgkcutvASX4ny97bjUluYTVnck8lifXmAWTnsAY3kjZq1oghP5c/VL2Sg1ndE6a3AMGlJ754FKZ2W7llvG8Pw3VcvLRGvkdbUN0fswnlC8qPZe6yMBZA04JEZ/SWLNdN2Mg1yuTff5PLRU/9Fr3hiu3kYxP8lIpLMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S21i2bqj9qbqGJGqaOpi7B0tZQxBghm8KttK2V8yKI8=;
 b=T/mNliFN8pd35fLpmY4xK7wHS45CKJpkSSnVjx5ayQZZPIs4sxJK8oHHHz94VeuLan+7vswAE2r4Ntchf8b38fQckUErrEoczmC6MVJb+Bcv5zqXMTeH9scesS0/IMALGEBdUI2MwOhVA5PCLIWp3CwywGU+4QH56DyXqz++aB9A9MahF1i/F2xcDrIbiUaMZd8q7RliMBJgHf/g/5FT+asZpvnLM11C/kRZ8LmJKF7PdBSvTKxICCdcT4CHj8d6FpiVaxD9H03gEPK1Lwn0SlEQPOZ6ID3uKZcvfGvivN/P5f5iRjLRF2Mlbr27WwXWWVjPkB0flbNnmAb1PumKjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 07:16:14 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 07:16:14 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
CC: "Deak, Imre" <imre.deak@intel.com>
Subject: RE: [i-g-t,11/12] tests/intel/kms_dp_fallback: add test for
 validating fallback
Thread-Topic: [i-g-t,11/12] tests/intel/kms_dp_fallback: add test for
 validating fallback
Thread-Index: AdryGdYKB1GqQQ3eRG6R7MIGat9lOQBf9/qA
Date: Wed, 21 Aug 2024 07:16:14 +0000
Message-ID: <CY8PR11MB688900613AF932391C152027DA8E2@CY8PR11MB6889.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|BL3PR11MB6434:EE_
x-ms-office365-filtering-correlation-id: aae8288a-23d8-4874-32d7-08dcc1b1245c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WFNLWXdybzd2K0M1dGMwLzF4bXFFMEROMDJLTkJBelhaTUNVR1MxTmhXU0Zn?=
 =?utf-8?B?UkNwOEQ5SnZzcFZ2Y1NUTDQ0M0tDSUd5MWRvb2Q1RXhKbVRVMWV4U2FmNU53?=
 =?utf-8?B?blhmZzl6NUw3VFlqUkx1cEZjbWpGTnE2NHpEby9oTTZrU3Q4d3FRTC9Ebyt2?=
 =?utf-8?B?ckZqWDNlTlpubkxyYSt2elZycWJRWGlWbENiaW5CNEQ5aDlMTy80VENqT1pW?=
 =?utf-8?B?Q1JhaXlLR3pJT0RLL25jSlZqc2VuUXBNQUFLZTZaOGM3SFduRVJaWUJXZ1RC?=
 =?utf-8?B?ZlJOQ0hOZ29iVi9zMUF4SzFPb3JZdWhLZUdBRWxFMFJZVTVraGZ2bUxETzRI?=
 =?utf-8?B?L2IybnpnNDlHWi9yVzlPYUY0bEFGd0JVVWJ2VkhVWS9NSHBFMXNMYzNtYzFx?=
 =?utf-8?B?SHZOYzF4L0U0MGxUWmV6N1NiTE9CR2RmQlpGWkcrZm5nSy9XemJYSTgyYWZ3?=
 =?utf-8?B?VGMzTzFUT08xWURGa3hZbHd2RWl3elgxcUpoSmM3YWFVeWcyZk0wemx2dzJs?=
 =?utf-8?B?WGxzbm9ldnlwTmZmbmRYSi9iVEpidUVINEROKzk1N2VwRnI3NW90KzBaVHpD?=
 =?utf-8?B?ZWF5WTZIcE4waHo5bk9tSTJVZVR6QmdFNjRZMDdDZ3M1OWw3NkJMc0M5MTlG?=
 =?utf-8?B?eGRzVHdMQ3dBSXFRODBocDdsVFllZGxrWHBNSW5YSkp0TjZOcEV2RVJ0WCtw?=
 =?utf-8?B?Z2xPQzM2SzJweXJNdlM4VGo5SytNSWhJMS8wSUhtaEhOOFQyaDNoT3laOGpa?=
 =?utf-8?B?dkZCZzZGbzZLS3R5MWFHTEQ2bE1NUkZIamk5eFVma3NLZHY2MnVCODhXWHVq?=
 =?utf-8?B?K0F1bVlJUURJLzNuVVkxZGVrOEVTcjBNTW4vaFVYK2Z6QUxFd2dNU0gvWlFw?=
 =?utf-8?B?Si9pOXlOb0R1UGVtaE1OTmxFOVJYcG5rVHBMbDBjcnA3NkdzTW94NWZiaWJU?=
 =?utf-8?B?ZWNoSTBCQW9lZG1HQjFrZnIyWEhNMG5SMWxIeURxN0FvQnFOYUJuVGdWdTZi?=
 =?utf-8?B?RFJNTmVIS1FjbXZ3Mis0K0pPcGpiY1BPRzhSSzkyZG1pUzhxdjRwSy9CL0hK?=
 =?utf-8?B?bStGdm1Uc3VRL1BxRjYvWEowYUczNU1wYmFkbllDZEtNcGhNemkwWUswSXhq?=
 =?utf-8?B?ckZ3cWFJL1hsQ0VlSzdJTnRjMHYyYzg4clJ1TFkwK3V0d1VlWGlPajcwVDdI?=
 =?utf-8?B?VE5qNy9XYVRtaG5jbjZWbE95VHhXOENkNTF2NXZzOUhCOUg3SDFjT0VaNWNU?=
 =?utf-8?B?ejB6Sld2bS8yMkNLajRoQ0RLNTFJenJhVkxwV3RhT2FCS0pFT1ZVTTNCV3NB?=
 =?utf-8?B?cmZia0tKOEVTc2xXMGxDR21JZ2hVT1VueFdQeDhrM0NrL3M0cExwUHM4allP?=
 =?utf-8?B?RnE0eCtPSkFvb3NQNk1aazZVZGt3R2JWSVNYcW1SVGFQa0o4QjRKREFqN0po?=
 =?utf-8?B?dE9JVlEvTGl0WVduSG1vRWRaR01ka2d6WGFMNzRQNWluM2hidnRPdng1alpO?=
 =?utf-8?B?UjZncVlwVmpDRlNuRnpsRnZ5aGhxamw5QmpaRkZJVHJqZ2hqREdiVHR4SjZ1?=
 =?utf-8?B?R2ZBWjVJbFAvaVA3QlAxMlVtVnppcFI4R0Juay83UlNpUHk4SVZCdk1wektz?=
 =?utf-8?B?cENNMENtRXIzb3VoZkFGeW9wWm1TVFBnVDhtZGZmSElkZDNiamZmaktlRkVx?=
 =?utf-8?B?Yk9MNjc3MmlzbkZGeVFqRTNjZjFnMEcrUXJuNzRiQ2NTUkxzSDNHMi85eHNL?=
 =?utf-8?B?RDBsV3lraGllL0FhZnJDZWswamtwZmVlajZ0TC9zVFFqVExyazUxSUxWRGkw?=
 =?utf-8?B?N2ZKOTY0T1dUbjlld2c2aFp1Z1ZHSEVURlh3Zkx3VDZZQjBqcnhibzlIK3I3?=
 =?utf-8?B?djNjWUlqbUZJY2F2Z0hjYlNsQlBiZFJuMW9sMjZZY1VGVHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3h5dmkvVkZKd0lwYWtFZHJhSUpuQ0pabFN3MzZqZ3lMVEswWnJjV3hHWEZJ?=
 =?utf-8?B?bVhWNml6TzVhQTR1T2RrNzBVQnU0aGg4QUpjVTBYNVhJRHVzc2ZOY1BjeDUz?=
 =?utf-8?B?eE1maTNxZDJnd1pLTmdva0VpdHgySnd0RTQvZnY5dVlndzQyV2x3SytnVkkw?=
 =?utf-8?B?NzU5WkJNdHQzUFg3MmdSY1FkMHEwN0NJczZnU0p6UUFIZ1N1V0pUVVU1SytG?=
 =?utf-8?B?eFgyYUYxd1Z2cGdIK2k2V0NscHNrNWs2MEtMaDM0TlBQb1NoZTlOUzZLbUpN?=
 =?utf-8?B?ZWlCcFpIUGtkUFJOQ2FLZzJ6bHNjUUlHYmlqaTNJTytpR1RBSjhRb2YvenJC?=
 =?utf-8?B?alc2NGxVVkNVZXRQY0t3Yjc0a0xodjQyN1FJNDJoZG1tQ2VhUU1ZOGRSVThx?=
 =?utf-8?B?MmxTM2VIYk15Vk5ONnU3U2FnS1lMQVFhbEovVUFwN1NPMFNCdStsSmNLZ0Vv?=
 =?utf-8?B?STU4RExONEZsa2dzaXRvWlBydXdiQUxrSHJEZXkxaHJtR0xCbitvWFIwaDE1?=
 =?utf-8?B?V0NPVVoxTE11U3l6enBxcXVjOUlraFJyeWZoOE9OZUdPZFQ1VEc2UjhGM0R6?=
 =?utf-8?B?eXREOC8zUEdlUTZzVFZTZTBBU0wxR1Z1WmR2SXFQeW04NFJvNkhBNG5LTDhl?=
 =?utf-8?B?OURZWGlGNktiZGlOSktHR01mOWtydnVmV1lydEh0TVlNaUhZQTdZdUF2emZm?=
 =?utf-8?B?OGpYS2JUaldqMVpBRkQraTBIVjVFYktNcG9hNVNwaGxXeUlwRmFIK0ZlMzda?=
 =?utf-8?B?WnU1UVZ3amd4OUV3TlArZE41cUlRWGFTQnZHa2plSEFKVzIwVFpLNjYvWmlq?=
 =?utf-8?B?bHVSdjlZTHFuQkZnMTgwa3M3Y1VuVTgvcWJ4VjE5RWRUcFJ1REtmSExia2da?=
 =?utf-8?B?QUV5bThCNFk2a1JHT0U5TmJUTjlEcFBwcDY2TlJJTVhXY0w1dEN5UlZKM1kw?=
 =?utf-8?B?bnh0SnRjcWc2eU9hSXpXUXAveXFpNDB3MUYvSVMvLzdvbXdjTnI1Y2ppL2VS?=
 =?utf-8?B?RmhWNE1wdGw0dDJvSGpvcXlVL1ErZHhET3lmNXJJaWRhYzV3cXdUcFFJRGU4?=
 =?utf-8?B?Ny9NK0Z2NUR2ZllYKzZlNHdoWW5LZjcrdStPQ0xWbE45MDhocDkrc08vYUhK?=
 =?utf-8?B?TzVKNm1PUExCcFFxeGhvcEZBUFh2aWNWRHlaU3JZanNmL1F5VUhQR2N5Vk00?=
 =?utf-8?B?aWs4UmNabjUrZjErY2txM08wN0NtdnZjZkFmblFQbGlkYk1hRkVjM1A5SmpO?=
 =?utf-8?B?ZWs1L1hZbFg3SHo2MTV5dkkxcUQrRktkM2JKMk9jTkFMQ1Y5cVl3UlpLK1lE?=
 =?utf-8?B?aG5xZUI3TGlST3pPSVlYTlJpM3FvSGFUV1ZiMCtpL0huR0hpVTdYL09MdUNS?=
 =?utf-8?B?dWU5Y3p4QTg5NkwxMHVSZjJHeWw4YW10VWdnSWxOdTcvSmRUamphYldMUWp5?=
 =?utf-8?B?eVYwd0p5MERDREJJU2NJbnA3TENnM0pqZ3N5UE5JZnlaUklPUUFuSVdZNXlq?=
 =?utf-8?B?OFhqQlNZR1NrZDB0blUyUXlQZER1dXYxWWNYdGZFMHJQVmFvQ01ISUVTVEdY?=
 =?utf-8?B?TjI4U3RuVVQrek50T0xWZTg0UnNkZ003WVlaVlV5TC9nTDE0dlNMeWlrUjVR?=
 =?utf-8?B?endSZDJyQnJRUHdFZGlCaWFiMThVb2xEVDl3STVqWUdHK3hSbmkzR2Z2emtE?=
 =?utf-8?B?VDdha1Bha012T1RpMXVBclc2SFpiUllqS3lKNXJKQlVzTWNBZDBqMFRhc1Vj?=
 =?utf-8?B?b3pqMEFOV2g1QzRDM3dNUGcwcjVPUGJWU2JacmE2cURNc3FGc1ZhZGRBOEV2?=
 =?utf-8?B?OFgwMHpsbjdBSWdYRGhncTdhRFl6MkVPMzRCVk44TytvbXNmNHNXdit1OGVk?=
 =?utf-8?B?SytPNFpXRko5ZHV3bmVET1VnajdRK2liYmhQaE9sbGtQblNoeGx2b0VqeXc0?=
 =?utf-8?B?c1IydUl1akVxcHRMT1NLcXBNeWZXSFBXYXhuN1dWYXZ0OHJyNlB2b2VNV0FY?=
 =?utf-8?B?TE1iOEpZMUlRQ3FEcmJkbStFR3ZDR0ZxdjR6THZnTWlNZkJLbGN2Mkx5ZThp?=
 =?utf-8?B?dlVybHd5OGhmYk9CRVRBOEFjekxIUk9BSEp2TlRKczdyeE9DekZDeVFGczdM?=
 =?utf-8?B?MjRDMWhqTk5MbUp6R1MyUWRKOC9nbnlQdWZsOWErTTB4b0NHdy9mYlRoZ3B3?=
 =?utf-8?Q?7E+4/beTBt8sABKjm+YXcFw0OPz0XGlT8XtwHm9CliEr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aae8288a-23d8-4874-32d7-08dcc1b1245c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 07:16:14.2778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2EI1cgiZwKz9DYoHbifp8ob8JmCMNnU53Ig5Ha4QP8aJaUmXx7RFG7wegupgpawXvYSBOsBK37q06B1svyvaWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434
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

SGVsbG8gU2FudG9zaCwNCg0KKw0KK3N0YXRpYyBpbnQgY2hlY2tfY29uZGl0aW9uX3dpdGhfdGlt
ZW91dChpbnQgZHJtX2ZkLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwNCisJCQkJCWNvbmRpdGlvbl9j
aGVja19mbiBjaGVja19mbiwNCisJCQkJCWRvdWJsZSBpbnRlcnZhbCwgZG91YmxlIHRpbWVvdXQp
DQorew0KKwlzdHJ1Y3QgdGltZXNwZWMgc3RhcnRfdGltZSwgY3VycmVudF90aW1lOw0KKwlkb3Vi
bGUgZWxhcHNlZF90aW1lOw0KKw0KKwljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywgJnN0
YXJ0X3RpbWUpOw0KKw0KKwl3aGlsZSAoMSkgew0KKwkJaWYgKGlndF9nZXRfZHBfcGVuZGluZ19y
ZXRyYWluKGRybV9mZCwgb3V0cHV0KSA9PSAwKSB7DQorCQkJcmV0dXJuIDA7DQorCQl9DQpUaGFu
a3MgZm9yIHRoZSBjYXRjaCB3aWxsIHVwZGF0ZSBpbiBuZXh0IHJldmlzaW9uLg0KDQoNClJlZ2Fy
ZHMNCkt1bmFsIEpvc2hpDQo=
