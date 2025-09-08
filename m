Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DE3CA1016
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 21:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926FE10E207;
	Mon,  8 Sep 2025 21:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDlNvF42";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC4E10E207
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757365822; x=1788901822;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=z0v+zPKbHv86/N6BIf8aYbmKknZbMvaSaxC7YbaHDgw=;
 b=ZDlNvF42LA+fGUXL+wn2QpFaD//Zh2X1smc+MCePJ4SlNIpxd53IpJIQ
 BvAGZQIFRyUjgJICmg1cTX5uPljAUnva4UtZbND/ExxBpP7BwkqcGeCZ8
 UoVg0vuMe6nznysk2l9V+uc7gdk1613rNLVTfBqBP1jgJknSU2NSV1680
 gloCFE0RC9tHI4goV1SUVS0w5Cz4qWBJl/IK4Nt8NT9hE+Q3O6sogwCq5
 jE0S1ev6yqLcSF1OTFUniTIAFcjWa6fx1Sjof4UTUS3qxQup/39E0dlFa
 wM0n8UOgsvhWhEAlHkR7odeXAKu6+0hZICxo7eBfdNP1L5KlNSdhtchFi w==;
X-CSE-ConnectionGUID: pnePgD7BR1SKzjljgLN0Rw==
X-CSE-MsgGUID: 8+pZ8h0JRqSReU3zjTJniw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59497049"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208,217";a="59497049"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 14:10:21 -0700
X-CSE-ConnectionGUID: t4VBtJxzQHC3JBbS3NWktw==
X-CSE-MsgGUID: f+ByOXQuRt+sR/VAwPY1CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
 d="scan'208,217";a="178128222"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 14:10:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 14:10:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 14:10:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.86) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 14:10:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fn1PtbcKLY55d1ld2eYel31teSgAJHbfPh7BoX4yR4ShZxyEBAna1j3K/OrsNDWBsMGZwU7T14MhBfXBF2EvL6iTWRIEVGpPxYEI273GH0p3TkOi8Ug23AOM4KuXF+r+fvG4FOJTKqNanuVeWR234ZAcqNdsllvdFw5aNFln8Ey7idSK89rzOfLuqBAZ2VGlPfw3BpW0kAmliGzK7p85qItpJGof+tKW2Gv0JELd2LnZvlNJFDohaZap3vA+/meQ+Plk3vORMwF0ua+rg/lEjyaNuLReyryE4OqylhU5VQIPjJiqYMxLyMhc/lRIrZLOMYibb78MX+8OeqZJX74CNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/U9vbtzEf5e3KBdF/tdLctnh+c+O7k4BscNC8RiV6wg=;
 b=zB5PWKL7VrE6VD8TvN3F6xgWfwgB3wTtuHUl9f2+VOIiIZBd/inVdQ558fkVIGX62Ahto6kihHkKEM1Uj4UNlfCGJu8M7v+1B/6xzdzoIrfaJskVpDVoY8S8v8d307ntAMSoVd1FptpiIugvk700Vcot6gjDDH6+WF10QboT6NV1ufOHG7ZkMWnO0gVXmFQCzuZno62A7G5rm0jsm+VEf7GXSu2vCtWs+dhQeJUX9kcLoLCNtJCroHo0P+QLIQoN/i5kXiFoKAgnl1pK1KU6DIzdFaQ7sEhBc9IinbaKhcxp6iyCYbPKoTjIv0AKZqHNlJKsv4u4nxDA5LdM3YWCSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 21:10:09 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 21:10:09 +0000
Content-Type: multipart/alternative;
 boundary="------------s6EinaXDevoJgTgIHD6HCYKd"
Message-ID: <d5971fc1-5a61-4b40-84e2-a7b7635a276b@intel.com>
Date: Tue, 9 Sep 2025 02:39:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_fb: Add helpers to identify planar
 and packed YUV formats
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <kunal1.joshi@intel.com>,
 <pranay.samala@intel.com>, <santhosh.reddy.guddati@intel.com>
References: <20250716092036.301862-1-ramanaidu.naladala@intel.com>
 <20250716092036.301862-2-ramanaidu.naladala@intel.com>
 <20250820140013.hupfwi6v5iku6hmn@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250820140013.hupfwi6v5iku6hmn@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|SA1PR11MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: f99fac13-9e85-4cc3-858b-08ddef1c17ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2N4NTFrYWxUN0FkN09mQUo2UjBISmZDVlpuZ3ZNbzFaOG4rQjJhTkVzVmdY?=
 =?utf-8?B?NlV5aVI3NmRpUlNabW1MbVU1R0JvNkxFUHJyMjF3ZlUzaExaSU9TUTVPOXhJ?=
 =?utf-8?B?aVBDU2ZGUDFTRXplUnRTRzBXWkRxSGVZbFMyOWZVM0JHSHdleW9OejdnWEp1?=
 =?utf-8?B?MkZpSE1IbnNRZCtkSzVXTndJRU9ueWVGSWVhcnh2bFM5N1ZqWUtHaDZIUWFR?=
 =?utf-8?B?RU9xUWsxWjZXQzZ5WTR4dnVoY1QzbDZzTmYwRGFLUWgyKzArNFdqT2FiamRS?=
 =?utf-8?B?WHZHQU9MbGkrT2lXUXpQNlk0cm9la2ZBcXZTVE1LOUJVdWpHTGR6c0diVDlh?=
 =?utf-8?B?bGpmOThFMGM5NXFEMWV3eW1QallzNHJXNkI5Z05Mdmw4cjRLUjlFM2dVcU41?=
 =?utf-8?B?WUtVVmdpMWl0ek0xN0RpblA0cFhWQVIzcGtObjNzckVvM1FXdGtiMG1tQzhr?=
 =?utf-8?B?dXFpUTFzTW84MWNDNE9SK0FKTDFmWnNDWGFaNXBDS2VkTUdhbEx0cGR0disr?=
 =?utf-8?B?TmVGc0FZNFJBZ2IrQ3gxSEVtWnM3TXEvaGlZNXZONEVtQ1FDT0hHdzFMWis5?=
 =?utf-8?B?WWVTR24yby9EdGtGa3A3ckt5S1lDVWcyNmo2SnBDVmRxZTNQcnNYTlZFRGUy?=
 =?utf-8?B?U09mbVhNOVNhRWVUTTNMSnBBbEF3d0c0UVRiOHk5eXNPQk5jajF5WkNzR0pa?=
 =?utf-8?B?MHZONXVqRytqalVSK0RaR0RYa29nRUZiRHc2eTUyalAxMzRsWWEyYm9keSt1?=
 =?utf-8?B?dG9zVzdFL3RxemtNNEJ5SDRWbityZ2dWUUtETlZNdlJrUzVKOXFUK3o5aVE4?=
 =?utf-8?B?VSs4dGE4UExvWkxzanNkWFltbVJUWE00Ry81QTFpV25lZlE1VkFSbkNuS2F5?=
 =?utf-8?B?K0ZmZnJocncrQVZJQVNubXFFcXZhVWluZHR5L3Z2QTZEKzBYZDliZEdHbWYv?=
 =?utf-8?B?elBDek9lZW5iZUp2WXFJZmsvL3FvK0pyMTdpRzRnQUZoT3BneFZBOEIzMk5y?=
 =?utf-8?B?dXhFTHdsdHcvem9zbWF5blpZdjRCMWUrbm5nNXFEaEdETlpKbStlY1plRU5o?=
 =?utf-8?B?ZVpqblRJcWs1THFWU0dacmxCMlphMmtSOTk5bXNZVW9OTWpBMlBYN1phMVpa?=
 =?utf-8?B?ak9FaHFiUldEVTVqb1NPWlNoS25pK3ByQmZYWVFDa2pSY1hkWU5TLzNDR2V5?=
 =?utf-8?B?QzdTYm83UFR3ODRGMzZHbXZXSFpITXBaQThtUEptVm5IekRaczRtb1FJL0ZU?=
 =?utf-8?B?Nkw4TUh1ck8vTC8zRkVuQ0U4NEM3TWZ3bTg5MFZtVWhwWFdGWGJMWW8xekpH?=
 =?utf-8?B?b2hjcjhJTVA4MzdIL1FMLzIrZjhwTU1iOTYrdVRBOW03S3lxWU5XazB5U3h6?=
 =?utf-8?B?S0hzV2p4Sm1xVjJRVHNZTnpJeHhQYWNtbllRSjg3T2dSY0tIdzZSdUhRa3VJ?=
 =?utf-8?B?RkFaV1JYRFFnZkZncVUwbVo5bkNoM1J2RzkxMWRqWEtDSmhLREZJcU5DMmZ3?=
 =?utf-8?B?YkM5bFVpWHh5cUhHemozVktYbTlxelZ4czVJcVRxZHU1dE45ZlI5T3llNXNO?=
 =?utf-8?B?WmxYNS8xR3NsV1RMQWNHTGNkQW4xUmpwNTVJUXVJM0hFMHA2SzRxejQvMlIv?=
 =?utf-8?B?RmN4VXhDelg0ZmlaOTBPVXJLeHBmVG1zbk4zSzVJZEZnK0xVdXB4T0owVHcv?=
 =?utf-8?B?SDdPdFNHWEk0YTY0MVpPVGQ3R2ZTbFlXOHFDcSt5bjJhbUtMb2F1dEZNeXpk?=
 =?utf-8?B?bW9jdXA4Y1dFdnFRL1N2aGJndGNNNjJuSllyZmJ2eFFYbzFxU2g2clN4c1Ez?=
 =?utf-8?B?alhMK01ySVV1Vmk0L0l4akdXcHlXbjBPdUhLcWw0Wm5iT1h3NDVTNzB1WCs1?=
 =?utf-8?B?QUFMRmN2d2Z1aTEvQzNSMVFkRHFSL2t3b0Y4MHY0SGw3L0tBL0FWc2lneHRw?=
 =?utf-8?Q?Q7QCNzS6srw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkswS3VLcW9TdmM4NHNqZjdIVTljcHN6alJuanhYMkJXOFo5YTVhWXk2UG5v?=
 =?utf-8?B?R2lBc3FHQU9RQTBkTW0yRVVaU0J2SW5xMGFLNnpwWmorcnFJUVN2QnhzQ2ds?=
 =?utf-8?B?b3Roa24rUTJlcE9tZHp6NytpVFFzT0dlbjhRU0xvRzRLV2ZsM3lYWjZZWXdk?=
 =?utf-8?B?WXpvVTVVQVEyWit1R2tnSTJ4MWJXS3phbThQYVpMVFRMWnZOMUIzcGpKQlht?=
 =?utf-8?B?S2NNV2dIbGh3RDVYdTdaRzZsSzUvaVZQVkZqTzgrb3ZLcld3ZmYwK2h6MDUx?=
 =?utf-8?B?enErV2hPRG4rQS81MElyNzg0dUR0L1dtZ1l0RE93QS9vTGZQQ2ozQzlzbzNI?=
 =?utf-8?B?dTljMFE0U05SN0trZjZqZVpubzNBMW1qaEp1QlhSNGVlbkJkd3E2cFRpK0Nw?=
 =?utf-8?B?eTNET0diaFJ1UEZtbjFsLzk2OTZ2SjBKdjc3MUJSRS9HY1Z4OHlPWjhiSnpn?=
 =?utf-8?B?V2JtZVBqU2ZOaWUvbnR1OUpTU3puOU45UmQ2U2llSUFTczduOTRWRTFoeG1t?=
 =?utf-8?B?QUppQm5VSEd5cFhaY2EzZy9zb3Vmd0pYdEJ4MzV2aXVQZnNuRFNrOEJPU3JS?=
 =?utf-8?B?bmZJb2g4NTBYdmRaaTlLdjV5VnpNYk9UU0FuOWpwMERUbnk0NXU5aWp4SjhR?=
 =?utf-8?B?ckZBVTkvYUxVbWUyaWYxR3kvOTZEdGFOaVRGMXR2dnljU2d4MEt5S2U0Smc4?=
 =?utf-8?B?QkgwTUZFVEptejlzUWN6cFN0MTJ5WkF3TDhlc2g2V3pPc1RoaHVoS3pPbThr?=
 =?utf-8?B?REx5Y0p1TFMwSHdaZml3T0UvQmNPZ21NMXh0eWJnOVpvSFRhc1R1MGpaTUdB?=
 =?utf-8?B?ZEZ4Yk1PS0diZnpnZmhDRkVJS0N5bjhSaWIvRjEzRjlKN3Zkd2JzZUw0ODg2?=
 =?utf-8?B?QTNpRnhrOWRKVHNlWmRFcUlhMDVkN0NNVzh6eldRWlV5ZUN0ZDB6U0RLYVV0?=
 =?utf-8?B?TjEvSXhOSDR0enpEb1FkaG9vRll3YkQwemhzcUQ3UldVcFoxTVFhTjIxSC9o?=
 =?utf-8?B?cTdJZE5lR1ViNUpFTnN3eHFRN216QWEzOEZVdDdYQTdRVDVOU1ZwaGNqWDB6?=
 =?utf-8?B?bjRqcElxYXg0UDRrdzJobDVpWlc5YkF4RWM5VUh5K2cvTFBDcDA3MmU3a3du?=
 =?utf-8?B?cFJLTkVUMW9CMGN2bjhhbkVhUURFQVV4NHM5RjUxUHNRTFkzbmxacjZCTERr?=
 =?utf-8?B?VzJVanJ5WklJZzVORW56VEpycHl5L0YxdUowTHJHdCs5VEUvbFpoTkJxNlJn?=
 =?utf-8?B?bXRWNHFQZkR3M0d6WDhkcW8rd0dDYnVjRHE0QkVZL09KUFAvcEF5cEtjN0do?=
 =?utf-8?B?bVBad2JUNWJndnEyWUhKL2p5QlhvS1RFRlY3UXlXcTdPM1diSitKcUZTUWQ1?=
 =?utf-8?B?cVgzejFYdk1KMzN6Sy9SVzhKWVNzVmtiL1VxZnZud0QwamU1N3QxVTBidDJo?=
 =?utf-8?B?NmE2NW94K3k1QTZwR2NKR0h2QTc1clFaNk5pZmp6OVF6c0NTLzNvdVhwQWhM?=
 =?utf-8?B?bUNDSER6TW9Ca0lGMEFOR09VYnVKUm8xaEJrR01LZ2dPSk5wRXhrcFJCdmx6?=
 =?utf-8?B?Mm00T0pHQzJGMWdyUGFmVlBGNzJEMHNYODJDV1Z3WHRBN24yNUlENWtNNjhZ?=
 =?utf-8?B?VkJkbEdmR1BhMk9BNWd2dlRDK293N2RYdE9xWFIwZ2k3c1RxUW53WC9CMHQx?=
 =?utf-8?B?YW5JZm5ONTR4M3lmMWtFcXh3SW9aaFBWR2ZjbVhGZmZvK2IxcVBsajhXYkIv?=
 =?utf-8?B?dDMvb2taN0hud0ZtTkNhOU1JK2FjSmZldW1VeEhiTzVsbVVJTGZvQkdMQ0J2?=
 =?utf-8?B?cjJsVDZSQVNZUHlJWUNzOTJCSEJER2JOUHNiR1gxK2NHZjZZNEVRL2s2WjVj?=
 =?utf-8?B?b2VaUGg0aGpkOGtDbnAxVVQ5aXU5MU9qY3VsN0VrME1La0c3V3d2cW1oNHA2?=
 =?utf-8?B?eHNPVVJXbWY2WHI4WW84T3pSVkxpeGd2WUlRK0JMbWY5TldBdk5rRkpqL25V?=
 =?utf-8?B?dzZZQXBrcjM0eXdTb3pHOU85Tkp4NnFNYWF3dVdLd2pYOGNOWXB4YnB2T2Ji?=
 =?utf-8?B?bkRsSEpMRUlGQkJBcnIxalcwYThXUmhIQndsN2o2VHlHcTRubzhza2J1bllJ?=
 =?utf-8?B?aDhFdmN6RTJOZjFWVFNyMlVWbEN1RklFa3R2amw5c1VYa2crb3BWQU51QWE5?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f99fac13-9e85-4cc3-858b-08ddef1c17ae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 21:10:09.4400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1nNEPhNf3sh/C1KUtpbIjbJHL0w3itZ1bS5PU9wJ+kUsrTjd8aiGi8BRVHUpP7FCSwOARXk7+EJ9iN/NvSVBDffY0/fswzCTO23vvvDs28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
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

--------------s6EinaXDevoJgTgIHD6HCYKd
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kamil,

++ Santhosh Reddy Guddati

On 8/20/2025 7:30 PM, Kamil Konieczny wrote:
> Hi Naladala,
> On 2025-07-16 at 14:50:35 +0530, Naladala Ramanaidu wrote:
>
> in subject there is 'v1' while it is 'v2'? Or am I missing something?
The same patch was reused across different series, and this version was 
submitted as v1.
>
> Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_fb: Add helpers to identify planar
>> Add new helper logic to distinguish between planar/semi-planar and
>> packed YUV formats. This classification enables more efficient test
>> coverage by reducing iterations in IGT, allowing tests to focus on
>> relevant format groups based on their memory layout.
> Please add information here about what changed, for example:
>
> v2: add helper functions (Santosh)
> This is following Santosh suggestion so add here to Cc:
>
> Cc: Santhosh Reddy Guddati<santhosh.reddy.guddati@intel.com>
>> Signed-off-by: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
>> ---
>>   lib/igt_fb.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_fb.h |  2 ++
>>   2 files changed, 59 insertions(+)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index 9fc1bfc65..f68aeaf42 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -5044,6 +5044,63 @@ bool igt_format_is_yuv(uint32_t drm_format)
>>   	}
>>   }
>>   
>> +/**
>> + * igt_format_is_planaryuv:
> Add '_' before youv, so it will be:
>
> + * igt_format_is_planar_yuv:
>
>> + * @drm_format: drm fourcc
>> + *
>> + * This functions returns if @drm_format is planar/semi-planar YUV formats.
>> + */
>> +
>> +bool igt_format_is_planaryuv(uint32_t drm_format)
> Same here:
>
> +bool igt_format_is_planar_yuv(uint32_t drm_format)
>
>> +{
>> +	switch (drm_format) {
>> +	case DRM_FORMAT_YUV420:
>> +	case DRM_FORMAT_YUV422:
>> +	case DRM_FORMAT_YVU420:
>> +	case DRM_FORMAT_YVU422:
>> +	case DRM_FORMAT_NV12:
>> +	case DRM_FORMAT_NV16:
>> +	case DRM_FORMAT_NV21:
>> +	case DRM_FORMAT_NV61:
>> +	case DRM_FORMAT_P010:
>> +	case DRM_FORMAT_P012:
>> +	case DRM_FORMAT_P016:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +/**
>> + * igt_format_is_yuv:
> Incorrect, function below has other name.
>
>> + * @drm_format: drm fourcc
>> + *
>> + * This functions returns if @drm_format is packed YUV formats.
>> + */
>> +
>> +bool igt_format_is_packedyuv(uint32_t drm_format)
> Same here:
> +bool igt_format_is_packed_yuv(uint32_t drm_format)
>
>> +{
>> +	switch (drm_format) {
>> +	case DRM_FORMAT_Y210:
>> +	case DRM_FORMAT_Y212:
>> +	case DRM_FORMAT_Y216:
>> +	case DRM_FORMAT_XVYU2101010:
>> +	case DRM_FORMAT_XVYU12_16161616:
>> +	case DRM_FORMAT_XVYU16161616:
>> +	case DRM_FORMAT_Y410:
>> +	case DRM_FORMAT_Y412:
>> +	case DRM_FORMAT_Y416:
>> +	case DRM_FORMAT_YUYV:
>> +	case DRM_FORMAT_YVYU:
>> +	case DRM_FORMAT_UYVY:
>> +	case DRM_FORMAT_VYUY:
>> +	case DRM_FORMAT_XYUV8888:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>>   /**
>>    * igt_format_is_fp16
>>    * @drm_format: drm fourcc
>> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
>> index d5aa1e88a..ace02a960 100644
>> --- a/lib/igt_fb.h
>> +++ b/lib/igt_fb.h
>> @@ -220,6 +220,8 @@ const char *igt_format_str(uint32_t drm_format);
>>   bool igt_fb_supported_format(uint32_t drm_format);
>>   bool igt_format_is_yuv(uint32_t drm_format);
>>   bool igt_format_is_yuv_semiplanar(uint32_t format);
>> +bool igt_format_is_planaryuv(uint32_t drm_format);
>> +bool igt_format_is_packedyuv(uint32_t drm_format);
> Same here, add '_' before 'yuv'.
I will float v2 for the above suggestions.
>
> Regards,
> Kamil
>
>>   
>>   uint32_t igt_drm_format_str_to_format(const char *drm_format);
>>   
>> -- 
>> 2.43.0
>>
--------------s6EinaXDevoJgTgIHD6HCYKd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Kamil,</p>
    <p>++ <span style="white-space: pre-wrap">Santhosh Reddy Guddati</span></p>
    <div class="moz-cite-prefix">On 8/20/2025 7:30 PM, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250820140013.hupfwi6v5iku6hmn@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Naladala,
On 2025-07-16 at 14:50:35 +0530, Naladala Ramanaidu wrote:

in subject there is 'v1' while it is 'v2'? Or am I missing something?</pre>
    </blockquote>
    The same patch was reused across different series, and this version
    was submitted as v1.
    <blockquote type="cite" cite="mid:20250820140013.hupfwi6v5iku6hmn@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_fb: Add helpers to identify planar
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add new helper logic to distinguish between planar/semi-planar and
packed YUV formats. This classification enables more efficient test
coverage by reducing iterations in IGT, allowing tests to focus on
relevant format groups based on their memory layout.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please add information here about what changed, for example:

v2: add helper functions (Santosh)
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is following Santosh suggestion so add here to Cc:

Cc: Santhosh Reddy Guddati <a class="moz-txt-link-rfc2396E" href="mailto:santhosh.reddy.guddati@intel.com">&lt;santhosh.reddy.guddati@intel.com&gt;</a>
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Signed-off-by: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
---
 lib/igt_fb.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  2 ++
 2 files changed, 59 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9fc1bfc65..f68aeaf42 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -5044,6 +5044,63 @@ bool igt_format_is_yuv(uint32_t drm_format)
 	}
 }
 
+/**
+ * igt_format_is_planaryuv:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Add '_' before youv, so it will be:

+ * igt_format_is_planar_yuv:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * @drm_format: drm fourcc
+ *
+ * This functions returns if @drm_format is planar/semi-planar YUV formats.
+ */
+
+bool igt_format_is_planaryuv(uint32_t drm_format)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same here:

+bool igt_format_is_planar_yuv(uint32_t drm_format)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+	switch (drm_format) {
+	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * igt_format_is_yuv:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Incorrect, function below has other name.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * @drm_format: drm fourcc
+ *
+ * This functions returns if @drm_format is packed YUV formats.
+ */
+
+bool igt_format_is_packedyuv(uint32_t drm_format)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same here:
+bool igt_format_is_packed_yuv(uint32_t drm_format)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+	switch (drm_format) {
+	case DRM_FORMAT_Y210:
+	case DRM_FORMAT_Y212:
+	case DRM_FORMAT_Y216:
+	case DRM_FORMAT_XVYU2101010:
+	case DRM_FORMAT_XVYU12_16161616:
+	case DRM_FORMAT_XVYU16161616:
+	case DRM_FORMAT_Y410:
+	case DRM_FORMAT_Y412:
+	case DRM_FORMAT_Y416:
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_YVYU:
+	case DRM_FORMAT_UYVY:
+	case DRM_FORMAT_VYUY:
+	case DRM_FORMAT_XYUV8888:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /**
  * igt_format_is_fp16
  * @drm_format: drm fourcc
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index d5aa1e88a..ace02a960 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -220,6 +220,8 @@ const char *igt_format_str(uint32_t drm_format);
 bool igt_fb_supported_format(uint32_t drm_format);
 bool igt_format_is_yuv(uint32_t drm_format);
 bool igt_format_is_yuv_semiplanar(uint32_t format);
+bool igt_format_is_planaryuv(uint32_t drm_format);
+bool igt_format_is_packedyuv(uint32_t drm_format);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same here, add '_' before 'yuv'.</pre>
    </blockquote>
    I will float v2 for the above suggestions.
    <blockquote type="cite" cite="mid:20250820140013.hupfwi6v5iku6hmn@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 uint32_t igt_drm_format_str_to_format(const char *drm_format);
 
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------s6EinaXDevoJgTgIHD6HCYKd--
