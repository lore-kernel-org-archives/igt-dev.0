Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25356D49219
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 13:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D9010E4B8;
	Mon, 18 Nov 2024 13:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSvRuG9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD0710E4B8
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731935293; x=1763471293;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zk1z4PTo8f7ESevxX5UyKBeB7CCVlU6IqKTILpxz3lY=;
 b=aSvRuG9N8wIncYWKmcHCeGQPJVYqAIcDsFDzWeD4UtMvuzxUhqKS0MSs
 Uw0Bbs63QZ8qcU+VusXacPenUyKJD8+1J6D3seGG4+Cp+/C2lhQ9nx2Hs
 wH1m7luwsFDSGFeRL5KF6pOZ+45dkwXTTkBlJvHURnVSRjcmiocPSAecb
 ipivsru4bVg6CmPe/mHzRTzlgYETphG0H0C8XdsPrAE8Z1N9CvAZUcF7t
 ZjFJM2DlS3W7057Fd+PYZfxwMzglYJ97RmAhuWpUV9gVFdyou8JjIYtsh
 iyVgYkDOJAars/21SmIBfe9NSN/KVTWi65pBpSWObOcyhx7q7aHz46k5p A==;
X-CSE-ConnectionGUID: 3WIucZYFTCGa8kZUML8R1g==
X-CSE-MsgGUID: ZqHUsnHZTjmkG5BmW1n0UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32041347"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32041347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 05:08:13 -0800
X-CSE-ConnectionGUID: NwruNBh6QLGRhiVxZZ1U+g==
X-CSE-MsgGUID: gobKo35JSJi6jKlOQI+jhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="120152526"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 05:08:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 05:08:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 05:08:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 05:08:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=On8uqZRTOwrJsssX46IT7KUHfMGuQklSDfdimjS9LJulM6daEc2amuf+0S7XEkmIb1ZJP7suJKY00kDwKF9oYR6lqW9uOKJQ1ciRwnLgbhfIjxCiRKiQloQic4IiPzubpj80ULdWEeFol3I0YwKtuiu0Y0aqDSUaU88ucZ16VwRxrr4JIdPXjScL6gAfcvIgW/xYO1seAwNEuIulZ93o6iX3pxSvbJbGCyI7hTQ2JRamHdO6U0XdOZsROfhvevB2NfFFMndaK4pp90po87zCu25JJS1sBfU1rnJDRKUMCqFy08oTIF4RQ/chnwjGUYGnfyukF2swZAZCJ2QSTHO6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6U5LunrgtpCoqdKJ0b7FiMcRFaBNMDPAR57vCVKATQ=;
 b=mEOLOnUhYI+8/3W2YexQHYlyrfd3jJGVqdnuK0HcCTdQu7mi/ROvjboOyGTfn0heTIt9IJxk8Rxl3Kdp6Wuc2XGttGn9LXFEoKQR16EBxel0PlCJ8GBRrFygy6dtMoz0xFOCuY3QaM2f7b3ZMEB1GDzaTCw/A0qFjax7jF9huMXd21xqtR4RXnbyQgcO41RduUoB0I7bgbDT0NjfZzxXFdme2uhjLAGrxY9ARu1uhhqam527UxTlmHP8MTjqMEg0JffzI9DewTkSti7KcIYsKQAoshaJJqqQ4Pv7yUSc4nY/9/59A/QgG+p6FYvItsG1NVbx5ItenzPbCx1282eE7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by MW6PR11MB8311.namprd11.prod.outlook.com (2603:10b6:303:241::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 13:08:09 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%3]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 13:08:09 +0000
Message-ID: <8e9181aa-1fe6-49c5-bd10-95e89db8754c@intel.com>
Date: Mon, 18 Nov 2024 14:08:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] lib/gpgpu_shader: Add causing a read pagefault
 from the eu thread
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <jonathan.cavitt@intel.com>, <mika.kuoppala@intel.com>,
 <dominik.grzegorzek@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-3-gwan-gyeong.mun@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241115141132.866838-3-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|MW6PR11MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aaa6173-e9e6-4f34-196d-08dd07d20c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1lrOHpPamczZEFFR0U3cHk1QzJpb21lblFwL0VvL0VEMEo3YllmNnhIZkd5?=
 =?utf-8?B?eVQvQXRERmtNTTFWc0RwUm92TW1oek1XRHZwUHZEWnpuK0ZMc2g2VGZ4OGdn?=
 =?utf-8?B?UUM4VEREVEo1QTdFTEU1RjlnMnE3YWVPaE0xckVMdEphOFZ6S3FUemUvQkk0?=
 =?utf-8?B?L2lpOEQxeTB6TVBsb1NEa3REajcyZkZwcENJb0FrS1V2ZG5KUUdVLzFibjdp?=
 =?utf-8?B?UzBBOHNzUTBDcis1eGJhaVlKc0NJZGpqYy80L0pEYWxjZEQ3cDZpb2UwQ3JY?=
 =?utf-8?B?U2kwdW5IZVhtVVY0YTlTRGs3amtlY1RMajFXLysyYzhwNUJzWWZFNFpIaC85?=
 =?utf-8?B?d2JzRUttbnB1b1BQcDZQQzNkbWg1bmhOZXlZR0dySFZlTEoydEppWG4rdzNP?=
 =?utf-8?B?b2F2U1FDOXBOUDA5enpOdmFNYkVmSitPUi9pYjFOMnJKY1pCakJhR1lSeXNr?=
 =?utf-8?B?STlUdDY2ZU56NzVrM2Q4Y0twLzFkRnRzSGlwZk1YK3Ztb1ZaRzVXRkpldDlx?=
 =?utf-8?B?RFQ3eEtjU1Y2Y0ZYZTQ4V0taZFIvSDNHWG82eDczTXdNWEJOWE5vOTMvMkNB?=
 =?utf-8?B?T3c0RFpaazZFbmJTUkV4aUdJRGNDMnkzZW9IS2VSYjNkQmxxanJUV0N0VFpm?=
 =?utf-8?B?dUs1QjRDMFM4cVBkNDZFUy9DbStyOUpDaHJsVnh1K3pXb3NLN2gwS0RUQ3M1?=
 =?utf-8?B?MnV6cGtoNVR1ZG8yR3NWYzhJZWpkZlQyaTZMT1ZSOWhWdURvek12dEJ4ajlv?=
 =?utf-8?B?ZjJldVYzY3NDRXNtVDJ3dFRKWUhjTk9QNnRvWWM5eElMWDlCS1l3TFdhbTNn?=
 =?utf-8?B?MFBkV0F2Z2hNQ1grV2x6RGtBTGtCcExpMHpNTUYyR1JKNHRXZG9zYVRybU5U?=
 =?utf-8?B?MUJzY2Z1eXNDaFc3MWdubW5EMHkzOWozMjBpemZBMzZnMFVNQ21Ka3V0VjRK?=
 =?utf-8?B?Wit0M1J3bktJdVoxUHptVEZyS1BEUDJJLzBleUk3WUlwQngxSmtlN255LzBl?=
 =?utf-8?B?V050VE53Q0ZocXlTYzZ5TllnYjhiRmtzWGtwUXRTODA2VzJRZlNZb3gxaXlN?=
 =?utf-8?B?dkUwTWZ3NjhFa2swdXlFWHlFdUZ2U2s1b3JjVDlKNEE0d0ZpbkxOZi9FcVdG?=
 =?utf-8?B?V1Nxa0ROKzBzU24vOVB6TXdHTW1KVlVHdVRZZzVPS3FBY2NYamZuTlZoOEF6?=
 =?utf-8?B?T3JRM1dYY0ErMmFPZmlFZmJtSmJDVDdZK1VvZWpabXI2UllSWTVOZkRkblZD?=
 =?utf-8?B?cGZZVnl4eDBlNENnZHdJR3JZMCtsZTNPNXVYQ3FlUUloTWVxcUFiWmdVV2ZF?=
 =?utf-8?B?cXJmelE1MnIrN0J5KzNoUVMxbGZnK001SGVlb1hJcDRQQ0s1WGVSK0hmMDJS?=
 =?utf-8?B?R1hnTmo2NFd5UXV1d3pjaUVJYnZFMzV4dTNDb3VPSmtuTzRvZmhtTUM1SlBF?=
 =?utf-8?B?bmRSeXVuS3pua0JMZWNVSmZXMUtVbnNZV2lXbjV5clExdnRyNXovQ0tHbEtu?=
 =?utf-8?B?RWhhVm5aZlMzQmhGeWpTSlNrRCtScENXN3Jqb1N2eGhmcURkS1NybFU0M1J2?=
 =?utf-8?B?NVVuRm5hRzMrekR2WU1OWndhSHp2VndZZjRGeDlOa2pUeDkvSTRkY1pCdXcx?=
 =?utf-8?B?TjZaQXd5T3lGeFhGZDA5RUk4Wm5CYjBnMmJQaXI1YUtneHViMXBLVnhJemlE?=
 =?utf-8?Q?kLdKrBkS0zcZ6+GZMD8p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzZEcnlUaEVOdEJZRkpOTnZFaVRIVk96Rm1YSndINlN1aFlYSU1RdDd4d3E0?=
 =?utf-8?B?MVZDRjhKM29FaGdqRmczNkpVY2NBMGl1Tm14ZG9QSUhXSzZEKzlqem5mMWRu?=
 =?utf-8?B?MzJLcnNoQnJmcEcrVnNVM1lQU3FWVXo4S2RqUVh1ajNVTkZJYWZQUWtwY3Zh?=
 =?utf-8?B?ZnRDRDRUYzhtUk53S2h2SmFza1JmT2M1MHNNT01kdkJibUpUSnlEdVRKWW1H?=
 =?utf-8?B?bHRwakpVTjd4dkRmUEgzdCtMNWRvSkpiYmtmMmJXZk52RlltREFnTytuV01R?=
 =?utf-8?B?alZPM1loQzJtZzU2YzltNWxMZlI2eXJReDhDTFJjM0dEWlk4NFpPWXNJc0Jv?=
 =?utf-8?B?cndwdmdZWUpRbmk2SDNIZWRtUDdKUkVPUmIwRjI5S2ZiZjhmaTFtUVN2djBP?=
 =?utf-8?B?dlVScVNObWpuejVlUXE2ZWxiLzlQSWVFSmdFbVhQOGZoTG4vampMbkJJRnZp?=
 =?utf-8?B?RFNIZWFkZFJTVGFoMXllSWUzMkV4MjNaOWZYK3ZsajBXVGp6S3F5ZEQvT0h5?=
 =?utf-8?B?ZVN2eDJBN29yTm1QOGJCUlpkNkczaExiZ3FhdmZpQTBCbGovamRzTlNTUFZa?=
 =?utf-8?B?dGVGVHl1T0ZTYitQblplejdBNFRDcnN0VjFscVR6K21nNStJRTRSRUNheW5M?=
 =?utf-8?B?Rm9haGtDaFVubDBqL3JqYy9WOHVxdk5OQXNWU0o2Y1hhdS9ubjRHR0F0cUlL?=
 =?utf-8?B?MTdSUnFTcm0rajNLVUNDL2JSTXRyZ1VvVGZDc1hlWS9FaUpXMUVuTUc0anhT?=
 =?utf-8?B?ZFEzeTJ4NS8xVmY5V0JiNFVFcWZVSFBZeTBGSG1qNC9GTlJQak5Kd3FKbjNt?=
 =?utf-8?B?Z2wxLzUrQ2dXcXVlTWFiVm9HQ2w0RUVCdmJpakdzODE5MjcyajFMcEgycmNM?=
 =?utf-8?B?cmxGR0kwaXRFNnZjUVBueSt6dVNnMnJaSzJHeVNYUmF4U3JVL2FaQmZDbHIw?=
 =?utf-8?B?NzI2bkxobXU3S1c0VE9DVnFVZUpxNmQrR2NaZVFnMUVCMHRiWHV6a0dUb0Fo?=
 =?utf-8?B?cmFQSjIvOE5mNGJ5VUVKZ0hpN0JHV01QclNiaHlzQTk0WDJZQThRS1JOSDJV?=
 =?utf-8?B?bDNjZE04ejZ4Y1BrZGtlamtCMjZSVjIzK05LM1BtaUw0NW9NQnJIRnBwY01O?=
 =?utf-8?B?N2I2RGV1TndrVjBOcEQ1ZnRpM0R5SmorQ0Q2S1JhcGZjdlNKczkzcTU1WFVx?=
 =?utf-8?B?bTJ5RytYQTFKTmh2aHJWcE0wUUF6bTVTRVRIOUE2QzdOZ1hZdG9qQVYvU0lD?=
 =?utf-8?B?YmFENzQzR2NSVXcxdmVhclNRNDJxQW9TOG93WG1iVGJzeVZwNk9Tb2xQUjlj?=
 =?utf-8?B?MWo4WlhSSGZxaGsyK011ZCs3MFVHRkttV0tqdDZYZWRzRDFZTUkwOExmYUxU?=
 =?utf-8?B?TE1mV29wNy80NnJTWGo0Zko0bngzYkQrZjV3Z0srZ0N5b3VncFFlaXFSMVA5?=
 =?utf-8?B?Skh4SWN5d1BFNE9uTmdqM2hjNmozbENhTVA4c3EyTmxoSjJiRy9MYzFHcUVT?=
 =?utf-8?B?QjVZbVZ6WSswYUVjaWRJeU1nVkJjM2dOVFM4cGxMd2o0QWRqQnlJSHJUd0ZM?=
 =?utf-8?B?S1E5UkxBTTQ0eUJ0NTZsTnNwZG41aG05RTg1cHBwcUhIN2c0TUI5Y1paVkF2?=
 =?utf-8?B?dXk4Q2MrZ0xhdkFmZVM0bEJmZlNiNFN3VFl6Z0U4V1J6L1UySU9EN1hybGZT?=
 =?utf-8?B?VWlkLzNUMHlvRXlwYzBaV05pMTVxTkxUUm1kN3UrcTFtbmpLa2QrOTJQeWcz?=
 =?utf-8?B?TGtuOEJpQlp1Q1J3M0dta0I1WWdoazljN251bXJOTG9KV3JuNWtaVnEzSm4v?=
 =?utf-8?B?MUIrWmNGTlBYL1hpbzY1anMzMGU1VFd5dVdlY0tERUYrTHJkRVRlOTBhRmlO?=
 =?utf-8?B?TWVYdGh1TFQ4KzR1d3pIVzFuZk91Z3djWFl4M0pPeE1Nb0dpK0lkN1l2THI0?=
 =?utf-8?B?Zk4zczBPdWxnbnJoTjlJZVNNUGtnRmRYc1ZWdGV6ZllRWkt3NSs0N3NIb3Qy?=
 =?utf-8?B?QzN2THhySkFpdXMyNEYyTnRuVFhiaUlkN0tPVklrNlpVY0llZmhKQWVQSTYx?=
 =?utf-8?B?djNNZUlZNlltTzRaV3BvSFVUdGVrbC9BSm1EcWYvckZ4UXd3d0ZZdDZEUVc0?=
 =?utf-8?B?K0ljaXBTdGdEcWNQWU1jVkcyRm1tTDJaK3EzT3VTNXRGRHBERm9PTTNYM25D?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aaa6173-e9e6-4f34-196d-08dd07d20c95
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 13:08:09.4421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ta+K4MBn6XpjtVgSuF25Wle3LpWm5b1osLGIAyH/MmwRc7+JCxr78DNl5bg1PAc52Xf4y9l/OkYkgD49z1SMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
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

W dniu 15.11.2024 o 15:11, Gwan-gyeong Mun pisze:
> Create a function that causing a read pagefault using the eu thread load
> instruction. If the given ppgtt address points to an unallocated ppgtt
> virtual address,  this shader can cause a read pagefault.
> To directly use a 64-bit address as an argument, use the
> Untyped 2D Block Array Load Instruction.
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   lib/gpgpu_shader.c          | 92 +++++++++++++++++++++++++++++++++++++
>   lib/gpgpu_shader.h          |  1 +
>   lib/iga64_generated_codes.c | 21 ++++++++-
>   3 files changed, 113 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 7a2f0d28d..d7c47be80 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -912,3 +912,95 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>   	", 0x807fffff, /* leave breakpoint exception */
>   	y_offset, value, 0x7fffff /* clear all exceptions */ );
>   }
> +
> +/**
> + * gpgpu_shader__read_page_fault:
> + * @shdr: shader to be modified
> + * @ppgtt_addr: ppgtt virtual address to raise pagefault
> + *
> + * For a given arbitrary ppgtt virtual address, it raises a pagefault using
> + * the eu thread load instruction.
> + */
> +void gpgpu_shader__read_page_fault(struct gpgpu_shader *shdr, uint64_t ppgtt_addr)
> +{
> +	/* pagefault ppgtt virtual address */
> +	uint64_t addr = CANONICAL(ppgtt_addr);
> +
> +	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
> +
> +	emit_iga64_code(shdr, read_page_fault, "				\n\
> +#if GEN_VER >= 2000								\n\
> +// Unyped 2D Block Array Load 							\n\
> +// Instruction_Load2DBlockArray							\n\
> +// bspec: 63972									\n\
> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies both		\n\
> +//	the block parameters and the 2D Surface parameters.			\n\
> +// Untyped2DBLOCKAddressPayload							\n\
> +// bspec: 63986									\n\
> +// [243:240] Array Length: 0 (length is 1)					\n\
> +// [239:232] Block Height: 0 (height is 1)					\n\
> +// [231:224] Block Width: 0xf (width is 16)					\n\
> +// [223:192] Block Start Y: 0							\n\
> +// [191:160] Block Start X: 0							\n\
> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 bytes)			\n\
> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)				\n\
> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)			\n\
> +// [63:0] Untyped 2D Surface Base Address					\n\
> +// initialize register								\n\
> +(W)	mov (8)			r30.0<1>:uq	0x0:uq				\n\
> +// [0:31] Untyped 2D Surface Base Address low					\n\
> +(W)	mov (1)			r30.0<1>:ud	ARG(0):ud			\n\
> +// [32:63] Untyped 2D Surface Base Address high					\n\
> +(W)	mov (1)			r30.1<1>:ud ARG(1):ud				\n\
> +// [95:64] Untyped 2D Surface Width: 0x3f					\n\
> +//	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> +(W)	mov (1) 		r30.2<1>:ud	0x3f:ud				\n\
> +// [127:96] Untyped 2D Surface Height: 0x0					\n\
> +//	    (Height minus 1 (in number of data elements) of			\n\
> +//	    the Untyped 2D surface, it represents 1)				\n\
> +(W)	mov (1) 		r30.3<1>:ud	0x0:ud				\n\
> +// [159:128] Untyped 2D Surface Pitch: 0x3f					\n\
> +//	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> +(W)	mov (1)			r30.4<1>:ud	0x3f:ud				\n\
> +// [231:224] Block Width: 0xf (15)						\n\
> +//	     (Specifies the width minus 1 (in number of data elements) for this	\n\
> +//	     rectangular region, it represents 16)				\n\
> +// Block width (encoded_value + 1) must be a multiple of DW (4 bytes).		\n\
> +// [239:232] Block Height: 0							\n\
> +//	     (Specifies the height minus 1 (in number of data elements) for	\n\
> +//	     this rectangular region, it represents 1)				\n\
> +// [243:240] Array Length: 0							\n\
> +//	     (Specifies Array Length minus 1 for Load2DBlockArray messages,	\n\
> +//	     must be zero for 2D Block Store messages, it represents 1)		\n\
> +(W)	mov (1)			r30.7<1>:ud	0xf:ud				\n\

It duplicates code from gpgpu_shader__write_offset, could be replaced 
with macros as in https://patchwork.freedesktop.org/series/141348/ , but 
no rush :)

> +//										\n\
> +// dest data payload format is selected by Data Size.				\n\
> +// Block Height x Block Width x Data size / GRF Register size			\n\
> +//	=> 1 x 16 x 32bit / 512bit = 1						\n\
> +// data payload format size is 1 GRF Register.					\n\
> +//										\n\
> +// send.ugm Untyped 2D Block Array Load						\n\
> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc				\n\
> +// Execution Mask restriction: SIMT1						\n\
> +//										\n\
> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D Block)	\n\
> +// bspec: 67780									\n\
> +// 0x0 =>									\n\
> +// [32:22] Global Y_offset: 0							\n\
> +// [21:12] Global X_offset: 0							\n\
> +//										\n\
> +// Message Descriptor								\n\
> +// bspec: 63972									\n\
> +// 0x2128403 =>									\n\
> +// [30:29] Address Type: 0 (FLAT)						\n\
> +// [28:25] Src0 Length: 1							\n\
> +// [24:20] Dest Length: 1							\n\
> +// [19:16] Cache : 2 (L1UC_L3UC) 10						\n\
> +// [15] Transpose Block: 1							\n\
> +// [11:9] Data Size: 2 (D32) 10							\n\
> +// [7] VNNI Transform: 0							\n\
> +// [5:0] Load Operation: 3 (Load 2D Block) 11					\n\
> +(W)	send.ugm (1)		r31	r30	null	0x0	0x2128403	\n\
> +#endif										\n\
> +	", lower_32_bits(addr), upper_32_bits(addr));
> +}
> \ No newline at end of file

New line

> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 355b128b5..318550c52 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -87,6 +87,7 @@ void gpgpu_shader__write_offset(struct gpgpu_shader *shdr, uint64_t ppgtt_offset
>   				uint32_t value);
>   void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw, uint32_t x_offset,
>   				      uint32_t y_offset, uint32_t mask, uint32_t value);
> +void gpgpu_shader__read_page_fault(struct gpgpu_shader *shdr, uint64_t ppgtt_addr);
>   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>   void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
>   void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index b23613ac4..53a705358 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS 4fcde43dedb9d3212f1d85b5b180b0c1
> +#define MD5_SUM_IGA64_ASMS 01290b5ecda7a6e765463558d6f59952
>   
>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> @@ -79,6 +79,25 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
>   	}}
>   };
>   
> +struct iga64_template const iga64_code_read_page_fault[] = {
> +	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> +		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
> +		0x80000061, 0x1e354220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
> +		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
> +		0x80032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> +
> +	}}
> +};
> +
>   struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,

