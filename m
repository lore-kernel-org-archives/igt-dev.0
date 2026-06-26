Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BACFCD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jun 2026 05:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05C810E2EB;
	Fri, 26 Jun 2026 05:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKxNMwJA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A6C10E2EB
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 05:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782453334; x=1813989334;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NeT4sMhIzT3FZtPoOvVuaXh+rfmoa0YzelfBYLwdRmY=;
 b=HKxNMwJAIMKmwjXvqk3v5NyUntVgXIQ7rxdY15WZ0o7SsLwRLY4SpDes
 IglbjdDebRA+5GYsZokZE3NWbKL56rXHI7FF4OBT2QDjaqJAEdlNzkDCF
 UD3pS8Gys2l52ItPggn12dv/J1NXX6IaP8e2tDzYiyeBkXTojfwQsPaXY
 hLKG5CMKdJYPp3qPyVUJ5HogsDlc+9nOCvfcUICtgfOpLA2nxA5H9uI8J
 EGHjgptNGXzj4jK24L3i7wrr+ah4MXv8BTyzzjFmb8bHrdbnBtiztwPd4
 TZRE0guk6ne7ThDY7WbKtTkJYL2x/OXj4eKSPt209nt0nj8aoJRh7kO4r w==;
X-CSE-ConnectionGUID: 9KzEv3lsSPW6KvDjnuhocw==
X-CSE-MsgGUID: H3byLKJ4Q+qZqgqQZpGThA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="106041953"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="106041953"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 22:55:34 -0700
X-CSE-ConnectionGUID: ZpIWHzi4RtKNgVmWcmtlOQ==
X-CSE-MsgGUID: B89x7aLkR1WGlze+6o9gZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="289344860"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 22:55:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 22:55:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 22:55:32 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 22:55:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgblIAdBUer0lbVC3M9u7xFmaDiTaA012hnrQsvv1Z2TqyPOx87ZgUZ68hTXyo4ZQqpK+fkVUSTUtyGcWFaT4QtQ2mnt9tiW4DA3NxZk7bQ20XdIHqVbxSO6nz+hBNRSruGkWnlIcuiZjsB4IG2j+wtzKU2K35UpI6gUsbHomF8E7/hutLnT+S0D5hO7yQVq2r2jLF8Cv1niOWC6iBla4KHdHO69MkcpQGOUfWXwjKy0F2zvAVet04VQLkJ0S+IjSi7C9NXeaqn5NmoUDUKFDchbtsK6/JC8X0RRklPszo9zty9Sr0Pqh/hTA50OaU3M+jCB0O/luAge8WsgJEwobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpflH089oEf+wP6Cz90yvLobmguFc5avd9oUxufSGcg=;
 b=d98VvCoLLlQylkOyC+Ai9SVhiCk4eQtoWaOJYeFYSkN/MpY9os8FUdQ5JfOb56pjYG5pOhIAFRqm0/FwDb7KPHTmwIm4ufUB4I1vk8Xs9ck3aHja4UEbr6KS3omHJNkpe61Tj91M5VchPpPUVH5x7mEJ/aXA0H0G/B/JP2HNhOa9XKIapjQKoH2ysZyPEfosh1WybMBAmep2Jw+a9RAgXG0noRQUFJiGk5hsyE+QqoOE76BrrSPgurleS+YUYzhk3x6ERywnXHjkJePtGuv1o53gZRFk5kuG/4+GWR44gtFSpo0Lmx3cbJye7wtTwJtZn3rHun78EEl2XTGOR5rzJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 05:55:27 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0159.012; Fri, 26 Jun 2026
 05:55:27 +0000
Date: Fri, 26 Jun 2026 05:55:16 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 01/25] tools: igt_stats: drop libigt.so, link
 against minimal sub-libraries
Message-ID: <hfame5oardxzd2z2viriu4jk5ukonnmgngv7rh3cwdzk7cbbay@xqfoqpnqcz2z>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
 <52667b0eb09ef029258fc33124a4faf74af21f90.1782288071.git.sebastian.brzezinka@intel.com>
 <h6ce4epe7nlp4h7o4ymgc3pacsmtqgb767cqz57j4uby6f2mdc@t2ntumzcf4pp>
 <DJI0BK153N4X.3PXQOSBXU39C9@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <DJI0BK153N4X.3PXQOSBXU39C9@intel.com>
X-ClientProxiedBy: TL2P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::12) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH0PR11MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4612bc-ec78-4c28-b90f-08ded34785af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 4R99TrGdsF2Q/mclVcSjxqCSklLSH3Jfym5lJnXnOFVWSLyLQvANcDEgkCWrdjejxfVH4p1Vuj6U9Llsu7q9ss88PouL1qEAfdRghM/pQfJvQsrcWumo+LpRKwU0DngnM/yyIJB+eAxFOxefMWP3c3GMnX9ZleRM/qsFuZbuPJpHTLfSQu35ICSdskqWeRJ6q5cw6KM1enX4PhndESu3Gc8shQCjrnfzYgeyUrlL+Ble3ExihvfSUGuytrh0GPGmQBqWs0D7bwbLrrhW2zMyyPsTTwLqRIPz5mq0EFYbdIdXtGizM9YGiNSZBZUrRN5L05Ppeca1g08spLw3EBCap+f3FrdVsqerFs18ZnkZCxd4QjzX2dbWmIfQbI6fLAJHyk+6Cp2cHedUWWgwFTfDdfEMvk4wudZYuJpEssVZJyko8xbcpi/5tboTauPOPGqyLZXWirF7+drUQBl5TkfgSyUHim3JMv17qF+Yncuo1Ju+i/tnyYZg8B8QJ6vC6A/QG8Eol3RjvcvuZ7SU9/WYdFzbE50gac/nMPx4sblWgSVKtNgqdKQ41sTPmd5JIUcMhliw4iujdn0VOzOauNB99DtkzUOZ3apSlWWMASn5KXC0mdcYYJvStwD9hekmjUaTCwBMiz78urHgoJsH9ELdS0+fQpcqM6G3l16o47Fjoyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDNKb3NwSmpQQjhZZERPQ25iMnFFZk96UVYycDZrWmxtT2dMaS9YaHFkOVgx?=
 =?utf-8?B?ZHhPZWpJb1hwZ0ZMMFByU0d2Slk2VWJZUERPMnI1QnhSOHN5cXU1NlpHakFE?=
 =?utf-8?B?dVd3MWdKWHNhR1VGSW1kZkV6VHJoTWVtWmVobUhBeTZub1NhNzl0Z1J3dDNk?=
 =?utf-8?B?WnhncDhWMGx0aG9OQVNUWDUrTmxqSlFvY1FodFZrWGxQTHZhUXFnd0NkTkVn?=
 =?utf-8?B?QlRBVGhlWjdPQ2o4MTFRMkRDeU5xNk5QOHNubitVTk00d3J6WGwySE40amlK?=
 =?utf-8?B?eWU3Q3YxM0YrRTFsMy9INDltV2g0bW91aGJnRyszck95bzR1MWx3bXcwQm84?=
 =?utf-8?B?QlBmY2x3QVRDb0RNMFlDUWp3UXVKU20rMndoWUNPS0wxVG9yTlc5bDQ1WEhZ?=
 =?utf-8?B?Ymg0Nmk2WXVHL055UE9EWGcvdW1nMElLclNVSFNVdm9aZHB4bnk2WFZSYjF0?=
 =?utf-8?B?aHRjYmtlajMvbGZMSmtPNThPKy94MGl0ZkFWZGVpYlNTaCtRVG5SV21OMGJj?=
 =?utf-8?B?d28rMmUza1ducGE4cXh6UHMrSzgxdithZjhqL1NXRGdwQTlSOC83SCtIQU53?=
 =?utf-8?B?VS9DcGgwaFdYaHF6d0MwWWl3bThjV2ZidmJkbjhnaFAxOU8zK1JXdVpETWRm?=
 =?utf-8?B?ajEwbUJJVVVzYndZanBRa2V2WW94QUlKRnNlRkhDdGNUZFNkZUdOZnBhd2Z3?=
 =?utf-8?B?b2tkamVwb1MvWnVkT3hmcUlDeUlyZ09WQURlNG9uQzJQNDhUa04rTGJMUDU3?=
 =?utf-8?B?N1JtdzBtZTZEeVRDeE5UVWFndDNWWEc3SVUrbnJzcEZsZjBNcEszdlJTbzVN?=
 =?utf-8?B?UDdvZEZ6MUdZMmt5MFBqeEYyNmlaU2NUQnFKV2dTVmZKU1d3ZU8xT3NDbmhy?=
 =?utf-8?B?NkhYN3JxbHd1R2JTZndzRGZRelhRMjEweXNiK3NZbjR0OEIwakI1Qkl2blU0?=
 =?utf-8?B?VGJjV1U2bUJYeFhMTENET0MzUVJxZVVpQ1RpTnp4MVozbnVKME9uSjZRMDRK?=
 =?utf-8?B?TnBXYnZXMGZJbE44aWNXR3E4TytDYVcxYW4xRUdTdU4yQUpOQTlOZG9zOUU4?=
 =?utf-8?B?KzhFVFU1eGF5MWMxM2NSbFRBU0pMZ1QybE41L2xncXNyOUVUL1pFbnRpUWhz?=
 =?utf-8?B?YTA0MFl5cXVUM3BGeVh5YjZ4TitOejVIUjFoOW1NL1Zrb2w4Tk5zUThWeklu?=
 =?utf-8?B?SjNUeGNHSVFVajVGVW5OZEppa1cxUkJhUW5XN1cxTzcybHBhQ3hOUUd0Ulcz?=
 =?utf-8?B?OE5XamZGSjQrcVpXU2IxeDczYWhwSFl3emhubE1kQklwQ1g1c2d6R2djaHRH?=
 =?utf-8?B?cXBLdStOVmp4WHord0lPd2xqYWFydGh0UWhVZ3l1Vm1hbnErZjNTSGhCTTVX?=
 =?utf-8?B?NnNNckNQK3FQSHQ0WUZndmJleDFjRXgwWHErU0YyZEhKTDkxMkZ4N2I1bzh6?=
 =?utf-8?B?dFpBVUdSY3pndDNrQXdIa0hsbjBWQnU5UmF2TkpOM2tKc2xUc3FwTVZpZUpa?=
 =?utf-8?B?TzBIOXA4RXVZU29pRGs1aGJFK2dVbDBCRU5BNU1oQXJpNm9pV3h5TDZlS2th?=
 =?utf-8?B?eFpoQVFhQmFvT0tiQnM2eWh2Z3NLYWU1U3pJWXF5K0FDZGlvK3ZwbzZmYWR1?=
 =?utf-8?B?MXh1RXdaUUVWNStZZWRNSldoYy8vWUdqYndYY09lTUV1YWdUM21SY3JOTjIr?=
 =?utf-8?B?THYyQzVsem5qcXplcnNoc0hmZ2ZWWWk3SThNZHVlVjU5c3ppNnNQUVJycGFK?=
 =?utf-8?B?c0l4blpwcERWdEtsMVAzZzF0SzBGSkRZbmdlRlE0RXFQM0VXMitzbmpJVEU2?=
 =?utf-8?B?dHRtM1N5WVkrczBKenc1MHUxOW5xMVloTVg0TFBvV1huUFdMVHJheHBDS0ts?=
 =?utf-8?B?QVRPOG44eGFoUk54cm9vRjFvM2VVUTYvOXljOWpQdVAzcUZUQ0RQdkFDSFNz?=
 =?utf-8?B?YWpuWGZiYmVsb0p0bXV5NGxNQmdQSnd4NXlOSE1kc0d0dGRIUGdkSWFla1d5?=
 =?utf-8?B?NjMzSXRCdmxIZTJnT0xrdm9CeVNIaTVaTlJ0bDFSOTV0c1EybUIvNkcvRTRa?=
 =?utf-8?B?RkJpdUF4c3JWUXVxRFlLTW42aHNETzJ4STVNME9aWUpyYk1JYTZaMlJtUm16?=
 =?utf-8?B?Smxlc0M5QUJyQ0Y5ZExDZFpVS2NxUTNNbGc4NkEraVRDY3FjTkxXQ2pCWXgy?=
 =?utf-8?B?SnpIc1l4a04raXVFbDhvL2hZeDFvQjdpUDc0ZzdhcUs5VHkwSGNnakN3K01w?=
 =?utf-8?B?ekN4ZGVoU0JLY1g0Y0lsTDBwL2FqQW8yZmJPOGFxV21MbUQ0TVFDa05DTkFQ?=
 =?utf-8?B?dlhndkRZNm5JTHpHTXB1RTNHMlBKK0tncGgzR0MvVW9iUjh4ZFVHK1k4c0N3?=
 =?utf-8?Q?SedveUvkXmcyJZBU=3D?=
X-Exchange-RoutingPolicyChecked: GKXUGwunUXhE2HbW/URe3ZUUKgdfXMeunNE0Z5/DgzjO7qwhEuSCxK94yBFt1t3gVXL9ex7ZZ89XjHaw9CBXVPWZxk0K9mzfFCn5PJAs6CJcmk5QjqoFhXGVY0LbG4rBQYfa94Su58p5pVqQDB7j4cZXeyUXrKMluDPG7iQsHL/XXhE+Td6ZbedisLr9iyQTIWkmkaOqiPRb/PJblRvYX7fsXTlY6Gt+AsBhO6DTllCaqWGSQkeZlcMxvcUWTCschS2C4KLB9uBc2m+60YgeCrdqaKbRnzt/i5zDtm5WGxpjzrb3OtV1u58OFaT+4/RschQLO/TuFqSIfvYJdTg2fw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4612bc-ec78-4c28-b90f-08ded34785af
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 05:55:27.3573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLo6XQ0WYz6/+IUP47WngK+CiNcPwlQsOBov+lKhSMfwIZk2JNxg8UoloblSQLlj+a92ZnBTqpuxq6HrczRFKn4EBlUcxTTm48iywSBFx2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

Hi Sebastian,

On 2026-06-25 at 11:02:25 +0200, Sebastian Brzezinka wrote:
> Hi Krzysztof,
> 
> On Thu Jun 25, 2026 at 8:11 AM CEST, Krzysztof Karas wrote:
> > Hi Sebastian,
> >
> > The patch works as advertised, but Ashutosh had some qualms
> > about the series, so I'll refrain from giving my r-bs for now.
> > I too have some suggestions down below.
> >
> > On 2026-06-24 at 10:47:08 +0200, Sebastian Brzezinka wrote:
> >> igt_stats only needs the statistics helpers and a small assert stub.
> >> Link it against lib_igt_stats and lib_igt_tools_stub instead of the
> >> full libigt.so stack.
> >> 
> >> ldd before: 35  (ldd | wc -l)
> >> ldd after:   4   (ldd | wc -l)
> >> 
> >> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> >> ---
> >>  lib/meson.build   | 14 ++++++++++++++
> >>  tools/meson.build |  6 +++++-
> >>  2 files changed, 19 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/lib/meson.build b/lib/meson.build
> >> index f25ecd8b2..96903d06f 100644
> >> --- a/lib/meson.build
> >> +++ b/lib/meson.build
> >> @@ -389,6 +389,20 @@ lib_igt_profiling_build = static_library('igt_profiling',
> >>  lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
> >>  				        include_directories : inc)
> >>  
> >> +lib_igt_tools_stub_build = static_library('igt_tools_stub',
> >> +	['igt_tools_stub.c'],
> >> +	include_directories : inc)
> >> +
> >> +lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
> >> +					include_directories : inc)
> >> +
> > I think this change deserves its own patch. Stub dependency is
> > used accross this series, so pleade do not obscure it here, as
> > a part of igt_stats dedicated change.
> >
> You may be right here.
> 
> > Another thing: I'd find reading this series easier if you
> > bunched together all the patches using stub dependency.
> The per-tool split is intentional for two reasons: each patch shows
> the ldd improvement for that specific tool, and if any tool turns out
> to have a backward compatibility issue it can be reverted individually
> without touching the rest of the series.
Very well then. I won't push for this anymore since the order is
deliberate.

-- 
Best Regards,
Krzysztof
