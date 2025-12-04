Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC4CD2A53B
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED6B10E21F;
	Thu,  4 Dec 2025 21:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnpbHZla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CD910E21F
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764882211; x=1796418211;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xYtDD3K4zJaSzBB7WIAgskd4EX8hDB83vFIZSgZDNZw=;
 b=JnpbHZlaW0FeHj1L6Dk6OxtsVR/NgUgTXEYZyh+LZEG1v9YnVBMPCB3j
 SsHKkN3FCgJdbcPbVeJFV6ips3YUy7K2oyS9dRPtCzUid2c36e1hVVa1x
 PRsnJ/leSYbV3xPBuLiF33ehsRyVW7cII7irCg1EPRmvvfGteT28CKzgZ
 YwJnnWeZ0FlzXSdU5zjfnZJzo6LEFBMG2wbJfiRHt2gxu71GJwhZVkopb
 QYlXYGmh8JldLi8OsRbJkt+HXYY8O6c7YqfLhhiN6RDhDyFnPeilYD3Ys
 JsTVluRwSUTgS61HvqEFygB0CjO4PV/lW9G44I+gAiSf4pOi9Mvj1g+TX g==;
X-CSE-ConnectionGUID: g5LVfr9uSlCn+jhoqYWxEA==
X-CSE-MsgGUID: 2e8GzV6wRVmjaTJSC+HtEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="92394394"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="92394394"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:03:31 -0800
X-CSE-ConnectionGUID: fx1K2yO4TbKeYiEy+XTxhA==
X-CSE-MsgGUID: a7PVXgAmQn+r4B3rLnAoUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="195892254"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:03:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:03:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 13:03:29 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:03:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oi6mxKDXDAmm3khO5V38YkkWC5pSL6Kq0GM0IDF3wzLNjBfPVD5Yo8EBijAWVaOjaTl4+1BI55/BkuhMywpQQmmdldNDIDY315kUTe59NaRW/Yzk8CmB3GD2gwoiCe8IS5r9/ygitJmLGv7jwJLNOQpLkDlb3Tyw2bUQCqKyDoUqS3PF7Jx2D+FvNb4tivAEpABciq4xfwYj+5jQyJ19RBB7A3ciF2wJI4+mMRqFUTr9+GSUfVWyh2pf0a0jeF772LWFFjTu/V7vlYW0N2Z/kF6vi3+FOtKQKuZ6S3IwpuysdPhzxPEv8GsUp1Xve9ZhGriA/zhynE96zMWTi/le/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYtDD3K4zJaSzBB7WIAgskd4EX8hDB83vFIZSgZDNZw=;
 b=mStipIy5Caew85gCj2976EQKa/VVBP7Fo5BOXOnZNAqHz2vHctYBMvn9KPJ9iaOxWkfwHlGziAjuSvU6syI6HndUsaH91OOsD7MyDkstNcS7WhBWKreEX0l3fym8g6xmsIsKxarC1AS17UOwpZw6oN/p8cNM3LBVtdUqVOAAveAodg0pMoLxj4lPCC5taGWzb5EW1VtKMuEqS0i9Wu6xfgek0v/Y3nKdaaNd2HNPqg2DQCstccbljnhyhI04oxFRk0i46LAMEUfrP9Q8ibS8agA7AxHS4zUWMqm0CwHqyoNQCLQgBvJ8fBRqrgoBXSLj22aUC+9g/No1wV6vDanuUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 21:03:25 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:03:25 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 14/19] lib/xe/xe_spin: Add switch point for preemptible
 spinner
Thread-Topic: [PATCH v2 14/19] lib/xe/xe_spin: Add switch point for
 preemptible spinner
Thread-Index: AQHcWpr+rXXh9jw7R0WnsRnD3zAsXrUSDaSA
Date: Thu, 4 Dec 2025 21:03:25 +0000
Message-ID: <8cb0874f3e5bac4a8226b8d6cae25c21fd4acfd6.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-35-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-35-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB5817:EE_
x-ms-office365-filtering-correlation-id: 8a857041-66ee-4534-24d9-08de337890ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?a0lzaUVRRWRpWjd2dlp6azNWQjJXUGduWEF5dGpWbmYxQlpKYVFrVkJoczVE?=
 =?utf-8?B?dzBMVDdZNWRRcXRCMVY2UE9iQ0NZTFIwdC9ucS9mM1Joc0NOd1J4Q29seVZS?=
 =?utf-8?B?RHUwVEFTcDRUd0pOVWRaMkZkaktBajFydlErSTZBczZ6RW1nQlhwcHdpUWUv?=
 =?utf-8?B?ZEo4Y0pTS3IwL1pPa0ZLZmhYeXloZlpEWkhHT09DQUh4c2VkS1hTYUpJT3A2?=
 =?utf-8?B?THFPcmVTeW9WTnljYjZIR1c1UXFXelA2aTZoZHZiTjc5eml5cnRoNVZtY2ZZ?=
 =?utf-8?B?OFdZM3RHRW1UcVEzR3FCek1tbDQ0MWZ4Kzhma3dXOVNSSGhGWmtoRzFXbU1l?=
 =?utf-8?B?Q1ZBTkdIeEU0aWRsY3BVbmhYRlg2bkNNTnhkcnFhL3ZITnpEb245VkIwNHZp?=
 =?utf-8?B?UjlvZDRWWDNvbk9pNmkxak5MRlR1ZFNmVjdiRjRCRCtBeGhFWjRwQmFsdEx0?=
 =?utf-8?B?RjJsRFRQNWE2TkIrWk8xeEdrSXZycnJBL0huWXdBdXAyUVQza3EydkQrNm4v?=
 =?utf-8?B?cFRoQ2NkREZOOTFrTldVdzZkSjBQMHp3VlpWc2R3VmdOZ3Y2R1ZYZ010aXZG?=
 =?utf-8?B?blhOVWpWR0NQTFdXRS9Yb2lmUC9CSGxTM1Q0SU9LS1pRVUorUTZSdXg2MzBj?=
 =?utf-8?B?bFQwQ2F0UGVRVldhcEx2UTJEYm9kQmFrdS8weVdYR09ISzZGYStIN3cwRXpS?=
 =?utf-8?B?ZTFrS3EybUhqdnI2b0tESmRXcWtFYWRidWZsNVBuQ2NSRTQvVERlMmtEd0VQ?=
 =?utf-8?B?N25TTlJEMTlIVWZSK2lZZDF6b2psSi9UQlJLSDNTdU9KM05EYTVqNjI3cGFs?=
 =?utf-8?B?RWthTEJjcmQyZU1PUHhoQmFwejk4R1N6WFY3RWRjeWpZZUhuWldHd2FFWUJG?=
 =?utf-8?B?ZlNGUHd0NEV0SXRuS0ROSVJuUkdaaXZ1ekxENk00a1hLUjI4ZWR0OFdMak1O?=
 =?utf-8?B?Tlp3ZUNuRW5VSDNLcDJGNHhaUDBxY2lWY2hLcWJlSm50TmtIZzlyL1hmZ2Ji?=
 =?utf-8?B?NW5VdkZWaGVnWGd0b0w1VDhEVHZVZEp1RHpVVTl5bEFxRCtUMmRUQjFGQ3hS?=
 =?utf-8?B?MHliT2J0QmpTak1wM0d1cEVsdGsyNmYwcUt0bFpLVzFRbHc5eTBjZnRJQVF5?=
 =?utf-8?B?Z3Nnd2dMK01FTXR2SjJtRHdtOWt4WnRiQ3JEQzFHL0c5UVppRHFleDEvZnM0?=
 =?utf-8?B?WU02VFJXVXQwUWY5dmlYUW42RS9ubmhWU0QrWlJUYUgycU8vRnRzMTQ0Yi9F?=
 =?utf-8?B?TUlyV2RublpJOUxTRW0xV096RFlGaUJUaG5OVC83ZFJWd1dmOTVob2NBbzdx?=
 =?utf-8?B?YkVrTC9HV2FFRjIzNXlzUDVmdUlwV2xmUHJYV2Y3UlVnZWRPTlErRlJkaTh0?=
 =?utf-8?B?U3dybkwxRjhVMjBtTC94NjNWeTJURG10RWdQdWMvaVRHWHFwK0dXejA4aEZK?=
 =?utf-8?B?SnJxUW1QOTNkMWxoZDEwbHQyS0V0cGpiM0JvMEk1b3hRRzVwY1ppK2F2SmQ0?=
 =?utf-8?B?eTFpaWFGU2lNc2s1MU1jNVlNMmRrekpEcVllVTFHcURoMERlOFkrNHlmRk4x?=
 =?utf-8?B?STZEVWZNeWhIZVhtR3pUVy8rTFFnbzB0RnFNWEN1eE9CVFJ5bkwyenVvU0Jz?=
 =?utf-8?B?ZWgrVnlpQStWVFd3QytrMGl5MG1rcWNEMWhreWJpU0VMeE1WL0V1VnVQSUVX?=
 =?utf-8?B?VlQzVGs5Z0U4S0xiSHF6RGI2Y3RNQ2FIazQ3WWpCWko3M2ozcFFKaVN0RWxz?=
 =?utf-8?B?YVpaN0dES29kUzZxVm1CMkdzNWc0Z2lYa0w4dzNxY0pocHMxRTJyc2JNOVQ0?=
 =?utf-8?B?aHdoQjdub0s3R3JFRG0rUGViNnBxelhMSHoyU2RLeEsvc1VlZmVuMFNWcWRH?=
 =?utf-8?B?eHIwankzcXdjWmFkU1MxVmMrZFNvOEVlVjZiVGdySCtLa0hWNDdmcnpTelhU?=
 =?utf-8?B?a28waWxxNEg3YUF3UFNZeGk4OW44Q3RCb1B0SUVOcVVXLzVXUW9QWEVaNkRT?=
 =?utf-8?B?SnZDY1V3Sm5oN0R2enQ0ZTloNHZOM2dYdmVpMUNNL1RzY2JBYklVT0c0eWJr?=
 =?utf-8?Q?Px2dMC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MW5IWUdyNDcrTTI4WlhtN2FBbWU5YXpMYkZadjRHblA2K095Yit1dkFKYmVt?=
 =?utf-8?B?QzZ6UXA4WFZ0NkFQV0JjRHB4Rm5STHFmL1NaWk11aVhYUjE1cjdRa0w3TE00?=
 =?utf-8?B?Z1BLamExUWpFSmxDelF6TDdjWmRwcXF4aktjTE5WbmRQWklmbHd2NStDVUFu?=
 =?utf-8?B?RDNUWWxydmxZNEtCZS9lMTFQazh6L2tVUkJGM2FPaGhKeXNrVDE0MTdZQmxB?=
 =?utf-8?B?bDlwV3JYSkpKRjdBWlhNRDloclYrUG1XNVQ4dk9JRDZrNmRkM3dMUk96dSti?=
 =?utf-8?B?SzBnem54K0tHVVhURFI1OENwajQ1ZUZJRWR2TFBGZkJVQjRGMVZDbVFJd1NC?=
 =?utf-8?B?a0gvL0JDZS8rQ1gvOTgwSkwvVDZJUXlIN1NEU0FKUHFFUEp4T2hOWkZxd3E1?=
 =?utf-8?B?aEFxNEltdVduUGgyelM2Wm95aGdSMGRpc21KRElkVFFqR2tZbnlzcW1tMEtD?=
 =?utf-8?B?V00rMjlMSGtXdFAvVm8wTTl6T3ZBdkNwNkduMGZHOTl4ZkhOOHpPQkpmNVhF?=
 =?utf-8?B?S2NETDV0TS9qV2hNVGF3VGtqK044WCtWTm9GYVlLaDJOUmpONzNDUUVkZ0hq?=
 =?utf-8?B?UFRaZmVLejNvUzNoQTM2WDdtZVNZTDNOQUlhTTk1Y2NGN0JiYkNzNURreFli?=
 =?utf-8?B?VVdXeENxM2pFRVVnd0Z2WUxYYjdycWd1MGxhSkZlVWRhdzJPVWM2cnBOaEdj?=
 =?utf-8?B?akpTYmdsdU5vT0JVb3Y3b0JOZndkTVZtUzgzaDJJUjcvQWtKRXY1ZVZBRG5k?=
 =?utf-8?B?azI1c2htOElsdVMvOUlmQWZKbG9UQ1dmUHVYc3lHajVpSzVFWEtTWHdoSzVa?=
 =?utf-8?B?dmtOcXNIY0RvbDJic1krVEVMQmtDQVNJYkQ1ZmhTa0tPUlBPa3BKK0dIQ3FQ?=
 =?utf-8?B?SFlYbk0yUTlHTjBzcDV2c1pndEQ0eUdsdnh5WHVnZ2Myd2VYK0RyaVYzbGRM?=
 =?utf-8?B?U08rWEF4eUxDVWl5dy9TQzBiT0NEdzg4RDloSFhZS3Z1Zlk1L3FRc3Zua1ZD?=
 =?utf-8?B?a3ZJWXFGWUJqbDA2am5JVEgyMktiN2RFN2lKR1I0Z3Z3YUNYTU1ZZW11NTZM?=
 =?utf-8?B?aTVnQUVzcW51d0pRNDhnMXlUbkxXNlcrSUZUUDQrL2lyMm5GK3Foa3d0REkw?=
 =?utf-8?B?bkcybVNlQnFHRExSdTBRbS94WmFRVEVpTmFOdzdEYkE1WEpZSGtGUytpVW45?=
 =?utf-8?B?dnJILzBDaTlVeldNYkFvVEhvWnhOdW5TeWRtV2h1bjhHMnVHUDZ3T0xxNDA2?=
 =?utf-8?B?OG5kMUtXbnpPbVVmVWllY0EwdXRvQUpiQ2twaldXVWVlNk4xN0FFdTRCV3Jw?=
 =?utf-8?B?bkc3YmZvalMvK3ZYUTZJMG12R0RpbnRienU1c2VuSTFVZ1NoOGFueW52cnFk?=
 =?utf-8?B?czJweWtYMmxMYVFDWWQxSEVZeEdLVDF3eFhJRTNBL2lZYTJlM0xIYjFJYVI2?=
 =?utf-8?B?NWR0UWtrbHBNaWk2MHBHc1E0R0VvWWFNd3FsRTFyWGxzMloyYW1GWTBhTGRp?=
 =?utf-8?B?RDFiTWFpMk1ZVUJsbWtKM3pYTUk2aXlDcm9vaGp2Q1RMeURSZTdtd3QrUG03?=
 =?utf-8?B?QnAxQVhkK1J5WTg2clh4bVl6QW13VnF6WW1ZcE1RcHdMRGt5aDZjd00zeDh5?=
 =?utf-8?B?ZnJoZm11dEpZSk9VcXg0QVN3SWNYTER2V2htNW1BTTc4dENOUEp1UWgzQXM5?=
 =?utf-8?B?eGxFK2hJZ1I3UkRCN1dIbWRFTUU2YUc0bjNkUWhHRnJjTzdQWC8rMkUySG8x?=
 =?utf-8?B?MzcxM1EwaE51clJobzE5RUVhcEhKbWxnZGN3a1h0NVY5RWdsYW1QNUhhd1NO?=
 =?utf-8?B?dUtFb3dJSGc2U1ZtRHhCSnBReXRmckU0NENjbFdOYjZZZTNDaVFXNXpyeUNv?=
 =?utf-8?B?RXZSM2pHN2s2aUVPbStyMUFiZC93Z2xNN2ZnMXpwbkVaQklCV29YNExQSHF4?=
 =?utf-8?B?UkNjQm5jaytMdUZ3ZDRqK0dhdHF2dG16ckZTMkVnNkNhRyt0UGo0T0szQ1pO?=
 =?utf-8?B?ZlRvVVd1eXA5TCt2VlAxUy96VXJIbFdtVS91YmxGWi9zMHY1UWZDdEc1Umlz?=
 =?utf-8?B?NXYvOEM0bU1ieHpncmEvRENzZ2k0am4vSFNadkVTTmJ4enMvVXQrckhzTlBD?=
 =?utf-8?B?T0tkM2lidlp3UFZmTjU4QzdpZFJoYmNwUTltWW5hSFlFTURBV2lPYnM4Z0pD?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <757B2340D1061D4994A602B61D9489DB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a857041-66ee-4534-24d9-08de337890ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 21:03:25.3450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8MNCoVtk1/bjhkhImFUIYUE+lnM7PYNq6yWxqc/DFHnW1yGVx1MrCB+tDvWxrPrqI68NJPUV058QJzwvD20VWWbc9g8CPOthA1sVm2nBBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IFdoZW4gJ3ByZWVtcHQnIG9wdGlvbiBpcyBzcGVjaWZpZWQsIGluc2VydCBh
IE1JX1NFTUFQSE9SRV9XQUlUCj4gY29tbWFuZCBpbiB0aGUgc3Bpbm5lciBiYXRjaCBidWZmZXIu
IFRoaXMgcHJvdmlkZXMgdGhlIHN3aXRjaAo+IHBvaW50IGZvciBwcmVlbXB0aW9uIHRvIGhhcHBl
biBpbiBtdWx0aSBxdWV1ZSBtb2RlLgo+IEFsbG93IHVzZXIgdG8gY29udHJvbCBwcmVlbXB0IHdh
aXQgY29uZGl0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1
cmEKPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+Cj4gLS0tCj4gwqBpbmNs
dWRlL2ludGVsX2dwdV9jb21tYW5kcy5oIHzCoCAxICsKPiDCoGxpYi94ZS94ZV9zcGluLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0MQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+IMKgbGliL3hlL3hlX3NwaW4uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MyArKysKPiDCoDMgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2ludGVsX2dwdV9jb21tYW5kcy5oCj4gYi9pbmNsdWRlL2ludGVsX2dwdV9j
b21tYW5kcy5oCj4gaW5kZXggY2QyODFiYTg5Li41MTU4YmIwZWEgMTAwNjQ0Cj4gLS0tIGEvaW5j
bHVkZS9pbnRlbF9ncHVfY29tbWFuZHMuaAo+ICsrKyBiL2luY2x1ZGUvaW50ZWxfZ3B1X2NvbW1h
bmRzLmgKPiBAQCAtMTIzLDYgKzEyMyw3IEBACj4gwqAjZGVmaW5lIE1JX1NFTUFQSE9SRV9XQUlU
wqDCoMKgwqDCoMKgTUlfSU5TVFIoMHgxYywgMikgLyogR0VOOCsgKi8KPiDCoCNkZWZpbmUgTUlf
U0VNQVBIT1JFX1dBSVRfVE9LRU7CoMKgwqDCoMKgwqDCoMKgTUlfSU5TVFIoMHgxYywgMykgLyog
R0VOMTIrCj4gKi8KPiDCoCNkZWZpbmXCoMKgIE1JX1NFTUFQSE9SRV9QT0xMwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgKDEgPDwgMTUpCj4gKyNkZWZpbmXCoMKgIE1JX1NFTUFQSE9SRV9RVUVVRV9T
V0lUQ0hfTU9ERcKgwqDCoMKgwqDCoMKgKDEgPDwgMTEpCj4gwqAjZGVmaW5lwqDCoCBNSV9TRU1B
UEhPUkVfU0FEX0dUX1NERMKgwqDCoMKgwqDCoCgwIDw8IDEyKQo+IMKgI2RlZmluZcKgwqAgTUlf
U0VNQVBIT1JFX1NBRF9HVEVfU0REwqDCoMKgwqDCoCgxIDw8IDEyKQo+IMKgI2RlZmluZcKgwqAg
TUlfU0VNQVBIT1JFX1NBRF9MVF9TRETCoMKgwqDCoMKgwqAoMiA8PCAxMikKPiBkaWZmIC0tZ2l0
IGEvbGliL3hlL3hlX3NwaW4uYyBiL2xpYi94ZS94ZV9zcGluLmMKPiBpbmRleCA3MmIxM2VmNDIu
LjE3NGM1ZjdlYyAxMDA2NDQKPiAtLS0gYS9saWIveGUveGVfc3Bpbi5jCj4gKysrIGIvbGliL3hl
L3hlX3NwaW4uYwo+IEBAIC01Nyw2ICs1Nyw3IEBAIHZvaWQgeGVfc3Bpbl9pbml0KHN0cnVjdCB4
ZV9zcGluICpzcGluLCBzdHJ1Y3QKPiB4ZV9zcGluX29wdHMgKm9wdHMpCj4gwqAKPiDCoMKgwqDC
oMKgwqDCoMKgc3Bpbi0+c3RhcnQgPSAwOwo+IMKgwqDCoMKgwqDCoMKgwqBzcGluLT5lbmQgPSAw
eGZmZmZmZmZmOwo+ICvCoMKgwqDCoMKgwqDCoHNwaW4tPndhaXRfY29uZCA9IDA7Cj4gwqDCoMKg
wqDCoMKgwqDCoHNwaW4tPnRpY2tzX2RlbHRhID0gMDsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBp
ZiAob3B0cy0+Y3R4X3RpY2tzKSB7Cj4gQEAgLTE2Nyw2ICsxNjgsMjQgQEAgdm9pZCB4ZV9zcGlu
X2luaXQoc3RydWN0IHhlX3NwaW4gKnNwaW4sIHN0cnVjdAo+IHhlX3NwaW5fb3B0cyAqb3B0cykK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBvcHRzLT5tZW1fY29weS0+ZHN0LT5tb2NzX2luZGV4Owo+IMKgwqDCoMKg
wqDCoMKgwqB9Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqAvKgo+ICvCoMKgwqDCoMKgwqDCoCAqIElu
c2VydCBhIE1JX1NFTUFQSE9SRV9XQUlUX0NNRCBpbnN0cnVjdGlvbiB3aXRoIGNvbmRpdGlvbgo+
IGNvbnRyb2xsZWQKPiArwqDCoMKgwqDCoMKgwqAgKiBieSB0aGUgdXNlci4gSXQgYWxzbyBhY3Rz
IGFzIGEgcXVldWUgc3dpdGNoIHBvaW50IGluIG11bHRpCj4gcXVldWUgbW9kZS4KPiArwqDCoMKg
wqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqBpZiAob3B0cy0+cHJlZW1wdCkgewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1aW50NjRfdCB3YWl0X2FkZHIgPSBvcHRzLT5hZGRy
ICsgb2Zmc2V0b2Yoc3RydWN0Cj4geGVfc3Bpbiwgd2FpdF9jb25kKTsKPiArCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJhdGNoW2IrK10gPSBNSV9TRU1BUEhPUkVfV0FJ
VF9DTUQgfAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoE1JX1NFTUFQSE9SRV9QT0xMIHwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBNSV9TRU1BUEhPUkVf
UVVFVUVfU1dJVENIX01PREUgfAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE1JX1NFTUFQSE9SRV9TQURfRVFfU0REIHwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAzOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFtiKytd
ID0gMDsKClNob3VsZCB0aGlzIGJlIHNldCB0byBzcGluLT53YWl0X2NvbmQgaW4gY2FzZSB3ZSBl
dmVyIHdhbnQgdG8gY2hhbmdlCnRoZSBkZWZhdWx0IHZhbHVlIGhlcmU/CgpPdGhlcndpc2UgZ2Vu
ZXJhbGx5IHRoaXMgaXMgYSBncmVhdCBhZGRpdGlvbiB0byB0aGUgc3Bpbm5lciB0b29sa2l0OgpS
ZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJhdGNoW2IrK10gPSB3YWl0X2Fk
ZHI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJhdGNoW2IrK10gPSB3
YWl0X2FkZHIgPj4gMzI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJh
dGNoW2IrK10gPSAwOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gwqDCoMKgwqDCoMKgwqDCoHNw
aW4tPmJhdGNoW2IrK10gPSBNSV9DT05EX0JBVENIX0JVRkZFUl9FTkQgfCBNSV9ET19DT01QQVJF
IHwKPiAyOwo+IMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFtiKytdID0gMDsKPiDCoMKgwqDC
oMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IGVuZF9hZGRyOwo+IEBAIC0yMDcsNiArMjI2LDI4
IEBAIHZvaWQgeGVfc3Bpbl9lbmQoc3RydWN0IHhlX3NwaW4gKnNwaW4pCj4gwqDCoMKgwqDCoMKg
wqDCoFdSSVRFX09OQ0Uoc3Bpbi0+ZW5kLCAwKTsKPiDCoH0KPiDCoAo+ICsvKioKPiArICogeGVf
c3Bpbl9wcmVlbXB0X3dhaXQ6Cj4gKyAqIEBzcGluOiBwb2ludGVyIHRvIHNwaW5uZXIgbWFwcGVk
IGJvCj4gKyAqCj4gKyAqIE1ha2UgdGhlIHNwaW5uZXIgd2FpdCBvbiB0aGUgcHJlZW1wdGlvbiBz
ZW1hcGhvcmUuCj4gKyAqLwo+ICt2b2lkIHhlX3NwaW5fcHJlZW1wdF93YWl0KHN0cnVjdCB4ZV9z
cGluICpzcGluKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3Bpbi0+d2FpdF9jb25kID0gMTsKPiAr
fQo+ICsKPiArLyoqCj4gKyAqIHhlX3NwaW5fcHJlZW1wdF9ub3dhaXQ6Cj4gKyAqIEBzcGluOiBw
b2ludGVyIHRvIHNwaW5uZXIgbWFwcGVkIGJvCj4gKyAqCj4gKyAqIE1ha2UgdGhlIHNwaW5uZXIg
ZG8gbm90IHdhaXQgb24gdGhlIHByZWVtcHRpb24gc2VtYXBob3JlLgo+ICsgKi8KPiArdm9pZCB4
ZV9zcGluX3ByZWVtcHRfbm93YWl0KHN0cnVjdCB4ZV9zcGluICpzcGluKQo+ICt7Cj4gK8KgwqDC
oMKgwqDCoMKgc3Bpbi0+d2FpdF9jb25kID0gMDsKPiArfQo+ICsKPiDCoC8qKgo+IMKgICogeGVf
c3Bpbl9jcmVhdGU6Cj4gwqAgKiBAb3B0OiBjb250cm9sbGluZyBvcHRpb25zIHN1Y2ggYXMgYWxs
b2NhdG9yIGhhbmRsZSwgZXhlY19xdWV1ZSwKPiB2bSBldGMKPiBkaWZmIC0tZ2l0IGEvbGliL3hl
L3hlX3NwaW4uaCBiL2xpYi94ZS94ZV9zcGluLmgKPiBpbmRleCBjMjE5OWQwYWEuLmVhZjJhNDA5
ZSAxMDA2NDQKPiAtLS0gYS9saWIveGUveGVfc3Bpbi5oCj4gKysrIGIvbGliL3hlL3hlX3NwaW4u
aAo+IEBAIC02NCw2ICs2NCw3IEBAIHN0cnVjdCB4ZV9zcGluIHsKPiDCoMKgwqDCoMKgwqDCoMKg
dWludDY0X3QgcGFkOwo+IMKgwqDCoMKgwqDCoMKgwqB1aW50MzJfdCBzdGFydDsKPiDCoMKgwqDC
oMKgwqDCoMKgdWludDMyX3QgZW5kOwo+ICvCoMKgwqDCoMKgwqDCoHVpbnQzMl90IHdhaXRfY29u
ZDsKPiDCoMKgwqDCoMKgwqDCoMKgdWludDMyX3QgdGlja3NfZGVsdGE7Cj4gwqDCoMKgwqDCoMKg
wqDCoHVpbnQ2NF90IGV4ZWNfc3luYzsKPiDCoMKgwqDCoMKgwqDCoMKgdWludDMyX3QgdGltZXN0
YW1wOwo+IEBAIC03Niw2ICs3Nyw4IEBAIHZvaWQgeGVfc3Bpbl9pbml0KHN0cnVjdCB4ZV9zcGlu
ICpzcGluLCBzdHJ1Y3QKPiB4ZV9zcGluX29wdHMgKm9wdHMpOwo+IMKgYm9vbCB4ZV9zcGluX3N0
YXJ0ZWQoc3RydWN0IHhlX3NwaW4gKnNwaW4pOwo+IMKgdm9pZCB4ZV9zcGluX3dhaXRfc3RhcnRl
ZChzdHJ1Y3QgeGVfc3BpbiAqc3Bpbik7Cj4gwqB2b2lkIHhlX3NwaW5fZW5kKHN0cnVjdCB4ZV9z
cGluICpzcGluKTsKPiArdm9pZCB4ZV9zcGluX3ByZWVtcHRfd2FpdChzdHJ1Y3QgeGVfc3BpbiAq
c3Bpbik7Cj4gK3ZvaWQgeGVfc3Bpbl9wcmVlbXB0X25vd2FpdChzdHJ1Y3QgeGVfc3BpbiAqc3Bp
bik7Cj4gwqAKPiDCoC8qCj4gwqAgKiB4ZV9jb3JrOiBoaWdoZXIgbGV2ZWwgQVBJIHRoYXQgc2lt
cGxpZmllcyBleGVjJ2luZyBhbiB4ZV9zcGluIGJ5Cj4gdGFraW5nIGNhcmUKCg==
