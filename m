Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4E4C98315
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 05:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBA210E361;
	Mon, 19 Jan 2026 05:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYxSIiXm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9435010E35D
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 05:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768800397; x=1800336397;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9KCcv3X5Ud2chQF4TbkZpt/4MKpFQmQ4fnux64sSwLw=;
 b=AYxSIiXm0g0rKWL21FelK5fNvsY9mS0m+Wh6T0Aryw3cXTlX82j6uDpk
 gdqiOuwJVDUs6QsxY5ZusLUakBsnI4U9xJYQAPEYVHFx78fWRT2wifksS
 tYBJIFjf8wnLlAamPScI4e8KiQO3IimWa48B8mQPWpaso//0oDZzeBxnG
 GBZO22uvLwppSI6F9LfRqlzdcpISFkbv46PAmxXSEwsqxQYTcrFd/FOsX
 ny8EowqMCyPqxStD7hBcpnwBIz96g8yfTZ9kl1AH5ggQ/t3tc7B13hTSn
 JYgWes8yWEsL3UdzDBa4uBnZ0ycJHlQ83+3ctPL5YOh+necxbb5Q4Rmc5 g==;
X-CSE-ConnectionGUID: Y+ecn+anTGyarwEZF67jsQ==
X-CSE-MsgGUID: t5YLpO0ySIeReCCxzhz4qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70058293"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="70058293"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:26:37 -0800
X-CSE-ConnectionGUID: jfhiLMYERS+u4ED42zOxdQ==
X-CSE-MsgGUID: d0uL+WHWRb6fIVKDuWQNeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210258728"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:26:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 21:26:36 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 21:26:36 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:26:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtMchpkkcEZt0Dk8ts6npFWV8exCjsBRi/aSxWDfEY8n57hbJQ3wUohs3tVKg00EagqwExGqKPWugqhx8xBKMsfZIxFtfGfM1W9Su4CaDsOfcB8dedo2q+OqyErulA0i6sjm4OzmZ88Cxhqvl4tQfgpSU/5hN7EfkOYt1GAugDf9Fv4wX+RYHbqRYEqQlZzhERJJXhOnXTdwaFeonOS0mQXddXtYVffa4uz2Og2IM/8RhKdPnrZ6hSzo1luTIkm5FNc2TGkRsoYpgWTFgHjXXMqU6lmeDVYDk8L6ze+PLPS8oVIXfST+qZDnmIhFYsaAda0UUDTEMHjVvWgEXCFLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KCcv3X5Ud2chQF4TbkZpt/4MKpFQmQ4fnux64sSwLw=;
 b=mxHoWACG3cRZUw1XcC9FWRmEfZ539y/XJd7Eg2je6K+eWjkkjwOp0ZZhp4pAYR5o2boYcoW5D2WmAjDrypcHiVW0qNQ7ftHknqOMFyQVz+l7QGzUO6n4pc91ZZ21aMDSg9wKiF5roLCjPwisDCc+2Vvw8CkulUg7OPfkgfKqSyICmHMbny8QDOjfROLJbJlMphufnUAZClvmdZcqIsM6mINiIAADOkFD8OPNtaUJNVK/Il5yGZOvuuBKlluZIw3vSXcJLTu7rJ+8sTrZcmRw1lmk87nOHR/zYuNabypq180PiArWTKOJ+o2B6AHIkK04IU75ocTNVR7fS/+Qs+yECw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 05:26:34 +0000
Received: from MN0PR11MB6301.namprd11.prod.outlook.com
 ([fe80::8c36:87a9:34d4:6271]) by MN0PR11MB6301.namprd11.prod.outlook.com
 ([fe80::8c36:87a9:34d4:6271%5]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 05:26:34 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: =?utf-8?B?UkU6IFtQQVRDSCBpLWctdCB2MSAxLzNdIHRlc3RzL2ttc19wbGFuZTogU3Bs?=
 =?utf-8?B?aXQgcGl4ZWzigJFmb3JtYXQgdmFsaWRhdGlvbiBpbnRvIG1vZGlmaWVyIHNw?=
 =?utf-8?Q?ecific?=
Thread-Topic: =?utf-8?B?W1BBVENIIGktZy10IHYxIDEvM10gdGVzdHMva21zX3BsYW5lOiBTcGxpdCBw?=
 =?utf-8?B?aXhlbOKAkWZvcm1hdCB2YWxpZGF0aW9uIGludG8gbW9kaWZpZXIgc3BlY2lm?=
 =?utf-8?Q?ic?=
Thread-Index: AQHch+EnXrwI/z1LM0mRHDVJ3zOGM7VY9x7w
Date: Mon, 19 Jan 2026 05:26:34 +0000
Message-ID: <MN0PR11MB6301B18D108D000D01105A3C9088A@MN0PR11MB6301.namprd11.prod.outlook.com>
References: <20260117184348.38163-1-ramanaidu.naladala@intel.com>
 <20260117184348.38163-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20260117184348.38163-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6301:EE_|DS7PR11MB6127:EE_
x-ms-office365-filtering-correlation-id: 3da4ad8d-2346-4af2-6d33-08de571b4fa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MmVHakNIVW10RldINXNaUE5nQjVablFYV202RW84b0FqcTFrOUpTOExVNVZB?=
 =?utf-8?B?dEVMRFlLZ0x2V293N2tkVS9WNXAxeG8veVM0eXhYMWZMdGZKTHhLand0aWpm?=
 =?utf-8?B?NUFyRnVZTE1TVE5ZdXRtUHd0NmxmUEMzRHFWREgwMkdON3pHRW00eTEwWU5P?=
 =?utf-8?B?Vmpsc0hUR2gwZHV5QWNjZWZVbDcwOFZGUG54OXFlUytmSGxIa1RscGJvUFhi?=
 =?utf-8?B?dks3V1ZGNzZ4NktZWTg1UmFvQjdSNUdLVmlBcW1YbEt4ZmNGVlZSQUxpbUZK?=
 =?utf-8?B?MEhYVUtnaXl3Z2VuaWlaNGdNWnJKV2VubGk1R05kUnQ0Yk10Uk9EeTRKU0Rv?=
 =?utf-8?B?b1hncm51cnB1dEtNSmxjTC9TQmhCS3FJWVd2R1U3SzdvNi82azVvV1pxaDQ0?=
 =?utf-8?B?WGh2TmJtT1RsZldQTERObnJxK1UxbDFyZUNRNE9SYWxSQzljQnJnQkEvbldT?=
 =?utf-8?B?bklMQ3l5cjJNVzI4Y0FVZHJMY0NGaXB2OHlPZnppQ0szQjhjMGVVMzhESXZx?=
 =?utf-8?B?bGRWL21PVHkzc3NFZ0RmSEFNMFFUWVBxQlJWTGdDU1BVWUt2ODlSQXhvQ1JV?=
 =?utf-8?B?OXJWMXQrZXJmUkJLQzhVWjdEaUNkOVhvVVBCa0ZBN0Izb1BLMWhYMVA4WjlZ?=
 =?utf-8?B?VG5nOXdIdGxSejlYS2tkdkhLRW8vQllEYU1iNkM2NHRLK24zY1EwakRVZXpK?=
 =?utf-8?B?a3RLWTRmR0pUUEsyWkJodHNFVjN3ekRXUDFlcm41YVozdG9ReEVLYTA2aEFo?=
 =?utf-8?B?Sk4vWmVmT1EvcktscjJzQngvU0p4QmVMR1hwOXhHaHR3Rm00ZmxWMG1YeTJ3?=
 =?utf-8?B?VXRQdWtuRE96UU0wejRDWElEbHVpK05GTEtxT2ZDc3BHSEJGYjRIVGJaTGtZ?=
 =?utf-8?B?WDhKcVVnVjM4R2dxdXBTZ2Z4ZXdPTkhXU1c5SGloWGxEdEVlUkU4MjRQb1Rp?=
 =?utf-8?B?aDlsK2pnWG5qRGl5V0NKQ0dPbjVIZTR1SnBRYm0rWSs1bXphMlFiVVp5SFNm?=
 =?utf-8?B?OEpnY05NRERvNjNIS1VCVlNtZ1lkajZjMFNCQ1BHeWhGT3owLytxV0pPQWhy?=
 =?utf-8?B?dXU1N2lQZjNlakJJQlJFTUM1eXdkT1pmdVIrNFQyTDRQQ1FxeGpTRTJMOUdl?=
 =?utf-8?B?ellsNWNsQUtvczNhdllRWUp0VXlveUZON0F2L3Q0dXVtWDhRdldIeDd2Z1Jl?=
 =?utf-8?B?Z1RGazBOb01wTGU5QTg0WGIyb1F3cVQ4ZHNUZHAwdXpRSlhKUDI2bnZUVUhG?=
 =?utf-8?B?SlFadDRLKzNEQk9La2pEd21OZFk1VWRPQWJBenJNWFY4R2ZTTnhaZW5xWFgv?=
 =?utf-8?B?c3lWcDVoVGNnUDBzZGJHTW1rTFY4R0xXTGlaeGIxYlpxc2FOb05GVHJsMVZS?=
 =?utf-8?B?TElzcEk2S3FKc2tEb2ZiT1RMUTF3UmJ3dUhKNkJRSWlPN0tBcFl2VjFEemYx?=
 =?utf-8?B?YzJqY1RGWURFTVIxY3B4WlpZbzZTOFUrU29WbzQ2dnplNDZIbXJoNEtjYTkv?=
 =?utf-8?B?cUFwMmpRNlFCYjAzRFR5alpVZm5JT0pjV29rQWVMRTcyYnY1TjRXSkVXbmwx?=
 =?utf-8?B?clRRR1JtQVFmVFFZaHZKeUlqVmZEbWVLT3NPU3lNUlhIRzcxNVZWOVcySm5I?=
 =?utf-8?B?dUJPdFRaNTladXRlS1hjUjRrbno3R1liVjNnQ0h6dW1PL1NqRHZ0NWp4V0ZU?=
 =?utf-8?B?Szk0ZHdqRi9vSzdqV1ZNUzBrejFyRnRwd1pXc3JOdmtLQ2gwdmVXUmE1T3Bs?=
 =?utf-8?B?TFZkOUhFcHNHTEdjUUc2blRnNDF5bU9qYTYwRnQzQXhFaTJ1THpuZG82RWll?=
 =?utf-8?B?MVF1bmlwYmVGOHZTcldrZk1rcDJKUmNnZ2VRd3VXMHJ6bzA0cDU1ME94SlB4?=
 =?utf-8?B?bkRBenJsZWpjTlRjd1V4emNMT2V0UEdubHBSMnZwV2lTU0tpN0NwL0tCMVRp?=
 =?utf-8?B?RmlJck1KdytFRlFEVVMzMkRmamFiRjVuYWVFQTY1MEhJV3Q0NUZHTnIzZDRs?=
 =?utf-8?B?dkVIZ2NyMEJ3TjhCZmY5bzQwVml0b1h4RHZxZVU1ODludGx4VlhjRDFzcTZv?=
 =?utf-8?B?QXgyeXFxWEhyTXpHM2NvTmo0dHhrNGh4ODFLbTJ4WkIxNjhaR2JJajlGOXNM?=
 =?utf-8?B?WGhTeE9ZT1o5dDN0NDdxa0kyZjhsNFJoVlhyN2Jobm9pUnFDWTZpbDhZdGtr?=
 =?utf-8?Q?BHdNuYEZRNYFrd5CAglNPKc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6301.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXhOUytnRERwN0pteUhKN0V0cEo0ZUp2QjhWcWt5YVRrVDFHeWJUcjhTR29P?=
 =?utf-8?B?WWhWZEYzVW1iNXpvaElickdDWWJrUEk0Z2JyUUt2UE1rWFZTbWd6UEZ6cmR6?=
 =?utf-8?B?ZXI4SUlSNzd0cG1taVZCOWVGSE5qaStXYnBhNUQ1Wk5hTy90YldaTjluNGN1?=
 =?utf-8?B?ZTdoelRxd090Q0tZVUNpZmxOcmRPcEZrMGdRVEp2aGNEMTBXcWtrQnVCeEh3?=
 =?utf-8?B?cWRNZDg2dzhMMU1xeWZJaitpVEtBVXMvV1BXSitXSDI4SkNCdHFmSldmK016?=
 =?utf-8?B?aXIyNTRNSnB0KzUwTGFmNTYrOFVuMVgwcHBNYVNKOWhsOWNYMjZKQlY5QkNF?=
 =?utf-8?B?emZQVUtjZGlBRmF3czFrSDNmOUpVMHFTdWhUNGRXWmx3RjdJQklrUEtkUG9H?=
 =?utf-8?B?aGU4YUlCSy9tU1dtTjRYSndEUXBncmxNaXVxTjY3QU9aa2ZlaWZaY3pwMlZP?=
 =?utf-8?B?U0w0L2ZlUzZiVXhhU1hablpYWUVQWkQ4M1ZjN1BXQkI1enE0dy91bGt0c1Zp?=
 =?utf-8?B?NmdCTDN4cU4xMzNrNE00N3l6U3ZnYjBLZjlhUzZCNGFaZkV1ejc2L2F5eHNK?=
 =?utf-8?B?Rk5kVmpyRXFUcFpLalBOWGtMQWJ5L0xyRURQUzAxY3R0RGhiM3lBTzhpTDYv?=
 =?utf-8?B?VDQzeFdkSm9yQVc4WW1Sa2tSR3FQVmpqUzdqVnNidStOWTBIelFudDJIYS84?=
 =?utf-8?B?MzQrZVZBN0t3V0o1NGk2SWVGVEhzTG1BVzNmc056ejQ0c3BabzVMTXdUd21v?=
 =?utf-8?B?YkxzZURmUi92Wk55UVFDZC9tbkh4Z080SmNSVStyZ3ZYWlMwdUpDUFBIQkRX?=
 =?utf-8?B?SHgyQlhrVzJ0OS9YbUdTZHlmYUM1VUhZYXBndzcxNlpqeFg0a0lWOFViMVh1?=
 =?utf-8?B?bEs3azQwMzRqRkZ3bnJ6RW9jOUxPSGdNaXBndHJKN3VRNUdoZGhWS0xMd2Mv?=
 =?utf-8?B?RTA3TDY1NW1yVFBVVmMrZmNjKzEreVJWRy9GMWRBZndHUkN6OVphWjRma0hY?=
 =?utf-8?B?L1ZBRjlvOWIyOUVGUUY0WWlRMlZ3UDE2clNyRnVmaXFpY20vYTNVVm4vbWh5?=
 =?utf-8?B?YnkzdHAyUVZYb0s0dHdLVnJRNHo2aW9qdHJldGl5cm5VeWtnWUZzTnU4dXRm?=
 =?utf-8?B?U3JZN01Mam53MlViaHN1aUdCUWptbEE5bXJYTnA5SVNQTU9Jckh3SEpHckYy?=
 =?utf-8?B?TDVYRkJaeXF5VUFtSWNrcW1aQWc0dU54bGN5TjluT0szVi9heWtGMVNyczk3?=
 =?utf-8?B?UHhrcXAzZk5wcWJWMENueHhCZnVrZ05maVhZOC9uNzJWL3ZkcEpOR3owSGRy?=
 =?utf-8?B?VlNHREtudGhld01oSmxJTlZZbnMwMG4yN3VSK2s0VmptMDBCWHR6ck1yZHVy?=
 =?utf-8?B?RlJjMWJYZTlWaE9HREFZdGpnajU2bGdkdDlHc3A3MUltRk1iRzQvSHhvQmJK?=
 =?utf-8?B?SzlrY2NMWVRPSTRMbnpacDRDa1hSNldZMmhLT3BGN1JENDN6L0dtdjBQNXRk?=
 =?utf-8?B?RFVEYlBGdjNYby9JY0xsUko2YkdBQ2VHR0hQdHdiMk9tR2ZKbjRSeHZJS0F5?=
 =?utf-8?B?Qm1yUXl4c1JnakRaczZ6VDFLT3JUNlZmb2FZWkhvTEdReVRsaW0rUlZZb00r?=
 =?utf-8?B?d0NtaEEveDBONDBvaWFCYnZySmIwOWhwZ0M4SlNROTdvdFJ4bU9jTVpITWRq?=
 =?utf-8?B?RmU5bXpRVGljYzJsM0hGQjRseWJXYWVrNm5FVnhpaGpwMVEzQUNJNUkyY2hQ?=
 =?utf-8?B?SzZvRG1FK2lpYTJndHovYnhPVXhnS3RmN1hhU0hEUHlibFkwNE04eE9MeFVq?=
 =?utf-8?B?OHhqYy81SyttNTVsbE5ZOUdObDBrYmlZQ01JWkZURXlFS0lPdHV2RVZUb0Vw?=
 =?utf-8?B?cFlYYkNIL2U4Z0pJZk1kdm5sMDlpMk9lcHNZczdick9JQ0FNYUJhdll5ZGVR?=
 =?utf-8?B?WFJ1cjFsc0M4MXJZMy9CVStjTnNWWkU3dTFSRFJ0V25jUXM5VkJqZlg3djFP?=
 =?utf-8?B?T3JqYUhTVEZZUmpjck9xSWlNUGVOSDRuMzNPakFkWWh5aWhLN3FsK1BQQ256?=
 =?utf-8?B?SHdpUmdhbExReUdPN1FKa0Rpc2kvT04yenFUR05XVEF2MXlaMldHSnhIME5k?=
 =?utf-8?B?Nm5qWVdaUjRoWGdMSDNSMi90ckdXR2lJY3VvSGNJOEUyUFZDbVZ4YWd2cGFN?=
 =?utf-8?B?SERJWHZzR1lDUy9VMDhYeEVGMVhTb081ZGdJR080d3F4SnpnMUV0cWJlRUNx?=
 =?utf-8?B?dklJNXJuUnYrZWNCakdQYXhBUnN1bzJWNmxpNjVWVjgvNWhhMnJaU0JiSWx6?=
 =?utf-8?Q?8t2OgAuCI7hKNHvuRL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6301.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da4ad8d-2346-4af2-6d33-08de571b4fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 05:26:34.4847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Vrwoow6oOFlAayd359+awCvcymnKQSKjuQxNVTXkL0z5jPxJ2QQg9e/NZ7aQVLDf2UXEh9+aaM5vpWarqgnzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTmFsYWRhbGENCj4gUmFt
YW5haWR1DQo+IFNlbnQ6IFN1bmRheSwgSmFudWFyeSAxOCwgMjAyNiAxMjoxNCBBTQ0KPiBUbzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEhlaWtraWxhLCBKdWhhLXBla2th
IDxqdWhhLXBla2thLmhlaWtraWxhQGludGVsLmNvbT47IFNoYXJtYSwgU3dhdGkyDQo+IDxzd2F0
aTIuc2hhcm1hQGludGVsLmNvbT47IE5hbGFkYWxhLCBSYW1hbmFpZHUNCj4gPHJhbWFuYWlkdS5u
YWxhZGFsYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MSAxLzNdIHRlc3Rz
L2ttc19wbGFuZTogU3BsaXQgcGl4ZWweZm9ybWF0IHZhbGlkYXRpb24NCj4gaW50byBtb2RpZmll
ciBzcGVjaWZpYw0KPiANCj4gQ2hhbmdlIHJlc3RydWN0dXJlcyB0aGUgcGl4ZWwtZm9ybWF0IHRl
c3QgZmxvdyBzbyB0aGF0IGVhY2ggbW9kaWZpZXIgaXMNCj4gdmFsaWRhdGVkIHRocm91Z2ggaXRz
IG93biBkeW5hbWljIHN1YnRlc3QuDQo+IFByZXZpb3VzbHksIGFsbCBzdXBwb3J0ZWQgbW9kaWZp
ZXJzIHdlcmUgZXhlcmNpc2VkIHdpdGhpbiBhIHNpbmdsZSB0ZXN0IHBhdGgsDQo+IHdoaWNoIG1h
ZGUgZmFpbHVyZXMgaGFyZGVyIHRvIGlzb2xhdGUuDQo+IFRoZSBuZXcgc3RydWN0dXJlIGltcHJv
dmVzIGNsYXJpdHkgYW5kIGRlYnVnZ2FiaWxpdHkgYnkgZ2VuZXJhdGluZyBleHBsaWNpdA0KPiBz
dWJ0ZXN0IG5hbWVzIGZvciBlYWNoIG1vZGlmaWVyLg0KPiBTdWJ0ZXN0cyBub3cgcnVuIG9ubHkg
Zm9yIHRoZSBzZWxlY3RlZCBtb2RpZmllciwgYW5kIHVuc3VwcG9ydGVkDQo+IGNvbWJpbmF0aW9u
cyBhcmUgY2xlYW5seSBza2lwcGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFsYWRhbGEgUmFt
YW5haWR1IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2tt
c19wbGFuZS5jIHwgODkNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcGxhbmUuYyBiL3Rlc3RzL2ttc19w
bGFuZS5jIGluZGV4DQo+IGVjMzI0NWM5Zi4uZmJjYzdlYWQwIDEwMDY0NA0KPiAtLS0gYS90ZXN0
cy9rbXNfcGxhbmUuYw0KPiArKysgYi90ZXN0cy9rbXNfcGxhbmUuYw0KPiBAQCAtNzIsMTMgKzcy
LDMyIEBADQo+ICAgKi8NCj4gDQo+ICAvKioNCj4gLSAqIFNVQlRFU1Q6IHBpeGVsLSVzDQo+ICsg
KiBTVUJURVNUOiBwaXhlbC1mb3JtYXQtJXMtbW9kaWZpZXINCj4gICAqIERlc2NyaXB0aW9uOiB2
ZXJpZnkgdGhlIHBpeGVsIGZvcm1hdHMgZm9yIGdpdmVuIHBsYW5lIGFuZCBwaXBlDQo+ICAgKg0K
PiArICogU1VCVEVTVDogcGl4ZWwtZm9ybWF0LSVzLW1vZGlmaWVyLXNvdXJjZS1jbGFtcGluZw0K
PiArICogRGVzY3JpcHRpb246IHZlcmlmeSB0aGUgcGl4ZWwgZm9ybWF0cyBmb3IgZ2l2ZW4gcGxh
bmUgYW5kIHBpcGUgd2l0aA0KPiArIHNvdXJjZSBjbGFtcGluZw0KPiArICoNCj4gICAqIGFyZ1sx
XToNCj4gICAqDQo+IC0gKiBAZm9ybWF0Og0KPiAtICogQGZvcm1hdC1zb3VyY2UtY2xhbXBpbmc6
ICAgICAgICAgIHdpdGggc291cmNlIGNsYW1waW5nDQo+ICsgKiBAeC10aWxlZDogICAgICAgICAg
ICAgICAgICAgICB4IHRpbGVkDQo+ICsgKiBAeS10aWxlZDogICAgICAgICAgICAgICAgICAgICB5
IHRpbGVkDQo+ICsgKiBAeWYtdGlsZWQ6ICAgICAgICAgICAgICAgICAgICB5ZiB0aWxlZA0KPiAr
ICogQHktdGlsZWQtY2NzOiAgICAgICAgICAgICAgICAgeSB0aWxlZCBjY3MNCj4gKyAqIEB5Zi10
aWxlZC1jY3M6ICAgICAgICAgICAgICAgIHlmIHRpbGVkIGNjcw0KPiArICogQHktdGlsZWQtZ2Vu
MTItcmMtY2NzOiAgICAgICAgeSB0aWxlZCBnZW4xMiByYyBjY3MNCj4gKyAqIEB5LXRpbGVkLWdl
bjEyLW1jLWNjczogICAgICAgIHkgdGlsZWQgZ2VuMTIgbWMgY2NzDQo+ICsgKiBAeS10aWxlZC1n
ZW4xMi1yYy1jY3MtY2M6ICAgICB5IHRpbGVkIGdlbjEyIHJjIGNjcyBjYw0KPiArICogQDQtdGls
ZWQ6ICAgICAgICAgICAgICAgICAgICAgNCB0aWxlZA0KPiArICogQDQtdGlsZWQtZGcyLXJjLWNj
czogICAgICAgICAgNCB0aWxlZCBkZzIgcmMgY2NzDQo+ICsgKiBANC10aWxlZC1kZzItbWMtY2Nz
OiAgICAgICAgICA0IHRpbGVkIGRnMiBtYyBjY3MNCj4gKyAqIEA0LXRpbGVkLWRnMi1yYy1jY3Mt
Y2M6ICAgICAgIDQgdGlsZWQgZGcyIHJjIGNjcyBjYw0KPiArICogQDQtdGlsZWQtbXRsLXJjLWNj
czogICAgICAgICAgNCB0aWxlZCBtdGwgcmMgY2NzDQo+ICsgKiBANC10aWxlZC1tdGwtbWMtY2Nz
OiAgICAgICAgICA0IHRpbGVkIG10bCBtYyBjY3MNCj4gKyAqIEA0LXRpbGVkLW10bC1tYy1jY3Nf
Y2M6ICAgICAgIDQgdGlsZWQgbXRsIG1jIGNjcyBjYw0KY2NzLWNjIDwtIGNjc19jYyBUeXBvIA0K
PiArICogQDQtdGlsZWQtbG5sLWNjczogICAgICAgICAgICAgNCB0aWxlZCBsbmwgY2NzDQo+ICsg
KiBANC10aWxlZC1ibWctY2NzOiAgICAgICAgICAgICA0IHRpbGVkIGJtZyBjY3MNCj4gKyAqIEBs
aW5lYXI6ICAgICAgICAgICAgICAgICAgICAgIGxpbmVhcg0KPiAgICovDQo+IA0KPiAgLyoNCj4g
QEAgLTExNCw2ICsxMzMsNyBAQCB0eXBlZGVmIHN0cnVjdCB7DQo+ICAJdWludDMyX3QgY3JvcDsN
Cj4gIAlib29sIGV4dGVuZGVkOw0KPiAgCXVuc2lnbmVkIGludCBmbGFnczsNCj4gKwl1aW50NjRf
dCBtb2Q7DQo+ICB9IGRhdGFfdDsNCj4gDQo+ICBzdGF0aWMgYm9vbCBhbGxfcGlwZXM7DQo+IEBA
IC0xNDksNiArMTY5LDMwIEBAIGVudW0gew0KPiAgCVRFU1RfU1VTUEVORF9SRVNVTUUgICAgICAg
ICAgICAgPSAxIDw8IDQsDQo+ICB9Ow0KPiANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgew0KPiAr
CXVpbnQ2NF90IG1vZGlmaWVyOw0KPiArCWNvbnN0IGNoYXIgKnN0cjsNCj4gK30gbW9kaWZpZXJz
W10gPSB7DQo+ICsJe0k5MTVfRk9STUFUX01PRF9YX1RJTEVELCAieC10aWxlZCJ9LA0KPiArCXtJ
OTE1X0ZPUk1BVF9NT0RfWV9USUxFRCwgInktdGlsZWQifSwNCj4gKwl7STkxNV9GT1JNQVRfTU9E
X1lmX1RJTEVELCAieWYtdGlsZWQifSwNCj4gKwl7STkxNV9GT1JNQVRfTU9EX1lfVElMRURfQ0NT
LCAieS10aWxlZC1jY3MifSwNCj4gKwl7STkxNV9GT1JNQVRfTU9EX1lmX1RJTEVEX0NDUywgInlm
LXRpbGVkLWNjcyJ9LA0KPiArCXtJOTE1X0ZPUk1BVF9NT0RfWV9USUxFRF9HRU4xMl9SQ19DQ1Ms
ICJ5LXRpbGVkLWdlbjEyLXJjLQ0KPiBjY3MifSwNCj4gKwl7STkxNV9GT1JNQVRfTU9EX1lfVElM
RURfR0VOMTJfTUNfQ0NTLCAieS10aWxlZC1nZW4xMi1tYy0NCj4gY2NzIn0sDQo+ICsJe0k5MTVf
Rk9STUFUX01PRF9ZX1RJTEVEX0dFTjEyX1JDX0NDU19DQywgInktdGlsZWQtZ2VuMTItDQo+IHJj
LWNjcy1jYyJ9LA0KPiArCXtJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRCwgIjQtdGlsZWQifSwNCj4g
Kwl7STkxNV9GT1JNQVRfTU9EXzRfVElMRURfREcyX1JDX0NDUywgIjQtdGlsZWQtZGcyLXJjLWNj
cyJ9LA0KPiArCXtJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRF9ERzJfTUNfQ0NTLCAiNC10aWxlZC1k
ZzItbWMtY2NzIn0sDQo+ICsJe0k5MTVfRk9STUFUX01PRF80X1RJTEVEX0RHMl9SQ19DQ1NfQ0Ms
ICI0LXRpbGVkLWRnMi1yYy1jY3MtDQo+IGNjIn0sDQo+ICsJe0k5MTVfRk9STUFUX01PRF80X1RJ
TEVEX01UTF9SQ19DQ1MsICI0LXRpbGVkLW10bC1yYy1jY3MifSwNCj4gKwl7STkxNV9GT1JNQVRf
TU9EXzRfVElMRURfTVRMX01DX0NDUywgIjQtdGlsZWQtbXRsLW1jLWNjcyJ9LA0KPiArCXtJOTE1
X0ZPUk1BVF9NT0RfNF9USUxFRF9NVExfUkNfQ0NTX0NDLCAiNC10aWxlZC1tdGwtbWMtDQo+IGNj
c19jYyJ9LA0KPiArCXtJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRF9MTkxfQ0NTLCAiNC10aWxlZC1s
bmwtY2NzIn0sDQo+ICsJe0k5MTVfRk9STUFUX01PRF80X1RJTEVEX0JNR19DQ1MsICI0LXRpbGVk
LWJtZy1jY3MifSwNCj4gKwl7RFJNX0ZPUk1BVF9NT0RfTElORUFSLCAibGluZWFyIn0sDQo+ICt9
Ow0KPiArDQo+ICAvKg0KPiAgICogY3JlYXRlIGEgY29sb3JlZCBmYiwgcG9zc2libHkgd2l0aCBh
IHNlcmllcyBvZiA2NHg2NCBjb2xvcmVkIHJlY3RhbmdsZXMgKHVzZWQNCj4gICAqIGZvciBwb3Np
dGlvbiB0ZXN0cykNCj4gQEAgLTEwNDAsNiArMTA4NCw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfZm9y
bWF0X3BsYW5lKGRhdGFfdCAqZGF0YSwgZW51bQ0KPiBwaXBlIHBpcGUsDQo+ICAJc3RydWN0IGZv
cm1hdF9tb2QgcmVmID0ge307DQo+ICAJaWd0X2NyY190KiBjcmNzZXQ7DQo+ICAJYm9vbCByZXN1
bHQgPSB0cnVlOw0KPiArCWJvb2wgZm91bmQgPSBmYWxzZTsNCj4gDQo+ICAJLyoNCj4gIAkgKiBO
byBjbGFtcGluZyB0ZXN0IGZvciBjdXJzb3IgcGxhbmUNCj4gQEAgLTEwNDcsNiArMTA5MiwxNyBA
QCBzdGF0aWMgdm9pZCB0ZXN0X2Zvcm1hdF9wbGFuZShkYXRhX3QgKmRhdGEsIGVudW0NCj4gcGlw
ZSBwaXBlLA0KPiAgCWlmIChkYXRhLT5jcm9wICE9IDAgJiYgcGxhbmUtPnR5cGUgPT0gRFJNX1BM
QU5FX1RZUEVfQ1VSU09SKQ0KPiAgCQlyZXR1cm47DQo+IA0KPiArCWZvciAoaW50IGkgPSAwOyBp
IDwgcGxhbmUtPmZvcm1hdF9tb2RfY291bnQ7IGkrKykgew0KPiArCQlpZiAoZGF0YS0+bW9kID09
IHBsYW5lLT5tb2RpZmllcnNbaV0pIHsNCj4gKwkJCWZvdW5kID0gdHJ1ZTsNCj4gKwkJCWJyZWFr
Ow0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJaWd0X3NraXBfb25fZighZm91bmQsDQo+ICsJCSAg
ICAgICJNb2RpZmllciAiIElHVF9NT0RJRklFUl9GTVQgIiBub3Qgc3VwcG9ydGVkIG9uIHBsYW5l
DQo+ICVkXG4iLA0KPiArCQkgICAgICBJR1RfTU9ESUZJRVJfQVJHUyhkYXRhLT5tb2QpLCBwbGFu
ZS0+aW5kZXgpOw0KPiArDQpDb25zaWRlciBhZGRpbmcgTlVMTCBjaGVjaywgVGhlIG1vZGlmaWVy
IHZhbGlkYXRpb24gbG9vcCBjb3VsZCBiZW5lZml0IGZyb20gYm91bmRzIGNoZWNraW5nLiANCj4g
IAlpZ3RfdmVjX2luaXQoJnRlc3RlZF9mb3JtYXRzLCBzaXplb2Yoc3RydWN0IGZvcm1hdF9tb2Qp
KTsNCj4gDQo+ICAJbW9kZSA9IGlndF9vdXRwdXRfZ2V0X21vZGUob3V0cHV0KTsNCj4gQEAgLTEx
MDEsNiArMTE1Nyw5IEBAIHN0YXRpYyB2b2lkIHRlc3RfZm9ybWF0X3BsYW5lKGRhdGFfdCAqZGF0
YSwgZW51bQ0KPiBwaXBlIHBpcGUsDQo+ICAJCQkubW9kaWZpZXIgPSBwbGFuZS0+bW9kaWZpZXJz
W2ldLA0KPiAgCQl9Ow0KPiANCj4gKwkJaWYgKGRhdGEtPm1vZCAhPSBmLm1vZGlmaWVyKQ0KPiAr
CQkJY29udGludWU7DQo+ICsNCj4gIAkJaWYgKGYuZm9ybWF0ID09IHJlZi5mb3JtYXQgJiYNCj4g
IAkJICAgIGYubW9kaWZpZXIgPT0gcmVmLm1vZGlmaWVyKQ0KPiAgCQkJY29udGludWU7DQo+IEBA
IC0xNDMzLDE0ICsxNDkyLDIyIEBAIHN0YXRpYyB2b2lkIGR5bmFtaWNfdGVzdF9oYW5kbGVyKGRh
dGFfdCAqZGF0YSwNCj4gZW51bSBwaXBlIHBpcGUpICBzdGF0aWMgdm9pZCAgcnVuX3Rlc3RzX2Zv
cl9waXBlX3BsYW5lKGRhdGFfdCAqZGF0YSkgIHsNCj4gLQlpZ3RfZGVzY3JpYmUoInZlcmlmeSB0
aGUgcGl4ZWwgZm9ybWF0cyBmb3IgZ2l2ZW4gcGxhbmUgYW5kIHBpcGUiKTsNCj4gLQlpZ3Rfc3Vi
dGVzdF93aXRoX2R5bmFtaWNfZigicGl4ZWwtZm9ybWF0IikNCj4gLQkJcnVuX3Rlc3QoZGF0YSwg
dGVzdF9waXhlbF9mb3JtYXRzKTsNCj4gLQ0KPiAtCWlndF9kZXNjcmliZSgidmVyaWZ5IHRoZSBw
aXhlbCBmb3JtYXRzIGZvciBnaXZlbiBwbGFuZSBhbmQgcGlwZSB3aXRoDQo+IHNvdXJjZSBjbGFt
cGluZyIpOw0KPiAtCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pY19mKCJwaXhlbC1mb3JtYXQtc291
cmNlLWNsYW1waW5nIikgew0KPiAtCQlkYXRhLT5jcm9wID0gNDsNCj4gLQkJcnVuX3Rlc3QoZGF0
YSwgdGVzdF9waXhlbF9mb3JtYXRzKTsNCj4gKwlmb3IgKGludCBpID0gMDsgaSA8IEFSUkFZX1NJ
WkUobW9kaWZpZXJzKTsgaSsrKSB7DQo+ICsJCWlndF9kZXNjcmliZSgidmVyaWZ5IHRoZSBwaXhl
bCBmb3JtYXRzIGZvciBnaXZlbiBwbGFuZSBhbmQNCj4gcGlwZSIpOw0KPiArCQlpZ3Rfc3VidGVz
dF93aXRoX2R5bmFtaWNfZigicGl4ZWwtZm9ybWF0LSVzLW1vZGlmaWVyIiwNCj4gbW9kaWZpZXJz
W2ldLnN0cikgew0KPiArCQkJZGF0YS0+bW9kID0gbW9kaWZpZXJzW2ldLm1vZGlmaWVyOw0KPiAr
CQkJcnVuX3Rlc3QoZGF0YSwgdGVzdF9waXhlbF9mb3JtYXRzKTsNCj4gKwkJfQ0KPiArCX0NCj4g
Kw0KPiArCWZvciAoaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRShtb2RpZmllcnMpOyBpKyspIHsN
Cj4gKwkJaWd0X2Rlc2NyaWJlKCJ2ZXJpZnkgdGhlIHBpeGVsIGZvcm1hdHMgZm9yIGdpdmVuIHBs
YW5lIGFuZCBwaXBlDQo+IHdpdGggc291cmNlIGNsYW1waW5nIik7DQo+ICsJCWlndF9zdWJ0ZXN0
X3dpdGhfZHluYW1pY19mKCJwaXhlbC1mb3JtYXQtJXMtbW9kaWZpZXItDQo+IHNvdXJjZS1jbGFt
cGluZyIsDQo+ICsJCQkJCSAgIG1vZGlmaWVyc1tpXS5zdHIpIHsNCj4gKwkJCWRhdGEtPm1vZCA9
IG1vZGlmaWVyc1tpXS5tb2RpZmllcjsNCj4gKwkJCWRhdGEtPmNyb3AgPSA0Ow0KPiArCQkJcnVu
X3Rlc3QoZGF0YSwgdGVzdF9waXhlbF9mb3JtYXRzKTsNCj4gKwkJfQ0KPiAgCX0NCj4gDQo+ICAJ
ZGF0YS0+Y3JvcCA9IDA7DQpDYW4gdGhpcyByZXNldCBzaG91bGQgYmUgaGFuZGxlZCB3aXRoIGlu
IHRoZSBsb29wIHRvIGVuc3VyZSBjbGVhbiBzdGF0ZSBiZXR3ZWVuIHRlc3QgcnVucyA/IA0KPiAt
LQ0KPiAyLjQzLjANCg0K
