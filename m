Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCF7CD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 09:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECB610F3AB;
	Fri, 12 Jun 2026 09:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gc2zWDR3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EB610F3AB
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781255626; x=1812791626;
 h=content-transfer-encoding:date:message-id:subject:from:
 to:cc:references:in-reply-to:mime-version;
 bh=PjeCJUwHPwXcog80vHJKa+T7T4mcpPOYmuKwHjshgmk=;
 b=gc2zWDR3BzICGak+rdig6GMuLML9Cy5WjA3WfN3PdtbK5VL5XpC3Fjsb
 dKBZgGGus9TgnJf+DqEBf3kQZI0fYqZ5FKPypjlspYc88L4J0CEpoXfI6
 6GwA5xSuSAM88Bb3VRHsEDSHCyZPPQYiH4RxfVCN28/JjXfVz4PYO/fsC
 BzbgJx2WmE7RnLvfbQblJ4eY9uVzA4WohopFduNKL0IM5c6DWyUaewa1i
 g5SuBXt86UKuZbmtAzTtPQsGqMz6HUUzWEUYSmemwe15CIWY9qRUkMG8S
 jiuLhaMYChH5c8/cACY3iNQEwWcnB6XtqVU+jit/NagyzTVZdEuow1Ic4 Q==;
X-CSE-ConnectionGUID: sBQOxIUFSluWqMux5NP2dA==
X-CSE-MsgGUID: 3rln/w3wRlGzHUd/R6Z4zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81990279"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="81990279"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 02:13:46 -0700
X-CSE-ConnectionGUID: ZAYi6oSDRfGSnyiCIGB8yQ==
X-CSE-MsgGUID: Pets06euSfiMsk+KvR/GNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="246641583"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 02:13:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 02:13:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 02:13:46 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 02:13:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjBcuvYbZ/KpKxLWWIuGRnGSobtf+dJVmrlmz4xSmU+dXM2lZ/x/+wOmuUTTtg5KgxSlZbrhKi+MhCysLMetQ1cyFwS8FXyWMw5utiqsq+bojOEGXsvGl+Tahr+QOTuHoXVDLHmVPXhItO11mYxCD08QU1MqHAN+AiiSvaKqpKxh+0pm4PNHqB/ArK6jrZ9h3Dse+ViQ/XQl7rNiVJ/pyS+g7COZUQhYgLVHU99pyWuPL7ptFTNsWhSlwJp7P9hIokRhoHBYWscnVMoRRs6cYOPD/lPJyWhUhbXCH3dz6gMWjm7pmiAEwG/PKP6nsfHG/P/PSZSckpY4w2oZkG7PBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ro+c/up+aX3h68bBNs9+7FhxPmwECVupqvO2jkdKMPY=;
 b=Ys0pPF/c8Hi8DW7nhe0eizViyPYoQlTPpAeJpX+BGQFiFZCD2RVydNJIhy3RRhjJpoxyGlnoH41e77tHxPUDc5D7QJSwQW9qZs989hGB3JUsbhv1PuKNcdyvyFz537htLDijN5UPHJZwGUObZT3dq1rWNQHu1JCRe+oGHH6wren2g7UnPgsMMJ3VPFZCUMzl8r1kQd19rBxtsc3IJdLlJKh66x5DHbskqaSXyxAaEzxn1VRkBVTqvNFpGnt9y9DvGW7oXW7a9orZ9z3lJH9DD0eKFXqhyWIiy9tn0MkNfmW0BTxqwa3hBy0SNJAdrXksfdd9/pFKUhV04B9nSf5cag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6908.namprd11.prod.outlook.com (2603:10b6:510:204::18)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 09:13:40 +0000
Received: from PH7PR11MB6908.namprd11.prod.outlook.com
 ([fe80::57ea:1533:ae98:7eed]) by PH7PR11MB6908.namprd11.prod.outlook.com
 ([fe80::57ea:1533:ae98:7eed%6]) with mapi id 15.21.0092.017; Fri, 12 Jun 2026
 09:13:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 12 Jun 2026 11:13:55 +0200
Message-ID: <DJ6YFAG2CJJ7.1MSFMPH8P7TSM@intel.com>
Subject: Re: [i-g-t v2] tests/intel/xe_madvise: Skip purge tests under low RAM
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <nishit.sharma@intel.com>, <pravalika.gurram@intel.com>,
 <kamil.konieczny@linux.intel.com>
X-Mailer: aerc 0.21.0
References: <20260612045035.1942635-1-arvind.yadav@intel.com>
In-Reply-To: <20260612045035.1942635-1-arvind.yadav@intel.com>
X-ClientProxiedBy: DU6P191CA0063.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::19) To PH7PR11MB6908.namprd11.prod.outlook.com
 (2603:10b6:510:204::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6908:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: efa78310-b676-4700-79be-08dec862e494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CqWeNdVoWsM65JX35uH4yzXq+eB48Vi6byU/JJDFfXfE+IC3vjv9ImR28bz3E6RmOYWruZZubr1UfppKoNdZuwWpZ5uzLhqYtHNqA2/8tKHTlLmbkrHx2oUUsEvg+NQ9C2XtIRHxkPzMJXgI8nCB11Djn97PQ1CZqPhaW5Q0qbNw2RkIDQxM3a7d3es3TtcqrbyS1Wh0Nw9K4oG0WqNAOylF13Ly1dr4Zpm9tV8derlm4/DxlPGMChSHS2fbwAW/2LZfa8/kMUDyz8BCuBRVr9Ak7iOJ0hufyPf6omft7fnuaToqo9GQlnQ/DnKnawqFhCE5FfbaC+sC91v/cdAYPHUt+v0pK569YN6kpLdwSOZKPVro0Rx6Wc0czFsZ2zm9FU12bt2yE5nWwjLNeeX8JlcUuLm/1+mgl7Qwp4sKKB+/bLro3qTzwuN6T2NehHzitq7TZK3DePe4nFc9dQcWlp+0VSDKQwhX7EwWs4pcuJwWOFnrKI1iTUWJmZ+29JMWGDfm5jLBQe8L0fsPizDkVe2PBvQQVc7W3NWYhnvmFrYYIw9WFAYFZb0mw+3FXfF/7qw7Y275kudS6xFTeUqiYVKAUyWTYoVhChOl840oTVf0jG7or1YHSy/WbkPw4weO5nwZt0v3mRPGQ2MattXfnflZulkhchZc4J46cpKN2jyR7Uo+Ab7qwJBipFQ4UE01
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnNsenpmK3dEY3lNVFFRSUpTbTNyYVFmNkM5ODQ0bjJoM0F2UEVOSU5yN1JL?=
 =?utf-8?B?cE5ycVk1d3RuS1N1VU1DNjRrdEc0VU5nU1QrUXZLT2hHam4vZDY2OWhtMVA0?=
 =?utf-8?B?cXBHNlRvYkYwVkprdndtc2pDMnFTdWdxSkJaL3YrTzZ4ODJjeEVmK25lc09D?=
 =?utf-8?B?N0tzdEI4WjRrTmFEZHROUEZ1RUNKNXg2YVJRYlhoaDRIOCt0THExajFSNjAy?=
 =?utf-8?B?UDUvbmpBSThzMTVrN2pMd2F3UFQrV1YwSThkdUF6NE5GUXRhZERoY2tvOHJX?=
 =?utf-8?B?THV0UXk2RnE5VEgrb0RHaU1zU2ZCcGxKZ3IxZDRWcXkrcG9YaW5XalIwUWhJ?=
 =?utf-8?B?a1FpUkpKSXdPRHpQcXlrU0t0OUpvcTZ0am5vNm8ranJFclpsOElqaloxWnhl?=
 =?utf-8?B?ejFDbGdiZkEyUjF3MjBYcGJCZ1h0T2JEaHFjb203eVFvWW0rV2VsTmtkWUtU?=
 =?utf-8?B?VHRMRnJkWVpNbzdZMVQxTG9MZHRYS3lUVStjR3BhblRpNWRCNW5TSWxFSnZm?=
 =?utf-8?B?NEVXcWZ1eGlQak5zWC85cWcyc0gvcm5TcXhYY2VCcXVieVM2K2lDY0dCcHJz?=
 =?utf-8?B?SlpTRkJnRkpNVzduT1FuZm91dFZ5dVBLQkFlbmRldEo3dC9hQXpWRUlYdnhk?=
 =?utf-8?B?QnIyNERUNHpOQlpMVDlKK3lDV1NaRmRLeTUrN3NwWFdvZCtYU2lXK2xiaG0r?=
 =?utf-8?B?eVJzZ09VVWZFbmF6REprNWpsaS9FK3FxM25iU0VZTDNFSGN4ZVRvbTVwNGpJ?=
 =?utf-8?B?REZVVkVXVTh4Z1c1MXBOZ0ZMMDVYV1d0dERoV2tBMXJlaU1TQitHTytZZlFF?=
 =?utf-8?B?cENzT3FSUi9ER3Vxa3hPcnF0clJhOTFpYk56bW5YbG5xclg1QTR3N2dvSmIr?=
 =?utf-8?B?NXZ6RE1SMExMZ0ZmMjI1WEQyblJTSmhyY1JQQTY3L1ZVclgzaGgzbjZ5Zis3?=
 =?utf-8?B?RUVVdllGcTZMREpsb1YvdUEyY2pYSjN4QnNxY2xpdHVpaWYxWFhVSWVlMVZ0?=
 =?utf-8?B?bmppRzZIRy9PVWZNZ21kbmxPb0ZGU2xJNStUcEhjakRoOHpTazlKQjhTUUQ0?=
 =?utf-8?B?L1NtdUJyZmJtWXIzcUFlcVRkT1RITG5Sb0p6RWwyTDRvSUVESk9FdWhLTG85?=
 =?utf-8?B?bzhBTVpuVnQzcUR2emdrTzRrUUMrRlFldU5yMnhyOFBWQUN0eEh1QWhsVXEy?=
 =?utf-8?B?NldWc0FvWXp3ODRjbXNUa3BhOVBsZXJrcTF0VkxnOGtVc3BhekxQNlBCTjlJ?=
 =?utf-8?B?YzRRUVZndkNtYVVUc01QTFZ2L2t5UmF5dWc5U2hUeDRSRkJPZy9nU2d2bk5G?=
 =?utf-8?B?TXB6SU5uMnZBbjRqZFMvVStaVFBYMXdqd3I1YVBPNkxMenEwaUw5U0gwSlll?=
 =?utf-8?B?NTE5T1FlSkp5c1BCY0FCN0NYbzRTN2dYN0haTDZ0UE83dlora1dDUVhFaFF4?=
 =?utf-8?B?YTNvekc2b2lNaHkvaWY2OHZRekE0ODVIYU5HYWVmRW1VcHpnMEcvQnVIQ0tH?=
 =?utf-8?B?MjhnK21VYUJ1cy8rc1ZTZlB4M1hlS080WnhTRitxeHBjVGVOUFRBZXhnZjZ4?=
 =?utf-8?B?elZkSzJNU0xiR2NuVEpyRjVncll3T2I0NkFZd3lSZjh0MzE4c2ZjZTRrVnJn?=
 =?utf-8?B?ajNLMWM4OHRlS3lQRHprM2lDUkRDWGNGRm5hMlZ3VkRFMk9seDdZalFjeGU5?=
 =?utf-8?B?WTFMaGp0ZHJzaDV3bEMrazVCWEljMXhpbmp5cjlJWHBWQUx0UG9DMDV6OGVR?=
 =?utf-8?B?Ti9HYVNoemVDNG90V2M5QlBibFZkdUdEemJEU0VCNjVudlZTZ1lFNmlINUNv?=
 =?utf-8?B?enBnQ0N1MGRmK1BuVXVBUG42T0RWa0YrUGYvZGxjdWM3bTZMUnZ1MzV3aXM5?=
 =?utf-8?B?anc3RVFmeVNvN0RtSUZJOXFNaGtrUjJuNkxxdjdscUhRalhtdFltOGFyY3Zj?=
 =?utf-8?B?Ly9rUkVvMks2aVh5MUhtWVdnWXgvemNJK2pWczdxY0JRZmJRbUZSbzRGYkxE?=
 =?utf-8?B?ajNrTmMzaDlpeVU0d0FPZHlEL3ZsVTNQQldqWU1QRjNsUXlXWm02RmNuZzRx?=
 =?utf-8?B?MEUra2hSczhsV3lQRWgyNHVTWE5QNzNwelIzOEFFTlFBTjEzVlJrbG5ON3Ex?=
 =?utf-8?B?WVBLZGZyWkZ0cmliSnF6TFpFSlduL3EwVTk0S09Zd09xZ2ZEMkh5QUM4TkE1?=
 =?utf-8?B?a2NMTFFRbERTbkxqSUJIcnk1blRURG5pWFRadThERHhNVlUwS2E2M1pmVVo4?=
 =?utf-8?B?Zy9FSFFlQlZpVXppNS8zSTV3TkVmMEVZM0FFbEJYc2Q3VG11bk1rUHZvbGtn?=
 =?utf-8?B?ZmQ1YVI4L0M3UEFhelNFMlQrUXcwSEF1TUNCUDRFREhxRUZJSHh2UUFBRkNj?=
 =?utf-8?Q?jMV50U9wTy/RTbDY=3D?=
X-Exchange-RoutingPolicyChecked: qaHjiWNI/D5kqaw9pkiLUdSDb2/BT8s6Cc1AEnuG/yfhj0is9+RM0whuNT8umg/uQM96DUxptqU03eiQGDbx5bV21Ds1AMusC+mRXa9bnD0IO+RQKVkzx5p98/Y96U3+kAzkMfNUmxl5bvosr9k0dUHc+mJsiLHWgc8/y51KFIcVp1k+M6DOrTAvZeQzKKWMDhzT3ImbzFMPsbIggLJsag7I8DoApOGECxyGbp3MYJpJSK7g1GA9lIqm6qKXDLkBC45xEhDL+Hvcj62J5tk35RjGSPSLZCl3cnaeDc4jY88HcFce0ulvuEm7ZBfDzY45xajey1H2FLQQtcUIVb6ylQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: efa78310-b676-4700-79be-08dec862e494
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 09:13:40.3105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bg1mZGU1gxRyV/sV+gkqPims+EVTWdgIZXtbmB2yfcTZyydpI+WTmNygMgZvhcph5o0WRrjPs8VcCitxElDubDhs5998qzJ/DbIt1snJP90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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

Hi Arvind,

On Fri Jun 12, 2026 at 6:50 AM CEST, Arvind Yadav wrote:
> The purge tests create memory pressure to trigger BO eviction. If the
> system is already low on RAM, this extra pressure can push the machine
> into OOM and kill the test before it can clean up.
>
> Check available RAM before starting the pressure allocation and skip when
> there is not enough memory.
>
> v2:
>   - Drop unrelated chunk/max_t() changes. (Kamil)
>   - Keep the original overpressure calculation. (Kamil)
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

