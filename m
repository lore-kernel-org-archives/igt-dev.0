Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B200DE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 21:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFCC10E18A;
	Fri, 20 Dec 2024 21:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/jpkDd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7410D10E18A
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 21:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734729344; x=1766265344;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=rjYkJouXHdoSHr2TD+b42xdu6dv8Xqt8tJ1ZsWXiCiY=;
 b=A/jpkDd0aCIlo3qMoUC038FckiUuyIPIUzoM8c3mEOlvOhSV7kf+z06v
 8xJ9zTVydUpytftvUxCQuDVu7xfxA7Eyv/Yzj9ZGX0b0lm9I0bZrHu9z/
 vLy+ZAC1TDz0Tb8FhQ7jM3pKHNW7rgcKcu6AkekvGBpsbUPRSyPFPLWGZ
 xq5rLZopyrr5L/fzLoiBIuXQrXWDtI6XVsiXuTgiGObjcxCp6PxQcBcpZ
 OJA5rl1SA3FOZk4uF0xbkGfDubkGU6iAgVwpcHGlg5/kAvmwQlNno91ET
 SxLgMkcWfNGPvDKtnSiT33V/RjfNwxMLHYyBFVbJjAJPSwjlVMoNsz1gT g==;
X-CSE-ConnectionGUID: 9NeUtlZfS/OfNKJshA20rg==
X-CSE-MsgGUID: eernl1HITSae1/TrbHRXOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="60672648"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="60672648"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:15:43 -0800
X-CSE-ConnectionGUID: sn3lmu1+Tse0UyXiY6WRKA==
X-CSE-MsgGUID: MctAn0rcTyK+8hEurVUwJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102730994"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 13:15:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 13:15:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 13:15:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 13:15:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVQRXQQ1iap33bGr4dcKOT/2lobvq+IDtIiHFtnZXOivTMAnQ+xa1fp4ftOxkeJirvvSzqawTC9f9Xvqq+IuubANEg3vDnwNrJaqGuH+t/28jcSeDPCD0ZCYLPEFqmlOAh8xH+IISSGSY1wEqBxDE80nmv/b+WSu/VWsaRQEBRRmbLh22opkpJN0ksoxzbwhXg7j64+pmMA2gXs0bodaLayVN8N6gxoxl8lWMRYDgxH7g5eA3BXGbNbpt28bHn+SX/DwqX4zr6FPlzKjuEb9wLS3f24aeu6jVZywTOcF9SO0M4xBD2WRLHlu4LKaIJajEpG2q/f7qsa7BRCoN0+CBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjYkJouXHdoSHr2TD+b42xdu6dv8Xqt8tJ1ZsWXiCiY=;
 b=v/QnzJino8Jk486nrgvZZFgBh3RcVwStZQU5MCRAxKbFkHEcq+1acHSAvXntyw3jlYzpJEtPh2a/G4mfTf197aGNMl8d2e7LG85CMVlT7q9N4XmgxFKfUbVrZUHZccSQZWKcdMttRmxDtgefhySUqWUlFy7DWA6307+iIh2/6gDuVYN6stNRM68S8z+af3gzbxVi/VcyJfOuctK8bdQEPyfQcEo8RAQPsu54+iwORrEN/BO72lvpMEXdoJZXP7vFydWmnIcDWi1n11JWwji9VnnkIek22JR6rXRPkD77H+/mgyIK98nBAtbBsJKhx+cvr4LvqXNSoX1tZhWs1TM5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by DS7PR11MB6293.namprd11.prod.outlook.com (2603:10b6:8:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 21:15:02 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 21:15:02 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Tahvanainen, Jari"
 <jari.tahvanainen@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Subject: Re: Add env info to igt_runner (was: Re: [PATCH i-g-t 4/4]
 lib/igt_device_scan: Fix scan vs bind/unbind/reload)
Thread-Topic: Add env info to igt_runner (was: Re: [PATCH i-g-t 4/4]
 lib/igt_device_scan: Fix scan vs bind/unbind/reload)
Thread-Index: AQHbUjrbbDLMTrc7HkWprtkspAucyrLvXj8AgAAJBYCAADy6AA==
Date: Fri, 20 Dec 2024 21:15:02 +0000
Message-ID: <44b8672c613d18921cefddb1e34198e4e9df922a.camel@intel.com>
References: <ujidcfwjkj5mvdc7nsfhbl76gk4vswl7ibqkwy24xieiwlpfer@ly57qp226qsh>
 <20241220170522.3nevqraywqmhlix2@kamilkon-desk.igk.intel.com>
 <lhhpaph27pearysh6cjbujywofndoo634vcy4duiszqcarzrsx@t5ft2rrtbbfo>
In-Reply-To: <lhhpaph27pearysh6cjbujywofndoo634vcy4duiszqcarzrsx@t5ft2rrtbbfo>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|DS7PR11MB6293:EE_
x-ms-office365-filtering-correlation-id: e5884678-c8dd-497c-c6c5-08dd213b5e6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ajVLT2tSdG03ZzNjNTZqdW5DRVZaN3hUcEx6RlVOYlNNWEZOclJpcEZrLzVH?=
 =?utf-8?B?TnI4OVNUVnRYbVRzYnVRZnVSZzVxUDBMNldyR3c0Szg0aisvdDJBZU0vVzhI?=
 =?utf-8?B?Qis0bnV4M3VmMm54UlJvMjZLZlFkMFFnMUFnU050QjNMdFhqS0thNXozclJy?=
 =?utf-8?B?U24vc1RpQWpxMi9VOFNib0ZTeXBEbDlNbytEMUp2ZS84YjFSNGY4cVlaU1Jp?=
 =?utf-8?B?RFBiVTdwNm1RYmh6OHBwOWpaLzJLRTcrYU0wcXZiZTZTZzJjQ1FGTzBlV1VT?=
 =?utf-8?B?dkJ3dTdPR1d3Z2JuUTRLWEVBMGgzYVdETFZrMTFJRTN4bnFIY2NaS1NnVGdq?=
 =?utf-8?B?VCtjSkdkSTY5Smg1MFJXV043eTNSZkNGVndybFJIZ0Z2ZVh5NElGNWIyQ2ZO?=
 =?utf-8?B?NGZxQStjM0Zua2sxTzBOcWNjUldBc25OL3hXOGhCWkhNNEpBaHBwRDAybjM1?=
 =?utf-8?B?ekdTQmdZTXc1YlErRzQ4UldKcy85Vkt0aXFqL1psTGVRSEUxYk9UYjdKamda?=
 =?utf-8?B?Yll1TndlcXdqUndnNVpwTE9IVGUwRDVBb3hUZFY1d3BBTXRHUUxydUhyUHYw?=
 =?utf-8?B?cThiYmlFTkVVR1NoRUxkRTUxOHdRbDkwdXc2dFF0a1JXLzZUR05ObHBTakFV?=
 =?utf-8?B?OXVMSnA3S014ZWYrNWd2THNyNUQ0aXhxeUw3VVdNeWgvVjczZi83czNWZ1hw?=
 =?utf-8?B?OFZiQ1g4VUlqUXNzS25MZnhSYUplWTJZZndTUEduVlNEb2YyMnh6VVB1djRM?=
 =?utf-8?B?UEtONVFTT29PbWZZK3MrVjdxd0R0Z3RGUnFOSS9JRTBwKzlFK2lNMG9nd3JR?=
 =?utf-8?B?Y1RjbFVWRmJmamNiUmZnMXcva3FJbml0dzZaMjBMSjE0Q08yYUliSEJCQlRK?=
 =?utf-8?B?Vnp4SmFnTW9zaCtpOVQva3FIWnhCV3JJMlYxUmFOajdDNk5mZXJYcmNXQytp?=
 =?utf-8?B?ZzVjVXVIK1BzeXZiMFBBVTkzVS90WjMwTC9ZWDJRb3Brb2ZCWlRwaG5MVWVT?=
 =?utf-8?B?N0wxYUNrTnVoNDNKNGVmZHVEbUlhU1pqYkowd0VyZEx0ZkJQTlM5bmlrdUYv?=
 =?utf-8?B?OTl1M1ZsNjR6NWRJaHFrRjYrRGxMZ0RXY3IxdXdSUnJSbWxZeFRyUkRqRHgz?=
 =?utf-8?B?dDlzVysxbmM0ZEdRc2ZqUlhQaURkQlZUVVAzaEE1eXJNNWprUlE0Umc4MjFE?=
 =?utf-8?B?L25XemN5aFBxaHZSMmpaTCs2Z3hXRXFsZ1dWUm1pRjJsTjYwUVFHQzBrRnUz?=
 =?utf-8?B?eFdzZHc1YXVndFFzT0V5NlJnN3V1VHFlU0NReHVIV2xYSkRhVGZjckdVUyt3?=
 =?utf-8?B?dXZpMWFCMkg4NjZFMnZsTGhSc29ib1VxYzI2amtXN3FPSDg4aGh6UFBqWkFW?=
 =?utf-8?B?dzFaWlRYN1Q3dGFHREtRQkJDUHozMGZiQUhxMWxxd2owUm9EVTlWUVdrNFlW?=
 =?utf-8?B?Slk3TXFMVFR1VDdNZDd0emNhbjhVenZvM1dURE13NDRyMjRxZGVGRExHbjIz?=
 =?utf-8?B?YXk2WWNUMGZCT3EzRjlGcldBY0pmK3NGeHNiNWVHQ2d4dHVvTTdqZ1dKdkNJ?=
 =?utf-8?B?cnNWMmlXTSthT3haS3FiWGliS1EzdkFVbW5rNWxWMGE5M0paZTBvOEoxa0Nu?=
 =?utf-8?B?QXUrODRmSzRlNXF2NlBtTnl2VS9RUXYyZmNkNXhDK1VBK3A4dG1FNW5vSFBF?=
 =?utf-8?B?b0NOMzFyNU12bEZ6K291RkEwRGFDeGJBMCswUzlPK1plSU5TZG16Qzh6T3VT?=
 =?utf-8?B?VU95QW1Edy85WmNNbXB5VGFaSW5Eb1pIRVJyb2k3ZzYyd0dTZFBVTXltSnB4?=
 =?utf-8?B?OGhua1hTY2k4RjBTYkQza0VWdktYNWxKSXR6bm1hNVVYN1l6ajlLT3BSYzlh?=
 =?utf-8?B?dlhzdFN0c2REUC9XcEJVK3NHVTdUaU1yZ21BRzQ3dkRabldnQytPYUpDZlY1?=
 =?utf-8?Q?KpqOe2wUe4w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(921020)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXI1cnlHamw2dUVON3BPNVhvWG1jdlNsUHJNckErc0pGMU0vNUoxYnJuUWpw?=
 =?utf-8?B?NlcxQTVaQ3FBRDhQWkZGNE1rUnNER2J3RmpqU003OENmRXpLQzBCclhHcFg3?=
 =?utf-8?B?WHgydEJBVWJFY3JkTllodWhlVXkyeUR2dndGYnJVbkVUUFlIaS9INHdKRzNZ?=
 =?utf-8?B?eXRRTXo2czkwd2JBZWg5aDN5QWVHZnVqa1dUZmNwVGwvRW5aSG9TV3laOUdn?=
 =?utf-8?B?K244VG4yTmFDbzZtSDNwYWxRVFZqSE5SUXJ4SSt2bWN4anZ3cFhPbWlwWU5q?=
 =?utf-8?B?dG1iTTRmQkhxai9ZNTdUOVpGVXpEZmhtWnZYemxjU3ZlMVdIbzc0cFhoQWFN?=
 =?utf-8?B?eXhpekd5WXlhLyswaUE2UDVIYlk4NmJyNjNydWtJMm5SVEhjL1FTSG91TlBt?=
 =?utf-8?B?SWhmeE1Td0pPQ0d0M2FBM1Z5eTVhK2plOFd2SVl2OWM4ZXBwSVRhTy9tb00v?=
 =?utf-8?B?WXJpaHpGS0J1Q1huWVo2dWM3Y2tkRDNkQWZMTlVFeWMrQ3Z4ZEgzNHJKQ0F0?=
 =?utf-8?B?NXhrNkMzaDVLc1l0QUFhSXhoeVJyUzZacXYvUk9JTUVQWlNzdEJTZzY1RS9V?=
 =?utf-8?B?cmJrbkU1Z0VIMjZpUkV4UlBLMlZ6OWdmRlAzRm92TmF1RFZaUW1YT0hBQko0?=
 =?utf-8?B?TGFBN0N2QWkzdzMzMjRKMWp6VjVHS0lVMmVEV29zZEp6eDJpS3RHbkU5N2pW?=
 =?utf-8?B?UHF5bksvR0pOYSt6ZUtRak1EMEc0VnFuQjRBNm9YVmlMWDdqQkFuSDRBK2x1?=
 =?utf-8?B?ODVwZUpRNkRyVWlxVTVrOTlBOEdETnNzS01rYjIzczZURVVTYUVZeFRDOFNP?=
 =?utf-8?B?T0VMaU9pWHhxM1kxTVRORnZrVjJmTHJBQmdHSDVsTjErdHVJTUFPTDRhTEh5?=
 =?utf-8?B?dlFpbnNkeUVTcDhzdXZPa2Y0WlZUTyt2MHA5bzg4cGFZRlduS1ZiUkMrczd1?=
 =?utf-8?B?d0FhdHNkRVgxQVczeEFBcXhSY1JjcXlZSXk4MjhoblB1eXlrb2s4VzRDSmFj?=
 =?utf-8?B?alg3c3M0TS8xVHZyOUJyV2RkRWhUR1QwbTZia2dSMk5NOTQ0VnlzT1VaOHoy?=
 =?utf-8?B?L01LdE4rTElXVGM5K2F1dHZBSk1tdWpURFNvWWpEdTZCcEhHSnV2b3h6dGhu?=
 =?utf-8?B?dldwNG9UUTEraW8yRmVKNUxNOXZBMXRFZGZQOVVRRFJ5QmRWaWtmUEIxbXhi?=
 =?utf-8?B?cVJUWjVET1FPcEU3YW9VRXFiN29WcXBaU2xINXcxdXdvVzNWdUx0YkJ5Ulow?=
 =?utf-8?B?ajNoSWMvV2FXdk5SR2luQ1RLRWl2WWJWOWszVnkxVjAyU3BybzhIZTJiam5L?=
 =?utf-8?B?dG9nZ1NBYWo5clBUUm44TUdhcnNhS290Tk9NVnlwRTR4SHNRTTB2YzI2TjU3?=
 =?utf-8?B?OXZSR1Y0bHJ5eW0wRU5kV3o3NWVOUWRWQ3dpQUVFMFNTd1ZYM1UwK3RjZmxp?=
 =?utf-8?B?bUlxdlNteHMybUE5bWJIam1BQVR4andmaWtJbXNwNEFDU05XcWZXUkp6endn?=
 =?utf-8?B?eGxMSHZFTTk2eWVjaXVLUWk4LytxcUNWdTZ3bkJqNWtmTUZ0cnlQNmg2MHBY?=
 =?utf-8?B?V1JsczVBR2I5SFdxdlptL0g1eTlmaDZMa0xEZ1EvaWYrR2tERnppdWpPOXNW?=
 =?utf-8?B?SzdOazJFZVB0MUJJQmhJc0dQV2haUUN0SkdHSVI3RU96eHdpNndURittZTI1?=
 =?utf-8?B?SlhKa2crMnI0VGRNSEl6RE9YV24vYllBY2FCbmtRU1lOa05sL3J5Y3N1T2p4?=
 =?utf-8?B?NHpnRG9EZXZnOGw1djJGZ1krZHpQVjhMcFIvQXU3Q0J5SFVaT1MvaHVmVE4w?=
 =?utf-8?B?SFE1bnY3WHlucE4rb2lFNkpNdXlCM1M0bDRoRVo1OVFUTnVDVTAwVkJHSUJV?=
 =?utf-8?B?SHQ4NERLTkM2Zjg0aUhVWU5MMHpOeGdCdnQ3SVppRE5zWThiaVQ1SE9OcE96?=
 =?utf-8?B?aVpXeWx3Qjg3MUpWRkUwaWxTRmFJNnBqTXIrTFFESThZUUUwdUc4TUd1YXYv?=
 =?utf-8?B?QjU3OGhLMVdKb25ad1JVTkwyL2QrYjd2L3ZzRzBFYVB4NWxPZ2RCaFZaTEF6?=
 =?utf-8?B?NjlVNHd5dzIydG5tRCszaG03ZmxHS21uTmxsNUswd0psZDEvZzZiVXZXVFpl?=
 =?utf-8?B?Y3NaK2JPSUVPLy9YNW9Fd2xLU3BMSkJPV2ZWMWxBOUpNZkxlWkkwblJxbjY5?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07DB4D682FABA948AB1021D7FDD3912D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5884678-c8dd-497c-c6c5-08dd213b5e6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 21:15:02.7459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xJ0VmvNbD0JwWsHET+E7RtARliFwn89Re86VxUC9c8q0YIFXl2hIhEEgzlN4nEfj+XYkn5XyUroC51Z186n0Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6293
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

T24gRnJpLCAyMDI0LTEyLTIwIGF0IDExOjM3IC0wNjAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIEZyaSwgRGVjIDIwLCAyMDI0IGF0IDA2OjA1OjIyUE0gKzAxMDAsIEthbWlsIEtvbmll
Y3pueSB3cm90ZToNCj4gPiBIaSBMdWNhcywNCj4gPiBPbiAyMDI0LTEyLTE5IGF0IDExOjI0OjA5
IC0wNjAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+ID4gPiBoaWphY2tpbmcgdGhlIHRocmVh
ZCBhbmQgYWRkaW5nIHNvbWUgcGVvcGxlIHRvIENjIGZvciB0aGUgaWd0X3J1bm5lciBxdWVzdGlv
bi4NCj4gPiA+IFByZXZpb3VzbHkgSW4tUmVwbHktVG86IDxybnczcTZtaHRobnd5dm93dnN6cjJn
bGx5anRiYjJtb3prNGVtMjcyeGxta3ZtN3B5bEBzemJodGczc2Q3ZDc+DQo+ID4gPiANCj4gPiA+
IE9uIFRodSwgRGVjIDE5LCAyMDI0IGF0IDEwOjM1OjAwQU0gLTA2MDAsIEx1Y2FzIERlIE1hcmNo
aSB3cm90ZToNCj4gPiA+ID4gT24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMDc6MzQ6MTlBTSArMDEw
MCwgWmJpZ25pZXcgS2VtcGN6ecWEc2tpIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFR1ZSwgRGVjIDE3
LCAyMDI0IGF0IDA5OjEzOjI0UE0gLTA4MDAsIEx1Y2FzIERlIE1hcmNoaSB3cm90ZToNCj4gPiA+
ID4gPiA+IFRoZXJlJ3Mgbm8gZ3VhcmFudGVlIGEgY2FyZCB3aWxsIGVuZCB1cCB3aXRoIHRoZSBz
YW1lIGRldmljZSBub2RlIHdoZW4NCj4gPiA+ID4gPiA+IG1vZHVsZXMgYXJlIGxvYWRlZC91bmxv
YWRlZCBhbmQgZHJpdmVycyBib3VuZC91bmJvdW5kLiBUaGVyZSdzIHNvbWUNCj4gPiA+ID4gPiA+
IGZ1bmRhbWVudGFsIGlzc3VlIHdpdGggdGhlIGlndCdzIHRoZSB3YXkgaXQgaXMgYW5kIGl0J3Mg
YWxzbyBwdXp6bGluZw0KPiA+ID4gPiA+ID4gZnJvbSB0aGUgbG9ncyBpdCBsb29rcyBsaWtlIHRo
ZSBkZXZpY2UgdmFuaXNoZWQgZnJvbSB0aGUgYnVzLCB3aGVuIGluDQo+ID4gPiA+ID4gPiByZWFs
aXR5IGlzIGp1c3QgdGhlIFNXIHN0YXRlIG91dCBvZiBzeW5jIHdpdGggd2hhdCB0aGUga2VybmVs
IGlzDQo+ID4gPiA+ID4gPiBleHBvcnRpbmcuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFJl
LXNjYW5uaW5nIHdoZW4gdHJ5aW5nIHRvIG1hdGNoIGEgZGV2aWNlIGlzIG5vdCBleHBlbnNpdmUg
Y29tcGFyZWQgdG8NCj4gPiA+ID4gPiA+IHdoYXQgbW9zdCB0ZXN0cyBhcmUgZG9pbmcsIHNvIHNp
bXBseSBmb3JjZSBpdCB0byBvY2N1ciB3aGVuZXZlciB0cnlpbmcNCj4gPiA+ID4gPiA+IHRvIG1h
dGNoIGEgY2FyZC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJIGFsc28gc2hvdWxkIGNvbW1lbnQg
dGhlIGFib3ZlLiBJdCBpcyBnZW5lcmFsbHkgdHJ1ZSwgYnV0IEkndmUgbm90aWNlZA0KPiA+ID4g
PiA+IGdldHRpbmcgYXR0cmlidXRlcyBtaWdodCBiZSBleHBlbnNpdmUuIEV2ZW4gaXQgbWF5IHRh
a2UgdXAgdG8gZmV3DQo+ID4gPiA+ID4gc2Vjb25kcywgdGhhdCdzIHdoeSBJJ3ZlIGFkZGVkIHNv
bWUgYXR0cmlidXRlcyB3ZSBkb24ndCBmZXRjaCBmcm9tIHVkZXYNCj4gPiA+ID4gPiAoc2VlIGlz
X29uX2JsYWNrbGlzdCgpKS4gSWYgSSdtIG5vdCB3cm9uZyBnZXR0aW5nICdjb25maWcnIHdhcyBh
IGNhdXNlDQo+ID4gPiA+ID4gdG8gbGltaXQgYXR0cmlidXRlcyB3ZSBmZXRjaC4NCj4gPiA+ID4g
DQo+ID4gPiA+IHdoeSB3b3VsZCB3ZSBnZXQgYWxsIGF0dHJpYnV0ZXMgYW5kIGV4Y2x1ZGUgc29t
ZT8gIFNob3VsZG4ndCB3ZSBnZXQgb25seQ0KPiA+ID4gPiB0aGUgYXR0cmlidXRlcyB3ZSBhY3R1
YWxseSB1c2U/IEFGQUlLIHRoaXMgbG9naWMgaXMgYmFzaWNhbGx5IHVzZWQgYnkNCj4gPiA+ID4g
LS1kZXZpY2UvSUdUX0RFVklDRSwgcmlnaHQ/IFdoYXQgZmlsdGVycyB3ZSBub3JtYWxseSB1c2U/
DQo+ID4gPiA+IA0KPiA+ID4gPiBJIHVzdWFsbHkgcGFzcyB0aGUgcGNpIHNsb3QgKGJlY2F1c2Ug
SSBrbm93IHRoYXQgd29uJ3QgY2hhbmdlDQo+ID4gPiA+IGR5bmFtaWNhbGx5IGFuZCBjYXVzZSBz
dXJwcmlzZXMpLiBBcHBhcmVudGx5IENJIHBhc3NlcyB2ZW5kb3IvZGV2aWQ6DQo+ID4gPiA+IA0K
PiA+ID4gPiAJZXhwb3J0IElHVF9ERVZJQ0U9cGNpOnZlbmRvcj0kMSxkZXZpY2U9JDINCj4gPiA+
ID4gDQo+ID4gPiA+IChidXQgaXQgc2VlbXMgdG8gdmFyeSBkZXBlbmRpbmcgb24gcGlwZWxpbmUp
DQo+ID4gPiA+IA0KPiA+ID4gPiBTb21lIGRldnMgcGFzcyB0aGUgZGV2aWNlIG5vZGUgZGlyZWN0
bHkgdG9vIGFzIGluIGEgbG90IG9mIHBsYWNlcw0KPiA+ID4gPiB0aGVyZSdzIG9ubHkgZXZlciBj
YXJkMCBwb3NzaWJsZS4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBDb3VsZCB3ZSBkdW1wIHRoZSBl
bnYgYW5kIGFyZ3Mgc29tZXdoZXJlIHNvIHdlIGtub3cgaG93IGlndF9ydW5uZXIgb3INCj4gPiA+
IGluZGl2aWR1YWwgdGVzdHMgYXJlIGJlaW5nIGNhbGxlZCB3aXRob3V0IGxvb2tpbmcgYXQgdGhl
IENJIHBpZXBlbGluZQ0KPiA+ID4gc291cmNlcz8gSSB3YXMgdGhpbmtpbmcgYWJvdXQgZWl0aGVy
IGhhdmluZyB0aGF0IGluZm8gaW4gdGhlIHN0ZG91dA0KPiA+ID4gb3V0cHV0IG9mIGlndF9ydW5u
ZXIgb3IgaW4gdGhlIGpzb24uIEFub3RoZXIgcG9zc2liaWxpdHkgd291bGQgYmUgaW4NCj4gPiA+
IGRtZXNnLCBidXQgSSdtIG5vdCBzdXJlIGl0J3MgYSBnb29kIG9wdGlvbi4gVGhvdWdodHM/DQo+
ID4gDQo+ID4gTm90IG9ubHkgdGhhdCwgYWxzbyBwYXJhbWV0ZXJzIHVzZWQgdG8gc3RhcnQgaWd0
X3J1bm5lciwNCj4gPiB3aGF0IHdhcyBpbiAuaWd0cmMgZmlsZSAoaWYgYW55KSwgY3VycmVudCB3
YWxsIHRpbWUsDQo+IA0KPiBkb2VzIENJIGFjdHVhbGx5IGhhdmUgYW4gLmlndHJjPyBXZSBjYW4g
YWRkLCBidXQgSSdkIHByaW9yaXRpemUNCj4gdGhpbmdzIHRoYXQgYXJlIHVzZWQgYW5kIHRoYXQg
d2UgZG9uJ3QgaGF2ZSBhbm5vdGF0ZWQgYW55d2hlcmUgKHdpdGgNCj4gZWFzeS9wdWJsaWMgYWNj
ZXNzKS4NCg0KWWVzLCBidXQgb25seSBvbiBob3N0cyB3b3JraW5nIHdpdGggQ2hhbWVsaXVtIChm
b3IgZGlzcGxheSBvdXRwdXQNCm1hcHBpbmdzKS4gSXQgc2hvdWxkKHRtKSBub3QgYmUgcHJlc2Vu
dCBvbiBvdGhlciBEVVRzLg0KDQoNCj4gPiB0ZXN0bGlzdCBwcmVwYXJlZCB0byBydW4sIGZyZWUg
bWVtb3J5IGFuZCBmcmVlIGRpc2suDQo+ID4gbWV0YWRhdGEgZmlsZSBmb3IgaWd0X3Jlc3VtZSwg
aXQgd2lsbCBlbmFibGUgd2l0aCBwcmVwYXJlZA0KPiA+IHRlc2xpc3QgdG8gcmUtZXhlY3V0ZSBy
dW4uDQo+IA0KPiB0YWxraW5nIGFib3V0IGlndF9yZXN1bWUsIHRoZXJlIG1heSBiZSBzb21lIGlz
c3VlcyBkb2luZyB0aGlzIGF0DQo+IHRoZSBpZ3RfcnVubmVyIGxldmVsOiBpdCBtYXkgbm90IG1h
dGNoIGZyb20gb25lIHRlc3QgdG8gYW5vdGhlciBpZiB0aGUNCj4gZW52IGRpZG4ndCBtYXRjaCB3
aGVuIGl0IHN0YXJ0ZWQgcnVubmluZyBmcm9tIHdoZW4gaXQgZmluaXNoZWQuDQo+IA0KPiAxKSBp
dCBtYXkgaGF2ZSBnb25lIHRocm91Z2ggaWd0X3Jlc3VtZSBhZnRlciBhIHJlYm9vdCAoaG9wZWZ1
bGx5IGluIHRoZQ0KPiAgICAgc2FtZSBtYWNoaW5lKQ0KPiANCj4gMikgZm9yIHNoYXJkcyB3ZSBz
bGljZSB0aGUgdGVzdGxpc3QgYW5kIGdpdmUgaXQgdG8gZGlmZmVyZW50IG1hY2hpbmVzLg0KPiAg
ICAgSWRlYWxseSB0aGV5IGhhdmUgdGhlIHNhbWUgZW52LCBjb25maWcsIGV0YywgYnV0IHRoYXQg
YWxzbyBpcyBub3QNCj4gICAgIGd1YXJhbnRlZWQuDQo+IA0KPiAgICAgQ2hlY2tpbmcgcmFuZG9t
IHRlc3RzIGluIGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3NoYXJk
cy1hbGwuaHRtbD8NCj4gDQo+ICAgICBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9p
bnRlbC14ZS94ZS0yNDA0LTI2ZTY0NjRkZmYyYjNmZTUzMDQ5YmQzYjZlNDI2Y2VjNDNiZWIxNjUv
c2hhcmQtYm1nLTEvaWd0QGttc19hc3luY19mbGlwc0Bhc3luYy1mbGlwLXdpdGgtcGFnZS1mbGlw
LWV2ZW50cy1hdG9taWNAcGlwZS1hLWRwLTItNC1yYy1jY3MuaHRtbA0KPiAgICAgaHR0cHM6Ly9p
bnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUtMjQwNC0yNmU2NDY0ZGZmMmIzZmU1
MzA0OWJkM2I2ZTQyNmNlYzQzYmViMTY1L3NoYXJkLWJtZy0xL2lndEBjb3JlX2F1dGhAYmFzaWMt
YXV0aC5odG1sDQo+IA0KPiAgICAgRG8gSSB1bmRlcnN0YW5kIGl0IHJpZ2h0IHRoYXQgd2Ugc2lt
cGx5IGhhdmUgbXVsdGlwbGUgcmVzdWx0c1hYLmpzb24NCj4gICAgIGZvciBkaWZmZXJlbnQgcnVu
cyBzbyBpdCdzIGZpbmUgdG8gY3JlYXRlIGl0IGF0IHRoZSBnbG9iYWwgbGV2ZWw/DQo+ICAgICBX
aGF0IGFib3V0IGEgcmVzdW1lICgxKT8NCg0KVGhlcmUncyBhbHNvIHRoZSBjYXNlIHdoZXJlIHdl
IGNvbGxhdGUgcmVzdWx0cyBhY3Jvc3MgbXVsdGlwbGUgbWFjaGluZXMNCmludG8gYSBzaW5nbGUg
bGFyZ2VyIEpTT04gZmlsZSB0aGF0IGlzIHRoZW4gdXNlZCBmb3IgdmlzIGdlbmVyYXRpb24gb24N
CjAxLm9yZyAoYSBzaW5nbGUgSlNPTiB3aWxsIGFsd2F5cyBjb3ZlciB0aGUgc2FtZSBrZXJuZWwv
SUdUL3NjZW5hcmlvDQpjb21ibywgYnV0IHBvc3NpYmx5IG9uIGRpZmZlcmVudCBob3N0cykuIEEg
cGVyLXRlc3QgZW52IGNvbGxlY3Rpb24NCndvdWxkIGJlIGlkZWFsLCBidXQgaXQgY2FuIGFsc28g
dGFrZSBhIGxvdCBvZiBleHRyYSBzcGFjZSBpZiB5b3UncmUNCmp1c3QgY29sbGVjdGluZyBhbGwg
dGhlIGVudnMsIHNvIGJlIGNhcmVmdWwgd2l0aCB0aGlzLg0KDQpJbiBhZGRpdGlvbiwgZW52cyBt
YXkgY29udGFpbiBDSSBhY2Nlc3MgdG9rZW5zIGFuZCBpbnRlcm5hbCBkYXRhIHRoYXQNCndlIG1p
Z2h0IG5vdCBleGFjdGx5IHdhbnQgdG8gcHVibGlzaCAtIGlmIHlvdSBhcmUgZ29pbmcgdG8gaW1w
bGVtZW50DQp0aGlzLCBhZGQgYSBjb25maWd1cmFibGUgZW52IGtleSBhbGxvd2xpc3QgKyBibG9j
a2xpc3QuDQoNCllvdSBjYW4gc3RvcmUgYWxsIGVudiBrZXlzIG5vdCBpbiB0aGUgYmxvY2tsaXN0
LCBidXQgaWYgYSBrZXkgaXMgbm90IGluDQp0aGUgYWxsb3dsaXN0LCByZXBsYWNlIGl0cyB2YWx1
ZSB3aXRoICJbIFJFREFDVEVEIF0iIG9yIHNvbWV0aGluZyBsaWtlDQp0aGF0LiBUaGlzIHdheSB3
ZSBjYW4gZXhwbGljaXRseSBzdHJpcCBvdXQgc2VjdXJpdHktc2Vuc2l0aXZlIHZhcnMgYW5kDQp1
c2VsZXNzIHZhbHVlcyAoJExTX0NPTE9SUywgYXMgd2UgYWxsIGtub3csIGFyZSB2ZXJ5IHJlbGV2
YW50IGZvciBDSQ0KdGVzdHMgOiksIHdoaWxlIHBlb3BsZSBjYW4gc2VlIHdoYXQgdmFycyBhcmUg
YXZhaWxhYmxlIHRoYXQgd2UgZGlkIG5vdA0KeWV0IGNvdmVyIG9uZSB3YXkgb3IgYW5vdGhlciBh
bmQgcmVxdWVzdCBleHRlbmRpbmcgdGhhdCBhbGxvd2xpc3QuDQoNClRoYW5rcywgUnlzemFyZA0K
DQo+ID4gDQo+ID4gQWxzbyBrZXJuZWwgY29uZmlnIGZyb20gL2Jvb3QgPyBPciBzaG91bGQgaXQg
YmUgaW4gc2hhcmQNCj4gPiBydW4gaW5mbyAoYXZvaWRlZCBkdXBsaWNhdGlvbikuDQo+IA0KPiBt
YXkgYmUgdG9vIG11Y2ggYXMgd2UgY291bGQgZXh0cmFjdCBpdCBmcm9tIHRoZSBrZXJuZWwgdXNl
ZCBieSBDSQ0KPiBzaW5jZSB3ZSBoYXZlIENPTkZJR19JS0NPTkZJRz15LiBJZiB3ZSB3YW50IGln
dF9ydW5uZXIgdG8gY29sbGVjdCB0aGlzDQo+IGluZm8gYW5kIHNhdmUgaW4gdGhlIHJlc3VsdHMs
IHRoZW4gaXQgc2hvdWxkIHByb2JhYmx5IGdyYWIgaXQgZnJvbQ0KPiAvcHJvYy9jb25maWcuZ3og
dG8gbWFrZSBzdXJlIGl0J3MgZ3VhcmFudGVlZCB0byBiZSBpbiBzeW5jIHdpdGggdGhlDQo+IGFj
dHVhbCBrZXJuZWwgYmVpbmcgdXNlZC4gIFF1aWNrIGNoZWNrIG9uIHdoYXQgd2UnZCBuZWVkOg0K
PiANCj4gJCAjIHNpbXVsYXRlIGdyYWJiaW5nIHRoZSAvcHJvYy9jb25maWcuZ3ogYW5kIHBpcGlu
ZyBpdCB0aHJvdWdoIGJhc2U2NA0KPiAkICMgdG8gYmUgYWJsZSB0byBhZGQgaW4gdGhlIGpzb24N
Cj4gJCAuL3NjcmlwdHMvZXh0cmFjdC1pa2NvbmZpZyBidWlsZDY0L2FyY2gveDg2L2Jvb3QvY29t
cHJlc3NlZC92bWxpbnV4IHwgZ3ppcCB8IGJhc2U2NCA+IGNvbmZpZy5nei5iNjQNCj4gJCBscyAt
bGggY29uZmlnLmd6LmI2NA0KPiAtcnctcnctci0tIDEgbHVjYXMgbHVjYXMgNzBLIERlYyAyMCAw
OTozMCBjb25maWcuZ3ouYjY0DQo+IA0KPiANCj4gSHVtbi4uLiBJIHdvdWxkIGNvbmNlbnRyYXRl
IG9uIHRoaW5ncyB0aGF0IGFyZW4ndCBjdXJyZW50bHkgYXZhaWxhYmxlDQo+IGFueXdoZXJlLg0K
PiANCj4gPiANCj4gPiBNYXliZSBzb21lIG90aGVyIGluZm8sIGVpdGhlciBpZ3RfZmFjdHMgb3Ig
bHNwY2kgb3V0cHV0Pw0KPiANCj4gZm9yIGxzY3BjaSBvdXRwdXQgaXQgc2VlbXMgdGhlcmUncyBh
bHJlYWR5IGEgVE9ETyBjb21tZW50IHRoYXQgbm9ib2R5DQo+IGV2ZXIgdGFja2xlZCA6KS4gQW5k
ICJPcHRpb25zIiBtYXkgaXMgYSByZWZlcmVuY2UgdG8gd2hhdCB3ZSBhcmUgdGFsa2luZw0KPiBo
ZXJlIHdydCBlbnYgYW5kIGFyZ3M6DQo+IA0KPiAkIGdpdCBncmVwIC1BMiAtQjIgbHNwY2kgIHJ1
bm5lci8NCj4gcnVubmVyL3Jlc3VsdGdlbi5jLSAgICAgICogUmVzdWx0IGZpZWxkcyB0aGF0IGFy
ZSBUT0RPOg0KPiBydW5uZXIvcmVzdWx0Z2VuLmMtICAgICAgKg0KPiBydW5uZXIvcmVzdWx0Z2Vu
LmM6ICAgICAgKiAtIGxzcGNpDQo+IHJ1bm5lci9yZXN1bHRnZW4uYy0gICAgICAqIC0gb3B0aW9u
cw0KPiBydW5uZXIvcmVzdWx0Z2VuLmMtICAgICAgKi8NCj4gDQo+IEx1Y2FzIERlIE1hcmNoaQ0K
PiANCj4gPiBTaG91bGQgd2UgYXNrIGFsc28gZGlzcGxheSB0ZWFtIGFuZCBvdXIgQ0k/DQo+ID4g
DQo+ID4gK2NjIEphcmkgZnJvbSBkaXNwbGF5DQo+ID4gDQo+ID4gUmVnYXJkcywNCj4gPiBLYW1p
bA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBNeSBwcmVmZXJyZWQgb3B0aW9uIHdvdWxkIGJlIHRvIGhh
dmUgZS5nLjoNCj4gPiA+IA0KPiA+ID4gew0KPiA+ID4gICAiX190eXBlX18iOiAiVGVzdHJ1blJl
c3VsdCIsDQo+ID4gPiAgICJyZXN1bHRzX3ZlcnNpb24iOiAxMCwNCj4gPiA+ICAgIm5hbWUiOiAi
eGUtMjQwMy05OTVjZDMwYTRlMjIyYjZhN2I0YjQwYzM2MjE5ZTQ5MzdmZDcxMDllXC9iYXQtYm1n
LTFcLzAiLA0KPiA+ID4gICAidW5hbWUiOiAiTGludXggYmF0LWJtZy0xIDYuMTMuMC1yYzMteGUr
ICMxIFNNUCBQUkVFTVBUX0RZTkFNSUMgVGh1IERlYyAxOSAxNDo0MDo1MSBVVEMgMjAyNCB4ODZf
NjQiLA0KPiA+ID4gICAidGltZV9lbGFwc2VkIjogew0KPiA+ID4gICAgICJfX3R5cGVfXyI6ICJU
aW1lQXR0cmlidXRlIiwNCj4gPiA+ICAgICAic3RhcnQiOiAxNzM0NjIxMTI2Ljg3MzQyMzEsDQo+
ID4gPiAgICAgImVuZCI6IDE3MzQ2MjEyODguNTk5NDUzOQ0KPiA+ID4gICB9LA0KPiA+ID4gICAi
ZW52aXJvbm1lbnQiOiB7DQo+ID4gPiAgICAgIklHVF9ERVZJQ0UiOiAuLi4NCj4gPiA+ICAgICA8
YW55IElHVF8qIGVudiB2YXI+DQo+ID4gPiAgIH0sDQo+ID4gPiAgICJhcmd2IjogWyAuLi4gXQ0K
PiA+ID4gDQo+ID4gPiANCj4gPiA+IEx1Y2FzIERlIE1hcmNoaQ0KDQo=
