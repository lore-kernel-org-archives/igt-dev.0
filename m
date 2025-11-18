Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25128CED606
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 11:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EB310E353;
	Tue, 18 Nov 2025 11:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgRSknEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5398D10E0F8;
 Tue, 18 Nov 2025 11:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763466400; x=1795002400;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wN91Bs/geHsDqF/3560jseL8kRj+OtHNuKC3rz1LpKQ=;
 b=QgRSknEB7aXXcjE7LqEP3O5GRI5QrzeKexL4ig+6ZvFVFHFB6shGrUjv
 d4AoN0WM8glsyXT/PUe2qiA4Ya0r0VHpwriMaBiFvpUWvRThsn0eVt4Dw
 XSboDYOq9jFYTWYDPjHcnOGHRoDJQOCV71NbKeFdDDiN58S9/6jb38G+O
 t641Q57lhJ2zEe5p4ouEOGD6rg2yKxWLtE+qklyyoAt2VJNrdDq671B2c
 nD6/D+1GINGqg88bodFdiqS3elZZPoGHXrPmLFefBXfY4wsEUP0jg57Hd
 NdLtGtYQ9A4Ga8YtA2VJMUXCO7T1/t1qXll4U6e5c05LsS/ZgzRqry0Sa A==;
X-CSE-ConnectionGUID: SrTLNsU4RsmpN5BlkmuSGw==
X-CSE-MsgGUID: C+F+W0xiQEOilXYjytoy3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65527093"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65527093"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:46:40 -0800
X-CSE-ConnectionGUID: 0TuR6MZ8TDuAGA66/nbX0g==
X-CSE-MsgGUID: 4ctUA0VaQX28OSZVqwQGDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195869840"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:46:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 03:46:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 03:46:39 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 03:46:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzEbkTNk/p2GFEyssGmusi1fTL6tisL/mfsyx9UY6P+yQArb/pheFNmd60t+okGlwbeJKaXen7bkB9hgn+xHqYD/Xzhp/PqiH5uQlbQQnSn66bjUhPnS/XWYcDDfZVGeN822R/whABpOFsgt0571vlvv91G/+c+mwQUUmmkIdwYV1W5rui4RUKdS9lHut28rA2kt3ruFPIaIBDKXwoLkD9OWw0Ve6LybOLuMXZIjQomDIePkkVMI1jUO/FjNGPW+NRVCra7GGzyw8y0Z0R4ld9723fb3JODKr4XUdOj5C8eB0vAd9xaHJ2p7KBHyp7CyZXlZt740PVUpSxf1WvvbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wN91Bs/geHsDqF/3560jseL8kRj+OtHNuKC3rz1LpKQ=;
 b=nXOZoDgfugnGma1HfAzXKSVxjp5xP8ZRxAF2e1IUaejb9+cBuDhevG/ubieKdvNPqzJniG/9/xvImR6aauO/Ua7v1bwSRGSMfMB2UXiHTOGSVDnYxx29z2xqH+NDGe4qYW3MSI2zpOyQVhJbIjZ+5xh+z1/5kiAdP1ng3KjhbPLOMS3GI0+muuMoMvoPd5yx7geHS7BDRb/tcL83nybcCKYw0Badbc/sCbtgMRp6WRej/g7BjnNv/MpVyxIgBr+L5ZB5zq/CuXyr09Y+kkMJ1zVA0CwgyEqQ+bdSAE/L3a1vG+7p3drnC9rCEXylHS+hecLwDPodbXt+UYW3woAntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by CH3PR11MB7274.namprd11.prod.outlook.com (2603:10b6:610:140::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 11:46:37 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%4]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 11:46:37 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVs?=
 =?utf-8?B?L2dlbV9sbWVtX3N3YXBwaW5nOiBSdW4gc21lbS1vb20gaGVscGVyIGxvb3Ag?=
 =?utf-8?Q?in_background?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvZ2Vt?=
 =?utf-8?B?X2xtZW1fc3dhcHBpbmc6IFJ1biBzbWVtLW9vbSBoZWxwZXIgbG9vcCBpbiBi?=
 =?utf-8?Q?ackground?=
Thread-Index: AQHcWHG2g93ZQO3n/kqX9pSBNjfP6rT4SvhQ
Date: Tue, 18 Nov 2025 11:46:37 +0000
Message-ID: <CH0PR11MB549118182080BBEED2295BEBEFD6A@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20251117113032.1143849-2-janusz.krzysztofik@linux.intel.com>
 <176343637818.3464.14976069063950732187@a3b018990fe9>
 <2239793.KiezcSG77Q@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <2239793.KiezcSG77Q@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|CH3PR11MB7274:EE_
x-ms-office365-filtering-correlation-id: ff06293d-05b4-4aee-00fd-08de2698219b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700021|7053199007|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?R01VTStodVlEbW1CQ0lJaTFTcUg0U0xROUkwWkIzTndGanpsYzQ0NUxOMURT?=
 =?utf-8?B?dG5WQWhCeStOTXcyb0lPRWRsd3JIcmR5WUVNQWx0UWpNeXFqVHcybi93djhj?=
 =?utf-8?B?UVZyMFZCZWRtV1Mxem5sdkFSQk5xc1ZaQXJQS3NQdU1oM2c0TmI0RjlibzE5?=
 =?utf-8?B?aldZbHRDZGFodnpmVVo2aldmMGxhdm80SzYzTGlHV0N2eU1zZ2kvaVZoNEt5?=
 =?utf-8?B?QkZoV3lhNHZDVFRJMFFzTG1idE80OUwxWUJqYUJoWUJYOERDbHJ4N0JqZ3RF?=
 =?utf-8?B?MmhRQ1UzMHR4ZVE1NHRkbThjZk9ra05CMHNxNHlVTHdsZmo1YVF5UTJQc0pH?=
 =?utf-8?B?dTc3a2lTWTNzM29IUlJQeTFhN2x6TUNyOUc2MC9lRkFhQjJHMkFjV2NHUUpn?=
 =?utf-8?B?UHV0Y3VERUVkekIzN0Z0a3o4V1RsNE5JTGZ4MjJDZHVqc3FBSjdacHgvM0FN?=
 =?utf-8?B?cTdsWWJGTzRkOHdvVTNrRGFqQ08vRnA3MkZSVm9GT09DcmZOak9iK1BxcUQw?=
 =?utf-8?B?RitQN2pTNFhTY05pNUpxNGZ5aGF0aUg1SjhpQWtQdXRsanlNdEJTNENiejJw?=
 =?utf-8?B?cW83Njl3dXZ3K1JvMGxHakRQZ1JmaXUwODUvaUthVjhub0JhTDdyRTVMdmt2?=
 =?utf-8?B?VVdDY1I2MlZyUEF1RGN3dnRBalM0a1JrRjNIazdoZkc3VThSbE5raWtKbVha?=
 =?utf-8?B?YU5tVE1UdGRDdWgrTldSNVo5N3EwajRtTjY3WFBwZy9OR0tTbTlVTTlRdFZv?=
 =?utf-8?B?TmxPa1EvNU02VjhmeDdhanB2Ulh5dURvVnM4Z3pDcXIwbDR5c0ZWVUJUU0xK?=
 =?utf-8?B?bThuNm9BaWhYYm1lZnl4V3FGSGlXR0xHVkEvTlhGMW1SNElWWFhRd0xHV0Fu?=
 =?utf-8?B?dzRDSDl4RkQ1Wlc0VjRDSUR5WU1QU29xdGRJSUZ2bVNLb1BZTEhycXlGYUFC?=
 =?utf-8?B?djNNMkU1elBkem5JUjRjdW5LTW1vRnlYa1pTL0phY0VBSXhVeVhqMjZLeGIw?=
 =?utf-8?B?RjVDNXZRWnZlL2FFWTc5VmkzaUpBT1M4T3pIUFZ0SnhSd1k2K1B1T3VqcGdm?=
 =?utf-8?B?YUQ5UVlxaFcwVU5VZ29DMmZVc09oVU4wR2YwbTVXS3crU1BBanNYYkRzc3Zr?=
 =?utf-8?B?VEI2aU5hS1BvK0ozOUtIQmdaNHJKamsrbzlQWTRrcEdXMVlmcW8veDVRN1J0?=
 =?utf-8?B?YmhxZ1JIZFZaNkVGclhWRGtyYTBFdzVNSDJ1VGFsWnpKeU9DcURQbzdDUjZY?=
 =?utf-8?B?Nkk2Z0w0bGR4NjRNZFdjSklsdmxBZGVQbDVhMFhJV1ZhMGhxN1VtM0p6bDVS?=
 =?utf-8?B?RXBqK0NWYkM0cW9lcGYxOEJGaXA2dUxmdEUwWU1ISngvVTBYV3lPOXVDeHQ4?=
 =?utf-8?B?Zmo0bGdDNm53SXpZOGFSa1gyN1NnWW0rQ1FDUjNPeHAxRUUrY1RYWlMxbzZ3?=
 =?utf-8?B?OE5KUlBLd1ZLY2pMTWgwNGkzRXFkelhwOU9wL3R0REs0YjRhNDhkQ2dHWGR0?=
 =?utf-8?B?V1o5Skg5U0VoQlVtMTROamk0SkVhMjM1SGVUdmkxNXZXN3JOekZVSzlTZkNK?=
 =?utf-8?B?dEFQcHkxblFmVE9TR0Z3RGFEaG1DdXRuc0pINnFLblVTM055TkZua0swZnI4?=
 =?utf-8?B?aldTSEM4M0JTMHpZTjIxbVJ2a2pHQ0gzL3JvMXgzK3EvRCt5T1NiMVFDTkRy?=
 =?utf-8?B?dEJHQnI3ZUZmVXJJcjRjQW1qRjErd1FvRUp5NEJCaW55SEh3cE9MdTRXTkl2?=
 =?utf-8?B?MC9aN2l3ekFLd2FIMUhGMDI1dzFCMTNTaEpQc3ZIVWdweVNhNjJRTVNnQXhD?=
 =?utf-8?B?dEFJa1R1UUY2K2xFc2xadCtGMkFwNk9rbEJHdUx0Ui9OYkNvbENHRzBKVERq?=
 =?utf-8?B?N0tLY3A5Y1pLbnU0eHVUTUNqdEpTdHFxY0xxaklYbVgyYU5UVXBxdDZZcTFz?=
 =?utf-8?B?Qy9lYlp5R0g4WjBoejgvQVF4TkVYTWRja3BpWE5iekJDUTNWSkJvRGx6SXVz?=
 =?utf-8?B?T2piMU1mSWJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700021)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHRBM0IrbUFUTHFiVkdkanNRN0ROeDMzQjRrODNOeWEvY3IxYW1vUHRJK0VQ?=
 =?utf-8?B?VlJKQXBORGxBVGJmeUZOYU5rUjRrVkJFb0IrdzVsb2xOUUR3c1R5amxwcUFm?=
 =?utf-8?B?S0hhOHBtSU5uTXZWOEVxNGFwNXZRZG1WU0FZQUhJSERVVndtQmhnd2kxd0wv?=
 =?utf-8?B?N1FLZjRWR1MyanowTEkxMCtiR2JUZzhEVjFESUNTc2JxMlBlcXJKUjhDZ3Iw?=
 =?utf-8?B?c3hYRjNuY2dUeUpYYnBBQnpxci9MYytwbUZieU45SWRJejdpbDVteGk2L2RH?=
 =?utf-8?B?cENGM1RvYUg1L0hBY1FEUWh5bUcrNERjWXZXcVBnREhRbW5Za283M2NjcVNx?=
 =?utf-8?B?M293aEljTlRUTklWZkdaaHZXV3J3MUhZd3lVVDVPUEY4cmQreUVyQnlzL2tR?=
 =?utf-8?B?VVcydUxjY3VpSDRmbjdqSmRJVUthZ1NHK0I1YlNJZlNCbjM0QXgxSHNjUGdF?=
 =?utf-8?B?ZWVHcXlXSmw5L2pZSGVpNTBod29BaXAyMDBlMy91YmtjOUhwZ3g0QStJTEF2?=
 =?utf-8?B?MXNvL1RJRHlFSlpmSk8xZjYvWE5rWVp6RVYrWWVXR0VYSkpvSk84U1VCL3Vi?=
 =?utf-8?B?QmVETmJPOHhkWnNCM2ROV2NMNnNmeFBSY0s3b2dlNndobzUwQ281b1c2R0tj?=
 =?utf-8?B?NTdvZ0t0bStmSk1UeHVSN3RQWHJCVnpPUGNQQzk1RUtuY1BvMjFBSzBSUy90?=
 =?utf-8?B?ek5CK2R6Rmo0c3lmTjNNTzN3TEsvTkFLd2JnOVl0VmEydFoycU1DdU9lcldH?=
 =?utf-8?B?K3Rma1ZvVzF6ODlkOE81QzJyOFZYamNSbTJrejQ0Nll4NHR0S09YN0ppb05x?=
 =?utf-8?B?M00xeHhRMkZjdEdqWms0RTNOSlYzaWpNNkVUL3d0eCtmOGNwdEY1RnZQaklG?=
 =?utf-8?B?RTUvUlFPSnZDeFlFUmIvSDZOQndRVG4xN3ZVNE90WjFvRnI1aHo1ZTlBMXZE?=
 =?utf-8?B?NGo0Ym9yb08zbGg2WW5MQUJOTzVINWMwMXducDNUNStMWm9ad2prTXg1SS8w?=
 =?utf-8?B?MUZIOUtUOXJXYnd3RlJKK2toQTdrN3pseUxtV0l0TFRLUlNDeFNta3hIY2Yv?=
 =?utf-8?B?UFk2SEpRVmtlSXhiNTlydjNXY21McFBpNU12ZEZLNHYrWmVSM0ZxY2VrQ2ZO?=
 =?utf-8?B?SndMTjYxQWF3a3JMQTFuNXBWRmlsbHFKZFdlSG5aQUZhemdXYzFSa3FSMGxX?=
 =?utf-8?B?blBFQnJRRklETXJ1M0hWVmZXSGxqSG02YXlQbDVFWG14QUdoMExpc0owdnNo?=
 =?utf-8?B?NFBmTHFheGdId3Q2WDlXMWg3d2pCV1FPUVNKVURCV1FsOC9WWHEzV3hWa2J2?=
 =?utf-8?B?cnFlTGtZWllNc3JacnRmelFiTmc5Tmlnd1JCdzcxaW11MGlBOEs4NlFpNjgx?=
 =?utf-8?B?QlRSbldrVmR3NlFGbDJWZEJSd2lnSzJqNXFrZThDVnFVSEV4MkRGUEJzWHY0?=
 =?utf-8?B?THUrOE9tYkxLemo0NUF2aHlrcXlFTWVmWnRmMUZrUS81VEVEQlhVRTBOSXQr?=
 =?utf-8?B?OGxNVE1ST2VsUVZCazIvV3hEeWtOZnRqWk9JNkRDbVFBa1lmYTJMNkVQeUpI?=
 =?utf-8?B?OHN1bHh1UmJWRDcrd0xmS3orZnNuT1h2eFRYeHFOVnUwMFZFbTY3UmpHQUJr?=
 =?utf-8?B?RXlOeDJaOXpTMUx2RUdvZHUxWEI4M1MrZG1wb0d1NDRNbTFjREU0dFhGL3BC?=
 =?utf-8?B?aUIrWEx6bnhVQ0tacTJzRzBQdGFsd1U2Vkl4TWtxeCttaTl4R0U0OEJ6aktM?=
 =?utf-8?B?V3lKQUdvelJoT0xjR2tLYURaZ0ZPRFp4ZkVZQ01Td2NiUjVlL1lZZkJoQnR4?=
 =?utf-8?B?ay9VU2pFMndtblc3WFBzS1FwRi9UbjdjYUZMM2JOTHhZQ3U0MnRlYlMwSkdT?=
 =?utf-8?B?ZWhIMG1XbjBDNlk2dzVEY2hCNG5RQmZ2SWNJc0QvclJFN1c0WlNSV2hhakNp?=
 =?utf-8?B?cW5RQXd5Tm84T0dNNFBZTzN2OUZ4K0RDNU5iMDkvd0FvbTBmUjhCU2N3cDEx?=
 =?utf-8?B?UFkzNmtBekJDQWxTb3doNVM5MS9lalRVVHJCTk00WVZQdFd0SW5rbmdZNXZU?=
 =?utf-8?B?a290U2VxSE0wRWRzZXZUUENaeG9uUTlNS0J1VERSYnQwVDVYUHBLZFMwSyth?=
 =?utf-8?B?WTNoTVczT25rbnFqbWhnR2ZtRDhaVUVQdVNlR2VkZWZRYncyN3JwWk5Xb05v?=
 =?utf-8?Q?ZwDm19EpglwlK5NRzWfPkOrtX8HVl/ICRxVPpAVkVoi4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff06293d-05b4-4aee-00fd-08de2698219b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 11:46:37.3214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p1XIdm3yAPa/qC8pazeQFVKJSyBR1mh9W/zXQo8XswCAdlAYEH3Bl3CUT6QZ2si6iPHZqVlKMYPZrqkWgDPMx+yrarlgKqCl00cr7HSKVso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7274
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

DQpIaSwNCg0KIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU3NjYy
DQppOTE1LkNJLkZVTEwgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpLg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKYW51c3ogS3J6eXN6
dG9maWsNClNlbnQ6IDE4IE5vdmVtYmVyIDIwMjUgMTU6MjcNClRvOiBJOTE1LWNpLWluZnJhQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpT
dWJqZWN0OiBSZTog4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvZ2Vt
X2xtZW1fc3dhcHBpbmc6IFJ1biBzbWVtLW9vbSBoZWxwZXIgbG9vcCBpbiBiYWNrZ3JvdW5kDQoN
CkhpIEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnLA0KDQpPbiBUdWVzZGF5LCAx
OCBOb3ZlbWJlciAyMDI1IDA0OjI2OjE4IENFVCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmll
cyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHRlc3RzL2ludGVsL2dlbV9sbWVtX3N3YXBwaW5n
OiBSdW4gc21lbS1vb20gaGVscGVyIGxvb3AgaW4gYmFja2dyb3VuZA0KPiBVUkwgICA6IGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU3NjYyLw0KPiBTdGF0ZSA6IGZh
aWx1cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZy
b20gQ0lfRFJNXzE3NTU5X2Z1bGwgLT4gSUdUUFdfMTQwNzFfZnVsbCANCj4gPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0K
PiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBj
aGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzE0MDcxX2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRvIGJl
DQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBv
cnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50
cm9kdWNlZCBpbiBJR1RQV18xNDA3MV9mdWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0g
KEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAg
dG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxz
ZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVybmFsIFVSTDogDQo+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQwNzEvaW5kZXguaHRtbA0KPiAN
Cj4gUGFydGljaXBhdGluZyBob3N0cyAoMTEgLT4gOSkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+IA0KPiAgIE1pc3NpbmcgICAgKDIpOiBzaGFyZC1nbGsxMCBwaWcta2JsLWly
aXMgDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
DQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50
cm9kdWNlZCBpbiBJR1RQV18xNDA3MV9mdWxsOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0K
PiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QHByaW1l
X21tYXBfY29oZXJlbmN5QHdyaXRlOg0KPiAgICAgLSBzaGFyZC1zbmI6ICAgICAgICAgIFtQQVNT
XVsxXSAtPiBbSU5DT01QTEVURV1bMl0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNzU1OS9zaGFyZC1zbmI1L2lndEBwcmltZV9tbWFw
X2NvaGVyZW5jeUB3cml0ZS5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQwNzEvc2hhcmQtc25iNC9pZ3RAcHINCj4gaW1l
X21tYXBfY29oZXJlbmN5QHdyaXRlLmh0bWwNCg0KQ2hhbmdlcyB0ZXN0ZWQgdW5kZXIgdGhpcyBw
cmUtbWVyZ2UgcnVuIGRvbid0IHRvdWNoIGlndEBwcmltZV9tbWFwX2NvaGVyZW5jeSwgb25seSBp
Z3RAZ2VtX2xtZW1fc3dhcHBpbmdAc21lbS1vb20sIHRoZW4gdGhlIGFib3ZlIGZhaWx1cmVzIGFy
ZSBub3QgcmVsYXRlZC4gIA0KUGxlYXNlIHVwZGF0ZSBmaWx0ZXJzIGFuZCByZS1yZXBvcnQuDQoN
ClRoYW5rcywNCkphbnVzeg0KDQo+IA0KPiAgIA0KPiBLbm93biBpc3N1ZXMNCj4gLS0tLS0tLS0t
LS0tDQouLi4NCg0KDQoNCg==
