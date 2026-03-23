Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F54DD58CB1
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 06:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C3210E30D;
	Mon, 23 Mar 2026 06:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVkdroki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF1410E30D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 06:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774247940; x=1805783940;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aQwgirlHB4USXJFiqkdNtVcjUdAh9Glk0cC7M//4ZZs=;
 b=VVkdrokiwZoHHLbMdmj4H3uBgS0+SGNlN5n/o0Y63xTeB/76SXSElArh
 Y5LkZHyzrnBFK6X+0Hoq+a3Gj88tEaij0h7PMtqVBAO6SA7VB6nzB+KWC
 XQOA1Z70pKS3WZGnUTcy355PZycQpKIbFQjkyuT3M6/4Fk8NtWoNGF+vd
 ehp1lXkZMm6gX3o9k5TLhRsDOI7tMkQCOe6aQFf0Kx3+61RWXx9Pgxd5x
 b8CpymHhWaor5NINoUckou9DEmkhuf4afZI9Fni2TbbkdmxXR2FEPCqHz
 sgImoLjKsHxSrzQX5PGgwWL475wJLNqsBzjXwOFZTVSZogXan2x9dV2iL w==;
X-CSE-ConnectionGUID: ADINVqxUTBy/pkU/uDKEqw==
X-CSE-MsgGUID: O6+DCvjWT8GRnJ/13D/+DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86604786"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="86604786"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 23:39:00 -0700
X-CSE-ConnectionGUID: e98hdlGqTvqLrCNT9VAuYg==
X-CSE-MsgGUID: cwMg5AzBTkmww9Njho3mkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="228655771"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 23:39:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 23:38:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 23:38:58 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 23:38:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVt4HunNXRkMyF2XbRymKlg5KRSEp5rKd3hyrUjfic6tucm7PoX2vRxJhCtOzRkg/O41MsL8exul8zjXUQdxA2nFxfCuZgMo0cHIGDxhyy154EyTEF4+ePYMtY7h17RksSWNXUTzUtgp1b2Fceia6+R0LkKYcwI7yfLceS0uo89pHn/ddXKZ3C3NsF5bFBhevBHxYHzvRhtvKcZUufgcmygEF28kCXKlJtpsElXq1cgc0QYlVduuXumKcjHJSJs4PlZcAAZNqli1CSx0kx0B/IeRn5oLuRG2B8hH3a/1EwwayoWRmq9ZcexUc4rnP1Qw5zDLGPpAmRXeMPsc+BfbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tnr7EUfRzBAhQIo6mxsztMRLcDq8tSH3nUcyS0K/JE0=;
 b=b552kAPNH3BUOWJmvzSHGPAD+EgMcGsVexHKAylqUVqsGHiSr1RVjh2fawyW7ezyd9n0quJ8XADcAsLttktK/Hi3lfHvuL8OfDEeabU8/y5jSWvM49IrWzFuLPF717N0FrcHfsmtNgLCAg82zhUaSJmPjgQk130JjAd2/ectkWvAoevZ2cFMxxcMDWutqvDWxM/OWteAEBZ7Bo8+QEQh033IGcC6MYkPratufkpoh2vX1tSGcRhZ+3Pg4h4lztoGB+fsyTDCw9555yn9ae6SpiuqJmpMIdt5J5OTQaZzU96lKiIwXpG1Pd6neuBSMUBptXPl0f50Jgizss/OneAMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ2PR11MB8500.namprd11.prod.outlook.com (2603:10b6:a03:574::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 06:38:55 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 06:38:55 +0000
Date: Mon, 23 Mar 2026 06:38:43 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t 1/4] runner: Rename dirfd to avoid clash with dirfd()
Message-ID: <cngeg462idvuroma655yw2fqznnlpgpa6k6ujxrwsyh5msebhc@lwo35eibnhqy>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
 <20260319215124.2066611-7-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319215124.2066611-7-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: TLZP290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::6)
 To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ2PR11MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c249038-e706-41c7-b58f-08de88a6dad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: M+N+lCefOLehDKcSvyUJVSdxMyMI65I4CfM1PyxDh6Ik9NrAoTNu0cfev44ZlGeDGKSfeu5f49UlQg6bBplW0nUrTV236CVRCgr4l99J2GgYpiYbVh+Yv9n7cC5F+eUdqXUpdygMTsyP6P69yrTYiV8bNoxWe0C8MWEmfmO35bkh2V9vzGofOlBO2z+i8UPq+TwdNaoN2uTKDyLgJK3Wr/CdaLcbWGYhCVXAOYnvwvViBo6bDv+ygVvGMIFLKb2581YhJxwig0JAUbVF7+Cs6JIFp1cYMgTqf1YvYMgm1Q3oDG7VpcfRAD9gc8gKOyFe3hIspF/qQO3RnzIUTxSzHQDnXryh6o+yD4ww/lUc4NxKNDMCvA6HrA0xf5uqodJQlIPWhSxVAzgwXoeklBrQa+AG92QLMdWJ8QCAhCoUvTn1zyvNoRLhNxhEzOx6378YqwD0XyQhj7d9E4xivbpyJQmheyRPf4GcBjwpQ9gibfpLWOqOhbUfJqDcmJUXgdVfhYbHvxtWdTQMs9At/vtH75CN3BXbTSyMGB/xIYNlASkd9qG56ug/QS+vKiseP+f+Rv4TWVN+PoFRvyGIYK11dEWVcx3zc91zk4Y5aTbenR9PqSDH95+EwXbvRcitO0WbdCgVZqsI0vt90/3n9el8QlfECM+8yJlLyHNyIlbpgkAYTJQWkD6hO3zNLb8qkALABr9MXGs8VEvzMsuhRmIpOQ4WWrBqRFbdRfV98Djr/Ic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEs2U2doSjZBT1pjRi9nMGlDMmlhWjVtVnRiMlJrblpsTkRYS1gxSW1ha1k1?=
 =?utf-8?B?dkVuR2tJOTV0bEVMZlRWTXozRmFaTWwyc1c3VkZZVmlUakhJNi9LbTAweFZ0?=
 =?utf-8?B?UkZaNVVoM2VQU0dORUlMUW9sd1Rzcmlzclh0WlNteUNKTzJOejFibThLTTFu?=
 =?utf-8?B?bmVYUWZyenZtOUlzQkVJQkJJbVVkMFkxcXA4RlcwNUJwWDJHT3Z0MlppMGVV?=
 =?utf-8?B?SDNnYXo5OTl0MkVRcG4wMHlaelZOeGNWaUJiZWlERDRDdmxGTW53YUxYYUdT?=
 =?utf-8?B?WUFBaVZtUGE5bEU1U25lZ2txWGlzbUZUbnFSVkxNam9zZEhDczQ2Mm50UUd4?=
 =?utf-8?B?N3F2aG05L0d6WVhBbjVxUWREZnJXV25tWlZFTW01Q3k4cXZadXZSWHFlYjNR?=
 =?utf-8?B?bFFIQmdNZ2lYb0thYWQxUVp2UUUxRjArTTQ1RG1Jd2FUdXFFakVuZGFQc1FQ?=
 =?utf-8?B?VENOYWxxQ05XMTExNm9UK0Z2RVlHaDVyd0VKMVA0UU13OXhocXJwcE1DcjE0?=
 =?utf-8?B?VWs2TGtVK081SHNCMVdnbTVPU24xSmxZd2IwWFRpN2hHZGVWbFkxbXo2ZUYv?=
 =?utf-8?B?M2x1UXBlN1dzTWlQSjZWMnFlTmRYQVNkTno4aXdlRFFoaTFnclVNakthRW5m?=
 =?utf-8?B?TktWTE9jSmNKelc2Nzl3SU4yd3htZjZ5TlJNUndvQzJQVmM1N01IUlNEQTY2?=
 =?utf-8?B?dTlRaUpoRWNGYUI3MERVaUlHTEZIbG43YkY5d0R1Ylg0SE16eHk0b3RsSG9R?=
 =?utf-8?B?SGRlYkdjeDlNRW9yZ3hyRXlLQk1HU0NQWWZRcklmZHNhSnZEUXJqc3E3dHh2?=
 =?utf-8?B?SlZxRmplTElRNVZtaUV0dTMzbXBQaFp0cWNncXZBTFVMOFFib2NjZFovaTBF?=
 =?utf-8?B?bHVkS1Q5ZHdlelBZUWxCWFlwTWZmRitES3U5Qy9jekNONis0ME9xMGlLN3kr?=
 =?utf-8?B?RFpwYkZtZWZaMzFISFhzWkRjU1gvVnJJYjR5Zm1WWmVvM1Z0bE8xc3VKa09n?=
 =?utf-8?B?QWFZcmREaDB5L2ZUMVlVNVhNVlZTa1YrNTlZU2lvZ3F4VkZUUitkdndVSENR?=
 =?utf-8?B?eWFxUU9jVlJrajFwckptMUtEQVhVZi9sbm9tYlRKUmVjdWZyaDlQeWRKZmlW?=
 =?utf-8?B?aEt6a2pOZEszcGY1cTZzM2l5dXlWZ2ZBVEtsK3pVTGlVOHIzWFpDa0JZNitP?=
 =?utf-8?B?N3NkekFycEQ2M09vRDY0VmRFNFpCQzFqSnAzcGZ5SWdiMTVhY2tlL3FrejFQ?=
 =?utf-8?B?L3hGRjEzc285TVo1ZnJDOVlWczI5ZEM0a2o3alR2QjFHUDdqcTFWUUJHVWRY?=
 =?utf-8?B?OEhybVdVUGdRVlNiRHpFNlhHS011anRSVDlHM2o0R1k2dGNqM0JvQXJGV1RH?=
 =?utf-8?B?Qmd3aFhNWHhXbjVUeWtvRVFidThyNTZSa0JrTUJwNzFMSkpUekN6TjNTMWow?=
 =?utf-8?B?K2ZSL3RRRVFkSGg4SHZXL2UveFE3SXAxcVM1QUdjajdSdXNET09ueUxCb3cx?=
 =?utf-8?B?eVBFNDVBWndFemh6bnAxamZQc1FLY0FqWUgxVjBpNzNEV2NhMXdFd0p2Q2hn?=
 =?utf-8?B?Z3MrUDl5RDg5aXhGajI0V3BxWVkxcVlFRU16c0QzY3ZJMkkyK0xCY3hCNStB?=
 =?utf-8?B?QVZPa3N1M2tJaHd0TW1Sd0tSUDdaUVR0SUFkVm4rSk9iUFpTdDBmc2F2OWdH?=
 =?utf-8?B?SThSV2JYdkszaEdnVmtINFB5WWZ2MWxKOHdQWkovcHJUU2hxYjVDYW9hcXhI?=
 =?utf-8?B?VXNLWGI3YjB4YW1TQXluUkJ6Y3UzVGNaZFkrcisxa2thVmRwbmxwclJWUUsy?=
 =?utf-8?B?RC8zcTRvaG4xSFljQzgxTk8yelZkMGVaMFl4V1hEa2RERUdoWFoyMWgwemtQ?=
 =?utf-8?B?L1dOMzhDTkF5clJBbFNuOWFTN3lZTHRibjFob2hTTzlueFRzUjRVZDBmcFVQ?=
 =?utf-8?B?bkJDNkpPM1RoRmhDOEFtb0VvQkxOMlg5K2ozNEs5UzlFcWRqcDV6R1l4aVBq?=
 =?utf-8?B?M1lGSkNxUjltRUJGYW5hd04yTzM4aUR3dW95KzdhTXJhMndKaWxyYUdoUXEr?=
 =?utf-8?B?YnI1Uk9aNmNQUVYrNXhGZ1FkdWlWc2x3RGpSUnptTGkxNko4U0hhMnVmYUNt?=
 =?utf-8?B?SkN6TlN0aGtFOStHb09XVnMvemgxZ2FscDFkcXpXdDVjUTZQNVlsL1Z0cW9o?=
 =?utf-8?B?N21aN3RPdlVFVHZvRkE3QVVFOFlrbjVqNzFJa0N3UmZlTjhURExUNWxSay9I?=
 =?utf-8?B?Q3o2TXRlWTRHNkNGZ1RteGF3Qk1pd2pYc3M2d0loTnBqclMvZk5LSkpDSVVS?=
 =?utf-8?B?enVzSlphQzcrVGFzWE9rRDlDZVB0bmFaSnh6WkQvdzA5UU5LbXJiNkxpYlU4?=
 =?utf-8?Q?lWLxdt4MgX+g80hc=3D?=
X-Exchange-RoutingPolicyChecked: oNWoxhPQC+ajSHsaY0hH7l1btgCHWvLnTOOHgPEMA3VdfIZ7Fp034BMU91Is4AI5I/lz6bBkyLwWqqzhY8+BpaDvS7Rh3bFJ7VbMtxvysVj2O4wlNkOjzQFY0dFhQ1mPTDdX9/OJqxltMvwmYbxgMbPaT1YLXAxYhJ2ALrvyrvqgMQt2Dfwn+Wr1C7GLItaIqbnkw6XzM9gNBrsEpfOjdWtaVxyZju0msskjuwc/Jm+Pvx0kp25L20tqMK96FRhwCIOEYw7L6hmVWorB3oeiRuU+0EHI0AJAxnGBrFYE4I4b+3EDHZrDsJg59B8mNxSrc6xCXDrAqHfHMwFfyTuasw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c249038-e706-41c7-b58f-08de88a6dad3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 06:38:55.1825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LADUHWM+g4mC7G2JYHKeWIIZI+v6WozCPKQRBpIe/+/UXY1bbyne2RUIOCMyiT3uvwSPEjzEqyfDvCGBsJsVIALGKdvRCk78TePaByUhDPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8500
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

> Upcoming change within execute_next_entry() will call dirfd() so
> rename local dirfd variable is necessary.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
