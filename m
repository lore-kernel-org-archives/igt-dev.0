Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1E8E9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 05:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A0C10E679;
	Thu, 19 Feb 2026 05:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7o2dv16";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302C910E679
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 05:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771477280; x=1803013280;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+pBge1+IL5iY+MIOM59h4DJK0HUDDGB+KFf1h02wWr8=;
 b=Y7o2dv16Uvxi2+ZWGzWKWBrVLxYcMmwwXGsIRu/LSYr5oVkwvMHsjzrI
 km6BdqDBAns8rnPg0hudxaoaqUQfyr+1gdjXzS886TkZ0rECpPhyMQfgR
 aMOn5wgciS9IastpisyahPtl7vPDsQGBtqCuuEM5XqCqPzzsOxpSbhtvg
 mDOXtpFstrIo8D9/RDM17IKVvBhyyKJ0rLQqAdN9V8t4IlChS4N6Uy+ZJ
 R8qVwfbvvb/0rv7f9TV3xXtFPSRjhYM8Rv6FP6JE3S24j0AwzLzwvkkeW
 gQSgCDxc8I+HQNtNO/xpDeOE+BW0kuM3WPXaagL/6R6WvpEaadcIHdUwm w==;
X-CSE-ConnectionGUID: 9VEqbgUCTf2XjUovqUrTfA==
X-CSE-MsgGUID: pMIf1D21SqOJtXjxBi2TZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72738667"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72738667"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 21:01:20 -0800
X-CSE-ConnectionGUID: wg7Op3gRTTu5pg20/V1Ajg==
X-CSE-MsgGUID: Vx8XZSbfTZS4QMB0dAoxsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213489585"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 21:01:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 21:01:19 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 21:01:19 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 21:01:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfGIKvInBMnC8W+3Y2PfO0qOvsOda1EI+C2sL5MScGFFzfGBPJUzC1LT1/Brvc6XRmab9pyQnJFUPM6Dx++e+RhCrvDxqR7ykg/RY7sRs7mi9rGfPWfdx83Fv7q68/WvUknxLNd3wPZnREUS8FX5tbPxdj+ixGZUU+GuiXTYvAZSDSJyfbFJGJfetLoGcl3UGUP/Dj4YmDANsUcN7+FIx/Zce1hSgK+ziENFLrOC+ZJXyHAV5zSqSLz+o/kFJvzPscQ5MbBkP6nd8A0WjBsUrbjgOy6UQQjm6EFt3lfGlPoPFZZY7uDKWIB7mTbtRXRAGfOfRwO/EByfvVptfdehng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pBge1+IL5iY+MIOM59h4DJK0HUDDGB+KFf1h02wWr8=;
 b=UJoJQWvjjK275OWBp2ZqQy4EABQg7gw6VB5KyaCw3PO8f59XXJKQ8CIwS0/00jFWfieoOe1TbFYpHFFPO7lBC53d+H8wCIatoOiA6ZmyOke4nKHJ29xwsgO/Gw6x+WT0IicgcRlR8gC3rn8f1P9iVnfBICsZDEQGIgT7htxleaS0bmMDCXQJyS96j7OQj/ObV3IkyLCODK62OTtkRw2IFfD+2gW0y5BITBn+ig2WkdoW8nSousB7LFAK0Pbwn8kSbcc2jk6prFZh1Fjr4vApLRKKEYl6vmAr8KQJCsfeYnmE47ICibpnDaWt0qcv9jBbYU8fkbp2ixDjfmsT4GRXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 05:01:10 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 05:01:10 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 4/8] tests/intel/xe_madvise: Add
 dontneed-after-mmap subtest
Thread-Topic: [PATCH i-g-t v3 4/8] tests/intel/xe_madvise: Add
 dontneed-after-mmap subtest
Thread-Index: AQHcn7Ylj2e7iacx0UKoOR9eoB6OebWJeYrQ
Date: Thu, 19 Feb 2026 05:01:10 +0000
Message-ID: <BL1PR11MB55259C519FCDBF2C9EBB0E0C846BA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-5-arvind.yadav@intel.com>
In-Reply-To: <20260217023423.2632617-5-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SJ0PR11MB5133:EE_
x-ms-office365-filtering-correlation-id: ea19cfe2-41d5-4251-c0e0-08de6f73e638
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Q09pZ2NJRTdvMnJVbGE3N3c1MW5nM0ZUeWNXZFlOM3BEV1ZnS0orajROUENG?=
 =?utf-8?B?aUNSL1FHOEptOTJlNUo0dGlTdW55Tzhlckxhd1lSZVJMNDZnSERKL2lQdkI3?=
 =?utf-8?B?UTZQSmRCQk9udDBZdkNPZ1MvcmxWZWFCT3JpTmRNeTNzZksvcmc5TllKMFE4?=
 =?utf-8?B?M2lUNE5Qek9iYVRHRFdJUWgwNk1IL2NsUW9sSTVUUUo3Z2R3WWlhRFY3ZUh0?=
 =?utf-8?B?TExxMytqOFFXcEJYbzhsSmZUMnJqclVYSEh2cnpKMWs0U1FEQTloaUlZM01K?=
 =?utf-8?B?NnA5NmxCQmdCNVNQcEdUZ3VTMkc0c2pOclg3d2ZMK3ZiK1BlblRLNjJQRmVs?=
 =?utf-8?B?b3JUbWtkNlhaRnJaWGhRYzE4SWwvdGFlWFhoWm4xV1ZwTzZZekM0d1o2ZFI2?=
 =?utf-8?B?OGhaL2djdUNoekorR05hTCs0b0MvMkxiOURRekY4YXlvTUFRUEJaamhVaGtw?=
 =?utf-8?B?czZXVnF2ZnFKemxIRXBVYWMwam5hYm56enIxVnZXekQ3ZGg0eUhxalU2c0Fy?=
 =?utf-8?B?QVhMYVMrTXZIMUR4V3FXU25sN0p5S0JIeU5qc1M2TGlDN0pPa3RqMWFLRGNV?=
 =?utf-8?B?Y0VkSkNRU1dGbDRBaXNVTHRtUkpidm1tUEpmRWpxNGJZRzhSYmkzQkNJa0ZX?=
 =?utf-8?B?eHVJN3J1YURlWjRyMzNXb3dFaFRjZkpoaWxZdjU4SWMyUXhCRUt3MGp6ZGZK?=
 =?utf-8?B?VUIyMGJkWWNUcFJGU01IZDFmdVZIZ3NBSm1xN000T2dTbDE3aDNtU3BWQy84?=
 =?utf-8?B?VVNXZ0lPOGV4MjE5UEo5QndralhFeFFZK2tPUTgvZU5tRkg0bFNnV3hjOXAv?=
 =?utf-8?B?MHBybmsyYVc0T2dVdWUrU2p2M2VEdFpIMlY5Y1RDYlV0ekFUZ1VaekJESUNL?=
 =?utf-8?B?Skp0UlJQV2Q1TzdqUEVuS0FmNSt0YStnb2ErdnI2emZqVmE1SUQyU0dVbjVr?=
 =?utf-8?B?bDU3M2JrOVpaak10Wi9tVE5HajF1cm9NNWNwSFJ0WVNZcFdQTlFoTjZ6NWJ0?=
 =?utf-8?B?YktFcGlMUzZoRS9oZ3FtQ1ZDUjRmaGZkUlIzR2FhRWtjZUJCM0xBeGNTNGt3?=
 =?utf-8?B?ZnBEdTVUR3VIbjc5ZGNaMnd3bS96NUdMZnIyVEZLVzJNVGVFYWNxK1R5YUI5?=
 =?utf-8?B?MTc1SWZZZWp5QlJ6Z0JFRU5oVDk1N1owWTR5eEZSVzJOMFRwTWdlTklEUWlo?=
 =?utf-8?B?MHhKV3VLZkxMN1RBYWpoVDRMY0R1M1hTYkNySkZDcEpYbzRpNUFDUTdUMjZy?=
 =?utf-8?B?WjNkcEIyMEVKUDkrbS84cy9vdHZoS2dJbVhMTVgvaFhHUFBuVGpSaUV3ZEpu?=
 =?utf-8?B?TFdOZUFEcmF0UUkzSC80QTk5Q2xUc0I3UWNXUXV6S2x6N2hXL0xiVEMwdE9Y?=
 =?utf-8?B?ZFFyU2pxOVltckZFN1dKR2hIT2NPM29KSWFlUGdVRHBWQm50aHFGYU5yZkky?=
 =?utf-8?B?akZzeWRhVTJKd1gwWjlrOWJ0alhhSUdxaXJNaTY1Y1FTWWhmNTJJYXVJZXhE?=
 =?utf-8?B?NFZJNWlCQ1lTZ2NkZStjY0FEbE1Ta0phR0tVQ2NySXk4TmttSWdLNmVoVk5Z?=
 =?utf-8?B?dnNOaXFUUUx2VWo0emwwRXBUMTR1eUVYZjNwY1BKOFl4Y0tzWk1ubGJ2S3Zo?=
 =?utf-8?B?WUJtTVhhcDNCQW5kM3huc2pnQjZqSDBXKzJCKzh3WlRrd2s5eEx1aHV1MnJG?=
 =?utf-8?B?L0NaSk5KNGlGUGp4R0J2SDVBcXU2V3BjSTllUkxXWGNXUlY3WktFL0xxWStJ?=
 =?utf-8?B?c01nR0xzNXBjTkFhRE5rekJvc1V3b3Rab1FuV0hOUnNlSWk4Q214WkFwOFNU?=
 =?utf-8?B?TDdSVDNRWElLNEkrRlgyaXoxWHBrNHpSWTYxK0ExVllWRUpFTDBNSGl4ekxY?=
 =?utf-8?B?Y1hvSG9ZZTdqclFUZG0zSXVMSk9ieTRIQ2F1VVVFajhBUisrVm9aM3c2M2l0?=
 =?utf-8?B?TTBOSGV0dkd2bnJ1MzcySmt5MWFqWkJJYXlmb0l5MFNBdnM3R3FBMUNtV3JL?=
 =?utf-8?B?aWdEaDcxTGRWdVkvdzhHeDFoOEowdWFkajJ6bTZnYjQ2RnlKYmFoY3h3VUIz?=
 =?utf-8?B?bFM5aWRUTi8xNm5keFZ6dXhScFZDYitZbEdqaERwYTdNZXQ3MmpGSTdRRFpY?=
 =?utf-8?B?cnFDMjZackswOVM3RVlUNEpzR3haL3ZlUlRhMjRXRDRldHBCdEM4MmZabWRC?=
 =?utf-8?Q?fYG6mw/Pj138Tv0rtHQwb1I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEswRkloVllramhtT2dzR0VqU2svT1UwTEdGM01pcVhGUDh4TTB3a0FWUmlI?=
 =?utf-8?B?ZDVtNHlYdFRNaHlFcUc2enU3Szl1TXhlYVhXc3JLdVdSVHpqeFFuSmZsS3A3?=
 =?utf-8?B?NXN6YWduOWN2azd0L1FNdkJuZXRyT3RoMmtYaXR3M3d2TGZLQkdIcGQwY01Z?=
 =?utf-8?B?bUxzbEx6NkVIQ2VxUWE3NEowWUNmOTd2dXpWRzFTV1M1VFRicXZjU1lRSURm?=
 =?utf-8?B?RHl0alZjTzhaTTZZY2NJc3RaWkhlakt4Z1NuRjRtMENpVVRnMkJ6L3pjd0lZ?=
 =?utf-8?B?TjhUSDQ5Q3Z6MVpvZVo4T043Sm5qejg4cURXOVIrL2hkaUpvYmIxUmhaZzlw?=
 =?utf-8?B?MWF4bHF1VE5pbU4vejBnMlJHa1VxM0FGMU4ycWp3Z2ZwZHV1ZnpFb3B2eWV5?=
 =?utf-8?B?SGFEOWluV1ZPY1ArSkdRQ3BQQTMyMFVRMWNMOG1LbmppbjAxaXZpUTdwOTJ6?=
 =?utf-8?B?QUlmeDMvVFFyQlJmOUwwdWtiaDF0TUxuV0ZWZ0lLMXZVc1pEZEduQ3RzMkRI?=
 =?utf-8?B?eE5xWVNRakxOMnpad29YRzdxUllJVGtLL1NlQmk0UnJkL1BqQWl5eDY4bjRN?=
 =?utf-8?B?TURCb3Nzc1B2WDhYNDNUbTVyRDc4VHU4NC83SzJWNFp4WGRESEQ3U1EwTXc1?=
 =?utf-8?B?dmlRdWxNSzl3TlI2S1V3NVVhTCtCUUFCeHV0c1dZMGhRMVp6RUV6dHgxbXdR?=
 =?utf-8?B?QVVKZnFUbGhOVldJWm93ZW5hbnREcXlZZ0ladkFPZ2pEcjg0VENFUXJCZzJu?=
 =?utf-8?B?SkdObXpoYS93SGtQVzVpeGJjK2RiT294U0t1T2FLdEIwdXNQZlp6Mk1FNHlz?=
 =?utf-8?B?aTE5VTZnOGxvS1QwalhVQ25XL3M0ZnBRSVUrT1VYRU9lYTNMSVRWanlOZC92?=
 =?utf-8?B?U1ZUYVd1SVdReU5YcFpVb1gwcXp5dkxUYk01RGh3dnNwY2dCWGlWUVhvelVJ?=
 =?utf-8?B?SlcyaEdVM2d2QWNUekFuVW5xeXV1QTBPelVqOXJEVFV6Z1JJYnQxcXE4TjBK?=
 =?utf-8?B?cUx6d2JxaXRNeEVDTUhLZG9yc2xlS2h3MHMzQUVMSlhlTWM0NmQvQ3JZYk1r?=
 =?utf-8?B?NE9oNDJFSngyM1pqK1ozTTM1VDlrU0cxRTRlSy9ZSmhDekpPM2NrRkQzbTBx?=
 =?utf-8?B?NEJGcisrMFRzQjVERTZRdkYwUHFzTnRGS1Uxdzd3eldqYWc0M3h4ditHR1ht?=
 =?utf-8?B?RmdpSEd1d3FZRUV3Y1NBMXJoWXNnV0ZVN1lzSDJFVFlHQzNVVjNkR00vbmZs?=
 =?utf-8?B?ZlFjZnJpQzZPR2JMTzFQbThSN2ozdXBuL0lIcUpKMmVtbGp0MU8rT2Y3azlE?=
 =?utf-8?B?Y0syUWRpV2QwTnhCMWtNaDFVQmwwNzlYR3A5QmIyaWtHNGducjBWc2Z4R3l5?=
 =?utf-8?B?d1EwVkJDYTdOcWxPNHQyd2pFcHlpckZ6V09NTkRDblZxYkVSOXhlRVNmS3A4?=
 =?utf-8?B?STRYckZmK2VJS2RaSVVOUVU0aThQaDFPUVBRQTJqd2ZyQ1BTQ3Q2MnY1K3NQ?=
 =?utf-8?B?NE9OUjdEMjFqTTYyVkV2bmdDTkVwTVJTNm5naVRZZUdicFhEeWkxaDJjcisx?=
 =?utf-8?B?MERxcXc4V09ybFlnRi9MN2hhVVVETWt1VXkxTDE2bEpPMGdzejhkdUVxekhZ?=
 =?utf-8?B?cVJyZDBneXN3TGNSR0pxV1FET2xNWFFBb2NqbHVSdS9kcHpxQUUvSjE0cXFn?=
 =?utf-8?B?dEs5b1h5dVlmaWRhSm1VU0NvaVB0eDZwTHVGbCtWSTlhb25pYldVbWt6WEt4?=
 =?utf-8?B?K0Y2SDh6REJDR3BHdVppMG9DZkdpY01zbzlBOHRReUg4SGR3bm5Zd2wzZVBH?=
 =?utf-8?B?T1p4WEtSMmdTUHdLTVlqR1psWktzcUQ5c0NHbmNBdlRqbW5Pb0p2aXJJYUVH?=
 =?utf-8?B?aGpndkFCUHVud1lqVE83NEZkZDJqaVRnM1BHaGgvZ2hRckdwUWVzL1gvTDdr?=
 =?utf-8?B?ZCtobDE0VVVBeUFkQTcvL2Q5N0VjRm53NWljNXV4YlNsRTFMZEpVSGI5UWlx?=
 =?utf-8?B?dXB6a1RMNUpLNWdUcDZMR1ZlaUhLamFOenlTRVVwVW85Ym43bk1VdXJqdHNk?=
 =?utf-8?B?MHFKeEZEL0NuL3FCU1Y5dTRMeUhsWFRPY2d2WmFESW15VEYvQ0N5bTkzWTI5?=
 =?utf-8?B?SER2VGZXWWljUy9NMGVaWnN3OXhVK1ZFRSsvQlVUOEFWNmxOWjBjMklNTUhC?=
 =?utf-8?B?N2lFSkhTQW9nTkRMN2lpRGl6V1ZqbmpZNEVSeWJOZnZVUmxibHExQ2laNTJr?=
 =?utf-8?B?NnNQRXF1eFdhMHd4YkFSVVVYUWgrMTVIQ0loZlNZT0p6TDVwZnlianV2TDlw?=
 =?utf-8?B?NDBJUExJKytXdDc2SjNiUWJBT3VXQWkvS3VQTXgxNjF0TFJqWUVsUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea19cfe2-41d5-4251-c0e0-08de6f73e638
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 05:01:10.6922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HfeFachs5M4ZlsqQpHjhc7YU2OaYZpyl+kn+/RPszea/2Cqg9akX0NjvM75a2UcyIcQU1rjWZ0YOCurxZ8YKWRSu8DaPV65w70yX1wi6LHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFkYXYsIEFydmluZCA8
YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgMTcgRmVicnVhcnksIDIw
MjYgMDg6MDQgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBC
cm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwg
UHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb207DQo+IFNoYXJtYSwgTmlzaGl0IDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT47IEd1cnJhbSwgUHJhdmFsaWthDQo+IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDQvOF0gdGVzdHMvaW50ZWwveGVfbWFkdmlz
ZTogQWRkIGRvbnRuZWVkLWFmdGVyLQ0KPiBtbWFwIHN1YnRlc3QNCj4gDQo+IFRoaXMgdGVzdCB2
ZXJpZmllcyB0aGF0IGFuIGV4aXN0aW5nIG1tYXAgYmVjb21lcyBpbnZhbGlkIGFmdGVyIHRoZSBC
TyBpcyBtYXJrZWQNCj4gYXMgcHVyZ2VhYmxlIGFuZCBwdXJnZWQuIFRoZSB0ZXN0IGNyZWF0ZXMg
YSBCTywgbWFwcyBpdCwgd3JpdGVzIGRhdGEsIHRoZW4NCj4gbWFya3MgaXQgRE9OVE5FRUQgYW5k
IHRyaWdnZXJzIG1lbW9yeSBwcmVzc3VyZS4NCj4gQWNjZXNzaW5nIHRoZSBwcmV2aW91c2x5IHZh
bGlkIG1hcHBpbmcgc2hvdWxkIG5vdyB0cmlnZ2VyIFNJR0JVUyBvciBTSUdTRUdWLA0KPiBjb25m
aXJtaW5nIHRoYXQgZXhpc3RpbmcgbWFwcGluZ3MgYXJlIGNvcnJlY3RseSBpbnZhbGlkYXRlZCB3
aGVuIHRoZSBiYWNraW5nDQo+IHN0b3JlIGlzIHB1cmdlZC4NCj4gDQo+IENjOiBOaXNoaXQgU2hh
cm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gQ2M6IFByYXZhbGlrYSBHdXJyYW0gPHBy
YXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJv
bUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhpbWFsLnBy
YXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFydmluZCBZYWRhdiA8
YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9tYWR2aXNl
LmMgfCA1NA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ludGVsL3hlX21hZHZpc2UuYyBiL3Rlc3RzL2ludGVsL3hlX21hZHZpc2UuYyBpbmRleA0KPiA3
ZGJlNzBmNDIuLjVjNmEyNDU1MyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfbWFkdmlz
ZS5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX21hZHZpc2UuYw0KPiBAQCAtMTk2LDYgKzE5Niw1
NCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2RvbnRuZWVkX2JlZm9yZV9tbWFwKGludCBmZCwNCj4gc3Ry
dWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuYw0KPiAgCXhlX3ZtX2Rlc3Ryb3koZmQsIHZt
KTsNCj4gIH0NCj4gDQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IGRvbnRuZWVkLWFmdGVyLW1tYXAN
Cj4gKyAqIERlc2NyaXB0aW9uOiBNYXJrIEJPIGFzIERPTlRORUVEIGFmdGVyIG1tYXAsIHZlcmlm
eSBTSUdCVVMgb24NCj4gK2FjY2Vzc2luZyBwdXJnZWQgbWFwcGluZw0KPiArICogVGVzdCBjYXRl
Z29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQo+ICsgKi8NCj4gK3N0YXRpYyB2b2lkIHRlc3RfZG9u
dG5lZWRfYWZ0ZXJfbW1hcChpbnQgZmQsIHN0cnVjdA0KPiArZHJtX3hlX2VuZ2luZV9jbGFzc19p
bnN0YW5jZSAqaHdlKSB7DQo+ICsJdWludDMyX3QgYm8sIHZtOw0KPiArCXVpbnQ2NF90IGFkZHIg
PSBQVVJHRUFCTEVfQUREUjsNCj4gKwlzaXplX3QgYm9fc2l6ZSA9IFBVUkdFQUJMRV9CT19TSVpF
Ow0KPiArCXZvaWQgKm1hcDsNCj4gKw0KPiArCXB1cmdlYWJsZV9zZXR1cF9zaW1wbGVfYm8oZmQs
ICZ2bSwgJmJvLCBhZGRyLCBib19zaXplLCB0cnVlKTsNCj4gKw0KPiArCW1hcCA9IHhlX2JvX21h
cChmZCwgYm8sIGJvX3NpemUpOw0KPiArCW1lbXNldChtYXAsIDB4QUIsIGJvX3NpemUpOw0KPiAr
DQo+ICsJaWYgKCFwdXJnZWFibGVfbWFya19hbmRfdmVyaWZ5X3B1cmdlZChmZCwgdm0sIGFkZHIs
IGJvX3NpemUpKQ0KPiArCQlpZ3Rfc2tpcCgiVW5hYmxlIHRvIGluZHVjZSBwdXJnZSBvbiB0aGlz
IHBsYXRmb3JtL2NvbmZpZyIpOw0KPiArDQpoZXJlIHlvdSBoYXZlIHB1cmdlZCB0aGUgYm8gYnkg
dGhpcyB0aW1lLiBBbmQgaGVyZSB5b3Ugc2hvdWxkIHRyeSB0byBhY2Nlc3MgdGhlIGJvIGFnYWlu
IGNvcnJlY3QgPw0KV2l0aCBvdXQgYWNjZXNzIHRoZSBibyBob3cgdGhlIFNJR1NFR1Ygc2lnbmFs
IGNvbWU/IEhlcmUgYWxzbyBzYW1lIEkgZGlkIG5vdCByZWNlaXZlIGFueSBTSUdTRUdWIHNpZ25h
bCBmcm9tIGtlcm5lbGwNCg0KUmVzdCBhbGwgbG9va3Mgb2theSB0byBtZSBwbGVhc2UgY2xhcmlm
eSB0aGVzZSBwb2ludHMNClJlZ2FyZHMsDQpQUmF2YWxpa2ENCj4gKwkvKiBBY2Nlc3MgcHVyZ2Vk
IG1hcHBpbmcgLSBzaG91bGQgdHJpZ2dlciBTSUdCVVMvU0lHU0VHViAqLw0KPiArCXsNCj4gKwkJ
c2lnaGFuZGxlcl90IG9sZF9zaWdzZWd2LCBvbGRfc2lnYnVzOw0KPiArCQljaGFyICpwdHIgPSAo
Y2hhciAqKW1hcDsNCj4gKwkJaW50IHNpZzsNCj4gKw0KPiArCQlvbGRfc2lnc2VndiA9IHNpZ25h
bChTSUdTRUdWLCAoX19zaWdoYW5kbGVyX3Qpc2lndHJhcCk7DQo+ICsJCW9sZF9zaWdidXMgPSBz
aWduYWwoU0lHQlVTLCAoX19zaWdoYW5kbGVyX3Qpc2lndHJhcCk7DQo+ICsNCj4gKwkJc2lnID0g
c2lnc2V0am1wKGptcCwgU0lHQlVTIHwgU0lHU0VHVik7DQo+ICsJCWlmIChzaWcgPT0gU0lHQlVT
IHx8IHNpZyA9PSBTSUdTRUdWKSB7DQo+ICsJCQkvKiBFeHBlY3RlZCAtIHB1cmdlZCBtYXBwaW5n
IGFjY2VzcyBmYWlsZWQgKi8NCj4gKwkJfSBlbHNlIGlmIChzaWcgPT0gMCkgew0KPiArCQkJKnB0
ciA9IDA7DQo+ICsJCQlpZ3RfYXNzZXJ0X2YoZmFsc2UsICJBY2Nlc3MgdG8gcHVyZ2VkIG1hcHBp
bmcgc2hvdWxkDQo+IHRyaWdnZXIgc2lnbmFsXG4iKTsNCj4gKwkJfSBlbHNlIHsNCj4gKwkJCWln
dF9hc3NlcnRfZihmYWxzZSwgInVuZXhwZWN0ZWQgc2lnbmFsICVkXG4iLCBzaWcpOw0KPiArCQl9
DQo+ICsNCj4gKwkJc2lnbmFsKFNJR0JVUywgb2xkX3NpZ2J1cyk7DQo+ICsJCXNpZ25hbChTSUdT
RUdWLCBvbGRfc2lnc2Vndik7DQo+ICsJfQ0KPiArDQo+ICsJbXVubWFwKG1hcCwgYm9fc2l6ZSk7
DQo+ICsJZ2VtX2Nsb3NlKGZkLCBibyk7DQo+ICsJeGVfdm1fZGVzdHJveShmZCwgdm0pOw0KPiAr
fQ0KPiArDQo+ICBpbnQgaWd0X21haW4oKQ0KPiAgew0KPiAgCXN0cnVjdCBkcm1feGVfZW5naW5l
X2NsYXNzX2luc3RhbmNlICpod2U7IEBAIC0yMTIsNiArMjYwLDEyIEBADQo+IGludCBpZ3RfbWFp
bigpDQo+ICAJCQlicmVhazsNCj4gIAkJfQ0KPiANCj4gKwlpZ3Rfc3VidGVzdCgiZG9udG5lZWQt
YWZ0ZXItbW1hcCIpDQo+ICsJCXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKSB7DQo+ICsJCQl0
ZXN0X2RvbnRuZWVkX2FmdGVyX21tYXAoZmQsIGh3ZSk7DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0K
PiArDQo+ICAJaWd0X2ZpeHR1cmUoKSB7DQo+ICAJCXhlX2RldmljZV9wdXQoZmQpOw0KPiAgCQlk
cm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gLS0NCj4gMi40My4wDQoNCg==
