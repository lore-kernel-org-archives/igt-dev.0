Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55943CF3189
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 00:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6A810E33D;
	Wed,  2 Oct 2024 00:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1516k0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAB610E33D
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 00:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727828349; x=1759364349;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tg3v1s3jLbnNhdIUs1l61rzGa7MG+QzTJgO7zFotFl0=;
 b=d1516k0ormXBNyYDTC+hjUIREFawTDrYWO03QrbNo4PYSw84NdlYMvMb
 mvgQkbznlL7TE1/pGrigySAjGwhn/QWBDR+IBa8QxAS9bYMzNXzE3GDGL
 2cAywd8vmmEk8k48X+s9kvfRB8S4ftDQFu6svrfNoYu8p3nNjqOiTPXqJ
 k2o5qqiEOV3rNzbEkZXVZVYsG5vfRYy1eXczv4p9bo6a9DHqBgqEU+eRK
 eUeN0Y6Vi1IHvuXvZ5yJ92/neCAalthyA/7BaHKERqF+EKRKzP2ca9bYP
 gyQsrAOdBkVDJfptr6K+LI8K2b9u97rbuaaJhLaN+cODuZnPIp1v53C/E A==;
X-CSE-ConnectionGUID: OVidRVBKRza1c/ciSyH/0g==
X-CSE-MsgGUID: 1JkSdcdfTHGJTho1lnakOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="38371811"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="38371811"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 17:19:08 -0700
X-CSE-ConnectionGUID: cA6OEI7OSSKJb9yIPehAUQ==
X-CSE-MsgGUID: Q75ssiUDTQSNUBHZUDjHsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="73822104"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 17:19:09 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 17:19:07 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 17:19:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 17:19:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 17:19:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIpmaEKfPChKPTaCxD+0ddox4ttQo7l5nBkwB2MqBE4FmrPm/7F8elXb3FslG5w6ze6DM8jgrC/zavY7x9WwuDGJ37MzJviEcazltLYNNivNlRZWYj2FXLwwgq6VZYwUg+TD9XM+7ks9+FASBPedn+2YOi5O9ptl6KzLmGXB73yTNjI1w/Kmhz/S84QxwJiCApOHrvZd1qo6Awhm1JpRSsNe5ejb03IGqpvJ0FSIMSmqgkfOLxA98SzPb8FkSL2At8U/W8fu3ZLBLZJN/VtJvvrROnYq6rcdxqmuP7UuIt1U7MuN7XywMoKPtVCdNccxY1fK9sZF8MZr2NYbLTagYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEIHukflUrzXakXlANmeWqK/89DviUa6cGEzkHvexvg=;
 b=oGa2+8lFNaZftx08jCZbqAGcZGJB4XiZmolMdZVUh+hJi/nH6KUnrd5y341x4o4UMoHKNN3fymq2SRHO3p10PsBjXQAkKvfhckT/KvM+VcMONJ9hU5fV5ZblA9u4eZnZnEizNCB25jjuVo63yZw8IieXqFWX+/voF+PC897uy8MU9nmo4oNXaY7kxt6C75c/l10pM9+YroyM/gPF9i5OOBpypaoO/GX2IJhSAyOUBarPrbPKRQ9texJYoEB1wzbfsNpxLZ/UpqVkDwGRMuB+3yDdFl1GsOniTh2lmZ2sPtugHTHjcCfOCPKCuFMuxxE9jOjb1admuh775XXtqzahYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB8811.namprd11.prod.outlook.com (2603:10b6:806:467::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 00:19:04 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 00:19:04 +0000
Message-ID: <b0a63841-89f4-430d-b4ce-354fdf4baa75@intel.com>
Date: Wed, 2 Oct 2024 05:48:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_joiner: Reset the force_joiner_supported
 variable
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>
References: <20241001094506.25037-1-karthik.b.s@intel.com>
 <9599c8c2-96ff-4801-bf3d-18b046598426@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <9599c8c2-96ff-4801-bf3d-18b046598426@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::20) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f801d48-f555-4f72-8ca2-08dce277d23b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjYvaFdwUHVaYTlMUk5mK3c0Z3FqRnpsZ0ZjZFRrMXVpaldsNHhhKzZmTFF3?=
 =?utf-8?B?ZTVLOHJ5T1hLS3BVa0gxVTc4QUE4SlFrV0puYlF2M1VtU09CaGRCWjlVam0r?=
 =?utf-8?B?d0NqV2pTcGs0TVVralNBWmh2SE85ZkJSNGQxa3hDclRxT0RNL25XMy95eFB1?=
 =?utf-8?B?L1JpdHVEOEc1SjZvZytibnArNUJVREttRjR6ZDdXMTJ1VjlPb1VxTUkwcyt1?=
 =?utf-8?B?Vm5RaUU2UFJnNkVSWDY2cDlIUEo3TFREclhrWElob3ZSRlVLbnFIVnloVU1Z?=
 =?utf-8?B?ZHF6NjdJZW9vUXlMVHJ3Q0tuTHkwNE03bTlDN0NwS0h3bUJLamQwbU1VQ3JW?=
 =?utf-8?B?MUVjbHFTekxFQll4SElEZ3pXRS85V21sT2dRMUw5dEJRUmdWcHRuQk1zQW9T?=
 =?utf-8?B?TDZPYm1xTlFYNGZacEl3M1pEcU1IRURaTjdVeE5ONDNYOXI4dytYci9Ca3dG?=
 =?utf-8?B?NjAyRFJrOXVrVkZSSVlUQUlrRXhaOTBNWnl6cHN4S3hHY2RzYitWNm15dFJO?=
 =?utf-8?B?V1c3bGU5anc0cDFjdDlTVmZkUStKcHlYajBOeSsraHZzQnlxM1Z6Wlhsb3ov?=
 =?utf-8?B?Y0tXUTJ4WkMvU3E5cVVVTmR6ZlhsLzMydW56Qis3amluOVNOV013MWxQdXE2?=
 =?utf-8?B?SWpLUVU2NFZNK1lja3FUWmFyaUdIYzR3Ti9BaVRyMTlES3gybW5xSjVHOCtT?=
 =?utf-8?B?aGxveFV3M1dhNkhnTy96ckM2UEVhUDlneWRaNXMxdW5OUUI4eWMxL2txWm1E?=
 =?utf-8?B?NDdVaGRRbEdnT1lzUGZkcVNZd0NDdit1emRiUFVvcFQ5UGlHRy9tK1lPUnlt?=
 =?utf-8?B?bG1CQkRSV0lBcTlVdFdVTFdUTkdWM3lYbHF0MWkzYzgrbVFzVjd3ZnB1TlZt?=
 =?utf-8?B?cmgwOG5qd1E4VldsbkdURWlhS1h2Vk5heW8xMTJtejRiNE1BT1FmeWZWck1v?=
 =?utf-8?B?b2Z6SDFoTDh2QWZNcit6SkViVVo0N3hnWTdzU1pLRGllWUE0YitzaUUxa0Z6?=
 =?utf-8?B?czlHTWpLaGdMbCtTeUp0QUlUQjJPMkg1MlZWTmw0aFlrMmdJcUpEYUp5TnBC?=
 =?utf-8?B?WUVySEs2NjRtS2NsbkpISG9ONUt5MkpaUUwvVERhVHhxQWN4ZTdQTjYrZzBN?=
 =?utf-8?B?T1M2NUhrVUFCcGx2ejMrWEovdCtRZWpEY2hvdHR5OGUxN3ZDODlaUEJlMlJp?=
 =?utf-8?B?K2l3MmhhVWVTUnBNTU95cVhOWGZ6Q3BCeDlSdGxoZmR4T2hDSm9uUzdvaThl?=
 =?utf-8?B?dkh1RGMzYXhYR0ViN0hxQ1dvS0R4TVhCZS9UbElXSCs4QVkwbHBtVWhzWjVv?=
 =?utf-8?B?c1prR28xS2ZMNFdhVWdXWlFWZWNNWUJnUFJ3V1VJRVV6NjllRlVIWkwwRjVU?=
 =?utf-8?B?K21IRmd5aWkwZUYyTEZFaWsxejNVRkdxNnByVUJZU2lFMXZOUG92WGdqZVAv?=
 =?utf-8?B?ZlBkc0VleTNHeFpiWFZhNXd2K2lMYnFvTzJEZFNpMy9jUzZPZFkveW4yZi93?=
 =?utf-8?B?Q0lEOWpwMy9mZE1aU3BlU1dLMlM4VHllTmRkZzJJcUZEMkZ1TTBOeGNJOG1H?=
 =?utf-8?B?RElhbWxVbzMyU05nWS8rTUEvRHRWNHg3Vjd6OWhkUzFKdCt1eW5GQTFxcmxx?=
 =?utf-8?B?RjZUTGFQSXZtOVI2bHdXdHcwdkdFOWpLdm9RVU1ja1hqMlpSTU9tS0FXVFNk?=
 =?utf-8?B?UHdydHNVbFhKZHhmUkxpditqOHZsTW80TG9qbkJoRmwyZ0pmQklndy9NYVhS?=
 =?utf-8?B?cnRxcExsU2w1Q2FVS25Wbkw4cHAzYTQ3UU1Id01GanZvakhMbWNpL1NtTXAz?=
 =?utf-8?B?cy9QSDdMMWJNZ2VvSlNpZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2pybUJUMzdMeU5jUEFtWWZNd0lGcGROTXBlQzBCcXJPQjA2VDB6QmVXZ1Vh?=
 =?utf-8?B?cE9ZU3lxRmZqLzlkb05RYVhHZ1hyREpHYy8xZGxibjJaLzVraEh2U1BWNElV?=
 =?utf-8?B?ZlFld2tkemd6R29oOTJtdEE4d2JsQ1NlVVo0bG5HZEQ5ODBHTGtUQUVLNUNw?=
 =?utf-8?B?QzJOUUlNSWw1RVVwTU1wYlNVZGZ6d3VkbmdmR2hPVW40dTd2WnNSVHBoTm5B?=
 =?utf-8?B?N09oU3d6RUtrMDUrUTA0TXNlNmJkQStFa2swSTNnVE9lWkxEMEl1cFFaL1pU?=
 =?utf-8?B?N3pzVENLNHQ2UnNremVCcW9ycjVWTlg2SnVPM0hKZzZxNDc2WjJROUxiZE90?=
 =?utf-8?B?MDZvRlA3Ulg3YXZ4bnBqaGxhVmMxU0VoM2M1VG4rUUVzQ3ZVZ2JmZUtpWGJo?=
 =?utf-8?B?RlZ3QXFralphZmczczZ4V096b0VYNW4ySXpselpVdDF3Q0dTOFBJQ1dFcmxj?=
 =?utf-8?B?dmdXTElZM1ZpZFh4bVpFZHJWU0E5NUU0Q2FFZ2VrRW1lbjZQN2lxRms5Q3Mx?=
 =?utf-8?B?T2hXdGZyQ21JaUpKa2pJelNVYUFWbnFMdUpqcWh3dFYrY2JEdiszcVdyb3Y5?=
 =?utf-8?B?ODI2OVFMaHhIem1LNkJ6YXNkdUxoaTVzdVNmcHQwNzY0RVh1Sm81ZGZuTjlB?=
 =?utf-8?B?RzFWcnJlWFF2TisrSTJiYWY0WE5TeTJtayt1VHh3MnhwN3NrZCsvYWRCcCtx?=
 =?utf-8?B?Tk8wVGxBR3RhRGV5S2xCckprR1VQWmlMMGZudXFrcUtVOTlTaU52Qk5sRTIr?=
 =?utf-8?B?YmlHNi9xaTVvMi9CbURxdnA5b1pOak5ScGExNWcrcGRTMC9zUUljcFVQOXUr?=
 =?utf-8?B?SElkeklJU3oyVUFQcmZyVGhjWEkwNWQ0Z0pFeGNPSHkrRExxUEQ1Z3ZJZkMv?=
 =?utf-8?B?Sm8zVDV4Y2llMWhseUNCbkc0eFZkbkNXS3dNUit6UTVEcmp1bWhCbzdibkE5?=
 =?utf-8?B?QmN1ZnNHV1FLWXhGa2V0elpYTnhrK3NkS1Q3SFhWUUxkNWNpRzhTdnVTU0h0?=
 =?utf-8?B?ZXJSeUE2KzJ3TGdHa1FYZEtQZXA4K3Y3ZmIvcTJSNVFraWJVeUg5aVJPMkwy?=
 =?utf-8?B?OW91bmR0b2xMdVhUbjB5ZHpQZXRmMUZmQmptWmJnczRvbHlEd3VsNmd3aWRP?=
 =?utf-8?B?dXAwdFRxY3NwVGhEZXdidHRIYkxiZTZocVdOM0o4UnZOSWUrSkoyMGR2UVRB?=
 =?utf-8?B?dlNkcXpwOEM4c3dxaUxYYXI3ZEltUnhVR051eXgxUGVoUTZQREhyNVRFNGJW?=
 =?utf-8?B?Y3pobXFGWldldytGZmxDdzJ3WVpTZGNqSkE1MVM2d3IrK3doUEhOL2RNRnc3?=
 =?utf-8?B?SFNEWE9CcGs2Z0FQNWs2Vjl1ckFRbG9rV05tWVlWUlA1cHo4VnZzSkY2c3la?=
 =?utf-8?B?MDBDeFJWMTlTSVgxM1pPeGRvU2hRNEk0em4vQlR1bUtBekR3WkxRVkhXbHFW?=
 =?utf-8?B?dTFHZmVhZlFzcDBtTlM3Z0poZ0FZemRybjdQbDJPVkV0ZUJ4MCtUYkNRMWM5?=
 =?utf-8?B?bTREMXFCVFFCaTdjSUtaaUtrKzBwQ001d3JxTFRTSlpvSmYxZytDaGdxcDRO?=
 =?utf-8?B?RmRObzIzYW1YQk1zWEJ6dDNtY3pKNU9Bd0dKcEgzenkvdnQ3VlRTY2xWNitx?=
 =?utf-8?B?V1Q4M2NuUEU1Vm9RSFg2VHpKb0QweWJTTlh4N2ZCWXJEVGY0cEU4Q1lqTDJq?=
 =?utf-8?B?aFFCTk1WazJadm1QaWtYN0s5NlpFVUIrWlBMRHVXbjlVS0ZwWm5KQnpSN0g1?=
 =?utf-8?B?aWlPcmFYT3g1dDRpVUkzcUsxeGs3YUQ5bHk2RjF3emU5Rk5wZXhZWW9hV3gr?=
 =?utf-8?B?ejdoT1NoWEd1ZWM5NFhuRlVJbGNEeDZyMnNESERVaVN2dVBvSVlyc1NKRlNR?=
 =?utf-8?B?eFJhL0R6TTVFUUxJRGQyZjg3Ri8wWng0L1FITFI0ekZIVW1yOUdFNFUrc1NE?=
 =?utf-8?B?SEgyZFVvUEtwTmp5NVpOMzNHc1lnd1EwQS96VHZCZ0s4azNXOUtveXY5anlL?=
 =?utf-8?B?c0JsQ1QzVTJUOUlLcEtNUEJ2ZWxIL1piY29lOEpHbWdyOW9WSUU4VW05K0l1?=
 =?utf-8?B?Z2NJSWNTYWJtVDNxSUFIVzY4UmN5YWdRaDNPUmw5bFhPZ2RraktORzA4dmZE?=
 =?utf-8?B?UjJGQzJzbVlQQWM5Y0w5ZUR3RmJvRHU2QWxNd04wOVpPTmhNWHhuVVJaZURG?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f801d48-f555-4f72-8ca2-08dce277d23b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 00:19:03.9765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgMxXkhDpqJhGru2vTfFhKcHviR1aA6esOQIgh0qf+cXTzhF2SSNiq7b6R/cb5PNSjXaA8RuvR5k1VFAPzXJ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8811
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


On 10/1/2024 4:29 PM, Nautiyal, Ankit K wrote:
>
> On 10/1/2024 3:15 PM, Karthik B S wrote:
>> With the current logic the test will fail on configs where the first
>> display supports force joiner and the second display doesn't supoprt it.
>> Reset the force_joiner_supported variable at the start of the loop to
>> avoid this failure.
>>
>> With this remove the redundant check in all the force joiner subtests
>> for force_joiner_supported as the following output check is inherently
>> checking this as well.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel/kms_joiner.c | 10 +---------
>>   1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
>> index 508e82ce3..198de9e43 100644
>> --- a/tests/intel/kms_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -418,7 +418,6 @@ igt_main
>>       data_t data;
>>         igt_fixture {
>> -        force_joiner_supported = false;
>>           ultra_joiner_supported = false;
>>           data.big_joiner_output_count = 0;
>>           data.ultra_joiner_output_count = 0;
>> @@ -443,6 +442,7 @@ igt_main
>>           for_each_connected_output(&data.display, output) {
>>               bool ultrajoiner_found = false, bigjoiner_found = false;
>>               drmModeConnector *connector = output->config.connector;
>> +            force_joiner_supported = false;
>
Hi Ankit,
> Perhaps declare this in the loop itself, we don't seem to need this 
> outside the loop.
Sure, will fix this in the next revision.
>
> With above addressed, this is:
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Thank you for the review.

Thanks,
Karthik.B.S
>
>
>>                 /*
>>                * Bigjoiner will come in to the picture when the
>> @@ -539,8 +539,6 @@ igt_main
>>         igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>>       igt_subtest_with_dynamic("basic-force-big-joiner") {
>> -        igt_require_f(force_joiner_supported,
>> -                  "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>>           igt_require_f(data.non_big_joiner_output_count > 0,
>>                     "No non big joiner output found\n");
>>           igt_require_f(data.n_pipes > 1,
>> @@ -560,8 +558,6 @@ igt_main
>>       }
>> igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>> -        igt_require_f(force_joiner_supported,
>> -                  "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>>           igt_require_f(data.non_big_joiner_output_count > 0,
>>                     "Non big joiner output not found\n");
>>           igt_require_f(data.n_pipes > 1,
>> @@ -584,8 +580,6 @@ igt_main
>>         igt_describe("Verify the basic modeset on ultra joiner mode 
>> on all pipes");
>>       igt_subtest_with_dynamic("basic-force-ultra-joiner") {
>> -        igt_require_f(force_joiner_supported,
>> -                  "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>>           igt_require_f(ultra_joiner_supported,
>>                     "Ultra joiner not supported on this platform\n");
>>           igt_require_f(data.non_ultra_joiner_output_count > 0,
>> @@ -600,8 +594,6 @@ igt_main
>>       }
>> igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>> -        igt_require_f(force_joiner_supported,
>> -                  "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>>           igt_require_f(ultra_joiner_supported,
>>                     "Ultra joiner not supported on this platform\n");
>>           igt_require_f(data.non_ultra_joiner_output_count > 0,
