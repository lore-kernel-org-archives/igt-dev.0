Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C332E606A32F
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UlAhfQs9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE7A1126F7;
	Fri, 30 Oct 2026 10:05:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BD610E87E
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 10:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793354657; x=1824890657;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2qty6ErPazqz7GbHYLu/MKPNufgENTlg3Q7pCviVv5c=;
 b=UlAhfQs9SyAOjzmxri0sr/hAlVnIrez7R+Zv5+7UeM5tvsTqttSS8kyp
 Lhov8NIBHI1nTL0Zujvhxl+BSeQn1wBK3pjbRle4yGgLZ1LhA1vgfwNDt
 Y3tCwVGrRuEszudRQ2o8sDr1GW9mVd3hK26eR88H6zsgiaxmWqU2D+Isb
 Kttl5lxkJoUvpd5N+etlRXPysBk+AVWCIsJtoom+4a96Q6Zu74S4F7S8X
 IQPnDf7mS7UBbkF+Tv172C+89LyXkLJzUahOiS4Z4RZjrFulExS8oWYxR
 rz0PkS5TzHEE2onAM4LxDpjMrXMMR2FHkgcTN7t2GLbAF+bVBUI2aNAq+ A==;
X-CSE-ConnectionGUID: nAE7MLUaQaakoKcq/1DT4g==
X-CSE-MsgGUID: 3BqqE9tTTmWGLRTGDN9Fvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2129217"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2129217"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 03:04:16 -0700
X-CSE-ConnectionGUID: MMEAfGJ+TeK0AFRzZUvrOw==
X-CSE-MsgGUID: ToQ7oBNoTumDu5BCpoQMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5533308"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 03:04:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 03:04:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 03:04:15 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 03:04:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXjGIYYsAjGOVt9NabeRiiVCLwD+6wyarsJNCpFtUrmCJHFUVvvxFJIAbzLVLGa1n4Pc957Vk/tBM2Z9AmFw/mChSr84hYbGizdPdICxutDqafeaGyEzJNDbg5CyrtRvnT3ZtgJpj6gJ2ZziZ6P+GzFHTRv5GRxRzP3Y0fcwTiqMMo+8kc8CRIUBUls1m7p8uyhK5720v6Qv6pPj4arsMI1F1/090LeOd5fW2CYID1ckfTCcjYbTEklSJlB9dS3E1FWLt4pyjD0ASyFDXtgHUq4pEe2m0VJ9TRq6zTsrqHNgMQq9lecQoMhMaNGsfauXEaw3Qmqjc8qprjy8lQ3ktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztbDBn0L2mWKAppY9SRi62hXpVQUcqtVGTRnYjQfR/E=;
 b=ADJbro77SC0veffQD0hcbA29IpssUxkZVEmfFqSAA54haSsLRyh9SMXKSLg0+QBy3IIOMnVfX5MOCC2R27mWfc2dgUMhG+snB7ckdm5n4RKRoRzJkr7cuVubjh9p+argf+W/Uv7WJoQmwSN9szxGNJmJc8QLja9sh9UVZsW0ga2OcKDJIvmzBMHQOmLbUSd+aBS5nIhg+QRw94gRX6UrBcXadPULC0OU6IKRQiTf7uoLUzGN6Qcs6V9uALSAGCgce9FZLO2bY1XfluoAar5gb6LanhIkg58lNzxgMHpPqJQ8vtPk89YOTdPTaE8LcUlImVB3tu1lQq4PjQUXa5Z1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by SA3PR11MB8045.namprd11.prod.outlook.com (2603:10b6:806:2fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 10:04:12 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:04:12 +0000
Message-ID: <410c19c9-77a6-40c8-acbf-fbe100f938e8@intel.com>
Date: Fri, 30 Oct 2026 15:34:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/10] lib/igt_drm_ras_nl: add get_error_counter support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-5-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261029085955.1232163-5-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::15) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|SA3PR11MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ce034b-2e6e-4520-7198-08df366d25d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|22082099003|18002099003|261026121527099003|56012099006|261021123027099003|261022075727099003|10067099003|4143699003|11063799006|261009223027099003|261021121427099003|261022105027099003|261022113327099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: w9jSMdXdwOW24Ni1Ilwv+kFET6IntWBqg7rz8r+9CH4wCH13324rJ6/bgeCajJ3CRO2y5G5qCT1kmcufdNpZnGWAKDOkL0/HfJSa2U0EVegyocfGLnsU/fDwQ80J+/rA87dOr35IJ+m7krJyIjHDln00DlWWh/WXtFk4ZpOExy/k/H+vY+3vkcX11dfPYJkhBB1wE2YjW4TCv3oFfWX/UI8cAFDiLBH98m6GnLs1/YR++YBjY2oux/OF2pDoKPFLj/2BbOP+Kuv+w66wBouih6225KQ4KvdUx2U3F58OSB02awKxwpOhrJdpDEs8X8brwhT32RAlA6LZPhQsA94ftfoQxJ22IDr07UhMIw31ixao8rkAXwCcbt0Ae1H9qSNt7kYJfzUqE+JI2u1Kyb/xNGYP8SZeGJM4Ahrlykq4IgZxAu+NolkVuPWcbjyaFzTq5JBgjLd3QYSxHBAcOiC9YsiOIWiXtZropxRaHXVX5HkwhvxpP2eHPuU8o78rVf5IKuu5zV37DCa+2/EiKy1Y6pGCQSAzDzIQVmSw2kj+xm+Ccrxg2kApdXQft4L18MyG1kc/A4pn3EYY22RYLbKDn/7PUNwfhr8VNjEwviUuCaLNqwvLckUOFGLMRtePP4UMZpFD3g8EhJ2IEydsQ/bb+Km9/g7PyjOS9N9VVI11LN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(261026121527099003)(56012099006)(261021123027099003)(261022075727099003)(10067099003)(4143699003)(11063799006)(261009223027099003)(261021121427099003)(261022105027099003)(261022113327099003)(261028144727099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a085VS9ub3hFTHJjeHNpbS9TR2FWckVrZC9JQ3JsZjlLL0xGQko1ZW1WQ1lq?=
 =?utf-8?B?U3gveVFmUVRkcEM5WnlVQXpmYXFSZS9QZ29aaERuQWRlV21iZXZ2N0ErbWlN?=
 =?utf-8?B?RGFBQUZNclhpR3phUUgwdkRPUkVtZUY0czlRMldtWHRtbU9aeEJnazNFYUNB?=
 =?utf-8?B?OFR2TWVnNEppY2wwREZWUnlqZ2c5R2FFVVA3N2VVanV0OE0vbTFYbUtmRlBW?=
 =?utf-8?B?T3dPRERJUXMvWkpCcGdIeFM4QTdCYXh3UFNySUNKcnhhcW84RE00aGl4cSsz?=
 =?utf-8?B?OHRBSTdWaEVaUlFzbXZGQW5oOGR0OUZ0MEx2ZG4rQVdhZDkwS1RkcUh5SThW?=
 =?utf-8?B?M3RleFJFWlZYZmgvdzNNVnZKcnNRd0VkN1JmUjhVcXZyb1RKaVh4akNhMEFv?=
 =?utf-8?B?VnU0ZmhaTElNY1dKNVFWQS8wck9EWDI0SWhmRy8rQjJyREpnME5hN1R4b2g4?=
 =?utf-8?B?NFlZWG5mSzhwUzQwK3k3Y2JJTHc1bmMvcUJ0SzZzS1JQcXVka1VwQ1JRS2RW?=
 =?utf-8?B?QTR0ckQralR4dG16ZWVjd0RNbzBGaXNLZFo3Rk1YMHo0b2VKZXhDUW8xNkQz?=
 =?utf-8?B?a2Z4WjhxUDdMQTRsRTNmQkMyc01TZXFiRjV4clI0QnFTVW1tOHk5Vzc2T1dq?=
 =?utf-8?B?THRTRVNwdGVoYkRPU2ZlaVMvWHhKSXVFQmFPbzIvL0ZtdFFtN2pudGZub3pq?=
 =?utf-8?B?U0gvN2d6Z25qYTYzVHBLU3ZnTW1UT25Kbmx3eVJsZ1Q5c0hOYUltemREOXlB?=
 =?utf-8?B?aWlWdUJLdUQ3VUxWcWhYSytxVVFFQms4cDJvSk9vNVZRZFh3ZnoyL0Q4VzJG?=
 =?utf-8?B?YlNaMndJRGtaQkRuSVZxdFJWb1RITWUxSXg5NWhOY1NuQmh5NEliTWtDWmpx?=
 =?utf-8?B?a05lalBPS2ZiTGdPVFM0SmsvNkM3TmZuQzZHRWZMNEc4bG1BbW9MVHJhNm1V?=
 =?utf-8?B?N0lEUVZqTW90bHBqUVlvMVQ2UWdWRDVDSDU1UW11b3NRZzFDUVY0STlKVzlY?=
 =?utf-8?B?OUtKVHRFcGhiYlhRZ2lneXQrSUdUU3V6OVIxTCtIWENFMlBqRzJjUDJMWkVT?=
 =?utf-8?B?L28xVklnKzQ3ZVBLWUF5UzJlOE9UUy96MXo3VlMyN1hnM08vMGFxNTYwVGxX?=
 =?utf-8?B?dmZvUVppcUl5eGp2czgwa2RKVXNNbmI4N2dWcCt0cjl6M3NYWjU5SWY5elN2?=
 =?utf-8?B?MUZRVlVvNGJZa3FzM1VVQkhMSXZwZmhoVEsybE5kbk1PT0hTbTk0Z2NseGpr?=
 =?utf-8?B?L3p0V1N6UjkzcEdha3ZjRXhDVzhxV2hYRXhlS2MrS3lSaGwxeUU4TmdoVFVC?=
 =?utf-8?B?UExoM011cUYwSzZLWVBHOHJmOHY0UEs5SEUvSnIyMzRFYXBDWnRiL1loK0Zz?=
 =?utf-8?B?czdCTnZTcDZMdmFkaXpLdFdhR0FsMzZlN1l1VW05SjY4N0hWV3VuVlFZQUh2?=
 =?utf-8?B?YlR2bXUvOGpJMTdpaEoxYTdvYU1jTUxIWTlucEZLMEF5WTdRUDcwa0NENzdP?=
 =?utf-8?B?OG9oRW9WalpWMno3MlM1NUw1M05sbmFRL2w0dEZJbDUvU3Y4dDlid0owQkZv?=
 =?utf-8?B?ZmxYOTNJRGpLODhSM1NPbmVVU1M5bis3cUR1WXhFdmdvYVM0UExHdFhka1NM?=
 =?utf-8?B?eWpmanJjamRxSXpDKzlsaUdBeTdKeVA2TjM0cW9SRzRsOWNraWpBWE5CdzVW?=
 =?utf-8?B?bTl4MWlBbW5TSUk3MmVzeVZERWcvL0NCb1luTXQ5bzNWQk9DNWJ6L0tUWVJu?=
 =?utf-8?B?cTZ6Y24rNG9aTEdXamg5MDFFR0lxZVgrVWlQcmNiMXJrdjRaVHdWZWVsaHFU?=
 =?utf-8?B?Nk9PWVNGaDh6eDlzdFVzNml3bVY3TTN3eWZjSFo0dVJuRFM0UFgyYk4zaWN5?=
 =?utf-8?B?ZzJzMWcrZDhVeEcweW5jaDhtTTY0NXloN1R0eHJLb04xWGVxZXpHZmluVGIv?=
 =?utf-8?B?d3hhVlFzSUR0bUQ5SXBlT2ZpQTRsNEljMmFQeEQxYjhpV0Y4czhCSDZ5bXhj?=
 =?utf-8?B?eWtqZGYzUWpDT2VwYm9lVk4xSDA1ZDNWL29UaUZpQXB4REtwSGhwdFRBdGxv?=
 =?utf-8?B?MjJia1N5UW1EQkxlOUZIbXNNVlM1NTVGZWl4eTNWYWFvNXcza0drb3ZUV1h6?=
 =?utf-8?B?VUp5N2tXVmNwMGhySVFzaUJMNnovR0U3UksraGFxK0NYN1o2ZnRKYW9QTC9I?=
 =?utf-8?B?QllUV1dIc21xVVpib3RMbnpxc284R1YwWENKTU1FSkZhbkpxQlhFUnJ3OTlH?=
 =?utf-8?B?RFZHZ3F5VXJyWVlkOWNlVHlUNGpsUWZnV2dCMGZhcndkMG5SM21HeU1TdFlk?=
 =?utf-8?B?NHB1L09tRVFTYy94MFBoZEk4L1BxRVU5M0Z5Rmw0OWxzb25yb254UT09?=
X-Exchange-RoutingPolicyChecked: XO7OyokuL/bjR2kfkaE06fz5wRo/wDjEnIY25Vy3GgqqaQaDZCsbJq6Agh/TEF4yhERSP6Am17wE/ZG45MKfvaFTvO6BlxrXXG8vpTxFlPlQ8DJXtinrQMQ++QZzbwEfRRqUzCE0kxXuYxMBFJO34ljpLPtu5w17qV++DHPIkVPGYma2dnD321aCKnk0etRGRhjWqG0hXHhZrQRbhPwVmZAJ/55nHA7fVoDpoyGOokt3HtvjL64mpWrlef/lvondOYBA/B6/nMYwoJPi/+MMqqirsokBLegt2PRskOYZaNe8n62CizM4mspfqokL59IqAYJvQHAUjTEavO7wUL3AMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ce034b-2e6e-4520-7198-08df366d25d1
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:04:12.6683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8G1FmO8gIHP0cwL0X4VrP6lH9ihD5hr81nKdXKmtP3v2WPmEvYNZnYB1wPQDnV7kX72RW2L2erOoJRJBR4ZLOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8045
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

Hi Ravi,

On 29-10-2026 14:29, Ravi Kishore Koppuravuri wrote:
> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v6:Removed normalize_nl_error() for standard errno in ras_error_cb() and
>     send_and_recv_nl_msg() (Soham)
> v5:Renamed library function names prefixed with igt_drm_ras_nl_*
>     (Riana and Soham)
>     Normalized libnl error codes to standard errnos (Soham)
>     Added error messages for error handling functions (Riana)
>     Changed the error-id max value from UINT32_MAX to DRM_XE_RAS_ERR_COMP_MAX (Riana)
> v4:Added support to poll for incoming netlink messages with 10 seconds timeout
>     Renamed the library functions with prefix "igt_drm_netlink_*" and
>     other cosmetic changes (Nikula Jani & Kamil)
> v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
>     Added a check whether error_value updated by valid callback or not
>     Added a check whether response required for the command or not
> ---
>   lib/igt_drm_ras_nl.c | 317 ++++++++++++++++++++++++++++++++++++++++++-
>   lib/igt_drm_ras_nl.h |  34 +++++
>   2 files changed, 349 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
> index 2822361d3..7e6a61f11 100644
> --- a/lib/igt_drm_ras_nl.c
> +++ b/lib/igt_drm_ras_nl.c
> @@ -3,14 +3,286 @@
>    * Copyright © 2026 Intel Corporation
>    */
>   
> +#include <errno.h>
> +#include <poll.h>
>   #include <stdint.h>
>   
> +#include <netlink/errno.h>
>   #include <netlink/genl/ctrl.h>
>   #include <netlink/genl/genl.h>
>   
>   #include "igt_core.h"
>   #include "igt_drm_ras_nl.h"
>   
> +#define DRM_RAS_NETLINK_REPLY_TIMEOUT_MS 10000
> +
> +/* Normalize netlink error codes to standard errnos */
> +static int normalize_nl_error(int ret)
> +{
> +	if (ret >= 0)
> +		return ret;
> +
> +	switch (-ret) {
> +	case NLE_INVAL:
> +		return -EINVAL;
> +	case NLE_NOMEM:
> +		return -ENOMEM;
> +	case NLE_NOATTR:
> +	case NLE_MISSING_ATTR:
> +		return -ENODATA;
> +	case NLE_OPNOTSUPP:
> +		return -EOPNOTSUPP;
> +	case NLE_EXIST:
> +		return -EEXIST;
> +	case NLE_NOADDR:
> +		return -EADDRNOTAVAIL;
> +	case NLE_PERM:
> +		return -EPERM;
> +	case NLE_NOACCESS:
> +		return -EACCES;
> +	case NLE_NODEV:
> +		return -ENODEV;
> +	case NLE_BUSY:
> +		return -EBUSY;
> +	case NLE_AGAIN:
> +		return -EAGAIN;
> +	default:
Any igt_debug log required? could be useful during debugging.
> +		return -EIO;
> +	}
> +}
> +
> +static int ras_command_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +	struct nlmsghdr *nlh;
> +	struct genlmsghdr *gnlh;
> +	struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
> +	int ret;
> +
> +	nlh = nlmsg_hdr(msg);
> +	gnlh = nlmsg_data(nlh);
> +
> +	ret = genlmsg_parse(nlh, 0, attrs,
> +			    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> +	if (ret < 0)
Any igt_debug log required?
> +		return NL_SKIP;
> +
> +	switch (gnlh->cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
> +			return NL_SKIP;
> +
> +		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
> +		break;
> +	}
> +	default:
Any igt_debug log required?
> +		return NL_SKIP;
> +	}
> +
> +	ctx->reply_received = true;
> +	if (ctx->ack_received)
> +		ctx->cmd_done = true;
> +
> +	return NL_OK;
> +}
> +
> +static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
> +{
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +
> +	/* err->error is a raw kernel errno, not a libnl NLE_* code */
> +	ctx->last_nl_error = err->error;
> +	ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int ras_ack_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +
> +	ctx->ack_received = true;
> +	if (!ctx->response_required || ctx->reply_received)
> +		ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int ras_finish_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct igt_drm_ras_nl_context *ctx = arg;
> +
> +	ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int register_callbacks(struct nl_cb *cb, struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_VALID callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_ACK callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_FINISH callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_ERR callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
> +				struct nl_cb *cb,
> +				struct nl_msg *msg)
> +{
> +	struct pollfd pfd = {
> +		.fd = nl_socket_get_fd(ctx->sock),
> +		.events = POLLIN,
> +	};
> +	int ret;
> +
> +	ret = nl_send_auto(ctx->sock, msg);
> +	nlmsg_free(msg);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		return normalize_nl_error(ret);
> +	}
> +
> +	/* NL Reply and ACK arrive as separate responses */
> +	while (!ctx->cmd_done) {
Is timeout required ?
> +		do {
> +			/* poll for incoming netlink messages with 10 seconds timeout */
> +			ret = poll(&pfd, 1, DRM_RAS_NETLINK_REPLY_TIMEOUT_MS);
> +		} while (ret < 0 && errno == EINTR);
> +
> +		/* poll()/errno results are already standard errnos, not libnl codes */
> +		if (ret == 0) {
> +			nl_cb_put(cb);
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (ret < 0) {
> +			nl_cb_put(cb);
> +			return -errno;
> +		}
> +
> +		if (!(pfd.revents & POLLIN)) {
> +			nl_cb_put(cb);
Any igt_debug log required?
> +			return -EIO;
> +		}
> +
> +		ret = nl_recvmsgs(ctx->sock, cb);
> +		if (ret < 0) {
> +			nl_cb_put(cb);
> +			return normalize_nl_error(ret);
> +		}
> +	}
> +	nl_cb_put(cb);
nl_cb_put(cb) cleanup is repeated on every exit path. Could a single 
goto unwind be used ?
> +
> +	return 0;
> +}
> +
> +static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
> +{
> +	struct nl_cb *cb;
> +	struct nl_msg *msg;
> +	void *msg_head;
> +	int ret;
> +
> +	msg = nlmsg_alloc();
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	ctx->last_nl_error = 0;
> +	ctx->cmd_done = false;
> +	ctx->reply_received = false;
> +	ctx->ack_received = false;
> +	ctx->response_required = false;
> +
> +	msg_head = genlmsg_put(msg,
> +			       NL_AUTO_PORT,
> +			       NL_AUTO_SEQ,
> +			       ctx->family_id,
> +			       0,
> +			       NLM_F_REQUEST | NLM_F_ACK,
> +			       cmd,
> +			       DRM_RAS_FAMILY_VERSION);
> +	if (!msg_head) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	switch (cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER:
> +		ctx->response_required = true;
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
> +				  ctx->node_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return normalize_nl_error(ret);
> +		}
> +
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +				  ctx->error_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return normalize_nl_error(ret);
> +		}
> +		break;
> +	default:
> +		nlmsg_free(msg);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	cb = nl_cb_alloc(NL_CB_DEFAULT);
> +	if (!cb) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	ret = register_callbacks(cb, ctx);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		nlmsg_free(msg);
> +		return normalize_nl_error(ret);
> +	}
> +
> +	return send_and_recv_nl_msg(ctx, cb, msg);
> +}
> +
> +static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
> +{
> +	ctx->sock = NULL;
> +	ctx->node_id = UINT32_MAX;
> +	ctx->error_id = DRM_XE_RAS_ERR_COMP_MAX;
> +	ctx->error_value = 0;
> +	ctx->last_nl_error = 0;
> +	ctx->cmd_done = false;
> +	ctx->reply_received = false;
> +	ctx->ack_received = false;
> +	ctx->response_required = false;
> +	ctx->family_id = -1;
> +}
> +
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
>   {
>   	if (!ctx || !ctx->sock)
> @@ -18,14 +290,19 @@ void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
>   
>   	nl_close(ctx->sock);
>   	nl_socket_free(ctx->sock);
> -	ctx->sock = NULL;
> -	ctx->family_id = -1;
> +
> +	reset_drm_ras_nl_context(ctx);
>   
>   	igt_debug("Cleaned up netlink socket.\n");
>   }
>   
>   int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
Several paths return a generic -1. Could specific errnos be returned 
with a igt_warn() ?
>   {
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	reset_drm_ras_nl_context(ctx);
> +
>   	ctx->sock = nl_socket_alloc();
>   	if (!ctx->sock)
>   		return -1;
> @@ -48,3 +325,39 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
>   		  DRM_RAS_FAMILY_NAME, ctx->family_id);
>   	return 0;
>   }
> +
> +int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0) {
> +		igt_warn("Invalid DRM RAS netlink context\n");
> +		return -EINVAL;
> +	}
> +
> +	if (ctx->node_id == UINT32_MAX ||
> +	    ctx->error_id == DRM_XE_RAS_ERR_COMP_MAX ||
> +	    ctx->error_id == 0) {
> +		igt_warn("Invalid node_id (%u) or error_id (%u) provided\n",
> +			 ctx->node_id, ctx->error_id);
> +		return -EINVAL;
> +	}
> +
> +	ctx->error_value = UINT32_MAX;
Keep initial value consistent with the reset initial value (0) in 
reset_drm_ras_nl_context().
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ctx->error_value == UINT32_MAX) {
> +		igt_warn("No valid error counter reply: node_id=%u error_id=%u kernel_error=%d\n",
> +			 ctx->node_id, ctx->error_id, ctx->last_nl_error);
> +
> +		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;

is last_nl_error always negative ?

Regards,
Soham

> +	}
> +
> +	igt_debug("Retrieved error counter: node_id=%u error_id=%u value=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_value);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
> index 011f3bc05..f51784524 100644
> --- a/lib/igt_drm_ras_nl.h
> +++ b/lib/igt_drm_ras_nl.h
> @@ -7,14 +7,48 @@
>   #define IGT_DRM_RAS_NL_H
>   
>   #include <drm-uapi/drm_ras.h>
> +#include <drm-uapi/xe_drm.h>
>   
> +/**
> + * struct igt_drm_ras_nl_context - DRM RAS generic netlink context
> + *
> + * Holds the state for a DRM RAS generic netlink request/response exchange.
> + */
>   struct igt_drm_ras_nl_context {
> +	/** @sock: Netlink socket used for the exchange */
>   	struct nl_sock *sock;
> +
> +	/** @node_id: DRM RAS node ID to query the error counters */
> +	uint32_t node_id;
> +
> +	/** @error_id: RAS error ID to query the error counter */
> +	uint32_t error_id;
> +
> +	/** @error_value: Error counter value returned by the kernel */
> +	uint32_t error_value;
> +
> +	/** @last_nl_error: Last netlink error reported by the kernel */
> +	int last_nl_error;
> +
> +	/** @cmd_done: Set when the command exchange has completed */
> +	bool cmd_done;
> +
> +	/** @reply_received: Set when the command reply has been received */
> +	bool reply_received;
> +
> +	/** @ack_received: Set when the command ACK has been received */
> +	bool ack_received;
> +
> +	/** @response_required: Set when a reply is expected before @cmd_done */
> +	bool response_required;
> +
> +	/** @family_id: Generic netlink family ID */
>   	int family_id;
>   };
>   
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
> +int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
>   
>   #endif /* IGT_DRM_RAS_NL_H */
>   
