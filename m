Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42C7C83F26
	for <igt-dev@archiver.kernel.org>; Fri, 25 Jul 2025 11:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6913310E9D6;
	Fri, 25 Jul 2025 11:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tc2gL0OS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CD010E9D6
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jul 2025 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753441751; x=1784977751;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jWt8f5rh2l/Q6od40p99QhZZsDD68tt4Ls5pOpJ20yQ=;
 b=Tc2gL0OSTj8CJBHeDBb57zvAjoVzKrhGN0QvDYB4jckJAe28VICi25sg
 u1u+0CfUHLNVwR//OYhW3kju8CvioJolpx1lYQYDp/5KDChDK2wXGTisd
 CJVTbk3MzZmQimmuuY7oPdPhnT2Y1fNG439uPSXyS8OGvyec6kaVjR1pa
 gfWvqZmRvlonTxzWVXiRbD7cjl8WurPGKWSAR9GruSve/L78kfS7CCLKe
 x1IcltLFXfoGhpTy3Rlp6Ckzy4lnw095/Yf7gNEvSS+r/5CL7IWX2SPSf
 mxUIUh/P98Bu78zNeSs2RsKitgQlvcnNSdkx5yntTgw0P0cuGoUCT4vg+ g==;
X-CSE-ConnectionGUID: 6EZ4I01fRmqxXlRTW6QDJA==
X-CSE-MsgGUID: E/l2ev/5RK+aWJMTW+JvXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67212506"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="67212506"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 04:09:10 -0700
X-CSE-ConnectionGUID: h03NFe/mQxGU8yGGhwaI6g==
X-CSE-MsgGUID: FTKFHDwCTPeYrNzJkca+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="160585597"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 04:09:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 04:09:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 04:09:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.75)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 04:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIm7itwQypLD1T+skvehxgGr0HdxYv2ZzF+ll2YROD68heGYPs3+FfYv8uIAtkB2zuKZPQpA0F/qItiSvPi0K1UGDN7DnQk9OzIOrYMUo7lff70ZZQNLgbrBarvUOTJIDx01pcDkb260rX5TDx3Pm798fhWlDxhBkThIXfvwOzrwfmzUCtqMPxazsUV80VKKmUNvvEJCLjqWwkirs8cemwXqAJAg3JEPmLDful0Bg8391hIi1kz86ipEFxWiV6HBi/vRlF+nhj/9nRHG1jrqYm9+iWHUmiu7NPCCY2U5Ef88ZWiNPXL/L+hANZeXYHnmQam6Auh68oEoB14oLKz33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hy9zoAF+UYAnQP8tJtan2DiediG0CZ0l8Qcmpbdj6hI=;
 b=apps3PEKhzU6/yR7u7w0kk8QfkOPnyvuM8pYabxf0hfyKdSKuvhzhK87FCev663DPHnFYVWkIbHaRwePh6zp764gzeGjTbUY6gRnLxxPQH3AOR8epRY9x/6wvw9IQO4oAL+W7XLWvzAQ5RHzr3cn2Ui0hiFS6xgwPiPSB+8TNpvOgSLkfZve9ZcDEvWmsnrzlB65NaITsY8JrWVLPlaegHMrSHfAajn7+8RCz7i5piU5ws0hrklnXFXcZ2EwssyHsW5vyeNopmmiMA0Gp9Z0nLHqORkQNLdeVQLYRTOOZ2D0x47NfkrbZZhlHKd3r4ool3frc2OGfTOTQi+5T9MG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 MW4PR11MB6810.namprd11.prod.outlook.com (2603:10b6:303:207::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.23; Fri, 25 Jul 2025 11:09:07 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%3]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 11:09:07 +0000
Message-ID: <435e9a30-cc06-422e-a519-c948b661d984@intel.com>
Date: Fri, 25 Jul 2025 16:38:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 4/5] lib/igt_pm: Move check_dpms to igt_pm lib
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
References: <20250723055353.1137242-1-karthik.b.s@intel.com>
 <20250723055353.1137242-4-karthik.b.s@intel.com>
 <DM4PR11MB53099000D44AA53800050124DB59A@DM4PR11MB5309.namprd11.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <DM4PR11MB53099000D44AA53800050124DB59A@DM4PR11MB5309.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|MW4PR11MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d7c2d3-7803-4df6-36d8-08ddcb6bacc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTdzOFR3RnArUmM1Vm8rZnFQYzZEK0FsT09XU0d5a3FySy9GbExFWHJyOUVF?=
 =?utf-8?B?U2lqK3pRcTg2T2c1UVJzWFlLQjdLTUpFWVRvRlpXUEdac2daMHdXajgzZlN0?=
 =?utf-8?B?Q2dYOGhrSllqMytIbHpnVmo0cGJ0Y1VNNmFNWGg5WmNXWWZ2N0w5N1I5TGxN?=
 =?utf-8?B?b29UbFFHMjVWbFFxclAyclVPWUp6dzNzSVhBVndKTE9ML21leExQMHo0cXUv?=
 =?utf-8?B?VVN1NEpXTnVCYVBvKzliS25Ebk5oTElUK2ZZZTJNYlMrb2wxdmpSS0xmQnJP?=
 =?utf-8?B?TXJ4aWEzdDNwVUwxK084TXI4UVBEaVVjMVpkTmZGQnBTK3R1VkV2UUdtMVBx?=
 =?utf-8?B?elQvRWxqK1BEV3JQMEtOMUxNWFVuNE5DVWNjTGFSd1VIVW9iTXpwRStJd1Na?=
 =?utf-8?B?YlAwdFdNS3pqVmNqQXQ1TVdUUEFaOXplc0ZJcTVPdFdNbFRkcm5aeWUyU29r?=
 =?utf-8?B?UytmZTdSVzBPOVhFT3ZnVkNxSHJObnN0akU2SzJvVkV3Y0cvQkRObXpVUlhq?=
 =?utf-8?B?WTNYa09pUTRkMVBnaDd5QTc3SnE2c1B1c1QxWlZqb2l3ZnpRZU51bzNNREMy?=
 =?utf-8?B?VFEyb0FDQ1ZsRzErdXhKbEJzcDVGNkdsK3pHVzZXUU1Hc0NSWDJZYnMrbDlj?=
 =?utf-8?B?STFGU1ErQ2N4akRINDdTYXk2ZlVWdjl0WlZwN0xLZkhQcUc5TzFvd1lSVnVN?=
 =?utf-8?B?ZStvK0cyRitCVnBaaDkvVFRvUUVMS1BkeW5UUndqVi96ZjhMVkJhcXJzeDVu?=
 =?utf-8?B?T3o1ejJ0eWZxWERiMGlFWFpzODBxbkpPcUlITGFPUmJyUVlqL0hPcVlSTlUx?=
 =?utf-8?B?U0dVaUhRK0ZQSlZUeWpZSHk1Q3FnNlVKemh0N2ZaUGRnK0ZqM1pQZFJVZWNV?=
 =?utf-8?B?WVo1elJiRE5TSDhhS1RodXJYZ0l5ZndUUVBxN1N4emhNR3dRN203RHYwVXVZ?=
 =?utf-8?B?M3pUbjc5djhHQklTVStFWTdYV1FUemYyY0ZQK21iQnU3b0hQYS82SDlsMW9q?=
 =?utf-8?B?L2xkc3ZSb25GNlNjRjcrOFNGOGRhSGFwVzVETnNzdVA5clRTdEswSmFCUHJC?=
 =?utf-8?B?UGVSSEgwZDNHNHc5bkZtWVMrd1lFeVZVMjlPZU1uZVJUa3JrNWRORkhwdVdO?=
 =?utf-8?B?d0pCTUYwTm5TQ1hHdlZONmp0SEg4NmRlZnZNTmdIanhCNHhibmtiUjM4Qys1?=
 =?utf-8?B?ckFqNWUyckFMdFFpZERnSDFiRkFNdVFpemZHUnpVL1h1SEE1ZmlpcnVWSGps?=
 =?utf-8?B?Qk14enFtbGJaOE5NcDEwVEJXRTBxdnNCN2xDT3piNGhJSEdHdk85N3ZZNUhm?=
 =?utf-8?B?U2J6cStNc2VlS3ptUmdqbkxVd0JzYkVOanMzSVB1TVVFelFraEU3QngrOXA0?=
 =?utf-8?B?cWlFcHhSYk85NkpjbU5hM1BNM0ZrU25aa2FwQkxiV0Y5Tk1KMzZhSkxObjJw?=
 =?utf-8?B?c283VlUzWkdiaHlwbG9zSXJiNlBQVVgxSldORlpzSkRwMDFWVXg4UGFlM3B4?=
 =?utf-8?B?Tjhob1BMcUJSMlhhL256cjJ3Zi90ZTZDN1pDN0EzeTJteG1nZVUvOFBrc2tQ?=
 =?utf-8?B?RkE4MlFJcnB5UDZnVnRNMFp0M3hlanJqdDRRQUs0UmdSWVl2YWEwWVJyUEt0?=
 =?utf-8?B?ZnB2blpJbXVxVVNybUxwMmJxTi9UUUJNTXZ1NUdqMkxIQVhReWZDMGlJWG1s?=
 =?utf-8?B?aDBVSWVmaDVLZWdVckcvc1IrS0M3SjhIVHg0M2tnSVU2Z2hkY2FGM1UvQ0tM?=
 =?utf-8?B?QmI4c1ZBYTdldWpGUUFIQldCVmdUNk5aUXNVWXc3VTJXNDNiaVFsRDZIdTJa?=
 =?utf-8?B?OGFVTVo0cEU0TjlicTlzRDJ1a0x6bndZNDF1SjM3KzlBOWJIZkticEt1RWxD?=
 =?utf-8?B?U3Z4dU5TMDVnSkozU21UTFdRK0xrcy9DWkhzWlV6RHUwNVNoTC93TVZkcTYw?=
 =?utf-8?Q?sEH3RpmJKpQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHMvdG9jczU5WGVRUnVpSWFlVTgxdTlmczhrZlc4TVpNZXQ3QkYxS1Vyb1c2?=
 =?utf-8?B?YWpkOE4zUWtYZDNQRUdwVVBOUHBwNTREZm9GZE1wTk96ZTJtcTlOTEFFYzVV?=
 =?utf-8?B?TXg3M0l6RVE3OFNmRlRsZ0NUYnFYM2RIMS9ST0wwNXhmSmJzSXZCeXdzbXhW?=
 =?utf-8?B?ZkNYZm9mSllSZXR0eGhtcTMzR3ZlQmhiT2xtQ2ppZm5lcFZpSWZxN3pZd2Yy?=
 =?utf-8?B?d2xXMmRuYm1VVVE5MDdvelRVbHRQNDJiZlFEajZHYS9aREROMXpvVnRPdVg3?=
 =?utf-8?B?WnlEbndBTGZVZlZ0MVVFM01vcW5GVlVhTCtNRlRCbmlYRkRmZXd2azBLRnFi?=
 =?utf-8?B?OEt3TXdXVVZwRzdHR3o2NlFOU0tTZEI1NXgvaFpWZVRCck9tZnBsaDdCd253?=
 =?utf-8?B?Y0JCLzRGWWNMdUN0NmJsY1NpOWZlQWY1bHVmNldTcjFabTI1N2xGZUhYYWlo?=
 =?utf-8?B?VEdEYitvYTZPZFR5NG9SK0ZUVW54c0dTMnE0SVhBdlVUS1BwM0NVcVFWdEY4?=
 =?utf-8?B?SDM0NXI1MVFtNlNRR1R4Y1ROckRUbGV1bmtOZHpWUFZQa0NTTFh0UVVtMHdo?=
 =?utf-8?B?MGE2Vlc1Y0hFVTdhQUJ5aTFLaEt1L21vMGwzdmxCZkIyQXJ5aEMxc1ZDT2t4?=
 =?utf-8?B?ajVKK1hxSjE1dlBwOHF1Y2dDYnpwY2RHbElPbEx3cGcwY3VaTGVEeUJJem5t?=
 =?utf-8?B?amVtUGhnRVRJaC9mYmlXSjBxSlBjZXM3cVVNNFRKcGhRUEkxUTg3MGhONkdS?=
 =?utf-8?B?YVRjY3BPUFp4T1l6L2xORklhbklydjVkdjhkTVgyN3RXVHlDdFl3WnpVQVdK?=
 =?utf-8?B?SGw2UUVkSU9NTkVETVpPbXRPcFJJdi9pNy94RGtER0dnaG5yQkV1M3dxUGlH?=
 =?utf-8?B?NCtKdGE0RXpBckRUcWhGSUpGS1pmMVVpSkZIWUpLL2NqN2JKZmxESmQ2Q1Y5?=
 =?utf-8?B?T2IreU83dllsc3huK1d5SkFCekpmU3hVdjdBSkJZTGFsRTllRmQ2Nng1b1JZ?=
 =?utf-8?B?ak1nejgxV1FrV0dQdkFoYUIrTC9hZVFzNVA5c3ZUYzFBcXNJSGF4RHA3UFJw?=
 =?utf-8?B?dTBDaVBSMzBPMkpKSk5ielhNaGtWWkUwb1NaMGNqQTFkWjdudjBXUzdzOXk2?=
 =?utf-8?B?RXJZbHE1RWtDTGJmS21BM0wrUTFhVzdZSzVVdDZsMVE0NVhwM1AzVEZiaDkz?=
 =?utf-8?B?UkEzRGJtZ1l4SEc5ZTlZdzVKQVZhOVZjUDN1czI4N1JMejZ3ZjJHQi8wTTdP?=
 =?utf-8?B?WExSQTNqUzdkSm5QUmVkS204TDA0QkxqQi9qRW5PT3pBSjdVcWUyM2ZEdzl6?=
 =?utf-8?B?dEIrNEEramtvTGN6bnQ4SlVuYzFIYkZEZm5Gd1RmVzlyeENFMTNjWEdGbHJY?=
 =?utf-8?B?Ym9kUCtnUDM5dXNNODNpY2JXUWkvZ0ppN1paYit6ZTI5dHRURmxYRVFwWW1L?=
 =?utf-8?B?YXFkcVJsaXRoeWEra0tiV0paV0VUNmJ0cHB0SGdneEo2ZklWMVNLNFFaZE9X?=
 =?utf-8?B?WFJqNmRjN0l6WFUrbXVEbk9TY0wvMktCUDF2OTc4ZXlzeTYyd0VTVlppbmVO?=
 =?utf-8?B?TDlFdTBHZTlqOERhbm5Za1ZxelNXa3FmY3owOUlybTFIM01uUitYTmpRUm1R?=
 =?utf-8?B?bHd1Q3VJRVhtV0JtMm1BOFhTUzdxOWk4SXRNVkFuMmpnQktiZ3g0UWVlRjND?=
 =?utf-8?B?WDZQVnk3U1BXK3NLcFVtUmIvY0xlYkhETnRoUnYrcVBRbUplTERsSHpic3Iy?=
 =?utf-8?B?THp2Z1dkM3VveVZCQUdCcWMzaVVYbUNQZll1UFo3MnNaQU1xOXFEckQ4dVdJ?=
 =?utf-8?B?dy80SWFnLy9wTm1iZ3NMWnBPTDBBdm9YWC9kTjJHaC8ydWh3K2JIOGpjYlY3?=
 =?utf-8?B?cDczM3hZcGRSNXhQNE8rU0NwczRnQ2txK0FGdUdoc1R1TWhTVUt1bng2ZGlh?=
 =?utf-8?B?L0hST1AyczJZbDVuKzRRWCtXSWpCNnNlY3pNL2hKRjdac3hGa3pkQWhqSi95?=
 =?utf-8?B?ckQzbW1yWVNkbktja2NIWVQxMkJBaGlWek9TUElrdktkV1AzenhvOFM3cy9r?=
 =?utf-8?B?L0hLUmlieDV6MlJleG50WkhRVEcwcmtTc3hmMUZxZnZWMlBaeFAzQmQ0SGpK?=
 =?utf-8?B?OHQ2RWF0ckcwK3FncVpDNlE0WHdnMWFUNHZ5djUxZ0JtcUYxckRtSDV4d2JI?=
 =?utf-8?Q?V5j0lg1Hjum5aIpmqIDcKGI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d7c2d3-7803-4df6-36d8-08ddcb6bacc2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 11:09:07.8179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BpV+0WgXnBOVDRwiNbRq9GaDl8sdnPRZTo6yoV99eWq9tPRkULJT12WxSqi4oCpg4NoFcNmTb388o6PxdVY0QKlXqMf47GjSCPtbhRShTfmPpKrGySFVfXS0QygoAJc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6810
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

Hi Karthik,

On 25-07-2025 15:20, Reddy Guddati, Santhosh wrote:
> 
> 
> ------------------------------------------------------------------------
> *From:* B S, Karthik <karthik.b.s@intel.com>
> *Sent:* Wednesday, July 23, 2025 11:23 AM
> *To:* igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> *Cc:* Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; 
> Murthy, Arun R <arun.r.murthy@intel.com>; B, Jeevan 
> <jeevan.b@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> *Subject:* [PATCH i-g-t v3 4/5] lib/igt_pm: Move check_dpms to igt_pm lib
> The check_dpms function in kms_pm_backlight.c is moved to igt_pm lib
> to make it accessible to other subtests which need to perform a
> simple DPMS toggle.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_pm.c                   | 21 +++++++++++++++++++++
>   lib/igt_pm.h                   |  1 +
>   tests/intel/kms_pm_backlight.c | 20 ++------------------
>   3 files changed, 24 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 7f9cbd69a..cf1c442f8 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1487,3 +1487,24 @@ bool igt_has_pci_pm_capability(struct pci_device 
> *pci_dev)
> 
>           return (offset > 0);
>   }
> +
> +/**
> + * igt_pm_dpms_toggle:
> + * @output: igt output for which DPMS toggle has to be performed
> + *
> + * Toggles the DPMS state of output to OFF and then back ON.
> + */
> +void igt_pm_dpms_toggle(igt_output_t *output)
> +{
> +       igt_require(igt_setup_runtime_pm(output->display->drm_fd));
> +
> +       kmstest_set_connector_dpms(output->display->drm_fd,
> +                                  output->config.connector,
> +                                  DRM_MODE_DPMS_OFF);
> +       
> igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +
> +       kmstest_set_connector_dpms(output->display->drm_fd,
> +                                  output->config.connector,
> +                                  DRM_MODE_DPMS_ON);
> +       igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
> +}

LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>> 
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index c73972f2a..e931e51af 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -98,5 +98,6 @@ uint64_t igt_pm_get_runtime_active_time(struct 
> pci_device *pci_dev);
>   int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>   void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
>   bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
> +void igt_pm_dpms_toggle(igt_output_t *output);
> 
> LGTM,
> Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> 
>   #endif /* IGT_PM_H */
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 9b341c73a..a0ecf2b0e 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -142,22 +142,6 @@ static void test_fade(igt_backlight_context_t *context)
>           }
>   }
> 
> -static void
> -check_dpms(igt_output_t *output)
> -{
> -       igt_require(igt_setup_runtime_pm(output->display->drm_fd));
> -
> -       kmstest_set_connector_dpms(output->display->drm_fd,
> -                                  output->config.connector,
> -                                  DRM_MODE_DPMS_OFF);
> -       
> igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> -
> -       kmstest_set_connector_dpms(output->display->drm_fd,
> -                                  output->config.connector,
> -                                  DRM_MODE_DPMS_ON);
> -       igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
> -}
> -
>   static void check_dpms_cycle(igt_backlight_context_t *context)
>   {
>           int max, val_1, val_2;
> @@ -168,7 +152,7 @@ static void check_dpms_cycle(igt_backlight_context_t 
> *context)
>           igt_backlight_write(max / 2, "brightness", context);
>           igt_backlight_read(&val_1, "actual_brightness", context);
> 
> -       check_dpms(context->output);
> +       igt_pm_dpms_toggle(context->output);
> 
>           igt_backlight_read(&val_2, "actual_brightness", context);
>           igt_assert_eq(val_1, val_2);
> @@ -310,7 +294,7 @@ igt_main
>                                   test_setup(display, &contexts->output[j]);
> 
>                                   if (tests[i].flags == TEST_DPMS)
> -                                       check_dpms(contexts[j].output);
> +                                       
> igt_pm_dpms_toggle(contexts[j].output);
> 
>                                   if (tests[i].flags == TEST_SUSPEND)
>                                           check_suspend(contexts[j].output);
> --
> 2.43.0
> 

