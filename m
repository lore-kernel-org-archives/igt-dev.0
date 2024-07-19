Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B38C3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 09:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4196710E095;
	Fri, 19 Jul 2024 09:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vi67N44i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A1810E095
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 09:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721381501; x=1752917501;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ni+Gs8x/D1J0k1Ra4S1rw6Vfin8HpzEG9fpNeMWh+gQ=;
 b=Vi67N44iFd6GAIz0dxP8NzI0uHSxs5gFh9SVROPAHSKCuYx40WAVBb2s
 M7K0X1sIPAgS5rRC9qYlnsCQsZxKToNB1wO72GNGuNQlLWmAa/7TAN4ol
 9mAJ2abq/U4WFlb2cUoAsTbZ/MbFAkLi4oXN+/ml2ztBh8HKA/l3WVxXy
 Aj1Az/hW6muz+cRzgZBhCYdX7p5bhrdXsDg1t2K0TVPqPL8NyKkD1Ijf2
 ngye2+brnrkXoKh8ATgEhXE/nMzlGVSNq+af/+TqtEeJbEU/xpH9z85zO
 DnjV4tZrXKW38HL5nTL1EaUQiOAhj3fxAeEP5p88hR+J4cunUUIvzQcbu g==;
X-CSE-ConnectionGUID: 5GRAhECmRgSI6JCztJ4Idg==
X-CSE-MsgGUID: CfLYVECoSAiPeiTpp3Pn3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22852867"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="22852867"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 02:31:40 -0700
X-CSE-ConnectionGUID: DMA1TUvCSNa0qk/k6uSPBg==
X-CSE-MsgGUID: WVcmIR59Q9i05XpEibhWbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="51121008"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 02:31:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 02:31:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 02:31:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 02:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6QJrTPkbSYI2J9PrY3mv9FEd58w5rPzDgRBvdKCh88WX6k4bGx8/K5plQrZjgBC0qyXv4CIZR2pCbOgxU8Io11Ls5ad+e4hDRzaWXvH9k2zMVo+imh3KgcCqAwCDAx/Y41b7Po4E5eYzDO8RGDX1/fApbYPnZNU4pJ8iZ5FOFaoRb9tvuoN2bjGccOIqn9aGTrZuUzspC/CMzkul69GzwiM6vxTK9DDgqJVmR8LpM6eYWEbHIZWLfNcUzXR9D48u5iHpuYp6Admmk4AZLn+MD4A8OCR1NkSK2nzTOzOImzwgtSmDNlSOjOTSe1kma4piMeFnoW2Zv4dndTGC5YV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjZYFTwdBzVp6oJF+iOssWZDmq9sh73besdT9tjuZO8=;
 b=YLP+704pqQciFjLNCuxZldmXUI8O3Z2s2HPlxtdoikP3Y9+MILNPXYrSLL/93SRk+2fnxZGqJM0orV5G8OALB7rC6QvJHLOm7fIziOKpfyW4Fs9HaHWW/b/8XxfNp2VGR7+1KNcsYGNR1QrvrZYs2g43J+HeV9QC7Y8/iWSrtUJFPtjMYK9lbY7kuznMVO3t7xUzuX+VQiHkdtW0BvTLbQ15Wi7vRoPNqUqHfqDs67161q5r6wqexNp2UIFVqBPpyN/exHeykRJu2mM95TksSzN2CqqBc43TCSoDW7ruol514LesIFZtc2okQY0M9ecMlyut2SnWcWNdmvz5DZgfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 09:31:33 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%3]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 09:31:33 +0000
Message-ID: <5725b42c-63ed-4963-9384-028349e839f3@intel.com>
Date: Fri, 19 Jul 2024 15:01:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/kms_pm_dc: Update deep-pkgc function
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <jeevan.b@intel.com>,
 <suraj.kandpal@intel.com>
References: <20240717140556.640124-1-ramanaidu.naladala@intel.com>
 <20240717140556.640124-3-ramanaidu.naladala@intel.com>
 <20240717153101.v4kddn4v7jlvzkpm@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240717153101.v4kddn4v7jlvzkpm@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::22) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|IA1PR11MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: f32c49b8-87d7-4f89-acc2-08dca7d593c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THdmSjFaSXRPV0IyeVNMY1ZZNHVGczJ4U2JZT3c2MmR6YWpkNkpyRkNrOHc4?=
 =?utf-8?B?VzRuOXBGVVhZZUdVQ3h2cG1PY3VjamxhUmtESTUxeUwrUUJ6TExhVk45cEFD?=
 =?utf-8?B?a2RpaGJnT1RoUi9kQkw5N1ZMR0k1ZkJHa2lIVUxpd09pblNrb1hrYkRQc3hM?=
 =?utf-8?B?R0pHbjV0SDUwN0NJcXV5QTR3MCtWaVN0WnpWemNqRGdVak1OMzJCSTRYNnpG?=
 =?utf-8?B?UGdMWWZpdS8rQWU5OGE4RjVadXpZa1lHRnd1cmE1VFNzYTY5dlMrVC9vQUxs?=
 =?utf-8?B?a3hZVk1STEszNG5lQkJDcDZySklMYUo2ZWNwRmQrc0ZQa3JyZHgwRzJ0cnlT?=
 =?utf-8?B?WGYzSkdKWlFCdGdCOTNvN2xKY3dwVU1KKzJiVXVRS21jcUNvSDNKMzFwaDRN?=
 =?utf-8?B?YUxscUVUZWJ3Rmt4VkRqZmNwZThuOXh5N09IVWJaM3FabGFRYy9JV0ZyMytl?=
 =?utf-8?B?dTZ4TkhyZDgzTjM2dXd4VU12MnFmUXBIZVNqRWRsdnZBSEJJR21EMVRScnpJ?=
 =?utf-8?B?eWVuZTZITkZwUFo1bEhjMk8yUmcyMzdyckdHMXU5VDROQVlMVFJJMy85Sk1K?=
 =?utf-8?B?OEQ0amNGYStLb1NHb2dCOHo4bnN2WEdnbnRZVG0rVXpySWRyc0IxU2kwTzkv?=
 =?utf-8?B?SU42WS9LUmtYRkd1QzNBY2d2N05qaGdxbGRxZThrbXRaK2NDKzlLQUxHOEdo?=
 =?utf-8?B?OUQrMW5EVk9acm5rY0dnV1lUblhQY3oyRHJNZlJINUI1TFFnWWtNNzNaR0lQ?=
 =?utf-8?B?NjZ1YWhZREU4Rk1iWWROUXpvK2MraGFjNFVSbkNIMVVhZnFxWjBJUC9tMzJR?=
 =?utf-8?B?UEE2WjZPeER4WXhpOE9jQzJuN1pKdGkwc0hvTDN6bExRbGIrSE1wdCtGcnpq?=
 =?utf-8?B?cFVmOFVFak1TUm1OcWs3Yk9rMGN4VUFZMTA1ZW40ZFpUZWhVV3pRWjR1amdI?=
 =?utf-8?B?aFd1aW5wYXpoRVU2akVqZXJ2Z25LTnpaVE5mN0ErZjlpb29tbUF5dUkxT0hh?=
 =?utf-8?B?VGVJbWdTcGlwOEU5UU43K3d0dTBLcU5WVkluUnlFaFcvS0N4QmNMYkNkM3hH?=
 =?utf-8?B?bWpFNXpwczR4V3VhQlVBNGsyWE1JaXpZbTR4U2RDTGlycEZGaThlQWtvVTJM?=
 =?utf-8?B?Ums1TGdJYno1Sm55U3NEbVErNWlLRFFtVnQvdFBsVXltSFlkVTZlOUdqd1NB?=
 =?utf-8?B?MTZjRm5QTEtoaExjWHg3VWh0QThhM3NqR21CS2lOMHVUcFF4bkJvL1E0Sjhs?=
 =?utf-8?B?NnA5TTZpaU9nZ0VXSUwzWVpLeU5CWTI3WWo1dUZhRngxWVpNSHdxdnBEbUxk?=
 =?utf-8?B?czkwaU1xU2FtODJETWdZQzI1U3AvdzRsd2lFM2x2bU9KSXBRWWNidSs2am12?=
 =?utf-8?B?NHRCM2tJc1N1U0dTQjNON2sydDl3ZkpmZ3JZNm9PNkw2QmNKa3VtWklRdytL?=
 =?utf-8?B?dTJFeTMwQzZlVCtNYi9nSGZEcURtQzBLTmV2VVNmMytxcERSaXozem9UR2hI?=
 =?utf-8?B?c2tPaWJPbGlEVzlvMGVzMWExbVpFTW8yUVVxbG05RkQ2d1NIYXo5NDJZSU1i?=
 =?utf-8?B?N0tZZFB1VWNRM1ArbWJwL0hQUk9TaUlrVGE3KzRwNzArKzhRNGJMSFlJdmMy?=
 =?utf-8?B?Y3hkK3JsVXFFNTRXU2NaWkRpQ2xRZ2pkN2RmaytFbElrRmV5bGVHbTdKL0pl?=
 =?utf-8?B?dDhjZUFBNmNBM29nbnh2UFRjQXk0Ni9hV0xlbm00eXN5c1k1MXlFbmZwVDFC?=
 =?utf-8?B?YktHdC9xeUJ4L3ZVZHYybEwwWmVLMHBXYzBoVHBuZjVGREVLSzhkcENyN0Uy?=
 =?utf-8?B?dDJGQjNSeE9FdTR2YlVVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3N4SVpqOGlYcUk4L2t6ZXlnUXJFUUpSMzZyTVdzZjRSUW9DeHlndVFWcE15?=
 =?utf-8?B?Wk5yMW5aUW5BTlBrcVdBMGs4czQ0TEtvMGI5WWFwMi8wcWRaOHJPV0RjRUNt?=
 =?utf-8?B?T2xXVmk5dlNjYWZOSWtmNXV5NlFLWDBIRlRnZEg0K3NnbFRORkRnZFRKWHJp?=
 =?utf-8?B?aEQvakxHa2tCR0Zid2doYkozaGtoNmxiU01uZTZBeFlmdFB5R0ZDUElKOUpZ?=
 =?utf-8?B?eEhHYjE1TzBGQ3pTTHJvbkRCcWV5L3lUQjQvbzdackM1S3hNWFh4N0s5Y2JW?=
 =?utf-8?B?dDNmZStKbEFia2M2Uy9tNy9aRS9aNmF4ZFE0cjJUeVE4SVFzVVlWMmVVUEtk?=
 =?utf-8?B?WnRNUHVLb2xVazNZM0hZS3FEZCtOQ0ZuMzR2a2cvcklob2UwSHdtM3NMc2ts?=
 =?utf-8?B?cmRNTGExQ05XZndmZW9XMVhNRWt6Q3NEajRQa1RHQVNBbHV2a0xJMFV6ZWVa?=
 =?utf-8?B?SnpCa0FCS21BNG45Ui9ta2d6eldkc1VWWnIrSUw1N1l3VkFLUXVtL3pLSEJT?=
 =?utf-8?B?Rzl0czJJa0h2bC96M2FJVVc3Z1NtUkZrOFFILzVkTmJ3bWJ3ZHl4YkV5amFM?=
 =?utf-8?B?cWRla3pFeUJOcUo4dmdQNDF0cUFHQ29NZURwYzVEcC9BK0ZqVFhpSitwMmVh?=
 =?utf-8?B?ZTFKa2tSZmppRkJsZVN2T0NJcWVYR2dUa2dRY0k2S1ZaRFF4QUJFSUxCWk1C?=
 =?utf-8?B?S0o1QTQ4QTJGZzh4UmtUdVhUaE5QOWo4T3hpNk02b0l4US9yUjU2TE1mblNE?=
 =?utf-8?B?d093dEg2alRCUWdwYjRIR1hZNHliaDl0RHNQekFFaXJBUlVIMWs4K20zYnpI?=
 =?utf-8?B?dTZ3SkF5U3MxQm5XL2xzUnAzbkZsSlJiSmNSM3VNd3I3TllmNldQbGxzanVK?=
 =?utf-8?B?aHZyWGRjVkZKQllFZ3ZPcVh4QmV5S3ZnVENvUVlnYXpZbG1aampPTGp6Nm9v?=
 =?utf-8?B?QzBWMzBiSk51WVc4TW5GMEk0aTcxbGQyeWRUaXlSK2dvT09qR3ZLRy81bUto?=
 =?utf-8?B?TVdRVjFGK01vc2hnU0hUQi9pcWs1b25vcnYzQ0g4VUNROVR0cHhHbXN0dHhR?=
 =?utf-8?B?ek1OVXdEWHRScDE4TEtiUWtsRXFoS1B1cHQyMnpEaHhBMXhxL2VQcmRtSnlT?=
 =?utf-8?B?R1hNNUxnRGFWT3lReDE0UTdaeXlNRHRsUkpuUmtSUlpGYUdKR05hTEl3a0Ez?=
 =?utf-8?B?U29scE1NM0dnQ3A0MmF6TU5ZV1g1dE1YWEFPOGVOK2VXYm45TFovOGNQaUVo?=
 =?utf-8?B?bWlPOWloTmdwTmJiOUJtNW1WQ0lOckpESkFsV29rQzQyd2duSzg1bzZrcFA3?=
 =?utf-8?B?bDB6WXlSWGMvL296WHU5NllWVkhrajVIZXI4TS93WFkxRzZoMTlvM2NZa2Jy?=
 =?utf-8?B?cHdWSnRsY2ZGRHA0em1CZzJHcittOFd2WG5LTWhxaERzNTB5Q2pCSzlSaE4x?=
 =?utf-8?B?ZlgxcXBpSXBYSC9haFBrWjEzc0V3WXN6ZUZmUGUxVGc2S1lUN0REeS9ZYTNx?=
 =?utf-8?B?N3JrTHpMUytLbE0vRXltOEpBZXRaVjhBRm5NY2h0cjhuRzdRcWF4OVVIeTJQ?=
 =?utf-8?B?Q00rZWx3aHJqMm1Rd0ZLR0tYMFRiK2VabjhJOTNNc0Y4M2t1bldFV0NuTWhl?=
 =?utf-8?B?NW5ldmUyNDVUQU8rMTZuVWY2eDNMWVppbXVYYXArOGR0UWZBcFVoemc0TGIr?=
 =?utf-8?B?MzZDdS90NDlnRm1tTjNRUzQxOS9vTjloNVM4YWdqM1gzTVVFbnpnU0EyV0lT?=
 =?utf-8?B?NG9jVk1URzc1aW04eFdjRFU0Y2xSWXdyNGgyR21oRE91cXFGSWRvaFptWnF6?=
 =?utf-8?B?TzBJdEJlT3FOenB1WDVqQS8xTzRMTlVqYkp4U0p2MlhieDhMWk5qb01oMHVM?=
 =?utf-8?B?WXZBSEVka1I3bCtoc1hrOXU5ZHFYZ0s3KzJnUUx1RFk0Yis5UDFsT3d3YTNW?=
 =?utf-8?B?RE4rc0JVaTFiV1hoR3p5bkNLVHpWTVZGajBpQmQ2akxKanlOR2NIa2VJcU9J?=
 =?utf-8?B?OTMzOTdyQUZVQ2QvMHR4NWdoRUNtU0FoemdMMkRKTllHUDFnS0YvTWRsZDE1?=
 =?utf-8?B?RVI0a0lZSXhwSGZrcnY5cE9vaE5ZVm5KTmQ1MEdDelNxaHlhaHI3ZzlNSzFz?=
 =?utf-8?B?VUFyUXpENDZ3TW9hQzlZMnRlb2FjWU5BeHRNK0xRYWs3amtJQnVHbUx3TDJG?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f32c49b8-87d7-4f89-acc2-08dca7d593c0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 09:31:33.1646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYmSj9sztsSLpgYe+6JSBKCx4m4T3e2KZgIr/xe9BTiWA1I2lDT30TLAyl42VE8tMYlvvOQra9bWS+rbav4U+WLXWw53KIQCcKjysCavWJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
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



On 7/17/2024 9:01 PM, Kamil Konieczny wrote:
> Hi Naladala,
> On 2024-07-17 at 19:35:55 +0530, Naladala Ramanaidu wrote:
>> Increased the C-state polling time from its previous value
> 
> Why?
Certain features can prevent timely entry into the C10 state, causing 
inconsistent results. So increase test time to get accurate results.

> 
>> to 4 sec.Implement polling for PKG-C10 counters for every
> 
> Add space after dot '.', s/sec.Implement/sec. Implement/
> 
>> 5ms up to 16ms.
> 
> Same here, write why you need this change.
> 
> Also, imho you should split this into two patches and update subjects:
Sure Kamil. In next rev i will split into two patches.
> 
> [PATCH i-g-t 2/4] tests/intel/kms_pm_dc: Increase C-state polling
> 
> [PATCH i-g-t 3/4] tests/intel/kms_pm_dc: Add polling for deep-pkgc
> 
> Regards,
> Kamil
> 
>>
>> v2: Address and correct review comments (Suraj, Jeevan)
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/intel/kms_pm_dc.c | 18 +++++++++++-------
>>   1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
>> index 8fb35a2df..c1ca3acc0 100644
>> --- a/tests/intel/kms_pm_dc.c
>> +++ b/tests/intel/kms_pm_dc.c
>> @@ -592,7 +592,7 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
>>   static void test_deep_pkgc_state(data_t *data)
>>   {
>>   	unsigned int pre_val = 0, cur_val = 0;
>> -	time_t start = time(NULL), duration = 2, vb_delay, delay;
>> +	time_t start = time(NULL), duration = 4, vb_delay, delay;
>>   	enum pipe pipe;
>>   	bool pkgc_flag = false;
>>   	bool flip = true;
>> @@ -623,10 +623,10 @@ static void test_deep_pkgc_state(data_t *data)
>>   		data->mode = &output->config.connector->modes[j__];
>>   		vb_delay = 1 * (MSECS / (data->mode->vrefresh));
>>   		/*
>> -		 * At least 5ms vblank time required to program higher
>> +		 * At least 5ms vblank time for programming higher
>>   		 * watermark levels
>>   		 */
>> -		if (vb_delay > (5 * MSEC))
>> +		if (vb_delay > (5 * MSECS))
>>   			break;
>>   	}
>>   
>> @@ -635,23 +635,27 @@ static void test_deep_pkgc_state(data_t *data)
>>   	setup_videoplayback(data);
>>   
>>   	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>> -	pre_val = read_pkgc_counter(data->debugfs_root_fd);
>> -	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
>> +	delay = vb_delay * 0.5;
>>   
>>   	igt_plane_set_fb(primary, &data->fb_rgb);
>>   	igt_display_commit(&data->display);
>>   
>> +	/* Waiting for the vblank to sync the frame time */
>> +	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 1);
>> +	usleep(delay);
>> +	pre_val = read_pkgc_counter(data->debugfs_root_fd);
>> +
>>   	while (time(NULL) - start < duration) {
>>   		flip = !flip;
>>   		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
>>   		igt_display_commit(&data->display);
>>   
>> -		cur_val = read_pkgc_counter(data->debugfs_root_fd);
>> +		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
>> +			  vb_delay * 2, 5);
>>   		if (cur_val > pre_val) {
>>   			pkgc_flag = true;
>>   			break;
>>   		}
>> -		usleep(delay);
>>   	}
>>   
>>   	cleanup_dc3co_fbs(data);
>> -- 
>> 2.43.0
>>
