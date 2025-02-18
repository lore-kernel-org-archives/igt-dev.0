Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46937C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 13:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0355610E09E;
	Tue, 18 Feb 2025 13:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kcl72THn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C3610E09E
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 13:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739883956; x=1771419956;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X3L25zQEFbFQEqgEXEe8W6lqSgwpvFo0bwz4OMdfUuQ=;
 b=Kcl72THnq0mBkfX//1noLbmwFfohIk2zmRCjrx4vlU2BsUP1JfgC/BqP
 rZh+N5HtmANIV7BSPCSgOX3YJqYlSmzcKDXKtE8xZUW8AnQjZckXyWJC4
 q5lJIp0XHruTUufdNOL4pvc4YRPJ7igtD/4RStWx9ZavesCu81ZwBQtvl
 z5mTwjrM2THw5WqwXqIRFtprqRddiYsJAL8U+q5YUNbc5FLCy5b+VGmeb
 GacsGVb9vYaIJ2PHM8Zme0qoykvFLyuIgQCs2ODkGJ/ttq0zpK/GDhP4l
 1PC44ZeVrWTAAsg/dRLulcDAWGSpoy5d+80XL9dtrVFu5D1lWjmbuWy1m A==;
X-CSE-ConnectionGUID: oUVi9XIvTSSX4j7ALlm+hg==
X-CSE-MsgGUID: ZxllcuchTQ2fdEZ13P1KIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51563101"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="51563101"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 05:04:15 -0800
X-CSE-ConnectionGUID: dgTr2jUESOu4L7//bZIP8w==
X-CSE-MsgGUID: h4zNvJxnR+Wjo9Qdtdb1WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="119373234"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Feb 2025 05:04:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Feb 2025 05:04:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 05:04:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 05:04:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mI6BQmFb5Z9sUn9BCXU+9AxVoGyTH3EqtHLUkLugiDdvbMHFEHgqP/LNOSo94wSTqWJqyXP8VvRCT9mlgDJqGhUnHVXHrYe1g84D1FmdfrnKIUcgPZJ5TCLi47IQ6q8rxsuvLZAVidiDziFcpnHK6xQ7p6BD4yRyHJovWZTb0LzNDOjgqZP16OBpzf0lWZ0ziUZscodT+/9gPHFZRO5V0dLhwh1XEMyIShAvOZ9JcxREIbMuyJZyTGefjC+1y/EF5UMZ7oDG9ME9R4qKt8N8+Qidt71/nhv/vNE3mvZ3gHBhH/3m6qoErl+L+SXBuTt+8ToyxOCztDVvMXplL93YFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGK2Up6f/l91R2aKDYU3iMmYP6DlgfHONomZ7L/Te/k=;
 b=M0FQKZ2pVsDquOOTqaHh+PLUGZMTvoX7OzOANf3P48MqHNqZ52qYb0L+DNcfw3uZlJHBc3h2IALuX3o3VPdxBFqffTXNj+lvEMgKBO0ao8SIGOzjKUcFYAg876ardEyVnJr9jg75cdhhfFMqb+aQke0TsOTDSbB95vn7XR4ZDmd9M7JpxeMuYJL311El5NlVjikDRlm2zdOao3Ep1ZJiYg3qGu5hvnsx1TuGKaBSUB5S/9de1XoBnABxXSSJT/HvEJ6/jMRwBY5Q5VKCj5kt5WZUSRKG3bFV5xRlewU9xzJjIJJoXe+y8brRE0yu91ZcNocz0YKtDL9O2VQFhyZQ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 13:04:11 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 13:04:11 +0000
Date: Tue, 18 Feb 2025 14:04:07 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t 3/4] tests/intel/xe_fault_injection: Add helper
 functions to inject fault with specific budget parameter.
Message-ID: <Z7SFR3X0yFuVSdrg@fdugast-desk>
References: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
 <20250207072902.12582-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207072902.12582-4-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI0P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: ad652fd9-f566-4bef-3de9-08dd501cbcf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mm1BdXFHVzA2ME5sSk0wL2RjNkRUekcrWk5CVWhyNzArWTRpeUxSUDd5Snlw?=
 =?utf-8?B?NWlMekZscm81Y0F4YXdKdEIwN1U4NlVaekRCTWJjQUdjNE84NUhYSGoxV2Fi?=
 =?utf-8?B?Y0ZVMjJiMW8xZkJOc0JMRjB0K0R0aE1yUXdKZmJJZUJRN1g4TlhzUmNPQkpK?=
 =?utf-8?B?WTRDazVyUGZsWW9ydTU0eGNtMUJqaTE4MGhYUnlaZXY4RzlBK1BPSThodGtW?=
 =?utf-8?B?RDAyZ2U0aXcvbDZocklCVVNuYjZwbExEQjZUbjg1UFZ6L2lhYjBpTGxRTmJR?=
 =?utf-8?B?dlpPU2JDU0p6K3UzOXNFRnpiZ0hLdkg0YXFrbTNzVTBsVENnTXR0a0xDVnUz?=
 =?utf-8?B?ZEh3bWRBdEdLdExUTzZzTHhNWk1oM0FCYjZVM3N2dGJQYnNGM242Y0F5REpp?=
 =?utf-8?B?bnowSlNhb0JhRnJSOW9EU05JUHBpR01oemFzM3RUN2dmWHhhTm5NYmk4aTZk?=
 =?utf-8?B?RWJsNUgvZzYwTStWTmU2RGRmNnpTQ1JuaDQ3MXgrZHJBbDgzQ1BjZVFaY0la?=
 =?utf-8?B?ZHR0WFlwdTZjMTNCSjJKK2tEWEN2UTJ5ZUxHblBVUkFSZ1FyS2RmazlBSGpm?=
 =?utf-8?B?SkMzWG80Zm9IOE5qRlJXYjBsa1ZiV2gwakErblg4NGZkTnpoWWlNakJrVDNC?=
 =?utf-8?B?L2VTWm45NkRDcUI3Mmg5cTNTMWphQTJWcERrOWMxSnF2N2MvWmJVeVJyRDFh?=
 =?utf-8?B?ajNPS0t1WEhtL0pDaThTOUVVNEttbmZsUytBMU1FL1ZXTDNyekIzWnZZemlX?=
 =?utf-8?B?anhsdHdIRFJtRk1jRXg2MDVjL2NONHBQZnFrZlRHd05jV1IvaHBVK2M5cEVl?=
 =?utf-8?B?bXFQdGhiVEtBeDdGTHppUUlmVTRuUFdRaFh6WU9zWVFNVzZhZk9vY0FGYTJr?=
 =?utf-8?B?dGdvU0pqTUsvK2owNHRqZ2xsMENaZ1BjQjc0Y0NiZ05adElrR05oR3RKanZZ?=
 =?utf-8?B?QmVESEVqRGxtcTJNeUlteUc2MUlLUEFiZFJITHgrckNsZEhLUzVxMnFPYkdC?=
 =?utf-8?B?K2hGenNzYkM5RjFMcUVCUzlFUEZiblZxUTdyWW15dDhNL0w3NUpYTEpub0ZJ?=
 =?utf-8?B?bk9wcDdtRXplemgveVBzekZZSFNlcTJlZ2RtZHNjTllORlFRcmt0THFScDFG?=
 =?utf-8?B?QkpsdEZzb3djVFdPSmd3ZHhVT2FOQmZCa1cvSjlqNG1tclcrOC9MclZrRjMv?=
 =?utf-8?B?enZieENFQTEyTEN2cmpQRlFJU1RGa1ZYbFZUS1BZUFIreDEyR2l2TzRDbkdk?=
 =?utf-8?B?SGJSTXBhcmFyOUQzYjh5T3ZUNWRYRThKODRlcmlnMk4xam81ZGdwU1AwQ00w?=
 =?utf-8?B?UmFGTEZlVFg0MERCbVJ3TTRUdys0T2RpTXlZeXRWUFZrWE53cDQ2ZHN1ZnVo?=
 =?utf-8?B?MXZGSEkyNG1UdFF0Vm9xRG5zQnFOcXk0c2lQTUMwa25jMU9pSVJMVHdrZ0tu?=
 =?utf-8?B?RkpIWk5rYmNtK01zaVowa1RkeXVwMVVFSXllZk1EK2haOTE2bmpiQ203aTF0?=
 =?utf-8?B?ZHhtRTE5VjlDVjRXSDFZTlJOWVN1WXJRRGRMV3lRSHJkdEx3TlRBanBYVmZ6?=
 =?utf-8?B?RGRNM3RncHNyeFRQQTdIQ1Bzd01lc29LVm5IZWdRK0p6SzFsR1pCVTYwMGk3?=
 =?utf-8?B?S21uNnpwc3RGZTg0MTVPZ3NWbk91b1hLdHB6WDI2QXY3NDBEcFZnZEJFWWRZ?=
 =?utf-8?B?TTl1Qy9PQkZWVlkxaW9Qa2M3bDJSSGV2SEZodmpQTGFRK1AyMXlrMVBzZFJn?=
 =?utf-8?B?MVk2RU1KUzFVMkh4bkF2cUMrQ2VNVFhIT0tkOU4rbW13TDZPOXRNK25VUFFG?=
 =?utf-8?B?VnUwbjJDaWszZWhiNTh6NWhKSXhZTm1Sdi9UdnpOZmVtRVV1dVRzeS9RbC9B?=
 =?utf-8?Q?2MduQcRNVsNwX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEZibEZwK2VoalhPRGNLcGlwWU1wYmVMZFR5TVBrSzY1eEd1cmVBWnFzTUJ4?=
 =?utf-8?B?UXZRZ2tpbk1BQzliUGVtTGJWVjAySUxsOXFKemxyU1hNOEJSbzQwbExsWkZl?=
 =?utf-8?B?WlZITU5DZjBqZzduMlhEaWovVUMrZEhSczdSUFhPWUxWN2Z4dHcrMzdVbjZQ?=
 =?utf-8?B?eFUxdDM5VjFwMXFXd2hlbUZsNWw1ZXN5YXJCb2FCNzlGSmhlZTdURW1UczdH?=
 =?utf-8?B?UGw0M3AzY1FFTVllMFdKUUZQdjd3VWUyZ1dERDQvdVBKVWtMME9paW9yN1hF?=
 =?utf-8?B?WjQ1V3g3b0trZDd6WFcxenRsRmdmbGc5L1ZzeW4zUVA1SjB2RlViV1ErRXRN?=
 =?utf-8?B?Mk5NcWxNWm1LbEFWNWFEc0Vjb0JJN2dZWmdWa1R1VzBWOHJ1cTdWRjFLSHRI?=
 =?utf-8?B?blh4bzM0SlBQWm0vd2JMZWJXK3k4ZXZaRG9PcUc3VFlwSWpFTXRnMWRDT0g3?=
 =?utf-8?B?aUN0SEJuQXpLbWp5WWpvL0hhdEpVM0haM21iTGpIYXAwOUFsMDhwdWJWOEU2?=
 =?utf-8?B?MzJwRDdITlBtQjdxTVNIWWNFMFN2OVhWYjlIT1BmdElVQ1pHM0g5LzBaTGpI?=
 =?utf-8?B?L0lDTVpSeU8weTI0ZHV3TWM3YWdPVllubmxTOHdyTFdjZFVRendLbTlOY0lW?=
 =?utf-8?B?eml5NyttMDZKV3dpVnorZjBKK09RdjltYlVOWnFhek1hRElpY0Z0QUVRV1o5?=
 =?utf-8?B?djhDWHhSdFBlbzJPVGJFM1VLejN6ME9QRGhkSVhmbFcyWjU4bnYyTnF2aU45?=
 =?utf-8?B?Uk16K0JmWjNqWWk1QTFoemlrYVFlNXJmbFVEM1pRS0hhemYrR1JrRy9Uai9Q?=
 =?utf-8?B?ejZzMlRTeTBxRnR6OW11anI2UktvOHNyd3VpVDN5UlVrVWlhbVdLSmprd0ty?=
 =?utf-8?B?TnNJODRxamNSVDREUnhyY0NFSnA3MDFmcUxlbVVWVEVUU3dEb1krRGZCRlNV?=
 =?utf-8?B?YTJPc0ZYTDBVL212TCtoclA1MGhPcVpYUHlHM0Npcll5dWRNSmtsTE1LOVZ1?=
 =?utf-8?B?Q1d0SzRUNThwOHhjVXhkVmRSRTBLTjUveSs4Q2J5aHA5emt2REJSMWYxN3p0?=
 =?utf-8?B?V1FWbHRORm5JTERRY25KZnJmc2w3a2FWUU82bWdzYkRYVVM4WTFWcVZUZjI2?=
 =?utf-8?B?Wlp3ejEwMTRGSk9USzZZdHhDNDhCR2J3NWwwd1dQdndWZFh1OWRIdjQ1NTNt?=
 =?utf-8?B?V2cvUUhkN1ROdGNRcmw3ZE91blphZ3VaRFZGSytJYlVPZnh6dWRPSVNUZi9o?=
 =?utf-8?B?UEFseDIydHJwT3l1bjdKOGtuM1lCcDFBT2QxRWtacEo4V0s1NkNuekF2ckpU?=
 =?utf-8?B?UG5wSnkwV1N1TGtRRWFDc3N4MWNxQ3p1czhMUlI5MjJNZW5jV1ZCU3JoRzh4?=
 =?utf-8?B?dWp1bGNGbkJuU2taNlVqU1pHaStvRmk1RVdwTXlub1hmLzlTcXRCbW8xdHRJ?=
 =?utf-8?B?ZG0wazVDVmZQb29hTFNoeWd0c24yT0RGWnhhS3NDbzU2b0xGSGVGWE9NVUNK?=
 =?utf-8?B?Vk9SdWNZd0I4WEFGbGV6WjdDRGt6VWNjQkx0THFINTJuTzBvWmVQRjZUMjJW?=
 =?utf-8?B?ZXF2dGc0WkFzZ1pjeHh2YW5YSG5uanhPOGswQWtNTy9DU3VybTFGTFlnYlZT?=
 =?utf-8?B?aEpRNEhCSG1tMmd6ZG1yUVlLRm94bVFlSHdRcDRpcHByUGtWamR6UlJ2Um90?=
 =?utf-8?B?cnI0cXNGYStSc21vQldnOHk0Y0k4WXRQUWx0Tkx4RjhVVVkxWStXTHY2UDBh?=
 =?utf-8?B?ZFJ2bWREcEQ3M2hQUEdESkRBUVZkckRBU1VPUnkwN1FPcnprQ0xHSktnemho?=
 =?utf-8?B?QkpKRDBRdUVJQkx2ekUzRzdGR1d3bWdJbUZUWVBGT25PaDZ0L2M3UUhteHpX?=
 =?utf-8?B?SDVSZWFvOFFtUTVweWVKZkowY2xjUGVDcGVnR0VQeC9HNi94U0lDdXdCS09l?=
 =?utf-8?B?RE5ZWDZSZkg2U0ZuWm9hdGpRYXVmQnluK25zV0tVM3lRSVVkL1hpbXdiL2hD?=
 =?utf-8?B?akdZQ0RQMWc3TzhxM25pOUFxZHM2Vm56SC9RRm9IdVIxano4cWtncnE0a0Jm?=
 =?utf-8?B?OWE3Y0IwVEdMSU5mdUdPMEkwOWZ4OTBuS2Zoa2s4eStTQzBpbnJWTVkyV1ov?=
 =?utf-8?B?Q2wxRXBJdHN0VUtnNHNmb2VSRGdLTUFJS0tPQjlQL0dYY1dqVkYyNWhtWkly?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad652fd9-f566-4bef-3de9-08dd501cbcf8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 13:04:11.7363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEROp8kohcmtXZXpaP0yPhV0aNMdReB9WDKrWiqXzZXa/ppgEEZKP8+4mEZCrdffPfiOI2dIgKdx5nW7oYflbN+iWEgRoyTVElbJ+Ip9eO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
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

On Fri, Feb 07, 2025 at 12:59:01PM +0530, Satyanarayana K V P wrote:
> As per the current implementation, the fault is injected on the first call
> of the error injection function. Introduce an environment variable
> IGT_FAULT_INJECT_ITERATION using which, an error can be injected at
> specific function call. If the environment is not exported, an error will
> be injected in every possible function call starting from first up to the
> max number of iteration defined by INJECT_ITERATIONS, currently hardcoded
> as 100.

This description does not fit the patch, which adds one function that is
not used yet. If I understand correctly it is exclusively intended for
use in probe_fail_guc(), so it might be best to merge this patch and the
next one in the series.

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index a4252d028..9432828c2 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -25,6 +25,7 @@
>  #define INJECT_ERRNO	-ENOMEM
>  #define BO_ADDR		0x1a0000
>  #define BO_SIZE		(1024*1024)
> +#define INJECT_ITERATIONS	100
>  
>  enum injection_list_action {
>  	INJECTION_LIST_ADD,
> @@ -42,6 +43,21 @@ struct fault_injection_params {
>  	unsigned int space;
>  };
>  
> +static int get_fault_inject_iter(void)
> +{
> +	/**
> +	 *  Introduce a new env variable IGT_FAULT_INJECT_ITERATION.
> +	 *  When unset test will run for INJECT_ITERATIONS iterations.
> +	 *  When set to <=0 or malformed - same as unset.
> +	 *  When set to >0 it will run single n-th iteration only.
> +	 */
> +
> +	const char *env = getenv("IGT_FAULT_INJECT_ITERATION");
> +
> +	/* Return 0 if not exported / -ve value */
> +	return env ? (atoi(env) > 0 ? atoi(env) : 0) : 0;
> +}
> +
>  static int fail_function_open(void)
>  {
>  	int debugfs_fail_function_dir_fd;
> @@ -211,8 +227,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	injection_list_do(INJECTION_LIST_ADD, function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
> -	igt_assert_eq(-errno, INJECT_ERRNO);
>  	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_UNBIND);

Unrelated changes?

Francois

>  }
>  
>  static int
> -- 
> 2.35.3
> 
