Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9151CD59D99
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 09:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BBB10E2DE;
	Mon, 15 Dec 2025 09:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUANcsQn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0629810E2DE
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 09:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765790114; x=1797326114;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=DaKhmzxlxsU5BzyOE4bxFqFo1mNXqtpnW1B84qjVu3o=;
 b=JUANcsQn0/kojEzaUKwYSVV0MfgmTHBb3R06AYGCY7uF5uRiq4k3ekX3
 L3ua+1pFyX6xOpTWCHFs9sW51NbLTn9uJvKRzKJcHMwJ73oOyA5HsSi3m
 CfQSY8bG4s7sJa7U9RHq7MgVdSzvYyBBQme4vhUe4YLyd5f31S/ld1r4H
 n/2fSqPrATIDPrHOTAsNYsWPkIqOjLWkILWzYSRNBppjq7xscMAeIP4HD
 QicTWuErvtXToN+i0fIgiEh3ictbG0vO7B+aaM4+/SzQZT8uV/Q1a2RzQ
 PBRPqO+01WAk8Jhyqa2ECx59m6w+LuUQaAVbgyl822/2sCIa9idQUdfP1 A==;
X-CSE-ConnectionGUID: 6HmYOWRZRPWWtPRsU5eZqA==
X-CSE-MsgGUID: nUz6DYIEQrG+FQfMEvLv4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78802981"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208,217";a="78802981"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 01:15:14 -0800
X-CSE-ConnectionGUID: 9v3wESOQSwKk1WrclwySpA==
X-CSE-MsgGUID: mv3nhi3LQGyKqPZo178qaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
 d="scan'208,217";a="202780405"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 01:15:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 01:15:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 01:15:13 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 01:15:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nV49RequQinnfofupot/Y6h7t3kulBDkte2dqFVQoOlu9rX0wR5IoOyaw4vMEIzmXWzHXxL6GwfdgGvBx20jzy1t88VA9BJEoR4phN3p96abymkDRsjh2CLP9R2AM7TWzXDf2yCIPqw56WtjM/Dbc0P1c+oX6j/CSUGNAjvfqM+z9wPR+AxaJdRi4r00OWZNzxwNzxkEYf5aP1E/YEWvf80QMW1+a127woWNbx8/h5p88b5FLCyxjZ4K3sQVPHrV3yn4125NhwUp5MeDj2MyLdgqX1o0YC47ltlGrWBCdyOyf6mpE4vrhf2p7qgC6StAXpdpwLLy1EpsEifyxKbP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NH0qrbLD/eLXNedN58dOJoL33kloPFhyTplRSETZEnA=;
 b=Z6NxungLjg3UIkK1kUQXKDKHDRaeG+fuKvZXMP4aq1KgVvRGWor6u7/vhoENIrULgowHfk2fK0IX/3hEAWldkm56W7mChf9QPbxNtOWiWbl4uY+10SNPn+2gtc8PVIB6+kgb/IXNveo7swCJl9tJj1fVfxOjy8G4a8z/gvMfNKFordRZAnvLbdAJApSH5FhJ94aKcqn5hyG0KphLFjCBk7/ePQCchokNXp5mrO4zaNcxsZ6QZk48BVJ2CQNHBBgABml/4VGOUEJqe2ZUL/Ah2IuXkZtljvAtkT2OuszJYEBIlk8U5GwoA+c7Dc5QIQ6l2utxV1BbzuqntId3D6UNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by DM3PPFC3B7BD011.namprd11.prod.outlook.com (2603:10b6:f:fc00::f49)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 09:15:06 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 09:15:00 +0000
Content-Type: multipart/alternative;
 boundary="------------xB0K6wTV4MjFf19kZArzXWXx"
Message-ID: <620810f2-d8a3-4312-bebb-7eeb6c8a4f4e@intel.com>
Date: Mon, 15 Dec 2025 14:44:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20251209173513.4020947-1-soham.purkait@intel.com>
 <20251209173513.4020947-3-soham.purkait@intel.com>
 <20251212214122.uzu2gcvuj23ejfyz@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20251212214122.uzu2gcvuj23ejfyz@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|DM3PPFC3B7BD011:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9e2609-9276-41d7-481f-08de3bba6c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVBHK2FDNWpUamNZYlVDZEtrZ2ZQczFydEJ5OXZpS0g4d1RoQW5JRDkvRENJ?=
 =?utf-8?B?Vk1VaWlOcHppYXBrZkZLSGQvc0JmU1Q2blNxUm5jSDlydEFMTDdsSzVzd05W?=
 =?utf-8?B?dXdnaXdPYUI4djUrYm1ZTDdXZkxoRVVmcWVVSjZFeEJDbDJwSFRNY1VyNGpi?=
 =?utf-8?B?cHZDY2NDM0o3aWdDRHh5cHVNa0VzcXhOVGsxbEpaRFVzQzk1U09KNHV6VWVL?=
 =?utf-8?B?eW05bVNWMTZWWlBGaEg5RlAxTjI3blduamJwTHAzYlZYQnNMaWJDalB5ZVlV?=
 =?utf-8?B?SDNFRWpLUUVXMGRhNGRSRVY5VGNHSks3K1lIUVdWNTFLWUgzVFcxc2Nad0F2?=
 =?utf-8?B?NUJKNGE0c05ObjRyUVppMkpualZEdGoxSzBBck9rVUJIanp0V0o2cmNxUlhw?=
 =?utf-8?B?SW8wWDlYY1UyRUZaeFBkWEVaZitoK0MwL2JqcDhQZ3JiYitGdHpHWTVUN3Q5?=
 =?utf-8?B?eWtudXJieUJ1OEYyWHIxdWdpeHp5UlpQY0NtTzVUMFI0YWs1eU52Vlh3WWh1?=
 =?utf-8?B?K0M5VEtiU3MvUFVURE9xV1ova21BWGtWa3Q2R0JRa0lIa2ViQTRCOU5BZ3c1?=
 =?utf-8?B?Y2FmdEcyRUw0STZja2RuQ0JEd2tNUTN6OGtHbzkrd3JrcFoxYkVjakVlYmMw?=
 =?utf-8?B?Q3k3VlJsQi9zOEFGUGxqOGlzMUpFdGQxcHhTdlVOaFg3cmRDbGRUdyt3ODU0?=
 =?utf-8?B?emRoN0F4RXFBTnRySUY5V2NEMUp5YkdiTDBZSEpPTFlTUHVNbnBmSDZkWlVU?=
 =?utf-8?B?VjQzdXlXS1FYMDVMVWRLNXF0ZWg2OWtIZmhOUS9KYWY0cGMzcWNQUlU4TkdM?=
 =?utf-8?B?eTJMS01zcHNueG5xTTlBVUdqMmJqblZmczJzUDhTSVZOUG50L2pINUt5bUJC?=
 =?utf-8?B?VlVzcXREaWxwWjNlZ3AvbWNzR21TVVcveHFjMytzbjM5cjVyVno5NXREOVNE?=
 =?utf-8?B?UFM3ZHlpQTZ6cDd2RkYzcFlQYjNvWXljNS9MOHI5YU5DTEQyRG91blNOd0Zs?=
 =?utf-8?B?Y001aEw1VEFzK21mY01vVFArc2FreVQ0bjlRNkhIR2l6OXJRcy9hZERNYmhj?=
 =?utf-8?B?M01ZYUdSVndqLzhSQ1RxSi9sRU1PejZ0UUtJazBoSit0R1Vadzl1NzJyODE1?=
 =?utf-8?B?WWFiZFBUSDU0UjJucjZIbWhWUjdWblVNbldXNDh4dnFsK1M5VVZYb3QzOWo1?=
 =?utf-8?B?Q294T1VXdVNhZGVKUGlLQWI2akpreHJnUG1YYTRkVkJZWUpvdVpMY29Cd2ZH?=
 =?utf-8?B?ZGdRZkt0eFRmVHQvNHNnTmlxNkxEWnRxNWZBekdYMHJTQzdrc0RsQ0tRNTlj?=
 =?utf-8?B?MDdFSExkcEoyWm1pdjczOUZjMGZTQnlEMEFrcStpcTYyM0U3KzlFa055ZlFW?=
 =?utf-8?B?em5oekUwZG56R2hKMlZubXNRcWp3SlZESWN4OWRVUDZhZHlXYnpESGtpQ2tP?=
 =?utf-8?B?NU03eHUzQTJ6dFFrbmNDNHRUcXJUZml4SWJRaWxBMDc3anc3S1J6aWtrY2V5?=
 =?utf-8?B?eHBoeEtLNWdJVTEycndFMWRTM1ZHblpIVXM4SjNsUVYvNHovNGt3SVMrRWdh?=
 =?utf-8?B?SWprdjVMaVRqY0NNbU54Q3lpeElJbmJFQVgzMkN4ZTlxdURHRjdqNCs4ei83?=
 =?utf-8?B?UWhacGJHUkhHTjh6RmY3WlNLY1lKMEw5dlNzenZmaTlRc3Y5bzIzdmMyZSs3?=
 =?utf-8?B?b29xQWJqUE5EaHlNKzd1VW4zWHFMMHZ3b1grcmdNVGlnbTcyWit5Y2UxcmtN?=
 =?utf-8?B?TThORW5QYkIrNDJDTnZ2MEtYS3ZSN0RLYkQ2NDlLbTU2WFJzcTNndjFpTnhZ?=
 =?utf-8?B?Y2tObFdnSFpCc2MvYzdvc3lmbWhsMlFkeTBidzJXRUoxTjZJVEkvWm13TDlw?=
 =?utf-8?B?ZDZoWGVkVk9uUEU4VnB2dXdvbDl4RTdjYXBCUFhHZjNZa1FsTEFSRGd6dE9h?=
 =?utf-8?B?Vk5ZMVBmV0ZDVklMci95U3ZBWmkzNm9rRkF5SWtvWFVKV2hWRlRid3lWSVhJ?=
 =?utf-8?B?ek9DeGNrV1J3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm1DN1BQS1dYaEE0S1laSnZJQkZySE11ZzQxa3l3MzJmNjdwdHVOQXVYVFRF?=
 =?utf-8?B?TloxYXJTSk1vNytMYStONnlxZWhkZ1NPZ0FrWVVvRXBBUnQ5S0NGMDhldFl5?=
 =?utf-8?B?NFFYZVFnZERhUUlDSk1XY1ZDa3M1RGdPWEZ2LzliUlRsOERZWVNaLzNIS3Nk?=
 =?utf-8?B?Wk13QmJEcGdVbDZTSnlkM1FaWkdHdEFvZVZpdTdENnNGT1VCamYyVTZuUlU5?=
 =?utf-8?B?N1VBc0ZHWkhLeUFtWFVGbko1YmdVdGpoTGFMZWl0QmQ2VXBUMmJGQ3kyNnR2?=
 =?utf-8?B?eTh6dktqdkRubW1vYTEwNTVMNGp6Yk1UcmtPWE8rSVNDb2M5TWhsZ0NNWm9T?=
 =?utf-8?B?eUFvOG9Dc2llREdsYXh0UnIwMWxwaWhHNlhEcktVaXpFbmFxaEcxVHpRcVpM?=
 =?utf-8?B?Ujc0Z0tzTmZFZWhlKzRNUFhzeDhEd2l3V2R0c095Q0Y3LzN2QWlQV3dueE94?=
 =?utf-8?B?NW5TNTd6VWd0Qm9vSDFGdW9MMGhNNDJURkRDdmU2aHBrZi9sM293RlBKZHZm?=
 =?utf-8?B?UHNXZUd4WnZDaWptbFcxNzgyaXh1dlZObHBSM2hPcm95UjQ0ZXEyemNYclBn?=
 =?utf-8?B?L0R3d1UxaytKT0crWWd5a0ZjZDhCU0txY0Z6SDlqbmwwRCttdDVxSmw5NEJO?=
 =?utf-8?B?QWk5T1h4a2hnZ1ZrMStVTjNheGZ1MFQycENlK0NtcC82dmllSnZ0YmV0Nm5K?=
 =?utf-8?B?a204eVUrcDV6K0JYMTZtb2Z5YmxWZUllNURHNjI1VWNpZ05Xb1pidDFNNGd4?=
 =?utf-8?B?Ly9QbEhOb29mWEkwdFlvQW9rZ0l4dVlWVW9nTSs4SkJXYW1KYjFUempmckpo?=
 =?utf-8?B?TGtrRmJ5UnFUMkcyOUxCdU1tZlEwMTJrL3pmb1NlN3p2TVRzd3lWeTVDbGF3?=
 =?utf-8?B?b1laWWI4RGNrWHZQdUlqajVSWnNSZDhPeDllSVgzbkEraUV2ZXpuZmZtb2VY?=
 =?utf-8?B?a2xTaEM0NkxRaTFJblFrVXFUQmJaa3I4NDhXbGpQa0xmdHVMZTkrN2U0dUh2?=
 =?utf-8?B?UXhjclpxYk9hRExONHpCQTlBcFJrUUdkTTF5WjlJRmR1emJ6TkdLSGc5NllG?=
 =?utf-8?B?N0h3aGhDRDhlNDQwQ2w3VG1lYzFnL3NucjdQaEdUMno5Y2lRVzMySGplS0JY?=
 =?utf-8?B?ekdiVjRzdVMrQlVOR3g1QXBoT29yU1dGS3pIb01BUVJCSkQwT2M2MDNKallU?=
 =?utf-8?B?ZkJ0bjhKTTNHdzI3Y1RnUXgyN0NIQWoreUtSc1ZVYW1tQWxhNEtPYTZydllQ?=
 =?utf-8?B?a1lpSm0wem5OOHFDRlBaK2RRR0hHNElzYm9OR2tqTm5ZMTF3dXlNR2tScEtu?=
 =?utf-8?B?aEdmUmI1NHJ4VzFpTEFZdEV3UDVOQWs3ZUhzVmhTTHAvSW01R092MlJTeFRi?=
 =?utf-8?B?dGg2Qmo0MUxWditQd3BNa1ZXM0YxS0tUV2RHU0EvUmIzQVZSMGpVcHkydTFy?=
 =?utf-8?B?eER3VmxVSmFYUVR1VGQ0NTlsNnRpNk8rbWp0bkdmUGgxM2dHeWRxQzcxWURY?=
 =?utf-8?B?N09tY0NpLzhvZjlLWkJhMThlaWF2bnJ0VGRLSzF5UTFDZEpMRGRrMTY3ME12?=
 =?utf-8?B?NStybG54OHU4eHZCNWJhYWNlVG13R3dVbGt2Rlcreks3ZEJoRW1EM1lxekVJ?=
 =?utf-8?B?VzR3cVZVK1pFOWFHZ2lxZTJBWmZ4VEQ3L0V5K3cycW5XY204ZTZjbzlHV3FR?=
 =?utf-8?B?d2Y3cms0OHVRMVQ5WUlDa003eHhtcEtZWlBkMlBCSVY4U1FmUEZWbWY4dVpP?=
 =?utf-8?B?SHRLQlJZS3QrTEpkM25uVlRWYmFHWDRzNW00T2dYMWZydmltN0liWGN0R3dh?=
 =?utf-8?B?ajd0djI2YzZTSEQ2elpLcjRKZnhNSXZBYTFRVlVHR3RncXVhWmpKdU5mR2xV?=
 =?utf-8?B?WUZHc0NreTBlaWhRbnMyc2VSRFVGUjNuNW4rbnlnMURMdEU3WjlIcE9jYWox?=
 =?utf-8?B?WVRZWnUrTXVUTUljZWE1TnpsRXdXd1B0ejhMMWpnMkhoSTZoOGNucStneDJV?=
 =?utf-8?B?ZjlRZ2dqeEI3ZVFaQTVKSTNadUMrL0puZkIzTjFsVUVNNkx0cWZEdWRteDNQ?=
 =?utf-8?B?L3lLZTJHUFNHaFJRNFVUbTRSWW8vYm9LVXRxbzc0eG90UWZrY1AvMm1rMHVn?=
 =?utf-8?B?UHlnZmdMVUtuT1NRYk5TajlMeHlXc1M4c05TV09jWUxoaDgwV05GTzBYRjgw?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9e2609-9276-41d7-481f-08de3bba6c63
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 09:15:00.6998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fB6VRlrl/sMuEzzCtE614ijq1TpfoGQ2pTS1/8NBEe5A0LAb/ALFaXmeqW16i5jrBIbPdjhBg83eCdf6xRDRGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC3B7BD011
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

--------------xB0K6wTV4MjFf19kZArzXWXx
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kamil,

On 13-12-2025 03:11, Kamil Konieczny wrote:
> Hi Soham,
> On 2025-12-09 at 23:05:13 +0530, Soham Purkait wrote:
>> Introduce vendor-agnostic support for handling multiple GPUs and instances
>> in gputop. Improve the tool's adaptability to various GPU configurations.
>>
>> v1:
>>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
>> v2:
>>   - Add device filter to populate the array of cards for
>>     all supported drivers. (Zbigniew)
>> v3:
>>   - Cosmetic changes. (Riana)
>>   - Avoid three level indentation. (Riana)
>> v4:
>>   - Add user message for running without root privileges. (Kamil)
>> v5:
>>   - Add support for GPU client-only busyness on unsupported
>>     drivers as a fallback mechanism. (Kamil)
>>
>> Signed-off-by: Soham Purkait<soham.purkait@intel.com>
>> ---
>>   tools/{ => gputop}/gputop.c | 283 +++++++++++++++++++++++++++++++-----
>>   tools/gputop/meson.build    |   6 +
>>   tools/meson.build           |   6 +-
>>   3 files changed, 250 insertions(+), 45 deletions(-)
>>   rename tools/{ => gputop}/gputop.c (59%)
>>   create mode 100644 tools/gputop/meson.build
>>
>> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
>> similarity index 59%
>> rename from tools/gputop.c
>> rename to tools/gputop/gputop.c
>> index f577a1750..e13f98b82 100644
>> --- a/tools/gputop.c
>> +++ b/tools/gputop/gputop.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: MIT
>>   /*
>> - * Copyright © 2023 Intel Corporation
>> + * Copyright © 2023-2025 Intel Corporation
>>    */
>>   
>>   #include <assert.h>
>> @@ -14,66 +14,148 @@
>>   #include <math.h>
>>   #include <poll.h>
>>   #include <signal.h>
>> +#include <stdbool.h>
>>   #include <stdint.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>>   #include <sys/ioctl.h>
>>   #include <sys/stat.h>
>> +#include <sys/sysmacros.h>
>>   #include <sys/types.h>
>> -#include <unistd.h>
>>   #include <termios.h>
>> -#include <sys/sysmacros.h>
>> -#include <stdbool.h>
>> +#include <unistd.h>
>>   
>>   #include "igt_core.h"
>>   #include "igt_drm_clients.h"
>>   #include "igt_drm_fdinfo.h"
>> +#include "igt_perf.h"
>>   #include "igt_profiling.h"
>> -#include "drmtest.h"
>> +#include "xe_gputop.h"
>> +#include "xe/xe_query.h"
>> +
>> +/**
>> + * Supported Drivers
>> + *
>> + * Adhere to the following requirements when implementing support for the
>> + * new driver:
>> + * @drivers: Update drivers[] with driver string.
>> + * @sizeof_gputop_obj: Update this function as per new driver support included.
>> + * @operations: Update the respective operations of the new driver:
>> + * gputop_init,
>> + * discover_engines,
>> + * pmu_init,
>> + * pmu_sample,
>> + * print_engines,
>> + * clean_up
>> + * @per_driver_contexts: Update per_driver_contexts[] array of type "struct gputop_driver" with the
>> + * initial values.
>> + */
>> +static const char * const drivers[] = {
>> +	"xe",
>> +    /* Keep the last one as NULL */
>> +	NULL
>> +};
>> +
>> +static size_t sizeof_gputop_obj(int driver_num)
>> +{
>> +	switch (driver_num) {
>> +	case 0:
>> +		return sizeof(struct xe_gputop);
>> +	default:
>> +		fprintf(stderr,
>> +			"Driver number does not exist.\n");
>> +		exit(EXIT_FAILURE);
>> +	}
>> +}
>> +
>> +/**
>> + * Supported operations on driver instances. Update the ops[] array for
>> + * each individual driver specific function. Maintain the sequence as per
>> + * drivers[] array.
>> + */
>> +struct device_operations ops[] = {
>> +	{
>> +		xe_gputop_init,
>> +		xe_populate_engines,
>> +		xe_pmu_init,
>> +		xe_pmu_sample,
>> +		xe_print_engines,
>> +		xe_clean_up
>> +	}
>> +};
>> +
>> +/*
>> + * per_driver_contexts[] array of type struct gputop_driver which keeps track of the devices
>> + * and related info discovered per driver.
>> + */
>> +struct gputop_driver per_driver_contexts[] = {
>> +	{false, 0, NULL}
>> +};
>>   
>>   enum utilization_type {
>>   	UTILIZATION_TYPE_ENGINE_TIME,
>>   	UTILIZATION_TYPE_TOTAL_CYCLES,
>>   };
>>   
>> -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>> -
>> -#define ANSI_HEADER "\033[7m"
>> -#define ANSI_RESET "\033[0m"
>> -
>> -static void n_spaces(const unsigned int n)
>> +static void gputop_clean_up(void)
>>   {
>> -	unsigned int i;
>> -
>> -	for (i = 0; i < n; i++)
>> -		putchar(' ');
>> +	for (int i = 0; drivers[i]; i++) {
>> +		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
>> +		free(per_driver_contexts[i].instances);
>> +		per_driver_contexts[i].device_present = false;
>> +		per_driver_contexts[i].len = 0;
>> +	}
>>   }
>>   
>> -static void print_percentage_bar(double percent, int max_len)
>> +static int find_driver(struct igt_device_card *card)
>>   {
>> -	int bar_len, i, len = max_len - 1;
>> -	const int w = 8;
>> -
>> -	len -= printf("|%5.1f%% ", percent);
>> -
>> -	/* no space left for bars, do what we can */
>> -	if (len < 0)
>> -		len = 0;
>> -
>> -	bar_len = ceil(w * percent * len / 100.0);
>> -	if (bar_len > w * len)
>> -		bar_len = w * len;
>> +	for (int i = 0; drivers[i]; i++) {
>> +		if (strcmp(drivers[i], card->driver) == 0)
>> +			return i;
>> +	}
>> +	return -1;
>> +}
>>   
>> -	for (i = bar_len; i >= w; i -= w)
>> -		printf("%s", bars[w]);
>> -	if (i)
>> -		printf("%s", bars[i]);
>> +static int populate_device_instances(const char *filter)
>> +{
>> +	struct igt_device_card *cards = NULL;
>> +	struct igt_device_card *card_inplace = NULL;
>> +	struct gputop_driver *driver_entry =  NULL;
>> +	int driver_no;
>> +	int count, final_count = 0;
>> +
>> +	count = igt_device_card_match_all(filter, &cards);
>> +	for (int j = 0; j < count; j++) {
>> +		if (strcmp(cards[j].subsystem, "pci") != 0)
>> +			continue;
>>   
>> -	len -= (bar_len + (w - 1)) / w;
>> -	n_spaces(len);
>> +		driver_no = find_driver(&cards[j]);
>> +		if (driver_no < 0)
>> +			continue;
>>   
>> -	putchar('|');
>> +		driver_entry = &per_driver_contexts[driver_no];
>> +		if (!driver_entry->device_present)
>> +			driver_entry->device_present = true;
>> +		driver_entry->len++;
>> +		driver_entry->instances = realloc(driver_entry->instances,
>> +						  driver_entry->len * sizeof_gputop_obj(driver_no));
>> +		if (!driver_entry->instances) {
>> +			fprintf(stderr,
>> +				"Device instance realloc failed (%s)\n",
>> +				strerror(errno));
>> +			exit(EXIT_FAILURE);
>> +		}
>> +		card_inplace = (struct igt_device_card *)
>> +				calloc(1, sizeof(struct igt_device_card));
>> +		memcpy(card_inplace, &cards[j], sizeof(struct igt_device_card));
>> +		ops[driver_no].gputop_init(driver_entry->instances, (driver_entry->len - 1),
>> +			card_inplace);
>> +		final_count++;
>> +	}
>> +	if (count)
>> +		free(cards);
>> +	return final_count;
>>   }
>>   
>>   static int
>> @@ -333,6 +415,7 @@ static void clrscr(void)
>>   struct gputop_args {
>>   	long n_iter;
>>   	unsigned long delay_usec;
>> +	char *device;
>>   };
>>   
>>   static void help(char *full_path)
>> @@ -350,16 +433,18 @@ static void help(char *full_path)
>>   	       "\t-h, --help                show this help\n"
>>   	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
>>   	       "\t-n, --iterations =NUMBER  number of executions\n"
>> +	       "\t-D, --device              Device filter\n"
>>   	       , short_program_name);
>>   }
>>   
>>   static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>>   {
>> -	static const char cmdopts_s[] = "hn:d:";
>> +	static const char cmdopts_s[] = "hn:d:D:";
>>   	static const struct option cmdopts[] = {
>>   	       {"help", no_argument, 0, 'h'},
>>   	       {"delay", required_argument, 0, 'd'},
>>   	       {"iterations", required_argument, 0, 'n'},
>> +	       {"device", required_argument, 0, 'D'},
>>   	       { }
>>   	};
>>   
>> @@ -367,6 +452,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>>   	memset(args, 0, sizeof(*args));
>>   	args->n_iter = -1;
>>   	args->delay_usec = 2 * USEC_PER_SEC;
>> +	args->device = NULL;
>>   
>>   	for (;;) {
>>   		int c, idx = 0;
>> @@ -390,6 +476,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>>   				return -1;
>>   			}
>>   			break;
>> +		case 'D':
>> +			args->device = optarg;
>> +			break;
>>   		case 'h':
>>   			help(argv[0]);
>>   			return 0;
>> @@ -417,9 +506,12 @@ int main(int argc, char **argv)
>>   	struct igt_profiled_device *profiled_devices = NULL;
>>   	struct igt_drm_clients *clients = NULL;
>>   	int con_w = -1, con_h = -1;
>> +	bool is_root;
>>   	int ret;
>>   	long n;
>>   
>> +	is_root = (geteuid() == 0);
> Note that this is not required when a user is in a group.
> Better way is to just try to open a file and only when it fails
> act accordingly.
>
>> +
>>   	ret = parse_args(argc, argv, &args);
>>   	if (ret < 0)
>>   		return EXIT_FAILURE;
>> @@ -429,6 +521,92 @@ int main(int argc, char **argv)
>>   	n = args.n_iter;
>>   	period_us = args.delay_usec;
>>   
>> +	if (!populate_device_instances(args.device ? args.device
>> +				       : "device:subsystem=pci,card=all") &&
>> +				       geteuid()) {
>> +		printf("\n" ANSI_HEADER "Run with root "
>> +		       "privileges for GPU client "
>> +		       "busyness.\n" ANSI_RESET "\n");
> So you still need a root, as I said it is a regression.

By the way, If you are referring to GPU client busyness, this is not 
implemented by this patch as it is already there in the IGT as  
"tools/gputop". This patch is just the extension of the same to show per 
engine busyness along with client busyness which is already there.

Thanks, Soham.

> Imho looks like you want to create a new tool ngputop.
> You could create it in tools/ngputop.src/ <- most source files here
> and link into executable tools/ngputop
>
> In a new tool you could require to have a root or group or caps.
>
> Regards,
> Kamil
>
>> +		gputop_clean_up();
>> +		exit(1);
>> +	}
>> +
>> +	for (int i = 0; drivers[i]; i++) {
>> +		if (!per_driver_contexts[i].device_present)
>> +			continue;
>> +
>> +		for (int j = 0; j < per_driver_contexts[i].len; j++) {
>> +			if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
>> +				fprintf(stderr,
>> +					"Failed to initialize engines! (%s)\n",
>> +					strerror(errno));
>> +					gputop_clean_up();
>> +				return EXIT_FAILURE;
>> +			}
>> +			ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
>> +
>> +			if (ret) {
>> +				if (errno == EACCES && !is_root) {
>> +					fprintf(stderr,
>> +						"\n"
>> +						"When running as a normal user, "
>> +						"CAP_PERFMON or perf_event_paranoid\n"
>> +						"is required to access performance "
>> +						"monitoring.\n"
>> +						"\n"
>> +						ANSI_HEADER "Through CAP_PERFMON "
>> +						"capability"
>> +						ANSI_RESET "\n"
>> +						"cd /path/to/igt-gpu-tools/\n"
>> +						"sudo setcap cap_perfmon=+ep $(pwd)/"
>> +						"build/tools/gputop/gputop\n"
>> +						"sudo sh -c \"echo $(pwd)/build/lib >"
>> +						" /etc/ld.so.conf.d/lib-igt.conf\"\n"
>> +						"sudo ldconfig\n"
>> +						ANSI_HEADER "Revert:" ANSI_RESET "\n"
>> +						"sudo setcap cap_perfmon=-ep $(pwd)/"
>> +						"build/tools/gputop/gputop\n"
>> +						"sudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
>> +						"sudo ldconfig\n"
>> +						"\n"
>> +						ANSI_HEADER "Through perf_event_paranoid"
>> +						" (system-wide policy)"
>> +						ANSI_RESET "\n"
>> +						"# Save current value\n"
>> +						"orig_val=$(sysctl -n "
>> +						"kernel.perf_event_paranoid)\n"
>> +						"# Allow non-root perf usage\n"
>> +						"sudo sysctl -w kernel.perf_event_paranoid=-1\n"
>> +						ANSI_HEADER "Revert:" ANSI_RESET "\n"
>> +						"sudo sysctl -w kernel."
>> +						"perf_event_paranoid=$orig_val\n"
>> +						"\n"
>> +						"For details, see 'Perf events and "
>> +						"tool security':\n"
>> +						"https://www.kernel.org/doc/html/"
>> +						"latest/admin-guide/perf-security.html\n");
>> +					igt_devices_free();
>> +					gputop_clean_up();
>> +					return EXIT_SUCCESS;
>> +				} else {
>> +					fprintf(stderr,
>> +						"Failed to initialize PMU! (%s)\n",
>> +						strerror(errno));
>> +					igt_devices_free();
>> +					gputop_clean_up();
>> +					return EXIT_FAILURE;
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>> +	for (int i = 0; drivers[i]; i++) {
>> +		for (int j = 0;
>> +		     per_driver_contexts[i].device_present && j < per_driver_contexts[i].len;
>> +		     j++)
>> +			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +	}
>> +
>>   	clients = igt_drm_clients_init(NULL);
>>   	if (!clients)
>>   		exit(1);
>> @@ -449,22 +627,47 @@ int main(int argc, char **argv)
>>   
>>   	while ((n != 0) && !stop_top) {
>>   		struct igt_drm_client *c, *prevc = NULL;
>> -		int i, engine_w = 0, lines = 0;
>> +		int k, engine_w = 0, lines = 0;
>>   
>>   		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>> +
>> +		for (int i = 0; drivers[i]; i++) {
>> +			for (int j = 0;
>> +			     per_driver_contexts[i].device_present &&
>> +			     j < per_driver_contexts[i].len;
>> +			     j++)
>> +				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +		}
>> +
>>   		igt_drm_clients_sort(clients, client_cmp);
>>   
>>   		update_console_size(&con_w, &con_h);
>>   		clrscr();
>>   
>> +		for (int i = 0; drivers[i]; i++) {
>> +			for (int j = 0;
>> +			     per_driver_contexts[i].device_present &&
>> +			     j < per_driver_contexts[i].len;
>> +			     j++) {
>> +				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
>> +							 lines, con_w, con_h);
>> +			}
>> +		}
>> +
>>   		if (!clients->num_clients) {
>> -			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>> +			const char *msg;
>> +
>> +			if (is_root)
>> +				msg = " (No GPU clients yet. Start workload to see stats)";
>> +			else
>> +				msg = " (GPU client busyness is only available with root"
>> +				" privileges)";
>>   
>>   			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
>>   			       (int)(con_w - strlen(msg) - 1), msg);
>>   		}
>>   
>> -		igt_for_each_drm_client(clients, c, i) {
>> +		igt_for_each_drm_client(clients, c, k) {
>>   			assert(c->status != IGT_DRM_CLIENT_PROBE);
>>   			if (c->status != IGT_DRM_CLIENT_ALIVE)
>>   				break; /* Active clients are first in the array. */
>> @@ -488,11 +691,11 @@ int main(int argc, char **argv)
>>   	}
>>   
>>   	igt_drm_clients_free(clients);
>> +	gputop_clean_up();
>>   
>>   	if (profiled_devices != NULL) {
>>   		igt_devices_configure_profiling(profiled_devices, false);
>>   		igt_devices_free_profiling(profiled_devices);
>>   	}
>> -
>>   	return 0;
>>   }
>> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
>> new file mode 100644
>> index 000000000..4766d8496
>> --- /dev/null
>> +++ b/tools/gputop/meson.build
>> @@ -0,0 +1,6 @@
>> +gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
>> +executable('gputop', sources : gputop_src,
>> +           install : true,
>> +           install_rpath : bindir_rpathdir,
>> +           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
>> +	   install: true)
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 8185ba160..99a732942 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -70,11 +70,6 @@ if libudev.found()
>>   		   install : true)
>>   endif
>>   
>> -executable('gputop', 'gputop.c',
>> -           install : true,
>> -           install_rpath : bindir_rpathdir,
>> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
>> -
>>   intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>>   executable('intel_l3_parity', sources : intel_l3_parity_src,
>>   	   dependencies : tool_deps,
>> @@ -123,3 +118,4 @@ endif
>>   subdir('i915-perf')
>>   subdir('xe-perf')
>>   subdir('null_state_gen')
>> +subdir('gputop')
>> -- 
>> 2.34.1
>>
--------------xB0K6wTV4MjFf19kZArzXWXx
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Kamil,</p>
    <div class="moz-cite-prefix">On 13-12-2025 03:11, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251212214122.uzu2gcvuj23ejfyz@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Soham,
On 2025-12-09 at 23:05:13 +0530, Soham Purkait wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce vendor-agnostic support for handling multiple GPUs and instances
in gputop. Improve the tool's adaptability to various GPU configurations.

v1:
 - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
v2:
 - Add device filter to populate the array of cards for
   all supported drivers. (Zbigniew)
v3:
 - Cosmetic changes. (Riana)
 - Avoid three level indentation. (Riana)
v4:
 - Add user message for running without root privileges. (Kamil)
v5:
 - Add support for GPU client-only busyness on unsupported
   drivers as a fallback mechanism. (Kamil)

Signed-off-by: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
---
 tools/{ =&gt; gputop}/gputop.c | 283 +++++++++++++++++++++++++++++++-----
 tools/gputop/meson.build    |   6 +
 tools/meson.build           |   6 +-
 3 files changed, 250 insertions(+), 45 deletions(-)
 rename tools/{ =&gt; gputop}/gputop.c (59%)
 create mode 100644 tools/gputop/meson.build

diff --git a/tools/gputop.c b/tools/gputop/gputop.c
similarity index 59%
rename from tools/gputop.c
rename to tools/gputop/gputop.c
index f577a1750..e13f98b82 100644
--- a/tools/gputop.c
+++ b/tools/gputop/gputop.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2025 Intel Corporation
  */
 
 #include &lt;assert.h&gt;
@@ -14,66 +14,148 @@
 #include &lt;math.h&gt;
 #include &lt;poll.h&gt;
 #include &lt;signal.h&gt;
+#include &lt;stdbool.h&gt;
 #include &lt;stdint.h&gt;
 #include &lt;stdio.h&gt;
 #include &lt;stdlib.h&gt;
 #include &lt;string.h&gt;
 #include &lt;sys/ioctl.h&gt;
 #include &lt;sys/stat.h&gt;
+#include &lt;sys/sysmacros.h&gt;
 #include &lt;sys/types.h&gt;
-#include &lt;unistd.h&gt;
 #include &lt;termios.h&gt;
-#include &lt;sys/sysmacros.h&gt;
-#include &lt;stdbool.h&gt;
+#include &lt;unistd.h&gt;
 
 #include &quot;igt_core.h&quot;
 #include &quot;igt_drm_clients.h&quot;
 #include &quot;igt_drm_fdinfo.h&quot;
+#include &quot;igt_perf.h&quot;
 #include &quot;igt_profiling.h&quot;
-#include &quot;drmtest.h&quot;
+#include &quot;xe_gputop.h&quot;
+#include &quot;xe/xe_query.h&quot;
+
+/**
+ * Supported Drivers
+ *
+ * Adhere to the following requirements when implementing support for the
+ * new driver:
+ * @drivers: Update drivers[] with driver string.
+ * @sizeof_gputop_obj: Update this function as per new driver support included.
+ * @operations: Update the respective operations of the new driver:
+ * gputop_init,
+ * discover_engines,
+ * pmu_init,
+ * pmu_sample,
+ * print_engines,
+ * clean_up
+ * @per_driver_contexts: Update per_driver_contexts[] array of type &quot;struct gputop_driver&quot; with the
+ * initial values.
+ */
+static const char * const drivers[] = {
+	&quot;xe&quot;,
+    /* Keep the last one as NULL */
+	NULL
+};
+
+static size_t sizeof_gputop_obj(int driver_num)
+{
+	switch (driver_num) {
+	case 0:
+		return sizeof(struct xe_gputop);
+	default:
+		fprintf(stderr,
+			&quot;Driver number does not exist.\n&quot;);
+		exit(EXIT_FAILURE);
+	}
+}
+
+/**
+ * Supported operations on driver instances. Update the ops[] array for
+ * each individual driver specific function. Maintain the sequence as per
+ * drivers[] array.
+ */
+struct device_operations ops[] = {
+	{
+		xe_gputop_init,
+		xe_populate_engines,
+		xe_pmu_init,
+		xe_pmu_sample,
+		xe_print_engines,
+		xe_clean_up
+	}
+};
+
+/*
+ * per_driver_contexts[] array of type struct gputop_driver which keeps track of the devices
+ * and related info discovered per driver.
+ */
+struct gputop_driver per_driver_contexts[] = {
+	{false, 0, NULL}
+};
 
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
 	UTILIZATION_TYPE_TOTAL_CYCLES,
 };
 
-static const char *bars[] = { &quot; &quot;, &quot;▏&quot;, &quot;▎&quot;, &quot;▍&quot;, &quot;▌&quot;, &quot;▋&quot;, &quot;▊&quot;, &quot;▉&quot;, &quot;█&quot; };
-
-#define ANSI_HEADER &quot;\033[7m&quot;
-#define ANSI_RESET &quot;\033[0m&quot;
-
-static void n_spaces(const unsigned int n)
+static void gputop_clean_up(void)
 {
-	unsigned int i;
-
-	for (i = 0; i &lt; n; i++)
-		putchar(' ');
+	for (int i = 0; drivers[i]; i++) {
+		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
+		free(per_driver_contexts[i].instances);
+		per_driver_contexts[i].device_present = false;
+		per_driver_contexts[i].len = 0;
+	}
 }
 
-static void print_percentage_bar(double percent, int max_len)
+static int find_driver(struct igt_device_card *card)
 {
-	int bar_len, i, len = max_len - 1;
-	const int w = 8;
-
-	len -= printf(&quot;|%5.1f%% &quot;, percent);
-
-	/* no space left for bars, do what we can */
-	if (len &lt; 0)
-		len = 0;
-
-	bar_len = ceil(w * percent * len / 100.0);
-	if (bar_len &gt; w * len)
-		bar_len = w * len;
+	for (int i = 0; drivers[i]; i++) {
+		if (strcmp(drivers[i], card-&gt;driver) == 0)
+			return i;
+	}
+	return -1;
+}
 
-	for (i = bar_len; i &gt;= w; i -= w)
-		printf(&quot;%s&quot;, bars[w]);
-	if (i)
-		printf(&quot;%s&quot;, bars[i]);
+static int populate_device_instances(const char *filter)
+{
+	struct igt_device_card *cards = NULL;
+	struct igt_device_card *card_inplace = NULL;
+	struct gputop_driver *driver_entry =  NULL;
+	int driver_no;
+	int count, final_count = 0;
+
+	count = igt_device_card_match_all(filter, &amp;cards);
+	for (int j = 0; j &lt; count; j++) {
+		if (strcmp(cards[j].subsystem, &quot;pci&quot;) != 0)
+			continue;
 
-	len -= (bar_len + (w - 1)) / w;
-	n_spaces(len);
+		driver_no = find_driver(&amp;cards[j]);
+		if (driver_no &lt; 0)
+			continue;
 
-	putchar('|');
+		driver_entry = &amp;per_driver_contexts[driver_no];
+		if (!driver_entry-&gt;device_present)
+			driver_entry-&gt;device_present = true;
+		driver_entry-&gt;len++;
+		driver_entry-&gt;instances = realloc(driver_entry-&gt;instances,
+						  driver_entry-&gt;len * sizeof_gputop_obj(driver_no));
+		if (!driver_entry-&gt;instances) {
+			fprintf(stderr,
+				&quot;Device instance realloc failed (%s)\n&quot;,
+				strerror(errno));
+			exit(EXIT_FAILURE);
+		}
+		card_inplace = (struct igt_device_card *)
+				calloc(1, sizeof(struct igt_device_card));
+		memcpy(card_inplace, &amp;cards[j], sizeof(struct igt_device_card));
+		ops[driver_no].gputop_init(driver_entry-&gt;instances, (driver_entry-&gt;len - 1),
+			card_inplace);
+		final_count++;
+	}
+	if (count)
+		free(cards);
+	return final_count;
 }
 
 static int
@@ -333,6 +415,7 @@ static void clrscr(void)
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
+	char *device;
 };
 
 static void help(char *full_path)
@@ -350,16 +433,18 @@ static void help(char *full_path)
 	       &quot;\t-h, --help                show this help\n&quot;
 	       &quot;\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n&quot;
 	       &quot;\t-n, --iterations =NUMBER  number of executions\n&quot;
+	       &quot;\t-D, --device              Device filter\n&quot;
 	       , short_program_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 {
-	static const char cmdopts_s[] = &quot;hn:d:&quot;;
+	static const char cmdopts_s[] = &quot;hn:d:D:&quot;;
 	static const struct option cmdopts[] = {
 	       {&quot;help&quot;, no_argument, 0, 'h'},
 	       {&quot;delay&quot;, required_argument, 0, 'd'},
 	       {&quot;iterations&quot;, required_argument, 0, 'n'},
+	       {&quot;device&quot;, required_argument, 0, 'D'},
 	       { }
 	};
 
@@ -367,6 +452,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	memset(args, 0, sizeof(*args));
 	args-&gt;n_iter = -1;
 	args-&gt;delay_usec = 2 * USEC_PER_SEC;
+	args-&gt;device = NULL;
 
 	for (;;) {
 		int c, idx = 0;
@@ -390,6 +476,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 				return -1;
 			}
 			break;
+		case 'D':
+			args-&gt;device = optarg;
+			break;
 		case 'h':
 			help(argv[0]);
 			return 0;
@@ -417,9 +506,12 @@ int main(int argc, char **argv)
 	struct igt_profiled_device *profiled_devices = NULL;
 	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
+	bool is_root;
 	int ret;
 	long n;
 
+	is_root = (geteuid() == 0);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Note that this is not required when a user is in a group.
Better way is to just try to open a file and only when it fails
act accordingly.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
 	ret = parse_args(argc, argv, &amp;args);
 	if (ret &lt; 0)
 		return EXIT_FAILURE;
@@ -429,6 +521,92 @@ int main(int argc, char **argv)
 	n = args.n_iter;
 	period_us = args.delay_usec;
 
+	if (!populate_device_instances(args.device ? args.device
+				       : &quot;device:subsystem=pci,card=all&quot;) &amp;&amp;
+				       geteuid()) {
+		printf(&quot;\n&quot; ANSI_HEADER &quot;Run with root &quot;
+		       &quot;privileges for GPU client &quot;
+		       &quot;busyness.\n&quot; ANSI_RESET &quot;\n&quot;);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So you still need a root, as I said it is a regression.</pre>
    </blockquote>
    <p>By the way, If you are referring to GPU client busyness, this is
      not implemented by this patch as it is already there in the IGT
      as&nbsp; &quot;<span style="white-space: pre-wrap">tools/gputop&quot;. This patch is just the extension of the same to show per engine busyness along with client busyness which is already there.</span></p>
    <p><span style="white-space: pre-wrap">Thanks,
Soham. </span></p>
    <blockquote type="cite" cite="mid:20251212214122.uzu2gcvuj23ejfyz@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">
Imho looks like you want to create a new tool ngputop.
You could create it in tools/ngputop.src/ &lt;- most source files here
and link into executable tools/ngputop

In a new tool you could require to have a root or group or caps.

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		gputop_clean_up();
+		exit(1);
+	}
+
+	for (int i = 0; drivers[i]; i++) {
+		if (!per_driver_contexts[i].device_present)
+			continue;
+
+		for (int j = 0; j &lt; per_driver_contexts[i].len; j++) {
+			if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
+				fprintf(stderr,
+					&quot;Failed to initialize engines! (%s)\n&quot;,
+					strerror(errno));
+					gputop_clean_up();
+				return EXIT_FAILURE;
+			}
+			ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
+
+			if (ret) {
+				if (errno == EACCES &amp;&amp; !is_root) {
+					fprintf(stderr,
+						&quot;\n&quot;
+						&quot;When running as a normal user, &quot;
+						&quot;CAP_PERFMON or perf_event_paranoid\n&quot;
+						&quot;is required to access performance &quot;
+						&quot;monitoring.\n&quot;
+						&quot;\n&quot;
+						ANSI_HEADER &quot;Through CAP_PERFMON &quot;
+						&quot;capability&quot;
+						ANSI_RESET &quot;\n&quot;
+						&quot;cd /path/to/igt-gpu-tools/\n&quot;
+						&quot;sudo setcap cap_perfmon=+ep $(pwd)/&quot;
+						&quot;build/tools/gputop/gputop\n&quot;
+						&quot;sudo sh -c \&quot;echo $(pwd)/build/lib &gt;&quot;
+						&quot; /etc/ld.so.conf.d/lib-igt.conf\&quot;\n&quot;
+						&quot;sudo ldconfig\n&quot;
+						ANSI_HEADER &quot;Revert:&quot; ANSI_RESET &quot;\n&quot;
+						&quot;sudo setcap cap_perfmon=-ep $(pwd)/&quot;
+						&quot;build/tools/gputop/gputop\n&quot;
+						&quot;sudo rm /etc/ld.so.conf.d/lib-igt.conf\n&quot;
+						&quot;sudo ldconfig\n&quot;
+						&quot;\n&quot;
+						ANSI_HEADER &quot;Through perf_event_paranoid&quot;
+						&quot; (system-wide policy)&quot;
+						ANSI_RESET &quot;\n&quot;
+						&quot;# Save current value\n&quot;
+						&quot;orig_val=$(sysctl -n &quot;
+						&quot;kernel.perf_event_paranoid)\n&quot;
+						&quot;# Allow non-root perf usage\n&quot;
+						&quot;sudo sysctl -w kernel.perf_event_paranoid=-1\n&quot;
+						ANSI_HEADER &quot;Revert:&quot; ANSI_RESET &quot;\n&quot;
+						&quot;sudo sysctl -w kernel.&quot;
+						&quot;perf_event_paranoid=$orig_val\n&quot;
+						&quot;\n&quot;
+						&quot;For details, see 'Perf events and &quot;
+						&quot;tool security':\n&quot;
+						<a class="moz-txt-link-rfc2396E" href="https://www.kernel.org/doc/html/">&quot;https://www.kernel.org/doc/html/&quot;</a>
+						&quot;latest/admin-guide/perf-security.html\n&quot;);
+					igt_devices_free();
+					gputop_clean_up();
+					return EXIT_SUCCESS;
+				} else {
+					fprintf(stderr,
+						&quot;Failed to initialize PMU! (%s)\n&quot;,
+						strerror(errno));
+					igt_devices_free();
+					gputop_clean_up();
+					return EXIT_FAILURE;
+				}
+			}
+		}
+	}
+
+	for (int i = 0; drivers[i]; i++) {
+		for (int j = 0;
+		     per_driver_contexts[i].device_present &amp;&amp; j &lt; per_driver_contexts[i].len;
+		     j++)
+			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
+	}
+
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
 		exit(1);
@@ -449,22 +627,47 @@ int main(int argc, char **argv)
 
 	while ((n != 0) &amp;&amp; !stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
-		int i, engine_w = 0, lines = 0;
+		int k, engine_w = 0, lines = 0;
 
 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
+
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0;
+			     per_driver_contexts[i].device_present &amp;&amp;
+			     j &lt; per_driver_contexts[i].len;
+			     j++)
+				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
+		}
+
 		igt_drm_clients_sort(clients, client_cmp);
 
 		update_console_size(&amp;con_w, &amp;con_h);
 		clrscr();
 
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0;
+			     per_driver_contexts[i].device_present &amp;&amp;
+			     j &lt; per_driver_contexts[i].len;
+			     j++) {
+				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
+							 lines, con_w, con_h);
+			}
+		}
+
 		if (!clients-&gt;num_clients) {
-			const char *msg = &quot; (No GPU clients yet. Start workload to see stats)&quot;;
+			const char *msg;
+
+			if (is_root)
+				msg = &quot; (No GPU clients yet. Start workload to see stats)&quot;;
+			else
+				msg = &quot; (GPU client busyness is only available with root&quot;
+				&quot; privileges)&quot;;
 
 			printf(ANSI_HEADER &quot;%-*s&quot; ANSI_RESET &quot;\n&quot;,
 			       (int)(con_w - strlen(msg) - 1), msg);
 		}
 
-		igt_for_each_drm_client(clients, c, i) {
+		igt_for_each_drm_client(clients, c, k) {
 			assert(c-&gt;status != IGT_DRM_CLIENT_PROBE);
 			if (c-&gt;status != IGT_DRM_CLIENT_ALIVE)
 				break; /* Active clients are first in the array. */
@@ -488,11 +691,11 @@ int main(int argc, char **argv)
 	}
 
 	igt_drm_clients_free(clients);
+	gputop_clean_up();
 
 	if (profiled_devices != NULL) {
 		igt_devices_configure_profiling(profiled_devices, false);
 		igt_devices_free_profiling(profiled_devices);
 	}
-
 	return 0;
 }
diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
new file mode 100644
index 000000000..4766d8496
--- /dev/null
+++ b/tools/gputop/meson.build
@@ -0,0 +1,6 @@
+gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
+executable('gputop', sources : gputop_src,
+           install : true,
+           install_rpath : bindir_rpathdir,
+           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
+	   install: true)
diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..99a732942 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -70,11 +70,6 @@ if libudev.found()
 		   install : true)
 endif
 
-executable('gputop', 'gputop.c',
-           install : true,
-           install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
-
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
 	   dependencies : tool_deps,
@@ -123,3 +118,4 @@ endif
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
+subdir('gputop')
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------xB0K6wTV4MjFf19kZArzXWXx--
