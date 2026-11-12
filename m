Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956C1606A321
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 13:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dHgtJ/jW;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=LZYbMG9D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB311120FA;
	Thu, 12 Nov 2026 13:36:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E72112144
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794490519; x=1826026519;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z0yiOPlfbUnA923MqtxWomqfAnqx9SFsa4YTKsK66ss=;
 b=dHgtJ/jWoG5OsMTZZ/P9Q0QzJQpRQh+4CdMgCmD1eNngnxHBVr7doOKV
 yqf6VBoHRszfB3cOcfnhLyRovhM9y7hBsg1ZgaHa/+TJMIV09DWUjdv0D
 1XWIKsvsWMzttLBmhc4IdMFs4vHaQvqCZdPLXbds74UXIBnQUFoE1XukO
 gJP/Ac1q6L48qVqvQtU+rBCoLoA00hKHemGP2hs/A9OTgt9kXrrGk2R+O
 K57wi/swRyIZp1QlkwpLnVFXbUOX0c9rh6+qNZZe7otfxhgkbf+NcVlWt
 TCzJjPv/R9X+nJe/RCcDrJKWSnPGTRPDAo2ZbFWvwcMsM4U2YJJxDd5Qk g==;
X-CSE-ConnectionGUID: +PvsGkNbT6aswl1OzW1qFw==
X-CSE-MsgGUID: 6+89dzpaQvyKagew1dF6tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3156192"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3156192"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 05:35:18 -0800
X-CSE-ConnectionGUID: yvlTaLtmRAGJk+Dh5YDEbQ==
X-CSE-MsgGUID: PQoavttNRMyfKBWv1LQ7cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8974428"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 05:35:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 05:35:18 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 05:35:18 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 05:35:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPYS9jQ+OmNBuG8LXD97xONnLKKGDERwv/MthNyXeMK1BozxKCXq0XwXwyvoVyPs7FkiqSvXt0f6YpBz9x2sxLNzh+qzo+nFJPJs9J2j75s4vvpBIlRPYCN2nLNYFRoOqofApV6ZEPXRo8wOd2p+NbAMF9Gu+87wCwIk7u/610giROG1QtPIKudjurcA/lveSiLchKO1tolP36lah4eFNHAxDI9LgxKf5rWBCKvqBra0Hsca8xpr3xEUFulh+rmMZvoBW8FWC4hSs/B6BbSyZdyD0Xvxa/wKXUGzcR9PpJJkbZmE0AYWDDPy46QLSTSqv4US/k98isrk7B/t/wvTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0yiOPlfbUnA923MqtxWomqfAnqx9SFsa4YTKsK66ss=;
 b=emvFVb9Ct0cY4QhZhIRP+JTNFLI1rSPVcohu168OHpRNl5hs8DYWteluBjrD086GSu8KfnRHb6c7bFQbII0NHSQREPoc3TwFZM7WTaoajPggo2pnfpfshkvm5OaUjfKV3fLM0b1UhPr23TkdNmaCLYVaQJgbu8Afwj2cH2+RM/kl2lighkj5hDuorqsR6ekbj5Yaqy1qT9c4ZmAuc5eGnthAE7Mykl6uwE+8X/Iecto2KgxSZOqSrcJ1cX3jXEhPIZmchyukviQvsPYLwEt4Ps3wm0K4Gg3fIwGOJ6vCfyfw8Zwow68X0LcKNlftH8/E6n6L3Inv8U4/9OmguPQLIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0yiOPlfbUnA923MqtxWomqfAnqx9SFsa4YTKsK66ss=;
 b=LZYbMG9DvZ5K7L3tYVRdcZI7qUcpAdxiXFHTbxwCtGMzuonTfnrviAzQHBhf7zUcovL3VEmEporDo4eTUKjKPyN+vtJLXfQLUE3gYcrOFHVnz5vtWzX5Hn/1cFolOm7mz3sH66VR+/SXkvuftNYDJAIO16+aFI/LQNduGaawjbE=
Received: from BN7PR11MB2595.namprd11.prod.outlook.com (2603:10b6:406:b1::24)
 by PH7PR11MB8525.namprd11.prod.outlook.com (2603:10b6:510:304::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 13:35:15 +0000
Received: from BN7PR11MB2595.namprd11.prod.outlook.com
 ([fe80::b0e:2ba5:7120:cdd9]) by BN7PR11MB2595.namprd11.prod.outlook.com
 ([fe80::b0e:2ba5:7120:cdd9%5]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 13:35:15 +0000
From: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "Balasubramanyam, Smitha"
 <smitha.balasubramanyam@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Senna, Peter"
 <peter.senna@intel.com>, "Patil@freedesktop.org" <Patil@freedesktop.org>
Subject: RE: [PATCH v1 1/2] tests/core_sysfs: add coverage for xe_device_sysfs
 entries
Thread-Topic: [PATCH v1 1/2] tests/core_sysfs: add coverage for
 xe_device_sysfs entries
Thread-Index: AQHdbC4z8XvJjfm9L0GKicrC9TiUJrcl3QWAgASfyLA=
Date: Thu, 12 Nov 2026 13:35:15 +0000
Message-ID: <BN7PR11MB2595114343CB6A0B281C0002CD702@BN7PR11MB2595.namprd11.prod.outlook.com>
References: <20261104072850.18413-1-shivtej.eknath.patil@intel.com>
 <20261104072850.18413-2-shivtej.eknath.patil@intel.com>
 <wrnao7lanzy3ujr3rnpqvdqty42a36bb4adtaoyylti6pyotsj@cgxaucfjphwh>
In-Reply-To: <wrnao7lanzy3ujr3rnpqvdqty42a36bb4adtaoyylti6pyotsj@cgxaucfjphwh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2595:EE_|PH7PR11MB8525:EE_
x-ms-office365-filtering-correlation-id: 66f0e002-10d1-48f2-9ff5-08df40c1c926
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|5023799004|11063799006|4143699003|56012099006|38070700021|22082099003|18002099003|6133799003|10067099003|261022075727099003|261022105027099003|261022113327099003|261028144727099003|261026121527099003|261021121427099003|261102123227099003|261026140227099003|261009220027099003|261009223327099003|261009223027099003|261009221227099003|261009221727099003;
x-microsoft-antispam-message-info: +KR1PnMOhyxUhJamCzUX/Am+Refrz1MSawzmB8J9Zwltu31Edyqx8aZmhMoOyXokGegv+DaumdofTOdxLPwiARw9bIrFrh12Sse/aQ2An7xpv5U5GvE/IxeYsikNf/uMSUQ6eFUNR/yeXI4UB7fdQhWUyt3W7s6KInYt/7mQNFn3khsfj48tJSuA/qrsBmjOnM+JtC0MTyERvpzWsILb8ttEupoWlxruoTD8/aS7sr8Trtia/3CpGpVQuSkuibA1Vw8EEm07nuu05HuRKnMKnjMvz8lZKRnqcfbb3X4YYYU8/HKVjaut505SBQH/OZhIIBxXIH9Qew5Y1BG5P3t9i0DpRXOIxTtOqi/Iz2PdnLUL3ejbqJEd0nmma8x2UVfGPapFtAfEz9r4oOddMxeJQ8n3GjjTJHHsWPT82yShO/GLQd6CiOFDbOfgI8Ao54mHbTykQ67sjOSSy0Dj+Q0U7kcOsygGxfB+GMGz3jF1LIFHgDBkRo+jDHqypnM78qbJZ0FULlr2ieMdFmHyP4ff6K9BqO6yddHLNbNY6Rp8fkJA2LOaIk2jWaKzGeO4XdyN6I9fzNxhkwH5VDo3JMpfN8C7+6m+v516/bJop8uua1XRyJHIFxjEX4u30B9saXkoOwHzWtxPjWsSNAjp9PzPrS3MTBL1pWCfwWvP1yRA6/l3H15fA7nbZqSvkbVS2CZObBNN8YvqunFIPA+ygqEjhRCP0Je5F9Ng1eILv6QWpL4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2595.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(5023799004)(11063799006)(4143699003)(56012099006)(38070700021)(22082099003)(18002099003)(6133799003)(10067099003)(261022075727099003)(261022105027099003)(261022113327099003)(261028144727099003)(261026121527099003)(261021121427099003)(261102123227099003)(261026140227099003)(261009220027099003)(261009223327099003)(261009223027099003)(261009221227099003)(261009221727099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVFCVWZockYwejBEZ3hNWXpmc2NISWNsS3NjVGdWR3ZQSHZPc2RBdDR2YkhT?=
 =?utf-8?B?Z0xaeU9iSEQ3RjRhTXBIVmFqMGc4aFlBREVFV3dxdUlpclhRbFozbVdVWktY?=
 =?utf-8?B?N2RjNENLb3g5S3JrVGpxVGtXQ0JzYi9NSWd6eFJWTG85TU1HY0ZlWEREeXd1?=
 =?utf-8?B?ZTlmL0hjYUp4blp0Z3FMK0RhQzFyWTdRclc5T2gxcTFCZmIwckgydUlIMUI3?=
 =?utf-8?B?VnYwU1lMUzVTWkhvd2xrdkdhS1UxY3FyYk1vVnBJYnl3MktZRTNIMHN5T0o4?=
 =?utf-8?B?MWZyNUF1eWZvZFpQbmlKTTVETUtpT1lVcVIwUVJYUlVQdXNDMHlNaHNYQUE4?=
 =?utf-8?B?VTJ0KzBlZk9McTQrUVBNSHlqOEhLb240aGM0eVcralpxbUt2S2FWaHlCUjQv?=
 =?utf-8?B?VWRiODdFZThZbEtJdjZlYnZyTTBoZHkxMkcwTXMzU3FONzlyaTdnUTI0bjJp?=
 =?utf-8?B?YjhlRURBQ1JTa1YvbGVIemY2b2lVdDFKdzU0YmJhS3JJUUxyVy9INzBFdWNZ?=
 =?utf-8?B?d2JPSzlSdmcwU0VaVjRvcFQxS2ZoTlJaTUZpY3p0M01MSzRtZ0dNMEZsbU5x?=
 =?utf-8?B?bUxTNk5oRVk1ZUhGbnVpbjFMaGZEaCtWZ3J3eGxVZ1pMcVRxWk54MlVSOXlq?=
 =?utf-8?B?VEhienBkd2RkWjBYUTlVb2hJVXVaWWFwQVJIOVN1Q2hWM3hSaVdzUVRUQW5q?=
 =?utf-8?B?S2xtWUxBQU4rYlJXSWQrMzh5Um9yYkxSWXRhZWlWTFBaUzE5ejc5QkdDaTFN?=
 =?utf-8?B?VktBeXBLZm9VTkFZTnN2SmNOaXk1ZUE2clBwWG85NGhLUlMyQy9UcU0zdmlS?=
 =?utf-8?B?QldDa3ZQalQ4Rm8vd3F4YmcxcndibWhKWmltOWVkQWlGMCtOMUFmUFV6MWM5?=
 =?utf-8?B?QnNxaUhQQWVtb3VVR2NDQ3NybjgrZHpMNWR0dVdOZ3pDci9Rb3laNEhTS3Vw?=
 =?utf-8?B?WElONmF4RjM2Y0RmbkVkallYZ3VqTGFxVWNzcVR4cHdOWDFadFFsczhUaW5B?=
 =?utf-8?B?M0p1OXNkTGZ0VUJYSGtVYXRaR3FaYmo1blJtQ3JnTHZOVXhqQldybE9KYVhx?=
 =?utf-8?B?Tlg1RVNSejg1LzdoVytYeWZTRU4vMWpxVmIxeDVxNHNBZ0JCckVPQzBMclBC?=
 =?utf-8?B?aHFNNk5NQndhMlB1dm96UW5rbDY4N2J0QlBsSmxJcEdDU0pHWUxrTmF6Z04w?=
 =?utf-8?B?TUFuMUc4RDFHR09IUlZvRHlPZ1AvNGVCR3lEeWFPWnZQbHgzMHBtTmd3NGQ2?=
 =?utf-8?B?Vk5sODVNZXFFNlpIZGRmZ1JhSzVPcnB3OGVZR3g0aEYzdi9GNUpEcGlrT3gx?=
 =?utf-8?B?RnkxOU8xbkdic2FqMlBnZmcvd29La2lMNS9rTCtCamhFeDFFWFk1K1FnckQy?=
 =?utf-8?B?STBFY05xa3ZmbUEvRUlnVGl3bnI5ZWdyOXVtNW90dGJRV2lhTDM2a29KMEVt?=
 =?utf-8?B?TGQrQ21HZU5iVU84bTY3K2ZkWXdnT3RNYzFJMlpUSGpyMmFER0Q0bXJuK05M?=
 =?utf-8?B?NzA4RkJsd1ZwaTl2dzl1UEhVOFhJUlJLUEt5Y2NBemp2M3QvS1NqdjF2elRL?=
 =?utf-8?B?ZU5PM3dpazZCZnEzTDMzSFpNckxRL3JwcUxFdmgyOHI2RGRoc3UrOENJRERB?=
 =?utf-8?B?cGFBV2hITlV0Rm1vMzl3Y3ZXVkNHeFY5ZUN2aDZ4WUp0TmYrWEVzNlkxTmFB?=
 =?utf-8?B?OUVuS0FuYUlzWFB5VXBZMXc5NVh5TG4wWjB1TEZvVnNKWjcxcHd5Rm9FaUY3?=
 =?utf-8?B?TVRzcDF2Si9kWFJ4WFZuMGhDSEUvNE5CczFVSmpPN3FYaWRnS2MvcWd4bGE2?=
 =?utf-8?B?L1c3bnJJSDNiWkVzem9tZDNrUU1Qa0pvRkNJZVZWRC9UZmJXSC9rQ3hGYnhi?=
 =?utf-8?B?MmJ2M3BrNjBJRTZVS25xS29aUVNTVXpBMklsbi9Eam1mQ2JSaEgveWJ2SmQ3?=
 =?utf-8?B?TVU4WndNUmZBTzNVSUdSUSsvRk1aT3hiZlYrR0dQczNyTnZjNzBrM0NhaTlQ?=
 =?utf-8?B?VzduQ0FUYVN0cFJ5YXlaWEhoQ1IxbytZa1laMjR2MENXODJOYU9sT1Y0ZzVx?=
 =?utf-8?B?WjdVY0syTlR0WTNrS0hYd29iYlZJUGFhNzZRTXE1dWdrcWNyTnlaSlRibk9C?=
 =?utf-8?B?NUVwZlVqL1hSekRBQU9sUytNcG8rRkxwOCtWaHJLNUF3dE8rQ2RNNVZpL1lq?=
 =?utf-8?B?SkEzQlkzcjZFNnkzYlhVTFd5c1JkMnA1YU9oenJSNytiNmhZQlZBMXJiQmRD?=
 =?utf-8?B?RXVTczJxUEE0dkFuUjA4RXd2RldlTjc0c05qellWc0E4UHJXUEpvZXhuMTVY?=
 =?utf-8?B?Wm8rTldNbW9VY2lOZVFWR1NocGplTnROWllKdUpVT0lIQnlmaXNtcVcrY3Z4?=
 =?utf-8?Q?SQg/Zhutme0N4aHk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GvXRN7oaWRtxuhULYByjywYqQDyNSmP/fhvkt7Pxsg6CUalXQz/a8ALCZwur6zPZEJNZgAXmjPG0O2YDC+fFmsjnYW/FRCt6FUA75xAjIz1Sa400B0OBd2WQUtH22Kp8hPJCOXYmWVnXpXo3RfF9am21Emy2i552YAeir+8p+7K/A2kmwJGovPi5UnNkusc2anXzNA2xG68sy1zF3TzOfdg2MSLbH8IhUKtdh838yXv1Ra2imeIqMucK0AuohwfJX/G4nQii8RtpXoVhsa8lKZS7Oq4XVuJh1/s1a4NlciOctF2IdTtGYOdwo9b4JnE4NK4JN41TaxVTqc8fsgauMg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f0e002-10d1-48f2-9ff5-08df40c1c926
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 13:35:15.7394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +iL0Um/NK5dT2bB7Q14KIYPclU3b/Duz37Zs6r4N6dWld9v2EpbZiHhasMW+NvSrv6K89+aX+y/gJmbzoykGySogYSvommVfqvVFyGvl5Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8525
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

SGkgS2FtaWwsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KU3VyZSwgSSdsbCB3YWl0IGZv
ciB5b3VyIHByb3Bvc2VkIGNoYW5nZXMgYW5kIHJld29yayB0aGUgdGVzdCBhY2NvcmRpbmdseS4N
Cg0KUmVnYXJkcywNClNoaXZ0ZWoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50
OiAwOSBOb3ZlbWJlciAyMDI2IDIwOjI4DQpUbzogUGF0aWwsIFNoaXZ0ZWogRWtuYXRoIDxzaGl2
dGVqLmVrbmF0aC5wYXRpbEBpbnRlbC5jb20+DQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IEtvbmllY3pueSwgS2FtaWwgPGthbWlsLmtvbmllY3pueUBpbnRlbC5jb20+OyBTaGFy
bWEsIE5pc2hpdCA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+OyBCYWxhc3VicmFtYW55YW0sIFNt
aXRoYSA8c21pdGhhLmJhbGFzdWJyYW1hbnlhbUBpbnRlbC5jb20+OyBQb29zYSwgS2FydGhpayA8
a2FydGhpay5wb29zYUBpbnRlbC5jb20+OyBHYW5kaSwgUmFtYWRldmkgPHJhbWFkZXZpLmdhbmRp
QGludGVsLmNvbT47IE5pbGF3YXIsIEJhZGFsIDxiYWRhbC5uaWxhd2FyQGludGVsLmNvbT47IFNl
bm5hLCBQZXRlciA8cGV0ZXIuc2VubmFAaW50ZWwuY29tPjsgUGF0aWxAZnJlZWRlc2t0b3Aub3Jn
DQpTdWJqZWN0OiBSZTogW1BBVENIIHYxIDEvMl0gdGVzdHMvY29yZV9zeXNmczogYWRkIGNvdmVy
YWdlIGZvciB4ZV9kZXZpY2Vfc3lzZnMgZW50cmllcw0KDQpIaSBzaGl2dGVqLmVrbmF0aC5wYXRp
bCwNCk9uIDIwMjYtMTEtMDQgYXQgMDc6Mjg6NDkgKzAwMDAsIHNoaXZ0ZWouZWtuYXRoLnBhdGls
QGludGVsLmNvbSB3cm90ZToNCj4gRnJvbTogIlBhdGlsLCBTaGl2dGVqIEVrbmF0aCIgPHNoaXZ0
ZWouZWtuYXRoLnBhdGlsQGludGVsLmNvbT4NCg0KVGhpcyBzaG91bGQgYmU6DQoNCj4gRnJvbTog
IlNoaXZ0ZWogRWtuYXRoIFBhdGlsIiA8c2hpdnRlai5la25hdGgucGF0aWxAaW50ZWwuY29tPg0K
DQoNCj4gDQo+IEFkZCBzeXNmcyBjb3ZlcmFnZSBzdWJ0ZXN0cyB0byB2YWxpZGF0ZSB0aGUgZm9s
bG93aW5nIHhlX2RldmljZV9zeXNmcyANCj4gZW50cmllczoNCg0KTmFjaywgcGxlYXNlIGRvIG5v
dCBhZGQgZHJpdmVyLXNwZWNpZmljIGNvZGUgdG8gZ2VuZXJpYyBjb3JlIHRlc3RzLCBpZiBwb3Nz
aWJsZS4NCg0KPiAtIGF1dG8tbGluay1kb3duZ3JhZGUtY2FwYWJsZQ0KPiAtIGF1dG8tbGluay1k
b3duZ3JhZGUtc3RhdHVzDQo+IC0gbGItZmFuLWNvbnRyb2wtdmVyc2lvbg0KPiAtIGxiLXZvbHRh
Z2UtcmVndWxhdG9yLXZlcnNpb24NCj4gLSB2cmFtLWQzY29sZC10aHJlc2hvbGQtc2hvdw0KPiAt
IHZyYW0tZDNjb2xkLXRocmVzaG9sZC1zdG9yZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF0aWws
IFNoaXZ0ZWogRWtuYXRoIDxzaGl2dGVqLmVrbmF0aC5wYXRpbEBpbnRlbC5jb20+DQoNClRoaXMg
c2hvdWxkIGJlOg0KDQpTaWduZWQtb2ZmLWJ5OiBTaGl2dGVqIEVrbmF0aCBQYXRpbCA8c2hpdnRl
ai5la25hdGgucGF0aWxAaW50ZWwuY29tPg0KDQpMZXQgbWUgcHJvcG9zZSBzb21lIGNoYW5nZXMg
dG8gdGhpcyB0ZXN0LCBzbyBpdCBzaG91bGQgYmUgZWFzaWVyIHRvIHNwb3QgYSBwcm9ibGVtLCBp
ZiB0aGVyZSBpcyBhbnkuDQoNCg0KUmVnYXJkcywNCkthbWlsDQoNCj4gLS0tDQo+ICB0ZXN0cy9j
b3JlX3N5c2ZzLmMgfCAxMTUgDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDExNSBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvdGVzdHMvY29yZV9zeXNmcy5jIGIvdGVzdHMvY29yZV9zeXNmcy5jIGluZGV4
IA0KPiAzMTczZmZhN2IuLmExMGU0NjJjOCAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvY29yZV9zeXNm
cy5jDQo+ICsrKyBiL3Rlc3RzL2NvcmVfc3lzZnMuYw0KPiBAQCAtMjAsOCArMjAsMzAgQEANCj4g
ICAqIFNVQlRFU1Q6IHJlYWQtYWxsLWVudHJpZXMNCj4gICAqIERlc2NyaXB0aW9uOiBSZWFkIGFs
bCBlbnRyaWVzIGZyb20gc3lzZnMgcGF0aA0KPiAgICoNCj4gKyAqIFNVQlRFU1Q6IGF1dG8tbGlu
ay1kb3duZ3JhZGUtY2FwYWJsZS1zaG93DQo+ICsgKiBEZXNjcmlwdGlvbjogUmVhZCBhdXRvX2xp
bmtfZG93bmdyYWRlX2NhcGFibGUgc3lzZnMgZW50cnkNCj4gKyAqDQo+ICsgKiBTVUJURVNUOiBh
dXRvLWxpbmstZG93bmdyYWRlLXN0YXR1cy1zaG93DQo+ICsgKiBEZXNjcmlwdGlvbjogUmVhZCBh
dXRvX2xpbmtfZG93bmdyYWRlX3N0YXR1cyBzeXNmcyBlbnRyeQ0KPiArICoNCj4gKyAqIFNVQlRF
U1Q6IGxiLWZhbi1jb250cm9sLXZlcnNpb24tc2hvdw0KPiArICogRGVzY3JpcHRpb246IFJlYWQg
bGJfZmFuX2NvbnRyb2xfdmVyc2lvbiBzeXNmcyBlbnRyeQ0KPiArICoNCj4gKyAqIFNVQlRFU1Q6
IGxiLXZvbHRhZ2UtcmVndWxhdG9yLXZlcnNpb24tc2hvdw0KPiArICogRGVzY3JpcHRpb246IFJl
YWQgbGJfdm9sdGFnZV9yZWd1bGF0b3JfdmVyc2lvbiBzeXNmcyBlbnRyeQ0KPiArICoNCj4gKyAq
IFNVQlRFU1Q6IHZyYW0tZDNjb2xkLXRocmVzaG9sZC1zaG93DQo+ICsgKiBEZXNjcmlwdGlvbjog
UmVhZCB2cmFtX2QzY29sZF90aHJlc2hvbGQgc3lzZnMgZW50cnkNCj4gKyAqDQo+ICsgKiBTVUJU
RVNUOiB2cmFtLWQzY29sZC10aHJlc2hvbGQtc3RvcmUNCj4gKyAqIERlc2NyaXB0aW9uOiBXcml0
ZSBhbmQgcmVhZCBiYWNrIHZyYW1fZDNjb2xkX3RocmVzaG9sZCBzeXNmcyBlbnRyeQ0KPiAgICov
DQo+ICANCj4gK3N0YXRpYyBib29sIHN5c2ZzX2V4aXN0cyhpbnQgc3lzZnNfZmQsIGNvbnN0IGNo
YXIgKnBhdGgpIHsNCj4gKwlyZXR1cm4gIWZhY2Nlc3NhdChzeXNmc19mZCwgcGF0aCwgUl9PSywg
MCk7IH0NCj4gKw0KPiAgSUdUX1RFU1RfREVTQ1JJUFRJT04oIlJlYWQgZW50cmllcyBmcm9tIHN5
c2ZzIHBhdGhzLiIpOw0KPiAgDQo+ICBpbnQgaWd0X21haW4oKQ0KPiBAQCAtNDEsNiArNjMsOTkg
QEAgaW50IGlndF9tYWluKCkNCj4gIAlpZ3Rfc3VidGVzdCgicmVhZC1hbGwtZW50cmllcyIpDQo+
ICAJCWlndF9kaXJfcHJvY2Vzc19maWxlc19zaW1wbGUoc3lzZnMpOw0KPiAgDQo+ICsJaWd0X3N1
YnRlc3QoImF1dG8tbGluay1kb3duZ3JhZGUtY2FwYWJsZS1zaG93Iikgew0KPiArCQlpbnQgdmFs
Ow0KPiArCQlpbnQgcmV0Ow0KPiArDQo+ICsJCWlndF9yZXF1aXJlKHN5c2ZzX2V4aXN0cyhzeXNm
cywNCj4gKwkJCQkJICJkZXZpY2UvYXV0b19saW5rX2Rvd25ncmFkZV9jYXBhYmxlIikpOw0KPiAr
DQo+ICsJCXJldCA9IGlndF9zeXNmc19zY2FuZihzeXNmcywNCj4gKwkJCQkgICAgICAiZGV2aWNl
L2F1dG9fbGlua19kb3duZ3JhZGVfY2FwYWJsZSIsDQo+ICsJCQkJICAgICAgIiVkIiwgJnZhbCk7
DQo+ICsNCj4gKwkJaWd0X2Fzc2VydChyZXQgPiAwKTsNCj4gKwkJaWd0X2luZm8oImF1dG8tbGlu
ay1kb3duZ3JhZGUtY2FwYWJsZT0lZFxuIiwgdmFsKTsNCj4gKwkJaWd0X2Fzc2VydCh2YWwgPT0g
MCB8fCB2YWwgPT0gMSk7DQo+ICsJfQ0KPiArDQo+ICsJaWd0X3N1YnRlc3QoImF1dG8tbGluay1k
b3duZ3JhZGUtc3RhdHVzLXNob3ciKSB7DQo+ICsJCWludCB2YWw7DQo+ICsJCWludCByZXQ7DQo+
ICsNCj4gKwkJaWd0X3JlcXVpcmUoc3lzZnNfZXhpc3RzKHN5c2ZzLA0KPiArCQkJCQkgImRldmlj
ZS9hdXRvX2xpbmtfZG93bmdyYWRlX3N0YXR1cyIpKTsNCj4gKw0KPiArCQlyZXQgPSBpZ3Rfc3lz
ZnNfc2NhbmYoc3lzZnMsDQo+ICsJCQkJICAgICAgImRldmljZS9hdXRvX2xpbmtfZG93bmdyYWRl
X3N0YXR1cyIsDQo+ICsJCQkJICAgICAgIiVkIiwgJnZhbCk7DQo+ICsNCj4gKwkJaWd0X2Fzc2Vy
dChyZXQgPiAwKTsNCj4gKwkJaWd0X2luZm8oImF1dG8tbGluay1kb3duZ3JhZGUtc3RhdHVzPSVk
XG4iLCB2YWwpOw0KPiArCQlpZ3RfYXNzZXJ0KHZhbCA9PSAwIHx8IHZhbCA9PSAxKTsNCj4gKwl9
DQo+ICsNCj4gKwlpZ3Rfc3VidGVzdCgibGItZmFuLWNvbnRyb2wtdmVyc2lvbi1zaG93Iikgew0K
PiArCQljaGFyIHZlcnNpb25bNjRdOw0KPiArCQlpbnQgcmV0Ow0KPiArDQo+ICsJCWlndF9yZXF1
aXJlKHN5c2ZzX2V4aXN0cyhzeXNmcywNCj4gKwkJCQkJICJkZXZpY2UvbGJfZmFuX2NvbnRyb2xf
dmVyc2lvbiIpKTsNCj4gKw0KPiArCQlyZXQgPSBpZ3Rfc3lzZnNfc2NhbmYoc3lzZnMsDQo+ICsJ
CQkJICAgICAgImRldmljZS9sYl9mYW5fY29udHJvbF92ZXJzaW9uIiwNCj4gKwkJCQkgICAgICAi
JTYzcyIsIHZlcnNpb24pOw0KPiArDQo+ICsJCWlndF9kZWJ1ZygicmV0PSVkIGVycm5vPSVkXG4i
LCByZXQsIGVycm5vKTsNCj4gKw0KPiArCQlpZ3RfYXNzZXJ0KHJldCA+IDApOw0KPiArDQo+ICsJ
CWlndF9pbmZvKCJsYi1mYW4tY29udHJvbC12ZXJzaW9uPSVzXG4iLCB2ZXJzaW9uKTsNCj4gKwl9
DQo+ICsNCj4gKwlpZ3Rfc3VidGVzdCgibGItdm9sdGFnZS1yZWd1bGF0b3ItdmVyc2lvbi1zaG93
Iikgew0KPiArCQljaGFyIHZlcnNpb25bNjRdID0ge307DQo+ICsJCWludCByZXQ7DQo+ICsNCj4g
KwkJaWd0X3JlcXVpcmUoc3lzZnNfZXhpc3RzKHN5c2ZzLA0KPiArCQkJCQkgImRldmljZS9sYl92
b2x0YWdlX3JlZ3VsYXRvcl92ZXJzaW9uIikpOw0KPiArDQo+ICsJCXJldCA9IGlndF9zeXNmc19z
Y2FuZihzeXNmcywNCj4gKwkJCQkgICAgICAiZGV2aWNlL2xiX3ZvbHRhZ2VfcmVndWxhdG9yX3Zl
cnNpb24iLA0KPiArCQkJCSAgICAgICIlNjNzIiwgdmVyc2lvbik7DQo+ICsJCWlndF9kZWJ1Zygi
cmV0PSVkIGVycm5vPSVkXG4iLCByZXQsIGVycm5vKTsNCj4gKw0KPiArCQlpZ3RfYXNzZXJ0KHJl
dCA+IDApOw0KPiArCQlpZ3RfaW5mbygibGItdm9sdGFnZS1yZWd1bGF0b3ItdmVyc2lvbj0lc1xu
IiwgdmVyc2lvbik7DQo+ICsJfQ0KPiArDQo+ICsJaWd0X3N1YnRlc3QoInZyYW0tZDNjb2xkLXRo
cmVzaG9sZC1zaG93Iikgew0KPiArCQl1aW50NjRfdCB0aHJlc2hvbGQ7DQo+ICsNCj4gKwkJaWd0
X3JlcXVpcmUoc3lzZnNfZXhpc3RzKHN5c2ZzLA0KPiArCQkJCQkgImRldmljZS92cmFtX2QzY29s
ZF90aHJlc2hvbGQiKSk7DQo+ICsNCj4gKwkJdGhyZXNob2xkID0gaWd0X3N5c2ZzX2dldF92cmFt
X2QzY29sZF90aHJlc2hvbGQoc3lzZnMpOw0KPiArDQo+ICsJCWlndF9pbmZvKCJ0aHJlc2hvbGQ9
JSIgUFJJdTY0ICJcbiIsIHRocmVzaG9sZCk7DQo+ICsJfQ0KPiArDQo+ICsJaWd0X3N1YnRlc3Qo
InZyYW0tZDNjb2xkLXRocmVzaG9sZC1zdG9yZSIpIHsNCj4gKwkJdWludDY0X3Qgb2xkX3ZhbDsN
Cj4gKwkJdWludDY0X3QgbmV3X3ZhbDsNCj4gKw0KPiArCQlpZ3RfcmVxdWlyZShzeXNmc19leGlz
dHMoc3lzZnMsDQo+ICsJCQkJCSAiZGV2aWNlL3ZyYW1fZDNjb2xkX3RocmVzaG9sZCIpKTsNCj4g
KwkJb2xkX3ZhbCA9IGlndF9zeXNmc19nZXRfdnJhbV9kM2NvbGRfdGhyZXNob2xkKHN5c2ZzKTsN
Cj4gKwkJaWd0X3N5c2ZzX3NldF92cmFtX2QzY29sZF90aHJlc2hvbGQoc3lzZnMsIG9sZF92YWwg
KyAxKTsNCj4gKwkJbmV3X3ZhbCA9IGlndF9zeXNmc19nZXRfdnJhbV9kM2NvbGRfdGhyZXNob2xk
KHN5c2ZzKTsNCj4gKwkJaWd0X2Fzc2VydF9lcShuZXdfdmFsLCBvbGRfdmFsICsgMSk7DQo+ICsJ
CS8qIHJlc3RvcmUgKi8NCj4gKwkJaWd0X3N5c2ZzX3NldF92cmFtX2QzY29sZF90aHJlc2hvbGQo
c3lzZnMsIG9sZF92YWwpOw0KPiArCQlpZ3RfaW5mbygib2xkPSUiIFBSSXU2NCAiIG5ldz0lIiBQ
Ukl1NjQgIlxuIiwNCj4gKwkJCSBvbGRfdmFsLCBuZXdfdmFsKTsNCj4gKwl9DQo+ICsNCj4gIAlp
Z3RfZml4dHVyZSgpIHsNCj4gIAkJY2xvc2Uoc3lzZnMpOw0KPiAgCQlkcm1fY2xvc2VfZHJpdmVy
KGZkKTsNCj4gLS0NCj4gMi4zNC4xDQo+IA0K
