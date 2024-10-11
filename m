Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7730BCFD316
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 10:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2926710EAA5;
	Fri, 11 Oct 2024 10:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Li9JsVCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592E710EAA5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 10:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728641463; x=1760177463;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wIPxpKaUl9fSsDldfsKyDNQO9Kw8QAtBdH/mWDGbGWc=;
 b=Li9JsVCyPHYkjrImUFwbxLiwA2dmqGR4OUC+NVT9tJwy4vQXVqJPRdvt
 KW6HWr8q/4M+J9E+p4KvrFQzam8M/NLF8hTlQZoStXv7WfjXpqeOtmqYC
 o1SBEJsILoP9mVkmACj8h6PbniXS+b74SZ/jst/H40d0G/iZPvCo2avks
 dn0EMf0kSDiUyIByIJHyxgqKzhWAoeRC7EiEgomxNdfY9mBn6mgOO4eqT
 2SfOQQwyhHKxWJcU0edlhZqZZnSagwqWD4xwS6JUET35XGdsBkUmv6BR3
 6bTOsHZOTluKJDY7ZZsC9/fPSWup8WdxX3ezXkUAqT3LmEeO5e1AKk82E w==;
X-CSE-ConnectionGUID: cCY/tlLIRZ2LDniD9ALdIQ==
X-CSE-MsgGUID: qvH9/JjuRmabjWZGZsIrKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27846556"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="27846556"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 03:11:02 -0700
X-CSE-ConnectionGUID: klcNCFRxS1K9nQIkxDXL4Q==
X-CSE-MsgGUID: +3r9WdBRTACYi2fWfSQNNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="81385831"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 03:11:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 03:11:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 03:11:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 03:11:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 03:11:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHMWSI42IXy4pPaukXrK0XmEbRD3/0wJqmK8OL+D9yutpkVzOfukCkuKGaV2/Yby4TLxiIgX8xY4lo3Mm4ECSDj8/yRLIAaPU4F7zyecQsXGGcnUjSS0Q7riIQX3TavwNNZ9ADwrmha0TTM7y4i3mPziAO83YuMtq8mCtshUmPdHt8M0/kScP6ch+RPh+zkG9P1m6fxq5mwvDZ4vlc4xMdU7MfZ9sUt607ljf3kLzFcz5+Rva9a7IjDU+QEZQfsTJ80WQwkDmK8mkXT95K3EtT6e/JZvlqGNBvq76JCd49o92uoenXn7tR1NUnXIYI1jZltg1F0VTSPOhOGyYqXz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmHDnnK0F6F8NzsHTXAB2gf5jbPZl8SKmj/QuEeVv8U=;
 b=T9L8Wp5iepUdtARdwtIhEJx42ZYbOG0MOqfw8DK1buoCgOaDWbA5PVKQXElD+MTCfTcMPO8EsNVuORL1COPCuFmiwQy51zCrMbJPKgUxcXnzkncXHto0PPHZSvl+HAP7ysj2I5qd0SVZK+Li3TSVcBBxX+xpSQZPuf7IP63vDx1LvBnGo49eni4N8ua0usgpU0EMWYyvQQuknm30ti6/Qhsg3HnPZw9IFw3pJnCX24PPNqInKBlXOarFIVeHDyiFj95KR71yYHNo3y+wg14oPZNpkh/BgpIjg4GM6ZnmSnVuSeDw0mRN/CpD6ayoNlntwidJuZuFqPtUMPhjaKYjtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 10:10:58 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 10:10:57 +0000
Message-ID: <10caac74-98c8-4d38-b05d-2c917101fbc1@intel.com>
Date: Fri, 11 Oct 2024 12:10:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_tlb: Print tlb inval counts on
 failure
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241008202146.993745-1-nirmoy.das@intel.com>
 <20241011100306.eubqguiqm5pt4clb@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20241011100306.eubqguiqm5pt4clb@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ2PR11MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e94bba-6f2c-41d2-1c6e-08dce9dcff87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eG0vczdVenFZUFZsd2VicXVmNVJDY2JUMTgySHRadHJlRXY3SnZodWZ2cWNh?=
 =?utf-8?B?bk00SEYxT3llZDUwOXRxR2lBVlNodmVzZ1NWUW9Ha2Fnc240OFVmZzRlRXM5?=
 =?utf-8?B?eFgzSE5nM2lHRXNvZnEzSzNvYVVUL2JOVHRtKzBScFBnY0dYZTU3bzFLaGF6?=
 =?utf-8?B?aWRQK0I5K0RCNmM3NkRLc3pqbVh6bVBYTk9CdmlwSG5aZG5OU05FQ3UrTDZV?=
 =?utf-8?B?QWVVeE1vaDlid3BqOTR1UmdXalJpWG9SbkxjYnQ5b2UyNzJ0eVVNcjBKOWtM?=
 =?utf-8?B?QnZxbGwxSmVXb0xVOG42NU16WnJOU05leFRQeDRsOU5wbW52OXlPOUMzYlg1?=
 =?utf-8?B?c3RQbzMwb002dGdpc29rMnJyR2s2QWxtdmJDa25BK0FVV2ZVNm9ib1JjSVNh?=
 =?utf-8?B?cWVyMytBR2VrQ3NmUkw0MGsyRlhGdmJKcThERzNJN2JGYkhnUDVjL3VFMmpW?=
 =?utf-8?B?cE1kREJvYnpGelpVSk1LL0laR2RCOWRVdUZsK1g2YXQzdTJBMmcwUGxrYjZK?=
 =?utf-8?B?cmNjR1A1aXZMY0NFamdFUjRWcXFnYkN3S3VVR3NzdXlPTmwvclg1UC9VU0k1?=
 =?utf-8?B?d3hmaGF2SFhRU1BnSDNwK2FJQjR6RDF6QWJSN0o2dWFnSWFtaTdYM1IwZ0p4?=
 =?utf-8?B?V0U3aUUrUHFvMitTelJzcDdqOWVzY0FnUjZrV1NKb2tsODJ6YXptV3huU0Rq?=
 =?utf-8?B?cG1jRmxyV3dPZ1FseWo4WEF4RDNTaTVwVGxJNjcrMFJYMHQwaGZxVmxzbFBo?=
 =?utf-8?B?b2YwdmVkd3ArYkp0TEVERC8vQjFEbU5lQnNLRi95c1hXTDZnZkZGWURmU3FD?=
 =?utf-8?B?RHhLTHlOQ2ducGlSeHZwYTdUOWl2bFNQdmdseXlFK3MxYjJhcjQ0cVEvbDcv?=
 =?utf-8?B?K2pReGV5dTFibDlxTzdKckxTeVRQWmE2a1pqWmJkRVF3MDJScU1aYU1Cc3Q3?=
 =?utf-8?B?b0J1MFo0T1ZoeWQ0U0p1NmNWOUJ1c0xCWGszajV3VnVaTEZVVFFYYnJVZmdQ?=
 =?utf-8?B?azdEMU5mRFhOdW9NYlFKRzA0MVRITk1WcXNsc2pxRGlUTnowRVppOG9QV05D?=
 =?utf-8?B?UkdhUXdUMmhjN1p1Q28zUkY5R0tRQlR3aHIvMmhHSXV5OFlTdXRnOWJmU24z?=
 =?utf-8?B?TisraUMwemRDdzZVYXhHMWczRXZweW9jY1IyRTJGV1dXY21XS3N4RTIyWjk4?=
 =?utf-8?B?ZE51bjAyd00rQ3FGVmNpNThYTkRuMUMxWnNIaXpXL1E0V1c0bFhVaDhqanNU?=
 =?utf-8?B?RnNwd3lNZjJ4alBKZCtCZ2ZWQVRJYVFZTWpORGhBOWk3VFVYTnMrQzd3R21Z?=
 =?utf-8?B?UVRza04xM0VOaWNyOTVyUXFlTlZRN3pKckw4dndBeEVieTFzSE9aOFAzUVps?=
 =?utf-8?B?VnhXUFAxZ0ZlL1ZKd1FoNWI0bHhoRG5ueVN2NVl1aWs5SmR1OXNSRmtUZG1Q?=
 =?utf-8?B?bjJzbnd4RmdMSXorZENDbFJBRDRtMGwxZ1N1L3dDM1JERXlSM3lmMU8xVzl6?=
 =?utf-8?B?QmJxd3F2WVhnTXhNdWF4ZVk2YmhZWGpnSGNhWkt3ZVprS3EwWEFuc2dic1Vi?=
 =?utf-8?B?WjBYQmxOeWZtY2F6dzJLKy9iSGV4cVRqK3pLa2xRbHEvM0hpV04zS29zeTJI?=
 =?utf-8?B?L3o0TnJOcURFb2lRNFBPbHF3S0o4WWVIb2NQVXYwS0VYZVhwUHY5bTQ1ZXdS?=
 =?utf-8?B?L1Q4ODR1OWpUalIxM1B2SVFrOEdyMkw0L2Fld25CUDZhM1JOSWtYS3FBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXE0MGl1Z1BobC9PRDJseXJ4RHlPbUZMd21DMHN0OGh2N0ViWS9tZFBleE41?=
 =?utf-8?B?cjdBTGt2YTJVWEdkYkVJNXQ4NW8yVFFOd0JKQXY3cFQ2OENiTWs0K2pVTHJv?=
 =?utf-8?B?d0dZeVhSbnA4eFEwT0ZSRUVscUZiV1o5TVc1bWM1Mzg4eU5VbUNSeFVlRGF4?=
 =?utf-8?B?TFBYVy9vNkREQXg5WG5VK05oYXN3bUdieEtidXRkRHlsaXZKYlUrTjNOZ3Jy?=
 =?utf-8?B?RFFSUG0xRWtETWM2S0tLQkJvWmlXb1NKMUo3VWJaZERwRzhHOEJnZENXYUt0?=
 =?utf-8?B?aHBURXZ0ZEE4UCt0LzFKcFJ3M3ZvNmtyc3QzWUpVcmllMkRwN2RnMlZtWkxQ?=
 =?utf-8?B?NkdLS3NzWEl6R3dWU0c1Z1UrYno3cTl6N1Y4SFYrVE5GZWI2SEtLdEtLdzhD?=
 =?utf-8?B?WVkxQU84NFBUaCt5UEV0WEV0Rk1mWVJVMGQrM1M4MTlQOEt2azMvK2NMekVw?=
 =?utf-8?B?TEVHUWlwVFpsazBwNlNROFloZkZjUXY3ODBZRUNaNE9heHljMk9EOC9HOEZO?=
 =?utf-8?B?ZVRMSFN3bFB2L0F0TUMyVmY2UXRuL1JoKzJEYWltUjhaUmNTNGJGZFZrY0xs?=
 =?utf-8?B?SlZlbnVwSG52T01pMCtvWllmZEl4aDRyRlNtUlNxTlNOVkpvVHM3NnNDT1Y4?=
 =?utf-8?B?aVg2SmhqeDZTa2kyVFlEVllhQWRadVVybFNjanc3R0RESCtpRjFRcVRFWmVZ?=
 =?utf-8?B?enlNZUN1djd5WWI3NmhmN0JmN1VTVjd5bUlOeDc0Wm5vWlh2bHNKaitNd0Jz?=
 =?utf-8?B?L3ZQeVpRS1orTnAvcHFkdjhKWUliRWd3U2hzOFJPSFVZbU5uYmIrZXV5UFJR?=
 =?utf-8?B?bExlWW44ZTN5OUR0RDVsWm5uOUNSazJUN2ZhS0ZZMmFkM244MUNMNXdWQ0s2?=
 =?utf-8?B?WWJKQWg0NTBvZmU5VXhzUXhyNU5CODJLSEVVbVhGamVkK21KUm5LRkFEakd6?=
 =?utf-8?B?TXRPNU0wd1hNOGM5V21uTTNBYUpSMThWOThtTjNUbUMzWVFkVDBXUEkzZVpz?=
 =?utf-8?B?dWVyNTc5N01kcGcvTjFuandveHlCWG9vTnNFRHhqekViZ1FoVVR4R2Vxelgv?=
 =?utf-8?B?T0xrOC9UdGhCUk5SL0h3NXBqODk0L0FEbVBNWkREc0orZWJSR0cyNW96WHpv?=
 =?utf-8?B?blJuUjZtbVpnK2JraGc0Wkd0Q0gzZUdNamgxNVQ3bnhzMktNNUdKMUZ2S20y?=
 =?utf-8?B?UFFtQzU1OU5CWWdnTUx1Z3MySXhmRXNJTjdQa2N0SE1Oc0EySGVnZUhYKzRP?=
 =?utf-8?B?VlJ2aitnb1ZXY1N5bnhCd090SzFiS1ozOGNHOXhxb1EzVEJrdDd1dEtPUEpJ?=
 =?utf-8?B?Tm5HOFNJcDdqQzBWeWtiRWpSNExOUHlGWG40QkIzM04xaWg2cUdEWHQvNWpV?=
 =?utf-8?B?TWlTVVhxZm5FODdpaE1WZjkxU3BWZEI1RUU3VTNMVE1pZUQ5MStaN2ZkMXJp?=
 =?utf-8?B?WHYvbUx6M0ZTVnIzZUF6eHlYbWVBdy9yeExQcXhERVhnSHRqMzRGZkU2VWxx?=
 =?utf-8?B?NGVZL3NUL2xSMS9kVXdQZ1FNWVh6RGhLYlVGd0QzTDAyNjMrOG5DKzUyT1Bm?=
 =?utf-8?B?TUtVTGpUcWhyWVYwVThHc3ZXS1NlSHg0TXAyZWNMNnpzWHhJUUtCUENhVVkx?=
 =?utf-8?B?TWp6Mmg5MXRTWmppUlcvTEJMd24ycWZmZjF2MmF6UVBreUFFYnpkMHRWVFRu?=
 =?utf-8?B?dEJ1SUd1ZE1EakFFVGdZVXM5TThIcWpIeTgwK1p2OC9JMjdWelZuMXc3Umlk?=
 =?utf-8?B?ZUgyak1lYTZqWXJrdXNnanByNWxYL0NGLzdBKzNmNVZ2T2VqWld6L203MXEv?=
 =?utf-8?B?RTBlbXZoVWNwbncxblFDUGZSd0hZT0VqM2d2QmpMYlM5SUZLci93bGcySzF5?=
 =?utf-8?B?Q1VuZ1JCTEdza1AyMmd5bjdvallCelR1TGVNMGxBL0JVZ0dxZG44S1hOMmRt?=
 =?utf-8?B?bjltSlhlZFRzbVhtNDlTNWdoTFJ1Z29VVXlVakN5K0VQbDFSOGRyWlZxS3Na?=
 =?utf-8?B?SGUremN4dGxPY3JiaUxvbng4YmJLaDVkTldnazUyekIxMFFFa2p4YjVBVk56?=
 =?utf-8?B?em9RNWNDbTQreWdibWZlRFBua3JqMGZWYnF0WXVXVE9EOHhEMHQvNGF6bGg4?=
 =?utf-8?Q?2vE4UeeERGQcmxbFqgb5LRSHW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e94bba-6f2c-41d2-1c6e-08dce9dcff87
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 10:10:56.9980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIXcLPdCQLOIyoAEaUc5bM8BdHXuRI14dBVkSNKQWsyqQm48P1EuzNtQyubPMVgD7GYRh3xpJH7mcB1CI6M/rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
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

Hi Kamil,

On 10/11/2024 12:03 PM, Kamil Konieczny wrote:
> Hi Nirmoy,
> On 2024-10-08 at 22:21:46 +0200, Nirmoy Das wrote:
>> Print tlb inval counts on failure with igt_assert_lt_u64()
> Looks good as it prints them but why u64? Actual type is int.

My quick search didn't yield, igt_assert_lt(). This could be igt_assert_lt() I see it now in the header file.

Thanks for catching it.


Regards,

Nirmoy

>
> Regards,
> Kamil
>
>> Cc: kamil.konieczny@linux.intel.com
>> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  tests/intel/xe_tlb.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
>> index 8104e45d8..15d89931c 100644
>> --- a/tests/intel/xe_tlb.c
>> +++ b/tests/intel/xe_tlb.c
>> @@ -116,7 +116,7 @@ static void tlb_invalidation(int fd, struct drm_xe_engine_class_instance *eci)
>>  	tlb_pos = xe_gt_stats_get_count(fd, eci->gt_id, stat);
>>  	igt_assert_eq(data1->data, value1);
>>  	igt_assert_eq(data2->data, value2);
>> -	igt_assert(tlb_pos > tlb_pre);
>> +	igt_assert_lt_u64(tlb_pre, tlb_pos);
>>  
>>  	syncobj_destroy(fd, sync[0].handle);
>>  	syncobj_destroy(fd, syncobj);
>> -- 
>> 2.46.0
>>
