Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A23CE67495
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 04:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCC110E383;
	Mon, 22 Dec 2025 04:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAV69zL2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D64B10E383
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 04:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766378713; x=1797914713;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kevbGQXnP/MRnioLDSTZ2JLKdtLFGt5+irqHuMW7uDg=;
 b=FAV69zL2CZKEaLaQk2juLVYbJhbqjECosTXOsnNuC2JEMAV+zvQoRoPD
 kSoYHUxumf9ap2Fpyk2djpOcLYgw7qeoGHRyOTlq95JaoZ9QmlRUx5xce
 mInE1QKmwyFOlWA5bU4mtma2TQ5XminE2iHRwUJLtaL8T2wr0wZqAAb5I
 EXRYw8gJlCaiCo6B29cp0XAH81wnCN9ZEuXO6fl3n27cbvguGSGWAMzn8
 TJ2JNKtnd2iPJMuWWoCtZO9HMe5Ic2YRlj4fjaoGwmlVNxFLEWfAM3FBK
 6aTeYDZ/YzORgUbi1G+MAGVRIjt2XFn4m1fBIWuJ+9CazncXk9smA+DEu w==;
X-CSE-ConnectionGUID: hJmAznKOS8GCGi5GCOtKdw==
X-CSE-MsgGUID: be3KJYtiQKqvKezEC3bpgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="70811768"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="70811768"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 20:45:12 -0800
X-CSE-ConnectionGUID: dKcU1tTBTgCrziScRXmy0Q==
X-CSE-MsgGUID: XIDtrcsSTAe2c3PykA199Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="199455499"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 20:45:12 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 20:45:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 21 Dec 2025 20:45:11 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 20:45:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcep0mYP/3LFYtgFNA9Gzwa8IGRho1IOHOqqp1YKb1948UjzlOt+hIH81y7hVdDAdeh2yEZ6Vb7h5euY6uI5iinN9k9zayMPQK+DaGqvCqKrfvBy7N5Y/GaPOYut/T0J0YjlHGrAaP5P7j5JtulvyPNZETCfjjd+iqxEWiAueHGC8/jmzghJZZPmorwkK0WoVzg8RtF6E5O4DvZWVmTzWx7XJwKpV1fH2ADryDRzH0vH+aaZNr98j4nNUwGhRezcgGhFWZdXd+cwwCnHaEA7KR8jROoaeiVZZHriHFAEuNReZJAqf9RxXc7LXjvpvtgfRQVoCwmot/8RS1IV5xRv8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Li1BjNSeLYW2AZw8gSk85y08r5Kq2/5D3vEbxVD848=;
 b=FpO6xZKaY8gtVVZ4E6+iie/L7TL2c2UVp7BIETEy2cog/n1biiDbuZbiUjGIhyjrJ/0Wx23PXsHM9jFGrj6SDYk+7JHtwe1WeOZHp/O9qjAMIUTC5vACX5htMSq9I33JLy9k7wLSJZ47q0Tt6CHFf2mMDUCsTfUi28fKch9Pby1d4z1sidKYDZWx98HWB6OGaekKmdtRsWeoG8yYhyGW6TOLHoQnvQdHG322Cx2hxow/nPhyNBRkB65h14DHq/gq2uHmpqlMzgVgL0Ad8MSlxDDu+qNViSFNWbV3ikRHwag8XlbSM66ohODwuYZN183uazBbr/rIvAqo6WeSZG9k9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DS7PR11MB6270.namprd11.prod.outlook.com (2603:10b6:8:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 04:45:04 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 04:45:03 +0000
Message-ID: <c0cc8610-191c-478f-8eab-da22a1272a1a@intel.com>
Date: Mon, 22 Dec 2025 10:14:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/gen_xe_vf_migration_bpftrace.py: Add bpftrace
 generator for Xe VF migration tracing
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20251219170958.881880-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251219170958.881880-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0117.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::9) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|DS7PR11MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 466822f5-61c3-433f-baf5-08de4114df0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzBRTGI0d1ZBb1hNclhRVndiRkNxYlo0a1I0TXhpWXhLeGZiNHk4SDBzUGdo?=
 =?utf-8?B?K1dwVWI0WkZJU1dGUEtNeUtpZ0ozM2hvOXFCTVF3L25jbTZxdkM1eEdiaSt0?=
 =?utf-8?B?aDM3c1RaL1VLY3pBMVFOZCthak5oTTF3cGRuVGFpMjRXQWdzRHNuRVhMRGxQ?=
 =?utf-8?B?ZDZMZnR5L01FMkdTODI2YU9FbERGQzdDa3ByMGxoNHdrM0J1SjFUTnhTQ2Yy?=
 =?utf-8?B?OWtzT1A2NzJ5aURhRHNOTjZpUWZEbStyZFE3b1d2S2FTeXh4TkVCMG16NkVE?=
 =?utf-8?B?ZzRESnc3Y3g5cW4xZW9menJNUi9sa2J0SUh4ODFEKy8xMGZKWVhjaHFHeGRr?=
 =?utf-8?B?V3hpUlB4aEN5REJscWw3alZGK3ZXanhmcDF2WStBTDVTcGxJVzZxeCtTdUFK?=
 =?utf-8?B?YUphYm1KWkltc1NyR1NyMEtOak1IcldxTXRUNjR4RFViVzREbmwrM0xtbmY1?=
 =?utf-8?B?bmpVSWt0TlZzOUtEUFFrKy9QNWFiVTQ0SlBXRVJQbWhRUXlvMXdZaGNSMzZx?=
 =?utf-8?B?SGVwQ2hZK0dJRmFLeC9pdUFxemhEdkRMZ0w5bDlOVkhzNlp2V2ZIa293M0VK?=
 =?utf-8?B?SnFoS1BycGZNMXJseVYzcjdrL0tFWjRsNnZ5Tk1hbXNzcTFlbnd4bUJPakZz?=
 =?utf-8?B?aXAxRTcyVFhtM2VNUUpkZlFEVmt4Z3NsNDFXSXhrZ09kWG1SWDZkUlJ4YUVS?=
 =?utf-8?B?ZHF6ZEZhbERETHJFY2RtUURqM1hnN3hlSTR4cXN5MG5BbkdqMmpRWnZGenh2?=
 =?utf-8?B?VjR0N0xMT1BtZklKUDBYai84a1hXMzNiNWNQWXdENm1McTdpM3Iwc1doNzlu?=
 =?utf-8?B?WGxOcERsS3FMNGJPS2hhUGU0L3lpcGpScW1TQWpGOExXVGF5L1BHZmRSRnF1?=
 =?utf-8?B?UUpveFU5dFlsZWFvakd4M1VzNm8xVzMyaEczZE5ZaWYrT0RrQ3ZVNU5NV2ts?=
 =?utf-8?B?NkFPakRsYURJK1dPZzgxbWtyL29YTlJRdGtBQ0ZxYmwzMjZmTXo0eW9jL01x?=
 =?utf-8?B?V3lvd0t2MnB2UDNLcmUwYndERFRMWEVHemNzSHNnZFA4c1NqUGdOUXVFTno0?=
 =?utf-8?B?dkkxOUYya1hsdnhrdWJpSUU1TE5MbjA0U0Q3d1oranZZQ09zZVU0NzNTYjNO?=
 =?utf-8?B?Q09zZ2FoUnV5ekQ2eFNJV1JkditYOEVpM2s0ZDRMZUhqNjNiYmV5eVhZSk9i?=
 =?utf-8?B?ZTF2cm5lRnBFU2ZocWJKbDY0UW92dkVUVWpla3haQzdpWVV6aWYwRHB4eFpE?=
 =?utf-8?B?dEdPS1NORXpabVNza2ZQUmN0ZFJ0aVY1NVNoM1VITnpDTVZlWEF3UVdLWXlZ?=
 =?utf-8?B?blBVWHltN2RyNS9JTDVSbVBmcHl0WlZINlZRUFNNaVZEL2xLN0E2VWVqMXdP?=
 =?utf-8?B?bFM4ekdoUmpzYStUU3lCek9UeUpMUUNldEpUSi9MZmsyQXB4b25JQ3p2VUVV?=
 =?utf-8?B?dDBmT1g2aXlZd0JMS2N3dWQzM3hXejhxWDlxRER2eEVxNUcxbFgvRkRLVlhk?=
 =?utf-8?B?eWd3TUxrQXBkVVRzdmg0U2FGWEF4Rm5vRWdpWXdCc0IvSFk4clhJeExUaW56?=
 =?utf-8?B?L2c0L0hGZ2xjdGpOaUZJQjdXQWJ1TkZiL3k5Kzh2WkozOGl4TENrdUZiTkwz?=
 =?utf-8?B?K1FJQWNSZkNYdFdEVS9vSUFybkI2eCtSL0Nia20vei9FNk9Fb2VIUlZMdHRJ?=
 =?utf-8?B?eTFrMUtjY2VSL0Z3MC9ETjBOd2pENHhveXVHNDJ5aUJqY0dtYmYyTTZDNHcw?=
 =?utf-8?B?RStaa0QrZDEzeGxvTkwwUis1Q2l3K0NhZm1Nemg1WDdzYVp6QmFHbHdRSDJ2?=
 =?utf-8?B?TE9zd3cvSUhIL09OdkRCNmlPYko3M3JaLzNHWFJOZWltUkgremJnOUNmTXdO?=
 =?utf-8?B?SDdSNzQxVWRKbUNGVDdhc0tuTDh0Qm84aTJpbVBEQnA4RlY2WTN6TlJqYnA3?=
 =?utf-8?Q?MdcpNRe6sAZMVB64+D0bC/p9/i0Egdj6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlBJcHdKZTdSRzZjNlp5YTJhWkw0azFpQitlV2FuR1ZHNHFkY3BvUjl6SEY4?=
 =?utf-8?B?VDJNWlh0MG15SmpxczZxS3dJd1dhL2xNdm1zZ1R4QmtiWEZqOTg4TTBMVVVC?=
 =?utf-8?B?azZzQzN1eGlMM2JtTi9yOWM2bE9EWktCTWtzVS9kbXA0S0c4aGM2RzkvMXJH?=
 =?utf-8?B?VW9yNE9VdnVIeXk3Vi9WNEVoQVROUk9kV2FZeHNoalFkeWYzK0wwdFJuMEJr?=
 =?utf-8?B?emNFUW5SVG9Fc21kNlUyOU9aTm1hRmwwS3d1UjAvcmhaemx0N3lWOVZiK3Y5?=
 =?utf-8?B?Y1J3QzJ6YStJQUNyd3RqVnJ0dDdsak9WR3ZLcmV2RThhRDd1N3Z6eXQvUEFJ?=
 =?utf-8?B?QWFKcGdNOG01dG5GcmRxcWtEemx3cDZMVVNFZ3JNQmYzYlBKQ1N4M3JDT2d2?=
 =?utf-8?B?UzYvZkIrelc1dFlrdDVJcDAvWHI2Tlp5NDlQMGcvS3FLbklWNGNaMVFZbTlI?=
 =?utf-8?B?STVCWmhlLyswKzhzL2JUcTlPRURKL3dTMHZaRWsvYWdqQkhLUnBvbVp0clVG?=
 =?utf-8?B?WlovRS9lVEhGcXNmVWdVSDgrOWxSNXVKVVNMNmM5WEJHd2N0bkM5MkdIdEo0?=
 =?utf-8?B?RlEvVnlLRWtGWDJoSnN0VUYrZDhXRlJwSlVSeDRqOCt4Tkl4eHRvUjhKR3dm?=
 =?utf-8?B?WGt5K0U1SENrMDNqTW1aL0tHV1I2SXhaNzF0ek9SNFR0eXBpTFQySjZPRDdM?=
 =?utf-8?B?MXpTUlplTGNnVjhtMkx0dFZrOGRwQzJuWVNramxBRUZ2RC9PUnhMTzJ2NEJl?=
 =?utf-8?B?Y3hqUWJTc090K0w0M09Ic2gwb2wyTy9IVGw4NC9VNlNRRDRvQ3BSNEl0bm1W?=
 =?utf-8?B?WlFXa0ZGU1Y4am92RzNpRjdnK2gwQXZoOHlMdC83N0JTRGpIaGw0TnVQbC9N?=
 =?utf-8?B?S0RNVU15RE1zeExsVmI3aERqNG0xUWpUVDZIRitXVFFaSkx2MCtlMnhBbUNE?=
 =?utf-8?B?M0MvY2xRQW9tMjBEY3p3dE45V1FSa1hJeDRCck9lTWRYRDF5bUtzb0hrUHZF?=
 =?utf-8?B?Y2IxbjNoWU9YVHc3SndDTW45SENlV1hlMGNiU2tHSXdYUzZ2VnBBb3lYMHFz?=
 =?utf-8?B?emF5WmNCTUlRWTRORnd1MzIvOWxTdEV4UUNVdGk5MEcweVNuREM4Mm1LUGc4?=
 =?utf-8?B?ZHh2U1FScDBFdWY0WXk3YWdIWjY4VXY2OUdaVlRnK2NJS2oxeEIvWkN4Sk1u?=
 =?utf-8?B?RGdJMm82ckVMblNtcTdGSzE5Y25JL3V3Q3Z3UEI1d2ZncGtRZ29EMEMvU24w?=
 =?utf-8?B?emtyY3ZaSktQTTVLbEthQzQ5M2ZtOGNib2g5b2tRcUZORjVMVGZJY2o2S3Fx?=
 =?utf-8?B?YnFZQitMdnppOXduZjFpYXZVYlRaSkhMK1JJdUtlVllCVUg1cytaeGRIU0VN?=
 =?utf-8?B?Wjc0MDN5MlFGR2I4UnlsUGEwM3NXOHJqVytjdHl3TitLOFgxMHM3bGY1SUZF?=
 =?utf-8?B?bDBzNTYvSjB2SWtWbUYvZTg5ZmV4S0xoY3k4SkhGcVVFRE1XQnl1ZjE2YmRp?=
 =?utf-8?B?dmVOUkc1T1Y4MHhsY3ZlVzhVcXFBYVZtajkyZThPclNROHVqek9zeHdlRnlX?=
 =?utf-8?B?M2FyTS9VaG1nRmRHUGRocnYzeEt5WVZ3OHVjK1VoOWRWZEEySVVFOURPbU5H?=
 =?utf-8?B?Uy9MdHNsTWxzb3gxNkpvdzMwdWlhQWlIU0xrMGZxZUF4azNpbkozRHdweDhk?=
 =?utf-8?B?NGtlNVhQbjFDRTljWGV1R240MGJYaVFFVkpHM0JXVnBjS2g4L0g1cjdoc2ZT?=
 =?utf-8?B?Q1VhUnY0RXFFYUlWa1lmWjYxSGNKcFBaSW5mYmxMdEVkTEJIWGoreXJ6QkRu?=
 =?utf-8?B?Ui9vVHpKUDhnR0FQVXJmSWliUzhGd05USGRnSmkwVXc5enYwRmRmRXhLMFRP?=
 =?utf-8?B?aktyU0JaaFNvTlA4M0VhNnlmYjlGU1B6YlhVVG12V2NYb2VlK0RkSHZXangv?=
 =?utf-8?B?bXhjZmJ4L2M2Ty9taFh1WDQzS1FROE5XTlZBaWRMenA3TUVEZ3JXT0M2dEJD?=
 =?utf-8?B?a2FTU25QcEM4ei9BV242amw1VjN0ZEFIOXpDS3F1bERXUmptY2tYTW8xNFFD?=
 =?utf-8?B?bFVtM1RPd2MvOXo4bTk4TjJ3em9XOTk1c3ZkNGxRaGNHZFpKOEVBS3hCaFo1?=
 =?utf-8?B?M0dYYlFsT3RNT1FIYTRHc2dWMTRzbHpaeHM2bms0N1Y1bmVQL1RKQ25ydUFa?=
 =?utf-8?B?KzkyN3FOU0o2QnNOc1FiYmY0TXNOYzhnM1ZZbUJjWXBPRXFGcVl1dnZjMkZ5?=
 =?utf-8?B?Vi91VXRTQk82VVdxS0xqSzNFVFFOL2E1T0d3RXZKOW94VElkcXNkS2xvendF?=
 =?utf-8?B?YVhkYVFJNzFUMHhZMFB1cmxYNmRYQTZuaWViT2ZWODJXOHM3bGIrbk9nSG5P?=
 =?utf-8?Q?WROCkxqv2/3BBaJE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 466822f5-61c3-433f-baf5-08de4114df0e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 04:45:03.4703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0lV9DpJR9nMLg1g8pf1fgkE9gWmchDGZm/6iWphHz4AumSztGolazzxbyloxIvlO5m0i6PUpDjZtCONEYLg0CFULuXjWytmLGIGTDVTjUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6270
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


On 19-Dec-25 10:39 PM, Marcin Bernatowicz wrote:
> Add a Python script that generates a bpftrace program for tracing
> Xe SR-IOV VF migration (save/restore) activity.
>
> The tool emits a complete bpftrace script to stdout and is intended
> to be used by piping its output to bpftrace, e.g.:
>
>      ./gen_xe_vf_migration_bpftrace.py | bpftrace -
>
> It focuses on migration-related events and metrics useful for
> analyzing VF save/restore flow, latency, and data transfer behavior.

Try to add sample output in the commit message and explain what each 
filed corresponds to.

-Satya.

> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tools/gen_xe_vf_migration_bpftrace.py | 1438 +++++++++++++++++++++++++
>   1 file changed, 1438 insertions(+)
>   create mode 100755 tools/gen_xe_vf_migration_bpftrace.py
>
> diff --git a/tools/gen_xe_vf_migration_bpftrace.py b/tools/gen_xe_vf_migration_bpftrace.py
> new file mode 100755
> index 000000000..8397dc3f4
> --- /dev/null
> +++ b/tools/gen_xe_vf_migration_bpftrace.py
> @@ -0,0 +1,1438 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright(c) 2025 Intel Corporation. All rights reserved.
> +#
> +"""
> +Generator for Xe VF migration bpftrace scripts.
> +
> +Generates a bpftrace script for observing Intel Xe SR-IOV VF activity,
> +focused on migration (save/restore).
> +
> +Events (--events / --omit-events) filter bpftrace probe specs (kprobe/kretprobe)
> +using glob patterns.
> +Defaults: --events='*' --omit-events='*:xe_sriov_vfio_data_*'.
> +
> +Metrics (--metrics / --omit-metrics) filter map names using glob patterns.
> +Default: all metrics enabled.
> +
> +Tracing is organized into blocks, each combining related probes and
> +metric producers (e.g. VFIO save/restore, Xe restore paths).
> +A block is generated if it provides any enabled metric
> +or any of its probes are enabled.
> +
> +If no output file is given, the script is written to stdout (pipe directly into bpftrace).
> +"""
> +
> +from __future__ import annotations
> +
> +import argparse
> +import sys
> +from dataclasses import dataclass
> +from fnmatch import fnmatch
> +from textwrap import dedent
> +from typing import Callable, List, Set, Dict
> +
> +NameFilter = Callable[[str], bool]
> +BlockGen = Callable[[NameFilter, NameFilter], str]
> +
> +def parse_patterns(csv: str | None) -> List[str] | None:
> +    """
> +    Parse a comma-separated list of glob patterns.
> +
> +    Returns a list of non-empty, stripped patterns, or None if the input
> +    is None.
> +    """
> +    if csv is None:
> +        return None
> +    pats = [p.strip() for p in csv.split(",")]
> +    pats = [p for p in pats if p]
> +    return pats
> +
> +
> +def make_name_filter(patterns: List[str] | None,
> +                     default_patterns: List[str] | None) -> NameFilter:
> +    """
> +    Return predicate(name)->bool based on glob patterns.
> +    If patterns is None, use default_patterns.
> +    If final list empty -> always False.
> +    """
> +    pats = patterns if patterns is not None else default_patterns
> +    if not pats:
> +        return lambda _name: False
> +    return lambda name: any(fnmatch(name, pat) for pat in pats)
> +
> +
> +def make_name_filter_with_omit(include_pats: List[str] | None,
> +                               default_include: List[str] | None,
> +                               omit_pats: List[str] | None) -> NameFilter:
> +    """
> +    Create a name filter with optional exclusion patterns.
> +
> +    The returned predicate accepts names that match the include patterns
> +    (or default include patterns) and do not match any of the omit patterns.
> +    """
> +    inc = make_name_filter(include_pats, default_include)
> +    if not omit_pats:
> +        return inc
> +    return lambda name: inc(name) and not any(fnmatch(name, pat) for pat in omit_pats)
> +
> +
> +@dataclass(frozen=True)
> +class Block:
> +    """
> +    Logical tracing block used to generate a portion of a bpftrace script.
> +
> +    A block groups related probes and metric producers and may depend on
> +    other blocks. The generator function emits bpftrace code based on
> +    probe and metric enablement predicates.
> +    """
> +
> +    name: str
> +    probes: List[str]                 # Probe specs (kprobe/kretprobe)
> +    provides: Set[str]                # Metric/map names produced by this block
> +    requires: Set[str]                # Names of other blocks required by this block
> +    gen: BlockGen                     # gen(probe_enabled, metric_enabled) -> bpftrace text
> +    needs_packet_structs: bool = False
> +
> +
> +
> +@dataclass(frozen=True)
> +class MetricDef:
> +    """
> +    Definition of a generated metric.
> +
> +    Describes the metric name and a short human-readable description
> +    used for discovery and listing.
> +    """
> +
> +    name: str
> +    desc: str
> +
> +
> +METRIC_DEFS: List[MetricDef] = [
> +    # ------------------------------------------------------------------
> +    # VFIO
> +    # ------------------------------------------------------------------
> +    MetricDef(
> +        name="vfio_stop_copy_dur_us",
> +        desc="Stop-copy phase duration per VF and save_id (microseconds).",
> +    ),
> +    MetricDef(
> +        name="vfio_stop_copy_dur_hist",
> +        desc="Histogram of stop-copy phase duration per VF (microseconds).",
> +    ),
> +    MetricDef(
> +        name="vfio_stop_copy_size",
> +        desc="Histogram of data size returned by stop-copy operation per VF (bytes).",
> +    ),
> +    MetricDef(
> +        name="vfio_resume_data_dur_us",
> +        desc="Resume-data phase duration per VF and restore_id (microseconds).",
> +    ),
> +    MetricDef(
> +        name="vfio_resume_data_dur_hist",
> +        desc="Histogram of resume-data phase duration per VF (microseconds).",
> +    ),
> +    MetricDef(
> +        name="vfio_suspend_dur_hist",
> +        desc="Histogram of VF suspend operation duration per VF (microseconds).",
> +    ),
> +    MetricDef(
> +        name="vfio_resume_dur_hist",
> +        desc="Histogram of VF resume operation duration per VF (microseconds).",
> +    ),
> +    MetricDef(
> +        name="vfio_flr_wait_dur_hist",
> +        desc="Histogram of time spent waiting for FLR completion per VF (microseconds).",
> +    ),
> +    MetricDef(
> +        name="vfio_read_bytes",
> +        desc="Total bytes read from VFIO migration stream per VF and save_id.",
> +    ),
> +    MetricDef(
> +        name="vfio_read_chunk_size",
> +        desc="Histogram of VFIO read chunk sizes per VF and save_id (bytes).",
> +    ),
> +    MetricDef(
> +        name="vfio_read_chunk_dur_us",
> +        desc="Histogram of VFIO read chunk durations per VF and save_id (microseconds).",
> +    ),
> +    MetricDef(
> +        name="vfio_write_bytes",
> +        desc="Total bytes written to VFIO migration stream per VF and restore_id.",
> +    ),
> +    MetricDef(
> +        name="vfio_write_chunk_size",
> +        desc="Histogram of VFIO write chunk sizes per VF and restore_id (bytes).",
> +    ),
> +    MetricDef(
> +        name="vfio_write_chunk_dur_us",
> +        desc="Histogram of VFIO write chunk durations per VF and restore_id (microseconds).",
> +    ),
> +
> +    MetricDef(
> +        name="vfio_error_count",
> +        desc="Count of VFIO migration-related errors per VF.",
> +    ),
> +    # ------------------------------------------------------------------
> +    # Xe
> +    # ------------------------------------------------------------------
> +    MetricDef(
> +        name="xe_save_start_ts",
> +        desc="Timestamp of Xe VF save start per VF and save_id (nanoseconds).",
> +    ),
> +    MetricDef(
> +        name="xe_save_end_ts",
> +        desc="Timestamp of Xe VF save end per VF and save_id (nanoseconds).",
> +    ),
> +    MetricDef(
> +        name="xe_save_dur_us",
> +        desc="Total Xe VF save duration per VF and save_id (microseconds).",
> +    ),
> +    MetricDef(
> +        name="xe_save_produce_bytes",
> +        desc="Total bytes produced during Xe VF save per VF, save_id, tile, GT, and packet type.",
> +    ),
> +    MetricDef(
> +        name="xe_save_produce_first_ts",
> +        desc=("Timestamp of first produced save packet per VF, save_id, "
> +              "tile, GT, and packet type (nanoseconds)."),
> +    ),
> +    MetricDef(
> +        name="xe_save_produce_last_ts",
> +        desc=("Timestamp of last produced save packet per VF, save_id, "
> +              "tile, GT, and packet type (nanoseconds)."),
> +    ),
> +    MetricDef(
> +        name="xe_save_produce_pkt_dur_us",
> +        desc=("Histogram of Xe save packet production duration per VF, "
> +              "save_id, and packet type (microseconds)."),
> +    ),
> +    MetricDef(
> +        name="xe_save_produce_pkt_size",
> +        desc="Histogram of Xe save packet sizes per VF, save_id, and packet type (bytes).",
> +    ),
> +    MetricDef(
> +        name="xe_restore_start_ts",
> +        desc="Timestamp of Xe VF restore start per VF and restore_id (nanoseconds).",
> +    ),
> +    MetricDef(
> +        name="xe_restore_end_ts",
> +        desc="Timestamp of Xe VF restore end per VF and restore_id (nanoseconds).",
> +    ),
> +    MetricDef(
> +        name="xe_restore_dur_us",
> +        desc="Total Xe VF restore duration per VF and restore_id (microseconds).",
> +    ),
> +    MetricDef(
> +        name="xe_restore_bytes",
> +        desc=("Total bytes restored during Xe VF restore per VF, restore_id, "
> +              "tile, GT, and packet type."),
> +    ),
> +    MetricDef(
> +        name="xe_restore_first_ts",
> +        desc=("Timestamp of first restored packet per VF, restore_id, tile, "
> +              "GT, and packet type (nanoseconds)."),
> +    ),
> +    MetricDef(
> +        name="xe_restore_last_ts",
> +        desc=("Timestamp of last restored packet per VF, restore_id, tile, "
> +              "GT, and packet type (nanoseconds)."),
> +    ),
> +    MetricDef(
> +        name="xe_restore_pkt_dur_us",
> +        desc=("Histogram of Xe restore packet processing duration per VF, "
> +              "restore_id, and packet type (microseconds)."),
> +    ),
> +    MetricDef(
> +        name="xe_restore_pkt_size",
> +        desc="Histogram of Xe restore packet sizes per VF, restore_id, and packet type (bytes).",
> +    ),
> +]
> +
> +ALL_METRICS = [m.name for m in METRIC_DEFS]
> +
> +def gen_preamble() -> str:
> +    return dedent("""\
> +        #!/usr/bin/env bpftrace
> +        /* Auto-generated by gen_xe_vf_migration_bpftrace.py */
> +    """)
> +
> +
> +def gen_packet_structs_header() -> str:
> +    return dedent("""\
> +        /* Minimal subset of structs we need for packet decode */
> +        enum xe_sriov_packet_type {
> +            XE_SRIOV_PACKET_TYPE_DESCRIPTOR = 1,
> +            XE_SRIOV_PACKET_TYPE_TRAILER,
> +            XE_SRIOV_PACKET_TYPE_GGTT,
> +            XE_SRIOV_PACKET_TYPE_MMIO,
> +            XE_SRIOV_PACKET_TYPE_GUC,
> +            XE_SRIOV_PACKET_TYPE_VRAM,
> +        };
> +
> +        struct xe_sriov_packet_hdr {
> +            unsigned char       version;
> +            unsigned char       type;
> +            unsigned char       tile_id;
> +            unsigned char       gt_id;
> +            unsigned int        flags;
> +            unsigned long long  offset;
> +            unsigned long long  size;
> +        };
> +
> +        struct xe_sriov_packet {
> +            void                *xe;
> +            void                *vaddr;
> +            unsigned long       remaining;
> +            unsigned long       hdr_remaining;
> +            void                *bo;
> +            struct xe_sriov_packet_hdr hdr;
> +        };
> +
> +    """)
> +
> +
> +def gen_begin() -> str:
> +    """Generate the BEGIN block."""
> +    return dedent(r"""
> +        BEGIN
> +        {
> +            printf("Tracing VF events ... Hit Ctrl-C to end.\n");
> +        }
> +
> +    """)
> +
> +
> +# -----------------------------------------------------------------------------
> +# Block generators
> +# -----------------------------------------------------------------------------
> +
> +def gen_vfio_stop_copy_phase(probe_enabled, metric_enabled) -> str:
> +    p_enter = "kprobe:xe_sriov_vfio_stop_copy_enter"
> +    p_exit  = "kretprobe:xe_sriov_vfio_stop_copy_exit"
> +
> +    ev_enter = (
> +        f'            printf("ts=%llu ev={p_enter} vf=%u save_id=%d\\n", nsecs, $vfid, $vfio_sid);'
> +        if probe_enabled(p_enter) else ""
> +    )
> +
> +    if probe_enabled(p_exit):
> +        if metric_enabled("vfio_read_bytes"):
> +            ev_exit = (
> +                "            $rb = @vfio_read_bytes[$vfid,$vfio_sid];\n"
> +                f'            printf("ts=%llu ev={p_exit} vf=%u save_id=%d ret=%d vfio_read_bytes=%llu dur_us=%llu\\n", '
> +                "nsecs, $vfid, $vfio_sid, $ret, $rb, $dur_us);"
> +            )
> +        else:
> +            ev_exit = (
> +                f'            printf("ts=%llu ev={p_exit} vf=%u save_id=%d ret=%d dur_us=%llu\\n", '
> +                "nsecs, $vfid, $vfio_sid, $ret, $dur_us);"
> +            )
> +    else:
> +        ev_exit = ""
> +
> +    return dedent(f"""\
> +        kprobe:xe_sriov_vfio_stop_copy_enter
> +        {{
> +            $vfid = (uint32)arg1;
> +            @vfio_stop_copy_start[$vfid] = nsecs;
> +            @vfio_stop_copy_vfid[tid]    = $vfid;
> +
> +            /* VFIO save epoch delimiter */
> +            @vfio_save_id[$vfid] += 1;
> +            $vfio_sid = @vfio_save_id[$vfid];
> +{ev_enter}
> +        }}
> +
> +        kretprobe:xe_sriov_vfio_stop_copy_exit
> +        /@vfio_stop_copy_vfid[tid]/
> +        {{
> +            $vfid = @vfio_stop_copy_vfid[tid];
> +            delete(@vfio_stop_copy_vfid[tid]);
> +
> +            $ret = (int32)retval;
> +
> +            $start = @vfio_stop_copy_start[$vfid];
> +            $vfio_sid = @vfio_save_id[$vfid];
> +            if ($start) {{
> +                $dur_us = (nsecs - $start) / 1000;
> +                @vfio_stop_copy_dur_us[$vfid,$vfio_sid] = $dur_us;
> +                @vfio_stop_copy_dur_hist[$vfid] = hist($dur_us);
> +                delete(@vfio_stop_copy_start[$vfid]);
> +            }}
> +{ev_exit}
> +        }}
> +
> +    """)
> +
> +
> +def gen_vfio_resume_data_phase(probe_enabled, metric_enabled) -> str:
> +    p_enter = "kprobe:xe_sriov_vfio_resume_data_enter"
> +    p_exit  = "kretprobe:xe_sriov_vfio_resume_data_exit"
> +
> +    ev_enter = (
> +        f'            printf("ts=%llu ev={p_enter} vf=%u restore_id=%d\\n", nsecs, $vfid, $vfio_rid);'
> +        if probe_enabled(p_enter) else ""
> +    )
> +
> +    if probe_enabled(p_exit):
> +        if metric_enabled("vfio_write_bytes"):
> +            ev_exit = (
> +                "            $wb = @vfio_write_bytes[$vfid,$vfio_rid];\n"
> +                f'            printf("ts=%llu ev={p_exit} vf=%u restore_id=%d ret=%d vfio_write_bytes=%llu dur_us=%llu\\n", '
> +                "nsecs, $vfid, $vfio_rid, $ret, $wb, $dur_us);"
> +            )
> +        else:
> +            ev_exit = (
> +                f'            printf("ts=%llu ev={p_exit} vf=%u restore_id=%d ret=%d dur_us=%llu\\n", '
> +                "nsecs, $vfid, $vfio_rid, $ret, $dur_us);"
> +            )
> +    else:
> +        ev_exit = ""
> +
> +    return dedent(f"""\
> +        kprobe:xe_sriov_vfio_resume_data_enter
> +        {{
> +            $vfid = (uint32)arg1;
> +            @vfio_resume_data_start[$vfid] = nsecs;
> +            @vfio_resume_data_vfid[tid]    = $vfid;
> +
> +            /* VFIO restore epoch delimiter */
> +            @vfio_restore_id[$vfid] += 1;
> +            $vfio_rid = @vfio_restore_id[$vfid];
> +{ev_enter}
> +        }}
> +
> +        kretprobe:xe_sriov_vfio_resume_data_exit
> +        /@vfio_resume_data_vfid[tid]/
> +        {{
> +            $vfid = @vfio_resume_data_vfid[tid];
> +            delete(@vfio_resume_data_vfid[tid]);
> +
> +            $ret  = (int32)retval;
> +            $start = @vfio_resume_data_start[$vfid];
> +            $vfio_rid = @vfio_restore_id[$vfid];
> +            if ($start) {{
> +                $dur_us = (nsecs - $start) / 1000;
> +                @vfio_resume_data_dur_us[$vfid,$vfio_rid] = $dur_us;
> +                @vfio_resume_data_dur_hist[$vfid] = hist($dur_us);
> +                delete(@vfio_resume_data_start[$vfid]);
> +            }}
> +{ev_exit}
> +        }}
> +
> +    """)
> +
> +
> +def gen_vfio_suspend_phase(probe_enabled, metric_enabled) -> str:
> +    p_enter = "kprobe:xe_sriov_vfio_suspend_device"
> +    p_exit  = "kretprobe:xe_sriov_vfio_suspend_device"
> +
> +    want_hist = metric_enabled("vfio_suspend_dur_hist")
> +
> +    ev_enter = (
> +        f'            printf("ts=%llu ev={p_enter} vf=%u\\n", nsecs, $vfid);'
> +        if probe_enabled(p_enter) else ""
> +    )
> +    ev_exit = (
> +        f'            printf("ts=%llu ev={p_exit} vf=%u ret=%d dur_us=%llu\\n", nsecs, $vfid, $ret, $dur_us);'
> +        if probe_enabled(p_exit) else ""
> +    )
> +
> +    store = "            @vfio_suspend_dur_hist[$vfid] = hist($dur_us);" if want_hist else ""
> +
> +    return dedent(f"""\
> +        kprobe:xe_sriov_vfio_suspend_device
> +        {{
> +            $vfid = (uint32)arg1;
> +            @vfio_suspend_start[$vfid] = nsecs;
> +            @vfio_suspend_vfid[tid]    = $vfid;
> +{ev_enter}
> +        }}
> +
> +        kretprobe:xe_sriov_vfio_suspend_device
> +        /@vfio_suspend_vfid[tid]/
> +        {{
> +            $vfid = @vfio_suspend_vfid[tid];
> +            delete(@vfio_suspend_vfid[tid]);
> +
> +            $ret  = (int32)retval;
> +            $start = @vfio_suspend_start[$vfid];
> +
> +            $dur_us = 0;
> +            if ($start) {{
> +                $dur_us = (nsecs - $start) / 1000;
> +{store if store else ""}
> +                delete(@vfio_suspend_start[$vfid]);
> +            }}
> +{ev_exit}
> +        }}
> +
> +    """)
> +
> +
> +def gen_vfio_resume_phase(probe_enabled, metric_enabled) -> str:
> +    p_enter = "kprobe:xe_sriov_vfio_resume_device"
> +    p_exit  = "kretprobe:xe_sriov_vfio_resume_device"
> +
> +    want_hist = metric_enabled("vfio_resume_dur_hist")
> +
> +    ev_enter = (
> +        f'            printf("ts=%llu ev={p_enter} vf=%u\\n", nsecs, $vfid);'
> +        if probe_enabled(p_enter) else ""
> +    )
> +    ev_exit = (
> +        f'            printf("ts=%llu ev={p_exit} vf=%u ret=%d dur_us=%llu\\n", nsecs, $vfid, $ret, $dur_us);'
> +        if probe_enabled(p_exit) else ""
> +    )
> +
> +    store = "            @vfio_resume_dur_hist[$vfid] = hist($dur_us);" if want_hist else ""
> +
> +    return dedent(f"""\
> +        kprobe:xe_sriov_vfio_resume_device
> +        {{
> +            $vfid = (uint32)arg1;
> +            @vfio_resume_start[$vfid] = nsecs;
> +            @vfio_resume_vfid[tid]    = $vfid;
> +{ev_enter}
> +        }}
> +
> +        kretprobe:xe_sriov_vfio_resume_device
> +        /@vfio_resume_vfid[tid]/
> +        {{
> +            $vfid = @vfio_resume_vfid[tid];
> +            delete(@vfio_resume_vfid[tid]);
> +
> +            $ret  = (int32)retval;
> +            $start = @vfio_resume_start[$vfid];
> +
> +            $dur_us = 0;
> +            if ($start) {{
> +                $dur_us = (nsecs - $start) / 1000;
> +{store if store else ""}
> +                delete(@vfio_resume_start[$vfid]);
> +            }}
> +{ev_exit}
> +        }}
> +
> +    """)
> +
> +
> +def gen_vfio_flr_wait_phase(probe_enabled, metric_enabled) -> str:
> +    p_enter = "kprobe:xe_sriov_vfio_wait_flr_done"
> +    p_exit  = "kretprobe:xe_sriov_vfio_wait_flr_done"
> +
> +    want_hist = metric_enabled("vfio_flr_wait_dur_hist")
> +
> +    ev_enter = (
> +        f'            printf("ts=%llu ev={p_enter} vf=%u\\n", nsecs, $vfid);'
> +        if probe_enabled(p_enter) else ""
> +    )
> +    ev_exit = (
> +        f'            printf("ts=%llu ev={p_exit} vf=%u ret=%d dur_us=%llu\\n", nsecs, $vfid, $ret, $dur_us);'
> +        if probe_enabled(p_exit) else ""
> +    )
> +
> +    store = "            @vfio_flr_wait_dur_hist[$vfid] = hist($dur_us);" if want_hist else ""
> +
> +    return dedent(f"""\
> +        kprobe:xe_sriov_vfio_wait_flr_done
> +        {{
> +            $vfid = (uint32)arg1;
> +            @vfio_flr_wait_start[$vfid] = nsecs;
> +            @vfio_flr_wait_vfid[tid]    = $vfid;
> +{ev_enter}
> +        }}
> +
> +        kretprobe:xe_sriov_vfio_wait_flr_done
> +        /@vfio_flr_wait_vfid[tid]/
> +        {{
> +            $vfid = @vfio_flr_wait_vfid[tid];
> +            delete(@vfio_flr_wait_vfid[tid]);
> +
> +            $ret  = (int32)retval;
> +            $start = @vfio_flr_wait_start[$vfid];
> +
> +            $dur_us = 0;
> +            if ($start) {{
> +                $dur_us = (nsecs - $start) / 1000;
> +{store if store else ""}
> +                delete(@vfio_flr_wait_start[$vfid]);
> +            }}
> +{ev_exit}
> +        }}
> +
> +    """)
> +
> +
> +def gen_vfio_stop_copy_size(probe_enabled, metric_enabled) -> str:
> +    p_exit = "kretprobe:xe_sriov_vfio_stop_copy_size"
> +    want_hist = metric_enabled("vfio_stop_copy_size")
> +
> +    ev = (
> +        f'            printf("ts=%llu ev={p_exit} vf=%u size=%lld dur_us=%llu\\n", nsecs, $vfid, $size, $dur_us);'
> +        if probe_enabled(p_exit) else ""
> +    )
> +
> +    store = "            @vfio_stop_copy_size[$vfid] = hist($size);" if want_hist else ""
> +
> +    return dedent(f"""\
> +        kprobe:xe_sriov_vfio_stop_copy_size
> +        {{
> +            $vfid = (uint32)arg1;
> +            @vfio_stop_copy_size_start[$vfid] = nsecs;
> +            @vfio_stop_copy_size_vfid[tid]    = $vfid;
> +        }}
> +
> +        kretprobe:xe_sriov_vfio_stop_copy_size
> +        /@vfio_stop_copy_size_vfid[tid]/
> +        {{
> +            $vfid = @vfio_stop_copy_size_vfid[tid];
> +            delete(@vfio_stop_copy_size_vfid[tid]);
> +            $start = @vfio_stop_copy_size_start[$vfid];
> +            delete(@vfio_stop_copy_size_start[$vfid]);
> +
> +            $dur_us = (nsecs - $start) / 1000;
> +            $size   = (int64)retval;
> +{store if store else ""}
> +{ev}
> +        }}
> +
> +    """)
> +
> +
> +def gen_vfio_read_write(probe_enabled, metric_enabled) -> str:
> +    p_r_exit = "kretprobe:xe_sriov_vfio_data_read"
> +    p_w_exit = "kretprobe:xe_sriov_vfio_data_write"
> +
> +    want_read_bytes      = metric_enabled("vfio_read_bytes")
> +    want_read_chunk_size = metric_enabled("vfio_read_chunk_size")
> +    want_read_chunk_dur  = metric_enabled("vfio_read_chunk_dur_us")
> +
> +    want_write_bytes      = metric_enabled("vfio_write_bytes")
> +    want_write_chunk_size = metric_enabled("vfio_write_chunk_size")
> +    want_write_chunk_dur  = metric_enabled("vfio_write_chunk_dur_us")
> +
> +    ev_read = (
> +        f'            printf("ts=%llu ev={p_r_exit} vf=%u save_id=%u bytes=%llu dur_us=%llu\\n", '
> +        "nsecs, $vfid, $sid, $len, $dur_us);"
> +        if probe_enabled(p_r_exit) else ""
> +    )
> +    ev_write = (
> +        f'            printf("ts=%llu ev={p_w_exit} vf=%u restore_id=%u bytes=%llu dur_us=%llu\\n", '
> +        "nsecs, $vfid, $rid, $len, $dur_us);"
> +        if probe_enabled(p_w_exit) else ""
> +    )
> +
> +    read_updates = []
> +    if want_read_bytes:
> +        read_updates.append("            @vfio_read_bytes[$vfid,$sid] += $len;")
> +    if want_read_chunk_size:
> +        read_updates.append("            @vfio_read_chunk_size[$vfid,$sid] = hist($len);")
> +    if want_read_chunk_dur:
> +        read_updates.append("            @vfio_read_chunk_dur_us[$vfid,$sid] = hist($dur_us);")
> +    read_upd = "\n".join(read_updates)
> +
> +    write_updates = []
> +    if want_write_bytes:
> +        write_updates.append("            @vfio_write_bytes[$vfid,$rid] += $len;")
> +    if want_write_chunk_size:
> +        write_updates.append("            @vfio_write_chunk_size[$vfid,$rid] = hist($len);")
> +    if want_write_chunk_dur:
> +        write_updates.append("            @vfio_write_chunk_dur_us[$vfid,$rid] = hist($dur_us);")
> +    write_upd = "\n".join(write_updates)
> +
> +    return dedent(f"""\
> +        kprobe:xe_sriov_vfio_data_read
> +        {{
> +            @xe_sriov_vfio_data_read_vfid[tid]   = (uint32)arg1;
> +            @xe_sriov_vfio_data_read_len[tid]    = (uint64)arg3;  /* xe, vfid, buf, len */
> +            @xe_sriov_vfio_data_read_start[tid]  = nsecs;
> +        }}
> +
> +        kretprobe:xe_sriov_vfio_data_read
> +        /@xe_sriov_vfio_data_read_start[tid]/
> +        {{
> +            $vfid = @xe_sriov_vfio_data_read_vfid[tid];
> +            delete(@xe_sriov_vfio_data_read_vfid[tid]);
> +            $len = @xe_sriov_vfio_data_read_len[tid];
> +            delete(@xe_sriov_vfio_data_read_len[tid]);
> +
> +            $sid = @vfio_save_id[$vfid];
> +
> +            $start = @xe_sriov_vfio_data_read_start[tid];
> +            $dur_us = (nsecs - $start) / 1000;
> +            delete(@xe_sriov_vfio_data_read_start[tid]);
> +
> +{read_upd if read_upd else ""}
> +{ev_read}
> +        }}
> +
> +        kprobe:xe_sriov_vfio_data_write
> +        {{
> +            @xe_sriov_vfio_data_write_vfid[tid]  = (uint32)arg1;
> +            @xe_sriov_vfio_data_write_len[tid]   = (uint64)arg3;  /* xe, vfid, buf, len */
> +            @xe_sriov_vfio_data_write_start[tid] = nsecs;
> +        }}
> +
> +        kretprobe:xe_sriov_vfio_data_write
> +        /@xe_sriov_vfio_data_write_start[tid]/
> +        {{
> +            $vfid = @xe_sriov_vfio_data_write_vfid[tid];
> +            delete(@xe_sriov_vfio_data_write_vfid[tid]);
> +            $len = @xe_sriov_vfio_data_write_len[tid];
> +            delete(@xe_sriov_vfio_data_write_len[tid]);
> +
> +            $rid = @vfio_restore_id[$vfid];
> +
> +            $start = @xe_sriov_vfio_data_write_start[tid];
> +            $dur_us = (nsecs - $start) / 1000;
> +            delete(@xe_sriov_vfio_data_write_start[tid]);
> +
> +{write_upd if write_upd else ""}
> +{ev_write}
> +        }}
> +
> +    """)
> +
> +
> +def gen_vfio_error(probe_enabled, metric_enabled) -> str:
> +    p = "kprobe:xe_sriov_vfio_error"
> +    want_count = metric_enabled("vfio_error_count")
> +
> +    ev = (
> +        f'            printf("ts=%llu ev={p} vf=%u\\n", nsecs, $vfid);'
> +        if probe_enabled(p) else ""
> +    )
> +
> +    store = "            @vfio_error_count[$vfid] = count();" if want_count else ""
> +
> +    return dedent(f"""\
> +        kprobe:xe_sriov_vfio_error
> +        {{
> +            $vfid = (uint32)arg1;
> +{store if store else ""}
> +{ev}
> +        }}
> +
> +    """)
> +
> +
> +def gen_xe_control_save_restore(probe_enabled, metric_enabled) -> str:
> +    p_save_start = "kprobe:xe_sriov_pf_control_trigger_save_vf"
> +    p_save_end   = "kretprobe:xe_sriov_pf_control_finish_save_vf"
> +    p_rest_start = "kprobe:xe_sriov_pf_control_trigger_restore_vf"
> +    p_rest_end   = "kretprobe:xe_sriov_pf_control_finish_restore_vf"
> +
> +    want_save_start = metric_enabled("xe_save_start_ts")
> +    want_save_end   = metric_enabled("xe_save_end_ts")
> +    want_save_dur   = metric_enabled("xe_save_dur_us")
> +
> +    want_rest_start = metric_enabled("xe_restore_start_ts")
> +    want_rest_end   = metric_enabled("xe_restore_end_ts")
> +    want_rest_dur   = metric_enabled("xe_restore_dur_us")
> +
> +    # We must record start_ts if either:
> +    # - user wants it as a metric, OR
> +    # - user wants duration metric, OR
> +    # - user wants an end event that prints dur_us (needs start_ts).
> +    need_save_start_ts_for_window = want_save_start or want_save_dur or probe_enabled(p_save_end)
> +    need_rest_start_ts_for_window = want_rest_start or want_rest_dur or probe_enabled(p_rest_end)
> +
> +    ev_save_start = (
> +        f'            printf("ts=%llu ev={p_save_start} vf=%u save_id=%u\\n", nsecs, $vfid, $sid);'
> +        if probe_enabled(p_save_start) else ""
> +    )
> +    ev_save_end = (
> +        f'            printf("ts=%llu ev={p_save_end} vf=%u save_id=%u ret=%d dur_us=%llu\\n", nsecs, $vfid, $sid, $ret, $dur_us);'
> +        if probe_enabled(p_save_end) else ""
> +    )
> +    ev_rest_start = (
> +        f'            printf("ts=%llu ev={p_rest_start} vf=%u restore_id=%u\\n", nsecs, $vfid, $rid);'
> +        if probe_enabled(p_rest_start) else ""
> +    )
> +    ev_rest_end = (
> +        f'            printf("ts=%llu ev={p_rest_end} vf=%u restore_id=%u ret=%d dur_us=%llu\\n", nsecs, $vfid, $rid, $ret, $dur_us);'
> +        if probe_enabled(p_rest_end) else ""
> +    )
> +
> +    save_start_store = "            @xe_save_start_ts[$vfid,$sid] = nsecs;" if (need_save_start_ts_for_window and want_save_start) else ""
> +
> +    if need_save_start_ts_for_window and not want_save_start:
> +        save_start_store = "            @xe_save_start_ts[$vfid,$sid] = nsecs;"
> +
> +    rest_start_store = "            @xe_restore_start_ts[$vfid,$rid] = nsecs;" if (need_rest_start_ts_for_window and want_rest_start) else ""
> +    if need_rest_start_ts_for_window and not want_rest_start:
> +        rest_start_store = "            @xe_restore_start_ts[$vfid,$rid] = nsecs;"
> +
> +    save_end_store_lines = []
> +    if want_save_end:
> +        save_end_store_lines.append("            @xe_save_end_ts[$vfid,$sid] = nsecs;")
> +    if want_save_dur:
> +        save_end_store_lines.append("            @xe_save_dur_us[$vfid,$sid] = $dur_us;")
> +    save_end_store = "\n".join(save_end_store_lines)
> +
> +    rest_end_store_lines = []
> +    if want_rest_end:
> +        rest_end_store_lines.append("            @xe_restore_end_ts[$vfid,$rid] = nsecs;")
> +    if want_rest_dur:
> +        rest_end_store_lines.append("            @xe_restore_dur_us[$vfid,$rid] = $dur_us;")
> +    rest_end_store = "\n".join(rest_end_store_lines)
> +
> +    return dedent(f"""\
> +        kprobe:xe_sriov_pf_control_trigger_save_vf
> +        {{
> +            $vfid = (uint32)arg1;
> +            @xe_save_id[$vfid] += 1;
> +            $sid  = @xe_save_id[$vfid];
> +{save_start_store if save_start_store else ""}
> +{ev_save_start}
> +        }}
> +
> +        kprobe:xe_sriov_pf_control_finish_save_vf
> +        {{
> +            @xe_finish_save_vfid[tid] = (uint32)arg1;
> +        }}
> +
> +        kretprobe:xe_sriov_pf_control_finish_save_vf
> +        /@xe_finish_save_vfid[tid]/
> +        {{
> +            $vfid = @xe_finish_save_vfid[tid];
> +            delete(@xe_finish_save_vfid[tid]);
> +
> +            $ret = (int32)retval;
> +
> +            $sid = @xe_save_id[$vfid];
> +
> +            $dur_us = 0;
> +            $start = @xe_save_start_ts[$vfid,$sid];
> +            if ($start) {{
> +                $dur_us = (nsecs - $start) / 1000;
> +            }}
> +
> +{save_end_store if save_end_store else ""}
> +{ev_save_end}
> +        }}
> +
> +        kprobe:xe_sriov_pf_control_trigger_restore_vf
> +        {{
> +            $vfid = (uint32)arg1;
> +            @xe_restore_id[$vfid] += 1;
> +            $rid  = @xe_restore_id[$vfid];
> +{rest_start_store if rest_start_store else ""}
> +{ev_rest_start}
> +        }}
> +
> +        kprobe:xe_sriov_pf_control_finish_restore_vf
> +        {{
> +            @xe_finish_restore_vfid[tid] = (uint32)arg1;
> +        }}
> +
> +        kretprobe:xe_sriov_pf_control_finish_restore_vf
> +        /@xe_finish_restore_vfid[tid]/
> +        {{
> +            $vfid = @xe_finish_restore_vfid[tid];
> +            delete(@xe_finish_restore_vfid[tid]);
> +
> +            $ret = (int32)retval;
> +
> +            $rid = @xe_restore_id[$vfid];
> +
> +            $dur_us = 0;
> +            $start = @xe_restore_start_ts[$vfid,$rid];
> +            if ($start) {{
> +                $dur_us = (nsecs - $start) / 1000;
> +            }}
> +
> +{rest_end_store if rest_end_store else ""}
> +{ev_rest_end}
> +        }}
> +
> +        """)
> +
> +
> +def gen_xe_restore_packets(probe_enabled, metric_enabled) -> str:
> +    want_bytes    = metric_enabled("xe_restore_bytes")
> +    want_first_ts = metric_enabled("xe_restore_first_ts")
> +    want_last_ts  = metric_enabled("xe_restore_last_ts")
> +    want_pkt_dur  = metric_enabled("xe_restore_pkt_dur_us")
> +    want_pkt_size = metric_enabled("xe_restore_pkt_size")
> +
> +    def one(pfx: str, probe: str) -> str:
> +        p_exit = f"kretprobe:{probe}"
> +
> +        ev_print = (
> +            f'                    printf("ts=%llu ev={p_exit} vf=%u restore_id=%u pkt_type=%u tile=%u gt=%u offset=%llu size=%llu dur_us=%llu\\n", '
> +            "nsecs, $vfid, $rid, $type, $tile, $gtid, $off, $size, $dur_us);"
> +            if probe_enabled(p_exit) else ""
> +        )
> +
> +        store_lines: List[str] = []
> +
> +        if want_bytes:
> +            store_lines.append("                        @xe_restore_bytes[$vfid, $rid, $tile, $gtid, $type] += $size;")
> +
> +        if want_first_ts:
> +            store_lines.append(
> +                "                        if (@xe_restore_first_ts[$vfid, $rid, $tile, $gtid, $type] == 0) {"
> +                " @xe_restore_first_ts[$vfid, $rid, $tile, $gtid, $type] = nsecs; }"
> +            )
> +
> +        if want_last_ts:
> +            store_lines.append("                        @xe_restore_last_ts[$vfid, $rid, $tile, $gtid, $type] = nsecs;")
> +
> +        if want_pkt_dur:
> +            store_lines.append("                        if ($dur_us > 0) { @xe_restore_pkt_dur_us[$vfid, $rid, $type] = hist($dur_us); }")
> +
> +        if want_pkt_size:
> +            store_lines.append("                        @xe_restore_pkt_size[$vfid, $rid, $type] = hist($size);")
> +
> +        store = "\n".join(store_lines)
> +
> +        return dedent(f"""\
> +            kprobe:{probe}
> +            {{
> +                @{pfx}_restore_vfid[tid]       = (uint32)arg1;
> +                @{pfx}_restore_pkt[tid]        = (uint64)arg2;
> +                @{pfx}_restore_call_start[tid] = nsecs;
> +            }}
> +
> +            kretprobe:{probe}
> +            /@{pfx}_restore_call_start[tid]/
> +            {{
> +                $vfid     = @{pfx}_restore_vfid[tid];
> +                $pkt_addr = @{pfx}_restore_pkt[tid];
> +                $ret32    = (int32)retval;
> +
> +                delete(@{pfx}_restore_vfid[tid]);
> +                delete(@{pfx}_restore_pkt[tid]);
> +
> +                $start  = @{pfx}_restore_call_start[tid];
> +                $dur_us = (nsecs - $start) / 1000;
> +                delete(@{pfx}_restore_call_start[tid]);
> +
> +                if ($pkt_addr != 0 && $ret32 == 0) {{
> +                    $pkt   = (struct xe_sriov_packet *)$pkt_addr;
> +                    $type  = $pkt->hdr.type;
> +                    $tile  = $pkt->hdr.tile_id;
> +                    $gtid  = $pkt->hdr.gt_id;
> +                    $off   = $pkt->hdr.offset;
> +                    $size  = $pkt->hdr.size;
> +
> +                    $rid = @xe_restore_id[$vfid];
> +
> +{ev_print}
> +                    if ($rid > 0) {{
> +{store if store else ""}
> +                    }}
> +                }}
> +            }}
> +
> +        """)
> +
> +    return (
> +        one("vram", "xe_gt_sriov_pf_migration_vram_restore")
> +        + one("ggtt", "xe_gt_sriov_pf_migration_ggtt_restore")
> +        + one("guc",  "xe_gt_sriov_pf_migration_guc_restore")
> +        + one("mmio", "xe_gt_sriov_pf_migration_mmio_restore")
> +    )
> +
> +
> +def gen_xe_save_packets(probe_enabled, metric_enabled) -> str:
> +    p_exit = "kretprobe:xe_gt_sriov_pf_migration_save_produce"
> +
> +    want_bytes    = metric_enabled("xe_save_produce_bytes")
> +    want_first_ts = metric_enabled("xe_save_produce_first_ts")
> +    want_last_ts  = metric_enabled("xe_save_produce_last_ts")
> +    want_pkt_dur  = metric_enabled("xe_save_produce_pkt_dur_us")
> +    want_pkt_size = metric_enabled("xe_save_produce_pkt_size")
> +
> +    ev_pkt_save = (
> +        '                $probe = "kretprobe:xe_gt_sriov_pf_migration_save_produce";\n'
> +        '                printf("ts=%llu ev=%s vf=%u save_id=%u pkt_type=%u tile=%u gt=%u offset=%llu size=%llu dur_us=%llu\\n",\n'
> +        '                       nsecs, $probe, $vfid, $sid, $type, $tile, $gtid, $offset, $size, $dur_us);'
> +        if probe_enabled(p_exit) else ""
> +    )
> +
> +    store_lines = []
> +    if want_bytes:
> +        store_lines.append("                    @xe_save_produce_bytes[$vfid, $sid, $tile, $gtid, $type] += $size;")
> +    if want_first_ts:
> +        store_lines.append(
> +            "                    if (@xe_save_produce_first_ts[$vfid, $sid, $tile, $gtid, $type] == 0) {"
> +            " @xe_save_produce_first_ts[$vfid, $sid, $tile, $gtid, $type] = $start; }"
> +        )
> +    if want_last_ts:
> +        store_lines.append("                    @xe_save_produce_last_ts[$vfid, $sid, $tile, $gtid, $type] = nsecs;")
> +    if want_pkt_dur:
> +        store_lines.append("                    if ($dur_us > 0) { @xe_save_produce_pkt_dur_us[$vfid, $sid, $type] = hist($dur_us); }")
> +    if want_pkt_size:
> +        store_lines.append("                    @xe_save_produce_pkt_size[$vfid, $sid, $type] = hist($size);")
> +    store = "\n".join(store_lines)
> +
> +    return dedent(f"""\
> +        kprobe:xe_gt_sriov_pf_migration_ggtt_save
> +        {{
> +            $vfid = (uint32)arg1;
> +            @save_start[tid, XE_SRIOV_PACKET_TYPE_GGTT] = nsecs;
> +        }}
> +
> +        kprobe:xe_gt_sriov_pf_migration_mmio_save
> +        {{
> +            $vfid = (uint32)arg1;
> +            @save_start[tid, XE_SRIOV_PACKET_TYPE_MMIO] = nsecs;
> +        }}
> +
> +        kprobe:xe_gt_sriov_pf_migration_guc_save
> +        {{
> +            $vfid = (uint32)arg1;
> +            @save_start[tid, XE_SRIOV_PACKET_TYPE_GUC] = nsecs;
> +        }}
> +
> +        kprobe:xe_gt_sriov_pf_migration_vram_save
> +        {{
> +            $vfid = (uint32)arg1;
> +            @save_start[tid, XE_SRIOV_PACKET_TYPE_VRAM] = nsecs;
> +        }}
> +
> +        kprobe:xe_gt_sriov_pf_migration_save_produce
> +        {{
> +            @cur_vfid[tid]    = (uint64)arg1;
> +            @cur_pkt_ptr[tid] = (uint64)arg2;
> +        }}
> +
> +        kretprobe:xe_gt_sriov_pf_migration_save_produce
> +        /@cur_pkt_ptr[tid]/
> +        {{
> +            $ret32    = (int32)retval;
> +            $pkt_addr = @cur_pkt_ptr[tid];
> +            $vfid64   = @cur_vfid[tid];
> +
> +            delete(@cur_pkt_ptr[tid]);
> +            delete(@cur_vfid[tid]);
> +
> +            if ($pkt_addr != 0 && $ret32 == 0) {{
> +                $pkt  = (struct xe_sriov_packet *)$pkt_addr;
> +                $vfid = (uint32)$vfid64;
> +
> +                $type   = $pkt->hdr.type;
> +                $tile   = $pkt->hdr.tile_id;
> +                $gtid   = $pkt->hdr.gt_id;
> +                $offset = $pkt->hdr.offset;
> +                $size   = $pkt->hdr.size;
> +
> +                $start = @save_start[tid, $type];
> +                if ($start) {{
> +                    $dur_us = (nsecs - $start) / 1000;
> +                    delete(@save_start[tid, $type]);
> +                }} else {{
> +                    $dur_us = 0;
> +                }}
> +
> +                $sid = @xe_save_id[$vfid];
> +
> +{ev_pkt_save}
> +                if ($sid > 0) {{
> +{store if store else ""}
> +                }}
> +            }}
> +        }}
> +
> +        """)
> +
> +
> +def gen_end_block(metric_enabled: Callable[[str], bool]) -> str:
> +    def emit_metric_lines(metric: str) -> str:
> +        return f"    print(@{metric});\n    clear(@{metric});\n"
> +
> +    sections = [
> +        ("VFIO stop-copy duration per vf,save_id", [
> +            "vfio_stop_copy_dur_us",
> +            "vfio_stop_copy_dur_hist",
> +            "vfio_stop_copy_size",
> +        ]),
> +        ("VFIO resume-data duration per vf,restore_id", [
> +            "vfio_resume_data_dur_us",
> +            "vfio_resume_data_dur_hist",
> +        ]),
> +        ("VFIO suspend/resume per vf (us)", [
> +            "vfio_suspend_dur_hist",
> +            "vfio_resume_dur_hist",
> +        ]),
> +        ("VFIO wait FLR durations per vf (us)", [
> +            "vfio_flr_wait_dur_hist",
> +        ]),
> +        ("VFIO migration data per vf,save_id/restore_id", [
> +            "vfio_read_bytes",
> +            "vfio_read_chunk_size",
> +            "vfio_read_chunk_dur_us",
> +            "vfio_write_bytes",
> +            "vfio_write_chunk_size",
> +            "vfio_write_chunk_dur_us",
> +        ]),
> +        ("VFIO error count per vf", [
> +            "vfio_error_count",
> +        ]),
> +        ("Xe save duration per vf,save_id", [
> +            "xe_save_dur_us",
> +            "xe_save_start_ts",
> +            "xe_save_end_ts",
> +        ]),
> +        ("Xe save bytes per vf,save_id,tile,gt,type", [
> +            "xe_save_produce_bytes",
> +        ]),
> +        ("Xe save first_ts per vf,save_id,tile,gt,type (ns)", [
> +            "xe_save_produce_first_ts",
> +        ]),
> +        ("Xe save last_ts per vf,save_id,tile,gt,type (ns)", [
> +            "xe_save_produce_last_ts",
> +        ]),
> +        ("Xe save produce packet durations per vf,save_id,type", [
> +            "xe_save_produce_pkt_dur_us",
> +        ]),
> +        ("Xe save packet size per vf,save_id,type", [
> +            "xe_save_produce_pkt_size",
> +        ]),
> +        ("Xe restore duration per vf,restore_id", [
> +            "xe_restore_dur_us",
> +            "xe_restore_start_ts",
> +            "xe_restore_end_ts",
> +        ]),
> +        ("Xe restore packet per vf,restore_id,tile,gt,type", [
> +            "xe_restore_bytes",
> +        ]),
> +        ("Xe restore packet first_ts per vf,restore_id,tile,gt,type (ns)", [
> +            "xe_restore_first_ts",
> +        ]),
> +        ("Xe restore packet last_ts per vf,restore_id,tile,gt,type (ns)", [
> +            "xe_restore_last_ts",
> +        ]),
> +        ("Xe restore packet duration per vf,restore_id,type", [
> +            "xe_restore_pkt_dur_us",
> +        ]),
> +        ("Xe restore packet size per vf,restore_id,type", [
> +            "xe_restore_pkt_size",
> +        ]),
> +    ]
> +
> +    out = "END\n{\n"
> +    for title, metrics in sections:
> +        enabled = [m for m in metrics if metric_enabled(m)]
> +        if not enabled:
> +            continue
> +        out += f'    printf("\\n=== {title} ===\\n");\n'
> +        for m in enabled:
> +            out += emit_metric_lines(m)
> +        out += "\n"
> +    out += "}\n"
> +
> +    return out
> +
> +
> +# -----------------------------------------------------------------------------
> +# Block registry
> +# -----------------------------------------------------------------------------
> +def build_blocks() -> List[Block]:
> +    """
> +    Build and return the registry of available tracing blocks.
> +
> +    Each block defines its probe set, provided metrics, dependencies, and
> +    a generator function that emits the corresponding bpftrace code.
> +    """
> +    return [
> +        Block(
> +            name="vfio_stop_copy_phase",
> +            probes=["kprobe:xe_sriov_vfio_stop_copy_enter",
> +                    "kretprobe:xe_sriov_vfio_stop_copy_exit"],
> +            provides={"vfio_stop_copy_dur_us", "vfio_stop_copy_dur_hist"},
> +            requires=set(),
> +            gen=gen_vfio_stop_copy_phase,
> +        ),
> +        Block(
> +            name="vfio_resume_data_phase",
> +            probes=["kprobe:xe_sriov_vfio_resume_data_enter",
> +                    "kretprobe:xe_sriov_vfio_resume_data_exit"],
> +            provides={"vfio_resume_data_dur_us", "vfio_resume_data_dur_hist"},
> +            requires=set(),
> +            gen=gen_vfio_resume_data_phase,
> +        ),
> +        Block(
> +            name="vfio_suspend_phase",
> +            probes=["kprobe:xe_sriov_vfio_suspend_device",
> +                    "kretprobe:xe_sriov_vfio_suspend_device"],
> +            provides={"vfio_suspend_dur_hist"},
> +            requires=set(),
> +            gen=gen_vfio_suspend_phase,
> +        ),
> +        Block(
> +            name="vfio_resume_phase",
> +            probes=["kprobe:xe_sriov_vfio_resume_device",
> +                    "kretprobe:xe_sriov_vfio_resume_device"],
> +            provides={"vfio_resume_dur_hist"},
> +            requires=set(),
> +            gen=gen_vfio_resume_phase,
> +        ),
> +        Block(
> +            name="vfio_flr_wait_phase",
> +            probes=["kprobe:xe_sriov_vfio_wait_flr_done",
> +                    "kretprobe:xe_sriov_vfio_wait_flr_done"],
> +            provides={"vfio_flr_wait_dur_hist"},
> +            requires=set(),
> +            gen=gen_vfio_flr_wait_phase,
> +        ),
> +        Block(
> +            name="vfio_stop_copy_size",
> +            probes=["kprobe:xe_sriov_vfio_stop_copy_size",
> +                    "kretprobe:xe_sriov_vfio_stop_copy_size"],
> +            provides={"vfio_stop_copy_size"},
> +            requires=set(),
> +            gen=gen_vfio_stop_copy_size,
> +        ),
> +        Block(
> +            name="vfio_read_write",
> +            probes=[
> +                "kprobe:xe_sriov_vfio_data_read",
> +                "kretprobe:xe_sriov_vfio_data_read",
> +                "kprobe:xe_sriov_vfio_data_write",
> +                "kretprobe:xe_sriov_vfio_data_write",
> +            ],
> +            provides={
> +                "vfio_read_bytes", "vfio_read_chunk_size", "vfio_read_chunk_dur_us",
> +                "vfio_write_bytes", "vfio_write_chunk_size", "vfio_write_chunk_dur_us",
> +            },
> +            requires={"vfio_stop_copy_phase", "vfio_resume_data_phase"},
> +            gen=gen_vfio_read_write,
> +        ),
> +        Block(
> +            name="vfio_error",
> +            probes=["kprobe:xe_sriov_vfio_error"],
> +            provides={"vfio_error_count"},
> +            requires=set(),
> +            gen=gen_vfio_error,
> +        ),
> +        Block(
> +            name="xe_control_save_restore",
> +            probes=[
> +                "kprobe:xe_sriov_pf_control_trigger_save_vf",
> +                "kprobe:xe_sriov_pf_control_finish_save_vf",
> +                "kprobe:xe_sriov_pf_control_trigger_restore_vf",
> +                "kprobe:xe_sriov_pf_control_finish_restore_vf",
> +            ],
> +            provides={"xe_save_start_ts", "xe_save_end_ts", "xe_save_dur_us",
> +                      "xe_restore_start_ts", "xe_restore_end_ts", "xe_restore_dur_us"},
> +            requires=set(),
> +            gen=gen_xe_control_save_restore,
> +        ),
> +        Block(
> +            name="xe_restore_packets",
> +            probes=[
> +                "kprobe:xe_gt_sriov_pf_migration_vram_restore",
> +                "kretprobe:xe_gt_sriov_pf_migration_vram_restore",
> +                "kprobe:xe_gt_sriov_pf_migration_ggtt_restore",
> +                "kretprobe:xe_gt_sriov_pf_migration_ggtt_restore",
> +                "kprobe:xe_gt_sriov_pf_migration_guc_restore",
> +                "kretprobe:xe_gt_sriov_pf_migration_guc_restore",
> +                "kprobe:xe_gt_sriov_pf_migration_mmio_restore",
> +                "kretprobe:xe_gt_sriov_pf_migration_mmio_restore",
> +            ],
> +            provides={"xe_restore_bytes", "xe_restore_first_ts", "xe_restore_last_ts",
> +                      "xe_restore_pkt_dur_us", "xe_restore_pkt_size"},
> +            requires=set(),
> +            gen=gen_xe_restore_packets,
> +            needs_packet_structs=True,
> +        ),
> +        Block(
> +            name="xe_save_packets",
> +            probes=[
> +                "kprobe:xe_gt_sriov_pf_migration_ggtt_save",
> +                "kprobe:xe_gt_sriov_pf_migration_mmio_save",
> +                "kprobe:xe_gt_sriov_pf_migration_guc_save",
> +                "kprobe:xe_gt_sriov_pf_migration_vram_save",
> +                "kprobe:xe_gt_sriov_pf_migration_save_produce",
> +                "kretprobe:xe_gt_sriov_pf_migration_save_produce",
> +            ],
> +            provides={"xe_save_produce_bytes", "xe_save_produce_first_ts",
> +                      "xe_save_produce_last_ts", "xe_save_produce_pkt_dur_us",
> +                      "xe_save_produce_pkt_size"},
> +            requires=set(),
> +            gen=gen_xe_save_packets,
> +            needs_packet_structs=True,
> +        ),
> +    ]
> +
> +
> +def invert_metric_sources(blocks: List[Block]) -> Dict[str, List[str]]:
> +    """Build metric->providers mapping from block registry."""
> +    metric_src: Dict[str, List[str]] = {m: [] for m in ALL_METRICS}
> +    for b in blocks:
> +        for m in b.provides:
> +            if m in metric_src:
> +                metric_src[m].append(b.name)
> +    return metric_src
> +
> +
> +def select_blocks(blocks: List[Block],
> +                  metric_enabled: NameFilter,
> +                  probe_enabled: NameFilter) -> List[Block]:
> +    """Select blocks based on enabled metrics/probes and dependency closure."""
> +    enabled_metrics = {m for m in ALL_METRICS if metric_enabled(m)}
> +    by_name: Dict[str, Block] = {b.name: b for b in blocks}
> +
> +    selected: Set[str] = set()
> +
> +    for b in blocks:
> +        if b.provides & enabled_metrics:
> +            selected.add(b.name)
> +        elif any(probe_enabled(p) for p in b.probes):
> +            selected.add(b.name)
> +
> +    # dependency closure
> +    changed = True
> +    while changed:
> +        changed = False
> +        for name in list(selected):
> +            b = by_name.get(name)
> +            if not b:
> +                continue
> +            for dep in b.requires:
> +                if dep not in selected:
> +                    selected.add(dep)
> +                    changed = True
> +
> +    return [b for b in blocks if b.name in selected]
> +
> +
> +def build_arg_parser() -> argparse.ArgumentParser:
> +    """Create the command-line argument parser."""
> +    ap = argparse.ArgumentParser(description="Generate Xe VF events bpftrace script")
> +    ap.add_argument("output", nargs="?", help="output .bt file; if omitted, write to stdout")
> +
> +    ap.add_argument("--events",
> +                    default="*",
> +                    help="Comma-separated event globs. Default: '*'")
> +    ap.add_argument("--omit-events",
> +                    default="*:xe_sriov_vfio_data_*",
> +                    help="Comma-separated event globs to exclude (applied after --events). "
> +                         "Default: '*:xe_sriov_vfio_data_*'")
> +
> +    ap.add_argument("--metrics",
> +                    help="Comma-separated metric globs, e.g. 'vfio_*,xe_*' or '*'. Default: '*'.")
> +    ap.add_argument("--omit-metrics",
> +                    help="Comma-separated metric globs to exclude (applied after --metrics). "
> +                         "Example: --metrics='*' --omit-metrics='*_pkt_size'")
> +
> +    ap.add_argument("--list-events", action="store_true",
> +                    help="List available probe specs and exit.")
> +    ap.add_argument("--list-metrics", action="store_true",
> +                    help="List available metric names and exit.")
> +    ap.add_argument("--list-blocks", action="store_true", help="List available blocks and exit.")
> +    ap.add_argument("--list-probes", action="store_true", help="List probes per block and exit.")
> +    ap.add_argument("--list-metric-sources", action="store_true",
> +                    help="List which block(s) provide each metric.")
> +
> +    return ap
> +
> +
> +def handle_list_modes(
> +    args: argparse.Namespace,
> +    blocks: List[Block],
> +    metric_src: Dict[str, List[str]],
> +) -> int | None:
> +    """Handle --list-* modes. Returns exit code, or None if not in list-mode."""
> +    if args.list_events:
> +        all_probes = sorted({p for blk in blocks for p in blk.probes})
> +        print("\n".join(all_probes))
> +        return 0
> +
> +    if args.list_metrics:
> +        for metric in METRIC_DEFS:
> +            print(f"{metric.name}\n  {metric.desc}")
> +        return 0
> +
> +    if args.list_blocks:
> +        for blk in blocks:
> +            print(blk.name)
> +        return 0
> +
> +    if args.list_probes:
> +        for blk in blocks:
> +            print(f"{blk.name}:")
> +            for probe in blk.probes:
> +                print(f"  {probe}")
> +        return 0
> +
> +    if args.list_metric_sources:
> +        for metric in ALL_METRICS:
> +            src = metric_src.get(metric, [])
> +            src_s = ", ".join(src) if src else "(none)"
> +            print(f"{metric}: {src_s}")
> +        return 0
> +
> +    return None
> +
> +
> +def build_filters(args: argparse.Namespace) -> tuple[NameFilter, NameFilter]:
> +    """Create probe_enabled and metric_enabled filters from CLI args."""
> +    probe_patterns = parse_patterns(args.events)
> +    omit_probe_patterns = parse_patterns(args.omit_events)
> +    probe_enabled = make_name_filter_with_omit(
> +        probe_patterns,
> +        default_include=['*'],
> +        omit_pats=omit_probe_patterns,
> +    )
> +
> +    metric_patterns = parse_patterns(args.metrics)
> +    omit_metric_patterns = parse_patterns(args.omit_metrics)
> +    metric_enabled = make_name_filter_with_omit(
> +        metric_patterns,
> +        default_include=['*'],
> +        omit_pats=omit_metric_patterns,
> +    )
> +
> +    return probe_enabled, metric_enabled
> +
> +
> +def write_output(text: str, output_path: str | None) -> None:
> +    """Write generated output to a file or stdout."""
> +    if output_path:
> +        with open(output_path, "w", encoding="utf-8") as out:
> +            out.write(text)
> +        return
> +    sys.stdout.write(text)
> +
> +
> +def main(argv=None) -> int:
> +    """Program entry point."""
> +    parser = build_arg_parser()
> +    args = parser.parse_args(argv)
> +
> +    blocks = build_blocks()
> +    metric_src = invert_metric_sources(blocks)
> +
> +    list_rc = handle_list_modes(args, blocks, metric_src)
> +    if list_rc is not None:
> +        return list_rc
> +
> +    probe_enabled, metric_enabled = build_filters(args)
> +
> +    selected_blocks = select_blocks(blocks, metric_enabled, probe_enabled)
> +    need_pkt_structs = any(b.needs_packet_structs for b in selected_blocks)
> +
> +    parts: List[str] = [gen_preamble()]
> +    if need_pkt_structs:
> +        parts.append(gen_packet_structs_header())
> +    parts.append(gen_begin())
> +
> +    for b in selected_blocks:
> +        parts.append(b.gen(probe_enabled, metric_enabled))
> +
> +    parts.append(gen_end_block(metric_enabled))
> +
> +    write_output("".join(parts), args.output)
> +    return 0
> +
> +
> +if __name__ == "__main__":
> +    raise SystemExit(main())
