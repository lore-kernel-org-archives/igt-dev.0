Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE05CA5FEF
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 06:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A61510E36C;
	Mon, 19 Jan 2026 06:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMqbvHnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3637510E261
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 06:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768803340; x=1800339340;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ai3WBCUo3yawY9n1jzIzf+Dl4g7AgP+eVI00tZ90nCc=;
 b=lMqbvHnYAS+qbRLVPlWVbGqWViuLZa1AglkQkhmL4/llI/z1mMo3ln0j
 UAiRA4iZpFdRKQ9IecafYdMCnnc9U5IZlQfq6KcEp7AIV3oUrwRfrQK+y
 PYY/q7a2v25P19NZPaE8qslmrq3iKlIjkS+lOQ2W1O0PpiZxwgjmwfgyK
 eP0HuaUIQXO3CO1742JYYJiroHABMZ4yYu/oMZVGXPR/KvX+GsqdWl9Wb
 VQDbRT3lwD3L3G3JE6NAf99NqmqFfo777fLwFRHuSOSRsGG3aMvLETANx
 89uGHMIE5eyp0Msr50dB2T9N1GMb2nOwYoNCkmNdt0GO/g6+ThCSehbpR g==;
X-CSE-ConnectionGUID: HLD/dsjrSLmD1OEH45sIcw==
X-CSE-MsgGUID: Qn0Zz8+nQhiwbdwgBvUKNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73868313"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="73868313"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:15:40 -0800
X-CSE-ConnectionGUID: lt2q/cElQ1mEKhw0qXSoZg==
X-CSE-MsgGUID: To9l/9DuTViG0mxvOkhI0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210268307"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:15:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 22:15:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 22:15:39 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 22:15:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFsS63jZAhhXBYaaCiRkS4u9qGYgJPrejPT8g3N7cjO5z0IDbBZ0Y9or332JVtpm4qZa66MSv5OtI3RuE6ai2k2VxzcWhWRKFhq7ajX3hmRaB5bb7d2QzFe4FDw4Q1gTIe0oBTYdx85s4QBBhaTr1meMWyOCYIbAvtdo4s4iz4UwYLi96XdnW91iyX55kwcMaZfbjIBuIRNFRMXSaJ2SKNrM74ZLR9Zhv/5yfMCqH3g9spAVu1KM/WqEwzUshScUUGI6O8i2SGaTfssjXokvpdQOolSSPDLJskL8VrSKcwabaLGtqV7D88+0YcrTLI99X7dPJ0iB9cPauiS5SLxaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai3WBCUo3yawY9n1jzIzf+Dl4g7AgP+eVI00tZ90nCc=;
 b=NGLbqCUlwUXET+hUEUuJyROfyZw4C53n5ZK2zygR1N6Vp/8LwqkpZj8w15cQdbNca5Hkx/6oyid9HR+ACvcZnjzqSIOhLKq03nCWCjaEtQTxhz1jMGWVwyiq05CL1FcdwJbt5V709s/XqS9ZXk3zXR1zbhsLvU+cDtKoJF92LCXDgu7Qoxz+SKYDOfTjCbL4/YsdgLM6td4veZogK4s0Xtp1cDCzkIGOVLOpAXjDzH1wbmGqsd0qEsuN8DPwwLmsV/sh5GVnfPqkp2w0LY3ixsuzKl4B4ow/TgT1eIw8cSBYj1Y2K1FoMPFw3DA4eGzzHsckH5mM7zWN8HCqiRGuxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH0PR11MB7658.namprd11.prod.outlook.com
 (2603:10b6:510:28d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 06:15:32 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 06:15:32 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
Thread-Topic: [PATCH i-g-t] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
Thread-Index: AQHchq62ubL6WLn8v0a8uuo0dj3ztrVZBwkAgAABESA=
Date: Mon, 19 Jan 2026 06:15:31 +0000
Message-ID: <DM3PPF208195D8DE4B5BF3A53FF799D255BE388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260116060932.523060-1-suraj.kandpal@intel.com>
 <40aadfb7-2cca-49a1-b75d-0b6c00beea94@intel.com>
In-Reply-To: <40aadfb7-2cca-49a1-b75d-0b6c00beea94@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH0PR11MB7658:EE_
x-ms-office365-filtering-correlation-id: e9018e55-e358-4471-bc2f-08de57222680
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?S2FKb0JTT09qOXdCc0JtWUtKa2JpRjN2bXo1WWwrU3hmYXQ4dFVkWVhJdjJs?=
 =?utf-8?B?RlBkVUl6YnB4akQ0U1hJMG56dmpFRjk2dmw2SmtQKzBSMnNHMytDbkc1bi9u?=
 =?utf-8?B?aXBUSC9leTBpNWo5ZE1xem5TYndRNlVvbnltR0tqN0JVTlMyK1V1eTd5OXRm?=
 =?utf-8?B?L3pmUEQ4Rk8vRUxKVnp6VDJaaStqVnRYMSszbWQ2dUN1WStnNVdEWUI1L2Nk?=
 =?utf-8?B?OTZOMTJtNzYrM21mVW53Y1Y4SWZrdVdIcnVjMEFRaXd1Y0E2WmV0bkJWa1JW?=
 =?utf-8?B?c3VZeTVsREl3dG53M1Z0alNtQStaRDREc0tpaVNYY2d3UVlNK1JEUXdsb2Nx?=
 =?utf-8?B?ZEowSUFQNUE2TzdvQ0NoYzlkU2o4eEdJOEpLT0MwekV6eHRSc2tXSFRHVUFr?=
 =?utf-8?B?STJwUldMZ091dGFTOHhYYXFPLzV0dDhDT2ZJbXE0ajVpMWV6dWE0cjZHV3ZT?=
 =?utf-8?B?ZHlwSGZMekZ2emxpMmN3RkswZm5FK0NMcE1FUWQ5ejFuUjdCMnloM09Qa3pJ?=
 =?utf-8?B?T1ZQRkNZMUhzZnlBMDNjNkIvWjllOG5wYmtxOW16OCsvbmhSbDZkVDRQTVNw?=
 =?utf-8?B?bWtPL2VlU0hGRVEwaHRkd0JFaFpFV3duS2c4R3hjT2FKUzFPdGNJSnMxVVpD?=
 =?utf-8?B?MTN2eFJnbzNWRlBnUEZVTTB2ZGNSZEEvczVOalBBL0o2UjVmYlBpck9NNEZp?=
 =?utf-8?B?dWZlWFRhVVdDZ0J0Mk5UMmhRTzRwUnlhS0lWdjVobE1WaHJWQU0xNUlZdVBp?=
 =?utf-8?B?ekltMFV4azZPOTdiaERkWXRpb05mZ1BVVkY3bk9RbmVUQnBMQ1ZjcmV0RHZJ?=
 =?utf-8?B?TGx2TEtMRGtQWXlNMkpqSXI2WmpJSWpVbjl4SXZnVk9QWlgzNVg4Ui8wRzhB?=
 =?utf-8?B?T1ZVR2o0ZG84cmN4YlFVZ1lQNEdnZ0orbFY4MDJ3aTJrQXlQL3NzRVRCTHNP?=
 =?utf-8?B?dVJRd09jZEg2ZVJDSmZlZlZXZEJBdHVLNzhyR04yb3JBSUtTazhGSTVNdnNB?=
 =?utf-8?B?YWtMTkZva25qRGdQb3FJZ0c4OW1jdmh6aTVnOS9jQ0lrMXphd3R2TldSd3Zv?=
 =?utf-8?B?MXFvMkVjcnJGbkliTXFIYmUrVGsxUzlNWDg0aWtlZUxldXBYME4rV1RWWjVH?=
 =?utf-8?B?U0RieG1CbHBHclVKcStldy9XM0hwdEVEM3ZDd3BpRjdSSmlvbjhobSs2ZVNz?=
 =?utf-8?B?ZmF5Mlhpek13cVNXUEtwL05vTU5odXJ6U2YvdjArZksxMW42TDdRcGZlaWNT?=
 =?utf-8?B?MEtyQzQ3K2hINVhrVmM5U3NnNEI0eVh4eWdpSlBLbms5dGdwdWh5cWdCQnAx?=
 =?utf-8?B?RnFDYmY0bkljN2xGMDFJcE9lNTArMnRpQXY0TFZ2SjNrbmRJUE9UUGlNR1hl?=
 =?utf-8?B?VXk2aHN0L1dwNk9LWThFSEtvZHlRRW1QZTBEbW1qTTZNSUMzOFJ2SGJzdE1v?=
 =?utf-8?B?SDBTd2hUUEg5TXVpa1BDaWE1MXpSbWFrZ1JvNTRwR0xXQ1BEYktwV1RDRWda?=
 =?utf-8?B?Kzc0K3lEM3QvSjJBQmtlTTZMcTJXODIrNDlMdEZUMEw2Z2ZLN1d5REpnOHhP?=
 =?utf-8?B?cjBkdFN0OFl3c3JVSFR3ckN5MG9PWlJRMmlrT3FJQ2daZHhTUVZVbklCRThn?=
 =?utf-8?B?dHUrYXRDNUt0SWZzR0k3OHJPN05DT1dLNWxMT25TMm9heTRLQVpMWkxIWDVz?=
 =?utf-8?B?QWpWS3BxTWIrMG42Sis0SERidndBQTUyREllUUxldmJkU2JnQmxCRUFiYUxu?=
 =?utf-8?B?V1BrSjVZUklYaUsvQ3NqbUZZSVgwUUlObzZ4WEZqbWZHZU8wcFBTaDZQUWZV?=
 =?utf-8?B?ZndBOHUvSG8zbkJBamxxSGo2VTk4R0h5Yk1xNHR3SHI5YXVZdnA1UmVKcUo5?=
 =?utf-8?B?TktQdENCWi9tWGlnSXMxeHpBdHBnclhjcWVVZ3VDV3ZDTzdzRWFwMW1HNlpP?=
 =?utf-8?B?V2cvdUg3ckNaamlPRmw5RFJMU3lCZkJJNnROdUFIRDdZT2ZDN0xuR2ZHVmo5?=
 =?utf-8?B?dDZrZ1o1YnhlR1NiQVdGTTlKcUhoM2R0OGs2aFluVGEyMnd1RTJ6N1BJM2dC?=
 =?utf-8?B?VHlKZ0ZkejM2Y1RheW5TMW1FOG5kSkg5UUhnMGJxeHZXT2hyQ0tSSUxGanVP?=
 =?utf-8?B?UzhQWnV1QWxBVWxsWFl4OVZoWC9kQnFBem1LbURJZElvaEJFc2VoTC9jR0hE?=
 =?utf-8?Q?Xa4OwXvYS20QoshP9g0+Nww=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTc3N1ZPK1pPME5ubkVQVjNzRE1NSGhiVi9Gc1Rqc1NSZU5kS0tIbHFYaWJk?=
 =?utf-8?B?NS9PZHFBbG9MQ2VjaXgwZzA1TmlCSFB3bmdxVzl6ZDRXbzdtRS9VU2p1bjZr?=
 =?utf-8?B?SVhtNHZXbmwxQSsxV1FhanlRdXB2bnBzQ3ErdzNkbDRRTGxRL2RrMlNBbXN4?=
 =?utf-8?B?VDRua1RqbkwwaXNzK2tkRXV2aE1aSGJGeCtHaEZqVjJtbWU2c0lxdkRIQnlx?=
 =?utf-8?B?OXRka0ZaNWYwVWtDTzdEeGg0dm1tdS94NnZlVHVXWTMwdVFIN2ROOXRFNFNr?=
 =?utf-8?B?R244US9IMU1haEZTN3BBTGZmT05BRlJ1Z2FFN0VjY3lobjlOaDk3eTVkalJQ?=
 =?utf-8?B?emVxNnF6OHNTNWVCYUxrdFZLUVV2MXFwZDI5Wks0R0pobTRlYnpWMUxZVEw5?=
 =?utf-8?B?S0hoc0VhODJkbi9MTXYwMmFZcTQ1SnhEdWh0dnNybVQ5bWVHVis2UnQ4cGNB?=
 =?utf-8?B?MHJmOUM2K3dwVjJ2emNLbnlPYVYveDJCbnJuNmZMTng3RTNhQmpZYTY4MUNW?=
 =?utf-8?B?WnllODZHRVl0OHdMK1c4QzBNVXZSZXNSM2taSGx5cmY2QUQvTGo1WUtPY2hH?=
 =?utf-8?B?OU5Vb0xPbXVMczV1NTNWNFNHWXhPOU1iNlFYam1obEp2QW5rUk1SSlkxa2pz?=
 =?utf-8?B?V3RGVWtaMUhNelhQSjYzcEF5MUJ2SU1oZXRxUGt0QlgyQk9tV0dqekdQb1c5?=
 =?utf-8?B?L0lpOXRsZGQybllGRThlaEVKY0FwZFRsL1JubVRiTVVaUThPdU5hODB3emgr?=
 =?utf-8?B?SG9iSW81UFNPeWExVngvMjRMRjVsWDFGM3dIOENiZXU1cE8wQVRPNDZmZ0JC?=
 =?utf-8?B?YjArbGlZamhRVUVCOFJjK29abHJtSzlRcGZ4UW5LbXAvRkJLTWZGdzVXMjFN?=
 =?utf-8?B?SUs1VFZyUjlCMG5nWDFJTzRHOFVuN21tdXczdEE2aGV4bTMyWmN4UlE2Y2J1?=
 =?utf-8?B?ZXI5UTYyKy9uT3dZdE4rcWF5WTFwalhjR0V2YkxFN2tCMDN6anJUYlY3SHUw?=
 =?utf-8?B?RzFTSE0rRDBtY0F1dExReUNQaXZ0MmwyNGNXZ1NRMU95aldXRUczY0dTOGg1?=
 =?utf-8?B?YTBGYzNKRXVSdXlUbEVZQWE1aWQ2QmJBUEo1RTh3SDFWVHVFWFV5bkVCSm1p?=
 =?utf-8?B?SE0rYVVxVVpZM0JwbEdvaFc2bUYyaEJTOTBJbUZuK05QbGx6UjhHa1F5bVRv?=
 =?utf-8?B?dVZ5cXNpN2pPdU8wczYrcFdjZ2RyTktzbEV2eFNRTHdCNkgxVXpQRXg5d0Vm?=
 =?utf-8?B?cFNveUNWamVnWDMrNFlwOU9SRW9xTG9FUitJbFd6d3Y5eDdMM2ZZRHEwZkJM?=
 =?utf-8?B?VGpscEszdVhva1cweWtpdlRPa0VDR1p6OEVya1Z6eDF3Z2ExcGQrOWQ5c2dM?=
 =?utf-8?B?QjZUNVd2RkN4ZW5kcEVCSW93RktyZ25KU2pQbUxkb2tXbmZ6WVF6NU1JNHVZ?=
 =?utf-8?B?WkRzVEJSbnZFZCtJcklQZnA3NjZkTkZURzRaQVVzZ3lyMlJOeVhMZDJrdTUr?=
 =?utf-8?B?Y3pINThEbXQ3Q2kwbjdDbTNYZ2tGVDhvUE80dW5FdjVPaDhGODZUQUxNTkRH?=
 =?utf-8?B?aitrTVdKb1R6aENwb292ZlpCVTVlVVJiSlQxT3MyUDJYcmVSQUF1SmtjK3V5?=
 =?utf-8?B?V1cvS2ZwLzdWOFIrZUhsTHNIbXRDMjdrK3JLR1o1QXF4YkRoRndkTmFybFNx?=
 =?utf-8?B?Qk9JQkFhRWNMUEVoUE1Id2trb3NhZ1dqSTR4Nk1wdENITUtrUXZLR051WHYy?=
 =?utf-8?B?ZkZrcHdiSHNzZ0UxRFpIUWZidlJJbThpMmpaTUJNRkMyeW9mSjFKWEtNd05T?=
 =?utf-8?B?TFF5T0pmSTAvN2xYdFRyTVBPMlFsRFFteVpTNUU5MFh4MDJuY3Q2enA1WG1Z?=
 =?utf-8?B?T1FBS3BVVGM2U3FsY2dVbHZvYlBtNWswN3dkcmUrRnRqa20wRWJqaW5YNTAw?=
 =?utf-8?B?a1FyMEM1T0lYR0Y2Y2I0UG9MbjVNUEltVmd2YytEQ3JNQThoMlp5NEJOVzUz?=
 =?utf-8?B?M3plZ1RXMUVvTndCbmN3VWsweEdXTVNHZW9uVmwzTnkyTkJnd0c4WUZLMFlo?=
 =?utf-8?B?UFozY1NxUmRCU1poU1VBNm0ybGFyczRwa1laenh5UmhGN1IxQkRZVzhHbnhE?=
 =?utf-8?B?dnJsNHgxMXhEemtyR29VOGVFRitVTE9YemRPME9TSnlXbWl3SUdkb0hDSU9K?=
 =?utf-8?B?V056L1BiNXJmOTY5QnRPWmZzWmJhRysyN29RK3I0TVNXdjMvRFB3TFExWUR2?=
 =?utf-8?B?a2ZRdlEzVjk3UHdoSC9PTGhRUXl1eEFybEVFU3FyS1JiUHNOY1M0U2dCR0N5?=
 =?utf-8?B?WVA1dXZoN09VRTljODMwYVdVY3JqU1lNNHdnYXZRK2NsTnM2QklxUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9018e55-e358-4471-bc2f-08de57222680
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 06:15:31.9245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: viCFz9+JbKVo4VGmNLeRiQbM87t/t2A+IfvWCAv7Yc5WrsyukGTroV7+oa0HT/JkeqB69Vlf/gNTpde2Snl0Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7658
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10XSB0ZXN0cy9rbXNfdW5pdmVyc2FsX3BsYW5lOiBB
ZGQgdmJsYW5rIHdhaXQgZm9yIGN1cnNvcg0KPiBmYiBsZWFrDQo+IA0KPiBIaSBTdXJhaiwNCj4g
DQo+IE9uIDEvMTYvMjAyNiAxMTozOSBBTSwgU3VyYWogS2FuZHBhbCB3cm90ZToNCj4gPiBBZGQg
dGhlIHZibGFuayB3YWl0IGV2ZW4gZm9yIGk5MTUgYXMgdGhlIGxlZ2FjeSBwYXRoIHVzZXMgdGhl
IHZibGFuaw0KPiA+IHdvcmtlciB0byB1bnBpbiBjdXJzb3IgZmJzLg0KPiBQbGVhc2UgYWRkLA0K
PiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwv
LS9pc3N1ZXMvOTE5Ng0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU3VyYWogS2FuZHBhbCA8c3Vy
YWoua2FuZHBhbEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICB0ZXN0cy9rbXNfdW5pdmVyc2Fs
X3BsYW5lLmMgfCA5ICsrKysrLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfdW5p
dmVyc2FsX3BsYW5lLmMgYi90ZXN0cy9rbXNfdW5pdmVyc2FsX3BsYW5lLmMNCj4gPiBpbmRleCBh
YTU5MjdjZGYuLjlhYzZkMDFiNyAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9rbXNfdW5pdmVyc2Fs
X3BsYW5lLmMNCj4gPiArKysgYi90ZXN0cy9rbXNfdW5pdmVyc2FsX3BsYW5lLmMNCj4gPiBAQCAt
NzAzLDE2ICs3MDMsMTcgQEAgY3Vyc29yX2xlYWtfdGVzdF9waXBlKGRhdGFfdCAqZGF0YSwgZW51
bSBwaXBlDQo+IHBpcGUsIGlndF9vdXRwdXRfdCAqb3V0cHV0KQ0KPiA+ICAgCQkJICAgIENPTU1J
VF9BVE9NSUMgOiBDT01NSVRfTEVHQUNZKTsNCj4gPiAgIAljdXJzb3JfbGVha190ZXN0X2Zpbmko
ZGF0YSwgb3V0cHV0LCAmYmFja2dyb3VuZF9mYiwgY3Vyc29yX2ZiKTsNCj4gPg0KPiA+IC0JLyog
U2luY2UgdW5waW5uaW5nIG9mIGN1cnNvciBmYiBvY2N1cnMgZHVyaW5nIHZibGFuayBpbiB4ZSwg
d2UgbmVlZA0KPiA+ICsJLyoNCj4gPiArCSAqIFNpbmNlIHVucGlubmluZyBvZiBjdXJzb3IgZmIg
b2NjdXJzIGR1cmluZyB2YmxhbmsgaW4geGUsIGk5MTUNCj4gPiArCSAqIHNwZWNpYWxseSBpbiBj
YXNlIG9mIGxlZ2FjeSBjb21taXQgd2UgbmVlZA0KPiA+ICAgCSAqIHRvIHdhaXQgYXRsZWFzdCAx
IHZibGFuayBmb3IgZHJpdmVyIHRvIHJlbW92ZSBjdXJzb3IgZmIuIFdlIG5lZWQNCj4gPiAgIAkg
KiAxIGFkZGl0aW9uYWwgdmJsYW5rIGJlY2F1c2UgdmJsYW5rIGV2ZW50IGlzIHNjaGVkdWxlZCBi
ZWZvcmUNCj4gPiAgIAkgKiB1bnBpbm5pbmcuIFRoZXJlZm9yZSBhZGQgMiB2Ymxhbmsgd2FpdCB0
byBlbnN1cmUgdGhhdCBhbGwNCj4gPiAgIAkgKiBjdXJzb3ItcmVsYXRlZCBmcmFtZWJ1ZmZlcnMg
Y2FuIGJlIHJlbW92ZWQgYmVmb3JlIGNvdW50aW5nIHRoZQ0KPiA+ICAgCSAqIGZyYW1lYnVmZmVy
Lg0KPiA+ICAgCSAqLw0KPiA+IC0JaWYgKGlzX3hlX2RldmljZShkYXRhLT5kcm1fZmQpKQ0KPiAN
Cj4gSSBhc3N1bWUgdGhpcyBpcyBpbnRlbCBzcGVjaWZpYyByZXN0cmljdGlvbiwgc28gc2hvdWxk
IGl0IGJlDQo+IGlzX2ludGVsX2RldmljZSgpIGluc3RlYWQgb2YgcmVtb3ZpbmcgdGhlIGNoZWNr
IGZ1bGx5Pw0KPiANCg0KUmlnaHQgLA0KT3ZlcnNpZ2h0IGJ5IG1lIGl04oCZcyBhIGdvb2QgaWRl
YSB0byBoYXZlIGEgaXNfaW50ZWxfZGV2aWNlIGNoZWNrIGhlcmUgDQoNClJlZ2FyZHMsDQpTdXJh
aiBLYW5kcGFsDQoNCj4gVGhhbmtzIGFuZCBSZWdhcmRzLA0KPiBLYXJ0aGlrLkIuUw0KPiA+IC0J
CWlndF93YWl0X2Zvcl92YmxhbmtfY291bnQoaWd0X2NydGNfZm9yX3BpcGUoJmRhdGEtPmRpc3Bs
YXksDQo+IHBpcGUpLA0KPiA+IC0JCQkJCSAgMik7DQo+ID4gKwlpZ3Rfd2FpdF9mb3JfdmJsYW5r
X2NvdW50KGlndF9jcnRjX2Zvcl9waXBlKCZkYXRhLT5kaXNwbGF5LCBwaXBlKSwNCj4gPiArCQkJ
CSAgMik7DQo+ID4NCj4gPiAgIAkvKiBXZSBzaG91bGQgYmUgYmFjayB0byB0aGUgc2FtZSBmcmFt
ZWJ1ZmZlciBjb3VudCBhcyB3aGVuIHdlDQo+IHN0YXJ0ZWQgKi8NCj4gPiAgIAljb3VudDIgPSBp
bnRlbF9nZW1fZmJfY291bnQoZGF0YSk7DQo=
