Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01727D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 11:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F6310E5C1;
	Tue, 20 Jan 2026 11:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1KkBOQv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DD310E025;
 Tue, 20 Jan 2026 11:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768907991; x=1800443991;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0OJuxPljFgdO6pJrKkB6wDrI4bHsHhfyEOkOJmsbEj4=;
 b=X1KkBOQvUxs82QMlHoB0lxUS81+KSxvr4zQKzMbDd7X8y2t86j8e97+O
 SeSY66Ag301iUPIMopsNOohlF55hF6SwePxolwRUFFLUY8iKXILj4CE08
 wzXOoOb6pPvWqN7Q6A4ec8rqYQSbSSE79M2Fbtle//4zfr/IjiN+/ic0k
 naV4XNcZASean9pyBy0jfIvWoA/lj1TPlny522DZxvMzKehSb3BrNHFvl
 DNIZp3d0+nRAifzkeKZ65MDxkxomPycBgZBvtpeI3nV4czGUqyhR5tWRe
 YXNv4f2fl1/P1wNjI3UnU5LpXoJmlMyUEEKXLUgKYs5lcE1MSmNri9pnb w==;
X-CSE-ConnectionGUID: Mr1pQXMNTQm+mbDUifQ+Pg==
X-CSE-MsgGUID: y5YOdAaZT4yWDkIWfP/mAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69842078"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="69842078"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:19:50 -0800
X-CSE-ConnectionGUID: s1TwnxsQT0as5SdRonjgRg==
X-CSE-MsgGUID: OV/IxnB/TYKUPnnzXMacjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205345642"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:19:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 03:19:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 03:19:49 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 03:19:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOExT8pi6p6n1ipohCqjMLe/DTI5cJCJkWaXJiXnwfmZq7wJNROjzMwMCLP36UZj4L2z4a+qAQG0wejEZvMLF9HF1edfLDSU0Qj/lR+wIY23rfUNIEwIN0H/oLIvqToxgCBRhnpCEbk1AALVMhGK44rYR+mKvK50rveTMLd58H7AIgANfZAnx4Oqk1X9ihqpRL/m+KWzQP8ymtVFETPm+16rCHMiCfHy3HyoXcHklhG/gEbSbG0/rMPvHVNrjyPh/U1B2VOMdxWSD8qvWiQcZpH1UB8sn8St/qWJuQIbVeo4Kc8WF4Uobo4eU969cdeoh5XKwXyzATMFUGqWYfkkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OJuxPljFgdO6pJrKkB6wDrI4bHsHhfyEOkOJmsbEj4=;
 b=F/7xChZPoj1iubSfrn5Go2QEG2f5Zj2pgyo/pGf2R9LwuJZykXwcGM1vkJdpKyyRpm4hQdZIP/03NNrVn5nWLordVeForE8Mq8xxgC+KhSAF0PMBCbUE6LvJOJzC0UxfblI7/jSCOLGqNeJ9FuVtLd9bIXr4IezKxemVIQJUc56Uu9MfZLdQGtfFnhaI+WsCvwiJxstBGRv0XE9LwsbYykVtu2778CrH2nJdHnpbDVtpLAGcL77/+jLCHKiPoioWapfCPjjGp286fugW24yr0pbL3QJALBgT1N2PgNyksMzzfLmHZGGZ44aog+4eRavzV7Mb22wHKI3wFR0WW06/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by SA1PR11MB8277.namprd11.prod.outlook.com (2603:10b6:806:25a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:19:46 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:19:46 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVs?=
 =?utf-8?B?L2dlbV9sbWVtX3N3YXBwaW5nOiBBdm9pZCBmYWxzZSBmYWlsdXJlcyBmcm9t?=
 =?utf-8?Q?_oom-killer_(rev8)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvZ2Vt?=
 =?utf-8?B?X2xtZW1fc3dhcHBpbmc6IEF2b2lkIGZhbHNlIGZhaWx1cmVzIGZyb20gb29t?=
 =?utf-8?Q?-killer_(rev8)?=
Thread-Index: AQHciey6Z9tjjL0nY0meifShyb4t67VazUpg
Date: Tue, 20 Jan 2026 11:19:46 +0000
Message-ID: <CH0PR11MB549120D74DF9875BF2CC1804EF89A@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20260119101735.1328416-2-janusz.krzysztofik@linux.intel.com>
 <176887552915.169327.12057879371263442688@a3b018990fe9>
 <2778826.KRxA6XjA2N@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <2778826.KRxA6XjA2N@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|SA1PR11MB8277:EE_
x-ms-office365-filtering-correlation-id: c3f6d5c5-a6b9-444c-4457-08de5815d13f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021|7053199007|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?dUlUVisxU3Z0VTBqLytyMnh4S1J3ZkJFOE1oNUc4MCtTWWZ4SGZpVmFid084?=
 =?utf-8?B?cFpQVVcrc3NhaUloUmE3RGx5T0VUaHFjYXRMRlB4SWJycVI4ZERRemw2UDBD?=
 =?utf-8?B?V0FRUmZLbWptclJTMEZYYVhmRURTZUdLK240eWhYajhWMVhZWVFtejlaZ2hv?=
 =?utf-8?B?YzdCMlExbWlkMUJFNmFPQ0VhekszTWo2anBqZ1A0S3UxQ2l5b3hSaFgvMHNq?=
 =?utf-8?B?alRnZVhmcUVTUzd6NXEyc1FvR1drckZhaG1naUZGbis5ditzZlJBcCtFY0hZ?=
 =?utf-8?B?UnQ1ci9CTjZNV0tmNnZ0QlAxZ3BoK0RFQ2VwQWFDd2EwSmlEODVpQ0FjZFNO?=
 =?utf-8?B?cGxZME1lQk5aNUxwZzdGVGZ2Z0lid0sxWUZqZ0cvN0lrd0UvMWNmV3FEYUQy?=
 =?utf-8?B?WlU5UkxYT1RJSmVyYVFYWjNuNVZhbWJTS2o5NEZkNWtreGFiZ05nemNQRUI5?=
 =?utf-8?B?a2RlQjNjSkZxTWE0RTVVOU5JdmZQT0Zhay9tVnU0SC9JSGxzekF3Qy9jK0JB?=
 =?utf-8?B?ZkFjNXJBUnI0aUxqNXIvVVZOWU83Zk91MHl2NGJQaVN6S2NYRHJ0R0h0cTVH?=
 =?utf-8?B?WUk5Q0VyaE9vT2hRdjhIcEtkKzVMcGFrUWNRcDkwYjR2UTh1a2FhY0loaHlM?=
 =?utf-8?B?RGluTkxqNGJyaWNoZjlVd05PYzZDZHZjOHB5T1doVEo5N3ZXclFuV2kwL1hn?=
 =?utf-8?B?cVp6Y1lMRE41TnRzMStLNVNLUGtNL3NvYjNJcm1OaGJnVG50RGVhdjJZOURm?=
 =?utf-8?B?TjdlalBMT24yWkNuZHMvVWZRMXcxWVZFVVhBNnJuUVUzZysxNk9OMzFicUVm?=
 =?utf-8?B?OU9EQXNDRGIrUUdjbEhlZmZHM2YwZGw3SVNCUmdqYnhzUExlcSttUUVYTFY3?=
 =?utf-8?B?Vmp5TEtycHlJQll3UmhYTG96OWJPbHIwVlBlcmNHRXMwOHNQMTBvUGdXR1pW?=
 =?utf-8?B?Y0x2ZVRXQWZkSzRmZzdPanBqYm9XZXZyT3NtM0tKcDg3WmtKL3NPNHRxQjVj?=
 =?utf-8?B?c0NBRnhyR2RIdzJZZ2hvbTFhNUFTdWkranhUTmROam8yMHE0M0twS2JJeGha?=
 =?utf-8?B?dWt3dEl3OG01T05WeU5ueGx5RXRuRUI4SFJ0enpsMGo0UllrekdNUnhJZHgy?=
 =?utf-8?B?VlkxUWl5a2JwTmprNGs5bjVET3o1SStoOGxjMHhOWTFXSy9SL01KbnhBL3Nu?=
 =?utf-8?B?VDV4K2Fvb1BlMk10OUk1WU9QblVLOFIwODQvT2xEdHVMM2U1dWRueThvSU82?=
 =?utf-8?B?aUVKUis0Q25GTWJmZXFCRGsySGxRSm85N2R1bnNIZ3lPTnk0N2RxSE5KclVY?=
 =?utf-8?B?cHpiOHJWY0E4RGYzNFhsbDlNK1FBZXZtVHJIdkh2TGRSQmlWbFhCUDlsUXBL?=
 =?utf-8?B?ZHBtWDdjeS9PNnpSczIyTU8xZENJMTNHRzNQdy9nM2pLN01IMWZXeFg5czV6?=
 =?utf-8?B?YkZoWnR6eG9pNXRHcloxZGg2K1lGd3lNMm93R3EzZU9FU29sWkhIV0YvM1A0?=
 =?utf-8?B?QjZ0NE9xaFNFNkNiTVY2bS91SVc3TUF1VldzVjVrZ0RvbVJsNEVmYmlBSGcz?=
 =?utf-8?B?UEdJRlFWSzFyTjd6c05Ta1JGbEpTU0xnd1JQbkhDeHVPTU85WTNDU044SUdG?=
 =?utf-8?B?eGNDODlENG1YcGdUTTBaNnpNanNsQ0ZGRm9taTNNc1FXMUt2S3ZlVTAya1RJ?=
 =?utf-8?B?UlBUVUJkZVQ1WGNIS0FURTZTZTFjWC81RGs5M01Eb1JqVk13ZGhLendoZ0R1?=
 =?utf-8?B?ak90S3pxbUx0SFpNZmlHREQ2YjI3a09PbFNTa0hrWUZ5MTNpM3h2MnVvenVL?=
 =?utf-8?B?bzllZlJWYkYvdE5sMjJ3MVNlbmZPSWw2Z3kxZitzeHFEUlc4QnprOGVXRzll?=
 =?utf-8?B?aEhYakNETmNtYVdMNm1KMW1vZmRlVFF1NU04YWxlZ1A4VHRERVFmbkwwU1NE?=
 =?utf-8?B?a2tJMFpwdER6ZGlJUWJPd1VyNmx4Qk1IOUZ0SDJ5b0FxS0c2UWp1eWN1eStH?=
 =?utf-8?B?NlR4aDUyVkJkM01IRkpMZ0JrRyt0T1NnT2NqRTU5ZEJUc0RITDE4T2dlYzFS?=
 =?utf-8?B?WjQyaFQ4eUVsRXpCamYvRVpObWxodHBvTktNYis3eFVac0xWQ0w1b25jVVVx?=
 =?utf-8?Q?wYg/3UI4xhjrIJfPftocSPx4D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WENjRUxsdHoxVXczQ3NvT29Semw4bjN1YmhNS0h0N1puc2VTNk9jb09yNE9S?=
 =?utf-8?B?Y1Rxd3dJV1RWeSt3Z0EyR2U5SU5EWGdCQTVCaTZ4NmNqc2NGeDdUN0lSU2JM?=
 =?utf-8?B?V0RRUFNPYk5RdmxBZk03UEdVSGFyUUJXWi9qR0JJd2l1QTdqOTNZdjdKZTd4?=
 =?utf-8?B?RGdqa0dzVllzbGo2MjJWYzgxM2cvZGxCUGZIN2hQa05idDdFWk1QeUdXM09R?=
 =?utf-8?B?cStsUWtRWU0rWmUrNzFXOHVRUktyZXdlUm90akJGMXd5OUhXd1lRQ1pNd010?=
 =?utf-8?B?T2E5VmFVdW04bGhrN25RNVoyREFTdURsQnFNZE1XdFErdWdwNWVZWkVObzBn?=
 =?utf-8?B?OC8vSlJwV0lBRlJCYy83TkNwblhTMSt5Q21aSjYwdWVQZzVRSUFVU3Z2RUsz?=
 =?utf-8?B?ZlZwTVJnRXgvaFEzbEpQRzlEUFEzQVB0eUJQYzNMTmptWTVaVnNxdHByNE1l?=
 =?utf-8?B?S01Ld1VQMk5OYzZEZ01iL2xSU2tLMUZacVNxY21OVVRZai94N2xOcjkwQ0FU?=
 =?utf-8?B?dnpkNm5JMk1yeDNLdXdXT2xGVlMxVldZSFczZWVhQmgyWjllb2hvckxHMWwv?=
 =?utf-8?B?cUR0RWIrR01MQnE1czdwUjZ2cHpDUGdCVFdORHJnMjJTTFVwZFU1U2xFVVJB?=
 =?utf-8?B?NUlSWE9hdzM1TUcvV2QyVXJqdDVST0dBRU9QdzAzT3BlSHQzUUZGVDdkT3I0?=
 =?utf-8?B?OUZQV1o4ZkFBM3BWMmxQSkVlaHEzSnJVdE5ud3JRcm9tcHRZWVVnYzErNEM3?=
 =?utf-8?B?K2NESU5QcjBQZEIrcnRxd09aSTJxclRHbThTRVRDdzlZUnd0dGJNNGdDbmtV?=
 =?utf-8?B?eDVpR1dUUU12Z2x0ajVjZGZNTGFid3d0N1B2UmRHSUlTWHIwVVBNcmhSd0Z3?=
 =?utf-8?B?R21IdlJBaWQ5b0R0SlBlbTNFMi93bEhkZWtYakxocGxwTnlMeEtqWmhSOTlU?=
 =?utf-8?B?eitsZGo1OE42a2sxVmwrQmpmWXorZ0JPK2gvWWJsMkFMamlGOXlSZE1JOENh?=
 =?utf-8?B?ZVFIL09vSzhvdzRRVnhwTmdMQ1l0WFByTHlCQTk0U1dzZHRDdHlLYXFzZlNw?=
 =?utf-8?B?dFhhU0JjYjBSVWxsS0V0RVVLSXlyTTFka25IMEw3U2txVHVzMXpMR05qT3dE?=
 =?utf-8?B?ejU3ckZRMUpzWDJzRVI0cmdrRXIyUkwyNjY3UUF5Mjg2V0IzS0tWZDhWZGgx?=
 =?utf-8?B?YUNiUlV3WVIvdkhXWVJVQ2FzRk9ENjhZRzJxa2hwOTQzTkkyUUxEelRRY01l?=
 =?utf-8?B?MlJiRU13RGducEVhZnBOMHZ6WUJzT2dNZkNFV3dabFIwWFRZTDI0VmRCaTl3?=
 =?utf-8?B?NkdLT2oxaHRGQmhFdk5YeitaUW85UytUNDAxYzJHY1RHVWc5Mko3TTFRaVJ6?=
 =?utf-8?B?dFQ5Tkp3YlJYQXNaZDRyRWhiK0NxSHRhV3N3U1pUODl3YUVKTGFOVHFGN3ZG?=
 =?utf-8?B?OHBMSGZ2U1VNNXRnVDFpUTVUUmkyMm5hRVIyUnNYUWpFZDdnRGM5eC9uL2xR?=
 =?utf-8?B?TExNeTdITWFmdHVDUHBVNHR2NUQ5Nkk2M05zY3ovbEhuUjBLT0VrcHB2a0Iz?=
 =?utf-8?B?emlkMWhaN2xPYmlmaGdxTFUvbVZBbjl5UWNzL08wWlVub05rdzV4dDVDWEFN?=
 =?utf-8?B?OGo1aUlwSVJBQVkrVjRyY3dTUElVZkFsNmZxdC9XM01jTkZ4THJJQ2xWdENk?=
 =?utf-8?B?aHEwakRubEVWdGkzckROM3lLZStKZU56RUlralkxejYyaEVGQjRsL1lGYnd5?=
 =?utf-8?B?aU1tYmRidkpGZkxROVAxSUdzdTRLWldFaU9RZ3V4cDR0R2t5SnJ2RHkrNllh?=
 =?utf-8?B?dVJCSHR0U0xzVGZGUDhDNnpjdlJPV2FyV1JjbktFR1hManFHNjR2V0s2RnRL?=
 =?utf-8?B?bFBISVVzUHpmajFGSEFsenVJOFFVcTVIN2VQdlJKV0hrSTVDTHVtM09JcWdk?=
 =?utf-8?B?RHpMTHVDRkF5OUlDVjNvbmVxUDluT04vVzNsY0RwOEhOeTA5Z2ZSWmUvTFc1?=
 =?utf-8?B?bng5ZlgwYWx4WE9sSmJiakRjSWsvdlQ1NjJqQktSaXBQR0pBdDE3bDJxditD?=
 =?utf-8?B?R3ZQQmJYQzZvQ3UwWWlRazZPZXQ5ZTBJVDh1SG9ham1vSEZUWm51THU0NTdG?=
 =?utf-8?B?SzB6QVJnTFVQRTM3YmhRWDhpaUhmZ2ZXeEJaaWdHL2xpNitHZHhwZDc1Z3Z3?=
 =?utf-8?B?bmFvVVkxYm9LN05tN2lpcFhpV09YR3RzS2hWN0NLbytodGF2VlZEeGYyem0r?=
 =?utf-8?B?Z0dpZXBKdFJRK01JOSsyTGk3VEI3eGFZeDVsNXkyVG5SOGR2MEVIcTY5VFVW?=
 =?utf-8?B?ZWFya1NkSlRQWWVlUFp0cXo5Rk5TdVNBeGJiVTIwYnVEZVVLVEdVbVhSOFZJ?=
 =?utf-8?Q?+rzQrmdWBmFb4QBTVWQWJ/iedpsxavHulAOpXzwE0hcIQ?=
x-ms-exchange-antispam-messagedata-1: pXQIK0w9KgD7pw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f6d5c5-a6b9-444c-4457-08de5815d13f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 11:19:46.1291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JOZcgMQxK05HQ+KTyOBl7MnboZTVNPptyvnbSBz0i92oL03oFzoR42r2fAJW3nHGmXgc8wtw8yGRp4s4Do1XSdXMurvTl3EkM56YTKCl3ZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8277
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

DQpIaSwNCg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTkxNjAv
DQppOTE1LkNJLkZVTEwgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpLg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKYW51c3ogS3J6eXN6
dG9maWsNClNlbnQ6IDIwIEphbnVhcnkgMjAyNiAxNDo0MQ0KVG86IEk5MTUtY2ktaW5mcmFAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1
YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5GdWxsOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC9nZW1f
bG1lbV9zd2FwcGluZzogQXZvaWQgZmFsc2UgZmFpbHVyZXMgZnJvbSBvb20ta2lsbGVyIChyZXY4
KQ0KDQpIaSBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZywNCg0KT24gVHVlc2Rh
eSwgMjAgSmFudWFyeSAyMDI2IDAzOjE4OjQ5IENFVCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNl
cmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHRlc3RzL2ludGVsL2dlbV9sbWVtX3N3YXBw
aW5nOiBBdm9pZCBmYWxzZSBmYWlsdXJlcyBmcm9tIG9vbS1raWxsZXIgKHJldjgpDQo+IFVSTCAg
IDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTkxNjAvDQo+IFN0
YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNo
YW5nZXMgZnJvbSBJR1RfODcwNl9mdWxsIC0+IElHVFBXXzE0MzcwX2Z1bGwgDQo+ID09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1h
cnkNCj4gLS0tLS0tLQ0KPiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25v
d24gY2hhbmdlcyBjb21pbmcgd2l0aCBJR1RQV18xNDM3MF9mdWxsIGFic29sdXRlbHkgbmVlZCB0
byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUg
cmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAg
IGludHJvZHVjZWQgaW4gSUdUUFdfMTQzNzBfZnVsbCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0
ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0K
PiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2Ug
ZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczov
L2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0MzcwL2luZGV4Lmh0bWwN
Cj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDkgLT4gOSkNCj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+IA0KPiAgIE5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBob3N0cw0K
PiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAg
IEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVj
ZWQgaW4gSUdUUFdfMTQzNzBfZnVsbDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+
ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBrbXNfZmxpcEBk
cG1zLW9mZi1jb25mdXNpb24taW50ZXJydXB0aWJsZUBhLWhkbWktYTE6DQo+ICAgICAtIHNoYXJk
LXRnbHU6ICAgICAgICAgW1BBU1NdWzFdIC0+IFtETUVTRy1GQUlMXVsyXQ0KPiAgICBbMV06IGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzg3MDYvc2hhcmQtdGds
dS05L2lndEBrbXNfZmxpcEBkcG1zLW9mZi1jb25mdXNpb24taW50ZXJydXB0aWJsZUBhLWhkbWkt
YTEuaHRtbA0KPiAgICBbMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzE0MzcwL3NoYXJkLXRnbHUtMi9pZ3RADQo+IGttc19mbGlwQGRwbXMtb2Zm
LWNvbmZ1c2lvbi1pbnRlcnJ1cHRpYmxlQGEtaGRtaS1hMS5odG1sDQo+IA0KPiAgICogaWd0QGtt
c19mbGlwQGRwbXMtb2ZmLWNvbmZ1c2lvbi1pbnRlcnJ1cHRpYmxlQGItaGRtaS1hMToNCj4gICAg
IC0gc2hhcmQtdGdsdTogICAgICAgICBbUEFTU11bM10gLT4gW0FCT1JUXVs0XQ0KPiAgICBbM106
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzg3MDYvc2hhcmQt
dGdsdS05L2lndEBrbXNfZmxpcEBkcG1zLW9mZi1jb25mdXNpb24taW50ZXJydXB0aWJsZUBiLWhk
bWktYTEuaHRtbA0KPiAgICBbNF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVFBXXzE0MzcwL3NoYXJkLXRnbHUtMi9pZ3RADQo+IGttc19mbGlwQGRwbXMt
b2ZmLWNvbmZ1c2lvbi1pbnRlcnJ1cHRpYmxlQGItaGRtaS1hMS5odG1sDQoNClRoZSBjaGFuZ2Ug
dW5kZXIgdGhpcyBwcmUtbWVyZ2UgdGVzdGluZyBvbmx5IHRvdWNoZXMgaWd0QGdlbV9sbWFtX3N3
YXBwaW5nQHNtZW0tb29tLiAgVGhlIGFib3ZlIGFyZSBub3QgcmVsYXRlZC4gIFBsZWFzZSB1cGRh
dGUgZmlsdGVycyBhbmQgcmUtcmVwb3J0Lg0KDQpUaGFua3MsDQpKYW51c3oNCg0KPiANCj4gICAN
Cj4gTmV3IHRlc3RzDQo+IC0tLS0tLS0tLQ0KLi4uDQoNCg0K
