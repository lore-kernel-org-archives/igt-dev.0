Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBB5C4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 03:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CE210F6DF;
	Wed,  1 May 2024 03:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fihpwt7R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D800D10F6DF
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 03:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714534469; x=1746070469;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NcgpCN8tDDOdSeX2BTUVKWLpxHHpZ0biX2CiV238fj4=;
 b=Fihpwt7R03URzYm/PaPpWhxdRm2213Al3ALQZh1hnN9PP7AXKgBvERX0
 pli2IzJ0lYEXPr+Xf90WQtnNhMQF1y4e/qnO/okXqvNc/AYJKj2K56R1f
 g2VQoWN5XqviOCuTLgBcfHpM8RrJGFh0Zf9wquwbCII9ue2P1rkZNcjkE
 y1+OJTfwbZ7yoB/OFx7xYnEQ+z0rENhsOyQ/Pf4juEi9X3lvx/oEaKP9V
 2IxO54zbfJyVYsrzhZ3/9pxlbR6e7G0o6aNOEBwksAMqTo0Q7P+wbuwpp
 +hpNtWIek5HZBCWcTibHQnVHO6ywb4NVIM2Q08VtPT0MTvphqB27Xl/by w==;
X-CSE-ConnectionGUID: ce+IwSHQSJKMjxSL+tab6w==
X-CSE-MsgGUID: 2l0yW4naSc2GqE3GebYk+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="27784750"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="27784750"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 20:34:28 -0700
X-CSE-ConnectionGUID: uoJGHU5bTVCYFQRwoxWBBw==
X-CSE-MsgGUID: oqg5hvCEQNO/t+ZXOmW4PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="31124649"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 20:34:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 20:34:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 20:34:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 20:34:27 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 20:34:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Js4HwnfA0xoPv/VXYukT9hX1D7OmiinFahDg+o47WkD37xayxp4oEx3uKA7R8ejRbEB4NzU2fo4DysuMr1qOFsneLGoCImzZ2Qr7fUX8JsQNI4fjL8hvbZgeWPzBSvWlSlZwaCgqYb6D6l5iWNKJ5JIXSV2JS6Ls0OIbg4/DZ3Ovo6pjXAkcMLkhrSlleDsM5VqSrHREQLpbbaY4MQkc1v1n9Gu8XUZNacziPAr35pOo4BagbCnx4XazYoN8PxWMyQ3N5xhH2zjWexMWivd3TdmkLhmfdybv+UY+/0nTP4WdX4VJf3w7uJ8zgXGWZYqSpcJ0ttAmvHx+zRvyKaW0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcgpCN8tDDOdSeX2BTUVKWLpxHHpZ0biX2CiV238fj4=;
 b=mesB7qegcXwXzqNFEsDnBOm79Zhm/Da2bhcjl5yTXhFuvx5PtOxegI0U9aMZV/BFA+pDmilbbNXEwnD0UJH5D5hoj3FL1y3Q1nuX7wzVPAOKHCM1p7G4ldK5Sfni+wGG76znyWuMMMztENK50SvkUi8OwoZ6l5PUtyd2FCgctya0teuMIh82k89gkUs6kjRmNKTKFUtwHdYrXD2NqwQkVpvX39wZRN3uAiIrWMf8Ot2Ol0eYyxO+UhL8HU0DONsBpmRLTTlbztLaGqTQvX7xXgCPwjF2P18oCUtxVvctYPvicMCIzf6CzOc0NThZq10sqnnXWoHvu0t0JIN4r0/3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by LV3PR11MB8674.namprd11.prod.outlook.com (2603:10b6:408:217::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 03:34:20 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.021; Wed, 1 May 2024
 03:34:20 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH RFC i-g-t 0/2] helper function
Thread-Topic: [PATCH RFC i-g-t 0/2] helper function
Thread-Index: AQHamywYCEc2IeAo/kSvm/cwXTzvpbGBuHig
Date: Wed, 1 May 2024 03:34:19 +0000
Message-ID: <SA1PR11MB6991BA2418A132F04239526792192@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.brost@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|LV3PR11MB8674:EE_
x-ms-office365-filtering-correlation-id: 6f0121de-bc7f-463c-7f80-08dc698f962b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?cWh0K1hNQWl0VmZPZkdpeEtqMnI5ZElWS1FwaEJjRlZPekppU29hQ0ZZUDFr?=
 =?utf-8?B?Nkg2ZTRjanhFZXN6WEdZU2RkT2JvdzZVVnN1ZWNyMXlBUjB4TGc1SmNDUkZY?=
 =?utf-8?B?K2UwUHpEM1p5WHVaT0hKYmVDamc3cS8vRnhZaThTaE13MnB2dzQrK3gxREZs?=
 =?utf-8?B?VlV6cExCV3NMeGdzVGMxNjFJS1ZNWXR3MkJJSDE5b1NhQkl2NFlvL1g3L2pD?=
 =?utf-8?B?WS9WT3pGbjYvZTM4bFg4WDQxTk5HeWZEQlRiM0xlcm9GdThBMlhmYlNVTmRO?=
 =?utf-8?B?S2U3R1E3OWVPSEExSjk2a2x2STc2NnVzZEhDbWY4Uk92ODRMMHFhakRXSTdY?=
 =?utf-8?B?NVVkQ0p3SWFOY1owclludUs1andQRi9tT0EraE9nNDNpRzFHV3lIR0VpWFRZ?=
 =?utf-8?B?elY2WURGK3FJK1hsT1hJUGcvZmNwRzZvYmVLQjVSQ00rZ2ZEaVZrWko3ZlJR?=
 =?utf-8?B?NzhsQXlDSTNKQXVmd3FmY1FweFh4L3RTcUFKUVZVNmVuVk9Fa05YY3VpKzAy?=
 =?utf-8?B?MzlSTExNd1J3Y0o3VlUybzNEZHFWM2pLd0JFNnZlVUJVZjYwSTZGK3BCdENZ?=
 =?utf-8?B?RXZCTjdYNjdhcVQxRkNXNjZ5NTRMdkloSkY0a1M3cjlHVnhXRTlXMXFQUUJW?=
 =?utf-8?B?cEpzWXljUjVsRmlvQXNZZXhUUXVSNWJvUmd2NFJKU1kyaUZ6ZnBnakYwZ3lQ?=
 =?utf-8?B?RkcxVTY2ZGZidkxRUGRjVEJuY2M1MjdsNWw0K0VuaTBwQ1M0ek11VnJMK2h6?=
 =?utf-8?B?SGc5REpwMi9NaVZCWldLOVBEUXFieEpscVlkWW93eXdGYytKamJIcURZVjZW?=
 =?utf-8?B?ZmlXR0xwckx4ZnpjS3RJUjNpTWpOMnJ3endTWHBvZTh6WkZqVlU1SDFjd1A4?=
 =?utf-8?B?d0E3b3o4L1VQMzVJVUFOVzdmRVFGMkszdlF4M3I3djRiOUREMzR1cHpMZ3Vv?=
 =?utf-8?B?LzAySDgwc01RREhsR0hzU0lvbGhIS3BabTBDMHNQejlDVFB6dnBET0NvRWhG?=
 =?utf-8?B?MXFRNEt0anhMejA1YVpFTGtuTjZON2FBN1N3citxZzc5M0ZBSjRkcFNZZWFk?=
 =?utf-8?B?NFRVbHNMZ0tRQ0FYelI0RThHQUVhWkV6SHU0ckZ3M2hQVXFUc1BLM3ZzUE5T?=
 =?utf-8?B?cEhaTFZqZWU0ZElUSkpjcyt4RkkwSlBjMVVIdEpvcXhvTDA5UDZ5NmFDY2xZ?=
 =?utf-8?B?TlFvdklJWDFTaTJ1WDNocE1QZGs4SkRQSDRaRGNWRTFSUnZ0WVdlUkloVEVT?=
 =?utf-8?B?WThta255clhkdTFJSlZmWFlDb09tbzI0NExPcU5jaVRjVmdVcERaaEN6S1pV?=
 =?utf-8?B?TzIvM29yc0VXNjdRQUxNVFJRV3NkYzlJYURhN1lKRVJPRDVrMUxRQmZMN0hT?=
 =?utf-8?B?OEZXK1ViNjJKNnRaenIzN0hUMFpVZFgra0NPT2VjeFBKTlNrNnRrNER0OGNl?=
 =?utf-8?B?cEJrMHdUMzhWNTRLQzRYcnE2SkhXd1c0S0lndHlNdzVKSjRwUUlhWFVXL2lP?=
 =?utf-8?B?UWREOEJqVlFNcWFqUkhac3lTU01relZYd0pTaDZqb0x3Znc0R2FjQUl6UGlt?=
 =?utf-8?B?YmNVVngzYUJJbnB0WUJySG5qYXM1cTEwekpsdjI4dUxyN28zY1BhekJVWjlV?=
 =?utf-8?B?d3k3RTl2Z2R0b0l2NFNBTnhkT2J1MytjVmJkbkpkMVh4UHR3Rk5taHFxS0lX?=
 =?utf-8?B?UnVONTg2R2xCa2dDcVptc1pOSUZuUVdFRlI1TkNOMHdxUVRZYlZSSG5DZ0FZ?=
 =?utf-8?B?VTVWQWM0cVppTjNsWFdCZ0FxcUZyTVo1bDd1bzA2T3ZYcmp5U20zQXpORmJn?=
 =?utf-8?B?M25hR21TNFpudlUwUStmdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NStsK2FTWGk2NHpYWWM5M1B2eGprY2ExNzZWZzloZ2hoTlh5UTBIdjIybXJK?=
 =?utf-8?B?V1NQQW1acitqVk5GeDVhTXFSZHo3TU1nUGpORzIyQndPalJaTklqYjhqYXY5?=
 =?utf-8?B?bFh3WjdlTENHcDNzZTBTdHdOMENmRVZibzlMaVVrZ0FUV28rSXZZRzZEZXBh?=
 =?utf-8?B?TDlPTTdjNG9QekNBY2Y2Q2ppOVRjaDc2MERZR1g3TGlQS202RWRYM0tGRzdS?=
 =?utf-8?B?b0JaeHlObEtSZGJZVFZLdzBPZVFKVm8zYysyc2N2SXMvbU02YnRTZkVtY2RX?=
 =?utf-8?B?bFVDMk9rS3pBZ3hrcktDekRkQ2ZCWS82WlQyamRTY0RhcktjNGFNb2hCNFVi?=
 =?utf-8?B?Nks3bHVQM0Y0cnNLRlFqRkVON3gzTFVJVWlFcVUxcGV1c3VTeGRWS08zUmNl?=
 =?utf-8?B?QlRnZ0pwNkxXUGZrcWZSalBrZUF3WGE1RWNreXV6Q2s4Y1dqdEtKSzZzSHpo?=
 =?utf-8?B?WGZXak1ONEZKdU56WDlOeGJXN0RsYUV6QitMV05JYVd0YjJZcjh0dGhTakFi?=
 =?utf-8?B?WnBJU1BOOGZVWk52T1FuU1dqNnJ5dEpzYm9JNFk3M2xpeDN4QWdGTXdLd2dG?=
 =?utf-8?B?T3E1NzdQVVVtSTRnY2x0VEMrNDdROWM5S2xVK0pnZi9JVDBGWWUwdW83TjlG?=
 =?utf-8?B?SW9GSHFJL2dmV2pGYnBrVjNGc2pKTDEyTEg0N1JOY2xQWVlEbHlOaEJvQTZm?=
 =?utf-8?B?dTJjK01MWkIvbTFYWklKRHpjUzlnQjlmQ1k5OHNyL2REbk9yTmpwbVA1S0g3?=
 =?utf-8?B?RW9EeGNYM21ZUzVCam9BUDRwVW9FQ3pvc1JBS2Jxd0NNZnB1MkZyQ2hKNjR4?=
 =?utf-8?B?RThzRStJdGZzcTlGb1d4RzhEQ0FjN0hsenEvZ20rRE5VOHdpWnBlYXN5S3g4?=
 =?utf-8?B?a3Z1SGdhQ1gycDRNTStEOWV5YWVXWFZrdWpIbXpYeE94RzFaMkJWOFFDNVFl?=
 =?utf-8?B?eXh4Z055Mm5xZkQyTm50N3VEcU5iWXZUSHhtT1ZlemYxTFpXck9NT3NvNVkv?=
 =?utf-8?B?TnZvRkNJTVV4eElFWVNGdWoyclVpaWk2UkNxQjFBbm5RRWdtUW9MSEtyeG1y?=
 =?utf-8?B?Nmc2RDl3c1AxVmlEYTN0eFFEV1VTOHVUVEtuMmpDYlBzenRjcndnREZ0QmdL?=
 =?utf-8?B?cnRLdnRTUGZKbG4zelkyeTMwSk9ZSHljUTZoZmNLTTgxY29FK1ZObHJ6S3p1?=
 =?utf-8?B?ZEJBK3I3bWFyay8wa1RKQzJydm0ydjR0WEQwOWF6SU5KRDNNVytHYndCUk9o?=
 =?utf-8?B?NnlGSGtmbmZWSUpRM2VjMnl6RW0zTlVtNG4wb3g5eEZUdWZac1ZWWVNJQ3U5?=
 =?utf-8?B?cVlWQXVONDN2UXhrQjZHUTRvTnl4YTluN00wNGVURStLb3hUNmJnUGFhZnc5?=
 =?utf-8?B?Z2t5RnBpUXB1Tzk2cHFMelVqeTRSZElLb0RnZTVCbG50V1MydnhqQnl4cHo3?=
 =?utf-8?B?STlNK2dWUC9wZy8wZktCTmdGcUFHdFh4WXR1bVVZdzJwajJjMElZeWxDSW9w?=
 =?utf-8?B?U3B1Q0ZacENmdW1NeXhiU0VXZHkyb0dxMDNqY1FnWHNpY0lMWDJveVhZYkc0?=
 =?utf-8?B?RVBrdWw0R1M3cmxGbGJNQSt0ZWk2WkovUGZuYXpQNTl2MEFzV1A1djZMeTds?=
 =?utf-8?B?aERDbjFVQlVyUnBmWHZlSVc2T052Q1hvTHJad2xic3NkQ2U4Ris3WHZhNzNK?=
 =?utf-8?B?TmE3MER4eS9oeDZjU2JXTUZkMzRHT2pPR0pSYnk4N1hJL3VNMTZpSytZT05G?=
 =?utf-8?B?SDVncTE2WUhDa3JwbW8vZmdaN2hXRW9kQjBxZ1ZRWVQ0cjdpWjlESHJQRUVt?=
 =?utf-8?B?R0tRT1Nwcy9kOE9MKzFhczVOYkE3WkxUMEFUWFl2L1orRGJiSGxEdVdFZWhu?=
 =?utf-8?B?YVY1WDZMRVVZQytMa0hNZWEybGdJZnRNY3RKWk04eGI3bmM2VTRRd3d3YnJS?=
 =?utf-8?B?Tk1HTDhYYk1QYkFpSmhpalJ4RjVpbGJOeHVidG5PYmRzWnhnT041cVlyOHdD?=
 =?utf-8?B?cFl6OFV6Mkl4NXhEQ1hKdHFsdEtpZzgyWk02Sks2R3V2c0E5d3JWS3I1dEJB?=
 =?utf-8?B?bERNSWpaNTBCMnVHMFZqanVSMEEzMlp4SzVPcE5CK2hXZnpiTjBRNnNld1cx?=
 =?utf-8?Q?Bkk8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0121de-bc7f-463c-7f80-08dc698f962b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2024 03:34:20.0044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xb8W2Mj+C+4W/ii0nhIrTEzund8+BYKDmPWS/7+9pcG5Qcof0+tkMaz6bkgVN8twlkBxdLDFibpuzC5ddlfihA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8674
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

QEJyb3N0LCBNYXR0aGV3IFRoaXMgaXMgdGhlIGltcHJvdmVkIHZlcnNpb24gb2YgdGhlIGlndCBo
ZWxwZXJzLiBJdCBoYXMgc29tZSBjbGVhciBjb25jZXB0cyBvZiBjcmVhdGluZyBidWZmZXIgYW5k
IGNvbW1hbmQgYnVmZmVyLCBhbmQgY29tbWFuZCBzdWJtaXNzaW9uLiBXaXRoIHRob3NlIHNpbXBs
ZSBjb25jZXB0cywgd2UgYXJlIGFibGUgdG8gd3JpdGUgYW4gaWd0IHRlc3QgaW4gPDIwIExPQywg
c2VlIHBhdGNoIDIuDQoNCldlIG1pZ2h0IHN0aWxsIGZpbmUgdHVuZSB0aG9zZSBoZWxwZXJzIGJ1
dCByb3VnaGx5IHRoZSBjb25jZXB0IHNob3VsZG4ndCBjaGFuZ2UgbXVjaC4gDQoNCkRvIHlvdSB0
aGluayB3ZSBjYW4gc2ltcGxpZnkgZXhpc3RpbmcgaWd0IHRlc3RzIHN1Y2ggYXMgeGUtZXhlYy1m
YXVsdC1tb2RlIHVzaW5nIHRob3NlIGhlbHBlcnM/IERvIHlvdSBzdWdnZXN0IHVzIHRvIGdpdmUg
aXQgYSB0cnk/IElmIG5vdCwgd2Ugd2lsbCBqdXN0IHVzZSB0aG9zZSBoZWxwZXJzIGZvciBzdm0g
dGVzdCBvbmx5Lg0KDQpIaSBLcmlzaG5hLCANCg0KU2VlIGNvbW1lbnRzIGlubGluZQ0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJvbW11LCBLcmlzaG5haWFoIDxrcmlz
aG5haWFoLmJvbW11QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMzAsIDIwMjQg
MjoyOCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEJvbW11
LCBLcmlzaG5haWFoIDxrcmlzaG5haWFoLmJvbW11QGludGVsLmNvbT47IFplbmcsIE9haw0KPiA8
b2FrLnplbmdAaW50ZWwuY29tPjsgR2hpbWlyYXksIEhpbWFsIFByYXNhZA0KPiA8aGltYWwucHJh
c2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIFJGQyBpLWctdCAwLzJd
IGhlbHBlciBmdW5jdGlvbg0KDQpUaGUgc3ViamVjdCBjYW4gYmUgc29tZXRoaW5nIGxpa2U6IElu
dHJvZHVjZSBoZWxwZXIgZnVuY3Rpb25zIGZvciBidWZmZXIgY3JlYXRpb24gYW5kIGNvbW1hbmQg
c3VibWlzc2lvbiBldGMNCg0KT2FrDQoNCj4gDQo+IEludHJvZHVjZSBoZWxwZXIgZnVuY3Rpb25z
IGZvciBvYmplY3QgY3JlYXRpb24sIGJpbmRpbmcsIHN1Ym1pc3Npb24sDQo+IGFuZCBkZXN0cnVj
dGlvbiwgYXBwbGljYWJsZSBmb3IgU1ZNIGFuZCBvdGhlciB0ZXN0cw0KPiANCj4geGVfc3ZtIHRl
c3QgaXMgdmFsaWRhdGluZyB0aGUgaGVscGVyIGZ1bmN0aW9uIGludHJvZHVjZWQgaW4gJ2xpYi94
ZS94ZV91dGlsOg0KPiBoZWxwZXIgZnVuY3Rpb24nDQo+IA0KPiBJbiB0aGlzIHRlc3QgSSBoYXZl
buKAmXQgaW5jbHVkZWQgdGhlIHN2bSBmdW5jdGlvbmFsaXR5LCBuZXh0IHBhdGNoIEkgd2lsbCBp
bmNsdWRlDQo+IHN2bSBmdW5jdGlvbmFsaXR5DQo+IA0KPiBUZXN0IHJlc3VsdHMNCj4gcm9vdEBE
VVQ3MDMyUFZDTWVsbGE6L2hvbWUvZ3RhL3hlL25ldy9pZ3QtZ3B1LQ0KPiB0b29scyMgLi9idWls
ZC90ZXN0cy94ZV9zdm0NCj4gSUdULVZlcnNpb246IDEuMjgtZzM2NWY4MTY0NiAoeDg2XzY0KSAo
TGludXg6IDYuOC4wLXJjNS14ZWRybXRpcCsgeDg2XzY0KQ0KPiBVc2luZyBJR1RfU1JBTkRPTT0x
NzE0NDk4MjQ3IGZvciByYW5kb21pc2F0aW9uDQo+IE9wZW5lZCBkZXZpY2U6IC9kZXYvZHJpL2Nh
cmQxDQo+IFN0YXJ0aW5nIHN1YnRlc3Q6IHN2bS1iYXNpYy1tYWxsb2MNCj4gU3VidGVzdCBzdm0t
YmFzaWMtbWFsbG9jOiBTVUNDRVNTICgwLjAyMnMpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCb21t
dSBLcmlzaG5haWFoIDxrcmlzaG5haWFoLmJvbW11QGludGVsLmNvbT4NCj4gQ2M6IE9hayBaZW5n
IDxvYWsuemVuZ0BpbnRlbC5jb20+DQo+IENjOiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhpbWFs
LnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+IA0KPiBCb21tdSBLcmlzaG5haWFoICgyKToN
Cj4gICBsaWIveGUveGVfdXRpbDogaGVscGVyIGZ1bmN0aW9uDQo+ICAgdGVzdHMvaW50ZWwveGVf
c3ZtOiBiYXNpYyB4ZV9zdm0gdGVzdA0KPiANCj4gIGxpYi94ZS94ZV91dGlsLmMgICAgIHwgMTEz
DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGxpYi94
ZS94ZV91dGlsLmggICAgIHwgIDMyICsrKysrKysrKysrKw0KPiAgdGVzdHMvaW50ZWwveGVfc3Zt
LmMgfCAgOTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgdGVzdHMv
bWVzb24uYnVpbGQgICAgfCAgIDEgKw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNDUgaW5zZXJ0aW9u
cygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVsL3hlX3N2bS5jDQo+IA0KPiAt
LQ0KPiAyLjI1LjENCg0K
