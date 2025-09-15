Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369CFCAC58F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 07:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE91410E2BF;
	Mon, 15 Sep 2025 07:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLHTv7aG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8BC10E2BF
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757922418; x=1789458418;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MWbmCyM+NZj9MEqH5vRj3P+jXky8cHgBGCdS8PZkgWA=;
 b=SLHTv7aG74FytxfgnizA7AHH6cZp1/djnYq9vZBisM73ovAPABrHqTbN
 GGny1eemdeMwVf217moIHSwvqT29PCt88/vFjljfs2qwLwJ70oW9HGo1z
 33TQ+YRTlketJ5VwaaCet6pQcKIRK033hnFou5XaI9l3+DF8pJYcoQsAX
 Bja2i5PIGaR+HTgvcGA7yNzg7nH5O7D75922gfJvy9UNB8BPVpiaykymD
 qM4QXSaMfKJZvMCYBRS9FsoUY5Ja8YX03JEJWGe0KvSQQuvhxygWrW3rW
 HeYdyNEnEkW8BbfIxmLXU4cpEpOm6BUcmc/vQHIBbdUMSj5mcDWOOHOZi Q==;
X-CSE-ConnectionGUID: bAhkpBXsQ4eaiRakGRuckg==
X-CSE-MsgGUID: Tsx2QVrKRH6sCxuIUrziuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60312061"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="60312061"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:46:57 -0700
X-CSE-ConnectionGUID: CNSRSpJzQDanrq+fwN4XEg==
X-CSE-MsgGUID: C0tx5AUQSY6jtufZ+1CLvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="178862684"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:46:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 00:46:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 00:46:56 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.88)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 00:46:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCHKdVxGWHqJwWObjzP8tRkm7hEdXAjbSMvhKQVsBGR10D26LtLxrXKrQTmFbhXGLWPaxw1nApayI+nIbnLMJZKgJ15nKjLp+EuOtUjcbIyRqSI38ZXjAlnXsedoeW2U08UUQJnYUUd4t/fgdt1sGvUFUSvcGZhDzwIjYlGlJXXKSxCiizyfsdyqAtOtnchRaLN4A6Y0k696cpu4FqQUA5QgQ1JtjKO5Svh+WyAguuK12eeGADwtFb97OFBDWcmRK5Z5eNtXFFhoVom7cuRZ1T8Osf7t3plv7A+E7L423xw3xJ3zlsZ8Yg4PFgUeFIGb0pp1Wh6wjI7J3wSjqDVfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWbmCyM+NZj9MEqH5vRj3P+jXky8cHgBGCdS8PZkgWA=;
 b=I1HT0rtB2Gi5HkxNgV0TrRreTjwrPz2e6qyluWQ/z8fkGWfj4xekkF4/YkQRvkkiO/WPZpzQifKc4DwgwhA7Oz8BfGEQJIKFlgNDWr1Q0KtUqzOzyhDisFZF0XgHGqB2yZdZX5BxFSQSdag3aHAJ8zWPsExUXZnjFamqbrXIeTiZmvWGAW9ojJLVKsNpM7yeVaTiQuTsty/pkDNXjtYEA3tJadGJUJifwJogM3IF9O/5mUygPOrhJfQAAdaiiIoaSOSeM/UhP8Jkz+CeEWsYzfxQZO8xhtTHcuFADO7uNeE4YMOiPsRl3AcTUv1+otxiJgT+qhdAAHJKODm7zSXwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by CY8PR11MB7899.namprd11.prod.outlook.com (2603:10b6:930:7e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 07:46:53 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 07:46:53 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_concurrent: Add SYSVIPC support check
Thread-Topic: [PATCH i-g-t] tests/kms_concurrent: Add SYSVIPC support check
Thread-Index: AQHcIJ4dlxODJD6kuk+IaxLdBeIhvbSKiiuAgAldoCA=
Date: Mon, 15 Sep 2025 07:46:53 +0000
Message-ID: <CH0PR11MB5427022BC7CC6BDC7C9FB4739815A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20250908084631.2676274-1-s.sebinraj@intel.com>
 <20250909084241.kowpxt55wwicrp6n@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250909084241.kowpxt55wwicrp6n@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|CY8PR11MB7899:EE_
x-ms-office365-filtering-correlation-id: 12980494-01bb-4dd9-cb95-08ddf42c09ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eHNUc01FNzV1Q1pOaUhQMllJVlRDa1EzRUNnZ2ExSEtUWWVjWkVNWmpkRHRF?=
 =?utf-8?B?cG9qdE1Kd1ByY0NBN1BjTkFpYnBCeHFadGp6WTdGUzRnaUJRc1JzcUJobUQ2?=
 =?utf-8?B?bVJHOEFpTVJ1N1RqWXVhcjF5UVN6SnpmZkVuU0owU21kVUlSWXY2aElQK1g5?=
 =?utf-8?B?eFV4QzVnNFhtcGJIMVdiaUVaVlduR2lsaHhWZG1YcFJmaW0rOG9yYkIzN0RK?=
 =?utf-8?B?RHdUNldvYWd0OVQ5Qk0vQzVVWklqRXJVdTBMZlJKaGxPUkprUm4vaE9BZzJD?=
 =?utf-8?B?by9BQmlMWHE1QzZJbVBLZGVVWkdNWW5SM3Q2V0pjR3B0VnNHd3I1Um53dVFs?=
 =?utf-8?B?RUVvM05yMWFGbzA0Vm5GQVorUUNtcm9WNXFVWXg0MDk2ckVYZ1VkR1k4b3Jp?=
 =?utf-8?B?dW1MQ3VwVU5sRU1icEVRUUN6ckNxa2RSdnp5Tkd6TWRHMk9GeFQrREsvQnpS?=
 =?utf-8?B?NDJkMlFaMkJnd2xkVGdoYU5BOVE5V1dhTyszemtoYzVnVWJTc29uU2djKzBE?=
 =?utf-8?B?TGtqOWNVSTBlcFRRMWtxRC9GNEYyM1QxM0F3Rkk1Q21IeEZkcEIxdUF4RmU3?=
 =?utf-8?B?Um81emVGSUw1N1NyNjJKd0lUT29PcTdPaGk5ZUhSZDM3VGswbUQyVzMzS0No?=
 =?utf-8?B?ZlFnUnVWM0tFQk13UHl5QXVuaEpzcGlWYmcvSTFhWmxrUDZ6bUxqSXcvck9r?=
 =?utf-8?B?M2lQeEZOMlBSNjJKNlRnMTVOTFYyTDBaN1ZNd2d3YXZVTldUakdDNnBuUzFr?=
 =?utf-8?B?bFFqTjc5YlFuK3JxbDhaQjhxUWF1VGZTNFo4MWduN2I4ZHRGUHRheEdhUUVF?=
 =?utf-8?B?NDhLOHJqL0trQ29QcHA4TmRKNEVtRURkMXhWcHNUd2ZST2xZTzNCckE4Ri9J?=
 =?utf-8?B?OUlaSGJwZFdDd1NBcDlLMkdlVElzUGNiK0d5bURsblJHcmZEYlZKUHRFQTBN?=
 =?utf-8?B?ZlpqMmpKNWZmS1pHMm1IR29jSm4xZXhNUG52SWo3WkViTDRnQjJUbXJFK2lH?=
 =?utf-8?B?aVlqeE9rTVRCYTZkYi9TZGtOZEVVY3FKWUpVem82Z0VPWGJEaC9kOUREQThB?=
 =?utf-8?B?NVE3cTBENDd3MEZSZ2szcTFNRDNtb2ZVZ2JJRm5naS9PSDRIRWR0UTcxck0w?=
 =?utf-8?B?MHRkZDVXSTAyYjhwdDc1ejhpTktENHp0ZzlzMERuMUoydlpLWVViKzlCMmdX?=
 =?utf-8?B?cEVZeXROQThNRVNneHFTNVBoVlhtYkt3WkxpUmxTbjdiaW50THFYZEI5WWoy?=
 =?utf-8?B?WmlkZlBYOGlhaTAxdUVyeWQ5WmVXdkpob05lWjRwaWZNV2R6Q1YwMG5qbWJU?=
 =?utf-8?B?c1M2cG5VMWdKOTBWY0Q5RVcrY3VXTTJ0UFRPVDdDNjlyamtlMk5WK0E2Z3BN?=
 =?utf-8?B?cWFVUFY4ZTRDQkp0Q1hFUWZPM29hTy9uTkREQkZNa1JqejgvREJpZjRLajRa?=
 =?utf-8?B?V3NUMTNQcWZOZ1V6aHMvSitlaUd0cUZJQ1dUcXh0bFNMZG9WeHNRNzBKU2Va?=
 =?utf-8?B?ZzY1QjhPeHB6YzNRZlZ6VEIxa0F4aXZjWmlCMm5WeStubkcxSmV4RmxhOHZz?=
 =?utf-8?B?SXZUay9HRmhISFJ0TzNXOTdHZEtLQ2ZGZ3lnMDJEVndHSkNGM0VkeW9zejNR?=
 =?utf-8?B?ejdUczhkWDBVL0pvTDNLbENLWGM0ZUM1RFVqckhNOFFXNVdrbjBNVVVkWDZF?=
 =?utf-8?B?NFFVUHc5UnEzZHJQWHNqczJVWkNRbk1UYnpUUXRBR05TcDJIWGVPS2YrUjJH?=
 =?utf-8?B?Mlk2a0JtbitRbFlYYURuaDJvcFZOdXZoS213T1Mrd3FmZldKRDE2QXBrMVNL?=
 =?utf-8?B?NlUrM1J1Vm5mM1pQY2EwYWhXMFBrdHRjUXUvenRvL2dMZy94Vk5QZVJQS2hW?=
 =?utf-8?B?YlNuT2ZSMHdpZEIzNForSDh0Y285ejRRdWtYdVlKZ211cnNzZFRTY3h2cWsz?=
 =?utf-8?B?QXppL0hXSXpCQll5cUpQUmI3RkZWbWd5UE9xc0QraUdBRllvb2JpY0ltcklK?=
 =?utf-8?Q?iG6cl6DqDeJZnrFSaz4hp7MVRWEu+c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEZKZlZQYjBWcmk4eGZCR2Jrdit2Q3p6WFVDVzZvY3J5aTVBUnNFSkphSVFy?=
 =?utf-8?B?bTZxaHhETE1mWUR5cHpmR3ZFdis0QmhtNU1FbEpVdHpsaWd1ZEZmMmpLbllp?=
 =?utf-8?B?azFGVk1OdnIwWGVwRlJHL25jaUZPUzlZTzlLWk82dExadFRkaFBNajc4RXg0?=
 =?utf-8?B?T3RHTUszS3VmNWN5VkhaTG54SEo0dWU0eGJWcG5scWN6TVgrTHJPY1FCSWxy?=
 =?utf-8?B?T05UVVI4dEZiRUs4U0N4RmFPRGZXbTJsWUFpWFM3N0J3bGhIOFd1eGZ6Um51?=
 =?utf-8?B?SHRYL1RhdDB5QU1EMzJtd0szdWJ6bDJDSVdWN3JXWllzVlI1WUNjbE1XSlFr?=
 =?utf-8?B?d1Q1ZklCM2tuMkh0WXJsYmYrZm82bGlCdFNSNmFRbnhOVW80cFpLUTRjR1pV?=
 =?utf-8?B?bklHMEJYOWd4M0ZkMHZnVVJzc0VxaTdGbzRlSzZjQWpVN0diRVM1V2NNVE04?=
 =?utf-8?B?RjM5b2wzM0c2anA3amtrMldJV0ZZU2FTSWtOQ3lFL0hhMVJSUXFWcjZMT1FV?=
 =?utf-8?B?R0pZUCsrQkpWdjBqZGFybUNsS1Uwa2tPcWhYcGFXbyswVU8ySE5uN2ZrcnZh?=
 =?utf-8?B?aW01ZWwwNzY2cnZ4d1UzbkllbWFSZWNFeGhkZHVGNldhdGtLT0txRWhYMTZq?=
 =?utf-8?B?MUE1R2tKaUlwQXdiWE16UE8vMnRWREJMalVpWFVkWHZVQklLb2t4TGw1WHRG?=
 =?utf-8?B?YzhreFNQeVR2dkpmdnhLS2VIWHNjVTNxb0l0WHlmRUwzMzV6OWNqNlVES0hl?=
 =?utf-8?B?R0JudXI3RVg5UlVXeVJWdGNQaWREeXpnSlJRcitVa1M2VEIxOGR1Unp6ZHY2?=
 =?utf-8?B?c09US1BBOGFtK1NON2lSMWVMdzJsclhBa2Y2eVl2NVIvdXJWWm93Yk4zSERh?=
 =?utf-8?B?bWw4Mm02SG1uclZaalNHVStDb0Z2VUtDWHFYUGYzTEZBc2Uwb05Oa3lrVStk?=
 =?utf-8?B?MC9aZU9zenVNUFRMVFdXTXpzZWdTU0RiaWtJeTkzZitycTUvOTdRbnFWVnNl?=
 =?utf-8?B?VS9UdTRaeDE2Z2kzZkFxaEF4clQvL1pIRWsxUHpvYnRVU21uNDRhbEZTZ2lh?=
 =?utf-8?B?eVJKSDNHOTZ6VnVraVBQZkFRRldOZHhSZFZoYnloczh2RFlvVG9qMUtETTZL?=
 =?utf-8?B?ZzhkZEpSYzZZazU0ekw4cU1VaFdIbGt0cm1OWDJCQVdpNXJaeURCWHZyS1du?=
 =?utf-8?B?a2lBeHhVMzRCTVliRHVNUWhIcGg1TjJYeDlyK0k4UlhQVDFJV2gwWWtyQjdU?=
 =?utf-8?B?V1VPbXJkbkNlei9CNDJtNDczR1gzV2JSSU01eHBpcEpDSnVNY0ZTZC85dkVv?=
 =?utf-8?B?OWk5Q2xTZW1FbWoxWS9VSnJzNzBJWklnU2RZdW1hUmdZNTcrRGlNc2F3YkZN?=
 =?utf-8?B?NURRTlhzblk5bXl1VjdxSnBQNTFrN0c2OGt1SWZMNU92RGN4UVZYb3RxWlRo?=
 =?utf-8?B?WGxYZTVwdStVNlQ3SmZvMXd4Zk8yS200WjdqRmx5UEE2dTdWaFhzVURnclFa?=
 =?utf-8?B?aEh0VlpZclBoV05RNlRoTFZJeVhBbjJRbllySWtpRTEzTFY0dWxPVHF0T1Fs?=
 =?utf-8?B?NjZVV1RuV01rOSt6NlozTjk4VUFMN1gvczcrNzIxT2o4ZlQvSUlUbENUSVhm?=
 =?utf-8?B?Wm4ybGYzSW41NnhwS21ndzJudWljUlVGOE5acnhCdndyTmRGc25CeXVKQnRs?=
 =?utf-8?B?WjlVc0NiNnUrL2U5bnU4VUtJSXJSSHVad01wNmpHQTdoOXhmREo5WHZyYnpV?=
 =?utf-8?B?anRyTC96aFhWL1RONW4rNEY1OHIzdGRuMG80TEpjRlVONmR2T0lweTRPcjF3?=
 =?utf-8?B?OVh5V0dUNm5UZ2g0OEtUdFExckc2OUk4NmNhVy9yOTQ2dE1hamhnZmVrZFJy?=
 =?utf-8?B?VzBTeVNCRWFVdUJrSkVCVkpLT1pqKzY0R1lPZUdDVW5lUWVGVTFvMUc4UGdO?=
 =?utf-8?B?MzlGRmtoZXZldlA1NUdTUEp6T1l4V2h2RCttVldEWGM0bE5SVGtFQ0Z0UEkw?=
 =?utf-8?B?TmtUN05TUmxXTWJBV29PRFlhYXp6d0ZOV2FvZTBleWZNV05hNzFrZkg3RXZu?=
 =?utf-8?B?S09PWG5sYUJzMnQ3TVpmWkcvdkhoZjRQWlE0dVZxNmlmT0FaVGZsRGFQMURm?=
 =?utf-8?Q?POAbzLPV+f1q+gTNgj8VB7ev+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12980494-01bb-4dd9-cb95-08ddf42c09ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2025 07:46:53.4497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LXyRoIFCClZB7eIf9ep1emPEeAuziwIlD2kdKSCOPcNye5M+Y32yeb9Rh4vPHGRAoo+y+PRr9OMdHAElautyFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7899
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLYW1pbCBLb25pZWN6bnkgPGth
bWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+IA0KU2VudDogMDkgU2VwdGVtYmVyIDIwMjUg
MTQ6MTMNClRvOiBTZWJpbnJhaiwgUyA8cy5zZWJpbnJhakBpbnRlbC5jb20+DQpDYzogaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEJhZHJhcHBhbiwgSmVldmFrYSA8amVldmFrYS5iYWRy
YXBwYW5AaW50ZWwuY29tPjsgS2VtcGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5
bnNraUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGktZy10XSB0ZXN0cy9rbXNfY29u
Y3VycmVudDogQWRkIFNZU1ZJUEMgc3VwcG9ydCBjaGVjaw0KDQpIaSBTLA0KT24gMjAyNS0wOS0w
OCBhdCAxNDoxNjozMSArMDUzMCwgUyBTZWJpbnJhaiB3cm90ZToNCj4gQ2hlY2sgZm9yIFN5c3Rl
bSBWIElQQyBzdXBwb3J0IGluIGttc19jb25jdXJyZW50IHRlc3QgdG8gaGFuZGxlIA0KPiB0YXJn
ZXRzIHRoYXQgZG9uJ3QgaGF2ZSBTWVNWSVBDIGVuYWJsZWQgaW4gdGhlaXIga2VybmVsLiBXaXRo
b3V0IHRoaXMgDQo+IGNoZWNrLCB0aGUgdGVzdCB3b3VsZCBmYWlsIHdpdGggYXNzZXJ0aW9uIGVy
cm9ycyB3aGVuIHRyeWluZyB0byB1c2UgDQo+IG1lc3NhZ2UgcXVldWVzLg0KDQo+IFBsZWFzZSB1
c2UgY292ZXIgbGV0dGVyIGFuZCBnaXZlIGFuIGV4YW1wbGUgb2Ygc3VjaCBlcnJvciBvciBnaXZl
IGEgbGluayB0byBidWcgcmVwb3J0LiBPbiB3aGljaCBzeXN0ZW1zIHlvdSBvYnNlcnZlIHRoaXM/
IEkgYW0gYWZyYWlkIHRoYXQgYWxtb3N0IG5vbmUgb2YgdGVzdHMgd2lsbCBydW4gd2l0aG91dCBp
dCAobWF5YmUgc29tZSBjb3JlXyB3aWxsIGRvKS4NCg0KT2theSBJJ2xsIHVzZSBhIGNvdmVyLWxl
dHRlciBpbiB2MiByZXZpc2lvbi4NCkkgaGF2ZSBtZW50aW9uZWQgdGhlIGFib3V0IHRoZSBlcnJv
cnMgYW5kIHN5c3RlbSAoQW5kcm9pZCkgaW4gd2hpY2ggd2Ugb2JzZXJ2ZWQgdGhlIGlzc3VlIGlu
IHYyLg0KDQo+IA0KPiBUaGUgaW1wbGVtZW50YXRpb24gY2hlY2tzIGlmIHRoZSB0YXJnZXQgc3Vw
cG9ydHMgSVBDLCBpZiBub3QgZm91bmQgaXQgDQo+IHNraXBzIHRoZSB0ZXN0Lg0KPiANCg0KK2Nj
IFpiaWduaWV3DQpDYzogIlpiaWduaWV3IEtlbXBjennFhHNraSIgPHpiaWduaWV3LmtlbXBjenlu
c2tpQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBTIFNlYmlucmFqIDxzLnNlYmlucmFq
QGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaWd0X2NvcmUuaCAgICAgICAgIHwgIDIgKysNCj4g
IHRlc3RzL2ttc19jb25jdXJyZW50LmMgfCAxOCArKysrKysrKysrKysrKysrKysNCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
Y29yZS5oIGIvbGliL2lndF9jb3JlLmggaW5kZXggDQo+IDZmNDYyMjA1Zi4uNDEzZTgzYmM4IDEw
MDY0NA0KPiAtLS0gYS9saWIvaWd0X2NvcmUuaA0KPiArKysgYi9saWIvaWd0X2NvcmUuaA0KPiBA
QCAtNDUsNiArNDUsOCBAQA0KPiAgI2luY2x1ZGUgPGdldG9wdC5oPg0KPiAgI2luY2x1ZGUgPHVu
aXN0ZC5oPg0KPiAgDQo+ICtib29sIGRldmljZV9zdXBwb3J0c19zeXN2aXBjKHZvaWQpOw0KDQo+
UGxlYXNlIGFkZCB0aGlzIGFmdGVyIGFsbCBpbmNsdWRlcywgbm90IGhlcmUuDQoNCj5SZWdhcmRz
LA0KPkthbWlsDQoNCk9rYXkgSSdsbCBhZGQgYWNjb3JkaW5nbHkuDQoNCj4gKw0KPiAgI2lmZGVm
IF9fRnJlZUJTRF9fDQo+ICAjaW5jbHVkZSAiaWd0X2ZyZWVic2QuaCINCj4gICNlbmRpZg0KPiBk
aWZmIC0tZ2l0IGEvdGVzdHMva21zX2NvbmN1cnJlbnQuYyBiL3Rlc3RzL2ttc19jb25jdXJyZW50
LmMgaW5kZXggDQo+IDRmMTZmOGI4OS4uODA1MTJhMTQwIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9r
bXNfY29uY3VycmVudC5jDQo+ICsrKyBiL3Rlc3RzL2ttc19jb25jdXJyZW50LmMNCj4gQEAgLTEw
Nyw2ICsxMDcsMjIgQEAgc3RhdGljIHZvaWQgdGVzdF9maW5pKGRhdGFfdCAqZGF0YSwgZW51bSBw
aXBlIHBpcGUsIGludCBuX3BsYW5lcywNCj4gIAlkYXRhLT5mYiA9IE5VTEw7DQo+ICB9DQo+ICAN
Cj4gKy8qKg0KPiArICogQ2hlY2tzIGlmIHRoZSBjdXJyZW50IGRldmljZSBzdXBwb3J0cyBTWVNW
SVBDIGJ5IHZlcmlmeWluZyB0aGUgDQo+ICtleGlzdGVuY2UgYW5kIGFjY2Vzc2liaWxpdHkNCj4g
KyAqIG9mIHRoZSAvcHJvYy9zeXN2aXBjIGRpcmVjdG9yeS4NCj4gKyAqIFJldHVybnM6IHRydWUg
aWYgYWNjZXNzaWJsZSBmb3IgcmVhZCBhbmQgd3JpdGUsIGZhbHNlIG90aGVyd2lzZS4NCj4gKyAq
Lw0KPiArYm9vbCBkZXZpY2Vfc3VwcG9ydHNfc3lzdmlwYyh2b2lkKQ0KPiArew0KPiArCWNoYXIg
cGF0aFsxMjhdID0geydcMCd9Ow0KPiArDQo+ICsJc25wcmludGYocGF0aCwgc2l6ZW9mKHBhdGgp
LCAiL3Byb2Mvc3lzdmlwYyIpOw0KPiArCWlmIChhY2Nlc3MocGF0aCwgUl9PSyB8IFdfT0spID09
IDApDQo+ICsJCXJldHVybiB0cnVlOw0KPiArDQo+ICsJcmV0dXJuIGZhbHNlOw0KPiArfQ0KPiAr
DQo+ICBzdGF0aWMgdm9pZA0KPiAgY3JlYXRlX2ZiX2Zvcl9tb2RlX3Bvc2l0aW9uKGRhdGFfdCAq
ZGF0YSwgZHJtTW9kZU1vZGVJbmZvICptb2RlLA0KPiAgCQkJICAgIGludCAqcmVjdF94LCBpbnQg
KnJlY3RfeSwNCj4gQEAgLTM5NSw2ICs0MTEsOCBAQCBpZ3RfbWFpbl9hcmdzKCIiLCBsb25nX29w
dGlvbnMsIGhlbHBfc3RyLCBvcHRfaGFuZGxlciwgTlVMTCkNCj4gIAkJaWd0X2Rpc3BsYXlfcmVx
dWlyZSgmZGF0YS5kaXNwbGF5LCBkYXRhLmRybV9mZCk7DQo+ICAJCWlndF9yZXF1aXJlKGRhdGEu
ZGlzcGxheS5pc19hdG9taWMpOw0KPiAgCQlpZ3RfZGlzcGxheV9yZXF1aXJlX291dHB1dCgmZGF0
YS5kaXNwbGF5KTsNCj4gKwkJaWd0X3JlcXVpcmUoZGV2aWNlX3N1cHBvcnRzX3N5c3ZpcGMoKSk7
DQo+ICsNCj4gIAkJaWYgKGlzX2ludGVsX2RldmljZShkYXRhLmRybV9mZCkpDQo+ICAJCQlpbnRl
bF9hbGxvY2F0b3JfbXVsdGlwcm9jZXNzX3N0YXJ0KCk7DQo+ICAJfQ0KPiAtLQ0KPiAyLjM0LjEN
Cj4gDQo=
