Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB34C61DD6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E74110EB9C;
	Tue,  1 Sep 2026 07:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbsCyF3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A48710EB9C
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788248998; x=1819784998;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4mPHkb8igo/j/XWksrsRlZd8YHV85UYv7YdlLHI02DY=;
 b=EbsCyF3IWbg3zYZvjwNp+43GWiS3SFEz3zir4lYQfda4gE/RNPLC+5H8
 p3lVJQPo/muRxDyEZVEF+uMWiE9OBV7+efK4mQg76I4DnGDPnNCQiK1qR
 +HDnQ2uRiO7YUKjhVYiIOT9rkBnhK0WpXSRzXHZjxkX9GOaJQmweAMyNs
 EE3IdswAyqu2L2jVLJTicwvSaVUjmW17JgW4RedcFkpDSrBV4nAjJZ+0F
 2nfcLFuKFBVgYfoBTL4QKOv/Biva47qgExtTEWI7/qDMa5ABMepmInegb
 ypKftILroCoN+sECMvBgiyMLAXTR7EXtG7VHWCLZRVCISyGGYVlZEm8LQ Q==;
X-CSE-ConnectionGUID: rz/6KUCYRraLawE7nZ/M3A==
X-CSE-MsgGUID: /eo7KWXmRw+T9DcTEIfXCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92356507"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="92356507"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 00:49:57 -0700
X-CSE-ConnectionGUID: UaCLttN/TUSshiLx43PSeA==
X-CSE-MsgGUID: 0Zmi9eczSROeFnf9LSiWtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="265774495"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 00:49:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 00:49:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 00:49:56 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 00:49:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcUuv8QhCf861jSJ3HDWDePy2VADhoMv/wI3fFAjsYnWGjUEKRLU0NnxnfQeHp1zi90taPDMmIxrxxjrkHCrs75gNwtmeKEnooJI/zMC8K6h0tNFknMUfeLwhW/Tha9bmmYHe69fsCNVPPVL55kZjpA2xPB//SjOd4aAMZBW+xHnyjQwyMoA7SSMY6pm2FFWsjmMB66YeUxb8XtEdFn+Zo8ig8Gkoe8LBWpdK11wQ+AAGS+cfmMv8RMQ2HlGxRwGitiIQMYGgFpkjMerF4SovMWwFieDxaUYrmyU+oaaV+mWceY/HVzbjfclhVFAKTNKso7meL5ClEE+l/4p6RsvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mPHkb8igo/j/XWksrsRlZd8YHV85UYv7YdlLHI02DY=;
 b=y7fnp4IxM5CIi5Q5qgNkbLGVJpVxizGLo8nGVEGBD4mJDgRF9rjl6x3n5KCMNK6+LlzgPYSRz5xjGW8HKtqQb49r6mW6RdmnRhxH++rRIRIwCVsy+GlWBz5NEcDecEU70CQZdmPQsLF2dfdd0srgn4bimgJBP0FCtpVzhNS9HOW8+YNiIue96F6qAdh8agrd7EjY5IzAekQ6Tbs6AQ8xvDnuTfenB0EQw9qlMb9+ECfg82Kgm6+RgRbWFQ98B2o2O6Ev6Yab4D30lXB0As8eY9aCNfJyadbz/X0oDAiRrbVqdtwLnKFmBY8OOFxjMmOqXGGh6j+V2FHw4wEzQ7eb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS4PPF814058951.namprd11.prod.outlook.com (2603:10b6:f:fc02::36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 07:49:48 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 07:49:48 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "Grzelak, Michal" <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t v5 1/7] tools/vbt_decode: fix tables' offset reading
Thread-Topic: [PATCH i-g-t v5 1/7] tools/vbt_decode: fix tables' offset reading
Thread-Index: AQHdClCkw4QcwSh/HU+diZM/pw88Dra5tYWg
Date: Tue, 1 Sep 2026 07:49:48 +0000
Message-ID: <PH7PR11MB605359423E70BE7B33D40719E7A82@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260702182619.3973788-1-michal.grzelak@intel.com>
 <20260702182619.3973788-2-michal.grzelak@intel.com>
In-Reply-To: <20260702182619.3973788-2-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS4PPF814058951:EE_
x-ms-office365-filtering-correlation-id: 541aa540-94ac-4452-3696-08df07fd9906
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|11063799006|22082099003|56012099006|4143699003|18002099003|38070700021;
x-microsoft-antispam-message-info: /8ud6cr6R1b+GNUfyF0bB+o+Q5PIOBtGlKnO5B8ZI4iiDZrbRf1wLNfKpad5ucdvk+hsGIhQswJomj4cJQgyFOc6g9UuDIioIxZKVyudgseN9R475H194SP8YCwkOS/9yY4+RJbZaATMuuBeqP9IymPsqhttrO3BuKBKhLyB10HWVSGkk8s9wbZRBN38BT6nhNzjd25Z6pFccWdrLoMm6wTWd3Zh2m7rPJI6AHylGC23zxmJkq28wFL2FCGzQm6PGegVXSlgdanqBmvTz6AloG+ffAaor0R04lyl/1rCzykDfcI8eLIxrre7/f1yZXoW2MuHqcOnk41FpCQaqX96p7nv9LXFQ6zbODAcRs65meeRmYQRxnqq/ZsVq1/X1K9wPq1bgHDBH6LVHsrfPD2wcy9V8VKCVjo8c54/4pkRpeOhk4B1Hz82sQpUmHWAdve5Tp3qbFHNl9ErMOBc7fQjHBlOBcd8VLdcYjjFJLkOy2Cw+OaV/HZbPUeblxDMd3WXBb5VAkNsFtzTbovTENJU0XEzh296YLogT9M/hDUfyTuCsigZI/uJmeKIlYShtRkkOKIQ0EV/jCBnBo/u0KxyJLsFv/+nuv1OYpnEQif/VoyrYznpD6GLkD1NMl8djKnuRyz7dF1ejjh7YQX9aaNcsOuOmj6TzkwUGujGh7sZbFjZu2pY8nI24HVW1g2gFO6iy9J6Uf3OZgoCCj/TD+46uWMvWaN+xrrtqtEsGchIKFw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(11063799006)(22082099003)(56012099006)(4143699003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjU2MS9RVFh0NkI2V0puWk1IamJxd1paMTU3TFEyTjlKUGhVOFlmeE5CQSt6?=
 =?utf-8?B?bG8xUGU2UzN2S0RDTXd5T3hJR1NmZUQ2Nk9yY1JMSzFvQUpLRjd4dy9ac0E5?=
 =?utf-8?B?cURVWDJiL0VtZ3F1dFczdlFSeTI4SVRxajNKL3IyR1c3bDJzUkFFYUdIN21s?=
 =?utf-8?B?SmlxOUd4eCtKNFFwbERndU1JRFFsZUM2VlBpV2VEbHFmOTJzQS9TTEI4TlNn?=
 =?utf-8?B?VUJIc0FGam1hMWVzcEUvQzNiZ1VUSU5zTDlRcklKZFlVajdUSnNHSnFWaGJk?=
 =?utf-8?B?VU9HenB6NjN5YUs3bzg0bE96K0hGSklHYlFUclhMR2dJdStQOUp1dTgyaXFB?=
 =?utf-8?B?TDNNMHZBMkxtSU5keUZjUlNuVlgwMlE1ZDdNODZPQmxGREV2cFFFWFdLV1Bh?=
 =?utf-8?B?OVlGdHdsYzlpRzhmUDk2OURQdDVrMW5vLzVvelBjZDYvYjVlKzZhNDVpNG5T?=
 =?utf-8?B?TGVqYjl4Z1NlNEFUVldkclZpdGlFVDBxVnM2bWdZZThDcE9ZWERRL3ZQcmMz?=
 =?utf-8?B?blhhK2pXQnlNWEh1b0VRVERLdENDT3BQQUtHRElkWUpUYVd5MTRkd1Q3QTJO?=
 =?utf-8?B?QkF3T1NFMDhBbTdvak9PV29iODhXcDN5YmRBQWJ5ZmV3QWcvZG5xakFDUm1R?=
 =?utf-8?B?NVVtUDZmNkxEaHVBTHFDUkhha3poQ1BJdTd5ZURudUF2Q0Z4OWU1dDlCcDdr?=
 =?utf-8?B?dWNjWnM3YVhNOXVoTmcxbXl3eDF6V2YzYi90U2Y1MnU4OVYyMDBSbndxcFNE?=
 =?utf-8?B?ckljWWRKTHkyRHN2TlpxMmRmV0E4VWh1ZE0veXBVQlBsTERXSGtQYXFqM2dJ?=
 =?utf-8?B?VUc3OFJvWDhRaEV1YmdPVXJwaWxvSjZjKzRkMW91d1RzZmdLS1JJNWcyNnF5?=
 =?utf-8?B?Q2lYTDdwYmlEbkNYbHJ1VGRsZnV6TEJzdDNjUnRyV2RXQTltRXNGYVk1TGZr?=
 =?utf-8?B?UUpuVWd5aVJqS3RVTURHMEtWOU5kQ0g2aDBSdE44c3I0UGJlc09EV01xU2Rs?=
 =?utf-8?B?Y0hyK1NYU0dVeDZwWE5ab0wyUVFkTVBHeWpXbklCU1o2ODhwMSszUlRkQWpo?=
 =?utf-8?B?ODR5Wk91aEFGWkZTSEsyL2dERDdrTElQaG5IcTI0MmE3M2hqbDhhQVRieDh4?=
 =?utf-8?B?NjZjTE5kYUNQUG9ZaUdURi9lcHM3K2dOVnlLdjNYc0hoMVNiV2ZQYVRreFUv?=
 =?utf-8?B?dE5XdmNxbUt6S0VnNGxvd1p0Unp4NHNjT0E1d3FMbStOTG9LeHhGVGlnNFVi?=
 =?utf-8?B?RzhQcjhid1ZjWmRXQW9VQS9VN2hFSTNQTjkzOG1KZzhMamRlZ3NrRk1DSkk2?=
 =?utf-8?B?N29QRE5qRUNrY1I3QnExMkFzRGkyTWFPbHFkcFpDTitVcXhqTXkzdUhwM0NZ?=
 =?utf-8?B?eDBMRE83MkhMQlRHQlI0YzdVa2Ixd2tpU0h2cXU3bjhtVDB5ektNQ1ViMTl1?=
 =?utf-8?B?VFRJZXUzcitBVGluc3BaWDJiSHEybFpuZzhBclRuM003N29VMzg2VENhNHhI?=
 =?utf-8?B?RFpQWk9ZZ0FRUzR5QkRTa2RxQmF0cktBVVRsL2M3WkNGT2Nzd2JtbEllR0dH?=
 =?utf-8?B?VFhHUVppVEcyeGVENDV1cXQ0NFc1L3NwelpIQlFKbDcvcE9pWFZGM3g4OW1C?=
 =?utf-8?B?R3hLcXJJQlZZZkEwR1k5VjhhTkJXVmRvNCtPOUg5QlJVUVU1WWQxWitFZzVO?=
 =?utf-8?B?NytWV3RWUXR5ZVdnSFNQWFpUa0x0R0NHcThlY3FCYUppNHYvTitMSVJ4dEFr?=
 =?utf-8?B?OFJXZTc4eDM3c2RSVEVNTEFTcUtsUCtxUm4xMHZmYWRGSDFMc1RocVJEQkRH?=
 =?utf-8?B?TVBOSUhkTExZUFlEMW9maTAvdjVMRVRKSWc2UFR3S1E5S1dZSFhPdHpuME1D?=
 =?utf-8?B?bkZmRDY4enR1bEphOGVlbmJFWlZxdlNEVWNwaGxoSFZHdHFUbG9OTVI0RG04?=
 =?utf-8?B?SFBibzhzUjJ5WllBUnZhOERjck1tMTNSRWVQTVZGb0IvUjAyUm12L05BelBt?=
 =?utf-8?B?U3ZVY01RL2NzcWx4RXlFaVFzUWVITFlxYVkwTVBlU0doUFBHbGtmcEZIaGpU?=
 =?utf-8?B?U2gvVCtLRDJyWmVubm5GMWx5QlJvQzBsT0l0alc3VXBQL1JLVjlWQ3JyUld5?=
 =?utf-8?B?aSthZ1FmQmNIOGMvNC9uelJtMlJsYnJDQnpsL3hBTFE5d09QZXkzU0xEOXdG?=
 =?utf-8?B?TUk1clU5KzVEeGpWZGREV2o3NGo5YTJQK1RPRnZRc0NDbWN1QkZQcTBocWkw?=
 =?utf-8?B?NWVnMHM1TWxlcXNPd1pkYytyMEZCZkZuMTh6bzc3TG55MVZwbTV2MXhYQVRI?=
 =?utf-8?B?aDBUbWdLc3ZTdVdKVjZjWUNlSTFXcTdoeHRBMXQzMmNoTXJCWVIydz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ikh0nbSpca0UTIB2bvskNxVuzGMSMZyX6XsU5LCOluOQEmHMFcIR66V7dCFL2tYlf0/zya86YrEocRHKcExMmfw7MMWhPKq1wnHadrSPTlcuFoqkhSUwcLktkHFbSqckvkw+ZTlpnS1jETEEQyLDkyn/WD4SyaholFbH0TPgpUUujY8q/LOqFpWaa0eUah4S48238+q5cCNku2HSw8wxseC39h5yo2CIRWy0vt2PPuDjwfRO7BX0xxN4PJoAe0p31hbcgZUBUkosBzkQI+PUEnq0ohrKUNusUjlEk4R/VHe6rz16Jh+KvkFP8elnj72L8eMFrUPCm7Aab3acTAPKBw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 541aa540-94ac-4452-3696-08df07fd9906
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 07:49:48.5123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bh2hR5YAHZrCDmB5xWQ72rmj/1Nww9k2mH6eszOQrk7WDztUAGiWJew+03hrRk9H9VCtJJ26iVA/Ms5OnJaKQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF814058951
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

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1k
ZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBN
aWNoYcWCDQo+IEdyemVsYWsNCj4gU2VudDogVGh1cnNkYXksIEp1bHkgMiwgMjAyNiAxMTo1NiBQ
TQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IE5pa3VsYSwgSmFu
aSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgS2FuZHBhbCwgU3VyYWoNCj4gPHN1cmFqLmthbmRw
YWxAaW50ZWwuY29tPjsgR3J6ZWxhaywgTWljaGFsIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2NSAxLzddIHRvb2xzL3ZidF9kZWNvZGU6IGZpeCB0
YWJsZXMnIG9mZnNldCByZWFkaW5nDQo+IA0KPiBEdXJpbmcgZHVtcGluZyBvZiBWQlQgIzU3LCBh
bGwgcm93cyBhcmUgc2FtZSBiZWNhdXNlIHBhcnNlciBkb2VzIG5vdA0KPiBjaGFuZ2Ugb2Zmc2V0
IHJlYWQuIEFkanVzdCB0aGUgb2Zmc2V0IHRvIGNoYW5nZSBiYXNpbmcgb24gdGhlIHJvdyB1c2Vk
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBHcnplbGFrIDxtaWNoYWwuZ3J6ZWxha0Bp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jIHwgMiArLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jIGIvdG9vbHMvaW50ZWxfdmJ0X2RlY29k
ZS5jIGluZGV4DQo+IDk0NTFhNzczMTguLjE2ZjFjOTZmZWUgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L2ludGVsX3ZidF9kZWNvZGUuYw0KPiArKysgYi90b29scy9pbnRlbF92YnRfZGVjb2RlLmMNCj4g
QEAgLTM0ODAsNyArMzQ4MCw3IEBAIHN0YXRpYyB2b2lkIGR1bXBfdnN3aW5nX3ByZWVtcGhhc2lz
KHN0cnVjdA0KPiBjb250ZXh0ICpjb250ZXh0LA0KPiAgCQkJcHJpbnRmKCJcdFx0JXM6ICIsIHZz
d2luZ19wcmVlbXBoW2ldKTsNCj4gDQo+ICAJCQlmb3IgKGludCBqID0gMDsgaiA8IHZzLT5udW1f
Y29sdW1uczsgaisrKQ0KPiAtCQkJCXByaW50ZigiIDB4JTA4eCIsIHZzLT50YWJsZXNbbiAqIDEw
ICogdnMtDQo+ID5udW1fY29sdW1ucyArIGpdKTsNCj4gKwkJCQlwcmludGYoIiAweCUwOHgiLCB2
cy0+dGFibGVzW24gKiAxMCAqIHZzLQ0KPiA+bnVtX2NvbHVtbnMgKyBpICogal0pOw0KDQpUaGlz
IGZpeCBpcyBpbiByaWdodCBhcmVhLCBidXQgSSB0aGluayB0aGlzIGRvZXMgbm90IGNvbXB1dGUg
YSB2YWxpZCByb3cvY29sdW1uIG9mZnNldC4NCkFzIHBlciBteSB1bmRlcnN0YW5kaW5nLCB0aGUg
Y29ycmVjdCBmb3JtdWxhIHNob3VsZCBiZSBhcyBiZWxvdywgYXMgdGhpcyBlbnN1cmVzIHdlIA0K
bW92ZSB0byB0aGUgY29ycmVjdCB0YWJsZSwgdGhlbiB0byBjb3JyZWN0IHJvdywgdGhlbiBhY3Jv
c3MgdGhlIGNvbHVtbiBpbiB0aGF0IHJvdy4NCg0KdnMtPnRhYmxlc1tuICogMTAgKiB2cy0+bnVt
X2NvbHVtbnMgKyBpICogdnMtPm51bV9jb2x1bW5zICsgal0NCg0KUmVnYXJkcywNClByYW5heQ0K
DQo+ICAJCQlwcmludGYoIlxuIik7DQo+ICAJCX0NCj4gIAl9DQo+IC0tDQo+IDIuNDUuMg0KDQo=
