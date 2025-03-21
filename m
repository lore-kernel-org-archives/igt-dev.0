Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E683BC36008
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 12:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781F410E7B8;
	Fri, 21 Mar 2025 12:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ty4iCr+9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE0410E7B8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742560627; x=1774096627;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UzhHREp2fa7XtYQhSeSVl2DPbF46uyLCczdQccyfdVI=;
 b=Ty4iCr+9eBfiZO+vrlGkQjN67iHUkJhj/XjmzOkw6iN4ihAGLZ92QL32
 qjKHFvW0xPGhSywnxASmGtQHAZDT7+9Te6h75KhumKdBajiM2JSFDC0Q0
 wlbQyoXy9VLns9oYlJDFB3D2Aa8AN/xPaQuxm/ia04BWw+iEfUbqzWcME
 awgOSmC7cYmxvyHj40bbxa5CpAbu2BRp25dufpKAZ5RN4X5LrFW94pY3T
 qQX25XuZTQkI3K8hfUFOd6nr/yIIuY2DTxjvKQsHlPUUjbv/KsWSDjyrw
 wu1Avquk0wFWT8UIq60L7ulSTU2T3fwSIW2CyELrdDDkPWgDZwAHtE2Yw A==;
X-CSE-ConnectionGUID: +v4/FFMqRKu/gFl6LFclfg==
X-CSE-MsgGUID: wX+ACWT1RPmMCMyLXDr/ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54460354"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="54460354"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 05:37:07 -0700
X-CSE-ConnectionGUID: 84pKUfLAR1ufDmBI14MdPA==
X-CSE-MsgGUID: IK9XMZdjQd2pILyM6RrW5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123851930"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 05:37:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 21 Mar 2025 05:37:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Mar 2025 05:37:06 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 05:36:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTzNIEf5PF8/iaWleinmiODaYLlHgyZ/7szMU6XsMldCrtwafw4gg8az2aXmL/PlrankeQCtj92GZfM1fEPhzm4GkJKqXjJt0qJ1F2yJH8X8QlpOjON9r8a9W4pv6XMBKyxaBz6SDZYx6AK06FMynFBXHfUt/XzfO6Pt7jCnmqpp+Pz0P4ayjy6yuon/KbODNSB0w9s67tnh17qNogPV4uvSxiLE5dCnDkdo49uUnrdObnkwMWh7cJ08pnSyhb+8LwEC+AVNKDdaq21UW5Z2aNzBNDlSfIS0xmbatOYqrN6MXBofUCQLCTndHVNowFsqYt4UarMiY0AZJXfuLBfhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMvTFCsNB4HxWH+2xAybinTF+hc3z7IoyYNdE/Sn6o0=;
 b=g9HDszdbyB8GHM45M5Hmb0CtPTseOYRm+0FFJ94NYlD1Q/pcGsU5fH4M9zYS34vmeBam5sR3C8VjibNhQl0E5YrslaDyOUjYaX/TAmYqH1lkAxA8SZhm3iYHKmffAVxhMRyIc+aHXauQA7CmgMHxKA2LDFxzU6e5sgkHbdOGfEdnPMZsUdS8976z3EDwl6JWYxvxG09yNZItemvUtLb+jNpA6ZzM7Oe1ICOOUP9Mjf2Y1q61ryFfFQFk4SlibKnH7hZd8lYAH7nOfPr0AdIwxmS9ueLbjbxJdnfHPjify78ZBU+TXTRIO/cUPTV/yssx8DLHEBiJaJbX+PLmQiNfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 12:36:55 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 12:36:54 +0000
Date: Fri, 21 Mar 2025 12:36:45 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Andi Shyti <andi.shyti@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v2] i915/gt/selftest_lrc: Disable timestamp test
Message-ID: <vykbd4jmztax3cmtiry6pdocmr5y4scc2q7mkgyqi3mlhj2l3l@pu2jrsklfdfv>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <n2dpynxo4qh2x6k4gum7ivl4ueb6dotssklafko7fktnebmjgv@eiqftxjmgkg2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <n2dpynxo4qh2x6k4gum7ivl4ueb6dotssklafko7fktnebmjgv@eiqftxjmgkg2>
X-ClientProxiedBy: ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::14) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 1090832d-c8d0-4bf1-350b-08dd68751009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjJRWUJ5emE0UWVuWW9BVFVxb1hjeEF1elRReXJFRWNzdHZ2OVNoTUVxRUp5?=
 =?utf-8?B?L1RUbkgzNjc0WlRhVHlPaW5EWUlkeXplWDRoelcrRk1Wc3dFRG9CWnIvL3hh?=
 =?utf-8?B?VzlpS1lyYWF4NGJuV3hncnFNR3BkYlpvanZoNUc0cXVNc3NnbGFXbFJLTEwz?=
 =?utf-8?B?ZW9Qa09HcTV2ZXNLbzFDM1lnVm10ZEhTQk9kTHB6OGNOL3RmdnFycnEvRzVa?=
 =?utf-8?B?aUwyYTdlSFFXZ3pGMEl6bFpMS2UwRXF5ZFUrZVJoOHlHWlkzTUlsWEpHb29u?=
 =?utf-8?B?eHhCeDMwT2lYUmsrcWRnWW1GandodDlMa3pYUFk5MEpkcXVPc2RpcUdnNVVr?=
 =?utf-8?B?Z0NQYnhFYmFjZG5CMFpFcGp2bWpMcUZvcER3YlFMQ3l4NjFIM1dHV29Pdytx?=
 =?utf-8?B?Q0xkRStaRExWSW1KclpRWG5jdkpBNXgwdldJbkk4TkM0N0VqUE8yem91NDU4?=
 =?utf-8?B?cFZNQ3R1cDZwR3BhSVB1Uk1ldWdreExsazFNUzRXNU1hUlJ5b210STFsTFNa?=
 =?utf-8?B?dHNDR1I2R1VlZS9BaS96NGgzUnZjVENwaUdmYkJubmJ6cWZuUHlWaU8yWjVm?=
 =?utf-8?B?NWpkczU0VDJsSzhCT2VpV0MxN0pTalVraFpsTnZFWDdCYUdFdGxDaFlMa2FS?=
 =?utf-8?B?bWNJSERMS29Sa0xJRWI1aVJLbnkrclM3NTRZUElNQnNlRnQ2azd2UUFUMm5l?=
 =?utf-8?B?cnRGZXB0QVlXbFRCaW1wMW1Qak9tVVVZMCtNOWJPQndJb3prSkN2TEQrTU9o?=
 =?utf-8?B?a2F0N2ZVR1l3Y0UvRVBGMnlCV3FMQTFkSDlYYXBkdy9JaXQzS2hQdCtJU2Mx?=
 =?utf-8?B?MDJBajdoRElUazM0Q0R5Mk14UEthMXdRQlZKblB4YUwwelpWaEV1aC9uUE9r?=
 =?utf-8?B?M3JFbVlTWTVISUpSOWFjVXBIK0hCVm1tMXBPbjllcW1jU2V4bEF4dnpSMnZQ?=
 =?utf-8?B?cFE0dStnWVlUWUg3OE1sL2VZSGt5dXBYdkhLZWVNbnFabG55MkFJZjduNXNz?=
 =?utf-8?B?WGl5ODNoWDJKd3cxMFNzb1NodTJvZ1hFQzZ4N2NYZ2kvaVk3Y1VKeFlra2M2?=
 =?utf-8?B?RE85TGNNWHZhYlUwaUZtaThwSHVIMG5nWHZ1ZWtlR1NjcUFCMUFla3k5em92?=
 =?utf-8?B?VmNZS3BnQXFzMWJUWEZFdkFyZ2NlcHA0ZGl2b01TeVJoWlJOekxPQ2RjT1RF?=
 =?utf-8?B?aWVBRkJmNVN5V0dFRE9ld2IwN0NOV0RtczJVOElOTnZKRlBQV1UvMGlSVlgz?=
 =?utf-8?B?dXZrKzZoSzB1Mi90TnE5TGtubzdYV2plcE9ScHdocXZmcU93YlcvWmNseWNQ?=
 =?utf-8?B?QXpocmRnSGtHRU9FVnIvc3BXOGwwOXc4RWsxM1VlMTAxeDl6N0J6ZmJLVjho?=
 =?utf-8?B?MG1URHRyOGR2cVdmUEx1MDhyenZSTDhJN3BIZG5ncHJLUEMzZHJudVpZTzBh?=
 =?utf-8?B?aGJtdVlrajVuVWN6VXh5R3A0MDZNSmNTc2JPL3diMU1BbXVLbG9UdkVpc0NU?=
 =?utf-8?B?VkF1VExpNnBHUkt2OGYyZWRsRDVQUHFWbHhUM1RLdzgwUFY1VnNKTUsvSkti?=
 =?utf-8?B?dmI5S1loekJOanN5UHdLMHpxa2twaEZZcDlIdmNLRlpzOGVVRXJtQlNlSjBW?=
 =?utf-8?B?cTdqd3pmVSs5bjhxSTRCM0FUblFsRzc2OThJL2x5V2R6WEhLTDlxUHNhNGYy?=
 =?utf-8?B?VlY5djZoMHU5ZEtDbGx0Q2x2ZlNaaFlKTVI2d0hWcWp4ck14WlF1YklPYXZR?=
 =?utf-8?B?UzkrUVZLWlZxSlZEVDhQdlY4TUJla1kzc2U0NStrRUpYM1FiYWxFVFNodTQw?=
 =?utf-8?B?WHphYmxYMS80cnBaMlNVNXRVa3RSY0lqbkRLTTNtL1lhUS9KQTBHQlJlbXlh?=
 =?utf-8?Q?1pdi5crMCWZ9g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXZuVkJ0a1JEMHRRRm1tQ3hKQXoybmhHcEJkUFpKSzBvUHpYeUhGdWJ6OVc1?=
 =?utf-8?B?UnhrZEgxREhjZXVSTWxqWUNYcmorUlZrbFdVNDVuZG9FZVMzY0laSWlMSlNE?=
 =?utf-8?B?SlhqME1iMDdkTEpZRHhQTW42NGNEWHlYKzdLSmZlWlBmUjhJSXdpa2tKYVhQ?=
 =?utf-8?B?U3N6blJxT3FPVHZHMTVpUlQ2ejRRcnM0VUJuVThCVDlpWFIrRVdMcTdsdlBB?=
 =?utf-8?B?dW9qYndFeWtNeFhwZWdCNGZCK0ZJRlV1Ly8zN05LMUhNWTN2ejJhQWxsTm94?=
 =?utf-8?B?eW5sQ2l3b3Ftc0FyNWd4cVJHdVlOanBNbGlNTFNXdVlIc3RPVVNVMHpwSHRK?=
 =?utf-8?B?WFoyLzZ0b2hFc1NHeWNsMndnb0I2eVhqV1dlV1llUk1KR3NCK25VQlE0K1pl?=
 =?utf-8?B?djhrb2Nua1o5QU54VE5ON0FGVkVZcjVVL25RUHlTTmhIR1F2QmlEUzQ5SzQy?=
 =?utf-8?B?MUNHdy8zdzNua0NyTXhBWjRvWXEwNGJCR3BiMTJTbmhpVFlNQlNRQTBWaDJZ?=
 =?utf-8?B?VkNKSnNwVDRRWXNZRmkxVERPaVVkNXhwOXg1L2FMdGNXWG1HTkdxMENneUti?=
 =?utf-8?B?SktpTDVRSml5RzliMWczcGZScVJUeFp4WHlsY2NiaWFsaUF6N1dteUo0dEtT?=
 =?utf-8?B?eTI0WSswYVBqODBzYlNWeFBrZHpCekpzRUtDa25mMytnU0xmVzhqZ0JCTGNv?=
 =?utf-8?B?blY2MCswT0V5SXFMeGpUREcvYnpjakdCa082UThUeTJVcWp5T0l6SnNVQUlK?=
 =?utf-8?B?MHRaVDIzaWg5eW8xWG0vdU05bWZwMi9HZEpXQ2lOOEE4ZVFxUGNCU3lNUVpE?=
 =?utf-8?B?VEFWQnByeXkrRkxHazZQdFI3S0NNdGVCTHRqbEVEK2huVUNIVjdzeHovVTla?=
 =?utf-8?B?RFNVazBCdE9sVGErSHhhREovTVMweStHVjVtYUFkYURPamNFeG50WmRkazdQ?=
 =?utf-8?B?aERRUk1iOFV3NkF6aFFZeUN2b1A0c3BtVVdMcjIyTXA2Q1d3OWpFZ255Y1Mw?=
 =?utf-8?B?L2xZbFd2UFBicWJkTjJUcjBtNVozcjVsYitxNjlxUzd6S3ZHQmp6cDh6cE9r?=
 =?utf-8?B?T1lGcTVwelk1RmM5NGtGYlkyZ05VaGZtbVJFZHdQOWoreUhtaWpkZy9xWVll?=
 =?utf-8?B?NkhxMTE0b1NINDhNWFhwekljQldnOCtRUHo2TlQ0ZVViS0V6VC9yRGdRNTdH?=
 =?utf-8?B?Q094OFFaVEp6N0lyK3FRblAxa0I3OW5nUS9CSkE4dThId1dGNmdVMUl6Z0FF?=
 =?utf-8?B?L2Zpd3B5d2JOOEdXRXpjZlVXcXNJc3FZUjdrSjFhYzdTLzd5VVhEVS9BSlN3?=
 =?utf-8?B?MWZVeDkxVUwvRHp5MmVheXlSRFZKWFBtZy8vSkE0MHFQZGtBUDVpbmh0cXQr?=
 =?utf-8?B?QlFCUFhaeS9SZUludFI0M0dsZktKc2JpMkRYa2Rra1NWSGh5UEM1MVB6Ykho?=
 =?utf-8?B?eS9OKzRFSDFUWW1vUHdObkxZeVRhTDFHR1ZKYWRvRkxqdG5UYkU4c1dCTTRQ?=
 =?utf-8?B?VCs4d2ZJTko2QWtrRjNzVEwvZlBWMDRPeTJyclJiQzV4ZUIrTitaeFA3elY0?=
 =?utf-8?B?N1o4Y2pZek8rZUI3WTRhZlJzeXRkcnd2ODRZVGFoWSt2dXNTUUYzcjlLQzFz?=
 =?utf-8?B?RW1FSjlaSWVIenV6UnRBVVBwam5uaUF5Z0dNb0tRTlhCbm1CVWtsSm8vbFdS?=
 =?utf-8?B?T1lrQUlrRGNTL1UxZTB1TVB1aTRiVUJEcXVLUHovM2dSRE9WM2JlNnRJRVAw?=
 =?utf-8?B?ajZOajloemF3QlRSV3NVdTNzajE4SFkwbVMrQ1dGMTFWTGRXWG42QUNkVFFR?=
 =?utf-8?B?UXcxZ05ONVZ1dEpTRy9SeFJsVG1OajlMV0ZNNWowVmdrcTNENm1LWUhUWStl?=
 =?utf-8?B?SDFUcVBTaHNUSlFEN3FSSXZ1RXFpRDMrSEMvb0cvYjc1SUhZODNvNVZuMkFa?=
 =?utf-8?B?VmdjSkdzZUl5ZmpNUGtZZHFMU3IyQ09HRXpYWHNhekhYQ25GOUpLTW9Nb3lm?=
 =?utf-8?B?eWtrU3g0WWhJbkZ3KzlGSlZFVSs0Q0RuWWptV2VGVStlOWlmMmdjd3VyaGU4?=
 =?utf-8?B?bkdMOHNZdDNsL1A4a0hkVU8xL2ZueHpEalBwVUhNWk9xU3k0dnJBcFdJNnRn?=
 =?utf-8?B?TjVIRGlZeXVlV0hoc0VTcnRqKzdvUXJPb1pqT1JHek9ML2dXaVlVNG1TdDJ2?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1090832d-c8d0-4bf1-350b-08dd68751009
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 12:36:54.7439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/ciy/vFo8vRQartlJ7GhFF0ox9QVpomVDwkEM/SFIJ4thUwCcDS+W1zoSKBX3pOKV0zVRzRrwucP2lwkuri2rczMLhybSCg3bPsh8+5Dn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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

Hi Mikołaj,

> +	/*
> +	 * This test was created to show existence of hardware bug.
> +	 * The bug was found and fixed in further generations but
> +	 * now this test polutes our CI on previous generations.
polutes -> pollutes
I am also not sure if we should mention CI at all in kernel
code. You could rephrase the second sentence a bit to something
like this:
"The bug was found and fixed in later generations, but it
might pollute testing on older hardware, so disable it."

Treat the rephrasing as a suggestion though.

Also, as Kamil already pointed out in one of his replies, you
might want to submit this to a kernel mailing list. After that:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof

