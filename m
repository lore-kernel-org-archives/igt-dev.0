Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B70CCD19A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 07:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF3E10E27C;
	Tue, 18 Nov 2025 07:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2V0zy+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9C410E27C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 07:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763449483; x=1794985483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XxE7PymtUJR8XJoUvi1fkkt5sGTfA2S3WlswkzERR/Y=;
 b=Y2V0zy+ybYaSo6VaGpZoZ6Snrlig3tCutfQ4q44fQbQp9JsGWPSUbMV7
 eg4trrUsAsk4l0VOocnwc9wkfwMFJ+9yeSb3OgCNXdHNc8L/0uZHC80PT
 DkySNY0atl2wHxKqq98BWSe/llNtzxv0QIas5KjpAiL2qqbFWbct8zSI2
 Nhk1sJpWXoCGb437KJT3KNdZaQ+LYR7esunr+fUNy+yHvHKhBiQOs878H
 ymlJcRG6y0pfn+23tinFJJC0CfiUZrBdo6gxln9dzv9Cnm2zboRfylmuu
 GpfTTAgsGxzmETS1k2NJ3jso7/xRhPuCgEGs4T1XUoUoKdsQz3vOSS/53 g==;
X-CSE-ConnectionGUID: /6pPgk9TRkuL+OX/cVF5wQ==
X-CSE-MsgGUID: d9i8+8dkTK+HSnTk1KHmiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69333108"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="69333108"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 23:04:38 -0800
X-CSE-ConnectionGUID: PpOV43yzTQGR7ZF5jQUoBg==
X-CSE-MsgGUID: MKYFxcSES++ywucj5S9VnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190474861"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 23:04:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 23:04:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 23:04:37 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 23:04:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aY1hnCjVXK763dl1KR9y9CeYNnY6rc6WEXlZr24GVWGV1KIpkrv7aReJMJe5Ppd6gzV8HVNwf3yEzeoJBkUy608bHRcCoiegodWz+5NOGL1QsZHwPQzuvN7c7WWv3ORDRGGX6pwBvFeIJxiYI8C01bdghqpMzn8sqVdiUdLAG76edUlotyNaED/xQcQ455e9YjjcATJqh03DJ51aSCDOX8RB+vKysnSjI70/kBR1eO8ARgpxGSFaR3LCYjTwDq39NP3HbvrE6ANycpmor9i/ISw+rAhF8xc7EPbB9zN3tTgQddblJiSHmvg1aDlCSNt5c/BNZE43EDvBwmBVyBrhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxE7PymtUJR8XJoUvi1fkkt5sGTfA2S3WlswkzERR/Y=;
 b=kt8NL1CNzUc1gDpasRY1iMtk2OSSIoHUiOq7ISnnGNmq2KOuG3ofMNpusp8Vm+b77pNgfpIXDpWOyFOXEIqGbME09siyK9Cd+cW5+Vie4oErJo7WQTrZF2PlTyrToBZ9hdof5QqQa6H/hoJ1M6XEqnyn+lMbMXHb4LYE4ps1mqs6VvBWPUk3MfbVV+l9eicOHvLgek/PQ3ECFlRlxw14l2udfx9Vk04jb7QGBxBjtZasR86zEeulMx6Nxi9h7B2Qxs8lWVQBR7j7AEcxO2zIHNFI24DhdnI+CoOtnoXeNYeb+nA01UYt0IYkfARPYGoUHviQKbNv+mxSfQXfzDlIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 07:04:29 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 07:04:26 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Mun, Gwan-gyeong"
 <gwan-gyeong.mun@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>
Subject: RE: [PATCH v3 1/8] lib/xe_query: add helper to get first value of
 hwconfig
Thread-Topic: [PATCH v3 1/8] lib/xe_query: add helper to get first value of
 hwconfig
Thread-Index: AQHcV6/YC+neaIgOWUGeA6gK2YyawLT4A6Dg
Date: Tue, 18 Nov 2025 07:04:26 +0000
Message-ID: <CH3PR11MB84344D7A3194806A2924D2C18DD6A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
 <20251117-xe_query_helpers-v3-1-25d984ae58cb@intel.com>
In-Reply-To: <20251117-xe_query_helpers-v3-1-25d984ae58cb@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CY8PR11MB6818:EE_
x-ms-office365-filtering-correlation-id: 94fbd57b-f6b6-4531-378b-08de2670b619
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UEI2YUE4K05qbDF4RGQxZHdzbVVzb2J4K0U3bVkvcU9jdmRSc3U1QkFnYnpZ?=
 =?utf-8?B?b1hiV2JuL2g5cVA1RlV0OVZ2L2NtU05oNEc1UnBTTDJVcDFkeVBaTTBhK25I?=
 =?utf-8?B?WTJTNnNvdzVlV2dicVlTUVBRNlhJYnprb3BVVWRrZ290UVdlQkcwaEViMFB6?=
 =?utf-8?B?NjV2c3F3YUxwK0Faejg4WGtvY0NWdWM3bURRcCtDb2wrVU1yelJHN0Rla2JB?=
 =?utf-8?B?TzBrYUJ6TVVwVlZ6bmpRakRyQTVtUGhWOGhBV2ZoejF6Vnd6cmNGOFdOeHF6?=
 =?utf-8?B?eTdnc1ZjWXdzai9KQ3V2YXdHclp5TE1vSXA3dUhUUEg2eHU0ZHZBdGsxYWZN?=
 =?utf-8?B?V0ZxNzRRR1g3b0VrRlE5WXBuZGR2T3VhczA4bWdobTFJRGNFZGdoK1FtY0ND?=
 =?utf-8?B?SE5pRUZSUGk3dUxKWDh5RW16QmxTaTB0cXBRVERwL0hDNlVJcFhPaDRqd0lN?=
 =?utf-8?B?Yy9BQVlZb0xQRE04OXFseW5oS0RaUEEzR1AwNmtndzl6UGU2MTJ5c0s0Unpu?=
 =?utf-8?B?eDBRWEpsZ1YvbE40a1FLeEZBVjB4QmJ3aDdtUFhoQnNNUVhoTm5TeTJiRlRO?=
 =?utf-8?B?dUU2MXFacDVjc3Q2RnNwSStrait2SmVlVDhDZlh4UzRabGIyczUwY0tlQ2NU?=
 =?utf-8?B?ZzFYelF4cHdyQ2swVjZqbWUwZXZPZmN4b3FzNWl1ZDk4ayt5OW9vcUd4Mmln?=
 =?utf-8?B?bE5RQktUUkxHZytyWVJRQUtJQ2VRZGUwbEJGT1NwdHNNZ3BoN1l3NnBPNXFI?=
 =?utf-8?B?V2NnQzh5YmtTOWhmQmZzUkJUWEhlOC80T1hjb081dlNhU2hYcVdPdXVmOWRX?=
 =?utf-8?B?ZFNMM0prZDNoSENYMm94K2pRWnRXalUwejZUSGhQLzc3YmxQUm9ack1VWkZp?=
 =?utf-8?B?UWRVTkNzdkZ3bHFGQTBOek5JTUF2eFBxZm96TE8zNzkrSTRpcSs4YXpqaUgw?=
 =?utf-8?B?cU1Id3FDeHE0U0E2MlprRW9IcFpMd0xaQVZEb2dHTW1wcTEvd25LMTR1eDIy?=
 =?utf-8?B?NDVKLzFBbVR6MzJjMXArUTU2VHJERFJ0SlJ6Nk5VaXVUWW9YRFB3MEkvOWlM?=
 =?utf-8?B?RDVPQ2Y3V1JaMFVWSUpWTkxEUktqNmZOZEJJMkxESElsR29hZWxHR09UVHFp?=
 =?utf-8?B?WGlJWGRqSEc1SkdrbWdncnZwY2xFKzJsakh6OFN0TUVMSlZtRUtWYzRFcGJ1?=
 =?utf-8?B?WjcrZmw1RUhodWo3SFN5SHh4L04vaVNRS2lsaGVrYURVWFBtREVSdEpIQWtF?=
 =?utf-8?B?Z3cvSFgwdVF6TFJENUNTa0x1NTR0ZTI5c2pHbXI3Uk9JWlBVTGtLOXhwTFpX?=
 =?utf-8?B?Ym1MNG1GUGhSbmtnTS9TMkpvMTdBN040N1VKNTZ4TGphUlJtUzNlOGdqVEI3?=
 =?utf-8?B?YmVBbkFkZmQzZlhtbHh5Tlc3UG53a3ZJU2k2NzgwQXpDTW1VdnZJMGU1YWhh?=
 =?utf-8?B?TnErVlVkdHVkTHJQZ1RpMVFuaW5uK0swWktkQzN4UzA5TjhtOGhaWEdnVllQ?=
 =?utf-8?B?UXBSUGJvQWYxSVgzZU9kM3k3MUlyQ0tWbEdTeGFpM0NWUldicUhrTE4rcWQw?=
 =?utf-8?B?d1JXL3V5eGFhOEVQNHJJV2ZLK0FJcHdIT292Smo1ODlYY3hyYXFvR3Zqd3Iz?=
 =?utf-8?B?bk11L1VLV2dSWTVhR3lRaVZwaVYyWXFPSGd3ZzV1WDZrTGsvRHBKVFMyTHEr?=
 =?utf-8?B?U3dTWFMvZklQNWhjMnUrdjNXU0ZSUjR5L04rUUZqekE4YUlDTzUxbHlaVndG?=
 =?utf-8?B?VkI3eUpDM2NpY0xHVlp4cXVtMkVLMWM5REJtUVlNRmoxOGdyNjVEZ1BteDFu?=
 =?utf-8?B?TDhFVGhaWXIyRTVUc004UWE4MUxCMTF3L3crdENPeG95ajFpdkl4UE1oUHpN?=
 =?utf-8?B?eUFoenRWaVU2TkVpU0ZKdGFJSGRQMEN3ck9CNWJHU3dacEcwZWJWUjlCajV0?=
 =?utf-8?B?cGNNcGJNcFY3TWlPZGNrYlQyVnQwNVc4VFlHU2QveTZBVlB2eWJvbTlEdzhU?=
 =?utf-8?B?QkJHb081S2NnWVlpWG5ScW52M2dieDhVaVczbEdaRGF1UUh3aDZTcDNPOTNn?=
 =?utf-8?Q?6k//jW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVVPbWR1K2JLWlI4aTdiT1RaeGR6NWY1MlJRUXdKQzE0N1pqTXZINDRlNWVt?=
 =?utf-8?B?RGZFZWJ3eGQ4OVc3ekVnLzBkMzFJQlZDYTdPeFlvU3AyMlZ0T1pROC9EU1ZS?=
 =?utf-8?B?ZUtDNVN6enM0Wm1SZVBRa2ZIUHlPS2IvNzBlSytFWi9QSTZpQzgxTVNSRTB3?=
 =?utf-8?B?NjNUcXUvNlo5WWw3TXBJL0Znc3hiMWlwQVZWcGErUUhHODB3Y292NkpsT1Zt?=
 =?utf-8?B?aXhWeTRGa1ErYlNiM3VCWndNYVl0ZXhKSVBWQUIwM2tkMXYzWEhRejlvWEhy?=
 =?utf-8?B?bkN1MmNsdGNxQzI0M1hoTVlmSC9ENVduWFkxTnFOdzlldHZuRGl5dWptNXpJ?=
 =?utf-8?B?TzVEUGNLNEo0cHNjMDBYUDBCczIrYmtZZEQ0d3F2elVyQWo5aGFib2VYRGVD?=
 =?utf-8?B?MWtoOEZjQjk1SzFUUjE5aFdmL1d6MEJzeXRhajdRRFdnZ2lVdEliaWtoTEdZ?=
 =?utf-8?B?WlJicjk3SXNXRWZuR29DOHJ0bUhhYTdMN3Y5RHRLU3BJT2JDVk5ZcWZINjJp?=
 =?utf-8?B?azNhaE9ZeE9tUEtzeE1oRFlDVmJjQ1NkWVdURURrWFRxSVhoRnpqNXhHa2Rv?=
 =?utf-8?B?ZTBkcjI3QnJPR3FxNnZFYS9tVFNTeFQvdTlnRVFjQTZ0di9JVmU4QS9ycHlS?=
 =?utf-8?B?czNraU9PeFp4d2xzZEpERXAyUEIvaURMV2hEc0NnWEk4SGxLQUtWN09UbkMz?=
 =?utf-8?B?QUN1RlpscE5CSFF0VENxNjlEZjdBYlBqWFdtVy8rbjRic0xLNk9DVXptRXFV?=
 =?utf-8?B?c1dKeCtBRUk0SE90NmhjSVIyMVk5YXpSNUY3VVlOMzMrazFsY3R3aFp6ZjBN?=
 =?utf-8?B?ejYwZDZUSDl2WDdFYk5iVGdNa0pRdUlleVc0QXNKNitFTmNjSSttdVFyM3dt?=
 =?utf-8?B?YWovMkxVK3pycXpkemE5N09BS05Xa3BaT1VZZFlFamtKZk1MUGxtRjJRVjRO?=
 =?utf-8?B?TGdVa05Qc2xVVlBabnc1S2VXWnUyYi9EMWp0WTFUWENIZDRVMlZ6UEMrZ3Rh?=
 =?utf-8?B?Ui93OFlBNXF1NkFQcXQzL1hMRHNtUFlhek5iMXByU0kwcjRHMnBaSE5qbGJG?=
 =?utf-8?B?aXZHY3Q4RnhWcHU3NWtzZFZPTFVXMVpuRGUxYzdFNmMyUmloUUtoWGg3UnB0?=
 =?utf-8?B?L2t0bVFsQ2FOS3A2eEJhU3hPdUgwUUZ5ZTArQVVBMVBWcnZTWU1KTlIwNGVq?=
 =?utf-8?B?Q2RUS0lPVkdBWkRjYkdFN3pPcnh4QTlHcmlOZHc2OGRuTWl6MXFUSVQ2QXBX?=
 =?utf-8?B?OGRnZGdPaDk1TUdXaktJK09Fd3gwWkJ1VnpFemhlN1RUYWZCK3M1WlZva1Ra?=
 =?utf-8?B?cVN4WHk0eXJCOWVRTjQweE9mRWJrK1ZFUlF2WHNKNXNCamczZ1V2eGI2d3JY?=
 =?utf-8?B?ZGJmWGdmL2NCSXFCMU82bjI5eFR5TW9WRWtCZFV4VDFnYUN6VmkvbVdLaWJx?=
 =?utf-8?B?eWpTZHpUdlBWcm5MSGg5bEF1V3BLcjEyMElPanVMc3BIUHhBblNvMkpkUW9H?=
 =?utf-8?B?UncwQkphUWdHdHVHNnVQT1l0K1I1TnZwdnlEbXhuSFoxZjdWUG5EUnVIZVRa?=
 =?utf-8?B?MDN4djVyeEk4TkFLeFZ1elBwRUNYeG4zOWNuTzNaYTdHOWJuTnR3N3RvbzRC?=
 =?utf-8?B?TzAwTkV5cUgvWVl5QnFRSy9qSUVSNWRkRUxPWVEwWmFQcUhkemhadmphMlhO?=
 =?utf-8?B?UmlNL21vT0F2em1TL3RMNlhudWhseFVCRk9vdE8rbmNFVzBnTUQ1T3hDamRt?=
 =?utf-8?B?L1JPUWJWQ2k3Skp2VUduV2dnOHY5UGJiRGtBYjVMd08vdUtMVndNZ1Z5M3c2?=
 =?utf-8?B?aTV3di9ibFdEOFNBRkVtekQ1U0JuQk0rd0JOMk1RQ1Z5RWNBL1RXenNlWnNN?=
 =?utf-8?B?RUV5cHc1RFovUUk2UW84cnpJeFEzT1NVUVlUV0FSaFpLK05WdGxwamcwS0Ix?=
 =?utf-8?B?Um84MnlsR3pqZm1KUVVDMW95WW1xSjh3M0ZSZFM3VjM4SHBvQ0ZOYi92bGts?=
 =?utf-8?B?NXBQY09NUVovaGgwM2N4K0dEd2tEaE9HRm5sWFlHa3dqUUxmRWoxSVMwSExU?=
 =?utf-8?B?b3NnM3gyRWQ2bXduUVZQK3VJYUlyQW9DR3JpOWxZR1oyQlpEeHA2SjBIUjY3?=
 =?utf-8?B?eHNqVnJ1WGU5RmFyN1JRbnAxKzB4bmxSZDFiNHR1YlBjUlNjRkhJTlJlTTVm?=
 =?utf-8?B?MDMwd2R4UDFMb1Q3R09GTHY0N3lCNGF0YWVNdDBhbTF1aTYzRUdOQTVOVUV5?=
 =?utf-8?B?T1U3dXphbE1OWmpsbEtjTHVQcXd3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fbd57b-f6b6-4531-378b-08de2670b619
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 07:04:26.5135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IJnH7wEZD+AysD75FO9bMLGhRTxI9x6g81y5g+xmyDkEsta/wwOwClkp+cQjH2HUcMSyNveT/neJVHal23s+hiQNAg3wBwMmIdQDF7BNhUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6818
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFqZGEsIEFuZHJ6ZWog
PGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPg0KPiBTZW50OiAxNyBOb3ZlbWJlciAyMDI1IDA0OjE4
IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS2FtaWwgS29u
aWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPjsgRGFuZGFtdWRpLCBQcml5
YW5rYQ0KPiA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IE11biwgR3dhbi1neWVvbmcg
PGd3YW4tDQo+IGd5ZW9uZy5tdW5AaW50ZWwuY29tPjsgUGlvcmtvd3NraSwgUGlvdHIgPHBpb3Ry
LnBpb3Jrb3dza2lAaW50ZWwuY29tPjsNCj4gTWFuc3pld3NraSwgQ2hyaXN0b3BoIDxjaHJpc3Rv
cGgubWFuc3pld3NraUBpbnRlbC5jb20+OyBIYWpkYSwgQW5kcnplag0KPiA8YW5kcnplai5oYWpk
YUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAxLzhdIGxpYi94ZV9xdWVyeTogYWRk
IGhlbHBlciB0byBnZXQgZmlyc3QgdmFsdWUgb2YNCj4gaHdjb25maWcNCj4gDQo+IE1vc3QgaHdj
b25maWcgYXR0cmlidXRlcyBhcmUgc2luZ2xlIHZhbHVlcy4gTGV0J3Mgc2ltcGxpZnkgcXVlcnlp
bmcgdGhlbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFq
ZGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi94ZS94ZV9xdWVyeS5jIHwgMTcgKysrKysrKysr
KysrKysrKysgIGxpYi94ZS94ZV9xdWVyeS5oIHwgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
OCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX3F1ZXJ5LmMgYi9s
aWIveGUveGVfcXVlcnkuYyBpbmRleA0KPiA4ZTNlMDVmZDNhN2NmOTQ5YTBiYzBmNjRmMDY4NTNl
OTZiZThjNzhlLi5hM2ZhYjEzM2U2YzRkOWY5NDk1NjRiNDdjDQo+IGM4MTczODNiZWU3YTU2OCAx
MDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX3F1ZXJ5LmMNCj4gKysrIGIvbGliL3hlL3hlX3F1ZXJ5
LmMNCj4gQEAgLTEwODAsNiArMTA4MCwyMyBAQCB1aW50MzJfdCAqeGVfaHdjb25maWdfbG9va3Vw
X3ZhbHVlKGludCBmZCwNCj4gZW51bSBpbnRlbF9od2NvbmZpZyBhdHRyaWJ1dGUsIHVpbnQzMg0K
PiAgCXJldHVybiBOVUxMOw0KPiAgfQ0KPiANCj4gKy8qKg0KPiArICogeGVfaHdjb25maWdfZ2V0
X3UzMjoNCj4gKyAqIEBmZDogeGUgZGV2aWNlIGZkDQo+ICsgKiBAYXR0cmlidXRlOiBod2NvbmZp
ZyBhdHRyaWJ1dGUgaWQNCj4gKyAqIEBkZWZhdWx0X3ZhbHVlOiB2YWx1ZSB0byBiZSByZXR1cm5l
ZCBpbiBjYXNlIGF0dHJpYnV0ZSBpcyBub3QNCj4gK3ByZXNlbnQNCj4gKyAqDQo+ICsgKiBSZXR1
cm5zIGF0dHJpYnV0ZSB2YWx1ZSwgaWYgcHJlc2VudCwgQGRlZmF1bHRfdmFsdWUgb3RoZXJ3aXNl
Lg0KPiArICovDQo+ICt1aW50MzJfdCB4ZV9od2NvbmZpZ19nZXRfdTMyKGludCBmZCwgZW51bSBp
bnRlbF9od2NvbmZpZyBhdHRyaWJ1dGUsDQo+ICt1aW50MzJfdCBkZWZhdWx0X3ZhbHVlKSB7DQo+
ICsJdWludDMyX3QgKnZhbHMsIGxlbjsNCj4gKw0KPiArCXZhbHMgPSB4ZV9od2NvbmZpZ19sb29r
dXBfdmFsdWUoZmQsIGF0dHJpYnV0ZSwgJmxlbik7DQo+ICsNCj4gKwlyZXR1cm4gKHZhbHMgJiYg
bGVuID4gMCkgPyAqdmFscyA6IGRlZmF1bHRfdmFsdWU7IH0NCj4gKw0KPiAgLyoqDQo+ICAgKiB4
ZV9xdWVyeV9weHBfc3RhdHVzOg0KPiAgICogQGZkOiB4ZSBkZXZpY2UgZmQNCj4gZGlmZiAtLWdp
dCBhL2xpYi94ZS94ZV9xdWVyeS5oIGIvbGliL3hlL3hlX3F1ZXJ5LmggaW5kZXgNCj4gYmNkZmI1
NGIwMjc1NDBiNDQyZGE5NWQzYzZhM2NmZDBmOGIwOGRjYS4uNGYxYzA2ODcxMzNjMDNiODFiYTUz
Zjk1DQo+IDQ1N2M1NTg2MGU1Y2UxOTQgMTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9xdWVyeS5o
DQo+ICsrKyBiL2xpYi94ZS94ZV9xdWVyeS5oDQo+IEBAIC0xNDIsNiArMTQyLDcgQEAgYm9vbCB4
ZV9pc19tYWluX2d0KGludCBmZCwgaW50IGd0KTsgIHVpbnQxNl90DQo+IHhlX2d0X2dldF90aWxl
X2lkKGludCBmZCwgaW50IGd0KTsgIHVpbnQxNl90IHhlX3RpbGVfZ2V0X21haW5fZ3RfaWQoaW50
IGZkLA0KPiB1aW50OF90IHRpbGUpOyAgdWludDMyX3QgKnhlX2h3Y29uZmlnX2xvb2t1cF92YWx1
ZShpbnQgZmQsIGVudW0NCj4gaW50ZWxfaHdjb25maWcgYXR0cmlidXRlLCB1aW50MzJfdCAqbGVu
KTsNCj4gK3VpbnQzMl90IHhlX2h3Y29uZmlnX2dldF91MzIoaW50IGZkLCBlbnVtIGludGVsX2h3
Y29uZmlnIGF0dHJpYnV0ZSwNCj4gK3VpbnQzMl90IGRlZmF1bHRfdmFsdWUpOw0KPiAgaW50IHhl
X3F1ZXJ5X3B4cF9zdGF0dXMoaW50IGZkKTsNCj4gIGludCB4ZV93YWl0X2Zvcl9weHBfaW5pdChp
bnQgZmQpOw0KPiANCkxHVE0sDQpSZXZpZXdlZC1ieTogUHJpeWFua2EgRGFuZGFtdWRpIDxwcml5
YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiANCj4gLS0NCj4gMi40My4wDQoNCg==
