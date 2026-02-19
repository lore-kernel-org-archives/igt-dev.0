Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E87E9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 04:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F5A10E67E;
	Thu, 19 Feb 2026 04:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSZ3YN49";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B42210E679
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 04:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771477129; x=1803013129;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KI2HEsXCkkBePBEmOfALV1Bpc2EAlE0ARynBYUlEgnw=;
 b=lSZ3YN49lJibuq7MQg6WASMgU2Q0WaX1IY6KIf0LmIuL9zHcsiffY5jf
 GVA7FjKJqOoBd3EFWP0UXEJQlLINDB6p7R1i/rqE2SCbjg3gMlDkQwtWs
 OCRM0C58xMhpAQpSQSEwyoKk8gXq2A2U94S+XPbUnZxnOMk97DpTkxbTo
 4cNPmNJbIyOrNn5jtw74sHFk80r+8OzApRwKiT+a3Ua4EtJrfm01WvoR3
 lDjnLCUmS6M900ElhP4myYJZJCxjNqQO1kDFJawNsx2EC3+s6pr5h6XYa
 Xr4YPSVI7DYU31kDu7n1KldGydvx3w5Dom8Aatxjil/gDRU9U6b4OOb/h A==;
X-CSE-ConnectionGUID: Xrr3Gj0XSCOb4aJh87M3vw==
X-CSE-MsgGUID: k+T6MzJUTLGPhunq/TaJcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76177940"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76177940"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 20:58:49 -0800
X-CSE-ConnectionGUID: /U0mYU3gSpinsbRbv4Oj9Q==
X-CSE-MsgGUID: MOBb2XepTUu6wifpWHY+TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="218547324"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 20:58:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 20:58:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 20:58:48 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 20:58:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpxD3qOawS++Jj3rGaM+b/XwTHaSoxBghrvvbuJDGFSPREIgW/HDJUQXZwVuFEu0CVJ3/HBgug9HI4OaCiXTCMwR0bTDCn/H0v3RNS7X5pt0ZmkoXD4zwGc7FnSEOihCRBHxD/L+r4Mu4vfEPzDGQ0xHADasDKHby5IXnDRoJ48I265aG+BmzMquIl+qHoFtGXE2FvgQktl0ZXEQipS8UArTwa/cnIKnTP38I7jTVbDbIqYjx4wjG7v2uhBxKP6mTLz4e2SDC2gXoZ8P3d6f2s7nnkCk6sO/K0b0Du1kvHrFgA/v9Rpl3QiZdM8atsZ0lkpJjPzSJHs3IOye6Vj+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KI2HEsXCkkBePBEmOfALV1Bpc2EAlE0ARynBYUlEgnw=;
 b=Nm1Vo6YPSBKFyxbiN/mO1OgcgrN7HMOSZlbQyqXh+rgpM+XhrzLtQfDyk2moxReEGFkE0x5fbBclfqSOihMhCITad8MpsEtn5noFg+Qz2YherNSOgi6+SJRPDAfpCfBoE/5gQdSGF6APcg9DSvbw+RlbE1nOA4hzD8Wgx0BxDU0bqNUBuv975dgLUIBR50OTmGoQ4LTZKEm0KjuzhfdHY3yU+JDcMay2NWvJSssg/KqVZGfNIA7vO/I6GHXKpAIARh5d2T3J/WQtsAf2cRsZJOAFeQNRwaw3b4ucN1Rmd7NjPH+mcppfYls/R6jmLokrnyCAibPiy5JtEreIWSsNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 04:58:45 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 04:58:45 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
Thread-Topic: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
Thread-Index: AQHcn7Yo+/EZT06QIE2r4ZYBnsIxXLWJeNIQ
Date: Thu, 19 Feb 2026 04:58:45 +0000
Message-ID: <BL1PR11MB55256B8E68BA4AA4DBC4AA44846BA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-4-arvind.yadav@intel.com>
In-Reply-To: <20260217023423.2632617-4-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SJ0PR11MB5133:EE_
x-ms-office365-filtering-correlation-id: 58f91b0d-d9b4-4704-907a-08de6f738f7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZG1qcmc5bUp5RkFpUE5WRkdIaEpTZzZLUUNKeUVIZ0J3KzNxQTQwZkFCSC9X?=
 =?utf-8?B?aG9hMDJ3NzFyTkFZS0dKdFh2QllIanllMGJlK0NCU3RSNVFIMStRR3BjK29X?=
 =?utf-8?B?Mm9zaGdobWlONWtkRHNSTTNHeXVCK0xHVHJ1aC9hZ2JjdmpSMjhCUms2Z0Y1?=
 =?utf-8?B?SXh1QkMyS0dFYi9YaUl6TjNmeGpZNWtiVnQ0eGJmazZpVFVLNFFmaUhzVk5M?=
 =?utf-8?B?UlFGUllYay8vYTZhRVEzVitPazk2Vk5kSFZ1bHR1NERjT1lDYkdMMmRqOTJo?=
 =?utf-8?B?ZEphSFBmVkZwc2pmdDBDTENuNVNROTdFTlZhZU1VK3l0TFc1UVBEVW82SXNB?=
 =?utf-8?B?d2dTcU5TL3BrZ3IxaEIvRXlIUzk0dGdCYWxWQk40a2pxVDdYYWJvU01rdTkr?=
 =?utf-8?B?ODRvWnNLbVZmSC9aMzJ4WFh6dGVjR2JTMER2VG82YmRkcGRSdmVxVUJGcTVr?=
 =?utf-8?B?R09MYTF0RElTTW56QlhoU0txYVU3cHVGV3pKanRJZlNvN2hudFhJWG9XWEdE?=
 =?utf-8?B?YTBYSUVjYitleGZyMG8vUkU4SFduem1ZQkplVXRFa2FvNWtPdzdEbEI4MkJq?=
 =?utf-8?B?TVM2WjVmN0cwUTNuMVNpVVhKMkFqRGh4em5RZDF1eG5JSFQ0dksvWTZYMUh6?=
 =?utf-8?B?Qk1qT3VXWllQeEZ2T3QvTElIeHVNNW9adXoyODVNSE1KY05UYWhoZDliY2Fm?=
 =?utf-8?B?U2YxYVkvU2NOY2owdEFKQUkwVEoza1FocHRJUTVZRlBmRlh4emNPVko0eEdi?=
 =?utf-8?B?c1hHNE50TTZBaW5tLzgzR0RFekFoVXZuYlFrYTFBbUR4bzc2WkdIQTFQeUxM?=
 =?utf-8?B?ckZTWEEyejk4Z0pvZ00xdWI0Z0g3bGdYME1JWVpuMFFWaWdBOG9CNlRQZ2Iw?=
 =?utf-8?B?R2g5dXpIaDlmaVpLcmR0VlNJMjIxN2RmTklqLzZJYkR6RWl3R3dvNE9sQUc4?=
 =?utf-8?B?WXNYMXNmVWljditpY0VDTUhFSU9ZRmZRVWxIZnVsOCsyaFNiZEdXQnc4Z1Qz?=
 =?utf-8?B?TDBETVB6a2ttMVQzdlZKbjdxY3ZFSi9yOElRTVlkWTR0c3ZSeTJObUQzdUlP?=
 =?utf-8?B?Zmg2K002Vyt1cXNJOXdPeHQraXQ4NE1ucm5sQk0veWU0Z2wxZjl5NFZqZGpm?=
 =?utf-8?B?YVBvZzFkcGN4Z0p4QlFoMnkrWUVFMm9jL0pTNXh1U2RWenowVS8zUjFjNm1p?=
 =?utf-8?B?VnBIWUVaV0M1NTJablJ1ekFHSTVEU3RMaWp3L1gyblpjS2djR3poTFl4am56?=
 =?utf-8?B?Y1kzR0FiVG0zN0Q2cnBXa01XQktwWFRXS05PQ0hyRUM1QWE1eTB5VHZJVis2?=
 =?utf-8?B?eGpTNHZlOEFLUHhteHBOclhud0NEd3VXSVZ1WENHR1BKdW1jdWcwRklsQ0RW?=
 =?utf-8?B?K2pjQXN2enBHOEM0SHhXN1FMU25DN2RsRldtaG5HNkI0YXJZU29Od0hLdVRl?=
 =?utf-8?B?ZmdLd1I0RmkwUHVJdm03NUxodkdRelUvd2x0dVVWS2YzcGRPR043SVUwS0ky?=
 =?utf-8?B?bUpWT1oyMmNFZ0tndlV4VGhzL3NIeHFFdGZzcGJaT3pmaXIyTUNrNm5vVWlS?=
 =?utf-8?B?REZBNUVXYmVkdXBVVTdJS1Vjd3RIYmNPWlBtQyt2eWMxNzNucncybS9vOWlr?=
 =?utf-8?B?T1NhVWNpYTh0RSswS2hYZDBZUlkxejY3aG1VbjFNU3VxUFUrNzJjbFN5ZzJV?=
 =?utf-8?B?SmtkRmhYa0tUdlFQWjc0RldlYVMvRlI0T0FBY1psV3ZuWXRwTTUyMnRhWUNV?=
 =?utf-8?B?Unl5MGFHUm5VTGZtTzZqREV4Yjh3eG02VUpRUXR3SHpMMFdCWHZVcnprTk5u?=
 =?utf-8?B?U0JaUjFaV2U2OGU2WGdWVElPT1RQRlMzejduRlRrZmZYQUcrellGelBsVCs1?=
 =?utf-8?B?bHpVanBlcDVnTEF2U0pFZmUxWk4vMW91K1FWVXc5a2hIb05TRFRDK0g4dVgr?=
 =?utf-8?B?c0xrS3QzVWViMUpJUGJ2SGozMVh1MzRoaXA1clBlWGRQTzdheXMra0tkMGlF?=
 =?utf-8?B?cmJtWFpHaFFGb3B6VWV0Nm52RjVGZGRCNExza0VwVDdaRXJRbTdFNUk5YXhX?=
 =?utf-8?B?Y2JaSzA0TVExOEptWTA0R1BDVkt4VklaT2kwbVBGNnZQUFJ1dkVhT0QrU2xZ?=
 =?utf-8?B?YzJzY09ub0hPcW5KNzl2WkwycHkvU2pFWkJsNDd1ck0yZFhqV1dXM0pObXdP?=
 =?utf-8?Q?x9He7CT7fJczvqo9zUZBCco=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0szWXFwbUZaVXdyeGE3dzlORTZaM0NTMmFPTnNZM1J0M3J1T3VBMUtscSsx?=
 =?utf-8?B?WDg5QTYzVHJpazRwZWdTM1ZRRzVsSFE5VzI0blYwL0kraDNlZHJpQUxabXdS?=
 =?utf-8?B?ZDRVS1g2TTJIZ0hwb1p5aExkeWE4alhlUXpCbThnOEJNcU8rTXZSWjVzS21m?=
 =?utf-8?B?a3ZKK3F4S01GWWlvdEdVYlZ6b1dyanZlWXFSOVIyRGxHa1BFc25PZFBoRmRZ?=
 =?utf-8?B?K3k0bDBHcG9teCt6bVlNTWZMdTVMa3hkOU93NlhQOU9kcnE4OGp4SlRrZ21a?=
 =?utf-8?B?VVlIOHBoanYwcThlSGVaZFBoQXAyY055Ylg1azRtRDRYN2RaZ1VVTms5MklX?=
 =?utf-8?B?ZlRyOWVWbENoV2FPS2V6RTJ3VmhQTURhTmJYc3N5VlNVNXNDbFZVam83d1F1?=
 =?utf-8?B?Ykh5emJsTW90Qit0WEZISkw0bS9idFlnNk04WC9HbFliWHJMTkVCMUFPckFS?=
 =?utf-8?B?aG1EYkwrbDRhd3U0b1RPZzQwbEdWNlJQalo4Uk1yeGY0OHVtaGxRbGd6UDVY?=
 =?utf-8?B?Qm9VNUphZDE5VzVQbC9JRTV5LzFWQlA5ZWZDa0EwY3ptMUt2Wm5CZ0V1Ulll?=
 =?utf-8?B?VkU1QXJpN2R0ZENTVXViN0dEaUNBNXAvaFJFMWpLaDVCUHpMOXNMYlN3czBH?=
 =?utf-8?B?ckRnTXRYaHRMRVBINEpKY2k5aWkvd0N6UThrc040YXhiUlM0VkVzSWhsV20z?=
 =?utf-8?B?Wm10SnZGNXNiRHA5bXIxWUVzSzFHeXFFV3dSamdMQWtvVGFpZDFOdjduS1h4?=
 =?utf-8?B?QW14TENOdGpRV1NiKzMxOTZpU3Rka2dWWmVSaGUwTCtlMzdZWkpJaXR2RUo3?=
 =?utf-8?B?dFJkeCtaenREaExTOXQzRGdHY1BSZHNHN1ZJV0paUjJXZFZ5c3BWZUNZOHkx?=
 =?utf-8?B?M3pKRElVcnZNSzFuQ3hQeElCc2Ewd1ByUXpydmZFaHlwc1Z0ZUtQZlJwbzEw?=
 =?utf-8?B?RVluWXp6SWR1M2JHUW1oUkxUWGRHY2RxMHA4R1Q3MjFMeVFVQ1VhQnY0VW5p?=
 =?utf-8?B?RlU4allSN1ZpdGJtNm4xTTlPT3lOMER1WTg3RE9LdWxkRHdTWEdDRXFmcm1T?=
 =?utf-8?B?QzhqNVJJWmQ4WWE1QXozS000NlJkeExoYkp1Q2l6K0FDazZBTDRyaU5uZzR2?=
 =?utf-8?B?QUhHamNSV09uT3ErS3p5b2xVT1BjL0ErZit1NnNKWmhOUHk5MlNCc1FsZVV5?=
 =?utf-8?B?RkZUZU5EYmwvMDBXT0s2ZHkra1g5eTVQelIrS0ZHTWpOcmcrQi84anIzdFNo?=
 =?utf-8?B?VE5MTi9MdE8zUkJpbUs5WjlOYzNLaFJheGtjYnM3OUl1OVB5ZVArTWJJWm52?=
 =?utf-8?B?QnUvY2tOMmFoN3JVV1JNSWVDc05XelpheGFNd3hndjYvOWJldGM5TnlmZzRT?=
 =?utf-8?B?b2dtcjdEY04ySk45L002cHB5VTFGdGVGQzNaVFRWeHhIdW16cEljblNWODVL?=
 =?utf-8?B?dlRUbEZqZFpEZlcvQW1KM3NKQlJydUliRnIrdHMxT1lveUxEOXYyZkFXZkd1?=
 =?utf-8?B?Mk5TOWN0L0JEcmlxQUg5NGFyQ1Z6RGpDTkNMWUZNd0thZDJkY3UrNlAvZCtt?=
 =?utf-8?B?NThUenFnT3BSMnZtU2RPL3lpRDRUOE9yY1ZvOHhubXpPY2NSekdsU1lzTjVp?=
 =?utf-8?B?VHhKajdNTTl0N2RDb2RKc3owUHpMbU5RaVArOVQ0WmZZZVZCTy81Skw3TVJ3?=
 =?utf-8?B?M2lHRHdFS1lIZWY2VHExQU4rbzNCZGh0Rm5Xd0FrRnpGK29qN1RrMytscldW?=
 =?utf-8?B?NDF3VGpJLzBLNEgyZXF4NytTSVpHbVdTdEFLNFh1ZHp6WGc4VDNDdE5VbDdl?=
 =?utf-8?B?MFdiZUphNGdydXJZR2UwWTN1VVd6WnkrRWVQOHVZZ0ZOZ0prNkltOFY5dEhT?=
 =?utf-8?B?NVNkTVRVN2lUaldkVk5LUnFYaDRPNnIyd3BMWVRaamMyUmNNRjdpNHVNR0lU?=
 =?utf-8?B?NVhnWXVadjNPbWJTWlBWMW4xbnFKbUVkWW9IVU12c0hWVnQ5bXFYYzZJa25X?=
 =?utf-8?B?cUZ4SVF6YzVFZkI4V0F6RDNVamJaRXRtT0RidFJWTEdXWWtvRDdidnBzU1ZL?=
 =?utf-8?B?Y05VeG5XcDFXNkU3bGd2cnBLbHdqZVN2MDlMMUpRT1BuZzliSmJ4Z1ZmNWY4?=
 =?utf-8?B?RkI5RWlrL2VRaWFRRmxmdTlQR2xYOEtLOWhiTUxFTlBsMUg4UnRxQWFOeGZS?=
 =?utf-8?B?VDVXN2FlZVg0NXFlMk45d1gwcDQ2SDhXYk5xdTJqZVV0L1RId2NlempJS2tB?=
 =?utf-8?B?WDM0NHExbWZPYkxWb1VJb3RWc3VJeVByWjRoVHdlVEpSWEZMMk5XZjh3WEdz?=
 =?utf-8?B?ZDV3WHI4UnNuMXhIWTdCZDdRQkRPTUVvalpZU1FxZzJIdXI1bUEyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f91b0d-d9b4-4704-907a-08de6f738f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 04:58:45.1956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +S8otWV51DHhawfigum9jVL3tubEbtlU1bEIX+yL0MJjFEZGdYkkP9kRzGozb7RgxkTuPHsExnxjD89fJNGk/jM1PxvNy0PMMYp2q3Qh+So=
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
bT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDMvOF0gdGVzdHMvaW50ZWwveGVfbWFkdmlz
ZTogQWRkIGRvbnRuZWVkLWJlZm9yZS0NCj4gbW1hcCBzdWJ0ZXN0DQo+IA0KPiBUaGlzIHRlc3Qg
dmFsaWRhdGVzIGtlcm5lbCBiZWhhdmlvciB3aGVuIG1hcHBpbmcgYSBCTyB0aGF0IHdhcyBhbHJl
YWR5DQo+IG1hcmtlZCBhcyBwdXJnZWFibGUgYW5kIHB1cmdlZCBiZWZvcmUgbW1hcC4gQWZ0ZXIg
cHVyZ2luZyB0aGUgQk8gdW5kZXINCj4gbWVtb3J5IHByZXNzdXJlLCB0aGUgdGVzdCBhdHRlbXB0
cyB0byBtbWFwIGFuZCBhY2Nlc3MgaXQuIFRoZSBrZXJuZWwgc2hvdWxkDQo+IHRyaWdnZXIgU0lH
QlVTIG9yIFNJR1NFR1Ygd2hlbiBhY2Nlc3NpbmcgdGhlIHB1cmdlZCBtYXBwaW5nLCBjb25maXJt
aW5nDQo+IHRoYXQgcHVyZ2VkIG1lbW9yeSBpcyBwcm9wZXJseSBpbnZhbGlkYXRlZC4NCj4gDQo+
IENjOiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gQ2M6IFByYXZh
bGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBC
cm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8
dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBIaW1hbCBQcmFzYWQgR2hp
bWlyYXkgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IEFydmluZCBZYWRhdiA8YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9p
bnRlbC94ZV9tYWR2aXNlLmMgfCAyMTkNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ICB0ZXN0cy9tZXNvbi5idWlsZCAgICAgICAgfCAgIDEgKw0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAyMjAgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3Rz
L2ludGVsL3hlX21hZHZpc2UuYw0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX21h
ZHZpc2UuYyBiL3Rlc3RzL2ludGVsL3hlX21hZHZpc2UuYyBuZXcgZmlsZSBtb2RlDQo+IDEwMDY0
NCBpbmRleCAwMDAwMDAwMDAuLjdkYmU3MGY0Mg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3Rl
c3RzL2ludGVsL3hlX21hZHZpc2UuYw0KPiBAQCAtMCwwICsxLDIxOSBAQA0KPiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI1IElu
dGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKw0KPiArLyoqDQo+ICsgKiBURVNUOiBWYWxpZGF0
ZSBwdXJnZWFibGUgQk8gbWFkdmlzZSBmdW5jdGlvbmFsaXR5DQo+ICsgKiBDYXRlZ29yeTogQ29y
ZQ0KPiArICogTWVnYSBmZWF0dXJlOiBHZW5lcmFsIENvcmUgZmVhdHVyZXMNCj4gKyAqIFN1Yi1j
YXRlZ29yeTogTWVtb3J5IG1hbmFnZW1lbnQgdGVzdHMNCj4gKyAqIEZ1bmN0aW9uYWxpdHk6IG1h
ZHZpc2UsIHB1cmdlYWJsZQ0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlICJpZ3QuaCINCj4gKyNp
bmNsdWRlICJ4ZV9kcm0uaCINCj4gKw0KPiArI2luY2x1ZGUgInhlL3hlX2lvY3RsLmgiDQo+ICsj
aW5jbHVkZSAieGUveGVfcXVlcnkuaCINCj4gKw0KPiArLyogUHVyZ2VhYmxlIHRlc3QgY29uc3Rh
bnRzICovDQo+ICsjZGVmaW5lIFBVUkdFQUJMRV9BRERSCQkweDFhMDAwMA0KPiArI2RlZmluZSBQ
VVJHRUFCTEVfQk9fU0laRQk0MDk2DQo+ICsNCj4gKy8qKg0KPiArICogdHJpZ2dlcl9tZW1vcnlf
cHJlc3N1cmUgLSBGaWxsIFZSQU0gKyAyNSUgdG8gZm9yY2UgcHVyZ2VhYmxlIHJlY2xhaW0NCj4g
KyAqIEBmZDogRFJNIGZpbGUgZGVzY3JpcHRvcg0KPiArICogQHZtOiBWTSBoYW5kbGUgKHVudXNl
ZCwga2VwdCBmb3IgQVBJIGNvbXBhdGliaWxpdHkpDQo+ICsgKg0KPiArICogQWxsb2NhdGVzIEJP
cyBpbiBhIHRlbXBvcmFyeSBWTSB1bnRpbCBWUkFNIGlzIG92ZXJjb21taXR0ZWQsDQo+ICsgKiBm
b3JjaW5nIHRoZSBrZXJuZWwgdG8gcHVyZ2UgRE9OVE5FRUQtbWFya2VkIEJPcy4NCj4gKyAqLw0K
PiArc3RhdGljIHZvaWQgdHJpZ2dlcl9tZW1vcnlfcHJlc3N1cmUoaW50IGZkLCB1aW50MzJfdCB2
bSkgew0KPiArCXVpbnQ2NF90IHZyYW1fc2l6ZSwgb3ZlcnByZXNzdXJlOw0KPiArCWNvbnN0IHVp
bnQ2NF90IGNodW5rID0gOHVsbCA8PCAyMDsgLyogOCBNaUIgKi8NCj4gKwlpbnQgbWF4X29ianMs
IG4gPSAwOw0KPiArCXVpbnQzMl90ICpoYW5kbGVzOw0KPiArCXVpbnQ2NF90IHRvdGFsOw0KPiAr
CXZvaWQgKnA7DQo+ICsJdWludDMyX3QgaGFuZGxlLCB0ZW1wX3ZtOw0KPiArDQo+ICsJLyogVXNl
IGEgc2VwYXJhdGUgVk0gc28gcHJlc3N1cmUgQk9zIGRvbid0IGFmZmVjdCB0aGUgdGVzdCBWTSAq
Lw0KPiArCXRlbXBfdm0gPSB4ZV92bV9jcmVhdGUoZmQsIDAsIDApOw0KPiArDQo+ICsJdnJhbV9z
aXplID0geGVfdmlzaWJsZV92cmFtX3NpemUoZmQsIDApOw0KPiArCS8qIFNjYWxlIG92ZXJwcmVz
c3VyZSB0byAyNSUgb2YgVlJBTSwgbWluaW11bSA2NE1CICovDQo+ICsJb3ZlcnByZXNzdXJlID0g
dnJhbV9zaXplIC8gNDsNCj4gKwlpZiAob3ZlcnByZXNzdXJlIDwgKDY0IDw8IDIwKSkNCj4gKwkJ
b3ZlcnByZXNzdXJlID0gNjQgPDwgMjA7DQo+ICsNCj4gKwltYXhfb2JqcyA9ICh2cmFtX3NpemUg
KyBvdmVycHJlc3N1cmUpIC8gY2h1bmsgKyAxOw0KPiArCWhhbmRsZXMgPSBtYWxsb2MobWF4X29i
anMgKiBzaXplb2YoKmhhbmRsZXMpKTsNCj4gKwlpZ3RfYXNzZXJ0KGhhbmRsZXMpOw0KPiArDQo+
ICsJdG90YWwgPSAwOw0KPiArCXdoaWxlICh0b3RhbCA8IHZyYW1fc2l6ZSArIG92ZXJwcmVzc3Vy
ZSAmJiBuIDwgbWF4X29ianMpIHsNCj4gKwkJaGFuZGxlID0geGVfYm9fY3JlYXRlKGZkLCB0ZW1w
X3ZtLCBjaHVuaywNCj4gKwkJCQkgICAgICB2cmFtX2lmX3Bvc3NpYmxlKGZkLCAwKSwNCj4gKw0K
PiBEUk1fWEVfR0VNX0NSRUFURV9GTEFHX05FRURTX1ZJU0lCTEVfVlJBTSk7DQo+ICsJCWhhbmRs
ZXNbbisrXSA9IGhhbmRsZTsNCj4gKwkJdG90YWwgKz0gY2h1bms7DQo+ICsNCj4gKwkJcCA9IHhl
X2JvX21hcChmZCwgaGFuZGxlLCBjaHVuayk7DQo+ICsJCWlndF9hc3NlcnQocCAhPSBNQVBfRkFJ
TEVEKTsNCj4gKw0KPiArCQkvKiBGYXVsdCBpbiBhbGwgcGFnZXMgc28gdGhleSBhY3R1YWxseSBj
b25zdW1lIFZSQU0gKi8NCj4gKwkJbWVtc2V0KHAsIDB4Q0QsIGNodW5rKTsNCj4gKwkJbXVubWFw
KHAsIGNodW5rKTsNCj4gKwl9DQo+ICsNCj4gKwkvKiBBbGxvdyBzaHJpbmtlciB0aW1lIHRvIHBy
b2Nlc3MgcHJlc3N1cmUgKi8NCj4gKwl1c2xlZXAoMTAwMDAwKTsNCj4gKw0KPiArCWZvciAoaW50
IGkgPSAwOyBpIDwgbjsgaSsrKQ0KPiArCQlnZW1fY2xvc2UoZmQsIGhhbmRsZXNbaV0pOw0KPiAr
DQo+ICsJZnJlZShoYW5kbGVzKTsNCj4gKw0KPiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHRlbXBfdm0p
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgam1wX2J1ZiBqbXA7DQo+ICsNCj4gK19fbm9yZXR1cm4g
c3RhdGljIHZvaWQgc2lndHJhcChpbnQgc2lnKSB7DQo+ICsJc2lnbG9uZ2ptcChqbXAsIHNpZyk7
DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogcHVyZ2VhYmxlX21hcmtfYW5kX3ZlcmlmeV9wdXJn
ZWQgLSBNYXJrIERPTlRORUVELCBwcmVzc3VyZSwgY2hlY2sNCj4gK3B1cmdlZA0KPiArICogQGZk
OiBEUk0gZmlsZSBkZXNjcmlwdG9yDQo+ICsgKiBAdm06IFZNIGhhbmRsZQ0KPiArICogQGFkZHI6
IFZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgQk8NCj4gKyAqIEBzaXplOiBTaXplIG9mIHRoZSBCTw0K
PiArICoNCj4gKyAqIFJldHVybnMgdHJ1ZSBpZiB0aGUgQk8gd2FzIHB1cmdlZCB1bmRlciBtZW1v
cnkgcHJlc3N1cmUuDQo+ICsgKi8NCj4gK3N0YXRpYyBib29sIHB1cmdlYWJsZV9tYXJrX2FuZF92
ZXJpZnlfcHVyZ2VkKGludCBmZCwgdWludDMyX3Qgdm0sDQo+ICt1aW50NjRfdCBhZGRyLCBzaXpl
X3Qgc2l6ZSkgew0KPiArCXVpbnQzMl90IHJldGFpbmVkOw0KPiArDQo+ICsJLyogTWFyayBhcyBE
T05UTkVFRCAqLw0KPiArCXJldGFpbmVkID0geGVfdm1fbWFkdmlzZV9wdXJnZWFibGUoZmQsIHZt
LCBhZGRyLCBzaXplLA0KPiArDQo+IERSTV9YRV9WTUFfUFVSR0VBQkxFX1NUQVRFX0RPTlRORUVE
KTsNCj4gKwlpZiAocmV0YWluZWQgIT0gMSkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsJ
LyogVHJpZ2dlciBtZW1vcnkgcHJlc3N1cmUgKi8NCj4gKwl0cmlnZ2VyX21lbW9yeV9wcmVzc3Vy
ZShmZCwgdm0pOw0KPiArDQo+ICsJLyogVmVyaWZ5IHB1cmdlZCAqLw0KPiArCXJldGFpbmVkID0g
eGVfdm1fbWFkdmlzZV9wdXJnZWFibGUoZmQsIHZtLCBhZGRyLCBzaXplLA0KPiArDQo+IERSTV9Y
RV9WTUFfUFVSR0VBQkxFX1NUQVRFX1dJTExORUVEKTsNCj4gKwlyZXR1cm4gcmV0YWluZWQgPT0g
MDsNCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiBwdXJnZWFibGVfc2V0dXBfc2ltcGxlX2JvIC0g
U2V0dXAgVk0gYW5kIGJpbmQgYSBzaW5nbGUgQk8NCj4gKyAqIEBmZDogRFJNIGZpbGUgZGVzY3Jp
cHRvcg0KPiArICogQHZtOiBPdXRwdXQgVk0gaGFuZGxlDQo+ICsgKiBAYm86IE91dHB1dCBCTyBo
YW5kbGUNCj4gKyAqIEBhZGRyOiBWaXJ0dWFsIGFkZHJlc3MgdG8gYmluZCBhdA0KPiArICogQHNp
emU6IFNpemUgb2YgdGhlIEJPDQo+ICsgKiBAdXNlX3NjcmF0Y2g6IFdoZXRoZXIgdG8gdXNlIHNj
cmF0Y2ggcGFnZSBmbGFnDQo+ICsgKg0KPiArICogSGVscGVyIHRvIGNyZWF0ZSBWTSwgQk8sIGFu
ZCBiaW5kIGl0IGF0IHRoZSBzcGVjaWZpZWQgYWRkcmVzcy4NCj4gKyAqLw0KPiArc3RhdGljIHZv
aWQgcHVyZ2VhYmxlX3NldHVwX3NpbXBsZV9ibyhpbnQgZmQsIHVpbnQzMl90ICp2bSwgdWludDMy
X3QgKmJvLA0KPiArCQkJCSAgICAgIHVpbnQ2NF90IGFkZHIsIHNpemVfdCBzaXplLCBib29sDQo+
IHVzZV9zY3JhdGNoKSB7DQo+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmMgPSB7DQo+ICsJCS50
eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9VU0VSX0ZFTkNFLA0KPiArCQkuZmxhZ3MgPSBEUk1fWEVf
U1lOQ19GTEFHX1NJR05BTCwNCj4gKwkJLnRpbWVsaW5lX3ZhbHVlID0gMSwNCj4gKwl9Ow0KPiAr
CXVpbnQ2NF90IHN5bmNfdmFsID0gMDsNCj4gKw0KPiArCSp2bSA9IHhlX3ZtX2NyZWF0ZShmZCwg
dXNlX3NjcmF0Y2ggPw0KPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfU0NSQVRDSF9QQUdFIDogMCwg
MCk7DQo+ICsJKmJvID0geGVfYm9fY3JlYXRlKGZkLCAqdm0sIHNpemUsIHZyYW1faWZfcG9zc2li
bGUoZmQsIDApLA0KPiArDQo+IERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9W
UkFNKTsNCj4gKw0KPiArCXN5bmMuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigmc3luY192YWwpOw0K
PiArCXhlX3ZtX2JpbmRfYXN5bmMoZmQsICp2bSwgMCwgKmJvLCAwLCBhZGRyLCBzaXplLCAmc3lu
YywgMSk7DQo+ICsJeGVfd2FpdF91ZmVuY2UoZmQsICZzeW5jX3ZhbCwgMSwgMCwgTlNFQ19QRVJf
U0VDKTsgfQ0KPiArDQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IGRvbnRuZWVkLWJlZm9yZS1tbWFw
DQo+ICsgKiBEZXNjcmlwdGlvbjogTWFyayBCTyBhcyBET05UTkVFRCBiZWZvcmUgbW1hcCwgdmVy
aWZ5IG1tYXAgZmFpbHMgb3INCj4gK1NJR0JVUyBvbiBhY2Nlc3MNCj4gKyAqIFRlc3QgY2F0ZWdv
cnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0KPiArICovDQo+ICtzdGF0aWMgdm9pZCB0ZXN0X2RvbnRu
ZWVkX2JlZm9yZV9tbWFwKGludCBmZCwgc3RydWN0DQo+ICtkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlICpod2UpIHsNCj4gKwl1aW50MzJfdCBibywgdm07DQo+ICsJdWludDY0X3QgYWRkciA9
IFBVUkdFQUJMRV9BRERSOw0KPiArCXNpemVfdCBib19zaXplID0gUFVSR0VBQkxFX0JPX1NJWkU7
DQo+ICsJdm9pZCAqbWFwOw0KPiArDQo+ICsJcHVyZ2VhYmxlX3NldHVwX3NpbXBsZV9ibyhmZCwg
JnZtLCAmYm8sIGFkZHIsIGJvX3NpemUsIGZhbHNlKTsNCj4gKwlpZiAoIXB1cmdlYWJsZV9tYXJr
X2FuZF92ZXJpZnlfcHVyZ2VkKGZkLCB2bSwgYWRkciwgYm9fc2l6ZSkpDQo+ICsJCWlndF9za2lw
KCJVbmFibGUgdG8gaW5kdWNlIHB1cmdlIG9uIHRoaXMgcGxhdGZvcm0vY29uZmlnIik7DQo+ICsN
Cj4gKwkvKiBtbWFwIHRoZSBwdXJnZWQgQk8gLSBhY2Nlc3Mgc2hvdWxkIHRyaWdnZXIgU0lHQlVT
ICovDQo+ICsJbWFwID0geGVfYm9fbWFwKGZkLCBibywgYm9fc2l6ZSk7DQo+ICsNCj4gKwl7DQo+
ICsJCXNpZ2hhbmRsZXJfdCBvbGRfc2lnc2Vndiwgb2xkX3NpZ2J1czsNCj4gKwkJY2hhciAqcHRy
ID0gKGNoYXIgKiltYXA7DQo+ICsJCWludCBzaWc7DQo+ICsNCj4gKwkJb2xkX3NpZ3NlZ3YgPSBz
aWduYWwoU0lHU0VHViwgKF9fc2lnaGFuZGxlcl90KXNpZ3RyYXApOw0KPiArCQlvbGRfc2lnYnVz
ID0gc2lnbmFsKFNJR0JVUywgKF9fc2lnaGFuZGxlcl90KXNpZ3RyYXApOw0KPiArDQo+ICsJCXNp
ZyA9IHNpZ3NldGptcChqbXAsIFNJR0JVUyB8IFNJR1NFR1YpOw0KPiArCQlzd2l0Y2ggKHNpZykg
ew0KPiArCQljYXNlIFNJR0JVUzoNCj4gKwkJY2FzZSBTSUdTRUdWOg0KPiArCQkJLyogRXhwZWN0
ZWQgLSBwdXJnZWQgQk8gYWNjZXNzIGZhaWxlZCAqLw0KPiArCQkJYnJlYWs7DQo+ICsJCWNhc2Ug
MDoNCj4gKwkJCSpwdHIgPSAwOw0KPiArCQkJX19hdHRyaWJ1dGVfXyAoKGZhbGx0aHJvdWdoKSk7
DQo+ICsJCWRlZmF1bHQ6DQo+ICsJCQlpZ3RfYXNzZXJ0X2YoZmFsc2UsDQo+ICsJCQkJICAgICAi
QWNjZXNzIHRvIHB1cmdlZCBtbWFwIHNob3VsZCB0cmlnZ2VyDQo+IFNJR0JVUywgZ290IHNpZz0l
ZFxuIiwNCj4gKwkJCQkgICAgIHNpZyk7DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArDQo+ICsJ
CXNpZ25hbChTSUdCVVMsIG9sZF9zaWdidXMpOw0KPiArCQlzaWduYWwoU0lHU0VHViwgb2xkX3Np
Z3NlZ3YpOw0KPiArCQltdW5tYXAobWFwLCBib19zaXplKTsNCj4gKwl9DQpDYW4geW91IHBsZWFz
ZSBtb3ZlIG11bm1hcCBvdXQgb2YgYmxvY2sNCmFuZCBvbmUgdGhpbmcgZGlkIG5vdCBnZXQgaG93
IGlndCBpcyByZWNlaXZpbmcgdGhlIFNJR1NFVg0KaWYgSSBjb21tZW50IHRoZSBTSUdOQUwgY29k
ZSBhbSBub3QgcmVjZWl2aW5nIGFueSBlcnJvciBmcm9tIGtlcm5lbC4gQ2FuIHlvdSBwbGVhc2Ug
cGFzdGUgdGhlIG91dHB1dCBob3cgU0lHU0VHViBlcnJvciB3aWxsIGJlIHNlZW4gZnJvbSBrZXJu
ZWwNCj4gKw0KPiArCWdlbV9jbG9zZShmZCwgYm8pOw0KPiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZt
KTsNCj4gK30NCj4gKw0KPiAraW50IGlndF9tYWluKCkNCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX3hl
X2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHdlOw0KPiArCWludCBmZDsNCj4gKw0KPiArCWlndF9m
aXh0dXJlKCkgew0KPiArCQlmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiArCQl4
ZV9kZXZpY2VfZ2V0KGZkKTsNCj4gKwl9DQo+ICsNCj4gKwlpZ3Rfc3VidGVzdCgiZG9udG5lZWQt
YmVmb3JlLW1tYXAiKQ0KPiArCQl4ZV9mb3JfZWFjaF9lbmdpbmUoZmQsIGh3ZSkgew0KPiArCQkJ
dGVzdF9kb250bmVlZF9iZWZvcmVfbW1hcChmZCwgaHdlKTsNCj4gKwkJCWJyZWFrOw0KPiArCQl9
DQo+ICsNCj4gKwlpZ3RfZml4dHVyZSgpIHsNCj4gKwkJeGVfZGV2aWNlX3B1dChmZCk7DQo+ICsJ
CWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiArCX0NCj4gK30NCj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L21lc29uLmJ1aWxkIGIvdGVzdHMvbWVzb24uYnVpbGQgaW5kZXgNCj4gMGFkNzI4Yjg3Li45ZDQx
ZDdkZTYgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL21lc29uLmJ1aWxkDQo+ICsrKyBiL3Rlc3RzL21l
c29uLmJ1aWxkDQo+IEBAIC0zMTMsNiArMzEzLDcgQEAgaW50ZWxfeGVfcHJvZ3MgPSBbDQo+ICAJ
J3hlX2h1Y19jb3B5JywNCj4gIAkneGVfaW50ZWxfYmInLA0KPiAgCSd4ZV9saXZlX2t0ZXN0JywN
Cj4gKwkneGVfbWFkdmlzZScsDQo+ICAJJ3hlX21lZGlhX2ZpbGwnLA0KPiAgCSd4ZV9tbWFwJywN
Cj4gICAgICAgICAgJ3hlX21vZHVsZV9sb2FkJywNCj4gLS0NCj4gMi40My4wDQoNCg==
