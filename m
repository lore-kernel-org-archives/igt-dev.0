Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7DDCEBF7D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 07:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622BC10EC59;
	Fri, 27 Sep 2024 07:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4rEoCJ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0F410EC42
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727423916; x=1758959916;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5Cfibh7FJxkDljROS+wBgBPQFst+3zDDr/XQMyYo7tg=;
 b=L4rEoCJ4SOd1m9nKToFe3knpjD42hfGdFvUzttOGm4/bbR509wyAmu3p
 4aD2hz6Ig50wLd7gfxg7s4D6l2J8aq8mkRMd9QbecshggQHiBlj4ImQWD
 cSgcGXC9nmMUMIUivJAGCpMjtQzV18xUwPpNpQ9dKqNWTwikMLp4HtdBA
 PuIgGWK9HC77TXoBT/EPwUD5yvMVSkCgQ/LhkmazXjkX3ATgHAPcub/Ys
 p9OX8LThCnpp7HqEd21oLL0MaNNw5ZR9cv7RgI95T7SvvI/VyzmwvGNbq
 stKiINKyiZMtsJYDXAo7ZV2NQwCYfwONBPJorJVDGjwkOGlZSUvOosrTI w==;
X-CSE-ConnectionGUID: 1uWQJsQDSt+tYdnJgv9Jiw==
X-CSE-MsgGUID: 6T5uAWpkTR2fVJisZfkHCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49087160"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="49087160"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 00:58:36 -0700
X-CSE-ConnectionGUID: /EaJFIjdSWeyuJQEtenzng==
X-CSE-MsgGUID: uZL6axZOTq+WWfg6rb5H1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72762860"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 00:58:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 00:58:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 00:58:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 00:58:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mteh/35MekVuESUAeGIOF8LrEeYSXlzE5jv5oi15M4ZAbe53pluoCbjAiRS80rCcySFBQZQiXiMZbtW1RShMhRqwNairRWDtRdB/2lBFaQEZ4RDEf/U1oTZ0Lys3lsREMY9pm0a6javv+i9By1PYEZww0mPfczd63jRSHsXefeREmXiCJZMmW8fuAbfeXWC3xf/r+eINc9iMymGxC+bQDylkg9gaPzzoyXY/BIetFU63WYy0+dEwrZy4bMnz8tmE53mkgh+u5u+AR7o1rLD+pvEuqdYPepOyLdJ0kTD6nVh8WQ5UEoVdtRALNv0CVHCXjeg/xgDdCJvejz2QAhCjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Cfibh7FJxkDljROS+wBgBPQFst+3zDDr/XQMyYo7tg=;
 b=NWikZz4NgG6tsyaGF6Y6/3L/MeJwB6nzjQKzZq9W7QPumtzQULng3O/KaD7npJnWbN3LAUOBrMo+x7mxjLG1MjCJ0pAX4z6Tk0lvlAT/kI6eksqR4TQwiM2iJlcJJMUWyI1+r5ySjZDQpKeYXAeGsQRDOCLZd/8Eu0xXQ3wMMnzPwmrEvMsTad5WDF22n67R0b6YJKeaBQRv+D0yV0EwTMx+AYg6b3zpa5IX81nku0sWV+aN2vu6lADb5NA6LFGTOF9LgOaSYeVYKkxayOIjS+QOi92zo8PJ/ozhGzydhIGVIsiozhFiksD44s7lrf9CK4QRNmBf9tWkWbd0cnNcRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 07:58:31 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%6]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 07:58:31 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sikora,
 Pawel" <pawel.sikora@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe_eudebug: Introduce preempt_timeout
 helpers
Thread-Topic: [PATCH i-g-t 1/2] lib/xe_eudebug: Introduce preempt_timeout
 helpers
Thread-Index: AQHbEA5YjggghuQO2UiuR1HwQN9Xh7JqJ/eAgADxMACAACzQgA==
Date: Fri, 27 Sep 2024 07:58:31 +0000
Message-ID: <7ce5734855161435f5d80c8b2764cf0c671dc216.camel@intel.com>
References: <20240926121846.5885-1-dominik.karol.piatkowski@intel.com>
 <20240926121846.5885-2-dominik.karol.piatkowski@intel.com>
 <7a9f1171dbe6a0a4dd0398c95b34c3e69b221635.camel@intel.com>
 <20240927051806.jn7pvk662we6phyw@zkempczy-mobl2>
In-Reply-To: <20240927051806.jn7pvk662we6phyw@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SJ0PR11MB5214:EE_
x-ms-office365-filtering-correlation-id: 38ead215-e036-4f3a-d3d0-08dcdeca2db7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YUFpUTRqRWNMakNFR25Fc3FzN2VOWkZOYm1EYUIrZ2thZlhpbkxQN0lXaVZM?=
 =?utf-8?B?blpGN1JQUFlUV3lzS2ZUMjRSVHo3d3hyVHFNVGNBWUVvb29VT1hnMHdMbGdU?=
 =?utf-8?B?ZzhiY3BuZ1p2U2QzaXhSSEoxU3lvU0FZUlVFTlhGRmdxS1Vhb0VJU1VGeTBh?=
 =?utf-8?B?cU1XakZJRFNzUXBtMkY3aW9SWUxvUEljbE9hOGhlczJWSm1VQ0FxUkp0QnRx?=
 =?utf-8?B?K1ZJYTk4c0tRaElZNXlpSzZ4ajJSUmR5cjRma3U1K1lWWHptRlQvdnZZcVp2?=
 =?utf-8?B?ZVNNWFhBQkE0VlZGbENyL2dWWVdXdml6TVRzckRtR0RnU3NIK0RGMVR0M25K?=
 =?utf-8?B?dDlCV1BCZHRyYy93VjNza1VjY0JHL0taR3ZiZDJJWWx2V1hkTFdhTC9YTEt0?=
 =?utf-8?B?R1VvZjF1RmRxbCtQNTAya2p5S2F2VmxSV0pET2w2QzNXUmlpT202RzNRMlpy?=
 =?utf-8?B?MW5sV3lULzlaT0hWaHRXUVY3V0F1NWk0VVJMaDhoY1BzVWI0V3RIdTlONmdS?=
 =?utf-8?B?eDQ5WE5WMmhXRjhlK1VjR2xaVXVBdGFBNlBQeHRTZVRSakl4cTNwK1YwNzRq?=
 =?utf-8?B?QlgwZEtuckVlNnJIYXk2VXo1ZVRpNTh2WmpnZ0pPNWIwMWI1WmJlUU96M3Jj?=
 =?utf-8?B?VkpOanVUN3RiTUpUUForTWd3ZG9xQ1Q4YjJiNnhrSEwyQmZha2t5L2NBQmZG?=
 =?utf-8?B?SkdTUXhkSmlzM0JVRkJJclY0eVVwdy9BOW9Jc2l6bldIL0dFWDZEd2picTJU?=
 =?utf-8?B?S1hMbkNRK3I1UVN0aGQzN0UvZnhZdEl2YzUzemlURU9xUGdHb1ZDVzVDeXBo?=
 =?utf-8?B?d3BrUkFTT1ZZeUR1MkNybHE2VzRmeHJtVGFSSDR6dnE5SUtiSDk5VVRwKzZE?=
 =?utf-8?B?SUNDZ2hReVRyaHI3U1R5ZURtWFpvTjZrVGc0YXAvSmdIU2d4MktINTMvNTEx?=
 =?utf-8?B?OHJyL3prVlRwamR6aEdjZjJDaktCRWpDa1RiOUhaZ0x5Z2l6TUdnVFZhYlBa?=
 =?utf-8?B?MGc4M214QllCQzBMZG5EU29KVE9SUW5EUEtkSlhYbHdHeFJHcmhWMlVkaE9y?=
 =?utf-8?B?NVpoYlRHTE55TVF5Y01nS1lnNlhRUFI5Y2Q2S0NVRlZtT0RVK2x1TXpxMzNM?=
 =?utf-8?B?c2JBc29JOGNvcFp4R2tYWUtxQVA4M0hrMVhkYmlFWTdKRmdaZ0EyT1phZkE4?=
 =?utf-8?B?NW1sMTVGaUprVXQzaHBBNDUyOTRlelpkUnkreUdkTjNwTjB3ZVB0bVJYOFFE?=
 =?utf-8?B?Q09hWU55UmN2RXJKRjEwSnM0aVUvYlo0aS9vcUJtNlE4Q1grYkJQYktmY2xv?=
 =?utf-8?B?QXhEYmFYVkQzekRJKzNDcEpkMkxocU1sUW11OGdRcFVYWW0xQjQxbE9Cd1ps?=
 =?utf-8?B?dGhhZXJvdEc5RTlrZ2xDN3I1R3NTODdWVlh6Q1UrdUlFNDV1TzZpRm9CbWpO?=
 =?utf-8?B?ZkdNbGI1YkVzWmtJcVZCVHg4emZyZGxYaC9nSDlKMXI3c2Q5QlJWUzQrbXFl?=
 =?utf-8?B?RE95YThPQzEyL1JGRGg5NFBZbHgwdEVTV2cydml6WWI5MlFWY09Qdjg5QnBq?=
 =?utf-8?B?Y2QxSUZYb3hXYy8zZEFVOW1qeUNOS090cnRTejUxK0xSbG1FaTluMlRHcVFV?=
 =?utf-8?B?VGdVRFYvSGlHYzI1QkFNcVZkbHRQcFVoL1NGcWp2UklPTlJIYlRzZk05MURU?=
 =?utf-8?B?MFlIY0p6amwxbm5nRWRZaGtGRTNqcDg4cWYzTlFXQis4VXA3T1Fsb28vVGFp?=
 =?utf-8?Q?cqoXK179Si6qpZ85NJ5Q2KFQgiAU+TQuwW5hzxT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk91RExqNGltSCt2Y0FUekFUOFBvUFVDRmQzRTgzVzNxOUJKVjgxQU9GSkVS?=
 =?utf-8?B?UXd5NU01TVRFRDRMV3FGZ0VGYzZpL1ZjMW5nUERwOENjOU1tUVFEQTlibW9l?=
 =?utf-8?B?VWRtdDVOSUEveXMzU1p6aXBKVUlncmNKZXh5aU4zRXdjVlBhTElRZ0NwSGIx?=
 =?utf-8?B?ZDlpaUJEUWxucUNlazdHYVFucFNDSzNyZGZ6THlGd0pheVRrdGIxS0hHOEpB?=
 =?utf-8?B?WHYvSUFvNUx3dEtoRG1Ed2piR002Z2pEeWRiUDcyQmZOd1V4VllaNzc3NVEx?=
 =?utf-8?B?YUEzQ2hpSy84ZnZNRUdmb3J2R0tmTk1lRWY0K2ZvaE1RNnBJMCtlbTVSc1hy?=
 =?utf-8?B?eFJua0JGZ1ZsalBOTWJmTlZEVVQvbnNRRkVtR1hMK29LVURmMDl4S2dwTmtS?=
 =?utf-8?B?aWxaaEJpNFdjOHlMekVDbW9BRmg5V01LdkRYdG1WYm5Ja05zVE0zbzUvbDRB?=
 =?utf-8?B?Y1BJUHAyRndOQURwYkdZTzhvcHM4MllORXpGZG9BMUJxYjlFbnIrcGJPb01Q?=
 =?utf-8?B?VWtDeStpbXYrU00xTkU2UDh5N2hYRG9XZ1AvN29tdjYxYXhDS0VCUXlvMFAr?=
 =?utf-8?B?YlVMUjhRUnhESTg3em9QS21kUUFxSnRad1RQZmVVY0ZhZDVyR0w3TkdrcFBt?=
 =?utf-8?B?Tk56TmtNMVIxYmpqa3ZBejdMREhLVlRwalRZRHdZellWMEsyTlpYbDEvZWJC?=
 =?utf-8?B?RHdWZVJHNU9vY0gwZmxwV09oUENMMHNieEtOVnNYUVcyNituRFUxb2YwbDlF?=
 =?utf-8?B?OUErdC8yY3A4aFdxUkcwYUxqVDdBWSsrbWJ6SzNzQmt0T1ZTRHk4eFFseDZL?=
 =?utf-8?B?bWZESjhaOVZKV1dkSmhBWDZYeE53dEVqd1ZSTkhzQlBUejFWSUhuRWNqelFh?=
 =?utf-8?B?TTlVNGFyc1VEMjVjZm9lWDlrckVtdU1tK2ZDZ1RpWm9MdVVIWkpKcGdJUk8w?=
 =?utf-8?B?b2RpemNsU0pnaytOdUovUEZrNksyTVgrRUNjWFBFMVBTSk1rUlJQT1BKVm82?=
 =?utf-8?B?Q2JSOENHcGZhOUxZL0dPSVFnY1Y0UXVNMDFXcTZFWmh0eTlIZkFIR2xNY0ZP?=
 =?utf-8?B?N3Y4R2JXRktwUXY2aVcvMG9HMGQxQVBGMXQyKzBSRFlldXdpcFRXNnFUbWVq?=
 =?utf-8?B?TlZGdEFrdHJqNG4zQSt4NFgzT1o2eTltTjZYTGhpYlpQRyttdnJMUVd0cWJq?=
 =?utf-8?B?emxQcFpwZTJqQjMrMVNqRFJjdXM0S3pzSTdJcit2RDZ3bzlqMzJDWVlPTnlF?=
 =?utf-8?B?dFo4M241T0FhY25McXlIR2s5UGFlNXk3Rm95Z0hMa0V1SVpJMFA5czA1OEF5?=
 =?utf-8?B?MC9RVGdaT0pVWkR2enZlNjRBNVk3NzR5UUhPMFpaS2RLTHkyTU52c0pSVW5L?=
 =?utf-8?B?aGZmOFJFWTVqUnRnS3BHR0V5WUdFR1kzVEpTb0lvV0RFNWowbGthZzBQdkE3?=
 =?utf-8?B?VVFuMVpHUDNVVkNucitzL2lOQ3Z5RGVxT3IxRGhPYkRmQ1VnamNia215Z25I?=
 =?utf-8?B?T2x2cWplc2tJdXFCcjA2SXhleWFmT1pSYjhYSSs3Y25NZU9ZZ1IybzhsYVU1?=
 =?utf-8?B?cFRrSDh5MGMrd0lDQ1k5M1FwZFhhbzA2dXhMNlJiZEZVZkJvdlZ3VDZ1NEsr?=
 =?utf-8?B?bStoRyt2cCtGZ0dZdVBSaVlrSVV4MG9WVHBxVzNFU2NMNS9yUjZxK1VIcDJn?=
 =?utf-8?B?ZVg2UnYzQ3BmT1RoOWRmcGN1NHduc21JeHZrOGhLTDNRa014ZHB6bXFhVUxZ?=
 =?utf-8?B?QmlhdS9FaklpVVRGcmlvazE4WUNwUzhXdmZRa0t3UnVtbEk1Kyt3VFVHOXJU?=
 =?utf-8?B?Rno3ckFXai9KMGxYRU1qNnpSQXJhVVBjL2xYcWU3bFJwdjBsK01nUHlLTHIz?=
 =?utf-8?B?NEtxcnhKYzhLWGwzNDJWU0hBRDE3dG8xSGpLcWw3ZUNiUHo0cWRqeVpuNHlk?=
 =?utf-8?B?T1dlY0p3QldBRW9DNHREY2dFaGd6dk50VkNIaXhVR3dnaE42ZzIrMSs1Umlq?=
 =?utf-8?B?VG1MWHIybTZ0MTI4OHZnNnpFVHNkV1RwbHhBVENJcTVUdVB1VWhYUVZhRG1L?=
 =?utf-8?B?SUlIRDdldmNva0IvU1F2M0xsR2xua1pPM3lkQ2EwU2FRT0RZMUxXcDd5QmUx?=
 =?utf-8?B?MkExaE4zbVlldy9zbWc1MVkzN2lpVGlKZll0VHpyNE5JQkZjQXhNWXl0citk?=
 =?utf-8?Q?yQltbsFSjghuKiMR2tFAIT4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A18BCE1C7637224EAA5C4D59D3BB9119@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ead215-e036-4f3a-d3d0-08dcdeca2db7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 07:58:31.1194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4pk6AbBfw/ISliYYTBGc1soj62/rpS7y77MUtx6HSB6lvxCB+L17hrcwKmUIQ6TWLxkMXUEkrGv04521YCad4LAum5jM/2AaTtPvs4PjPKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
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

T24gRnJpLCAyMDI0LTA5LTI3IGF0IDA3OjE4ICswMjAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IE9uIFRodSwgU2VwIDI2LCAyMDI0IGF0IDA0OjU0OjUzUE0gKzAyMDAsIEdyemVn
b3J6ZWssIERvbWluaWsgd3JvdGU6DQo+ID4gT24gVGh1LCAyMDI0LTA5LTI2IGF0IDE0OjE4ICsw
MjAwLCBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpIHdyb3RlOg0KPiA+ID4gVGhpcyBwYXRjaCBp
bnRyb2R1Y2VzIHByZWVtcHRfdGltZW91dCBoZWxwZXJzOg0KPiA+ID4gIC0geGVfZXVkZWJ1Z19z
ZXRfcHJlZW1wdF90aW1lb3V0X3RvX21heA0KPiA+ID4gICAgU2V0cyBwcmVlbXB0X3RpbWVvdXRf
dXMgZm9yIGdpdmVuIGVuZ2luZV9jbGFzcyB0byBtYXhpbXVtLg0KPiA+ID4gIC0geGVfZXVkZWJ1
Z19yZXN0b3JlX3ByZWVtcHRfdGltZW91dA0KPiA+ID4gICAgU2V0cyBwcmVlbXB0X3RpbWVvdXRf
dXMgZm9yIGdpdmVuIGVuZ2luZV9jbGFzcyB0byBwcmV2aW91cyB2YWx1ZS4NCj4gPiA+IA0KPiA+
IA0KPiA+IEkgdGhpbmsgdGhpcyBzaG91bGQgcmVhbGx5IGdvIHRvIGlndF9zeXNmcy5jLiBBbmQg
aW4gc2xpZ3RseSBkaWZmZXJlbnQgZm9ybToNCj4gPiBIb3cgYWJvdXQgc3RoIGxpa2U6DQo+IA0K
PiBXZSdyZSBjb21waWxpbmcgbGliL3hlX2V1ZGVidWcuYyBjb25kaXRpb25hbGx5IHNvIEkgd291
bGRuJ3QgcG9sbHV0ZSBpZ3Rfc3lzZnMuYw0KPiB3aXRoIGV1ZGVidWcgY29kZSAoYXQgbGVhc3Qg
eWV0KS4NCj4gDQo+IC0tDQo+IFpiaWduaWV3DQoNCk5vdGVkLCBrZWVwaW5nIGZ1bmN0aW9uIHdp
dGhvdXQgdW5jb25kaXRpb25hbCB1c2FnZSBpcyB1bndlbGNvbWUuDQpJZiBzbywgSSB3b3VsZCBq
dXN0IGRlZmluZSB0aG9zZSBmdW5jdGlvbiBsb2NhbHkgaW4gdGhlIHRlc3QgaGF2aW5nIGluIG1p
bmQob3INCmluIHRoZSBjb21tZW50KSB0aGF0IGl0IGNvdWxkIGJlIG1vdmVkIHdoZW5ldmVyIEtN
RCBwYXJ0IG9mIGV1ZGVidWcgZ2V0cyB1cHN0cmVhbWVkLg0KU2V0dGluZyBlbmdpbmUgcHJvcGVy
aWVzIGlucyd0IHJlYWxseSBzdGggZXhjdWxzaXZlIHRvIGV1IGRlYnVnZ2VyLCB0aHVzIEkgdGhp
bmsgbGliL3hlX2V1ZGVidWcNCmlzbid0IGEgZ29vZCBwbGFjZSBmb3IgdGhhdC4NCg0KUmVnYXJk
cywNCkRvbWluaWsNCj4gDQo+ID4gDQo+ID4gaWd0X3N5c2ZzX2VuZ2luZV9zZXRfcHJvcGVydHko
ZW5naW5lc19mZCwgInByZWVtcHRfdGltZW91dF91cyIsIHZhbHVlKTsNCj4gPiBpZ3Rfc3lzZnNf
ZW5naW5lX3NldF9wcm9wZXJ0eV9ib3VuZChlbmdpbmVzX2ZkLCAicHJlZW1wdF90aW1lb3V0X3Vz
IiwgbWF4KTsNCj4gPiANCj4gPiAsd2hlcmUgbWF4IGlzIGEgYm9vbCB2YXJpYWJsZSB3aGljaCB0
ZWxscyB3aGV0aGVyIGl0IHNob3VsZCBiZSBtaW4gb3IgbWF4Lg0KPiA+IA0KPiA+IFRvIGZpbmQg
ZW5naW5lc19mZCB4ZV9zeXNmc19lbmdpbmVfb3BlbiBjb3VsZCBiZSB1c2VkLg0KPiA+IA0KPiA+
IFJlZ2FyZHMsDQo+ID4gRG9taW5paw0KPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogRG9taW5p
ayBLYXJvbCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4N
Cj4gPiA+IC0tLQ0KPiA+ID4gIGxpYi94ZS94ZV9ldWRlYnVnLmMgfCAxMjAgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ICBsaWIveGUveGVfZXVkZWJ1
Zy5oIHwgICAzICsrDQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygrKQ0K
PiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2V1ZGVidWcuYyBiL2xpYi94ZS94
ZV9ldWRlYnVnLmMNCj4gPiA+IGluZGV4IDJjN2NkMmFlMS4uMjI5ZjllNmExIDEwMDY0NA0KPiA+
ID4gLS0tIGEvbGliL3hlL3hlX2V1ZGVidWcuYw0KPiA+ID4gKysrIGIvbGliL3hlL3hlX2V1ZGVi
dWcuYw0KPiA+ID4gQEAgLTE2LDYgKzE2LDcgQEANCj4gPiA+ICAjaW5jbHVkZSAiaW50ZWxfcGF0
LmgiDQo+ID4gPiAgI2luY2x1ZGUgInhlX2V1ZGVidWcuaCINCj4gPiA+ICAjaW5jbHVkZSAieGVf
aW9jdGwuaCINCj4gPiA+ICsjaW5jbHVkZSAieGVfZHJtLmgiDQo+ID4gPiAgDQo+ID4gPiAgc3Ry
dWN0IGV2ZW50X3RyaWdnZXIgew0KPiA+ID4gIAl4ZV9ldWRlYnVnX3RyaWdnZXJfZm4gZm47DQo+
ID4gPiBAQCAtMTcxNyw2ICsxNzE4LDEyNSBAQCBib29sIHhlX2V1ZGVidWdfZW5hYmxlKGludCBm
ZCwgYm9vbCBlbmFibGUpDQo+ID4gPiAgCXJldHVybiBvbGQ7DQo+ID4gPiAgfQ0KPiA+ID4gIA0K
PiA+ID4gKy8qKg0KPiA+ID4gKyAqIHhlX2V1ZGVidWdfc2V0X3ByZWVtcHRfdGltZW91dF90b19t
YXgNCj4gPiA+ICsgKiBAZmQ6IHhlIGNsaWVudA0KPiA+ID4gKyAqIEBlbmdpbmVfY2xhc3M6IGVu
Z2luZSBjbGFzcyB0byBtb2RpZnkgKGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UtPmVuZ2lu
ZV9jbGFzcykNCj4gPiA+ICsgKiBAdmFsdWU6IHBvaW50ZXIgdG8gdmFyaWFibGUgdG8gc3RvcmUg
cHJldmlvdXMgcHJlZW1wdF90aW1lb3V0IHZhbHVlIGluLCBuZWVkZWQgZm9yIHJlc3RvcmUNCj4g
PiA+ICsgKg0KPiA+ID4gKyAqIFNldHMgcHJlZW1wdF90aW1lb3V0X3VzIGZvciBnaXZlbiBlbmdp
bmVfY2xhc3MgdG8gbWF4aW11bS4NCj4gPiA+ICsgKg0KPiA+ID4gKyAqIFJldHVybnM6IHRydWUg
b24gc3VjY2VzcywgZmFsc2Ugb24gZmFpbHVyZS4NCj4gPiA+ICsgKi8NCj4gPiA+ICtib29sIHhl
X2V1ZGVidWdfc2V0X3ByZWVtcHRfdGltZW91dF90b19tYXgoaW50IGZkLCB1aW50MTZfdCBlbmdp
bmVfY2xhc3MsIHVpbnQzMl90ICp2YWx1ZSkNCj4gPiA+ICt7DQo+ID4gPiArCWludCBlbmdpbmVz
X2ZkOw0KPiA+ID4gKwlpbnQgZ3RfZmQ7DQo+ID4gPiArCXVpbnQzMl90IG1heF92YWx1ZTsNCj4g
PiA+ICsNCj4gPiA+ICsJaWd0X2Fzc2VydChlbmdpbmVfY2xhc3MgPT0gRFJNX1hFX0VOR0lORV9D
TEFTU19SRU5ERVIgfHwNCj4gPiA+ICsJCSAgIGVuZ2luZV9jbGFzcyA9PSBEUk1fWEVfRU5HSU5F
X0NMQVNTX0NPTVBVVEUpOw0KPiA+ID4gKw0KPiA+ID4gKwlndF9mZCA9IHhlX3N5c2ZzX2d0X29w
ZW4oZmQsIDApOw0KPiA+ID4gKwlpZiAoZ3RfZmQgPT0gLTEpIHsNCj4gPiA+ICsJCWlndF9kZWJ1
ZygiRmFpbGVkIHRvIG9wZW4gZ3QuXG4iKTsNCj4gPiA+ICsNCj4gPiA+ICsJCXJldHVybiBmYWxz
ZTsNCj4gPiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gKwlpZiAoZW5naW5lX2NsYXNzID09IERSTV9Y
RV9FTkdJTkVfQ0xBU1NfUkVOREVSKQ0KPiA+ID4gKwkJZW5naW5lc19mZCA9IG9wZW5hdChndF9m
ZCwgImVuZ2luZXMvcmNzIiwgT19SRE9OTFkpOw0KPiA+ID4gKwllbHNlDQo+ID4gPiArCQllbmdp
bmVzX2ZkID0gb3BlbmF0KGd0X2ZkLCAiZW5naW5lcy9jY3MiLCBPX1JET05MWSk7DQo+ID4gPiAr
DQo+ID4gPiArCWlmIChlbmdpbmVzX2ZkID09IC0xKSB7DQo+ID4gPiArCQlpZ3RfZGVidWcoIkZh
aWxlZCB0byBvcGVuIGVuZ2luZSBjbGFzcy5cbiIpOw0KPiA+ID4gKwkJY2xvc2UoZ3RfZmQpOw0K
PiA+ID4gKw0KPiA+ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ID4gKwl9DQo+ID4gPiArDQo+ID4g
PiArCWlmICghX19pZ3Rfc3lzZnNfZ2V0X3UzMihlbmdpbmVzX2ZkLCAicHJlZW1wdF90aW1lb3V0
X3VzIiwgdmFsdWUpKSB7DQo+ID4gPiArCQlpZ3RfZGVidWcoIkZhaWxlZCB0byByZWFkIHByZWVt
cHRfdGltZW91dF91cy5cbiIpOw0KPiA+ID4gKwkJY2xvc2UoZW5naW5lc19mZCk7DQo+ID4gPiAr
CQljbG9zZShndF9mZCk7DQo+ID4gPiArDQo+ID4gPiArCQlyZXR1cm4gZmFsc2U7DQo+ID4gPiAr
CX0NCj4gPiA+ICsNCj4gPiA+ICsJaWYgKCFfX2lndF9zeXNmc19nZXRfdTMyKGVuZ2luZXNfZmQs
ICJwcmVlbXB0X3RpbWVvdXRfbWF4IiwgJm1heF92YWx1ZSkpIHsNCj4gPiA+ICsJCWlndF9kZWJ1
ZygiRmFpbGVkIHRvIHJlYWQgcHJlZW1wdF90aW1lb3V0X21heC5cbiIpOw0KPiA+ID4gKwkJY2xv
c2UoZW5naW5lc19mZCk7DQo+ID4gPiArCQljbG9zZShndF9mZCk7DQo+ID4gPiArDQo+ID4gPiAr
CQlyZXR1cm4gZmFsc2U7DQo+ID4gPiArCX0NCj4gPiA+ICsNCj4gPiA+ICsJaWYgKCFfX2lndF9z
eXNmc19zZXRfdTMyKGVuZ2luZXNfZmQsICJwcmVlbXB0X3RpbWVvdXRfdXMiLCBtYXhfdmFsdWUp
KSB7DQo+ID4gPiArCQlpZ3RfZGVidWcoIkZhaWxlZCB0byB3cml0ZSBwcmVlbXB0X3RpbWVvdXRf
dXMuXG4iKTsNCj4gPiA+ICsJCWNsb3NlKGVuZ2luZXNfZmQpOw0KPiA+ID4gKwkJY2xvc2UoZ3Rf
ZmQpOw0KPiA+ID4gKw0KPiA+ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ID4gKwl9DQo+ID4gPiAr
DQo+ID4gPiArCWNsb3NlKGVuZ2luZXNfZmQpOw0KPiA+ID4gKwljbG9zZShndF9mZCk7DQo+ID4g
PiArDQo+ID4gPiArCXJldHVybiB0cnVlOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICsvKioN
Cj4gPiA+ICsgKiB4ZV9ldWRlYnVnX3Jlc3RvcmVfcHJlZW1wdF90aW1lb3V0DQo+ID4gPiArICog
QGZkOiB4ZSBjbGllbnQNCj4gPiA+ICsgKiBAZW5naW5lX2NsYXNzOiBlbmdpbmUgY2xhc3MgdG8g
bW9kaWZ5IChkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlLT5lbmdpbmVfY2xhc3MpDQo+ID4g
PiArICogQHZhbHVlOiBwcmV2aW91cyBwcmVlbXB0X3RpbWVvdXQgdmFsdWUNCj4gPiA+ICsgKg0K
PiA+ID4gKyAqIFNldHMgcHJlZW1wdF90aW1lb3V0X3VzIGZvciBnaXZlbiBlbmdpbmVfY2xhc3Mg
dG8gcHJldmlvdXMgdmFsdWUuDQo+ID4gPiArICoNCj4gPiA+ICsgKiBSZXR1cm5zOiB0cnVlIG9u
IHN1Y2Nlc3MsIGZhbHNlIG9uIGZhaWx1cmUuDQo+ID4gPiArICovDQo+ID4gPiArYm9vbCB4ZV9l
dWRlYnVnX3Jlc3RvcmVfcHJlZW1wdF90aW1lb3V0KGludCBmZCwgdWludDE2X3QgZW5naW5lX2Ns
YXNzLCB1aW50MzJfdCB2YWx1ZSkNCj4gPiA+ICt7DQo+ID4gPiArCWludCBlbmdpbmVzX2ZkOw0K
PiA+ID4gKwlpbnQgZ3RfZmQ7DQo+ID4gPiArDQo+ID4gPiArCWlndF9hc3NlcnQoZW5naW5lX2Ns
YXNzID09IERSTV9YRV9FTkdJTkVfQ0xBU1NfUkVOREVSIHx8DQo+ID4gPiArCQkgICBlbmdpbmVf
Y2xhc3MgPT0gRFJNX1hFX0VOR0lORV9DTEFTU19DT01QVVRFKTsNCj4gPiA+ICsNCj4gPiA+ICsJ
Z3RfZmQgPSB4ZV9zeXNmc19ndF9vcGVuKGZkLCAwKTsNCj4gPiA+ICsJaWYgKGd0X2ZkID09IC0x
KSB7DQo+ID4gPiArCQlpZ3RfZGVidWcoIkZhaWxlZCB0byBvcGVuIGd0LlxuIik7DQo+ID4gPiAr
DQo+ID4gPiArCQlyZXR1cm4gZmFsc2U7DQo+ID4gPiArCX0NCj4gPiA+ICsNCj4gPiA+ICsJaWYg
KGVuZ2luZV9jbGFzcyA9PSBEUk1fWEVfRU5HSU5FX0NMQVNTX1JFTkRFUikNCj4gPiA+ICsJCWVu
Z2luZXNfZmQgPSBvcGVuYXQoZ3RfZmQsICJlbmdpbmVzL3JjcyIsIE9fUkRPTkxZKTsNCj4gPiA+
ICsJZWxzZQ0KPiA+ID4gKwkJZW5naW5lc19mZCA9IG9wZW5hdChndF9mZCwgImVuZ2luZXMvY2Nz
IiwgT19SRE9OTFkpOw0KPiA+ID4gKw0KPiA+ID4gKwlpZiAoZW5naW5lc19mZCA9PSAtMSkgew0K
PiA+ID4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gb3BlbiBlbmdpbmUgY2xhc3MuXG4iKTsNCj4g
PiA+ICsJCWNsb3NlKGd0X2ZkKTsNCj4gPiA+ICsNCj4gPiA+ICsJCXJldHVybiBmYWxzZTsNCj4g
PiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gKwlpZiAoIV9faWd0X3N5c2ZzX3NldF91MzIoZW5naW5l
c19mZCwgInByZWVtcHRfdGltZW91dF91cyIsIHZhbHVlKSkgew0KPiA+ID4gKwkJaWd0X2RlYnVn
KCJGYWlsZWQgdG8gd3JpdGUgcHJlZW1wdF90aW1lb3V0X3VzLlxuIik7DQo+ID4gPiArCQljbG9z
ZShlbmdpbmVzX2ZkKTsNCj4gPiA+ICsJCWNsb3NlKGd0X2ZkKTsNCj4gPiA+ICsNCj4gPiA+ICsJ
CXJldHVybiBmYWxzZTsNCj4gPiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gKwljbG9zZShlbmdpbmVz
X2ZkKTsNCj4gPiA+ICsJY2xvc2UoZ3RfZmQpOw0KPiA+ID4gKw0KPiA+ID4gKwlyZXR1cm4gdHJ1
ZTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiAgLyogRXUgZGVidWdnZXIgd3JhcHBlcnMgYXJv
dW5kIHJlc291cmNlIGNyZWF0aW5nIHhlIGlvY3Rscy4gKi8NCj4gPiA+ICANCj4gPiA+ICAvKioN
Cj4gPiA+IGRpZmYgLS1naXQgYS9saWIveGUveGVfZXVkZWJ1Zy5oIGIvbGliL3hlL3hlX2V1ZGVi
dWcuaA0KPiA+ID4gaW5kZXggMjlhYjY4ZmVlLi4xNDQwMzU4NjIgMTAwNjQ0DQo+ID4gPiAtLS0g
YS9saWIveGUveGVfZXVkZWJ1Zy5oDQo+ID4gPiArKysgYi9saWIveGUveGVfZXVkZWJ1Zy5oDQo+
ID4gPiBAQCAtMTY3LDYgKzE2Nyw5IEBAIHZvaWQgeGVfZXVkZWJ1Z19jbGllbnRfc2V0X2RhdGEo
c3RydWN0IHhlX2V1ZGVidWdfY2xpZW50ICpjLCB2b2lkICpwdHIpOw0KPiA+ID4gIA0KPiA+ID4g
IGJvb2wgeGVfZXVkZWJ1Z19lbmFibGUoaW50IGZkLCBib29sIGVuYWJsZSk7DQo+ID4gPiAgDQo+
ID4gPiArYm9vbCB4ZV9ldWRlYnVnX3NldF9wcmVlbXB0X3RpbWVvdXRfdG9fbWF4KGludCBmZCwg
dWludDE2X3QgZW5naW5lX2NsYXNzLCB1aW50MzJfdCAqdmFsdWUpOw0KPiA+ID4gK2Jvb2wgeGVf
ZXVkZWJ1Z19yZXN0b3JlX3ByZWVtcHRfdGltZW91dChpbnQgZmQsIHVpbnQxNl90IGVuZ2luZV9j
bGFzcywgdWludDMyX3QgdmFsdWUpOw0KPiA+ID4gKw0KPiA+ID4gIGludCB4ZV9ldWRlYnVnX2Ns
aWVudF9vcGVuX2RyaXZlcihzdHJ1Y3QgeGVfZXVkZWJ1Z19jbGllbnQgKmMpOw0KPiA+ID4gIHZv
aWQgeGVfZXVkZWJ1Z19jbGllbnRfY2xvc2VfZHJpdmVyKHN0cnVjdCB4ZV9ldWRlYnVnX2NsaWVu
dCAqYywgaW50IGZkKTsNCj4gPiA+ICB1aW50MzJfdCB4ZV9ldWRlYnVnX2NsaWVudF92bV9jcmVh
dGUoc3RydWN0IHhlX2V1ZGVidWdfY2xpZW50ICpjLCBpbnQgZmQsDQo+ID4gDQoNCg==
