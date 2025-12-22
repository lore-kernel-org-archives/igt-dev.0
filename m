Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E2DE6749E
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 11:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1377710E640;
	Mon, 22 Dec 2025 11:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcFP6DJY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B01910E640
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766404780; x=1797940780;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qcg51iUWMF4KEQM7OUB1x4XGSXEOa2a5mTXwO9yuak8=;
 b=LcFP6DJYN4Cms7U6wLoMLUXiHa6mvcve+dDRGfwM3ERmuG3MEn1VRLYz
 JK9dLZpth4G2y3SEfziQztn+3xvChUBTQquiyaD7SlgtvNHRi759IRC0H
 au/yp3DKjwHb0w1Jyb330CGFjrBAnurMiqOFDdlNKic1tV6vliJMAB2jE
 9bp/x+EXkJxCq/mRI8vq1b+084260wANrFbF8reisj7i1MHo4PnRGc33J
 0BJ+edc35CBgwUNpmNkrpD0snVJ9XxyZ+HRPYTEGMG1niLuvKjvi9xjXA
 ZsPwSe0wUY7Av4YoDtLaKRhhtMgn2v3G/Kb1oC4wBbuOcAn01NtLGkspP A==;
X-CSE-ConnectionGUID: 5Pm3IbvvQCyLyZ62OLX8FQ==
X-CSE-MsgGUID: eLRuFBUvTa+PWQr3DEVnSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72107390"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="72107390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 03:58:09 -0800
X-CSE-ConnectionGUID: UkloXjkbRcGzXaEz4psv7Q==
X-CSE-MsgGUID: X7kAZW6STaeL7fWQnPFs5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="199545899"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 03:58:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 03:58:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 03:58:08 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 03:58:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScfEfrqwdwTfCrxw2zeUJL1CBbGc3KXQPNSLB05JGW/HNW4Qxj38gICcq+ZtXh4dWdalHQafUvEKFwFEwe0QbN4S8g+tbzHEoD+7V1JHejjAbbW8tIGiJe4a58n7c6NaXxN6P6NRCkYf9K49s10j5LS+InVFThyjLnQkxp6ls/2VDJTypLXJg5oQYVZpz8fR8gooVwQ2JUu3ydLNuu/0dMBIpXx6HApEiOdc1SvKIEs4CdZ4kLSb0x6SzqchASsLV7v2D5kKpQzX8Bd5Qj6DmHc5qN1Cw34dvazCeN+mKSsP+h7iPGELUCl5ysoFedSE6yFVwpkPJjg8AgrentqPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REXhy9ScE1Bs86BmBWuaOE+q2Qi+K0dJdcdlPavccqw=;
 b=ZiP3uxH8fb6kXF6e2o6C2Ln4gCHxaQMAkYOM9ybKd7JE6PS1dOl2tN0wPZI6ol3Hm8jBjQlJt7W1uFqnbN5mh69FYE2K3+Fk4ZkvPwbMbWVws8k4jAYWyzK3CN2xQUASSpVyVKDfHzgevLZK/TJ1FOzwDwzaPAi/7BTNk/GRWz1dYexYiOld+E37QlC+jF7IVlHgfthfp0wtyck2F+lxHAdU4FsUNedEYn/EYNX7luhkDM0ol9jrvdxlcp6zennyhgk4V3N0judX52+8Py63CngRi3LgZg5/LX/R/32uvEgLRVrF0o0lCbqbpbISRbJNSOeRD9b6fTnmBXArmjQi4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 11:58:06 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 11:58:06 +0000
Message-ID: <d5a6495b-7b90-4658-a3cc-ccb42d995c8b@intel.com>
Date: Mon, 22 Dec 2025 17:27:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4 1/4] lib/igt_kms: Add igt_get_joined_pipes_name()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
 <20250905210816.319104-2-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250905210816.319104-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0112.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CYYPR11MB8360:EE_
X-MS-Office365-Filtering-Correlation-Id: 45114c06-33ae-4836-07b2-08de41515dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1BCRGJialp0YnNOdUhXUGw1RzNZV05JZC9UMno4VzJkVFpEQ3J2UGkwTlFz?=
 =?utf-8?B?dHRrVmZPZVdqQkErSTM3aHhsOENpWmU1L0ZuRlJkakxhMGxsWW81Nm9YbEli?=
 =?utf-8?B?SXp5ZDZKY1VjZW83dUxyU3kydGQ0TUs1Q1FlV2hjY2F6VmRtZDF2bzBadERk?=
 =?utf-8?B?TTc3VG1DMHkwY3NUMHlUZDIyRWl3eDM2T0dMR1VtNDdqa2lSbkZ5UXp1VVVC?=
 =?utf-8?B?ZmtqQk9HZ2UrdjFueWt1aFJMc2JIVlMzL0RYK1BJbjU0cHJQR1NCOXBhVjV4?=
 =?utf-8?B?YVRna2tCRjZDVzJpUHJnazRKV21wY0d2UDJ5UTNieVZxTkI4bTh2bytTMzlq?=
 =?utf-8?B?UXF2Y0R6aVJhQ21pd0ozVHI0QVVJajh6YnJNb3J2Vmk4T0dzbFlnVEFHdVE4?=
 =?utf-8?B?VFlDaWhWdzFRZ3hqNUM0QysvdEgrdE5CajE0aDBVNGJlTkV3NTdTVUtXUmVG?=
 =?utf-8?B?N1VRMWpRWU1aOXY2S1V0TDVFK2ZVZElTUnFUc1pzZENMUVNUVStkdVpoOGVp?=
 =?utf-8?B?MWV5SnBjMXByZTlCR0FWWWJzbnFJdnpMekVkL2h1RGhWc3hrUEFEaFplaGlK?=
 =?utf-8?B?VjZoK2cvNnlDNjR5NzJ5d2o4UEcwRWNXRkRsTjhpalZvdndkbktmYmNSdFBs?=
 =?utf-8?B?Q0dnTUc1U1cwS1NsZWlzS2hwTDQxRm42cUhGVEV2WXJLTGh3ODhNTWROSHFu?=
 =?utf-8?B?a29kWlN0WmtIR0Zmalpidng3dDNVei9Fd0JEWmFRSGEyY25nS3QxanlYeGFt?=
 =?utf-8?B?MXhKbTRqY2UvbkZvRzNLMHNRZ28vV2hNQXpqSHNBaHZlZ0RtTFNuZ1dNMndt?=
 =?utf-8?B?UmVkWEwzbEw5Sy9rRWd2d2VzY1BxdjN4aFByMmhocVZlbFZqUVBxWEdydFUr?=
 =?utf-8?B?UjBMMDh2L1NteTJwSEkzbVZ6VHBST3k0S1dsWVBBUUgrakY5eHlNQVFxbytM?=
 =?utf-8?B?c2dFcmlqdExTa1JBeGdRNVFzeW9yQ2p6Z1hiSDM5dEVqM0dHTU5XNDVSWng1?=
 =?utf-8?B?UlRxWk91c2o4Q0N6QkN2d010cUlvWWJ5cW9HMGZLZHIzQkVxeTBBeGg2OEll?=
 =?utf-8?B?THFQZTRJUWZ6WEREdlJFeGhlbGprak1ISHZITk8wUE41WXMvYmJOVzgyTXlZ?=
 =?utf-8?B?NzM5T3k3bWVHTU04TStJNXhJUXVOZWFVcm8xSWVQMFhBM2JaVk1lU0FXNVYy?=
 =?utf-8?B?SlRkejBqM3M1S0k0N3ZZKzljK0xFOGI4VkFqdXdxbDFxR0ZkbDdYZ1hqNVI4?=
 =?utf-8?B?VzVNR3FNSTJZMjBvd2JYaSs1WFdBNGVYT3ROaS93NmlFczhVRjE1VVQvYUk5?=
 =?utf-8?B?Nlp1WWljR3BBZ0JTT3dQRSs5RFM0Y0loaFNNTzdJdnE5UHMrMzluTCtkSGQ5?=
 =?utf-8?B?ZU5SYlFlb2dqOUljUXR1TzBTUnZOLzgyYzlROVdRbzlBNG8rSW5pcWZlR001?=
 =?utf-8?B?M1ZPMjZaN0NkMUU4V0U4aW14YU9VbE5OU0RyejdqR0h2YWFRNjN3M0Vtazhw?=
 =?utf-8?B?QUN4NXE1SnNiZ08zeHNxQkZzaTBFTnBHMnhScHhPMVVMTE8yNFlFc0JFa1dO?=
 =?utf-8?B?M0hST3QwcXZCb055UUNVbUlKMHFiaG04em9BYmM3LzNkcFhuL3RrM3hKYmM5?=
 =?utf-8?B?dk9RZTdXOWtVRXhtWXBPWWRVdWFBNlNQLy8vaS91VlBqQ0JvR3dnUE1iYTZi?=
 =?utf-8?B?VlRIVHY4amNEN0xoelpqY2xtbWtDTEh2VGFjcG5hV1M2VHZOSm5nNjNWbHRh?=
 =?utf-8?B?LzV5TUY3NHdxVE9kRkVqeEg5aEViVU1mc2l0Y0pPTnJubHl4TllUcktxUzNO?=
 =?utf-8?B?VzdzUTk1ZmZCQUpXSEFmbGhqYmRLdGdrc3dLeHZTUTV4WmlCZEtpWU1DOU5o?=
 =?utf-8?B?U2Uvbm1xZXgwZk05Znk5YTNUQlQvNDd1bjV1enY4L2RHbUZ4bHg3RUFDTnA5?=
 =?utf-8?Q?QprxBEyAFsblUjNLSd0yu8U8Bq6LfGtb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXBYcjhKeEZBRTBYdis5ZXZ4OWFwWHVCWlNCYzAzSEFuWHFaWHhjb1lmZGpo?=
 =?utf-8?B?ZE5VYnNXTXZDcmRPbm9ZVmZTcVh2UUtNN0JrUWtQSXowamxhQnlwRXl3ancr?=
 =?utf-8?B?UGNZQ1dWSVl6Qy90bWpHellaVU1uN3FGV0hHSkFTQm9xU2tWWW5pSEtxbU9G?=
 =?utf-8?B?ZGY2MC9yc2VBamZUdFEwbkNORGx2alI4c0M0SWRHaTZMaXhTT3VRM0lJYmw5?=
 =?utf-8?B?T1BkT2J5UnpwdU56NU56eTB3a1lPd2cxVmcwV3YrWElMeHR3bkFpZ25CZEVF?=
 =?utf-8?B?Tk5wNE9NWGlpVllGYnUzR1Q3bTJ2YU5DMVRnbkNIY3JNcU45NVdyLzRFTFh4?=
 =?utf-8?B?OXphREpFNGk1dnJoMHVZbk84QWl1MDRzM0NsYndyWDdkdXJNRTNyQjYxK0ZB?=
 =?utf-8?B?bTd1NkJ0SUc0TWhtYlpXaU52LytUNG9RTUhJRkI0dlJRSkY2cittMzNoMjZZ?=
 =?utf-8?B?WWRtUlBlcFNXNTR4TEJ0aTlKSUs2WFFJVGVuYWxxd0tNcktVNSszVGU0bW9w?=
 =?utf-8?B?d0h0RFdwQ00ydlpFWk0zTWc5VlhsckxEbTkwSGVHUHoxZ1RQZW1hUi9GcDNs?=
 =?utf-8?B?Y0psZnJ0cVdhWUhpZ3JrVHR4U1g5Y3MxNGV3cXlHdUZ0NDYvWnR1TlU4KzM2?=
 =?utf-8?B?YnlOendxc21FS2lFWFpzYitVcENoUGpBSlJHR1hIS25Wb3Q1MVliRzdQTjVr?=
 =?utf-8?B?YlJFVmNiVUZRcmhSN3dTaEhjMk1CMmpMaHdEWHR6Y3hmNmVubXRjSkNVM282?=
 =?utf-8?B?dVVQQVhGbllqeVZmZDB0YnF2V0Q1TXd0cHZRWjJ4d2c3djB0OFpQOGJEdUFL?=
 =?utf-8?B?TC8rZHNvcjRQTXBVWDEwNEdpMURVRyttc1M3TStnM0xvZlF5cVUwTHpSdmll?=
 =?utf-8?B?d0xvSjdVeU9vcFhBWFdvRm43dDl1YjJmWjMyRnlYNDU3eXltUlg4cVVreVNx?=
 =?utf-8?B?Tlc1RmJETDdVeU5yZ0wreDVaR1AvVkNpM0hZMnphVEs5UDY0eEpWeDRJcFFY?=
 =?utf-8?B?bkJMeTR4a2pnb2d2Z0UyY0ZZWm4yQzNmSTFWTVlJNkZVNWFGL3JHWUVUQnNF?=
 =?utf-8?B?Z09SUkdhVGhEOHN3UC9wMVVFR1d5c3dTRGtsZHF4R0RSZXk2UDJDTzdRUHI5?=
 =?utf-8?B?MWt6WW1XRmQ0dTlVS2FVMjRFRmM2RWRCRyt4QlJ2dTFIQ1VNQ1F4TWhrRHR1?=
 =?utf-8?B?aHdNMHFzOHpoMXRZNitTNDlXUnkvYWFBd2N6czRpTTY5ZFFkZERjdHd4L1Y2?=
 =?utf-8?B?ZHFDaWxmK04wUERjNWZpS01HdHc2am1HRFBrVGthcnNodFZpZzR2R1VrcmRQ?=
 =?utf-8?B?R2ZEdU9talNIQkhFdUlYMjBhNE04RTNWSzBOUXBqNzdicWR0QTMrWklIc2RS?=
 =?utf-8?B?M2FxYlpvN0piaVRPTDJKSERicFg2VG1rYlA5dXJMdzdJV29lZ0l3cFM1b29T?=
 =?utf-8?B?NnJET0w4cG1EeEd2RE9QZVFCZDRObUl4alFGZ0Q2dy8rUTFYak80NzFDOVox?=
 =?utf-8?B?MS9Fd0hOdU52QjkrQmJ4bXlsZ0VyQTdHWm5Dc3hpM2hMVHB2Y1FuRWFGbjJk?=
 =?utf-8?B?a2JVNGJZV1lremdwTmg0amlLZUd6RVRrZ044UFFPWGtPb2NRby9udXJCcjBY?=
 =?utf-8?B?OGFuazkzS0ZydmMvaWJ3RnIwdDAxZUR6SWg0M21pQW5YWEc4T1FxQnprUzBk?=
 =?utf-8?B?dFhaRnV5amJJbHBwQjlycVFlOTZQRjhQdmVoZEpSVWVXVmNXMlN3Mkc3ZG5R?=
 =?utf-8?B?b3RSOTQwRTQ5ZSt0VndHWFQ2QkxPSGs0cFVNWGJXVVRDcEZEcnExNno4Q0xV?=
 =?utf-8?B?RVNXM1Y2eXd3QXlEUmswMzN2TmhVdmMxdC9vWWFyQXhLazFYa1RKaG4wc3hi?=
 =?utf-8?B?ZGNYQlJvd3luUHZWTWRZU3BnTi9aVTI0aUdqKzMyR2ZzaGF3VkZyMTRqWnlx?=
 =?utf-8?B?RFprZG1vMUhyYmQzaHBaSTBoYWxQRC96QlFKek1IYnFrVUI2cEsrTytwSjVG?=
 =?utf-8?B?SkI4RHF3MmdsZjZ3dktLbWNzNGpvbHJCUG44V2JPVzlnY3VRUWd6OE95MXh5?=
 =?utf-8?B?RFJzMGlzR2lqS0dtSk9XdVJDelNtdDErUGh6Y0EybmlYMVdtSFg3bGp2cTUz?=
 =?utf-8?B?Z3RCREFqU04vbWxIK2NYRXdUSzZMUFc1b0QwQjNxTlVVOFZ4Ti9KMUVkWld2?=
 =?utf-8?B?TkxsTmIvOWhlMzBkYnpRT1dkNFdMQzhsSm1oUWN1R29CUVFMYWJrVG5QVmpX?=
 =?utf-8?B?VnBvUDRTaE84SUxKVm1YZFl0OVYwUnZyMHhVMUVWeFFsR1VRbTM5Tys5K1Ex?=
 =?utf-8?B?SHR3UStKWmJZWHNEMGgydEdjT0I1MUhvTmpibHl6bTg3NXdCZ1k5c0dBM2Fy?=
 =?utf-8?Q?9hdn5GX4+yfOAMSk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45114c06-33ae-4836-07b2-08de41515dd7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 11:58:06.0160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9H4jmYIMPI7fBK28fqBXXQm6Wv7KWahr7ZUXShmynfQtU2I6NB+KAoyJLkQw0mZe8TK6sQxcPXBitlrIP05OyipBQhRA0XJ8IF0v6lgvWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8360
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


On 9/6/2025 2:38 AM, Swati Sharma wrote:
> Add function to transform the enum into a string.
>
> v2: -Improved func() doc (Jeevan)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c | 22 ++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 23 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d240c7ac5..1d059a8bf 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1801,6 +1801,28 @@ bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int
>   	return true;
>   }
>   
> +/**
> + * igt_get_joined_pipes_name:
> + * @val: forced value
> + *
> + * Returns: A joined_pipes enum value into a readable string.
> + */
> +const char *igt_get_joined_pipes_name(enum joined_pipes val)
> +{
> +	switch (val) {
> +	case JOINED_PIPES_DEFAULT:
> +		return "";
> +	case JOINED_PIPES_NONE:
> +		return "-none";
> +	case JOINED_PIPES_BIG_JOINER:
> +		return "-bigjoiner";
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		return "-ultrajoiner";

Actually I agree with the point from Santhosh in patch#3.

We can just return names without the '-' dash.

The logs/info where separation is required can add '-' while using 
igt_get_joined_pipes_name


Regards,

Ankit

> +	default:
> +		igt_assert(false);
> +	}
> +}
> +
>   /**
>    * kmstest_force_edid:
>    * @drm_fd: drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 6ef6871d5..b52429bdc 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1286,6 +1286,7 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
>   int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>   int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>   uint32_t igt_get_connected_output_count(igt_display_t *display);
> +const char *igt_get_joined_pipes_name(enum joined_pipes val);
>   
>   drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
>   
