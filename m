Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F36E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 10:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FEC10EF9E;
	Fri, 13 Dec 2024 10:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsTYO/oS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8921510EF9E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734085740; x=1765621740;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=suD+TNSsk3+oBxWYDJb19eInwO2sv57kzry4CnepgpE=;
 b=WsTYO/oSMplmGMvaKIvacEyXPM0wZ3wFnPLQPlLXKtlwo1UAyavRuyDM
 tj/EGD7KE3c0MRRoMF0mfoDPSF7ifyNKab2d0PYdKy3S0G/m/Gniphusn
 uwLxF+KULhsJNk8sqHufsLvLDcE9Zf5eFHNcXmqHSSc7mM2oR0gZFq9lY
 hxPA+UUxGqr2+c91u7XSk8es+BMJRJCsTp/DBiIkIijAuetSdDA6yvcMI
 DDUqYHSN7bvTnNpG+e/23evlvd9v1Qpk48UjAbee+NXFFIVufjhd3mbac
 SBgNA6pA/bGWay33GfL9A74QwIJmpoCwZ5DGoIZMi909zGMJPe3f4wYtf g==;
X-CSE-ConnectionGUID: n9Itl7qeQJCznrL1wZ7FdQ==
X-CSE-MsgGUID: /ZyzomHZRDK2ZjLEcwcbTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34582221"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34582221"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 02:29:00 -0800
X-CSE-ConnectionGUID: Vkey+1/JRgi3zyMdKFfThw==
X-CSE-MsgGUID: eo9uy1jsT9eJtZBp4BRJ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96362660"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 02:29:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 02:28:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 02:28:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 02:28:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mx4TYNW4ikUqeyG29Zxk9BkEvwYki8owwV0wTPLsEteLsoWV2yau59l29Km3mHNxTrEajdgntNxlJe9wna0jsf3NuDA1rsGP18S4tMAYTAlWSiFiOZQiRujZ5kqq0Z9ltcKUS+csAyI9naNsPS5YfjSfKHNqH8kURvGSa7wJhusF9wU4uqrYGTrkaevUmEYEdSQuQM4W0qLNaKcvpmAEMtN41vfxYPXvDZQryhMFLdhWAh5ybFcHK9D8sUjl4cANUSsfrpS4isHw4jHTlf/qPW8XebHaeXHwzMJnlprcVfs0exbtvgpucCmdPqcytmLaUb85gEtHHlJt5lFTkZX3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suD+TNSsk3+oBxWYDJb19eInwO2sv57kzry4CnepgpE=;
 b=qLz4nTPYh1+Ev/tCe7McQTW+23gctP/2CTbhkYmJCgqQ/UqV4i4DEb0Hni+FnYN56F3kbwu1D7vY40b2cXRHnunI6aMT8ELLZ1yrZwRTL7SH5yNEugj+3Q71v7Zj2v3o8HuH4VopERWLESwd2+vGqBiBh/QgmSnns2+RcBWr0w5D/B5Yljkv6VUEQbuQyqqXJrGfAVBowPKS6W2Kxnwje2FSsBrhZkYDRyjeCu2/OngMpoKNt0/JYkhh4EN+ctJr3Iz8U5HDrXoFlGB8vuCMX91N/gnluTh62MTQUYp41wOlC3Q6fbStheTzzfZ/8aM6b2psxmFy/wPFGvEs+OEtog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CO1PR11MB5137.namprd11.prod.outlook.com (2603:10b6:303:92::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 10:28:22 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 10:28:22 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: RE: [PATCH] tests/intel/xe_vm_create: Check negative cases for
 vm_create ioctl
Thread-Topic: [PATCH] tests/intel/xe_vm_create: Check negative cases for
 vm_create ioctl
Thread-Index: AQHbTTUBqikDxFd2hk+pBvxQBzBY57Lj4wuAgAAVpoA=
Date: Fri, 13 Dec 2024 10:28:21 +0000
Message-ID: <BL1PR11MB5525186034978CFBD976AD4684382@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20241213075724.641859-1-pravalika.gurram@intel.com>
 <IA1PR11MB6097E036E990499AE43E997386382@IA1PR11MB6097.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB6097E036E990499AE43E997386382@IA1PR11MB6097.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-Mentions: zbigniew.kempczynski@intel.com,francois.dugast@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CO1PR11MB5137:EE_
x-ms-office365-filtering-correlation-id: 49601e38-8d5b-43ad-94a6-08dd1b60de7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bFZ3ckRVemg5Qmt5cXcrd0VaVDBVb2M5c2RaOTlrVnJqU1FwS0hPRFVzMzhV?=
 =?utf-8?B?YXFjYTJOM2xtOW5uUmU1bWRaRk9MWDIyM1I4bUNuZ05EcXp2KzhuSHZQZHFR?=
 =?utf-8?B?TGFmRGtPbWJ5MFRvWDlKYk1CWUVQKzM5dzJ6RWk3eXF3NEREb292Rm5ld3lS?=
 =?utf-8?B?S3RJNHJzLzBYL0J5Ui9GUThZczlaMzRYS0hweTBMY0ROemFnejRpSnZDaEUw?=
 =?utf-8?B?cDcrbXp0L0t5bDRUOEhTejdLUEJFU1RmcTV0QzNzT0tDQ3V3L3VhMFNqemNQ?=
 =?utf-8?B?blZpbGRHbU1tTllUYXZURXh5T29NNU9FeWUrdlBUcW9hS2N5dlZlOENUcjdE?=
 =?utf-8?B?azRJdnN1eTZaZUVSaGVKc1MwOWQrZForSENEcmp5TU5qejNjbXRhbVl5Y1NC?=
 =?utf-8?B?UU5YOE4rSWl4OWRnNTVvZCtNeG5XaU9BMFBqYVFwK3hIYlFSem40dmNSYjJN?=
 =?utf-8?B?TG4wOWoxS0FWVlI3bjJHdzcwZkcvU1ZOUTBIL1daVFlQWjBJclU0b2dwL2VF?=
 =?utf-8?B?c0hwamgxQzYvVUUyS0VSRmJXWGYxTDJPZjZZdTZWODVXdllWR3hHUCtvcnRE?=
 =?utf-8?B?RVF0ZkxQRVRGSmNIUVlEZzZ3bjRqalZTQldWWEh0M2hTd0dyS1NjNm9ZUTI1?=
 =?utf-8?B?c0crTmtRQXBmY1NuenpwbjVLbmQyNkFjVkE4Z2pjdVJHVTdBYjFSVG8wSUx5?=
 =?utf-8?B?ZUEySWNLUzRJYlFhUzlVclVRRXhZeFVNb1BheGM0RTkzdnBqUTlUU3F4Z1Bo?=
 =?utf-8?B?TnF1WEVNbTlLeVlFU3BTQXlYaFU3UzVqYmNabVdyMU84RlBGMjE4ZEF2bEky?=
 =?utf-8?B?Qjh4Vm1jUWdPdVdFZksycnRtZnhka2hHcGdmN3hQRTkwODhaN01YQ1p1S2E5?=
 =?utf-8?B?RUdlZ0RTSGRWeU00b2d5bEJVaHp5ckRCeENXNkNmbGxpUXUyRzhUUUZCaXVL?=
 =?utf-8?B?bkNNUXFVbmphUUNkNGZRNnlKczhmQ3VsYjZCWFpqUUtiQjhveHFRcWJZT0du?=
 =?utf-8?B?T25QMnE0Y2NCZEg5ZFN2S013cHFUR0R3cHd5K2Y1OGpGM3ErdllGaEZSRlVx?=
 =?utf-8?B?Tzd4cG5YbWlib3lCUWIvWGp4bXdRR092TE52UVBpcDJLL0JZSnFuWFJ2RTUx?=
 =?utf-8?B?TTlJWkQ2KzNjbDV2ZVFNN1dnZGVYVjRWZ0hqNEx5VmRBZC9mS09CTzNWMElP?=
 =?utf-8?B?YWlnUEZQZm9xM1llSGhwTStPY0I0Z0dtditZV0lyT0xMYW5nZUlONTIzRG51?=
 =?utf-8?B?Z0s5N3c2SWIxMWwwVEpqc0hGeW5wSmxzZzNucVAxTDFsa2pBZVBnNkZYaGdK?=
 =?utf-8?B?N1dUV2F2YVlxajlqdU10ZUEzcC9XVEZrTUJGeUE2ZkVDbnNEWDR4RlJSQ3pR?=
 =?utf-8?B?Y0ltU2FRZzVMd21PMDFpY3Z4ZE02aDdEY0JITEM1Mzh4SW9RR29jVHMxY0sy?=
 =?utf-8?B?T2FMVVFqeUNaZFNXUGhHTEtabUNzc3NmQlF2Q09ONnpTYkJTVFZndGVsbEZy?=
 =?utf-8?B?NTE1VWp6d0RaV3U3aVdwYVFGV0pYaEdsOGRhYjBEeE9BeHU4V1VhQU1OU013?=
 =?utf-8?B?aUpPbzBDWHhWMFg4MTVsOWlPM0k4Q095RDNNWDNrbjV2c2hZRExSVjFDQytt?=
 =?utf-8?B?OUx0TURHeHk2NDI5RGxIaE8wRHRQOVRaRFNOeWY1djF3WFFFRlhoOThOYkVv?=
 =?utf-8?B?QXN6WDIzNklNUVRiMk8zL3pROXAzVGJTdXhLL0RZSmthQlRNNkExNENkY3ox?=
 =?utf-8?B?Rlp6Um9Cc2FjUG0yZE9VUnROWDhIc1VKQ3hWTm4rUFJMb01zZWZEMHk4NVhi?=
 =?utf-8?B?dWJrYjBHdk9TWXMzSnhPVGw0SzdwY041VFNabXBJcS8zTU9TZHlkcDRrTnV6?=
 =?utf-8?B?NHJXby9waUR0TjJyU29oS3pTZWV1WlEvNmw4Z21oVVJ4SlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1o5bjk2YTNIa1BGYWsrZmZ0V1NBNHF2MFBNcmZWNUJyOWZlRUx5ZU5mTmx4?=
 =?utf-8?B?OHZYYmFnN1QxcW5VZkJYaEVFQUNIa1FKRFVMOUg1V0hTekEwYjNzQ3BWaG5R?=
 =?utf-8?B?Z1hqeE9SL3RwTWVwZ3pFblZFajBLUy9BY2R6TGgxdThUM1Nub2JEWnUwc0p2?=
 =?utf-8?B?ZVV6bFRrZkE5SWpTK3Jlak52L0Jod2RVcnBXclByMkt0eS9yTVRMeHpkdEtt?=
 =?utf-8?B?d21XRDM5ZjJsQzZ0QmVLYWhRYWhMVUpJcFUzcTR1dzB3TkxTbXNhUjJmUmcv?=
 =?utf-8?B?WkozYmc0cGt2VzBXL2wwN0Z4Q2tWbE1IMFFvL01CSDhCMVlsMUpaQnZEZkdC?=
 =?utf-8?B?aWNXZHlla25mR2NuaWdjaGJaa25oRXU2c2lPYUJJR2ZVZzJnT1AvMDVxaWNK?=
 =?utf-8?B?Y0hOeGRCQVg4QU00N1NNaXgxWkFsc0ZwdTArREFLdFRIL1RxdmVuYlEvbnYy?=
 =?utf-8?B?Q3VDWXJqL09XUm1tc3JEQ3FCVFYvS2hKUkRqeGhlQ0o1emZWSTlwdnI2VVVn?=
 =?utf-8?B?NWpvVEp5U0psejZGZWg2V0tXNDN0ejR5U09pSURrZnR1ZzlQM0YySlpBMmho?=
 =?utf-8?B?Yk5iZDJhbmVpbXFsRzZvUkorNmVkaFFuMEVPRjhEN1c4RzFIV2o2NVV6OTUz?=
 =?utf-8?B?RHY1WitBYk9RTlhYQ2UzNVpSSjdsN0U5anB1U2pPbGR1ZG1FMlRYaWZ4L3Rk?=
 =?utf-8?B?Z3dnUkMvUDdFY25TbGRjZC9yNzgyNWdidEY0NU1la1drVmZPMmZyOHJ6bzg5?=
 =?utf-8?B?aXloZ2F6RERYeDU0aXgzenZyb2VxM25iV3c3NWZ1NGdxb0s3ekEydEVLd2xW?=
 =?utf-8?B?MWZuUE51TGxVV0t5UzIyN2pnVFpOVy9jWWRzMUM2WWt0bTVLZ25LRzYrcmhH?=
 =?utf-8?B?STVhL2ExamI4b29QU2RudWw1V1VYaDhZVXhaN3M0VzAwOXVscXpqTERZcHhw?=
 =?utf-8?B?dW42a05XVnRFUEhvVWJIOHFIWEMxSlgvRk5WOEN4b2NKSWVsYmZJeU9uMlJ4?=
 =?utf-8?B?akcvNnRtY2h1QmFNRkJXdXdweEloeG40ZzRCV2MrUm9Za3I0L2R1QXZPaFhr?=
 =?utf-8?B?SGN0MHBKakdYd3hWUy9mL2ptdFZWMnU3UnVQellQL3h3MzF6NFZLbmxtcUNO?=
 =?utf-8?B?eDE4bTdYczVxWVE2WGNMWlgrNlZKeTV1UjQ3WThXZGxMQTZUK1BJR3E3K2Ex?=
 =?utf-8?B?dSs4emhYcGRlYnBNaHk1Y1BFZlZyaTFqWnYrQWs2LzN3RC84WllXQzl2cWNW?=
 =?utf-8?B?bGZ3Mlg3YTh1bDV4YlVzZkVmWTlES0l2S2d0eHRmSGI2QWhQelVwU1dhYkVZ?=
 =?utf-8?B?Y0FPU0NHMzhVVVFCcFAxTjVMN0pBdnVVLzlhWEhGbVV0SlJ6VFdEeU1FU04v?=
 =?utf-8?B?MjA2TVpiT29KNEVNTnlCWmlicGEwNThJVHZMREFzaUtCajM3MDFzMkQ1QWF3?=
 =?utf-8?B?cnIxVTI3L2hPbk5HMlFFM1hSOHd3dmU4Zk9DUGhUeVczWit3aE9DS2dHRkJo?=
 =?utf-8?B?YnpzZzZuUmVOaXlCazlhazBBMVduUGJwQ1prdTJqMS9xeXVtVFJxNXNPUjdW?=
 =?utf-8?B?QWpmM2VmdkVzK1krK0R1UERFNDY1UUNmTkRGMGx3WEY5RVdjZlFkQU5CaHZB?=
 =?utf-8?B?d1BxdHJtQmNCWXlCWVh3cEVQc2dLU0JYS2VPWW83SStvay9Wdmk3eThQZjAy?=
 =?utf-8?B?aS9XTm9SNFBxTUdUb01vOHBxc1FqUHhFdlJNdnoyNU5iVDROei9mT1Jyakkw?=
 =?utf-8?B?TnFlWWc0VGdrd0xoMzhnRTEwdXRrNDNoWUlaS0lycXZhVWJ2R3V6UWR0WmZU?=
 =?utf-8?B?SXU4OFN5UDB0Vkwva0NCV1pVdkFYeUhGdVlxVXY2SGhBanlHNmsrMlRRYk83?=
 =?utf-8?B?M2ZnTXVwYnBLQUxsNUQ1Smpsb1g4QXkrQnBxK2R6Mjl4RjM5eVoyWlIvYU5x?=
 =?utf-8?B?ZzdjaFhieE5SQ3gzc3pxUXQ1bGd1eThqek5TUURINmdNd2pqNXhzYzBnbGFI?=
 =?utf-8?B?MG9PTFJCdlNMY2RBSGdBeG1KdFdIKzVCeEw3emZRNmlHczRZTHFOb2ZCbXhE?=
 =?utf-8?B?dTkyei9lNlU1cHVMTFpZTGpzM0VueFhHdnErRHFNN0VHcENpR2YrZ1ZldE5s?=
 =?utf-8?B?N0tUTUdKQWpONmpoaGJMUUJCUFVWUktFNHNnVjg0NzMyckV2ZFR3dFlMUnZP?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49601e38-8d5b-43ad-94a6-08dd1b60de7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 10:28:21.9428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SrjIeyS/O+iNm1igKmbkEMezGETUeIKtvyh6IFv35fPv+kOxCeliv51TgvkUOFRI2DL1ge+0zGCmMOZvEgPrRFq6eYTaZCDlSOv18f2VmWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5137
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllY2llbHNrYSwgS2F0
YXJ6eW5hIDxrYXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
RGVjZW1iZXIgMTMsIDIwMjQgMjo0MCBQTQ0KPiBUbzogR3VycmFtLCBQcmF2YWxpa2EgPHByYXZh
bGlrYS5ndXJyYW1AaW50ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBHdXJyYW0sIFByYXZhbGlrYSA8cHJhdmFsaWthLmd1cnJhbUBpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIHRlc3RzL2ludGVsL3hlX3ZtX2NyZWF0ZTogQ2hlY2sgbmVn
YXRpdmUgY2FzZXMgZm9yDQo+IHZtX2NyZWF0ZSBpb2N0bA0KPiANCj4gTmVnYXRpdmUgdGVzdCB0
byBjaGVjayB2bV9jcmVhdGUgaW9jdGwgcmV0dXJucyBleHBlY3RlZCBlcnJvciB3aGVuIGludmFs
aWQNCj4gZmxhZ3MsIGV4dGVuc2lvbnMsIHJlc2VydmVkICBwYXJhbSBpcyB1c2VkLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUHJhdmFsaWthIEd1cnJhbSA8cHJhdmFsaWthLmd1cnJhbUBpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfdm1fY3JlYXRlLmMgfCAxMDQgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgdGVzdHMvbWVzb24uYnVpbGQgICAgICAg
ICAgfCAgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKQ0KPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVsL3hlX3ZtX2NyZWF0ZS5jDQo+IA0KPiAoS2FzaWEp
IFdlIGhhdmUgYmluYXJ5IHRlc3RzL2ludGVsL3hlX3ZtLmMgLSBpbiBteSBvcGluaW9uIHRoaXMg
bmV3IHRlc3Qgc2hvdWxkDQo+IGdvIHRoZXJlIGluc3RlYWQgb2YgY3JlYXRpbmcgbmV3IGJpbmFy
eS4NCj4gDQp4ZV92bS5jIGlzIHVzaW5nIHRvIHZhbGlkYXRlIHRoZSAiRFJNX0lPQ1RMX1hFX1ZN
X0JJTkQiIGlvY3RsIGJlbG93IHN1YnRlc3QNCndoaWNoIGRvaW5nIG5lZ2F0aXZlIHRlc3QgaXMg
dXNpbmcgVk1fQklORCBoZW5jZSBJIGhhdmUgY3JlYXRlZCBuZXcgZmlsZQ0KYmluZF9mbGFnX2lu
dmFsaWQoZmQpOw0KDQotUHJhdmFsaWthDQoNCkBLZW1wY3p5bnNraSwgWmJpZ25pZXcgQER1Z2Fz
dCwgRnJhbmNvaXMgY291bGQgeW91IHBsZWFzZSBjb21tZW50IG9uIHRoaXMgPw0KDQo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC94ZV92bV9jcmVhdGUuYyBiL3Rlc3RzL2ludGVsL3hlX3ZtX2Ny
ZWF0ZS5jIG5ldyBmaWxlDQo+IG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMC4uMjQzMGU2NzM5
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfdm1fY3JlYXRlLmMNCj4g
QEAgLTAsMCArMSwxMDQgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4g
Ky8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+
ICsNCj4gKyNpbmNsdWRlICJpZ3QuaCINCj4gKyNpbmNsdWRlICJ4ZV9kcm0uaCINCj4gKw0KPiAr
LyoqDQo+ICsgKiBURVNUOiBOZWdhdGl2ZSB0ZXN0IGZvciB2bSBjcmVhdGUgaW9jdGwNCj4gKyAq
IENhdGVnb3J5OiBDb3JlDQo+ICsgKiBNZWdhIGZlYXR1cmU6IEdlbmVyYWwgQ29yZSBmZWF0dXJl
cw0KPiArICogU3ViLWNhdGVnb3J5OiBTeW5jaHJvbml6YXRpb24NCj4gKyAqIEZ1bmN0aW9uYWxp
dHk6IHZtIGNyZWF0ZQ0KPiArICogVGVzdCBjYXRlZ29yeTogbmVnYXRpdmUgdGVzdA0KPiArICov
DQo+ICsNCj4gKy8qKg0KPiArICogU1VCVEVTVDogaW52YWxpZC1mbGFnLSVzDQo+ICsgKiBEZXNj
cmlwdGlvbjogIGZ1bmN0aW9uICVhcmdbMV0gdXNlZCBpbiB2bSBjcmVhdGUgSU9DVEwgdG8gbWFr
ZSBpdA0KPiArZmFpbA0KPiArICogRnVuY3Rpb25hbGl0eTogZmF1bHQNCj4gKyAqDQo+ICsgKiBh
cmdbMV06DQo+ICsgKiBAeGVfdm1fY3JlYXRlX2ZhdWx0OiAgeGVfdm1fY3JlYXRlX2ZhdWx0DQo+
ICsgKiBAeGVfdm1fY3JlYXRlX3NjcmFjaF9mYXVsdDogeGVfdm1fY3JlYXRlX3NjcmFjaF9mYXVs
dA0KPiArICogQHhlX3ZtX2NyZWF0ZV9zY3JhY2hfZmF1bHRfbHI6ICAgIHhlX3ZtX2NyZWF0ZV9z
Y3JhY2hfZmF1bHRfbHINCj4gKyAqLw0KPiArDQo+ICtzdGF0aWMgdm9pZCBpbnZhbGlkX2ZsYWco
aW50IGZkLCBfX3UzMiBmbGFncykgew0KPiArCXN0cnVjdCBkcm1feGVfdm1fY3JlYXRlIGNyZWF0
ZSA9IHsNCj4gKwkJLmZsYWdzID0gZmxhZ3MsDQo+ICsJfTsNCj4gKw0KPiArCWRvX2lvY3RsX2Vy
cihmZCwgRFJNX0lPQ1RMX1hFX1ZNX0NSRUFURSwgJmNyZWF0ZSwgRUlOVkFMKTsNCj4gKw0KPiAr
fQ0KPiArDQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IGludmFsaWQtZXh0ZW5zaW9ucw0KPiArICog
RGVzY3JpcHRpb246IENoZWNrIHF1ZXJ5IHdpdGggaW52YWxpZCBleHRlbnNpb25zIHJldHVybnMg
ZXhwZWN0ZWQNCj4gK2Vycm9yIGNvZGUNCj4gKyAqDQo+ICsgKiBTVUJURVNUOiBpbnZhbGlkLXJl
c2VydmVkDQo+ICsgKiBEZXNjcmlwdGlvbjogQ2hlY2sgcXVlcnkgd2l0aCBpbnZhbGlkIHJlc2Vy
dmVkIHZhbHVlIHJldHVybnMNCj4gK2V4cGVjdGVkIGVycm9yIGNvZGUgICovDQo+ICsNCj4gK3N0
YXRpYyB2b2lkIGluYXZsaWRfZXh0ZW5zaW9ucyhpbnQgZmQpDQo+IEkgYmVsaWV2ZSB3ZSBoYXZl
IHR5cG8gaGVyZSBeIHMvaW5hdmxpZC9pbnZhbGlkLw0KPiArew0KPiArCXN0cnVjdCBkcm1feGVf
dm1fY3JlYXRlIGNyZWF0ZSA9IHsNCj4gKwkJLmV4dGVuc2lvbnMgPSAtMSwNCj4gKwl9Ow0KPiAr
DQo+ICsJZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVfVk1fQ1JFQVRFLCAmY3JlYXRlLCBF
SU5WQUwpOw0KPiArDQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGluYXZsaWRfcmVzZXJ2ZWQo
aW50IGZkKQ0KPiBJIGJlbGlldmUgd2UgaGF2ZSB0eXBvIGhlcmUgXiBzL2luYXZsaWQvaW52YWxp
ZC8NCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX3hlX3ZtX2NyZWF0ZSBjcmVhdGUgPSB7DQo+ICsJCS5y
ZXNlcnZlZFswXSA9IDB4ZmZmZiwNCj4gKwl9Ow0KPiArDQo+ICsJZG9faW9jdGxfZXJyKGZkLCBE
Uk1fSU9DVExfWEVfVk1fQ1JFQVRFLCAmY3JlYXRlLCBFSU5WQUwpOw0KPiArDQo+ICt9DQo+ICsN
Cj4gK2lndF9tYWluDQo+ICt7DQo+ICsJaW50IGZkOw0KPiArDQo+ICsJY29uc3Qgc3RydWN0IHNl
Y3Rpb24gew0KPiArCQljb25zdCBjaGFyICpuYW1lOw0KPiArCQlfX3UzMiBmbGFnczsNCj4gKwl9
IHZtX2NyZWF0ZV9mbGFnc19mYWlsX2Z1bmN0aW9uc1tdID0gew0KPiArCQl7ICJ4ZV92bV9jcmVh
dGVfZmF1bHQiLA0KPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9ERSB9LA0KPiArCQl7
ICJ4ZV92bV9jcmVhdGVfc2NyYWNoX2ZhdWx0IiwNCj4gKwkJCURSTV9YRV9WTV9DUkVBVEVfRkxB
R19TQ1JBVENIX1BBR0UgfA0KPiArCQkJRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxUX01PREUg
fSwNCj4gKwkJeyAieGVfdm1fY3JlYXRlX3NjcmFjaF9mYXVsdF9sciIsDQo+ICsJCQl+KERSTV9Y
RV9WTV9DUkVBVEVfRkxBR19MUl9NT0RFIHwNCj4gKwkJCURSTV9YRV9WTV9DUkVBVEVfRkxBR19T
Q1JBVENIX1BBR0UgfA0KPiArCQkJRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxUX01PREUpIH0s
DQo+ICsJCXsgfQ0KPiArCX07DQo+ICsNCj4gKwlpZ3RfZml4dHVyZQ0KPiArCQlmZCA9IGRybV9v
cGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiArDQo+ICsJZm9yIChjb25zdCBzdHJ1Y3Qgc2VjdGlv
biAqcyA9IHZtX2NyZWF0ZV9mbGFnc19mYWlsX2Z1bmN0aW9uczsgcy0+bmFtZTsNCj4gcysrKSB7
DQo+ICsJCWlndF9zdWJ0ZXN0X2YoImludmFsaWQtZmxhZy0lcyIsIHMtPm5hbWUpDQo+ICsJCQlp
bnZhbGlkX2ZsYWcoZmQsIHMtPmZsYWdzKTsNCj4gKwl9DQo+ICsNCj4gKwlpZ3Rfc3VidGVzdCgi
aW52YWxpZC1leHRlbnNpb25zIikNCj4gKwkJCWluYXZsaWRfZXh0ZW5zaW9ucyhmZCk7DQo+IEkg
YmVsaWV2ZSB3ZSBoYXZlIHR5cG8gaGVyZSBeIHMvaW5hdmxpZC9pbnZhbGlkLw0KPiArDQo+ICsJ
aWd0X3N1YnRlc3QoImludmFsaWQtcmVzZXJ2ZWQiKQ0KPiArCQkJaW5hdmxpZF9yZXNlcnZlZChm
ZCk7DQo+IEkgYmVsaWV2ZSB3ZSBoYXZlIHR5cG8gaGVyZSBeIHMvaW5hdmxpZC9pbnZhbGlkLw0K
PiArDQo+ICsJaWd0X2ZpeHR1cmUgew0KPiArCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gKwl9
DQo+ICsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL21lc29uLmJ1aWxkIGIvdGVzdHMvbWVz
b24uYnVpbGQgaW5kZXggMjcyNGM3YTlhLi5mYjlmYzc1ZDgNCj4gMTAwNjQ0DQo+IC0tLSBhL3Rl
c3RzL21lc29uLmJ1aWxkDQo+ICsrKyBiL3Rlc3RzL21lc29uLmJ1aWxkDQo+IEBAIC0zMjEsNiAr
MzIxLDcgQEAgaW50ZWxfeGVfcHJvZ3MgPSBbDQo+ICAJJ3hlX3N5c2ZzX3NjaGVkdWxlcicsDQo+
ICAgICAgICAgICd4ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb24nLA0KPiAgICAgICAgICAneGVf
dGxiJywNCj4gKyAgICAgICAgJ3hlX3ZtX2NyZWF0ZScsDQo+ICBdDQo+IA0KPiAgaW50ZWxfeGVf
ZXVkZWJ1Z19wcm9ncyA9IFsNCj4gLS0NCj4gMi4zNC4xDQoNCg==
