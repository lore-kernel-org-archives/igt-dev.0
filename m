Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B669C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 10:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7E710E093;
	Mon, 12 Aug 2024 10:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1d8WFtX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9775A10E093
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723459926; x=1754995926;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bC0bVnPcAV5fCDLHkCJA0iJVU3uAELUyBlXVA6MZ8Lg=;
 b=g1d8WFtXAV9yKSu+8hDnU+rJRW2buwxOr9yMvPejQgVRfH8LlwQas6sG
 83mGvFFDIrQ/y8190SmM6vNbKOiL0r8YXOqhyFl47KwtEuujAL7N9F6Cs
 K2PPHSTqyEPPKzVX7imPaH5kcMC3G/4hPFFkeC58XWJ+uymak1vkTlMyw
 YWbarVFdezoFroCiskOfFRLeKVSJ7OADNYkgJO9UX3EaRZ4nl4mVL/C48
 1+iLLXEa17jYPF3rpiqXP0ltNTSjFd9FE9/XtICwKR0xxEJZG94ZfUpO2
 acK0KD9/a9xh90FYoCqCEiS+m8sbfN/UgPnikUg19xchE5MQeY7gOIQhF A==;
X-CSE-ConnectionGUID: 006revtcSnGpTdXsCqy1oA==
X-CSE-MsgGUID: 6d5dvwIGQdO6S5zG5oueQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21126852"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21126852"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 03:52:05 -0700
X-CSE-ConnectionGUID: DiAPXuV5TGOxDUw0AfsCtQ==
X-CSE-MsgGUID: K6cCmv2rRWqTzuLWmlpp2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58126612"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 03:52:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 03:52:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 03:52:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 03:52:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ef3eNlbFHofQQCrdZ1hcYwuOgL49Hlll8fgEWMeEHB+SeebB1yx3qxnGZNRqUi6TscnfzLLxrF9hZM5kDQ0wGMPvinxrViiQKFIsgpGXVUXhRKUeKNjsmDy65ZbizC8sg1cfm2SLf4229ryu/24tL8A/lqQc06mbACiwgfUPMf9PLvBpxRXeBvysjWdHydVtJHnEJKX+zgj5Gis0lvD0E4wcZrI/6NvuLJ14RKx6ZV3JSjLg+ZLOc6WyTlHvc9Tk2U5GtAnzTi/Zn9Iw6AKV7xn0+XmLs5q/JdUoMoEI0VTtoSMHibNemZBVVZMtht53/xZRMp4tcYgLRknANpyUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiK+y84mIWPyyc7mCQv32lLsHvk6DAFSuJ9JifXr9Mc=;
 b=L7wo6OOvIXManP1BsWC4lQZm2uzpxgFM/Nnv5kJIvgJgsI14VrnGK27eTKSt99KrUOw1OEaONYhYss/L29KUEEbaMpdIhU2NC1JDOnd55SmOL1wgnKJ1viFW1yGr6SHKBmsriN3799/04ibcRFiXb57g5R93uiWXm2HODRdCrFdmieOXBo4wf6s1x3Q8w0q1XM8J6/6e7LuHziHtUgZjdIeiLYSLzzkPJ/rJHmVQCXVl2I2EEFqipZh1zTgY9Hynlen6qMu9BwzUwCmNoN3ORJPFbo59j0rB4nLIxUUCrwz2wnBrpTUjs4rSLUoHn1vdipuyPheGsUle/5EJwCyZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Mon, 12 Aug
 2024 10:52:02 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 10:52:02 +0000
Message-ID: <097077d7-f9cc-4f1a-9327-000ce72a0acf@intel.com>
Date: Mon, 12 Aug 2024 16:21:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without
 display
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
 <20240801114553.gmb4lpfb4i2xnico@kamilkon-DESK.igk.intel.com>
 <8fba7a7c-47f0-436c-b839-635a5edec4f9@intel.com>
 <20240806125020.jygbaulfsnpv6rqd@kamilkon-DESK.igk.intel.com>
 <5cc321f5-a3e7-491c-b45b-e821caf424a2@intel.com>
 <20240809101003.stg7tgdqxh36hj4z@kamilkon-DESK.igk.intel.com>
 <61358f2a-1739-499c-bb7f-572c469e7a45@intel.com>
Content-Language: en-US
In-Reply-To: <61358f2a-1739-499c-bb7f-572c469e7a45@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::17) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|MW4PR11MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: f989b7e8-7f59-467e-f98c-08dcbabccc14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STJYNzN3RUMzQXpJejYxNy9JRTFLUWlReWhkYkJsNmtnNlZteHo3RTNIWUtD?=
 =?utf-8?B?aXB3QVVZUUJBV29jN09iMzhQNW9yUDdKLzB2YXpsc0NDZ3NEbzEvbTRkMHRO?=
 =?utf-8?B?bmJYR3FLK2NkQnllNDl2bDlESnhmWnJ5Zm9SRTJyUUluM2MwTUhXclVFdUlj?=
 =?utf-8?B?UUtGODlGbGpWMkpoZGxvWnVyRFBsdTB1VkJmcWN0RFRyVlRUSGs0cE1oTTN1?=
 =?utf-8?B?dUZCa3N5aGE2SmVST3F3Y2FiYlZNWFlTb1V0cFk2Vm9TTWhZVUZTWjhQY29O?=
 =?utf-8?B?WU15MUVPaDlJL0ZEcVVpREhaVnlsU0NKMHJ0V2txMUswTm40RExMbGsrcE84?=
 =?utf-8?B?TDdGanVuN1BXSzhza0RhVktiWFJlSTVWSWUrSDVmMXo5NmZINFAxUXVseVVt?=
 =?utf-8?B?bllrZThyeG0wVi8xbnhuZGM4bFYzbCtRcXVpMy9GWWJHV1IzN2JUY3BoaTNL?=
 =?utf-8?B?M0lsMW8wQnMrK0Q1cEMrT0FuUi81WkJpclJDemJtbTlkVzVUanZBR2s1QlJ1?=
 =?utf-8?B?K2ozSHpCZldTb3MxK2JDRFBkUEdrM1NVaFZhc200U3FieEZNTHBTN0JvY0JR?=
 =?utf-8?B?UjFNRGw3TjJ5NlI5Nytla2FzK1F6bzk3RG5pKzRVNlVjMXcyRVBqNExjTW00?=
 =?utf-8?B?Yk9vdkRxK1FROFVkZDd3SndQbWlwL3V5QXVONGlkVHFMdHBzZDR4VTdnaUpq?=
 =?utf-8?B?STAvcXp3R2dnM05NNnRzUG5sU056VWVkQ0FWdHYzSU5ReExmWkJ2ZlR2dzBs?=
 =?utf-8?B?cVF5aVZCaEJYV0JJblljR2ZISU9LamRuZnpDcU1BUjhCT0pYbGFwMXlJWWZ0?=
 =?utf-8?B?QTl6T1B3WmNBeGtZaXcxdkR5V3dpTUpGc291STdaUWViNDdQWHg1aHR2SXpU?=
 =?utf-8?B?Q2FaQ09paTdqb09TS296emhoNXNod3ZVemJOK01FalJQYzlnNmlpTVRxd3Mx?=
 =?utf-8?B?S3FhWlhrTzNnQTRrbG1wKzk1YzI1cWxIWWtib3BPb3NwVVQ1T01WWFluVGht?=
 =?utf-8?B?OUw2QVJsc096enlBSStyUS95UlVUbGYySTFLSW9tWStMallxelE0QWF0MjJH?=
 =?utf-8?B?YllCN3d2ZzM3NWQ2OGR1UTh5Ri9JcG5GdU95enVGc05qb3A3VE4yNXlGWXUx?=
 =?utf-8?B?L2dxY1ZQdlJLclpGekxzKzJDdlNzUU9uNHJSUFhYeVEvK0x5dFRwbHVYbUN2?=
 =?utf-8?B?TWdrV0xFMjBvRHFqTnJDbENteVpoVFZhUnVvelM3MC9aNGRFeTlINFR0TjEz?=
 =?utf-8?B?SUIxWktURitOSkNWUHFzbHl4bHJWY1pKWlhBMjBaOHZqMjRUS3dIQk0wVEtO?=
 =?utf-8?B?NjZzUXZoN2orM2FXT2xHVmlQbUl1TENUbzk0SitidTlYLzZmNm5rbW53SGxL?=
 =?utf-8?B?TC9jOXZrYSt2Z1FEU3ZBZWdPcEgxY0VXcDM0bkJkWjFXRVNHKzYwZVdHYzd6?=
 =?utf-8?B?U29icWtoaG55Mi80ODZMTG5RYUVUcG9ySkJEK2doQzJ2M1ZtQks3dGc3TTFR?=
 =?utf-8?B?V0tYQmdGN21vZmJsSzdMWEg1UDRyQmNQV2svRWtCWkEzMnk2dkJMRjRwMklU?=
 =?utf-8?B?TU5hMVNFREU5d2xDeEFuTHlzVjhWM1ljMjFDMUhyQUR1NTgwZHhiOXNuOTJT?=
 =?utf-8?B?N3ZUL1FhQ3ZvQTVCcjJEOUVmazFxMlphTmZBQzNWQmtuMFEvSXljZHRPeU9l?=
 =?utf-8?B?di9nQ21UN0NRK2FzMm03ampnT2NHZ1FYTlh1aElDOG90UEhBY3o3VUtlV1JC?=
 =?utf-8?B?VlhZVW1ZVTZWYnlVdzRwaHlpaERGQyt3ZXFpUFdRUDVTOXgxUjhQeTNQZHQ2?=
 =?utf-8?B?S1RNUnkwVi9lWXI3VVlYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0I1ZWxQOVdUYmlKMnNiZ3hmSHBPQ2E1eTFMWHNiTG41NXY1WnNjN0JRdUps?=
 =?utf-8?B?ejdEWk8vYndVaStqYXNkK3hRVkRMc21mVWpKNWEvUHpwb0d3Z3BjYVFwQzF0?=
 =?utf-8?B?RHRiWUNYSFE0KzlaR0tnNUxmTVVoamt4Z2RpMmE2UHFyTG1rNy9XZHUrcmhk?=
 =?utf-8?B?Z211eWt0S242VGF3czVYdWNXSUo4WVZvYkEyRGkyblk3dUN6WkZWc1QvTUx1?=
 =?utf-8?B?eDBYVC9hdjQ1Y1pLM1ZBMGQ3dVJKNUtQcFJQTXpRckZhNmdOeUNQT3Rxa1FX?=
 =?utf-8?B?NHBTUGI2YnAwNCttMTVXZi9Zc091anlERmhxak1VKzlOVms3VUFONnhscVIr?=
 =?utf-8?B?NzFTYkVQSi9rSVVUS0JQcndBQVdtVDJOVU00c0N3dVdndWUzMk81czF1ckty?=
 =?utf-8?B?WitEZy9iUFFEaHJvdG5qSUFIc2V5YnZIU0E2YjBuTzFTYTBVVHducUEwMHl1?=
 =?utf-8?B?Ukd5ZFh4ZmwzakhobHdnQ3V5ZkxjWnZuSG1saFJHbE96V0Ryby9CVysyYjZt?=
 =?utf-8?B?eFYwaTU2MWRmOHAzalQ3blEwTk13a05QQVVkTjFXKzYwd0ppOTZSa3ZIcjk2?=
 =?utf-8?B?NnBtN1NHN1R2bkpxRS84cFBMZTVaaHFVa2RHaUpINHg0Y0FiNHljeXJnK1g5?=
 =?utf-8?B?TDZoNHZ5OEZ6YTVZbENvYU40Y1VreFIvQ2FsVThQR3ZpSzErSkMxODhTUTZo?=
 =?utf-8?B?dVFGbUZxUi9Hem1Nd0grY09ZZjcrdjZaQmlNWm1vWTl3TkVBLzBqYUxzMzZT?=
 =?utf-8?B?Ni8ySW1wV0NzN2JjU05BbW9yS0ZEOVpKUVpnMTUzNEpIcnpORHliSVZIeVlM?=
 =?utf-8?B?VzFQZlVnMTZkSzJLQ0FrUUVTM2wxODRUbUpob2hxQ2tkNnlpKzcxWE9UUjc3?=
 =?utf-8?B?eDN4U1JEVmdXN0ZVYm1hMC9GWVY5T3lqRUNDSyt3elVVZXNWMVRkMlhUSmJI?=
 =?utf-8?B?VnQ1UUVYNHp0WVZvQ2h4azhYMUxJVWJmVkNOQTBjWmxpY1E0Q0lNSFFHY2tL?=
 =?utf-8?B?dW8wMVNNZEpRd01hR2hPdEM2SDRsK1UvSjRReVJlZFJSRitLb0xobHUyNmZ0?=
 =?utf-8?B?VitMTHg2R2tsWVg4aW1rSGg5UnNpZXcvTXJrMnNLSUpiQURkK1VxNW1XQTFx?=
 =?utf-8?B?M1ZZR2NpQnN0NkROL2NOWUFhVFcyenk2SnFNSFhDNy9vN1R6UmQrbmF6L2V3?=
 =?utf-8?B?T2ZWd0dCQjNKWGZaK1dZUjFma0FFMC9nYlBERHVWZjI0aDNPNjFYWWMvTG5a?=
 =?utf-8?B?NHNHRFdvOWtJUEdvTGRzTkJkYzVtYW1DMXFKQms2QzRyVVBoSEl1M2diK1Ni?=
 =?utf-8?B?Sk0rSVJ3QXZVZDdPQVJrYUdFdGlQMVBxTU1Yc0tLanNLZTNxK3ROOXFzWjc2?=
 =?utf-8?B?SGxkczYyenh4MS9tNldvcks2amRXekNhTWk3UVdlUmFiLzZJbzZMMUU5MEFy?=
 =?utf-8?B?a3RhUEhWZWt3QTBXZjRlZmNEbThMaWVjeU5tdlRCQkRYcGRaT0NFK214RWVG?=
 =?utf-8?B?MWNaZWJMMTZCVXB4OXI0T3Zud0s5eWZsYzM0OGNTKzl1MEtVTGJOVFhYallD?=
 =?utf-8?B?T29wT29lNU1WcGUvSm1LSkdkWkNlTHFURG5HcHlTaHprV1kwL3oxbk5QczIx?=
 =?utf-8?B?UDJ6M0dxQjlPN1NTUVgzem5wVTNmbFc3clM0NHJ5aWNLQnNGeEhzcm9xbE5x?=
 =?utf-8?B?d2FKWE5jYXY1V3BEcHljL05qTDdyMFFmS0svT2M2dUNtOGF6THdWcnFYNjhD?=
 =?utf-8?B?WG9BTkVuTVNoU3BGUWdVNG05dUtJcjlpM3pOTjBvSExYOGdDRDlrK2Evc3Fm?=
 =?utf-8?B?WjZIdEFGdFRxRlRCRjlsUWRIZTg2a08yeXdCbllqbkVMZ2g0eVRnVDZzMGRs?=
 =?utf-8?B?ek9RMEVsQXhjR2IxTG1adVIvZ0dHV1JPOFpRUGx5U2pqdGhYRWRMaTV3cXFn?=
 =?utf-8?B?d2ZXNGtNckdIN3FVekxsd0RHS0x5d0hhYmxaS1lCOC80ZXMrbXVhaVI0bGVK?=
 =?utf-8?B?aWFtUWlXam4yZmlyWng3eW5qREg5dFJ0ektPc0lFWC9wckRlYmxmMmRsTjZU?=
 =?utf-8?B?UlJUWFBhTTU1aTN6NHNqS0RvUjBvR0Z4ZW9kYW13TVlIL3ptclA5V3RRalBp?=
 =?utf-8?B?TnBLUXB4bHFRZmcvRnd5bFJ4WkdTNkYzdDRYMnpPenorT0h0UERSTTh0OURs?=
 =?utf-8?Q?Ov8tEFekoeWsa7n5T1W0f6s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f989b7e8-7f59-467e-f98c-08dcbabccc14
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 10:52:02.4158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5VMmgb2rg9hI3vbvrRNv2hRFdfYdB/Ho8iizrRvw1yEczRE+0Sv4acLSn+EFnYu8JbGGhdCXlMsAMtBAdTgdeveI4SBjUhKbjMcvgL2r7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6689
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


On 8/9/2024 5:12 PM, Sundaresan, Sujaritha wrote:
>
> On 8/9/2024 3:40 PM, Kamil Konieczny wrote:
>> Hi Sundaresan,,
>> On 2024-08-09 at 14:34:23 +0530, Sundaresan, Sujaritha wrote:
>>> On 8/6/2024 6:20 PM, Kamil Konieczny wrote:
>>>> Hi Sundaresan,,
>>>> On 2024-08-06 at 11:50:46 +0530, Sundaresan, Sujaritha wrote:
>>>>> On 8/1/2024 5:15 PM, Kamil Konieczny wrote:
>>>>>> Hi Sujaritha,
>>>>>> On 2024-07-30 at 17:05:08 +0530, Sujaritha Sundaresan wrote:
>>>>>>
>>>>>> small nit about subject, you wrote:
>>>>>>
>>>>>> [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without 
>>>>>> display
>>>>>>
>>>>>> imho this should be:
>>>>>>
>>>>>> [PATCH i-g-t, v3] tests/intel/xe_pm: Add tests for suspend 
>>>>>> without display
>>>>>>
>>>>>> More nits below.
>>>>> Hey Kamil,
>>>>>
>>>>> Sure this change I can make.
>>>>>
>>>>>>> Add tests to validate basic execution suspend/resume cycle
>>>>>>> without display module to rule out display related issues
>>>>>>> from the suspend/resume stack.
>>>>>>>
>>>>>>> v2: Add normal reload cycle after running test (Anshuman)
>>>>>>>
>>>>>>> v3: Rebase
>>>>>>>
>>>>>>> Signed-off-by: Sujaritha Sundaresan<sujaritha.sundaresan@intel.com>
>>>>>>> Reviewed-by: Anshuman Gupta<anshuman.gupta@intel.com>
>>>>>>> ---
>>>>>>>     tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>>>>     1 file changed, 34 insertions(+)
>>>>>>>
>>>>>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>>>>>>> index 8b115e2f6..03f742265 100644
>>>>>>> --- a/tests/intel/xe_pm.c
>>>>>>> +++ b/tests/intel/xe_pm.c
>>>>>>> @@ -17,6 +17,7 @@
>>>>>>>     #include "igt.h"
>>>>>>>     #include "lib/igt_device.h"
>>>>>>> +#include "lib/igt_kmod.h"
>>>>>>>     #include "lib/igt_pm.h"
>>>>>>>     #include "lib/igt_sysfs.h"
>>>>>>>     #include "lib/igt_syncobj.h"
>>>>>>> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>>>>>>>      * Description: suspend/autoresume on %arg[1] state and exec 
>>>>>>> after RPM
>>>>>>>      * Functionality: pm - %arg[1]
>>>>>>>      *
>>>>>>> + * SUBTEST: %s-without-display
>>>>>>> + * Description: suspend/autoresume on %arg[1] state without 
>>>>>>> display
>>>>>>> + * Functionality: pm - %arg[1]
>>>>>> I see you copy-pasted it but imho both Description and
>>>>>> Functionality documentation fields should be static, here and
>>>>>> in other places.
>>>>>> +cc Katarzyna Piecielska<katarzyna.piecielska@intel.com>
>>> Hi Kamil,
>>>
>>> Sorry I didn't get this change. This is inline with the rest of the 
>>> file
>>> right ?
>> Yes but this looks strange, so I added Katarzyna to discussion.
>>
>>>>>>> + *
>>>>>>>      * arg[1]:
>>>>>>>      *
>>>>>>>      * @s2idle:    s2idle
>>>>>>> @@ -681,6 +686,7 @@ igt_main
>>>>>>>         struct drm_xe_engine_class_instance *hwe;
>>>>>>>         device_t device;
>>>>>>>         uint32_t d3cold_allowed;
>>>>>>> +    const char *opts;
>>>>>>>         int sysfs_fd;
>>>>>>>         const struct s_state {
>>>>>>> @@ -757,6 +763,34 @@ igt_main
>>>>>>>                           NO_RPM, 0);
>>>>>>>             }
>>>>>>> +        igt_subtest_f("%s-without-display", s->name) {
>>>>>>> +
>>>>>>> +            if (!drmModeGetResources(device.fd_xe))
>>>>>>> +                return;
>>>>>> Why 'return' here?! Imho this should be checked in fixture
>>>>>> or be a skip. Or other way around - what about a headless board
>>>>>> or one without any connected display?
>>>>>>
>>>>>> Regards,
>>>>>> Kamil
>>>>> I think this patch idea sort stemmed from the cases where we have 
>>>>> a display
>>>>> connected and
>>>>>
>>>>> want to make sure that the suspend/resume issues are not being 
>>>>> caused by the
>>>>> display.
>>>>>
>>>>> But would you suggest expanding the test to have the headless/no 
>>>>> display
>>>>> situations? If so what changes are you suggesting for that ?
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Suja
>>>>>
>>>> I would suggest turn this into a igt_skip_on_f(), not a return.
>>>>
>>>> Regards,
>>>> Kamil
>>> Sure I will switch this to
>>>
>>> igt_skip_on(!drmModeGetResources(device.fd_xe))
>>>
>>> Thanks,
>>>
>>> Suja
>>>
>> On the second look - can we just ignore this and proceed with test?
>> It should do no harm when you have no display connected?
>>
>> Regards,
>> Kamil
>
>  So just go back to the original return right ?
>
> Yeah I guess that wouldn't cause any problems necessarily.
>
> Thanks,
>
> Suja

Hi Kamil,

Just a gentle ping on the above question.

Thanks,

Suja

>
>>
>>>>>>> +
>>>>>>> +            xe_for_each_engine(device.fd_xe, hwe) {
>>>>>>> +
>>>>>>> +                igt_debug("Reload w/o display\n");
>>>>>>> +
>>>>>>> +                igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>>>>>> +                igt_assert_eq(igt_xe_driver_unload(), 0);
>>>>>>> +
>>>>>>> +                igt_kmsg(KMSG_INFO "Re-loading Xe without 
>>>>>>> display\n");
>>>>>>> + igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
>>>>>>> +
>>>>>>> +                test_exec(device, hwe, 1, 2, s->state,
>>>>>>> +                      NO_RPM, 0);
>>>>>>> +
>>>>>>> +                igt_debug("Reload as normal\n");
>>>>>>> +
>>>>>>> +                igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>>>>>> +                igt_assert_eq(igt_xe_driver_unload(), 0);
>>>>>>> +
>>>>>>> +                igt_kmsg(KMSG_INFO "Re-loading Xe\n");
>>>>>>> + igt_assert_eq(igt_xe_driver_load(opts), 0);
>>>>>>> +            }
>>>>>>> +        }
>>>>>>> +
>>>>>>>             for (const struct vm_op *op = vm_op; op->name; op++) {
>>>>>>>                 igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
>>>>>>>                     xe_for_each_engine(device.fd_xe, hwe)
>>>>>>> -- 
>>>>>>> 2.34.1
>>>>>>>
