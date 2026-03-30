Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0A51061B17
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 17:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3FC10E227;
	Mon, 30 Mar 2026 17:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKLpvSc2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E844A10E227
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 17:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774891187; x=1806427187;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=Gf9Yn2XOsAlO34WuW+vQzRCBVS1iYtSko6LTR3Q/eDI=;
 b=BKLpvSc2wbLsUK6iGIrS4CL1i40irdU4o38uJPd0W85UrS7X7mpKOMfs
 kyKAjGchUKWYQbj8quHIA0FmIqlv1JrKqsvsHmZQOLnj9ASt9lbny6Ahz
 ez8aFGgkbqiYpJSdC9VrTzNX3obAyj2KMZuaL5d9GFREfe8jU6tE2+a4e
 ddK8pyZ/5tS3oPA20A9jZhmRZQkQejeJlyWEl0deQgMHHymO66Yt2333L
 Nj8l4zy0AfnFdyeH3n1WGrl+AuWH3kY4PmvjrtFDX/L7w4yyLtrkDTXf+
 k3PgFoz26kMZUxnOA75mNbjOYtB/sRz+PnS6WEx3qok/mLVO9PWpmPaDc Q==;
X-CSE-ConnectionGUID: 8oXnnpxSTZuctQxEDsqzBw==
X-CSE-MsgGUID: i/g15BGATKeCP8NJRP0+0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86583503"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="86583503"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 10:19:46 -0700
X-CSE-ConnectionGUID: QhBxZcRxT2GS2z+VP4GnrA==
X-CSE-MsgGUID: MRrohKeHQVqfhMNsZGWb/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="230177665"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 10:19:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 10:19:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 10:19:46 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 10:19:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQlHp07+bFo0Lp3z72aESSefftgEG+gYse4OBKzeXfpVc7RerXv9pK8tiimSj+NUjoVeWYZGAGtZv1xAopXv/bxFcldoVlHO8vVWiwRRZzyZ7Kj/ACrzSlqwew3vu67C52ekNEHaYYj3Bx+los+2+q9sexrgoYMNwA+mmbRbir7wdc5gUWfU1SKdW4gj3v195ug4z1R4rwcF69QYJgJDeYePFZ+f6vuPJfhZ58jE68A0wqy3XUrlFg+94EpHXzziM8C97P3Kbb7d67BUqYHdXVyj1EOC2yPlCtn3sW4rWNF3Iwud+jKhQtaWCImfhbLk9VsZmBHJYflOGBpM+PV3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXSlTD2MUfKn6jTPpXUeHBwXctmnNtz1FHAFekxvrY0=;
 b=ZrzmBsxBVuUzqiBok6Mv38abHw25BeeyLAgn+qQ5U4C2+ejqO823GI9pnnqKSCx9/4JTGtDrnZGH/h6U5eOGO3J8PlQGnqvFosUoAebDC5J1uddeEd9Uph0IcqUW8c5vmpDJ87II2GkkdpFN/OxECDFDWye6zI58GfJ8wQHmb3etzL8IzYgTkXDLns2YmVpxY1P7MqxH7z2XV0Ow3l8+hnY9c7VnteZIKFDob7EXmzvSvaUyaHu1FSigo/hb/KIhbVC50xd5YC3XooRFWJoXI7Hygy9DM+6CprppVK4p2wYSeKR5OKIf8OWicwNQ933fiH/DE+rY7wQ9pl5FHr6prw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ2PR11MB8345.namprd11.prod.outlook.com (2603:10b6:a03:53c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Mon, 30 Mar
 2026 17:19:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.006; Mon, 30 Mar 2026
 17:19:38 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v2 6/6] runner: Add hook-exec-allowlist to execute
 hooks selectively
In-Reply-To: <20260324131235.712916-14-zbigniew.kempczynski@intel.com>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-14-zbigniew.kempczynski@intel.com>
Date: Mon, 30 Mar 2026 14:19:34 -0300
Message-ID: <87h5pxxmjd.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ2PR11MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf4bece-4aeb-485e-eaf2-08de8e8085cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 2qBhhrtkZKzWFRWL6HYpcHNt36UvbGb85RURFFUKTcsMwXWxIuKxmIIglN8NzTrPsT+2XCT+4JRP1jesw2djHwEjrJi0bgp1TLi3ql4Sus4Goasln+gGiethgC24OF9xxpvoHx4IdAZA2W5izyg5nW++SD/AJrl8yI3E/slZ+FukUs71fbmfsn6ozg1PdBb/xnlOXh/LrM6BwJbRj7ZimOCoTpNZLQIoVQ/A5xb/RAWi9dtV0dRY81StLDbQGVZF2dtps7QAprBBhvQ7bG97x7ic4gmrFYGDJroDwNMrCHsWYbObLWc6PkxaWY8/GMZ72KGQBzSUFiklC8jiueHIglrxNr5qL/Ilbu/ncISONKFGTRWYsPhQOp/qIivrtsMwcek2ALrAQddGw+83AOxyXG6/isHsOM5ufCcNIRTdYUyJ7BVesN7/LfcEJE3MTUQtdCyaTx6tTRG1BveVtjMj3rtOB+SagFU+qzLAnL1u4nSYoFkEJmvML4O78wXdOF+K0TAMw01B4+3HTJIZPrwpLaazGcXANR6GfTDQj6IwkVFe0EDsT7fdSzOsvR/XRPP0wh2kAhbghiFhVN/0okZonONIZqPTZvrFX5z8bq9ZreFWNGO32tgQ4wuZc2HfQUcrEILi2GtbtCjJ8xH/W7fpqSsFEMqyVAACWmRiLmGXE7lMM847CBw9pO3xmfHeHTPUS6GhNBv6GAPtUQZWOMbVfoJDl8ecVAdE5LcFMdZUhtk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVFyQ3BuUldSNmoxU2FVZWhndnFrc05XZzI5Y0thaW5oazlkVCtsK2xBM1Zr?=
 =?utf-8?B?OVI5cnkwanVWNG9sLzZ2S3prWGZPZzZBQ21oUmwyY1p5cEdCRkE3Q2o3bkc5?=
 =?utf-8?B?VHNOTER5bnE2TzY3YlFwVjJObnVmUmRLajRpZVplZ0NZS29sNGFPdjBMRitT?=
 =?utf-8?B?bmhVclplZlNKMGZZeVhTWUU2d0wwaDVwQTAxeGRpM0VpYmczR2diU05HSDA5?=
 =?utf-8?B?OVVBT2F1QjlmMEdMbTRwejE4Y0VSbERZN3c5VXd2bTBrK2EzUHI4djIvbnp3?=
 =?utf-8?B?SGJ2VXVjUnUrand3UUxoT1NEbkRRLzdhTURVTlBrT3VxY3I4Q2d2RHg0TjZS?=
 =?utf-8?B?ZEdpR2FkWkRyMnJ0SWhlRWZCalg2VTUvemsyb2tPeXFYZEt3Ri9CN3pOZUtr?=
 =?utf-8?B?RkxqN21VaGR0cUtCdWZseGZ2R1JaWkdrcksybmhGbEFMTWhwZHE5anNUb3Zj?=
 =?utf-8?B?ODQ3UHM3c0ZkUHY1djE5MXgzOHpDVTRuZzAxUnlNQjVrZjVtUjVrWU9icTk5?=
 =?utf-8?B?UHlSaEpSb3NIWVordHp2dnJsTExmcFRrRzFyd1h6MWN4cVF2MTA5cm1kR0Nh?=
 =?utf-8?B?aE1jajhMOU1rVTU2Y1dyUjBXbGphRGtFWXRpRGJUMGFWVlQ0SFJLbTlCYWI1?=
 =?utf-8?B?aUJkUEVNaHE3MW4wQjdxQmU3MlcwZzUxQ2k5ZlVUTkxxZ1J2Z1BhTVdja0lJ?=
 =?utf-8?B?OWJ5c2FmUUhqY1hUMWs5MURMQWJKTVZSenE0MjV3Z0piWUdYOUwzR0djVHoz?=
 =?utf-8?B?aVFjZHlKa1FFcVRNaWpHcWxrNU9JL1JpTlNYNldGcm52UjcyVCtqTUtxSEdh?=
 =?utf-8?B?eE43c1ZRSVdGemcveC9OS1o5ZG94SVJCUUZORElBTGNsdGt0YUluZUZBOGtW?=
 =?utf-8?B?QmZ0TVlUNzRnNUtiSXQwcmNqVXAwaU5SQStXNTIvblNxM3hBdDJFaEZJcVBz?=
 =?utf-8?B?aUxDN2xkbzVXeExsbkxoeWpMNFNmRmx0eWpQSjBwYkpCSUR3U0NsUHRsMzdM?=
 =?utf-8?B?R3A4RWp6RTJ3SnNCN3lTaVM0SUlENC9mUkZ4TENCSVhHeDc0bmhEUkZkUG9y?=
 =?utf-8?B?c0RRbDkwUGthdjdXVXRCblZUWUhDK1hocU9Yb3RCeDEvNGtyb2VoZkZMdE9S?=
 =?utf-8?B?N1BTbEVhYlNaR0swNU9OMEM2aWdIN2F2cHI2RlMzYUJvb001YUdISUVYcXlS?=
 =?utf-8?B?VjBBZ0daT0l6NFdsd2hXOVdORlZBZTV2bUhCOEhBdEwxc2xjNFdrUnNMUEh3?=
 =?utf-8?B?SStaVWRETEpBa0t0TDBZaE5CUE90aEhMQnV0K2RiQVRtUUs5eUJ2K0szQmd6?=
 =?utf-8?B?ZXEyYzhVY3c0K2tEUEdRNlYzRmJQSWM3NStEL3o2d2crRnJOaWQ3bmJQaWR5?=
 =?utf-8?B?R1dpUHlzM0cycS9EMENrclllamVucG1lMS9vdmVLa25pQlpFUTZZdkNhQnFz?=
 =?utf-8?B?aldHVk9wN1Nja1pXTXhrdTV1OWlpVm9HK2syWU0wNnQ1ck1mL0dRczdobmtu?=
 =?utf-8?B?NzN2TXIxSzluU3Ftc1NYN0JaNGEzOWs4Zm05Vk5zbzFtVFlrQnVDS21GUi9q?=
 =?utf-8?B?dnk5L3VxdEFVVWthL25xRHRSLzZtaC9JWVYvbDBmQmllQkhaOXBkV3Q1WGpL?=
 =?utf-8?B?aElUQjB2RkZFQ3o2aWVxV3I4TDcrenZ0emRzRWlkME9xVjdLK1ZFeDVKNlkz?=
 =?utf-8?B?MFQrUzgvK3JiVDJRQklpTU5KUk55WmFzbTVFY2w2NUwyRU9pcnh5Z1k1a1RT?=
 =?utf-8?B?REhLQ21FaHpwWDBCR25Wd2drcExzQVgyVTRDTDhWSllOMFl4WlA3ZkVwTTBL?=
 =?utf-8?B?TlAxWUtmNk5FM1V5c1dHMTFsRHJMSkZaa0ZkN2dGQVJjTU9jalpDU2JXdFEx?=
 =?utf-8?B?aEJ1bk5kMnhzR2gyYk4wK3BOQWNYamFoNU55YVpzTkNmZGZLL0ErMGtwZm4w?=
 =?utf-8?B?SGdITmxtU0pGK3dFeEtrUW4yMG5lSFFGOVVlbHB4bTdheTZIdkhla0ppVG9M?=
 =?utf-8?B?alYxVHMvWmZCRW1nZzkrZUR5clhSeGY0TUFIN0s2blhiaVQ1SndXN05VSGhq?=
 =?utf-8?B?cEpEMVpHekRPSUh0TXJFNUMveEpGTXIwaVkwUy9sek5aV2tXeGpIOElseFcx?=
 =?utf-8?B?TmhxeVJOM0I2bDBoL0QzN2RYUFg4WldjNjM0QXVNSUwwdG1sMEF3MVZzazAy?=
 =?utf-8?B?emx0SDM4OU9FV0VqUUFsalJYVGxHd2pYYngzaWVNOUlBMFpnNSt4d243aDA3?=
 =?utf-8?B?WnZ4THVzU3dFekJrZWJFdGUvbHUyV2l2R1RHeEdxTEdWd2ZVR05lYVU1VG9F?=
 =?utf-8?B?MENYWiszby96NzNsUWlaalVhZVBuUmNheUdiU20rSWErZ0t1S1k4Zz09?=
X-Exchange-RoutingPolicyChecked: vP7ZTM0CK0YTJYvb50vQneFg6B5v/UfD7za0YbON2vTquiAuqthXOGasyU6vDAjhHi3QJTJvBfxe5TjBML+lLbo4Xmk8J5BkPUNo2KpLW4bqJsvcwnaMCY0sWZyrBVlKXEzkrzd6CYI5EmyvrtaLDBtRdSZnp0WsvTDwkyzBqsVjdAVfyKbAZAWAnU++vEkKE7QqYlLyYjmE0QEJnzoNwFYW/oDJwQt7k27fCehJ/6wsI/gg47wXn68/oPdg1hIF0trqgHrNXiyCWD1CZkAQLVbd0keoMdcNFGNsXwJMdx69NmqC/on3lYmJCKs7V232pdM6Snap17Z0YOAssatjuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf4bece-4aeb-485e-eaf2-08de8e8085cf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 17:19:38.6898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Lh+3S9XQ07zJUMFTEss5XS4Y5qeqvpTy2ltWfVD2ev7842RmYEj6g5j4lwTSozck38VwCGlEb6rxWWKxTrKhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8345
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> Hook scripts like GuC log copy takes few seconds to complete. This would
> lead to large increase of CI execution time.  Add -a/--hook-exec-allowlis=
t
> argument to igt_runner to pass file with regexps which matched will
> allow executing hook scripts. Syntax of this file is same to blocklists.

I feel like this is more related to the GuC log hook than a general
allowlist that the user would like to apply to all types of hooks
enabled.

An alternative approach would be to have guc_copy_on_fail.sh
implementing this type of filtering, with a path that is passed via CLI
arguments or an environment variable.  I would prefer that instead of
adding --hook-exec-allowlist, as I'm not much confident it would be very
useful for other cases.

Since the hook is written in bash, the filtering could be applied with
something along the lines of grep -f path/to/allowlist... (It could be
implemented with bash builtins as well, but I'm not sure it is worth the
hassle).

--
Gustavo Sousa

>
> Some limitation of this code is hooks will be executed with subtest
> granularity - if multiple_mode is used regexp will compare only first
> subtest so all subtest in group will call hooks. This is likely not
> a big problem as CI executes each subtest individually (without
> multiple_mode).
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  runner/executor.c | 32 +++++++++++++++++++++++++++++---
>  runner/settings.c | 14 +++++++++++++-
>  runner/settings.h |  2 ++
>  3 files changed, 44 insertions(+), 4 deletions(-)
>
> diff --git a/runner/executor.c b/runner/executor.c
> index bc421f7dbb..ab34ed8258 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1615,6 +1615,18 @@ static int monitor_output(pid_t child,
>  	return killed;
>  }
> =20
> +static bool matches_any(const char *str, struct regex_list *list)
> +{
> +	size_t i;
> +
> +	for (i =3D 0; i < list->size; i++) {
> +		if (g_regex_match(list->regexes[i], str, 0, NULL))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static void __attribute__((noreturn))
>  execute_test_process(int outfd, int errfd, int socketfd,
>  		     struct settings *settings,
> @@ -1623,6 +1635,7 @@ execute_test_process(int outfd, int errfd, int sock=
etfd,
>  	struct igt_vec arg_vec;
>  	char *arg;
>  	size_t rootlen;
> +	bool use_hooks =3D true;
> =20
>  	dup2(outfd, STDOUT_FILENO);
>  	dup2(errfd, STDERR_FILENO);
> @@ -1646,11 +1659,24 @@ execute_test_process(int outfd, int errfd, int so=
cketfd,
>  		arg =3D strdup("--run-subtest");
>  		igt_vec_push(&arg_vec, &arg);
> =20
> -		if ((dynbegin =3D strchr(entry->subtests[0], '@')) !=3D NULL)
> +		if ((dynbegin =3D strchr(entry->subtests[0], '@')) !=3D NULL) {
>  			argsize =3D dynbegin - entry->subtests[0];
> -		else
> +		} else {
>  			argsize =3D strlen(entry->subtests[0]);
> =20
> +			if (settings->use_hook_allow_regexes) {
> +				char *piglit_name;
> +
> +				asprintf(&piglit_name, "igt@%s@%s",
> +					 entry->binary, entry->subtests[0]);
> +
> +				if (!matches_any(piglit_name, &settings->hook_allow_regexes))
> +					use_hooks =3D false;
> +
> +				free(piglit_name);
> +			}
> +		}
> +
>  		arg =3D malloc(argsize + 1);
>  		memcpy(arg, entry->subtests[0], argsize);
>  		arg[argsize] =3D '\0';
> @@ -1677,7 +1703,7 @@ execute_test_process(int outfd, int errfd, int sock=
etfd,
>  		}
>  	}
> =20
> -	for (size_t i =3D 0; i < igt_vec_length(&settings->hook_strs); i++) {
> +	for (size_t i =3D 0; use_hooks && i < igt_vec_length(&settings->hook_st=
rs); i++) {
>  		arg =3D strdup("--hook");
>  		igt_vec_push(&arg_vec, &arg);
>  		arg =3D strdup(*((char **)igt_vec_elem(&settings->hook_strs, i)));
> diff --git a/runner/settings.c b/runner/settings.c
> index 7c29f2d3ab..eb3d05405c 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -50,6 +50,7 @@ enum {
>  	OPT_TIMEOUT =3D 'c',
>  	OPT_WATCHDOG =3D 'g',
>  	OPT_BLACKLIST =3D 'b',
> +	OPT_HOOK_EXEC_ALLOWLIST =3D 'a',
>  	OPT_LIST_ALL =3D 'L',
>  };
> =20
> @@ -320,6 +321,9 @@ static const char *usage_str =3D
>  	"                        Forward HOOK_STR to the --hook option of each =
test.\n"
>  	"  --help-hook\n"
>  	"                        Show detailed usage information for --hook.\n"
> +	"  -a, --hook-exec-allowlist FILENAME\n"
> +	"                        Tests name regexes from FILENAME for which hoo=
ks scripts\n"
> +	"                        may be executed\n"
>  	"\n"
>  	"  [test_root]           Directory that contains the IGT tests. The env=
ironment\n"
>  	"                        variable IGT_TEST_ROOT will be used if set, ov=
erriding\n"
> @@ -715,6 +719,7 @@ bool parse_options(int argc, char **argv,
>  		{"dmesg-warn-level", required_argument, NULL, OPT_DMESG_WARN_LEVEL},
>  		{"prune-mode", required_argument, NULL, OPT_PRUNE_MODE},
>  		{"blacklist", required_argument, NULL, OPT_BLACKLIST},
> +		{"hook-exec-allowlist", required_argument, NULL, OPT_HOOK_EXEC_ALLOWLI=
ST},
>  		{"list-all", no_argument, NULL, OPT_LIST_ALL},
>  		{ 0, 0, 0, 0},
>  	};
> @@ -726,7 +731,7 @@ bool parse_options(int argc, char **argv,
>  	settings->dmesg_warn_level =3D -1;
>  	settings->prune_mode =3D -1;
> =20
> -	while ((c =3D getopt_long(argc, argv, "hn:dt:x:e:fk::sl:omb:L",
> +	while ((c =3D getopt_long(argc, argv, "hn:dt:x:e:fk::sl:omb:a:L",
>  				long_options, NULL)) !=3D -1) {
>  		switch (c) {
>  		case OPT_VERSION:
> @@ -852,6 +857,13 @@ bool parse_options(int argc, char **argv,
>  					"blacklist"))
>  				goto error;
>  			break;
> +		case OPT_HOOK_EXEC_ALLOWLIST:
> +			if (!parse_list(&settings->hook_allow_regexes,
> +					absolute_path(optarg),
> +					"hook-exec-allowlist"))
> +				goto error;
> +			settings->use_hook_allow_regexes =3D true;
> +			break;
>  		case OPT_LIST_ALL:
>  			settings->list_all =3D true;
>  			break;
> diff --git a/runner/settings.h b/runner/settings.h
> index 6c58c3282c..b81f6adc6d 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -59,6 +59,8 @@ struct settings {
>  	bool allow_non_root;
>  	struct regex_list include_regexes;
>  	struct regex_list exclude_regexes;
> +	struct regex_list hook_allow_regexes;
> +	bool use_hook_allow_regexes;
>  	struct igt_list_head env_vars;
>  	struct igt_vec hook_strs;
>  	bool facts;
> --=20
> 2.43.0
