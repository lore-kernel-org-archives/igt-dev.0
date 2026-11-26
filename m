Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C7606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 06:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GnJ9veLs;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=EamwAeZv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D18E10FD59;
	Thu, 26 Nov 2026 06:56:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608E310FD59
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 06:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795676108; x=1827212108;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UByFgy+U8xs+tmMBgiDwkbfuYNCbtU9ShnXOIc5KC08=;
 b=GnJ9veLsCkCxvKFUw2FFr8i+GflqSjzVCbJ8XIHDHGWW7ZY0g3qef9Tm
 vmPVvO/1jr56HxV6WLuwVWT6ojbG5TxRL/UFj7HdyfrB9R8WVxMFeTK1N
 Y3tlL1YOB9toVEVoc02yF0RUHt+V8ryPTsg/96XNiCbIBJMKHjo5ZbXbR
 I8ujNiAJCkyKELH7paHk7HiagB6f1MCjX81+KYYUx70lYl00xdYUhftS9
 RmAiLzEaUuZCiM4q7xBG7bXUPirANNIot9K6ZNr02ebX6ah2T00MnT3/+
 FGehVqzAu6GJuu61ED7j/mG2oKTn1xzY9e68OmsrS+EKAI7qIaWav4MBj A==;
X-CSE-ConnectionGUID: sGS604mdTcGCGUzjiefvEA==
X-CSE-MsgGUID: Cop/rBRyQUqkcC8yqPRpIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4584655"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4584655"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:52:03 -0800
X-CSE-ConnectionGUID: geBcOngwQE2d7MNgC5tipA==
X-CSE-MsgGUID: MfrmFI3cTuWVvhyyUwIb5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12410400"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:42:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 22:42:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 22:42:40 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 22:42:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSyijukyEl2Y0kSASlCFSm3ixGYHid9EtZ5XD/PYRCJuSHsuER7BjorUjh5NcLpGFlM4Q5jrMMQKDNddhvCfm/WoGMi7rrROqmK3bgPplHAWtx13zbjS1tJBWGrIWWwJuMDD+lxEG3kjkarBEFrbKQSK82/J/QGm3KGHQhqrZycGusEV79dQLngrkY/9R+5X22tFFzkkSdO0lyDIJuApSJEklk5sE35PRcHcFBrOxWvR7efk7mfUOHg+AibYQ7iPcDQ7ZKH/PWvJl3U/rsI15XOfcKXYXiyedyzAv+hxuUNlS6Jgld2wogsX2ShpJIAEnKC18BKj5fGCmjROtFZpFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvyzwckiR7K7NomT5Kpx/lr8JPmokiVmuwqnEwcMFUU=;
 b=XDqasEZ5tpOEeRkojMC8raK2refMaNMydqMWNAyUOimrTz2c7lC3Wi7s8Glvd72Fl3NqKasXshe8JC5bpMSS7YyvM+loNiKPYfUQuXs66K8SDgHjeU3FO7a2dWhv1jiGIDkAslaRevHqY+NXHBCvFBgytiyHVb+mjjNMX7cWce30NW4+aYYx0enrRxws8Hq+dF5Uzhze1tD07Jtoc5zM2h35INsTt1sFacCQL2RTiocQaFF6uUuIc2s/5bT6NsU7j3V9e0skBB7yNZtspA8oPgLZg6fC4Cl+ExUhPUKGR3l7h3dlXlSbojhxITFjiqab3JbgYgAnLFK/4xPEl5MKEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvyzwckiR7K7NomT5Kpx/lr8JPmokiVmuwqnEwcMFUU=;
 b=EamwAeZv/gocgatDDxK3rokv1ci197P4+NV62WTsVAj6Bm9cgdCMopqQatSEPtFQhBgD5RTB/HpyPRtUgX1SRggUIwcoD8N028Gl9JkI7GiFq+1WJYAtMF1i+1BhoU9DfhMqv5zagbs5WXsO1UPLmdSD/e6pGX2TO+k+3kk3yTg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 06:42:37 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 06:42:37 +0000
Message-ID: <fedcbd2b-7a76-4dbb-bb09-6216e0cfda72@intel.com>
Date: Thu, 26 Nov 2026 12:12:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] tests/intel/xe_oa: Check that blocked OA stream
 waiters are woken up on unbind
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <harish.chegondi@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
 <20261104005505.3232485-16-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261104005505.3232485-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0267.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::16) To DS4PPFD24E991EC.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::52)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|CH0PR11MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 619ba36a-2a75-425c-adac-08df4b887545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|261009223027099003|22082099003|18002099003|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261022113327099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: Uc/fvrQOjsh6uIINbFOx3op7uANLfdWJxv8avb33n+i2WCdwlMSSg93wuqZa/qDlOG9dMKx1LZwAfJwkI0LDmbSOCuSc5Y7RzqEBg1e1alVjw8sai71pduvMIM+MqEU/9YnXV2+DvPO0Q8qNyyVsrwsKXiAnRaY0fjKc3Yp6WV7zi+XRtAgGft0O8Pg0vv7/PgkuhTK3QZHVZTT0xDINHom5AbQsFWebFEEdRjDbMLDpgb8Sbkm7+oDV59ukiutT2wgOy+fnpzCroaQgY3pHM1en/4hwAR1gVN6n17GRCrcTmv+OAiyDEAP8BwRe7W4C/KChYT8B61sF++tb+a+jmLEE5mkOGrOnkJ9Ym4TFZ02rFhHce2/8FNJ8BO1WBo7cOdJCFoA67/hPbs6qfQJYvpUGxq25v+NbADnCJShINrvdAlrr9XKdIPkghgR3okrhLf0FzFdbgcpzGCpVow5MOJUof5QqgiaeKENSmM/CHHqfw/9NU11fPpYd1lNIo9+m8lExZ0oUKWHILyLbrzc3GPZLA+Lg7UmHwl4OE/wVXrUy0FES+KO6BqDuDAQiht7LfRojnWZyDcO5eqi6iQuZmW635X4zYyr90zvlB6GxHBzl0LzMDhmsvmj8dW4YLgo85a2LurtWT3KhSa+zOJQNVVOtYGQUMw6Hv0E3JORmfAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(261009223027099003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261022113327099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEpjMDFJdlNFc28vcWdmbURERjRuUXB0NE9TZ2hES3k2V3BxRTNnMTU4eXJ0?=
 =?utf-8?B?Zi9qdWJzL0ZZSmNFUGw2Q1VtaExocnp3N09yL2poSXd6V0wxWEZCM0VDelBT?=
 =?utf-8?B?Wjlic1NVTzFUYit6S3VQdFZMTm05VXZqS3MyREUwWkRmOXA0SlpyUTdLQjFP?=
 =?utf-8?B?SFZRUGlMWGFhSytqZ0tQZlZuVlBTQnZmY2IzajJpdUxPK3lRd3pnL1hiNXBl?=
 =?utf-8?B?YkNETnhvdldZTERIbHgzSEdGd1JvTUtiTTFiOFh2M2t2YjA3N0txR05qd3oy?=
 =?utf-8?B?NUtXRzNCRDM1V3VtZ0NkSkpkMXU4emNDdEtZSElGVGZtc3FSUHB0cnhFcGtu?=
 =?utf-8?B?aCtjNEptS0hLcUp0SVNJSHZ1dGNmRmpsdDREME1EaHBXc3ZKMmlxQTl1SnI4?=
 =?utf-8?B?d1NkSEhiRjlrd2Q5K25MU3BmL3YrcHpMeVpPb1M4WlVoSEV4cHlIVmtjTHd5?=
 =?utf-8?B?ZEpIMFMrUW1sa2Q5ek9qQUtkcjdIUUxCUHNkUG5wTFBLVmhVc2ZVbTFJeXU5?=
 =?utf-8?B?OTliOU8yZWxQa1lJRUIzRDRSREVtRVpGelNXdmpSc0F6QmE4cjR0M3NlcDlR?=
 =?utf-8?B?VHU2U0dCZDdodVBxS3JKcWNHUjEyOWlXMnBlU05VdVEyMFFXYzhtY1hkME5T?=
 =?utf-8?B?TTBXUFJjTnJBMEZNQXUvdEdYQ0pRYlFmOG9QQ1FCUmtWd0V0L3RabXJIcmFq?=
 =?utf-8?B?bG9GaFBPdk80ZDZiRmxDUzVPbTNaYndXT2NQSS9iVnhvVWFOZm8yaFlmL1Nk?=
 =?utf-8?B?cGYxTzYzVUE2RnAzWXBRbHk1ckplZ3kvTldpM2tlQVVqQ2hHUGNtdHA2NFFI?=
 =?utf-8?B?LzNLS2M3VVZjWC9wYUFHKzFhQWRIVkIwQWN5TXUzRWdBdjFuYjgxc0VYSnFr?=
 =?utf-8?B?dWl3ZUo3MThQT01nUXdQR3pzaitSVklHY3lFZjVZVkx4MDBQa0NaS0xUOTBY?=
 =?utf-8?B?d3pCdG9rK0hadGZFU1pZQ0JsVTd3V3FGMmIvUTN4NXo1MjJWQU5iSm1vNTlq?=
 =?utf-8?B?WlNaa2pabGZjTkQ4TzNGRFFxVGxzRVNJRS9VWGFMNjJtUDRVa04xRTNjWHNF?=
 =?utf-8?B?NGplSGZIOVlrMWgzaHVjaGR1TlhTalNZbTVBcTQrWDViRnl6RXBKbGlhZjZ2?=
 =?utf-8?B?eVIwL2crQmVXdWRoMWhBbnZxSitEbzllM0ZIemFPdVNEejdlSEI0Rzl1ckt4?=
 =?utf-8?B?RjdmQnUwWGMxczJyaUJtbGdPK0haQWt3S2hycFlOY1R2UG9BdDZXR0xvWVV4?=
 =?utf-8?B?UFhGMitXWlNhTXdwcXBmOXBrcEp2SC9FS2prYmJ0N0tBa3RqUlhhNUwyOVI5?=
 =?utf-8?B?NTJ0WGYxTmdHZTllYmkwUzdMSXlHRnhWbW84Mk1aQithVE9yZkliWUxxaHRM?=
 =?utf-8?B?VEFiS0tIWjlNdXhDUjdWaXUxaVcvNnJRTzYxbnRZR1FpZ2xvaWtlNjhkc0xM?=
 =?utf-8?B?cG8xc2lITzZJVmFML1VYbWJEUE51eUpyK0pPTFpJN1NwaCtENEVqUkVqZ01W?=
 =?utf-8?B?R0Y0MSs3Y2ZxYXF0aHdTYzZjWC9vekRvbUM1ZHdGM0xKdTB6UG01ZEpuRVJV?=
 =?utf-8?B?VkRoaXM3Z2FzaUUvSGQwRkNRdUVsL0pXWVZXYzNnN2QwWlcxeGRHSUp4OFZu?=
 =?utf-8?B?NkhFYVR2a093MzFSMVZBRGNFbzlUVkJJZHZGZHNVMVZiWnN0VzlqakJEK1VN?=
 =?utf-8?B?UlBCd0hwMXBnSm5YL2ZXZWhOb1JDR1E5aytDN2U0dzVJWmR0MUMvRC9neFB6?=
 =?utf-8?B?K01ZOXJDTHJNeDRDMDlkSy9LNjNvcjZmWDZTQnNZZ25IUkg1WEE0UlVaNFAr?=
 =?utf-8?B?dTA1dUR3amhMMmJiMjVWcGFKVWFZd1RoRDRlbEcxejdqWkF6ejVQQmdYSXJX?=
 =?utf-8?B?WDhuUEc3WlBQWDkwbW9mRXZzRU8wZUJSNUplSmNtWXJ0aVlCSFdKekoxNlhD?=
 =?utf-8?B?ekNrYS82MEhOVXQ0c0N1YnVpM2RldEpYL2tSckVMOEl5Y3YxOFN4TEhIM1da?=
 =?utf-8?B?ZUg3RmlEZ3pORG1wcktiVGp6cTFaazlsc2VMS2F5S0VxTDMyYVF2K29tQnM2?=
 =?utf-8?B?ZFNvZkZhUlJSNlRSWklkczZ3UExPNFZhNmp2UHV4ek1QNndXeEZmTUhQOHpS?=
 =?utf-8?B?aURWUkZEUTJKUlRuUE5QVExPenVmYk9YbkhuSVI4bjNkZW5EaEZtYmttODJN?=
 =?utf-8?B?WEIzdnJ2NnN2c1JsNEVGSlhLRWw5S0pzcTB4N05QSzdtbUZoOElUZEU4b01T?=
 =?utf-8?B?RjJDNmhDUUJ5ZG1UVUZ1eEZSMHNlbEtoRVFHbUI3dGxtZTN5MXE4WW5zT2Vp?=
 =?utf-8?B?L21KaGlib1ozc1lTYktrTms4VWVIcFlpcHVVRGJYYTN4VmY5UHdMczRXNmZ0?=
 =?utf-8?Q?xTiaPzrV0xRTcfRI=3D?=
X-Exchange-RoutingPolicyChecked: I15oAQYI8AfEqbg3BydofwHLE6FCRCS5vSpPJJO4jow68RJng8Y5N/PUFM0A92aqD6rEjeUzbI5qPN87lkEGj8CWz3Ep2A4u0bS1KVocY41nXIYB1XnCjyVPGuVzJKFILzKLd/5J7ylsLRXf6J2Cvh+EwiFfXSkqcTKI/8nn0CkOC1WDkpzzL6ptYV4PQk/kVvBPYlqPAIB0HGuVjTwsT7C574G0ezC1aHPww/cLXWL7XXObAlyWJhFOHa2tC6HQQQj6ivYBmcwzVIqa5mw/ry/b3St6gvlqkqeQ7tmjKN/d3+w+xyHVJzCwyPr0j/kd9jNh/jCmOflm8jZvmIucCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 619ba36a-2a75-425c-adac-08df4b887545
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD24E991EC.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 06:42:37.5684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +28NJkWjohuy6JHzGS8GLH3Nxm85cyEH3vO5Ly9J8OPoQnCm+nAK3WsfLim4yUplCoUnd1ftaIJQgNLpkYbojl0lOC/e5Mt5s8a9omWIA7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5284
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/4/2026 6:25, Umesh Nerlige Ramappa wrote:
> Add a variant that opens the stream disabled. A disabled stream
> produces no OA data, so a reader blocked in read() and a poller blocked
> in poll() stay blocked until the stream dies. Check that unbind wakes
> them up with ENODEV and POLLERR | POLLHUP.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/intel/xe_oa.c | 137 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 131 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 8474d506612b..f1fe5f44c408 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -17,6 +17,7 @@
>   #include <dirent.h>
>   #include <time.h>
>   #include <poll.h>
> +#include <pthread.h>
>   #include <math.h>
>   
>   #include "drm.h"
> @@ -2864,6 +2865,7 @@ static bool mem_is_zero(const void *vaddr, size_t len)
>   }
>   
>   #define UNBIND_CLOSE_BEFORE_REBIND	(1 << 0)
> +#define UNBIND_STREAM_DISABLED		(1 << 1)
>   
>   #define UNBIND_MAX_STREAMS	16
>   
> @@ -2878,12 +2880,25 @@ struct unbind_stream {
>   	size_t size;
>   };
>   
> +struct unbind_waiter {
> +	pthread_t thread;
> +	int fd;
> +	size_t report_size;
> +	int ret;
> +	int err;
> +	short revents;
> +};
> +
>   static char unbind_pci_slot[NAME_MAX];
>   static bool unbind_state_stale;
>   static struct unbind_stream unbind_streams[UNBIND_MAX_STREAMS];
>   static int unbind_num_streams;
> +static struct unbind_waiter unbind_reader_waiter, unbind_poller_waiter;
> +static bool unbind_waiters_started;
> +static volatile bool unbind_waiters_stop;
>   
> -static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_unit *oau)
> +static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_unit *oau,
> +			       unsigned int flags)
>   {
>   	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>   	uint64_t fmt = test_set->perf_oa_format;
> @@ -2904,6 +2919,10 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
>   	s->properties[n++] = __ff(fmt);
>   	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT;
>   	s->properties[n++] = oa_exponent_default;
> +	if (flags & UNBIND_STREAM_DISABLED) {
> +		s->properties[n++] = DRM_XE_OA_PROPERTY_OA_DISABLED;
> +		s->properties[n++] = true;
> +	}
>   	igt_assert_lte(n, ARRAY_SIZE(s->properties));
>   
>   	s->param.num_properties = n / 2;
> @@ -2983,6 +3002,93 @@ static void unbind_stream_check_dead(struct unbind_stream *s, const char *when)
>   	igt_assert_eq(errno, ENODEV);
>   }
>   
> +/*
> + * Blocking read until it fails. Run on a disabled stream, which produces no OA data, so the
> + * read blocks until the stream dies.
> + */
> +static void *unbind_reader(void *arg)
> +{
> +	struct unbind_waiter *w = arg;
> +	size_t size = w->report_size * 64;
> +	uint8_t *buf = malloc(size);
> +
> +	/* No igt_assert outside the main thread, report through the waiter result */
> +	if (!buf) {
> +		w->ret = -1;
> +		w->err = ENOMEM;
> +		return NULL;
> +	}
> +
> +	do {
> +		w->ret = read(w->fd, buf, size);
> +		w->err = errno;
> +	} while (!unbind_waiters_stop &&
> +		 (w->ret > 0 || (w->ret < 0 && (w->err == EINTR || w->err == EIO))));
> +
> +	free(buf);
> +	return NULL;
> +}
> +
> +/* Poll until the stream reports an error, also on a disabled stream so it blocks */
> +static void *unbind_poller(void *arg)
> +{
> +	struct unbind_waiter *w = arg;
> +	struct pollfd pfd = { .fd = w->fd, .events = POLLIN };
> +
> +	do {
> +		pfd.revents = 0;
> +		w->ret = poll(&pfd, 1, -1);
> +		w->err = errno;
> +	} while (!unbind_waiters_stop &&
> +		 ((w->ret > 0 && !(pfd.revents & (POLLERR | POLLHUP))) ||
> +		  (w->ret < 0 && w->err == EINTR)));
> +
> +	w->revents = pfd.revents;
> +	return NULL;
> +}
> +
> +static void unbind_waiters_start(struct unbind_stream *s)
> +{
> +	struct unbind_waiter *reader = &unbind_reader_waiter, *poller = &unbind_poller_waiter;
> +
> +	memset(reader, 0, sizeof(*reader));
> +	memset(poller, 0, sizeof(*poller));
> +	reader->fd = s->fd;
> +	poller->fd = s->fd;
> +	reader->report_size = s->report_size;
> +	unbind_waiters_stop = false;
> +
> +	igt_assert_eq(pthread_create(&reader->thread, NULL, unbind_reader, reader), 0);
> +	if (pthread_create(&poller->thread, NULL, unbind_poller, poller)) {
> +		unbind_waiters_stop = true;
> +		pthread_join(reader->thread, NULL);
> +		igt_assert_f(false, "failed to create poller thread\n");
> +	}
> +	unbind_waiters_started = true;
> +
> +	/* Let the waiters block */
> +	usleep(100 * 1000);
> +}
> +
> +static void unbind_waiters_join(void)
> +{
> +	struct unbind_waiter *reader = &unbind_reader_waiter, *poller = &unbind_poller_waiter;
> +
> +	igt_set_timeout(60, "OA stream waiters not woken up on unbind");
> +	pthread_join(reader->thread, NULL);
> +	pthread_join(poller->thread, NULL);
> +	unbind_waiters_started = false;
> +	igt_reset_timeout();
> +
> +	igt_debug("reader: ret=%d errno=%s\n", reader->ret, strerror(reader->err));
> +	igt_assert_eq(reader->ret, -1);
> +	igt_assert_eq(reader->err, ENODEV);
> +
> +	igt_debug("poller: ret=%d revents=0x%x\n", poller->ret, poller->revents);
> +	igt_assert_eq(poller->ret, 1);
> +	igt_assert_eq(poller->revents, POLLERR | POLLHUP);
> +}
> +
>   /*
>    * Restore a bound device and fresh device state if an unbind/rebind test bailed out
>    * half way, so the remaining subtests can run.
> @@ -2992,6 +3098,13 @@ static void unbind_rebind_recover(void)
>   	char path[PATH_MAX];
>   	int i;
>   
> +	if (unbind_waiters_started) {
> +		unbind_waiters_stop = true;
> +		pthread_join(unbind_reader_waiter.thread, NULL);
> +		pthread_join(unbind_poller_waiter.thread, NULL);
> +		unbind_waiters_started = false;
> +	}

If unbind fails for any reason, then both threads are still blocked 
inside read() or poll().  So, setting unbind_waiters_stop = true, won't 
wake them up.  And, pthread_join() will hang forever.  To avoid this, 
can we instead call pthread_cancel() before pthread_join() so that they 
wake up?

-shekhar

> +
>   	for (i = 0; i < unbind_num_streams; i++) {
>   		struct unbind_stream *s = &unbind_streams[i];
>   
> @@ -3019,24 +3132,32 @@ static void unbind_rebind_recover(void)
>   /**
>    * SUBTEST: unbind-rebind-stream
>    * Description: Open OA streams with mmapped OA buffers and test the effects of unbind
> - *		and rebind: streams die, mmaps read a zeroed dummy page and refuse access
> - *		through /proc/self/mem, no new streams can be opened on the removed device
> - *		and the device works after rebind.
> + *		and rebind: streams die, waiters are woken up, mmaps read a zeroed dummy
> + *		page and refuse access through /proc/self/mem, no new streams can be
> + *		opened on the removed device and the device works after rebind.
>    */
>   static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int flags)
>   {
>   	struct unbind_stream *streams = unbind_streams;
>   	struct unbind_stream *primary = &streams[0];
> +	bool disabled = flags & UNBIND_STREAM_DISABLED;
>   	int ret, i;
>   
>   	igt_device_get_pci_slot_name(drm_fd, unbind_pci_slot);
>   	igt_debug("Device %s\n", unbind_pci_slot);
>   
>   	unbind_num_streams = 0;
> -	unbind_stream_open(&streams[unbind_num_streams++], oau0);
> +	unbind_stream_open(&streams[unbind_num_streams++], oau0, flags);
>   	igt_debug("Opened %d OA stream(s)\n", unbind_num_streams);
>   
> -	unbind_stream_check_live(primary);
> +	/*
> +	 * A disabled stream produces no OA data, so a reader and a poller stay blocked on it
> +	 * until unbind kills the stream
> +	 */
> +	if (disabled)
> +		unbind_waiters_start(primary);
> +	else
> +		unbind_stream_check_live(primary);
>   
>   	/* Guard against a wedged unbind/bind */
>   	igt_set_timeout(60, "xe unbind timed out (wedged?)");
> @@ -3047,6 +3168,9 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
>   	igt_reset_timeout();
>   	igt_assert_f(ret == 0, "xe unbind failed: %s\n", strerror(-ret));
>   
> +	if (disabled)
> +		unbind_waiters_join();
> +
>   	for (i = 0; i < unbind_num_streams; i++)
>   		unbind_stream_check_dead(&streams[i], "after-unbind");
>   
> @@ -5566,6 +5690,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>   		} unbind_variants[] = {
>   			{ "close", UNBIND_CLOSE_BEFORE_REBIND },
>   			{ "open", 0 },
> +			{ "disabled", UNBIND_STREAM_DISABLED },
>   		};
>   
>   		for (int i = 0; i < ARRAY_SIZE(unbind_variants); i++) {

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

