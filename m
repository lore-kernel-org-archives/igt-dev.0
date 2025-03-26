Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7244C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 10:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C5410E6AE;
	Wed, 26 Mar 2025 10:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISz3s35g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFB310E6AE;
 Wed, 26 Mar 2025 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742986309; x=1774522309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J/jedWf24zOUyEAZgS/99ygMw6oOChzpPD+TIJ6aN/Y=;
 b=ISz3s35gdj7WfAAfTuSdX2DF2qHOZPiEqo95S+Q+ZixxY0Eu2lTHg7Yn
 i1NWyWTLoE7IK5cwQ51G4DjEJTjxXy508WtVI+gBgEJPMCOXuk/WjD2EE
 OUEIfhRlVWExZMsIgls2oCv0S96j6aY/ehqBmBvhkIgS9FYcw4prygfMv
 6zYSIHO9E2/BztNyE3k4NKe0WDUc5uscNRtlgvy20jvu00muX/u9LEvpp
 DCXzBoZZ9kwVTZR5vVqpzIz9b0USWr9iTMyKxWIAlcZEXMxu0xKSRfXOF
 FnjNqAOa7mRjTceK1JamBDIcJskq10Mr9uu3Z9vWMeyO/bYT/TeIRoWSB w==;
X-CSE-ConnectionGUID: 4+z81ErnQca/JR5cUiVpBQ==
X-CSE-MsgGUID: 0MAV60YgTLar/KZuMBvdSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43993282"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="43993282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 03:51:48 -0700
X-CSE-ConnectionGUID: oUmVwhbnQBmRO4a0fW7Gmw==
X-CSE-MsgGUID: M91CS39UT+WfD0TEfh3xYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="128871213"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2025 03:51:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 03:51:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 03:51:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 03:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+KxMvZmUEO6PWdHDQNbbcLC+o9JZ9wZbYipZH8QWqkfryfEIroHALAL3BbCtUlxBKjli/+QWLK6G9LfGKxE1gOOpf25ZD4Vx37e7uKcOFZSEUYxvMqGui64GjUfML+mNDDFyzS8/Ghg3ucUGnx+8CScwittdS7AjxRxso9ciy/Y3KWyu9kUuAKQVykXLywA9M2bGXqtmL+2CXUNQaAkEj24tOpv4nSiLVlb60YUHy3y7/4dAN/XbnPmw+yXsOmGimHmgndUmuQo+Bva+IS00+yJxzXc7hJ4VCDQo3j5nZgsrh/q0Jbis8Is7Bw6lkiwQ6t3nvYK4kV44RIkFKcg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/jedWf24zOUyEAZgS/99ygMw6oOChzpPD+TIJ6aN/Y=;
 b=jxDFfvwcx+Znu4/8fmYM21yNcAWz268orc+9r62u6+sfcqT5ZV18YKG/3h91Zm4mtTE9Qb42UqFAgNsAgE7A1S1GM6zVgSHT7iEbaLp/WRkI43tu6tl3X/YMp7SwJ9YG89M6QGGLx0FunvqIDO/cK8BpmGzcBiSmB4NeUYezRQOzigEeEftjgI8NywR/mMPtFbffUnRr1l2iVk9HxZEJ71cQIahq4D/96tdrhjFrY6OPOaiRD253cJnhtgnfmfN9kKTx+FWUL7LOykZXjB1HTu2MSEq9LXtzPL3o/TStaAVIFu60V0i+doO3W98EUs4cujXN9ahDiOGpwnC1EBAy6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 SN7PR11MB7640.namprd11.prod.outlook.com (2603:10b6:806:341::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 10:51:31 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%4]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 10:51:31 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2RzYzogdXNl?=
 =?utf-8?B?IGludGVsX2Rpc3BsYXlfY2FwcyBpbnN0ZWFkIG9mIGk5MTVfZGlzcGxheV9j?=
 =?utf-8?Q?apabilities?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBsaWIvZHNjOiB1c2UgaW50?=
 =?utf-8?B?ZWxfZGlzcGxheV9jYXBzIGluc3RlYWQgb2YgaTkxNV9kaXNwbGF5X2NhcGFi?=
 =?utf-8?Q?ilities?=
Thread-Index: AQHbnewCyyV1WEsDfk2d/Luo3nfTE7OFLTyAgAAQ0lA=
Date: Wed, 26 Mar 2025 10:51:31 +0000
Message-ID: <DM8PR11MB56557CFD902E48ED2E9B54F6E0A62@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20250325130842.1821042-1-jani.nikula@intel.com>
 <174295146489.3302.9664331582388144948@e6b6f09ec485>
 <8734f086j0.fsf@intel.com>
In-Reply-To: <8734f086j0.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|SN7PR11MB7640:EE_
x-ms-office365-filtering-correlation-id: 6e67f36d-7617-43fa-4471-08dd6c542b31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|13003099007|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?TXdEQ0k1b0lEdG1rYXlDNE9FbGQ5MG92YWFNc05Wa0xkbU9pbFRCanVzVlh0?=
 =?utf-8?B?UDlmZEVwaEQwNjlYU1J4UE9LblZEM3ZIS1AvZk1aMTQxbk1GTEJrSFpEYzNN?=
 =?utf-8?B?MFZlaEZOVWlTeWt3SEptNGdlb1VTNGtrUzdRVGRTYitWa0hWMEREdTlTeklv?=
 =?utf-8?B?a0lvbEtvS2VMZ3hYR3dERzJYTGZLeUE5cWwxaFZ5TlE4UlVBUnpCaGFYaWo1?=
 =?utf-8?B?REFva082TlVyeTZLK1RQZFBIclRGWXhLT3FKbGdrdlhsQU9FbTBRR2wxOHVK?=
 =?utf-8?B?THJJQ2dXb3RjaXU0K1UwOWR4VjZYelJVWXd1VFFUeTFwazRWa0orNjlYTjU1?=
 =?utf-8?B?OG1Ka2lJankwMzkzaUxqL3JIejBITHM5S041V3ZZcVlockFXUkZBdDdIOC94?=
 =?utf-8?B?NzNxdmNQTk53K2U0MFp1NjNxN1dlTTNpN3BCdWY5bXFhUFByS1VmdmZVQkU1?=
 =?utf-8?B?MnltT0k1b2JSV0lwanhvcW5CL0VCS1FUWGpmTmlzVko4Wm44MG50ZUphbThG?=
 =?utf-8?B?ZTdPVW9pa0lzK1ZoNGpEYVlDOERNZGxhYkpPdTllVU4yZGtCSkNUZS9hVC8x?=
 =?utf-8?B?dEdXMTFhUG43YUhyWThCY2ZsNk5ML0o0ajlUQkVDSHBFdnpGNnlqelBLR0dZ?=
 =?utf-8?B?VGh0OFZVWkxSblplT1BFNTZCWlVNTHZRTG5EVU1mR0l3VG5FZFNDQzBZUitw?=
 =?utf-8?B?UGZIN0RjUGdKajN0Njl0bDA2NW4zc2ZRL3BuVk9LaDhUNWJoNXAyemdlckhV?=
 =?utf-8?B?WE5QaHZnOXBlY3ZuanNSZGhWMVlzK1hiUnJ5REVab1NTcXNZQlFZVlNDTEQ1?=
 =?utf-8?B?TlVyaXNraEFHSS91YmI3QmloNXpVb0gvaU1NMUtNYTlBSjlwK1E4OVYrdGhS?=
 =?utf-8?B?czlVMUNPei85aHExcmE3eW1VSGVHVytROWRGS3ZvT2VSSVpPc2s2dE9zRm5T?=
 =?utf-8?B?b1BGeWl3QnJkcEdscVVCQlRUdmkyZStrUGp4OGp3eGxVYmNMWWRSMEQ0dWFH?=
 =?utf-8?B?NXhFcmFwcTB0SGlwWU0yY1o5VCt0MXNySVZFOGtEYndGSlVUQjF0Yi9NeDlG?=
 =?utf-8?B?VVY1SE00NktoTUgxWWJmTjVjWWsxUzZBYlBNdDdYR09wZ3JCeldFR3dwVGho?=
 =?utf-8?B?NmdkZ2ErMnZmZm81eG5pSkVQYTNaOExRMWZZeG1kdHBPU0lYTkNuNTNWaXFs?=
 =?utf-8?B?c2tPRVZ1enNvWTdnOGFvRnZHdWUwenh5bExEU2VoaGxLZkx1MWRHLzBYNm44?=
 =?utf-8?B?c1FjK29PWW14WXhNL3JCaFJJcHU0UndnTS9MODNIUFpFekJvVXpFOXZla0Fk?=
 =?utf-8?B?NlZvMFI3QjB6dFlxbHNtZXlNL01hVERQNVoxbEJ5VTVSTG85bHVQeElFSGI5?=
 =?utf-8?B?bjRjRlR4Ykx6OGFWVGp6WUxIdWIzZ1AxSWhaelZic00wbUpmSnZabDBCU1FL?=
 =?utf-8?B?MlZWN3RjK0F4NDVJYkYwZ1o5dHh6bGRzelpLcFRrSldCbU02R2s1SWNOV1h3?=
 =?utf-8?B?b2cvTDhIaGcrc1h3MXl5dy9hc2swTVcyQnN3TnpHNjRZeFo4dG4xeE1CTTdH?=
 =?utf-8?B?K1BMVDdWRHgvcDhIMkwyNEtjaDQxQWtJdW5lVUc3TCt4akhyeDViTXNVeTFF?=
 =?utf-8?B?dlU4OUZWWHpxN0lMU2ZGVE1PekhJT1Bzb3lzTlBTSjZIYXFuNm1vb0xTZHlL?=
 =?utf-8?B?RDJBZTlDUFVvTVNMS0JmWUZ1azFCMEh3NEM2eVR1bmZDVE9PVkp2c1JMSXVt?=
 =?utf-8?B?S3VJcFRtSGxHUEJBU0RMK1ZhL25kNVZPaitScU1JcmlHQmpvWTRmTFdMMFM1?=
 =?utf-8?B?c2R0bTFvdEdGQ0I0ekZzOSttS1dCaElzQUtuZE5XR3NZUzBpTm5GNUNoK1Ja?=
 =?utf-8?B?WGNtTkhEeWp5YmovOWoxc3p2Y0pvWC9UZGJ3QXAxYXltZWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3NJNFpNZ0d4cVhmczdVNXUyRlhkeHBITEZGU09HV3Rrd0J1OWRCVW9DNnRK?=
 =?utf-8?B?ZC9NMFBqL0tNNDlQbFNCS0FBRUo4RUdzMCtYbnFuVEoyUWlqYXEwVDd2TmFu?=
 =?utf-8?B?Si9MSHZlazJvbkREZWZZUlNDckkycWxJR05wQ1d2ZHNlaTBFSktrWHpJbSsw?=
 =?utf-8?B?WjZvWnhzQ3B5ZkRmRDNPWUdDcm9UYmszc0NRajNBTnJ3ZkFEd0ZBMmtVSGZV?=
 =?utf-8?B?TGQ5WDhsK1dSY3ZTaU5VWjdhYzl6aVA2eUZyTThaaUtoOWtpbzZjZmlPa3dr?=
 =?utf-8?B?RTBtN2Jqcy8rQWZJeVZQcEhzMzgyWlhWeGtuak8va0ErSFcvU2VveTJuMXIz?=
 =?utf-8?B?MjRBQ1RkZFU5UVJ3elB6RERmOUZuQU05eGFIU29XZGhnTlRzaTJxOVh3Z0Qw?=
 =?utf-8?B?TXdscXc1Y0dDZUszMEkzdjU1TTBOcWczVzR1SEEwczdOSnJxYnQwTGNQMDF2?=
 =?utf-8?B?VFo1UjNTWW5pWlZONWRwUTR0NHhvV2N3Nm1GM2lRV3VxZmE3dXRiVzl3R3Js?=
 =?utf-8?B?V3lWUE1ib1U1RGtYYVpocUZuaXVnQUZSNEtGcW9rQmlNaytOZmFKNHVZQmdv?=
 =?utf-8?B?bHdmUThkU3VMcVpKbllVTzAxTFdjd201cDlHSVZ5L0hWS1BXdXZPY3djdHpH?=
 =?utf-8?B?eWZiZkY1b0pGMXJLYW9HVkRIdUE1cVRXMXo2NlpFTTVKVHRyTHZ4ZXpaa0xi?=
 =?utf-8?B?WjdjZ1ZyNFAvR2tlUU9NUnU5Und4WmhmQXVRd1NBTHhBdUlTMm9TeFdPalJp?=
 =?utf-8?B?R3JUTGFOZkhmVEtUSTVBejlXekpxdENVM203dTJQMVUxQ0YxTnVKRXQzLzhi?=
 =?utf-8?B?cWxPRnNQbmNSeWlMTFVJOVErMUdMbnZvOTN2KzIzVE90U0I5WlNWaUFaRHQr?=
 =?utf-8?B?Sng3LzRndDl3K0VLd2ZOVG5xU3h0SlpHZURvOFJzbGtwaUtVUEpYNlhlVldV?=
 =?utf-8?B?TWphK0I2MTB4Tlg2clZad3JpRElBd09TY1lnWUZxUFFiVS9wU1o0bmltUHBk?=
 =?utf-8?B?dVh4cXQ4TjhGWEozL1NyTDNPK3dYa0xvS0J5bURCQ2VQeVVZdWhqWlViYTVI?=
 =?utf-8?B?amNnUjhwUm9ERmp3bVNKZm1XNFBjMFFGWGhveitncStRRzZYQ2hlZHB5UlVH?=
 =?utf-8?B?bG9OcmtBRUh5SDUxYzdiVFBBSHFqTCs2Nit4b0F6cU1zZEdtMGQxcmI1eXho?=
 =?utf-8?B?dWthSnlUQlBlNVI4MzgwYXFqNHNZV3ErSk5CL2pvbzNoUFlybDJGVmYwc25i?=
 =?utf-8?B?ZmltcDVIQTZKdjhPaHdyZVJ3T1Q2WDlrZUF4bE5ZUXJheFRzYzhhVUhyMjVX?=
 =?utf-8?B?ZCtjTWNWK3NqdjRrYVRHbFVSMTJUNkQ1bUY2Z2lSeGptdlRqZXNnR0FoaDk1?=
 =?utf-8?B?VFhBRGlXVjZMRHNyVTVnYUlyRE9sVEVlUHk0V01aMDFrWnpndGhMUUQyem04?=
 =?utf-8?B?bEFZc1NaODFraDhKRmNiMnRRZ1dvYXc0eVhLRWVCNTRwVTMrWjlzNDhBdUhr?=
 =?utf-8?B?K01RUUduME5lZU1yRk10LzZvY2dpNW8vYkpUUGpqbHpKM1craHlmOHN2N3pw?=
 =?utf-8?B?WkdoRDM1b0hWZFNtRzlzU21OV0h1SkcrRXRkUmdSektBbHFqVWlrb1dlTFcv?=
 =?utf-8?B?alBqMzRnRTkwVDN2UlJtZW0vTk9ua3hEOWw3Zk5FRVFYNGtVdnBDMlEyN0Mr?=
 =?utf-8?B?SDM1b0FNVTl6R3RNYkZiWFBDL3dxRnBKS2N2L2lIYzZkK1JoUEhSTTFTYzZm?=
 =?utf-8?B?MUxaRzFDZjVqVWlUV3RJN1BqcXJzdURHblJzK2ZwMm8vOXBKTjl2TFNoNGVS?=
 =?utf-8?B?U3hNTjJDdE9GWlV6cFlwRmIxRzBhcm4zYUc5RW03cDNYT2FwSEpzaWdORFB0?=
 =?utf-8?B?QnlVTWJaa20vMUUrZ2V6dVVYK2pqcEk3c1l0eHZIdUNHcy85TFZubFBXSHFN?=
 =?utf-8?B?cFJVUFIxR1hxN0Y2Rzc2QllhMk1pSXppTWx4WlVrNVRGeHRjb1dWVHByQmpR?=
 =?utf-8?B?VGZqL1dKZFdXRXA4czNYbWVYYW1taHNFZzN2em40eDVHbVFWVVU3MTk2bDFB?=
 =?utf-8?B?bTZVUXhTM1hSUy9YZS9wN0JQODBRYzljanpPYTd5c3ZYRDQ3dURBZGFQQXJG?=
 =?utf-8?Q?b9SRWBHO6hrkJIJDLjZfoWPhf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e67f36d-7617-43fa-4471-08dd6c542b31
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 10:51:31.3658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SsclIDNzIBCP7reHALilBDRKln8WBZQI7QMv+uc0UKfHf+UZcdEEhcMide1UbQj8ol5fK6sGv3KC5pAsa1fghg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7640
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

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmFuaSBOaWt1
bGENCj4gU2VudDogV2VkbmVzZGF5LCAyNiBNYXJjaCAyMDI1IDExLjUxDQo+IFRvOiBJOTE1LWNp
LWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGli
L2RzYzogdXNlIGludGVsX2Rpc3BsYXlfY2FwcyBpbnN0ZWFkIG9mDQo+IGk5MTVfZGlzcGxheV9j
YXBhYmlsaXRpZXMNCj4gDQo+IE9uIFdlZCwgMjYgTWFyIDIwMjUsIFBhdGNod29yayA8cGF0Y2h3
b3JrQGVtZXJpbC5mcmVlZGVza3RvcC5vcmc+IHdyb3RlOg0KPiA+ID09IFNlcmllcyBEZXRhaWxz
ID09DQo+ID4NCj4gPiBTZXJpZXM6IGxpYi9kc2M6IHVzZSBpbnRlbF9kaXNwbGF5X2NhcHMgaW5z
dGVhZCBvZiBpOTE1X2Rpc3BsYXlfY2FwYWJpbGl0aWVzDQo+ID4gVVJMICAgOiBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0NjczNi8NCj4gPiBTdGF0ZSA6IGZhaWx1
cmUNCj4gPg0KPiA+ID09IFN1bW1hcnkgPT0NCj4gPg0KPiA+IENJIEJ1ZyBMb2cgLSBjaGFuZ2Vz
IGZyb20gSUdUXzgyODQgLT4gSUdUUFdfMTI4MjkNCj4gPiA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4NCj4gPiBTdW1tYXJ5DQo+ID4gLS0t
LS0tLQ0KPiA+DQo+ID4gICAqKkZBSUxVUkUqKg0KPiA+DQo+ID4gICBTZXJpb3VzIHVua25vd24g
Y2hhbmdlcyBjb21pbmcgd2l0aCBJR1RQV18xMjgyOSBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4g
PiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiA+DQo+ID4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9y
dGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gPiAgIGlu
dHJvZHVjZWQgaW4gSUdUUFdfMTI4MjksIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkx
NS1jaS0NCj4gaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ID4g
ICB0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZh
bHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4gPg0KPiA+ICAgRXh0ZXJuYWwgVVJMOg0KPiA+IGh0dHBz
Oi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI4MjkvaW5kZXguaHRt
bA0KPiA+DQo+ID4gUGFydGljaXBhdGluZyBob3N0cyAoNDEgLT4gNDApDQo+ID4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiAgIE1pc3NpbmcgICAgKDEpOiBmaS1zbmIt
MjUyMG0NCj4gPg0KPiA+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gPiAtLS0tLS0tLS0tLS0tLS0t
LS0tDQo+ID4NCj4gPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2
ZSBiZWVuIGludHJvZHVjZWQgaW4NCj4gSUdUUFdfMTI4Mjk6DQo+ID4NCj4gPiAjIyMgSUdUIGNo
YW5nZXMgIyMjDQo+ID4NCj4gPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gPg0K
PiA+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzOg0KPiA+ICAgICAtIGJh
dC1ycGxwLTE6ICAgICAgICAgW1BBU1NdWzFdIC0+IFtBQk9SVF1bMl0gKzEgb3RoZXIgdGVzdCBh
Ym9ydA0KPiA+ICAgIFsxXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9JR1RfODI4NC9iYXQtcnBscC0NCj4gMS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91
bmRzLmh0bWwNCj4gPiAgICBbMl06DQo+ID4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xMjgyOS9iYXQtcnBscC0xL2lndEBpOQ0KPiA+IDE1X3NlbGZ0ZXN0
QGxpdmVAd29ya2Fyb3VuZHMuaHRtbA0KPiANCj4gVW5yZWxhdGVkLg0KTG9va3MgbGlrZSBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzEzNjk2
IA0KPiANCj4gQlIsDQo+IEphbmkuDQoNCkJyLA0KSmFuaSBTDQo+IA0KPiA+DQo+ID4NCj4gPiBL
bm93biBpc3N1ZXMNCj4gPiAtLS0tLS0tLS0tLS0NCj4gPg0KPiA+ICAgSGVyZSBhcmUgdGhlIGNo
YW5nZXMgZm91bmQgaW4gSUdUUFdfMTI4MjkgdGhhdCBjb21lIGZyb20ga25vd24gaXNzdWVzOg0K
PiA+DQo+ID4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiA+DQo+ID4gIyMjIyBJc3N1ZXMgaGl0ICMj
IyMNCj4gPg0KPiA+ICAgKiBpZ3RAZG1hYnVmQGFsbC10ZXN0czoNCj4gPiAgICAgLSBiYXQtYXBs
LTE6ICAgICAgICAgIFtQQVNTXVszXSAtPiBbSU5DT01QTEVURV1bNF0gKFtpOTE1IzEyOTA0XSkg
KzEgb3RoZXINCj4gdGVzdCBpbmNvbXBsZXRlDQo+ID4gICAgWzNdOiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84Mjg0L2JhdC1hcGwtDQo+IDEvaWd0QGRtYWJ1
ZkBhbGwtdGVzdHMuaHRtbA0KPiA+ICAgIFs0XToNCj4gPiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyODI5L2JhdC1hcGwtMS9pZ3RAZG1hDQo+ID4gYnVm
QGFsbC10ZXN0cy5odG1sDQo+ID4NCj4gPg0KPiA+ICAgW2k5MTUjMTI5MDRdOg0KPiA+IGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTI5MDQN
Cj4gPg0KPiA+DQo+ID4gQnVpbGQgY2hhbmdlcw0KPiA+IC0tLS0tLS0tLS0tLS0NCj4gPg0KPiA+
ICAgKiBDSTogQ0ktMjAxOTA1MjkgLT4gTm9uZQ0KPiA+ICAgKiBJR1Q6IElHVF84Mjg0IC0+IElH
VFBXXzEyODI5DQo+ID4NCj4gPiAgIENJLTIwMTkwNTI5OiAyMDE5MDUyOQ0KPiA+ICAgQ0lfRFJN
XzE2MzIwOiBhZmMyZTFmZWEwYTQwNmVlZGJhZjYzMmU5NmNkYjY4MzJhNDVlYmI3IEANCj4gZ2l0
Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZ2Z4LWNpL2xpbnV4DQo+ID4gICBJR1RQV18xMjgy
OTogMTI4MjkNCj4gPiAgIElHVF84Mjg0OiA4Mjg0DQo+ID4NCj4gPiA9PSBMb2dzID09DQo+ID4N
Cj4gPiBGb3IgbW9yZSBkZXRhaWxzIHNlZToNCj4gPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyODI5L2luZGV4Lmh0bWwNCj4gDQo+IC0tDQo+IEphbmkg
TmlrdWxhLCBJbnRlbA0K
