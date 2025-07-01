Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193B4C7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 17:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D7210E5F0;
	Tue,  1 Jul 2025 17:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JghrIrYI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF5810E5F0
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751389206; x=1782925206;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rMVcj6JDPCs9V28y4eznVwwoyTZmNrQARjssIPLZ/ps=;
 b=JghrIrYIBUk0IgSeXKxT4MSgnQgbuR9+n9YxfIOi1OwIqB3jPUbyDlEb
 b6FiDOMWBHB5gBBrxDbFsFjYtGBJXQri8yWsygrV5upgdUYeVY98Mf1AI
 959n6Pm97ylZX35XwS6X2cBZVSpZsUD2TR13mp3UiNrFaB6cL/Mn/wVyR
 Wjg3uoSADEofRwYU8hZ5I08jzkS3ewmL9NRhoi3HZ3JeF3tVTBAEb7zVm
 2Ctv0Q+0LdVYSLzS2cgv/32+tz5p6zyW8dq2o9bRdBxhbqq7vjzR2RQJf
 4Mcm32+5ZGvgloDJKdPOIGaC9qh3ecJ+pZndaOMtq+flA2wVQRTkteQ/0 Q==;
X-CSE-ConnectionGUID: VoPlsKa5RBm/QRkWuKV+ng==
X-CSE-MsgGUID: Y0EDqx1cT+qASi/Hpz1VHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="56291019"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="56291019"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 10:00:05 -0700
X-CSE-ConnectionGUID: NPOq6JpFSi+/q0zz36iArw==
X-CSE-MsgGUID: 4OULsaVuTLyVf/UyEwtNZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153909164"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 10:00:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 10:00:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 10:00:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.65)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 10:00:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVixseZYVl9mYhOHla6DglXKohmtjOiVQhVEdRzd6DhW6IjvHqVJsmJu+QSuhyH6EJT3XJwerX1lY9LptvxjOOyU1VvBh+E0w+rb7PRkgnvyNiCehvxw9MF+wQMUquXBPu7gjdzMg8o7nhCMzDsVC5rctZ7llcSjP4NX+ZxsVfZMsXJeJePjBGlxd3SLetxnrRAVyDRZoBCteVWa9HX9QQ6Az9AlAm9D5o0Hj+d5RqHscgeoxqRUaKhAaFuTYAQAKIYQuFRHcIxLgXAZ4z+FTn4dy6XMhnkrQn5Fie8Ab/l9O65fshQVot+Mlfg6SJVnhI7KfudjRmXvDN+fECGi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMVcj6JDPCs9V28y4eznVwwoyTZmNrQARjssIPLZ/ps=;
 b=Rg4doZjKAsHNHVc6aYvLv096C6rkdVVtC6xxHhzkp3xGoi00yhpLa/6FH8VcBdLt4rO1EH2S5WJ+cLzURCVrE9KeIukJQeb8vmz/IaBKyHaDstg/T2YPVW5nEELkEdGZSgA/9bcjZPwf0STV18X66pRN0fm39W4fxjwEPxhU878teGj+Lgmwf81w9gsVPLW/dHGMN110VQsYcKAad0bEE37ISBkiB5+SQPzPFZN6QZe9HNIvEtSOGLsS1yxn31QPYG8ARMzgMzBo1E5YRHFhz7vYKurcH1hJ81QUmqmJZ3mmQrawhe1ors4F6LFze9+BE5seHl9+U+0xbpjDZthsFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB6447.namprd11.prod.outlook.com (2603:10b6:8:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 1 Jul
 2025 16:59:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 16:59:57 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Randhawa, Jagmeet"
 <jagmeet.randhawa@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [i-g-t] tests/intel/xe_dma_buf_sync.c: Ensure spinner completion
Thread-Topic: [i-g-t] tests/intel/xe_dma_buf_sync.c: Ensure spinner completion
Thread-Index: AQHb54IHM0Qv267ntUGaz1o19RWj0bQdgybA
Date: Tue, 1 Jul 2025 16:59:57 +0000
Message-ID: <CH0PR11MB5444338DD0527BA09D873062E541A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <a2c1172f61589220cb2ee5a5ece02bb3f9f722d3.1750963929.git.jagmeet.randhawa@intel.com>
 <aF7JHvwjfOvPHjLV@kamilkon-DESK1>
In-Reply-To: <aF7JHvwjfOvPHjLV@kamilkon-DESK1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB6447:EE_
x-ms-office365-filtering-correlation-id: f9c60411-2056-458f-a03f-08ddb8c0b5b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ODZERXhrU1BTU1ArN2lSbTdUaVhBSDNRSUI3N3J6c25aMWxvWlBQRjg4dXFR?=
 =?utf-8?B?SVJKMG9VUU5tOFMwakJyZTBDYzd3N1E3NmJ1eVhkRHBPVWpMaHpmYTBCdTJr?=
 =?utf-8?B?SDE5Vm4xa0dPZ3E5ZW9WRmRXWURPTmROZnFmQ2J1dHBkbHVuUWtqZFNDL2tv?=
 =?utf-8?B?WjB4Uzh6REovcFZycHZ2dE1jVFFFMmtSYjFhUVFNVlA3eE1TaXRCN1JKUzBP?=
 =?utf-8?B?MWtLaDQ4bGNhK0JVanlienZkZDJkcEJlRW9wL1ZRWGNNMDBwNS9RMFJWMENL?=
 =?utf-8?B?ZTFWUC9lK256ZzFHWHRULzhHMkhSNEF5YkdsTXlDUW93cmdCK3JUamZJdXpK?=
 =?utf-8?B?WG1ZYk5yejNNQnQzWGZkSEwrVUVnUUwvaGhBY3NLY0tQMytWKzZpcVJaN2t5?=
 =?utf-8?B?eDJJMXVsSzJVVzB1QUxuQ04xNFMzU09zVzJBNE83RnFJTUxTYUFOZ3dyMEV1?=
 =?utf-8?B?OHZDbHBNTXF3OThvUTBtR3VxNGR1Ymw1VWRtcXFpMXhHY0JZaU04TkdFbVBl?=
 =?utf-8?B?QWg0eWI2WjNLcS9vWU0ybnVVSkN3Uk15UEpVQWdOdHJPaGg0UUJQN3hpMmI3?=
 =?utf-8?B?VzBoL0dtVnIxU1FpMHRwaStuTU1GbWRocDA2bGVMYldERDZpdFlZbUdvcGJD?=
 =?utf-8?B?ODJYQ2Z2RnBFUWQxcENtYi9wLzUra2JjSnJXT1E1SGRuR2VYMnYvWWU4cmFh?=
 =?utf-8?B?VnhnNUtjM0lYdFNBMlFDdk54bS9WdnNOemNERnBZeFlRWFAvb3pmZDd5VGZR?=
 =?utf-8?B?cnRlcjBjL1JVekhEWnF5UTdWMEo0bXhWYnNKV00xYndMVlJGb0c0Y240dW5N?=
 =?utf-8?B?SWJDd0ZSRzZqZlRDeE9BNENDZS9WeXpWMy9wY0p1Umo5RHdiM3FhZGtaN010?=
 =?utf-8?B?eUplanNsTjRUL0Rxam5sSkNSSmwzKzVIdlhEQnFBTkRVaVYrWXQydDdyY0Yy?=
 =?utf-8?B?bU9UODNKSTdpWW5OeUV5NC9UVkltTWZNK0Q5Vm5ybUs1Z2ZTMFNiNUNkUGdL?=
 =?utf-8?B?RGlwMUlMWU90MElMZ2h0ZFJmRFE2Z0dnMVgxdEphOVpGaEJNZnpYMjI0ZlNV?=
 =?utf-8?B?M2gwQWxaV2tYR3AxbElaRHUvakpTRGt4OXg2ZnU3OXU0L0tTVlpNMHVDUTlj?=
 =?utf-8?B?TmE5dUdIczFza2M1cDhVbWlUSU04Vk9meWwwVGxSYVo3REpUd204MmlmVzJN?=
 =?utf-8?B?ZmpvVkpGdTlLVll5SEppcEZuOW5jRUczeE5RWTdRSWM5SjR0dDJLU3NNa1dl?=
 =?utf-8?B?WUdPTlpUWUp1cE8zVWxLN2lqcXlBV0hmOUJha3RaODNRRnZUVFBRWEFmT3h6?=
 =?utf-8?B?WmdNTHY0ZitSMThZY2U5c3J6bVJvcVNTc3E2RVhEV1JSamdJSmQxMGx4a0xt?=
 =?utf-8?B?MzhvcmJST0s5dlloUXNpV3BOcWhIVUlwMXBtcklYUkRxeC9zY1ExZnlibGkz?=
 =?utf-8?B?SjlJOXNkcGhnVnovdEJPMit6VHRma01YTUthbmRXeFVQUnRsZzB2MkRnMVBO?=
 =?utf-8?B?YlVhanVhUHpCRmdLQkYyNmtwVjA3K1Fpai9mUzZCd0l5V1dHWXZDSDZpUWxO?=
 =?utf-8?B?NTlOWERTSXppNGNJbDJ1TjJCa2tEUUxtWjFlR1RISzFDbnJiMmVBM3FwdWNY?=
 =?utf-8?B?VFBYM01CbkZhMXhoc3Z0U3B4d3JQUzRJUDJoOGlsREVEUzh0M3FRdSs5ZGJS?=
 =?utf-8?B?UjBFajhFSmFxRi81MTV6ZmRSemM5N2VNMndpSjlQSnVUY2hiTDRtQTNwWTJv?=
 =?utf-8?B?b0ZCQnFZOGdJdVlIYk0vNmQ0MWhhb1RWaGtXQThCa2U5WkExbmgwenVIbExK?=
 =?utf-8?B?RlZxTjlRTWZpWUVTNERmL3Q5THBrVnV2VUlhM2dqZ0Q4QmRCalJieCtDTXJs?=
 =?utf-8?B?Z2JDVnNNOCtQSkg2OGl0S0cwRnUwckdNcGp2NGRHbkk3cm1hNDN4NEFVZ25s?=
 =?utf-8?B?Vm9Pa1ZBM3ZIRWwwRkErT2VINTAxdXEzeHM1YnYrK2gwb2R5Z09SekdORlNv?=
 =?utf-8?B?SkNCbzN0MWZ3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Snh0L2VDWW90MkRkSHlnZmdFVnR6dWRxbGx4U0JoNmZqZ1lSdVovb1RiSk5h?=
 =?utf-8?B?S3lRMllKQlNzZFYrTWF6aEk0UVNRU0FmVmRQcWJqUTNEd3l4YTY1eE9pamRC?=
 =?utf-8?B?UUM4cDNwN2RwUFg2NmpmK1N1K3JmOXkrSWdMc1F6SEFyNDhpeFJsMkR1bmtK?=
 =?utf-8?B?c3NDRUFpTXhhOWNEekU0ZWhYTXMwczFXcWhWUWZUaGVkaDIzQTIzZXJJa0lk?=
 =?utf-8?B?dGtuc3hIS2FEdFdCU09mUmEzS3p6ZVE0NFh3OVhqV3A4WFBjZ3FVQS9GckZW?=
 =?utf-8?B?TXE1dXdHK3p6VkZIUk1PYXRJM1hIU09KYm4zNk96N3MzdGY1bHhzcEhyS1pp?=
 =?utf-8?B?eS96eDROY3NTY3J2OXE2M0VwUGlqUVN3OXVFc1d5Tytvblh3Q2YvaEovRWpo?=
 =?utf-8?B?NkJtNW1PSGI3a29DN0ZycjIvZW9CL3BrZThOV2plcHlXb1J1VWxXZGJTakRh?=
 =?utf-8?B?K1NETHBUL1FFMDI1c2pLc29Wa3prOVNheW05Vmt1UnFhdDRyMlhpNXBGRXVq?=
 =?utf-8?B?SEh4THBrMk0yTzQ1TFNIbW1wMFkwVTRNM2FKSGcrbHRBTTlhQmE5c3MxOGdq?=
 =?utf-8?B?eW5JWWd5U2xvSGlldWkrbDdPRW5DNEVWOTQxQWRtTi96QmFyR0xIYXNDYy9W?=
 =?utf-8?B?Qk9kbGQxNE1Vb2pZKytwNmt5OGphSlhQNDB3SVA4anV3M2F2cDJwZjlaMUkw?=
 =?utf-8?B?cmRFa0RXN3VFaG1JczVNc0pVVkxCd3NtajVMNCtSQW5sU0xmczgvc21paTB1?=
 =?utf-8?B?S3ROd2t3Sk9DUUZsWGZVbHI0cTZDL094TFF3dXdPMk1pU0hsRUUzU1crWFlw?=
 =?utf-8?B?bk1NSG4reExzdFUvZnFJM1hYRlRqNmFZMTB5N3EyTWF0T1NWMW9uN09tTVpv?=
 =?utf-8?B?allsN3BQdmJMUHJqZ253Z3IyZGRJMGVBYnRITXgxQ1RlamdadWhQdXhIZmc2?=
 =?utf-8?B?K1ZvT0JVcERNS2NjZUNFVEV3amNLUzV1aVE0OUhPb0xOb20zdnhGWkZQSm11?=
 =?utf-8?B?cXVhZ21mY2wvWksxWm9nN3dCUVpyalNhenFuczBGc0dONVVaKy9yeHcreFFT?=
 =?utf-8?B?Y0VydlZtbFZNckFMSWZpV2ZqQ0pIQTdLdytsS0J6OUViZmVPZkk2ZW1RaTJI?=
 =?utf-8?B?VTUzUVlCZ21Md2ZjL1dJa283eUJ2WTkzaW5TbXRkM1VrQkVINCttWlVqSWlT?=
 =?utf-8?B?ZG1CaFNxRkJVK3ZpV1Z1RTBCQkxtMGhTTkhJbVp6eUxMdC8vRnlSVnFVSDZs?=
 =?utf-8?B?eCtNdHZXeWpnSW5rOXAzMVdneE9WNE1FejZSbklBVlErcE9JQnpUQ05JWjlj?=
 =?utf-8?B?S3FvU3QzclJoSzEyMElIbXo5SWw2SExQbCszbG1jdzlZU09nTWFtNlpzaWVD?=
 =?utf-8?B?N0l1OXA3S0x5cmlQNlplQXVCM2UyMXFUWGZYaU9TcUV3RHV5aFMvQWJ0Uk1q?=
 =?utf-8?B?Ym5ybzNKQzNpSzcxS3c5YTE3eUU0Sm45R1VuUTU2d1BkTXFTQktwaFV4Tmlu?=
 =?utf-8?B?NUswSW1ERW1ZOGZ5dkN3aEpKVTVEekdwYnRqQ0Nvb2VlOUlyYWROa2dqVEdw?=
 =?utf-8?B?MFBUWlJYREJVRE1OVkZHMHJXblJqakhRaksvbXA3dWFEYm4xMWM3SXU4NzY0?=
 =?utf-8?B?Y09FS3NnZ05DWldvZ09WbVMrK05aM3B1SE9veFdUTklBdGExVUJqRlJ5bUpT?=
 =?utf-8?B?RHdyQXhSSFVmcWpjU2hpRUZoUUJveGRZbE5NVU9DZzhzU0JsRG8vWEdhM1Vl?=
 =?utf-8?B?d283T2VUc3JSMUdSalRHNUhBNWYyY04yTXhnWmJNNFkwRmpFdXJYeFZCSTFk?=
 =?utf-8?B?dEd4M3ZrZ3ZXcTJQeVgwbzZQaEdoT2tRYWZQYXRWc1F3azRmeXlaaEdwakpk?=
 =?utf-8?B?MFlwYjNHSGNXMjdCU1FvdlFZT0lxcWxocTZzcFBLdlFGQTM5cHIyUFQzUmQ0?=
 =?utf-8?B?QmNST1pWWmVGUnFaZTFPenJ5ZXQrN3pha1VObmpiUk8rMWJ0RTlleFJwUnZ5?=
 =?utf-8?B?Njg4RkR4WUM4WHJEaDZyM0dzQ3dyb1Z0bHZlQnRNTnE1N0VVYmp0cnU5UCtq?=
 =?utf-8?B?UDRCTmRraTBhYjU2eTVUM2s3SlFsZkxxLzkvRVJSZ1lLS2cxNUpQbnhVQkRj?=
 =?utf-8?B?YThuWmx2UDZYYkdxNXJRT2JIazN0RU1UOUkwQVRvSVEveDdlMmhoR0FvRHBC?=
 =?utf-8?Q?ZooPD60VsWG+pNYiv5cJN6HoIZQKCclD5iXMc3tK0NR3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c60411-2056-458f-a03f-08ddb8c0b5b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 16:59:57.8207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4nZV7Yt6X8cAdhmxD6uvlvFVq6xnZk6cHdA3DjbuXnZwgMLorhLFua/Czy56seXyFCxAH2J8qm06mDK/8KhVw3GOW1nyXqK+Ctqhy8ABL8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6447
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGlndC1kZXYgPGlndC1kZXYtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBLYW1pbCBLb25pZWN6bnkNClNl
bnQ6IEZyaWRheSwgSnVuZSAyNywgMjAyNSA5OjM5IEFNDQpUbzogUmFuZGhhd2EsIEphZ21lZXQg
PGphZ21lZXQucmFuZGhhd2FAaW50ZWwuY29tPg0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBOZ3V5ZW4s
IEJyaWFuMyA8YnJpYW4zLm5ndXllbkBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW2ktZy10XSB0
ZXN0cy9pbnRlbC94ZV9kbWFfYnVmX3N5bmMuYzogRW5zdXJlIHNwaW5uZXIgY29tcGxldGlvbg0K
PiANCj4gT24gMjAyNS0wNi0yNyBhdCAwMzowMDowMiArMDgwMCwgSmFnbWVldCBSYW5kaGF3YSB3
cm90ZToNCj4gDQo+IE9uZSBzbWFsbCBuaXQsIHBsZWFzZSByZW1vdmUgIi5jIiBmcm9tIHN1Ympl
Y3QsIHNvIGl0IHdpbGwNCj4gcmVhZDoNCj4gDQo+IFtpLWctdF0gdGVzdHMvaW50ZWwveGVfZG1h
X2J1Zl9zeW5jOiBFbnN1cmUgc3Bpbm5lciBjb21wbGV0aW9uDQoNCkFncmVlZC4gIFdpdGggdGhl
IGFib3ZlIGNoYW5nZSwgdGhpcyBpcw0KUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENhdml0dCA8am9u
YXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiANCj4gVGhpcyBj
b3VsZCBiZSBkb25lIGF0IG1lcmdlIHRpbWUsIG5vIG5lZWQgZm9yIHJlc2VuZC4NCj4gDQo+IFJl
Z2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+IEFkZCBzeW5jb2JqX3dhaXQoKSB0byB2ZXJpZnkgdGhh
dCB0aGUgc3Bpbm5lciBvcGVyYXRpb24gb24gZmRbMF0NCj4gPiBoYXMgY29tcGxldGVseSBmaW5p
c2hlZCBiZWZvcmUgcHJvY2VlZGluZyB0byBjbGVhbiB1cC4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYWdtZWV0IFJhbmRoYXdhIDxqYWdtZWV0LnJhbmRoYXdhQGludGVsLmNvbT4NCj4gPiBD
YzogQnJpYW4gTmd1eWVuIDxicmlhbjMubmd1eWVuQGludGVsLmNvbT4NCj4gPiBTdWdnZXN0ZWQt
Ynk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
ICB0ZXN0cy9pbnRlbC94ZV9kbWFfYnVmX3N5bmMuYyB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94
ZV9kbWFfYnVmX3N5bmMuYyBiL3Rlc3RzL2ludGVsL3hlX2RtYV9idWZfc3luYy5jDQo+ID4gaW5k
ZXggM2U4ZDg5ZTk1Li4xYzBlN2M2NzAgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVf
ZG1hX2J1Zl9zeW5jLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9kbWFfYnVmX3N5bmMuYw0K
PiA+IEBAIC0yMDMsNiArMjAzLDggQEAgdGVzdF9leHBvcnRfZG1hX2J1ZihzdHJ1Y3QgZHJtX3hl
X2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHdlMCwNCj4gPiAgCQl4ZV9zcGluX2VuZCgmZGF0YVtp
XS0+c3Bpbik7DQo+ID4gIAkJaWd0X2Fzc2VydChzeW5jb2JqX3dhaXQoZmRbMV0sICZzeW5jWzFd
LmhhbmRsZSwgMSwgSU5UNjRfTUFYLA0KPiA+ICAJCQkJCTAsIE5VTEwpKTsNCj4gPiArCQlpZ3Rf
YXNzZXJ0KHN5bmNvYmpfd2FpdChmZFswXSwgJnN5bmNvYmpfc2lnbmFsLCAxLCBJTlQ2NF9NQVgs
DQo+ID4gKwkJCQkJMCwgTlVMTCkpOw0KPiA+ICAJCWlndF9hc3NlcnRfZXEoZGF0YVtpXS0+ZGF0
YSwgMHhjMGZmZWUpOw0KPiA+ICANCj4gPiAgCQkvKiBDbGVhbiB1cCAqLw0KPiANCg==
