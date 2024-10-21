Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA15D17130
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 20:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6408310E181;
	Mon, 21 Oct 2024 20:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7UqCTa+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BAA10E181
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 20:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729542130; x=1761078130;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nNLllP+I3zZNzLf2yOka2xGBL3B+rAkq8JlqnpuzPHE=;
 b=h7UqCTa+uO7mHmx1FnpeoLpJ3uyvB1ahr2q/KZi66S00x7c+qNxKkLnD
 mraCKYQ3zJMyac+Yf6VNgdkCI09AdNe9JpFtklxOaxVl9JPMLrg5DzQBl
 vDVbFftFB9ZLzZf21NkoPS9C+T+wtHeKdfFYZFLq+wSaV1czE8czFrU1j
 OEQmBRyRH0PbwIRsJEgcJFWd8TKxa8pB3/I9CCCyHuDKEh4cY8fYVw8xe
 rCnv1oP1xM5P9XaNQoB4XLSIHjkI3MShlnoV0zNySbG7Wng4jLXbMz10B
 4Vg0tmUZMljOlrIi50pVq5g5rGATujtPJXHEkUv6SxVd1fdfGMp3Enx2S Q==;
X-CSE-ConnectionGUID: ws+m9iC/QDSbP7xOT0qg5Q==
X-CSE-MsgGUID: E4HhaLgdSGajpWFlSVvhKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40168188"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40168188"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:22:10 -0700
X-CSE-ConnectionGUID: vLlRkFvmRgSIPSM7rGDL1g==
X-CSE-MsgGUID: YRK3x60lSFOwTTLAPSm2HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="80038106"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 13:22:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 13:22:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 13:22:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 13:22:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlTtLITZU+ArQg0asEL3N4i5iA5RaWZWf/HDr+vvp+WnPlfBTOf9XWl0u+YjD5unKJ78hO+owGE0nKXNBbqhHI6fL5zoQokp5g3r1w6LglAG5sh0PcEKe2/8z9h9wTby8zpAVha5F6Q8ernYENhFP1Tmqyzo7pWn1SRJUASLqxOA9CyzqG2OaoANpVOumyoqxMTtJEBGG+FZmuHHMJ/DPqmELOvl3Qaq4qwp6CanFJ5IK1+G45bX1xitbhIHAKHPu9x4m49VWLTcEPr5yDLzkyZ+u12E9ih5MwLYnP7aPqfevegVPNiw9XMHgVSep/a1hXNnN/g1hWGvT90N2io5wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aoOszTzm+PgJfiaEbfFB5QXGDS5qWoje71FL1jPX18=;
 b=Ot+8QYej5ZLVF2Y7gpBXA80NSB7nLC/df9dczFeNOb6Z8NO9hMIzURaci5eaUdVEKpzGp30hyzZ7AftJwHoYLvp3+UvM+1oe9+AsMIAIyrN+tvoYXpbDToh15LFU7pnOvXPkoDGYnx7aARM6/krsFclgBND3GRzOwV/IIUdTj4rAOBKrzVjQ4rn3nY+OV7V9jOhACdn8izuYIonIl9c/95Ife2W6i6NwDn3BiY0UAvY8LSUgYzqSmhoGWXOrdD4BmfvAorw3uFieKNx/2+CW42ImR+tyBqPNKlbvZYiP51z0APD6HAmlcD9qJ76vvPX1RlweqpEnoLYRGvxkl0mmAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Mon, 21 Oct
 2024 20:22:06 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8069.024; Mon, 21 Oct 2024
 20:22:06 +0000
Message-ID: <b8287182-1717-4e2f-9109-e43cbc546056@intel.com>
Date: Tue, 22 Oct 2024 01:52:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_flip.c: Updating the skip message
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20241015171849.1733664-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241015171849.1733664-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::19) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MN0PR11MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: 3354ed19-f295-4b43-f426-08dcf20e084e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnZWSE5pRmNPL1N6U3NEZVYvU0JFb2V3d1BDRGxtbDFvKzVMQ1BVbW1uVndJ?=
 =?utf-8?B?NzhvUkF4Q1ZBSGIxeGQveWN3SXk2VmVhSEdCem1MaVEzTXRRZzVMN28yY1N3?=
 =?utf-8?B?V1lmUzZWbjl6Y2VRN25lVFhoeXpuZ3pheHdMTUVlZFNlNjlKNkRpd2IydGhj?=
 =?utf-8?B?cVI4dlpHeFJwV1Z3S040NmptUm81dFYraWVRZlZuTGZmZHVKYnpFdW5XVVhR?=
 =?utf-8?B?WmxKeEVKWEYrUTFFamw5dE55STc5UWpVTUdUeDdia2tLU0ExZGwxb25vUFZP?=
 =?utf-8?B?MWhlNVExU1QrOGo5bUQyNWUwdThLU0wyenZWWVFoN1l5b0lQQklINitORC8y?=
 =?utf-8?B?SGNBQWRoSGFON2lxNktVV29PalFpdjFZbnhnNFF3TkZzVXRPazM0UzcvQjNu?=
 =?utf-8?B?dnlKZWVpdHJVTURxWDlsN01GSGg5NzhLWnhiV080RHpVdmJHT1dGb3RlbEhH?=
 =?utf-8?B?Z2ZUYUhZamxjSEtVOE9LUnhjUTF6NHd5ZENZNjEwbEN3S2tqK3lvTkFYVVdB?=
 =?utf-8?B?V3I1Y2h5RVprS1RRY2tDNmFncUQxdGsyaVRSdWVyaVBCdzJHTEdFSFFGR0xh?=
 =?utf-8?B?LzhqeVo0V0VFODhBTDdsK29ISE0xYTZhSnJaVUN5N3R6KzF6TkRjWlMzVjdB?=
 =?utf-8?B?Y0kvM2pwMHNMMVVLbjVOb2RwRm90NytqRTVxOU93bjdxYkpmNUdvLzN4Rzl6?=
 =?utf-8?B?VGpOQnRGeVRFQXlIMjVlSzdBK1RXYlZselUrVzBSUjlmTmtGVXVRR1U0akdJ?=
 =?utf-8?B?Mlh6WERyV1JXU1FQZklibVZJc2hKU1BQS09rbXlBLzRFbTc2L1RQQjZYSHVD?=
 =?utf-8?B?dG1jbVBLcVQxS3VRTGlkZ2FMb3liQzMwQnI5Vy9MbHMrcG44eG1Zb0cwRWhQ?=
 =?utf-8?B?WWppNS9iRlZTa0YwcWZacnhmM1ZWMjByOU5iTWdWMUx1VkdkcTlPdFNYOVVy?=
 =?utf-8?B?MSt6dFAxbjVTbm91cVFNK28weGtva0M3bUk2TzlOb0hGcXFpMTlkR1d2Rnhl?=
 =?utf-8?B?dnhjQTQ4OWJJS2dpQXFBREpwVlpFdGFCRkdVRjk5V1RUR3RvRm1KU3pqRytx?=
 =?utf-8?B?YktIWlRYUm5Jc1J6Q2o5Q0RteXZhbkZ2MmZONkwzMWtPMUl2TlFBUGZBTStr?=
 =?utf-8?B?cTZyVUFnbVdCeTlVZU5rdGxyUk5FamE0RzFpbmlVMlBaT0VxRFczSi9iZkhh?=
 =?utf-8?B?WUhydGRXWUtnRDVwZi83TXB0Z0hmMGZqZkdqbzR0bkp5eEJyV3pyeTBrNlVD?=
 =?utf-8?B?M2g3amxvdHNUd0tUb1EweklWa0Q1VVRYOTRjQk9MbTdVRlh0djZ1L2UrYjNL?=
 =?utf-8?B?ZmhJVG1kLzdIbXBYUFNtdDBNaXFhSmkvckwvdUxzYS9XUkNiTGxESHRIZXJk?=
 =?utf-8?B?UUpqL2kvU1I4ZXhlTE5JdndnT1l6clZVNjhQZHNMNGg2R1JINzRaZEtCU2px?=
 =?utf-8?B?V3lpb0VYZmNlcTMwVEN5N1FxSU1NZld0WlRhTnJEZnpYOXhPV0VTcDlsRXZ4?=
 =?utf-8?B?UkZ6SEhwRjZvUjFtbC9TYW5zaU1rekxySmVDSk1kSk1Gdmh1OWNMZThaZnZy?=
 =?utf-8?B?NFZpdU9RdHA5cy9McVo2UW5tbEhQOW5FWExDRUJkS2k1eTB3S2xJMVhyU2Fq?=
 =?utf-8?B?Rkp6YzlXd0tycHpsQ1VCTnJJMElUV1d6dWI1YWVSMlFBSXZybTRnNytCb21H?=
 =?utf-8?Q?I+XiE4alX1BtNAFGiDNw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjlwQ25EV2l2VHlGUUNMTm5yc1pNR3ZvTFpDbGI4OGJZcmxzck0ycE5oQncz?=
 =?utf-8?B?L0psZDNqMEE3VndrelFHY2FOcXV1eXo0N2MvZXFWbTNlZVFOWDBwSDBCZjJQ?=
 =?utf-8?B?RGNMRG1EdmlZSmVIQVdYbFRWZzZjQVNhbHdoSHBpMkR1OUc4cVBjdGdlTDZV?=
 =?utf-8?B?VVBYVFk1MkRYTkJyUDVuWFNtWXI4bWNrKzR0dGUxVjNsNXYzS0pDeURTOE1s?=
 =?utf-8?B?S3BkdUVHS3UrV0xQSFB3bSt2QlZqOUtnQ0ZGOWhIaTlxcDJxYmRUNWMwTExU?=
 =?utf-8?B?SU1GN2RHd0Q4QnVVZnJsdEVCRXBMSUVuK0xNc25mcC9oSWZjc3o3ZjdGbDN4?=
 =?utf-8?B?OWlkWC9rNTNVeGJ0WVRueVV6YU1Qbk01U3R5K2VweVFuYmYxME4yczU0OFJG?=
 =?utf-8?B?Z2lxb05IRTFPby9DbElrMmlDNzIxT1hQbWhaVDNyZ2lDMURpaHdRN3FVNmEz?=
 =?utf-8?B?U2N5UUNvU05ZVWRJUUUvTTlOSVRnMXlvaGowbnhlZzlaWWwveTk5aVZFdURB?=
 =?utf-8?B?SU1sRFNZbGt5SGdwakpqOU1zSnhZSk5mKzRPV2dRVmxNc1ZXT25BNDdtbStF?=
 =?utf-8?B?U1hVeVM2akV3RHpkYWE3dWZqazVSUEhTeDI5cWUvV2NRTStwY2NnTG5LYjZW?=
 =?utf-8?B?Q1BGTW5Bb1IzdW1mQkt6WWR0VnZuZUpTbUVQNi9YV3JkM1FvbGxTWktjZHla?=
 =?utf-8?B?ZlJGV2E2aTRCK3R0bmViZHA0Skp2dzdJaTA3a2V1a1BRK2tLcXAvQUpRR1pY?=
 =?utf-8?B?eHQzeWhvNldyR1RhcnlxQisxU1hPSElBZDVldXp0Z3U4WTF0Wno4RWZ4dmJ2?=
 =?utf-8?B?ekhnYWJkZjU0bnc0ZGh4ZWJ1RGU3TlE2RllPK256STBEdzk0M3QzNDRmemRZ?=
 =?utf-8?B?cmtOY2RZN0dqOHIvcll0L0lyWG5CRXBrN2NqM0lsb2xyVWYxZmszdU1VSWp1?=
 =?utf-8?B?ekhVaWliOGVxanRWb25JMFdYM1NFK1F6R0owRnRXZFBnY3dKQ0J0azJ1VEZM?=
 =?utf-8?B?QnBEbG1VUVlKVDlXajF4QnAzbWpjVUpXaFhicUhlcWJ0ZHVWNUdJQkZrZGVp?=
 =?utf-8?B?d0xjdnRPd0xQNUlxTGF0SjdYWU1MQ0dkcldZSDZ0aFhjSzllZStmTDVISS9w?=
 =?utf-8?B?Z0JxRkJsSXpRaEFhMVVqbTFFQTBLQzBRM2pwZE9reWhHdmdOb2NhdWpLM0tP?=
 =?utf-8?B?VjJpK3RIcy9NeFFldFNUcElXaldmaXFaYkpmVFg4RkhQaE5hWXBCbGJnZGln?=
 =?utf-8?B?VkN2MForcW5JTXBYcXByeWkyTWFObGpmMUJ6c3ZSQUVxY213ck1xK25iZCtk?=
 =?utf-8?B?ZlJkVENzU0M5NkF6V2ZGTnRuazdtdHRaSTBtU0NnU3BZZmVDb1JaSnFFZk9E?=
 =?utf-8?B?NHkzV28rNGwxbkZ2VXlZT1NwN3h4ejNkUjA0K0c0RUNWM24xSVdlN3FSY292?=
 =?utf-8?B?T0p0dm1TK0FhVnl2V3lPSVprQ01yZ2tTeWgyeTI3ZHNueVBYb2J2OStObVU4?=
 =?utf-8?B?Rm9qN0h1NVUwcERhVHN1cXprVDkwQ2c1RGFyUDM1dzdXNWNmVW5CWVNsUHor?=
 =?utf-8?B?amJkd1hieWc4dk9QU1JFbUVITHZDNXhHZncrdTl4UWhEQ1ZONXFnaXd4ZlNx?=
 =?utf-8?B?c09TUG45cmJJQUFMU090b21lbGtOZUFnaHp2WFFwWGVmZWYrcG8xZmNUVU54?=
 =?utf-8?B?N0ZMRE84UW1qb2xtVG10SlZFSWpUZzQ5aDVRekdBejJEdWpNYlBHYm5IbmVL?=
 =?utf-8?B?c2c1R1ZncUhEK3FxaFFmUWlaRGZEODlnSEdmTnpoYk1RYXphRWE3Y2FZZlFU?=
 =?utf-8?B?QVFPaFNJUDd2Y3hWYTQxWnFuaWdQa01TTGxOQ2MvZHNTWCtVbXVCV08xOXR3?=
 =?utf-8?B?ZDhBRExvNlVvZVJkWFoxTXV4NG9kRnd1dkZ0WjdnZnNUam5GdUxSWGlNbVFC?=
 =?utf-8?B?eDN4OXdWd3VWRU95WHhnUkVPSVNZeU13S1NJWXZ1RU9iVGNLOVA5cWZGc2Qx?=
 =?utf-8?B?SDdLbnBsTlp1V3lLMW1pcXBlUHF6eTRFWlpoR0tic3RoUXZ5eGJxSUFkVUdh?=
 =?utf-8?B?bmRXdUFBMmljZHpodjRSb3FEeTFtMFNuNS9TTHFGdTlEcElISnYvZ3pWQjdR?=
 =?utf-8?B?ZGNYSnNVamUyNHFlaGxpQ0N6dHpEZXA3Y0tCMmg5UUZvcWl2aVdZclUxaVJT?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3354ed19-f295-4b43-f426-08dcf20e084e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 20:22:06.6624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wC2+3SxduzrfvwrmcbvVh4enKyPm+t3N0kNTtdU0xs0PBTqJsurQKqkYdG5vFLG3jcS9MY3L4qulEWb6Ofpoog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
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

Hi Pranay,

Please fix the subject. Imperative mood should be used in subject line. 
For guidance on writing effectivecommitmessages, please refer to 
this10-minute read <https://cbea.ms/git-commit/>.

Also,

s/kms_flip.c/kms_flip

On 15-10-2024 22:48, Pranay Samala wrote:
> Debugging would be easier if we had logs available for
> test failures and skips. This patch rephrases the skip
> message for better understanding.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_flip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index cbabbe74f..88cd41083 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1896,7 +1896,7 @@ static void run_pair(int duration, int flags)
>   
>   	/* If we have fewer than 2 connected outputs then we won't have any
>   	 * configuration at all. So skip in that case. */
> -	igt_require_f(modes, "At least two displays required\n");
> +	igt_require_f(modes, "At least two displays with same modes are required\n");
>   
>   	if (duration) {
>   		duration = duration * 1000 / modes;
