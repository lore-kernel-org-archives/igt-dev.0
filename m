Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB24B606A324
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 05:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HOFHFomz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3A910E1DE;
	Mon,  2 Nov 2026 05:25:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CB210E1DE
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 05:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793597095; x=1825133095;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Av8vNGv2owmk/RBRwx+jTZnxQk3TKCHrYvCf+/q4PjA=;
 b=HOFHFomzD3L0KDbxidctkvvR2Qdd4PRu++CydvQDnryt2DPUVp5Bm3WV
 mK7pJEXbKsE35okjotDbXMEvZHRF9xOSjMqcMj6sp+G9N3iFJpBLOzXSg
 Hj+vssQnhW75LJ1Q7r/OSzc203XxZGZufrqgT8gOpMECTm1RqUPdFvkI3
 9lWaQgmxa5g2gkzx+fYYJ5FF9XSeOW/cwusYqdEsbL3JPQJouSHL2M04B
 a0HPd9mq/54fdj/EqI8bxBzn7K7xCR64AJmhxSobBefqHObphMv18lJ1I
 gk5I0dLRj7UpjmeeFCNID/iMnQokcQN8kk3AXKjYJ6vAaLLSAAxOlLJa8 w==;
X-CSE-ConnectionGUID: OnEdWlRWSuunOx0QtnnzQA==
X-CSE-MsgGUID: tN6cSpUiQDSIP/a0B9v3BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2283605"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2283605"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 21:24:55 -0800
X-CSE-ConnectionGUID: 466fIBfkRnq+a0vhvIJcgw==
X-CSE-MsgGUID: zjsDQuobSvymNIWraHgOMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5866341"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 21:24:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 21:24:46 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 1 Nov 2026 21:24:46 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 21:24:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7NjXSikdNmd8KGd0iKmSZPoqqC78xjb+XP2915C+sXIMqkTKD5PJZYyFh3qNXHT49f+Kwq8K6HjQpM6raiI09rE2zl35otl9xxum3EPesiO8ulSAYFv3mzTlfTbdRgy7EsLMGiVchmPaINzHWMoVZgXhpQ06uT555mVGsjsu1dJfTeWoZsiX2pr/kxqjbfKS/nH7/5yquTaWRcEgiBF5konwfYSv2klmSY8zfGc5hdDijehHpQXk0j2pVOnAnHpue7go0/ihE+5diEFWLaBdADxml8YRHHXG9O5VXNLo0E2TNMG5KI4TpsoLy/vdGhflFPZOloGvOdRjTu0Y4NcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Av8vNGv2owmk/RBRwx+jTZnxQk3TKCHrYvCf+/q4PjA=;
 b=dTD8eMoaRReeFYBhxgZFI9KX43Vctyp3mRF9Y3FbCfkdAoGYaM5h4KLJ38ndMFSr5j+tvVfbJKH06flasJikqu1bvdUyc6Ll0lmFCRW+WjeR1VfRoox/PsELvm207P+wisl850jaSAoHK4t4HcDhbXU71lociusBq/Z0CJYJwtbe2hLCAaF/bZbn1mNdbt8QEmyqOSImoXsvdJKXrdQxdJBXN1cf//dwmURE7luPkwCHAYMRrrn1NNpMi7Nz9WuqNLx++dNP8PChmzU91tY3h9B4zTgKc9ByaEkZs5pZdRUX26vRUR2D6vi30HzBDSwzTIqNO2rBBKOqgnfwNj4cuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CH3PR11MB8433.namprd11.prod.outlook.com (2603:10b6:610:168::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:24:14 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 05:24:14 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dugast, 
 Francois" <francois.dugast@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe: fix missing thread cleanups in
 several tests
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe: fix missing thread cleanups in
 several tests
Thread-Index: AQHdYRmCYD3sLWinCEy4alYvv39Dy7cJiNkAgBDJhUA=
Date: Mon, 2 Nov 2026 05:24:14 +0000
Message-ID: <CH3PR11MB84345D2F2094759D601BCA4C8D6A2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20261021050307.3268228-4-priyanka.dandamudi@intel.com>
 <20261021050307.3268228-5-priyanka.dandamudi@intel.com>
 <20261022130200.t7bkghtaaudfyffi@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20261022130200.t7bkghtaaudfyffi@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CH3PR11MB8433:EE_
x-ms-office365-filtering-correlation-id: 8c56bb4a-c6a9-4ae1-557b-08df38a188be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003|261021121427099003|261021123027099003|261022075727099003|261026140227099003|261022105027099003|261009223027099003|261028144727099003|260925022911599003|260925021311599003|260925021911599003|38070700021;
x-microsoft-antispam-message-info: o3DCIYuzRWw4U7aDMg/5Nfw0uQBqbmFUWRueEWrhuxshHCyI3lg77H5cKyyfXp6wWkg8HG+EKIGdFo4A/TnVTt340GKCDLInrLu51Z+VyMP9honVXcoxUPZFXNhJAKsSRVmk+Nt39t25xeR3PGo06ZyoPHwxeHkLiTYOkPLIvKOhyxtFtTYycqzXX9BHXF+PkfnfGfQ5c58hk7svMLHxcHPtAgH5q2kKt2n91vf4nsBcZA5lfjysNtUFj5TPAuHtaFppQi7EzYi9uahVOJd61JVfeKHq/RSmCvMk99qIfZ36zMfyDfDXLNDUtNuRbV25raTyjvfORQ9+bSSDA4SR80qopnmoidwOrOZN+5YcEU/jik47q355FvpX/Ci4pJznOAGSpQIq4XbTISGZqhorC6IbIXw4erdt+ueHWb7bur7g3wje+dIErQhZpEn5EVoCb0G7SybkHPmgO4bp6ZaXZAp/v2bXJyPhbdtDz/+4ZL+pvgGzClLTGz7/wBTkZUJqk0wGY6OSxYEn7tYSje8kAhFfgqFrY7apbXmbPypp9X/9osyHd2pzkBmk3IpzJ3bvSTqoUlDRO1rJF1hipN3kBHJct/ayy5vdJT7M0Rkl+A50o8/JOwB7hmgJdAZLZduGUQmuf23KqOOn9X5OV3GEOqq5YpurvppI+JB5nfiMFbO6nLZtjZDTdN77cmxkbM9BoeSr/qYvLaiD48tHnVqTYy/yRZbXwjdob2XCTwuEH3M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(261021123027099003)(261022075727099003)(261026140227099003)(261022105027099003)(261009223027099003)(261028144727099003)(260925022911599003)(260925021311599003)(260925021911599003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MENIRmlUY05nVDFYVnFGbmdVdGRmdnhrM0xrYzdHVStqV3JrSU9sVkgyeVVZ?=
 =?utf-8?B?Z0lNSGZZa0lOV1NXYmhhbkRjSEladEVVK2JDV2lpK2RCekVQa3JISEJrTVc1?=
 =?utf-8?B?Sy8ra01UTjhXMDRGaWc0eE1yUVF1TlgvTzl4Zk44ZTFFaGRHZk9zbXpxYjZI?=
 =?utf-8?B?L2FneW5kblNWK084NHNLTFBjNVRmS2Q2TjZYWWd5UDFuV1BQekpFdDZYamRr?=
 =?utf-8?B?VjgyTzF0bzJsaS93M0I0WkwrQmJ5bE1IYThxanJTNjRqanhYL2tNMnAzVjVB?=
 =?utf-8?B?c05kUTNmRGd6Yy9YMmxlRlJWWUdxc01ZTWVJOWJzYks2eGs4cWgxT1NMajBK?=
 =?utf-8?B?Y0g5akx3RVRUVExEZDRFbmMyMnpBUkNYaUVJbTVxaHVvL1RxN0xnNFEwN0Jp?=
 =?utf-8?B?OVFjUkdWeWZQV0tQaFdScC9OVnoxRXRWZklxdC8rRE9hdGRJOERsNEZiOWgw?=
 =?utf-8?B?WjUzU3FJWTk2UzZDVFhMK1RLcGI1YTVqMXJ0MFlBUC9SQUhxM2lvVEdsZXY5?=
 =?utf-8?B?T002YjFtR05NZGhxSjdiaTViVHI0Q2FTOUNKSjIyTU9BbzBsS2k1WUdXZXdK?=
 =?utf-8?B?bGxxLzRpV2ZsL2RiRGZ5T3dMUS9OL2JzMVlLOWxHU2tDcWZNZHg5ODhKVmg0?=
 =?utf-8?B?Kzd6cm5JbHhGKzBPaExpdnFwYlZYaE4zSklIUE9haWZwSElUVWtpZm1HR1c2?=
 =?utf-8?B?TVpsam1Rck9mRWM3ZkJYbC8xc2dQODRjNjBBZExBZTEwNkpXL3BlMXlSZGxv?=
 =?utf-8?B?TVRyb0tFenpIUGpjNGY5UjBrbi9tenAxbklLWWZ4WVJxaDZQK1NwcmpEc2Rl?=
 =?utf-8?B?ZGJHTC96QytUL3lQYzRSSzBaK0Evd1FPUSs5R0RLL2FQMEp5LzJEN1hGUzUy?=
 =?utf-8?B?QndneXkxVFVlWFZXbTZVTlpGSzljcCtEN1lmVEFRY1ZoQlRtVWJFckJLYk9T?=
 =?utf-8?B?Ymphcm0wcFdpSlZzZktBNkNEOTZEKzlnanZLMDVCb2loY2hIa0toUFpXb2ZP?=
 =?utf-8?B?azdocmlVTjVPY0RvekhWaUxRamtuZk1nb3RwZUhGTWsvKzJvTFNFUnZ2NlF2?=
 =?utf-8?B?WHAxWExYOHE3ZDlDbC9CTDNTS2xGbzdZUmxwWHJocDF4RGJtVS9Ob2F1STk0?=
 =?utf-8?B?QStwY3hnTDQ4U0FZcmhqdlFMb2dDaEd5Rnd5Q0xXbHpPMUk4UzBZbThBUUFs?=
 =?utf-8?B?OTFrak82WDZ3ckI3YStqZ2ducThJcnovNGZkU0ZJS2M4ZXM1cHNnenZWa1RQ?=
 =?utf-8?B?a1hOaERqYUd1U28zYUxCZjJxcG1IVE40ODdDQW00b0xPOWJsOXMwZ0ZWZXNx?=
 =?utf-8?B?d3hOb3YrQUpvVVN1L2E5WWJwTmZEM0U3WTl0eXdwdHZqN29oeElnQ3NVVkFw?=
 =?utf-8?B?Z1dubXpld3U4Qzc2aDZpZWU4cm0yR0RvTUtZZ2ZuUVdFa0pHdFN4ZVRWZHJE?=
 =?utf-8?B?dkU0Mk84WTN5RHB3REttdFMvd1NIZ1d4dHdYZ3JXVS8rWXpIbVh5Vm1sVDQz?=
 =?utf-8?B?UU1oTkF3RnZGSXJzWGZKOFpqUVlYd0JTZkM2MkJkaVZFTmpiTXdsbURmL1hY?=
 =?utf-8?B?UU1qY1hzTTlFVUN6SGl3MEM0Y2UyRFh1bG80TjVyZTJtUjRjcno0dzFzdVJP?=
 =?utf-8?B?SVlCR0krbHN6aG41Nkdab0kxWXBMRTZjSGlRdVQxUDF0RU5ITEVEdi9haDF2?=
 =?utf-8?B?UVc2Qld1NXErWUZWRlJYUVM4UFRORWMrMFEzWkg1Y0w3SjhIK2t5bzJZNUVs?=
 =?utf-8?B?TDkvN2o5WnhjcTh5MFdJeWNySHg2TDE2dWU2aWN0bnJ3Z3ZQa2pvTDE4blZa?=
 =?utf-8?B?TjVlaWI5d0NTYTVuMnFwVDNhaXRPN1ZyM3FVNkczRWY2MFg5NFB2aEYxK0Nh?=
 =?utf-8?B?VklUblN4SlJRdkp5YkkxYldNbWJWTlNzUm50V2drQ0JZd3lBcFRwcEtHZngx?=
 =?utf-8?B?WFhUT2FHblJ1eXdScTh5ZHRrd093NW9URklhZFJzc1BGMzlkbmZlYUwzcTB1?=
 =?utf-8?B?YnJHUDgwbkNBY0loWGtxTUpCRmkyMjhQOHZHdWtDQjdyNklxQmFLN3h5YzVJ?=
 =?utf-8?B?K2lZeWNsejhkWTFIQXl0T3BneXFPVmgwTUt5WDJ1d2JEWHJBbC92L21leTJy?=
 =?utf-8?B?eUVGcUlLMlh0Ym8xVVp5UW5XRmVhYmpteE5vMnRuTFpGMDFQMGpzSHdnS2Ny?=
 =?utf-8?B?REVycmVWRjIyR2twVDYzdWpicHhGbzROK2c5RjVOSFlXZlZmczYxRWIrVlBi?=
 =?utf-8?B?MTUzaitIVnNOK09DSXJXR0JUS0FrT2FFTExPU2hqS1l0RHlOcWNFbGkzZDlL?=
 =?utf-8?B?L1Azb3RrZ25MQ2pRa2dpRm1ETFBSaHF0dnJkck5hajR5V1dHTUsyTFdtcXVz?=
 =?utf-8?Q?FcU7ZccDkCt90Qpc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kWGKNwTbThZXmMOuSnn0uG4D7uQZAfPgLas1FOVYrV3/ESH7SdqHIoltjIZeu+uA90Q64+UZlHtsThOx9ELoIqwcbe2pzw61Gvtu1pnipAatSYTTnjkTBRDSt/Sw4I0HH6Dd25i6xjGwaWLnzxNIh4q7d1ia4zCgcajVLS9DYlap2WzWG/0FOVOYgykeJ7ak810Wl3YBLNORa6pQHjVx4sBS3MeED2/3DlHKf8KtdwNXedRYVXLA92tJ/lskunYZUnWqHgdgu3zIMaZJgeab6BfmpybizdeAOxhZ6BRG106FYqd2/uNtYnEUfgFUHZNlAQSMh/zhnoMab/dw8EFtvg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c56bb4a-c6a9-4ae1-557b-08df38a188be
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 05:24:14.4493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+gJvC3Da53Uqe3x3PPVVrePEhpmnOfZ7j1DOKL/HP+gsqAEn7OvVjkaNRnuebvau++SnLN/PaKIDjwpdWNTjZ77j9iUJ+Cg1HUKriFHQMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8433
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAyMiBPY3RvYmVyIDIw
MjYgMTg6MzINCj4gVG86IERhbmRhbXVkaSwgUHJpeWFua2EgPHByaXlhbmthLmRhbmRhbXVkaUBp
bnRlbC5jb20+DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRHVnYXN0LCBG
cmFuY29pcyA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT47DQo+IEtlbXBjenluc2tpLCBaYmln
bmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIGktZy10IDEvMl0gdGVzdHMvaW50ZWwveGU6IGZpeCBtaXNzaW5nIHRocmVhZCBjbGVhbnVw
cyBpbiBzZXZlcmFsDQo+IHRlc3RzDQo+IA0KPiBIaSBQcml5YW5rYSwNCj4gT24gMjAyNi0xMC0y
MSBhdCAxMDozMzowOSArMDUzMCwgcHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbSB3cm90ZToN
Cj4gPiBGcm9tOiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5j
b20+DQo+ID4NCj4gPiBTZXZlcmFsIFhlIHRlc3QgZnVuY3Rpb25zIGNyZWF0ZWQgcHRocmVhZCBt
dXRleGVzL2NvbmRzL2JhcnJpZXJzLCBhDQo+ID4gdGhyZWFkIGFycmF5LCBhbmQgYSBidWZfb3Bz
IGNvbnRleHQgd2l0aG91dCByZWxlYXNpbmcgdGhlbS4NCj4gPg0KPiA+IEFkZCB0aGUgbWlzc2lu
ZyBwdGhyZWFkX211dGV4X2Rlc3Ryb3koKS9wdGhyZWFkX2NvbmRfZGVzdHJveSgpLA0KPiA+IGZy
ZWUoKSwgYW5kDQo+ID4gYnVmX29wc19kZXN0cm95KCkgY2FsbHM6DQo+IA0KPiBQbGVhc2UgbW92
ZSBhIGZpeCBmb3IgYnVmIG9wcyBpbnRvIHNlcGFyYXRlIHBhdGNoLg0KPiBSZXN0IGxvb2tzIG9r
Lg0KTW92ZWQgaXQgdG8gc2VwYXJhdGUgcGF0Y2ggYW5kIHNlbnQgYSBuZXcgdmVyc2lvbi4NCj4g
DQo+ID4NCj4gPiB4ZV9wcmltZV9zZWxmX2ltcG9ydC5jOiB0aHJlYWRzKCkgbGVha2VkIHRoZSBj
YWxsb2MnZCB0aHJlYWQgYXJyYXkuDQo+ID4geGVfZXhlY190aHJlYWRzLmMsIHhlX2V4ZWNfcmVz
ZXQuYywgeGVfZXZpY3QuYywgeGVfY29tcHV0ZS5jLA0KPiA+IHhlX2V4ZWNfc3lzdGVtX2FsbG9j
YXRvci5jIDogbXV0ZXgvY29uZCAoYW5kIGJhcnJpZXIsIHdoZXJlDQo+ID4gYXBwbGljYWJsZSkg
aW5pdGlhbGl6ZWQgYnV0IG5ldmVyIGRlc3Ryb3llZC4NCj4gPiB4ZV9yZW5kZXJfY29weS5jOiBw
ZXItdGhyZWFkIG11dGV4IG5ldmVyIGRlc3Ryb3llZDsgYnVmX29wc19jcmVhdGUoKQ0KPiA+IG5l
dmVyIG1hdGNoZWQgd2l0aCBidWZfb3BzX2Rlc3Ryb3koKS4NCj4gDQo+IFBsZWFzZSByZW1vdmUg
YWJvdmUgcGFyYWdyYXBoLCBpdCBpcyBhbHJlYWR5IGluIHBhdGNoIGl0c2VsZi4NCj4gDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVk
aUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX2NvbXB1dGUuYyAgICAg
ICAgICAgICAgIHwgMiArKw0KPiA+ICB0ZXN0cy9pbnRlbC94ZV9ldmljdC5jICAgICAgICAgICAg
ICAgICB8IDUgKysrKysNCj4gPiAgdGVzdHMvaW50ZWwveGVfZXhlY19yZXNldC5jICAgICAgICAg
ICAgfCA0ICsrKysNCj4gPiAgdGVzdHMvaW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMg
fCA2ICsrKysrKw0KPiA+ICB0ZXN0cy9pbnRlbC94ZV9leGVjX3RocmVhZHMuYyAgICAgICAgICB8
IDIgKysNCj4gPiAgdGVzdHMvaW50ZWwveGVfcHJpbWVfc2VsZl9pbXBvcnQuYyAgICAgfCAxICsN
Cj4gPiAgdGVzdHMvaW50ZWwveGVfcmVuZGVyX2NvcHkuYyAgICAgICAgICAgfCA2ICsrKysrLQ0K
PiA+ICA3IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9jb21wdXRlLmMgYi90ZXN0cy9pbnRl
bC94ZV9jb21wdXRlLmMgaW5kZXgNCj4gPiAyZjcwZjIyOTEwLi5lNzM4YzlkYWJkIDEwMDY0NA0K
PiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGUuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVs
L3hlX2NvbXB1dGUuYw0KPiA+IEBAIC00ODksNiArNDg5LDggQEAgdGVzdF9ldV9idXN5KHVpbnQ2
NF90IGR1cmF0aW9uX3NlYykNCj4gPiAgCQlwdGhyZWFkX2pvaW4odGhyZWFkc19kYXRhW25dLnRo
cmVhZCwgTlVMTCk7DQo+ID4NCj4gPiAgCWZyZWUodGhyZWFkc19kYXRhKTsNCj4gPiArCXB0aHJl
YWRfbXV0ZXhfZGVzdHJveSgmbXV0ZXgpOw0KPiA+ICsJcHRocmVhZF9jb25kX2Rlc3Ryb3koJmNv
bmQpOw0KPiA+DQo+ID4gIAlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gPiAgfQ0KPiA+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC94ZV9ldmljdC5jIGIvdGVzdHMvaW50ZWwveGVfZXZpY3QuYyBp
bmRleA0KPiA+IDVhNzI5OGRiMDQuLjk2MWU5NGU4OGIgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMv
aW50ZWwveGVfZXZpY3QuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V2aWN0LmMNCj4gPiBA
QCAtNDk0LDYgKzQ5NCwxMSBAQCB0aHJlYWRzKGludCBmZCwgc3RydWN0DQo+ID4gZHJtX3hlX2Vu
Z2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiA+DQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgbl90
aHJlYWRzOyArK2kpDQo+ID4gIAkJcHRocmVhZF9qb2luKHRocmVhZHNfZGF0YVtpXS50aHJlYWQs
IE5VTEwpOw0KPiA+ICsNCj4gPiArCWZyZWUodGhyZWFkc19kYXRhKTsNCj4gPiArCXB0aHJlYWRf
YmFycmllcl9kZXN0cm95KCZiYXJyaWVyKTsNCj4gPiArCXB0aHJlYWRfbXV0ZXhfZGVzdHJveSgm
bXV0ZXgpOw0KPiA+ICsJcHRocmVhZF9jb25kX2Rlc3Ryb3koJmNvbmQpOw0KPiA+ICB9DQo+ID4N
Cj4gPiAgc3RhdGljIHVpbnQ2NF90IGNhbGNfYm9fc2l6ZSh1aW50NjRfdCB2cmFtX3NpemUsIGlu
dCBtdWwsIGludCBkaXYpDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfcmVz
ZXQuYyBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQuYw0KPiA+IGluZGV4IDUwNzcxYWY1MzUu
LmU5NTc5YjE2OWYgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY19yZXNldC5j
DQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXhlY19yZXNldC5jDQo+ID4gQEAgLTEwNDAsNiAr
MTA0MCw4IEBAIGd0X3Jlc2V0KGludCBmZCwgaW50IGd0LCBpbnQgbl90aHJlYWRzLCBpbnQgbl9z
ZWMsDQo+IHVuc2lnbmVkIGludCBmbGFncykNCj4gPiAgCWlndF9hc3NlcnRfbmVxKG51bV9yZXNl
dCwgMCk7DQo+ID4gIAlpZ3RfYXNzZXJ0X25lcShudW1fc3VibWl0LCAwKTsNCj4gPiAgCWZyZWUo
dGhyZWFkcyk7DQo+ID4gKwlwdGhyZWFkX211dGV4X2Rlc3Ryb3koJm11dGV4KTsNCj4gPiArCXB0
aHJlYWRfY29uZF9kZXN0cm95KCZjb25kKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIC8qKg0KPiA+IEBA
IC0xMTkyLDYgKzExOTQsOCBAQCBzdGF0aWMgdm9pZCB0aHJlYWRzKGludCBmZCwgaW50IG5fZXhl
Y19xdWV1ZXMsIGludA0KPiBuX2V4ZWNzLCB1bnNpZ25lZCBpbnQgZmxhZ3MpDQo+ID4gIAkJcHRo
cmVhZF9qb2luKHRocmVhZHNfZGF0YVtpXS50aHJlYWQsIE5VTEwpOw0KPiA+DQo+ID4gIAlmcmVl
KHRocmVhZHNfZGF0YSk7DQo+ID4gKwlwdGhyZWFkX211dGV4X2Rlc3Ryb3koJm11dGV4KTsNCj4g
PiArCXB0aHJlYWRfY29uZF9kZXN0cm95KCZjb25kKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIGludCBp
Z3RfbWFpbigpDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2Fs
bG9jYXRvci5jDQo+ID4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYw0K
PiA+IGluZGV4IDMwNTUxMmRmZDkuLjhjOTk4YjRlYTEgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMv
aW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94
ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYw0KPiA+IEBAIC0zMTIsNiArMzEyLDkgQEAgY2hlY2tf
YWxsX3BhZ2VzX3RocmVhZHModm9pZCAqcHRyLCB1aW50NjRfdCBhbGxvY19zaXplLA0KPiB1aW50
NjRfdCBzdHJpZGUsDQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgbl90aHJlYWRzOyArK2kpDQo+ID4g
IAkJcHRocmVhZF9qb2luKHRocmVhZHNfY2hlY2tfZGF0YVtpXS50aHJlYWQsIE5VTEwpOw0KPiA+
ICAJZnJlZSh0aHJlYWRzX2NoZWNrX2RhdGEpOw0KPiA+ICsJcHRocmVhZF9iYXJyaWVyX2Rlc3Ry
b3koJmJhcnJpZXIpOw0KPiA+ICsJcHRocmVhZF9tdXRleF9kZXN0cm95KCZtdXRleCk7DQo+ID4g
KwlwdGhyZWFkX2NvbmRfZGVzdHJveSgmY29uZCk7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMg
dm9pZCB0b3VjaF9hbGxfcGFnZXMoaW50IGZkLCB1aW50MzJfdCBleGVjX3F1ZXVlLCB2b2lkICpw
dHIsDQo+ID4gQEAgLTIxODcsNiArMjE5MCw5IEBAIHRocmVhZHMoaW50IGZkLCBpbnQgbl9leGVj
X3F1ZXVlcywgaW50IG5fZXhlY3MsIHNpemVfdA0KPiBib19zaXplLA0KPiA+ICAJCQlmcmVlKGFs
bG9jKTsNCj4gPiAgCX0NCj4gPiAgCWZyZWUodGhyZWFkc19kYXRhKTsNCj4gPiArCXB0aHJlYWRf
YmFycmllcl9kZXN0cm95KCZiYXJyaWVyKTsNCj4gPiArCXB0aHJlYWRfbXV0ZXhfZGVzdHJveSgm
bXV0ZXgpOw0KPiA+ICsJcHRocmVhZF9jb25kX2Rlc3Ryb3koJmNvbmQpOw0KPiA+DQo+ID4gIAlp
ZiAoaXNfaHVnZXBnX2VuYWJsZSkNCj4gPiAgCQlyZXNldF9ucl9odWdlcGFnZXMoKTsNCj4gPiBk
aWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMNCj4gPiBiL3Rlc3RzL2lu
dGVsL3hlX2V4ZWNfdGhyZWFkcy5jIGluZGV4IDI5NzRmYzMxMmQuLjdjNmQxNDU4OTEgMTAwNjQ0
DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMNCj4gPiArKysgYi90ZXN0
cy9pbnRlbC94ZV9leGVjX3RocmVhZHMuYw0KPiA+IEBAIC0xNDY2LDYgKzE0NjYsOCBAQCBzdGF0
aWMgdm9pZCB0aHJlYWRzKGludCBmZCwgaW50IGZsYWdzKQ0KPiA+ICAJCXhlX3ZtX2Rlc3Ryb3ko
ZmQsIHZtX2NvbXB1dGVfbW9kZSk7DQo+ID4gIAlmcmVlKHRocmVhZHNfZGF0YSk7DQo+ID4gIAlw
dGhyZWFkX2JhcnJpZXJfZGVzdHJveSgmYmFycmllcik7DQo+ID4gKwlwdGhyZWFkX211dGV4X2Rl
c3Ryb3koJm11dGV4KTsNCj4gPiArCXB0aHJlYWRfY29uZF9kZXN0cm95KCZjb25kKTsNCj4gPiAg
fQ0KPiA+DQo+ID4gIC8qDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3ByaW1lX3Nl
bGZfaW1wb3J0LmMNCj4gPiBiL3Rlc3RzL2ludGVsL3hlX3ByaW1lX3NlbGZfaW1wb3J0LmMNCj4g
PiBpbmRleCBiNDMyNjlkNGYxLi41NjQ5MzA0ODY3IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2lu
dGVsL3hlX3ByaW1lX3NlbGZfaW1wb3J0LmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9wcmlt
ZV9zZWxmX2ltcG9ydC5jDQo+ID4gQEAgLTMzOSw2ICszMzksNyBAQCBzdGF0aWMgdm9pZCAqdGhy
ZWFkX2ZuX3JlaW1wb3J0X3ZzX2Nsb3NlKHZvaWQgKnApDQo+ID4gIAl9DQo+ID4NCj4gPiAgCXB0
aHJlYWRfYmFycmllcl9kZXN0cm95KCZnX2JhcnJpZXIpOw0KPiA+ICsJZnJlZSh0aHJlYWRzKTsN
Cj4gPiAgCWRybV9jbG9zZV9kcml2ZXIoZmRzWzBdKTsNCj4gPiAgCWNsb3NlKGZkc1sxXSk7DQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfcmVuZGVyX2NvcHkuYw0KPiA+IGIv
dGVzdHMvaW50ZWwveGVfcmVuZGVyX2NvcHkuYyBpbmRleCBlMmU3NTJlMjhiLi5hMmEwZjY1MmQ0
IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3JlbmRlcl9jb3B5LmMNCj4gPiArKysg
Yi90ZXN0cy9pbnRlbC94ZV9yZW5kZXJfY29weS5jDQo+ID4gQEAgLTYzNCwxMSArNjM0LDE1IEBA
IHN0YXRpYyB2b2lkIHJlbmRlcl9zdHJlc3NfY29weShpbnQgZmQsIHN0cnVjdA0KPiBpZ3RfY29s
bGVjdGlvbiAqc2V0LA0KPiA+ICAJCSByZW5kZXJfZHVyYXRpb25fdG90YWwgLyByZW5kZXJfY291
bnQsDQo+ID4gIAkJIHJlbmRlcl9kdXJhdGlvbl9taW4sIHJlbmRlcl9kdXJhdGlvbl9tYXgpOw0K
PiA+DQo+ID4gKwlidWZfb3BzX2Rlc3Ryb3koYm9wcyk7DQo+ID4gKw0KPiANCj4gQ2FuIHRoaXMg
bWlzc2luZyBkZXN0cm95IGFmZmVjdCB0ZXN0aW5nPyBPciB3aWxsIGl0IG9ubHkgY2F1c2UgbWVt
b3J5IGxlYWtzPyBKdXN0DQo+IGN1cmlvdXMsIGFsc28gYWRkaW5nIHRvICtDYyBGcmFuY29pcyBE
dWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+IFpiaWduaWV3IEtlbXBjennFhHNr
aSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiANCj4gDQo+IA0KPiBSZWdhcmRz
LA0KPiBLYW1pbA0KPiANCj4gPiAgCS8qIEVuZCBhbGwgbWVtIGNvcHkgdGhyZWFkcyAqLw0KPiA+
ICAJZm9yIChpbnQgaSA9IDA7IGkgPCB0aHJlYWRfY29weV9jb3VudDsgaSsrKQ0KPiA+ICAJCXhl
X3NwaW5fZW5kKGRhdGFfbWVtX2NvcHlbaV0uc3Bpbik7DQo+ID4gLQlmb3IgKGludCBpID0gMDsg
aSA8IHRocmVhZF9jb3B5X2NvdW50OyBpKyspDQo+ID4gKwlmb3IgKGludCBpID0gMDsgaSA8IHRo
cmVhZF9jb3B5X2NvdW50OyBpKyspIHsNCj4gPiAgCQlwdGhyZWFkX2pvaW4odGhyZWFkX21lbV9j
b3B5W2ldLCBOVUxMKTsNCj4gPiArCQlwdGhyZWFkX211dGV4X2Rlc3Ryb3koJmRhdGFfbWVtX2Nv
cHlbaV0ubG9ja19pbml0X3NwaW4pOw0KPiA+ICsJfQ0KPiA+DQo+ID4gIAlwdXRfYWhuZChhaG5k
KTsNCj4gPiAgCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+
DQo=
