Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF141C369A1
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 08:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6B710E810;
	Wed,  9 Apr 2025 08:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LjJ2tDN8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829C110E309
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744187994; x=1775723994;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=55vy7h4JTv8X3PlEwPcDDJOe0+rAaHl6CgEJpLcCjMA=;
 b=LjJ2tDN8vYoAJoTWEzPWjlegcB/PLOakoudDjygk5KIXUyorJQGDs6SR
 3Az/WyoLCKdyg7qQh+ig4wKPZJHwqnaGJWBTvQKNST4XJBa2z56SYhlRB
 y1vZoIAn4PH52/RQxH2y85gB+bHUN5YMTC39eZUghOioIWLQD4nxtUDmv
 rOm4ZchIc41eOiVGagxvjY4U6PVQPqj3VTfz95DB2ERUzBswnxCFnNSOq
 FtuhOEw4vOkLn3SdcKPDtyJmrYCpfUhNqsdxO0SLWOQ7QKlxFvJ9VQkg4
 Li1qSiL/yRpaqfxK3+ZBw/5g5Np8IW5K2f5+/updrEqNSXe/6x+RsH4uH w==;
X-CSE-ConnectionGUID: rjGBAG1MTt24hl9q6KdDoQ==
X-CSE-MsgGUID: 7UTrBI51QM+DrFMeDlFJEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="68131746"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="68131746"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 01:39:52 -0700
X-CSE-ConnectionGUID: J8ks2tdIT462wKzdrZyz4g==
X-CSE-MsgGUID: 2ZxfqKLFQ8arwAJtLQxC5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="132649411"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 01:39:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 01:39:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 01:39:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 01:39:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfcWc3xyGaDafOMa3B70PSiDXH6CcbaYuD7P5t9sjjoOOzfJXzdYuTCZw6Rdd2i+AObDdcG1IJCYigqqVkZ96EpoA/Jla4MoVR3KTByGX7/pgIz5Nv933yTzj/bRwDNZo1NwvhpTqBoqMIaK6iiyYp1aEPBMaQdPdZxAPDEgllHsnR3DGtlNzHRjpjYESBJC4/av72lAFG1c7pwHGo0+3GGxBW3J2UXzX9c+XU0X/I7Eh+2UVyhzxqx4T07Z7n1WWXqFUTiB9uT0IbRH6/M3EHuJr/HMrUX3jVeiw31UVQJmzCSZgR1YtZFvBDqqs4VY5vQwcjg4Kw2Lh5qUciKLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55vy7h4JTv8X3PlEwPcDDJOe0+rAaHl6CgEJpLcCjMA=;
 b=bdCBfX70j8T8Dy2NKhZiE8AzkX5npnjea+mx7BjfFEsW8z6AdP7/fdOfIrT5O2pPf/n0UPS7VYZaSelVZXfPsuIbqc5DhuIBec42rgiYpoiL9/i6+7SI6OLmr3h0SsZEZ+xXP3DIxSq8VveGJbOicQPkxak0gyDiZfi2kpfCnBlpY4THZhw4Kcv1Fqu4QnUUAc1fhKn8pqZBHocfl4DrI2cLkQKHw6Is1VDbCnfykS2v+Zq9Tb/iidomcOD3zcKEC739wno9gmcpp7CZRx+cjnVUqlv5qUhYCmkd3bEElisa3EOm+DxIoplpDzio1Q0U9xvAwGx0VxTvFe7Luyt3zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 08:39:42 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 08:39:36 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH i-g-t v3 5/5] tests/xe_compute_preempt: consume all ram
 for wmtp
Thread-Topic: [PATCH i-g-t v3 5/5] tests/xe_compute_preempt: consume all ram
 for wmtp
Thread-Index: AQHbqLc6aQDq3Ij+Z0ib0LTvLPuqDrObBDlg
Date: Wed, 9 Apr 2025 08:39:36 +0000
Message-ID: <CH3PR11MB84342F167022F306961380B48DB42@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
 <20250408185045.272673-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250408185045.272673-6-zbigniew.kempczynski@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CY8PR11MB7082:EE_
x-ms-office365-filtering-correlation-id: 271bfecc-6b0d-4c0f-5516-08dd77420f4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?NkkwdjhQVjlYcldkUFlwRHRJdjlFTlIxZzJFejBzVHRjZVcxQjhGZk1LVnZG?=
 =?utf-8?B?NGl3L3A4Q3FtaUhXYVN1U2RlRUhwcFRyV2wvK3pTOUdHMUFWOTlnQXcrSm96?=
 =?utf-8?B?WjM4dlNJVlZqNHBjdDhXNXBWUk9jWmFoNFh4NXRldkdYNGtSMHZMdWRnS3dB?=
 =?utf-8?B?SjdLQ3ZtRWlWbEVjWldOekF3aEpMV3EvQ0EvQU9ReFJmdWlvNUlYR1ZLMUI5?=
 =?utf-8?B?eUxieVE3Y2YrdHJ4Ulp2L1RySzUvbEc3bDJSK1lIaytoR2VxYjNiUnA2KzNY?=
 =?utf-8?B?bnpzelN2Q2NMdnJuTi9MeDdtb0NKTnJqY0JOTEpTeEE3M2VUaktxc0NObHJy?=
 =?utf-8?B?YzAybVFVTXVrRkpDb2dYYm45QW5GVnpEejhQblRhcXhrRW5DWkVISjViOEs5?=
 =?utf-8?B?aC9mNTU0cG9yeDlqaFRLVEtSU20rb2NwRWltUjdoUDArR3F2VTlrN2pzUFNT?=
 =?utf-8?B?c0wwTVFqOFlYTHlJM2ttRnl0UWFRRHdnZk1jbXIzY0M3N2FpVVhpa0V4YUN1?=
 =?utf-8?B?VWNLVHF4L1FsMWVZVUEwM3ZsclZQR2NVTlZjek55UkxOelBBMi9WMlpJY09u?=
 =?utf-8?B?S0s1SWd5QTgwUGVvWlA3OUoxUVd2Q0JXbmVQejNmUU4yb25hMWFrb3l1ZXhP?=
 =?utf-8?B?SWo3WjhxT3hpUWhvcEN0Z3NsbC83YzdZQks1V0dMdXZUeFdyTnNaWjdpRjNJ?=
 =?utf-8?B?WnpxTG9LRElvQUlmUHZORHg1TVg0S1gyZm5XTmZ0cGFrZHRwbit6UmFvRzR2?=
 =?utf-8?B?YWgvU1BITEkwMDAxTlJTeXlnbHNqYjdnQ0w0LytZOUtLZkRzOExDTVRBVjVU?=
 =?utf-8?B?bjI5YU4yRGt3QWg3djNmVURrU2NNVm9YT3NySnN3TnY3VXhBbFJyM25YdWgx?=
 =?utf-8?B?RTFNU1l6U3RtaTAvMlBlRTV1bTVCNUt1ajRLelpKcTI0N1VaNmYyL0hzYXBi?=
 =?utf-8?B?SHVNQUNSeFc2d25Cb0FMK05maDdLMzUyWTVBQzN0WWg4eSs3THg2YjZFdThO?=
 =?utf-8?B?Zmt4bkthamx4NmFCNkp1YzdWNi9EZUJUZWZTS1Qxd0VxQVV2NEREaXROaHUr?=
 =?utf-8?B?Q3pTTzcyRXphODRxOWFVTkRTQko0amdPT09BMXEyVDVNcmt0MDRTeFVMRFo4?=
 =?utf-8?B?cW0yR2k2MUdwYWNBRVF3alltQ2ErMnR0WlFVUXFzRm1qYTU5Q09mcHhZelZi?=
 =?utf-8?B?UzAxNkYrVmI1SmhjTVB1Y1dtck9XNFpYUnZFUk9mUnI5WmRacEtNMS9Wb0FI?=
 =?utf-8?B?ckRVR2lFeUNDMFZRb0k5ZmpLUk1nTlhTQXpyWUZZWkxtSXJ0SHhESHdjTm9o?=
 =?utf-8?B?QTJwNWVacEc0NXFXZnM0dFAzbUdzMDhvL1ltSm5CcysxSldvNXpmZTY4SjRS?=
 =?utf-8?B?Qm5CNXdkNm5oYzJ6MWt5YzNvalpUM2k5cjZ5N2tVUFV1VEhFUzNOQTRmcHEv?=
 =?utf-8?B?WXF4c0Y5RnpPRkZoWU5ZRGprU2JMdHU1K1c4ajJWNm1EQkErVmxaUDhBQ1lW?=
 =?utf-8?B?UFlwdGZmSUFTN1U2K1ovRFY1RytDOGhlbTVERG84b2hXQWw5MlRIbUg2VVE4?=
 =?utf-8?B?c2ZGNmxwdDNRaWxudXBTMXBwcmhyWkxrTWlWaWdYeWltS0dMUTIwcDlDN284?=
 =?utf-8?B?U2lOQmtRL1V6MUc2TWYzQ0gvYmpwZ1k2NzRBZmZja1JRM0hHSS9CclVSWGtT?=
 =?utf-8?B?ek9iTUl6cFNtc1N1cEtSTG9heEw4dmRTS3BFRTVqMmpnYURLMFN4WWFsWklJ?=
 =?utf-8?B?dDJmeHZQdEtGb1ZLdFJnRytrOVRrUTRJUGlTazNINTFEOWVEbExsNU1zVWg2?=
 =?utf-8?B?cy82b005MHdWL1EzWjU2YzJNQWp1eW9vZkllNzBkWkVsbGQvbWNNTnRsWTNt?=
 =?utf-8?B?WEhqUVlOQmVaTFhpdWU3OHIwRThmdE9SUGtuU21CUnZWdlpWNFpiei9Ta0sx?=
 =?utf-8?Q?lN3fA/gTMXyAeFidPk68bEArNzYiaoNf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZER2R2paSjBLVXhCRUFabm5kY1VKTmoyT2hyM29iVVdQaWJCb2ZpSVlBMldu?=
 =?utf-8?B?Wks4cFYrb3VqU1ZJVS9jbzZ2YjFPNzVaOXpUWUpGVGhhenUybWdvMWM0YWV6?=
 =?utf-8?B?YXZTaUJFRnZmUVVORUVQdHBKekpYLzZSN0Z0MXVHNnZIWFE3OWRVNCtuc21M?=
 =?utf-8?B?VGZYbDhFSjBhV3MreW0rQjFLVGQ3OE9OaVF0TWUzbkhHRllRaGxPZjJ1MFpy?=
 =?utf-8?B?dXFDWTNwRVdhdEVzZUl1cWMzV0J6SmNURmx6TjloQjE1UmtvWFlZRTNJZFl4?=
 =?utf-8?B?MkExcVo4T1huNzNHZnF6N3k2bzB6dDZDM1hwdlh0YXUzdWZQQkhTU0M2MWdu?=
 =?utf-8?B?OHdLVVJyRG9aazUvUGZXb3c1OHNxRGJqc0hmanFWaTZ1SmxDbDN1a1RVdFdi?=
 =?utf-8?B?eHA1WXBRQVVSM0puTWFKc1ZDZVh0eGZjb2RjOUxMSDVJUG5aYlh1NGJxZkFZ?=
 =?utf-8?B?WjAvZWZWakNTYncwZmd0eGlkSmNQZVhjbVpEdDViZXB1d1h5cW9GM2dMZEs4?=
 =?utf-8?B?WEtoekdQYnY5RUoyeFNNSVQvTE9oMlJpcmcxNm9LNDZaVzc5N2RrTXhrWDRK?=
 =?utf-8?B?OVA4b3JYQmNheTJiYkYwNGlNTWRJS25xdGhaYmRmRU16bzUwMldBazhwcXVt?=
 =?utf-8?B?MlJweDFldXdjTVVPdEovbll0RHNuSGZDVmgrV3NmY2hUUXhSUHJUYUdyZkxu?=
 =?utf-8?B?VHNTMSs4SlBLL2FpRVFlNUhuQytFK0RKU3haak52RTlCbUw0clNBelNlU1ZS?=
 =?utf-8?B?ZXNkdUU5d29KZy9rNFJhT0ZJeGVuMGJpSHdyUjlYdHdycWR4YlUraUpXMm4z?=
 =?utf-8?B?T2FCYTFuazdib3ErRDJtYWl4ajQyQlQySHV3VmlGUU1jYzNoaDlxcWd0ak1r?=
 =?utf-8?B?YnBwc2gydC9mM3ptODA1Q0Q3emFyNWlVNkFqN3VYMnh3RWNGc2xnY3oyc1lY?=
 =?utf-8?B?UXZYMU1WclFLT2tGbi82RzE5cU9adVFyTjRiTVB3ODN5bUpGaWxua1Irbloy?=
 =?utf-8?B?OC9vWVQwSXNDWVlEWmpqTEo5UjZnZzROSlJ4eEpVR0hINWt1Q2dVT2dLNTVE?=
 =?utf-8?B?bXdGSkdZODVHZjg5OHRFRldvUkd5WE1CTVJTcmcxS01JNzJDQ3JHYzc2WGxN?=
 =?utf-8?B?cDN6Q0NVbzRLZExWZnArSjBSTG13SlpwNGtaWU1qQmpKOFh6MndGQzh5K3Zv?=
 =?utf-8?B?TmZ1K0RDbExkQlV4MFVjVHlFTWJrRG96TUlieGVvTGJyekZRNGJsZVNvTlV3?=
 =?utf-8?B?YVN2VlVZMjI5c1ZPRVlMRUNseFo2V1BvVUx5TFlFZW04TjRSeWhxK01zL3Rq?=
 =?utf-8?B?U3Y4Nkd0aEpvVjYzZWpuMmN1aGUydkFHb01nbU5KSXIwVE5mV0VncDkzL2VV?=
 =?utf-8?B?M044WEd4NDRpS2M5TlBiVUFPUTY4L2c2ZncxVFYvZllDQk4xNlIxeEpPMWcx?=
 =?utf-8?B?RG1ub0RXL2pzQ3JzMHNQTkluUjRMQms2cjBtOS9rcnpGUUxzMGRiYkZPVDF5?=
 =?utf-8?B?WmlXOFhycTJ6QWZIQ01EaEV3S0t3dXhPaFZ3cmZONDJzZHJCVGVjOG5jczcw?=
 =?utf-8?B?VEFxSEl3Z2JXSC83dEJBN3NaSEg4dHpHMHhOUXlmQWI5cE1jNXh3dk81V1oy?=
 =?utf-8?B?dVVaSXVrZ0NIVys5eHFKK1Bib1d0NlMreSt5WE5TcWk1QnJPOE9OYUJPMUZH?=
 =?utf-8?B?bXRtZlprdlFCdnhRVlBZbENqeVhMV1JZODZBTjBFSk1qdGhnZ3JFVVV5a3oy?=
 =?utf-8?B?RDMwWHhaNzg4RTVhL0hqbm1BVGUxK0s4SWdiL2p6NCtEOXJLbW5ZVWVxTS9U?=
 =?utf-8?B?UWN3OStxeDFBNFdFeC9sNGFyRGF1R3hTY0lhUFZHR0RsTkVJK1QrMmtod1ZP?=
 =?utf-8?B?VmJhMm5BZENIeG00VVJyamh6YU44Y0Z1WkhvcjU2Q0locGNaWnVQVEI5dkJu?=
 =?utf-8?B?RHdveHlkU3BrZUpJMUxYS3ZTL01WaXRlZXRHMkhmWU5Tb3c5UlhBT3M1KzFo?=
 =?utf-8?B?VXlyQzlKa3BBUzZEZ1ErR0NJYVJNNE5GUlAzY2k0cUtkT2pQamdEc1JRSnZY?=
 =?utf-8?B?N0t5WktNYlR4THd5bSsxM0JPSWRhWlFPVTB6MEorWnF3Njd5aXJqNCtaUkRB?=
 =?utf-8?B?SjJuZElybWZDMDJuZGlxYVd1U1JKZnJWTHpGYzRrLy90ajA1NkxMQUdHR2tH?=
 =?utf-8?B?RmtVV000cEEyUzhQT1BiYU4rNWFtTXlhYTgvdmQ0blpOTmNvWVV3TmF3Rjdo?=
 =?utf-8?B?SXFkOGlrL08vcFMySDhOaTA4S0J3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 271bfecc-6b0d-4c0f-5516-08dd77420f4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 08:39:36.4536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YKXDrZes5zo/70gPCNjxI6vmfZb2gqgo+gBjbCtqcmyHG8ddC/xEECYb8azVUL8MdNGBeIJCPyZeD0YIBEI+TUV5lqjIsT/Ugo53MbfHhDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2VtcGN6eW5za2ksIFpi
aWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNlbnQ6IDA5IEFwcmls
IDIwMjUgMTI6MjEgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47
IER1Z2FzdCwNCj4gRnJhbmNvaXMgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+OyBEYW5kYW11
ZGksIFByaXlhbmthDQo+IDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggaS1nLXQgdjMgNS81XSB0ZXN0cy94ZV9jb21wdXRlX3ByZWVtcHQ6IGNvbnN1bWUg
YWxsIHJhbSBmb3INCj4gd210cA0KPiANCj4gV2hlbiBzd2FwIGV4aXN0cyBvbiB0aGUgcGxhdGZv
cm0gbGV0cyB0cnkgdG8gY29uc3VtZSB3aG9sZSByYW0gdHJpZ2dlcmluZw0KPiB3bXRwIGFuZCBl
dmljdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJp
Z25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBDYzogRnJhbmNvaXMgRHVnYXN0IDxmcmFu
Y29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiBDYzogUHJpeWFua2EgRGFuZGFtdWRpIDxwcml5YW5r
YS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX2NvbXB1dGVf
cHJlZW1wdC5jIHwgMzYNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfY29tcHV0ZV9wcmVlbXB0LmMNCj4gYi90ZXN0cy9pbnRl
bC94ZV9jb21wdXRlX3ByZWVtcHQuYw0KPiBpbmRleCBmMDdlODdkNGM0Li40M2ZmYjhkYmEzIDEw
MDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9jb21wdXRlX3ByZWVtcHQuYw0KPiArKysgYi90
ZXN0cy9pbnRlbC94ZV9jb21wdXRlX3ByZWVtcHQuYw0KPiBAQCAtMjksNiArMjksMTIgQEANCj4g
ICAqIERlc2NyaXB0aW9uOg0KPiAgICogICAgICBFeGVyY2lzZSBtdWx0aXBsZSB3YWxrZXIgbWlk
IHRocmVhZCBwcmVlbXB0aW9uIHNjZW5hcmlvDQo+ICAgKg0KPiArICogU1VCVEVTVDogY29tcHV0
ZS1wcmVlbXB0LW1hbnktYWxsLXJhbQ0KPiArICogR1BVIHJlcXVpcmVtZW50OiBMTkwsIFBUTA0K
PiArICogRGVzY3JpcHRpb246DQo+ICsgKiAgICAgIEV4ZXJjaXNlIG11bHRpcGxlIHdhbGtlciBt
aWQgdGhyZWFkIHByZWVtcHRpb24gc2NlbmFyaW8gY29uc3VtaW5nDQo+ICsgKiAgICAgIHdob2xl
IHJhbSBvbmx5IHdoZW4gdGhlcmUncyBzd2FwIG9uIHRoZSBtYWNoaW5lDQo+ICsgKg0KPiAgICog
U1VCVEVTVDogY29tcHV0ZS10aHJlYWRncm91cC1wcmVlbXB0DQo+ICAgKiBHUFUgcmVxdWlyZW1l
bnQ6IExOTCwgUFRMDQo+ICAgKiBEZXNjcmlwdGlvbjoNCj4gQEAgLTQ2LDExICs1MiwxMiBAQCBp
Z3RfbWFpbg0KPiAgew0KPiAgCWludCB4ZTsNCj4gIAlzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFz
c19pbnN0YW5jZSAqaHdlOw0KPiAtCXVpbnQ2NF90IHJhbV9tYjsNCj4gKwl1aW50NjRfdCByYW1f
bWIsIHN3YXBfbWI7DQo+IA0KPiAgCWlndF9maXh0dXJlIHsNCj4gIAkJeGUgPSBkcm1fb3Blbl9k
cml2ZXIoRFJJVkVSX1hFKTsNCj4gIAkJcmFtX21iID0gaWd0X2dldF9hdmFpbF9yYW1fbWIoKTsN
Cj4gKwkJc3dhcF9tYiA9IGlndF9nZXRfdG90YWxfc3dhcF9tYigpOw0KPiAgCX0NCj4gDQo+ICAJ
aWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljKCJjb21wdXRlLXByZWVtcHQiKSB7IEBAIC04OCw2ICs5
NSwzMw0KPiBAQCBpZ3RfbWFpbg0KPiAgCQl9DQo+ICAJfQ0KPiANCj4gKwlpZ3Rfc3VidGVzdF93
aXRoX2R5bmFtaWMoImNvbXB1dGUtcHJlZW1wdC1tYW55LWFsbC1yYW0iKSB7DQo+ICsJCWlndF9y
ZXF1aXJlKHN3YXBfbWIgPiBDT05URVhUX01CICogMTApOw0KPiArDQo+ICsJCXhlX2Zvcl9lYWNo
X2VuZ2luZSh4ZSwgaHdlKSB7DQo+ICsJCQlpZiAoaHdlLT5lbmdpbmVfY2xhc3MgIT0NCj4gRFJN
X1hFX0VOR0lORV9DTEFTU19DT01QVVRFKQ0KPiArCQkJCWNvbnRpbnVlOw0KPiArDQo+ICsJCQlp
Z3RfZHluYW1pY19mKCJlbmdpbmUtJXMiLA0KPiB4ZV9lbmdpbmVfY2xhc3Nfc3RyaW5nKGh3ZS0+
ZW5naW5lX2NsYXNzKSkgew0KPiArCQkJCWludCBjaGlsZF9jb3VudDsNCj4gKw0KPiArCQkJCS8q
DQo+ICsJCQkJICogR2V0IHdob2xlIHJhbSwgdGhlbiBkaXZpZGUgYnkNCj4gKwkJCQkgKiBDT05U
RVhUX01CICogMiAobG9uZyBhbmQgc2hvcnQpIGpvYg0KPiArCQkJCSAqLw0KPiArCQkJCWNoaWxk
X2NvdW50ID0gcmFtX21iIC8gQ09OVEVYVF9NQiAvIDI7DQo+ICsNCj4gKwkJCQlpZ3RfZGVidWco
IlJBTTogJXpkLCBjaGlsZCBjb3VudDogJWRcbiIsDQo+ICsJCQkJCSAgcmFtX21iLCBjaGlsZF9j
b3VudCk7DQo+ICsNCj4gKwkJCQl0ZXN0X2NvbXB1dGVfcHJlZW1wdCh4ZSwgaHdlLCBmYWxzZSk7
DQo+ICsJCQkJaWd0X2ZvcmsoY2hpbGQsIGNoaWxkX2NvdW50KQ0KPiArCQkJCQl0ZXN0X2NvbXB1
dGVfcHJlZW1wdCh4ZSwgaHdlLA0KPiBmYWxzZSk7DQo+ICsJCQkJaWd0X3dhaXRjaGlsZHJlbigp
Ow0KPiArCQkJfQ0KPiArCQl9DQo+ICsJfQ0KPiArTEdUTSwNClJldmlld2VkLWJ5OiBQcml5YW5r
YSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+ICAJaWd0X3N1YnRl
c3Rfd2l0aF9keW5hbWljKCJjb21wdXRlLXRocmVhZGdyb3VwLXByZWVtcHQiKSB7DQo+ICAJCXhl
X2Zvcl9lYWNoX2VuZ2luZSh4ZSwgaHdlKSB7DQo+ICAJCQlpZiAoaHdlLT5lbmdpbmVfY2xhc3Mg
IT0NCj4gRFJNX1hFX0VOR0lORV9DTEFTU19DT01QVVRFKQ0KPiAtLQ0KPiAyLjM0LjENCg0K
