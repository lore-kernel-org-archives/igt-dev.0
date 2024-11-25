Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130B6D3B7E1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 07:27:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BCD10E05A;
	Mon, 25 Nov 2024 07:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKCSeJV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D03A10E05A;
 Mon, 25 Nov 2024 07:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732519649; x=1764055649;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Qb3dw+lLFn4ktc7kN0B6Ou/akcCnBNJI9UwnePEFDz8=;
 b=LKCSeJV5mqgNjRaf00EyW5/l4Hy/GHuJ2OE/NVLVk6wDjAYRYCN+IkHk
 jbudktoSgXMQdTR6tHcU/ioxVa8Nih8xsWWnHdswxnbjGxLpZJemTv8ON
 5baFHgPbXNGOXyqj1jCwW7zW02kSt5kx7nRel1Ie6ph0lOp35QY4elCsn
 dgX48+K2IvhTQ26xFYNmONl08bWhJ3whsp8PTQF0kxH2GJUGzHd4PNEe3
 qIzyigp2qVrOdVX1W2Dw65r5oGT6pwREwuPPW8qvlmWXFyZYTv499i2+b
 YSGYcvR6pKv4a2bj8NAmTl9bVoXDmB6h/O72BsC8vxfKkqKT2EyAytH/E w==;
X-CSE-ConnectionGUID: SPyO7dz2SDK7wzyKtxz+lw==
X-CSE-MsgGUID: 7WNG6bUhTwiSzQQFb5LAig==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="55113671"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="55113671"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:27:27 -0800
X-CSE-ConnectionGUID: sGfzIIejS+Ss87CzFHKIKA==
X-CSE-MsgGUID: RXm+/6D1Qt2TRRSwFlzW0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="114447873"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Nov 2024 23:27:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 24 Nov 2024 23:27:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 24 Nov 2024 23:27:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 24 Nov 2024 23:27:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTKwwFxqNkUxi/SFEiuV8aJUl2fKbWd+O2sMyYuG5scYOK10+5lfJRbswhRan8SrDhk7PQiz8MZ1VEtcHlI1t4y7dDz8rN/XVrMkL6zHyRnRAjdAYT4SPK890WhxPV3QcPqa1IR3UoHPiOiyhYw+tdEuzAkjKKDxZJKhR9Jt4D0UJkwVSSBOZ1/9e6EkTc3DSAclcot/0JekcFQoIqiptRDOjxwXsAC1NDVtKKahzinIjoaAjBRRGYXGK+cP66VMEJPhfLz9TI8XKeqSPP90PxDQbMcGcMdlPYWekwyNlRbyPbqbabMbRdOXrpmSg/RW7GCv7VY6ilCRxHV4FKrMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb3dw+lLFn4ktc7kN0B6Ou/akcCnBNJI9UwnePEFDz8=;
 b=cZN2ZsPsTE3vX9kgBj1G6kqwvk8P2Uszg2UBd6sXa+kcHJ/5J/jwBFuB2f1PapNH0mGMGSpezM+Z2qRpxzX3VZs18yJ6qEvXSAG1K8TWRVAGrSFh0zJwQ0ta7IF7oxaNCHHzvQ/oh0Rx4jo3uwuFIBuk1PJa7OXUVY/s0P94zQKepzR0rUQZF7UZlcn7PIzcHglK0+ccw1czwpRjrNHJuGx0jxX3wEp4e7ews6ZVPmOUyKTi2aDgXXup2TQ8x0a9vguhD2jzpPFq9bFsOcbwIHDulzCE6mXrF9c1rTCWLjJ5jMc+ueQU6P29d71k9rVoQkxhqctfxePtaJvJcIBP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5)
 by CH3PR11MB7202.namprd11.prod.outlook.com (2603:10b6:610:142::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 07:27:24 +0000
Received: from PH7PR11MB7073.namprd11.prod.outlook.com
 ([fe80::d7f7:58f4:7360:54]) by PH7PR11MB7073.namprd11.prod.outlook.com
 ([fe80::d7f7:58f4:7360:54%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 07:27:22 +0000
From: "Musial, Ewelina" <ewelina.musial@intel.com>
To: "Musial, Ewelina" <ewelina.musial@intel.com>,
 "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Illipilli,
 TejasreeX" <tejasreex.illipilli@intel.com>, "Senna, Peter"
 <peter.senna@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBpZ3QtcnVubmVyIGZh?=
 =?utf-8?Q?ct_checking_(rev8)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGlndC1ydW5uZXIgZmFjdCBj?=
 =?utf-8?Q?hecking_(rev8)?=
Thread-Index: AQHbPLYx0R4TMOBvIUK8mrHs0PMo4rLHmhUAgAABLKCAAAITsA==
Date: Mon, 25 Nov 2024 07:27:22 +0000
Message-ID: <PH7PR11MB707318C2C0FD36C1C61AFA05932E2@PH7PR11MB7073.namprd11.prod.outlook.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173226306005.1628198.15482143446403084714@b555e5b46a47>
 <dc5e57ae-778d-4528-9fa0-6d5c11e967d5@linux.intel.com>
 <PH7PR11MB7073ADB94B82C0676DA45FD0932E2@PH7PR11MB7073.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB7073ADB94B82C0676DA45FD0932E2@PH7PR11MB7073.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7073:EE_|CH3PR11MB7202:EE_
x-ms-office365-filtering-correlation-id: 4cfeff17-7380-4b08-d780-08dd0d229a68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?N2NTQ0JWVGFFc2tiWUZLZ0lmS29pSC9EY1F4T3hsbWhBK3BoMHZTVUZ2ZUdO?=
 =?utf-8?B?RG9oRmJnUjNqb0NtOFNBWlJjc2JseEtiT1FOaStrdFAxRTdjWi9ONG1iUFJ2?=
 =?utf-8?B?RTNFME1DOUZiNFB3eE54eHRtNTVhSGRXV0tDZnMyL2xUaEx1Zmg0Q1VRZFFY?=
 =?utf-8?B?ZG5XU2tVeTZWWHZodjVZL21xa1g3Y3F5Y2FQQW1yWkpIUlNlZkFMZitvWUhl?=
 =?utf-8?B?Mk40K0QxdzFoVmcyS3R5NVU0OW8xRG1wanZWaWhxZ3ZzNGZSMjFMcmxpbW5K?=
 =?utf-8?B?WTF2UDN6Y2RJcjI2bk8rbzJQME5qUmlBSW41akRaQlkrM3lMYVhKK045ZHhk?=
 =?utf-8?B?SFpnMzN3K3lETlZKMXByUTYvUGpxcGE0alhsa2QxZTBvRDRHK0xMaHF5SEF5?=
 =?utf-8?B?SU5VaUN6UW01UTdCNG03SWN5a3V4Mk0rcytaUmY3WnNiU1ZkQlJMQkk1V0Z4?=
 =?utf-8?B?cnU1azU2RWFzdDZhTGxaTFBKMWhPQWtXdjQ4aUlvR3k3eHZFMi9pMFRSdVd4?=
 =?utf-8?B?RUN4aC8xM2ZtTGlleVYyaEo1Um85OFhHdUhJNzhRd0NpcGxFQnZHN0l0RHBm?=
 =?utf-8?B?aWFINHM2S2hDeWdBb0xDSG9ZVDdGck04eXlFVTgrMC9zMXhFNVNlcEpTdXV2?=
 =?utf-8?B?K2s3WFRXVktwWGpQRHBZNkpydWxoSTR5eWVBeEtnWE1meVFvOXR2U05nbmJj?=
 =?utf-8?B?K202NTc4Z1FHOHRsWnUxbjl2VE9SR0YwclllbVJPTXdubGE0T0NJT3kzM0J0?=
 =?utf-8?B?MThDZm53Q29BRiswSEppYm1DZHRBZ2lSYjlabHdkQ2ticXNNaEtZVlp0bFNG?=
 =?utf-8?B?NUQydk96VnVKY2hZRjNkZFBCTHpoc1U5SE5aNWhjbEk4cnZlTUhSU2VuaXdO?=
 =?utf-8?B?RnRrN21OZ2RUTm1tRy9YS252L0dwMGtwd0lmbVVubVVlTytuRUtaN1R5YnhN?=
 =?utf-8?B?a1lqMWRRYndVRFg0TXNvYTc2YjQvbjZGcS9kd0dta0xycWJxcFZ0bFU3Vkcv?=
 =?utf-8?B?Z3c3clFTQkxVUzFLYVNDN1VkZ0RacmxQcEUyMVJnQ0JRb3NiMmxyd3ZlL2d6?=
 =?utf-8?B?UTkxWkJMUkxqLzN1ZzJhcEpSdmhIdE5qN0lTNEhKR05XeFhad2NhWlhmaCt3?=
 =?utf-8?B?K2lwK2VyMFUwcUV4YldjR09sQ2VvQy96RnRZQld6anpLNEpjN1pacnBBSHpL?=
 =?utf-8?B?aG9VRkRkRVowa3lBYkZrZmwvbUVLc1BSUmpvVjkwNzdPSzZvcklWWFNDUjI4?=
 =?utf-8?B?R0dra0xkOGZ6MWl2VkVBNmE0SHp6dEdwWHBZdnpCSTQ1TG9jc0htUHprVEx0?=
 =?utf-8?B?TlhaWHhkQ3hXUEdMeGw0dEFWZU9GZkVaSG9pTS9ZZUNDR1ZVSUsxVnZ6RGRv?=
 =?utf-8?B?bEFNN2V4MGw2L3ZxWEJnVWYyTUU5NnNmVG1mUUJ0VkkzY0wvZkowZjUwLzFq?=
 =?utf-8?B?LzFVRk0zYXp0b2psb2JnNWlUaVJIUzJHOStkcDMvR3pSdVVETE96dlZrYmJ1?=
 =?utf-8?B?TFFvQ0VFS0tSN2EyZ3pnbXFxb1dtWFcvL3hKNEJ3b3h4alVEZTE1OVRYYzg4?=
 =?utf-8?B?WkhueXZudkoycC9ObjczU2ZON3hnSDZkYVVNT0Z6akRzWXYyL1duNERXc0Zt?=
 =?utf-8?B?ZzlZZkl6eWlsSmgxVmFBZldzM2hIUjY4Yis0NnNhUENNMUttelBtQ1orTmhl?=
 =?utf-8?B?alB0a3NRWUh4bStybndTZC8ramkzeTdxM3REV0VtbWJsU01xdSs1eU9oeVlI?=
 =?utf-8?B?RUNkU25yNXY2V0ZCOWZzbkdaZ1JVMDRvNzQ2eFU1TktOZlhKWkpxQWtwVE9K?=
 =?utf-8?Q?RHD1Pba4Io1vyRa6lDnKfjGQweBtUdcm2vdjk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c04zWms4Mll3WkF3Y20yRkgwbzV6cEoyNjVlQ2RHd05FWVBNZS9YaFVYTU9F?=
 =?utf-8?B?YlJjOHJPRlBkaVVtRFVzUWh5S3JEQy9hOUxJeTBwclFuMXhFOUdydHVSNmU5?=
 =?utf-8?B?SVFoSHUzaGNsblM2M3lveG1XY1ZjQ3hlNXo3bFpsclBhS2VTc0UvbHRvWGli?=
 =?utf-8?B?bDRYTEI2VjRCL1dhQnlpYWVZK281NmR6dW8yYUJJamYzZHorME1pUndIK0dp?=
 =?utf-8?B?TjBWaEp4MDNhbkdydU90UTFldzdFQ0F1NlYxK24wNVFWR1lSVW1mc1RUSTND?=
 =?utf-8?B?dlFiNjdPVy9zalc1OG5MQ1JPd3IwZlVUOFhOM1lhOTJtV09sNzFDMExpSUVT?=
 =?utf-8?B?aThMMVZiYnNObXBkK2VSc2VHVkZPd0p2aWxnOVJXbmk5OHhySzJmazZpUXpj?=
 =?utf-8?B?SkNaWHl1dHNlRDR6cGJ4K3MrSURoQWxrc2p5a1hRSmZiYlVRUzdRek55cnE4?=
 =?utf-8?B?RS9nenFuWkNiemRZcUdBVUVLZ2hyNi92VDZrWnZJbWYrc2V0SEdHclY5MU1u?=
 =?utf-8?B?ZW9ud3JvSldLUG5zYTAzN3hEVlVnVkg4YVB2UVlMdHNlVUMwRHpDeVVadXpB?=
 =?utf-8?B?ZUtpUDlZNVRTZ3hOeCtzdWQ1UTR6Skhhc3IvZ0Y0N001cTJkKzVlTHdTN1dW?=
 =?utf-8?B?NXBlOWtKWTRES2hhUDdOMzk0eUdRV2hyY3BZR0kwM2FpMHFLOTJzVktPejRK?=
 =?utf-8?B?c1AvTGNIQ1QvYlNPM09tdTcyenJVWFJJTXFXQ0FDMm50RDc1WkY3dTU3KzNr?=
 =?utf-8?B?ekQ5MlNmZ2VLeVZsSms2Q08reHhjcWR2VDlsYkh2WlNDODRUY2dLeVcrdkRu?=
 =?utf-8?B?TVJWQkF6WVVFaEFSU2N3ekxPN0tzWjdnTG1ZY2E2SkpROVB4U3NINVREcnZW?=
 =?utf-8?B?NUFHOHVuSURMUGRxNWt0YVRHSHUwYmozdUtsNVdXZnZueDhqcUdXRlpXK0kw?=
 =?utf-8?B?Z0tjT1orMmJEbjlUVXlhcmZKbWJJcVZwMEJKU0JzcUxXQjg2eTZnbVdtWkJX?=
 =?utf-8?B?Um0wNkQ3cUY3ZXNVYnF5eHhmVkV5L1NKYWpvd09ISXZLNUxId2JGa25kWXlJ?=
 =?utf-8?B?enNMSmFvbWE3dzY2ZDROY1J0ZkRvaUZFVTlMRWpKTWNvNFl6VWVlTG03NXBM?=
 =?utf-8?B?QVdXUU9wUUVQL21MMXJBM29welhWTXh5ZFBvK1BtV29mK0xFVkxGNythK3Ra?=
 =?utf-8?B?ZS9Lbm1SNXY0ekdqSHE5VnZPYndLU1FXT3hwQWNwRGVDSHRDaTFLYUFOQkFK?=
 =?utf-8?B?V1FoVmc5TGVzY2NNY3Nla2JQQUQyL0E2U3BYYlhrR2NaVUprMG14d0dCUEk4?=
 =?utf-8?B?dkFIZXBwUyt0WlpOcXVNN1dCbkJJQXRzSzhpMmp3bVBQZk1GMjZubFNXSzZo?=
 =?utf-8?B?SzV6bm10UDVxdk85NDJIUDFybDBCdWYrc3MrL2lXVkJ1SU1sa3NqRlNGYTdr?=
 =?utf-8?B?NWgxeW9aaXUvSk9HM21zWXl5WkkyT05oUjR3b3M4UjJhT2NVQnA4TjdubVJZ?=
 =?utf-8?B?Ullnem13NTBPSHNrYzJpK0lOQlZ0OFNHVUpmSzdMRSttNU5yTEdMTDMzOEsx?=
 =?utf-8?B?M3BWUXlUMCtuUW91Nk80b3VBS1QvZXNEQ2wramRlT2RZUCtWNk1Id2dkT2lC?=
 =?utf-8?B?cStDNUJ6eFZjWkUrNnRaUXg5aFJzekZwRmtFMkN4cExZT3ZhMFplUWM1U2s0?=
 =?utf-8?B?bTU4QmswM1B0K0U2dngyUld4M3Vsd29CTXJSalFPb2Noc3lYcElYcTFkeHNG?=
 =?utf-8?B?WjJsSzd6a1FWZEY2MjhMaTAycWppaExJSm5QODZzQU8xMnBYUEpaa2I2aHI2?=
 =?utf-8?B?ZVg2K1kwWWJFV3QwRERHSldyRnRqOUk2K3Bvdjg3QTFCYkVhRVA3MUNiZFp2?=
 =?utf-8?B?WktISjhvN0pMeTB3enNBUXR2YWxmdkY3aWNqamMrN1RUZ2lBRlB6c1hkN0dw?=
 =?utf-8?B?c0NXMUJsaTZsYWtUUlJWYVBEOC9hZHVJWVhxZCthZ016T25pNk1pL0RlZWhD?=
 =?utf-8?B?di9GeC8zbE9UZkNKUm90YXV0aVUySFJxVnV4N1VIYlBIbldQS3hiR3hzY0hY?=
 =?utf-8?B?Qk1uKzYweVhYY1Z5Rm50SXgxc1lkNUNYWlNiUVpCNWFpbTBrb3ZFV0s5bVRN?=
 =?utf-8?Q?xqSkhYqt2euIuQlLg00PFmbN1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfeff17-7380-4b08-d780-08dd0d229a68
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 07:27:22.6950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: imyTeEs0r84NpVzstVb1ndf3zid2HxsuDP2uyJbOfYTEmR3+Tea5ngYE+GIhZpLd19LsO2ez3nUURQU7nBnAYP+Ni/xK0EOrMM31HoPjoRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7202
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

VW5pbnRlbnRpb25hbGx5IGRyb3BwZWQgUGV0ZXIgZnJvbSBwcmV2aW91cyBlbWFpbCwgc29ycnkg
8J+Yig0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE11c2lhbCwgRXdl
bGluYQ0KU2VudDogTW9uZGF5LCBOb3ZlbWJlciAyNSwgMjAyNCA4OjIwIEFNDQpUbzogaTkxNS1j
aS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBJbGxpcGlsbGksIFRlamFzcmVlWCA8dGVqYXNyZWV4LmlsbGlwaWxsaUBpbnRlbC5jb20+
DQpTdWJqZWN0OiBSRTog4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGlndC1ydW5uZXIgZmFj
dCBjaGVja2luZyAocmV2OCkNCg0KWWVzLCB3ZSByZWNlaXZlZCB5b3VyIGVtYWlsLg0KDQpASWxs
aXBpbGxpLCBUZWphc3JlZVggd2hlbiB5b3Ugd2lsbCBiZSBhYmxlIHRvIHJldmlldyBpdD8NCg0K
UmVnYXJkcywNCkV3ZWxpbmENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5
MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+
IE9uIEJlaGFsZiBPZiBQZXRlciBTZW5uYSBUc2NodWRpbg0KU2VudDogTW9uZGF5LCBOb3ZlbWJl
ciAyNSwgMjAyNCA4OjE1IEFNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEk5
MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTog4pyXIFhlLkNJ
LkZ1bGw6IGZhaWx1cmUgZm9yIGlndC1ydW5uZXIgZmFjdCBjaGVja2luZyAocmV2OCkNCg0KDQpE
ZWFyIEk5MTUsDQoNCkNhbiB5b3UgY29uZmlybSB5b3UgcmVjZWl2ZWQgbXkgcmVwbHkgdG8gdGhp
cyBlbWFpbCBvbiBGcmlkYXk/DQoNCk9uIDIyLjExLjIwMjQgMDk6MTEsIFBhdGNod29yayB3cm90
ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogaWd0LXJ1bm5lciBmYWN0
IGNoZWNraW5nIChyZXY4KQ0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvMTQwODQxLw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkg
PT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gWEVJR1RfODEyMV9mdWxsIC0+IFhF
SUdUUFdfMTIxNjNfZnVsbCANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJ
TFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIFhFSUdU
UFdfMTIxNjNfZnVsbCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxs
eS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3Ro
aW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIFhFSUdUUFdfMTIx
NjNfZnVsbCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3
IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0K
PiANCj4gICANCj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDQgLT4gNCkNCj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIE5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGlu
ZyBob3N0cw0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0t
DQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVu
IGludHJvZHVjZWQgaW4gWEVJR1RQV18xMjE2M19mdWxsOg0KPiANCj4gIyMjIElHVCBjaGFuZ2Vz
ICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0
QGttc19iaWdfZmJANC10aWxlZC1hZGRmYjoNCj4gICAgIC0gc2hhcmQtbG5sOiAgICAgICAgICBb
UEFTU11bMV0gLT4gW0RNRVNHLVdBUk5dWzJdDQo+ICAgIFsxXTogaHR0cHM6Ly9pbnRlbC1nZngt
Y2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdUXzgxMjEvc2hhcmQtbG5sLTYvaWd0QGttc19iaWdf
ZmJANC10aWxlZC1hZGRmYi5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzEyMTYzL3NoYXJkLWxubC0xL2lndEANCj4ga21z
X2JpZ19mYkA0LXRpbGVkLWFkZGZiLmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX2NvbG9yQGN0bS1t
YXg6DQo+ICAgICAtIHNoYXJkLWJtZzogICAgICAgICAgW1BBU1NdWzNdIC0+IFtETUVTRy1XQVJO
XVs0XSArNCBvdGhlciB0ZXN0cyBkbWVzZy13YXJuDQo+ICAgIFszXTogaHR0cHM6Ly9pbnRlbC1n
ZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdUXzgxMjEvc2hhcmQtYm1nLTgvaWd0QGttc19j
b2xvckBjdG0tbWF4Lmh0bWwNCj4gICAgWzRdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvaW50ZWwteGUvSUdUUFdfMTIxNjMvc2hhcmQtYm1nLTEvaWd0QA0KPiBrbXNfY29s
b3JAY3RtLW1heC5odG1sDQo+IA0KPiAgICogaWd0QGttc19mbGlwQDJ4LWRwbXMtdnMtdmJsYW5r
LXJhY2VAYWItZHAyLWhkbWktYTM6DQo+ICAgICAtIHNoYXJkLWJtZzogICAgICAgICAgW1BBU1Nd
WzVdIC0+IFtJTkNPTVBMRVRFXVs2XQ0KPiAgICBbNV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2ludGVsLXhlL0lHVF84MTIxL3NoYXJkLWJtZy0xL2lndEBrbXNfZmxpcEAyeC1k
cG1zLXZzLXZibGFuay1yYWNlQGFiLWRwMi1oZG1pLWEzLmh0bWwNCj4gICAgWzZdOiANCj4gaHR0
cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdUUFdfMTIxNjMvc2hhcmQt
Ym1nLTQvaWd0QA0KPiBrbXNfZmxpcEAyeC1kcG1zLXZzLXZibGFuay1yYWNlQGFiLWRwMi1oZG1p
LWEzLmh0bWwNCj4gDQo+ICAgKiBpZ3RAeGVfZmF1bHRfaW5qZWN0aW9uQHZtLWJpbmQtZmFpbC14
ZV9wdF91cGRhdGVfb3BzX3ByZXBhcmU6DQo+ICAgICAtIHNoYXJkLWJtZzogICAgICAgICAgTk9U
UlVOIC0+IFtGQUlMXVs3XQ0KPiAgICBbN106IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMjE2My9zaGFyZC1ibWctNC9pZ3RADQo+IHhlX2ZhdWx0
X2luamVjdGlvbkB2bS1iaW5kLWZhaWwteGVfcHRfdXBkYXRlX29wc19wcmVwYXJlLmh0bWwNCg0K
VGhlc2UgYXJlIHVucmVsYXRlZCB0byBteSBjaGFuZ2UuIFBsZWFzZSBmaXggYW5kIHJlLXJ1bi4N
Cg0KPiANCj4gICANCj4gIyMjIyBXYXJuaW5ncyAjIyMjDQo+IA0KPiAgICogaWd0QGNvcmVfaG90
dW5wbHVnQHVuYmluZC1yZWJpbmQ6DQo+ICAgICAtIHNoYXJkLWJtZzogICAgICAgICAgW0lOQ09N
UExFVEVdWzhdIChbSW50ZWwgWEUjMzQ2OF0pIC0+IFtJTkNPTVBMRVRFXVs5XQ0KPiAgICBbOF06
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVF84MTIxL3NoYXJk
LWJtZy00L2lndEBjb3JlX2hvdHVucGx1Z0B1bmJpbmQtcmViaW5kLmh0bWwNCj4gICAgWzldOiAN
Cj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdUUFdfMTIxNjMv
c2hhcmQtYm1nLTIvaWd0QA0KPiBjb3JlX2hvdHVucGx1Z0B1bmJpbmQtcmViaW5kLmh0bWwNCj4g
DQo+ICAgKiBpZ3RAeGVfZXhlY190aHJlYWRzQHRocmVhZHMtY20tc2hhcmVkLXZtLXVzZXJwdHIt
aW52YWxpZGF0ZToNCj4gICAgIC0gc2hhcmQtYm1nOiAgICAgICAgICBbRE1FU0ctV0FSTl1bMTBd
IChbSW50ZWwgWEUjMzM3MV0gLyBbSW50ZWwgWEUjMzUxNV0pIC0+IFtETUVTRy1XQVJOXVsxMV0N
Cj4gICAgWzEwXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdU
XzgxMjEvc2hhcmQtYm1nLTQvaWd0QHhlX2V4ZWNfdGhyZWFkc0B0aHJlYWRzLWNtLXNoYXJlZC12
bS11c2VycHRyLWludmFsaWRhdGUuaHRtbA0KPiAgICBbMTFdOiANCj4gaHR0cHM6Ly9pbnRlbC1n
ZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdUUFdfMTIxNjMvc2hhcmQtYm1nLTEvaWd0QA0K
PiB4ZV9leGVjX3RocmVhZHNAdGhyZWFkcy1jbS1zaGFyZWQtdm0tdXNlcnB0ci1pbnZhbGlkYXRl
Lmh0bWwNCj4gDQo+ICAgKiBpZ3RAeGVfZmF1bHRfaW5qZWN0aW9uQHZtLWJpbmQtZmFpbC14ZV92
bWFfb3BzX2FsbG9jOg0KPiAgICAgLSBzaGFyZC1ibWc6ICAgICAgICAgIFtETUVTRy1GQUlMXVsx
Ml0gKFtJbnRlbCBYRSMzNDY3XSAvIFtJbnRlbCBYRSMzNDY4XSkgLT4gW0ZBSUxdWzEzXQ0KPiAg
ICBbMTJdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RfODEy
MS9zaGFyZC1ibWctNC9pZ3RAeGVfZmF1bHRfaW5qZWN0aW9uQHZtLWJpbmQtZmFpbC14ZV92bWFf
b3BzX2FsbG9jLmh0bWwNCj4gICAgWzEzXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9y
Zy90cmVlL2ludGVsLXhlL0lHVFBXXzEyMTYzL3NoYXJkLWJtZy0xL2lndEANCj4geGVfZmF1bHRf
aW5qZWN0aW9uQHZtLWJpbmQtZmFpbC14ZV92bWFfb3BzX2FsbG9jLmh0bWwNCj4gDQo+ICAgKiBp
Z3RAeGVfbW9kdWxlX2xvYWRAcmVsb2FkOg0KPiAgICAgLSBzaGFyZC1ibWc6ICAgICAgICAgIFtE
TUVTRy1XQVJOXVsxNF0gKFtJbnRlbCBYRSMzNDY3XSkgLT4gW0RNRVNHLVdBUk5dWzE1XQ0KPiAg
ICBbMTRdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RfODEy
MS9zaGFyZC1ibWctOC9pZ3RAeGVfbW9kdWxlX2xvYWRAcmVsb2FkLmh0bWwNCj4gICAgWzE1XTog
DQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzEyMTYz
L3NoYXJkLWJtZy02L2lndEANCj4geGVfbW9kdWxlX2xvYWRAcmVsb2FkLmh0bWwNCj4gDQo+ICAg
KiBpZ3RAeGVfb2FAc3luY3MtdXNlcnB0ci13YWl0LWNmZzoNCj4gICAgIC0gc2hhcmQtZGcyLXNl
dDI6ICAgICBbU0tJUF1bMTZdIChbSW50ZWwgWEUjMTEzMF0pIC0+IFtTS0lQXVsxN10gKzcgb3Ro
ZXIgdGVzdHMgc2tpcA0KPiAgICBbMTZdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9pbnRlbC14ZS9JR1RfODEyMS9zaGFyZC1kZzItNDY2L2lndEB4ZV9vYUBzeW5jcy11c2VycHRy
LXdhaXQtY2ZnLmh0bWwNCj4gICAgWzE3XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9y
Zy90cmVlL2ludGVsLXhlL0lHVFBXXzEyMTYzL3NoYXJkLWRnMi00NjMvaWcNCj4gdEB4ZV9vYUBz
eW5jcy11c2VycHRyLXdhaXQtY2ZnLmh0bWwNCg0KVGhlc2UgYXJlIHVucmVsYXRlZCB0byBteSBj
aGFuZ2UuIFBsZWFzZSBmaXggYW5kIHJlLXJ1bi4NCg0KWy4uLl0NCg0KVGhhbmsgeW91LA0KDQpQ
ZXRlcg0K
