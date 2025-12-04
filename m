Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8803D20690
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 13:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A562110E961;
	Thu,  4 Dec 2025 13:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiOQRQRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3405C10E961
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764854804; x=1796390804;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3/MRGurxm/rURWuWYOfdpmwkIDFXXXug8VwwwhGDuK0=;
 b=UiOQRQRyAgZVekofxCDyL5YdDfcjetOXfZIbcfdrOzahqStatmXZupQR
 JG6x2SOLfHFHKMUk5idSznWaThTVnXSIkYyJIJ541Ac6WExh1ta/dkBsE
 SgxELAdmMCfTiHU16FB76/yj+kHERHx1cNs7icq31QjA1dBwgac33K/aX
 7j6TjCt8tSPvyl/W4P9SFLQnVGjghtN6y5JLFustho6FYzQfAPbYghNSM
 r9txExootKUvuV/+QxVKEN4699LT/IYYiSG6WaRr4dVuB0/hfscvmFm55
 KmDNWy+RakEeLAU1EzW97fO2JrR/zE2tA9fd8ZmmsiHcCT0hllKFH5IcQ A==;
X-CSE-ConnectionGUID: uYK0TxR0QK2UyNTfj5u9iw==
X-CSE-MsgGUID: 6mVdOQgQT82mFGXwC7Xk8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66914382"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="66914382"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:26:43 -0800
X-CSE-ConnectionGUID: dNBcBq9oS2iYVmZEKADlHw==
X-CSE-MsgGUID: +pHNkdMwQV6ubCbQXuazlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="195796099"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:26:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 05:26:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 05:26:42 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.48)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 05:26:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbPVuE1gCYa2B2F+qPUISGsHLceufMpmyw05wBotgRDccsDjmeiskxGC1pVTFrBrRPOXcOxA/bHaKo1SlRsPde9UOn6p0RV3lOmp+KH9CmtE4tUluSOOUzs/XXAGOmkTvq5KIUZHoW73vFPfQtGZZV0GzmWuDnG7Grx4IqakVOegWmGbRcyQbc6C+QobdE3PMN/v1Oi61vXM5C7F1mnR/DzlSXDdsTx542e/7q9wfGUwpywjXkxvTUtswZ9fsBpgsKy5w2zYoD6xKWQN7gvmxBOm/Ogxau4r/F+/u76emqssC0bvCEY81Ua6Aj+ENkwHZv38LoByJTIbEvEFuM1LBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/MRGurxm/rURWuWYOfdpmwkIDFXXXug8VwwwhGDuK0=;
 b=pkhCjWyWHNXOjwHQEl1BwgF88RiQs+3JgXnv0xsNUFNL9P0HtJMC/6z+oSwNzXlbaTrJ/xDwTf4W7Zr4k6yeeNs99D4kS/8AyJqflfXtZa2sAmARnkXMXZXV65xIqZxFRlxXd7lbAjDuwMJ3xfDApQy5JYyXumrImzRB1Eso6OwBelkI+fnjK8hpFlGBPFbK4DOoUmxyKEfbSoNfn/M9av6QpAbOwjd8N3/NvK15hbDKar/GVDhEimNiWLbTY8O1l3ylXeW8exbz6LM1VHcjPkHFZLQkqjVKVPsTag9N22qhHE4U5HEXUUlYspWjtA1YTgt0EgBhg9Ur20fIzpiACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by SA1PR11MB6823.namprd11.prod.outlook.com
 (2603:10b6:806:2b0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 13:26:35 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::6b12:23d6:2632:cb04]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::6b12:23d6:2632:cb04%8]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 13:26:34 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "marcin.bernatowicz@linux.intel.com" <marcin.bernatowicz@linux.intel.com>,
 "Tahvanainen, Jari" <jari.tahvanainen@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "adam.miszczak@linux.intel.com" <adam.miszczak@linux.intel.com>
Subject: Re: [PATCH i-g-t v1 0/3] intel-ci: unify Xe and i915 block/test/lists
Thread-Topic: [PATCH i-g-t v1 0/3] intel-ci: unify Xe and i915 block/test/lists
Thread-Index: AQHcY7bFBn9ekgQR/EWe6TUr3h9EKbURe8mA
Date: Thu, 4 Dec 2025 13:26:34 +0000
Message-ID: <d8e1d72edc185b92008f8fc212aa2c9f366ceec8.camel@intel.com>
References: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|SA1PR11MB6823:EE_
x-ms-office365-filtering-correlation-id: 33df25a6-25a3-43e8-2d2c-08de3338bf06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RHNBK3FrSktuVHoxTUdPQTJlNXh1Y01PditZTklYQzdTd2l0UGVjNVhqN3Fi?=
 =?utf-8?B?UE1zQ1prZXBUZmRkU2xmNlRFcGJ6Uy9pODV1SkJod2JzcWtBTzQ0MS9aQ3B5?=
 =?utf-8?B?VXZGc0NWdlFYSFRPTTY4RjczelVWbkZCT3RvVXAyRFJjS3ZKakNXd1NGazRx?=
 =?utf-8?B?RU5Bb1VUOTYrRnhQc0Z5cEhQTHhORUJQWGR4S3E3MXBwT0FidGNhWUZOZTZq?=
 =?utf-8?B?L0N0RmFqdlgvZ2g3eS85OE9VRmYvUkZvaXRmbERxbFhsZHp0d2tlWUUxUUNU?=
 =?utf-8?B?UGN3bXRGdFJVblozUlVGcEV4bE1IMTdpenJBbHBBZUtkd1FYUEpSVHV3aTF4?=
 =?utf-8?B?ZEFBV1lkeDNqQnVLaWNBaVYxWWt2QjhuVlAxSk1JUUEwbVNnb3F2akxBVXB2?=
 =?utf-8?B?RjNENnpCZ1NjSUMrajN5MjJ3aEFlNXgvQTNRNURuRjRJUjhUSGllZ3E3ZEtI?=
 =?utf-8?B?TjRFYUVsQWdrSjgzMnpidzlrUUh3K3RsM3dxOUpXY0NVMmRXakJyRTRyUURq?=
 =?utf-8?B?Q3JtWXU2Sm5kZkd5d0JjT204MkxpdmR4elhUWWNtK3l1Y3MvZS9ZU3dPOWN6?=
 =?utf-8?B?UmZEUjZWNHFJazlxQmdobjMzTWlFUjF1NDhXMUhHaTJBbjFoUkUwZ3gxekN4?=
 =?utf-8?B?L0J2NVJnMDNyQ3o3S3RJeFUyNDVwSUVoQ2VmRGNPcTJJUkI2OXliNnE3U2hS?=
 =?utf-8?B?VElGTWdkbWRUQ29MTmU1aUpHdmxMMm55WTl2ZHMxSXpyeVZJaUZEQmN3ZVhl?=
 =?utf-8?B?Y2dSOHg1bXk3emZ3SFdrWHEvUE5RS2NVVjJUWlE2VERXcHkwMUNMTWgrdzgr?=
 =?utf-8?B?cFpwaXRRNE16SXczRnQ5M0dCeFBQbEYydVVpSGwrR0RqRmphTmRkYUI4UXNv?=
 =?utf-8?B?VldlSk5FOFZxUWZ5VTJ2T3pmNTZSajFucjRUdmFJSnQxR1FoUnU4aG5TYlhl?=
 =?utf-8?B?RTY2MVB0RVZPYzFqVDl4cUJqMGxwL1lRMG5sZ1p3SFZGa0xOZ3kyYStoc3Zw?=
 =?utf-8?B?eThnSWVYVER4VnR3TzVVMllsNTlMeFpodGdqODdxaTk2eFdoQmlEZUR5Wk9D?=
 =?utf-8?B?MHdrY3ZrVEJRa0pvV09BdlR1Q3VNb05FTlBkaldvcWphMnNBN0xlcEJ0eDFG?=
 =?utf-8?B?bkdrTEJob3JRMTd6S2tqTWU4ZzNadGk0T2ExWnliS3VBRUFvcmM4THJWMUR6?=
 =?utf-8?B?U2FsemR0dzdPNDFiVS8yZ3ZBOVpKNm9yYjN0M1V5MkU2RG5RbTllRGJVMWdF?=
 =?utf-8?B?Q1Q2d3pGOHZDNU5iZUlBanluUC8vdTI5a3lYU2FEK2JIanJpU2x4MVBJR01o?=
 =?utf-8?B?aU44UGVzRXJHQnk3QlB6bmhJVGxYY3dBM0xCVkhRWXJYTmkwOVMzWlJUTmVv?=
 =?utf-8?B?ODhhdVZETkc3alBqQ25yV05XNFcwVEdkZmhmaGdubzZyLzlRUW5hRlEweUto?=
 =?utf-8?B?bWw3QklHVjJldXd0dkdKUFFLTVBNVy9CTjd2UElzN3UveldMUlFSYUxQR2ZB?=
 =?utf-8?B?cFZCWHAwQVprcDhXU2dIbTBOdWVBaXRGZmJJWUJRN2N3Y01xY2ZYVE9lN3Z2?=
 =?utf-8?B?NGtJYnJlWTJ2RWNLWEFQQnkvREZCdFpBOGRVZ0wvUDdOWGN5VHZjWU5kSkN3?=
 =?utf-8?B?dVhkbVcvWUVQVldab2o1U1NCbWNNYzV6d2FrVENkRmVUTnZHMi9qeG9wRVVo?=
 =?utf-8?B?ak5uWTk3TS9XTGtXbHNvb296b3ltNys2QndMdGFEQnoxVU8xL3ZrT0Z6UWMy?=
 =?utf-8?B?WXNhSXgxNHRtbTJCS2M0UTBVcFdaYzhCcWlPOGxiUGp4N3kwQXBHMm5od1li?=
 =?utf-8?B?L21IK1k1djM0dXVhNnljVjNWWG8zSDVlbm1kMlQ2Y2NrbWtXWHltTTJJTWFp?=
 =?utf-8?B?K2lXaVNxaERSMWhDS1YwekYxd3NXZTdXdmVaRVgwaVpDNWk0OTZ0ZTREZi9E?=
 =?utf-8?B?RDEySU1YQ3RJTmJGKzhpQjEvWlRQRGp0RGRVdG9VeC9uSFpCQy9WWnQwY2RH?=
 =?utf-8?B?aXJRZmlLcVhTWjZyRnJhYno1Qk5rOTZDOFFBYkpBbWxIaEU3T0M4L2NlVVVj?=
 =?utf-8?Q?zXAftQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTZNOTJqQ0M3dm01WlBEZWZJZklrQkFVMW8yV3gvYThMQ1pDKy9OUkh1d1N6?=
 =?utf-8?B?M2VSb2xxdU85U2dHOE1zZ3QycGV4ei9hN3hMUG14Y0NxMHA4SXNFUmlkclls?=
 =?utf-8?B?L2VXYmNJMW5QdmJNY3NSRFRLUlhtalhucXNXT0NtMEJlOE5qaCswV004bW9N?=
 =?utf-8?B?cElGb2QyRysyWXZXL0VCTkpJd1EyOVJDR0dXYjVNV2pNcGN5OFZOajJwQ1Iw?=
 =?utf-8?B?UnhqejdEYUpUYTlJUXFoRVBBTlQxTmxpNzJZa0ZIRTVjeUZmTERaU0FYaTJt?=
 =?utf-8?B?TXNsMlRHUjQrZFpldUJpMFFzZWNWdGhTVzBONUJYK2VzQjVGZ2FHb2swUHBB?=
 =?utf-8?B?bndFeUdvcWRSRDEvdUM4T1Q5clZWN3Q0ZDdMbDNGOVNpVDFSdndrR0JuaE12?=
 =?utf-8?B?TFNScEVGU2M2MkdOZEp5RlRaWndmNlFFQ3VOY2dpbkxoY2RHaFE3d3pIUXpD?=
 =?utf-8?B?Ty8rSTJacXFTR2dNL1lKeEpWS0lqRXZKUDFYT1luSWdrNzBXRUs2SFlmR3px?=
 =?utf-8?B?ZlNNclNJQzZ2VzBMUzVDZWc0bEsrT2NnWEJKOVRxV2F6eGFBWkZadGYyWWpT?=
 =?utf-8?B?TnBQZzk2bHFXU0U4YVR5QjRXMy9zbGw1bkhuckxoV3ZsVzJLa2N1N3duZUdD?=
 =?utf-8?B?K2RiZi8za1RJMTRCOWNqaWpsN3k5Z3llVWUrVzd3eU1LTFQ2L05UTWxqOFhN?=
 =?utf-8?B?SFRsUnZMSjV3ZDNscmVVVFJQS0p0Q3F4QnRmU1lnTGlOVzhKWFZ5VTYrN0F3?=
 =?utf-8?B?ejFqZlVlMkZCSGZSVlptZ1YxZFNIU1M0dGpEcndJWlBWMFJHRlI5Qkd6YTht?=
 =?utf-8?B?UDhBQXhEMVhXMjROYlM3QnhVTFFOeEcyYlNxZEVjdEVFTUZvOVZLZVJzTDZs?=
 =?utf-8?B?a2RRcFA1b0Z4UlEzYy8yajc5dk8xWk1uYStIbmJQNVg5Wm9ka2hXT09WOGZD?=
 =?utf-8?B?OElqOStNOUdjWjhWKzZJM0dkcEhBcmUwZWVBQlNOSGhhODZvU2ZvNW1FTXA5?=
 =?utf-8?B?YmVhOFlVS3A0UlFRVi9KNnJJaGdoQ0VSdUxPU3d5elFPcENHRzV4bkZiUFJz?=
 =?utf-8?B?eWxkamZtSjB5ajFGZjdQWFlma094K0hLd3JQQzkxaGxJR0NsUUZ0dW5kUTlh?=
 =?utf-8?B?bzNYanBVdlE1ZzZ2TjRPVllRQ3BTQnpBTDlwNEx1NU8zbDFFdDJiejMrSis5?=
 =?utf-8?B?czZ2Y2hhRXljNjNOaWlvOTFtM2RSWXZKS3d6STdkakg5elhMNkRsSmNFQTFm?=
 =?utf-8?B?M0U5eHlheWUrMFRldzRzR1k2MkFnVDBkYWg5YUFsRFFUUWQ1UEFiUWdiaEJ5?=
 =?utf-8?B?bDhVNzlRQ3NuVXJSVGE5V3d1V1lpVVNEUkxJdlBRV1J4ZkR3bkpOeVRIelR2?=
 =?utf-8?B?Uzl0S3F0OEs3dTlRZWtSS0hVb3V4dm5SRnBTczdjbVliZ0k1NktNRDA5eUxP?=
 =?utf-8?B?bUdVTUhDK2NaNmtobTdrOWJHT3FXVkN6RjBFb3VCT2V5QVZNUGh5ckNJVktQ?=
 =?utf-8?B?V2h1NmttV3lJcHJ5VkdHMDRtM1B1b1NxbENYd1AwVURrMHJnbDZZQ2dQT1Fm?=
 =?utf-8?B?WmRvR0NuOVJnbStHUDRKbUkzdkQ0bnRWRytDcE4yamxBTDRPbnR3M0VIQUZC?=
 =?utf-8?B?MEs5Z2pBdGZPZDJsT3pCQjU3U3BBMEVYemFCZmRwYzNETHJtNGp4c2V2K05z?=
 =?utf-8?B?SDd6YURnZHlBOWQ3WWxvdXpxMExkVndDcFhKU0QxMk55NWFDMTFicUJxQmNB?=
 =?utf-8?B?d2c1Z0x3UGtwU3lLMjc0ZVNNYjRVUUxhT3Z3d2JmL2d5RmNYcE1xREZiMVZ2?=
 =?utf-8?B?c1kzNFY4U2IzdFJ0T2g3Nm4wbi93ZnFKOUlic24vNTRRNy83a1o5Q1lld2Zp?=
 =?utf-8?B?Wk10NG9kSTduRk5qdXB5TjhXOU1EdnFlb25xVzRab3hxZlB1RThKWnBpMHdk?=
 =?utf-8?B?cHN2dTQrZjE3L1RabXpRc09sRVg1eFYvNEliQXJDZ2NuOHg0VnUwbndCc0Z3?=
 =?utf-8?B?SFgzS3p1cmxhSGV1SVFhRk96c2FmYnQ1VHJPamYvWDB6Wkw1c2w4eWI3ZU5s?=
 =?utf-8?B?N3RxdWxWREJWY2U5NmNYaHZFSUIrc25GUEt3cjNVdy9qNENDWC9jNmtiYWVn?=
 =?utf-8?B?ekxQajJxYzRIU2JyWitVeTBXMkpaVHJqNEZFREhEcFFUU0lLdkdIaGZlTnJJ?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03173664C24DA7408E42FC247A13B576@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33df25a6-25a3-43e8-2d2c-08de3338bf06
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 13:26:34.8792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KiE3idUGd8f5vMMVdvRd9NyBp42hf5C/ytBbl4nX+d/qPOp+VWF3ia9/2ewrqb43LaFN30wID7pDsCUe7hfHeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6823
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

TEdUTSwgZm9yIHRoaXMgZW50aXJlIHNlcmllcyAod2l0aG91dCBzeW1saW5rIHJlbW92YWwgZm9y
IG5vdywgd29ya2luZw0Kb24gaXQgb24gdGhlIENJIGNvbmZpZyBzaWRlKToNCg0KUmV2aWV3ZWQt
Ynk6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCg0KT24gVHVlLCAyMDI1
LTEyLTAyIGF0IDE5OjA4ICswMTAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+IFVuaWZ5IG5h
bWUgZm9yIHhlIGJsb2NrL3Rlc3RsaXN0cyBpbnRvIHhlLnJlc3Qtb2YtbmFtZQ0KPiBSZW5hbWUg
YWxzbyBpOTE1LmNoYW1lbGl1bS1vbmx5LnRlc3RsaXN0IGludG8gbWFpbiBvbmUgd2l0aG91dA0K
PiBwcmVmaXggYW5kIGNyZWF0ZSB0d28gc3ltbGlua3MgZm9yIGl0Lg0KPiANCj4gQ2M6IFJ5c3ph
cmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCj4gQ2M6IEphcmkgVGFodmFuYWluZW4g
PGphcmkudGFodmFuYWluZW5AaW50ZWwuY29tPg0KPiBDYzogS2FydGhpayBCIFMgPGthcnRoaWsu
Yi5zQGludGVsLmNvbT4NCj4gQ2M6IFN3YXRpIFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5j
b20+DQo+IENjOiBKYWt1YiBLb2xha293c2tpIDxqYWt1YjEua29sYWtvd3NraUBpbnRlbC5jb20+
DQo+IENjOiBBZGFtIE1pc3pjemFrIDxhZGFtLm1pc3pjemFrQGxpbnV4LmludGVsLmNvbT4NCj4g
Q2M6IE1hcmNpbiBCZXJuYXRvd2ljeiA8bWFyY2luLmJlcm5hdG93aWN6QGxpbnV4LmludGVsLmNv
bT4NCj4gQ2M6IEx1a2FzeiBMYWd1bmEgPGx1a2Fzei5sYWd1bmFAaW50ZWwuY29tPg0KPiBDYzog
U2F0eWFuYXJheWFuYSBLIFYgUCA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+IENj
OiBNYXJjaW4gQmVybmF0b3dpY3ogPG1hcmNpbi5iZXJuYXRvd2ljekBsaW51eC5pbnRlbC5jb20+
DQo+IA0KPiBLYW1pbCBLb25pZWN6bnkgKDMpOg0KPiAgIGludGVsLWNpOiB1bmlmeSBYZSBsaXN0
cyBuYW1pbmcNCj4gICBpbnRlbC1jaTogQWRkIHN5bWxpbmtzIGZvciBYZSBsaXN0cw0KPiAgIGlu
dGVsLWNpOiB1bmlmeSBjaGFtZWxpdW0gdGVzdGxpc3QNCj4gDQo+ICB0ZXN0cy9pbnRlbC1jaS9j
aGFtZWxpdW0tb25seS50ZXN0bGlzdCAgICAgICAgfCAgNzAgKysrKy0NCj4gIHRlc3RzL2ludGVs
LWNpL2k5MTUuY2hhbWVsaXVtLW9ubHkudGVzdGxpc3QgICB8ICA3MCArLS0tLQ0KPiAgdGVzdHMv
aW50ZWwtY2kvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICAgIHwgICA5ICstDQo+ICAuLi4v
eGUtZmFzdC1mZWVkYmFjay1jaGFtZWxpdW0tb25seS50ZXN0bGlzdCAgfCAgMTYgKy0NCj4gIHRl
c3RzL2ludGVsLWNpL3hlLWZhc3QtZmVlZGJhY2sudGVzdGxpc3QgICAgICB8IDI3OCArLS0tLS0t
LS0tLS0tLS0tLS0NCj4gIHRlc3RzL2ludGVsLWNpL3hlLXNyaW92LXZmLmJsb2NrbGlzdC50eHQg
ICAgICB8ICA2MCArLS0tDQo+ICB0ZXN0cy9pbnRlbC1jaS94ZS1zcmlvdi12bS5ibG9ja2xpc3Qu
dHh0ICAgICAgfCAgNjEgKy0tLQ0KPiAgdGVzdHMvaW50ZWwtY2kveGUuY2hhbWVsaXVtLW9ubHku
dGVzdGxpc3QgICAgIHwgICAxICsNCj4gIC4uLi94ZS5mYXN0LWZlZWRiYWNrLWNoYW1lbGl1bS1v
bmx5LnRlc3RsaXN0ICB8ICAxNSArDQo+ICB0ZXN0cy9pbnRlbC1jaS94ZS5mYXN0LWZlZWRiYWNr
LnRlc3RsaXN0ICAgICAgfCAyNzcgKysrKysrKysrKysrKysrKysNCj4gIHRlc3RzL2ludGVsLWNp
L3hlLnNyaW92LXZmLmJsb2NrbGlzdC50eHQgICAgICB8ICA1OSArKysrDQo+ICB0ZXN0cy9pbnRl
bC1jaS94ZS5zcmlvdi12bS5ibG9ja2xpc3QudHh0ICAgICAgfCAgNjAgKysrKw0KPiAgdGVzdHMv
aW50ZWwva21zX3Rlc3RfY29uZmlnLmpzb24gICAgICAgICAgICAgIHwgICA2ICstDQo+ICB0ZXN0
cy9pbnRlbC94ZV90ZXN0X2NvbmZpZy5qc29uICAgICAgICAgICAgICAgfCAgIDYgKy0NCj4gIDE0
IGZpbGVzIGNoYW5nZWQsIDQ5NiBpbnNlcnRpb25zKCspLCA0OTIgZGVsZXRpb25zKC0pDQo+ICBt
b2RlIGNoYW5nZSAxMjAwMDAgPT4gMTAwNjQ0IHRlc3RzL2ludGVsLWNpL2NoYW1lbGl1bS1vbmx5
LnRlc3RsaXN0DQo+ICBtb2RlIGNoYW5nZSAxMDA2NDQgPT4gMTIwMDAwIHRlc3RzL2ludGVsLWNp
L2k5MTUuY2hhbWVsaXVtLW9ubHkudGVzdGxpc3QNCj4gIG1vZGUgY2hhbmdlIDEwMDY0NCA9PiAx
MjAwMDAgdGVzdHMvaW50ZWwtY2kveGUtZmFzdC1mZWVkYmFjay1jaGFtZWxpdW0tb25seS50ZXN0
bGlzdA0KPiAgbW9kZSBjaGFuZ2UgMTAwNjQ0ID0+IDEyMDAwMCB0ZXN0cy9pbnRlbC1jaS94ZS1m
YXN0LWZlZWRiYWNrLnRlc3RsaXN0DQo+ICBtb2RlIGNoYW5nZSAxMDA2NDQgPT4gMTIwMDAwIHRl
c3RzL2ludGVsLWNpL3hlLXNyaW92LXZmLmJsb2NrbGlzdC50eHQNCj4gIG1vZGUgY2hhbmdlIDEw
MDY0NCA9PiAxMjAwMDAgdGVzdHMvaW50ZWwtY2kveGUtc3Jpb3Ytdm0uYmxvY2tsaXN0LnR4dA0K
PiAgY3JlYXRlIG1vZGUgMTIwMDAwIHRlc3RzL2ludGVsLWNpL3hlLmNoYW1lbGl1bS1vbmx5LnRl
c3RsaXN0DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvaW50ZWwtY2kveGUuZmFzdC1mZWVk
YmFjay1jaGFtZWxpdW0tb25seS50ZXN0bGlzdA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3Rz
L2ludGVsLWNpL3hlLmZhc3QtZmVlZGJhY2sudGVzdGxpc3QNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0ZXN0cy9pbnRlbC1jaS94ZS5zcmlvdi12Zi5ibG9ja2xpc3QudHh0DQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgdGVzdHMvaW50ZWwtY2kveGUuc3Jpb3Ytdm0uYmxvY2tsaXN0LnR4dA0K
