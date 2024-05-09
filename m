Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE69EC25B10
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 17:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB6710E189;
	Thu,  9 May 2024 17:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihmEaj/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3C210E189
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715274477; x=1746810477;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=9TxXrud/My6vgel88yB4joi8fG3goFZA9RLd0inVqJE=;
 b=ihmEaj/ADltfcGTMoaPuhLW+Dotne0IVRZ8ZSz5jY5y8B4dsoxc3+hzn
 quKincBmOnucsirh83n5JKF5rGsuRMeoAkU9jTyOaeZiS6/slgtcvzus4
 kIsxNmRt5s33qeLfx6IVHsTQFRKnd9BYck9riBeLCS67CGi9ErraGbW6n
 /V+b1ZPucvr1fVX9tcNtZWF0IYSLDTvcDSmYoEm8kL9P3eXzgKDnA3poZ
 xsiglXvh/NnSFF/Nw0h2JeGifygcd7cjdUqYbvihgRgdHDW27fKHxNb4z
 oKnp81E70otoJiBIW/0NwgvJ9R43EpAHEoXPgmNTUGhEHo2ZTkpnw165+ A==;
X-CSE-ConnectionGUID: eqri4Lo6TUyU1iCkWiUtyg==
X-CSE-MsgGUID: 9Vj6sUidRUy7hZMGUCjulw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22615427"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="22615427"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 10:04:24 -0700
X-CSE-ConnectionGUID: DByMezKwSa+nwzh04Kr6sQ==
X-CSE-MsgGUID: HmrmlNiHQqqlJJ1GOszlYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="29350565"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 10:04:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 10:04:23 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 10:04:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 10:04:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 10:04:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epqfoZLRfiCHfD3GmbGobQVhKDuUJN7DIDMmXAWHev4W0lpTHq+fxsJ3vNghkL9cDOkkRf6gGrDda80XiabjOL5/xQ/rxxzEvHloufjLRycEmoXoNKVnkX43Dc6ijJOWMTVT9morz6ATx7qZM/dtrgaNzO5moXmwdyy0C15yzhyVczZbqq0y6curC/UMoEAdIx9byRbnwcmKHvJy0HPuUIjNJFKEJWvwhQBZ12FCofYWFsGkB/i+a66cxaFm/MW7f80HZiwonVNdsyI7N0HubhQ99NZ/V8Po9psVIjCak4+/IIDhUZ5kxU6R3oEBRFKdWaeI8V6M7v9cqLRH/SY10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rC6ZdmSFTYUzdKY4pcileEJ/aW+m1+N90+SMN4W7NyU=;
 b=XalL/BIqn/jHoNBBRgb5g7ZaMcW1/kbKWWsUBEt9+p7GFj0wqOmVlFYX9KI1WRT6BrWyvPUK/6QXIHZYaGG4fZZCfE72dsusVpRrHKVUO8AqjtBLAbdBxonHNo4gISjuGxCmxCa4JY8g/rirpRgrxqzrghR8kTKb3oa8PO5XIixJ4di3I0gi9fs+Jm9rFHsq4Ro1ldAPhVEOEralzkXD1paqYmWF43aMGZ8zyk6PFh7NlpVh3le5P/894n41YbLVCVpJ196mJ613cRvFF2b9sv2Zsrd+/QVYRcia1pZOctwVUgh4FvnMsxUH2Vx1jAPHxsYT5/jeABJeMzKdcUaOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV3PR11MB8694.namprd11.prod.outlook.com (2603:10b6:408:21b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 17:04:21 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 17:04:21 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <171527122310.2038581.2879457245695725102@8e613ede5ea5>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
 <171527122310.2038581.2879457245695725102@8e613ede5ea5>
Subject: Re: =?utf-8?b?4pyX?= GitLab.Pipeline: warning for Add support for
 hook script
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <igt-dev@lists.freedesktop.org>
Date: Thu, 9 May 2024 14:04:15 -0300
Message-ID: <171527425512.5772.1654105508452706087@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV3PR11MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 4677ad2c-d870-4725-6c0d-08dc704a11c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjVtOGU0cWJQNytSbzJWVWkwUW04cjcvRkMxUS8wcHJNMlZaakluUGRzTE44?=
 =?utf-8?B?QnpQZ1N2U1ZtaHFvQzFxY1dUS1FIOFE0eFh3dmlMTHVKZHE0ak1wWWpwWk92?=
 =?utf-8?B?bk1aU3NRdUpZbzgrR2JwTGljZUtob2RnNlYwY0xPbXRIWkZlVExEbjRtTkhB?=
 =?utf-8?B?NWN2Z1lpcGt3VHFjYVRkdk9IMFBTTGQzSUdkalNZdEtBVmgrWm1ObGM0WFE1?=
 =?utf-8?B?UUN1dWx2OVpoT0hZcDRPMVFDelZ5S1Q3YTVBTTRGdEFGZUhNRnFlNEt6VkVF?=
 =?utf-8?B?M0F2WkhqYm1DYlpZbitYdTk5MkNuWkVHWjNJeVVLU0lNU0IwT0dzWWxJbXgr?=
 =?utf-8?B?WFREVytrY0NHaU4wekhxMjA5YU5IVkdzWFdrY3Mzc0FLTzVrcDRoZ2lkUGk5?=
 =?utf-8?B?Qm04ZlhUSkp0Z2xBL29YemhMREtlc3J2SE9HVTdha1dGd1Z5WmdoZFd2RXBK?=
 =?utf-8?B?ZlorenJYTm1GMGpLK0FpbG8yVUdOZkJaUzdURndDZ0NnbWtzVm9oWGh6OW9j?=
 =?utf-8?B?R0ZIM2pVbWt0bVlDK0RnYXNQZXZXSHFSSGJrTnBRUSsxYVNJSlJkWjVyUTBD?=
 =?utf-8?B?TkdINjZrVlFJL2dodmgwK0llZUhGQ1pGOVhSbjQ4TlRUSEJnU2F6YS9NeUZz?=
 =?utf-8?B?RXJ0T1dtZ09VTERIUVozbDUrMHhoWHB3ajZwU01lVmN6bFMwdStUemp1b1pw?=
 =?utf-8?B?WHFiVEVtOFRXdlYxQkNzdmo4dWdXNERrbjdRQW9DNnVzNW9KcFFFQnNwaGtE?=
 =?utf-8?B?RlJIN01ockk0ajhEM05ST09VV01aOUlPM2IyKzhIN1VWSG91bWVqN0RYcXJw?=
 =?utf-8?B?QjZpQjZqSkQ1ZFY4aTU2cklUbVFPbUFRbVphL21vclZudm8xVXFnVkdFbWh2?=
 =?utf-8?B?Q1NnSHNWVUF2a3pQWDZ5QXdONEhuVTlJODdoSXJLVC9mZU5nV3oyVklYZDVL?=
 =?utf-8?B?OHFQQktRZ2krckRHejFGRzE4azRMQnVWUzk5L25YU09iaW5seDI1MUlkS3dZ?=
 =?utf-8?B?MGJrdE9NRGllTDlYdU9SWUdiQVB6TnBiSThtOUMvRTErNEE5cDFWb05pcHFU?=
 =?utf-8?B?SjB1Sm8vVnlzNU5kcDJ5KzQ3WlZRZ0laYXovYzc2cWpQdTN1SDRUTThPSHh0?=
 =?utf-8?B?QXR3R2lvK2Q4QzRtRFE0Sml3TDgvNzZEZ2F4OEI0c0ZxT0VBQ1ZUNG1RK3BH?=
 =?utf-8?B?eTBSWHVGdGhwZ044MG9pYzZmdHdRMGppVTZ5ZDFod09reElHcFVxWHRBN1l6?=
 =?utf-8?B?U2QrVlZ3UnY4MjU3a3dzL1lQMU9JVlVGZEQ0cXlhcjhlcjdMVzBDcHdUcFYy?=
 =?utf-8?B?QVNLZWNvbFFtS1N5Uk82aHlucEduUW4rQXJmeHd1WFI5RlRRc2tBQXExbGVF?=
 =?utf-8?B?QUpvN083TmVLUDE4bFNrQ251WXZremFJMW1FS3NJOFRXbXhUS1JUVGRpelkw?=
 =?utf-8?B?QWYzUFdCQ1NEbHRiVEZ1bFNtYUhhOWtGeTMxTytxM1IvSHQ3Zi9TOVkxZWdK?=
 =?utf-8?B?WjFaSU1HRDlYaWpxSlc4d3RQQVRHQVZjMVpKSk5tQzgwZHNlMnZKK2piWmpU?=
 =?utf-8?B?N25BMytta0hKQVBtM2hLc2FOYm9IZzRaaWhVd242T0djbHRjZ0MyY2Izbldh?=
 =?utf-8?Q?9uuw+r6Tg2yYinN8YAWXpagYyKJGeyOU+SQdgBgNdd7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDhpUzJEUGdtbTdWak9SQTBsTXRBalFFaktHNkN1VXRTNjkrbE1DdmluTGRT?=
 =?utf-8?B?YTREbEJIU1FLYjZFdEJOVXhLd0Rsd2FnVWJkZDBlcUlYN2s1NzdVK1F5MWtH?=
 =?utf-8?B?S21UdzcwTzlDUEprNUFLYkc4aEY2bTFBNWRZcitpdkdhd1JNRXZEVCtmeUdW?=
 =?utf-8?B?ZHp1NHFlTzFXOCsyaXg3cEZTWEtHRDJyOTdRVlcxTVVKd1AyWHNRTSs5MnZX?=
 =?utf-8?B?bk1uenVmSFRjVnhDTkZGbEd6SWkwb3hRakxpY25aU0Y5djZibmRDU0c0MTFh?=
 =?utf-8?B?eUx3bk5weUgxY1pYVyt3SC9SVjdENGZyY1RwZ25uRkFpNnM3M0xEUmdIMkp2?=
 =?utf-8?B?SlNSaVBnOVYrRGlKTGFGbU1IOUpCa1pGU092KzRidWl0VWtGZXZrQWcyRlND?=
 =?utf-8?B?bWUrWi82aSswQm84a09Wb1E1YzFXYU9FQlhBelFWL3U3bUI1TEVKVFE3U1dZ?=
 =?utf-8?B?NGVRK2d6V0l5UmJyTGFDYW55REJCR1E2TFljOTNjWEExdkoyRkoxbXFZUjk5?=
 =?utf-8?B?YTZrUXQrb3I1YWVHYnRXZEJOSUVCakVReDl1c3JQV0JzRzdLNE5CVzNOUFE4?=
 =?utf-8?B?U3VWa2w5UmVBWHdud0VyOHNRbDVHaUQ1YXppUTh2NW5jUnErOWdOSTcxVVJS?=
 =?utf-8?B?UkpaTjBjN0tIczRpNk9UbkhrSk9LSk5xRUp6dzQ2YlRadkRjWlYxdWorbjBL?=
 =?utf-8?B?cXBFNzZSenVmWmxCUFEvN085cHRJdUZaS2Vad3VBNDZ1cy8zcWpoNjhNUnFG?=
 =?utf-8?B?RmFuZEhwRDBISFlxcUVQWndudXJWRERJdjNEbXU2UVc0QkxBNzl6ZmxmVlF0?=
 =?utf-8?B?YVVMVEpHREhhTGZ3V1d2VXE5WnBoQWUvRzhrTEU3ZzNvNXorWjB2OXJRakxn?=
 =?utf-8?B?dGZ6Um1GNFpvdDlwUjRlUW9jdHJ3MjAySUJORHR0K3JSd1ArdkRPdFI5SVBJ?=
 =?utf-8?B?SzgxZUhLS2dEUm1kRC9GWUNTOVlNazNXVTFHeTBzS2NlTXNodXJnOTVyQXU0?=
 =?utf-8?B?UmpEZEw0NmdpcG5OVjhhb3FWTkpGdEdwMzN4RXJGOU9OUTVTeUtnV0FNM0Vw?=
 =?utf-8?B?bW42N3U1UTFYTHlpOHdaQ2dZc3M2U04rSWhlSnNXTVAvM05qSFBXdVlyWTBs?=
 =?utf-8?B?enM2ei9HZlN1QUY0ZVBvSDJJdjVwSlo5YUNOeHN0akt0eEF4SzIxQW5JNEY0?=
 =?utf-8?B?cWdzSHF4MEsxejJ6TzFjelc5REtqMGgreHVTWjVwQU9LMTV0M2FvNTJ2KzQ5?=
 =?utf-8?B?KytYTEIzVzNNNXBsWlRZOU9HTUdUbi9saFk5L09rUllabXh4cjd4eWlTTEhP?=
 =?utf-8?B?VmhhcTJVOFBLc1hwMUJjdWtFSTdrcHlQbFl1L2FkNVJLRmQ1VXM5UkdRM2NC?=
 =?utf-8?B?NU8yWmZhTnZYWHpFM292UTRyU3NLb3ZINFhrbytXYmpKdWtSelpNUURTS1h0?=
 =?utf-8?B?MnBGMnZsMlBYVnU2MHZ3U1d3ZmNhSW8zMC9ZYkR1cHlIQ3k3eU9kS3Y4NXgv?=
 =?utf-8?B?QVN0RWxvTDBkOWt5eUpJUUZDYzQzUSt6ODNTMSszNnFsUmRzN0ZyeVJpUmVM?=
 =?utf-8?B?ODlmNjM0NmtmRmt6ZzljN2R6MEFMckpKQjRERXpVYmtDekJrcEh2Y0tTd1A0?=
 =?utf-8?B?b0EwTVp2Rlg3UmdHNk40ajdjdjB4ZVVXTDRlanNhbWo5NExJdEhvdWN1a1hQ?=
 =?utf-8?B?cTc4aURKU09pTXg5NGU4Q0ovWVpzenFzZTAvTU52MDRkNkhTUWxuditpNFcw?=
 =?utf-8?B?eHk2NEZkeUVaTXlraWpOaVVINklXcStvWXFhcnl6MXRDdmM5ekk2U25xV3FD?=
 =?utf-8?B?N1QyQVYrUEFvWkp3RVZESXJsWG5LSEtoU0pKNm1xaTAvUjI5d3RMSllEWnhZ?=
 =?utf-8?B?cVRNclU5UkwxQXBrTDIvSUxsZ0tOWDFHcWpPTDJRWnE3YmdVZ3FrbnBWNVl4?=
 =?utf-8?B?OGdzajJvQmFyL29FeUNNMWdERFVBRER0bjFRb25WZU12UTJHWHVtS3FuN2pI?=
 =?utf-8?B?bmtIYXFTWWpEU1dLUlBHbkU4SEVXaDFjMXpJNjQreVFlbm5UaGpTWFlyOC91?=
 =?utf-8?B?U0crNmRVY1U2WkdWWUdxTEpnUklGNUJ5RlppNmIrczB5RlNNYWRlV1FRR2hI?=
 =?utf-8?B?VW0vS1Nrb0NVQm55U3VzZy9wQzdJRHFpL0k1RlF0a1JqOUlrNDhVTEZQQ0JY?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4677ad2c-d870-4725-6c0d-08dc704a11c8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 17:04:21.0140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PH2Mkc8a2+KmowKZy/yinfRIK7c/92LCMN1oo6pxN1GHXbHsEbfJ+UlnFNrRcAAfKOpxwLKckR+u/+RyaYKaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8694
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

Quoting Patchwork (2024-05-09 13:13:43-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: Add support for hook script
>URL   : https://patchwork.freedesktop.org/series/133391/
>State : warning
>
>=3D=3D Summary =3D=3D
>
>Pipeline status: FAILED.
>
>see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1173738 =
for the overview.
>
>test:ninja-test-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/58540606):
>  26/30 lib i915_perf_data_alignment            OK       0.42 s=20
>  27/30 lib bad_subtest_type                    EXPECTEDFAIL 0.37 s=20
>  28/30 lib igt_no_subtest                      EXPECTEDFAIL 0.42 s=20
>  29/30 lib igt_simple_test_subtests            EXPECTEDFAIL 0.27 s=20
>  30/30 lib igt_timeout                         EXPECTEDFAIL 1.32 s=20
> =20
>  Ok:                   25
>  Expected Fail:         4
>  Fail:                  1
>  Unexpected Pass:       0
>  Skipped:               0
>  Timeout:               0
> =20
>  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.=
txt
>  section_end:1715270916:step_script
>  section_start:1715270916:cleanup_file_variables
>  Cleaning up project directory and file based variables
>  section_end:1715270917:cleanup_file_variables
>  ERROR: Job failed: exit code 1
>
>=3D=3D Logs =3D=3D
>
>For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/=
pipelines/1173738

Looking at the output on the page linked above, I see that the test I
introduced (igt_hook_integration) is failing but I passes locally for
me.

Is there any way I get more details on the failure to investigate? The
job output says:

    "Full log written to
    /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt"

, but I'm not sure if that is available somewhere for me to check.

--
Gustavo
