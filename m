Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53F3CEBF97
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 06:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E55810E411;
	Tue, 18 Nov 2025 06:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djrj5B4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9385810E412
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 06:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763446311; x=1794982311;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JYlKn3mPDPf/JXXeSnYX62QCzF4dMepsyoD0wRy/yq0=;
 b=djrj5B4WYNju1r9NPVaEAH9lf+A4pdsnH6MWJ11eKSpNFK4MDjXxJDKW
 UNja2YAHH8c0WtWX6ygopIFSg0q6S1AvfT9Q1XEHQ13yaV23BroEDM7TM
 SqvkGrkG48riupdlbXIqX4fg7hxefzK8xViW4df0R7dalnPx/DRJRY9OM
 HfQcnDsHJKCyjaluM1du4EdZq4zJFum5HT7vyIIG9om69XKkUE2am4fot
 4V9iub2WX4gvCh8mDeVw7W1bsxvd7XtY8smWmErf0hUAFKgc88yvTigpm
 TF/wFBY/z+Yl1w8lvv8mPHRdhPHmLDpNdyLmqv8cgdkhtn0DcDpXibJRG A==;
X-CSE-ConnectionGUID: 9tzWwHMKS1iee9+ZV1pVVg==
X-CSE-MsgGUID: FEGMT22pT9mV4YtFFdeW0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="68062831"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="68062831"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:11:49 -0800
X-CSE-ConnectionGUID: y2CJXoGzSb+mWt/MtLSX9Q==
X-CSE-MsgGUID: vyjm6NGrQkifd0xfqRNdiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195586189"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:11:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:11:47 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 22:11:47 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:11:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ma2/Gd3VmukQo22r1qk6GheP3eMaRIZI3Dm5UW7307sXcI87sCQ1dEa76mSxQZJV0Q9MlgPjOJ+l5q9OsCIPfS7qodB4EdKQGAteSWdkCkTZhhMeyxwF3NrdTFoMncaFSymAig1qv4kzCWIOWJzrAfc26qyvn9yWitPoDytJV855ODVTZyX5vflBoZzZMJC2QbLEONF+yP3vYFE9cFxnuXHAdWl1JN5teQxGgG+EC8p3khL/bfnECymvePwS5G5hCLLg0MrndGrkWeajghrfXAFs7ykqzffVQKly+8JHxDE95503YWeMoFJgRD8s4pvcznERXPbVOPECb6QbsdX0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYlKn3mPDPf/JXXeSnYX62QCzF4dMepsyoD0wRy/yq0=;
 b=tM172oZ7mcr45bhsFutzhbDULfQqV2XZxFsD6+ejvy+cZkk3ybkhx2kq1xCXqm+yF7pFtFgFjIRbnnddOz7jYsMouOFkujUJcZYFs1Y5OMWOd+NuuEG/LUANWDHFF3Tidm/8cW6HaRcrYLXviAwEmfWZgpjM1gYPNYGnTHJS7J8Ww9SGn5009ktSjzWlq1WseEYKoX3Gp0RCFvlvu4EMjDUUODY6Hqi42Ox5Yia/i81eHYYBwJ1pxH1CG9b9UT7cFRmG1gGNYhROg/WJEQG9X2eKrd8tDmCb+gPhu5s8Ptsii5+qmA5wPBRgvqYZxRlFkr4cL/s5SAFpQ6uvarrzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 06:11:28 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.019; Tue, 18 Nov 2025
 06:11:28 +0000
From: "Wang, X" <x.wang@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Summers, 
 Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Thread-Topic: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Thread-Index: AQHcQhcWMr9ujNAHOEOqsV24rN8bJbTnupCAgBBQnXA=
Date: Tue, 18 Nov 2025 06:11:28 +0000
Message-ID: <SA3PR11MB80466F35AA1F6AA60C0CCDBE86D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251020231253.138842-1-x.wang@intel.com>
 <20251020231253.138842-3-x.wang@intel.com>
 <20251107194739.s2yrsh2xt7greq3q@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251107194739.s2yrsh2xt7greq3q@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|DS0PR11MB7381:EE_
x-ms-office365-filtering-correlation-id: d9ab2f46-c126-40ea-aeee-08de26694fd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|376014|10070799003|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WlZNNDJheW5sU3JlZUZhYitXVm1yMVFCdXBiMGZiK1ZOS1dqcnN1Ui8zWWZB?=
 =?utf-8?B?S3JYdW02OWpORE5pQ0NoaE8zaEZya3prWEE4R0J1Y2ovckU1allCc0xGRkt4?=
 =?utf-8?B?VUU3Zmsvc051Y3RDeHJkMkNqc0FEYmNmZSsvSGVTYTdwamtvQk9GZTJ5TFRR?=
 =?utf-8?B?T2x6NER3dVdJODZmbnJHR2JmMy9OMUtmQVEwR3c1bHBId01lcGNzNUtGcW5s?=
 =?utf-8?B?eVUzZEhNNDdzYWsvcXVDc1pVamcxTVlMclc3UjBBV2NydzlSTzhwTXRpQmZX?=
 =?utf-8?B?dGJ1TU9XcFJ0VDkzdXpqNlY2ODdSWXRmRUdqTHBZRy9xL2p6a3JXNmE5cnpV?=
 =?utf-8?B?ZzF0RllqVUhYWkd3RFMyRXFrRmpzakhTK0oveWlsbFpQK1ZNMzlKc0VURW1i?=
 =?utf-8?B?MWNQRlp0S1Y5ZVd6Q2lVSjl4eTRWc1ExYUVFTnd2VGxiMmhYQmJzSkVJTTRX?=
 =?utf-8?B?eG1pS1pUcStwdkpkVVpraVAxV0llWnVsS2VwbmM2aVgvN1NSZHJhOVQwU3Zp?=
 =?utf-8?B?eG45c2VEclRnUE1qZVY4dHJyUTBwWnpNRlh5bXRSYU13bGVNbk84TEpiZE45?=
 =?utf-8?B?cHVaWU1mTjA0SS9XYWZhU1NKMkhUUFd4cEJaUk85UEtnbkdQYkxUMTdNWURM?=
 =?utf-8?B?akExMDR6cVltYzRlOS85a0N6dVMvV0pnZERvdUlTOEZSUVBVMkw5MCtpZ05D?=
 =?utf-8?B?TWhJYzZkblI2b3Bsc000WGtrUTFQaVhlaUVrRkhyVFQ3OXBMbnJ6SXdPTTRK?=
 =?utf-8?B?Q2ZydU5KRTZ4V1FaSlNVaWp2U2hTRHdQK1p6RlZtWThUKy9MZWQwZUpjZitS?=
 =?utf-8?B?RXZKS0Y5Tjk2WlY4U1F2cXNZSy9ZcDFwUFhXUmp5L3ZFUVA0MzNQOU1tdjJp?=
 =?utf-8?B?bnR1VkMyTTJRUjNhSW9pa3JTNTFuak5RS2ZjR1IwQVcvanRreG1EVWpOZFRW?=
 =?utf-8?B?OTBSYjl0M2lnQ204TDM0aEZibjRMQ3JmcE9UdExRMDZFeWU4UEJ0NmorRFZL?=
 =?utf-8?B?dHVlcEE4K24zTURIZGQ2b0cwTURFcjQ0Q2pRQ3ZXaGFTQUQ3WXYvbmprUmp0?=
 =?utf-8?B?bHViZEd4anFvdGs4YUM5aXplRnFXd2dOWEFSZzBBbmlwUnBLK0pTZWlUVS84?=
 =?utf-8?B?aCtEU2JkYWJTdWMxTFdwNGtVM2xDdUdZQmhVR1BVbVhXSGRGRm5QZk9GTmhz?=
 =?utf-8?B?NVRMenpMRXVBWFI4Uy9EdGRqWVBXNzBLVEZPQW1ZSnBhZExzd1FONURHdUsv?=
 =?utf-8?B?L3dXSkQ3WlhvV2dDU3VhMGE4RlB2ODREVERHVHJWa0NWd0FVSTRlWmcrcmVQ?=
 =?utf-8?B?RDc0RHZKdHUxei9Ja28ybnJSY1NWUnlqTFkyMlJaQnFEMDRPRWNuTkVHTEFS?=
 =?utf-8?B?alBBMnV0UlhWdnEzWVlnSkZvajlKSGpCbDNVdXJxRHJaRW1pbThDNVdSemcz?=
 =?utf-8?B?d0E1OC83ZnNwS01yQzgyaGlMcEdjQ2szYVhtTDdPY2hBalFianJaanhkWnI5?=
 =?utf-8?B?WWFEQlRTZE5najhqNTBZSExvU3VuSE51bGI3dnh2ckxUKzU5a1UwN08rWXJy?=
 =?utf-8?B?VkZseVpuS0xTNmVZeEdVbDRpT0VuT0FMaDhMM2dNS21TVEhYaVhiUTdpVjhL?=
 =?utf-8?B?NWxVNTR2MFJOcDNweWJUTy9VcHdSd3lvb3FRVEhRajdjN0h6WnhRRDM3ODhi?=
 =?utf-8?B?Q2RjM01Ud1dsdXAvRUhZR2JOdVNuUXZNci84Sk5BNHVIWDhXelMyakZGWUZ1?=
 =?utf-8?B?VFJOUk1HSVJkVHJOTmpTV2tySGg1Q1BsSENXM0pCL2kvdmE0R0JCODZFc2w1?=
 =?utf-8?B?VFExSnBIOForc2pNak5RY2lWOVNXK0E3VzIzVTVFU1Zad2VMKy9Hb0x0QVBJ?=
 =?utf-8?B?SmsxajluRit3OHZzQjczSlc0T0cxNkc3bUJIZmk3QmlQaXF3V3RZcmk2bTNY?=
 =?utf-8?B?VVNvYkkyZjBNRDlpeTdFVSs0dU82RVAxUzQ0ZjVkdS9aM2h5eU9RTmRydDI5?=
 =?utf-8?B?Q3B4enZBSXhmWTBza0lDYzkwb1BzZ2RxK2trdENUb0NLMGQ2dlo4dmtOWng1?=
 =?utf-8?Q?X8gQC+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(10070799003)(1800799024)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGtZRFcwM0V0RmNUOTlKTU5meHNuM1dUOXF6cDR2ejlhUjlsUHd6UmgrSUZ6?=
 =?utf-8?B?aTZOY2VSYnlCZWl0Y0ZWdkJscFpMRWJyRk10YnpYN2NkN05ydVhHSGZVMTU1?=
 =?utf-8?B?WVYvRXZ1QWxLaksva004R2pLeEhLYUd3bktuODlub2pOdUdLSSswY25iU2hl?=
 =?utf-8?B?VkpkMlV1Vi9RSUo4NSs3dW0yNkhCSERXR1RXT0VXRHZYRnRmblZLQzExUUhy?=
 =?utf-8?B?RVRGT3pIZFlabXdWeEpscHRZUThnc3YrQXNZWFRuZ2ZIUzBEMFZjOTlmWldk?=
 =?utf-8?B?WWU5UzdyUFpJTDgvbHdMQmtQRnlrRFJZbVpDejl5Wm9QRzUyNVU0L3F2dWtB?=
 =?utf-8?B?bzIyNVNaUmcvWnc3a1VTd01hR0xuOEx3b1JubVFTQThhdkc5dUVPL2x5a0xV?=
 =?utf-8?B?MUhIVWdsR2V4bHNBaDhoWFIxMng3TnFiaG03bFA2MVdvbEtUaG5nSWFKMmhh?=
 =?utf-8?B?ZytXYS8xMGoxcFZDN3hYVW1VYWRKVmVObitpQ2RIRlFPNzNPVGZVcDl5SGxo?=
 =?utf-8?B?aEtGc1NBUW5mMFk1NDlYc1l3VGw2SUtLbWZiNWtPY0VvSnRmM1RIT3RBR0Zz?=
 =?utf-8?B?WFkrZzhzNE5PZVlBZzhvOHA1bGZHMGdQL1lvMWFyYitQejhNRFVwU3pwT1Jk?=
 =?utf-8?B?d3JaQmNZUkIwS0tUWXdQcUhSakVpaTBubzJJdmFldlp5UmxTNnhBaG5PenRU?=
 =?utf-8?B?aWx6cEhCSGs2Y3dkZkxsWnkyTWl3QkFTZmxISDlQVzV0a093UWk1dTgvYU9O?=
 =?utf-8?B?SnRkZWhyVHg4ZWhCeUFhR0VFTXk4TU9YQVRiN0xXbjYvbXBRQjhmZWN0NktJ?=
 =?utf-8?B?QWlBbmZZZ0kwZnhaMyt4UDFKcEJ1R1JsMktidkgzZTdiV05YdXdabUJRNnh1?=
 =?utf-8?B?azhVbHFoNjVQb2IrTTNJd3hha2lvaGc3MWIzdTlscmpWRHhFOE9IKzNvVkU0?=
 =?utf-8?B?ZkQxdHhkWE9qSThIS1FEK1ZNNU1QaVVDTmNiK3U5R2M0aFdSd2RNVEpKUjBZ?=
 =?utf-8?B?UXBveVdCZ1JwUkZlK21iU2hTb0UycG5QVmNOQVZwRW05UWVzK2F5c0VNVHBz?=
 =?utf-8?B?QkI0OGpybSs2elVGeVlVKzF0c0F4N3hWR0lBL2xhY1FPQnFIK3dLYUJaRmsy?=
 =?utf-8?B?R1IzV2xqcUhSV1pKSXZySTN3WHc5MDRVNFZ5dncwTWdEczBmc3FYRHM1SVE1?=
 =?utf-8?B?SXZadDNWQ2QybC9ybWpIdStNRlNGMnEvUU5aR3ErbmlHV3M4VHdnM01NenpX?=
 =?utf-8?B?TFhMR2pldGdGUDFBY2dHc0k5VUlGZERjUEJVaDdEeWw2UVdRejNCWStIcXBp?=
 =?utf-8?B?QnZxY3dyTFdHMUJWbTRnbUtIbE5nYzNjWmkvWm5peTNiWHk3OHhaUElSOVRZ?=
 =?utf-8?B?Q1RqN3dpeVpFVUNBQ2FPdFRBOGJhaXhQaEJmNlQ5ZXBOdXVqNExla1ZqTnN6?=
 =?utf-8?B?ZEJwNmk1azRvL1ZNSUd3TVRzYUR0dkkzVFUyZC81Y3hveGRPeGhNUFlvZFEw?=
 =?utf-8?B?MEM2VEVGQmFUL0t3OGJPeFFrZ2FFR1EzaTJiMklUMU1yMHdFYjBNK1U2MWQz?=
 =?utf-8?B?dk9MVTU1eUNDMDJYRWR6V3NVRmRkeVNTOExiaEZHUFhUSHNNT2xseUEra3hl?=
 =?utf-8?B?cWhPbDZ5L0FmVzNKUU5JekVtSlpFdHRXMHJkcDJZZ2F6alpIWDZaeDVtZlUw?=
 =?utf-8?B?VXhLUGszMWNWK0xZcklibHFIWi9WN2ZZTzBiY3Z0TG1JTGZHNlhBZWpNc1N3?=
 =?utf-8?B?OWdYV0RRYlRMREhaM2VxVHZRVmdNQ3c4bUVrRTBrbk5tWnJyR0R6eDhhMzFo?=
 =?utf-8?B?REN0L3VFUncyS1NEblJ6TW9MQWxDN2VXRkJJZGdKS1NSblRGeDl4TDJ5NWd2?=
 =?utf-8?B?ak45NVNJZDZlV2JLT0V1djJPb25GdGV3MDlVZ0dmRlYvUk10Q3NzMjk0MWE4?=
 =?utf-8?B?UGw3TkJrK2dLbzFQUWN3Ry9GbEdQNDNZaTVkYURkb2RMTGJtazNRekZwWWVp?=
 =?utf-8?B?MGF1WEM0K2NoeXdKVjN0Tjc4Nll4S0QvekxnQ3hhYWY1Si9hOW4zQnlYR0Yw?=
 =?utf-8?B?WlZXM0MxVnduMVZuM09ibjBtY2dOci9JcGZFeFcwVWtQQW9PT1dvVHEvOVdo?=
 =?utf-8?B?VWMwNE9qNDlSQ1crejVROXcwSUtma1d5cHZUOUVUcnVYdzVCdTFObkxGM09R?=
 =?utf-8?Q?W/e+IZ/9zvVO1DYfjZ9+RTg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ab2f46-c126-40ea-aeee-08de26694fd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 06:11:28.5730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WEZ336VmGxb+if0xz48kXUyFRc84cWVn4B5w1Rnj5XUxaurvO+RqMhwdpqH+Cq39oTXPRz/2QqWnkyk1QE5USA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE5vdmVt
YmVyIDcsIDIwMjUgMTE6NDgNCj4gVG86IFdhbmcsIFggPHgud2FuZ0BpbnRlbC5jb20+DQo+IENj
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU3VtbWVycywgU3R1YXJ0DQo+IDxzdHVh
cnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMi8yXSBsaWIv
aW50ZWxfZGV2aWNlX2luZm86IFF1ZXJ5IHJ1bnRpbWUgeGUgZGV2aWNlDQo+IGdyYXBoaWNzIHZl
cnNpb25zDQo+IA0KPiBIaSBYaW4sDQo+IE9uIDIwMjUtMTAtMjAgYXQgMjM6MTI6NTMgKzAwMDAs
IFhpbiBXYW5nIHdyb3RlOg0KPiA+IEZvciBwbGF0Zm9ybXMgd2l0aCBncmFwaGljc192ZXIgPj0g
MjAsIHF1ZXJ5IHRoZSBydW50aW1lIHhlIGRldmljZSB2ZXINCj4gPiBpbnN0ZWFkIG9mIHJlbHlp
bmcgc29sZWx5IG9uIGhhcmRjb2RlZCB2YWx1ZXMgZnJvbSB0aGUgUENJIGRldmljZSB0YWJsZS4N
Cj4gPiBUaGlzIGVuYWJsZXMgYWNjdXJhdGUgSVAgbWlub3IgdmVyc2lvbiAoZ3JhcGhpY3NfcmVs
KSBkZXRlY3Rpb24gZm9yDQo+ID4gcGxhdGZvcm1zIGxpa2UgWGUyIHdoZXJlIGRpZmZlcmVudCBz
dGVwcGluZ3MgaGF2ZSBkaWZmZXJlbnQgSVAgdmVyc2lvbnMuDQo+ID4NCj4gPiBJbXBsZW1lbnRh
dGlvbiBkZXRhaWxzOg0KPiA+IC0gVXNlIHdlYWsgc3ltYm9sIGxpbmthZ2UgZm9yIHhlX2lwdmVy
X2NhY2hlX2xvb2t1cCgpIHRvIGhhbmRsZSBzdGF0aWMNCj4gPiAgIGxpYnJhcnkgY29tcGlsYXRp
b24gKGxpYmlndF9jaGlwc2V0LmEsIGxpYmlndF9kZXZpY2Vfc2Nhbi5hKSB3aXRob3V0DQo+ID4g
ICB4ZV9xdWVyeS5jIGRlcGVuZGVuY2llcyB3aGljaCBhcmUgdXNlZCBmb3IgaTkxNSB0b29scyAo
aTkxNV9wZXJmIGFuZA0KPiA+ICAgaW50ZWxfZ3B1X3RvcCkNCj4gPiAtIFByb3ZpZGUgYSB3ZWFr
IHN0dWIgdGhhdCByZXR1cm5zIE5VTEwgd2hlbiB4ZV9xdWVyeSBpcyBub3QgbGlua2VkDQo+ID4g
LSBGb3IgR2VuMjArIHBsYXRmb3JtcywgcHJlZmVyIHJ1bnRpbWUgeGUgZGV2aWNlIHZlcnNpb25z
IG92ZXIgc3RhdGljDQo+ID4gZGF0YQ0KPiA+IC0gRmFsbCBiYWNrIHRvIFBDSSB0YWJsZSBpZiB4
ZSBkZXZpY2UgaW5mbyBpcyB1bmF2YWlsYWJsZQ0KPiA+IC0gUmVzZXQgY2FjaGUgb24gcXVlcnkg
ZmFpbHVyZSB0byBhbGxvdyByZXRyeQ0KPiA+DQo+ID4gUmVtb3ZlIGhhcmRjb2RlZCBncmFwaGlj
c19yZWwgZnJvbSBzdGF0aWMgdGFibGUgZW50cmllcyBmb3IgeGUgZGV2aWNlcw0KPiA+IGFzIHRo
ZXkgd2lsbCBiZSBwb3B1bGF0ZWQgYXQgcnVudGltZSBmcm9tIEdNRF9JRC4NCj4gPg0KPiA+IFRo
aXMgdW5pZmllcyBkZXZpY2UgaW5mbyBoYW5kbGluZyBiZXR3ZWVuIGk5MTUgYW5kIHhlIGRyaXZl
cnMsIGVuYWJsaW5nOg0KPiA+IC0gUGxhdGZvcm0tc3BlY2lmaWMgd29ya2Fyb3VuZHMgYmFzZWQg
b24gYWNjdXJhdGUgSVAgdmVyc2lvbnMNCj4gPiAtIENvbnNpc3RlbnQgZGV2aWNlIGluZm8gQVBJ
IGFjcm9zcyBib3RoIGRyaXZlcnMNCj4gDQo+ICtDYzogIlN0dWFydCBTdW1tZXJzIiA8c3R1YXJ0
LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWGluIFdhbmcgPHgu
d2FuZ0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGxpYi9pbnRlbF9kZXZpY2VfaW5mby5jIHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbGliL2lu
dGVsX2RldmljZV9pbmZvLmMgYi9saWIvaW50ZWxfZGV2aWNlX2luZm8uYyBpbmRleA0KPiA+IGE4
NTNmOWFiNC4uODdiMTA2OWJlIDEwMDY0NA0KPiA+IC0tLSBhL2xpYi9pbnRlbF9kZXZpY2VfaW5m
by5jDQo+ID4gKysrIGIvbGliL2ludGVsX2RldmljZV9pbmZvLmMNCj4gPiBAQCAtMyw2ICszLDE2
IEBADQo+ID4gICNpbmNsdWRlICJpOTE1X3BjaWlkc19sb2NhbC5oIg0KPiA+DQo+ID4gICNpbmNs
dWRlIDxzdHJpbmdzLmg+IC8qIGZmcygpICovDQo+ID4gKyNpbmNsdWRlIDxzdGRkZWYuaD4NCj4g
PiArI2luY2x1ZGUgPHN0cmluZy5oPg0KPiA+ICsNCj4gPiArLyogV2VhayBzeW1ib2wgc3R1YiAt
IHdpbGwgYmUgb3ZlcnJpZGRlbiBpZiB4ZV9xdWVyeS5jIGlzIGxpbmtlZCAqLw0KPiA+ICtzdHJ1
Y3QgeGVfZGV2aWNlX2lwdmVyICp4ZV9pcHZlcl9jYWNoZV9sb29rdXAodWludDMyX3QgZGV2aWQp
DQo+ID4gK19fYXR0cmlidXRlX18oKHdlYWspKTsNCj4gPiArDQo+ID4gK3N0cnVjdCB4ZV9kZXZp
Y2VfaXB2ZXIgKnhlX2lwdmVyX2NhY2hlX2xvb2t1cCh1aW50MzJfdCBkZXZpZCkgew0KPiA+ICsJ
cmV0dXJuIE5VTEw7DQo+ID4gK30NCj4gPg0KPiANCj4gVGhpcyBzZWVtcyB3cm9uZywgeW91IGNh
bm5vdCBjYWNoZSBieSBkZXZpZCwgZWl0aGVyIHlvdSBhbHJlYWR5IGhhdmUgaXQgb3INCg0KV2h5
IGNhbid0IGNhY2hlIHRoZSBpcHZlciB3aXRoIHRoZSBkZXZpZCA/PyAgV2UgYXJlIG5vdCBleHBl
Y3RpbmcgdG8gcmVhZCB0aGUgcmVnaXN0ZXIgZXZlcnkgdGltZSwgc28gd2UgbXVzdCBjYWNoZSB0
aGUgdmFsdWUgc29tZXdoZXJlLg0KPiBub3QuIEFsc28gZGV2aWQgZGVwZW5kcyBvbiByZWdpc3Rl
cihzKSByZWFkaW5nIGFuZCB5b3UgY2FuIGFjY2VzcyB0aGF0IG9ubHkNCj4gd2hlbiB5b3UgaGF2
ZSBmZCBhbHJlYWR5IG9wZW5lZC4NCj4gDQoNCg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGlu
dGVsX2RldmljZV9pbmZvIGludGVsX2dlbmVyaWNfaW5mbyA9IHsNCj4gPiAgCS5ncmFwaGljc192
ZXIgPSAwLA0KPiA+IEBAIC01MDUsNyArNTE1LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRl
bF9kZXZpY2VfaW5mbw0KPiA+IGludGVsX3BvbnRldmVjY2hpb19pbmZvID0gew0KPiA+DQo+ID4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gaW50ZWxfbHVuYXJsYWtlX2lu
Zm8gPSB7DQo+ID4gIAkuZ3JhcGhpY3NfdmVyID0gMjAsDQo+ID4gLQkuZ3JhcGhpY3NfcmVsID0g
NCwNCj4gDQpJbiBmYWN0IHRoZSBwdXJwb3NlIG9mIHRoZSBwYXRjaCBpcyB0byBmaXggdGhlIC5n
cmFwaGljc19yZWwgZXJyb3Igb24gc29tZSBkZXZpY2VzLiBBbmQgd2UgYWxyZWFkeSBoYXZlIHRo
ZSBjb3JyZWN0IHZhbHVlIHNvIHdlIGNhbiBzYWZlbHkgcmVtb3ZlIGl0LiANCkkga2VlcCB0aGUg
IC5ncmFwaGljc192ZXIgaGVyZSBpcyBmb3Igc29tZSBvZiB0aGUgdG9vbHMgbWF5IG5lZWQgdG8g
Y2hlY2sgdGhlIGdyYXBoaWNzIHZlciB3aXRob3V0IG9wZW5pbmcgdGhlIHhlIGRldmljZXMuIEZv
ciB0aGlzIGtpbmQgb2YgdXNlIGNhc2UgDQp0aGUgdG9vbCBpcyBub3QgaW50ZXJlc3RlZCBpbiB0
aGUgLmdyYXBoaWNzX3JlbC4gDQoNCj4gVGhpcyBhbHNvIHNlZW1zIHdyb25nLCBwbGVhc2Uga2Vl
cCBvbGQgdmFsdWVzIGZvciBjb21wYXRpYmlsaXR5LCBoZXJlIGFuZA0KPiBiZWxvdy4NCj4gDQo+
IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+ICAJLmRpc3BsYXlfdmVyID0gMjAsDQo+ID4gIAku
aGFzXzR0aWxlID0gdHJ1ZSwNCj4gPiAgCS5oYXNfZmxhdGNjcyA9IHRydWUsDQo+ID4gQEAgLTUx
Nyw3ICs1MjYsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvDQo+ID4g
aW50ZWxfbHVuYXJsYWtlX2luZm8gPSB7DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBp
bnRlbF9kZXZpY2VfaW5mbyBpbnRlbF9iYXR0bGVtYWdlX2luZm8gPSB7DQo+ID4gIAkuZ3JhcGhp
Y3NfdmVyID0gMjAsDQo+ID4gLQkuZ3JhcGhpY3NfcmVsID0gMSwNCj4gPiAgCS5kaXNwbGF5X3Zl
ciA9IDE0LA0KPiA+ICAJLmhhc180dGlsZSA9IHRydWUsDQo+ID4gIAkuaGFzX2ZsYXRjY3MgPSB0
cnVlLA0KPiA+IEBAIC01MjksNyArNTM3LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9k
ZXZpY2VfaW5mbw0KPiA+IGludGVsX2JhdHRsZW1hZ2VfaW5mbyA9IHsNCj4gPg0KPiA+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvIGludGVsX3BhbnRoZXJsYWtlX2luZm8g
PSB7DQo+ID4gIAkuZ3JhcGhpY3NfdmVyID0gMzAsDQo+ID4gLQkuZ3JhcGhpY3NfcmVsID0gMCwN
Cj4gPiAgCS5kaXNwbGF5X3ZlciA9IDMwLA0KPiA+ICAJLmhhc180dGlsZSA9IHRydWUsDQo+ID4g
IAkuaGFzX2ZsYXRjY3MgPSB0cnVlLA0KPiA+IEBAIC02NzUsNiArNjgyLDggQEAgY29uc3Qgc3Ry
dWN0IGludGVsX2RldmljZV9pbmZvDQo+ID4gKmludGVsX2dldF9kZXZpY2VfaW5mbyh1aW50MTZf
dCBkZXZpZCkgIHsNCj4gPiAgCXN0YXRpYyBfX3RocmVhZCBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2
aWNlX2luZm8gKmNhY2hlID0NCj4gJmludGVsX2dlbmVyaWNfaW5mbzsNCj4gPiAgCXN0YXRpYyBf
X3RocmVhZCB1aW50MTZfdCBjYWNoZWRfZGV2aWQ7DQo+ID4gKwlzdGF0aWMgX190aHJlYWQgc3Ry
dWN0IGludGVsX2RldmljZV9pbmZvIHhlX2Rldl9pbmZvOw0KPiA+ICsJc3RydWN0IHhlX2Rldmlj
ZV9pcHZlciAqaXB2ZXI7DQo+ID4gIAlpbnQgaTsNCj4gPg0KPiA+ICAJaWYgKGNhY2hlZF9kZXZp
ZCA9PSBkZXZpZCkNCj4gPiBAQCAtNjg5LDYgKzY5OCwxNyBAQCBjb25zdCBzdHJ1Y3QgaW50ZWxf
ZGV2aWNlX2luZm8NCj4gKmludGVsX2dldF9kZXZpY2VfaW5mbyh1aW50MTZfdCBkZXZpZCkNCj4g
PiAgCWNhY2hlZF9kZXZpZCA9IGRldmlkOw0KPiA+ICAJY2FjaGUgPSAodm9pZCAqKWludGVsX2Rl
dmljZV9tYXRjaFtpXS5tYXRjaF9kYXRhOw0KPiA+DQo+ID4gKwlpZiAoY2FjaGUtPmdyYXBoaWNz
X3ZlciA+PSAyMCkgew0KDQp4ZV9kZXZpY2VfZ2V0KGZkKSAoaW4geGVfcXVlcnkuYykgcmVjb3Jk
cyB0aGUgdHVwbGUgKGdyYXBoaWNzX3ZlciwgZ3JhcGhpY3NfcmVsLCBkZXZpZCkgaW50byB4ZV9p
cHZlci5tYXAgb25jZSBpdCBoYXMgZmV0Y2hlZCBEUk1fWEVfUVVFUllfR1RfTElTVC9DT05GSUcu
IFRoZSBrZXkgaXMgdGhlIFBDSSBkZXZpZCwgdGhlIHZhbHVlIGlzIHRoZSBJUCB2ZXJzaW9uIHdl
IGp1c3QgcmVhZCBmcm9tIEdNRF9JRC4NCkV2ZXJ5IFhlIHVzZeKAkWNhc2UgY2FsbHMgeGVfZGV2
aWNlX2dldChmZCkgd2hlbiBvcGVuaW5nIHRoZSBkZXZpY2U6IHRoZSBjb21tb24gZHJtX29wZW5f
ZHJpdmVyeyxfYW5vdGhlcn0oKSBwYXRoIGFscmVhZHkgZG9lcyB0aGlzIGF1dG9tYXRpY2FsbHkg
KHNlZSBsaWIvZHJtdGVzdC5jDQoNCg0KPiA+ICsJCWlwdmVyID0geGVfaXB2ZXJfY2FjaGVfbG9v
a3VwKGRldmlkKTsNCnhlX2lwdmVyX2NhY2hlX2xvb2t1cCgpIGlzIG9ubHkgYSBtYXAgbG9va3Vw
LiBJZiBhIGdpdmVuIGJ1aWxkKGk5MTUgb25seSB0b29scyBhbmQgdGVzdHMpIGRvZXNu4oCZdCBs
aW5rIGluIHhlX3F1ZXJ5LmMsIHRoZSB3ZWFrIHN0dWIgcmV0dXJucyBOVUxMIGFuZCBpbnRlbF9n
ZXRfZGV2aWNlX2luZm8oKSB3aWxsIG5vdCBnbyB0byB0aGUgaWYgKGNhY2hlLT5ncmFwaGljc192
ZXIgPj0gMjApIHsgLi4ufSBwYXJ0IGluIHRoZSBpbnRlbF9nZXRfZGV2aWNlX2luZm8oKSBmdW5j
dGlvbiBzbyB3ZSBzdGlsbCBtYWtlIHRoZSBjb2RlIGNvbXBhdGlibGUgd2l0aCBpOTE1IGRldmlj
ZXMuDQoNCj4gPiArCQlpZiAoaXB2ZXIgJiYgaXB2ZXItPmRldmlkID09IGRldmlkKSB7DQo+ID4g
KwkJCW1lbWNweSgmeGVfZGV2X2luZm8sIGNhY2hlLCBzaXplb2Yoc3RydWN0DQo+IGludGVsX2Rl
dmljZV9pbmZvKSk7DQo+ID4gKwkJCXhlX2Rldl9pbmZvLmdyYXBoaWNzX3ZlciA9IGlwdmVyLT5n
cmFwaGljc192ZXI7DQo+ID4gKwkJCXhlX2Rldl9pbmZvLmdyYXBoaWNzX3JlbCA9IGlwdmVyLT5n
cmFwaGljc19yZWw7DQo+ID4gKwkJCWNhY2hlID0gJnhlX2Rldl9pbmZvOw0KPiA+ICsJCX0gZWxz
ZSB7DQo+ID4gKwkJCWNhY2hlZF9kZXZpZCA9IDA7DQpUaGlzIGZ1bmN0aW9uIHdpbGwgYmUgY2Fs
bGVkIGJlZm9yZSB0aGUgZHJtX29wZW5fZHJpdmVyKCkgc28gd2Ugc2hvdWxkIHJlbW92ZSB0aGUg
Y2FjaGUgaGVyZS4NCmNvZGVuYW1lX2ludGVsKCkgIGlzIGNhbGxpbmcgaW50ZWxfZ2V0X2Rldmlj
ZV9pbmZvKCkgYXQgdmVyeSBlYXJseSB0aW1lIGluIGlndF9kZXZpY2Vfc2Nhbi5jDQo+ID4gKwkJ
fQ0KPiA+ICsJfQ0KPiA+ICBvdXQ6DQo+ID4gIAlyZXR1cm4gY2FjaGU7DQo+ID4gIH0NCj4gPiAt
LQ0KPiA+IDIuNDMuMA0KPiA+DQo=
