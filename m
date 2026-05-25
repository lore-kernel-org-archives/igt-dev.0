Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52A6CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 14:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DF910E3A7;
	Mon, 25 May 2026 14:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9Fm4Y1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11C210E14B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779719637; x=1811255637;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eLJInzAsxzbOQai+KMPVW5ndWlZBgDZYr2/qmC+d+Eg=;
 b=R9Fm4Y1xZ+o0epZXZrm/XCOelYsD8eVgf8yMmLX1a69kuLQnXTjL72ZQ
 oaDIPEN/alOaoKoeOylQCiY0MIUs/3u3Z66eVJ2pR0yez4s/1kRGQYsAh
 yJNW9Deh/8U6ILveKGJa6UypmDskM2IaOokFUdFVrJUfSUUIOlT0LB+hg
 RxgZLYgy5jboPx2xLvUgnWIj2VLbRoRtujRIFZxi5lGk2vfO8G3azhAqP
 WK/pScEYTyy418+zVmOlwHvK1sozpzOQrRAwg4LOSv4Dv6vlrWNllZ1Sp
 awr0lFmxikJcjA2AfrkPCH4GMuaeOmPmBwKsTshqV+6e9ZoxF4mhS6Xlh w==;
X-CSE-ConnectionGUID: ZaUAEEY1Q32f76g0qTDfVg==
X-CSE-MsgGUID: LdB9F/ZqTpGa+VT6bftSeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80597361"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80597361"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:33:57 -0700
X-CSE-ConnectionGUID: szH9TeUyRVKf3B3ThhXzjQ==
X-CSE-MsgGUID: uX4unHSMRcu5ifAaSxMTaA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:33:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:33:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 07:33:56 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:33:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKZDrRT6RzE3OVqyamEAvsAqS/6/150i49XYrgpvJtBCWG9h4u498I2yudRFlAMw0r1NmWQaby2JogVdoNyxDAgsjeXvib+jIBwSflzdQiX4PuSjh0VrpdpR/oTC1X8XtR8TFLlxf2yd6lTKgCa/DuYi9/vZYRmwopaGmbgNHSauCyxU4ZLfU9Uy2lHz7o4FGcJuW2GXDGQdxUH+Slflxvt3sweFhGZWfNGHw/clJsXZyhwxGB7To9Aw9YrI5zQRs4D6eXrasUQ9aSqy1m0OkByeJALpOK8aC1NBrjYht/U6A6yyqN1rgK0ANvoPhNuZKlQJpEw4rZoft/GCn9hBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyCmMcuC5ONHGLOVbpdsrlcqcjz6idCUahZGz8ygdbI=;
 b=gMj7njccy06NpcDkgHMTKMvjwCJTa79Xi+0LFkVpmf/LoMSdTqSAbvFmJyPSGJo4WsqDpU3+AtK3V074YwYzHrHaz6x6tR2Y29TPr6z9P3QA2pxjY7GncLUVBWTP/FQQwTE1X1qLKUywaDfI55giJpR5vom7sWDafaV05YSPOJxEpvytkO2oxBbtd6mzMNrztHp0jyqFkoYjCqUnEbOmiLgen/1bGR/4al2FZAAJDIhFUGWKqvd+1BHz5aG5QCZjPsPfOkMSC+Xg256NGJkIuVwdGaQ14IsuRVYAheSvY1eWHyBZl6GlIbKZoT3woieX/NCSkQuienftTnG3r1hwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SA1PR11MB8394.namprd11.prod.outlook.com (2603:10b6:806:37c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 14:33:47 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 14:33:45 +0000
Message-ID: <40e0df88-b335-4a07-97a5-14a812b32a21@intel.com>
Date: Mon, 25 May 2026 20:03:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Remove deep-pkgc subtest
Content-Language: en-GB
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <swati2.sharma@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
 <aeIo15_JaYs0A_Y7@intel.com> <937ff9a3-ff20-400c-a634-d3eb493556d4@intel.com>
 <ahRaIc6kM1hGLZrt@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <ahRaIc6kM1hGLZrt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0161.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::12) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|SA1PR11MB8394:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9cb292-a990-46b9-0cca-08deba6aa079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003|11063799006|3023799007|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: c3D0wuktJ+wt1BeF/AzL9Uxdk0FIkjk5diUEX9mzrsMmYwUJlXckDw94MomqjzR9w8yzM3ye1RAZ0jLvLKYMnuzxjERIxtOa0cJBxyqXXolFMYAb++CZGbC1BN1MRxKsYvWlOU4Bt9mAYuAdXPv7kLDkD3pr36pKAq+xi97gYDUBMWsq3DYJexf7zYj3ej03/Ykgyf1QfiiRaSHATHdCsOBgMsFeVznQJJPUmaDEw7VyaRIjFKLmXDdUkY74QIeV8RZG/VD6OhEC1/riT7hsjFnWZXzLdzUPnAIVvqGEx+sTyDA4UFoLwZzpfT/xPVvM3GeEgS4BRIR9xN1a+iMwnAYHIkwwKOMwXud04p5rIQGuUu3HlkW++M4t41Eh4qQwLpHokQAddAFmfMLOW30FGHXByXeXbNCbLb/dp68Oz7Y9WkR0udnyRkqQrJzesboCTJiNKYbGU8hDoq3hwW81fm42y2VE4Y11Z40DWCpPV9P8jPEwX/7Prm5n/EDASaYTSQwG/5+RRo0hQCGfoGMltZzFqUO4f8DV1xoX2sbig/yg5Pk3QArE7atx2Kk9F5S/rL3V71cL9paKu5kzvjdpZj9T4ltMwH2dWNco8H7hqUqVJZ13+sH8Q3Q4r+xbwGYnhaQelSibnjk0yAYAi6zm+xxPLK6qAO6Zjc97YFoF2x2IoF+LYg+Q5a4mJnomNR6V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(11063799006)(3023799007)(6133799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGVhZnA2T1djVWVPRFcySDNYOGZJRnBLYnRZc2hyUC9HZkZoTmJpTHptR1dW?=
 =?utf-8?B?TG1jb3RZMVlOdGUxVE5wSGdhekpKRjJGeUo4cTg4M2N0Q3p6bjkrVnlyZzlD?=
 =?utf-8?B?dCt0eGlueVV1UGZyWVN3bVdMMyt2NkhxVnUxZUNyR2YyUmFYZ2M4V05HNHhE?=
 =?utf-8?B?RXJBaW9CaERzT3l5QzFhUE1BaEcvam5sdzhwZ2VoUFEwRkV1SnBLNHdiUzl6?=
 =?utf-8?B?SXFLMGx6b2c4SEkvTEpRUEt4ZURmeTYxZmdYLzFPSUR0YTc0Mk1qR2ZRODhS?=
 =?utf-8?B?cjcwUXdnMUFXMkdpdWVmNXVpMWErQkJUY0NPVmIxelFjK3laZFBJU3lsU0ZT?=
 =?utf-8?B?aEozeXhER2pkTmxQUW5PSm41SkRHclhMaG1qRFFrcGptSm81YWRHODFVaEY3?=
 =?utf-8?B?SHBETHFUZ29rMVlGNWxKRmZ0ZVp1S3V6RW1YaVk1d2hDY05VSVMvb3NNTzVC?=
 =?utf-8?B?SXlHMkdiT0t2Nnp5MWdQMVN6WjlnR3FtdWhxL1ZpaTNSc3RBUjZBVHkrV3hy?=
 =?utf-8?B?TGgrZVlWLzVLZTBXY01MTHFZckR1c1FYQlE4NGp3Q3RReGlFZHh1MHJYK3ZM?=
 =?utf-8?B?ZVdhbkZ4SHJMR25aeUhybEJRMXZSSTRHeTJyc2MvdVFCdzdaQnczVXBVbnhG?=
 =?utf-8?B?MVg0NVBVNjA3Uzh4TUJWcW8vZEM4SFlnTGdRcUNHQXpwNEtzaXA1QVN2TlhW?=
 =?utf-8?B?NVcvc0lWdXE2eE43M2dvZWFBYWlSNGdCcFBwM0ZFRzVjY1lXODhjOTVWTHVS?=
 =?utf-8?B?M3dDaVE1eG9OWlFaY1h5ZXFIYTZsckVjVGM5T1ZiQTZHbnF1RzlMamZPTWkx?=
 =?utf-8?B?MmE2cmF1UzFVUVVlaXFCWGZOVnNacDVPNHhRRU5Cb1ozbHAzUHZaYTZnOFpN?=
 =?utf-8?B?dER1UzdvNU14ckowZGFldWxnYUkySXRmbW03dUdzaVRieFBrVlRSZXdDNE9W?=
 =?utf-8?B?NkRjZHhsUWN5cnZYYmN6YkxFdVUrK2FJRlNoRmFyOVhmeXlINUhiK1RibDE1?=
 =?utf-8?B?QXI4L050aHRyVGxaTURXeWQxMzArUGtSa2UwTDhhRVMxQ3FQVWVGOFQxcmZy?=
 =?utf-8?B?MVVoeC9xWUwrbEJGQjhwbEVtTTlTZlFSYmg4OU5DL1pVMUx2TmVSZVZzZGdW?=
 =?utf-8?B?c1NyQithV3c4S2tBY1BMMEViUmlsWHMzTDBRYWpXV2pyTkZ4ZjVaMVpHbHlr?=
 =?utf-8?B?MC9RU0lhZ3JpS0YyVUNwZG1neEgxckl5K1NWY2Y3bW1Tc3B2LzhWR1lBdkgr?=
 =?utf-8?B?aUVKOXdtd0NLQmpKZ01td0lySGprY3NkZWx4M3FzSHZhaG16bkN5SWhkTmZJ?=
 =?utf-8?B?a2Rxem9zRWFBcTRRKzV5blVDaXY2OFh5aXcrMHBFNkpuTTFQbHVjbExFNUUx?=
 =?utf-8?B?L3ZiQjgzdEVjcit6WE5OTEdWVXZsbmI1ajZyYTJqV0FUa3NqWDl4Q3pZRi9i?=
 =?utf-8?B?emZUZGtjbDhpZndMZHNMZm9WS1pjWER1Ylo3NlNROElZRzcweXJ1cThqSklY?=
 =?utf-8?B?bkxNNmwyQ0FwRzNFei9QUjUySjRDbVlhamhDODZ5eFhmbTVHOWtvb2VXM0t2?=
 =?utf-8?B?OGQ3d290bzkyVHhqdW1oNzRBVWZJWnpFRWN6S25QczJBb0I5ZFlYTFNRZm5v?=
 =?utf-8?B?Ykp2V1NBTHNFemk1QkVnQlFtemxYdjVKdjlaMGY4WTA3WTZNMElLeEtiU0t3?=
 =?utf-8?B?ZlVzOG5ESG9DdkxLNXRlMHIwVjZrWGpiSHF5Tjg4WlBpbk1KUk55dmxQd1B5?=
 =?utf-8?B?TURnR1ovblJzNE1ZbUhtekdqTWFzMUlyaUJzL3EzbFg5L2Y5UTZrNXhYSHNH?=
 =?utf-8?B?aVpYSHFpVjRDSlM2NDN2b1ZjVVNiU0hiNzJLUDd2aWlwcHFnMGNmZU1ldS9V?=
 =?utf-8?B?alk0cWFxNE1icC9PZTZFRlI4dkVIVGdIZWhCdU91amNSd01hbEpMemlKQmlQ?=
 =?utf-8?B?Mkd0S1RsTWJ3ek5JUUFmSWVJZ1dvbWZPc2poaHZqRlRkeHNNTEVNSWhmVDBF?=
 =?utf-8?B?QnpnV3p0N0dySzdNWTMwT04zaHpkcVNDZnZtTC9VUWFsdDVtT0VFYks2dk9R?=
 =?utf-8?B?K2JuZ1FtQ2xybEtZdU9lYnUzRTFRTUVSM2R3RGFJaG1wUmhTNVdXaC85ZDIz?=
 =?utf-8?B?N1g4Mm9DSmVxdDZIOUxPUkVwUnAvRlRsWUpadFMyQndtenh1NE5QTG0zNnZ3?=
 =?utf-8?B?clpGSVkrZUQ4TXRIdjVlcDU3WUZIUmtXKzBHa0d5Yzhad3B2RXRUNmFvaGFD?=
 =?utf-8?B?bDdlSnBhYTRzMmcwcDNnMmxMS3AyamsxS1BVODVLelMxQlNYOXV6STNWNGY5?=
 =?utf-8?B?NHY5d0xYcnZGRGIwN1JFZUJXZlJlSmdwMk4yV29oRGxLbEQ4SG9YZ2R0NDlE?=
 =?utf-8?Q?JLDteB0qWZALiFQs=3D?=
X-Exchange-RoutingPolicyChecked: BLr9BIe0DhU2hO68l4CIspjK9+ShWD7k7FMD8o3RGnxBy35WsCj7wjOViyRbcjEJU0chkQ6dHH29hYkeyfRGJL/zJ1KM2jZpBbE4DPJmIxy1ppl8a79BsNNSUGfYTdjV9l3SlOhBkpTljlWmE885d/ijBOu4tYP1fS31gNbYnQLaVsCaV+UG3NoACNIvm9jbF8E7heR67P7iVQHobGjqFct5EvMKy21VgHj/fA725ivc/jvZMyDb73GLZiMK0ePwuapMoN95njDTFEhWUsdheHxx+GRZ9tKbBN+vXnTva4FxmuMLRlgNT4QY0iRxdIVt12+Mrwqh9+oSKjTey5bGfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9cb292-a990-46b9-0cca-08deba6aa079
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 14:33:45.7939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u30lzP+5A5OR/MtwdjymaKbkNmfcNxoB44/f6QdPgGrVAiHwtiFSTOq3Z16tX3ysRXoFLT/679QjUxOadlrYfxQXWnj3pJXWrIX6xhgLzoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8394
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


On 25-05-2026 07:48 pm, Ville Syrjälä wrote:
> On Mon, May 25, 2026 at 07:41:29PM +0530, Thasleem, Mohammed wrote:
>> On 17-04-2026 06:04 pm, Ville Syrjälä wrote:
>>> On Fri, Apr 17, 2026 at 02:04:59PM +0530, Mohammed Thasleem wrote:
>>>> Remove the deep-pkgc subtest as it depends on other display IPs which makes
>>>> testing unreliable. Current validation uses Package C-state counters that
>>>> are affected by unrelated system components and requires platform-specific
>>>> checks that vary across different platforms.
>>>> A redesigned test with proper display IP isolation will be implemented
>>>> in a future patch.
>>> What is the actual plan for that? How would it even be implemented
>>> and when should we expect to get it?
>> It's in discussion with hardware design team to come up with hooks for
>> better validation and tracking.
> And how are you going to catch regression on current systems?
The removed deep-pkgc subtest was providing unreliable results due to 
its dependency on unrelated system components, making it more likely to 
produce false positives rather than catch actual regressions.
And we will test pkg c tests as part of manual validation.
>
>>>> Mohammed Thasleem (7):
>>>>     Revert "tests/intel/kms_pm_dc: Ensure eDP detection before skipping
>>>>       test"
>>>>     Revert "tests/intel/kms_pm_dc: Add polling for deep-pkgc"
>>>>     Revert "tests/intel/kms_pm_dc: Update test duration to 4 seconds"
>>>>     Revert "tests/intel/kms_pm_dc: Update VRR handling and eDP output
>>>>       check"
>>>>     Revert "tests/intel/kms_pm_dc: Add time unit macros and update delay
>>>>       calculation"
>>>>     Revert "tests/intel/kms_pm_dc: Add a new test to validate the deep
>>>>       sleep state during extended vblank"
>>>>     tests/intel/kms_pm_dc: Remove unused pkgc functions
>>>>
>>>>    tests/intel/kms_pm_dc.c | 98 -----------------------------------------
>>>>    1 file changed, 98 deletions(-)
>>>>
>>>> -- 
>>>> 2.43.0
