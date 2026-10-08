Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3796BCA600C
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 18:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA28810E91F;
	Thu,  8 Oct 2026 18:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBQTkB7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61D410E91F
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 18:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791485819; x=1823021819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8MzKcC8REvSOIiEMPhWZtkq51aRaBi+7d2jcktOXBlw=;
 b=dBQTkB7qrEPHhxWCjExE6kdaIz9qnbSlda4osOHXY7o4MqUv6UX85P06
 QoKbG5IKLMpptz/Lta+PZPCFksZRMD7urZ0Ow0Zm+LPiLUCvm4dMYAy64
 9Buw+PRWxJJWg887fQu8ESkh4WRLgbi5w2uOWJkuhntSkiNZqnOKDZ1ea
 BGTGRtWE5FLX9p7DBpnFZDJVk9NKZQZaPWQZK2Sa7ZCO4E2ZN3tf/7dru
 n1eWI9PUcRfCvZ8NpxvkBARG1XlBJQFnyKflVAThQ5iQTW3c+Lia3yKkV
 nIqXn6TAytKu4PxJhUJTFeMFJ+A7j38cuJD4X0uAoT5YySZzyEKmoSsRn w==;
X-CSE-ConnectionGUID: 8F2QXJXzR0mOOJ00bTfxhw==
X-CSE-MsgGUID: Qys3ePDSTKKP7T4JCE6aDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="271782"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="271782"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 11:56:58 -0700
X-CSE-ConnectionGUID: rgIB+2wjTuWX28cL6LMB2Q==
X-CSE-MsgGUID: aa2VXxirScySaaSn1mawpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="119023"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 11:56:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 11:56:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 11:56:57 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 11:56:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCRxHVLcyz4BuRHOvm+l2vLA6JYko6irJo13nLiZDUECaamgeqUdREMl3kEN4uCwcyPGJgyhRyvDHVEZC8aoL8vlGlg35Ey+pmM5Txxw5698hxo9Aohp7OBAtu+xDYbACULRqmr6onJDTYO5/UvSIV3PSuU3BzGQlPv1UveeVeOOd1f6Zv4r/pgT2HlX+AMZtkH8O/XO8mctFumCkHHK/ghJmzIMA/JRzqm9TquDw7TuBvYy2Bb14envaCCxQxJWm6vf22TxBBe5CA3BcUQEoBZ22iavzotm1384E41vBh+SkUTeVyZlZ4xunsQBKCn5FgUNBEYHufAm+jDng+4H4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPk72cja2sdocx44rjGX9sLd0Z98yeH+gSyUIwGYVPY=;
 b=cU7v9vZg2XIKz9PuPcugN9f/jdxVj1jjQnmAjrHzLQusFDDH2KpD4BmygwHed36G6aZTCL44CiV+M6JB04kdfKBe6lTzOrqjMjrxRiuwwrnRqVKbRFo2TvYX7JuJO+PfhYd2Y6E4YSA1GKMFs520OPkzA7L5/hLxhqFYXy4J8zmP+tEcDQ6owFQLP36GJKWmK7RCdJH+TNzk6XwUrle2cNZ996wld+XBufm1MnBFvlNRKIOBejTDarq0gKJsngZ5EmBYEELt5jjZ+HzR1JuRUebkGJpjXSoUnXoc2qQtnaHAJnaiCc3/PtjVQxwKX9RajPhCoZQ8oU1BR1AAY6XsEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by SJ5PPF6E07EBAE7.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::832) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 18:56:55 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f%2]) with mapi id 15.21.0451.026; Thu, 8 Oct 2026
 18:56:55 +0000
Date: Thu, 8 Oct 2026 11:56:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3] tools/xe-perf-recorder: Wait for
 mmio-trigger-report
Message-ID: <asfndT6wfjNpNTXv@soc-5CG1426VCC.clients.intel.com>
References: <20261007054409.3694489-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261007054409.3694489-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: MW4PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:303:16d::28) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|SJ5PPF6E07EBAE7:EE_
X-MS-Office365-Filtering-Correlation-Id: 348b64bc-23e6-4014-a495-08df256dec1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|260925021311599003|260925021911599003|260925022911599003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: P52hLiZNP93DLJDJvaxW/acAf7onwuTRqLaYmc/HNy3CJK17325J+ks6hyLHpORRhNxijPZ7j4HlrY65LzaJlghoB4tTrqOwC9C3JIrhZ/zliXq15lhs7/k593kW7EQTVFdRVzg9/P2K/FcD9yKT69BcDTo6gd7jaEQJOw/YA9m9oRbG2U6CBud3KPGBJtHjwYz2aplnXm2gdMThsepABHJx9lXWL5lCmX4c6Nay8HpaTCiqfgmb8iu2dgVoB61S85LWuV34mBPk/RQD47ktsU71rR/R5SEtMoAiY7dDh2r8uXTo1vPk9yT5pu93AHTZCq+GCh57wRiboaV0nFVTDqLlxfehomKQK4JF9lRkOib8FGRawKnuFvytfKfV5OqakvSVTI+LLecClRSOcEEyihSwnjehIBlym8YCQ8XCXVg8sM9qJaAfJMP0sFZqKOxHpKCGURNL4L6iZw8aBJ1YL6Wy8Crbdvb/iwXonlSV8AfyeQMdTw1gfHvce/F7tTK5UcKlQLRaIaOCtQG38yN9kJ4Qq5lOZQFVqn564kRa2nFz58BMHE2B5ZBYN0BrrT9dYdTqhI03CekYk1fGQJf+Ab02Tatb4k3xw29LEQr38dK7+bmOM8gU3QymBtXQmQhHbeLUJl/oJ4TNKgzNujlA0ABoC5KNuAlf4yjX3rrO0LI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bitXYWdIaGlTcHd2TzlUWEVCVlV3SzA1UDJiU1RrNlZvek11dnorU1R6NWJ5?=
 =?utf-8?B?aW5sUlJyV1phRUU4eTM0eGJVcU5LNzVvTGx6N2RyeDFlanBxTkxKMU9WV1RH?=
 =?utf-8?B?MjNSdmV2S3ZDNlZtZFR5bDk1TFFWejJIclk2b1VNRUxXRmpnZWpNT2RFTVZp?=
 =?utf-8?B?UXl6QUw3NldOSXZUTjR6QVVmcVMwM0FuRldGMlVEeHZaQ01VY2diNFN3Y1c4?=
 =?utf-8?B?U016TkYwOFpjVGpldUZ0cVlkSzg3SCs2ckZjVFQ3WlFwNGw5YUg5Mzh4OWdE?=
 =?utf-8?B?b2xMVWJUb0R1cUIrNmJQNm9BZkxYNi9CVExYVlREM2pBQ1NVRGpGamZxWWE2?=
 =?utf-8?B?dlNqa0pSTzBFNUU5QTUyQms1L202SlRkWU9pZW9QOGpWZUxENUdaRXl5ZzdU?=
 =?utf-8?B?dVZIcnVtVkJUdEdhNjVmSC9nYWtHQ2NEQ3V4dUtQSk11aCtZM2FMckFUTmNa?=
 =?utf-8?B?Skc4V0lKY245OXE2NStBTXVmSGt1c0MwbTErd25EZW5iV3pwb0pSK2RRQ2hE?=
 =?utf-8?B?cVZVSENOOHZsZmsraVZqb1JFTnM3ckxaYUI5Z1pZRWtPOFdJYkR0T0NOQVU1?=
 =?utf-8?B?NEUvM0RSS3hvTmpWdk1NK2FabEtkeXh4VkcxbEszcEZNMUxlUGFuWDc4R0ZE?=
 =?utf-8?B?WXdFaEtHWXhTOENtcHhVVzRDeFpJYjFkOFZSak1tbW5VYTFiUU1wUkJ2MUxF?=
 =?utf-8?B?dWNuWEorOGRHSDUwY3p6ZFY5NkI1dzVnR2c2c0RJdXYwQWtGT2tYM2F0RzMz?=
 =?utf-8?B?WVY1ckw3WWQyWU9QTXN5Vm5tUWVPaEpCd0w5VG9sK3IvQVZNZHRmb1lmRDJt?=
 =?utf-8?B?R285K3NWdG1ZdGJNKzBFcHdZODIyNklzY0JuNmxNNTlwc0tXTlAxOEdnNWhh?=
 =?utf-8?B?R0lFcWJKcVhxVzJHMEpHL1RvbDE1SVNlQ1AxWTZmVmUvdEN0SHNIa2dLMGJ4?=
 =?utf-8?B?WXlFSitLemtwa1VITkwrUXVGaXJkYkdkRUtxdTl6QWU0VW1qc2lOY2tZeEhr?=
 =?utf-8?B?d2tGRnROQ3YxMW80V2hqSnl4RnNQWmxQZTB0cUx3Z3A2M0VvRlprd0NJQ1hq?=
 =?utf-8?B?eTZtdGhkb2dzMURVQjJUQnMwaEdaTFlJU2owZ004azl0SDF0QXVuRGJjYVFB?=
 =?utf-8?B?WHYrSkdMSHhSbzRlenBPN2lrWUwzWHVYeU96ZUxvWWlFL01la1hCaEZzeTlP?=
 =?utf-8?B?RTRXMml0QjAzbGVSSDFJU1d3RjNhOTZ6ZkNPenZMVEZrS25xallFNlhMWUVE?=
 =?utf-8?B?UHlseGNyeE1JeTAxVUxjekV0Nk82NzNySHB0WERiZlNqZHp0Y0JlRWh4UVRK?=
 =?utf-8?B?SEdUdGpzK3lkeGR4NiszSTc3VG5HZlBReVpTbW5mZzhpMXAzOEI3RXRkZUcz?=
 =?utf-8?B?bTI3bXVXWUYzVzNJY2dINk9URWFlNEhUaHd0TzV5c21hUGg0N25tTDhRdlZa?=
 =?utf-8?B?ZG5zUjkvRlJNK1ZPZ0VDWWxXQ21nQi9VMkRNWitJcDgyL3VDOWI5cHV6ZlB0?=
 =?utf-8?B?eXRFYlg4c3N0YlZhVnJmdDg1NnVLZHM2czBRSGRPbzlDN2xKQ1hlNkN4UWpQ?=
 =?utf-8?B?OXAwWnFYMTdkeHVWdHovWDloRTJ6Tm5Kc04rN0I1aG55MmtRb05YbllJblYy?=
 =?utf-8?B?MDBzK1UzUGlHVEJFd251YllRaFN3bGpQaEQ3b080L2pBV3hsVStIZ0Q2YUZT?=
 =?utf-8?B?QXhSTzRWNkFhek5IQ0JLWFRnMXI4MVNWSXo0Q1JpSDNBL0FFc1RkcDJtTGFI?=
 =?utf-8?B?UTZYaDJKUUQ3ZmhoWmRBSEtZNWUxSU1yTmhjdkF5dzVncGR6bElpZ3JpQ09p?=
 =?utf-8?B?UTVTeWFtTUZOeDJZWnJCeFU5b0w0a2tHVHRIK2RUVVJ2S29YbjBmMXdkMWZW?=
 =?utf-8?B?cy83b2dWU1IyY0VvVDczTkNkWTI2THlCeGJ0anJUTUNJb0IxRTRwVTZFQ1I1?=
 =?utf-8?B?MGxLTThNM2hxWU1kazIwdjFTSGdTMUgwRllITjlvM1VCZEcyQk8vQXA0cHBM?=
 =?utf-8?B?cTdmNytFMWU3WnR0MVppSGdoRHJnTXd3OEt0UC9pWmhPaDNXUDhLdEh6RmY5?=
 =?utf-8?B?SDJtam5wRTRmUHpuTCtXQ0YxWGczWWQvS2VoY2F6YitjdDZVekhRelZRL1FC?=
 =?utf-8?B?d3VMVk0yN080Vk82bHJsV3VIemJ6eG1Kc245WVhucDN0Q3BISnRVZDE1ZVh2?=
 =?utf-8?B?UzlvbGt6T0ZMbHdETzBvY2poVTROTGcvS1Y0cVoyZmlFSmpiRW56SUp3MjY2?=
 =?utf-8?B?YlBaSmw0dkZwVmQ5SXl5cFpiRmJxZDU3RGxVRVAvaUhoWk1UWEFNUis3YTY3?=
 =?utf-8?B?OUNKQTFlUE1ldEJoY01qMEhzNXc0N3RwYzFselBOd3J1K1ZPcXEyUTJsaEcz?=
 =?utf-8?Q?6dkNbqRg0y8NkrY7wPqTrLWKcHXN6TAAec7ns?=
X-Exchange-RoutingPolicyChecked: 3TZnh5nGaRYcora1kYevbWFuNEX6mbY8q+m+so6ws8ytbbYUrv5D/fhzYMHwphBOEle8OoIr8Plqi45eGV/oQ0vCWKAOnlTmrBneXJ+NdB9p+9XSlg3BoE6QKQz6SnoiCKfOky/pQkTxgrYOd0gHaoqQkP7IsH7SaSQv6/RgrvxpuWvnFLXi5nrXrWmbYZDoJuPUDjJ0rr0JQRx8otHzvvEIBARE7YI5iBAL/uYRmaVYLOQAkOoE2Mo3PQIoVLW76YbSvXagMK776fpW6hndyzU12qRWduavFqwoRpgVScbwsgNoFFNVliom/hE9t1JESnz+O8f6k1Z+QG1oOenVfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 348b64bc-23e6-4014-a495-08df256dec1a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 18:56:55.4119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrJ8fQ+HvA+be1jPKhUysdTmxrqpeK76KNDwIwRgQTYwwu8C//+NRiXBEKVuGzMsjs6AESvbCqJ7bmMaPBYYfhf6ga6ItMx3/l2EVcYxPhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6E07EBAE7
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

On Wed, Oct 07, 2026 at 11:14:09AM +0530, Shekhar Chauhan wrote:
>From: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>After mmio trigger is issued, we should wait till we receive a report with
>the context id issued in the mmio trigger.
>
>While waiting, propagate write_perf_data() failures back to main(). A
>failed write can drop an already-read trigger report before it is checked,
>which would otherwise leave the recorder waiting indefinitely.
>
>v3: Propagate write_perf_data() failures out of the trigger wait (Shekhar)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Co-developed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tools/xe-perf/xe_perf_recorder.c | 57 ++++++++++++++++++++++++++------
> 1 file changed, 47 insertions(+), 10 deletions(-)
>
>diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
>index e13eef519..6ec29558d 100644
>--- a/tools/xe-perf/xe_perf_recorder.c
>+++ b/tools/xe-perf/xe_perf_recorder.c
>@@ -370,6 +370,7 @@ struct recording_context {
> 	uint32_t vm;
> 	uint32_t exec_queue;
> 	struct intel_bb *ibb;
>+	uint32_t mmio_trg_val;
> };
>
> static uint32_t oa_unit_mmio_trigger_reg(struct recording_context *ctx)
>@@ -642,13 +643,15 @@ check_mmio_trigger_report(struct recording_context *ctx, const void *report)
> 	const uint32_t *report_32 = report;
> 	uint64_t value;
>
>-	if (report_reason(report_32))
>+	if (!ctx->mmio_trg_val || report_reason(report_32))
> 		return;
>
> 	value = (fmt->header == HDR_64_BIT) ? ((const uint64_t *)report)[2] : report_32[2];
>
>-	if (value == 0xc0ffee01 || value == 0xc0ffee02)
>+	if (value == ctx->mmio_trg_val) {
> 		fprintf(stdout, "Received trigger report with value 0x%" PRIx64 "\n", value);
>+		ctx->mmio_trg_val = 0;
>+	}
> }
>
> static bool write_stream_data(struct recording_context *ctx,
>@@ -712,6 +715,21 @@ static bool write_perf_data(FILE *output, struct recording_context *ctx)
> 	return false;
> }
>
>+static bool write_mmio_trigger_data(struct recording_context *ctx)
>+{
>+	struct pollfd pollfd = { .fd = ctx->perf_fd, .events = POLLIN };
>+
>+	while (ctx->mmio_trg_val) {
>+		poll(&pollfd, 1, -1);
>+		assert(pollfd.revents & POLLIN);
>+
>+		if (!write_perf_data(ctx->output_stream, ctx))
>+			return false;
>+	}
>+
>+	return true;
>+}
>+
> static clock_t correlation_clock_id = CLOCK_MONOTONIC;
>
> static const char *
>@@ -790,23 +808,27 @@ static void emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t reg, uint3
> 	intel_bb_out(ibb, value);
> }
>
>-static void emit_oa_trigger(struct recording_context *ctx, uint32_t value)
>+static bool emit_oa_trigger(struct recording_context *ctx, uint32_t value)
> {
> 	emit_mmio_triggered_report(ctx->ibb, oa_unit_mmio_trigger_reg(ctx), value);
>
> 	intel_bb_flush_render(ctx->ibb);
> 	intel_bb_sync(ctx->ibb);
> 	intel_bb_reset(ctx->ibb, false);
>+
>+	ctx->mmio_trg_val = value;
>+
>+	return write_mmio_trigger_data(ctx);
> }
>
>-static void
>+static bool
> read_command_file(struct recording_context *ctx)
> {
> 	struct recorder_command_base header;
> 	ssize_t ret = read(ctx->command_fifo_fd, &header, sizeof(header));
>
> 	if (ret < 0)
>-		return;
>+		return true;
>
> 	switch (header.command) {
> 	case RECORDER_COMMAND_DUMP: {
>@@ -814,8 +836,10 @@ read_command_file(struct recording_context *ctx)
> 		uint8_t *dump = malloc(len);
> 		FILE *file;
>
>-		emit_oa_trigger(ctx, 0xc0ffee02);
>-		write_perf_data(ctx->output_stream, ctx);
>+		if (!emit_oa_trigger(ctx, 0xc0ffee02)) {
>+			free(dump);
>+			return false;
>+		}
>
> 		while (offset < len &&
> 		       ((ret = read(ctx->command_fifo_fd,
>@@ -859,6 +883,8 @@ read_command_file(struct recording_context *ctx)
> 		fprintf(stderr, "Unknown command 0x%x\n", header.command);
> 		break;
> 	}
>+
>+	return true;
> }
>
> static void
>@@ -1320,7 +1346,11 @@ main(int argc, char *argv[])
> 	}
>
> 	init_mmio_trigger_ctx(&ctx);
>-	emit_oa_trigger(&ctx, 0xc0ffee01);
>+	if (!emit_oa_trigger(&ctx, 0xc0ffee01)) {
>+		fprintf(stderr, "Failed to write xe-oa data: %s\n",
>+			strerror(errno));
>+		goto fail;
>+	}
>
> 	corr_period_ns = corr_period * 1000000000ul;
> 	poll_time_ns = corr_period_ns;
>@@ -1351,7 +1381,11 @@ main(int argc, char *argv[])
> 			}
>
> 			if (pollfd[1].revents & POLLIN) {
>-				read_command_file(&ctx);
>+				if (!read_command_file(&ctx)) {
>+					fprintf(stderr, "Failed to write xe-oa data: %s\n",
>+						strerror(errno));
>+					break;
>+				}
> 			}
> 		}
>
>@@ -1370,7 +1404,10 @@ main(int argc, char *argv[])
> 	}
>
> 	/* Emit second OA trigger for the case where circular buffer is not used */
>-	emit_oa_trigger(&ctx, 0xc0ffee02);
>+	if (!emit_oa_trigger(&ctx, 0xc0ffee02))
>+		fprintf(stderr, "Failed to write xe-oa data: %s\n",
>+			strerror(errno));
>+
> 	fprintf(stdout, "Exiting...\n");
>
> 	if (!write_perf_data(ctx.output_stream, &ctx)) {
>-- 
>2.53.0
>
