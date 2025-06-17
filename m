Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D3AC71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 15:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1973E10E061;
	Tue, 17 Jun 2025 15:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNXNyyfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC5610E061
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750175471; x=1781711471;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zub8bhj1fCQaZWO4tU6kXaJo6H2xRyRyp8pF9v6FHnI=;
 b=BNXNyyfaJLftJuBDN/5t04FStViB/K2UR1UiRwTE4mq7J/jRMCDphOeS
 2UZotsfnf6EnNVE3OabF+KxnbeEFXttV2y6jZ/1ShoXMm5QrLBCnclIa/
 psCjTCVLf76ZaIjEYHIdmn3cNe3+fVkRwQYH8c3ZmM90Kj1i6URIRd1Xk
 78iWWCo8UOjm6BiyDJ9mbIf/nAFHXsFJwbf472StBgUffU5Q0DgFpwm6f
 rrJXArECG9Y1bj+eMv3EiepGYyYQ74Ed8FpvIdysG3wmiBQ8Uz8XQadlr
 HD5BMAAQZVe2QO8OpUZi/pR1un2j+IuNsRZD6PHdkm4be1gylWpUMZhu4 Q==;
X-CSE-ConnectionGUID: Rm1yqoLQR3KYLh3B/ajv0w==
X-CSE-MsgGUID: PI8SSPDaQXG+UwSonGVsAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56039023"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="56039023"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:51:10 -0700
X-CSE-ConnectionGUID: /+RKtIlFSuykLSidD2cXGA==
X-CSE-MsgGUID: PMRv/t5EQSG5n1yeuQfPVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148804590"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:51:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 08:51:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 08:51:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.43)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 08:51:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tu5/KruwW0SJb0V11WvR/nr6qPGVoDIBVCcAmINvGjcoaIy/Q84OEqXXFC27WYwrtkxgZO6zEvpF5IAPR3/h55N2+51E/1IzANUpu/nwEAjsqKYef5Jod7UF0+4eKxpd9qXRngKC5wJgoi/exuPFgvyQmI/ZNNM0JThymhX8B5ez1PlWn0F6awj5c+aUbdDsGZgOnYpn2d7BBRws2v5lCLs4w9cIkYB+JZ4BjEg83LVwEJTTV15bqeL5u5feNyoX+IoeEo9hz4ttFivxARHJL0pL2YCYeMahtpjBJywzCTFPM+5wqo1kxk2wo3WstZjjeIhR/JMqG4lOgCHwL0yaxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkmEFdvtnwYZLi1DBURCZKelBcJ3HRHbgNQTb32Q1dE=;
 b=bwy6vM4EPAjZzbEnzYpcAfPK18oAmOehC416sn2fuYz/vueY2LKgTpzkrnTcXKF4iHzvFs2iNQjlRWgkE1/dpZur5mK3WXZZZfcWfllWX+jVykWt5vU4PN4KJz5tHP+XpfNheTezhWxOGXvO0q282BJ/riIiJYgeO0mKKHt2T+vDWOpEQd1FtBtYpUB3Wo29M0MS5q0x6SZL5dreU92D12+kKDVQec+tI/iB67TbtjNiX6xyIbWDJHXIrk8cdCj9Hkj3c6cd50aheGWKNEWB58bLpO3KCGhAEO/6IgukqaV5byQ7d4BACGKyi1PGtD4Ju0Q/cbdBphzecdRfBr+n4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by MN2PR11MB4662.namprd11.prod.outlook.com
 (2603:10b6:208:263::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Tue, 17 Jun
 2025 15:51:05 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 15:51:05 +0000
Message-ID: <2ef8b50a-2e71-4b97-bc8c-38e4f093edb0@intel.com>
Date: Tue, 17 Jun 2025 17:50:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] lib/tests/igt_assert: use volatile cast in igt_assert
To: <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>, Petri Latvala <adrinael@adrinael.net>
References: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
 <20250617-bump_fedora_to_42-v1-2-d04e6a0455fd@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250617-bump_fedora_to_42-v1-2-d04e6a0455fd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:802:16::25) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|MN2PR11MB4662:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd2bb3d-c9fb-4a38-69f1-08ddadb6c46d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzRvbHVNeXFxN2lxSjF0MTN2QXV2ZitjWDFSaS9JUHdXZXl6VGhsNWJGajk1?=
 =?utf-8?B?S3V0UTJXVlRkTW9LVHJoTTY1S0w4dCtRMTltVnNIbXZ0aUI0UHBPczludHVq?=
 =?utf-8?B?S0VvcFZwVlJwdjNQOU0rcGRjaGRxdTZkWWt3bEdQajQ5ZWpEYlZ1dVlyYjlN?=
 =?utf-8?B?Y0FoU0RaQWpkZGFkN2ZJU2JvYjIybytiTnRrRlhyZ0N3MTJhaUt6aWVjYlFN?=
 =?utf-8?B?dWpWN0I3SEorS1FpOTdPS0F4cG85bFhVVDA0ZkNRRDNmOVNEV0xBem50ZlFD?=
 =?utf-8?B?QmRmcjRORkQvQzFUay9sWVlaT21IWE0vcTJlY0ppdU8zTGl1WTIyS0wvNjRh?=
 =?utf-8?B?Um1FNFRZeHVaTzNIa0ZIY1N4M0Y2QnRKQlJBOFBFNlFpZjRyUm13NEdnWitB?=
 =?utf-8?B?ZmhOYWVPTjB0MFhuTlJvOVV2VW9MakxRWDhrZnlRRk5GMmxkRmdZV250czRB?=
 =?utf-8?B?SFlXbVZuOWNEYncxZVVGdDRVOXd2QWFQTXdJaVZCVUpCYnpTbFhXS25qOUVE?=
 =?utf-8?B?aDdXc3Jpek5aK21BM2hMT0V6ME9reDdvR29DOFoxYXBqWDh1MEp2NzE4NzYy?=
 =?utf-8?B?eGZEclg2cGFMVG5pSnhlRkdiR1ZHWlg4dFEzM2ppeVVaMWJoaHdCdjdjTk9y?=
 =?utf-8?B?Y3dBNm5lNit0d3BTL0FSZVJKT2F0SmVqSy85eFZqZXo2MHFEaE1ETTVhRTJy?=
 =?utf-8?B?OWs4ckdnRXhlS3JtQnlkZzRzUE4wTm9HTnZsTkl6SWdsQi9NTFVNQjlodjFF?=
 =?utf-8?B?Y29ydGdsdGk4NHNJZTVPdGVHWTcrZ0Njak5RK1c3d01xYmU3VUQrTkFGVVF5?=
 =?utf-8?B?NEtyZUdxNHI5bENtaUxTdlYvZkJPaHgvam5tZkYrVGp4UXUrNzNkRWM1Mnk4?=
 =?utf-8?B?QkJCMTFaY1Q2eStYdzEzODN3K010VWN6NmJ0UEQrZXJDdXpUV0psNmRlcVR5?=
 =?utf-8?B?U3RIaFMxNnJCaVpYb3lvL2l6ZEhhd0tvNlpGbnkyTG1qcWErL3cvM2Z3b2dO?=
 =?utf-8?B?Q1hwejNMYlBPb2xHRmFoOGp0VGMwZUVQaFU5STB4YTB2bm5GUDhVMEE5dFFx?=
 =?utf-8?B?Vk9JWjB5NUhQd1hKclVyVitpNDJjdktlUW5XT3BPWW8vbUJhaDhrT1djazlI?=
 =?utf-8?B?b0RIZDdKQTUxSUkzd2tvd0RUK3ROd2pZOGJmMWllKzBUelNRdlJZQkRuOGdR?=
 =?utf-8?B?WWdtOU1BSHZPZlZuc1lGM1VXM1FwTUozZVVzWmJXRXZqV3A4NU5XMW1VUUhh?=
 =?utf-8?B?ODJWNkJlVk10V3hDQm5LSTRid1gwcWZYemhwZW9vL2QxdmRleXNOQzJ0TElE?=
 =?utf-8?B?MVR5bmVlUnZ1WmRDTmRZNlQ0eHMxbjYxdXh2RnREYys5SHkzZTU1TnRVUGZY?=
 =?utf-8?B?VENNaktaYzJEbWhLS3YvNks3d1NGQW1RUklwOU0wSUhTTHV4eENkbXUwV29C?=
 =?utf-8?B?S3BaVjVqU3kxREJkcTV4amxTeTRxSjNFblF2VE8rM0FYMXJ1ZkJTTENWS0dW?=
 =?utf-8?B?V0lnR0o2cC9TdTRZUzdFV09xeHNBd0lWZ1lBUUhwblZKYVowd00rejRUdWpt?=
 =?utf-8?B?Y29JOGxiYlAreTZna05ja2JQNWpXWWtKdjlMc3ZmR2Z3MXpLVnhIMlVUaTg3?=
 =?utf-8?B?MXNJL0w0bU5SNWxlSDIvai9CWnZvMDFyblhNZHd0MzhDaDZIdGxockJsbFgx?=
 =?utf-8?B?dHdTRC8wM1RSTXZDdTV1VEVnVkZBMXVPVzdBdUd1NlJubGl1UjFIYTNSV1lj?=
 =?utf-8?B?cG0xSGI5YzB6THN0UjU4N1M0SzczeXAvQ3BxV3c0VHNYdkVxbXZEY3g3Rjl6?=
 =?utf-8?B?QmZhZU1zQk5HRXRGcU03WUxkNmJFTjVoSndUZmkySS9GUkIvRzNtTVE4MEdK?=
 =?utf-8?B?UkVZQm42dzFSOVJoMzFZbnN2bFFubmRuYTJ1Wk9jUjJyK3diZWV1WDUxSGtF?=
 =?utf-8?Q?TUL8ZGrI6UI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk1EQzNsZm9EZUliU0tuNXlIa0Fia2hWSUE4SzM4MU0xc1RSa3RWN0hXdWlS?=
 =?utf-8?B?VTluSnAxanpLS2dWcHRVZDd4UWlDSlE2S2Z6SEcrY1MveGdaY0U1L0llVEJJ?=
 =?utf-8?B?Vm13ZTZlWXFpczVmUHJ3VWpMM0JwM2RyUW9MNUdRR0h3YjFMSy9Rd3l3WHIr?=
 =?utf-8?B?a0xFTjhBWkVBaEdtNnhsWXVLNUdqTkgreGMvT2lQa2dpamFLdmZIM2pxUG9M?=
 =?utf-8?B?TUtZRFo3VFlvZEo0amJJZkpNNUhyQzBzWmdCaUY3dFM2NFQvTG12c0dwS2tH?=
 =?utf-8?B?elhLQ1NvV3lTMUQxbjhoK3cwTkRSd0lZOFNBdW5rajBCd1VCVTBRSUVEY1Vv?=
 =?utf-8?B?N0krcnMycXAzcWVFVTZuNXh2dHpQK0EyNm5rSWhyV3VFcjBMZlJaUXVTODBO?=
 =?utf-8?B?N3F0Nmo0RFRha2M2YWpIY3RSL2l3MVkxYUlPdCthSTMwc3RCR1VNUDdRRjZp?=
 =?utf-8?B?ZnkzVVVuUXd4eUNEdjhlYjVCTHRVYmI2VzV2VXFIY0d1YWFwaG9LOTFXaUx6?=
 =?utf-8?B?ckxTdHpUZzdUUHNWVDNGVGdKZCs2azVab1BOdGJRaVdBbzhuQm9MZGpOV0Yv?=
 =?utf-8?B?NnZPV08vTFk4UUtoYldqRzF4UGdTMW45bm44RVlXQ3RlY3VSemdPRjByMnNu?=
 =?utf-8?B?SFBlZnFNa2hUYVJZRzdxOTRPVHExL2pVS0w4NmRtZ2NLOG9Ldm42MXpOSWIr?=
 =?utf-8?B?anlQdUdSQmZHNVptaEdUakN4VGhpU2EreWZmYkNNUWxoaXpwTWoyeGUwbTVz?=
 =?utf-8?B?Ny9XQSs3NWQxYzZMS3M0NGNCQkRUenRDTU9oSVNXQ0lNRE80YXZ1YTY5TXFJ?=
 =?utf-8?B?bXlUVnRyOWlwaE42YzBoeHFWMStzdFFZQ0c1dHBZTjJPVnoveW1BcmVZTkFy?=
 =?utf-8?B?amt2alNRd0VPLzZXM0RPTERNUzJrT0o5eFJXN0tNU3JhNkNRSWdSR2R6OUVX?=
 =?utf-8?B?Z01nUDVXZjl2QUt0RWtwMG1Wa1BqTk9jVHRySm5mc3JZTzZNNlg1MEFXQ2pi?=
 =?utf-8?B?NVF6T0JWWllqYlNoUkp2cnJ0QTFUQ3JHMlBwUFBxNGtpMHc5NlZNalRPUVlh?=
 =?utf-8?B?cElwcFpNMVdyaTgvbTc2TG9aZG9JVjAzejR5WE84RjNKUDhVSFArK2VwbC9S?=
 =?utf-8?B?WHc2TnluUzJTNTMxU1Z3TU45R3RMV204Ky9PMHpaVGZ5eGZmQ0ZDSGF6c1k3?=
 =?utf-8?B?RmdHUFQrazRZcHNmQnJSclNrOFVCMHhOSXhyNVBTUnJQV2o5bmovRjhBTUhD?=
 =?utf-8?B?UklJcFl2cFVaVjAvVHFLcjdNbzdHOFYzVGlCbkVZQklBeU53YXh4R2doUWVV?=
 =?utf-8?B?WlFJM3YrVEpMaE5SYkV0anBJYkZsSURLaE11OGpib3FlaHJwSkhnZ1psaU9N?=
 =?utf-8?B?c0w3VHJnbE1IM0Jzd1FTTHVEUkZKTVk0STE0MzNZSUd3NWdiVTMvKytINkQ4?=
 =?utf-8?B?TXIyQmFvQWpPUmVpR2d4ek1pSldLYmVSMkRnVUtHYjEvN2NSc2tNQk1Nejlx?=
 =?utf-8?B?VmUyWm0yNlVreldNeXowUXJ6UU5MenlMaC9jeldMQml4K2pTUzhjNVJYYkk4?=
 =?utf-8?B?cGZVMGRsZUlSQ2tMcG9kNkhSeVBTc0xrdENnZ0lxMElSRXBJbEJUMlEvR2Fk?=
 =?utf-8?B?U0ZUTWFJS01rY1U1aDNNS3Q1VzYzam15bEJQL2Jyam92RFUwYnV1SlpDUDQ2?=
 =?utf-8?B?ZmxyZVhsZHhuVzdTWjhrWlVhUjVWOG5XbERsc2dIdENWVFBhRG92R3h5Z2VF?=
 =?utf-8?B?MlUvc1hkMHlOUjZ4UzZmbG15NWxmWFQ1UFpaNm9kMmpna1FEbzFzV3Z2OEJi?=
 =?utf-8?B?SUJPY2JzVXpYbjVmcE1NZXhseFVPUWVBU1ZqMXljQ0RwNzVEblpDUmZHMEgw?=
 =?utf-8?B?K0hFaEdKYUhtU2UrNkw2WkRRTUtWLzRlYlV5QmtjOEJKSnZDY0thcEFGajhm?=
 =?utf-8?B?NTlTalZjTE1lV3NwbDhFUVVUemw3YU4zTWxDWlJSWC8vaDJWUlB1Z1BSOVVP?=
 =?utf-8?B?d2U1NEl1UUc3d0JNRDZicGYzVnlOSlpjVkFXLzdIbWlUQ0FTZ2dzUit3RjJn?=
 =?utf-8?B?LzVRS3pvZmlNQnZQNTJzR1Buakdud1pNckdPTFVndDE3djZsVjlZOTZZdVBo?=
 =?utf-8?Q?l/gEcxtgMmSr5+k6RUYKFpcZf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd2bb3d-c9fb-4a38-69f1-08ddadb6c46d
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 15:51:04.9281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPnORDF5eof6FSb5Z6b19clHFV2ckuHJOXJ4WTOsOY1MlbeFPcoahh0jR/iW11LF9YV4urkyACLjE1Zbr1f3yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4662
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


W dniu 17.06.2025 o 16:05, Andrzej Hajda pisze:
> Newer versions of clang optimize code more aggresively.
> As a result change of variable in subtest is observed
> by caller only if it is cast to volatile.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>


Could be added to description (justification):

According to longjmp specification non-volatile local variables can be 
optimised into registers and longjmp can replace them with other values.


Regards

Andrzej


> ---
>   lib/tests/igt_assert.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/tests/igt_assert.c b/lib/tests/igt_assert.c
> index 3523a46494822cd42f63047c0b5bbb5b39343c84..10c08f9860bb77faa35e4dd46e19d69c94897a7f 100644
> --- a/lib/tests/igt_assert.c
> +++ b/lib/tests/igt_assert.c
> @@ -46,7 +46,7 @@ void (*test_to_run)(void) = NULL;
>    */
>   #define CHECK_NEG(x) { \
>   	igt_subtest_f("XFAIL_simple_%d", __LINE__) { \
> -		(*exec_before)++; \
> +		(*(volatile int *)(exec_before))++; \
>   		x; \
>   		raise(SIGBUS); \
>   	} \
>
