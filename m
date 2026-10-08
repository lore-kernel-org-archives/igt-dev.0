Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D128ECA600E
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 09:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7B310E03F;
	Thu,  8 Oct 2026 09:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHCk0V4Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C04E10E03F
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 09:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791451922; x=1822987922;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OkcpCtT0FEYNWt1kv1Z+ijs/c/ojtOUnoIV1c+91l8w=;
 b=YHCk0V4ZPwLf53++/3YtaP81pRPrJ0icMLHu95xWZOZKm/G+sATyvO66
 lfbu7ARzdnnecy+Ku27t8elHsLNZ5bXomIZRCBk53JLH7lxzAsgGjIrjD
 ucI8c3ppClh2n348TuVup3xwAmfvQVm2c8SvJin1CICQBauwMq1Fi0hOw
 i8ZtRwIqUsdutQNtOlgKKD+E8r3Wp3Cosb8n86HKTBSantoXx6hoBXFzL
 dVPDp01Rb0axORrvmQr7s/lu6pmVmGukBpZ+3hMB3cU0ITy2hR7Mzhwr3
 KDjoVUznMNxKdXXn0A4T/woGkPXNoY5BtsgiNUbqRXxwC1sSycRweIOEe w==;
X-CSE-ConnectionGUID: nx3akX9YRR+q3m9kA1m5rQ==
X-CSE-MsgGUID: ETGtrDrhSyGVF3WlOzCrBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="117820"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="117820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:32:01 -0700
X-CSE-ConnectionGUID: HbPUDDrPSM+bn6jn78TCZA==
X-CSE-MsgGUID: LgZafaxYSE2HZ5ak39eTtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1576"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:32:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:32:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 02:32:00 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:32:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqnaGdnE1wvAgFhLP6SnZfWXdjQZQWHg0eSfDwjQhnwQXDbfPHmeSq4bfOIXmaypvRag1hNS/Q08BwcnuD99XKfljYj3os/EjaBdY5Sa30k1kQPRAXCf/AvbfJRPR8qptknebK10GICHJX28y9rjTfTzC9Sr0jKdO1/Om6tbz3viI9bRljOnsDlRBP5JKp7+CSnrPyG2hQrsVQHtLjyCGJzJzh+KzVXo7Pl6H7SZJWR6nAAfmySFI0TpgDutZMErLZ+SkcrY8InVteEeGiMFjpkmwZHd4UMj/8mcOFmlNUayvlqskWNbF+XQG1m4H/4BRUYuQCELxlxgqmdqvF9csA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y21BltRLguVslfLTcNwROOMM5uhl99iV7sztYkwiADQ=;
 b=v3Be0CdUJqj7sFJo2JhkUd3n+X8imlQcXgjoAFneWIvgwF3COdikGVtO+h3G2Fp0Ek7h8DlZcWr5AkpXIu0bestnU9l5ZwCFX4SnyZVmYCBRhD6Nok7fxJLf3ZE+yd7ltJPUQmctyWO0NEUhCLB04NCt/3DKwLkiAHKth8K6s/nnzD42WZ2JKptYNoFhtMu+VyyTHe/uKXc1EEeolNwuMTGtVpzEfH4HKTjyG96iwqWRyILM12P8IUedWRO0jg5YwYwW/GfoB1chk0wO4CN1fVoXhAYnKhPpSk8a0uwuOIEzLGyLcPV2+5yFrP8P+ioZivb+NB+cefupo9GCIxuEVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA3PR11MB9463.namprd11.prod.outlook.com (2603:10b6:806:45e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 09:31:52 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 09:31:45 +0000
Message-ID: <979a754d-a8d7-4af6-b898-8224ccf1840c@intel.com>
Date: Thu, 8 Oct 2026 15:01:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_wedged: Add cold-reset wedge test
Content-Language: en-US
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>
References: <20261008085614.3801630-2-sk.anirban@intel.com>
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261008085614.3801630-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0340.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA3PR11MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d13793-84a8-410e-51e4-08df251ef83e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ln8YgdcXQCxyg3YanlwzW27Rn9KAkL/DW/RuRTpMknhN7Jq235R6V7Vw6YuB3M9PYUelY/EozBm272hrTijhR7KXujfzWGRla5EA4UfFzd/xL5lNNnDRXfXhIJA13zmC0tq9XPBwS99171NRIa24hvABtRsQS2L0LVlvdZv3qxLeDRf7530uc6ocSwuImxP7kbK67Hsjlb0jiERE0XLUIku2QlHr28Kax0xXTA1XxhycY4BcYT+s2WuL7zGnfqSqfeM8vyLNubs3alDThiyQ3yanIwNJ7EMxy6mkU247fITKu+EbzQgN6hpAydNZbounANV9hotpIaYnSlERD6pEAv9WqZlnV+EINDRw8seO52YwFtJO6Ai6C6wS39x9/lW7UWiZkF4sEq2xC0k2s1ZtblrpQ35+iDcNesY7RO6rEMz7su66ss2yATpG4T4Zk+NCPNCjsWsGXFFLowMRiY/UtNFkQ4jh2+ZMpjVzeyaRoP/0rrMlteVfgNL+LDuF2eEJw2uIzvnFlDtnCzeyCaVii+6Yuuj2+JbTy3uvNOfMSojwZoXKod282IwkGN9lanFCsAowX+ZSFFF9UMDI0aLJucwK7Ju3+AclqYF+sD4ycU8UTHoim2+71qWYCjc4bqEFl7qbuciQ08avQLnQyNtXeHKnLrVFZoMJLVyv8hV1En8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVcyWmhzSWFJMGYzU0JHVjBXb0xSSzliN2hKVVFieHZablYzWk1BZHd6dGhD?=
 =?utf-8?B?VG1iOUp6a2ZpdE1VYmFhaU9pNVBJYUxsbVozcGE4eVdONkx5WmNSWWR1NitC?=
 =?utf-8?B?ZmtyakxzU2ZBT0kvd1U4ZmZhemxiejFZeldmc3FyZ3BFaDJLWmkrQXVnam1i?=
 =?utf-8?B?UGt4eTlSU1dPYVduNFVOcDFZV3ArK3RlUzh3ckNEbzR2SmRKYWsxdk92QTJV?=
 =?utf-8?B?STJHaDBvR21laU0xOGx6UzdVdWJ1Mmk0cnl2ZndLK3F0dzU2dFUyeSt2T3pw?=
 =?utf-8?B?bXhsTzRIUFk0dWRnbFZNeUJ5VmpHTVRiSFdVYis1c3JSZDZ6Qzg0ajh0VStB?=
 =?utf-8?B?bDZkRUZDTWdHWVVLMTVTbjluUXRSQ2I0SmRNQjJUN0d6NVRPQUgxNlNpNm9I?=
 =?utf-8?B?YWlMWXlucmRyS0RwNXRCS1ZMNzVBVENGTkF2dGZvZUtYdkpNYWNGWGJqUjdZ?=
 =?utf-8?B?YS9leDQ2anFFL1p6QkdTN3RJeFgzbnJNRmEraGp5OUYyTFN6RTM2OS90YmVE?=
 =?utf-8?B?bnZUTlFSYWpIRWxqSDUrdGZ6SmhBYmIxaFl3NXMrMG5vQi9PeXMwZXpNL0dF?=
 =?utf-8?B?K3ZCbmp6bkhuUEx4SS8xM0R1OWtaY1E5TzFGb0pnWk9XUG0rQ0ZyQlJMcGQx?=
 =?utf-8?B?Nng3QzdxNjVUUDdtVGVtcUV6TVIyRGsrS3UwN1VLYnNneE1pbTFiMmR0SVVn?=
 =?utf-8?B?dysxVE5yY1F5RGdmTE96c0M1RWJ4N3k1U20ySlNLOTAzMG1mS1NZOUJaZHlN?=
 =?utf-8?B?ZWVmUTlkdzZGNnZOaVMzMzFnRlhxMXRpek5yd0ltVnhjbFNzVDZla0Y4SlBD?=
 =?utf-8?B?T3ZjK1hwa1FJMXkvNjNRc3pEZ05tSVJ5MkM5S2U4aTlqTDV5ZEs4NUFWQUxX?=
 =?utf-8?B?SGNLTkczbmhsQ2FMWmI4amxFYnRPL0lKRE1LZngrNytSUlhsemJrQkJ2TE9U?=
 =?utf-8?B?ZWVoSXB5RzlzQzV3VTFYc3Q0ODFxYXBFcTF1TUlwT1l2YmtIVUxodTdWcGpI?=
 =?utf-8?B?UHpPRkJtTHF6YjAwMjFmeUFaTlNoL29KZGZtVnkzVmRqL0NMMjJKREFYZWxV?=
 =?utf-8?B?WVNTL2hiWElwbU5UTjgreGVwcDV6K1UwM2daNldBN3VOYmZvaExJVytlamF6?=
 =?utf-8?B?MW9CZ1BnM3pPaFJVYmF1T2R4MHEyeVd1WVZkVlJZN3B0RHpnVnVsNVgyYkJs?=
 =?utf-8?B?RU9JS01CMkdQelByY3dRSnVaQkphMDRLeUVVVjRYSGRpYkVxbXllZER4b3Ax?=
 =?utf-8?B?UU50Q3Y1ZW5hcHkvQVVTWHV3NkJBbG0wOFNIWDloQmdlUFBIc1pwTFdFK0Jv?=
 =?utf-8?B?SjVUZndNMHIyYXJKNTR4a0taWk5uZUtRT0d5YUtRTWlHcVJxSkZXaVpvUzN2?=
 =?utf-8?B?Mk1xck5iT2RpUWhySzV0MWVzUEhIZENZZGlrRzFFdDZqMjdpZ1krWUthUVkx?=
 =?utf-8?B?cDM0SGMxNTd1QVgvbWJ4TzNYNmJmNGxpZ0FHajE0dVRJVG8yN0J5dEExNmpL?=
 =?utf-8?B?S01md01PK3paOVJxZXl6ekNOa1FRVUdtVGtWdWdmSW8rN1YxODYxcGNDZVpo?=
 =?utf-8?B?Z1crOGV0ODhubS85c29xWWFvTGJZYmhaZGxNcXFrbElGMG5tTG9xdi9hZW9n?=
 =?utf-8?B?ajVEbDlSMnhpaW51Ky8vYVBHUERPZmpiVnJOa21XSFl4eGE4TXhzdDRGZGQ2?=
 =?utf-8?B?SldnQnpvTnBLeDhXRXNXeFltdFUxZnZvMDBFSHVXbEhBekNyR25oRmpERzFM?=
 =?utf-8?B?cDl0TFh6cFJwa1dRSmlhejh0YWxLNDJWQU5NUzREZXphZkp5V1czaE9abkVh?=
 =?utf-8?B?c2RjTS9JL3FoajFkTC8xUEY0eGJPa0NTM3NRcjk5OFRCQXlUVTh3dmlxZlZJ?=
 =?utf-8?B?cVRxZHNvalhPaHpPaGlGUmRHcGFEenBxSFc4S3BWTWs1ZDBZNVdFdFk4WmZW?=
 =?utf-8?B?akpzM1QwWXdPSTJFcXdUMU1WZGY0T1A0N2EwVVluVzZRYnV4cmhqcU5oekRC?=
 =?utf-8?B?clF4ZTN1M0N5RU5DZVlveEMzUk9vb1FwblNtNEdPWEV5NE1NTVoyNWgrMzVV?=
 =?utf-8?B?ak5qVVVqWFIrcVR3UDdOdzBtUnd0bXZqYm1NZXNDNDRPeGNUYkhuLzV1QjBE?=
 =?utf-8?B?cGJCalRPQ0M5Rm9SR2h4UW1qVkxEcHFZbU9mNDJvbWxnK0R0ZEFGL3k5WWda?=
 =?utf-8?B?eDluT216ZDhMTHpIZmYwZlJuekNIV1hMUWk0dS9KVmlBdm16Y21tUTRDVVdv?=
 =?utf-8?B?bE9zc29MaVZNOUdybk9WcEhxVUt5KzdZMnRZdkJtamVkRVgreHFEWUl2cjhk?=
 =?utf-8?B?RjZvNG8xcXJUblN1b2VweTFpcDd4VTE1VUp5Qmh1cUpjV3dITDhIWDJhdVRy?=
 =?utf-8?Q?fVb+WMKnJXUQgseg=3D?=
X-Exchange-RoutingPolicyChecked: DINHII90L33GNw1kN1+CvVm0g7JRKhXBf1ybYswHjj4ElhcQM2NcJCmfgbXjkN+g3DbWCID9pTVyaR3AdrRv6TcHtJic6kH+/IK5tpztx2eL7V6yfAAQsfCAe8fNYk7jw+cc5w7TiIT8oH9onCfNhht2Ec7WmXqzGdVd6Bck+yPwECJDhZmqylawOFd96gq/DjKVZdiH3TkHaxzMRCtdGwBy91gghFk/8tpnPDGY3AXOVady2MZ7dESeRkTd5lcDMl76v5rPYTrj9hDdsqNngrOGfkcIuqHbd5nhRkMZYZZ2ZMj9f8c4Op1/tG/irYjBcC3MJKW8saCfeETlIdnZhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d13793-84a8-410e-51e4-08df251ef83e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:31:45.8000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvjAXcbGDDqpgez37enyA3bLVvsW3ryhRiM8c61aJI/LySGlbTnHmZgmoocUUHB3Mr0F6mSsx+iKqEW+7jcMzAUR7GjwYHH7YZUtCKJ5QsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9463
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


On 08-10-2026 02:26 pm, Sk Anirban wrote:
> Inject a cold-reset failure
hmm, is failure required here?
>   at probe, validate the WEDGED=cold-reset
> notification, and verify the device is functional after driver
> recovery/rebinding.
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_wedged.c | 118 ++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 112 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 8c3c8bd36..6bfbbb02a 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -14,6 +14,8 @@
>   
>   #include <limits.h>
>   #include <dirent.h>
> +#include <libudev.h>
> +#include <poll.h>
>   
>   #include "igt.h"
>   #include "igt_device.h"
> @@ -28,6 +30,23 @@
>   #include "xe/xe_query.h"
>   #include "xe/xe_spin.h"
>   
> +static char pci_slot[NAME_MAX];
> +
> +static void cold_reset_restore(int sig)
> +{
> +	char path[PATH_MAX];
> +	int dir;
> +
> +	snprintf(path, sizeof(path), "/sys/kernel/debug/dri/%s", pci_slot);
> +	dir = open(path, O_RDONLY);
> +	if (dir >= 0) {
> +		igt_sysfs_write(dir, "wedge_cold_reset/probability", "0", 1);
hmm, update time as well right?
> +		close(dir);
> +	}
> +
> +	igt_kmod_rebind("xe", pci_slot);
> +}
> +
>   static void ignore_wedged_in_dmesg(void)
>   {
>   	/*
> @@ -51,7 +70,13 @@ static void ignore_wedged_in_dmesg(void)
>   				    "|EngineInstance: [0-9]+"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error \\[[0-9]+\\]:"
> -				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+");
> +				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+"
> +				    "|\\[RAS\\]: cold-reset wedge injected"
> +				    "|GT[0-9]+: GuC CT communication channel stopped"
> +				    "|device wedged, needs recovery"
> +				    "|IOCTLs and executions are now blocked"
> +				    "|SIGID=[0-9]+ .*GT: reset failed"
> +				    "|SIGID=102");
>   }
>   
>   static void force_wedged(int fd)
> @@ -63,6 +88,60 @@ static void force_wedged(int fd)
>   	sleep(1);
>   }
>   
> +static void wait_for_wedged_uevent(struct udev_monitor *mon)
> +{
> +	struct udev_device *dev;
> +	const char *prop_val;
> +	const char *dev_path;
> +	struct pollfd poll_fd = {
> +		.fd = udev_monitor_get_fd(mon),
> +		.events = POLLIN
> +	};
> +	bool event_received = false;
> +	int timeout_secs = 30;
> +
> +	igt_until_timeout(timeout_secs) {
> +		if (poll(&poll_fd, 1, 1000) <= 0)
> +			continue;
> +
> +		dev = udev_monitor_receive_device(mon);
> +		if (!dev)
> +			continue;
> +
> +		prop_val = udev_device_get_property_value(dev, "WEDGED");
> +		dev_path = udev_device_get_property_value(dev, "DEVPATH");
> +
> +		if (prop_val && !strcmp(prop_val, "cold-reset")) {
> +			event_received = true;
> +			igt_assert_f(dev_path && strstr(dev_path, pci_slot),
> +				     "Expected bus address '%s' to be part of DEVPATH '%s'",
> +				     pci_slot, dev_path);
> +			udev_device_unref(dev);
> +			break;
> +		}
> +
> +		udev_device_unref(dev);
> +	}
> +
> +	igt_cleanup_uevents(mon);
> +
> +	igt_assert_f(event_received,
> +		     "Timeout waiting for cold-resetwedged event after %d seconds",
nit: cold-reset-wedged
> +		     timeout_secs);
> +}
> +
> +static void test_spinner_after_recovery(int fd)
> +{
> +	uint64_t ahnd;
> +	igt_spin_t *spin;
> +
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin = igt_spin_new(fd, .ahnd = ahnd);
> +
> +	igt_spin_free(fd, spin);
> +	put_ahnd(ahnd);
> +}
> +
>   static int simple_ioctl(int fd)
>   {
>   	int ret;
> @@ -225,11 +304,14 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>    * SUBTEST: basic-wedged-read
>    * Description: Read wedged_mode debugfs
>    */
> +/**
> + * SUBTEST: cold-reset-wedged
> + * Description: Inject a cold reset wedge and validate cold-reset uevent
> + */
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
>   	int fd;
> -	char pci_slot[NAME_MAX];
>   
>   	igt_fixture() {
>   		fd = drm_open_driver(DRIVER_XE);
> @@ -326,11 +408,35 @@ int igt_main()
>   		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
>   	}
>   
> +	igt_subtest_f("cold-reset-wedged") {
> +		struct udev_monitor *mon;
> +
> +		igt_require(igt_debugfs_exists(fd, "wedge_cold_reset/probability",
> +					       O_RDWR));
> +		igt_install_exit_handler(cold_reset_restore);
> +
> +		igt_debugfs_write(fd, "wedge_cold_reset/probability", "100");
> +		igt_debugfs_write(fd, "wedge_cold_reset/times", "1");
> +
> +		ignore_wedged_in_dmesg();
> +		mon = igt_watch_uevents();
> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
> +		wait_for_wedged_uevent(mon);
> +		igt_kmod_rebind("xe", pci_slot);
> +		fd = drm_open_driver(DRIVER_XE);
> +		test_spinner_after_recovery(fd);
> +	}
> +
>   	igt_fixture() {
> -		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
> -			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
> -			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
> -		}
> +			if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
> +				igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
> +				igt_debugfs_write(fd, "fail_gt_reset/times", "1");
> +			}
> +
Duplicate code, why?
> +			if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR))
> +				igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
>   
>   		/* Tests might have failed, force a rebind before exiting */
>   		drm_close_driver(fd);
