Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A684C9EC98
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 15:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FCE10E29C;
	Mon, 12 Jan 2026 15:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJI14LZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7037610E40E
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 15:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768233264; x=1799769264;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K3w0h0WVUxwxS2tS9NgW2GClDEiQZqZWZCV8Jf+V9aU=;
 b=cJI14LZztXNssMI57/g1KkG8sw2vkVTJmkjAF/dWpHuoOa1oCTogv97w
 wHplqZf+vpPmBw9JMpABCLHsVqEZYRgs8/5BCkZ3aZj8ZnOjkAW98IM+S
 FtX3ZsAQEYL62niogkE634LvPauWtuEL6xifwPvMh6yHT3bELGeJhMutN
 Dqutu1cfX0siIOJvezL/h+BrntAQ6inG6Wzko9WOHVpxTHrUzoDED6R/e
 rCSmmH6BRm51DQp8WbqeAdET/w6qFLxFn5E1KIa1OLUC7OG2+qjF6gY5T
 JB+zvW8Z/JwUttqv1phd2dOpqMM1PTXNTaIknKaiUV038UJeRRpyLpAc1 g==;
X-CSE-ConnectionGUID: jzqpgmjGTCuM9qkIMd8nyg==
X-CSE-MsgGUID: 4tD2JCavRUyUHhQAnNbBJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69564215"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="69564215"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 07:54:24 -0800
X-CSE-ConnectionGUID: tVTBga+dTIWbnlLpCZ1cKA==
X-CSE-MsgGUID: KiKtvlP/TG2RnLnmQtbQAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204528869"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 07:54:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 07:54:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 07:54:23 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 07:54:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHPFA/Nwf4z83OOuAPe2LRlAMPl6yCMt9/GAylcvvrzlrI5DTeq0gRXBXHU2mBWCNeDrqQBNe4gHfuAfowqK+l1Ldr+33taCNplUcuC0q3mqf5qJ30QeNRZL9eydUqZxWQtCFXYPZWit6lVZbv9iM4zKRamcdb/ccDM56f69ox2T6pWhI9/n5yznkP/yJS5TYd1pxf/qMMr/Zm5V6HaqRgjdaxQw3dnhuGofsLsShw+8w5nvvFirWCZsaNwA1nifzjHPivpp5b9gHkyjMKsni8KCspVsiF+yjfZzvDe7i+MaumT5zbVmt0u8/cKTh9nphw6sU7AglrCPPqMSzWuQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3w0h0WVUxwxS2tS9NgW2GClDEiQZqZWZCV8Jf+V9aU=;
 b=v9VXht8+IiEmpSTzflY1IuuUV02d/X7U68jNPNSv9Xld7m8z1WcQ5SBb7WD/tOhGKHBzeZdcn99H2SRlbiVkI7UFPINPJ9V2bu8vUlfxcS1Myw33ZrAuoVwfIV581wzq+Js2tE8w5Rc1bKtc6GWmsY7JbAoswUosePMPk4+IkVQE+eIajfkZadUuCFSy3qpjfQ+LUuG9Z+SfrWOm+/7rWIiT8SqyJ8gRwgi638hlPH16lU5uLexKoG8+cBNXrzc1nZGyj3i/FR1i9b1UVik7krMkhcVPszQWFwidqEq67cpKB9R9Vlmx74g0j9ZhGOgsALekipFH05bSaiXHoWKiSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:54:21 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 15:54:20 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t v4 5/6] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v4 5/6] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHcZDa3QsEVmBu8ukac424KbcWiQbVOejeAgAB0hBA=
Date: Mon, 12 Jan 2026 15:54:20 +0000
Message-ID: <PH7PR11MB6796CC031499E94F45350D4AE581A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
 <20251203094307.3187669-6-sowmiya.s@intel.com>
 <20260112085621.rbpmfwlt4yitp3l4@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260112085621.rbpmfwlt4yitp3l4@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|PH7PR11MB6836:EE_
x-ms-office365-filtering-correlation-id: e6722b59-d72d-435d-07e2-08de51f2d995
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SmliaGp0Unp5SXQyT3IydnlYK0NxdkFQdnlXU2VENkUzN1Z6alplb2J5MmNx?=
 =?utf-8?B?dUlXTEVxMjRpR0t4WGJFR2xqdjZVTkxtY1g1L2dleGVhRWRZeE5ad2JWUFNF?=
 =?utf-8?B?VjlpZ0RxU1hXR2FFanBHNDd2ampuQzM0STBoU1lOSHlXWDloVDY5UWN6bGFU?=
 =?utf-8?B?aU9za3BCbzNpRVhUbE40bXZ2a0dPeUJkSGtHekZ0WnFyemVOb1dpWCtBeC9j?=
 =?utf-8?B?amg4Z2VCRkFKajdCSUVOaU8rY01XOXdtSFE5YWtscXJWUXduMWlhQkpSeGc1?=
 =?utf-8?B?WjlpekYxeXVLWDhnQTI2VGlMRW1PR1BLWTBBalJYa0hnbFNJKzJRL0t0cGVE?=
 =?utf-8?B?NUFtam54aENBOTBFTkk3TEZjS242NEZSNER5dm5VbkFyNHhIY1YvTVpyOXJD?=
 =?utf-8?B?bmN6NHZhWDA3dnBjRllpTkFJM1ZNZk40bDNkbjc0SlNxaFI3ZnhKWE9DMFN4?=
 =?utf-8?B?SUcwamxYOFYxSTlKQXJWQWNCb2w1VjFXNEJWVk5pL0xOVGlEK3BpZGZkL2ZW?=
 =?utf-8?B?YXRQeXFnRXFRWjdCditLN0pmSUNDZEtoUDljSEpTNVR0RFRjNnNnblgzV0xO?=
 =?utf-8?B?WThma1JWOHB5a3dwK1B0V3hQelpUd0tubHloTGRnK1JBalBrKy83TVZSZ0tk?=
 =?utf-8?B?b2drT3Y3NHRIazk0QVBhMWVTWXdlaXBLRFBNWklXbHdvcXljRk9RM2c4ekZP?=
 =?utf-8?B?SzJveXdKeGdCaUJmNGFBa3VSQy8wemJxbjdZZ0Fac2FZcmFSRFZkZ0c4U1pl?=
 =?utf-8?B?MGM4bHdkdmE0bGY4UFFOcDhLT2VHdzV6RndveU43SlpLMGFZRWoyZGZoNy91?=
 =?utf-8?B?T0UvTExTTzVVNStrQ0p6VmZuMmxWUVZEWDdQcWwyeExDNlBPbTg4Ukc3cXk5?=
 =?utf-8?B?blpzZFI4ZWFERHU4OWsybFFyVnpNNWhoMEl0Y05JOVZucnFjSm0rbnk0ZktV?=
 =?utf-8?B?aEZOTERmejlMaHBkTmtVT3JhZGhsNTAvNit5NGd4TDVCYkZrcVJiY3diQ2Nr?=
 =?utf-8?B?RTlraDcyQzBsb2dBOVVPeGhkVm9SZDNxekJrYUsxUEFGS0NUTzc3TDRMWll3?=
 =?utf-8?B?V09kK2JVUE9BMWRyZUUwYXp4ZmYzUWxmejZMWmllYUo5RGJWZzNzM2VlVzFt?=
 =?utf-8?B?TSsvcmw3UVBvVXRHWmdBTUtWbjdyYllmaExXN2JNRnR4Zkd1aEJzeEpNRVY4?=
 =?utf-8?B?eVZZa25nLzVndzdSQ0hXMjA0SU0xQVYxVjFsRVJnRnA0em1TSUIzQ01ZK2pZ?=
 =?utf-8?B?K3dyUHVjaCtmS042UXg3OUVwTDZrTmVGVklCNG9SUEhSNzJlZVBZV3N6Kzdk?=
 =?utf-8?B?TTh4SXVuTllwMXo0VXMwNzdxR0daSkNZMGxnRVlCdXl5YTZyU3dsMVF4bDZp?=
 =?utf-8?B?WnFkZHBnQjIvTVphY0cwRTVMRUVHbE1sTUo3Q0pKQlBDdVlmODhnajIrVGNK?=
 =?utf-8?B?azRBVnFBckJOQkUyNmRyNDdQRE1BK2pJRXYrSjJjWGp2UlZBeTFaaGZwc29U?=
 =?utf-8?B?MkhVRkpTS1lIc3FzVXZPSnhzeVU4cDB2Z3Z5Q1ZMU0loTVloMS94Nmt5KzJD?=
 =?utf-8?B?UXIwRDB6MFlEOXVheEVQV0N3MXB0dEtuZ2lWVDJaanJlbm1DdzdLWklDUTBp?=
 =?utf-8?B?U2htVHZNeDlOZEI3K2JWQlBkSU9FUWxsajBzbXZXakFwc29POXJPTW5RMGIr?=
 =?utf-8?B?a3NQaUpuSHhMM2N3L2tuSy94a3UwYUpzeEhXSkhUY3lxd3ZVNWhlRTVzL1JY?=
 =?utf-8?B?UXhzWEFKUnlJRU9hSnpjT2RjbndYR0VmK3BlNjFvL2lEN2swTXJIWnhBUHhu?=
 =?utf-8?B?eG8ralZTbmErbmRNWFVNTHBVVmJPcXVCa3B6bjBoRi9EakpJeWZiWVF4elY1?=
 =?utf-8?B?MlBNRGlHb2UvUHBHOTZQNkx6bG5mK1laWDVwUU12SUlWcTF3QTIzUHI4L3Js?=
 =?utf-8?B?T004UEdQYWNzaVZhaVJQUGFhV0hLMndDRmxiZEVNQm5GY2E5Q3BkbDBNaUpr?=
 =?utf-8?B?UTlkNm9aQ0pnWER4TXpzclRFYTh4dkNUNElWZncrQ1lBZ0thSU1jWmJuVGIz?=
 =?utf-8?Q?wuI1YB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eStMNzZTS1FObnZnSGhVVExVMTJRb011ZThPeWJ1Ry85Smc5ZjJPbmJ0ZUMy?=
 =?utf-8?B?N1NXbmRmaGZLR0hFUUF2SVdtN0EzMEhwSzdXZFhZRVJhZzgwdnYwZ0ZxcXdz?=
 =?utf-8?B?SmRwU2t1RWFIdHRhV01jVVdxYTFmUC8zQjNwenR6Ri8yZU5oUE01cm5MWGx2?=
 =?utf-8?B?UnVVVnl0amtlMlV6cG9sNFlHU2dpOHFFcTUvNkRHcUpHcXpFZC9qcnBwKzg3?=
 =?utf-8?B?Q3kyT2k4VzEvSDVxa0psNFc1MGhVT01iRGMxRkpSVnNUMEdvUW5kWGRUbUxr?=
 =?utf-8?B?RXhqNU41SlBnWjdrMWs1UWdMVkwzaTZTaUg3SFpqa0psZUNTK3h6cEU4Y3pV?=
 =?utf-8?B?eW40UVNsY0tuN2tLdDlWS3pYT21yMURBK004Z2pvd2hBZDlUSndGM3RSamxG?=
 =?utf-8?B?M0FGd1IyUXMzQWFOR0Zxdzh0eGhaMHlhc2ViRHU0NDRndS9WdDQ3bFkzUVNQ?=
 =?utf-8?B?b0xRSlJoVlhEaXllOU9COUxWZ0YwL1ZXN2pMSkJGRGxveWVocnMwZXRZK3FR?=
 =?utf-8?B?NElIOWNSVHBlRkFDUkhFSXdYblYya3U1THZvK2ptTmV1MkMvUExLVDNCYkNE?=
 =?utf-8?B?SGxGOFovZzRTMm9Xa3RURTAwWDRnZXBnRlVmVVpVWmJPTE5Gb3UxWGJaTzEw?=
 =?utf-8?B?MmdDcVhtdEZWZTd6cm16S1pHc2lXbVVKbUZPYUhuMkRLWUhXbGdyYi9OT3g0?=
 =?utf-8?B?ckIzdU1ZWHpuZjZDWmsvTzVqeHpIUU9PSElWSy8vMEcvcFk3bHFabXJ1WlAr?=
 =?utf-8?B?UXV1MkJCeXF2Q0NBUkxBY2wzb2taTlU5cnVnOXludUUwRlF3ZFdtRFZKd0kr?=
 =?utf-8?B?S3oyU2VYa0g5bHp4czVlZmZpWEhnaVZySVdmZUJZeWowREprTXAyeGY3WVBQ?=
 =?utf-8?B?OCtMQWRhRHZ1OVljZWxpY3pDQURlOWZsSHRnTDRvT0xSby9RRXp1RG9ydzlK?=
 =?utf-8?B?c2t3VUlCTTRwd0N2WnIrT1ZtQ3dTOW9DZVVqSDMzMW4ybmRsUzA3M0FYTTdr?=
 =?utf-8?B?Y3VLTHJxV1REOUlOdi9HejBrT1NISXBMdmc5bDRKUU8va3J3UjhqYnU4b203?=
 =?utf-8?B?L3BFOTVyV09WM280S2JveEZ0NTJpV3UvTHJsaUpWZGc3V3hscmovRXRZTHNR?=
 =?utf-8?B?bXEzdHo5emJsN0g3eE5FNFRJVmdFaGRjMnF6eWZnSW1VR3ZxNjhzTlRXZU9J?=
 =?utf-8?B?eVlDdUp5THZRbjJTdDJmZTdSWGp1ZnRDaXlpak0wei9JMGJwTmtNazNKQjhH?=
 =?utf-8?B?NDF5VGs0ZHh3TWQvZC9BMjlqVHZyc3NXZkt4a1ljbEczVzhwV0cyT2oxeUha?=
 =?utf-8?B?TjlJWHVsaTd1SDlGWkVPY0IzNHFNNGJrdjNiamdzSnZkcURHQUpGR1diL0ZK?=
 =?utf-8?B?YjF6cnhMNmtGb25jQ3ZsZXYxQ3V1VE9XU0pCc1ppMHN0dXVha3Y0cVJIVFc5?=
 =?utf-8?B?dlFya1FveWE4Sm5rY0ZMOU51dXFXc2drbFp5Z2RJd1ZTZ2lVUnR0djF4WVpP?=
 =?utf-8?B?OFhIN2F1dDBQYmhZcGxMMzlCWkNDOTB1eFkxbFdZSFJYK2h6aUJIQ1M5Rmp5?=
 =?utf-8?B?dFRpUkN2OEpiTkpuOUJCZzR4Q1ljRUtibnNraXRxOTEyRVEzN0pKekJaMUJH?=
 =?utf-8?B?aFhLMVNiejBQdmg5czJ4cm9Edm1sL1JZNzduYzdFTnB4bEtsbHdUT3ErdVZL?=
 =?utf-8?B?NGgrcDNCK3RCOEtqNjVlTERqRlRMMG1kNFdLRXphZGI2UDZRa2V5cFc0OWNE?=
 =?utf-8?B?STVRd1Q2VkZ1NFFDY2pnZ2NFazdkSVNUY3NzaklOOERUT251QllzYnlJSkhh?=
 =?utf-8?B?a2JlVllpRzhlTUdiSis0NStpbUs2YnVxdkdCcDdWMk0rVTdRSzkxQzhId3Fv?=
 =?utf-8?B?cGhzNmxNQnBxUitNdERVbEVkQkpDNmZrL2hYL1hLSzh2Mk8vM3Z0U1BnUE9U?=
 =?utf-8?B?eFRmK3R3V3Z0THNtLzlncDVkQ1BldGlGLy9ISk1Fc09jY01wLzBVWm1BZVly?=
 =?utf-8?B?azhGOHYxL2xVM2JQa0plZWJreFRkMWU1UlVjbTRBV2NEdWtzbXNFemtrcHFT?=
 =?utf-8?B?amJpNy8wWlNnSUJKRURSaUc5ZTJtZjZhWlNNSHRsNGhDYnJqR0U0QXFPdnFX?=
 =?utf-8?B?b2xGNWI1aE5QOEJhd0xXWHJiY3BwR3JUTzhveWkvaStSTGpnZytObzBxeUNq?=
 =?utf-8?B?LzZGNFdHdjY0UFREL3Z0RVJ0eG1hYlV0c3RyaVVNcU92ZTNVdUZEYWdraWlw?=
 =?utf-8?B?MDV0L3pMdkNqYm0weGtWejFrUlB6UXlDZ1lyd0hSTEJ5anE4NWRHSEdxVHYv?=
 =?utf-8?Q?7iyFGYCLdu21Y/IIAl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6722b59-d72d-435d-07e2-08de51f2d995
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 15:54:20.6743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qGs8CRFgf/m5zQLIHTe/gYVVq5TQeBr5BWOr5gQ7WLD4LTmiNeLv8KyGYJLVOzX7gFu1s7v6qT8lMkaotL96eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
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

SGkgS2FtaWwsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwg
S29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAxMiBK
YW51YXJ5IDIwMjYgMTQ6MjYNCj4gVG86IFMsIFNvd21peWEgPHNvd21peWEuc0BpbnRlbC5jb20+
DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU2hhcm1hLCBTd2F0aTIgPHN3
YXRpMi5zaGFybWFAaW50ZWwuY29tPjsNCj4gS2FuZHBhbCwgU3VyYWogPHN1cmFqLmthbmRwYWxA
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IHY0IDUvNl0gdGVzdHMva21z
X3dyaXRlYmFjazogUmVmYWN0b3Igd3JpdGViYWNrLWZiLWlkDQo+IHN1YnRlc3QNCj4gDQo+IEhp
IFNvd21peWEsDQo+IE9uIDIwMjUtMTItMDMgYXQgMTU6MTM6MDYgKzA1MzAsIFNvd21peWEgUyB3
cm90ZToNCj4gPiBSZW1vdmUgaW5kaXZpZHVhbCB0ZXN0cyBmb3IgZWFjaCBmb3JtYXQgZm9yIHRo
ZSB0ZXN0IHdyaXRlYmFjay1mYi1pZA0KPiA+IGFuZCBpbnRyb2R1Y2UgZHluYW1pYyBzdWJ0ZXN0
IGdlbmVyYXRpb24gYmFzZWQgb24gdGhlIGZvcm1hdHMNCj4gPiBzdXBwb3J0ZWQuIEZyYW1lYnVm
ZmVyIGNyZWF0aW9uIHdhcyBub3cgcGFydCBvZiB0aGUgc3VidGVzdCBsZXZlbA0KPiA+IGJhc2Vk
IG9uIGZvcm1hdC4NCj4gPg0KPiA+IHY0OiBzcXVhc2hlZCB0aGUgRkIgY3JlYXRpb24gZnVuY3Rp
b24gd2l0aCB0aGlzIGNvbW1pdA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU293bWl5YSBTIDxz
b3dtaXlhLnNAaW50ZWwuY29tPg0KPiANCj4gVGhpcyBjaGFuZ2UgaW50cm9kdWNlIGVycm9yIGlu
IGJ1aWxkaW5nOg0KPiANCj4gRkFJTEVEOiBkb2NzL3Rlc3RwbGFuL2ttc190ZXN0cy5yc3QNCj4g
RVJST1I6IE1pc3NpbmcgZG9jdW1lbnRhdGlvbiBmb3IgaWd0QGttc193cml0ZWJhY2tAd3JpdGVi
YWNrLWZiLWlkDQo+IEVSUk9SOiBVbm5lZWRlZCBkb2N1bWVudGF0aW9uIGZvciBpZ3RAa21zX3dy
aXRlYmFja0B3cml0ZWJhY2stZmItaWQtDQo+IFhCR1IyMTAxMDEwDQo+IEVSUk9SOiBVbm5lZWRl
ZCBkb2N1bWVudGF0aW9uIGZvciBpZ3RAa21zX3dyaXRlYmFja0B3cml0ZWJhY2stZmItaWQtDQo+
IFhCR1I4ODg4DQo+IFBsZWFzZSByZWZlcjogZG9jcy90ZXN0X2RvY3VtZW50YXRpb24ubWQgZm9y
IG1vcmUgZGV0YWlscw0KPiANCj4gVGhlcmUgaXMgb25lIG1pc3Npbmcgc3VidGVzdCBkb2MgYW5k
IHR3byBub24tbmVlZGVkLiBQbGVhc2UgZml4IGl0Lg0KPiANCj4gQUxzbyBsb29rIGludG8gYnVp
bGRpbmcgbG9nIGluIHBhdGNod29yay4NCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KDQpJ
IG1pc3NlZCB0byB1cGRhdGUuIEkgd2lsbCBmaXggaW4gbmV4dCByZXZpc2lvbi4NCg0KUmVnYXJk
cywNClNvd21peWENCj4gPiAtLS0NCj4gPiAgdGVzdHMva21zX3dyaXRlYmFjay5jIHwgNzQNCj4g
PiArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS90ZXN0cy9rbXNfd3JpdGViYWNrLmMgYi90ZXN0cy9rbXNfd3JpdGViYWNrLmMg
aW5kZXgNCj4gPiA2NzI1ZjVlYTMuLmQ1NGQ2NDliMiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9r
bXNfd3JpdGViYWNrLmMNCj4gPiArKysgYi90ZXN0cy9rbXNfd3JpdGViYWNrLmMNCj4gPiBAQCAt
NTEsOSArNTEsNiBAQA0KPiA+ICAgKiBTVUJURVNUOiB3cml0ZWJhY2stY2hlY2stb3V0cHV0DQo+
ID4gICAqIERlc2NyaXB0aW9uOiBDaGVjayB3cml0ZWJhY2sgb3V0cHV0IHdpdGggQ1JDIHZhbGlk
YXRpb24NCj4gPiAgICoNCj4gPiAtICogU1VCVEVTVDogd3JpdGViYWNrLWZiLWlkLVhSR0IyMTAx
MDEwDQo+ID4gLSAqIERlc2NyaXB0aW9uOiBWYWxpZGF0ZSBXUklURUJBQ0tfRkJfSUQgd2l0aCB2
YWxpZCBhbmQgaW52YWxpZA0KPiA+IG9wdGlvbnMNCj4gPiAtICoNCj4gPiAgICogU1VCVEVTVDog
d3JpdGViYWNrLWZiLWlkDQo+ID4gICAqIERlc2NyaXB0aW9uOiBWYWxpZGF0ZSBXUklURUJBQ0tf
RkJfSUQgd2l0aCB2YWxpZCBhbmQgaW52YWxpZCBvcHRpb25zDQo+ID4gICAqDQo+ID4gQEAgLTUw
Nyw2ICs1MDQsMjUgQEAgc3RhdGljIHZvaWQgY29tbWl0X2FuZF9kdW1wX2ZiKGlndF9kaXNwbGF5
X3QNCj4gKmRpc3BsYXksIGlndF9vdXRwdXRfdCAqb3V0cHV0LCBpZ3QNCj4gPiAgCWlndF9yZW1v
dmVfZmIoZGlzcGxheS0+ZHJtX2ZkLCAmb3V0cHV0X2ZiKTsgIH0NCj4gPg0KPiA+ICtzdGF0aWMg
dm9pZCBjcmVhdGVfZmJzKGlndF9kaXNwbGF5X3QgKmRpc3BsYXksIGlndF9mYl90ICppbnB1dF9m
YiwgaWd0X2ZiX3QNCj4gKm91dHB1dF9mYiwNCj4gPiArCQkgICAgICAgdWludDMyX3QgZm9ybWF0
LCBkcm1Nb2RlTW9kZUluZm8gKm1vZGUpIHsNCj4gPiArCWludCBmYl9pZDsNCj4gPiArDQo+ID4g
KwlmYl9pZCA9IGlndF9jcmVhdGVfZmIoZGlzcGxheS0+ZHJtX2ZkLCBtb2RlLT5oZGlzcGxheSwN
Cj4gPiArCQkJICAgICAgbW9kZS0+dmRpc3BsYXksDQo+ID4gKwkJCSAgICAgIGZvcm1hdCwNCj4g
PiArCQkJICAgICAgRFJNX0ZPUk1BVF9NT0RfTElORUFSLA0KPiA+ICsJCQkgICAgICBpbnB1dF9m
Yik7DQo+ID4gKwlpZ3RfYXNzZXJ0KGZiX2lkID49IDApOw0KPiA+ICsNCj4gPiArCWZiX2lkID0g
aWd0X2NyZWF0ZV9mYihkaXNwbGF5LT5kcm1fZmQsIG1vZGUtPmhkaXNwbGF5LCBtb2RlLQ0KPiA+
dmRpc3BsYXksDQo+ID4gKwkJCSAgICAgIGZvcm1hdCwNCj4gPiArCQkJICAgICAgRFJNX0ZPUk1B
VF9NT0RfTElORUFSLA0KPiA+ICsJCQkgICAgICBvdXRwdXRfZmIpOw0KPiA+ICsJaWd0X2Fzc2Vy
dChmYl9pZCA+PSAwKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGlndF9vdXRwdXRfdCAq
bGlzdF93cml0ZWJhY2tfbW9kZXMoaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSkgIHsNCj4gPiAgCWZv
ciAoaW50IGkgPSAwOyBpIDwgZGlzcGxheS0+bl9vdXRwdXRzOyBpKyspIHsgQEAgLTY4NSwzNyAr
NzAxLDI3IEBADQo+ID4gaWd0X21haW5fYXJncygiYjpjOmY6ZGwiLCBsb25nX29wdGlvbnMsIGhl
bHBfc3RyLCBvcHRfaGFuZGxlciwgTlVMTCkNCj4gPiAgCX0NCj4gPg0KPiA+ICAJaWd0X2Rlc2Ny
aWJlKCJWYWxpZGF0ZSBXUklURUJBQ0tfRkJfSUQgd2l0aCB2YWxpZCBhbmQgaW52YWxpZA0KPiBv
cHRpb25zIik7DQo+ID4gLQlpZ3Rfc3VidGVzdCgid3JpdGViYWNrLWZiLWlkIikgew0KPiA+IC0J
CWlndF9mYl90IG91dHB1dF9mYjsNCj4gPiAtDQo+ID4gLQkJaWd0X3NraXBfb24oZGF0YS5kdW1w
X2NoZWNrIHx8IGRhdGEubGlzdF9tb2Rlcyk7DQo+ID4gLQkJaWd0X3NraXBfb25fZighKGRhdGEu
c3VwcG9ydGVkX2NvbG9ycyAmDQo+IFhSR0I4ODg4KSwiRFJNX0ZPUk1BVF9YUkdCODg4OCBpcyB1
bnN1cHBvcnRlZFxuIik7DQo+ID4gLQkJZmJfaWQgPSBpZ3RfY3JlYXRlX2ZiKGRpc3BsYXkuZHJt
X2ZkLCBtb2RlLmhkaXNwbGF5LA0KPiBtb2RlLnZkaXNwbGF5LA0KPiA+IC0JCQkJICAgICAgRFJN
X0ZPUk1BVF9YUkdCODg4OCwNCj4gPiAtCQkJCSAgICAgIERSTV9GT1JNQVRfTU9EX0xJTkVBUiwN
Cj4gPiAtCQkJCSAgICAgICZvdXRwdXRfZmIpOw0KPiA+IC0JCWlndF9yZXF1aXJlKGZiX2lkID4g
MCk7DQo+ID4gLQ0KPiA+IC0JCXdyaXRlYmFja19mYl9pZChvdXRwdXQsICZpbnB1dF9mYiwgJm91
dHB1dF9mYik7DQo+ID4gLQ0KPiA+IC0JCWlndF9yZW1vdmVfZmIoZGlzcGxheS5kcm1fZmQsICZv
dXRwdXRfZmIpOw0KPiA+IC0JfQ0KPiA+IC0NCj4gPiAtCWlndF9kZXNjcmliZSgiVmFsaWRhdGUg
WFJHQjIxMDEwMTAgV1JJVEVCQUNLX0ZCX0lEIHdpdGggdmFsaWQgYW5kDQo+IGludmFsaWQgb3B0
aW9ucyIpOw0KPiA+IC0JaWd0X3N1YnRlc3QoIndyaXRlYmFjay1mYi1pZC1YUkdCMjEwMTAxMCIp
IHsNCj4gPiAtCQlpZ3RfZmJfdCBvdXRwdXRfZmI7DQo+ID4gLQ0KPiA+IC0JCWlndF9za2lwX29u
KGRhdGEuZHVtcF9jaGVjayB8fCBkYXRhLmxpc3RfbW9kZXMpOw0KPiA+IC0JCWlndF9za2lwX29u
X2YoIShkYXRhLnN1cHBvcnRlZF9jb2xvcnMgJiBYUkdCMjEwMTAxMCksDQo+ICJEUk1fRk9STUFU
X1hSR0IyMTAxMDEwIGlzIHVuc3VwcG9ydGVkXG4iKTsNCj4gPiAtCQlmYl9pZCA9IGlndF9jcmVh
dGVfZmIoZGlzcGxheS5kcm1fZmQsIG1vZGUuaGRpc3BsYXksDQo+IG1vZGUudmRpc3BsYXksDQo+
ID4gLQkJCQkgICAgICBEUk1fRk9STUFUX1hSR0IyMTAxMDEwLA0KPiA+IC0JCQkJICAgICAgRFJN
X0ZPUk1BVF9NT0RfTElORUFSLA0KPiA+IC0JCQkJICAgICAgJm91dHB1dF9mYik7DQo+ID4gLQkJ
aWd0X3JlcXVpcmUoZmJfaWQgPiAwKTsNCj4gPiAtDQo+ID4gLQkJd3JpdGViYWNrX2ZiX2lkKG91
dHB1dCwgJmlucHV0X2ZiXzEwYml0LCAmb3V0cHV0X2ZiKTsNCj4gPiAtDQo+ID4gLQkJaWd0X3Jl
bW92ZV9mYihkaXNwbGF5LmRybV9mZCwgJm91dHB1dF9mYik7DQo+ID4gKwlpZ3Rfc3VidGVzdF93
aXRoX2R5bmFtaWNfZigid3JpdGViYWNrLWZiLWlkIikgew0KPiA+ICsJCWZvciAoaW50IGkgPSAw
OyBpIDwgQVJSQVlfU0laRShmb3VyY2MpOyBpKyspIHsNCj4gPiArCQkJdWludDMyX3QgdGVzdF9m
b3JtYXQgPSBmb3VyY2NbaV07DQo+ID4gKw0KPiA+ICsJCQlpZiAoaXNfaW50ZWxfZGV2aWNlKGRp
c3BsYXkuZHJtX2ZkKSkNCj4gPiArCQkJCWlmICghc3Ryc3RyKGlndF9mb3JtYXRfc3RyKHRlc3Rf
Zm9ybWF0KSwgIkJHUiIpKQ0KPiA+ICsJCQkJCWNvbnRpbnVlOw0KPiA+ICsJCQlpZ3RfZHluYW1p
Y19mKCJ3cml0ZWJhY2stZmItaWQtJXMiLA0KPiBpZ3RfZm9ybWF0X3N0cih0ZXN0X2Zvcm1hdCkp
IHsNCj4gPiArCQkJCWlndF9mYl90IGluX2ZiOw0KPiA+ICsJCQkJaWd0X2ZiX3Qgb3V0cHV0X2Zi
Ow0KPiA+ICsNCj4gPiArCQkJCWlndF9za2lwX29uKGRhdGEuZHVtcF9jaGVjayB8fA0KPiBkYXRh
Lmxpc3RfbW9kZXMpOw0KPiA+ICsJCQkJaWd0X3NraXBfb25fZighKGRhdGEuc3VwcG9ydGVkX2Nv
bG9ycyAmICgxIDw8DQo+IGkpKSwNCj4gPiArCQkJCQkgICAgICAiRFJNX0ZPUk1BVF8lcyBpcyBu
b3QNCj4gc3VwcG9ydGVkXG4iLA0KPiA+ICsJCQkJCSAgICAgIGlndF9mb3JtYXRfc3RyKHRlc3Rf
Zm9ybWF0KSk7DQo+ID4gKwkJCQljcmVhdGVfZmJzKCZkaXNwbGF5LCAmaW5fZmIsICZvdXRwdXRf
ZmIsDQo+IHRlc3RfZm9ybWF0LCAmbW9kZSk7DQo+ID4gKwkJCQl3cml0ZWJhY2tfZmJfaWQob3V0
cHV0LCAmaW5fZmIsICZvdXRwdXRfZmIpOw0KPiA+ICsJCQkJaWd0X3JlbW92ZV9mYihkaXNwbGF5
LmRybV9mZCwgJmluX2ZiKTsNCj4gPiArCQkJCWlndF9yZW1vdmVfZmIoZGlzcGxheS5kcm1fZmQs
ICZvdXRwdXRfZmIpOw0KPiA+ICsJCQl9DQo+ID4gKwkJfQ0KPiA+ICAJfQ0KPiA+DQo+ID4gIAlp
Z3RfZGVzY3JpYmUoIkNoZWNrIHdyaXRlYmFjayBvdXRwdXQgd2l0aCBDUkMgdmFsaWRhdGlvbiIp
Ow0KPiA+IC0tDQo+ID4gMi40My4wDQo+ID4NCg==
