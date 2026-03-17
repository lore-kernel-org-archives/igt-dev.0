Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEDDF3380C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 08:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EB210E55C;
	Tue, 17 Mar 2026 08:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="es8ykqmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624A610E55C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773735220; x=1805271220;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Gk01dWtS81mCZjwNvngI+Km9WNyTXMc7vIMYxGMvRwY=;
 b=es8ykqmZ4LvIZKtzTVqp6kM+xLV+w8UyryYfOXaTtmnuiqBBIGlIHnrj
 T2HqAL+2Xg2eKZ34Ch/s/iWkXPdvXb3rTHOUCYwiTHi8HTZqBqo8IY+l8
 fGF/4Elock7fv/YEPvNgmdIOsc2KF2ts96krXj3Uf1ZAilnTq9peDKRTY
 oxVGvS4xjxWjw5cWMSpJhM0IsFZwkXkAvW1YY3NDa8bNolU9cK4Y/bEaP
 cl+GGEbhadUy/4m3cBO7d6ZdPciZT6pvlnJ5lT9azvBhO7I6nyG8hPjx2
 hdnxL2VfrUxRClAy00pEOi0ig/vK4+DfrBYqxWPs+Qpw7pjyZvyxBoVW0 A==;
X-CSE-ConnectionGUID: v7rAS64oR0uVHXK6e2dHFw==
X-CSE-MsgGUID: jqR9XGglRuubCyJWCznumw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78364838"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78364838"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 01:13:39 -0700
X-CSE-ConnectionGUID: g0zzHdE6TtaOQpriMRzPUQ==
X-CSE-MsgGUID: 2GztRmvoRamzFGAtv6wcGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="224357181"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 01:13:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 01:13:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 01:13:36 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 01:13:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddAGS7E8fJWbsuTC8XWw6cn0AGu0+gXDZ1UI2rW2wdTTq0VWOjKSiUIDZ7swqmzWZIxKV5+srTKKJSt5FOkWIod2vI6pPj4Resf1gBHl4a6Ubf5qFzIbSm5m2F2UnnXV7TmL7L2fqFcfYM7g8Zn+x9cQsnh9xo2Lsse5Wualru0hXFmx8mvv2wWxtXajj7WjtrtnJw0IpbRyls7qPfWyWaBreE9MxQw73u0lcKLqY2cWzc/WASFVI7J5cl2Hu5kO5UzpR4RTbTzFK7RjsEy73L8ldHfo74WuckiwvwdO4aE+L+SnuHXLl5H8SkRXQcFyV9bC+XEf1Oxeesiu/31SUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Atuomy3zT1E/Jdi7XAdTr6xwtgPV0teNBo6mozyIiV4=;
 b=d+NJXZwZFiVankA4piRddstj1QH47zol8ylOP+25XauMLS0tgxAv2UiWEFAdyop9XGwaIp1MN7J2DCL1r77+uwzK2te9uu5rmRAOZLk5AKwfIJk/ELIEVO2rwadeKXXkBS7yK1oCudpj2GG6RiUMPFbwhdh+ysbC+qaurSKTyqnrNTxEg25Mjk6QiRWBN3eppVwpXXFs0T6GxeHqrkjplyDw4dooD2DPnQcQp/RTKOuokrLcWwWSHoa+pHdfN82aay8V8E9bDIn8YdsBDYQt/IDMhbg83ohwcrZeTeny7jyLeoK5lY6j0UYWGJ6Qyu9Bwda4ZQazzqx82L2+kykyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SA0PR11MB4606.namprd11.prod.outlook.com (2603:10b6:806:71::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 08:13:34 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 08:13:34 +0000
Message-ID: <d953d203-efa5-4435-9a29-c72a932bf306@intel.com>
Date: Tue, 17 Mar 2026 13:43:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
 validation test
Content-Language: en-GB
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20260122182219.9635-1-mohammed.thasleem@intel.com>
 <20260122182219.9635-3-mohammed.thasleem@intel.com>
 <DM4PR11MB631276FB17A19D483C20ACCD9047A@DM4PR11MB6312.namprd11.prod.outlook.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <DM4PR11MB631276FB17A19D483C20ACCD9047A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|SA0PR11MB4606:EE_
X-MS-Office365-Filtering-Correlation-Id: cb552b52-37dd-4312-fb1f-08de83fd1505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: +VK/r5OdgWX5cMd7s794sVfMgxIknfn39nYNxb6tAVtL+o5HONiT0BF9WKTcWwDZqAnAeMzLPy9qe/hO54dlDNsQ0MGPg5gIumswZx0cFGXIyMhcPSNymXhxYMAFcQ2grMFowm2vpdMn2aBOaK+qiIbKLSxi18sYY63jNpnzinTtBnhu/u4HoWlFnUAdcCjMnncYnB2yjHKrflZs1Wy13olICbLobdl6U1WBoSohznXYErUyz/PF/l2VntEPSrOzyFqdQo3yJeQU4FCW/h6k9cipbFkUQNt/jm9M8SULRogUvSmoIz77dvwEBvrWwWU0qFd4awBWT2qbKN0HZ2Bx90v/ZNmicpaJy3hxKNXQAs+yM6S5MUUjkG0vjsEVwznG6LMMI3yYZfnj4wS7wRelzcjrrm2XZMbTCyvvAQVQcaXkv5QEKZ6QsK58WNMZhQ03VT/SbA8r/r1Vzuvc4PoCoiyQ7M0wglTGCJOD+MgJVZJGflHpkX07+s0IzNtFM3guR3+e6Z9F4rjE2Yyz3eXF4iQ8L+XYzP7NspSL1blSguniMw5r89yvkuSWbL7kjBD764OZ1bBMGES4+l+NcgEKtYzfkhbVudZZOGgmpQEFtUCX8wD7nRCSUUonYslk5JVtzV7tnsmIfU45zRBXu8hayxG2TqmQaGeiVWyYnS0WIajmaau/mX6uKvaKcXS3ePfqiHj0d0CTnh5Dip9MP+CW7H5Ttpm9TTD8SUe4QC4jxh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXZlc29RSlhBcTVOZC9yMTdDRjVlRFlrWXNYbEFpRFFvRlNGZ3FnRklMREw0?=
 =?utf-8?B?cW9mMlEzb2UrdHl6ZEszRkRqbDFZaGJGWFBaWDE3K0xPbEhQeDhjSUljcmdG?=
 =?utf-8?B?Q21UUndZbFNNRkdHd3NNSFBabHVqNVdwMVV5cTN0RmZyQkF3QjcwT2Q2d0l5?=
 =?utf-8?B?K3hrNHNTRFhYbEpldGVXOGRuS0xLa21LVHQwS2o4UDRwcEZFSXBYRVhFSDhu?=
 =?utf-8?B?ZG9NMExhRlhMeHJnM25DNG5ScElmdjhZWUZ1RU5wc2JVR213cWszaVFqd09L?=
 =?utf-8?B?TG91T2xzTWxXVmIyT0Vtc29WN1ZUQ0FNQUMvUXpHdkk3ZEdIUEhsNVhJUHov?=
 =?utf-8?B?T2lNalozK2hzV2ZUdUhRR0MzVFZnUXNTSSsyV1dxemJpd2wzYVlCZDQ5eGdC?=
 =?utf-8?B?czkwWmJobWdWcHF3eEgrRGJsbktTb0xkNVpkVGZTbXFmbEtudzZQM25tdEhZ?=
 =?utf-8?B?cElJeVFBd0NHc3pUbnZjOEYzRDhwcUZTZzUzT29BZHhMc1hCS1FuTWEzUmh4?=
 =?utf-8?B?VzdnekVjcXFmSDJhZkcvTHE3c2hvUXBRV2RPU3ZZQjBZcUhtYlNFeHVpNWZj?=
 =?utf-8?B?eE9GVXNENVVQeGx5cm5oK2w3bjBLSlpTNEhRQ0QzWUJoQitKc3VGa1g4d3pW?=
 =?utf-8?B?cnFLcHoyZlRVVjQ3azRNTm9RWjBVYU1zcjc1NTk4U2NneEgwbWowbWJQK1RE?=
 =?utf-8?B?V2xkbVJWeWcwRytKeXA3K3lGclFIN2VMVlN4bXN2YnBoZmE3L3dUODNkeGNL?=
 =?utf-8?B?TWQ3NlFRRTRQVTNuQ0IwSjdubE1xSTZGbkdldlEyb2tBZXJDMFhxWlBkUGFZ?=
 =?utf-8?B?TWFlTmVGSDZxM1V6SG5WWFJDd3ZGU3R0K2FjTktQcU5UNXVWY0phQ292WTlE?=
 =?utf-8?B?Vzh5ZUc5ZnFaL1ZYVUE1eE9KVEErU1Y1Tzhzc3R5cFJlZnY1bmVtNXd2Yjd1?=
 =?utf-8?B?NS84aGljYnpGbEVTVTVVbFRCU1VDRE1GaEJjSU1nQWlhcFhVYU1vbmp1VFlY?=
 =?utf-8?B?YjlYc2tJK1l6bUp1eXJGdjhTdkt5U3F5a1RmWGE1RUovbXdVcUlNcFNsUC9G?=
 =?utf-8?B?TWtRcnR4VHZIVUcvekl3OXhJVmNqN0QyVkIrMnRPZlVxL3BESDFpTHhmeHdK?=
 =?utf-8?B?eU1EWTVyaTN5anhDS00vdXNMNVlMSEEzTk5LalpCTVBKYkp0QnFLaGpJSmts?=
 =?utf-8?B?amN2aEtkQjBRVG5pRmE3SDM4eFJrUHFjUERlaWVhbmJmMjZWQ3ZvUFpLUWxy?=
 =?utf-8?B?SkhtTUFkbE9HaFNiVDFUSjZTUkYvTUsvQ0JZRk02TUhieHFocEdSYVgvV1JX?=
 =?utf-8?B?U245cTFSdHp1MmNldmRYb091KzlJaGd0RldSRk50UnBXcVFuV2lnaDBUbS83?=
 =?utf-8?B?ZDgzdnJENTdnOE5GMWY2aG9nRzJ2VlJYUlVTa2toTXBVV2hwT0d4T1VlMlJW?=
 =?utf-8?B?bndKMGdGTThHTklidFZxQXFGNk1oTndzUkZQNEJqTk9JU0tTcURyV2Uzbmhy?=
 =?utf-8?B?YzBiY1VoMmhJQkZvUHFBMEJBT01jdnhpVng0NHBqTURtbDJGVVdRSWJvVTZj?=
 =?utf-8?B?eEJJOERVOWw0MjVCSU1xV0ZVbVhrVjJQNGFFVktKV1NkbUlUNDRwTlNScEds?=
 =?utf-8?B?SzlPbEtsbS9NbW1oWnVxRGE2bnFncFc4SWUxWll4N0FxN3hFaDJrSEdxbkc2?=
 =?utf-8?B?b0F5WU05WFV2VzViSmMzWlpRRUR1K0dXUXF6d2w1bkYyODM0MXhXNDRudDZk?=
 =?utf-8?B?K1gwZDZ5YW9PSDJBaTN0RWJXWEx4a3lhdlBxQktnUG5SYyt5dWhFbE5ZUlNS?=
 =?utf-8?B?UENXcEpNdGJQV2ltS2Jkd2g5WHMyNGZqSDFxWDlOQmhJUzRBeDBtanI4a0FO?=
 =?utf-8?B?alFyTFd1Y2JYdGxQNDZYWS9aREdQN2FmN1h5ZFpIalFoSDVkeTFYblNPTkYw?=
 =?utf-8?B?UUJIcm1aOXFNYmJqREt4andiMk52dDI2d2p2cDh3VmNjNmpxYmNkMThUd1Vw?=
 =?utf-8?B?VmJvYVp4cC9qbHhKZnNVNThNY3Z0dmMyQ2QrdTVDamNGS3R1aHhMRDVtV2Vr?=
 =?utf-8?B?Q28wSzJSR2ZoMGwvZ040TEhkUlZubVJuUlRXYjY0LytSWGkxK3JOOWpFUDlv?=
 =?utf-8?B?Nno3aXQwUmorNExobTJRNkh2RjFjZUVmVTFnVWcvSTU3VjFyUFJhNzdNVDc2?=
 =?utf-8?B?TTJuY1NOQloxaGlMeEE4RmQ5eXNnUXMwWjBxZitmV3Z6Q2F4cy9iZC82c29F?=
 =?utf-8?B?RUdVN1hUcnFKM0F5T0Z2UGhFZFJyQVRqcFJoS2JITWgwNFFhN2thU0d2RWNh?=
 =?utf-8?B?MUFYaHRuZm5zakIvZWVFYVZBU09sbDg4aTJaNHBYdC9JRjBSQVREUnhDZ1dG?=
 =?utf-8?Q?AYe0UabCKf+nUwtE=3D?=
X-Exchange-RoutingPolicyChecked: rJm/SVQST6fSMxVnGHP2pJJWEFLXyDQB+WuBQxMkwDOFtBYOaaAm3a6UHekDzr3gk5eE93B/OPreb5ioqAoGUpxqpyWBWyziGyxX9ReN7X2WJsiI4Mi3HQDoDBJQXJc5iQAfN0BMh7akd8UQGsXaoOlU4LryvgLYY9I2JhLkNhuKTgQNrVZdh9HRbFrMXKb95abSmKksX27LIjA9wIFaNvAmmgz8HhUW0BRWQlU8AlOtWlVjJEOrPj0i296wdQln5uRUYo/HDWTz1EsNAJxjES/FlkKQlz10iDI+E55/I9/28XFskDSlKwIuRzvFm+vO7C0PkTDsMs2nnw/GSvnyEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb552b52-37dd-4312-fb1f-08de83fd1505
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 08:13:33.9521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YaexD7z0LNUqig0jAxx/aXns02F6qSSEJMVstLka4Lpvkf4VzKQNe6nN49nmB+EJ/2Uy33C4UCDhCesQb1F1AQMTIXKpx/RS902RPLcJhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4606
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

Hi Jeevan,

On 11-03-2026 03:47 pm, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohammed
>> Thasleem
>> Sent: Thursday, January 22, 2026 11:52 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
>> Subject: [PATCH v2 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
>> validation test
>>
>> This test validates display engine entry to DC5 state while PSR is active, performs
>> suspend/resume cycle, and verifies DC5 entry is restored after resume.
>>
>> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>> ---
>>   tests/intel/kms_pm_dc.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
>> fde16ebf7..8cdbfad9f 100644
>> --- a/tests/intel/kms_pm_dc.c
>> +++ b/tests/intel/kms_pm_dc.c
>> @@ -80,6 +80,10 @@
>>    *
>>    * SUBTEST: dc5-dpms-suspend-resume
>>    * Description: This test validate DC5 state entry before and after
>> suspend/resume cycle using DPMS
>> + *
>> + * SUBTEST: dc5-psr-suspend-resume
>> + * Description: This test validates display engine entry to DC5 state while PSR is
>> active
>> + *               before and after respend/resume cycle
>>    */
>>
>>   /* DC State Flags */
>> @@ -732,6 +736,13 @@ static void test_dc5_dpms_suspend_resume(data_t
>> *data, int dc_flag)
>>
>>   }
>>
>> +static void test_dc5_psr_suspend_resume(data_t *data, int dc_flag) {
>> +	test_dc_state_psr(data, dc_flag);
>> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> SUSPEND_TEST_NONE);
>> +	test_dc_state_psr(data, dc_flag);
>> +}
>> +
>>   static void kms_poll_state_restore(int sig)  {
>>   	int sysfs_fd;
>> @@ -857,6 +868,16 @@ int igt_main()
>>   	igt_subtest("dc5-dpms-suspend-resume")
>>   		test_dc5_dpms_suspend_resume(&data, CHECK_DC5);
>>
>> +	igt_describe("This test validates display engine entry to DC5 state "
>> +		     "while PSR is active before and after suspend/resume cycle");
>> +	igt_subtest("dc5-psr-suspend-resume") {
>> +		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
>> +					     PSR_MODE_1, NULL));
>> +		data.op_psr_mode = PSR_MODE_1;
>> +		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode,
>> NULL);
>> +		test_dc5_psr_suspend_resume(&data, CHECK_DC5);
>> +	}
>> +
> This test currently validates the DC counter by comparing the value before PSR entry and after waiting for PSR to enter.
> If we want to include suspend/resume validation as part of this test, shouldn't the flow be:
>
> 1. Read the DC counter.
> 2. Perform suspend/resume.
> 3. Wait for PSR entry again.
> 4. Read the DC counter after resume.
> 5. Validate the counter using `check_dc_counter()`.
>
> This would ensure that the DC state entry is also validated after the suspend/resume cycle.
> Same goes for patch 1 also.
Thanks for the review. After analyzing the implementation, the suggested 
approach has technical issues:
1. DC5 counter is a hardware register, Counter is read via 
intel_de_read(display, dc5_reg),
     which is a direct hardware register read, not a software counter in 
driver memory.
2. Hardware register resets to 0 after S3 on older platforms, On older 
platforms (display ver < 14),
     dc5_reg lives in the display power domain which is completely cut 
during S3, causing the
     register to reset to 0 on resume.
3. Suggested approach causes FALSE FAILURE on older platforms, 
baseline=11 captured before
     suspend becomes invalid after register resets to 0. After resume 
DC5 fires once
     giving counter=1, assert(1 > 11) FAILS even though DC5 works.
4. Newer platforms (>= ver 14) behave differently,  DC6 "allowed" count 
is a software counter
     in driver RAM (dmc->dc6_allowed.count), preserved across S3. 
Counter behavior differs between
     platforms making a single baseline across suspend boundary unreliable.
5. Current patch correctly handles both platforms, test_dc_state_psr() 
reads its own fresh
     baseline at call time. Calling it twice before and after suspend 
correctly handles register
     reset (older) and preserved counter (newer), while also isolating 
pre-existing failures from S3 regressions.
6. Runtime PM state also breaks with suggested approach: On BXT/GLK/ICL+ 
splitting
     setup_dc_dpms() and cleanup_dc_dpms() across suspend boundary 
leaves runtime PM in unknown state.
     Current patch keeps setup/cleanup always balanced.
> Thanks
> Jeevan B
>>   	igt_fixture() {
>>   		free(data.debugfs_dump);
>>   		close(data.debugfs_fd);
>> --
>> 2.25.1
