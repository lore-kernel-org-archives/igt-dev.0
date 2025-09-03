Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F276CA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 08:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FF710E4E4;
	Wed,  3 Sep 2025 08:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gf5NNCE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C44C10E4E4
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756888132; x=1788424132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qYnOqwDpL3O2A8505rhM9CEdOMiMej7wKc5eAo6lWQg=;
 b=gf5NNCE01COgU8+WZQ8RSSdvbmNG1Ca1gHX647RnOv9Lm71aZ9o1RXSo
 Kke5fUuxfrrrt/vIuzpS4oBL4/TJgc0svit6plWbSfg7+ajPW8v26dQ55
 AGG8hkC101d9/NLlHcwRx+a/2m81IFFAiJiQtN7sWLImtbyueeBHVkvNs
 WTLdWxqc2MaUR8A7TUq+u6ssNRHXNGdyjLIdvBjSm2DZFCb6LvHXBjYjq
 +BoSTa8Qknq2MLYZ7oIw0syO+wZxyQ5szcgBp5W4EOuZPfeZJAumKsq1z
 ZNI7rOsTm9rgeA14rFL54QwHppfVXi2y7p7r7bYKi6yvwp02IG6JxO1VI w==;
X-CSE-ConnectionGUID: I0cO7a5kT6iJ6hQxd0NiMg==
X-CSE-MsgGUID: EIu3hi4pQC2VZuiP9k0yOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70623179"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="70623179"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 01:28:52 -0700
X-CSE-ConnectionGUID: TYaw6efeRc67UsIwUSEc+Q==
X-CSE-MsgGUID: yQlc5bJpR3elM+seqtpeQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171491403"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 01:28:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 01:28:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 01:28:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.56)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 01:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qt+YymNjXcj6MQvruGpFnn14del/YRmYfelqaBHUU0pXWPPqskKp/7/kAVimOZmIdDuPiEUjAXNtnebBT0Mbgj6e44f5JFKACW/tpHeGiLiQoOdw3em7dH+3PjJGY3mqQsrAdjbCT6m7K61D9JNpWyxjhJ6IJoEPVPVM43Ja79iSP4eT8p8fLR4jExUHsCtKG1VH+OKsBysBXvC1/ynQauFFwntUSmvDjPSZ3DogHiAMIG/2608TwZqnBOI/oKSQK4DJE5ADVRT/dybmnEh1sWEzTQk5udoiG54kesIrhC+GozA0rmbUiOgJcdkHbI/jyw3BYPQzMr0xgeSZoudJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYnOqwDpL3O2A8505rhM9CEdOMiMej7wKc5eAo6lWQg=;
 b=SlayzrijXu55Y6LAahbVqkiVB5jJ6kL3RTW1LjL4PLkTY8OOdXfGgc5uXENY2UGgBf80BtWpjtIJiZojz/R7ZKY2YMPSH+nr3WdvOrOiL+SyeAXmjJqQJKAdiYrXeMIwwV8cSU7MTEiNjEak8jKxq1g+saWBkKkvOqyNfmx7SVaqX79HG4XhcAAfszE2tib/zOB3uYtAutY+kkgAkmdknMcEMCrSOMvTCuD14GQSoouPK09rWUeC5PHq7s9/3/orufaVdMhQQPSAmheHGaGrGZtaUED6z3FTpgswLh7E8BPs++JCT3sDrX4JdaFSiJlw2rSt20eSTjMYklqlHbkTJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by PH0PR11MB7657.namprd11.prod.outlook.com (2603:10b6:510:26c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Wed, 3 Sep
 2025 08:28:44 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 08:28:43 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [v2 i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC
 modulo 4 restriction for ADL-P+
Thread-Topic: [v2 i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC
 modulo 4 restriction for ADL-P+
Thread-Index: AQHcHKcEwT6J3RPQO0una/OpLjeutrSBIDOA
Date: Wed, 3 Sep 2025 08:28:43 +0000
Message-ID: <3670bbf1433ee54b2917cad874f379fdb113970a.camel@intel.com>
References: <20250903075924.282801-1-uma.shankar@intel.com>
In-Reply-To: <20250903075924.282801-1-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|PH0PR11MB7657:EE_
x-ms-office365-filtering-correlation-id: e5ca9c7b-b30e-43d2-658a-08ddeac3e4fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UmNUZlpzcnFQVy9MaDJ4Zzhoc1FQNk5NOVNHcXNYWldDb1BZUmpVMDFWQ1U5?=
 =?utf-8?B?U2lTNXovZ2NQQ3owc3hBdHZ3akdLdUxNZkU3a2RTeTNMVlRZYW8zNkJrRVEv?=
 =?utf-8?B?V2xpWm1jM25hWUwyMkgzOXNkamdHZXVtVG5HZHhScENkbjk5ZWhxZG1MWjh0?=
 =?utf-8?B?Ulk5K3N4akNOcnozVy9yTzcyc3RlakxaT2UyU2pFSlJQYzNpOGQyWDBJWGZP?=
 =?utf-8?B?UUhKdktnb1R0SEFEcU5BM0w4ZC9kSEdKUGFkYUlLU2Vudkc4c0FHWi82VlIy?=
 =?utf-8?B?cThyVWwxbVJxVVNGUVFDNW5oSDdKdVVsU3JXNHlkamVENkVFTG5acU42OHp0?=
 =?utf-8?B?elNhTmVRRUFrRnczSDM4WC9sdEN4cVZwL2hhYitMRktkMTJScG9nTUlQZ0I0?=
 =?utf-8?B?VTlLWFhUdUtkTlB5dG5XOHcrdEdiYVV0d0dhRks4d2N4YWk1ZlM2SGR4SVp4?=
 =?utf-8?B?eE4relFPVDRSS0s2bkNNS0N0ME5iNVNjTlhOTk9WcGVOTkwzcWR6UkF0QkJ0?=
 =?utf-8?B?QnN2bHVkdWdZYjM4dFR1QU1EYzIrWis1OWZRR1BTSzRVMGJvanNEemhlY3Z6?=
 =?utf-8?B?OEQ5UGF1Mi9UR1Q2djM2QVpON1BGMTFrMFpSQUs2NWcwaGlNZ2htVlllUDlt?=
 =?utf-8?B?UVRKbk5Sa0VJZ2ROZHFnYUJlTXBTUHlpdUZkTWFJTVRwNHhja0Y5QTFmQU5P?=
 =?utf-8?B?L2JNTGJ3bjJKVFNUcExNZnBNWjVtZlFhaW1DRXpEL0U4Q3RmODVva0NCeXEv?=
 =?utf-8?B?djRLejl3S0tXQXBGU0NPRXh0TlZsQ3ZVekdUSldEckgrS1dMZ01IbHBrc2xC?=
 =?utf-8?B?NFpUcFZnankvZUVYaDVKMFVENFZOaEo5VG1HWDhYL3loRG5Sa1E4YU14NUtI?=
 =?utf-8?B?Wk42RHNzc294STJOUHUrUWZGYnV0S0VmY25Tb0UzdG1CSXNWeEJSVExPVnNl?=
 =?utf-8?B?MGtIR293UjdURldXUDF4SDU4TFFkSkxjNUlycWxJZGhvanZRMmNPd0JBSXZX?=
 =?utf-8?B?cy9DZkVIVWJnYU80ZlRlaloxSTZzZzlWUzZNMUlORHBuOFEzT21xRUxsWkVM?=
 =?utf-8?B?Z3oydXNDdVYrTEFvN0lOdWdVZ2NPMUVmcy9wWmJXQmNma1J3WWYrbEsvelBJ?=
 =?utf-8?B?K2EyY3c5WG5ENzRkK25xTHRlUUlPcUwvVnBEaHVBRmFlY2ZtTHk4bHRMa2pS?=
 =?utf-8?B?V0YxRkl0aDRMaXZTYTEyYVNGR1JoMDBnSVViZkxJSFd3cit4WEpUMjQzcUpJ?=
 =?utf-8?B?NnRpek5TbUFrY2dERkFobXo3LzZXaGVDNnFOQUlYLzN2bUFKZUJOSGVZb2VR?=
 =?utf-8?B?SUxoOGpPdTFLOTVRZHVGVjlmaktOVXBTRE4xOXVqVFNmc2thQjYzS2lVNm5F?=
 =?utf-8?B?Wnk4L1ZBeTJEMHZqU1RuNncyUkpWTmFzRkRZSkk3MDJNTG5IZVdXZTE0cWNY?=
 =?utf-8?B?WlBRUUplcGNna0ozbExrekNVcGtPNlJycUtJMkcwRHorSGl1THlwcVIvRFRZ?=
 =?utf-8?B?aTdZSGtGNXRFUGlMNjI5TVg3Z1p3dEZPUkpLTkczN1NGMlNieWVBVW1TL3Zj?=
 =?utf-8?B?ZTdXMzZTZm80Rmx4NTljVlgvcUN0VEE2N0JDSEhwc3pKTjN5WGdsRlNHTFRr?=
 =?utf-8?B?SEtQMTdMMGVDV0tONVdqayt6Wm5yczRjZzRmMFBNdUdTSUhKMDB2MlNUVDYr?=
 =?utf-8?B?aEludE1KNEY3aUJrMDN3eTBHNG1hbXNtbGVreWVDNGNjeHlKaVZSRUZjMGsx?=
 =?utf-8?B?RGl5WnpCR0RRWkh4aEVHL0tiSmdtODVMcGhFc1NQc0wvVVd3WnR5dDVMRGZr?=
 =?utf-8?B?S05wN2xYRjVRVFZRYWtWRHJlYndUU0tXTVMzaThuaUE5MXI3R1VmNWtyaDZx?=
 =?utf-8?B?NWNJaVp3UzNPQkRrVXFSaEZQSGFNZGdWT1p6UG9LeVJabXhkZEZUYkc1SFpP?=
 =?utf-8?B?YlZwdEV4aXR5bEk3bkdoY3NTMWxic0IzMHBMQ0FrdzZSRVhDb0t1aURaYmRm?=
 =?utf-8?B?S3R0dkZVSVZ3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGlmYmEzNzUvYkdLcDN2elRwT215bm9leGd5SHFRNlFoWVN5cEpIZDNNODEr?=
 =?utf-8?B?VVNMKzZORWZteWZHcVIxL1Y5b09NTEZLVGRKS3pTems5MkVUcktZUTBFNlZN?=
 =?utf-8?B?bGl3dTBoUTBxN0RsY1pKRk04bEg3REcwT0l6MlZqa1JITXhmZzEwRldvRHFw?=
 =?utf-8?B?Ry9vUVB3WGlMSlFDQm11RllPNmg5RHpzVU1ra3hwd05vSWZ1OVFObWJYNlA2?=
 =?utf-8?B?dHRDQnJ3ZE1CWnB4cVBDZWQxMDcweFRweDZFbkNmc2FVUE9kNnBYRkQrd3c0?=
 =?utf-8?B?bW1tcFd5aVVYZVFGcDV0ZmJEdlVJek5tM2tCNnQvVERZdWkwamQ0QjFOSmFF?=
 =?utf-8?B?a0RSdm5VRlhmUHpvWW1TNkk1b25UU2ZKS3pqYTdPUGE0WnBLL1V1MFloZnpN?=
 =?utf-8?B?dUQ0OGRJbFVZYno1SUkyamtERHVJbGo2dVQ4ZXdMWHJORnFXcFhFTythaUNV?=
 =?utf-8?B?aFBrTTRwc0VLWS9uOFBPSjVKTlR2TkdWbVFWVGE0Wk1nUmFXajFWc3ltMHln?=
 =?utf-8?B?R3JXZ2poOEROMW1ZVDBqQVdiWlNEbWQyVjcyanZRZ2twQVpWR2U0Q08xNlhS?=
 =?utf-8?B?Y0d6OFFDS2Exd1poRVVTV2c3M0tsRVVtUXp1Q3lCRGN5UlBQZ0gxT1NuSFBx?=
 =?utf-8?B?elRLUE5GdWp6TnRueGQ0ZTgvN1VCakJuTHlmZjNVODI4RGt3Z2FFYXo3cHgw?=
 =?utf-8?B?cE1HWU9LTEcxL3N4c3N2Um05VDZPZ2duNndIRURNc2dJdzFGaFBibTJmcGQy?=
 =?utf-8?B?R2hjTFdRbzRnTjJnaitLd295bEtTaWE2blRvS0l2Nk5pb3FXRU84d21vdnZM?=
 =?utf-8?B?UTdhN2V2TjJ2OHBJQUpoM2sxd21BR2wyZktSa1ZXV2Z1eWhiaVZvdEVuNkVm?=
 =?utf-8?B?T0VlZGtCZ2JxL0t1OXJxcjc4czNsU2J1RWNZZ0djSmloZUFHZXJBOHM1WkRW?=
 =?utf-8?B?ekpWcWkyWWdycTVTL0FFUFVJM3VYYlpXVHhqL0JxcU1paXUrKzdUSi90MHZu?=
 =?utf-8?B?M0ErVDkwVjQ0YjZCUVJnZjQzbWY1d015aGY2ZWpaOENnVzBBNDErNGZSS3Rp?=
 =?utf-8?B?TzZvTGk3Q0pIS2J4QjZ6djZudnZuMFlxSjBFY3hiUUpZRjliUHErRVJISzVI?=
 =?utf-8?B?bmRDVEVvQXJPWk9zS21ONnRraXFKdEt2TDMzQ1E2S0t1N2lSUUxHcWVnNHpz?=
 =?utf-8?B?Y0pVREE4T0JFdytteVN0UjhxUXo5R3BscEJrNTVocXhhSDhEbzlTbFVjZTVF?=
 =?utf-8?B?ZE5QRDlBS3dML0pTcWgrZzFVenVGeWdETGt0WHcydUdLckJKMSs5RURUS1R5?=
 =?utf-8?B?b3FNNDhtRDI5U014Z1IxUHpIQTJkM1JialhaU2xJQk41UjUxSGh4VG9uTDVw?=
 =?utf-8?B?bmNkaVdKWlRIN0lmUFpHck1Dcm9qZFAzbjU4bUl5QTJhNHZEUUZwcUJpTm96?=
 =?utf-8?B?NWd4UkN2aDNBVUI4MDQ5UTRzUTdYMW9qS2lITTM4VHR4UEJiSmxvbkZkYXdk?=
 =?utf-8?B?dnBrWFg0dlUzK1N5NTh2Z3k5TTgwdVhJWUtucHp4TU9OVWc2MDErcnJ4djFE?=
 =?utf-8?B?NDZvTmxuZDNaa1dqMk5vbXdjTDZwVGhNWVN2bUIxb0VJd0ZHOGtNYUxaa2t0?=
 =?utf-8?B?Q2xIMm9QUWxZa3N5dFA5bWNDajArQTdJblY1Tnl1MldXbFc2OE55dTJKc3RT?=
 =?utf-8?B?N1YxekJlWm5iMlU3RWIzV3N6eDBFUDR1SWNOYmZDY1pYV2FWbVNxUVhWZUFB?=
 =?utf-8?B?WmtXbzcxK3g5V3VISGR5VDQrRkVOMHcwYzhzQTZLRlA2TjM5bWY4V28wcVgx?=
 =?utf-8?B?QWJJaWIzN1Y1akFQcjcwd3FWUHVlRjlBNVZKQU1SaVMrQzVtLzVrMVdPa2NQ?=
 =?utf-8?B?QUc1V1dDU2hkU2VKT25oVHY2MHd0NkRkWVZQMTZSVm9rbzR6Z3Z1cHBYamZj?=
 =?utf-8?B?M3RIVHU4RnBnT2EySDR1RnlCbzg0OVptOGJud0xPbE9MU29YT0NiR1pncjNJ?=
 =?utf-8?B?SFZjeU5NcVk4TmdnblZWOFlWVEYxZEcvUnVoTWdPQi90M1U0MitFbzQvYy9I?=
 =?utf-8?B?am9Rek42VGswR2JEK3RJNlgyK2pXNHdXQ2lnczdJc2pmMmxJUG9Sb3UrOTAw?=
 =?utf-8?B?MGJWTXFnU0RpeEplVUJjTndUYzlJNXVYemE4d3J1SGxVSS9EOTVQazVXd2Zq?=
 =?utf-8?Q?xSamyeN8IMon3kyQiSNRtmQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2F8EA7FE59F8944B3F9A4C3547DD88A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ca9c7b-b30e-43d2-658a-08ddeac3e4fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 08:28:43.7771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+cTELsuuQsNTAcjlRnny5Pn0O/a0kAtncrCw1Uuph5hXFNwew/3sO8W11r1FSz3n5qaCXgrnQf0r7lSuEuIAfNufo45uHpTAVJNXs2x7ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7657
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

T24gV2VkLCAyMDI1LTA5LTAzIGF0IDEzOjI5ICswNTMwLCBVbWEgU2hhbmthciB3cm90ZToNCj4g
RkJDIHJlc3RyaWN0aW9uIHdoZXJlIEZCQyBpcyBkaXNhYmxlZCBmb3Igbm9uLW1vZHVsbyA0IHBs
YW5lIHNpemUNCj4gKGluY2x1ZGluZyBwbGFuZSBzaXplICsgeW9mZnNldCkgaXMgZml4ZWQgZnJv
bSBBREwgb253YXJkcyBpbiBoL3cuDQoNCkFETC1QIGFzIHBlciBwcmV2IGNvbW1lbnQ/DQoNCj4g
DQo+IFdBOjIyMDEwNzUxMTY2IGRvZXMgbm90IGFwcGx5IHBhc3QgZGlzcGxheSB2ZXJzaW9uIDEy
LsKgIE9yLCBpbg0KPiBvdGhlciB3b3JkcywgdGhlIEZCQyByZXN0cmljdGlvbiB3aGVyZSBGQkMg
aXMgZGlzYWJsZWQgZm9yDQo+IG5vbi1tb2R1bG8gNCBwbGFuZSBzaXplcyAoaW5jbHVkaW5nIHBs
YW5lIHNpemUgKyB5b2Zmc2V0KSBpcyBmaXhlZA0KPiBmcm9tIGRpc3BsYXkgdmVyc2lvbiAxMyBh
bmQgb253YXJkcy4gUmVsYXggdGhlIHJlc3RyaWN0aW9uIGZvciB0aGUgc2FtZS4NCj4gDQo+IHYy
OiBVcGRhdGVkIGNvbW1lbnRzIGZvciBjbGFyaXR5IChKb25hdGhhbiBDYXZpdHQpDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiAtLS0N
Cj4gwqB0ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyB8IDYgKysrLS0tDQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KV2l0
aCB0aGF0IGNoZWNrZWQsDQoNClJldmlld2VkLWJ5OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5v
ZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCg0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2lu
dGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIGIvdGVzdHMvaW50ZWwva21zX2Zyb250YnVm
ZmVyX3RyYWNraW5nLmMNCj4gaW5kZXggMDYxZTk5NmNjLi5hMjlkYTFkNDMgMTAwNjQ0DQo+IC0t
LSBhL3Rlc3RzL2ludGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jDQo+ICsrKyBiL3Rlc3Rz
L2ludGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jDQo+IEBAIC0zNDk2LDggKzM0OTYsOCBA
QCBzdGF0aWMgdm9pZCBzY2FsZWRwcmltYXJ5X3N1YnRlc3QoY29uc3Qgc3RydWN0IHRlc3RfbW9k
ZSAqdCkNCj4gwqAJZG9fYXNzZXJ0aW9ucyhET05UX0FTU0VSVF9DUkMpOw0KPiDCoA0KPiDCoAkv
Kg0KPiAtCSAqIE9uIGdlbiA+PSA5IEhXLCBGQkMgaXMgbm90IGVuYWJsZWQgb24gYSBwbGFuZSB3
aXRoIGEgWSBvZmZzZXQNCj4gLQkgKiB0aGF0IGlzbid0IGRpdmlzaWJsZSBieSA0LCBiZWNhdXNl
IGl0IGNhdXNlcyBGSUZPIHVuZGVycnVucy4NCj4gKwkgKiBGb3IgZGlzcGxheSB2ZXJzaW9ucyA5
IHRocm91Z2ggMTIsIEZCQyBpcyBub3QgZW5hYmxlZCBvbiBhIHBsYW5lIHdpdGgNCj4gKwkgKiBh
IFkgb2Zmc2V0IHRoYXQgaXNuJ3QgZGl2aXNpYmxlIGJ5IDQsIGJlY2F1c2UgaXQgY2F1c2VzIEZJ
Rk8gdW5kZXJydW5zLg0KPiDCoAkgKg0KPiDCoAkgKiBDaGVjayB0aGF0IEZCQyBpcyBkaXNhYmxl
ZC4NCj4gwqAJICovDQo+IEBAIC0zNTA1LDcgKzM1MDUsNyBAQCBzdGF0aWMgdm9pZCBzY2FsZWRw
cmltYXJ5X3N1YnRlc3QoY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCkNCj4gwqAJCQnCoMKgwqAg
cmVnLT54ICsgcmVnLT53IC8gNCwgKHJlZy0+eSArIHNyY195X3Vwc2NhbGUpIHwgMyk7DQo+IMKg
CWlndF9mYl9zZXRfc2l6ZSgmbmV3X2ZiLCByZWctPnBsYW5lLCByZWctPncgLyAyLCByZWctPmgg
LyAyKTsNCj4gwqAJaWd0X2Rpc3BsYXlfY29tbWl0MigmZHJtLmRpc3BsYXksIENPTU1JVF9VTklW
RVJTQUwpOw0KPiAtCWRvX2Fzc2VydGlvbnMoRE9OVF9BU1NFUlRfQ1JDIHwgKGdlbiA+PSA5ID8g
QVNTRVJUX0ZCQ19ESVNBQkxFRCA6IDApKTsNCj4gKwlkb19hc3NlcnRpb25zKERPTlRfQVNTRVJU
X0NSQyB8ICgoZ2VuID49IDkgJiYgZ2VuIDw9IDEyKSA/IEFTU0VSVF9GQkNfRElTQUJMRUQgOiAw
KSk7DQo+IMKgDQo+IMKgCS8qIEJhY2sgdG8gdGhlIGdvb2QgYW5kIG9sZCBibHVlIGZiLiAqLw0K
PiDCoAlpZ3RfcGxhbmVfc2V0X2ZiKHJlZy0+cGxhbmUsIG9sZF9mYik7DQoNCg==
