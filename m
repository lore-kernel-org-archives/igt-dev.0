Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54E4C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 21:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF2D10E0A2;
	Wed, 29 Jul 2026 21:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hm7Y3VJI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529AB10E0A2
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 21:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785359366; x=1816895366;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=h6q4J6FbASfe1Jau7tl2AAZXUNiKfmhP7OUqB7/SVn0=;
 b=Hm7Y3VJIgmtshdRE7rnBfqTiuOcQOIl7vf4K8EstQI70g8FZ2UthZwiC
 VX2Iw4UJ2Ur2U0G5Bx39Z3uil7zWT3ujQ8lvx1KJx3sJFRB+fCD+SGiyh
 6WFUiNetf/kfbzK08THiKh1o3pBkxINNe8CN2LEpYqdhnmTbTHk3THNag
 KAYw35AB272qgPNPi6t0/Z74PouwvVlRLuLfmSpfAYwrXD8OL1OD/UmrH
 11RVryGr9b6HjZbY+3drdDlSZd/aZTgWYiiJHJuc7c+oh7tbDtpDo4M8x
 XH5x+P/6jIID44EW1rywTMuk6HtvxTzkpwlC7hVBu6fRx/ettlquM9jab Q==;
X-CSE-ConnectionGUID: Y/5OP0eAQzOjiFcFzyO/DQ==
X-CSE-MsgGUID: 4Tt1tPVcRGqxTJ7Z0cneRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84954341"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="84954341"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:09:26 -0700
X-CSE-ConnectionGUID: bM+cjCfpRL2HpyJm1werIQ==
X-CSE-MsgGUID: wkOoSSiGThOu1soYB5uTNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="260728755"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:09:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:09:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 14:09:25 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:09:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pwgp0iQX4Y7ioaR4juqtowunUW32ZaZDfEASEmuIVdE7mIL9z9bGWhAy6O5oEmO49lZiyBfEz6Fe3GFDYj6WajIQr0kWjjQHxeejO9zJ2EzCGf9P7wsa7cSmPESLHjVJxLnJXoRsiXJiVBYQY/FpgOThRyxjxl6TUfStaZAsYGDYv1VkD/EXCkdajVTsMUQ8vXECu5u4Vk+kUthYGxwX3k3imYkU5xBvSarlHEBSvvQrK0nq+1R8uyWUhJdcaiy6boLGTKaEkPD+LMxjvm//p3F1FdQq2KTOOhVef3923r1zob0R5N91fiyrFuet7z9NGwIrJ5/aJcjxa3p6ZnjsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vE1MqXLSoOEtnlkT8ke3Y/1Ic7W+5KTk12jeK7vJAOw=;
 b=sxoZz4vCx4QvM5+3J6Tu3Jp6xNlUv0EX++Mq9CFVydpnx+WAq9tbwAP3IqbXZ8NsUYx1Jg5VSWVnsdq+BYaTyrCBHZ+QIvy1vuJEd4ti+Us7rggbggiWtrmfKTg6HX4ki4+1Dky5nsctpB5tjsMrnO2kw4lGkcsMAKOlxBx0eWkSDZWGSWyrd7TjDVUqd/4cEPGwXUwFhunS5k9VFr5ahCnGeIZHDfPislbddApBFZHhdq6712N7Tb8x4i1jNU+iJbTfA8+VOmQ4b33WiV0jP921Qh+OoU/IpLxX5BRIOG9mZFcX4JY/5eF7KA299YdaZBNAfMVjzlWAYysab2w0Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 21:09:17 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:09:17 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 01/10] lib/xe: Move lib/intel_wa to lib/xe/xe_wa
In-Reply-To: <20260729210427.GA7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-1-0c147eeefefa@intel.com>
 <20260729210427.GA7790@mdroper-desk1.amr.corp.intel.com>
Date: Wed, 29 Jul 2026 18:09:13 -0300
Message-ID: <87se51zeo6.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: 831aede1-d6cf-4368-1daa-08deedb5a67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Q/z6o0xvZxfFiw4oOPE8IQXwaLEsZstHaD/7CBSd4jK5XQVcj8riihoti9NIj3X2/HzWwJWQnS0xPK4miBt8T94AkNOj7Cx7Qt0Si5QUS5JxepgvPxDQuYpms9CzOq6waBVeKO3Ws9fcCB/ZAQBK3XDz7IKKyh4vSpwTBZ903HG+M8MRwqFeXz7Gy2RPDN+G4W3zliROchqaO6OQ3TyDl93NmUUg29UwjRnDKK7iLxxYtizx5lA7MXxWKTxBJIQHcZS1c+7j73oImkttVXxF/E4r4GNLB7WXwJ8dhNhO9TSzPIIrgmUMcPJoz7h8TJLGjmb/tkYxMZQI45D3y+2FZG1jIpmAciqOu7dVczwcHuXZ9c7sMAFpCiWgf7u/Z0mwFprCldKidLhPYZgWD0pOcMylo7BygsBbt9etc7hzUDSP4i3dqAFu6ByCGsgyZQ8Csfa4kO5Ho4/o/ZFBS6bw5NSxTFH8e06nmX8YuVCnCq6m+7ri+tayt2gkwSfgKhMy+5egiVUFDyY+5anXUnQjdpEz41JY3Knzrk8a3yL/TXOhqt9pwVwXKYRr0DBdaytv0RNfo4Cpqnht38qM86+5tUPwADtNlGRK4Snf32Fohx0PZGEqqvWzwJfcQFMJswVIqQGc3v65YFMPz/DocnjrEroNw8urDntKzWuSaLMYRfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmJsOS9scjBSMTBGZ1l5QUkyTEZKSEZETm1DWXpyMTVhb1BTd04wV0c4YVpo?=
 =?utf-8?B?b3REcG0rUWRheFcrMXVTTWVOZWpiQ2tsVTJHVTR2MzZxWG1jcW5Hcm9ZS2kz?=
 =?utf-8?B?QXJTVUhLRDBZUEFZMkVvWi83WkIyK2ExOXFYNVhiMFNoUE1sbFBMbjdhSkxI?=
 =?utf-8?B?N3dkWlpEZ3U1YXFacXd6S0Focm0zQXZyM3BaY1BLdnU3MVdIK3JubldZekd6?=
 =?utf-8?B?K0NqM3dOeWJLc1doaXA5K0lGQWlWVk1abmxuUm1YVjU3Y2Y1Vy9oNUlSWlhv?=
 =?utf-8?B?MlIxVFMzb1poV0d6SVdaV3hkMnVXWnRMWnpYRVhvbnI5T0xXampwTC9ISEIw?=
 =?utf-8?B?SWtNMndud0lZMmk2VUhJTEFXa0xxTStqckVMbjNwNFRSaXZqa3dWU0trYmY0?=
 =?utf-8?B?ZkJiZVhVQzE3QUZscnNWeE1LdGgrN011djJCTGprdFpLeGQrVDYyUmlYc3pE?=
 =?utf-8?B?NFJZeno2dktsQi94N1pmL2NBeVVKa3VlUndpbHNEVjg5SWlEQmtKWTF5ZzlG?=
 =?utf-8?B?Qm82TzlCK3BqK1VDQWpPZlJueHM5RDNsdGR2M2s5VHlNMXU3U0RyNkFLaE55?=
 =?utf-8?B?Y3hXU0prb3M2MklEa3JLTm1YMXpMdHUyd2xUWTFROXhkRWhRcjZXWTdlT1hJ?=
 =?utf-8?B?amxZV1VKOXg1Wm1hb215QzhQK1RyZ3lxT2NuZzBIZTNENk5PTC9LWVFzSFhG?=
 =?utf-8?B?MVJsOXhqU2FmRnpMU01TckloeEUrU01UT0ZGek1wSHo3cFhIbTg0ay9Qenpq?=
 =?utf-8?B?YXRycHhHZlFGT01yZ2RSd2EzUktUZWtId2xoU3BxOUpDWlNhaFJBNkp6VTYz?=
 =?utf-8?B?ZW1uUFpLQlpEY2FsVUFrZmV5Rzc0WEFlTmxPOWtTQXlOTjZ5bWpsM0NNNWJy?=
 =?utf-8?B?YytlZ2VCdndNM01jTFdUTW9MTDI5WTBDOHg4dW9NeWZVNi9SSDM2TUZUdHoz?=
 =?utf-8?B?dGtKbjFpQnB6dnJJMjF4MG9YVEVjaXlUM1RPZ2xwSUZLcWhYeVRGeThWWEQ4?=
 =?utf-8?B?cmhmZVV4QmxWTUU0U2dVbzNBTFZ1TWFobEREbWZBZG5tRWlHeWloTXFWSW13?=
 =?utf-8?B?Si9NeDM3L05DSitRc3J0dDFVZm1mWXFvcldoRHdHMlBUcVNXU2d1b2lxY0hV?=
 =?utf-8?B?dUJIaElHc2tqMEN1TitnUklEWElYenZNcUtKN3BYMjAzSzkrcEhHVzdPZUk2?=
 =?utf-8?B?RWYzNDFIeEZnczZ1bmdiU2YwdEtIUHVBcU5QZ0lGVjVsbDE2WkNFRTc4bUl3?=
 =?utf-8?B?OVlhdi91WmxNWGFLNGZZSUJIUzF2a3JDMm1wUGUzSldkQWRLN1RreDR4Ym1Q?=
 =?utf-8?B?STRMcGxuU09LeTh6ZlZuV01wd21XVU55RkV0TDMxdnU1RkVaL1YzSnRzZTlS?=
 =?utf-8?B?eGFRc3UyWXpia2psVzhqcGhDemxLUGxNL1Q4UUJtOHVLTm5WdWllaHFkUTcv?=
 =?utf-8?B?SThXSkZhdExiRkRjelBaNGQ3SDU3TmhJalpNU0hmaURqVCtrOWpQc1ZFczNp?=
 =?utf-8?B?dmRwd1BkSkVmTE1PdHAzNGxYVXFjbWhWOEZ6SmgwUzFraWZhOFV2Um1MR2w0?=
 =?utf-8?B?ZGVWS2lGM25kVklteTk0azNtei9DbTBwajBWanZkVUZwdlIvdk9ONTJuOUFm?=
 =?utf-8?B?Mm1sQzlJc3JiUkZXYUduVHVxWHA3cEcxRll6L01FREJmSU5FVEc5SmFoQjkw?=
 =?utf-8?B?SlU4cUFsc2JjUG5IUFpQSEpiNVZ6d0t1OVVEQ2lVMGxEUmxjNWp6Sk1sY2Qw?=
 =?utf-8?B?SW5YVzRFdmtUM1lnR3Q0cU5HMkVTYUFyb2h3bzRNZ3lHRmxscStUV0dITzk2?=
 =?utf-8?B?Q0lsWitnUVZLVStxWE9GNXpKOFA3Yjh6cUJtbkNVaGZDZVg0MWU5UXhENmts?=
 =?utf-8?B?VzAvK3U3TFIrSkZBWlZwNjdKTCtNb0tzRmcxMXUweFg3U05XVTVSeGJqK2Zk?=
 =?utf-8?B?TUlteUw5clM4SFRqV1QyRWZESW5acEdnYmY1dWw2cVc0SURBdXZ2UEozeEts?=
 =?utf-8?B?QnB3Y0hBbk1ieGUrMllCMTNoUXY1d29mQVhPZWNMMWJEQzUvTTlDOEJKTXBn?=
 =?utf-8?B?VlU0NFJDODk4aGtPVUI4Y3RWaURWTjNJRTQyMEJsRDlXWFNNV3Z1WndYM085?=
 =?utf-8?B?OGpVenBQWUxhL1JmbGZzVlRDTGVyQ3BwdGtWWlZUTld4QVJ2eUh6MEZLWkJN?=
 =?utf-8?B?azlTNzhQd1ZHWE4xTk5teGlicW1BVkdIVFJIck4yMUZlVDluK1N1Z2UyWk92?=
 =?utf-8?B?NjR6blVWSXBhRy81U2YxcWd0UTRaMm9zdEt1RHlYSzlpbFhUQzE4c25vREJv?=
 =?utf-8?B?YkVpa0RsV3ZpU3pMRHB4bllFNFJ3SXEyT1pPNTFrT2RkMzN6QTJMdz09?=
X-Exchange-RoutingPolicyChecked: ltCJfTn7wy17zleSfPNgqn2zf4SVK2DD2MocjU9mE7W9nNj+7WgdEI8hFoJB0LfjBvCyvbF8f4hNKBylZv9hwtEdjJgEVxnL8V0aoS6H3o90Wg9JVYng+RBKd5c0SpFuxbQCyz+WCQ5wEzovRfe7Qq9FMD6GUHoPk7C+TIg6+usJ8xriGUe9VV/+AF980SrRePD2SilTmTjwxS70GcTQgamaMHNgOQalCYlNF//WPGM0SGNfBmKGFYjrXe0SIPCYChxBg139R9g0NjKonPuZDozUw/Ju9MRoJ7pcYJzDMPolDqONsTSiMpuqCY7qIDpKWTaE39Hx/0Gc22yjZ6JSTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 831aede1-d6cf-4368-1daa-08deedb5a67b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:09:17.4131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSt36cuHFKrc/7K6cdsGkIDrJPI7OYzvU1GykH/21mm9fhErdlvrleWcxvwIUz9pzeHjOYVEYg60rTULk0l/aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Tue, Jul 21, 2026 at 03:59:54PM -0300, Gustavo Sousa wrote:
>> The functionality provided by intel_wa is specific devices managed by
>> the xe driver, so move that module to belong to the lib/xe folder.
>>=20
>> While at it, change the function signature to match the adopted
>> standard for lib/xe (used xe_query.h as example).
>>=20
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  lib/intel_wa.h                 | 11 -----------
>>  lib/meson.build                |  2 +-
>>  lib/{intel_wa.c =3D> xe/xe_wa.c} | 21 +++++++++++----------
>>  lib/xe/xe_wa.h                 | 11 +++++++++++
>>  tests/intel/xe_oa.c            |  4 ++--
>>  5 files changed, 25 insertions(+), 24 deletions(-)
>>=20
>> diff --git a/lib/intel_wa.h b/lib/intel_wa.h
>> deleted file mode 100644
>> index 765a5948ef88..000000000000
>> --- a/lib/intel_wa.h
>> +++ /dev/null
>> @@ -1,11 +0,0 @@
>> -/* SPDX-License-Identifier: MIT */
>> -/*
>> - * Copyright =C2=A9 2025 Intel Corporation
>> - */
>> -
>> -#ifndef __INTEL_WA_H__
>> -#define __INTEL_WA_H__
>> -
>> -int igt_has_intel_wa(int drm_fd, const char *check_wa);
>> -
>> -#endif /* __INTEL_WA_H__ */
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 8db9fffdecec..b31936d6c3fd 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -93,7 +93,6 @@ lib_sources =3D [
>>  	'intel_aux_pgtable.c',
>>  	'intel_reg_map.c',
>>  	'intel_iosf.c',
>> -        'intel_wa.c',
>>  	'igt_kms.c',
>>  	'igt_fb.c',
>>  	'igt_core.c',
>> @@ -135,6 +134,7 @@ lib_sources =3D [
>>  	'xe/xe_sriov_debugfs.c',
>>  	'xe/xe_sriov_provisioning.c',
>>  	'xe/xe_util.c',
>> +	'xe/xe_wa.c',
>> =20
>>  	# Vendored libraries:
>>  	'vendor/uwildmat/uwildmat.c',
>> diff --git a/lib/intel_wa.c b/lib/xe/xe_wa.c
>> similarity index 66%
>> rename from lib/intel_wa.c
>> rename to lib/xe/xe_wa.c
>> index 727dd6c988df..ff5daf529831 100644
>> --- a/lib/intel_wa.c
>> +++ b/lib/xe/xe_wa.c
>> @@ -9,7 +9,8 @@
>> =20
>>  #include "igt_debugfs.h"
>>  #include "igt_sysfs.h"
>> -#include "intel_wa.h"
>> +
>> +#include "xe/xe_wa.h"
>>  #include "xe/xe_query.h"
>
> Nitpick:  These aren't sorted.

Thanks.

>
>> =20
>>  static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>> @@ -34,32 +35,32 @@ static int debugfs_file_has_wa(int drm_fd, int debug=
fs_fd,
>>  }
>> =20
>>  /**
>> - * igt_has_intel_wa:
>> - * @drm_fd:	A drm file descriptor
>> - * @check_wa:	Workaround to be checked
>> + * xe_wa: Check if a workaround is enabled for the device.
>> + * @fd: A drm file descriptor.
>> + * @wa: Name of the workaround to be checked.
>>   *
>> - * Returns:	0 if no WA, 1 if WA present, -1 on error
>> + * Returns 1 if enabled, 0 if disabled, -1 on error.
>>   */
>> -int igt_has_intel_wa(int drm_fd, const char *check_wa)
>> +int xe_wa(int fd, const char *wa)
>>  {
>>  	int ret =3D 0;
>>  	int debugfs_fd;
>>  	unsigned int xe;
>>  	char name[256];
>> =20
>> -	debugfs_fd =3D igt_debugfs_dir(drm_fd);
>> +	debugfs_fd =3D igt_debugfs_dir(fd);
>>  	if (debugfs_fd =3D=3D -1)
>>  		return -1;
>> =20
>> -	xe_for_each_gt(drm_fd, xe) {
>> +	xe_for_each_gt(fd, xe) {
>>  		sprintf(name, "gt%d/workarounds", xe);
>> -		ret =3D debugfs_file_has_wa(drm_fd, debugfs_fd, name, check_wa);
>> +		ret =3D debugfs_file_has_wa(fd, debugfs_fd, name, wa);
>>  		if (ret)
>>  			break;
>>  	}
>> =20
>>  	if (!ret)
>> -		ret =3D debugfs_file_has_wa(drm_fd, debugfs_fd, "workarounds", check_=
wa);
>> +		ret =3D debugfs_file_has_wa(fd, debugfs_fd, "workarounds", wa);
>> =20
>>  	close(debugfs_fd);
>>  	return ret;
>> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
>> new file mode 100644
>> index 000000000000..4ff897196545
>> --- /dev/null
>> +++ b/lib/xe/xe_wa.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright =C2=A9 2025 Intel Corporation
>
> Nitpick:  This should say 2026.

Even though we are essentially moving the content?

>
>
> Aside from those two minor things,
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks!

--
Gustavo Sousa

>
>
> Matt
>
>> + */
>> +
>> +#ifndef XE_WA_H
>> +#define XE_WA_H
>> +
>> +int xe_wa(int fd, const char *wa);
>> +
>> +#endif /* XE_WA_H */
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 68c7537d3888..fcf1d71a167f 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -24,10 +24,10 @@
>>  #include "igt_device.h"
>>  #include "igt_syncobj.h"
>>  #include "igt_sysfs.h"
>> -#include "intel_wa.h"
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_query.h"
>>  #include "xe/xe_oa.h"
>> +#include "xe/xe_wa.h"
>> =20
>>  /**
>>   * TEST: perf
>> @@ -2678,7 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *=
oau, size_t oa_buffer_size)
>>  	 * can result in buffer overflows.
>>  	 */
>>  	if (oau->oa_unit_type =3D=3D DRM_XE_OA_UNIT_TYPE_MERT &&
>> -		igt_has_intel_wa(drm_fd, "14026633728") > 0) {
>> +	    xe_wa(drm_fd, "14026633728") > 0) {
>>  		oa_exponent =3D max(oa_exponent, 8);
>>  		properties[9] =3D oa_exponent;
>>  	}
>>=20
>> --=20
>> 2.55.0
>>=20
>
> --=20
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
