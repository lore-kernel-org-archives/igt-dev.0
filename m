Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3539E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 14:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898F010E0FC;
	Thu, 19 Dec 2024 14:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdJOdgeg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5782510E0FC
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734619690; x=1766155690;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cLv+O/cvAxLX12q8mEGALXWgwO5knFFyu7Fdg/U0P2g=;
 b=PdJOdgegU7zmP1Bru9tSJ0Hd6L1yoOMcXFiV46Hi+Gcm9nu54QDXmXdt
 sy6cyqwx6H81tdPI7C0yvwgeXIKDbD4Y/Fyw22JzosAMaxT7o4AkEXlT2
 uPYpEr3cT2HTptfjUoHW2pKk7m0d26say9oCfuDg2vpBUMKpGt3QtdTCW
 CQmqSRllqQ0s+rt2Mqtq9v0a3u+pfHu3wMOQQ5pruTVjX55lqshuWw7Zv
 ECAGRgV07yDs5zBAnhvOj+WbYX8vZ3SHGbz4HKo5qhbYOniuvkYJIYs37
 6lbzcccIGcXh35Lzk1yAqg42o9fhl/1DkCjfDwTDalDTfL9dCHRTmqlTA w==;
X-CSE-ConnectionGUID: SF0rERORS128/2c0uUUr7A==
X-CSE-MsgGUID: zA5c4d/yS1iVNzHm0W6z8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34854397"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="34854397"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 06:48:10 -0800
X-CSE-ConnectionGUID: GdIoAMPiRFyukehbexwmRg==
X-CSE-MsgGUID: SfpNYPrUTYmTe21ibSxrbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98041304"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 06:48:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 06:48:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 06:48:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 06:48:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbMruSGLklb9eOS81nVsZkTqLeZoMOjNLWdx/XVBXSZvxI0QqNUFmLjnwdBCKw9x57QKcKZg/Haf7QUBwVLkgnrjr/TUih/lWNjniF16apjtV1jmXIx9ZpN/iPO5hOijMD+ZYOvMNUlk7uIo6V0sXHdYeYLyqjvyMXERPWzMz148mUW4Z/FIkymQrTRr7cg1fKbhLlrujA5J9GeLdpJE3hIMOoSeRLKPTSpCRprWdYjbidTbYFcHGlePj6r9YJLQR0pdxcJtkKpcAwgJzd8tevnA4u18YSPmknRGCkLSbu7Yrk8+mPZv2z7MZ34Ki40263IbI/9l8v/9h4MfOf+vxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97cIOGbQTEP5QrpOJMCpBTq/MPM+lewTmszQMjH0lwE=;
 b=Qgoaz+ONA1AxQFoTh9Ox0O89HA9C/Mhu1VDOriw/MDz2EXvaXetHNVK+GP54PCQJYAQEabA9kzhUAveW5qwpJgu79izso9ABtArpQ02If4kCIvpqaQr7EAoYmkqMwSF0QMuw1s4nRiPXQ0KEIkTuQwiJu+KmWN/PAmfWBMnV/IN6ck9/MnTUJvk0r0roASd/BX5RzK44JQZvcmgsEVKfMs/bfc5GOMwAxe13sAhgpaRi/6o0imGQgEmvFTETsvlJ4sXEYeMbNR8a5KB+mSvFVfEFpQppm6kvIyExb8UPa3WNHvaDVfOfa8Py7vXgQuRBh7z6ys5uA50S1wXEhQ/LsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH8PR11MB6832.namprd11.prod.outlook.com (2603:10b6:510:22c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 14:48:06 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 14:48:06 +0000
Message-ID: <e99cd75c-be29-4c57-ad06-f1f9c1f9a5f9@intel.com>
Date: Thu, 19 Dec 2024 15:48:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/xe_sriov_auto_provisioning: Add tests for
 SR-IOV auto-provisioning
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
 <20241218120056.779962-6-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241218120056.779962-6-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0066.eurprd02.prod.outlook.com
 (2603:10a6:802:14::37) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH8PR11MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: d54b5f1a-1978-4b45-698a-08dd203c25cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHBWTjBkY1N6eGErcldEeVFxT1N4YWNPQU5qbFFTbjFPR0NSMjF0cjh3M0lT?=
 =?utf-8?B?TlUwaXdtWmt0enM4NVZlakw1S3Qydm9MaWhhQzNuQmJac1dkSVU1QzdaZHZ2?=
 =?utf-8?B?cE91WVVyeW0xb1B0dmJkNVArSzBNL2YvSUE1NkFVZWhtM05oS3lYQjhLamRV?=
 =?utf-8?B?bTA0ZHUxL3FIWnhuUDlXYXFmakEySTFUbzg3SGZ5YU1EaDViZU02bGFvVDRl?=
 =?utf-8?B?VEdLQW5QWnlQaUEvWndQWGIxdEM4Q1JubTdydndsZy9CbS9yRTJiampnTkJt?=
 =?utf-8?B?ZjJSWVZ6UG05aWUzRjVjYkxJbDI4WFR2MXhJKzcyNmVOMUp6cUo0bUg3MWFK?=
 =?utf-8?B?cVdsVG1PMlRSTkcrWE5RWW9mNDZrN0J0d0MzM015NWJ1Y3o0ODRmV2V4Z21E?=
 =?utf-8?B?cHUxek1rS0JtdzFaR0JxTHROMmNoWEg2TWtwUEpFajJJTHhrbzdVTXZzamNH?=
 =?utf-8?B?NzJKNWpsaWdSWGwwVkZWYmhVZThmR08vcTFra2JMdXF2NjNnMU1naHdQcTZ0?=
 =?utf-8?B?cm9TOHZTaGEzYUcwUE9obGpJa1o1MUxybkdFMTNsNlhRczZzM09WOEhMclRJ?=
 =?utf-8?B?N1VQbWhBQVJOV3R3cDd1THJqM3J5UDNBaDEzSTFpTXo3ZTgrUU9wbWZ5Tldn?=
 =?utf-8?B?Z3o0VnBja29oYlg4emJFU1FncFlGTmxrdG1hSzVjaVRxMjBaNW1yWGZBRE83?=
 =?utf-8?B?TWJsOXVzWXA4b3NrWlBDZTVjVi9oMXRvajZLNk81TW9pQk5SMDlIazB4Z1Nk?=
 =?utf-8?B?UTZsYUQrNnQrK1lWYUloRFhWNHVLdzVvaGw3MWRzamJHZG8weUpPT1R5Q0h0?=
 =?utf-8?B?eGVRVFBhMy9xTXljb1FVYlBRMEhHeU9veFRwTFFIY2M4YThwUllvTkxsTmM5?=
 =?utf-8?B?VzdWY1VGVUhUOVlQcHV4UlFLeW1vek02S3NibFBBL21RQXZweDNoU1cwcmkz?=
 =?utf-8?B?WGlCUmt6SGtkOTdieDd5L1Jwem5iektxcmlWdWlSamxtYzBCanY0cDFHRFB6?=
 =?utf-8?B?OUxJVFgvQk5rQzFKdEh3VlhiL01TMUxhcXdFbDZqbGRRcmE3VHl0Y0xHcEhh?=
 =?utf-8?B?bFBHU0xSWUlXd3dXVlN2a0YzT2x6SCs5M3UwTzZkZUdJUnlkaituSWc2ejBM?=
 =?utf-8?B?dmxJQ1FCZUlKdmxsdTc4MXBIeFBENUlqREZEWDZXQUpNd2hmR2pON2R1bitT?=
 =?utf-8?B?THJialpqVjRiZFRPVXNxYVlMcS84UFhNdGFyVVc1YTc4NGZ0OWFHNGpMRWpr?=
 =?utf-8?B?aXBCMFhRMzBiKzdCWnZ2THcvSkEwWTlvU0tDbkMxL2tWLysreEtKcng4azFI?=
 =?utf-8?B?Zno4bGhlK1dIcGF6cUtPY1I2c01Ua2R0L3VGVm5pcDdZVFpoRWo3b2IwRXBv?=
 =?utf-8?B?a0xHUzhDampmcHlhWThmOXZpK1QxcHdEZHNaRUdpYm0rbzBzNzNaMloraWpM?=
 =?utf-8?B?cEUzbVljUENZdXRhVFRqZFRYRy92c0xsMDFEaEtTRlR4NUJRUmdnb3lhbm1Y?=
 =?utf-8?B?ZjNzQ2oveE9rM1R1TmVhYmM5UGErRnkxWFlqeTBwMGlrOHBYTGJBMkMrSzJZ?=
 =?utf-8?B?SnE1U0RWL2V0ODRyM2ZFeDdBdVRNSi9ldGttMTJ4L0hyeXBUUVdRc0ZWdUlQ?=
 =?utf-8?B?VTZwMzlSZmxGOXlkTGRETmVGTW5ObkhmT3hnc0lDc1AxU25nSVltaU9JUjhu?=
 =?utf-8?B?a0lLcklWeUMvTDFxQ05CNU1nSE1veFNHVU1xcVZUSmVFSEVZRkdCQ3FnTTBa?=
 =?utf-8?B?cGx2ZzZIejZ4dDdkbFR6ZlBaaDJKblV2WUpWa3dGVCtacXM2dHUzODZDRnBM?=
 =?utf-8?B?OEl4VzNjbUcxZXR0RU5sR1VPbG42MDUzZ3ZjcG4wa0dya2RDUm5ZcThOTU1m?=
 =?utf-8?Q?aPxj5TaGHXwp5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejlKeEh6TndKNTh4YnNPLytnUUNWVHNaTzEyQTZOenNvYVdPTStQSGpKMXVi?=
 =?utf-8?B?OTRoMGJTN2RLVkx1aXU4dXJUM0xnY2lhc1lWNW1IZjUzZkRCTmtIRXhRY1Er?=
 =?utf-8?B?ODJXVEV6S1RXQjF4WXk4bmlYNTlscUdFdlZEZXdicHlkV0ZvTEZ3cUdnS1hB?=
 =?utf-8?B?N21va2RDM0s2THFJRUpsckE5VWE1VlZ4dGg3OW1BWXZRVjB6cUJoZ0Z0ZlVh?=
 =?utf-8?B?YlNqVG0vL1FYaEZERzRDaVhuMGpMdnlkNHk3K2EvM1hnazJyMzVpYm4rcXRV?=
 =?utf-8?B?K2RjWHBTWVNPTHQ4RjgzSjBjOVdWNWdoYVd2Uldrci9QTk1zeUhYMXVKWGRl?=
 =?utf-8?B?czZvUUNmZU1reFBrRmh6d0wzZnRrSVZMWml2dlJtem9NeEZDeGFvQWtrZWRM?=
 =?utf-8?B?TjVVcVZwVmQwMHlESGROR29keHNpZFJyZSs1TTN4NHlFNkQ0Ym5XeFFmMXJF?=
 =?utf-8?B?UFZTOXhCRTdwaWxvSHBnRzhJZXE0ODYxdlpjbXc1YURTa2dWYlplRzFUQ1NS?=
 =?utf-8?B?Zkd4dzJHQm1UWDA0eTRTTC9WbzhKQ1ljSGxNQ2Y1MEtlTkJTYkpEN2xlVjhX?=
 =?utf-8?B?bVNLNnpBZnlSWHZoTi8xN0l1azBBWFQ3QmVlREVrUjEzbHZKeVNldC9kM053?=
 =?utf-8?B?TEplQVM3TWtTMW01U1dKcC95N1NZSzRtVVVlSTNVM0IvYXBzVFZRVjF5d1Zp?=
 =?utf-8?B?S0YyZFl2MEIwa0VXWVpJRHorSWRuVlVrTlFpSmZBd2RLcytXWnRNYkhTd0JH?=
 =?utf-8?B?cW1aTjE2TmRIN1NBdVpXY1BWNWFIaTJLZVFBRlMxMnduUWc3M2VVNHptbkJO?=
 =?utf-8?B?M2ZHS1J1b0x2dE11b1Q5emJSay9NTzZJKzZ2ZjRnbVJWbU9EZTBaeTNKUnAw?=
 =?utf-8?B?SUNvQ2N1NW0vYlJrSDk5K0ZKblVpWngxeVc0bmpHaC9vVHpwRm5GNXExQW8w?=
 =?utf-8?B?ejQ3VWgzVE40a2F6Sko1T1praG1DYUVJS1ZDNU1tU2pLREprU1hVTWNBbG5w?=
 =?utf-8?B?eUc3TWxWU0RtbVJvSm80QlAyYXhIN2FiSjVyMFZQSmZDb3EwRi9DZVJpRlJ6?=
 =?utf-8?B?N1I0d0VwdXRYdjhPR3J4cktzV2lQWWtGRXAzelZWSUFPNUJlcTBMeXQ1aFB5?=
 =?utf-8?B?N09hZWFUemtFcERtSm54enFxQVIvUGNYVW9PVXJrMVlnUGgvRVhvU0w5RjJV?=
 =?utf-8?B?T0ZUcjJnRFpvbk5MUmNOR21jL3h0eHdrMzRpdU5HWG1mNW5wTm1XTHZHYkJk?=
 =?utf-8?B?OHNwYVdoWEY1T1VIa3BYL2FwcEtLNlRtSmFjeVRvbC9WQVp2QlZYRnVGeDIx?=
 =?utf-8?B?MlQvRzlML1k1ZGdYMW52ZDcrWHVGcVZyK2xMK0d6dEt5TklZU3dNL1YwVGdl?=
 =?utf-8?B?aGxHTEdYV3lINFRtQ3BvZktabXY2ekltUUI1QUZGZUJLeGkrUjFvczk3cWVW?=
 =?utf-8?B?U0NhYytraVlHdktSNzIwTGtqRkxrTlNkcllnUDExVHZ5endZRmJJZ2k5TUJ4?=
 =?utf-8?B?TDNGT2YybXp5YS9NSWI1eUJ2ZzNhbXJWVFVuZUlxaEtwL01xM3NaVEpNWEFL?=
 =?utf-8?B?dlFFRDVBemFOWUw1RGVRVFpqVXZBdmZGTUxFZTZPQitxWmUyK3RLRWd3SzVa?=
 =?utf-8?B?VVlwNTJ5UEpSZEIrZmRRdFM3NUUzdXNBMDVXYk9yd01DZEppaU9tRXpaSXdU?=
 =?utf-8?B?czZQMTBEOVk4VUEvUnRqS3VQOVVVVENqQ1BsdzBINkxPR0loci91NXdLM2hL?=
 =?utf-8?B?MktLSy8yZGs3b0h5Zk5qdkR1OEcyVGJTcEhleHFVbm5GWEU5OFBsbXpDc3lq?=
 =?utf-8?B?T1NRa2hIZjAxREJvcE1FSExVKzlobWJUaFZPVTBpamF2dEJiTURIQm9zYm52?=
 =?utf-8?B?ZEJDTEhlY25pK1hRRU1yUWZ5TitYVGpPMzRaaklROGxlREcrbXB1c0phVzhy?=
 =?utf-8?B?L0RXSC84ZUVJV0ZoWE9hZEN1dUJYQStnb1lNNUV6M2poZzc5OTEwYmR4ZVd2?=
 =?utf-8?B?UkV5eTFBT3Fad0xZVXA3V3YxNHJ4djlGcHNwc1BNRjFyMGtFOGJJTURmWnho?=
 =?utf-8?B?UlhHeEwvTWs1akxQRUMyWWN1alEzMnAxZUs5c1prS29ZM2xLU0drWFk0YzR4?=
 =?utf-8?B?WkdadWw1V0daTkFpdVg5RUxsNU5uRHZVb2xZcU5WNUNHbUlhYnZUU0dGQlFI?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d54b5f1a-1978-4b45-698a-08dd203c25cc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 14:48:06.3092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRs8FiRtypjIlsdeclcF8c6tMNhWY1AubOayzy6NHIAldCmcsdsTLCRTwTZd+iAEi4WpWjHmraFRsL98ickU8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6832
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

On 12/18/2024 13:00, Marcin Bernatowicz wrote:
> Added subtests validating below scenarios:
> - auto-provisioned resources are allocated by PF driver in fairly manner,
> - auto-provisioned resources are released once VFs are disabled,
> - verify that ranges of auto-provisioned resources are exclusive.
>
> The tests rely on ggtt_provisioned, lmem_provisioned,
> contexts_provisioned and doorbells_provisioned debugfs attributes.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_auto_provisioning.c | 399 +++++++++++++++++++++++
>   tests/meson.build                        |   1 +
>   2 files changed, 400 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_auto_provisioning.c
>
> diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
> new file mode 100644
> index 000000000..a5ae60525
> --- /dev/null
> +++ b/tests/intel/xe_sriov_auto_provisioning.c
> @@ -0,0 +1,399 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2023 Intel Corporation. All rights reserved.
> + */
> +
> +#include <stdbool.h>
> +
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_sriov_debugfs.h"
> +#include "xe/xe_sriov_provisioning.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: xe_sriov_auto_provisioning
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: provisioning
> + * Functionality: auto-provisioning
> + * Run type: FULL
> + * Description: Examine behavior of SR-IOV auto-provisioning
> + *
> + * SUBTEST: auto-provisioning-fair

As we have auto_provisioning in the test name then maybe subtest named 
"fair" would be sufficient?

> + * Description:
> + *   Verify that auto-provisioned resources are allocated by PF driver in fairly manner
> + *
> + * SUBTEST: auto-provisioned-resources-released-on-vfs-disabling

Similar to the above, maybe "resources-releasing-on-vfs-disabling"?

> + * Description:
> + *   Verify that auto-provisioned resources are released once VFs are disabled
> + *
> + * SUBTEST: exclusive-ranges
> + * Description:
> + *   Verify that ranges of auto-provisioned resources are exclusive
> + */
> +
> +IGT_TEST_DESCRIPTION("Xe tests for SR-IOV auto-provisioning");
> +
> +static int compare_ranges_by_vf_id(const void *a, const void *b)
> +{
> +	const struct xe_sriov_provisioned_range *range_a = a;
> +	const struct xe_sriov_provisioned_range *range_b = b;
> +
> +	return (range_a->vf_id - range_b->vf_id);
> +}
> +
> +static int validate_vf_ids(enum xe_sriov_shared_res res,
> +			   struct xe_sriov_provisioned_range *ranges,
> +			   unsigned int nr_ranges, unsigned int num_vfs)
> +{
> +	unsigned int current_vf_id = 0;
> +
> +	igt_assert(num_vfs);
> +
> +	if (igt_debug_on_f(nr_ranges == 0,
> +			   "%s: No VF ranges\n",
> +			   xe_sriov_debugfs_provisioned_attr_name(res)))
> +		return -ENOENT;
> +
> +	igt_assert(ranges);
> +	qsort(ranges, nr_ranges, sizeof(ranges[0]), compare_ranges_by_vf_id);
> +
> +	for (unsigned int i = 0; i < nr_ranges; i++) {
> +		unsigned int vf_id = ranges[i].vf_id;
> +
> +		/* Skip duplicates */
> +		if (vf_id == current_vf_id)
> +			continue;
> +
> +		if (igt_debug_on_f(vf_id < 1 || vf_id > num_vfs,
> +				   "%s: Out of range VF%u\n",
> +				   xe_sriov_debugfs_provisioned_attr_name(res), vf_id))
> +			return -ERANGE;
> +
> +		if (igt_debug_on_f(vf_id > current_vf_id + 1,
> +				   "%s: Missing VF%u\n",
> +				   xe_sriov_debugfs_provisioned_attr_name(res),
> +				   current_vf_id + 1))
> +			return -ESRCH;
> +
> +		current_vf_id = vf_id;
> +	}
> +
> +	if (igt_debug_on_f(current_vf_id != num_vfs,
> +			   "%s: Missing VF%u\n",
> +			   xe_sriov_debugfs_provisioned_attr_name(res), num_vfs))
> +		return -ESRCH;
> +
> +	return 0;
> +}
> +
> +/* Expects ranges sorted by VF IDs */
> +static int validate_fair_allocation(enum xe_sriov_shared_res res,
> +				    struct xe_sriov_provisioned_range *ranges,
> +				    unsigned int nr_ranges)
> +{
> +	uint64_t expected_allocation = 0;
> +	uint64_t current_allocation = 0;
> +	unsigned int current_vf_id;
> +
> +	igt_assert(nr_ranges);
> +	current_vf_id = ranges[0].vf_id;
> +
> +	for (unsigned int i = 0; i <= nr_ranges; i++) {
> +		if (i == nr_ranges || ranges[i].vf_id != current_vf_id) {
> +			/* Check allocation consistency for the previous VF ID */
> +			if (expected_allocation == 0)
> +				expected_allocation = current_allocation;
> +			else if (igt_debug_on_f(current_allocation != expected_allocation,
> +						"%s: Allocation mismatch, expected=%lu VF%u=%lu\n",
> +						xe_sriov_debugfs_provisioned_attr_name(res),
> +						expected_allocation, current_vf_id,
> +						current_allocation))
> +				return -1;
> +
> +			/* Reset for the new VF ID (if not at the end) */
> +			if (i < nr_ranges) {
> +				current_vf_id = ranges[i].vf_id;
> +				current_allocation = 0;
> +			}
> +		}
> +
> +		/* Accumulate allocation for the current VF ID */
> +		if (i < nr_ranges)
> +			current_allocation += ranges[i].end - ranges[i].start + 1;
> +	}
> +
> +	return 0;
> +}
> +

Handling cases where one VF can have more than one range of resource 
adds extra complexity to the test logic. I started wondering if we 
should consider such case as valid. Maybe we should assert earlier instead?

> +static int check_fair_allocation(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
> +				 enum xe_sriov_shared_res res)
> +{
> +	struct xe_sriov_provisioned_range *ranges;
> +	unsigned int nr_ranges;
> +	int ret;
> +
> +	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, gt_id, &ranges, &nr_ranges);
> +	if (igt_debug_on_f(ret, "Failed read %s on GT%u (%d)\n",
> +			   xe_sriov_debugfs_provisioned_attr_name(res), gt_id, ret))
> +		return ret;
> +
> +	ret = validate_vf_ids(res, ranges, nr_ranges, num_vfs);
> +	if (ret) {
> +		free(ranges);
> +		return ret;
> +	}
> +
> +	ret = validate_fair_allocation(res, ranges, nr_ranges);
> +	if (ret) {
> +		free(ranges);
> +		return ret;
> +	}
> +
> +	free(ranges);
> +
> +	return 0;
> +}
> +
> +static void auto_provisioning_fair(int pf_fd, unsigned int num_vfs)
> +{
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	int fails = 0;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {

I was OK with not defining dynamic subtest per GT to reduce the test 
execution time, but I had mixed feelings about not having separate 
subtests per resource.
But the more I think about it, the more I'm convinced to your approach. 
For manual reproduction with specific resource we can define some test 
option taking the resource we want to validate (no need to implement it 
now, we can add it when needed).

> +			if (igt_debug_on_f(check_fair_allocation(pf_fd, num_vfs, gt, res),
> +					   "%s fair allocation failed on gt%u\n",
> +					   xe_sriov_shared_res_to_string(res), gt))
> +				fails++;
> +		}
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	igt_fail_on_f(fails, "fair allocation failed\n");
> +}
> +
> +static void auto_provisioning_release(int pf_fd, unsigned int num_vfs)
> +{
> +	struct xe_sriov_provisioned_range *ranges;
> +	unsigned int nr_ranges;
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	int fails = 0;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
> +			if (igt_warn_on_f(xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res,
> +										      gt,
> +										      &ranges,
> +										      &nr_ranges),
> +					  "Failed read %s on gt%u\n",
> +					  xe_sriov_debugfs_provisioned_attr_name(res), gt)) {
> +				continue;
> +			}
> +
> +			igt_warn_on_f(validate_vf_ids(res, ranges, nr_ranges, num_vfs),
> +				      "%s: VF IDs validation failed on gt%u\n",
> +				      xe_sriov_debugfs_provisioned_attr_name(res), gt);
> +			free(ranges);
> +		}
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
> +			if (igt_debug_on_f(xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res,
> +										       gt,
> +										       &ranges,
> +										       &nr_ranges),
> +					   "Failed read %s on gt%u\n",
> +					   xe_sriov_debugfs_provisioned_attr_name(res), gt)) {
> +				fails++;
> +				continue;
> +			}
> +
> +			if (igt_debug_on_f(nr_ranges,
> +					   "%s contains unexpected ranges on gt%u\n",
> +					   xe_sriov_debugfs_provisioned_attr_name(res), gt)) {
> +				fails++;
> +				for (unsigned int i = 0; i < nr_ranges; i++) {
> +					igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
> +							"%s:VF%u: %lx-%lx\n" :
> +							"%s:VF%u %lu-%lu\n",
> +						  xe_sriov_shared_res_to_string(res),
> +						  ranges[i].vf_id, ranges[i].start, ranges[i].end);
> +				}
> +			}
> +			free(ranges);
> +		}
> +	}
> +
> +	igt_fail_on_f(fails, "shared resource release check failed\n");
> +}
> +
> +static int compare_ranges_by_start(const void *a, const void *b)
> +{
> +	const struct xe_sriov_provisioned_range *range_a = a;
> +	const struct xe_sriov_provisioned_range *range_b = b;
> +
> +	if (range_a->start < range_b->start)
> +		return -1;
> +	if (range_a->start > range_b->start)
> +		return 1;
> +	return 0;
> +}
> +
> +static int check_no_overlap(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
> +			    enum xe_sriov_shared_res res)
> +{
> +	struct xe_sriov_provisioned_range *ranges;
> +	unsigned int nr_ranges;
> +	int ret;
> +
> +	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, gt_id, &ranges, &nr_ranges);
> +	if (ret)
> +		return ret;
> +
> +	ret = validate_vf_ids(res, ranges, nr_ranges, num_vfs);
> +	if (ret) {
> +		free(ranges);
> +		return ret;
> +	}
> +
> +	igt_assert(ranges);
> +	qsort(ranges, nr_ranges, sizeof(ranges[0]), compare_ranges_by_start);
> +
> +	for (unsigned int i = 0; i < nr_ranges - 1; i++)
> +		if (ranges[i].end >= ranges[i + 1].start) {
> +			igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
> +				  "Overlapping ranges: VF%u [%lx-%lx] and VF%u [%lx-%lx]\n" :
> +				  "Overlapping ranges: VF%u [%lu-%lu] and VF%u [%lu-%lu]\n",
> +				  ranges[i].vf_id, ranges[i].start, ranges[i].end,
> +				  ranges[i + 1].vf_id, ranges[i + 1].start, ranges[i + 1].end);
> +			free(ranges);
> +			return -1;
> +		}
> +
> +	free(ranges);
> +
> +	return 0;
> +}
> +
> +static void auto_provisioning_exclusive_ranges(int pf_fd, unsigned int num_vfs)
> +{
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	int fails = 0;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
> +			if (res == XE_SRIOV_SHARED_RES_LMEM)
> +				/*
> +				 * lmem_provisioned is not applicable for this test,
> +				 * as it does not expose ranges
> +				 */
> +				continue;
> +
> +			if (igt_debug_on_f(check_no_overlap(pf_fd, num_vfs, gt, res),
> +					   "%s overlap check failed on gt%u\n",
> +					   xe_sriov_shared_res_to_string(res), gt))
> +				fails++;
> +		}
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	igt_fail_on_f(fails, "exclusive ranges check failed\n");
> +}
> +
> +igt_main
> +{
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	bool autoprobe;
> +	int pf_fd;
> +
> +	igt_fixture {
> +		struct xe_sriov_provisioned_range *ranges;
> +		unsigned int nr_ranges;
> +		int ret;
> +
> +		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +
> +		xe_for_each_gt(pf_fd, gt) {
> +			xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
> +				ret = xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, gt,
> +										  &ranges,
> +										  &nr_ranges);
> +				igt_skip_on_f(ret, "Failed read %s on gt%u (%d)\n",
> +					      xe_sriov_debugfs_provisioned_attr_name(res),
> +					      gt, ret);
> +				igt_skip_on_f(nr_ranges != 0, "Unexpected %s content on gt%u\n",
> +					      xe_sriov_debugfs_provisioned_attr_name(res), gt);
> +			}
> +		}
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +	}
> +
> +	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
> +	igt_subtest_with_dynamic("auto-provisioning-fair") {
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				auto_provisioning_fair(pf_fd, num_vfs);
> +			}
> +		}
> +	}
> +
> +	igt_describe("Verify that auto-provisioned resources are released once VFs are disabled");
> +	igt_subtest_with_dynamic("auto-provisioned-resources-released-on-vfs-disabling") {
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				auto_provisioning_release(pf_fd, num_vfs);
> +			}
> +		}
> +	}
> +
> +	igt_describe("Verify that ranges of auto-provisioned resources are exclusive");
> +	igt_subtest_with_dynamic_f("exclusive-ranges") {
> +		unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +
> +		igt_skip_on(total_vfs < 2);
> +
> +		for_random_sriov_vf_in_range(pf_fd, 2, total_vfs, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				auto_provisioning_exclusive_ranges(pf_fd, num_vfs);
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_sriov_disable_vfs(pf_fd);
> +		/* abort to avoid execution of next tests with enabled VFs */
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
> +		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +			    igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		drm_close_driver(pf_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2724c7a9a..01076f401 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -315,6 +315,7 @@ intel_xe_progs = [
>   	'xe_vm',
>   	'xe_waitfence',
>   	'xe_spin_batch',
> +	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',
