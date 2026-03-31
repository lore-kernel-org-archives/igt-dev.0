Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0242FF60FF
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 10:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A103410E250;
	Tue, 31 Mar 2026 10:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaEBlJtH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7583010E250
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774954204; x=1806490204;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=osG2B2dRN0ZHcBRJPbu12NCVt0muXqmwYA8fO49LF8M=;
 b=IaEBlJtHpz6c5y+v+eK6XuQOpz2t59f2Be61IoJwpOTyObIouXGNa6sW
 /nUEFl9muBGPgYjOdSfdaatpiYj1ij/MsJH7vkbFe4HCqXkmTpLE0GrI2
 CIds1NKvFY66vuloWosnpA+xGqVR8hYmm7jsjlBkjW/PTazgw+rgTNoM1
 vTt5x6EAb928FHQD7nyLXX+nbYCmVTBEZ4A8AZrF8uzP9qb5EIW0OzfWt
 wNKvWbs38iTN+KUGN2gFpZM95J3drVSj+1m0J/8cMOGEWaMCPdQuYMRkn
 hfZb0k/s+4wo/N+QgT9HzKLKT8ORdhRieWfTSSYTcjH6VHW2bpsM6sNtC w==;
X-CSE-ConnectionGUID: o/AfydnuTVm4GvxZOs9xLw==
X-CSE-MsgGUID: t+HcIGrrQT6s/8iL4DmTAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87355166"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="87355166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 03:50:03 -0700
X-CSE-ConnectionGUID: IoAb3IozSj28qOHvmw55tQ==
X-CSE-MsgGUID: uxmOfOY3RxG9IlSFTV/d3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="231154425"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 03:50:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 03:50:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 03:50:02 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 03:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRWffAwYznyUJonjAQ0UljjnYiyzQSLxKtY+G2zyBfHA2Kn6e9kNlGkag7SNUXmpPRc5MPIw8DQLjibQ/uHm8x0f7OC9/IKpBGHlpYww842YcBrNx5wzi+OfYy+idcETVbq9fEeIbNCLnOe7EdK8dLi8t6vLAbc/6CXxfx7OfCylYLy2C1wPRvu1t/25V8xV8YEbplOcbolYuyk7h5O9tQnUZF2CniO+Kz05KGEPLB9nM5Bp2kmQs2yel9LmVhC/v6ITUaZK4Ekp+c5FPePn7xPg+LwdaFrnUD6OUMctGR3RVCAMuHEFQiAvnUhJDyxlDoANCdSGaTUltIPgHcGEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osG2B2dRN0ZHcBRJPbu12NCVt0muXqmwYA8fO49LF8M=;
 b=koKBCHTO391r9gTmflEqddK0f0X7jpbSRwQNNT1mH2s9R/nnjM3oKpgUvRLuqPYVo403i09rhqlxYnV77KorQ5s+nJ5PgBDNgSt7ASZ3EmoDjnNQrA1KL9+W44NMd8LKpUmVMmyFUE4OAUq43dOqvTLSD0kANyk7W7BQmO0ZGT4CvBodrT+U1XCO7kBkl+EOEP2dWJVMHCfICNedrInqyZi2C2XONhceelRR++oZPMUMUSLCqyyn1rhMB64Sed8jgsv5alxJ2T5oEUkvA4YUB6Ya69YYfNtkbkBRphHbvxZs0A89EXG8YAPgDsBx+a67OfMcXiQdC/4Mf8tQUdhqkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by PH7PR11MB8009.namprd11.prod.outlook.com (2603:10b6:510:248::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Tue, 31 Mar
 2026 10:49:54 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%5]) with mapi id 15.20.9769.015; Tue, 31 Mar 2026
 10:49:54 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Nikula, 
 Jani" <jani.nikula@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Reddy
 Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 1/4] tests/intel/kms_frontbuffer_tracking: update
 the outdated fbc status checks
Thread-Topic: [PATCH i-g-t 1/4] tests/intel/kms_frontbuffer_tracking: update
 the outdated fbc status checks
Thread-Index: AQHcvPH35BOFCqfFt0mJB9AcGbqfAbXAi7mAgADexQCABxPNAA==
Date: Tue, 31 Mar 2026 10:49:53 +0000
Message-ID: <33e3c1e6a8a4b3e0e771d73f638d0ea3b5136785.camel@intel.com>
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
 <20260326072555.160329-2-vinod.govindapillai@intel.com>
 <e2800fef737c676e44f15a7be8441ce89cae66f3@intel.com>
 <acW28s0esy571c5F@intel.com>
In-Reply-To: <acW28s0esy571c5F@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|PH7PR11MB8009:EE_
x-ms-office365-filtering-correlation-id: 82b49529-e623-42b0-e567-08de8f133df6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 6gAoxomp9yo2N1TTDsgZ8Cy7DyKa/vHxIyDRU17pUgB6HZSNhP8U+bJs9pEGVUohVoW7i+vDKZHqaRrLbG7DbmmkVAhsY6zFiJ4+9ldmZTSfcb+0XFg47BOxjyjjHej++NaJOEOXNJuhp56RYFSA230AIvkIJoFhhQaTcqazBbVGc2W8z1UYLGCjfdU8wa9n/GhQ32JJX72Y3evhOz6HpH9yx2EDuUzTFTk9eMZxIY/gIIDP8Fj9Ke3moLYpuDllgZ0bNNdKFoY075O0AmqsE5HvcSf7+uPApIC5ymSG4f0ir/8TeJ+3WzFPaNYK+tlm4AyvkYDSB9WlQVCkmY9LTHzSZt0WFje3vR7wANjSXU6eESoqBJp5suNUiohHv187YclOtdzIZCNRIRbGEdjF5C9cOZQORMpphtF8yVXHOYRaupU6KizDslft9ONKuQNDA0Xkghde/rCUIkow2AnADnQN+Ekeka1+IqsHkDuor4yKpKs26vfAsukNdTShjM3Wm4/qh/8iwWMSPCiaAZqKM1WpkHnIAyqAAEB1RFkTdB5pSRbOKQBrlM2PBecPRkTkmzLlCcjSXRvSkdAXwkiOETiMuWBwveG0RLzwsGl0MWm70Q/j16olQPVpAZNPaM6RxS819Gt7y7GbPwx1FsZmwIGQjukjWA0wIo1n7/YZmBYg339dZwFbMlrxQySKHkFv9UIO/1nuMeSLxV8rEz67vUdCKBSQCd5UOKwNndgrRloCkA7sakquO9Wq2Cr3naIftOH4MM3CE2JvtS+vvBqZ9MnE4QkRFBCyn6QFpgR2pYQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGhiRDg1MlpIL0JCNWI3ZkhHenR2UWtuMnFOZmNOc0ZJUlMrT3dpRUF0U2Qx?=
 =?utf-8?B?TkVoWjh3bUZJMUxQc2RXWXNyMjBhMFRHUmUrYlovU0JUc1R5bU5TeEd6NGtw?=
 =?utf-8?B?UTY5UEhIcHBMVWwwNGExb2JLM0VibEZUdnB2VS9mRGRyWUFyUWVaZFdTOGlp?=
 =?utf-8?B?WnpYTDI3ZHEwTGVrem1UTUM2NVVxVkpFV2NFRGlIdXhIR1E5dHAyc1pWZVRO?=
 =?utf-8?B?VWNmck5nN1BXWSttWlFPZGdPVkRTQXh0ZzQxWEJHczd4LzhVUEJQOTR6eW03?=
 =?utf-8?B?amxCZzFZT2VQTzQ4Tk1SSEhDSUNoSEd0RS9XVXMxeEEwN2t6Rkg4cm9pcllt?=
 =?utf-8?B?bXJNekJKSEliYm9rT21adVp5b1ZsbWlNTzc5QnliTVNPSVo5U1N3Y2tuWjA5?=
 =?utf-8?B?SGJKYUtZTWRER1Rocmh0anlVbGZ6VHZoSzM5WDJnUkdITm1RVk1LcU9VaTYx?=
 =?utf-8?B?L0k4YlhqWU1GNHk1aW9CbTJqN2c2b1BHUjh2N0hBVVhPT0lTZW1YemFvaEpS?=
 =?utf-8?B?aSsyaEtWZmh2UDFwSlEwWCs1N1hocGMxVXQ3OVo5alhGUUlKdmRDTmNLL2hu?=
 =?utf-8?B?czJrRVlzdHkzbEpZV1ozZGFtU0wvM2swaEl0YUpyd0IxTkdyUUR4NkhyQnhh?=
 =?utf-8?B?UHRTYnQ0S1N0NSszVkRQcVZLeTZFSzZtTlRPMmxkc2huQUt2Qkc0QmhOK3A0?=
 =?utf-8?B?SVNYVkkyWGZMYkZMOW5MK0Mzc2todlh1T0pvNndyYjBuTUU3akRtZmMyQ1d4?=
 =?utf-8?B?OU5XMHhENlBIN0szMkNveHFtczlOcUdnbWlDb05XaVg2WktrbDFaOVl2UHNL?=
 =?utf-8?B?MzM3UXdkNUZJTmZJN3dGdWgzT3JwRis1M2ZJZnNvbXIwR1ovMGM0THNLN2dj?=
 =?utf-8?B?ZUdpam1rNkFxVXFZbWhzZmRlOGEzb0NTcXZ3WUsyRG5neS9wMnBvNGZ6TEFl?=
 =?utf-8?B?SXh3WnAza3JKQVRzaytDVFRLY2R4QzVFUTMyczNEeGFWbzFWcGQ3U21rV3Ez?=
 =?utf-8?B?UFdzTmRrS0ZrZGRZVUJmbzVCdFFyYmxsK3MyaXIzVURpcUZMZkNjYWRWYVRo?=
 =?utf-8?B?SXBONWJ0bldSMXl1MHA3U0NlUW1GOC9uRE5jakxqb2hEWGhGOFlhTERsOG9n?=
 =?utf-8?B?QXUyM3diZjJEclFkMjJxOFk0c3Y5TXIrczZ2NWZGcXJqT1poTEZ3TEhBeGpn?=
 =?utf-8?B?UWpEcmo5blJBS0l4VjFhUkFXVHIrQmJFeUxZeVNJb2FYdnpSUzNZdUZQejVE?=
 =?utf-8?B?dXowSWdpSlNNMkhNV1BEdCtMNUpkMDBQSmVpVmFzSnhoRXh5Mis1Sk04aVRW?=
 =?utf-8?B?SWFVVG9oSG1rSndUWk4wdEo5N0Z2c1FOQlZkUjdlWlRSTjBFVzBZVjdkSmxl?=
 =?utf-8?B?TXVGdHFTYnd0Z2NIVzVJSERxS21FMUh6bkVqNE5XTWxEdWhkZVhuVVJnakph?=
 =?utf-8?B?QXo5UzFoNFdudmN1K0RDRFBpSi93OEVaZ2d5QnNWTW9CYzI4QmxEbWhPcjYz?=
 =?utf-8?B?cG1hY2s2amMxSFFYNjhBRnVjaEEwdmRrckQ2OEwrTWhjVUJzMklYOE1jeCtC?=
 =?utf-8?B?aVQzMXN2MUdYajhJQ3haeVBidGpPZFRTd2wxTGpkemZjV01TMmhGclJLTTdT?=
 =?utf-8?B?cnB4MWhXUDBRSENzSmZGTmc4c043eHVsRlo0U2V3QWFxZzlQOEQvTkFVZmdV?=
 =?utf-8?B?V01wRFhWQjVrMUpscUx2RUVBcHpBWFdhQXUxZ1BvOER4bWZGOVYxY2ZWZ09V?=
 =?utf-8?B?cTlvQWY1cDl5dW5pbEdUMVlJMjREL0ZsTmhWdWpjMjEvVC8yODhMTkRzZXdN?=
 =?utf-8?B?NkxlVmh3YmFhZ1gzclFMNysyZ1NNZW4zOVVLZUp5YWRzU2Q4S2ZyRTUxcHor?=
 =?utf-8?B?K21YM1BNOGxEY3BRR0NhN1dDNWtwbHpoOU43V0ZNNE9hNDFRVERoRnJSYzdL?=
 =?utf-8?B?eFV5eGhZL1d6RDRTYnMwMVl2UjA1YUdlTVduQUlyaGY4ekxLME43d2MxRzVQ?=
 =?utf-8?B?Y2s2UVhNY1NvblZZdnRHeXA0SlFNc3FZcUpnS25QR0pSSTQwcjRCYU9oUGdP?=
 =?utf-8?B?eWN1ZGtoaXdKOXJmb3VtZ1hGWlRXK2dLNmlqVU1LMEprSFpFU0V5eW5DdUJD?=
 =?utf-8?B?aVdSdU9rNnJCeE1od2VhWkl5dERjcUlkOStVcVYyTUlBN1BybzZmTXJCSW9w?=
 =?utf-8?B?ejAwQW9SblgzVEhSZi9DRk9vREpwME05TkNwVGJyUEIrUnZuSHRYUEJtWnZs?=
 =?utf-8?B?eFJNdWcyeFNibFVzQXByYmZjUjN1aFg3aTNhNlNmTFA3RkFRVkFuUmwrSlhG?=
 =?utf-8?B?T2tpb0wvSUNaMER3bjBoTldJNjhscDUxTHh2UUVhSEJBWWRJSTJLSmc3ZURX?=
 =?utf-8?Q?nnTWEpVrlzlgenWq3qGK7EZxRmBL/usGog+u+P7XlTnH7?=
x-ms-exchange-antispam-messagedata-1: D+M+spJjdp0sm1/2TjdquFMURixifc5LwUg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D06572D7FDA38844824B0DB7A2DB92ED@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cmNM7zKeYLruT7eC8NSQZiudy4SKJyRSRBus+3XW7fuOG5wrCyz6Bj0CMN71qdGXr2oBWAfkoWT1xD4q4JDVOVZfweXkFykBEugwgx4G4iavzF2GqgB+3k6JJtZdpgHs5VYRNWEdYGkrMxsf4aZ8R6oaoWcMj8Qny+AdSssb3hkmsMgbulv+JHy6lFAKP1ABv8RPBXrWG3h5HIHeEafaIZT65Vy+Ws389OMokFjg4c74/yROimO7urv7biMDmB2i16rrCq1g2LxCOePZUD1vCgJe/K8z01uKM3OFtWcaVcTEaf9u6r6Uj/0e1Y2n7SyEETskFZUMtYCsGzP3Lk1g5w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b49529-e623-42b0-e567-08de8f133df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 10:49:53.9378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9ScheM3FOEXUCXXR+/1tXqoaUYZL7wmjd1/caD9e3W6zq1+yTlXqEl8qLk7qetDudFlX3AG4jDoMk/o7YjfDHTs9i3Bmgo4LIlBQ61SZY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8009
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

T24gRnJpLCAyMDI2LTAzLTI3IGF0IDAwOjQ1ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFRodSwgTWFyIDI2LCAyMDI2IGF0IDExOjI3OjQ3QU0gKzAyMDAsIEphbmkgTmlrdWxh
IHdyb3RlOg0KPiA+IE9uIFRodSwgMjYgTWFyIDIwMjYsIFZpbm9kIEdvdmluZGFwaWxsYWkNCj4g
PiA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4gUmVwbGFjZSB0
aGUgZmJjIHN0YXR1cyBjaGVjayBmb3IgIm1vZGUgdG9vIGxhcmdlIGZvciBjb21wcmVzc2lvbiIN
Cj4gPiA+IHdjaGljaA0KPiA+ID4gaXMgbm8gbG9uZ2VyIGJlaW5nIHNldCBieSB0aGUgZHJpdmVy
IHdpdGggInBsYW5lIHNpemUgdG9vIGJpZyINCj4gPiA+IGFuZA0KPiA+ID4gInN1cmZhY2Ugc2l6
ZSB0b28gYmlnIiBmYmMgc3RhdHVzIGNoZWNrcy4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1i
eTogVmlub2QgR292aW5kYXBpbGxhaQ0KPiA+ID4gPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwu
Y29tPg0KPiA+ID4gLS0tDQo+ID4gPiDCoHRlc3RzL2ludGVsL2ttc19mcm9udGJ1ZmZlcl90cmFj
a2luZy5jIHwgMTcgKysrKysrKysrKysrKy0tLS0NCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQg
YS90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiA+ID4gYi90ZXN0cy9p
bnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiA+ID4gaW5kZXggYzE2ZjYzMTk5Li5l
NzY0YzljZTEgMTAwNjQ0DQo+ID4gPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJf
dHJhY2tpbmcuYw0KPiA+ID4gKysrIGIvdGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNr
aW5nLmMNCj4gPiA+IEBAIC0xNjY0LDE1ICsxNjY0LDIzIEBAIHN0YXRpYyBib29sDQo+ID4gPiBm
YmNfc3RyaWRlX25vdF9zdXBwb3J0ZWQodm9pZCkNCj4gPiA+IMKgCWNoYXIgYnVmWzEyOF07DQo+
ID4gPiDCoA0KPiA+ID4gwqAJZGVidWdmc19yZWFkX2NydGMoImk5MTVfZmJjX3N0YXR1cyIsIGJ1
Zik7DQo+ID4gPiAtCXJldHVybiBzdHJzdHIoYnVmLCAiRkJDIGRpc2FibGVkOiBmcmFtZWJ1ZmZl
ciBzdHJpZGUgbm90DQo+ID4gPiBzdXBwb3J0ZWRcbiIpOw0KPiA+ID4gKwlyZXR1cm4gc3Ryc3Ry
KGJ1ZiwgIkZCQyBkaXNhYmxlZDogc3RyaWRlIG5vdA0KPiA+ID4gc3VwcG9ydGVkXG4iKTsNCj4g
PiA+IMKgfQ0KPiA+ID4gwqANCj4gPiA+IC1zdGF0aWMgYm9vbCBmYmNfbW9kZV90b29fbGFyZ2Uo
dm9pZCkNCj4gPiA+ICtzdGF0aWMgYm9vbCBmYmNfcGxhbmVfc2l6ZV90b29fYmlnKHZvaWQpDQo+
ID4gPiDCoHsNCj4gPiA+IMKgCWNoYXIgYnVmWzEyOF07DQo+ID4gPiDCoA0KPiA+ID4gwqAJZGVi
dWdmc19yZWFkX2NydGMoImk5MTVfZmJjX3N0YXR1cyIsIGJ1Zik7DQo+ID4gPiAtCXJldHVybiBz
dHJzdHIoYnVmLCAiRkJDIGRpc2FibGVkOiBtb2RlIHRvbyBsYXJnZSBmb3INCj4gPiA+IGNvbXBy
ZXNzaW9uXG4iKTsNCj4gPiA+ICsJcmV0dXJuIHN0cnN0cihidWYsICJGQkMgZGlzYWJsZWQ6IHBs
YW5lIHNpemUgdG9vDQo+ID4gPiBiaWdcbiIpOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICtz
dGF0aWMgYm9vbCBmYmNfc3VyZmFjZV9zaXplX3Rvb19iaWcodm9pZCkNCj4gPiA+ICt7DQo+ID4g
PiArCWNoYXIgYnVmWzEyOF07DQo+ID4gPiArDQo+ID4gPiArCWRlYnVnZnNfcmVhZF9jcnRjKCJp
OTE1X2ZiY19zdGF0dXMiLCBidWYpOw0KPiA+ID4gKwlyZXR1cm4gc3Ryc3RyKGJ1ZiwgIkZCQyBk
aXNhYmxlZDogc3VyZmFjZSBzaXplIHRvbw0KPiA+ID4gYmlnXG4iKTsNCj4gPiA+IMKgfQ0KPiA+
ID4gwqANCj4gPiA+IMKgc3RhdGljIGJvb2wgZmJjX3Bzcl9ub3RfcG9zc2libGUodm9pZCkNCj4g
PiA+IEBAIC0yMzU2LDcgKzIzNjQsOCBAQCBzdGF0aWMgdm9pZCBkb19zdGF0dXNfYXNzZXJ0aW9u
cyhpbnQgZmxhZ3MpDQo+ID4gPiDCoAlpZiAoZmxhZ3MgJiBBU1NFUlRfRkJDX0VOQUJMRUQpIHsN
Cj4gPiA+IMKgCQlpZ3RfcmVxdWlyZSghZmJjX25vdF9lbm91Z2hfc3RvbGVuKCkpOw0KPiA+ID4g
wqAJCWlndF9yZXF1aXJlKCFmYmNfc3RyaWRlX25vdF9zdXBwb3J0ZWQoKSk7DQo+ID4gPiAtCQlp
Z3RfcmVxdWlyZSghZmJjX21vZGVfdG9vX2xhcmdlKCkpOw0KPiA+ID4gKwkJaWd0X3JlcXVpcmUo
IWZiY19wbGFuZV9zaXplX3Rvb19iaWcoKSk7DQo+ID4gPiArCQlpZ3RfcmVxdWlyZSghZmJjX3N1
cmZhY2Vfc2l6ZV90b29fYmlnKCkpOw0KPiA+IA0KPiA+IEkgdGhpbmsgdGhlIHByb2JsZW0gd2l0
aCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBhbmQgdGhpcyBzZXJpZXMNCj4gPiBpcw0KPiA+
IHRoYXQgaXQgc3RpbGwga2VlcHMgYWxsIHRob3NlIGk5MTVfZmJjX3N0YXR1cyByZWFkcyBpbiBw
bGFjZSwNCj4gPiBpbnN0ZWFkIG9mDQo+ID4gcmVhZGluZyBpdCAqb25jZSogYW5kIHRoZW4gZmln
dXJpbmcgaXQgb3V0Lg0KPiA+IA0KPiA+IFlvdSBjb3VsZCBlLmcuIGhhdmUgYSBmdW5jdGlvbiB0
aGF0IHJlYWRzIGk5MTVfZmJjX3N0YXR1cywgcGFyc2VzDQo+ID4gaXQNCj4gPiBpbnRvLCBJIGRv
bid0IGtub3csIGFuIGVudW0gb24gdGhlIGlndCBzaWRlLCB3aXRoIHNvbWUgaGFuZGxpbmcgb2YN
Cj4gPiB1bmtub3duICJGQkMgZGlzYWJsZWQ6IHh4eCIgbWVzc2FnZXMsIGFuZCByZXR1cm5zIHRo
YXQuDQo+ID4gDQo+ID4gQW5kIHRoZW4geW91IGdldCB0aGF0IHN0YXR1cyBvbmNlLCBhbmQgY2hl
Y2sgdGhhdCwgaW5zdGVhZCBvZg0KPiA+IHJlYWRpbmcNCj4gPiB0aGUgZmlsZSBOIHRpbWVzLg0K
PiANCj4gVGhlIG90aGVyIGJpZyBwcm9ibGVtIGlzIHRoYXQgdGhlIGJ1ZmZlciBzaXplIHVzZWQg
Zm9yIHRoaXMgaXMgdG9vIA0KPiBzbWFsbC4gQSB3aGlsZSBhZ28gSSBub3RpY2VkIHRoYXQgaXQg
d2FzIGdldHRpbmcgY2hvcHBlZCBvZmYgc28gSQ0KPiBoYXZlIGEgcGF0Y2ggaW4gc29tZSBicmFu
Y2ggdGhhdCBkb3VibGVzIGl0LiBCdXQgZHVubm8gaWYgZXZlbiB0aGF0DQo+IGlzIHN1ZmZpY2ll
bnQgb24gdGhlIGxhdGVzdCBwbGF0Zm9ybXMgd2l0aCBtb3JlIGFuZCBtb3JlIEZCQyBjYXBhYmxl
DQo+IHBsYW5lcy4gU29tZW9uZSBzaG91bGQgcHJvYmFibHkgY2hlY2sgdGhhdC4uLg0KPiANCg0K
SnVzdCB0byBjbGFyaWZ5LCBJIGhhZCBjb25zaWRlcmVkIHRoaXMgd2hlbiBJIHdhcyByZXZpZXdp
bmcgdGhlIElHVA0KcGF0Y2ggZm9yIGVuYWJsaW5nIEZCQyBvbiBwbGFuZXMgMCwgMSBhbmQgMi4g
VGhlIGZiYyBzdGF0dWMgY2hlY2sgZm9yDQpwbGFuZXMgZG8gdXNlIGEgYmlnZ2VyIGJ1ZmZlci4g
SSBkaWQgbm90IGFza2VkIGZvciBhIGNoYW5nZSB0byB0aGVzZQ0KYWJvdmUgRkJDIGRpc2FibGVk
IHN0YXR1cy1lcywgYXMgdGhlIGRyaXZlciBpcyBwcmludGluZyB0aGUgZGlzYWJsZWQNCnN0YXR1
cyBvbiB0aGUgZmlyc3QgbGluZSBpdHNlbGYgYW5kIGV4aXN0aW5nIGJ1ZmZlciBsZW5ndGggc2hv
dWxkDQpjb3Zlci4gDQoNCkJ1dCwgYW55d2F5LCBJIHdpbGwgY2hhbmdlIHRoaXMgYXMgd2VsbCB0
byByZWZsZWN0IHRoZSBiaWdnZXIgYnVmZmVyDQpzaXplIGFuZCBwcm9iYWJseSB1c2Ugb25lIHNp
bmdsZSBkZWNsYXJhdGlvbiBvbiBsaWIvdGVzdHMvaW50ZWxfZmJjLmgNCg0KQlINClZpbm9kDQo=
