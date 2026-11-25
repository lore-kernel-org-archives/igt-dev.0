Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69FE606A330
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 09:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LOD/EVFv;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=E52ln02y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDDD10FAE8;
	Wed, 25 Nov 2026 09:44:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FAD10FAC5
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795599816; x=1827135816;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GKiNepgrmiJ19dGxkpibwa+IAluAdG3kn/lVqeQ5AVg=;
 b=LOD/EVFvOPVuGADCeDucNVN5hrw8uSvXyo/n1Tp1eC+7GYJcL8ZQnwNn
 GhyDDhbnlPBLqcUWuZRWOukqiXiZc/C1U9Rr4y2v8kHWfCZBDNBirduhU
 qxgP5LN3J+6O9OIs5EPGKBD7cWuOcYSN+bWFhlTbumGNW/tW4qBjUJsxS
 cDw5cP+cAm9Ai162CMtCQPPa5aWq/voOHvjA5ahleygIVDyd1uPxSioDK
 wlwylM+euNPA/hJZwRZRT98PxzPk5dVDewY7cQUqNR7J08o7zV67XBVH2
 4HozfMh4WIS14akBTF/12YdZjl9g3CHjHoZZEO48K9LxCBo/4iCY+GQC/ g==;
X-CSE-ConnectionGUID: RjhRz0O7Sum3gDNs7r+Scg==
X-CSE-MsgGUID: u9IgKd98Tk2S9UCYxp70rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4328629"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4328629"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:38:25 -0800
X-CSE-ConnectionGUID: 1FYUhjfUTOCPsHwy6uvrBw==
X-CSE-MsgGUID: RM8j8qezQcaNIH+dKFdmFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12129963"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:38:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 01:38:24 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 01:38:24 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.18)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 01:38:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaOTkt1HrFsikzz61jxxEw99BeeP8VQZUDJpMywxoTJjehdFx2ZObtxl+U3Ir/+6wJ3CU/gFffDB3nJj2sWyYgnvkABmw4F3xqyw16lGZNQqKsCSJGnOd81SX+2i8Goh/Hv4GeNePKz7V+kukY8su3jL0zWjw2ne8xHG7EbBIW1xYF11YabgtvTA+zGnz6Elb63xN24qMvHiMyKkQWrGS/ti4ar6O/ntUbIndLDLPbXLF4Us65V9PRRSd5fJWvWLsVOl5rHHiXVqr1+9FWr7mO+ysj8dZahPE9OLceF659pGDG2CgN0k3QPIfQQ4z1Aure3m6C1xUxp0TEvtJM0upA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKiNepgrmiJ19dGxkpibwa+IAluAdG3kn/lVqeQ5AVg=;
 b=O77JSYL79G1DLDWRZXnLpDoeGUhrrPgN4ujQrPdvR28NYp47ldi+szRzCD7M/a8yb5rr6tzvBDvk1bGlGQkiznwQprxVYG/9MZAqr12IVQKmWworxQ94r5tNjaXio27Np3lCRE75HuKEWsxvO19EmWemhCGN7C4t7vqLwtin8+7fzYe7KNbBzFGXtxDgwt8ju3wmM4cGrKJ4BA4bXOQ0h5AtrLxIDdqz1k0yZ/5M3TttvfsH+ZCJEungexq74zXuyfEjnsUPKs6nzLyUxubKEnucGQy+0yrXn2SCw7fhYdVzqNepkLg5piQhIDAGsk1PYRIz7t7oVT9bgioMSBKyiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKiNepgrmiJ19dGxkpibwa+IAluAdG3kn/lVqeQ5AVg=;
 b=E52ln02yEjNGGkl0ggxoP+Y9E1C95G8LJ8NkTt7ElXHjDp4i2yFeij7YI8/YLmbgGKSg62lhrui5h0SjyALd1wnqcDtcsRoyGg3GMn4CHeWtW2S7crXGOMvcCCrqaFSrmXL8KK730kBT6RB0atQIMdwSKKCDH9IDSkJNMj97Bsg=
Received: from DM4PR11MB5325.namprd11.prod.outlook.com (2603:10b6:5:390::19)
 by DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Wed, 25 Nov 2026 09:38:21 +0000
Received: from DM4PR11MB5325.namprd11.prod.outlook.com
 ([fe80::a1ba:c191:333b:b6a0]) by DM4PR11MB5325.namprd11.prod.outlook.com
 ([fe80::a1ba:c191:333b:b6a0%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 09:38:21 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Grzelak, Michal"
 <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to first
 and last CRTC
Thread-Topic: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to first
 and last CRTC
Thread-Index: AQHde90IJV0JMfqNBU6Ofj53XkL5eLc9DuKAgAF4rsA=
Date: Wed, 25 Nov 2026 09:38:21 +0000
Message-ID: <DM4PR11MB5325E141D8DBB58BFB2AF7C390432@DM4PR11MB5325.namprd11.prod.outlook.com>
References: <20261124062725.952438-1-jeevan.b@intel.com>
 <6676344cae734db2fddb0783bdeb9712a4d0f963@intel.com>
In-Reply-To: <6676344cae734db2fddb0783bdeb9712a4d0f963@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5325:EE_|DM4PR11MB6504:EE_
x-ms-office365-filtering-correlation-id: 5e553832-5b41-4a9a-2230-08df4ad7d807
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|23010399003|366016|18002099003|22082099003|3023799007|56012099006|261026121527099003|4143699003|261102123227099003|261028144727099003|261021121427099003|261009223027099003|261022105027099003|261026140227099003|11063799006|38070700021|10067099003;
x-microsoft-antispam-message-info: pVDil0heHIuBhX9veKktiUVqnWZaNV0a+C1smXxazJlf+I75ZbCnxDQJ6x3vPCwz30pypP5uuM1eQB58SvrBTqtFEQ1TFiJQRt+ZZ1jBM+nubRll3TOHnOc8dM+Nq5f7f10Qj3EGtVixcZZzN7lHjvYoVNrJg/oNPnVXALDQUyD6ZdQYfDrRMF+91AByVWysuA/dXNNxhJkqmI3NoJn+XlDL6x9lXoZofKTnN7lWhdpSmXvvxa13nF5bz5KfHnduvN1522obOgfo+ZkeRnFcNBy/CK3yXPbq9wSxy8bMswp9VmIrA5rPeouUC4EtP7lDD4sqH2pYUGJgRU+37bOWG/iH7zsf56Rgri4Rc7k7/hXrUJevOBgEs2H9AGVOhFWXfskFpRQhJhJdfZ6uZWvJBoNmqbQqFYaMZ/QoOtEwl5rNVX/GOT0sduEYiM7T3TDL+chYApnPqq8PZrXBQSR/eVqBT1PxVDwdph5q+CwzY8PN7OZhuY33Bf96PzOfjxXUVMZTKH31lST496y8W3xhoHFNOU7EabsXaFeAiB1e6tRQyNSbWWA0SG+3XZ92H78ptAqhzjFP//Wh+kePqPYlfc0cyx8Svv2VkXtqc2P3ze+WudTP5cd2EDLJs/U3vc6n5zvXZMnmBeUedXvWy/zbM1Ani7171Ys11yTLB0NwRQPNobloRgOTEPHnhb8m86hBkdYcTHgztKx7m2Q5LQ6eUMZG+xLmS3gVYbWHCvX5pXY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5325.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(261026121527099003)(4143699003)(261102123227099003)(261028144727099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026140227099003)(11063799006)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXFVanFlcDNBSzFLMmVCZ3hVYm82emtxdU1Eb2NXckFNWTEyd1dhMWR1TUJl?=
 =?utf-8?B?VzJRZnJLUDFoM1kyRzNIUDA1RlJyanIyaUlYUEV5MGtFVVBwazdTWjB1NmJY?=
 =?utf-8?B?aE4yY0xRbWUyK1p2UElTWU54amZXR3dKSG44cCtUL0QwQWZvejFnWFhKWWFK?=
 =?utf-8?B?NkZVTm1aa1BQL2xucVdEU2RHNFlBemFiVGw3MDBuSkw1bHczbnJLaVF5Y3BW?=
 =?utf-8?B?b1NUbS9ONjJxTHMrNTlkd1c4Znl2SHI5OWgycklQdndyL0hJY3ZXWTBqQ1gx?=
 =?utf-8?B?NCtJWXdzajNkbUp4RElLbnEzem04ME1wK1U5UUUrUGVBVllKRE1oWW82b1hR?=
 =?utf-8?B?ZXFiWTFqSmFyZWxYemhTZEhxQW9ZOGN3MzVKcjZXNVNMUFFlNUZYbE1NWFdr?=
 =?utf-8?B?Q2RzUi9VMUE3SFRKSFBPV3ArcFRVU0J0YXp3ODMvVW90alJUdGZhT2hsNkZi?=
 =?utf-8?B?YWVpM1ZMdUdlNW9JQnlwdUFNRmJ2S3B5S2UzbFkxMmNmbTNZSFJMNXMxZW1G?=
 =?utf-8?B?NHNEMC8xS1hOZ3hKbVFqK0tvelNnY2MxK21tb1RoR3YyU01uQkVCcGhmTC9i?=
 =?utf-8?B?YkQvelRuMjBUQm5XY0VTYys5b2l5UUNZNFlIb1RoUVhMYkpOYmZHQkZJNWtI?=
 =?utf-8?B?RHNYQ3FkandaeTBJck81Qll5TVNwbGZka2FvYUdFY25xNG0wS0JxR0Q4eTIy?=
 =?utf-8?B?V1VpMkRkMnMrY1RsOTQ4b1VQdC8wekt0YXJLZWRDdThWV29Ec2gxNWtoTXRM?=
 =?utf-8?B?QlNBc1QzamFPQkRCQXFSVkRucWxPRlBNNWFQdTRabDlSblV5RnBRcG4yS2pJ?=
 =?utf-8?B?bTFxa3JUSk9PV0J5QmwzdVpRRkNFbytBRWNSSm84bWNETHRRMDdLMkk5SUtE?=
 =?utf-8?B?SGYrMkcrV3dZcU5NN0R2OS9XMUFoQUFIZ2dnREg1cUNxbGhiQzB2MXVDRHZh?=
 =?utf-8?B?UkdLNUQyUjJiakk1VU5yelBhdFdXNUlJaTJ0QnNzWVhUY2dzcWpxMmZhY2ZQ?=
 =?utf-8?B?Zi9HSHBhWU9RODMwQWNpNUdnKzVNRFBHSVlyWUVMbzJNS0M2RDE3L3h2OXJN?=
 =?utf-8?B?aEJVN3RaOEUrUmJrdnBIenp4OEtVZ3RtOUkyQVdKQ3lwL3dUd3Azc3JsQm1w?=
 =?utf-8?B?cVNKRGt6WE9Da3Vrcnl4cXFGVmdRYStzcmdEekZlQmo2TUZhblA1MkY0TUp0?=
 =?utf-8?B?NGVXYXdRYVQxNUUzamFSSFdORmtRUUd1Vzl2aWVxN0pPQVZ5dEpyUXRKbmtV?=
 =?utf-8?B?MWcwZTJVWXNsOTRuclp0eW5GamE0RE9jSDlRbE81RzgyVStucUV2aVZIRmFO?=
 =?utf-8?B?Z24wT0xRY0lMSG1uc05xUjNoY2pQaHVXTmMwakMyQStxOHNoOG5hRE9Ib2lM?=
 =?utf-8?B?am1KOUtOQ1pTSVVjMFZSVEJJNUZlM1hGd0FKNnFMSDVNa0NlYWFMVXFLVXJw?=
 =?utf-8?B?dmExL3Brclk2ZEJuL1JtcWlEanVYTFVDbTZlYytXbVRERUJLYlFHak9CMTVt?=
 =?utf-8?B?NWt5QjJUZFVxMGIvSzQvWUxDdWpNZWw5SUVWT1Y3d0RpZmFXZ1hjenYvVDlN?=
 =?utf-8?B?Y05Ub0JTNnpIK3Y3blByRWJmYzJjMWpaOVZXYWhrTS9DN0RnaHVhUEpMS1dU?=
 =?utf-8?B?eERIaWFkaVN3NVJRMEczWnRFdlJqd2MzaG1Ea3lnU3Q0VHEyMnBLbWdNbFVw?=
 =?utf-8?B?K3hEcFZibjVjamtObWZ2Q2FWNTBPb0M1Qk93VGpLS2w1a0F4ZHVlODhWVklW?=
 =?utf-8?B?RDU3bUdNRkc5d0IvVTZSUEVPSlptVGFEMFduQVhnamhVb3NGbGNpang5OVg3?=
 =?utf-8?B?eGxBbnhRUnJUcUE1ZnFvc2E2K1MvTlFSNFdrSE43OEtXWUFKVkNUc2V6Y1Fh?=
 =?utf-8?B?V1EvZFprbGEwSFkvN09SaWpuVVV3aE0wYzFDbDBkeXc3cnEzRi8yaHcxZHI0?=
 =?utf-8?B?UkJ4Tld6NFdZN1ViTkFyK1RJMlB2M3V3bnJxUnNUQjFYTjBoZkdCTkpuRVJX?=
 =?utf-8?B?N1dXMmpOWEIxR2dGbTd5UGUzTnBlbmZDcDM5KzBNRHFyTUh0ZkRvU25YQnVX?=
 =?utf-8?B?WjR1ZXlCZHhYd2hKU0h2WDhVcmxiUkJSTm85Y3BSdjNWdnRZdW1Mbld4QkNq?=
 =?utf-8?B?N2N2aEpVS01HQmlnY3NrS0pDcnM2WGdmMFhwZXNmUU1KWUFCclVXQ1RlNTNO?=
 =?utf-8?B?RjlSMFVWWEFrbTFiVVFzUVdKZEpKSEVCbkF5RVVhTlFINEx4T1NRSVBJVDB6?=
 =?utf-8?B?SyszZ0FrcHUzVVdpMU5aZ0syckJ4MXNqL2I5ZzlTajR1eUd0MEl1dWc4aTIy?=
 =?utf-8?B?YnphcTRPN0RSY3F6U3I3cWFoNmk0b0RpanBFMU5ZR0d0eDZvM2NWRDg3VEFh?=
 =?utf-8?Q?jMJIOQcyatCNIQbhigop6W2Wl3xr2isn6C8h7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: m6EHx1W+r4gLoal2UEE4hOID3kkra3vRN5aErH1/QH+yR1pXI5UWUsrs+GuLXsWhfyeYUaYMGoKWb3x+uSU8VToI6BgmpTkZ39C9phrrh34CitW9BrR5VHfCkMOgBSd53QwMUpVDYMXfNQngHcwHEL/AWwGLL0lk4RaxyJReWItabR4GcqOJbx411RGja1dGtuzEDKJDEEGF1hHsn7mK/o6PS2SHFSYKZ/+bAtzdaTXIEvM9y/etWVpZWOTUpBERkQgpU6WHCoOUJ9wmB5x27KNqZAfoWR53kC/0LiO44e+wfobah9OajtHF3SVnRd5qYWzG456zHCqXjaZpeCG0EQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5325.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e553832-5b41-4a9a-2230-08df4ad7d807
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 09:38:21.2151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDijM4yHkvNLBvN7iJKROlRsc7tcrkR90aeCG2bQPRwrzqqBfhfQnniyxf2EeJSwT4tKbVnO/jtzZsF8nHd1+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWt1bGEsIEphbmkgPGphbmku
bmlrdWxhQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMjQsIDIwMjYgNDoz
MyBQTQ0KPiBUbzogQiwgSmVldmFuIDxqZWV2YW4uYkBpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQiBTLCBLYXJ0aGlrIDxrYXJ0aGlrLmIuc0BpbnRlbC5j
b20+OyBCLCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT47DQo+IEdyemVsYWssIE1pY2hhbCA8
bWljaGFsLmdyemVsYWtAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10XSB0
ZXN0cy9rbXNfcGxhbmVfY3Vyc29yOiBsaW1pdCBzaW11bGF0aW9uIHRvIGZpcnN0IGFuZA0KPiBs
YXN0IENSVEMNCj4gDQo+IE9uIFR1ZSwgMjQgTm92IDIwMjYsIEplZXZhbiBCIDxqZWV2YW4uYkBp
bnRlbC5jb20+IHdyb3RlOg0KPiA+IFJ1bm5pbmcgb24gZXZlcnkgQ1JUQyBtYWtlcyB0aGUgdGVz
dCBoaXQgdGhlIHRpbWVvdXQgb24gc2ltdWxhdGlvbi4NCj4gPiBSZXN0cmljdCBpdCB0byB0aGUg
Zmlyc3QgYW5kIGxhc3QgdXNhYmxlIENSVEMgd2hlbiBydW5uaW5nIGluDQo+ID4gc2ltdWxhdGlv
biwgd2hpY2gga2VlcHMgY292ZXJhZ2Ugd2hpbGUgYXZvaWRpbmcgdGhlIHRpbWVvdXQuDQo+ID4N
Cj4gPiBNb3ZlIHRoZSBwZXItcGlwZSB2YWxpZGl0eSBjaGVjayBhbmQgdGhlIHBlci1waXBlIHN1
YnRlc3QgYm9keSBpbnRvDQo+ID4gcGlwZV9vdXRwdXRfdmFsaWQoKSBhbmQgcnVuX3BpcGUoKSBz
byBib3RoIHRoZSByZWd1bGFyIGFuZCB0aGUNCj4gPiBzaW11bGF0aW9uIHBhdGhzIGNhbiBzaGFy
ZSB0aGVtLg0KPiANCj4gSSB0aGluayB5b3UncmUgb3ZlcmNvbXBsaWNhdGluZyB0aGluZ3MgZm9y
IHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBzaW1wbGlmaWVkLg0KPiANCj4gSSBkb24ndCBrbm93
IHdoYXQgdG8gc2F5LiBJIGRvbid0IHRoaW5rIG15IHJldmlldyBjb21tZW50cyBhcmUgYmVpbmcN
Cj4gdW5kZXJzdG9vZC4NCj4gDQo+IEJlbG93IGlzIHdoYXQgSSBtZWFudCwgbWF5YmUgQyBpcyB0
aGUgbGluZ3VhIGZyYW5jYS4gVXNlIHRoZSBmaXJzdCBhbmQgbGFzdA0KPiBwaXBlcyBvbiBzaW11
bGF0aW9uLCBhbGwgb3RoZXJ3aXNlLiBBbmQga2VlcCB0aGUgc2ltdWxhdGlvbiBjb25kaXRpb25h
bCBzdHVmZg0KPiBtb3N0bHkgb3V0IG9mIHRoZSBtYWluIHRlc3QgbG9vcHMsIGJlY2F1c2UgaXQg
Y29tcGxpY2F0ZXMgZXZlcnl0aGluZy4NCj4gDQo+IEFsc28gQ2M6IE1pY2hhxYIsIHRoaXMgaXMg
d2hhdCBJIG1lYW50IGluIG15IGNvbW1lbnRzIHRvIHlvdSB0b28uIFRoZXJlJ3Mgbm8NCj4gbmVl
ZCBmb3IgdGhvc2UgY29tcGxpY2F0ZWQgYXJyYXlzIHdpdGggYm9vbHMuDQo+IA0KPiANCj4gQlIs
DQo+IEphbmkuDQoNCkhpIEphbmksDQoNCiAgU29ycnkgZm9yIG1pc3JlYWRpbmcgeW91ciBlYXJs
aWVyIGNvbW1lbnRzLiBJIHdhcyB0cnlpbmcgc29tZSBvdmVybHkNCiAgY29tcGxpY2F0ZWQgc3R1
ZmYgYW5kIGdvdCBsb3N0IGluIG15IG93biB0aG91Z2h0cy4gVGhhbmtzIGZvciB0aGUgY29kZSwN
CiAgdGhhdCBtYWRlIGl0IGNsZWFyLiBUaGUgcGlwZV9vdXRwdXRfdmFsaWQoKS9ydW5fcGlwZSgp
IHNwbGl0IGFuZCB0aGUNCiAgc2VwYXJhdGUgc2ltdWxhdGlvbiBwYXRoIHdlcmVuJ3QgbmVlZGVk
IGhlcmUuDQoNCiAgdjUgdXNlcyB5b3VyIGFwcHJvYWNoOiBhIENSVEMgaW5kZXggbWFzayBjb21w
dXRlZCBvbmNlIGluIHRoZSBmaXh0dXJlLA0KICBhbmQgdGhlIGV4aXN0aW5nIGxvb3Agc2tpcHMg
Q1JUQ3Mgbm90IGluIGl0Lg0KDQogIEJSLA0KICBKZWV2YW4NCg0KPiANCj4gDQo+IFBTLiBJdCdz
IHVudGVzdGVkLg0KPiANCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcGxhbmVfY3Vyc29y
LmMgYi90ZXN0cy9rbXNfcGxhbmVfY3Vyc29yLmMgaW5kZXgNCj4gNGI2OWYxYTE3ZTI0Li5hMTEx
MTI0NWZiMGQgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19wbGFuZV9jdXJzb3IuYw0KPiArKysg
Yi90ZXN0cy9rbXNfcGxhbmVfY3Vyc29yLmMNCj4gQEAgLTI4NCw2ICsyODQsMjcgQEAgc3RhdGlj
IHZvaWQgdGVzdF9jdXJzb3IoZGF0YV90ICpkYXRhLCBpbnQgc2l6ZSwNCj4gdW5zaWduZWQgaW50
IGZsYWdzKQ0KPiAgICAgICAgIHRlc3RfY3Vyc29yX3Nwb3RzKGRhdGEsIHNpemUsIGZsYWdzKTsg
IH0NCj4gDQo+ICtzdGF0aWMgdWludDMyX3QgZ2V0X2NydGNfaW5kZXhfbWFzayhpZ3RfZGlzcGxh
eV90ICpkaXNwbGF5KSB7DQo+ICsgICAgICAgaWd0X2NydGNfdCAqY3J0YywgKmZpcnN0X3BpcGVf
Y3J0YyA9IE5VTEwsICpsYXN0X3BpcGVfY3J0YyA9IE5VTEw7DQo+ICsgICAgICAgX19tYXliZV91
bnVzZWQgaWd0X291dHB1dF90ICpvdXRwdXQ7DQo+ICsgICAgICAgdWludDMyX3QgY3J0Y19pbmRl
eF9tYXNrID0gMDsNCj4gKw0KPiArICAgICAgIGZvcl9lYWNoX2NydGNfd2l0aF9zaW5nbGVfb3V0
cHV0KGRpc3BsYXksIGNydGMsIG91dHB1dCkgew0KPiArICAgICAgICAgICAgICAgaWYgKCFmaXJz
dF9waXBlX2NydGMgfHwgY3J0Yy0+aGFyZHdhcmVfcGlwZSA8IGZpcnN0X3BpcGVfY3J0Yy0NCj4g
PmhhcmR3YXJlX3BpcGUpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZpcnN0X3BpcGVfY3J0
YyA9IGNydGM7DQo+ICsgICAgICAgICAgICAgICBpZiAoIWxhc3RfcGlwZV9jcnRjIHx8IGNydGMt
PmhhcmR3YXJlX3BpcGUgPiBsYXN0X3BpcGVfY3J0Yy0NCj4gPmhhcmR3YXJlX3BpcGUpDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGxhc3RfcGlwZV9jcnRjID0gY3J0YzsNCj4gKyAgICAgICAg
ICAgICAgIGNydGNfaW5kZXhfbWFzayB8PSAxIDw8IGNydGMtPmNydGNfaW5kZXg7DQo+ICsgICAg
ICAgfQ0KPiArDQo+ICsgICAgICAgaWYgKGlndF9ydW5faW5fc2ltdWxhdGlvbigpICYmIGZpcnN0
X3BpcGVfY3J0YyAmJiBsYXN0X3BpcGVfY3J0YykNCj4gKyAgICAgICAgICAgICAgIGNydGNfaW5k
ZXhfbWFzayA9IDEgPDwgZmlyc3RfcGlwZV9jcnRjLT5jcnRjX2luZGV4IHwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgMSA8PCBsYXN0X3BpcGVfY3J0Yy0+Y3J0Y19pbmRleDsNCj4gKw0KPiAr
ICAgICAgIHJldHVybiBjcnRjX2luZGV4X21hc2s7DQo+ICt9DQo+ICsNCj4gIGludCBpZ3RfbWFp
bigpDQo+ICB7DQo+ICAgICAgICAgc3RhdGljIGNvbnN0IGludCBjdXJzb3Jfc2l6ZXNbXSA9IHsg
NjQsIDEyOCwgMjU2IH07IEBAIC0yOTEsNiArMzEyLDcgQEANCj4gaW50IGlndF9tYWluKCkNCj4g
ICAgICAgICBpZ3RfY3J0Y190ICpjcnRjOw0KPiAgICAgICAgIGlndF9vdXRwdXRfdCAqb3V0cHV0
Ow0KPiAgICAgICAgIGlndF9kaXNwbGF5X3QgKmRpc3BsYXk7DQo+ICsgICAgICAgdWludDMyX3Qg
Y3J0Y19pbmRleF9tYXNrID0gMDsNCj4gICAgICAgICBpbnQgaSwgajsNCj4gICAgICAgICBzdHJ1
Y3Qgew0KPiAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZTsNCj4gQEAgLTMyMiw2ICsz
NDQsOCBAQCBpbnQgaWd0X21haW4oKQ0KPiAgICAgICAgICAgICAgICAgaWd0X2Fzc2VydChyZXQg
PT0gMCB8fCBlcnJubyA9PSBFSU5WQUwpOw0KPiANCj4gICAgICAgICAgICAgICAgIGttc3Rlc3Rf
c2V0X3Z0X2dyYXBoaWNzX21vZGUoKTsNCj4gKw0KPiArICAgICAgICAgICAgICAgY3J0Y19pbmRl
eF9tYXNrID0gZ2V0X2NydGNfaW5kZXhfbWFzaygmZGF0YS5kaXNwbGF5KTsNCj4gICAgICAgICB9
DQo+IA0KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHRlc3RzKTsgaSsrKSB7
IEBAIC0zMjksNiArMzUzLDkgQEAgaW50DQo+IGlndF9tYWluKCkNCj4gICAgICAgICAgICAgICAg
IGlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pY19mKCIlcyIsIHRlc3RzW2ldLm5hbWUpIHsNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgZm9yX2VhY2hfY3J0Y193aXRoX3NpbmdsZV9vdXRwdXQoJmRh
dGEuZGlzcGxheSwgY3J0YywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgb3V0cHV0KSB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCEoY3J0Y19pbmRleF9tYXNrICYgKDEgPDwgY3J0Yy0+Y3J0Y19pbmRleCkp
KQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+
ICsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoKHRlc3RzW2ldLmZsYWdz
ICYgVEVTVF9PVkVSTEFZKSAmJg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAhaWd0X2NydGNfZ2V0X3BsYW5lX3R5cGUoY3J0YywNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9QTEFORV9UWVBFX09W
RVJMQVkpKQ0KPiANCj4gDQo+IC0tDQo+IEphbmkgTmlrdWxhLCBJbnRlbA0K
