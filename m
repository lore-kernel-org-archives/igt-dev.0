Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CC9CD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 08:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C58610FA5C;
	Wed,  3 Jun 2026 08:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKRq3zP9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B12410FA5B
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780476292; x=1812012292;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bs2sY0JZa7PJsvdC6pnqWDvfth8L1jWf79RZe/hgnME=;
 b=BKRq3zP99wWQdacqec3/Jmv1RPurXlBGUfApmEmDw/8iVGaJkLJe/HME
 i8Q+2aNq+1f+lWiT1TTvmyB5C/tOIpkHLVEg+UCpaF3gMTpFjuvAxtBeK
 ej+IpAJVAh5NkXkeL0WbBY6riT15nbZlJutT7qFoixcbYO3DyVaJy5Lw7
 6esUbbH4FKzTpreb41vIwznw/5Wlv1G9uP8IKmgIIeTrzMJ+0JhOnNKq4
 adZktAiuCCHd6Wa8KEAUHO1T3sXlovzrDfdC738cUd8FHoTE3exh2FGCk
 D1pjoNnWDK0jO44aDQ8vtTOdOQXJY/JbtDBlWpNIu0kw4Zw6yljDmFbVo Q==;
X-CSE-ConnectionGUID: nE+CikauRyiO+duI0T4+Dg==
X-CSE-MsgGUID: gnwZHq6JRtirNjb1tzGdsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80419435"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="80419435"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 01:44:52 -0700
X-CSE-ConnectionGUID: L6UVoLADQU6wk7ky13AkCA==
X-CSE-MsgGUID: GOQg0zlkSfKaLrtVN4tRDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="282273802"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 01:44:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:44:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 01:44:51 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:44:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cai1QiCXayjbrNq5oYumjbq9YKTg6MqJ0oSUc48Se+Qyq+cOdUNpvhc/JKwX2+Dr/jFC91ZzDi3okLUHYSIbdTrGSRzm+T2uXidbVrFmtS1TZTXuteXErVJqdcL7JBkMbVPCVt63PRXvthtyfZwrCWiIo4jKI0oTf68Gtn9VGRGbs1fwsOUvPD/Pt4ZuuhBTQsXNk1ykkbInj/doEBiprJlhxX3y8RJY52nDi1B5ASSOim3sgr1BRq7ofL9JOEXn5Ye362N3A0beULOkM6QAhyaO4YI14bN1uiij+/LUW9gmCz1TOlhH1YEj5rX9yXHYloDVqW6HYoEzVOy1LYvHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9bEHjWxRrzvg2bRHgTkELqaEAt5NRTGuuv74ykpV3s=;
 b=eZt9M7j8LdzxuTByChSZltriTat5CzKX1GSOIfNBw8SN+Wiqms9t9011YcBnn4y3gYFfsoi4A5adx4M5oTFaQeDHc4TRalTUmK/dRsIqqlItJaFcB7ey2ZvBnI69Q1Lo7o6KnEwLT7g6fWEv5eW9fcY3hjTdKLpor61rzyu+4CluFrpUOqFglMUf+j2vkmmRSju8wJQ9WFVNhk8uKAPyCX2+LlcM/NPfYH5X4o105lJNDDBuxmiWhU6b0kK+bgxaY8oJnA1hAuKCgZv4OK/OMyqf5+lILDbCR948bF4wt6ZxZp2AB6hNQrDJnB2dtn+pLmg1t40fKV/kQqWJYxmyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 08:44:43 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 08:44:43 +0000
Date: Wed, 3 Jun 2026 08:44:33 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] runner: Avoid compilation failure on c17 and earlier
Message-ID: <4dn6ups7wt42ud7gheu2wv6rzdh6rzyxwswsstm6xovz3ippwp@wxbuznddezpd>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260602073220.1067144-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260602073220.1067144-2-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: TL2P290CA0019.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::14) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: fa54d05c-dd94-4a6e-d7c0-08dec14c5b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 1HD+1yV4oa3R3dZUzlFRXKDNIXtHl4rUZ07MSZWXA0Lwwt0ttN3YNe7O64YOnpgXLg92i4OuO3Vkj8MLPedjArKv2jb3PLs+MRwew6rRzlRjbUjYqyIV37zCG+nij9319hFFrWrP18nmsWW1S4f1LRK0HZ6ls2aUpNWlJloL88Ljv+CTrPMba4BOjBjrmuYbXkA27fwABRUHvbGq8mOlPvxr1L9QIy2oCkhsb5YF6qN2WybZmpPV32oIqdA2C/ZwMLEnX5r48NH20Zmoc5dR+nAfUqBv2tQR4tLoRdvGHF24RkWXjB3Shhgccw8lKFJi8mkI4DR4gR5CjMBJTk8JFb0eCdffBghG541oUhowKNjIMnKftAoO4cVt0JTXlzcKNFaOOhUCpeMiOdybC+FCHRSa6jhAdyUbMs26phkxSEqtOGJfKiADi/2NJvRl1RLnGOtuAo0VCEE9Z6rq4+lxZ4HlqbH4cE30A6JaAeAx4LQ3eL/s2n43mUASprRL6e4DTFcJeC3ifReD7CAS3sSKLORaG1rOT+tndaL9Y9wE7vPW+uPZIiUoOCioLY+f/59+Hb4fQ1b4/dPiBb0Xkfya2QmECzeQ76Uueu7TO/ttjIORa17vKQxGrbHMmzy4yCJx5I/fpOowlok8RmiUflnIS1x154k8cDQCOq97mJpiPudSifij01z+bx5xJtkN5xD5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(11063799006)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk1tOUZ0T3ZaRzFtMStpUFR0K1dKTHNPbGNvdE0zQi9PSjczUk5zaXNVVmhm?=
 =?utf-8?B?bHN5M2pVQk9hSWFNakpubVM3MS9JbFM0RFpPZmluZkcvYU4rb3A3QjBCYnpl?=
 =?utf-8?B?NmRZTlhoTHQ0K1dZdUxmK1lFNjR4OXlRd1RsWEJxcWdCL1pXSHNWRFBxM2Z0?=
 =?utf-8?B?WjRpeno1SWtCRHEzWGo5T2VzMmNOYUVqRjVvVDgzblFONHZrYXo1Y0oyUmVH?=
 =?utf-8?B?WE5ZRTFPTGtrQ29kSkg1WjY0Qzg2aERMZVpVeHZNVFlxT0tLSWNWZW5YeW5O?=
 =?utf-8?B?VTBKNjNRQjFSa0V1UlZ1ekZsR2pIT1RDald2a3RjbWt6ZGhDZ2NSR3h1aWxH?=
 =?utf-8?B?ZUNQUFN1WjJzbnlaNEdlNkp6aDh2UlpKNFhjWGl5STlibjdoYnFtellwODFn?=
 =?utf-8?B?Um1ZNk1xT3djb3BDS01ZWHllYmVWQk9NbFpRNzRvcjllVXBnNGg3Um9rbUk4?=
 =?utf-8?B?SDJVTHZZb0xrV3V1L1NDeDV4L0drelJOY3BCSnB5TmVVSG4yTE1Ob2hOMGg3?=
 =?utf-8?B?aFZhcWxYU1dBYlY1dGtLdnJHS09LU29vTU43a2M0YWppN082OVdsVDNJQjgv?=
 =?utf-8?B?UnBxY1FVNUtCU2ZmL3RTdElFNlkrTEk0TUdjVEM0bVB2WlpPWWhXNUxGWFV6?=
 =?utf-8?B?WGZuUWFZdkJEUm9hSWcwb29jN0xUT1Zlb21lSS9RYnR1Q3FXS1hsZDZ2Z3V4?=
 =?utf-8?B?TWxKREdJZGZLSnFtbC9LbWtpcXhKeVR2a1F6MjZNdVp2ekZFVWJhclJNaG1D?=
 =?utf-8?B?MDlQQlBLRkRacFBSeHZwNnVwMmxoZEFrbVFucU9DNENOSWhONlprWlNIZWw2?=
 =?utf-8?B?NjBkdlRlZTlaK2h4UUhTMG5ETGcvZURlZVA1M3haM1docFlKbGl0WjlHazBN?=
 =?utf-8?B?dDhzT2JLYStRSlYvZUFKalVMRG9hQkNSSFpsSDFmSCswMmx2bGtKVmc5T29w?=
 =?utf-8?B?WDBHaTlnK055aDI1YjNiZ205R0V5NlhRWTZ1MlhjVXpDWXVNSGVOemxOcE1t?=
 =?utf-8?B?SE1ITXBaSjFWZk9qL3NjcU56M2hkY3pRQjB4Nm8wSEJ3cGMxdklIeUpWN1hJ?=
 =?utf-8?B?aTRqcWJkMlM3cFlSMzJMZDZHYzFkMWVYMFRJMTVmU3krOW5Xd2tzNjFRMitk?=
 =?utf-8?B?Y3JNeWZjK01WdXJvLzBvZWozN2x2YThrNFZ2aG5iVHROa2dpRVg3bFRBSnBD?=
 =?utf-8?B?R1A5V1pSYVZCbkhFZzBGcjIyZ25SZU9DUjQrOTA1OS9hKzhVUnVpai9VZVgr?=
 =?utf-8?B?RGZLbG1zaEx5K1ZsZkNOSFk3ZUZwRnY0WFgyY0s0elpYRzJBZXpSMVdLMk5T?=
 =?utf-8?B?eE1BWW9ObEFmVmY3Y0gvTzRNQ29NZDRUVlhUd1c3eSt4alErdEEwc1VKSENX?=
 =?utf-8?B?cnozaDhjUGRhVzJmYi90aGl4bXFyUFlReGx6TzhJRGwyS1EyUG94bjdwN0Nt?=
 =?utf-8?B?aHFBVWNvL2JiNTdlNFlUN3hQMDFvTlNHcmU1RDFNNWtXRnNubUxxWE1iOUlT?=
 =?utf-8?B?TitrdFRWRlVremFlWmx5UE15RTViSklyaE1PWlYyYzBLaHoxaFdjVUEvUXBx?=
 =?utf-8?B?ZlNIQjVud1FUdUdXVEh2dUV4SzFlQW9tOGZ5QUJnS1FjZExSQUgvWjZZNFhJ?=
 =?utf-8?B?UjJ3QTZYQkpOWEEwQUhEZEFkRGxiZitJRjR5RjlNRzR5M0pwMjBOeFpZTFc3?=
 =?utf-8?B?T1E1V0JUNUcweVBjeEFuRytQUFV2alg3OFU5ekdKT2tXMGdqZDlPcWdsS2JE?=
 =?utf-8?B?dC95K2kzNERUb0t6MEREcVIzYXQ2VHdlNis1Ylp4OWxZT2VBZDRZb0ZLbnpC?=
 =?utf-8?B?TGxLYnc0aTlOaVBRZFQzWWVhbEJaWUE0Y3k5aElZcWpTREllZTgwUWd6YUd0?=
 =?utf-8?B?R0RPMXF2M09XWEc3RmwzdGZad1FXOVBxUFRiRlE1OGR5QUMvSkF0SFhzR3JT?=
 =?utf-8?B?SVdVU1hTc2xBTzBMS0R3RXl1ZCtNNVUzL2xFVk5kSXFMSHFidm85VTlCWVRr?=
 =?utf-8?B?WkJRR2xtWHBSeEQ1NkRxZVRBV1BneTI3ck1uZWRvSy8vNHNZbmZoQlNXZ3VS?=
 =?utf-8?B?VXN4MTJaRjE1RTBENWs5QWtaejVSYmgwaHEzMUR0dUs0dHEyVEJiNitBclgx?=
 =?utf-8?B?NTJBMWduVmVnTVJTR1ZsaFA1enI4em91bGtKeUJuYlVBOFB3VUxNb0p2b2lX?=
 =?utf-8?B?bEQ5SjJvb01MMXRPdGR2MkJwMFgxdFptUEhnSWQ5UFg5Qlh3NFpoL3VKUkY4?=
 =?utf-8?B?cDBKSHhjaDU2cDNuTHNtaVpTS09uREdLM21xK0RxTHhaSzN0OVRlemVSMjNs?=
 =?utf-8?B?TDBGS2xmYUtkTGgyR3M5VEZrYkxBRWdub2w4K2RncFkwdGZSUm5iMUhCQWJY?=
 =?utf-8?Q?xEHnfV3++iZwGkiQ=3D?=
X-Exchange-RoutingPolicyChecked: realFlnZKNsfEW8bYriAMuxa8Oh2kuIWd3JlUKV6rJYCMr7MPVwgRxnaAxp55ZN6UCjT5sbbOQ/ArOfOzJqRCu8WrBR3vU18yO1xjnHLBwb1IJwsj7zL8K8MyXkl4GZ9JxlXK568u5ojwYqIXOnwrOCpHNPcS2MVQL0mYZSKU7y0bhpI3F6ETcGYZeM7da0Q5tctY4rOQtN5+I0Vp7JmQO66bZ+fLUb2Fg0B0at/TwEazSC7maXUyx4ceZEbpikH+6Y5csNkgtDY9i2cFkDFp8Tbsq8hFnz5/W6YQEkpmMkYENcQtzn/pwgpzMlm0uCUndScpJy/UNvD8UAXDgmTNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa54d05c-dd94-4a6e-d7c0-08dec14c5b8b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 08:44:43.1878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKxxsggUQx5wF8spxR9KO6VabqjNOW6HiD+WLkEWJq18VnSATU70oPd31oWAXYFw9THcwqkzJmN2yEyPAmrNzrSydQgVXjHyCU0x/gd20ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
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

Hi Zbigniew,

On 2026-06-02 at 09:32:21 +0200, Zbigniew Kempczyński wrote:
> Older compilers don't allow to define variables within switch/goto.
> Move these definition to avoid compilation break.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---

I didn't notice these errors until you pointed them out, so it
makes me happy that you addressed this :)

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
