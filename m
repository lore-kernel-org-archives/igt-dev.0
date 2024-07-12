Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A4BC3DA4B
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 12:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2372C10ECF2;
	Fri, 12 Jul 2024 12:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+U9wN7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD29E10ECF2
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720787594; x=1752323594;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xoI38XORbxEqSPhXsI11Gs5DdK/aBAAdAT/fJkaFeHQ=;
 b=c+U9wN7BuiHsf7JtwL5YXWWb2Q7p/2CJSTNP26WWFmKYZHiJGb4cztQc
 eU53VisLxI5q1vYqZOwkaHcX2S4/DE30WlHICHPjO8teZ7AJRcUndyMp3
 qYaFRu9j2Wol5yQQdH4XM0RKGuUDcewP8xiBTEM4rB32scDUHV9Ed2U2U
 MrlCGagx7l8TEcuKK2q122ypXcRsvVmJPJ8qK5Y2RM4+hvovPeilKYbBS
 ThsX51eAo/sng1rgjCq62P2uZwGubSlGUTsFZlWnRNQpr37tquawzRU83
 wHC0DhvhU+TZt68mq1OiC6NyJkYLyb67w3d/mzhqBYbwy+1vFzLde/0gd A==;
X-CSE-ConnectionGUID: 8anqeAUSS/e3CsgZxuSj3w==
X-CSE-MsgGUID: NDiPtNFeRVGZ7KcTWZDHqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18426369"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18426369"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 05:33:13 -0700
X-CSE-ConnectionGUID: e9vwrjyuTDSxVr8ZXhjm8g==
X-CSE-MsgGUID: 9mXfnGbKS2yRRU4qxn+4Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="72111386"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 05:33:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 05:33:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 05:33:12 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 05:33:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQzEqPqlWe1VJRCKbCBEcX/xdjaKG2vEp/AQ0b45cfPU9H26n7MaWRZmVfCZIffDeV/NPBXush4w9qMU0nBIGtnqR571HaEvXcPCpZq0O815gUsqvni8f5xqaTnPLLCVICyCRmnY3yRbL4JsdY3+BZctLYO3Prtfa+/B6Ao5ULUQvo+J82Jai0foChDI83VMmsD+nL6AvgOIbB9LsaHSIJfpIfTpC9VMyRtKKelvZa/sdzFR8QWJ/x6EpCH5xDgoyWSXue3T2/1x6BXx/CsAJ61dSoarz5UWpBxqE85hX7nfRejo7wOCwbUkd+bik61sJ7bDqeWLlDXWWiZaT05SAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+UhceEdIv6WbZG6soaFL5s36OOoXi8pYwQJ17M/dDI=;
 b=hdrmpI3t99+mfQ+P3z4j/kAua0itSiFB/pDriNpyNmWM4RwiYYn7RXdRmmPXvmH4fLcHEhDCOR03rDWGOgGM8pqtLUSlsN/4Wwln05gmuLhecz0LHr88j9kCnELn7YWjCEcrd3fOwNgsOJaPqTPOP8XFhAeomRcaytVqmKSjf6ArgGtMOJEtoek8QJyu0IWH5n7ST5gwucg8m5dZTqykAwUKLubSvQreW/U30Wa5UMKwks3gyWAMNVqvZQh7v26u5ClVkKktM6RC0Op9KKTJgytuhRQamGrHgBmgpRB5i30ZsDtTWMaB18mztVLfyAcMolebN42xXKZy/IdS+smybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by CY8PR11MB7797.namprd11.prod.outlook.com (2603:10b6:930:76::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 12:33:09 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%3]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 12:33:09 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "akshatajahagirdar6@gmail.com" <akshatajahagirdar6@gmail.com>,
 "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
Subject: RE: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Thread-Topic: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Thread-Index: AQHa0ycIuDHgNSqlekyCfpW/PmIV0rHzCE5w
Date: Fri, 12 Jul 2024 12:33:09 +0000
Message-ID: <IA1PR11MB6097B86A91F51B54C414ADA486A62@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <cover.1720515376.git.akshata.jahagirdar@intel.com>
 <e597e39b0c22d3b58cda09e0e4b33f883b9140db.1720515376.git.akshata.jahagirdar@intel.com>
In-Reply-To: <e597e39b0c22d3b58cda09e0e4b33f883b9140db.1720515376.git.akshata.jahagirdar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|CY8PR11MB7797:EE_
x-ms-office365-filtering-correlation-id: 5dde6332-4d0c-4911-670c-08dca26ec9e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?pbqyDeIBniIxLFh7Sb/VSr0TWgEMzA9Qma2O1dTuBvnWVJafI2Yw+6rOtzeA?=
 =?us-ascii?Q?bB1e6Ixo/fKjV1x815q4mp6kpFtZXvPj7zokf2oMjKIuQBcUneoYPw8oUEbg?=
 =?us-ascii?Q?Payq/Vz+uuWMl3SdNRoDDhB1kdAACp6/sNOQ2A81qZNeXunANrteD8TMcwcc?=
 =?us-ascii?Q?6J4Des2wWMIwgl2DQVVkA4lYrRDP1RBaKVNg2KqbEZrVdwttB6l6A20A4sLC?=
 =?us-ascii?Q?xE0FkR29A7qeTP+V1NhsNln+sep7V2HClxJOLGxK7S+8xgRwyLu7yi+3QKu+?=
 =?us-ascii?Q?5zro6gmwpt96bH6ZKGbSJ6a32/aaiML6D7c1aRfWHrqQxkjG1XoAcOTR5BHE?=
 =?us-ascii?Q?sIM70nxKpndDwqZKCpIoGxzaUL3o8rHmCqsSdkX35smZwK299MF2L8ykarsc?=
 =?us-ascii?Q?FQArxS9BsbemCt/mAbsUVV2eNtonOg1I3bZ3AQsK48GmKIHI5A4BTwxvXzZb?=
 =?us-ascii?Q?UDHmrPnw2uFU1xl/qq+jkFGm4hP0KLvQJHTMatdqc1pYnsKwo3LAyRUNuomP?=
 =?us-ascii?Q?HwQYTkQO0jwODgN2rwKCnmls3WcXO1cWthgWarp8gHhLwz012J73sQZvbpag?=
 =?us-ascii?Q?2OY311d7SkmzyyR9B6Xk0yajBPfUkK1tUltv1IZhFJlgpfhMJxE4Vq64/HzE?=
 =?us-ascii?Q?uVSBGiDer7vvGPEtIkuShcdxSCswEUpL6Xy8sKKJkwyKyuZgUaQOip7BOxoe?=
 =?us-ascii?Q?5VdwNpk1BxuI4QoP0luUO84ad/vhPS5L7DcMeNP5OJsyraOCvERNzRec62Q4?=
 =?us-ascii?Q?NelLscKBrlCczA4o01DZPfbJEgXv4DxQIqTcIv1LIfpAU+Pj47PUbpwyp40i?=
 =?us-ascii?Q?oweOKqzxssexbAoIsMOSGD6PGdLDkYJxPY7CvSfo5EO/BbmMEHq7SL3bW3y/?=
 =?us-ascii?Q?tjo383dOq1i+0IEGa/PusHIcvz/l1Y85GolFtQu+wRWN7Y/aiHp5Kk4vre88?=
 =?us-ascii?Q?+gRSoAr/+XJ3PTDGmrBOEOKBzAzHGDFGfb5hHiglqlHCszr331HZvWjSEdoG?=
 =?us-ascii?Q?YevXGvFC1xi4NQpvupJssyOPW4ARMQigdTbuz0UujDo9Lq5iL/urecwcx5tv?=
 =?us-ascii?Q?gggxoKgesqn2EG89iPIO3tBw9Y3DGqZS/9umiyyx3p/8BfgO0HLmnlYog7hN?=
 =?us-ascii?Q?z9/dLvrT6WE2UVwMNokNDcMymlh7e8yW4Wcplx+31Xpiciv32nbaXTpl1v0o?=
 =?us-ascii?Q?dcNWKA2r0XsSTR13n9PXETYgkKWsYhT944zvkAygBn0Ih66cBmBlhIM4vIKV?=
 =?us-ascii?Q?ndVC4s3RbUxwnM4/B1dqaBWEJLhMwevvqBqF1J8KKCPqV5wlYfffvGU4nfHK?=
 =?us-ascii?Q?2fEPUL6tOGExbK/1x/LfWM8aIE9e6Xpz326wzMLVMA42Bws+aVMrZKGD3mEP?=
 =?us-ascii?Q?5R1QfkoAyxVGLQbCgyQEpi0t28bZ4v3RgYDOMfhdMXqxDZ2fig=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZdWGI0iGK62D2e+g+MdZI9jILPW4AgvtUAXMel4flg5qSsMQnaVERPdg5Nuw?=
 =?us-ascii?Q?yIp9jUUxHvasWW2WhIBl3zO0RgCYsZ41hce6iqGviWl2o2J0AQCIKkjmHbxW?=
 =?us-ascii?Q?v/A6I2SBq7ArZXPyFuR8GQfFI21KTCAOAsEwve/G00w8jnHnCYmqh+s9FhSP?=
 =?us-ascii?Q?cSTODuO65eBhUhYSzBElMOZEgARO+m6q5/mLhCvZxjuNhWAyLzQDV8IEaCEK?=
 =?us-ascii?Q?5MZ/PK+VcGb8yUhFgJ1qsfhtIG7pznSwudwjEAyuNkw0TmBde5pQk5muOIMo?=
 =?us-ascii?Q?TI7ZDpNoVyL2mMD4mN8ZqgXYrTPSi0iCLHJxeRXJ/Kb9WUc3YAR73AUrYI4s?=
 =?us-ascii?Q?UHvUAv27imAVeRsux3MgtqRHRfSYosFgNfv61B53UJ8MFsOSx7NTIR88/Eb0?=
 =?us-ascii?Q?YHmTOkzKRSuhsJgixL1+OK5lmvtT2AtWALyrWIryzI6Snn5OKeRqomcHFKz4?=
 =?us-ascii?Q?e2+YOdmCYTWWe1T8oUbLdE4eiF0OTk/i4zTr8WC58c5/xVqKopYfaEC6wNue?=
 =?us-ascii?Q?sqzsF2twJeFTsuIW6P5nHnfWr8AHQYtu/Jil9dmupvECdFKA2TXN86l5UWh1?=
 =?us-ascii?Q?Q2Hu8JKskA8YEDqvPdDhMP7NKuV5aFTcdY4R3m47K0mfC6IkgQlXv3qRz3k2?=
 =?us-ascii?Q?5BhUGlsF8r6No1ns3phg+b5IdMn2/jno4kmy4lux7fT2Q8nXBWfFKdmmPC3O?=
 =?us-ascii?Q?mBVvFEtQgD3a6M8pPd5QNSq81LD20Y/AqELj6sbtuJZXsRgEUea14ocJbAL3?=
 =?us-ascii?Q?BrjXCasnXk0aYo7TF1dLkCRVNVc+7fefggKq1+BKBjqauKhZfiQhD/SCzM90?=
 =?us-ascii?Q?EhmfkXz+tcjy5e6oEOKGNR3RyQlErfH/dc2P5S8IRvSfAqJhuJD/vwPhLLK6?=
 =?us-ascii?Q?RHLHDzBFKxw25wBbf+dB9pUTXwSRRNEBkZ4W/a9RotkWrihunweV2nv7ySzg?=
 =?us-ascii?Q?hRN8Trpo+yNqLpxh451FFVr0t5y77fRq0foECGUfHZLzwZrOYD4canPhQYtc?=
 =?us-ascii?Q?Ng0vSDJuB8p18kFVk+93E3XQnJFuwpZX+vMVIm97t9d4WZGl9WAfC24hZeqo?=
 =?us-ascii?Q?9gmyPcsgS2jwoffKQ3KOdgwWiSN8mMTWpAkBH28AT9qpriX/Yp39KGfiNmXz?=
 =?us-ascii?Q?CSVfLN5GuvIukdFjADcG9H2aP6mnyrHYJpWpLVGF0q/8G31/SGC8m7ymoxRj?=
 =?us-ascii?Q?c+J4JDBfo8BB21xy4UM3Nxh/GxXGPifOwdapPKpcSwncMxC7w9ncN4RhArsz?=
 =?us-ascii?Q?iqViZ1NxDI/ZNFhCz+BfPjQSDIU3CvDtwNZG58gSS1xGMsVRM2IHRyHAvvlv?=
 =?us-ascii?Q?nIccB6BtfjvBWt3Aa+X266D3grKKhVpKLs0jD6NNK0tYI9GeTGYezE6P7MGX?=
 =?us-ascii?Q?S800Ig8Ta6QaPmczoha0n2tmdhP0pGwEC5a1TRwk871QgUFh81m6zxkA/g4k?=
 =?us-ascii?Q?3My1OXOnWvyYKSJ1eLHHksq4RXBFUUnw6yHQ9wCl6GiOfqYi8waE0e+C/MLy?=
 =?us-ascii?Q?Q9UE6qk5+FUH7xQW9OCwDca08tvhsrluDijzdCo4QHZVLNDr5hK4M3WaTyUL?=
 =?us-ascii?Q?cZDTgEDcdonRLI1kpCFP6SVyyQ/LWBsJV1se3M2/eYx/SyG2aogK8eJbMeZh?=
 =?us-ascii?Q?hw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dde6332-4d0c-4911-670c-08dca26ec9e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 12:33:09.6548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h51DHQp4WXyQaeGHsv/qUscu5113J1xKH3K8gSvwfCFYwEObx+NL2A34uhUq7KE+5Wwwwv5KocAwdBoeWhw4LfhXj4Q30EwoRkH2V4iK3Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7797
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

Hello,

Ashata, please verify results from patchwork as our infrastructure is not a=
ble to process whole logs.
Example - https://gfx-ci.igk.intel.com/cibuglog-ng/testresult/1840022997?qu=
ery_key=3D5010e5e29d437861d2c89e0d98eda884b16111d8
Looks like whole memory dumped to dmesg?

Please check your series before sending at least on 1 machine to avoid such=
 situations. Patchwork cannot be a way to test your code.

Thanks!
Kasia


-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Akshata =
Jahagirdar
Sent: Thursday, July 11, 2024 2:22 PM
To: igt-dev@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com; Jahagirdar, Akshata <akshata.jahagirdar@i=
ntel.com>
Subject: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx

For Xe2 dGPU, we clear the bo by modifying the VRAM using an uncompressed p=
at index which then indirectly updates the compression status as uncompress=
ed i.e zeroed CCS.
So xe_migrate_clear() should be updated for BMG to not emit CCS surf copy c=
ommands.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h  | 5 +++++  drivers/gpu/drm/xe/xe_migrate.c=
 | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.=
h index 0a2a3e7fd402..c3093506c28c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -144,6 +144,11 @@ static inline bool xe_device_has_flat_ccs(struct xe_de=
vice *xe)
 	return xe->info.has_flat_ccs;
 }
=20
+static inline bool xe_device_needs_ccs_emit(struct xe_device *xe) {
+	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >=3D 20 &&=20
+IS_DGFX(xe)); }
+
 static inline bool xe_device_has_sriov(struct xe_device *xe)  {
 	return xe->info.has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrat=
e.c index fa23a7e7ec43..2fc2cf375b1e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -420,7 +420,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile=
)
 		return ERR_PTR(err);
=20
 	if (IS_DGFX(xe)) {
-		if (xe_device_has_flat_ccs(xe))
+		if (xe_device_needs_ccs_emit(xe))
 			/* min chunk size corresponds to 4K of CCS Metadata */
 			m->min_chunk_size =3D SZ_4K * SZ_64K /
 				xe_device_ccs_bytes(xe, SZ_64K);
@@ -1034,7 +1034,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate =
*m,
 					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
 					avail_pts);
=20
-		if (xe_device_has_flat_ccs(xe))
+		if (xe_device_needs_ccs_emit(xe))
 			batch_size +=3D EMIT_COPY_CCS_DW;
=20
 		/* Clear commands */
@@ -1062,7 +1062,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate =
*m,
 		if (!clear_system_ccs)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
=20
-		if (xe_device_has_flat_ccs(xe)) {
+		if (xe_device_needs_ccs_emit(xe)) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_mem_ofs, false, clear_L0);
 			flush_flags =3D MI_FLUSH_DW_CCS;
--
2.34.1

